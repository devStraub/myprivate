---
id: curriculum-software-engineering
title: 05 — Software Engineering
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

# 05 — Software Engineering

## Objetivo

Desenvolver julgamento sobre design de código, manutenção, mudança e fluxo de engenharia.

## Tópicos alvo

- abstraction, encapsulation, cohesion e coupling;
- separation of concerns e information hiding;
- composition e dependency inversion;
- SOLID, DRY, KISS, YAGNI e Law of Demeter;
- clean code e code smells;
- refactoring e technical debt;
- naming, error handling e defensive programming;
- Strategy, Factory, Builder, Adapter, Decorator, Observer, Command, State, Template Method, Chain of Responsibility e Proxy;
- quando não usar patterns;
- Git, branching, commits, code review, PRs, semantic versioning e releases;

## Projeto público sugerido

`lab-software-engineering`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- apresenta before/after ou histórico claro de refactoring;
- cada mudança importante tem justificativa;
- testes preservam comportamento relevante;
- documenta pelo menos um caso em que aplicar pattern aumentaria complexidade sem benefício;


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

- MIT 6-3: software engineering;
- MIT curriculum: design, laboratory e experimentation;
- Stanford CS core/senior project como aplicação integrada;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
