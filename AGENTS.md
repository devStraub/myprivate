# AGENTS.md — Projeto Zeta

## 1. Propósito deste arquivo

Este arquivo contém as instruções permanentes para qualquer agente Codex que trabalhe neste repositório.

Antes de alterar código, configuração, conteúdo textual ou estrutura do projeto:

1. leia este arquivo por completo;
2. leia `Docs/PROJECT_VISION.md`;
3. leia `Docs/ARCHITECTURE.md`;
4. leia a documentação específica relacionada à tarefa;
5. inspecione o estado atual do repositório antes de propor mudanças.

O repositório e sua documentação são a fonte de verdade. Não presuma que decisões de conversas externas continuam válidas se elas não estiverem registradas aqui.

---

## 2. Identidade do projeto

Nome de trabalho: **Projeto Zeta**

Engine: **Unreal Engine 5**

Alvo inicial: **Unreal Engine 5.8**, salvo se o arquivo `.uproject` do repositório indicar explicitamente outra versão. Nesse caso, a versão registrada pelo projeto tem precedência.

Linguagem principal de gameplay/sistemas: **C++**

Blueprints: permitidos e esperados como camada de composição, parametrização, assets, animação, VFX, UI, prototipação visual e integração com Editor.

---

## 3. Princípios fundamentais

### 3.1 C++ como fundação

Sistemas centrais devem ser implementados preferencialmente em C++:

- regras de gameplay;
- modelos de dados;
- sistemas planetários;
- recursos;
- inventários;
- população;
- espécies;
- evolução;
- necessidades;
- crafting;
- construção;
- persistência;
- multiplayer;
- replicação;
- geração procedural;
- simulação.

Blueprints devem preferencialmente herdar ou compor classes C++.

Não mover lógica de domínio inteira para Blueprint apenas por conveniência.

### 3.2 Data-driven

Sempre que razoável, o comportamento deve ser configurável por dados.

Priorizar, quando aplicável:

- `UDataAsset`;
- `UPrimaryDataAsset`;
- Data Tables;
- Gameplay Tags;
- structs serializáveis;
- assets configuráveis no Editor.

Evitar valores de gameplay espalhados como números mágicos no código.

### 3.3 Multiplayer desde a arquitetura

Mesmo em protótipos single-player, evitar decisões que tornem a migração futura para multiplayer desnecessariamente difícil.

Ao criar estado de gameplay, avaliar:

- autoridade;
- ownership;
- replicação;
- persistência;
- determinismo necessário;
- custo de rede;
- relevância espacial.

Não implementar replicação prematuramente em tudo, mas documentar quando um sistema ainda não estiver preparado para multiplayer.

### 3.4 Separação de responsabilidades

Evitar classes monolíticas.

Preferir:

- Components para capacidades reutilizáveis;
- Subsystems para serviços de escopo apropriado;
- interfaces para contratos;
- classes de domínio focadas;
- sistemas desacoplados por eventos/delegates quando apropriado.

### 3.5 Performance como requisito arquitetural

O Projeto Zeta pretende simular populações, recursos e mundos em escala crescente.

Evitar desde cedo arquiteturas que exijam:

- `Tick` individual em milhares de Actors;
- Actors para todo dado abstrato da simulação;
- buscas globais frequentes;
- loops completos por mundo a cada frame;
- replicação de dados irrelevantes;
- criação/destruição excessiva de objetos em runtime.

Quando houver dúvida, separar:

- representação visual;
- simulação;
- persistência.

---

## 4. Regra de ouro para implementação

Nunca implementar uma feature grande inteira de uma vez quando ela puder ser dividida em incrementos verificáveis.

Fluxo esperado:

1. compreender o requisito;
2. inspecionar o código existente;
3. identificar o menor incremento útil;
4. implementar;
5. compilar;
6. testar;
7. documentar;
8. informar ao usuário o que precisa ser feito manualmente no Unreal Editor;
9. somente então seguir para a próxima etapa.

---

## 5. Antes de modificar o projeto

O agente deve:

- executar `git status`;
- identificar a branch atual;
- não sobrescrever trabalho não relacionado;
- localizar o `.uproject`;
- identificar módulos existentes;
- verificar a versão de Unreal associada ao projeto;
- localizar documentação relacionada;
- verificar se existe build funcional conhecido.

Se houver alterações locais do usuário, preservá-las.

Não executar operações destrutivas sem necessidade.

Não usar:

- `git reset --hard`;
- limpeza indiscriminada de arquivos;
- rebase destrutivo;
- exclusão de assets;
- alteração de histórico remoto;

a menos que o usuário peça explicitamente e o impacto esteja claro.

---

## Git Branch Safety

O Projeto Zeta existe exclusivamente na branch `projeto-zeta`, em um worktree dedicado cuja raiz esperada é:

```text
C:\dev\projeto_zeta
```

Antes de qualquer operação que altere arquivos, execute:

```powershell
git rev-parse --show-toplevel
git branch --show-current
```

Confirme simultaneamente que:

- o top-level é `C:\dev\projeto_zeta`;
- a branch ativa é `projeto-zeta`.

Se qualquer uma dessas condições não for atendida:

- não altere arquivos;
- não faça commit;
- não faça push;
- informe o usuário e aguarde orientação.

É permanentemente proibido:

- fazer merge de `projeto-zeta` para `main`;
- fazer merge de `main` para `projeto-zeta`;
- desenvolver o Projeto Zeta na `main`;
- criar commits do Projeto Zeta na `main`;
- fazer push do Projeto Zeta para `main`.

