# Relatório de traduções RSG — Fipas Roleplay

Auditoria realizada em 14/08/2026 sobre os 36 recursos `rsg-*` vinculados à base. Nenhum submódulo upstream foi alterado.

## Configuração aplicada

- `rsg_locale = pt-br`: recursos RSG que usam o sistema `Locale`/`Lang`.
- `ox:locale = pt-br`: recursos que usam os catálogos JSON do `ox_lib`.
- `qb_locale = pt-br`: compatibilidade necessária porque o `locale/pt-br.lua` atual do `rsg-core` consulta esse convar legado.

Com essa configuração, 26 recursos carregam diretamente seus arquivos portugueses. Quando uma chave não existe no catálogo português, o mecanismo do recurso pode recorrer ao inglês.

## Tradução portuguesa diretamente aplicável

| Recurso | Arquivo | Cobertura comparada com inglês | Situação |
|---|---|---:|---|
| rsg-adminmenu | `pt-br.json` | 242/392 | Aplicado; faltam 150 chaves |
| rsg-ammo | `pt-br.json` | 6/6 | Aplicado e completo |
| rsg-appearance | `pt-br.json` | 194 chaves; faltam 6 presentes no inglês | Aplicado; catálogo possui chaves extras/estrutura divergente |
| rsg-banking | `pt-br.json` | 48/48 | Aplicado e completo |
| rsg-barbers | `pt-br.json` | 36/36 | Aplicado e completo |
| rsg-bathing | `pt-br.json` / `pt-br.lua` | 6/6 no catálogo JSON | Aplicado |
| rsg-bossmenu | `pt-br.json` | 54/54 | Aplicado e completo |
| rsg-canteen | `pt-br.json` | 2/2 | Aplicado e completo |
| rsg-core | `pt-br.lua` | Catálogo disponível; 4 chaves ausentes detectadas no boot | Aplicado via `qb_locale` legado, com fallback parcial |
| rsg-doorlock | `pt-br.json` | 5/5 | Aplicado e completo |
| rsg-essentials | `pt-br.json` | 32/32 | Aplicado e completo |
| rsg-fishing | `pt-br.json` | 18/18 | Aplicado e completo |
| rsg-gangmenu | `pt-br.json` | 54/60 | Aplicado; faltam 6 chaves |
| rsg-horses | `pt-br.json` | 126/131 | Aplicado; faltam 5 chaves |
| rsg-hud | `pt-br.json` | 20/20 | Aplicado e completo |
| rsg-inventory | `pt-br.json` | 81/89 | Aplicado; faltam 8 chaves da interface de troca |
| rsg-lawman | `pt-br.json` | 60/62 | Aplicado; faltam 2 chaves de prisão |
| rsg-medic | `pt-br.json` | 45/45 | Aplicado e completo |
| rsg-multicharacter | `pt-br.lua` | Catálogo Lua disponível | Aplicado via `rsg_locale` |
| rsg-multijob | `pt-br.json` | 26/26 | Aplicado e completo |
| rsg-prison | `pt-br.json` | 20/20 | Aplicado e completo |
| rsg-shops | `pt-br.json` | 26/26 | Aplicado e completo |
| rsg-telegram | `pt-br.json` | 133/137 | Aplicado; faltam 4 chaves e várias frases permanecem iguais ao inglês |
| rsg-wardrobe | `pt-br.json` | 37/37 | Aplicado e completo |
| rsg-weaponcomp | `pt-br.json` | 864/864 | Aplicado e completo |
| rsg-weapons | `pt-br.json` | 23/23 | Aplicado e completo |

## Possui português, mas não permite seleção direta

| Recurso | Diagnóstico |
|---|---|
| rsg-mdt | Possui `locales/pt.json` completo (147/147), porém `shared/locale.lua` fixa `currentLocale = 'en'` e não lê convar/configuração. Ativar português exigiria modificar o submódulo upstream. Foi mantido intacto para preservar atualizações. |

## Sem tradução portuguesa direta

| Recurso | Diagnóstico |
|---|---|
| rsg-animations | Sistema `Lang:t`, mas somente `el`, `en` e `pl` |
| rsg-consume | Não possui diretório ou mecanismo de locale |
| rsg-loading | Não possui catálogo de locale; textos pertencem à interface própria |
| rsg-lockpick | Não possui catálogo de locale |
| rsg-menubase | Não possui catálogo de locale |
| rsg-npcs | Não possui catálogo de locale |
| rsg-playerinfo | Usa `ox_lib`, mas oferece apenas `de`, `el`, `en`, `es`, `fr`, `it`, `pl` e `ro` |
| rsg-radialmenu | Não possui catálogo de locale |
| rsg-spawn | Usa `ox_lib`, mas oferece apenas `de`, `el`, `en`, `fr` e `pl` |

## Catálogos portugueses incompletos

- `rsg-core`: faltam `command.noclip.help`, `command.dvall.help`, `command.dvp.help` e `command.dvo.help`.
- `rsg-adminmenu`: 150 chaves ausentes.
- `rsg-appearance`: 6 chaves inglesas ausentes no arquivo português.
- `rsg-gangmenu`: 6 chaves ausentes.
- `rsg-horses`: 5 chaves ausentes.
- `rsg-inventory`: 8 chaves ausentes.
- `rsg-lawman`: 2 chaves ausentes.
- `rsg-telegram`: 4 chaves ausentes e 64 valores textuais idênticos ao inglês (alguns são nomes próprios/termos técnicos).

Essas lacunas não impedem o boot. Para traduzi-las de forma permanente sem perder a atualização por submódulos, o caminho recomendado é manter patches versionados ou contribuir as traduções aos repositórios upstream.
