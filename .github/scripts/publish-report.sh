#!/usr/bin/env bash
# publish-report.sh — sweep 报告发布到 reports 孤儿分支 (README 活指标 SSOT)
#
# 职责: 从 summary.json + verdict.json 生成 shields endpoint 徽章数据 (badges/*.json)
#   与完整人类可读报告 (latest.md, 复用 summary-md.jq 渲染 — 零新渲染逻辑), 孤儿
#   单提交强推 reports 分支 (仓体积恒定, 同语料仓 refresh 模式)。README 徽章/链接
#   指向 raw URL, 数字随每周 sweep 自动刷新 — 活文档不手工维护数字 (需求方裁决
#   2026-10-21: 手工刷 README = 重复声明, 同构于已退役的工具枚举行)。
#
# 语义: verdict 红绿照常发布 — 徽章忠实反映 fail (防腐状态公开可见), 红不是不发
#   报告的理由 (报告恰是红的诊断材料)。
#
# 用法: publish-report.sh <summary.json> <verdict.json> <engine_sha> <rules_sha> <corpus_sha> [fn-evidence.json]
#   第 6 参可选: FN 证据摘要 (仅 FN 红 run 产生) — 在场则一并发布到 reports 分支
#   (快照语义: 文件在 ⟺ 本轮有 FN, 孤儿单提交重写天然清除上轮旧文件, 防 agent
#   消费过期证据)。
# 环境: REPO_SLUG (如 luochen1990/log-skimmer-rules) / GITHUB_TOKEN (push 权限) / RUN_URL
#   (脚本可从任意 CWD 调用: summary-md.jq 按脚本自身位置定位)
set -euo pipefail

summary=$1 verdict=$2 esha=$3 rsha=$4 csha=$5 fne=${6:-}
slug=${REPO_SLUG:?REPO_SLUG 必填} run_url=${RUN_URL:-"(run URL 缺失)"}
here=$(cd "$(dirname "$0")" && pwd)
asof=$(date -u +%F)

v=$(jq -r .verdict "$verdict")
[ "$v" = pass ] && vc=green || vc=red # 单一色源: 红绿徽章同判
fn=$(jq -r .stats.fn "$verdict")
rate=$(jq -r .stats.fp_rate_pct "$verdict")
# FP 率徽章文案: <0.01% 阈值化 (裸浮点尾巴 0.0007694% 噪音; 与 CI 判定行 0.00% 相比保留"非零"诚实性)
fp=$(awk -v r="$rate" 'BEGIN { printf (r < 0.01 && r > 0) ? "<0.01" : "%.2f", r }')
sig=$(jq -r .stats.comp_sig_pct "$verdict")
blk=$(jq -r .stats.comp_blk_pct "$verdict")
samples=$(jq -r .structural.samples_total "$summary")
repos=$(jq -r '.per_repo | length' "$summary")

# 徽章: schemaVersion 1 = shields.io endpoint 契约 (README 以
#   ![](https://img.shields.io/endpoint?url=<raw-url-encoded>) 消费)
mkdir -p badges
badge() { # <label> <message> <color> <file-stem>
  jq -n --arg l "$1" --arg m "$2" --arg c "$3" \
    '{schemaVersion: 1, label: $l, message: $m, color: $c}' > "badges/$4.json"
}
badge backtest "$v · $asof" "$vc" verdict
badge corpus "$samples samples · $repos repos" blue corpus
badge quality "FN $fn · FP $fp%" "$vc" quality
badge compression "sig $sig% · blk $blk%" blue compression
# 诊断覆盖率徽章 (引擎 #93 起; 旧引擎 summary 无字段 → pending 占位, publish 后自动就位)
cov_pct=$(jq -r '.diagnostic_coverage.pct // "pending"' "$summary")
badge coverage "diag $cov_pct%" blue coverage

