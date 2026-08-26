---
id: curriculum-security-engineering
title: 14 — Security Engineering
type: curriculum-module
status: draft
curriculum_state: planned
created: 2026-08-26
updated: 2026-08-26
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: gpt-5.6-sol
    role: structure
    date: 2026-08-26
sources: []
related: [../curriculum.md, ../learning-methodology.md, ../public-labs.md]
visibility: private
---

# 14 — Security Engineering

## Objetivo

Projetar software considerando identidade, ameaças, criptografia aplicada e cadeia de fornecimento.

## Tópicos alvo

- CIA, authentication, authorization e least privilege;
- defense in depth e zero trust;
- OWASP: injection, XSS, CSRF, SSRF, broken access control e insecure deserialization;
- secrets management;
- sessions, cookies, JWT, OAuth 2 e OpenID Connect;
- RBAC e ABAC;
- hashing, salting e encryption;
- symmetric/asymmetric crypto, signatures, certificates, PKI e TLS;
- threat modeling;
- dependency scanning, SAST, DAST e software supply chain;

## Projeto público sugerido

`lab-application-security`

O nome é sugestão; o requisito é preservar o objetivo pedagógico e a rastreabilidade com este módulo.

## Requisitos mínimos do laboratório

- ameaça/risco está explicitamente modelado;
- inclui exemplos vulneráveis e correções apenas quando seguros para publicação;
- demonstra autenticação/autorização de forma correta;
- inclui gerenciamento seguro de segredos em ambiente de laboratório;
- executa pelo menos uma ferramenta de análise automatizada;
- README diferencia segurança demonstrada de segurança garantida;


## Requisitos pedagógicos

O Codex deve produzir implementação funcional, testes, comentários didáticos, README e `STUDY_GUIDE.md`. O proprietário deve percorrer o código seguindo o fluxo, questionar decisões, executar experimentos relevantes e completar o loop privado de avaliação descrito em [`../learning-methodology.md`](../learning-methodology.md).

Não existe carga horária mínima nem exigência de autoria manual do código.

## Evidência e estado

- material preparado pode ser consultado como parte da trilha;
- `studied` depende da confirmação humana após o ciclo de estudo;
- `applied` exige o laboratório público cobrindo os requisitos;
- `professional` exige evidência profissional distinta e sanitizada;
- score de avaliação não é persistido.

## Referências acadêmicas relacionadas

- Stanford Systems: privacy e security; Theory: cryptography;
- MIT EECS: systems/software foundations;
- CMU systems + theoretical foundations;

Consulte as fontes oficiais e a política de atribuição em [`../academic-references.md`](../academic-references.md).
