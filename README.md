# Log Skimmer 规则库

CI 日志提取规则集 — 描述「各类工具的失败证据长什么样」(锚行 + 多行扩展), 供 [log-skimmer](https://github.com/luochen1990/log-skimmer) 引擎运行时消费。**社区维护 + Agent 辅助**: 欢迎 PR, AI agent 起草的规则同样欢迎 (请在 attribution 字段声明来源)。

> 职责边界: 本 README 面向规则贡献者 — 布局速览、字段速览、打标纪律与贡献流程。规则 YAML 格式、状态机语义、L0 统计口径的单一事实来源是引擎仓的 spec ([docs/rule-format.md](https://github.com/luochen1990/log-skimmer/blob/master/docs/rule-format.md)); 本文只做速览与指针。

## 1. 规则集概貌

- 布局: `<tool-id>/<rule-id>.yaml`, 一文件一规则 (如 `nix/nix-eval-error-tree.yaml`)。
- `tool-id` 为 folksonomy 约定名: 无中央注册表, 规则文件的存在即定义 ID (小写字母/数字/连字符)。
- `rule-id` 形如 `<tool-id>-<语义名>`, 全局唯一, 同 id 重复加载报错。
- 当前覆盖 15 个工具: bun, cargo, eslint, forgejo-actions, git, github-actions, just, nim, nix, nixfmt, playwright, rust, rustc, systemd, treefmt。

## 2. 字段语义速览

| 字段 | 必填 | 默认 | 语义 |
| --- | --- | --- | --- |
| id | 必填 | — | 规则唯一标识, `<tool-id>-<语义名>`, 须以 tool 值为前缀 |
| title | 必填 | — | 一句话人类可读描述 |
| tool | 必填 | — | 工具维度, 与目录名一致 |
| scope | 必填 | — | `global` 或 `repo`, 规则是否仅作用于单一仓库 |
| repo | 条件必填 | null | scope 为 repo 时必填, `host/owner/repo` 完整形态; global 时必须为 null |
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
3. 提 PR — CI 自动校验: 规则加载合法性 + 全语料回测 (FN=0 / FP率≤2% / 零块=0) + 压缩率 master-vs-PR 双测对比 (引擎与语料在双测中同侧, 纯规则变量归因, 退化 >2% 判红)。
4. 规则语法错误 (regex 编译失败/枚举越界/字段约束违例) 在 CI 加载阶段即拦下; 单条规则违例会导致整个规则集拒绝加载, 提交前建议本地跑引擎仓的 `just ci-merge` 验证。

## License

Apache-2.0 (规则集与文档, 见 [LICENSE](LICENSE))。
