# 06 — Questions & Validations for Indaiá (canonical roll-up)

**Audience:** RL / RZ internal. Asked in PT-BR when raised.

**What this is:** the single place that lists *everything we need to confirm, ask, or validate with
Indaiá* across Discovery — CEO premises, assumptions to re-test, access dependencies, interview
questions, and the OCR/IDP question set. **Each item is maintained in its home doc (linked). This file
is the index, not a second copy — edit the source, not here.** The detailed OCR questions in particular
live in [IDP/04 — Questions for Indaiá.md](https://github.com/rolfilho/myindaia-2.0-project/blob/main/00_Internal_Work/IDP/04%20%E2%80%94%20Questions%20for%20Indai%C3%A1.md); this
roll-up only summarises and points to them, so the two cannot drift out of sync.

---

## 1. CEO premises to confirm — [05_Kickoff_Brief.md](https://github.com/rolfilho/myindaia-2.0-project/blob/main/00_Internal_Work/05_Kickoff_Brief.md) §1

Sent as the CEO pre-read; each is a statement to confirm or correct.

1. Indaiá operates 100% on **DUIMP**; legacy DI is a read-only archive (the biggest scope boundary).
2. Delivery team = **Wagner's internal team + two external contract developers** (need seniority, contract length, capacity).
3. **Export sequenced before Import** — not both in parallel.
4. OCR PoC runs on **one document type across several clients** (which type still to confirm — see §5 below).
5. **After go-live, ≥1 capable full-time developer owns the system in-house.** Reweights DEC-02 (n8n vs LangGraph) and DEC-01 (vendor DX). A capable dev does **not** rule out low-code — n8n still lets non-technical staff edit workflow parameters without a developer.

## 2. Assumptions to re-test, not inherit — [02_Discovery_Plan.md](https://github.com/rolfilho/myindaia-2.0-project/blob/main/00_Internal_Work/02_Discovery_Plan.md) §5

A1 contract-signature timing · A2 August kickoff (chosen to avoid the client's team transition) ·
A3 export build ~55–60% reusable (verified by CP-1) · A4 DUIMP-only ·
**A5 client can supply documents + ground truth (→ CP-2)** ·
**A6 workflows must be maintainable by non-technical people** — carries the n8n half of DEC-02 and now also weights DEC-01 (see Q-w5 / premise #5).

## 3. Critical-path dependencies & access asks — [02_Discovery_Plan.md](https://github.com/rolfilho/myindaia-2.0-project/blob/main/00_Internal_Work/02_Discovery_Plan.md) §3 (CP-1/2/3) + [05_Kickoff_Brief.md](https://github.com/rolfilho/myindaia-2.0-project/blob/main/00_Internal_Work/05_Kickoff_Brief.md) §4

- **CP-1** — read access to the **export repository** (highest-severity risk in the engagement).
- **CP-2** — **document batch with ground truth** (gates the OCR empirical work; needs the doc-type decision first).
- **CP-3** — **CEO alignment session** (the delivery-strategy decision is the CEO's to make).
- Access asks: BROKER **legacy DB** read-only + confirm the `sa`/`123` credential is rotated (Leandro) · current **IT infrastructure run-rate** (Finance) · **INTTRA** Company ID / e2open contact (light heads-up, not a schedule risk).

## 4. Interview questions — [02_Discovery_Plan.md](https://github.com/rolfilho/myindaia-2.0-project/blob/main/00_Internal_Work/02_Discovery_Plan.md) §7

**Wagner — export build / code walkthrough:** Q-w1 delivery principle · Q-w2 built-vs-scaffolded-vs-planned ·
Q-w3 basis of the "55–60% reusable" figure · Q-w4 decisions expensive to reverse ·
**Q-w5 who maintains workflows day-to-day + ≥1 full-time dev after handover (→ DEC-02, DEC-01)** ·
**Q-w6 monthly document volumes by type (→ OCR cost)** ·
**Q-w7 document batch + what Indaiá holds as ground truth (→ CP-2)** ·
Q-w8 team size / seniority / velocity · Q-w9 CI/CD, environments, automated testing.

**Leandro — legacy database:** Q-l1 load-bearing vs dead stored procedures (~2,419 indexed) ·
Q-l2 legacy writers that would collide with a shadow-mode run · Q-l3 what `sp_di_calculo` / `sp_calc_*`
compute and which are live · Q-l4 what Portal Único (RFB) computes authoritatively vs Indaiá itself.

## 5. OCR / IDP questions — [IDP/04 — Questions for Indaiá.md](https://github.com/rolfilho/myindaia-2.0-project/blob/main/00_Internal_Work/IDP/04%20%E2%80%94%20Questions%20for%20Indai%C3%A1.md) (canonical detail — 13 questions, clusters A–E)

The full set, with rationale and priority order, lives in doc 04. Cluster summary:

- **A. How documents arrive** (load-bearing) — type pre-identified vs mixed/unlabelled pile · digital vs scanned split · bundled per shipment vs trickle · source channel & quality.
- **B. Volume & cadence** — monthly volumes by type + pages/doc (**= Q-w6**) · peak vs steady.
- **C. Residency & compliance** — which client contracts forbid offshore processing (the gate) · LGPD/DPA posture.
- **D. PoC scoping** — invoice or B/L (**T-02**) · per-field accuracy thresholds · ground-truth batch (**= Q-w7 / CP-2**).
- **E. Post-implementation & team (CEO)** — who owns/maintains after go-live (**= premise #5 / Q-w5**) · existing automation stack (feeds the n8n-vs-LangGraph decision).

> **Deliberate overlaps, reconciled here.** Q-w6 = B · Q-w7/CP-2 = D · premise #5 / Q-w5 = E. These are
> the *same* asks surfaced in their different contexts (interview list, CEO pre-read, OCR plan). This
> roll-up is where they line up so we ask each **once** and don't chase Indaiá twice for the same thing.

---

**Maintenance.** Update questions in their home docs (Kickoff §1, Discovery §5/§7, IDP/04); keep this
file a thin index. This file is **synced to Notion**, so its cross-doc links are absolute **GitHub URLs**
(Notion rejects relative-path link targets) — keep any new links absolute when editing.
