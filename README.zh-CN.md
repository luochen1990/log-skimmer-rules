# Log Skimmer 规则库

[English](README.md) | [简体中文](README.zh-CN.md)

CI 日志提取规则集 — 描述「各类工具的失败证据长什么样」(锚行 + 多行扩展), 供 [log-skimmer](https://github.com/luochen1990/log-skimmer) 引擎运行时消费。**社区维护 + Agent 辅助**: 欢迎 PR, AI agent 起草的规则同样欢迎 (请在 attribution 字段声明来源)。

[![backtest](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fluochen1990%2Flog-skimmer-rules%2Freports%2Fbadges%2Fverdict.json)](https://github.com/luochen1990/log-skimmer-rules/blob/reports/latest.md)
[![corpus](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fluochen1990%2Flog-skimmer-rules%2Freports%2Fbadges%2Fcorpus.json)](https://github.com/luochen1990/log-skimmer-rules/blob/reports/latest.md)
[![quality](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fluochen1990%2Flog-skimmer-rules%2Freports%2Fbadges%2Fquality.json)](https://github.com/luochen1990/log-skimmer-rules/blob/reports/latest.md)
[![compression](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fluochen1990%2Flog-skimmer-rules%2Freports%2Fbadges%2Fcompression.json)](https://github.com/luochen1990/log-skimmer-rules/blob/reports/latest.md)

> 活指标: 徽章与 [完整回测报告](https://github.com/luochen1990/log-skimmer-rules/blob/reports/latest.md) 由每周 sweep 自动发布 (`reports` 分支), 数字不手工维护 — 本 README 只做定性描述。每条规则的健康度 (PPV/lift/信息量/分级) 见 [rules-health.md](https://github.com/luochen1990/log-skimmer-rules/blob/reports/rules-health.md)。
>
> 职责边界: 本 README 面向规则贡献者 — 布局速览、字段速览、打标纪律与贡献流程。规则 YAML 格式、状态机语义、L0 统计口径的单一事实来源是引擎仓的 spec ([docs/rule-format.md](https://github.com/luochen1990/log-skimmer/blob/master/docs/rule-format.md)); 本文只做速览与指针。

## 1. 规则集概貌

- 布局: `<tool-id>/<rule-id>.yaml`, 一文件一规则 (如 `nix/nix-eval-error-tree.yaml`)。
- `tool-id` 为 folksonomy 约定名: 无中央注册表, 规则文件的存在即定义 ID (小写字母/数字/连字符)。
- `rule-id` 形如 `<tool-id>-<语义名>`, 全局唯一, 同 id 重复加载报错。
- 工具覆盖面以顶层目录为准 (**目录即清单**, folksonomy 存在即定义 — 不在 README 重复枚举, 免合并冲突)。

## 2. 字段语义速览

| 字段 | 必填 | 默认 | 语义 |
| --- | --- | --- | --- |
| id | 必填 | — | 规则唯一标识, `<tool-id>-<语义名>`, 须以 tool 值为前缀 |
| title | 必填 | — | 一句话人类可读描述 |
| tool | 必填 | — | 工具维度, 与目录名一致 |
| 生效范围 | — | — | 由**存储位置**唯一决定 (spec §1.S): 本仓规则 = 全局层; 项目特异规则住项目仓 `<repo>/.log-skimmer/rules/`。scope/repo 字段已退役, 勿写 |
| patterns | 必填 | — | 状态机 pattern 链 (≥1 项), `patterns[0]` 为锚, 是开块的唯一途径 |
| kind | 必填 | — | `signal` 提取信号片段; `noise` 标记噪音行 (覆盖行从输出中剔除) |
| intent | 选填 | failure | `failure` / `warning` / `info`, 命中对成败判定意味着什么 |
| confidence | 选填 | medium | `high` / `medium` / `low`, 片段继承, 呈现排序参考 |
| category | 选填 | unknown | 封闭枚举 10 值, 信息类别; 省缺即 unknown |
| context | 选填 | before: 0, after: 0 | 输出边界扩展行数 (各 0-10), 只影响输出不参与状态机 |
| attribution | 条件必填 | null | 规则来源声明, Adapter/Agent 生成时必填, 手写规则省略 |

intent 三值与 category 十值的详细判定基准不在本文重复 — 见 spec §1 与引擎仓 docs/category-survey.md。

## 3. 打标纪律

核心原则**宁缺勿错**:

- 错标 (category/intent 与实际不符) 污染查询语义 — 下游按这些字段做程序化过滤, 错标不可检测且误导全局; unknown 只损失该规则自身这一条过滤价值。
- 以下情形一律打 `unknown`: 多因混合无法唯一判类 / 样例不足拿不准 / 回测发现规则命中多类日志 / 类别超出枚举 (属集合演化信号, 在 PR 中记录样例)。
- `kind: noise` 的规则必须缺省 intent; signal 规则 intent 默认 failure, 确认语义分层后才改标 warning 或 info。
- unknown 占比长期 >40% 触发集合审视; unknown 升级具名走 PR 人工确认; flaky 是属性不是类别, 不进 category。

## 4. 贡献流程

1. 复制 `.github/_template.yaml` 起步, 存为 `<tool-id>/<rule-id>.yaml` (模板在 `.github/` 隐藏路径, 引擎加载跳过 — 不进生产规则集)。
2. 头注释写样例溯源: `# samples: <repo>/<run>-<job>, ...` (样本来自 [log-skimmer-corpus](https://github.com/luochen1990/log-skimmer-corpus) 公开语料仓; 头注释是规则↔样本的人工溯源线索)。建议同时写 why 叙事 (锚/扩展正则的匹配依据与宿主前缀容忍考虑), 参考示例: [nix/nix-eval-error-tree.yaml](nix/nix-eval-error-tree.yaml), [bun/bun-error-json.yaml](bun/bun-error-json.yaml)。
3. **本地验证命中** (规则「有用」的唯一守门): 用引擎 CLI 对**带来这条规则的那条真实日志**跑 `log-skimmer skim <样例.log> --rules .` (在本仓根目录执行; 引擎构建方式见 [log-skimmer README](https://github.com/luochen1990/log-skimmer#quick-start)), 确认人类可读输出的块头 (`--- [L..-L..] <rule-id>`) 出现你的规则 id — 即锚行真的命中。corpus 无该工具样本时, PR 的 lint CI 只验证「不添乱」(加载合法 + 回测不退化), **不会**验证新规则能命中 — 本地命中验证是规则有效性的唯一守门步骤。
4. 提 PR — CI 自动校验: 规则加载合法性 + 全语料回测 (FN=0 / FP率≤2% / 零块=0) + 压缩率 master-vs-PR 双测对比 (引擎与语料在双测中同侧, 纯规则变量归因, 退化 >2% 判红)。
5. 规则语法错误 (regex 编译失败/枚举越界/字段约束违例) 在 CI 加载阶段即拦下; 单条规则违例会导致整个规则集拒绝加载 — 第 3 步的验证命令会先在本地暴露加载错误, 贡献者做单样例验证即可, 无需本地跑引擎仓的 `just ci-merge` (重量级全量门禁是引擎维护者的回归工具)。

## 5. CI 门禁分工: lint (PR 时点回归) × sweep (周常驻防腐)

| 门禁 | 触发 | 语义 |
| --- | --- | --- |
| [lint](.github/workflows/lint.yml) | PR / master push | **时点回归**: merge 前校验 — 规则加载 + 全语料断言 + master-vs-PR 压缩率双测 (同引擎同语料, 纯规则变量归因), 回答「这个 PR 是否让现状变差」。规则 PR 的质量门禁由它承担。 |
| [sweep](.github/workflows/sweep.yml) | 周二 03:00 UTC / 手动 | **时点间漂移防腐**: master 规则集 × 最新语料 (周一语料仓刷新后) 全量报告 (job summary: gated/exempt 双组 + 逐仓分解 + 规则×仓矩阵, artifact 存完整 JSON), 并与上次成功 run 对比 (引擎 `--base` 内置口径, 逐仓压缩率相对退化 >2% 判红), 回答「两次 PR 的间隙里, 世界演化是否让 master 悄悄退化」。 |
| [auto-merge](.github/workflows/auto-merge.yml) | PR ready/同步 (仅 `agent/fn-*`) | **Tier A 自动合并**: 机械断言链 (CI 全绿 / 加性-only / 动机样本在场 / 规模上限) 全过的 ready PR 自动 squash 合并, 未过打标交人工 — 断言链与安全论证见 §6 与 `.github/scripts/auto-merge.sh` 头注释。 |

sweep 首跑无上次 artifact 属合法首态 (跳过对比只出报告与断言); 其红是「上周→本周的退化信号」, 归因面为 规则集/引擎/语料 三者时点差的聚合, 需人工分诊。

**规则 bundle 产物**: sweep 每轮同时发布 [rules-bundle.json](https://github.com/luochen1990/log-skimmer-rules/blob/reports/rules-bundle.json) 到 reports 分支 — 全规则**原文透传**单文件, 供无目录枚举能力的消费方 (如浏览器 userscript 经 `raw.githubusercontent.com` 拉取, CORS 干净) 逐条 `(path, yaml)` 喂引擎装载。`rule_count` 以**引擎装载成功数**为准, 与 rules 数组长度在生成时断言; 格式契约 SSOT = [make-rules-bundle.sh 头注释](.github/scripts/make-rules-bundle.sh)。lint 在 PR 时点同步演练生成 (口径断言前置到 merge 前, 不推送)。

## 6. Agent 自动响应 (FN 契约)

master CI 的 FN 红 (失败样本经规则集 skim 后 failure-intent fragment 数为 0) 由**维护者的自动化 agent** 响应, 无需社区处理。agent 与人类贡献者走完全相同的通道 (分支 + PR), 契约如下:

- **产物形态**: 分支 `agent/fn-<run_id>` 的规则 PR 与归因 issue; 所有 PR/issue body 恒含 `dedup-key: run <run_id>` 行 — 既是 agent 的 run 级去重锚 (同一 run 至多响应一次), 也是人眼核对「该 run 是否已被响应过」的锚。规则 PR body 另为**每个覆盖的 FN 样本**含一行 `dedup-sample: <样本路径>` (样本路径 = fn-evidence.json 的 `evidence[].sample` 原样) — sweep 唤醒门控的在途声明 (样本级去重, 见下), 也是人眼核对响应覆盖面的锚。
- **draft → ready 语义**: agent 起草的 PR 以 **draft** 开; CI 绿后 flip 为 **ready**。ready 仅代表 agent 已尽力; 合并判定归 Tier A 门禁的机械断言链 (见下), 语义 review 归人 (Tier B 后置)。
- **机械红线**: agent 永不 merge / approve / force push — merge 族工具不在 agent 的 MCP 白名单 (结构性缺席); 仓侧防线 = Tier A 门禁断言链只放行加性-only 的 agent PR。
- **Tier A 自动合并 (机械断言链, 2026-10-25 裁决)**: ready 的 agent PR 由 [auto-merge](.github/workflows/auto-merge.yml) 门禁评估, 全过才合并: head 本仓 `agent/fn-<run_id>` (fork 同名分支不认) / CI 全绿 (head sha 全部 check-run success, 空集即拒) / **加性-only** (仅新增单层 `<tool>/<rule>.yaml`, 删改/越界路径即拒) / 动机样本仍在语料 (防样本轮换出窗的「空转绿」) / 规模 ≤3 文件且 ≤60 行。任一违例 → label `auto-merge-skipped` + 原因 comment, 交人工。安全论证: 新增规则只增 failure-fragments (FN 只降不升), 隐藏失败须删改既有规则 (被加性-only 排除), FP 被 lint ≤2% 断言封顶 — 最坏情况是废规则进 master, 下一拍 sweep 变红暴露, revert 即愈 (自限性故障)。断言链 SSOT: `.github/scripts/auto-merge.sh` 头注释。
- **迭代上限**: PR CI 连续 3 轮红则停止迭代 — 留 draft 并开 issue 通报卡点, 交人工分诊。

CI 侧数据面: lint 的判定违例明细以 `l0-verdict` artifact 机读产出 (见 §5), 供 agent 迭代环消费; sweep 的 FN 事件另产 **`fn-evidence.json`** — FN 样本锚行证据摘要 (verdict fn detail 样本清单 × 语料通用失败关键词窗口 ±5 行, 每样本 ≤30 行锚行 / 总体积 ≤256KB), 经 `fn-evidence` artifact 与 reports 分支双渠道发布, 供 agent 免语料研判 — **语料永不离 CI runner** (v2 数据面原则)。

唤醒面: sweep 的 FN 事件经**机械门控差集判定** (本拍 FN 样本 − reports 分支上一拍快照 − 在途声明) — 仅出现**未被在途响应覆盖的新 FN 样本**时发 `repository_dispatch` (`event_type: fn-responder-wake`, `client_payload` 含 `run_id` 与新样本清单) 唤醒 agent; 稳态重复红零发送 (下游零 token 消耗), sweep 红门禁本身照红。dispatch 的下游链 = `.github/workflows/fn-wake.yml` 监听 workflow: 其 run 是 agent-service `github_dispatch` 触发器的探测边沿 (runs API 是唯一可轮询 dispatch 面 — events feed 不收录 dispatch 事件), 并把 `client_payload` 原文写到 `fn-wake` 分支 `fn-wake.json` (数据面; 响应器经 raw URL 免认证拉取 — client_payload 不经任何 API 面)。在途声明: 上述 `dedup-sample:` 行, PR open 全程有效, merged 后 **12h 冷却窗**内仍有效 — 防「合了未愈」窗口内重复唤醒; 超窗仍失败 = 升级信号, 声明过期允许重唤醒。门控取数失败一律保守多发 (宁可多唤醒不可静默漏), 实现见 `.github/scripts/fn-dispatch-gate.sh`。

## License

本仓规则与文档以 CC0 1.0 发布 (见 [LICENSE](LICENSE)) — 无版权保留, 可自由复用与再分发。
