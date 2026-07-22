# D-a1 — OCR / IDP PoC: Plan & Execution

**Decision:** DEC-01 (Document extraction / OCR — ready-made API vs. own solution)
**Deliverable:** D-a1 · **Owner:** RL (RZ reviews) · **Method:** Empirical — the only one this phase
**Updated:** 2026-07-21

> Internal working doc. Candid, English. The client-facing output is a separate, PT-BR,
> Ricardo-reviewed document that follows the five-part recommendation shape (§9).

---

## 1. Objective & scope

**The question the business asks:** *"Can we stop paying analysts to retype invoices, and trust what comes out?"*

**Contractual minimum (Anexo I §1.3) — this is the bar we must clear, not the ceiling:**
select **one** external API provider by high-level analysis; measure its **accuracy** and **cost**
over **one** document type; produce a high-level comparison against the build alternatives.

### In scope

- One live PoC pipeline: foreign-trade document → predefined JSON schema, with per-field confidence and a HITL review surface.
- Empirical accuracy + cost of **one** provider on **one** document type.
- Extrapolation of cost and expected accuracy to Indaiá's full document volume.
- High-level cost/complexity comparison vs. the alternative architectures (the five stacks in [01 — IDP architecture options (MECE).md](<01 — IDP architecture options (MECE).md>)). [@claude: here the comparison actually will be one vendor vs. the most reasonable in-house alternative]

### Out of scope (state these explicitly — they are where an OCR PoC overruns)

- **Final provider choice** — comes later, informed by this result.
- **The ready-made-vs-build decision itself** — this PoC *informs* it; it does not settle it.
- **Benchmarking all three shortlisted vendors** — the contract asks for one, selected by analysis.
- **A production pipeline** — no scaling, retraining, or ops hardening. Building/running software is out of scope per the Binding Principles.
- **Multiple document types or a full client's document mix** — one type, by deliberate choice (§4).

---

## 2. Deliverables


| #      | Deliverable                                                                                             | Acceptance = done when…                                               |
| ------ | ------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| **D1** | Live PoC pipeline (chosen vendor): document → JSON schema + per-field confidence + HITL review surface | Runs end-to-end on a sample doc; emits the audit record in §7         |
| **D2** | Measured accuracy + cost of the chosen vendor on the chosen document type                               | All five metrics in §3 recorded against ground truth                  |
| **D3** | Extrapolation: cost & expected accuracy at Indaiá's full volume                                        | Cost model in §6 populated with real volume figures (Q-w6)            |
| **D4** | High-level comparison vs. alternative architectures                                                     | The five stacks scored on cost / accuracy / complexity / reversibility |

---

## 3. What we measure (decision criteria)

The five DEC-01 metrics. Each exists to answer a specific question — an unanswered question is a gap, not a number.


| Metric                     | The question it answers                                    | How measured                                                   | Pass signal                                                                 |
| -------------------------- | ---------------------------------------------------------- | -------------------------------------------------------------- | --------------------------------------------------------------------------- |
| **Field-level accuracy**   | Per field, how often is the extracted value exactly right? | Extracted vs. ground truth, field by field (not doc-level)     | Must-have fields clear the threshold in §8                                 |
| **Confidence calibration** | Does low confidence actually predict error?                | Bin predictions by confidence; measure error rate per bin      | Low-confidence fields are where the real errors are (so HITL routing works) |
| **Cost per page**          | What does one page cost at Indaiá's real volume?          | Vendor credits/tokens per page × price × volume (§6)        | Within the OpEx envelope (D-c)                                              |
| **Latency**                | Fast enough for the operational flow?                      | Wall-clock per doc, cold and warm                              | Tolerable for the notification/booking cadence                              |
| **LGPD / data residency**  | Can this vendor legally process these clients' docs?       | Vendor's processing region + sub-processors vs. contract terms | No blocker for BASF / Nestlé / Pirelli-class contracts                     |

> **LGPD may outrank accuracy.** If a vendor cannot process in Brazil/EU and a major client's
> contract forbids offshore processing (open constraint under DEC-03), it is disqualified regardless
> of how well it extracts. Resolve residency *before* investing in the pipeline. Logged in `MEMORY.md`.

---

## 4. The document-type decision (resolved) & why

