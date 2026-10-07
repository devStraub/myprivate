---
id: agents-catalog
title: Catálogo de agentes especialistas
type: agent-index
status: draft
created: 2026-10-06
updated: 2026-10-06
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5
    role: structure
    date: 2026-10-06
sources: []
related: [../AGENTS.md, ../governance/agent-lifecycle.md, ../profile-data/agent-history.md]
visibility: private
---

# Catálogo de agentes especialistas

Agentes especialistas tornam conhecimento mantido na Toolbox acionável em tarefas recorrentes. Cada
agente deve possuir escopo explícito, fontes rastreáveis, limites de autoridade e procedimento de
atualização. Um agente não é autoridade normativa e não substitui validação humana.

## Agentes disponíveis

| Agente | Finalidade | Estado | Fonte principal | Última revisão da base |
| --- | --- | --- | --- | --- |
| [`pix-dict-med-specialist`](pix-dict-med-specialist/SKILL.md) | Pesquisar regras do DICT/MED, revisar fluxos e identificar lacunas rastreáveis | draft | Banco Central do Brasil | 2026-10-06 |
| [`software-development-specialist`](software-development-specialist/SKILL.md) | Analisar projetos, validar implementação e preparar contexto para agentes do Copilot | draft | práticas e políticas da Toolbox | 2026-10-06 |
| [`product-owner-specialist`](product-owner-specialist/SKILL.md) | Manter a visão funcional dos serviços, responder sobre o estado atual e analisar impacto de regras | draft | base corporativa autorizada | 2026-10-06 |

## Composição recomendada

```text
especialista de domínio → diz o que a regra exige
PO técnico → relaciona regra, capacidade, fluxo e serviços
especialista de desenvolvimento → comprova onde e como o projeto atende
planner/executor/validator/reviewer → realiza a etapa delimitada
humano → decide, aprova e confirma aprendizagem/experiência
```

Os especialistas podem colaborar sem virar um agente único e genérico. Essa separação facilita atualizar
regras de negócio sem misturá-las a convenções técnicas e permite reutilizar o especialista de
desenvolvimento em outros domínios.

## Regra de uso

- carregue o agente somente quando a demanda estiver dentro do seu escopo;
- aplique a versão da regra vigente na data relevante, não apenas a versão mais recente encontrada;
- diferencie regra oficial, interpretação técnica, evidência do sistema e lacuna;
- mantenha análise interna no ambiente autorizado;
- registre na Toolbox somente fontes públicas e sínteses sanitizadas;
- não converta criação ou uso do agente automaticamente em competência ou experiência profissional.

## Histórico de aprendizagem e carreira

A criação, estudo, uso e refinamento de agentes podem gerar evidências diferentes:

1. **criação assistida:** comprova que um artefato foi produzido, não domínio do assunto;
2. **estudo confirmado:** registra aprendizagem após revisão humana;
3. **aplicação pessoal:** exige exercício ou validação observável;
4. **aplicação profissional:** exige uso real, resultado e case sanitizado aprovado;
5. **refinamento:** registra evolução baseada em fonte nova ou falha observada.

Use [`../governance/agent-lifecycle.md`](../governance/agent-lifecycle.md) e
[`../templates/agent-use.md`](../templates/agent-use.md) para preservar esse histórico sem inflar a
evidência.
