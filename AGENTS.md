# Indaiá Logística — MyINDAIA Modernization Project — Cowork Briefing

## Purpose & Goal

This folder (`/Users/ricardo/Projects/2026 Indaia`) is the **primary execution and collaboration workspace** for the MyINDAIA platform modernization — a Greenfield rewrite of the legacy Delphi/Classic ASP customs brokerage and international logistics system to a modern cloud-native stack.

The **GOAL** of this project is to deliver its contracted deliverables outlined in [Anexo_I_Escopo_e_Insumos_Discovery.md](00_Scope/Anexo_I_Escopo_e_Insumos_Discovery.md). These deliverables consist of definitive architectural decisions, empirical benchmarks, and execution recommendations (`FastAPI`, `React 19`, `Supabase`/`RDS`, `n8n`/`LangGraph`) that bridge the CEO vision with the internal engineering backlog.



---

## Detailed Folder Structure & Specific Pointers

```
2026 Indaia/
├── AGENTS.md                        ← You are here (main reference & structural briefing)
├── CLAUDE.md                        ← Thin pointer to AGENTS.md
├── MEMORY.md                        ← Dynamic session memory (status, active tasks, live decisions)
├── 00_Scope/
│   └── Anexo_I_Escopo_e_Insumos_Discovery.md ← Reference scope of the project and deliverables
├── 01_Inputs_and_Resources/         ← Core technical inputs, roadmaps, and audits
│   ├── My Indaia 2.0 CEO Vision/
│   │   └── README.md                ← Source of information for CEO vision (links to PVD v4, Parecer da Banca v2, and Especificação dos 10 Agentes v2)
│   ├── My Indaia 2.0 Export + Import v0 plan/
│   │   └── Migration_plan_index.md  ← Index for the 26-week v0 migration plan, target architecture, and decision triage
│   ├── MyIndaia 1.0/
│   │   ├── Codebase and Database/   ← SHOULD NOT BE READ unless necessary (all info is synthesized in Report_index.md below)
│   │   └── Report/
│   │       └── Report_index.md      ← Synthesized technical audit of legacy Delphi repos and SQL Server BROKER database
│   ├── MyIndaia 2.0 Export/         ← Wagner's internal team build (React 19 + FastAPI + Supabase) & comparison documents
│   └── A2_Client_Information_Request_v2.md ← Client onboarding data request for Discovery kickoff
└── 02_Discovery_Workstreams/        ← Active execution folders for Discovery sprints
```

### Critical Pointers on Reading Files

* **Do NOT read raw legacy files under `MyIndaia 1.0/Codebase and Database/`** unless debugging a specific query. All relevant schema and stored procedure behavior (~2,419 SPs in `BROKER`) is indexed inside [Report_index.md](01_Inputs_and_Resources/MyIndaia%201.0/Report/Report_index.md).
* **For CEO Vision and Product Specs**, start at [CEO Vision README.md](01_Inputs_and_Resources/My%20Indaia%202.0%20CEO%20Vision/README.md), which explains the hierarchy between the Walking Skeleton (`Parecer da Banca v2`), the product requirements (`PVD v4`), and agent specifications (`Especificação dos 10 Agentes v2`).
* **For Target Architecture and v0 Plan**, navigate through [Migration_plan_index.md](01_Inputs_and_Resources/My%20Indaia%202.0%20Export%20+%20Import%20v0%20plan/Migration_plan_index.md).

---

## Target Architecture & Deliverable Framework

The initial target architecture is defined across the scope ([Anexo I](00_Scope/Anexo_I_Escopo_e_Insumos_Discovery.md)), CEO vision, and v0 plan:

* **Target Foundation:** `FastAPI` core API + `React 19` frontend + `PostgreSQL` (`Supabase` or managed `AWS RDS`) + `n8n` (B2B/ERP integrations) + `LangGraph` (multi-step cognitive workflows).
* **Legacy System (`MyIndaia 1.0`):** 48 Delphi / Classic ASP repositories backed by SQL Server `BROKER` database.
* **Internal Rebuild (`MyIndaia 2.0IT`):** Fast foundation by Wagner's team (`React 19` + `FastAPI` + `Supabase`). Strategy: **Absorb and refactor (`~55–60% reusable`), do not discard.**

### Tier-1 Decision Matrix (Discovery Core Deliverables)

During the Discovery Sprint, the team (`Ricardo Leite`, `Rodrigo Zayit`, `Wagner`) will resolve the highest-stakes architectural decisions (`85% of technical risk`) which constitute the core recommendations of the project:

1. **Hybrid Orchestration Split (`n8n` vs. `LangGraph`):**
   * Establish clear boundary: `n8n` for low-code B2B pipelines and COMEX integrations (maintainable by Tech Ops); `LangGraph` reserved strictly for multi-step cognitive agents (`Ingestão`, `NCM classification`, `Compliance`, `Booking`, `Allocation`).
2. **Empirical OCR Benchmark (Decision #1):**
   * Conduct real-world extraction benchmark on ~50 client documents (`BASF`, `Nestlé`, `Pirelli`).
   * Compare `Docling` vs. paid APIs (`LlamaParse`, `Reducto`, `Extend`) measuring accuracy, OpEx cost per page, and LGPD data residency compliance.
3. **Database Residency, Auth & Stage-1 Bridge:**
   * Evaluate `Supabase Auth + DB` vs. `Clerk/Auth0 + AWS RDS`. Note: Supabase supports `sa-east-1` (São Paulo) and native RLS with third-party JWTs.
   * Design `pyodbc` / `Delphi BROKER` read-only bridge for Stage 1 to ensure new agents can read 26 years of historical logistics data without breaking legacy operations.
4. **Government Portal Scraping & Hardware Certificates:**
   * Check whether `A1` software certificates can replace physical `A3` USB tokens/smartcards to prevent cloud `mTLS` breakage in automated workflows.

---

## Stakeholders & Project Team

| Name                        | Role / Mandate                          | Notes                                                                                                                                                             |
| --------------------------- | --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Ricardo Leite**           | Strategic Tech Advisor / Discovery Lead | Leads overall modernization strategy, architectural governance, and cutover go/no-go.                                                                             |
| **Fabricio Motta Paulella** | CEO & Primary Client Sponsor            | Family business, 2nd generation. Drives digital transformation (`INDAIAWay`, `Indaiá e Integrada`).                                                               |
| **René Caetano Paulella**   | Senior Partner / Co-founder generation  | Family-led governance counterpart.                                                                                                                                |
| **Wagner**                  | COMEX Domain & 2.0IT Team Lead          | Leads internal dev team building current "2.0IT" module. Key asset for domain and existing React 19/FastAPI codebase.                                             |
| **Nelson**                  | BI / Operations Dashboard Lead          | Departing July 31. Mitigating continuity risk around his Power BI / GD dashboards is an operational priority.                                                     |
| **Rodrigo Zayit**           | Independent Architecture Reviewer       | External technical evaluator participating in Discovery to validate Tier-1 architectural decisions (n8n vs. LangGraph, Supabase vs. RDS, RBAC, legacy DB bridge). |
| **Leandro**                 | Legacy Delphi Developer                 | Internal developer familiar with legacy `BROKER` database and Delphi stored procedures. Key resource for Stage-1 bridge.                                          |

---

## Memory Protocol & Working Principles

**At the start of every session, read [MEMORY.md](MEMORY.md) in this directory before taking action.**
[MEMORY.md](MEMORY.md) holds dynamic execution state (current focus, active workstreams, immediate action items, and live decision logs).

* Be candid, rigorous, direct, and concise; prefer structured tables and bullet points (`MECE` principle).
* Do not guess missing technical specifics; ask for clarification or check the reference indexes (`Migration_plan_index.md` or `Report_index.md`).
