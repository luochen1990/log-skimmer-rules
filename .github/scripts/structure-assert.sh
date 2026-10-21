#!/usr/bin/env bash
# structure-assert.sh — 规则仓结构断言 SSOT (lint CI 与 `just check` 共用)
#
# 职责: 两条无引擎依赖的结构断言 (逐字源自 lint.yml 原 inline 步, 仅根路径参数化):
#   1. 目录名一致性: 每条规则 tool 字段 == 所在目录名 + <tool-id>/<rule-id>.yaml
#      单层布局 (folksonomy "存在即定义" 的机器强制; 取值不用 yq — runner 未预装,
#      顶层标量 sed 提取在本格式族内无歧义, schema 由引擎加载校验兜底)
#   2. README 工具清单守护: "当前覆盖 N 个工具: ..." 宣称集合 == 目录实况 (清点
#      自动化, 杜绝人工数数漂移; 顶层目录即 tool-id — 非工具目录不得出现在顶层)
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

readme="$ROOT/README.md"
line=$(grep -m1 '当前覆盖 [0-9]* 个工具:' "$readme" || true)
if [ -z "$line" ]; then
  echo "::error file=$readme::缺少 '当前覆盖 N 个工具: ...' 清单行 — 工具清单由本断言守护, 须与规则目录实况一致"
  exit 1
fi
n=$(printf '%s' "$line" | sed -n 's/.*当前覆盖 \([0-9]*\) 个工具:.*/\1/p')
claimed=$(printf '%s' "$line" | sed -e 's/.*个工具:[[:space:]]*//' -e 's/。.*//' | tr -d ' ' | tr ',' '\n' | sed '/^$/d' | sort)
actual=$(ls -d "$ROOT"/*/ | sed -e "s|^$ROOT/||" -e 's|/$||' | sort)
ok=1
if [ "$claimed" != "$actual" ]; then
  echo "::error file=$readme::README 工具清单 (<) 与规则目录实况 (>) 不一致:"
  diff <(printf '%s\n' "$claimed") <(printf '%s\n' "$actual") || true
  ok=0
fi
cnt=$(printf '%s\n' "$actual" | grep -c .)
if [ "$n" != "$cnt" ]; then
  echo "::error file=$readme::README 宣称工具数 N=$n != 目录实况 $cnt"
  ok=0
fi
[ "$ok" -eq 1 ] || exit 1
echo "README 工具清单: 与目录实况一致 ($n 个工具)"
