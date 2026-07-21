# MyINDAIA Modernization — Session Router

**Last updated:** 2026-07-20

This file is deliberately thin. It carries only what a session needs *before* knowing what it is
working on, and routes to the file that owns each kind of detail. **Statuses are not tracked here** —
they live in the files below and are updated there as work progresses.

---

## Where things live

Be selective of reading the files below to avoid loading too much information into context.


| If you need…                                                       | Go to                                                               | Owns                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | -------------------------------------------- |
| Contractual scope, deliverables, insumos                            | [Anexo I](00_Scope/Anexo_I_Escopo_e_Insumos_Discovery.md)           | Definition of done                           |
| Architecture baseline, binding principles, stakeholders, folder map | [AGENTS.md](AGENTS.md)                                              | Structure & constraints                      |
| Who is doing what, and its status                                   | [03_Task_Board.md](00_Internal_Work/03_Task_Board.md)               | **Task statuses**                            |
| What we're deciding, and where each stands                          | [04_Decision_Register.md](00_Internal_Work/04_Decision_Register.md) | **Decision statuses** |
| CEO pre-read: premises, metrics, trade-offs, access needs           | [05_Kickoff_Brief.md](00_Internal_Work/05_Kickoff_Brief.md)         | CEO alignment                                |
| Deliverables → workstreams → timeline → critical path            | [02_Discovery_Plan.md](00_Internal_Work/02_Discovery_Plan.md)       | Plan                                         |
| How Ricardo and Rodrigo work together                               | [01_Working_Agreement.md](00_Internal_Work/01_Working_Agreement.md) | Governance                                   |
| The delivery-strategy argument (DEC-06), archived                   | [Reference/2026-07-21 Strategy and Delivery Analysis.md](00_Internal_Work/Reference/2026-07-21%20Strategy%20and%20Delivery%20Analysis.md) | Strategy position                            |
| Everything internal, indexed                                        | [00_Internal_Work/README.md](00_Internal_Work/README.md)            | Entry point                                  |

---

## Current state


| Field     | Value                                                                                                                                                                                                               |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Phase** | **P0 — Prep window** (from 2026-07-20, unbilled). Discovery Fase 1 starts the first or second week of August — **target 2 weeks, tolerance up to 4**, since neither Ricardo nor Rodrigo is full-time. Then 60 days accompaniment. |
| **Focus** | Front-loading everything that converts into depth once the billed clock starts: chasing insumos, landing question lists with the client, building the OCR PoC harness, drafting the process map from legacy material. |
| **Team**  | Ricardo Leite — accountable for delivery, owns business/product/OCR. Rodrigo Zayit — co-executor, owns five technical decisions. Delivery strategy and plan reconciliation are **joint**. Split in [01_Working_Agreement.md](00_Internal_Work/01_Working_Agreement.md) §2. |

## The three critical-path dependencies

Everything else can be worked around. Detail and fallbacks in [02_Discovery_Plan.md](00_Internal_Work/02_Discovery_Plan.md) §3.

1. **CP-1 — Export repository access.** ❌ Not received. Gates deliverable (a) and through it the schedule.
2. **CP-2 — Document batch with ground truth.** ❌ Not received. Gates the only empirically tested decision.
3. **CP-3 — CEO alignment session.** Not scheduled. Cannot be worked around — delivery strategy is the CEO's call.
