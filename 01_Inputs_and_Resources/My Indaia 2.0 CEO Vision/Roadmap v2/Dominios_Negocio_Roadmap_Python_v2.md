> **ROADMAP DE REESCRITA**
> **Separado por Domínio de Negócio**
> 12 Domínios  |  Delphi → Python  |  Strangler Fig  |  2 Verticais Paralelas
> INDAIA Logística Internacional  |  v2.0  |  Março 2026


| **Campo** | **Valor** |
| --- | --- |
| Versão | v2.0 — DI Legada eliminada, Agentes 09+10 adicionados, domínios separados por vertical |
| Total estimado | ~100 semanas (~24 meses com 2 devs) — economia de 36 sem vs. v1 (sem PGDI) |
| Verticais | Exportação (Time A) + Importação (Time B) — independentes a partir da Fase 3 |
| Padrão | Strangler Fig — Delphi nunca para, Python cresce por domínio |


> **⚡ O que muda na v2.0**
> - D02 Importação: renomeado de di-service → customs-service (escopo DUIMP-only, risco MÉDIO, 14 sem vs. 20 sem)
> - D04 Fiscal: tax-service não reescreve SPs de impostos — consulta NCM + lê resultado Portal Único (risco eliminado)
> - D03 Exportação: inclui Booking Service (Agente 09) e Allocation Service (Agente 10) como parte do export-service
> - Todos os domínios agora indicam sua vertical: EXPORTAÇÃO / IMPORTAÇÃO / TRANSVERSAL
> - Sequência de sprints atualizada para refletir 2 times paralelos a partir da Fase 3


# 1. Visão Geral — 12 Domínios por Vertical


O sistema INDAIA é dividido em 12 domínios de negócio independentes. Cada domínio vira um microsserviço Python separado, pode ser desenvolvido e migrado sem afetar os outros, e segue o padrão Strangler Fig.

| **#** | **Domínio** | **Serviço Python** | **Vertical** | **Fase** | **Semanas** | **Prioridade** | **Risco** |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 01 | Gestão de Processos | process-service | TRANSVERSAL | F5/F6 | 16 | ALTA | ALTO |
| 02 | Importação / DUIMP | customs-service | IMPORTAÇÃO | F5 | 14 | ALTA | MÉDIO |
| 03 | Exportação / DU-E | export-service | EXPORTAÇÃO | F6 | 12 | ALTA | ALTO |
| 04 | Fiscal / NCM | tax-service (NCM+DUIMP) | TRANSVERSAL | F4 | 8 | ALTA | BAIXO |
| 05 | Financeiro / Faturamento | billing-service | TRANSVERSAL | F7 | 20 | ALTA | ALTO |
| 06 | Logística / Rastreamento | logistics-service | TRANSVERSAL | F2 | 8 | ALTA | MÉDIO |
| 07 | Documentos / Digitalização | document-service | TRANSVERSAL | F3 | 6 | MÉDIA | BAIXO |
| 08 | Integrações Governamentais | gov-integration-service | AMBAS | F4 | 12 | ALTA | ALTO |
| 09 | Integrações com Clientes | client-integration-service | TRANSVERSAL | F4 | 8 | MÉDIA | MÉDIO |
| 10 | Comunicação / Notificações | notification-service | TRANSVERSAL | F2 | 4 | MÉDIA | BAIXO |
| 11 | Portal Web / Frontend | React SPA | AMBAS | F3 | 10 | ALTA | BAIXO |
| 12 | Identidade / Acesso | auth-service | TRANSVERSAL | F1 | 4 | CRÍTICA | MÉDIO |


> **Comparativo D02 — v1 vs. v2**
> v1: di-service | 20 semanas | Risco CRÍTICO — reimplementar PGDI (34 arquivos), SPs de cálculo, fórmulas de impostos
> v2: customs-service | 14 semanas | Risco MÉDIO — apenas DUIMP (fluxo Portal Único), SPs consultadas somente para histórico
> Economia: 6 semanas + risco fiscal crítico eliminado + período de validação paralela (3 meses) eliminado


