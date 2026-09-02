---
id: ai-assisted-development-workflow
title: Desenvolvimento profissional assistido por IA
type: workflow
status: draft
created: 2026-09-02
updated: 2026-09-02
origin: [ai-assisted-analysis]
agents:
  - provider: openai
    model: unknown
    role: structure
    date: 2026-09-02
sources: []
related:
  - work-workflow.md
  - ../governance/sanitization.md
  - ../governance/portable-capture.md
  - ../checklists/ai-assisted-change.md
visibility: private
---

# Desenvolvimento profissional assistido por IA

## Objetivo

Orientar Copilot e outros agentes durante implementações profissionais com planejamento explícito,
recuperação local, rastreabilidade proporcional e geração segura de drafts para revisão posterior.

## Separação obrigatória

```text
AMBIENTE CORPORATIVO AUTORIZADO
briefing + plan.md + backups + telemetria + código + testes
                    |
                    | abstrair e sanitizar; nunca copiar
                    v
TOOLBOX PESSOAL / PEN DRIVE
draft generalizado em work/intake, review_state: pending
```

Backups, plano, diff e telemetria bruta podem conter propriedade da empresa. Permanecem apenas na
máquina e no armazenamento autorizados pela organização, conforme suas políticas de retenção.

## Fluxo obrigatório

### 1. Receber o briefing

O agente só inicia planejamento após receber um descritivo da implementação. Se faltar informação,
deve registrar perguntas e assumptions no plano, sem inventar regra de negócio.

O briefing deve esclarecer, quando disponível:

- problema e resultado esperado;
- comportamento atual versus desejado;
- critérios de aceite;
- escopo e itens explicitamente fora do escopo;
- restrições técnicas, segurança e compatibilidade;
- testes e evidências esperados;
- arquivos, serviços ou componentes autorizados;
- riscos e necessidade de rollback.

### 2. Criar `plan.md`

Antes da primeira alteração, crie `plan.md` usando [`../templates/ai-work-plan.md`](../templates/ai-work-plan.md).
O local padrão é uma área operacional autorizada e excluída do versionamento, por exemplo
`.ai-work/plan.md`, quando a política da empresa permitir. Caso contrário, use um diretório corporativo
seguro fora do repositório.

O agente deve:

- mapear arquivos e componentes prováveis;
- dividir a implementação em passos verificáveis;
- indicar backup e validação de cada etapa;
- registrar assumptions, riscos e perguntas abertas;
- marcar passos como `pending`, `in_progress`, `completed` ou `blocked`;
- atualizar o plano quando descobrir algo que altere o caminho;
- não incluir credenciais, payloads reais ou conteúdo confidencial desnecessário.

O plano não autoriza mudança além do briefing. Expansões materiais exigem confirmação humana.

### 3. Criar backup antes de alterar

Antes de cada conjunto coerente de alterações, preserve os arquivos que serão modificados.

Regras:

- resolver e conferir os caminhos exatos;
- copiar somente arquivos em escopo, preservando estrutura relativa;
- usar diretório timestampado, como `.ai-work/backups/20260902-143000/`;
- gerar manifesto com caminho relativo, tamanho e hash SHA-256;
- registrar commit/branch de origem quando Git estiver disponível;
- nunca copiar `.git`, secrets, `.env`, credenciais, datasets, dumps, builds ou dependências;
- não sobrescrever backups anteriores;
- verificar que o backup pode ser lido antes de editar;
- respeitar retenção e descarte definidos pela empresa.

Backup é proteção adicional; não substitui Git, testes ou rollback de banco. Migrações destrutivas,
infraestrutura e dados exigem estratégia específica aprovada.

### 4. Registrar telemetria operacional mínima

Use JSON Lines conforme [`../templates/ai-work-telemetry.jsonl`](../templates/ai-work-telemetry.jsonl).
Acrescente um evento por linha, sem reescrever eventos anteriores.

Registrar somente o necessário:

- timestamp;
- identificador local não sensível da sessão;
- fase e ação;
- categoria do alvo;
- resultado (`started`, `succeeded`, `failed`, `skipped`);
- duração quando útil;
- comando ou teste em forma sanitizada;
- contagens agregadas;
- referência ao passo do plano;
- erro resumido sem payload, segredo ou código.

Não registrar conteúdo de arquivo, prompt completo, resposta integral da IA, secret, payload, dado pessoal,
nome de cliente, URL interna ou caminho identificável desnecessário. Telemetria não deve capturar teclas,
telas, clipboard ou atividade fora da demanda.

### 5. Implementar em etapas

Para cada passo:

1. confirme o escopo;
2. confirme que os arquivos-alvo possuem backup;
3. marque o passo como `in_progress`;
4. faça a menor alteração coerente;
5. execute validação proporcional;
6. registre resultado na telemetria;
7. atualize o plano;
8. pare diante de segredo, requisito contraditório ou expansão material.

### 6. Validar e entregar

Antes de concluir:

- revisar diff e arquivos inesperados;
- executar testes relevantes e registrar resultados;
- verificar segurança, compatibilidade e observabilidade;
- confirmar critérios de aceite;
- documentar limitações e riscos residuais;
- indicar como reverter;
- manter backups até a aceitação ou conforme política corporativa.

Use [`../checklists/ai-assisted-change.md`](../checklists/ai-assisted-change.md) como revisão final.

### 7. Gerar draft para a Toolbox

Ao final da atividade, pergunte se existe aprendizado generalizável. “Nenhum” é uma resposta válida.

Quando existir:

1. não copie os artefatos operacionais;
2. extraia apenas a lição abstrata;
3. remova identidade, topologia, números, sequência rara e regras proprietárias;
4. use [`../templates/work-learning.md`](../templates/work-learning.md);
5. grave um novo arquivo em `work/intake` com `status: draft` e `review_state: pending`;
6. mantenha `sanitization.approved: false` até revisão na máquina principal;
7. não atualize knowledge, profile, case ou curriculum automaticamente.

## Estrutura operacional sugerida

Somente quando permitida no ambiente corporativo:

```text
.ai-work/
├── plan.md
├── telemetry.jsonl
└── backups/
    └── YYYYMMDD-HHMMSS/
        ├── manifest.md
        └── <estrutura relativa dos arquivos preservados>
```

`.ai-work/` deve ficar fora do commit por mecanismo aprovado pela equipe. Não altere `.gitignore`
compartilhado silenciosamente; prefira exclusão local ou diretório externo quando necessário.

## Comportamento esperado do agente

- mostrar o plano antes de implementar quando houver risco ou ambiguidade relevante;
- não declarar sucesso apenas porque o código compila;
- não restaurar backup automaticamente sobre mudanças humanas posteriores;
- não apagar backup ou telemetria sem autorização e política de retenção;
- não transformar volume de telemetria em produtividade, proficiência ou avaliação pessoal;
- distinguir claramente evidência observada, inferência e sugestão da IA.
