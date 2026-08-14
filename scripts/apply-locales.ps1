[CmdletBinding()]
param([switch]$Restore)
$ErrorActionPreference='Stop'
$ProjectRoot=Split-Path -Parent $PSScriptRoot
$OverrideRoot=Join-Path $ProjectRoot 'overrides\framework'
$FrameworkRoot=Join-Path $ProjectRoot 'resources\[framework]'
if(-not(Test-Path -LiteralPath $OverrideRoot)){Write-Host 'Nenhum override de locale encontrado.'; exit 0}
Get-ChildItem -LiteralPath $OverrideRoot -Directory | ForEach-Object {
  $resource=$_.Name; $resourceRoot=Join-Path $FrameworkRoot $resource
  if(-not(Test-Path -LiteralPath $resourceRoot)){throw "Recurso ausente: $resource"}
  Get-ChildItem -LiteralPath $_.FullName -Recurse -File | ForEach-Object {
    $relative=$_.FullName.Substring((Join-Path $OverrideRoot $resource).Length+1)
    $target=Join-Path $resourceRoot $relative
    if($Restore){
      git -C $resourceRoot ls-files --error-unmatch -- $relative 2>$null | Out-Null
      if($LASTEXITCODE -eq 0){git -C $resourceRoot checkout -- $relative} elseif(Test-Path -LiteralPath $target){Remove-Item -LiteralPath $target -Force}
    } else {
      New-Item -ItemType Directory -Force -Path (Split-Path $target)|Out-Null
      Copy-Item -LiteralPath $_.FullName -Destination $target -Force
    }
  }
}
Write-Host $(if($Restore){'Overrides restaurados para o estado original.'}else{'Overrides de locale pt-br aplicados.'}) -ForegroundColor Green
