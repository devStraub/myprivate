---
id: curriculum-programming-languages-jvm
title: 03 — Programming Languages & JVM
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

# 03 — Programming Languages & JVM

## Objetivo

Entender paradigmas, tipos e o comportamento da plataforma Java abaixo dos frameworks.

## Tópicos alvo

- imperative, object-oriented, functional e declarative;
- static/dynamic e strong/weak typing;
- type systems, generics e variance;
- immutability, closures, higher-order e pure functions;
- reflection, annotations e metaprogramming;
- bytecode e class loading;
- JIT;
- stack, heap e metaspace;
- garbage collection;
- object allocation e escape analysis;
- profiling;
- records, sealed classes, pattern matching, streams, Optional, modules e virtual threads;

## Projeto público sugerido

`lab-java-jvm`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- compara código fonte e bytecode em exemplos selecionados;
- demonstra memória/alocação ou GC de forma observável;
- inclui profiling simples;
- mostra pelo menos dois paradigmas/abordagens e seus trade-offs;


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

- MIT 6-3: programming languages;
- Stanford Theory: design/analysis of programming languages;
- CMU: imperative + functional programming;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
