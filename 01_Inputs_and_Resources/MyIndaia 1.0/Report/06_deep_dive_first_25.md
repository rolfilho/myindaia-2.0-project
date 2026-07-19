## 7. Deep-Dive Module Scan — First 25 Folders (HIGH Priority)

This section documents findings from the deep-dive audit of the 12 highest-priority modules from the initial codebase scan. These modules were previously catalogued in Section 1 but not individually audited. Sections 7.1–7.12 follow the same format as Section 4.

---

### 7.1 `myindaia-mywebapi-78aadf88fac7` — Main REST API Server

**Purpose:** TMS Sparkle/XData REST API server. The platform's central backend — exposes process tracking, document downloads, and user authentication to all client applications. Runs as a VCL GUI application on Windows.

**Key files:** `DmBroker.pas/dfm`, `ServiceImpl.pas`, `ServiceIntf.pas`, `Security.pas`, `Form.Main.pas`, `Modules.FileListing.pas`

##### SA/123 in DFM — CRITICAL
`DmBroker.dfm` lines 7–12 and 213–220: two separate connection components (`Connection` and `FDLogin`) both bake `User_Name=SA`, `Password=123`, `Server=indaia10` into the compiled binary resource.

##### JWT Secret — CRITICAL
`ServiceImpl.pas:72`:
```pascal
JWT_SECRET = '2d013705c915';
```
12-character lowercase hex — 48 bits of entropy, far below the HMAC-SHA256 256-bit minimum. Notably, the suffix of the XData interface GUID at `ServiceIntf.pas:362` (`'{04C730EC-8E63-41A5-87C1-2D013705C915}'`) mirrors this constant — the JWT secret was derived from or mirrors the GUID.

##### JWT Has No Expiry — HIGH
`ServiceImpl.pas:174–189`: the JWT builder does not set `ExpirationTime`, `IssuedAt`, or `NotBefore` claims. Tokens are valid forever once issued.

##### CORS Wildcard — HIGH
`Form.Main.pas:121`:
```pascal
Module.AccessControlAllowOrigin := '*';
```
Any web origin can make authenticated API calls against the REST API.

##### File Listing Module — Path Traversal Risk — HIGH
`Modules.FileListing.pas` serves the UNC share `\\indaiaweb\digitalizacao_novo\TPROCESSO\` over HTTP. Path obfuscation uses `Crypt()` from `Security.pas` — a single XOR pass with key `'MYINDAIA'` plus a random-offset prefix. This is trivially reversible. After XOR decode there is no `..` traversal check — an attacker may escape the base directory. Any valid JWT holder can download any document.

##### Hardcoded Paths / Servers
- `Form.Main.pas:82–88`: `\\indaiaweb\digitalizacao_novo\TPROCESSO\` (production document store UNC path)
- `DmBroker.pas:57`: `'INDAIA10'` set in code (in addition to DFM)
- `MyWebApi.dpr:36`: commented-out developer path `'E:\Digitalizacao\'`

##### Auth Flow
Login POSTs username + password → `ValidaLogin` opens `FDLogin` SQL Server connection using user's credentials directly → if connection succeeds, JWT minted with `TJOSE.SHA256CompactToken(JWT_SECRET, JWT)`. No application-layer password hashing; SQL Server error 18456 (wrong password) is surfaced verbatim to API callers.

##### Other
- `Security.pas:37`: `Application.ProcessMessages` called inside per-character XOR loop — race condition risk if called from a thread
- `Security.pas:85–91`: dead `Unit1` fragment appended after `end.` — indicates copy-paste sloppiness

---

### 7.2 `myindaia-mylogin-437606203177` — Desktop SSO Credential Manager

**Purpose:** Windows system-tray SSO application (`MyLogin.exe`). Authenticates users against `MYLOGIN` SQL Server database; broadcasts credentials to other desktop applications via `WM_COPYDATA` IPC. Source of `MyLoginInt.dll`.

**Key files:** `Principal.pas`, `uConexao.pas/dfm`, `Mensagens.pas`, `Funcoes.pas`, `Sistemas.pas`, `DashBoardUserProperties.pas/dfm`

