$ErrorActionPreference = 'Stop'
$ProjectRoot = Split-Path -Parent $PSScriptRoot
$Errors = [System.Collections.Generic.List[string]]::new()

foreach ($File in @('server.cfg', 'secrets.cfg', 'permissions.cfg', '.gitmodules')) {
    if (-not (Test-Path -LiteralPath (Join-Path $ProjectRoot $File))) { $Errors.Add("Arquivo ausente: $File") }
}

$RequiredResources = @(
    'resources/[standalone]/oxmysql',
    'resources/[standalone]/ox_lib',
    'resources/[framework]/rsg-core',
    'resources/[framework]/rsg-inventory',
    'resources/[alegrete]/alegrete-core',
    'resources/[cfx-default]/[managers]/mapmanager'
)
foreach ($Resource in $RequiredResources) {
    if (-not (Test-Path -LiteralPath (Join-Path $ProjectRoot $Resource))) { $Errors.Add("Recurso ausente: $Resource") }
}

$SubmoduleStatus = git -C $ProjectRoot submodule status --recursive
if ($LASTEXITCODE -ne 0) { $Errors.Add('Nao foi possivel consultar submodulos.') }
foreach ($Line in $SubmoduleStatus) {
    if ($Line.StartsWith('-')) { $Errors.Add("Submodulo nao inicializado: $Line") }
    if ($Line.StartsWith('+')) { $Errors.Add("Submodulo fora da revisao registrada: $Line") }
    if ($Line.StartsWith('U')) { $Errors.Add("Conflito em submodulo: $Line") }
}

if ($Errors.Count -gt 0) {
    $Errors | ForEach-Object { Write-Error $_ }
    exit 1
}
Write-Host "Validacao concluida: $($SubmoduleStatus.Count) submodulos e arquivos essenciais presentes." -ForegroundColor Green

