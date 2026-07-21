# 03 — Task Board

**Updated:** 2026-07-20
**Owners:** `RL` Ricardo Leite · `RZ` Rodrigo Zayit · `CLI` Client-side (named person in Notes)
**Status:** `Todo` · `Doing` · `Blocked` · `Review` · `Done`
**Phase:** `P0` prep (Jul 20 – Aug 7) · `P1` Discovery W1 · `P2` Discovery W2 · `P3` Fase 2

Every task names the deliverable it feeds. A task feeding nothing is scope creep or belongs in the
strategy notes.

---

## P0 — Prep window (highest leverage; unbilled)

### Client interface & insumos — the ones that must be pushed today

| ID | Task | Owner | Feeds | Status | Notes |
| --- | --- | --- | --- | --- | --- |
| T-01 | Request read access to the **export repository** | RL | CP-1 → D-a, D-d | Todo | Highest-severity dependency in the engagement. Send the moment the contract is signed; do not wait for kickoff |
| T-02 | Get client decision on OCR PoC target: **which client or which document type** | RL | DEC-01 → D-a1 | Todo | Blocks T-03. Our recommendation: pick by document type, not by client — see DEC-01 |
| T-03 | Request the **document batch with ground truth** for the chosen target | RL | CP-2 → D-a1 | Blocked | Blocked on T-02. Specify volume, format, and what "ground truth" must contain, or we'll receive PDFs with no labels |
| T-04 | Schedule the **CEO alignment session** (W1 D1–D2) | RL | CP-3 | Todo | Send [05_Kickoff_Brief.md](05_Kickoff_Brief.md) ahead so the session is discussion, not briefing |
| T-05 | Schedule **code walkthrough with Wagner** (W1) | RL | D-a | Todo | Rodrigo attends |
| T-06 | Schedule **BROKER access session with Leandro** | RL | DEC-07 | Todo | Read-only access prerequisites are already an open blocker in MEMORY.md |
| T-07 | Send question lists to Fabricio / Wagner / Leandro **before** the clock starts | RL | all | Todo | The entire point of the prep window. Answers arriving on W1 D1 are worth far more than questions asked on W1 D1 |
| T-08 | Chase **Andrea's spreadsheet** | RL | DEC-06, D-d | Todo | Flagged in the raw notes as a key input to the delivery-cadence decision. Her role isn't in the stakeholder table — confirm who she is and what the spreadsheet contains |
| T-09 | ⭐ Request the **`BROKER` parametrization dump** (item H of A2) | RL | T-50 → D-a | Todo | **Best value-per-effort request in the engagement — send now, do not batch it with the rest of A2.** ~13 small config tables (`TSERVICO`, `TSERVICO_EVENTO`, `TEVENTO`, `TETAPA`, `TCLIENTE_SERVICO`, …). They *are* the process map, written by Indaiá themselves. Minutes of Leandro's time; not customer data; **independent of the BROKER read-access negotiation (T-06)** — do not let it get absorbed into that thread. Without it, T-50 ships a populated template instead of a populated map |

### Analysis we can do without the client

