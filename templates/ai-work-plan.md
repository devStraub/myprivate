# Plano de implementação assistida por IA

> Artefato operacional do ambiente autorizado. Não copiar para Toolbox pessoal, pen drive ou Git pessoal.
> Criar exclusivamente em `<raiz-do-projeto>/.ai-work/plan.md` e remover no encerramento seguro.

## Identificação local

- Sessão: `<identificador local não sensível>`
- Criado em: `<timestamp ISO 8601>`
- Atualizado em: `<timestamp ISO 8601>`
- Agente: `<provider/model ou unknown>`
- Branch/commit inicial: `<quando permitido>`

## Roteamento de agentes

- Complexidade/risco: `<baixo|moderado|alto>`
- Dimensões altas: `<escopo|ambiguidade|impacto|diagnóstico|validação|nenhuma>`
- Agente atual e função: `<nome exibido> / <planner|executor|validator|reviewer|múltiplas>`
- Recomendação de troca: `<nenhuma ou agente/função/motivo>`
- Decisão humana sobre a recomendação: `<aceita|recusada|pending|não aplicável>`
- Passagem de contexto esperada: `<artefato ou resultado que permite retornar ao próximo papel>`

## Descritivo recebido

<Resumo fiel do objetivo, sem acrescentar requisito não informado.>

## Resultado esperado

<Comportamento observável ao final.>

## Critérios de aceite

- [ ] <critério verificável>

## Escopo

### Incluído

- <componente ou comportamento autorizado>

### Fora do escopo

- <item explicitamente excluído>

## Assumptions e perguntas abertas

- Assumption: <suposição que precisa permanecer visível>
- Pergunta: <informação ausente que pode alterar a solução>

## Riscos

| Risco | Impacto | Mitigação | Precisa de decisão humana? |
| --- | --- | --- | --- |
| <risco> | <impacto> | <mitigação> | <sim/não> |

## Arquivos e componentes previstos

| Alvo | Motivo | Backup confirmado? |
| --- | --- | --- |
| <caminho relativo ou categoria> | <por que pode mudar> | <pending/sim/não aplicável> |

## Passos

Use somente `pending`, `in_progress`, `completed` ou `blocked`. Mantenha no máximo um passo principal `in_progress`.

| ID | Status | Passo | Validação | Evidência esperada |
| --- | --- | --- | --- | --- |
| P01 | pending | <ação pequena e verificável> | <teste/comando/revisão> | <resultado observável> |

## Estratégia de backup

- Diretório timestampado: `<local corporativo autorizado>`
- Manifesto: `<caminho>`
- Arquivos preservados: `<quantidade/categorias, sem conteúdo>`
- Verificação de leitura: `<pending/succeeded/failed>`
- Exclusões sensíveis aplicadas: `<sim/não>`

## Estratégia de testes

- Testes existentes relevantes: <lista sanitizada>
- Novos testes previstos: <comportamentos>
- Validação manual: <quando necessária>
- Cenários de falha: <cenários>

## Estratégia de validação e evidências

Não trate configuração, execução, observação e aprovação como equivalentes.

| Item | Configurado? | Executado? | Resultado observado? | Aprovado? | Evidência/responsável |
| --- | --- | --- | --- | --- | --- |
| <teste, gate ou critério> | <sim/não/n.a.> | <sim/não/bloqueado> | <sim/não> | <sim/não/pending> | <referência sanitizada ou responsável> |

- O que foi observado diretamente: <fatos verificáveis>
- O que foi inferido pela IA: <inferências que ainda exigem confirmação>
- O que permanece não verificado: <pendências, ambiente ou gate necessário>

## Análises condicionais

Preencha somente as subseções aplicáveis.

### Migração de plataforma ou runtime

- Matriz de compatibilidade: <runtime, build, dependências gerenciadas, integrações e ferramentas>
- Etapas e critérios de saída: <como cada etapa será considerada concluída>
- Estratégia de reversão entre etapas: <descrição>

### Dependências e segurança de composição

- Tipo do achado: <acionável/inventário/licença/artefato não identificado>
- Origem: <direta/transitiva/gerenciada por BOM ou equivalente>
- Aplicabilidade e correção mínima: <estado da análise>
- Árvore resolvida e novo gate após a mudança: <pending/observado>

### Integração distribuída

- Etapas do fluxo: <preparação, chamada, dependências e resultado>
- Correlação disponível: <sim/não/pending>
- Classificações esperadas: <sucesso/rejeição de contrato/falha de dependência/timeout/falha de implementação>

## Rollback

<Como reverter código, configuração, banco e infraestrutura. Não presuma que o backup de arquivos resolve migrações ou dados.>

## Descobertas e mudanças do plano

| Timestamp | Descoberta | Impacto | Decisão/autoridade |
| --- | --- | --- | --- |
| <timestamp> | <descoberta> | <impacto> | <decisão ou pending> |

## Resultado final

- Critérios atendidos: <sim/parcial/não>
- Testes executados: <resumo>
- Evidências observadas: <resumo>
- Aprovações pendentes e responsáveis: <resumo>
- Limitações: <resumo>
- Riscos residuais: <resumo>
- Draft sanitizado sugerido: <sim/não; nunca anexar artefatos brutos>

## Limpeza dos artefatos operacionais

- [ ] Implementação e validações necessárias concluídas
- [ ] Aceitação necessária obtida ou política de encerramento confirmada
- [ ] Aprendizado relevante convertido em draft novo, abstrato e sanitizado, ou registrado como “nenhum”
- [ ] Caminho absoluto de `.ai-work/` confirmado dentro da raiz deste projeto
- [ ] Diretório conferido para garantir que contém somente artefatos operacionais
- [ ] `.ai-work/` removido por completo
- Limpeza realizada em: <timestamp ou pending>
