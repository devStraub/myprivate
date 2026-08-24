---
id: code-review-playbook
title: Code review
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
related: [../VALIDATION.md, ../checklists/pull-request.md]
visibility: private
---

# Code review

## Contexto primeiro

Entenda requisito, escopo, restrições, contratos e evidências. Diferencie defeito, risco, dúvida e preferência. Priorize observações por impacto.

## Revisão

- correctness e preservação de comportamento;
- legibilidade, coesão e maintainability;
- contratos internos e públicos, compatibilidade e migração;
- testes relevantes, casos negativos e risco de falso verde;
- tratamento de erro, retries, timeouts e cleanup;
- segurança, privacidade e validação de entrada;
- performance e uso de recursos;
- concorrência, estado compartilhado e ordering;
- transações, atomicidade e consistência;
- logs, métricas, traces e diagnósticos sem dados sensíveis;
- complexidade, duplicação e abstração prematura;
- código gerado: APIs inexistentes, assumptions, dependências inventadas e hallucinations.

## Saída

Explique mecanismo, impacto e condição de ocorrência. Sugira correção quando houver base, mas não declare certeza sem evidência. Confirme que o diff não contém segredo ou ativo indevido e aplique [`../VALIDATION.md`](../VALIDATION.md) a mudanças de maior risco.
