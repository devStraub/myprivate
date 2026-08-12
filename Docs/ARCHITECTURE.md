# Architecture — Projeto Zeta

## 1. Objetivo

Estabelecer princípios arquiteturais iniciais sem criar antecipadamente uma estrutura excessiva.

---

## 2. Modelo de camadas

Pensar inicialmente em três responsabilidades:

### Simulation / Domain

Estado e regras que representam o mundo independentemente da aparência.

Exemplos:

- necessidades;
- recursos;
- população;
- espécie;
- progressão;
- ambiente;
- produção.

### Gameplay / Unreal Integration

Integra o domínio com conceitos da engine.

Exemplos:

- Actors;
- Pawns;
- Components;
- Controllers;
- Subsystems;
- interação;
- eventos;
- save/load;
- replicação.

### Presentation

Representação para o jogador.

Exemplos:

- meshes;
- animações;
- UI;
- áudio;
- VFX;
- materiais;
- câmera.

A fronteira não precisa ser perfeita, mas lógica de domínio importante não deve depender desnecessariamente de detalhes visuais.

---

## 3. C++ e Blueprint

### C++

Preferir para:

- regras;
- sistemas;
- algoritmos;
- modelos de dados;
- APIs;
- lógica reutilizável;
- serialização;
- rede;
- performance crítica.

### Blueprint

Preferir para:

- composição;
- configuração;
- ligações de assets;
- eventos visuais;
- animações;
- VFX;
- UI;
- prototipação.

Um Blueprint pode conter gameplay, mas sistemas fundamentais não devem existir somente como grafos difíceis de versionar/testar.

---

## 4. Actors não são banco de dados

Evitar representar cada conceito abstrato como Actor.

Pergunta obrigatória:

> isto precisa existir fisicamente no World?

Se não, considerar:

- `UObject`;
- struct;
- Data Asset;
- Subsystem;
- estado em container de simulação.

---

## 5. Tick

`Tick` não é proibido.

Mas deve ser uma decisão consciente.

Antes de adicionar Tick:

- a frequência precisa ser por frame?
- Timer resolve?
- evento resolve?
- processamento em lote resolve?
- sistema centralizado resolve?

Para grandes populações, não assumir 1 Tick por indivíduo como arquitetura final.

---

## 6. Components

Components são candidatos naturais para capacidades reutilizáveis.

Exemplos futuros:

- NeedsComponent;
- InventoryComponent;
- InteractionComponent;
- Health/ConditionComponent.

Não criar Components apenas para "organizar arquivos"; usar quando a capacidade realmente compõe diferentes entidades.

---

## 7. Subsystems

Avaliar Subsystems quando existir serviço com ciclo de vida apropriado.

Exemplos potenciais:

- SimulationSubsystem;
- ResourceRegistry;
- Save orchestration;
- world-level population manager.

Escolher o tipo de Subsystem conforme escopo real.

---

## 8. Dados

Definições estáticas devem tender a ser configuráveis.

Exemplo conceitual:

`CreatureSpeciesDefinition`

pode conter:

- identificador;
- tamanho;
- metabolismo;
- tolerância térmica;
- capacidades;
- tags.

Instâncias runtime referenciam essa definição e mantêm somente estado mutável.

---

## 9. Identidade

Entidades persistentes deverão possuir identidade estável quando necessário.

Não usar ponteiros/endereços de memória como identidade persistente.

Avaliar GUIDs ou IDs controlados pelo domínio quando save/multiplayer exigirem.

---

## 10. Persistência

Save Game deverá ser pensado como modelo de dados versionável.

Evitar serializar cegamente o World inteiro.

Preferir salvar estado significativo e reconstruir representação.

Versões futuras podem exigir:

- versionamento;
- migrations;
- compatibilidade.

---

## 11. Multiplayer

Princípios:

- servidor deve ser autoridade sobre estado competitivo/importante;
- cliente não deve ser confiado para validar regras críticas;
- reduzir replicação desnecessária;
- estado visual derivável não precisa necessariamente atravessar a rede;
- sistemas devem declarar ownership e autoridade claramente.

O primeiro protótipo pode ser offline.

---

## 12. Simulação em escala

Hipótese arquitetural importante:

Quando a população crescer, diferentes níveis de simulação podem coexistir.

Exemplo futuro:

### Full simulation
Indivíduos próximos/visíveis com representação completa.

### Reduced simulation
Indivíduos/grupos distantes simulados com frequência menor.

### Aggregate simulation
Populações inteiras representadas estatisticamente.

Não implementar agora. Apenas não construir sistemas que tornem essa evolução impossível.

---

## 13. Estrutura de módulos

No início, manter simplicidade.

Um único módulo de jogo pode ser suficiente.

Criar módulos separados apenas quando houver benefício mensurável:

- tempo de compilação;
- fronteira arquitetural;
- dependência;
- editor/runtime;
- plugin reutilizável.

Evitar modularização prematura.

---

## 14. Naming inicial

Usar domínio, não nomes temporários vagos.

Preferir:

- `ZetaCreature`
- `ZetaResourceDefinition`
- `ZetaNeedsComponent`

em vez de:

- `Manager2`
- `Thing`
- `BaseObjectNew`

O prefixo exato deverá acompanhar o módulo/projeto real criado.

---

## 15. Primeiro corte arquitetural recomendado

Para o primeiro vertical slice, provavelmente serão necessários apenas conceitos equivalentes a:

- Creature;
- CreatureDefinition/SpeciesDefinition;
- Need;
- Resource;
- Interactable;
- Inventory/held resource;
- um coordenador simples da simulação.

A estrutura final deve emergir da implementação, não ser fabricada antecipadamente.
