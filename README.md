# Log Skimmer Rules

[English](README.md) | [简体中文](README.zh-CN.md)

Rule set for CI log extraction — describes "what failure evidence looks like" for various tools (anchor line + multi-line extension), consumed at runtime by the [log-skimmer](https://github.com/luochen1990/log-skimmer) engine. **Community-maintained + agent-assisted**: PRs are welcome, including rules drafted by AI agents (declare provenance in the `attribution` field).

[![backtest](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fluochen1990%2Flog-skimmer-rules%2Freports%2Fbadges%2Fverdict.json)](https://github.com/luochen1990/log-skimmer-rules/blob/reports/latest.md)
[![corpus](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fluochen1990%2Flog-skimmer-rules%2Freports%2Fbadges%2Fcorpus.json)](https://github.com/luochen1990/log-skimmer-rules/blob/reports/latest.md)
[![quality](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fluochen1990%2Flog-skimmer-rules%2Freports%2Fbadges%2Fquality.json)](https://github.com/luochen1990/log-skimmer-rules/blob/reports/latest.md)
[![compression](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fluochen1990%2Flog-skimmer-rules%2Freports%2Fbadges%2Fcompression.json)](https://github.com/luochen1990/log-skimmer-rules/blob/reports/latest.md)
[![coverage](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fluochen1990%2Flog-skimmer-rules%2Freports%2Fbadges%2Fcoverage.json)](https://github.com/luochen1990/log-skimmer-rules/blob/reports/rules-health.md)

> Live metrics: badges and the [full backtest report](https://github.com/luochen1990/log-skimmer-rules/blob/reports/latest.md) are auto-published by the weekly sweep (`reports` branch) — numbers are never hand-maintained, and this README stays qualitative. Per-rule health (PPV/lift/information content/grade) lives in [rules-health.md](https://github.com/luochen1990/log-skimmer-rules/blob/reports/rules-health.md).
>
> Scope: this README targets rule contributors — layout overview, field overview, labeling discipline, and the contribution flow. The single source of truth for the rule YAML format, state-machine semantics, and L0 statistics is the engine repo's spec ([docs/rule-format.en.md](https://github.com/luochen1990/log-skimmer/blob/master/docs/rule-format.en.md) — English translation; the normative SSOT is [docs/rule-format.md](https://github.com/luochen1990/log-skimmer/blob/master/docs/rule-format.md) in Chinese); this document is a quick reference with pointers.

## 1. Rule Set at a Glance

- Layout: `<tool-id>/<rule-id>.yaml`, one rule per file (e.g. `nix/nix-eval-error-tree.yaml`).
- `tool-id` is a folksonomy convention name: no central registry — a rule file's existence defines the ID (lowercase letters/digits/hyphens).
- `rule-id` takes the form `<tool-id>-<semantic-name>`, globally unique; loading two rules with the same id is an error.
- Tool coverage is defined by the top-level directories (**the directory tree is the manifest**, folksonomy existence-is-definition — tools are not re-enumerated in this README, avoiding merge conflicts).

## 2. Field Semantics at a Glance

| Field | Required | Default | Semantics |
| --- | --- | --- | --- |
| id | required | — | unique rule identifier, `<tool-id>-<semantic-name>`, must be prefixed by the tool value |
| title | required | — | one-line human-readable description |
| tool | required | — | tool dimension; must match the directory name |
| Effective scope | — | — | decided solely by **storage location** (spec §1.S): rules in this repo = global layer; project-specific rules live in the project repo at `<repo>/.log-skimmer/rules/`. The `scope`/`repo` fields are retired — do not write them |
| patterns | required | — | state-machine pattern chain (≥1 item); `patterns[0]` is the anchor — the only way a block opens |
| kind | required | — | `signal` extracts signal fragments; `noise` marks noise lines (covered lines are dropped from the output) |
| intent | optional | failure | `failure` / `warning` / `info` — what a hit means for the pass/fail verdict |
| confidence | optional | medium | `high` / `medium` / `low`; inherited by fragments, a presentation-order hint |
| category | optional | unknown | closed enum of 10 values, information category; omitted means unknown |
| context | optional | before: 0, after: 0 | output boundary extension in lines (0–10 each); affects output only, never the state machine |
| attribution | conditionally required | null | rule provenance declaration; required when adapter/agent-generated, omitted for hand-written rules |

The detailed adjudication criteria for the three intent values and ten category values are not repeated here — see spec §1 and the engine repo's docs/category-survey.md.

## 3. Labeling Discipline

Core principle: **prefer missing over wrong**.

- Mislabeled (category/intent not matching reality) pollutes query semantics — downstream consumers filter programmatically on these fields; a mislabel is undetectable and misleads globally, while unknown only loses that one rule's filtering value.
- Always label `unknown` when: multiple mixed causes prevent a unique classification / insufficient samples leave you unsure / backtesting shows the rule hits multiple log classes / the category falls outside the enum (a set-evolution signal — record samples in the PR).
- `kind: noise` rules must omit intent; signal rules default to intent `failure` — relabel to `warning` or `info` only after the semantic layering is confirmed.
- An unknown share persistently >40% triggers a set review; upgrading an unknown to a named value goes through PR with human confirmation; flaky is an attribute, not a category — it does not enter category.

## 4. Contribution Flow

1. Start by copying `.github/_template.yaml` and save as `<tool-id>/<rule-id>.yaml` (the template lives under the hidden `.github/` path, which engine loading skips — it never enters the production rule set).
2. Record sample provenance in the header comment: `# samples: <repo>/<run>-<job>, ...` (samples come from the public [log-skimmer-corpus](https://github.com/luochen1990/log-skimmer-corpus) corpus repo; header comments are the human-readable rule↔sample tracing clue). Also consider writing the why narrative (matching rationale for the anchor/extension regexes and host-prefix tolerance considerations) — reference examples: [nix/nix-eval-error-tree.yaml](nix/nix-eval-error-tree.yaml), [bun/bun-error-json.yaml](bun/bun-error-json.yaml).
3. **Verify the hit locally** (the only gate on a rule being "useful"): run the engine CLI over **the real log that motivated the rule**: `log-skimmer skim <sample.log> --rules .` (from this repo's root; for engine build instructions see the [log-skimmer README](https://github.com/luochen1990/log-skimmer#quick-start)), and confirm your rule id appears in the human-readable block header (`--- [L..-L..] <rule-id>`) — i.e. the anchor really matches. When the corpus has no samples for a tool, PR lint CI only verifies "do no harm" (loads legally + no backtest regression) and will **not** verify that the new rule hits anything — local hit verification is the only gating step for rule effectiveness.
4. Open a PR — CI automatically checks: rule loading legality + whole-corpus backtest (FN=0 / FP rate ≤2% / zero-block=0) + compression master-vs-PR dual-run comparison (engine and corpus identical on both sides, isolating the rules variable; regression >2% is red).
5. Rule syntax errors (regex compile failure / enum out of range / field constraint violations) are caught at the CI load stage; a single violating rule makes the whole rule set fail to load — the verification command from step 3 surfaces load errors locally first, so a single-sample check by the contributor suffices; there is no need to run the engine repo's `just ci-merge` locally (the heavyweight full gate is the engine maintainers' regression tool).

## 5. CI Gate Split: lint (per-PR point-in-time regression) × sweep (weekly drift watch)

| Gate | Trigger | Semantics |
| --- | --- | --- |
| [lint](.github/workflows/lint.yml) | PR / master push | **Point-in-time regression**: pre-merge check — rule loading + whole-corpus assertions + master-vs-PR compression dual-run (same engine, same corpus, isolating the rules variable), answering "does this PR make the status quo worse?". It is the quality gate for rule PRs. |
| [sweep](.github/workflows/sweep.yml) | Tue 03:00 UTC / manual | **Between-PRs drift watch**: full report of master rules × latest corpus (after Monday's corpus refresh) (job summary: gated/exempt groups + per-repo breakdown + rule×repo matrix; full JSON in artifacts), compared against the last successful run (engine `--base` built-in comparison, per-repo compression relative regression >2% is red), answering "in the gap between two PRs, did the world's evolution quietly degrade master?". |
| [auto-merge](.github/workflows/auto-merge.yml) | PR ready/synced (`agent/fn-*` only) | **Tier A auto-merge**: ready PRs passing the full mechanical assertion chain (CI all green / additive-only / motivating samples present / size caps) are squash-merged automatically; failures are labeled for humans — the assertion chain and safety argument are in §6 and the `.github/scripts/auto-merge.sh` header comment. |

A first sweep run without a previous artifact is a legal initial state (comparison skipped, report and assertions only); a red sweep is a "last week → this week" regression signal, attributable to the aggregate drift of ruleset/engine/corpus between the two points — it needs human triage.

**Rules bundle artifact**: each sweep also publishes [rules-bundle.json](https://github.com/luochen1990/log-skimmer-rules/blob/reports/rules-bundle.json) to the reports branch — a single file carrying all rules **verbatim**, for consumers that cannot enumerate directories (e.g. a browser userscript fetching via `raw.githubusercontent.com`, CORS-clean), feeding the engine `(path, yaml)` pairs one by one. `rule_count` counts **rules the engine successfully loaded**, asserted against the rules array length at generation time; the format contract SSOT is the [make-rules-bundle.sh header comment](.github/scripts/make-rules-bundle.sh). lint rehearses the generation at PR time (the assertion moves before merge; nothing is pushed).

## 6. Agent Auto-Response (FN Contract)

FN reds on master CI (failed samples yielding zero failure-intent fragments after skimming with the rule set) are responded to by the **maintainer's automated agent** — no community action needed. The agent goes through exactly the same channel as human contributors (branch + PR), under this contract:

- **Artifact shape**: a rule PR on branch `agent/fn-<run_id>` plus a companion attribution issue; every PR/issue body always contains a `dedup-key: run <run_id>` line — both the agent's run-level dedup anchor (a given run is responded to at most once) and the human-check anchor for "has this run already been handled?". Rule PR bodies additionally carry one `dedup-sample: <sample path>` line **per covered FN sample** (sample path = verbatim `evidence[].sample` from fn-evidence.json) — an in-flight declaration for the sweep wake gate (sample-level dedup, see below) and the human-check anchor for response coverage.
- **draft → ready semantics**: agent-drafted PRs start as **draft**; flipped to **ready** once CI is green. Ready only means the agent did its best; the merge decision belongs to the Tier A gate's mechanical assertion chain (below), semantic review belongs to humans (Tier B, deferred).
- **Mechanical red lines**: the agent never merges / approves / force-pushes — merge-family tools are structurally absent from the agent's MCP allowlist; the repo-side defense is the Tier A assertion chain admitting only additive-only agent PRs.
- **Tier A auto-merge (mechanical assertion chain, ruled 2026-10-25)**: ready agent PRs are evaluated by the [auto-merge](.github/workflows/auto-merge.yml) gate; merged only if all pass: head is this repo's `agent/fn-<run_id>` (same-named fork branches don't count) / CI all green (all check-runs success on the head sha; an empty set rejects) / **additive-only** (only new single-layer `<tool>/<rule>.yaml`; deletions/modifications/out-of-scope paths reject) / motivating samples still in the corpus (guards against "idling green" after sample rotation) / size ≤3 files and ≤60 lines. Any violation → label `auto-merge-skipped` + reason comment, escalated to humans. Safety argument: a new rule only adds failure-fragments (FN can only go down); hiding a failure would require modifying existing rules (excluded by additive-only); FP is capped by the lint ≤2% assertion — the worst case is a useless rule landing in master, exposed by the next sweep red, healed by revert (self-limiting failure). Assertion-chain SSOT: `.github/scripts/auto-merge.sh` header comment.
- **Iteration cap**: if PR CI is red 3 rounds in a row, iteration stops — the PR stays draft and an issue reports the blocker for human triage.

CI-side data plane: lint's verdict violation details are produced machine-readably as the `l0-verdict` artifact (see §5) for the agent's iteration loop; sweep's FN events additionally produce **`fn-evidence.json`** — an FN sample anchor-line evidence digest (verdict fn detail sample list × corpus-generic failure-keyword window ±5 lines, ≤30 anchor lines per sample / ≤256KB total), published through both the `fn-evidence` artifact and the reports branch, letting the agent reason without the corpus — **the corpus never leaves the CI runner** (v2 data-plane principle).

Wake plane: sweep FN events go through **mechanical gated set-difference** (this round's FN samples − last round's snapshot on the reports branch − in-flight claims) — a `repository_dispatch` (`event_type: fn-responder-wake`, `client_payload` carrying `run_id` and the new-sample list) wakes the agent **only when FN samples not covered by in-flight responses appear**; steady-state repeated reds send nothing (zero downstream token cost), while the sweep red gate itself stays red. The dispatch's downstream chain = the `.github/workflows/fn-wake.yml` workflow listener: its runs are the agent-service `github_dispatch` trigger's sensing edge (the runs API is the only dispatch surface that can be polled — the events feed doesn't include dispatch events), and it writes the `client_payload` verbatim to `fn-wake.json` on the `fn-wake` branch (data plane; the responder fetches it via raw URL without authentication — client_payload never touches any API surface). In-flight claims: the `dedup-sample:` lines above, valid for the whole life of an open PR, and still valid within a **12h cooldown window** after merge — preventing repeated wakes in the "merged but not yet healed" window; still failing past the window = an escalation signal, the declaration expires and re-waking is allowed. Gate data-fetch failures always over-send (better an extra wake than a silent miss); implementation in `.github/scripts/fn-dispatch-gate.sh`.

## 7. Agent 自动响应 (Diagnostic Gap 契约)

sweep 的 summary artifact 另含 `diagnostic_gaps` (诊断缺口: 失败样本缺诊断级规则命中, 附 `hit_rules` 与候选行定位线索 — 引擎侧产出, **非 CI 红事件**, 是诊断覆盖债的增量面), 由维护者的 **dg-responder** agent 按增量响应。与 §6 FN 契约同骨架 (分支 + 规则 PR 草稿 + 永不自动合并), 差异面:

- **唤醒**: sweep 的 DG 门控 ([.github/scripts/dg-dispatch-gate.sh](.github/scripts/dg-dispatch-gate.sh)) 差集判定 — 本拍 gaps − 上拍基线 (上次成功 run 的 `l0-summary` artifact) − 在途声明, 新增非空才发 `repository_dispatch` (`event_type: dg-responder-wake`, `client_payload` = `run_id` + DiagnosticGap 精简形样本, ≤64KB); 冷启动 (无基线) 基线采纳零派发 (存量积压不自动洪灌, 下拍起增量生效); 每拍 ≤20。dispatch 下游链 = [.github/workflows/dg-wake.yml](.github/workflows/dg-wake.yml) 监听 workflow: `client_payload` 原文落 `dg-wake` 分支 `dg-wake.json` (孤儿单提交强推, raw URL 免认证读取)。
- **在途声明**: PR body 一行 `dg-samples: <逗号分隔样本路径>` (对偶 §6 的 `dedup-sample:`, open 全程有效)。
- **全景 SSOT**: 本节只做指针 — 契约全文与响应器行为见引擎仓 [docs/diagnostic-loop.md](https://github.com/luochen1990/log-skimmer/blob/master/docs/diagnostic-loop.md)。

## License

Rules and documentation in this repo are released under CC0 1.0 (see [LICENSE](LICENSE)) — no rights reserved; free to reuse and redistribute.
