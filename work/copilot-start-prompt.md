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

1. leia work/agent-routing.md e classifique escopo, ambiguidade, impacto, diagnóstico e validação;
2. se o agente atual não for adequado, recomende Luna ou Sol com função, motivo e ponto de retorno;
3. aguarde minha decisão apenas quando a troca for necessária para prosseguir com segurança;
4. inspecione somente o contexto necessário;
5. dentro da raiz do projeto alterado, crie `.ai-work/plan.md` usando templates/ai-work-plan.md;
6. registre escopo, fora de escopo, assumptions, perguntas, riscos, passos e validações;
7. identifique os arquivos que podem mudar;
8. crie os backups em `.ai-work/backups/<timestamp>/`, com manifesto, tamanho e SHA-256;
9. inicie `.ai-work/telemetry.jsonl` usando templates/ai-work-telemetry.jsonl;
10. confirme que os artefatos operacionais estão em local corporativo autorizado e fora do commit;
11. implemente em passos pequenos, atualizando plano e telemetria após cada validação;
12. diferencie o que foi configurado, executado, observado e aprovado; registre gates pendentes e o
responsável pela confirmação quando não puder observá-los;
13. não copie código, plano, backup, diff, logs ou telemetria bruta para a Toolbox ou mídia pessoal;
14. ao final, gere em work/intake apenas um novo draft abstrato e sanitizado se houver aprendizado
reutilizável. Mantenha review_state: pending e sanitization.approved: false.
15. depois da validação, aceitação e criação do draft sanitizado, confira que `.ai-work/` pertence ao
projeto e contém somente artefatos operacionais; então remova o diretório por completo.

No draft, separe fatos observados, inferências da IA e itens não verificados. Remova contagens exatas,
cronologia rara e combinações operacionais desnecessárias.

Não invente requisitos. Pare e me consulte se houver segredo, requisito contraditório, mudança destrutiva,
expansão material de escopo ou impossibilidade de criar um backup seguro.
Não apague `.ai-work/` enquanto houver validação, rollback ou aprovação pendente.
```

Depois, envie o descritivo da demanda com objetivo, comportamento atual e desejado, critérios de aceite,
restrições, componentes autorizados e testes esperados. Informações ausentes podem permanecer como
perguntas no plano.
