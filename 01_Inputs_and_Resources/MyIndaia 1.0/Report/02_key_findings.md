## 2. Key Technical Findings & Security Gaps

### A. Database-Centric User Authentication & Privilege Escalation
The main REST API (`MyWebApi` -> `DmBroker.pas`) validates logins by dynamically attempting to connect to the SQL Server database (`FDLogin`) using the user's input username and password:
```pascal
DataModule.FDLogin.Params.Values['User_Name'] := UserName;
DataModule.FDLogin.Params.Values['Password'] := Password;
DataModule.FDLogin.Open;
Result := DataModule.FDLogin.Connected;
```
> [!WARNING]
> This indicates that **every single application user possesses a native SQL Server database login**. This architectural pattern leaks database server access, creates high administrative overhead in SQL Server, and restricts user directory modernization (e.g. integrating Azure AD or Single Sign-On).
>
> A deep-dive audit of the database stored procedures reveals **how this is provisioned** and exposes a **severe privilege escalation vulnerability**. The stored procedure `sp_inclui_login` (called by `PGSM016.pas` in the legacy `ddbroker` module when creating or updating users) executes the following commands:
>
> ```sql
> EXEC sp_addlogin @usuario, @senha, @defdb = 'BROKER'
> EXEC sp_addrolemember 'db_owner', @usuario
> EXEC sp_addsrvrolemember @usuario, 'securityadmin'
> ```
>
> It then duplicates this database ownership across **8 other databases** on the SQL instance:
> ```sql
> EXEC master.sys.SP_ADDUSER @usuario
> EXEC master.sys.sp_addrolemember 'db_owner', @usuario
> EXEC MYINDAIA.sys.SP_ADDUSER @usuario
> EXEC MYINDAIA.sys.sp_addrolemember 'db_owner', @usuario
> EXEC MYCUBE.sys.SP_ADDUSER @usuario
> EXEC MYCUBE.sys.sp_addrolemember 'db_owner', @usuario
> EXEC MYINTTRA.sys.SP_ADDUSER @usuario
> EXEC MYINTTRA.sys.sp_addrolemember 'db_owner', @usuario
> EXEC MYLOGIN.sys.SP_ADDUSER @usuario
> EXEC MYLOGIN.sys.sp_addrolemember 'db_owner', @usuario
> EXEC MYMONEY.sys.SP_ADDUSER @usuario
> EXEC MYMONEY.sys.sp_addrolemember 'db_owner', @usuario
> EXEC suporte.sys.SP_ADDUSER @usuario
> EXEC suporte.sys.sp_addrolemember 'db_owner', @usuario
> EXEC tempdb.sys.SP_ADDUSER @usuario
> EXEC tempdb.sys.sp_addrolemember 'db_owner', @usuario
> ```
>
> > [!CAUTION]
> > **Critical Security Vulnerability:** By granting the `securityadmin` server-level role and `db_owner` database-level permissions on almost all database schemas to **every single active user**, the system violates the principle of least privilege. Any user with a basic login can connect directly to the SQL Server port (1433) and create, delete, or modify server logins, reset administrator passwords, or directly query/alter any client's sensitive logistics and financial data.

### B. Hardcoded Secrets and Credentials
A technical audit of source files revealed multiple hardcoded credentials and secret keys committed directly into version control:
1.  **SQL Server Admin Credentials**:
    *   `logon.asp` (Classic ASP): Contains `call subConectaBroker(SQLSERVER,"BROKER","sa","123")` which uses the database administrator `sa` account with a simple password `"123"`.
    *   `logout.asp` (Classic ASP): Contains hardcoded credentials `"MYINDAIAWEB" / "myindaiaweb"`.
    *   `DmBroker.dfm` (REST API): Contains hardcoded credentials `User_Name=SA` and `Password=123`.
2.  **API Tokens and Secret Keys**:
    *   `MyWebApi` & `TMService` JWT Secret: Hardcoded to `'2d013705c915'` across several files (`ServiceImpl.pas`, `TMServiceApiImpl.pas`, `UnitLoginMain.pas`).
    *   `PortalUnicoWebhook` secret: Hardcoded to `'7eym0TScxh6JnRQ7Uz0ozSVlwGpsvVkP'`.
    *   `ApiProxyPortalUnico` secret: Hardcoded to `'2x3K8V7dXQmQ9p4Rz6Lh8B1jFs9Wc0Y2'`.

