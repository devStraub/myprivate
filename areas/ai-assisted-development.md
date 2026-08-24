---
id: area-ai-assisted-development
title: AI-Assisted Development
type: area-index
status: draft
created: 2026-08-23
updated: 2026-08-23
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: unknown
    role: structure
    date: 2026-08-23
sources: []
related: [README.md, ../VALIDATION.md, ../study/study-workflow.md]
visibility: private
---

# AI-Assisted Development

A função humana não é competir com IA na geração mecânica de código. O objetivo é ampliar a capacidade de:

- formular problemas e fornecer contexto suficiente;
- decompor incerteza e dirigir investigação;
- reconhecer classes de problemas e avaliar trade-offs;
- detectar erro, hallucination e omissão;
- exigir evidência e validar soluções;
- assumir responsabilidade pela decisão e pelo impacto.

## Prática

- Trate toda saída de IA como proposta delimitada por assumptions.
- Verifique APIs, versões, contratos e resultados em fontes ou execução adequadas.
- Peça alternativas, argumentos contrários e failure modes.
- Separe concordância entre agentes de validação independente.
- Registre provider/model ou `unknown`, função, data e evidência posterior.
- Preserve erros de agentes e propostas rejeitadas quando ensinarem algo reutilizável.

## Índice de evidências

Nenhum knowledge, pattern, case ou source foi incorporado na v0.1. A filosofia inicial se conecta a [`../VALIDATION.md`](../VALIDATION.md) e ao [`workflow de estudo`](../study/study-workflow.md).
