# Roadmap Técnico Inicial

Este roadmap descreve experimentos, não datas.

---

## Fase 0 — Bootstrap

Objetivo: conseguir desenvolver com segurança.

- [ ] criar/abrir repositório Git;
- [ ] instalar/verificar Unreal Engine;
- [ ] instalar/verificar toolchain C++;
- [ ] criar projeto C++ mínimo;
- [ ] configurar `.gitignore`;
- [ ] compilar Editor target;
- [ ] abrir projeto;
- [ ] confirmar que Codex lê `AGENTS.md`.

Saída:

> projeto vazio, versionado e compilável.

---

## Fase 1 — Creature Hello World

Objetivo: provar C++ → Unreal → Blueprint → World.

- [ ] criar classe C++ de criatura;
- [ ] criar Blueprint derivada;
- [ ] colocar criatura no mapa;
- [ ] expor um valor configurável;
- [ ] visualizar/logar estado.

Saída:

> uma criatura existe no World e é sustentada por código C++ do projeto.

---

## Fase 2 — Necessidade

Objetivo: provar simulação mínima.

- [ ] adicionar energia;
- [ ] energia diminui com tempo/simulação;
- [ ] estado é observável;
- [ ] evitar dependência desnecessária de Tick por entidade se surgir alternativa simples.

Saída:

> criatura pode entrar em estado de necessidade.

---

## Fase 3 — Recurso

- [ ] criar definição de recurso;
- [ ] colocar recurso no ambiente;
- [ ] permitir interação;
- [ ] recurso possui quantidade;
- [ ] coleta altera estado.

Saída:

> ambiente contém algo útil e consumível.

---

## Fase 4 — Fechar loop

- [ ] criatura obtém recurso;
- [ ] recurso recupera necessidade;
- [ ] jogador consegue influenciar a ação;
- [ ] loop pode ser repetido.

Saída:

> primeiro loop completo de sobrevivência.

---

## Fase 5 — Grupo

- [ ] instanciar 4 criaturas;
- [ ] estado individual;
- [ ] comportamento/grupo;
- [ ] decisões começam a gerar conflito de recursos.

Saída:

> gameplay começa a representar população, não personagem único.

---

## Fase 6 — Persistência mínima

- [ ] salvar estado relevante;
- [ ] fechar jogo;
- [ ] carregar;
- [ ] validar reconstrução.

---

## Fase 7 — Primeira variação ambiental

- [ ] dois ambientes;
- [ ] mesma regra;
- [ ] disponibilidade de recurso diferente;
- [ ] estratégia/resultados diferentes.

Saída:

> primeira prova concreta do princípio central de Zeta: ambiente muda a progressão.

---

## Gate de expansão

Somente depois dessas fases avaliar:

- reprodução;
- genética;
- evolução;
- crafting avançado;
- construção;
- planeta procedural;
- múltiplos planetas;
- sistema solar;
- multiplayer.

Nada impede pesquisa antecipada, mas implementação deve preservar o foco.
