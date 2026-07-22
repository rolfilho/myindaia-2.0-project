# 05 — Kickoff Brief (CEO alignment session)

**Status:** Internal English master, updated 2026-07-21. The version sent to Fabricio is rewritten in
PT-BR and reviewed by Ricardo first. This is the pre-read.

**Purpose.** Send this ahead of the kickoff so the session is a discussion of decisions and trade-offs
over pre-absorbed context, not a briefing from a blank page. It is deliberately concise. We ask
Fabricio to read four things: the premises we are building on (§1), the goals we propose to prioritize
together (§2), the delivery approach we recommend (§3), and the access and sessions we need to get
moving (§4–§5).

---

## 1. Premises we are building on — confirm or correct

Phrased as statements, not open questions. If any is wrong, that correction is worth more than an hour
of open discussion.

**Givens — our understanding of your non-negotiables. Correct us only if we have them wrong:**

- No customs act is ever automatic. DUIMP and DU-E always require human review plus a certificate for
  the customs act itself. Automation goes *up to* the signature, never through it. *Implication we are
  designing around: the human-in-the-loop review experience has to be genuinely good — it is the step
  every automated flow passes through.*
- Every agent decision is auditable — input, output, confidence, approver.
- Migration proceeds in a deliberate, logical sequence, always with a rollback path. The unit is a
  **group of clients and/or a group of processes** — not strictly one client at a time — and the
  legacy system stays live for a given block only **as long as that block genuinely needs it**
  (decommission by readiness, not by calendar date).

**Premises we need you to confirm — each one moves our schedule or cost:**


| # | Statement to confirm                                                                                                                                                                                                             | Why it matters                                                                                                                                              |
| - | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1 | Indaiá operates 100% on DUIMP. Legacy DI is out of scope and stays a read-only archive.                                                                                                                                         | The single biggest scope boundary in the project. If it moves, schedule and cost move with it.                                                              |
| 2 | The team we plan against is Wagner's internal team plus**two external contract developers.**                                                                                                                                     | Every estimate depends on it. We need seniority, contract length, and realistic capacity.                                                                   |
| 3 | **We sequence Export first, then Import — not both in parallel.** With the team we actually have, running both verticals at once halves throughput on each and leaves two half-finished things when the first milestone is due. | Sets the shape of the first sprints. Export is already underway and is the first to cut over.                                                               |
| 4 | The OCR proof of concept runs on**one document type across several clients** (invoice or B/L are the natural candidates).                                                                                                        | Layout variance is what stresses a ready-made API. We need you to confirm**which** type — unless there is a commercial reason to prefer a specific client. |
| 5 | After go-live, the system is **owned and maintained in-house by at least one capable full-time developer** — not solely the two Discovery-phase contract developers, and not only operations staff. | Sets two things at once: the **orchestration split** (low-code n8n vs code-first LangGraph — DEC-02) and how heavily we weight a vendor's **ease of maintenance** in the OCR choice (DEC-01). Either answer is workable — we just design differently. Note that a capable in-house developer does **not** rule out low-code: n8n still lets non-technical staff adjust workflow parameters without pulling in a developer. |

---

## 2. Goals to prioritize together — "choose 3"

The Roadmap v4 you shared already lays out the client-visible outcomes and how they would be measured.
Rather than us proposing priorities top-down, we would like **you to pick the roughly three outcomes
most worth delivering first** — and to add or swap freely during the conversation.

Our one suggestion, to react to: **proactive client notification as the number-one priority** — a
client told about something before they had to call and ask. It is the cheapest visible win and maps
directly to the outcome you have named the north star. Beyond that we would rather hear your
priorities than pre-commit to a list or a delivery order.

**List of goal from Roadmap v4:**


