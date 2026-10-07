# Atualização periódica da base DICT/MED

Cadência pretendida: semanal, executada **manualmente quando o proprietário solicitar ao agente**. Não há
agendamento automático. Uma execução sem mudança deve apenas registrar a data da consulta; não reescrever
arquivos nem criar ruído.

## Fontes a verificar

1. página oficial de Normas sobre o Pix;
2. busca de normas por Pix, DICT, MED e Recuperação de Valores;
3. Manual Operacional do DICT e seu histórico de versões;
4. documentação online/OpenAPI da API do DICT;
5. Guia de implementação do MED;
6. páginas oficiais de segurança e FAQ;
7. versões futuras, somente para análise de impacto.

## Comparação mínima

- versão e data de publicação;
- ato que divulga, altera ou revoga;
- data de entrada em vigor por seção;
- endpoint, schema, enum, evento, estado ou prazo alterado;
- responsabilidade de participante direto/indireto;
- impacto em regra catalogada, auditoria, teste, operação e comunicação;
- necessidade de preparação antes da vigência.

## Saída

Se não houver mudança material, acrescente ao histórico uma linha curta de consulta sem alteração. Se
houver:

1. registre a fonte nova em `source-baseline.md`;
2. acrescente evento em `change-history.md`, sem apagar a regra anterior;
3. marque regras afetadas e datas de vigência;
4. mude o agente para `review-required` enquanto a base estiver inconsistente;
5. prepare o diff e a análise de impacto;
6. solicite revisão humana antes de voltar a `active`;
7. registre aprendizagem apenas se o proprietário realmente revisar/compreender a mudança.

## Perguntas de controle

- A publicação já está vigente ou é futura?
- A mudança substitui uma versão ou só uma seção?
- Existe período em que versões convivem?
- A API publicada corresponde ao manual vigente?
- Há mudança compatível que quebra enumeração fechada ou regra local?
- O fluxo auditado usa a data da transação, da contestação ou da análise?
- A fonte é normativa, técnica ou apenas explicativa?

## Modo manual adotado

Quando o proprietário pedir a atualização, o agente deve pesquisar naquele momento, mostrar mudanças e
impactos e preparar o diff. Não criar lembrete ou automação sem nova solicitação explícita. A execução
manual também não promove status nem altera experiência profissional sem revisão humana.
