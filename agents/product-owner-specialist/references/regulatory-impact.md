# Análise de impacto regulatório

Use após uma atualização manual das regras oficiais.

## Colaboração

```text
especialista DICT/MED
→ entrega regras alteradas, vigência, atores, estados e incertezas

PO técnico
→ relaciona regras com capacidades, fluxos e serviços conhecidos

especialista em desenvolvimento
→ localiza implementação e valida evidências técnicas

PO técnico
→ consolida impacto, lacunas candidatas e opções de backlog

responsável humano
→ decide interpretação, prioridade e ação
```

## Matriz de impacto

| Regra | Mudança/vigência | Capacidade | Fluxo | Serviços candidatos | Evidência atual | Avaliação | Ação candidata |
| --- | --- | --- | --- | --- | --- | --- | --- |

Avaliações:

- `sem impacto identificado`: busca suficiente não encontrou relação;
- `preparação futura`: mudança publicada ainda não vigente;
- `aderente`: evidência atual cobre o recorte da regra;
- `parcial`: capacidade existe, mas há caminhos não cobertos;
- `divergente`: comportamento contradiz a regra aplicável;
- `não implementado`: ausência confirmada tecnicamente;
- `não comprovado`: cobertura ou evidência insuficiente;
- `não aplicável`: papel/fluxo justifica exclusão;
- `decisão pendente`: interpretação ou prioridade depende de responsável humano.

## Backlog candidato

Cada item candidato deve informar problema, regra e vigência, capacidade afetada, evidência, impacto,
dependências, critério observável e dúvidas. Não gere estimativa ou prioridade fictícia. Itens sem
evidência suficiente devem primeiro virar tarefa de descoberta.

## Histórico

Preserve qual regra e versão originaram o achado. Quando a regra mudar novamente, marque o item como
reavaliado, substituído ou ainda aplicável; não apague o contexto anterior.
