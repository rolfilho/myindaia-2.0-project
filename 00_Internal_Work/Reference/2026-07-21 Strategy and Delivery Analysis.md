# Strategy and Delivery Analysis — one-time reference

**Owner:** RL + RZ jointly (WS4 / DEC-06)
**Status:** Ricardo's opening position, 2026-07-20. Written to be argued with, not agreed with.
**Archived 2026-07-21** from live state (was `06_Strategy_Tensions.md`). Its conclusions now live
in the relevant decision blocks of [../04_Decision_Register.md](../04_Decision_Register.md) —
principally DEC-06. This file preserves the full worked argument behind those calls; it is consulted,
not maintained.
**Purpose:** the speed / risk / value / cutover argument worked into a form worth putting to the CEO —
options, trade-offs, a recommendation and a confidence level. The CEO-facing distillation is in
[../05_Kickoff_Brief.md](../05_Kickoff_Brief.md).

---

## 1. The tension, as stated in the raw notes

> If we keep preserving all legacy modules, building outside-in, doing strangler fig… we'll mitigate
> all the risks but move slowly, and deliver value slowly.

That is the right worry. But I think it is aimed at the wrong target, and getting the target right
changes the whole conversation with the CEO.

**The CEO's vision is not conservative.** It commits to a client-visible outcome at week 8, rejects
technical metrics as a success criterion, and forbids invisible foundation sprints. That is an
aggressive value-delivery posture. What it *is* conservative about is **risk to the legacy system** —
never switch off by date, migrate client by client, never reimplement the fiscal calculations.

Those two postures are not in conflict. They are only in conflict if you assume value must come from
replacing the legacy core. **It doesn't** — and the CEO's own document says so plainly: *"the agents
automate the flow **on top of** the existing Delphi — they don't replace anything."*

So the real question is not speed versus risk. It is:

> **Which layer do we invest in first — the agent/orchestration layer above the legacy system, or the
> replacement of the core underneath it?**

The first delivers client-visible value in weeks and carries almost no risk to operations. The second
is slow, invisible for a long time, and eventually unavoidable. The CEO vision already picks the
first. **The thing to check is whether our own v0 migration plan reflects that choice — and my
suspicion is that it doesn't.** If the v0 plan is organized module-by-module against the Delphi
inventory, it has inherited the slow shape regardless of what the vision says.

That reframing is worth more to Fabricio than any question we could ask him.

---

## 2. The contradiction WS1 has to resolve

Before pricing anything: the two plans we are asked to reconcile do not disagree at the margin. On
cutover they are **opposites**, and the one that contradicts the client's stated non-negotiables is
ours.

| | CEO vision | Our v0 plan |
| --- | --- | --- |
| **Approach** | Strangler fig — Delphi never stops | **Greenfield rewrite** — strangler fig explicitly rejected |
| **Cutover** | Client by client, rollback in <5 min via feature flag | **2-week vertical hard cutover** (W19–26), then legacy decommissioning |
| **Timing** | Never by date; switch off when the team prefers Python | By date: W19–26 |
| **Horizon** | ~100 weeks | 26 weeks |
| **Team model** | 2 senior Python developers | External senior dev + upskilled Tech Ops lead + junior/mid "vibe-coding" UI dev |

The CEO's §6 lists *"migration client by client, always with rollback, never all at once"* as
non-negotiable and §7 lists *"don't switch off Delphi by date"* as a thing not to do. **Our v0 plan
does both of the things he has ruled out.** This is not a nuance to be smoothed over in a
reconciliation — it is the single largest gap between the documents, and D-a cannot be written
without resolving it explicitly.

### But the v0 rejection is better-reasoned than it first appears

It rejected strangler fig for three stated reasons, and two of them are legitimate:

| Rejected risk | Assessment |
| --- | --- |
| **SQL Server trigger loops** — writing back to `TFOLLOWUP` cascades legacy business rules (e.g. Nestlé B2B logic), risking infinite loops and overwrites | **Real.** This is a genuine hazard and not hypothetical. |
| **Dual-database split-brain** — users editing in Delphi while Python writes to PostgreSQL; conflict resolution across two databases without locks | **Real.** Bidirectional transactional sync between two systems of record is genuinely very hard. |
| **~18 weeks of discarded scaffolding** | **Plausible, and the strongest cost argument.** Worth quantifying rather than accepting. |

