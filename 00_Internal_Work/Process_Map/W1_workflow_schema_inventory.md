# W1 — Workflow schema inventory

**Generated deterministically** from the BROKER metadata CSVs (Python `csv` module). 
Every row below is a direct read of the source; nothing here is inferred.

- Tables in `Schema_Completo_BROKER.csv`: **1204**
- Declared foreign keys in `relacionamento_tabelas_BROKER.csv`: **80**
- Final table set: **40** (33 seed, 7 expanded)
- Seed tables NOT FOUND in schema: T_EVENTO_BASE, TIPO_EVENTO

> **Only 80 declared foreign keys for 1204 tables (6.64%).** Relational integrity in `BROKER` is overwhelmingly *conventional*, not *enforced*. Part 3 (column-name concordance) is therefore the real relationship map, and any migration that assumes declared FKs describe the model will be wrong.


## Part 1 — Final table set

| Table | Origin | Cols | PK cols |
|---|---|--:|---|
| `ACORDO_COMERCIAL` | EXPANDED (via FK_TIPOACORDOCOEMRCIAL_ID) | 7 | ID |
| `DEVICE_MESSAGE` | EXPANDED (via FK_DEVICE_MESSAGE_PROCESSO) | 6 | ID |
| `DEVICE_NOTIFICATION` | EXPANDED (via FK_DEVICE_NOTIFICATION_PROCESSO) | 4 | ID |
| `TCARGO` | SEED | 12 | CD_CARGO |
| `TCARGO_SISTEMAS` | EXPANDED (via FK_CD_CARGO) | 3 | CD_SISTEMA, CD_CARGO |
| `TCLIENTE_SERVICO` | SEED | 19 | CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO |
| `TDECLARACAO_IMPORTACAO` | SEED | 156 | NR_PROCESSO |
| `TETAPA` | SEED | 10 | CD_ETAPA |
| `TETAPAS_DESPACHO` | SEED | 2 | **none** |
| `TETAPA_AUTOMATICA_ORDENA` | SEED | 4 | **none** |
| `TETAPA_OLD` | SEED | 3 | CD_ETAPA |
| `TETAPA_PRODUTO` | SEED | 4 | CD_ETAPA |
| `TETAPA_PRODUTO_EVENTO` | SEED | 2 | CD_ETAPA, CD_EVENTO |
| `TEVENTO` | SEED | 39 | CD_EVENTO |
| `TEVENTO_ATZ` | SEED | 1 | **none** |
| `TEVENTO_AUTOMATICO` | SEED | 6 | **none** |
| `TEVENTO_PO` | SEED | 6 | CD_EVENTO |
| `TFATORES` | EXPANDED (via TFATORES_TFATORES_SERVICO_EVENTO) | 16 | CD_FATOR |
| `TFATORES_EVENTO` | SEED | 11 | CD_FATOR, CD_EVENTO, CD_SERVICO |
| `TFATORES_SERVICOS` | EXPANDED (via TFATORES_SERVICOS_TFATORES) | 2 | CD_FATOR, CD_SERVICO |
| `TFOLLOWUP` | SEED | 25 | NR_PROCESSO, CD_SERVICO, CD_EVENTO |
| `TFOLLOWUP_ETAPA` | SEED | 7 | CD_UNID_NEG, CD_PRODUTO, NR_PROCESSO, CD_FOLLOWUP_ETAPA |
| `TFOLLOWUP_IGNORE_TRIGGERS` | SEED | 2 | **none** |
| `TFOLLOWUP_TMP` | SEED | 22 | **none** |
| `TMOD_FOLLOW_UP_EVENTO` | SEED | 3 | CD_FOLLOW_UP, CD_EVENTO |
| `TPROCESSO` | SEED | 316 | NR_PROCESSO |
| `TPROCESSO_EXP` | SEED | 124 | NR_PROCESSO |
| `TPROCESSO_FATORES_EVENTO` | SEED | 9 | **none** |
| `TPRODUTO` | SEED | 8 | CD_PRODUTO |
| `TREL_DESVIOS_EVENTOS` | SEED | 10 | **none** |
| `TSERVICO` | SEED | 32 | CD_SERVICO |
| `TSERVICO_CLASSIFICACAO` | SEED | 2 | CD_CLASSIFICACAO |
| `TSERVICO_EVENTO` | SEED | 11 | CD_SERVICO, CD_EVENTO |
| `TSERVICO_EVENTO_NOVO` | SEED | 11 | CD_SERVICO, CD_EVENTO |
| `TSERVICO_NOVO` | SEED | 32 | CD_SERVICO |
| `TSETOR` | SEED | 2 | **none** |
| `TSISTEMAS` | EXPANDED (via FK_CD_SISTEMA) | 4 | CD_SISTEMA |
| `TTP_TIPO_EVENTO` | SEED | 2 | CD_TIPO_EVENTO |
| `TUNID_NEG` | SEED | 40 | CD_UNID_NEG |
| `TUNID_NEG_PRODUTO` | SEED | 10 | CD_UNID_NEG, CD_PRODUTO |

## Part 2 — Per-table detail

### `ACORDO_COMERCIAL`

Columns: 7

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| ID | int | 10.0,0.0 | NO |  | SIM |
| ACORDO | varchar | 30.0 | YES |  | NAO |
| ACRONIMO | varchar | 10.0 | YES |  | NAO |
| FORM_SISCOD | varchar | 10.0 | YES |  | NAO |
| FORM_CACB | varchar | 10.0 | YES |  | NAO |
| DESCRICAO | varchar | 255.0 | YES |  | NAO |
| FIESP_ID | int | 10.0,0.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** `FK_ACORDO_COMERCIAL`: `ACORDO_COMERCIAL_PAISES`.ACORDO_COMERCIAL_ID →; `FK_TIPOACORDOCOEMRCIAL_ID`: `TPROCESSO_EXP`.TIPOACORDOCOEMRCIAL_ID →
- **Views referencing (0):** none
- **Cross-DB views:** none

### `DEVICE_MESSAGE`

Columns: 6

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| ID | int | 10.0,0.0 | NO |  | SIM |
| CD_USUARIO | char | 4.0 | NO |  | NAO |
| NR_PROCESSO | char | 18.0 | NO |  | NAO |
| ENVIADA | bit |  | YES |  | NAO |
| TITLE | varchar | 255.0 | YES |  | NAO |
| BODY | text | 2147483647.0 | YES |  | NAO |

- **FK out:** `FK_DEVICE_MESSAGE_CD_USUARIO`: CD_USUARIO → `TUSUARIO`.CD_USUARIO; `FK_DEVICE_MESSAGE_PROCESSO`: NR_PROCESSO → `TPROCESSO`.NR_PROCESSO
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `DEVICE_NOTIFICATION`

Columns: 4

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| ID | int | 10.0,0.0 | NO |  | SIM |
| CD_USUARIO | char | 4.0 | NO |  | NAO |
| NR_PROCESSO | char | 18.0 | NO |  | NAO |
| CD_EVENTO | char | 3.0 | NO |  | NAO |

- **FK out:** `FK_DEVICE_NOTIFICATION_PROCESSO`: NR_PROCESSO → `TPROCESSO`.NR_PROCESSO
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TCARGO`

Columns: 12

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_CARGO | char | 3.0 | NO |  | SIM |
| NM_CARGO | char | 40.0 | YES |  | NAO |
| CD_NIVEL | int | 10.0,0.0 | YES |  | NAO |
| CD_CARGO_PAI | char | 3.0 | YES |  | NAO |
| IN_ATIVO | char | 1.0 | YES | ('1') | NAO |
| IN_SELECIONADO | char | 1.0 | YES |  | NAO |
| IN_MANAGER | char | 1.0 | YES |  | NAO |
| DOC_PREFERENCIAL | int | 10.0,0.0 | YES |  | NAO |
| IN_INTERNO | char | 1.0 | YES | ((1)) | NAO |
| IN_DASHBOARD_WEB | char | 1.0 | YES |  | NAO |
| CD_SETOR | int | 10.0,0.0 | YES |  | NAO |
| IN_LIBERA_TRANSMISSAO_DI | char | 1.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** `FK_CD_CARGO`: `TCARGO_SISTEMAS`.CD_CARGO →
- **Views referencing (1):** `VW_CARGO`
- **Cross-DB views:** none

### `TCARGO_SISTEMAS`

Columns: 3

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_SISTEMA | int | 10.0,0.0 | NO |  | SIM |
| CD_CARGO | char | 3.0 | NO |  | SIM |
| IN_ATIVO | char | 1.0 | YES | ('1') | NAO |

- **FK out:** `FK_CD_CARGO`: CD_CARGO → `TCARGO`.CD_CARGO; `FK_CD_SISTEMA`: CD_SISTEMA → `TSISTEMAS`.CD_SISTEMA
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TCLIENTE_SERVICO`

