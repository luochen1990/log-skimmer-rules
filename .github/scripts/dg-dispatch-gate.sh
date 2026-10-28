#!/usr/bin/env bash
# dg-dispatch-gate.sh — DG (diagnostic gap) 唤醒机械门控 (dg-responder 唤醒面)
#
# 职责: sweep 的「新 diagnostic gap 差集」判定 — 仅当出现**未被基线与在途声明
#   覆盖的新 gap 样本**时, 发 repository_dispatch(dg-responder-wake) 唤醒
#   dg-responder (agent 收事件即耗 LLM token)。稳态 (同一 gap 在规则合入前
#   每拍重复在场) = 差集空 = 零发送 = 下游零消耗。与 fn 门控
#   (fn-dispatch-gate.sh) 同骨架, 三处差异面:
#   - 事件源: summary.json 的 diagnostic_gaps (引擎侧已产缺口清单 + 定位线索,
#     gap 非 CI 红事件 — 是覆盖债的增量面, 不似 FN 挂在哨兵判定上);
#   - 基线: 上次成功 run 的 l0-summary artifact (调用方 prev 步已落地的
#     prev-summary.json 本地文件), 非 fn 的 reports 分支 raw URL 快照 —
#     dg 基线本就是 sweep 自产 artifact, 无需二次网络面;
#   - 冷启动: 取不到基线 ⇒ 基线采纳, 派发集 = ∅ (显式 notice, 不红) — 与 fn
#     「取数失败保守唤醒」方向相反: gap 是覆盖债非哨兵红, 存量积压不自动洪灌,
#     下拍起增量派发生效 (契约「冷启动」)。
#
# 差集语义 (契约 CONTRACT.md「派发门控」, 逐字一致):
#   派发集 = 本拍 gaps 样本集 − 基线样本集 − 在途声明 − 冷却名单(v1 缺省空集)
#   在途声明 = open PR body 一行 `dg-samples: <逗号分隔样本路径>` (容忍行首
#     bullet/quote 前缀; 对偶 fn 的 dedup-sample, open 全收, 不限分支前缀 —
#     声明行本身即显式意图标记); 查询失败 → 视空集 (保守方向: 宁可多唤醒不可
#     静默漏, 差集只增不减, 与 fn 同)。
#   冷却名单: v1 缺省空集 (契约占位未启用 — 与 fn 的 merged-12h 窗不同: dg
#     声明随 PR 关闭即失效, 「合了未愈」下拍重唤醒 = 契约行为)。
#   批量上限: 每拍 ≤20, 超出部分按引擎序截断等下拍 — 基线含它们, 观察面不丢。
#
# 冻结契约 (勿改; 全景 SSOT = 引擎仓 docs/diagnostic-loop.md §2.2):
#   POST /repos/<slug>/dispatches
#   {"event_type": "dg-responder-wake",
#    "client_payload": {"run_id": <int>,
#                       "samples": [<DiagnosticGap 精简形>, ...]}}
#   精简形 = 引擎 summary.json diagnostic_gaps 元素去 input_lines (字段名逐一
#   一致): {repo, sample, conclusion, hit_rules, candidates: [{line_no, text}]}
#   载荷预算: client_payload ≤64KB; 超限时每样本 candidates 截前 5 条并附
#     truncated: true (仅对实际被截的样本如实标记); 截后仍超 = 契约外形态,
#     步红诚实暴露不静默。
#   证据完整包由响应器自行从语料仓取 — candidates 只是定位线索, 本脚本不触
#   语料 (与 fn-evidence.sh 的「语料永不离 runner」原则同向, 且更彻底)。
#   下游链 = dg-wake.yml 监听 workflow (run = agent-service github_dispatch
#   触发器的边沿; client_payload 原文落 dg-wake 分支 dg-wake.json 数据面)。
#
# 用法: dg-dispatch-gate.sh <summary.json> [prev-summary.json]
#   第 2 参缺席/文件不在场/无 diagnostic_gaps 字段 (旧引擎产物) ⇒ 冷启动
#   (基线采纳零派发)
# 环境: REPO_SLUG / GITHUB_TOKEN (PR 列表 + dispatch) / RUN_ID (client_payload)
# 退出码: 0 = 完成 (含稳态零发送与冷启动采纳) / 1 = 载荷组装失败或 dispatch
#   发送失败 (漏唤醒不可静默 — 步红可见; 后续发布/artifact 步均 always 前置,
#   不被本步阻断; gap 非 CI 红事件, 本步红只暴露自身, 不劫持哨兵语义)
set -uo pipefail