| Semana    | O cliente passa a...                                                     |
| --------- | ------------------------------------------------------------------------ |
| A definir | receber push quando o navio chega, sem ter ligado pedindo                |
| A definir | ter o booking de exportação confirmado sem o analista entrar no INTTRA |
| A definir | ter NCM de produto novo classificado em 1 minuto                         |
| A definir | fazer upload de Invoice e ver os campos preenchidos sozinhos             |
| A definir | acessar timeline visual e perguntar em linguagem natural                 |
| A definir | (gestor) ver compliance MQC por armador em tempo real, sem Excel         |
| A definir | ter DUIMP transmitida com preenchimento assistido por IA                 |

---

## 3. The delivery approach we recommend

The unit of delivery is a **complete "done" block** — a slice that, once shipped, is 100%
complete for that slice and, where it is a migration, no longer depends on the legacy system. Blocks
are planned so they don't overlap and together cover the scope, so "done" always means the same thing
and progress is never half-finished. Examples of a block: a client group's export operations fully off
the legacy system; a complete slice of the client-notification capability; the security-remediation
block closed.

We deliver value **continuously**, but we do not force something into production every single week: we
work sequentially on blocks that are genuinely done. **Adding capability on top of the existing system
is continuous** (every block adds behavior without removing any); **replacing the core is batched per
block, always with rollback** (each cutover is a risk event).

---

## 4. Access and logistics — what we need to keep the critical path moving

Three dependencies gate the deliverables; each is on the client side.


| Need                                                                                                  | For                                                                                   | Owner at Indaiá    |
| ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------- |
| Read access to the**export repository**                                                               | The whole technical plan — we can't reconcile against a build we can't see           | Wagner / you        |
| **Document batch with ground truth** (already-keyed data ideal) + monthly document volumes by type    | The one empirically tested decision (OCR)                                             | Wagner / Operations |
| Read-only access to the legacy**BROKER** database + confirmation the `sa`/`123` credential is rotated | The legacy bridge and the notification milestone                                      | Leandro             |
| Current**IT infrastructure run-rate** (what Indaiá spends today)                                     | The baseline for the OpEx model — a new number in isolation means nothing without it | You / Finance       |

**One light heads-up, not a dependency: INTTRA API access.** Does Indaiá already have an INTTRA
Company ID, and who is the e2open account contact? Access itself is standard (OAuth2, ~1–3 weeks per
their onboarding), so this is a logistics question, not a schedule risk. We only want to confirm the
path exists and time the actual provisioning to when booking is genuinely next in the sequence —
rather than chasing credentials months ahead of use.

---

## 5. Deliverables, sessions, and timeline

**Deliverables — what Discovery produces:**

- One reconciled technical plan (architecture, stack, infrastructure, risks) with recommendations on
  the pending technical decisions.
- An initial risk register, a legacy security / LGPD remediation plan, and a shadow-mode cutover
  design for Export.
- An IT operating-cost (OpEx) model and an estimated development schedule.

**Live sessions to schedule (with the prep each needs):**


| Session                    | Who                          | Prep before it                                                            |
| -------------------------- | ---------------------------- | ------------------------------------------------------------------------- |
| CEO alignment              | Fabricio + Ricardo (Rodrigo) | This brief, read ahead                                                    |
| Code walkthrough           | Wagner + Ricardo + Rodrigo   | Export-repo read access ideally granted first; seed question list ready   |
| Legacy database session    | Leandro + Rodrigo            | BROKER access prerequisites cleared; stored-procedure question list ready |
| Decision sessions (week 2) | Client + Ricardo             | Our recommendations drafted and cross-checked                             |

**High-level timeline:**

- **Prep window** (unbilled, ~3 weeks): align internally, chase the insumos above, build the OCR
  harness, pre-read all existing material. The more we answer here, the deeper the billed weeks go.
- **Discovery week 1:** CEO alignment · code walkthrough · OCR executed on real documents ·
  architecture deep-dives in parallel.
- **Discovery week 2:** guided decision sessions · convergence · deliverables written.
  *(Target two weeks, tolerance up to four for client-side slippage — not a wider scope.)*
- **Fase 2:** 60 days of advisory (~4h/week) after Discovery closes.
