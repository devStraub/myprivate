[CmdletBinding()]
param([switch]$RunSetup)
$ErrorActionPreference = 'Stop'
$ProjectRoot = Split-Path -Parent $PSScriptRoot
$LocaleScript = Join-Path $PSScriptRoot 'apply-locales.ps1'
& $LocaleScript -Restore
if ((git -C $ProjectRoot status --porcelain).Count -gt 0) { throw 'A arvore Git possui alteracoes. Faca commit ou stash antes de atualizar.' }
git -C $ProjectRoot submodule sync --recursive
if ($LASTEXITCODE -ne 0) { throw 'Falha ao sincronizar URLs.' }
git -C $ProjectRoot submodule update --init --remote --merge --recursive
if ($LASTEXITCODE -ne 0) { throw 'Falha ao atualizar recursos.' }
if ($RunSetup) { & (Join-Path $PSScriptRoot 'setup.ps1') } else { & $LocaleScript }
Write-Host 'Revisoes atualizadas e traducoes reaplicadas. Revise as mudancas antes do commit.' -ForegroundColor Yellow
git -C $ProjectRoot status --short
