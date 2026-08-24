---
id: incident-analysis-playbook
title: Análise de incidente
type: playbook
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
related: [../VALIDATION.md, ../governance/sanitization.md]
visibility: private
---

# Análise de incidente

1. **Timeline:** eventos confirmados, fontes e lacunas; não confunda horário de detecção com início.
2. **Impacto:** usuários, funções, duração e severidade com critérios autorizados.
3. **Evidência:** preserve dados no ambiente permitido e marque inferências.
4. **Trigger:** evento que expôs a condição, sem chamá-lo automaticamente de causa raiz.
5. **Causa raiz:** mecanismo técnico e organizacional sustentado por evidência.
6. **Fatores contribuintes:** condições que ampliaram probabilidade, alcance ou duração.
7. **Mitigação:** o que reduziu impacto e quais riscos introduziu.
8. **Correção permanente:** mudança que trata causas e fatores prioritários.
9. **Prevenção:** controles proporcionais, responsáveis e verificação.
10. **Gaps de observabilidade:** por que detecção, diagnóstico ou confirmação demoraram.
11. **Lições:** úteis, acionáveis e não culpabilizantes.

Mantenha dados do incidente no sistema autorizado. Para a Toolbox, extraia apenas experiência generalizada por [`../governance/sanitization.md`](../governance/sanitization.md) e aprovação humana.
