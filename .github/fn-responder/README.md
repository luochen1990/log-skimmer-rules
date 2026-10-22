# FN 自动响应 (fn-responder)

> 读者 scope: rules 仓维护者 (理解 FN 事件如何被自动响应、如何 review 响应产物) 与
> agent-service 部署运维 (把本目录的 agent 定义与触发器落到常驻服务上)。
> 规则格式本身的 SSOT 是引擎仓 [docs/rule-format.md](https://github.com/luochen1990/log-skimmer/blob/master/docs/rule-format.md), 本文不重复。

## 这是什么

本仓 master CI (`sweep.yml` 每天 4 次跟拍语料轮换, `lint.yml` on push) 有 FN 硬门禁:
失败样本经规则集 skim 后 failure-intent fragment 数为 0 即红。语料仓
[log-skimmer-corpus](https://github.com/luochen1990/log-skimmer-corpus) 每 6h 轮换,
持续带来新失败样本 — 新工具/新形态的平台注解兜底缺位时, master 会周期性变红。

本目录把「人工 FN 闭环」(历史均值 ~40min: 定位样本 → 读日志 → 判可翻转性 → 写规则
→ 过门禁 → 开 PR) 固化为**常驻自动响应**:

```
agent-service interval 触发器 (每 15min)
  └─ submit fn-responder 任务 (沙箱 + github MCP + 引擎二进制)
       1. 检测   master 分支 sweep/lint conclusion=failure 的最新 run (免认证 API)
       2. 去重   搜本仓 PR/issue 的 dedup-key (同一 run 只响应一次)
       3. 复判   clone corpus+rules, 本地跑 `log-skimmer l0` 重建 FN 事实
       4. 分类   可翻转 (真实工具签名) / 结构性 (守卫 echo·证据不在日志·一次性) / 幽灵 (样本已轮换出窗)
       5. 响应   可翻转 → 起草规则 PR (本地 l0 全绿才开, 永不合并)
                 结构性 → 开 issue 归因 + 豁免提请
                 FP/零块/边界红 → 只报告不写规则
```

## 响应产物约定 (review 指南)

| 产物 | 可识别特征 | 人的动作 |
| --- | --- | --- |
| 规则 PR | 分支 `agent/fn-<run_id>`, 标题 `fix: FN 闭环 — <tool>`, body 含样本锚行证据 + 本地验证链输出 + `dedup-key: run <id>` | review 后人工合并 (agent 永不合并/永不 force push) |
| 归因 issue | 标题 `structural FN: ...`, body 含分类证据 + 豁免提请 (corpus 仓 `projects.yaml` 的 `exempt` 字段是项目级豁免通道, agent 只提请不代改) | 裁决豁免或 close |
| FP 报告 issue | 非 FN 红因 (FP 率/零块/边界/退化) 的证据报告 | 按普通门禁红处理 |

FN 样本分类混合时 (部分可翻转 + 部分结构性) 产出 PR + issue 双件 (逐样本明细在
PR/issue body)。所有 PR/issue body 恒含 `dedup-key: run <id>` 行 — 既是去重锚
(agent 每轮开工前搜它), 也是人眼快速核对「这个 run 是否已被响应过」的锚。

## 防环与限流 (设计事实, 改动前先理解)

- **结构性防环**: agent 只看 `branch=master` 的 run; 自己开的 PR 触发的 run 永不在响应范围。
- **run 级去重**: dedup-key 搜索命中 (open 或 closed) 即跳过 — 同一 run 至多一次响应。
- **轮询上限**: interval 15min (CI 事件不密集); agent 定义带显式 token 预算与轮次上界,
  连续失败 2 次即收卷等下一拍, 不烧预算死磕。
- **复判优先**: 本地 `l0` 判 FN=0 而 CI 红时 (引擎版本偏斜), 报告 verdict_mismatch
  而非硬写规则。

## 部署 (运维)

常驻底座是内部 agent-service 平台 (单用户自持 Agent 执行服务, 沙箱 + MCP 工具面
+ ECA 触发器), 触发面用其内建 interval 触发器 — 无需任何桥接代码。三件套:

1. `agent.json` — 响应 agent 的完整任务定义 (system prompt 即执行剧本), 经
   `register.sh` 幂等注册 (或经 `AGENT_SERVICE_STATIC_AGENTS_DIR` 静态目录装载)。
   由 `build_agent.py` 生成 (system prompt 是长文本, JSON 转义后手工编辑易错 —
   改剧本改 builder 再跑一次, 产物零手工)。
2. `register.sh` — 注册 agent + interval 触发器 + **特权审批行档位收敛** (幂等,
   重跑即换新; agent 定义变化 = 新 uuid, 必须重跑重绑触发器)。档位收敛的缘由:
   agent-service 的信任梯度是两级 — static 装载只免「批」(approval), 落行
   `confirm_mode=per-call` 仍逐条「确认」(每次特权 MCP 调用暂停等人); 无人值守
   responder 必须收敛到 `approved+none` (脚本对 agent 的全部 mcp 审批行幂等执行;
   denied 行是终局, 需控制面撤销后重跑)。
3. 部署侧前置 (服务端配置, 详见维护者内部 runbook): toolCatalog 挂 `github`
   MCP server (PAT 只授权本仓, 工具白名单对齐所部署 github-mcp-server 版本的
   工具名 — v1.14 是 issue_write/issue_read/push_files, 而非 create_issue/get_issue),
   sandboxTools 注入 `git` 与 `log-skimmer` (引擎二进制), 引擎版本与发布面 master
   对齐, rules 仓 master 开分支保护 (require PR — 「永不合并」的机械屏障)。

引擎二进制版本偏斜会让 agent 的本地复判与 CI 判定分叉 (verdict_mismatch 报告会
提示) — 部署侧应随发布面演进更新 sandboxTools 的引擎包。
