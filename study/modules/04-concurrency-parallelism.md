---
id: curriculum-concurrency-parallelism
title: 04 — Concurrency & Parallelism
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

# 04 — Concurrency & Parallelism

## Objetivo

Reconhecer problemas concorrentes, explicar memory visibility e selecionar mecanismos de coordenação adequados.

## Tópicos alvo

- process vs thread;
- concurrency vs parallelism;
- race condition e critical section;
- mutual exclusion;
- synchronization, locks e semaphores;
- atomic operations e volatile;
- memory visibility e happens-before;
- deadlock, livelock e starvation;
- thread pools e futures;
- asynchronous programming;
- reactive concepts;
- virtual threads e structured concurrency;
- parallel processing;

## Projeto público sugerido

`lab-java-concurrency`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- contém pelo menos um exemplo deliberadamente incorreto;
- reproduz race condition ou visibility problem;
- implementa mais de uma correção e compara trade-offs;
- inclui cenário de deadlock ou prevenção quando aplicável;
- mede comportamento/performance sem prometer generalização indevida;


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

- Stanford Systems: concurrency e parallel computing;
- MIT EECS: computer systems engineering;
- CMU: parallel and sequential computation;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
