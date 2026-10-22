# fn-evidence.jq — 单 FN 样本锚行提取 (fn-evidence.sh 每样本调用一次)
#
# 职责: 原始日志全文 → 失败签名候选窗口的锚行清单 {line_no, kw, text}。
# 选行策略 (CI 日志形态驱动, 召回优先 — 锚行证据供人/LLM 研判, 噪音锚行
#   可容忍, 漏掉真信号不可容忍):
#   1. 关键词行本身优先入选, **尾部优先** — CI 失败裁决常在日志末尾,
#      头部命中多为配置回显噪音 (实测 erlang/otp FN 样本: 头部 error: 是
#      交互式 prompt 回显, 真信号 ❌ 汇总行在尾部);
#   2. 再按 ±1..±5 环形扩展上下文, 每环仍是尾部关键词优先, 直至耗尽每样本
#      锚行上限 (环形交错 = 上下文在各关键词间均匀分布, 而非先到先得);
#   3. 去重保序 — 候选序即优先级序, 前 cap 行即最终锚行;
#   4. 零命中 → 尾部 10 行 fallback (真正的"通用关键词全失配"恰是 FN 的
#      顽因, 尾部 fallback 保证产物仍有研判价值)。
# 输入: --rawfile log (日志全文, .log/.log.gz 由调用方 zcat 归一)
#       --arg re (关键词正则, 已含 (?i)) / --argjson cap (每样本锚行上限)
# 输出: {truncated, note, anchors} — truncated = 有候选/关键词未尽收录
def dedup: reduce .[] as $x ([]; if index($x) then . else . + [$x] end);

# 行数组: 去尾随换行残段 + CRLF 归一 (行号与引擎 normalize_lines 口径对齐)
($log | if endswith("\n") then .[:-1] else . end | split("\n") | map(sub("\r$"; ""))) as $L
# 关键词行号 (1-based); >30 只保留尾部 30 行参与选窗 (锚行预算内 30 已是上限)
| ([ $L | to_entries[] | select(.value | test($re)) | (.key + 1) ]) as $kws
| ( $kws[-30:] | reverse ) as $kr
| if ($kws | length) == 0 then
    { truncated: false,
      note: "零通用失败关键词命中 — 尾部 10 行 fallback (真失配恰是 FN 顽因, 需定制模式)",
      anchors: ( [ range((([($L | length) - 10, 0] | max) + 1); ($L | length) + 1) ]
                  | map(. as $ln | {line_no: $ln, kw: false, text: ($L[$ln - 1] | .[0:1000])}) ) }
  else
    ( [ $kr[] as $k | range(0; 6) as $d | [$k - $d, $k + $d] ] | flatten
      | map(select(. >= 1 and . <= ($L | length))) | dedup ) as $cand
    | { truncated: (($cand | length) > $cap or ($kws | length) > ($kr | length)),
        note: (if ($kws | length) > ($kr | length)
               then "关键词命中 \($kws | length) 行 (>30) — 仅按尾部 30 行选窗" else null end),
        anchors: ( $cand[0:$cap]
                   | map(. as $ln | {line_no: $ln,
                                      kw: ($kws | index($ln) != null),
                                      text: ($L[$ln - 1] | .[0:1000])}) ) }
  end
