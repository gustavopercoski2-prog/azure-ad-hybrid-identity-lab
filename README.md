# ☁️ Azure & Active Directory Hybrid Identity Lab

> **Status:** 🚧 Projeto concluído ✅

---

## 📋 Sobre o projeto
Esse projeto é um **laboratório prático** criado para simular um ambiente corporativo de **identidade híbrida**, algo muito comum em empresas que utilizam Active Directory local junto com serviços em nuvem da Microsoft.

Aqui eu integro um ambiente **on-premises**, usando **Active Directory Domain Services (AD DS)**, com o **Microsoft Entra ID (Azure AD)**, focando principalmente em **identidade, sincronização de usuários e automação administrativa com PowerShell**.

O objetivo não é só “subir o lab”, mas entender **como tudo funciona junto**, como seria no dia a dia de um time de infraestrutura ou suporte N2/N3.

---

## 🏢 Cenário simulado
A ideia do lab é simples e realista:  
uma empresa fictícia precisa centralizar o gerenciamento de usuários, permitindo que contas criadas no Active Directory local também possam ser utilizadas para acessar recursos em nuvem, **sem criar usuários duplicados**.

Para isso, é implementada uma integração híbrida utilizando o **Azure AD Connect**, garantindo:
- Um único usuário por pessoa
- Mesmas credenciais local e cloud
- Mais controle e organização do ambiente

Esse cenário reflete bastante a realidade de empresas que ainda dependem de AD local, mas já estão migrando serviços para a nuvem.

---

## 🛠 Tecnologias utilizadas
- **Virtualização:** Oracle VirtualBox (ambiente local)
- **Sistema Operacional:** Windows Server 2022 (Evaluation)
- **Identidade em Nuvem:** Microsoft Entra ID (Azure AD – Free Tier)
- **Diretório Local:** Active Directory Domain Services (AD DS)
- **Sincronização:** Azure AD Connect
- **Automação:** PowerShell 5.1 / PowerShell 7

---

## 🗺️ Arquitetura do laboratório

O diagrama abaixo representa a arquitetura do laboratório, destacando a integração entre o Active Directory local (Windows Server 2022) e o Microsoft Entra ID por meio do Azure AD Connect, utilizando sincronização de hash de senha.

<img width="812" height="654" alt="Diagrama Arquitetura do Lab" src="https://github.com/user-attachments/assets/89943138-fded-45c9-aa3d-8f3865f50e7a" />

---

## 🚀 Etapas do projeto
O projeto está sendo desenvolvido por fases, para facilitar o entendimento e a organização.

### ✅ Fase 1 – Infraestrutura Local *(concluída)*
- Criação da VM com Windows Server 2022
- Promoção do servidor a **Domain Controller**
- Configuração de DNS
- Criação da estrutura de **OUs**
- Criação de usuários e grupos locais

### ✅ Fase 2 – Identidade na Nuvem *(concluída)*
- Criação do tenant no Microsoft Azure
- Configuração inicial do Microsoft Entra ID
- Criação de grupos e validação de permissões básicas

### ✅ Fase 3 – Integração Híbrida *(concluída)*
- Instalação e configuração do **Azure AD Connect**
- Sincronização usando **Password Hash Synchronization (PHS)**
- Testes de sincronização de usuários e grupos (AD local → Azure)

### ✅ Fase 4 – Automação *(concluída)*
- Script PowerShell para **onboarding** de usuários:
  - Criação no AD
  - Definição de senha inicial
  - Inclusão em grupos
- Script PowerShell para **offboarding**:
  - Desativação da conta
  - Remoção de grupos

---

## 📸 Evidências do Laboratório

### 1. Estrutura Local (Active Directory)
<img width="755" height="533" alt="AD_users_and_computers" src="https://github.com/user-attachments/assets/8f611521-4102-4a20-a670-4abee03f7460" />
<br>
<em>Fig 1: Console do AD Users and Computers mostrando a estrutura de OUs (Enterprise/RH) e o usuário 'Roberto Justus' criado via script.</em>

### 2. Prova de Sincronização (Microsoft Entra ID)
<img width="1365" height="648" alt="Portal do Microsoft ENTRA ID" src="https://github.com/user-attachments/assets/57e5320f-7621-4105-b736-88cb2894bea5" />
<br>
<em>Fig 2: Portal do Entra ID confirmando que o usuário 'Roberto Justus' foi sincronizado com sucesso (Sincronização: Sim).</em>

### 3. Logs Técnicos (Azure AD Connect)
<img width="805" height="602" alt="Logs de Sicronização" src="https://github.com/user-attachments/assets/de7fd612-f551-4333-afc4-9fc17775002b" />
<br>
<em>Fig 3: Synchronization Service Manager mostrando operações de Exportação e Sincronização com status 'Success'.</em>

---

## 🎯 Objetivos com este lab
- Praticar conceitos de Active Directory e Azure Entra ID
- Entender melhor ambientes híbridos de identidade
- Trabalhar com sincronização de diretórios
- Automatizar tarefas comuns de administração com PowerShell
- Simular rotinas reais de onboarding e offboarding

---

<div align="center">

### Developed by Gustavo Percoski

<a href="https://www.linkedin.com/in/gustavo-percoski/" target="_blank">
<img src="https://img.shields.io/badge/LinkedIn-000000?style=for-the-badge&logo=linkedin&logoColor=white" />
</a>
&nbsp;
<a href="mailto:gustavopercoski2@gmail.com">
<img src="https://img.shields.io/badge/Gmail-000000?style=for-the-badge&logo=gmail&logoColor=white" />
</a>
&nbsp;
<a href="https://github.com/gustavopercoski2-prog" target="_blank">
<img src="https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white" />
</a>

</div>

