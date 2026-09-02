---
id: curriculum-networking-web-fundamentals
title: 09 — Networking & Web Fundamentals
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

# 09 — Networking & Web Fundamentals

## Objetivo

Entender a comunicação de rede e protocolos Web antes das abstrações de framework.

## Tópicos alvo

- OSI como modelo conceitual;
- TCP/IP, Ethernet e IP;
- subnets, routing e NAT;
- TCP, UDP e ports;
- DNS e firewall;
- TLS;
- HTTP/1.1, HTTP/2 e HTTP/3;
- methods, headers, status, cookies, caching, compression e keep-alive;
- CORS e content negotiation;
- REST, RPC, gRPC, GraphQL, WebSockets, SSE e webhooks;

## Projeto público sugerido

`lab-networking-api-protocols`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- cria cliente/servidor simples sem esconder tudo atrás de framework;
- inspeciona requisições/respostas na rede;
- compara pelo menos dois estilos/protocolos;
- demonstra timeout, conexão ou falha de rede;
- documenta TLS/DNS/HTTP no caminho completo;


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

- Stanford Systems/Computer Engineering: networking stack;
- MIT EECS: computer systems e communications foundations;
- CMU systems;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
