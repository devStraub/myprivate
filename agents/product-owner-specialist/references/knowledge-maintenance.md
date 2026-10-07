# Manutenção do conhecimento do projeto

## Quando atualizar

- após implementação aceita que altere capacidade, fluxo, contrato ou operação;
- após descoberta que corrija uma informação anterior;
- após atualização manual de regra externa;
- quando uma pergunta revelar cobertura insuficiente;
- quando evidência ficar desatualizada em relação ao código analisado.

## Procedimento

1. identificar documentos e relações afetados;
2. comparar estado anterior com evidência nova;
3. atualizar `verified_at`, escopo, confiança e estado;
4. preservar histórico da mudança e sua origem;
5. marcar fluxos dependentes que precisam de revisão;
6. registrar lacunas ou dúvidas sem transformá-las em fatos;
7. solicitar validação humana quando houver interpretação ou prioridade.

## Consistência

Uma alteração de serviço pode invalidar capacidades e fluxos relacionados. Uma alteração regulatória pode
invalidar regras, gaps e critérios. O índice deve permitir localizar essas relações e evitar páginas
isoladas que aparentem atualidade.

## Limpeza e retenção

A base persistente não é `.ai-work/` e não deve ser apagada ao final de cada demanda. Planos, backups,
telemetria e relatórios temporários continuam em `.ai-work/` e seguem sua limpeza normal. A retenção da
base persistente deve cumprir a política da organização.
