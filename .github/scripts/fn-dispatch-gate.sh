#!/usr/bin/env bash
# fn-dispatch-gate.sh — FN 唤醒机械门控 (fn-responder v2 唤醒面: 零 token 稳态)
#
# 职责: sweep FN 事件的「新样本差集」判定 — 仅当出现**未被在途响应覆盖的新 FN
#   样本**时, 发 repository_dispatch(fn-responder-wake) 唤醒下游 agent (agent
#   收事件即耗 LLM token)。稳态 (同一 FN 在规则合入前每拍 sweep 重复红) = 差集
#   空 = 零发送 = 下游零消耗; sweep 红门禁本身不受影响 (诚实不变)。
#
# 差集语义: new = 本拍 fn-evidence 样本集 − prev − claims
#   prev   = reports 分支上一拍 fn-evidence.json (raw URL; 调用方保证本步先于
#            发布步执行 — publish 孤儿强推会覆盖快照, 顺序不变量在 sweep.yml);
#   claims = 在途声明: head 分支 agent/fn-* 的 PR body 中 `dedup-sample: <路径>`
#            行 (容忍 bullet/quote 前缀)。open 全收 (draft 亦在途); closed 须
#            merged (非合并关闭 = 响应已死, 声明失效) 且 merged_at 在 12h 冷却
#            窗内 — 防「合了未愈」窗口内重复唤醒; 超 12h 仍失败 = 升级信号,
#            声明过期允许重唤醒。
#   任一集合取数失败 → 视空集 (保守方向: 宁可多唤醒不可静默漏, 差集只增不减)。
#   已知盲区: 证据本体 listed 上限 50 (引擎 fn detail 上限), >50 FN 时尾部样本
#   对差集不可见 — 双方同截断口径, 大面积退化由 fn_total 徽章与人工分诊兜底。
#
# 冻结契约 (下游已对接, 勿改): POST /repos/<slug>/dispatches
#   {"event_type": "fn-responder-wake",
#    "client_payload": {"run_id": <int>, "samples": ["<样本路径>", ...]}}
#   下游链 = fn-wake.yml 监听 workflow (run = agent-service github_dispatch
#   触发器的边沿; client_payload 原文落 fn-wake 分支 fn-wake.json 数据面)。
#
# 用法: fn-dispatch-gate.sh <fn-evidence.json>
# 环境: REPO_SLUG / GITHUB_TOKEN (PR 列表 + dispatch) / RUN_ID (client_payload)
# 退出码: 0 = 完成 (含稳态零发送) / 1 = dispatch 发送失败 (漏唤醒不可静默 — 步红
#   可见; run 本因 FN 已红, 不劫持哨兵语义; 后续发布/artifact 步均 always 前置,
#   不被本步阻断)
set -uo pipefail

fne=$1
slug=${REPO_SLUG:?REPO_SLUG 必填}
run_id=${RUN_ID:?RUN_ID 必填}
: "${GITHUB_TOKEN:?GITHUB_TOKEN 必填}"
[[ "$run_id" =~ ^[0-9]+$ ]] || { echo "fn-dispatch-gate: RUN_ID 非整数: $run_id" >&2; exit 1; }
cooldown=$((12 * 3600)) # merged claim 冷却窗口 (秒)

# 换行分隔样本路径 → unique 数组 (jq 统一集合运算, 字符串安全无分词歧义)
lines_to_json() { jq -Rsc 'split("\n")[:-1] | map(select(length > 0)) | unique'; }

# 本拍样本集 (evidence[].sample 原样)。解析失败理论不可达 (同 run 内 fn-evidence.sh
# 刚产出), 仍保守兜底: 无法差集 → 强制唤醒, samples 空 (agent 经 run_id 自行取证)
if cur=$(jq -r '.evidence[].sample' "$fne" 2>/dev/null); then
  cur_j=$(lines_to_json <<<"$cur") # 合法空集 = 无样本, 走稳态不唤醒
else
  echo "::warning::fn-evidence 样本提取失败 — 无法差集, 保守唤醒 (samples 空, agent 经 run_id 自行取证)"
  skip_diff=1 # 差集不可算 → 强制唤醒 (宁可多唤醒不可静默漏)
