# Development Environment

## 1. Ambiente primário

Plataforma inicial: **Windows 10/11 64-bit**.

Engine alvo inicial: **Unreal Engine 5.8**, salvo se o `.uproject` do repositório indicar outra versão.

IDE recomendada inicialmente: **Visual Studio 2022**.

Git deve estar disponível no terminal.

---

## 2. Fontes oficiais

Unreal Engine:
https://www.unrealengine.com/download

Documentação UE:
https://dev.epicgames.com/documentation/unreal-engine/

Visual Studio:
https://visualstudio.microsoft.com/

Git:
https://git-scm.com/

Codex:
https://developers.openai.com/codex/

Nunca baixar ferramentas de mirrors desconhecidos.

---

## 3. Ordem recomendada de setup

### Etapa A — Git

Verificar:

```powershell
git --version
```

Se não estiver instalado, usar a distribuição oficial ou `winget` quando disponível:

```powershell
winget install --id Git.Git -e
```

Fechar/reabrir terminal depois da instalação se necessário.

Configuração mínima:

```powershell
git config --global user.name "SEU NOME"
git config --global user.email "SEU EMAIL"
```

Não inventar esses valores automaticamente.

---

### Etapa B — Visual Studio 2022

Verificar se Visual Studio 2022 está instalado.

No Visual Studio Installer, garantir o workload:

- **Game development with C++**

E os componentes necessários/recomendados para Unreal disponíveis naquela instalação, incluindo toolchain MSVC e Windows SDK compatível.

A seleção exata deve respeitar a documentação oficial da versão da Unreal usada pelo projeto.

Não instalar uma versão aleatória do MSVC apenas porque é a mais recente.

Se a engine já estiver instalada, verificar seus requisitos antes de alterar toolchains.

---

### Etapa C — Epic Games Launcher

Instalar via site oficial da Unreal/Epic.

Login pode exigir ação manual do usuário.

Não armazenar credenciais em script ou repositório.

---

### Etapa D — Unreal Engine

Pelo Epic Games Launcher:

1. abrir Unreal Engine;
2. acessar Library;
3. adicionar uma versão da Engine;
4. instalar a versão alvo;
5. incluir suporte C++/debug symbols somente conforme necessidade.

Versão inicial sugerida: Unreal Engine 5.8.

Se o projeto existente declarar outra versão, instalar a versão compatível antes de converter.

Nunca converter automaticamente um projeto importante para uma engine nova.

---

## 4. Verificação automática pelo Codex

Quando receber a tarefa de preparar ambiente, o agente deve primeiro inventariar.

### Git

```powershell
git --version
where.exe git
```

### Visual Studio

Procurar `vswhere.exe`, normalmente fornecido pelo Visual Studio Installer, e consultar instalações.

Exemplo:

```powershell
& "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" -all -products * -format json
```

Se o arquivo não existir, relatar.

### Unreal

Não assumir path.

Procurar instalações conhecidas e associação do `.uproject`.

O arquivo `.uproject` e mecanismos oficiais de registro/launcher devem orientar a versão.

Também pode inspecionar paths comuns como diagnóstico, mas não como verdade absoluta.

---

## 5. Criando o projeto inicial

Quando ainda não existir `.uproject`, a criação inicial pelo Unreal Editor é aceitável e recomendada.

Configuração inicial sugerida:

- Games;
- Blank;
- C++;
- Desktop;
- Maximum Quality;
- Starter Content opcional;
- nome: `Zeta` (se ainda não houver nome técnico definido).

A escolha exata pode mudar antes da criação.

Após criar o projeto, o `.uproject` passa a ser parte central do repositório.

---

## 6. Gerando project files

Depois que existir `.uproject` e uma engine compatível estiver instalada:

- usar o comando oficial de geração de project files da instalação correspondente;
- alternativamente usar a integração do shell/Editor fornecida pela Unreal.

Não copiar `.sln` de outra máquina como fonte de verdade.

Arquivos de solução podem ser regenerados.

---

## 7. Build

O agente deve localizar a engine correta e usar os scripts oficiais.

O projeto terá targets derivados do nome real do projeto.

Exemplo conceitual, NÃO copiar cegamente:

```powershell
<UE>\Engine\Build\BatchFiles\Build.bat ZetaEditor Win64 Development "<repo>\Zeta.uproject" -WaitMutex
```

Antes de executar:

- confirmar nome do target;
- confirmar caminho;
- confirmar versão da engine.

---

## 8. Rodando o Editor

Exemplo conceitual:

```powershell
<UE>\Engine\Binaries\Win64\UnrealEditor.exe "<repo>\Zeta.uproject"
```

O agente pode preparar o comando.

Se a tarefa exigir interação visual, o usuário pode precisar operar o Editor.

---

## 9. Pastas que não devem ir para Git

Normalmente ignorar:

- `Binaries/`
- `DerivedDataCache/`
- `Intermediate/`
- `Saved/`
- `.vs/`

Manter:

- `Config/`
- `Content/`
- `Source/`
- `.uproject`
- documentação;
- scripts próprios.

Assets `.uasset` fazem parte do projeto e devem ser versionados quando forem conteúdo real.

---

## 10. Large files

Unreal pode produzir assets grandes.

Antes de o repositório crescer significativamente, avaliar Git LFS para tipos de assets que realmente necessitem.

Não habilitar LFS indiscriminadamente sem uma política de tipos de arquivo.

---

## 11. Codex local

Codex pode trabalhar no diretório local e executar comandos permitidos pelo ambiente.

Documentação:
https://developers.openai.com/codex/cli

O Codex deve ler `AGENTS.md` antes de modificar o projeto.

Para verificar que as instruções estão sendo descobertas, pode-se pedir explicitamente:

> Leia o AGENTS.md aplicável a este diretório e resuma as regras que você deverá seguir antes de fazer qualquer alteração.

---

## 12. Primeira validação de ambiente

Considerar setup concluído somente quando:

- [ ] Git funciona;
- [ ] Visual Studio/toolchain C++ compatível está disponível;
- [ ] Unreal Engine alvo está instalada;
- [ ] projeto abre no Unreal Editor;
- [ ] project files podem ser gerados;
- [ ] target Editor compila;
- [ ] projeto abre após build;
- [ ] `git status` não contém artefatos gerados indevidos.

---

## 13. Troubleshooting básico

### Erro de toolchain

Comparar versão da engine com requisitos oficiais.

Não resolver instalando várias versões aleatórias.

### `.uproject` não encontra engine

Verificar associação/registro da engine.

### Build quebra depois de troca de engine

Não apagar tudo imediatamente.

Primeiro:

- registrar erro;
- verificar versão;
- verificar toolchain;
- regenerar project files;
- somente depois considerar limpar `Intermediate/Binaries`.

### Editor abre mas C++ não compila

Verificar:

- workload C++;
- MSVC;
- Windows SDK;
- target;
- módulos;
- `.Build.cs`.

---

## 14. Regra para o agente

Se alguma etapa exigir privilégio administrativo, autenticação, licença, login ou UI que o agente não consiga operar de forma legítima, ele deve parar somente naquela etapa, informar a ação manual necessária e continuar tudo o que for possível em paralelo.