##### WM_COPYDATA Password Exfiltration — CRITICAL
`Principal.pas:506–603` (`MsgWM_COPYDATA`): on receiving `_USER_PW` via `WM_COPYDATA`, `ResponderMensagem` sends the **cleartext SQL Server password** back to the requesting window handle. **There is no sender authentication.** Any process on the same desktop session can:
1. `FindWindow('TfrmMyLogin', nil)` — get the window handle
2. Send `WM_COPYDATA` with payload `'_USER_PW'`
3. Receive the logged-in user's plaintext SQL Server password

##### Password Change Emails Old + New Passwords in Plaintext — CRITICAL
`Principal.pas:429–433`: on successful password change, CDO sends an email to `myindaia@myindaia.com.br` containing both the old and new passwords in plaintext HTML body.

##### SQL Injection on SA-Level Connection — CRITICAL
`uConexao.pas:649–652` (`VerificaUsuarioBloqueado`):
```pascal
'WHERE AP_USUARIO = ''' + Nm_Usuario + ''''
```
`Nm_Usuario` comes from the login form. No parameterisation. The query runs via `ConnectionBroker` which uses `SA/123`.

##### SA/123 in Multiple Locations — CRITICAL
- `uConexao.dfm:181–192`: SA/123 in ADO `ConnectionString` with `Use Encryption for Data=False` explicit
- `uConexao.dfm:637`: SA/123 in `ConnectionBroker` (TSQLConnection for BROKER)
- `uConexao.pas:352–362` (`AlteraSenhaServidor`): SA/123 hardcoded **in source** — called with both `'INDAIA10'` and `'ANTUERPIA'`

##### User Password Passed as CLI Argument — HIGH
`Sistemas.pas:119–126`: when launching a system with `:NM_SENHA` in its registered path, the user's SQL Server password is substituted as a command-line argument — visible in Task Manager, process listings, and event logs.

##### Broken Password History Cipher — MEDIUM
`Funcoes.pas:242–268` (`Criptografa`): encryption uses key `128`; decryption uses key `CD_USUARIO`. Asymmetric — encrypt and decrypt do not round-trip. Password reuse checks against `TB_USUARIO_SENHAS` silently succeed for any old password.

##### SQL Injection in Password History — MEDIUM
`uConexao.pas:320`: `INSERT INTO TB_USUARIO_SENHAS` built with string concatenation using `Criptografa()` output — no parameterisation.

##### DataSnap Dashboard — Hardcoded Credentials + No Encryption — MEDIUM
`DashBoardUserProperties.dfm:23–25`: `User_Name=MyLogin`, `Password=123`, `HostName=INDAIAWEB`, `Port=9876`, `CommunicationProtocol=tcp/ip`, no encryption filter — plaintext TCP.

##### Production Usernames in DFM — MEDIUM
`DashBoardUserProperties.dfm:51–53`: default parameter value contains real production usernames: `Nestle_Teste;Nestle;mairlon.macedo;cebrace;whirlpool.exp;whirlpool.imp;Nestle2;carol.abril;abril.imp` — committed to version control.

##### Hardcoded Absolute Paths
- `Principal.pas:314`: `\\INDAIA08\AplicClient\MySenhas` (UNC network share)
- `Sistemas.pas:15–17`: `C:\DDBROKER\SuporteMy.exe`, `C:\DDBROKER\MySenhas\MySenhas.exe`, `C:\DDBROKER\myInterDoc\myInterDoc.exe`
- `Sistemas.pas:79`: `LoadLibrary('C:\DDBROKER\Interpreter.dll')` — absolute path DLL load (DLL hijack surface)
- `Sistemas.pas:200–204`: `C:\DashBoard\DashBoard.exe`, `C:\DashBoard\Financeiro\DashBoard.exe`

---

### 7.3 `myindaia-mybaixaautomaticawallet-8e692039b4d2` — Bank Reconciliation (Senior ERP SOAP)

**Purpose:** Timer-driven reconciliation engine. Matches open BROKER invoices against Senior ERP accounts receivable/payable via SOAP web services. Writes settlement records back to both databases.

**Key files:** `ConnectionModuleV2.pas/dfm`, `DmBroker.dfm`, `uWalletWSDL_*.pas` (WSDL-generated proxies)