fi

# prev: reports 分支上一拍快照。404 (上拍绿无文件) / 网络失败 → 空集, 均保守。
#   本仓公开, raw 匿名可达; CDN 缓存 ~5min « sweep 间隔 6h, 无陈旧风险。
prev=$(curl -fsSL --max-time 30 \
  "https://raw.githubusercontent.com/${slug}/reports/fn-evidence.json" \
  2>/dev/null | jq -r '.evidence[].sample' 2>/dev/null) || prev=""
prev_j=$(lines_to_json <<<"$prev")

# claims: 在途声明 (gh api 失败 → 空集, 保守)。per_page=100 + sort=updated:
#   本仓低流量, 单页覆盖近期全量; 声明行匹配从严 (仅行首 bullet/quote 前缀) —
#   漏识别 claim 只是多发一次 dispatch (可接受方向), 误识别 claim 会漏唤醒 (禁止方向)。
if prs=$(gh api "repos/${slug}/pulls?state=all&sort=updated&direction=desc&per_page=100" 2>/dev/null); then
  claims_j=$(jq -r --argjson cd "$cooldown" '
    [.[] | select((.head.ref // "") | startswith("agent/fn-"))
        | select(.state == "open"
                 or (.merged_at != null
                     and ((now - (.merged_at | fromdateiso8601)) < $cd)))
        | (.body // "")]
    | map(gsub("\\r"; "") | split("\n")[]
          | select(test("^([[:space:]]|[>*-])*dedup-sample:[[:space:]]*\\S"))
          | sub("^([[:space:]]|[>*-])*dedup-sample:[[:space:]]*"; "")
          | sub("[[:space:]]+$"; ""))
    | unique' <<<"$prs")
else
  echo "::warning::PR 在途声明查询失败 — claims 视空集 (保守: 可能多发一次 dispatch)"
  claims_j='[]'
fi

# 唤醒判定 + 差集: parse 失败 → 强制唤醒 (samples 空, 差集跳过); 正常路径 →
#   差集空 = 稳态零发送 (唤醒与否与 samples 载荷分离, 防保守路径被差集空吞掉)
if [ "${skip_diff:-0}" = "1" ]; then
  new_j='[]'
else
  new_j=$(jq -n --argjson c "$cur_j" --argjson p "$prev_j" --argjson l "$claims_j" \
    '$c - ($p + $l)')
  n=$(jq 'length' <<<"$new_j")
  if [ "$n" -eq 0 ]; then
    echo "fn-dispatch-gate: 稳态 — FN 样本全部被既有快照 (prev=$(jq 'length' <<<"$prev_j")) 或在途声明 (claims=$(jq 'length' <<<"$claims_j")) 覆盖, 零发送"
    exit 0
  fi
  echo "fn-dispatch-gate: 新 FN 样本 $n 个 (prev=$(jq 'length' <<<"$prev_j") · claims=$(jq 'length' <<<"$claims_j")) → dispatch fn-responder-wake:"
  jq -r '.[] | "  + \(.)"' <<<"$new_j"
fi

# 冻结契约 payload; 发送失败重试 ×3 (瞬态 API 抖动), 终败不可静默 — 步红
payload=$(jq -nc --argjson rid "$run_id" --argjson s "$new_j" \
  '{event_type: "fn-responder-wake", client_payload: {run_id: $rid, samples: $s}}')
attempt=0
until gh api -X POST "repos/${slug}/dispatches" \
    -H "Content-Type: application/json; charset=utf-8" --input - <<<"$payload"; do
  attempt=$((attempt + 1))
  [ "$attempt" -ge 3 ] && break
  echo "::warning::dispatch 发送失败 (attempt $attempt/3), 10s 后重试"
  sleep 10
done
if [ "$attempt" -ge 3 ]; then
  echo "::error::dispatch 发送失败 ×3 — 漏唤醒不可静默 (下拍 prev 已含本轮样本不会自动补发, 需人工唤醒 agent)"
  exit 1
fi
echo "✅ dispatch 已发送: event_type=fn-responder-wake · run_id=$run_id · samples=$(jq 'length' <<<"$new_j")"
