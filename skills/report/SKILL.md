---
name: report
description: Create engineering-ready reports with clear API/frontend handoffs and stakeholder context
supporting_files:
  - handoff-template.md
---

# Reporting Workflow

Use this skill whenever you need to turn engineering work into a concise, trustworthy report that downstream teams can execute on without clarifications.

## When to Use
- Feature launches or iterations that affect customers or partners
- API/back-end changes that require client updates
- Frontend releases that change flows, copy, or surface behavior
- Incident/rollback notes that need to be shared with stakeholders

## Required Inputs
- Scope and audience (product, eng leads, QA, support, GTM)
- Source facts (tickets/PRs, metrics, experiment results, incident timelines)
- Integration details (API contracts, UI states, deployment steps)
- Owner and delivery channel (doc link, status post, ticket update)

## Workflow
1) **Frame the report**
   - Identify decision-makers and consumers (who must sign off, who just needs awareness).
   - Choose delivery channel: status doc, PR comment, release note, or incident update.
   - State purpose up front: decision, heads-up, or unblock.

2) **Collect evidence**
   - Summarize what changed: APIs, data models, migrations, UI flows, feature flags.
   - Capture verification: tests run, environments covered, manual steps executed.
   - Pull impact signals: key metrics, experiment deltas, incident blast radius.

3) **Document integration requirements**
   - **API/Backend:** endpoints, request/response schemas, auth, rollout/compat plans.
   - **Frontend/UI:** entry points, states, copy, accessibility/locale notes, offline behavior.
   - **Data/Events:** analytics or audit events added/changed, expected consumers.
   - **Operational:** feature flags, migrations, rollback levers, known risks/edge cases.

4) **Compose using the template**
   - Start from `handoff-template.md`; fill every placeholder (delete unused sections explicitly).
   - Keep executive summary ≤5 sentences; link to deeper artifacts (PRs, dashboards, runbooks).
   - Call out owner, due dates, and blockers in a dedicated checklist.

5) **Validate handoff readiness**
   - Dry-run API calls (happy path + failure) and paste examples.
   - Screenshot or record UI states relevant to stakeholders.
   - Confirm feature flag defaults and rollback plan are documented.
   - Ask a peer reviewer to simulate implementation using only the report. Fix gaps they find.

6) **Deliver and track**
   - Post to the chosen channel with TL;DR + action items + owners.
   - Tag teams for required actions (QA signoff, API client update, docs change).
   - Create follow-up tasks for any deferred items; link them in the report.

## API & Frontend Handoff Notes
- Provide **data contracts**: required/optional fields, enums, pagination, rate limits, timeouts.
- Specify **versioning and compatibility**: how long old clients keep working, deprecation dates, flag rollout order.
- Include **UI acceptance criteria**: state transitions, loading/error/empty states, copy variants, responsive constraints.
- Attach **reference artifacts**: OpenAPI snippets, cURL examples, component screenshots, and analytics event specs.
- Call out **operational owners** for cutovers (DB migrations, feature flag flips, cache invalidation, CDN changes).

## What Good Looks Like
- Stakeholders can implement changes **without asking clarifying questions**.
- API and frontend teams receive **actionable contracts and examples**.
- Risks, rollback steps, and monitoring hooks are **explicit**.
- Owners and due dates are **documented and traceable**.

## Supporting Files
- `handoff-template.md` — Copy this template when creating a report to keep API/front-end details aligned.
