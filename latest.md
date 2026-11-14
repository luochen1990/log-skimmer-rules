# log-skimmer 回测报告 (每周自动刷新)

- 时点: 2026-11-14 · verdict: **pass** · 引擎 `0efc7e7` · 规则 `d66cfe6` · 语料 `239552b`
- 运行记录: https://github.com/luochen1990/log-skimmer-rules/actions/runs/43635052354 · 消费方: README 徽章 — 本文件即其数据源, 勿手工编辑
- 规则 bundle: rules-bundle.json (348 规则) — userscript 消费源 (README §5)

## 判定: ✅ PASS

- 对比模式: dual-run compare

语料集漂移 (非违例, 人工核对):
- github.com/ClickHouse/ClickHouse: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/apache/kafka: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/detekt/detekt: only 1 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/grpc/grpc-go: only 1 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/libuv/libuv: only 1 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/microsoft/TypeScript: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/openssl/openssl: only 2 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/oven-sh/bun: only 1 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/phpstan/phpstan: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/pnpm/pnpm: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/uutils/coreutils: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent
- github.com/yarnpkg/berry: only 0 shared sample(s) (< 3) — corpus rotation; needs manual review if persistent

## gated 组 (断言面)

| 样本 | FN | FP率 | FP行 | 零块 | 边界违例 | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1342 | 0 | 0.04% | 260 | 0 | 0 | 98.96% | 99.22% |

## exempt 组 (报告面, 不进断言 — 豁免余量 = 逐仓适配进度)

豁免样本 250 对 / 豁免仓 24 个 (sidecar gate_exempt: true)。

| 样本 | FN(镜像) | FP率(镜像) | 零块(镜像) | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- |
| 250 | 2 | 0.01% | 0 | 99.23% | 99.39% |

## 规则健康档案

