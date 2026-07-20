> **DIAGRAMA ER**
> **Novo Banco PostgreSQL**
> Sistema COMEX AI-First  |  INDAIA Logística Internacional
> Schema: comex  |  Banco: indaia_comex  |  Extensão: pgvector  |  v2.0  |  Março 2026


> **⚡ O que muda na v2.0**
> - Grupo DUIMP adicionado: tabelas duimp_declaration e duimp_addition (substitui tabelas DI legadas)
> - Grupo Exportação expandido: tabelas booking, mq_contract, allocation_tracking (Agentes 09 e 10)
> - Grupo DI Histórica: v_di_historica (VIEW read-only via pyodbc — TDECLARACAO + TADICAO são somente leitura)
> - Grupo Fiscal: addition e merchandise_detail agora usados principalmente para DUIMP (não DI legada)
> - Ordem de criação SQL atualizada para incluir novas tabelas


# 1. Mapa de Grupos de Tabelas


| **Grupo** | **Cor** | **Tabelas** | **Vertical** | **Origem no Legado** |
| --- | --- | --- | --- | --- |
| Processos | Azul | process, process_event, shipment, container, bl_draft | AMBAS | TPROCESSO, TPROCESSO_EXP, TFOLLOWUP_ETAPA, TPROCESSO_DRAFT_BL |
| DUIMP — Importação | Laranja | duimp_declaration, duimp_addition | IMPORTAÇÃO | NOVO (substitui DI legada no novo sistema) |
| DI Histórica (Read-Only) | Cinza claro | v_di_historica (VIEW pyodbc) | READ-ONLY | TDECLARACAO_IMPORTACAO, TADICAO_DE_IMPORTACAO — permanece no SQL Server BROKER |
| Exportação | Verde | due_declaration, booking, mq_contract, allocation_tracking | EXPORTAÇÃO | TPROCESSO_EXP, TBID — expandido com Ag 09+10 |
| Fiscal / NCM | Verde | ncm, ncm_tax, li_license, addition, merchandise_detail | IMPORTAÇÃO | TNCM, TADICAO_DE_IMPORTACAO (leitura), TDETALHE_MERCADORIA |
| Financeiro | Laranja | billing, item_invoiced, payment_requested, cash_requested, custom_clearance | AMBAS | MYINDAIAV2 (manter estrutura) |
| Clientes | Cinza | customer, customer_service, customer_group, customer_profile | AMBAS | TCLIENTE, TCLIENTE_SERVICO |
| Agentes IA | Roxo | agent_run, agent_decision, document, document_field | AMBAS | NOVO — sem equivalente no legado |
| Configuração / Infra | Cinza | organization, branch, user, event_code, confidence_threshold | AMBAS | TUNID_NEG, TUSUARIO, M10_DADOS |


# 2. Grupo: Processos (Azul)


## process — Tabela central


