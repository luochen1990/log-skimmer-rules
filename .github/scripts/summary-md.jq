# summary-md.jq — l0 summary/verdict JSON → markdown job summary (sweep 报告渲染)
#
# 职责边界: 纯渲染 (数据 → markdown), 不做任何判定 — 判定是引擎 gate 的事,
#   本脚本消费其产物。输入是引擎 `l0` 两条输出: --emit-summary 的 summary JSON
#   (引擎 T-P2b-2 起含 exempt_totals / per_repo_breakdown / rule_repo_hits) 与
#   判定模式的 verdict JSON (v 缺席时仅出提示行)。
#
# 用法 (sweep.yml 渲染步):
#   jq -rn -f scripts/summary-md.jq --slurpfile s summary.json --slurpfile v verdict.json
#
# 口径注 (沿用引擎 SSOT, 不在此重复定义):
#   - gated 组 = 断言面 (sidecar 无 gate_exempt 的样本); exempt 组 = 报告面
#     (gate_exempt: true, 指标照算不进断言 — 未适配仓扩容不红的过渡通道);
#   - 逐仓分解行: FN/FP 为诊断视图 (不分 gated/exempt), 零块/边界为全域口径
#     (行和 ≠ 组值和属预期, 混合仓见引擎 l0.rs RepoRow 注释)。

# 百分数两位收敛 (引擎侧 comp_* 已 round2, 此处幂等; fp_rate 未收敛故必须在此收)
def pct: ((. * 100 | round) / 100 | tostring) + "%";