### C. Senior ERP Web Service Credentials
The bank reconciliation module (`mybaixaautomaticawallet` -> `ConnectionModuleV2.pas`) connects to Senior ERP SOAP web services using hardcoded system credentials:
```pascal
USER_SENIOR       = 'UserWS';
PASSWORD_SENIOR   = 'UserWsIndaia';
```
> [!CAUTION]
> These credentials grant read/write administrative access to critical financial tables within the Senior ERP system (allowing tasks like modifying orders, releasing payments, and deleting credits). Having them hardcoded exposes the entire corporate ERP system to security breaches.

### D. Client Certificates Bound to Individuals
In `myindaia-robodue-6c5ee2fa00fa/IntegracaoDue.pas`, client certificate `.pem` and `.key` loading is mapped directly to specific customs brokers:
```pascal
if LocalSettings.CdDespachante = '042' then vNomeCertificado := 'Vanessa';
if LocalSettings.CdDespachante = '027' then vNomeCertificado := 'Mello';
if LocalSettings.CdDespachante = '028' then vNomeCertificado := 'Cristiano';
if LocalSettings.CdDespachante = '001' then vNomeCertificado := 'Fabricio';
// ...
FIOHandler.SSLOptions.CertFile := GetLocalPath +'certificado\'+ vNomeCertificado+'.pem';
```
> [!IMPORTANT]
> The automation relies on individual physical brokers' credentials. If a broker leaves the company, code changes are required to remove/redirect their certificates.

### E. Disabled Background CSRF Token Renewal Thread
The background thread responsible for keeping proxy authorization tokens alive (`TRenovadorCSRFThread` in `uRenovadorCSRF.pas`) has been completely commented out and is disabled in `Server.pas`:
```pascal
//RenovadorCSRF: TRenovadorCSRFThread;
```
This requires proxy callers to handle transaction retry flows on their own when Siscomex returns a token expiration error (usually when a request fails after some minutes of inactivity).

### F. Hardcoded Infrastructure Properties & Technical Debt
*   **IP Addresses**: Croda and AGC integrations use a hardcoded local IP address (`\\192.168.100.5\sftp\...`) to access SFTP directory inputs.
*   **Drive Mounts**: The legacy ASP components are bound to specific Windows drive mappings:
    *   `H:\DDBROKER\CONFIG.INI`
    *   `D:\sites\myindaia\engine\config_myCOM.ini`
    *   `C:\sites\myteste\engine\config_myCOM.ini`
*   **Legacy BDE Engine**: The `myindaia-edi` module relies on the obsolete **Borland Database Engine (BDE)** from the late 90s, introducing performance bottlenecks and compatibility limitations on modern Windows Server operating systems.
*   **Lack of Database-Level Referential Integrity**: The core `BROKER` database contains 1,204 tables but defines only 187 database-level relationships (foreign keys). This indicates that referential integrity is delegated entirely to the Delphi client application code. Bypassing the client applications to make direct updates increases the risk of orphaned records, data corruption, and database inconsistencies.
*   **Trigger Bypass Mechanisms (`TFOLLOWUP_IGNORE_TRIGGERS`)**: Triggers on critical tracking tables (such as `TR_FOLLOWUP` and `TR_ALERTA_ENVIADO`) check the `TFOLLOWUP_IGNORE_TRIGGERS` table. If the process and database session (`@@SPID`) match a registered row, the trigger bypasses its business calculations and exits. While designed to prevent recursive loops or allow fast batch updates, this pattern creates a risk where business events and status calculations are silently skipped if a session key is orphaned.

### G. Repository Hygiene & Code Base Bloat
*   **Large Binaries**: A 122MB installer archive `ER_Studio_8.0.3.rar` is checked directly into the legacy web app folder.
*   **DLL Commits**: Compiled ActiveX DLLs (`MyCOM.dll`, `MyCOM_03082015.dll`) are checked directly into the web application's executable/engine directories.

---