| **process**  — AMBAS (importação + exportação) |  |
| --- | --- |
| **CAMPOS** | PK  id                    UUID     DEFAULT uuid_generate_v4()<br>    nr_processo           VARCHAR(20)  UNIQUE NOT NULL  -- UUPPSS-NNNNNN-AA<br>    cd_unid_neg           CHAR(2)  NOT NULL  -- 01=Santos, 03=RJ<br>    cd_produto            CHAR(2)  NOT NULL  -- 01=imp, 02=exp, 06=frete<br>    cd_servico            CHAR(2)  NOT NULL  -- IM, EM, ER, FE, IA, EA<br>    cd_status             VARCHAR(20)  DEFAULT 'aberto'<br>    nr_conhecimento       VARCHAR(50)  -- BL / AWB<br>    nm_embarcacao         VARCHAR(100)<br>    dt_abertura           TIMESTAMPTZ  DEFAULT NOW()<br>    dt_embarque           TIMESTAMPTZ<br>    dt_desembaraco        TIMESTAMPTZ<br>    dt_desembaraco_prev   TIMESTAMPTZ<br>    dt_saida              TIMESTAMPTZ<br>    dt_saida_prev         TIMESTAMPTZ<br>    dt_entrega_prev       TIMESTAMPTZ<br>    cd_pais_origem        CHAR(4)<br>    cd_canal              CHAR(1)  -- 0=verde, 1=amarelo, 2=vermelho<br>    vl_cif_dolar          NUMERIC(15,2)<br>    vl_cif_real           NUMERIC(15,2)<br>    nr_duimp              VARCHAR(20)  -- número DUIMP registrada (v2.0)<br>    nr_due                VARCHAR(20)  -- número DU-E<br>    cd_incoterm           VARCHAR(10)<br>    ds_mercadoria         TEXT<br>    ai_confidence_score   NUMERIC(5,2)  DEFAULT 0<br>    ai_last_agent         VARCHAR(50)<br>    ai_requires_review    BOOLEAN  DEFAULT false<br>    ai_review_reason      TEXT<br>    created_at            TIMESTAMPTZ  DEFAULT NOW()<br>    updated_at            TIMESTAMPTZ  DEFAULT NOW()<br>FK  cd_cliente            INT  REFERENCES customer(id)<br>FK  cd_exportador         INT  REFERENCES customer(id)<br>FK  organization_id       UUID REFERENCES organization(id) |
| **ÍNDICES** | CREATE INDEX idx_process_nr ON process(nr_processo);<br>CREATE INDEX idx_process_cliente ON process(cd_cliente);<br>CREATE INDEX idx_process_status ON process(cd_status);<br>CREATE INDEX idx_process_produto ON process(cd_produto); |
| **FK / REL.** | process (1) ----< (N) process_event<br>process (1) ----< (N) shipment<br>process (1) ----< (N) duimp_declaration  [v2.0 — importação]<br>process (1) ----< (N) due_declaration    [v2.0 — exportação]<br>process (1) ----< (N) booking            [v2.0 — Agente 09]<br>process (1) ----< (N) bl_draft<br>process (1) ----< (N) document<br>process (1) ----< (N) agent_run |


## process_event + shipment + container + bl_draft


| **Tabela** | **Campos Principais** | **Legado** |
| --- | --- | --- |
| process_event | id UUID, process_id FK, cd_evento VARCHAR(10), ds_evento TEXT, dt_evento TIMESTAMPTZ, source VARCHAR(20) (agent/manual/edi), agent_name VARCHAR(50), data JSONB | TFOLLOWUP_ETAPA (~5M linhas, 500+ códigos) |
| shipment | id UUID, process_id FK, nr_voyage VARCHAR(50), nm_vessel VARCHAR(100), cd_armador VARCHAR(10), cd_booking VARCHAR(50), cd_port_load CHAR(5), cd_port_disc CHAR(5), dt_eta, dt_etd, dt_arrival, cd_ce_mercante VARCHAR(30), vl_frete_total, vl_afrmm | TPROCESSO (campos navio/ETA) |
| container | id UUID, shipment_id FK, process_id FK, nr_cntr VARCHAR(15) NOT NULL, tp_cntr VARCHAR(10) (20DC/40HC), nr_lacre VARCHAR(30), vl_peso_bruto, vl_tara, dt_entrada, dt_saida, nm_terminal VARCHAR(100) | TPROCESSO_EXP (campos container) |
| bl_draft | id UUID, process_id FK, nr_amend INT DEFAULT 0, cd_envio_inttra VARCHAR(50), cd_agente_inttra VARCHAR(10), cd_booking_armador VARCHAR(50), nm_navio VARCHAR(100), local_embarque, local_desembarque, status VARCHAR(20) (rascunho/enviado/confirmado), created_by | TPROCESSO_DRAFT_BL (83 cols) |


# 3. Grupo: DUIMP — Importação (Laranja) — NOVO v2.0


Tabelas criadas especificamente para o fluxo DUIMP no novo sistema. Substituem funcionalmente o que seria implementado na DI legada, mas com escopo e estrutura adequados ao Portal Único.

## duimp_declaration


