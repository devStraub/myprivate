---
id: public-study-labs
title: Laboratórios públicos de estudo
type: standard
status: draft
created: 2026-08-26
updated: 2026-08-31
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: structure
    date: 2026-08-26
sources: []
related: [learning-methodology.md, modules/README.md]
visibility: private
---

# Laboratórios públicos de estudo

## Objetivo

Cada laboratório deve cumprir três funções ao mesmo tempo:

1. material de estudo executável;
2. evidência pública de aplicação do tema;
3. fonte de consulta didática para outros desenvolvedores.

O laboratório não precisa ser grande. Deve ser o **menor sistema que torne o conceito observável e discutível**.

## Famílias de repositório

### `lab-*`

Isola um conceito ou pequeno conjunto de conceitos.

Exemplos:

- `lab-java-concurrency`;
- `lab-postgresql-transactions`;
- `lab-kafka-events`;
- `lab-application-security`.

### `research-*`

Compara alternativas por hipótese e evidência.

Exemplos:

- `research-rest-vs-grpc`;
- `research-cache-strategies`;
- `research-kafka-vs-rabbitmq`.

### `project-*`

Integra várias competências quando o problema realmente justificar.

Exemplo:

- `project-payment-platform`.

Não criar um mega projeto apenas para acumular tecnologias.

## Estrutura recomendada

```text
lab-example/
├── README.md
├── STUDY_GUIDE.md
├── docs/
│   ├── concepts.md
│   ├── architecture.md
│   ├── trade-offs.md
│   └── experiments.md
├── src/
├── tests/
└── arquivos de execução/reprodutibilidade
```

A estrutura pode variar conforme a tecnologia.

## README

Deve responder:

- qual problema/conceito é estudado;
- quais requisitos do módulo são demonstrados;
- como executar;
- quais cenários observar;
- quais limitações são intencionais;
- quais pré-requisitos ajudam na leitura;
- links para documentação oficial e fontes importantes.

## STUDY_GUIDE.md

Deve definir uma ordem de leitura real, por exemplo:

```text
1. Leia o endpoint de entrada.
2. Siga para a aplicação/serviço.
3. Observe o limite transacional.
4. Veja onde o evento é persistido.
5. Execute o teste de falha.
6. Compare o resultado com a implementação ingênua.
```

Para cada etapa incluir:

- **o que observar**;
- **por que existe**;
- **qual conceito demonstra**;
- **o que quebraria ou mudaria se fosse diferente**;
- **qual experimento executar** quando aplicável.

## Código comentado

O código pode e deve ser mais comentado que código de produção normal. Comentários devem explicar intenção, invariantes, failure modes, decisões, limites de abstração e trade-offs.

O comentário faz parte do produto público do laboratório.

## Testes

Testes devem ensinar comportamento, não apenas aumentar cobertura. Quando aplicável, incluir:

- caminho feliz;
- edge cases;
- falha induzida;
- concorrência;
- comportamento antes/depois;
- teste que evidencia o motivo do pattern estudado.

## Experimentos

Sempre que o tema permitir, o laboratório deve fornecer cenários completos que tornem a consequência
observável imediatamente. O caminho principal não deve instruir o estudante a implementar, remover ou
reescrever trechos relevantes para só então perceber a diferença.

Preferir:

- métodos nomeados para cada comportamento ou alternativa;
- testes lado a lado para caminho normal, limite e falha;
- um runner que execute todos os cenários ou aceite um seletor simples;
- chamadas prontas que possam ser comentadas/descomentadas para reduzir o foco;
- parâmetros pequenos que possam ser alterados sem mudar a estrutura;
- comentários em português explicando o resultado esperado e o motivo.

Exemplos de cenários preparados:

- consulta com índice e consulta sem índice já mensuráveis;
- execução sequencial e duas requisições concorrentes já disponíveis;
- broker disponível e indisponível simulados por cenário;
- dependência normal, lenta e degradada selecionáveis;
- implementação transacional e alternativa insegura isoladas;
- algoritmos ou estruturas comparáveis pela mesma entrada;
- políticas de consistência e retry configuráveis por argumento.

O aprofundamento pode propor modificações manuais depois que o modelo mental estiver estabelecido,
mas elas não são requisito para a primeira compreensão.

## Requisito para status `applied`

Um módulo só pode ser descrito como aplicado quando houver um projeto público disponível e o proprietário confirmar que ele atende aos requisitos técnicos da especificação do módulo.

A existência do repositório **não implica autoria manual de cada linha**, domínio profissional nem experiência em produção. O portfólio deve deixar claro que os laboratórios são desenvolvidos com assistência de IA e estudados pelo proprietário.

## Relação com o Engineering AI

O futuro chat pode usar o laboratório como evidência pública e fonte de explicação:

- localizar projeto relacionado;
- apontar arquivo/classe/teste;
- mostrar trecho relevante;
- relacionar o trecho ao conceito;
- diferenciar `prepared`, `studied`, `applied` e `professional`.

Essa transparência é preferível a inferir competência apenas por palavras-chave em currículo.
