# log-skimmer 回测报告 (每周自动刷新)

- 时点: 2026-11-07 · verdict: **fail** · 引擎 `6de8310` · 规则 `0e2c523` · 语料 `d3d417a`
- 运行记录: https://github.com/luochen1990/log-skimmer-rules/actions/runs/42364345844 · 消费方: README 徽章 — 本文件即其数据源, 勿手工编辑
- 规则 bundle: rules-bundle.json (277 规则) — userscript 消费源 (README §5)

## 判定: ❌ FAIL

- 对比模式: dual-run compare

### 压缩率退化 (相对 base 退化 >2%, 7 仓)

| repo | Δ压缩率 | 本周 blk | base blk |
| --- | --- | --- | --- |
| `github.com/fmtlib/fmt` | -4.68% | 93.93% | 98.54% |
| `github.com/google/re2` | -2.53% | 96.89% | 99.41% |
| `github.com/jgm/pandoc` | -2.95% | 95.74% | 98.65% |
| `github.com/microsoft/playwright` | -7.34% | 92.23% | 99.54% |
| `github.com/opencv/opencv` | -2.34% | 97.57% | 99.91% |
| `github.com/phoenixframework/phoenix` | -2.74% | 96.22% | 98.93% |
| `github.com/stylelint/stylelint` | -2.54% | 97.22% | 99.75% |

## gated 组 (断言面)

| 样本 | FN | FP率 | FP行 | 零块 | 边界违例 | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1352 | 0 | 0.02% | 128 | 0 | 0 | 99.44% | 99.27% |

## exempt 组 (报告面, 不进断言 — 豁免余量 = 逐仓适配进度)

豁免样本 254 对 / 豁免仓 24 个 (sidecar gate_exempt: true)。

| 样本 | FN(镜像) | FP率(镜像) | 零块(镜像) | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- |
| 254 | 1 | 0.43% | 0 | 98.76% | 99.03% |

## 规则健康档案

