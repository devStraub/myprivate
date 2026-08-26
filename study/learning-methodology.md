---
id: ai-first-learning-methodology
title: Metodologia de estudo AI-first
type: methodology
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

### Codex — Tutor

Depois da implementação, o Codex deve conduzir o estudo do próprio laboratório:

- explicar a arquitetura geral antes dos detalhes;
- definir uma ordem de leitura dos arquivos;
- seguir o fluxo de execução passo a passo;
- explicar por que cada componente existe;
- explicar alternativas relevantes e por que não foram escolhidas;
- propor mudanças hipotéticas e prever seus efeitos;
- apontar onde observar cada conceito em código, teste, log, métrica ou experimento.

### Proprietário — Engineer/Learner

O papel humano é:

- ler e reconstruir mentalmente o fluxo;
- perguntar “por quê?” até a decisão ficar clara;
- relacionar conceito, código e comportamento;
- executar experimentos sugeridos;
- prever resultados antes de executar quando possível;
- explicar o sistema com as próprias palavras;
- decidir quando está preparado para a avaliação.

### Codex — Examiner

Ao final da leitura guiada, o Codex gera aproximadamente 10 questões inéditas, preferencialmente distribuídas em:

- ~3 de fundamentos;
- ~4 de aplicação/raciocínio;
- ~3 de cenários, failure modes e trade-offs.

As perguntas devem testar modelo mental, não memorização literal. Trechos do próprio projeto podem ser usados como contexto.

## Loop de validação do entendimento

```text
Projeto gerado
→ Leitura guiada
→ Explicação e experimentos
→ ~10 questões
→ 100% conceitualmente corretas?
   ├─ sim → encerrar ciclo do módulo
   └─ não → diagnosticar lacunas
            → apontar exatamente o que reler/rodar
            → estudo direcionado
            → gerar novas questões inéditas apenas sobre as lacunas
            → repetir até não restar lacuna detectada
```

### Diagnóstico de erro

Uma resposta incorreta não deve produzir apenas “errado”. O Codex deve registrar temporariamente:

- conceito não compreendido;
- parte compreendida corretamente;
- erro de raciocínio;
- material exato a revisar;
- arquivo/classe/teste/experimento do laboratório relacionado;
- nova hipótese ou experimento que ajude a consolidar o entendimento.

### Não repetição

Dentro da sessão de avaliação, o Codex deve manter memória temporária das perguntas já utilizadas. Novas rodadas devem criar perguntas semanticamente diferentes; mudar apenas nomes ou números não conta como pergunta nova.

### O que significa 100%

100% significa **correção conceitual das questões realizadas**, não reprodução textual de uma resposta esperada. Terminologia imprecisa pode ser corrigida sem invalidar uma resposta cujo modelo mental esteja correto.

## Avaliações não pertencem à telemetria permanente

Não persistir na Toolbox:

- notas;
- percentuais de acerto;
- ranking;
- histórico detalhado das perguntas;
- quantidade de tentativas;
- “nível” calculado a partir da prova.

As avaliações são uma ferramenta privada de autorregulação. Quando o ciclo termina, o estado temporário pode ser descartado.

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

O Codex pode implementar, pesquisar, documentar, comparar e explicar. Ele não pode transformar sua própria geração em evidência automática de compreensão humana. A conclusão do estudo continua sendo uma decisão do proprietário depois do ciclo de leitura, questionamento e avaliação.
