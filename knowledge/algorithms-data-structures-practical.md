---
id: algorithms-data-structures-practical
title: Algoritmos e estruturas de dados como decisões práticas
type: knowledge
status: provisional
confidence: medium
created: 2026-09-03
updated: 2026-09-03
last_reviewed: 2026-09-03
domains: [computer-science, software-engineering, performance]
technologies: [java, sql]
tags: [algorithms, data-structures, complexity, collections]
origin: [study, personal-practice, ai-assisted-analysis]
learning_state: understood
eligible_as_professional_evidence: false
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: consolidation
    date: 2026-09-03
    independently_validated: false
sources: []
related:
  - ../study/modules/02-algorithms-data-structures.md
visibility: private
---

# Algoritmos e estruturas de dados como decisões práticas

## Ideia central

Estruturas e algoritmos devem ser escolhidos pela forma do problema e por seus trade-offs, não por
sofisticação. Em aplicações orientadas a dados, filtragem, ordenação, agregação e paginação devem ocorrer
o mais próximo possível da origem capaz de executá-las eficientemente, normalmente o banco de dados.

## Reconhecimento rápido

| Necessidade | Estrutura ou estratégia provável |
| --- | --- |
| sequência simples e acesso por índice | `ArrayList` |
| busca frequente por chave | `HashMap` |
| unicidade | `HashSet` |
| ordem de chegada | fila |
| último a entrar, primeiro a sair | pilha |
| próximo item por prioridade | heap / `PriorityQueue` |
| hierarquia ou busca ordenada | árvore |
| relações e dependências | grafo |
| dependências em ordem válida | ordenação topológica |
| menor quantidade de passos | BFS |
| exploração completa de um ramo | DFS ou recursão |
| menor custo entre caminhos | algoritmo de menor caminho |
| conectividade incremental | union-find |
| escolha local sem retorno | greedy |
| tentar, desfazer e tentar novamente | backtracking |
| subproblemas repetidos | programação dinâmica / memoization |

## Collections e consultas

`ArrayList` e `HashMap` atendem à maioria dos casos cotidianos. Um mapa é especialmente útil quando uma
coleção em memória será consultada repetidamente pela mesma chave, evitando buscas encadeadas de custo
quadrático. Ainda assim, a primeira pergunta deve ser se todos esses dados precisam estar em memória.

```text
banco filtra, ordena e pagina
→ aplicação recebe somente o necessário
→ estruturas em memória resolvem necessidades locais
```

Grandes volumes em memória são justificáveis em situações específicas, como fluxo contínuo, combinação
de várias fontes, processamento de arquivos ou dados gerados fora de ordem. Manter dados ordenados desde
a origem também possui custo quando novas inserções não chegam na ordem desejada.

## Complexidade como detector de risco

- `O(1)`: acesso aproximado constante, como busca por chave em hash table;
- `O(log n)`: eliminação progressiva do espaço, como busca binária e árvores balanceadas;
- `O(n)`: uma passagem pelos dados;
- `O(n log n)`: ordenação genérica eficiente;
- `O(n²)`: busca ou comparação completa repetida dentro de outra passagem;
- exponencial ou fatorial: exploração combinatória que cresce rapidamente.

Big O não determina sozinho a melhor solução. Volume real, legibilidade, memória, custo da preparação,
frequência da operação e capacidade da fonte de dados também importam.

Análise amortizada distribui operações ocasionalmente caras ao longo de uma sequência. O crescimento
interno de uma `ArrayList`, por exemplo, pode copiar elementos em alguns momentos, embora a inserção no
final permaneça amortizadamente próxima de `O(1)`.

## Diretriz prática

Prefira consultas bem modeladas e estruturas comuns. Use uma estrutura especializada quando a necessidade
correspondente estiver clara. Reconhecer heap, árvore, grafo ou programação dinâmica é mais importante no
cotidiano do que reimplementá-los sem necessidade.

