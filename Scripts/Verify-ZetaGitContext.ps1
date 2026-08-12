$ErrorActionPreference = 'Stop'

$expectedTopLevel = [System.IO.Path]::GetFullPath('C:\dev\projeto_zeta').TrimEnd('\')
$expectedBranch = 'projeto-zeta'

try {
    $actualTopLevelRaw = (& git rev-parse --show-toplevel 2>&1 | Out-String).Trim()
    if ($LASTEXITCODE -ne 0) {
        throw "Git não conseguiu detectar o top-level: $actualTopLevelRaw"
    }

    $actualBranch = (& git branch --show-current 2>&1 | Out-String).Trim()
    if ($LASTEXITCODE -ne 0) {
        throw "Git não conseguiu detectar a branch atual: $actualBranch"
    }

    $actualTopLevel = [System.IO.Path]::GetFullPath($actualTopLevelRaw).TrimEnd('\')

    if (-not [System.StringComparer]::OrdinalIgnoreCase.Equals($actualTopLevel, $expectedTopLevel)) {
        throw "Top-level Git inválido. Esperado: '$expectedTopLevel'. Encontrado: '$actualTopLevel'."
    }

    if ($actualBranch -cne $expectedBranch) {
        throw "Branch Git inválida. Esperada: '$expectedBranch'. Encontrada: '$actualBranch'."
    }

    Write-Host "Contexto Git do Projeto Zeta verificado: $actualTopLevel [$actualBranch]"
    exit 0
}
catch {
    Write-Error "Verificação de segurança do Projeto Zeta falhou. $($_.Exception.Message)"
    exit 1
}
