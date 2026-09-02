---
id: curriculum-databases-data-engineering
title: 07 — Databases & Data Engineering
type: curriculum-module
status: draft
curriculum_state: planned
created: 2026-08-26
updated: 2026-09-01
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

# 07 — Databases & Data Engineering

## Objetivo

Entender bancos relacionais e não relacionais por modelos, internals, transações e trade-offs.

## Tópicos alvo

- relational model e relational algebra;
- schema design, normalization e denormalization;
- constraints e SQL avançado;
- joins, subqueries, CTE e window functions;
- pages, B-tree/hash indexes;
- query planner, execution plans e statistics;
- buffers/cache e WAL;
- ACID e isolation levels;
- dirty/non-repeatable/phantom reads e lost update;
- MVCC, locking e deadlocks;
- replication, partitioning, sharding e pooling;
- document, key-value, column e graph stores;
- eventual consistency e SQL vs NoSQL;

## Projeto público sugerido

`lab-database-engineering`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- usa PostgreSQL como referência principal;
- inclui modelagem e queries não triviais;
- compara plano antes/depois de índice ou otimização;
- demonstra pelo menos um fenômeno transacional/concorrente;
- inclui benchmark controlado e limitações;
- documenta quando NoSQL poderia ou não ser apropriado;


## Requisitos pedagógicos

O Codex deve produzir implementação funcional, testes, comentários didáticos, README e `STUDY_GUIDE.md`. O proprietário deve percorrer o código seguindo o fluxo, questionar decisões, executar os cenários relevantes e consultar o material livremente sempre que surgir uma dúvida, conforme [`../learning-methodology.md`](../learning-methodology.md).

Não existe carga horária mínima nem exigência de autoria manual do código.

## Evidência e estado

- material preparado pode ser consultado como parte da trilha;
- `studied` depende da confirmação humana após o ciclo de estudo;
- `applied` exige o laboratório público cobrindo os requisitos;
- `professional` exige evidência profissional distinta e sanitizada;
- não há prova, score ou condição obrigatória de aprovação; dúvidas e revisões podem ocorrer a qualquer momento.

## Referências acadêmicas relacionadas

- Stanford Systems/Information: databases e data systems;
- MIT 6-3: computer systems;
- CMU: systems foundations;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
