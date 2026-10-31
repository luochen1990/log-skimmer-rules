# log-skimmer 回测报告 (每周自动刷新)

- 时点: 2026-10-31 · verdict: **fail** · 引擎 `6de8310` · 规则 `9b5f467` · 语料 `458d2e4`
- 运行记录: https://github.com/luochen1990/log-skimmer-rules/actions/runs/41234204706 · 消费方: README 徽章 — 本文件即其数据源, 勿手工编辑
- 规则 bundle: rules-bundle.json (272 规则) — userscript 消费源 (README §5)

## 判定: ❌ FAIL

- 对比模式: dual-run compare

### 压缩率退化 (相对 base 退化 >2%, 4 仓)

| repo | Δ压缩率 | 本周 blk | base blk |
| --- | --- | --- | --- |
| `github.com/ant-design/ant-design` | -2.2% | 96.61% | 98.78% |
| `github.com/cli/cli` | -2.68% | 94.18% | 96.77% |
| `github.com/fmtlib/fmt` | -6.54% | 92.1% | 98.54% |
| `github.com/microsoft/playwright` | -10.01% | 89.58% | 99.54% |

## gated 组 (断言面)

| 样本 | FN | FP率 | FP行 | 零块 | 边界违例 | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1340 | 0 | 0.01% | 68 | 0 | 0 | 99.45% | 99.48% |

## exempt 组 (报告面, 不进断言 — 豁免余量 = 逐仓适配进度)

豁免样本 255 对 / 豁免仓 24 个 (sidecar gate_exempt: true)。

| 样本 | FN(镜像) | FP率(镜像) | 零块(镜像) | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- |
| 252 | 0 | 0.84% | 0 | 96.9% | 97.2% |

## 规则健康档案