##### Senior ERP Hardcoded Credentials — CRITICAL
`ConnectionModuleV2.pas:243–244`:
```pascal
USER_SENIOR     = 'UserWS';
PASSWORD_SENIOR = 'UserWsIndaia';
```
Used in 9 distinct SOAP call sites: `GravarPedidos`, `ConsultarTituloCR`, `ConsultarTituloCP`, `SubstituirTitulos`, `EntradaTitulosCP`, `EntradaTitulosBapAdtCR`, `entradaTitulosCR`, `ExcluirTitulosCR`, `ExcluirInstrucoesBancarias`. These credentials control AR/AP read-write access to the entire ERP financial system.

##### SA/123 on Both Production Databases — CRITICAL
- `ConnectionModuleV2.dfm:8–11`: `User_Name=sa`, `Password=123`, `Server=indaia10`, `Database=MYINDAIAV2`
- `DmBroker.dfm:45–48`: `User_Name=SA`, `Password=123`, `Server=INDAIA10`, `Database=BROKER`

##### WSDL Endpoint — Internal Server Name
`uWalletWSDL_Pagamentos_novo.pas:4`: `http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos?wsdl` — internal hostname `senior` hardcoded in WSDL source comments. SOAP over plain HTTP (port 8080).

##### Production vs Homologation Detection — MEDIUM
`ConnectionModuleV2.pas:291`: `Instance.Producao := ServerName <> 'Antuerpia'` — production mode is the default; passing `'Antuerpia'` as the server name disables production writes. No config flag — entirely dependent on server name matching.

---

### 7.4 `myindaia-edi-94a307a60612` — Legacy EDI Integration (BDE)

**Purpose:** Legacy Windows VCL robot (1.6MB `Main.pas`, circa 2008–2011). Parses partner shipping logs (Nestlé, Pirelli, Garoto, Purina, Cargil), generates follow-up emails, and transmits EDI documents. Built entirely on Borland Database Engine (BDE).

**Key files:** `Main.pas` (1.6MB), `CONFIG.INI`, `uGeraRelatorio.pas`, Excel templates in `bin/`

##### BDE MYROBO/123 — Repeated 6+ Times — CRITICAL
`Main.pas` lines 978–979, 1007–1008, 7877–7878, 7878–7879, 8298–8299, 8522+:
```pascal
db_broker.Params.Add('USER NAME=MYROBO');
db_broker.Params.Add('PASSWORD=123');
```
Same service account `MYROBO/123` as `edi_eventos` (§4.10). BDE has not received security patches since Delphi 7 era.

##### CONFIG.INI — Different Server and Database Name
`CONFIG.INI`:
```ini
[DATABASE]
SERVERNAME=FSNT-BROKER
DATABASENAME=INDAIA
SMTP=172.19.8.55
[CLIENTE]
EMPRESA=Tito Cademartori
```
Server `FSNT-BROKER` and database `INDAIA` differ from the rest of the platform (`INDAIA10` / `BROKER`) — likely an older server alias still operational. Raw SMTP relay IP `172.19.8.55` (no hostname). Client name `Tito Cademartori` leaked in config.

##### Hardcoded Paths — HIGH
- `Main.pas:3553`: `'C:\Transfer_Price_' + vStrGrupo + '_' + ...` — temp file on C:\
- `Main.pas:14530`: `'H:\DDBROKER\DOCUMENTOSEDI\' + BuscaNomeArq(...) + '...'`
- `Main.pas:20921`: `'H:\DDBroker\DocumentosWORD\tmpTESTE_LINK.doc'`
- Nestlé contact email hardcoded in email body: `br_exports@br.nestle.com`

##### Partner Scope
Excel templates committed to `bin/`: Nestlé, Pirelli, Garoto, Purina, Cargil/SAP, Minalba, Philips, Prometeon, SAHY — reveals full B2B EDI partner list.

---

### 7.5 `myindaia-consultamercante-4ea2cc4e1db6` — Mercante Cargo Register Scraper

**Purpose:** IE `TWebBrowser` automation that scrapes marine cargo register (CE Mercante) data from `mercante.transportes.gov.br`, matches records against BROKER processes by CNPJ, and upserts into the database.

**Key files:** `uMain.pas`, `DmBroker.dfm`, `dwba/src/Navigator.WebBrowser.pas`

