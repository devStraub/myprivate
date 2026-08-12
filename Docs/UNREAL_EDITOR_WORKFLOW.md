# Unreal Editor Workflow

## Objetivo

Servir como guia operacional inicial para quem já sabe programar, mas está aprendendo Unreal Engine.

---

## 1. Modelo mental

### Project
O conjunto completo do jogo.

### Level / Map
Um mundo/cena carregável.

### Actor
Objeto que pode existir em um World.

### Component
Capacidade/parte agregada a um Actor.

### Pawn
Actor que pode ser possuído/controlado.

### Character
Pawn especializado com funcionalidades típicas de personagem.

### PlayerController
Representa o controlador de um jogador e sua relação com o Pawn.

### GameMode
Define regras de uma partida/world no servidor.

### GameState
Estado global replicável da partida.

### PlayerState
Estado associado ao jogador.

### Blueprint
Asset visual baseado no sistema de reflexão da Unreal, podendo herdar classes C++.

---

## 2. Content Browser

Use para organizar assets.

Estrutura inicial sugerida:

```text
Content/
  Zeta/
    Core/
    Creatures/
    Resources/
    Environment/
    Maps/
    UI/
```

Não criar dezenas de pastas antes de precisar.

---

## 3. C++ + Blueprint

Fluxo comum:

1. Codex cria `AZetaCreature` em C++;
2. projeto compila;
3. Unreal Editor reconhece a classe;
4. usuário cria `BP_ZetaCreature` derivada;
5. Blueprint recebe mesh/visual/configurações;
6. gameplay fundamental permanece na classe C++.

---

## 4. Primeiro mapa

Criar um mapa de protótipo pequeno.

Nome sugerido:

`Prototype_Persistent`

ou simplesmente:

`Prototype`

Evitar começar por um planeta inteiro.

Usar geometria simples.

---

## 5. Play In Editor

PIE é parte essencial do ciclo.

Para cada incremento:

1. Compile;
2. abra mapa de teste;
3. Play;
4. reproduza cenário;
5. observe logs;
6. pare;
7. corrija.

---

## 6. Logs

Usar Output Log.

Código C++ deve criar categorias de log adequadas conforme o projeto amadurecer.

Não depender de `Print String` como único mecanismo de diagnóstico.

---

## 7. Blueprints

Boas práticas iniciais:

- grafos pequenos;
- funções nomeadas;
- evitar Event Graph gigante;
- reduzir casts repetitivos;
- evitar Tick sem necessidade;
- documentar ligação crítica;
- levar lógica de domínio estável para C++.

---

## 8. Assets temporários

Protótipos podem utilizar:

- shapes;
- Starter Content;
- assets provisórios.

Marcar mentalmente/na documentação o que é placeholder.

Não bloquear gameplay esperando arte final.

---

## 9. World scale

Antes de criar planetas completos, testar gameplay em espaços pequenos.

Problemas de escala planetária serão tratados como sistema próprio.

Não decidir solução baseada apenas em visualização conceitual.

---

## 10. Operação assistida

Quando não souber realizar uma ação no Editor:

1. descrever a tela/objetivo;
2. enviar screenshot se necessário;
3. receber instruções específicas;
4. executar;
5. validar resultado.

A aprendizagem de Unreal ocorrerá junto com a construção do protótipo.
