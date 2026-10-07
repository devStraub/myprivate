# Validação de implementação

Use junto de [`../../../VALIDATION.md`](../../../VALIDATION.md) e
[`../../../checklists/ai-assisted-change.md`](../../../checklists/ai-assisted-change.md).

## Comparação principal

```text
briefing e regras aplicáveis
→ critérios observáveis
→ caminhos implementados
→ testes executados
→ resultado observado
→ lacunas e riscos residuais
```

## Revisar por camada

- **comportamento:** resultado nominal, limites, erro e fora de escopo;
- **contrato:** campos, semântica, compatibilidade, versionamento e validação;
- **estado:** pré-condições, transições, terminalidade, duplicidade e concorrência;
- **dados:** transação, consistência, migração, retenção e privacidade;
- **integração:** timeout, retry, idempotência, rate limit, autenticação e falha parcial;
- **operação:** logs úteis, métricas, tracing, alertas, recuperação e rollback;
- **testes:** unidade, integração, contrato e sistema no nível proporcional ao risco;
- **manutenção:** intenção legível, responsabilidades delimitadas e complexidade justificada.

## Classificação

| Avaliação | Critério |
| --- | --- |
| `atendido` | comportamento e evidência cobrem o critério delimitado |
| `parcial` | há implementação, mas caminhos ou evidências relevantes faltam |
| `divergente` | implementação contradiz requisito ou regra aplicável |
| `não implementado` | ausência confirmada após investigação suficiente |
| `não comprovado` | material disponível não permite concluir |
| `não aplicável` | justificativa explícita e revisável |

## Resultado da revisão

Priorize achados por impacto, probabilidade, detectabilidade e recuperação. Para cada um, cite evidência,
efeito possível, correção mínima e validação esperada. Separe bloqueadores de melhorias opcionais.
