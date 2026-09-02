---
id: ai-first-learning-methodology
title: Metodologia de estudo AI-first
type: methodology
status: draft
created: 2026-08-26
updated: 2026-09-01
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: structure
    date: 2026-08-26
sources: []
related: [study-workflow.md, public-labs.md, ../PRINCIPLES.md, ../VALIDATION.md]
visibility: private
---

# Metodologia de estudo AI-first

## Princípio central

> **Coding is delegated. Understanding is not.**

O objetivo do programa não é maximizar horas digitando código que uma IA consegue produzir com maior velocidade. O objetivo é desenvolver modelos mentais, capacidade de leitura, julgamento técnico, diagnóstico, comparação de alternativas e explicação das decisões.

Uma segunda consequência é:

> **Knowledge learned privately should become knowledge shared publicly.**

Os laboratórios públicos devem servir simultaneamente como ambiente de estudo, evidência prática e material de consulta para outros desenvolvedores.

## Papéis

### Codex — Builder

Para cada módulo, o Codex deve:

1. ler a especificação do módulo;
2. escolher o menor laboratório capaz de demonstrar os requisitos;
3. reutilizar `developer-lab-base` quando isso reduzir ruído, sem forçar o mesmo domínio em assuntos que pedem outro formato;
4. implementar código funcional, testes e cenários de falha relevantes;
5. comentar todo trecho relevante de forma didática, explicando **por quê**, comportamento, riscos e trade-offs;
6. produzir README, `STUDY_GUIDE.md`, documentação técnica e instruções reproduzíveis;
7. privilegiar clareza pedagógica sobre sofisticação enterprise desnecessária.

### Regra de preparação para estudo rápido

O material deve chegar ao proprietário **pronto para observar e executar**. O Builder não deve
transferir para o estudante trabalho mecânico de implementação apenas para tornar uma diferença
visível.

- entregar completos os métodos, cenários, dados de exemplo e testes necessários;
- apresentar alternativas relevantes lado a lado, com nomes que revelem a intenção;
- explicar em português, por comentários, a causa, o efeito, o risco e o trade-off observados;
- oferecer um ponto de entrada que execute todos os cenários e permita selecionar um cenário isolado;
- quando a seleção pelo código for didaticamente útil, deixar chamadas prontas para comentar ou
  descomentar, sem exigir que o estudante escreva a implementação;
- limitar alterações do estudante a entradas, valores, ordem de chamadas, flags ou pequenas condições;
- manter cenários perigosos, lentos ou deliberadamente falhos protegidos por testes, tratamento de
  erro ou execução explícita;
- nunca depender de uma modificação estrutural como pré-requisito para compreender o conceito.

Exercícios de implementação do zero podem existir quando a própria construção manual for o objetivo
pedagógico. Nesse caso, devem ser opcionais e posteriores à compreensão do cenário pronto.

### Codex — Tutor

Depois da implementação, o Codex deve conduzir o estudo do próprio laboratório:

- explicar a arquitetura geral antes dos detalhes;
- definir uma ordem de leitura dos arquivos;
- seguir o fluxo de execução passo a passo;
- explicar por que cada componente existe;
- explicar alternativas relevantes e por que não foram escolhidas;
- propor mudanças hipotéticas e prever seus efeitos;
- apontar onde observar cada conceito em código, teste, log, métrica ou experimento.
- conduzir primeiro uma leitura rápida do cenário pronto, deixando extensões manuais como aprofundamento opcional.

### Proprietário — Engineer/Learner

O papel humano é:

- ler e reconstruir mentalmente o fluxo;
- perguntar “por quê?” até a decisão ficar clara;
- relacionar conceito, código e comportamento;
- executar cenários preparados e, quando útil, variar somente entradas ou seletores simples;
- prever resultados antes de executar quando possível;
- explicar o sistema com as próprias palavras;
- consultar o material e o Tutor sempre que surgir uma dúvida, sem obrigação de encerrar definitivamente o tópico.

## Consulta contínua e revisão sob demanda

O estudo não utiliza prova, questionário obrigatório, nota, percentual de acerto ou ciclo formal de
avaliação. O laboratório e sua documentação permanecem como material de consulta contínua.

- dúvidas podem ser feitas a qualquer momento, inclusive depois de avançar para outro módulo;
- o Tutor responde a partir do conceito, código, teste, saída ou fonte relacionada;
- quando detectar confusão, o Tutor explica novamente por outro ângulo e indica o cenário pronto mais útil;
- perguntas diagnósticas podem surgir naturalmente na conversa, mas não formam uma prova nem condição de avanço;
- o proprietário decide quando avançar, revisar, pausar ou retomar um tópico;
- uma dúvida posterior não invalida estudo anterior e deve ser tratada como parte normal do aprendizado.

## Fluxo contínuo de aprendizado

```text
Projeto gerado
→ Leitura guiada
→ Cenários prontos e explicações
→ Dúvidas e consultas sob demanda
→ Avanço no ritmo escolhido pelo proprietário
→ Retorno livre ao material sempre que necessário
```

### Tratamento de dúvidas

Quando houver uma dúvida ou interpretação incorreta, o Codex deve:

- preservar a parte já compreendida corretamente;
- identificar o ponto exato da confusão sem transformar a conversa em prova;
- explicar com linguagem ou modelo alternativo;
- apontar o arquivo, classe, teste ou cenário relacionado;
- propor uma observação simples que ajude a esclarecer o conceito;
- manter a resposta disponível como material de consulta quando for útil consolidá-la.

## O que pode ser registrado

Não persistir como telemetria de estudo:

- notas;
- percentuais de acerto;
- ranking;
- quantidade de dúvidas ou consultas;
- “nível” calculado automaticamente;
- inferências de domínio baseadas apenas na atividade do repositório.

A Toolbox pode registrar fatos de estado e evidência, por exemplo:

- material preparado;
- estudo em andamento;
- estudo concluído pelo proprietário;
- laboratório público disponível;
- experiência profissional separadamente documentada.

## Comentários no código

Os projetos `lab-*` são **reference implementations didáticas**. Comentários extensivos são permitidos e desejáveis quando explicam intenção ou raciocínio.

Evitar comentário que apenas repete a instrução:

```java
// Salva o pedido.
orderRepository.save(order);
```

Preferir comentário que ensina:

```java
// O pedido é persistido dentro da mesma transação usada para registrar
// o evento no Outbox. Isso evita o dual-write problem: não queremos
// confirmar a mudança de domínio e depois descobrir que a intenção de
// publicação do evento foi perdida.
orderRepository.save(order);
```

A meta é que outro desenvolvedor consiga estudar o repositório sem depender de uma aula externa.

## Limite da delegação

O Codex pode implementar, pesquisar, documentar, comparar e explicar. Ele não pode transformar sua própria geração em evidência automática de compreensão humana. O proprietário decide quando avançar ou registrar uma conclusão, mantendo o direito de consultar e revisar o material indefinidamente.
