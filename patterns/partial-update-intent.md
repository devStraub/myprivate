---
id: partial-update-intent
title: Preservação de intenção em atualizações parciais
type: pattern
pattern_kind: good-practice
status: provisional
confidence: medium
created: 2026-09-14
updated: 2026-09-14
last_reviewed: 2026-09-14
domains: [apis, persistence, distributed-systems, testing]
technologies: []
tags: [partial-update, field-presence, null-semantics, lost-update]
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
related: [../checklists/new-api.md, ../areas/apis.md, ../areas/integration.md]
visibility: private
---

# Preservação de intenção em atualizações parciais

## Contexto

Em uma atualização parcial, ausência de campo, `null` explícito e valor presente podem representar
intenções diferentes. Comparar somente estado antigo e novo perde essa distinção.

## Risco

Mesclar uma representação completa e persistir todo o resultado pode sobrescrever atributos omitidos ou
alterações concorrentes. Em objetos aninhados, substituir o objeto inteiro por causa de um único campo
amplia ainda mais esse risco.

## Aplicação

- represente presença de campo independentemente do valor;
- defina a semântica de ausência e `null` no contrato;
- use granularidade de caminhos para campos compostos;
- produza estado mesclado apenas para consumidores que exigem representação completa;
- limite a escrita local aos campos explicitamente recebidos;
- evite captura ampla de exceções para esconder contratos de erro distintos.

## Como validar

Teste alteração solicitada, preservação de campos omitidos, `null` explícito, objetos aninhados,
resposta remota incompleta e concorrência quando aplicáveis. Confirme separadamente o payload destinado
a integrações e os atributos realmente persistidos.

## Limites

A estratégia depende da capacidade do formato e framework de distinguir ausência de `null`. Controle de
presença reduz ambiguidade, mas não substitui locking, versionamento otimista ou outra estratégia contra
lost update.
