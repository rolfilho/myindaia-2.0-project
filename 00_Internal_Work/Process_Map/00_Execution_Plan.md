# T-50 — Operational Process Map: Execution Plan

**Status:** Plan, 2026-07-20. Feeds T-50 (Task Board), WS7, D-a. Prerequisite for T-53 (Andrea) and
input to T-54 (write-back boundary).
**Owner:** RL. Mechanical extraction delegated to `agy`.

---

## 1. The finding that shapes this plan

Reconnaissance of `01_Inputs_and_Resources/MyIndaia 1.0/Codebase and Database` produced a better
starting position than assumed. We do not have to *infer* the processes from application behaviour.
**MyINDAIA's process model is stored as data**, in a parametrized workflow engine inside `BROKER`:

| Table | What it actually is |
| --- | --- |
| `TSERVICO` | **The process catalogue.** One row per service Indaiá sells/runs. Carries `CD_VIA_TRANSPORTE` (modal), `CD_EV_INI` / `CD_EV_FIM` (process start and end events), `CD_EVENTO_CONCLUSOR`, `NR_DIAS_CONCLUSAO` (target cycle time), `CD_GRUPO`, `IN_FOLLOWUP` |
| `TSERVICO_EVENTO` | **The process flow.** Steps of each service, ordered by `NR_ORDEM`, each with an SLA expressed *relative to a base event* (`CD_EV_BASICO`, `PZ_DO_EV_BASICO`) and a forward dependency (`CD_EV_FUTURO`, `PZ_ATE_EV_FUTURO`), plus business-day/holiday rules (`IN_PRAZO_UTIL`, `IN_PRAZO_FERIADO`) |
| `TEVENTO` | **The activity dictionary.** ~event codes with names in PT/EN/ES, `CD_RESPONSAVEL` (**who does what**), `CD_ETAPA` (which macro-stage it rolls up to), `CD_PREST_SERV` (external party), inspection deadlines |
| `TETAPA` | **The macro-stage layer**, keyed by `CD_UNID_NEG` **×** `CD_PRODUTO` — i.e. stages differ by business unit and by vertical. Also `IN_ETAPA_AUTOMATICA`, `IN_RETRABALHO` (rework flag) |
| `TCLIENTE_SERVICO` | **The client × process matrix.** Which client, in which business unit, for which product, runs which service — with commercial parameters attached |
| `TUNID_NEG`, `TUNID_NEG_PRODUTO`, `TPRODUTO`, `TSETOR`, `TCARGO` | The organisational and vertical axes, and the role table `CD_RESPONSAVEL` resolves against |
| `TFOLLOWUP`, `TFOLLOWUP_ETAPA` | **The execution log.** What actually happened, per process, per event, with timestamps and user — i.e. the empirical check on whether the parametrized process is the real process |
| `TEVENTO_AUTOMATICO`, `TETAPA_AUTOMATICA_ORDENA`, `TR_FOLLOWUP` trigger, `TFOLLOWUP_IGNORE_TRIGGERS` | **The automation and exception layer.** Which steps fire automatically, which client groups get bespoke chaining (Nestlé `CD_GRUPO='155'`, Croda `CD_EMPRESA IN ('03185','00500')`), and the documented bypass |

This is not a reconstruction exercise. It is a **decode-and-render** exercise, and that is a
materially cheaper and more defensible thing to take to the client.

### The gap, stated precisely

We have the **schema** of all of the above (`myindaia-database/csv/Schema_Completo_BROKER.csv`,
clean CSV with headers) and the **T-SQL** (procedures, triggers, views). We have **almost none of the
reference rows**. The only data dumps present are 200-row samples of `TCLIENTE_SERVICO`,
`TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO`, `TFOLLOWUP_ETAPA`, `TDECLARACAO_IMPORTACAO` — headerless,
semicolon-delimited, and not a statistical sample of anything.

So today we can state the **shape** of every process but not **name a single one**. Closing that gap
is one `SELECT *` over ~12 small parametrization tables. See §6 — it is the highest
value-per-effort request in the entire insumo list, and it currently appears nowhere in
[A2_Client_Information_Request_v2.md](../../01_Inputs_and_Resources/A2_Client_Information_Request_v2.md).

---

## 2. The MECE spine

Processes will be decomposed on the axes the legacy system itself uses. Using Indaiá's own
dimensions is what makes the result MECE *and* recognisable to them — a taxonomy we invent would be
neither.

