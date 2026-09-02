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

Backups, plano, diff e telemetria bruta podem conter propriedade da empresa. Durante a demanda,
permanecem somente dentro do projeto alterado, em `.ai-work/`, conforme as políticas da organização.
Nunca devem ser copiados para a Toolbox, pen drive pessoal ou Git pessoal.

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

Antes de seguir, aplique o [`roteamento de agentes`](agent-routing.md). Classifique escopo, ambiguidade,
impacto, diagnóstico e validação. Se o agente atual não for adequado, recomende outro com motivo concreto,
papel esperado e ponto de retorno. A troca depende de decisão humana.

### 2. Criar `plan.md`

Antes da primeira alteração, crie `plan.md` usando [`../templates/ai-work-plan.md`](../templates/ai-work-plan.md).
O arquivo deve ser criado dentro do projeto alterado em `.ai-work/plan.md`. O diretório operacional deve
estar excluído do versionamento por um mecanismo aprovado. Se a política da empresa proibir esse tipo de
artefato dentro do projeto, pare e solicite orientação em vez de escolher outro local silenciosamente.

O agente deve:

- mapear arquivos e componentes prováveis;
- dividir a implementação em passos verificáveis;
- indicar backup e validação de cada etapa;
- registrar assumptions, riscos e perguntas abertas;
- marcar passos como `pending`, `in_progress`, `completed` ou `blocked`;
- separar para cada validação o que foi configurado, executado, observado e aprovado;
- identificar gates indisponíveis localmente e o responsável pela validação posterior;
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
- camada da falha e classificação do resultado, quando aplicáveis;
- estado da evidência, sem confundir execução com aprovação;
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

Depois da implementação concluída e aceita, extraia primeiro o aprendizado permitido e então remova
`.ai-work/` por completo, incluindo `plan.md`, backups, manifestos e telemetria. Antes da remoção, confira
o caminho absoluto, confirme que ele pertence ao projeto atual, verifique que não contém arquivos de
produto e registre no encerramento que a limpeza foi realizada. Não remova os artefatos enquanto houver
validação, rollback ou aprovação pendente, salvo determinação expressa da política corporativa.

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
8. somente depois de salvar o draft sanitizado, concluir as validações e obter a aceitação necessária,
   remover os artefatos operacionais locais conforme a etapa de limpeza.

O draft deve separar explicitamente fatos observados, inferências da IA e itens não verificados. Remova
também contagens exatas, cronologia rara, combinações de status e outros sinais operacionais que não
sejam necessários para compreender o aprendizado generalizado.

## Análises condicionais por tipo de demanda

Use somente quando forem pertinentes, sem transformar toda mudança em um processo pesado:

- migração de plataforma: matriz de compatibilidade, etapas e critérios de saída;
- dependências: separar inventário de achados acionáveis, identificar origem direta/transitiva ou BOM e
  validar a árvore efetivamente resolvida;
- segurança dependente de pipeline: registrar separadamente configuração, execução, resultado observado
  e aprovação, mantendo responsável e pendência quando o gate não estiver acessível;
- integração distribuída: identificar etapa e camada da falha e usar correlação sanitizada quando houver.

## Estrutura operacional sugerida

Dentro da raiz do projeto alterado, quando permitido no ambiente corporativo:

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
compartilhado silenciosamente; prefira uma exclusão local do Git. Se isso não for permitido, pare e
solicite orientação. Ao final do ciclo, o diretório deve ser removido conforme as condições de limpeza.

## Automação portátil

Quando PowerShell e Git estiverem disponíveis e a política local permitir, use os
[`utilitários da Toolbox`](../tools/README.md) para criar a estrutura, registrar a exclusão local no Git,
gerar backups com hash, validar os artefatos e executar a limpeza protegida. A automação recusa caminhos
fora do projeto e não substitui aceitação, revisão de sanitização ou autorização organizacional.

Para Copilot, consulte os [`adaptadores opcionais`](../integrations/copilot/README.md). Não os copie para
um repositório corporativo sem autorização, pois os arquivos de instrução do projeto podem ser versionados.

## Comportamento esperado do agente

- mostrar o plano antes de implementar quando houver risco ou ambiguidade relevante;
- não declarar sucesso apenas porque o código compila;
- não restaurar backup automaticamente sobre mudanças humanas posteriores;
- não apagar artefatos operacionais antes da aceitação, da extração segura do aprendizado e das
  verificações de limpeza;
- não transformar volume de telemetria em produtividade, proficiência ou avaliação pessoal;
- distinguir claramente evidência observada, inferência e sugestão da IA.
