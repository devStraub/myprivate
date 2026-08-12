# First Codex Task — Bootstrap do Ambiente

Este arquivo pode ser usado como a primeira tarefa enviada ao Codex.

---

## Prompt recomendado

Leia `AGENTS.md` e todos os arquivos de `Docs/`.

Ainda não implemente gameplay.

Objetivo desta tarefa:

1. inspecionar esta máquina e este diretório;
2. determinar se o ambiente necessário para desenvolvimento Unreal Engine C++ está pronto;
3. preparar tudo que puder ser preparado com segurança;
4. identificar de forma precisa qualquer ação manual restante.

### Verifique

- estado do Git;
- se este diretório já é repositório;
- versão do Git;
- instalações do Visual Studio;
- workload/toolchain C++ relevante;
- Windows SDK;
- Epic Games Launcher;
- instalações da Unreal Engine;
- existência de `.uproject`;
- versão de Unreal associada caso exista projeto;
- capacidade de gerar project files;
- capacidade de compilar o target Editor, se já existir projeto.

### Regras

- não altere a versão da Unreal de um projeto existente;
- não converta projeto;
- não apague arquivos;
- não instale nada de fonte não oficial;
- não tente automatizar login ou credenciais;
- antes de instalar algo, confirme que realmente está ausente;
- se uma etapa gráfica/manual for necessária, documente-a e continue as outras verificações.

### Se ainda não existir projeto Unreal

Não crie automaticamente antes de relatar o inventário do ambiente.

No relatório, diga se estamos prontos para criar um projeto C++ chamado `Zeta` e quais opções iniciais recomenda conforme `Docs/DEVELOPMENT_ENVIRONMENT.md`.

### Entrega

Produza:

1. `Environment inventory`;
2. `Ready / not ready`;
3. `Changes performed`;
4. `Manual actions required`;
5. `Exact next command/task`.

Não implemente sistemas de gameplay nesta tarefa.