##### SA/123 in DFM — CRITICAL
`DmBroker.dfm:77–80`: `User_Name=SA`, `Password=123`, `Server=INDAIA10`, `Database=BROKER`.

##### IE Automation — State Machine
Navigation targets:
- `https://www.mercante.transportes.gov.br:1443/g33159MT/jsp/LogonCertificado.jsp` — PKI cert login
- `https://www.mercante.transportes.gov.br/g36127/servlet/serpro.si...` — CE data query

JS injection via `Navigator.WebBrowser.pas:172` (`IHTMLDocument2.parentWindow.execScript`) and frame-level injection via `Navigator.WebBrowser.pas:184` (`Doc.frames.item(IndexFrame).execScript`). Fields filled: `DtConsulta`, `CnpjCpfConsignatario` — CNPJ injected directly into form field via JS. Query triggered via `document.getElementById('Enviar').click()`.

**Data written:** `CE_Mercante` fields into BROKER tables; divergences logged via `ProcessarDivergenciasMercante`.

---

### 7.6 `myindaia-myextratodue_chrome-739514f9fe5f` — DU-E PDF Extractor (Chromium)

**Purpose:** CEF4Delphi Chromium automation extracting DU-E (export declaration) PDFs from Portal Único. Parallel to `myextratoduimp` (§4.11, import side).

**Key files:** `DmBroker.pas/dfm`, `uMiniBrowser.pas`, `uPreferencias.pas`

##### SA/123 + `Connected=True` in DFM — CRITICAL
`DmBroker.dfm:8–13`: `User_Name=SA`, `Password=123`, `Server=INDAIA10`, `Database=BROKER`, `Connected=True` — connection auto-opens on form creation.

##### Hardcoded User Code + Object ID — MEDIUM
`DmBroker.pas:191`:
```pascal
qryBroker.ParamByName('CD_USUARIO_CRIACAO').Asstring := '0707'; //Departamento de Software
```
`DmBroker.pas:139`: `TabelaId := 1652005462` — same pattern as `myextratoduimp` (§4.11).

##### JS/CEF IPC Pattern — Same as myextratoduimp
`uMiniBrowser.pas:464–465`:
```javascript
'var vnmdue = document.getElementById("nrdue");'
'console.log("PGConsDUE|" + vnmdue)'
```
`console.log("KEY|VALUE")` used as IPC channel. Portal URL: `https://portalunico.siscomex.gov.br/due/x/#/consulta/consulta`. PDF via CEF print API (`MINIBROWSER_PDFPRINT_END` WM_APP message). Button selector: `p-button[label="Gerar PDF Simplificado"]`.

**Tables written:** `TPROCESSO_DOCTOS` (document type `164`), `TFOLLOWUP`.

---

### 7.7 `myindaia-apiproxyportalunico-5138de81934b` — Portal Único mTLS Proxy

**Purpose:** Sparkle HTTP gateway that centralizes mTLS authentication to Portal Único (Siscomex) for all calling modules. Per-broker client certificate management.

**Key files:** `Server.pas`, `uAutenticacao.pas`, `uCacheAutenticacao.pas`, `uRenovadorCSRF.pas`, `DataModule.dfm`, `bin/ApiProxyPortalUnico.ini`

##### Proxy Secret Hardcoded in Source — CRITICAL
`Server.pas:46`:
```pascal
SECRET_KEY = '2x3K8V7dXQmQ9p4Rz6Lh8B1jFs9Wc0Y2';
```
Same secret consumed by `integracaoduimp` (§4.15). Shared single secret across all callers.

##### SA/123 on Homologation Server — HIGH
`DataModule.dfm:7–10`: `User_Name=SA`, `Password=123`, `Server=ANTUERPIA` — DFM defaults to the homologation server. If `ApiProxyPortalUnico.ini` is missing, the proxy connects to the wrong database.

##### TLS Server Verification Disabled — HIGH
`uAutenticacao.pas:297`:
```pascal
SSL.SSLOptions.VerifyMode := [];  // sem validação ativa de servidor
```
All outbound mTLS calls to Portal Único skip server certificate chain verification.

##### Per-Broker PEM Certificates — HIGH
`uAutenticacao.pas:238`: `CaminhoPem := TPath.Combine(GetLocalPath + 'certificados', Despachante + '.pem')`. PEM files named after brokers (`edgar.pem`, etc.) — no passphrase protection referenced in code. `bin/ApiProxyPortalUnico.ini` hardcodes `DespachantesIniciais=edgar`.

