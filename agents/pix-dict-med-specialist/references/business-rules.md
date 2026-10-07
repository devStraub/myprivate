# Catálogo inicial de regras de negócio

Este catálogo é um índice rastreável, não uma cópia integral dos manuais. A coluna “decisão” informa o
que a regra ajuda a avaliar. Confirme o texto e a vigência na fonte antes de concluir aderência.

## DICT

| ID | Regra resumida | Fonte/âncora | Decisão apoiada |
| --- | --- | --- | --- |
| `DICT-001` | O DICT resolve uma chave Pix para dados de conta e titular, permitindo confirmação do recebedor e composição da instrução de pagamento. | API DICT, introdução | delimitar responsabilidade do diretório e do pagamento |
| `DICT-002` | Os tipos públicos de chave são CPF, CNPJ, telefone, e-mail e EVP. O formato e as validações devem seguir a versão aplicável; CNPJ alfanumérico entrou na evolução recente. | API DICT; Manual, seção 1 e histórico 8.4 | modelagem, validação e compatibilidade futura |
| `DICT-003` | Criação, alteração e exclusão de vínculo, portabilidade e reivindicação de posse são processos distintos, com atores e estados próprios. | Manual, seções 3 a 7 | impedir que CRUD local substitua o fluxo regulado |
| `DICT-004` | Portabilidade trata a transferência da chave pelo mesmo titular entre participantes; reivindicação de posse trata chave de telefone/e-mail que pertence ao novo possuidor. | Manual, seções 5 e 6 | escolher fluxo e comunicações corretos |
| `DICT-005` | Dados e situação cadastral de CPF/CNPJ e nome precisam observar validações oficiais antes de determinados registros e reivindicações. | Manual, seções 2 a 6 | definir pré-condições e tratamento de divergência |
| `DICT-006` | A comunicação com a API usa mTLS; requisições que incluem ou alteram dados são assinadas e respostas assinadas devem ser validadas. | API DICT, Segurança | arquitetura de identidade, integridade e não repúdio |
| `DICT-007` | Consultas são submetidas a controles anti-varredura e políticas de token bucket; estouro retorna 429. | API DICT, Limitação de requisições | throttling, backoff e capacidade |
| `DICT-008` | Cache de consulta a vínculo somente é válido conforme `Cache-Control`; cliente HTTP normalmente exige configuração explícita. | API DICT, Cache | consistência e redução segura de chamadas |
| `DICT-009` | Consultas de chave associadas a pagamento carregam identidade do participante, pagador e `EndToEndId`, usados também nos controles do serviço. | API DICT, consulta de vínculo | correlação, antifraude e prevenção de consulta avulsa |
| `DICT-010` | Participantes com acesso indireto dependem de participante com acesso direto; os fluxos e responsabilidades de comunicação não são idênticos. | Manual, variantes de cada fluxo | definir fronteira, SLA e evidência entre participantes |
| `DICT-011` | Informações antifraude por chave ou pessoa são sinais históricos, com janelas e categorias; não equivalem sozinhas a uma decisão de fraude. | Manual, seção 18; API `IncludeStatistics` | desenho de motor de risco e explicabilidade |
| `DICT-012` | Operações assíncronas exigem consulta de estados, reconciliação ou consumo de eventos conforme o fluxo; sucesso de envio não prova conclusão de negócio. | Manual, fluxos e seções 9/21 | persistência, polling, idempotência e observabilidade |

## MED e Recuperação de Valores