- 诊断覆盖率: 1006/1160 = 86.72% (含 ≥1 非 restating/trivial 失败块的失败族样本 — FN 保证有块, 覆盖保证块由内容决定)
- 分级: trivial (原 restating) 1 (结论复述安全网) / diagnostic 174 (内容决定, 计覆盖) / boundary 5 (断裂带, 人工审)
- 完整健康表 (PPV/Wilson/lift/spec/intent 核对): [reports 分支 rules-health.md](https://github.com/luochen1990/log-skimmer-rules/blob/reports/rules-health.md)

<details>
<summary>逐仓分解 (150 仓) — 样本/豁免/FN/FP/零块/压缩率</summary>

| repo | 样本 | 豁免 | FN | FP率 | 零块 | 边界 | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `github.com/Alamofire/Alamofire` | 10 | 0 | 0 | 0% | 0 | 0 | 99% | 98% |
| `github.com/AvaloniaUI/Avalonia` | 11 | 0 | 0 | 0% | 0 | 0 | 99.29% | 99.29% |
| `github.com/BurntSushi/ripgrep` | 11 | 0 | 0 | 0% | 0 | 0 | 98.92% | 90.91% |
| `github.com/ClickHouse/ClickHouse` | 11 | 0 | 0 | 0% | 0 | 0 | 99.87% | 99.97% |
| `github.com/DavidAnson/markdownlint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.61% | 99.72% |
| `github.com/DeterminateSystems/magic-nix-cache` | 11 | 11 | 0 | 0% | 0 | 0 | 99.79% | 99.79% |
| `github.com/DeterminateSystems/nix-installer` | 5 | 5 | 0 | 0% | 0 | 0 | 99.71% | 99.71% |
| `github.com/Homebrew/brew` | 11 | 0 | 0 | 0% | 0 | 0 | 99.5% | 98.91% |
| `github.com/JamesNK/Newtonsoft.Json` | 3 | 0 | 0 | 0% | 0 | 0 | 99.93% | 99.93% |
| `github.com/JetBrains/Exposed` | 11 | 0 | 0 | 0% | 0 | 0 | 98.85% | 99.7% |
| `github.com/LnL7/nix-darwin` | 11 | 0 | 0 | 0% | 0 | 0 | 98.45% | 99.49% |
| `github.com/alacritty/alacritty` | 11 | 0 | 0 | 0% | 0 | 0 | 99.35% | 99.6% |
| `github.com/anomalyco/opencode` | 19 | 0 | 0 | 0.1% | 0 | 0 | 99.31% | 99.76% |
| `github.com/ant-design/ant-design` | 11 | 0 | 0 | 0% | 0 | 0 | 97% | 99.03% |
| `github.com/apache/kafka` | 11 | 0 | 0 | 0% | 0 | 0 | 99.52% | 99.73% |
| `github.com/aquasecurity/trivy` | 11 | 0 | 0 | 0.11% | 0 | 0 | 99.62% | 99.66% |
| `github.com/astral-sh/ruff` | 11 | 0 | 0 | 0% | 0 | 0 | 99.68% | 99.88% |
| `github.com/bbernhard/signal-cli-rest-api` | 11 | 11 | 0 | 0% | 0 | 0 | 99.52% | 99.52% |
| `github.com/bitcoin/bitcoin` | 11 | 0 | 0 | 0.03% | 0 | 0 | 99.75% | 99.89% |
| `github.com/bitnami/charts` | 11 | 11 | 0 | 0% | 0 | 0 | 99% | 99% |
| `github.com/cachix/devenv` | 11 | 11 | 0 | 0% | 0 | 0 | 99.76% | 99.89% |
| `github.com/caddyserver/caddy` | 11 | 0 | 0 | 0% | 0 | 0 | 99.45% | 99.45% |
| `github.com/catchorg/Catch2` | 11 | 0 | 0 | 0% | 0 | 0 | 99.18% | 99.35% |
| `github.com/chipsalliance/verible` | 11 | 11 | 0 | 0% | 0 | 0 | 99.88% | 99.92% |
| `github.com/cli/cli` | 11 | 0 | 0 | 0% | 0 | 0 | 99.8% | 99.8% |
| `github.com/commercialhaskell/stack` | 11 | 0 | 0 | 0% | 0 | 0 | 99.77% | 99.83% |
| `github.com/composer/composer` | 11 | 0 | 0 | 0% | 0 | 0 | 99.15% | 99.44% |
| `github.com/containers/podman` | 11 | 11 | 0 | 0% | 0 | 0 | 99.82% | 99.83% |
| `github.com/coreos/rpm-ostree` | 11 | 11 | 0 | 0.01% | 0 | 0 | 99.95% | 99.83% |
| `github.com/curl/curl` | 11 | 0 | 0 | 0% | 0 | 0 | 99.52% | 99.81% |
| `github.com/dandavison/delta` | 11 | 0 | 0 | 0% | 0 | 0 | 98.99% | 99.35% |
| `github.com/denoland/deno` | 11 | 0 | 0 | 0.4% | 0 | 0 | 99.6% | 99.73% |
| `github.com/detekt/detekt` | 11 | 0 | 0 | 0% | 0 | 0 | 99.09% | 99.63% |
| `github.com/diffplug/spotless` | 11 | 0 | 0 | 0% | 0 | 0 | 99.48% | 99.74% |
| `github.com/django/django` | 11 | 0 | 0 | 0% | 0 | 0 | 99.11% | 99.11% |
| `github.com/doccano/doccano` | 11 | 11 | 0 | 0.29% | 0 | 0 | 99.75% | 99.75% |
| `github.com/dotnet/aspnetcore` | 11 | 0 | 0 | 0% | 0 | 0 | 99.67% | 99.71% |
| `github.com/dotnet/roslyn` | 11 | 0 | 0 | 0% | 0 | 0 | 99.3% | 99.41% |
| `github.com/dotnet/runtime` | 11 | 0 | 0 | 0% | 0 | 0 | 99.44% | 99.47% |
| `github.com/dtolnay/cxx` | 11 | 11 | 0 | 0% | 0 | 0 | 95.08% | 99.15% |
| `github.com/duckdb/duckdb` | 11 | 0 | 0 | 0% | 0 | 0 | 98.16% | 99.05% |
| `github.com/elixir-lang/elixir` | 11 | 0 | 0 | 0.13% | 0 | 0 | 99.32% | 99.53% |
| `github.com/erlang/otp` | 11 | 0 | 0 | 0% | 0 | 0 | 99.98% | 99.98% |
| `github.com/eslint/eslint` | 11 | 0 | 0 | 0% | 0 | 0 | 98.73% | 99.46% |
| `github.com/etcd-io/etcd` | 11 | 0 | 0 | 0.02% | 0 | 0 | 99.82% | 99.82% |
| `github.com/evanw/esbuild` | 6 | 0 | 0 | 0% | 0 | 0 | 99.73% | 99.73% |
| `github.com/facebook/react` | 11 | 11 | 0 | 0% | 0 | 0 | 98.01% | 98.93% |
| `github.com/fastapi/fastapi` | 11 | 0 | 0 | 0% | 0 | 0 | 99.81% | 99.81% |
| `github.com/fastlane/fastlane` | 11 | 0 | 0 | 0% | 0 | 0 | 99.53% | 99.58% |
| `github.com/flutter/flutter` | 11 | 0 | 0 | 0% | 0 | 0 | 99.79% | 99.88% |
| `github.com/flutter/packages` | 11 | 0 | 0 | 0% | 0 | 0 | 99.82% | 99.92% |
| `github.com/fmtlib/fmt` | 10 | 0 | 0 | 0% | 0 | 0 | 93.93% | 99.25% |
| `github.com/gin-gonic/gin` | 11 | 0 | 0 | 0% | 0 | 0 | 99.66% | 99.78% |
| `github.com/gohugoio/hugo` | 11 | 0 | 0 | 0% | 0 | 0 | 99.92% | 99.92% |
| `github.com/golangci/golangci-lint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.82% | 99.83% |
| `github.com/google/auto` | 11 | 11 | 0 | 7.78% | 0 | 0 | 89.56% | 90.11% |
| `github.com/google/benchmark` | 7 | 0 | 0 | 0% | 0 | 0 | 98.13% | 99.36% |
| `github.com/google/error-prone` | 11 | 11 | 0 | 0% | 0 | 0 | 99.53% | 99.85% |
| `github.com/google/googletest` | 11 | 0 | 0 | 0% | 0 | 0 | 99.32% | 99.46% |
| `github.com/google/guava` | 11 | 0 | 0 | 0% | 0 | 0 | 99.39% | 99.71% |
| `github.com/google/re2` | 7 | 7 | 0 | 0% | 0 | 0 | 96.89% | 96.89% |
| `github.com/google/xls` | 11 | 11 | 0 | 0% | 0 | 0 | 99.78% | 99.81% |
| `github.com/gradle/gradle` | 11 | 0 | 0 | 0% | 0 | 0 | 99.23% | 99.79% |
| `github.com/grafana/helm-charts` | 11 | 11 | 0 | 0% | 0 | 0 | 99.91% | 99.91% |
| `github.com/grafana/loki` | 11 | 0 | 0 | 0% | 0 | 0 | 99.74% | 99.76% |
| `github.com/grpc/grpc-go` | 11 | 0 | 0 | 0.16% | 0 | 0 | 98.32% | 98.32% |
| `github.com/hadolint/hadolint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.61% | 99.73% |
| `github.com/hashicorp/terraform` | 11 | 11 | 0 | 2.68% | 0 | 0 | 99.01% | 99.01% |
| `github.com/haskell/cabal` | 11 | 0 | 0 | 0% | 0 | 0 | 99.89% | 99.93% |
| `github.com/haskell/haskell-language-server` | 11 | 0 | 0 | 0% | 0 | 0 | 99.76% | 99.81% |
| `github.com/helm/helm` | 11 | 0 | 0 | 0% | 0 | 0 | 99.75% | 99.86% |
| `github.com/honojs/hono` | 11 | 0 | 0 | 0% | 0 | 0 | 99.52% | 99.63% |
| `github.com/hyperium/hyper` | 11 | 0 | 0 | 0% | 0 | 0 | 99.15% | 99.15% |
| `github.com/jekyll/jekyll` | 11 | 0 | 0 | 0.07% | 0 | 0 | 98.45% | 98.88% |
| `github.com/jgm/pandoc` | 11 | 0 | 0 | 0% | 0 | 0 | 95.74% | 99.93% |
| `github.com/koalaman/shellcheck` | 7 | 0 | 0 | 0% | 0 | 0 | 99.79% | 99.83% |
| `github.com/kubernetes/kubernetes` | 3 | 0 | 0 | 0% | 0 | 0 | 99.99% | 99.99% |
| `github.com/laravel/framework` | 11 | 0 | 0 | 0% | 0 | 0 | 99.35% | 99.65% |
| `github.com/libuv/libuv` | 11 | 0 | 0 | 0% | 0 | 0 | 99.62% | 99.77% |
| `github.com/luarocks/luarocks` | 11 | 0 | 0 | 0% | 0 | 0 | 99.91% | 99.93% |
| `github.com/meta/buck2` | 11 | 11 | 0 | 0% | 0 | 0 | 99.92% | 99.92% |
| `github.com/microsoft/TypeScript` | 11 | 0 | 0 | 0.05% | 0 | 0 | 99.14% | 99.3% |
| `github.com/microsoft/playwright` | 11 | 0 | 0 | 0% | 0 | 0 | 92.23% | 97.17% |
| `github.com/mitmproxy/mitmproxy` | 11 | 0 | 0 | 0% | 0 | 0 | 99.81% | 99.85% |
| `github.com/moby/moby` | 11 | 0 | 0 | 0.04% | 0 | 0 | 99.82% | 99.82% |
| `github.com/mockito/mockito` | 11 | 0 | 0 | 0% | 0 | 0 | 98.67% | 99.64% |
| `github.com/mvdan/sh` | 11 | 0 | 0 | 0% | 0 | 0 | 99.32% | 99.32% |
| `github.com/neovim/neovim` | 11 | 0 | 0 | 0% | 0 | 0 | 99% | 97.73% |
| `github.com/niri-wm/niri` | 19 | 0 | 0 | 0% | 0 | 0 | 99.29% | 99.72% |
| `github.com/nix-community/home-manager` | 19 | 0 | 0 | 0% | 0 | 0 | 99.37% | 99.71% |
| `github.com/nix-community/nix-direnv` | 5 | 0 | 0 | 0% | 0 | 0 | 98.84% | 99.71% |
| `github.com/nlohmann/json` | 11 | 0 | 0 | 0.28% | 0 | 0 | 99.89% | 99.91% |
| `github.com/nvim-telescope/telescope.nvim` | 11 | 0 | 0 | 0% | 0 | 0 | 98.35% | 99.06% |
| `github.com/openai/openai-python` | 11 | 0 | 0 | 0% | 0 | 0 | 99.72% | 86.08% |
| `github.com/opencv/opencv` | 9 | 0 | 0 | 0% | 0 | 0 | 97.57% | 99.9% |
| `github.com/openssl/openssl` | 11 | 0 | 0 | 0.01% | 0 | 0 | 99.87% | 99.87% |
| `github.com/opentofu/opentofu` | 11 | 11 | 0 | 0% | 0 | 0 | 99.42% | 99.42% |
| `github.com/oven-sh/bun` | 11 | 0 | 0 | 0% | 0 | 0 | 99.77% | 99.76% |
| `github.com/pallets/flask` | 11 | 0 | 0 | 0% | 0 | 0 | 98.21% | 98.9% |
| `github.com/pandas-dev/pandas` | 11 | 0 | 0 | 0% | 0 | 0 | 99.61% | 99.76% |
| `github.com/phoenixframework/phoenix` | 11 | 0 | 0 | 0% | 0 | 0 | 96.22% | 99.57% |
| `github.com/phpstan/phpstan` | 11 | 0 | 0 | 0% | 0 | 0 | 99.82% | 99.75% |
| `github.com/pnpm/pnpm` | 11 | 0 | 0 | 0% | 0 | 0 | 99.92% | 99.93% |
| `github.com/prettier/prettier` | 11 | 0 | 0 | 0% | 0 | 0 | 99.27% | 99.74% |
| `github.com/prometheus-community/helm-charts` | 11 | 11 | 1 | 0% | 0 | 0 | 99.93% | 99.93% |
| `github.com/protocolbuffers/protobuf` | 11 | 0 | 0 | 0% | 0 | 0 | 98.25% | 98.01% |
| `github.com/psf/black` | 11 | 0 | 0 | 0% | 0 | 0 | 99.49% | 99.49% |
| `github.com/psf/requests` | 11 | 0 | 0 | 0% | 0 | 0 | 98.7% | 98.7% |
| `github.com/puma/puma` | 11 | 0 | 0 | 0% | 0 | 0 | 99.66% | 99.68% |
| `github.com/pydantic/pydantic` | 11 | 0 | 0 | 0.03% | 0 | 0 | 99.57% | 99.71% |
| `github.com/pytest-dev/pytest` | 11 | 0 | 0 | 0% | 0 | 0 | 99.6% | 99.79% |
| `github.com/python-poetry/poetry` | 11 | 11 | 0 | 0% | 0 | 0 | 99.01% | 99.61% |
| `github.com/qdrant/qdrant` | 11 | 0 | 0 | 0% | 0 | 0 | 99.59% | 99.75% |
| `github.com/rails/rails` | 11 | 0 | 0 | 0% | 0 | 0 | 99.81% | 99.89% |
| `github.com/redis/redis` | 11 | 0 | 0 | 0% | 0 | 0 | 99.94% | 99.96% |
| `github.com/redisson/redisson` | 11 | 11 | 0 | 0% | 0 | 0 | 98.73% | 99.88% |
| `github.com/rhysd/actionlint` | 11 | 0 | 0 | 0% | 0 | 0 | 98.15% | 99.69% |
| `github.com/rollup/rollup` | 11 | 0 | 0 | 0% | 0 | 0 | 99.34% | 99.66% |
| `github.com/rrrene/credo` | 11 | 0 | 0 | 0% | 0 | 0 | 99.91% | 92.2% |
| `github.com/rubocop/rubocop` | 11 | 0 | 0 | 0% | 0 | 0 | 99.23% | 99.23% |
| `github.com/rust-analyzer/rust-analyzer` | 11 | 0 | 0 | 0% | 0 | 0 | 99.82% | 99.89% |
| `github.com/scikit-learn/scikit-learn` | 11 | 0 | 0 | 0% | 0 | 0 | 99.81% | 99.85% |
| `github.com/sebastianbergmann/phpunit` | 11 | 0 | 0 | 0% | 0 | 0 | 97.2% | 99.2% |
| `github.com/semgrep/semgrep` | 11 | 0 | 0 | 0% | 0 | 0 | 99.53% | 99.53% |
| `github.com/serde-rs/serde` | 11 | 0 | 0 | 0% | 0 | 0 | 98.5% | 99.1% |
| `github.com/sharkdp/bat` | 11 | 0 | 0 | 0% | 0 | 0 | 99.77% | 99.77% |
| `github.com/sharkdp/fd` | 11 | 0 | 0 | 0% | 0 | 0 | 99.25% | 99.51% |
| `github.com/spf13/cobra` | 3 | 0 | 0 | 0% | 0 | 0 | 97.67% | 97.67% |
| `github.com/spf13/viper` | 6 | 0 | 0 | 0% | 0 | 0 | 99.1% | 99.1% |
| `github.com/spring-projects/spring-boot` | 11 | 0 | 0 | 0% | 0 | 0 | 99.79% | 99.87% |
| `github.com/spring-projects/spring-framework` | 11 | 0 | 0 | 0% | 0 | 0 | 99.36% | 99.77% |
| `github.com/square/okhttp` | 9 | 0 | 0 | 0% | 0 | 0 | 97.54% | 99.09% |
| `github.com/starship/starship` | 11 | 0 | 0 | 0% | 0 | 0 | 99.76% | 99.81% |
| `github.com/stylelint/stylelint` | 11 | 0 | 0 | 0% | 0 | 0 | 97.22% | 99.57% |
| `github.com/sveltejs/svelte` | 11 | 0 | 0 | 0% | 0 | 0 | 98.54% | 99.14% |
| `github.com/swiftlang/swift-format` | 10 | 0 | 0 | 0% | 0 | 0 | 99.41% | 99.54% |
| `github.com/swiftlang/swift-syntax` | 11 | 0 | 0 | 0% | 0 | 0 | 99.96% | 99.96% |
| `github.com/symfony/symfony` | 11 | 0 | 0 | 0% | 0 | 0 | 99.85% | 99.89% |
| `github.com/tailwindlabs/tailwindcss` | 11 | 0 | 0 | 0% | 0 | 0 | 99.31% | 99.57% |
| `github.com/terraform-aws-modules/terraform-aws-vpc` | 11 | 11 | 0 | 0% | 0 | 0 | 99.2% | 99.2% |
| `github.com/tokio-rs/tokio` | 11 | 0 | 0 | 0% | 0 | 0 | 98.95% | 99.46% |
| `github.com/trufflesecurity/trufflehog` | 8 | 0 | 0 | 0% | 0 | 0 | 99.66% | 99.67% |
| `github.com/uutils/coreutils` | 11 | 0 | 0 | 0% | 0 | 0 | 99.88% | 99.88% |
| `github.com/vapor/vapor` | 11 | 0 | 0 | 0% | 0 | 0 | 99.94% | 99.57% |
| `github.com/vercel/next.js` | 11 | 0 | 0 | 0% | 0 | 0 | 99.7% | 99.75% |
| `github.com/vitejs/vite` | 11 | 0 | 0 | 0% | 0 | 0 | 98.15% | 98.88% |
| `github.com/vuejs/core` | 11 | 0 | 0 | 0% | 0 | 0 | 97.34% | 99.18% |
| `github.com/withastro/astro` | 11 | 0 | 0 | 0.26% | 0 | 0 | 99.14% | 99.5% |
| `github.com/yarnpkg/berry` | 11 | 11 | 0 | 0% | 0 | 0 | 99.55% | 99.55% |
| `github.com/zigtools/zls` | 11 | 0 | 0 | 0% | 0 | 0 | 98.84% | 99.38% |

注: FN/FP 为诊断视图 (不分 gated/exempt, 看未适配仓离达标多远); 零块/边界为全域口径。
</details>

<details>
<summary>规则 × 仓 命中矩阵 (277 规则) — 命中分布与零命中 (死规则候选)</summary>

| 规则 | 总命中 | 命中仓分布 (top 8) |
| --- | --- | --- |
| `python-unittest-progress-noise` | 73106 | github.com/uutils/coreutils (32010), github.com/rust-analyzer/rust-analyzer (16403), github.com/starship/starship (8128), github.com/meta/buck2 (5963), github.com/alacritty/alacritty (3596), github.com/dandavison/delta (1897), github.com/BurntSushi/ripgrep (934), github.com/serde-rs/serde (881) … +14 仓 |
| `gradle-task-progress-noise` | 68427 | github.com/spring-projects/spring-boot (45825), github.com/detekt/detekt (7981), github.com/gradle/gradle (4649), github.com/spring-projects/spring-framework (3247), github.com/square/okhttp (2878), github.com/mockito/mockito (2605), github.com/diffplug/spotless (1165), github.com/bbernhard/signal-cli-rest-api (33) … +2 仓 |
| `cargo-progress-noise` | 54299 | github.com/qdrant/qdrant (7978), github.com/meta/buck2 (7482), github.com/coreos/rpm-ostree (5872), github.com/uutils/coreutils (5509), github.com/rust-analyzer/rust-analyzer (4212), github.com/starship/starship (3394), github.com/dandavison/delta (3309), github.com/alacritty/alacritty (3106) … +19 仓 |
| `go-test-progress-noise` | 19873 | github.com/golangci/golangci-lint (13009), github.com/opentofu/opentofu (1352), github.com/gohugoio/hugo (1343), github.com/cli/cli (1293), github.com/trufflesecurity/trufflehog (1025), github.com/hashicorp/terraform (882), github.com/aquasecurity/trivy (332), github.com/spf13/viper (245) … +4 仓 |
| `ninja-progress-noise` | 18057 | github.com/opencv/opencv (10223), github.com/neovim/neovim (2910), github.com/bitcoin/bitcoin (1014), github.com/libuv/libuv (980), github.com/swiftlang/swift-format (718), github.com/coreos/rpm-ostree (572), github.com/catchorg/Catch2 (476), github.com/niri-wm/niri (461) … +10 仓 |
| `ghc-module-progress-noise` | 13682 | github.com/haskell/haskell-language-server (4509), github.com/commercialhaskell/stack (4076), github.com/haskell/cabal (3516), github.com/hadolint/hadolint (778), github.com/jgm/pandoc (746), github.com/koalaman/shellcheck (57) |
| `cmake-build-progress-noise` | 10426 | github.com/bitcoin/bitcoin (4168), github.com/nlohmann/json (3249), github.com/libuv/libuv (1573), github.com/protocolbuffers/protobuf (477), github.com/fmtlib/fmt (407), github.com/luarocks/luarocks (354), github.com/google/benchmark (198) |
| `make-directory-noise` | 9657 | github.com/nlohmann/json (4360), github.com/erlang/otp (2776), github.com/coreos/rpm-ostree (1230), github.com/openssl/openssl (504), github.com/redis/redis (331), github.com/curl/curl (296), github.com/luarocks/luarocks (72), github.com/duckdb/duckdb (30) … +6 仓 |
| `go-download-noise` | 8186 | github.com/aquasecurity/trivy (1690), github.com/golangci/golangci-lint (1485), github.com/trufflesecurity/trufflehog (1195), github.com/etcd-io/etcd (777), github.com/opentofu/opentofu (582), github.com/grafana/loki (544), github.com/helm/helm (394), github.com/gohugoio/hugo (382) … +13 仓 |
| `pip-install-progress-noise` | 7942 | github.com/tailwindlabs/tailwindcss (3946), github.com/doccano/doccano (345), github.com/pydantic/pydantic (312), github.com/nlohmann/json (269), github.com/django/django (258), github.com/duckdb/duckdb (241), github.com/scikit-learn/scikit-learn (228), github.com/astral-sh/ruff (187) … +102 仓 |
| `node-test-pass-noise` | 6942 | github.com/Alamofire/Alamofire (3311), github.com/stylelint/stylelint (1825), github.com/commercialhaskell/stack (1770), github.com/rollup/rollup (27), github.com/pandas-dev/pandas (5), github.com/openai/openai-python (3), github.com/fastlane/fastlane (1) |
| `credo-result-diff-issue` | 6693 | github.com/rrrene/credo (6693) |
| `maven-test-progress-noise` | 6533 | github.com/google/error-prone (5943), github.com/google/guava (517), github.com/google/auto (73) |
| `github-actions-error-annotation` | 5255 | github.com/google/auto (3200), github.com/protocolbuffers/protobuf (245), github.com/google/re2 (91), github.com/duckdb/duckdb (83), github.com/python-poetry/poetry (55), github.com/trufflesecurity/trufflehog (53), github.com/jekyll/jekyll (49), github.com/golangci/golangci-lint (44) … +139 仓 |
| `github-actions-annotation-substantive` | 4281 | github.com/google/auto (3193), github.com/protocolbuffers/protobuf (237), github.com/google/re2 (87), github.com/duckdb/duckdb (75), github.com/python-poetry/poetry (49), github.com/trufflesecurity/trufflehog (47), github.com/jekyll/jekyll (46), github.com/golangci/golangci-lint (40) … +88 仓 |
| `maven-download-progress-noise` | 3407 | github.com/google/guava (2899), github.com/google/auto (508) |
| `pyright-type-error` | 2650 | github.com/openai/openai-python (2650) |
| `javac-compile-error` | 1911 | github.com/google/auto (1908), github.com/diffplug/spotless (3) |
| `github-actions-runner-version-info` | 1616 | github.com/anomalyco/opencode (19), github.com/niri-wm/niri (19), github.com/nix-community/home-manager (19), github.com/Alamofire/Alamofire (11), github.com/AvaloniaUI/Avalonia (11), github.com/BurntSushi/ripgrep (11), github.com/ClickHouse/ClickHouse (11), github.com/DavidAnson/markdownlint (11) … +142 仓 |
| `vitest-pass-noise` | 1580 | github.com/tailwindlabs/tailwindcss (712), github.com/vitejs/vite (492), github.com/honojs/hono (365), github.com/withastro/astro (11) |
| `pytest-test-failed` | 1341 | github.com/openai/openai-python (1284), github.com/python-poetry/poetry (47), github.com/pandas-dev/pandas (5), github.com/pytest-dev/pytest (3), github.com/qdrant/qdrant (2) |
| `swiftc-compile-error` | 937 | github.com/Alamofire/Alamofire (937) |
| `nvim-test-run-fail` | 855 | github.com/neovim/neovim (855) |
| `pytest-progress-noise` | 710 | github.com/openai/openai-python (604), github.com/nlohmann/json (24), github.com/elixir-lang/elixir (23), github.com/catchorg/Catch2 (14), github.com/duckdb/duckdb (9), github.com/phoenixframework/phoenix (8), github.com/containers/podman (6), github.com/erlang/otp (6) … +8 仓 |
| `playwright-assert-failed` | 468 | github.com/microsoft/playwright (453), github.com/prettier/prettier (12), github.com/anomalyco/opencode (3) |
| `rust-libtest-failed` | 409 | github.com/BurntSushi/ripgrep (328), github.com/starship/starship (28), github.com/uutils/coreutils (19), github.com/qdrant/qdrant (15), github.com/sharkdp/fd (5), github.com/dandavison/delta (4), github.com/serde-rs/serde (3), github.com/astral-sh/ruff (2) … +3 仓 |
| `rust-test-panic` | 376 | github.com/BurntSushi/ripgrep (328), github.com/dandavison/delta (30), github.com/sharkdp/fd (5), github.com/rust-analyzer/rust-analyzer (3), github.com/serde-rs/serde (3), github.com/uutils/coreutils (3), github.com/dtolnay/cxx (2), github.com/niri-wm/niri (1) … +1 仓 |
| `swift-benchmark-regression` | 269 | github.com/vapor/vapor (269) |
| `gcc-clang-diagnostic-error` | 260 | github.com/curl/curl (77), github.com/coreos/rpm-ostree (70), github.com/protocolbuffers/protobuf (52), github.com/fmtlib/fmt (22), github.com/haskell/cabal (10), github.com/bitcoin/bitcoin (7), github.com/duckdb/duckdb (6), github.com/zigtools/zls (6) … +4 仓 |
| `playwright-failed-test-header` | 259 | github.com/microsoft/playwright (258), github.com/anomalyco/opencode (1) |
| `playwright-progress-noise` | 211 | github.com/anomalyco/opencode (211) |
| `jest-test-fail` | 149 | github.com/facebook/react (120), github.com/phoenixframework/phoenix (14), github.com/vercel/next.js (9), github.com/prettier/prettier (6) |
| `gradle-test-case-failed` | 148 | github.com/spring-projects/spring-boot (56), github.com/detekt/detekt (32), github.com/square/okhttp (28), github.com/diffplug/spotless (15), github.com/mockito/mockito (10), github.com/spring-projects/spring-framework (4), github.com/gradle/gradle (3) |
| `python-traceback-uncaught-exception` | 137 | github.com/python-poetry/poetry (37), github.com/mockito/mockito (31), github.com/anomalyco/opencode (14), github.com/rails/rails (11), github.com/astral-sh/ruff (7), github.com/google/auto (6), github.com/ant-design/ant-design (5), github.com/google/error-prone (4) … +15 仓 |
| `mypy-type-error` | 134 | github.com/openai/openai-python (128), github.com/python-poetry/poetry (3), github.com/pandas-dev/pandas (2), github.com/pallets/flask (1) |
| `rustc-error-tree` | 121 | github.com/dtolnay/cxx (28), github.com/serde-rs/serde (26), github.com/uutils/coreutils (26), github.com/niri-wm/niri (16), github.com/alacritty/alacritty (12), github.com/rust-analyzer/rust-analyzer (7), github.com/qdrant/qdrant (4), github.com/starship/starship (2) |
| `deno-test-failed` | 90 | github.com/denoland/deno (90) |
| `make-target-error` | 81 | github.com/duckdb/duckdb (12), github.com/erlang/otp (8), github.com/openssl/openssl (8), github.com/containers/podman (6), github.com/coreos/rpm-ostree (6), github.com/luarocks/luarocks (6), github.com/elixir-lang/elixir (5), github.com/fmtlib/fmt (5) … +10 仓 |
| `go-test-pkg-fail` | 75 | github.com/microsoft/TypeScript (32), github.com/trufflesecurity/trufflehog (9), github.com/opentofu/opentofu (8), github.com/hashicorp/terraform (7), github.com/mvdan/sh (5), github.com/cli/cli (4), github.com/gohugoio/hugo (4), github.com/aquasecurity/trivy (1) … +5 仓 |
| `ninja-failed` | 66 | github.com/neovim/neovim (29), github.com/curl/curl (28), github.com/duckdb/duckdb (6), github.com/bitcoin/bitcoin (1), github.com/fmtlib/fmt (1), github.com/swiftlang/swift-format (1) |
| `ld-linker-error` | 57 | github.com/commercialhaskell/stack (31), github.com/openssl/openssl (8), github.com/libuv/libuv (6), github.com/puma/puma (5), github.com/haskell/haskell-language-server (3), github.com/bitcoin/bitcoin (2), github.com/chipsalliance/verible (2) |
| `pnpm-elifecycle-exit` | 55 | github.com/vercel/next.js (10), github.com/vitejs/vite (8), github.com/withastro/astro (8), github.com/honojs/hono (7), github.com/sveltejs/svelte (7), github.com/tailwindlabs/tailwindcss (7), github.com/vuejs/core (6), github.com/pnpm/pnpm (2) |
| `vitest-test-fail` | 55 | github.com/tailwindlabs/tailwindcss (20), github.com/vitejs/vite (20), github.com/sveltejs/svelte (8), github.com/honojs/hono (7) |
| `phpunit-failed-asserting` | 54 | github.com/phpstan/phpstan (22), github.com/sebastianbergmann/phpunit (21), github.com/laravel/framework (7), github.com/composer/composer (2), github.com/symfony/symfony (2) |
| `git-unified-diff-drift` | 53 | github.com/bitcoin/bitcoin (18), github.com/oven-sh/bun (7), github.com/bbernhard/signal-cli-rest-api (6), github.com/mitmproxy/mitmproxy (5), github.com/coreos/rpm-ostree (2), github.com/fastapi/fastapi (2), github.com/fmtlib/fmt (2), github.com/grafana/helm-charts (2) … +8 仓 |
| `rust-libtest-summary-failed` | 53 | github.com/uutils/coreutils (18), github.com/qdrant/qdrant (15), github.com/dandavison/delta (4), github.com/serde-rs/serde (3), github.com/sharkdp/fd (3), github.com/astral-sh/ruff (2), github.com/dtolnay/cxx (2), github.com/rust-analyzer/rust-analyzer (2) … +3 仓 |
| `maven-goal-failed` | 52 | github.com/google/auto (34), github.com/google/error-prone (8), github.com/redisson/redisson (8), github.com/google/guava (2) |
| `go-test-fail` | 51 | github.com/opentofu/opentofu (15), github.com/hashicorp/terraform (13), github.com/gohugoio/hugo (5), github.com/mvdan/sh (5), github.com/cli/cli (4), github.com/containers/podman (3), github.com/aquasecurity/trivy (2), github.com/caddyserver/caddy (1) … +3 仓 |
| `gcc-clang-driver-error` | 46 | github.com/curl/curl (35), github.com/commercialhaskell/stack (6), github.com/openssl/openssl (3), github.com/haskell/haskell-language-server (2) |
| `git-push-rejected` | 45 | github.com/Homebrew/brew (40), github.com/nix-community/home-manager (3), github.com/laravel/framework (1), github.com/pandas-dev/pandas (1) |
| `gradle-build-failed` | 45 | github.com/diffplug/spotless (8), github.com/mockito/mockito (8), github.com/spring-projects/spring-boot (7), github.com/detekt/detekt (6), github.com/spring-projects/spring-framework (6), github.com/gradle/gradle (5), github.com/square/okhttp (3), github.com/apache/kafka (2) |
| `ninja-build-stopped` | 45 | github.com/curl/curl (28), github.com/duckdb/duckdb (6), github.com/neovim/neovim (6), github.com/ClickHouse/ClickHouse (2), github.com/bitcoin/bitcoin (1), github.com/fmtlib/fmt (1), github.com/swiftlang/swift-format (1) |
| `nvim-test-assertion-detail` | 44 | github.com/neovim/neovim (44) |
| `gradle-task-failed` | 40 | github.com/detekt/detekt (7), github.com/spring-projects/spring-boot (7), github.com/mockito/mockito (6), github.com/spring-projects/spring-framework (6), github.com/diffplug/spotless (5), github.com/gradle/gradle (4), github.com/square/okhttp (3), github.com/apache/kafka (2) |
| `pytest-failures-section` | 39 | github.com/pytest-dev/pytest (11), github.com/openai/openai-python (6), github.com/python-poetry/poetry (5), github.com/pandas-dev/pandas (4), github.com/mitmproxy/mitmproxy (3), github.com/pydantic/pydantic (3), github.com/scikit-learn/scikit-learn (3), github.com/curl/curl (2) … +1 仓 |
| `nix-build-failed` | 37 | github.com/LnL7/nix-darwin (37) |
| `cargo-could-not-compile` | 36 | github.com/niri-wm/niri (7), github.com/qdrant/qdrant (4), github.com/rust-analyzer/rust-analyzer (4), github.com/serde-rs/serde (4), github.com/sharkdp/fd (4), github.com/alacritty/alacritty (3), github.com/uutils/coreutils (3), github.com/coreos/rpm-ostree (2) … +3 仓 |
| `pre-commit-hook-failed` | 33 | github.com/openssl/openssl (6), github.com/psf/requests (6), github.com/terraform-aws-modules/terraform-aws-vpc (6), github.com/fastapi/fastapi (5), github.com/cachix/devenv (2), github.com/haskell/haskell-language-server (2), github.com/pallets/flask (2), github.com/pandas-dev/pandas (2) … +2 仓 |
| `nix-drv-list-noise` | 32 | github.com/nix-community/home-manager (15), github.com/LnL7/nix-darwin (8), github.com/nix-community/nix-direnv (5), github.com/cachix/devenv (2), github.com/DeterminateSystems/magic-nix-cache (1), github.com/jgm/pandoc (1) |
| `dependabot-update-errors` | 31 | github.com/square/okhttp (5), github.com/denoland/deno (3), github.com/eslint/eslint (3), github.com/gradle/gradle (3), github.com/helm/helm (3), github.com/phoenixframework/phoenix (3), github.com/ClickHouse/ClickHouse (2), github.com/python-poetry/poetry (2) … +6 仓 |
| `jest-run-summary` | 30 | github.com/vercel/next.js (12), github.com/prettier/prettier (8), github.com/facebook/react (6), github.com/phoenixframework/phoenix (4) |
| `nix-deprecation-warning` | 30 | github.com/LnL7/nix-darwin (24), github.com/DeterminateSystems/magic-nix-cache (6) |
| `phpstan-error-table` | 30 | github.com/phpstan/phpstan (23), github.com/composer/composer (5), github.com/laravel/framework (2) |
| `vitest-run-summary` | 30 | github.com/tailwindlabs/tailwindcss (12), github.com/vitejs/vite (12), github.com/sveltejs/svelte (4), github.com/honojs/hono (2) |
| `turbo-run-failed` | 29 | github.com/anomalyco/opencode (14), github.com/withastro/astro (12), github.com/vercel/next.js (3) |
| `github-actions-workflow-gate-echo` | 24 | github.com/grpc/grpc-go (11), github.com/apache/kafka (5), github.com/scikit-learn/scikit-learn (4), github.com/psf/black (2), github.com/protocolbuffers/protobuf (1), github.com/rrrene/credo (1) |
| `gradle-test-summary-failed` | 24 | github.com/spring-projects/spring-boot (7), github.com/detekt/detekt (4), github.com/spring-projects/spring-framework (4), github.com/mockito/mockito (3), github.com/square/okhttp (3), github.com/diffplug/spotless (2), github.com/gradle/gradle (1) |
| `bun-test-fail` | 21 | github.com/anomalyco/opencode (21) |
| `git-fetch-ref-not-found` | 21 | github.com/catchorg/Catch2 (11), github.com/Homebrew/brew (10) |
| `ghc-source-error` | 19 | github.com/haskell/cabal (10), github.com/hadolint/hadolint (4), github.com/haskell/haskell-language-server (4), github.com/koalaman/shellcheck (1) |
| `bazel-error` | 18 | github.com/google/xls (11), github.com/protocolbuffers/protobuf (5), github.com/chipsalliance/verible (1), github.com/google/benchmark (1) |
| `cmake-configure-error` | 17 | github.com/duckdb/duckdb (9), github.com/opencv/opencv (5), github.com/swiftlang/swift-format (2), github.com/neovim/neovim (1) |
| `tap-test-failed` | 17 | github.com/libuv/libuv (10), github.com/nix-community/nix-direnv (7) |
| `golangci-lint-issues-summary` | 16 | github.com/golangci/golangci-lint (6), github.com/aquasecurity/trivy (3), github.com/grafana/loki (2), github.com/helm/helm (2), github.com/containers/podman (1), github.com/gin-gonic/gin (1), github.com/trufflesecurity/trufflehog (1) |
| `cabal-structured-error` | 15 | github.com/haskell/cabal (5), github.com/hadolint/hadolint (4), github.com/haskell/haskell-language-server (3), github.com/koalaman/shellcheck (2), github.com/jgm/pandoc (1) |
| `tsc-diagnostic` | 15 | github.com/vuejs/core (8), github.com/DavidAnson/markdownlint (3), github.com/sveltejs/svelte (3), github.com/honojs/hono (1) |
| `maven-surefire-test-failed` | 14 | github.com/google/auto (6), github.com/google/error-prone (6), github.com/google/guava (2) |
| `minitest-failure-report` | 14 | github.com/puma/puma (13), github.com/rails/rails (1) |
| `rspec-failure-error` | 13 | github.com/rubocop/rubocop (11), github.com/Homebrew/brew (2) |
| `cargo-llvm-cov-error` | 12 | github.com/starship/starship (12) |
| `cocoon-wait-for-tests-failed` | 12 | github.com/flutter/flutter (12) |
| `codeql-action-job-status-failure` | 12 | github.com/opencv/opencv (3), github.com/elixir-lang/elixir (2), github.com/redisson/redisson (2), github.com/curl/curl (1), github.com/diffplug/spotless (1), github.com/fastlane/fastlane (1), github.com/fmtlib/fmt (1), github.com/microsoft/TypeScript (1) |
| `fileutils-cannot-access` | 12 | github.com/containers/podman (6), github.com/haskell/haskell-language-server (4), github.com/cli/cli (2) |
| `maven-surefire-failures-summary` | 12 | github.com/google/auto (6), github.com/google/error-prone (5), github.com/google/guava (1) |
| `node-uncaught-exception` | 12 | github.com/ant-design/ant-design (5), github.com/vuejs/core (3), github.com/denoland/deno (2), github.com/nix-community/home-manager (1), github.com/pandas-dev/pandas (1) |
| `npm-network-error` | 12 | github.com/evanw/esbuild (7), github.com/microsoft/TypeScript (5) |
| `bun-script-exit-fail` | 11 | github.com/anomalyco/opencode (9), github.com/oven-sh/bun (2) |
| `eslint-stylish-offense` | 11 | github.com/vercel/next.js (10), github.com/DavidAnson/markdownlint (1) |
| `plenary-test-fail` | 11 | github.com/nvim-telescope/telescope.nvim (11) |
| `stack-structured-error` | 11 | github.com/commercialhaskell/stack (8), github.com/jgm/pandoc (2), github.com/haskell/haskell-language-server (1) |
| `ruby-errno-exception` | 10 | github.com/puma/puma (10) |
| `rustfmt-diff-drift` | 10 | github.com/dandavison/delta (4), github.com/niri-wm/niri (3), github.com/qdrant/qdrant (1), github.com/sharkdp/fd (1), github.com/tokio-rs/tokio (1) |
| `redis-server-bugreport` | 9 | github.com/redis/redis (9) |
| `rspec-rerun-command` | 9 | github.com/fastlane/fastlane (7), github.com/rubocop/rubocop (2) |
| `shell-command-not-found` | 9 | github.com/nvim-telescope/telescope.nvim (4), github.com/containers/podman (3), github.com/alacritty/alacritty (1), github.com/protocolbuffers/protobuf (1) |
| `actionlint-generate-drift` | 8 | github.com/rhysd/actionlint (8) |
| `cargo-deny-lint-error` | 8 | github.com/tokio-rs/tokio (7), github.com/aquasecurity/trivy (1) |
| `cargo-msrv-unsupported` | 8 | github.com/alacritty/alacritty (4), github.com/niri-wm/niri (4) |
| `docker-build-failed` | 8 | github.com/doccano/doccano (4), github.com/mvdan/sh (2), github.com/erlang/otp (1), github.com/koalaman/shellcheck (1) |
| `forgejo-actions-job-failed` | 8 | github.com/moby/moby (6), github.com/grpc/grpc-go (2) |
| `github-actions-cache-not-found` | 8 | github.com/dotnet/roslyn (5), github.com/elixir-lang/elixir (3) |
| `go-http-request-failed` | 8 | github.com/etcd-io/etcd (8) |
| `gotestsum-run-summary` | 8 | github.com/trufflesecurity/trufflehog (3), github.com/grafana/loki (2), github.com/microsoft/TypeScript (2), github.com/moby/moby (1) |
| `homebrew-update-locked` | 8 | github.com/nvim-telescope/telescope.nvim (8) |
| `minitest-run-summary` | 8 | github.com/puma/puma (4), github.com/rails/rails (4) |
| `msvc-compiler-error` | 8 | github.com/luarocks/luarocks (6), github.com/curl/curl (2) |
| `python-unittest-fail` | 8 | github.com/django/django (6), github.com/google/googletest (2) |
| `semgrep-scan-start-failed` | 8 | github.com/semgrep/semgrep (8) |
| `apt-package-unavailable` | 7 | github.com/BurntSushi/ripgrep (7) |
| `cargo-deny-check-summary` | 7 | github.com/tokio-rs/tokio (7) |
| `eslint-stylish-summary` | 7 | github.com/vercel/next.js (4), github.com/eslint/eslint (2), github.com/DavidAnson/markdownlint (1) |
| `fastlane-exit-status` | 7 | github.com/fastlane/fastlane (7) |
| `fastlane-finished-with-errors` | 7 | github.com/fastlane/fastlane (7) |
| `npm-audit-unresolved` | 7 | github.com/rollup/rollup (7) |
| `prettier-check-drift` | 7 | github.com/prettier/prettier (4), github.com/sveltejs/svelte (3) |
| `trivy-vuln-found` | 7 | github.com/gin-gonic/gin (7) |
| `cargo-nextest-run-failed` | 6 | github.com/uutils/coreutils (2), github.com/astral-sh/ruff (1), github.com/pnpm/pnpm (1), github.com/qdrant/qdrant (1), github.com/rust-analyzer/rust-analyzer (1) |
| `commit-lint-violation` | 6 | github.com/JetBrains/Exposed (6) |
| `exunit-failure-entry` | 6 | github.com/elixir-lang/elixir (4), github.com/phoenixframework/phoenix (2) |
| `ghc-gcc-phase-failure` | 6 | github.com/commercialhaskell/stack (6) |
| `nixfmt-fail-on-change` | 6 | github.com/nix-community/home-manager (6) |
| `pnpm-error-tree` | 6 | github.com/vuejs/core (3), github.com/pnpm/pnpm (2), github.com/vitejs/vite (1) |
| `powershell-error-record` | 6 | github.com/containers/podman (2), github.com/luarocks/luarocks (2), github.com/dotnet/aspnetcore (1), github.com/nlohmann/json (1) |
| `praktika-job-fail` | 6 | github.com/ClickHouse/ClickHouse (6) |
| `praktika-run-failed` | 6 | github.com/ClickHouse/ClickHouse (6) |
| `pytest-conftest-import-error` | 6 | github.com/pallets/flask (6) |
| `treefmt-fail-on-change` | 6 | github.com/nix-community/home-manager (6) |
| `wait-on-check-conclusion-not-allowed` | 6 | github.com/flutter/packages (6) |
| `zig-compile-error` | 6 | github.com/zigtools/zls (6) |
| `busted-htest-error-entry` | 5 | github.com/luarocks/luarocks (5) |
| `busted-htest-failed-test-entry` | 5 | github.com/luarocks/luarocks (5) |
| `busted-htest-failure-banner` | 5 | github.com/luarocks/luarocks (5) |
| `changesets-exited-error` | 5 | github.com/stylelint/stylelint (5) |
| `copilot-cli-error` | 5 | github.com/dotnet/aspnetcore (3), github.com/dotnet/runtime (2) |
| `github-actions-checkout-ref-mismatch` | 5 | github.com/catchorg/Catch2 (5) |
| `maven-wrapper-main-missing` | 5 | github.com/google/guava (5) |
| `mypy-found-errors` | 5 | github.com/python-poetry/poetry (2), github.com/openai/openai-python (1), github.com/pallets/flask (1), github.com/pandas-dev/pandas (1) |
| `nix-eval-error-tree` | 5 | github.com/jgm/pandoc (4), github.com/cachix/devenv (1) |
| `swift-tools-version-mismatch` | 5 | github.com/swiftlang/swift-format (5) |
| `ctest-test-failed` | 4 | github.com/libuv/libuv (2), github.com/bitcoin/bitcoin (1), github.com/nlohmann/json (1) |
| `ctest-tests-failed-list` | 4 | github.com/bitcoin/bitcoin (1), github.com/fmtlib/fmt (1), github.com/libuv/libuv (1), github.com/nlohmann/json (1) |
| `npm-run-all-failed-tasks` | 4 | github.com/microsoft/TypeScript (4) |
| `pacman-retrieve-failed` | 4 | github.com/curl/curl (2), github.com/google/benchmark (2) |
| `phpstan-found-errors` | 4 | github.com/phpstan/phpstan (2), github.com/composer/composer (1), github.com/laravel/framework (1) |
| `phpunit-failures-banner` | 4 | github.com/laravel/framework (3), github.com/phpstan/phpstan (1) |
| `rubocop-self-lint-failed` | 4 | github.com/rubocop/rubocop (4) |
| `bitcoin-lint-check-failure` | 3 | github.com/bitcoin/bitcoin (3) |
| `cargo-build-script-failed` | 3 | github.com/niri-wm/niri (3) |
| `check-spelling-unrecognized-words` | 3 | github.com/jekyll/jekyll (3) |
| `clang-format-lint-diff` | 3 | github.com/google/benchmark (3) |
| `exunit-failed-summary` | 3 | github.com/elixir-lang/elixir (2), github.com/phoenixframework/phoenix (1) |
| `git-am-apply-failed` | 3 | github.com/dotnet/aspnetcore (1), github.com/dotnet/runtime (1), github.com/pandas-dev/pandas (1) |
| `nix-flake-attr-missing` | 3 | github.com/anomalyco/opencode (3) |
| `python-logging-critical-message` | 3 | github.com/phpstan/phpstan (3) |
| `redis-test-exception` | 3 | github.com/redis/redis (3) |
| `rust-io-no-such-file` | 3 | github.com/denoland/deno (1), github.com/mvdan/sh (1), github.com/uutils/coreutils (1) |
| `semgrep-findings` | 3 | github.com/nlohmann/json (1), github.com/trufflesecurity/trufflehog (1), github.com/withastro/astro (1) |
| `swift-fatal-error` | 3 | github.com/vapor/vapor (2), github.com/Alamofire/Alamofire (1) |
| `swift-testing-runner-crash` | 3 | github.com/vapor/vapor (3) |
| `zig-build-summary-failed` | 3 | github.com/zigtools/zls (3) |
| `apt-fetch-failed` | 2 | github.com/koalaman/shellcheck (2) |
| `copilot-harness-attempt-failed` | 2 | github.com/cli/cli (2) |
| `curl-cli-error` | 2 | github.com/cachix/devenv (1), github.com/qdrant/qdrant (1) |
| `go-compile-error` | 2 | github.com/containers/podman (1), github.com/golangci/golangci-lint (1) |
| `just-recipe-fail` | 2 | github.com/pnpm/pnpm (2) |
| `kotlinc-compile-error` | 2 | github.com/detekt/detekt (2) |
| `node-command-failed-exit` | 2 | github.com/swiftlang/swift-syntax (2) |
| `npm-run-all-task-exit-error` | 2 | github.com/DavidAnson/markdownlint (2) |
| `oxlint-found-errors` | 2 | github.com/honojs/hono (1), github.com/oven-sh/bun (1) |
| `plenary-tests-failed` | 2 | github.com/nvim-telescope/telescope.nvim (2) |
| `pyright-error-summary` | 2 | github.com/openai/openai-python (2) |
| `redis-test-err` | 2 | github.com/redis/redis (2) |
| `rsync-error` | 2 | github.com/spring-projects/spring-framework (2) |
| `swift-testing-test-failed` | 2 | github.com/vapor/vapor (2) |
| `winget-releaser-token-invalid` | 2 | github.com/dandavison/delta (2) |
| `zig-build-command-failed` | 2 | github.com/zigtools/zls (2) |
| `black-would-reformat` | 1 | github.com/pydantic/pydantic (1) |
| `chocolatey-install-failed` | 1 | github.com/nlohmann/json (1) |
| `commit-lint-msg-overlong-line` | 1 | github.com/jgm/pandoc (1) |
| `credo-strict-suggestions` | 1 | github.com/rrrene/credo (1) |
| `curl-runtests-testfail` | 1 | github.com/curl/curl (1) |
| `gh-api-integration-error` | 1 | github.com/pandas-dev/pandas (1) |
| `gh-cli-error` | 1 | github.com/rust-analyzer/rust-analyzer (1) |
| `github-actions-raw-error-command` | 1 | github.com/nvim-telescope/telescope.nvim (1) |
| `mix-error` | 1 | github.com/rrrene/credo (1) |
| `mocha-test-fail` | 1 | github.com/eslint/eslint (1) |
| `msbuild-build-failed` | 1 | github.com/curl/curl (1) |
| `nix-activation-conflict` | 1 | github.com/LnL7/nix-darwin (1) |
| `node-network-error` | 1 | github.com/rollup/rollup (1) |
| `nvim-test-failure-list-entry` | 1 | github.com/neovim/neovim (1) |
| `playwright-no-report-files` | 1 | github.com/microsoft/playwright (1) |
| `rustc-doc-failed` | 1 | github.com/serde-rs/serde (1) |
| `swift-build-error` | 1 | github.com/Alamofire/Alamofire (1) |
| `trivy-misconf-failures` | 1 | github.com/aquasecurity/trivy (1) |
| `warp-out-of-credits` | 1 | github.com/pnpm/pnpm (1) |
| `xctest-assert-failed` | 1 | github.com/swiftlang/swift-syntax (1) |
| `xctest-test-case-failed` | 1 | github.com/swiftlang/swift-syntax (1) |
| `api-extractor-semantic-error` | 0 |  |
| `bun-error-json` | 0 |  |
| `cabal-build-failed` | 0 |  |
| `cabal-changelog-validation-failed` | 0 |  |
| `cargo-version-conflict` | 0 |  |
| `checkstyle-error` | 0 |  |
| `cloudflare-api-error` | 0 |  |
| `codecov-upload-failed` | 0 |  |
| `codeowners-validator-checks-failed` | 0 |  |
| `csc-diagnostic-error` | 0 |  |
| `docker-registry-pull-failed` | 0 |  |
| `docusaurus-bundle-error` | 0 |  |
| `emmylua-diagnostic` | 0 |  |
| `erlang-signal-stack-failed` | 0 |  |
| `esbuild-build-failed` | 0 |  |
| `esbuild-js-api-tests-failed` | 0 |  |
| `escript-exception` | 0 |  |
| `eslint-ecosystem-plugin-failed` | 0 |  |
| `eslint-offense-line` | 0 |  |
| `fastlane-itms-probe-failed` | 0 |  |
| `flutter-bots-command-failed` | 0 |  |
| `forgejo-actions-poll-noise` | 0 |  |
| `forgejo-actions-runner-version-info` | 0 |  |
| `git-http-access-denied` | 0 |  |
| `git-push-auth-failed` | 0 |  |
| `gitleaks-leaks-found` | 0 |  |
| `go-mod-fetch-error` | 0 |  |
| `go-mod-tidy-diff` | 0 |  |
| `go-toolchain-mismatch` | 0 |  |
| `golangci-lint-config-invalid` | 0 |  |
| `gotestfmt-test-fail` | 0 |  |
| `homebrew-portable-ruby-failed` | 0 |  |
| `infra-disk-quota-exceeded` | 0 |  |
| `lintcommit-invalid-message` | 0 |  |
| `mage-drift-gate-echo` | 0 |  |
| `mastodon-github-action-post-error` | 0 |  |
| `mordant-findings-over-baseline` | 0 |  |
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
| `node-test-fail` | 0 |  |
| `npm-config-error` | 0 |  |
| `npm-missing-script` | 0 |  |
| `octokit-request-error` | 0 |  |
| `opencv-dnn-test-error` | 0 |  |
| `phpunit-php-version-mismatch` | 0 |  |
| `pip-install-error` | 0 |  |
| `podman-image-copy-failed` | 0 |  |
| `proselint-finding` | 0 |  |
| `pyanalyze-error-findings` | 0 |  |
| `qunit-headless-chrome-failed` | 0 |  |
| `ruby-name-error` | 0 |  |
| `scorecard-action-error` | 0 |  |
| `semgrep-invalid-api-key` | 0 |  |
| `signtool-error` | 0 |  |
| `size-limit-exceeded` | 0 |  |
| `stack-hackage-verification-error` | 0 |  |
| `swift-docc-compile-failed` | 0 |  |
| `systemd-ci-unit-fail` | 0 |  |
| `trufflehog-secret-found` | 0 |  |
| `trufflehog-unverified-secret` | 0 |  |
| `uv-require-hashes-unpinned` | 0 |  |
| `verify-pr-title-invalid` | 0 |  |
| `vite-plus-runtime-download-failed` | 0 |  |
| `wait-on-check-never-run` | 0 |  |
| `webpack-hook-error` | 0 |  |

零命中规则 (80 条, dead_rules 候选 — 语料未覆盖的工具或正则失效):
- `api-extractor-semantic-error`
- `bun-error-json`
- `cabal-build-failed`
- `cabal-changelog-validation-failed`
- `cargo-version-conflict`
- `checkstyle-error`
- `cloudflare-api-error`
- `codecov-upload-failed`
- `codeowners-validator-checks-failed`
- `csc-diagnostic-error`
- `docker-registry-pull-failed`
- `docusaurus-bundle-error`
- `emmylua-diagnostic`
- `erlang-signal-stack-failed`
- `esbuild-build-failed`
- `esbuild-js-api-tests-failed`
- `escript-exception`
- `eslint-ecosystem-plugin-failed`
- `eslint-offense-line`
- `fastlane-itms-probe-failed`
- `flutter-bots-command-failed`
- `forgejo-actions-poll-noise`
- `forgejo-actions-runner-version-info`
- `git-http-access-denied`
- `git-push-auth-failed`
- `gitleaks-leaks-found`
- `go-mod-fetch-error`
- `go-mod-tidy-diff`
- `go-toolchain-mismatch`
- `golangci-lint-config-invalid`
- `gotestfmt-test-fail`
- `homebrew-portable-ruby-failed`
- `infra-disk-quota-exceeded`
- `lintcommit-invalid-message`
- `mage-drift-gate-echo`
- `mastodon-github-action-post-error`
- `mordant-findings-over-baseline`
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
- `node-test-fail`
- `npm-config-error`
- `npm-missing-script`
- `octokit-request-error`
- `opencv-dnn-test-error`
- `phpunit-php-version-mismatch`
- `pip-install-error`
- `podman-image-copy-failed`
- `proselint-finding`
- `pyanalyze-error-findings`
- `qunit-headless-chrome-failed`
- `ruby-name-error`
- `scorecard-action-error`
- `semgrep-invalid-api-key`
- `signtool-error`
- `size-limit-exceeded`
- `stack-hackage-verification-error`
- `swift-docc-compile-failed`
- `systemd-ci-unit-fail`
- `trufflehog-secret-found`
- `trufflehog-unverified-secret`
- `uv-require-hashes-unpinned`
- `verify-pr-title-invalid`
- `vite-plus-runtime-download-failed`
- `wait-on-check-never-run`
- `webpack-hook-error`

总命中口径 = signal fragment ∪ noise 剔除区块, 全样本域 (liveness)。
</details>
