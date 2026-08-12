# Codex Workflow

## 1. Objetivo

Transformar Codex em um desenvolvedor assistente que trabalha dentro de um processo previsível.

O objetivo não é pedir "faça o jogo".

O objetivo é fornecer tarefas pequenas, verificáveis e contextualizadas.

---

## 2. Fluxo padrão

### 1. Design
Uma ideia é discutida e consolidada.

### 2. Documentação
A decisão relevante entra em `Docs/`.

### 3. Issue/task
A implementação é reduzida ao menor incremento útil.

### 4. Codex
O agente lê as regras, inspeciona o projeto e implementa.

### 5. Build/test
O agente valida tecnicamente.

### 6. Unreal Editor
O usuário executa validação visual/gameplay quando necessária.

### 7. Feedback
Problemas e aprendizados retornam ao design.

---

## 3. Modelo de prompt para nova feature

Use algo assim:

```text
Leia AGENTS.md e a documentação relevante.

Objetivo:
[resultado observável]

Escopo desta tarefa:
[lista pequena]

Fora de escopo:
[o que NÃO deve ser implementado]

Critérios de aceitação:
[como sabemos que terminou]

Antes de alterar, inspecione a implementação existente.
Ao terminar, compile/teste e informe qualquer passo manual necessário no Unreal Editor.
```

---

## 4. Exemplo — modelo de criatura

```text
Leia AGENTS.md, Docs/ARCHITECTURE.md e Docs/GAME_DESIGN_FOUNDATIONS.md.

Objetivo:
Criar o primeiro modelo C++ mínimo para representar uma criatura no protótipo.

Escopo:
- uma classe/estrutura de definição estática;
- uma entidade runtime;
- energia atual e energia máxima;
- API mínima para consumir e recuperar energia.

Fora de escopo:
- IA;
- animação;
- reprodução;
- multiplayer;
- inventário;
- UI.

Critérios:
- projeto compila;
- valores podem ser inspecionados/configurados adequadamente;
- existe teste de lógica quando viável;
- documentação é atualizada se houver decisão arquitetural.
```

---

## 5. Tarefas que devem ser pequenas

Bom:

- criar definição de recurso;
- adicionar uma necessidade;
- criar InteractionComponent;
- expor evento de coleta;
- criar teste de metabolismo;
- adicionar save de uma struct específica.

Ruim:

- fazer sistema de criaturas;
- fazer multiplayer;
- criar todos os planetas;
- implementar evolução;
- construir Era 0.

---

## 6. Antes de aceitar uma implementação

Perguntar:

- compila?
- foi testada?
- o Codex criou complexidade desnecessária?
- há lógica que deveria estar em C++ mas foi colocada em Blueprint?
- há Tick desnecessário?
- dados de gameplay estão hardcoded?
- o comportamento é observável no jogo?
- a tarefa criou algo que ainda não precisamos?

---

## 7. Uso de sessões paralelas

Codex pode trabalhar em tarefas paralelas somente quando elas não competem pelos mesmos arquivos/arquitetura.

Boas tarefas paralelas:

- documentação;
- teste isolado;
- ferramenta auxiliar;
- investigação de bug independente.

Evitar paralelismo em features que ainda estão definindo a mesma API central.

---

## 8. Debug

Quando houver erro, enviar ao Codex:

- mensagem completa;
- contexto;
- passo que reproduz;
- expectativa;
- comportamento real.

Pedir primeiro diagnóstico, depois correção.

Não pedir para "tentar qualquer coisa até funcionar".

---

## 9. Alterações no Editor

Quando o código exigir Blueprint/configuração manual, o Codex deve gerar um checklist semelhante a:

```text
1. Abra BP_Creature.
2. Em Class Defaults, configure SpeciesDefinition.
3. Adicione o mesh.
4. Compile e Save.
5. Coloque uma instância no mapa Prototype.
6. Execute PIE.
```

---

## 10. Commits

Commits devem representar unidades compreensíveis.

Sugestão:

```text
feat(creatures): add initial energy model
fix(resources): prevent negative quantity
docs(architecture): record species definition decision
test(simulation): cover energy consumption
```

Não obrigar o Codex a commitar automaticamente a menos que isso faça parte do fluxo solicitado.

---

## 11. Revisão arquitetural

Antes de mudanças grandes, usar uma tarefa somente de análise:

```text
Não altere arquivos.

Leia a implementação atual de X.
Compare com Docs/ARCHITECTURE.md.
Proponha no máximo 3 opções.
Explique trade-offs e recomende uma.
```

Depois escolher uma direção.

---

## 12. Regra de contexto

Não depender da memória de chat do Codex para decisões permanentes.

Se uma informação importa para futuras implementações, registrá-la no repositório.
