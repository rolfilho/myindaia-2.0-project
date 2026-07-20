# W3 (part 2) — Module → process participation, remaining 12 modules

**Produced by RL directly**, by grep over the module trees, after five failed delegation attempts.
Every claim below traces to a grep hit in the named module. Where the evidence does not support a
claim, the field says `NOT DETERMINED` rather than a guess.

Completes `W3_module_process_map.md`, which covered 36 of 48 modules before its run failed.

---

## `myindaia-robodue-6c5ee2fa00fa` ⭐

**The single most process-critical module in this batch.**

| Field | Content |
| --- | --- |
| Entry point | `RoboDue.dpr` · 9 `.pas`, 3 `.dfm` |
| Process step | Registers and consults **DU-E** (Declaração Única de Exportação) against Portal Único |
| Direction | Both — pulls DU-E state from government, writes results back into MyINDAIA |
| Counterparty | **Government** — Portal Único Siscomex |
| Transport | REST over HTTPS to `portalunico.siscomex.gov.br`, incl. `/due/api/due/listar-due-consulta`, `/due/api/due/obterDueComItensResumidos`, `/due/api/ext/due/consultarDadosComItensResumidosDUE`, and a PDF report endpoint |
| BROKER tables written | **`INSERT INTO TFOLLOWUP`**, `UPDATE TFOLLOWUP`, `UPDATE TPROCESSO`, `INSERT INTO TPROCESSO_DOCTOS` |
| Triggering | 1 file with `TTimer`/`OnTimer` → scheduled polling |
| Client-specific | No |
| Notable | 24 hits on `CERTIFICAD*` — carries its own digital-certificate handling, directly relevant to DEC-05 (A1 vs. A3) |

> **Why this matters for T-54.** This module writes *new event rows* into `TFOLLOWUP` — the table
> whose trigger `TR_FOLLOWUP` cascades state across `TPROCESSO`, `TPROCESSO_EXP` and beyond. It is
> the clearest existing precedent for exactly the write-back an agent layer would need, and it
> already exists and works. Any claim that writing to `TFOLLOWUP` is prohibitively risky has to
> explain why this robot does it today.

---

## `myindaia-mywebapi-78aadf88fac7`

| Field | Content |
| --- | --- |
| Entry point | `MyWebApi.dpr` · 7 `.pas` |
| Process step | Main REST API serving process tracking and follow-up data to client applications |
| Direction | Read-heavy out of MyINDAIA; one write path |
| Counterparty | Internal / client-facing apps |
| Transport | TMS **Sparkle/XData** (19 `XData`, 14 `Sparkle` hits); endpoints on `localhost:2001` and `localhost:443` under `/indaia/api` and `/indaia/filelisting/` |
| Tables touched | `TFOLLOWUP` (**96 hits — by far the heaviest reader in the codebase**), `TPROCESSO` (22), `TEVENTO` (5), `TETAPA` (1) |
| Writes | `INSERT INTO DEVICE_NOTIFICATION` only — **no workflow-table writes** |
| Triggering | Service; no timer |
| Client-specific | One `NESTLE` reference |
| Notable | Mentions both `DUIMP` (10) and `DUE` (9) — serves import and export alike |

> Read-only against the workflow tables. On the read/write split that governs T-54, this whole
> surface is in the cheap category.

---

## `myindaia-myparametrizacao-191edc3d118c`

| Field | Content |
| --- | --- |
| Entry point | `myParametrizacao.dpr`, plus `BrowserTerminal.dpr` · 11 `.pas`, 5 `.dfm` |
| Process step | Customs **parametrização** — obtaining and recording the clearance channel for a process |
| Direction | Both |
| Counterparty | **Government** — Siscomex (`www1c.siscomex.receita.fazenda.gov.br`) |
| Transport | Screen-driven browser automation (`BrowserTerminal.dpr`) against the Siscomex web UI |
| Tables written | `UPDATE TFOLLOWUP`, `UPDATE TPROCESSO`, `UPDATE TPROCESSO_DOCTOS`, `INSERT INTO TPROCESSO_PARAMETRIZACAO`, `INSERT INTO TPROCESSO_MANTRA` |
| Tables read | `TFOLLOWUP` (27), `TPROCESSO` (13), `TDECLARACAO_IMPORTACAO` (6) |
| Triggering | 3 timer files → scheduled |
| Client-specific | No |
| Notable | Fetches channel icons from `myindaiaweb.com.br/imagens/tp_canal_*` — the clearance channel (verde/amarelo/vermelho) is surfaced to clients |

---

## `myindaia-myparametrizacaoli-b96350d8db6f`

| Field | Content |
| --- | --- |
| Entry point | `myParametrizacaoLI.dpr` · 8 `.pas`, 3 `.dfm` |
| Process step | **Licença de Importação (LI)** registration |
| Direction | Both |
| Counterparty | **Government** — Siscomex Importação (`siscomexImpweb-7`, on both `www1c` and `www4c` hosts) |
| Transport | Browser automation against the Siscomex LI web application |
| Tables written | `UPDATE TLICENCA_IMPORTACAO`, `UPDATE TFOLLOWUP`, `INSERT INTO TLICENCA_IDENT_TRANSMISSAO`, `INSERT INTO DESTAQUE_NCM`, `INSERT INTO DETALHE_MERC_COM_TRATAMENTO` |
| Tables read | `TLICENCA_IMPORTACAO` (9), `TLICAPA` (5), `TLINCM(S)`, `TLIITEM(S)` |
| Triggering | 2 timer files → scheduled |
| Client-specific | No |

---

## `myindaia-myparametrizacaoliconsulta-0bbb34479da7`

| Field | Content |
| --- | --- |
| Entry point | `myParametrizacaoLIConsulta.dpr` · 9 `.pas`, 4 `.dfm` |
| Process step | **LI status consultation** — polls the anuência (consenting-agency) status of licences |
| Direction | Ingests government status into MyINDAIA |
| Counterparty | **Government** — Siscomex + órgãos anuentes |
| Transport | Browser automation; also `myindaiaweb.com.br/redireciona_doc.asp` |
| Tables written | `UPDATE TFOLLOWUP`, `INSERT INTO TPROCESSO_LI_ORGAO_ANUENTE`, `INSERT INTO TPROCESSO_LI_STATUS`, `INSERT INTO TPROCESSO_DOCTOS`, `INSERT INTO FILA_CONSULTA_LI_CMD` |
| Tables read | `TFOLLOWUP` (12), `TPROCESSO` (6), `TLIANUENCIA(S)` |
| Triggering | 2 timer files → scheduled polling |
| Client-specific | No |
| Notable | `FILA_CONSULTA_LI_CMD` is a **command queue table** — this module is driven by queued work items, a pattern worth noting for the new architecture |

---

## `myindaia-myprocessasda-8e00fd6807b7`

| Field | Content |
| --- | --- |
| Entry point | `MyProcessaSDA.dpr` · 10 `.pas`, 3 `.dfm` |
| Process step | **SDA** processing — despachante (customs broker) guides and union integration (294 `SDA` hits) |
| Direction | Both |
| Counterparty | **Sindicato dos Despachantes** — `sys.sindaerj.org.br/despachante/` (`login.php`, `consulta_guias.php`, `integracao.php`) and `sindicato.sdas.org.br` |
| Transport | HTTP against a third-party PHP portal |
| Tables written | `INSERT INTO TPROCESSO_DOCTOS` |
| Tables read | `TPROCESSO` (5), `TFOLLOWUP` (1), `TDECLARACAO_IMPORTACAO` (1) |
| Triggering | 1 timer file → scheduled |
| Client-specific | One `NESTLE` reference |
| Notable | A **counterparty class absent from the current process map**: a professional-association portal, neither client nor government nor carrier |

---

## `myindaia-siscomex-f566798206a5`

| Field | Content |
| --- | --- |
| Entry point | `Siscomex.dpr` · 9 `.pas` |
| Process step | Shared Siscomex support library — NCM classification and exchange-rate reference data |
| Direction | Internal |
| Counterparty | `NOT DETERMINED` — no endpoints found in `.pas`; per the Report this is a shared library, not a live integration |
| Tables written | `INSERT INTO TNCM`, `UPDATE TNCM`, `INSERT INTO TTAXA_CAMBIO` — **reference tables only, no workflow tables** |
| Triggering | 1 timer file |
| Client-specific | No |

---

## `myindaia-tmserviceapi-9e2444cd2801`

| Field | Content |
| --- | --- |
| Entry point | `TMService.dpr`, `Token.dpr` · 7 `.pas`, 4 `.dfm` |
| Process step | Inland transport (TM) service API — ingests dispatcher and carrier spreadsheets |
| Direction | Ingests into the `TM` database |
| Counterparty | Despachantes and transportadoras |
| Transport | TMS Sparkle/XData REST |
| Tables written | `PLANILHAS_DESPACHANTES`, `PLANILHAS_TRANSPORTADORAS`, `planilha_despachante_linhas`, `planilha_transportadora_linhas` — **all in `TM`, no BROKER workflow tables** |
| Triggering | Windows service |
| Client-specific | No |
| Notable | Confirms the Report's finding that `TM` is decoupled from `BROKER` at the database level. The table names ("planilhas") also confirm **spreadsheets are the native interchange format** with these counterparties |

---

## `myindaia-webapp-27bf47ec6687`

| Field | Content |
| --- | --- |
| Entry point | `index.html` — **not a Delphi module.** 98 files: 38 `.js`, 14 `.css`, 6 `.html` |
| Process step | Client-facing **PWA portal** for process consultation. Pages: `consproimp.html`, `consproexp.html`, `processosemandamentoimp.html`, `processosemandamentoexp.html`, `statusprocess.html` |
| Direction | Read-only presentation to clients |
| Counterparty | **Clients** |
| Transport | Browser; `sw.js` service worker + `manifest.json` → installable PWA, offline-capable |
| BROKER tables written | None directly — consumes the API layer |
| Triggering | User-initiated |
| Notable | The page names confirm the **import/export split is carried through to the client-facing surface**, which corroborates `CD_PRODUTO` as a genuine MECE axis rather than an internal bookkeeping code. Contains one `Cosulta.sql` file (sic) |

---

## `myindaia-mypatterns-6a006d1a1933` — no business process

| Field | Content |
| --- | --- |
| Entry point | `PatternsDemo.dpr` · 27 `.pas`, 15 `.dfm` |
| Process step | **None.** Shared UI/ORM framework — base forms, CRUD scaffolding, query wrappers |
| Counterparty | `NOT DETERMINED` — none; internal foundation layer |
| Tables written | `INSERT INTO AUDITORIA` only |
| Client-specific | No |

> **Grep false-positive warning, recorded so it is not repeated:** naive matching reports 150 hits
> for `TLIST` and 10 for `TLIN` in this module. These are Delphi's own `TList` / `TListView`
> classes, **not database tables**. Its `TSERVICO` / `TPROCESSO` / `TFOLLOWUP` hits (2 each) are
> demo/scaffold references, not process logic.

---

## `myindaia-tmsaurelius-80b286d02ea6` — no business process

| Field | Content |
| --- | --- |
| Entry point | `AureliusGettingStarted.dpr`, `MusicLibraryVCL.dpr` · 145 `.pas` |
| Process step | **None.** Third-party TMS Aurelius ORM, vendor source checked into the repository |
| Counterparty | `NOT DETERMINED` — none |
| Tables written | None. "Update collection", "update FValue" etc. are ORM internals, not SQL |
| Notable | The demo apps (`MusicLibrary`, `GettingStarted`) are **vendor samples shipped in the repo** — dead weight, and a small piece of evidence for the Report's finding that the repository was never cleaned |

---

## `myindaia-mysendmail-3920d5fcaa87`

| Field | Content |
| --- | --- |
| Entry point | `MySendMail.dpr`, `Demo.dpr` · 5 `.pas`, 1 `.dfm` |
| Process step | Outbound email notification utility |
| Direction | Emits out of MyINDAIA |
| Counterparty | Clients and internal staff, via SMTP (20 hits) |
| Tables written | **None** |
| Triggering | Called as a library by other modules |
| Client-specific | No |

> Relevant to the **E0 blind spot**: this is the seam where the system hands off to email. What the
> system can prove is that a message was sent; everything that happens in the mailbox afterwards is
> invisible to us and has to come from people (gap register item B3).

---

## Synthesis notes for these 12

**Government integration is the dominant pattern, and it is fragile.** Four of the twelve
(`robodue`, `myparametrizacao`, `myparametrizacaoli`, `myparametrizacaoliconsulta`) exist solely to
get data in and out of Siscomex. Only `robodue` uses a documented REST API (Portal Único); the three
`parametrizacao*` modules drive the **Siscomex web UI through browser automation** against
hardcoded hosts. That is the most brittle integration class in the estate and it sits on the
critical path of both import and export.

**Write-back is already routine, not hypothetical.** `robodue` inserts into `TFOLLOWUP`; all three
`parametrizacao*` modules update it. The precedent for machine-written follow-up events is
well established in the legacy system — which materially weakens the argument that an agent layer
writing to `TFOLLOWUP` represents a novel risk (T-54, DEC-06).

**Two new counterparty classes** surface here that the process map must accommodate: the
**despachante union portal** (`myprocessasda`) and **órgãos anuentes** for import licences
(`myparametrizacaoliconsulta`). Neither is a client, a carrier, or the tax authority.

**A queue-driven pattern already exists** — `FILA_CONSULTA_LI_CMD` — showing the legacy system
already models asynchronous work items. Worth reusing conceptually rather than presenting as new.
