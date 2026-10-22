#!/usr/bin/env bash
# register.sh — FN 响应自动化的幂等注册脚本 (agent-service 侧一次性引导)
#
# 职责: 把 agent.json 定义注册进 agent-service (幂等 — 内容寻址, 同定义同 uuid),
#       并注册 interval 触发器 (每 15min 一拍 → submit invoke 响应任务)。
#       触发器 id 由服务端生成, 故幂等 = 先删除指向本 agent 的既有同类规则再建。
#
# 用法:  AGENT_SERVICE_URL=http://127.0.0.1:8300 bash .github/fn-responder/register.sh
#        (缺省 http://127.0.0.1:8300; agent-service 无认证, loopback 绑定是唯一网络边界)
#
# 前置 (缺失时本脚本报错退出, 详见 README 部署节):
#   - 服务端 toolCatalog 有名为 "github" 的 MCP server (github-mcp-server, PAT 只授权 rules 仓)
#   - 服务端 sandboxTools 注入 git 与 log-skimmer (引擎二进制)
#   - 模型 "glm-5.3" 在部署的 LLM 网关可用
#
# 备选轨: 静态 agent 目录 (AGENT_SERVICE_STATIC_AGENTS_DIR 指向物化的 agent.json,
#         30s 轮询装载) — 此时第 1 步可跳过, 只需第 2 步注册触发器 (AGENT_ID 用
#         GET /v1/agents/catalog 查 name=="log-skimmer-fn-responder" 的条目)。
set -euo pipefail

URL=${AGENT_SERVICE_URL:-http://127.0.0.1:8300}
HERE=$(cd "$(dirname "$0")" && pwd)
EVERY_S=${FN_RESPONDER_INTERVAL_S:-900}   # ≥900s: CI 事件不密集, 轮询上限纪律

command -v curl >/dev/null || { echo "缺 curl" >&2; exit 1; }
command -v jq >/dev/null || { echo "缺 jq" >&2; exit 1; }

# 1. 注册 agent (幂等: 同参数必得同一 uuid)
AGENT_ID=$(curl -sf "$URL/v1/agents" \
  -H 'content-type: application/json' \
  --data-binary @"$HERE/agent.json" | jq -r .agent_id)
echo "agent_id: $AGENT_ID"

# 1.5 特权审批行档位收敛 (幂等): 落行 confirm_mode 恒 per-call (api→pending 待批,
#     static→approved 但逐条确认) — 无人值守 responder 需要长期信任档 none, 否则每次
#     特权 MCP 调用都暂停等人 (首夜实证: 4 任务积压)。本脚本 = 部署者意志的显式
#     断言: 信任本定义引用的全部 mcp 条目。denied 行是终局 (无 API 可翻), 报错指路。
for row in $(curl -sf "$URL/v1/approvals" | jq -c --arg aid "$AGENT_ID" \
  '.approvals[] | select(.agent_id==$aid and .kind=="mcp")'); do
  RID=$(echo "$row" | jq -r .id)
  STATE=$(echo "$row" | jq -r .state)
  MODE=$(echo "$row" | jq -r .confirm_mode)
  ENTRY=$(echo "$row" | jq -r .entry_name)
  if [ "$STATE" = "denied" ]; then
    echo "审批行 $ENTRY 为 denied (终局, 无 API 可翻) — 在控制面撤销决策后重跑本脚本" >&2
    exit 1
  fi
  if [ "$STATE" != "approved" ] || [ "$MODE" != "none" ]; then
    [ "$STATE" = "approved" ] && curl -sf -X DELETE "$URL/v1/approvals/$RID" -o /dev/null # revoke → pending
    curl -sf -X POST "$URL/v1/approvals/$RID" -H 'content-type: application/json' \
      -d '{"decision": "approve", "confirm_mode": "none"}' -o /dev/null
    echo "审批行 $ENTRY: $STATE/$MODE → approved/none (长期信任)"
  fi
done

# 2. 触发器幂等重整: 删除指向本 agent 的既有 submit 规则 (服务端生成 id, 按 payload 归属识别)
#    删除失败显式中止 — 残留旧规则会造成双触发, 宁可失败重跑不可静默叠加
for tid in $(curl -sf "$URL/v1/triggers" | jq -r \
  --arg aid "$AGENT_ID" \
  '.triggers[] | select(.action.type=="submit"
      and .action.template.kind=="invoke"
      and .action.template.payload.agent_id==$aid) | .id'); do
  curl -sf -X DELETE "$URL/v1/triggers/$tid" -o /dev/null || {
    echo "旧触发器删除失败: $tid — 中止 (防双触发), 排查后重跑本脚本" >&2
    exit 1
  }
  echo "旧触发器已删: $tid"
done

# 3. 注册 interval 触发器 (armed always; budget 走 agent 定义的 default_budget_tokens)
#    注: agent 定义变化 = 新 agent_id = 触发器模板失效 (agent_not_found) — 重跑本脚本重绑
TRIGGER=$(curl -sf "$URL/v1/triggers" \
  -H 'content-type: application/json' -d '{
  "when": {"type": "interval", "every_s": '"$EVERY_S"'},
  "action": {
    "type": "submit",
    "template": {
      "kind": "invoke",
      "agent_key": "'"$AGENT_ID"'",
      "payload": {"agent_id": "'"$AGENT_ID"'", "input": {}, "share_net": true}
    }
  },
  "armed": "always"
}')
echo "$TRIGGER" | jq '{id, armed, when, action}'

echo
echo "完成。验收: GET $URL/v1/tasks?agent_key=$AGENT_ID 观察下一拍的巡检任务;"
echo "改配置重跑本脚本即幂等换新 (agent 定义变化 = 新 uuid = 需重跑本脚本重绑触发器)。"
