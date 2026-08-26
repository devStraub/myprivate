---
id: curriculum-observability-performance-reliability
title: 16 — Observability, Performance & Reliability
type: curriculum-module
status: draft
curriculum_state: planned
created: 2026-08-26
updated: 2026-08-26
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: structure
    date: 2026-08-26
sources: []
related: [../curriculum.md, ../learning-methodology.md, ../public-labs.md]
visibility: private
---

# 16 — Observability, Performance & Reliability

## Objetivo

Medir comportamento, diagnosticar falhas e projetar confiabilidade com evidência operacional.

## Tópicos alvo

- logs, metrics e traces;
- structured logging e correlation IDs;
- distributed tracing e OpenTelemetry;
- profiling e benchmarking;
- latency, throughput e percentiles p50/p95/p99;
- CPU, memory, I/O e bottlenecks;
- caching e load testing;
- availability, redundancy e graceful degradation;
- fault tolerance e health checks;
- SLA, SLO, SLI e error budgets;
- incident response e postmortem;

## Projeto público sugerido

`lab-observability-reliability`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- falha induzida pode ser localizada usando telemetria;
- correlation/tracing conecta partes do fluxo quando aplicável;
- inclui load/performance experiment reproduzível;
- usa percentis em vez de apenas média quando apropriado;
- documenta SLI/SLO de laboratório e limitações;
- produz pequeno postmortem de uma falha simulada;


## Requisitos pedagógicos

O Codex deve produzir implementação funcional, testes, comentários didáticos, README e `STUDY_GUIDE.md`. O proprietário deve percorrer o código seguindo o fluxo, questionar decisões, executar experimentos relevantes e completar o loop privado de avaliação descrito em [`../learning-methodology.md`](../learning-methodology.md).

Não existe carga horária mínima nem exigência de autoria manual do código.

## Evidência e estado

- material preparado pode ser consultado como parte da trilha;
- `studied` depende da confirmação humana após o ciclo de estudo;
- `applied` exige o laboratório público cobrindo os requisitos;
- `professional` exige evidência profissional distinta e sanitizada;
- score de avaliação não é persistido.

## Referências acadêmicas relacionadas

- Stanford Systems: reliability e fault tolerance;
- MIT experimentation/design;
- adaptação profissional de SRE/observability;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
