[CmdletBinding()]
param(
    [Parameter()]
    [string]$ProjectPath = ".",

    [Parameter(Mandatory)]
    [string[]]$Paths
)

$ErrorActionPreference = "Stop"

function Get-ProjectRoot {
    param([string]$Path)
    $resolved = (Resolve-Path -LiteralPath $Path).Path
    $root = (& git -C $resolved rev-parse --show-toplevel 2>$null)
    if ($LASTEXITCODE -ne 0 -or -not $root) { throw "O caminho não pertence a um repositório Git." }
    return (Resolve-Path -LiteralPath $root.Trim()).Path
}

function Assert-UnderRoot {
    param([string]$Candidate, [string]$Root)
    $prefix = $Root.TrimEnd('\') + '\'
    if (-not $Candidate.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "O alvo '$Candidate' está fora do projeto."
    }
}

$projectRoot = Get-ProjectRoot -Path $ProjectPath
$aiWorkPath = Join-Path $projectRoot ".ai-work"
if (-not (Test-Path -LiteralPath (Join-Path $aiWorkPath "plan.md"))) {
    throw "Execute Start-AiWork.ps1 antes de criar backups."
}

$resolvedFiles = foreach ($path in $Paths) {
    $candidate = if ([System.IO.Path]::IsPathRooted($path)) { $path } else { Join-Path $projectRoot $path }
    $item = Get-Item -LiteralPath $candidate
    if ($item.PSIsContainer) { throw "Informe arquivos individuais; diretórios não são aceitos: '$path'." }
    if (($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0) {
        throw "Links de sistema de arquivos não são aceitos: '$path'."
    }
    Assert-UnderRoot -Candidate $item.FullName -Root $projectRoot
    if ($item.FullName.StartsWith($aiWorkPath + '\', [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Não é permitido criar backup dos próprios artefatos de .ai-work."
    }
    $item
}

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss-fff"
$backupRoot = Join-Path (Join-Path $aiWorkPath "backups") $timestamp
New-Item -ItemType Directory -Path $backupRoot | Out-Null

$manifestRows = foreach ($file in $resolvedFiles) {
    $relative = $file.FullName.Substring($projectRoot.Length).TrimStart('\')
    $destination = Join-Path $backupRoot $relative
    New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
    Copy-Item -LiteralPath $file.FullName -Destination $destination
    $copied = Get-Item -LiteralPath $destination
    $hash = (Get-FileHash -LiteralPath $destination -Algorithm SHA256).Hash
    "| ``$relative`` | $($copied.Length) | ``$hash`` |"
}

$manifestPath = Join-Path $backupRoot "manifest.md"
$header = @(
    "# Manifesto de backup",
    "",
    "- Criado em: $((Get-Date).ToString('o'))",
    "- Projeto: identificador local omitido",
    "",
    "| Caminho relativo | Bytes | SHA-256 |",
    "| --- | ---: | --- |"
)
Set-Content -LiteralPath $manifestPath -Value ($header + $manifestRows) -Encoding UTF8

Write-Output "Backup criado e verificado em: $backupRoot"
Write-Output "Arquivos preservados: $($resolvedFiles.Count)"

