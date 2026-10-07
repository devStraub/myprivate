---
id: evidence-driven-change
title: Mudança orientada por evidências e preservação de comportamento
type: pattern
pattern_kind: good-practice
status: provisional
confidence: medium
created: 2026-09-14
updated: 2026-09-14
last_reviewed: 2026-09-14
domains: [debugging, testing, ai-assisted-development]
technologies: []
tags: [evidence, behavior-preservation, progressive-validation]
origin: [professional-experience, ai-assisted-analysis]
learning_state: applied-professionally
eligible_as_professional_evidence: false
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: consolidation
    date: 2026-09-14
    independently_validated: false
sources: []
related: [../VALIDATION.md, ../playbooks/debugging.md, ../checklists/ai-assisted-change.md]
visibility: private
---

# Mudança orientada por evidências e preservação de comportamento

## Contexto

Mudanças em código existente, especialmente com auxílio de IA, precisam separar investigação, proposta,
autorização, implementação e validação. Antes de editar, declare tanto o comportamento que deve mudar
quanto aquele que precisa permanecer.

## Sinais de risco

- alteração iniciada antes de confirmar expected versus actual;
- solução baseada em uma única mensagem de erro;
- testes provam o caso novo, mas não a preservação do comportamento omitido;
- gate configurado é apresentado como executado ou aprovado;
- assumptions do agente tornam-se requisitos sem confirmação.

## Aplicação

1. Reproduza e estabeleça uma baseline.
2. Rotule fatos, hipóteses, inferências e lacunas.
3. Converta mudança e preservação em critérios observáveis.
4. Proponha a menor alteração que trate a causa sustentada.
5. Valide progressivamente: estrutura, compilação, testes, runtime, integração e gate aplicável.
6. Registre separadamente `configurado`, `executado`, `observado` e `aprovado`.
7. Mantenha pendência e responsável quando uma evidência só existir em outro ambiente.

## Failure modes e falsos positivos

Mais evidência não significa acumular logs indiscriminadamente. Colete sinais independentes e necessários,
respeitando segurança e minimização. Teste verde não confirma um mock irrealista; sintoma desaparecido não
confirma a hipótese; gate habilitado não equivale a resultado observado.

## Validação

A conclusão deve explicar o mecanismo causal, indicar evidências convergentes, hipóteses rejeitadas,
comportamentos preservados, limitações, riscos residuais e aprovações ainda pendentes.