# 2. Mapa de Dependências por Fase


| **Fase** | **Domínios / Serviços** | **Observação** |
| --- | --- | --- |
| F0 — Segurança | Rotação SA + contas de serviço + VPC AWS | Obrigatório — ambos os times antes de tudo |
| F1 — Fundação | D12 auth-service + PostgreSQL + Redis + API Gateway FastAPI + LangGraph | Base para todos os outros serviços |
| F2 — IA + Comunicação + Logística | 10 Agentes IA (incl. Ag09+Ag10) + D06 logistics-service + D10 notification-service | Agentes 09 e 10 entram aqui — entregam valor imediato |
| F3 — Portais Web + Documentos | D07 document-service + D11 React SPA + painéis analista por vertical | Times em paralelo a partir daqui |
| F4 — Integrações Externas | D08 gov-integration-service + D09 client-integration-service + D04 tax-service NCM | Time A: INTTRA/DU-E  \|  Time B: DUIMP/LI/Siscomex |
| F5 — Núcleo Importação (Time B) | D02 customs-service (DUIMP) + D01 process-service (parcial IMP) | 14 sem — DUIMP-only, sem DI legada |
| F6 — Núcleo Exportação (Time A) | D03 export-service + D01 process-service (parcial EXP) | 12 sem — Ag 09+10 já em produção desde F2 |
| F7 — Financeiro | D05 billing-service (ambos os times convergem) | 20 sem — NFS-e, Senior ERP, Wallet |
| F8 — Descomissionamento | Cutover gradual + portal ASP off + fine-tuning | 12 sem — mais simples sem PGDI |


# 3. Domínios Transversais


Os domínios transversais são compartilhados por ambas as verticais. Devem ser desenvolvidos nas fases iniciais, pois são dependências dos serviços especializados.

## D12 — Identidade / Acesso


| **D12 — IDENTIDADE / ACESSO**<br>auth-service (FastAPI + JWT)  \|  Vertical: TRANSVERSAL  \|  Fase: Fase 1  \|  4 semanas  \|  CRÍTICA  \|  Risco: MÉDIO<br>Autenticação, autorização, usuários, perfis, habilitações por cliente, controle de acesso por módulo. |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- mylogin.pas / mylogin.dll<br>- TUSUARIO, TUSUARIO_HABILITACAO<br>- TCLIENTE_HABILITACAO, TPERMISSAO<br>- PGSM (217 arquivos — cadastros e acesso)<br>- MYLOGIN.dbo.* (banco dedicado) | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **auth-service** **(****FastAPI** **+ JWT)**<br>**Endpoints** **principais:**<br>- POST /auth/login<br>- POST /auth/refresh<br>- GET /auth/me<br>- GET /auth/permissions<br>- POST /auth/users (admin)<br>- POST /auth/a3/sign (certificado digital A3)<br>**Tabelas PostgreSQL:**<br>- user<br>- organization<br>- customer_group<br>- customer_profile<br>**Depende de:**<br>- Fase 1 obrigatória — todos os outros serviços dependem do auth-service<br>- Suporte a certificado digital A3 (requisito DUIMP + DU-E) |
| 📌 NOTA: Usar mesmo JWT secret do mywebapi (2d013705c915) durante transição para tokens interoperáveis. Rotacionar apenas na Fase 8. |  |


## D06 — Logística / Rastreamento