```
Unidade de Negócio (CD_UNID_NEG)
  └── Produto / vertical (CD_PRODUTO)          ← Import / Export / Inland (TM) / …
        └── Serviço (CD_SERVICO)               ← the macro-process, MECE at this level
              └── Etapa (CD_ETAPA)             ← macro-stage, 5–9 per service
                    └── Evento (CD_EVENTO)     ← the activity: input, output, owner, SLA
```

Two axes cut across and are handled as **overlays, not as branches** (this is what keeps the tree
mutually exclusive):

- **Client overlay** — `TCLIENTE_SERVICO` + the 11 B2B integration modules + the hardcoded
  client-group rules in `TR_FOLLOWUP`. A per-client *variant sheet* against a base process, never a
  parallel process tree.
- **Modal / regime overlay** — `CD_VIA_TRANSPORTE`, `CD_MODAL`, DUIMP vs. DI, drawback/isenção,
  admissão temporária (`IN_ADM_TEMP`). Also a variant sheet.

**MECE test applied at each level:** every `TEVENTO` row must resolve to exactly one `TETAPA`; every
`TSERVICO_EVENTO` row to exactly one `TSERVICO`; every active client-service pair to exactly one
`(unidade, produto, serviço)`. Rows that fail these are not tidied away — they are the **findings**,
and they populate deliverable B.

---

## 3. Evidence tiers

Everything asserted in the output gets tagged with its tier. This is what lets us hand the client a
draft to correct rather than a fiction to accept.

| Tier | Source | Confidence |
| --- | --- | --- |
| **E1 — Parametrized** | `TSERVICO*`, `TEVENTO`, `TETAPA` definitions | Design intent. High confidence on structure |
| **E2 — Executed** | `TFOLLOWUP` / `TFOLLOWUP_ETAPA` frequency: which events actually fire, in what order, how often | Reality. Beats E1 wherever they disagree — and the disagreement is itself a finding |
| **E3 — Coded** | Delphi modules, stored procedures, triggers: rules not expressible in parametrization | High confidence, but describes automated paths only |
| **E4 — Inferred** | Our reading between the above | Explicitly flagged. Everything at E4 becomes a client question |
| **E0 — Absent** | Anything happening in email, WhatsApp, spreadsheets, or a person's head | Structurally invisible here. Sized in §6, not guessed at |

**The E0 boundary is the honest limit of this exercise and must be stated to the client in those
terms.** The legacy system shows us every step someone bothered to record in it. It shows us nothing
about the manual handoffs between those steps — which, on the evidence of Anexo I §C, is where the
operational pain lives.

---

## 4. Execution — five waves

`agy` is used for waves 1–3 (mechanical extraction: deterministic, high-volume, verifiable). Waves
4–5 are synthesis and judgment and stay with RL. Master switch is on (`~/.claude/agy-enabled`).

Working directory for all output: `00_Internal_Work/Process_Map/`.

### Wave 1 — Decode the workflow schema → `agy`
**Input:** `myindaia-database/csv/Schema_Completo_BROKER.csv`, `relacionamento_tabelas_BROKER.csv`,
`views_BROKER.csv`.
**Output:** `W1_workflow_schema_inventory.md` — for each of the ~40 workflow/parametrization tables
identified in §1 plus their FK neighbours: full column list with types and nullability, PK, inbound
and outbound FKs, and every view that reads it. One section per table.
**Why agy:** pure extraction over a clean 15k-row CSV. No judgment.

### Wave 2 — Extract the coded rules → `agy`
**Input:** `store_procedures_BROKER.csv` (6.3 MB), `triggers_BROKER.csv`, `procedures_*.csv` for
`MYINDAIAV2`, `TM`, `MYINDAIA`.
**Output:** `W2_coded_rules.md` — every routine that reads or writes `TFOLLOWUP*`, `TSERVICO*`,
`TEVENTO*`, `TETAPA*`, `TPROCESSO*`, listed with: name, tables touched, direction (R/W), and a
one-line statement of the rule it enforces. Special section for hardcoded literals: event codes,
`CD_GRUPO`, `CD_EMPRESA`, country codes, day counts — **these are the exceptions, and exceptions are
half of what the client needs to confirm.**
**Why agy:** grep-and-summarise at volume. The judgment call (which rules matter) happens in Wave 4.

### Wave 3 — Codebase process participation + data-sample rehydration → `agy`
**Input:** `myindaia-codebase/` (739 MB, 48 modules) — **grep-driven only, no full reads**; the
Report already classifies the modules, so this wave only adds process linkage. Plus the six
headerless CSV dumps.
**Output:**
- `W3_module_process_map.md` — per module: which process step it automates, which government or
  client system it talks to, which tables it writes, whether it is scheduled/triggered/manual.
  Seeded from `Report/01_system_topology.md`, `04_deep_dive_remaining_23.md`,
  `06_deep_dive_first_25.md` — do not re-derive what the Report already establishes.
