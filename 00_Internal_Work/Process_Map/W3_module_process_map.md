# Wave 3 — Module → Process Participation Map

This report maps the 48 module directories under `myindaia-codebase/` to their exact process participation, directionality, counterparty, transport mechanisms, database write targets (BROKER tables), triggering models, and client specificity, based on grounded evidence from source code analysis and prior system topology reports.

---

## 1. myindaia-apiproxyportalunico-5138de81934b

| Field | Value |
| --- | --- |
| **Module** | `myindaia-apiproxyportalunico-5138de81934b` |
| **Stated purpose** | Sparkle HTTP gateway proxy forwarding requests to Portal Único API (Report 06 §7.7; `01_system_topology.md` §2 Group 2). |
| **Process step(s) it performs** | Acts as an external HTTP API gateway proxy; manages session authentication (`uAutenticacao.pas`), handles cookies, and performs automated CSRF token renewal (`uRenovadorCSRF.pas`) for secure communication with Portal Único. |
| **Direction** | Both (proxies external government API requests into and out of MyINDAIA). |
| **Counterparty** | Government body (`PORTAL UNICO` / `SISCOMEX` via `https://portalunico.siscomex.gov.br`). |
| **Transport** | REST / HTTP (`http://+:2001/ApiProxyPortalUnico`, `https://portalunico.siscomex.gov.br`). |
| **BROKER tables written** | None (pure HTTP proxy gateway without direct database write operations). |
| **Triggering** | Event-driven (HTTP server listening on ports 2001/443) + Scheduled internal timer (`FIntervaloMs := 60000` in `uRenovadorCSRF.pas:47` for CSRF token renewal). |
| **Client-specific** | No (Generic government API proxy). |
| **Evidence** | `uAutenticacao.pas:71`, `uRenovadorCSRF.pas:47`, `bin/ApiProxyPortalUnico.ini:2`. |

---

## 2. myindaia-consultamercante-4ea2cc4e1db6

| Field | Value |
| --- | --- |
| **Module** | `myindaia-consultamercante-4ea2cc4e1db6` |
| **Stated purpose** | Automated scraper checking CE Mercante (Conhecimento Eletrônico) status (Report 06 §7.5; `01_system_topology.md` §2 Group 4). |
| **Process step(s) it performs** | Performs browser-based screen-scraping against the CE Mercante web portal to query shipping manifests, divergence records, and tax amounts (`TCE_MercanteFilhote`); synchronizes extracted items, taxes, and third-party data into BROKER tables (`uMain.pas`). |
| **Direction** | Both (pulls carrier/shipment manifest data from CE Mercante portal and writes into local BROKER tables). |
| **Counterparty** | Government body / carrier portal (`CE_MERCANTE` / Receita Federal via web browser navigation). |
| **Transport** | Screen-scraping / WebBrowser (`Navigator.WebBrowser.pas`, `jQuery.XPath.pas`), DB-direct (`MSSQL` in `DmBroker.pas`). |
| **BROKER tables written** | `TDADOS_CONHECIMENTO_SITE_ITENS`, `TDADOS_CONHECIMENTO_SITE`, `TDADOS_CONHECIMENTO_SITE_TAXAS`, `TDADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE`, `TDADOS_CONHECIMENTO_SITE_TERCEIROS_ITENS`, `TDADOS_CONHECIMENTO_SITE_TERCEIROS` (`uMain.pas:2792-3898`). Also updates `TDADOS_CONHECIMENTO_SITE` (`uMain.pas:2944`). |
| **Triggering** | Scheduled (`TTimer` components: `tmrIntegracao`, `tmrErroWeb2` (500ms), `tmrImprimir` (3000ms), `tmrSalvar`, `tmrCertificado`, `tmrConexao`, `tmrPaginaTravada` (120000ms) in `uMain.dfm:167-212`) + GUI form (`Application.CreateForm(TFormMain, FormMain)` in `MyConsultaMercante.dpr:45`). |
| **Client-specific** | No (Generic carrier/customs scraping tool). |
| **Evidence** | `uMain.dfm:167-212`, `uMain.pas:2792-3898`, `MyConsultaMercante.dpr:45`. |

---

## 3. myindaia-criaxmlnfe-dd42da703585

| Field | Value |
| --- | --- |
| **Module** | `myindaia-criaxmlnfe-dd42da703585` |
| **Stated purpose** | XML generation utility for Nota Fiscal Eletrônica (NF-e) (Report 06 §7.10; `01_system_topology.md` §2 Group 5). |
| **Process step(s) it performs** | Extracts process header, items, tax addition, CFOP, and carrier data (`TPROCESSO`, `TEMPRESA_NAC`, `TADICAO_DE_IMPORTACAO`, `TCFOP`, `TTRANSP_ROD`, `TDETALHE_MERCADORIA`) to assemble compliant XML payloads for Brazilian electronic tax invoices (`uDmNFe.pas`, `uNFeService.pas`). |
| **Direction** | Internal only / Emits out (extracts DB records to produce NF-e XML files for downstream tax submission). |
| **Counterparty** | Government body (`SEFAZ` via ACBrNFSe component definitions). |
| **Transport** | DB-direct (`MSSQL` queries via `uDmNFe.pas:115`), local XML file generation. |
| **BROKER tables written** | None (pure read-only extraction queries `SELECT DISTINCT ... FROM BROKER.DBO.TPROCESSO TP ...` in `uDmNFe.pas:81-122`). |
| **Triggering** | Manual (GUI form `Application.CreateForm(TfrmNfe, frmNfe)` in `CriaXmlNfe.dpr:14`). |
| **Client-specific** | No (Generic tax document generator). |
| **Evidence** | `uDmNFe.pas:81-122`, `uNFeService.pas:149`, `CriaXmlNfe.dpr:14`. |

---

## 4. myindaia-ddbroker-d75d4bb9065e

| Field | Value |
| --- | --- |
| **Module** | `myindaia-ddbroker-d75d4bb9065e` |
| **Stated purpose** | Legacy core monolithic desktop operational suite/broker containing forms, reports, business rules, billing, EDI rules, and client customizations (Report 04 §4.19; `01_system_topology.md` §2 Group 6). |
| **Process step(s) it performs** | Manages end-to-end customs operational workflows, process tracking (`TFOLLOWUP`), billing/faturamento (`TNUMERO_FATURA`), expense calculations (`TPROCESSO_DESPESAS`), shipping instructions (`dPedidoInstrucao.pas`), DI retification (`uRetificaDI_Adm_Temp.dfm`), and client-specific EDI and reporting routines. |
| **Direction** | Both / Internal (operates on core DB, synchronizes operational/financial states, generates client reports/EDI). |
| **Counterparty** | Client (`BASF`, `CEBRACE`, `SAMSUNG`, `WHIRLPOOL`, `FERRERO`, `SAINT GOBAIN`), internal operational teams. |
| **Transport** | DB-direct (`MSSQL`), desktop screen forms, file exports. |
| **BROKER tables written** | `TS_FATURA_PROCESSO_ITEM`, `TMOVIMENTO`, `TS_FATURA_DOCUMENTO`, `TPROC_COMERC_HISTORICO`, `TVIAGEM_DEADLINE`, `TFOLLOWUP`, `TNUMERO_FATURA`, `TDETALHE_MERCADORIA`, `TDI_NVE`, `TADICAO_DE_IMPORTACAO`, `TPROCESSO_H`, `TCAIXA`, `TLOG`, `TDECLARACAO_IMPORTACAO`, `TRECEBIMENTO_PROCESSO_ITEM`, `TPROCESSO`, `TPROCESSO_SDA`, `TFLP_PO`, `TFLP_PO_ITEM`, `TNUMERARIO_NOTIFICA_ITEM`, `TLOG_ERRO_CALCULO`, `TPROCESSO_DESPESAS`, `TREMESSA`, `TREMESSA_PROCESSO`, `TPROCESSO_FATURA_AG` (`PGFT003.pas`, `PGSM240.pas`, `dEmissaoFatura.pas`, `KrDetalheMercadoria.pas`, `PGDI020.dfm`, `PGGP017.dfm`, `PGSM280.pas`, `uRetificaDI_Adm_Temp.dfm`, `PGDI040.pas`, `PGPO018.pas`, `PGFT001.pas`, `PGSM295.pas`, `uGerarRemessa.pas`). |
| **Triggering** | Manual (hundreds of GUI forms instantiated via `Application.CreateForm`, e.g., `PGSM136.pas:1154`) + scheduled internal timers (`tempo_recarrega` in `uCons_Fila_DDE.pas:23`). |
| **Client-specific** | Yes (`BASF` hardcoded rules & reports in `FrmRlBASFArmazenagemExpoCtx.pas:1`, `PGGP001.dfm:8002`; `CEBRACE` menu in `PGGP001.dfm:9523`; `SAMSUNG` NF-e rules in `uNfeSamsung.dfm:470`). |
| **Evidence** | `PGFT003.pas:1697`, `PGSM240.pas:1432`, `PGDI020.dfm:1581`, `PGDI040.pas:293`, `PGFT001.pas:780`, `PGSM295.pas:1752`, `FrmRlBASFArmazenagemExpoCtx.pas:1`, `PGGP001.dfm:9523`, `uNfeSamsung.dfm:470`. |

---

## 5. myindaia-ddenfse-5d0a8a1ab2b0