summary=$1
base=${2:-}
slug=${REPO_SLUG:?REPO_SLUG 必填}
run_id=${RUN_ID:?RUN_ID 必填}
: "${GITHUB_TOKEN:?GITHUB_TOKEN 必填}"
[[ "$run_id" =~ ^[0-9]+$ ]] || { echo "dg-dispatch-gate: RUN_ID 非整数: $run_id" >&2; exit 1; }
BATCH_CAP=20                  # 每拍派发上限 (契约「批量上限」)
CAND_CAP=5                    # 载荷超预算时每样本 candidates 截断上限 (契约)
PAYLOAD_BUDGET=$((64 * 1024)) # client_payload 字节预算 (契约「载荷预算」)

# 本拍 gaps (引擎序保持): 精简形数组 + 样本序集。summary.json 不可解析 → 步红
#   (上游 report 步刚 jq 过同文件, 理论不可达 — 诚实暴露优于空集误判稳态)
if ! gaps_j=$(jq -c '[.diagnostic_gaps[]? | {repo, sample, conclusion, hit_rules, candidates}]' "$summary" 2>/dev/null); then
  echo "dg-dispatch-gate: summary.json 不可解析: $summary" >&2
  exit 1
fi

# 基线: 上次成功 run 的 l0-summary artifact。三种「取不到」统一冷启动: 文件
#   缺席 (prev 步 have=false) / 不可解析 / 无 diagnostic_gaps 字段 (旧引擎
#   产物 — dg 环首启) ⇒ 基线采纳, 派发集 = ∅ (契约「冷启动」: notice 不红)
cold=1
if [ -n "$base" ] && [ -s "$base" ] && jq -e 'has("diagnostic_gaps")' "$base" >/dev/null 2>&1; then
  prev_j=$(jq -c '[.diagnostic_gaps[].sample]' "$base")
  cold=0
fi
if [ "$cold" = 1 ]; then
  echo "::notice::dg 无基线 (首跑/保留期外/旧引擎无 diagnostic_gaps) — 基线采纳, 本拍零派发; 本拍 gaps $(jq 'length' <<<"$gaps_j") 条全量进 summary/报告供观察, 下拍起增量派发生效"
  exit 0
fi

