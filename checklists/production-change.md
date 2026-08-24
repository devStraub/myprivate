---
id: production-change-checklist
title: Mudança em produção
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
related: [../VALIDATION.md, ../playbooks/incident-analysis.md]
visibility: private
---

# Checklist de mudança em produção

- [ ] Escopo, responsável, janela e critérios de sucesso estão definidos.
- [ ] Dependências, compatibilidade e ordem de implantação foram verificadas.
- [ ] Backups, migrações e irreversibilidades foram avaliados.
- [ ] Plano de rollout limita blast radius quando possível.
- [ ] Rollback ou estratégia de recuperação foi testada ou justificada.
- [ ] Métricas, logs, traces e alertas permitem detectar efeito adverso.
- [ ] Limiares de abortar ou reverter são explícitos.
- [ ] Segurança, capacidade, concorrência e consistência foram consideradas.
- [ ] Testes pré-implantação representam condições relevantes.
- [ ] Comunicação e aprovações exigidas foram concluídas.
- [ ] Validação pós-implantação e período de observação estão definidos.
- [ ] Nenhum dado corporativo será copiado para a Toolbox na retrospectiva.
