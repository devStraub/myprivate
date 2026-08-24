---
id: study-backlog-index
title: Backlog de estudo
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
related: [../README.md, ../scouting/README.md, ../../templates/study-backlog.md, ../curriculum.md]
visibility: private
---

# Backlog de estudo

Fila operacional de temas considerados relevantes e ainda não consolidados pelo estudo. O curriculum é o mapa macro; o backlog contém unidades priorizáveis.

Cada item registra tema, motivação, áreas, tecnologias, prioridade, pré-requisitos, dificuldade estimada, profundidade desejada, fontes sugeridas, origem da recomendação, relações existentes, lacuna que pode preencher, data, agente/modelo e estado.

## Estados do backlog

Use `backlog_status` para não confundir a fila com o `status` de governança do documento:

- `discovered`: tema identificado, ainda não triado;
- `queued`: aceito e priorizável;
- `studying`: estudo em andamento;
- `review`: síntese ou evidência aguardando revisão;
- `completed`: objetivo de estudo concluído no escopo declarado;
- `discarded`: removido da fila com justificativa preservada.

`completed` não significa experiência profissional nem proficiência ampla. A evidência produzida deve ter seus próprios status, confiança e estado de aprendizagem.

No dispositivo externo, novos itens entram como arquivos append-only com `review_state: pending`. `backlog_status` pode indicar a intenção da fila, mas somente a máquina de consolidação aplica transições aprovadas a itens já importados.

## Priorização

Considere dependências, risco profissional, recorrência em cases, lacunas conceituais, capacidade de avaliar respostas de IA, atualidade e valor esperado. Uma recomendação de IA não define prioridade sozinha.

Use [`../../templates/study-backlog.md`](../../templates/study-backlog.md). Mudanças em lote, agrupamentos ou descarte exigem proposta de manutenção e aprovação humana.

## Índice

Nenhum item foi adicionado ao backlog na v0.1.
