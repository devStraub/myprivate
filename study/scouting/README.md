---
id: knowledge-scouting-index
title: Knowledge Scouting
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
related: [../README.md, ../backlog/README.md, ../../templates/scouting.md, ../../governance/provenance.md]
visibility: private
---

# Knowledge Scouting

Material descoberto, filtrado e pré-organizado por agentes antes do estudo formal. Pode mapear conceitos, documentação oficial, papers, livros, artigos, engineering blogs, repositórios, práticas, anti-patterns, debates, ferramentas, versões, mudanças arquiteturais e possíveis lacunas.

Scouting não representa conhecimento dominado pelo proprietário. Todo item deve começar, no mínimo, com:

```yaml
status: provisional
confidence: medium
origin: [ai-assisted-analysis]
learning_state: not-studied
eligible_as_professional_evidence: false
```

Confiança deve ser reduzida quando fontes ou aplicabilidade forem fracas. `provisional` não significa “estudado”.

## Knowledge Scouting Session

Somente mediante solicitação do usuário, o agente pode:

1. consultar curriculum, áreas, stacks, knowledge, patterns, cases, decisions, sources, profile-data e backlog;
2. identificar cobertura baixa, pré-requisitos, temas de trabalho ainda não estudados e conteúdo possivelmente desatualizado;
3. procurar mudanças de tecnologias, assuntos complementares, conceitos úteis para validar IA e temas relevantes à evolução profissional;
4. quando houver acesso apropriado, pesquisar fontes externas e registrar autoridade, atualidade, aplicabilidade e limitações;
5. preparar arquivos em scouting e propostas para o backlog;
6. apresentar tudo para revisão humana, sem promover o material a knowledge validado.

Use [`../../templates/scouting.md`](../../templates/scouting.md). Uma sessão pode terminar sem recomendações quando não houver evidência suficiente.

## Saída obrigatória da sessão

A proposta deve responder, com evidência e incertezas:

1. quais áreas estão pouco cobertas;
2. quais temas são pré-requisitos de outros;
3. quais assuntos surgiram no trabalho mas ainda não foram estudados;
4. quais conhecimentos parecem desatualizados;
5. quais tecnologias sofreram mudanças relevantes;
6. quais assuntos complementariam experiência já documentada;
7. quais conceitos aumentariam a capacidade de validar respostas de IA;
8. quais temas parecem importantes para evolução profissional;
9. quais fontes confiáveis existem para cada tema.

Se atualização temporal ou fontes externas forem necessárias, o agente deve pesquisar somente quando tiver acesso apropriado e registrar data de corte. Nenhuma varredura autônoma ou recorrente é implementada na v0.1.

Em cópia portátil, cada scouting é um arquivo novo com `capture_id` e `review_state: pending`. Não reescreva scouting anterior para incorporar novidades; crie uma nova captura relacionada e deixe a consolidação para revisão posterior.

## Uso operacional antes do estudo

Agentes podem consultar material de scouting para resolver um problema, desde que deixem explícitos `learning_state: not-studied`, a confiança e as fontes. O uso operacional não altera proficiência, perfil ou experiência. Após a demanda, pode ser proposto um case sanitizado e um item de backlog independente.

## Relação com trabalho

Um case pode revelar um tema não dominado. Registre no case apenas o tema generalizado; não exponha contexto corporativo no scouting. A sequência é: case sanitizado → lacuna → scouting autorizado → fontes → proposta de backlog → estudo → validação.

## Índice

Nenhum scouting foi executado na v0.1.
