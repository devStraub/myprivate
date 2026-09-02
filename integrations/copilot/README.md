# Integração com GitHub Copilot

O Copilot pode carregar instruções do repositório e prompts reutilizáveis. Quando a política e a equipe
permitirem, copie e adapte:

| Modelo da Toolbox | Destino no projeto |
| --- | --- |
| [`copilot-instructions.md.template`](copilot-instructions.md.template) | `.github/copilot-instructions.md` |
| [`start-work.prompt.md`](start-work.prompt.md) | `.github/prompts/start-work.prompt.md` |
| [`review-work.prompt.md`](review-work.prompt.md) | `.github/prompts/review-work.prompt.md` |
| [`complete-work.prompt.md`](complete-work.prompt.md) | `.github/prompts/complete-work.prompt.md` |

Substitua `<CAMINHO_DA_TOOLBOX>` pelo caminho permitido naquela máquina. Os arquivos de destino podem
ser versionáveis; por isso, a cópia exige autorização do repositório. Quando não houver autorização,
use diretamente [`../../work/copilot-start-prompt.md`](../../work/copilot-start-prompt.md) no chat.

Mantenha as instruções gerais curtas. Regras específicas e procedimentos extensos devem permanecer em
prompts separados para não desviar o agente da demanda atual.

