---
id: architecture-review-playbook
title: Revisão de arquitetura
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
related: [../VALIDATION.md, ../areas/architecture.md]
visibility: private
---

# Revisão de arquitetura

## Enquadrar

- requirements funcionais e atributos de qualidade;
- restrições reais versus preferências;
- assumptions e incertezas;
- critérios de decisão e horizonte temporal;
- alternativas, inclusive manter o desenho atual.

## Avaliar

- acoplamento, coesão, ownership e fronteiras;
- escalabilidade, capacidade e comportamento sob carga;
- consistência, disponibilidade e tolerância a partições conforme o contexto;
- operabilidade, observabilidade e recuperação;
- segurança, privacidade e superfície de ataque;
- custo financeiro e operacional;
- complexidade acidental e capacidade da equipe;
- failure modes, blast radius e dependências;
- reversibilidade, migração e rollback;
- caminho evolutivo e gatilhos para reavaliar.

## Concluir

Documente opções, trade-offs, evidências, riscos residuais e condições que invalidam a recomendação. Aplique validação adversarial e registre a escolha aprovada em [`../decisions/`](../decisions/README.md) quando houver valor histórico.