# claims: 在途声明 (gh api 失败 → 空集, 保守)。per_page=100 + sort=updated:
#   本仓低流量, 单页覆盖近期全量; 声明行匹配从严 (仅行首 bullet/quote 前缀) —
#   漏识别 claim 只是多发一次 dispatch (可接受方向), 误识别 claim 会漏唤醒
#   (禁止方向), 与 fn 同向。语法 = 契约: 一行 `dg-samples: <逗号分隔样本路径>`。
if prs=$(gh api "repos/${slug}/pulls?state=open&sort=updated&direction=desc&per_page=100" 2>/dev/null); then
  # 客户端 state 过滤冗余于查询参数 (对偶 fn 的客户端 select — 查询面与判定面解耦)
  claims_j=$(jq -r '
    [.[] | select(.state == "open") | (.body // "")]
    | map(gsub("\\r"; "") | split("\n")[]
          | select(test("^([[:space:]]|[>*-])*dg-samples:[[:space:]]*\\S"))
          | sub("^([[:space:]]|[>*-])*dg-samples:[[:space:]]*"; "")
          | split(",")[]
          | gsub("^[[:space:]]+|[[:space:]]+$"; "")
          | select(length > 0))
    | unique' <<<"$prs")
else
  echo "::warning::PR 在途声明查询失败 — claims 视空集 (保守: 可能多发一次 dispatch)"
  claims_j='[]'
fi

# 差集 (jq 统一集合运算, 引擎序保持 — 引擎输出样本唯一 ⇒ 序确定, 截断确定)。
#   cur/prev 经进程替换走文件面 (勿改 --argjson 传值 — 样本路径数组随语料增长,
#   撞单参数 128KB argv 上限的失败形态是静默误判稳态 = 漏唤醒, 禁止方向)
new_j=$(jq -nc \
  --slurpfile c <(jq -c 'map(.sample)' <<<"$gaps_j") \
  --slurpfile p <(jq -c '[.diagnostic_gaps[].sample]' "$base") \
  --argjson l "$claims_j" \
  '$c[0] - ($p[0] + $l)')
n=$(jq 'length' <<<"$new_j")
if [ "$n" -eq 0 ]; then
  echo "dg-dispatch-gate: 稳态 — diagnostic gaps 全部被基线 (prev=$(jq 'length' <<<"$prev_j")) 或在途声明 (claims=$(jq 'length' <<<"$claims_j")) 覆盖, 零发送"
  exit 0
fi

# 批量上限: 每拍 ≤20, 超出按引擎序截断等下拍 (基线含它们, 观察面不丢)
deferred=$((n - BATCH_CAP)); [ "$deferred" -gt 0 ] || deferred=0
disp_j=$(jq -c --argjson cap "$BATCH_CAP" '.[:$cap]' <<<"$new_j")
extra=""
[ "$deferred" -gt 0 ] && extra=" (超出 $deferred 条按引擎序截断, 等下拍 — 基线含它们, 观察面不丢)"
echo "dg-dispatch-gate: 新 diagnostic gap $n 个 (prev=$(jq 'length' <<<"$prev_j") · claims=$(jq 'length' <<<"$claims_j")) → 本拍派发 $(jq 'length' <<<"$disp_j")$extra → dispatch dg-responder-wake:"
jq -r '.[] | "  + \(.)"' <<<"$disp_j"

# 载荷组装 (冻结契约形态) + 64KB 预算: 超限 → 每样本 candidates 截前 5 条并附
#   truncated: true; 截后仍超 = 契约外形态, 步红诚实暴露。
#   gaps 经 --rawfile 从 summary 文件直读 (勿改 --argjson 传值 — 全量 gaps 可达
#   数百 KB, 撞单参数 128KB argv 上限, 实测崩在 150KB 级载荷)
payload_of() { # $1 = candidates 截断上限 (0 = 不截)
  jq -nc --argjson rid "$run_id" --argjson disp "$disp_j" --argjson cc "$1" \
    --rawfile sum "$summary" '
    ($sum | fromjson | .diagnostic_gaps // []
           | reduce .[] as $g ({}; .[$g.sample] = $g)) as $by
    | {event_type: "dg-responder-wake",
       client_payload: {run_id: $rid,
         samples: [$disp[] | $by[.]
           | {repo, sample, conclusion, hit_rules, candidates}
           | if ($cc > 0 and (.candidates | length) > $cc)
             then . + {truncated: true, candidates: .candidates[:$cc]}
             else . end]}}'
}
body=$(payload_of 0)
if [ "$(jq -cj '.client_payload' <<<"$body" | wc -c)" -gt "$PAYLOAD_BUDGET" ]; then
  body=$(payload_of "$CAND_CAP")
  if [ "$(jq -cj '.client_payload' <<<"$body" | wc -c)" -gt "$PAYLOAD_BUDGET" ]; then
    echo "::error::载荷截断 (candidates ≤$CAND_CAP) 后仍超 64KB 预算 — 契约外形态, 诚实暴露不静默"
    exit 1
  fi
  echo "dg-dispatch-gate: 载荷超 64KB — candidates 已按每样本前 $CAND_CAP 条截断并标记 truncated"
fi

# 冻结契约 payload; 发送失败重试 ×3 (瞬态 API 抖动), 终败不可静默 — 步红
attempt=0
until gh api -X POST "repos/${slug}/dispatches" \
    -H "Content-Type: application/json; charset=utf-8" --input - <<<"$body"; do
  attempt=$((attempt + 1))
  [ "$attempt" -ge 3 ] && break
  echo "::warning::dispatch 发送失败 (attempt $attempt/3), 10s 后重试"
  sleep 10
done
if [ "$attempt" -ge 3 ]; then
  echo "::error::dispatch 发送失败 ×3 — 漏唤醒不可静默 (下拍基线已含本轮样本不会自动补发, 需人工唤醒 dg-responder)"
  exit 1
fi
echo "✅ dispatch 已发送: event_type=dg-responder-wake · run_id=$run_id · samples=$(jq '.client_payload.samples | length' <<<"$body")"
