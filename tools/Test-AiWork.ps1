[CmdletBinding()]
param(
    [Parameter()]
    [string]$ProjectPath = ".",

    [Parameter()]
    [string]$DraftPath
)

$ErrorActionPreference = "Stop"
$errors = [System.Collections.Generic.List[string]]::new()

$resolvedProject = (Resolve-Path -LiteralPath $ProjectPath).Path
$root = (& git -C $resolvedProject rev-parse --show-toplevel 2>$null)
if ($LASTEXITCODE -ne 0 -or -not $root) { throw "O caminho não pertence a um repositório Git." }
$projectRoot = (Resolve-Path -LiteralPath $root.Trim()).Path
$aiWorkPath = Join-Path $projectRoot ".ai-work"

foreach ($required in @("plan.md", "telemetry.jsonl", "backups")) {
    if (-not (Test-Path -LiteralPath (Join-Path $aiWorkPath $required))) {
        $errors.Add("Ausente em .ai-work: $required")
    }
}

$telemetryPath = Join-Path $aiWorkPath "telemetry.jsonl"
if (Test-Path -LiteralPath $telemetryPath) {
    $lineNumber = 0
    foreach ($line in Get-Content -LiteralPath $telemetryPath) {
        $lineNumber++
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        try {
            $event = $line | ConvertFrom-Json
            foreach ($field in @("timestamp", "session_id", "plan_step", "phase", "action", "result")) {
                if (-not $event.PSObject.Properties.Name.Contains($field)) {
                    $errors.Add("Telemetria linha ${lineNumber}: campo obrigatório ausente: $field")
                }
            }
        } catch {
            $errors.Add("Telemetria linha ${lineNumber}: JSON inválido.")
        }
    }
}

if ($DraftPath) {
    $draft = Get-Content -LiteralPath $DraftPath -Raw
    foreach ($pattern in @("review_state:\s*pending", "approved:\s*false", "## Evidência permitida", "Observado diretamente", "Não verificado")) {
        if ($draft -notmatch $pattern) { $errors.Add("Draft não atende ao requisito: $pattern") }
    }
    $sensitivePatterns = @(
        "https?://[^\s)>]+",
        "[A-Za-z]:\\[^\r\n]+",
        "[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}",
        "(?i)(password|passwd|secret|token|api[_-]?key)\s*[:=]\s*\S+"
    )
    foreach ($pattern in $sensitivePatterns) {
        if ($draft -match $pattern) { $errors.Add("Draft exige revisão humana por possível dado identificável: $pattern") }
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Output "Validação estrutural concluída sem erros."
Write-Output "A validação automática não substitui a revisão humana de sanitização."

