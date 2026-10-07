---
id: proposal-validacao-artefato-documentacao-gerada
title: Validação do artefato de documentação gerada
type: work-learning-proposal
status: draft
confidence: medium
created: 2026-09-25
updated: 2026-09-25
last_reviewed:
domains: [apis, testing, build-engineering]
technologies: [openapi, java, spring]
tags: [generated-contract, schema, validation, metadata]
origin: [professional-experience, ai-assisted-analysis]
learning_state: applied-professionally
eligible_as_professional_evidence: false
capture_id: 20260925-144401-documentacao-gerada-a1
captured_at: 2026-09-25T17:44:01Z
review_state: pending
reviewed_at:
consolidated_into: []
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: analysis-and-drafting
    date: 2026-09-25
    independently_validated: false
sources: []
related: [20260824-validacao-contratos-api.md, 20260824-validacao-progressiva.md]
visibility: private
sanitization:
  level: generalized
  reviewed_on:
  reviewed_by:
  reidentification_risk: low
  approved: false
---

# Proposta de aprendizado: Validação do artefato de documentação gerada

## Aprendizado generalizado

Em documentação de API gerada, alterar uma anotação não demonstra que o contrato publicado mudou. O gerador
pode combinar metadados de validação, serialização e documentação em ordens diferentes, fazendo uma restrição
reaparecer mesmo quando uma anotação tenta suprimi-la.

A validação deve inspecionar o artefato gerado e a representação visual consumida pelos usuários. Quando a
documentação precisa divergir deliberadamente da validação de runtime, uma customização aplicada ao modelo
final pode ser mais determinística do que atribuir um valor vazio à anotação. Essa separação deve ser localizada,
explícita e coberta por verificação do contrato para não enfraquecer a validação da aplicação.

## Natureza

- [x] conhecimento novo
- [x] reforço de conhecimento existente
- [ ] exceção ou contradição
- [x] novo pattern
- [ ] revisão de decisão
- [x] melhoria de checklist ou playbook
- [x] erro instrutivo de IA

## Evidência permitida

Uma mudança assistida alterou metadados declarativos, mas a restrição continuou presente no documento gerado.
Depois de atuar no modelo final de documentação e regenerar os artefatos, a propriedade deixou de ser publicada,
enquanto a regra de validação permaneceu no runtime.

### Separação epistemológica

- Observado diretamente: a anotação com valor vazio não suprimiu o metadado; a customização do modelo final,
  seguida de regeneração e inspeção dos documentos, produziu o contrato esperado.
- Inferido ou proposto pela IA: testes automatizados sobre o documento gerado podem prevenir regressões causadas
  por atualização do gerador ou mudança na precedência entre fontes de metadados.
- Não verificado: a mesma precedência em outros geradores, versões ou linguagens e a adequação de ocultar
  restrições em contratos que não tenham requisito explícito para isso.

## Conteúdo existente relacionado

O draft de validação transversal de contratos aborda propagação entre camadas, e o de validação progressiva
separa investigação, implementação e evidência. Esta proposta acrescenta um gate específico: validar a saída
gerada, e não somente o código-fonte que pretende produzi-la.

## Alteração proposta

Após aprovação, ampliar o checklist de APIs com os seguintes pontos:

- identificar todas as fontes de metadados usadas pelo gerador;
- regenerar o contrato pelo mecanismo oficial do projeto;
- inspecionar o schema resultante e a interface que o renderiza;
- comparar todos os documentos publicados quando houver mais de uma audiência;
- manter customizações restritas ao schema e propriedade necessários;
- testar que a customização documental não remove a validação de runtime;
- repetir a verificação após atualizações do framework ou do gerador.

## Participação e erros de IA

A IA sugeriu inicialmente um valor vazio na anotação como forma de omitir a restrição. A inspeção do documento
gerado demonstrou que a abordagem não funcionou. A solução foi revisada para atuar no modelo final e foi
confirmada nos artefatos gerados. A generalização e este draft ainda dependem de revisão humana.

## Revisão de sanitização

- Categorias removidas: organização, projeto, ticket, endpoint, campo, mensagens, caminhos, versões, payloads,
  nomes de classes, logs, métricas e cronologia operacional.
- Números, cronologia e combinações singulares removidos: sim.
- Singularidade residual: baixa; o comportamento é aplicável a diferentes geradores de contratos.
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
