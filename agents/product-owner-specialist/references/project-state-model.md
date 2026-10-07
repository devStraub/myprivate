# Modelo da base corporativa do projeto

A base persistente deve existir somente no ambiente corporativo autorizado. O caminho e o mecanismo de
versionamento dependem da política local.

## Estrutura sugerida

```text
<base-corporativa-autorizada>/
├── index.md
├── services/
├── capabilities/
├── flows/
├── rules/
├── gaps/
│   └── register.md
└── history/
    └── change-log.md
```

Use os templates da Toolbox apenas como estrutura. As instâncias preenchidas não retornam à Toolbox.

## Relações principais

```text
regra → capacidade → fluxo → etapa → serviço → componente/evidência
                             ↘ estado, evento, dado e efeito
```

Essa relação permite responder tanto “o que este serviço faz?” quanto “quais serviços são afetados por
esta mudança de regra?”.

## Estado de uma afirmação

Cada informação material deve possuir:

- `source`: onde foi observada;
- `verified_at`: quando foi conferida;
- `confidence`: baixa, média ou alta;
- `state`: confirmado, inferido, não comprovado, desconhecido, desatualizado ou disputado;
- `scope`: versão, branch, ambiente ou fluxo ao qual se aplica;
- `owner_decision`: quando houver decisão humana relevante.

## Fonte atual

A base é um índice de evidências, não uma nova verdade independente. Quando documentação e código
divergirem, preserve ambos e registre qual comportamento foi executado/observado. Atualize a base após
mudança aceita; não antes da validação.
