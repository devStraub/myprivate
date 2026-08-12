# Projeto Zeta

Projeto experimental de jogo de evolução, sobrevivência, simulação e expansão em escala planetária/espacial, desenvolvido em Unreal Engine 5.

## Estado

Fase atual: **fundação técnica / protótipo inicial**.

O objetivo imediato não é construir o universo completo. É provar o loop fundamental de gameplay e estabelecer uma arquitetura que possa crescer sem precisar ser descartada.

## Para humanos

Leia nesta ordem:

1. `Docs/PROJECT_VISION.md`
2. `Docs/GAME_DESIGN_FOUNDATIONS.md`
3. `Docs/ARCHITECTURE.md`
4. `Docs/DEVELOPMENT_ENVIRONMENT.md`
5. `Docs/UNREAL_EDITOR_WORKFLOW.md`
6. `Docs/ROADMAP.md`

## Para Codex

Leia primeiro:

1. `AGENTS.md`
2. `Docs/PROJECT_VISION.md`
3. `Docs/ARCHITECTURE.md`
4. a documentação específica da tarefa.

## Tecnologia

- Unreal Engine 5
- C++
- Blueprint como camada visual/configurável
- Git
- Windows como ambiente primário inicial

## Objetivo do primeiro protótipo

Uma pequena área jogável em que:

- existe um ambiente;
- um grupo inicial de criaturas pode existir;
- há pelo menos uma necessidade;
- há pelo menos um recurso;
- existe interação/coleta;
- existe algum consumo/transformação do recurso;
- o estado do grupo muda como consequência;
- o jogador consegue observar e influenciar o sistema.

Isso deve ser pequeno o bastante para ser compreendido e testado rapidamente.

## Regra do projeto

Primeiro provar o **DNA da gameplay**.

Depois aumentar escala.

## Segurança do contexto Git

Este projeto deve ser desenvolvido exclusivamente no worktree `C:\dev\projeto_zeta`, associado à branch `projeto-zeta`.

Antes de uma tarefa que altere o projeto, execute:

```powershell
.\Scripts\Verify-ZetaGitContext.ps1
```

O script retorna erro se o top-level Git ou a branch ativa não corresponderem ao contexto dedicado do Projeto Zeta. Nunca faça merge entre `projeto-zeta` e `main`, em nenhuma direção.
