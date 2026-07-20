# 05 — Open Questions

**Updated:** 2026-07-20

Filed by **who can answer**, because a question without a named addressee is not yet a question.
Every entry states what it unblocks and when the answer is needed.

The prep window exists largely to get sections 2–3 answered **before** the billed clock starts.
Questions asked on W1 D1 are worth a fraction of questions answered on W1 D1.

**Not every question should be asked, and not yet.** A hard question put to a stakeholder cold
returns an off-the-cuff answer that then binds us. Section 1 is split accordingly: what we ask
Fabricio to **validate**, versus what we must **qualify ourselves first** and bring back with options
and trade-offs.

`When`: `P0` before Discovery · `W1` week 1 · `W2` week 2 · `F2` can wait for Fase 2

---

## 1. Fabricio (CEO)

Split deliberately into **what we validate** and **what we are not ready to ask yet**. Most of the
strategic questions in this project cannot be answered cold — put them to the CEO unqualified and we
get an off-the-cuff answer we will then be bound by. The kickoff is for confirming constraints and
priorities; the hard trade-offs come back later, framed with options and analysis.

### 1.1 To VALIDATE at kickoff — confirm or correct

Phrased as statements, not open questions. Each one either constrains our work or sharpens
prioritization. If Fabricio corrects any of them, that correction is worth more than an hour of
open-ended discussion.

| # | Statement to confirm | Why it matters to us | Unblocks |
| --- | --- | --- | --- |
| **V-01** | Indaiá operates 100% on DUIMP. Legacy DI is out of scope and stays a read-only archive. | The single biggest scope boundary in the project. If it moves, the schedule and cost move with it. | D-a, D-d |
| **V-02** | No customs act is ever automatic — DUIMP and DU-E always require human review plus an A3 certificate. | Sets the hard stop for automation. Determines how far agents can go and what DEC-05 is even solving for. | DEC-05, DEC-02 |
| **V-03** | Migration happens client by client, always with a rollback path. Never all clients at once. | Constrains cutover design and the shape of the schedule. | D-b3, DEC-06 |
| **V-04** | Every agent decision must be auditable — input, output, confidence, approver. | Disqualifies architectures that cannot produce that record. Cheaper to know now than in month six. | DEC-02, DEC-04 |
| **V-05** | Export is the first vertical to turn; Import follows. | Sets sequencing for everything we plan. | DEC-06, D-d |
| **V-06** | **Who is the pilot client** for the first client-visible delivery — the most communicative and most tolerant of rough edges. | We cannot design a first slice without knowing who receives it. Still open in the CEO's own action list. | DEC-06 |
| **V-07** | **Which client-visible milestone is most valuable to be able to announce first.** | The most useful prioritization input he can give us, and one only he can answer. | DEC-06, DEC-09 |
| **V-08** | Team we are planning against: Wagner's internal team plus **two external contract developers**. | Every estimate in D-d depends on this. Confirm seniority, contract length and expected capacity. | D-d, D-b1 |

### 1.2 Commercial and contractual constraints

| # | Question | Unblocks | When |
| --- | --- | --- | --- |
| **Q-16** | **Which client, or which document type, for the OCR proof of concept?** Our recommendation is to choose by document type; there may be a commercial reason to prefer a specific client. | DEC-01, T-03 | ⭐ **P0 — the most urgent question in this file. Gates the document batch, which gates the only empirical result of the engagement.** |
| Q-12 | Do BASF / Nestlé / Pirelli contracts restrict cloud processing outside Brazil or the EU? Named documents, not general impression. | DEC-01, DEC-03 | P0 |
| Q-13 | **What is Indaiá spending on IT infrastructure today?** We need the current run-rate as the baseline for the OpEx model — a new number in isolation is meaningless to a CEO, and "is there a ceiling?" invites an arbitrary answer. | D-c, DEC-03 | W1 |
| Q-14 | Status of the INTTRA API credentials? The CEO vision names RPA dependency as the largest current technical risk. | DEC-02, D-b1 | P0 |
| Q-11 | PVD v4's phases sum to ~90 weeks while its own comparison table declares ~100. Which number has been used commercially, and with whom? | D-d | Low priority — ask only if the schedule conversation makes it material |

### 1.3 NOT ready to ask — qualify first

These are the decisions that matter most, which is exactly why they must not be asked cold. They go
to Ricardo and Rodrigo first (WS4 / DEC-06), come back as **options with trade-offs and a
recommendation**, and only then go to Fabricio.

