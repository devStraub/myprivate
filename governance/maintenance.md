---
id: maintenance-policy
title: Manutenção periódica
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
related: [knowledge-lifecycle.md, sanitization.md]
visibility: private
---

# Manutenção periódica

Solicite uma varredura completa quando houver crescimento relevante ou em cadência definida pelo proprietário. O agente deve produzir primeiro um **maintenance proposal**; não deve aplicar consolidações, exclusões, renomeações em massa ou promoções sem aprovação humana.

## Preparação

1. Registre escopo, data, agente/modelo e commit de referência.
2. Leia índices antes do conteúdo detalhado.
3. Trate o repositório como potencialmente confidencial e obedeça [`sanitization.md`](sanitization.md).

## Auditoria

Procure:

- duplicações, conceitos sobrepostos e contradições;
- links quebrados, documentos órfãos e índices desatualizados;
- conhecimento obsoleto ou fontes desatualizadas;
- knowledge que deveria virar pattern e cases que revelam recorrência;
- patterns candidatos a princípio, sem promover por frequência apenas;
- documentos grandes a dividir e fragmentos pequenos a consolidar;
- metadados, IDs e nomenclatura inconsistentes;
- itens `provisional` que podem ser validados;
- itens `validated` que precisam de revisão;
- conteúdo confidencial ou risco de reidentificação.
- scouting e backlog duplicados, sobrepostos ou sem dependências claras;
- prioridades desatualizadas, fontes obsoletas e temas que perderam relevância;
- itens aprendidos ainda na fila e lacunas emergentes ainda não mapeadas;
- temas recorrentes em cases ou respostas de IA;
- áreas com muita execução assistida por IA e pouca base conceitual validada.
- capturas `pending` ou `deferred`, independentemente da idade, e IDs de captura divergentes ou duplicados.

## Formato da proposta

Para cada achado, registre: categoria; arquivos; evidência; impacto; mudança proposta; alternativas; risco; necessidade de sanitização; links afetados; ação destrutiva ou reversível; e aprovação exigida.

## Aplicação aprovada

- faça alterações pequenas e separáveis;
- preserve histórico relevante com `deprecated` ou nota de substituição;
- atualize links e índices no mesmo conjunto de mudança;
- valide metadados e links novamente;
- documente o resultado no changelog quando estruturalmente relevante.

Nunca apague silenciosamente uma decisão antiga, evidência contraditória ou evolução com valor histórico.

Backlog e scouting seguem a mesma regra: o agente propõe agrupamentos, repriorização, descarte e transições; o proprietário aprova antes da alteração.

Pendência antiga não é motivo automático para rejeição. A manutenção apenas sinaliza e permite que o proprietário escolha o escopo da próxima consolidação.
