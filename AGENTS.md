---
id: agents-router
title: Roteador para agentes
type: agent-instructions
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
related: [README.md, PRINCIPLES.md, VALIDATION.md]
visibility: private
---

# Instruções para agentes

1. Entenda a solicitação e carregue apenas os índices e documentos relevantes; não leia a Toolbox inteira por padrão.
2. Leia [`PRINCIPLES.md`](PRINCIPLES.md). Ao solucionar problemas, aplique [`VALIDATION.md`](VALIDATION.md).
3. Em qualquer contexto profissional, obedeça [`governance/sanitization.md`](governance/sanitization.md); em dúvida, não registre.
4. Pesquise conhecimento existente antes de propor algo novo. Prefira atualizar a fonte canônica a duplicá-la.
5. Diferencie fato, hipótese, experiência, opinião e conclusão assistida por IA. Não trate afirmação de outro LLM como validação.
6. Registre provider/model (ou `unknown`), função e data quando IA tiver participação relevante.
7. Use os [`templates`](templates/README.md), registre proveniência e mantenha links entre cases, patterns, knowledge, decisions, sources, stacks e áreas.
8. Nenhum conhecimento novo é incorporado definitivamente ou promovido a `validated` sem aprovação humana e evidência apropriada.
9. Ao concluir trabalho ou estudo, avalie aprendizado reutilizável e apresente primeiro uma proposta clara para aprovação.
10. Não confunda scouting com aprendizado: “a IA encontrou” não significa que o proprietário estudou, compreendeu, aplicou ou adquiriu experiência. Scouting e backlog nunca alimentam perfil automaticamente.
11. Em cópia portátil ou dispositivo sem Git, siga [`governance/portable-capture.md`](governance/portable-capture.md): consulte o consolidado, crie apenas arquivos novos com `review_state: pending` e nunca sobrescreva conhecimento existente.

Rotas principais: conceitos em [`knowledge/`](knowledge/README.md), situações recorrentes em [`patterns/`](patterns/README.md), experiências sanitizadas em [`cases/`](cases/README.md), escolhas em [`decisions/`](decisions/README.md), descoberta em [`study/scouting/`](study/scouting/README.md), fila em [`study/backlog/`](study/backlog/README.md), estudo em [`study/`](study/README.md) e trabalho em [`work/`](work/README.md).
