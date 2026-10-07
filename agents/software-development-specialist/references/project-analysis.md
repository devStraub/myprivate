# Análise orientada do projeto

O objetivo não é documentar tudo, mas descobrir o suficiente para decidir e validar a demanda atual.

## Começar pelo caminho de execução

1. ponto de entrada ou gatilho;
2. validação e transformação;
3. regra ou decisão principal;
4. persistência e integração;
5. efeito externo;
6. erro, retry, compensação e observabilidade;
7. testes e operação.

## Inventário mínimo

Registre no plano local, quando aplicável:

- módulos e responsabilidades diretamente envolvidos;
- contratos de entrada, saída e compatibilidade;
- dependências internas e externas;
- dados lidos, gravados e suas fronteiras transacionais;
- estados e transições relevantes;
- processamento síncrono, assíncrono e agendado;
- autenticação, autorização, segredos e dados sensíveis;
- testes existentes e gates realmente disponíveis;
- métricas, logs, tracing, alertas e runbooks;
- restrições de implantação e rollback.

## Evidência

Para cada afirmação, aponte a origem local: código, teste, configuração, schema, documentação aprovada,
saída de comando ou observação operacional autorizada. Comentário e nome de classe são pistas; execução,
contrato e comportamento observado são evidências mais fortes.

## Limite

Não copie o inventário para a Toolbox. Ele pode revelar arquitetura e regra proprietária. Preserve-o em
`.ai-work/plan.md` ou relatório local e extraia somente aprendizado abstrato ao final.
