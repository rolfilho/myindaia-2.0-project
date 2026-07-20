# 04 — Decision Register

**Updated:** 2026-07-20

This is what Indaiá is actually paying for. Everything in
[03_Task_Board.md](03_Task_Board.md) exists to move a row in this table.

It also becomes the seed of the **decision log** that Anexo I §2.2 requires us to maintain as the
team's source of truth through Fase 2 — so it is written to survive the engagement, not just the
two weeks.

**Lifecycle:** `Open` → `Analysis` → `Recommended` (by us) → `Ratified` (by the client)
**Method:** `Empirical` (tested in practice) · `Analytical` (reasoned, recorded with trade-offs)

Per Anexo I §1.3, **OCR is the only decision tested empirically in this phase.** Everything else is
resolved analytically and recorded in the log. That is a contractual constraint, not a shortcut —
resist the urge to prototype the others.

---

## Tier 1 — contractual (Anexo I §1.1.a)

| ID | Decision | Owner | Method | Status | Feeds |
| --- | --- | --- | --- | --- | --- |
| **DEC-01** | Document extraction / OCR — ready-made API vs. own solution | RL | Empirical | Open | D-a1, D-c |
| **DEC-02** | Agent cognitive engine — orchestration alternatives + build roadmap | RZ | Analytical | Open | D-a2 |
| **DEC-03** | Database infrastructure | RZ | Analytical | Open | D-a3, D-c |
| **DEC-04** | Access control model (RBAC) | RZ | Analytical | Open | D-a4 |
| **DEC-05** | Integration/scraping hosting + digital certificate (A1 vs. A3) | RZ | Analytical | Open | D-a5, D-c |

## Tier 1 — strategic (implied by D-a, and the ones that shape everything else)

| ID | Decision | Owner | Method | Status | Feeds |
| --- | --- | --- | --- | --- | --- |
| **DEC-06** | Delivery strategy — continuous value vs. batch releases; walking skeleton / tracer bullet / vertical slice; strangler fig; export‖import parallelism | **RL + RZ jointly** → CEO ratifies | Analytical | Open | D-a, D-d, D-b3 |
| **DEC-07** | Stage-1 read-only bridge to the legacy BROKER database | RZ | Analytical | Open | D-a, D-b3 |
| **DEC-08** | How far the OCR PoC goes beyond the contractual minimum | RL | — | **Decided 2026-07-20** | D-a1 |
| **DEC-09** | Which metrics we commit to moving in the first 12 weeks | RL → **validated with the CEO** | Analytical | Open | D-d, Fase 2 |

---

## DEC-01 — Document extraction / OCR

**The question the business asks:** *"Can we stop paying analysts to retype invoices, and trust
what comes out?"*

| | |
| --- | --- |
| **Owner** | RL. Rodrigo reviews. |
| **Method** | Empirical — the only one this phase. |
| **Contractual minimum** (Anexo I §1.3) | Select **one** external API provider by high-level analysis. Measure its **accuracy** and **cost** over **one** document type or **one** client. Final provider choice, and the ready-made-vs-build decision, come later — informed by this result. |
| **Blocked on** | T-02 (target selection) → T-03 (document batch with ground truth). |
| **Shortlist** | LlamaParse, Reducto, Extend. Architectural option space catalogued in [IDP/2026-07-20 MECE options for IDP.md](IDP/2026-07-20%20MECE%20options%20for%20IDP.md). |

**Open sub-question — pick by client or by document type?**
Recommendation: **by document type.** A single client spans several document types with different
failure modes, which muddies the accuracy signal; a single document type across several clients
gives layout variance, which is precisely the thing that determines whether a ready-made API
survives contact with production. Invoice or B/L are the natural candidates. Needs Indaiá's
agreement — this is theirs to confirm, and they may have a commercial reason to prefer a specific
client.

**What must be measured:** field-level accuracy against ground truth · calibration of the
confidence score (does low confidence actually predict error?) · cost per page at Indaiá's real
volumes · latency · LGPD data residency posture.

---

## DEC-08 — Scope of the OCR PoC beyond contract minimum

**Status: Decided, 2026-07-20 (internal).**

The PoC will go beyond the contractual minimum: a **live, accessible-online** engine that parses a
document into structured JSON against a predefined schema, emits per-field confidence levels, and
carries a HITL review UI. Plus a high-level comparison of the complexity and cost of achieving the
same outcome via the alternative architectures in the MECE options doc.

**"Live" means reachable and demonstrable. It is a proof of concept and is never production.**
Say this in every client-facing mention of it, without being asked.

**Rationale:** the extra scope buys learning we need for D-c and for Fase 2, and it makes the single
empirical result of the engagement tangible to a CEO rather than a table of percentages. **The
contractual minimum is what must ship.** If the two weeks compress, the extras drop first — the
schema, the accuracy measurement, and the cost model are the floor and are non-negotiable; the UI
and the architecture comparison are the investment.

---

## DEC-02 — Agent cognitive engine

**The question the business asks:** *"When an agent needs to do five things in a row and one of them
fails, who notices, and can our own team fix the flow without calling a vendor?"*

| | |
| --- | --- |
| **Owner** | RZ. Ricardo cross-checks independently. |
| **Inputs on hand** | [2026-07-20 Architectural Lessons Learned — AI Frameworks and n8n Mapping.md](Reference/2026-07-20%20Architectural%20Lessons%20Learned%20—%20AI%20Frameworks%20and%20n8n%20Mapping.md) · [2026-07-14 Architectural Analysis — Agent Evolution and Orchestration Mapping.md](../01_Inputs_and_Resources/My%20Indaia%202.0%20Export%20+%20Import%20v0%20plan/2026-07-14%20Architectural%20Analysis%20—%20Agent%20Evolution%20and%20Orchestration%20Mapping.md) |
| **Inherited position** | `n8n` for low-code B2B/COMEX integration pipelines maintainable by Tech Ops; `LangGraph` reserved for multi-step cognitive agents (ingestion, NCM, compliance, booking, allocation). |

[166 more lines]