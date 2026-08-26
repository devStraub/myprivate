---
id: curriculum-testing-software-quality
title: 06 — Testing & Software Quality
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

# 06 — Testing & Software Quality

## Objetivo

Projetar uma estratégia de qualidade que use testes como evidência em níveis adequados.

## Tópicos alvo

- unit, integration, component, contract, end-to-end, acceptance e regression testing;
- mocks, stubs, spies, fakes e fixtures;
- parameterized, property-based e mutation testing;
- Testcontainers;
- testing pyramid e test trophy;
- determinism, flaky tests e isolation;
- coverage e seus limites;
- TDD e BDD;
- static analysis, complexity, maintainability e quality gates;

## Projeto público sugerido

`lab-software-testing`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- demonstra múltiplos níveis de teste com justificativa;
- inclui pelo menos um teste de integração realista;
- mostra um caso em que coverage alto não garante qualidade;
- inclui mutation/property-based ou alternativa avançada apropriada;
- documenta trade-offs de velocidade, fidelidade e manutenção;


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
- prática de laboratory/experimentation do MIT;
- Stanford Senior Project como integração e validação prática;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