| **D06 — LOGÍSTICA / RASTREAMENTO**<br>logistics-service (FastAPI + Celery Beat)  \|  Vertical: TRANSVERSAL  \|  Fase: Fase 2  \|  8 semanas  \|  ALTA  \|  Risco: MÉDIO<br>Rastreamento de navios, ETAs, CE-Mercante, AFRMM, entrega pós-desembaraço (TM). Porta o Agente 06. |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- edi.pas (BDE OBSOLETO — substituir primeiro!)<br>- edi_eventos.pas<br>- consultamercante.pas (RPA)<br>- myconsultaretornointtra.pas (SFTP)<br>- tmserviceapi (já existe como REST)<br>- TFOLLOWUP_ETAPA (~5M linhas, 500+ eventos) | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **logistics-service** **(****FastAPI** **+** **Celery** **Beat)**<br>**Endpoints** **principais:**<br>- GET /api/v1/logistics/{nr}/tracking<br>- POST /api/v1/logistics/{nr}/eta/update<br>- GET /api/v1/logistics/{nr}/ce-mercante<br>- GET /api/v1/logistics/{nr}/tm/delivery<br>**Tabelas PostgreSQL:**<br>- shipment<br>- container<br>- process_event (eventos logísticos)<br>- process (dt_desembaraco, dt_saida)<br>**Depende de:**<br>- Agente 06 (Rastreamento) + INTTRA API + CE-Mercante portado + tmserviceapi REST |
| 📌 NOTA: edi.pas usa BDE obsoleto — é o mais urgente de reescrever. Substituir por Python asyncio + FastAPI webhook na Fase 4. |  |


## D07 — Documentos / Digitalização


| **D07 — DOCUMENTOS / DIGITALIZAÇÃO**<br>document-service (FastAPI + S3 + pgvector)  \|  Vertical: TRANSVERSAL  \|  Fase: Fase 3  \|  6 semanas  \|  MÉDIA  \|  Risco: BAIXO<br>Gestão de documentos dos processos: upload, OCR, digitalização, armazenamento S3, busca semântica. |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- myfilemanager.pas<br>- mydigitalizacao.pas<br>- myinseredigitalizacao.pas<br>- GravaArquivoDigitalizacao.pas (vários módulos)<br>- Arquivos em disco — sem tabela própria<br>- Referências de paths em TPROCESSO | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **document-service** **(****FastAPI** **+ S3 +** **pgvector****)**<br>**Endpoints** **principais:**<br>- POST /api/v1/documents/{nr}/upload<br>- GET /api/v1/documents/{nr}/list<br>- POST /api/v1/documents/{nr}/ocr (Claude Vision)<br>- GET /api/v1/documents/search?q= (semântico)<br>- DELETE /api/v1/documents/{id}<br>**Tabelas PostgreSQL:**<br>- document (id, tipo, embedding vector(1536), extracted_fields JSONB, storage_path)<br>**Depende de:**<br>- AWS S3 + Claude Vision API + pgvector + Agente 02 (Ingestão) |
| 📌 NOTA: Serviço de baixo risco — arquivos ficam no S3, banco guarda apenas metadados e embeddings. Bom para começar o desenvolvimento frontend. |  |


## D09 — Integrações com Clientes


| **D09 — INTEGRAÇÕES COM CLIENTES**<br>client-integration-service (FastAPI + Celery)  \|  Vertical: TRANSVERSAL  \|  Fase: Fase 4  \|  8 semanas  \|  MÉDIA  \|  Risco: MÉDIO<br>Conectores SFTP/EDI/REST por cliente premium: BASF, Nestlé, Pirelli, Croda, AGC, Cebrace. |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- integracaobasf.pas (SFTP+SOAP)<br>- integracaobasfdoctos.pas<br>- myintegracaonestle.pas<br>- integracaopirelli.pas (SFTP libssh2)<br>- integracaocroda.pas<br>- integracaoagc.pas + integracaocebrace.pas | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **client-integration-service** **(****FastAPI** **+** **Celery****)**<br>**Endpoints** **principais:**<br>- POST /api/v1/integrations/basf/sync<br>- POST /api/v1/integrations/nestle/sync<br>- POST /api/v1/integrations/pirelli/sync<br>- GET /api/v1/integrations/{cliente}/status<br>**Tabelas PostgreSQL:**<br>- customer_service (config por cliente)<br>- process_event (eventos de integração)<br>**Depende de:**<br>- paramiko (SFTP) + suds-py3 (SOAP BASF) + process-service + Celery Beat (polling agendado) |
| 📌 NOTA: Cada cliente tem seu conector independente. Começar pelo BASF (maior volume) e Nestlé. Pirelli tem booking INTTRA no mesmo conector. |  |


