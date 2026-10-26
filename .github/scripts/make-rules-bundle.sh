#!/usr/bin/env bash
# make-rules-bundle.sh — 全规则单文件打包 rules-bundle.json (无目录枚举环境的消费源)
#
# 职责: 把规则仓全部规则**原文**打包为单 JSON, 随 sweep 管线发布到 reports 分支
#   (与 badges/latest.md 同发布通道) — 浏览器 userscript 等消费方经
#   raw.githubusercontent.com 拉取 (CORS 干净), 喂引擎 load_rules_from_sources。
#
# 格式契约 SSOT (生产侧; 消费侧 (web 仓) 引用本注释, 两端不得单方面变更):
#   {
#     "manifest": {
#       "format_version": <int — 取自规则集 manifest.yaml, 无则省略该键>,
#       "min_engine_version": "<string — 取自 manifest.yaml, 无则省略该键>",
#       "rule_count": <int — 引擎装载成功的规则数>,
#       "generated_at": "<ISO8601 UTC>"
#     },
#     "rules": [ { "id": "<tool-id>/<rule-id>", "path": "<原相对路径>", "yaml": "<原文件全文>" } ]
#   }
# 语义要点:
#   - rules[] 是规则原文透传 (校验留给引擎装载期), 不是解析后的结构;
#     消费方逐条取 (path, yaml) 喂 load_rules_from_sources。
#   - id = 相对路径去扩展名 (单层布局 <tool-id>/<rule-id>.yaml 的机械投影)。
#   - rule_count 一律以**引擎装载成功数**为准: 取 `l0 --emit-summary` 产物的
#     per_rule_hits 定义域 (装载规则全集补零, 零命中含 0 值 — 与语料规模无关),
#     与 rules 数组长度一致性在生成时断言。计数**不含** manifest.yaml (166 vs 165
#     口径差异的根源即旧口径把 manifest.yaml 计入 — 本断言是口径漂移的防线)。
#   - 收集语义镜像 engine::load_rules: 递归 *.yaml|*.yml (仅普通文件), 跳隐藏
#     路径 (.github/ 模板等), 剔除**根目录** manifest.yaml, 排序 = 引擎 PathBuf
#     逐组件序 (sort -t/ 字段级比较; 整串字节序在 node ⊂ node-test 这类前缀对
#     上与组件序不同。等价性以单层布局为前提 — structure-assert 守护域; ≥3 层
#     路径会落入 sort 整行 last-resort 比较, 与组件序分歧)。
#     已知镜像差异: 符号链接 (find 不跟随, 引擎跟随) — 仓内无 symlink, 若引入
#     将由口径断言拦下人工分诊。
#
# 用法: make-rules-bundle.sh <rules_dir> <l0_summary.json> <out.json>
#   l0_summary 须产自同一 rules_dir (`log-skimmer l0 --corpus <任意语料> --rules
#   <rules_dir> --emit-summary`; 小语料即可 — per_rule_hits 定义域与语料无关)。
#   依赖 GNU findutils (-printf) + bash ≥ 4 (mapfile) — CI runner 与 nix devShell
#   均满足, macOS 手跑会挂。
# 退出码: 0 = 产出 bundle / 1 = 缺参或口径不一致 (CI 红 — 缺产不得静默)
set -euo pipefail

[ $# -eq 3 ] || { echo "用法: $0 <rules_dir> <l0_summary.json> <out.json>" >&2; exit 1; }
rules_dir=$1 summary=$2 out=$3
[ -d "$rules_dir" ] || { echo "规则目录不存在: $rules_dir" >&2; exit 1; }
[ -f "$summary" ] || { echo "l0 summary 不存在: $summary (须产自同一规则树)" >&2; exit 1; }

# 收集 (镜像 engine::collect_yaml_files + 根 manifest 剔除):
#   -name '.*' -prune = 隐藏路径整枝跳过 (文件/目录皆然); -type f = 目录名形如
#   *.yaml 不误收; %P = 相对 rules_dir 路径; -t/ 字段级排序 = 引擎 PathBuf 逐组件序
mapfile -t files < <(
  find "$rules_dir" -mindepth 1 \( -name '.*' -prune \) -o \
    \( -type f \( -name '*.yaml' -o -name '*.yml' \) -printf '%P\n' \) \
    | grep -v '^manifest\.yaml$' | LC_ALL=C sort -t/ -k1,1 -k2,2
)
[ "${#files[@]}" -gt 0 ] || { echo "$rules_dir: 收集到 0 条规则 (引擎同判空集失明)" >&2; exit 1; }

# 引擎装载成功数 (口径 SSOT): per_rule_hits 定义域 = 装载全集, 长度即装载数
engine_n=$(jq -r '.per_rule_hits | length' "$summary")
[ "$engine_n" -eq "${#files[@]}" ] || {
  echo "口径不一致: 引擎装载 $engine_n vs 本脚本收集 ${#files[@]} — 收集镜像与引擎 collect 语义漂移, 或 summary 非同一规则树" >&2
  exit 1
}

# manifest 字段 (顶层标量 sed 提取 — 与 structure-assert.sh 同款约定: runner 无
# yq, 本格式族无歧义; schema 由引擎 manifest::check 兜底)。缺文件/缺键 → 空 →
# 省略键: 缺文件时 sed 报非零会让 set -e 静默中止 (pipefail 传播), /dev/null 兜
# 底保证走"空值省略"路径; fv/mev 同款清洗 (带引号形态/行尾注释都归一)。
mf="$rules_dir/manifest.yaml"
[ -f "$mf" ] || mf=/dev/null
fv=$(sed -n 's/^format_version:[[:space:]]*//p' "$mf" | head -1)
mev=$(sed -n 's/^min_engine_version:[[:space:]]*//p' "$mf" | head -1)
fv=${fv%%#*}; mev=${mev%%#*}
fv=$(printf '%s' "$fv" | tr -d "\"' "); mev=$(printf '%s' "$mev" | tr -d "\"' ")

# 逐文件条目: id = 去扩展名; yaml = 原文全文 (jq --rawfile 字节级透传, 免 shell 改写)
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
for rel in "${files[@]}"; do
  jq -cn --arg id "${rel%.*}" --arg path "$rel" --rawfile yaml "$rules_dir/$rel" \
    '{id: $id, path: $path, yaml: $yaml}' >> "$tmp/entries.ndjson"
done
dup=$(jq -rs 'group_by(.id) | map(select(length > 1)) | length' "$tmp/entries.ndjson")
[ "$dup" -eq 0 ] || { echo "id (路径投影) 重复 — 同 stem 双扩展形态须人工分诊" >&2; exit 1; }

# 装配: manifest 键序 = 契约序; null 值键省略 (with_entries), 数组序 = 路径字节序
jq -s --argjson fv "${fv:-null}" --arg mev "${mev:-}" --argjson rc "$engine_n" \
  --arg ts "$(date -u +%Y-%m-%dT%H:%M:%SZ)" '
  { manifest: { format_version: $fv,
                min_engine_version: (if $mev == "" then null else $mev end),
                rule_count: $rc, generated_at: $ts } | with_entries(select(.value != null)),
    rules: . }' "$tmp/entries.ndjson" > "$out"

# 终态断言: 产出物与引擎口径一致 (装配事故防线, 不信任中间变量)
[ "$(jq '.rules | length' "$out")" -eq "$engine_n" ] || {
  echo "装配事故: 产出 rules 数 != 引擎装载数 ($engine_n)" >&2; exit 1
}
echo "rules-bundle.json: $engine_n 规则 → $out ($(wc -c < "$out") B)"
