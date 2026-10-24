# 规则健康档案 (每轮 sweep 自动刷新)

- 诊断覆盖率: **555/970 = 57.22%** — 含 ≥1 诊断规则失败块的失败族样本占比
- 分级: restating 1 / diagnostic 119 / boundary 1 (共 121 条触发规则; 死规则见 job summary)

## 怎么读

- **a / b**: 失败族 / 成功样本命中数 (样本级)
- **PPV (lo95)**: P(失败|触发) 及 Wilson 95% 下界 — 触发推出失败的可靠度; b=0 时 PPV=1.0, 下界随样本量增长
- **lift**: PPV / 失败基率 — 与结论的相关性 (1.0 = 独立; info 常数规则应 ≈1.0)
- **spec**: -log2(a/N_f) 比特 — 触发携带的样本信息量 (选择性; 0 = 处处触发零信息)
- **分级**: restating = 触发由结论决定 (安全网, 不计覆盖); diagnostic = 内容决定 (计覆盖); boundary = 断裂带/异常 (人工审, 暂计覆盖)

## 全规则健康表 (spec 降序)

| 规则 | intent | a | b | PPV (lo95) | lift | spec | 分级 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [`bun-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bun/bun-test-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`busted-htest-error-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-error-entry.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`github-actions-raw-error-command`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-raw-error-command.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`lintcommit-invalid-message`](https://github.com/luochen1990/log-skimmer-rules/blob/master/lintcommit/lintcommit-invalid-message.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`mocha-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mocha/mocha-test-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`mypy-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mypy/mypy-found-errors.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`mypy-type-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/mypy/mypy-type-error.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`nvim-test-assertion-detail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-assertion-detail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`nvim-test-run-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-run-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`plenary-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/plenary/plenary-test-fail.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`plenary-tests-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/plenary/plenary-tests-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml) | failure | 1 | 1 | 0.5 (0.095) | 0.693 | 9.92b | diagnostic |
| [`swift-testing-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift-testing/swift-testing-test-failed.yaml) | failure | 1 | 0 | 1 (0.207) | 1.387 | 9.92b | diagnostic |
| [`bazel-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bazel/bazel-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`cargo-msrv-unsupported`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-msrv-unsupported.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`csc-diagnostic-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/csc/csc-diagnostic-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`emmylua-diagnostic`](https://github.com/luochen1990/log-skimmer-rules/blob/master/emmylua/emmylua-diagnostic.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`escript-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/escript/escript-exception.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`flutter-bots-command-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/flutter-bots/flutter-bots-command-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`git-push-auth-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-push-auth-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`git-push-rejected`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-push-rejected.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`go-mod-fetch-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-mod-fetch-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`javac-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/javac/javac-compile-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`nvim-test-failure-list-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nvim-test/nvim-test-failure-list-entry.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`oxlint-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/oxlint/oxlint-found-errors.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`prettier-check-drift`](https://github.com/luochen1990/log-skimmer-rules/blob/master/prettier/prettier-check-drift.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`swiftc-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swiftc/swiftc-compile-error.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`tsc-diagnostic`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tsc/tsc-diagnostic.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`xctest-assert-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/xctest/xctest-assert-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`xctest-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/xctest/xctest-test-case-failed.yaml) | failure | 2 | 0 | 1 (0.342) | 1.387 | 8.92b | diagnostic |
| [`clang-format-lint-diff`](https://github.com/luochen1990/log-skimmer-rules/blob/master/clang-format/clang-format-lint-diff.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`eslint-stylish-offense`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-stylish-offense.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`eslint-stylish-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/eslint/eslint-stylish-summary.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`go-toolchain-mismatch`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-toolchain-mismatch.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`gotestsum-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gotestsum/gotestsum-run-summary.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`maven-goal-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-goal-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`maven-wrapper-main-missing`](https://github.com/luochen1990/log-skimmer-rules/blob/master/maven/maven-wrapper-main-missing.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`msbuild-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/msbuild/msbuild-build-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`nix-eval-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-eval-error-tree.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`python-unittest-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-unittest/python-unittest-fail.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`turbo-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/turbo/turbo-run-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`verify-pr-title-invalid`](https://github.com/luochen1990/log-skimmer-rules/blob/master/verify-pr-title/verify-pr-title-invalid.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`wait-on-check-conclusion-not-allowed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/wait-on-check/wait-on-check-conclusion-not-allowed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`zig-build-command-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-build-command-failed.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`zig-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/zig/zig-compile-error.yaml) | failure | 3 | 0 | 1 (0.438) | 1.387 | 8.34b | diagnostic |
| [`busted-htest-failed-test-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-failed-test-entry.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 7.92b | diagnostic |
| [`busted-htest-failure-banner`](https://github.com/luochen1990/log-skimmer-rules/blob/master/busted-htest/busted-htest-failure-banner.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 7.92b | diagnostic |
| [`exunit-failed-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/exunit/exunit-failed-summary.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 7.92b | diagnostic |
| [`forgejo-actions-job-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/forgejo-actions/forgejo-actions-job-failed.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 7.92b | diagnostic |
| [`git-fetch-ref-not-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/git/git-fetch-ref-not-found.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 7.92b | diagnostic |
| [`minitest-failure-report`](https://github.com/luochen1990/log-skimmer-rules/blob/master/minitest/minitest-failure-report.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 7.92b | diagnostic |
| [`minitest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/minitest/minitest-run-summary.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 7.92b | diagnostic |
| [`nixfmt-fail-on-change`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nixfmt/nixfmt-fail-on-change.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 7.92b | diagnostic |
| [`node-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node-test/node-test-fail.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 7.92b | diagnostic |
| [`phpunit-failures-banner`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-failures-banner.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 7.92b | diagnostic |
| [`treefmt-fail-on-change`](https://github.com/luochen1990/log-skimmer-rules/blob/master/treefmt/treefmt-fail-on-change.yaml) | failure | 4 | 0 | 1 (0.51) | 1.387 | 7.92b | diagnostic |
| [`ctest-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ctest/ctest-test-failed.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.6b | diagnostic |
| [`fastlane-exit-status`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fastlane/fastlane-exit-status.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.6b | diagnostic |
| [`github-actions-checkout-ref-mismatch`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-checkout-ref-mismatch.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.6b | diagnostic |
| [`go-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-compile-error.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.6b | diagnostic |
| [`phpstan-error-table`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpstan/phpstan-error-table.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.6b | diagnostic |
| [`phpstan-found-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpstan/phpstan-found-errors.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.6b | diagnostic |
| [`python-logging-critical-message`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-logging/python-logging-critical-message.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.6b | diagnostic |
| [`rspec-failure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-failure-error.yaml) | failure | 5 | 1 | 0.833 (0.436) | 1.156 | 7.6b | diagnostic |
| [`wait-on-check-never-run`](https://github.com/luochen1990/log-skimmer-rules/blob/master/wait-on-check/wait-on-check-never-run.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.6b | diagnostic |
| [`webpack-hook-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/webpack/webpack-hook-error.yaml) | failure | 5 | 0 | 1 (0.566) | 1.387 | 7.6b | diagnostic |
| [`cmake-configure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cmake/cmake-configure-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.34b | diagnostic |
| [`cocoon-wait-for-tests-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cocoon/cocoon-wait-for-tests-failed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.34b | diagnostic |
| [`copilot-cli-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/copilot/copilot-cli-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.34b | diagnostic |
| [`exunit-failure-entry`](https://github.com/luochen1990/log-skimmer-rules/blob/master/exunit/exunit-failure-entry.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.34b | diagnostic |
| [`fastlane-finished-with-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/fastlane/fastlane-finished-with-errors.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.34b | diagnostic |
| [`msvc-compiler-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/msvc/msvc-compiler-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.34b | diagnostic |
| [`nix-deprecation-warning`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-deprecation-warning.yaml) | warning | 6 | 0 | 1 (0.61) | 1.387 | 7.34b | diagnostic |
| [`pytest-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-test-failed.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.34b | diagnostic |
| [`swift-build-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/swift-build/swift-build-error.yaml) | failure | 6 | 0 | 1 (0.61) | 1.387 | 7.34b | diagnostic |
| [`bun-error-json`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bun/bun-error-json.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.11b | diagnostic |
| [`ctest-tests-failed-list`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ctest/ctest-tests-failed-list.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.11b | diagnostic |
| [`nix-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/nix/nix-build-failed.yaml) | failure | 7 | 0 | 1 (0.646) | 1.387 | 7.11b | diagnostic |
| [`golangci-lint-config-invalid`](https://github.com/luochen1990/log-skimmer-rules/blob/master/golangci-lint/golangci-lint-config-invalid.yaml) | failure | 8 | 0 | 1 (0.676) | 1.387 | 6.92b | diagnostic |
| [`kotlinc-compile-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/kotlinc/kotlinc-compile-error.yaml) | failure | 8 | 0 | 1 (0.676) | 1.387 | 6.92b | diagnostic |
| [`phpunit-failed-asserting`](https://github.com/luochen1990/log-skimmer-rules/blob/master/phpunit/phpunit-failed-asserting.yaml) | failure | 8 | 0 | 1 (0.676) | 1.387 | 6.92b | diagnostic |
| [`pnpm-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-error-tree.yaml) | failure | 8 | 0 | 1 (0.676) | 1.387 | 6.92b | diagnostic |
| [`praktika-job-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/praktika/praktika-job-fail.yaml) | failure | 8 | 0 | 1 (0.676) | 1.387 | 6.92b | diagnostic |
| [`praktika-run-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/praktika/praktika-run-failed.yaml) | failure | 8 | 0 | 1 (0.676) | 1.387 | 6.92b | diagnostic |
| [`trivy-vuln-found`](https://github.com/luochen1990/log-skimmer-rules/blob/master/trivy/trivy-vuln-found.yaml) | failure | 8 | 0 | 1 (0.676) | 1.387 | 6.92b | diagnostic |
| [`bun-script-exit-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/bun/bun-script-exit-fail.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.75b | diagnostic |
| [`golangci-lint-issues-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/golangci-lint/golangci-lint-issues-summary.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.75b | diagnostic |
| [`rustc-error-tree`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rustc/rustc-error-tree.yaml) | failure | 9 | 0 | 1 (0.701) | 1.387 | 6.75b | diagnostic |
| [`rspec-rerun-command`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-rerun-command.yaml) | failure | 10 | 0 | 1 (0.722) | 1.387 | 6.6b | diagnostic |
| [`ninja-build-stopped`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ninja/ninja-build-stopped.yaml) | failure | 11 | 0 | 1 (0.741) | 1.387 | 6.46b | diagnostic |
| [`node-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/node/node-uncaught-exception.yaml) | failure | 11 | 0 | 1 (0.741) | 1.387 | 6.46b | diagnostic |
| [`gradle-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-case-failed.yaml) | failure | 12 | 1 | 0.923 (0.667) | 1.28 | 6.34b | diagnostic |
| [`ninja-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ninja/ninja-failed.yaml) | failure | 12 | 0 | 1 (0.758) | 1.387 | 6.34b | diagnostic |
| [`ghc-gcc-phase-failure`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ghc/ghc-gcc-phase-failure.yaml) | failure | 13 | 0 | 1 (0.772) | 1.387 | 6.22b | diagnostic |
| [`gradle-test-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-summary-failed.yaml) | failure | 13 | 1 | 0.929 (0.685) | 1.288 | 6.22b | diagnostic |
| [`cabal-structured-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cabal/cabal-structured-error.yaml) | failure | 14 | 0 | 1 (0.785) | 1.387 | 6.11b | diagnostic |
| [`go-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-test-fail.yaml) | failure | 14 | 0 | 1 (0.785) | 1.387 | 6.11b | diagnostic |
| [`jest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-run-summary.yaml) | failure | 14 | 0 | 1 (0.785) | 1.387 | 6.11b | diagnostic |
| [`jest-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/jest/jest-test-fail.yaml) | failure | 14 | 0 | 1 (0.785) | 1.387 | 6.11b | diagnostic |
| [`tap-test-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/tap/tap-test-failed.yaml) | failure | 14 | 0 | 1 (0.785) | 1.387 | 6.11b | diagnostic |
| [`stack-structured-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/stack/stack-structured-error.yaml) | failure | 15 | 0 | 1 (0.796) | 1.387 | 6.01b | diagnostic |
| [`gcc-clang-driver-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-driver-error.yaml) | failure | 16 | 0 | 1 (0.806) | 1.387 | 5.92b | diagnostic |
| [`playwright-failed-test-header`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-failed-test-header.yaml) | failure | 16 | 0 | 1 (0.806) | 1.387 | 5.92b | diagnostic |
| [`vitest-run-summary`](https://github.com/luochen1990/log-skimmer-rules/blob/master/vitest/vitest-run-summary.yaml) | failure | 17 | 0 | 1 (0.816) | 1.387 | 5.83b | diagnostic |
| [`vitest-test-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/vitest/vitest-test-fail.yaml) | failure | 17 | 0 | 1 (0.816) | 1.387 | 5.83b | diagnostic |
| [`cargo-could-not-compile`](https://github.com/luochen1990/log-skimmer-rules/blob/master/cargo/cargo-could-not-compile.yaml) | failure | 19 | 0 | 1 (0.832) | 1.387 | 5.67b | diagnostic |
| [`dependabot-update-errors`](https://github.com/luochen1990/log-skimmer-rules/blob/master/dependabot/dependabot-update-errors.yaml) | failure | 20 | 0 | 1 (0.839) | 1.387 | 5.6b | diagnostic |
| [`ld-linker-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/ld/ld-linker-error.yaml) | failure | 20 | 0 | 1 (0.839) | 1.387 | 5.6b | diagnostic |
| [`playwright-assert-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/playwright/playwright-assert-failed.yaml) | failure | 23 | 0 | 1 (0.857) | 1.387 | 5.4b | diagnostic |
| [`pytest-failures-section`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pytest/pytest-failures-section.yaml) | failure | 23 | 0 | 1 (0.857) | 1.387 | 5.4b | diagnostic |
| [`gcc-clang-diagnostic-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gcc-clang/gcc-clang-diagnostic-error.yaml) | failure | 24 | 0 | 1 (0.862) | 1.387 | 5.34b | diagnostic |
| [`go-test-pkg-fail`](https://github.com/luochen1990/log-skimmer-rules/blob/master/go/go-test-pkg-fail.yaml) | failure | 24 | 0 | 1 (0.862) | 1.387 | 5.34b | diagnostic |
| [`rust-test-panic`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-test-panic.yaml) | warning | 24 | 1 | 0.96 (0.805) | 1.331 | 5.34b | diagnostic |
| [`rust-libtest-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rust/rust-libtest-failed.yaml) | failure | 25 | 0 | 1 (0.867) | 1.387 | 5.28b | diagnostic |
| [`gradle-task-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-task-failed.yaml) | failure | 32 | 0 | 1 (0.893) | 1.387 | 4.92b | diagnostic |
| [`pnpm-elifecycle-exit`](https://github.com/luochen1990/log-skimmer-rules/blob/master/pnpm/pnpm-elifecycle-exit.yaml) | failure | 32 | 0 | 1 (0.893) | 1.387 | 4.92b | diagnostic |
| [`python-traceback-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-traceback/python-traceback-uncaught-exception.yaml) | failure | 32 | 1 | 0.97 (0.847) | 1.345 | 4.92b | diagnostic |
| [`gradle-build-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-build-failed.yaml) | failure | 41 | 0 | 1 (0.914) | 1.387 | 4.56b | diagnostic |
| [`make-target-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/make/make-target-error.yaml) | failure | 52 | 0 | 1 (0.931) | 1.387 | 4.22b | diagnostic |
| [`github-actions-error-annotation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-error-annotation.yaml) | failure | 961 | 5 | 0.995 (0.988) | 1.379 | 0.01b | restating |
| [`github-actions-runner-version-info`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-runner-version-info.yaml) | info | 967 | 375 | 0.721 (0.696) | 0.999 | 0.0b | boundary |

## boundary / 异常 (人工审)

断裂带规则 (P_f ∈ (0.2, 0.8)) 或纯成功触发 (FP 形态) — 分布中不应存在, 出现即审:
- [`github-actions-runner-version-info`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-runner-version-info.yaml): a/b=967/375 ppv=0.721 lift=0.999 — intent=info 声明

## 腐化预警

failure 规则的个体腐化快照 (连续性视角见下节):
无 — 个体健全。

## 死规则连续性

连续 ≥3 轮零命中 (per_rule_hits==0 连续在场; 锚随上游形态漂移失效, 候选重锚/退役):
- `checkstyle-error`: 连续 12 轮零命中
- `forgejo-actions-poll-noise`: 连续 12 轮零命中
- `forgejo-actions-runner-version-info`: 连续 12 轮零命中
- `gitleaks-leaks-found`: 连续 12 轮零命中
- `nim-segv`: 连续 12 轮零命中
- `nix-fetch-input-noise`: 连续 12 轮零命中
- `nix-option-conflict`: 连续 12 轮零命中
- `pip-install-error`: 连续 12 轮零命中
- `redis-server-bugreport`: 连续 12 轮零命中
- `systemd-ci-unit-fail`: 连续 12 轮零命中
- `trivy-misconf-failures`: 连续 12 轮零命中
- `trufflehog-secret-found`: 连续 12 轮零命中
- `trufflehog-unverified-secret`: 连续 12 轮零命中
- `cargo-version-conflict`: 连续 11 轮零命中
- `maven-surefire-failures-summary`: 连续 9 轮零命中
- `maven-surefire-test-failed`: 连续 9 轮零命中
- `eslint-offense-line`: 连续 4 轮零命中
- `pyright-error-summary`: 连续 4 轮零命中
- `pyright-type-error`: 连续 4 轮零命中
- `size-limit-exceeded`: 连续 4 轮零命中
- `codeowners-validator-checks-failed`: 连续 3 轮零命中
- `redis-test-err`: 连续 3 轮零命中
- `redis-test-exception`: 连续 3 轮零命中
- `scorecard-action-error`: 连续 3 轮零命中

## intent 声明 vs 统计核对

- info 规则应 lift ≈ 1.0 (触发与结论独立); 偏离 >20% 列出:
- (全部 info 规则独立性与声明相符)
- failure 规则 b>0 (成功样本触发) = FP 形态/容忍子失败边界:
- [`github-actions-error-annotation`](https://github.com/luochen1990/log-skimmer-rules/blob/master/github-actions/github-actions-error-annotation.yaml): b=5, ppv=0.995
- [`gradle-test-case-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-case-failed.yaml): b=1, ppv=0.923
- [`gradle-test-summary-failed`](https://github.com/luochen1990/log-skimmer-rules/blob/master/gradle/gradle-test-summary-failed.yaml): b=1, ppv=0.929
- [`python-traceback-uncaught-exception`](https://github.com/luochen1990/log-skimmer-rules/blob/master/python-traceback/python-traceback-uncaught-exception.yaml): b=1, ppv=0.97
- [`rspec-failure-error`](https://github.com/luochen1990/log-skimmer-rules/blob/master/rspec/rspec-failure-error.yaml): b=1, ppv=0.833
- [`semgrep-findings`](https://github.com/luochen1990/log-skimmer-rules/blob/master/semgrep/semgrep-findings.yaml): b=1, ppv=0.5