### The resolution — and it is a narrow one

Read the v0 text precisely: *"We reject the Strangler Fig approach **(running Delphi and Python
concurrently with bidirectional database sync)**."*

It defined strangler fig **as** bidirectional database sync, then rejected it on the risks of
bidirectional database sync. Against that definition the rejection is sound. But strangler fig does
not require bidirectional sync — and the CEO's version explicitly doesn't have it. His model is
agents that **read** legacy data and **add** behavior on top, writing nothing back.

So the two positions collapse into one concrete, answerable question:

> **Which agent capabilities require writing back into the legacy database, and which are read-only?**

- **Read-only capabilities** (notifications, dashboards, MQC visibility, NCM suggestion) carry
  neither rejected risk. They are fast, safe, and client-visible. The week-8 milestone is one of them.
- **Write-back capabilities** (booking status into `TFOLLOWUP`, follow-up updates) hit Rejected Risk
  1 directly — including the named Nestlé trigger cascade.

That is the investigation you flagged under Q-01, and it is now the highest-value analytical task in
the prep window (**T-54**). It determines how much of the CEO's agent layer is actually cheap, where
the real boundary sits, and whether "26 weeks" and "~100 weeks" are even describing the same project.

**Working hypothesis:** the read-only agent layer is genuinely low-risk and can proceed continuously;
the write-back boundary is where the v0 plan's concerns bite; and the honest reconciliation is a
strangler fig with **one-way data flow**, not the bidirectional version that was rejected.

---

## 3. The four inherited commitments, priced

Each was adopted as a principle. None was adopted with its cost stated. Pricing them is our job.


| # | Commitment                                                        | What it genuinely buys                                                                                                                | What it costs                                                                                                                             | Verdict                                                                                |
| - | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| 1 | **Strangler fig — Delphi never stops**                           | Removes the catastrophic-failure mode. A customs brokerage that cannot transmit cannot operate; there is no acceptable big-bang here. | Low **if one-way** (read from legacy, write only in the new system). Genuinely high if bidirectional — see §2. Plus the v0 plan's ~18 weeks of scaffolding, which needs quantifying. | **Keep, in its one-way form.** The v0 objection is valid only against the bidirectional version. |
| 2 | **Outside-in / walking skeleton**                                 | Forces the first delivery to be client-visible and proves the path end-to-end.                                                        | Little,*provided* the skeleton crosses a path that carries real technical risk. A skeleton through the easy path proves nothing.          | **Keep, with a correction** — see §4.                                                |
| 3 | **Client-by-client cutover with rollback**                        | The risk of one client complaining is ~100× cheaper than all of them complaining together. Genuinely sound.                          | Slower total migration; per-client operational overhead; a long period running two systems.                                               | **Keep.** The cheapest insurance in the plan.                                          |
| 4 | **Two parallel verticals (Export ‖ Import) from the foundation** | Shortens the critical path —*if* staffed.                                                                                            | With the team we actually have, halves throughput on each vertical and doubles coordination.                                              | **Challenge this one.** See §5.                                                       |

The important finding: **three of the four are cheap and worth keeping.** The perceived slowness is
not their sum — it comes from (a) reading strangler fig as module-by-module replacement, and (b) the
parallelism commitment, which is a staffing claim disguised as an architecture principle.

---

## 4. Q-01 — Continuous value vs. batched releases

The question as posed is a false dichotomy, and dissolving it is the answer.

There are two distinct tracks, and they want opposite cadences:


| Track                                       | What it is                                                                 | Right cadence                                        | Why                                                                                                                                 |
| ------------------------------------------- | -------------------------------------------------------------------------- | ---------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| **Agent / capability layer** (above Delphi) | Notifications, booking automation, NCM classification, document extraction | **Continuous.** Every 1–2 weeks a capability lands. | Adds behavior without removing any. Failure is contained — the analyst does what they did before. No cutover, so nothing to batch. |
| **Core replacement** (under Delphi)         | The new system taking over as the system of record                         | **Batched, client by client.**                       | Every cutover is a risk event with an operational cost. Batching by client is exactly what commitment 3 prescribes.                 |