| **duimp_declaration**  — IMPORTAÇÃO |  |
| --- | --- |
| **CAMPOS** | PK  id                    UUID     DEFAULT uuid_generate_v4()<br>    nr_duimp              VARCHAR(20)  -- número DUIMP no Portal Único<br>    cd_canal              VARCHAR(10)  -- verde/amarelo/vermelho/cinza<br>    cd_status             VARCHAR(20)  -- 10=Registrada, 20=Parametrizada, 50=Desembaraçada<br>    dt_registro           TIMESTAMPTZ<br>    dt_parametrizacao     TIMESTAMPTZ<br>    dt_desembaraco        TIMESTAMPTZ<br>    cd_despachante        VARCHAR(10)  -- 001=Fabricio, 031=Edgar, etc.<br>    xml_payload           TEXT         -- XML enviado ao Portal Único<br>    xml_retorno           TEXT         -- XML de retorno do Portal Único<br>    fl_aprovacao_humana   BOOLEAN  DEFAULT false  -- A3 obrigatório<br>    nm_aprovador          VARCHAR(100)<br>    dt_aprovacao          TIMESTAMPTZ<br>    created_at            TIMESTAMPTZ  DEFAULT NOW()<br>    updated_at            TIMESTAMPTZ  DEFAULT NOW()<br>FK  process_id            UUID REFERENCES process(id) |
| **ÍNDICES** | CREATE INDEX idx_duimp_process ON duimp_declaration(process_id);<br>CREATE INDEX idx_duimp_nr ON duimp_declaration(nr_duimp);<br>CREATE INDEX idx_duimp_status ON duimp_declaration(cd_status); |
| **FK / REL.** | process (1) ----< (N) duimp_declaration<br>duimp_declaration (1) ----< (N) duimp_addition |


## duimp_addition


| **duimp_addition**  — IMPORTAÇÃO |  |
| --- | --- |
| **CAMPOS** | PK  id                    UUID     DEFAULT uuid_generate_v4()<br>    nr_adicao             INT      NOT NULL<br>    cd_ncm                CHAR(8)  NOT NULL<br>    ds_mercadoria         TEXT<br>    cd_regime_tributar    CHAR(2)<br>    cd_acordo_aladi       VARCHAR(10)<br>    cd_pais_origem        CHAR(4)<br>    cd_pais_aquisicao     CHAR(4)<br>    vl_vmle_dolar         NUMERIC(15,2)<br>    vl_vmld_dolar         NUMERIC(15,2)<br>    cd_org_anuente        VARCHAR(100)  -- Anvisa, Mapa, etc.<br>    nr_li                 VARCHAR(20)   -- LI vinculada<br>    vl_ii                 NUMERIC(15,2)  -- calculado pela RFB (Portal Único)<br>    vl_ipi                NUMERIC(15,2)  -- calculado pela RFB<br>    vl_pis                NUMERIC(15,2)  -- calculado pela RFB<br>    vl_cofins             NUMERIC(15,2)  -- calculado pela RFB<br>    vl_icms               NUMERIC(15,2)  -- calculado pela RFB<br>FK  duimp_id              UUID REFERENCES duimp_declaration(id)<br>FK  process_id            UUID REFERENCES process(id) |
| **ÍNDICES** | CREATE INDEX idx_duimp_add_duimp ON duimp_addition(duimp_id);<br>CREATE INDEX idx_duimp_add_ncm ON duimp_addition(cd_ncm); |
| **FK / REL.** | duimp_declaration (1) ----< (N) duimp_addition<br>Impostos calculados pela RFB (Portal Único) — não recalcular no Python |


## v_di_historica — VIEW Read-Only


> **VIEW read-only — DI Histórica (SQL Server BROKER via pyodbc)**
> Esta VIEW não é uma tabela PostgreSQL nativa. É uma view materializada ou consulta via pyodbc que espelha
> TDECLARACAO_IMPORTACAO e TADICAO_DE_IMPORTACAO do SQL Server BROKER para consultas e relatórios.
> 
> -- Acesso via SQLAlchemy + pyodbc:
> -- engine_broker = create_engine('mssql+pyodbc://readonly:pass@INDAIA10/BROKER')
> -- SELECT NR_PROCESSO, NR_DI, DT_REGISTRO, CD_CANAL, ... FROM TDECLARACAO_IMPORTACAO (NOLOCK) WHERE ...
> 
> Campos disponíveis para leitura: NR_DI, DT_REGISTRO, CD_CANAL, NR_DUIMP (se já migrado), CD_DESPACHANTE
> NUNCA escrever nestas tabelas pelo Python. NUNCA reescrever sp_di_calculo ou sp_calc_* em Python.


