---
id: curriculum-software-architecture
title: 11 — Software Architecture
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

# 11 — Software Architecture

## Objetivo

Modelar boundaries e tomar decisões arquiteturais explícitas por atributos de qualidade e trade-offs.

## Tópicos alvo

- architectural characteristics e quality attributes;
- coupling, cohesion, boundaries, components e modules;
- layered, modular monolith, hexagonal, clean, onion, microservices, event-driven, pipes/filters e serverless;
- DDD: ubiquitous language, bounded contexts, aggregates, entities, value objects, domain/application services e domain events;
- ADR, RFC, C4 e architecture diagrams;
- trade-off analysis e evolutionary architecture;

## Projeto público sugerido

`lab-software-architecture`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- compara pelo menos duas arquiteturas ou uma arquitetura com baseline;
- usa o mesmo domínio quando a comparação exigir;
- possui ADRs reais;
- diagramas refletem código;
- explica por que uma arquitetura mais simples pode ser melhor;
- não adiciona microservices sem problema que os justifique;


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

- MIT 6-3: software engineering e systems;
- Stanford Systems;
- adaptação profissional focada em architecture e design decisions;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
