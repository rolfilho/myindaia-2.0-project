# 01 — Working Agreement

**Ricardo Leite × Rodrigo Zayit — MyINDAIA Discovery**
**Status:** Draft for Rodrigo's reaction. Ricardo to confirm after first alignment call.

---

## 1. Roles

| | Ricardo Leite | Rodrigo Zayit |
| --- | --- | --- |
| **Contract** | Signatory. Sole accountable party to Indaiá. | Independent technical expert engaged by Ricardo. |
| **Domain** | Business, product, delivery strategy, commercial framing, OpEx, schedule. | Architecture, infrastructure, orchestration, security, legacy integration. |
| **Output status** | Deliverables. | Inputs to deliverables — not deliverables themselves. |
| **Client interface** | Owns all client communication and all decision presentations. | Joins working sessions; does not carry conclusions to the client independently. |
| **Review direction** | Triple-checks Rodrigo's technical recommendations with independent AI analysis. | Challenges Ricardo's business and delivery calls on technical feasibility grounds. |

**Consequence to internalize:** Rodrigo is a peer in the analysis and an input in the delivery.
Both halves of that sentence matter. He should argue hard; he should not assume his conclusion
ships unaltered.

---

## 2. Governance principles

**P1 — Single delivery owner.**
Everything that reaches Indaiá passes through Ricardo. No parallel channel, no direct
recommendation, no "I mentioned to Wagner that…". Rodrigo raises it to Ricardo; Ricardo decides
whether and how it lands with the client.

**P2 — Split by question, not by document.**
Each of us owns *questions* end-to-end rather than co-editing artifacts. Co-editing a live document
across two people in a two-week window costs more than it returns. Ownership is in
[04_Decision_Register.md](04_Decision_Register.md); the working split is:

| Ricardo owns | Rodrigo owns | Joint |
| --- | --- | --- |
| OCR / IDP proof of concept (DEC-01) | Agent orchestration engine (DEC-02) | **Delivery strategy & cadence (DEC-06)** |
| 12-week outcome metrics (DEC-09) — with the CEO | Database infrastructure (DEC-03) | **Plan reconciliation (WS1)** |
| IT OpEx model (DEC-c) — with Rodrigo's input | RBAC model (DEC-04) | |
| Schedule, risk register | Scraping hosting + A1/A3 certificate (DEC-05) | |
| | Stage-1 legacy bridge to BROKER (DEC-07) | |

Reviewer is always the other person. No decision ships single-eyed.

**The joint column works differently.** For DEC-06 and WS1 — the delivery strategy and the
reconciliation of the three planning documents — we each run our own analysis, then work through the
questions and trade-offs together before anything is framed for the client. Ricardo still decides
what gets presented and how. These two are joint because they are where business judgment and
technical feasibility are inseparable; splitting them by owner would produce two half-answers.

**P3 — Every Tier-1 recommendation has a fixed shape.**
One page. Five sections, in this order, no exceptions:

1. **The question** — phrased as something the operation or the business asks, not as a technology
   choice. (`"Can we guarantee we'll meet the Maersk MQC contract this month?"`, not
   `"n8n or LangGraph?"`)
2. **Options** — MECE, including the option of doing nothing.
3. **Trade-offs** — what each option costs in money, time, risk, and reversibility.
4. **Recommendation + confidence** — stated as High / Medium / Low, with the reason for the level.
5. **What would change my mind** — the specific evidence that would flip the recommendation.

Sections 4 and 5 are not decoration. They are what makes an independent AI cross-check meaningful,
and they are what protects us in month six when a decision needs revisiting.

**P4 — Adversarial review is expected and impersonal.**
Ricardo will run independent analysis against Rodrigo's conclusions. This is the design of the
engagement, not a signal of distrust. A disagreement that survives both passes does not get
smoothed over — it goes into the client deliverable as an explicit, named trade-off with both
positions. Indaiá is buying judgment, and manufactured consensus is worth nothing.

**P5 — A missing input never blocks a recommendation.**
Several insumos will arrive late or not at all (the export repository is the acute case). Where an
input is missing, the recommendation ships anyway, carrying: the assumption made, the confidence
penalty, and the named trigger that would force revision. "We couldn't conclude because we didn't
receive X" is not an acceptable deliverable.

