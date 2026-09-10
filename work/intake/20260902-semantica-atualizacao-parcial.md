---
id: proposal-semantica-atualizacao-parcial
title: Preservação de intenção em atualizações parciais
type: work-learning-proposal
status: draft
confidence: low
created: 2026-09-02
updated: 2026-09-02
last_reviewed:
domains: [apis, persistence, distributed-systems, testing]
technologies: []
tags: [partial-update, field-presence, lost-update, integration]
origin: [professional-experience, ai-assisted-analysis]
learning_state: not-studied
eligible_as_professional_evidence: false
capture_id: 20260902-204508-atualizacao-parcial-p1
captured_at: 2026-09-02T20:45:08Z
review_state: pending
reviewed_at:
consolidated_into: []
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: analysis-and-drafting
    date: 2026-09-02
    independently_validated: false
sources: []
related: [20260824-validacao-contratos-api.md, 20260902-telemetria-falha-integracao-recuperacao.md]
visibility: private
sanitization:
  level: generalized
  reviewed_on:
  reviewed_by:
  reidentification_risk: low
  approved: false
---

# Proposta de aprendizado: Preservação de intenção em atualizações parciais

## Aprendizado generalizado

Uma atualização parcial precisa transportar separadamente o estado resultante e a presença dos
campos recebidos. O estado mesclado pode ser necessário para integrações que esperam uma
representação completa, enquanto a persistência local deve alterar apenas os atributos
explicitamente informados. Inferir presença comparando valores antigos e novos perde a intenção da
requisição e pode sobrescrever alterações concorrentes.

Campos compostos exigem granularidade equivalente. Alterar somente um atributo de um objeto
aninhado não deve substituir todo o objeto persistido. A seleção explícita de caminhos também torna
os testes capazes de comprovar tanto a alteração solicitada quanto a preservação do conteúdo
omitido.

## Natureza

- [x] conhecimento novo
- [x] reforço de conhecimento existente
- [ ] exceção ou contradição
- [x] novo pattern
- [ ] revisão de decisão
- [x] melhoria de checklist ou playbook
- [x] erro instrutivo de IA

## Evidência permitida

Uma alteração profissional assistida exigiu distinguir a representação completa enviada a uma
dependência remota da escrita seletiva na persistência local. Testes automatizados confirmaram a
seleção de campos simples e aninhados, a preservação de valores omitidos e o tratamento de dados
opcionais.

A evidência demonstra o comportamento no contexto testado, mas não valida que a mesma estratégia
seja adequada a todo contrato de atualização parcial ou mecanismo de persistência.

### Separação epistemológica

- Observado diretamente: uma máscara explícita de campos permitiu testar e preservar atributos
  omitidos sem impedir o envio de um estado completo para outra integração.
- Inferido ou proposto pela IA: representar presença de campos como conceito próprio reduz
  ambiguidades e risco de perda de atualização em outros sistemas.
- Não verificado: comportamento sob concorrência real, suporte a remoção explícita de valores e
  aplicabilidade a formatos que distinguem ausência de `null`.

## Conteúdo existente relacionado

A proposta sobre validação transversal de contratos cobre propagação e testes de APIs. A proposta
sobre telemetria de integrações cobre identificação da etapa que falhou. Este draft acrescenta a
distinção específica entre intenção do PATCH, estado mesclado e escrita seletiva.

## Alteração proposta

Após aprovação, avaliar um pattern ou ampliação do checklist de APIs com os seguintes pontos:

- modelar presença de campo independentemente do valor;
- definir explicitamente a semântica de `null`;
- mesclar o estado apenas onde o contrato exigir representação completa;
- persistir caminhos simples e aninhados na granularidade recebida;
- testar alteração solicitada e preservação dos campos omitidos;
- incluir cenários de concorrência e resposta remota incompleta quando aplicáveis.

## Participação e erros de IA

A IA investigou o fluxo, propôs a máscara de campos, implementou testes e preparou este draft. Uma
primeira abordagem de tratamento de falhas usou captura ampla de exceções; a revisão adversarial
identificou o risco e a implementação foi restringida a falhas conhecidas. Isso reforça que
tratamento genérico conveniente não deve substituir contratos explícitos de erro.

## Revisão de sanitização

- Categorias removidas: organização, projeto, ticket, domínio de negócio, endpoints, classes,
  caminhos, versões, payloads, identificadores, logs, métricas e cronologia operacional.
- Números, cronologia e combinações singulares removidos: sim.
- Singularidade residual: baixa; o aprendizado se aplica a APIs e persistências variadas.
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