## D10 — Comunicação / Notificações


| **D10 — COMUNICAÇÃO / NOTIFICAÇÕES**<br>notification-service (FastAPI + Celery)  \|  Vertical: TRANSVERSAL  \|  Fase: Fase 2  \|  4 semanas  \|  MÉDIA  \|  Risco: BAIXO<br>Notificações automáticas para clientes e equipe: push mobile, e-mail, multilingue PT/EN/ES. Porta o Agente 08. |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- mysendmail.dll (e-mail)<br>- InterfacesEmail.pas (vários módulos)<br>- mywebapi /Notificacao endpoint<br>- mywebapi /SetDevice endpoint<br>- TCLIENTE_SERVICO (preferências)<br>- MYINDAIA.dbo.dispositivos (tokens Firebase) | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **notification-service** **(****FastAPI** **+** **Celery****)**<br>**Endpoints** **principais:**<br>- POST /api/v1/notifications/send<br>- POST /api/v1/notifications/push<br>- GET /api/v1/notifications/{nr}/history<br>- POST /api/v1/devices/register (Firebase token)<br>**Tabelas PostgreSQL:**<br>- customer (firebase_token, idioma_preferido)<br>- process_event (source='agent')<br>**Depende de:**<br>- Firebase FCM (gcm_sender_id: 667613920608) + aiosmtplib + Claude API (mensagens) + Agente 08 |
| 📌 NOTA: Firebase já configurado no webapp. Token do dispositivo salvo via /SetDevice do mywebapi. Serviço de baixo risco — bom para começar. |  |


## D12 — Identidade / Acesso (ver acima) | D11 — Portal Web / Frontend


| **D11 — PORTAL WEB / FRONTEND**<br>React SPA (Next.js + TypeScript + Tailwind)  \|  Vertical: AMBAS  \|  Fase: Fase 3  \|  10 semanas  \|  ALTA  \|  Risco: BAIXO<br>Portal do cliente (React SPA) substituindo webapp PWA + portal ASP legado + portal ASPX. Painéis internos por vertical. |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- webapp/ (PWA Firebase — já moderno)<br>- Portal ASP legado (374 páginas .asp)<br>- followup_principal.aspx e outros ASPX<br>- Módulo MBF (dashboard KPIs)<br>- Portal multilingue PT/EN/ES | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **React** **SPA (Next.js +** **TypeScript** **+** **Tailwind****)**<br>**Endpoints** **principais:**<br>- Consome: process-service, customs-service, export-service<br>- Consome: logistics-service, document-service<br>- Consome: billing-service, notification-service<br>- Consome: AI service (chat com processo)<br>- Consome: mywebapi legado (durante transição)<br>**Tabelas PostgreSQL:**<br>- N/A — frontend não tem banco próprio; dados vêm dos serviços de negócio<br>**Depende de:**<br>- Todos os serviços Python acima + Firebase FCM + mywebapi (compatibilidade durante transição) |
| 📌 NOTA: Manter contrato de API do mywebapi durante transição: /ProcessosImpo, /ProcessosExpo, /ProcessosEmAndamento. Migrar cliente por cliente. |  |


# 4. Vertical Exportação (Time A)


Os domínios da vertical de Exportação cobrem: gestão de processos de exportação, DU-E, Draft B/L, Booking Marítimo (Agente 09) e Allocation MQC (Agente 10).

## D03 — Exportação / DU-E