| Field | Value |
| --- | --- |
| **Module** | `myindaia-ddenfse-5d0a8a1ab2b0` |
| **Stated purpose** | Electronic Service Tax Invoice (NFSe) issuance, transmission, and monitoring integration service (`01_system_topology.md` §2 Group 5). |
| **Process step(s) it performs** | Reads service/process billing data (`TPROCESSO`, `TMUNICIPIO`, `VW_CONFIG_MAIL`), formats municipal tax XMLs (`ABRASFv1`, `ABRASFv2`, `ISSCuritiba`, `Actcon`, etc.), submits them to city web services, and registers returned digitalized PDF/Doc files into `TPROCESSO_DOCTOS` (`DmMain.pas:133`, `DDENFSeImpl.pas:351-441`). |
| **Direction** | Both (emits RPS billing XMLs out to municipal webservices and ingests returned NFSe PDF/status into `TPROCESSO_DOCTOS`). |
| **Counterparty** | Government body (`SEFAZ Municipal` / City Halls via 40+ municipality `.ini` profiles including `ISSCuritiba.ini`, `ABRASFv1.ini`, `SP.ini`, `Salvador.ini`). |
| **Transport** | SOAP / REST / HTTP (`https://isscuritiba.curitiba.pr.gov.br/Iss.NfseWebService/Nfsews.asmx`, `http://nfse.abrasf.org.br`), DB-direct (`MSSQL` via `DmMain.pas:96`). |
| **BROKER tables written** | `TPROCESSO_DOCTOS` (`DmMain.pas:133`: `INSERT INTO TPROCESSO_DOCTOS ...`). |
| **Triggering** | Manual GUI form / COM service invocation (`Application.CreateForm(TForm2, Form2)` in `Demo.dpr:14`, `DDENFSeImpl.pas:35`). |
| **Client-specific** | No (Generic municipal tax invoice integration engine). |
| **Evidence** | `DmMain.pas:103-153`, `DDENFSeImpl.pas:351-441`, `bin/ArqINI/ISSCuritiba.ini:76`, `bin/ArqINI/ABRASFv1.ini:14`. |

---

## 6. myindaia-duimpwebhook-487ad54c5769

| Field | Value |
| --- | --- |
| **Module** | `myindaia-duimpwebhook-487ad54c5769` |
| **Stated purpose** | Webhook listener and push notification processor for DUIMP / Portal Único (Report 06 §7.11; `01_system_topology.md` §2 Group 2). |
| **Process step(s) it performs** | Receives HTTP push/webhook events from Portal Único regarding DUIMP status changes, inserts raw payloads into staging tables (`DuimpPush`, `DuimpPushDetalhe`), queries `TPROCESSO` and `TTP_CANAL`, and updates operational tracking tables (`TFOLLOWUP`, `TDECLARACAO_IMPORTACAO`, `TPROCESSO`) (`Server.pas:279-601`). |
| **Direction** | Ingests into MyINDAIA (receives external government webhook pushes and updates local database). |
| **Counterparty** | Government body (`PORTAL UNICO` / `DUIMP` system via webhook pushes). |
| **Transport** | REST / Webhook (`Server.pas:176` / `bin/PortalUnicoWebhook.ini`), DB-direct (`MSSQL`). |
| **BROKER tables written** | `DuimpPush`, `DuimpPushDetalhe` (`Server.pas:332, 365`), `TFOLLOWUP` (`Server.pas:543`), `TDECLARACAO_IMPORTACAO` (`Server.pas:567`), `TPROCESSO` (`Server.pas:575, 601`). |
| **Triggering** | Event-driven (Webhook HTTP server listening on port/path configured in `bin/PortalUnicoWebhook.ini`). |
| **Client-specific** | No (Generic DUIMP webhook processor). |
| **Evidence** | `Server.pas:332-601`, `bin/PortalUnicoWebhook.ini:1`. |


---

## 7. myindaia-edi-94a307a60612

| Field | Value |
| --- | --- |
| **Module** | `myindaia-edi-94a307a60612` |
| **Stated purpose** | Core electronic data interchange (EDI) file processing and layout mapping engine (Report 06 §7.4; `01_system_topology.md` §2 Group 5). |
| **Process step(s) it performs** | Polls configured directory paths/queues (`TFILA_AGENDA`), parses EDI layout definitions, processes inbound/outbound customs flat files, inserts processing logs (`TFILA_LOG`), generates digital attachments (`TPROCESSO_DOCTOS`), and updates core operational tables (`TPROCESSO`, `TFOLLOWUP`, `TDECLARACAO_IMPORTACAO`, `TLOCAL_EMBARQUE`, `TAGENTE`, `TEMPRESA_EST`, `TDE_PARA`) (`Main.pas:120, 753, 3327, 6379`). |
| **Direction** | Both (processes incoming EDI layouts from clients into DB and exports outbound EDI status files). |
| **Counterparty** | Clients / Carriers / Trading partners via structured flat files (`BASF` in `Main.pas:3327`). |
| **Transport** | File-based (`NM_PATH_EDI`, local directory/share polling), DB-direct (`MSSQL` in `Main.pas`). |
| **BROKER tables written** | `TPROCESSO_DOCTOS`, `TFILA_LOG`, `TPROCESSO`, `TFOLLOWUP`, `TPROCESSO_LI`, `TNUMERARIO`, `TFATURAMENTO_CC`, `TDECLARACAO_IMPORTACAO`, `TLOCAL_EMBARQUE`, `TAGENTE`, `TEMPRESA_EST`, `TDE_PARA`, `TSEQ_BASF`, `TFILA_AGENDA` (`Main.pas:120, 753, 3327, 5906, 6379, 7300, 11031`). Also deletes from `TMAIL_PROC_NAO_FAT`, `TMAIL_PENDENTES`, `TMAIL_PENDENTES_PO` (`Main.pas:8200-10468`). |
| **Triggering** | Scheduled (`WatchTimer: TTimer` with `Interval = 4000` executing `Watch` in `Main.dfm:289`) + GUI form (`Application.CreateForm(TfrmMain, frmMain)` in `EDI.dpr:37`). |
| **Client-specific** | Yes (`BASF` EDI rules hardcoded in `Main.pas:3327`: `UPDATE TPROCESSO SET IN_EDI_BASF = ...` and `Main.pas:7300`: `TSEQ_BASF`). |
| **Evidence** | `Main.dfm:289`, `Main.pas:120, 3327, 6379, 7300`, `EDI.dpr:37`. |

---

## 8. myindaia-edi_eventos-c0d29e1a4cce

| Field | Value |
| --- | --- |
| **Module** | `myindaia-edi_eventos-c0d29e1a4cce` |
| **Stated purpose** | Specialized event and tracking status EDI scheduler and processor (Report 04 §4.10; `01_system_topology.md` §2 Group 5). |
| **Process step(s) it performs** | Monitors and executes scheduled event processing queues (`TFILA_AGENDA`), updates task progress and completion status (`TFILA_LOG`), and records milestone completion in process tracking (`TFOLLOWUP`) (`Main.pas:454, 656, 1730`). |
| **Direction** | Internal / Out (monitors internal process events and generates status updates/notifications). |
| **Counterparty** | Internal operators / external client tracking feeds via scheduled EDI queues. |
| **Transport** | DB-direct (`MSSQL` queries via `Main.pas`), File-based (`NM_PATH_EDI`). |
| **BROKER tables written** | `TFILA_LOG` (`Main.pas:454, 866, 966`), `TFILA_AGENDA` (`Main.pas:656, 676, 799, 819, 845`), `TFOLLOWUP` (`Main.pas:1730`). |
| **Triggering** | Scheduled (`WatchTimer: TTimer` with `Interval = 60000` executing `Watch` in `Main.dfm:163`) + GUI form (`Application.CreateForm(TfrmMain, frmMain)` in `EDI_EVENTOS.dpr:29`). |
| **Client-specific** | No (Generic event tracking scheduler). |
| **Evidence** | `Main.dfm:163`, `Main.pas:454, 656, 1730`, `EDI_EVENTOS.dpr:29`. |

---

## 9. myindaia-extratordadossiscomex-ccfd0a996f79

| Field | Value |
| --- | --- |
| **Module** | `myindaia-extratordadossiscomex-ccfd0a996f79` |
| **Stated purpose** | Siscomex data extractor for import/export DI and DU-E drawback synchronization (Report 04 §4.14; `01_system_topology.md` §2 Group 4). |
| **Process step(s) it performs** | Authenticates against Siscomex / Portal Único web portals using digital certificates (`uGerarCertificado.pas`), queries import declarations (`DI`) and export declarations (`DU-E`), and synchronizes extracted drawback records into local tables (`DmBroker.pas:469-1135`). |
| **Direction** | Ingests into MyINDAIA (extracts DI and DU-E records from government portals and writes to local database). |
| **Counterparty** | Government body (`SISCOMEX` / Receita Federal via digital certificate web authentication). |
| **Transport** | Web / HTTP / Screen scraping (`Principal.pas`, `uGerarCertificado.pas`), DB-direct (`MSSQL` via `DmBroker.pas`). |
| **BROKER tables written** | `ExpoDueImportada` (`DELETE` and `INSERT` in `DmBroker.pas:469, 480`), `ExpoDueHistorico` (`DmBroker.pas:474, 623`), `ExpoDueImportadaControle` (`DmBroker.pas:684`), `ImpoDiImportada` (`INSERT` and `DELETE` in `DmBroker.pas:802, 904`), `ImpoDiHistorico` (`DmBroker.pas:909, 1135`). |
| **Triggering** | Scheduled (`Timer1: TTimer` in `uCadastroDespachantes.dfm:616`) + GUI forms (`Application.CreateForm` for `TfrmIntegracaoDI`, `TfrmIntegracaoDueNovo`, `TfrmRelatorioImpo`, `TfrmRelatorioExpo` in `gerenciamentoDrawbackNovo.dpr:27-35`). |
| **Client-specific** | No (Generic Siscomex drawback extractor). |
| **Evidence** | `DmBroker.pas:469-1135`, `uCadastroDespachantes.dfm:616`, `gerenciamentoDrawbackNovo.dpr:27-35`. |

---

## 10. myindaia-faturamentoerp-1ebe84441858

