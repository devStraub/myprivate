# Auditoria de fluxos DICT e MED

Use este procedimento para levantar o que existe, o que não foi comprovado e o que precisa de melhoria.
O relatório detalhado pertence ao projeto profissional, em `.ai-work/`, e não à Toolbox.

## 1. Fixar o recorte

Registre no plano local:

- data de referência da regra;
- papel do participante: pagador, recebedor, recuperador, direto, indireto, responsável ou liquidante;
- fluxos em escopo e motivos tratados;
- versões de manual e API esperadas;
- ambientes e evidências autorizados;
- itens fora do escopo.

Sem esses dados, a conclusão máxima é exploratória.

## 2. Inventariar o fluxo implementado

Para cada fluxo, procure evidência de:

```text
gatilho → validação → comando externo → resposta técnica
→ persistência → transição de estado → evento/polling
→ ação financeira → comunicação → reconciliação → encerramento
```

Mapeie handlers, clientes, schemas, estados, jobs, filas, tabelas, timers, feature flags, logs, métricas,
testes, runbooks e processos manuais. Não copie esses artefatos para a Toolbox.

## 3. Montar a matriz

| Regra ID | Aplicabilidade | Evidência primária | Evidência de teste/operação | Avaliação | Confiança | Lacuna | Ação candidata |
| --- | --- | --- | --- | --- | --- | --- | --- |

Avaliações permitidas:

- `aderente`: evidência cobre regra e resultado;
- `parcial`: parte do comportamento ou dos caminhos está coberta;
- `divergente`: evidência contradiz a regra aplicável;
- `não implementado`: ausência confirmada após busca suficiente;
- `não comprovado`: não há evidência suficiente;
- `não aplicável`: justificativa de papel/fluxo registrada;
- `regra em transição`: implementação depende de marco de vigência.

## 4. Revisar a máquina de estados

Para cada estado externo e local, confirme:

- evento ou comando de entrada;
- pré-condições e ator autorizado;
- transições válidas, terminalidade e reversibilidade;
- efeitos financeiros e compensações;
- timeout, retry e caminho manual;
- duplicidade, ordem invertida e entrega tardia;
- evidência de correlação e reconciliação;
- comunicação obrigatória ao usuário ou a outro participante.

Um enum com nomes semelhantes aos do DICT é somente indício, não evidência de aderência.

## 5. Classificar lacunas

- **regra ausente:** fluxo obrigatório confirmado não existe;
- **cobertura parcial:** happy path existe, exceção relevante não;
- **semântica incorreta:** mesmo dado representa efeitos diferentes;
- **temporal:** prazo, vigência, expiração ou ordem estão errados;
- **integração:** contrato, assinatura, mTLS, rate limit, polling ou evento está incompleto;
- **consistência:** persistência, idempotência, retry ou reconciliação insuficiente;
- **observabilidade:** não é possível demonstrar etapa, causa ou resultado;
- **operação:** depende de processo manual não documentado/testado;
- **evidência:** implementação pode existir, mas não foi comprovada.

## 6. Priorizar

Considere impacto regulatório, efeito financeiro, segurança, perda de prazo, volume potencial, capacidade
de detecção, recuperação e proximidade da vigência. Não use automaticamente severidade alta para toda
diferença documental.

## 7. Entrega segura

O relatório local deve conter fontes e evidências suficientes para revisão da equipe. Para aprendizado
pessoal, gere apenas uma síntese genérica, por exemplo: “fluxos assíncronos regulados precisam separar
estado técnico, decisão de mérito e efeito financeiro”. Não registre nomes, topologia, lacunas exploráveis,
regras proprietárias ou detalhes capazes de identificar o sistema.
