# Vendor research — LlamaExtract, Reducto, Extend

**For:** DEC-01 / D-a1 — select the **one** IDP vendor to validate empirically (T-13).
**Companion to:** [00 — OCR PoC plan (D-a1).md](https://github.com/rolfilho/myindaia-2.0-project/blob/main/00_Internal_Work/IDP/00%20%E2%80%94%20OCR%20PoC%20plan%20%28D-a1%29.md) §7 (selection criteria).
**Method:** desk research from each vendor's public docs, fetched via the tinyfish MCP and delegated to
three Sonnet agents (one per vendor), 2026-07-21. No sign-ups, no API calls. Pricing/residency claims
spot-checked by RL against the live pages. **All accuracy numbers are vendor-reported unless noted.**

---

## Bottom line up front

1. **None of the three offers a Brazil / South America hosting region.** SaaS processing is US and/or
   EU only (Reducto: US default, EU/AU on Growth+; LlamaCloud: US `us-east-1` + EU `eu-central-1`;
   Extend: us1/us2 + EU Frankfurt). **None names LGPD or Brazil** anywhere in its trust docs — only
   GDPR/HIPAA/SOC 2. Keeping data physically in Brazil requires each vendor's **self-hosted / VPC /
   BYOC** tier (Enterprise contracting, weeks of setup), which none documents as tested for a Brazilian
   region. **This makes the client's residency constraint (DEC-03 blocker / BASF·Nestlé·Pirelli) the
   gating question — it must be answered before the vendor choice, not after.** See §Decision gate.

2. **If offshore-EU processing is acceptable** (with a DPA + zero-retention), the choice comes down to four
   axes — **logistics-document fit, confidence maturity, all-in cost, and buildability given Indaiá's team** —
   with the **provisional lean Extend**. The ranking is narrower than it first looks: all three return
   per-field bounding-box citations, so we can build our own MyINDAIA review UI on any of them, which demotes
   Extend's native Review Agent from a moat to a *PoC convenience*. Extend's remaining genuine leads are
   **logistics/BOL fit** and the **only self-serve correction-feedback loop**. **Reducto** is the runner-up
   (most mature confidence + published price card + best on-prem). **LlamaCloud** is third *on capability* —
   but it is **materially the cheapest per page** and ships the **only native n8n node**. Two decisions taken
   *outside this doc* can lift it: the project's **n8n-vs-LangGraph orchestration choice** (if n8n, its native
   node is a real integration edge) and **Indaiá's post-implementation engineering capacity** (a CEO question —
   a low-code / non-senior team reweights DX and cost upward). And whether the cheaper page-rate even matters is
   itself open: it turns on the **absolute $ delta at real volume (Q-w6)** and on whether LlamaCloud's beta
   confidence keeps review load low enough not to erase the saving (§Cost).

---

## Comparison across the §7 criteria

