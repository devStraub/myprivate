---
id: pull-request-checklist
title: Pull request
type: checklist
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
related: [../playbooks/code-review.md, ../VALIDATION.md]
visibility: private
---

# Checklist de pull request

- [ ] Objetivo, escopo e comportamento esperado estão claros.
- [ ] O diff é focado e não contém mudanças acidentais, secrets ou dados sensíveis.
- [ ] Assumptions e decisões não óbvias estão explícitas.
- [ ] Contratos, compatibilidade e migração foram considerados.
- [ ] Erros, timeouts, retries e cleanup são adequados.
- [ ] Segurança, concorrência, transações e performance foram avaliadas conforme o risco.
- [ ] Logs e telemetria ajudam sem expor dados sensíveis.
- [ ] Testes demonstram casos relevantes, negativos e regressão.
- [ ] Código gerado e APIs foram verificados em fonte ou execução confiável.
- [ ] Documentação e links afetados foram atualizados.
- [ ] Rollout e rollback foram considerados quando aplicável.
- [ ] Incertezas e riscos residuais estão visíveis ao revisor.