# history.jsonl 指标累积 (跨 orphan 重写存活 — 6h 语料提频的配套裁决: 样本快照
#   滚动即弃, 跨时序积累的是指标历史): 从远端 reports 分支取上一版追加。
#   先于 rules-health.md 渲染执行 — 死规则连续性段消费含本轮的全量历史
#   (追加后的文件 = 既往全部轮次 + 本轮)。
#   dead_rules = 本轮零命中规则 (summary per_rule_hits 值 0 的 id 集; 旧引擎
#   summary 无该字段时按空集 — 与渲染侧旧记录容忍对称)。
prev=$(mktemp -d)
if git clone -q --depth 1 --branch reports   "https://x-access-token:${GITHUB_TOKEN}@github.com/${slug}.git" "$prev" 2>/dev/null; then
  cp "$prev/history.jsonl" history.jsonl 2>/dev/null || true
fi
jq -c --arg ts "${asof}T$(date -u +%H:%M:%SZ)" --arg run "$run_url" --arg verdict "$v" \
  --argjson samples "$samples" --argjson repos "$repos" \
  '{ts: $ts, run: $run, verdict: $verdict, samples: $samples, repos: $repos,
    fn: .totals["fn"], fp_lines: .totals.fp_lines, fp_rate_pct: (.totals.fp_rate_pct * 100 | round / 100),
    comp_blk_pct: .totals.comp_blk_pct, comp_sig_pct: .totals.comp_sig_pct,
    diag_covered: (.diagnostic_coverage.covered // null), diag_total: (.diagnostic_coverage.total // null),
    diag_pct: (.diagnostic_coverage.pct // null),
    dead_rules: [(.per_rule_hits // {}) | to_entries[] | select(.value == 0) | .key],
    grades: ((.per_rule_health // {}) | to_entries | group_by(.value.grade) | map({(.[0].value.grade): length}) | add // {})}' \
  "$summary" >> history.jsonl

# rules-health.md (规则健康浏览面): 每规则六元组 + 分级 + intent 声明核对 +
#   腐化预警 (快照旗标) + 死规则连续性 (history.jsonl 时序) —
#   人逛的总表, 消费入口 = README 徽章链接与 job summary 短段
jq -rn -f "$here/health-md.jq" --slurpfile s "$summary" --slurpfile h history.jsonl > rules-health.md

# latest.md: 头部 (时点/verdict/消费方链回) + summary-md.jq 全量渲染 (同 job summary, DRY)
{
  echo "# log-skimmer 回测报告 (每周自动刷新)"
  echo
  echo "- 时点: $asof · verdict: **$v** · 引擎 \`${esha:0:7}\` · 规则 \`${rsha:0:7}\` · 语料 \`${csha:0:7}\`"
  echo "- 运行记录: $run_url · 消费方: README 徽章 — 本文件即其数据源, 勿手工编辑"
  if [ -n "$fne" ] && [ -f "$fne" ]; then
    echo "- FN 证据: fn-evidence.json — 本轮 FN 样本锚行证据摘要 (agent 迭代环机读源, README §6)"
  fi
  echo
  jq -rn -f "$here/summary-md.jq" --slurpfile s "$summary" --slurpfile v "$verdict"
} > latest.md

# 孤儿单提交强推 reports 分支 (与语料仓同模式: 单提交快照; 唯 history.jsonl 逐轮追加)
work=$(mktemp -d)
git -C "$work" init -q -b reports
cp -r badges latest.md rules-health.md history.jsonl "$work/"
if [ -n "$fne" ] && [ -f "$fne" ]; then cp "$fne" "$work/"; fi
git -C "$work" add -A
git -C "$work" -c user.name=sweep-bot -c user.email=sweep-bot@users.noreply.github.com \
  commit -qm "sweep report $asof (verdict=$v)"
git -C "$work" push -qf "https://x-access-token:${GITHUB_TOKEN:?GITHUB_TOKEN 必填}@github.com/${slug}.git" reports
echo "✅ reports 分支已发布: https://github.com/${slug}/blob/reports/latest.md"