##### CSRF Renewal Thread Disabled — HIGH
`Server.pas:42`:
```pascal
//RenovadorCSRF: TRenovadorCSRFThread;
```
Background CSRF token renewal is commented out. Callers must handle token expiry retries themselves. `uRenovadorCSRF.pas` is a UTF-16 file (unreadable as UTF-8) — suggests it was developed on a different encoding context.

##### TLS Version — Acceptable
`uAutenticacao.pas:201, 290`: `SSLVersions := [sslvTLSv1_2]` — TLS 1.2 only (best practice in this codebase).

---

### 7.8 `myindaia-myindaia-web-138a956541b9` — Legacy Classic ASP Customer Portal

**Purpose:** Legacy IIS/Classic ASP customer portal. Direct consumer of `MyCOM.dll` via `Interop.MyCOM.dll` (COM interop). Handles login, process tracking, and document queries for external clients.

**Key files:** `logon.asp`, `logout.asp`, `autentica.asp`, `includes/inc_utils.asp`, `componentes.asp`

##### Backdoor Password `DOOMDOOM` — CRITICAL
`logon.asp:93`: when the submitted password equals `"DOOMDOOM"`, the code connects directly to `BROKER` as `sa/123` and grants access — a hardcoded SA-level backdoor accessible via the public internet.

##### Hardcoded SMTP Password — CRITICAL
`logon.asp:347–348`:
```vbscript
sendusername = "ti@myindaia.com.br"
sendpassword = "789852"
```
Corporate SMTP account password hardcoded in public-facing ASP source. SMTP server: `smtp-m.myindaia.com.br:587`.

##### SA/123 Embedded in Global Config + Routine Operations — CRITICAL
`includes/inc_utils.asp:39–42`: global constants `SQLSERVER="INDAIA10"`, `SQLUSERNAME="MYINDAIAWEB"`, `SQLPASSWORD="myindaiaweb"` — normal app-level user. However, `sa/123` is invoked in `logon.asp` on every failed login attempt for lockout checks, parameter queries, and password changes — not just error recovery.

##### SQL Injection — HIGH
`logon.asp:110, 157`: `WHERE AP_USUARIO = '"&ap_usuario&"'` — user-controlled input directly concatenated into SQL. No parameterisation. Runs via SA-level connection.

##### Plaintext Password in Session Variable — HIGH
`logon.asp:215`: `Session("senha") = ap_senha` — stores plaintext password in ASP session state.

##### Password Change Emails Old + New in Plaintext — HIGH
Same pattern as `mylogin`: password change email includes both old and new plaintext passwords in HTML body.

##### Other
- `autentica.asp:243`: Comodo trust badge loaded over plain `http://` (mixed content)
- `logon.asp:353`: `if SQLSERVER <> "ANTUERPIA"` reveals second server name in source
- Backup ASP files served from web root: `autentica_BKP.asp`, `default_BKP2.asp`, `default11-03-2008.asp`
- `bin/Interop.MyCOM.dll` and `vbHtmlGridHelper.dll` committed as tracked binaries

---

### 7.9 `myindaia-robodue-6c5ee2fa00fa` — DU-E XML Submitter

**Purpose:** Console-mode Delphi robot that polls BROKER for pending DU-E export declarations and submits XML payloads to Portal Único via mTLS per-broker authentication.

**Key files:** `IntegracaoDue.pas`, `DmBroker.pas/dfm`, `uPreferencias.dfm`

##### SA/123 in DFM — CRITICAL
`DmBroker.dfm:8–12`: `User_Name=SA`, `Password=123`, `Server=INDAIA10`, `Database=BROKER`.

##### AWS SES Credentials in Comments — CRITICAL
`DmBroker.pas:272–274` (commented): `'AKIAIX5BPVHLHQRKEUTA'` / `'ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh'` — fourth occurrence of the same credentials across the codebase.

##### Broker-to-Certificate Mapping — HIGH
`IntegracaoDue.pas:129–135`:

| Broker Code | Certificate Name |
|---|---|
| `003` | `Luiz` |
| `031` | `Edgar` |
| `042` | `Vanessa` |
| `027` | `Mello` |
| `028` | `Cristiano` |
| `001` | `Fabricio` |
| fallback | `LuizHenrique` |

