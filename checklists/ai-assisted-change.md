---
id: ai-assisted-change-checklist
title: Checklist — mudança assistida por IA
type: checklist
status: draft
created: 2026-09-02
updated: 2026-09-02
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: unknown
    role: structure
    date: 2026-09-02
sources: []
related: [../work/ai-assisted-development.md, ../VALIDATION.md]
visibility: private
---

# Checklist — mudança assistida por IA

## Antes de implementar

- [ ] Escopo, ambiguidade, impacto, diagnóstico e validação foram classificados?
- [ ] O agente atual é adequado ao papel ou recomendou uma troca com justificativa concreta?
- [ ] A decisão humana sobre a recomendação foi registrada?
- [ ] O briefing informa problema, resultado esperado e critérios de aceite?
- [ ] Escopo e fora de escopo estão explícitos?
- [ ] `plan.md` existe e contém passos verificáveis?
- [ ] `plan.md`, backups e telemetria estão em `<raiz-do-projeto>/.ai-work/`?
- [ ] `.ai-work/` está excluído do versionamento sem alteração silenciosa do `.gitignore` compartilhado?
- [ ] Assumptions e perguntas abertas estão visíveis?
- [ ] Os arquivos-alvo foram identificados sem ampliar silenciosamente o escopo?
- [ ] O backup timestampado existe, tem manifesto e passou por verificação de leitura?
- [ ] Nenhum secret, `.env`, dump, dado real ou dependência foi copiado para o backup?
- [ ] A telemetria registra somente dados operacionais mínimos?

## Durante

- [ ] Existe apenas um passo principal `in_progress`?
- [ ] A alteração atual corresponde a um passo do plano?
- [ ] Descobertas que mudam o plano foram registradas?
- [ ] O executor bloqueou e devolveu ao planner qualquer descoberta material, em vez de reinterpretar o plano?
- [ ] Mudanças humanas posteriores ao backup estão sendo preservadas?
- [ ] O agente parou diante de requisito contraditório, segredo ou expansão material?
- [ ] Cada etapa produziu evidência verificável, não apenas uma afirmação da IA?
- [ ] Está claro o que foi configurado, executado, observado e aprovado?
- [ ] Gates indisponíveis localmente têm pendência e responsável registrados?

## Revisão técnica

- [ ] O diff contém somente arquivos esperados?
- [ ] A solução mais simples suficiente foi escolhida?
- [ ] Um desenvolvedor familiarizado com a linguagem entende rapidamente intenção, fluxo e falhas?
- [ ] Alguma explicação longa está compensando nomes ruins, funções extensas ou responsabilidades misturadas?
- [ ] Os comentários explicam motivos e restrições, em vez de apenas traduzir o que o código faz?
- [ ] Há busca repetida, N+1, carga excessiva ou processamento que deveria ficar no banco?
- [ ] Contratos públicos, compatibilidade e migração foram considerados?
- [ ] Concorrência, idempotência, transações e retries importam neste caso?
- [ ] Logs e erros evitam secrets, payloads e dados pessoais?
- [ ] Testes cobrem comportamento, limites e regressão relevante?
- [ ] Falhas de testes foram investigadas, não ocultadas?
- [ ] Há observabilidade suficiente para diagnosticar a mudança?
- [ ] Em fluxos distribuídos, a etapa e a camada da falha foram distinguidas?
- [ ] Em migrações, há matriz de compatibilidade e critérios de saída por etapa?
- [ ] Em dependências, inventário foi separado de achados acionáveis e a árvore resolvida foi validada?
- [ ] O rollback é realista e foi descrito?

## Encerramento e aprendizado

- [ ] Critérios de aceite foram comparados com evidência observada?
- [ ] Limitações e riscos residuais estão claros?
- [ ] Plano e telemetria refletem o resultado real?
- [ ] Validações e aceitação necessárias terminaram antes da limpeza?
- [ ] Existe aprendizado reutilizável ou “nenhum” é a conclusão correta?
- [ ] Qualquer draft da Toolbox foi criado do zero, abstraído e sanitizado?
- [ ] O draft separa observação, inferência da IA e item não verificado?
- [ ] Contagens exatas, cronologia rara e combinações operacionais desnecessárias foram removidas?
- [ ] Nenhum plano, backup, diff, log ou telemetria bruta foi levado ao pen drive ou Git pessoal?
- [ ] O caminho de `.ai-work/` foi conferido como pertencente ao projeto e contendo apenas artefatos operacionais?
- [ ] Após a extração sanitizada, `.ai-work/` foi removido por completo?
