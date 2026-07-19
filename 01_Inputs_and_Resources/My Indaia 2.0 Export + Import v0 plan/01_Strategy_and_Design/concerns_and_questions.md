# Technical Concerns, Questions & Operational Risks

This document compiles the core engineering concerns, open questions, and operational risks identified during the planning of the **MyINDAIA** Greenfield Rewrite.

---

## 1. Core Technical Concerns (Selected Path)

### ⚠️ Concern 1: LLM Extraction Hallucinations in Financial/Customs Data
* **Description**: n8n workflows use a combination of deterministic PDF parsing engines (Docling/OpenDataLoader) and Gemini LLM to extract metadata from commercial invoices and packing lists.
* **The Risk**: While LLM extraction combined with layout parsers is highly accurate, LLMs can still occasionally misread numbers, decimal points, or currency codes in dense tables. In customs clearance, a single digit error in an invoice value or NCM code can lead to federal audit fines or cargo seizures.
* **Proposed Mitigation**: 
  * Require human validation for critical data fields (CNPJ, total value, currency, NCM) in the React UI before submitting any declarations.
  * Implement strict Pydantic parsing at the n8n AI output boundary to validate structure.
  * Use regex and checksum validation algorithms for numbers and codes (e.g., container checksum digits).

### ⚠️ Concern 2: Low-Code Integration Reliability (n8n)
* **Description**: n8n is responsible for critical B2B pipelines, ERP syncs, and booking integrations.
* **The Risk**: Visual workflows can become difficult to maintain or debug if they grow too large. If an n8n node fails (e.g., connection timed out or format changes), executions can stall without alerting developers.
* **Proposed Mitigation**:
  * Set up n8n error-handling triggers for every workflow. Any node failure must post to a centralized Slack/Teams alert channel.
  * Keep visual workflows focused. Split complex data pipelines into parent/child sub-workflows in n8n.
  * Enforce Git versioning: Auto-push n8n workflow JSON schemas to a secure repository upon changes.

### ⚠️ Concern 3: Vibe-Coded UI vs. Regulated Logic Integrity
* **Description**: The React UI is developed internally using AI-augmented vibe coding (Cursor, v0, Gemini) by a junior/mid developer.
* **The Risk**: Vibe-coded frontend code can look correct and compile cleanly while containing fatal bugs in accounting rules, tax computations, or government declaration validations. A newly upskilled Tech Ops Lead lacks the technical expertise to catch these deep logical flaws in standard code reviews.
* **Proposed Mitigation**:
  * **Dumb UI Pattern**: Enforce a strict "Dumb Frontend" rule. The React UI must contain zero business, financial, or regulatory logic. All math (double-entry balancing, tax additions) and schema checks (DUIMP compliance) must be executed and enforced by the Python FastAPI backend (Layer 2) built by the External Senior Developer.
  * **Senior Code Sign-off**: All UI merge requests involving API payloads, routing, state syncing, or financial screens must be reviewed and co-signed by the External Senior Developer, not just the Tech Ops Lead.
  * **Automated CI/CD Gates**: Implement strict TypeScript/lint checks on PRs, coupled with backend Pydantic model validation and transaction-level constraints (e.g., balancing debits/credits in Postgres) that reject corrupted payloads at the API entry point.
  * **Domain & Financial UAT**: Establish a formal User Acceptance Testing (UAT) protocol. Before shipping any stage, a senior customs analyst and the internal financial controller must run a standardized test suite (e.g., clearance of 50 dummy cases with edge values) on the Staging environment.

---

## 2. Greenfield execution Risks & Mitigations

### ⚡ Risk 1: Cutover Downtime Window
* **Description**: The Greenfield approach requires a hard cutover per vertical, during which the new system becomes the sole production system for that domain.
* **The Risk**: If the new system encounters critical bugs during the cutover window, reverting to the legacy system may take 30–60 minutes (DNS propagation, reconnecting sessions), during which operations are disrupted.
* **Mitigation**:
  * Execute cutovers during low-traffic periods (weekends or holidays, outside of shipment windows).
  * Pre-configure instant DNS rollback (low TTL records) and legacy system warm-standby.
  * Maintain a 72-hour "dual-ready" window after each vertical cutover where the legacy system can be reactivated within 5 minutes via pre-configured routing rules.

### ⚡ Risk 2: User Password Migration Without Coexistence Bridge
* **Description**: Users must have their credentials migrated before cutover. Because there is no active dual-running database, credentials must be bridged.
* **The Risk**: All users must have their credentials migrated before cutover. If the legacy password hashing algorithm cannot be replicated, users may need to reset passwords — causing friction and support overhead.
* **Mitigation**:
  * Deploy a custom bridge hook in Auth0/Clerk to verify legacy SHA passwords against the legacy `TUSUARIO` table on the user's first login during shadow mode.
  * Migrate the account details and password to the new PostgreSQL database on success.

### ⚡ Risk 3: Undiscovered Business Logic in Legacy Code
* **Description**: The legacy system contains 2,419 stored procedures, a 1.6MB `Main.pas` file, and 26 years of accumulated edge-case handling.
* **The Risk**: Despite the thorough audit, some business rules may only surface in rare operational scenarios (e.g., fiscal year closings, specific client configurations, regional tax exceptions) that weren't triggered during the shadow-mode comparison.
* **Mitigation**:
  * Extend the shadow-mode period to target a minimum of 1 full month-end closing cycle.
  * Keep the legacy SQL Server database and Delphi binaries available (not deleted) for at least 12 months post-cutover as a diagnostic reference.

---

## 3. Rejected Strangler Fig Risks (For Reference)

The incremental Strangler Fig approach was rejected due to the following risks:

### ❌ Rejected Risk 1: SQL Server Trigger Loops
* **Description**: Writing updates back to the legacy database (`TFOLLOWUP`) triggers cascading business rules (e.g., Nestlé B2B logic).
* **The Risk**: Bidirectional sync runs the risk of infinite loop updates and data overrides between Python and SQL Server triggers.

### ❌ Rejected Risk 2: Dual-Database Split-Brain
* **Description**: Users edit records in Delphi while Python agents write updates to PostgreSQL simultaneously.
* **The Risk**: Conflict resolution is extremely complex. Synchronizing transactional updates across two databases without locks inevitably results in overwritten data.

---

## 4. Gating Questions for CEO Review

Before approving either a serverless or self-hosted deployment architecture, three critical facts must be established with Fabricio (CEO) and client IT teams:

| Fact to Establish | Architectural Implication |
| :--- | :--- |
| **1. Client Data-Residency / SaaS Restrictions**<br>Do BASF, Pirelli, or Nestlé contracts restrict transit of trade data through third-party SaaS clouds (e.g., n8n Cloud)? | **Determines Option A vs B**: If SaaS is restricted, we are forced into self-hosting (Option B), which increases SRE/OpEx costs. |
| **2. Certificate Formats: A1 (File) vs. A3 (Hardware Token)**<br>Which government portal integrations require physical A3 USB tokens/smartcards, and can they be converted to file-based A1 software certificates? | **Determines mTLS Feasibility**: Hardware A3 tokens *cannot* run in Lambda or serverless cloud environments. Outbound mTLS is only viable in the cloud if A1 certificates can be used. |
| **3. Real Peak Transaction Volume**<br>What is the exact daily process/booking volume, and what is the maximum concurrent payload size during peak integrations? | **Right-Sizes the Stack**: Right-sizing allows us to drop n8n Queue Mode (using a single container) and Vault (using AWS Secrets Manager), significantly lowering CapEx and OpEx. |
