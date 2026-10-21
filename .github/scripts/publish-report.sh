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
# 用法: publish-report.sh <summary.json> <verdict.json> <engine_sha> <rules_sha> <corpus_sha>
# 环境: REPO_SLUG (如 luochen1990/log-skimmer-rules) / GITHUB_TOKEN (push 权限) / RUN_URL
#   (脚本可从任意 CWD 调用: summary-md.jq 按脚本自身位置定位)
set -euo pipefail

summary=$1 verdict=$2 esha=$3 rsha=$4 csha=$5
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

# latest.md: 头部 (时点/verdict/消费方链回) + summary-md.jq 全量渲染 (同 job summary, DRY)
{
  echo "# log-skimmer 回测报告 (每周自动刷新)"
  echo
  echo "- 时点: $asof · verdict: **$v** · 引擎 \`${esha:0:7}\` · 规则 \`${rsha:0:7}\` · 语料 \`${csha:0:7}\`"
  echo "- 运行记录: $run_url · 消费方: README 徽章 — 本文件即其数据源, 勿手工编辑"
  echo
  jq -rn -f "$here/summary-md.jq" --slurpfile s "$summary" --slurpfile v "$verdict"
} > latest.md

# 孤儿单提交强推 reports 分支 (与语料仓同模式: 无历史累积, 体积恒定)
work=$(mktemp -d)
git -C "$work" init -q -b reports
cp -r badges latest.md "$work/"
git -C "$work" add -A
git -C "$work" -c user.name=sweep-bot -c user.email=sweep-bot@users.noreply.github.com \
  commit -qm "sweep report $asof (verdict=$v)"
git -C "$work" push -qf "https://x-access-token:${GITHUB_TOKEN:?GITHUB_TOKEN 必填}@github.com/${slug}.git" reports
echo "✅ reports 分支已发布: https://github.com/${slug}/blob/reports/latest.md"
