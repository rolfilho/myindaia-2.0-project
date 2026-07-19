# Plan Stage 1: Core Platform & n8n Foundation

* **Timeline**: Weeks 3–8
* **Resource Allocation**: Shared task (both teams collaborate)
* **Goal**: Establish the target cloud environment on AWS, deploy the PostgreSQL database with the core operational schema, configure the FastAPI Core API monolith, set up the managed identity provider (Auth0/Clerk) for security, and deploy the self-hosted n8n workflow hub.

---

## 1. Cloud & Database Infrastructure

The target environment is deployed in the AWS São Paulo region (`sa-east-1`) to comply with LGPD data residency regulations and ensure low-latency access for local offices.

```
 ┌────────────────────────────────────────────────────────┐
 │                      AWS VPC                           │
 │  ┌─────────────────┐             ┌──────────────────┐  │
 │  │   Core API &    │────────────>│  PostgreSQL 16   │  │
 │  │    n8n Hub      │             │    + pgvector    │  │
 │  │ (Public Subnet) │             │ (Private Subnet) │  │
 │  └────────┬────────┘             └────────┬─────────┘  │
 │           │                               │            │
 │           │ VPN Tunnel                    ▼            │
 │           ▼                              ┌──────────┐  │
 │  ┌─────────────────┐                     │ Redis 7  │  │
 │  │  Legacy SQL     │                     │  Cache   │  │
 │  │  Server Archive │                     └──────────┘  │
 │  └─────────────────┘                                   │
 └────────────────────────────────────────────────────────┘
```

### Infrastructure Specs
1. **Network VPC**: Public subnets host the Application Load Balancer (ALB). Private subnets contain the databases and secrets vault. Secure communication to the on-premises legacy SQL Server `BROKER` database is established via a hardware VPN tunnel.
2. **PostgreSQL Database (RDS)**: Deploy RDS PostgreSQL 16 with `pgvector` enabled. Run migrations to initialize the core tables:
   * Process operational metadata (`process`, `process_export`, `process_import`).
   * Workflow state and configurations (`client_service_config`, `followup_event`, `followup_stage`).
   * Financial ledger and wallet balances.
   * Document and vector embeddings tables.
   * Immutable write audit trail.
3. **Redis Cache (ElastiCache)**: Deploy Redis 7 to manage:
   * n8n visual agent execution checkpoints and background task queuing.
   * Caches for standard static tables (ports, NCM codes, currency listings).
   * Web session validation keys.

---

## 2. Core API Monolith Routing & Security

The custom business logic is centralized in the monolithic FastAPI backend (`myindaia-core-api`), hosted as a Dockerized service on AWS ECS Fargate.

### API Security Implementation
* **JWT Signature Validation**: The API intercepts all calls and validates the user's signature using RS256 public keys fetched from the identity provider. No administrative backdoor accounts (`sa/123` or `DOOMDOOM`) are allowed.
* **Strict CORS**: Restricts incoming API requests strictly to the React PWA domain and n8n webhooks. Wildcard origins (`*`) are disallowed.
* **Rate Limiting**: Employs a Redis token-bucket middleware on public endpoints to protect the Core API from automated script attacks.
* **Secrets Isolation**: The Core API connects to HashiCorp Vault to query database credentials, email service keys, and external API tokens at boot, ensuring no production credentials reside in codebase environment files.

---

## 3. Managed Identity Provider & Legacy User Migration

To secure system access and retire the legacy SQL-login schema, authentication is delegated to a managed Identity Provider (IdP) such as **Auth0** or **Clerk**.

### Transitional User Migration Flow
1. **SSO Realm Configuration**: Set up the user realm in the IdP, configuring role-based access control (RBAC) scopes: `operator`, `supervisor`, `client-admin`, and `broker`.
2. **First-Login Password Migration Bridge**:
   * The IdP is configured to execute a database webhook (calling the Core API) when a login fails or for unmigrated users.
   * The Core API receives the username and password from the bridge, hashes the password, and validates it against the legacy `TUSUARIO` database via the read-only SQL Server link.
   * On success: The Core API writes the user metadata and an Argon2id password hash to the new PostgreSQL `auth_user` table, creates the account in the IdP directory, and returns success to the bridge.
   * Enforces immediate MFA (Multi-Factor Authentication) for all operational employees upon account creation.
   * Deprecates write access to legacy credentials after the 4-week validation phase.

---

## 4. n8n Integration Hub Deployment

Integrations, schedulers, and background data transfers are automated using self-hosted **n8n** running as a Dockerized container on ECS Fargate.

### Configuration Protocol
* **Redis Execution Mode**: n8n is configured in queue execution mode using Redis, ensuring that workflow execution is distributed, high-throughput, and resilient to container restarts.
* **Langfuse Observability Integration**: Install and configure the Langfuse n8n node integration. All prompts, tokens, execution paths, and costs originating from n8n AI workflows (such as OCR document extraction) are logged to Langfuse for continuous auditing.
* **Git Version Control**: Establish a workflow sync pipeline where n8n JSON workflow templates are auto-backed up to a secure Git repository upon save, providing full versioning and rollback capability for visual integrations.

---

## 5. Resource Allocations & Responsibilities

| Role | Key Deliverables | Estimated Effort |
|---|---|---|
| **External Senior Dev** | <ul><li>Configure AWS VPC, subnets, RDS PostgreSQL, and ElastiCache.</li><li>Initialize PostgreSQL schemas and deploy migration tables.</li><li>Deploy FastAPI backend skeleton structure and boilerplate.</li><li>Integrate Auth0/Clerk with Core API endpoints.</li></ul> | 120 hours |
| **Tech Operations Lead** | <ul><li>Deploy n8n Docker image on AWS ECS Fargate.</li><li>Configure n8n environment variables, Redis execution queue, and Langfuse connection.</li><li>Set up git sync automation for n8n JSON templates.</li><li>Undergo onboarding and n8n training curriculum.</li></ul> | 160 hours (Full-time) |
| **Internal UI Developer** | <ul><li>Initialize React UI skeleton repository.</li><li>Configure Tailwind CSS, Shadcn UI primitives, and React Query clients.</li><li>Deploy sample placeholder screen for connection checks.</li></ul> | 80 hours |
| **CEO / Sponsor** | <ul><li>Conduct weekly progress reviews and align team setup.</li></ul> | 6 hours |

