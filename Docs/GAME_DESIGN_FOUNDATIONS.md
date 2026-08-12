# Game Design Foundations

## Objetivo

Registrar conceitos de gameplay que devem orientar protótipos sem transformar ideias ainda abertas em regras técnicas rígidas.

---

## 1. Unidade inicial de jogo

A primeira experiência deverá trabalhar com um grupo pequeno de criaturas.

Referência inicial:

- 4 indivíduos.

O número deve ser configurável.

---

## 2. Loop mínimo de sobrevivência

O primeiro loop a ser provado deve ser simples:

1. criaturas existem em um ambiente;
2. possuem uma necessidade;
3. o ambiente contém um recurso relacionado;
4. o recurso precisa ser localizado/obtido;
5. o recurso é consumido ou transformado;
6. isso altera o estado das criaturas;
7. o jogador toma uma decisão que interfere no resultado.

Antes de ampliar o escopo, esse ciclo precisa ser divertido, legível e tecnicamente saudável.

---

## 3. Recursos

Recursos devem futuramente possuir propriedades que permitam:

- abundância por ambiente;
- escassez;
- composição;
- transformação;
- uso tecnológico;
- uso biológico.

Não começar criando dezenas de recursos.

Protótipo inicial: 1 recurso é suficiente.

---

## 4. Necessidades

Necessidades podem futuramente incluir:

- energia;
- alimento;
- água;
- temperatura;
- abrigo;
- segurança;
- reprodução;
- socialização.

Não implementar todas de início.

Protótipo inicial: escolher uma necessidade mensurável.

---

## 5. Criaturas

Separar conceitualmente:

### Definição da espécie
Dados relativamente estáveis:

- características;
- capacidades;
- limites;
- preferências ambientais.

### Indivíduo
Estado runtime:

- idade;
- energia;
- posição;
- inventário;
- condição;
- comportamento.

Essa separação será importante para simulação em escala.

---

## 6. Ambiente

O ambiente deverá influenciar sobrevivência e progressão.

Categorias futuras possíveis:

- temperatura;
- gravidade;
- atmosfera;
- radiação;
- ciclo de luz;
- disponibilidade hídrica;
- composição mineral;
- biomas.

No protótipo, utilizar somente as variáveis necessárias.

---

## 7. Escala da simulação

O jogo pode futuramente envolver populações grandes.

Portanto:

- indivíduos visíveis não precisam ser a única representação da população;
- simulação distante pode precisar de abstração;
- população pode existir em níveis de detalhe diferentes;
- representação visual e modelo de simulação não devem ser inseparáveis.

Esse problema será estudado posteriormente.

---

## 8. Falha

A espécie pode falhar.

Falha pode ocorrer por:

- inadequação ambiental;
- consumo maior que produção;
- decisões ruins;
- colapso populacional;
- eventos.

O jogo não deve esconder completamente a causa da falha.

O jogador precisa conseguir aprender com ela.

---

## 9. Critério para adicionar complexidade

Adicionar um novo sistema somente quando ele:

- cria uma decisão interessante;
- reforça a fantasia central;
- resolve uma limitação técnica real;
- habilita uma próxima etapa do loop.

Complexidade sem impacto perceptível deve ser evitada.
