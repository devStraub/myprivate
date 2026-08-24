---
id: knowledge-lifecycle
title: Ciclo de vida do conhecimento
type: policy
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
related: [provenance.md, sanitization.md, maintenance.md]
visibility: private
---

# Ciclo de vida do conhecimento

```text
CAPTURE → CLASSIFY → SANITIZE → CONNECT → VALIDATE → HUMAN APPROVAL
→ COMMIT → USE → REVIEW → REFINE / DEPRECATE / PROMOTE
```

## Etapas

1. **Capture:** preserve a observação como proposta, sem declará-la verdadeira.
2. **Classify:** escolha knowledge, pattern, case, decision, source ou atualização existente.
3. **Sanitize:** aplique a política obrigatória quando houver contexto profissional.
4. **Connect:** relacione áreas, stacks, fontes e documentos canônicos.
5. **Validate:** aplique evidência proporcional ao risco e [`../VALIDATION.md`](../VALIDATION.md).
6. **Human approval:** mostre conteúdo e mudanças; registre aprovação ou rejeição.
7. **Commit:** faça uma alteração pequena e semanticamente clara na branch apropriada.
8. **Use:** consulte o conhecimento em situações reais sem tratá-lo como autoridade infalível.
9. **Review:** reavalie atualidade, evidência e contradições.
10. **Refine / deprecate / promote:** melhore, marque perda de validade ou eleve o status sem apagar histórico relevante.

## Status

- `draft`: proposta ainda não aprovada para uso regular.
- `provisional`: aprovada como útil, mas com validação ou evidência incompleta.
- `validated`: sustentada por evidência apropriada e aprovação humana; continua revisável.
- `deprecated`: perdeu aplicabilidade ou foi substituída, preservando contexto histórico.
- `disputed`: há evidências ou interpretações relevantes em conflito.

## Confiança

- `low`: evidência fraca, indireta ou ainda não reproduzida.
- `medium`: evidência útil, mas limitada em escopo ou independência.
- `high`: fontes fortes e/ou evidência independente coerente com o escopo declarado.

Status e confiança não são equivalentes. Um documento aprovado pode continuar `provisional`; um documento `validated` pode voltar a `disputed`.

## Criar ou atualizar?

Atualize um documento existente quando a nova informação explica o mesmo conceito, situação ou decisão e não precisa de identidade própria para ser recuperada. Crie um documento quando houver pergunta principal distinta, ciclo de vida próprio, relações próprias ou risco de tornar a fonte canônica ambígua. Registre evidência pequena no documento existente em vez de multiplicar arquivos.

## Aprovação

O agente pode investigar, redigir e apresentar diff. Aprovação para realizar uma tarefa não implica aprovação automática de toda conclusão, promoção de status, publicação ou mudança destrutiva. A aprovação precisa abranger a alteração apresentada.

## Knowledge Inventory

O ciclo documental acima convive com um estado de aprendizagem separado:

```text
DESCOBERTO → SCOUTING → BACKLOG → ESTUDO → COMPREENSÃO
→ VALIDAÇÃO → APLICAÇÃO → EXPERIÊNCIA → REFINAMENTO
```

Nem todo tema percorre todas as etapas, e a sequência não autoriza promoção automática. Em especial:

- material descoberto pode continuar apenas como scouting;
- um item de backlog pode ser descartado sem produzir knowledge;
- estudo não comprova compreensão ampla;
- aplicação pessoal não comprova experiência profissional;
- experiência só é elegível como evidência quando real, permitida, sanitizada e aprovada.

Use `learning_state` para a relação do proprietário com o conteúdo, `status` para o ciclo de governança e `backlog_status` somente para o estado da fila de estudo.

Capturas externas adicionam `review_state` como fila de triagem. Elas podem permanecer `pending` ou `deferred` por tempo indeterminado; nenhuma cadência promove ou descarta conteúdo automaticamente. Somente itens aprovados entram no fluxo canônico de validação, aprovação e commit.
