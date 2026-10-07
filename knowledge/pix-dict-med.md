---
id: pix-dict-med
title: DICT e MED como domínio operacional do Pix
type: knowledge
status: draft
confidence: medium
created: 2026-10-06
updated: 2026-10-06
last_reviewed: 2026-10-06
domains: [payments, pix, fraud-prevention, distributed-systems]
technologies: [dict-api, mtls, xml-dsig]
tags: [dict, med, pix, funds-recovery, fraud]
origin: [official-documentation, ai-assisted-analysis]
learning_state: not-studied
eligible_as_professional_evidence: false
agents:
  - provider: openai
    model: gpt-5
    role: research
    date: 2026-10-06
    independently_validated: false
sources:
  - bcb-pix-normas
  - bcb-dict-manual-8-5
  - bcb-dict-api-2-12-1
  - bcb-med-guide-4-1
related:
  - ../agents/pix-dict-med-specialist/SKILL.md
  - ../areas/integration.md
  - ../areas/distributed-systems.md
  - ../areas/security.md
visibility: private
---

# DICT e MED como domínio operacional do Pix

## Definição

O DICT é o diretório do arranjo Pix que associa chaves a dados de conta e titular e também suporta
processos operacionais e de segurança. O MED é o conjunto de regras e procedimentos para viabilizar
devolução em situações específicas, principalmente fundada suspeita de fraude e falha operacional.

MED não é chargeback. Desacordo comercial, Pix enviado por engano e transferência para terceiro de
boa-fé estão fora do seu escopo segundo os materiais oficiais consultados.

## Modelo mental

```text
DICT
├── endereçamento: chave → conta/titular
├── ciclo da chave: registro, alteração, exclusão, portabilidade, reivindicação
├── segurança: autenticação, assinatura, antifraude, limites
└── processos: notificações, devoluções, recuperação e eventos

MED / Recuperação de Valores
reclamação → instauração → rastreamento em grafo → priorização
→ bloqueio → análise → devolução/cancelamento → comunicação
```

Não existe um único estado que represente tudo. Estado técnico da chamada, estado do processo no DICT,
decisão sobre fraude, bloqueio de saldo, devolução financeira e comunicação ao usuário são dimensões
relacionadas, mas diferentes.

## Como funciona

O participante consulta o DICT no contexto de um pagamento para resolver a chave e obter dados que
permitam ao pagador confirmar o recebedor. Outros fluxos mantêm vínculos, resolvem portabilidade ou posse,
registram informações de fraude e coordenam devoluções.

Na Recuperação de Valores por fraude, a transação contestada é a raiz de um grafo. O mecanismo pode
rastrear a dispersão do dinheiro para transações subsequentes, priorizar caminhos, solicitar bloqueios e
coordenar análise e devolução entre participantes. A recuperação depende do mérito e da disponibilidade
de recursos; não é garantida.

## Propriedades importantes

- regras dependem do papel do participante e do tipo de acesso ao DICT;
- operações são distribuídas, assíncronas e orientadas por estados/eventos;
- prazos pertencem a etapas e motivos específicos;
- consulta, bloqueio, análise, marcação e devolução não são equivalentes;
- segurança inclui mTLS, assinatura digital, validação de respostas e proteção contra varredura;
- versão publicada e regra vigente podem divergir durante transição normativa;
- eventos possuem janela de consulta, paginação e necessidade de processamento durável.

## Limitações e riscos

Este resumo não é uma especificação de implementação nem parecer de conformidade. Regras mudam com
frequência e podem ter vigência fracionada. Em 2026-10-06, por exemplo, a versão 8.5 do Manual do DICT
estava publicada, mas partes das seções 10.1 e 20.1.5 somente entrariam em vigor em 2026-10-26.

Riscos comuns incluem aplicar versão futura como vigente, representar vários efeitos em um único status,
perder evento por polling incompleto, reprocessar comando financeiro sem idempotência, confundir ausência
de saldo com improcedência e usar estatística antifraude como decisão isolada.

## Dúvidas para consulta futura

- Qual papel e modalidade de acesso se aplicam ao fluxo analisado?
- Qual versão estava vigente na data da transação e da contestação?
- Quais prazos pertencem ao motivo concreto?
- Quais transições e efeitos precisam de reconciliação independente?
- Que mudança oficial ocorreu desde a última revisão semanal?

## Evidências e fontes

A base de fontes, limitações temporais e catálogo inicial de regras estão no
[`agente especialista`](../agents/pix-dict-med-specialist/agent-record.md). A fonte normativa e técnica
deve ser reaberta antes de qualquer conclusão material.

## Histórico de revisão

- 2026-10-06: síntese inicial baseada em fontes oficiais do Banco Central; revisão humana pendente.