| **D03 — EXPORTAÇÃO / DU-E**<br>export-service (FastAPI + Celery)  \|  Vertical: EXPORTAÇÃO  \|  Fase: Fase 6  \|  12 semanas  \|  ALTA  \|  Risco: ALTO<br>Processos de exportação: pedido, embarque, Draft B/L (INTTRA), DU-E, packing list, fatura comercial. Inclui Booking Service (Ag 09) e Allocation Service (Ag 10). |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- PGPE001-044.pas (44 arquivos)<br>- minibroker/FrmDraftBL.pas<br>- minibroker/FrIntegracaoDUE.pas<br>- minibrowser.pas (booking INTTRA RPA — migrar para API)<br>- uGerarArquivosDraft.pas<br>- TPROCESSO_EXP (124 cols)<br>- TPROCESSO_DRAFT_BL (83 cols)<br>- TBID (36 cols — contratos armadores MQC) | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **export-service** **(****FastAPI** **+** **Celery****)**<br>**Endpoints** **principais:**<br>- POST /api/v1/export/{nr}/booking (Agente 09)<br>- POST /api/v1/export/{nr}/draft-bl<br>- POST /api/v1/export/{nr}/due (A3 obrig.)<br>- POST /api/v1/export/{nr}/documents/invoice<br>- POST /api/v1/export/{nr}/documents/packing<br>- GET /api/v1/export/allocation/{armador}/saldo (Agente 10)<br>- GET /api/v1/export/allocation/dashboard<br>**Tabelas PostgreSQL:**<br>- process (cd_produto='02')<br>- bl_draft<br>- booking<br>- mq_contract<br>- allocation_tracking<br>- due_declaration<br>**Depende de:**<br>- process-service + minibroker REST (Draft B/L) + INTTRA API REST + Portal Único (DU-E) + Agente 07 + Agente 09 + Agente 10 |
| 📌 NOTA: Agentes 09 e 10 já em produção desde Fase 2. Fase 6 apenas expõe seus serviços via REST interno ao Export Service e adiciona AllocationDashboard React. |  |


# 5. Vertical Importação (Time B)


Os domínios da vertical de Importação cobrem: customs-service (DUIMP-only), fiscal NCM e integrações governamentais de importação.

> **⚠️ Escopo DUIMP-Only — Decisão v4.0**
> - DI Legada (PGDI — 34 arquivos) eliminada do escopo de reescrita
> - customs-service cobre apenas o fluxo DUIMP (Portal Único) — 14 semanas vs. 20 semanas originais
> - Dados históricos: TDECLARACAO_IMPORTACAO e TADICAO_DE_IMPORTACAO permanecem no SQL Server BROKER
> - View read-only v_di_historica no PostgreSQL para consultas e relatórios via pyodbc
> - sp_di_calculo e sp_calc_* consultadas apenas para leitura de histórico — não reescritas


## D02 — Importação / DUIMP