| Criterion | **Extend** | **Reducto** | **LlamaCloud (LlamaExtract)** |
| --- | --- | --- | --- |
| **Approach** | Parse→LLM, in-house + frontier models; schema & schemaless | Parse→LLM (VLM enrich on complex pages); schema & schemaless | Agentic parse→LLM; **schema-only** (Extract builds on Parse) |
| **Schema flexibility** | JSON Schema subset; nested; arrays/line-items; custom `extend:type` (date/currency/signature) | Arbitrary JSON Schema; nested; `array_extract` for long arrays; ≤~50 fields | JSON Schema / Pydantic / Zod; nested ≤7; targets: per-doc / per-page / **per-table-row** |
| **Per-field confidence** | Per-field + per-array-item: `ocrConfidence`, `logprobsConfidence` **(being phased out)**; + Review-Agent 1–5 score | Per-field: `extract_confidence` + `parse_confidence` (0–1) via citations. **Most mature** | **Beta + uncalibrated** (vendor's own docs: "0.6 ≠ 60% accurate"); 100-pg cap; a 2026 GitHub issue reports it not returning via API — **verify in PoC** |
| **HITL / review** | **Review Agent** — built-in review UI, per-field scores, insights, confidence routing, `needs_review` webhook. **Only true production HITL** | Studio = build/debug + citation viewer. **No production review queue** | Web UI = schema playground only. **Buyer builds the review UI** |
| **Accuracy (vendor-reported)** | Brex 99%; RealDoc-Bench Parse 95.7%; LongArray 99.2% | Deep-Extract benchmark (self-commissioned): ~99.6% P/R (beta mode) | **None published** (qualitative only) |
| **Latency** | Sync (5-min cap) + async + batch (≤1,000 files); no s/page figure | Sync + async batch (12h SLA, −20%); `optimize_for_latency` 2× | All async; batch ≤10,000 files; no s/page figure |
| **LGPD / residency** | us1/us2 + EU Frankfurt. **No BR.** ZDR option; BYOC/Hybrid possible | US default; **EU/AU only on Growth+**. **No BR.** ZDR (Growth+); mature VPC/on-prem | US + EU only. **No BR.** BYOC self-host on Enterprise |
| **Cost model** | Credits/page, **public**. Parse 2 + Extract 3 = 5 cr/pg. PAYG ≈ **$0.06/pg**; Scale $0.05/pg; Review Agent +1 cr/pg | Credits, **published card**. Parse 1–2 + Extract 2 = 3–4 cr/pg × $0.015 ≈ **$0.045–0.06/pg**; Deep-Extract 4 cr/pg +0.1/field | Credits (1k=$1.25). Extract 6–60 cr/pg ⇒ **$0.0075–0.075/pg**. **Cheapest at low tiers** |
| **Free tier for PoC** | 10k credits free → ~50-doc PoC ≈ **$0** | 15k credits free → PoC ≈ **$0** | 10k credits/mo free → PoC ≈ **$0–16** |
| **Logistics / customs fit** | **Dedicated logistics page: BOLs, PODs, freight invoices, customs forms; BOL is the docs' worked example. Strongest** | Logistics page names BOLs, commercial invoices, packing lists, customs declarations. Strong | **No BOL / logistics / customs mention anywhere.** Invoices only |
| **DX / buildability & maintainability** | REST + Py/TS/Java/Go SDKs, CLI, webhooks, Fern docs. **No native n8n node** → call from n8n's generic HTTP Request node (feasible; hand-wire file upload + async poll) | REST + Py/TS/Go SDKs, CLI, Studio, mature docs. **No native n8n node** → generic HTTP Request node | REST + Py/TS SDKs, CLI, webhooks, llms.txt. **Verified native n8n node** — one node (Parse/Classify/Split/Extract/Retrieve), `usableAsTool` for n8n AI Agents, managed file + auth. A real edge **iff n8n is the orchestration layer** |
| **Output provenance** — per-field bbox/citations (enables *our own* HITL UI) | **Yes.** Per-field `citations`: `page` + `polygon` bbox (PDF pts) + `referenceText`, same path-key as `value`; behind `citationsEnabled` (adds latency — extra citation model). Docs ship a polygon→highlight-overlay recipe. Word-level bbox also via Parse `returnOcr.words` | **Yes.** Per-field `citations`: normalized `[0,1]` bbox + `page`/`original_page` + source `content` + dual `granular_confidence` (extract+parse); behind `citations.enabled`; **disables chunking**; empty array if value was inferred/uncitable | **Yes** (verify). Per-leaf-field via `cite_sources`: `page` + `matching_text` + `bounding_boxes {x,y,w,h}` + `page_dimensions`; **bbox may be doc-drift — the live example shows only page+text; confirm in PoC**; slows extraction |
| **Vendor lock-in / reversibility** | Portable JSON Schema (+`extend:*`); workflows/configs portable JSON **by design** ("self-contained… GitHub-managed"); corrected docs exportable via **Eval-Set API**. Trapped: **Memory + Composer** (no export API) | Portable JSON Schema; **"Direct API" deploy = full config in your repo** (vs opaque "Pipeline ID"); **no export** of corrections/eval-sets/few-shot; usage-export API is billing only | Portable JSON Schema (Pydantic/Zod); configs via beta Configurations API; **licensed BYOC/self-host** (own K8s + own LLM keys) = strongest escape hatch — but Enterprise-licensed, engine not OSS |
| **Studio ↔ API parity** | High — **stated design goal** ("everything you build in Studio runs on the same API"; "View code" on every screen). Gaps: **Composer + Memory** Studio-only; the correction *act* is UI-only (no submit-correction API) | High — Studio is a thin layer; "Direct API" exports the exact config. Gaps: **Studio Evaluations, pipeline versioning, exec logs** are Studio-only (QA/mgmt, not core extraction) | **Near-total.** Only the no-code Schema Builder is a subset (no Union/Enum → use Raw Editor). No functional API gap found |
| **Correction-feedback loop** — do corrections improve the engine? | **Best of the three.** Reviewer rationale "used to improve extraction accuracy"; **Composer** re-optimizes prompts against corrected eval-sets; **Memory** = auto-updating few-shot (Classify-only, beta). No fine-tuning | **None self-serve.** Studio Evaluations = QA/regression only; fine-tuning exists only as an **Enterprise, Reducto-run** service | **None.** History is read-only; improvement is manual (edit `description`s / `system_prompt`) |
| **Native eval tooling** — for measuring *our* metrics, free-tier | Eval Sets via **API** + Composer/Memory optimizers — but they *tune Extend*, not neutrally score; some Studio-only. Usable on free tier | **Studio Evaluations / ground-truth compare — Growth+/Enterprise only → NOT in the free PoC tier** | **None** |

> **None of these is a cross-vendor comparator, and one has nothing usable in the free tier.** We score all
> vendors ourselves on a single neutral ruler — see the eval-harness spec in
> [00 — OCR PoC plan (D-a1).md](https://github.com/rolfilho/myindaia-2.0-project/blob/main/00_Internal_Work/IDP/00%20%E2%80%94%20OCR%20PoC%20plan%20%28D-a1%29.md) §3.1. These native tools
> matter only as (a) a way to *iterate the chosen vendor* during T-22 and (b) a capability axis in their
> own right (the correction-feedback row above).

Per-page $ in the row above are the *typical extraction pipeline* (parse + extract, mid mode). The
full method and the split by mode are in the next section — cost swings 5–10× with the options chosen.

---

## The "build-your-own-HITL" criteria

These four rows follow from a core premise: **the extraction engine is the asset, not the vendor's UI** — we
build the HITL surface inside MyINDAIA regardless, so what matters is (a) whether the engine's output is *rich
enough to power our own review UI*, and (b) how *reversible* the vendor choice is. Researched from the vendors'
response-format / deploy / studio docs (one tinyfish agent per vendor; source URLs held by the agents,
spot-check before publishing client-facing).

**Output provenance decides whether "our own HITL UI" is cheap or painful — and all three pass.** A usable
review UI needs, per field: value + confidence + **the source region on the page** so a reviewer clicks a
field and sees it highlighted. All three now return per-field bounding boxes + source text + confidence via
the API (Extend `polygon`, Reducto normalized bbox, Llama `bounding_boxes`) — Extend and Reducto even document
the highlight-overlay use case explicitly. **Consequence for the decision: this *weakens* Extend's "only one
with production HITL" edge** — we can build an equivalent review surface on any of the three, so the native
Review Agent is now mainly a *PoC convenience* (a ready-made instrument to measure the `minutes/field` review
cost in §6) rather than a durable moat. Two asterisks: Extend/Llama citations **add latency**; Reducto
citations **force chunking off**; Llama's bbox is **possibly doc-drift — verify in the PoC**.

**Correction-feedback loop is the one place Extend still genuinely leads** — reviewer corrections re-optimize
prompts (Composer) and feed an auto-updating few-shot bank (Memory, beta/Classify-only); Reducto and Llama have
*no* self-serve corrections-improve-the-engine path (Reducto only via a paid Enterprise fine-tune engagement).
But since we're building our own review surface anyway, much of this value is only captured if we also route
our corrections back through Extend's eval-sets — worth testing, not decisive alone.

**Lock-in / reversibility maps onto D4's reversibility axis, and the mitigation is architectural.** All three
use portable JSON Schema, so the schema travels. Configs are exportable-as-code on all three if you choose the
right mode (Extend inline configs; Reducto "Direct API" not "Pipeline ID"; Llama Configurations API). What
*doesn't* travel: accumulated corrections/tuning (trapped or absent everywhere). **Design mitigation to note in
D4:** put a thin **adapter layer** between the vendor and MyINDAIA so downstream always consumes *our* normalized
schema — then swapping vendors is one adapter rewrite. **For the Path-B (Brazil-residency) world, Llama's
licensed BYOC/self-host is a notable escape hatch** alongside Reducto's mature on-prem — both strengthen the
"we can leave / internalize" story that D4's in-house alternative embodies.

**Scanned-vs-digital: none of the three auto-routes or prices by scan status** — confirming RL's routing idea is
a *build-side* lever, not a vendor feature. Extend picks engine by caller flag; Reducto bills by auto-detected
*page complexity* (not scan status) and exposes a manual `extraction_mode: ocr|hybrid`; Llama has only a legacy
Parse "Auto Mode" with unpredictable cost. **Two methodology consequences:**
1. **Classification (digital vs scanned) is near-free and ours to do upstream** — a deterministic text-layer
   check (does the PDF have extractable text?) costs ~0 vendor credits, so the "classification burns credits"
   worry dissolves for this split. Type classification (invoice vs B/L) is the separate, Indaiá-gated question.
2. **Stratify the PoC results by digital vs scanned** — report field accuracy separately for each. Scanned is
   where accuracy craters and where the "does ready-made survive production?" question actually bites; the mean
   across a mixed batch hides it. This is a measurement cut, not new architecture.

---

## Two decisions outside this doc that move the ranking

**Orchestration framework — n8n (low-code) vs LangGraph (code-first) — is a key project decision, and it
reweights vendor DX.** LlamaCloud ships an **officially-verified native n8n node** (one node exposing
Parse/Classify/Split/Extract/Retrieve, `usableAsTool` so it attaches to an n8n AI Agent, managed binary-file
upload + credential auth) via a signed n8n partnership. Extend and Reducto have no native node — both are
callable from n8n's generic HTTP Request node, but you hand-wire the fiddly parts (multipart file upload,
async submit → poll/webhook). So **if the project lands on n8n, LlamaCloud's node is a genuine integration
edge; if it lands on LangGraph / code-first, the node is moot** and all three are equal via SDK. Caveat: this
edge is mostly at **PoC / prototyping** altitude — for the production, auditable customs pipeline
(never-fail-silently + full audit record) and the eval harness, weigh whether low-code n8n is the right
*production* substrate versus code.

**"DX" here means *maintainability given Indaiá's team*, not raw API ergonomics.** After handover Indaiá may
not have senior, full-time engineers — unknown, and a **CEO question**. If the maintaining team is non-senior
or low-code-oriented, that reweights the decision toward **managed / low-code paths** (a native node, a
vendor-run HITL surface, less bespoke glue) and away from a code-heavy adapter + LangGraph stack — which cuts
against the "we'll just build our own review UI on any vendor" convenience and partly back toward Extend's
turnkey Review Agent or LlamaCloud's n8n node. This is a real reweighting, not a footnote: it interacts with
both the orchestration choice above and the cost trade-off below.

---

## Cost — how it's estimated, and by mode

### Method
All three price in **credits billed per page**, but a "credit" is worth a different amount at each
vendor and each operation costs a different number of credits. To compare, normalize to **$ per page**:

> **$/page = Σ(credits/page for each operation in your pipeline) × ($ per credit at your plan tier)**

Two things make the number move, and both must be stated as assumptions:

1. **Which operations you run.** A schema extraction is never just "extract" — it is a *pipeline*:
   **Parse** (read the document — all three charge this under the hood, unless the file is cached) →
   **Extract** (fill the schema) → optionally **Classify** (route doc type), **Split** (multi-doc
   files), and **HITL/Review**. Each adds credits.
2. **Which mode** each operation runs in — fast/light vs. agentic/premium/deep, plus multipliers
   (priority/latency ×2, large-array ×2). This is the 5–10× swing.

**Assumptions used below:** self-serve tier $/credit (Reducto $0.015; LlamaCloud $0.00125 [1k=$1.25];
Extend $0.0125 PAYG / ~$0.010 Scale); parse **included** (not cached); no volume discount (those are
"contact sales"). Re-running extraction on an already-parsed file is **extract-only** at all three
(cheaper) — useful during schema iteration.

### By-mode $/page (parse + extract chain unless noted)

**LlamaCloud** — total = extract tier + parse tier, × $0.00125/credit:

| Pipeline / mode | credits/pg | $/page |
| --- | --- | --- |
| Cost-effective extract (5) + Fast parse (1) — cheapest | 6 | **$0.0075** |
| Cost-effective extract (5) + Cost-effective parse (3) | 8 | $0.010 |
| Agentic extract (15) + Agentic parse (10) — mid/quality | 25 | $0.031 |
| Agentic extract (15) + Agentic Plus parse (45) — max | 60 | **$0.075** |
| Extract-only (cached re-run, cost-effective) | 5 | $0.0063 |
| + Classify pre-filter / + Split add-ons | +1–2 / +4 | +$0.0013–0.0025 / +$0.005 |
| Confidence + citations | +0 credits (but *significantly slower*) | — |

**Reducto** — × $0.015/credit:

| Pipeline / mode | credits/pg | $/page |
| --- | --- | --- |
| Standard parse (1) + standard extract (2) — cheapest | 3 | **$0.045** |
| Complex-page parse (2) + extract (2) | 4 | $0.060 |
| Agentic parse (2–4) + extract (2) | 4–6 | $0.060–0.090 |
| Extract-only on cached `jobid://` (avoids re-parse) | 2 | $0.030 |
| **Deep Extract** (agentic, min **30 credits/doc**) | 4/pg + 0.1/field, min 30/doc | **≥$0.45/doc** |
| Batch queue (−20%) / `optimize_for_latency` (×2) | ×0.8 / ×2 | — |

> Reducto gotcha: calling Extract directly on a URL/file **double-charges** Parse + Extract; parse
> first, then extract by job ID. Deep Extract's 30-credit/doc floor makes it expensive for short docs.

**Extend** — × $0.0125/credit (PAYG) or ~$0.010 (Scale, $500/mo):

| Pipeline / mode | credits/pg | $/pg PAYG | $/pg Scale |
| --- | --- | --- | --- |
| Parse (2) + Extract (3), performance mode — typical | 5 | **$0.0625** | $0.050 |
| Light mode (~4× cheaper; drops `logprobsConfidence`) | ~1.25 | ~$0.016 | ~$0.013 |
| **+ Review Agent (HITL)** | +1 (+0.5 classify) | +$0.0125 | +$0.010 |
| + Agentic OCR text/table correction (triggered pages) | +1 each | +$0.0125 | +$0.010 |
| Classify (1) / Split (2) add-ons | 1 / 2 | $0.0125 / $0.025 | $0.010 / $0.020 |
| Priority parsing / Large-array context | ×2 / ×2 extract | ×2 | ×2 |

### Two worked scenarios (bill of lading, ~3 pages/doc)

| Scenario | LlamaCloud | Reducto | Extend |
| --- | --- | --- | --- |
| **PoC** — 50 docs (150 pg), mid mode, no HITL | ~$1.10–4.70 | ~$6.75–9.00 | ~$9.40 (PAYG) — **all inside the free tier ≈ $0** |
| **Production** — 10,000 pg/mo, quality mode **+ HITL/review** | ~$310 (agentic, no native HITL — build it) | ~$450–600 + build review queue | **~$600 Scale / $750 PAYG incl. Review Agent** (~$500 / $625 without) |

Production figures are list-rate and *before* volume discounts (all "contact sales" above self-serve).
The full model — every rate, formula, and scenario, editable — is in
[03 — Vendor cost model.xlsx](https://github.com/rolfilho/myindaia-2.0-project/blob/main/00_Internal_Work/IDP/03%20%E2%80%94%20Vendor%20cost%20model.xlsx).
The HITL column is where the vendors diverge on real cost: Extend's Review Agent is a built-in line
item (+1 cr/pg); with Reducto or LlamaCloud the review workflow is **build-labor you add**, not a vendor
charge — cheaper per page, more engineering.

**Cost is a first-order axis, and LlamaCloud wins it — but read the two caveats before weighting it.** On list
per-page rates LlamaCloud is clearly cheapest (mid mode ~$0.031/pg vs Reducto ~$0.045–0.06 and Extend
~$0.05–0.0625), and at 10,000 pg/mo it lands ~$310 vs Reducto ~$450–600 and Extend ~$500–750.
**(1) The absolute delta is modest at low volume** — ~$200–450/mo vs Extend, ≈ $2.4k–5.4k/yr — so whether it
justifies LlamaCloud's capability downsides is **volume-gated: material only once real throughput (Q-w6) is
large** (at 100k pg/mo the same delta is ~$2k–4.5k/mo). **(2) True cost = API $ + residual review $** (§6),
and LlamaCloud's **beta, uncalibrated confidence risks a higher review load** — the expensive term is analyst
time, not credits, so poorly-calibrated confidence can erase the per-page saving outright. Both caveats are
**measured in the PoC** (cost/page × volume, and the calibration → review-rate curve). Net: LlamaCloud is the
cheapest *page*, not necessarily the cheapest *pipeline* — don't let the sticker rate outrun the calibration
result.

---

## The decision gate — residency first

The binding constraint is unchanged: if a major client's contract forbids processing outside
Brazil/EU (open under DEC-03), a US-region SaaS is disqualified regardless of quality.

- **Path A — offshore EU processing acceptable** (DPA + zero-retention, EU region): all three qualify;
  pick on capability → **provisional lean Extend** (see below).
- **Path B — data must stay in Brazil:** all three drop to their **self-host / VPC / BYOC** tiers
  (Enterprise, customer-run GPU, none documents a tested BR region). Here **Reducto's on-prem/VPC
  documentation is the most mature**, and this path materially strengthens the case for the **in-house
  alternative** that D4 compares against — a self-hosted pipeline the client fully controls may beat a
  vendor's unproven BYOC-in-Brazil story on both cost and residency.

**Action:** confirm the residency constraint with Indaiá (folds into T-02 / the DEC-03 blocker) before
committing the PoC to a vendor. It can flip the answer from "Extend" to "self-host / build."

---

## Per-vendor summary

### Extend — provisional pick (Path A)
Only vendor with a real production **Review Agent** (review UI + 1–5 field scores + insight flags +
confidence-based routing + `needs_review` webhook) — this directly satisfies the *auditable /
never-fail-silently* binding principle the PoC has to demonstrate. **Best logistics fit**: dedicated
BOL/POD/customs page, and the Extract quickstart's worked example is literally a bill of lading.
Public credit pricing; PoC fits the free tier. Watch-outs: `logprobsConfidence` is being phased out
(lean on `ocrConfidence` + Review-Agent score — verify that's a usable routing signal); no Brazil
region; benchmarks self-run.

### Reducto — strong runner-up
Best-documented **per-field confidence** (dual 0–1 `extract_confidence` + `parse_confidence`),
published **price card**, and the **most mature on-prem/VPC** story (the best Path-B option). Logistics
page names BOLs and customs docs. Watch-outs: HITL is build/debug (Studio), not a production review
queue; headline accuracy is a self-commissioned Deep-Extract (beta) benchmark; no Brazil region; no
explicit LGPD statement.

### LlamaCloud (LlamaExtract) — third on capability, but the cost + integration wildcard
Strong schema flexibility (Pydantic/Zod, per-table-row target) and per-field citations; **materially the
cheapest per page**; the **only vendor with a verified native n8n node**; and licensed BYOC/self-host as a
Path-B escape hatch. Capability downsides keep it third *for extraction*: **no logistics/BOL/customs proof
points** (invoices only), confidence is **beta, uncalibrated, and reportedly not returning via API** (Feb-2026
GitHub issue), no production review UI, no published accuracy, no Brazil region. **Its ranking is the most
input-sensitive of the three** — it climbs if the PoC type is plain invoices (its logistics gap stops
mattering), if orchestration lands on **n8n** (its node becomes a real edge), if Indaiá's team is **low-code /
non-senior** (a managed path lowers operating risk), or if the **cost delta at real volume** proves large
*and* its confidence calibrates well enough to keep review load down. Several of those are decided outside this
doc.

---

## Consolidated gaps (confirm with vendor sales / in the PoC)

- **Brazil residency**: none offers a hosted BR region; none documents a *tested* BYOC/VPC deployment
  in a Brazilian cloud region. Get each vendor's concrete BR-residency answer + timeline.
- **LGPD**: none names LGPD; only GDPR/HIPAA/SOC 2. Need each vendor's LGPD/DPA position in writing.
- **Real $/page at volume**: only self-serve tiers are public; Growth/Scale/Enterprise volume
  discounts are "contact sales." Our per-page figures are list-rate estimates.
- **Confidence calibration**: no vendor publishes a confidence→error-rate mapping; all say "tune it
  yourself." Must be measured in the PoC (this is our §3 calibration metric).
- **Extend `logprobsConfidence` phase-out** — confirm `ocrConfidence` + Review-Agent score are
  sufficient routing signals.
- **LlamaExtract confidence** — confirm it actually returns via API before relying on it.
- **Trust Centers** — Reducto's, LlamaCloud's, and Extend's live trust pages / subprocessor lists all
  failed to load during research; request current SOC 2 reports + subprocessor lists directly.
- **Portuguese-language accuracy** — all examples/benchmarks are English; unverified for PT-BR docs.
- **Customs-specific forms** (DI/DUImp/DU-E, CE Mercante, Siscomex) — none shows these by name;
  logistics fit is proven at BOL/invoice level only.
- **Citation coverage/accuracy** — none quantifies how often bbox citations are returned vs omitted, or how
  they behave on messy scans (vs the clean digital PDFs in their doc examples). Measure in the PoC — it's what
  our own review UI depends on.
- **LlamaExtract bbox — verify it actually returns** — the Extensions page documents `bounding_boxes`, but the
  live worked example shows only `page` + `matching_text`. Confirm via a real call before relying on it (same
  class of risk as its beta confidence score).
- **Corrections/eval-set portability** — none offers a documented path to export accumulated corrections or
  few-shot/tuning artifacts to another vendor or in-house (Extend exports eval-set *documents* but not Memory/
  Composer state; Reducto/Llama have no corrections store). Ask sales if an off-docs export exists.
- **Studio-only tooling** — Extend's Composer/Memory and Reducto's Studio Evaluations/version history/exec logs
  have no documented API. If we standardize on defined-as-code pipelines, confirm nothing load-bearing is
  trapped in a GUI.

---

## What would change the provisional lean
- **Client forbids offshore processing** → shift from Extend to a self-host evaluation (Reducto's
  on-prem leads) or to the in-house build in D4.
- **PoC document type is invoice-only** (not BOL) → Extend's logistics-fit edge narrows; all three
  handle invoices, and cost/confidence become the deciding axes (helps Reducto and LlamaCloud).
- **Extend's Review-Agent score proves an unreliable routing signal** in the PoC → Reducto's mature
  dual-confidence moves ahead on the audit requirement.
- **Project adopts n8n for orchestration** (the n8n-vs-LangGraph decision) → LlamaCloud's verified native node
  becomes a real integration edge; nudges toward LlamaCloud, or at least neutralises a LlamaCloud weakness.
- **Indaiá has no senior in-house engineering after handover** → reweight DX toward managed / low-code (native
  node, vendor-run HITL, minimal bespoke glue); helps Extend's turnkey Review Agent and LlamaCloud's n8n node
  over a code-heavy adapter + LangGraph build.
- **Absolute cost delta proves material at real volume (Q-w6)** *and* LlamaCloud's confidence calibrates well
  enough to keep review load low → the cost axis can outweigh capability and move LlamaCloud up.

> This file selects the vendor to *test*. The build-vs-buy comparison (chosen vendor vs. the most
> reasonable in-house alternative) is D4, downstream of the PoC result.