# 4. Grupo: Exportação (Verde) — Inclui Agentes 09 e 10


## due_declaration


| **due_declaration**  — EXPORTAÇÃO |  |
| --- | --- |
| **CAMPOS** | PK  id                    UUID     DEFAULT uuid_generate_v4()<br>    nr_due                VARCHAR(20)  -- número DU-E no Portal Único<br>    cd_status             VARCHAR(5)   -- 10=Registrada, 20=Canal Verde, 70=Averbada, 80=Cancelada<br>    dt_registro           TIMESTAMPTZ<br>    dt_averbacao          TIMESTAMPTZ<br>    cd_despachante        VARCHAR(10)<br>    xml_payload           TEXT         -- XML enviado (ClassesXMLDUE)<br>    xml_retorno           TEXT         -- retorno Portal Único<br>    fl_aprovacao_humana   BOOLEAN  DEFAULT false  -- A3 obrigatório<br>    nm_aprovador          VARCHAR(100)<br>    tp_integracao         VARCHAR(30)  -- idEnviar/idRetificarCargaAntecipada/idRetificarNormal<br>    created_at            TIMESTAMPTZ  DEFAULT NOW()<br>FK  process_id            UUID REFERENCES process(id) |
| **ÍNDICES** | CREATE INDEX idx_due_process ON due_declaration(process_id);<br>CREATE INDEX idx_due_nr ON due_declaration(nr_due);<br>CREATE INDEX idx_due_status ON due_declaration(cd_status); |
| **FK / REL.** | process (1) ----< (N) due_declaration |


## booking — Agente 09 (NOVO)


| **booking**  — EXPORTAÇÃO — Agente 09 |  |
| --- | --- |
| **CAMPOS** | PK  id                    UUID     DEFAULT uuid_generate_v4()<br>    nr_booking_inttra     VARCHAR(50)  -- número booking INTTRA (provisório)<br>    nr_booking_armador    VARCHAR(50)  -- número booking definitivo do armador<br>    cd_armador            VARCHAR(10)  -- MAERSK/MSC/CMA/HAPAG<br>    cd_armador_inttra     VARCHAR(10)  -- código INTTRA (0023/0031/0624/0338)<br>    pol                   VARCHAR(5)   -- Port of Loading<br>    pod                   VARCHAR(5)   -- Port of Discharge<br>    nm_navio              VARCHAR(100)<br>    nr_voyage             VARCHAR(50)<br>    dt_cy_opening         TIMESTAMPTZ  -- CY opening date<br>    dt_vgm_cutoff         TIMESTAMPTZ  -- VGM cutoff<br>    dt_si_cutoff          TIMESTAMPTZ  -- Shipping Instruction cutoff<br>    dt_etd                TIMESTAMPTZ  -- Estimated Time of Departure<br>    dt_eta                TIMESTAMPTZ  -- Estimated Time of Arrival<br>    cd_status             VARCHAR(20)  -- provisorio/confirmado/recusado/alterado<br>    tp_container          VARCHAR(10)  -- 20DC/40DC/40HC/REEF<br>    qt_containers         INT<br>    fl_confirmado         BOOLEAN  DEFAULT false<br>    dt_submissao          TIMESTAMPTZ<br>    dt_confirmacao        TIMESTAMPTZ<br>    ds_motivo_recusa      TEXT<br>    created_at            TIMESTAMPTZ  DEFAULT NOW()<br>FK  process_id            UUID REFERENCES process(id)<br>FK  mq_contract_id        UUID REFERENCES mq_contract(id)  -- allocation vinculada |
| **ÍNDICES** | CREATE INDEX idx_booking_process ON booking(process_id);<br>CREATE INDEX idx_booking_armador ON booking(cd_armador);<br>CREATE INDEX idx_booking_status ON booking(cd_status); |
| **FK / REL.** | process (1) ----< (N) booking<br>mq_contract (1) ----< (N) booking<br>booking (1) ----< (N) allocation_tracking |


