[CmdletBinding()]
param([switch]$SkipOxMySQL)
$ErrorActionPreference = 'Stop'
$ProjectRoot = Split-Path -Parent $PSScriptRoot
Write-Host 'Inicializando submodulos...'
git -C $ProjectRoot submodule sync --recursive
if ($LASTEXITCODE -ne 0) { throw 'Falha ao sincronizar submodulos.' }
git -C $ProjectRoot submodule update --init --recursive --depth 1
if ($LASTEXITCODE -ne 0) { throw 'Falha ao inicializar submodulos.' }
$CfxSource = Join-Path $ProjectRoot 'vendor/cfx-server-data/resources'
$CfxTarget = Join-Path $ProjectRoot 'resources/[cfx-default]'
if (-not (Test-Path -LiteralPath $CfxSource)) { throw "Recursos Cfx nao encontrados em $CfxSource" }
Write-Host 'Sincronizando recursos padrao Cfx...'
New-Item -ItemType Directory -Force -Path $CfxTarget | Out-Null
Get-ChildItem -LiteralPath $CfxTarget -Force | Remove-Item -Recurse -Force
Get-ChildItem -LiteralPath $CfxSource -Force | ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination $CfxTarget -Recurse -Force }
$OldChat = Join-Path $CfxTarget '[gameplay]/chat'
if (Test-Path -LiteralPath $OldChat) { Remove-Item -LiteralPath $OldChat -Recurse -Force }
if (-not $SkipOxMySQL) {
    Write-Host 'Baixando release compilada mais recente do oxmysql...'
    $DownloadDir = Join-Path $ProjectRoot 'artifacts'; $ZipPath = Join-Path $DownloadDir 'oxmysql.zip'
    $Standalone = Join-Path $ProjectRoot 'resources/[standalone]'; $OxTarget = Join-Path $Standalone 'oxmysql'; $ExtractPath = Join-Path $DownloadDir 'oxmysql-extracted'
    New-Item -ItemType Directory -Force -Path $DownloadDir | Out-Null
    Invoke-WebRequest -Uri 'https://github.com/CommunityOx/oxmysql/releases/latest/download/oxmysql.zip' -OutFile $ZipPath
    if (Test-Path -LiteralPath $OxTarget) { Remove-Item -LiteralPath $OxTarget -Recurse -Force }
    if (Test-Path -LiteralPath $ExtractPath) { Remove-Item -LiteralPath $ExtractPath -Recurse -Force }
    Expand-Archive -LiteralPath $ZipPath -DestinationPath $ExtractPath -Force
    $ExtractedOxMySQL = Join-Path $ExtractPath 'oxmysql'
    if (-not (Test-Path -LiteralPath $ExtractedOxMySQL)) { throw 'O pacote do oxmysql nao possui a estrutura esperada.' }
    Copy-Item -LiteralPath $ExtractedOxMySQL -Destination $Standalone -Recurse -Force
}
foreach ($Pair in @(@('secrets.cfg.example','secrets.cfg'), @('permissions.cfg.example','permissions.cfg'))) {
    $Source = Join-Path $ProjectRoot $Pair[0]; $Target = Join-Path $ProjectRoot $Pair[1]
    if (-not (Test-Path -LiteralPath $Target)) { Copy-Item -LiteralPath $Source -Destination $Target }
}
& (Join-Path $PSScriptRoot 'apply-locales.ps1')
& (Join-Path $PSScriptRoot 'validate.ps1')
Write-Host 'Bootstrap concluido. Preencha secrets.cfg e permissions.cfg antes de iniciar.' -ForegroundColor Green