7 unencrypted PEM private key files (`*.key`) stored on disk with no passphrase protection.

##### SSLv2/SSLv3 + VerifyMode=[] — HIGH
`IntegracaoDue.pas:150–152`: `SSLVersions := [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]` — broken protocols enabled. `VerifyMode := []` — server cert verification disabled on all Siscomex API calls.

---

### 7.10 `myindaia-criaxmlnfe-dd42da703585` — NF-e XML Invoice Generator

**Purpose:** Desktop tool generating government-compliant NF-e (Nota Fiscal Eletrônica) XML files from BROKER data using the ACBr fiscal library.

**Key files:** `uDmNFe.pas/dfm`, `uNFeService.pas`, `uFrmNFe.pas`

##### SA/123 in DFM — CRITICAL
`uDmNFe.dfm:8–12`: `User_Name=sa`, `Password=123`, `Server=indaia10`, `Database=broker`.

##### Production Mode Default — MEDIUM
`uDmNFe.pas:69` (commented):
```pascal
//ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;
```
Homologação disabled by commented line — default is production (SEFAZ live environment). Any test run submits real fiscal documents.

##### Hardcoded NF-e Output Path + Placeholder Value — MEDIUM
- `uDmNFe.pas:71`: `ACBrNFe1.Configuracoes.Arquivos.PathNFe := 'C:\NFe\XML'` — absolute hardcoded output path
- `uDmNFe.pas:87`: `'DUVIDA' AS ide_nNF` — placeholder string in NF-e number field; will cause SEFAZ rejection

##### Three-Part Schema Qualifiers
SQL queries use `BROKER.DBO.*` explicit three-part names — breaks on schema changes.

---

### 7.11 `myindaia-duimpwebhook-487ad54c5769` — DUIMP Government Webhook Listener

**Purpose:** Sparkle HTTP server receiving DUIMP push events from Portal Único. Validates shared secret, deserialises JSON, writes to BROKER database.

**Key files:** `Server.pas`, `DataModule.dfm`, `Controle.pas`, `bin/PortalUnicoWebhook.ini`, `bin/chave.txt`

##### Webhook Secret Hardcoded + Written to Disk — CRITICAL
`Server.pas:84`:
```pascal
SECRET_KEY = '7eym0TScxh6JnRQ7Uz0ozSVlwGpsvVkP';
```
`bin/chave.txt` is overwritten on **every incoming request** with the `secret` header — **before** the secret is validated (`Server.pas:247` before `:253`). An unauthenticated request with a spoofed secret will write to `chave.txt`. Anyone who can read this file can extract the current secret.

##### SA/123 on Homologation Server — CRITICAL
`DataModule.dfm:7–11`: `User_Name=SA`, `Password=123`, `Server=ANTUERPIA` — same DFM-defaults-on-wrong-server issue as `apiproxyportalunico`. Runtime INI fallback: `Ini.ReadString('Database', 'Server', 'INDAIA10')`.

##### Plain HTTP Endpoint — HIGH
`bin/PortalUnicoWebhook.ini`: `URL=http://+:2001/webhook/portalunico` — no TLS. Government webhook payloads arrive unencrypted if no reverse proxy is in front.

##### Silent DB Error Swallowing — MEDIUM
`Server.pas:329–330`: `StartTransaction`/`Commit`/`Rollback` block was removed (commented out). DB writes are non-atomic — a crash mid-insert leaves orphaned `DuimpPush` without `DuimpPushDetalhe` rows.

---

### 7.12 `myindaia-tmserviceapi-9e2444cd2801` — Carrier Tracking API Service

**Purpose:** Windows XData service ingesting carrier and customs broker tracking spreadsheet data into the `TM` database via REST. Includes `Token.dpr` — a helper tool for minting JWTs.

**Key files:** `TMServiceApiImpl.pas`, `TMDataModule.dfm`, `TMWidowsService.pas`, `UnitLoginMain.pas`, `Utils.pas`

##### JWT Secret — Identical to mywebapi — CRITICAL
`TMServiceApiImpl.pas:47` and `UnitLoginMain.pas:50`:
```pascal
JWT_SECRET = '2d013705c915';
```
Same 48-bit secret as `mywebapi` (§7.1). Both the service and the token generator tool commit this secret in source — extractable with `strings` from either binary.

