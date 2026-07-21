# Indaiá Logística — MyINDAIA Modernization Project — Cowork Briefing

## Purpose & Goal

This folder is the **primary execution and collaboration workspace** for the MyINDAIA platform modernization — a Greenfield rewrite of the legacy Delphi/Classic ASP customs brokerage and international logistics system to a modern cloud-native stack.

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
├── 00_Internal_Work/                ← ⚠️ INTERNAL ONLY (Ricardo × Rodrigo). Never client-facing.
│   ├── README.md                    ← Index and reading order
│   ├── 01_Working_Agreement.md      ← Roles, decision rights, governance principles, cadence
│   ├── 02_Discovery_Plan.md         ← Deliverables → workstreams → timeline → critical path
│   ├── 03_Task_Board.md             ← Live task tracker (owner, deliverable, status, dependency)
│   ├── 04_Decision_Register.md      ← The eight Tier-1 decisions (owner, method, status)
│   ├── 05_Kickoff_Brief.md          ← CEO pre-read: premises, metrics, trade-offs, access needs
│   ├── Process_Map/                 ← T-50 process map derived from the legacy system (has its own README + trust-level table — read it first)
│   ├── IDP/                         ← OCR / document-extraction proof of concept working files
│   └── Reference/                   ← Consulted material, not deliverables (RL raw notes, dated architectural analyses)
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

> **This file is a map, not a reading list.** The links here and in `MEMORY.md` exist so you can find
> the *right* file for the task in front of you — not so you can load them all. This is a
> document-heavy project: reading broadly before knowing what you are doing wastes most of the
> context window on material that turns out to be irrelevant, and buries the parts that matter.
>
> **Read the one or two files the current task actually needs.** Start from an index, follow the
> pointer, stop. If a task genuinely needs broad exploration across many files, delegate it to a
> subagent and take back the conclusion rather than the contents.

* **Never read raw legacy files under `MyIndaia 1.0/Codebase and Database/`** unless debugging a specific query. All relevant schema and stored procedure behavior (~2,419 SPs in `BROKER`) is synthesized in [Report_index.md](01_Inputs_and_Resources/MyIndaia%201.0/Report/Report_index.md) — read that instead.
* **For CEO Vision and Product Specs**, start at [CEO Vision README.md](01_Inputs_and_Resources/My%20Indaia%202.0%20CEO%20Vision/README.md) and go no further unless you need a specific detail. It consolidates the vision layer and explains the hierarchy between the Walking Skeleton (`Parecer da Banca v2`), the product requirements (`PVD v4`), and the agent specifications (`Especificação dos 10 Agentes v2`). The underlying documents are long, partly contradictory, and rarely needed whole.
* **For the v0 migration plan**, navigate through [Migration_plan_index.md](01_Inputs_and_Resources/My%20Indaia%202.0%20Export%20+%20Import%20v0%20plan/Migration_plan_index.md) rather than reading the plan end-to-end.
* **For internal working state**, [MEMORY.md](MEMORY.md) routes to the single file that owns each kind of detail. Follow one route; do not read `00_Internal_Work/` in full.

---

## System Landscape

Three codebases, and the relationship between them. Orientation only — what to *do* about them is
the Discovery's output, not its input.


| System                            | What it is                                                                                                                                                             | Status                                                                                                    |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| **MyIndaia 1.0** (legacy)         | 48 Delphi / Classic ASP repositories over the SQL Server`BROKER` database. ~1,205 tables, ~2,419 stored procedures, 26 years of operating history.                     | In production. Never switched off by date — see Binding Principles.                                      |
| **MyIndaia 2.0 Export** ("2.0IT") | Wagner's internal team build: React 19 + FastAPI + Supabase.                                                                                                           | In progress.**We have not seen the code** — CP-1. Reuse proportion is inherited and unverified.          |
| **Target platform**               | Proposed direction across Anexo I, the CEO vision and our v0 plan: FastAPI + React 19 + PostgreSQL, with an orchestration layer for integrations and cognitive agents. | **Proposed, not settled.** The database and orchestration components are live decisions (DEC-02, DEC-03). |

**What the Discovery resolves** is in [04_Decision_Register.md](00_Internal_Work/04_Decision_Register.md)
— nine decisions with owners, method and status. It is the single source of truth for what is open and
what is settled; do not restate decision content here, where it goes stale and starts contradicting
the register.

**What the Discovery delivers** is in [Anexo I](00_Scope/Anexo_I_Escopo_e_Insumos_Discovery.md) §1.1,
mapped to owners and timeline in [02_Discovery_Plan.md](00_Internal_Work/02_Discovery_Plan.md).

---

## Stakeholders & Project Team


