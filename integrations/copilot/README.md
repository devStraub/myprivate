# Integração com GitHub Copilot

O Copilot pode carregar instruções do repositório e prompts reutilizáveis. Quando a política e a equipe
permitirem, copie e adapte:

| Modelo da Toolbox | Destino no projeto |
| --- | --- |
| [`copilot-instructions.md.template`](copilot-instructions.md.template) | `.github/copilot-instructions.md` |
| [`start-work.prompt.md`](start-work.prompt.md) | `.github/prompts/start-work.prompt.md` |
| [`review-work.prompt.md`](review-work.prompt.md) | `.github/prompts/review-work.prompt.md` |
| [`complete-work.prompt.md`](complete-work.prompt.md) | `.github/prompts/complete-work.prompt.md` |
| [`analyze-development.prompt.md`](analyze-development.prompt.md) | `.github/prompts/analyze-development.prompt.md` |
| [`product-owner.prompt.md`](product-owner.prompt.md) | `.github/prompts/product-owner.prompt.md` |

Substitua `<CAMINHO_DA_TOOLBOX>` pelo caminho permitido naquela máquina. Os arquivos de destino podem
ser versionáveis; por isso, a cópia exige autorização do repositório. Quando não houver autorização,
use diretamente [`../../work/copilot-start-prompt.md`](../../work/copilot-start-prompt.md) no chat.

Mantenha as instruções gerais curtas. Regras específicas e procedimentos extensos devem permanecer em
prompts separados para não desviar o agente da demanda atual.

O prompt de análise técnica carrega o especialista em desenvolvimento e, quando necessário, um
especialista de domínio. Ele deve fornecer ao agente do Copilot um recorte verificável, não todo o
conteúdo da Toolbox ou do projeto.

O prompt de Product Owner consulta ou atualiza a base corporativa do produto. Ele pode combinar o
especialista DICT/MED e o especialista em desenvolvimento para transformar mudança regulatória em análise
de impacto e backlog candidato.