Columns: 19

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_CLIENTE | char | 5.0 | NO |  | SIM |
| CD_UNID_NEG | char | 2.0 | NO |  | SIM |
| CD_PRODUTO | char | 2.0 | NO |  | SIM |
| CD_SERVICO | char | 3.0 | NO |  | SIM |
| IN_ATIVO | char | 1.0 | NO |  | NAO |
| NR_DPS | char | 8.0 | YES |  | NAO |
| DT_CAPTACAO | datetime |  | YES |  | NAO |
| PZ_PROPOSTA | int | 10.0,0.0 | YES |  | NAO |
| IN_INCIDE_SDA | char | 1.0 | NO |  | NAO |
| DT_AUTORIZACAO | datetime |  | YES |  | NAO |
| CD_PREFIXO | char | 2.0 | YES |  | NAO |
| CD_BANCO_DEB_CC | char | 3.0 | YES |  | NAO |
| CD_BANCO_COM | char | 3.0 | YES |  | NAO |
| CD_BANCO_DEB_COM | char | 3.0 | YES |  | NAO |
| IN_CPMF_NUM | char | 1.0 | YES | ('0') | NAO |
| CD_TAB_SDA | char | 3.0 | YES |  | NAO |
| IN_REL_VOL_MOD2 | char | 1.0 | YES | ('0') | NAO |
| IN_LANCA_SOLIC | char | 1.0 | YES |  | NAO |
| IN_HORA_EVENTOS | bit |  | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TDECLARACAO_IMPORTACAO`

Columns: 156

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| NR_PROCESSO | char | 18.0 | NO |  | SIM |
| NR_IDENT_USUARIO | char | 15.0 | YES |  | NAO |
| CD_APLICACAO_MERC | char | 1.0 | YES |  | NAO |
| CD_BANDEIRA_TRANSP | char | 3.0 | YES |  | NAO |
| CD_COBERTURA_CAMBIAL | char | 1.0 | YES | ('1') | NAO |
| CD_DESTAQUE_NCM | char | 3.0 | YES |  | NAO |
| CD_FORMA_PAGAMENTO | char | 1.0 | YES | ('1') | NAO |
| CD_FUND_LEGAL_II | char | 2.0 | YES |  | NAO |
| CD_IMPORTADOR | char | 5.0 | YES |  | NAO |
| CD_INCOTERM | char | 3.0 | YES |  | NAO |
| CD_LOCAL_EMBARQUE | char | 4.0 | YES |  | NAO |
| CD_METODO_VALORACAO | char | 2.0 | YES | ('01') | NAO |
| CD_MODALIDADE_DESP | char | 1.0 | YES |  | NAO |
| CD_MODALIDADE_PAGTO | char | 2.0 | YES |  | NAO |
| CD_MOEDA_DESPESAS | char | 3.0 | YES |  | NAO |
| CD_MOEDA_FRETE | char | 3.0 | YES |  | NAO |
| CD_MOEDA_MLE | char | 3.0 | YES |  | NAO |
| CD_MOEDA_SEGURO | char | 3.0 | YES |  | NAO |
| CD_MOTIVO_SEM_COBERTURA | char | 2.0 | YES |  | NAO |
| CD_MOTIVO_TRANS | char | 1.0 | YES |  | NAO |
| CD_PAIS_IMPORTADOR | char | 3.0 | YES |  | NAO |
| CD_PAIS_PROC_CARGA | char | 3.0 | YES |  | NAO |
| CD_RECINTO_ALFAND | char | 7.0 | YES |  | NAO |
| CD_REG_TRIB_II | char | 1.0 | YES |  | NAO |
| CD_REG_TRIB_IPI | char | 1.0 | YES |  | NAO |
| CD_SETOR_ARMAZENAM | char | 3.0 | YES |  | NAO |
| CD_TIPO_AG_CARGA | char | 1.0 | YES |  | NAO |
| CD_TIPO_CONSIG | char | 1.0 | YES | ('1') | NAO |
| CD_TIPO_DCTO_CARGA | char | 2.0 | YES |  | NAO |
| CD_TIPO_DECLARACAO | char | 2.0 | YES | ('01') | NAO |
| CD_TIPO_IMPORTADOR | char | 1.0 | YES |  | NAO |
| CD_TIPO_MANIFESTO | char | 1.0 | YES |  | NAO |
| CD_TRANSPORTADOR | char | 4.0 | YES |  | NAO |
| CD_URF_DESPACHO | char | 7.0 | YES |  | NAO |
| CD_URF_ENTR_CARGA | char | 7.0 | YES |  | NAO |
| CD_UTIL_DCTO_CARGA | char | 1.0 | YES | ('1') | NAO |
| CD_VIA_TRANSP_CARG | char | 2.0 | YES |  | NAO |
| CD_VINC_IMPO_EXPO | char | 1.0 | NO | ('1') | NAO |
| DT_CHEGADA_CARGA | char | 8.0 | YES |  | NAO |
| DT_EMBARQUE | char | 8.0 | YES |  | NAO |
| DT_PROCESSAMENTO | char | 8.0 | YES |  | NAO |
| DT_REGISTRO_DI | char | 8.0 | YES |  | NAO |
| DT_TRANSMISSAO | char | 8.0 | YES |  | NAO |
| IN_BEM_ENCOMENDA | bit |  | NO | 0 | NAO |
| IN_MATERIAL_USADO | bit |  | NO | 0 | NAO |
| IN_MOEDA_NACIONAL | char | 1.0 | NO | ('0') | NAO |
| IN_MOEDA_UNICA | bit |  | NO | 0 | NAO |
| IN_MULTIMODAL | bit |  | NO | 0 | NAO |
| IN_OPERACAO_FUNDAP | bit |  | NO | 0 | NAO |
| IN_RATEAR_FRETE_ITENS | bit |  | NO | -1 | NAO |
| IN_RATEAR_SEGURO_ITENS | bit |  | NO | -1 | NAO |
| IN_REPASSA_DADOS_ADICAO | bit |  | NO | 0 | NAO |
| IN_REPASSA_DADOS_CAMBIO | bit |  | NO | 0 | NAO |
| NM_CONSIGNATARIO | char | 60.0 | YES |  | NAO |
| NM_VEICULO_TRANSP | char | 30.0 | YES |  | NAO |
| NR_AGENTE_CARGA | char | 14.0 | YES |  | NAO |
| NR_BANCO_COM | char | 5.0 | YES |  | NAO |
| NR_BANCO_PAGAMENTO | char | 5.0 | YES |  | NAO |
| NR_COMPRADOR_ME | char | 14.0 | YES |  | NAO |
| NR_CONSIGNATARIO | char | 14.0 | YES |  | NAO |
| NR_CONTRATO_CAMBIO | char | 8.0 | YES |  | NAO |
| NR_CPF_REPR_LEGAL | char | 11.0 | YES |  | NAO |
| NR_DCTO_CARGA | char | 30.0 | YES |  | NAO |
| NR_DCTO_CARGA_MAST | char | 30.0 | YES |  | NAO |
| NR_DECL_IMP_PROT | char | 10.0 | YES |  | NAO |
| NR_DECLARACAO_IMP | char | 15.0 | YES |  | NAO |
| NR_IDENTIFICACAO_COM | char | 14.0 | YES |  | NAO |
| NR_MANIFESTO | char | 15.0 | YES |  | NAO |
| NR_PRACA_COM | char | 4.0 | YES |  | NAO |
| NR_PRACA_PAGAMENTO | char | 5.0 | YES |  | NAO |
| NR_ROF | char | 8.0 | YES |  | NAO |
| NR_VEICULO_TRANSP | char | 15.0 | YES |  | NAO |
| PB_CARGA | float | 53.0, | YES | 0 | NAO |
| PC_COMISSAO | float | 53.0, | NO | 0 | NAO |
| PC_ICMS | float | 53.0, | NO | 0 | NAO |
| PC_REDUCAO_ICMS | float | 53.0, | NO | 0 | NAO |
| PL_CARGA | float | 53.0, | YES | 0 | NAO |
| QT_ADICOES | int | 10.0,0.0 | NO | 0 | NAO |
| TX_INFO_COMPL | varchar | -1.0 | YES |  | NAO |
| VL_FRETE_TNAC_MNEG | float | 53.0, | YES | 0 | NAO |
| VL_TOT_DESPS_MN | float | 53.0, | YES | 0 | NAO |
| VL_TOT_DESPS_MNEG | float | 53.0, | YES | 0 | NAO |
| VL_TOT_FRT_COLLECT | float | 53.0, | YES | 0 | NAO |
| VL_TOT_FRT_PREPAID | float | 53.0, | YES | 0 | NAO |
| VL_TOT_MLE_MNEG | float | 53.0, | YES | 0 | NAO |
| VL_TOT_SEGURO_MNEG | float | 53.0, | YES | 0 | NAO |
| VL_TOTAL_FRETE_MN | float | 53.0, | YES | 0 | NAO |
| VL_TOTAL_MLE_MN | float | 53.0, | YES | 0 | NAO |
| VL_TOTAL_SEG_MN | float | 53.0, | YES | 0 | NAO |
| PC_SEGURO_MLE | float | 53.0, | YES | 0 | NAO |
| VL_TOTAL_II | float | 53.0, | YES | 0 | NAO |
| VL_TOTAL_IPI | float | 53.0, | YES | 0 | NAO |
| VL_TOTAL_AD | float | 53.0, | YES | 0 | NAO |
| DT_ULTIMA_ALTERACAO | datetime |  | YES |  | NAO |
| IN_RISC_ATUALIZADO | char | 1.0 | YES | ('0') | NAO |
| CD_TIPO_BASE_SEGURO | char | 1.0 | YES | ('2') | NAO |
| IN_REB | char | 1.0 | YES | ('0') | NAO |
| VL_TOT_ICMS | float | 53.0, | YES | 0 | NAO |
| CD_TIPO_PGTO_TRIB | char | 1.0 | YES | ('1') | NAO |
| NR_CONTA_PGTO_TRIB | varchar | 19.0 | YES |  | NAO |
| TX_MLE | float | 53.0, | YES | 0 | NAO |
| TX_FRETE | float | 53.0, | YES | 0 | NAO |
| TX_SEGURO | float | 53.0, | YES | 0 | NAO |
| TX_DOLAR | float | 53.0, | YES | 0 | NAO |
| NR_REF_CLI | varchar | 15.0 | YES |  | NAO |
| IN_SISCOMEX | char | 1.0 | YES | ('0') | NAO |
| CD_TIPO_ICMS | char | 1.0 | YES | ('1') | NAO |
| IN_ICMS_IMPRESSO | char | 1.0 | YES | ('0') | NAO |
| DT_ICMS_IMPRESSO | datetime |  | YES |  | NAO |
| VL_TOTAL_ACRESCIMOS_MN | float | 53.0, | YES | 0 | NAO |
| VL_TOTAL_DEDUCOES_MN | float | 53.0, | YES | 0 | NAO |
| DT_CALCULO | datetime |  | YES |  | NAO |
| VL_DESPESA_ITEM | decimal | 18.0,0.0 | YES |  | NAO |
| VL_DESPESA_ITEM_MN | float | 53.0, | YES |  | NAO |
| CD_ORGAO_FIN_INTER | char | 2.0 | YES |  | NAO |
| CD_PRESENCA_CARGA | char | 36.0 | YES |  | NAO |
| NR_SEQ_RETIFICACAO | char | 2.0 | YES |  | NAO |
| CD_MOTIVO_RETIF | char | 2.0 | YES |  | NAO |
| DT_RETIFICACAO | datetime |  | YES |  | NAO |
| DT_EXON_IMPRESSO | datetime |  | YES |  | NAO |
| IN_EXON_IMPRESSO | char | 1.0 | YES | ('0') | NAO |
| CD_TRIBUTACAO_ICMS | char | 1.0 | YES |  | NAO |
| CD_FUND_LEGAL_ICMS | char | 3.0 | YES |  | NAO |
| VL_TOTAL_CAMBIO | float | 53.0, | YES | 0 | NAO |
| CD_AUSENCIA_FABRIC | char | 1.0 | YES |  | NAO |
| CD_FORNECEDOR | char | 5.0 | YES |  | NAO |
| CD_FABRICANTE | char | 5.0 | YES |  | NAO |
| CD_PAIS_AQUIS_MERC | char | 3.0 | YES |  | NAO |
| CD_PAIS_ORIG_MERC | char | 3.0 | YES |  | NAO |
| QT_PARC_FINANC_360 | int | 10.0,0.0 | YES |  | NAO |
| QT_PERIOD_PGTO_360 | int | 10.0,0.0 | YES |  | NAO |
| CD_PERIOD_PGTO_360 | char | 1.0 | YES |  | NAO |
| IN_EMBUT_FRT_ITENS | bit |  | NO | 0 | NAO |
| IN_EMBUT_SEG_ITENS | bit |  | NO | 0 | NAO |
| VL_TOTAL_ACRESCIMOS_MNEG | float | 53.0, | YES | 0 | NAO |
| VL_TOTAL_DEDUCOES_MNEG | float | 53.0, | YES | 0 | NAO |
| VL_TOTAL_FRETE_MNEG | float | 53.0, | YES | 0 | NAO |
| NR_PROCESSO_SISCOMEX | char | 8.0 | YES |  | NAO |
| IN_PGTO_VARIAV_360 | bit |  | NO | 0 | NAO |
| CD_VEICULO_TRANSP | char | 4.0 | YES |  | NAO |
| PC_REDUCAO_IPT_BLI | float | 53.0, | YES | 0 | NAO |
| DT_DI | datetime |  | YES |  | NAO |
| VL_TOTAL_TX_SCX | float | 53.0, | YES | 0 | NAO |
| VL_TOT_PIS_COFINS | numeric | 15.0,2.0 | YES |  | NAO |
| VL_TOTAL_SEGURO_MN | float | 53.0, | YES | 0 | NAO |
| IN_CALCULOU_COM_AFRMM | char | 1.0 | YES |  | NAO |
| HR_DI | char | 8.0 | YES |  | NAO |
| HR_CALCULO | char | 8.0 | YES |  | NAO |
| VL_TOTAL_II_SEM_SEGURO | float | 53.0, | YES |  | NAO |
| VL_TOTAL_IPI_SEM_SEGURO | float | 53.0, | YES |  | NAO |
| VL_TOT_ICMS_SEM_SEGURO | float | 53.0, | YES |  | NAO |
| NR_TRANSMISSAO | char | 15.0 | YES |  | NAO |
| CD_USUARIO_TRANSMISSAO | char | 4.0 | YES |  | NAO |
| IN_FMA | char | 1.0 | YES |  | NAO |
| DT_PAGAMENTO_DARF | datetime |  | YES |  | NAO |
| TX_INFO_COMPL_AUTO | varchar | -1.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (1):** `VW_MOEDAS_DI`
- **Cross-DB views:** none

### `TETAPA`

Columns: 10

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_ETAPA | int | 10.0,0.0 | NO |  | SIM |
| NM_ETAPA | varchar | 200.0 | YES |  | NAO |
| NM_INGLES | varchar | 50.0 | YES |  | NAO |
| NM_ESPANHOL | varchar | 50.0 | YES |  | NAO |
| IN_ATIVO | int | 10.0,0.0 | YES |  | NAO |
| CD_UNID_NEG | char | 2.0 | YES |  | NAO |
| CD_PRODUTO | char | 2.0 | YES |  | NAO |
| CD_EVENTO | char | 3.0 | YES |  | NAO |
| IN_ETAPA_AUTOMATICA | char | 1.0 | YES | ('0') | NAO |
| IN_RETRABALHO | char | 1.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TETAPAS_DESPACHO`