**Resolved (RL, 2026-07-21): pick by document type, not by client.** A single client spans several
document types with different failure modes, muddying the accuracy signal; a single document type
across several clients gives *layout variance*, which is exactly what tests whether a ready-made API
survives production.

**Still open:** *which* type — invoice or B/L. Natural candidates; Indaiá may have a commercial
reason to prefer one. This is the **one remaining input** before the batch can be requested (T-02).

---

## 5. Inputs required

Split by source and blocking status — this is the cut that determines what can start today.

### From Indaiá (gate the empirical work — CP-2)


| Input                 | Detail                                                                    | Task                  |
| --------------------- | ------------------------------------------------------------------------- | --------------------- |
| Document-type choice  | Invoice or B/L (see §4)                                                  | T-02 → unblocks T-03 |
| Ground-truth batch    | ≥50 examples of the chosen type, each with a ground-truth record (§5.1) | T-03 → unblocks T-22 |
| Monthly volumes       | Docs/month by type, pages/doc, all clients                                | Q-w6 → feeds §6     |
| Residency constraints | Which client contracts restrict offshore processing                       | DEC-03 blocker        |

### From us (no client dependency — start now)

Output JSON schema (must-have vs. nice-to-have fields, exceptions) · PoC harness · HITL/audit surface · vendor selection (§7 build-side) · synthetic/sample docs to build against.

### 5.1 Ground-truth record spec — say this precisely or we get unlabeled PDFs

Each example = the source PDF **plus** a structured record containing: every must-have field's correct
value, nice-to-have fields where present, and a note on any exception/edge case. Ground truth is the
*answer key*, not just the document. T-03 must specify volume, format, and this record shape, or the
batch arrives unlabeled and unusable.

---

## 6. Cost & accuracy extrapolation methodology

**True monthly cost = API cost + residual human-review cost.** The second term is why calibration
(§3) is load-bearing: confidence quality determines what fraction of fields a human must still check.

```
API cost/month      = pages/doc × docs/month (by type) × vendor price/page
                      (normalize vendor credits/tokens → price/page first — pricing units differ)
Review cost/month   = fields needing human review × minutes/field × analyst cost
                      (review rate is driven by accuracy + confidence calibration)
Expected accuracy   = measured field accuracy, flagged as an estimate until validated at volume
```

Report the sensitivity: cost and review load both move with volume and with the confidence threshold
chosen for HITL routing.

---

## 7. Execution plan — unblocked now vs. client-gated

### Track A — build now, against synthetic/sample docs (no client dependency)

