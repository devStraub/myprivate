[CmdletBinding()]
param(
    [Parameter()]
    [string]$ProjectPath = "."
)

$ErrorActionPreference = "Stop"

function Get-ProjectRoot {
    param([string]$Path)

    $resolved = (Resolve-Path -LiteralPath $Path).Path
    $root = (& git -C $resolved rev-parse --show-toplevel 2>$null)
    if ($LASTEXITCODE -ne 0 -or -not $root) {
        throw "O caminho informado não pertence a um repositório Git."
    }
    return (Resolve-Path -LiteralPath $root.Trim()).Path
}

$projectRoot = Get-ProjectRoot -Path $ProjectPath
$aiWorkPath = Join-Path $projectRoot ".ai-work"
if (Test-Path -LiteralPath $aiWorkPath) {
    throw "Já existe um ciclo em andamento em '$aiWorkPath'."
}

$toolboxRoot = Split-Path -Parent $PSScriptRoot
$planTemplate = Join-Path $toolboxRoot "templates\ai-work-plan.md"
$telemetryTemplate = Join-Path $toolboxRoot "templates\ai-work-telemetry.jsonl"
if (-not (Test-Path -LiteralPath $planTemplate) -or -not (Test-Path -LiteralPath $telemetryTemplate)) {
    throw "Os templates operacionais não foram encontrados na Toolbox."
}

$excludeValue = "/.ai-work/"
$excludeFromGit = (& git -C $projectRoot rev-parse --git-path info/exclude).Trim()
if (-not [System.IO.Path]::IsPathRooted($excludeFromGit)) {
    $excludeFromGit = Join-Path $projectRoot $excludeFromGit
}
$excludeDirectory = Split-Path -Parent $excludeFromGit
if (-not (Test-Path -LiteralPath $excludeDirectory)) {
    New-Item -ItemType Directory -Path $excludeDirectory | Out-Null
}
$existingExclusions = if (Test-Path -LiteralPath $excludeFromGit) {
    @(Get-Content -LiteralPath $excludeFromGit)
} else {
    @()
}
if ($existingExclusions -notcontains $excludeValue) {
    Add-Content -LiteralPath $excludeFromGit -Value $excludeValue
}

New-Item -ItemType Directory -Path (Join-Path $aiWorkPath "backups") -Force | Out-Null
Copy-Item -LiteralPath $planTemplate -Destination (Join-Path $aiWorkPath "plan.md")
Copy-Item -LiteralPath $telemetryTemplate -Destination (Join-Path $aiWorkPath "telemetry.jsonl")

Write-Output "Ciclo iniciado em: $aiWorkPath"
Write-Output "Exclusão local do Git confirmada em: $excludeFromGit"

