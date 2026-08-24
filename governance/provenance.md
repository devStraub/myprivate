---
id: provenance-policy
title: Proveniência e metadados
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
related: [knowledge-lifecycle.md, ../templates/README.md]
visibility: private
learning_state: not-studied
eligible_as_professional_evidence: false
capture_id:
captured_at:
review_state:
reviewed_at:
consolidated_into: []
---

# Proveniência e metadados

Toda afirmação relevante deve permitir distinguir se foi estudada, lida em documentação oficial, observada profissionalmente, testada pessoalmente, sugerida por IA, sustentada por fontes convergentes ou mantida apenas como hipótese.

## Front matter comum

Documentos usam YAML front matter. Campos básicos:

```yaml
---
id: identificador-humano-unico
title: Título
type: knowledge
status: draft
confidence: low
created: YYYY-MM-DD
updated: YYYY-MM-DD
last_reviewed:
domains: []
technologies: []
tags: []
origin: []
agents: []
sources: []
related: []
visibility: private
---
```

Índices e arquivos operacionais podem omitir `confidence`, `last_reviewed`, `domains`, `technologies` e `tags` quando esses campos não agregarem significado. Templates de conteúdo definem extensões específicas.

## Valores controlados

- `status`: `draft`, `provisional`, `validated`, `deprecated`, `disputed`.
- `confidence`: `low`, `medium`, `high`.
- `origin`: `professional-experience`, `study`, `official-documentation`, `book`, `paper`, `open-source`, `personal-experiment`, `ai-assisted-analysis`; múltiplos valores são permitidos.
- `visibility`: `private`, `public-candidate`, `public`.
- `learning_state`: `not-studied`, `studying`, `studied`, `understood`, `applied-personally`, `applied-professionally`.
- `eligible_as_professional_evidence`: booleano; normalmente `false` e nunca inferido de estudo, scouting ou uso assistido por IA.
- `review_state`: `pending`, `deferred`, `approved`, `rejected`, `consolidated`; usado somente em capturas portáteis ou propostas que aguardam triagem.

`public-candidate` significa elegível para revisão, não publicado. Mudança de visibilidade exige decisão humana explícita.

## Estado de aprendizagem e evidência profissional

`status`, `confidence` e `learning_state` respondem perguntas diferentes:

- `status`: em que etapa de governança está o documento?
- `confidence`: quão forte é a evidência da afirmação no escopo declarado?
- `learning_state`: qual é a relação documentada do proprietário com o tema?

Material gerado por scouting usa `origin: [ai-assisted-analysis]`, `learning_state: not-studied` e `eligible_as_professional_evidence: false`. Uma sessão estudada pode avançar o estado somente após revisão humana. Aplicação pessoal exige experimento documentado; aplicação profissional exige experiência real sanitizada. Mesmo `applied-professionally` não torna a evidência pública nem elimina a necessidade de aprovação.

Em backlog, use `backlog_status` (`discovered`, `queued`, `studying`, `review`, `completed`, `discarded`) sem substituir o `status` global.

Capturas portáteis também usam `capture_id`, `captured_at`, `reviewed_at` e `consolidated_into`. Esses campos permitem importação sem Git e não alteram evidência ou estado de aprendizagem. Consulte [`portable-capture.md`](portable-capture.md).

## Participação de IA

Quando relevante, registre:

```yaml
agents:
  - provider: unknown
    model: unknown
    role: analysis
    date: YYYY-MM-DD
    independently_validated: false
```

Use `unknown` em vez de adivinhar provider ou modelo. `role` pode ser `research`, `analysis`, `drafting`, `review`, `validation` ou `consolidation`. Validação independente deve apontar para evidência, não para concordância de outro LLM.

## Fontes

`sources` contém IDs registrados em [`../sources/`](../sources/README.md), não URLs soltas quando a fonte sustenta afirmações importantes. Para cada conclusão, explique no corpo o que a fonte sustenta, seus limites e se houve experimento ou convergência independente.

## Regras

- Não invente datas, fontes, autores, resultados ou grau de confiança.
- Use IDs estáveis em kebab-case; renomeações preservam histórico Git e atualizam links.
- Atualize `updated` ao alterar significado; atualize `last_reviewed` somente após revisão real.
- Registre contradições em vez de escolher silenciosamente a afirmação conveniente.
- Experiência profissional requer sanitização, mesmo quando a proveniência não pode revelar a organização.
- Scouting, backlog e execução assistida por IA não podem alimentar competências ou perfil automaticamente.
