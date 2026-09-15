---
id: proposal-suite-cucumber-glue-compartilhado
title: Suítes Cucumber agregadas exigem glue globalmente não ambíguo
type: work-learning-proposal
status: draft
confidence: high
created: 2026-09-15
updated: 2026-09-15
last_reviewed:
domains: [testing, software-engineering, debugging]
technologies: [cucumber, junit-platform, maven]
tags: [test-suite, glue, duplicate-steps, test-discovery, aggregation]
origin: [professional-experience, ai-assisted-analysis]
learning_state: applied-professionally
eligible_as_professional_evidence: false
capture_id: 20260915-134001-cucumber-glue-p3
captured_at: 2026-09-15T13:40:01Z
review_state: pending
reviewed_at:
consolidated_into: []
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: analysis-and-drafting
    date: 2026-09-15
    independently_validated: false
sources: []
related: [20260824-validacao-progressiva.md]
visibility: private
sanitization:
  level: generalized
  reviewed_on:
  reviewed_by:
  reidentification_risk: low
  approved: false
---

# Proposta de aprendizado: Suítes Cucumber agregadas exigem glue globalmente não ambíguo

## Aprendizado generalizado

No Cucumber sobre JUnit Platform, suítes isoladas podem funcionar com glues segmentados mesmo
quando pacotes diferentes contêm expressões de steps iguais. Ao criar uma suíte agregada, ampliar o
glue ou compor outras suítes pode colocar todas essas definições no mesmo registro e transformar uma
duplicidade antes invisível em falha de inicialização.

Uma suíte geral deve selecionar diretamente a raiz das features e usar um glue comum cuja coleção de
expressões seja globalmente não ambígua. Agregar classes de suíte não substitui o desenho de um
vocabulário compartilhado de steps.

## Natureza

- [x] conhecimento novo
- [x] reforço de conhecimento existente
- [ ] exceção ou contradição
- [x] novo pattern
- [x] revisão de decisão
- [x] melhoria de checklist ou playbook
- [x] erro instrutivo de IA

## Evidência permitida

Classes Cucumber independentes executavam corretamente com recursos e glues restritos. Uma primeira
suíte agregadora baseada na composição dessas classes falhou antes de executar os cenários porque
duas definições visíveis possuíam a mesma expressão. Um projeto de referência funcional mostrou o
padrão alternativo: seleção direta da raiz de features, glue compartilhado e tags apenas nas suítes
especializadas.

### Separação epistemológica

- Observado diretamente: a composição carregou definições duplicadas e impediu a inicialização; o
  projeto de referência utilizava seleção direta de recursos com glue comum.
- Inferido ou proposto pela IA: consolidar steps semanticamente comuns em uma implementação
  compartilhada é preferível a manter duplicidades separadas por pacote.
- Não verificado: a estratégia final de refatoração e seu impacto sobre estado de cenário, hooks e
  execução paralela.

## Conteúdo existente relacionado

A proposta de validação progressiva cobre execução incremental. Esta captura trata especificamente
da descoberta de testes Cucumber e da diferença entre isolamento local de glue e unicidade exigida
por uma suíte global.

## Alteração proposta

Após aprovação, incorporar ao checklist de suítes Cucumber:

- inventariar expressões de steps antes de ampliar o glue;
- detectar expressões idênticas em classes diferentes;
- extrair steps comuns quando a semântica e o estado forem realmente compartilháveis;
- selecionar diretamente a raiz de features na suíte geral;
- reservar tags para subconjuntos especializados;
- validar descoberta, hooks, isolamento de cenário e paralelismo;
- evitar executar simultaneamente a suíte geral e as suítes individuais quando isso duplicar
  cenários;
- verificar se propriedades externas de descoberta sobrescrevem os seletores da suíte.

## Participação e erros de IA

A IA propôs inicialmente uma agregação de classes que era válida em JUnit, mas incompatível com as
definições duplicadas carregadas pelo Cucumber. A falha da execução revelou o problema, e a análise
de uma implementação de referência permitiu formular o padrão corrigido.

## Revisão de sanitização

- Categorias removidas: organização, projetos, classes, nomes de steps, features, tickets, caminhos,
  logs e quantidades.
- Números, cronologia e combinações singulares removidos: sim.
- Singularidade residual: baixa; o comportamento é aplicável a projetos Cucumber/JUnit Platform.
- Nível proposto: generalized.
- Fontes permitidas: nenhuma.

## Aprovação humana

- Decisão: pending
- Responsável:
- Data:
- Observações:

## Consolidação

- Estado de revisão: pending
- Destinos aprovados: nenhum
- Captura substituída/corrigida: nenhum
