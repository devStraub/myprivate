[CmdletBinding()]
param(
    [Parameter()]
    [string]$ProjectPath = ".",

    [Parameter(Mandatory)]
    [string]$ToolboxPath,

    [Parameter()]
    [string]$DraftPath,

    [Parameter()]
    [switch]$NoLearning,

    [Parameter()]
    [switch]$ConfirmCleanup
)

$ErrorActionPreference = "Stop"

if ([bool]$DraftPath -eq [bool]$NoLearning) {
    throw "Informe exatamente uma opção: -DraftPath ou -NoLearning."
}

$resolvedProject = (Resolve-Path -LiteralPath $ProjectPath).Path
$root = (& git -C $resolvedProject rev-parse --show-toplevel 2>$null)
if ($LASTEXITCODE -ne 0 -or -not $root) { throw "O caminho não pertence a um repositório Git." }
$projectRoot = (Resolve-Path -LiteralPath $root.Trim()).Path
$aiWorkPath = Join-Path $projectRoot ".ai-work"
$expectedAiWorkPath = $projectRoot.TrimEnd('\') + '\.ai-work'
if (-not $aiWorkPath.Equals($expectedAiWorkPath, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Falha na confirmação do caminho de limpeza."
}
if (-not (Test-Path -LiteralPath $aiWorkPath -PathType Container)) {
    throw "Diretório operacional não encontrado: '$aiWorkPath'."
}

$allowedNames = @("plan.md", "telemetry.jsonl", "backups")
$unexpected = @(Get-ChildItem -LiteralPath $aiWorkPath -Force | Where-Object { $_.Name -notin $allowedNames })
if ($unexpected.Count -gt 0) {
    throw "A limpeza foi recusada porque .ai-work contém itens inesperados: $($unexpected.Name -join ', ')."
}
$links = @(Get-ChildItem -LiteralPath $aiWorkPath -Force -Recurse | Where-Object {
    ($_.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0
})
if ($links.Count -gt 0) { throw "A limpeza foi recusada porque .ai-work contém links de sistema de arquivos." }

$resolvedToolbox = (Resolve-Path -LiteralPath $ToolboxPath).Path
if ($DraftPath) {
    $resolvedDraft = (Resolve-Path -LiteralPath $DraftPath).Path
    $intakeRoot = Join-Path $resolvedToolbox "work\intake"
    $intakePrefix = $intakeRoot.TrimEnd('\') + '\'
    if (-not $resolvedDraft.StartsWith($intakePrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "O draft deve estar dentro de '<toolbox>\work\intake'."
    }
    & (Join-Path $PSScriptRoot "Test-AiWork.ps1") -ProjectPath $projectRoot -DraftPath $resolvedDraft
} else {
    & (Join-Path $PSScriptRoot "Test-AiWork.ps1") -ProjectPath $projectRoot
}
if ($LASTEXITCODE -ne 0) { throw "A validação falhou; a limpeza não será executada." }

if (-not $ConfirmCleanup) {
    Write-Output "Pré-validação concluída. Nenhum arquivo foi removido."
    Write-Output "Execute novamente com -ConfirmCleanup após a aceitação necessária."
    exit 0
}

Remove-Item -LiteralPath $aiWorkPath -Recurse -Force
if (Test-Path -LiteralPath $aiWorkPath) { throw "Não foi possível confirmar a remoção de .ai-work." }
Write-Output "Ciclo encerrado: .ai-work foi removido do projeto."
Write-Output "A exclusão local em .git/info/exclude foi preservada para o próximo ciclo."