| Name                        | Role / Mandate                          | Notes                                                                                                                                                                                                                                                                                                                                                          |
| --------------------------- | --------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Ricardo Leite**           | Strategic Tech Advisor / Discovery Lead | Leads overall modernization strategy, architectural governance, and cutover go/no-go.                                                                                                                                                                                                                                                                          |
| **Fabricio Motta Paulella** | CEO & Primary Client Sponsor            | Family business, 2nd generation. Drives digital transformation (`INDAIAWay`, `Indaiá e Integrada`).                                                                                                                                                                                                                                                           |
| **René Caetano Paulella**  | Senior Partner / Co-founder generation  | Family-led governance counterpart.                                                                                                                                                                                                                                                                                                                             |
| **Wagner**                  | COMEX Domain & 2.0IT Team Lead          | Leads internal dev team building current "2.0IT" module. Key asset for domain and existing React 19/FastAPI codebase.                                                                                                                                                                                                                                          |
| **Nelson**                  | BI / Operations Dashboard Lead          | Departed July 31. His Power BI / GD dashboard continuity is a client-side operational risk and is **outside our scope** — note it in the risk register, do not plan work against it.                                                                                                                                                                                                                                                  |
| **Rodrigo Zayit**           | Technical Co-Executor (Discovery)       | Peer in the analysis, input to the delivery. Owns five Tier-1 technical decisions end-to-end — orchestration engine, database infrastructure, RBAC, scraping hosting + A1/A3 certificates, Stage-1 legacy bridge — plus the legacy security/LGPD remediation plan. Does not carry conclusions to the client independently; everything ships through Ricardo. |
| **Andrea**                  | Director of Operations                  | Holds the working map of operational problems and client buckets for rollout — the closest thing to a real prioritization input. Involvement in the project is not yet confirmed; getting her in is a P0 action.                                                                                                                                                                                                    |
| **Leandro**                 | Legacy Delphi Developer                 | Internal developer familiar with legacy`BROKER` database and Delphi stored procedures. Key resource for Stage-1 bridge.                                                                                                                                                                                                                                        |

---

## Binding Principles

Constraints that must shape every recommendation produced in this project. This section is the
authoritative list.

> **Test for inclusion:** a principle belongs here only if forgetting it would make a session
> produce a *wrong recommendation*. Anything still under review fails the test — promoting it
> quietly pre-empts a decision the Discovery is paid to make.
>
> The client's principles were drafted with AI assistance. They are a strong starting point, not
> scripture — several are stated more absolutely than they can be defended. Challenging them is part
> of the job. Items marked ⏳ are confirmed with the client as specific statements at kickoff (see [05_Kickoff_Brief.md](00_Internal_Work/05_Kickoff_Brief.md) §1) — never as an abstract "do you endorse these principles?", which produces agreement without substance.

### Tier A — contractual constraints on how we work (binding now)

* **We advise; the client decides.** Every first-order decision is presented with rationale and
  trade-offs for joint agreement (Anexo I §1.2.3). Never record a decision as made because we are
  convinced by it.
* **OCR is the only decision tested empirically in this phase** (Anexo I §1.3). Everything else is
  resolved analytically and recorded with its trade-offs. The instinct to prototype is out of scope.
* **Out of scope, period** (cl. 1.3): building or running software, business case / ROI,
  post-implementation operation.

### Tier B — client non-negotiables that constrain any recommendation ⏳

Each invalidates a class of recommendation.

* **No customs act is ever automatic.** DUIMP and DU-E always require human review plus an A3
  certificate — no threshold, no exception. Automation stops at the signature.
* **Every agent decision is auditable** — input, output, confidence, approver. An architecture that
  cannot produce that record is disqualified regardless of its other merits.
* **Never fails silently.** Error or timeout escalates to a human.
* **Migration is client-by-client, always with rollback.** Never all at once.
* **Cutover is governed by measured criteria — never by date, never by preference.** Correctness
  parity with the legacy system, performance under real load, and a rollback path that has been
  exercised. Criteria are defined before migration starts, not negotiated during it. *(Revised from
  the client’s original wording — the original, "the Delphi shuts down when the team prefers the Python", is unfalsifiable and hands an informal veto to whoever is most risk-averse.)*
* **DUIMP-only — legacy DI is out of scope.**

### Tier C — organizing principles ⏳

* **Services are justified by the business capability they enable, not by the legacy module they
  replace.** *"The booking-service doesn't exist to replace `minibrowser.pas` — it exists to answer:
  can I guarantee we'll meet the MQC contract with Maersk this month?"*
* **Every sprint should answer: what can the client do Monday that they couldn't do Friday?**
  Foundation work with no client-visible output is permitted, but must be named as such, time-boxed,
  and justified — never the default. *(Bounded from the client’s absolute version, "no invisible foundation sprint beyond 2 weeks" — security remediation, the legacy bridge and auth all falsify the absolute form, and a rule stated absolutely simply gets ignored.)*
* **Primary leading indicator:** how many times a client was told something *before* they had to call
  and ask. Primary, **not sole** — counted alone it is gamed by sending noise, so it requires a
  counterweight (inbound calls down, NPS). See DEC-09.

### Under review — do NOT treat as principles

