#!/usr/bin/env bash
# auto-merge.sh — Tier A 自动合并门禁: 断言链 SSOT (编排见 .github/workflows/auto-merge.yml)
#
# 职责边界: 对单个 PR 执行 6 条机械断言, 全过才合并; 不做语义审查 (LLM 复审 Tier B 后置):
#   T1 来源       head 为本仓分支 ^agent/fn-<数字> (responder 命名空间; 尾部容忍 -rN 再响应
#                 形态, 先例 PR #30) 且 base=master 且 head 同仓 (fork 同名分支不认 — 命名空间
#                 的信任锚是本仓分支的推送权, fork 任何人可仿名)
#   T2 CI 绿      head sha 的全部非自身 check-run (同名取最新一次, 重跑残留以最新为准)
#                 completed 且 conclusion=success; 空检查集 / 超时 / >100 不可单页枚举 → 拒
#   T3 加性-only  每个变更文件 status=added 且路径匹配 ^[a-z][a-z0-9-]*/[a-z][a-z0-9-]*\.yaml$
#                 (单层 <tool>/<rule>.yaml 布局; .github/ 等任何越界路径即拒)
#   T4 样本在场   body 提取动机样本 — dedup-sample: 行 ∪ 语料路径形态 token (形如
#                 <host>/<owner>/<repo>/<YYYY-MM-DD>/<file>.log[.gz]) — 每条对语料仓 raw
#                 HEAD 须 2xx; 防「样本轮换出窗导致的空转绿」(CI 绿可能只因触发样本已不在
#                 语料, 该规则未经真实检验); 零提取 → 拒 (动机不可验证)
#   T5 规模上限   1 ≤ 文件数 ≤ 3 且 总新增行 ≤ 60
#   T6 合并       T1-T5 全过 → squash + 删分支 + 审计 comment; 任一失败 → label
#                 auto-merge-skipped + 原因 comment, 不合并
#
# 契约 (fail-closed): 任何 API 异常/超时/数据歧义都落在「拒绝合并」一侧, 绝不因查不到而
#   放行; merge 仅由断言链全过驱动, 无旁路 — 副作用只集中在文末 T6 动作区。
#
# 加性-only 安全论证: 新增规则只会增加 failure-fragments (FN 只降不升); 想隐藏未来失败必须
#   删改既有规则 (被 T3 排除); FP 方向被 lint CI ≤2% 断言封顶; 最坏情况 = 废规则进 master,
#   下一拍 sweep (schedule 触发每 6h, 不依赖 push 事件 — GITHUB_TOKEN 合并不触发下游 workflow
#   也不影响它) 变红自动暴露, revert 即愈 — 自限性故障, 无不可逆面。
#
# 为什么 CI 评估不用 gh pr checks: 本门禁自身是 head sha 上的 in-progress check-run,
#   gh pr checks 会把它算 pending → 永不终态 (死锁); 故走 check-runs API 并按
#   SELF_CHECK_NAME 排除自身后评估。
#
# DRY_RUN=1: 完整评估断言链并打印判定 (非 open / draft PR 也评估 — 事后诊断形态), 但不
#   执行任何副作用 (merge/label/comment 一律打印 would-run)。
#
# 环境变量: PR_NUMBER GH_TOKEN 必填; REPO / SELF_CHECK_NAME / CORPUS_RAW_BASE / GATE_REF /
#   WAIT_TIMEOUT_SEC / EMPTY_GRACE_SEC / POLL_INTERVAL_SEC / DRY_RUN 选填 (默认值见下)。
# shellcheck disable=SC2016 # 审计 comment 文本含 markdown 反引号, 单引号防展开是有意的
set -euo pipefail