| **D02 — IMPORTAÇÃO / DUIMP**<br>customs-service (FastAPI + Celery)  \|  Vertical: IMPORTAÇÃO  \|  Fase: Fase 5  \|  14 semanas  \|  ALTA  \|  Risco: MÉDIO<br>Declaração de importação DUIMP: adições, mercadorias, parametrização LI, registro no Portal Único. DI legada somente como view read-only. |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- PGDI011.pas (registro DUIMP no Portal Único)<br>- PGDI019.pas (vinculação LI com adições)<br>- integracaoduimp.pas + duimpwebhook<br>- PGBK/PGLI 001-008.pas (LI)<br>- extratordadossiscomex (XML DUIMP)<br>- TDECLARACAO_IMPORTACAO (156 cols — READ-ONLY)<br>- TADICAO_DE_IMPORTACAO (177 cols — READ-ONLY)<br>- TDETALHE_MERCADORIA (88 cols) | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **customs-service** **(****FastAPI** **+** **Celery****)**<br>**Endpoints** **principais:**<br>- POST /api/v1/customs/{nr}/duimp/register (A3 obrig.)<br>- GET /api/v1/customs/{nr}/duimp/status<br>- POST /api/v1/customs/{nr}/duimp/additions<br>- POST /api/v1/customs/{nr}/li/transmit<br>- GET /api/v1/customs/{nr}/li/status<br>- GET /api/v1/customs/history/di/{nr} (read-only legado)<br>**Tabelas PostgreSQL:**<br>- duimp_declaration<br>- duimp_addition<br>- li_license<br>- merchandise_detail<br>- v_di_historica (VIEW read-only via pyodbc)<br>**Depende de:**<br>- auth-service (A3) + Portal Único mTLS Python + Agente 05 (Compliance/LI) + Agente 07 (registro DUIMP) |
| 📌 NOTA: ERA di-service (20 sem, risco CRÍTICO). AGORA customs-service (14 sem, risco MÉDIO). DI legada somente leitura — nunca reescrever SPs de cálculo. |  |


## D04 — Fiscal / NCM / Tributos


| **D04 — FISCAL / NCM / TRIBUTOS**<br>tax-service (FastAPI — NCM + consultas)  \|  Vertical: TRANSVERSAL  \|  Fase: Fase 4  \|  8 semanas  \|  ALTA  \|  Risco: BAIXO<br>Classificação NCM, consulta de alíquotas (TNCM), órgãos anuentes. NÃO reimplementa cálculo de impostos — lê resultado do Portal Único (DUIMP calcula). |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- sp_di_calculo (SP — READ-ONLY histórico)<br>- sp_calc_ii/ipi/icms/pis/cofins (READ-ONLY histórico)<br>- sp_li_calculo / sp_monta_li<br>- Funcoes.pas (CalculaPisCofinsICMS)<br>- TNCM (24 cols — alíquotas)<br>- TTRIBUTO<br>- TADICAO_DE_IMPORTACAO (campos tributários — READ-ONLY) | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **tax-service** **(****FastAPI** **— NCM + consultas)**<br>**Endpoints** **principais:**<br>- POST /api/v1/tax/ncm/classify (Agente 04)<br>- GET /api/v1/tax/ncm/{codigo}/aliquotas<br>- POST /api/v1/tax/drawback/transmit<br>- GET /api/v1/tax/ncm/history?cd_cliente= (few-shot)<br>**Tabelas PostgreSQL:**<br>- ncm<br>- ncm_tax<br>- addition (ai_ncm_sugerido, ai_ncm_confidence)<br>**Depende de:**<br>- Agente NCM (04) + Agente Compliance (05) + Portal Único (DUIMP retorna valores calculados) + TNCM via pyodbc |
| 📌 NOTA: v2.0: tax-service NÃO reimplementa SPs de cálculo. Portal Único (RFB) calcula os impostos da DUIMP. Python apenas consulta TNCM para classificação NCM e alíquotas de referência. |  |


# 6. Domínios Compartilhados Avançados


## D01 — Gestão de Processos


