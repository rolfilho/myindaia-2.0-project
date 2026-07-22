# DEC-02 — Agent Cognitive Engine — Working Doc

| | |
| --- | --- |
| **Decision** | Agent cognitive engine — orchestration alternatives + build roadmap |
| **Owner** | RZ. RL cross-checks independently (this doc is RL's cross-check). |
| **Method** | Analytical (Anexo I §1.3 restricts empirical work to OCR). |
| **Status** | Open → **Analysis** |
| **Feeds** | D-a2 · interacts with DEC-01, DEC-03, DEC-04, DEC-06, DEC-07 |
| **Deliverable** | A **boundary rule + a build roadmap over time** — *not* a single product pick. |

**What this doc is.** A live working analysis of DEC-02: how the decision decomposes, the current
position on each part, the evidence behind it, how it gets validated, and what is still open. It is
internal (candid, English); a PT-BR register entry is derived from §7 when the position firms up.

---

## Framing caveats (read everything below against these)

1. **The CEO vision's 10 agents are a *reference point*, not the confirmed workload.** This doc is
   not a commitment to build them *ipsis litteris*. The real build set is derived bottom-up: the
   **process map** (the essential processes the legacy system actually runs, from Indaiá's own data)
   **+** the feasible parts of the CEO vision **+** whatever we independently judge necessary. The
   10-agent spec is an important input, not ground truth. This *strengthens* the core position rather
   than weakening it: committing to a heavy engine now would optimise for an unconfirmed workload —
   the register's own warning ("an engine chosen against an unconfirmed agent list optimizes for the
   wrong workload"). **Until the process map exists, this analysis is provisional by construction.**
2. **The `2026-07-20 Architectural Lessons Learned` file is *an* analysis, not a definitive one.**
   It is cited throughout as a strong prior to pressure-test — not as settled fact. Its lean toward
   adopting n8n Business, in particular, is corrected in §5.

*Terminology.* **"Phase 1"** = the first post-Discovery **build** phase (contract *Fase 2*): walking
skeleton + first vertical slices. **Not** the two-week Discovery we are in now.

---

## 1. The decision decomposes into four separable sub-decisions

"Agent cognitive engine" is one register row, but it bundles four independent questions with
different answers, owners, and risk profiles. Most confusion in this space comes from a single
bake-off ("Agno vs LangGraph vs n8n vs pure Python") that conflates them.

| Sub-decision | The real question | Candidate answers |
| --- | --- | --- |
| **A. Cognitive engine** | What runs the *thinking* (extract, classify, compare, generate)? | **Pure Python / FastAPI** vs heavy agent framework as backbone |
| **B. Durability / HITL substrate** | What makes a long-running, human-pausable, resumable workflow survive a restart with a full audit trail? | LangGraph checkpointer · n8n Wait nodes · Temporal · Postgres state-table + worker |
| **C. Plumbing / low-code surface** | What ingests events, routes notifications, and (maybe) lets non-devs edit flows? | n8n · pure Python + FastAPI + scheduler |
| **D. Management & observability** | How do humans *change* behaviour (rules/thresholds/routing) at runtime, and how do we *see / trace / audit* what every agent did? | Change → React admin UI + DB config · Observe → Langfuse/OTel + `agent_audit` |

**A–D do not compete for the same job.** A, B, C map onto the lessons file's **3-Layer Lock-In-Free
Architecture**: A = Layer 1 Domain Core (pure Python); the model call = Layer 2 Model Seam; B and C
= Layer 3 Orchestration. **D is the Day-2 layer** — how the system is managed and watched — and it
lives *mostly outside* the engine choice, so it argues for the pure-Python seam that emits the audit
trail, not for any framework.

The rest of this doc takes A, B, C, D in turn (§3–§6), after establishing the workload they are
chosen against (§2).

---

## 2. Workload reality — what the agents actually are

Every proposed agent characterised against the six capabilities that justify a heavy framework
(unbounded/dynamic control flow · durable execution · async HITL · dynamic multi-agent coordination
· conversational memory · live UI streaming):

| Agent | What it actually is | Dynamic graph? | Durable + HITL? |
| --- | --- | --- | --- |
| 01 Orquestrador | Static routing by process type (IM/EM/ER…) + SLA watch | No (static) | — |
| 02 Ingestão | 1 vision call + validation | No | gate <80% |
| 03 Verificação | 1 comparison call + rules | No | on divergence |
| 04 NCM | 1 classification call + few-shot + tax lookup | No | threshold |
| 05 Compliance | rules + 1 analysis call + Siscomex API | No | LI gate |
| 06 Rastreamento | cron poll every 2h + API calls + DB writes | No | — |
| 07 Emissão | template gen + FTP + **mandatory A3 pause** | No | **yes (HITL)** |
| 08 Comunicação | event → message → multichannel send | No | — |
| **09 Booking** | **8-step flow, external call, 30-min polling up to 24h, retry, timeout, escalation, audit** | No (fixed steps) | **yes (durable + HITL)** |
| 10 Allocation | DB math + projection + alert routing | No | critical alert |

> **Provenance.** These columns are RL's characterisation, read off each agent's
> Trigger/Inputs/Outputs/Impl in `Especificacao_10_Agentes_IA_COMEX_v2.md` and mapped against the
> 6-capability test. It is interpretation, not a column that existed in any source, and it inherits
> caveat #1 (the set is provisional).

**Reading of the table:**

- **Nine of ten are "an LLM call wrapped in deterministic Python and I/O"** — enrichment services and
  scheduled workers. The word "agent" is doing marketing work. **No dynamic-control-flow and no
  multi-agent-swarm workload exists anywhere in the set** — the LLM never decides the graph; the
  process type does.
- Framework weight is earned only by **durable execution** and **async HITL**, which appear in
  exactly two places: **Agent 09** (24h polling + escalation) and **Agent 07** (mandatory A3 pause).
  That is sub-decision **B**, and it is far narrower than "adopt an agent framework."
- **Open design question (not settled here):** the table records that there *are* no dynamic/swarm
  workloads today — the live question is whether there *should* be. Current read: mostly no; the two
  places worth a second look are **Agent 04 (NCM)** — a *bounded* tool-use/self-correction loop could
  help — and **Agent 01 (Orquestrador)** — only becomes genuinely dynamic if it must choose agents by
  document content rather than process type. Neither justifies a swarm framework up front; both are
  addable later behind the pure-Python seam. The process map will clarify this.

---

## 3. Sub-decision A — Cognitive engine → **pure Python / FastAPI**

**Position:** pure Python / FastAPI for the cognitive core is the recommended default. A heavy agent
framework (Agno, or LangGraph used as the backbone) is **rejected** as the primary abstraction.

**Why:**
- The workload (§2) has no capability that a framework uniquely provides. Orchestration here is
  bounded and trivial (sequential steps + bounded retries + static routing); the real value and risk
  live in prompt engineering, spatial PDF pre-processing, Pydantic schema validation, deterministic
  reconciliation math, and the CI eval harness — **none of which a graph engine solves.**
- The deepest lock-in from full-stack frameworks is not the LLM call — it is the framework's control
  flow and state primitives (a `while` retry loop becomes a framework-specific `Loop` type that is
  hard to unit-test in isolation).
- **Prior evidence:** the reference *Credit Card Expenses Analyzer* implementation collapsed Agno
  `Loop`/`Router` constructs into plain `while`/`if` and lost nothing — smaller footprint, no
  lock-in. The gap that evidence does *not* cover is the durable-HITL-booking workload → that is §4.

Agno-vs-LangGraph is nearly a red herring. The real fork is **"heavy framework as backbone"
(reject)** vs **"pure-Python core + a thin durability seam only where needed"** (accept).

---

## 4. Sub-decision B — Durability / HITL substrate → **the one genuinely contested choice**

This is the only part of DEC-02 with real engineering contention, and the only part with empirical
content. It applies to exactly two flows: **Agent 09 (booking)** and **Agent 07 (A3 pause)**.

**Requirement:** a workflow that runs across up to 24h of polling, pauses for human approval, resumes
after a process restart from persisted state, and writes an audit row per step.

**Candidates:**

| Option | Fit | Note |
| --- | --- | --- |
| **Postgres state-table + worker** (pure Python) | Strong default | No new dependency; fully `pytest`-able offline; state is our own schema, the source of truth. |
| **LangGraph** (thin, checkpointed) | Viable | Confine to a checkpointed state graph at Agents 07 & 09 *only* — never the backbone. Justified only if durable-resume proves painful in pure Python. |
| **n8n Wait/Form nodes** | Viable *if* n8n is already adopted for plumbing | n8n's native Wait node "can absorb the durability requirement without LangGraph at all" — so **B and C are coupled**: keeping n8n for C (§5) hands B a candidate substrate; dropping n8n means B needs Postgres-worker or LangGraph. |
| **Temporal** | Overkill for this volume | Note as the escalation path only if durable orchestration grows well beyond these two flows. |

**Related requirement — long-running jobs.** Multimodal OCR can exceed 100s and blow through
reverse-proxy timeouts; the fix is an async **`202 Accepted` + webhook check-in** pattern. This is a
durability requirement shared with OCR ingestion (Agent 02 / DEC-01), and whatever B substrate we
pick must accommodate it.

**Position:** default to **Postgres state-table + worker**; adopt a LangGraph checkpointer only if
the walking skeleton (or the §7 spike) shows pure-Python durable-resume-with-audit is materially
painful. If n8n lands for C, evaluate its Wait node as the substrate before adding anything else.

---

## 5. Sub-decision C — Plumbing / low-code surface (n8n) → **thin, and gated on A6**

**Position:** n8n, if used at all, is a **thin plumbing layer only** (webhook ingestion, notification
routing, async waits) over stateless FastAPI endpoints — **never** the cognitive engine, business
rules, prompts, or thresholds. Whether it is used *at all* in Phase 1 is **open and gated on A6.**

**Two independent justifications, scored separately:**
- **(a) as plumbing:** genuine but *replaceable* — FastAPI + a scheduler + a Postgres job table do
  the same, one fewer system to run and license.
- **(b) as a non-technical-editable surface:** value **only if that persona exists and will actually
  use it** — this is premise **A6**. If the real maintenance model is "two senior Python devs own
  everything" (which CEO Vision §7 implies — *"1 dev sênior cobre os 3 primeiros sprints"*), (b)
  collapses, n8n stands only on the weaker (a), and the simpler/cheaper Phase-1 answer is **no n8n.**

**The change-surface boundary (holds regardless of the A6 answer):**

| Change type | Lives in |
| --- | --- |
| Plumbing & notifications (routes, channels, webhooks) | **n8n canvas** (if adopted) — Tech Ops, with RBAC/Git |
| Behavioural thresholds & rules (confidence cutoffs, NCM auto-approve, carrier fallbacks) | **React admin UI + DB config** (validated `system_config` / `brokerage_rules`) |
| Prompts, schemas, algorithms | **Git repo (FastAPI) + CI eval harness** — never a live canvas or web form |

**On n8n adoption and tier — the lessons file overstates this.** Its claim that "MyINDAIA will likely
adopt the n8n Business Plan" should **not** be inherited as fact (`AGENTS.md` lists the stack under
"under review — do NOT treat as principles"). The defensible, conditional shape is two nested
questions: **(a) whether n8n at all → gated on A6**; **(b) if yes, which tier** → possibly
**Enterprise, not Business**, because OTel log-streaming (which feeds observability, §6) is
Enterprise-only. Also: Git on any n8n tier versions only the *JSON graph*, not Code-Node Python — a
reliability/governance reason to keep logic out of n8n regardless of tier (compounded by Code-Node
runtime limits: task-runner timeouts, `N8N_BLOCK_ENV_ACCESS_IN_NODE`).

---

## 6. Sub-decision D — Management & observability → **outside the engine choice**

**Position:** **self-hosted Langfuse (OTel) + an `agent_audit` table** for observation; **React admin
UI + DB config** for runtime behaviour changes (per the §5 boundary). Both are **decoupled from the
engine choice**, which is the load-bearing point.

**Why it matters to DEC-02:**
- The **auditability non-negotiable** (Tier B: every agent decision auditable —
  input/output/confidence/approver) is satisfied by **Layer 2 + Langfuse + `agent_audit`** — i.e. by
  the pure-Python seam, **not** by the orchestration framework. So compliance does not depend on, and
  does not argue for, any framework. It *reinforces* §3: the audit trail comes from code we own.
- Langfuse is MIT-core, first-class self-hosted → keeps LLM traces (CNPJ, pricing, client routes)
  inside the AWS `sa-east-1` VPC. **Interacts with DEC-03** (residency) and **DEC-04** (RBAC/audit).

---

## 7. How this gets validated (within scope)

**The constraint:** Anexo I §1.3 restricts empirical work to OCR; the register says "resist the urge
to prototype the others." A secret DEC-02 prototype violates that. The register pre-authorises the
escape hatch: *"if a test is essential it has to be raised early as a scope question."*

**The primary validation is already in the plan.** Agent 09 (Booking) is simultaneously (i) the
register's declared **reference workload** for DEC-02 and (ii) the DEC-06 / CEO-Vision **Week-8
walking skeleton** — the first real deliverable of Fase 2. So **DEC-02 needs no separate prototype;
it needs the walking skeleton sequenced first**, which confirms or corrects the §3–§4 position as a
by-product of shipping — empirically, in Fase 2, without touching Discovery scope.

**Optional early read — the spike (low priority, not P1/P2).** If we want a signal before Fase 2, a
**1–2 day internal spike (team learning, not a billed deliverable)** builds *only the hardest
primitive*, three ways: a workflow that calls a **mock INTTRA** ("pending" ×3, then "confirmed"),
polls, escalates on timeout, **survives a process kill and resumes**, and writes one audit row per
step — as **(a)** Postgres-worker, **(b)** LangGraph checkpointer, **(c)** n8n Wait/Webhook. Score:
LOC · framework concepts to learn · **`pytest`-able fully offline?** · audit-trail shape · restart
behaviour. This isolates the only empirically contested part (sub-decision B).

---

## 8. Consolidated position (five-part shape, for the register)

**The question the business asks:** *"When an agent needs to do five things in a row and one of them
fails, who notices, and can our own team fix the flow without calling a vendor?"*

**Options (MECE):** (1) heavy agent framework as backbone (Agno / LangGraph-as-graph); (2)
pure-Python core + thin durability seam only where needed; (3) n8n as full low-code AI solution; (4)
do-nothing / defer.

**Trade-offs:** (1) buys nothing this workload needs and adds lock-in + audit surface; (3) fails the
`pytest`/eval-gate and auditability bars; (4) leaves the Fase-2 walking skeleton without a substrate.
(2) is cheapest, most testable, most auditable, and reversible.

**Recommendation:**
> **A — Cognitive core = pure Python / FastAPI (Layer 1).** **B — Durability = Postgres
> state-machine + worker** by default; a thin LangGraph checkpointer at Agents 07 & 09 *only* if
> durable-resume proves painful. **C — n8n deferred/open in Phase 1, gated on A6**; if adopted, thin
> plumbing only, and re-open Business-vs-Enterprise on observability/RBAC needs. **D — self-hosted
> Langfuse (OTel) + `agent_audit` + React admin config**, which satisfies the auditability
> non-negotiable independent of engine choice. **Validation = the DEC-06 walking skeleton (Agent
> 09)**, optionally de-risked by the §7 spike.

**Confidence:** **High** on A ("no heavy framework as backbone") and on "n8n thin-or-none / audit is
Layer-2 not framework." **Medium** on B (Postgres-worker vs LangGraph vs n8n-Wait) — the walking
skeleton / spike settles it.

**What would change my mind:** A6 returns "Tech Ops genuinely owns and edits flows" (revives n8n (b),
possibly makes its Wait node the natural B substrate) · the confirmed agent set (post process-map)
grows a genuinely dynamic or multi-agent workload the current 10 lack · durable-resume-with-audit
proves painful enough in pure Python that a LangGraph checkpointer clearly pays for itself.

---

## 9. Interactions with other decisions

| Decision | Interaction |
| --- | --- |
| **DEC-01** (OCR) | Vendor *maintainability* is reweighted by the C answer (LlamaCloud ships the only native n8n node). The async `202` long-job pattern (§4) is shared with OCR ingestion. |
| **DEC-03** (DB / residency) | Langfuse self-host + LLM-trace residency ride on the `sa-east-1` decision. |
| **DEC-04** (RBAC / audit) | `agent_audit` + Langfuse are half the audit answer; n8n RBAC (if adopted) is the other half of the change-surface. |
| **DEC-06** (delivery strategy) | Agent 09 walking skeleton *is* DEC-02's validation; the two decisions share their first deliverable. |
| **DEC-07** (legacy bridge) | Agents 01/03/06/09 read `BROKER` via the read-only `pyodbc` bridge; B's state substrate persists to our own Postgres, never the legacy DB. |

---

## 10. Open inputs / next actions

1. **A6 — to Fabricio *and* separately to Wagner:** "do you need workflows maintainable by
   non-technical people?" Answers may differ; the difference is itself informative. **Highest-leverage
   input to DEC-02** (gates all of C, and possibly B).
2. **Process map first (caveat #1):** the confirmed agent/build set is an *output* of the process map,
   not an input. This analysis stays provisional until it exists.
3. **n8n commercial reality:** is any n8n tier already sold to the CEO? If so, harder to unwind — and
   re-open the Business-vs-Enterprise (OTel) question early.
4. **Confirm Agent 09 = the Week-8 walking skeleton** — currently RL's inference from DEC-06, not yet
   stated as fact. If true, §7's "validation is free" argument holds.
5. **Decide** whether to run the §7 spike as an explicit scope note or as internal learning — low
   priority either way.
