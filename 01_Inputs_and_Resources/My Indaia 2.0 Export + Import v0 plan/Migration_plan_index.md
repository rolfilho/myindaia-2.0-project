# MyINDAIA Platform Modernization — Project Index

This directory contains the complete strategic advisory roadmap to modernize the **MyINDAIA** customs brokerage platform from its legacy Delphi/Classic ASP codebase to a modern, cloud-native architecture. 

Use this document as a Table of Contents to navigate the specific plans and strategy papers.

---

## Project Strategy & Summaries

*   **[Executive Summary](01_Strategy_and_Design/executive_summary.md)**
    *   *Description*: High-level strategic synthesis of the business case, custom Operations vs. n8n Connect strategy, R$ 190k CapEx budget, and operational transition outcomes. Designed for executive review.
*   **[Project Strategy & Modernization Roadmap](01_Strategy_and_Design/project_roadmap.md)**
    *   *Description*: Details the selected 26-week Greenfield strategy, explains why Strangler Fig was rejected, houses the Gantt timeline, staffing model, CapEx/OpEx cost estimates, and change management procedures.
*   **[Target System Architecture](01_Strategy_and_Design/target_architecture.md)**
    *   *Description*: Technical specification of the target stack: vibe-coded React UI, self-hosted n8n integration hub, custom Python FastAPI Core API monolith, PostgreSQL/Redis databases, and IAM security controls.
*   **[Architectural Analysis — Agent Evolution and Orchestration Mapping](2026-07-14%20Architectural%20Analysis%20%E2%80%94%20Agent%20Evolution%20and%20Orchestration%20Mapping.md)**
    *   *Description*: Mapping and analysis of the 10 autonomous COMEX agents from the CEO vision onto the modernized target architecture, detailing the shift to a hybrid n8n + FastAPI orchestration model.

---

## Phase-by-Phase Execution Stages

*   **[Stage 0: Security & Credentials Hardening (Weeks 1–2)](02_Execution_Stages/stage_0_security.md)**
    *   *Description*: Urgent security patches, password rotations, backdoor removal, desktop Named Pipes transition, and HashiCorp Vault digital certificate setup.
*   **[Stage 1: Core Platform & n8n Foundation (Weeks 3–8)](02_Execution_Stages/stage_1_foundation.md)**
    *   *Description*: Deployment of AWS cloud VPC, PostgreSQL relational schemas, managed authentication setup, Core API shell, and self-hosted n8n workflow engine.
*   **[Stage 2: Export Operations & UI (Weeks 9–14)](02_Execution_Stages/stage_2_export_vertical.md)**
    *   *Description*: Vibe-coding the React Export dashboard, Core API export endpoints, n8n maritime bookings (INTTRA API), and B2B client inbound pipelines.
*   **[Stage 3: Import Operations, UI & AI OCR (Weeks 9–14)](02_Execution_Stages/stage_3_import_vertical.md)**
    *   *Description*: Vibe-coding the React Import dashboard, Core API DUIMP endpoints, read-only historical DI views, and n8n workflows for hybrid document parsing (Docling/OpenDataLoader + Gemini LLM) and Playwright scrapers.
*   **[Stage 4: Financial & ERP Workflows (Weeks 15–18)](02_Execution_Stages/stage_4_financial_erp.md)**
    *   *Description*: Vibe-coding the Invoicing dashboard, Core API double-entry ledger database constraints, n8n municipal invoicing (eNotas), and Senior ERP SOAP integrations.
*   **[Stage 5: Shadow Validation, Cutover & Decommissioning (Weeks 19–26)](02_Execution_Stages/stage_5_validation_cutover.md)**
    *   *Description*: Running n8n workflows in read-only Shadow Mode, replaying operational data, executing vertical hard cutovers, locking legacy tables to read-only, and shutting down Delphi binaries.

---

## Technical Risk Management

*   **[Concerns, Architecture Questions & Operational Risks](01_Strategy_and_Design/concerns_and_questions.md)**
    *   *Description*: Risk register documenting LLM OCR hallucinations, n8n low-code maintainability, vibe-coded UI linting gates, Greenfield vertical rollback strategies, and the analysis of rejected Strangler Fig risks.

