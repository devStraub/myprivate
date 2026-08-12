# Project Vision — Projeto Zeta

## 1. Visão

Projeto Zeta é um jogo de progressão em grande escala no qual o jogador conduz o desenvolvimento de uma espécie e de sua sociedade desde uma condição extremamente primitiva até níveis avançados de domínio planetário e, posteriormente, exploração espacial.

O jogador não controla apenas um herói individual.

A unidade central é uma **população / espécie**, inicialmente representada por um pequeno grupo.

---

## 2. Estrutura macro

Cada jogador possui um único sistema solar próprio.

Características conceituais iniciais:

- o sistema possui aproximadamente 10 corpos planetários principais;
- pode possuir 1, 2 ou 3 estrelas;
- podem existir planetas e luas com condições distintas;
- o jogador escolhe onde iniciar sua civilização;
- a escolha inicial altera disponibilidade de recursos e dificuldade;
- diferentes runs no mesmo sistema podem produzir trajetórias diferentes;
- o jogador pode reiniciar sua progressão;
- para gerar um sistema solar completamente novo, o sistema anterior deverá ser descartado.

Esses números ainda são design em evolução e não devem ser hardcoded sem uma especificação de implementação.

---

## 3. Progressão

A progressão possui uma coluna tecnológica/evolutiva compartilhada, mas o caminho real depende do ambiente.

Exemplo conceitual:

- um planeta pode ter abundância do recurso A;
- outro pode possuir escassez de A e abundância de B;
- ambos usam a mesma lógica fundamental de progressão;
- a estratégia necessária para alcançar cada estágio é diferente.

A espécie também precisa ser adequada ao ambiente.

Uma combinação ruim entre características biológicas e condições ambientais pode tornar uma tentativa inviável e levar o jogador a reiniciar.

---

## 4. O jogador controla uma população

A gameplay começa com um pequeno grupo — atualmente imaginado como quatro indivíduos.

O jogador influencia:

- sobrevivência;
- prioridades;
- expansão;
- adaptação;
- obtenção de recursos;
- evolução;
- organização social;
- tecnologia.

O objetivo não é transformar o jogo em controle direto permanente de um único personagem.

A câmera e o modelo exato de controle ainda serão prototipados.

---

## 5. Era 0

A Era 0 é o jogo-base inicial.

Objetivo macro:

> estabelecer a espécie como força dominante de seu planeta.

O significado exato de "dominante" deverá ser traduzido futuramente em condições mensuráveis de vitória/progressão.

---

## 6. Presença externa

Existe uma civilização/raça extremamente avançada, de escala interestelar ou intergaláctica.

Durante os estágios iniciais ela pode:

- observar;
- interferir indiretamente;
- criar anomalias;
- provocar problemas;
- influenciar eventos.

Ela não deve simplesmente resolver ou destruir a progressão do jogador.

Essa presença funciona também como conexão narrativa com estágios futuros do jogo.

---

## 7. Futuro espacial

Em eras posteriores:

- o jogador alcança exploração espacial;
- passa a interagir diretamente com outros sistemas;
- encontra a civilização avançada;
- pode encontrar outros jogadores.

A arquitetura inicial deve evitar fechar portas para isso, mas **não deve implementar essa escala antes de o loop fundamental funcionar**.

---

## 8. Princípios de design

### Emergência acima de roteiro rígido

O jogo deve produzir histórias a partir da interação entre sistemas.

### Ambiente importa

Escolha de planeta/lua deve afetar significativamente a estratégia.

### Espécie importa

Características biológicas não são cosméticas.

### Escala cresce com o jogador

A abstração do controle pode aumentar à medida que população e civilização crescem.

### Falhar faz parte

Uma run inviável pode ser consequência legítima das escolhas feitas.

### Recomeçar precisa ser interessante

Uma nova tentativa deve permitir aprendizado e trajetórias diferentes.

---

## 9. O que ainda NÃO está decidido

Não assumir como definido:

- câmera final;
- controle direto ou indireto exato;
- tamanho físico real dos planetas;
- sistema final de combate;
- árvore tecnológica completa;
- modelo econômico;
- modelo político;
- forma final do multiplayer;
- persistência online;
- transição entre servidores/sessões;
- representação física integral do sistema solar.

Esses pontos exigem experimentação.