## mq_contract — Contratos MQC — Agente 10 (NOVO)


| **mq_contract**  — EXPORTAÇÃO — Agente 10 |  |
| --- | --- |
| **CAMPOS** | PK  id                    UUID     DEFAULT uuid_generate_v4()<br>    cd_armador            VARCHAR(10)  NOT NULL<br>    nm_armador            VARCHAR(100)<br>    pol                   VARCHAR(5)   NOT NULL  -- porto de embarque<br>    pod                   VARCHAR(5)   NOT NULL  -- porto de destino<br>    dt_inicio             DATE  NOT NULL<br>    dt_fim                DATE  NOT NULL<br>    vl_teus_comprometidos NUMERIC(10,2)  NOT NULL  -- MQC total<br>    vl_teus_mensais       NUMERIC(10,2)  -- MQC por mês (se escalonado)<br>    vl_teus_realizados    NUMERIC(10,2)  DEFAULT 0  -- bookings confirmados<br>    vl_teus_projetados    NUMERIC(10,2)  DEFAULT 0  -- pipeline + confirmados<br>    pct_compliance        NUMERIC(5,2)  DEFAULT 0  -- % utilizado<br>    cd_nivel_alerta       VARCHAR(20)  -- NORMAL/ATENCAO/ALERTA/CRITICO/SOBRE_USO<br>    fl_alerta_ativo       BOOLEAN  DEFAULT false<br>    vl_penalidade_shortfall NUMERIC(15,2)  -- penalidade estimada<br>    ds_observacoes        TEXT<br>    updated_at            TIMESTAMPTZ  DEFAULT NOW()<br>FK  customer_id           UUID REFERENCES customer(id)  -- cliente INDAIA |
| **ÍNDICES** | CREATE INDEX idx_mqc_armador ON mq_contract(cd_armador);<br>CREATE INDEX idx_mqc_periodo ON mq_contract(dt_inicio, dt_fim);<br>CREATE INDEX idx_mqc_alerta ON mq_contract(fl_alerta_ativo); |
| **FK / REL.** | mq_contract (1) ----< (N) booking<br>mq_contract (1) ----< (N) allocation_tracking |


## allocation_tracking — Rastreamento de Alocação — Agente 10 (NOVO)


| **allocation_tracking**  — EXPORTAÇÃO — Agente 10 |  |
| --- | --- |
| **CAMPOS** | PK  id                    UUID     DEFAULT uuid_generate_v4()<br>    tp_operacao           VARCHAR(10)  -- DEBIT/CREDIT/CANCEL<br>    vl_teus               NUMERIC(10,2)  NOT NULL<br>    ds_motivo             TEXT<br>    nr_booking_ref        VARCHAR(50)  -- referência do booking<br>    created_at            TIMESTAMPTZ  DEFAULT NOW()<br>FK  mq_contract_id        UUID REFERENCES mq_contract(id)<br>FK  booking_id            UUID REFERENCES booking(id)<br>FK  process_id            UUID REFERENCES process(id) |
| **ÍNDICES** | CREATE INDEX idx_alloc_contract ON allocation_tracking(mq_contract_id); |
| **FK / REL.** | mq_contract (1) ----< (N) allocation_tracking |


# 5. Grupo: Fiscal / NCM (Verde Escuro)


