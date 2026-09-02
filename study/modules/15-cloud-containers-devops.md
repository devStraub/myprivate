---
id: curriculum-cloud-containers-devops
title: 15 — Cloud, Containers & DevOps
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

# 15 — Cloud, Containers & DevOps

## Objetivo

Levar software de source code a ambiente executável e reproduzível com automação de infraestrutura e entrega.

## Tópicos alvo

- Docker images, layers, registry, networking, volumes e multi-stage builds;
- container security;
- Kubernetes: pods, deployments, services, ingress, config, secrets, health checks, autoscaling e storage;
- cloud: compute, storage, networking, load balancing, IAM, managed databases, regions/zones e HA;
- Infrastructure as Code e Terraform;
- CI/CD, artifacts e pipelines;
- rolling, blue/green, canary e rollback;

## Projeto público sugerido

`lab-cloud-native-deployment`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- pipeline executa build e testes;
- gera container reproduzível;
- infraestrutura é declarativa quando viável;
- deploy inclui health check;
- documenta rollback/deployment strategy;
- se usar cloud real, mantém custo e credenciais fora do repositório;


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

- MIT hands-on/laboratory philosophy e systems;
- Stanford Systems;
- adaptação profissional para cloud-native engineering;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