Columns: 2

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| Codigo | char | 2.0 | YES |  | NAO |
| Descricao | char | 120.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TETAPA_AUTOMATICA_ORDENA`

Columns: 4

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| NR_ORDEM | int | 10.0,0.0 | YES |  | NAO |
| CD_ETAPA_AUTOMATICA | int | 10.0,0.0 | YES |  | NAO |
| CD_UNID_NEG | char | 2.0 | YES |  | NAO |
| CD_PRODUTO | char | 2.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TETAPA_OLD`

Columns: 3

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_ETAPA | char | 3.0 | NO |  | SIM |
| NM_ETAPA | char | 50.0 | NO |  | NAO |
| IN_ATIVO | char | 1.0 | YES | ('1') | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TETAPA_PRODUTO`

Columns: 4

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_ETAPA | int | 10.0,0.0 | NO |  | SIM |
| NM_ETAPA | varchar | 255.0 | NO |  | NAO |
| CD_PRODUTO | char | 2.0 | NO |  | NAO |
| IN_ATIVO | char | 1.0 | YES | ('1') | NAO |

- **FK out:** `FK_TETAPA_PRODUTO_TPRODUTO`: CD_PRODUTO → `TPRODUTO`.CD_PRODUTO
- **FK in:** `FK_TETAPA_PRODUTO_EVENTO_TETAPA_PRODUTO`: `TETAPA_PRODUTO_EVENTO`.CD_ETAPA →
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TETAPA_PRODUTO_EVENTO`

Columns: 2

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_ETAPA | int | 10.0,0.0 | NO |  | SIM |
| CD_EVENTO | char | 3.0 | NO |  | SIM |

- **FK out:** `FK_TETAPA_PRODUTO_EVENTO_TETAPA_PRODUTO`: CD_ETAPA → `TETAPA_PRODUTO`.CD_ETAPA
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TEVENTO`

Columns: 39

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_EVENTO | char | 3.0 | NO |  | SIM |
| NM_EVENTO | char | 50.0 | NO |  | NAO |
| NM_INGLES | varchar | 500.0 | YES |  | NAO |
| NM_ESPANHOL | varchar | 500.0 | YES |  | NAO |
| IN_INSPECIONAVEL | char | 1.0 | YES |  | NAO |
| PRZ_INSPECAO | smallint | 5.0,0.0 | YES |  | NAO |
| CD_RESPONSAVEL | char | 1.0 | YES |  | NAO |
| CD_ETAPA | char | 3.0 | YES |  | NAO |
| IN_ATIVO | char | 1.0 | YES | ('1') | NAO |
| AP_EVENTO | char | 15.0 | YES |  | NAO |
| AP_EVENTO_ESPANHOL | char | 15.0 | YES |  | NAO |
| AP_EVENTO_INGLES | char | 15.0 | YES |  | NAO |
| CD_PREST_SERV | char | 2.0 | YES |  | NAO |
| PRZ_INSPECAO2 | smallint | 5.0,0.0 | YES |  | NAO |
| PRZ_INSPECAO3 | smallint | 5.0,0.0 | YES |  | NAO |
| IN_INSPECIONAVEL_IMP | char | 1.0 | YES |  | NAO |
| PRZ_INSPECAO1_IMP | smallint | 5.0,0.0 | YES |  | NAO |
| PRZ_INSPECAO2_IMP | smallint | 5.0,0.0 | YES |  | NAO |
| PRZ_INSPECAO3_IMP | smallint | 5.0,0.0 | YES |  | NAO |
| IN_INSPECIONAVEL_GP | char | 1.0 | YES |  | NAO |
| PRZ_INSPECAO1_GP | smallint | 5.0,0.0 | YES |  | NAO |
| PRZ_INSPECAO2_GP | smallint | 5.0,0.0 | YES |  | NAO |
| PRZ_INSPECAO3_GP | smallint | 5.0,0.0 | YES |  | NAO |
| IN_MOSTRAR_WEB_IMP | char | 1.0 | YES |  | NAO |
| IN_MOSTRAR_WEB_EXP | char | 1.0 | YES |  | NAO |
| IN_MOSTRAR_WEB_IMP_FILTRO | char | 1.0 | YES |  | NAO |
| IN_MOSTRAR_WEB_EXP_FILTRO | char | 1.0 | YES |  | NAO |
| IN_ACEITA_DESVIOS | char | 1.0 | YES |  | NAO |
| IN_INSPECIONAVEL_FI_IMP | char | 1.0 | YES |  | NAO |
| PRZ_INSPECAO1_FI_IMP | smallint | 5.0,0.0 | YES |  | NAO |
| PRZ_INSPECAO2_FI_IMP | smallint | 5.0,0.0 | YES |  | NAO |
| PRZ_INSPECAO3_FI_IMP | smallint | 5.0,0.0 | YES |  | NAO |
| IN_INSPECIONAVEL_FI_EXP | char | 1.0 | YES |  | NAO |
| PRZ_INSPECAO1_FI_EXP | smallint | 5.0,0.0 | YES |  | NAO |
| PRZ_INSPECAO2_FI_EXP | smallint | 5.0,0.0 | YES |  | NAO |
| PRZ_INSPECAO3_FI_EXP | smallint | 5.0,0.0 | YES |  | NAO |
| IN_OBS_AUT | char | 1.0 | YES |  | NAO |
| NM_OBS_AUT | varchar | 500.0 | YES |  | NAO |
| NM_DASHBOARD | varchar | 35.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** `TEVENTO_TFATORES_SERVICO_EVENTO_CD_EVENTO`: `TFATORES_EVENTO`.CD_EVENTO →; `TEVENTO_TSERVICO_EVENTO_NOVO`: `TSERVICO_EVENTO_NOVO`.CD_EVENTO →
- **Views referencing (0):** none
- **Cross-DB views:** MYINDAIAV2.`vw_Event`

### `TEVENTO_ATZ`

Columns: 1

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_EVENTO | char | 3.0 | NO |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TEVENTO_AUTOMATICO`

Columns: 6

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_PRODUTO | char | 2.0 | YES |  | NAO |
| CD_EVENTO | char | 3.0 | YES |  | NAO |
| TX_DOCUMENTACAO | varchar | 500.0 | YES |  | NAO |
| IN_BLOQUEAR | char | 1.0 | YES |  | NAO |
| TX_PREFIXO | char | 2.0 | YES |  | NAO |
| IN_BLOQUEAR_EVENTO_BASE | char | 1.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TEVENTO_PO`

Columns: 6

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_EVENTO | char | 3.0 | NO |  | SIM |
| NR_ORDEM | int | 10.0,0.0 | NO |  | NAO |
| CD_EV_BASICO | char | 3.0 | YES |  | NAO |
| PZ_DO_EV_BASICO | float | 53.0, | YES |  | NAO |
| CD_EV_FUTURO | char | 3.0 | YES |  | NAO |
| PZ_ATE_EV_FUTURO | float | 53.0, | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TFATORES`

Columns: 16

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_FATOR | int | 10.0,0.0 | NO |  | SIM |
| NM_FATOR | varchar | 1000.0 | NO |  | NAO |
| DS_FATOR | varchar | 1000.0 | YES |  | NAO |
| CD_UNID_NEG | char | 2.0 | NO |  | NAO |
| CD_PRODUTO | char | 2.0 | NO |  | NAO |
| IN_OPCIONAL | char | 1.0 | NO |  | NAO |
| CD_GRUPO | char | 3.0 | NO |  | NAO |
| NM_CAMPO_PROCESSO | varchar | 100.0 | YES |  | NAO |
| NM_TABELA | varchar | 100.0 | YES |  | NAO |
| NM_CAMPO_CHAVE_TABELA | varchar | 100.0 | YES |  | NAO |
| NM_CAMPO_RETORNO_TABELA | varchar | 100.0 | YES |  | NAO |
| CD_COMPARADOR | char | 2.0 | NO |  | NAO |
| NM_SQL | varchar | 4000.0 | YES |  | NAO |
| NM_RETORNO | varchar | 1000.0 | YES |  | NAO |
| NM_TABELA_TRIGGER | varchar | 255.0 | YES |  | NAO |
| NM_CAMPOS_CHAVE_TRIGGER | varchar | 255.0 | YES |  | NAO |

- **FK out:** `TCOMPARADORES_FATOR_TFATORES`: CD_COMPARADOR → `TCOMPARADORES_FATOR`.CD_COMPARADOR
- **FK in:** `RefTFATORES8`: `TFATORES_CAMPOS`.CD_FATOR →; `TFATORES_TFATORES_SERVICO_EVENTO`: `TFATORES_EVENTO`.CD_FATOR →; `TFATORES_SERVICOS_TFATORES`: `TFATORES_SERVICOS`.CD_FATOR →
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TFATORES_EVENTO`

Columns: 11

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_FATOR | int | 10.0,0.0 | NO |  | SIM |
| CD_EVENTO | char | 3.0 | NO |  | SIM |
| CD_EVENTO_ANTERIOR | char | 3.0 | YES |  | NAO |
| CD_EVENTO_BASE | char | 3.0 | YES |  | NAO |
| PZ_EVENTO_BASE | int | 10.0,0.0 | YES |  | NAO |
| NR_PRIORIDADE | int | 10.0,0.0 | YES |  | NAO |
| IN_ALTERAR | char | 1.0 | YES | ('0') | NAO |
| IN_EXCLUIR | char | 1.0 | YES | ('0') | NAO |
| CD_SERVICO | int | 10.0,0.0 | NO | ((0)) | SIM |
| IN_PRAZO_UTIL | char | 1.0 | YES | ('0') | NAO |
| IN_PRAZO_FERIADO | char | 1.0 | YES | ('0') | NAO |

- **FK out:** `TEVENTO_TFATORES_SERVICO_EVENTO_CD_EVENTO`: CD_EVENTO → `TEVENTO`.CD_EVENTO; `TFATORES_TFATORES_SERVICO_EVENTO`: CD_FATOR → `TFATORES`.CD_FATOR
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TFATORES_SERVICOS`

Columns: 2

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_FATOR | int | 10.0,0.0 | NO |  | SIM |
| CD_SERVICO | int | 10.0,0.0 | NO |  | SIM |

- **FK out:** `TFATORES_SERVICOS_TFATORES`: CD_FATOR → `TFATORES`.CD_FATOR; `TFATORES_SERVICOS_TSERVICO_NOVO`: CD_SERVICO → `TSERVICO_NOVO`.CD_SERVICO
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TFOLLOWUP`

Columns: 25

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| NR_PROCESSO | char | 18.0 | NO |  | SIM |
| CD_SERVICO | char | 3.0 | NO |  | SIM |
| CD_EVENTO | char | 3.0 | NO |  | SIM |
| IN_APLICAVEL | char | 1.0 | NO | -1 | NAO |
| CD_RESP_APLICACAO | char | 4.0 | YES |  | NAO |
| CD_RESP_REALIZACAO | char | 4.0 | YES |  | NAO |
| CD_RESP_INSPECAO | char | 4.0 | YES |  | NAO |
| DT_APLICACAO | datetime |  | YES |  | NAO |
| DT_REALIZACAO | datetime |  | YES |  | NAO |
| DT_INSPECAO | datetime |  | YES |  | NAO |
| CD_RESULT_INSPECAO | char | 1.0 | YES |  | NAO |
| NR_RNC | varchar | 8.0 | YES |  | NAO |
| DT_PREVISTA | datetime |  | YES |  | NAO |
| DT_LIMITE | datetime |  | YES |  | NAO |
| NR_ORDEM | smallint | 5.0,0.0 | YES |  | NAO |
| TX_OBS | text | 2147483647.0 | YES |  | NAO |
| IN_BLOQUEADO | char | 1.0 | YES | ('0') | NAO |
| IN_ALERTA_ENVIADO | char | 1.0 | YES | ('0') | NAO |
| QT_DIAS_DESVIO | int | 10.0,0.0 | YES |  | NAO |
| DT_REALIZACAO_EFETIVA | datetime |  | YES |  | NAO |
| DT_ALERTA_ENVIADO | datetime |  | YES |  | NAO |
| IN_EDI_ENVIADO | char | 1.0 | YES |  | NAO |
| CD_EV_BASICO | char | 3.0 | YES |  | NAO |
| PZ_DO_EV_BASICO | int | 10.0,0.0 | YES |  | NAO |
| IN_INTEGRADO_CLIENTE | char | 1.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (25):** `VW_DT_AVERBACAO`, `VW_DT_CHEGADA`, `VW_DT_DESCARGA`, `VW_DT_DESEMB`, `VW_DT_DESOVA`, `VW_DT_EMB_DESEMB`, `VW_DT_EMBARQUE`, `VW_DT_ENT`, `VW_DT_ENTREGA_MERC`, `VW_DT_ESPERA_NAVIO`, `VW_DT_LIB_BL`, `VW_DT_NF_TRANSP`, `VW_DT_PAGTO`, `VW_DT_PAGTO_LI`, `VW_DT_PREV_CHEGADA`, `VW_DT_PREV_EMBARQUE`, `VW_DT_RECEB_DOC`, `VW_DT_RECEP_ANALISE`, `VW_DT_REG_DI`, `VW_DT_REMOCAO`, `VW_DT_RET_BL`, `VW_FATO_IMPO`, `VW_PROCESSO`, `VW_REL_DFF`, `VW_REL_DFT`
- **Cross-DB views:** MYINDAIAV2.`vw_Processo_Resumo`

### `TFOLLOWUP_ETAPA`

Columns: 7

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_UNID_NEG | char | 2.0 | NO |  | SIM |
| CD_PRODUTO | char | 2.0 | NO |  | SIM |
| NR_PROCESSO | char | 18.0 | NO |  | SIM |
| CD_FOLLOWUP_ETAPA | int | 10.0,0.0 | NO |  | SIM |
| CD_ETAPA | int | 10.0,0.0 | YES |  | NAO |
| CD_USUARIO | char | 4.0 | YES |  | NAO |
| DT_ALTERACAO | datetime |  | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TFOLLOWUP_IGNORE_TRIGGERS`

