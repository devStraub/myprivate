---
id: agent-lifecycle
title: Ciclo de vida de agentes especialistas
type: policy
status: draft
created: 2026-10-06
updated: 2026-10-06
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5
    role: structure
    date: 2026-10-06
sources: []
related: [../agents/README.md, provenance.md, sanitization.md, ../profile-data/agent-history.md]
visibility: private
---

# Ciclo de vida de agentes especialistas

```text
NECESSIDADE → PROPOSTA → CRIAÇÃO → REVISÃO HUMANA → USO
→ EVIDÊNCIA → REFINAMENTO / SUSPENSÃO / APOSENTADORIA
```

## Registro mínimo

Cada agente deve declarar:

- problema que resolve e situações que não resolve;
- fontes canônicas, versão, vigência e data da última consulta;
- decisões que pode apoiar e decisões que exigem confirmação humana;
- saídas esperadas e evidência mínima;
- riscos de desatualização, interpretação e confidencialidade;
- histórico de alterações relevantes;
- relação com aprendizagem e experiência, sem promoção automática.

## Estados

- `draft`: estrutura inicial ainda não aprovada;
- `active`: aprovado para consulta e uso dentro do escopo;
- `review-required`: fonte mudou, há dúvida de vigência ou foi detectada falha material;
- `suspended`: não deve ser usado até resolver uma limitação;
- `retired`: substituído ou sem utilidade atual, com histórico preservado.

O estado do agente é diferente do `status` dos documentos que ele consulta.

## Evidência de aprendizagem e experiência

O histórico do agente pode sustentar o perfil somente com uma cadeia verificável:

```text
artefato criado
+ conteúdo revisado pelo proprietário
+ uso identificado
+ resultado observado
+ síntese sanitizada aprovada
= evidência delimitada
```

- criação assistida pode ser evidência de autoria/curadoria assistida;
- leitura e revisão podem ser evidência de estudo;
- uso em simulação pode ser evidência de aplicação pessoal;
- uso em trabalho pode ser evidência profissional apenas após sanitização e aprovação;
- quantidade de agentes, prompts ou arquivos não representa senioridade;
- o agente nunca atualiza `learning_state`, perfil ou experiência por conta própria.

Registre usos candidatos com [`../templates/agent-use.md`](../templates/agent-use.md). Somente após revisão
humana, encaminhe evidências aprovadas aos índices de [`../profile-data/`](../profile-data/README.md).

## Atualização de agentes regulatórios

Agentes de domínio regulado devem manter histórico temporal, não sobrescrever silenciosamente regras
anteriores. Cada mudança registra publicação, vigência, fonte, impacto provável e itens ainda não
verificados. Quando a vigência depender da data da operação ou da versão do sistema, a resposta deve
explicitar qual recorte foi usado.

## Confidencialidade

O agente pode revisar artefatos profissionais apenas no ambiente corporativo autorizado. Inventário de
serviços, fluxos, código, logs, payloads e lacunas internas permanecem nesse ambiente. A Toolbox recebe
somente regras públicas e aprendizados generalizados que cumpram
[`sanitization.md`](sanitization.md).
