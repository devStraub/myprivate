---
id: dependency-remediation-checklist
title: Remediação de dependências e vulnerabilidades
type: checklist
status: provisional
created: 2026-09-14
updated: 2026-09-14
origin: [professional-experience, ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: consolidation
    date: 2026-09-14
sources: []
related: [../areas/security.md, ../playbooks/platform-migration.md, ../VALIDATION.md]
visibility: private
---

# Checklist de remediação de dependências e vulnerabilidades

- [ ] O relatório foi separado entre inventário, achados acionáveis, políticas de licença e artefatos não identificados?
- [ ] Componentes efetivamente bloqueados e achados distintos foram identificados sem confundir contagens agregadas?
- [ ] Severidade, condição vulnerável e versão mínima corrigida foram verificadas em fonte apropriada?
- [ ] A aplicabilidade ao uso real foi analisada sem ser usada como dispensa automática da correção?
- [ ] A origem direta ou transitiva foi confirmada na árvore resolvida?
- [ ] O parent, BOM ou componente responsável pelo gerenciamento da versão foi identificado?
- [ ] Módulos que compartilham o mesmo ciclo de versão foram tratados de forma coerente?
- [ ] Foi preferida a atualização da dependência de origem em vez de override isolado?
- [ ] Overrides necessários possuem justificativa, compatibilidade e condição de remoção?
- [ ] Compilação, regressão, startup e integrações relevantes foram validados?
- [ ] A árvore e o artefato final realmente contêm a versão esperada?
- [ ] O gate foi reexecutado e seu resultado observado, sem confundir configuração com aprovação?
- [ ] Pendências, riscos residuais e responsável pela decisão estão explícitos?
- [ ] Nenhum relatório, identificador, vulnerabilidade interna, caminho ou credencial foi levado à Toolbox?
