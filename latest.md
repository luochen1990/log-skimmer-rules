# log-skimmer 回测报告 (每周自动刷新)

- 时点: 2026-11-20 · verdict: **fail** · 引擎 `0efc7e7` · 规则 `f6ac235` · 语料 `013b713`
- 运行记录: https://github.com/luochen1990/log-skimmer-rules/actions/runs/44827623318 · 消费方: README 徽章 — 本文件即其数据源, 勿手工编辑
- FN 证据: fn-evidence.json — 本轮 FN 样本锚行证据摘要 (agent 迭代环机读源, README §6)
- 规则 bundle: rules-bundle.json (375 规则) — userscript 消费源 (README §5)

## 判定: ❌ FAIL

- 对比模式: dual-run compare

### 断言违例 (1 条)

| 类型 | 说明 |
| --- | --- |
| `fn` | failed samples with zero failure-intent fragments (complete miss; recall-priority invariant) |

语料集漂移 (非违例, 人工核对):
- github.com/ClickHouse/ClickHouse: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/Homebrew/brew: only 2 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/anomalyco/opencode: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/ant-design/ant-design: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/apache/kafka: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/astral-sh/ruff: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/bitcoin/bitcoin: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/curl/curl: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/django/django: only 1 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/dotnet/runtime: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/duckdb/duckdb: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/flutter/flutter: only 2 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/grafana/loki: only 2 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/grpc/grpc-go: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/haskell/cabal: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/laravel/framework: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/moby/moby: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/neovim/neovim: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/openssl/openssl: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/oven-sh/bun: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/phpstan/phpstan: only 1 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/pnpm/pnpm: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/psf/black: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/scikit-learn/scikit-learn: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/spf13/cobra: only 2 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/spring-projects/spring-boot: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/sveltejs/svelte: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/uutils/coreutils: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/vercel/next.js: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/vitejs/vite: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/vuejs/core: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/yarnpkg/berry: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent

## gated 组 (断言面)

| 样本 | FN | FP率 | FP行 | 零块 | 边界违例 | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1337 | 2 | 0.08% | 454 | 0 | 0 | 99.19% | 99.24% |

## exempt 组 (报告面, 不进断言 — 豁免余量 = 逐仓适配进度)

豁免样本 249 对 / 豁免仓 24 个 (sidecar gate_exempt: true)。

| 样本 | FN(镜像) | FP率(镜像) | 零块(镜像) | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- |
| 245 | 0 | 0.78% | 0 | 99.03% | 99.22% |

## 规则健康档案