| **Tabela** | **Campos Principais** | **Legado / Observação** |
| --- | --- | --- |
| ncm | PK id UUID, cd_ncm CHAR(8) UNIQUE NOT NULL, ds_ncm TEXT, cd_capitulo CHAR(2), cd_posicao CHAR(4), in_li BOOLEAN, in_drawback BOOLEAN, nm_orgao_anuente VARCHAR(200), in_ativo BOOLEAN, updated_at TIMESTAMPTZ | TNCM (24 cols de alíquotas) |
| ncm_tax | PK id UUID, cd_ncm CHAR(8) NOT NULL, cd_pais_origem CHAR(4), cd_acordo VARCHAR(10) (ALADI/MERCOSUL), pc_aliq_ii NUMERIC(7,4), pc_aliq_ipi, pc_aliq_pis, pc_aliq_cofins, pc_aliq_icms, cd_uf_destino CHAR(2), dt_vigencia DATE | TNCM (alíquotas — importadas do Siscomex) |
| li_license | PK id UUID, process_id FK, ncm_id FK, nr_registro_li VARCHAR(20), dt_registro DATE, dt_validade DATE, tp_licenciamento VARCHAR(20) (automatico/nao-automatico), nm_orgao VARCHAR(100), cd_status VARCHAR(20), li_substitutivo VARCHAR(20) | PGBK/PGLI — myparametrizacaoli |
| addition | PK id UUID, process_id FK, ncm_id FK, nr_adicao INT NOT NULL, cd_regime_tributar CHAR(2), cd_acordo_aladi VARCHAR(10), cd_pais_origem CHAR(4), vl_vmle_dolar NUMERIC(15,2), vl_ii/ipi/pis/cofins/icms NUMERIC(15,2), ai_ncm_sugerido CHAR(8), ai_ncm_confidence NUMERIC(5,2) | TADICAO_DE_IMPORTACAO (177 cols — adaptado para DUIMP) |
| merchandise_detail | PK id UUID, process_id FK, addition_id FK, nr_item INT NOT NULL, ds_mercadoria TEXT, ds_mercadoria_en TEXT, qt_comercial NUMERIC(15,5), cd_unid_comercial VARCHAR(10), vl_peso_liquido, vl_peso_bruto, vl_unitario_dolar, vl_total_dolar | TDETALHE_MERCADORIA (88 cols) |


# 6. Grupo: Financeiro (Laranja) — Compatibilidade MYINDAIAV2


Manter compatibilidade total com MYINDAIAV2. Migrar as mesmas tabelas para PostgreSQL sem alterar nomes de campos. O minibroker Aurelius ORM lê/escreve neste banco.

| **Tabela MYINDAIAV2** | **Tabela PostgreSQL** | **Campos Chave** | **Notas** |
| --- | --- | --- | --- |
| Billing | billing | id UUID, process_id FK, customer_id FK, akey VARCHAR(50) (chave Senior), type VARCHAR(30), status VARCHAR(20), due_date TIMESTAMPTZ, total NUMERIC(15,2), ir, cofins, senior_key, created TIMESTAMPTZ | Capa da fatura — manter campos akey, dueDate, invoiceReceiverType |
| ItemInvoiced | item_invoiced | id UUID, billing_id FK, price NUMERIC(15,2), name VARCHAR(200), senior_key VARCHAR(50), type VARCHAR(30) | Itens da fatura |
| PaymentRequested | payment_requested | id UUID, billing_id FK, process_id FK, senior_key VARCHAR(50), senior_subkey, received_date, status VARCHAR(20), valor NUMERIC(15,2), tipo VARCHAR(30), destino VARCHAR(100) | Pagamentos — seniorKey, seniorsubkey |
| CashRequested | cash_requested | id UUID, billing_id FK, process_id FK, tipo VARCHAR(30), status VARCHAR(20), valor NUMERIC(15,2), cidade VARCHAR(100), data_solicitacao TIMESTAMPTZ | Numerários |
| CustomClearance | custom_clearance | id UUID, customer_id FK, branch_id FK, nr_processo VARCHAR(20), cd_servico VARCHAR(10), status VARCHAR(20), valor_total NUMERIC(15,2), senior_ref VARCHAR(50) | Processo financeiro |


# 7. Grupo: Agentes de IA (Roxo)


## document — Documentos com embedding semântico


