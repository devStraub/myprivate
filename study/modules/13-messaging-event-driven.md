---
id: curriculum-messaging-event-driven
title: 13 — Messaging & Event-Driven Systems
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

# 13 — Messaging & Event-Driven Systems

## Objetivo

Entender brokers, delivery semantics e arquiteturas dirigidas a eventos, inclusive seus failure modes.

## Tópicos alvo

- queues, topics, pub/sub e brokers;
- producers e consumers;
- at-most-once, at-least-once e exactly-once semantics;
- ordering e partitioning;
- consumer groups e backpressure;
- retries e DLQ;
- domain events e integration events;
- event notification e event-carried state transfer;
- event sourcing e CQRS;
- Kafka como referência principal e RabbitMQ como comparação conceitual;

## Projeto público sugerido

`lab-event-driven-kafka`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- usa Kafka ou broker equivalente de forma reproduzível;
- demonstra redelivery/duplicação;
- implementa idempotência do consumidor;
- demonstra retry/DLQ ou failure handling equivalente;
- explica ordering/partitioning;
- documenta quando Kafka não seria a escolha ideal;


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

- Stanford Systems: distributed/large-scale systems;
- MIT systems + software engineering;
- adaptação profissional para messaging/event-driven architecture;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
