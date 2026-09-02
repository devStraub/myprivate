---
id: copilot-work-start-prompt
title: Prompt de início para Copilot e outros agentes
type: agent-prompt
status: draft
created: 2026-09-02
updated: 2026-09-02
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: unknown
    role: drafting
    date: 2026-09-02
sources: []
related: [ai-assisted-development.md, ../AGENTS.md]
visibility: private
---

# Prompt de início para Copilot e outros agentes

Use o texto abaixo no início de uma demanda. Ajuste apenas os caminhos para a cópia local da Toolbox.

```text
Leia primeiro AGENTS.md e work/ai-assisted-development.md da Developer Toolbox, além das políticas
de sanitização relacionadas. Trate esses arquivos como regras de execução desta demanda.

Aguarde meu descritivo da implementação. A partir dele, antes de alterar qualquer arquivo:

1. inspecione somente o contexto necessário;
2. crie plan.md usando templates/ai-work-plan.md;
3. registre escopo, fora de escopo, assumptions, perguntas, riscos, passos e validações;
4. identifique os arquivos que podem mudar;
5. crie backup timestampado desses arquivos e um manifesto com tamanho e SHA-256;
6. inicie telemetria operacional mínima em JSONL usando templates/ai-work-telemetry.jsonl;
7. confirme que os artefatos operacionais estão em local corporativo autorizado e fora do commit;
8. implemente em passos pequenos, atualizando plano e telemetria após cada validação;
9. não copie código, plano, backup, diff, logs ou telemetria bruta para a Toolbox ou mídia pessoal;
10. ao final, gere em work/intake apenas um novo draft abstrato e sanitizado se houver aprendizado
reutilizável. Mantenha review_state: pending e sanitization.approved: false.

Não invente requisitos. Pare e me consulte se houver segredo, requisito contraditório, mudança destrutiva,
expansão material de escopo ou impossibilidade de criar um backup seguro.
```

Depois, envie o descritivo da demanda com objetivo, comportamento atual e desejado, critérios de aceite,
restrições, componentes autorizados e testes esperados. Informações ausentes podem permanecer como
perguntas no plano.
