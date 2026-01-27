<#
Script de offboarding - desativação de conta no Active Directory
Uso interno para desligamento de colaboradores
Autor: Gustavo Percoski
#>

# =========================
# Usuário a ser desativado
# =========================
$Usuario = "Roberto.Justus"

Write-Host "Iniciando processo de desligamento do usuário $Usuario..."

try {

    # Verifica se o usuário existe
    $UsuarioAD = Get-ADUser -Identity $Usuario -ErrorAction SilentlyContinue

    if (-not $UsuarioAD) {
        throw "Usuário $Usuario não encontrado no Active Directory."
    }

    # Desabilita a conta
    Disable-ADUser -Identity $Usuario -ErrorAction Stop

    # Atualiza descrição para auditoria
    $DataHoje = Get-Date -Format "dd/MM/yyyy"
    Set-ADUser -Identity $Usuario `
        -Description "Conta desativada via script em $DataHoje"

    Write-Host "Conta desativada com sucesso."
    Write-Host "Usuário: $Usuario"
    Write-Host "Data do desligamento: $DataHoje"

}
catch {
    Write-Host "Falha ao processar o desligamento."
    Write-Host "Erro: $_"
}