# ---------- 可调参数 ----------
: "${PR_NUMBER:?need PR_NUMBER}"
: "${GH_TOKEN:?need GH_TOKEN}"
DRY_RUN="${DRY_RUN:-0}"
REPO="${REPO:-luochen1990/log-skimmer-rules}"
CORPUS_RAW_BASE="${CORPUS_RAW_BASE:-https://raw.githubusercontent.com/luochen1990/log-skimmer-corpus/master}"
SELF_CHECK_NAME="${SELF_CHECK_NAME:-tier-a-auto-merge}" # 本门禁 job 的 check-run 名, T2 评估时排除
GATE_REF="${GATE_REF:-local}"                            # 门禁代码版本 (审计 comment 溯源)
WAIT_TIMEOUT_SEC="${WAIT_TIMEOUT_SEC:-1800}"             # CI 终态等待上限
EMPTY_GRACE_SEC="${EMPTY_GRACE_SEC:-300}"                # 空检查集宽限 (check-run 创建有秒级滞后)
POLL_INTERVAL_SEC="${POLL_INTERVAL_SEC:-30}"
MAX_FILES=3
MAX_ADDITIONS=60
LABEL_SKIP='auto-merge-skipped'
RULE_PATH_RE='^[a-z][a-z0-9-]*/[a-z][a-z0-9-]*\.yaml$'
export GH_TOKEN

log() { printf '[gate] %s\n' "$*"; }

# ---------- 审计表 ----------
# 每条断言一行 markdown 表行; 最终整体落 comment / dry-run 打印。证据串内 '|' 换全角, 防表断列。
FAILED=0
AUDIT=()
record() { # <断言名> <判定icon> <证据>
  local ev=${3//|/¦}
  AUDIT+=("| $1 | $2 | $ev |")
  log "$2 $1 — $3"
}

# ---------- 副作用通道 (DRY_RUN 只打印) ----------
side_effect() {
  if [[ "$DRY_RUN" == "1" ]]; then log "DRY-RUN would-run: $*"; else "$@"; fi
}

# ---------- 数据采集 ----------
pr_json=$(gh api "repos/$REPO/pulls/$PR_NUMBER")
head_ref=$(jq -r '.head.ref' <<<"$pr_json")
head_sha=$(jq -r '.head.sha' <<<"$pr_json")
head_repo=$(jq -r '.head.repo.full_name // "?"' <<<"$pr_json")
base_ref=$(jq -r '.base.ref' <<<"$pr_json")
pr_state=$(jq -r '.state' <<<"$pr_json")
pr_draft=$(jq -r '.draft' <<<"$pr_json")
pr_body=$(jq -r '.body // ""' <<<"$pr_json")
log "PR #$PR_NUMBER head=$head_ref@$head_repo ${head_sha:0:12} → $base_ref state=$pr_state draft=$pr_draft"

# 结构性前置 (非断言): 非 open / draft 在实跑下无事可做 (draft→ready 与新推送都会再触发),
# 静默退出; DRY_RUN 下继续评估 — 诊断形态: "若此刻 flip ready 会怎样"。
if [[ "$pr_state" != "open" ]]; then
  if [[ "$DRY_RUN" == "1" ]]; then
    log "DRY-RUN: PR 非 open ($pr_state) — 实跑将静默退出, 以下为假想评估"
  else
    log "PR not open ($pr_state) — nothing to do"; exit 0
  fi
fi
if [[ "$pr_draft" == "true" ]]; then
  if [[ "$DRY_RUN" == "1" ]]; then
    log "DRY-RUN: PR 为 draft — 实跑将静默退出 (等 ready_for_review), 以下为假想评估"
  else
    log "PR is draft — waiting for ready_for_review"; exit 0
  fi
fi

# ---------- T1 来源 ----------
if [[ "$head_repo" == "$REPO" && "$base_ref" == "master" ]] && [[ "$head_ref" =~ ^agent/fn-[0-9]+ ]]; then
  record "T1 来源" "✅" "head=$head_ref (本仓) → $base_ref"
else
  record "T1 来源" "❌" "head=$head_ref@$head_repo → $base_ref (要求: 本仓 ^agent/fn-<数字> → master)"
  FAILED=1
fi

# ---------- T2 CI 绿 ----------
# head sha check-runs → 排除自身 → 同名取最新 → 全部须 success; 空集/超时/超页均拒。
latest_checks() { # stdin: check-runs API JSON → stdout: 非自身 check-run 数组 (同名取最新)
  jq --arg self "$SELF_CHECK_NAME" \
    '[.check_runs[] | select(.name != $self)] | group_by(.name) | map(max_by([.started_at, .id])) | sort_by(.name)'
}

wait_ci_terminal() { # → "OK<换行><checks JSON>" | EMPTY | TIMEOUT | TOOMANY
  local deadline=$(( $(date +%s) + WAIT_TIMEOUT_SEC ))
  local empty_grace=$(( $(date +%s) + EMPTY_GRACE_SEC ))
  local raw total checks n inprog now
  while :; do
    if ! raw=$(gh api "repos/$REPO/commits/$head_sha/check-runs?per_page=100"); then
      log "check-runs API 失败 (瞬态?) — ${POLL_INTERVAL_SEC}s 后重试"
    else
      total=$(jq -r '.total_count' <<<"$raw")
      if (( total > 100 )); then echo TOOMANY; return; fi
      checks=$(latest_checks <<<"$raw")
      n=$(jq 'length' <<<"$checks")
      inprog=$(jq '[.[] | select(.status != "completed")] | length' <<<"$checks")
      if (( n > 0 )) && (( inprog == 0 )); then printf 'OK\n%s' "$checks"; return; fi
      log "等待 CI 终态: non-self checks=$n in-progress=$inprog (上限 ${WAIT_TIMEOUT_SEC}s)"
      if (( n == 0 )) && (( $(date +%s) > empty_grace )); then echo EMPTY; return; fi
    fi
    now=$(date +%s)
    if (( now > deadline )); then echo TIMEOUT; return; fi
    sleep "$POLL_INTERVAL_SEC"
  done
}

if (( FAILED )); then
  # T1 未过 (fork / 非 agent 命名空间 / 异 base) — 不值得为它等 CI, 直接记跳过
  record "T2 CI 绿" "⏭" "T1 未过, 不评估 (避免为注定拒绝的 PR 空等 CI)"
else
  log "T2: 等待 CI 终态 (上限 ${WAIT_TIMEOUT_SEC}s, 空集宽限 ${EMPTY_GRACE_SEC}s)..."
  ci_out=$(wait_ci_terminal)
  ci_status=${ci_out%%$'\n'*}
  if [[ "$ci_status" == "OK" ]]; then
    checks_json=${ci_out#*$'\n'}
    t2_bad=$(jq -r '.[] | select(.conclusion != "success") | "- \(.name): \(.conclusion)"' <<<"$checks_json" | tr '\n' ' ')
    t2_sum=$(jq -r 'map("\(.name)=\(.conclusion)") | join(", ")' <<<"$checks_json")
    if [[ -z "$t2_bad" ]]; then
      record "T2 CI 绿" "✅" "$t2_sum"
    else
      record "T2 CI 绿" "❌" "非 success: $t2_bad"
      FAILED=1
    fi
  else
    case "$ci_status" in
      EMPTY)   t2_ev="空检查集 — head sha 无任何非自身 check-run (CI 未触发?)" ;;
      TIMEOUT) t2_ev="${WAIT_TIMEOUT_SEC}s 内未到终态" ;;
      TOOMANY) t2_ev="check-runs >100, 无法单页可靠枚举" ;;
      *)       t2_ev="未知轮询终态: $ci_status" ;;
    esac
    record "T2 CI 绿" "❌" "$t2_ev"
    FAILED=1
  fi
fi

# ---------- T3 加性-only ----------
files_json=$(gh api "repos/$REPO/pulls/$PR_NUMBER/files?per_page=100")
n_files=$(jq 'length' <<<"$files_json")
if (( n_files == 0 )); then
  record "T3 加性-only" "❌" "空变更集 (0 文件)"
  FAILED=1
else
  t3_bad=$(jq -r --arg re "$RULE_PATH_RE" \
    '.[] | select(.status != "added" or (.filename | test($re) | not)) | "- \(.filename) (\(.status))"' \
    <<<"$files_json" | tr '\n' ' ')
  if [[ -n "$t3_bad" ]]; then
    record "T3 加性-only" "❌" "非 added 或路径越界: $t3_bad"
    FAILED=1
  else
    record "T3 加性-only" "✅" "$n_files 文件全部 added 且匹配单层 <tool>/<rule>.yaml"
  fi
fi

# ---------- T4 动机样本在场 ----------
# 提取双格式 (并集去重): ① 规范格式 dedup-sample: <path> 行 (前向兼容 — responder 若采纳即机读);
# ② 现行 responder body 形态 — 样本以语料路径形态出现在表格/行文中 (剧本 5a: body 含逐样本路径)。
# body 经参数传入 (各 grep 独立 herestring 供给 — 若共用 stdin, 前一 grep 会把流读光致后者空转);
# grep 无匹配 exit 1, set -e 下逐个 || true 兜住。
extract_samples() { # <body> → stdout: 样本路径每行一条 (去重)
  local body=$1
  {
    { grep -E '^dedup-sample:[[:space:]]*[^[:space:]]+' <<<"$body" || true; } \
      | sed -E 's/^dedup-sample:[[:space:]]*//' | tr -d '`'
    { grep -oE '[A-Za-z0-9][A-Za-z0-9._+~:@-]*/[A-Za-z0-9][A-Za-z0-9._+~:@-]*/[A-Za-z0-9][A-Za-z0-9._+~:@-]*/[0-9]{4}-[0-9]{2}-[0-9]{2}/[A-Za-z0-9][A-Za-z0-9._+~:@-]*\.log(\.gz)?' <<<"$body" || true; } \
      | tr -d '`'
  } | awk '!seen[$0]++'
}

