# health-md.jq — l0 summary JSON → rules-health.md (规则健康浏览面, reports 分支产物)
#
# 职责边界: 纯渲染 (数据 → markdown), 语义 SSOT = 引擎 l0.rs 模块注释 (分级/
#   ppv/lift/spec 定义与阈值), 本文只渲染。输入 = 引擎 `l0 --emit-summary` 的
#   summary JSON + history.jsonl 全量 (含本轮 — 脚本先追加后渲染); 旧引擎产物
#   无健康字段时输出缺席提示 (不空表); 旧 history 记录无 dead_rules 按无死规则处理。
#
# 用法: jq -rn -f health-md.jq --slurpfile s summary.json --slurpfile h history.jsonl
#   (与 summary-md.jq 同模式; 本文件是 standalone 文档渲染器, 消费面 = reports
#   分支 rules-health.md — 人逛的健康度总表, summary-md.jq 只放短段 + 链接)

def f3: ((. * 1000 | round) / 1000 | tostring);  # ppv/lo/lift 三位收敛 (浮点尾巴治理)

def link($r; $t):
  # 目录名 = tool 字段 (规则 id 含连字符不可逆推; 引擎 RuleHealth.tool, #93 起)
  "[`\($r)`](https://github.com/luochen1990/log-skimmer-rules/blob/master/\($t)/\($r).yaml)";