| **document**  — AMBAS — Agente 02 |  |
| --- | --- |
| **CAMPOS** | PK  id                    UUID     DEFAULT uuid_generate_v4()<br>    tipo                  VARCHAR(50)  NOT NULL  -- Invoice/PackingList/BL/CE-Mercante/DUIMP/DU-E<br>    filename              VARCHAR(255)<br>    content_text          TEXT   -- texto extraído (OCR Claude Vision)<br>    embedding             vector(1536)  -- busca semântica pgvector<br>    extracted_fields      JSONB  -- campos extraídos pelo Agente 02<br>    confidence_score      NUMERIC(5,2)<br>    ocr_engine            VARCHAR(50)  -- claude-vision/tesseract<br>    file_size_bytes       INT<br>    mime_type             VARCHAR(100)<br>    storage_path          VARCHAR(500)  -- S3 path<br>    created_at            TIMESTAMPTZ  DEFAULT NOW()<br>FK  process_id            UUID REFERENCES process(id) |
| **ÍNDICES** | CREATE INDEX idx_doc_process ON document(process_id);<br>CREATE INDEX idx_doc_tipo ON document(tipo);<br>CREATE INDEX idx_doc_embed ON document USING hnsw (embedding vector_cosine_ops); |
| **FK / REL.** | process (1) ----< (N) document<br>agent_run (1) ----< (N) document  [documentos processados neste run] |


## agent_run + confidence_threshold


| **Tabela** | **Campos Principais** | **Observação** |
| --- | --- | --- |
| agent_run | id UUID, process_id FK, agent_name VARCHAR(50) NOT NULL, status VARCHAR(20) (running/completed/failed/waiting), input_data JSONB, output_data JSONB, confidence NUMERIC(5,2), required_human BOOLEAN, human_decision VARCHAR(20) (approved/rejected), human_by VARCHAR(100), human_at TIMESTAMPTZ, duration_ms INT, llm_tokens INT, llm_cost_usd NUMERIC(10,6), error_message TEXT, created_at TIMESTAMPTZ | Auditoria de cada execução de agente — base do Langfuse local |
| confidence_threshold | id UUID, agent_name VARCHAR(50) NOT NULL, action_type VARCHAR(50) NOT NULL, threshold_min NUMERIC(5,2) NOT NULL, threshold_max NUMERIC(5,2), action_below VARCHAR(50) (human_review/reject/alert), action_above VARCHAR(50) (auto_approve/proceed), is_active BOOLEAN, notes TEXT | Configuração de thresholds por tipo de ação — sem alterar código |


# 8. Grupo: Configuração / Infra (Cinza)


| **Tabela** | **Campos Principais** | **Legado** |
| --- | --- | --- |
| customer | id UUID, cd_cliente INT UNIQUE, nm_cliente VARCHAR(200) NOT NULL, nr_cnpj_cpf VARCHAR(20), tp_pessoa CHAR(1), nm_fantasia, ds_email, idioma_preferido CHAR(2) DEFAULT 'PT', firebase_token VARCHAR(500), in_ativo BOOLEAN, organization_id FK | TCLIENTE — sincronizado via cd_cliente |
| customer_service | id UUID, customer_id FK, cd_servico VARCHAR(10), in_ativo BOOLEAN, configuracoes JSONB, integracao_tipo VARCHAR(50) (SFTP/REST/EDI), sftp_host, sftp_user | TCLIENTE_SERVICO — configurações por cliente |
| organization | id UUID, nm_organizacao VARCHAR(200) NOT NULL, cd_cnpj VARCHAR(20), tp_organizacao VARCHAR(30), cd_unid_neg CHAR(2), nm_cidade, cd_estado, in_ativo BOOLEAN | TUNID_NEG — unidades de negócio |
| user | id UUID, organization_id FK, nm_usuario VARCHAR(100), cd_login VARCHAR(50) UNIQUE, ds_email VARCHAR(200), cd_cargo VARCHAR(20), in_ativo BOOLEAN, jwt_sub VARCHAR(200) | TUSUARIO — compatibilidade JWT |
| event_code | id UUID, cd_evento VARCHAR(10) UNIQUE NOT NULL, ds_evento TEXT, tp_categoria VARCHAR(50), acoes_automaticas JSONB | TFOLLOWUP_ETAPA — catálogo de ~500 eventos |


