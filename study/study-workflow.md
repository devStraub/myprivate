---
id: study-workflow
title: AI-First Study Workflow
type: workflow
status: draft
created: 2026-08-23
updated: 2026-09-01
agents:
  - provider: openai
    model: unknown
    role: structure
    date: 2026-08-23
  - provider: openai
    model: gpt-5.6-sol
    role: consolidation
    date: 2026-08-26
sources: []
related:
  - study/curriculum.md
  - study/learning-methodology.md
  - study/public-labs.md
  - study/scouting/README.md
  - study/backlog/README.md
  - study/sessions/README.md
  - templates/study-session.md
  - governance/validation-checklist.md
visibility: private
origin: ai-assisted
---

# AI-First Study Workflow

## Purpose

Turn a curriculum module, approved backlog item, source, or real problem into useful understanding and reusable reference material without confusing AI output with human learning.

There is no required weekly cadence. Capture may continue for any period; consolidation happens when the owner chooses.

## End-to-end flow

1. **Choose** a module or approved study item from the curriculum, backlog, scouting review, or current need.
2. **Inspect** existing knowledge, sources, decisions, gaps, and prior evidence before generating new material.
3. **Source** claims with primary material whenever practical and register relevant provenance.
4. **Choose the smallest format**: direct explanation first; use a snippet, existing project, or new executable lab only when it materially improves understanding or evidence.
5. **Study** by reading the material, running prepared scenarios, and asking questions.
6. **Tutor** through explanation, counterexamples, alternative models, and direct links to code or evidence.
7. **Consult continuously** whenever a doubt appears, without a mandatory exam or module-closing ritual.
8. **Revisit** specific material and scenarios when useful, even after moving to another topic.
9. **Confirm** any resulting state or evidence with the owner; never promote automatically.
10. **Consolidate** useful material into knowledge, decisions, sessions, profile evidence, or a public sanitized lab when the owner requests it.

## Selection and scouting

Scouting is an optional observation layer, not a prerequisite for every study session. It may identify changes, unknown topics, market signals, or gaps. Relevant findings move to the backlog only after review.

Neither scouting nor backlog presence proves competence. Both remain linked to their sources and confidence.

## Source discipline

- Prefer official documentation, specifications, standards, academic material, and reproducible experiments.
- Record source URLs and retrieval dates when external claims matter.
- Separate source-backed facts from inference and personal judgment.
- Re-check time-sensitive claims before consolidation.

## AI roles

### Builder

Creates the smallest useful lab, tests, README, supporting documentation, and `STUDY_GUIDE.md`. Code comments should explain intent, tradeoffs, invariants, and failure modes—not translate syntax line by line. Scenarios must be complete and selectable; the owner should not need to rewrite relevant code merely to observe the intended contrast.

### Tutor

Explains concepts, asks diagnostic questions, proposes experiments, and adapts the next explanation to observed gaps.

The same agent may perform multiple roles, but the output of any role remains AI-generated material until the owner reviews it.

See [learning-methodology.md](learning-methodology.md) for the complete roles and continuous-consultation rules.

## Continuous consultation protocol

- Answer doubts at the point where they arise, using the smallest relevant portion of the material.
- Relate explanations to a prepared scenario, test, source, or code path whenever possible.
- Offer a different explanation or counterexample when the first model is insufficient.
- Do not impose a fixed question set, score, pass condition, or attempt count.
- Allow topics to remain open and revisitable indefinitely.
- Persist only useful, owner-approved conclusions, decisions, follow-up items, and evidence.

## Knowledge handling classification

For each consolidated item, decide whether the owner should:

- **Internalize** — understand and recall it directly.
- **Recognize** — know when it matters and how to find reliable detail.
- **Externalize** — preserve it as a checklist, reference, decision, template, or automation.
- **Delegate** — let a tool perform it while retaining enough understanding to review the result.

## Applied evidence and public labs

A module reaches `applied` only after an appropriate public, sanitized project or lab exists and the owner confirms that its requirements were met. AI-generated implementation does not imply manual authorship, understanding, or professional experience.

Follow [public-labs.md](public-labs.md) for repository structure, tests, documentation, and publication safeguards.

## Consolidation and human approval

During consolidation:

1. Keep useful and sourceable content.
2. Correct or discard noise, duplicates, unverifiable claims, and sensitive material.
3. Preserve uncertainty instead of inventing certainty.
4. Propose updates to canonical records.
5. Require explicit human approval for claims about skills, understanding, application, or professional experience.

## Portable capture

On another device, an agent may create drafts in the portable capture locations after following the repository instructions. Those drafts remain unverified input. Returning them to the main machine does not trigger automatic consolidation, state advancement, or profile updates.

The owner decides when to run consolidation; the interval may be a day, a week, several weeks, or any other convenient period.
