---
id: new-api-checklist
title: Nova API
type: checklist
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
related: [../stacks/rest-api.md, ../areas/apis.md, ../VALIDATION.md]
visibility: private
---

# Checklist de nova API

- [ ] Consumidores, casos de uso e ownership estão claros.
- [ ] Contrato, semântica, invariantes e versionamento estão definidos.
- [ ] Autenticação, autorização e exposição de dados foram revisadas.
- [ ] Validação, erros e códigos de resposta são consistentes.
- [ ] Idempotência, retries, timeouts e duplicação foram considerados.
- [ ] Paginação, filtros, limites e tamanho de payload são adequados.
- [ ] Concorrência, transações e consistência foram avaliadas.
- [ ] Compatibilidade e evolução do contrato têm estratégia.
- [ ] Rate limiting, capacidade e abuso foram considerados.
- [ ] Logs, métricas, traces e correlation IDs não expõem dados sensíveis.
- [ ] Testes de contrato, integração, segurança e failure modes são proporcionais ao risco.
- [ ] Documentação para consumidores e plano de depreciação existem.