| # | The question, once we can ask it properly | Owner until then |
| --- | --- | --- |
| Q-01 | Continuous value delivery vs. larger batched releases — build the system and migrate clients in batches, or go deep on one client/process end-to-end? | RL + RZ |
| Q-03 | Where the real tolerance sits between speed and risk. The accumulated principles each mitigate genuine risk; their *sum* may deliver value more slowly than the business can accept. Needs concrete options and a cost in weeks before it is a fair question. | RL + RZ |
| Q-05 | Whether export and import verticals should genuinely run in parallel from the foundation, given actual team capacity. | RL + RZ |
| Q-06 | Which metrics to commit to moving in the first 12 weeks. Still too open — we bring a proposed set, not a blank page. | RL, then CEO |

> **Dropped:** the week-8 commitment question (built on stale assumptions and too granular to be
> useful), and the principles-ratification block. The latter came out of documents the CEO generated
> with AI; asking him to ratify principles he did not personally author produces agreement without
> substance. The parts of that material that genuinely constrain us are in §1.1 above, as specific
> statements he can confirm or correct.
>
> **Do not over-index on baselines.** Inbound-call volume and NPS have no baseline today. Worth
> mentioning once so measurement can start; not worth spending kickoff time on.

---

## 2. Wagner — code walkthrough and the export build

> ⚠️ **Rodrigo reviews and trims this list before it is sent (T-52).** It is currently a superset,
> written without having seen the code. A long list makes a walkthrough diffuse; what we want is the
> handful of questions only Wagner can answer and that actually move a decision. **Q-29 and Q-30
> must survive any cut** — document volumes and the ground-truth batch gate the OCR work, which is
> the only empirical evidence the engagement produces.


| #    | Question                                                                                                                                                                                                                     | Unblocks       | When                                  |
| ---- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------------------------------- |
| Q-20 | Read access to the export repository — what's the process and who grants it?                                                                                                                                                | CP-1, D-a, D-d | **P0 — highest-severity dependency** |
| Q-21 | Does the export work being built follow a stated delivery principle — walking skeleton, vertical slice, strangler fig — or is it feature-by-feature? Named explicitly in the raw notes as something we need to understand. | DEC-06, D-a    | W1                                    |
| Q-22 | What is genuinely built and running today, versus scaffolded, versus planned?                                                                                                                                                | D-a, A3        | W1                                    |
| Q-23 | The "~55–60% reusable" figure — where does it come from, and against what definition of reuse? We've inherited it and need to verify it.                                                                                   | A3, D-a, D-d   | W1                                    |
| Q-24 | Which architectural decisions have already been made implicitly in the export build and are now expensive to reverse?                                                                                                        | D-a, all DEC   | W1                                    |
| Q-25 | Who maintains integration workflows day to day once this is live — developers, or operations people? Answer determines half of DEC-02.                                                                                      | DEC-02         | W1                                    |
| Q-26 | Team size, seniority, and real velocity? D-d is unestimable without it.                                                                                                                                                      | D-d            | W1                                    |
| Q-27 | What exists for CI/CD, environments, and automated testing?                                                                                                                                                                  | D-a, D-b3      | W1                                    |
| Q-28 | Current backlog, and how it was prioritized?                                                                                                                                                                                 | D-a, T-36      | W1                                    |
| Q-29 | Document volumes per month by type — invoices, B/Ls, packing lists. Needed to extrapolate OCR cost.                                                                                                                         | D-c, DEC-01    | P0                                    |
| Q-30 | Can you supply the document batch with ground truth, and what does Indaiá currently hold as "ground truth"? Already-keyed structured data would be ideal.                                                                   | CP-2, DEC-01   | **P0**                                |

---

## 3. Leandro (legacy) · Andrea (Director of Operations)


