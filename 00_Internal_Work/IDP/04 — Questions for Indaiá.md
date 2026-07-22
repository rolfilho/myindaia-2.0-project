# Questions for Indaiá — IDP / OCR PoC (DEC-01 / D-a1)

**For:** RL to ask Indaiá (in PT-BR when raised; drafted in English for the working record).
**Feeds:** [00 — OCR PoC plan (D-a1).md](<00 — OCR PoC plan (D-a1).md>) §5 (inputs), §11 (open questions).
**Drafted:** 2026-07-22

> These gate the empirical work (CP-2). Cluster A is the one that unblocks the most at once —
> it decides whether we need classification, quality-routing, and batch stages *at all*, so it
> is the highest-value question to get answered first.

---

## A. How the documents arrive (the load-bearing cluster)

One answer here settles three architecture questions — classification, quality routing, and batching — so lead with it.

1. **Type identification.** When a document enters Indaiá's flow, is its **type already known** (e.g. it was uploaded into a "Bill of Lading" slot, or tagged by the booking/ERP system), or does it arrive as a **mixed, unlabelled pile** where we'd have to detect "invoice vs B/L vs packing list" ourselves?
   - *Why it matters:* if types are pre-identified, we need **no classification stage** — it stays out of scope. If mixed, classification becomes a required upstream production stage with its own accuracy and cost, and we'd have to test it across several document types (beyond the contract's "one type").

2. **Digital vs scanned.** Of the chosen document type, roughly **what share are "true" digital PDFs** (text you can select/copy) **vs scanned images / photos** (including phone photos, faxes, stamped-and-signed originals)? A rough split (e.g. 70/30) is enough.
   - *Why it matters:* scanned documents are where extraction accuracy craters. We will **report accuracy separately for digital vs scanned** — it's the single most informative cut in the PoC results. It also drives the cost model (scanned docs need OCR; digital may skip it on the build-side alternative).

3. **Arrival cadence / bundling.** Do documents arrive **bundled per shipment** (e.g. invoice + B/L + packing list together) or **trickle in individually** over time? Is there a natural moment when a batch of documents is available at once?
   - *Why it matters:* determines whether **batch processing** (cheaper per page, no tight latency requirement) is usable, or whether we need per-document, low-latency processing. Changes both the cost model and the latency target.

4. **Source channel & quality.** How do documents physically reach Indaiá — email attachments, a portal upload, EDI, scanned at a counter? Any known quality issues (low-res scans, multiple documents in one PDF, photos)?
   - *Why it matters:* confirms whether a **splitting** stage (multi-document PDFs) is needed, and sets realistic expectations for scan quality in the ground-truth batch.

---

## B. Volume & cadence (feeds the cost model — §6 / Q-w6)

5. **Monthly volumes** by document type: documents/month, and **pages per document** (average and rough range).
   - *Why it matters:* the entire cost extrapolation (API cost + residual review cost) scales off this. Without it, D3 is unpopulated.

6. **Peak vs steady** — is volume roughly flat month to month, or spiky (e.g. end-of-month, seasonal)?
   - *Why it matters:* peaks drive whether batch/async is enough or we need burst capacity.

---

## C. Residency & compliance (the gate — DEC-03 blocker)

7. **Which client contracts restrict offshore processing?** Specifically, do the BASF / Nestlé / Pirelli-class contracts require documents to be processed **inside Brazil** (or forbid US/EU processing)?
   - *Why it matters:* **this outranks accuracy.** None of the three shortlisted vendors has a Brazil region — if a major contract forbids offshore processing, the SaaS options are disqualified regardless of quality, and the case shifts toward self-host / in-house. Must be resolved **before** we commit the PoC to a vendor.

8. **LGPD posture** — is a standard DPA + zero-retention + EU processing acceptable as an interim position for the PoC, or is Brazil-only processing a hard requirement from day one?
   - *Why it matters:* decides whether the PoC can run on a vendor's EU region at all, or must wait on a self-host path.

---

## D. PoC scoping (our decisions, but need Indaiá's input)

9. **Invoice or B/L for the PoC?** Is there a commercial reason to prefer one — higher volume, more pain, a specific client driving it? (The PoC deliberately tests **one** type across layout variance.)
   - *Why it matters:* T-02 — the one remaining input before the ground-truth batch (T-03) can be requested.

10. **Accuracy threshold per field class.** For the chosen type, which fields are **must-have** (a wrong value has real consequence — e.g. triggers a customs act, a tax) vs **informational**? What error rate is tolerable for each?
    - *Why it matters:* no customs act is ever automatic, so the threshold governs **review load**, not automation of the act itself — but it defines "ready-made survives" (§8) and sizes the residual human-review cost.

11. **Ground-truth batch.** Can Indaiá provide **≥50 examples** of the chosen type, each with a **correct-answer record** (every must-have field's true value + notes on edge cases) — not just the raw PDFs? (Spec in §5.1.)
    - *Why it matters:* ground truth is the answer key. Unlabelled PDFs make the batch unusable and downgrade the PoC from empirical to analytical.

---

## Priority order for RL

1. **Q7–8 (residency)** — can flip the whole vendor decision; resolve first.
2. **Q1–3 (arrival flow)** — unblocks classification / routing / batch scope in one shot.
3. **Q9 (type choice)** + **Q11 (batch)** — gate the empirical run (T-02 → T-03).
4. **Q5, Q10** — needed to populate the cost model and definition-of-done.
