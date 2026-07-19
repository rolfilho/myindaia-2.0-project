# Plan Stage 5: Shadow Validation, Cutover & Decommissioning

* **Timeline**: Weeks 19–26
* **Resource Allocation**: Shared task (both teams cooperate)
* **Goal**: Validate system correctness using a read-only shadow-mode protocol, execute a domain-by-domain hard cutover, lock the legacy database as a read-only archive, and decommission all legacy Delphi and Classic ASP modules.

---

## 1. Shadow-Mode Validation Protocol (Weeks 19–22)

To verify the stability and accuracy of the Core API and n8n workflows without risking production data, the platform runs in a read-only **Shadow Mode** for 4 weeks.

```
┌───────────────────────────────────────────────────────────────┐
│                    Shadow Mode (Weeks 19–22)                  │
│                                                               │
│   Legacy System (Production)    New System (Read-Only Shadow) │
│   ┌─────────────────────┐       ┌─────────────────────────┐   │
│   │  All live traffic    │       │  Replay same inputs     │   │
│   │  SQL Server writes   │       │  PostgreSQL writes      │   │
│   └──────────┬──────────┘       └──────────┬──────────────┘   │
│              │                              │                  │
│              ▼                              ▼                  │
│   ┌─────────────────────────────────────────────────────────┐ │
│   │         Automated Comparison Engine (Langfuse)          │ │
│   │   Compare outputs, flag mismatches, generate reports    │ │
│   └─────────────────────────────────────────────────────────┘ │
└───────────────────────────────────────────────────────────────┘
```

### Shadowing Action Items
1. **Input Replay via n8n**: Configure n8n workflows to intercept incoming inputs (B2B client files, document uploads, booking requests) and copy them. The original payload is processed by the legacy Delphi system. The duplicate payload is processed by the new Core API.
2. **Output Comparison (Langfuse)**: An automated comparison engine verifies the outputs:
   * Compares parsed invoice OCR fields (Docling/OpenDataLoader + Gemini) against manual analyst entries.
   * Compares calculated values, weights, and taxes.
   * Compares generated booking drafts and DU-E/DUIMP data schemas.
3. **No Production Writes**: The new system's outputs are never sent to government portals or B2B clients during shadow mode. The legacy system remains the sole production interface.
4. **Readiness Sign-Off**: The system is cleared for cutover only after completing **4 consecutive weeks of shadow execution with zero critical discrepancies** in calculated taxes, currency codes, weights, or NCM classifications.

---

## 2. Vertical Hard Cutover (Weeks 23–24)

The cutover is executed domain-by-domain over a 2-week period, minimizing operational disruption.

| Week | Domain | Cutover Scope | Rollback Plan |
| :--- | :--- | :--- | :--- |
| **Week 23** | **Export Operations** | All export processes (DU-E, bookings, B2B export pipelines) switch to new system. | Revert DNS/routing of export endpoints to legacy Delphi export modules. |
| **Week 24** | **Import Operations** | All import processes (DUIMP, LPCO, document ingestion, Mercante/SDA) switch to new system. | Revert DNS/routing of import endpoints to legacy import modules. |
| **Week 24** | **Financial & Portal** | Invoicing, ERP sync, wallet balance, and the Client Portal UI switch to new system. | Reactivate legacy Classic ASP billing pages. |

### Cutover Guardrails
* **Off-Peak Execution**: Execute DNS routing changes during off-peak weekend windows.
* **Low TTL Routing**: Set DNS Time-to-Live (TTL) values to 60 seconds 2 weeks prior to cutover to allow instant rollback.
* **Warm Standby**: Keep legacy ddbroker modules and database logins running in a warm standby state for 72 hours post-cutover. If a critical issue is identified, the systems can revert in under 10 minutes.

---

## 3. Post-Cutover Stabilization & Support (Weeks 25–26)

1. **Hypercare Support**: The dev team and internal Tech Ops Lead monitor Langfuse dashboards and user logs 24/7 to resolve operational bugs.
2. **One-Time Wallet Reconciliation**: Execute the final wallet data migration script to port legacy balances to the production PostgreSQL schema. Verify that all values reconcile.
3. **Freeze Legacy Writes**: Enforce read-only locks on legacy SQL Server tables.

---

## 4. Decommissioning Plan

Once the new system runs stably at 100% production traffic for 2 weeks, decommissioning begins:

1. **Migrate MyCOM.dll Logic**: Ensure all B2B methods (excel generators for Whirlpool, Festo, SG) embedded in the legacy `MyCOM.dll` are fully migrated to Python endpoints.
2. **Retire Web Pages**: Disable Classic ASP files from the IIS host servers and configure HTTP redirects pointing to the React PWA.
3. **Unregister COM DLLs**: Unregister legacy ActiveX components (`MyCOM.dll`, `DDENFSe.dll`) from Windows servers.
4. **Deactivate Delphi Modules**: Turn off local `ddbroker` modules on user computers.
5. **Lock legacy SQL Server Database**:
   * **Do not delete the legacy SQL Server database.** Keep the SQL Server database active as a read-only historical archive.
   * Revoke write privileges for all users, leaving only the read-only ODBC bridge login (`BROKER_PYODBC_RO`) active to support historical reports in the new UI.

---

## 5. Resource Allocations & Responsibilities

| Role | Key Deliverables | Estimated Effort |
|---|---|---|
| **External Senior Dev** | <ul><li>Debug and fix Core API and PostgreSQL database issues during shadow and cutover phases.</li><li>Execute W23/W24 DNS migrations and infrastructure updates.</li><li>Unregister legacy COM DLLs from Windows servers and apply read-only locks on SQL Server database.</li></ul> | 80 hours |
| **Tech Operations Lead** | <ul><li>Configure and monitor n8n shadow comparison pipelines.</li><li>Audit Langfuse mismatch logs and direct bugs to developers.</li><li>Run the wallet migration ETL.</li><li>Provide hypercare support for visual workflows.</li></ul> | 160 hours (Full-time) |
| **Internal UI Developer** | <ul><li>Fix front-end UI bugs identified during operator validation.</li><li>Redirect DNS records of the client portal to the React PWA hosting endpoint.</li></ul> | 80 hours |
| **Customs Analysts** | <ul><li>Verify process records, values, and compliance statuses against Delphi.</li><li>Sign off on data correctness during shadow mode.</li><li>Use the new React UI for active shipments post-cutover.</li></ul> | 120 hours (shared across team) |
| **CEO / Sponsor** | <ul><li>Review weekly shadow metrics and sign off on cutover gates.</li><li>Coordinate portal rollout with key BASF, Nestlé, and Pirelli client contacts.</li></ul> | 10 hours |

