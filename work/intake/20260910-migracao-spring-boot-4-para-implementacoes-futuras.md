---
id: migracao-spring-boot-4-implementacoes-futuras
title: Checklist generalizavel para migracao Spring Boot 4
type: work-learning-proposal
status: draft
confidence: medium
created: 2026-09-10
updated: 2026-09-10
last_reviewed:
domains: [java, spring, dependency-management, build, testing, security]
technologies: [Java, Spring Boot, Spring Framework, Maven, Tomcat]
tags: [spring-boot-4, spring-framework-7, java-21, migration, maven, mend]
origin: [professional-experience, ai-assisted-analysis]
learning_state: not-studied
eligible_as_professional_evidence: false
capture_id: 20260910-migracao-spring-boot-4-p1
captured_at: 2026-09-10T17:13:00Z
review_state: pending
reviewed_at:
consolidated_into: []
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: analysis-and-drafting
    date: 2026-09-10
    independently_validated: false
sources: []
related: [20260902-semantica-atualizacao-parcial.md]
visibility: private
sanitization:
  level: generalized
  reviewed_on:
  reviewed_by:
  reidentification_risk: low
  approved: false
---

# Aprendizado: migracao para Spring Boot 4

## Apanhado geral

Migracoes de Spring Boot 3 para Spring Boot 4 devem ser tratadas como uma migracao de
plataforma, e nao apenas como uma troca de versao no `pom.xml`. O trabalho envolve alinhar
Java, Spring Framework, container Servlet, Spring Cloud, starters, bibliotecas de integracao,
configuracoes, pipelines e ferramentas de seguranca.

O caminho mais seguro e separar a migracao em etapas pequenas, manter uma matriz de
compatibilidade e validar cada camada antes de prosseguir. Uma aplicacao pode compilar e ainda
falhar no startup, na resolucao de dependencias, na comunicacao com sistemas externos ou em
cenarios funcionais.

## Checklist de planejamento

1. Registrar a baseline: versoes atuais, JDK, parent Maven, BOMs, plugins, testes, empacotamento
   e comportamento de startup.
2. Definir a combinacao alvo de Spring Boot, Spring Framework, Java e container Servlet.
3. Confirmar que as versoes alvo existem nos repositorios corporativos antes de editar o POM.
4. Mapear dependencias diretamente declaradas e transitivas, incluindo starters, clientes HTTP,
   Kafka, MongoDB, observabilidade e bibliotecas internas.
5. Definir criterios de aceite para compilacao, testes, startup, endpoints, contratos e pipeline.

## Regras de alinhamento de dependencias

- Preferir as versoes gerenciadas pelo parent e pelos BOMs do Spring Boot.
- Remover overrides antigos que pertenciam a outra linha do Boot, especialmente de Tomcat,
  Spring Framework, Spring Data, Kafka e Reactor.
- Quando um override for indispensavel, documentar a razao, verificar a compatibilidade e
  rastrear a dependencia que introduziu o artefato.
- Usar o starter correspondente ao Boot alvo; por exemplo, uma mudanca de suporte AOP pode
  exigir a troca do starter, e nao somente a alteracao de uma versao.
- Atualizar o modulo do Resilience4j para a linha compatível com o Boot utilizado.
- Evitar declarar simultaneamente versoes conflitantes da mesma familia sem necessidade.

## Pontos de codigo e configuracao

- Procurar imports e APIs `javax.*` remanescentes quando a plataforma exigir `jakarta.*`.
- Revisar configuracoes removidas ou alteradas, como propriedades legadas de MVC e binding.
- Verificar Spring MVC, Jackson, validacao, Feign, Kafka, MongoDB, DB2, observabilidade e
  autenticacao separadamente.
- Revisar contratos de serializacao e desserializacao, principalmente DTOs, erros e objetos
  aninhados.
- Validar o container Servlet efetivamente resolvido; misturar linhas incompatíveis de Tomcat
  pode permitir compilacao e falhar somente no runtime.
