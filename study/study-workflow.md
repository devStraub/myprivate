---
id: study-workflow
title: Workflow de estudo
type: workflow
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
related: [../templates/study-session.md, curriculum.md, ../VALIDATION.md]
visibility: private
---

# Workflow de estudo

```text
Descobrir ou escolher assunto → Mapear conhecimento atual → Definir objetivos
→ Consumir fonte primária → Registrar dúvidas → Conversar com IA
→ Aprofundar conceitos → Buscar fontes complementares
→ Comparar abordagens → Executar exercícios/experimentos
→ IA propõe situações problemáticas → Usuário identifica riscos
→ Validar entendimento → Extrair conhecimento
→ Propor criação/atualização → Revisão humana
```

## 1. Preparar

1. Escolha um assunto diretamente, no [`backlog`](backlog/README.md) ou em uma proposta de [`scouting`](scouting/README.md).
2. Defina motivação, escopo e critérios de entendimento.
3. Consulte índices relevantes e registre o conhecimento atual sem reescrevê-lo.
4. Crie uma sessão a partir de [`../templates/study-session.md`](../templates/study-session.md); mude `learning_state` para `studying` somente quando o estudo começar de fato.

## Scouting opcional

Quando solicitado pelo usuário, uma Knowledge Scouting Session pode mapear cobertura, pré-requisitos, mudanças recentes e fontes antes da escolha. Seus resultados permanecem `provisional`, `not-studied` e inelegíveis como evidência profissional. O agente propõe itens; o usuário decide o que entra no backlog.

## 2. Investigar

1. Prefira fonte primária ou mais autoritativa disponível.
2. Registre cada fonte conforme [`../templates/source.md`](../templates/source.md).
3. Liste dúvidas, assumptions e pontos que parecem contraditórios.
4. Use IA para explicar, comparar, questionar e gerar contraexemplos; registre sua participação.
5. Consulte fontes complementares quando autoridade, atualidade ou aplicabilidade forem insuficientes.

## 3. Praticar e desafiar

1. Execute exercícios ou experimentos proporcionais ao tema.
2. Peça à IA exemplos problemáticos, soluções aparentemente plausíveis e failure modes.
3. Tente identificar riscos antes de ler a análise da IA.
4. Busque falsificar o próprio entendimento e aplique [`../VALIDATION.md`](../VALIDATION.md).

## 4. Classificar o aprendizado

- **Internalizar:** modelos mentais necessários para julgar soluções.
- **Reconhecer:** patterns, sintomas, riscos, trade-offs e anti-patterns.
- **Externalizar:** detalhes, checklists, procedimentos, evidências e referências recuperáveis.
- **Delegar à IA:** sintaxe, boilerplate e consultas pontuais que podem ser recuperadas e verificadas sob demanda.

Delegar não elimina responsabilidade por validar a saída.

## 5. Consolidar

1. Diferencie o que foi compreendido, apenas lido, observado em experimento ou sugerido por IA.
2. Pesquise conteúdo existente e escolha atualizar ou criar conforme o [ciclo de vida](../governance/knowledge-lifecycle.md).
3. Relacione sessão, fontes, knowledge, patterns, decisions, stacks e áreas.
4. Apresente a proposta com status e confiança proporcionais à evidência.
5. Aguarde revisão humana antes de incorporar ou promover.

Ao concluir um item de backlog, atualize `backlog_status` separadamente. `completed` descreve o objetivo da fila, não proficiência ou experiência.

Em dispositivo sem Git, registre sessões, scouting e backlog como arquivos novos com `review_state: pending`. A revisão pode ocorrer em qualquer momento posterior; não há promoção automática por idade ou quantidade.

## Critério de conclusão

A sessão pode terminar com dúvidas abertas. Registre o que permanece incerto, como poderia ser validado e quando revisar; não force uma síntese falsa apenas para concluir o assunto.
