---
id: template-public-study-lab
title: Template — Public Study Lab
type: template
status: draft
created: 2026-08-26
updated: 2026-08-26
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: structure
    date: 2026-08-26
sources: []
related: [../study/public-labs.md, ../study/learning-methodology.md]
visibility: private
---

# Especificação do laboratório

## Módulo relacionado

`NN — Nome`

## Pergunta de estudo

Qual pergunta o laboratório torna observável?

## Conceitos obrigatórios

- conceito;
- conceito.

## Menor sistema suficiente

Descreva componentes mínimos. Não adicionar tecnologia sem função pedagógica.

## Cenários obrigatórios

- caminho feliz;
- edge case;
- falha induzida;
- comparação antes/depois quando relevante.

## Código e comentários

Comentar decisões, invariantes, riscos e trade-offs. Não comentar apenas sintaxe óbvia.

## Testes

Liste comportamentos que os testes precisam evidenciar.

## STUDY_GUIDE.md

Defina a ordem de leitura e, para cada etapa:

- o que observar;
- por que existe;
- o que aconteceria se fosse diferente;
- qual experimento executar.

## Avaliação privada

Depois do estudo, gerar aproximadamente 10 perguntas inéditas. Se houver erro, diagnosticar a lacuna, apontar material exato e gerar novas perguntas diferentes até fechar a lacuna. Não persistir score na Toolbox.

## Definição de pronto

- executável;
- reproduzível;
- requisitos do módulo cobertos;
- README e Study Guide completos;
- material público útil para outro desenvolvedor;
- proprietário confirmou conclusão do ciclo de estudo.