Columns: 2

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| NR_PROCESSO | char | 18.0 | YES |  | NAO |
| SESSION_ID | int | 10.0,0.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TFOLLOWUP_TMP`

Columns: 22

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| NR_PROCESSO | char | 18.0 | NO |  | NAO |
| CD_SERVICO | char | 3.0 | NO |  | NAO |
| CD_EVENTO | char | 3.0 | NO |  | NAO |
| IN_APLICAVEL | char | 1.0 | NO |  | NAO |
| CD_RESP_APLICACAO | char | 4.0 | YES |  | NAO |
| CD_RESP_REALIZACAO | char | 4.0 | YES |  | NAO |
| CD_RESP_INSPECAO | char | 4.0 | YES |  | NAO |
| DT_APLICACAO | datetime |  | YES |  | NAO |
| DT_REALIZACAO | datetime |  | YES |  | NAO |
| DT_INSPECAO | datetime |  | YES |  | NAO |
| CD_RESULT_INSPECAO | char | 1.0 | YES |  | NAO |
| NR_RNC | varchar | 8.0 | YES |  | NAO |
| DT_PREVISTA | datetime |  | YES |  | NAO |
| DT_LIMITE | datetime |  | YES |  | NAO |
| NR_ORDEM | smallint | 5.0,0.0 | YES |  | NAO |
| TX_OBS | text | 2147483647.0 | YES |  | NAO |
| IN_BLOQUEADO | char | 1.0 | YES |  | NAO |
| IN_ALERTA_ENVIADO | char | 1.0 | YES |  | NAO |
| QT_DIAS_DESVIO | int | 10.0,0.0 | YES |  | NAO |
| DT_REALIZACAO_EFETIVA | datetime |  | YES |  | NAO |
| DT_ALERTA_ENVIADO | datetime |  | YES |  | NAO |
| IN_EDI_ENVIADO | char | 1.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TMOD_FOLLOW_UP_EVENTO`

