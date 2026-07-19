# MyINDAIA Modernization — Dynamic Execution Memory

**Last updated:** 2026-07-19  
**Scope:** Dynamic session state, active tasks, and decision log for the MyINDAIA Discovery & Modernization project (`/Users/ricardo/Projects/2026 Indaia`).
**Structural Reference:** For target architecture baseline, RACI table, and detailed folder pointers, see [AGENTS.md](AGENTS.md).

---

## Current Status & Schedule

| Field | Value |
| --- | --- |
| **Phase** | **Discovery Preparation (Fase 1)** — 2-week Discovery Sprint + 60-day accompaniment. |
| **Target Kickoff** | **2nd week of August 2026** (following Nelson's exit on July 31 and Wagner's team transition). |
| **Current Focus** | Structuring `02_Discovery_Workstreams/` for Tier-1 triage execution and prepping onboarding checklists. |
| **Immediate Next Steps** | 1. Finalize technical review agenda for Rodrigo Zayit's architecture validation.<br>2. Track client response to [A2_Client_Information_Request_v2.md](01_Inputs_and_Resources/A2_Client_Information_Request_v2.md) upon August transition.<br>3. Review process inventory against Wagner's existing COMEX backlog. |

---

## Active Workstreams & Task Tracker

| Workstream | Status | Owner | Notes / Open Tasks |
| --- | --- | --- | --- |
| **W1: Kickoff & Alignment** | Prep | Ricardo Leite / Fabricio | Finalize onboarding timeline and team communication. |
| **W2: Process Inventory Review** | Prep | Ricardo Leite / Wagner | Map ~36 cataloged processes against current 2.0IT backlog. |
| **W3: Tier-1 Architecture Triage** | Prep | Ricardo Leite / Rodrigo Zayit | Prepare benchmark dataset (~50 docs for OCR) and validation agenda (`n8n` vs `LangGraph`, `Supabase` vs `RDS`). |
| **W4: Nelson Dashboard Handoff** | Action Required | Nelson / Ricardo | Identify queries and pipelines powering critical Power BI / GD dashboards before July 31 exit. |

---

## Live Decision Log

| Date | Decision | Context / Rationale |
| --- | --- | --- |
| 2026-07-16 | Project Go-Ahead & Scope confirmed | Aligned on 2-week Discovery + 60 days accompaniment. Focus 95% of execution on core rewrite ("feijão com arroz") to mitigate legacy risk. |
| 2026-07-19 | Standalone Workspace Created | Established `/Users/ricardo/Projects/2026 Indaia` with structured folders to share safely with Rodrigo Zayit and client stakeholders. |

---

## Open Blockers & Questions

1. **Data Residency Clauses:** Verify if specific enterprise client contracts (`BASF`, `Nestlé`, `Pirelli`) restrict cloud processing endpoints outside Brazil/Europe.
2. **Dashboard Transition:** What exact queries and data sources power Nelson's critical operational dashboards?
3. **Stage-1 Bridge Access:** Confirm exact read-only access prerequisites for Leandro to set up the `pyodbc` / `BROKER` connection.
