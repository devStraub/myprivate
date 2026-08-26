---
id: curriculum-system-design-scalability
title: 20 — System Design & Scalability
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

# 20 — System Design & Scalability

## Objetivo

Integrar fundamentos anteriores para desenhar sistemas sob requisitos funcionais e não funcionais explícitos.

## Tópicos alvo

- requirements funcionais e não funcionais;
- capacity estimation;
- API e data model;
- components e communication;
- vertical/horizontal scaling;
- load balancing e caching;
- CDN;
- partitioning e replication;
- queues e async processing;
- consistency, availability e durability;
- fault tolerance, backpressure e graceful degradation;
- estudos: URL shortener, chat, notifications, payments, storage, feeds, search/autocomplete;

## Projeto público sugerido

`lab-system-design`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- define requisitos antes da arquitetura;
- inclui estimativas de capacidade coerentes;
- diagramas e ADRs refletem trade-offs;
- projeta estratégia de escala e falha;
- implementa apenas uma fatia necessária para validar decisões;
- explica alternativas rejeitadas;


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

- Stanford Systems + Information;
- MIT systems + algorithms/software engineering;
- CMU systems/theory/AI breadth;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
