---
id: toolbox-principles
title: Princípios
type: governance
status: draft
created: 2026-08-23
updated: 2026-09-03
origin: [personal-practice, ai-assisted-analysis]
agents:
  - provider: openai
    model: unknown
    role: structure
    date: 2026-08-23
sources: [https://peps.python.org/pep-0020/]
related: [VALIDATION.md, governance/sanitization.md]
visibility: private
---

# Princípios

1. Entender antes de alterar.
2. Tratar a causa raiz antes do sintoma.
3. Exigir evidência antes de confiança.
4. Preferir simplicidade à complexidade desnecessária.
5. Preservar comportamento, exceto quando a mudança for intencional.
6. Testes são evidência, não prova absoluta.
7. Saída de IA é proposta, não autoridade.
8. Assumptions explícitas são melhores que assumptions ocultas.
9. Todo problema resolvido pode conter conhecimento reutilizável.
10. A experiência deve melhorar agentes futuros.
11. Conhecimento deve permanecer contestável e revisável.
12. Informação confidencial nunca se torna ativo pessoal de conhecimento.

## Simplicidade explícita

Influenciado pelo Zen do Python e confirmado pela prática profissional do proprietário:

> Prefira a solução mais simples que satisfaça explicitamente os requisitos e as evidências disponíveis.
> Introduza complexidade somente quando o problema a exigir, mantendo intenção, falhas e trade-offs
> visíveis.

Esse princípio é transversal e não depende da linguagem utilizada:

- legibilidade tem valor de engenharia;
- explícito é preferível a comportamento oculto ou surpreendente;
- complexo pode ser necessário, mas complicado exige justificativa;
- diante de ambiguidade material, registre a dúvida em vez de adivinhar;
- erros não devem ser ignorados ou transformados silenciosamente em sucesso;
- convenções e caminhos previsíveis reduzem decisões repetitivas;
- abstração, framework, estrutura de dados ou serviço novo precisa resolver uma necessidade concreta;
- concisão não justifica esconder custo, intenção ou condição de falha.

### Facilidade de explicação como heurística

Se uma implementação exige uma explicação longa para que outro desenvolvedor compreenda o fluxo básico,
isso é um sinal de que ela provavelmente pode ser simplificada. Uma boa implementação tende a permitir
que uma pessoa familiarizada com a linguagem reconheça rapidamente:

- qual é a intenção;
- por onde os dados entram e saem;
- quais são as decisões principais;
- onde estão as condições de falha;
- quais efeitos colaterais podem ocorrer.

Nomes claros, funções pequenas e responsabilidades delimitadas são preferíveis a comentários que
traduzem código difícil. Comentários devem registrar principalmente o **porquê**: regra não evidente,
restrição externa, decisão incomum ou trade-off que o código sozinho não consegue comunicar.

Essa heurística não implica que todo domínio seja simples. Algoritmos, concorrência, segurança e sistemas
distribuídos podem conter complexidade essencial. Mesmo nesses casos, a estrutura deve tornar essa
complexidade navegável, isolada e explicável, sem acrescentar dificuldade acidental.

## Aplicação por agentes

Ao planejar, implementar ou revisar, o agente deve:

1. começar pela menor solução coerente com o briefing;
2. explicar a necessidade de cada complexidade relevante introduzida;
3. preferir código e fluxo facilmente verificáveis a construções apenas sofisticadas;
4. tornar assumptions, falhas, efeitos colaterais e limites explícitos;
5. recusar a tentação de completar requisitos ambíguos sem evidência ou decisão humana;
6. apontar quando uma alternativa mais simples atende aos mesmos critérios.
7. revisar se o código comunica sua intenção sem depender de uma explicação extensa do autor.

Simplicidade não significa ignorar robustez, segurança ou requisitos não funcionais. Uma solução simples
é aquela que contém apenas a complexidade essencial do problema, não aquela que omite responsabilidades.
