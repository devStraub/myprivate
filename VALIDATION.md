---
id: adversarial-validation
title: Validação adversarial
type: playbook
status: draft
created: 2026-08-23
updated: 2026-08-26
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: unknown
    role: structure
    date: 2026-08-23
sources: []
related: [PRINCIPLES.md, playbooks/debugging.md]
visibility: private
---

# Validação adversarial

Use este documento antes de considerar confiável uma explicação, decisão, correção ou conclusão assistida por IA. Registre `não aplicável` com justificativa; não marque itens mecanicamente.

## Compreensão

- O problema, o escopo e o objetivo estão claros?
- Comportamentos esperado e observado são distinguíveis e reproduzíveis?
- Fatos, hipóteses, opiniões e assumptions estão rotulados?
- Restrições e critérios de sucesso foram confirmados?

## Causa e evidência

- Há evidência da causa raiz ou apenas correlação?
- A solução trata a causa ou mascara o sintoma?
- Cada assumption importante foi verificada?
- Hipóteses alternativas foram tentadas e falsificadas?
- A proveniência e a atualidade das fontes são adequadas?

## Impacto técnico

- Edge cases e entradas inválidas foram considerados?
- Há efeitos em concorrência, transações ou consistência?
- Segurança, privacidade e controle de acesso foram considerados?
- Performance, capacidade e custo foram considerados?
- Observabilidade e diagnóstico futuro são suficientes?
- Compatibilidade, migração e contratos públicos foram avaliados?
- Failure modes, dependências e falhas parciais foram analisados?
- A mudança preserva o que não deveria mudar?

## Testes e operação

- Os testes demonstram o comportamento relevante, inclusive o caso que falhava?
- Testes verdes podem esconder um erro conceitual ou mock irrealista?
- Existe evidência em nível apropriado: unidade, integração, contrato ou sistema?
- Rollout, rollback, reversibilidade e recuperação foram considerados?
- A solução será observável depois da implantação?

## Contestação da solução

- Existe alternativa mais simples?
- Quais são os argumentos mais fortes contra esta solução?
- Em que condições ela falha ou deixa de ser a melhor escolha?
- Uma investigação independente chegaria à mesma conclusão?
- Documentação oficial, especificação ou experimento é necessário?
- O que permanece incerto e qual é o risco de prosseguir?

## Estado do conhecimento

- O conteúdo foi apenas descoberto por IA ou realmente estudado pelo proprietário?
- Estudo, compreensão, aplicação pessoal e aplicação profissional estão sustentados por evidências distintas?
- Material de scouting foi usado somente como referência provisória e com limitações explícitas?
- `eligible_as_professional_evidence` está `true` apenas quando existe experiência profissional real, permitida e sanitizada?
- Perfil, curriculum e backlog representam o estado atual sem inflar competência?
- Um módulo apenas preparado foi mantido distinto de conteúdo estudado e validado?
- O estudo permanece consultável sem exigir prova, nota, ranking ou condição formal de aprovação?
- Laboratório público comprova somente o escopo de aplicação realmente demonstrado e confirmado?

## Captura portátil

- O arquivo possui `capture_id` único e `review_state` coerente?
- A captura foi criada sem alterar conteúdo consolidado no dispositivo externo?
- Conteúdo profissional foi sanitizado antes da primeira gravação?
- A importação evita sobrescrita e detecta IDs iguais com conteúdo divergente?
- A consolidação foi solicitada pelo proprietário, sem assumir periodicidade?

## Evidência de saída

Antes da aprovação, registre: conclusão; evidências; hipóteses rejeitadas; riscos residuais; incertezas; testes executados; resultado observado; plano de rollback quando aplicável; e responsável humano pela decisão.
