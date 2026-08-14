# Recursos de coleta do Fipas Roleplay

## Ordem de implantacao

1. `fipas-mining` - concluido
2. `fipas-lumberjack` - concluido
3. `fipas-herbs` - concluido
4. `fipas-hunting` - proximo

## fipas-mining

Adaptacao RSG inspirada no `VORPCORE/vorp_mining`, preservando os creditos e a licenca GPL-2.0.

### Funcionalidades

- Mineracao por modelos de rocha do mundo usando `ox_target`.
- Picareta obrigatoria.
- Teste de habilidade, animacao e barra de progresso.
- Cooldown sincronizado por rocha.
- Chance configuravel de quebra da ferramenta.
- Argila, carvao, cobre, ferro, nitrito, pedra, sal e pepita de ouro.
- Itens registrados dinamicamente sem editar o submodulo `rsg-core`.
- Validacoes server-side de modelo, distancia, ferramenta, tempo, sessao e capacidade.
- Locale `pt-br` e `en`.

### Configuracao

O balanceamento fica em `resources/[fipas]/fipas-mining/config.lua`.

### Validacao

- Estrutura e JSON validados.
- FXServer iniciou o recurso sem erros de runtime.
- MariaDB e autenticacao Cfx confirmados durante o teste.
- Teste do fluxo visual dentro do cliente RedM ainda deve ser feito por um jogador.

## fipas-lumberjack

Adaptacao RSG inspirada no `VORPCORE/vorp_lumberjack`, preservando creditos e GPL-2.0.

### Funcionalidades

- 261 modelos de arvores reconhecidos pelo `ox_target`.
- Machado obrigatorio, teste de habilidade, animacao e chance de quebra.
- Cooldown sincronizado individualmente por arvore.
- Madeira macia, madeira dura, seiva, fibras, polpa, latex e mel.
- Materiais registrados dinamicamente sem alterar o `rsg-core`.
- Modelo, distancia, ferramenta, duracao, sessao e capacidade validados no servidor.
- Locales `pt-br` e `en`.

### Validacao

- JSON e estrutura validados.
- `fipas-lumberjack` e `fipas-mining` iniciaram juntos sem erros de runtime.
- MariaDB e autenticacao Cfx confirmados.
- O fluxo visual dentro do cliente RedM ainda deve ser testado por um jogador.

## fipas-herbs

Adaptacao RSG inspirada no `VORPCORE/vorp_herbs`, preservando creditos e GPL-2.0.

### Funcionalidades

- 27 especies/modelos de plantas naturais reconhecidos pelo `ox_target`.
- 29 ingredientes naturais normalizados para nomes de item em minusculas.
- Recompensa, quantidade e cooldown especificos por especie.
- Animacao de coleta e bloqueio de movimento durante a acao.
- Modelo, distancia, duracao, sessao e capacidade validados no servidor.
- Itens registrados dinamicamente sem alterar o `rsg-core`.
- Locales `pt-br` e `en`.

Os pomares fixos extensos da referencia VORP foram reservados para um futuro sistema de agricultura, evitando misturar cultivo com coleta silvestre.

### Validacao

- JSON e estrutura validados.
- Ervas, lenhador e mineracao iniciaram juntos sem erros de runtime.
- MariaDB e autenticacao Cfx confirmados.
- O fluxo visual dentro do cliente RedM ainda deve ser testado por um jogador.
