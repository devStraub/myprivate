---
id: evolving-curriculum
title: Developer Toolbox — Software Engineering Curriculum
type: curriculum
status: draft
curriculum_version: 1.0
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
  - study/academic-references.md
  - study/learning-methodology.md
  - study/public-labs.md
  - study/modules/README.md
  - study/scouting/README.md
  - study/backlog/README.md
  - areas/README.md
visibility: private
origin: ai-assisted
---

# Developer Toolbox — Software Engineering Curriculum

## Purpose

Maintain a versioned and extensible computer science and software engineering curriculum for the owner. It is a navigation system, not a fixed-duration course, degree, certification, or claim of mastery.

The curriculum has no mandatory weekly hours, semester boundaries, or artificial completion deadline. Consolidation may happen whenever the owner decides that enough material and evidence have accumulated.

## Relationship to the existing Toolbox

- `study/curriculum.md` is the official macro-level learning map.
- `study/modules/` defines target subjects and suggested public evidence.
- `study/scouting/` observes external change and possible gaps; it is not competence evidence.
- `study/backlog/` turns approved gaps and interests into an operational queue.
- `study/sessions/` records actual study activity.
- `knowledge/` holds reusable knowledge after review and consolidation.
- `areas/` remains the stable professional topic map used by the repository.

## Operating phases

### Phase A — Curriculum and Knowledge Base

1. Select a module or backlog item.
2. Inspect existing knowledge, sources, decisions, and evidence.
3. Prepare or update the module, lab, tests, documentation, and study guide.

Prepared material is only a study asset. It does not prove that the owner studied, understood, applied, or professionally used the topic.

A module does not require its own project. Direct explanations and reusable knowledge notes are sufficient
when they make the concepts clear. Labs are optional instruments for observability or public applied evidence,
not mandatory containers for every topic.

### Phase B — Study, Understanding, and Public Evidence

1. Study the prepared material through reading, questions, and experiments.
2. Ask questions and consult the material whenever doubts arise.
3. Revisit explanations and prepared scenarios as needed, without a mandatory assessment cycle.
4. When appropriate, publish a sanitized lab or project as applied evidence.
5. Record only the state and evidence that a human has approved.

## Curriculum states

`curriculum_state` tracks progress through this curriculum and is distinct from the canonical personal `learning_state` defined by governance.

| State | Meaning |
|---|---|
| `planned` | The module exists in the curriculum. |
| `prepared` | Study material or a lab was prepared, but learning is not implied. |
| `in_progress` | The owner is actively studying the module. |
| `studied` | The planned material was reviewed by the owner. |
| `validated` | Optional owner-confirmed state based on practical use and reflection, without a mandatory assessment. |
| `applied` | A public, sanitized lab or project demonstrates personal application. |
| `professional` | Separate, sanitized evidence supports professional application. |

State advancement is never automatic or required to continue studying. Duration, repository activity, or AI-generated output must not be treated as proof of understanding.

## Core curriculum — version 1.0

| # | Module | Suggested public evidence |
|---|---|---|
| 00 | [Engineering Lab Base](modules/00-engineering-lab-base.md) | Reusable Java/Spring/PostgreSQL/JUnit/Docker lab base |
| 01 | [Computer Science Foundations](modules/01-computer-science-foundations.md) | Reusable knowledge notes; public lab optional |
| 02 | [Algorithms and Data Structures](modules/02-algorithms-data-structures.md) | `lab-algorithms-data-structures` |
| 03 | [Programming Languages and JVM](modules/03-programming-languages-jvm.md) | `lab-jvm-language-runtime` |
| 04 | [Concurrency and Parallelism](modules/04-concurrency-parallelism.md) | `lab-concurrency-parallelism` |
| 05 | [Software Engineering](modules/05-software-engineering.md) | `lab-software-engineering-practices` |
| 06 | [Testing and Software Quality](modules/06-testing-software-quality.md) | `lab-testing-software-quality` |
| 07 | [Databases and Data Engineering](modules/07-databases-data-engineering.md) | `lab-databases-data-engineering` |
| 08 | [Computer Systems and Operating Systems](modules/08-computer-systems-operating-systems.md) | `lab-computer-systems-os` |
| 09 | [Networking and Web Fundamentals](modules/09-networking-web-fundamentals.md) | `lab-networking-web-fundamentals` |
| 10 | [Backend Engineering and API Design](modules/10-backend-api-design.md) | `lab-backend-api-design` |
| 11 | [Software Architecture](modules/11-software-architecture.md) | `lab-software-architecture` |
| 12 | [Distributed Systems](modules/12-distributed-systems.md) | `lab-distributed-systems` |
| 13 | [Messaging and Event-Driven Systems](modules/13-messaging-event-driven.md) | `lab-event-driven-messaging` |
| 14 | [Security Engineering](modules/14-security-engineering.md) | `lab-security-engineering` |
| 15 | [Cloud, Containers and DevOps](modules/15-cloud-containers-devops.md) | `lab-cloud-containers-devops` |
| 16 | [Observability, Performance and Reliability](modules/16-observability-performance-reliability.md) | `lab-observability-performance-reliability` |
| 17 | [Frontend Engineering and HCI](modules/17-frontend-engineering-hci.md) | `lab-frontend-hci` |
| 18 | [AI and Machine Learning Foundations](modules/18-ai-ml-foundations.md) | `lab-ai-ml-foundations` |
| 19 | [AI Engineering and LLM Systems](modules/19-ai-engineering-llm.md) | `lab-ai-engineering-llm-systems` |
| 20 | [System Design and Scalability](modules/20-system-design-scalability.md) | `lab-system-design-scalability` |
| 21 | [Engineering Practices, Product and Technical Leadership](modules/21-engineering-practices-product-leadership.md) | `lab-engineering-leadership-practices` |

## Coverage by stable Toolbox areas

The existing area map remains valid. The curriculum adds depth without creating a competing taxonomy.

| Toolbox area | Primary modules |
|---|---|
| Architecture | 11, 20 |
| Code Quality | 05, 06 |
| Testing | 06 |
| Databases | 07 |
| APIs | 09, 10 |
| Security | 14 |
| Performance | 16 |
| Observability | 16 |
| Concurrency | 04 |
| Distributed Systems | 12 |
| Integration | 10, 13 |
| Debugging | 05, 16 |
| AI-Assisted Engineering | 19, 21 |

See [areas/README.md](../areas/README.md) for the canonical area definitions.

## Evolution policy

- Extend the curriculum through reviewed modules or explicit version changes.
- Use scouting to propose additions, not to silently rewrite the map.
- Preserve prior evidence and provenance when a module changes.
- Record structural curriculum changes in `CHANGELOG.md`.
- Keep public evidence sanitized and separate from private work artifacts.

## Philosophy

> Coding is delegated. Understanding is not.

> Knowledge learned privately should become knowledge shared publicly when it can be sanitized safely.
