---
id: platform-migration-playbook
title: Migração coordenada de plataforma e runtime
type: playbook
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
related: [../VALIDATION.md, ../checklists/dependency-remediation.md, ../checklists/production-change.md]
visibility: private
---

# Migração coordenada de plataforma e runtime

Uma atualização de framework central é migração de plataforma, não simples troca de versão.

## Planejar

1. Registre baseline reproduzível de runtime, build, dependências gerenciadas, plugins, startup e testes.
2. Construa matriz de compatibilidade entre runtime, framework, container, integrações e pipeline.
3. Confirme disponibilidade real dos componentes nos repositórios permitidos.
4. Mapeie dependências diretas, transitivas, BOMs, overrides, starters, APIs e configurações legadas.
5. Divida a migração em etapas pequenas com critério de saída e reversão próprios.

## Implementar

- prefira versões gerenciadas pela plataforma;
- remova overrides herdados antes de acrescentar novos;
- justifique qualquer override indispensável;
- alinhe o runtime usado por IDE, build, testes e pipeline;
- revise namespaces, starters, serialização, propriedades e container efetivamente resolvido;
- altere uma família coerente por vez e preserve o comportamento não relacionado.

## Validar progressivamente

1. estrutura do build e árvore resolvida;
2. compilação no runtime alvo;
3. testes unitários e de integração;
4. empacotamento e conteúdo do artefato;
5. startup, health checks e smoke tests;
6. integrações disponíveis, distinguindo ambiente de aplicação;
7. segurança e composição sobre o artefato efetivamente produzido.

Compilar não prova compatibilidade de runtime. Um gate configurado não está aprovado até sua execução e
resultado serem observados. Registre limitações de ambiente e mantenha pendências explícitas.
