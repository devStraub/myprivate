---
id: developer-toolbox-readme
title: Developer Toolbox
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
related: [AGENTS.md, governance/README.md]
visibility: private
---

# Developer Toolbox

Base pessoal, portátil e versionada para transformar estudo e experiência sanitizada em conhecimento reutilizável por pessoas e agentes de IA. Markdown e Git são a camada fundamental; nenhum banco de dados, fornecedor de IA ou serviço externo é necessário para navegar pelo conteúdo.

## Por que existe

- preservar modelos mentais, decisões, evidências e lições ao longo do tempo;
- melhorar estudos e investigações futuras sem confundir sugestão de IA com fato;
- registrar experiência profissional de forma generalizada e sem ativos de terceiros;
- sustentar futuramente CV, portfólio ou uma interface consultável por IA com evidências.

## Mapa

| Caminho | Pergunta principal |
| --- | --- |
| [`knowledge/`](knowledge/README.md) | Como isso funciona? |
| [`patterns/`](patterns/README.md) | Reconheço este tipo de situação? |
| [`cases/`](cases/README.md) | O que aprendemos em uma experiência sanitizada? |
| [`decisions/`](decisions/README.md) | Por que uma alternativa foi escolhida? |
| [`playbooks/`](playbooks/README.md) | Como conduzir uma atividade? |
| [`checklists/`](checklists/README.md) | O que não pode ser esquecido? |
| [`stacks/`](stacks/README.md) | Onde está o material de uma tecnologia? |
| [`areas/`](areas/README.md) | Onde está o material de um domínio de engenharia? |
| [`study/`](study/README.md) | Como descobrir, priorizar, estudar e consolidar entendimento? |
| [`work/`](work/README.md) | Como extrair aprendizado seguro do trabalho? |
| [`sources/`](sources/README.md) | De onde vieram as afirmações? |
| [`profile-data/`](profile-data/README.md) | Que evidências sustentam o perfil profissional? |
| [`governance/`](governance/README.md) | Quais regras protegem a qualidade e a confidencialidade? |
| [`templates/`](templates/README.md) | Como propor um documento novo? |

## Como navegar

Comece por este mapa ou pelo índice da tecnologia/área relevante. Consulte somente o necessário. [`AGENTS.md`](AGENTS.md) orienta agentes; [`PRINCIPLES.md`](PRINCIPLES.md) e [`VALIDATION.md`](VALIDATION.md) orientam decisões e solução de problemas.

## Uso no estudo

Siga [`study/study-workflow.md`](study/study-workflow.md), registre a sessão com o template apropriado e separe o que precisa ser internalizado, reconhecido, externalizado ou delegado à IA. [`study/scouting/`](study/scouting/README.md) guarda material descoberto por agentes e [`study/backlog/`](study/backlog/README.md) organiza temas aceitos para estudo. Só consolide conclusões após evidência e revisão humana.

## Estoque de estudo

Scouting, backlog, estudo, compreensão, aplicação e experiência são estados distintos. Material encontrado por IA pode apoiar uma investigação, mas não aumenta proficiência, não alimenta o perfil e não comprova experiência. Consulte a [regra de proveniência](governance/provenance.md#estado-de-aprendizagem-e-evidência-profissional).

## Uso no trabalho

Siga [`work/work-workflow.md`](work/work-workflow.md). Antes de registrar qualquer experiência, cumpra obrigatoriamente [`governance/sanitization.md`](governance/sanitization.md). A Toolbox recebe a lição generalizada, nunca código, dados, nomes ou arquitetura identificável de terceiros.

## Como adicionar conhecimento

1. Pesquise conteúdo existente e prefira atualizá-lo quando o conceito já tiver identidade definida.
2. Escolha o tipo correto e copie um arquivo de [`templates/`](templates/README.md).
3. Registre proveniência, participação de IA, incertezas e relações.
4. Sanitize quando houver qualquer contexto profissional.
5. Prepare uma proposta ou diff e solicite revisão humana.
6. Incorpore e faça commit somente após aprovação.

Uma aprovação de investigação ou escrita não torna automaticamente uma afirmação `validated`. Consulte o [ciclo de vida](governance/knowledge-lifecycle.md).

## Manutenção

Execute periodicamente o procedimento de [`governance/maintenance.md`](governance/maintenance.md). A primeira saída deve ser uma proposta; consolidações, remoções e mudanças destrutivas exigem aprovação humana.

## Uso portátil

Uma cópia em pen drive pode ser usada sem Git em outro dispositivo. Nesse modo, agentes consultam a base consolidada e criam somente novas capturas em `work/intake` ou nas áreas de estudo, sem alterar conteúdo canônico. Ao retornar, importe por `capture_id`, revise sob demanda e consolide apenas o que for aprovado. Consulte [`governance/portable-capture.md`](governance/portable-capture.md).

## Perfil e publicação futura

[`PROFILE.md`](PROFILE.md) é o resumo humano. [`profile-data/`](profile-data/README.md) preserva índices de competências e evidências, distinguindo estudo, aplicação, experiência e análise de IA. A visibilidade padrão é `private`; publicação nunca é automática.

## Primeiro uso

- revise e aprove a fundação;
- substitua campos pessoais de [`PROFILE.md`](PROFILE.md) somente com dados fornecidos pelo proprietário;
- escolha uma pequena sessão de estudo ou experiência sanitizável;
- ou solicite uma Knowledge Scouting Session para mapear lacunas, mantendo os resultados como material não estudado;
- em outro dispositivo, mantenha a captura append-only e `review_state: pending`;
- produza a primeira proposta usando um template;
- valide os links e faça um commit semanticamente claro.
