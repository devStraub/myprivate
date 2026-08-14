# Recursos de coleta do Fipas Roleplay

## Ordem de implantacao

1. `fipas-mining` - concluido
2. `fipas-lumberjack` - proximo
3. `fipas-herbs`
4. `fipas-hunting`

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
