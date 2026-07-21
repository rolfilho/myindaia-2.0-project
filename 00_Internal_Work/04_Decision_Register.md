# 04 — Decision Register

**Updated:** 2026-07-21

This is what Indaiá is actually paying for. Everything in
[03_Task_Board.md](03_Task_Board.md) exists to move a row in this table. The CEO-facing
distillation of the strategic calls — the premises to validate and the trade-offs we bring — is in
[05_Kickoff_Brief.md](05_Kickoff_Brief.md). The full worked argument behind DEC-06 is archived in
[Reference/2026-07-21 Strategy and Delivery Analysis.md](Reference/2026-07-21%20Strategy%20and%20Delivery%20Analysis.md).

It also becomes the seed of the **decision log** that Anexo I §2.2 requires us to maintain as the
team's source of truth through Fase 2 — so it is written to survive the engagement, not just the
two weeks.

**Lifecycle:** `Open` → `Analysis` → `Recommended` (by us) → `Ratified` (by the client)
**Method:** `Empirical` (tested in practice) · `Analytical` (reasoned, recorded with trade-offs)

Per Anexo I §1.3, **OCR is the only decision tested empirically in this phase.** Everything else is
resolved analytically and recorded in the log. That is a contractual constraint, not a shortcut —
resist the urge to prototype the others.

---

## Tier 1 — strategic (shapes everything else)

| ID | Decision | Owner | Method | Status | Feeds |
| --- | --- | --- | --- | --- | --- |
| **DEC-06** | Delivery strategy — the unit of delivery, sequencing, Export‖Import | **RL + RZ jointly** → CEO ratifies | Analytical | **Recommended** — CEO validates W1 | D-a, D-d, D-b3 |
| **DEC-07** | Stage-1 read-only bridge to the legacy BROKER database | RZ | Analytical | Open | D-a, D-b3 |
| **DEC-09** | Which metrics we commit to moving in the first 12 weeks | RL → **validated with the CEO** | Analytical | Open | D-d, Fase 2 |

## Tier 1 — contractual (Anexo I §1.1.a)

| ID | Decision | Owner | Method | Status | Feeds |
| --- | --- | --- | --- | --- | --- |
| **DEC-01** | Document extraction / OCR — ready-made API vs. own solution | RL | Empirical | Open (direction set: by document type) | D-a1, D-c |
| **DEC-02** | Agent cognitive engine — orchestration alternatives + build roadmap | RZ | Analytical | Open | D-a2 |
| **DEC-03** | Database infrastructure | RZ | Analytical | Open | D-a3, D-c |
| **DEC-04** | Access control model (RBAC) | RZ | Analytical | Open | D-a4 |
| **DEC-05** | Integration/scraping hosting + digital certificate (A1 vs. A3) | RZ | Analytical | Open | D-a5, D-c |

---

## DEC-06 — Delivery strategy

**The question the business asks:** *"What can Indaiá do for its client next week that it couldn't
do last week — without ever putting operations at risk?"*

| | |
| --- | --- |
| **Owner** | **RL + RZ jointly.** Both run the analysis; we work the questions and trade-offs through together; Ricardo decides what is presented. Ratified by the CEO — the choice is his, we recommend. |
| **Why joint** | Business judgment and technical feasibility are inseparable here. Owned by one of us, it produces half an answer. |
| **Why it's first** | Every other deliverable inherits its shape. Named in the raw notes as the decision that most determines what the first sprints look like. |
| **Full argument** | [Reference/2026-07-21 Strategy and Delivery Analysis.md](Reference/2026-07-21%20Strategy%20and%20Delivery%20Analysis.md) — the worked speed/risk/cutover position. |
| **CEO-facing form** | [05_Kickoff_Brief.md](05_Kickoff_Brief.md) §3. |
| **Key inputs** | Andrea's spreadsheet and client-problem map (T-08, Q-47) · the write-back boundary map (T-54) · what is really happening on the export side. |

### Recommendation (RL, 2026-07-21 — to validate with the CEO in W1)

**The unit of delivery is a MECE-complete "done" block, not a module and not a fixed weekly release.**
We deliver value continuously, but we do not force something into production every week or every
sprint. The organizing principle is that we work **sequentially** on slices that can be considered
genuinely *done* — in value generated or in migration achieved. After a block ships, 100% of a
defined part of the project (it can be small) is complete and, where it is a migration, no longer
depends on the legacy system (barring known future dependencies). Examples of a "done" block:

- 100% of a client's export operations are migrated and no longer depend on the legacy system; **or**
  a complete new UX ships; **or** a defined slice of the real-time client-notification capability is live.
- The security-remediation block is closed.
- Import operations for all clients that transfer files by FTP are done.

