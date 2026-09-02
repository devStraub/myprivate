---
id: portable-capture-policy
title: Captura portátil e consolidação sob demanda
type: policy
status: draft
created: 2026-08-23
updated: 2026-09-02
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: unknown
    role: structure
    date: 2026-08-23
sources: []
related: [README.md, sanitization.md, knowledge-lifecycle.md, ../work/intake/README.md, ../study/README.md]
visibility: private
---

# Captura portátil e consolidação sob demanda

Permite usar uma cópia da Toolbox em mídia removível e acumular propostas em outro dispositivo sem Git. Não existe periodicidade obrigatória: a consolidação ocorre quando o proprietário solicitar e pode abranger parte ou todo o material pendente.

## Princípios

- A cópia portátil parte de uma versão consolidada da Toolbox.
- O dispositivo externo opera em modo **append-only**: cria capturas novas, sem editar ou apagar documentos consolidados.
- Uma correção de captura é um novo arquivo relacionado ao anterior; não reescreve silenciosamente o original.
- Todo conteúdo profissional é abstraído e sanitizado antes da primeira gravação na mídia pessoal.
- `plan.md`, backups, diffs, logs e telemetria operacional bruta nunca são copiados para a mídia portátil.
- Captura não é incorporação: itens permanecem `draft`, `review_state: pending` e inelegíveis como evidência até revisão.
- Git é necessário somente na máquina de consolidação; a captura externa não depende dele.

## Onde capturar

- [`../work/intake/`](../work/intake/README.md): aprendizado profissional já sanitizado.
- [`../study/sessions/`](../study/sessions/README.md): estudo realmente realizado.
- [`../study/scouting/`](../study/scouting/README.md): material descoberto por agentes.
- [`../study/backlog/`](../study/backlog/README.md): assunto proposto para estudo.

Não crie uma caixa de entrada genérica. O tipo correto preserva significado e permite localizar pendências por metadados.

## Metadados de captura

```yaml
capture_id: YYYYMMDD-HHMMSS-tema-sufixo
captured_at: YYYY-MM-DDTHH:MM:SSZ
review_state: pending
reviewed_at:
consolidated_into: []
```

`capture_id` é imutável, único e seguro para nomes de arquivo do Windows; o sufixo reduz colisões entre dispositivos. Não inclua empresa, cliente, projeto, hostname, usuário corporativo ou identificador de demanda. `captured_at` usa ISO 8601 com offset ou UTC quando conhecido; não invente precisão.

Estados de revisão:

- `pending`: ainda não triado;
- `deferred`: revisado, mas aguardando evidência ou decisão;
- `approved`: aprovado para a consolidação proposta;
- `rejected`: não será incorporado; preserve o motivo conforme decisão humana;
- `consolidated`: conteúdo aprovado incorporado e relacionado em `consolidated_into`.

Esses estados não substituem `status`, `backlog_status` ou `learning_state`.

## Operação no dispositivo externo

1. Leia [`../AGENTS.md`](../AGENTS.md), [`../PRINCIPLES.md`](../PRINCIPLES.md) e [`sanitization.md`](sanitization.md).
2. Consulte documentos consolidados sem modificá-los.
3. Crie um arquivo novo a partir do template apropriado.
4. Registre agente/modelo, origem, data, incertezas e relações permitidas.
5. Mantenha `review_state: pending` e não promova status, perfil ou conhecimento.
6. Se a sanitização não for segura, não grave a captura.

## Retorno à máquina de consolidação

1. Não substitua a base local inteira pela cópia portátil.
2. Identifique arquivos com `review_state: pending` ou `deferred`.
3. Importe somente capturas cujo `capture_id` ainda não exista localmente.
4. Se o mesmo `capture_id` tiver conteúdo diferente, interrompa a importação e solicite decisão humana; não sobrescreva.
5. Valide sanitização antes de adicionar a captura ao repositório local.
6. Classifique cada item como consolidar, mesclar, transformar em case/backlog, adiar, disputar ou rejeitar.
7. Apresente uma proposta com arquivos de destino, evidências, riscos e conteúdo descartável.
8. Aplique somente as decisões humanas aprovadas.
9. Atualize `review_state`, `reviewed_at` e `consolidated_into` conforme o resultado.
10. Faça commits locais pequenos após a revisão e atualize o pen drive com a nova versão consolidada quando solicitado.

## Regras de cópia

- Nunca faça sincronização bidirecional cega ou sobrescrita recursiva.
- Compare por `capture_id`, não apenas por nome ou data do sistema de arquivos.
- Um arquivo idêntico já importado pode ser ignorado; divergências exigem revisão.
- A atualização da cópia portátil ocorre depois de preservar ou importar todas as pendências.
- Remoção de arquivos do pen drive ou descarte de capturas exige decisão explícita quando puder causar perda.

## Revisão sob demanda

A revisão não depende de semana, mês ou quantidade mínima. O proprietário define escopo e momento, podendo consolidar um item e manter outros pendentes. A manutenção deve sinalizar pendências antigas sem descartá-las ou promovê-las automaticamente.
