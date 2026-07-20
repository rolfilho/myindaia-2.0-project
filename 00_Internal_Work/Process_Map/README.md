# Process_Map — T-50 working folder

**Purpose:** derive Indaiá's operational process map from the legacy system, so we arrive at
Discovery with **a draft for the client to correct** rather than a blank form for them to fill.

**Status (2026-07-20):** waves 1–3 complete. Wave 4 (synthesis) is **blocked** — see §3.

Start with [00_Execution_Plan.md](00_Execution_Plan.md), then
[HOW_WE_GET_TO_FLOWCHARTS.md](HOW_WE_GET_TO_FLOWCHARTS.md).

---

## 1. Read in this order

| # | File | What it is |
| --- | --- | --- |
| 1 | [00_Execution_Plan.md](00_Execution_Plan.md) | The plan: MECE spine, evidence tiers, five waves, deliverables A and B |
| 2 | [HOW_WE_GET_TO_FLOWCHARTS.md](HOW_WE_GET_TO_FLOWCHARTS.md) | **How the technical extraction becomes a readable diagram** — and precisely what is missing. Read this before asking why there is no flowchart yet |
| 3 | [W1_workflow_schema_inventory.md](W1_workflow_schema_inventory.md) | The 40-table workflow engine: columns, keys, views, and the column-name concordance |
| 4 | [W2_coded_rules_matrix.md](W2_coded_rules_matrix.md) | 528 in-scope routines → tables touched, 98 writers, and the hardcoded-literal inventory |
| 5 | [W2_coded_rules.md](W2_coded_rules.md) | Business meaning of the 98 writer routines + full `TR_FOLLOWUP` decomposition |
| 6 | [W3_module_process_map.md](W3_module_process_map.md) + [part 2](W3_module_process_map_part2.md) | All 48 code modules → which process step each performs |
| 7 | [W3_rehydration_notes.md](W3_rehydration_notes.md) | Per-column frequency profiles of the six data samples |

---

## 1b. Folder anatomy — what lives where, and why

```
Process_Map/
├── README.md                     ← this file: index, trust levels, blockers
├── 00_Execution_Plan.md          ← the plan + the record of how it was actually executed
├── HOW_WE_GET_TO_FLOWCHARTS.md   ← derivation path from extraction → diagram
├── W1_… W2_… W3_… (7 files)      ← the wave outputs (see §1)
├── W3_samples_rehydrated/        ← derived data — regenerable
└── scripts/                      ← the recipe — regenerates the above
```

### `W3_samples_rehydrated/` — derived data

Six CSVs, ~1.7 MB. The legacy sample dumps re-emitted **with their column headers restored**, joined
positionally from `Schema_Completo_BROKER.csv`.

**Why it exists:** the source dumps in `myindaia-*-csv/` are headerless and semicolon-delimited.
`TPROCESSO` has **316 columns** — without headers the data is not merely inconvenient, it is
unreadable. This folder is the only usable form.

**Contents are unmodified:** padding, `NULL` literals and date formats are preserved exactly as
exported, so these remain faithful to source and can be diffed against a fresh export.

**Safety property worth knowing:** the rehydration refuses to write a file whose field count
disagrees with the schema. An off-by-one positional mapping would silently mislabel every column and
corrupt every conclusion drawn from it, so a mismatch fails loudly instead. All six pass, verified
independently three times — including against `tabela_grande.csv`, which turned out to be the same
`TFOLLOWUP_ETAPA` data *with* headers and confirmed the column order externally.

**Regenerable:** `python3 scripts/rebuild.py rehydrate`. Safe to delete if the folder needs slimming.

### `scripts/` — the reproducibility recipe

`rebuild.py` regenerates the deterministic artifacts from the legacy dumps: the W1 table set, the W2
routine/literal counts, and the rehydrated samples. No LLM involved — every output is a direct read
of the source CSVs.

**Why it exists:** these outputs were originally produced with throwaway one-off scripts, leaving no
way to answer "how was the 147-event-code figure derived?" or to re-run anything. It reproduces every
published figure exactly (1,204 tables · 80 FKs · 40-table set · 528 in-scope routines ·
147/34/19 literals · 6/6 rehydrations PASS), which doubles as a regression check on this README.

**When it matters most:** when the **A2 item-H** parametrization dump arrives. At that point the
whole analysis gets re-run against real reference data, and this is what makes that a command rather
than a reconstruction.

> **Deleted deliberately:** `_agy_plans/` held the instruction files for the delegated `agy` runs.
> Removed 2026-07-20 — the delegation route is closed and the outcome that mattered is recorded in
> [00_Execution_Plan.md](00_Execution_Plan.md) §"How waves 1–3 were actually executed".

---

## 2. Trust levels — read before quoting any of this

Not all of these files are equally reliable, and the difference is not visible from the filename.

| Source | Trust | Why |
| --- | --- | --- |
| W1, W2 matrix, W3 rehydration, W3 part 2 | **High** | Produced deterministically (Python/grep) or written by RL directly. Counting has a right answer |
| `W2_coded_rules.md` — *metadata tables* | **High** | Tables read/written, parameters, call graphs — verified: 98/98 routines and 332/332 SQL quotes confirmed present in source |
| `W2_coded_rules.md` — *`TR_FOLLOWUP` section* | **High** | Independently spot-checked; substantive and accurate |
| `W2_coded_rules.md` — *"Business Rule(s)" bullets* | **Low** | Mechanical paraphrase of adjacent code, not business insight. See the sampling verdict at the end of that file |
| `W3_module_process_map.md` (modules 1–36) | **Medium** | All 42 cited file paths resolve, but characterisations are a draft for human correction |

**The systemic caveat:** the delegated files contain `PURPOSE UNCLEAR` / `NOT DETERMINED` exactly
**zero** times across 98 routines and 36 modules, though both were explicitly invited. The evidence
underneath is real; the confidence layered on top is not earned. Treat conclusions as drafts.

---

## 3. What blocks Wave 4

**Sequence.** A flowchart needs the order of steps; a swimlane needs the order plus the role per
step. Both live in `TSERVICO_EVENTO` / `TEVENTO`, whose rows we do not have — this is **item H** of
[A2](../../01_Inputs_and_Resources/A2_Client_Information_Request_v2.md).

The empirical route was tested and is closed: the `TFOLLOWUP` sample holds 200 rows across 200
*distinct* processes, one event each, so no sequence can be recovered from it. Hence **item H2**
(full follow-up history for ~20 real processes).

What is **not** blocked, and can be built now: the MECE frame (derived from the `NR_PROCESSO`
encoding), the automation overlay, and the exception overlay.

---

## 4. Findings that outlived the exercise

Recorded here because they matter beyond the process map:

- **Machine write-back to `TFOLLOWUP` is already routine.** `robodue` inserts event rows while
  driving the Portal Único DU-E API; all three `parametrizacao*` modules update it. This weakens the
  v0 plan's central objection to bidirectional sync → feeds **T-54**, **DEC-06**.
- **Two generations of the service model run side by side** — `SP_ATUALIZA_FOLLOWUP` forks on
  `FN_PROCESSO_SERVICO_NOVO` and routes legacy processes to a different procedure entirely.
- **80 declared foreign keys for 1,204 tables.** Relational integrity is conventional, not enforced.
- **147 event codes are hardcoded in T-SQL**, so the workflow engine is parametrized *and*
  substantially bypassed. A new system cannot be purely data-driven on this evidence.
- **Siscomex integration is mostly browser automation**, not APIs — the most brittle class in the
  estate, on the critical path of both verticals.
