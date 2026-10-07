# Colaboração entre especialista técnico e especialista de domínio

## Separação de responsabilidade

| Pergunta | Responsável principal |
| --- | --- |
| O que a regra exige e quando vigora? | especialista de domínio |
| Onde e como o projeto implementa isso? | especialista em desenvolvimento |
| A evidência cobre a regra? | comparação conjunta, com decisão humana |
| Como implementar a correção? | especialista em desenvolvimento + executor |
| A interpretação de negócio está correta? | especialista de domínio + responsável humano |

## Fluxo

```text
briefing
→ especialista de domínio identifica regra, versão e critérios
→ especialista técnico localiza componentes e evidências
→ matriz regra × implementação × teste
→ lacunas e opções
→ decisão humana
→ plano para agente executor
→ validação e revisão
```

## Contrato entre agentes

O especialista de domínio entrega regras identificadas, fonte, vigência, atores, pré-condições, estados,
prazos, efeitos e incertezas. O especialista técnico devolve localização da implementação, evidência,
cobertura, riscos técnicos e perguntas surgidas do código.

Nenhum deles deve preencher lacuna do outro por suposição. Quando regra pública e requisito interno
parecerem conflitantes, registre o conflito sem expor detalhes fora do ambiente autorizado e encaminhe à
decisão humana competente.

## Primeiro domínio registrado

Para Pix, DICT ou MED, use
[`../../pix-dict-med-specialist/SKILL.md`](../../pix-dict-med-specialist/SKILL.md). O catálogo de regras
fornece o “o quê”; este agente investiga o “onde”, “como”, “com que evidência” e “o que falta”.