| Field | Value |
| --- | --- |
| **Module** | `myindaia-faturamentoerp-1ebe84441858` |
| **Stated purpose** | ERP billing and invoice integration synchronizer (Report 04 §4.17; `01_system_topology.md` §2 Group 5). |
| **Process step(s) it performs** | Reads closed process billing details, writes invoice documentation into `TPROCESSO_DOCTOS` (`ImpressaoDocumentos.pas:172`), and synchronizes billing header, invoiced items, cash requests, and payment details to the secondary ERP database (`MYINDAIAV2.dbo`) (`GeraNotaFiscal.pas:349-580`). |
| **Direction** | Both / Emits out (synchronizes BROKER billing documents with internal/external ERP system `MYINDAIAV2`). |
| **Counterparty** | ERP system (`MYINDAIAV2` / Financial Accounting subsystem). |
| **Transport** | DB-direct (`MSSQL` cross-database queries between `BROKER.dbo` and `MYINDAIAV2.dbo` via `GeraNotaFiscal.pas:349`). |
| **BROKER tables written** | `TPROCESSO_DOCTOS` (`ImpressaoDocumentos.pas:172`: `INSERT INTO BROKER.dbo.TPROCESSO_DOCTOS ...`). Also writes heavily to `MYINDAIAV2.dbo.Billing`, `MYINDAIAV2.dbo.ItemInvoiced`, `MYINDAIAV2.dbo.Billing_ItemInvoiced`, `MYINDAIAV2.dbo.Billing_CashRequested`, `MYINDAIAV2.dbo.Billing_PaymentRequested` (`GeraNotaFiscal.pas:349-580`). |
| **Triggering** | Manual (GUI forms and datamodules: `Application.CreateForm(TfrmFaturamentoERP, frmFaturamentoERP)` / `TdtmEnvioERP` / `TdtmIntegracao` in `FaturamentoERP.dpr:24-29`). |
| **Client-specific** | No (Generic ERP billing synchronizer). |
| **Evidence** | `ImpressaoDocumentos.pas:172`, `GeraNotaFiscal.pas:349-580`, `FaturamentoERP.dpr:24-29`. |

---

## 11. myindaia-integracaoagc-eb0caaecba2d

| Field | Value |
| --- | --- |
| **Module** | `myindaia-integracaoagc-eb0caaecba2d` |
| **Stated purpose** | Client-specific customs data integration service for client `AGC` (Asahi Glass / AGC Vidros) (`01_system_topology.md` §2 Group 3). |
| **Process step(s) it performs** | Polls client databases or file shares, extracts purchase order (`PO`) and shipment instruction data, inserts/updates records in core BROKER tables (`TINSTRUCAO_DESEMBARACO`, `TPROCESSO`, `TPO`, `TFLP_PO`, `TPO_ITEM`, `TFLP_PO_ITEM`, `TINSTRUCAO_DESEMBARACO_PEDIDO`, `TPROCESSO_DOCTOS`), and synchronizes order tracking (`DmMain.pas:146-679`). |
| **Direction** | Both (pulls shipment instructions from client `AGC` into `BROKER` and updates PO tracking status). |
| **Counterparty** | Client (`AGC` - Asahi Glass / AGC Vidros do Brasil). |
| **Transport** | DB-direct / File (`MSSQL` queries in `DmMain.pas`), SFTP / File synchronization. |
| **BROKER tables written** | `TINSTRUCAO_DESEMBARACO` (`DmMain.pas:146`), `TPROCESSO` (`DmMain.pas:207`), `TPO` (`DmMain.pas:239`), `TFLP_PO` (`DmMain.pas:263`), `TPO_ITEM` (`DELETE` and `INSERT` in `DmMain.pas:299, 349`), `TFLP_PO_ITEM` (`DmMain.pas:467, 589, 606`), `TINSTRUCAO_DESEMBARACO_PEDIDO` (`DmMain.pas:632`), `TPROCESSO_DOCTOS` (`DmMain.pas:679`). |
| **Triggering** | Scheduled (`tmrIntegracao: TTimer` with `LocalSettings.Intervalo` configured in `uMain.dfm:88` and `uMain.pas:134`) + GUI form (`Application.CreateForm(TFormMain, FormMain)` in `IntegracaoAGC.dpr:17`). |
| **Client-specific** | Yes (`AGC` dedicated integration module). |
| **Evidence** | `DmMain.pas:146-679`, `uMain.dfm:88`, `IntegracaoAGC.dpr:17`. |

---

## 12. myindaia-integracaobasf-b138c8dd164e

| Field | Value |
| --- | --- |
| **Module** | `myindaia-integracaobasf-b138c8dd164e` |
| **Stated purpose** | Client-specific B2B integration suite for client `BASF` (and secondary client `Pirelli`) (`01_system_topology.md` §2 Group 3). |
| **Process step(s) it performs** | Connects via SFTP (`uMySFTPClient.pas`, `uConexoesIntegracoes.pas`) and network shares to exchange shipment and event files, updates event tracking queues (`TFILA_ATZ_EVENTOS_BASF`), and executes client-specific data mappings (`dmPrincipal.dfm:22, 611`, `uFuncoesEspecificasClientes.pas:16`). |
| **Direction** | Both (exchanges SFTP files with `BASF` / `Pirelli` and updates internal tracking tables). |
| **Counterparty** | Client (`BASF` S.A., plus `Pirelli` via `cfgPirelliConEmb_IntervaloMinutos`). |
| **Transport** | SFTP / Network File Share (`uMySFTPClient.pas:71`, `uConexoesIntegracoes.pas:264`), DB-direct (`MSSQL`). |
| **BROKER tables written** | `TFILA_ATZ_EVENTOS_BASF` (`INSERT INTO`, `UPDATE`, and `DELETE FROM` in `dmPrincipal.dfm:22, 611, 639`). |
| **Triggering** | Scheduled (`Timer1: TTimer` in `TelaPrincipal.dfm:562` using `LocalSettings.Intervalo` / `IntervaloMinutos`) + GUI form (`Application.CreateForm(TformIntegracaoBasf, formIntegracaoBasf)` in `IntegracaoBasf.dpr:17`). |
| **Client-specific** | Yes (`BASF` and `Pirelli` custom integration logic). |
| **Evidence** | `dmPrincipal.dfm:22, 611`, `TelaPrincipal.dfm:562`, `uFuncoesEspecificasClientes.pas:16`, `IntegracaoBasf.dpr:17`. |

---

## 13. myindaia-integracaobasfdoctos-b0e9ffccc2b2

| Field | Value |
| --- | --- |
| **Module** | `myindaia-integracaobasfdoctos-b0e9ffccc2b2` |
| **Stated purpose** | Client-specific B2B document and attachment exchange service for `BASF` (`01_system_topology.md` §2 Group 3). |
| **Process step(s) it performs** | Connects to SFTP (`TIntegracaoSFTP`), queries customs processes and followup events (`TPROCESSO`, `TFOLLOWUP`, `TPROCESSO_DOCTOS`), exchanges digital documents/attachments with `BASF` servers, updates followup EDI status (`TFOLLOWUP`), and records general configuration settings (`CONFIGURACAO_GERAL`) (`dmPrincipal.dfm:34, 126`, `dmPrincipal.pas:106`). |
| **Direction** | Both (exchanges digital attachments/documents with `BASF` SFTP servers and updates internal process followup). |
| **Counterparty** | Client (`BASF` S.A. via SFTP document exchange). |
| **Transport** | SFTP (`uPreferencias.pas:71`, `ftp.cvt.inttra.com`), DB-direct (`MSSQL` queries via `dmPrincipal.dfm`). |
| **BROKER tables written** | `TFOLLOWUP` (`UPDATE TFOLLOWUP SET IN_EDI_ENVIADO = :IN_EDI_ENVIADO WHERE NR_PROCESSO = ...` in `dmPrincipal.dfm:126`), `CONFIGURACAO_GERAL` (`INSERT INTO CONFIGURACAO_GERAL ...` in `dmPrincipal.pas:106`). |
| **Triggering** | Scheduled (`Timer1: TTimer` with `IntervaloMinutos` / `Intervalo` in `TelaPrincipal.dfm:188` and `TelaPrincipal.pas:199`) + GUI form (`Application.CreateForm(TForm1, Form1)` in `IntegracaoBasfDoctos.dpr:17`). |
| **Client-specific** | Yes (`BASF` dedicated document exchange logic). |
| **Evidence** | `dmPrincipal.dfm:34, 126`, `dmPrincipal.pas:106`, `TelaPrincipal.dfm:188`, `IntegracaoBasfDoctos.dpr:17`. |

---

## 14. myindaia-integracaobasftm-2d2592ce5e39

| Field | Value |
| --- | --- |
| **Module** | `myindaia-integracaobasftm-2d2592ce5e39` |
| **Stated purpose** | Client-specific transportation management (`TM`) HTTP/REST integration for `BASF` (`01_system_topology.md` §2 Group 3). |
| **Process step(s) it performs** | Queries process tracking and container/cargo shipment data (`TPROCESSO`, `TFOLLOWUP`, `TPROCESSO_CNTR`, `TPROCESSO_CARGA_SOLTA`, `TPROCESSO_NF`), builds JSON payloads, and pushes shipment status directly to `BASF` TM / logistics endpoints using HTTP REST post (`uPrincipal.pas:173-183`, `uPrincipal.dfm:300-356`). |
| **Direction** | Emits out (exports process, container, and followup status from `BROKER` to external `BASF` TM endpoints). |
| **Counterparty** | Client (`BASF` S.A. / Transportation Management API via HTTP REST). |
| **Transport** | HTTP / REST (`IdHTTP.post(URL, XArquivo, Response)` with `application/json` in `uPrincipal.pas:173, 183`), DB-direct (`MSSQL` read queries via `uPrincipal.dfm:300`). |
| **BROKER tables written** | None (pure read-and-push integration service; reads `TPROCESSO`, `TFOLLOWUP`, `TPROCESSO_CNTR`, `TPROCESSO_CARGA_SOLTA`). |
| **Triggering** | Scheduled (`Timer1: TTimer` in `uPrincipal.dfm:229`) + GUI form (`Application.CreateForm(TfrmPrincipal, frmPrincipal)` in `IntegracaoBasfTM.dpr:12`). |
| **Client-specific** | Yes (`BASF` dedicated TM integration service). |
| **Evidence** | `uPrincipal.pas:173-183`, `uPrincipal.dfm:229, 300-356`, `IntegracaoBasfTM.dpr:12`. |

---

## 15. myindaia-integracaocebrace-85f66fede40a