- Nao inserir tokens, credenciais, URIs sensiveis ou valores default perigosos em arquivos locais,
  drafts, logs ou relatorios.

## Estrategia de validacao

Executar, nesta ordem, sempre que o ambiente permitir:

1. Validacao estrutural do POM e resolucao da arvore Maven.
2. Compilacao com o JDK alvo.
3. Testes unitarios e de integracao.
4. Empacotamento e verificacao do conteudo do artefato.
5. Smoke test de startup, health checks, OpenAPI, autenticacao e endpoints principais.
6. Testes com dependencias externas disponiveis, distinguindo falhas do ambiente de falhas da
   aplicacao.
7. Execucao do Mend e revisao dos achados contra a arvore efetivamente empacotada.

O JDK que compila deve ser o mesmo, ou compativel, com o JDK usado para executar os testes.
Uma falha de class version pode mascarar o resultado real da suite e nao deve ser diagnosticada
como regressao do Spring sem confirmar o ambiente.

## Como tratar achados Mend

- Identificar se a vulnerabilidade e direta ou transitiva.
- Confirmar o artefato e a versao na arvore Maven e no pacote final.
- Preferir upgrade da dependencia de origem; usar override explicito somente quando houver
  compatibilidade comprovada e o parent ainda nao fornecer a correcao.
- Reexecutar a arvore, testes e Mend apos cada ajuste relevante.
- Registrar quando o finding depender de uma funcionalidade nao utilizada, sem considerar isso
  uma substituicao automatica para a atualizacao.
- Nao copiar tokens ou identificadores do relatorio para documentacao de aprendizado.

## Falhas que exigem diagnostico separado

- Falha de compilacao: investigar API removida, namespace, starter ou incompatibilidade de
  biblioteca.
- Falha de resolucao Maven: investigar repositorio corporativo, BOM, versao e metadados.
- Falha de startup: separar wiring da aplicacao, configuracao ausente e indisponibilidade de
  banco ou servico externo.
- Falha funcional: confirmar se a requisicao chegou ao endpoint antes de atribuir a causa ao
  framework.
- Falha Mend: confirmar a dependencia realmente empacotada antes de editar o POM.

## Evidencia e limites

Observado no trabalho de referencia: alinhamento de parent, BOMs, starters, Java e Tomcat foi
necessario para a migracao; a remocao de overrides antigos reduziu a mistura de plataformas; e
achados Mend posteriores puderam ser tratados identificando uma dependencia transitiva e
sobrescrevendo-a de forma explicita.

Inferido como pratica geral: manter uma matriz de compatibilidade e executar gates por camada
reduz o risco de confundir problemas de ambiente com regressao de framework.

Nao verificado universalmente: compatibilidade de cada biblioteca corporativa, disponibilidade
das versoes no repositorio privado e impacto de todos os modos opcionais do Spring.

## Checklist reutilizavel

- [ ] Baseline registrada e reproduzivel.
- [ ] JDK alvo confirmado no build, testes e pipeline.
- [ ] Parent e BOMs alinhados.
- [ ] Overrides antigos revisados e justificados.
- [ ] Container Servlet na linha suportada pelo Boot.
- [ ] Imports, starters e propriedades legadas revisados.
- [ ] Dependencias internas e integrações testadas.
- [ ] Startup e smoke tests executados com ambiente disponivel.
- [ ] Arvore Maven e artefato final revisados.
- [ ] Mend executado novamente sem dados sensiveis nos registros.
- [ ] Backups criados antes de editar arquivos existentes.

## Revisao de sanitizacao

- Informacoes removidas: nomes de organizacao, repositorios, tickets, endpoints, caminhos locais,
  tokens, credenciais, identificadores, logs e dados de ambiente.
- Nivel: generalized.
- Risco residual de reidentificacao: baixo.

## Aprovacao humana

- Decisao: pending
- Responsavel:
- Data:
- Observacoes:
