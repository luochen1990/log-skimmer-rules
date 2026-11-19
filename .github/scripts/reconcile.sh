#!/usr/bin/env bash
# reconcile.sh — Tier A reconcile 循环: 全量 open agent/* PR 定期分类处置
#   (断言/合并语义 SSOT 仍是 .github/scripts/auto-merge.sh; 编排 = .github/workflows/reconcile.yml)
#
# 职责边界 — 补 auto-merge 事件驱动 (ready_for_review/synchronize 边沿) 的三个结构性
#   缺口, 对全部 open PR 中 headRefName 以 agent/ 开头者逐个按序分类处置 (先关后评):
#   P1 legacy-branch  headRef 不匹配 ^agent/(fn|gap)- 前缀 → close + 审计 comment
#                     (仅关门禁 workflow if 过滤 (startsWith agent/fn- / agent/gap-) 真正
#                     永不命中者, 如 #85 裸 agent/gap 形态; 前缀命中但形态不合规者 — 如
#                     agent/gap-manual-* 人工重放 (auto-merge.sh T1 刻意不收) — 不关:
#                     门禁会评估并 skip, 自然落 P5/P6 待人工。缺口由 responder 以合规
#                     命名重新派发)
#   P2 superseded     PR 全部变更文件路径在 master 树 (CWD 检出) 已存在 → close + comment
#                     (加性-only 仓: 同路径规则已被别的 PR 合入 = 重复交付)
#   P3 stale          body 动机样本非空且全部对语料仓 raw HEAD 定论 404 → close + comment
#                     (样本已随语料旋转出窗, 如 #149; CI 绿已不可复现, 留着只会永悬)
#   P4 漏触发重验     ready 且无 skip label: auto-merge.sh DRY_RUN=1 假想评估断言全过 →
#                     APPLY 下再以 DRY_RUN=0 实跑 (合并走既有 T6 通道含审计 comment)
#   P5 skip 聚合      ready 且有 skip label (非 P2/P3) → 待人工清单, 不动作
#   P6 draft 处置     draft 且样本在场 (非 P2/P3): 假想评估断言全过 (含 T2 CI 绿) →
#                     APPLY 下 gh pr ready (flip 后 ready_for_review 触发门禁合并);
#                     否则若 CI 红/陈旧为唯一断言失败 ∧ updatedAt 龄 > REDRIVE_MIN_AGE_SEC
#                     ∧ 本 PR re-drive 审计 comment < REDRIVE_MAX → 空提交推 head 分支
#                     (synchronize → CI 重跑) + 审计 comment 计数; 否则待人工 (blocker 未消)
#
# 硬性安全约束:
#   - 只处理 agent/ 前缀分支的 PR — 人类 PR 永不触碰 (外层 select + P1 复核双重)
#   - reconcile 自身永不直接 merge — 合并只能经 auto-merge.sh 实跑通道 (P4; flip 后的
#     实际合并也由门禁执行, reconcile 只负责让 PR 到达门禁可评估的形态)
#   - 永不 force push (re-drive 推空提交为 fast-forward; 被拒即记 error 不重试)
#   - fail-closed: 单 PR 任何 API/数据异常 → 记 error、不动作、进报告 (脚本继续处理
#     其余 PR); P3 只认定论 404 — 语料端 5xx/超时 = 数据异常, 不关 (防瞬态误杀)
#   - 副作用总数 (close+flip+re-drive+merge) ≤ MAX_MUTATIONS (默认 10), 超出顺延下一拍
#     (防首轮对存量 (34 个 open PR) 一次性动作过大); 预算按「发起」计 (TOCTOU 放弃也占)
#   - APPLY=0 (dry, 默认): 所有动作只打印 would-run, 不写任何 comment/label/close/push;
#     唯一例外 = 报告落盘 (reconcile-reports 专属分支追加 + job summary)
#
# GITHUB_TOKEN 边界 (平台防递归: GITHUB_TOKEN 触发的事件不起跑下游 workflow):
#   - gh pr ready 后 ready_for_review 可能不触发 auto-merge — 无害且自愈: 下一拍该 PR
#     已是 ready, 走 P4 通道由 auto-merge.sh 实跑直接驱动合并
#   - re-drive 空提交 push 后 synchronize 可能不触发 lint (CI 重跑目标落空, 且新 head sha
#     无 check-run → 下拍 T2=EMPTY 仍是「陈旧」) — 需要真正的 CI 重跑时经 REDRIVE_PUSH_TOKEN
#     提供 PAT (缺省回落 GITHUB_TOKEN, 此时 re-drive 仅推进 head sha + 留审计轨迹)
#
# 门禁输出解析契约 (auto-merge.sh 机器消费面, 格式变更须双向同步): dry 评估 = "VERDICT:
#   ALL PASS|REJECTED" 行 + "❌ T<n> <断言名>" 审计行 (P4/P6 判定与 GATE_FAILS 提取);
#   实跑 = "GATE-RESULT: MERGED|REJECTED|ABANDONED" 终态行 (P4 计数依据; 缺席或非
#   MERGED → 走 pulls API 事实核验, 绝不把 exit 0 当合并成功)。
#
# 运行前提: CWD = 本仓 master 检出 (P2 的 git cat-file 与 re-drive 的 fetch/push 以 CWD
#   repo 为对象 — 与 auto-merge.yml 同理, PR 内容零参与处置逻辑); auto-merge.sh 与
#   corpus-probe.sh 按本脚本所在目录定位 (可从任意 CWD 调用)。
#
# 报告: 无论 dry/apply, 全量分类结果 (每 PR 一行 + 待人工 + error + 顺延 + 计数) 以
#   markdown 追加写入专属单写者分支 reconcile-reports 的 reconcile/<UTC时间戳>.md
#   (追加提交, 非 force; 分支不存在则初始化), 同文追加到 $GITHUB_STEP_SUMMARY (在场时);
#   raw 消费 URL 形如 raw.githubusercontent.com/<slug>/reconcile-reports/reconcile/<ts>.md。
#   专属分支而非 reports: reports 是 sweep (publish-report.sh) 的孤儿单提交强推写面,
#   每 6h 整树重写会清掉外来文件 — reconcile 落 reconcile-reports 单写者分支, 对齐
#   dg-wake.yml 的 dg-wake 分支单写者纪律先例 (两个 bot 不共享推送 ref, 无竞争)。
#
# 环境变量: GH_TOKEN 必填; 选填 — REPO (默认 luochen1990/log-skimmer-rules) / APPLY
#   (空 = 按 GITHUB_EVENT_NAME 与 actions variable RECONCILE_APPLY 判定: 值恰为字符串
#   "true" 才 APPLY, 404/其他/查询失败一律 dry — fail-closed; "1"=APPLY, 其余=dry) /
#   MAX_MUTATIONS (10) / REDRIVE_MAX (3) / REDRIVE_MIN_AGE_SEC (86400) / REDRIVE_PUSH_TOKEN
#   / REPORT_REMOTE (报告落盘远端, 默认本仓 https+token) / REPORT_BRANCH (reconcile-reports) /
#   SELF_CHECK_NAME /
#   CORPUS_RAW_BASE / GATE_WAIT_SEC·GATE_EMPTY_GRACE_SEC·GATE_POLL_SEC (门禁 dry 评估的
#   CI 等待参数, 盘点节奏远短于事件驱动门禁: 90/30/10)。
# shellcheck disable=SC2016 # 审计 comment/报告文本含 markdown 反引号, 单引号防展开是有意的 (与 auto-merge.sh 同款)
set -euo pipefail

# ---------- 可调参数 ----------
: "${GH_TOKEN:?need GH_TOKEN}"
REPO="${REPO:-luochen1990/log-skimmer-rules}"
MAX_MUTATIONS="${MAX_MUTATIONS:-10}"
REDRIVE_MAX="${REDRIVE_MAX:-3}"
REDRIVE_MIN_AGE_SEC="${REDRIVE_MIN_AGE_SEC:-86400}"
CORPUS_RAW_BASE="${CORPUS_RAW_BASE:-https://raw.githubusercontent.com/luochen1990/log-skimmer-corpus/master}"
SELF_CHECK_NAME="${SELF_CHECK_NAME:-tier-a-auto-merge}" # 门禁 job 的 check-run 名 (CI 评估排除自身, 与 T2 同款)
LABEL_SKIP='auto-merge-skipped'
REDRIVE_MARKER='<!-- tier-a-reconcile:redrive -->' # re-drive 审计 comment 机读标记 (计数用)
REPORT_REMOTE="${REPORT_REMOTE:-https://x-access-token:${GH_TOKEN}@github.com/${REPO}.git}"
REPORT_BRANCH="${REPORT_BRANCH:-reconcile-reports}" # 报告专属单写者分支 (sweep 的 reports 是孤儿强推写面, 不去挤 — 见头注「报告」)
GATE_WAIT_SEC="${GATE_WAIT_SEC:-90}"
GATE_EMPTY_GRACE_SEC="${GATE_EMPTY_GRACE_SEC:-30}"
GATE_POLL_SEC="${GATE_POLL_SEC:-10}"
export GH_TOKEN

HERE=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# shellcheck disable=SC1090,SC1091 # 按脚本自身位置锚定 (CWD 无关); 共享库随本仓分发, shellcheck 需 -x/显式输入才跟随
source "$HERE/corpus-probe.sh" # extract_samples/head_code — 与门禁 T4 同源 (SSOT)

log() { printf '[reconcile] %s\n' "$*"; }

# ---------- APPLY 判定 (fail-closed; 判定依据记入 log 与报告 — R2, 运营排障) ----------
APPLY_BASIS="(未记录)"
resolve_apply() {
  if [[ -n "${APPLY:-}" ]]; then
    APPLY_BASIS="显式 APPLY env (dispatch input 由 workflow 直传 / 本地测试)"
  elif [[ "${GITHUB_EVENT_NAME:-}" == "workflow_dispatch" ]]; then
    APPLY=0; APPLY_BASIS="dispatch 未直传 input (理论不至) — 保守 dry"
  else
    # schedule 路径: actions variable RECONCILE_APPLY, 值恰为 "true" 才 APPLY;
    # 404 (变量不存在) / 其他值 / 查询失败 → 一律 dry (fail-closed: 宁可白跑不可误动)
    local v="" raw qrc
    if raw=$(gh api "repos/$REPO/actions/variables/RECONCILE_APPLY" 2>/dev/null); then
      v=$(jq -r '.value // empty' <<<"$raw" 2>/dev/null) || v=""
      APPLY_BASIS="actions variable RECONCILE_APPLY=\"$v\" (schedule 路径)"
    else
      qrc=$?
      APPLY_BASIS="actions variable 查询失败 (rc=$qrc, 404=未设置) — fail-closed dry"
    fi
    APPLY=0
    [[ "$v" == "true" ]] && APPLY=1
  fi
  if [[ "$APPLY" == "1" ]]; then MODE="APPLY"; else MODE="DRY (只报告)"; APPLY=0; fi
  log "APPLY 判定 → $MODE (依据: $APPLY_BASIS)"
  return 0
}

# ---------- 审计/报告累积 ----------
ROWS=() PENDING=() ERRORS=() DEFERRED=()
CLOSED=0 FLIPPED=0 REDRIVEN=0 MERGED=0 MUTATIONS=0 LIST_CAPPED=0
row() { # <num> <head> <类别> <动作> <依据>
  local ev=${5//|/¦}
  ROWS+=("| #$1 | \`$2\` | $3 | $4 | $ev |")
}
pending() { # <num> <head> <依据> — 待人工, 不动作
  PENDING+=("- #$1 (\`$2\`): $3")
  row "$1" "$2" "待人工" "无" "$3"
}
error_row() { # <num> <head> <依据> — 数据异常, fail-closed 不动作
  ERRORS+=("- #$1 (\`$2\`): $3")
  row "$1" "$2" "error" "不动作" "$3"
}
defer_row() { # <num> <head> <类别> <依据> — 副作用预算尽, 顺延下一拍
  DEFERRED+=("- #$1 (\`$2\` → $3)")
  row "$1" "$2" "$3" "顺延 (预算尽)" "$4"
}
budget_left() { (( MUTATIONS < MAX_MUTATIONS )); }

# ---------- 动作通道 (dry 只打印 would-run) ----------
act_close() { # <num> <head> <类别> <comment-body>
  if ! budget_left; then defer_row "$1" "$2" "$3" "close"; return 0; fi
  MUTATIONS=$((MUTATIONS + 1)); CLOSED=$((CLOSED + 1))
  if [[ "$APPLY" == "1" ]]; then
    if gh pr close "$1" --repo "$REPO" --comment "$4" >/dev/null 2>&1; then
      row "$1" "$2" "$3" "close ✅" "close+comment 已执行"
    else
      # R6: close 命令报错 ≠ 未关 — 回查 pulls API 事实分类「实际已关(comment 失败)」/「未关」
      local fact="" st=""
      fact=$(gh api "repos/$REPO/pulls/$1" 2>/dev/null) && st=$(jq -r '.state // "?"' <<<"$fact" 2>/dev/null)
      if [[ -n "$st" && "$st" != "open" ]]; then
        row "$1" "$2" "$3" "close ✅ (comment 失败)" "gh pr close 报错但 PR 实已关闭 (API state=$st 核验) — 审计 comment 缺失, 本行即留痕"
      else
        CLOSED=$((CLOSED - 1)); row "$1" "$2" "$3" "close ❌" "gh pr close 失败${st:+ (核验 state=$st 仍 open)} — 见 error 清单"
        ERRORS+=("- #$1 (\`$2\`): gh pr close 失败${st:+, API 核验 state=$st} — PR 未关 (API/权限?)")
      fi
    fi
  else
    row "$1" "$2" "$3" "would-close" "APPLY 模式将 close+comment"
    log "would-run: gh pr close #$1 --repo $REPO --comment <审计 comment>"
  fi
  return 0
}
act_flip() { # <num> <head> <依据>
  if ! budget_left; then defer_row "$1" "$2" "P6 flip-ready" "$3"; return 0; fi
  MUTATIONS=$((MUTATIONS + 1)); FLIPPED=$((FLIPPED + 1))
  if [[ "$APPLY" == "1" ]]; then
    if gh pr ready "$1" --repo "$REPO" >/dev/null 2>&1; then
      row "$1" "$2" "P6 draft→ready" "flip ✅" "$3 (ready_for_review 触发门禁; 事件未触发由下拍 P4 兜底)"
    else
      FLIPPED=$((FLIPPED - 1)); row "$1" "$2" "P6 draft→ready" "flip ❌" "gh pr ready 失败 — 见 error 清单"
      ERRORS+=("- #$1 (\`$2\`): gh pr ready 失败 (API/权限?)")
    fi
  else
    row "$1" "$2" "P6 draft→ready" "would-flip" "$3"
    log "would-run: gh pr ready #$1 --repo $REPO"
  fi
  return 0
}
redrive_push() { # <num> <head_ref> — 空 commit 推 head 分支 (synchronize → CI 重跑); 永不 force
  local num=$1 ref=$2 wt
  git fetch --quiet origin "$ref" || return 1
  wt=$(mktemp -d)
  if ! git worktree add --detach --quiet "$wt" FETCH_HEAD 2>/dev/null; then
    rm -rf "$wt"; return 1
  fi
  if ! git -C "$wt" -c user.name=tier-a-reconcile -c user.email=tier-a-reconcile@users.noreply.github.com \
    commit --allow-empty --quiet -m "chore: tier-a reconcile re-drive #$num (synchronize → CI 重跑)"; then
    git worktree remove --force "$wt" >/dev/null 2>&1 || true; return 1
  fi
  # REDRIVE_PUSH_TOKEN (PAT) 在场走显式 https — GITHUB_TOKEN push 不触发下游 workflow
  # (见头注「GITHUB_TOKEN 边界」); 缺省推 origin (workflow checkout 持久化凭据)。
  local remote="origin"
  [[ -n "${REDRIVE_PUSH_TOKEN:-}" ]] && remote="https://x-access-token:${REDRIVE_PUSH_TOKEN}@github.com/${REPO}.git"
  if ! git -C "$wt" push --quiet "$remote" "HEAD:refs/heads/$ref" 2>/dev/null; then
    git worktree remove --force "$wt" >/dev/null 2>&1 || true; return 1
  fi
  git worktree remove --force "$wt" >/dev/null 2>&1 || true
  return 0
}
act_redrive() { # <num> <head> <依据> <ci-state> <第几次>
  if ! budget_left; then defer_row "$1" "$2" "P6 re-drive" "$3"; return 0; fi
  MUTATIONS=$((MUTATIONS + 1)); REDRIVEN=$((REDRIVEN + 1))
  local body
  body=$(printf '### 🤖 Tier A reconcile — re-drive #%s (%s/%s)\n\n- CI 状态: %s, PR 静置超 %sh → 已向 `%s` 推空提交 (synchronize → CI 重跑)。\n- 断言链 SSOT: `.github/scripts/auto-merge.sh` · 分类处置 SSOT: `.github/scripts/reconcile.sh`\n%s\n' \
    "$1" "$5" "$REDRIVE_MAX" "$4" "$(( REDRIVE_MIN_AGE_SEC / 3600 ))" "$2" "$REDRIVE_MARKER")
  if [[ "$APPLY" == "1" ]]; then
    if redrive_push "$1" "$2"; then
      if gh pr comment "$1" --repo "$REPO" --body "$body" >/dev/null 2>&1; then
        row "$1" "$2" "P6 re-drive" "空提交+comment ✅" "$3"
      else
        row "$1" "$2" "P6 re-drive" "空提交 ✅ / comment ❌" "$3 (审计 comment 失败 — 计数可能偏低, 见 error)"
        ERRORS+=("- #$1 (\`$2\`): re-drive 审计 comment 失败 (空提交已推)")
      fi
    else
      REDRIVEN=$((REDRIVEN - 1)); row "$1" "$2" "P6 re-drive" "push ❌" "推空提交失败 — 见 error 清单"
      ERRORS+=("- #$1 (\`$2\`): re-drive 推空提交失败 (fetch/push/权限?)")
    fi
  else
    row "$1" "$2" "P6 re-drive" "would-redrive" "$3"
    log "would-run: git push origin <空提交>:refs/heads/$2 + gh pr comment #$1 (re-drive 审计)"
  fi
  return 0
}

cur_close_comment() { # <类别> <依据> <处置尾注> — 用全局 CUR_NUM/CUR_HEAD 组装 (act_close 只传 comment 成品)
  printf '### 🤖 Tier A reconcile — close (#%s, %s)\n\n- 依据: %s\n- 分支: `%s`\n- 处置: 关闭本 PR。%s\n- 断言链 SSOT: `.github/scripts/auto-merge.sh` · 分类处置 SSOT: `.github/scripts/reconcile.sh`\n' \
    "$CUR_NUM" "$1" "$2" "$CUR_HEAD" "$3"
}

# ---------- 门禁假想评估 (auto-merge.sh DRY_RUN=1; draft 也继续评估 — 读其 draft 分支逻辑) ----------
GATE_OUT="" GATE_VERDICT="" GATE_FAILS=""
gate_dry() { # <num> → GATE_VERDICT ∈ {ALL PASS, REJECTED, ERROR}; GATE_FAILS = ❌ 断言清单
  local out rc=0
  out=$(DRY_RUN=1 PR_NUMBER="$1" REPO="$REPO" GH_TOKEN="$GH_TOKEN" \
    SELF_CHECK_NAME="$SELF_CHECK_NAME" CORPUS_RAW_BASE="$CORPUS_RAW_BASE" \
    WAIT_TIMEOUT_SEC="$GATE_WAIT_SEC" EMPTY_GRACE_SEC="$GATE_EMPTY_GRACE_SEC" POLL_INTERVAL_SEC="$GATE_POLL_SEC" \
    bash "$HERE/auto-merge.sh" 2>&1) || rc=$?
  GATE_OUT=$out
  if grep -q 'VERDICT: ALL PASS' <<<"$out"; then GATE_VERDICT="ALL PASS"
  elif grep -q 'VERDICT: REJECTED' <<<"$out"; then GATE_VERDICT="REJECTED"
  else GATE_VERDICT="ERROR (rc=$rc, 无 VERDICT 行)"; fi
  GATE_FAILS=$(grep -oE '❌ T[0-9][^—]*' <<<"$out" | sed 's/[[:space:]]*$//' | paste -sd';')
  [[ -n "$GATE_FAILS" ]] || GATE_FAILS="(无 ❌ 断言行)"
  return 0
}

# ---------- head sha CI 状态 (排除 SELF_CHECK_NAME 同款逻辑; 用于 P6 red/stale 分类) ----------
ci_state() { # <head_sha> → green|red|stale|error
  local raw checks n inprog bad total
  raw=$(gh api "repos/$REPO/commits/$1/check-runs?per_page=100" 2>/dev/null) || { echo error; return 0; }
  # 同名取最新 + 排除自身 + >100 拒单页枚举 — 与 auto-merge.sh T2 latest_checks/TOOMANY
  # 同款 (分类用只读副本; >100 时单页枚举不可靠 → error, fail-closed 不动作)
  total=$(jq -r '.total_count // 0' <<<"$raw" 2>/dev/null) || total=0
  if (( total > 100 )); then echo error; return 0; fi
  checks=$(jq --arg self "$SELF_CHECK_NAME" \
    '[.check_runs[] | select(.name != $self)] | group_by(.name) | map(max_by([.started_at, .id]))' <<<"$raw") || { echo error; return 0; }
  n=$(jq 'length' <<<"$checks")
  if (( n == 0 )); then echo stale; return 0; fi # 无任何 check-run (CI 未跑过此 sha)
  inprog=$(jq '[.[] | select(.status != "completed")] | length' <<<"$checks")
  if (( inprog > 0 )); then echo stale; return 0; fi # 未终态 (挂起/进行中) = 陈旧
  bad=$(jq '[.[] | select(.conclusion != "success")] | length' <<<"$checks")
  if (( bad > 0 )); then echo red; return 0; fi
  echo green
}

# ---------- 单 PR 分类处置 ----------
CUR_NUM="" CUR_HEAD=""
classify_one() { # <pr-list row JSON>
  local num head draft labels updated title
  local -a files=() samples=()   # O2: 数组显式局部声明 (mapfile 填充)
  num=$(jq -r '.number' <<<"$1"); head=$(jq -r '.headRefName' <<<"$1")
  draft=$(jq -r '.isDraft' <<<"$1"); labels=$(jq -r '[.labels[].name] | join(",")' <<<"$1")
  updated=$(jq -r '.updatedAt' <<<"$1"); title=$(jq -r '.title // ""' <<<"$1")
  CUR_NUM=$num; CUR_HEAD=$head
  log "PR #$num head=$head draft=$draft labels=[$labels] updated=$updated «$title»"

  # ---- P1 legacy-branch: 门禁 if 过滤 (startsWith) 永不命中的命名, 关闭 (responder 会合规重派) ----
  # 只比对前缀 ^agent/(fn|gap)- 而非完整合规 regex (前缀命中但形态不合规者不关) — 语义见头注 P1
  if [[ ! "$head" =~ ^agent/(fn|gap)- ]]; then
    act_close "$num" "$head" "P1 legacy-branch" \
      "$(cur_close_comment "P1 legacy-branch" "分支名 \`$head\` 缺少 \`agent/fn-\` / \`agent/gap-\` 前缀 — Tier A 门禁的触发过滤 (auto-merge.yml if, startsWith) 永不命中, PR 永远无人处理。" "缺口会由 responder 以合规命名 (\`agent/fn-<数字>\` / \`agent/gap-<数字>\`) 重新派发; 前缀命中但形态不合规者不属本类 (门禁会评估并 skip, 交人工)。")"
    return 0
  fi

  # ---- P2 superseded: 全部变更路径已被 master 合入 ----
  local files_json
  if ! files_json=$(gh api "repos/$REPO/pulls/$num/files?per_page=100" 2>/dev/null); then
    error_row "$num" "$head" "files API 失败 (拉取变更集)"; return 0
  fi
  if ! jq -e 'type == "array"' <<<"$files_json" >/dev/null 2>&1; then
    error_row "$num" "$head" "files 响应非 JSON 数组 (数据异常)"; return 0
  fi
  mapfile -t files < <(jq -r '.[].filename' <<<"$files_json")
  if (( ${#files[@]} > 0 )); then
    local all_exist=1 f
    for f in "${files[@]}"; do
      git cat-file -e "HEAD:$f" 2>/dev/null || all_exist=0
    done
    if (( all_exist == 1 )); then
      act_close "$num" "$head" "P2 superseded" \
        "$(cur_close_comment "P2 superseded" "全部变更文件 (${files[*]}) 在 master 树已存在 — 加性-only 仓里即规则已被其他 PR 抢先合入, 本 PR 为重复交付。" "")"
      return 0
    fi
  fi

  # ---- P3 stale: 动机样本全部出语料窗 ----
  local detail body head_sha head_repo
  if ! detail=$(gh api "repos/$REPO/pulls/$num" 2>/dev/null); then
    error_row "$num" "$head" "PR detail API 失败 (拉取 body/head sha)"; return 0
  fi
  body=$(jq -r '.body // ""' <<<"$detail")
  head_sha=$(jq -r '.head.sha // empty' <<<"$detail")
  head_repo=$(jq -r '.head.repo.full_name // "?"' <<<"$detail")
  if [[ -z "$head_sha" ]]; then
    error_row "$num" "$head" "PR detail 缺 head.sha (数据异常)"; return 0
  fi
  mapfile -t samples < <(extract_samples "$body")
  if (( ${#samples[@]} > 0 )); then
    local gone=0 present=0 uncertain=0 s code
    for s in "${samples[@]}"; do
      if [[ "$s" == *..* ]]; then uncertain=$((uncertain + 1)); continue; fi # 路径含 .. 拒检 (与 T4 同款)
      code=$(head_code "$s")
      case "$code" in
        2??) present=$((present + 1)) ;;
        404) gone=$((gone + 1)) ;;
        *)   uncertain=$((uncertain + 1)) ;; # 5xx/网络 — 数据异常, fail-closed 不动作
      esac
    done
    if (( uncertain > 0 )); then
      error_row "$num" "$head" "样本探测不确定 (5xx/超时 $uncertain 条) — fail-closed 不动作, 下拍重探"
      return 0
    fi
    if (( present == 0 && gone > 0 )); then
      act_close "$num" "$head" "P3 stale" \
        "$(cur_close_comment "P3 stale" "body 动机样本 ${gone} 条对语料仓 raw HEAD 全部 404 — 样本已随语料旋转出窗, CI 绿不可复现, PR 悬置无意义。" "缺口会由 responder 按最新语料重新派发 (dg/fn 剧本以当日样本为动机)。")"
      return 0
    fi
  fi

  if [[ "$draft" != "true" ]]; then
    # ---- P5 skip 聚合 ----
    if [[ ",$labels," == *",$LABEL_SKIP,"* ]]; then
      pending "$num" "$head" "P5: 门禁已标记 \`$LABEL_SKIP\` (非 P2/P3) — 人工处理 (真实 #149 形态之外的 skip 存量)"
      return 0
    fi
    # ---- P4 漏触发重验: 假想评估全过 → 门禁实跑通道 (合并权在门禁) ----
    gate_dry "$num"
    case "$GATE_VERDICT" in
      "ALL PASS")
        if ! budget_left; then defer_row "$num" "$head" "P4 门禁实跑" "断言链全过"; return 0; fi
        MUTATIONS=$((MUTATIONS + 1))
        if [[ "$APPLY" == "1" ]]; then
          # S2: 门禁实跑 exit 0 ≠ 合并成功 (REJECTED / 非对象形态静默退出 / TOCTOU 放弃
          # 同走 exit 0) — 解析 GATE-RESULT 终态行; 缺席或非 MERGED → pulls API 事实核验,
          # 计数只认事实 (MERGED 仅在确认合并时 +1)。
          local gate_out gate_rc=0 gate_res fact merged_now state_now
          # 注意: rc 捕获用 `|| gate_rc=$?` — `if ! cmd; then rc=$?` 的取反会把 $? 归零
          gate_out=$(DRY_RUN=0 PR_NUMBER="$num" REPO="$REPO" GH_TOKEN="$GH_TOKEN" \
            SELF_CHECK_NAME="$SELF_CHECK_NAME" CORPUS_RAW_BASE="$CORPUS_RAW_BASE" \
            WAIT_TIMEOUT_SEC="$GATE_WAIT_SEC" EMPTY_GRACE_SEC="$GATE_EMPTY_GRACE_SEC" POLL_INTERVAL_SEC="$GATE_POLL_SEC" \
            bash "$HERE/auto-merge.sh" 2>&1) || gate_rc=$?
          if (( gate_rc != 0 )); then
            # R4: 失败分支保留输出 — 输出尾部落 job log (审计后备), 不再全弃
            log "P4 #$num 门禁实跑非零退出 (rc=$gate_rc) — 输出尾部落 job log:"
            tail -n 30 <<<"$gate_out" || true
          fi
          gate_res=$(grep -oE 'GATE-RESULT: (MERGED|REJECTED|ABANDONED)' <<<"$gate_out" | tail -1 | cut -d' ' -f2-)
          if [[ "$gate_res" == "MERGED" ]]; then
            MERGED=$((MERGED + 1))
            row "$num" "$head" "P4 漏触发重验" "merge ✅ (经门禁 T6)" "断言链全过 — auto-merge.sh 实跑 (squash+删分支+审计 comment)"
          else
            if fact=$(gh api "repos/$REPO/pulls/$num" 2>/dev/null); then
              merged_now=$(jq -r '.merged // false' <<<"$fact"); state_now=$(jq -r '.state // "?"' <<<"$fact")
            else
              merged_now=""; state_now=""
            fi
            if [[ "$merged_now" == "true" ]]; then
              MERGED=$((MERGED + 1))
              row "$num" "$head" "P4 漏触发重验" "merge ✅ (API 事实核验)" "GATE-RESULT=${gate_res:-缺席} 但 pulls API 确认已合并 — 计数按事实"
            elif [[ -n "$state_now" && "$state_now" != "open" ]]; then
              row "$num" "$head" "P4 漏触发重验" "abandoned" "实跑后 PR 已不在 open 态 (state=$state_now, GATE-RESULT=${gate_res:-缺席}, rc=$gate_rc)"
            elif [[ -z "$state_now" ]]; then
              error_row "$num" "$head" "实跑后事实核验 API 失败 (GATE-RESULT=${gate_res:-缺席}, rc=$gate_rc) — 本拍不计 merge"
            else
              row "$num" "$head" "P4 漏触发重验" "race-after-rejected" "dry 全过后实跑未合并 (GATE-RESULT=${gate_res:-缺席}, rc=$gate_rc, state=open) — 竞态 (两轮 T4 间语料轮转 / T2 间 check 重跑) 或 merge 失败需人工; PR 应已留门禁 skip 痕迹, 下拍重评"
            fi
          fi
        else
          MERGED=$((MERGED + 1))
          row "$num" "$head" "P4 漏触发重验" "would-merge (经门禁 T6)" "断言链全过 — APPLY 将以 DRY_RUN=0 实跑 auto-merge.sh"
          log "would-run: DRY_RUN=0 PR_NUMBER=$num bash auto-merge.sh (门禁实跑通道)"
        fi
        ;;
      REJECTED)
        pending "$num" "$head" "P4: 断言未全过 ($GATE_FAILS) — 门禁拒因见 dry 评估; 交人工"
        ;;
      *)
        error_row "$num" "$head" "门禁 dry 评估无判定: $GATE_VERDICT"
        ;;
    esac
    return 0
  fi

  # ---- P6 draft: flip-ready / re-drive / 待人工 ----
  if (( ${#samples[@]} == 0 )); then
    pending "$num" "$head" "P6: body 未提取到动机样本 — 动机不可验证 (非 P3: P3 要求提取非空), 交人工"
    return 0
  fi
  gate_dry "$num"
  if [[ "$GATE_VERDICT" == "ALL PASS" ]]; then
    # 断言全过 (含 T2 CI 绿) → flip; ready_for_review 触发门禁合并 (未触发由下拍 P4 兜底)
    act_flip "$num" "$head" "断言链全过 + CI 绿 — flip 后由门禁执行合并"
    return 0
  fi
  if [[ "$GATE_VERDICT" == "ERROR"* ]]; then
    error_row "$num" "$head" "门禁 dry 评估无判定: $GATE_VERDICT"; return 0
  fi
  # CI 红/陈旧为唯一断言失败 → re-drive 候选 (还有别的 ❌ = 结构性 blocker, 重跑 CI 无益)
  local state n_fail
  state=$(ci_state "$head_sha")
  n_fail=$(grep -c '❌ T[0-9]' <<<"$GATE_OUT" || true)
  if (( n_fail != 1 )) || [[ "$GATE_FAILS" != *"T2"* ]] || { [[ "$state" != "red" ]] && [[ "$state" != "stale" ]]; }; then
    pending "$num" "$head" "P6: blocker 未消 (CI=$state, 失败断言: $GATE_FAILS) — 交人工"
    return 0
  fi
  if [[ "$head_repo" != "$REPO" ]]; then
    pending "$num" "$head" "P6: head 在 fork ($head_repo) — 无法推空提交, 交人工"
    return 0
  fi
  local now updated_ep age
  now=$(date +%s)
  if ! updated_ep=$(date -d "$updated" +%s 2>/dev/null); then
    error_row "$num" "$head" "updatedAt 解析失败: $updated"; return 0
  fi
  age=$(( now - updated_ep ))
  if (( age <= REDRIVE_MIN_AGE_SEC )); then
    pending "$num" "$head" "P6: CI $state 但静置仅 ${age}s (阈 ${REDRIVE_MIN_AGE_SEC}s) — 等 responder 自愈窗口"
    return 0
  fi
  local cjson n_redrive n_total
  if ! cjson=$(gh api "repos/$REPO/issues/$num/comments?per_page=100" 2>/dev/null); then
    error_row "$num" "$head" "comments API 失败 (re-drive 计数)"; return 0
  fi
  n_total=$(jq 'length' <<<"$cjson")
  if (( n_total >= 100 )); then
    pending "$num" "$head" "P6: comment ≥100 单页枚举不完整 — 计数不可靠, 交人工 (保守不 re-drive)"
    return 0
  fi
  n_redrive=$(jq --arg m "$REDRIVE_MARKER" '[.[] | select(.body | contains($m))] | length' <<<"$cjson")
  if (( n_redrive >= REDRIVE_MAX )); then
    pending "$num" "$head" "P6: re-drive 已达上限 ($n_redrive/$REDRIVE_MAX) 且 CI 仍 $state — 交人工"
    return 0
  fi
  act_redrive "$num" "$head" "CI $state 为唯一断言失败, 静置 ${age}s, re-drive 第 $((n_redrive + 1))/$REDRIVE_MAX 次" "$state" "$((n_redrive + 1))"
  return 0
}

# ---------- 报告 ----------
render_report() { # <agent PR 总数>
  local total=${1:-0}
  printf '# tier-a-reconcile — %s (mode=%s)\n\n' "$(date -u +%FT%TZ)" "$MODE"
  printf -- '- APPLY 判定依据: %s\n' "$APPLY_BASIS"
  printf -- '- 仓 `%s` · agent 前缀 open PR %d 个 · 副作用预算 %d/%d\n' "$REPO" "$total" "$MUTATIONS" "$MAX_MUTATIONS"
  if (( LIST_CAPPED )); then printf -- '- ⚠️ open PR 枚举达上限 500 — 本拍盘点可能不完整, 未枚举部分顺延下一拍\n'; fi
  printf -- '- close=%d flip=%d re-drive=%d merge=%d (mode=%s) · 待人工=%d error=%d 顺延=%d\n' \
    "$CLOSED" "$FLIPPED" "$REDRIVEN" "$MERGED" "$MODE" "${#PENDING[@]}" "${#ERRORS[@]}" "${#DEFERRED[@]}"
  printf '\n## 分类明细\n\n| # | 分支 | 类别 | 动作 | 依据 |\n| --- | --- | --- | --- | --- |\n'
  if (( ${#ROWS[@]} > 0 )); then printf '%s\n' "${ROWS[@]}"; else echo '| (无 agent 前缀 open PR) |  |  |  |  |'; fi
  printf '\n## 待人工\n\n'
  if (( ${#PENDING[@]} > 0 )); then printf '%s\n' "${PENDING[@]}"; else echo '- (无)'; fi
  printf '\n## Errors\n\n'
  if (( ${#ERRORS[@]} > 0 )); then printf '%s\n' "${ERRORS[@]}"; else echo '- (无)'; fi
  printf '\n## 顺延 (副作用预算尽, 下一拍处理)\n\n'
  if (( ${#DEFERRED[@]} > 0 )); then printf '%s\n' "${DEFERRED[@]}"; else echo '- (无)'; fi
}
write_report() { # <agent PR 总数> — reconcile-reports 专属分支追加 (非 force, 不存在则初始化) + job summary
  local ts body work
  ts=$(date -u +%Y%m%dT%H%M%SZ)
  body=$(render_report "$1")
  if [[ -n "${GITHUB_STEP_SUMMARY:-}" ]]; then printf '%s\n' "$body" >> "$GITHUB_STEP_SUMMARY"; fi
  work=$(mktemp -d)
  if ! git clone -q --single-branch --branch "$REPORT_BRANCH" "$REPORT_REMOTE" "$work/rr" 2>/dev/null; then
    # 分支不存在 (或不可达) → 初始化; 推送失败在下方统一报错
    mkdir -p "$work/rr" && git -C "$work/rr" init -q -b "$REPORT_BRANCH" . >/dev/null 2>&1 || true
  fi
  mkdir -p "$work/rr/reconcile"
  printf '%s\n' "$body" > "$work/rr/reconcile/$ts.md"
  git -C "$work/rr" add "reconcile/$ts.md" 2>/dev/null || true
  if ! git -C "$work/rr" -c user.name=tier-a-reconcile -c user.email=tier-a-reconcile@users.noreply.github.com \
    commit -qm "reconcile report $ts (mode=$MODE, close=$CLOSED flip=$FLIPPED redrive=$REDRIVEN merge=$MERGED)" 2>/dev/null; then
    log "WARN: 报告 commit 失败 (无变更?) — job summary 已含全文"
    return 0
  fi
  if ! git -C "$work/rr" push -q "$REPORT_REMOTE" "HEAD:refs/heads/$REPORT_BRANCH" >/dev/null 2>&1; then
    log "ERROR: 报告推送 $REPORT_BRANCH 分支失败 — job summary 已含全文"
    exit 1
  fi
  log "报告已追加: $REPORT_BRANCH 分支 reconcile/$ts.md (mode=$MODE)"
}

# ---------- 主流程 ----------
main() {
  resolve_apply
  log "mode=$MODE repo=$REPO max_mutations=$MAX_MUTATIONS redrive_max=$REDRIVE_MAX"
  local list
  if ! list=$(gh pr list --repo "$REPO" --state open --limit 500 \
    --json number,headRefName,isDraft,labels,updatedAt,title 2>/dev/null); then
    log "FATAL: gh pr list 失败 — 无从盘点, 退出 1 (fail-closed: 不做任何动作)"
    exit 1
  fi
  local total
  total=$(jq 'length' <<<"$list")
  if (( total >= 500 )); then
    LIST_CAPPED=1
    log "WARN: open PR 枚举达上限 500 — 本拍盘点可能不完整, 未枚举部分顺延下一拍"
  fi
  local -a rows=() # 同 classify_one O2: mapfile 填充数组显式局部声明
  mapfile -t rows < <(jq -c 'map(select(.headRefName | startswith("agent/"))) | sort_by(.number) | .[]' <<<"$list")
  log "open PR 共 $total 个, agent/ 前缀 ${#rows[@]} 个 — 开始逐个分类处置"
  local r
  for r in "${rows[@]}"; do
    # classify_one 内部对所有异常显式记 error 并 return 0 (fail-closed 继续); 兜底防意外
    # rc 先落局部变量再展开其余词 — bash 左到右展开, 若同行靠前的 $(jq) 先跑会把 $? 覆盖为 jq 的 rc
    classify_one "$r" || {
      local rc=$?
      error_row "$(jq -r '.number' <<<"$r")" "$(jq -r '.headRefName' <<<"$r")" "classify 意外异常 (rc=$rc)"
    }
  done
  log "完成: close=$CLOSED flip=$FLIPPED re-drive=$REDRIVEN merge=$MERGED 预算 $MUTATIONS/$MAX_MUTATIONS — 落报告"
  write_report "${#rows[@]}"
}
main