| Field | Value |
| --- | --- |
| **Module** | `myindaia-integracaocebrace-85f66fede40a` |
| **Stated purpose** | Client-specific DU-E export and customs integration service for client `Cebrace` (`01_system_topology.md` §2 Group 3). |
| **Process step(s) it performs** | Queries export processes (`TPROCESSO`, `TPROCESSO_EXP`, `TFOLLOWUP`), communicates with DU-E / web portal endpoints (`RESTClient1`, `IdHTTP.post` with `application/xml` and `X-CSRF-Token`), and records configuration details (`CONFIGURACAO_GERAL`) (`DataModule.dfm:292`, `FrIntegracaoDUE.pas:206-220`, `DataModule.pas:125`). |
| **Direction** | Both (reads export process details to push DU-E data and records configuration/status updates). |
| **Counterparty** | Client (`CEBRACE` - Cristal Plano e Vidros S.A. / DU-E export integration). |
| **Transport** | HTTP / REST / XML Post (`IdHTTP.post`, `RESTClient1` in `FrIntegracaoDUE.pas:206, 220, 328`), SFTP (`FSFTPConectado` in `Preferencias.pas:57`), DB-direct (`MSSQL`). |
| **BROKER tables written** | `CONFIGURACAO_GERAL` (`INSERT INTO CONFIGURACAO_GERAL (CHAVE,VALOR) ...` in `DataModule.pas:125`). |
| **Triggering** | Scheduled (`Timer1: TTimer` with `Intervalo` in `uPrincipal.dfm:210` and `uPrincipal.pas:119`) + GUI forms (`Application.CreateForm(TForm1, Form1)` / `TDataModule1` in `integracaoCebrace.dpr:19-20`). |
| **Client-specific** | Yes (`Cebrace` dedicated export/DU-E integration). |
| **Evidence** | `FrIntegracaoDUE.pas:206-220, 328`, `DataModule.pas:125`, `DataModule.dfm:292`, `uPrincipal.dfm:210`. |

---

## 16. myindaia-integracaocroda-0b15867932d7

| Field | Value |
| --- | --- |
| **Module** | `myindaia-integracaocroda-0b15867932d7` |
| **Stated purpose** | Client-specific customs data integration service for client `Croda` (`01_system_topology.md` §2 Group 3). |
| **Process step(s) it performs** | Polls client databases/files, extracts purchase order and clearance instructions (`PO`), inserts/updates core BROKER tables (`TINSTRUCAO_DESEMBARACO`, `TPROCESSO`, `TPO`, `TFLP_PO`, `TPO_ITEM`, `TFLP_PO_ITEM`, `TINSTRUCAO_DESEMBARACO_PEDIDO`, `TPROCESSO_DOCTOS`), and synchronizes order tracking (`DmMain.pas:146-678`). |
| **Direction** | Both (pulls shipment instructions from client `Croda` into `BROKER` and updates PO tracking status). |
| **Counterparty** | Client (`CRODA` Brasil Ltda.). |
| **Transport** | DB-direct / File (`MSSQL` queries in `DmMain.pas`), SFTP / File synchronization. |
| **BROKER tables written** | `TINSTRUCAO_DESEMBARACO` (`DmMain.pas:146`), `TPROCESSO` (`DmMain.pas:206`), `TPO` (`DmMain.pas:238`), `TFLP_PO` (`DmMain.pas:262`), `TPO_ITEM` (`DELETE` and `INSERT` in `DmMain.pas:298, 348`), `TFLP_PO_ITEM` (`DmMain.pas:466, 491, 516, 588, 605`), `TINSTRUCAO_DESEMBARACO_PEDIDO` (`DmMain.pas:631`), `TPROCESSO_DOCTOS` (`DmMain.pas:678`). |
| **Triggering** | Scheduled (`tmrIntegracao: TTimer` with `LocalSettings.Intervalo` in `uMain.dfm:88` and `uMain.pas:134`) + GUI form (`Application.CreateForm(TFormMain, FormMain)` in `IntegracaoCroda.dpr:17`). |
| **Client-specific** | Yes (`Croda` dedicated integration module). |
| **Evidence** | `DmMain.pas:146-678`, `uMain.dfm:88`, `IntegracaoCroda.dpr:17`. |

---

## 17. myindaia-integracaodrawbackisencao-f54159cce10e

| Field | Value |
| --- | --- |
| **Module** | `myindaia-integracaodrawbackisencao-f54159cce10e` |
| **Stated purpose** | Excel batch loader and integration utility for drawback exemption items and queues (`01_system_topology.md` §2 Group 4). |
| **Process step(s) it performs** | Reads Excel sheets (`TfrmIntegracaoExcel`), extracts item and queue records, and inserts them into drawback exemption tables (`DRAWBACK_ISENCAO_ITENS`, `DRAWBACK_ISENCAO_FILA`) (`uFrmIntegracaoExcel.pas:163, 202`). |
| **Direction** | Ingests into MyINDAIA (reads external spreadsheets and populates drawback exemption tables in database). |
| **Counterparty** | Internal operators / customs analysts via Excel batch import files. |
| **Transport** | File-based (`Excel` spreadsheet parsing), DB-direct (`MSSQL` via `uFrmIntegracaoExcel.pas`). |
| **BROKER tables written** | `DRAWBACK_ISENCAO_ITENS` (`INSERT INTO DRAWBACK_ISENCAO_ITENS ...` in `uFrmIntegracaoExcel.pas:163`), `DRAWBACK_ISENCAO_FILA` (`INSERT INTO DRAWBACK_ISENCAO_FILA ...` in `uFrmIntegracaoExcel.pas:202`). |
| **Triggering** | Manual (GUI forms: `Application.CreateForm(TfrmMain, frmMain)` / `TfrmIntegracaoExcel` / `TFrmIntegracaoDrawBackIsencao` in `IntegracaoDrawbackIsencao.dpr:18` and `Main.pas:36-42`). |
| **Client-specific** | No (Generic drawback exemption spreadsheet loader). |
| **Evidence** | `uFrmIntegracaoExcel.pas:163, 202`, `IntegracaoDrawbackIsencao.dpr:18`, `Main.pas:36-42`. |

---

## 18. myindaia-integracaoduimp-3d6b7379a918

| Field | Value |
| --- | --- |
| **Module** | `myindaia-integracaoduimp-3d6b7379a918` |
| **Stated purpose** | DUIMP (Declaração Única de Importação) synchronization and attribute management tool (`01_system_topology.md` §2 Group 2). |
| **Process step(s) it performs** | Manages DUIMP declaration items, attributes, and taxation structures, querying Portal Único / DUIMP APIs, updating declaration attributes (`TDuimpAtributosFundamento`, `TDuimpAtributosTributarios`, `TNCM_ATRIBUTO_DUIMP`), and updating item and process synchronization status (`TDETALHE_MERCADORIA`, `TDETALHE_MERCADORIA_DUIMP`, `TPROCESSO`) (`uAtributosFundamento.pas:718-965`, `uAtributosTributo.pas:1019-1038`, `uAtributosDuimp.pas:546-672`, `Principal.pas:1001-3059`). |
| **Direction** | Both (synchronizes DUIMP items/attributes between local BROKER database and Portal Único). |
| **Counterparty** | Government body (`PORTAL UNICO` / `DUIMP` system). |
| **Transport** | Web / HTTP / REST (`Portal Único DUIMP APIs`), DB-direct (`MSSQL`). |
| **BROKER tables written** | `TDuimpAtributosFundamento` (`UPDATE`, `DELETE`, `INSERT` in `uAtributosFundamento.pas:718, 793, 799, 965`), `TDuimpAtributosTributarios` (`DELETE`, `INSERT`, `UPDATE` in `uAtributosTributo.pas:1019, 1038` and `uAtributosTributarios.pas:2109, 2340`), `TNCM_ATRIBUTO_DUIMP` (`uAtributosDuimp.pas:546`), `TDETALHE_MERCADORIA` (`uAtributosDuimp.pas:634`), `TDETALHE_MERCADORIA_DUIMP` (`DELETE`, `INSERT`, and `UPDATE` in `uAtributosDuimp.pas:664, 672` and `Principal.pas:1001, 2842, 2900, 2961, 3059`), `TPROCESSO` (`Principal.pas:1038, 2837`). |
| **Triggering** | Scheduled (`Timer1: TTimer` in `Principal.dfm:2273` and `Principal.pas:260`) + GUI forms (`Application.CreateForm(TForm1, Form1)` / `TdtmDuimp` / `TfrmAtributosDuimp` across `IntegracaoDuimp.dpr:24-31`). |
| **Client-specific** | No (Generic DUIMP attribute and item synchronizer). |
| **Evidence** | `uAtributosFundamento.pas:718-965`, `uAtributosDuimp.pas:546-672`, `Principal.pas:1001-3059`, `Principal.dfm:2273`, `IntegracaoDuimp.dpr:24-31`. |

---

## 19. myindaia-integracaoindaiatm-2cdb8121d39d

| Field | Value |
| --- | --- |
| **Module** | `myindaia-integracaoindaiatm-2cdb8121d39d` |
| **Stated purpose** | Transportation Management (`TM`) internal REST API integration service (`01_system_topology.md` §2 Group 2). |
| **Process step(s) it performs** | Queries process tracking and cargo/container status (`TPROCESSO`, `TFOLLOWUP`, `TPROCESSO_CNTR`, `TPROCESSO_CARGA_SOLTA`, `TPROCESSO_NF`), builds JSON payloads, and pushes shipment/broker data to internal HTTP REST service endpoints (`uPrincipal.dfm:310-363`, `uPrincipal.pas:280, 462`). |
| **Direction** | Emits out (exports internal process and tracking data from `BROKER` to internal `TM` REST API). |
| **Counterparty** | Internal system (`TM` / `api.myindaia.com.br/tm/v1/Service/InfoBroker`). |
| **Transport** | HTTP / REST (`IdHTTP.post` with `application/json` and `Authorization` headers in `uPrincipal.pas:268, 276, 280`), DB-direct (`MSSQL` read queries via `uPrincipal.dfm:310`). |
| **BROKER tables written** | None (pure read-and-push service querying `TPROCESSO`, `TFOLLOWUP`, `TPROCESSO_CNTR`, `TPROCESSO_CARGA_SOLTA`, `TPROCESSO_NF`). |
| **Triggering** | Scheduled (`Timer1: TTimer` in `uPrincipal.dfm:231` and `uPrincipal.pas:675`) + GUI forms (`Application.CreateForm(TfrmPrincipal, frmPrincipal)` in `IntegracaoIndaiaTM.dpr:21`). |
| **Client-specific** | No (Generic internal TM integration service). |
| **Evidence** | `uPrincipal.dfm:231, 310-363`, `uPrincipal.pas:268-280, 462, 577, 675`, `IntegracaoIndaiaTM.dpr:21`. |