Columns: 3

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_FOLLOW_UP | char | 2.0 | NO |  | SIM |
| CD_EVENTO | char | 3.0 | NO |  | SIM |
| NR_ORDEM | int | 10.0,0.0 | YES | 0 | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TPROCESSO`

Columns: 316

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| NR_PROCESSO | char | 18.0 | NO |  | SIM |
| CD_UNID_NEG | char | 2.0 | NO |  | NAO |
| CD_PRODUTO | char | 2.0 | NO |  | NAO |
| CD_CLIENTE | char | 5.0 | YES |  | NAO |
| CD_SERVICO | char | 3.0 | YES |  | NAO |
| CD_USUARIO | char | 4.0 | YES |  | NAO |
| DT_ABERTURA | datetime |  | YES |  | NAO |
| CD_RESTRICAO | char | 1.0 | YES |  | NAO |
| CD_LIBERADOR | char | 4.0 | YES |  | NAO |
| DT_LIBERACAO | datetime |  | YES |  | NAO |
| IN_CANCELADO | char | 1.0 | YES | ('0') | NAO |
| CD_CANCELADOR | char | 4.0 | YES |  | NAO |
| DT_CANCELAMENTO | datetime |  | YES |  | NAO |
| CD_REPRESENTANTE | char | 5.0 | YES |  | NAO |
| NR_PROC_RISC | char | 5.0 | YES |  | NAO |
| NR_PROC_PARCEIRO | char | 8.0 | YES |  | NAO |
| TX_MERCADORIA | text | 2147483647.0 | YES |  | NAO |
| IN_MERC_PERIGOSA | char | 1.0 | YES | ('0') | NAO |
| TX_OBSERVACOES | text | 2147483647.0 | YES |  | NAO |
| CD_MOEDA_MLE | char | 3.0 | YES |  | NAO |
| VL_MLE_MNEG | float | 53.0, | YES | 0 | NAO |
| VL_MLE_MN | float | 53.0, | YES | 0 | NAO |
| CD_MOEDA_FRETE | char | 3.0 | YES |  | NAO |
| VL_FRETE_PREPAID_MNEG | float | 53.0, | YES | 0 | NAO |
| VL_FRETE_COLLECT_MNEG | float | 53.0, | YES | 0 | NAO |
| VL_FRETE_MN | float | 53.0, | YES | 0 | NAO |
| CD_MOEDA_SEGURO | char | 3.0 | YES |  | NAO |
| VL_SEGURO_MNEG | float | 53.0, | YES | 0 | NAO |
| VL_SEGURO_MN | float | 53.0, | YES | 0 | NAO |
| CD_AGENTE | char | 4.0 | YES |  | NAO |
| VL_TAXA_FRETE | float | 53.0, | YES | 0 | NAO |
| VL_CIF_DOLAR | float | 53.0, | YES | 0 | NAO |
| VL_CIF_MN | float | 53.0, | YES | 0 | NAO |
| VL_II_MN | float | 53.0, | YES | 0 | NAO |
| VL_IPI_MN | float | 53.0, | YES | 0 | NAO |
| VL_ICMS_MN | float | 53.0, | YES | 0 | NAO |
| CD_ARMAZEM_ATRACACAO | char | 4.0 | YES |  | NAO |
| CD_ARMAZEM_DESCARGA | char | 4.0 | YES |  | NAO |
| CD_ARMAZEM_ESTOCAGEM | char | 4.0 | YES |  | NAO |
| CD_TRANSP_NAC | char | 4.0 | YES |  | NAO |
| CD_EMBARCACAO | char | 4.0 | YES |  | NAO |
| NR_VOO | char | 18.0 | YES |  | NAO |
| NR_CONHECIMENTO | char | 30.0 | YES |  | NAO |
| NR_CONHECIMENTO_MASTER | char | 30.0 | YES |  | NAO |
| CD_PAIS_ORIGEM | char | 3.0 | YES |  | NAO |
| CD_LOCAL_EMBARQUE | char | 4.0 | YES |  | NAO |
| CD_PAIS_DESTINO | char | 3.0 | YES |  | NAO |
| CD_LOCAL_DESEMBARQUE | char | 4.0 | YES |  | NAO |
| NR_DI | char | 15.0 | YES |  | NAO |
| QT_REF_CLIENTE | int | 10.0,0.0 | YES | 0 | NAO |
| QT_SOLINUM | int | 10.0,0.0 | YES | 0 | NAO |
| QT_RECEBIMENTO | int | 10.0,0.0 | YES | 0 | NAO |
| QT_DEVOLUCOES | int | 10.0,0.0 | YES | 0 | NAO |
| QT_LANC_FAT | int | 10.0,0.0 | YES | 0 | NAO |
| BASE_CALCULO_SDA | float | 53.0, | YES | 0 | NAO |
| VL_SDA | float | 53.0, | YES | 0 | NAO |
| VL_CONTR_ASSIST | float | 53.0, | YES | 0 | NAO |
| DT_DISTRIBUICAO | datetime |  | YES |  | NAO |
| CD_DESPACHANTE_SDA | char | 3.0 | YES |  | NAO |
| CD_STATUS_SDA | char | 1.0 | YES | ('0') | NAO |
| VL_FRETE_INTERNO | float | 53.0, | YES | 0 | NAO |
| NM_LOCAL_NF_LWW | varchar | 20.0 | YES |  | NAO |
| DT_CONTABIL_LWW | datetime |  | YES |  | NAO |
| TX_OBS_LWW | text | 2147483647.0 | YES |  | NAO |
| DT_ATRACACAO | datetime |  | YES |  | NAO |
| DT_DESCARGA | datetime |  | YES |  | NAO |
| DT_ESTOCAGEM | datetime |  | YES |  | NAO |
| DT_CONHECIMENTO | datetime |  | YES |  | NAO |
| DT_DESEMBARACO | datetime |  | YES |  | NAO |
| IN_LIBERADO | char | 1.0 | YES | ('0') | NAO |
| DT_EMBARQUE | datetime |  | YES |  | NAO |
| CD_REGIME_TRIB | char | 1.0 | YES |  | NAO |
| IN_CHEQUE_SDA | char | 1.0 | YES | ('0') | NAO |
| IN_LIQUIDADO | char | 1.0 | YES | ('0') | NAO |
| VL_FRETE_TNAC_MNEG | float | 53.0, | YES | 0 | NAO |
| IN_PRODUCAO | char | 1.0 | YES | ('1') | NAO |
| NR_DDE | char | 11.0 | YES |  | NAO |
| IN_SDA_PAGO | char | 1.0 | YES | ('0') | NAO |
| TX_OBS_INT | text | 2147483647.0 | YES |  | NAO |
| CD_CANAL | char | 1.0 | YES |  | NAO |
| IN_URGENTE | char | 1.0 | YES | ('0') | NAO |
| CD_ANALISTA_CLIENTE | char | 4.0 | YES |  | NAO |
| CD_ANALISTA_COMISSARIA | char | 4.0 | YES |  | NAO |
| NR_PRESENCA_CARGA | char | 36.0 | YES |  | NAO |
| DT_PRESENCA_CARGA | datetime |  | YES |  | NAO |
| IN_POR_VEICULO | char | 1.0 | YES |  | NAO |
| CD_USUARIO_REPASSA | char | 4.0 | YES |  | NAO |
| NR_VIAGEM | char | 15.0 | YES |  | NAO |
| IN_IMP_ARM | char | 1.0 | YES | ('0') | NAO |
| CD_TRANSP_NAC_DOC | char | 4.0 | YES |  | NAO |
| IN_DI_LIBERADA | char | 1.0 | YES | ('0') | NAO |
| CD_LIBERADOR_DI | char | 4.0 | YES |  | NAO |
| NR_AVERBACAO | char | 10.0 | YES |  | NAO |
| VL_PREMIO_SEGURO | float | 53.0, | YES | 0 | NAO |
| TP_BANCO_EXP | char | 1.0 | YES |  | NAO |
| CD_BANCO_EXP | char | 5.0 | YES |  | NAO |
| CD_AGENTE_SEGURO | char | 5.0 | YES |  | NAO |
| VL_COMPL_SDA | float | 53.0, | YES | 0 | NAO |
| NR_DA | char | 10.0 | YES |  | NAO |
| CD_CONTATO | char | 3.0 | YES |  | NAO |
| CD_AREA | char | 2.0 | YES |  | NAO |
| NR_MANIFESTO | char | 15.0 | YES |  | NAO |
| NM_CONEXAO | char | 18.0 | YES |  | NAO |
| NR_PROCESSO_EXP_TEMP | char | 5.0 | YES |  | NAO |
| DT_VENC_PROCESSO_EXP_TEMP | datetime |  | YES |  | NAO |
| NR_DI_RETORNO | char | 10.0 | YES |  | NAO |
| VL_PESO_LIQUIDO | float | 53.0, | YES | 0 | NAO |
| VL_PESO_BRUTO | float | 53.0, | YES | 0 | NAO |
| CD_INCOTERM | char | 3.0 | YES |  | NAO |
| NR_PROCESSO_VINC | char | 14.0 | YES |  | NAO |
| TP_MIC_DTA | char | 1.0 | YES | ('T') | NAO |
| TP_DESEMB_MIC_DTA | char | 1.0 | YES | ('T') | NAO |
| CD_UNID_NEG_VINC | char | 2.0 | YES |  | NAO |
| CD_PRODUTO_VINC | char | 2.0 | YES |  | NAO |
| NR_DESPACHO | char | 10.0 | YES |  | NAO |
| DT_CHEGADA | datetime |  | YES |  | NAO |
| DT_APRESENTACAO | datetime |  | YES |  | NAO |
| DT_CRUZE | datetime |  | YES |  | NAO |
| DT_SOL_NUM | datetime |  | YES |  | NAO |
| DT_REC_NUM | datetime |  | YES |  | NAO |
| DT_RECEB_DOC | datetime |  | YES |  | NAO |
| TP_PROCESSO | char | 1.0 | YES |  | NAO |
| NM_ATO_DECLARATORIO | varchar | 40.0 | YES |  | NAO |
| CD_DESPACHANTE | char | 3.0 | YES |  | NAO |
| DT_REG_DDE | datetime |  | YES |  | NAO |
| IN_ETIQUETA | char | 1.0 | YES | ('0') | NAO |
| TP_FRETE | char | 1.0 | YES |  | NAO |
| NR_FATURA | varchar | 30.0 | YES |  | NAO |
| CD_EMP_EST | char | 5.0 | YES |  | NAO |
| NR_PLACA_VEICULO | char | 15.0 | YES |  | NAO |
| NR_PERIODO_ARMAZENAGEM | int | 10.0,0.0 | YES |  | NAO |
| DT_VENCTO_ARMAZENAGEM | datetime |  | YES |  | NAO |
| VL_FRETE_CUSTO | float | 53.0, | YES |  | NAO |
| VL_M3 | float | 53.0, | YES | 0 | NAO |
| CD_IMPORTADOR | char | 5.0 | YES |  | NAO |
| CD_EXPORTADOR | char | 5.0 | YES |  | NAO |
| IN_ENTREPOSTO | char | 1.0 | YES | ('0') | NAO |
| NR_PROCESSO_OR_ENTREPOSTO | char | 18.0 | YES |  | NAO |
| CD_TRANSPORTADOR | char | 4.0 | YES |  | NAO |
| CD_GRUPO | char | 3.0 | YES |  | NAO |
| CD_CELULA | char | 2.0 | YES |  | NAO |
| NR_DTA | varchar | 10.0 | YES |  | NAO |
| IN_REL_LEAD_TIME | char | 1.0 | YES | ('1') | NAO |
| CD_TAB_SDA | char | 3.0 | YES |  | NAO |
| IN_IMPORTANTE | char | 1.0 | YES | ('0') | NAO |
| NR_CAMINHAO | char | 4.0 | YES |  | NAO |
| CD_TP_DTA | char | 1.0 | YES |  | NAO |
| NR_REFERENCIA | char | 30.0 | YES |  | NAO |
| DT_PEDIDO | datetime |  | YES |  | NAO |
| HR_PEDIDO | datetime |  | YES |  | NAO |
| HR_ABERTURA | datetime |  | YES |  | NAO |
| NM_EMPRESA_BASF | char | 4.0 | YES |  | NAO |
| CD_TP_PEDIDO | char | 3.0 | YES |  | NAO |
| NR_REF_EXPORTADOR | char | 30.0 | YES |  | NAO |
| NM_PLANTA | char | 30.0 | YES |  | NAO |
| NR_ORDEM | char | 30.0 | YES |  | NAO |
| IN_CONSOLIDADO | char | 1.0 | YES |  | NAO |
| IN_SEGURO | char | 1.0 | YES |  | NAO |
| IN_EDI_BASF | char | 3.0 | YES |  | NAO |
| CD_REF_IMP | varchar | 15.0 | YES |  | NAO |
| IN_DADOS_IGUAIS_ITENS | char | 1.0 | YES |  | NAO |
| CD_IMP_EXP_FI | char | 5.0 | YES |  | NAO |
| NR_PROPOSTA | char | 20.0 | YES |  | NAO |
| TP_CARGA | char | 1.0 | YES |  | NAO |
| CD_ORIGEM | char | 4.0 | YES |  | NAO |
| CD_DESTINO | char | 4.0 | YES |  | NAO |
| DESCR_INGLES | varchar | 50.0 | YES |  | NAO |
| CD_TAB_FRETE_VENDA | char | 6.0 | YES |  | NAO |
| CD_TAB_FRETE_COMPRA | char | 6.0 | YES |  | NAO |
| CD_CIA_TRANSP | char | 4.0 | YES |  | NAO |
| TP_FREQUENCIA | char | 1.0 | YES |  | NAO |
| CD_ARMADOR | char | 4.0 | YES |  | NAO |
| IN_ROUTING | char | 1.0 | YES |  | NAO |
| QTD_VOLUME | float | 53.0, | YES |  | NAO |
| CUBAGEM | float | 53.0, | YES |  | NAO |
| CHARGEABLE | float | 53.0, | YES |  | NAO |
| CD_ESTUFAGEM | char | 1.0 | YES |  | NAO |
| IN_CUBAGEM | char | 1.0 | YES |  | NAO |
| TX_DESCR | varchar | 255.0 | YES |  | NAO |
| VL_TARIFA_FRETE | float | 53.0, | YES |  | NAO |
| VL_OTHER_CHARGE | float | 53.0, | YES |  | NAO |
| VL_FRETE | float | 53.0, | YES |  | NAO |
| VL_HOUSE | float | 53.0, | YES |  | NAO |
| VL_RATEIO | float | 53.0, | YES |  | NAO |
| VL_OTHER_CHARGE_CUSTO | float | 53.0, | YES |  | NAO |
| OUTRA_TAXA | float | 53.0, | YES |  | NAO |
| VL_RATEIO_DESPESA | float | 53.0, | YES |  | NAO |
| VL_TT_VENDA | float | 53.0, | YES |  | NAO |
| VL_TT_CUSTO | float | 53.0, | YES |  | NAO |
| VL_DESP_MASTER | float | 53.0, | YES |  | NAO |
| VL_PROFIT_AGENTE | float | 53.0, | YES |  | NAO |
| VL_PROFIT_BRASIL | float | 53.0, | YES |  | NAO |
| VL_DIVISAO | float | 53.0, | YES |  | NAO |
| TP_DIVISAO | char | 1.0 | YES |  | NAO |
| VL_DESP_BRASIL | float | 53.0, | YES |  | NAO |
| VL_PROFIT_LIQUIDO | float | 53.0, | YES |  | NAO |
| VL_PROFIT_HOUSE | float | 53.0, | YES |  | NAO |
| VL_MERCADORIA | float | 53.0, | YES |  | NAO |
| TP_ESTUFAGEM | char | 1.0 | YES |  | NAO |
| VL_DESP_AG | float | 53.0, | YES |  | NAO |
| IN_PEDIDO | char | 1.0 | YES |  | NAO |
| IN_SELECIONADO | char | 1.0 | YES | ('0') | NAO |
| VL_OVER | float | 53.0, | YES |  | NAO |
| VL_COMISS_IATA | float | 53.0, | YES |  | NAO |
| IN_ACCOUNT | char | 1.0 | YES | ('0') | NAO |
| VL_ACCOUNT | float | 53.0, | YES |  | NAO |
| OUTRA_TAXA_CUSTO | float | 53.0, | YES |  | NAO |
| VL_REC_AG | float | 53.0, | YES |  | NAO |
| VL_REC_BR | float | 53.0, | YES |  | NAO |
| VL_TT_PROF_BR | float | 53.0, | YES |  | NAO |
| VL_TT_PROF_AG | float | 53.0, | YES |  | NAO |
| VL_VENDA_BRASIL | float | 53.0, | YES |  | NAO |
| VL_DESP_REAL | float | 53.0, | YES |  | NAO |
| VL_VENDA_CIA | float | 53.0, | YES |  | NAO |
| VL_CUSTO_CIA | float | 53.0, | YES |  | NAO |
| NR_CONTA_CONTABIL | varchar | 40.0 | YES |  | NAO |
| CD_CT_LUCRO | varchar | 25.0 | YES |  | NAO |
| CD_LOCAL_CONSOLIDACAO | char | 4.0 | YES |  | NAO |
| IN_AS_AGREED | char | 1.0 | YES |  | NAO |
| VL_FAT_COMPLEMENTAR | float | 53.0, | YES |  | NAO |
| DT_RECEBIMENTO | datetime |  | YES |  | NAO |
| DESCR_MERCADORIA | varchar | 100.0 | YES |  | NAO |
| REF_CLIENTE | char | 20.0 | YES |  | NAO |
| CD_USUARIO_ALTEROU_CANAL | char | 4.0 | YES |  | NAO |
| CD_LINGUA_PEDIDO | char | 1.0 | YES |  | NAO |
| NR_COURRIER | varchar | 15.0 | YES |  | NAO |
| CD_ARMAZEM_TABELA_CLIENTE | int | 10.0,0.0 | YES |  | NAO |
| IN_TRANSMITE_SEM_PREVISAO | char | 1.0 | YES |  | NAO |
| VL_OTHER_CHARGE_CC | float | 53.0, | YES |  | NAO |
| CD_TAB_FRETE | char | 5.0 | YES |  | NAO |
| NR_VIAGEM_ARMADOR | char | 15.0 | YES |  | NAO |
| CD_FRONTEIRA | char | 4.0 | YES |  | NAO |
| IN_COURRIER | char | 1.0 | YES |  | NAO |
| NUM_CE | char | 20.0 | YES |  | NAO |
| CD_PRIMEIRO_PORTO_ATRAC | char | 4.0 | YES |  | NAO |
| ID_CODIGO_INSTR_DESEMB | char | 13.0 | YES |  | NAO |
| CD_TERMO_PAGTO | char | 6.0 | YES |  | NAO |
| DIAS_CONDICAO_PAGTO | char | 3.0 | YES |  | NAO |
| CONDICAO_PAGTO | char | 1.0 | YES |  | NAO |
| CD_LOCAL_TRANSBORDO | char | 4.0 | YES |  | NAO |
| IN_PRODUTO_IMPORTADO | char | 1.0 | YES | ('0') | NAO |
| CD_CONTATO_AG | char | 4.0 | YES |  | NAO |
| VL_TRANSIT_TIME | int | 10.0,0.0 | YES |  | NAO |
| VL_AFRMM | float | 53.0, | YES |  | NAO |
| CD_CONSIGNEE | char | 5.0 | YES |  | NAO |
| TP_CONSIGNEE | char | 1.0 | YES |  | NAO |
| IN_DSE | char | 1.0 | YES |  | NAO |
| CD_LOCAL_ENTREGA | char | 4.0 | YES |  | NAO |
| CD_ACORDO | char | 10.0 | YES |  | NAO |
| QNTD_ACORDO | float | 53.0, | YES |  | NAO |
| TP_CERTIFICADO | varchar | 100.0 | YES |  | NAO |
| DOCS_ENVIADO_PARA | char | 5.0 | YES |  | NAO |
| TP_ENVIO_CERTIFICADO | varchar | 30.0 | YES |  | NAO |
| IN_WEB | char | 1.0 | YES |  | NAO |
| CD_ANALISTA_CRIADOR | char | 4.0 | YES |  | NAO |
| NR_PRAZO_VENCTO_ARM | int | 10.0,0.0 | YES |  | NAO |
| CD_RESP_DRAFT | char | 4.0 | YES |  | NAO |
| CD_RESP_DESEMB | char | 4.0 | YES |  | NAO |
| IN_MONEY | int | 10.0,0.0 | YES | ((1)) | NAO |
| IN_PROCESSO_MAPA | char | 1.0 | YES | ('0') | NAO |
| IN_APENAS_EMISSAO_DOCTOS | char | 1.0 | YES | ('0') | NAO |
| IN_DRAWBACK_ALADI | char | 1.0 | YES | ('0') | NAO |
| IN_MBF | char | 1.0 | YES |  | NAO |
| VL_LEAD_TIME | int | 10.0,0.0 | YES |  | NAO |
| QT_MERC_UN_COMERC | float | 53.0, | YES |  | NAO |
| VL_FOB | float | 53.0, | YES |  | NAO |
| CD_UNID_MEDIDA | char | 3.0 | YES |  | NAO |
| DT_NAVIO_ALTERADO | datetime |  | YES |  | NAO |
| IN_CE_ENVIADO | char | 1.0 | YES |  | NAO |
| IN_COBRANCA_DTA | char | 1.0 | YES | ((0)) | NAO |
| TB_ARMAZENAGEM | varchar | 20.0 | YES |  | NAO |
| CD_USUARIO_LIB_TRANS_DI | char | 4.0 | YES |  | NAO |
| DT_LIB_TRANS_DI | datetime |  | YES |  | NAO |
| CD_LOCAL_TRANSBORDO2 | char | 4.0 | YES |  | NAO |
| CD_LOCAL_TRANSBORDO3 | char | 4.0 | YES |  | NAO |
| IN_EXTRATO_DDE_ENVIADO | char | 1.0 | YES |  | NAO |
| NR_DEPOT | char | 4.0 | YES |  | NAO |
| CD_ERP | int | 10.0,0.0 | YES |  | NAO |
| SEQ_POSYSTEM | int | 10.0,0.0 | YES |  | NAO |
| TX_NCM | text | 2147483647.0 | YES |  | NAO |
| CD_NOTIFY1_PROC | char | 5.0 | YES |  | NAO |
| CD_NOTIFY2_PROC | char | 5.0 | YES |  | NAO |
| TP_NOTIFY1_PROC | char | 1.0 | YES |  | NAO |
| TP_NOTIFY2_PROC | char | 1.0 | YES |  | NAO |
| TX_MARCACAO_VOL_PROC | text | 2147483647.0 | YES |  | NAO |
| CD_RUC | varchar | 35.0 | YES |  | NAO |
| CD_DUE | varchar | 14.0 | YES |  | NAO |
| IN_CROSSDOCKING | char | 1.0 | YES |  | NAO |
| VL_DESCONTO_MN | float | 53.0, | YES |  | NAO |
| VL_ACRESCIMO_MN | float | 53.0, | YES |  | NAO |
| IN_DESEMBARACO_SOBRE_AGUAS | char | 1.0 | YES |  | NAO |
| CD_EMBARCACAO_BALDEACAO | char | 4.0 | YES |  | NAO |
| NR_VIAGEM_BALDEACAO | char | 15.0 | YES |  | NAO |
| IN_BALDEACAO | char | 1.0 | YES |  | NAO |
| SEQ_PROG_RODOVIARIA | int | 10.0,0.0 | YES |  | NAO |
| NR_PEDIDO_PGMTO_AFRMM | varchar | 15.0 | YES |  | NAO |
| TX_EMAIL_PROCESSO | varchar | -1.0 | YES |  | NAO |
| IN_PROCESSO_CONSOLIDADO | bit |  | YES |  | NAO |
| CD_DUIMP | char | 16.0 | YES |  | NAO |
| IN_FRETE_ACORDADO | char | 1.0 | YES |  | NAO |
| CD_OPERADOR_TANQUE | char | 4.0 | YES |  | NAO |
| IN_MADEIRA_CONDENADA | char | 1.0 | YES |  | NAO |
| DS_ARMAZEM_MANTRA | char | 5.0 | YES |  | NAO |
| CONSULTA_SISCARGA_FRETE | int | 10.0,0.0 | YES |  | NAO |
| IN_ICMS_EXONERADO | char | 1.0 | YES |  | NAO |
| BOOKING_CONTRACT_NUMBER | varchar | 35.0 | YES |  | NAO |
| BOOKING_CONTRACT_PARTY | varchar | 200.0 | YES |  | NAO |
| BOOKING_MOVE_TYPE | char | 1.0 | YES |  | NAO |
| BOOKING_HS_CODE | varchar | 6.0 | YES |  | NAO |
| BOOKING_CUSTOMER_COMMENTS | varchar | -1.0 | YES |  | NAO |
| BOOKING_PARTNER_EMAIL | varchar | -1.0 | YES |  | NAO |
| IN_MUDANCA_REGIME | char | 1.0 | YES |  | NAO |
| CD_LOCAL_COLETA | char | 4.0 | YES |  | NAO |
| CD_CHAVE_ACESSO_DUE | varchar | 20.0 | YES |  | NAO |
| IN_CSI_MAPA | char | 1.0 | YES |  | NAO |
| IN_COBRANCA_ECAC | char | 1.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** `FK_DEVICE_MESSAGE_PROCESSO`: `DEVICE_MESSAGE`.NR_PROCESSO →; `FK_DEVICE_NOTIFICATION_PROCESSO`: `DEVICE_NOTIFICATION`.NR_PROCESSO →
- **Views referencing (9):** `VW_DT_EMB_DESEMB`, `VW_DT_PAGTO_SDA`, `VW_LI_STATUS`, `VW_PROC_FAT`, `VW_PROC_FAT_VENCTO`, `VW_PROC_SIT_FAT`, `VW_PROCESSO`, `VW_REL_DFF`, `VW_REL_DFT`
- **Cross-DB views:** MYINDAIAV2.`vw_Processo_Resumo`

### `TPROCESSO_EXP`

Columns: 124

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| NR_PROCESSO | char | 18.0 | NO |  | SIM |
| NR_OUTRAS_REF | char | 30.0 | YES |  | NAO |
| CD_EXPORTADOR | char | 5.0 | YES |  | NAO |
| CD_IMPORTADOR | char | 5.0 | YES |  | NAO |
| CD_DESPACHANTE | char | 3.0 | YES |  | NAO |
| CD_AGENTE | char | 4.0 | YES |  | NAO |
| CD_INCOTERM | char | 3.0 | YES |  | NAO |
| CD_PAIS_DESTINO | char | 3.0 | YES |  | NAO |
| CD_MOEDA | char | 3.0 | YES |  | NAO |
| CD_VIA_TRANSPORTE | char | 2.0 | YES |  | NAO |
| CD_TRANSPORTADORA | char | 4.0 | YES |  | NAO |
| CD_SEGURADORA | char | 5.0 | YES |  | NAO |
| CD_REPRESENTANTE | char | 5.0 | YES |  | NAO |
| CD_LOCAL_ORIGEM | char | 4.0 | YES |  | NAO |
| CD_LOCAL_DESTINO | char | 4.0 | YES |  | NAO |
| CD_URF_DESPACHO | char | 7.0 | YES |  | NAO |
| CD_URF_DESTINO | char | 7.0 | YES |  | NAO |
| CD_TERMO_PAGTO | char | 6.0 | YES |  | NAO |
| CD_FORMA_PAGTO | char | 1.0 | YES |  | NAO |
| CD_LINGUA_PEDIDO | char | 1.0 | YES |  | NAO |
| CD_TIPO_FRETE | char | 1.0 | YES |  | NAO |
| CD_USUARIO | char | 4.0 | YES |  | NAO |
| CD_CARTA_CREDITO | char | 15.0 | YES |  | NAO |
| CD_INST_NEGOC | char | 5.0 | YES |  | NAO |
| CD_CONSIGNATARIO | char | 5.0 | YES |  | NAO |
| CD_NOTIFY1 | char | 5.0 | YES |  | NAO |
| CD_NOTIFY2 | char | 5.0 | YES |  | NAO |
| DT_REGISTRO_PEDIDO | datetime |  | YES |  | NAO |
| DT_FATURA | datetime |  | YES |  | NAO |
| IN_DRAWBACK | bit |  | NO | 0 | NAO |
| NR_LI | char | 10.0 | YES |  | NAO |
| NR_FATURA | varchar | 15.0 | YES |  | NAO |
| QT_TOTAL_ITENS | char | 3.0 | YES |  | NAO |
| TX_INF_EMBALAGEM | text | 2147483647.0 | YES |  | NAO |
| TX_MARCACAO_VOLUME | text | 2147483647.0 | YES |  | NAO |
| TX_TERMO_PAGTO | text | 2147483647.0 | YES |  | NAO |
| TX_DECL_ADICIONAL | text | 2147483647.0 | YES |  | NAO |
| TX_DECL_EXPORTADOR | text | 2147483647.0 | YES |  | NAO |
| TP_NOTIFY1 | char | 1.0 | YES |  | NAO |
| TP_NOTIFY2 | char | 1.0 | YES |  | NAO |
| TP_CONSIGNATARIO | char | 1.0 | YES |  | NAO |
| VL_FRETE | float | 53.0, | YES | 0 | NAO |
| VL_SEGURO | float | 53.0, | YES | 0 | NAO |
| VL_PESO_BRUTO | float | 53.0, | YES | 0 | NAO |
| VL_PESO_LIQUIDO | float | 53.0, | YES | 0 | NAO |
| VL_DESCONTO | float | 53.0, | YES | 0 | NAO |
| VL_COMISSAO_PERCENT | float | 53.0, | YES | 0 | NAO |
| VL_TOT_ORIGEM | float | 53.0, | YES | 0 | NAO |
| VL_TOT_CUBAGEM | float | 53.0, | YES | 0 | NAO |
| VL_TOT_FOB | float | 53.0, | YES | 0 | NAO |
| VL_TOT_COM_AGENTE | float | 53.0, | YES | 0 | NAO |
| VL_TOT_QTDE_PROD | float | 53.0, | YES | 0 | NAO |
| VL_TOT_QTDE_EMBALAGEM | float | 53.0, | YES | 0 | NAO |
| VL_TOT_MCV | float | 53.0, | YES | 0 | NAO |
| VL_TOT_EXW | float | 53.0, | YES | 0 | NAO |
| VL_TX_CAMBIO | float | 53.0, | YES | 0 | NAO |
| VL_TOT_CONTAINER | float | 53.0, | YES | 0 | NAO |
| VL_TOT_PALLETS | float | 53.0, | YES | 0 | NAO |
| VL_TOT_DESPESA | float | 53.0, | YES | 0 | NAO |
| NR_SD | char | 11.0 | YES |  | NAO |
| NR_CERTIFICADO | char | 12.0 | YES |  | NAO |
| CD_LOCAL_EMISSAO | char | 3.0 | YES |  | NAO |
| CD_ACORDO | char | 10.0 | YES |  | NAO |
| CD_NORMAS | char | 10.0 | YES |  | NAO |
| TX_OBSERVACAO | text | 2147483647.0 | YES |  | NAO |
| TX_CABECALHO | text | 2147483647.0 | YES |  | NAO |
| IN_ACORDO_ITENS | bit |  | NO | 0 | NAO |
| IN_NORMAS_ITENS | bit |  | NO | 0 | NAO |
| DT_SD | datetime |  | YES |  | NAO |
| IN_FABR_EXPO | char | 1.0 | YES |  | NAO |
| CD_FABRICANTE | char | 5.0 | YES |  | NAO |
| CD_PAIS_ORIGEM | char | 3.0 | YES |  | NAO |
| TP_COPIA | char | 1.0 | YES |  | NAO |
| CD_COPIA | char | 5.0 | YES |  | NAO |
| TP_DOCUMENTO | char | 1.0 | YES |  | NAO |
| CD_DOCUMENTO | char | 5.0 | YES |  | NAO |
| IN_ACORDO2_ITENS | bit |  | NO | 0 | NAO |
| IN_NORMAS2_ITENS | bit |  | NO | 0 | NAO |
| CD_ACORDO2 | char | 10.0 | YES |  | NAO |
| CD_NORMAS2 | char | 10.0 | YES |  | NAO |
| CD_PAIS_ORIG | char | 3.0 | YES |  | NAO |
| IN_VENDA_INCOTERM | bit |  | NO | 0 | NAO |
| TX_MERCADORIA_BL | text | 2147483647.0 | YES |  | NAO |
| IN_DECL_AD_INSTR_EMB | char | 1.0 | YES | ('1') | NAO |
| IN_DECL_AD_PACKING_LIST | char | 1.0 | YES | ('1') | NAO |
| CD_BANCO_SAQUE_BORDERO | char | 5.0 | YES |  | NAO |
| NR_DDE | char | 11.0 | YES |  | NAO |
| IN_REFERENCIA_FAT_INST | char | 1.0 | YES | ('0') | NAO |
| DT_REG_DDE | datetime |  | YES |  | NAO |
| IN_ETIQUETA | char | 1.0 | YES |  | NAO |
| CD_ENQUAD_OP | char | 5.0 | YES |  | NAO |
| VL_SEM_COBERTURA_CAMBIAL | float | 53.0, | YES | 0 | NAO |
| TX_DECL_ADIC_INST_EMB | text | 2147483647.0 | YES |  | NAO |
| TX_CRIT_ORIG_FORM_A | text | 2147483647.0 | YES |  | NAO |
| CD_LOCAL_DESPACHO | char | 4.0 | YES |  | NAO |
| VL_ACRESCIMO | float | 53.0, | YES | 0 | NAO |
| DT_AVISO_EMBARQUE | datetime |  | YES |  | NAO |
| TP_POS_AD | char | 1.0 | YES | ('1') | NAO |
| in_num_fat_auto | char | 1.0 | YES | ('0') | NAO |
| IN_MONTADO | char | 1.0 | YES | ('0') | NAO |
| IN_SELECIONADO | char | 1.0 | YES | ('0') | NAO |
| VL_FRETE_INT | float | 53.0, | YES | 0 | NAO |
| TX_LOGOMARCA | varchar | 25.0 | YES |  | NAO |
| CD_BANCO_SAQUE | char | 5.0 | YES |  | NAO |
| VL_INLAND_FREIGHT | float | 53.0, | YES |  | NAO |
| IN_DUE | bit |  | YES |  | NAO |
| IN_REC_ALFANDEGADO_DESPACHO | bit |  | YES |  | NAO |
| CD_REC_ALFANDEGADO_DESPACHO | char | 7.0 | YES |  | NAO |
| NM_REF_END_REC_ALFAND_DESPACHO | varchar | -1.0 | YES |  | NAO |
| CD_REC_ALFANDEGADO_EMBARQUE | char | 7.0 | YES |  | NAO |
| IN_UM_ENQUAD_POR_PROC | bit |  | YES |  | NAO |
| TX_INFORMACOES_ADICIONAIS | varchar | -1.0 | YES |  | NAO |
| CD_STATUS_DUE | int | 10.0,0.0 | YES |  | NAO |
| DT_ENVIO_DUE | datetime |  | YES |  | NAO |
| CD_CHAVE_ACESSO_DUE | varchar | 20.0 | YES |  | NAO |
| TX_MARCACAO_VOLUME_ESP | varchar | -1.0 | YES |  | NAO |
| IN_TIPO_DOCUMENTO_DUE | int | 10.0,0.0 | YES |  | NAO |
| NR_PROCESSSO_ADM_IMP | varchar | 17.0 | YES |  | NAO |
| DT_PRAZO_VALIDADE_EXP_TEMP | date |  | YES |  | NAO |
| TX_MOTIVO_RETIFICACAO | varchar | 200.0 | YES |  | NAO |
| QT_DIAS_PRAZO_VALIDADE_EXP_TEMP | int | 10.0,0.0 | YES |  | NAO |
| IN_REC_ALFANDEGADO_EMBARQUE | bit |  | YES |  | NAO |
| NM_REF_END_REC_ALFAND_EMBARQUE | varchar | -1.0 | YES |  | NAO |
| TIPOACORDOCOEMRCIAL_ID | int | 10.0,0.0 | YES |  | NAO |

- **FK out:** `FK_TIPOACORDOCOEMRCIAL_ID`: TIPOACORDOCOEMRCIAL_ID → `ACORDO_COMERCIAL`.ID
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TPROCESSO_FATORES_EVENTO`