| ID | Task | Owner | Feeds | Status | Notes |
| --- | --- | --- | --- | --- | --- |
| T-10 | Re-audit the **v0 migration plan** against the CEO vision and the project goals | **RL + RZ** | D-a, WS1 | Todo | The core task in the raw notes. Adjudication, not merge. **Known finding already:** the v0 plan prescribes a 2-week hard cutover + legacy decommissioning (W19–26), which the CEO's own non-negotiables rule out — see [Reference/2026-07-21 Strategy and Delivery Analysis.md](Reference/2026-07-21%20Strategy%20and%20Delivery%20Analysis.md) §2. Also quantify its "~18 weeks of discarded scaffolding" claim, the strongest argument it makes and one we haven't tested. Note where the missing export codebase limits the conclusion |
| T-11 | Write the **detailed briefing for Rodrigo** | RL | WS3 | Doing | Superseded in part by this folder; the residue is the expectations + immediate asks directed at him. See [01_Working_Agreement.md](01_Working_Agreement.md) §4 (Rodrigo — immediate asks) |
| T-12 | Build the **OCR PoC harness** (schema, confidence capture, HITL review surface) | RL | D-a1 | Todo | Build against synthetic/sample docs so that the day real documents arrive we only run them. See Wave 3 PoC plan |
| T-13 | High-level **IDP vendor shortlist** → pick the one provider to test | RL | DEC-01 | Todo | Starting list: LlamaParse, Reducto, Extend. Contract requires selecting **one** by high-level analysis, not benchmarking all |
| T-14 | Pre-read: CEO vision set, v0 plan, legacy audit, export README | RZ | all | Todo | Reading order in [README.md](README.md). Do **not** read raw legacy code |
| T-15 | Draft **security / LGPD remediation plan** from the existing legacy audit | RZ | D-b2 | Todo | Substantially draftable now. The `sa`/`123` hardcoded credential is a week-1 item with no negotiation per the CEO vision — verify whether it has actually been rotated |
| T-16 | Draft the **initial risk register** | RL | D-b1 | Todo | Seed from: CP-1/CP-2 exposure, Nelson's exit, team capacity, INTTRA API dependency, A3 certificate automation, single-senior-dev dependency |
| T-17 | Define the **OpEx cost taxonomy** (structure final, numbers provisional) | RL | D-c | Todo | See 02_Discovery_Plan §5 on why structure-first is the right play here |
| T-18 | Build the **kickoff premise list** | RL | D-a, DEC-06 | Review | Drafted in [05_Kickoff_Brief.md](05_Kickoff_Brief.md) §1 — statements Fabricio confirms or corrects, split into givens and premises-to-confirm. Pending Ricardo review |
| T-19 | Run the **validation block** at the formal kickoff | RL | D-a, DEC-06, DEC-09 | Todo | Confirm the premises, get the pilot client, the most valuable milestone and the real team composition ([05_Kickoff_Brief.md](05_Kickoff_Brief.md) §1). Trade-offs are worked as a discussion, not sprung cold — see Kickoff Brief §3 |
| T-50 | **Derive the operational process map** from the legacy technical material | RL | D-a, CP-2, insumos | **Doing** | ⭐ High leverage. Plan: [Process_Map/00_Execution_Plan.md](Process_Map/00_Execution_Plan.md). **Reframed after reconnaissance: this is decode-and-render, not inference.** `BROKER` holds a parametrized workflow engine — `TSERVICO` (process catalogue, with start/end events and target cycle time), `TSERVICO_EVENTO` (ordered steps with relative SLAs), `TEVENTO` (activity dictionary incl. `CD_RESPONSAVEL` = who does what), `TETAPA` (macro-stages keyed by business unit × product), `TCLIENTE_SERVICO` (client × process matrix). The MECE spine comes from Indaiá's own dimensions; client and modal/regime are **variant overlays, not parallel branches**. Five waves: 1–3 mechanical extraction → `agy`, 4–5 synthesis + gap register → RL. Gated for completeness (not for start) on T-09 |
| T-51 | **Research the orchestration option space** (LangGraph, n8n, alternatives) | RZ | DEC-02 | Todo | Ahead of any client contact. Independent of the missing codebase, so it costs nothing to front-load. Score candidates against **Agent 09 as the reference workload** — multi-step, external call, partial failure, escalation, audit trail |
| T-52 | Draft **Rodrigo's question list for Wagner and Indaiá** | RZ → RL | DEC-02–07, Q-w/Q-l seed list | Todo | So the code walkthrough (T-21) is an interrogation with a purpose rather than a tour. Trim the seed list in [02_Discovery_Plan.md](02_Discovery_Plan.md) §7 before it is sent — Q-w6/Q-w7 must survive |
| T-53 | **Get Andrea (Director of Operations) into the project** | RL | DEC-06, T-50 | Todo | ⭐ Her map of operational problems and client buckets is the missing half of the process map and the natural input to pilot-client selection. Involvement not yet confirmed |
| T-54 | ⭐ **Map the write-back boundary**: which agent capabilities need to write into the legacy DB, and which are read-only | RL + RZ | DEC-06, DEC-07, D-a | Todo | **Highest-value analysis in the prep window.** The v0 plan rejected strangler fig on two risks (`TFOLLOWUP` trigger cascades, dual-DB split-brain) that only bite under *bidirectional* sync. Read-only capabilities (notifications, dashboards, MQC visibility) carry neither. This map decides how much of the CEO's agent layer is genuinely cheap, and reconciles a 26-week plan with a ~100-week one. Agent 09 (booking status → `TFOLLOWUP`) is the test case. See [Reference/2026-07-21 Strategy and Delivery Analysis.md](Reference/2026-07-21%20Strategy%20and%20Delivery%20Analysis.md) §2 |
| T-55 | Run **waves 1–3**: schema decode, coded-rule extraction, module→process map | RL (agy) | T-50 | **Done** 2026-07-20 · outputs in [Process_Map/](Process_Map/) (~10.3k lines). **Delegation to agy largely failed** — 5 of 7 runs produced nothing (headless `mcp` permission denial, print-timeout, mid-run termination). W1, the W2 matrix, the rehydration and 12 of 48 modules were done directly in Python/grep; only `W2_coded_rules.md` and 36 modules came from agy. **Lesson: delegate reading-for-intent, never counting** — the deterministic outputs were faster to produce and are strictly more trustworthy. Verification: 98/98 routines and 332/332 SQL quotes confirmed present in source; 42/42 cited file paths resolve. ⚠️ Both agy files contain **zero** `PURPOSE UNCLEAR` / `NOT DETERMINED` across 98 routines and 36 modules — evidence is real, confidence is overstated; caveats appended to both files | W1 schema inventory from `Schema_Completo_BROKER.csv`; W2 rules from `store_procedures_BROKER.csv` + triggers, **with hardcoded literals called out separately — the exceptions are half of what the client must confirm**; W3 module participation (grep-only over the 739 MB tree) + rehydrating the six headerless CSV dumps with column headers. Run in background, Pro model for W2–W3. **Mandatory source spot-check before any of it reaches the map: a plausible fabricated business rule presented to Indaiá as "what your system does" is the worst failure mode of this exercise** |
| T-56 | Synthesise the **MECE process map + mermaid diagrams** (deliverable A) | RL | T-50, D-a, T-54 | Todo | Fixed per-process schema (trigger, inputs, outputs, stages, steps with owner+SLA, rules, exceptions, handoffs, cycle time, evidence tier). Includes the E1-vs-E2 check: does the *configured* process match what `TFOLLOWUP` shows actually firing? 200-row samples are indicative only — **no cycle-time claims from them**. The automation-coverage map is a direct input to T-54 (write-back boundary) and to the CEO's agent layer |
| T-57 | Build the **process-map gap register** and fold it into A2 / the interview seed list (deliverable B) | RL | T-50, WS7 | Todo | Every inference, MECE violation and E0 blind spot → a numbered, addressed question. **The E0 boundary is the honest limit and gets stated to the client in those terms:** the legacy shows every step someone recorded, and nothing about the manual handoffs between them. Main respondent is Andrea (T-53), Wagner second |