---

## 20. myindaia-integracaopirelli-d6880a7ff013

| Field | Value |
| --- | --- |
| **Module** | `myindaia-integracaopirelli-d6880a7ff013` |
| **Stated purpose** | Client-specific B2B document and draft bill of lading exchange service for `Pirelli` (`01_system_topology.md` §2 Group 3). |
| **Process step(s) it performs** | Queries process draft bills of lading (`TPROCESSO_DRAFT_BL`), connects to SFTP (`TIntegracaoSFTP`), sends document files/drafts (`EnviarArquivo`), updates followup EDI status (`TFOLLOWUP`), and records configuration parameters (`CONFIGURACAO_GERAL`) (`uFuncoesEspecificasClientes.pas:99, 208`, `TelaPrincipal.pas:216`, `dmPrincipal.dfm:456`, `dmPrincipal.pas:165`). |
| **Direction** | Both (sends draft BL documents via SFTP and updates internal followup status). |
| **Counterparty** | Client (`Pirelli` via SFTP document exchange). |
| **Transport** | SFTP (`uPreferencias.pas:85`, `ftp.cvt.inttra.com`, `libssh2`), DB-direct (`MSSQL`). |
| **BROKER tables written** | `TFOLLOWUP` (`UPDATE TFOLLOWUP SET IN_EDI_ENVIADO = 1` in `dmPrincipal.dfm:456`), `CONFIGURACAO_GERAL` (`INSERT INTO CONFIGURACAO_GERAL (CHAVE,VALOR) ...` in `dmPrincipal.pas:165`). |
| **Triggering** | Scheduled (`Timer1: TTimer` with `LocalSettings.Intervalo` / `IntervaloMinutos` in `TelaPrincipal.dfm:233`, `TelaPrincipal.pas:72`, `uPreferencias.pas:150`) + GUI forms (`Application.CreateForm(TForm1, Form1)` in `IntegracaoPirelli.dpr:23`). |
| **Client-specific** | Yes (`Pirelli` dedicated document exchange service). |
| **Evidence** | `dmPrincipal.dfm:456`, `dmPrincipal.pas:165`, `uFuncoesEspecificasClientes.pas:99, 208`, `TelaPrincipal.pas:72, 216`, `IntegracaoPirelli.dpr:23`. |

---

## 21. myindaia-minibroker-84d6d43c5cae

| Field | Value |
| --- | --- |
| **Module** | `myindaia-minibroker-84d6d43c5cae` |
| **Stated purpose** | Background scheduling, draft bill of lading generation, and database maintenance worker (`01_system_topology.md` §2 Group 4). |
| **Process step(s) it performs** | Queries `TPROCESSO_DRAFT_BL`, `TPROCESSO_EXP_NF_ITEM`, and `TPROCESSO`, processes DU-E / draft BL files (`MvProcessoDueNF.pas`, `FrmDraftBL.pas`), records document tracking entries (`TPROCESSO_DOCTOS`), inserts DU-E LPCO and drawback items (`TPROCESSO_EXP_NF_ITEM_LPCO`, `TPROCESSO_EXP_NF_ITEM_NF_DRAWBACK`), runs database audit/maintenance scripts (`BrokerMap.dgp`), and saves system settings (`CONFIGURACAO_GERAL`) (`GravaArquivoDigitalizacao.pas:129`, `MvProcessoDueNF.pas:921, 1503`, `dmConfiguracoes.pas:80`). |
| **Direction** | Internal processing / Both (processes database workflows, generates drafts, and synchronizes DU-E/audit tables). |
| **Counterparty** | Internal operations / local filesystem (`SFTP` / file generation for draft BL and audit tables). |
| **Transport** | DB-direct (`MSSQL` stored procedures and direct queries via `TFDQuery`), SFTP / File IO (`uMySFTPClient.pas`). |
| **BROKER tables written** | `TPROCESSO_DOCTOS` (`GravaArquivoDigitalizacao.pas:129`), `TPROCESSO_EXP_NF_ITEM_LPCO` (`MvProcessoDueNF.pas:921`), `TPROCESSO_EXP_NF_ITEM_NF_DRAWBACK` (`MvProcessoDueNF.pas:1503`), `CONFIGURACAO_GERAL` (`dmConfiguracoes.pas:80`), plus internal audit/stage tables (`BrokerMap.dgp`). |
| **Triggering** | Windows Service (`Application.CreateForm(TfmServer, fmServer)` in `MyIndaiaService/MyIndaiaService.dpr:15`) + GUI scheduler (`Application.CreateForm(TformMain, formMain)` in `MiniBroker.dpr:121`). |
| **Client-specific** | No (Core background automation and draft BL service). |
| **Evidence** | `GravaArquivoDigitalizacao.pas:129`, `MvProcessoDueNF.pas:921, 1503`, `dmConfiguracoes.pas:80`, `MiniBroker.dpr:121`, `MyIndaiaService/MyIndaiaService.dpr:15`. |

---

## 22. myindaia-minibrowser-381dcd2bfd82

| Field | Value |
| --- | --- |
| **Module** | `myindaia-minibrowser-381dcd2bfd82` |
| **Stated purpose** | Embedded Chromium web browser automation tool for customs portal and booking scraping (`01_system_topology.md` §2 Group 4). |
| **Process step(s) it performs** | Automates browser navigation (`CEF4Delphi` / `ICefBrowser`), interacts with government/external web portals (e.g. `nfe.fazenda.gov.br`), queries process tracking (`TPROCESSO`, `TFOLLOWUP`, `TPROCESSO_CNTR`), extracts booking/reference data, and inserts client reference records (`TREF_CLIENTE`) (`uMyIndaiaNovo.Booking.pas:144`, `ConnectionModule.dfm:87`, `uMiniBrowser.pas:174`). |
| **Direction** | Ingests into MyINDAIA / Both (scrapes portal summaries and inserts reference/booking records). |
| **Counterparty** | Government bodies and shipping portals (`nfe.fazenda.gov.br`, shipping line web booking interfaces). |
| **Transport** | Web / HTTP / Chromium (`CEF4Delphi` embedded browser in `uMiniBrowser.pas`), DB-direct (`MSSQL`). |
| **BROKER tables written** | `TREF_CLIENTE` (`INSERT INTO TREF_CLIENTE (NR_PROCESSO, NR_SEQUENCIA, CD_REFERENCIA, DT_REFERENCIA, TP_REFERENCIA, CD_AREA, CD_EMPRESA)` in `uMyIndaiaNovo.Booking.pas:144`). |
| **Triggering** | Scheduled (`Timer1` / `TimerAuxiliar: TTimer` in `uOpenBrowser.dfm:36`, `uMiniBrowser.dfm:417, 424`, and `uMyIndaiaNovo.Booking.pas:57`) + GUI forms (`Application.CreateForm(TfrmOpenBrowser, frmOpenBrowser)` in `MiniBrowser.dpr:70`). |
| **Client-specific** | No (Generic web scraping and browser automation utility). |
| **Evidence** | `uMyIndaiaNovo.Booking.pas:57, 144`, `uMiniBrowser.pas:174`, `ConnectionModule.dfm:87`, `MiniBrowser.dpr:70`. |

---

## 23. myindaia-myatualizanffaturamento-3a1cda969bd5

| Field | Value |
| --- | --- |
| **Module** | `myindaia-myatualizanffaturamento-3a1cda969bd5` |
| **Stated purpose** | ERP billing and invoice number synchronization tool between `BROKER` and `MYINDAIAV2` (`01_system_topology.md` §2 Group 1). |
| **Process step(s) it performs** | Queries document queues (`TPROCESSO_DOCTOS`), executes cross-database updates to ERP billing records (`MYINDAIAV2.DBO.BILLING`), and sends status/error emails (`DmBroker.pas:34, 171`, `DmBroker.dfm:65`, `UMain.pas:146`). |
| **Direction** | Emits out (exports invoice/billing updates from `BROKER` to `MYINDAIAV2`). |
| **Counterparty** | Internal ERP system (`MYINDAIAV2` database). |
| **Transport** | DB-direct (`MSSQL` queries across databases via `TFDQuery`), SMTP (`EnviaEmail` via `VW_CONFIG_MAIL`). |
| **BROKER tables written** | None (`UPDATE` targets `MYINDAIAV2.DBO.BILLING` in `DmBroker.dfm:65`; reads `BROKER.DBO.TPROCESSO_DOCTOS`). |
| **Triggering** | Scheduled (`tmrIntegracao: TTimer` using `LocalSettings.Intervalo` / `FTempoRestante` in `UMain.dfm:74` and `UMain.pas:151`) + GUI forms (`Application.CreateForm(TfrmMain, frmMain)` in `MyAtualizaNFFaturamento.dpr:18`). |
| **Client-specific** | No (Core internal ERP billing synchronization). |
| **Evidence** | `DmBroker.pas:34, 171`, `DmBroker.dfm:65`, `UMain.pas:146, 151`, `MyAtualizaNFFaturamento.dpr:18`. |

---

## 24. myindaia-mybaixaautomaticawallet-8e692039b4d2

