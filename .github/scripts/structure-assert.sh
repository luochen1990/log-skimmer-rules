#!/usr/bin/env bash
# structure-assert.sh — 规则仓结构断言 SSOT (lint CI 与 `just check` 共用)
#
# 职责: 两条无引擎依赖的结构断言 (逐字源自 lint.yml 原 inline 步, 仅根路径参数化):
#   1. 目录名一致性: 每条规则 tool 字段 == 所在目录名 + <tool-id>/<rule-id>.yaml
#      单层布局 (folksonomy "存在即定义" 的机器强制; 取值不用 yq — runner 未预装,
#      顶层标量 sed 提取在本格式族内无歧义, schema 由引擎加载校验兜底)
#   2. 工具清单守护: README 枚举行已退役 (目录即清单, 免每加工具必冲突);
#      断言 = 枚举行不得回潮 + 顶层目录恒为工具目录 (≥1 规则 yaml)
#
# 用法: structure-assert.sh [ROOT]  (ROOT = 仓树根, 缺省 .; CI 传 checkout 路径)
# 退出码: 0 = 全部通过 / 1 = 存在违例 (::error 行内含文件定位)
set -euo pipefail

ROOT=${1:-.}

fail=0
while IFS= read -r f; do
  rel=${f#"$ROOT"/}
  case $rel in
    */*/*) echo "::error file=$f::布局违例: 规则须为 <tool-id>/<rule-id>.yaml 单层布局"; fail=1 ;;
    */*)
      dir=${rel%%/*}
      tool=$(sed -n 's/^tool:[[:space:]]*//p' "$f" | head -1)
      tool=${tool%%#*}
      tool=$(printf '%s' "$tool" | sed -e "s/^[[:space:]]*//" -e "s/[[:space:]]*$//" -e "s/^['\"]//" -e "s/['\"]$//")
      if [ "$tool" != "$dir" ]; then
        echo "::error file=$f::tool 字段 '$tool' != 所在目录 '$dir'"
        fail=1
      fi
      ;;
    *) echo "::error file=$f::布局违例: 规则须位于 <tool-id>/ 目录下"; fail=1 ;;
  esac
done < <(find "$ROOT" -name '*.yaml' -not -name '_template.yaml' -not -name 'manifest.yaml' -not -path '*/.github/*')
[ "$fail" -eq 0 ] || { echo "目录名一致性/布局断言存在违例 (见上)"; exit 1; }
echo "目录名一致性: 通过 (tool 字段全部 == 所在目录名)"

# README 工具清单已退役 (需求方裁决 2026-10-21: 枚举行是目录的重复声明, 每加工具必冲突):
# 目录即清单 (folksonomy 存在即定义)。断言反转: ① 枚举行不得回潮 (防冲突源复发);
# ② 顶层目录恒为工具目录 (每目录 ≥1 规则 yaml — 无 README 对账后的目录级守护,
#    兼拦"非工具顶层目录"形态, 如曾出现的 scripts/)。
readme="$ROOT/README.md"
if grep -q '当前覆盖 [0-9]* 个工具:' "$readme"; then
  echo "::error file=$readme::README '当前覆盖 N 个工具: ...' 枚举行已退役 (目录即清单) — 枚举是目录的重复声明, 每加工具必产生合并冲突, 勿回潮"
  exit 1
fi
non_tool_dirs=$(for d in "$ROOT"/*/; do
  d=${d%/}
  [ -n "$(find "$d" -maxdepth 1 -name '*.yaml' -not -name '_template.yaml' | head -1)" ] || printf '%s\n' "${d##*/}"
done)
if [ -n "$non_tool_dirs" ]; then
  echo "::error::顶层非工具目录 (无规则 yaml): $(printf '%s ' $non_tool_dirs)— 顶层目录即工具清单, 非工具内容请入 .github/ 或征询"
  exit 1
fi
echo "工具清单守护: 目录即清单, 无枚举行回潮; 顶层目录全部为工具目录"