Columns: 9

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| NR_PROCESSO | char | 18.0 | YES |  | NAO |
| CD_FATOR | int | 10.0,0.0 | YES |  | NAO |
| CD_EVENTO | char | 3.0 | YES |  | NAO |
| CD_SERVICO | int | 10.0,0.0 | YES |  | NAO |
| CD_OPERACAO | char | 1.0 | YES |  | NAO |
| NR_ORDEM | int | 10.0,0.0 | YES |  | NAO |
| DT_OPERACAO | datetime |  | YES |  | NAO |
| CD_EVENTO_ANTERIOR | char | 3.0 | YES |  | NAO |
| NM_DESCRICAO | varchar | 1000.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TPRODUTO`

Columns: 8

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_PRODUTO | char | 2.0 | NO |  | SIM |
| NM_PRODUTO | char | 40.0 | NO |  | NAO |
| AP_PRODUTO | char | 10.0 | NO |  | NAO |
| IN_ATIVO | char | 1.0 | NO |  | NAO |
| CD_VIATRANSP | char | 1.0 | YES |  | NAO |
| CD_CT_GERENCIAL | char | 4.0 | YES |  | NAO |
| TP_FAT_SEM_RECEITA | char | 1.0 | YES |  | NAO |
| TP_PRODUTO | char | 2.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** `FK_TETAPA_PRODUTO_TPRODUTO`: `TETAPA_PRODUTO`.CD_PRODUTO →
- **Views referencing (1):** `VW_PRODUTO`
- **Cross-DB views:** none

### `TREL_DESVIOS_EVENTOS`

Columns: 10

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| NR_IDENTIFICADOR | smallint | 5.0,0.0 | NO |  | NAO |
| NR_PROCESSO | char | 18.0 | NO |  | NAO |
| CD_SERVICO | char | 3.0 | NO |  | NAO |
| MERCADORIA | char | 30.0 | YES |  | NAO |
| AP_EMPRESA | char | 20.0 | YES |  | NAO |
| REFERENCIA | char | 20.0 | YES |  | NAO |
| EVENTOS | char | 40.0 | YES |  | NAO |
| PRESTADORES | char | 40.0 | YES |  | NAO |
| LEAD_TIME | char | 2.0 | YES |  | NAO |
| CANAL | char | 10.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TSERVICO`

