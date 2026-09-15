---
id: proposal-consistencia-integracoes-sequenciais
title: Consistência em integrações sequenciais sem transação distribuída
type: work-learning-proposal
status: draft
confidence: medium
created: 2026-09-15
updated: 2026-09-15
last_reviewed:
domains: [distributed-systems, resilience, observability, persistence]
technologies: []
tags: [partial-failure, reconciliation, retry, consistency, distributed-workflow]
origin: [professional-experience, ai-assisted-analysis]
learning_state: applied-professionally
eligible_as_professional_evidence: false
capture_id: 20260915-consistencia-sequencial-p1
captured_at: 2026-09-15T13:17:22Z
review_state: pending
reviewed_at:
consolidated_into: []
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: analysis-and-drafting
    date: 2026-09-15
    independently_validated: false
sources: []
related: [20260902-telemetria-falha-integracao-recuperacao.md, 20260902-semantica-atualizacao-parcial.md]
visibility: private
sanitization:
  level: generalized
  reviewed_on:
  reviewed_by:
  reidentification_risk: low
  approved: false
---

# Proposta de aprendizado: Consistência em integrações sequenciais sem transação distribuída

## Aprendizado generalizado

Quando uma operação atualiza primeiro um sistema remoto e depois a persistência local, não existe
atomicidade automática entre as etapas. Se a segunda escrita falhar, repetir ou reverter apenas o
código não desfaz o estado já aceito externamente.

O fluxo deve definir previamente a ordem, a idempotência, o limite de retry e a estratégia de
reconciliação. Após uma falha parcial definitiva, o sistema precisa propagar o erro, registrar que
há divergência pendente e preservar contexto suficiente para correção operacional ou automatizada.

## Natureza

- [x] conhecimento novo
- [x] reforço de conhecimento existente
- [ ] exceção ou contradição
- [x] novo pattern
- [x] revisão de decisão
- [x] melhoria de checklist ou playbook
- [ ] erro instrutivo de IA

## Evidência permitida

Uma implementação profissional exigia manter uma integração remota antes da persistência local.
Para reduzir o risco de divergência, foi aplicado retry limitado somente à etapa local. O
esgotamento passou a registrar explicitamente a necessidade de reconciliação e a propagar a falha,
sem apresentar um resultado de sucesso aparente.

A telemetria passou a usar o melhor estado disponível em cada ponto: estado anterior para uma
rejeição antes da alteração, estado pretendido quando a chamada remota falhava e estado confirmado
pelo sistema remoto quando a persistência local falhava.

### Separação epistemológica

- Observado diretamente: retry limitado e sinalização de reconciliação tornaram a falha parcial
  explícita e testável.
- Inferido ou proposto pela IA: representar a etapa confirmada e o melhor estado disponível melhora
  a automação futura da reconciliação.
- Não verificado: compensação automática, concorrência real, processamento assíncrono de
  reconciliação e garantias de idempotência do sistema remoto.

## Alteração proposta

Após aprovação, incorporar ao checklist de integrações sequenciais:

- documentar a ordem das escritas e o ponto sem retorno;
- definir uma chave idempotente ou identificador de correlação;
- limitar retries às falhas classificadas como transitórias;
- impedir que retry local repita inadvertidamente uma escrita remota já confirmada;
- registrar etapa concluída, etapa que falhou e necessidade de reconciliação;
- propagar a falha principal sem permitir que uma falha de telemetria a substitua;
- conservar o melhor estado conhecido para diagnóstico e reparação;
- testar sucesso, falha antes da escrita remota, falha remota, falha local recuperada e falha local
  definitiva.

## Participação e erros de IA

A IA ajudou a explicitar a matriz de estados, implementar o retry limitado e estruturar os testes
de falha parcial. As decisões sobre ordem das integrações, escopo da telemetria e necessidade de
reconciliação foram confirmadas por decisão humana antes da implementação.

## Revisão de sanitização

- Categorias removidas: organização, projeto, domínio de negócio, sistemas, endpoints, classes,
  identificadores, payloads, versões, logs, métricas e cronologia operacional.
- Singularidade residual: baixa; o aprendizado se aplica a fluxos distribuídos variados.
- Nível proposto: generalized.
- Fontes permitidas: nenhuma.

## Aprovação humana

- Decisão: pending
- Responsável:
- Data:
- Observações:

## Consolidação

- Estado de revisão: pending
- Destinos aprovados: nenhum
- Captura substituída/corrigida: nenhum