def dead_streak($hist; $r):
  # 连续死王轮数: 从最新记录 (数组尾) 往回数规则在 dead_rules 连续在场数,
  #   首个不在场记录即截断; 旧记录无 dead_rules 按无死规则 (null-guard)
  [ $hist | reverse[] | (((.dead_rules // []) | index($r)) != null) ]
  | (index(false) // length);

($s[0] // {}) as $s |
($s.per_rule_health // null) as $hh |
($s.per_rule_fire // {}) as $fire |
($s.diagnostic_coverage // null) as $cov |

if $hh == null then
  "# 规则健康档案\n\n本报告由旧引擎产出 (无健康字段) — 引擎 master 合入 l0 健康档案后下一轮 sweep 自动生效。"
else
  ($hh | to_entries) as $rules |
  ([$rules[] | select(.value.grade == "restating")] | length) as $n_rest |
  ([$rules[] | select(.value.grade == "diagnostic")] | length) as $n_diag |
  ([$rules[] | select(.value.grade == "boundary")] | length) as $n_bnd |
  ([$rules[] | select(.value.intent == "info" and ((.value.lift > 1.2) or (.value.lift < 0.8))) | .key]) as $bad_info |
  ([$rules[] | select(.value.intent == "failure" and (($fire[.key].fire_success // 0) > 0)) | .key]) as $fp_form |
  # 腐化预警旗标 (failure-intent 限定): 可靠度崩塌 / 与结论解相关
  ([$rules[] | select(.value.intent == "failure" and .value.ppv_lo < 0.5
           and (($fire[.key].fire_failure + $fire[.key].fire_success) >= 20))]) as $rot_ppv |
  ([$rules[] | select(.value.intent == "failure" and (.value.lift > 0.8) and (.value.lift < 1.2)
       and ((($fire[.key].fire_failure // 0) + ($fire[.key].fire_success // 0)) >= 20))]) as $rot_lift |
  # 死规则连续性: 曾死者取全历史最近连续在场轮数, ≥3 为死王 (锚失效腐化信号)
  (($h // [])) as $hist |
  ([[ $hist[] | .dead_rules // [] | .[] ] | unique[]
     | . as $r | {id: $r, n: dead_streak($hist; $r)} | select(.n >= 3)]
     | sort_by(-.n)) as $dead_kings |
  # 旗标条目行 (两旗标同格式: 链接 + a/b + ppv(lo) + lift)
  def rot_line:
    .key as $r | .value as $hv
    | "  - \(link($r; $hv.tool)): a/b=\($fire[$r].fire_failure // 0)/\($fire[$r].fire_success // 0) ppv=\($hv.ppv | f3) (lo \($hv.ppv_lo | f3)) lift=\($hv.lift | f3)";
  [ "# 规则健康档案 (每轮 sweep 自动刷新)",
    "",
    "- 诊断覆盖率: **\($cov.covered)/\($cov.total) = \($cov.pct)%** — 含 ≥1 诊断规则失败块的失败族样本占比",
    "- 分级: restating \($n_rest) / diagnostic \($n_diag) / boundary \($n_bnd) (共 \($rules | length) 条触发规则; 死规则见 job summary)",
    "",
    "## 怎么读",
    "",
    "- **a / b**: 失败族 / 成功样本命中数 (样本级)",
    "- **PPV (lo95)**: P(失败|触发) 及 Wilson 95% 下界 — 触发推出失败的可靠度; b=0 时 PPV=1.0, 下界随样本量增长",
    "- **lift**: PPV / 失败基率 — 与结论的相关性 (1.0 = 独立; info 常数规则应 ≈1.0)",
    "- **spec**: -log2(a/N_f) 比特 — 触发携带的样本信息量 (选择性; 0 = 处处触发零信息)",
    "- **分级**: restating = 触发由结论决定 (安全网, 不计覆盖); diagnostic = 内容决定 (计覆盖); boundary = 断裂带/异常 (人工审, 暂计覆盖)",
    "",
    "## 全规则健康表 (spec 降序)",
    "",
    "| 规则 | intent | a | b | PPV (lo95) | lift | spec | 分级 |",
    "| --- | --- | --- | --- | --- | --- | --- | --- |",
    ([$rules | sort_by(-.value.spec_bits)[]
      | .key as $r | .value as $h | ($fire[$r] // {}) as $f
      | "| \(link($r; $h.tool)) | \($h.intent) | \($f.fire_failure // 0) | \($f.fire_success // 0) | \($h.ppv | f3) (\($h.ppv_lo | f3)) | \($h.lift | f3) | \($h.spec_bits)b | \($h.grade) |"][])
  ]
  + (if $n_bnd > 0 then
      ["", "## boundary / 异常 (人工审)", "",
       "断裂带规则 (P_f ∈ (0.2, 0.8)) 或纯成功触发 (FP 形态) — 分布中不应存在, 出现即审:",
       ([$rules[] | select(.value.grade == "boundary")
         | .key as $r | .value as $h
         | "- \(link($r; $h.tool)): a/b=\($fire[$r].fire_failure)/\($fire[$r].fire_success) ppv=\($h.ppv | f3) lift=\($h.lift | f3) — intent=\($h.intent) 声明"][])]
    else
      ["", "## boundary / 异常 (人工审)", "", "无 — 分级分布健康。"]
    end)
  + (["", "## 腐化预警", "", "failure 规则的个体腐化快照 (连续性视角见下节):"]
     + (if ($rot_ppv | length) > 0 then
         ["- ppv_lo < 0.5 (证据量 a+b≥20 才参评 — 小样本 Wilson 下界天然低, 非崩塌) — 触发推出失败的可靠度崩塌 (锚过宽或形态漂移):",
          ($rot_ppv[] | rot_line)]
       else [] end)
     + (if ($rot_lift | length) > 0 then
         ["- 0.8 < lift < 1.2 且 a+b ≥ 20 — 与结论解相关 (failure 规则应与失败正相关; lift≈1 = 常数化, 锚退化成了背景噪音; info 规则本应 lift≈1 故不在列):",
          ($rot_lift[] | rot_line)]
       else [] end)
     + (if (($rot_ppv | length) == 0 and ($rot_lift | length) == 0) then
         ["无 — 个体健全。"]
       else [] end))
  + (["", "## 死规则连续性", ""]
     + (if ($dead_kings | length) > 0 then
         ["连续 ≥3 轮零命中 (per_rule_hits==0 连续在场; 锚随上游形态漂移失效, 候选重锚/退役):",
          ($dead_kings[] | "- `\(.id)`: 连续 \(.n) 轮零命中")]
       else
         ["无连续 ≥3 轮死规则。"]
       end))
  + (["", "## intent 声明 vs 统计核对", "",
     "- info 规则应 lift ≈ 1.0 (触发与结论独立); 偏离 >20% 列出:"]
    + (if ($bad_info | length) > 0 then
        [$bad_info[] | "- \(link(.; $hh[.].tool)): lift=\($hh[.].lift | f3) — 快照性存疑"]
      else
        ["- (全部 info 规则独立性与声明相符)"]
      end)
    + ["- failure 规则 b>0 (成功样本触发) = FP 形态/容忍子失败边界:"]
    + (if ($fp_form | length) > 0 then
        [$fp_form[] | "- \(link(.; $hh[.].tool)): b=\($fire[.].fire_success), ppv=\($hh[.].ppv | f3)"]
      else
        ["- (全部 failure 规则 b=0, 个体健全)"]
      end))
  | join("\n")
end
