# Pacote de contexto para agentes do Copilot

Prepare o menor contexto capaz de orientar corretamente a próxima função. O pacote pertence à demanda e
fica no ambiente autorizado.

## Estrutura

```markdown
# Contexto da demanda

## Papel solicitado
planner | executor | validator | reviewer

## Objetivo e resultado esperado
...

## Escopo / fora do escopo
...

## Fatos confirmados do projeto
- fato — evidência local

## Regras e restrições aplicáveis
- regra ou ID — fonte/versão/vigência

## Critérios de aceite observáveis
- critério — validação esperada

## Plano ou passo atual
...

## Riscos e pontos de parada
...

## Dúvidas e decisões humanas pendentes
...
```

## Regras de qualidade

- inclua somente arquivos, módulos e contratos necessários ao passo atual;
- sintetize documentação extensa e forneça o caminho da fonte canônica;
- identifique inferências em vez de apresentá-las como fatos;
- não esconda conflito entre briefing, código e regra externa;
- indique comandos de validação somente quando conhecidos e seguros;
- não reutilize pacote antigo sem conferir diff, branch, versão e objetivo;
- não inclua credenciais, payload real, dado pessoal ou informação desnecessária.

## Passagem entre modelos

Um planner entrega critérios, riscos e passos; não código especulativo como decisão final. Um executor
recebe um passo delimitado e devolve diff mais evidência. Um validator executa verificações e relata fatos.
Um reviewer compara tudo com o briefing e as regras, sem presumir aprovação humana.

Se um agente mais rápido encontrar ambiguidade material, deve parar no ponto de decisão e devolver ao
planner/reviewer mais adequado, seguindo [`../../../work/agent-routing.md`](../../../work/agent-routing.md).
