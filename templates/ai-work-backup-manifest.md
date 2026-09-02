# Manifesto de backup da alteração assistida por IA

> Artefato operacional corporativo. Não copiar para Toolbox pessoal, pen drive ou Git pessoal.

## Metadados

- Sessão: `<identificador local não sensível>`
- Criado em: `<timestamp ISO 8601>`
- Raiz autorizada: `<referência local>`
- Branch/commit inicial: `<quando disponível>`
- Motivo: `<passo do plan.md>`

## Verificações

- [ ] O destino é timestampado e não existia anteriormente.
- [ ] Todos os alvos resolvidos permanecem dentro da raiz autorizada.
- [ ] A estrutura relativa foi preservada.
- [ ] `.git`, `.env`, secrets, dumps, datasets, builds e dependências foram excluídos.
- [ ] Cada arquivo copiado pode ser lido.
- [ ] Tamanho e SHA-256 foram conferidos após a cópia.

## Arquivos preservados

| Caminho relativo | Bytes | SHA-256 | Verificação |
| --- | ---: | --- | --- |
| `<caminho relativo>` | `<bytes>` | `<hash>` | `<succeeded/failed>` |

## Exclusões e observações

- Excluído: `<categoria e motivo; não repetir secret ou conteúdo>`
- Retenção: `<política ou decisão aplicável>`
- Restauração exige confirmação humana: `sim`
