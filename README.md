# Fipas Roleplay

Base manual e versionada para um servidor RedM usando RSG Framework. Os recursos externos sao submodulos Git; o codigo proprio vive em `resources/[fipas]`.

## Requisitos

- Windows 10/11 ou Windows Server
- Git
- PowerShell 5.1+
- MariaDB/MySQL
- Artifacts atuais do FXServer para RedM
- Chave de licenca Cfx.re

## Primeira instalacao

```powershell
git clone --recurse-submodules -b fipas_roleplay https://github.com/devStraub/myprivate.git "Fipas Roleplay"
cd "Fipas Roleplay"
.\scripts\setup.ps1
```

O bootstrap inicializa os submodulos, sincroniza os recursos padrao da Cfx, baixa a release compilada do `oxmysql` e cria `secrets.cfg` e `permissions.cfg` a partir dos exemplos. Depois:

1. Preencha `secrets.cfg` com a chave Cfx, Steam e conexao MySQL.
2. Preencha `permissions.cfg` com os Rockstar License IDs da equipe.
3. Importe `database/rsgcore.sql` no banco `fipas_roleplay`.
4. Instale os artifacts do FXServer em `artifacts/server` ou defina `FXSERVER_EXE`.
5. Execute `.\scripts\start-server.cmd`.

## Atualizar recursos

```powershell
.\scripts\update-resources.ps1 -RunSetup
git diff --submodule
```

O script para se houver alteracoes locais. Depois da atualizacao, teste o servidor e registre as novas revisoes dos submodulos em um commit. Isso oferece atualizacoes reproduziveis; executar `git pull` dentro de cada recurso isoladamente nao registra de forma confiavel a combinacao implantada.

## Politica de customizacao

- Nao altere diretamente os submodulos RSG.
- Coloque integracoes, overrides e novos sistemas em `resources/[fipas]`.
- Recursos trazidos do Albuquerque devem passar por revisao de licenca, dependencias e namespace.
- Nunca envie `secrets.cfg`, `permissions.cfg`, banco ou cache ao Git.

## Estrutura

```text
database/                 SQL inicial
resources/[fipas]/        codigo proprio
resources/[framework]/    modulos RSG vinculados
resources/[standalone]/   dependencias vinculadas
resources/[mapmods]/      IPLs e YMAPs oficiais da base
scripts/                  bootstrap, atualizacao, validacao e inicio
vendor/                   fontes auxiliares vinculadas
```

Base alinhada com a receita oficial `Rexshack-RedM/txAdminRecipe`, revisada em 13/08/2026.
