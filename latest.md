# log-skimmer 回测报告 (每周自动刷新)

- 时点: 2026-10-24 · verdict: **pass** · 引擎 `c47ae7e` · 规则 `7a4f87e` · 语料 `24b9872`
- 运行记录: https://github.com/luochen1990/log-skimmer-rules/actions/runs/40077535891 · 消费方: README 徽章 — 本文件即其数据源, 勿手工编辑

## 判定: ✅ PASS

- 对比模式: 单测 (未提供 base summary, 压缩率对比跳过 — CI 编排应提供 base 以启用退化哨兵)

## gated 组 (断言面)

| 样本 | FN | FP率 | FP行 | 零块 | 边界违例 | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1345 | 0 | 0% | 18 | 0 | 0 | 99.26% | 99.58% |

## exempt 组 (报告面, 不进断言 — 豁免余量 = 逐仓适配进度)

无豁免样本 — 语料全量入断言 (sidecar 未启用 gate_exempt)。

## 规则健康档案

- 诊断覆盖率: 555/970 = 57.22% (含 ≥1 非 restating 失败块的失败族样本 — FN 保证有块, 覆盖保证块由内容决定)
- 分级: restating 1 (结论复述安全网) / diagnostic 119 (内容决定, 计覆盖) / boundary 1 (断裂带, 人工审)
- 完整健康表 (PPV/Wilson/lift/spec/intent 核对): [reports 分支 rules-health.md](https://github.com/luochen1990/log-skimmer-rules/blob/reports/rules-health.md)

<details>
<summary>逐仓分解 (127 仓) — 样本/豁免/FN/FP/零块/压缩率</summary>

| repo | 样本 | 豁免 | FN | FP率 | 零块 | 边界 | 压缩 blk | 压缩 sig |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `github.com/Alamofire/Alamofire` | 10 | 0 | 0 | 0% | 0 | 0 | 98.93% | 97.87% |
| `github.com/AvaloniaUI/Avalonia` | 11 | 0 | 0 | 0% | 0 | 0 | 97.01% | 97.09% |
| `github.com/BurntSushi/ripgrep` | 11 | 0 | 0 | 0% | 0 | 0 | 99.37% | 92.8% |
| `github.com/ClickHouse/ClickHouse` | 11 | 0 | 0 | 0% | 0 | 0 | 99.94% | 99.97% |
| `github.com/DavidAnson/markdownlint` | 11 | 0 | 0 | 0% | 0 | 0 | 98.9% | 99.78% |
| `github.com/Homebrew/brew` | 11 | 0 | 0 | 0% | 0 | 0 | 99.71% | 99.71% |
| `github.com/JamesNK/Newtonsoft.Json` | 3 | 0 | 0 | 0% | 0 | 0 | 99.93% | 99.93% |
| `github.com/JetBrains/Exposed` | 11 | 0 | 0 | 0% | 0 | 0 | 99.79% | 99.79% |
| `github.com/LnL7/nix-darwin` | 11 | 0 | 0 | 0% | 0 | 0 | 98.52% | 99.52% |
| `github.com/alacritty/alacritty` | 11 | 0 | 0 | 0% | 0 | 0 | 99.71% | 99.68% |
| `github.com/anomalyco/opencode` | 19 | 0 | 0 | 0% | 0 | 0 | 90.4% | 96.25% |
| `github.com/ant-design/ant-design` | 11 | 0 | 0 | 0% | 0 | 0 | 94.3% | 97.39% |
| `github.com/apache/kafka` | 11 | 0 | 0 | 0% | 0 | 0 | 99.82% | 99.82% |
| `github.com/aquasecurity/trivy` | 11 | 0 | 0 | 0% | 0 | 0 | 99.61% | 99.63% |
| `github.com/astral-sh/ruff` | 11 | 0 | 0 | 0% | 0 | 0 | 99.97% | 99.97% |
| `github.com/bitcoin/bitcoin` | 11 | 0 | 0 | 0% | 0 | 0 | 99.81% | 99.93% |
| `github.com/caddyserver/caddy` | 11 | 0 | 0 | 0% | 0 | 0 | 98.94% | 99.28% |
| `github.com/catchorg/Catch2` | 8 | 0 | 0 | 0% | 0 | 0 | 97% | 97.68% |
| `github.com/cli/cli` | 11 | 0 | 0 | 0% | 0 | 0 | 97.51% | 82.79% |
| `github.com/commercialhaskell/stack` | 8 | 0 | 0 | 0% | 0 | 0 | 99.74% | 99.81% |
| `github.com/composer/composer` | 11 | 0 | 0 | 0% | 0 | 0 | 98.98% | 99.04% |
| `github.com/curl/curl` | 11 | 0 | 0 | 0% | 0 | 0 | 99.7% | 99.71% |
| `github.com/dandavison/delta` | 11 | 0 | 0 | 0% | 0 | 0 | 99.53% | 99.45% |
| `github.com/denoland/deno` | 11 | 0 | 0 | 0% | 0 | 0 | 99.8% | 99.9% |
| `github.com/detekt/detekt` | 11 | 0 | 0 | 0% | 0 | 0 | 98.87% | 99.06% |
| `github.com/diffplug/spotless` | 11 | 0 | 0 | 0% | 0 | 0 | 99.55% | 99.79% |
| `github.com/django/django` | 11 | 0 | 0 | 0% | 0 | 0 | 99.96% | 99.97% |
| `github.com/dotnet/aspnetcore` | 11 | 0 | 0 | 0% | 0 | 0 | 99.62% | 99.6% |
| `github.com/dotnet/roslyn` | 11 | 0 | 0 | 0% | 0 | 0 | 99.93% | 99.93% |
| `github.com/dotnet/runtime` | 11 | 0 | 0 | 0% | 0 | 0 | 99.84% | 99.84% |
| `github.com/duckdb/duckdb` | 11 | 0 | 0 | 0% | 0 | 0 | 99.27% | 99.56% |
| `github.com/elixir-lang/elixir` | 7 | 0 | 0 | 0% | 0 | 0 | 99.75% | 99.76% |
| `github.com/erlang/otp` | 11 | 0 | 0 | 0% | 0 | 0 | 99.96% | 99.97% |
| `github.com/eslint/eslint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.31% | 99.66% |
| `github.com/etcd-io/etcd` | 11 | 0 | 0 | 0.03% | 0 | 0 | 99.64% | 99.64% |
| `github.com/evanw/esbuild` | 11 | 0 | 0 | 0% | 0 | 0 | 99.76% | 99.76% |
| `github.com/fastapi/fastapi` | 11 | 0 | 0 | 0% | 0 | 0 | 99.8% | 99.92% |
| `github.com/fastlane/fastlane` | 11 | 0 | 0 | 0% | 0 | 0 | 99.69% | 99.69% |
| `github.com/flutter/flutter` | 11 | 0 | 0 | 0% | 0 | 0 | 99.69% | 99.89% |
| `github.com/flutter/packages` | 11 | 0 | 0 | 0% | 0 | 0 | 99.85% | 99.92% |
| `github.com/fmtlib/fmt` | 11 | 0 | 0 | 0% | 0 | 0 | 98.04% | 99.18% |
| `github.com/gin-gonic/gin` | 11 | 0 | 0 | 0% | 0 | 0 | 99.57% | 99.73% |
| `github.com/gitleaks/gitleaks` | 2 | 0 | 0 | 0% | 0 | 0 | 99.74% | 99.74% |
| `github.com/gohugoio/hugo` | 11 | 0 | 0 | 0% | 0 | 0 | 99.95% | 99.95% |
| `github.com/golangci/golangci-lint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.76% | 99.74% |
| `github.com/google/benchmark` | 11 | 0 | 0 | 0% | 0 | 0 | 97.36% | 99.43% |
| `github.com/google/googletest` | 3 | 0 | 0 | 0% | 0 | 0 | 99.6% | 99.6% |
| `github.com/google/guava` | 11 | 0 | 0 | 0% | 0 | 0 | 99.2% | 99.74% |
| `github.com/gradle/gradle` | 11 | 0 | 0 | 0% | 0 | 0 | 99.32% | 99.68% |
| `github.com/grafana/loki` | 11 | 0 | 0 | 0% | 0 | 0 | 99.77% | 99.7% |
| `github.com/grpc/grpc-go` | 11 | 0 | 0 | 0% | 0 | 0 | 98.48% | 98.48% |
| `github.com/hadolint/hadolint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.72% | 99.77% |
| `github.com/haskell/cabal` | 11 | 0 | 0 | 0% | 0 | 0 | 99.79% | 99.82% |
| `github.com/haskell/haskell-language-server` | 11 | 0 | 0 | 0% | 0 | 0 | 99.87% | 99.89% |
| `github.com/helm/helm` | 11 | 0 | 0 | 0% | 0 | 0 | 99.81% | 99.91% |
| `github.com/honojs/hono` | 11 | 0 | 0 | 0% | 0 | 0 | 99.61% | 99.58% |
| `github.com/hyperium/hyper` | 11 | 0 | 0 | 0% | 0 | 0 | 98.47% | 98.47% |
| `github.com/jekyll/jekyll` | 11 | 0 | 0 | 0.04% | 0 | 0 | 98.93% | 98.93% |
| `github.com/jgm/pandoc` | 11 | 0 | 0 | 0% | 0 | 0 | 99.68% | 99.74% |
| `github.com/koalaman/shellcheck` | 9 | 0 | 0 | 0% | 0 | 0 | 99.82% | 99.84% |
| `github.com/kubernetes/kubernetes` | 3 | 0 | 0 | 0% | 0 | 0 | 99.99% | 99.99% |
| `github.com/laravel/framework` | 11 | 0 | 0 | 0% | 0 | 0 | 99.65% | 99.78% |
| `github.com/libuv/libuv` | 11 | 0 | 0 | 0% | 0 | 0 | 99.62% | 99.79% |
| `github.com/luarocks/luarocks` | 9 | 0 | 0 | 0% | 0 | 0 | 99.86% | 99.88% |
| `github.com/microsoft/TypeScript` | 11 | 0 | 0 | 0% | 0 | 0 | 99.85% | 99.8% |
| `github.com/microsoft/playwright` | 11 | 0 | 0 | 0% | 0 | 0 | 82.3% | 95.59% |
| `github.com/mitmproxy/mitmproxy` | 11 | 0 | 0 | 0% | 0 | 0 | 99.75% | 99.77% |
| `github.com/moby/moby` | 11 | 0 | 0 | 0% | 0 | 0 | 99.85% | 99.85% |
| `github.com/mockito/mockito` | 7 | 0 | 0 | 0% | 0 | 0 | 99.48% | 99.82% |
| `github.com/mvdan/sh` | 11 | 0 | 0 | 0% | 0 | 0 | 99.32% | 99.32% |
| `github.com/neovim/neovim` | 11 | 0 | 0 | 0% | 0 | 0 | 99.89% | 99.93% |
| `github.com/niri-wm/niri` | 19 | 0 | 0 | 0% | 0 | 0 | 99.89% | 99.9% |
| `github.com/nix-community/home-manager` | 19 | 0 | 0 | 0% | 0 | 0 | 94.34% | 99.66% |
| `github.com/nix-community/nix-direnv` | 6 | 0 | 0 | 0.06% | 0 | 0 | 97.8% | 99.51% |
| `github.com/nlohmann/json` | 11 | 0 | 0 | 0% | 0 | 0 | 99.88% | 99.88% |
| `github.com/nvim-telescope/telescope.nvim` | 9 | 0 | 0 | 0% | 0 | 0 | 98.63% | 99.39% |
| `github.com/openai/openai-python` | 11 | 0 | 0 | 0% | 0 | 0 | 96.34% | 98.41% |
| `github.com/opencv/opencv` | 11 | 0 | 0 | 0.02% | 0 | 0 | 99.91% | 99.95% |
| `github.com/openssl/openssl` | 11 | 0 | 0 | 0% | 0 | 0 | 99.87% | 99.9% |
| `github.com/oven-sh/bun` | 11 | 0 | 0 | 0% | 0 | 0 | 99.73% | 99.77% |
| `github.com/pallets/flask` | 11 | 0 | 0 | 0% | 0 | 0 | 99.2% | 99.2% |
| `github.com/pandas-dev/pandas` | 11 | 0 | 0 | 0% | 0 | 0 | 99.79% | 99.87% |
| `github.com/phoenixframework/phoenix` | 11 | 0 | 0 | 0% | 0 | 0 | 98.87% | 98.84% |
| `github.com/phpstan/phpstan` | 11 | 0 | 0 | 0% | 0 | 0 | 99.95% | 99.93% |
| `github.com/pnpm/pnpm` | 11 | 0 | 0 | 0% | 0 | 0 | 99.11% | 99.11% |
| `github.com/prettier/prettier` | 11 | 0 | 0 | 0% | 0 | 0 | 97.84% | 99.22% |
| `github.com/protocolbuffers/protobuf` | 11 | 0 | 0 | 0% | 0 | 0 | 95.5% | 96.34% |
| `github.com/psf/black` | 11 | 0 | 0 | 0% | 0 | 0 | 99.45% | 99.66% |
| `github.com/psf/requests` | 11 | 0 | 0 | 0% | 0 | 0 | 98.68% | 98.68% |
| `github.com/puma/puma` | 11 | 0 | 0 | 0% | 0 | 0 | 99.71% | 99.77% |
| `github.com/pydantic/pydantic` | 11 | 0 | 0 | 0% | 0 | 0 | 99.12% | 99.73% |
| `github.com/pytest-dev/pytest` | 11 | 0 | 0 | 0% | 0 | 0 | 99.46% | 99.76% |
| `github.com/qdrant/qdrant` | 11 | 0 | 0 | 0% | 0 | 0 | 99.89% | 99.92% |
| `github.com/rails/rails` | 11 | 0 | 0 | 0% | 0 | 0 | 99.85% | 99.85% |
| `github.com/redis/redis` | 11 | 0 | 0 | 0% | 0 | 0 | 99.86% | 99.9% |
| `github.com/rhysd/actionlint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.76% | 99.76% |
| `github.com/rollup/rollup` | 11 | 0 | 0 | 0% | 0 | 0 | 99.7% | 99.7% |
| `github.com/rrrene/credo` | 11 | 0 | 0 | 0% | 0 | 0 | 99.98% | 99.98% |
| `github.com/rubocop/rubocop` | 11 | 0 | 0 | 0.14% | 0 | 0 | 99.4% | 99.4% |
| `github.com/rust-analyzer/rust-analyzer` | 11 | 0 | 0 | 0% | 0 | 0 | 99.5% | 99.89% |
| `github.com/scikit-learn/scikit-learn` | 11 | 0 | 0 | 0% | 0 | 0 | 99.7% | 99.7% |
| `github.com/sebastianbergmann/phpunit` | 11 | 0 | 0 | 0% | 0 | 0 | 98.78% | 99.4% |
| `github.com/semgrep/semgrep` | 11 | 0 | 0 | 0% | 0 | 0 | 99.83% | 99.87% |
| `github.com/serde-rs/serde` | 11 | 0 | 0 | 0% | 0 | 0 | 98.58% | 99.18% |
| `github.com/sharkdp/bat` | 11 | 0 | 0 | 0% | 0 | 0 | 99.74% | 99.8% |
| `github.com/sharkdp/fd` | 11 | 0 | 0 | 0% | 0 | 0 | 99.38% | 99.59% |
| `github.com/spf13/cobra` | 3 | 0 | 0 | 0% | 0 | 0 | 97.67% | 97.67% |
| `github.com/spf13/viper` | 5 | 0 | 0 | 0% | 0 | 0 | 99.15% | 99.15% |
| `github.com/spring-projects/spring-boot` | 11 | 0 | 0 | 0.01% | 0 | 0 | 99.8% | 99.94% |
| `github.com/spring-projects/spring-framework` | 10 | 0 | 0 | 0% | 0 | 0 | 98.82% | 99.38% |
| `github.com/square/okhttp` | 11 | 0 | 0 | 0% | 0 | 0 | 98.64% | 99.47% |
| `github.com/starship/starship` | 11 | 0 | 0 | 0% | 0 | 0 | 99.88% | 99.9% |
| `github.com/stylelint/stylelint` | 11 | 0 | 0 | 0% | 0 | 0 | 99.41% | 99.52% |
| `github.com/sveltejs/svelte` | 11 | 0 | 0 | 0% | 0 | 0 | 92.58% | 97.71% |
| `github.com/swiftlang/swift-format` | 10 | 0 | 0 | 0% | 0 | 0 | 99.15% | 99.57% |
| `github.com/swiftlang/swift-syntax` | 11 | 0 | 0 | 0% | 0 | 0 | 99.43% | 99.5% |
| `github.com/symfony/symfony` | 11 | 0 | 0 | 0% | 0 | 0 | 99.91% | 99.93% |
| `github.com/tailwindlabs/tailwindcss` | 10 | 0 | 0 | 0% | 0 | 0 | 99.33% | 99.58% |
| `github.com/tokio-rs/tokio` | 11 | 0 | 0 | 0% | 0 | 0 | 99.72% | 99.8% |
| `github.com/trufflesecurity/trufflehog` | 11 | 0 | 0 | 0% | 0 | 0 | 99.91% | 97.26% |
| `github.com/uutils/coreutils` | 11 | 0 | 0 | 0% | 0 | 0 | 99.93% | 99.94% |
| `github.com/vapor/vapor` | 11 | 0 | 0 | 0% | 0 | 0 | 99.92% | 99.87% |
| `github.com/vercel/next.js` | 11 | 0 | 0 | 0.37% | 0 | 0 | 98.43% | 99.56% |
| `github.com/vitejs/vite` | 11 | 0 | 0 | 0% | 0 | 0 | 97.86% | 98.95% |
| `github.com/vuejs/core` | 11 | 0 | 0 | 0% | 0 | 0 | 95.13% | 99.25% |
| `github.com/withastro/astro` | 11 | 0 | 0 | 0.5% | 0 | 0 | 99.43% | 99.77% |
| `github.com/zigtools/zls` | 11 | 0 | 0 | 0% | 0 | 0 | 99.11% | 99.48% |

注: FN/FP 为诊断视图 (不分 gated/exempt, 看未适配仓离达标多远); 零块/边界为全域口径。
</details>

<details>
<summary>规则 × 仓 命中矩阵 (164 规则) — 命中分布与零命中 (死规则候选)</summary>

| 规则 | 总命中 | 命中仓分布 (top 8) |
| --- | --- | --- |
| `python-unittest-progress-noise` | 109901 | github.com/django/django (55257), github.com/uutils/coreutils (20671), github.com/rust-analyzer/rust-analyzer (8676), github.com/starship/starship (5409), github.com/alacritty/alacritty (4396), github.com/opencv/opencv (4162), github.com/sharkdp/bat (2148), github.com/BurntSushi/ripgrep (2109) … +16 仓 |
| `gradle-task-progress-noise` | 47143 | github.com/spring-projects/spring-boot (28185), github.com/detekt/detekt (5838), github.com/square/okhttp (5522), github.com/spring-projects/spring-framework (3301), github.com/gradle/gradle (2580), github.com/mockito/mockito (887), github.com/diffplug/spotless (830) |
| `cargo-progress-noise` | 41509 | github.com/qdrant/qdrant (9974), github.com/uutils/coreutils (5669), github.com/rust-analyzer/rust-analyzer (4542), github.com/dandavison/delta (3309), github.com/alacritty/alacritty (3303), github.com/denoland/deno (3276), github.com/sharkdp/bat (3044), github.com/niri-wm/niri (1900) … +14 仓 |
| `go-test-progress-noise` | 14972 | github.com/golangci/golangci-lint (12928), github.com/gohugoio/hugo (1300), github.com/spf13/viper (245), github.com/moby/moby (189), github.com/evanw/esbuild (85), github.com/mvdan/sh (83), github.com/microsoft/TypeScript (67), github.com/caddyserver/caddy (32) … +2 仓 |
| `node-test-pass-noise` | 13609 | github.com/withastro/astro (6862), github.com/Alamofire/Alamofire (2486), github.com/hadolint/hadolint (1584), github.com/commercialhaskell/stack (1558), github.com/stylelint/stylelint (1084), github.com/rollup/rollup (27), github.com/pandas-dev/pandas (6), github.com/eslint/eslint (2) |
| `ghc-module-progress-noise` | 11687 | github.com/commercialhaskell/stack (4994), github.com/haskell/haskell-language-server (3127), github.com/haskell/cabal (1601), github.com/hadolint/hadolint (954), github.com/jgm/pandoc (950), github.com/koalaman/shellcheck (61) |
| `ninja-progress-noise` | 11563 | github.com/neovim/neovim (3619), github.com/opencv/opencv (3362), github.com/libuv/libuv (1453), github.com/nlohmann/json (684), github.com/swiftlang/swift-format (620), github.com/duckdb/duckdb (518), github.com/swiftlang/swift-syntax (415), github.com/vapor/vapor (311) … +8 仓 |
| `cmake-build-progress-noise` | 8502 | github.com/bitcoin/bitcoin (4686), github.com/libuv/libuv (1457), github.com/nlohmann/json (740), github.com/opencv/opencv (726), github.com/luarocks/luarocks (413), github.com/google/benchmark (195), github.com/fmtlib/fmt (170), github.com/catchorg/Catch2 (115) |
| `go-download-noise` | 6976 | github.com/aquasecurity/trivy (3564), github.com/golangci/golangci-lint (1201), github.com/gohugoio/hugo (516), github.com/grafana/loki (506), github.com/cli/cli (451), github.com/trufflesecurity/trufflehog (255), github.com/etcd-io/etcd (97), github.com/mvdan/sh (87) … +9 仓 |
| `make-directory-noise` | 4662 | github.com/erlang/otp (3254), github.com/nlohmann/json (688), github.com/redis/redis (352), github.com/opencv/opencv (144), github.com/curl/curl (78), github.com/luarocks/luarocks (64), github.com/openssl/openssl (54), github.com/libuv/libuv (12) … +4 仓 |
| `pip-install-progress-noise` | 4552 | github.com/tailwindlabs/tailwindcss (721), github.com/psf/black (634), github.com/django/django (441), github.com/fastapi/fastapi (432), github.com/libuv/libuv (269), github.com/mitmproxy/mitmproxy (223), github.com/square/okhttp (199), github.com/pydantic/pydantic (168) … +83 仓 |
| `maven-download-progress-noise` | 3161 | github.com/google/guava (3161) |
| `playwright-assert-failed` | 2313 | github.com/anomalyco/opencode (1567), github.com/microsoft/playwright (675), github.com/prettier/prettier (54), github.com/withastro/astro (11), github.com/vercel/next.js (6) |
| `github-actions-error-annotation` | 2225 | github.com/cli/cli (602), github.com/protocolbuffers/protobuf (253), github.com/golangci/golangci-lint (58), github.com/jekyll/jekyll (49), github.com/AvaloniaUI/Avalonia (43), github.com/grafana/loki (35), github.com/trufflesecurity/trufflehog (35), github.com/openai/openai-python (24) … +114 仓 |
| `playwright-progress-noise` | 2094 | github.com/anomalyco/opencode (2094) |
| `github-actions-runner-version-info` | 1353 | github.com/anomalyco/opencode (19), github.com/niri-wm/niri (19), github.com/nix-community/home-manager (19), github.com/Alamofire/Alamofire (11), github.com/AvaloniaUI/Avalonia (11), github.com/BurntSushi/ripgrep (11), github.com/ClickHouse/ClickHouse (11), github.com/DavidAnson/markdownlint (11) … +119 仓 |
| `vitest-pass-noise` | 1337 | github.com/tailwindlabs/tailwindcss (651), github.com/vitejs/vite (633), github.com/honojs/hono (45), github.com/withastro/astro (8) |
| `maven-test-progress-noise` | 1304 | github.com/google/guava (1304) |
| `go-test-pkg-fail` | 989 | github.com/trufflesecurity/trufflehog (951), github.com/grafana/loki (18), github.com/gohugoio/hugo (7), github.com/mvdan/sh (5), github.com/aquasecurity/trivy (2), github.com/evanw/esbuild (2), github.com/golangci/golangci-lint (2), github.com/moby/moby (1) … +1 仓 |
| `playwright-failed-test-header` | 977 | github.com/microsoft/playwright (775), github.com/anomalyco/opencode (198), github.com/withastro/astro (4) |
| `swiftc-compile-error` | 943 | github.com/Alamofire/Alamofire (937), github.com/swiftlang/swift-syntax (6) |
| `rust-test-panic` | 378 | github.com/BurntSushi/ripgrep (328), github.com/dandavison/delta (30), github.com/sharkdp/fd (5), github.com/sharkdp/bat (4), github.com/serde-rs/serde (3), github.com/uutils/coreutils (3), github.com/niri-wm/niri (2), github.com/starship/starship (2) … +1 仓 |
| `rust-libtest-failed` | 352 | github.com/BurntSushi/ripgrep (328), github.com/sharkdp/fd (5), github.com/dandavison/delta (4), github.com/sharkdp/bat (4), github.com/serde-rs/serde (3), github.com/uutils/coreutils (3), github.com/rust-analyzer/rust-analyzer (2), github.com/starship/starship (2) … +1 仓 |
| `pytest-progress-noise` | 156 | github.com/fastapi/fastapi (63), github.com/grafana/loki (24), github.com/duckdb/duckdb (17), github.com/erlang/otp (16), github.com/psf/black (12), github.com/phoenixframework/phoenix (10), github.com/elixir-lang/elixir (7), github.com/pydantic/pydantic (3) … +4 仓 |
| `vitest-test-fail` | 144 | github.com/sveltejs/svelte (113), github.com/vitejs/vite (17), github.com/tailwindlabs/tailwindcss (10), github.com/honojs/hono (4) |
| `csc-diagnostic-error` | 128 | github.com/AvaloniaUI/Avalonia (128) |
| `make-target-error` | 107 | github.com/redis/redis (26), github.com/openssl/openssl (24), github.com/erlang/otp (13), github.com/fmtlib/fmt (8), github.com/duckdb/duckdb (6), github.com/luarocks/luarocks (6), github.com/grafana/loki (5), github.com/golangci/golangci-lint (4) … +7 仓 |
| `kotlinc-compile-error` | 102 | github.com/detekt/detekt (72), github.com/square/okhttp (16), github.com/spring-projects/spring-framework (14) |
| `ld-linker-error` | 89 | github.com/haskell/cabal (42), github.com/commercialhaskell/stack (26), github.com/redis/redis (6), github.com/libuv/libuv (5), github.com/puma/puma (5), github.com/jgm/pandoc (4), github.com/bitcoin/bitcoin (1) |
| `go-mod-fetch-error` | 76 | github.com/cli/cli (75), github.com/aquasecurity/trivy (1) |
| `ninja-failed` | 70 | github.com/curl/curl (59), github.com/neovim/neovim (7), github.com/protocolbuffers/protobuf (2), github.com/fmtlib/fmt (1), github.com/google/benchmark (1) |
| `ninja-build-stopped` | 69 | github.com/curl/curl (59), github.com/neovim/neovim (7), github.com/ClickHouse/ClickHouse (1), github.com/fmtlib/fmt (1), github.com/google/benchmark (1) |
| `python-traceback-uncaught-exception` | 62 | github.com/composer/composer (30), github.com/openai/openai-python (8), github.com/ant-design/ant-design (4), github.com/opencv/opencv (4), github.com/nix-community/home-manager (3), github.com/django/django (2), github.com/eslint/eslint (2), github.com/psf/black (2) … +7 仓 |
| `gcc-clang-diagnostic-error` | 56 | github.com/bitcoin/bitcoin (20), github.com/duckdb/duckdb (7), github.com/protocolbuffers/protobuf (7), github.com/fmtlib/fmt (5), github.com/hadolint/hadolint (4), github.com/redis/redis (4), github.com/zigtools/zls (4), github.com/haskell/cabal (3) … +2 仓 |
| `jest-test-fail` | 56 | github.com/prettier/prettier (32), github.com/phoenixframework/phoenix (14), github.com/vercel/next.js (6), github.com/stylelint/stylelint (4) |
| `jest-run-summary` | 44 | github.com/prettier/prettier (24), github.com/vercel/next.js (12), github.com/phoenixframework/phoenix (4), github.com/stylelint/stylelint (4) |
| `pnpm-elifecycle-exit` | 43 | github.com/withastro/astro (13), github.com/sveltejs/svelte (8), github.com/vitejs/vite (8), github.com/tailwindlabs/tailwindcss (6), github.com/honojs/hono (4), github.com/vercel/next.js (3), github.com/eslint/eslint (1) |
| `gradle-build-failed` | 41 | github.com/diffplug/spotless (8), github.com/square/okhttp (8), github.com/gradle/gradle (7), github.com/spring-projects/spring-framework (7), github.com/mockito/mockito (4), github.com/spring-projects/spring-boot (4), github.com/detekt/detekt (3) |
| `gradle-task-failed` | 41 | github.com/detekt/detekt (16), github.com/square/okhttp (8), github.com/spring-projects/spring-framework (7), github.com/diffplug/spotless (4), github.com/spring-projects/spring-boot (4), github.com/mockito/mockito (2) |
| `rustc-error-tree` | 41 | github.com/serde-rs/serde (26), github.com/alacritty/alacritty (8), github.com/rust-analyzer/rust-analyzer (6), github.com/sharkdp/fd (1) |
| `gradle-test-case-failed` | 39 | github.com/square/okhttp (21), github.com/diffplug/spotless (9), github.com/spring-projects/spring-framework (8), github.com/spring-projects/spring-boot (1) |
| `swift-build-error` | 39 | github.com/vapor/vapor (36), github.com/Alamofire/Alamofire (1), github.com/swiftlang/swift-format (1), github.com/swiftlang/swift-syntax (1) |
| `nix-build-failed` | 37 | github.com/LnL7/nix-darwin (37) |
| `vitest-run-summary` | 33 | github.com/vitejs/vite (16), github.com/sveltejs/svelte (10), github.com/tailwindlabs/tailwindcss (5), github.com/honojs/hono (2) |
| `tap-test-failed` | 31 | github.com/nix-community/nix-direnv (13), github.com/libuv/libuv (10), github.com/openssl/openssl (8) |
| `pytest-failures-section` | 28 | github.com/pandas-dev/pandas (9), github.com/pytest-dev/pytest (7), github.com/psf/black (4), github.com/semgrep/semgrep (3), github.com/curl/curl (2), github.com/fastapi/fastapi (1), github.com/mitmproxy/mitmproxy (1), github.com/qdrant/qdrant (1) |
| `cargo-could-not-compile` | 25 | github.com/alacritty/alacritty (9), github.com/rust-analyzer/rust-analyzer (4), github.com/serde-rs/serde (4), github.com/sharkdp/fd (3), github.com/oven-sh/bun (2), github.com/tokio-rs/tokio (2), github.com/dandavison/delta (1) |
| `golangci-lint-config-invalid` | 24 | github.com/caddyserver/caddy (24) |
| `nix-deprecation-warning` | 24 | github.com/LnL7/nix-darwin (24) |
| `ctest-test-failed` | 23 | github.com/nlohmann/json (18), github.com/libuv/libuv (3), github.com/bitcoin/bitcoin (2) |
| `gcc-clang-driver-error` | 23 | github.com/commercialhaskell/stack (6), github.com/redis/redis (6), github.com/haskell/haskell-language-server (4), github.com/jgm/pandoc (4), github.com/bitcoin/bitcoin (1), github.com/fmtlib/fmt (1), github.com/google/benchmark (1) |
| `nix-drv-list-noise` | 23 | github.com/nix-community/home-manager (10), github.com/LnL7/nix-darwin (6), github.com/nix-community/nix-direnv (5), github.com/grafana/loki (1), github.com/jgm/pandoc (1) |
| `dependabot-update-errors` | 20 | github.com/helm/helm (6), github.com/pydantic/pydantic (4), github.com/cli/cli (3), github.com/fastapi/fastapi (3), github.com/pytest-dev/pytest (2), github.com/DavidAnson/markdownlint (1), github.com/gradle/gradle (1) |
| `phpstan-error-table` | 19 | github.com/phpstan/phpstan (15), github.com/composer/composer (4) |
| `go-test-fail` | 18 | github.com/mvdan/sh (7), github.com/gohugoio/hugo (4), github.com/golangci/golangci-lint (3), github.com/evanw/esbuild (2), github.com/aquasecurity/trivy (1), github.com/spf13/viper (1) |
| `node-test-fail` | 17 | github.com/stylelint/stylelint (10), github.com/withastro/astro (7) |
| `ghc-gcc-phase-failure` | 16 | github.com/jgm/pandoc (10), github.com/commercialhaskell/stack (6) |
| `stack-structured-error` | 16 | github.com/commercialhaskell/stack (8), github.com/jgm/pandoc (6), github.com/haskell/haskell-language-server (2) |
| `cabal-structured-error` | 15 | github.com/hadolint/hadolint (5), github.com/haskell/cabal (5), github.com/haskell/haskell-language-server (2), github.com/koalaman/shellcheck (2), github.com/jgm/pandoc (1) |
| `gradle-test-summary-failed` | 14 | github.com/square/okhttp (7), github.com/spring-projects/spring-framework (4), github.com/diffplug/spotless (1), github.com/mockito/mockito (1), github.com/spring-projects/spring-boot (1) |
| `eslint-stylish-offense` | 13 | github.com/DavidAnson/markdownlint (10), github.com/rollup/rollup (3) |
| `minitest-failure-report` | 13 | github.com/puma/puma (13) |
| `cocoon-wait-for-tests-failed` | 12 | github.com/flutter/flutter (12) |
| `node-uncaught-exception` | 12 | github.com/ant-design/ant-design (4), github.com/nix-community/home-manager (3), github.com/eslint/eslint (2), github.com/microsoft/playwright (1), github.com/sveltejs/svelte (1), github.com/withastro/astro (1) |
| `exunit-failure-entry` | 11 | github.com/phoenixframework/phoenix (10), github.com/elixir-lang/elixir (1) |
| `git-fetch-ref-not-found` | 11 | github.com/catchorg/Catch2 (11) |
| `plenary-test-fail` | 11 | github.com/nvim-telescope/telescope.nvim (11) |
| `pytest-test-failed` | 11 | github.com/psf/black (6), github.com/fastapi/fastapi (2), github.com/semgrep/semgrep (2), github.com/qdrant/qdrant (1) |
| `rspec-rerun-command` | 11 | github.com/fastlane/fastlane (6), github.com/rubocop/rubocop (5) |
| `phpunit-failed-asserting` | 10 | github.com/sebastianbergmann/phpunit (5), github.com/composer/composer (2), github.com/laravel/framework (2), github.com/symfony/symfony (1) |
| `swift-testing-test-failed` | 10 | github.com/vapor/vapor (10) |
| `bun-script-exit-fail` | 9 | github.com/anomalyco/opencode (7), github.com/oven-sh/bun (2) |
| `golangci-lint-issues-summary` | 9 | github.com/golangci/golangci-lint (4), github.com/helm/helm (2), github.com/aquasecurity/trivy (1), github.com/grafana/loki (1), github.com/microsoft/TypeScript (1) |
| `msvc-compiler-error` | 9 | github.com/luarocks/luarocks (6), github.com/nlohmann/json (2), github.com/fmtlib/fmt (1) |
| `turbo-run-failed` | 9 | github.com/withastro/astro (6), github.com/tailwindlabs/tailwindcss (3) |
| `bazel-error` | 8 | github.com/protocolbuffers/protobuf (8) |
| `pnpm-error-tree` | 8 | github.com/vuejs/core (8) |
| `praktika-job-fail` | 8 | github.com/ClickHouse/ClickHouse (8) |
| `praktika-run-failed` | 8 | github.com/ClickHouse/ClickHouse (8) |
| `rspec-failure-error` | 8 | github.com/rubocop/rubocop (8) |
| `trivy-vuln-found` | 8 | github.com/gin-gonic/gin (8) |
| `bun-error-json` | 7 | github.com/anomalyco/opencode (7) |
| `copilot-cli-error` | 7 | github.com/dotnet/aspnetcore (5), github.com/dotnet/runtime (2) |
| `ctest-tests-failed-list` | 7 | github.com/nlohmann/json (3), github.com/bitcoin/bitcoin (2), github.com/libuv/libuv (2) |
| `cmake-configure-error` | 6 | github.com/swiftlang/swift-format (6) |
| `fastlane-finished-with-errors` | 6 | github.com/fastlane/fastlane (6) |
| `busted-htest-error-entry` | 5 | github.com/luarocks/luarocks (5) |
| `busted-htest-failed-test-entry` | 5 | github.com/luarocks/luarocks (5) |
| `busted-htest-failure-banner` | 5 | github.com/luarocks/luarocks (5) |
| `fastlane-exit-status` | 5 | github.com/fastlane/fastlane (5) |
| `forgejo-actions-job-failed` | 5 | github.com/haskell/cabal (3), github.com/moby/moby (2) |
| `github-actions-checkout-ref-mismatch` | 5 | github.com/catchorg/Catch2 (5) |
| `go-compile-error` | 5 | github.com/golangci/golangci-lint (2), github.com/aquasecurity/trivy (1), github.com/gohugoio/hugo (1), github.com/grafana/loki (1) |
| `go-toolchain-mismatch` | 5 | github.com/grafana/loki (3), github.com/trufflesecurity/trufflehog (2) |
| `msbuild-build-failed` | 5 | github.com/AvaloniaUI/Avalonia (4), github.com/bitcoin/bitcoin (1) |
| `phpstan-found-errors` | 5 | github.com/phpstan/phpstan (3), github.com/composer/composer (2) |
| `python-logging-critical-message` | 5 | github.com/phpstan/phpstan (5) |
| `wait-on-check-never-run` | 5 | github.com/flutter/packages (5) |
| `webpack-hook-error` | 5 | github.com/DavidAnson/markdownlint (5) |
| `exunit-failed-summary` | 4 | github.com/phoenixframework/phoenix (3), github.com/elixir-lang/elixir (1) |
| `flutter-bots-command-failed` | 4 | github.com/flutter/flutter (4) |
| `minitest-run-summary` | 4 | github.com/puma/puma (4) |
| `nixfmt-fail-on-change` | 4 | github.com/nix-community/home-manager (4) |
| `nvim-test-assertion-detail` | 4 | github.com/neovim/neovim (4) |
| `nvim-test-failure-list-entry` | 4 | github.com/neovim/neovim (4) |
| `phpunit-failures-banner` | 4 | github.com/laravel/framework (4) |
| `treefmt-fail-on-change` | 4 | github.com/nix-community/home-manager (4) |
| `zig-compile-error` | 4 | github.com/zigtools/zls (4) |
| `clang-format-lint-diff` | 3 | github.com/google/benchmark (3) |
| `eslint-stylish-summary` | 3 | github.com/DavidAnson/markdownlint (2), github.com/rollup/rollup (1) |
| `gotestsum-run-summary` | 3 | github.com/microsoft/TypeScript (1), github.com/moby/moby (1), github.com/trufflesecurity/trufflehog (1) |
| `maven-goal-failed` | 3 | github.com/google/guava (3) |
| `maven-wrapper-main-missing` | 3 | github.com/google/guava (3) |
| `nix-eval-error-tree` | 3 | github.com/nix-community/home-manager (3) |
| `python-unittest-fail` | 3 | github.com/django/django (3) |
| `tsc-diagnostic` | 3 | github.com/microsoft/TypeScript (2), github.com/honojs/hono (1) |
| `verify-pr-title-invalid` | 3 | github.com/denoland/deno (3) |
| `wait-on-check-conclusion-not-allowed` | 3 | github.com/flutter/packages (3) |
| `zig-build-command-failed` | 3 | github.com/zigtools/zls (2), github.com/neovim/neovim (1) |
| `bun-test-fail` | 2 | github.com/oven-sh/bun (2) |
| `cargo-msrv-unsupported` | 2 | github.com/niri-wm/niri (2) |
| `emmylua-diagnostic` | 2 | github.com/neovim/neovim (2) |
| `escript-exception` | 2 | github.com/erlang/otp (2) |
| `git-push-auth-failed` | 2 | github.com/denoland/deno (1), github.com/opencv/opencv (1) |
| `git-push-rejected` | 2 | github.com/nix-community/home-manager (2) |
| `javac-compile-error` | 2 | github.com/diffplug/spotless (2) |
| `oxlint-found-errors` | 2 | github.com/honojs/hono (1), github.com/oven-sh/bun (1) |
| `plenary-tests-failed` | 2 | github.com/nvim-telescope/telescope.nvim (2) |
| `prettier-check-drift` | 2 | github.com/sveltejs/svelte (2) |
| `semgrep-findings` | 2 | github.com/semgrep/semgrep (1), github.com/withastro/astro (1) |
| `xctest-assert-failed` | 2 | github.com/vapor/vapor (2) |
| `xctest-test-case-failed` | 2 | github.com/vapor/vapor (2) |
| `github-actions-raw-error-command` | 1 | github.com/nvim-telescope/telescope.nvim (1) |
| `lintcommit-invalid-message` | 1 | github.com/neovim/neovim (1) |
| `mocha-test-fail` | 1 | github.com/eslint/eslint (1) |
| `mypy-found-errors` | 1 | github.com/pallets/flask (1) |
| `mypy-type-error` | 1 | github.com/pallets/flask (1) |
| `nvim-test-run-fail` | 1 | github.com/neovim/neovim (1) |
| `cargo-version-conflict` | 0 |  |
| `checkstyle-error` | 0 |  |
| `codeowners-validator-checks-failed` | 0 |  |
| `curl-runtests-testfail` | 0 |  |
| `eslint-offense-line` | 0 |  |
| `forgejo-actions-poll-noise` | 0 |  |
| `forgejo-actions-runner-version-info` | 0 |  |
| `gitleaks-leaks-found` | 0 |  |
| `just-recipe-fail` | 0 |  |
| `maven-surefire-failures-summary` | 0 |  |
| `maven-surefire-test-failed` | 0 |  |
| `nim-segv` | 0 |  |
| `nix-fetch-input-noise` | 0 |  |
| `nix-option-conflict` | 0 |  |
| `pip-install-error` | 0 |  |
| `pyright-error-summary` | 0 |  |
| `pyright-type-error` | 0 |  |
| `redis-server-bugreport` | 0 |  |
| `redis-test-err` | 0 |  |
| `redis-test-exception` | 0 |  |
| `scorecard-action-error` | 0 |  |
| `size-limit-exceeded` | 0 |  |
| `systemd-ci-unit-fail` | 0 |  |
| `trivy-misconf-failures` | 0 |  |
| `trufflehog-secret-found` | 0 |  |
| `trufflehog-unverified-secret` | 0 |  |

零命中规则 (26 条, dead_rules 候选 — 语料未覆盖的工具或正则失效):
- `cargo-version-conflict`
- `checkstyle-error`
- `codeowners-validator-checks-failed`
- `curl-runtests-testfail`
- `eslint-offense-line`
- `forgejo-actions-poll-noise`
- `forgejo-actions-runner-version-info`
- `gitleaks-leaks-found`
- `just-recipe-fail`
- `maven-surefire-failures-summary`
- `maven-surefire-test-failed`
- `nim-segv`
- `nix-fetch-input-noise`
- `nix-option-conflict`
- `pip-install-error`
- `pyright-error-summary`
- `pyright-type-error`
- `redis-server-bugreport`
- `redis-test-err`
- `redis-test-exception`
- `scorecard-action-error`
- `size-limit-exceeded`
- `systemd-ci-unit-fail`
- `trivy-misconf-failures`
- `trufflehog-secret-found`
- `trufflehog-unverified-secret`

总命中口径 = signal fragment ∪ noise 剔除区块, 全样本域 (liveness)。
</details>