##### SA/123 in DFM + INI Defaults — CRITICAL
- `TMDataModule.dfm:7–11`: `User_Name=SA`, `Password=123`, `Server=ANTUERPIA`, `Database=TM`
- `TMWidowsService.pas:66–67`: `Ini.ReadString('Database', 'User_Name', 'SA')`, `'Password', '123'` — hardcoded fallback defaults if `.ini` absent

##### Hardcoded Audit Trail User ID — MEDIUM
`TMServiceApiImpl.pas:318–320`:
```sql
INSERT INTO PLANILHAS_TRANSPORTADORAS (ID_USUARIO, DT_PLANILHA) VALUES(1, getdate())
```
Authenticated user ID is received as a parameter but the INSERT uses literal `1`. All spreadsheet ingestion events are attributed to user ID 1 — audit trail is permanently broken.

##### CORS Wildcard — MEDIUM
`TMWidowsService.pas:117`: `Module.AccessControlAllowOrigin := '*'` — same issue as `mywebapi`.

##### Singleton Init Race — LOW
`TMDataModule.pas`: `FireDacMSSQL()` factory sets `Server=INDAIA10` but does not set credentials — if initialized before `LoadConfig`, connects with DFM defaults (`SA/123` against `ANTUERPIA`).

---

### 7.13 Consolidated Findings — HIGH-Priority Batch

#### New Credentials Discovered

| Credential | Value | Module |
|---|---|---|
| SMTP corporate password | `789852` | `myindaia-web` / `logon.asp:348` |
| DataSnap dashboard | `MyLogin / 123` | `mylogin` / `DashBoardUserProperties.dfm:24` |
| App-level DB user | `MYINDAIAWEB / myindaiaweb` | `myindaia-web` / `inc_utils.asp:41–42` |
| Senior ERP SOAP (confirmed) | `UserWS / UserWsIndaia` | `mybaixaautomaticawallet` / `ConnectionModuleV2.pas:243–244` |
| AWS SES (4th occurrence) | `AKIAIX5BPVHLHQRKEUTA` | `robodue` / `DmBroker.pas:272` |
| JWT secret (confirmed ×2) | `2d013705c915` | `mywebapi`, `tmserviceapi` |
| Portal Único proxy secret (confirmed) | `2x3K8V7dXQmQ9p4Rz6Lh8B1jFs9Wc0Y2` | `apiproxyportalunico` / `Server.pas:46` |
| DUIMP webhook secret | `7eym0TScxh6JnRQ7Uz0ozSVlwGpsvVkP` | `duimpwebhook` / `Server.pas:84` |
| Backdoor password | `DOOMDOOM` (→ sa/123) | `myindaia-web` / `logon.asp:93` |

#### New Architectural Issues (not in prior scan)

| Issue | Severity | Modules |
|---|---|---|
| WM_COPYDATA zero-auth password exfiltration | CRITICAL | `mylogin` |
| Public backdoor `DOOMDOOM` → SA access | CRITICAL | `myindaia-web` |
| JWT tokens never expire (`exp` claim absent) | HIGH | `mywebapi` |
| Password change emails old+new in plaintext | HIGH | `mylogin`, `myindaia-web` |
| SQL injection on login path (SA-level connection) | HIGH | `mylogin`, `myindaia-web` |
| User password passed as CLI argument to child processes | HIGH | `mylogin` |
| File listing: XOR-only obfuscation, no traversal check | HIGH | `mywebapi` |
| Webhook secret written to disk before auth validation | HIGH | `duimpwebhook` |
| Webhook HTTP (no TLS) | HIGH | `duimpwebhook` |
| Audit trail permanently broken (ID_USUARIO = 1) | MEDIUM | `tmserviceapi` |
| Production NF-e default (homologação disabled) | MEDIUM | `criaxmlnfe` |
| Password history cipher asymmetric (encrypt ≠ decrypt) | MEDIUM | `mylogin` |
| CORS wildcard on REST API and carrier API | MEDIUM | `mywebapi`, `tmserviceapi` |
| Real customer usernames committed in DFM | MEDIUM | `mylogin` |