Strangler fig · walking skeleton · outside-in construction · parallel export‖import verticals ·
"never reimplement `sp_di_calculo` / `sp_calc_*`" · the ~100-week and ~55–60%-reuse figures · the
n8n / LangGraph / Supabase stack. These read as settled in the source documents but are precisely
what the Discovery is examining. Treating them as binding pre-empts the decisions this project is
paid to make.

---

## Internal Working Rules

Ricardo Leite and Rodrigo Zayit work under a defined agreement — roles, decision rights, the
required shape of every Tier-1 recommendation, review posture, and escalation. It is not restated
here: see [01_Working_Agreement.md](00_Internal_Work/01_Working_Agreement.md).

Two rules that affect any work done in this repository:

* **`00_Internal_Work/` is never client-facing.** It is written candidly and in English. Anything
  destined for Indaiá is rewritten in PT-BR and passes through Ricardo.
* **Every Tier-1 recommendation follows a fixed five-part shape:** the question (phrased as
  something the business asks) → options (MECE, including do-nothing) → trade-offs (money, time,
  risk, reversibility) → recommendation with a **confidence level** → **what would change my mind**.

---

## Notion Workspace

Two Notion pages anchor this project's presence there. The `notion-sync` skill is global and
infers push destinations from project conventions rather than guessing — this is that convention,
recorded here (not in memory) so it stays with the repo.

* **Project home** — [Projeto MyIndaia 2.0](https://app.notion.com/p/rolfilho/Projeto-MyIndaia-2-0-3a0ae9c48a538072b7f6e7436e1e22c1)
  (page ID `3a0ae9c4-8a53-8072-b7f6-e7436e1e22c1`). Global root of the project's Notion tree.
* **Client interface** — [Interface com Cliente](https://app.notion.com/p/rolfilho/Projeto-MyIndaia-2-0-Interface-com-Cliente-3a3ae9c48a53804ebffaf22214e39ce7)
  (page ID `3a3ae9c4-8a53-804e-bffa-f22214e39ce7`). **The only page — plus its subpages — Indaiá
  has access to.** This is the Notion equivalent of the `00_Internal_Work/` rule above: anything
  pushed here or below is implicitly client-visible, so it must already be PT-BR and
  Ricardo-reviewed. Never push internal-only material (drafts, `00_Internal_Work/` content,
  anything not yet cleared for the client) under this page.

---

## Memory Protocol & Working Principles

**At the start of every session, read [MEMORY.md](MEMORY.md) before taking action.** It is a thin
router — current phase, the three critical-path dependencies, and where each kind of detail lives.
It is deliberately small so that it can be read every session without loading the whole project.

### State lives in the file that owns it

`MEMORY.md` does **not** track statuses. Each artifact owns its own, and is updated **at the moment
the state changes** — not batched at the end of a session, and never mirrored into a second file.


| Artifact                                                            | Owns                                         | Update discipline                                                                                                                                                                                         |
| ------------------------------------------------------------------- | -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [03_Task_Board.md](00_Internal_Work/03_Task_Board.md)               | Task statuses                                | Move`Todo → Doing → Blocked/Review → Done` as it happens. A completed task keeps its row — never delete it. When blocked, name what is blocking it and who owns the unblock.                          |
| [04_Decision_Register.md](00_Internal_Work/04_Decision_Register.md) | Decision statuses | Advance`Open → Analysis → Recommended → Ratified`. Record the recommendation, its confidence level, and what would change it. |
| [05_Kickoff_Brief.md](00_Internal_Work/05_Kickoff_Brief.md)         | CEO premises, metrics, trade-offs            | Keep it the current pre-read. When Fabricio confirms or corrects a premise, record the outcome in the owning decision (register) and update the brief. Interview seed questions live in [02_Discovery_Plan.md](00_Internal_Work/02_Discovery_Plan.md) §7.                                                          |
| [02_Discovery_Plan.md](00_Internal_Work/02_Discovery_Plan.md)       | Critical path & assumptions                  | When a dependency clears or an assumption is falsified, update it there and reflect any change to the top three in`MEMORY.md`.                                                                            |

**Only update `MEMORY.md` when the phase changes, the critical-path top three change, or the routing
table needs a new destination.** If you find yourself copying a status into it, that is the signal
you are duplicating state — put it in the owning file instead.

### Working principles

* Be candid, rigorous, direct, and concise; prefer structured tables and bullet points (`MECE` principle).
* Do not guess missing technical specifics; ask for clarification or check the reference indexes (`Migration_plan_index.md` or `Report_index.md`). If nobody here can answer: a premise for the CEO goes in [05_Kickoff_Brief.md](00_Internal_Work/05_Kickoff_Brief.md) §1, an interview question for Wagner/Leandro in [02_Discovery_Plan.md](00_Internal_Work/02_Discovery_Plan.md) §7, an access/insumo ask in the client data request (A2) — always filed against the person who can answer it.
* Distinguish what is **decided** from what is **assumed** from what is **inherited and unverified**. The third category is where this project's risk concentrates.
