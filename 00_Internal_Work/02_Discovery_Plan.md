# 02 — Discovery Plan

**Status:** Working draft, 2026-07-20. Calendar dates are indicative until the contract is signed
and the kickoff is confirmed with Fabricio.

---

## 1. What we are being paid to produce

Straight from [Anexo I](../00_Scope/Anexo_I_Escopo_e_Insumos_Discovery.md) §1.1. This table is the
definition of done for Fase 1.

| ID | Deliverable | Substance | Owner |
| --- | --- | --- | --- |
| **D-a** | Technical plan (architecture, stack, infrastructure, risks) | **One** plan reconciling three sources that currently disagree: CEO vision, the internal export build, our v0 migration plan. Carries recommendations with rationale and trade-offs for the five pending decisions below. | RL (RZ inputs) |
| **D-a1** | → Document extraction / OCR | Ready-made API vs. own solution. **One** provider validated empirically this phase. | RL |
| **D-a2** | → Agent cognitive engine | Orchestration alternatives + build roadmap over time. | RZ |
| **D-a3** | → Database infrastructure | Options compared. | RZ |
| **D-a4** | → Access control model (RBAC) | | RZ |
| **D-a5** | → Integration/scraping hosting + digital certificate | A1 vs. A3. | RZ |
| **D-b1** | Initial risk register | Technical, schedule, team. Each risk with an owner and a mitigation. | RL |
| **D-b2** | Legacy security / LGPD remediation plan | Not a vulnerability list — a **recommended action** per exposure, prioritized and sequenced for the start of construction. | RZ → RL |
| **D-b3** | Shadow-mode cutover validation design (Export) | Parallel operation over real transactions, acceptance criteria, go/no-go. Export first; same principles apply to Import. | RL + RZ |
| **D-c** | IT OpEx model | Recurring monthly cost of running the new system: OCR/LLM by volume, hosting, database, certificates. Explicitly **not** business case / ROI. | RL |
| **D-d** | Estimated development schedule | Firm plan for weeks 1–4, sketch for 5–12. Hybrid estimates: firm for deterministic scope, min–max range for AI scope, narrowing each sprint. | RL |

**Out of scope by contract (cl. 1.3):** software development or execution, business case / ROI,
post-implementation operation.

---

## 2. Timeline

| Phase | Window (indicative) | What happens |
| --- | --- | --- |
| **P0 — Prep** | 2026-07-20 → 2026-08-07 | Unbilled. Contract signature. Align RL×RZ. Chase insumos. Build the OCR PoC harness. Pre-read all existing material. Land the question lists with the client so answers arrive *before* the clock starts. |
| **P1 — Discovery W1** | ~2026-08-10 → 2026-08-14 | CEO alignment session. Code walkthrough with Wagner. OCR PoC executed and measured. Rodrigo's four architecture deep-dives run in parallel. |
| **P2 — Discovery W2** | ~2026-08-17 → 2026-08-21 | Guided decision sessions with the client. Convergence. Consolidation into a single prioritized, estimated backlog. Deliverables written. |
| **P3 — Fase 2** | after Discovery closes, 60 days | Advisory, ~4h/week. Weekly board/PR/decision review + team call + CEO status note. Fortnightly CEO call. Day 30 team capacity read, day 45 schedule re-baseline, day 60 closing package. |

**Target two weeks, tolerance up to four.** Ricardo has aligned with Indaiá that Discovery may run
somewhat past the nominal two weeks, principally because neither of us is on this full-time. That
tolerance is **headroom, not a plan** — the work is scoped and sequenced for two weeks, and the extra
weeks exist to absorb client-side slippage on the critical path, not to widen scope. See
[01_Working_Agreement.md](01_Working_Agreement.md) §3. Estimate in *working days available*, not
weeks elapsed, or four weeks quietly becomes the plan.

**The prep window is the real advantage.** The billed clock is two weeks; the preparation window is
three. Anything we can front-load — question lists answered, documents received, PoC harness
already built, existing material already digested — converts directly into depth during the weeks
that count. Treat P0 as the most leveraged part of the engagement.

---

## 3. Critical path

Three dependencies gate the deliverables. Everything else can be worked around.

| # | Dependency | Gates | Status | If it's late |
| --- | --- | --- | --- | --- |
| **CP-1** | **Read access to the export repository** | D-a (can't reconcile a plan against a build we can't see), and through it D-d | ❌ Not received | Highest-severity risk in the engagement. Fallback: reconcile against the export `README` + Wagner walkthrough + our v0 plan, and ship D-a with an explicit confidence penalty and a named revision trigger (P5). Escalate to Fabricio the moment the contract is signed. |
| **CP-2** | **Document batch with ground truth** | D-a1, and through it the OCR portion of D-c | ❌ Not received | The one empirically tested decision becomes analytical only — a material downgrade of the engagement's evidence base. Needs a client decision on *which* client/document type (see DEC-01) before the batch can even be requested. |
| **CP-3** | **CEO alignment session** | D-a's strategic frame, D-b3, D-c tolerance, D-d shape, DEC-06, DEC-09, the V-01…V-08 constraint validation | Not scheduled | Cannot be worked around. The delivery-strategy decision is the CEO's to make; we recommend, he chooses. Must land in W1, ideally W1 D1–D2. |

*(Nelson's departure and the continuity of his dashboards sit outside our scope — noted here only so
it is not mistaken for an oversight.)*

