<#
Script para criação de usuário no Active Directory
Uso interno para onboarding de novos colaboradores
Autor: Gustavo Percoski
#>

# =========================
# Dados do usuário
# =========================
$Nome         = "Roberto"
$Sobrenome    = "Justus"
$Login        = "$Nome.$Sobrenome"
$SenhaInicial = "BemVindo@2026"   # Em produção, evite senha hardcoded

$SenhaSegura = ConvertTo-SecureString $SenhaInicial -AsPlainText -Force

# =========================
# OU onde o usuário será criado
# =========================
$OU = "OU=RH,OU=Enterprise,DC=ad,DC=lab"

Write-Host "Criando usuário $Login no Active Directory..."

try {

    # Verifica se o usuário já existe
    $UsuarioExiste = Get-ADUser -Filter { SamAccountName -eq $Login } -ErrorAction SilentlyContinue

    if ($UsuarioExiste) {
        throw "Usuário $Login já existe no Active Directory."
    }

    # Criação do usuário
    New-ADUser `
        -Name "$Nome $Sobrenome" `
        -SamAccountName $Login `
        -UserPrincipalName "$Login@ad.lab" `
        -AccountPassword $SenhaSegura `
        -Enabled $true `
        -Path $OU `
        -ChangePasswordAtLogon $true `
        -Description "Conta criada via script em $(Get-Date -Format 'dd/MM/yyyy')"

    Write-Host "Usuário criado com sucesso."
    Write-Host "Login: $Login"
    Write-Host "Senha inicial definida (troca obrigatória no primeiro acesso)."

}
catch {
    Write-Host "Falha ao criar o usuário."
    Write-Host "Erro: $_"
}