| **D01 — GESTÃO DE PROCESSOS**<br>process-service (FastAPI + SQLAlchemy)  \|  Vertical: TRANSVERSAL  \|  Fase: Fase 5/6  \|  16 semanas  \|  ALTA  \|  Risco: ALTO<br>Hub central do sistema. Gerencia o ciclo de vida completo de processos de importação e exportação. |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- PGGP001-059.pas (59 arquivos)<br>- KrGlobal.pas, KrQuery.pas<br>- DmGerenciamentoDeProcessos.pas<br>- Funcoes.pas, FuncoesExport.pas<br>- TPROCESSO (316 cols)<br>- TPROCESSO_EXP (124 cols)<br>- TESTAGIO_PROCESSO<br>- TREF_CLIENTE | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **process-service** **(****FastAPI** **+** **SQLAlchemy****)**<br>**Endpoints** **principais:**<br>- GET /api/v1/processes/{nr}<br>- POST /api/v1/processes<br>- PUT /api/v1/processes/{nr}/status<br>- GET /api/v1/processes?cliente=&status=<br>- POST /api/v1/processes/{nr}/duplicate<br>- GET /api/v1/processes/{nr}/timeline<br>**Tabelas PostgreSQL:**<br>- process<br>- process_event<br>- shipment<br>- container<br>**Depende de:**<br>- Fase 1 (PostgreSQL + FastAPI base) + auth-service + pyodbc BROKER (leitura TPROCESSO histórico) |
| 📌 NOTA: Reescrever PGGP primeiro — todos os outros serviços dependem dele. Manter sincronização com TPROCESSO durante transição (sync Python → SQL Server). |  |


## D08 — Integrações Governamentais


| **D08 — INTEGRAÇÕES GOVERNAMENTAIS**<br>gov-integration-service (FastAPI + Celery)  \|  Vertical: AMBAS  \|  Fase: Fase 4  \|  12 semanas  \|  ALTA  \|  Risco: ALTO<br>Portal Único RFB (mTLS), Siscomex (LI, câmbio, alíquotas), SDA Santos e Rio de Janeiro. Split por vertical na Fase 4. |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- apiproxyportalunico.pas (mTLS)<br>- duimpwebhook (webhooks DUIMP)<br>- integracaoduimp.pas<br>- robodue.pas (DU-E RPA)<br>- myprocessasda.pas (Santos + RJ)<br>- myparametrizacao*.pas (LI Siscomex)<br>- myconsultalilote.pas<br>- siscomex.pas (câmbio/alíquotas) | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **gov-integration-service** **(****FastAPI** **+** **Celery****)**<br>**Endpoints** **principais:**<br>- POST /api/v1/gov/duimp/transmit (A3) — Time B<br>- GET /api/v1/gov/duimp/{nr}/status — Time B<br>- POST /api/v1/gov/due/transmit (A3) — Time A<br>- POST /api/v1/gov/li/transmit — Time B<br>- POST /api/v1/gov/sda/transmit (Santos/RJ) — Ambos<br>- GET /api/v1/gov/siscomex/cambio — Ambos<br>**Tabelas PostgreSQL:**<br>- process (nr_due, cd_canal, nr_duimp)<br>- li_license<br>- ncm_tax (importada do Siscomex)<br>- due_declaration<br>- duimp_declaration<br>**Depende de:**<br>- httpx + ssl (mTLS) + certificados A3 Fabricio/Edgar/Vanessa/Mello/Cristiano/Luiz + Redis (queue transmissões) |
| 📌 NOTA: Toda transmissão ao governo exige fila (Redis/Celery) para retry automático. Webhooks do Portal Único devem ser idempotentes. |  |


## D05 — Financeiro / Faturamento


| **D05 — FINANCEIRO / FATURAMENTO**<br>billing-service (FastAPI + Celery)  \|  Vertical: TRANSVERSAL  \|  Fase: Fase 7  \|  20 semanas  \|  ALTA  \|  Risco: ALTO<br>Faturamento de serviços, NFS-e multi-município, pagamentos, numerário, cheques, integração Senior ERP. |  |
| --- | --- |
| **SISTEMA DELPHI (LEGADO)**<br>- PGFT001-024.pas (faturamento)<br>- PGPG001-032.pas (pagamentos)<br>- PGCH001-032.pas (cheques/caixa)<br>- PGNM001-013.pas (numerário)<br>- faturamentoerp.dll (Senior SOAP)<br>- ddenfse.dll (NFS-e multi-município)<br>- myatualizanffaturamento.pas<br>- Billing/ItemInvoiced/PaymentRequested (MYINDAIAV2) | **SISTEMA PYTHON (NOVO)**<br>**Serviço:** **billing-service** **(****FastAPI** **+** **Celery****)**<br>**Endpoints** **principais:**<br>- POST /api/v1/billing/{nr}/generate<br>- POST /api/v1/billing/{nr}/nfse/emit<br>- GET /api/v1/billing/{nr}/status<br>- POST /api/v1/payments/request<br>- POST /api/v1/cash/request (numerário)<br>- POST /api/v1/billing/senior/sync (SOAP)<br>**Tabelas PostgreSQL:**<br>- billing<br>- item_invoiced<br>- payment_requested<br>- cash_requested<br>- custom_clearance<br>**Depende de:**<br>- process-service + Senior ERP SOAP (suds-py3) + ddenfse portado (Python REST por município) + Wallet do minibroker |
| 📌 NOTA: Wallet do minibroker (16 módulos uWallet*) já tem a lógica de pagamentos em Delphi moderno — herdar estrutura de dados do MYINDAIAV2. |  |


# 7. Sequência de Implementação — 2 Times Paralelos


Esta é a ordem exata para contratar e planejar sprints. A partir do Sprint S07, os times trabalham em paralelo.

| **Sprint** | **Semanas** | **Time** | **Domínio / Serviço** | **O que habilita** |
| --- | --- | --- | --- | --- |
| S00 | 1–2 | AMBOS | Fase 0: Segurança — Rotação SA, VPC AWS, contas de serviço | Ambiente seguro para desenvolvimento |
| S01 | 3–10 | AMBOS | D12 auth-service + PostgreSQL+Redis+CI/CD + API Gateway FastAPI + LangGraph | Base técnica para todos os outros serviços |
| S02 | 11–13 | AMBOS | D10 notification-service + D06 logistics-service (Agente 06) | Rastreamento automático + notificações desde o início |
| S03 | 14–18 | AMBOS | Agentes IA transversais: Ag 01 (Orquestrador) + Ag 02 (Ingestão) + Ag 04 (NCM) | IA sobre o legado Delphi — sem substituir nada |
| S04 | 19–23 | TIME A | Ag 10 (Allocation/MQC) + Ag 09 (Booking) — Vertical Exportação | Booking automático + compliance MQC em tempo real |
| S05 | 21–26 | TIME B | Ag 03 (Verificação) + Ag 05 (Compliance/LI) — Vertical Importação | Verificação de acuracidade + órgãos anuentes automáticos |
| S06 | 27–34 | AMBOS | D07 document-service + D11 React SPA + painéis analista por vertical | Portal moderno para clientes e analistas |
| S07A | 35–46 | TIME A | D08 gov-integration (DU-E+INTTRA) + D03 export-service (início) | Portal Único para exportação + INTTRA API REST |
| S07B | 35–46 | TIME B | D08 gov-integration (DUIMP+LI) + D04 tax-service NCM | Portal Único para importação + Siscomex LI Python |
| S08A | 47–58 | TIME A | D03 export-service completo (PGPE 44 .pas) + Booking+Allocation React | PGPE completo em Python — agentes já em produção |
| S08B | 47–60 | TIME B | D02 customs-service (DUIMP completo) + view DI histórica | customs-service DUIMP — era 20 sem, agora 14 sem |
| S09 | 61–80 | AMBOS | D05 billing-service + D09 client-integration-service | Faturamento + NFS-e + BASF/Nestlé/Pirelli Python |
| S10 | 81–88 | AMBOS | D01 process-service completo + descomissionamento Delphi gradual | Sistema 100% Python — cutover final |


> **Documento gerado automaticamente — Domínios de Negócio** **Roadmap** **Python v2.0 | INDAIA COMEX AI-****First**
> Substitui o documento Dominios_Negocio_Roadmap_Python.docx.
> v2.0: DI Legada eliminada (D02 → customs-service, 14 sem), D03 inclui Booking+Allocation, verticais explicitadas em cada domínio.