- 诊断覆盖率: 1007/1148 = 87.72% (含 ≥1 非 restating/trivial 失败块的失败族样本 — FN 保证有块, 覆盖保证块由内容决定)
- 分级: trivial (原 restating) 1 (结论复述安全网) / diagnostic 188 (内容决定, 计覆盖) / boundary 3 (断裂带, 人工审)
- 完整健康表 (PPV/Wilson/lift/spec/intent 核对): [reports 分支 rules-health.md](https://github.com/luochen1990/log-skimmer-rules/blob/reports/rules-health.md)

<details>
<summary>逐仓分解 (150 仓) — 样本/豁免/FN/FP/零块/压缩率</summary>

| repo | 样本 | 豁免 | FN | FP率 | 零块 | 边界 | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `github.com/Alamofire/Alamofire` | 10 | 0 | 0 | 0% | 0 | 0 | 99% | 98% |
| `github.com/AvaloniaUI/Avalonia` | 11 | 0 | 0 | 0% | 0 | 0 | 98.46% | 98.75% |
| `github.com/BurntSushi/ripgrep` | 11 | 0 | 0 | 0% | 0 | 0 | 98.93% | 90.96% |
| `github.com/ClickHouse/ClickHouse` | 11 | 0 | 0 | 0% | 0 | 0 | 99.88% | 99.94% |
| `github.com/DavidAnson/markdownlint` | 11 | 0 | 0 | 0% | 0 | 0 | 98.61% | 99.54% |
| `github.com/DeterminateSystems/magic-nix-cache` | 11 | 11 | 0 | 0.05% | 0 | 0 | 99.78% | 99.78% |
| `github.com/DeterminateSystems/nix-installer` | 6 | 6 | 0 | 0% | 0 | 0 | 99.75% | 99.75% |
| `github.com/Homebrew/brew` | 11 | 0 | 0 | 0% | 0 | 0 | 99.68% | 99.67% |
| `github.com/JamesNK/Newtonsoft.Json` | 3 | 0 | 0 | 0% | 0 | 0 | 99.92% | 99.92% |
| `github.com/JetBrains/Exposed` | 11 | 0 | 0 | 0% | 0 | 0 | 98.82% | 99.7% |
| `github.com/LnL7/nix-darwin` | 11 | 0 | 0 | 0% | 0 | 0 | 98.44% | 99.49% |
| `github.com/alacritty/alacritty` | 11 | 0 | 0 | 0.36% | 0 | 0 | 99.22% | 99.5% |
| `github.com/anomalyco/opencode` | 19 | 0 | 0 | 0.06% | 0 | 0 | 99.22% | 99.83% |
| `github.com/ant-design/ant-design` | 11 | 0 | 0 | 0% | 0 | 0 | 96.61% | 98.44% |
| `github.com/apache/kafka` | 11 | 0 | 0 | 0% | 0 | 0 | 99.97% | 99.97% |
| `github.com/aquasecurity/trivy` | 11 | 0 | 0 | 0% | 0 | 0 | 99.49% | 99.48% |
| `github.com/astral-sh/ruff` | 11 | 0 | 0 | 0% | 0 | 0 | 99.78% | 99.89% |
| `github.com/bbernhard/signal-cli-rest-api` | 11 | 11 | 0 | 0% | 0 | 0 | 99.52% | 99.52% |
| `github.com/bitcoin/bitcoin` | 11 | 0 | 0 | 0.02% | 0 | 0 | 99.86% | 99.89% |
| `github.com/bitnami/charts` | 11 | 11 | 0 | 0% | 0 | 0 | 99.06% | 99.06% |
| `github.com/cachix/devenv` | 11 | 11 | 0 | 0% | 0 | 0 | 99.73% | 99.93% |
| `github.com/caddyserver/caddy` | 3 | 0 | 0 | 0% | 0 | 0 | 99.56% | 99.56% |
| `github.com/catchorg/Catch2` | 11 | 0 | 0 | 0% | 0 | 0 | 98.81% | 99.06% |
| `github.com/chipsalliance/verible` | 10 | 10 | 0 | 0% | 0 | 0 | 99.85% | 99.9% |
| `github.com/cli/cli` | 11 | 0 | 0 | 0% | 0 | 0 | 94.18% | 99.11% |
| `github.com/commercialhaskell/stack` | 11 | 0 | 0 | 0% | 0 | 0 | 99.64% | 99.67% |
| `github.com/composer/composer` | 11 | 0 | 0 | 0% | 0 | 0 | 98.94% | 99.22% |
| `github.com/containers/podman` | 11 | 11 | 0 | 0% | 0 | 0 | 99.72% | 99.76% |
| `github.com/coreos/rpm-ostree` | 10 | 10 | 0 | 0% | 0 | 0 | 99.8% | 99.8% |
| `github.com/curl/curl` | 11 | 0 | 0 | 0% | 0 | 0 | 99.4% | 99.71% |
| `github.com/dandavison/delta` | 11 | 0 | 0 | 0% | 0 | 0 | 98.99% | 99.35% |
| `github.com/denoland/deno` | 11 | 0 | 0 | 0% | 0 | 0 | 99.72% | 99.83% |
| `github.com/detekt/detekt` | 11 | 0 | 0 | 0% | 0 | 0 | 98.79% | 98.89% |
| `github.com/diffplug/spotless` | 10 | 0 | 0 | 0% | 0 | 0 | 99.44% | 99.72% |
| `github.com/django/django` | 11 | 0 | 0 | 0% | 0 | 0 | 99.9% | 99.94% |
| `github.com/doccano/doccano` | 11 | 11 | 0 | 0.35% | 0 | 0 | 99.74% | 99.74% |
| `github.com/dotnet/aspnetcore` | 11 | 0 | 0 | 0% | 0 | 0 | 99.74% | 99.74% |
| `github.com/dotnet/roslyn` | 11 | 0 | 0 | 0% | 0 | 0 | 97.99% | 98.33% |
| `github.com/dotnet/runtime` | 11 | 0 | 0 | 0% | 0 | 0 | 93.77% | 99.41% |
| `github.com/dtolnay/cxx` | 11 | 11 | 0 | 0% | 0 | 0 | 95.28% | 99.17% |
| `github.com/duckdb/duckdb` | 11 | 0 | 0 | 0% | 0 | 0 | 99.45% | 98.93% |
| `github.com/elixir-lang/elixir` | 11 | 0 | 0 | 0.12% | 0 | 0 | 99.3% | 99.53% |
| `github.com/erlang/otp` | 11 | 0 | 0 | 0% | 0 | 0 | 99.97% | 99.97% |
| `github.com/eslint/eslint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.33% | 99.44% |
| `github.com/etcd-io/etcd` | 10 | 0 | 0 | 0% | 0 | 0 | 99.61% | 99.61% |
| `github.com/evanw/esbuild` | 11 | 0 | 0 | 0% | 0 | 0 | 99.67% | 99.68% |
| `github.com/facebook/react` | 11 | 11 | 0 | 0% | 0 | 0 | 97.58% | 98.87% |
| `github.com/fastapi/fastapi` | 11 | 0 | 0 | 0% | 0 | 0 | 99.91% | 99.93% |
| `github.com/fastlane/fastlane` | 11 | 0 | 0 | 0% | 0 | 0 | 99.35% | 99.35% |
| `github.com/flutter/flutter` | 11 | 0 | 0 | 0% | 0 | 0 | 99.71% | 99.88% |
| `github.com/flutter/packages` | 11 | 0 | 0 | 0% | 0 | 0 | 99.82% | 99.92% |
| `github.com/fmtlib/fmt` | 11 | 0 | 0 | 0% | 0 | 0 | 92.1% | 98.63% |
| `github.com/gin-gonic/gin` | 11 | 0 | 0 | 0% | 0 | 0 | 99.69% | 99.81% |
| `github.com/gohugoio/hugo` | 11 | 0 | 0 | 0% | 0 | 0 | 99.92% | 99.92% |
| `github.com/golangci/golangci-lint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.82% | 99.83% |
| `github.com/google/auto` | 11 | 11 | 0 | 10.34% | 0 | 0 | 89.21% | 89.75% |
| `github.com/google/benchmark` | 5 | 0 | 0 | 0% | 0 | 0 | 99.92% | 99.92% |
| `github.com/google/error-prone` | 11 | 11 | 0 | 0% | 0 | 0 | 99.53% | 99.85% |
| `github.com/google/googletest` | 3 | 0 | 0 | 0% | 0 | 0 | 99.88% | 99.88% |
| `github.com/google/guava` | 11 | 0 | 0 | 0% | 0 | 0 | 99.36% | 99.74% |
| `github.com/google/re2` | 7 | 7 | 0 | 0% | 0 | 0 | 97.52% | 97.52% |
| `github.com/google/xls` | 11 | 11 | 0 | 0% | 0 | 0 | 99.78% | 99.8% |
| `github.com/gradle/gradle` | 11 | 0 | 0 | 0% | 0 | 0 | 99.49% | 99.86% |
| `github.com/grafana/helm-charts` | 11 | 11 | 0 | 0% | 0 | 0 | 99.93% | 99.93% |
| `github.com/grafana/loki` | 11 | 0 | 0 | 0% | 0 | 0 | 99.23% | 99.24% |
| `github.com/grpc/grpc-go` | 11 | 0 | 0 | 0% | 0 | 0 | 99% | 99% |
| `github.com/hadolint/hadolint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.64% | 99.76% |
| `github.com/hashicorp/terraform` | 11 | 11 | 0 | 0% | 0 | 0 | 99.57% | 99.57% |
| `github.com/haskell/cabal` | 11 | 0 | 0 | 0% | 0 | 0 | 99.69% | 99.7% |
| `github.com/haskell/haskell-language-server` | 11 | 0 | 0 | 0% | 0 | 0 | 99.86% | 99.9% |
| `github.com/helm/helm` | 11 | 0 | 0 | 0% | 0 | 0 | 99.74% | 99.86% |
| `github.com/honojs/hono` | 11 | 0 | 0 | 0% | 0 | 0 | 99.46% | 99.49% |
| `github.com/hyperium/hyper` | 11 | 0 | 0 | 0% | 0 | 0 | 98.47% | 98.47% |
| `github.com/jekyll/jekyll` | 11 | 0 | 0 | 0.1% | 0 | 0 | 98.21% | 98.7% |
| `github.com/jgm/pandoc` | 11 | 0 | 0 | 0.01% | 0 | 0 | 98.66% | 99.94% |
| `github.com/koalaman/shellcheck` | 9 | 0 | 0 | 0% | 0 | 0 | 99.73% | 99.79% |
| `github.com/kubernetes/kubernetes` | 3 | 0 | 0 | 0% | 0 | 0 | 99.97% | 99.97% |
| `github.com/laravel/framework` | 11 | 0 | 0 | 0% | 0 | 0 | 99.16% | 99.64% |
| `github.com/libuv/libuv` | 11 | 0 | 0 | 0% | 0 | 0 | 99.67% | 99.81% |
| `github.com/luarocks/luarocks` | 11 | 0 | 0 | 0% | 0 | 0 | 99.92% | 99.93% |
| `github.com/meta/buck2` | 11 | 11 | 0 | 0% | 0 | 0 | 99.74% | 99.81% |
| `github.com/microsoft/TypeScript` | 11 | 0 | 0 | 0% | 0 | 0 | 99.69% | 99.69% |
| `github.com/microsoft/playwright` | 11 | 0 | 0 | 0% | 0 | 0 | 89.58% | 96.41% |
| `github.com/mitmproxy/mitmproxy` | 11 | 0 | 0 | 0% | 0 | 0 | 99.79% | 99.81% |
| `github.com/moby/moby` | 11 | 0 | 0 | 0% | 0 | 0 | 99.87% | 99.87% |
| `github.com/mockito/mockito` | 7 | 0 | 0 | 0% | 0 | 0 | 99.41% | 99.75% |
| `github.com/mvdan/sh` | 11 | 0 | 0 | 0% | 0 | 0 | 99.34% | 99.34% |
| `github.com/neovim/neovim` | 11 | 0 | 0 | 0% | 0 | 0 | 99.87% | 99.92% |
| `github.com/niri-wm/niri` | 19 | 0 | 0 | 0% | 0 | 0 | 99.07% | 99.67% |
| `github.com/nix-community/home-manager` | 19 | 0 | 0 | 0% | 0 | 0 | 97.47% | 99.85% |
| `github.com/nix-community/nix-direnv` | 6 | 0 | 0 | 0.12% | 0 | 0 | 97.72% | 99.49% |
| `github.com/nlohmann/json` | 11 | 0 | 0 | 0.05% | 0 | 0 | 99.17% | 99.79% |
| `github.com/nvim-telescope/telescope.nvim` | 11 | 0 | 0 | 0% | 0 | 0 | 98.27% | 99.01% |
| `github.com/openai/openai-python` | 11 | 0 | 0 | 0% | 0 | 0 | 98.88% | 99.45% |
| `github.com/opencv/opencv` | 9 | 0 | 0 | 0.08% | 0 | 0 | 99.91% | 99.95% |
| `github.com/openssl/openssl` | 11 | 0 | 0 | 0.06% | 0 | 0 | 99.72% | 99.77% |
| `github.com/opentofu/opentofu` | 10 | 10 | 0 | 0% | 0 | 0 | 51.84% | 51.76% |
| `github.com/oven-sh/bun` | 11 | 0 | 0 | 0% | 0 | 0 | 99.26% | 99.46% |
| `github.com/pallets/flask` | 11 | 0 | 0 | 0% | 0 | 0 | 98.5% | 99.07% |
| `github.com/pandas-dev/pandas` | 11 | 0 | 0 | 0% | 0 | 0 | 99.83% | 99.86% |
| `github.com/phoenixframework/phoenix` | 11 | 0 | 0 | 0% | 0 | 0 | 99.02% | 98.95% |
| `github.com/phpstan/phpstan` | 11 | 0 | 0 | 0% | 0 | 0 | 95.98% | 99.52% |
| `github.com/pnpm/pnpm` | 11 | 0 | 0 | 0% | 0 | 0 | 99.42% | 99.42% |
| `github.com/prettier/prettier` | 11 | 0 | 0 | 0% | 0 | 0 | 98.52% | 98.76% |
| `github.com/prometheus-community/helm-charts` | 11 | 11 | 0 | 0% | 0 | 0 | 99.95% | 99.95% |
| `github.com/protocolbuffers/protobuf` | 11 | 0 | 0 | 0% | 0 | 0 | 99.72% | 99.35% |
| `github.com/psf/black` | 11 | 0 | 0 | 0% | 0 | 0 | 99.29% | 99.29% |
| `github.com/psf/requests` | 11 | 0 | 0 | 0% | 0 | 0 | 98.4% | 98.4% |
| `github.com/puma/puma` | 11 | 0 | 0 | 0% | 0 | 0 | 99.66% | 99.68% |
| `github.com/pydantic/pydantic` | 11 | 0 | 0 | 0% | 0 | 0 | 99.52% | 99.58% |
| `github.com/pytest-dev/pytest` | 11 | 0 | 0 | 0% | 0 | 0 | 99.84% | 99.84% |
| `github.com/python-poetry/poetry` | 11 | 11 | 0 | 0% | 0 | 0 | 99.17% | 99.58% |
| `github.com/qdrant/qdrant` | 11 | 0 | 0 | 0.02% | 0 | 0 | 99.79% | 99.81% |
| `github.com/rails/rails` | 11 | 0 | 0 | 0% | 0 | 0 | 99.87% | 99.87% |
| `github.com/redis/redis` | 11 | 0 | 0 | 0% | 0 | 0 | 99.9% | 99.91% |
| `github.com/redisson/redisson` | 11 | 11 | 0 | 0% | 0 | 0 | 98.74% | 99.91% |
| `github.com/rhysd/actionlint` | 11 | 0 | 0 | 0% | 0 | 0 | 98.35% | 99.67% |
| `github.com/rollup/rollup` | 11 | 0 | 0 | 0% | 0 | 0 | 99.83% | 99.87% |
| `github.com/rrrene/credo` | 11 | 0 | 0 | 0% | 0 | 0 | 99.91% | 92.2% |
| `github.com/rubocop/rubocop` | 11 | 0 | 0 | 0.13% | 0 | 0 | 99.57% | 99.57% |
| `github.com/rust-analyzer/rust-analyzer` | 11 | 0 | 0 | 0% | 0 | 0 | 99.9% | 99.93% |
| `github.com/scikit-learn/scikit-learn` | 11 | 0 | 0 | 0% | 0 | 0 | 99.87% | 99.9% |
| `github.com/sebastianbergmann/phpunit` | 11 | 0 | 0 | 0% | 0 | 0 | 97.01% | 99.15% |
| `github.com/semgrep/semgrep` | 11 | 0 | 0 | 0% | 0 | 0 | 99.72% | 99.72% |
| `github.com/serde-rs/serde` | 11 | 0 | 0 | 0% | 0 | 0 | 98.45% | 99.08% |
| `github.com/sharkdp/bat` | 11 | 0 | 0 | 0% | 0 | 0 | 99.66% | 99.83% |
| `github.com/sharkdp/fd` | 11 | 0 | 0 | 0% | 0 | 0 | 99.25% | 99.52% |
| `github.com/spf13/cobra` | 3 | 0 | 0 | 0% | 0 | 0 | 97.67% | 97.67% |
| `github.com/spf13/viper` | 5 | 0 | 0 | 0% | 0 | 0 | 99.15% | 99.15% |
| `github.com/spring-projects/spring-boot` | 11 | 0 | 0 | 0.05% | 0 | 0 | 99.73% | 99.91% |
| `github.com/spring-projects/spring-framework` | 11 | 0 | 0 | 0% | 0 | 0 | 99.2% | 99.71% |
| `github.com/square/okhttp` | 11 | 0 | 0 | 0% | 0 | 0 | 98.74% | 99.63% |
| `github.com/starship/starship` | 11 | 0 | 0 | 0% | 0 | 0 | 99.86% | 99.87% |
| `github.com/stylelint/stylelint` | 11 | 0 | 0 | 0% | 0 | 0 | 98.93% | 99.16% |
| `github.com/sveltejs/svelte` | 11 | 0 | 0 | 0% | 0 | 0 | 98.66% | 99.21% |
| `github.com/swiftlang/swift-format` | 11 | 0 | 0 | 0% | 0 | 0 | 98.97% | 99.42% |
| `github.com/swiftlang/swift-syntax` | 10 | 0 | 0 | 0% | 0 | 0 | 99.81% | 99.83% |
| `github.com/symfony/symfony` | 11 | 0 | 0 | 0% | 0 | 0 | 99.83% | 99.95% |
| `github.com/tailwindlabs/tailwindcss` | 10 | 0 | 0 | 0% | 0 | 0 | 99.19% | 99.53% |
| `github.com/terraform-aws-modules/terraform-aws-vpc` | 11 | 11 | 0 | 0% | 0 | 0 | 99.25% | 99.25% |
| `github.com/tokio-rs/tokio` | 11 | 0 | 0 | 0% | 0 | 0 | 99.52% | 99.65% |
| `github.com/trufflesecurity/trufflehog` | 11 | 0 | 0 | 0% | 0 | 0 | 99.68% | 99.68% |
| `github.com/uutils/coreutils` | 11 | 0 | 0 | 0% | 0 | 0 | 99.8% | 99.87% |
| `github.com/vapor/vapor` | 11 | 0 | 0 | 0% | 0 | 0 | 99.93% | 99.84% |
| `github.com/vercel/next.js` | 11 | 0 | 0 | 0% | 0 | 0 | 99.36% | 99.69% |
| `github.com/vitejs/vite` | 11 | 0 | 0 | 0% | 0 | 0 | 97.97% | 98.08% |
| `github.com/vuejs/core` | 11 | 0 | 0 | 0% | 0 | 0 | 97.58% | 98.83% |
| `github.com/withastro/astro` | 11 | 0 | 0 | 0.38% | 0 | 0 | 99.69% | 99.85% |
| `github.com/yarnpkg/berry` | 11 | 11 | 0 | 0% | 0 | 0 | 99.54% | 99.54% |
| `github.com/zigtools/zls` | 11 | 0 | 0 | 0% | 0 | 0 | 98.62% | 99.26% |

注: FN/FP 为诊断视图 (不分 gated/exempt, 看未适配仓离达标多远); 零块/边界为全域口径。
</details>

<details>
<summary>规则 × 仓 命中矩阵 (272 规则) — 命中分布与零命中 (死规则候选)</summary>

| 规则 | 总命中 | 命中仓分布 (top 8) |
| --- | --- | --- |
| `python-unittest-progress-noise` | 142481 | github.com/django/django (55497), github.com/rust-analyzer/rust-analyzer (40573), github.com/meta/buck2 (10198), github.com/uutils/coreutils (9963), github.com/starship/starship (9520), github.com/opencv/opencv (4237), github.com/alacritty/alacritty (2924), github.com/dandavison/delta (1897) … +15 仓 |
| `gradle-task-progress-noise` | 85162 | github.com/spring-projects/spring-boot (58055), github.com/apache/kafka (6084), github.com/gradle/gradle (5694), github.com/square/okhttp (4828), github.com/spring-projects/spring-framework (4318), github.com/detekt/detekt (4178), github.com/diffplug/spotless (1094), github.com/mockito/mockito (852) … +2 仓 |
| `cargo-progress-noise` | 40677 | github.com/coreos/rpm-ostree (5491), github.com/uutils/coreutils (4897), github.com/rust-analyzer/rust-analyzer (4495), github.com/dandavison/delta (3307), github.com/starship/starship (3147), github.com/alacritty/alacritty (2890), github.com/astral-sh/ruff (2539), github.com/meta/buck2 (2461) … +17 仓 |
| `ninja-progress-noise` | 30436 | github.com/opencv/opencv (19718), github.com/neovim/neovim (5227), github.com/libuv/libuv (1547), github.com/bitcoin/bitcoin (1130), github.com/coreos/rpm-ostree (681), github.com/scikit-learn/scikit-learn (508), github.com/swiftlang/swift-syntax (422), github.com/vapor/vapor (279) … +13 仓 |
| `node-test-pass-noise` | 29309 | github.com/withastro/astro (16183), github.com/rollup/rollup (5823), github.com/Alamofire/Alamofire (3311), github.com/commercialhaskell/stack (1770), github.com/stylelint/stylelint (1449), github.com/hadolint/hadolint (752), github.com/semgrep/semgrep (8), github.com/pandas-dev/pandas (7) … +4 仓 |
| `go-test-progress-noise` | 22388 | github.com/golangci/golangci-lint (17241), github.com/gohugoio/hugo (2307), github.com/trufflesecurity/trufflehog (1020), github.com/grpc/grpc-go (443), github.com/opentofu/opentofu (287), github.com/spf13/viper (245), github.com/grafana/loki (143), github.com/mvdan/sh (132) … +6 仓 |
| `ghc-module-progress-noise` | 17453 | github.com/haskell/haskell-language-server (8873), github.com/jgm/pandoc (3791), github.com/commercialhaskell/stack (2077), github.com/haskell/cabal (1889), github.com/hadolint/hadolint (762), github.com/koalaman/shellcheck (61) |
| `github-actions-error-annotation` | 9524 | github.com/google/auto (4358), github.com/opentofu/opentofu (3426), github.com/google/re2 (91), github.com/trufflesecurity/trufflehog (88), github.com/golangci/golangci-lint (58), github.com/jekyll/jekyll (49), github.com/AvaloniaUI/Avalonia (35), github.com/google/xls (29) … +138 仓 |
| `github-actions-annotation-substantive` | 8539 | github.com/google/auto (4350), github.com/opentofu/opentofu (3418), github.com/google/re2 (87), github.com/trufflesecurity/trufflehog (80), github.com/golangci/golangci-lint (53), github.com/jekyll/jekyll (46), github.com/AvaloniaUI/Avalonia (32), github.com/google/xls (21) … +88 仓 |
| `go-download-noise` | 8364 | github.com/aquasecurity/trivy (1585), github.com/opentofu/opentofu (1490), github.com/golangci/golangci-lint (1482), github.com/trufflesecurity/trufflehog (1214), github.com/etcd-io/etcd (774), github.com/gohugoio/hugo (599), github.com/helm/helm (315), github.com/hashicorp/terraform (269) … +11 仓 |
| `pip-install-progress-noise` | 7362 | github.com/fastapi/fastapi (1477), github.com/tailwindlabs/tailwindcss (730), github.com/pydantic/pydantic (550), github.com/django/django (549), github.com/doccano/doccano (468), github.com/scikit-learn/scikit-learn (454), github.com/apache/kafka (356), github.com/psf/black (326) … +96 仓 |
| `maven-test-progress-noise` | 7111 | github.com/google/error-prone (5951), github.com/google/guava (1020), github.com/google/auto (140) |
| `credo-result-diff-issue` | 6693 | github.com/rrrene/credo (6693) |
| `cmake-build-progress-noise` | 6344 | github.com/bitcoin/bitcoin (3868), github.com/nlohmann/json (1405), github.com/fmtlib/fmt (403), github.com/luarocks/luarocks (354), github.com/protocolbuffers/protobuf (199), github.com/catchorg/Catch2 (115) |
| `make-directory-noise` | 4884 | github.com/erlang/otp (2742), github.com/nlohmann/json (1396), github.com/curl/curl (320), github.com/redis/redis (198), github.com/luarocks/luarocks (72), github.com/coreos/rpm-ostree (48), github.com/duckdb/duckdb (40), github.com/openssl/openssl (22) … +7 仓 |
| `maven-download-progress-noise` | 3540 | github.com/google/guava (2770), github.com/google/auto (770) |
| `go-mod-fetch-error` | 3435 | github.com/opentofu/opentofu (3434), github.com/aquasecurity/trivy (1) |
| `go-compile-error` | 3419 | github.com/opentofu/opentofu (3415), github.com/trufflesecurity/trufflehog (2), github.com/aquasecurity/trivy (1), github.com/golangci/golangci-lint (1) |
| `javac-compile-error` | 2546 | github.com/google/auto (2544), github.com/diffplug/spotless (2) |
| `vitest-pass-noise` | 2076 | github.com/vitejs/vite (700), github.com/tailwindlabs/tailwindcss (623), github.com/vuejs/core (501), github.com/honojs/hono (241), github.com/withastro/astro (11) |
| `github-actions-runner-version-info` | 1604 | github.com/anomalyco/opencode (19), github.com/niri-wm/niri (19), github.com/nix-community/home-manager (19), github.com/Alamofire/Alamofire (11), github.com/AvaloniaUI/Avalonia (11), github.com/BurntSushi/ripgrep (11), github.com/ClickHouse/ClickHouse (11), github.com/DavidAnson/markdownlint (11) … +142 仓 |
| `pytest-progress-noise` | 1545 | github.com/openai/openai-python (1140), github.com/fastapi/fastapi (253), github.com/duckdb/duckdb (55), github.com/bitcoin/bitcoin (32), github.com/elixir-lang/elixir (23), github.com/catchorg/Catch2 (14), github.com/Homebrew/brew (8), github.com/phoenixframework/phoenix (8) … +6 仓 |
| `swiftc-compile-error` | 943 | github.com/Alamofire/Alamofire (937), github.com/swiftlang/swift-syntax (6) |
| `playwright-progress-noise` | 635 | github.com/anomalyco/opencode (635) |
| `playwright-assert-failed` | 514 | github.com/microsoft/playwright (450), github.com/prettier/prettier (48), github.com/anomalyco/opencode (13), github.com/vercel/next.js (3) |
| `rust-libtest-failed` | 401 | github.com/BurntSushi/ripgrep (328), github.com/uutils/coreutils (36), github.com/meta/buck2 (8), github.com/starship/starship (8), github.com/sharkdp/fd (6), github.com/rust-analyzer/rust-analyzer (5), github.com/dandavison/delta (4), github.com/serde-rs/serde (3) … +2 仓 |
| `rust-test-panic` | 392 | github.com/BurntSushi/ripgrep (328), github.com/dandavison/delta (30), github.com/meta/buck2 (8), github.com/sharkdp/fd (6), github.com/uutils/coreutils (6), github.com/rust-analyzer/rust-analyzer (4), github.com/serde-rs/serde (3), github.com/dtolnay/cxx (2) … +3 仓 |
| `go-test-pkg-fail` | 333 | github.com/opentofu/opentofu (283), github.com/trufflesecurity/trufflehog (20), github.com/gohugoio/hugo (8), github.com/mvdan/sh (5), github.com/microsoft/TypeScript (4), github.com/moby/moby (3), github.com/evanw/esbuild (2), github.com/golangci/golangci-lint (2) … +5 仓 |
| `python-traceback-uncaught-exception` | 271 | github.com/phpstan/phpstan (121), github.com/anomalyco/opencode (73), github.com/spring-projects/spring-boot (18), github.com/django/django (8), github.com/google/auto (8), github.com/mockito/mockito (8), github.com/google/error-prone (4), github.com/openai/openai-python (4) … +15 仓 |
| `playwright-failed-test-header` | 248 | github.com/microsoft/playwright (245), github.com/anomalyco/opencode (3) |
| `jest-test-fail` | 187 | github.com/facebook/react (120), github.com/vercel/next.js (45), github.com/phoenixframework/phoenix (14), github.com/prettier/prettier (8) |
| `gradle-test-case-failed` | 175 | github.com/detekt/detekt (116), github.com/spring-projects/spring-boot (25), github.com/diffplug/spotless (15), github.com/spring-projects/spring-framework (8), github.com/gradle/gradle (6), github.com/square/okhttp (5) |
| `gcc-clang-diagnostic-error` | 162 | github.com/curl/curl (91), github.com/fmtlib/fmt (23), github.com/bitcoin/bitcoin (10), github.com/haskell/cabal (8), github.com/nlohmann/json (7), github.com/zigtools/zls (6), github.com/hadolint/hadolint (4), github.com/libuv/libuv (4) … +5 仓 |
| `vitest-test-fail` | 137 | github.com/vitejs/vite (89), github.com/vuejs/core (17), github.com/sveltejs/svelte (12), github.com/honojs/hono (11), github.com/tailwindlabs/tailwindcss (8) |
| `node-uncaught-exception` | 134 | github.com/phpstan/phpstan (121), github.com/ant-design/ant-design (3), github.com/vuejs/core (3), github.com/withastro/astro (3), github.com/cachix/devenv (1), github.com/gradle/gradle (1), github.com/nix-community/home-manager (1), github.com/rollup/rollup (1) |
| `ninja-failed` | 127 | github.com/duckdb/duckdb (79), github.com/curl/curl (34), github.com/neovim/neovim (9), github.com/fmtlib/fmt (2), github.com/protocolbuffers/protobuf (2), github.com/libuv/libuv (1) |
| `ld-linker-error` | 124 | github.com/curl/curl (50), github.com/haskell/cabal (33), github.com/commercialhaskell/stack (27), github.com/puma/puma (5), github.com/redis/redis (4), github.com/bitcoin/bitcoin (2), github.com/chipsalliance/verible (2), github.com/semgrep/semgrep (1) |
| `make-target-error` | 112 | github.com/nlohmann/json (15), github.com/openssl/openssl (15), github.com/redis/redis (14), github.com/duckdb/duckdb (10), github.com/erlang/otp (9), github.com/containers/podman (6), github.com/elixir-lang/elixir (6), github.com/luarocks/luarocks (6) … +12 仓 |
| `rustc-error-tree` | 99 | github.com/dtolnay/cxx (28), github.com/serde-rs/serde (26), github.com/niri-wm/niri (21), github.com/alacritty/alacritty (12), github.com/astral-sh/ruff (4), github.com/oven-sh/bun (4), github.com/rust-analyzer/rust-analyzer (2), github.com/tokio-rs/tokio (2) |
| `jest-run-summary` | 78 | github.com/vercel/next.js (62), github.com/facebook/react (6), github.com/prettier/prettier (6), github.com/phoenixframework/phoenix (4) |
| `gcc-clang-driver-error` | 76 | github.com/curl/curl (60), github.com/commercialhaskell/stack (5), github.com/haskell/haskell-language-server (4), github.com/bitcoin/bitcoin (2), github.com/jgm/pandoc (2), github.com/fmtlib/fmt (1), github.com/libuv/libuv (1), github.com/semgrep/semgrep (1) |
| `git-unified-diff-drift` | 72 | github.com/bitcoin/bitcoin (40), github.com/mitmproxy/mitmproxy (7), github.com/bbernhard/signal-cli-rest-api (6), github.com/grafana/loki (3), github.com/swiftlang/swift-syntax (3), github.com/coreos/rpm-ostree (2), github.com/flutter/flutter (2), github.com/honojs/hono (2) … +7 仓 |
| `apt-fetch-failed` | 67 | github.com/coreos/rpm-ostree (44), github.com/fmtlib/fmt (21), github.com/koalaman/shellcheck (2) |
| `maven-goal-failed` | 66 | github.com/google/auto (48), github.com/google/error-prone (8), github.com/redisson/redisson (7), github.com/google/guava (3) |
| `bazel-error` | 64 | github.com/protocolbuffers/protobuf (53), github.com/google/xls (9), github.com/chipsalliance/verible (1), github.com/google/benchmark (1) |
| `rust-libtest-summary-failed` | 62 | github.com/uutils/coreutils (32), github.com/meta/buck2 (7), github.com/rust-analyzer/rust-analyzer (5), github.com/dandavison/delta (4), github.com/sharkdp/fd (4), github.com/serde-rs/serde (3), github.com/starship/starship (3), github.com/dtolnay/cxx (2) … +2 仓 |
| `phpunit-failed-asserting` | 60 | github.com/sebastianbergmann/phpunit (21), github.com/symfony/symfony (16), github.com/laravel/framework (14), github.com/phpstan/phpstan (6), github.com/composer/composer (3) |
| `swift-benchmark-regression` | 54 | github.com/vapor/vapor (54) |
| `pnpm-elifecycle-exit` | 48 | github.com/withastro/astro (12), github.com/vitejs/vite (8), github.com/vuejs/core (8), github.com/sveltejs/svelte (7), github.com/tailwindlabs/tailwindcss (6), github.com/honojs/hono (5), github.com/vercel/next.js (2) |
| `ninja-build-stopped` | 42 | github.com/curl/curl (34), github.com/neovim/neovim (5), github.com/fmtlib/fmt (2), github.com/libuv/libuv (1) |
| `gradle-build-failed` | 41 | github.com/diffplug/spotless (8), github.com/spring-projects/spring-framework (7), github.com/spring-projects/spring-boot (6), github.com/square/okhttp (6), github.com/detekt/detekt (5), github.com/gradle/gradle (5), github.com/mockito/mockito (4) |
| `vitest-run-summary` | 41 | github.com/vitejs/vite (16), github.com/vuejs/core (10), github.com/sveltejs/svelte (6), github.com/tailwindlabs/tailwindcss (5), github.com/honojs/hono (4) |
| `gradle-task-failed` | 40 | github.com/detekt/detekt (12), github.com/spring-projects/spring-framework (7), github.com/square/okhttp (6), github.com/diffplug/spotless (5), github.com/gradle/gradle (4), github.com/spring-projects/spring-boot (4), github.com/mockito/mockito (2) |
| `turbo-run-failed` | 40 | github.com/anomalyco/opencode (22), github.com/withastro/astro (9), github.com/vercel/next.js (6), github.com/tailwindlabs/tailwindcss (3) |
| `cargo-could-not-compile` | 39 | github.com/niri-wm/niri (10), github.com/astral-sh/ruff (4), github.com/qdrant/qdrant (4), github.com/serde-rs/serde (4), github.com/sharkdp/fd (4), github.com/alacritty/alacritty (3), github.com/rust-analyzer/rust-analyzer (3), github.com/oven-sh/bun (2) … +3 仓 |
| `nix-build-failed` | 37 | github.com/LnL7/nix-darwin (37) |
| `csc-diagnostic-error` | 33 | github.com/AvaloniaUI/Avalonia (32), github.com/dotnet/aspnetcore (1) |
| `dependabot-update-errors` | 28 | github.com/python-poetry/poetry (5), github.com/cli/cli (4), github.com/facebook/react (4), github.com/cachix/devenv (3), github.com/dotnet/runtime (3), github.com/helm/helm (3), github.com/gradle/gradle (2), github.com/square/okhttp (2) … +2 仓 |
| `nix-drv-list-noise` | 28 | github.com/nix-community/home-manager (11), github.com/LnL7/nix-darwin (7), github.com/nix-community/nix-direnv (4), github.com/cachix/devenv (2), github.com/jgm/pandoc (2), github.com/DeterminateSystems/magic-nix-cache (1), github.com/grafana/loki (1) |
| `bun-test-fail` | 27 | github.com/anomalyco/opencode (20), github.com/oven-sh/bun (7) |
| `go-test-fail` | 27 | github.com/gohugoio/hugo (9), github.com/containers/podman (5), github.com/mvdan/sh (5), github.com/golangci/golangci-lint (3), github.com/evanw/esbuild (2), github.com/grafana/loki (1), github.com/opentofu/opentofu (1), github.com/spf13/viper (1) |
| `nix-deprecation-warning` | 27 | github.com/LnL7/nix-darwin (24), github.com/DeterminateSystems/magic-nix-cache (2), github.com/cachix/devenv (1) |
| `rspec-failure-error` | 27 | github.com/rubocop/rubocop (21), github.com/Homebrew/brew (6) |
| `pre-commit-hook-failed` | 25 | github.com/terraform-aws-modules/terraform-aws-vpc (6), github.com/haskell/haskell-language-server (4), github.com/pandas-dev/pandas (4), github.com/psf/requests (4), github.com/pydantic/pydantic (3), github.com/pallets/flask (2), github.com/astral-sh/ruff (1), github.com/google/xls (1) |
| `tap-test-failed` | 24 | github.com/nix-community/nix-direnv (13), github.com/openssl/openssl (10), github.com/libuv/libuv (1) |
| `docker-build-failed` | 23 | github.com/coreos/rpm-ostree (12), github.com/doccano/doccano (4), github.com/mvdan/sh (2), github.com/Homebrew/brew (1), github.com/cachix/devenv (1), github.com/gohugoio/hugo (1), github.com/koalaman/shellcheck (1), github.com/moby/moby (1) |
| `fileutils-cannot-access` | 23 | github.com/containers/podman (12), github.com/haskell/haskell-language-server (6), github.com/curl/curl (5) |
| `gradle-test-summary-failed` | 22 | github.com/detekt/detekt (5), github.com/square/okhttp (5), github.com/spring-projects/spring-framework (4), github.com/spring-projects/spring-boot (3), github.com/diffplug/spotless (2), github.com/gradle/gradle (2), github.com/mockito/mockito (1) |
| `github-actions-workflow-gate-echo` | 21 | github.com/grpc/grpc-go (7), github.com/scikit-learn/scikit-learn (5), github.com/apache/kafka (4), github.com/protocolbuffers/protobuf (3), github.com/psf/black (1), github.com/rrrene/credo (1) |
| `node-test-fail` | 21 | github.com/withastro/astro (15), github.com/stylelint/stylelint (6) |
| `tsc-diagnostic` | 21 | github.com/stylelint/stylelint (8), github.com/vercel/next.js (6), github.com/DavidAnson/markdownlint (4), github.com/prettier/prettier (2), github.com/honojs/hono (1) |
| `pytest-test-failed` | 20 | github.com/python-poetry/poetry (13), github.com/openai/openai-python (5), github.com/pandas-dev/pandas (1), github.com/qdrant/qdrant (1) |
| `git-fetch-ref-not-found` | 18 | github.com/catchorg/Catch2 (11), github.com/phpstan/phpstan (6), github.com/DeterminateSystems/magic-nix-cache (1) |
| `python-unittest-fail` | 18 | github.com/django/django (18) |
| `infra-disk-quota-exceeded` | 16 | github.com/aquasecurity/trivy (16) |
| `maven-surefire-test-failed` | 16 | github.com/google/auto (8), github.com/google/error-prone (6), github.com/google/guava (2) |
| `pytest-failures-section` | 16 | github.com/fastapi/fastapi (4), github.com/openai/openai-python (3), github.com/curl/curl (2), github.com/mitmproxy/mitmproxy (2), github.com/pydantic/pydantic (2), github.com/pandas-dev/pandas (1), github.com/python-poetry/poetry (1), github.com/qdrant/qdrant (1) |
| `swift-build-error` | 16 | github.com/vapor/vapor (12), github.com/swiftlang/swift-syntax (3), github.com/Alamofire/Alamofire (1) |
| `bun-script-exit-fail` | 15 | github.com/anomalyco/opencode (13), github.com/oven-sh/bun (2) |
| `exunit-failure-entry` | 15 | github.com/phoenixframework/phoenix (9), github.com/elixir-lang/elixir (6) |
| `ghc-source-error` | 15 | github.com/haskell/cabal (8), github.com/hadolint/hadolint (4), github.com/koalaman/shellcheck (2), github.com/jgm/pandoc (1) |
| `maven-surefire-failures-summary` | 14 | github.com/google/auto (8), github.com/google/error-prone (5), github.com/google/guava (1) |
| `cabal-structured-error` | 13 | github.com/hadolint/hadolint (5), github.com/haskell/haskell-language-server (4), github.com/jgm/pandoc (2), github.com/koalaman/shellcheck (2) |
| `eslint-ecosystem-plugin-failed` | 13 | github.com/eslint/eslint (12), github.com/dotnet/aspnetcore (1) |
| `golangci-lint-issues-summary` | 13 | github.com/golangci/golangci-lint (5), github.com/helm/helm (4), github.com/containers/podman (2), github.com/aquasecurity/trivy (1), github.com/grafana/loki (1) |
| `minitest-failure-report` | 13 | github.com/puma/puma (13) |
| `cargo-llvm-cov-error` | 12 | github.com/starship/starship (12) |
| `rustfmt-diff-drift` | 12 | github.com/dandavison/delta (4), github.com/uutils/coreutils (4), github.com/sharkdp/bat (2), github.com/niri-wm/niri (1), github.com/sharkdp/fd (1) |
| `stack-hackage-verification-error` | 12 | github.com/commercialhaskell/stack (12) |
| `cmake-configure-error` | 11 | github.com/neovim/neovim (8), github.com/swiftlang/swift-format (3) |
| `kotlinc-compile-error` | 11 | github.com/detekt/detekt (11) |
| `npm-run-all-task-exit-error` | 11 | github.com/rollup/rollup (7), github.com/DavidAnson/markdownlint (4) |
| `plenary-test-fail` | 11 | github.com/nvim-telescope/telescope.nvim (11) |
| `rspec-rerun-command` | 11 | github.com/fastlane/fastlane (8), github.com/rubocop/rubocop (3) |
| `shell-command-not-found` | 11 | github.com/nvim-telescope/telescope.nvim (4), github.com/caddyserver/caddy (2), github.com/grafana/loki (2), github.com/alacritty/alacritty (1), github.com/protocolbuffers/protobuf (1), github.com/redis/redis (1) |
| `codeql-action-job-status-failure` | 10 | github.com/redisson/redisson (3), github.com/elixir-lang/elixir (2), github.com/opencv/opencv (2), github.com/diffplug/spotless (1), github.com/nlohmann/json (1), github.com/spring-projects/spring-boot (1) |
| `deno-test-failed` | 10 | github.com/denoland/deno (10) |
| `go-http-request-failed` | 10 | github.com/etcd-io/etcd (8), github.com/cli/cli (1), github.com/containers/podman (1) |
| `redis-test-err` | 10 | github.com/redis/redis (10) |
| `ruby-errno-exception` | 10 | github.com/puma/puma (10) |
| `cargo-msrv-unsupported` | 9 | github.com/alacritty/alacritty (4), github.com/tokio-rs/tokio (3), github.com/niri-wm/niri (2) |
| `flutter-bots-command-failed` | 9 | github.com/flutter/flutter (9) |
| `ghc-gcc-phase-failure` | 9 | github.com/commercialhaskell/stack (9) |
| `msvc-compiler-error` | 9 | github.com/luarocks/luarocks (6), github.com/curl/curl (3) |
| `stack-structured-error` | 9 | github.com/commercialhaskell/stack (6), github.com/haskell/haskell-language-server (2), github.com/jgm/pandoc (1) |
| `actionlint-generate-drift` | 8 | github.com/rhysd/actionlint (8) |
| `github-actions-cache-not-found` | 8 | github.com/dotnet/roslyn (5), github.com/elixir-lang/elixir (3) |
| `homebrew-update-locked` | 8 | github.com/nvim-telescope/telescope.nvim (8) |
| `trivy-vuln-found` | 8 | github.com/gin-gonic/gin (8) |
| `apt-package-unavailable` | 7 | github.com/BurntSushi/ripgrep (7) |
| `forgejo-actions-job-failed` | 7 | github.com/grafana/loki (6), github.com/moby/moby (1) |
| `gotestsum-run-summary` | 7 | github.com/moby/moby (4), github.com/microsoft/TypeScript (2), github.com/grafana/loki (1) |
| `npm-network-error` | 7 | github.com/evanw/esbuild (7) |
| `pacman-retrieve-failed` | 7 | github.com/curl/curl (5), github.com/google/benchmark (2) |
| `powershell-error-record` | 7 | github.com/containers/podman (3), github.com/luarocks/luarocks (2), github.com/evanw/esbuild (1), github.com/nlohmann/json (1) |
| `praktika-job-fail` | 7 | github.com/ClickHouse/ClickHouse (7) |
| `praktika-run-failed` | 7 | github.com/ClickHouse/ClickHouse (7) |
| `commit-lint-violation` | 6 | github.com/JetBrains/Exposed (6) |
| `exunit-failed-summary` | 6 | github.com/elixir-lang/elixir (4), github.com/phoenixframework/phoenix (2) |
| `fastlane-itms-probe-failed` | 6 | github.com/fastlane/fastlane (6) |
| `mypy-type-error` | 6 | github.com/pandas-dev/pandas (3), github.com/python-poetry/poetry (2), github.com/pallets/flask (1) |
| `npm-config-error` | 6 | github.com/tailwindlabs/tailwindcss (6) |
| `nvim-test-failure-list-entry` | 6 | github.com/neovim/neovim (6) |
| `phpstan-error-table` | 6 | github.com/composer/composer (6) |
| `pnpm-error-tree` | 6 | github.com/vercel/next.js (6) |
| `pytest-conftest-import-error` | 6 | github.com/pallets/flask (6) |
| `swift-tools-version-mismatch` | 6 | github.com/swiftlang/swift-format (4), github.com/swiftlang/swift-syntax (2) |
| `wait-on-check-conclusion-not-allowed` | 6 | github.com/flutter/packages (6) |
| `zig-compile-error` | 6 | github.com/zigtools/zls (6) |
| `busted-htest-error-entry` | 5 | github.com/luarocks/luarocks (5) |
| `busted-htest-failed-test-entry` | 5 | github.com/luarocks/luarocks (5) |
| `busted-htest-failure-banner` | 5 | github.com/luarocks/luarocks (5) |
| `cargo-build-script-failed` | 5 | github.com/niri-wm/niri (3), github.com/dtolnay/cxx (1), github.com/uutils/coreutils (1) |
| `copilot-cli-error` | 5 | github.com/dotnet/aspnetcore (3), github.com/dotnet/runtime (2) |
| `curl-cli-error` | 5 | github.com/qdrant/qdrant (2), github.com/dtolnay/cxx (1), github.com/erlang/otp (1), github.com/honojs/hono (1) |
| `github-actions-checkout-ref-mismatch` | 5 | github.com/catchorg/Catch2 (5) |
| `nix-eval-error-tree` | 5 | github.com/nix-community/home-manager (3), github.com/cachix/devenv (1), github.com/jgm/pandoc (1) |
| `npm-run-all-failed-tasks` | 5 | github.com/microsoft/TypeScript (5) |
| `copilot-harness-attempt-failed` | 4 | github.com/dotnet/runtime (4) |
| `fastlane-exit-status` | 4 | github.com/fastlane/fastlane (4) |
| `fastlane-finished-with-errors` | 4 | github.com/fastlane/fastlane (4) |
| `gh-cli-error` | 4 | github.com/pnpm/pnpm (3), github.com/ClickHouse/ClickHouse (1) |
| `git-push-auth-failed` | 4 | github.com/opencv/opencv (4) |
| `maven-wrapper-main-missing` | 4 | github.com/google/guava (4) |
| `minitest-run-summary` | 4 | github.com/puma/puma (4) |
| `msbuild-build-failed` | 4 | github.com/AvaloniaUI/Avalonia (4) |
| `mypy-found-errors` | 4 | github.com/pandas-dev/pandas (2), github.com/pallets/flask (1), github.com/python-poetry/poetry (1) |
| `nixfmt-fail-on-change` | 4 | github.com/nix-community/home-manager (4) |
| `prettier-check-drift` | 4 | github.com/sveltejs/svelte (3), github.com/eslint/eslint (1) |
| `pyright-type-error` | 4 | github.com/pandas-dev/pandas (4) |
| `rubocop-self-lint-failed` | 4 | github.com/rubocop/rubocop (4) |
| `semgrep-scan-start-failed` | 4 | github.com/semgrep/semgrep (4) |
| `treefmt-fail-on-change` | 4 | github.com/nix-community/home-manager (4) |
| `zig-build-summary-failed` | 4 | github.com/zigtools/zls (3), github.com/neovim/neovim (1) |
| `bitcoin-lint-check-failure` | 3 | github.com/bitcoin/bitcoin (3) |
| `black-would-reformat` | 3 | github.com/pydantic/pydantic (2), github.com/scikit-learn/scikit-learn (1) |
| `cabal-changelog-validation-failed` | 3 | github.com/haskell/cabal (3) |
| `cargo-nextest-run-failed` | 3 | github.com/uutils/coreutils (3) |
| `changesets-exited-error` | 3 | github.com/stylelint/stylelint (3) |
| `check-spelling-unrecognized-words` | 3 | github.com/jekyll/jekyll (3) |
| `ctest-tests-failed-list` | 3 | github.com/bitcoin/bitcoin (1), github.com/fmtlib/fmt (1), github.com/libuv/libuv (1) |
| `gh-api-integration-error` | 3 | github.com/anomalyco/opencode (1), github.com/cli/cli (1), github.com/koalaman/shellcheck (1) |
| `git-push-rejected` | 3 | github.com/nix-community/home-manager (2), github.com/pandas-dev/pandas (1) |
| `node-command-failed-exit` | 3 | github.com/swiftlang/swift-syntax (3) |
| `phpunit-failures-banner` | 3 | github.com/laravel/framework (3) |
| `semgrep-invalid-api-key` | 3 | github.com/semgrep/semgrep (3) |
| `swift-fatal-error` | 3 | github.com/vapor/vapor (2), github.com/Alamofire/Alamofire (1) |
| `swift-testing-runner-crash` | 3 | github.com/vapor/vapor (3) |
| `zig-build-command-failed` | 3 | github.com/zigtools/zls (2), github.com/neovim/neovim (1) |
| `chocolatey-install-failed` | 2 | github.com/nlohmann/json (2) |
| `cocoon-wait-for-tests-failed` | 2 | github.com/flutter/flutter (2) |
| `eslint-stylish-offense` | 2 | github.com/DavidAnson/markdownlint (2) |
| `eslint-stylish-summary` | 2 | github.com/DavidAnson/markdownlint (1), github.com/sveltejs/svelte (1) |
| `go-toolchain-mismatch` | 2 | github.com/caddyserver/caddy (2) |
| `mage-drift-gate-echo` | 2 | github.com/aquasecurity/trivy (2) |
| `phpstan-found-errors` | 2 | github.com/composer/composer (2) |
| `plenary-tests-failed` | 2 | github.com/nvim-telescope/telescope.nvim (2) |
| `podman-image-copy-failed` | 2 | github.com/rails/rails (2) |
| `rustc-doc-failed` | 2 | github.com/astral-sh/ruff (1), github.com/serde-rs/serde (1) |
| `semgrep-findings` | 2 | github.com/nlohmann/json (1), github.com/withastro/astro (1) |
| `swift-docc-compile-failed` | 2 | github.com/swiftlang/swift-syntax (2) |
| `swift-testing-test-failed` | 2 | github.com/vapor/vapor (2) |
| `verify-pr-title-invalid` | 2 | github.com/denoland/deno (2) |
| `wait-on-check-never-run` | 2 | github.com/flutter/packages (2) |
| `webpack-hook-error` | 2 | github.com/DavidAnson/markdownlint (2) |
| `winget-releaser-token-invalid` | 2 | github.com/dandavison/delta (2) |
| `cabal-build-failed` | 1 | github.com/koalaman/shellcheck (1) |
| `codecov-upload-failed` | 1 | github.com/rollup/rollup (1) |
| `commit-lint-msg-overlong-line` | 1 | github.com/jgm/pandoc (1) |
| `credo-strict-suggestions` | 1 | github.com/rrrene/credo (1) |
| `ctest-test-failed` | 1 | github.com/libuv/libuv (1) |
| `erlang-signal-stack-failed` | 1 | github.com/phoenixframework/phoenix (1) |
| `esbuild-js-api-tests-failed` | 1 | github.com/evanw/esbuild (1) |
| `git-am-apply-failed` | 1 | github.com/pandas-dev/pandas (1) |
| `git-http-access-denied` | 1 | github.com/microsoft/playwright (1) |
| `github-actions-raw-error-command` | 1 | github.com/nvim-telescope/telescope.nvim (1) |
| `lintcommit-invalid-message` | 1 | github.com/neovim/neovim (1) |
| `mix-error` | 1 | github.com/rrrene/credo (1) |
| `nix-activation-conflict` | 1 | github.com/LnL7/nix-darwin (1) |
| `npm-missing-script` | 1 | github.com/DavidAnson/markdownlint (1) |
| `nvim-test-run-fail` | 1 | github.com/neovim/neovim (1) |
| `oxlint-found-errors` | 1 | github.com/honojs/hono (1) |
| `pyright-error-summary` | 1 | github.com/pandas-dev/pandas (1) |
| `python-logging-critical-message` | 1 | github.com/phpstan/phpstan (1) |
| `rsync-error` | 1 | github.com/spring-projects/spring-framework (1) |
| `ruby-name-error` | 1 | github.com/rails/rails (1) |
| `rust-io-no-such-file` | 1 | github.com/mvdan/sh (1) |
| `xctest-assert-failed` | 1 | github.com/vapor/vapor (1) |
| `xctest-test-case-failed` | 1 | github.com/vapor/vapor (1) |
| `api-extractor-semantic-error` | 0 |  |
| `bun-error-json` | 0 |  |
| `cargo-version-conflict` | 0 |  |
| `checkstyle-error` | 0 |  |
| `clang-format-lint-diff` | 0 |  |
| `cloudflare-api-error` | 0 |  |
| `codeowners-validator-checks-failed` | 0 |  |
| `curl-runtests-testfail` | 0 |  |
| `docker-registry-pull-failed` | 0 |  |
| `docusaurus-bundle-error` | 0 |  |
| `emmylua-diagnostic` | 0 |  |
| `esbuild-build-failed` | 0 |  |
| `escript-exception` | 0 |  |
| `eslint-offense-line` | 0 |  |
| `forgejo-actions-poll-noise` | 0 |  |
| `forgejo-actions-runner-version-info` | 0 |  |
| `gitleaks-leaks-found` | 0 |  |
| `go-mod-tidy-diff` | 0 |  |
| `golangci-lint-config-invalid` | 0 |  |
| `gotestfmt-test-fail` | 0 |  |
| `homebrew-portable-ruby-failed` | 0 |  |
| `just-recipe-fail` | 0 |  |
| `mocha-test-fail` | 0 |  |
| `mordant-findings-over-baseline` | 0 |  |
| `nim-segv` | 0 |  |
| `nix-buildenv-collision` | 0 |  |
| `nix-download-failed` | 0 |  |
| `nix-eval-missing-store-path` | 0 |  |
| `nix-experimental-feature-disabled` | 0 |  |
| `nix-fetch-input-noise` | 0 |  |
| `nix-flake-attr-missing` | 0 |  |
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
| `npm-audit-unresolved` | 0 |  |
| `nvim-test-assertion-detail` | 0 |  |
| `opencv-dnn-test-error` | 0 |  |
| `phpunit-php-version-mismatch` | 0 |  |
| `pip-install-error` | 0 |  |
| `playwright-no-report-files` | 0 |  |
| `proselint-finding` | 0 |  |
| `pyanalyze-error-findings` | 0 |  |
| `qunit-headless-chrome-failed` | 0 |  |
| `redis-server-bugreport` | 0 |  |
| `redis-test-exception` | 0 |  |
| `scorecard-action-error` | 0 |  |
| `signtool-error` | 0 |  |
| `size-limit-exceeded` | 0 |  |
| `systemd-ci-unit-fail` | 0 |  |
| `trivy-misconf-failures` | 0 |  |
| `trufflehog-secret-found` | 0 |  |
| `trufflehog-unverified-secret` | 0 |  |
| `uv-require-hashes-unpinned` | 0 |  |
| `vite-plus-runtime-download-failed` | 0 |  |
| `warp-out-of-credits` | 0 |  |

零命中规则 (63 条, dead_rules 候选 — 语料未覆盖的工具或正则失效):
- `api-extractor-semantic-error`
- `bun-error-json`
- `cargo-version-conflict`
- `checkstyle-error`
- `clang-format-lint-diff`
- `cloudflare-api-error`
- `codeowners-validator-checks-failed`
- `curl-runtests-testfail`
- `docker-registry-pull-failed`
- `docusaurus-bundle-error`
- `emmylua-diagnostic`
- `esbuild-build-failed`
- `escript-exception`
- `eslint-offense-line`
- `forgejo-actions-poll-noise`
- `forgejo-actions-runner-version-info`
- `gitleaks-leaks-found`
- `go-mod-tidy-diff`
- `golangci-lint-config-invalid`
- `gotestfmt-test-fail`
- `homebrew-portable-ruby-failed`
- `just-recipe-fail`
- `mocha-test-fail`
- `mordant-findings-over-baseline`
- `nim-segv`
- `nix-buildenv-collision`
- `nix-download-failed`
- `nix-eval-missing-store-path`
- `nix-experimental-feature-disabled`
- `nix-fetch-input-noise`
- `nix-flake-attr-missing`
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
- `npm-audit-unresolved`
- `nvim-test-assertion-detail`
- `opencv-dnn-test-error`
- `phpunit-php-version-mismatch`
- `pip-install-error`
- `playwright-no-report-files`
- `proselint-finding`
- `pyanalyze-error-findings`
- `qunit-headless-chrome-failed`
- `redis-server-bugreport`
- `redis-test-exception`
- `scorecard-action-error`
- `signtool-error`
- `size-limit-exceeded`
- `systemd-ci-unit-fail`
- `trivy-misconf-failures`
- `trufflehog-secret-found`
- `trufflehog-unverified-secret`
- `uv-require-hashes-unpinned`
- `vite-plus-runtime-download-failed`
- `warp-out-of-credits`

总命中口径 = signal fragment ∪ noise 剔除区块, 全样本域 (liveness)。
</details>
