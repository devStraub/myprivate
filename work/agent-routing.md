---
id: ai-agent-routing
title: Roteamento de agentes por função, complexidade e risco
type: workflow
status: draft
created: 2026-09-02
updated: 2026-09-02
origin: [professional-preference, ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: structure
    date: 2026-09-02
sources: []
related: [ai-assisted-development.md, copilot-start-prompt.md, ../templates/ai-work-plan.md]
visibility: private
---

# Roteamento de agentes por função, complexidade e risco

## Princípio

Use maior capacidade de raciocínio nos pontos em que decisões erradas ampliam risco: mapeamento,
arquitetura, investigação ambígua e revisão transversal. Use um agente mais rápido e econômico para
executar passos claros, pequenos e verificáveis.

Na configuração atualmente preferida pelo proprietário:

- `gpt-5.6-sol`: candidato a `planner` e `reviewer` em demandas complexas ou arriscadas;
- `gpt-5.6-luna`: candidato a `executor` e `validator` em tarefas delimitadas e verificáveis.

Esses nomes são preferências substituíveis, não garantia de qualidade nem regra permanente de produto.
Registre sempre o nome exibido na sessão; não invente versão ou capacidade.

## Avaliação inicial obrigatória

Antes de planejar ou editar, o agente classifica a demanda:

| Dimensão | Baixa | Alta |
| --- | --- | --- |
| Escopo | alteração local e conhecida | vários módulos, serviços ou camadas |
| Ambiguidade | critérios e solução claros | requisitos incompletos ou várias soluções plausíveis |
| Impacto | reversão simples | contrato público, dados, segurança ou disponibilidade |
| Diagnóstico | causa conhecida | causa incerta e evidências conflitantes |
| Validação | testes locais suficientes | pipeline, ambiente ou aprovação externa |

Se duas ou mais dimensões forem altas, ou se uma envolver segurança, dados, mudança destrutiva ou
arquitetura, recomende planejamento/revisão por um agente de maior capacidade.

## Como recomendar

Quando o agente atual não for o mais adequado, informe antes da alteração:

```text
Recomendação de agente
- Função necessária: <planner|executor|validator|reviewer>
- Agente sugerido: <nome exibido, por exemplo gpt-5.6-sol>
- Motivo: <risco ou complexidade concreta>
- Momento de retorno: <qual artefato o agente deve produzir>
- Posso prosseguir com segurança no agente atual? <sim/não e limite>
```

Não recomende troca apenas porque outro agente é teoricamente mais poderoso. A troca precisa reduzir
risco, retrabalho ou custo de forma plausível. O agente nunca troca modelo sozinho; a decisão é humana.

## Papéis e passagem de contexto

```text
planner → plan.md com escopo, passos, riscos e evidências
executor → alterações pequenas conforme o plano
validator → testes e fatos observados, sem declarar aprovação não vista
reviewer → revisão do diff, riscos residuais e critérios
humano → decisões, expansões de escopo e aprovação
```

O executor não reinterpreta silenciosamente o plano. Diante de descoberta material, marca o passo como
`blocked`, registra o impacto e solicita retorno ao `planner` ou ao responsável humano.

Uma demanda trivial pode permanecer com um único agente. Uma demanda de risco elevado deve considerar
revisão final por agente de maior capacidade mesmo quando a execução tiver sido feita por outro.

