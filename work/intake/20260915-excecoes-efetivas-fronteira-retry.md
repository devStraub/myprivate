---
id: proposal-excecoes-efetivas-fronteira-retry
title: Exceções efetivas na fronteira de retry
type: work-learning-proposal
status: draft
confidence: high
created: 2026-09-15
updated: 2026-09-15
last_reviewed:
domains: [resilience, integration, testing]
technologies: []
tags: [retry, exception-translation, transport-failure, contract-testing]
origin: [professional-experience, ai-assisted-analysis]
learning_state: applied-professionally
eligible_as_professional_evidence: false
capture_id: 20260915-182146-retry-exception-boundary-p1
captured_at: 2026-09-15T18:21:46Z
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
related: [20260915-retry-fronteira-observabilidade.md, 20260824-validacao-contratos-api.md]
visibility: private
sanitization:
  level: generalized
  reviewed_on:
  reviewed_by:
  reidentification_risk: low
  approved: false
---

# Proposta de aprendizado: Exceções efetivas na fronteira de retry

## Aprendizado generalizado

Uma política de retry precisa classificar a exceção observada na fronteira onde o mecanismo é aplicado, não apenas
a causa original da falha. Bibliotecas de cliente podem capturar erros de entrada e saída e convertê-los em uma
exceção própria. Configurar somente os tipos de baixo nível pode deixar conexão recusada, interrupção de conexão ou
timeout fora das tentativas esperadas.

O teste deve atravessar a mesma fronteira usada em produção. Instanciar manualmente uma política e lançar uma
exceção escolhida pelo teste comprova o algoritmo da biblioteca, mas não comprova tradução de exceções, binding de
configuração, proxy ou interceptação do cliente real.

## Natureza

- [x] conhecimento novo
- [x] reforço de conhecimento existente
- [ ] exceção ou contradição
- [x] novo pattern
- [ ] revisão de decisão
- [x] melhoria de checklist ou playbook
- [x] erro instrutivo de IA

## Evidência permitida

Uma revisão de integração encontrou uma política aparentemente completa e testes verdes do mecanismo isolado.
A inspeção da biblioteca mostrou que falhas de transporte chegavam ao interceptor com outro tipo de exceção. O
tipo efetivamente observado não estava classificado como retentável, portanto a prova isolada não garantia o
comportamento da chamada real.

### Separação epistemológica

- Observado diretamente: a biblioteca transforma falhas de transporte em uma exceção própria, e a política
  analisada não incluía esse tipo.
- Inferido ou proposto pela IA: testar a fronteira real reduz falsos positivos em outras bibliotecas que também
  traduzem exceções.
- Não verificado: comportamento de todos os clientes HTTP, configurações de retry nativas ou combinações de
  interceptores.

## Conteúdo existente relacionado

O draft sobre retry e observabilidade trata a posição do retry em relação à telemetria. A validação de contratos
trata compatibilidade entre integrações. Esta proposta acrescenta a classificação pelo tipo de exceção que
efetivamente atravessa a fronteira interceptada.

## Alteração proposta

Após aprovação, acrescentar ao checklist de resiliência:

- identificar a exceção exposta pelo cliente para DNS, conexão, leitura e escrita;
- diferenciar causa raiz da exceção observada pelo interceptor;
- verificar retry nativo do cliente e evitar camadas concorrentes;
- testar a configuração carregada pelo framework, não apenas uma instância manual;
- provocar ao menos uma falha de transporte em servidor controlado;
- comprovar quantidade de chamadas, interrupção após sucesso e ausência de retry para falhas definitivas.

## Participação e erros de IA

A IA aceitou inicialmente um teste do mecanismo isolado como evidência suficiente. Uma revisão adversarial
posterior examinou a fronteira do cliente e encontrou a transformação de exceção não representada pelo teste.

## Revisão de sanitização

- Categorias removidas: organização, projeto, domínio, endpoint, classes internas, configuração concreta, logs,
  contagens e cronologia operacional.
- Números, cronologia e combinações singulares removidos: sim.
- Singularidade residual: baixa; transformação de exceções ocorre em diversos clientes e frameworks.
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
