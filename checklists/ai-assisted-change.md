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

- [ ] O briefing informa problema, resultado esperado e critérios de aceite?
- [ ] Escopo e fora de escopo estão explícitos?
- [ ] `plan.md` existe e contém passos verificáveis?
- [ ] Assumptions e perguntas abertas estão visíveis?
- [ ] Os arquivos-alvo foram identificados sem ampliar silenciosamente o escopo?
- [ ] O backup timestampado existe, tem manifesto e passou por verificação de leitura?
- [ ] Nenhum secret, `.env`, dump, dado real ou dependência foi copiado para o backup?
- [ ] A telemetria registra somente dados operacionais mínimos?

## Durante

- [ ] Existe apenas um passo principal `in_progress`?
- [ ] A alteração atual corresponde a um passo do plano?
- [ ] Descobertas que mudam o plano foram registradas?
- [ ] Mudanças humanas posteriores ao backup estão sendo preservadas?
- [ ] O agente parou diante de requisito contraditório, segredo ou expansão material?
- [ ] Cada etapa produziu evidência verificável, não apenas uma afirmação da IA?

## Revisão técnica

- [ ] O diff contém somente arquivos esperados?
- [ ] A solução mais simples suficiente foi escolhida?
- [ ] Há busca repetida, N+1, carga excessiva ou processamento que deveria ficar no banco?
- [ ] Contratos públicos, compatibilidade e migração foram considerados?
- [ ] Concorrência, idempotência, transações e retries importam neste caso?
- [ ] Logs e erros evitam secrets, payloads e dados pessoais?
- [ ] Testes cobrem comportamento, limites e regressão relevante?
- [ ] Falhas de testes foram investigadas, não ocultadas?
- [ ] Há observabilidade suficiente para diagnosticar a mudança?
- [ ] O rollback é realista e foi descrito?

## Encerramento e aprendizado

- [ ] Critérios de aceite foram comparados com evidência observada?
- [ ] Limitações e riscos residuais estão claros?
- [ ] Plano e telemetria refletem o resultado real?
- [ ] Backups serão retidos ou descartados conforme política corporativa?
- [ ] Existe aprendizado reutilizável ou “nenhum” é a conclusão correta?
- [ ] Qualquer draft da Toolbox foi criado do zero, abstraído e sanitizado?
- [ ] Nenhum plano, backup, diff, log ou telemetria bruta foi levado ao pen drive ou Git pessoal?