- `W3_samples_rehydrated/` — the six sample dumps re-emitted **with column headers** joined from
  `Schema_Completo_BROKER.csv`. Currently they are unreadable without this. Cheap, and it unlocks
  Wave 4's empirical check.
**Why agy:** mechanical, and the 739 MB tree is exactly the kind of scan we do not want in our own
context window.

### Wave 4 — Synthesis into the MECE map → RL
Assemble waves 1–3 into **deliverable A** (§5). Includes:
- Frequency analysis over the rehydrated `TFOLLOWUP` / `TFOLLOWUP_ETAPA` samples: which events
  actually fire, in which order, with what gaps → the E2 check against E1. *Caveat honestly: 200
  rows is indicative, not conclusive. It tells us whether the parametrized process is broadly real;
  it does not measure cycle time.*
- Run the three MECE tests from §2 and record every violation.
- Mermaid rendering (`flowchart` per macro-process; `sequenceDiagram` where a handoff between
  Indaiá / client / government / carrier is the point).

### Wave 5 — Gap register and client instrument → RL
Produce **deliverable B** (§6). Every E4 inference, every MECE violation, and every E0 blind spot
becomes a numbered, addressed question. Merge into
[A2_Client_Information_Request_v2.md](../../01_Inputs_and_Resources/A2_Client_Information_Request_v2.md)
and [05_Open_Questions.md](../05_Open_Questions.md).

### How waves 1–3 were actually executed — and what the delegation cost

> **Historical note, retained deliberately.** The plan above assumed the mechanical waves would be
> delegated to `agy`. That is not how it went, and the record is worth more than the original
> instructions, which have been deleted.

**Outcome: five of seven `agy` runs produced nothing.** Failure modes, in order encountered: a
headless `mcp` permission that cannot be prompted for and is auto-denied; a wrong diagnosis by RL
(a missing generic `command(python3)` rule) which led to a global config change that was made and
then reverted; agy's 5-minute `--print-timeout` killing a run mid-flight; and a run terminating with
an error after covering only 36 of 48 modules. Only `W2_coded_rules.md` and those 36 modules came
from agy.

Everything else — W1, the W2 matrix, the sample rehydration, and the remaining 12 modules — was
produced directly in Python and grep, in a handful of commands. The recipe is preserved in
[scripts/rebuild.py](scripts/rebuild.py) and reproduces every published figure exactly.

**The lesson, which generalises past this task: delegate reading-for-intent, never counting.**
Counting columns, matching literals and checking field widths have a *correct answer*; a
deterministic script gets it right, is faster to write than a prompt, and can be re-run. Judgment
about what a 20-year-old stored procedure is *for* is the only part where an agent adds anything.

**And even there, verify rather than accept.** agy's evidence proved sound (98/98 routine names and
332/332 SQL quotes confirmed present in source; 42/42 cited file paths resolve) while its confidence
did not: `PURPOSE UNCLEAR` and `NOT DETERMINED` appear **zero** times across 98 routines and 36
modules, though both were explicitly invited. Sampling later showed the "Business Rule(s)" bullets
to be mechanical paraphrase rather than insight. A plausible fabricated business rule presented to
Indaiá as "what your system does" remains the single worst failure mode of this exercise — the
verification step is not optional.

---

## 5. Deliverable A — the process map

`00_Internal_Work/Process_Map/A_Process_Map.md`, one file per macro-process under
`Process_Map/processes/`.

**Per macro-process, a fixed schema** (this is what makes it usable as a correction instrument):

| Field | Content |
| --- | --- |
| ID / name | `CD_SERVICO` + `NM_SERVICO`, verbatim from the legacy |
| Position in the MECE tree | Unidade → Produto → Serviço |
| Trigger | The event or external signal that starts it (`CD_EV_INI`) |
| Inputs | Documents, data, systems — with source party |
| Outputs | Documents, data, filings, notifications — with destination party |
| Stages | `TETAPA` sequence |
| Steps | Ordered `TSERVICO_EVENTO`: activity, owner role, SLA, automated vs. manual, system used |
| Business rules | From parametrization and from code (E1/E3) |
| Exceptions & variants | Per client, per modal, per regime |
| Handoffs | Every point where the process leaves Indaiá (client, government, carrier, terminal) |
| Cycle time | `NR_DIAS_CONCLUSAO` target vs. observed in `TFOLLOWUP` sample |
| Evidence tier | Per assertion |
| Open questions | Numbered, cross-referenced to deliverable B |

