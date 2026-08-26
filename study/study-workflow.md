---
id: study-workflow
title: AI-First Study Workflow
type: workflow
status: draft
created: 2026-08-23
updated: 2026-08-26
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

Turn a curriculum module, approved backlog item, source, or real problem into verified understanding and reusable evidence without confusing AI output with human learning.

There is no required weekly cadence. Capture may continue for any period; consolidation happens when the owner chooses.

## End-to-end flow

1. **Choose** a module or approved study item from the curriculum, backlog, scouting review, or current need.
2. **Inspect** existing knowledge, sources, decisions, gaps, and prior evidence before generating new material.
3. **Source** claims with primary material whenever practical and register relevant provenance.
4. **Build** a minimal executable lab, tests, documentation, and study guide when the subject benefits from application.
5. **Study** by reading the material, questioning it, and changing experiments or code.
6. **Tutor** through explanation, counterexamples, alternative models, and targeted exercises.
7. **Assess privately** with approximately ten unique conceptual questions balanced across fundamentals, application, and scenarios.
8. **Diagnose gaps** from wrong or shallow answers and repeat targeted study with new questions.
9. **Confirm** the resulting state and evidence with the owner; never promote automatically.
10. **Consolidate** useful material into knowledge, decisions, sessions, profile evidence, or a public sanitized lab.

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

Creates the smallest useful lab, tests, README, supporting documentation, and `STUDY_GUIDE.md`. Code comments should explain intent, tradeoffs, invariants, and failure modes—not translate syntax line by line.

### Tutor

Explains concepts, asks diagnostic questions, proposes experiments, and adapts the next explanation to observed gaps.

### Examiner

Runs a temporary private assessment using new questions for each cycle. It checks conceptual correctness rather than exact wording.

The same agent may perform multiple roles, but the output of any role remains AI-generated material until the owner reviews it.

See [learning-methodology.md](learning-methodology.md) for the complete role and assessment rules.

## Private assessment protocol

- Use approximately ten questions: roughly three fundamentals, four application questions, and three scenarios.
- Do not reuse questions during remediation.
- Diagnose the concept behind each relevant error.
- Continue with targeted explanations and new questions until no material conceptual gaps remain or the owner stops the cycle.
- Do not persist grades, percentages, rankings, attempt counts, or full question-and-answer history.
- Persist only useful conclusions: confirmed state, identified gaps, decisions, follow-up items, and approved evidence.

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