| #    | Addressee        | Question                                                                                                                                                                                                                                                                                                                                              | Unblocks                | When   |
| ---- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------- | ------ |
| Q-40 | Leandro          | Exact prerequisites for read-only access to the`BROKER` database?                                                                                                                                                                                                                                                                                     | DEC-07                  | P0     |
| Q-41 | Leandro          | Which stored procedures are genuinely load-bearing for export, and which are dead? (~2,419 SPs indexed; we need the live subset.)                                                                                                                                                                                                                     | DEC-07, D-a             | W1     |
| Q-42 | Leandro          | Has the`sa`/`123` credential actually been rotated? The CEO vision made it a week-1 item with no negotiation. If not, it goes in the risk register at the top.                                                                                                                                                                                        | D-b1, D-b2              | **P0** |
| Q-43 | Leandro          | Which legacy integrations write to production during export, and would collide with a shadow-mode run?                                                                                                                                                                                                                                                | D-b3                    | W1     |
| Q-46 | Andrea           | What does the spreadsheet contain, and when can we have it? Flagged in the raw notes as a key input to the delivery-cadence decision.                                                                                                                                                                                                                 | DEC-06, D-d             | P0     |
| Q-47 | **Andrea** ⭐     | Her **map of operational problems and client buckets** for deploying the new software. This is the closest thing that exists to a real prioritization input, and it is the missing half of the process map (T-50) — the legacy schema tells us what the system *does*, her map tells us where it *hurts* and which clients group together.            | DEC-06, V-06, T-50, D-a | P0     |
| Q-47b | RL (internal)   | **Get Andrea into the project.** She is Director of Operations and it is currently unclear whether she is involved — she should be. Client bucketing feeds pilot-client selection (V-06) and migration sequencing (DEC-06); without her the process map is inferred from code alone.                                                                  | DEC-06, T-50            | **P0** |
| Q-48 | Leandro          | What do`sp_di_calculo` and the `sp_calc_*` family **actually compute**, and which of them are still live? The CEO vision forbids reimplementing them in Python, but if Indaiá is DUIMP-only the DI calculation may be an uncontested boundary — while `sp_calc_*` is a wildcard that may cover export-side calculations we genuinely need to touch. | Principles, DEC-07, D-a | W1     |
| Q-49 | Leandro / Wagner | Which fiscal calculations does the**Portal Único (RFB)** perform authoritatively, and which does Indaiá compute itself today? This is the line that determines what may never be reimplemented versus what merely *hasn't* been.                                                                                                                    | Principles, DEC-07      | W1     |

---

## 4. Rodrigo — what Ricardo needs from you

Not a request for opinions. These are the four recommendations you own, each in the shape defined in
[01_Working_Agreement.md](01_Working_Agreement.md) §P3, plus the questions I want you thinking about
before Discovery starts.

### What you own end-to-end

DEC-02 (orchestration engine + build roadmap) · DEC-03 (database infrastructure) · DEC-04 (RBAC) ·
DEC-05 (scraping hosting + A1/A3) · DEC-07 (Stage-1 BROKER bridge). Plus D-b2, the legacy
security/LGPD remediation plan — which must be **recommended actions, prioritized and sequenced**,
not a vulnerability list. That distinction is contractual.

### What I expect from each

One page. Options MECE including do-nothing. Trade-offs in money, time, risk, reversibility.
Recommendation with a confidence level and the reason for that level. And explicitly: **what would
change your mind.** I will run independent analysis against your conclusions — that's the design of
the engagement, not distrust, and the last section is what makes it a useful exercise rather than a
guessing game. Each one also carries an OpEx implication, even if only to an order of magnitude,
because deliverable (c) assembles from your five.

### Questions for you


| #    | Question                                                                                                                                                                                                                                                               |
| ---- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Q-60 | Read the v0 migration plan against the CEO vision. Where is it wrong, and where is it merely conservative? Those are different findings and I want them separated.                                                                                                     |
| Q-61 | Is the premise that Indaiá needs workflows maintainable by non-technical people still true — or is it an assumption we've been inheriting? Half of the n8n case rests on it.                                                                                         |
| Q-62 | Given a two-week window, is there any test worth running on the agent engine, or is analysis genuinely the right call there? Anexo I §1.3 restricts empirical work to OCR, so if you think a test is essential, say so early and I'll take it up as a scope question. |
| Q-63 | Of the five decisions you own, which is the most expensive to get wrong, and where do you want my independent cross-check aimed first?                                                                                                                                 |
| Q-64 | Can A1 software certificates replace A3 tokens for the automatable portion of the flow — noting that the CEO holds human review plus A3 as non-negotiable for the customs act itself?                                                                                 |
| Q-65 | What in the target stack (FastAPI / React 19 / Postgres / n8n / LangGraph) would you challenge if you weren't inheriting it? I'd rather hear it now than in month four.                                                                                                |
| Q-66 | Anything you need from me — access, context, a session with someone — that isn't already on the task board?                                                                                                                                                          |

---

## 5. Internal — ours to resolve, nobody to ask


| #    | Question                                                                                                                                                            | Owner | When |
| ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----- | ---- |
| Q-80 | How do we present D-a honestly if the export repository never arrives? Draft the confidence-penalty language before we need it, not under time pressure.            | RL    | P0   |
| Q-81 | How much of the v0 plan do we defend versus revise? We wrote it; we're now auditing our own work in front of the client. Get the posture right in advance.          | RL    | P0   |
| Q-82 | If the OCR result is*bad* — accuracy too low to justify a ready-made API — what do we recommend? The PoC has to be able to return a negative and still be useful. | RL    | W1   |
| Q-83 | What is the minimum viable version of every deliverable, if week 2 collapses under client scheduling? Decide the drop order now, while it's cheap.                  | RL    | P0   |
| Q-84 | Where does our recommendation genuinely differ from the CEO's stated vision, and how do we say so without spending all our credibility in the first session?        | RL    | W1   |