| Field | Value |
| --- | --- |
| **Module** | `myindaia-mybaixaautomaticawallet-8e692039b4d2` |
| **Stated purpose** | Automated payment write-off and invoice settlement service via Senior Sapiens WSDL (`01_system_topology.md` §2 Group 1). |
| **Process step(s) it performs** | Queries process tracking (`TPROCESSO`, `TFOLLOWUP`), invokes Senior Sapiens SOAP web services (`titulosConsultarTituloCPIn`, `titulosSubstituirTitulosIn`, `titulosSubstituirTitulosIntitulosBaixar`), performs payment/title write-offs, and sends email notifications upon completion/error (`ConnectionModuleV2.dfm:288`, `uWalletWSDL_Pagamentos_novo.pas:4, 38-50`, `UMain.pas:71`). |
| **Direction** | Emits out / Both (consults and executes financial write-offs in external Senior Sapiens ERP). |
| **Counterparty** | ERP / Financial system (`Senior Sapiens` via SOAP WSDL). |
| **Transport** | SOAP / HTTP / WSDL (`http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos?wsdl` in `uWalletWSDL_Pagamentos_novo.pas:831`), DB-direct (`MSSQL` read queries via `ConnectionModuleV2.dfm`), SMTP (`EnviaEmail`). |
| **BROKER tables written** | None (pure financial integration querying `TPROCESSO` and `TFOLLOWUP`, executing write-offs in `Senior Sapiens` SOAP API). |
| **Triggering** | Scheduled (`tmrIntegracao: TTimer` using `LocalSettings.Intervalo` in `UMain.dfm:100` and `UMain.pas:82, 135`) + GUI forms (`Application.CreateForm(TfrmMain, frmMain)` in `myBaixaAutomaticaWallet.dpr:24`). |
| **Client-specific** | No (Core financial write-off automation). |
| **Evidence** | `uWalletWSDL_Pagamentos_novo.pas:4, 38-50, 831`, `ConnectionModuleV2.dfm:288`, `UMain.pas:71, 82, 135`, `myBaixaAutomaticaWallet.dpr:24`. |

---

## 25. myindaia-mybrowser-00d1a9833899

| Field | Value |
| --- | --- |
| **Module** | `myindaia-mybrowser-00d1a9833899` |
| **Stated purpose** | Multi-tabbed desktop Chromium web browser utility for customs and tax portal interactions (`01_system_topology.md` §2 Group 4). |
| **Process step(s) it performs** | Initializes embedded Chromium (`CEF4Delphi`), manages browser tabs, loads external portals (e.g. `nfe.fazenda.gov.br/portal/consultaRecaptcha.aspx`), and handles browser lifecycle and developer tools (`uMainForm.pas:28, 278-290, 312`). |
| **Direction** | Ingests into MyINDAIA (provides browser UI for portal interactions). |
| **Counterparty** | Government body (`SEFAZ` / `NF-e` portal). |
| **Transport** | Web / HTTP / Chromium (`CEF4Delphi` in `uMainForm.pas:10, 278-290`). |
| **BROKER tables written** | None (pure GUI/Chromium browser wrapper with no database queries). |
| **Triggering** | Manual / GUI forms (`Application.CreateForm(TMainForm, MainForm)` in `MyBrowser.dpr:27`, `Timer1: TTimer` with `Interval = 300` in `uMainForm.dfm:583`). |
| **Client-specific** | No (Generic desktop browser utility). |
| **Evidence** | `MyBrowser.dpr:27-28`, `uMainForm.pas:10, 28, 278-290, 312`, `uMainForm.dfm:583`. |

---

## 26. myindaia-myconsultalilote-544adfedaeb7

| Field | Value |
| --- | --- |
| **Module** | `myindaia-myconsultalilote-544adfedaeb7` |
| **Stated purpose** | Batch import licensing (`LI`) status polling and update tool (`01_system_topology.md` §2 Group 2). |
| **Process step(s) it performs** | Queries import licensing records (`TPROCESSO_LI`, `TPROCESSO_LI_STATUS`), generates batch XML inquiry requests (`busca-por-numeros-li`), retrieves and parses Siscomex/Portal Único return XML batches (`vXMLLI`), and updates LI status and timestamp records (`Conexao.dfm:476`, `Principal.pas:342, 436, 481, 570`). |
| **Direction** | Both (exports LI batch queries to Siscomex and updates local `TPROCESSO_LI` / `TPROCESSO_LI_STATUS` records). |
| **Counterparty** | Government body (`SISCOMEX` / `Portal Único`). |
| **Transport** | Web / HTTP / XML (`busca-por-numeros-li` XML batch file exchange/HTTP automation in `Principal.pas:570`), DB-direct (`MSSQL`). |
| **BROKER tables written** | `TPROCESSO_LI` (`UPDATE TPROCESSO_LI SET DT_ULT_MUDANCA_STATUS = GETDATE() WHERE NR_LI = :NR_LI AND NR_PROCESSO = :NR_PROCESSO` in `Conexao.dfm:476`, `Principal.pas:436`). |
| **Triggering** | Scheduled (`tmrIntegracao: TTimer` in `Principal.dfm:252`, `tmrDownloadFile` / `tmrAtualiza` in `uWebModulo.dfm:803, 817`) + GUI forms (`Application.CreateForm(TfrmMyConsultaLiLote, frmMyConsultaLiLote)` across `myConsultaLiLote.dpr:45-47`). |
| **Client-specific** | No (Generic batch LI consultation service). |
| **Evidence** | `Conexao.dfm:476`, `Principal.pas:342, 436, 481, 570`, `Principal.dfm:252`, `uWebModulo.dfm:803, 817`, `myConsultaLiLote.dpr:45-47`. |

---

## 27. myindaia-myconsultaretornointtra-f9d7115913c1

| Field | Value |
| --- | --- |
| **Module** | `myindaia-myconsultaretornointtra-f9d7115913c1` |
| **Stated purpose** | INTTRA shipping status return processing service (`01_system_topology.md` §2 Group 3). |
| **Process step(s) it performs** | Queries draft bill of lading records (`TPROCESSO_DRAFT_BL`), connects to INTTRA SFTP server (`TIntegracaoSFTP`), imports return EDI/status files, parses acknowledgment data, and updates draft BL status (`TelaPrincipal.pas:276, 648, 656, 658, 721, 723`). |
| **Direction** | Ingests into MyINDAIA (imports INTTRA return files via SFTP and updates local draft BL records). |
| **Counterparty** | Shipping / Port (`INTTRA` via SFTP). |
| **Transport** | SFTP (`TIntegracaoSFTP` / `libssh2` in `uConexoesIntegracoes.pas`, `TelaPrincipal.pas`), DB-direct (`MSSQL`). |
| **BROKER tables written** | `TPROCESSO_DRAFT_BL` (`SELECT * FROM TPROCESSO_DRAFT_BL ...` followed by dataset `Edit` and `Post` in `TelaPrincipal.pas:656, 658, 721, 723`). |
| **Triggering** | Scheduled (`Timer1: TTimer` using `Intervalo * 60000` in `TelaPrincipal.dfm:177` and `TelaPrincipal.pas:221`) + GUI forms (`Application.CreateForm(TForm1, Form1)` in `myConsultaRetornoInttra.dpr:15`). |
| **Client-specific** | No (Core INTTRA shipping return processor). |
| **Evidence** | `TelaPrincipal.pas:276, 648, 656, 658, 721, 723`, `TelaPrincipal.dfm:177`, `myConsultaRetornoInttra.dpr:15`. |

---

## 28. myindaia-mydigitalizacao-c74f55b2c566

| Field | Value |
| --- | --- |
| **Module** | `myindaia-mydigitalizacao-c74f55b2c566` |
| **Stated purpose** | Document digitization, indexing, and attachment management suite (`01_system_topology.md` §2 Group 1). |
| **Process step(s) it performs** | Digitizes, previews (`TfrmMyDigVisualizaArquivos`), replicates, and indexes document files, ingests Outlook email attachments (`uAnexaOutlook.pas`), queries process tracking, and registers document entries (`TPROCESSO_DOCTOS`), followup updates (`TFOLLOWUP`), and sequence keys (`SEQUENCIAL`) (`uReplicarArquivo.pas:206`, `uDigitalizacao.pas:590`, `dDigitalizacao.dfm:2495`, `KrUtil.pas:170`). |
| **Direction** | Internal processing / Ingests into MyINDAIA (manages document attachments and registers file metadata in database). |
| **Counterparty** | Local filesystem / email client (`Outlook` / local document files). |
| **Transport** | DB-direct (`MSSQL` queries via `TFDQuery`), File IO / COM (`Outlook` attachment interaction). |
| **BROKER tables written** | `TPROCESSO_DOCTOS` (`INSERT INTO TPROCESSO_DOCTOS ...` and `UPDATE TPROCESSO_DOCTOS ...` in `uReplicarArquivo.pas:206`, `uDigitalizacao.pas:590`), `TFOLLOWUP` (`UPDATE TFOLLOWUP` in `dDigitalizacao.dfm:2495`), `SEQUENCIAL` (`INSERT INTO SEQUENCIAL (CHAVE, ULTIMO_SEQ) ...` in `KrUtil.pas:170`). |
| **Triggering** | Scheduled (`Timer1: TTimer` with `Interval = 50` in `uEnviaEmail.dfm:352`, `uEnviaEmail.pas:43`) + GUI forms (`Application.CreateForm` across `myIndaiaDigitalizacao.dpr:53-58`, `uPreparaArquivos.pas:73`, `uAnexaOutlook.pas:80`, `uMotivo.pas:38`). |
| **Client-specific** | No (Core document digitization suite). |
| **Evidence** | `uReplicarArquivo.pas:206`, `uDigitalizacao.pas:590`, `dDigitalizacao.dfm:2495`, `KrUtil.pas:170`, `uEnviaEmail.dfm:352`, `myIndaiaDigitalizacao.dpr:53-58`. |

---

## 29. myindaia-myextratodue_chrome-739514f9fe5f

