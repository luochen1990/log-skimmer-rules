#!/usr/bin/env bash
# corpus-probe.sh — 动机样本提取 + 语料在场性探测 (source-only 共享库, 无执行逻辑)
#
# 职责边界: 提供两个纯函数 (实现自 auto-merge.sh 原地抽出, verbatim 迁移):
#   extract_samples <body>  → stdout: 样本路径每行一条 (去重)。双格式并集:
#     ① 规范格式 dedup-sample: <path> 行 (前向兼容 — responder 若采纳即机读);
#     ② 现行 responder body 形态 — 样本以语料路径形态出现在表格/行文中 (剧本 5a:
#        body 含逐样本路径), 形如 <host>/<owner>/<repo>/<YYYY-MM-DD>/<file>.log[.gz]。
#     body 经参数传入 (各 grep 独立 herestring 供给 — 若共用 stdin, 前一 grep 会把流
#     读光致后者空转); grep 无匹配 exit 1, set -e 下逐个 || true 兜住。
#   head_code <path> → HTTP code (对 $CORPUS_RAW_BASE/<path> --head 探测): 2xx/404
#     即定论返回; 5xx/网络失败重试 2 次 (防语料端瞬态误判), 仍失败则原样返回 —
#     调用方按自身 fail-closed 语义消费 (门禁 T4: 非 2xx 即拒; reconcile P3: 只认
#     404 定论, 5xx/超时视为数据异常不动作)。
#   依赖: 调用方须先定义 CORPUS_RAW_BASE (语料仓 raw HEAD 基址, 默认值见调用方)。
#
# 消费方: auto-merge.sh (T4 样本在场) / reconcile.sh (P3 stale + P6 样本在场前置)。
#   抽出动机 (SSOT): 门禁与 reconcile 必须同一提取/探测语义 — 分叉 = 同一 PR 一边
#   判「样本在场可合并」一边判「样本出窗该关闭」的分类漂移。
# shellcheck shell=bash

extract_samples() { # <body> → stdout: 样本路径每行一条 (去重)
  local body=$1
  {
    { grep -E '^dedup-sample:[[:space:]]*[^[:space:]]+' <<<"$body" || true; } \
      | sed -E 's/^dedup-sample:[[:space:]]*//' | tr -d '`'
    { grep -oE '[A-Za-z0-9][A-Za-z0-9._+~:@-]*/[A-Za-z0-9][A-Za-z0-9._+~:@-]*/[A-Za-z0-9][A-Za-z0-9._+~:@-]*/[0-9]{4}-[0-9]{2}-[0-9]{2}/[A-Za-z0-9][A-Za-z0-9._+~:@-]*\.log(\.gz)?' <<<"$body" || true; } \
      | tr -d '`'
  } | awk '!seen[$0]++'
}

head_code() { # <path> → HTTP code; 2xx/404 即定论, 5xx/网络失败重试 2 次 (防语料端瞬态误拒)
  local url="$CORPUS_RAW_BASE/$1" code=000 _
  for _ in 1 2 3; do
    # curl 失败时 -w 可能仍打印 000, || 赋值兜住 (避免两行 000 拼接)
    code=$(curl -sS -o /dev/null -w '%{http_code}' --max-time 30 --head "$url" 2>/dev/null) || code=000
    case "$code" in 2?? | 404) echo "$code"; return ;; esac
    sleep 3
  done
  echo "$code"
}
