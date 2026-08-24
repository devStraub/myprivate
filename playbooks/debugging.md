---
id: debugging-playbook
title: Debugging
type: playbook
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
related: [../VALIDATION.md, ../areas/debugging.md]
visibility: private
---

# Debugging

1. **Reproduzir:** defina ambiente, precondições e repetibilidade.
2. **Expected vs actual:** torne a diferença observável e confirme o contrato.
3. **Coletar evidência:** logs autorizados, traces, métricas, estado e versões; não altere antes de preservar sinais úteis.
4. **Formar hipóteses:** separe fatos de explicações e explicite assumptions.
5. **Priorizar:** combine plausibilidade, impacto e custo de falsificação.
6. **Falsificar:** altere uma variável por vez quando possível e procure evidência contrária.
7. **Causa raiz:** explique o mecanismo causal e por que produz os sintomas.
8. **Alternativas:** compare correção, mitigação, risco, simplicidade e reversibilidade.
9. **Corrigir:** faça a menor mudança que trate a causa com segurança.
10. **Regression test:** reproduza a falha anterior e demonstre o comportamento esperado.
11. **Efeitos colaterais:** avalie contratos, segurança, concorrência, transações, performance e observabilidade.
12. **Extrair conhecimento:** generalize e sanitize antes de propor qualquer registro.

Não confunda desaparecimento do sintoma com confirmação da hipótese. Use [`../VALIDATION.md`](../VALIDATION.md) antes de concluir.