| Field | Value |
| --- | --- |
| **Module** | `myindaia-myextratodue_chrome-739514f9fe5f` |
| **Stated purpose** | DU-E (Declaração Única de Exportação) statement scraping worker via embedded Chromium browser (`01_system_topology.md` §2 Group 4). |
| **Process step(s) it performs** | Navigates government export portals via Chromium (`CEF4Delphi`), locates DU-E statements, extracts PDF/text/JSON document representations, and inserts document tracking records (`TPROCESSO_DOCTOS`) (`DmBroker.pas:184`, `uMiniBrowser.pas:118-143`). |
| **Direction** | Ingests into MyINDAIA (scrapes DU-E statements from portal and saves document entries locally). |
| **Counterparty** | Government body (`SISCOMEX` / `Portal Único DU-E`). |
| **Transport** | Web / HTTP / Chromium (`CEF4Delphi` in `uMiniBrowser.pas`), DB-direct (`MSSQL`). |
| **BROKER tables written** | `TPROCESSO_DOCTOS` (`INSERT INTO TPROCESSO_DOCTOS ...` in `DmBroker.pas:184`). |
| **Triggering** | Scheduled (`Timer1: TTimer`, `tmrClickGrid`, `tmrIntegracao` using `LocalSettings.Intervalo * 60000`, `tmrClickExtrato` across `uMiniBrowser.dfm:515-538`, `uMiniBrowser.pas:118-143, 383, 1870`) + GUI browser forms (`Application.CreateForm(TMiniBrowserFrm, MiniBrowserFrm)` in `myExtratoDue_Chrome.dpr:73`). |
| **Client-specific** | No (Generic DU-E statement retrieval tool). |
| **Evidence** | `DmBroker.pas:184`, `uMiniBrowser.pas:118-143, 383, 1870`, `uMiniBrowser.dfm:515-538`, `myExtratoDue_Chrome.dpr:73`. |

---

## 30. myindaia-myextratoduimp-5ae6aeb9b97d

| Field | Value |
| --- | --- |
| **Module** | `myindaia-myextratoduimp-5ae6aeb9b97d` |
| **Stated purpose** | DUIMP import statement retrieval and PDF/document generation worker via embedded Chromium browser (`01_system_topology.md` §2 Group 4). |
| **Process step(s) it performs** | Navigates Portal Único DUIMP screens via Chromium (`CEF4Delphi`), captures import statement extracts (`extrato DUIMP`), records document files (`TPROCESSO_DOCTOS`), and updates followup records (`TFOLLOWUP`) (`DmBroker.pas:195, 212`, `uMiniBrowser.pas:118-144`). |
| **Direction** | Ingests into MyINDAIA (scrapes DUIMP statements from portal and records files/followup status). |
| **Counterparty** | Government body (`Portal Único DUIMP`). |
| **Transport** | Web / HTTP / Chromium (`CEF4Delphi` in `uMiniBrowser.pas`), DB-direct (`MSSQL`). |
| **BROKER tables written** | `TPROCESSO_DOCTOS` (`INSERT INTO TPROCESSO_DOCTOS ...` in `DmBroker.pas:195`), `TFOLLOWUP` (`UPDATE TFOLLOWUP ...` in `DmBroker.pas:212`). |
| **Triggering** | Scheduled (`Timer1: TTimer`, `tmrClickGrid`, `tmrIntegracao` using `LocalSettings.Intervalo * 60000`, `tmrClickExtrato`, `tmrExtratoDialog` across `uMiniBrowser.dfm:515-545`, `uMiniBrowser.pas:118-144, 385, 1879`) + GUI browser forms (`Application.CreateForm(TMiniBrowserFrm, MiniBrowserFrm)` in `myExtratoDuimp.dpr:73`). |
| **Client-specific** | No (Generic DUIMP statement retrieval tool). |
| **Evidence** | `DmBroker.pas:195, 212`, `uMiniBrowser.pas:118-144, 385, 1879`, `uMiniBrowser.dfm:515-545`, `myExtratoDuimp.dpr:73`. |

---

## 31. myindaia-myfilemanager-bf75c675cd87

| Field | Value |
| --- | --- |
| **Module** | `myindaia-myfilemanager-bf75c675cd87` |
| **Stated purpose** | Document export and bulk local file copying/management utility (`01_system_topology.md` §2 Group 1). |
| **Process step(s) it performs** | Queries document attachments (`TPROCESSO_DOCTOS`), document types (`TTIPO_DOCTO`), and client references (`TREF_CLIENTE`), creates organized local destination folders, and copies physical attachment files across directories (`Principal.pas:226-246, 259-260`, `Principal.dfm:480, 572, 619`). |
| **Direction** | Internal processing (organizes, copies, and exports local document files). |
| **Counterparty** | Local filesystem / network file storage (`PathDigitalizacao`). |
| **Transport** | DB-direct (`MSSQL` read queries via `TADOQuery`), File IO (`CopyFile` / local filesystem operations). |
| **BROKER tables written** | None (pure file management utility that reads `TPROCESSO_DOCTOS`, `TTIPO_DOCTO`, and `TREF_CLIENTE`). |
| **Triggering** | Manual / GUI forms (`Application.CreateForm(TfrmMyFileManager, frmMyFileManager)` in `MyFileManager.dpr:27`, `btnCopiarClick`). |
| **Client-specific** | No (Core document copying/export utility). |
| **Evidence** | `Principal.pas:20-23, 226-246, 259-260`, `Principal.dfm:480, 572, 619`, `MyFileManager.dpr:27`. |

---

## 32. myindaia-myindaia-web-138a956541b9

| Field | Value |
| --- | --- |
| **Module** | `myindaia-myindaia-web-138a956541b9` |
| **Stated purpose** | Primary customer and operational web portal (`ASP` / `ASP.NET`) for tracking, KPI presentation, and ticket management (`01_system_topology.md` §2 Group 1). |
| **Process step(s) it performs** | Serves web application screens (`.asp` / `.aspx`), authenticates users, displays process tracking and KPI dashboards (`MBF`), manages issue tickets (`pendências`), and executes direct SQL inserts and updates on operational and tracking tables (`detalhe_pendencia.asp:307, 311`, `mbf_novo.aspx:81`, `logon.asp:134, 326`). |
| **Direction** | Both (serves web UI to external/internal users and directly queries/updates central database tables). |
| **Counterparty** | External client / internal user (Web browser clients). |
| **Transport** | Web / HTTP / IIS (`ASP` and `ASP.NET` applications), DB-direct (`MSSQL` via ADO/ODBC connections). |
| **BROKER tables written** | `TPROCESSO_PENDENCIAS` (`UPDATE TPROCESSO_PENDENCIAS ...` in `detalhe_pendencia.asp:311`), `TPROCESSO_PENDENCIAS_LOG` (`INSERT INTO TPROCESSO_PENDENCIAS_LOG ...` in `detalhe_pendencia.asp:307, 368`), `TMBF_INFO` (`INSERT INTO TMBF_INFO ...` across `mbf_novo.aspx:81`, `UPDATE TMBF_INFO ...` in `mbf_personaliza.aspx:67`), `TMBF_SELECIONADO` (`INSERT INTO TMBF_SELECIONADO` in `mbf_personaliza.aspx:176`), `TMBF_KPI` (`INSERT INTO TMBF_KPI` in `mbf_personaliza.aspx:232`), `TMBF_OUTROS` (`INSERT INTO TMBF_OUTROS` in `mbf_personaliza.aspx:309`), `TMBF_RESULTADO` (`UPDATE TMBF_RESULTADO ...` in `mbf_meta_atualiza.asp:17`), `TUSUARIO` (`UPDATE TUSUARIO ...` across `logon.asp:134, 326`, `popup/muda_exibe_detalhe.asp:35`), `TRELATORIOS` (`UPDATE TRELATORIOS ...` across `controle/pendencias/controle_pendencias_excel.asp:390`, `controle/viagem/cadastro_viagem_excel.asp:304`). |
| **Triggering** | On-demand / Web requests (HTTP GET/POST requests from browsers executing server scripts in IIS). |
| **Client-specific** | No (Core central web application). |
| **Evidence** | `detalhe_pendencia.asp:307, 311, 368`, `mbf_novo.aspx:81`, `mbf_personaliza.aspx:67, 176, 232, 309`, `mbf_meta_atualiza.asp:17`, `logon.asp:134, 326`, `popup/muda_exibe_detalhe.asp:35`. |

---

## 33. myindaia-myinseredigitalizacao-3d7462147a3e

| Field | Value |
| --- | --- |
| **Module** | `myindaia-myinseredigitalizacao-3d7462147a3e` |
| **Stated purpose** | Automated directory scanner and document ingestion daemon (`01_system_topology.md` §2 Group 1). |
| **Process step(s) it performs** | Scans configured network paths (`TPARAMETROS..PATH_DIGITALIZACAO`), parses filenames for process and document type codes (`NR_PROCESSO`, `CD_TIPO_DOCTO`), copies physical files to target document folders, and inserts document attachment entries (`Principal.pas:268-275, 362`, `Principal.dfm:793`). |
| **Direction** | Ingests into MyINDAIA (ingests physical files from network drop folders and registers metadata). |
| **Counterparty** | Local filesystem / network file storage (`PATH_DIGITALIZACAO`). |
| **Transport** | DB-direct (`MSSQL` queries via `TFDQuery`), File IO (`CopyFile` / local folder traversal). |
| **BROKER tables written** | `TPROCESSO_DOCTOS` (`INSERT INTO TPROCESSO_DOCTOS (NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO, ID_TABELA) VALUES ...` in `Principal.dfm:793`, `Principal.pas:268-275`). |
| **Triggering** | Scheduled (`tmrIntervalo: TTimer` using `LocalSettings.Intervalo` / `FTempoRestante` across `Principal.dfm:714`, `Principal.pas:341, 560`) + GUI forms (`Application.CreateForm(TfrmMyInsereDigitalizacao, frmMyInsereDigitalizacao)` in `MyInsereDigitalizacao.dpr:14`). |
| **Client-specific** | No (Core automated document ingestion service). |
| **Evidence** | `Principal.pas:268-275, 341, 362, 560`, `Principal.dfm:714, 793`, `MyInsereDigitalizacao.dpr:14`. |

---

