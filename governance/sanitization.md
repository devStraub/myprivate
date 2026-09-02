---
id: sanitization-policy
title: Política obrigatória de sanitização
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
related: [../work/work-workflow.md, ../templates/work-learning.md, ../templates/case.md]
visibility: private
---

# Política obrigatória de sanitização

Esta política é obrigatória para pessoas e agentes. A Toolbox guarda experiência generalizada, nunca ativos de empresa, cliente, empregador ou terceiro. Em caso de dúvida sobre propriedade, autorização ou possibilidade de reidentificação, não registre.

## Conteúdo proibido

Nunca incorporar:

- código-fonte proprietário ou documentação interna copiada;
- nomes de empresas, clientes, pessoas, projetos, sistemas ou fornecedores quando identificarem o caso;
- tickets, URLs, endpoints, IPs, hostnames ou identificadores internos;
- credenciais, tokens, secrets, chaves ou detalhes que facilitem acesso;
- dados pessoais, dados de produção ou payloads empresariais reais;
- regras de negócio confidenciais;
- diagramas, arquitetura ou topologia proprietária identificável;
- métricas, volumes, datas ou combinações de detalhes que permitam reidentificação;
- `plan.md`, inventários de backup, telemetria operacional, diffs e listas de caminhos produzidos no ambiente corporativo;
- conteúdo protegido ou qualquer material cuja propriedade pessoal seja duvidosa.

Redação não é sanitização suficiente quando relações, sequência de eventos ou detalhes raros ainda identificam a origem.

## Processo obrigatório

```text
identificar aprendizado
→ abstrair
→ generalizar
→ sanitizar
→ revisar risco de reidentificação
→ propor alteração
→ aguardar aprovação humana
```

1. Extraia a lição sem copiar o artefato original.
2. Troque entidades por papéis genéricos e remova detalhes sem valor conceitual.
3. Generalize números, cronologia e arquitetura somente quando essenciais; caso contrário, remova-os.
4. Verifique se alguém com contexto parcial conseguiria reconhecer empresa ou sistema.
5. Classifique o nível de sanitização e registre apenas fontes permitidas.
6. Apresente a proposta ao proprietário antes de incorporá-la.

## Níveis de sanitização

- `not-applicable`: nenhuma origem profissional ou confidencial.
- `generalized`: entidades e detalhes identificáveis removidos; lição abstrata preservada.
- `high-risk-review-required`: ainda pode haver singularidade ou dúvida; não incorporar até revisão humana explícita.
- `rejected`: não é possível preservar a lição com segurança suficiente.

`high-risk-review-required` não é permissão de armazenamento definitivo.

## Teste antes de propor

- Há nomes, identificadores ou trechos reconhecíveis?
- A combinação de tecnologia, evento, data, volume e topologia reidentifica o caso?
- O texto revela regra de negócio, vulnerabilidade ou capacidade interna?
- A fonte pode ser mantida pessoalmente e citada?
- O mesmo aprendizado pode ser expresso com menos detalhes?
- O proprietário teria segurança para mostrar a versão sanitizada a uma pessoa externa?

## Exemplo

Não registrar um cliente e endpoint específicos. Registrar: “Em integrações remotas, um timeout após processamento bem-sucedido pode provocar retry e duplicação quando não há idempotência adequada.”

## Conduta do agente

Se encontrar conteúdo potencialmente confidencial, interrompa sua incorporação, aponte apenas a categoria do risco sem repetir o segredo e solicite revisão humana. Nunca use a Toolbox como justificativa para extrair conteúdo de ambiente corporativo.

Backups e telemetria podem existir no ambiente corporativo autorizado para recuperação e rastreabilidade,
mas são artefatos operacionais brutos. A Toolbox recebe apenas uma nova síntese abstrata e sanitizada;
ela nunca recebe cópia, exportação ou simples redação automática desses arquivos.

Scouting motivado por trabalho deve receber apenas o tema generalizado. A pesquisa não pode incluir nomes, trechos, arquitetura ou indicadores do caso de origem; o vínculo com um case deve permanecer sanitizado e aprovado.