**Recommendation:** continuous on the capability layer, batched per-client on the core. The unit of
continuity is a **client-visible capability**, never a module.
**Confidence: High** — this is the CEO's own logic made explicit, not a new proposal.
**What would change my mind:** evidence that the agent layer cannot be built without core changes
first — most plausibly if the legacy data needed to drive notifications isn't reachable read-only
(DEC-07), or if agent write-backs to Delphi turn out to be unavoidable earlier than assumed.

---

## 5. The delivery pattern — what the options actually mean

The four patterns get used loosely and are routinely confused, so here they are defined precisely,
then applied to this project.

### 5.1 The four options, defined

| Pattern | What it is | What it proves | What it does NOT prove | Typical cost |
| --- | --- | --- | --- | --- |
| **Walking skeleton** | The thinnest possible *end-to-end* implementation across **every layer**, deployed to production. Trivial functionality, real pipes: UI → API → DB → external output. | That the pipeline connects and can be deployed and operated. Breadth. | That any hard problem is solvable. It deliberately avoids the hard parts. | 2–4 weeks. Needs the whole pipeline to exist before anything ships. |
| **Tracer bullet** | Full-fidelity, real code fired through the **single riskiest** part of the system to get real runtime data. Depth on one uncertainty, not breadth. | Whether a specific hard thing is possible, and how it behaves under real conditions. | Anything about the rest of the system. | Days to 2 weeks each. Cheap, and often binary in outcome. |
| **Vertical slice** | One **complete business capability**, full stack, genuinely usable. | Real user value; team velocity becomes measurable. | Nothing about unknowns — it assumes the architecture is already settled. | Per capability. The steady-state mode once uncertainty is resolved. |
| **Prototype / spike** | Throwaway. Answers a design or UX question. | What people want, or whether an approach is workable. | Nothing about production behavior — it is discarded by design. | Days. |

**The distinction that matters here:** a walking skeleton is *thin and wide* — it proves the pipes
connect, and it deliberately routes around difficulty. A tracer bullet is *narrow and deep* — it
aims at the thing most likely to break the plan. **A walking skeleton built through the easy path
proves almost nothing**, which is the failure mode this project is closest to.

### 5.2 Applying the framework to Indaiá

Our own decision framework
([2026-07-20 Architectural and Delivery Patterns.md](2026-07-20%20Architectural%20and%20Delivery%20Patterns.md))
asks two questions:

- **Is technical / integration risk high?** **Yes** — INTTRA, government portals, A3 certificates in
  cloud environments, read-only access to a 26-year-old SQL Server, and the write-back boundary
  from §2.
- **Is infrastructure known?** **Partly** — Wagner's build already exercises React 19 + FastAPI +
  Supabase, so the deployment path is not virgin territory. This is exactly what CP-1 verifies.

High risk + partly-known infrastructure points at **tracer bullets first, then a walking skeleton**
— not a walking skeleton on its own.

### 5.3 Recommendation — sequence all three

| Step | Pattern | What it is, concretely | Why now | Cost |
| --- | --- | --- | --- | --- |
| **1** | **Tracer bullets** ×3, in parallel | (a) Can we reach INTTRA over REST, with credentials and a sandbox? (b) Can A1 software certificates carry outbound mTLS from a cloud environment, or is A3 hardware mandatory? (c) Can we read `BROKER` read-only, at volume, without disturbing production? | All three are **binary answers that reshape the plan**, and all three are currently assumed rather than known. Each is days of work. Getting a "no" in week 1 is worth vastly more than getting it in week 12. | Days each |
| **2** | **Walking skeleton** | The **week-8 notification**: read a vessel event from `BROKER` → detect the state change → notify the client. Crosses every layer, deployed, client-visible. | It is the CEO's own north-star behavior, it is genuinely thin, and — critically — it is **read-only**, so it sidesteps the entire §2 write-back problem. The cheapest real thing in the plan. | 2–4 weeks |
| **3** | **Vertical slices** | One capability at a time on the agent layer: booking, NCM, extraction. | Only once 1 and 2 have removed the unknowns. This is the steady state, and it is what "continuous delivery" in §4 actually means in practice. | Ongoing |

