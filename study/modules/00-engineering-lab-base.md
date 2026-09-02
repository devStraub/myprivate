---
id: curriculum-engineering-lab-base
title: 00 — Engineering Lab Base
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

# 00 — Engineering Lab Base

## Objetivo

Criar uma base mínima, reutilizável e propositalmente simples para laboratórios que se beneficiem de um domínio comum.

## Tópicos alvo

- Java moderno e Spring Boot;
- PostgreSQL;
- JUnit;
- Docker;
- domínio pequeno: Customer, Product, Order e Payment;
- README de execução e limites intencionais;

## Projeto público sugerido

`developer-lab-base`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- base inicia localmente de forma reproduzível;
- testes essenciais passam;
- domínio é pequeno e não contém arquitetura/infraestrutura sofisticada sem necessidade;
- pode ser copiada ou derivada sem carregar dependências irrelevantes;


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

- MIT EECS: software development e computer systems como áreas de formação;
- Stanford CS: Engineering Fundamentals e Systems como base geral;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
