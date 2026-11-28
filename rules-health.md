# 规则健康档案 (每轮 sweep 自动刷新)

- 诊断覆盖率: **1021/1139 = 89.64%** — 含 ≥1 诊断规则失败块的失败族样本占比
- 分级: trivial (原 restating) 1 / diagnostic 222 / boundary 5 (共 228 条触发规则; 死规则见 job summary)

## 怎么读

- **a / b**: 失败族 / 成功样本命中数 (样本级)
- **PPV (lo95)**: P(失败|触发) 及 Wilson 95% 下界 — 触发推出失败的可靠度; b=0 时 PPV=1.0, 下界随样本量增长
- **lift**: PPV / 失败基率 — 与结论的相关性 (1.0 = 独立; info 常数规则应 ≈1.0)
- **spec**: -log2(a/N_f) 比特 — 触发携带的样本信息量 (选择性; 0 = 处处触发零信息)
- **分级**: trivial (原 restating) = 触发由结论决定 (安全网, 不计覆盖); diagnostic = 内容决定 (计覆盖); boundary = 断裂带/异常 (人工审, 暂计覆盖)

## 全规则健康表 (spec 降序)

| 规则 | intent | a | b | PPV (lo95) | lift | spec | 分级 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [`bazel-test-target-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bazel/bazel-test-target-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`busted-htest-error-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-error-entry.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`cabal-update-unexpected-response`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cabal/cabal-update-unexpected-response.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`cargo-build-script-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-build-script-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`cargo-machete-unused-deps`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo-machete/cargo-machete-unused-deps.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`cargo-version-conflict`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-version-conflict.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`checkstyle-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/checkstyle/checkstyle-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`codecov-upload-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/codecov/codecov-upload-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`commit-lint-msg-overlong-line`](https://github.com/luochen1990/log-skimmer-rules/blob/master/commit-lint/commit-lint-msg-overlong-line.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`copilot-harness-attempt-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-harness-attempt-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`copilot-quota-exhausted`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-quota-exhausted.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`coverage-fail-under`](https://github.com/luochen1990/log-skimmer-rules/blob/master/coverage/coverage-fail-under.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`csc-diagnostic-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/csc/csc-diagnostic-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`docker-failed-to-copy`](https://github.com/luochen1990/log-skimmer-rules/blob/master/docker/docker-failed-to-copy.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`dotnet-nuget-restore-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/dotnet/dotnet-nuget-restore-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`eslint-offense-line`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-offense-line.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`flake8-violation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/flake8/flake8-violation.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`gh-release-verify-tag-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-release-verify-tag-missing.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`git-checkout-local-changes`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-checkout-local-changes.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`git-fetch-ref-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-fetch-ref-not-found.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`git-http-access-denied`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-http-access-denied.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`github-actions-cache-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-cache-not-found.yaml) | failure | 1 | 1 | 0.5 (0.095) | 0.696 | 10.15b | diagnostic |
| [`go-inconsistent-vendoring`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-inconsistent-vendoring.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`go-mod-updates-needed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-mod-updates-needed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`goreleaser-release-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/goreleaser/goreleaser-release-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`grafana-backport-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/grafana-backport/grafana-backport-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`hawk-finding-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/hawk/hawk-finding-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`knip-unused-section`](https://github.com/luochen1990/log-skimmer-rules/blob/master/knip/knip-unused-section.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`lintcommit-invalid-message`](https://github.com/luochen1990/log-skimmer-rules/blob/master/lintcommit/lintcommit-invalid-message.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`nix-undefined-variable-inline`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-undefined-variable-inline.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`node-network-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-network-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`node-test-fail-plain`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node-test/node-test-fail-plain.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`node-test-snapshot-assert-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node-test/node-test-snapshot-assert-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`npm-network-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm/npm-network-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`phpunit-compact-error-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-compact-error-entry.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`pyright-error-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pyright/pyright-error-summary.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`pyright-type-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pyright/pyright-type-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`python-unittest-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-unittest/python-unittest-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`redis-test-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/redis-test/redis-test-exception.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`rustc-doc-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustc/rustc-doc-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`rustup-download-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustup/rustup-download-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`sphinx-linkcheck-broken-link`](https://github.com/luochen1990/log-skimmer-rules/blob/master/sphinx/sphinx-linkcheck-broken-link.yaml) | warning | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`stack-hackage-verification-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/stack/stack-hackage-verification-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`swift-fatal-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-fatal-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`swiftc-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swiftc/swiftc-compile-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`typos-correction-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/typos/typos-correction-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`wait-on-check-never-run`](https://github.com/luochen1990/log-skimmer-rules/blob/master/wait-on-check/wait-on-check-never-run.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`winget-releaser-token-invalid`](https://github.com/luochen1990/log-skimmer-rules/blob/master/winget/winget-releaser-token-invalid.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`yum-repo-unavailable`](https://github.com/luochen1990/log-skimmer-rules/blob/master/yum/yum-repo-unavailable.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`zizmor-fatal-no-audit`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zizmor/zizmor-fatal-no-audit.yaml) | failure | 1 | 0 | 1 (0.207) | 1.392 | 10.15b | diagnostic |
| [`bitcoin-lint-check-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bitcoin/bitcoin-lint-check-failure.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`busted-htest-failed-test-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-failed-test-entry.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`checksrc-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/checksrc/checksrc-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`chocolatey-install-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/chocolatey/chocolatey-install-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`copilot-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-cli-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`ctest-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ctest/ctest-test-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`docker-registry-pull-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/docker/docker-registry-pull-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`dotnet-nuget-push-timeout`](https://github.com/luochen1990/log-skimmer-rules/blob/master/dotnet/dotnet-nuget-push-timeout.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`gh-api-validation-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-api-validation-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`gh-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-cli-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`just-recipe-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/just/just-recipe-fail.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`linkinator-broken-links`](https://github.com/luochen1990/log-skimmer-rules/blob/master/linkinator/linkinator-broken-links.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`minitest-failure-report`](https://github.com/luochen1990/log-skimmer-rules/blob/master/minitest/minitest-failure-report.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`minitest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/minitest/minitest-run-summary.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`mix-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mix/mix-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`mocha-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mocha/mocha-test-fail.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`mport-fetch-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mport/mport-fetch-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`msvc-linker-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/msvc/msvc-linker-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`nix-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-build-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`nvim-test-run-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-run-fail.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`phpstan-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpstan/phpstan-found-errors.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`phpunit-failures-banner`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-failures-banner.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`pnpm-error-code-bracketed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-error-code-bracketed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`sccache-server-startup-timeout`](https://github.com/luochen1990/log-skimmer-rules/blob/master/sccache/sccache-server-startup-timeout.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`size-limit-exceeded`](https://github.com/luochen1990/log-skimmer-rules/blob/master/size-limit/size-limit-exceeded.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`swift-tools-version-mismatch`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-tools-version-mismatch.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`verify-pr-title-invalid`](https://github.com/luochen1990/log-skimmer-rules/blob/master/verify-pr-title/verify-pr-title-invalid.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`xunit-assert-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/xunit/xunit-assert-failure.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`zig-build-command-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-build-command-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`zizmor-gate-severity-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zizmor/zizmor-gate-severity-fail.yaml) | failure | 2 | 0 | 1 (0.342) | 1.392 | 9.15b | diagnostic |
| [`apt-unable-to-locate-package`](https://github.com/luochen1990/log-skimmer-rules/blob/master/apt/apt-unable-to-locate-package.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`bazel-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bazel/bazel-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`busted-htest-failure-banner`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-failure-banner.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`cargo-deny-lint-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo-deny/cargo-deny-lint-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`cargo-llvm-cov-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-llvm-cov-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`clang-format-lint-diff`](https://github.com/luochen1990/log-skimmer-rules/blob/master/clang-format/clang-format-lint-diff.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`copilot-session-model-rate-limit`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-session-model-rate-limit.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`eslint-stylish-offense`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-stylish-offense.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`fastlane-exit-status`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fastlane/fastlane-exit-status.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`fastlane-finished-with-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fastlane/fastlane-finished-with-errors.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`gh-api-http-reason-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-api-http-reason-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`git-push-auth-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-push-auth-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`go-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-compile-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`msbuild-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/msbuild/msbuild-build-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`muffet-link-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/muffet/muffet-link-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`nvim-test-assertion-detail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-assertion-detail.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`oxlint-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/oxlint/oxlint-found-errors.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`phpstan-error-table`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpstan/phpstan-error-table.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`playwright-no-report-files`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-no-report-files.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`prettier-check-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/prettier/prettier-check-drift.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`ruby-errno-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ruby/ruby-errno-exception.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`ruff-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ruff/ruff-found-errors.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`wait-on-check-conclusion-not-allowed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/wait-on-check/wait-on-check-conclusion-not-allowed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`xctest-assert-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/xctest/xctest-assert-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`zizmor-audit-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zizmor/zizmor-audit-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.392 | 8.57b | diagnostic |
| [`bun-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bun/bun-test-fail.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`commit-lint-violation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/commit-lint/commit-lint-violation.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`eslint-cli-fatal-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-cli-fatal-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`fileutils-checksum-no-such-file`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fileutils/fileutils-checksum-no-such-file.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`gh-api-integration-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-api-integration-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`ghc-gcc-phase-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ghc/ghc-gcc-phase-failure.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`git-am-apply-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-am-apply-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`git-merge-conflict`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-merge-conflict.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`jest-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-test-fail.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`maven-wrapper-main-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-wrapper-main-missing.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`node-command-failed-exit`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-command-failed-exit.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`pip-build-metadata-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pip/pip-build-metadata-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`rsync-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rsync/rsync-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`semgrep-scan-start-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-scan-start-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`xctest-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/xctest/xctest-test-case-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.392 | 8.15b | diagnostic |
| [`ctest-tests-failed-list`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ctest/ctest-tests-failed-list.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`duckdb-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/duckdb/duckdb-test-failed.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`eslint-ecosystem-plugin-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-ecosystem-plugin-failed.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`exunit-failed-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/exunit/exunit-failed-summary.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`exunit-failure-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/exunit/exunit-failure-entry.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`go-http-request-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-http-request-failed.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`jest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-run-summary.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`msvc-compiler-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/msvc/msvc-compiler-error.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`npm-run-all-task-exit-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm-run-all/npm-run-all-task-exit-error.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`playwright-failed-test-header`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-failed-test-header.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`powershell-error-record`](https://github.com/luochen1990/log-skimmer-rules/blob/master/powershell/powershell-error-record.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`redis-test-err`](https://github.com/luochen1990/log-skimmer-rules/blob/master/redis-test/redis-test-err.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`rust-panic-abort-nonunwinding`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-panic-abort-nonunwinding.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`rustfmt-diff-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustfmt/rustfmt-diff-drift.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`shell-command-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/shell/shell-command-not-found.yaml) | failure | 5 | 0 | 1 (0.566) | 1.392 | 7.83b | diagnostic |
| [`trivy-vuln-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-vuln-found.yaml) | failure | 5 | 1 | 0.833 (0.436) | 1.16 | 7.83b | diagnostic |
| [`credo-result-diff-issue`](https://github.com/luochen1990/log-skimmer-rules/blob/master/credo/credo-result-diff-issue.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`dotnet-unhandled-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/dotnet/dotnet-unhandled-exception.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`eslint-stylish-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-stylish-summary.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`fileutils-cannot-access`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fileutils/fileutils-cannot-access.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`flutter-bots-command-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/flutter-bots/flutter-bots-command-failed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`git-push-rejected`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-push-rejected.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`ld-linker-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld/ld-linker-error.yaml) | failure | 6 | 4 | 0.6 (0.313) | 0.835 | 7.57b | diagnostic |
| [`ld-so-glibc-version-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld-so/ld-so-glibc-version-not-found.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`mypy-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mypy/mypy-found-errors.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`mypy-type-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mypy/mypy-type-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`node-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node-test/node-test-fail.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`pytest-conftest-import-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-conftest-import-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`rspec-rerun-command`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-rerun-command.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`rubocop-self-lint-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rubocop/rubocop-self-lint-failed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`swift-benchmark-regression`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-benchmark-regression.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`tap-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tap/tap-test-failed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`zig-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-compile-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.392 | 7.57b | diagnostic |
| [`cargo-nextest-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-nextest-run-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`curl-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/curl/curl-cli-error.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`forgejo-actions-job-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/forgejo-actions/forgejo-actions-job-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`gh-graphql-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-graphql-error.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`gradle-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-case-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`gradle-test-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-summary-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`nixfmt-fail-on-change`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nixfmt/nixfmt-fail-on-change.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`nvim-test-failure-list-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-failure-list-entry.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`playwright-assert-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-assert-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`rspec-failure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-failure-error.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`treefmt-fail-on-change`](https://github.com/luochen1990/log-skimmer-rules/blob/master/treefmt/treefmt-fail-on-change.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`zig-build-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-build-summary-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.392 | 7.35b | diagnostic |
| [`actionlint-generate-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/actionlint/actionlint-generate-drift.yaml) | failure | 8 | 0 | 1 (0.676) | 1.392 | 7.15b | diagnostic |
| [`check-spelling-unrecognized-words`](https://github.com/luochen1990/log-skimmer-rules/blob/master/check-spelling/check-spelling-unrecognized-words.yaml) | failure | 8 | 0 | 1 (0.676) | 1.392 | 7.15b | diagnostic |
| [`flutter-bots-error-box`](https://github.com/luochen1990/log-skimmer-rules/blob/master/flutter-bots/flutter-bots-error-box.yaml) | failure | 8 | 0 | 1 (0.676) | 1.392 | 7.15b | diagnostic |
| [`npm-run-all-failed-tasks`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm-run-all/npm-run-all-failed-tasks.yaml) | failure | 8 | 0 | 1 (0.676) | 1.392 | 7.15b | diagnostic |
| [`praktika-job-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/praktika/praktika-job-fail.yaml) | failure | 8 | 0 | 1 (0.676) | 1.392 | 7.15b | diagnostic |
| [`praktika-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/praktika/praktika-run-failed.yaml) | failure | 8 | 0 | 1 (0.676) | 1.392 | 7.15b | diagnostic |
| [`stack-structured-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/stack/stack-structured-error.yaml) | failure | 8 | 0 | 1 (0.676) | 1.392 | 7.15b | diagnostic |
| [`tar-unrecoverable-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tar/tar-unrecoverable-error.yaml) | failure | 8 | 1 | 0.889 (0.565) | 1.237 | 7.15b | diagnostic |
| [`cmake-configure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cmake/cmake-configure-error.yaml) | failure | 9 | 0 | 1 (0.701) | 1.392 | 6.98b | diagnostic |
| [`codeql-action-job-status-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/codeql-action/codeql-action-job-status-failure.yaml) | failure | 9 | 0 | 1 (0.701) | 1.392 | 6.98b | diagnostic |
| [`ghc-source-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ghc/ghc-source-error.yaml) | failure | 9 | 0 | 1 (0.701) | 1.392 | 6.98b | diagnostic |
| [`javac-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/javac/javac-compile-error.yaml) | failure | 9 | 0 | 1 (0.701) | 1.392 | 6.98b | diagnostic |
| [`kotlinc-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/kotlinc/kotlinc-compile-error.yaml) | failure | 9 | 0 | 1 (0.701) | 1.392 | 6.98b | diagnostic |
| [`cargo-msrv-unsupported`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-msrv-unsupported.yaml) | failure | 10 | 0 | 1 (0.722) | 1.392 | 6.83b | diagnostic |
| [`nix-eval-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-eval-error-tree.yaml) | failure | 10 | 0 | 1 (0.722) | 1.392 | 6.83b | diagnostic |
| [`pnpm-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-error-tree.yaml) | failure | 10 | 0 | 1 (0.722) | 1.392 | 6.83b | diagnostic |
| [`turbo-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/turbo/turbo-run-failed.yaml) | failure | 10 | 0 | 1 (0.722) | 1.392 | 6.83b | diagnostic |
| [`vitest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/vitest/vitest-run-summary.yaml) | failure | 10 | 0 | 1 (0.722) | 1.392 | 6.83b | diagnostic |
| [`vitest-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/vitest/vitest-test-fail.yaml) | failure | 10 | 0 | 1 (0.722) | 1.392 | 6.83b | diagnostic |
| [`docker-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/docker/docker-build-failed.yaml) | failure | 11 | 0 | 1 (0.741) | 1.392 | 6.69b | diagnostic |
| [`gotestsum-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gotestsum/gotestsum-run-summary.yaml) | failure | 11 | 0 | 1 (0.741) | 1.392 | 6.69b | diagnostic |
| [`maven-surefire-failures-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-surefire-failures-summary.yaml) | failure | 12 | 0 | 1 (0.758) | 1.392 | 6.57b | diagnostic |
| [`maven-surefire-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-surefire-test-failed.yaml) | failure | 12 | 0 | 1 (0.758) | 1.392 | 6.57b | diagnostic |
| [`apt-fetch-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/apt/apt-fetch-failed.yaml) | failure | 13 | 0 | 1 (0.772) | 1.392 | 6.45b | diagnostic |
| [`golangci-lint-issues-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/golangci-lint/golangci-lint-issues-summary.yaml) | failure | 13 | 0 | 1 (0.772) | 1.392 | 6.45b | diagnostic |
| [`node-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-uncaught-exception.yaml) | failure | 13 | 0 | 1 (0.772) | 1.392 | 6.45b | diagnostic |
| [`cabal-structured-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cabal/cabal-structured-error.yaml) | failure | 14 | 0 | 1 (0.785) | 1.392 | 6.35b | diagnostic |
| [`gcc-clang-driver-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-driver-error.yaml) | failure | 14 | 1 | 0.933 (0.702) | 1.299 | 6.35b | diagnostic |
| [`phpunit-failed-asserting`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-failed-asserting.yaml) | failure | 14 | 0 | 1 (0.785) | 1.392 | 6.35b | diagnostic |
| [`tox-env-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tox/tox-env-fail.yaml) | failure | 14 | 0 | 1 (0.785) | 1.392 | 6.35b | diagnostic |
| [`phpunit-failure-list-header`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-failure-list-header.yaml) | failure | 15 | 0 | 1 (0.796) | 1.392 | 6.25b | diagnostic |
| [`pre-commit-hook-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pre-commit/pre-commit-hook-failed.yaml) | failure | 15 | 0 | 1 (0.796) | 1.392 | 6.25b | diagnostic |
| [`pytest-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-test-failed.yaml) | failure | 15 | 0 | 1 (0.796) | 1.392 | 6.25b | diagnostic |
| [`tsc-diagnostic`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tsc/tsc-diagnostic.yaml) | failure | 15 | 0 | 1 (0.796) | 1.392 | 6.25b | diagnostic |
| [`bun-script-exit-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bun/bun-script-exit-fail.yaml) | failure | 16 | 0 | 1 (0.806) | 1.392 | 6.15b | diagnostic |
| [`ninja-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ninja/ninja-failed.yaml) | failure | 18 | 0 | 1 (0.824) | 1.392 | 5.98b | diagnostic |
| [`maven-goal-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-goal-failed.yaml) | failure | 20 | 0 | 1 (0.839) | 1.392 | 5.83b | diagnostic |
| [`dependabot-update-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/dependabot/dependabot-update-errors.yaml) | failure | 21 | 0 | 1 (0.845) | 1.392 | 5.76b | diagnostic |
| [`ninja-build-stopped`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ninja/ninja-build-stopped.yaml) | failure | 23 | 0 | 1 (0.857) | 1.392 | 5.63b | diagnostic |
| [`go-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-test-fail.yaml) | failure | 24 | 0 | 1 (0.862) | 1.392 | 5.57b | diagnostic |
| [`rustc-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustc/rustc-error-tree.yaml) | failure | 25 | 0 | 1 (0.867) | 1.392 | 5.51b | diagnostic |
| [`go-test-pkg-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-test-pkg-fail.yaml) | failure | 26 | 0 | 1 (0.871) | 1.392 | 5.45b | diagnostic |
| [`pytest-failures-section`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-failures-section.yaml) | failure | 27 | 0 | 1 (0.875) | 1.392 | 5.4b | diagnostic |
| [`git-unified-diff-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-unified-diff-drift.yaml) | failure | 28 | 0 | 1 (0.879) | 1.392 | 5.35b | diagnostic |
| [`cargo-could-not-compile`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-could-not-compile.yaml) | failure | 30 | 0 | 1 (0.886) | 1.392 | 5.25b | diagnostic |
| [`cargo-test-failed-rerun`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-test-failed-rerun.yaml) | failure | 30 | 0 | 1 (0.886) | 1.392 | 5.25b | diagnostic |
| [`github-actions-workflow-gate-echo`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-workflow-gate-echo.yaml) | failure | 30 | 0 | 1 (0.886) | 1.392 | 5.25b | diagnostic |
| [`rust-libtest-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-libtest-failed.yaml) | failure | 32 | 0 | 1 (0.893) | 1.392 | 5.15b | diagnostic |
| [`rust-libtest-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-libtest-summary-failed.yaml) | failure | 32 | 0 | 1 (0.893) | 1.392 | 5.15b | diagnostic |
| [`rust-test-panic`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-test-panic.yaml) | warning | 32 | 1 | 0.97 (0.847) | 1.349 | 5.15b | diagnostic |
| [`gradle-task-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-task-failed.yaml) | failure | 34 | 0 | 1 (0.898) | 1.392 | 5.07b | diagnostic |
| [`gcc-clang-diagnostic-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-diagnostic-error.yaml) | failure | 41 | 0 | 1 (0.914) | 1.392 | 4.8b | diagnostic |
| [`pnpm-elifecycle-exit`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-elifecycle-exit.yaml) | failure | 41 | 0 | 1 (0.914) | 1.392 | 4.8b | diagnostic |
| [`gradle-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-build-failed.yaml) | failure | 42 | 0 | 1 (0.916) | 1.392 | 4.76b | diagnostic |
| [`make-target-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/make/make-target-error.yaml) | failure | 62 | 0 | 1 (0.942) | 1.392 | 4.2b | diagnostic |
| [`python-traceback-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-traceback/python-traceback-uncaught-exception.yaml) | failure | 65 | 1 | 0.985 (0.919) | 1.371 | 4.13b | diagnostic |
| [`github-actions-end-action-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-end-action-failure.yaml) | failure | 70 | 0 | 1 (0.948) | 1.392 | 4.02b | diagnostic |
| [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml) | failure | 307 | 7 | 0.978 (0.955) | 1.361 | 1.89b | boundary |
| [`github-actions-error-annotation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-error-annotation.yaml) | failure | 1120 | 7 | 0.994 (0.987) | 1.383 | 0.02b | trivial |
| [`github-actions-runner-version-info`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-runner-version-info.yaml) | info | 1136 | 446 | 0.718 (0.695) | 0.999 | 0.0b | boundary |
| [`nix-deprecation-warning`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-deprecation-warning.yaml) | warning | 0 | 1 | 0 (0) | 0 | 0.0b | boundary |
| [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml) | failure | 0 | 1 | 0 (0) | 0 | 0.0b | boundary |
| [`trivy-misconf-failures`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-misconf-failures.yaml) | failure | 0 | 1 | 0 (0) | 0 | 0.0b | boundary |

## boundary / 异常 (人工审)

断裂带规则 (P_f ∈ (0.2, 0.8)) 或纯成功触发 (FP 形态) — 分布中不应存在, 出现即审:
- [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml): a/b=307/7 ppv=0.978 lift=1.361 — intent=failure 声明
- [`github-actions-runner-version-info`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-runner-version-info.yaml): a/b=1136/446 ppv=0.718 lift=0.999 — intent=info 声明
- [`nix-deprecation-warning`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-deprecation-warning.yaml): a/b=0/1 ppv=0 lift=0 — intent=warning 声明
- [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml): a/b=0/1 ppv=0 lift=0 — intent=failure 声明
- [`trivy-misconf-failures`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-misconf-failures.yaml): a/b=0/1 ppv=0 lift=0 — intent=failure 声明

## 腐化预警

failure 规则的个体腐化快照 (连续性视角见下节):
无 — 个体健全。

## 死规则连续性

连续 ≥3 轮零命中 (per_rule_hits==0 连续在场; 锚随上游形态漂移失效, 候选重锚/退役):
- `forgejo-actions-poll-noise`: 连续 111 轮零命中
- `forgejo-actions-runner-version-info`: 连续 111 轮零命中
- `nim-segv`: 连续 111 轮零命中
- `nix-fetch-input-noise`: 连续 111 轮零命中
- `nix-option-conflict`: 连续 111 轮零命中
- `trufflehog-secret-found`: 连续 111 轮零命中
- `trufflehog-unverified-secret`: 连续 111 轮零命中
- `codeowners-validator-checks-failed`: 连续 102 轮零命中
- `bun-error-json`: 连续 95 轮零命中
- `escript-exception`: 连续 91 轮零命中
- `gotestfmt-test-fail`: 连续 89 轮零命中
- `scorecard-action-error`: 连续 86 轮零命中
- `api-extractor-semantic-error`: 连续 82 轮零命中
- `homebrew-portable-ruby-failed`: 连续 82 轮零命中
- `phpunit-php-version-mismatch`: 连续 82 轮零命中
- `pyanalyze-error-findings`: 连续 82 轮零命中
- `qunit-headless-chrome-failed`: 连续 82 轮零命中
- `signtool-error`: 连续 82 轮零命中
- `uv-require-hashes-unpinned`: 连续 82 轮零命中
- `nix-buildenv-collision`: 连续 79 轮零命中
- `nix-eval-missing-store-path`: 连续 79 轮零命中
- `nix-experimental-feature-disabled`: 连续 79 轮零命中
- `nix-flake-attr-not-derivation`: 连续 79 轮零命中
- `nix-getting-status-missing`: 连续 79 轮零命中
- `nix-hash-mismatch-fod`: 连续 79 轮零命中
- `nix-lockfile-missing-node`: 连续 79 轮零命中
- `nix-path-not-exist`: 连续 79 轮零命中
- `nix-pure-eval-restriction`: 连续 79 轮零命中
- `nix-remote-store-connection-failed`: 连续 79 轮零命中
- `nix-stack-overflow-recursion`: 连续 79 轮零命中
- `nix-syntax-error`: 连续 79 轮零命中
- `golangci-lint-config-invalid`: 连续 78 轮零命中
- `vite-plus-runtime-download-failed`: 连续 77 轮零命中
- `pip-install-error`: 连续 71 轮零命中
- `docusaurus-bundle-error`: 连续 69 轮零命中
- `erlang-signal-stack-failed`: 连续 65 轮零命中
- `fastlane-itms-probe-failed`: 连续 65 轮零命中
- `webpack-hook-error`: 连续 64 轮零命中
- `semgrep-invalid-api-key`: 连续 62 轮零命中
- `cabal-build-failed`: 连续 61 轮零命中
- `npm-missing-script`: 连续 60 轮零命中
- `swift-docc-compile-failed`: 连续 58 轮零命中
- `npm-config-error`: 连续 57 轮零命中
- `infra-disk-quota-exceeded`: 连续 56 轮零命中
- `esbuild-js-api-tests-failed`: 连续 55 轮零命中
- `go-toolchain-mismatch`: 连续 55 轮零命中
- `proselint-finding`: 连续 55 轮零命中
- `mastodon-github-action-post-error`: 连续 54 轮零命中
- `homebrew-update-locked`: 连续 50 轮零命中
- `bun-install-download-fail`: 连续 49 轮零命中
- `bundler-lockfile-missing-frozen`: 连续 49 轮零命中
- `cloudflare-wrangler-strict-abort`: 连续 49 轮零命中
- `fileutils-cp-usage-error`: 连续 49 轮零命中
- `python-argparse-missing-required-args`: 连续 49 轮零命中
- `shell-cp-usage-error`: 连续 49 轮零命中
- `sst-unexpected-error`: 连续 49 轮零命中
- `github-actions-checkout-ref-mismatch`: 连续 47 轮零命中
- `github-actions-raw-error-command`: 连续 47 轮零命中
- `scorecard-action-signing-error`: 连续 47 轮零命中
- `copilot-session-transcript-missing`: 连续 45 轮零命中
- `python-argparse-expected-argument`: 连续 45 轮零命中
- `plenary-test-fail`: 连续 44 轮零命中
- `plenary-tests-failed`: 连续 44 轮零命中
- `python-logging-critical-message`: 连续 44 轮零命中
- `credo-strict-suggestions`: 连续 43 轮零命中
- `swift-testing-test-failed`: 连续 43 轮零命中
- `apt-held-broken-packages`: 连续 41 轮零命中
- `phpunit-fatal-error-during-test`: 连续 41 轮零命中
- `podman-image-copy-failed`: 连续 41 轮零命中
- `composer-repo-download-fail`: 连续 39 轮零命中
- `gh-api-http-error`: 连续 39 轮零命中
- `nix-download-failed`: 连续 39 轮零命中
- `sst-concurrent-lock`: 连续 39 轮零命中
- `warp-out-of-credits`: 连续 39 轮零命中
- `autoconf-configure-error`: 连续 38 轮零命中
- `cabal-changelog-parse-failed`: 连续 38 轮零命中
- `cloudflare-wrangler-error-box`: 连续 38 轮零命中
- `freebsd-rtld-shared-object-missing`: 连续 38 轮零命中
- `meson-subproject-not-buildable`: 连续 38 轮零命中
- `bitcoin-qa-assets-download-failed`: 连续 37 轮零命中
- `html-proofer-external-link-failed`: 连续 37 轮零命中
- `git-fatal-invalid-commit-name`: 连续 36 轮零命中
- `swift-testing-runner-crash`: 连续 36 轮零命中
- `mordant-findings-over-baseline`: 连续 35 轮零命中
- `bitcoin-fuzz-target-failure`: 连续 34 轮零命中
- `swift-build-error`: 连续 33 轮零命中
- `cloudflare-api-error`: 连续 32 轮零命中
- `infra-runner-file-command-eacces`: 连续 32 轮零命中
- `ruby-name-error`: 连续 28 轮零命中
- `emmylua-diagnostic`: 连续 26 轮零命中
- `ghc-commit-buffer-encoding-error`: 连续 26 轮零命中
- `go-mod-parse-error`: 连续 26 轮零命中
- `notarytool-agreement-expired`: 连续 26 轮零命中
- `cargo-publish-failed`: 连续 25 轮零命中
- `ld-so-shared-object-load-error`: 连续 25 轮零命中
- `php-fatal-out-of-memory`: 连续 25 轮零命中
- `goreleaser-pipe-timeout`: 连续 24 轮零命中
- `systemd-ci-unit-fail`: 连续 24 轮零命中
- `cloudflare-apierror-box`: 连续 23 轮零命中
- `insta-unreferenced-snapshots`: 连续 23 轮零命中
- `changesets-exited-error`: 连续 22 轮零命中
- `dpkg-error-processing`: 连续 21 轮零命中
- `powershell-method-invocation-exception`: 连续 20 轮零命中
- `rubygems-repush-not-allowed`: 连续 20 轮零命中
- `npm-tlog-entry-error`: 连续 19 轮零命中
- `playwright-missing-browser-deps`: 连续 19 轮零命中
- `bun-errno-fatal`: 连续 18 轮零命中
- `pkgin-could-not-fetch`: 连续 16 轮零命中
- `pyspelling-check-failed`: 连续 16 轮零命中
- `hdiutil-cmd-failed`: 连续 14 轮零命中
- `apt-package-unavailable`: 连续 12 轮零命中
- `tar-exiting-failure-status`: 连续 12 轮零命中
- `bazel-loading-phase-error`: 连续 11 轮零命中
- `zizmor-findings-summary`: 连续 11 轮零命中
- `bazel-undeclared-target-option`: 连续 10 轮零命中
- `cargo-cooldowns-violation`: 连续 10 轮零命中
- `cargo-publish-prepare-failed`: 连续 10 轮零命中
- `cmake-dev-warning-error`: 连续 10 轮零命中
- `copilot-harness-model-alias-failed`: 连续 10 轮零命中
- `cspell-issues-found`: 连续 10 轮零命中
- `nix-activation-conflict`: 连续 10 轮零命中
- `redis-cli-cluster-node-error`: 连续 10 轮零命中
- `cargo-build-warnings-denied`: 连续 9 轮零命中
- `go-mod-tidy-diff`: 连续 9 轮零命中
- `go-test-compile-error`: 连续 9 轮零命中
- `mkdocs-strict-mode-abort`: 连续 9 轮零命中
- `redis-server-bugreport`: 连续 9 轮零命中
- `utoo-dependency-resolution-failed`: 连续 9 轮零命中
- `utoo-install-download-failed`: 连续 9 轮零命中
- `cmakelint-violation`: 连续 8 轮零命中
- `ecosystem-analyzer-new-project-failures`: 连续 8 轮零命中
- `infra-fallocate-enospc`: 连续 8 轮零命中
- `npm-audit-unresolved`: 连续 8 轮零命中
- `powershell-cim-object-not-found`: 连续 8 轮零命中
- `apt-error-package-not-found`: 连续 7 轮零命中
- `go-mod-gosum-missing`: 连续 7 轮零命中
- `copilot-cli-no-platform-package`: 连续 6 轮零命中
- `esbuild-build-failed`: 连续 6 轮零命中
- `gha-mjolnir-issue-close-failed`: 连续 6 轮零命中
- `gitleaks-leaks-found`: 连续 6 轮零命中
- `go-mod-fetch-error`: 连续 6 轮零命中
- `opencv-dnn-test-error`: 连续 6 轮零命中
- `pacman-retrieve-failed`: 连续 6 轮零命中
- `pkgin-download-error`: 连续 6 轮零命中
- `rust-error-timestamped`: 连续 6 轮零命中
- `rust-test-panic-timestamped`: 连续 6 轮零命中
- `sdkmanager-package-prepare-failed`: 连续 6 轮零命中
- `shell-bash-unbound-variable`: 连续 6 轮零命中
- `cabal-changelog-validation-failed`: 连续 5 轮零命中
- `cargo-locked-lockfile-drift`: 连续 5 轮零命中
- `gh-api-empty-json-response`: 连续 5 轮零命中
- `copilot-review-worker-verification-failed`: 连续 4 轮零命中
- `git-pkgs-lookup-error`: 连续 4 轮零命中
- `opencv-build-warnings-counted`: 连续 4 轮零命中
- `git-ssh-remote-read-failed`: 连续 3 轮零命中
- `mdl-finding`: 连续 3 轮零命中
- `nix-flake-attr-missing`: 连续 3 轮零命中
- `shell-segmentation-fault`: 连续 3 轮零命中
- `sphinx-build-problems`: 连续 3 轮零命中

## intent 声明 vs 统计核对

- info 规则应 lift ≈ 1.0 (触发与结论独立); 偏离 >20% 列出:
- (全部 info 规则独立性与声明相符)
- failure 规则 b>0 (成功样本触发) = FP 形态/容忍子失败边界:
- [`gcc-clang-driver-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-driver-error.yaml): b=1, ppv=0.933
- [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml): b=7, ppv=0.978
- [`github-actions-cache-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-cache-not-found.yaml): b=1, ppv=0.5
- [`github-actions-error-annotation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-error-annotation.yaml): b=7, ppv=0.994
- [`ld-linker-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld/ld-linker-error.yaml): b=4, ppv=0.6
- [`python-traceback-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-traceback/python-traceback-uncaught-exception.yaml): b=1, ppv=0.985
- [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml): b=1, ppv=0
- [`tar-unrecoverable-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tar/tar-unrecoverable-error.yaml): b=1, ppv=0.889
- [`trivy-misconf-failures`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-misconf-failures.yaml): b=1, ppv=0
- [`trivy-vuln-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-vuln-found.yaml): b=1, ppv=0.833