| ID | Regra resumida | Fonte/âncora | Decisão apoiada |
| --- | --- | --- | --- |
| `MED-001` | O MED facilita devoluções em fundada suspeita de fraude e em falha operacional de participante, conforme fluxos próprios. | Regulamento; FAQ; Guia MED | classificar corretamente a causa |
| `MED-002` | MED não é chargeback e não cobre desacordo comercial, erro do pagador ao enviar Pix ou recursos destinados a terceiro de boa-fé. | Segurança no Pix; FAQ; Guia MED | rejeitar enquadramento indevido sem negar canais cabíveis |
| `MED-003` | A reclamação por fraude pode ser apresentada à instituição do pagador em até 80 dias da transação; agir cedo aumenta chance de recuperar saldo. | FAQ do MED | janela de elegibilidade e UX |
| `MED-004` | Para fraude, a Recuperação de Valores organiza instauração, rastreamento, priorização, bloqueio, análise e devolução. | Manual, seção 20.1 | decompor workflow e ownership |
| `MED-005` | O rastreamento forma um grafo a partir da transação raiz e pode alcançar transações subsequentes segundo parâmetros e priorização. | Manual, seções 20 e 20.1 | modelar relações, profundidade e dispersão |
| `MED-006` | Participantes notificados bloqueiam imediatamente recursos solicitados disponíveis, analisam o contexto e devolvem quando cabível e houver saldo. | Manual, etapas 20.1; FAQ | separar bloqueio, mérito e disponibilidade financeira |
| `MED-007` | Ausência de saldo não elimina a análise; aceitar uma notificação procedente permite continuidade sobre transações posteriores e gera marcação de fraude. | Manual, seção 20.1.5 | evitar encerramento prematuro do caminho |
| `MED-008` | Rejeição pode cancelar notificações subsequentes que perderem conexão com a transação raiz. A mesma transação pode aparecer em recuperações distintas e deve ser analisada no contexto de cada uma. | Manual, seção 20.1.5 | impedir deduplicação semântica incorreta |
| `MED-009` | O MED não garante ressarcimento; resultado pode ser integral, parcial ou inexistente conforme análise e saldo recuperável. | FAQ; Segurança no Pix | comunicação ao usuário e modelagem de resultado |
| `MED-010` | Falha operacional, fraude e erro do PSP pagador em Pix Automático possuem causas, prazos e fluxos diferentes; nem todos exigem notificação de infração prévia. | Manual, seção 17 | roteamento e SLA corretos |
| `MED-011` | Uma Recuperação de Valores pode ser alterada apenas em estados permitidos e pode ser cancelada pelo PSP recuperador; o cancelamento é definitivo para aquela transação e produz compensações/eventos. | Manual, seções 20.1.10 e 20.1.11 | comandos válidos, irreversibilidade e compensação |
| `MED-012` | O endpoint de eventos centraliza ocorrências que exigem ação; retorna janela dos últimos 7 dias, com paginação/cursor. | Manual, seção 21 | polling durável, checkpoint e prevenção de perda |
| `MED-013` | Eventos de Recuperação de Valores incluem análise concluída, informação atualizada, conclusão e cancelamento. | Manual, seção 21; API DICT | máquina de estados e reprocessamento |
| `MED-014` | Marcação de fraude, devolução financeira e encerramento da recuperação são efeitos relacionados, mas não equivalentes. | Manual, seções 10, 17 e 20 | evitar um único status agregado enganoso |
| `MED-015` | Prazos devem ser associados a etapa, motivo e versão da regra; um “prazo do MED” genérico é insuficiente. | Manual; Guia MED; FAQ | timers, alertas e testes de SLA |

## Invariantes de engenharia derivados

Os itens abaixo são **inferências técnicas**, não texto normativo:

- comandos financeiros e transições externas precisam de idempotência e correlação persistente;
- estado local deve distinguir aceitação técnica, estado no DICT, decisão de mérito e liquidação financeira;
- consumidores de eventos precisam persistir cursor/checkpoint e tolerar repetição;
- cronômetros precisam registrar regra e versão que originaram o prazo;
- enumerações e parsers devem tolerar extensões compatíveis previstas pela API;
- auditoria precisa conservar causa, ator, instante, identificadores regulatórios e evidência da decisão,
  respeitando minimização e retenção autorizadas;
- dashboards devem mostrar fila parada por etapa, não somente erro HTTP ou volume total.

Essas inferências devem ser testadas contra arquitetura, requisitos internos e política da organização.
