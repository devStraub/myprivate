---
id: templates-index
title: Templates
type: index
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
related: [../governance/provenance.md, ../governance/knowledge-lifecycle.md]
visibility: private
---

# Templates

| Template | Uso |
| --- | --- |
| [`knowledge.md`](knowledge.md) | Conceito reutilizável: “como funciona?” |
| [`pattern.md`](pattern.md) | Situação recorrente, boa prática ou anti-pattern |
| [`case.md`](case.md) | Experiência real sanitizada |
| [`decision.md`](decision.md) | Escolha e trade-offs com memória histórica |
| [`source.md`](source.md) | Avaliação de fonte externa |
| [`study-session.md`](study-session.md) | Sessão de estudo e validação de entendimento |
| [`work-learning.md`](work-learning.md) | Proposta sanitizada extraída de trabalho |
| [`scouting.md`](scouting.md) | Knowledge Scouting Session e material descoberto |
| [`study-backlog.md`](study-backlog.md) | Item priorizável do backlog de estudo |

## Uso

1. Pesquise o índice e o texto antes de criar um arquivo.
2. Copie o template para o diretório do tipo; não edite o template como se fosse conteúdo.
3. Substitua instruções entre `<...>` e remova seções realmente não aplicáveis com justificativa.
4. Use ID único em kebab-case e links relativos a partir do documento criado.
5. Comece em `draft`; somente revisão humana pode aprovar incorporação ou promoção.
6. Não preencha campos desconhecidos com inferências. Use `unknown`, listas vazias ou declare a incerteza.
7. Em captura portátil, preencha `capture_id`, `captured_at` e `review_state: pending`; não edite documentos consolidados.

O schema e os valores controlados estão em [`../governance/provenance.md`](../governance/provenance.md).