Columns: 32

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_SERVICO | char | 3.0 | NO | ((0)) | SIM |
| NM_SERVICO | char | 50.0 | NO |  | NAO |
| CD_CLASSIFICACAO | char | 2.0 | YES |  | NAO |
| CD_VIA_TRANSPORTE | char | 2.0 | YES |  | NAO |
| IN_ATIVO | char | 1.0 | YES | ('1') | NAO |
| NR_DIAS_CONCLUSAO | int | 10.0,0.0 | YES |  | NAO |
| CD_EVENTO_CONCLUSOR | char | 3.0 | YES |  | NAO |
| IN_FOLLOWUP | char | 1.0 | YES |  | NAO |
| IN_ADM_TEMP | char | 1.0 | YES | ('0') | NAO |
| IN_INDENT | char | 1.0 | YES | ('0') | NAO |
| CD_EV_INI | char | 3.0 | YES |  | NAO |
| CD_EV_FIM | char | 3.0 | YES |  | NAO |
| CD_GRUPO | char | 3.0 | YES |  | NAO |
| TP_CTRL_VENCTO | char | 1.0 | YES | ('0') | NAO |
| IN_CHECK | char | 1.0 | NO | ('1') | NAO |
| TP_SERVICO | char | 1.0 | YES | ((0)) | NAO |
| CD_CT_CUSTO_1 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_2 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_3 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_4 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_5 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_6 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_7 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_8 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_9 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_10 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_11 | varchar | 25.0 | YES |  | NAO |
| IN_ALADI | char | 1.0 | YES |  | NAO |
| IN_FUMIGACAO | char | 1.0 | YES |  | NAO |
| NR_CAD_CONFIG_STATUS | int | 10.0,0.0 | YES |  | NAO |
| IN_SUBSTITUI | char | 1.0 | YES | ('0') | NAO |
| IN_LI | char | 1.0 | YES | ('0') | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (1):** `VW_SERVICO_GERAL`
- **Cross-DB views:** none

### `TSERVICO_CLASSIFICACAO`

Columns: 2

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_CLASSIFICACAO | char | 2.0 | NO |  | SIM |
| NM_CLASSIFICACAO | varchar | 20.0 | NO |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TSERVICO_EVENTO`

Columns: 11

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_SERVICO | char | 3.0 | NO |  | SIM |
| CD_EVENTO | char | 3.0 | NO |  | SIM |
| NR_ORDEM | float | 53.0, | NO |  | NAO |
| CD_EV_BASICO | char | 3.0 | YES |  | NAO |
| PZ_DO_EV_BASICO | float | 53.0, | YES |  | NAO |
| CD_EV_FUTURO | char | 3.0 | YES |  | NAO |
| PZ_ATE_EV_FUTURO | float | 53.0, | YES |  | NAO |
| CD_TIPO_EVENTO | char | 2.0 | YES |  | NAO |
| IN_DASHBOARD | bit |  | YES |  | NAO |
| IN_PRAZO_UTIL | char | 1.0 | YES |  | NAO |
| IN_PRAZO_FERIADO | char | 1.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (1):** `VW_SERVICO_EVENTO_GERAL`
- **Cross-DB views:** none

### `TSERVICO_EVENTO_NOVO`

Columns: 11

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_SERVICO | int | 10.0,0.0 | NO | ((0)) | SIM |
| CD_EVENTO | char | 3.0 | NO | ((0)) | SIM |
| NR_ORDEM | float | 53.0, | NO |  | NAO |
| CD_EV_BASICO | char | 3.0 | YES |  | NAO |
| PZ_DO_EV_BASICO | float | 53.0, | YES |  | NAO |
| CD_EV_FUTURO | char | 3.0 | YES |  | NAO |
| PZ_ATE_EV_FUTURO | float | 53.0, | YES |  | NAO |
| CD_TIPO_EVENTO | char | 2.0 | YES |  | NAO |
| IN_DASHBOARD | bit |  | YES | ((0)) | NAO |
| IN_PRAZO_UTIL | char | 1.0 | YES |  | NAO |
| IN_PRAZO_FERIADO | char | 1.0 | YES |  | NAO |

- **FK out:** `TEVENTO_TSERVICO_EVENTO_NOVO`: CD_EVENTO → `TEVENTO`.CD_EVENTO; `TSERVICO_NOVO_TSERVICO_EVENTO_NOVO`: CD_SERVICO → `TSERVICO_NOVO`.CD_SERVICO
- **FK in:** NOT IN SOURCE
- **Views referencing (1):** `VW_SERVICO_EVENTO_GERAL`
- **Cross-DB views:** none

### `TSERVICO_NOVO`

Columns: 32

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_SERVICO | int | 10.0,0.0 | NO |  | SIM |
| NM_SERVICO | char | 50.0 | NO |  | NAO |
| CD_CLASSIFICACAO | char | 2.0 | YES |  | NAO |
| CD_VIA_TRANSPORTE | char | 2.0 | YES |  | NAO |
| IN_ATIVO | char | 1.0 | YES | ('1') | NAO |
| NR_DIAS_CONCLUSAO | int | 10.0,0.0 | YES |  | NAO |
| CD_EVENTO_CONCLUSOR | char | 3.0 | YES |  | NAO |
| IN_FOLLOWUP | char | 1.0 | YES |  | NAO |
| IN_ADM_TEMP | char | 1.0 | YES | ('0') | NAO |
| IN_INDENT | char | 1.0 | YES | ('0') | NAO |
| CD_EV_INI | char | 3.0 | YES |  | NAO |
| CD_EV_FIM | char | 3.0 | YES |  | NAO |
| CD_GRUPO | char | 3.0 | YES |  | NAO |
| TP_CTRL_VENCTO | char | 1.0 | YES | ('0') | NAO |
| IN_CHECK | char | 1.0 | NO | ('1') | NAO |
| TP_SERVICO | char | 1.0 | YES | ('0') | NAO |
| CD_CT_CUSTO_1 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_2 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_3 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_4 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_5 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_6 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_7 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_8 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_9 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_10 | varchar | 25.0 | YES |  | NAO |
| CD_CT_CUSTO_11 | varchar | 25.0 | YES |  | NAO |
| IN_ALADI | char | 1.0 | YES |  | NAO |
| IN_FUMIGACAO | char | 1.0 | YES |  | NAO |
| NR_CAD_CONFIG_STATUS | int | 10.0,0.0 | YES |  | NAO |
| IN_SUBSTITUI | char | 1.0 | YES | ('0') | NAO |
| IN_LI | char | 1.0 | YES | ('0') | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** `TFATORES_SERVICOS_TSERVICO_NOVO`: `TFATORES_SERVICOS`.CD_SERVICO →; `TSERVICO_NOVO_TSERVICO_EVENTO_NOVO`: `TSERVICO_EVENTO_NOVO`.CD_SERVICO →
- **Views referencing (1):** `VW_SERVICO_GERAL`
- **Cross-DB views:** none

### `TSETOR`

Columns: 2

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_SETOR | int | 10.0,0.0 | NO |  | NAO |
| NM_SETOR | varchar | 255.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TSISTEMAS`

