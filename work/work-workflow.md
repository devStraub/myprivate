---
id: work-workflow
title: Workflow de trabalho
type: workflow
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
related: [../VALIDATION.md, ../governance/sanitization.md, ../templates/work-learning.md]
visibility: private
---

# Workflow de trabalho

```text
Receber demanda → Entender problema → Consultar Toolbox
→ Agente investiga → Usuário dirige investigação → Solução proposta
→ Validação adversarial → Implementação → Testes/evidências
→ Usuário valida resultado → Demanda concluída → Existe aprendizado?
→ Generalizar → Sanitizar → Relacionar → Propor alteração
→ Usuário aprova/rejeita → Commit
```

## Durante a demanda

1. Receba um descritivo explícito da implementação e transforme-o em `plan.md` antes de alterar arquivos.
2. Prepare backup recuperável e telemetria operacional conforme [`ai-assisted-development.md`](ai-assisted-development.md).
3. Entenda objetivo, esperado versus observado, restrições e evidências disponíveis.
4. Consulte somente áreas, stacks, playbooks e documentos relevantes.
5. Registre assumptions; não transforme contexto corporativo em conteúdo da Toolbox.
6. Deixe o agente investigar e propor, mantendo direção e responsabilidade humanas.
7. Aplique [`../VALIDATION.md`](../VALIDATION.md) antes da implementação e novamente sobre os resultados.
8. Preserve plano, backups, telemetria e evidências brutas no sistema autorizado de trabalho, não na Toolbox pessoal.

## Ao concluir

Pergunte:

- aprendemos algo ou reforçamos conhecimento existente?
- encontramos exceção, contradição ou hipótese errada?
- a IA cometeu erro instrutivo ou propôs solução plausível rejeitada?
- apareceu pattern ou necessidade de rever decisão?
- há duplicação a evitar?
- algum checklist ou playbook pode melhorar?
- surgiu um tema relevante que ainda não foi estudado e deveria ser proposto para scouting/backlog?

“Não houve aprendizado reutilizável” é uma conclusão válida.

## Extração segura

1. Identifique somente a lição.
2. Abstraia antes de escrever em mídia pessoal.
3. Generalize e aplique [`../governance/sanitization.md`](../governance/sanitization.md).
4. Pesquise conteúdo existente.
5. Prepare uma proposta com [`../templates/work-learning.md`](../templates/work-learning.md).
6. Mantenha itens de intake como `draft`; não os trate como conhecimento incorporado.
7. Apresente diff, proveniência permitida, incertezas e risco de reidentificação.
8. Aguarde aprovação humana. Somente então atualize conteúdo canônico e faça commit.

Quando a captura ocorrer em dispositivo sem Git, encerre em `work/intake` com `review_state: pending`. Não edite conteúdo canônico nem espere acesso a histórico. A consolidação e o commit ocorrerão posteriormente na máquina principal conforme [`../governance/portable-capture.md`](../governance/portable-capture.md).

## Tema ainda não estudado

Material de [`../study/scouting/`](../study/scouting/README.md) pode apoiar uma demanda antes do estudo formal, desde que o agente declare a origem, a confiança e `learning_state: not-studied`, consulte fontes atuais quando necessário e aplique validação adversarial. Resolver a demanda não converte o tema em competência adquirida.

Se o caso revelar uma lacuna, proponha: case sanitizado → tema generalizado → scouting solicitado → fontes → item de backlog → estudo posterior. Nenhuma etapa deve incorporar contexto corporativo ou ocorrer silenciosamente.

## Limite de autoridade

A autorização para resolver a demanda não autoriza extrair dados, publicar conteúdo, promover status ou consolidar conhecimento silenciosamente.
