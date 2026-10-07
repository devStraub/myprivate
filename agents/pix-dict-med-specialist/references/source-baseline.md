# Base oficial de fontes

Consultada em **2026-10-06**. Sempre revalide a versão e a vigência antes de usar esta base em decisão
material.

| ID | Fonte oficial | Versão/estado consultado | Sustenta | Limitação temporal |
| --- | --- | --- | --- | --- |
| `bcb-pix-normas` | [Normas sobre o Pix](https://www.bcb.gov.br/estabilidadefinanceira/pix-normas) | página corrente | índice oficial de regulamento, manuais e instruções | conteúdo evolui continuamente |
| `bcb-dict-manual-8-5` | [Manual Operacional do DICT](https://www.bcb.gov.br/content/estabilidadefinanceira/pix/Regulamento_Pix/X_ManualOperacionaldoDICT.pdf) | 8.5 | fluxos operacionais do DICT, devolução, Recuperação de Valores e eventos | partes possuem vigências distintas |
| `bcb-in-766-2026` | [IN BCB 766/2026](https://www.bcb.gov.br/estabilidadefinanceira/exibenormativo?numero=766&tipo=Instru%C3%A7%C3%A3o+Normativa+BCB) | vigente, alterada pela IN 767/2026 | publicação e cronograma da versão 8.5 | em 2026-10-06, alterações das seções 10.1 e 20.1.5 entram em vigor somente em 2026-10-26 |
| `bcb-dict-api-2-12-1` | [API do DICT](https://www.bcb.gov.br/content/estabilidadefinanceira/pix/API-DICT.html) | 2.12.1 | contrato OpenAPI, segurança, limites, recursos, schemas e evolução compatível | a documentação online pode ser atualizada sem alterar este arquivo |
| `bcb-med-guide-4-1` | [Guia de implementação do MED](https://www.bcb.gov.br/content/estabilidadefinanceira/pix/Guia_MED.pdf) | 4.1 | orientação operacional e exemplos do MED | guia auxilia; regulamento e manual prevalecem |
| `bcb-med-faq` | [FAQ do MED](https://www.bcb.gov.br/meubc/faqs/p/o-que-e-e-como-funciona-o-mecanismo-especial-de-devolucao-med) | atualizado em 2026-09-18 na consulta | visão atual para usuários, prazo de reclamação e fluxo resumido | não contém todo o contrato entre participantes |
| `bcb-pix-seguranca` | [Segurança no Pix](https://www.bcb.gov.br/estabilidadefinanceira/pix-seguranca) | página corrente | escopo e não escopo do MED, recomendações e marcações | material explicativo, não substitui norma |
| `bcb-pix-regulamento` | [Regulamento do Pix](https://www.bcb.gov.br/estabilidadefinanceira/pix-normas) | versão apontada pelo índice oficial | deveres gerais dos participantes e fundamento dos manuais | conferir ato consolidado e vigência na análise concreta |

## Ordem de autoridade para análise

1. ato normativo e Regulamento do Pix aplicáveis à data;
2. manual que integra o regulamento e respectiva vigência;
3. especificação oficial da API e catálogos técnicos;
4. guia de implementação;
5. FAQ, páginas explicativas e notícias.

Uma fonte posterior não revoga automaticamente outra. Confirme norma vinculada, versão substituída,
data de publicação e data de entrada em vigor.

## Alerta de transição em 2026-10-06

A versão 8.5 do Manual Operacional foi divulgada pela IN BCB 766/2026. A IN BCB 767/2026 alterou o
cronograma: mudanças nas seções 20.1.1, 20.1.9 e 20.2 entraram em vigor em 2026-09-01; mudanças nas
seções 10.1 e 20.1.5 e a revogação da IN BCB 752/2026 foram adiadas para 2026-10-26. Uma auditoria
realizada antes dessa data deve marcar essas regras como `regra em transição` e comparar o texto vigente.

Arquivos em diretórios de “versões futuras” servem para preparação e análise de impacto, não para declarar
o comportamento atualmente obrigatório.
