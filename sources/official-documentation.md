---
id: sources-official-documentation
title: Documentação oficial e especificações
type: source-index
status: draft
created: 2026-08-23
updated: 2026-10-06
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: unknown
    role: structure
    date: 2026-08-23
sources: []
related: [README.md, ../templates/source.md]
visibility: private
---

# Documentação oficial e especificações

## Uso de agentes e automação de trabalho

| Fonte | Organização | Consultada em | Escopo sustentado | Limitações |
| --- | --- | --- | --- | --- |
| [Custom instructions support](https://docs.github.com/en/copilot/reference/custom-instructions-support) | GitHub | 2026-09-02 | Compatibilidade de instruções, prompts e `AGENTS.md` entre interfaces do Copilot | Suporte pode mudar por produto e versão |
| [Customizing Copilot responses](https://docs.github.com/en/copilot/concepts/prompting/response-customization) | GitHub | 2026-09-02 | Separação entre instruções gerais, específicas por caminho e prompts reutilizáveis | O agente não segue instruções de forma determinística |
| [Ignoring files](https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files) | GitHub | 2026-09-02 | Exclusão local por `.git/info/exclude` sem alterar `.gitignore` compartilhado | Aplica-se ao clone local |
| [Semantic conventions](https://opentelemetry.io/docs/concepts/semantic-conventions/) | OpenTelemetry | 2026-09-02 | Vocabulário estável e atributos consistentes para telemetria | A Toolbox adota apenas princípios, não o padrão completo |
| [Secure Software Development Framework](https://csrc.nist.gov/projects/ssdf) | NIST | 2026-09-02 | Validação, segurança de desenvolvimento e linguagem comum para evidências | Deve ser adaptado ao processo da organização |
| [Gitleaks](https://github.com/gitleaks/gitleaks) | Projeto Gitleaks | 2026-09-02 | Verificação opcional de segredos em arquivos e repositórios | Não detecta toda informação corporativa ou reidentificável |

## Princípios de engenharia

| Fonte | Organização | Consultada em | Escopo sustentado | Limitações |
| --- | --- | --- | --- | --- |
| [PEP 20 — The Zen of Python](https://peps.python.org/pep-0020/) | Python Software Foundation | 2026-09-03 | Inspiração para simplicidade, explicitude, legibilidade e tratamento de ambiguidade | A Toolbox generaliza os princípios para além de Python; não os trata como regras absolutas |

## Pix, DICT e MED

| ID | Fonte | Organização | Versão/estado | Consultada em | Escopo sustentado | Limitações |
| --- | --- | --- | --- | --- | --- | --- |
| `bcb-pix-normas` | [Normas sobre o Pix](https://www.bcb.gov.br/estabilidadefinanceira/pix-normas) | Banco Central do Brasil | página corrente | 2026-10-06 | índice de regulamento, manuais e instruções | precisa ser reconsultada porque evolui |
| `bcb-dict-manual-8-5` | [Manual Operacional do DICT](https://www.bcb.gov.br/content/estabilidadefinanceira/pix/Regulamento_Pix/X_ManualOperacionaldoDICT.pdf) | Banco Central do Brasil | 8.5 | 2026-10-06 | fluxos DICT, devolução, Recuperação de Valores e eventos | vigência fracionada por seção |
| `bcb-dict-api-2-12-1` | [API do DICT](https://www.bcb.gov.br/content/estabilidadefinanceira/pix/API-DICT.html) | Banco Central do Brasil | 2.12.1 | 2026-10-06 | contrato, schemas, autenticação, assinatura e rate limits | documentação online mutável |
| `bcb-med-guide-4-1` | [Guia de implementação do MED](https://www.bcb.gov.br/content/estabilidadefinanceira/pix/Guia_MED.pdf) | Banco Central do Brasil | 4.1 | 2026-10-06 | orientação operacional do MED | não substitui regulamento/manual |
| `bcb-med-faq` | [FAQ do MED](https://www.bcb.gov.br/meubc/faqs/p/o-que-e-e-como-funciona-o-mecanismo-especial-de-devolucao-med) | Banco Central do Brasil | atualizado em 2026-09-18 na consulta | 2026-10-06 | visão do usuário, prazo e não escopo | resumo, não contrato completo |

Ao adicionar, informe produto/especificação, versão, organização responsável, publicação ou atualização conhecida, data de consulta, escopo sustentado e limitações. “Oficial” não garante aplicabilidade à versão ou ao contexto analisado.
