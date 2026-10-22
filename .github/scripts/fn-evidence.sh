#!/usr/bin/env bash
# fn-evidence.sh — sweep FN 证据提取 (fn-responder v2 数据面: 语料永不离
#   CI runner, 内网 agent 只拉 KB 级证据摘要 — 见 README §6 / v2 design.md)
#
# 职责: verdict.json 的 fn 违例 detail (引擎 Vec<FnDetail>: gated 域逐样本
#   清单, 上限 50) 非空时, 对每个 FN 样本从语料提取「失败签名候选窗口」:
#   通用失败关键词行 (尾部优先) + ±5 环形上下文 (选窗策略见 fn-evidence.jq
#   头注), sidecar 元数据 (conclusion) 并入; 空则零产物 (绿 run 合法跳过)。
# 体积护栏: 每样本锚行 ≤CAP 行 · 单行文本 ≤1000 字符 · 总产物 ≤256KB
#   (截断如实记 note, 不静默)。
# 产物契约 (fn-evidence.json, v2 agent 消费面):
#   {fn_total, listed, truncated, note?, evidence: [{repo, sample,
#    input_lines, conclusion, anchors: [{line_no, kw, text}], note?, truncated}]}
# 用法: fn-evidence.sh <corpus_dir> <verdict.json> <out.json>
# 退出码: 0 = 完成 (含无 FN 零产物) / 1 = 内部错误 (调用方降级 warning,
#   证据是辅助产物 — 不得劫持哨兵主链的 verdict/artifact/publish)
set -uo pipefail

corpus=$1 verdict=$2 out=$3
here=$(cd "$(dirname "$0")" && pwd)
[ -s "$verdict" ] || { echo "fn-evidence: verdict 文件缺失或为空: $verdict" >&2; exit 1; }

# 通用失败关键词集 (召回优先, 大小写不敏感): 编译器诊断 error:/error[E..]/
# make ***, 运行时 panic/segmentation fault/core dumped, 测试框架 FAILED/
# ✗/not ok (TAP)/❌ (GHA 测试汇总 emoji, 实测 erlang/otp FN 样本唯一信号),
# 栈痕迹 Traceback/Exception/assert, erlang 崩溃原因 badmatch/badarg/...,
# 进程终局 exit code/exited with/killed/OOM
RE='(?i)error|\{error,|fatal|panic|fail|✗|✘|✕|×|❌|not ok |assert|exception|traceback|undefined reference|make.{2,4}\*\*\*|segmentation fault|sigsegv|core dumped|badmatch|badarg|badrecord|function_clause|case_clause|exit code|exited with|command failed|out of memory|killed'
CAP=30                        # 每样本锚行上限
TOTAL_BUDGET=$((256 * 1024))  # 总产物体积上限 (字节)

# FN detail 提取: [{repo, sample, input_lines}] (sample = 语料根相对路径)
if ! detail_json=$(jq -c '[.violations[] | select(.type == "fn") | .detail[]?]' "$verdict"); then
  echo "fn-evidence: verdict.json 不可解析: $verdict" >&2; exit 1
fi
n=$(jq 'length' <<<"$detail_json")
[[ "$n" =~ ^[0-9]+$ ]] || { echo "fn-evidence: fn detail 计数异常 (n='$n')" >&2; exit 1; }
[ "$n" -gt 0 ] || exit 0 # 无 FN 违例 → 零产物 (绿 run 合法跳过)
fn_total=$(jq -r '.stats.fn // 0' "$verdict")

tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
: > "$tmp/evidence.jsonl"
total=0; listed=0; trunc_total=0
for ((i = 0; i < n; i++)); do
  repo=$(jq -r ".[$i].repo" <<<"$detail_json")
  sample=$(jq -r ".[$i].sample" <<<"$detail_json")
  ilines=$(jq -r ".[$i].input_lines" <<<"$detail_json")
  log="$corpus/$sample"
  conclusion=$(jq -r '.conclusion // "unknown"' "$corpus/${sample%.gz}.json" 2>/dev/null) || conclusion="unknown"
  if [ ! -f "$log" ]; then
    per='{"truncated": false, "note": "日志文件缺失 — 语料 6h 滚动窗口外", "anchors": []}'
  elif ! per=$(jq -rn -f "$here/fn-evidence.jq" --rawfile log <(zcat -f "$log") --arg re "$RE" --argjson cap "$CAP" 2>/dev/null); then
    per='{"truncated": false, "note": "锚行提取失败 (日志读取/解析错误)", "anchors": []}'
  fi
  entry=$(jq -nc --arg repo "$repo" --arg sample "$sample" --argjson ilines "$ilines" \
    --arg conclusion "$conclusion" --argjson per "$per" \
    '{repo: $repo, sample: $sample, input_lines: $ilines, conclusion: $conclusion} + $per')
  size=$(printf '%s' "$entry" | wc -c)
  # 总预算: 首个样本恒收 (保证 FN 事件必有证据), 其余超预算即止; 计量口径
  # = entry 字节 (终态 compact 装配, 产物大小 ≈ entry 之和 + 微量包装)
  if [ $((total + size)) -gt "$TOTAL_BUDGET" ] && [ "$listed" -gt 0 ]; then
    trunc_total=1; break
  fi
  printf '%s\n' "$entry" >> "$tmp/evidence.jsonl"
  total=$((total + size)); listed=$((listed + 1))
done

jq -sc --argjson fn_total "$fn_total" --argjson listed "$listed" --argjson n "$n" \
  --argjson trunc "$trunc_total" \
  '{fn_total: $fn_total, listed: $listed, truncated: ($trunc == 1),
    note: (if $trunc == 1
           then "总预算 256KB 耗尽 — 仅列前 \($listed)/\($n) 个 FN 样本 (引擎 fn detail 本身上限 50)"
           else null end),
    evidence: .}' "$tmp/evidence.jsonl" > "$out"
echo "fn-evidence: $listed/$n FN 样本证据 → $out ($(wc -c < "$out") 字节)"