Blocks are planned MECE — no overlap, and together they cover the scope — so "done" always means the
same thing and progress is never half-finished.

**Two things are treated as already decided and will be presented to the CEO as such, not as open
questions:**

1. **Export first, Import sequenced after — not parallel.** Splitting the team we actually have
   across two verticals halves throughput on each, duplicates foundation decisions, and produces two
   half-finished things at the moment the first client-visible milestone is due. Export is already
   underway and is the first to cut over. This is a **direct disagreement with the CEO's scope
   decision #3**, presented as superseded with the arithmetic shown — softening it would be the
   failure mode.
2. **Continuous on the capability layer, batched per block on the core.** Adding agent/capability
   behavior *on top of* Delphi (notifications, dashboards, NCM, booking) is continuous — every block
   adds behavior without removing any, so there is nothing to batch. Replacing the core as the system
   of record is batched, always with rollback — every cutover is a risk event. The migration **unit
   is a group of clients and/or a group of processes** (not strictly one client at a time), sequenced
   by a deliberate logic, and the legacy system stays live for a block only **as long as that block
   genuinely needs it — decommission by readiness, not by calendar date.** This generalizes the CEO's
   "client by client" into the MECE done-block above while honoring his "don't switch off Delphi by
   date" (we switch off by *readiness* of each block, never by date).

**Technical shape that delivers the principle:** a strangler fig with **one-way data flow** (read
from legacy, write only in the new system) — not the bidirectional sync our v0 plan rightly rejected.
Sequence: **tracer bullets first** at the three binary unknowns (INTTRA reachability, A1-vs-A3 in
cloud mTLS, read-only `BROKER` at volume), **then a thin walking skeleton** — the week-8 read-only
notification — **then vertical slices** one capability at a time. The write-back boundary (which
capabilities must write into the legacy DB) is the highest-value open analysis and is mapped in T-54.

