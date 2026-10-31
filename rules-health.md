# 规则健康档案 (每轮 sweep 自动刷新)

- 诊断覆盖率: **1007/1148 = 87.72%** — 含 ≥1 诊断规则失败块的失败族样本占比
- 分级: trivial (原 restating) 1 / diagnostic 188 / boundary 3 (共 192 条触发规则; 死规则见 job summary)

## 怎么读

- **a / b**: 失败族 / 成功样本命中数 (样本级)
- **PPV (lo95)**: P(失败|触发) 及 Wilson 95% 下界 — 触发推出失败的可靠度; b=0 时 PPV=1.0, 下界随样本量增长
- **lift**: PPV / 失败基率 — 与结论的相关性 (1.0 = 独立; info 常数规则应 ≈1.0)
- **spec**: -log2(a/N_f) 比特 — 触发携带的样本信息量 (选择性; 0 = 处处触发零信息)
- **分级**: trivial (原 restating) = 触发由结论决定 (安全网, 不计覆盖); diagnostic = 内容决定 (计覆盖); boundary = 断裂带/异常 (人工审, 暂计覆盖)

## 全规则健康表 (spec 降序)

| 规则 | intent | a | b | PPV (lo95) | lift | spec | 分级 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [`busted-htest-error-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-error-entry.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`cabal-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cabal/cabal-build-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`cocoon-wait-for-tests-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cocoon/cocoon-wait-for-tests-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`codecov-upload-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/codecov/codecov-upload-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`commit-lint-msg-overlong-line`](https://github.com/luochen1990/log-skimmer-rules/blob/master/commit-lint/commit-lint-msg-overlong-line.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`copilot-harness-attempt-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-harness-attempt-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`credo-strict-suggestions`](https://github.com/luochen1990/log-skimmer-rules/blob/master/credo/credo-strict-suggestions.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`ctest-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ctest/ctest-test-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`erlang-signal-stack-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/erlang/erlang-signal-stack-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`esbuild-js-api-tests-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/esbuild/esbuild-js-api-tests-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`eslint-stylish-offense`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-stylish-offense.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`git-am-apply-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-am-apply-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`git-http-access-denied`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-http-access-denied.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`github-actions-raw-error-command`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-raw-error-command.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`lintcommit-invalid-message`](https://github.com/luochen1990/log-skimmer-rules/blob/master/lintcommit/lintcommit-invalid-message.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`mix-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mix/mix-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`nix-activation-conflict`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-activation-conflict.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`npm-missing-script`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm/npm-missing-script.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`npm-network-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm/npm-network-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`nvim-test-run-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-run-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`oxlint-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/oxlint/oxlint-found-errors.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`plenary-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/plenary/plenary-test-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`plenary-tests-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/plenary/plenary-tests-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`pyright-error-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pyright/pyright-error-summary.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`pyright-type-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pyright/pyright-type-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`python-logging-critical-message`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-logging/python-logging-critical-message.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`rsync-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rsync/rsync-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`ruby-name-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ruby/ruby-name-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`rust-io-no-such-file`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-io-no-such-file.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`stack-hackage-verification-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/stack/stack-hackage-verification-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`swift-docc-compile-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-docc-compile-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`swift-testing-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift-testing/swift-testing-test-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`xctest-assert-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/xctest/xctest-assert-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`xctest-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/xctest/xctest-test-case-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 10.16b | diagnostic |
| [`bitcoin-lint-check-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bitcoin/bitcoin-lint-check-failure.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`changesets-exited-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/changesets/changesets-exited-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`chocolatey-install-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/chocolatey/chocolatey-install-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`csc-diagnostic-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/csc/csc-diagnostic-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`eslint-stylish-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-stylish-summary.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`forgejo-actions-job-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/forgejo-actions/forgejo-actions-job-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`git-push-auth-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-push-auth-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`go-toolchain-mismatch`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-toolchain-mismatch.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`mage-drift-gate-echo`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mage/mage-drift-gate-echo.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`msbuild-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/msbuild/msbuild-build-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`pacman-retrieve-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pacman/pacman-retrieve-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`phpstan-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpstan/phpstan-found-errors.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`pnpm-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-error-tree.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`podman-image-copy-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/podman/podman-image-copy-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`python-unittest-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-unittest/python-unittest-fail.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`rubocop-self-lint-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rubocop/rubocop-self-lint-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`ruby-errno-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ruby/ruby-errno-exception.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`rustc-doc-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustc/rustc-doc-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`swift-benchmark-regression`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-benchmark-regression.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`swiftc-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swiftc/swiftc-compile-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`verify-pr-title-invalid`](https://github.com/luochen1990/log-skimmer-rules/blob/master/verify-pr-title/verify-pr-title-invalid.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`wait-on-check-never-run`](https://github.com/luochen1990/log-skimmer-rules/blob/master/wait-on-check/wait-on-check-never-run.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`webpack-hook-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/webpack/webpack-hook-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`winget-releaser-token-invalid`](https://github.com/luochen1990/log-skimmer-rules/blob/master/winget/winget-releaser-token-invalid.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 9.16b | diagnostic |
| [`black-would-reformat`](https://github.com/luochen1990/log-skimmer-rules/blob/master/black/black-would-reformat.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`cabal-changelog-validation-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cabal/cabal-changelog-validation-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`cargo-nextest-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-nextest-run-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`check-spelling-unrecognized-words`](https://github.com/luochen1990/log-skimmer-rules/blob/master/check-spelling/check-spelling-unrecognized-words.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`ctest-tests-failed-list`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ctest/ctest-tests-failed-list.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`fastlane-itms-probe-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fastlane/fastlane-itms-probe-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`gh-api-integration-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-api-integration-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`git-push-rejected`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-push-rejected.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`node-command-failed-exit`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-command-failed-exit.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`npm-config-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm/npm-config-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`phpunit-failures-banner`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-failures-banner.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`redis-test-err`](https://github.com/luochen1990/log-skimmer-rules/blob/master/redis-test/redis-test-err.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`semgrep-invalid-api-key`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-invalid-api-key.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`swift-fatal-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-fatal-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`swift-testing-runner-crash`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-testing-runner-crash.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`zig-build-command-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-build-command-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.58b | diagnostic |
| [`apt-fetch-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/apt/apt-fetch-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`busted-htest-failed-test-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-failed-test-entry.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`busted-htest-failure-banner`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-failure-banner.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`cargo-build-script-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-build-script-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`cargo-llvm-cov-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-llvm-cov-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`copilot-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-cli-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`curl-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/curl/curl-cli-error.yaml) | failure | 4 | 1 | 0.8 (0.376) | 1.109 | 8.16b | diagnostic |
| [`fastlane-exit-status`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fastlane/fastlane-exit-status.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`fastlane-finished-with-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fastlane/fastlane-finished-with-errors.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`flutter-bots-command-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/flutter-bots/flutter-bots-command-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`gh-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-cli-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`homebrew-update-locked`](https://github.com/luochen1990/log-skimmer-rules/blob/master/homebrew/homebrew-update-locked.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`infra-disk-quota-exceeded`](https://github.com/luochen1990/log-skimmer-rules/blob/master/infra/infra-disk-quota-exceeded.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`maven-wrapper-main-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-wrapper-main-missing.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`minitest-failure-report`](https://github.com/luochen1990/log-skimmer-rules/blob/master/minitest/minitest-failure-report.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`minitest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/minitest/minitest-run-summary.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`mypy-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mypy/mypy-found-errors.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`mypy-type-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mypy/mypy-type-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`nixfmt-fail-on-change`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nixfmt/nixfmt-fail-on-change.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`nvim-test-failure-list-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-failure-list-entry.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`prettier-check-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/prettier/prettier-check-drift.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`semgrep-scan-start-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-scan-start-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`swift-build-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift-build/swift-build-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`treefmt-fail-on-change`](https://github.com/luochen1990/log-skimmer-rules/blob/master/treefmt/treefmt-fail-on-change.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`zig-build-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-build-summary-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 8.16b | diagnostic |
| [`credo-result-diff-issue`](https://github.com/luochen1990/log-skimmer-rules/blob/master/credo/credo-result-diff-issue.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.84b | diagnostic |
| [`deno-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/deno/deno-test-failed.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.84b | diagnostic |
| [`github-actions-cache-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-cache-not-found.yaml) | failure | 5 | 1 | 0.833 (0.436) | 1.156 | 7.84b | diagnostic |
| [`github-actions-checkout-ref-mismatch`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-checkout-ref-mismatch.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.84b | diagnostic |
| [`kotlinc-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/kotlinc/kotlinc-compile-error.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.84b | diagnostic |
| [`msvc-compiler-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/msvc/msvc-compiler-error.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.84b | diagnostic |
| [`nix-eval-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-eval-error-tree.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.84b | diagnostic |
| [`node-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node-test/node-test-fail.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.84b | diagnostic |
| [`npm-run-all-failed-tasks`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm-run-all/npm-run-all-failed-tasks.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.84b | diagnostic |
| [`phpstan-error-table`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpstan/phpstan-error-table.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.84b | diagnostic |
| [`rspec-rerun-command`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-rerun-command.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.84b | diagnostic |
| [`swift-tools-version-mismatch`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-tools-version-mismatch.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.84b | diagnostic |
| [`commit-lint-violation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/commit-lint/commit-lint-violation.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.58b | diagnostic |
| [`exunit-failed-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/exunit/exunit-failed-summary.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.58b | diagnostic |
| [`ghc-gcc-phase-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ghc/ghc-gcc-phase-failure.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.58b | diagnostic |
| [`git-fetch-ref-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-fetch-ref-not-found.yaml) | failure | 6 | 1 | 0.857 (0.487) | 1.189 | 7.58b | diagnostic |
| [`go-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-compile-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.58b | diagnostic |
| [`pytest-conftest-import-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-conftest-import-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.58b | diagnostic |
| [`pytest-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-test-failed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.58b | diagnostic |
| [`wait-on-check-conclusion-not-allowed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/wait-on-check/wait-on-check-conclusion-not-allowed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.58b | diagnostic |
| [`zig-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-compile-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.58b | diagnostic |
| [`apt-package-unavailable`](https://github.com/luochen1990/log-skimmer-rules/blob/master/apt/apt-package-unavailable.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.36b | diagnostic |
| [`cmake-configure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cmake/cmake-configure-error.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.36b | diagnostic |
| [`eslint-ecosystem-plugin-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-ecosystem-plugin-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.36b | diagnostic |
| [`go-mod-fetch-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-mod-fetch-error.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.36b | diagnostic |
| [`gotestsum-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gotestsum/gotestsum-run-summary.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.36b | diagnostic |
| [`nix-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-build-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.36b | diagnostic |
| [`nix-deprecation-warning`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-deprecation-warning.yaml) | warning | 7 | 1 | 0.875 (0.529) | 1.213 | 7.36b | diagnostic |
| [`powershell-error-record`](https://github.com/luochen1990/log-skimmer-rules/blob/master/powershell/powershell-error-record.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.36b | diagnostic |
| [`praktika-job-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/praktika/praktika-job-fail.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.36b | diagnostic |
| [`praktika-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/praktika/praktika-run-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.36b | diagnostic |
| [`rustfmt-diff-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustfmt/rustfmt-diff-drift.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.36b | diagnostic |
| [`actionlint-generate-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/actionlint/actionlint-generate-drift.yaml) | failure | 8 | 0 | 1 (0.676) | 1.387 | 7.16b | diagnostic |
| [`rspec-failure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-failure-error.yaml) | failure | 8 | 1 | 0.889 (0.565) | 1.233 | 7.16b | diagnostic |
| [`trivy-vuln-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-vuln-found.yaml) | failure | 8 | 0 | 1 (0.676) | 1.387 | 7.16b | diagnostic |
| [`bazel-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bazel/bazel-error.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.99b | diagnostic |
| [`cargo-msrv-unsupported`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-msrv-unsupported.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.99b | diagnostic |
| [`fileutils-cannot-access`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fileutils/fileutils-cannot-access.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.99b | diagnostic |
| [`ghc-source-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ghc/ghc-source-error.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.99b | diagnostic |
| [`npm-run-all-task-exit-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm-run-all/npm-run-all-task-exit-error.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.99b | diagnostic |
| [`playwright-failed-test-header`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-failed-test-header.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.99b | diagnostic |
| [`stack-structured-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/stack/stack-structured-error.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.99b | diagnostic |
| [`tap-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tap/tap-test-failed.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.99b | diagnostic |
| [`tsc-diagnostic`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tsc/tsc-diagnostic.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.99b | diagnostic |
| [`codeql-action-job-status-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/codeql-action/codeql-action-job-status-failure.yaml) | failure | 10 | 0 | 1 (0.722) | 1.387 | 6.84b | diagnostic |
| [`exunit-failure-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/exunit/exunit-failure-entry.yaml) | failure | 10 | 0 | 1 (0.722) | 1.387 | 6.84b | diagnostic |
| [`go-http-request-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-http-request-failed.yaml) | failure | 10 | 0 | 1 (0.722) | 1.387 | 6.84b | diagnostic |
| [`javac-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/javac/javac-compile-error.yaml) | failure | 10 | 0 | 1 (0.722) | 1.387 | 6.84b | diagnostic |
| [`shell-command-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/shell/shell-command-not-found.yaml) | failure | 10 | 0 | 1 (0.722) | 1.387 | 6.84b | diagnostic |
| [`cabal-structured-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cabal/cabal-structured-error.yaml) | failure | 11 | 0 | 1 (0.741) | 1.387 | 6.71b | diagnostic |
| [`jest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-run-summary.yaml) | failure | 11 | 0 | 1 (0.741) | 1.387 | 6.71b | diagnostic |
| [`jest-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-test-fail.yaml) | failure | 11 | 0 | 1 (0.741) | 1.387 | 6.71b | diagnostic |
| [`ninja-build-stopped`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ninja/ninja-build-stopped.yaml) | failure | 11 | 0 | 1 (0.741) | 1.387 | 6.71b | diagnostic |
| [`playwright-assert-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-assert-failed.yaml) | failure | 12 | 0 | 1 (0.758) | 1.387 | 6.58b | diagnostic |
| [`gcc-clang-driver-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-driver-error.yaml) | failure | 13 | 1 | 0.929 (0.685) | 1.288 | 6.46b | diagnostic |
| [`golangci-lint-issues-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/golangci-lint/golangci-lint-issues-summary.yaml) | failure | 13 | 0 | 1 (0.772) | 1.387 | 6.46b | diagnostic |
| [`maven-surefire-failures-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-surefire-failures-summary.yaml) | failure | 14 | 0 | 1 (0.785) | 1.387 | 6.36b | diagnostic |
| [`maven-surefire-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-surefire-test-failed.yaml) | failure | 14 | 0 | 1 (0.785) | 1.387 | 6.36b | diagnostic |
| [`ninja-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ninja/ninja-failed.yaml) | failure | 14 | 0 | 1 (0.785) | 1.387 | 6.36b | diagnostic |
| [`bun-script-exit-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bun/bun-script-exit-fail.yaml) | failure | 15 | 0 | 1 (0.796) | 1.387 | 6.26b | diagnostic |
| [`bun-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bun/bun-test-fail.yaml) | failure | 15 | 0 | 1 (0.796) | 1.387 | 6.26b | diagnostic |
| [`docker-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/docker/docker-build-failed.yaml) | failure | 15 | 0 | 1 (0.796) | 1.387 | 6.26b | diagnostic |
| [`pytest-failures-section`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-failures-section.yaml) | failure | 16 | 0 | 1 (0.806) | 1.387 | 6.16b | diagnostic |
| [`node-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-uncaught-exception.yaml) | failure | 17 | 0 | 1 (0.816) | 1.387 | 6.08b | diagnostic |
| [`turbo-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/turbo/turbo-run-failed.yaml) | failure | 17 | 0 | 1 (0.816) | 1.387 | 6.08b | diagnostic |
| [`gradle-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-case-failed.yaml) | failure | 18 | 1 | 0.947 (0.754) | 1.314 | 5.99b | diagnostic |
| [`gradle-test-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-summary-failed.yaml) | failure | 19 | 1 | 0.95 (0.764) | 1.317 | 5.92b | diagnostic |
| [`github-actions-workflow-gate-echo`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-workflow-gate-echo.yaml) | failure | 20 | 0 | 1 (0.839) | 1.387 | 5.84b | diagnostic |
| [`ld-linker-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld/ld-linker-error.yaml) | failure | 21 | 1 | 0.955 (0.782) | 1.324 | 5.77b | diagnostic |
| [`vitest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/vitest/vitest-run-summary.yaml) | failure | 21 | 0 | 1 (0.845) | 1.387 | 5.77b | diagnostic |
| [`vitest-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/vitest/vitest-test-fail.yaml) | failure | 21 | 0 | 1 (0.845) | 1.387 | 5.77b | diagnostic |
| [`pre-commit-hook-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pre-commit/pre-commit-hook-failed.yaml) | failure | 22 | 0 | 1 (0.851) | 1.387 | 5.71b | diagnostic |
| [`phpunit-failed-asserting`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-failed-asserting.yaml) | failure | 23 | 0 | 1 (0.857) | 1.387 | 5.64b | diagnostic |
| [`rustc-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustc/rustc-error-tree.yaml) | failure | 23 | 0 | 1 (0.857) | 1.387 | 5.64b | diagnostic |
| [`go-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-test-fail.yaml) | failure | 24 | 0 | 1 (0.862) | 1.387 | 5.58b | diagnostic |
| [`git-unified-diff-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-unified-diff-drift.yaml) | failure | 26 | 0 | 1 (0.871) | 1.387 | 5.46b | diagnostic |
| [`maven-goal-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-goal-failed.yaml) | failure | 26 | 2 | 0.929 (0.774) | 1.288 | 5.46b | diagnostic |
| [`dependabot-update-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/dependabot/dependabot-update-errors.yaml) | failure | 28 | 0 | 1 (0.879) | 1.387 | 5.36b | diagnostic |
| [`rust-test-panic`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-test-panic.yaml) | warning | 31 | 1 | 0.969 (0.843) | 1.343 | 5.21b | diagnostic |
| [`cargo-could-not-compile`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-could-not-compile.yaml) | failure | 33 | 0 | 1 (0.896) | 1.387 | 5.12b | diagnostic |
| [`rust-libtest-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-libtest-failed.yaml) | failure | 35 | 0 | 1 (0.901) | 1.387 | 5.04b | diagnostic |
| [`rust-libtest-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-libtest-summary-failed.yaml) | failure | 35 | 0 | 1 (0.901) | 1.387 | 5.04b | diagnostic |
| [`gcc-clang-diagnostic-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-diagnostic-error.yaml) | failure | 36 | 0 | 1 (0.904) | 1.387 | 4.99b | diagnostic |
| [`gradle-task-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-task-failed.yaml) | failure | 36 | 0 | 1 (0.904) | 1.387 | 4.99b | diagnostic |
| [`go-test-pkg-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-test-pkg-fail.yaml) | failure | 40 | 0 | 1 (0.912) | 1.387 | 4.84b | diagnostic |
| [`pnpm-elifecycle-exit`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-elifecycle-exit.yaml) | failure | 40 | 0 | 1 (0.912) | 1.387 | 4.84b | diagnostic |
| [`gradle-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-build-failed.yaml) | failure | 41 | 0 | 1 (0.914) | 1.387 | 4.81b | diagnostic |
| [`python-traceback-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-traceback/python-traceback-uncaught-exception.yaml) | failure | 60 | 5 | 0.923 (0.832) | 1.28 | 4.26b | diagnostic |
| [`make-target-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/make/make-target-error.yaml) | failure | 62 | 1 | 0.984 (0.915) | 1.365 | 4.21b | diagnostic |
| [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml) | failure | 349 | 8 | 0.978 (0.956) | 1.356 | 1.72b | boundary |
| [`github-actions-error-annotation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-error-annotation.yaml) | failure | 1144 | 8 | 0.993 (0.986) | 1.377 | 0.01b | trivial |
| [`github-actions-runner-version-info`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-runner-version-info.yaml) | info | 1148 | 444 | 0.721 (0.699) | 1 | -0.0b | boundary |
| [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml) | failure | 0 | 2 | 0 (0) | 0 | 0.0b | boundary |

## boundary / 异常 (人工审)

断裂带规则 (P_f ∈ (0.2, 0.8)) 或纯成功触发 (FP 形态) — 分布中不应存在, 出现即审:
- [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml): a/b=349/8 ppv=0.978 lift=1.356 — intent=failure 声明
- [`github-actions-runner-version-info`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-runner-version-info.yaml): a/b=1148/444 ppv=0.721 lift=1 — intent=info 声明
- [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml): a/b=0/2 ppv=0 lift=0 — intent=failure 声明

## 腐化预警

failure 规则的个体腐化快照 (连续性视角见下节):
无 — 个体健全。

## 死规则连续性

连续 ≥3 轮零命中 (per_rule_hits==0 连续在场; 锚随上游形态漂移失效, 候选重锚/退役):
- `checkstyle-error`: 连续 43 轮零命中
- `forgejo-actions-poll-noise`: 连续 43 轮零命中
- `forgejo-actions-runner-version-info`: 连续 43 轮零命中
- `gitleaks-leaks-found`: 连续 43 轮零命中
- `nim-segv`: 连续 43 轮零命中
- `nix-fetch-input-noise`: 连续 43 轮零命中
- `nix-option-conflict`: 连续 43 轮零命中
- `redis-server-bugreport`: 连续 43 轮零命中
- `trivy-misconf-failures`: 连续 43 轮零命中
- `trufflehog-secret-found`: 连续 43 轮零命中
- `trufflehog-unverified-secret`: 连续 43 轮零命中
- `codeowners-validator-checks-failed`: 连续 34 轮零命中
- `bun-error-json`: 连续 27 轮零命中
- `escript-exception`: 连续 23 轮零命中
- `gotestfmt-test-fail`: 连续 21 轮零命中
- `clang-format-lint-diff`: 连续 18 轮零命中
- `scorecard-action-error`: 连续 18 轮零命中
- `cargo-version-conflict`: 连续 17 轮零命中
- `systemd-ci-unit-fail`: 连续 15 轮零命中
- `api-extractor-semantic-error`: 连续 14 轮零命中
- `docker-registry-pull-failed`: 连续 14 轮零命中
- `homebrew-portable-ruby-failed`: 连续 14 轮零命中
- `phpunit-php-version-mismatch`: 连续 14 轮零命中
- `proselint-finding`: 连续 14 轮零命中
- `pyanalyze-error-findings`: 连续 14 轮零命中
- `qunit-headless-chrome-failed`: 连续 14 轮零命中
- `signtool-error`: 连续 14 轮零命中
- `uv-require-hashes-unpinned`: 连续 14 轮零命中
- `nix-buildenv-collision`: 连续 11 轮零命中
- `nix-download-failed`: 连续 11 轮零命中
- `nix-eval-missing-store-path`: 连续 11 轮零命中
- `nix-experimental-feature-disabled`: 连续 11 轮零命中
- `nix-flake-attr-not-derivation`: 连续 11 轮零命中
- `nix-getting-status-missing`: 连续 11 轮零命中
- `nix-hash-mismatch-fod`: 连续 11 轮零命中
- `nix-lockfile-missing-node`: 连续 11 轮零命中
- `nix-path-not-exist`: 连续 11 轮零命中
- `nix-pure-eval-restriction`: 连续 11 轮零命中
- `nix-remote-store-connection-failed`: 连续 11 轮零命中
- `nix-stack-overflow-recursion`: 连续 11 轮零命中
- `nix-syntax-error`: 连续 11 轮零命中
- `nix-undefined-variable-inline`: 连续 11 轮零命中
- `golangci-lint-config-invalid`: 连续 10 轮零命中
- `npm-audit-unresolved`: 连续 9 轮零命中
- `redis-test-exception`: 连续 9 轮零命中
- `vite-plus-runtime-download-failed`: 连续 9 轮零命中
- `esbuild-build-failed`: 连续 4 轮零命中
- `size-limit-exceeded`: 连续 4 轮零命中
- `cloudflare-api-error`: 连续 3 轮零命中
- `eslint-offense-line`: 连续 3 轮零命中
- `go-mod-tidy-diff`: 连续 3 轮零命中
- `mocha-test-fail`: 连续 3 轮零命中
- `pip-install-error`: 连续 3 轮零命中

## intent 声明 vs 统计核对

- info 规则应 lift ≈ 1.0 (触发与结论独立); 偏离 >20% 列出:
- (全部 info 规则独立性与声明相符)
- failure 规则 b>0 (成功样本触发) = FP 形态/容忍子失败边界:
- [`curl-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/curl/curl-cli-error.yaml): b=1, ppv=0.8
- [`gcc-clang-driver-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-driver-error.yaml): b=1, ppv=0.929
- [`git-fetch-ref-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-fetch-ref-not-found.yaml): b=1, ppv=0.857
- [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml): b=8, ppv=0.978
- [`github-actions-cache-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-cache-not-found.yaml): b=1, ppv=0.833
- [`github-actions-error-annotation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-error-annotation.yaml): b=8, ppv=0.993
- [`gradle-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-case-failed.yaml): b=1, ppv=0.947
- [`gradle-test-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-summary-failed.yaml): b=1, ppv=0.95
- [`ld-linker-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld/ld-linker-error.yaml): b=1, ppv=0.955
- [`make-target-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/make/make-target-error.yaml): b=1, ppv=0.984
- [`maven-goal-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-goal-failed.yaml): b=2, ppv=0.929
- [`python-traceback-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-traceback/python-traceback-uncaught-exception.yaml): b=5, ppv=0.923
- [`rspec-failure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-failure-error.yaml): b=1, ppv=0.889
- [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml): b=2, ppv=0