($s[0] // {}) as $s |
($v[0] // {}) as $v |
($s.totals // {}) as $t |
($s.exempt_totals // {}) as $e |
($s.structural // {}) as $st |
($v.compression_compare // {}) as $cmp |
($s.per_rule_hits // {}) as $ph |
($s.rule_repo_hits // {}) as $rr |
([$ph | to_entries[] | select(.value == 0) | .key]) as $dead |

# 文档 = 行数组 (缺席段贡献 empty, 不留空行空洞), 末尾 join 单点输出
[

  # ---- 判定段 (verdict; gate 步意外崩溃时 unavailable 提示) ----
  (if $v.verdict == "pass" then "## 判定: ✅ PASS"
    elif $v.verdict == "fail" then "## 判定: ❌ FAIL"
    else "## 判定: ⚠️ unavailable (gate 步未产出 verdict — 见 run 日志)" end),
  "",
  ("- 对比模式: \(if $cmp.mode then $cmp.mode else "未提供 (verdict 缺席)" end)"),
  (if ($v.violations // []) | length > 0 then
    (["", "### 断言违例 (\(($v.violations | length)) 条)", "",
      "| 类型 | 说明 |", "| --- | --- |"]
     + [($v.violations[] | "| `\(.type)` | \(.note) |")])[]
  else empty end),
  (if ($cmp.regressions // []) | length > 0 then
    (["", "### 压缩率退化 (相对 base 退化 >2%, \($cmp.regressions | length) 仓)", "",
      "| repo | Δ压缩率 | 本周 blk | base blk |", "| --- | --- | --- | --- |"]
     + [($cmp.regressions[] | "| `\(.repo)` | \(.delta_blk_pct | pct) | \(.cur_blk_pct)% | \(.base_blk_pct)% |")])[]
  else empty end),
  (if ($cmp.drift_notices // []) | length > 0 then
    (["", "语料集漂移 (非违例, 人工核对):"] + [($cmp.drift_notices[] | "- \(.)")])[]
  else empty end),

  # ---- gated 组 (断言面) ----
  "", "## gated 组 (断言面)", "",
  "| 样本 | FN | FP率 | FP行 | 零块 | 边界违例 | 压缩 blk | 压缩 sig |",
  "| --- | --- | --- | --- | --- | --- | --- | --- |",
  "| \($t.runs // 0) | \($t["fn"] // 0) | \($t.fp_rate_pct // 0 | pct) | \($t.fp_lines // 0) | \($st.zero_block // 0) | \($st.boundary_violations // 0) | \($t.comp_blk_pct // 0 | pct) | \($t.comp_sig_pct // 0 | pct) |",

  # ---- exempt 组 (报告面) ----
  "", "## exempt 组 (报告面, 不进断言 — 豁免余量 = 逐仓适配进度)", "",
  (if ($st.samples_exempt // 0) > 0 then
    (["豁免样本 \($st.samples_exempt) 对 / 豁免仓 \($st.exempt_repos // 0) 个 (sidecar gate_exempt: true)。", "",
      "| 样本 | FN(镜像) | FP率(镜像) | 零块(镜像) | 压缩 blk | 压缩 sig |",
      "| --- | --- | --- | --- | --- | --- |",
      "| \($e.runs // 0) | \($e["fn"] // 0) | \($e.fp_rate_pct // 0 | pct) | \($st.exempt_zero_block // 0) | \($e.comp_blk_pct // 0 | pct) | \($e.comp_sig_pct // 0 | pct) |"])[]
  else
    ["无豁免样本 — 语料全量入断言 (sidecar 未启用 gate_exempt)。"][]
  end),

  # ---- 规则健康档案 (短段 + 链接; 完整浏览面 = reports 分支 rules-health.md) ----
  (if ($s.diagnostic_coverage // null) != null then
    # trivial 双标签: 引擎将 restating 更名 trivial (过渡期两代引擎并存, 旧标签
    #   产物仍可能出现 — 双值同语义合并计数, 漏任一标签会把安全网计成 0)
    ([$s.per_rule_health // {} | to_entries[] | select(.value.grade == "restating" or .value.grade == "trivial")] | length) as $n_triv |
    ([($s.per_rule_health // {}) | to_entries[] | select(.value.grade == "diagnostic")] | length) as $n_diag |
    ([($s.per_rule_health // {}) | to_entries[] | select(.value.grade == "boundary")] | length) as $n_bnd |
    (["", "## 规则健康档案", "",
      "- 诊断覆盖率: \($s.diagnostic_coverage.covered)/\($s.diagnostic_coverage.total) = \($s.diagnostic_coverage.pct)% (含 ≥1 非 restating/trivial 失败块的失败族样本 — FN 保证有块, 覆盖保证块由内容决定)",
      "- 分级: trivial (原 restating) \($n_triv) (结论复述安全网) / diagnostic \($n_diag) (内容决定, 计覆盖) / boundary \($n_bnd) (断裂带, 人工审)",
      "- 完整健康表 (PPV/Wilson/lift/spec/intent 核对): [reports 分支 rules-health.md](https://github.com/luochen1990/log-skimmer-rules/blob/reports/rules-health.md)"])[]
  else empty end),

  # ---- 逐仓分解 (折叠大表) ----
  "", "<details>",
  "<summary>逐仓分解 (\(($s.per_repo_breakdown // {}) | length) 仓) — 样本/豁免/FN/FP/零块/压缩率</summary>",
  "",
  "| repo | 样本 | 豁免 | FN | FP率 | 零块 | 边界 | 压缩 blk | 压缩 sig |",
  "| --- | --- | --- | --- | --- | --- | --- | --- | --- |",
  ([($s.per_repo_breakdown // {}) | to_entries[]
    | "| `\(.key)` | \(.value.runs) | \(.value.exempt_samples) | \(.value.fn_samples) | \(.value.fp_rate_pct | pct) | \(.value.zero_block) | \(.value.boundary_violations) | \(.value.comp_blk_pct | pct) | \(.value.comp_sig_pct | pct) |"][]),
  "", "注: FN/FP 为诊断视图 (不分 gated/exempt, 看未适配仓离达标多远); 零块/边界为全域口径。",
  "</details>",

  # ---- 规则 × 仓 命中矩阵 (折叠大表) ----
  "", "<details>",
  "<summary>规则 × 仓 命中矩阵 (\($ph | length) 规则) — 命中分布与零命中 (死规则候选)</summary>",
  "",
  "| 规则 | 总命中 | 命中仓分布 (top 8) |", "| --- | --- | --- |",
  ([$ph | to_entries | sort_by(-.value)[]
    | .key as $r
    | (($rr[$r] // {}) | to_entries | sort_by(-.value)) as $repos
    | "| `\($r)` | \($ph[$r]) | \([$repos[:8][] | "\(.key) (\(.value))"] | join(", "))\(if ($repos | length) > 8 then " … +\($repos | length - 8) 仓" else "" end) |"][]),
  "",
  (if ($dead | length) > 0 then
    (["零命中规则 (\($dead | length) 条, dead_rules 候选 — 语料未覆盖的工具或正则失效):"]
     + [$dead[] | "- `\(.)`"])[]
  else
    ["零命中规则: 无 (全部规则在语料上有命中)。"][]
  end),
  "", "总命中口径 = signal fragment ∪ noise 剔除区块, 全样本域 (liveness)。",
  "</details>"
]
| join("\n")