Antes de tarefas importantes, execute também:

```powershell
.\Scripts\Verify-ZetaGitContext.ps1
```

O script deve terminar com sucesso antes que o trabalho prossiga.

---

## 6. Dependências e instalação

Antes de instalar qualquer software:

1. leia `Docs/DEVELOPMENT_ENVIRONMENT.md`;
2. detecte o que já está instalado;
3. não reinstale software existente;
4. prefira fontes oficiais;
5. não faça download de executáveis de mirrors ou sites não oficiais.

O agente pode automatizar ferramentas de linha de comando quando houver um caminho seguro e claro.

A instalação da Unreal Engine via Epic Games Launcher pode exigir autenticação e interação gráfica do usuário. Nesse caso:

- não tente contornar autenticação;
- não tente automatizar credenciais;
- informe exatamente qual etapa manual é necessária;
- continue com verificações que não dependam dessa interação.

---

## 7. Builds

O objetivo é sempre deixar o projeto compilável.

No Windows, descobrir o caminho real da engine antes de montar comandos.

Não assumir que a engine está em um path fixo.

Locais comuns podem ser inspecionados, mas o projeto/registro/launcher devem prevalecer.

Para regenerar project files, utilizar as ferramentas da própria engine compatível com o `.uproject`.

Para build, preferir Unreal Build Tool / scripts oficiais da engine.

Registrar no relatório final:

- comando executado;
- configuração;
- resultado;
- warnings relevantes;
- erros ainda existentes.

---

## 8. Unreal Editor

O Codex deve distinguir claramente:

### Pode fazer diretamente
- C++;
- `.Build.cs`;
- `.Target.cs`;
- `.ini`;
- arquivos de documentação;
- automações;
- scripts;
- testes;
- geração de project files;
- builds;
- análise de logs.

### Pode exigir ação do usuário no Editor
- criação/edição visual de Blueprint;
- ligação de assets;
- montagem de Levels;
- Material Editor;
- Niagara;
- Animation Blueprint;
- Landscape;
- World Partition;
- Sequencer;
- configuração visual de assets;
- operações que gerem/modifiquem `.uasset` sem uma ferramenta apropriada.

Quando uma ação manual for necessária, dar instruções reproduzíveis e curtas.

Nunca fingir que editou um asset binário que não conseguiu alterar.

---

## 9. Convenções iniciais de código

Usar convenções Unreal.

Exemplos:

- `A` para Actor;
- `U` para UObject;
- `F` para struct;
- `E` para enum;
- `I` para interface;
- `T` para templates quando aplicável.

Nomes devem expressar domínio.

Evitar abreviações obscuras.

Comentários devem explicar **por quê**, não repetir o que o código já diz.

APIs expostas ao Blueprint devem ser intencionais.

Não marcar tudo como `BlueprintReadWrite` por padrão.

---

## 10. Estrutura conceitual inicial

Esperamos que o domínio cresça aproximadamente nestas áreas:

- Core;
- Simulation;
- Creatures;
- Species;
- Resources;
- Environment;
- Planets;
- SolarSystem;
- Building;
- Crafting;
- Population;
- Save;
- Multiplayer;
- UI.

Essa lista é orientação, não ordem para criar módulos imediatamente.

Não criar arquitetura fictícia sem necessidade concreta.

---

## 11. Testes

Sempre que possível:

- criar testes automatizados para lógica de domínio;
- separar lógica testável de representação visual;
- validar invariantes;
- testar serialização quando relevante.

Features de gameplay também podem exigir Play-In-Editor ou teste manual.

Documentar o procedimento manual.

---

## 12. Documentação obrigatória

Se uma tarefa:

- criar um novo sistema;
- alterar arquitetura;
- introduzir dependência;
- mudar um contrato;
- mudar fluxo de build;
- mudar setup de ambiente;

atualize a documentação correspondente.

Decisões arquiteturais relevantes devem ser registradas em `Docs/DECISIONS.md`.

---

## 13. Relatório final de cada tarefa

Ao terminar, responder com:

### Alterado
Lista curta dos arquivos/sistemas alterados.

### Validado
Builds e testes executados.

### Ação manual no Unreal
Somente se necessária.

### Riscos / pendências
Apenas problemas reais.

### Próximo incremento recomendado
Uma sugestão curta, sem iniciar automaticamente trabalho adicional grande.

---

## 14. Proibições importantes

Não:

- instalar plugins Unreal sem justificativa;
- adicionar bibliotecas externas quando a engine já resolve o problema adequadamente;
- alterar versão da Unreal por conta própria;
- migrar o projeto para source-build da engine sem solicitação;
- criar sistemas complexos especulativos;
- fazer grandes refactors sem relação com a tarefa;
- incluir segredos, tokens ou credenciais no repositório;
- commitar `Binaries`, `DerivedDataCache`, `Intermediate` ou `Saved`;
- tratar documentação de design como autorização para implementar tudo de uma vez.

---

## 15. Ordem de leitura recomendada

Para onboarding:

1. `README.md`
2. `AGENTS.md`
3. `Docs/PROJECT_VISION.md`
4. `Docs/GAME_DESIGN_FOUNDATIONS.md`
5. `Docs/ARCHITECTURE.md`
6. `Docs/DEVELOPMENT_ENVIRONMENT.md`
7. `Docs/CODEX_WORKFLOW.md`
8. `Docs/UNREAL_EDITOR_WORKFLOW.md`
9. `Docs/ROADMAP.md`
10. `Docs/DECISIONS.md`