---

## P1 — Discovery week 1

| ID | Task | Owner | Feeds | Status | Notes |
| --- | --- | --- | --- | --- | --- |
| T-20 | Run the **CEO alignment session** | RL | CP-3, DEC-06, DEC-09 | Todo | Target outputs: delivery principle confirmed, risk appetite stated, 12-week metrics jointly prioritized, premises confirmed, pilot client identified. Agenda is [05_Kickoff_Brief.md](05_Kickoff_Brief.md) |
| T-21 | **Code walkthrough** with Wagner + reuse validation | RL + RZ | D-a, A3 | Todo | The moment where the inherited "55–60% reusable" number gets verified or replaced |
| T-22 | **Execute the OCR PoC** on the real document batch | RL | D-a1 | Blocked | Blocked on T-03 |
| T-23 | Measure OCR **accuracy** and **cost per page**; extrapolate to Indaiá volumes | RL | D-a1, D-c | Todo | Volume figures needed from the client — see 02_Discovery_Plan §7 (Q-w6) |
| T-24 | Deep-dive: **agent orchestration engine** + build roadmap | RZ | DEC-02 → D-a2 | Todo | Inputs already in this folder: the AI-frameworks/n8n lessons doc and the v0-vs-CEO-vision architectural analysis |
| T-25 | Deep-dive: **database infrastructure** | RZ | DEC-03 → D-a3 | Todo | Supabase vs. managed RDS; `sa-east-1` residency; RLS with third-party JWTs |
| T-26 | Deep-dive: **RBAC model** | RZ | DEC-04 → D-a4 | Todo | |
| T-27 | Deep-dive: **scraping hosting + A1 vs. A3 certificate** | RZ | DEC-05 → D-a5 | Todo | The binding question: can A1 software certificates replace physical A3 tokens without breaking cloud automation? Note the CEO vision treats A3 + human review as non-negotiable for customs acts |
| T-28 | Deep-dive: **Stage-1 read-only bridge to BROKER** | RZ | DEC-07 | Todo | With Leandro |
| T-29 | **Mid-point review** — status + confidence level on every decision | RL + RZ | all | Todo | End of W1 |