- 诊断覆盖率: 983/1145 = 85.85% (含 ≥1 非 restating/trivial 失败块的失败族样本 — FN 保证有块, 覆盖保证块由内容决定)
- 分级: trivial (原 restating) 1 (结论复述安全网) / diagnostic 177 (内容决定, 计覆盖) / boundary 4 (断裂带, 人工审)
- 完整健康表 (PPV/Wilson/lift/spec/intent 核对): [reports 分支 rules-health.md](https://github.com/luochen1990/log-skimmer-rules/blob/reports/rules-health.md)

<details>
<summary>逐仓分解 (150 仓) — 样本/豁免/FN/FP/零块/压缩率</summary>

| repo | 样本 | 豁免 | FN | FP率 | 零块 | 边界 | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `github.com/Alamofire/Alamofire` | 11 | 0 | 0 | 0% | 0 | 0 | 99.32% | 99.79% |
| `github.com/AvaloniaUI/Avalonia` | 11 | 0 | 0 | 0% | 0 | 0 | 99.69% | 99.69% |
| `github.com/BurntSushi/ripgrep` | 11 | 0 | 0 | 0% | 0 | 0 | 98.92% | 91.13% |
| `github.com/ClickHouse/ClickHouse` | 11 | 0 | 0 | 0% | 0 | 0 | 99.72% | 99.86% |
| `github.com/DavidAnson/markdownlint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.3% | 99.66% |
| `github.com/DeterminateSystems/magic-nix-cache` | 8 | 8 | 0 | 0% | 0 | 0 | 99.68% | 99.68% |
| `github.com/DeterminateSystems/nix-installer` | 5 | 5 | 0 | 0% | 0 | 0 | 99.77% | 99.77% |
| `github.com/Homebrew/brew` | 11 | 0 | 0 | 0% | 0 | 0 | 99.39% | 99.46% |
| `github.com/JamesNK/Newtonsoft.Json` | 3 | 0 | 0 | 0% | 0 | 0 | 99.9% | 99.9% |
| `github.com/JetBrains/Exposed` | 11 | 0 | 0 | 0% | 0 | 0 | 98.8% | 99.69% |
| `github.com/LnL7/nix-darwin` | 11 | 0 | 0 | 0% | 0 | 0 | 98.55% | 99.52% |
| `github.com/alacritty/alacritty` | 11 | 0 | 0 | 0% | 0 | 0 | 99.35% | 99.6% |
| `github.com/anomalyco/opencode` | 16 | 0 | 0 | 0.09% | 0 | 0 | 99.19% | 99.81% |
| `github.com/ant-design/ant-design` | 11 | 0 | 0 | 0% | 0 | 0 | 95.73% | 98.69% |
| `github.com/apache/kafka` | 11 | 0 | 0 | 0% | 0 | 0 | 99.77% | 99.77% |
| `github.com/aquasecurity/trivy` | 11 | 0 | 0 | 0% | 0 | 0 | 98.97% | 99.38% |
| `github.com/astral-sh/ruff` | 11 | 0 | 0 | 0% | 0 | 0 | 99.69% | 99.81% |
| `github.com/bbernhard/signal-cli-rest-api` | 11 | 11 | 0 | 0% | 0 | 0 | 99.52% | 99.52% |
| `github.com/bitcoin/bitcoin` | 11 | 0 | 0 | 0.02% | 0 | 0 | 99.88% | 99.94% |
| `github.com/bitnami/charts` | 11 | 11 | 0 | 0% | 0 | 0 | 98.9% | 98.9% |
| `github.com/cachix/devenv` | 11 | 11 | 0 | 0% | 0 | 0 | 99.77% | 99.93% |
| `github.com/caddyserver/caddy` | 10 | 0 | 0 | 0% | 0 | 0 | 99.96% | 99.96% |
| `github.com/catchorg/Catch2` | 3 | 0 | 0 | 0% | 0 | 0 | 99.89% | 99.89% |
| `github.com/chipsalliance/verible` | 11 | 11 | 0 | 0% | 0 | 0 | 99.88% | 99.92% |
| `github.com/cli/cli` | 10 | 0 | 0 | 0% | 0 | 0 | 98.01% | 99.36% |
| `github.com/commercialhaskell/stack` | 11 | 0 | 0 | 0% | 0 | 0 | 99.77% | 99.83% |
| `github.com/composer/composer` | 11 | 0 | 0 | 0% | 0 | 0 | 98.71% | 98.66% |
| `github.com/containers/podman` | 11 | 11 | 0 | 0% | 0 | 0 | 99.81% | 99.83% |
| `github.com/coreos/rpm-ostree` | 11 | 11 | 0 | 0% | 0 | 0 | 99.97% | 99.97% |
| `github.com/curl/curl` | 11 | 0 | 0 | 0% | 0 | 0 | 98.16% | 99.38% |
| `github.com/dandavison/delta` | 11 | 0 | 0 | 0% | 0 | 0 | 99.39% | 99.36% |
| `github.com/denoland/deno` | 11 | 0 | 0 | 0.37% | 0 | 0 | 99.6% | 99.7% |
| `github.com/detekt/detekt` | 11 | 0 | 0 | 0% | 0 | 0 | 99.08% | 99.2% |
| `github.com/diffplug/spotless` | 11 | 0 | 0 | 0% | 0 | 0 | 99.43% | 99.73% |
| `github.com/django/django` | 11 | 0 | 0 | 0% | 0 | 0 | 99.79% | 99.9% |
| `github.com/doccano/doccano` | 11 | 11 | 0 | 0.29% | 0 | 0 | 99.53% | 99.71% |
| `github.com/dotnet/aspnetcore` | 11 | 0 | 0 | 0% | 0 | 0 | 99.85% | 99.85% |
| `github.com/dotnet/roslyn` | 11 | 0 | 0 | 0% | 0 | 0 | 99.23% | 99.36% |
| `github.com/dotnet/runtime` | 11 | 0 | 0 | 0% | 0 | 0 | 99.86% | 99.86% |
| `github.com/dtolnay/cxx` | 11 | 11 | 0 | 0% | 0 | 0 | 99.53% | 99.57% |
| `github.com/duckdb/duckdb` | 11 | 0 | 0 | 0% | 0 | 0 | 99.66% | 99.66% |
| `github.com/elixir-lang/elixir` | 10 | 0 | 0 | 0% | 0 | 0 | 99.37% | 99.57% |
| `github.com/erlang/otp` | 11 | 0 | 0 | 0% | 0 | 0 | 99.97% | 99.97% |
| `github.com/eslint/eslint` | 11 | 0 | 0 | 0% | 0 | 0 | 98.23% | 99.37% |
| `github.com/etcd-io/etcd` | 11 | 0 | 0 | 0.02% | 0 | 0 | 99.84% | 99.84% |
| `github.com/evanw/esbuild` | 6 | 0 | 0 | 0% | 0 | 0 | 99.44% | 99.67% |
| `github.com/facebook/react` | 11 | 11 | 0 | 0% | 0 | 0 | 99.35% | 99.47% |
| `github.com/fastapi/fastapi` | 11 | 0 | 0 | 0% | 0 | 0 | 99.81% | 99.91% |
| `github.com/fastlane/fastlane` | 11 | 0 | 0 | 0% | 0 | 0 | 99.48% | 99.54% |
| `github.com/flutter/flutter` | 11 | 0 | 0 | 0% | 0 | 0 | 99.67% | 99.87% |
| `github.com/flutter/packages` | 11 | 0 | 0 | 0% | 0 | 0 | 99.78% | 99.89% |
| `github.com/fmtlib/fmt` | 11 | 0 | 0 | 0% | 0 | 0 | 99.23% | 99.46% |
| `github.com/gin-gonic/gin` | 11 | 0 | 0 | 0% | 0 | 0 | 99.65% | 99.78% |
| `github.com/gohugoio/hugo` | 11 | 0 | 0 | 0% | 0 | 0 | 99.89% | 99.86% |
| `github.com/golangci/golangci-lint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.72% | 99.74% |
| `github.com/google/auto` | 11 | 11 | 0 | 0% | 0 | 0 | 88.82% | 89.5% |
| `github.com/google/benchmark` | 9 | 0 | 0 | 0% | 0 | 0 | 97.21% | 99.03% |
| `github.com/google/error-prone` | 11 | 11 | 0 | 0% | 0 | 0 | 99.5% | 99.83% |
| `github.com/google/googletest` | 11 | 0 | 0 | 0% | 0 | 0 | 98.1% | 99.48% |
| `github.com/google/guava` | 11 | 0 | 0 | 0% | 0 | 0 | 99.36% | 99.7% |
| `github.com/google/re2` | 6 | 6 | 0 | 0% | 0 | 0 | 97.22% | 97.22% |
| `github.com/google/xls` | 11 | 11 | 0 | 0% | 0 | 0 | 99.92% | 99.93% |
| `github.com/gradle/gradle` | 11 | 0 | 0 | 0% | 0 | 0 | 99.1% | 99.76% |
| `github.com/grafana/helm-charts` | 11 | 11 | 0 | 0% | 0 | 0 | 99.94% | 99.94% |
| `github.com/grafana/loki` | 11 | 0 | 0 | 0% | 0 | 0 | 99.63% | 99.68% |
| `github.com/grpc/grpc-go` | 11 | 0 | 0 | 0% | 0 | 0 | 99.24% | 99.24% |
| `github.com/hadolint/hadolint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.62% | 99.73% |
| `github.com/hashicorp/terraform` | 11 | 11 | 0 | 0.42% | 0 | 0 | 99.41% | 99.45% |
| `github.com/haskell/cabal` | 11 | 0 | 0 | 0% | 0 | 0 | 99.24% | 99.47% |
| `github.com/haskell/haskell-language-server` | 11 | 0 | 0 | 0% | 0 | 0 | 99.81% | 99.83% |
| `github.com/helm/helm` | 11 | 0 | 0 | 0% | 0 | 0 | 99.79% | 99.91% |
| `github.com/honojs/hono` | 11 | 0 | 0 | 0% | 0 | 0 | 99.35% | 99.53% |
| `github.com/hyperium/hyper` | 11 | 0 | 0 | 0% | 0 | 0 | 99% | 99% |
| `github.com/jekyll/jekyll` | 11 | 0 | 0 | 0% | 0 | 0 | 97.23% | 98.01% |
| `github.com/jgm/pandoc` | 11 | 0 | 0 | 0% | 0 | 0 | 97.48% | 99.93% |
| `github.com/koalaman/shellcheck` | 6 | 0 | 0 | 0% | 0 | 0 | 99.49% | 99.56% |
| `github.com/kubernetes/kubernetes` | 3 | 0 | 0 | 0% | 0 | 0 | 99.92% | 99.92% |
| `github.com/laravel/framework` | 11 | 0 | 0 | 0% | 0 | 0 | 99.54% | 99.68% |
| `github.com/libuv/libuv` | 11 | 0 | 0 | 0% | 0 | 0 | 99.64% | 99.72% |
| `github.com/luarocks/luarocks` | 11 | 0 | 0 | 0% | 0 | 0 | 99.82% | 99.83% |
| `github.com/meta/buck2` | 11 | 11 | 0 | 0% | 0 | 0 | 99.98% | 99.98% |
| `github.com/microsoft/TypeScript` | 11 | 0 | 0 | 0.02% | 0 | 0 | 99.38% | 99.29% |
| `github.com/microsoft/playwright` | 11 | 0 | 0 | 0% | 0 | 0 | 97.66% | 99.46% |
| `github.com/mitmproxy/mitmproxy` | 11 | 0 | 0 | 0% | 0 | 0 | 99.08% | 99.28% |
| `github.com/moby/moby` | 11 | 0 | 0 | 0% | 0 | 0 | 97.89% | 97.89% |
| `github.com/mockito/mockito` | 11 | 0 | 0 | 0% | 0 | 0 | 98.61% | 99.62% |
| `github.com/mvdan/sh` | 11 | 0 | 0 | 0% | 0 | 0 | 99.35% | 99.35% |
| `github.com/neovim/neovim` | 11 | 0 | 0 | 0% | 0 | 0 | 99.78% | 99.93% |
| `github.com/niri-wm/niri` | 19 | 0 | 0 | 0% | 0 | 0 | 98.62% | 99.08% |
| `github.com/nix-community/home-manager` | 19 | 0 | 0 | 0% | 0 | 0 | 99.7% | 99.86% |
| `github.com/nix-community/nix-direnv` | 4 | 0 | 0 | 0.12% | 0 | 0 | 99.58% | 99.73% |
| `github.com/nlohmann/json` | 8 | 0 | 0 | 0% | 0 | 0 | 98.78% | 97.88% |
| `github.com/nvim-telescope/telescope.nvim` | 11 | 0 | 0 | 0% | 0 | 0 | 99.06% | 99.06% |
| `github.com/openai/openai-python` | 11 | 0 | 0 | 0% | 0 | 0 | 98.69% | 99.42% |
| `github.com/opencv/opencv` | 11 | 0 | 0 | 0.08% | 0 | 0 | 99.89% | 99.84% |
| `github.com/openssl/openssl` | 11 | 0 | 0 | 0% | 0 | 0 | 41.46% | 79.59% |
| `github.com/opentofu/opentofu` | 11 | 11 | 0 | 0% | 0 | 0 | 99.37% | 99.43% |
| `github.com/oven-sh/bun` | 11 | 0 | 0 | 0% | 0 | 0 | 99.66% | 99.71% |
| `github.com/pallets/flask` | 11 | 0 | 0 | 0% | 0 | 0 | 98.21% | 98.9% |
| `github.com/pandas-dev/pandas` | 11 | 0 | 0 | 0% | 0 | 0 | 99.93% | 99.94% |
| `github.com/phoenixframework/phoenix` | 11 | 0 | 0 | 0% | 0 | 0 | 95.16% | 99.58% |
| `github.com/phpstan/phpstan` | 11 | 0 | 0 | 0% | 0 | 0 | 98.64% | 99.16% |
| `github.com/pnpm/pnpm` | 11 | 0 | 0 | 0% | 0 | 0 | 99.59% | 99.84% |
| `github.com/prettier/prettier` | 11 | 0 | 0 | 0% | 0 | 0 | 97.67% | 99.51% |
| `github.com/prometheus-community/helm-charts` | 11 | 11 | 2 | 0% | 0 | 0 | 99.95% | 99.95% |
| `github.com/protocolbuffers/protobuf` | 11 | 0 | 0 | 0% | 0 | 0 | 99.05% | 99.38% |
| `github.com/psf/black` | 11 | 0 | 0 | 0% | 0 | 0 | 99.25% | 99.25% |
| `github.com/psf/requests` | 11 | 0 | 0 | 0% | 0 | 0 | 98.7% | 98.7% |
| `github.com/puma/puma` | 11 | 0 | 0 | 0% | 0 | 0 | 99.62% | 99.75% |
| `github.com/pydantic/pydantic` | 11 | 0 | 0 | 0% | 0 | 0 | 99.37% | 99.77% |
| `github.com/pytest-dev/pytest` | 11 | 0 | 0 | 0% | 0 | 0 | 99.71% | 99.82% |
| `github.com/python-poetry/poetry` | 11 | 11 | 0 | 0% | 0 | 0 | 98.79% | 99.55% |
| `github.com/qdrant/qdrant` | 11 | 0 | 0 | 0% | 0 | 0 | 99.73% | 99.89% |
| `github.com/rails/rails` | 11 | 0 | 0 | 0% | 0 | 0 | 99.86% | 99.91% |
| `github.com/redis/redis` | 11 | 0 | 0 | 0% | 0 | 0 | 99.97% | 99.97% |
| `github.com/redisson/redisson` | 11 | 11 | 0 | 0% | 0 | 0 | 99.48% | 99.77% |
| `github.com/rhysd/actionlint` | 11 | 0 | 0 | 0% | 0 | 0 | 98.15% | 99.69% |
| `github.com/rollup/rollup` | 11 | 0 | 0 | 0% | 0 | 0 | 99.46% | 99.7% |
| `github.com/rrrene/credo` | 11 | 0 | 0 | 0% | 0 | 0 | 99.93% | 93.53% |
| `github.com/rubocop/rubocop` | 11 | 0 | 0 | 0.14% | 0 | 0 | 99.34% | 99.34% |
| `github.com/rust-analyzer/rust-analyzer` | 11 | 0 | 0 | 0% | 0 | 0 | 99.8% | 99.85% |
| `github.com/scikit-learn/scikit-learn` | 11 | 0 | 0 | 0% | 0 | 0 | 99.83% | 99.85% |
| `github.com/sebastianbergmann/phpunit` | 11 | 0 | 0 | 0% | 0 | 0 | 98.76% | 99.44% |
| `github.com/semgrep/semgrep` | 11 | 0 | 0 | 0% | 0 | 0 | 99.5% | 99.5% |
| `github.com/serde-rs/serde` | 11 | 0 | 0 | 0% | 0 | 0 | 98.24% | 98.88% |
| `github.com/sharkdp/bat` | 11 | 0 | 0 | 0% | 0 | 0 | 99.8% | 99.8% |
| `github.com/sharkdp/fd` | 11 | 0 | 0 | 0% | 0 | 0 | 99.15% | 99.46% |
| `github.com/spf13/cobra` | 3 | 0 | 0 | 0% | 0 | 0 | 97.67% | 97.67% |
| `github.com/spf13/viper` | 6 | 0 | 0 | 0% | 0 | 0 | 99.1% | 99.1% |
| `github.com/spring-projects/spring-boot` | 11 | 0 | 0 | 0.03% | 0 | 0 | 99.39% | 99.9% |
| `github.com/spring-projects/spring-framework` | 11 | 0 | 0 | 0% | 0 | 0 | 99.54% | 99.8% |
| `github.com/square/okhttp` | 10 | 0 | 0 | 0% | 0 | 0 | 98.96% | 99.66% |
| `github.com/starship/starship` | 11 | 0 | 0 | 0% | 0 | 0 | 99.55% | 99.64% |
| `github.com/stylelint/stylelint` | 11 | 0 | 0 | 0% | 0 | 0 | 94.2% | 99.53% |
| `github.com/sveltejs/svelte` | 11 | 0 | 0 | 0% | 0 | 0 | 98.17% | 98.86% |
| `github.com/swiftlang/swift-format` | 10 | 0 | 0 | 0% | 0 | 0 | 99.28% | 99.56% |
| `github.com/swiftlang/swift-syntax` | 11 | 0 | 0 | 0% | 0 | 0 | 99.91% | 99.9% |
| `github.com/symfony/symfony` | 11 | 0 | 0 | 0% | 0 | 0 | 99.59% | 99.82% |
| `github.com/tailwindlabs/tailwindcss` | 10 | 0 | 0 | 0% | 0 | 0 | 99.32% | 99.6% |
| `github.com/terraform-aws-modules/terraform-aws-vpc` | 11 | 11 | 0 | 0% | 0 | 0 | 99.08% | 99.08% |
| `github.com/tokio-rs/tokio` | 11 | 0 | 0 | 0% | 0 | 0 | 87.96% | 98.88% |
| `github.com/trufflesecurity/trufflehog` | 11 | 0 | 0 | 0.05% | 0 | 0 | 99.71% | 99.71% |
| `github.com/uutils/coreutils` | 11 | 0 | 0 | 0% | 0 | 0 | 99.89% | 99.92% |
| `github.com/vapor/vapor` | 11 | 0 | 0 | 0% | 0 | 0 | 99.96% | 98.98% |
| `github.com/vercel/next.js` | 11 | 0 | 0 | 0% | 0 | 0 | 99.61% | 99.8% |
| `github.com/vitejs/vite` | 11 | 0 | 0 | 0% | 0 | 0 | 98.43% | 98.86% |
| `github.com/vuejs/core` | 11 | 0 | 0 | 0% | 0 | 0 | 97.7% | 98.63% |
| `github.com/withastro/astro` | 11 | 0 | 0 | 0% | 0 | 0 | 99.52% | 99.72% |
| `github.com/yarnpkg/berry` | 11 | 11 | 0 | 0% | 0 | 0 | 99.54% | 99.54% |
| `github.com/zigtools/zls` | 11 | 0 | 0 | 0% | 0 | 0 | 98.43% | 99.26% |

注: FN/FP 为诊断视图 (不分 gated/exempt, 看未适配仓离达标多远); 零块/边界为全域口径。
</details>

<details>
<summary>规则 × 仓 命中矩阵 (348 规则) — 命中分布与零命中 (死规则候选)</summary>

| 规则 | 总命中 | 命中仓分布 (top 8) |
| --- | --- | --- |
| `python-unittest-progress-noise` | 86205 | github.com/meta/buck2 (26764), github.com/django/django (18545), github.com/uutils/coreutils (17280), github.com/rust-analyzer/rust-analyzer (11264), github.com/alacritty/alacritty (3600), github.com/dandavison/delta (2486), github.com/sharkdp/fd (1081), github.com/BurntSushi/ripgrep (895) … +11 仓 |
| `cargo-progress-noise` | 61367 | github.com/meta/buck2 (11902), github.com/qdrant/qdrant (9767), github.com/coreos/rpm-ostree (6474), github.com/uutils/coreutils (6396), github.com/rust-analyzer/rust-analyzer (3793), github.com/alacritty/alacritty (3106), github.com/vercel/next.js (2991), github.com/starship/starship (2795) … +18 仓 |
| `gradle-task-progress-noise` | 40182 | github.com/spring-projects/spring-boot (18518), github.com/detekt/detekt (5990), github.com/gradle/gradle (4375), github.com/square/okhttp (4032), github.com/spring-projects/spring-framework (3506), github.com/mockito/mockito (2382), github.com/diffplug/spotless (1342), github.com/google/guava (26) … +1 仓 |
| `ninja-progress-noise` | 19684 | github.com/opencv/opencv (6831), github.com/neovim/neovim (4737), github.com/libuv/libuv (1974), github.com/bitcoin/bitcoin (1134), github.com/catchorg/Catch2 (1085), github.com/coreos/rpm-ostree (956), github.com/curl/curl (827), github.com/swiftlang/swift-format (607) … +11 仓 |
| `ghc-module-progress-noise` | 13442 | github.com/haskell/haskell-language-server (4295), github.com/commercialhaskell/stack (4076), github.com/jgm/pandoc (2562), github.com/haskell/cabal (1833), github.com/hadolint/hadolint (676) |
| `go-test-progress-noise` | 12524 | github.com/golangci/golangci-lint (8670), github.com/gohugoio/hugo (1910), github.com/opentofu/opentofu (754), github.com/grpc/grpc-go (354), github.com/caddyserver/caddy (280), github.com/spf13/viper (245), github.com/mvdan/sh (165), github.com/hashicorp/terraform (130) … +2 仓 |
| `node-test-pass-noise` | 11196 | github.com/withastro/astro (6950), github.com/commercialhaskell/stack (1770), github.com/Alamofire/Alamofire (1687), github.com/stylelint/stylelint (730), github.com/rollup/rollup (54), github.com/openai/openai-python (2), github.com/pandas-dev/pandas (2), github.com/fastlane/fastlane (1) |
| `go-download-noise` | 9286 | github.com/aquasecurity/trivy (2162), github.com/golangci/golangci-lint (1162), github.com/hashicorp/terraform (1078), github.com/opentofu/opentofu (952), github.com/etcd-io/etcd (768), github.com/gohugoio/hugo (701), github.com/caddyserver/caddy (600), github.com/grafana/loki (533) … +11 仓 |
| `credo-result-diff-issue` | 8063 | github.com/rrrene/credo (8063) |
| `maven-test-progress-noise` | 6478 | github.com/google/error-prone (5961), github.com/google/guava (517) |
| `cmake-build-progress-noise` | 6069 | github.com/bitcoin/bitcoin (3888), github.com/libuv/libuv (1483), github.com/fmtlib/fmt (462), github.com/luarocks/luarocks (236) |
| `pip-install-progress-noise` | 5022 | github.com/tailwindlabs/tailwindcss (1369), github.com/psf/black (587), github.com/nlohmann/json (404), github.com/doccano/doccano (345), github.com/google/xls (265), github.com/square/okhttp (189), github.com/psf/requests (184), github.com/django/django (137) … +91 仓 |
| `github-actions-error-annotation` | 4156 | github.com/google/auto (2468), github.com/python-poetry/poetry (101), github.com/google/re2 (82), github.com/jekyll/jekyll (48), github.com/golangci/golangci-lint (44), github.com/trufflesecurity/trufflehog (37), github.com/composer/composer (35), github.com/AvaloniaUI/Avalonia (28) … +138 仓 |
| `make-directory-noise` | 4006 | github.com/erlang/otp (3318), github.com/redis/redis (344), github.com/curl/curl (216), github.com/coreos/rpm-ostree (56), github.com/luarocks/luarocks (18), github.com/libuv/libuv (14), github.com/elixir-lang/elixir (12), github.com/containers/podman (8) … +5 仓 |
| `github-actions-annotation-substantive` | 3180 | github.com/google/auto (2462), github.com/python-poetry/poetry (93), github.com/google/re2 (79), github.com/jekyll/jekyll (45), github.com/golangci/golangci-lint (40), github.com/trufflesecurity/trufflehog (32), github.com/composer/composer (27), github.com/AvaloniaUI/Avalonia (23) … +81 仓 |
| `make-target-error` | 2774 | github.com/openssl/openssl (2707), github.com/erlang/otp (12), github.com/duckdb/duckdb (8), github.com/nvim-telescope/telescope.nvim (6), github.com/containers/podman (5), github.com/luarocks/luarocks (5), github.com/elixir-lang/elixir (4), github.com/golangci/golangci-lint (4) … +9 仓 |
| `gcc-clang-diagnostic-error` | 2307 | github.com/openssl/openssl (2124), github.com/curl/curl (120), github.com/google/googletest (17), github.com/zigtools/zls (17), github.com/fmtlib/fmt (7), github.com/hadolint/hadolint (4), github.com/haskell/cabal (4), github.com/nlohmann/json (3) … +7 仓 |
| `vitest-pass-noise` | 2209 | github.com/vuejs/core (888), github.com/tailwindlabs/tailwindcss (702), github.com/honojs/hono (428), github.com/vitejs/vite (183), github.com/withastro/astro (8) |
| `maven-download-progress-noise` | 1695 | github.com/google/guava (1375), github.com/google/auto (320) |
| `github-actions-runner-version-info` | 1601 | github.com/niri-wm/niri (19), github.com/nix-community/home-manager (19), github.com/anomalyco/opencode (16), github.com/Alamofire/Alamofire (11), github.com/AvaloniaUI/Avalonia (11), github.com/BurntSushi/ripgrep (11), github.com/ClickHouse/ClickHouse (11), github.com/DavidAnson/markdownlint (11) … +142 仓 |
| `javac-compile-error` | 1595 | github.com/google/auto (1590), github.com/diffplug/spotless (3), github.com/google/error-prone (2) |
| `playwright-progress-noise` | 1567 | github.com/anomalyco/opencode (1565), github.com/microsoft/playwright (2) |
| `swift-benchmark-regression` | 1309 | github.com/vapor/vapor (1309) |
| `pytest-progress-noise` | 1017 | github.com/openai/openai-python (896), github.com/duckdb/duckdb (26), github.com/bitcoin/bitcoin (25), github.com/Homebrew/brew (24), github.com/catchorg/Catch2 (14), github.com/elixir-lang/elixir (14), github.com/phoenixframework/phoenix (8), github.com/symfony/symfony (3) … +6 仓 |
| `rust-test-panic` | 388 | github.com/BurntSushi/ripgrep (328), github.com/dandavison/delta (43), github.com/sharkdp/fd (5), github.com/serde-rs/serde (4), github.com/rust-analyzer/rust-analyzer (3), github.com/niri-wm/niri (2), github.com/uutils/coreutils (2), github.com/denoland/deno (1) |
| `rust-libtest-failed` | 362 | github.com/BurntSushi/ripgrep (328), github.com/astral-sh/ruff (8), github.com/rust-analyzer/rust-analyzer (6), github.com/sharkdp/fd (5), github.com/dandavison/delta (4), github.com/serde-rs/serde (4), github.com/qdrant/qdrant (3), github.com/pnpm/pnpm (2) … +1 仓 |
| `deno-test-failed` | 219 | github.com/denoland/deno (219) |
| `python-traceback-uncaught-exception` | 213 | github.com/python-poetry/poetry (82), github.com/anomalyco/opencode (36), github.com/mockito/mockito (31), github.com/square/okhttp (8), github.com/rails/rails (7), github.com/ant-design/ant-design (6), github.com/spring-projects/spring-boot (6), github.com/google/auto (5) … +13 仓 |
| `apt-fetch-failed` | 179 | github.com/niri-wm/niri (145), github.com/nvim-telescope/telescope.nvim (11), github.com/google/benchmark (8), github.com/laravel/framework (7), github.com/BurntSushi/ripgrep (6), github.com/koalaman/shellcheck (2) |
| `opencv-dnn-test-error` | 152 | github.com/opencv/opencv (152) |
| `ld-linker-error` | 129 | github.com/curl/curl (87), github.com/commercialhaskell/stack (31), github.com/haskell/cabal (6), github.com/bitcoin/bitcoin (2), github.com/chipsalliance/verible (2), github.com/libuv/libuv (1) |
| `ninja-failed` | 123 | github.com/curl/curl (106), github.com/google/googletest (5), github.com/libuv/libuv (4), github.com/neovim/neovim (4), github.com/nlohmann/json (3), github.com/duckdb/duckdb (1) |
| `ninja-build-stopped` | 113 | github.com/curl/curl (104), github.com/neovim/neovim (4), github.com/libuv/libuv (2), github.com/nlohmann/json (2), github.com/google/googletest (1) |
| `playwright-assert-failed` | 107 | github.com/microsoft/playwright (51), github.com/anomalyco/opencode (28), github.com/phpstan/phpstan (12), github.com/prettier/prettier (8), github.com/tokio-rs/tokio (3), github.com/vercel/next.js (3), github.com/pnpm/pnpm (2) |
| `pytest-test-failed` | 98 | github.com/python-poetry/poetry (93), github.com/openai/openai-python (4), github.com/qdrant/qdrant (1) |
| `vitest-test-fail` | 87 | github.com/vuejs/core (35), github.com/sveltejs/svelte (23), github.com/honojs/hono (13), github.com/tailwindlabs/tailwindcss (12), github.com/vitejs/vite (4) |
| `ctest-test-failed` | 86 | github.com/nlohmann/json (83), github.com/libuv/libuv (2), github.com/fmtlib/fmt (1) |
| `jest-test-fail` | 86 | github.com/vercel/next.js (42), github.com/facebook/react (24), github.com/phoenixframework/phoenix (14), github.com/prettier/prettier (6) |
| `rustfmt-diff-drift` | 85 | github.com/tokio-rs/tokio (78), github.com/niri-wm/niri (3), github.com/qdrant/qdrant (2), github.com/dandavison/delta (1), github.com/sharkdp/fd (1) |
| `gradle-task-failed` | 83 | github.com/detekt/detekt (48), github.com/square/okhttp (12), github.com/diffplug/spotless (7), github.com/mockito/mockito (6), github.com/gradle/gradle (4), github.com/spring-projects/spring-framework (4), github.com/spring-projects/spring-boot (2) |
| `gcc-clang-driver-error` | 76 | github.com/curl/curl (43), github.com/commercialhaskell/stack (6), github.com/libuv/libuv (6), github.com/luarocks/luarocks (6), github.com/google/googletest (5), github.com/bitcoin/bitcoin (4), github.com/fmtlib/fmt (4), github.com/haskell/haskell-language-server (2) |
| `go-test-pkg-fail` | 69 | github.com/microsoft/TypeScript (27), github.com/gohugoio/hugo (14), github.com/caddyserver/caddy (8), github.com/opentofu/opentofu (6), github.com/trufflesecurity/trufflehog (6), github.com/mvdan/sh (5), github.com/aquasecurity/trivy (1), github.com/golangci/golangci-lint (1) … +1 仓 |
| `rustc-error-tree` | 68 | github.com/serde-rs/serde (42), github.com/alacritty/alacritty (12), github.com/niri-wm/niri (8), github.com/rust-analyzer/rust-analyzer (3), github.com/uutils/coreutils (3) |
| `go-test-fail` | 65 | github.com/gohugoio/hugo (37), github.com/caddyserver/caddy (8), github.com/opentofu/opentofu (7), github.com/containers/podman (6), github.com/mvdan/sh (5), github.com/golangci/golangci-lint (1), github.com/spf13/viper (1) |
| `gradle-test-case-failed` | 64 | github.com/diffplug/spotless (18), github.com/square/okhttp (17), github.com/detekt/detekt (12), github.com/mockito/mockito (10), github.com/gradle/gradle (3), github.com/spring-projects/spring-framework (3), github.com/spring-projects/spring-boot (1) |
| `jest-run-summary` | 64 | github.com/vercel/next.js (42), github.com/facebook/react (12), github.com/prettier/prettier (6), github.com/phoenixframework/phoenix (4) |
| `pnpm-elifecycle-exit` | 61 | github.com/withastro/astro (17), github.com/honojs/hono (12), github.com/sveltejs/svelte (8), github.com/vitejs/vite (8), github.com/pnpm/pnpm (5), github.com/tailwindlabs/tailwindcss (5), github.com/vuejs/core (5), github.com/vercel/next.js (1) |
| `msvc-compiler-error` | 58 | github.com/nlohmann/json (52), github.com/fmtlib/fmt (3), github.com/luarocks/luarocks (3) |
| `phpunit-failed-asserting` | 53 | github.com/phpstan/phpstan (41), github.com/sebastianbergmann/phpunit (6), github.com/laravel/framework (4), github.com/symfony/symfony (2) |
| `dependabot-update-errors` | 48 | github.com/helm/helm (5), github.com/cli/cli (4), github.com/phoenixframework/phoenix (4), github.com/pydantic/pydantic (4), github.com/stylelint/stylelint (4), github.com/Alamofire/Alamofire (3), github.com/cachix/devenv (3), github.com/denoland/deno (3) … +9 仓 |
| `git-unified-diff-drift` | 46 | github.com/hashicorp/terraform (22), github.com/oven-sh/bun (4), github.com/bitcoin/bitcoin (3), github.com/bbernhard/signal-cli-rest-api (2), github.com/grpc/grpc-go (2), github.com/microsoft/TypeScript (2), github.com/mitmproxy/mitmproxy (2), github.com/vitejs/vite (2) … +7 仓 |
| `vitest-run-summary` | 44 | github.com/sveltejs/svelte (14), github.com/vuejs/core (14), github.com/tailwindlabs/tailwindcss (8), github.com/honojs/hono (4), github.com/vitejs/vite (4) |
| `maven-goal-failed` | 41 | github.com/google/auto (25), github.com/google/error-prone (8), github.com/redisson/redisson (6), github.com/google/guava (2) |
| `nix-build-failed` | 37 | github.com/LnL7/nix-darwin (37) |
| `gradle-build-failed` | 36 | github.com/diffplug/spotless (8), github.com/mockito/mockito (8), github.com/detekt/detekt (6), github.com/gradle/gradle (4), github.com/spring-projects/spring-framework (4), github.com/square/okhttp (4), github.com/spring-projects/spring-boot (2) |
| `playwright-failed-test-header` | 35 | github.com/microsoft/playwright (22), github.com/anomalyco/opencode (9), github.com/phpstan/phpstan (4) |
| `bazel-test-target-failed` | 32 | github.com/protocolbuffers/protobuf (22), github.com/google/xls (7), github.com/google/googletest (2), github.com/chipsalliance/verible (1) |
| `nix-drv-list-noise` | 32 | github.com/nix-community/home-manager (18), github.com/LnL7/nix-darwin (7), github.com/jgm/pandoc (5), github.com/nix-community/nix-direnv (2) |
| `rust-libtest-summary-failed` | 32 | github.com/astral-sh/ruff (8), github.com/dandavison/delta (4), github.com/rust-analyzer/rust-analyzer (4), github.com/serde-rs/serde (4), github.com/sharkdp/fd (4), github.com/qdrant/qdrant (3), github.com/pnpm/pnpm (2), github.com/uutils/coreutils (2) … +1 仓 |
| `fileutils-cannot-access` | 31 | github.com/luarocks/luarocks (15), github.com/containers/podman (12), github.com/sharkdp/bat (3), github.com/haskell/haskell-language-server (1) |
| `mypy-type-error` | 31 | github.com/mitmproxy/mitmproxy (24), github.com/psf/black (4), github.com/python-poetry/poetry (2), github.com/pallets/flask (1) |
| `rspec-failure-error` | 31 | github.com/rubocop/rubocop (21), github.com/Homebrew/brew (10) |
| `turbo-run-failed` | 31 | github.com/withastro/astro (18), github.com/anomalyco/opencode (10), github.com/vercel/next.js (3) |
| `nix-deprecation-warning` | 28 | github.com/LnL7/nix-darwin (24), github.com/DeterminateSystems/magic-nix-cache (3), github.com/cachix/devenv (1) |
| `cargo-could-not-compile` | 27 | github.com/rust-analyzer/rust-analyzer (6), github.com/niri-wm/niri (5), github.com/alacritty/alacritty (3), github.com/serde-rs/serde (3), github.com/tokio-rs/tokio (3), github.com/uutils/coreutils (3), github.com/starship/starship (2), github.com/dandavison/delta (1) … +1 仓 |
| `pytest-failures-section` | 27 | github.com/pytest-dev/pytest (9), github.com/python-poetry/poetry (8), github.com/pydantic/pydantic (3), github.com/openai/openai-python (2), github.com/pandas-dev/pandas (2), github.com/scikit-learn/scikit-learn (2), github.com/qdrant/qdrant (1) |
| `github-actions-workflow-gate-echo` | 24 | github.com/apache/kafka (8), github.com/grpc/grpc-go (8), github.com/scikit-learn/scikit-learn (4), github.com/protocolbuffers/protobuf (3), github.com/rrrene/credo (1) |
| `tsc-diagnostic` | 23 | github.com/oven-sh/bun (11), github.com/prettier/prettier (4), github.com/DavidAnson/markdownlint (3), github.com/honojs/hono (2), github.com/vuejs/core (2), github.com/microsoft/TypeScript (1) |
| `xctest-test-case-failed` | 21 | github.com/swiftlang/swift-syntax (21) |
| `kotlinc-compile-error` | 20 | github.com/detekt/detekt (20) |
| `rspec-rerun-command` | 20 | github.com/rubocop/rubocop (12), github.com/fastlane/fastlane (8) |
| `pre-commit-hook-failed` | 18 | github.com/psf/requests (6), github.com/terraform-aws-modules/terraform-aws-vpc (4), github.com/fastapi/fastapi (2), github.com/pallets/flask (2), github.com/psf/black (2), github.com/google/xls (1), github.com/openssl/openssl (1) |
| `zig-compile-error` | 18 | github.com/zigtools/zls (17), github.com/neovim/neovim (1) |
| `gradle-test-summary-failed` | 16 | github.com/square/okhttp (4), github.com/diffplug/spotless (3), github.com/mockito/mockito (3), github.com/spring-projects/spring-framework (3), github.com/detekt/detekt (1), github.com/gradle/gradle (1), github.com/spring-projects/spring-boot (1) |
| `maven-surefire-test-failed` | 15 | github.com/google/error-prone (8), github.com/google/auto (5), github.com/google/guava (2) |
| `xctest-assert-failed` | 14 | github.com/swiftlang/swift-syntax (14) |
| `phpunit-failure-list-header` | 13 | github.com/symfony/symfony (7), github.com/laravel/framework (3), github.com/phpstan/phpstan (3) |
| `bun-test-fail` | 12 | github.com/anomalyco/opencode (10), github.com/oven-sh/bun (2) |
| `golangci-lint-issues-summary` | 12 | github.com/golangci/golangci-lint (6), github.com/aquasecurity/trivy (2), github.com/opentofu/opentofu (2), github.com/grafana/loki (1), github.com/helm/helm (1) |
| `maven-surefire-failures-summary` | 11 | github.com/google/auto (5), github.com/google/error-prone (5), github.com/google/guava (1) |
| `redis-test-err` | 11 | github.com/redis/redis (11) |
| `bun-script-exit-fail` | 10 | github.com/anomalyco/opencode (10) |
| `cocoon-wait-for-tests-failed` | 10 | github.com/flutter/flutter (10) |
| `stack-structured-error` | 10 | github.com/commercialhaskell/stack (8), github.com/haskell/haskell-language-server (1), github.com/jgm/pandoc (1) |
| `go-http-request-failed` | 9 | github.com/etcd-io/etcd (7), github.com/astral-sh/ruff (1), github.com/trufflesecurity/trufflehog (1) |
| `node-uncaught-exception` | 9 | github.com/ant-design/ant-design (6), github.com/denoland/deno (3) |
| `shell-command-not-found` | 9 | github.com/bitcoin/bitcoin (4), github.com/dotnet/aspnetcore (2), github.com/alacritty/alacritty (1), github.com/containers/podman (1), github.com/curl/curl (1) |
| `actionlint-generate-drift` | 8 | github.com/rhysd/actionlint (8) |
| `cabal-structured-error` | 8 | github.com/hadolint/hadolint (4), github.com/haskell/cabal (2), github.com/haskell/haskell-language-server (2) |
| `cargo-msrv-unsupported` | 8 | github.com/alacritty/alacritty (4), github.com/niri-wm/niri (4) |
| `cmake-configure-error` | 8 | github.com/neovim/neovim (4), github.com/swiftlang/swift-format (4) |
| `docker-build-failed` | 8 | github.com/doccano/doccano (4), github.com/mvdan/sh (2), github.com/koalaman/shellcheck (1), github.com/qdrant/qdrant (1) |
| `ghc-source-error` | 8 | github.com/hadolint/hadolint (4), github.com/haskell/cabal (4) |
| `minitest-run-summary` | 8 | github.com/puma/puma (5), github.com/rails/rails (3) |
| `nixfmt-fail-on-change` | 8 | github.com/nix-community/home-manager (8) |
| `npm-run-all-failed-tasks` | 8 | github.com/microsoft/TypeScript (8) |
| `semgrep-scan-start-failed` | 8 | github.com/semgrep/semgrep (8) |
| `treefmt-fail-on-change` | 8 | github.com/nix-community/home-manager (8) |
| `trivy-vuln-found` | 8 | github.com/gin-gonic/gin (8) |
| `cargo-build-warnings-denied` | 7 | github.com/starship/starship (6), github.com/astral-sh/ruff (1) |
| `codeql-action-job-status-failure` | 7 | github.com/elixir-lang/elixir (2), github.com/opencv/opencv (2), github.com/fastlane/fastlane (1), github.com/fmtlib/fmt (1), github.com/redisson/redisson (1) |
| `commit-lint-violation` | 7 | github.com/JetBrains/Exposed (6), github.com/django/django (1) |
| `fastlane-exit-status` | 7 | github.com/fastlane/fastlane (7) |
| `fastlane-finished-with-errors` | 7 | github.com/fastlane/fastlane (7) |
| `go-compile-error` | 7 | github.com/grafana/loki (4), github.com/aquasecurity/trivy (1), github.com/golangci/golangci-lint (1), github.com/hashicorp/terraform (1) |
| `minitest-failure-report` | 7 | github.com/puma/puma (6), github.com/rails/rails (1) |
| `mypy-found-errors` | 7 | github.com/mitmproxy/mitmproxy (2), github.com/psf/black (2), github.com/python-poetry/poetry (2), github.com/pallets/flask (1) |
| `npm-audit-unresolved` | 7 | github.com/rollup/rollup (7) |
| `npm-network-error` | 7 | github.com/evanw/esbuild (7) |
| `phpstan-error-table` | 7 | github.com/composer/composer (7) |
| `pnpm-error-tree` | 7 | github.com/pnpm/pnpm (5), github.com/honojs/hono (1), github.com/vitejs/vite (1) |
| `apt-package-unavailable` | 6 | github.com/BurntSushi/ripgrep (6) |
| `black-would-reformat` | 6 | github.com/django/django (6) |
| `gh-api-integration-error` | 6 | github.com/haskell/haskell-language-server (5), github.com/anomalyco/opencode (1) |
| `ghc-gcc-phase-failure` | 6 | github.com/commercialhaskell/stack (6) |
| `pytest-conftest-import-error` | 6 | github.com/pallets/flask (6) |
| `python-unittest-fail` | 6 | github.com/django/django (4), github.com/google/googletest (2) |
| `busted-htest-error-entry` | 5 | github.com/luarocks/luarocks (5) |
| `cargo-nextest-run-failed` | 5 | github.com/astral-sh/ruff (1), github.com/pnpm/pnpm (1), github.com/qdrant/qdrant (1), github.com/rust-analyzer/rust-analyzer (1), github.com/tokio-rs/tokio (1) |
| `curl-cli-error` | 5 | github.com/luarocks/luarocks (2), github.com/redisson/redisson (2), github.com/cachix/devenv (1) |
| `eslint-offense-line` | 5 | github.com/anomalyco/opencode (5) |
| `github-actions-cache-not-found` | 5 | github.com/dotnet/roslyn (5) |
| `maven-wrapper-main-missing` | 5 | github.com/google/guava (5) |
| `node-error-errno-bracket` | 5 | github.com/denoland/deno (5) |
| `praktika-job-fail` | 5 | github.com/ClickHouse/ClickHouse (5) |
| `praktika-run-failed` | 5 | github.com/ClickHouse/ClickHouse (5) |
| `wait-on-check-conclusion-not-allowed` | 5 | github.com/flutter/packages (5) |
| `bazel-error` | 4 | github.com/protocolbuffers/protobuf (3), github.com/chipsalliance/verible (1) |
| `busted-htest-failure-banner` | 4 | github.com/luarocks/luarocks (4) |
| `cabal-update-unexpected-response` | 4 | github.com/haskell/haskell-language-server (3), github.com/haskell/cabal (1) |
| `cargo-build-script-failed` | 4 | github.com/niri-wm/niri (3), github.com/dtolnay/cxx (1) |
| `clang-format-lint-diff` | 4 | github.com/google/benchmark (4) |
| `copilot-cli-error` | 4 | github.com/dotnet/aspnetcore (4) |
| `copilot-harness-attempt-failed` | 4 | github.com/dotnet/runtime (4) |
| `eslint-cli-fatal-error` | 4 | github.com/eslint/eslint (4) |
| `go-mod-updates-needed` | 4 | github.com/hashicorp/terraform (4) |
| `hawk-finding-error` | 4 | github.com/astral-sh/ruff (4) |
| `node-command-failed-exit` | 4 | github.com/swiftlang/swift-syntax (4) |
| `node-test-fail` | 4 | github.com/withastro/astro (4) |
| `nvim-test-assertion-detail` | 4 | github.com/neovim/neovim (4) |
| `nvim-test-failure-list-entry` | 4 | github.com/neovim/neovim (4) |
| `phpunit-failures-banner` | 4 | github.com/laravel/framework (2), github.com/phpstan/phpstan (2) |
| `pip-build-metadata-error` | 4 | github.com/doccano/doccano (4) |
| `powershell-error-record` | 4 | github.com/containers/podman (4) |
| `prettier-check-drift` | 4 | github.com/eslint/eslint (3), github.com/sveltejs/svelte (1) |
| `tap-test-failed` | 4 | github.com/libuv/libuv (3), github.com/nix-community/nix-direnv (1) |
| `check-spelling-unrecognized-words` | 3 | github.com/jekyll/jekyll (3) |
| `ctest-tests-failed-list` | 3 | github.com/fmtlib/fmt (1), github.com/libuv/libuv (1), github.com/nlohmann/json (1) |
| `exunit-failed-summary` | 3 | github.com/elixir-lang/elixir (2), github.com/phoenixframework/phoenix (1) |
| `exunit-failure-entry` | 3 | github.com/elixir-lang/elixir (2), github.com/phoenixframework/phoenix (1) |
| `linkinator-broken-links` | 3 | github.com/DavidAnson/markdownlint (3) |
| `nix-eval-error-tree` | 3 | github.com/jgm/pandoc (2), github.com/cachix/devenv (1) |
| `nix-flake-attr-missing` | 3 | github.com/anomalyco/opencode (3) |
| `node-test-fail-plain` | 3 | github.com/DavidAnson/markdownlint (3) |
| `npm-run-all-task-exit-error` | 3 | github.com/DavidAnson/markdownlint (3) |
| `nvim-test-run-fail` | 3 | github.com/neovim/neovim (3) |
| `phpstan-found-errors` | 3 | github.com/composer/composer (3) |
| `rsync-error` | 3 | github.com/spring-projects/spring-framework (3) |
| `ruby-errno-exception` | 3 | github.com/puma/puma (3) |
| `rustc-doc-failed` | 3 | github.com/rust-analyzer/rust-analyzer (1), github.com/serde-rs/serde (1), github.com/vercel/next.js (1) |
| `swift-tools-version-mismatch` | 3 | github.com/swiftlang/swift-format (3) |
| `tar-unrecoverable-error` | 3 | github.com/redisson/redisson (2), github.com/koalaman/shellcheck (1) |
| `zig-build-summary-failed` | 3 | github.com/zigtools/zls (3) |
| `bazel-loading-phase-error` | 2 | github.com/google/googletest (1), github.com/protocolbuffers/protobuf (1) |
| `busted-htest-failed-test-entry` | 2 | github.com/luarocks/luarocks (2) |
| `changesets-exited-error` | 2 | github.com/stylelint/stylelint (2) |
| `eslint-ecosystem-plugin-failed` | 2 | github.com/eslint/eslint (2) |
| `eslint-stylish-summary` | 2 | github.com/DavidAnson/markdownlint (1), github.com/prettier/prettier (1) |
| `flutter-bots-command-failed` | 2 | github.com/flutter/flutter (2) |
| `gh-api-non-json-response` | 2 | github.com/ClickHouse/ClickHouse (2) |
| `git-push-auth-failed` | 2 | github.com/opencv/opencv (2) |
| `git-push-rejected` | 2 | github.com/nix-community/home-manager (2) |
| `gotestsum-run-summary` | 2 | github.com/trufflesecurity/trufflehog (2) |
| `just-recipe-fail` | 2 | github.com/pnpm/pnpm (2) |
| `mix-error` | 2 | github.com/elixir-lang/elixir (1), github.com/rrrene/credo (1) |
| `notarytool-agreement-expired` | 2 | github.com/duckdb/duckdb (2) |
| `oxlint-found-errors` | 2 | github.com/honojs/hono (1), github.com/vitejs/vite (1) |
| `rubocop-self-lint-failed` | 2 | github.com/Homebrew/brew (1), github.com/fastlane/fastlane (1) |
| `rust-io-no-such-file` | 2 | github.com/sharkdp/bat (2) |
| `swift-fatal-error` | 2 | github.com/Alamofire/Alamofire (1), github.com/swiftlang/swift-syntax (1) |
| `verify-pr-title-invalid` | 2 | github.com/aquasecurity/trivy (2) |
| `winget-releaser-token-invalid` | 2 | github.com/dandavison/delta (2) |
| `coverage-fail-under` | 1 | github.com/fastapi/fastapi (1) |
| `csc-diagnostic-error` | 1 | github.com/nlohmann/json (1) |
| `curl-runtests-testfail` | 1 | github.com/curl/curl (1) |
| `eslint-stylish-offense` | 1 | github.com/DavidAnson/markdownlint (1) |
| `forgejo-actions-job-failed` | 1 | github.com/qdrant/qdrant (1) |
| `gh-api-validation-failed` | 1 | github.com/elixir-lang/elixir (1) |
| `gh-cli-error` | 1 | github.com/flutter/packages (1) |
| `git-fetch-ref-not-found` | 1 | github.com/pandas-dev/pandas (1) |
| `go-mod-fetch-error` | 1 | github.com/aquasecurity/trivy (1) |
| `go-mod-parse-error` | 1 | github.com/aquasecurity/trivy (1) |
| `goreleaser-pipe-timeout` | 1 | github.com/aquasecurity/trivy (1) |
| `knip-unused-section` | 1 | github.com/eslint/eslint (1) |
| `mage-drift-gate-echo` | 1 | github.com/aquasecurity/trivy (1) |
| `nix-activation-conflict` | 1 | github.com/LnL7/nix-darwin (1) |
| `node-test-snapshot-assert-fail` | 1 | github.com/DavidAnson/markdownlint (1) |
| `playwright-no-report-files` | 1 | github.com/microsoft/playwright (1) |
| `redis-test-exception` | 1 | github.com/redis/redis (1) |
| `semgrep-findings` | 1 | github.com/nlohmann/json (1) |
| `api-extractor-semantic-error` | 0 |  |
| `apt-held-broken-packages` | 0 |  |
| `autoconf-configure-error` | 0 |  |
| `bazel-undeclared-target-option` | 0 |  |
| `bitcoin-fuzz-target-failure` | 0 |  |
| `bitcoin-lint-check-failure` | 0 |  |
| `bitcoin-qa-assets-download-failed` | 0 |  |
| `bun-error-json` | 0 |  |
| `bun-install-download-fail` | 0 |  |
| `bundler-lockfile-missing-frozen` | 0 |  |
| `cabal-build-failed` | 0 |  |
| `cabal-changelog-parse-failed` | 0 |  |
| `cabal-changelog-validation-failed` | 0 |  |
| `cargo-deny-check-summary` | 0 |  |
| `cargo-deny-lint-error` | 0 |  |
| `cargo-llvm-cov-error` | 0 |  |
| `cargo-version-conflict` | 0 |  |
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
| `copilot-harness-model-alias-failed` | 0 |  |
| `copilot-session-transcript-missing` | 0 |  |
| `credo-strict-suggestions` | 0 |  |
| `docker-registry-pull-failed` | 0 |  |
| `docusaurus-bundle-error` | 0 |  |
| `dotnet-unhandled-exception` | 0 |  |
| `duckdb-plan-cost-regression` | 0 |  |
| `ecosystem-analyzer-new-project-failures` | 0 |  |
| `emmylua-diagnostic` | 0 |  |
| `erlang-signal-stack-failed` | 0 |  |
| `esbuild-build-failed` | 0 |  |
| `esbuild-js-api-tests-failed` | 0 |  |
| `escript-exception` | 0 |  |
| `fastlane-itms-probe-failed` | 0 |  |
| `fileutils-cp-usage-error` | 0 |  |
| `flake8-violation` | 0 |  |
| `forgejo-actions-poll-noise` | 0 |  |
| `forgejo-actions-runner-version-info` | 0 |  |
| `freebsd-rtld-shared-object-missing` | 0 |  |
| `gh-api-http-error` | 0 |  |
| `git-am-apply-failed` | 0 |  |
| `git-fatal-invalid-commit-name` | 0 |  |
| `git-http-access-denied` | 0 |  |
| `git-pkgs-lookup-error` | 0 |  |
| `github-actions-checkout-ref-mismatch` | 0 |  |
| `github-actions-raw-error-command` | 0 |  |
| `gitleaks-leaks-found` | 0 |  |
| `go-mod-tidy-diff` | 0 |  |
| `go-toolchain-mismatch` | 0 |  |
| `golangci-lint-config-invalid` | 0 |  |
| `gotestfmt-test-fail` | 0 |  |
| `homebrew-portable-ruby-failed` | 0 |  |
| `homebrew-update-locked` | 0 |  |
| `html-proofer-external-link-failed` | 0 |  |
| `html-proofer-found-failures` | 0 |  |
| `infra-disk-quota-exceeded` | 0 |  |
| `infra-runner-file-command-eacces` | 0 |  |
| `lintcommit-invalid-message` | 0 |  |
| `mastodon-github-action-post-error` | 0 |  |
| `mdl-finding` | 0 |  |
| `meson-subproject-not-buildable` | 0 |  |
| `mocha-test-fail` | 0 |  |
| `mordant-findings-over-baseline` | 0 |  |
| `mport-fetch-error` | 0 |  |
| `msbuild-build-failed` | 0 |  |
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
| `npm-auth-error` | 0 |  |
| `npm-config-error` | 0 |  |
| `npm-missing-script` | 0 |  |
| `npm-tlog-entry-error` | 0 |  |
| `octokit-request-error` | 0 |  |
| `pacman-retrieve-failed` | 0 |  |
| `phpunit-fatal-error-during-test` | 0 |  |
| `phpunit-php-version-mismatch` | 0 |  |
| `pip-install-error` | 0 |  |
| `pkgin-could-not-fetch` | 0 |  |
| `plenary-test-fail` | 0 |  |
| `plenary-tests-failed` | 0 |  |
| `pnpm-error-code-bracketed` | 0 |  |
| `podman-image-copy-failed` | 0 |  |
| `powershell-method-invocation-exception` | 0 |  |
| `proselint-finding` | 0 |  |
| `pyanalyze-error-findings` | 0 |  |
| `pyright-error-summary` | 0 |  |
| `pyright-type-error` | 0 |  |
| `pyspelling-check-failed` | 0 |  |
| `python-argparse-expected-argument` | 0 |  |
| `python-argparse-missing-required-args` | 0 |  |
| `python-logging-critical-message` | 0 |  |
| `qunit-headless-chrome-failed` | 0 |  |
| `redis-server-bugreport` | 0 |  |
| `ruby-name-error` | 0 |  |
| `scorecard-action-error` | 0 |  |
| `scorecard-action-signing-error` | 0 |  |
| `semgrep-invalid-api-key` | 0 |  |
| `shell-bash-unbound-variable` | 0 |  |
| `shell-cp-usage-error` | 0 |  |
| `signtool-error` | 0 |  |
| `size-limit-exceeded` | 0 |  |
| `sst-concurrent-lock` | 0 |  |
| `sst-unexpected-error` | 0 |  |
| `stack-hackage-verification-error` | 0 |  |
| `swift-build-error` | 0 |  |
| `swift-docc-compile-failed` | 0 |  |
| `swift-testing-runner-crash` | 0 |  |
| `swift-testing-test-failed` | 0 |  |
| `swiftc-compile-error` | 0 |  |
| `systemd-ci-unit-fail` | 0 |  |
| `trivy-misconf-failures` | 0 |  |
| `trufflehog-secret-found` | 0 |  |
| `trufflehog-unverified-secret` | 0 |  |
| `typos-correction-error` | 0 |  |
| `utoo-dependency-resolution-failed` | 0 |  |
| `utoo-install-download-failed` | 0 |  |
| `uv-require-hashes-unpinned` | 0 |  |
| `vite-plus-runtime-download-failed` | 0 |  |
| `wait-on-check-never-run` | 0 |  |
| `warp-out-of-credits` | 0 |  |
| `webpack-hook-error` | 0 |  |
| `xunit-assert-failure` | 0 |  |
| `zig-build-command-failed` | 0 |  |
| `zizmor-audit-error` | 0 |  |

零命中规则 (148 条, dead_rules 候选 — 语料未覆盖的工具或正则失效):
- `api-extractor-semantic-error`
- `apt-held-broken-packages`
- `autoconf-configure-error`
- `bazel-undeclared-target-option`
- `bitcoin-fuzz-target-failure`
- `bitcoin-lint-check-failure`
- `bitcoin-qa-assets-download-failed`
- `bun-error-json`
- `bun-install-download-fail`
- `bundler-lockfile-missing-frozen`
- `cabal-build-failed`
- `cabal-changelog-parse-failed`
- `cabal-changelog-validation-failed`
- `cargo-deny-check-summary`
- `cargo-deny-lint-error`
- `cargo-llvm-cov-error`
- `cargo-version-conflict`
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
- `copilot-harness-model-alias-failed`
- `copilot-session-transcript-missing`
- `credo-strict-suggestions`
- `docker-registry-pull-failed`
- `docusaurus-bundle-error`
- `dotnet-unhandled-exception`
- `duckdb-plan-cost-regression`
- `ecosystem-analyzer-new-project-failures`
- `emmylua-diagnostic`
- `erlang-signal-stack-failed`
- `esbuild-build-failed`
- `esbuild-js-api-tests-failed`
- `escript-exception`
- `fastlane-itms-probe-failed`
- `fileutils-cp-usage-error`
- `flake8-violation`
- `forgejo-actions-poll-noise`
- `forgejo-actions-runner-version-info`
- `freebsd-rtld-shared-object-missing`
- `gh-api-http-error`
- `git-am-apply-failed`
- `git-fatal-invalid-commit-name`
- `git-http-access-denied`
- `git-pkgs-lookup-error`
- `github-actions-checkout-ref-mismatch`
- `github-actions-raw-error-command`
- `gitleaks-leaks-found`
- `go-mod-tidy-diff`
- `go-toolchain-mismatch`
- `golangci-lint-config-invalid`
- `gotestfmt-test-fail`
- `homebrew-portable-ruby-failed`
- `homebrew-update-locked`
- `html-proofer-external-link-failed`
- `html-proofer-found-failures`
- `infra-disk-quota-exceeded`
- `infra-runner-file-command-eacces`
- `lintcommit-invalid-message`
- `mastodon-github-action-post-error`
- `mdl-finding`
- `meson-subproject-not-buildable`
- `mocha-test-fail`
- `mordant-findings-over-baseline`
- `mport-fetch-error`
- `msbuild-build-failed`
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
- `npm-auth-error`
- `npm-config-error`
- `npm-missing-script`
- `npm-tlog-entry-error`
- `octokit-request-error`
- `pacman-retrieve-failed`
- `phpunit-fatal-error-during-test`
- `phpunit-php-version-mismatch`
- `pip-install-error`
- `pkgin-could-not-fetch`
- `plenary-test-fail`
- `plenary-tests-failed`
- `pnpm-error-code-bracketed`
- `podman-image-copy-failed`
- `powershell-method-invocation-exception`
- `proselint-finding`
- `pyanalyze-error-findings`
- `pyright-error-summary`
- `pyright-type-error`
- `pyspelling-check-failed`
- `python-argparse-expected-argument`
- `python-argparse-missing-required-args`
- `python-logging-critical-message`
- `qunit-headless-chrome-failed`
- `redis-server-bugreport`
- `ruby-name-error`
- `scorecard-action-error`
- `scorecard-action-signing-error`
- `semgrep-invalid-api-key`
- `shell-bash-unbound-variable`
- `shell-cp-usage-error`
- `signtool-error`
- `size-limit-exceeded`
- `sst-concurrent-lock`
- `sst-unexpected-error`
- `stack-hackage-verification-error`
- `swift-build-error`
- `swift-docc-compile-failed`
- `swift-testing-runner-crash`
- `swift-testing-test-failed`
- `swiftc-compile-error`
- `systemd-ci-unit-fail`
- `trivy-misconf-failures`
- `trufflehog-secret-found`
- `trufflehog-unverified-secret`
- `typos-correction-error`
- `utoo-dependency-resolution-failed`
- `utoo-install-download-failed`
- `uv-require-hashes-unpinned`
- `vite-plus-runtime-download-failed`
- `wait-on-check-never-run`
- `warp-out-of-credits`
- `webpack-hook-error`
- `xunit-assert-failure`
- `zig-build-command-failed`
- `zizmor-audit-error`

总命中口径 = signal fragment ∪ noise 剔除区块, 全样本域 (liveness)。
</details>
