---
id: pix-dict-med-specialist
title: Agente especialista em Pix, DICT e MED
type: agent-record
status: draft
agent_state: draft
created: 2026-10-06
updated: 2026-10-06
last_reviewed: 2026-10-06
domains: [payments, pix, fraud-prevention, regulatory-integration]
technologies: [dict-api, mtls, xml-dsig]
origin: [official-documentation, ai-assisted-analysis]
learning_state: not-studied
eligible_as_professional_evidence: false
agents:
  - provider: openai
    model: gpt-5
    role: research
    date: 2026-10-06
    independently_validated: false
sources:
  - bcb-pix-normas
  - bcb-dict-manual-8-5
  - bcb-dict-api-2-12-1
  - bcb-med-guide-4-1
related:
  - ../README.md
  - ../../governance/agent-lifecycle.md
  - ../../knowledge/pix-dict-med.md
visibility: private
---

# Agente especialista em Pix, DICT e MED

## Necessidade

Manter conhecimento público, temporal e rastreável sobre DICT e MED; apoiar decisões; revisar fluxos
implementados e identificar lacunas sem transportar ativos corporativos para a Toolbox.

## Escopo inicial

- finalidade, atores e responsabilidades do DICT;
- ciclo de vida de chaves, consulta, segurança, antifraude e limites da API;
- notificações de infração, solicitações de devolução e Recuperação de Valores;
- estados, eventos, prazos, condições e casos fora do escopo do MED;
- comparação entre regra vigente e evidência de implementação;
- monitoramento periódico de fontes oficiais e preservação do histórico.

## Fora do escopo

- parecer jurídico ou certificação de conformidade;
- decisões automáticas sobre fraude, bloqueio ou devolução;
- acesso não autorizado a sistemas, dados ou documentação interna;
- armazenamento de código, topologia, payloads, incidentes ou regras proprietárias;
- alteração automática de perfil profissional ou estado de aprendizagem.

## Critérios para ativação

O agente permanece `draft` até revisão humana do escopo e da base inicial. Depois de aprovado, pode mudar
para `active`. Mudança oficial não analisada, conflito de vigência ou erro material coloca o agente em
`review-required`.

## Evidência de aprendizagem e carreira

A criação deste agente registra um artefato de curadoria assistida. Ela ainda não comprova estudo nem
experiência no domínio. Usos posteriores podem produzir evidências delimitadas conforme
[`../../governance/agent-lifecycle.md`](../../governance/agent-lifecycle.md).

## Histórico

| Data | Mudança | Origem | Revisão humana |
| --- | --- | --- | --- |
| 2026-10-06 | Estrutura inicial, fontes oficiais, catálogo de regras e auditoria | pesquisa assistida | pendente |
