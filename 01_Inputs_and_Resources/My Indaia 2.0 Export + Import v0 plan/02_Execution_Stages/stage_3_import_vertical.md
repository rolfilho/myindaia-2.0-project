# Plan Stage 3: Import Operations, UI & AI OCR

* **Timeline**: Weeks 9–14
* **Resource Allocation**: Team B (Import Squad)
* **Goal**: Build the Import Operator React UI, implement DUIMP customs clearance endpoints on the Core API, configure read-only views to historical SQL Server DI tables, and deploy n8n workflows to manage AI document OCR, accuracy verification, LPCO compliance, and government portal scraping.

---

## 1. DUIMP-Only Customs API & Historical Views

To keep development focused, the new platform targets DUIMP customs clearance only. The legacy Import Declaration (DI) rewrite is eliminated from scope.

```
                  ┌──────────────────────┐
                  │    PostgreSQL DB     │
                  └──────────┬───────────┘
                             │
                             ├──────────────┐
                             │ (Write new)  │ (Read-Only History)
                             ▼              ▼
                     ┌──────────────┐ ┌──────────────┐
                     │    DUIMP     │ │ v_di_history │
                     │ Transactions │ │ (SQL View)   │
                     └──────────────┘ └──────┬───────┘
                                             │
                                             │ pyodbc connection
                                             ▼
                                      ┌──────────────┐
                                      │  Legacy SQL  │
                                      │  Server DB   │
                                      └──────────────┘
```

### Action Items
1. **DUIMP Endpoints**: Create endpoints in the Core API (`myindaia-core-api`) that structure customs data and query government Portal Único endpoints using mTLS proxy client credentials.
2. **Historical DI SQL Views**: Do not migrate historical rows. Create a read-only PostgreSQL view (`v_di_history`) that queries legacy SQL Server tables (`TDECLARACAO_IMPORTACAO`, `TADICAO_DE_IMPORTACAO`) via the ODBC bridge for audit and reporting needs.
3. **Deprecate Legacy Calculations**: Deprecate legacy stored procedures (`sp_di_calculo`, etc.). The new import UI displays tax calculations returned dynamically by the government's Portal Único API.

---

## 2. Ingestion & Document OCR (Docling / OpenDataLoader + Gemini LLM)

We automate unstructured document extraction visually in **n8n** instead of writing raw Python parsing code.

### OCR & Vector Indexing Flow
1. **Trigger**: An n8n workflow triggers when documents are uploaded to an AWS S3 bucket.
2. **Extraction Node**: The document is processed by an open-source deterministic engine (such as **Docling** or **OpenDataLoader PDF**) to convert layout, tables, and text into clean markdown/JSON. This parsed content is then passed to a Gemini LLM node in n8n with a structured prompt to extract key fields: CNPJ, invoice numbers, total value, currency, weight, and NCM codes.
3. **Pydantic Validation**: n8n validates the returned JSON structure against a schema.
4. **Vector Embedding**: The document text is converted into vector embeddings using a Gemini embedding node in n8n and saved to PostgreSQL's `document_embedding` table via the `pgvector` node.
5. **Confidence Gate**: If the extraction confidence score falls below 95% on any critical field, the n8n flow calls the Core API to flag the document as "Pending Review" and alerts the import analyst.

---

## 3. Invoice-to-PO Accuracy Verification

* **Trigger**: Completion of the document OCR flow.
* **Verification Node**: n8n queries the Core API to retrieve the client's original Purchase Order (PO). An n8n AI node compares PO line items against the extracted Commercial Invoice and checks Packing List net/gross weights against the Bill of Lading (BL).
* **Historical NCM Matcher**: An SQL node queries the database to compare NCM classifications against the client's 26-year classification history.
* **Risk Action**: Discrepancies in total value, currency codes, weights, or NCM classifications block the process from DUIMP submission and flag the process as "Divergent" in the Operator UI.

---

## 4. Compliance & Regulatory Licensing

* **Trigger**: NCM classifications confirmed in the Core database.
* **Consent Check**: An n8n workflow queries government Portal Único endpoints to check for regulatory licensing requirements (LPCO) from agencies like **Anvisa, MAPA, and Inmetro**.
* **Drawback Matching**: The workflow queries the Core API's drawback ledger to check client balances and attaches drawback credits to the DUIMP draft.
* **Expiration Alerts**: If an LPCO license is close to expiring (under 60 days), n8n sends automatic email alerts to the client-admin.

---

## 5. Government Scraping (n8n + Playwright)

The import workflow requires data extraction from secondary government portals (Mercante, SDA, parametrization channels). The legacy desktop automations (`mypagamentomercante`, `myparametrizacao`) are replaced by n8n flows.

### Action Items
1. **mTLS Scraping Workflows**: Build n8n workflows that trigger a sidecar container running **Browserless.io** (headless Chrome running Playwright).
2. **Mercante & Union Fees**: Workflows automate the Mercante tax payment submission and SDA union fee generation, retrieving PDF confirmations and saving them directly to S3.
3. **Parametrization Channel Tracker**: An n8n cron workflow polls the customs status hourly. It checks channel parametrizations (Green/Yellow/Red/Gray channels) and calls the Core API to update process milestones in real time.

---

## 6. Resource Allocations & Responsibilities

| Role | Key Deliverables | Estimated Effort |
|---|---|---|
| **External Senior Dev** | <ul><li>Develop Core API DUIMP calculation endpoints and declaration serializers.</li><li>Configure the `pyodbc` database bridge and deploy `v_di_history` read-only Views.</li><li>Expose API endpoints for document storage and OCR status updates.</li></ul> | 100 hours |
| **Internal UI Developer** | <ul><li>Vibe-code Import DUIMP dashboards, PDF.js document OCR side-by-side view, and divergence logs in React.</li><li>Hook frontend components to Core import endpoints and historical views.</li></ul> | 140 hours |
| **Tech Operations Lead** | <ul><li>Build n8n AI workflows (S3 trigger + Docling/OpenDataLoader + Gemini LLM + PO validation).</li><li>Build n8n LPCO compliance verification, drawback credit check, and warning triggers.</li><li>Develop n8n Browserless.io Playwright scraper workflows for Mercante, SDA union fees, and hourly status checks.</li></ul> | 200 hours |
| **Import Lead Analyst** | <ul><li>Map ANVISA, MAPA, and Inmetro LPCO rules to NCM codes.</li><li>Test shadow OCR outputs and validate accuracy thresholds.</li></ul> | 50 hours |