1. Define the output JSON schema (with Indaiá's field list once available; scaffold against a sample meanwhile).
2. Select **one** vendor by high-level analysis (§7 criteria below) — T-13.
3. Build the PoC harness: ingest → extract → JSON + per-field confidence → **audit record** → HITL review surface — T-12.
4. Dry-run end-to-end on sample docs so that when the real batch arrives, we only run it.

### Track B — gated on the client batch (CP-2)

5. Run the harness on the real ground-truth batch — T-22.
6. Score the five metrics; iterate prompt/schema mapping against ground truth — T-22.
7. Extrapolate cost & accuracy to full volume — T-23.
8. Write the comparison (D4) and the client-facing recommendation (§9).

### Vendor selection criteria (for step 2 — pick one, don't benchmark all)

> **Research done (2026-07-21):** all three vendors profiled against these criteria in
> [02 — Vendor research (Extend, Reducto, LlamaExtract).md](<02 — Vendor research (Extend, Reducto, LlamaExtract).md>).
> Provisional lean **Extend** (only production HITL + best BOL/customs fit), Reducto runner-up —
> **but gated on the residency question below: none of the three has a Brazil region.**

Selecting **one** vendor to test is a paper exercise (no batch needed) — it runs now. Criteria,
weighted:

| Criterion | Why it can be decisive | What to look for |
| --- | --- | --- |
| **LGPD / data residency** | A blocker here disqualifies regardless of everything else (§3 note) | Processing region (Brazil/EU), sub-processors, zero-retention / VPC / self-host option, SOC 2 / GDPR posture |
| **Cost** *(see below)* | Sets whether the whole build-vs-buy case survives at Indaiá's volume | Pricing unit, list price, what inflates it, free tier for the PoC |
| **Schema flexibility** | Determines effort and whether custom trade fields work at all | Arbitrary JSON schema without fine-tuning; nested objects; tables / line items |
| **Native per-field confidence** | No confidence → no targeted HITL → the audit principle fails | Per-field (not per-doc) score; any calibration guidance |
| **HITL / review support** | Build-vs-buy math shifts if the vendor ships the review surface | Built-in review UI vs. API-only; correction feedback loop |
| **Latency / throughput** | Must fit the notification/booking cadence | Sync vs. async/batch; typical page latency |
| **DX / integration** | Affects PoC speed and Track-A harness cost | REST API, SDKs, batch endpoint, docs quality |

**Cost is a criterion in its own right — and the hardest to pin down.** It is not one number:

- **Pricing unit differs by vendor** — per page, per credit, per token, per document, or per field/step.
  These are not comparable until normalized to **price per page** (§6). A "credit" may cover one page or
  fragment differently across vendors.
- **The list price is rarely the real price.** What inflates it: complex pages (tables, multi-column)
  costing more than simple ones; re-runs during schema iteration; premium tiers for high accuracy or
  agentic routing; separate charges for OCR vs. extraction vs. splitting/classification.
- **Free / trial tier matters for the PoC itself** — enough free volume to run ~50 docs without a
  contract keeps Track A unblocked and cheap.
- **The comparison cost is the in-house alternative's, not the other vendors'.** Per the note in §1,
  D4 pits the chosen vendor against the most reasonable build option — so the cost figure that matters
  is *vendor price/page at volume* vs. *build + run cost of the two-stage or VLM pipeline*.

Weight residency first, then cost, then the capability criteria.

### The audit / HITL surface is a non-negotiable, not UX polish

Binding Principles require every extraction to be auditable — **input, output, confidence, approver**
— and to **never fail silently** (low confidence or error escalates to a human). The harness must emit
that record from day one; it is what makes the architecture admissible at all.

---

## 8. Definition of done / decision criteria

- **"Ready-made survives"** if: must-have fields clear the accuracy threshold, confidence is
  calibrated enough to route review reliably, cost/page (incl. residual review) sits within the D-c
  envelope, and no residency blocker exists.
- **Flips toward build / alternative stack** if: accuracy on must-have fields is below threshold and
  not closable by prompt/schema iteration; or confidence is uncalibrated (low confidence doesn't
  predict error, so HITL can't be targeted); or a residency blocker rules the vendor out for a major client.
- **Accuracy threshold to set with Indaiá** — the bar differs for a value that triggers a customs act
  vs. an informational field. No customs act is ever automatic, so the threshold governs *review load*,
  not automation of the act itself.

---

## 9. Output format (client-facing)

The final artifact follows the fixed five-part Tier-1 shape, rewritten in PT-BR and Ricardo-reviewed:
**question → MECE options (incl. do-nothing) → trade-offs (money, time, risk, reversibility) →
recommendation with confidence level → what would change my mind.**

---

## 10. Risks & mitigations


| Risk                                               | Mitigation                                                                                   |
| -------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| Batch never arrives / arrives unlabeled (CP-2)     | Track A proceeds regardless; §5.1 spec pins ground-truth shape; escalate T-02/T-03 early    |
| Empirical work downgraded to analytical (no batch) | Named consequence in Discovery Plan; raise as the engagement's key evidence risk if it slips |
| Residency blocker surfaces late                    | Resolve vendor region*before* pipeline build (§3 note)                                      |
| Layout variance underestimated from too few docs   | Push for >50; report accuracy variance across layouts, not just the mean                     |
| Vendor pricing unit obscures true cost             | Normalize credits/tokens → price/page before extrapolating (§6)                            |

---

## 11. Open questions (assigned)


| Question                                           | Owner             | Routes to              |
| -------------------------------------------------- | ----------------- | ---------------------- |
| Invoice or B/L for the PoC?                        | Indaiá (RL asks) | T-02                   |
| Monthly volumes by type, pages/doc?                | Indaiá           | Q-w6                   |
| Which client contracts forbid offshore processing? | Indaiá / DEC-03  | `MEMORY.md` blocker    |
| Accuracy threshold per field class?                | RL + Indaiá      | §8                    |
| Which single vendor to test?                       | RL                | T-13 (criteria in §7) |
| </invoke>                                          |                   |                        |
