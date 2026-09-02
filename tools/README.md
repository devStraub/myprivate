# Utilitários portáteis

Scripts PowerShell sem dependências externas para aplicar o fluxo de trabalho assistido por IA.

## Ciclo básico

```powershell
# Dentro do projeto que será alterado
& "<toolbox>\tools\Start-AiWork.ps1"

# Antes de modificar arquivos
& "<toolbox>\tools\Backup-AiWork.ps1" -Paths "src\Exemplo.java", "pom.xml"

# Durante e antes do encerramento
& "<toolbox>\tools\Test-AiWork.ps1"

# Depois de validar, aceitar e gerar o draft sanitizado
& "<toolbox>\tools\Complete-AiWork.ps1" -ToolboxPath "<toolbox>" `
  -DraftPath "<toolbox>\work\intake\<draft>.md" -ConfirmCleanup
```

Se não houver aprendizado reutilizável, use `-NoLearning` no encerramento. Sem
`-ConfirmCleanup`, o último script apenas informa o que faria.

Os scripts recusam caminhos fora do projeto, links de sistema de arquivos nos artefatos operacionais,
sobrescrita silenciosa e limpeza quando a estrutura não é reconhecida. Eles não substituem as políticas
da organização nem tornam um draft automaticamente seguro ou aprovado.