- 诊断覆盖率: 993/1136 = 87.41% (含 ≥1 非 restating/trivial 失败块的失败族样本 — FN 保证有块, 覆盖保证块由内容决定)
- 分级: trivial (原 restating) 1 (结论复述安全网) / diagnostic 184 (内容决定, 计覆盖) / boundary 6 (断裂带, 人工审)
- 完整健康表 (PPV/Wilson/lift/spec/intent 核对): [reports 分支 rules-health.md](https://github.com/luochen1990/log-skimmer-rules/blob/reports/rules-health.md)

<details>
<summary>逐仓分解 (150 仓) — 样本/豁免/FN/FP/零块/压缩率</summary>

| repo | 样本 | 豁免 | FN | FP率 | 零块 | 边界 | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `github.com/Alamofire/Alamofire` | 10 | 0 | 0 | 0% | 0 | 0 | 99.45% | 99.45% |
| `github.com/AvaloniaUI/Avalonia` | 11 | 0 | 0 | 0.09% | 0 | 0 | 98.83% | 99.36% |
| `github.com/BurntSushi/ripgrep` | 11 | 0 | 0 | 0% | 0 | 0 | 98.85% | 99.32% |
| `github.com/ClickHouse/ClickHouse` | 11 | 0 | 0 | 0% | 0 | 0 | 99.89% | 99.95% |
| `github.com/DavidAnson/markdownlint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.35% | 99.68% |
| `github.com/DeterminateSystems/magic-nix-cache` | 8 | 8 | 0 | 0.08% | 0 | 0 | 99.57% | 99.57% |
| `github.com/DeterminateSystems/nix-installer` | 4 | 4 | 0 | 0% | 0 | 0 | 99.76% | 99.76% |
| `github.com/Homebrew/brew` | 11 | 0 | 0 | 0% | 0 | 0 | 99.42% | 99.41% |
| `github.com/JamesNK/Newtonsoft.Json` | 3 | 0 | 0 | 0% | 0 | 0 | 99.92% | 99.92% |
| `github.com/JetBrains/Exposed` | 11 | 0 | 0 | 0% | 0 | 0 | 99.12% | 99.68% |
| `github.com/LnL7/nix-darwin` | 11 | 0 | 0 | 0% | 0 | 0 | 93.19% | 99.66% |
| `github.com/alacritty/alacritty` | 11 | 0 | 0 | 0% | 0 | 0 | 99.43% | 99.65% |
| `github.com/anomalyco/opencode` | 13 | 0 | 0 | 0.08% | 0 | 0 | 99.71% | 99.91% |
| `github.com/ant-design/ant-design` | 11 | 0 | 0 | 0% | 0 | 0 | 97.73% | 98.22% |
| `github.com/apache/kafka` | 11 | 0 | 0 | 0% | 0 | 0 | 99.79% | 99.79% |
| `github.com/aquasecurity/trivy` | 11 | 0 | 0 | 0% | 0 | 0 | 99.92% | 99.92% |
| `github.com/astral-sh/ruff` | 11 | 0 | 0 | 0% | 0 | 0 | 99.69% | 99.82% |
| `github.com/bbernhard/signal-cli-rest-api` | 11 | 11 | 0 | 0% | 0 | 0 | 99.45% | 99.45% |
| `github.com/bitcoin/bitcoin` | 11 | 0 | 0 | 0.03% | 0 | 0 | 99.62% | 99.53% |
| `github.com/bitnami/charts` | 11 | 11 | 0 | 0% | 0 | 0 | 98.93% | 98.93% |
| `github.com/cachix/devenv` | 11 | 11 | 0 | 0% | 0 | 0 | 99.67% | 99.67% |
| `github.com/caddyserver/caddy` | 11 | 0 | 0 | 0% | 0 | 0 | 99.96% | 99.96% |
| `github.com/catchorg/Catch2` | 4 | 0 | 0 | 0% | 0 | 0 | 99.75% | 99.88% |
| `github.com/chipsalliance/verible` | 11 | 11 | 0 | 0.05% | 0 | 0 | 99.85% | 99.88% |
| `github.com/cli/cli` | 10 | 0 | 0 | 0% | 0 | 0 | 98.96% | 99.65% |
| `github.com/commercialhaskell/stack` | 9 | 0 | 0 | 0% | 0 | 0 | 99.87% | 99.87% |
| `github.com/composer/composer` | 11 | 0 | 0 | 0% | 0 | 0 | 99.3% | 99.3% |
| `github.com/containers/podman` | 11 | 11 | 0 | 0.04% | 0 | 0 | 99.88% | 99.88% |
| `github.com/coreos/rpm-ostree` | 8 | 8 | 0 | 0% | 0 | 0 | 99.94% | 99.94% |
| `github.com/curl/curl` | 11 | 0 | 0 | 1.07% | 0 | 0 | 99.46% | 99.76% |
| `github.com/dandavison/delta` | 11 | 0 | 0 | 0% | 0 | 0 | 93.48% | 95.51% |
| `github.com/denoland/deno` | 11 | 0 | 0 | 0.31% | 0 | 0 | 99.61% | 99.73% |
| `github.com/detekt/detekt` | 11 | 0 | 0 | 0% | 0 | 0 | 99.18% | 99.55% |
| `github.com/diffplug/spotless` | 11 | 0 | 0 | 0% | 0 | 0 | 99.45% | 99.74% |
| `github.com/django/django` | 11 | 0 | 0 | 0% | 0 | 0 | 99.12% | 99.12% |
| `github.com/doccano/doccano` | 11 | 11 | 0 | 0.35% | 0 | 0 | 99.52% | 99.7% |
| `github.com/dotnet/aspnetcore` | 11 | 0 | 0 | 0% | 0 | 0 | 99.84% | 99.87% |
| `github.com/dotnet/roslyn` | 11 | 0 | 0 | 0% | 0 | 0 | 99.51% | 99.6% |
| `github.com/dotnet/runtime` | 11 | 0 | 0 | 0% | 0 | 0 | 99.73% | 99.79% |
| `github.com/dtolnay/cxx` | 11 | 11 | 0 | 0% | 0 | 0 | 99.58% | 99.62% |
| `github.com/duckdb/duckdb` | 11 | 0 | 0 | 0% | 0 | 0 | 98.19% | 99.27% |
| `github.com/elixir-lang/elixir` | 9 | 0 | 0 | 0.13% | 0 | 0 | 99.35% | 99.6% |
| `github.com/erlang/otp` | 11 | 0 | 0 | 0% | 0 | 0 | 99.94% | 99.93% |
| `github.com/eslint/eslint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.27% | 99.48% |
| `github.com/etcd-io/etcd` | 11 | 0 | 0 | 0% | 0 | 0 | 99.78% | 99.78% |
| `github.com/evanw/esbuild` | 6 | 0 | 0 | 0% | 0 | 0 | 99.44% | 99.67% |
| `github.com/facebook/react` | 11 | 11 | 0 | 0% | 0 | 0 | 98.6% | 98.97% |
| `github.com/fastapi/fastapi` | 11 | 0 | 0 | 0% | 0 | 0 | 99.84% | 99.85% |
| `github.com/fastlane/fastlane` | 11 | 0 | 0 | 0% | 0 | 0 | 99.67% | 98.91% |
| `github.com/flutter/flutter` | 11 | 0 | 0 | 0% | 0 | 0 | 99.79% | 99.88% |
| `github.com/flutter/packages` | 11 | 0 | 0 | 0% | 0 | 0 | 99.75% | 99.83% |
| `github.com/fmtlib/fmt` | 11 | 0 | 0 | 0% | 0 | 0 | 99.49% | 99.43% |
| `github.com/gin-gonic/gin` | 11 | 0 | 0 | 0% | 0 | 0 | 99.69% | 99.81% |
| `github.com/gohugoio/hugo` | 11 | 0 | 0 | 0% | 0 | 0 | 99.9% | 99.87% |
| `github.com/golangci/golangci-lint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.38% | 99.42% |
| `github.com/google/auto` | 11 | 11 | 0 | 15.31% | 0 | 0 | 88.75% | 89.38% |
| `github.com/google/benchmark` | 10 | 0 | 0 | 0% | 0 | 0 | 99.49% | 99.79% |
| `github.com/google/error-prone` | 11 | 11 | 0 | 0% | 0 | 0 | 99.41% | 99.78% |
| `github.com/google/googletest` | 11 | 0 | 0 | 0% | 0 | 0 | 97.97% | 99.4% |
| `github.com/google/guava` | 11 | 0 | 0 | 0% | 0 | 0 | 99.38% | 99.61% |
| `github.com/google/re2` | 6 | 6 | 0 | 0% | 0 | 0 | 97.28% | 97.28% |
| `github.com/google/xls` | 11 | 11 | 0 | 0% | 0 | 0 | 99.91% | 99.93% |
| `github.com/gradle/gradle` | 11 | 0 | 0 | 0% | 0 | 0 | 99.38% | 99.85% |
| `github.com/grafana/helm-charts` | 11 | 11 | 0 | 0% | 0 | 0 | 99.95% | 99.95% |
| `github.com/grafana/loki` | 11 | 0 | 0 | 0% | 0 | 0 | 99.63% | 99.66% |
| `github.com/grpc/grpc-go` | 11 | 0 | 0 | 0.1% | 0 | 0 | 99.03% | 99.03% |
| `github.com/hadolint/hadolint` | 9 | 0 | 0 | 0% | 0 | 0 | 99.7% | 99.79% |
| `github.com/hashicorp/terraform` | 11 | 11 | 0 | 0.07% | 0 | 0 | 99.45% | 99.35% |
| `github.com/haskell/cabal` | 11 | 0 | 2 | 0% | 0 | 0 | 99.81% | 99.84% |
| `github.com/haskell/haskell-language-server` | 11 | 0 | 0 | 0% | 0 | 0 | 98.89% | 98.92% |
| `github.com/helm/helm` | 11 | 0 | 0 | 0.23% | 0 | 0 | 99.68% | 99.87% |
| `github.com/honojs/hono` | 11 | 0 | 0 | 0% | 0 | 0 | 99.22% | 99.57% |
| `github.com/hyperium/hyper` | 11 | 0 | 0 | 0% | 0 | 0 | 99.1% | 99.25% |
| `github.com/jekyll/jekyll` | 11 | 0 | 0 | 0.07% | 0 | 0 | 98.97% | 99.17% |
| `github.com/jgm/pandoc` | 11 | 0 | 0 | 0.01% | 0 | 0 | 94.64% | 99.9% |
| `github.com/koalaman/shellcheck` | 6 | 0 | 0 | 0% | 0 | 0 | 99.44% | 99.51% |
| `github.com/kubernetes/kubernetes` | 3 | 0 | 0 | 0% | 0 | 0 | 99.98% | 99.98% |
| `github.com/laravel/framework` | 11 | 0 | 0 | 0% | 0 | 0 | 99.67% | 99.83% |
| `github.com/libuv/libuv` | 11 | 0 | 0 | 0% | 0 | 0 | 99.71% | 99.76% |
| `github.com/luarocks/luarocks` | 11 | 0 | 0 | 0% | 0 | 0 | 99.69% | 99.69% |
| `github.com/meta/buck2` | 11 | 11 | 0 | 0.06% | 0 | 0 | 99.76% | 99.94% |
| `github.com/microsoft/TypeScript` | 11 | 0 | 0 | 0.04% | 0 | 0 | 99.36% | 99.63% |
| `github.com/microsoft/playwright` | 11 | 0 | 0 | 0% | 0 | 0 | 88.81% | 96.27% |
| `github.com/mitmproxy/mitmproxy` | 11 | 0 | 0 | 0% | 0 | 0 | 99.69% | 99.69% |
| `github.com/moby/moby` | 11 | 0 | 0 | 0% | 0 | 0 | 99.74% | 99.74% |
| `github.com/mockito/mockito` | 11 | 0 | 0 | 0% | 0 | 0 | 98.54% | 99.6% |
| `github.com/mvdan/sh` | 11 | 0 | 0 | 0% | 0 | 0 | 98.93% | 98.93% |
| `github.com/neovim/neovim` | 11 | 0 | 0 | 0% | 0 | 0 | 98.53% | 99.09% |
| `github.com/niri-wm/niri` | 19 | 0 | 0 | 0% | 0 | 0 | 98.7% | 99% |
| `github.com/nix-community/home-manager` | 19 | 0 | 0 | 0% | 0 | 0 | 99.71% | 99.85% |
| `github.com/nix-community/nix-direnv` | 4 | 0 | 0 | 0.12% | 0 | 0 | 99.57% | 99.72% |
| `github.com/nlohmann/json` | 11 | 0 | 0 | 0.31% | 0 | 0 | 97.05% | 99.23% |
| `github.com/nvim-telescope/telescope.nvim` | 11 | 0 | 0 | 0% | 0 | 0 | 84.99% | 80.63% |
| `github.com/openai/openai-python` | 11 | 0 | 0 | 0% | 0 | 0 | 98.91% | 99.41% |
| `github.com/opencv/opencv` | 11 | 0 | 0 | 0% | 0 | 0 | 99.26% | 99.95% |
| `github.com/openssl/openssl` | 11 | 0 | 0 | 0% | 0 | 0 | 99.75% | 99.84% |
| `github.com/opentofu/opentofu` | 10 | 10 | 0 | 0% | 0 | 0 | 98.68% | 98.68% |
| `github.com/oven-sh/bun` | 11 | 0 | 0 | 0% | 0 | 0 | 99.67% | 99.71% |
| `github.com/pallets/flask` | 11 | 0 | 0 | 0% | 0 | 0 | 98.21% | 98.9% |
| `github.com/pandas-dev/pandas` | 11 | 0 | 0 | 0% | 0 | 0 | 99.84% | 99.86% |
| `github.com/phoenixframework/phoenix` | 11 | 0 | 0 | 0% | 0 | 0 | 95.71% | 99.63% |
| `github.com/phpstan/phpstan` | 11 | 0 | 0 | 0% | 0 | 0 | 99.43% | 99.63% |
| `github.com/pnpm/pnpm` | 11 | 0 | 0 | 0% | 0 | 0 | 99.58% | 99.77% |
| `github.com/prettier/prettier` | 11 | 0 | 0 | 0% | 0 | 0 | 97.86% | 99.31% |
| `github.com/prometheus-community/helm-charts` | 11 | 11 | 0 | 0% | 0 | 0 | 99.91% | 99.91% |
| `github.com/protocolbuffers/protobuf` | 11 | 0 | 0 | 0% | 0 | 0 | 85.58% | 94.08% |
| `github.com/psf/black` | 11 | 0 | 0 | 0% | 0 | 0 | 99.55% | 99.61% |
| `github.com/psf/requests` | 11 | 0 | 0 | 0% | 0 | 0 | 98.7% | 98.7% |
| `github.com/puma/puma` | 11 | 0 | 0 | 0% | 0 | 0 | 99.87% | 99.91% |
| `github.com/pydantic/pydantic` | 11 | 0 | 0 | 0% | 0 | 0 | 99.54% | 99.49% |
| `github.com/pytest-dev/pytest` | 11 | 0 | 0 | 0% | 0 | 0 | 99.54% | 99.65% |
| `github.com/python-poetry/poetry` | 11 | 11 | 0 | 0% | 0 | 0 | 98.69% | 99.51% |
| `github.com/qdrant/qdrant` | 11 | 0 | 0 | 0.03% | 0 | 0 | 99.64% | 99.76% |
| `github.com/rails/rails` | 11 | 0 | 0 | 0% | 0 | 0 | 99.85% | 99.85% |
| `github.com/redis/redis` | 11 | 0 | 0 | 0% | 0 | 0 | 99.96% | 99.96% |
| `github.com/redisson/redisson` | 11 | 11 | 0 | 0% | 0 | 0 | 99.53% | 99.78% |
| `github.com/rhysd/actionlint` | 11 | 0 | 0 | 0% | 0 | 0 | 98.15% | 99.69% |
| `github.com/rollup/rollup` | 11 | 0 | 0 | 0% | 0 | 0 | 99.92% | 99.93% |
| `github.com/rrrene/credo` | 11 | 0 | 0 | 0% | 0 | 0 | 99.93% | 93.53% |
| `github.com/rubocop/rubocop` | 11 | 0 | 0 | 0.15% | 0 | 0 | 98.19% | 98.19% |
| `github.com/rust-analyzer/rust-analyzer` | 11 | 0 | 0 | 0% | 0 | 0 | 99.74% | 99.82% |
| `github.com/scikit-learn/scikit-learn` | 11 | 0 | 0 | 0% | 0 | 0 | 99.78% | 99.81% |
| `github.com/sebastianbergmann/phpunit` | 11 | 0 | 0 | 0% | 0 | 0 | 98.94% | 99.36% |
| `github.com/semgrep/semgrep` | 11 | 0 | 0 | 0% | 0 | 0 | 99.73% | 99.73% |
| `github.com/serde-rs/serde` | 10 | 0 | 0 | 0% | 0 | 0 | 97.98% | 98.45% |
| `github.com/sharkdp/bat` | 11 | 0 | 0 | 0.05% | 0 | 0 | 99.42% | 99.42% |
| `github.com/sharkdp/fd` | 11 | 0 | 0 | 0% | 0 | 0 | 99.44% | 99.57% |
| `github.com/spf13/cobra` | 2 | 0 | 0 | 0% | 0 | 0 | 97.67% | 97.67% |
| `github.com/spf13/viper` | 4 | 0 | 0 | 0% | 0 | 0 | 99.04% | 99.04% |
| `github.com/spring-projects/spring-boot` | 11 | 0 | 0 | 0% | 0 | 0 | 99.64% | 99.94% |
| `github.com/spring-projects/spring-framework` | 11 | 0 | 0 | 0% | 0 | 0 | 99.58% | 99.75% |
| `github.com/square/okhttp` | 11 | 0 | 0 | 0% | 0 | 0 | 99.26% | 99.74% |
| `github.com/starship/starship` | 11 | 0 | 0 | 0% | 0 | 0 | 99.62% | 99.72% |
| `github.com/stylelint/stylelint` | 11 | 0 | 0 | 0% | 0 | 0 | 94.01% | 99.4% |
| `github.com/sveltejs/svelte` | 11 | 0 | 0 | 0% | 0 | 0 | 98.74% | 99.21% |
| `github.com/swiftlang/swift-format` | 11 | 0 | 0 | 0% | 0 | 0 | 98.69% | 99.52% |
| `github.com/swiftlang/swift-syntax` | 11 | 0 | 0 | 0% | 0 | 0 | 99.93% | 99.93% |
| `github.com/symfony/symfony` | 11 | 0 | 0 | 0% | 0 | 0 | 99.81% | 99.87% |
| `github.com/tailwindlabs/tailwindcss` | 11 | 0 | 0 | 0% | 0 | 0 | 99.49% | 99.64% |
| `github.com/terraform-aws-modules/terraform-aws-vpc` | 11 | 11 | 0 | 0% | 0 | 0 | 99.15% | 99.15% |
| `github.com/tokio-rs/tokio` | 11 | 0 | 0 | 0% | 0 | 0 | 98.81% | 99.44% |
| `github.com/trufflesecurity/trufflehog` | 11 | 0 | 0 | 0.07% | 0 | 0 | 99.7% | 99.7% |
| `github.com/uutils/coreutils` | 11 | 0 | 0 | 0% | 0 | 0 | 99.85% | 99.86% |
| `github.com/vapor/vapor` | 11 | 0 | 0 | 0% | 0 | 0 | 99.96% | 99% |
| `github.com/vercel/next.js` | 11 | 0 | 0 | 0% | 0 | 0 | 99.78% | 99.52% |
| `github.com/vitejs/vite` | 10 | 0 | 0 | 0% | 0 | 0 | 98.23% | 98.99% |
| `github.com/vuejs/core` | 11 | 0 | 0 | 0% | 0 | 0 | 99.35% | 99.75% |
| `github.com/withastro/astro` | 11 | 0 | 0 | 0.25% | 0 | 0 | 99.62% | 99.8% |
| `github.com/yarnpkg/berry` | 11 | 11 | 0 | 0.33% | 0 | 0 | 99.32% | 99.46% |
| `github.com/zigtools/zls` | 11 | 0 | 0 | 0% | 0 | 0 | 92.27% | 97.38% |

注: FN/FP 为诊断视图 (不分 gated/exempt, 看未适配仓离达标多远); 零块/边界为全域口径。
</details>

<details>
<summary>规则 × 仓 命中矩阵 (375 规则) — 命中分布与零命中 (死规则候选)</summary>

| 规则 | 总命中 | 命中仓分布 (top 8) |
| --- | --- | --- |
| `gradle-task-progress-noise` | 67072 | github.com/spring-projects/spring-boot (29162), github.com/gradle/gradle (25411), github.com/square/okhttp (4254), github.com/detekt/detekt (4006), github.com/mockito/mockito (2193), github.com/diffplug/spotless (1343), github.com/spring-projects/spring-framework (681), github.com/bbernhard/signal-cli-rest-api (22) |
| `node-test-pass-noise` | 44633 | github.com/rollup/rollup (29663), github.com/withastro/astro (7005), github.com/Alamofire/Alamofire (6027), github.com/commercialhaskell/stack (1558), github.com/stylelint/stylelint (370), github.com/pandas-dev/pandas (7), github.com/yarnpkg/berry (2), github.com/dotnet/aspnetcore (1) |
| `python-unittest-progress-noise` | 42914 | github.com/meta/buck2 (14818), github.com/uutils/coreutils (4672), github.com/alacritty/alacritty (4267), github.com/starship/starship (4078), github.com/rust-analyzer/rust-analyzer (2983), github.com/dandavison/delta (2420), github.com/opencv/opencv (1891), github.com/serde-rs/serde (1746) … +12 仓 |
| `cargo-progress-noise` | 41698 | github.com/coreos/rpm-ostree (9093), github.com/uutils/coreutils (6084), github.com/rust-analyzer/rust-analyzer (3744), github.com/alacritty/alacritty (3476), github.com/dandavison/delta (3417), github.com/rollup/rollup (1885), github.com/cachix/devenv (1789), github.com/qdrant/qdrant (1537) … +19 仓 |
| `go-test-progress-noise` | 27468 | github.com/aquasecurity/trivy (18050), github.com/golangci/golangci-lint (4314), github.com/gohugoio/hugo (1909), github.com/opentofu/opentofu (1141), github.com/hashicorp/terraform (902), github.com/grpc/grpc-go (445), github.com/caddyserver/caddy (281), github.com/microsoft/TypeScript (208) … +2 仓 |
| `ninja-progress-noise` | 17862 | github.com/opencv/opencv (7105), github.com/neovim/neovim (3587), github.com/catchorg/Catch2 (2196), github.com/libuv/libuv (1479), github.com/coreos/rpm-ostree (1187), github.com/nlohmann/json (840), github.com/bitcoin/bitcoin (507), github.com/fmtlib/fmt (261) … +14 仓 |
| `ghc-module-progress-noise` | 15676 | github.com/commercialhaskell/stack (9249), github.com/haskell/cabal (4425), github.com/jgm/pandoc (991), github.com/hadolint/hadolint (676), github.com/haskell/haskell-language-server (335) |
| `go-download-noise` | 8171 | github.com/aquasecurity/trivy (3765), github.com/golangci/golangci-lint (1049), github.com/trufflesecurity/trufflehog (736), github.com/gohugoio/hugo (722), github.com/caddyserver/caddy (451), github.com/etcd-io/etcd (426), github.com/grafana/loki (333), github.com/hashicorp/terraform (184) … +11 仓 |
| `maven-test-progress-noise` | 8094 | github.com/google/error-prone (7455), github.com/google/guava (517), github.com/google/auto (122) |
| `credo-result-diff-issue` | 8063 | github.com/rrrene/credo (8063) |
| `pip-install-progress-noise` | 5346 | github.com/dotnet/roslyn (1326), github.com/doccano/doccano (459), github.com/pydantic/pydantic (363), github.com/haskell/cabal (333), github.com/psf/black (263), github.com/google/xls (244), github.com/scikit-learn/scikit-learn (224), github.com/square/okhttp (192) … +94 仓 |
| `github-actions-error-annotation` | 4594 | github.com/google/auto (2796), github.com/python-poetry/poetry (99), github.com/trufflesecurity/trufflehog (88), github.com/google/re2 (82), github.com/Alamofire/Alamofire (79), github.com/golangci/golangci-lint (38), github.com/google/error-prone (36), github.com/redisson/redisson (29) … +139 仓 |
| `github-actions-annotation-substantive` | 3625 | github.com/google/auto (2790), github.com/python-poetry/poetry (91), github.com/trufflesecurity/trufflehog (80), github.com/google/re2 (79), github.com/Alamofire/Alamofire (71), github.com/golangci/golangci-lint (33), github.com/google/error-prone (28), github.com/jekyll/jekyll (21) … +82 仓 |
| `make-directory-noise` | 3122 | github.com/erlang/otp (2206), github.com/redis/redis (308), github.com/containers/podman (188), github.com/curl/curl (182), github.com/coreos/rpm-ostree (72), github.com/semgrep/semgrep (66), github.com/openssl/openssl (34), github.com/libuv/libuv (18) … +7 仓 |
| `maven-download-progress-noise` | 1826 | github.com/google/guava (1302), github.com/google/auto (524) |
| `javac-compile-error` | 1619 | github.com/google/auto (1590), github.com/google/error-prone (26), github.com/diffplug/spotless (3) |
| `cmake-build-progress-noise` | 1601 | github.com/bitcoin/bitcoin (734), github.com/libuv/libuv (495), github.com/luarocks/luarocks (236), github.com/fmtlib/fmt (136) |
| `github-actions-runner-version-info` | 1592 | github.com/niri-wm/niri (19), github.com/nix-community/home-manager (19), github.com/anomalyco/opencode (13), github.com/Alamofire/Alamofire (11), github.com/AvaloniaUI/Avalonia (11), github.com/BurntSushi/ripgrep (11), github.com/ClickHouse/ClickHouse (11), github.com/DavidAnson/markdownlint (11) … +142 仓 |
| `vitest-pass-noise` | 1544 | github.com/tailwindlabs/tailwindcss (750), github.com/vitejs/vite (543), github.com/honojs/hono (231), github.com/withastro/astro (11), github.com/yarnpkg/berry (9) |
| `nvim-test-assertion-detail` | 1355 | github.com/nvim-telescope/telescope.nvim (1288), github.com/neovim/neovim (67) |
| `swift-benchmark-regression` | 1309 | github.com/vapor/vapor (1309) |
| `gcc-clang-diagnostic-error` | 979 | github.com/protocolbuffers/protobuf (632), github.com/zigtools/zls (104), github.com/curl/curl (94), github.com/fastlane/fastlane (76), github.com/google/googletest (17), github.com/nlohmann/json (15), github.com/haskell/cabal (14), github.com/duckdb/duckdb (12) … +6 仓 |
| `bazel-error` | 741 | github.com/protocolbuffers/protobuf (734), github.com/chipsalliance/verible (7) |
| `nvim-test-failure-list-entry` | 654 | github.com/nvim-telescope/telescope.nvim (647), github.com/neovim/neovim (7) |
| `playwright-assert-failed` | 491 | github.com/microsoft/playwright (464), github.com/prettier/prettier (16), github.com/anomalyco/opencode (6), github.com/meta/buck2 (4), github.com/tokio-rs/tokio (1) |
| `playwright-progress-noise` | 401 | github.com/anomalyco/opencode (401) |
| `rust-test-panic` | 400 | github.com/dandavison/delta (380), github.com/serde-rs/serde (8), github.com/sharkdp/fd (5), github.com/denoland/deno (2), github.com/BurntSushi/ripgrep (1), github.com/meta/buck2 (1), github.com/niri-wm/niri (1), github.com/starship/starship (1) … +1 仓 |
| `rust-libtest-failed` | 342 | github.com/dandavison/delta (315), github.com/serde-rs/serde (8), github.com/sharkdp/fd (5), github.com/cachix/devenv (4), github.com/qdrant/qdrant (3), github.com/rust-analyzer/rust-analyzer (3), github.com/BurntSushi/ripgrep (1), github.com/meta/buck2 (1) … +2 仓 |
| `rspec-failure-error` | 266 | github.com/rubocop/rubocop (240), github.com/Homebrew/brew (26) |
| `playwright-failed-test-header` | 248 | github.com/microsoft/playwright (247), github.com/anomalyco/opencode (1) |
| `rspec-rerun-command` | 245 | github.com/rubocop/rubocop (242), github.com/fastlane/fastlane (3) |
| `ninja-failed` | 233 | github.com/bitcoin/bitcoin (166), github.com/curl/curl (28), github.com/duckdb/duckdb (12), github.com/neovim/neovim (10), github.com/nlohmann/json (6), github.com/google/googletest (5), github.com/libuv/libuv (4), github.com/oven-sh/bun (1) … +1 仓 |
| `ninja-build-stopped` | 216 | github.com/bitcoin/bitcoin (166), github.com/curl/curl (28), github.com/duckdb/duckdb (6), github.com/nlohmann/json (6), github.com/ClickHouse/ClickHouse (3), github.com/neovim/neovim (3), github.com/libuv/libuv (2), github.com/google/googletest (1) … +1 仓 |
| `nvim-test-run-fail` | 214 | github.com/neovim/neovim (214) |
| `pytest-progress-noise` | 197 | github.com/fastapi/fastapi (71), github.com/duckdb/duckdb (51), github.com/symfony/symfony (28), github.com/elixir-lang/elixir (16), github.com/Homebrew/brew (9), github.com/psf/black (9), github.com/erlang/otp (7), github.com/containers/podman (2) … +3 仓 |
| `apt-fetch-failed` | 183 | github.com/niri-wm/niri (145), github.com/tokio-rs/tokio (22), github.com/google/benchmark (8), github.com/BurntSushi/ripgrep (6), github.com/koalaman/shellcheck (2) |
| `jest-test-fail` | 180 | github.com/vercel/next.js (117), github.com/facebook/react (44), github.com/phoenixframework/phoenix (14), github.com/prettier/prettier (4), github.com/yarnpkg/berry (1) |
| `python-traceback-uncaught-exception` | 166 | github.com/python-poetry/poetry (80), github.com/mockito/mockito (31), github.com/anomalyco/opencode (12), github.com/helm/helm (6), github.com/google/auto (5), github.com/google/error-prone (4), github.com/honojs/hono (4), github.com/denoland/deno (3) … +12 仓 |
| `rustc-error-tree` | 150 | github.com/serde-rs/serde (104), github.com/starship/starship (16), github.com/alacritty/alacritty (12), github.com/astral-sh/ruff (5), github.com/tokio-rs/tokio (4), github.com/rust-analyzer/rust-analyzer (3), github.com/pnpm/pnpm (2), github.com/qdrant/qdrant (2) … +2 仓 |
| `cmake-dev-warning-error` | 136 | github.com/bitcoin/bitcoin (136) |
| `pytest-test-failed` | 133 | github.com/python-poetry/poetry (91), github.com/pytest-dev/pytest (32), github.com/pandas-dev/pandas (4), github.com/qdrant/qdrant (4), github.com/fastapi/fastapi (1), github.com/psf/black (1) |
| `deno-test-failed` | 131 | github.com/denoland/deno (131) |
| `nix-deprecation-warning` | 119 | github.com/cachix/devenv (109), github.com/LnL7/nix-darwin (9), github.com/DeterminateSystems/magic-nix-cache (1) |
| `zig-compile-error` | 104 | github.com/zigtools/zls (104) |
| `gcc-clang-driver-error` | 95 | github.com/curl/curl (67), github.com/libuv/libuv (6), github.com/luarocks/luarocks (6), github.com/google/googletest (5), github.com/nlohmann/json (5), github.com/commercialhaskell/stack (4), github.com/fmtlib/fmt (2) |
| `go-test-fail` | 85 | github.com/gohugoio/hugo (34), github.com/opentofu/opentofu (15), github.com/hashicorp/terraform (14), github.com/caddyserver/caddy (7), github.com/mvdan/sh (5), github.com/containers/podman (3), github.com/aquasecurity/trivy (2), github.com/microsoft/TypeScript (2) … +3 仓 |
| `make-target-error` | 81 | github.com/duckdb/duckdb (10), github.com/openssl/openssl (9), github.com/containers/podman (8), github.com/erlang/otp (8), github.com/coreos/rpm-ostree (6), github.com/nvim-telescope/telescope.nvim (6), github.com/redis/redis (6), github.com/golangci/golangci-lint (5) … +7 仓 |
| `ld-linker-error` | 73 | github.com/haskell/cabal (39), github.com/commercialhaskell/stack (15), github.com/erlang/otp (7), github.com/chipsalliance/verible (4), github.com/curl/curl (4), github.com/bitcoin/bitcoin (1), github.com/jgm/pandoc (1), github.com/libuv/libuv (1) … +1 仓 |
| `go-test-pkg-fail` | 71 | github.com/trufflesecurity/trufflehog (18), github.com/gohugoio/hugo (14), github.com/opentofu/opentofu (11), github.com/hashicorp/terraform (8), github.com/caddyserver/caddy (7), github.com/mvdan/sh (5), github.com/aquasecurity/trivy (2), github.com/microsoft/TypeScript (2) … +4 仓 |
| `gradle-test-case-failed` | 56 | github.com/diffplug/spotless (18), github.com/gradle/gradle (12), github.com/mockito/mockito (10), github.com/square/okhttp (10), github.com/detekt/detekt (4), github.com/spring-projects/spring-boot (1), github.com/spring-projects/spring-framework (1) |
| `pnpm-elifecycle-exit` | 53 | github.com/honojs/hono (12), github.com/withastro/astro (9), github.com/sveltejs/svelte (7), github.com/vitejs/vite (7), github.com/vuejs/core (6), github.com/pnpm/pnpm (5), github.com/tailwindlabs/tailwindcss (4), github.com/vercel/next.js (3) |
| `jest-run-summary` | 49 | github.com/vercel/next.js (18), github.com/facebook/react (14), github.com/prometheus-community/helm-charts (8), github.com/phoenixframework/phoenix (4), github.com/prettier/prettier (3), github.com/yarnpkg/berry (2) |
| `maven-goal-failed` | 48 | github.com/google/auto (32), github.com/google/error-prone (8), github.com/redisson/redisson (6), github.com/google/guava (2) |
| `vitest-test-fail` | 48 | github.com/sveltejs/svelte (18), github.com/tailwindlabs/tailwindcss (14), github.com/vitejs/vite (10), github.com/honojs/hono (6) |
| `gh-api-integration-error` | 46 | github.com/haskell/haskell-language-server (44), github.com/anomalyco/opencode (1), github.com/pandas-dev/pandas (1) |
| `fileutils-cannot-access` | 42 | github.com/containers/podman (18), github.com/luarocks/luarocks (15), github.com/ant-design/ant-design (6), github.com/haskell/haskell-language-server (2), github.com/uutils/coreutils (1) |
| `gradle-task-failed` | 42 | github.com/detekt/detekt (14), github.com/diffplug/spotless (7), github.com/gradle/gradle (7), github.com/mockito/mockito (6), github.com/square/okhttp (6), github.com/spring-projects/spring-boot (1), github.com/spring-projects/spring-framework (1) |
| `ld-so-glibc-version-not-found` | 38 | github.com/fmtlib/fmt (38) |
| `gradle-build-failed` | 37 | github.com/diffplug/spotless (8), github.com/mockito/mockito (8), github.com/gradle/gradle (7), github.com/square/okhttp (7), github.com/detekt/detekt (5), github.com/spring-projects/spring-boot (1), github.com/spring-projects/spring-framework (1) |
| `git-unified-diff-drift` | 35 | github.com/mitmproxy/mitmproxy (8), github.com/microsoft/TypeScript (6), github.com/nlohmann/json (4), github.com/prettier/prettier (3), github.com/bbernhard/signal-cli-rest-api (2), github.com/coreos/rpm-ostree (2), github.com/oven-sh/bun (2), github.com/swiftlang/swift-syntax (2) … +6 仓 |
| `nix-drv-list-noise` | 35 | github.com/nix-community/home-manager (18), github.com/cachix/devenv (8), github.com/LnL7/nix-darwin (7), github.com/nix-community/nix-direnv (2) |
| `rust-libtest-summary-failed` | 31 | github.com/serde-rs/serde (8), github.com/dandavison/delta (5), github.com/cachix/devenv (4), github.com/sharkdp/fd (4), github.com/qdrant/qdrant (3), github.com/rust-analyzer/rust-analyzer (3), github.com/BurntSushi/ripgrep (1), github.com/meta/buck2 (1) … +2 仓 |
| `dependabot-update-errors` | 30 | github.com/helm/helm (5), github.com/phoenixframework/phoenix (4), github.com/stylelint/stylelint (4), github.com/cli/cli (3), github.com/spring-projects/spring-boot (3), github.com/vuejs/core (3), github.com/denoland/deno (2), github.com/google/auto (2) … +4 仓 |
| `vitest-run-summary` | 30 | github.com/sveltejs/svelte (12), github.com/vitejs/vite (10), github.com/tailwindlabs/tailwindcss (6), github.com/honojs/hono (2) |
| `cargo-could-not-compile` | 29 | github.com/rust-analyzer/rust-analyzer (5), github.com/alacritty/alacritty (4), github.com/starship/starship (4), github.com/tokio-rs/tokio (4), github.com/oven-sh/bun (3), github.com/coreos/rpm-ostree (2), github.com/qdrant/qdrant (2), github.com/uutils/coreutils (2) … +3 仓 |
| `pytest-failures-section` | 28 | github.com/pytest-dev/pytest (10), github.com/python-poetry/poetry (7), github.com/pandas-dev/pandas (3), github.com/psf/black (2), github.com/qdrant/qdrant (2), github.com/scikit-learn/scikit-learn (2), github.com/fastapi/fastapi (1), github.com/pydantic/pydantic (1) |
| `tsc-diagnostic` | 27 | github.com/microsoft/TypeScript (8), github.com/vuejs/core (6), github.com/stylelint/stylelint (4), github.com/DavidAnson/markdownlint (3), github.com/honojs/hono (2), github.com/prettier/prettier (2), github.com/sveltejs/svelte (2) |
| `apt-unable-to-locate-package` | 25 | github.com/niri-wm/niri (13), github.com/erlang/otp (9), github.com/gohugoio/hugo (2), github.com/fmtlib/fmt (1) |
| `csc-diagnostic-error` | 24 | github.com/AvaloniaUI/Avalonia (24) |
| `github-actions-workflow-gate-echo` | 24 | github.com/apache/kafka (8), github.com/grpc/grpc-go (7), github.com/protocolbuffers/protobuf (4), github.com/scikit-learn/scikit-learn (3), github.com/psf/black (1), github.com/rrrene/credo (1) |
| `nix-build-failed` | 24 | github.com/LnL7/nix-darwin (24) |
| `pre-commit-hook-failed` | 23 | github.com/psf/requests (6), github.com/terraform-aws-modules/terraform-aws-vpc (4), github.com/pandas-dev/pandas (3), github.com/fastapi/fastapi (2), github.com/pallets/flask (2), github.com/pydantic/pydantic (2), github.com/astral-sh/ruff (1), github.com/containers/podman (1) … +2 仓 |
| `turbo-run-failed` | 22 | github.com/anomalyco/opencode (10), github.com/withastro/astro (9), github.com/vercel/next.js (3) |
| `xctest-test-case-failed` | 21 | github.com/swiftlang/swift-syntax (21) |
| `ghc-gcc-phase-failure` | 20 | github.com/commercialhaskell/stack (20) |
| `maven-surefire-test-failed` | 19 | github.com/google/error-prone (12), github.com/google/auto (5), github.com/google/guava (2) |
| `ghc-source-error` | 18 | github.com/haskell/cabal (14), github.com/hadolint/hadolint (4) |
| `gradle-test-summary-failed` | 17 | github.com/square/okhttp (6), github.com/diffplug/spotless (3), github.com/mockito/mockito (3), github.com/gradle/gradle (2), github.com/detekt/detekt (1), github.com/spring-projects/spring-boot (1), github.com/spring-projects/spring-framework (1) |
| `node-test-fail` | 15 | github.com/withastro/astro (10), github.com/stylelint/stylelint (5) |
| `xctest-assert-failed` | 14 | github.com/swiftlang/swift-syntax (14) |
| `maven-surefire-failures-summary` | 13 | github.com/google/error-prone (7), github.com/google/auto (5), github.com/google/guava (1) |
| `shell-command-not-found` | 13 | github.com/ant-design/ant-design (6), github.com/chipsalliance/verible (6), github.com/containers/podman (1) |
| `bazel-test-target-failed` | 12 | github.com/google/xls (10), github.com/google/googletest (2) |
| `cocoon-wait-for-tests-failed` | 12 | github.com/flutter/flutter (12) |
| `hawk-finding-error` | 12 | github.com/astral-sh/ruff (12) |
| `golangci-lint-issues-summary` | 11 | github.com/golangci/golangci-lint (5), github.com/grafana/loki (2), github.com/helm/helm (2), github.com/aquasecurity/trivy (1), github.com/caddyserver/caddy (1) |
| `cargo-msrv-unsupported` | 10 | github.com/niri-wm/niri (6), github.com/alacritty/alacritty (4) |
| `ctest-test-failed` | 10 | github.com/fmtlib/fmt (6), github.com/libuv/libuv (2), github.com/nlohmann/json (2) |
| `git-ssh-remote-read-failed` | 10 | github.com/laravel/framework (8), github.com/haskell/cabal (2) |
| `rustfmt-diff-drift` | 10 | github.com/niri-wm/niri (5), github.com/tokio-rs/tokio (4), github.com/BurntSushi/ripgrep (1) |
| `stack-structured-error` | 10 | github.com/commercialhaskell/stack (10) |
| `bun-test-fail` | 9 | github.com/anomalyco/opencode (6), github.com/oven-sh/bun (2), github.com/honojs/hono (1) |
| `cabal-structured-error` | 9 | github.com/hadolint/hadolint (4), github.com/jgm/pandoc (3), github.com/haskell/haskell-language-server (2) |
| `curl-cli-error` | 9 | github.com/luarocks/luarocks (2), github.com/qdrant/qdrant (2), github.com/redisson/redisson (2), github.com/containers/podman (1), github.com/openai/openai-python (1), github.com/sharkdp/bat (1) |
| `node-test-fail-plain` | 9 | github.com/microsoft/TypeScript (6), github.com/DavidAnson/markdownlint (3) |
| `redis-test-err` | 9 | github.com/redis/redis (9) |
| `actionlint-generate-drift` | 8 | github.com/rhysd/actionlint (8) |
| `bun-script-exit-fail` | 8 | github.com/anomalyco/opencode (7), github.com/oven-sh/bun (1) |
| `cmake-configure-error` | 8 | github.com/swiftlang/swift-format (4), github.com/neovim/neovim (2), github.com/opencv/opencv (2) |
| `docker-build-failed` | 8 | github.com/doccano/doccano (4), github.com/meta/buck2 (2), github.com/Homebrew/brew (1), github.com/koalaman/shellcheck (1) |
| `eslint-ecosystem-plugin-failed` | 8 | github.com/eslint/eslint (8) |
| `msvc-compiler-error` | 8 | github.com/google/googletest (4), github.com/luarocks/luarocks (3), github.com/nlohmann/json (1) |
| `muffet-link-error` | 8 | github.com/phpstan/phpstan (8) |
| `nixfmt-fail-on-change` | 8 | github.com/nix-community/home-manager (8) |
| `npm-run-all-task-exit-error` | 8 | github.com/rollup/rollup (5), github.com/DavidAnson/markdownlint (3) |
| `phpunit-failed-asserting` | 8 | github.com/symfony/symfony (5), github.com/phpstan/phpstan (2), github.com/sebastianbergmann/phpunit (1) |
| `semgrep-scan-start-failed` | 8 | github.com/semgrep/semgrep (8) |
| `treefmt-fail-on-change` | 8 | github.com/nix-community/home-manager (8) |
| `trivy-vuln-found` | 8 | github.com/gin-gonic/gin (8) |
| `gh-cli-error` | 7 | github.com/flutter/packages (5), github.com/ClickHouse/ClickHouse (1), github.com/dotnet/aspnetcore (1) |
| `gh-graphql-error` | 7 | github.com/JetBrains/Exposed (4), github.com/cli/cli (2), github.com/prometheus-community/helm-charts (1) |
| `go-http-request-failed` | 7 | github.com/etcd-io/etcd (7) |
| `msbuild-build-failed` | 7 | github.com/AvaloniaUI/Avalonia (6), github.com/dotnet/runtime (1) |
| `node-uncaught-exception` | 7 | github.com/denoland/deno (3), github.com/vuejs/core (3), github.com/ant-design/ant-design (1) |
| `npm-network-error` | 7 | github.com/evanw/esbuild (7) |
| `praktika-job-fail` | 7 | github.com/ClickHouse/ClickHouse (7) |
| `praktika-run-failed` | 7 | github.com/ClickHouse/ClickHouse (7) |
| `pyright-type-error` | 7 | github.com/pydantic/pydantic (7) |
| `rubocop-self-lint-failed` | 7 | github.com/rubocop/rubocop (3), github.com/Homebrew/brew (2), github.com/puma/puma (2) |
| `zig-build-summary-failed` | 7 | github.com/zigtools/zls (7) |
| `cargo-llvm-cov-error` | 6 | github.com/starship/starship (6) |
| `nix-eval-error-tree` | 6 | github.com/jgm/pandoc (4), github.com/LnL7/nix-darwin (2) |
| `phpunit-failure-list-header` | 6 | github.com/symfony/symfony (4), github.com/phpstan/phpstan (2) |
| `pytest-conftest-import-error` | 6 | github.com/pallets/flask (6) |
| `stack-hackage-verification-error` | 6 | github.com/jgm/pandoc (6) |
| `apt-package-unavailable` | 5 | github.com/BurntSushi/ripgrep (5) |
| `busted-htest-error-entry` | 5 | github.com/luarocks/luarocks (5) |
| `ctest-tests-failed-list` | 5 | github.com/fmtlib/fmt (2), github.com/catchorg/Catch2 (1), github.com/libuv/libuv (1), github.com/nlohmann/json (1) |
| `exunit-failed-summary` | 5 | github.com/elixir-lang/elixir (4), github.com/phoenixframework/phoenix (1) |
| `exunit-failure-entry` | 5 | github.com/elixir-lang/elixir (4), github.com/phoenixframework/phoenix (1) |
| `github-actions-cache-not-found` | 5 | github.com/elixir-lang/elixir (3), github.com/dotnet/roslyn (2) |
| `maven-wrapper-main-missing` | 5 | github.com/google/guava (5) |
| `mypy-type-error` | 5 | github.com/pandas-dev/pandas (3), github.com/pallets/flask (1), github.com/python-poetry/poetry (1) |
| `npm-run-all-failed-tasks` | 5 | github.com/microsoft/TypeScript (5) |
| `pnpm-error-tree` | 5 | github.com/pnpm/pnpm (4), github.com/honojs/hono (1) |
| `rsync-error` | 5 | github.com/spring-projects/spring-framework (5) |
| `busted-htest-failure-banner` | 4 | github.com/luarocks/luarocks (4) |
| `cargo-deny-lint-error` | 4 | github.com/openai/openai-python (4) |
| `cargo-nextest-run-failed` | 4 | github.com/cachix/devenv (1), github.com/qdrant/qdrant (1), github.com/rust-analyzer/rust-analyzer (1), github.com/tokio-rs/tokio (1) |
| `commit-lint-violation` | 4 | github.com/JetBrains/Exposed (4) |
| `deno-fmt-not-formatted` | 4 | github.com/denoland/deno (2), github.com/microsoft/TypeScript (1), github.com/starship/starship (1) |
| `git-fetch-ref-not-found` | 4 | github.com/bitcoin/bitcoin (3), github.com/pandas-dev/pandas (1) |
| `gotestsum-run-summary` | 4 | github.com/microsoft/TypeScript (2), github.com/moby/moby (1), github.com/trufflesecurity/trufflehog (1) |
| `kotlinc-compile-error` | 4 | github.com/detekt/detekt (3), github.com/gradle/gradle (1) |
| `mage-drift-gate-echo` | 4 | github.com/aquasecurity/trivy (4) |
| `node-command-failed-exit` | 4 | github.com/swiftlang/swift-syntax (4) |
| `pip-build-metadata-error` | 4 | github.com/doccano/doccano (4) |
| `tar-unrecoverable-error` | 4 | github.com/redisson/redisson (2), github.com/koalaman/shellcheck (1), github.com/zigtools/zls (1) |
| `zizmor-audit-error` | 4 | github.com/openai/openai-python (4) |
| `clang-format-lint-diff` | 3 | github.com/google/benchmark (3) |
| `codeql-action-job-status-failure` | 3 | github.com/elixir-lang/elixir (2), github.com/opencv/opencv (1) |
| `copilot-cli-error` | 3 | github.com/dotnet/aspnetcore (3) |
| `copilot-review-worker-verification-failed` | 3 | github.com/dotnet/aspnetcore (3) |
| `eslint-offense-line` | 3 | github.com/anomalyco/opencode (3) |
| `git-push-rejected` | 3 | github.com/nix-community/home-manager (2), github.com/grafana/loki (1) |
| `linkinator-broken-links` | 3 | github.com/DavidAnson/markdownlint (3) |
| `minitest-failure-report` | 3 | github.com/puma/puma (3) |
| `minitest-run-summary` | 3 | github.com/puma/puma (3) |
| `mypy-found-errors` | 3 | github.com/pallets/flask (1), github.com/pandas-dev/pandas (1), github.com/python-poetry/poetry (1) |
| `nix-flake-attr-missing` | 3 | github.com/anomalyco/opencode (3) |
| `phpstan-error-table` | 3 | github.com/composer/composer (3) |
| `playwright-no-report-files` | 3 | github.com/microsoft/playwright (3) |
| `pnpm-error-code-bracketed` | 3 | github.com/withastro/astro (3) |
| `prettier-check-drift` | 3 | github.com/eslint/eslint (2), github.com/vercel/next.js (1) |
| `swift-tools-version-mismatch` | 3 | github.com/swiftlang/swift-format (3) |
| `busted-htest-failed-test-entry` | 2 | github.com/luarocks/luarocks (2) |
| `cargo-build-script-failed` | 2 | github.com/dtolnay/cxx (1), github.com/niri-wm/niri (1) |
| `eslint-stylish-summary` | 2 | github.com/DavidAnson/markdownlint (1), github.com/sveltejs/svelte (1) |
| `go-compile-error` | 2 | github.com/golangci/golangci-lint (1), github.com/grafana/loki (1) |
| `npm-audit-unresolved` | 2 | github.com/rollup/rollup (2) |
| `phpunit-compact-error-entry` | 2 | github.com/sebastianbergmann/phpunit (2) |
| `python-unittest-fail` | 2 | github.com/google/googletest (2) |
| `rust-io-no-such-file` | 2 | github.com/denoland/deno (1), github.com/uutils/coreutils (1) |
| `shell-bash-unbound-variable` | 2 | github.com/haskell/cabal (2) |
| `sphinx-build-problems` | 2 | github.com/libuv/libuv (1), github.com/pandas-dev/pandas (1) |
| `tap-test-failed` | 2 | github.com/libuv/libuv (1), github.com/nix-community/nix-direnv (1) |
| `verify-pr-title-invalid` | 2 | github.com/denoland/deno (2) |
| `wait-on-check-conclusion-not-allowed` | 2 | github.com/flutter/packages (2) |
| `zig-build-command-failed` | 2 | github.com/zigtools/zls (2) |
| `bazel-loading-phase-error` | 1 | github.com/protocolbuffers/protobuf (1) |
| `bitcoin-lint-check-failure` | 1 | github.com/bitcoin/bitcoin (1) |
| `cabal-update-unexpected-response` | 1 | github.com/haskell/haskell-language-server (1) |
| `cargo-publish-prepare-failed` | 1 | github.com/rust-analyzer/rust-analyzer (1) |
| `check-spelling-unrecognized-words` | 1 | github.com/jekyll/jekyll (1) |
| `copilot-harness-model-alias-failed` | 1 | github.com/dotnet/roslyn (1) |
| `dotnet-unhandled-exception` | 1 | github.com/dotnet/roslyn (1) |
| `duckdb-plan-cost-regression` | 1 | github.com/duckdb/duckdb (1) |
| `duckdb-test-failed` | 1 | github.com/duckdb/duckdb (1) |
| `eslint-stylish-offense` | 1 | github.com/DavidAnson/markdownlint (1) |
| `git-am-apply-failed` | 1 | github.com/openssl/openssl (1) |
| `git-push-auth-failed` | 1 | github.com/duckdb/duckdb (1) |
| `grafana-backport-failed` | 1 | github.com/grafana/loki (1) |
| `just-recipe-fail` | 1 | github.com/pnpm/pnpm (1) |
| `mix-error` | 1 | github.com/rrrene/credo (1) |
| `mocha-test-fail` | 1 | github.com/yarnpkg/berry (1) |
| `nix-activation-conflict` | 1 | github.com/LnL7/nix-darwin (1) |
| `node-error-errno-bracket` | 1 | github.com/denoland/deno (1) |
| `node-test-snapshot-assert-fail` | 1 | github.com/DavidAnson/markdownlint (1) |
| `oxlint-found-errors` | 1 | github.com/vitejs/vite (1) |
| `phpstan-found-errors` | 1 | github.com/composer/composer (1) |
| `pyright-error-summary` | 1 | github.com/pydantic/pydantic (1) |
| `pyspelling-check-failed` | 1 | github.com/curl/curl (1) |
| `rustc-doc-failed` | 1 | github.com/rust-analyzer/rust-analyzer (1) |
| `semgrep-findings` | 1 | github.com/withastro/astro (1) |
| `swift-fatal-error` | 1 | github.com/swiftlang/swift-syntax (1) |
| `typos-correction-error` | 1 | github.com/redis/redis (1) |
| `wait-on-check-never-run` | 1 | github.com/flutter/packages (1) |
| `winget-releaser-token-invalid` | 1 | github.com/dandavison/delta (1) |
| `api-extractor-semantic-error` | 0 |  |
| `apt-held-broken-packages` | 0 |  |
| `autoconf-configure-error` | 0 |  |
| `bazel-undeclared-target-option` | 0 |  |
| `bitcoin-fuzz-target-failure` | 0 |  |
| `bitcoin-qa-assets-download-failed` | 0 |  |
| `black-would-reformat` | 0 |  |
| `bun-errno-fatal` | 0 |  |
| `bun-error-json` | 0 |  |
| `bun-install-download-fail` | 0 |  |
| `bundler-lockfile-missing-frozen` | 0 |  |
| `cabal-build-failed` | 0 |  |
| `cabal-changelog-parse-failed` | 0 |  |
| `cabal-changelog-validation-failed` | 0 |  |
| `cargo-build-warnings-denied` | 0 |  |
| `cargo-deny-check-summary` | 0 |  |
| `cargo-publish-failed` | 0 |  |
| `cargo-version-conflict` | 0 |  |
| `changesets-exited-error` | 0 |  |
| `checksrc-failed` | 0 |  |
| `checkstyle-error` | 0 |  |
| `chocolatey-install-failed` | 0 |  |
| `cloudflare-api-error` | 0 |  |
| `cloudflare-apierror-box` | 0 |  |
| `cloudflare-wrangler-error-box` | 0 |  |
| `cloudflare-wrangler-strict-abort` | 0 |  |
| `codecov-upload-failed` | 0 |  |
| `codeowners-validator-checks-failed` | 0 |  |
| `commit-lint-msg-overlong-line` | 0 |  |
| `composer-repo-download-fail` | 0 |  |
| `copilot-cli-no-platform-package` | 0 |  |
| `copilot-harness-attempt-failed` | 0 |  |
| `copilot-quota-exhausted` | 0 |  |
| `copilot-session-transcript-missing` | 0 |  |
| `coverage-fail-under` | 0 |  |
| `credo-strict-suggestions` | 0 |  |
| `curl-runtests-testfail` | 0 |  |
| `docker-registry-pull-failed` | 0 |  |
| `docusaurus-bundle-error` | 0 |  |
| `dpkg-error-processing` | 0 |  |
| `ecosystem-analyzer-new-project-failures` | 0 |  |
| `emmylua-diagnostic` | 0 |  |
| `erlang-signal-stack-failed` | 0 |  |
| `esbuild-build-failed` | 0 |  |
| `esbuild-js-api-tests-failed` | 0 |  |
| `escript-exception` | 0 |  |
| `eslint-cli-fatal-error` | 0 |  |
| `fastlane-exit-status` | 0 |  |
| `fastlane-finished-with-errors` | 0 |  |
| `fastlane-itms-probe-failed` | 0 |  |
| `fileutils-cp-usage-error` | 0 |  |
| `flake8-violation` | 0 |  |
| `flutter-bots-command-failed` | 0 |  |
| `flutter-bots-error-box` | 0 |  |
| `forgejo-actions-job-failed` | 0 |  |
| `forgejo-actions-poll-noise` | 0 |  |
| `forgejo-actions-runner-version-info` | 0 |  |
| `freebsd-rtld-shared-object-missing` | 0 |  |
| `gh-api-http-error` | 0 |  |
| `gh-api-non-json-response` | 0 |  |
| `gh-api-validation-failed` | 0 |  |
| `ghc-commit-buffer-encoding-error` | 0 |  |
| `git-fatal-invalid-commit-name` | 0 |  |
| `git-http-access-denied` | 0 |  |
| `git-pkgs-lookup-error` | 0 |  |
| `github-actions-checkout-ref-mismatch` | 0 |  |
| `github-actions-raw-error-command` | 0 |  |
| `gitleaks-leaks-found` | 0 |  |
| `go-mod-fetch-error` | 0 |  |
| `go-mod-parse-error` | 0 |  |
| `go-mod-tidy-diff` | 0 |  |
| `go-mod-updates-needed` | 0 |  |
| `go-toolchain-mismatch` | 0 |  |
| `golangci-lint-config-invalid` | 0 |  |
| `goreleaser-pipe-timeout` | 0 |  |
| `gotestfmt-test-fail` | 0 |  |
| `homebrew-portable-ruby-failed` | 0 |  |
| `homebrew-update-locked` | 0 |  |
| `html-proofer-external-link-failed` | 0 |  |
| `html-proofer-found-failures` | 0 |  |
| `infra-disk-quota-exceeded` | 0 |  |
| `infra-runner-file-command-eacces` | 0 |  |
| `insta-unreferenced-snapshots` | 0 |  |
| `knip-unused-section` | 0 |  |
| `ld-so-shared-object-load-error` | 0 |  |
| `lintcommit-invalid-message` | 0 |  |
| `mastodon-github-action-post-error` | 0 |  |
| `mdl-finding` | 0 |  |
| `meson-subproject-not-buildable` | 0 |  |
| `mordant-findings-over-baseline` | 0 |  |
| `mport-fetch-error` | 0 |  |
| `nim-segv` | 0 |  |
| `nix-buildenv-collision` | 0 |  |
| `nix-download-failed` | 0 |  |
| `nix-eval-missing-store-path` | 0 |  |
| `nix-experimental-feature-disabled` | 0 |  |
| `nix-fetch-input-noise` | 0 |  |
| `nix-flake-attr-not-derivation` | 0 |  |
| `nix-getting-status-missing` | 0 |  |
| `nix-hash-mismatch-fod` | 0 |  |
| `nix-lockfile-missing-node` | 0 |  |
| `nix-option-conflict` | 0 |  |
| `nix-path-not-exist` | 0 |  |
| `nix-pure-eval-restriction` | 0 |  |
| `nix-remote-store-connection-failed` | 0 |  |
| `nix-stack-overflow-recursion` | 0 |  |
| `nix-syntax-error` | 0 |  |
| `nix-undefined-variable-inline` | 0 |  |
| `node-network-error` | 0 |  |
| `notarytool-agreement-expired` | 0 |  |
| `npm-auth-error` | 0 |  |
| `npm-config-error` | 0 |  |
| `npm-missing-script` | 0 |  |
| `npm-tlog-entry-error` | 0 |  |
| `octokit-request-error` | 0 |  |
| `opencv-dnn-test-error` | 0 |  |
| `pacman-retrieve-failed` | 0 |  |
| `php-fatal-out-of-memory` | 0 |  |
| `phpunit-failures-banner` | 0 |  |
| `phpunit-fatal-error-during-test` | 0 |  |
| `phpunit-php-version-mismatch` | 0 |  |
| `pip-install-error` | 0 |  |
| `pkgin-could-not-fetch` | 0 |  |
| `pkgin-download-error` | 0 |  |
| `playwright-missing-browser-deps` | 0 |  |
| `plenary-test-fail` | 0 |  |
| `plenary-tests-failed` | 0 |  |
| `podman-image-copy-failed` | 0 |  |
| `powershell-error-record` | 0 |  |
| `powershell-method-invocation-exception` | 0 |  |
| `proselint-finding` | 0 |  |
| `pyanalyze-error-findings` | 0 |  |
| `python-argparse-expected-argument` | 0 |  |
| `python-argparse-missing-required-args` | 0 |  |
| `python-logging-critical-message` | 0 |  |
| `qunit-headless-chrome-failed` | 0 |  |
| `redis-cli-cluster-node-error` | 0 |  |
| `redis-server-bugreport` | 0 |  |
| `redis-test-exception` | 0 |  |
| `ruby-errno-exception` | 0 |  |
| `ruby-name-error` | 0 |  |
| `rubygems-repush-not-allowed` | 0 |  |
| `scorecard-action-error` | 0 |  |
| `scorecard-action-signing-error` | 0 |  |
| `semgrep-invalid-api-key` | 0 |  |
| `shell-cp-usage-error` | 0 |  |
| `signtool-error` | 0 |  |
| `size-limit-exceeded` | 0 |  |
| `sst-concurrent-lock` | 0 |  |
| `sst-unexpected-error` | 0 |  |
| `swift-build-error` | 0 |  |
| `swift-docc-compile-failed` | 0 |  |
| `swift-testing-runner-crash` | 0 |  |
| `swift-testing-test-failed` | 0 |  |
| `swiftc-compile-error` | 0 |  |
| `systemd-ci-unit-fail` | 0 |  |
| `trivy-misconf-failures` | 0 |  |
| `trufflehog-secret-found` | 0 |  |
| `trufflehog-unverified-secret` | 0 |  |
| `utoo-dependency-resolution-failed` | 0 |  |
| `utoo-install-download-failed` | 0 |  |
| `uv-require-hashes-unpinned` | 0 |  |
| `vite-plus-runtime-download-failed` | 0 |  |
| `warp-out-of-credits` | 0 |  |
| `webpack-hook-error` | 0 |  |
| `xunit-assert-failure` | 0 |  |
| `yum-repo-unavailable` | 0 |  |

零命中规则 (167 条, dead_rules 候选 — 语料未覆盖的工具或正则失效):
- `api-extractor-semantic-error`
- `apt-held-broken-packages`
- `autoconf-configure-error`
- `bazel-undeclared-target-option`
- `bitcoin-fuzz-target-failure`
- `bitcoin-qa-assets-download-failed`
- `black-would-reformat`
- `bun-errno-fatal`
- `bun-error-json`
- `bun-install-download-fail`
- `bundler-lockfile-missing-frozen`
- `cabal-build-failed`
- `cabal-changelog-parse-failed`
- `cabal-changelog-validation-failed`
- `cargo-build-warnings-denied`
- `cargo-deny-check-summary`
- `cargo-publish-failed`
- `cargo-version-conflict`
- `changesets-exited-error`
- `checksrc-failed`
- `checkstyle-error`
- `chocolatey-install-failed`
- `cloudflare-api-error`
- `cloudflare-apierror-box`
- `cloudflare-wrangler-error-box`
- `cloudflare-wrangler-strict-abort`
- `codecov-upload-failed`
- `codeowners-validator-checks-failed`
- `commit-lint-msg-overlong-line`
- `composer-repo-download-fail`
- `copilot-cli-no-platform-package`
- `copilot-harness-attempt-failed`
- `copilot-quota-exhausted`
- `copilot-session-transcript-missing`
- `coverage-fail-under`
- `credo-strict-suggestions`
- `curl-runtests-testfail`
- `docker-registry-pull-failed`
- `docusaurus-bundle-error`
- `dpkg-error-processing`
- `ecosystem-analyzer-new-project-failures`
- `emmylua-diagnostic`
- `erlang-signal-stack-failed`
- `esbuild-build-failed`
- `esbuild-js-api-tests-failed`
- `escript-exception`
- `eslint-cli-fatal-error`
- `fastlane-exit-status`
- `fastlane-finished-with-errors`
- `fastlane-itms-probe-failed`
- `fileutils-cp-usage-error`
- `flake8-violation`
- `flutter-bots-command-failed`
- `flutter-bots-error-box`
- `forgejo-actions-job-failed`
- `forgejo-actions-poll-noise`
- `forgejo-actions-runner-version-info`
- `freebsd-rtld-shared-object-missing`
- `gh-api-http-error`
- `gh-api-non-json-response`
- `gh-api-validation-failed`
- `ghc-commit-buffer-encoding-error`
- `git-fatal-invalid-commit-name`
- `git-http-access-denied`
- `git-pkgs-lookup-error`
- `github-actions-checkout-ref-mismatch`
- `github-actions-raw-error-command`
- `gitleaks-leaks-found`
- `go-mod-fetch-error`
- `go-mod-parse-error`
- `go-mod-tidy-diff`
- `go-mod-updates-needed`
- `go-toolchain-mismatch`
- `golangci-lint-config-invalid`
- `goreleaser-pipe-timeout`
- `gotestfmt-test-fail`
- `homebrew-portable-ruby-failed`
- `homebrew-update-locked`
- `html-proofer-external-link-failed`
- `html-proofer-found-failures`
- `infra-disk-quota-exceeded`
- `infra-runner-file-command-eacces`
- `insta-unreferenced-snapshots`
- `knip-unused-section`
- `ld-so-shared-object-load-error`
- `lintcommit-invalid-message`
- `mastodon-github-action-post-error`
- `mdl-finding`
- `meson-subproject-not-buildable`
- `mordant-findings-over-baseline`
- `mport-fetch-error`
- `nim-segv`
- `nix-buildenv-collision`
- `nix-download-failed`
- `nix-eval-missing-store-path`
- `nix-experimental-feature-disabled`
- `nix-fetch-input-noise`
- `nix-flake-attr-not-derivation`
- `nix-getting-status-missing`
- `nix-hash-mismatch-fod`
- `nix-lockfile-missing-node`
- `nix-option-conflict`
- `nix-path-not-exist`
- `nix-pure-eval-restriction`
- `nix-remote-store-connection-failed`
- `nix-stack-overflow-recursion`
- `nix-syntax-error`
- `nix-undefined-variable-inline`
- `node-network-error`
- `notarytool-agreement-expired`
- `npm-auth-error`
- `npm-config-error`
- `npm-missing-script`
- `npm-tlog-entry-error`
- `octokit-request-error`
- `opencv-dnn-test-error`
- `pacman-retrieve-failed`
- `php-fatal-out-of-memory`
- `phpunit-failures-banner`
- `phpunit-fatal-error-during-test`
- `phpunit-php-version-mismatch`
- `pip-install-error`
- `pkgin-could-not-fetch`
- `pkgin-download-error`
- `playwright-missing-browser-deps`
- `plenary-test-fail`
- `plenary-tests-failed`
- `podman-image-copy-failed`
- `powershell-error-record`
- `powershell-method-invocation-exception`
- `proselint-finding`
- `pyanalyze-error-findings`
- `python-argparse-expected-argument`
- `python-argparse-missing-required-args`
- `python-logging-critical-message`
- `qunit-headless-chrome-failed`
- `redis-cli-cluster-node-error`
- `redis-server-bugreport`
- `redis-test-exception`
- `ruby-errno-exception`
- `ruby-name-error`
- `rubygems-repush-not-allowed`
- `scorecard-action-error`
- `scorecard-action-signing-error`
- `semgrep-invalid-api-key`
- `shell-cp-usage-error`
- `signtool-error`
- `size-limit-exceeded`
- `sst-concurrent-lock`
- `sst-unexpected-error`
- `swift-build-error`
- `swift-docc-compile-failed`
- `swift-testing-runner-crash`
- `swift-testing-test-failed`
- `swiftc-compile-error`
- `systemd-ci-unit-fail`
- `trivy-misconf-failures`
- `trufflehog-secret-found`
- `trufflehog-unverified-secret`
- `utoo-dependency-resolution-failed`
- `utoo-install-download-failed`
- `uv-require-hashes-unpinned`
- `vite-plus-runtime-download-failed`
- `warp-out-of-credits`
- `webpack-hook-error`
- `xunit-assert-failure`
- `yum-repo-unavailable`

总命中口径 = signal fragment ∪ noise 剔除区块, 全样本域 (liveness)。
</details>
