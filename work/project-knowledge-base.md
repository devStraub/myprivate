---
id: project-knowledge-base
title: Base corporativa de conhecimento do projeto
type: workflow
status: draft
created: 2026-10-06
updated: 2026-10-06
origin: [personal-practice, ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5
    role: structure
    date: 2026-10-06
sources: []
related:
  - ../agents/product-owner-specialist/SKILL.md
  - ai-assisted-development.md
  - ../governance/sanitization.md
visibility: private
---

# Base corporativa de conhecimento do projeto

O conhecimento reutilizável do agente PO exige persistência, mas detalhes do projeto profissional não
podem entrar na Toolbox pessoal. Use três camadas separadas:

```text
TOOLBOX PESSOAL
agentes + fontes públicas + templates + aprendizados sanitizados

BASE CORPORATIVA PERSISTENTE
serviços + capacidades + fluxos + regras internas + gaps + evidências

.ai-work/ TEMPORÁRIO
planos + backups + telemetria + relatório da demanda atual
```

## Local da base persistente

Use somente um local autorizado pela organização, preferencialmente documentação interna ou repositório
corporativo apropriado. Quando permitido, pode ser um diretório local dedicado e excluído do Git, como
`.ai-product-knowledge/` dentro de uma raiz corporativa. Não crie ou versione esse diretório
silenciosamente; confirme a política e o destino antes do primeiro inventário.

Nunca copie a base para Git pessoal, Toolbox, mídia removível ou ferramenta não autorizada.

## Conteúdo

A base registra o estado atual com links para evidências locais, datas e confiança. Ela não deve duplicar
código ou armazenar payloads, secrets e dados pessoais. Deve ser legível por pessoas e agentes e permitir
navegação entre regra, capacidade, fluxo e serviço.

## Atualização

- descoberta inicial cria cobertura, não verdade definitiva;
- mudança aceita atualiza o estado somente após validação;
- atualização regulatória gera análise de impacto, não alteração automática do backlog;
- conflitos e desconhecidos permanecem visíveis;
- respostas importantes revalidam evidências potencialmente desatualizadas.

## Relação com carreira

O conteúdo detalhado permanece corporativo. Para a Toolbox, extraia somente aprendizado generalizado e
sanitizado. A atividade pode se tornar evidência de experiência apenas conforme o ciclo de agentes e após
aprovação humana.
