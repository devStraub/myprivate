---
id: curriculum-distributed-systems
title: 12 — Distributed Systems
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

# 12 — Distributed Systems

## Objetivo

Raciocinar sobre falhas parciais, consistência, replicação e coordenação em sistemas distribuídos.

## Tópicos alvo

- network failures, partial failure e latency;
- clocks e ordering;
- consistency e availability;
- CAP e PACELC;
- strong/eventual consistency, linearizability e causal consistency;
- leader/follower, multi-leader e leaderless replication;
- quorum;
- consensus e visão conceitual de Raft/Paxos;
- idempotency, retries, timeout, circuit breaker e bulkhead;
- saga, transactional outbox e CDC;
- distributed locks e leader election;

## Projeto público sugerido

`lab-distributed-systems`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- simula falhas obrigatoriamente;
- demonstra duplicação/retry/idempotência;
- torna algum trade-off de consistência observável;
- inclui pelo menos um pattern de consistência/transação distribuída;
- documenta limites do laboratório e por que “dois microservices” não basta para provar entendimento;


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

- Stanford Systems: distributed and large-scale systems, reliability e fault tolerance;
- MIT EECS: computer systems engineering;
- CMU M.S.: Systems requirement;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