## 34. myindaia-myintegracaonestle-5d418d799ef5

| Field | Value |
| --- | --- |
| **Module** | `myindaia-myintegracaonestle-5d418d799ef5` |
| **Stated purpose** | Client-specific bidirectional integration robot for Nestlé (`01_system_topology.md` §2 Group 3). |
| **Process step(s) it performs** | Connects to Nestlé FTP server (`TIdFTP`), downloads inbound XML instruction/shipment files (`Envio`, `Complemento`), registers order/process tracking tables across both `BROKER` and `MYINDAIA` databases, generates status return XMLs (`EXPO`, `IMPO`), and uploads return files back to FTP (`Main.pas:551, 615, 779, 1222, 2876, 2881`). |
| **Direction** | Both (downloads shipment/order XMLs from Nestlé FTP and uploads return status/event XMLs). |
| **Counterparty** | External client (`Nestlé` via FTP and XML exchange). |
| **Transport** | FTP (`TIdFTP` / `IdFTP1` in `Main.pas:551, 615`), Web / XML (Inbound/outbound XML document schemas), DB-direct (`MSSQL` across `BROKER` and `MYINDAIA` databases via `TFDQuery`). |
| **BROKER tables written** | `TPROCESSO` (`INSERT INTO TPROCESSO` and `UPDATE TPROCESSO` in `Main.pas:3903, 3941, 3989, 4065`), `TFOLLOWUP` (`UPDATE TFOLLOWUP` in `Main.pas:3216`), `TINSTRUCAO_DESEMBARACO` (`INSERT INTO TINSTRUCAO_DESEMBARACO` and `UPDATE TINSTRUCAO_DESEMBARACO` across `DmBroker.dfm:822`, `Main.pas:3326, 3368`), `TINSTRUCAO_DESEMBARACO_PEDIDO` (`INSERT INTO TINSTRUCAO_DESEMBARACO_PEDIDO` in `DmBroker.dfm:952`, `Main.pas:3395`), `TPO` (`INSERT INTO TPO` and `UPDATE TPO` in `DmBroker.dfm:999`, `Main.pas:3417, 3561`), `TPO_ITEM` (`INSERT INTO TPO_ITEM` in `DmBroker.dfm:1495`, `Main.pas:3639`), `TRAP_FORNECIMENTO_LOTE` (`INSERT INTO TRAP_FORNECIMENTO_LOTE` across `DmBroker.dfm:706`, `Main.pas:2663`), `TREF_CLIENTE` (`INSERT INTO TREF_CLIENTE ...` in `Main.pas:1375, 4120`), `TEMPRESA_EST` (`INSERT INTO TEMPRESA_EST` in `Main.pas:2001`), `TEMPRESA_EST_GRUPO` (`INSERT INTO TEMPRESA_EST_GRUPO` in `Main.pas:2037`), `TTERMO_PAGTO` (`INSERT INTO TTERMO_PAGTO` across `Main.pas:2223`), `TMERCADORIA` (`INSERT INTO TMERCADORIA` across `Main.pas:4667`), `TMERCADORIA_EXP` (`INSERT INTO TMERCADORIA_EXP` in `Main.pas:2295`), `TEXPORTADOR_DI` (`INSERT INTO TEXPORTADOR_DI` in `Main.pas:4172`), `TFABRICANTE_DI` (`INSERT INTO TFABRICANTE_DI` in `Main.pas:4178`). (Also writes `MYINDAIA..TRAP`, `MYINDAIA..TRAP_FORNECIMENTO`, `MYINDAIA..TTERMO_PAGTO` in `DmBroker.dfm:60, 513`, `Main.pas:2236, 2399, 2602`). |
| **Triggering** | Scheduled (`tmrIntegracao: TTimer` using `LocalSettings.Intervalo * 60000` / `FTempoRestante` across `Main.dfm:165`, `Main.pas:278, 481, 2828`) + GUI forms (`Application.CreateForm` across `MyIntegracaoNestle.dpr:16-19`). |
| **Client-specific** | Yes (`Nestlé` - `GrupoNestle = '155'`). |
| **Evidence** | `Main.pas:413, 551, 615, 779, 1222, 2876, 2881, 3903, 3941, 4172`, `DmBroker.dfm:60, 513, 706, 822, 952, 999, 1495`, `Main.dfm:165`, `MyIntegracaoNestle.dpr:16-19`. |

---

## 35. myindaia-mylogin-437606203177

| Field | Value |
| --- | --- |
| **Module** | `myindaia-mylogin-437606203177` |
| **Stated purpose** | Central user authentication, session control, password management, and system launcher (`01_system_topology.md` §2 Group 1). |
| **Process step(s) it performs** | Authenticates users against `TUSUARIO`, manages password histories (`TB_USUARIO_SENHAS`), tracks user logins/sessions, monitors running systems (`TimerSistemasParados`), and provides login UI and shared integration DLL (`uConexao.pas:371, 681`, `DLL Integração/uDefaultLogin.pas:161`). |
| **Direction** | Internal processing (authenticates users, manages sessions, and updates user/password records). |
| **Counterparty** | Internal user / operator (Desktop client applications). |
| **Transport** | DB-direct (`MSSQL` queries via `TFDQuery`), DLL / Windows IPC (`uDefaultLogin.pas` exported login form). |
| **BROKER tables written** | `TUSUARIO` (`UPDATE TUSUARIO ...` across `DLL Integração/uDefaultLogin.pas:161, 226`, `uConexao.pas:681, 692`), `TB_USUARIO_SENHAS` (`INSERT INTO TB_USUARIO_SENHAS VALUES(...)` in `uConexao.pas:371`). |
| **Triggering** | Scheduled (`TimerSistemasParados: TTimer` with `Interval = 30000`, `TimerParar: TTimer` in `uConexao.dfm:540, 546`, `tmrSistemas: TTimer` in `Principal.dfm:1873`) + GUI forms / DLL exports (`Application.CreateForm` across `MyLogin.dpr:34-37`, `DLL Integração/uDefaultLogin.pas:66`). |
| **Client-specific** | No (Core authentication suite). |
| **Evidence** | `uConexao.pas:371, 681, 692`, `DLL Integração/uDefaultLogin.pas:66, 161, 226`, `uConexao.dfm:540, 546`, `Principal.dfm:1873`, `MyLogin.dpr:34-37`. |

---

## 36. myindaia-mypagamentomercante-c4ca676b536f

| Field | Value |
| --- | --- |
| **Module** | `myindaia-mypagamentomercante-c4ca676b536f` |
| **Stated purpose** | AFRMM (Adicional ao Frete para Renovação da Marinha Mercante) fee calculation and payment automation tool (`01_system_topology.md` §2 Group 4). |
| **Process step(s) it performs** | Navigates the Mercante government portal (`wb: TWebBrowser`), calculates AFRMM exemption/suspension/integral payment vouchers (`533 - Pagamento de Marinha Mercante`), captures payment receipts as document attachments (`TPROCESSO_DOCTOS`), logs transactions (`TPAGAMENTO_MERCANTE_LOG`), and updates process/followup status (`UPgmtoMercante.pas:155, 258`, `DmBroker.pas:420`, `DmBroker.dfm:29, 336, 649`). |
| **Direction** | Both (executes AFRMM payments on external Mercante portal and saves vouchers/status locally). |
| **Counterparty** | Government body (`Marinha Mercante` / `Portal Mercante transportes.gov.br`). |
| **Transport** | Web / HTTP / OLE WebBrowser (`wb: TWebBrowser` / COM `IWebBrowser` in `uNavPgmtoMercante.pas:55, 1539`), DB-direct (`MSSQL`). |
| **BROKER tables written** | `TPROCESSO_DOCTOS` (`INSERT INTO TPROCESSO_DOCTOS ...` in `DmBroker.pas:420`), `TPAGAMENTO_MERCANTE_LOG` (`INSERT INTO TPAGAMENTO_MERCANTE_LOG (DT_PGMTO, ...` in `DmBroker.dfm:336`), `TPROCESSO` (`UPDATE TPROCESSO ...` in `DmBroker.dfm:649`), `TFOLLOWUP` (`UPDATE TFOLLOWUP ...` in `DmBroker.dfm:29`). |
| **Triggering** | Manual / GUI forms (`Application.CreateForm` across `MyPagamentoMercante.dpr:41-42`, `btnPagarAFRMMClick`), with internal UI step automation timers (`tmrImprimir: TTimer` with `Interval = 2000`, `tmrSalvar`, `tmrVerificaArquivoSalvo`, `tmrErroWeb2` in `uNavPgmtoMercante.dfm:3946-3966`). |
| **Client-specific** | No (Generic AFRMM payment voucher tool). |
| **Evidence** | `UPgmtoMercante.pas:155, 258`, `uNavPgmtoMercante.pas:55, 1539`, `uNavPgmtoMercante.dfm:3946-3966`, `DmBroker.pas:420`, `DmBroker.dfm:29, 336, 649`, `MyPagamentoMercante.dpr:41-42`. |

---

---

## Verification audit (performed by RL, not by the generating agent)

| Check | Result |
| --- | --- |
| Module directories on disk | 48 |
| Modules covered in this file | **36** |
| Cited source file paths | 42 |
| Cited paths that resolve to a real file | **42 / 42** |

**This file is incomplete.** The generating run terminated with an error partway through, having
worked alphabetically. The 12 missing modules are continued in
`W3_module_process_map_part2.md` and include several of the most process-critical:
`robodue` (the DU-E robot), `mywebapi` (main REST API), `tmserviceapi`, and the three
`myparametrizacao*` modules. **Do not read this file as a complete automation inventory** — the
"which phases have no automation" synthesis in particular is unreliable until part 2 is merged,
because an absent module here means "not yet examined", not "does not exist".

### Caveat

`NOT DETERMINED` appears zero times, though the plan explicitly invited it. The citations all
resolve, so the file is evidence-grounded — but as with `W2_coded_rules.md`, treat the *characterisations*
as a draft for human correction rather than as established fact. This is exactly the material a
walkthrough with Wagner can correct quickly, which is its intended use.
