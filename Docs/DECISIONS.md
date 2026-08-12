# Architecture & Design Decisions

Registro de decisões relevantes.

Formato:

```text
## ADR-XXX — Título

Data:
Status: Proposed | Accepted | Superseded

Contexto

Decisão

Consequências

Alternativas consideradas
```

---

## ADR-001 — Unreal Engine 5

Data: 2026-08-12
Status: Accepted

### Contexto

O projeto exige ambiente 3D de alta escala, C++, ferramentas visuais, multiplayer futuro e ecossistema amplo.

### Decisão

Utilizar Unreal Engine 5 como engine.

Alvo inicial de setup: UE 5.8, salvo versão diferente registrada pelo projeto.

### Consequências

- arquitetura integrará C++ e Blueprint;
- assets da Unreal serão parte importante do repositório;
- setup exige toolchain C++;
- operações visuais continuarão dependendo do Editor.

---

## ADR-002 — C++ como base de sistemas

Data: 2026-08-12
Status: Accepted

### Contexto

Projeto possui potencial de grande complexidade e precisa ser amigável a versionamento, revisão e desenvolvimento com Codex.

### Decisão

Implementar sistemas centrais preferencialmente em C++.

Blueprint continuará sendo ferramenta de primeira classe para composição e apresentação.

### Consequências

- melhor acesso do Codex à lógica;
- diffs de lógica mais legíveis;
- maior disciplina arquitetural;
- necessidade de toolchain C++ funcional desde o começo.

---

## ADR-003 — Protótipo antes de escala planetária

Data: 2026-08-12
Status: Accepted

### Contexto

A visão final contém sistema solar, mundos e multiplayer, mas o risco principal inicial é descobrir se o loop de população/evolução é divertido.

### Decisão

O primeiro produto técnico será um protótipo pequeno com criatura, necessidade, recurso e interação.

### Consequências

- planetas completos ficam fora do primeiro vertical slice;
- placeholder visual é aceitável;
- sistemas serão adicionados quando provarem valor.

---

## ADR-004 — Documentação no repositório como memória institucional

Data: 2026-08-12
Status: Accepted

### Contexto

O projeto será desenvolvido com assistência intensa de agentes Codex e discussões externas.

### Decisão

Decisões persistentes devem ser registradas no repositório.

`AGENTS.md` orienta comportamento dos agentes.

### Consequências

- prompts podem ser menores;
- contexto sobrevive entre sessões;
- documentação precisa ser atualizada junto com decisões.