head_code() { # <path> → HTTP code; 2xx/404 即定论, 5xx/网络失败重试 2 次 (防语料端瞬态误拒)
  local url="$CORPUS_RAW_BASE/$1" code=000 _
  for _ in 1 2 3; do
    # curl 失败时 -w 可能仍打印 000, || 赋值兜住 (避免两行 000 拼接)
    code=$(curl -sS -o /dev/null -w '%{http_code}' --max-time 30 --head "$url" 2>/dev/null) || code=000
    case "$code" in 2?? | 404) echo "$code"; return ;; esac
    sleep 3
  done
  echo "$code"
}

mapfile -t samples < <(extract_samples "$pr_body")
if (( ${#samples[@]} == 0 )); then
  record "T4 样本在场" "❌" "body 未提取到动机样本 (dedup-sample: 行 / 语料路径形态 token 均无) — 动机不可验证"
  FAILED=1
else
  t4_bad=()
  for s in "${samples[@]}"; do
    if [[ "$s" == *..* ]]; then t4_bad+=("$s (路径含 .. 拒检)"); continue; fi
    code=$(head_code "$s")
    if [[ "$code" != 2?? ]]; then t4_bad+=("$s (HTTP $code)"); fi
  done
  if (( ${#t4_bad[@]} == 0 )); then
    record "T4 样本在场" "✅" "${#samples[@]} 个样本全部在语料 (raw HEAD 2xx)"
  else
    record "T4 样本在场" "❌" "出窗/不可达: ${t4_bad[*]} — CI 绿可能未经真实检验 (空转绿)"
    FAILED=1
  fi
fi

# ---------- T5 规模上限 ----------
total_adds=$(jq '[.[].additions] | add // 0' <<<"$files_json")
if (( n_files >= 1 && n_files <= MAX_FILES && total_adds <= MAX_ADDITIONS )); then
  record "T5 规模上限" "✅" "files=$n_files (1..$MAX_FILES), additions=$total_adds (≤$MAX_ADDITIONS)"
else
  record "T5 规模上限" "❌" "files=$n_files (要求 1..$MAX_FILES), additions=$total_adds (≤$MAX_ADDITIONS)"
  FAILED=1
fi

# ---------- T6 判定与动作 (副作用集中区) ----------
verdict=$([[ "$FAILED" == "1" ]] && echo REJECTED || echo 'ALL PASS')
comment() { # <tail> → 组装审计 comment (并 DRY_RUN 打印全文)
  local body
  body=$(printf '### 🤖 Tier A 自动合并门禁 — %s\n\nPR #%s | head `%s` @ `%s` | gate ref `%s` | 断言链 SSOT: `.github/scripts/auto-merge.sh`\n\n| 断言 | 判定 | 证据 |\n| --- | --- | --- |\n%s\n\n%s\n' \
    "$([[ "$FAILED" == "1" ]] && echo 🚫 || echo ✅)" \
    "$PR_NUMBER" "$head_ref" "${head_sha:0:12}" "${GATE_REF:0:12}" \
    "$(printf '%s\n' "${AUDIT[@]}")" "$1")
  if [[ "$DRY_RUN" == "1" ]]; then
    printf '\n===== 审计 comment 全文 (DRY-RUN) =====\n%s\n======================================\n' "$body"
  else
    printf '%s' "$body"
  fi
}

log "VERDICT: $verdict"

if [[ "$FAILED" == "1" ]]; then
  if [[ "$DRY_RUN" != "1" ]]; then
    # label 幂等创建 (已存在 422 容忍) → 打标 → 原因 comment; 均为尽力而为, 拒绝本身已是结论
    side_effect gh api --method POST "repos/$REPO/labels" \
      -f name="$LABEL_SKIP" -f color=dddddd -f description='Tier A gate 拒绝自动合并 (见 gate comment)' \
      >/dev/null 2>&1 || true
    side_effect gh pr edit "$PR_NUMBER" --repo "$REPO" --add-label "$LABEL_SKIP" >/dev/null \
      || log "WARN: add-label 失败 (fork PR 只读 token?)"
    side_effect gh pr comment "$PR_NUMBER" --repo "$REPO" --body "$(comment '🚫 断言链未全过 — 跳过自动合并 (label `auto-merge-skipped`), 交人工处理。')" \
      || log "WARN: skip comment 失败"
  else
    log "DRY-RUN would-run: gh api POST label / gh pr edit #$PR_NUMBER --add-label $LABEL_SKIP"
    log "DRY-RUN would-run: gh pr comment #$PR_NUMBER (skip 原因)"
    comment '🚫 断言链未全过 — 跳过自动合并 (label `auto-merge-skipped`), 交人工处理。'
  fi
  # 「评估后决定不合并」是门禁的正常结论, 不算 CI 错误 (label+comment 即信号)
  exit 0
fi

# 全过 → 合并前 TOCTOU 复核: 评估期间 head 移动/PR 关闭则放弃 (后续事件会重跑)
if [[ "$DRY_RUN" != "1" ]]; then
  pr_now=$(gh api "repos/$REPO/pulls/$PR_NUMBER")
  if [[ "$(jq -r '.head.sha' <<<"$pr_now")" != "$head_sha" || "$(jq -r '.state' <<<"$pr_now")" != "open" ]]; then
    log "评估后 PR 头已移动或已关闭 — 放弃合并 (后续事件会重跑)"
    exit 0
  fi
else
  log "DRY-RUN: 实跑此处会 TOCTOU 复核 head sha 未移动后执行合并"
fi

if [[ "$DRY_RUN" == "1" ]]; then
  log "DRY-RUN would-run: gh pr merge #$PR_NUMBER --repo $REPO --squash --delete-branch"
  log "DRY-RUN would-run: gh pr comment #$PR_NUMBER (合并审计)"
  comment '✅ 断言链全过 — 已执行 squash 合并并删除分支。机械合并理由即上表; 语义正确性由 lint CI 全语料断言背书 (FN=0 / FP率≤2% / 零块=0 / 边界违例=0), 加性-only 保证无删改面。'
  exit 0
fi

if gh pr merge "$PR_NUMBER" --repo "$REPO" --squash --delete-branch >/dev/null; then
  gh pr comment "$PR_NUMBER" --repo "$REPO" --body "$(comment '✅ 断言链全过 — 已执行 squash 合并并删除分支。机械合并理由即上表; 语义正确性由 lint CI 全语料断言背书 (FN=0 / FP率≤2% / 零块=0 / 边界违例=0), 加性-only 保证无删改面。')" \
    || log "WARN: 合并后审计 comment 失败 (合并已完成, 本 job log 为审计后备)"
  log "MERGED ✅ (squash, branch deleted)"
else
  # 合并命令失败 — 区分「命令整体失败」与「merge 已发生但删分支失败」
  merged_now=$(gh api "repos/$REPO/pulls/$PR_NUMBER" | jq -r '.merged')
  if [[ "$merged_now" == "true" ]]; then
    gh pr comment "$PR_NUMBER" --repo "$REPO" --body "$(comment '✅ 断言链全过 — squash 合并已发生 (清理步有非致命报错, 分支可能残留, 可忽略或手删)。')" \
      || true
    log "MERGED ✅ (清理步非致命报错)"
  else
    gh pr comment "$PR_NUMBER" --repo "$REPO" --body "$(comment '⚠️ 断言链全过但 merge 命令失败 — 需人工检查 (分支保护 / 权限 / 合并方法设置)。本评论为审计记录。')" \
      || true
    log "merge 命令失败 — 需人工检查"
    exit 1
  fi
fi
