# Relatorio de traducoes RSG - Fipas Roleplay

Auditoria e implementacao concluidas em 14/08/2026 sobre os 36 recursos `rsg-*` da base.

## Resultado

- Todos os 36 recursos possuem agora um arquivo de locale `pt-br` versionado em `overrides/framework`.
- Todos os catalogos JSON portugueses contem todas as chaves existentes nos respectivos catalogos ingleses.
- As chaves ausentes e os valores ainda iguais ao ingles foram traduzidos, preservando placeholders, comandos, URLs e nomes proprios.
- Foram adicionadas as quatro chaves de comandos ausentes no `rsg-core`.
- O `rsg-mdt` deixou de forcar ingles e agora respeita `ox:locale`/`rsg_locale`.
- `rsg-playerinfo` e `rsg-spawn` receberam catalogos portugueses completos.
- Textos embutidos de `rsg-consume`, `rsg-npcs`, `rsg-radialmenu`, `rsg-spawn` e `rsg-loading` foram movidos ou vinculados a arquivos de locale.
- `rsg-animations`, `rsg-lockpick` e `rsg-menubase` receberam seus arquivos portugueses e ajustes de empacotamento/carregamento. O `rsg-menubase` nao possui textos proprios da interface: ele renderiza os rotulos enviados pelos recursos chamadores.

## Configuracao ativa

O `server.cfg` usa:

```cfg
setr rsg_locale "pt-br"
setr ox:locale "pt-br"
setr qb_locale "pt-br"
```

`qb_locale` permanece por compatibilidade com o carregador legado atual do `rsg-core`.

## Atualizacoes sem perder traducoes

Os repositorios dos recursos continuam como submodulos Git. As alteracoes nao precisam ser mantidas como commits dentro deles:

1. `overrides/framework/<recurso>/...` guarda a versao personalizada no repositorio principal.
2. `scripts/apply-locales.ps1` copia os overrides para cada recurso.
3. `scripts/setup.ps1` aplica os locales automaticamente na instalacao.
4. `scripts/update-resources.ps1` restaura os submodulos, atualiza seus repositorios e reaplica os overrides.

Para reaplicar manualmente:

```powershell
.\scripts\apply-locales.ps1
```

Para atualizar todos os recursos:

```powershell
.\scripts\update-resources.ps1
```

## Validacao

- 53 submodulos e arquivos essenciais validados.
- Cobertura dos catalogos JSON comparada automaticamente: nenhuma chave ausente.
- Boot do FXServer concluido com os 36 recursos RSG iniciados.
- Conexao com MariaDB estabelecida e autenticacao Cfx concluida.
- Segundo boot sem `SCRIPT ERROR`, erro de sintaxe ou falha ao iniciar recurso.
- Servidor de teste encerrado depois da validacao.

Observacao: mensagens tecnicas dos verificadores de versao permanecem em ingles por serem logs administrativos do upstream, nao textos exibidos aos jogadores.