Plus, at the top level: the MECE tree itself, a cross-process handoff diagram, the client × process
matrix, and the automation coverage map (which steps a machine already does — **the direct input to
the CEO's agent layer and to T-54's write-back boundary**).

**Mermaid is the rendering, not the artifact.** The structured fields above are the source of truth;
diagrams are generated from them. Diagrams that cannot be traced back to a field are decoration.

---

## 6. Deliverable B — what we need from Indaiá

`00_Internal_Work/Process_Map/B_Information_Gaps.md`, then merged into A2 (PT-BR) for sending.

Four categories, in descending value-per-effort:

### B1 — The parametrization dump ⭐ *do this first, it is nearly free for them*
A plain `SELECT *` export of the reference tables. Small, non-transactional, low sensitivity —
this is configuration, not customer data. Without it we have shape and no names; with it,
deliverable A goes from a template to a populated map.

> `TSERVICO`, `TSERVICO_EVENTO`, `TEVENTO`, `TETAPA`, `TETAPA_PRODUTO`, `TEVENTO_AUTOMATICO`,
> `TPRODUTO`, `TUNID_NEG`, `TUNID_NEG_PRODUTO`, `TSETOR`, `TCARGO`, `TSERVICO_CLASSIFICACAO`,
> and the full (not sampled) `TCLIENTE_SERVICO`.

Ask Leandro; it is a DBA task of minutes and does not depend on the BROKER access negotiation
(T-06). **This request does not currently exist in A2 and should be added immediately.**

### B2 — Volumetrics for prioritisation
Process counts per serviço / produto / client over the last 12 months, and a distribution of cycle
times. Turns a flat MECE map into a **prioritised** one, and directly serves DEC-01 (OCR PoC target)
and V-06 (pilot client). A `GROUP BY` over `TPROCESSO` / `TPROCESSO_EXP` — again cheap for them.

### B3 — The E0 layer: what the system never sees
Only people can answer these. Andrea (T-53) is the right respondent, Wagner second.
- Between which recorded events does manual work actually happen, and what is it?
- Which steps are recorded *after the fact*, so the timestamp is bookkeeping rather than reality?
- Which processes routinely run outside the system entirely?
- Where does rework originate? (`TETAPA.IN_RETRABALHO` exists — someone modelled rework deliberately,
  which means it was frequent enough to model.)
- Which of the parametrized services are actually dead? Legacy tables carry `IN_ATIVO`, but an
  active flag on a service nobody has sold in four years is not a live process.

### B4 — Confirmation and correction of the draft
The map itself, walked through with operations. Per macro-process: is this real, is anything missing,
is anything obsolete, and who genuinely owns each step (`CD_RESPONSAVEL` records a role, not a
practice). **Framing matters and is the point of doing waves 1–4 before asking:** we arrive with a
draft to correct, not a blank form to fill. Per T-50, that converts a slow client request into a fast
one, and it is also the single best credibility artifact we can put in front of the CEO in W1.

---

## 7. Sequencing and effort

| Wave | Owner | Effort | Depends on |
| --- | --- | --- | --- |
| W1 schema decode | agy | ~30 min wall | — |
| W2 coded rules | agy | ~1–2 h wall | — (parallel with W1) |
| W3 modules + rehydration | agy | ~1–2 h wall | — (parallel) |
| Review of agy output | RL | ~1 h | W1–W3 |
| W4 synthesis + mermaid | RL | ~1 day | W1–W3 reviewed |
| W5 gap register | RL | ~2 h | W4 |
| **B1 request sent** | RL | 15 min | **nothing — send now, in parallel with W1** |

B1 is on the critical path for a *complete* deliverable A but not for starting it. Send it today;
the waves run regardless, and the dump slots into the structure when it arrives.

## 8. Risks

| Risk | Mitigation |
| --- | --- |
| **agy fabricates a business rule** that reads as authoritative | Mandatory source spot-check (§4). Every rule in the output carries its source file and routine name; unsourced rules are deleted, not softened |
| B1 never arrives → map has structure but no content | Deliverable A ships as a populated *template* with named gaps. Degraded but still a correction instrument. Escalate with B1's cost framing: it is minutes of DBA time |
| 200-row samples mislead on frequency | Every E2 claim carries the sample caveat explicitly. No cycle-time claims from the samples |
| Legacy encodes the process **as it was configured**, not as it is run | This is precisely what B3/B4 exist to catch, and why the E0 boundary is stated to the client up front rather than discovered later |
| Scope creep into a full BPMN exercise | The contract does not buy process mapping (Anexo I lists client-side validation only). This map exists to make D-a designable and to sharpen the insumo list. It stops at the level of detail that serves those two ends |
