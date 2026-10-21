# justfile — 本仓本地快速检查循环 (无引擎依赖, 秒级)
#
# 职责边界: `just check` 覆盖「本地可廉价复现」的校验面 — workflow YAML 解析 /
#   渲染器冒烟 / 结构断言。完整质量门禁 (规则加载 + L0 全语料断言 + 压缩率双测)
#   依赖引擎构建, 由 PR 的 lint CI 承担, 不在此重复。
# 依赖: yq / jq / bash (结构断言脚本 SSOT = .github/scripts/structure-assert.sh)。

# 一键快速检查: workflow YAML 解析 + summary-md.jq 空输入冒烟 + 结构断言
check:
    #!/usr/bin/env bash
    set -euo pipefail
    # 1. workflow YAML 解析 (提前暴露缩进/流标量/重复键类笔误)
    for f in .github/workflows/*.yml; do yq eval '.' "$f" > /dev/null; done
    echo "workflow YAML 解析: OK"
    # 2. 渲染器冒烟 (空输入走全程序路径 — 兜底分支全覆盖; 断言非空输出)
    out=$(jq -rn -f .github/scripts/summary-md.jq --slurpfile s /dev/null --slurpfile v /dev/null)
    [ -n "$out" ]
    echo "summary-md.jq 空输入冒烟: OK"
    # 3. 结构断言 (与 lint CI 同一脚本: 目录名一致性 + README 工具清单守护)
    bash .github/scripts/structure-assert.sh .