# 9. Relacionamentos — Diagrama de Dependências


> **NÚCLEO CENTRAL**
> process (1) ----< (N) process_event
> process (1) ----< (N) shipment
> shipment (1) ---< (N) container
> process (1) ----< (N) bl_draft
> process (1) ----< (N) document
> process (1) ----< (N) agent_run


```
**IMPORTAÇÃO (DUIMP) — v2.0**
process (1) ----< (N) duimp_declaration
duimp_declaration (1) ----< (N) duimp_addition
process (1) ----< (N) addition  [para NCM/compliance]
addition (1) ---< (N) merchandise_detail
process (1) ----< (N) li_license
ncm (1) --------< (N) ncm_tax
ncm (1) --------< (N) addition [via ncm_id]
ncm (1) --------< (N) li_license [via ncm_id]
DI Histórica: v_di_historica (VIEW read-only via pyodbc → SQL Server BROKER)
```


```
**EXPORTAÇÃO (DU-E + BOOKING + ALLOCATION) — v2.0**
process (1) ----< (N) due_declaration
process (1) ----< (N) booking  [Agente 09]
mq_contract (1) ----< (N) booking  [allocation vinculada]
booking (1) ----< (N) allocation_tracking  [Agente 10]
mq_contract (1) ----< (N) allocation_tracking
```


> **FINANCEIRO**
> process (1) ----< (1) billing  [1:1 ou 1:N por processo]
> billing (1) ---< (N) item_invoiced
> billing (1) ---< (N) payment_requested
> billing (1) ---< (N) cash_requested
> customer (1) ---< (N) custom_clearance


```
**CLIENTES**
customer (1) ---< (N) process [cd_cliente]
customer (1) ---< (N) customer_service
organization (1) ---< (N) customer
organization (1) ---< (N) user
```


# 10. Ordem de Criação SQL (respeitar FKs)


| **Ordem** | **Tabela(s)** | **Dependência** |
| --- | --- | --- |
| 1 | organization, branch, user | — |
| 2 | customer, customer_service, customer_group, customer_profile | organization |
| 3 | ncm, ncm_tax, event_code, confidence_threshold | — |
| 4 | process | customer, organization |
| 5 | process_event, shipment, container, bl_draft | process |
| 6 | addition, merchandise_detail | process, ncm |
| 7 | li_license | process, ncm |
| 8 | duimp_declaration | process  [NOVO v2.0] |
| 9 | duimp_addition | duimp_declaration  [NOVO v2.0] |
| 10 | due_declaration | process  [NOVO v2.0] |
| 11 | mq_contract | customer  [NOVO v2.0 — Agente 10] |
| 12 | booking | process, mq_contract  [NOVO v2.0 — Agente 09] |
| 13 | allocation_tracking | mq_contract, booking  [NOVO v2.0 — Agente 10] |
| 14 | billing, item_invoiced, payment_requested, cash_requested, custom_clearance | process, customer |
| 15 | document | process |
| 16 | agent_run | process |
| 17 | VIEW v_di_historica (pyodbc) | SQL Server BROKER — read-only |
| 18 | Índices críticos + HNSW embedding | Após todas as tabelas |


> **Nota sobre Migração**
> O banco BROKER (SQL Server) NÃO é migrado de uma vez. O PostgreSQL novo recebe dados via API durante a operação.
> Usar tabela 'process' com campo 'nr_processo' como chave de sincronização com o Delphi legado.
> Consultas de contexto histórico continuam indo ao BROKER via pyodbc (somente leitura).
> DI histórica: TDECLARACAO_IMPORTACAO e TADICAO_DE_IMPORTACAO ficam no SQL Server — nunca migrar.


> **Documento gerado automaticamente — Diagrama ER PostgreSQL COMEX AI v2.0 | INDAIA**
> Substitui DiagramaER_PostgreSQL_COMEX_AI.docx.
> v2.0: adiciona tabelas duimp_declaration, duimp_addition, booking, mq_contract, allocation_tracking;
> adiciona VIEW v_di_historica (read-only); remove grupo DI legada como tabelas nativas.
