# Descoberta progressiva de serviços

Mapear todos os serviços é um processo incremental. Comece pelo inventário e aprofunde por fluxo ou
capacidade; não tente colocar todo o código em um único contexto.

## Ordem de descoberta

1. localizar repositórios e serviços autorizados;
2. identificar propósito declarado e pontos de entrada;
3. reconhecer capacidades de negócio oferecidas;
4. mapear contratos, persistência, mensagens e dependências;
5. seguir fluxos de ponta a ponta entre serviços;
6. relacionar regras externas e internas;
7. confirmar testes, observabilidade e comportamento operacional;
8. registrar desconhecidos e responsáveis por esclarecimento.

## Registro de serviço

Cada serviço deve apontar, quando aplicável:

- propósito e capacidades;
- atores e consumidores;
- entradas, saídas, eventos e jobs;
- dados próprios e fronteira transacional;
- dependências e serviços dependentes;
- estados relevantes e falhas esperadas;
- regras atendidas e exceções conhecidas;
- testes e evidência operacional;
- riscos, dívidas e lacunas já reconhecidas;
- fonte e data da última verificação.

## Cobertura

| Estado | Significado |
| --- | --- |
| `discovered` | existência localizada, propósito ainda não confirmado |
| `mapped` | responsabilidades e interfaces principais documentadas |
| `flow-linked` | participação em fluxos de ponta a ponta identificada |
| `evidence-checked` | afirmações principais confrontadas com código/testes/operação |
| `stale` | mudança posterior ou idade da evidência exige revisão |
| `disputed` | fontes relevantes divergem |

Cobertura não é qualidade nem conformidade. Um serviço pode estar bem mapeado e ainda possuir lacunas.

## Descoberta assistida

Use busca por símbolos, rotas, consumidores, produtores, schemas, tabelas e testes para formar hipóteses.
Confirme hipóteses percorrendo o caminho de execução. Para análise técnica aprofundada, passe o recorte ao
especialista em desenvolvimento.
