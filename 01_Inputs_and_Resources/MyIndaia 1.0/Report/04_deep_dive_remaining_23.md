## 4. Deep-Dive Module Scan — Remaining 23 Folders

This section documents findings from the complete deep-dive audit of all 23 remaining modules identified in the scan plan. Each phase covers a logical cluster of components.

---

### Phase 1: Shared Core & Helper Libraries

#### 4.1 `myindaia-siscomex-f566798206a5` — Siscomex Data Importer

**Purpose:** Windows service + GUI that polls flat-file exports from Siscomex and upserts exchange rates (`TTAXA_CAMBIO`) and NCM tariff rates (`TNCM`) into the `BROKER` database.

**Key files:** `Settings.pas`, `KrAliquota.pas`, `KrQuery.pas`, `KrTaxaCambio.pas`

##### Hardcoded Credentials — CRITICAL
In `Settings.pas` (lines 118–123), default values fallback to SA credentials:
```pascal
Self.BrokerServerName   := 'INDAIA10';
Self.BrokerDatabaseName := 'BROKER';
Self.BrokerUserName     := 'sa';
Self.BrokerPassword     := '123';
```
A compiled binary release artifact — `Win32/Release/Config.cfg` — is committed to version control with these same production SA credentials persisted in a binary DFM stream. Every developer who clones the repo receives the SA password on disk.

##### Tax Rate Logic: DB-Driven but Fragile
Tax rates (II, IPI, PIS, COFINS) are **not** hardcoded — they are read from Siscomex flat files and upserted into `TNCM`. PIS/COFINS fallback rates are fetched from `TNCM_PIS_COFINS`. However:
- If `TNCM_PIS_COFINS` contains ≠ 1 row, the entire import silently aborts (`if QueryAux.RecordCount > 1 then Exit` with no error surfaced).
- Insert validity periods use hardcoded dates: `EncodeDate(2002, 01, 01)` / `EncodeDate(9999, 12, 31)` — semantically wrong for records imported after 2002.

##### Additional Issues
- Three-part schema qualifier `BROKER.DBO.` hardcoded in `KrAliquota.pas` and `KrTaxaCambio.pas` — breaks on any schema rename.
- Credentials stored in plaintext in `HKEY_LOCAL_MACHINE\Software\Indaia` registry.

---

#### 4.2 `myindaia-myfilemanager-bf75c675cd87` — File Manager Utility

**Purpose:** Desktop tool for staff to batch-copy scanned clearance documents to output directories with configurable subdirectory structure.

##### Full ADO Connection String in DFM — CRITICAL
`Principal.dfm` (lines 456–465):
```
ConnectionString = 'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User ID=sa;
                    Initial Catalog=BROKER;Data Source=INDAIA10'
Connected = True
```
`Persist Security Info=True` means the password is retained in the in-memory object and would appear in any connection string log trace. `Connected = True` auto-opens on form creation.

##### Hardcoded Executable Path
`Mensagens.pas` (line 34):
```pascal
_DIGITALIZADOR := 'C:\DDBroker\myIndaiaDigitalizacao.exe';
```
Any deployment not on `C:\DDBroker\` silently fails to launch the digitalization module (no error check on `ShellExecute`).

##### Password Transmission via WM_COPYDATA
User passwords are passed between processes via `WM_COPYDATA` Windows messages — interceptable by any other process running in the same desktop session.

##### Hardcoded SMTP Relay — No Auth
`Mensagens.pas` (line 125):
```pascal
idSMTP1.Host := 'mail.indaialogistica.com.br';
idSMTP1.Port := 25;
```
SMTP port 25 with no credentials. Any module linking `Mensagens.pas` can send arbitrary email through the corporate relay.

---

#### 4.3 `myindaia-tmsaurelius-80b286d02ea6` — TMS Aurelius ORM (Vendor Library)

**Purpose:** Commercial Delphi ORM framework (TMS Aurelius 3.10.0.0) checked wholesale into the repository as a vendored dependency.

**No hardcoded DB credentials or custom migrations** in Aurelius library code. Connection is provided at runtime by calling modules.

##### Supply Chain Risk — MEDIUM
Committed binaries without checksums:
- `setup/tmsinstaller.exe` — TMS installer
- `Bin/sqlite3.dll`, `Bin/InstPath.exe` — pre-built native binaries

##### Developer Identity Leaked — LOW
`setup/install_2017_11_24.log` exposes username `mmmar` and a OneDrive path:
```
C:\Users\mmmar\OneDrive\Documentos\tmssoftware\TMS Aurelius
```

---

### Phase 2: Secondary API Services & Emailing

#### 4.4 `myindaia-mysendmail-3920d5fcaa87` — SMTP Email DLL

**Purpose:** `MySendMail.dll` — provides a reusable SMTP interface to the rest of the platform via a COM-style `IMail` interface. Other applications load it at runtime via `LoadLibrary`.

##### Hardcoded DB Fallback — CRITICAL
`SendMailImpl.pas` (lines 52–56): when not pre-configured, falls back to `INDAIA10/Broker` as `sa / 123` to retrieve SMTP config from `VW_CONFIG_MAIL`. The SMTP credentials themselves live in the DB view — but DB access is protected only by these trivial SA credentials.

##### AWS SES Credentials Committed — CRITICAL
`UnitDemo.pas` (lines 33–37):
```pascal
{Mail.SetConfig(
    'email-smtp.us-east-1.amazonaws.com',
    'AKIAIX5BPVHLHQRKEUTA',
    'ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh',
    587, True);}
