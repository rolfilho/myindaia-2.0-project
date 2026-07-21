# 05 — Kickoff Brief (CEO alignment session)

**Status:** Internal English master, 2026-07-21. The version sent to Fabricio is rewritten in PT-BR
and reviewed by Ricardo first. This is the pre-read.

**Purpose.** Send this ahead of the kickoff so the session is a **discussion of decisions and
trade-offs over pre-absorbed context**, not a briefing from a blank page. It is deliberately concise.
Everything here has a home in the working docs — [04_Decision_Register.md](04_Decision_Register.md)
for the decisions, [02_Discovery_Plan.md](02_Discovery_Plan.md) for schedule and deliverables — this
brief is the CEO-facing distillation.

We ask Fabricio to read four things before the call: the premises we are building on (§1), the goals
and metrics we propose to prioritize (§2), the trade-offs where our analysis has something to say
(§3), and what we need from Indaiá to keep the critical path moving (§4).

---

## 1. Premises we are building on — confirm or correct

Phrased as statements, not open questions. If any is wrong, that correction is worth more than an
hour of open discussion. Two kinds:

**Givens — our understanding of your non-negotiables. Correct us only if we have them wrong:**

- No customs act is ever automatic. DUIMP and DU-E always require human review plus a certificate for
  the customs act itself. Automation goes *up to* the signature, never through it.
- Every agent decision is auditable — input, output, confidence, approver.
- Migration is client by client, always with a rollback path. Never all clients at once.

**Premises we genuinely need you to confirm — each one moves our schedule or cost:**

| # | Statement to confirm | Why it matters |
| --- | --- | --- |
| 1 | Indaiá operates 100% on DUIMP. Legacy DI is out of scope and stays a read-only archive. | The single biggest scope boundary in the project. If it moves, schedule and cost move with it. |
| 2 | The team we plan against is Wagner's internal team plus **two external contract developers.** | Every estimate depends on it. We need seniority, contract length, and realistic capacity. |
| 3 | **Who is the pilot client** for the first client-visible delivery — the most communicative, most tolerant of rough edges? | We can't design a first slice without knowing who receives it. Still open on your side. |
| 4 | **Which client-visible milestone would be most valuable to announce first?** | The most useful prioritization input only you can give. |

> One decision that is sometimes assumed settled is **not**: whether A1 software certificates can
> replace physical A3 tokens for the automatable portion of the flow. We are bringing options and a
> recommendation on this (DEC-05); it is an open decision, not a premise.

---

## 2. Business goals and the first-12-weeks metrics — to prioritize together

The CEO vision (§5) already sets 12- and 24-month targets and rightly rejects technical metrics as
the success criterion. What it does not yet fix is the **12-week subset**: of the goals and metrics in
your vision, which needles do we commit to moving inside the horizon this engagement plans?

We bring a proposed answer rather than a blank page, to react to:

- **North star: proactive client notification.** *How many times was a client told something before
  they had to call and ask?* — today, effectively zero. It is the cheapest visible win, it is
  export-only and client-facing, and it maps directly to your own stated indicator.
- **Two baselines don't exist yet and someone should start measuring now:** inbound status-call
  volume, and client NPS. Without a baseline, any improvement we report later is unprovable.

The ask at kickoff: **jointly rank the vision's goals for the first 12 weeks**, and confirm that
proactive notification is the right first needle — or tell us what beats it.

---

## 3. Trade-offs where our analysis has something to say

These are the parts of the session worth the most time. Each is a recommendation with a reason, not a
question we are punting to you.

**a. The unit of delivery — MECE-complete "done" blocks, continuous where safe, batched where risky.**
We deliver value continuously, but we do not force something into production every single week.
We work sequentially on slices that can be considered genuinely *done* — a client's export fully off
the legacy system, or a complete notification capability, or the security block closed — planned so
they don't overlap and together cover the scope. Adding capability *on top of* Delphi is continuous;
replacing the core is batched **client by client with rollback**.

**b. Export first, Import sequenced after — not in parallel.** This is a direct disagreement with
scope decision #3 in your plan. With the team we actually have, running both verticals at once halves
throughput on each and leaves two half-finished things when the first milestone is due. We will show
the arithmetic; the recommendation is to prove Export's foundation first, then reuse it for Import.

**c. A contradiction in *our own* prior work you should know about.** Our v0 migration plan prescribes
a two-week hard cutover and legacy decommissioning — both of which your own non-negotiables rule out.
We are resolving it in favor of your position: a strangler fig with **one-way data flow** (new
services read legacy data and add behavior; nothing is written back into the legacy core). We are
raising it rather than smoothing it over, and we lead with the resolution.

**d. The biggest schedule risk in your plan is a phone call away.** The flagship week-8 / week-12
booking demonstration depends on INTTRA API access that your own vision names as the largest current
technical risk and lists as a *this-week* action. If REST access isn't available, that milestone
degrades to fragile browser automation. We want this answered **before** we write the schedule, not
after — and the read-only notification milestone (which needs no INTTRA) de-risks the narrative if
booking slips.

**e. OCR proof of concept — by document type.** We will measure one document type across several
clients (layout variance is what stresses a ready-made API), rather than one client across many
document types. We need you to confirm **which** document type — invoice or B/L are the natural
candidates, unless there is a commercial reason to prefer a specific client.

---

## 4. Logistics — what we need to keep the critical path moving

Three dependencies gate the deliverables; each is on the client side.

| Need | For | Owner at Indaiá |
| --- | --- | --- |
| Read access to the **export repository** | The whole technical plan — we can't reconcile against a build we can't see | Wagner / you |
| **Document batch with ground truth** (already-keyed data ideal) + monthly document volumes by type | The one empirically tested decision (OCR) | Wagner / Operations |
| Read-only access to the legacy **BROKER** database + confirmation the `sa`/`123` credential is rotated | The legacy bridge and the notification milestone | Leandro |
| **INTTRA REST API credentials** status | The booking milestone and the schedule | You |
| Current **IT infrastructure run-rate** (what Indaiá spends today) | The baseline for the OpEx model — a new number in isolation means nothing without it | You / Finance |
| Andrea's operational **problem map and client buckets**, and getting **Andrea into the project** | Pilot-client selection and migration sequencing — the missing half of the process map | Andrea / you |

**Andrea (Director of Operations) should be in this project.** Her map of where the operation hurts
and how clients group together is the closest thing to a real prioritization input we have; without
it, sequencing is inferred from the legacy code alone.

---

## 5. Schedule and deliverables — for review

- **Target two weeks of billed Discovery, tolerance up to four** (headroom for client-side slippage,
  not a plan). The three-week unpaid prep window before it is the most leveraged part of the
  engagement — the more of the above we answer before the clock starts, the deeper the two weeks go.
- **Deliverables (Anexo I §1.1):** one reconciled technical plan (D-a) with recommendations on the
  five pending decisions · initial risk register (D-b1) · legacy security/LGPD remediation plan (D-b2)
  · shadow-mode cutover design (D-b3) · IT OpEx model (D-c) · estimated development schedule (D-d).
- **Out of scope by contract:** building the software, business case / ROI, post-launch operation.
- **Fase 2:** 60 days of advisory (~4h/week) after Discovery closes.

The kickoff itself we want **concise and to the point**: confirm §1, prioritize §2 together, work the
§3 trade-offs, and lock the §4 access items with named owners and dates.