**Confidence: High** on the sequence; **Medium** on step 2's cost, which depends on how reachable
`BROKER` really is (tracer bullet 1c answers it).
**What would change my mind:** if tracer bullet (c) shows the legacy data needed for notifications
isn't reachable read-only, the walking skeleton has to move to a different first capability, and the
"cheap and safe" claim for the read-only layer weakens considerably.

### 5.4 A note on the CEO vision as an input

The CEO vision is a **key input and the primary statement of intent** — it is where the business
outcomes, the non-negotiables and the commercial narrative come from, and none of that should be
second-guessed lightly. But it was drafted with AI assistance, and it shows in specific places: the
internal inconsistencies its own README documents, the ~90-vs-~100-week arithmetic, and phase
sequencing stated with more precision than the underlying analysis supports.

Treat it as: **authoritative on intent and constraints, provisional on sequencing and estimates.**
Where our analysis contradicts its sequencing, we say so with the reasoning shown — that is what the
engagement is for. Where it states a business constraint, we take it as given until Fabricio himself
relaxes it.

### 5.5 The finding that matters most in this document

**The CEO's week-8 and week-12 milestones both depend on INTTRA API access that may not exist.**

The vision's flagship demonstration is Agent 09 submitting a booking to the carrier via INTTRA and
confirming in 30 minutes. The same document names the RPA dependency as *"the largest current
technical risk"* and lists "contact INTTRA for REST API credentials" as an action for *this week* —
an action that appears still open (Q-14).

If INTTRA REST access is not available, the week-12 booking milestone degrades to browser automation
against a third-party portal: fragile, silently breaking, and directly in conflict with the
"never fails silently" principle. The entire client-facing narrative for the first quarter rests on
an unanswered question that is a phone call away.

**Recommendation:** the first tracer bullet is INTTRA connectivity, and Q-14 is answered before the
schedule (D-d) is written, not after.
**Confidence: High.** This is a dependency, not a preference.
**What would change my mind:** confirmed REST credentials with a usable sandbox — in which case the
risk collapses and the walking skeleton proceeds as the CEO describes.

### On the week-8 notification milestone

Worth separating from the booking milestone, because it is *much* cheaper. A push when the vessel
arrives can be driven from data already in `BROKER` plus a notification channel. No INTTRA, no
carrier integration, no agent reasoning. It is the one milestone that is nearly free, is the CEO's
own north-star behavior, and derisks the whole narrative if booking slips.

**If we recommend one thing for week 1–8, it is this.**

---

## 6. Q-05 — Parallel Export ‖ Import verticals

The CEO's scope decision #3 puts independent teams on both verticals from the foundation, to shorten
the critical path.

**The arithmetic doesn't support it at current staffing.** The team is Wagner's internal group plus
two external contract developers (V-08 — confirm this at kickoff). The vision's own guidance argues
against it from the other direction too: *"don't hire a large team before validating the walking
skeleton — one senior Python developer covers the first three sprints."* You cannot simultaneously
staff two independent verticals and keep the team deliberately small.

Splitting a small team across two verticals produces: half throughput on each, duplicated foundation
decisions, doubled coordination, and two half-finished things at the point where the first
client-visible milestone is due.

**Recommendation — agreed internally (RL, 2026-07-20): Export first, Import sequenced after.**
Export is already underway, it is the first to cut over, and it is where Wagner's build and domain
knowledge already sit. Import starts when Export's foundation is proven and reusable — which is also
when the second vertical becomes genuinely cheaper to build. **The parallelism commitment is treated
as stale** and will be presented to the CEO as superseded, not as an open question.
**Confidence: High** on the direction; the team-size figure (V-08) affects only the *size* of the
saving we quote, not the recommendation.
**What would change my mind:** materially more capacity than V-08 suggests, or a commercial
commitment on the Import side we don't currently know about — worth asking rather than assuming.

Note this is a **direct disagreement with a stated CEO scope decision.** It should be presented as
such, with the arithmetic shown. This is the kind of thing Indaiá is paying us for; softening it
would be the failure mode.

---

## 7. Q-03 — Framing the speed/risk conversation

Do not ask "where is your tolerance between speed and risk?" in the abstract. It produces a
directional answer that binds us without meaning anything.

Ask it as a **priced choice**, once §§2–5 are settled:

> "Here are the four commitments in your plan. Three cost you almost nothing and we recommend
> keeping all three. The fourth — two parallel verticals — costs roughly *N* weeks on the Export
> critical path at current team size. Here is what sequencing instead would buy you, and what it
> would delay. Which do you want?"

That is a question a CEO can answer well. The abstract version is one nobody can.

**Before we can ask it, we need:** the team-size confirmation (V-08), Wagner's real velocity (Q-26),
and the reuse verification (Q-23) — because *N* is unquotable without them.

---

## 8. Agent 09 (Booking) — and the "so what"

The observation that Agent 09 keeps surfacing is only useful if it changes what we do. It does, in
three concrete ways.

**So what #1 — it is the reference workload for DEC-02.**
Do not evaluate orchestration engines abstractly. Score every candidate against Agent 09
specifically: multi-step flow, external call to a third party, partial failure, retry, timeout,
escalation to a human, and a full audit trail of the decision. That is the hardest thing the engine
will be asked to do in the first year. **If a candidate doesn't handle Agent 09 cleanly, it is the
wrong engine — regardless of how well it handles anything else.** This turns DEC-02 from a
comparison of feature lists into a single concrete test, which is also far easier to defend to the
client.

**So what #2 — it sets the write-back boundary.**
Booking is the first capability that plausibly needs to write *back* into the legacy database
(booking status into `TFOLLOWUP`). That puts it directly on the §2 fault line — it is where the
cheap read-only agent layer stops and the v0 plan's rejected risks begin. **Agent 09 is therefore
the test case for T-54**, not a separate question.

**So what #3 — it is where the schedule risk concentrates, so it must not be first.**
Because it carries the INTTRA dependency, Agent 09 is the *worst* candidate for the first delivery
and the *best* candidate for the first tracer bullet. Fire a tracer bullet at its integration in
week 1; deliver the read-only notification milestone first; build Agent 09 once the dependency is
known rather than assumed.

Net: **Agent 09 is the benchmark for three decisions and the deliverable for none of them yet.**

---

## 9. What we take to the CEO, and in what order

1. **Reframe** (§1): the choice is which layer to invest in first, not speed versus risk. His vision
   already answers it; our v0 plan does not.
2. **The cutover contradiction** (§2): our v0 plan prescribes a hard cutover and legacy
   decommissioning, both of which his own non-negotiables rule out. We are proposing to resolve it
   in favour of his position, in the one-way form — but he needs to know the gap existed and how we
   closed it.
3. **The INTTRA dependency** (§5.5) — the biggest schedule risk in his own plan, and it is
   unanswered.
4. **Export first, Import sequenced** (§6) — presented as superseding his scope decision #3, with
   the arithmetic shown.
5. **Week-8 notification as the first delivery** (§5.3) — cheap, visible, read-only, and his own
   north star.

Items 2, 3 and 4 are where we tell him something he does not currently believe. Everything else is
confirmation and sequencing. Item 2 is also the one that requires most care: we are reporting a
defect in **our own** prior work, and the right posture is to lead with the resolution rather than
the mea culpa.

---

## 10. Open — needed before this document is finished

| # | What we need | From | Blocks |
| - | --- | --- | --- |
| 1 | **Which agent capabilities need write-back to the legacy DB, and which are read-only** | **RL + RZ — ours to answer (T-54)** | §2 resolution, §4, §5.3, §8. The highest-value analysis in the prep window |
| 2 | INTTRA REST API status | Fabricio (Q-14) | §5.5, D-d |
| 3 | Quantify the v0 plan's "~18 weeks of discarded scaffolding" claim | **RL + RZ (T-10)** | §2 — it is the strongest argument the v0 plan makes and we have not tested it |
| 4 | Whether the v0 plan is organized by module or by capability | **RL + RZ (T-10)** | §1, the whole reframe |
| 5 | Real team size, seniority, contract length | Fabricio (V-08), Wagner (Q-26) | §6 arithmetic, §7 framing |
| 6 | Andrea's client buckets and problem map | Andrea (Q-47) | Pilot client (V-06), cutover sequencing |
| 7 | Whether the export build implies a delivery pattern already | Wagner (Q-21) | §4, §5 |
| 8 | Rodrigo's independent read of §§2–6 | RZ | All of it — this is one person's opening position |