**P6 — Nothing is recommended that cannot be cost-modelled.**
Deliverable (c) is a recurring IT OpEx model. Every architectural option therefore carries an OpEx
implication from the moment it is proposed, even if the number is an order of magnitude. An option
with no cost estimate is not yet an option.

**P7 — Scope discipline.**
[Anexo I](../00_Scope/Anexo_I_Escopo_e_Insumos_Discovery.md) §1.1 defines what MUST be delivered.
Anything beyond it is a deliberate investment — usually in learning or in differentiating the
engagement — and is marked as such in the decision register before work starts, never absorbed
silently. Out of scope by contract (cl. 1.3): building software, business case / ROI, post-launch
operation.

---

## 3. Time budget

**Target two weeks. Tolerance up to four.** Ricardo has aligned expectations with Indaiá that
Discovery may run somewhat beyond the nominal two weeks — principally because neither of us is on
this full-time. We still aim to land everything in two.

What this changes, and what it doesn't:

- **It is headroom, not a plan.** The work is scoped, sequenced and staffed for two weeks. Four is
  the outer bound if inputs arrive late or the client's availability slips — not a budget to spend.
- **It absorbs client-side slippage, not ours.** The critical path (export repository, document
  batch, CEO session) is where the extra weeks are most likely to go.
- **It does not extend the deliverables.** Scope discipline (P7) is unchanged. More time is not an
  invitation to widen the OCR PoC or add analyses.
- **Part-time is the real constraint.** Calendar weeks are not working weeks. Estimate in working
  days available, not in weeks elapsed, or the four-week tolerance will quietly become the plan.

## 4. Cadence

| Ritual | When | Format |
| --- | --- | --- |
| Prep sync | 2×/week during the prep window | 45 min call — unblock, align, hand off |
| Daily check | Each working day during Discovery | 15 min async written note, call only if needed |
| Mid-point review | ~Halfway through Discovery | 90 min — every decision gets a status and a confidence level |
| Convergence session | Before consolidation | Half-day — resolve surviving disagreements, lock recommendations |
| Fase 2 | 60 days after Discovery | Weekly async board + decision review; Ricardo runs client cadence |

### Open with Rodrigo — to settle in the first alignment call

The cadence above is a proposal built on assumptions about availability that have not been tested.
All of it is open:

- **Availability during the unpaid prep window** — how much, and when?
- **Working days and hours** during Discovery, given neither of us is full-time. Where do the
  overlapping hours actually fall?
- **Sync vs. async preference** — the daily check assumes async-by-default with calls on demand.
  Some people work better the other way round.
- **Best times for calls**, and how much notice is needed.
- **Hard unavailability** — travel, other engagements, anything that would make a critical-path day
  disappear. Better known now than discovered in week two.

---

## 5. Artifact conventions

- **Decisions** live in [04_Decision_Register.md](04_Decision_Register.md). One row per decision.
  A decision is never "done" — it is `Open` → `Analysis` → `Recommended` → `Ratified` (by client).
- **Tasks** live in [03_Task_Board.md](03_Task_Board.md). Every task names an owner and the
  deliverable it feeds. A task that feeds no deliverable is either scope creep or belongs in the
  strategy notes.
- **Questions** live in [05_Open_Questions.md](05_Open_Questions.md), filed by *who can answer
  them*. A question with no named addressee is not yet a question.
- **Deep analyses** get their own dated file in this folder, named
  `YYYY-MM-DD <Topic>.md`, and are linked from the decision they support.
- **Dates** are ISO (`2026-08-10`). Relative timelines use `W1 D3` (Discovery week 1, day 3).
- Prefer tables. State confidence. Do not guess technical specifics — check the reference indexes
  or file a question.

---

## 6. Escalation

| Situation | Action |
| --- | --- |
| Technical disagreement that survives both analyses | Document both positions; Ricardo decides what ships; both go in the deliverable |
| Client insumo late, blocking a decision | Ricardo escalates to Fabricio; Rodrigo proceeds under P5 with a stated assumption |
| Scope pressure from the client during Discovery | Ricardo only. Rodrigo does not accept scope in a session |
| Finding that changes the commercial shape of the project | Immediate call, same day, regardless of cadence |