Columns: 4

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_SISTEMA | int | 10.0,0.0 | NO |  | SIM |
| NM_SISTEMA | varchar | 50.0 | YES |  | NAO |
| NM_APLICATIVO | varchar | 1000.0 | YES |  | NAO |
| NM_PROCESSO | varchar | 255.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** `FK_CD_SISTEMA`: `TCARGO_SISTEMAS`.CD_SISTEMA →
- **Views referencing (1):** `VW_RESTRICOES_ACESSO_SISTEMAS`
- **Cross-DB views:** none

### `TTP_TIPO_EVENTO`

Columns: 2

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_TIPO_EVENTO | char | 2.0 | NO |  | SIM |
| NM_TIPO_EVENTO | char | 20.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none

### `TUNID_NEG`

Columns: 40

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_UNID_NEG | char | 2.0 | NO |  | SIM |
| NM_UNID_NEG | char | 50.0 | NO |  | NAO |
| AP_UNID_NEG | char | 10.0 | NO |  | NAO |
| IN_ATIVO | char | 1.0 | NO |  | NAO |
| VL_ALIQ_ISS | float | 53.0, | YES |  | NAO |
| CGC_UNID_NEG | char | 14.0 | YES |  | NAO |
| CD_FILIAL | char | 3.0 | YES |  | NAO |
| END_UNID_NEG | char | 50.0 | YES |  | NAO |
| END_NUMERO | char | 6.0 | YES |  | NAO |
| END_COMPL | char | 20.0 | YES |  | NAO |
| END_BAIRRO | char | 30.0 | YES |  | NAO |
| END_CIDADE | char | 30.0 | YES |  | NAO |
| END_UF | char | 2.0 | YES |  | NAO |
| IE_UNID_NEG | char | 20.0 | YES |  | NAO |
| IM_UNID_NEG | char | 20.0 | YES |  | NAO |
| NR_FONE | varchar | 20.0 | YES |  | NAO |
| END_CEP | char | 8.0 | YES |  | NAO |
| NR_FAX1 | varchar | 20.0 | YES |  | NAO |
| NR_FAX2 | varchar | 20.0 | YES |  | NAO |
| NM_SLOGAN | char | 100.0 | YES |  | NAO |
| NR_NOTA_FATURA | char | 6.0 | YES |  | NAO |
| NM_EMAIL | char | 100.0 | YES |  | NAO |
| PATH_RELATORIOS | varchar | 100.0 | YES |  | NAO |
| PATH_SISCOMEX | varchar | 100.0 | YES |  | NAO |
| PATH_REI | varchar | 100.0 | YES |  | NAO |
| NM_DIRETOR | char | 50.0 | YES |  | NAO |
| NR_CPF_DIRETOR | char | 11.0 | YES |  | NAO |
| NM_CONTADOR | char | 50.0 | YES |  | NAO |
| NR_CRC_CONTADOR | char | 15.0 | YES |  | NAO |
| NM_PROCURADOR | char | 50.0 | YES |  | NAO |
| NR_CPF_PROCURADOR | char | 11.0 | YES |  | NAO |
| CD_PAIS | char | 3.0 | YES |  | NAO |
| NR_PROC_NF_PREF | varchar | 20.0 | YES |  | NAO |
| NR_LIVRO | varchar | 5.0 | YES |  | NAO |
| NM_SIGLA | char | 3.0 | YES |  | NAO |
| VL_PERC_ISS | float | 53.0, | YES |  | NAO |
| CD_BANCO_CONCILIACAO | char | 3.0 | YES |  | NAO |
| CD_DAC | char | 20.0 | YES |  | NAO |
| CD_CT_CUSTO | char | 4.0 | YES |  | NAO |
| ID_ARQUIVO_NOVOEX | varchar | 10.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (1):** `VW_AJUSTE_IMPRESSAO_NF_SERV_INDAIA`
- **Cross-DB views:** none

### `TUNID_NEG_PRODUTO`

Columns: 10

| Column | Type | Len/Prec | Null | Default | PK |
|---|---|---|---|---|---|
| CD_UNID_NEG | char | 2.0 | NO |  | SIM |
| CD_PRODUTO | char | 2.0 | NO |  | SIM |
| IN_ATIVO | char | 1.0 | NO | ('1') | NAO |
| NR_ULT_FATURA | numeric | 6.0,0.0 | YES | 0 | NAO |
| NR_ULT_NOTA | numeric | 6.0,0.0 | YES | 0 | NAO |
| NR_ULT_PROCESSO | numeric | 6.0,0.0 | YES | 0 | NAO |
| NR_ULT_PREVISAO | char | 6.0 | YES | 0 | NAO |
| TX_NUMERARIO_OBS | text | 2147483647.0 | YES |  | NAO |
| TX_NUMERARIO_ASS | text | 2147483647.0 | YES |  | NAO |
| CD_CT_GERENCIAL | char | 4.0 | YES |  | NAO |

- **FK out:** NOT IN SOURCE
- **FK in:** NOT IN SOURCE
- **Views referencing (0):** none
- **Cross-DB views:** none


## Part 3 — Column-name concordance (implicit join keys)

Columns appearing in 3+ tables of the set. These are the de facto relationships.

| Column | # tables | Tables |
|---|--:|---|
| `CD_EVENTO` | 14 | DEVICE_NOTIFICATION, TETAPA, TETAPA_PRODUTO_EVENTO, TEVENTO, TEVENTO_ATZ, TEVENTO_AUTOMATICO, TEVENTO_PO, TFATORES_EVENTO, TFOLLOWUP, TFOLLOWUP_TMP, TMOD_FOLLOW_UP_EVENTO, TPROCESSO_FATORES_EVENTO, TSERVICO_EVENTO, TSERVICO_EVENTO_NOVO |
| `CD_SERVICO` | 12 | TCLIENTE_SERVICO, TFATORES_EVENTO, TFATORES_SERVICOS, TFOLLOWUP, TFOLLOWUP_TMP, TPROCESSO, TPROCESSO_FATORES_EVENTO, TREL_DESVIOS_EVENTOS, TSERVICO, TSERVICO_EVENTO, TSERVICO_EVENTO_NOVO, TSERVICO_NOVO |
| `IN_ATIVO` | 12 | TCARGO, TCARGO_SISTEMAS, TCLIENTE_SERVICO, TETAPA, TETAPA_OLD, TETAPA_PRODUTO, TEVENTO, TPRODUTO, TSERVICO, TSERVICO_NOVO, TUNID_NEG, TUNID_NEG_PRODUTO |
| `NR_PROCESSO` | 11 | DEVICE_MESSAGE, DEVICE_NOTIFICATION, TDECLARACAO_IMPORTACAO, TFOLLOWUP, TFOLLOWUP_ETAPA, TFOLLOWUP_IGNORE_TRIGGERS, TFOLLOWUP_TMP, TPROCESSO, TPROCESSO_EXP, TPROCESSO_FATORES_EVENTO, TREL_DESVIOS_EVENTOS |
| `CD_PRODUTO` | 10 | TCLIENTE_SERVICO, TETAPA, TETAPA_AUTOMATICA_ORDENA, TETAPA_PRODUTO, TEVENTO_AUTOMATICO, TFATORES, TFOLLOWUP_ETAPA, TPROCESSO, TPRODUTO, TUNID_NEG_PRODUTO |
| `NR_ORDEM` | 9 | TETAPA_AUTOMATICA_ORDENA, TEVENTO_PO, TFOLLOWUP, TFOLLOWUP_TMP, TMOD_FOLLOW_UP_EVENTO, TPROCESSO, TPROCESSO_FATORES_EVENTO, TSERVICO_EVENTO, TSERVICO_EVENTO_NOVO |
| `CD_UNID_NEG` | 8 | TCLIENTE_SERVICO, TETAPA, TETAPA_AUTOMATICA_ORDENA, TFATORES, TFOLLOWUP_ETAPA, TPROCESSO, TUNID_NEG, TUNID_NEG_PRODUTO |
| `CD_ETAPA` | 6 | TETAPA, TETAPA_OLD, TETAPA_PRODUTO, TETAPA_PRODUTO_EVENTO, TEVENTO, TFOLLOWUP_ETAPA |
| `CD_USUARIO` | 5 | DEVICE_MESSAGE, DEVICE_NOTIFICATION, TFOLLOWUP_ETAPA, TPROCESSO, TPROCESSO_EXP |
| `CD_EV_BASICO` | 4 | TEVENTO_PO, TFOLLOWUP, TSERVICO_EVENTO, TSERVICO_EVENTO_NOVO |
| `CD_FATOR` | 4 | TFATORES, TFATORES_EVENTO, TFATORES_SERVICOS, TPROCESSO_FATORES_EVENTO |
| `CD_GRUPO` | 4 | TFATORES, TPROCESSO, TSERVICO, TSERVICO_NOVO |
| `PZ_DO_EV_BASICO` | 4 | TEVENTO_PO, TFOLLOWUP, TSERVICO_EVENTO, TSERVICO_EVENTO_NOVO |
| `CD_CLASSIFICACAO` | 3 | TSERVICO, TSERVICO_CLASSIFICACAO, TSERVICO_NOVO |
| `CD_EV_FUTURO` | 3 | TEVENTO_PO, TSERVICO_EVENTO, TSERVICO_EVENTO_NOVO |
| `CD_IMPORTADOR` | 3 | TDECLARACAO_IMPORTACAO, TPROCESSO, TPROCESSO_EXP |
| `CD_INCOTERM` | 3 | TDECLARACAO_IMPORTACAO, TPROCESSO, TPROCESSO_EXP |
| `CD_TIPO_EVENTO` | 3 | TSERVICO_EVENTO, TSERVICO_EVENTO_NOVO, TTP_TIPO_EVENTO |
| `CD_VIA_TRANSPORTE` | 3 | TPROCESSO_EXP, TSERVICO, TSERVICO_NOVO |
| `ID` | 3 | ACORDO_COMERCIAL, DEVICE_MESSAGE, DEVICE_NOTIFICATION |
| `IN_PRAZO_FERIADO` | 3 | TFATORES_EVENTO, TSERVICO_EVENTO, TSERVICO_EVENTO_NOVO |
| `IN_PRAZO_UTIL` | 3 | TFATORES_EVENTO, TSERVICO_EVENTO, TSERVICO_EVENTO_NOVO |
| `IN_SELECIONADO` | 3 | TCARGO, TPROCESSO, TPROCESSO_EXP |
| `NM_ETAPA` | 3 | TETAPA, TETAPA_OLD, TETAPA_PRODUTO |
| `PZ_ATE_EV_FUTURO` | 3 | TEVENTO_PO, TSERVICO_EVENTO, TSERVICO_EVENTO_NOVO |

## Part 4 — Extraction notes

- Tables in set with **no primary key**: `TEVENTO_AUTOMATICO`, `TEVENTO_ATZ`, `TETAPA_AUTOMATICA_ORDENA`, `TETAPAS_DESPACHO`, `TFOLLOWUP_TMP`, `TFOLLOWUP_IGNORE_TRIGGERS`, `TPROCESSO_FATORES_EVENTO`, `TSETOR`, `TREL_DESVIOS_EVENTOS`
- Tables with duplicate column names (ordinal-order assumption unsafe): none
- Widest tables: `TPROCESSO` (316), `TDECLARACAO_IMPORTACAO` (156), `TPROCESSO_EXP` (124), `TUNID_NEG` (40), `TEVENTO` (39), `TSERVICO_NOVO` (32), `TSERVICO` (32), `TFOLLOWUP` (25)