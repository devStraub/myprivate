---
description: Extrair aprendizado sanitizado e encerrar os artefatos operacionais
---

Depois da validação e aceitação necessárias, determine se existe aprendizado reutilizável. Se existir,
crie do zero um draft em `<CAMINHO_DA_TOOLBOX>/work/intake` usando o template de aprendizado de trabalho;
não copie conteúdo de `.ai-work/`. Remova identidades, topologia, números e cronologia singular. Valide o
draft e apresente-o para revisão humana. Somente então execute `Complete-AiWork.ps1` com confirmação de
limpeza. Se não houver aprendizado, encerre explicitamente com `-NoLearning`.