---

## P2 — Discovery week 2

| ID | Task | Owner | Feeds | Status | Notes |
| --- | --- | --- | --- | --- | --- |
| T-30 | **Guided decision sessions** with the client, one per Tier-1 decision | RL | D-a | Todo | Anexo I §1.2.3: each first-order decision presented with rationale and trade-offs, for joint agreement |
| T-31 | **Convergence session** — resolve surviving RL×RZ disagreements | RL + RZ | all | Todo | Anything unresolved ships as an explicit named trade-off (P4) |
| T-32 | Write **D-a** — the single reconciled technical plan | RL | D-a | Todo | |
| T-33 | Write **D-b** — risk register, security/LGPD plan, shadow-mode cutover design | RL (RZ on b2) | D-b | Todo | |
| T-34 | Write **D-c** — IT OpEx model | RL | D-c | Todo | |
| T-35 | Write **D-d** — schedule: firm weeks 1–4, sketch 5–12, hybrid estimates | RL | D-d | Todo | Firm for deterministic scope; min–max range for AI scope |
| T-36 | Consolidate the **single prioritized, estimated backlog** | RL | D-a, D-d | Todo | Anexo I §1.2.4 |
| T-37 | Translate client-facing deliverables to **PT-BR** | RL | all | Todo | |

---

## P3 — Fase 2 (60 days, ~4h/week advisory)

| ID | Task | Owner | Feeds | Status |
| --- | --- | --- | --- | --- |
| T-40 | Stand up decision log + risk register as the team's source of truth | RL | Fase 2 | Todo |
| T-41 | Weekly: async board/PR/decision-log review + team call + CEO status note | RL | Fase 2 | Todo |
| T-42 | Fortnightly CEO call | RL | Fase 2 | Todo |
| T-43 | ~Day 30: team capacity read | RL | Fase 2 | Todo |
| T-44 | ~Day 45: schedule re-baseline | RL | Fase 2 | Todo |
| T-45 | Day 60: closing package — consolidated firm plan, capacity assessment, continuity recommendation | RL | Fase 2 | Todo |

---

## Blocked, at a glance

| Task | Blocked on | Owner of the unblock |
| --- | --- | --- |
| T-03 (document batch) | T-02, a client decision | RL → Fabricio / Wagner |
| T-22 (run the PoC) | T-03 | RL |
| Everything under WS1 at full confidence | CP-1, export repo access | RL → Fabricio |
