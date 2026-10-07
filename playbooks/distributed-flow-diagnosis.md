---
id: distributed-flow-diagnosis-playbook
title: Diagnóstico de falhas em fluxos distribuídos
type: playbook
status: provisional
created: 2026-09-14
updated: 2026-09-14
origin: [professional-experience, ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: consolidation
    date: 2026-09-14
sources: []
related: [debugging.md, ../VALIDATION.md, ../areas/observability.md, ../areas/distributed-systems.md]
visibility: private
---

# Diagnóstico de falhas em fluxos distribuídos

## Objetivo

Reconstruir a etapa que falhou sem atribuir ao endpoint ou componente final uma falha ocorrida em
precondição, preparação, contrato, dependência ou infraestrutura.

## Procedimento

1. Desenhe as etapas lógicas do cenário, inclusive preparação e cleanup.
2. Defina expected e actual por etapa, não apenas para o resultado final.
3. Correlacione teste, requisição, chamador e dependência com identificador não sensível.
4. Registre timestamps em UTC, duração, tentativa e status esperado/observado quando aplicáveis.
5. Classifique a camada: `precondition`, `contract`, `dependency`, `implementation`, `infrastructure` ou `unknown`.
6. Classifique o resultado: sucesso, rejeição de contrato, falha de dependência, timeout ou falha de implementação.
7. Compare logs estruturados, traces, métricas, configuração e versão implantada.
8. Falsifique hipóteses e mantenha causa como desconhecida quando os sinais só mostram a camada.

## Segurança e limites

Pseudonimize identificadores e não registre payload, credencial, URL interna ou topologia desnecessária.
Correlação melhora o diagnóstico, mas não prova causalidade. Status HTTP isolado também não identifica
automaticamente a origem da falha.
