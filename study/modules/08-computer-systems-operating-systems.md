---
id: curriculum-computer-systems-operating-systems
title: 08 — Computer Systems & Operating Systems
type: curriculum-module
status: draft
curriculum_state: planned
created: 2026-08-26
updated: 2026-08-26
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

# 08 — Computer Systems & Operating Systems

## Objetivo

Compreender como CPU, memória, processos, threads, I/O e kernel afetam software.

## Tópicos alvo

- CPU e memory hierarchy;
- cache e virtual memory;
- processes, threads e scheduling;
- context switching e interrupts;
- system calls e user/kernel mode;
- file systems e file descriptors;
- I/O e sockets;
- signals e IPC;
- containers, namespaces e cgroups;
- Linux: processos, filesystem, permissões, pipes, logs, networking, shell e diagnóstico;

## Projeto público sugerido

`lab-linux-systems`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- observa processos/threads/memória com ferramentas do sistema;
- demonstra file descriptors, I/O ou sockets;
- explica algum efeito da hierarquia de memória;
- mostra namespaces/cgroups ou mecanismo equivalente de isolamento;
- inclui guia de diagnóstico Linux;


## Requisitos pedagógicos

O Codex deve produzir implementação funcional, testes, comentários didáticos, README e `STUDY_GUIDE.md`. O proprietário deve percorrer o código seguindo o fluxo, questionar decisões, executar experimentos relevantes e completar o loop privado de avaliação descrito em [`../learning-methodology.md`](../learning-methodology.md).

Não existe carga horária mínima nem exigência de autoria manual do código.

## Evidência e estado

- material preparado pode ser consultado como parte da trilha;
- `studied` depende da confirmação humana após o ciclo de estudo;
- `applied` exige o laboratório público cobrindo os requisitos;
- `professional` exige evidência profissional distinta e sanitizada;
- score de avaliação não é persistido.

## Referências acadêmicas relacionadas

- Stanford Systems: OS, memory models e hardware/software interface;
- CMU: Introduction to Computer Systems;
- MIT EECS: computer systems engineering;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