**Confidence: High** on the principle and on Export-first; **Medium** on the walking skeleton's cost,
which depends on how reachable `BROKER` really is (tracer bullet answers it).
**What would change our mind:** evidence the agent layer cannot be built without core changes first
(most plausibly if the legacy data needed for notifications isn't reachable read-only — DEC-07), or
materially more team capacity than assumed, which would reopen the parallelism question.

---

## DEC-01 — Document extraction / OCR

**The question the business asks:** *"Can we stop paying analysts to retype invoices, and trust
what comes out?"*

| | |
| --- | --- |
| **Owner** | RL. Rodrigo reviews. |
| **Method** | Empirical — the only one this phase. |
| **Context** | Option space in [IDP/2026-07-20 MECE options for IDP.md](IDP/2026-07-20%20MECE%20options%20for%20IDP.md) · document volumes and ground-truth batch gated on the client (T-02 → T-03). |
| **Contractual minimum** (Anexo I §1.3) | Select **one** external API provider by high-level analysis. Measure its **accuracy** and **cost** over **one** document type or **one** client. Final provider choice, and the ready-made-vs-build decision, come later — informed by this result. |
| **Blocked on** | T-02 (target selection) → T-03 (document batch with ground truth). |
| **Shortlist** | LlamaParse, Reducto, Extend. |

**Sub-question resolved — by document type, not by client (RL, 2026-07-21).** A single client spans
several document types with different failure modes, which muddies the accuracy signal; a single
document type across several clients gives layout variance, which is precisely what determines whether
a ready-made API survives contact with production. **Which** document type is still to confirm with
Indaiá — invoice or B/L are the natural candidates, and they may have a commercial reason to prefer
one. That confirmation is the one remaining input before the batch can be requested.

**What must be measured:** field-level accuracy against ground truth · calibration of the
confidence score (does low confidence actually predict error?) · cost per page at Indaiá's real
volumes · latency · LGPD data residency posture.

---

## DEC-02 — Agent cognitive engine

**The question the business asks:** *"When an agent needs to do five things in a row and one of them
fails, who notices, and can our own team fix the flow without calling a vendor?"*

| | |
| --- | --- |
| **Owner** | RZ. Ricardo cross-checks independently. |
| **Inputs on hand** | [Reference/2026-07-20 Architectural Lessons Learned — AI Frameworks and n8n Mapping.md](Reference/2026-07-20%20Architectural%20Lessons%20Learned%20—%20AI%20Frameworks%20and%20n8n%20Mapping.md) · [2026-07-14 Architectural Analysis — Agent Evolution and Orchestration Mapping.md](../01_Inputs_and_Resources/My%20Indaia%202.0%20Export%20+%20Import%20v0%20plan/2026-07-14%20Architectural%20Analysis%20—%20Agent%20Evolution%20and%20Orchestration%20Mapping.md) |
| **Inherited position** | `n8n` for low-code B2B/COMEX integration pipelines maintainable by Tech Ops; `LangGraph` reserved for multi-step cognitive agents (ingestion, NCM, compliance, booking, allocation). |

**Two questions to answer before comparing engines:**

1. **Which agents are actually needed** to deliver the CEO's goals and the DEC-06 strategy? Confirm
   the required agent set against the business outcomes *before* evaluating any engine — an engine
   chosen against an unconfirmed agent list optimizes for the wrong workload. Agent 09 (Booking) is
   the reference workload: multi-step flow, external call, partial failure, retry, timeout, escalation
   to a human, full audit trail. An engine that doesn't handle Agent 09 cleanly is the wrong engine.
2. **Is any two-week test worth running here at all**, or is analysis genuinely the right call?
   Anexo I §1.3 restricts empirical work to OCR, so if a test is essential it has to be raised early
   as a scope question rather than assumed.

**Load-bearing premise to re-test, not inherit (A6):** *does Indaiá actually need workflows
maintainable by people without deep technical skill?* The entire n8n half of the split rests on
this. If the real maintenance model is "two senior Python developers own everything", the split
gets simpler and cheaper. Ask it plainly in the CEO session and in the Wagner walkthrough — the
answers may differ, which is itself informative.

Deliverable is a **boundary rule plus a build roadmap over time**, not a product pick. Anexo I asks
for orchestration alternatives *and* the roadmap for building them out.

---

## DEC-03 — Database infrastructure

**The question the business asks:** *"Where does 26 years of customs data live, who can reach it,
and what does it cost us every month?"*

Owner RZ. Supabase (Auth + DB) vs. Clerk/Auth0 + AWS RDS. Supabase supports `sa-east-1` (São Paulo)
and native RLS with third-party JWTs. Must produce an OpEx line (P6). Interacts with DEC-04 (RLS is
half an RBAC answer) and DEC-07 (the bridge has to reach SQL Server regardless).

**Open constraint to verify:** whether BASF / Nestlé / Pirelli contracts restrict cloud processing
outside Brazil or the EU. Already logged as a blocker in `MEMORY.md`; it constrains DEC-01 as much
as DEC-03.

---

## DEC-04 — Access control model (RBAC)

Owner RZ. Interacts with DEC-03. Non-negotiable input from the CEO vision: every agent decision is
auditable — input, output, confidence, approver. That is an access-and-audit requirement before it
is a feature. (Treated as a given, not a premise to validate — see [05_Kickoff_Brief.md](05_Kickoff_Brief.md) §1.)

---

## DEC-05 — Scraping hosting + digital certificate (A1 vs. A3)

**The question the business asks:** *"Can the robot log into the government portal by itself, or
does someone have to be sitting there with a USB token?"*

Owner RZ. The binding technical question: can A1 software certificates replace physical A3
USB tokens/smartcards without breaking cloud mTLS in automated workflows? **This is an open decision,
not a settled premise** — we bring options and a recommendation, we do not present A3 as fixed.

**Constraint that outranks the technical answer:** the CEO vision holds that no customs act is ever
automatic — DUIMP and DU-E always require human review plus an A3 certificate for the customs act
itself. So this decision is about *automating everything up to the signature*, not about removing the
human. Frame the recommendation that way or it will read as violating a stated non-negotiable.

---

## DEC-07 — Stage-1 legacy bridge

Owner RZ, with Leandro. Read-only `pyodbc` bridge to the Delphi/SQL Server `BROKER` database so new
services can read 26 years of history without touching legacy operation. Access prerequisites are an
open blocker (Leandro). Hard constraint from the CEO vision: never reimplement `sp_di_calculo` or
`sp_calc_*` in Python — the bridge reads, it does not recompute. Directly enables the one-way
strangler-fig shape in DEC-06; tracer bullet (c) verifies read-only `BROKER` access at volume.

---

## DEC-09 — 12-week metrics

Owner RL. **Proposed by us, validated *and jointly prioritized* with the CEO** — we bring a
recommended set to the alignment session rather than asking him to generate one. The framing question
is broad: **of the metrics in the CEO vision, which are the most important ones to move in the first
12 weeks?** The CEO vision §5 already sets 12- and 24-month targets and rejects technical metrics as
the primary criterion. What is missing is the **12-week** subset: which needles do we commit to moving
inside the horizon this engagement actually plans?

Working hypothesis from the raw notes, to test with Fabricio: **export-only, client-facing, and
weighted toward proactive notification** — because notification is the cheapest visible win and maps
directly to the CEO's own north-star indicator (*how many times was a client told something before
they had to call and ask?*, today zero). Two baselines don't exist yet and someone has to start
measuring them now: inbound status calls, and NPS. This is the substance of [05_Kickoff_Brief.md](05_Kickoff_Brief.md) §2.

---