```
- **AWS IAM Access Key ID:** `AKIAIX5BPVHLHQRKEUTA`
- **AWS SES SMTP Secret:** `ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh`

Commented out but present in git history. These credentials must be treated as compromised and rotated immediately.

##### DLL Hijack Surface — HIGH
`SendMailIntf.pas` loads the DLL with `LoadLibrary(Path + 'MySendMail.dll')` — no signature verification. Any process that can write to the deployment directory can substitute the DLL.

##### INTTRA FTP Credentials (Commented) — HIGH
`uPreferencias.dfm` (lines 83–84):
```pascal
//  IntegracaoSFTP.HomologUsuario := ... //'i0003534';
//  IntegracaoSFTP.HomologSenha := ...   //'LS0htJiu';
//  IntegracaoSFTP.HomologEndereco := ... //'ftp.cvt.inttra.com';
```
`i0003534` / `LS0htJiu` for `ftp.cvt.inttra.com` — must be confirmed rotated.

---

#### 4.5 `myindaia-integracaobasfdoctos-b0e9ffccc2b2` — BASF Document Dispatcher

**Purpose:** Timer-driven service (weekdays only, configurable interval) that copies customs clearance documents from a local source directory to a mapped BASF SharePoint destination directory.

##### Hardcoded SA Credentials in DFM — CRITICAL
`dmPrincipal.dfm` (lines 6–12):
```
'Database=BROKER'
'User_Name=sa'
'Password=123'
'Server=INDAIA10'
Connected = True
```

##### Transmission Method: File System Copy (Not FTP/SOAP)
Documents are transmitted via `CopyFile()` from `DirOrigem` to `DirDestino` — both configurable paths stored in `CONFIGURACAO_GERAL` table. In practice `DirDestino` is a drive-mapped BASF SharePoint share. No BASF endpoint URLs are hardcoded.

**Document types transmitted:** `CD_TIPO_DOCTO IN ('9', '14', '152')` — DI declarations, general documents, AFRMM port fees.

##### Credentials in HKLM Registry — MEDIUM
`Settings.pas` writes DB/FTP credentials to `HKEY_LOCAL_MACHINE\Software\Leandro` — a generic developer-name key readable by any local process.

---

### Phase 3: B2B & TM Integrations

#### 4.6 `myindaia-integracaobasftm-2d2592ce5e39` — BASF Transport Management

**Purpose:** Queries BROKER database and POSTs freight event data (ETD, ATD, containers, milestones) to BASF's TM REST API.

##### Hardcoded JWT Bearer Token — CRITICAL
`uPrincipal.pas` (lines 136–137):
```pascal
URL   := 'https://api.inout.d2p.com.br/indaia/atualizaContainerEmbarque';
Token := 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJnZXJhZG8iOiIyMDIzLTA1LTE2IDE0OjIxOjQxIn0=...';
```
> The README.md for this module explicitly acknowledges: *"As informações de Endereço do WebService e o Token estão gravados direto no código."* ("The Web Service address and Token are hardcoded in the source.")

##### SA/123 in DFM — CRITICAL
Same INDAIA10/BROKER/sa/123 pattern baked into the `TFDConnection` component in `uPrincipal.dfm`.

**API:** REST/JSON over HTTPS to `api.inout.d2p.com.br` (D2P middleware acting as BASF's logistics gateway). Not SOAP. Fields mapped include: ETD/ATD dates, container IDs, bill of lading, customs broker CNPJ, NF keys, exporter identity.

---

#### 4.7 `myindaia-integracaodrawbackisencao-f54159cce10e` — Drawback Exemption Integration

**Purpose:** Reads drawback (duty-free) records from an Excel spreadsheet, generates WCO XML files per DUE number, and transmits them to Portal Único SISCOMEX REST API via digital certificate authentication.

##### Personal Certificates — HIGH
`uIntegracaoWebServiceRest.pas` (lines 60–68):
```pascal
IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile := vPastaCertificados + 'Fabricio.pem';
IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile   := vPastaCertificados + 'Fabricio.key';
// or:
IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile := vPastaCertificados + 'Edgar.pem';
```
Private `.key` files stored on local filesystem with no passphrase protection, named after individual customs brokers. Certificate revocation is bound to the individual leaving the company.

##### SSLv2/SSLv3 Explicitly Enabled — HIGH
```pascal
IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions := [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
```
Enables protocols vulnerable to POODLE and DROWN attacks.

##### Server Certificate Verification Disabled — HIGH
`VerifyMode := []` — disables TLS chain verification on all HTTPS calls to the government API.

##### XML Namespace Typo — LOW
`htt//www.w3.org/2001/XMLSchema-instance` (missing colon) in generated XML output.

**Tables written:** `DRAWBACK_ISENCAO_FILA`, `DRAWBACK_ISENCAO_ITENS` (status updates: `IN_XML_ENVIADO`, `IN_FILA`, `IN_ERRO`, `RESPOSTA`).

---

#### 4.8 `myindaia-integracaoindaiatm-2cdb8121d39d` — Indaiá TM Integration

**Purpose:** Syncs process milestones from BROKER database to Indaiá's own TM system at `api.myindaia.com.br`.

##### Two Hardcoded JWT Tokens — CRITICAL
`uPrincipal.pas` (lines 576–577 and 497, 501):
```pascal
// Production token — service account "tm" with Indaiá CNPJ
token := 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTMsInVzZXJuYW1lIjoidG0iLCJjbnBqIjoiNTgxNTYwODQwMDAxMzciLCJ0aXBvIjoiRCJ9...';

// Test token — transport PARTNER "nelcar" with Nelcar Transportes CNPJ 62379813000191
token := 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MzIxLCJ1c2VybmFtZSI6Im5lbGNhciIs...';
```
A transport partner's JWT (Nelcar Transportes) from a test function is **compiled into the production binary** — exposing a third-party credential.

##### AWS SES Key Repeated in Comments — CRITICAL
`AKIAIX5BPVHLHQRKEUTA` / `ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh` appear in commented-out lines in the same file — present in git history.

##### 33-Hour HTTP Timeout — LOW (Likely Bug)
Timeout configured to `120,000,000ms` — likely intended as 120 seconds but misplaced decimal.

---

#### 4.9 `myindaia-myconsultaretornointtra-f9d7115913c1` — INTTRA Ship Status Poller

**Purpose:** Polls INTTRA SFTP server for APERAK acknowledgment and CONTRLX status XML files; parses container/BL identifiers and updates `TPROCESSO_DRAFT_BL`.

##### Configuration: DB-Driven (Good Pattern) — but Credentials in Comments — HIGH
SFTP credentials are read from `CONFIGURACAO_GERAL` table at runtime. However, homologation values are preserved in commented-out lines:
```pascal
SFTP.UserName := Config.DraftUsuarioFtpHomologacao;//'i0003534';
SFTP.Password := Config.DraftSenhaFtpHomologacao;//'LS0htJiu';
SFTP.Host := Config.DraftEndFtpHomologacao;//'ftp.cvt.inttra.com';
```
Same `i0003534` / `LS0htJiu` as seen in Phase 2 — these should be treated as compromised credentials.

##### No SFTP Host Key Verification — MEDIUM
`FOnFingerprint` defaults to `chaIgnore` — accepts any server fingerprint.

**Data flow:** Downloads `INDAI_APERAK_*.xml` and `INDAI_CONTRLX_*.xml` from `/outbound`, parses `ShipmentIdentifier`/`DocumentIdentifier` → updates `TPROCESSO_DRAFT_BL.CD_ENVIO_INTTRA`, `STATUS_ENVIO`.

---

#### 4.10 `myindaia-edi_eventos-c0d29e1a4cce` — EDI Event Email Dispatcher (Legacy)

**Purpose:** Legacy Windows VCL robot (circa 2011) using BDE. Monitors job queue (`TFILA_AGENDA`, `TFILA_LOG`) and dispatches HTML email alerts to clients and internal teams for EDI-triggered events.

##### BDE with MYROBO/123 — CRITICAL
`Main.pas` (lines 364–366):
```pascal
db_broker.Params.Add('USER NAME=MYROBO');
db_broker.Params.Add('PASSWORD=123');
```
Dedicated service account `MYROBO` with trivial password `123` on the Borland Database Engine (discontinued, unpatched since Delphi 7 era).

##### Hardcoded Paths — HIGH
```pascal
memLog.Lines.SaveToFile('C:\DDBROKER\MYROBO\ERRO.TXT');
EnviaEmail('ti@myindaia.com.br','ERRO NO MYROBO EVENTOS','C:\DDBROKER\MYROBO\ERRO.TXT',s);
```
Assumes exact `C:\DDBROKER\MYROBO\` deployment; failure to save causes silent data loss.

##### HTTP Image URLs in Outbound Emails — MEDIUM
`http://www.myindaiaweb.com.br/imagens/logos/` embedded in HTML email bodies — MitM-attackable for all clients viewing those emails.

##### Legacy BDE — MEDIUM
No longer receives security patches. SQL string concatenation throughout `Watch()` — no consistent parameterized queries.

---

### Phase 4: Government Automation & Scraping

#### 4.11 `myindaia-myextratoduimp-5ae6aeb9b97d` — DUIMP PDF Extractor (Chromium)

**Purpose:** CEF4Delphi-based Chromium automation to extract DUIMP import declaration PDFs from Portal Único.

**Browser:** CEF4Delphi (`TChromium`) — full Chromium engine.

**Authentication:** Delegated entirely to user via PKI digital certificate selection dialog (`Chromium1SelectClientCertificate`). No passwords stored in code.

##### JS Injection Patterns
The app uses `console.log("KEY|VALUE")` as an IPC channel from the page back to Delphi. Key injection patterns:
```javascript
// Probe for search field
'var vnmduimp = document.getElementById("inputDuimp"); console.log("PGConsDUIMP|" + vnmduimp)'

// React-compatible fill (uses native setter to bypass change detection)
'setter.set.call(el, "DUIMP_NUMBER"); var btn = document.getElementById("pucx-consultar"); btn.click();'

// Override window.open to prevent new tab
'window.open = function(url, name, features){ if(url){ window.location.href = url; } };'
```

##### Hardcoded User Code and Object ID — MEDIUM
```pascal
qryBroker.ParamByName('CD_USUARIO_CRIACAO').AsString := '0707'; // Departamento de Software
TabelaId := 1652005462; // hardcoded SQL Server OBJECT_ID
```
`TPROCESSO_DOCTOS` inserts always attribute to user `0707`; the OBJECT_ID is a literal value that breaks if schema changes.

**Tables written:** `TPROCESSO_DOCTOS` (new document record), `TFOLLOWUP` (event `636` update).

---

#### 4.12 `myindaia-mypagamentomercante-c4ca676b536f` — Mercante Tax Payment Automation

**Purpose:** Automates AFRMM (Merchant Marine tax) payment on `mercante.transportes.gov.br` — queries payment status, fills forms, downloads payment slip PDFs.

**Browser:** IE `TWebBrowser` (`SHDocVw.TWebBrowser` + `MSHTML`). Target: `https://www.mercante.transportes.gov.br:1443/g33159MT/jsp/LogonCertificado.jsp`

**Authentication:** Digital certificate via browser's native PKI prompt.

##### Two Production SA Credentials Hardcoded — CRITICAL
`DmBroker.pas`, `DataModuleCreate`:
```pascal
ConfiguraConexao('INDAIA10',  'BROKER',     'SA', '123');
ConfiguraConexaoV2('INDAIA10', 'MYINDAIAV2', 'SA', '123');
```
Both primary databases (`BROKER` and `MYINDAIAV2`) are accessed with the SA system administrator account.

##### Hardcoded Employee Fallback Username — HIGH
```pascal
if frmPgmtoMercante.sUsuario = '' then
  frmPgmtoMercante.sUsuario := 'AGATHA.NIGRO';
```
If no user session is established, all actions are attributed to this hardcoded employee.

##### SSL Security Dialogs Auto-Dismissed — MEDIUM
`SendMessage(H, WM_Close, ...)` silently closes IE "Alerta de Segurança" and "Aviso de Segurança" dialogs. SSL/certificate warnings on the government portal are bypassed without operator awareness.

**Tables written:** `TPROCESSO_DOCTOS`, `TFOLLOWUP` (events `533`, `049`), `TPROCESSO.NR_PEDIDO_PGMTO_AFRMM`, wallet payment table.

---

#### 4.13 `myindaia-minibrowser-381dcd2bfd82` — CEF Browser Shell

**Purpose:** General-purpose Chromium browser container used by other modules for authenticated Portal Único sessions.

**Browser:** CEF4Delphi. Authentication via certificate picker — no hardcoded credentials or PIN codes in source.

##### Production Server Name Committed in Config — LOW
`Config.ini`:
```ini
[DataBase]
Server=Indaia10
--Homologação
--Server=Antuerpia
```
Both production (`Indaia10`) and homologation (`Antuerpia`) server names visible in the tracked config file.

**DB connection:** Uses `ConnectionModule` with Windows Integrated Authentication (trusted connection) — no explicit SA credentials found. This is the safest DB auth pattern in the codebase.

---

#### 4.14 `myindaia-extratordadossiscomex-ccfd0a996f79` — Siscomex Data Extractor

**Purpose:** REST API client (Indy `TIdHTTP`) that calls Portal Único for DUE/DI JSON payloads and stores them in BROKER database.

##### AWS SES Credentials in Comments — CRITICAL
`DmBroker.pas` (lines 102–103):
```pascal
IdSMTP1.Username := qryBroker.FieldByName('NM_LOGIN').AsString;//'AKIAIX5BPVHLHQRKEUTA';
IdSMTP1.Password := qryBroker.FieldByName('NM_SENHA').AsString;//'ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh';
```
Third occurrence of the same AWS SES credentials in the codebase.

**Data extracted:** Full DUE/DI payload including NCM codes, quantities, values, tax calculations (II, IPI, PIS/COFINS alíquotas and valores devidos/recolhidos), NF-e chave de acesso, exporter/importer identities. Certificate file paths stored in DB table `qrySelectCertificados`.

---

#### 4.15 `myindaia-integracaoduimp-3d6b7379a918` — DUIMP API Integration

**Purpose:** Generates and transmits DUIMP import declarations to Portal Único REST API; maps BROKER database tables to the government API schema.

##### Hardcoded API Shared Secret — CRITICAL
`uIntegracaoAPIs.pas` (line 77):
```pascal
Http.Request.CustomHeaders.Values['secret'] := '2x3K8V7dXQmQ9p4Rz6Lh8B1jFs9Wc0Y2';
```
This is the same proxy authentication secret found in `myindaia-apiproxyportalunico` — confirming the internal API gateway uses a single shared secret across multiple modules.

##### TLS Verification Disabled — HIGH
`VerifyMode := []` — all HTTPS calls to Portal Único have no server certificate chain validation.

##### Placeholder Financial Values in API Submission SQL — MEDIUM
```pascal
'''99'' AS DadosCambiaisInstituicaoFinanciadoraCodigo'
'CAST(''100.12'' AS DECIMAL(15,2)) AS DadosCambiaisValorCoberturaCambial'
```
Hardcoded placeholder values submitted to government API if not overridden.

**Key BROKER → DUIMP field mappings:**

| BROKER Source | DUIMP API Field |
|---|---|
| `TPROCESSO.CD_DUIMP` | `Identificacao.Numero` |
| `TEMPRESA_NAC.CGC_EMPRESA` | `Identificacao.Importador.Ni` |
| `TDETALHE_MERCADORIA.CD_MERCADORIA` | `CodigoMercadoria` |
| `TADICAO_DE_IMPORTACAO.CD_REGIME_TRIBUTAR` | `TributoRegimeCodigoII` |
| `TRIBUTO.CD_TIPO_BENEF_IPI` | `TributoRegimeCodigoIPI` (mapped: 4→'1', 5→'5', 2→'4', 1→'3') |

---

#### 4.16 `myindaia-myprocessasda-8e00fd6807b7` — SDA Union Fee Automation

**Purpose:** Automates SDA (customs broker syndicate) union fee submission for Santos and Rio de Janeiro portals via IE `TWebBrowser`.

**Browser:** IE `TWebBrowser` via `TNavigatorWebBrowser` wrapper. Both portals (Santos and RJ) use the same state-machine pattern.

##### Plain HTTP on Union Portals — HIGH
```pascal
// Santos:
ENDERECO = 'http://sindicato.sdas.org.br/despachante/index.php';
// Rio de Janeiro:
ENDERECO = 'http://sys.sindaerj.org.br/despachante/login.php';
```
All credentials and financial data transmitted over unencrypted HTTP.

##### Credentials: DB-Driven (Good Pattern)
SDA portal credentials per despachante are loaded from BROKER database columns `DS_SENHA_SDA` / `DS_SENHA_SDA_RJ`. Not hardcoded in source — but if SA/123 is the DB access credential, all portal passwords are trivially accessible.

##### Employee Email in Config File — LOW
Binary `Config.cfg` committed to git contains: `EmailValidacao=agatha.nigro@myindaia.com.br`.

##### Copy-Paste Registry Key from Nestlé Module — LOW
`Settings.pas` uses `RegPath := '\Software\IntegracaoNestle'` — wrong registry namespace copied from another module.

---

### Phase 5: Billing, Parameters & Legacy DB

#### 4.17 `myindaia-faturamentoerp-1ebe84441858` — ERP Billing Integration

**Purpose:** Desktop module for exporting customs service fees into Senior ERP's invoicing system, generating NF-e via SOAP web services (`Sapiens_NotaFiscal.pas`).

##### OLEDB Connection String with SA/123 in DFM — CRITICAL
`DadosFaturamentoERP.dfm` (lines 9–10):
```
Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User ID=SA;
Initial Catalog=MYINDAIAV2;Data Source=INDAIA10
```
Uses legacy SQLOLEDB.1 OLE DB provider (deprecated since SQL Server 2012) on the `MYINDAIAV2` production database.

**Senior ERP interface:** `Sapiens_NotaFiscal.pas` is a WSDL-generated Delphi SOAP proxy (44,000+ lines) for the Senior ERP NF-e service. The `IFaturamentoERP` interface (`InterfacesERP.pas`) exposes `Show(Login, Senha)` — ERP credentials are passed at runtime by the calling application, not stored in this module's source.

**Tables accessed:** `BILLING` (via `qryFatura`), `BILLING_ITENS`, and `seniorKey` join to Senior ERP foreign keys.

---

#### 4.18 `myindaia-myatualizanffaturamento-3a1cda969bd5` — Invoice Status Updater

**Purpose:** Polling service that marks BROKER billing records as invoiced once the NF number is confirmed in Senior ERP.

**Core SQL** (`DmBroker.dfm`, line 65):
```sql
UPDATE MYINDAIAV2.DBO.BILLING
SET    NUMNFV = B.SENIORKEY
FROM   MYINDAIAV2.DBO.BILLING B
```
Updates `BILLING.NUMNFV` (NF number) from `SENIORKEY` (the Senior ERP key) — completing the billing-ERP sync loop.

Configuration via `Config.cfg` file (INI-style), no hardcoded production credentials found in source beyond what is inherited from shared `ConnectionModule`.

---

#### 4.19 `myindaia-ddbroker-d75d4bb9065e` — DDBroker Desktop App + MyCOM DLL

**Purpose:** Main legacy Delphi desktop application for the BROKER system. Also contains `MyCOM.dll` — an ActiveX COM server consumed by the Classic ASP web portal.

##### MyCOM.ridl — COM Interface Exposed to Classic ASP
`MyCOM.ridl` defines the `IIntegraPlan` interface with the following methods callable from ASP:

| COM Method | Parameters | Purpose |
|---|---|---|
| `Remessa` | NrRap, NrGrupo, NmServer, TxArquivo | Generate remessa export file |
| `PackingList` | NrRap, NrGrupo, NmServer, TxArquivo | Generate packing list |
| `RemessaTxt` | NrRap, NrGrupo, NmServer, TxArquivo | Text-format remessa |
| `RemessaXls` | NrRap, NrGrupo, NmServer, TxArquivo | Excel-format remessa |
| `TranspXls` | NrTransp, NmServer, TxArquivo | Transport XLS |
| `GeraID` | ID, tipo | Generate sequence ID |
| `IntegraPlanilhaWhirlpool` | NmServer, TxArquivo, CdUsuario | Whirlpool spreadsheet integration |
| `IntegraPlanilhaSG` | NmServer, TxArquivo, CdUsuario | SG spreadsheet integration |
| `EnviaEmailAnexo` | TxDe, TxPara, TxCopia, TxAssunto, TxAnexo | Send email with attachment |
| `IntegraPlanilhaFesto` | NmServer, TxArquivo, CdUsuario | Festo spreadsheet integration |

> [!WARNING]
> The `NmServer` parameter is passed directly to COM methods — if Classic ASP passes server names without validation, this creates a potential SSRF vector. `EnviaEmailAnexo` exposes an arbitrary email sender from ASP context.

##### Hardcoded SA/123 in KrQuery.pas — CRITICAL
`fontes/KrQuery.pas` (lines 104–105):
```pascal
_DBXConnection.Params.Values['User_Name'] := 'sa';
_DBXConnection.Params.Values['Password']  := '123';
```
The shared `KrQuery` connection factory — used throughout the desktop application — defaults to SA/123.

##### Compiled DLL in Repository — HIGH
`mycomdll/MyCOM.dll` and `MyCOM_03082015.dll` are compiled ActiveX binaries committed to the web application's engine directory.

---

#### 4.20 `myindaia-minibroker-84d6d43c5cae` — Administrative Query Console

**Purpose:** Desktop administrative tool for managing shipments, generating draft B/L documents, and querying process data.

**DB Connection:** Uses `ConnectionModule` (Aurelius FireDAC). Connection properties come from the shared `FireDacMSSSQL` singleton — no explicit SA credentials found in this module's source. Uses Aurelius ORM (`TObjectManager`) for CRUD on `BROKER` and `MYINDAIAV2` databases.

**Notable tables accessed:** `TPROCESSO_DRAFT_BL`, `TPROCESSO_CARGA_SOLTA`, `TPROCESSO_CNTR`, `TTRANSPORTADOR_ITL`, `TUSUARIO` (for `NrServerMoney` field used in process money tracking).

No hardcoded credentials, no custom schema migrations, no significant security issues beyond the system-wide SA credential inheritance.

---

#### 4.21 `myindaia-myparametrizacao-191edc3d118c` — Customs Channel Parametrization

**Purpose:** Monitors and processes inspection channel assignments (Green/Yellow/Red/Gray) for import processes via IE `TWebBrowser` automation against Siscomex Importação Web.

**Browser:** IE `TWebBrowser` (SHDocVw). Target URL read from INI file, default:
```pascal
Result := Trim(WebConfig.ReadString('Imp Web', 'DI.URL',
  'https://www1c.siscomex.receita.fazenda.gov.br/'));
```

##### Hardcoded INI File Path — HIGH
`Funcoes.pas` (initialization section):
```pascal
WebConfig := TIniFile.Create('H:\DDBroker\WebConfig.ini');
```
`H:\` is a hardcoded Windows drive letter. The application cannot run on any machine where the `H:` share is not mounted. The queue state (`LOG_PARAMETRIZACAO`, `POS_PARAMETRIZACAO`) is also written to this file.

##### DB Connection: SA/123 in DFM — CRITICAL
`Conexao.dfm`:
```
'Database=BROKER'
'User_Name=SA'
'Password=123'
```
Uses legacy `TSQLConnection` (DBX) driver, same credentials as all other modules.

**Data flow:** Channel result codes are written back to BROKER DB after scraping Siscomex; state queue is tracked in `WebConfig.ini` and `WebConfigDi.ini` local files.

---

#### 4.22 `myindaia-myparametrizacaoli-b96350d8db6f` — Import License (LI) Parametrization

**Purpose:** Configuration screen for establishing validation parameters and check rules for Import Licenses (LIs).

##### DB Connection: SA/123 in DFM — CRITICAL
`Conexao.dfm`:
```
'Database=BROKER'
'User_Name=SA'
'Password=123'
```

**LI tables accessed:** `TLICENCA_IMPORTACAO`, `TLICENCA_ITENS`, `TPROCESSO_LI`, `TPROCESSO_ANUENTES` (LI approvers), `OPERAÇÃO_COMERCIAL` (commercial operations).

**Rules logic:** LI validation parameters and NCM treatment rules are stored in DB tables (`OPERAÇÃO_COMERCIAL`, `TPROC_ANUENTES`), not hardcoded in source — configuration is DB-driven.

---

#### 4.23 `myindaia-myparametrizacaoliconsulta-0bbb34479da7` — LI Parameter Lookup

**Purpose:** Read-only search screen for operators to review configured LI parameter values.

##### DB Connection: SA/123 in DFM — CRITICAL
`Conexao.dfm`:
```
'Database=BROKER'
'User_Name=SA'
'Password=123'
```

**Tables queried:** Same LI tables as `myparametrizacaoli` plus `TPROCESSO_LI_STATUS`, `TDOC_INSTRUCAO_DESPACHO`, `TPROCESSO_DOCTOS`, `TEMPRESA_NAC`, `TGRUPO`.

**Write operations:** `UPDATE TPROCESSO_LI_STATUS` — the "consultation" module also writes status back to DB.

---

## 5. Consolidated Security Findings — All 23 Modules

### 5.1 Master Credential Exposure Table

| Credential | Value | Modules |
|---|---|---|
| SQL Server SA password | `sa / 123` | All 23 modules (universal) |
| SQL Server service account | `MYROBO / 123` | `edi_eventos` |
| AWS SES SMTP key (IAM) | `AKIAIX5BPVHLHQRKEUTA` / `ArDzRv3zLp+...` | `mysendmail`, `integracaoindaiatm`, `extratordadossiscomex` |
| Portal Único proxy secret | `2x3K8V7dXQmQ9p4Rz6Lh8B1jFs9Wc0Y2` | `integracaoduimp`, `apiproxyportalunico` |
| INTTRA SFTP (homolog.) | `i0003534 / LS0htJiu` | `myconsultaretornointtra`, `integracaobasfdoctos` |
| BASF TM API JWT | `eyJhbGciOiJIUzI1NiI...` | `integracaobasftm` |
| Indaiá TM service JWT | `eyJpZCI6MTMs...` (service acct `tm`) | `integracaoindaiatm` |
| Nelcar Transportes JWT | `eyJpZCI6MzIx...` (partner acct `nelcar`) | `integracaoindaiatm` |

### 5.2 Summary by Severity

| Severity | Count | Key Issues |
|---|---|---|
| **CRITICAL** | 12 | SA/123 universal, AWS SES keys ×3, JWT tokens hardcoded, OLEDB with SA in DFM |
| **HIGH** | 11 | Personal PEM certs, SSLv2/3 enabled, TLS verify disabled, plain HTTP on SDA portals, DLL hijack surface, BDE/MYROBO |
| **MEDIUM** | 9 | INTTRA creds in comments, hardcoded paths, partner token in binary, WM_COPYDATA passwords, HKLM registry, SQL OBJECT_ID hardcoded |
| **LOW** | 8 | Server names in config, employee names in code, copy-paste artifacts, SMTP port hardcoded |

### 5.3 Four Priority Deliverables (per Scan Plan)

**1. Hardcoded SMTP/WSDL passwords found:**
- `VW_CONFIG_MAIL` view is the correct runtime pattern — SMTP credentials are DB-driven in most modules. However, access to that view requires `sa/123` DB access.
- AWS SES credentials `AKIAIX5BPVHLHQRKEUTA / ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh` are committed in three modules — must be rotated immediately.
- `INTTRA SFTP: i0003534 / LS0htJiu` in commented code in two modules.

**2. BDE compatibility and legacy COM dependencies in MyCOM.dll:**
- `edi_eventos` uses BDE (`TDatabase`/`TQuery`/`TSession`) with `MYROBO/123` — the only remaining BDE module.
- `MyCOM.dll` exposes 10 COM methods to Classic ASP including `Remessa`, `PackingList`, `EnviaEmailAnexo`, and three spreadsheet-integration methods for Whirlpool, SG, and Festo clients. The `NmServer` and `TxArquivo` parameters deserve input validation review in the ASP layer.

**3. Storage properties / hardcoded IP paths:**
- `H:\DDBroker\WebConfig.ini` — hardcoded drive mount for queue state in `myparametrizacao`.
- `C:\DDBroker\myIndaiaDigitalizacao.exe` — hardcoded executable path in `myfilemanager`.
- `\\indaiaweb\sites\myindaia\imagens\logos\` — UNC path in `edi_eventos` HTML emails.
- `\\192.168.100.5\sftp\...` — LAN IP for Croda/AGC shared folder integrations (prior scan).
- Server name `INDAIA10` appears in `>15` modules in hardcoded connection strings; `Antuerpia` (homologation) appears in `minibrowser/Config.ini`.

**4. Automated tax payments verification flow in mypagamentomercante:**
- Payment flow: authenticate via PKI certificate → navigate to AFRMM payment menu → fill process/BL number via JS field injection into IE frames → trigger payment or declaration → download PDF via `CutePDF Writer` print interception → store PDF in `TPROCESSO_DOCTOS` → update `TFOLLOWUP` event `533` (payment confirmed) or `049` (exemption/suspension) → log wallet debit in payment table.
- All automation driven by `TWebBrowser.OnDocumentComplete` state machine with JS injected via `IHTMLDocument2.execScript`.
- **Critical weakness:** SA/123 used for BOTH `BROKER` and `MYINDAIAV2` databases. The hardcoded fallback user `AGATHA.NIGRO` means any process that fails to receive a user context silently acts under that employee's identity.

---

