# Report / Handoff Template

## TL;DR
- **Goal/Outcome:**
- **Status:** (green/yellow/red)
- **Owners:**
- **Important Dates:**

## Summary
- What changed and why
- User impact / customer promise
- Risks or caveats (link to PRs/issues)

## API / Backend
- **Endpoints:** (method + path + purpose)
- **Requests:** required/optional fields, validation, auth
- **Responses:** shape, pagination, error semantics
- **Compatibility:** versioning, rollout order, fallback behavior
- **Examples:** cURL / HTTPie samples for happy path + failure
- **Observability:** metrics/logs/traces to watch; alert thresholds

## Frontend / UI
- **Entry Points:** routes, feature flags, experiments
- **States:** loading, success, empty, error (with copy)
- **UX Notes:** accessibility, localization, offline behavior, perf budgets
- **Assets:** screenshots or links to designs
- **QA Notes:** manual steps, device/browser coverage

## Data & Events
- **Schema changes:** migrations, seeds, data backfills
- **Events:** name, payload, trigger, consumers, dashboards
- **Privacy/Security:** PII handling, retention, access controls

## Deployment & Rollback
- **Prereqs:** configs, secrets, infra toggles
- **Rollout plan:** flags, canaries, sequencing
- **Rollback:** steps, data recovery, who approves

## Action Items
- [ ] API client updates (owner, due date)
- [ ] Frontend integration (owner, due date)
- [ ] Docs/support updates (owner, due date)
- [ ] Monitoring/alerts (owner, due date)
- [ ] Open questions / follow-ups
