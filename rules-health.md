# 规则健康档案 (每轮 sweep 自动刷新)

- 诊断覆盖率: **1006/1160 = 86.72%** — 含 ≥1 诊断规则失败块的失败族样本占比
- 分级: trivial (原 restating) 1 / diagnostic 174 / boundary 5 (共 180 条触发规则; 死规则见 job summary)

## 怎么读

- **a / b**: 失败族 / 成功样本命中数 (样本级)
- **PPV (lo95)**: P(失败|触发) 及 Wilson 95% 下界 — 触发推出失败的可靠度; b=0 时 PPV=1.0, 下界随样本量增长
- **lift**: PPV / 失败基率 — 与结论的相关性 (1.0 = 独立; info 常数规则应 ≈1.0)
- **spec**: -log2(a/N_f) 比特 — 触发携带的样本信息量 (选择性; 0 = 处处触发零信息)
- **分级**: trivial (原 restating) = 触发由结论决定 (安全网, 不计覆盖); diagnostic = 内容决定 (计覆盖); boundary = 断裂带/异常 (人工审, 暂计覆盖)

## 全规则健康表 (spec 降序)

| 规则 | intent | a | b | PPV (lo95) | lift | spec | 分级 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [`apt-fetch-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/apt/apt-fetch-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`black-would-reformat`](https://github.com/luochen1990/log-skimmer-rules/blob/master/black/black-would-reformat.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`busted-htest-error-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-error-entry.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`chocolatey-install-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/chocolatey/chocolatey-install-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`commit-lint-msg-overlong-line`](https://github.com/luochen1990/log-skimmer-rules/blob/master/commit-lint/commit-lint-msg-overlong-line.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`credo-strict-suggestions`](https://github.com/luochen1990/log-skimmer-rules/blob/master/credo/credo-strict-suggestions.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`curl-runtests-testfail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/curl-runtests/curl-runtests-testfail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`gh-api-integration-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-api-integration-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`gh-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gh/gh-cli-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`github-actions-raw-error-command`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-raw-error-command.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`kotlinc-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/kotlinc/kotlinc-compile-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`mix-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mix/mix-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`mocha-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mocha/mocha-test-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`msbuild-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/msbuild/msbuild-build-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`nix-activation-conflict`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-activation-conflict.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`node-network-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-network-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`nvim-test-failure-list-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-failure-list-entry.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`playwright-no-report-files`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-no-report-files.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`plenary-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/plenary/plenary-test-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`plenary-tests-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/plenary/plenary-tests-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`redis-server-bugreport`](https://github.com/luochen1990/log-skimmer-rules/blob/master/redis-server/redis-server-bugreport.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`redis-test-err`](https://github.com/luochen1990/log-skimmer-rules/blob/master/redis-test/redis-test-err.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`rustc-doc-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustc/rustc-doc-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`swift-build-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift-build/swift-build-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`swift-testing-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift-testing/swift-testing-test-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`swiftc-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swiftc/swiftc-compile-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`warp-out-of-credits`](https://github.com/luochen1990/log-skimmer-rules/blob/master/warp/warp-out-of-credits.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`xctest-assert-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/xctest/xctest-assert-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`xctest-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/xctest/xctest-test-case-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.384 | 10.18b | diagnostic |
| [`cargo-build-script-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-build-script-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`copilot-harness-attempt-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-harness-attempt-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`curl-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/curl/curl-cli-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`go-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-compile-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`just-recipe-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/just/just-recipe-fail.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`node-command-failed-exit`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-command-failed-exit.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`npm-network-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm/npm-network-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`npm-run-all-task-exit-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm-run-all/npm-run-all-task-exit-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`nvim-test-assertion-detail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-assertion-detail.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`oxlint-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/oxlint/oxlint-found-errors.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`pacman-retrieve-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pacman/pacman-retrieve-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`pyright-error-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pyright/pyright-error-summary.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`pyright-type-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pyright/pyright-type-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`rsync-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rsync/rsync-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`ruby-errno-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ruby/ruby-errno-exception.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`rust-io-no-such-file`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-io-no-such-file.yaml) | failure | 2 | 1 | 0.667 (0.208) | 0.923 | 9.18b | diagnostic |
| [`winget-releaser-token-invalid`](https://github.com/luochen1990/log-skimmer-rules/blob/master/winget/winget-releaser-token-invalid.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`zig-build-command-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-build-command-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.384 | 9.18b | diagnostic |
| [`bitcoin-lint-check-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bitcoin/bitcoin-lint-check-failure.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`check-spelling-unrecognized-words`](https://github.com/luochen1990/log-skimmer-rules/blob/master/check-spelling/check-spelling-unrecognized-words.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`clang-format-lint-diff`](https://github.com/luochen1990/log-skimmer-rules/blob/master/clang-format/clang-format-lint-diff.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`ctest-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ctest/ctest-test-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`exunit-failed-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/exunit/exunit-failed-summary.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`forgejo-actions-job-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/forgejo-actions/forgejo-actions-job-failed.yaml) | failure | 3 | 1 | 0.75 (0.301) | 1.038 | 8.59b | diagnostic |
| [`git-am-apply-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-am-apply-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`nvim-test-run-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-run-fail.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`python-logging-critical-message`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-logging/python-logging-critical-message.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`redis-test-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/redis-test/redis-test-exception.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`rubocop-self-lint-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rubocop/rubocop-self-lint-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`swift-benchmark-regression`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-benchmark-regression.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`swift-fatal-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-fatal-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`swift-testing-runner-crash`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-testing-runner-crash.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`zig-build-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-build-summary-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.384 | 8.59b | diagnostic |
| [`busted-htest-failed-test-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-failed-test-entry.yaml) | failure | 4 | 0 | 1 (0.51) | 1.384 | 8.18b | diagnostic |
| [`busted-htest-failure-banner`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-failure-banner.yaml) | failure | 4 | 0 | 1 (0.51) | 1.384 | 8.18b | diagnostic |
| [`cargo-llvm-cov-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-llvm-cov-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.384 | 8.18b | diagnostic |
| [`copilot-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-cli-error.yaml) | failure | 4 | 0 | 1 (0.51) | 1.384 | 8.18b | diagnostic |
| [`ctest-tests-failed-list`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ctest/ctest-tests-failed-list.yaml) | failure | 4 | 0 | 1 (0.51) | 1.384 | 8.18b | diagnostic |
| [`deno-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/deno/deno-test-failed.yaml) | failure | 4 | 1 | 0.8 (0.376) | 1.108 | 8.18b | diagnostic |
| [`homebrew-update-locked`](https://github.com/luochen1990/log-skimmer-rules/blob/master/homebrew/homebrew-update-locked.yaml) | failure | 4 | 0 | 1 (0.51) | 1.384 | 8.18b | diagnostic |
| [`npm-run-all-failed-tasks`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm-run-all/npm-run-all-failed-tasks.yaml) | failure | 4 | 0 | 1 (0.51) | 1.384 | 8.18b | diagnostic |
| [`phpstan-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpstan/phpstan-found-errors.yaml) | failure | 4 | 0 | 1 (0.51) | 1.384 | 8.18b | diagnostic |
| [`phpunit-failures-banner`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-failures-banner.yaml) | failure | 4 | 0 | 1 (0.51) | 1.384 | 8.18b | diagnostic |
| [`prettier-check-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/prettier/prettier-check-drift.yaml) | failure | 4 | 0 | 1 (0.51) | 1.384 | 8.18b | diagnostic |
| [`changesets-exited-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/changesets/changesets-exited-error.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`credo-result-diff-issue`](https://github.com/luochen1990/log-skimmer-rules/blob/master/credo/credo-result-diff-issue.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`eslint-stylish-offense`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-stylish-offense.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`git-fetch-ref-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-fetch-ref-not-found.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`github-actions-cache-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-cache-not-found.yaml) | failure | 5 | 1 | 0.833 (0.436) | 1.154 | 7.86b | diagnostic |
| [`github-actions-checkout-ref-mismatch`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-checkout-ref-mismatch.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`maven-wrapper-main-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-wrapper-main-missing.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`minitest-failure-report`](https://github.com/luochen1990/log-skimmer-rules/blob/master/minitest/minitest-failure-report.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`msvc-compiler-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/msvc/msvc-compiler-error.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`mypy-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mypy/mypy-found-errors.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`mypy-type-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mypy/mypy-type-error.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`nix-eval-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-eval-error-tree.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`swift-tools-version-mismatch`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift/swift-tools-version-mismatch.yaml) | failure | 5 | 0 | 1 (0.566) | 1.384 | 7.86b | diagnostic |
| [`cargo-nextest-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-nextest-run-failed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`cmake-configure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cmake/cmake-configure-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`cocoon-wait-for-tests-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cocoon/cocoon-wait-for-tests-failed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`commit-lint-violation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/commit-lint/commit-lint-violation.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`exunit-failure-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/exunit/exunit-failure-entry.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`ghc-gcc-phase-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ghc/ghc-gcc-phase-failure.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`nix-deprecation-warning`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-deprecation-warning.yaml) | warning | 6 | 3 | 0.667 (0.354) | 0.923 | 7.59b | diagnostic |
| [`nixfmt-fail-on-change`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nixfmt/nixfmt-fail-on-change.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`pnpm-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-error-tree.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`powershell-error-record`](https://github.com/luochen1990/log-skimmer-rules/blob/master/powershell/powershell-error-record.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`praktika-job-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/praktika/praktika-job-fail.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`praktika-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/praktika/praktika-run-failed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`pytest-conftest-import-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-conftest-import-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`rspec-failure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-failure-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`rustfmt-diff-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustfmt/rustfmt-diff-drift.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`treefmt-fail-on-change`](https://github.com/luochen1990/log-skimmer-rules/blob/master/treefmt/treefmt-fail-on-change.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`wait-on-check-conclusion-not-allowed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/wait-on-check/wait-on-check-conclusion-not-allowed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`zig-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-compile-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.384 | 7.59b | diagnostic |
| [`apt-package-unavailable`](https://github.com/luochen1990/log-skimmer-rules/blob/master/apt/apt-package-unavailable.yaml) | failure | 7 | 0 | 1 (0.646) | 1.384 | 7.37b | diagnostic |
| [`cargo-deny-check-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo-deny/cargo-deny-check-summary.yaml) | failure | 7 | 0 | 1 (0.646) | 1.384 | 7.37b | diagnostic |
| [`eslint-stylish-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-stylish-summary.yaml) | failure | 7 | 0 | 1 (0.646) | 1.384 | 7.37b | diagnostic |
| [`fastlane-exit-status`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fastlane/fastlane-exit-status.yaml) | failure | 7 | 0 | 1 (0.646) | 1.384 | 7.37b | diagnostic |
| [`fastlane-finished-with-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fastlane/fastlane-finished-with-errors.yaml) | failure | 7 | 0 | 1 (0.646) | 1.384 | 7.37b | diagnostic |
| [`fileutils-cannot-access`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fileutils/fileutils-cannot-access.yaml) | failure | 7 | 0 | 1 (0.646) | 1.384 | 7.37b | diagnostic |
| [`nix-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-build-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.384 | 7.37b | diagnostic |
| [`npm-audit-unresolved`](https://github.com/luochen1990/log-skimmer-rules/blob/master/npm/npm-audit-unresolved.yaml) | failure | 7 | 0 | 1 (0.646) | 1.384 | 7.37b | diagnostic |
| [`trivy-vuln-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-vuln-found.yaml) | failure | 7 | 0 | 1 (0.646) | 1.384 | 7.37b | diagnostic |
| [`tsc-diagnostic`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tsc/tsc-diagnostic.yaml) | failure | 7 | 0 | 1 (0.646) | 1.384 | 7.37b | diagnostic |
| [`actionlint-generate-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/actionlint/actionlint-generate-drift.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`bun-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bun/bun-test-fail.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`cargo-deny-lint-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo-deny/cargo-deny-lint-error.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`cargo-msrv-unsupported`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-msrv-unsupported.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`docker-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/docker/docker-build-failed.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`go-http-request-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-http-request-failed.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`gotestsum-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gotestsum/gotestsum-run-summary.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`minitest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/minitest/minitest-run-summary.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`phpstan-error-table`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpstan/phpstan-error-table.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`playwright-failed-test-header`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-failed-test-header.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`python-unittest-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-unittest/python-unittest-fail.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`semgrep-scan-start-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-scan-start-failed.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`tap-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tap/tap-test-failed.yaml) | failure | 8 | 0 | 1 (0.676) | 1.384 | 7.18b | diagnostic |
| [`bazel-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bazel/bazel-error.yaml) | failure | 9 | 0 | 1 (0.701) | 1.384 | 7.01b | diagnostic |
| [`git-push-rejected`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-push-rejected.yaml) | failure | 9 | 0 | 1 (0.701) | 1.384 | 7.01b | diagnostic |
| [`javac-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/javac/javac-compile-error.yaml) | failure | 9 | 0 | 1 (0.701) | 1.384 | 7.01b | diagnostic |
| [`jest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-run-summary.yaml) | failure | 9 | 0 | 1 (0.701) | 1.384 | 7.01b | diagnostic |
| [`jest-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-test-fail.yaml) | failure | 9 | 0 | 1 (0.701) | 1.384 | 7.01b | diagnostic |
| [`rspec-rerun-command`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-rerun-command.yaml) | failure | 9 | 0 | 1 (0.701) | 1.384 | 7.01b | diagnostic |
| [`shell-command-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/shell/shell-command-not-found.yaml) | failure | 9 | 0 | 1 (0.701) | 1.384 | 7.01b | diagnostic |
| [`node-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-uncaught-exception.yaml) | failure | 10 | 1 | 0.909 (0.623) | 1.259 | 6.86b | diagnostic |
| [`playwright-assert-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-assert-failed.yaml) | failure | 10 | 0 | 1 (0.722) | 1.384 | 6.86b | diagnostic |
| [`stack-structured-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/stack/stack-structured-error.yaml) | failure | 10 | 0 | 1 (0.722) | 1.384 | 6.86b | diagnostic |
| [`bun-script-exit-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bun/bun-script-exit-fail.yaml) | failure | 11 | 0 | 1 (0.741) | 1.384 | 6.72b | diagnostic |
| [`ninja-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ninja/ninja-failed.yaml) | failure | 11 | 0 | 1 (0.741) | 1.384 | 6.72b | diagnostic |
| [`cabal-structured-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cabal/cabal-structured-error.yaml) | failure | 12 | 0 | 1 (0.758) | 1.384 | 6.59b | diagnostic |
| [`codeql-action-job-status-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/codeql-action/codeql-action-job-status-failure.yaml) | failure | 12 | 0 | 1 (0.758) | 1.384 | 6.59b | diagnostic |
| [`gcc-clang-driver-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-driver-error.yaml) | failure | 12 | 0 | 1 (0.758) | 1.384 | 6.59b | diagnostic |
| [`ghc-source-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ghc/ghc-source-error.yaml) | failure | 12 | 0 | 1 (0.758) | 1.384 | 6.59b | diagnostic |
| [`maven-surefire-failures-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-surefire-failures-summary.yaml) | failure | 12 | 0 | 1 (0.758) | 1.384 | 6.59b | diagnostic |
| [`maven-surefire-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-surefire-test-failed.yaml) | failure | 12 | 0 | 1 (0.758) | 1.384 | 6.59b | diagnostic |
| [`turbo-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/turbo/turbo-run-failed.yaml) | failure | 12 | 0 | 1 (0.758) | 1.384 | 6.59b | diagnostic |
| [`ninja-build-stopped`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ninja/ninja-build-stopped.yaml) | failure | 13 | 0 | 1 (0.772) | 1.384 | 6.48b | diagnostic |
| [`pytest-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-test-failed.yaml) | failure | 14 | 0 | 1 (0.785) | 1.384 | 6.37b | diagnostic |
| [`vitest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/vitest/vitest-run-summary.yaml) | failure | 15 | 0 | 1 (0.796) | 1.384 | 6.27b | diagnostic |
| [`vitest-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/vitest/vitest-test-fail.yaml) | failure | 15 | 0 | 1 (0.796) | 1.384 | 6.27b | diagnostic |
| [`golangci-lint-issues-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/golangci-lint/golangci-lint-issues-summary.yaml) | failure | 16 | 0 | 1 (0.806) | 1.384 | 6.18b | diagnostic |
| [`phpunit-failed-asserting`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-failed-asserting.yaml) | failure | 17 | 0 | 1 (0.816) | 1.384 | 6.09b | diagnostic |
| [`rust-test-panic`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-test-panic.yaml) | warning | 18 | 1 | 0.947 (0.754) | 1.312 | 6.01b | diagnostic |
| [`github-actions-workflow-gate-echo`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-workflow-gate-echo.yaml) | failure | 19 | 1 | 0.95 (0.764) | 1.315 | 5.93b | diagnostic |
| [`ld-linker-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld/ld-linker-error.yaml) | failure | 19 | 3 | 0.864 (0.667) | 1.196 | 5.93b | diagnostic |
| [`gradle-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-case-failed.yaml) | failure | 21 | 0 | 1 (0.845) | 1.384 | 5.79b | diagnostic |
| [`gradle-test-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-summary-failed.yaml) | failure | 23 | 0 | 1 (0.857) | 1.384 | 5.66b | diagnostic |
| [`rustc-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustc/rustc-error-tree.yaml) | failure | 23 | 0 | 1 (0.857) | 1.384 | 5.66b | diagnostic |
| [`maven-goal-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-goal-failed.yaml) | failure | 24 | 1 | 0.96 (0.805) | 1.329 | 5.59b | diagnostic |
| [`pre-commit-hook-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pre-commit/pre-commit-hook-failed.yaml) | failure | 24 | 0 | 1 (0.862) | 1.384 | 5.59b | diagnostic |
| [`rust-libtest-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-libtest-failed.yaml) | failure | 24 | 0 | 1 (0.862) | 1.384 | 5.59b | diagnostic |
| [`rust-libtest-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-libtest-summary-failed.yaml) | failure | 24 | 0 | 1 (0.862) | 1.384 | 5.59b | diagnostic |
| [`cargo-could-not-compile`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-could-not-compile.yaml) | failure | 29 | 0 | 1 (0.883) | 1.384 | 5.32b | diagnostic |
| [`git-unified-diff-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-unified-diff-drift.yaml) | failure | 29 | 1 | 0.967 (0.833) | 1.338 | 5.32b | diagnostic |
| [`dependabot-update-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/dependabot/dependabot-update-errors.yaml) | failure | 31 | 0 | 1 (0.89) | 1.384 | 5.23b | diagnostic |
| [`pytest-failures-section`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-failures-section.yaml) | failure | 31 | 0 | 1 (0.89) | 1.384 | 5.23b | diagnostic |
| [`gcc-clang-diagnostic-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-diagnostic-error.yaml) | failure | 34 | 0 | 1 (0.898) | 1.384 | 5.09b | diagnostic |
| [`go-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-test-fail.yaml) | failure | 34 | 0 | 1 (0.898) | 1.384 | 5.09b | diagnostic |
| [`go-test-pkg-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-test-pkg-fail.yaml) | failure | 36 | 0 | 1 (0.904) | 1.384 | 5.01b | diagnostic |
| [`gradle-task-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-task-failed.yaml) | failure | 39 | 0 | 1 (0.91) | 1.384 | 4.89b | diagnostic |
| [`gradle-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-build-failed.yaml) | failure | 45 | 0 | 1 (0.921) | 1.384 | 4.69b | diagnostic |
| [`pnpm-elifecycle-exit`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-elifecycle-exit.yaml) | failure | 45 | 0 | 1 (0.921) | 1.384 | 4.69b | diagnostic |
| [`make-target-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/make/make-target-error.yaml) | failure | 53 | 0 | 1 (0.932) | 1.384 | 4.45b | diagnostic |
| [`python-traceback-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-traceback/python-traceback-uncaught-exception.yaml) | failure | 56 | 5 | 0.918 (0.822) | 1.271 | 4.37b | diagnostic |
| [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml) | failure | 348 | 7 | 0.98 (0.96) | 1.357 | 1.74b | boundary |
| [`github-actions-error-annotation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-error-annotation.yaml) | failure | 1141 | 7 | 0.994 (0.987) | 1.376 | 0.02b | trivial |
| [`github-actions-runner-version-info`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-runner-version-info.yaml) | info | 1160 | 446 | 0.722 (0.7) | 1 | -0.0b | boundary |
| [`nix-flake-attr-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-flake-attr-missing.yaml) | failure | 0 | 1 | 0 (0) | 0 | 0.0b | boundary |
| [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml) | failure | 0 | 2 | 0 (0) | 0 | 0.0b | boundary |
| [`trivy-misconf-failures`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-misconf-failures.yaml) | failure | 0 | 1 | 0 (0) | 0 | 0.0b | boundary |

## boundary / 异常 (人工审)

断裂带规则 (P_f ∈ (0.2, 0.8)) 或纯成功触发 (FP 形态) — 分布中不应存在, 出现即审:
- [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml): a/b=348/7 ppv=0.98 lift=1.357 — intent=failure 声明
- [`github-actions-runner-version-info`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-runner-version-info.yaml): a/b=1160/446 ppv=0.722 lift=1 — intent=info 声明
- [`nix-flake-attr-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-flake-attr-missing.yaml): a/b=0/1 ppv=0 lift=0 — intent=failure 声明
- [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml): a/b=0/2 ppv=0 lift=0 — intent=failure 声明
- [`trivy-misconf-failures`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-misconf-failures.yaml): a/b=0/1 ppv=0 lift=0 — intent=failure 声明

## 腐化预警

failure 规则的个体腐化快照 (连续性视角见下节):
- 0.8 < lift < 1.2 且 a+b ≥ 20 — 与结论解相关 (failure 规则应与失败正相关; lift≈1 = 常数化, 锚退化成了背景噪音; info 规则本应 lift≈1 故不在列):
  - [`ld-linker-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld/ld-linker-error.yaml): a/b=19/3 ppv=0.864 (lo 0.667) lift=1.196

## 死规则连续性

连续 ≥3 轮零命中 (per_rule_hits==0 连续在场; 锚随上游形态漂移失效, 候选重锚/退役):
- `forgejo-actions-poll-noise`: 连续 60 轮零命中
- `forgejo-actions-runner-version-info`: 连续 60 轮零命中
- `gitleaks-leaks-found`: 连续 60 轮零命中
- `nim-segv`: 连续 60 轮零命中
- `nix-fetch-input-noise`: 连续 60 轮零命中
- `nix-option-conflict`: 连续 60 轮零命中
- `trufflehog-secret-found`: 连续 60 轮零命中
- `trufflehog-unverified-secret`: 连续 60 轮零命中
- `codeowners-validator-checks-failed`: 连续 51 轮零命中
- `bun-error-json`: 连续 44 轮零命中
- `escript-exception`: 连续 40 轮零命中
- `gotestfmt-test-fail`: 连续 38 轮零命中
- `scorecard-action-error`: 连续 35 轮零命中
- `cargo-version-conflict`: 连续 34 轮零命中
- `systemd-ci-unit-fail`: 连续 32 轮零命中
- `api-extractor-semantic-error`: 连续 31 轮零命中
- `docker-registry-pull-failed`: 连续 31 轮零命中
- `homebrew-portable-ruby-failed`: 连续 31 轮零命中
- `phpunit-php-version-mismatch`: 连续 31 轮零命中
- `pyanalyze-error-findings`: 连续 31 轮零命中
- `qunit-headless-chrome-failed`: 连续 31 轮零命中
- `signtool-error`: 连续 31 轮零命中
- `uv-require-hashes-unpinned`: 连续 31 轮零命中
- `nix-buildenv-collision`: 连续 28 轮零命中
- `nix-download-failed`: 连续 28 轮零命中
- `nix-eval-missing-store-path`: 连续 28 轮零命中
- `nix-experimental-feature-disabled`: 连续 28 轮零命中
- `nix-flake-attr-not-derivation`: 连续 28 轮零命中
- `nix-getting-status-missing`: 连续 28 轮零命中
- `nix-hash-mismatch-fod`: 连续 28 轮零命中
- `nix-lockfile-missing-node`: 连续 28 轮零命中
- `nix-path-not-exist`: 连续 28 轮零命中
- `nix-pure-eval-restriction`: 连续 28 轮零命中
- `nix-remote-store-connection-failed`: 连续 28 轮零命中
- `nix-stack-overflow-recursion`: 连续 28 轮零命中
- `nix-syntax-error`: 连续 28 轮零命中
- `nix-undefined-variable-inline`: 连续 28 轮零命中
- `golangci-lint-config-invalid`: 连续 27 轮零命中
- `vite-plus-runtime-download-failed`: 连续 26 轮零命中
- `esbuild-build-failed`: 连续 21 轮零命中
- `cloudflare-api-error`: 连续 20 轮零命中
- `go-mod-tidy-diff`: 连续 20 轮零命中
- `pip-install-error`: 连续 20 轮零命中
- `docusaurus-bundle-error`: 连续 18 轮零命中
- `erlang-signal-stack-failed`: 连续 14 轮零命中
- `fastlane-itms-probe-failed`: 连续 14 轮零命中
- `webpack-hook-error`: 连续 13 轮零命中
- `mage-drift-gate-echo`: 连续 12 轮零命中
- `semgrep-invalid-api-key`: 连续 11 轮零命中
- `cabal-build-failed`: 连续 10 轮零命中
- `cabal-changelog-validation-failed`: 连续 10 轮零命中
- `opencv-dnn-test-error`: 连续 10 轮零命中
- `git-http-access-denied`: 连续 9 轮零命中
- `mordant-findings-over-baseline`: 连续 9 轮零命中
- `npm-missing-script`: 连续 9 轮零命中
- `stack-hackage-verification-error`: 连续 9 轮零命中
- `wait-on-check-never-run`: 连续 9 轮零命中
- `flutter-bots-command-failed`: 连续 8 轮零命中
- `ruby-name-error`: 连续 8 轮零命中
- `size-limit-exceeded`: 连续 8 轮零命中
- `swift-docc-compile-failed`: 连续 7 轮零命中
- `verify-pr-title-invalid`: 连续 7 轮零命中
- `npm-config-error`: 连续 6 轮零命中
- `csc-diagnostic-error`: 连续 5 轮零命中
- `infra-disk-quota-exceeded`: 连续 5 轮零命中
- `podman-image-copy-failed`: 连续 5 轮零命中
- `checkstyle-error`: 连续 4 轮零命中
- `codecov-upload-failed`: 连续 4 轮零命中
- `esbuild-js-api-tests-failed`: 连续 4 轮零命中
- `go-toolchain-mismatch`: 连续 4 轮零命中
- `proselint-finding`: 连续 4 轮零命中
- `mastodon-github-action-post-error`: 连续 3 轮零命中
- `node-test-fail`: 连续 3 轮零命中

## intent 声明 vs 统计核对

- info 规则应 lift ≈ 1.0 (触发与结论独立); 偏离 >20% 列出:
- (全部 info 规则独立性与声明相符)
- failure 规则 b>0 (成功样本触发) = FP 形态/容忍子失败边界:
- [`deno-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/deno/deno-test-failed.yaml): b=1, ppv=0.8
- [`forgejo-actions-job-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/forgejo-actions/forgejo-actions-job-failed.yaml): b=1, ppv=0.75
- [`git-unified-diff-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-unified-diff-drift.yaml): b=1, ppv=0.967
- [`github-actions-annotation-substantive`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-annotation-substantive.yaml): b=7, ppv=0.98
- [`github-actions-cache-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-cache-not-found.yaml): b=1, ppv=0.833
- [`github-actions-error-annotation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-error-annotation.yaml): b=7, ppv=0.994
- [`github-actions-workflow-gate-echo`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-workflow-gate-echo.yaml): b=1, ppv=0.95
- [`ld-linker-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld/ld-linker-error.yaml): b=3, ppv=0.864
- [`maven-goal-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-goal-failed.yaml): b=1, ppv=0.96
- [`nix-flake-attr-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-flake-attr-missing.yaml): b=1, ppv=0
- [`node-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-uncaught-exception.yaml): b=1, ppv=0.909
- [`python-traceback-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-traceback/python-traceback-uncaught-exception.yaml): b=5, ppv=0.918
- [`rust-io-no-such-file`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-io-no-such-file.yaml): b=1, ppv=0.667
- [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml): b=2, ppv=0
- [`trivy-misconf-failures`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-misconf-failures.yaml): b=1, ppv=0