---

## 4. Workstreams

| WS | Name | Owner | Feeds | Runs |
| --- | --- | --- | --- | --- |
| **WS1** | Plan reconciliation — CEO vision × export build × v0 plan | **RL + RZ jointly** | D-a, D-d | P0 → P2 |
| **WS2** | OCR / IDP proof of concept | RL (RZ reviews) | D-a1, D-c | P0 → P1 |
| **WS3** | Architecture deep-dives — orchestration, DB, RBAC, certificates, legacy bridge | RZ (RL reviews) | D-a2–a5, D-c | P0 → P1 |
| **WS4** | Delivery strategy — cadence, sequencing, walking skeleton vs. slices, parallelism | **RL + RZ jointly** | D-a, D-d, D-b3 | P0 → P2 |
| **WS5** | Risk, security & LGPD, cutover design | RZ → RL | D-b1, D-b2, D-b3 | P1 → P2 |
| **WS6** | OpEx model | RL, **with RZ input** | D-c | P1 → P2 |
| **WS7** | Client interface — sessions, insumos, question lists | RL | all | P0 → P3 |

**WS1 and WS4 are joint, and they are the two that matter most.** Both of us run our own analysis,
then we work through the questions and trade-offs together before anything is framed for the client;
Ricardo decides what is presented. These are joint because business judgment and technical
feasibility are inseparable in them — split by owner, they produce two half-answers. WS6 is
Ricardo's, but cannot be completed without cost implications from each of Rodrigo's decisions (P6).

### WS1 — the one that needs saying out loud

The contract asks us to reconcile three planning artifacts into one. They are not merely
overlapping; in places they contradict each other, and one of them is our own. Specifically:

- The CEO vision's own README already flags internal inconsistencies in the PVD v4 (phase overlaps,
  ~90 vs. ~100 weeks, agents misfiled between verticals) and states plainly that the strategic layer
  — Fowler / Walking Skeleton / delivery-by-value — **is not reflected in v4 at all**.
- The v0 migration plan is ours, and needs to be re-checked against the CEO vision rather than
  defended. Our notes already suspect it may be more conservative than the value-delivery logic the
  CEO has signed up to.
- The export build is the one we can't see yet (CP-1) and is the only one that reflects what is
  *actually true* rather than what someone intends.

Reconciliation is therefore not a merge. It is an adjudication, and the CEO has to ratify the
result. Plan for it accordingly.

---

## 5. Priorities

Ordered. If the two weeks compress, work is dropped from the bottom.

1. **CEO alignment on delivery strategy** (CP-3, DEC-06). Everything downstream inherits its shape
   from this. Continuous value-delivery vs. batch releases is, as flagged in the raw notes, the
   decision that most determines what the first sprints look like.
2. **OCR PoC executed with real documents** (D-a1). The only empirical evidence the engagement
   produces. Its credibility carries the rest.
3. **Plan reconciliation** (D-a). The largest deliverable, gated on CP-1.
4. **Rodrigo's four architecture recommendations** (D-a2–a5). Parallelizable, lowest coordination
   cost, and each one feeds the OpEx model.
5. **Schedule** (D-d). Depends on 1–4 being settled enough to estimate against.
6. **OpEx model** (D-c). Assembles from 2 and 4. Deliberately preliminary — see below.
7. **Risk register, security/LGPD plan, cutover design** (D-b). Substantially draftable from the
   existing legacy audit before Discovery begins.

### On the OpEx model being "preliminary"

The raw notes ask what the pareto-optimal approach is for D-c given a short Discovery that cannot
produce a definitive answer. The answer: deliver a **structurally complete, numerically provisional**
model. That means the cost taxonomy is final and defensible (every line item that will ever appear
is present, with its cost driver and its unit), while the numbers carry stated ranges and confidence
levels. Fase 2 then refines the numbers into the existing structure rather than rebuilding the
model. Say this to the client explicitly rather than shipping a soft number and hoping.

---

## 6. Standing assumptions

Recorded so they can be falsified rather than quietly inherited.

| # | Assumption | If false |
| --- | --- | --- |
| A1 | Contract is signed the week of 2026-07-20 | Low impact. If signature slips, the project still starts in the **first or second week of August** — the start date is anchored to the client's own transition, not to signature. The prep window absorbs the slip |
| A2 | Kickoff lands in the first or second week of August | The August start was chosen precisely **to avoid** colliding with the client's team transition (Nelson's exit, Wagner's team change). A materially earlier start would reintroduce that collision |
| A3 | Wagner's export build is ~55–60% reusable (per AGENTS.md) | This number is inherited, not verified. CP-1 is what verifies it. If materially lower, D-d changes shape entirely |
| A4 | Indaiá operates 100% on DUIMP, so legacy DI stays out of scope | Restores ~36 weeks of scope and the project's largest fiscal risk |
| A5 | The client can supply real documents with ground truth | See CP-2 |
| A6 | Indaiá needs workflows maintainable by people without deep technical skill | ⚠️ **Must be revalidated, not inherited.** This premise carries the entire n8n half of DEC-02. Ask it plainly in both the CEO session (Q-25 context) and the Wagner walkthrough — the two answers may differ, which is itself the finding. If the real maintenance model is "two senior Python developers own everything", the orchestration split gets simpler and cheaper |
