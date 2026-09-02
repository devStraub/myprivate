---
id: curriculum-ai-engineering-llm
title: 19 — AI Engineering & LLM Systems
type: curriculum-module
status: draft
curriculum_state: planned
created: 2026-08-26
updated: 2026-09-01
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: structure
    date: 2026-08-26
sources: []
related: [../curriculum.md, ../learning-methodology.md, ../public-labs.md]
visibility: private
---

# 19 — AI Engineering & LLM Systems

## Objetivo

Construir sistemas com LLMs de forma grounded, avaliável, segura e economicamente consciente.

## Tópicos alvo

- tokens, context, transformers e inference;
- temperature e structured output;
- tool use;
- prompt instructions, context, examples e constraints;
- prompt injection e boundaries;
- RAG: embeddings, chunking, vector/hybrid search, reranking, retrieval, grounding e citations;
- agents: tools, planning, state, memory, workflows e human-in-the-loop;
- evaluations, hallucination e guardrails;
- latency, cost, caching e observability;
- privacy e security;

## Projeto público sugerido

`lab-ai-rag-engineering`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- implementa RAG ou fluxo de grounding real;
- respostas apresentam evidência/citação quando possível;
- inclui avaliação de qualidade além de demo manual;
- demonstra proteção/limitação contra prompt injection relevante;
- mede custo/latência de ao menos um fluxo;
- documenta failure modes e quando não usar LLM;


## Requisitos pedagógicos

O Codex deve produzir implementação funcional, testes, comentários didáticos, README e `STUDY_GUIDE.md`. O proprietário deve percorrer o código seguindo o fluxo, questionar decisões, executar os cenários relevantes e consultar o material livremente sempre que surgir uma dúvida, conforme [`../learning-methodology.md`](../learning-methodology.md).

Não existe carga horária mínima nem exigência de autoria manual do código.

## Evidência e estado

- material preparado pode ser consultado como parte da trilha;
- `studied` depende da confirmação humana após o ciclo de estudo;
- `applied` exige o laboratório público cobrindo os requisitos;
- `professional` exige evidência profissional distinta e sanitizada;
- não há prova, score ou condição obrigatória de aprovação; dúvidas e revisões podem ocorrer a qualquer momento.

## Referências acadêmicas relacionadas

- MIT AI/ML areas;
- Stanford AI track;
- CMU AI requirement;
- adaptação profissional para LLM systems modernos;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
