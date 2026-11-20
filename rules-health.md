# 规则健康档案 (每轮 sweep 自动刷新)

- 诊断覆盖率: **993/1136 = 87.41%** — 含 ≥1 诊断规则失败块的失败族样本占比
- 分级: trivial (原 restating) 1 / diagnostic 184 / boundary 6 (共 191 条触发规则; 死规则见 job summary)

## 怎么读

- **a / b**: 失败族 / 成功样本命中数 (样本级)
- **PPV (lo95)**: P(失败|触发) 及 Wilson 95% 下界 — 触发推出失败的可靠度; b=0 时 PPV=1.0, 下界随样本量增长
- **lift**: PPV / 失败基率 — 与结论的相关性 (1.0 = 独立; info 常数规则应 ≈1.0)
- **spec**: -log2(a/N_f) 比特 — 触发携带的样本信息量 (选择性; 0 = 处处触发零信息)
- **分级**: trivial (原 restating) = 触发由结论决定 (安全网, 不计覆盖); diagnostic = 内容决定 (计覆盖); boundary = 断裂带/异常 (人工审, 暂计覆盖)

## 全规则健康表 (spec 降序)

| 规则 | intent | a | b | PPV (lo95) | lift | spec | 分级 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [`bazel-loading-phase-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bazel/bazel-loading-phase-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`bitcoin-lint-check-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bitcoin/bitcoin-lint-check-failure.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`busted-htest-error-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-error-entry.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`cabal-update-unexpected-response`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cabal/cabal-update-unexpected-response.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`cargo-publish-prepare-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-publish-prepare-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`check-spelling-unrecognized-words`](https://github.com/luochen1990/log-skimmer-rules/blob/master/check-spelling/check-spelling-unrecognized-words.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`copilot-harness-model-alias-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-harness-model-alias-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`deno-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/deno/deno-test-failed.yaml) | failure | 1 | 2 | 0.333 (0.061) | 0.464 | 10.15b | diagnostic |
| [`dotnet-unhandled-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/dotnet/dotnet-unhandled-exception.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`duckdb-plan-cost-regression`](https://github.com/luochen1990/log-skimmer-rules/blob/master/duckdb/duckdb-plan-cost-regression.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`duckdb-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/duckdb/duckdb-test-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`eslint-offense-line`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-offense-line.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`eslint-stylish-offense`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-stylish-offense.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`git-am-apply-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-am-apply-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`git-push-auth-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-push-auth-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`grafana-backport-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/grafana-backport/grafana-backport-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`just-recipe-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/just/just-recipe-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`mix-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mix/mix-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`nix-activation-conflict`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-activation-conflict.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`node-test-snapshot-assert-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node-test/node-test-snapshot-assert-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`npm-network-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm/npm-network-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`oxlint-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/oxlint/oxlint-found-errors.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`phpstan-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpstan/phpstan-found-errors.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`pyright-error-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pyright/pyright-error-summary.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`pyright-type-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pyright/pyright-type-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`pyspelling-check-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pyspelling/pyspelling-check-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`rust-io-no-such-file`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-io-no-such-file.yaml) | failure | 1 | 1 | 0.5 (0.095) | 0.696 | 10.15b | diagnostic |
| [`rustc-doc-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustc/rustc-doc-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`stack-hackage-verification-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/stack/stack-hackage-verification-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`swift-fatal-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-fatal-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`typos-correction-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/typos/typos-correction-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`wait-on-check-never-run`](https://github.com/luochen1990/log-skimmer-rules/blob/master/wait-on-check/wait-on-check-never-run.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`winget-releaser-token-invalid`](https://github.com/luochen1990/log-skimmer-rules/blob/master/winget/winget-releaser-token-invalid.yaml) | failure | 1 | 0 | 1 (0.207) | 1.393 | 10.15b | diagnostic |
| [`busted-htest-failed-test-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-failed-test-entry.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`cargo-build-script-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-build-script-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`cargo-deny-lint-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo-deny/cargo-deny-lint-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`cargo-llvm-cov-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-llvm-cov-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`csc-diagnostic-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/csc/csc-diagnostic-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`eslint-stylish-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-stylish-summary.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`git-fetch-ref-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-fetch-ref-not-found.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`github-actions-cache-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-cache-not-found.yaml) | failure | 2 | 1 | 0.667 (0.208) | 0.928 | 9.15b | diagnostic |
| [`go-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-compile-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`ld-so-glibc-version-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld-so/ld-so-glibc-version-not-found.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`node-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node-test/node-test-fail.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`npm-audit-unresolved`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm/npm-audit-unresolved.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`nvim-test-run-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-run-fail.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`phpstan-error-table`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpstan/phpstan-error-table.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`phpunit-compact-error-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-compact-error-entry.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`python-unittest-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-unittest/python-unittest-fail.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`shell-bash-unbound-variable`](https://github.com/luochen1990/log-skimmer-rules/blob/master/shell/shell-bash-unbound-variable.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`sphinx-build-problems`](https://github.com/luochen1990/log-skimmer-rules/blob/master/sphinx/sphinx-build-problems.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`tap-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tap/tap-test-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`verify-pr-title-invalid`](https://github.com/luochen1990/log-skimmer-rules/blob/master/verify-pr-title/verify-pr-title-invalid.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`wait-on-check-conclusion-not-allowed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/wait-on-check/wait-on-check-conclusion-not-allowed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`zig-build-command-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-build-command-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`zizmor-audit-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zizmor/zizmor-audit-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.393 | 9.15b | diagnostic |
| [`busted-htest-failure-banner`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-failure-banner.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`clang-format-lint-diff`](https://github.com/luochen1990/log-skimmer-rules/blob/master/clang-format/clang-format-lint-diff.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`codeql-action-job-status-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/codeql-action/codeql-action-job-status-failure.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`copilot-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-cli-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`copilot-review-worker-verification-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-review-worker-verification-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`git-push-rejected`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-push-rejected.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`linkinator-broken-links`](https://github.com/luochen1990/log-skimmer-rules/blob/master/linkinator/linkinator-broken-links.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`minitest-failure-report`](https://github.com/luochen1990/log-skimmer-rules/blob/master/minitest/minitest-failure-report.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`minitest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/minitest/minitest-run-summary.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`mypy-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mypy/mypy-found-errors.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`mypy-type-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mypy/mypy-type-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`node-test-fail-plain`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node-test/node-test-fail-plain.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`nvim-test-assertion-detail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-assertion-detail.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`playwright-no-report-files`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-no-report-files.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`pnpm-error-code-bracketed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-error-code-bracketed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`prettier-check-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/prettier/prettier-check-drift.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`swift-tools-version-mismatch`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-tools-version-mismatch.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`xctest-assert-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/xctest/xctest-assert-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.393 | 8.56b | diagnostic |
| [`cargo-nextest-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-nextest-run-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`commit-lint-violation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/commit-lint/commit-lint-violation.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`ctest-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ctest/ctest-test-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`deno-fmt-not-formatted`](https://github.com/luochen1990/log-skimmer-rules/blob/master/deno/deno-fmt-not-formatted.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`eslint-ecosystem-plugin-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-ecosystem-plugin-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`gotestsum-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gotestsum/gotestsum-run-summary.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`hawk-finding-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/hawk/hawk-finding-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`kotlinc-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/kotlinc/kotlinc-compile-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`mage-drift-gate-echo`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mage/mage-drift-gate-echo.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`msbuild-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/msbuild/msbuild-build-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`msvc-compiler-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/msvc/msvc-compiler-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`muffet-link-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/muffet/muffet-link-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`nix-deprecation-warning`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-deprecation-warning.yaml) | warning | 4 | 1 | 0.8 (0.376) | 1.114 | 8.15b | diagnostic |
| [`node-command-failed-exit`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-command-failed-exit.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`node-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-uncaught-exception.yaml) | failure | 4 | 2 | 0.667 (0.3) | 0.928 | 8.15b | diagnostic |
| [`pip-build-metadata-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pip/pip-build-metadata-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`tar-unrecoverable-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tar/tar-unrecoverable-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`xctest-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/xctest/xctest-test-case-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.393 | 8.15b | diagnostic |
| [`apt-fetch-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/apt/apt-fetch-failed.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`apt-package-unavailable`](https://github.com/luochen1990/log-skimmer-rules/blob/master/apt/apt-package-unavailable.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`cmake-dev-warning-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cmake/cmake-dev-warning-error.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`ctest-tests-failed-list`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ctest/ctest-tests-failed-list.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`exunit-failed-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/exunit/exunit-failed-summary.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`exunit-failure-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/exunit/exunit-failure-entry.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`ghc-gcc-phase-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ghc/ghc-gcc-phase-failure.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`maven-wrapper-main-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-wrapper-main-missing.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`nix-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-build-failed.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`npm-run-all-failed-tasks`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm-run-all/npm-run-all-failed-tasks.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`pnpm-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-error-tree.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`redis-test-err`](https://github.com/luochen1990/log-skimmer-rules/blob/master/redis-test/redis-test-err.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`rsync-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rsync/rsync-error.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`rubocop-self-lint-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rubocop/rubocop-self-lint-failed.yaml) | failure | 5 | 0 | 1 (0.566) | 1.393 | 7.83b | diagnostic |
| [`bazel-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bazel/bazel-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`bun-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bun/bun-test-fail.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`cocoon-wait-for-tests-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cocoon/cocoon-wait-for-tests-failed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`credo-result-diff-issue`](https://github.com/luochen1990/log-skimmer-rules/blob/master/credo/credo-result-diff-issue.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`gh-api-integration-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-api-integration-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`gh-graphql-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-graphql-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`nix-eval-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-eval-error-tree.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`phpunit-failed-asserting`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-failed-asserting.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`phpunit-failure-list-header`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-failure-list-header.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`playwright-failed-test-header`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-failed-test-header.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`pytest-conftest-import-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-conftest-import-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`swift-benchmark-regression`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-benchmark-regression.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`zig-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-compile-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.393 | 7.56b | diagnostic |
| [`cmake-configure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cmake/cmake-configure-error.yaml) | failure | 7 | 0 | 1 (0.646) | 1.393 | 7.34b | diagnostic |
| [`curl-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/curl/curl-cli-error.yaml) | failure | 7 | 2 | 0.778 (0.453) | 1.083 | 7.34b | diagnostic |
| [`gh-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-cli-error.yaml) | failure | 7 | 0 | 1 (0.646) | 1.393 | 7.34b | diagnostic |
| [`go-http-request-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-http-request-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.393 | 7.34b | diagnostic |
| [`nvim-test-failure-list-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-failure-list-entry.yaml) | failure | 7 | 0 | 1 (0.646) | 1.393 | 7.34b | diagnostic |
| [`praktika-job-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/praktika/praktika-job-fail.yaml) | failure | 7 | 0 | 1 (0.646) | 1.393 | 7.34b | diagnostic |
| [`praktika-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/praktika/praktika-run-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.393 | 7.34b | diagnostic |
| [`rustfmt-diff-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustfmt/rustfmt-diff-drift.yaml) | failure | 7 | 0 | 1 (0.646) | 1.393 | 7.34b | diagnostic |
| [`shell-command-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/shell/shell-command-not-found.yaml) | failure | 7 | 1 | 0.875 (0.529) | 1.219 | 7.34b | diagnostic |
| [`stack-structured-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/stack/stack-structured-error.yaml) | failure | 7 | 0 | 1 (0.646) | 1.393 | 7.34b | diagnostic |
| [`zig-build-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-build-summary-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.393 | 7.34b | diagnostic |
| [`actionlint-generate-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/actionlint/actionlint-generate-drift.yaml) | failure | 8 | 0 | 1 (0.676) | 1.393 | 7.15b | diagnostic |
| [`bun-script-exit-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bun/bun-script-exit-fail.yaml) | failure | 8 | 0 | 1 (0.676) | 1.393 | 7.15b | diagnostic |
| [`cabal-structured-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cabal/cabal-structured-error.yaml) | failure | 8 | 0 | 1 (0.676) | 1.393 | 7.15b | diagnostic |
| [`docker-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/docker/docker-build-failed.yaml) | failure | 8 | 0 | 1 (0.676) | 1.393 | 7.15b | diagnostic |
| [`ghc-source-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ghc/ghc-source-error.yaml) | failure | 8 | 0 | 1 (0.676) | 1.393 | 7.15b | diagnostic |
| [`nixfmt-fail-on-change`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nixfmt/nixfmt-fail-on-change.yaml) | failure | 8 | 0 | 1 (0.676) | 1.393 | 7.15b | diagnostic |
| [`npm-run-all-task-exit-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm-run-all/npm-run-all-task-exit-error.yaml) | failure | 8 | 0 | 1 (0.676) | 1.393 | 7.15b | diagnostic |
| [`rspec-failure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-failure-error.yaml) | failure | 8 | 1 | 0.889 (0.565) | 1.238 | 7.15b | diagnostic |
| [`semgrep-scan-start-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-scan-start-failed.yaml) | failure | 8 | 0 | 1 (0.676) | 1.393 | 7.15b | diagnostic |
| [`treefmt-fail-on-change`](https://github.com/luochen1990/log-skimmer-rules/blob/master/treefmt/treefmt-fail-on-change.yaml) | failure | 8 | 0 | 1 (0.676) | 1.393 | 7.15b | diagnostic |
| [`trivy-vuln-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-vuln-found.yaml) | failure | 8 | 0 | 1 (0.676) | 1.393 | 7.15b | diagnostic |
| [`rspec-rerun-command`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-rerun-command.yaml) | failure | 9 | 0 | 1 (0.701) | 1.393 | 6.98b | diagnostic |
| [`turbo-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/turbo/turbo-run-failed.yaml) | failure | 9 | 0 | 1 (0.701) | 1.393 | 6.98b | diagnostic |
| [`apt-unable-to-locate-package`](https://github.com/luochen1990/log-skimmer-rules/blob/master/apt/apt-unable-to-locate-package.yaml) | failure | 10 | 0 | 1 (0.722) | 1.393 | 6.83b | diagnostic |
| [`bazel-test-target-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bazel/bazel-test-target-failed.yaml) | failure | 10 | 0 | 1 (0.722) | 1.393 | 6.83b | diagnostic |
| [`cargo-msrv-unsupported`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-msrv-unsupported.yaml) | failure | 10 | 0 | 1 (0.722) | 1.393 | 6.83b | diagnostic |
| [`git-ssh-remote-read-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-ssh-remote-read-failed.yaml) | failure | 10 | 0 | 1 (0.722) | 1.393 | 6.83b | diagnostic |
| [`golangci-lint-issues-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/golangci-lint/golangci-lint-issues-summary.yaml) | failure | 11 | 0 | 1 (0.741) | 1.393 | 6.69b | diagnostic |
| [`javac-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/javac/javac-compile-error.yaml) | failure | 11 | 0 | 1 (0.741) | 1.393 | 6.69b | diagnostic |
| [`ld-linker-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld/ld-linker-error.yaml) | failure | 11 | 4 | 0.733 (0.48) | 1.021 | 6.69b | diagnostic |
| [`playwright-assert-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-assert-failed.yaml) | failure | 11 | 1 | 0.917 (0.646) | 1.277 | 6.69b | diagnostic |
| [`tsc-diagnostic`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tsc/tsc-diagnostic.yaml) | failure | 11 | 0 | 1 (0.741) | 1.393 | 6.69b | diagnostic |
| [`jest-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-test-fail.yaml) | failure | 12 | 1 | 0.923 (0.667) | 1.286 | 6.56b | diagnostic |
| [`fileutils-cannot-access`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fileutils/fileutils-cannot-access.yaml) | failure | 13 | 0 | 1 (0.772) | 1.393 | 6.45b | diagnostic |
| [`maven-surefire-failures-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-surefire-failures-summary.yaml) | failure | 13 | 0 | 1 (0.772) | 1.393 | 6.45b | diagnostic |
| [`maven-surefire-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-surefire-test-failed.yaml) | failure | 13 | 0 | 1 (0.772) | 1.393 | 6.45b | diagnostic |
| [`pytest-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-test-failed.yaml) | failure | 14 | 0 | 1 (0.785) | 1.393 | 6.34b | diagnostic |
| [`gradle-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-case-failed.yaml) | failure | 15 | 0 | 1 (0.796) | 1.393 | 6.24b | diagnostic |
| [`vitest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/vitest/vitest-run-summary.yaml) | failure | 15 | 0 | 1 (0.796) | 1.393 | 6.24b | diagnostic |
| [`vitest-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/vitest/vitest-test-fail.yaml) | failure | 15 | 0 | 1 (0.796) | 1.393 | 6.24b | diagnostic |
| [`jest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-run-summary.yaml) | failure | 16 | 1 | 0.941 (0.73) | 1.311 | 6.15b | diagnostic |
| [`gradle-test-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-summary-failed.yaml) | failure | 17 | 0 | 1 (0.816) | 1.393 | 6.06b | diagnostic |
| [`pre-commit-hook-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pre-commit/pre-commit-hook-failed.yaml) | failure | 19 | 0 | 1 (0.832) | 1.393 | 5.9b | diagnostic |
| [`gcc-clang-driver-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-driver-error.yaml) | failure | 20 | 1 | 0.952 (0.773) | 1.326 | 5.83b | diagnostic |
| [`maven-goal-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-goal-failed.yaml) | failure | 21 | 2 | 0.913 (0.732) | 1.272 | 5.76b | diagnostic |
| [`rust-test-panic`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-test-panic.yaml) | warning | 22 | 2 | 0.917 (0.742) | 1.277 | 5.69b | diagnostic |
| [`git-unified-diff-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-unified-diff-drift.yaml) | failure | 23 | 1 | 0.958 (0.798) | 1.335 | 5.63b | diagnostic |
| [`github-actions-workflow-gate-echo`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-workflow-gate-echo.yaml) | failure | 23 | 1 | 0.958 (0.798) | 1.335 | 5.63b | diagnostic |
| [`pytest-failures-section`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-failures-section.yaml) | failure | 23 | 0 | 1 (0.857) | 1.393 | 5.63b | diagnostic |
| [`ninja-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ninja/ninja-failed.yaml) | failure | 24 | 0 | 1 (0.862) | 1.393 | 5.56b | diagnostic |
| [`rust-libtest-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-libtest-failed.yaml) | failure | 25 | 0 | 1 (0.867) | 1.393 | 5.51b | diagnostic |
| [`rust-libtest-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-libtest-summary-failed.yaml) | failure | 25 | 0 | 1 (0.867) | 1.393 | 5.51b | diagnostic |
| [`rustc-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustc/rustc-error-tree.yaml) | failure | 25 | 0 | 1 (0.867) | 1.393 | 5.51b | diagnostic |
| [`cargo-could-not-compile`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-could-not-compile.yaml) | failure | 26 | 0 | 1 (0.871) | 1.393 | 5.45b | diagnostic |
| [`ninja-build-stopped`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ninja/ninja-build-stopped.yaml) | failure | 26 | 0 | 1 (0.871) | 1.393 | 5.45b | diagnostic |
| [`dependabot-update-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/dependabot/dependabot-update-errors.yaml) | failure | 30 | 0 | 1 (0.886) | 1.393 | 5.24b | diagnostic |
| [`gradle-task-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-task-failed.yaml) | failure | 35 | 0 | 1 (0.901) | 1.393 | 5.02b | diagnostic |
| [`gradle-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-build-failed.yaml) | failure | 37 | 0 | 1 (0.906) | 1.393 | 4.94b | diagnostic |
| [`gcc-clang-diagnostic-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-diagnostic-error.yaml) | failure | 39 | 1 | 0.975 (0.871) | 1.358 | 4.86b | diagnostic |
| [`pnpm-elifecycle-exit`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-elifecycle-exit.yaml) | failure | 42 | 0 | 1 (0.916) | 1.393 | 4.76b | diagnostic |
| [`python-traceback-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-traceback/python-traceback-uncaught-exception.yaml) | failure | 42 | 6 | 0.875 (0.753) | 1.219 | 4.76b | diagnostic |
| [`go-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-test-fail.yaml) | failure | 44 | 0 | 1 (0.92) | 1.393 | 4.69b | diagnostic |
| [`go-test-pkg-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-test-pkg-fail.yaml) | failure | 49 | 0 | 1 (0.927) | 1.393 | 4.54b | diagnostic |
| [`make-target-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/make/make-target-error.yaml) | failure | 53 | 0 | 1 (0.932) | 1.393 | 4.42b | diagnostic |
| [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml) | failure | 327 | 9 | 0.973 (0.95) | 1.355 | 1.8b | boundary |
| [`github-actions-error-annotation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-error-annotation.yaml) | failure | 1127 | 9 | 0.992 (0.985) | 1.382 | 0.01b | trivial |
| [`github-actions-runner-version-info`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-runner-version-info.yaml) | info | 1136 | 446 | 0.718 (0.695) | 1 | -0.0b | boundary |
| [`mocha-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mocha/mocha-test-fail.yaml) | failure | 0 | 1 | 0 (0) | 0 | 0.0b | boundary |
| [`nix-flake-attr-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-flake-attr-missing.yaml) | failure | 0 | 1 | 0 (0) | 0 | 0.0b | boundary |
| [`node-error-errno-bracket`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-error-errno-bracket.yaml) | failure | 0 | 1 | 0 (0) | 0 | 0.0b | boundary |
| [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml) | failure | 0 | 1 | 0 (0) | 0 | 0.0b | boundary |

## boundary / 异常 (人工审)

断裂带规则 (P_f ∈ (0.2, 0.8)) 或纯成功触发 (FP 形态) — 分布中不应存在, 出现即审:
- [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml): a/b=327/9 ppv=0.973 lift=1.355 — intent=failure 声明
- [`github-actions-runner-version-info`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-runner-version-info.yaml): a/b=1136/446 ppv=0.718 lift=1 — intent=info 声明
- [`mocha-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mocha/mocha-test-fail.yaml): a/b=0/1 ppv=0 lift=0 — intent=failure 声明
- [`nix-flake-attr-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-flake-attr-missing.yaml): a/b=0/1 ppv=0 lift=0 — intent=failure 声明
- [`node-error-errno-bracket`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-error-errno-bracket.yaml): a/b=0/1 ppv=0 lift=0 — intent=failure 声明
- [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml): a/b=0/1 ppv=0 lift=0 — intent=failure 声明

## 腐化预警

failure 规则的个体腐化快照 (连续性视角见下节):
无 — 个体健全。

## 死规则连续性

连续 ≥3 轮零命中 (per_rule_hits==0 连续在场; 锚随上游形态漂移失效, 候选重锚/退役):
- `forgejo-actions-poll-noise`: 连续 94 轮零命中
- `forgejo-actions-runner-version-info`: 连续 94 轮零命中
- `gitleaks-leaks-found`: 连续 94 轮零命中
- `nim-segv`: 连续 94 轮零命中
- `nix-fetch-input-noise`: 连续 94 轮零命中
- `nix-option-conflict`: 连续 94 轮零命中
- `trufflehog-secret-found`: 连续 94 轮零命中
- `trufflehog-unverified-secret`: 连续 94 轮零命中
- `codeowners-validator-checks-failed`: 连续 85 轮零命中
- `bun-error-json`: 连续 78 轮零命中
- `escript-exception`: 连续 74 轮零命中
- `gotestfmt-test-fail`: 连续 72 轮零命中
- `scorecard-action-error`: 连续 69 轮零命中
- `cargo-version-conflict`: 连续 68 轮零命中
- `api-extractor-semantic-error`: 连续 65 轮零命中
- `homebrew-portable-ruby-failed`: 连续 65 轮零命中
- `phpunit-php-version-mismatch`: 连续 65 轮零命中
- `pyanalyze-error-findings`: 连续 65 轮零命中
- `qunit-headless-chrome-failed`: 连续 65 轮零命中
- `signtool-error`: 连续 65 轮零命中
- `uv-require-hashes-unpinned`: 连续 65 轮零命中
- `nix-buildenv-collision`: 连续 62 轮零命中
- `nix-eval-missing-store-path`: 连续 62 轮零命中
- `nix-experimental-feature-disabled`: 连续 62 轮零命中
- `nix-flake-attr-not-derivation`: 连续 62 轮零命中
- `nix-getting-status-missing`: 连续 62 轮零命中
- `nix-hash-mismatch-fod`: 连续 62 轮零命中
- `nix-lockfile-missing-node`: 连续 62 轮零命中
- `nix-path-not-exist`: 连续 62 轮零命中
- `nix-pure-eval-restriction`: 连续 62 轮零命中
- `nix-remote-store-connection-failed`: 连续 62 轮零命中
- `nix-stack-overflow-recursion`: 连续 62 轮零命中
- `nix-syntax-error`: 连续 62 轮零命中
- `nix-undefined-variable-inline`: 连续 62 轮零命中
- `golangci-lint-config-invalid`: 连续 61 轮零命中
- `vite-plus-runtime-download-failed`: 连续 60 轮零命中
- `go-mod-tidy-diff`: 连续 54 轮零命中
- `pip-install-error`: 连续 54 轮零命中
- `docusaurus-bundle-error`: 连续 52 轮零命中
- `erlang-signal-stack-failed`: 连续 48 轮零命中
- `fastlane-itms-probe-failed`: 连续 48 轮零命中
- `webpack-hook-error`: 连续 47 轮零命中
- `semgrep-invalid-api-key`: 连续 45 轮零命中
- `cabal-build-failed`: 连续 44 轮零命中
- `npm-missing-script`: 连续 43 轮零命中
- `swift-docc-compile-failed`: 连续 41 轮零命中
- `npm-config-error`: 连续 40 轮零命中
- `infra-disk-quota-exceeded`: 连续 39 轮零命中
- `checkstyle-error`: 连续 38 轮零命中
- `esbuild-js-api-tests-failed`: 连续 38 轮零命中
- `go-toolchain-mismatch`: 连续 38 轮零命中
- `proselint-finding`: 连续 38 轮零命中
- `mastodon-github-action-post-error`: 连续 37 轮零命中
- `octokit-request-error`: 连续 36 轮零命中
- `homebrew-update-locked`: 连续 33 轮零命中
- `bun-install-download-fail`: 连续 32 轮零命中
- `bundler-lockfile-missing-frozen`: 连续 32 轮零命中
- `cloudflare-wrangler-strict-abort`: 连续 32 轮零命中
- `fileutils-cp-usage-error`: 连续 32 轮零命中
- `html-proofer-found-failures`: 连续 32 轮零命中
- `mport-fetch-error`: 连续 32 轮零命中
- `python-argparse-missing-required-args`: 连续 32 轮零命中
- `redis-server-bugreport`: 连续 32 轮零命中
- `shell-cp-usage-error`: 连续 32 轮零命中
- `sst-unexpected-error`: 连续 32 轮零命中
- `xunit-assert-failure`: 连续 32 轮零命中
- `copilot-cli-no-platform-package`: 连续 30 轮零命中
- `github-actions-checkout-ref-mismatch`: 连续 30 轮零命中
- `github-actions-raw-error-command`: 连续 30 轮零命中
- `scorecard-action-signing-error`: 连续 30 轮零命中
- `copilot-session-transcript-missing`: 连续 28 轮零命中
- `python-argparse-expected-argument`: 连续 28 轮零命中
- `plenary-test-fail`: 连续 27 轮零命中
- `plenary-tests-failed`: 连续 27 轮零命中
- `python-logging-critical-message`: 连续 27 轮零命中
- `cargo-deny-check-summary`: 连续 26 轮零命中
- `credo-strict-suggestions`: 连续 26 轮零命中
- `swift-testing-test-failed`: 连续 26 轮零命中
- `commit-lint-msg-overlong-line`: 连续 25 轮零命中
- `apt-held-broken-packages`: 连续 24 轮零命中
- `ecosystem-analyzer-new-project-failures`: 连续 24 轮零命中
- `mdl-finding`: 连续 24 轮零命中
- `phpunit-fatal-error-during-test`: 连续 24 轮零命中
- `podman-image-copy-failed`: 连续 24 轮零命中
- `bazel-undeclared-target-option`: 连续 22 轮零命中
- `composer-repo-download-fail`: 连续 22 轮零命中
- `gh-api-http-error`: 连续 22 轮零命中
- `nix-download-failed`: 连续 22 轮零命中
- `sst-concurrent-lock`: 连续 22 轮零命中
- `warp-out-of-credits`: 连续 22 轮零命中
- `autoconf-configure-error`: 连续 21 轮零命中
- `cabal-changelog-parse-failed`: 连续 21 轮零命中
- `cloudflare-wrangler-error-box`: 连续 21 轮零命中
- `freebsd-rtld-shared-object-missing`: 连续 21 轮零命中
- `meson-subproject-not-buildable`: 连续 21 轮零命中
- `bitcoin-qa-assets-download-failed`: 连续 20 轮零命中
- `codecov-upload-failed`: 连续 20 轮零命中
- `html-proofer-external-link-failed`: 连续 20 轮零命中
- `git-fatal-invalid-commit-name`: 连续 19 轮零命中
- `swift-testing-runner-crash`: 连续 19 轮零命中
- `mordant-findings-over-baseline`: 连续 18 轮零命中
- `bitcoin-fuzz-target-failure`: 连续 17 轮零命中
- `pkgin-could-not-fetch`: 连续 17 轮零命中
- `swift-build-error`: 连续 16 轮零命中
- `swiftc-compile-error`: 连续 16 轮零命中
- `cloudflare-api-error`: 连续 15 轮零命中
- `infra-runner-file-command-eacces`: 连续 15 轮零命中
- `cabal-changelog-validation-failed`: 连续 13 轮零命中
- `ruby-name-error`: 连续 11 轮零命中
- `knip-unused-section`: 连续 10 轮零命中
- `emmylua-diagnostic`: 连续 9 轮零命中
- `ghc-commit-buffer-encoding-error`: 连续 9 轮零命中
- `go-mod-parse-error`: 连续 9 轮零命中
- `lintcommit-invalid-message`: 连续 9 轮零命中
- `notarytool-agreement-expired`: 连续 9 轮零命中
- `utoo-install-download-failed`: 连续 9 轮零命中
- `cargo-publish-failed`: 连续 8 轮零命中
- `eslint-cli-fatal-error`: 连续 8 轮零命中
- `gh-api-validation-failed`: 连续 8 轮零命中
- `git-http-access-denied`: 连续 8 轮零命中
- `go-mod-updates-needed`: 连续 8 轮零命中
- `ld-so-shared-object-load-error`: 连续 8 轮零命中
- `php-fatal-out-of-memory`: 连续 8 轮零命中
- `docker-registry-pull-failed`: 连续 7 轮零命中
- `flake8-violation`: 连续 7 轮零命中
- `goreleaser-pipe-timeout`: 连续 7 轮零命中
- `redis-cli-cluster-node-error`: 连续 7 轮零命中
- `systemd-ci-unit-fail`: 连续 7 轮零命中
- `chocolatey-install-failed`: 连续 6 轮零命中
- `cloudflare-apierror-box`: 连续 6 轮零命中
- `insta-unreferenced-snapshots`: 连续 6 轮零命中
- `npm-auth-error`: 连续 6 轮零命中
- `pacman-retrieve-failed`: 连续 6 轮零命中
- `pkgin-download-error`: 连续 6 轮零命中
- `changesets-exited-error`: 连续 5 轮零命中
- `copilot-harness-attempt-failed`: 连续 5 轮零命中
- `opencv-dnn-test-error`: 连续 5 轮零命中
- `size-limit-exceeded`: 连续 5 轮零命中
- `dpkg-error-processing`: 连续 4 轮零命中
- `ruby-errno-exception`: 连续 4 轮零命中
- `fastlane-exit-status`: 连续 3 轮零命中
- `fastlane-finished-with-errors`: 连续 3 轮零命中
- `powershell-error-record`: 连续 3 轮零命中
- `powershell-method-invocation-exception`: 连续 3 轮零命中
- `rubygems-repush-not-allowed`: 连续 3 轮零命中

## intent 声明 vs 统计核对

- info 规则应 lift ≈ 1.0 (触发与结论独立); 偏离 >20% 列出:
- (全部 info 规则独立性与声明相符)
- failure 规则 b>0 (成功样本触发) = FP 形态/容忍子失败边界:
- [`curl-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/curl/curl-cli-error.yaml): b=2, ppv=0.778
- [`deno-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/deno/deno-test-failed.yaml): b=2, ppv=0.333
- [`gcc-clang-diagnostic-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-diagnostic-error.yaml): b=1, ppv=0.975
- [`gcc-clang-driver-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-driver-error.yaml): b=1, ppv=0.952
- [`git-unified-diff-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-unified-diff-drift.yaml): b=1, ppv=0.958
- [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml): b=9, ppv=0.973
- [`github-actions-cache-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-cache-not-found.yaml): b=1, ppv=0.667
- [`github-actions-error-annotation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-error-annotation.yaml): b=9, ppv=0.992
- [`github-actions-workflow-gate-echo`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-workflow-gate-echo.yaml): b=1, ppv=0.958
- [`jest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-run-summary.yaml): b=1, ppv=0.941
- [`jest-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-test-fail.yaml): b=1, ppv=0.923
- [`ld-linker-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld/ld-linker-error.yaml): b=4, ppv=0.733
- [`maven-goal-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-goal-failed.yaml): b=2, ppv=0.913
- [`mocha-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mocha/mocha-test-fail.yaml): b=1, ppv=0
- [`nix-flake-attr-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-flake-attr-missing.yaml): b=1, ppv=0
- [`node-error-errno-bracket`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-error-errno-bracket.yaml): b=1, ppv=0
- [`node-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-uncaught-exception.yaml): b=2, ppv=0.667
- [`playwright-assert-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-assert-failed.yaml): b=1, ppv=0.917
- [`python-traceback-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-traceback/python-traceback-uncaught-exception.yaml): b=6, ppv=0.875
- [`rspec-failure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-failure-error.yaml): b=1, ppv=0.889
- [`rust-io-no-such-file`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-io-no-such-file.yaml): b=1, ppv=0.5
- [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml): b=1, ppv=0
- [`shell-command-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/shell/shell-command-not-found.yaml): b=1, ppv=0.875
