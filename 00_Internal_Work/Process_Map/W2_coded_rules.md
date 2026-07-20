# Wave 2b — Coded Business Rules for Workflow Writing Routines

This document catalogs the exact business rules enforced by the **98 workflow-writing routines** identified in `W2_coded_rules_matrix.md` (`Writes` column). Every entry is derived deterministically from code inspection of the actual T-SQL definition stored in the base CSVs. No rules are invented or inferred purely from names.

- **Scope**: Exactly 98 routines that execute write operations (`INSERT`, `UPDATE`, `DELETE`) on workflow tables (`TFOLLOWUP*`, `TSERVICO*`, `TEVENTO*`, `TETAPA*`, `TPROCESSO*`, `TDECLARACAO_IMPORTACAO*`, `TCLIENTE_SERVICO*`).

- **Ordering**: Group 1 (`TFOLLOWUP` / `TSERVICO` / `TEVENTO` / `TETAPA` writers) is presented first, grouped by source file. Group 2 (Other workflow writers) follows, grouped by source file.

- **Special Handling**: `TR_FOLLOWUP` receives a dedicated, fully decomposed section covering every branch, condition, and write operation.


---

## Group 1 — `TFOLLOWUP` / `TSERVICO` / `TEVENTO` / `TETAPA` Writers


### Source File: `store_procedures_BROKER.csv`

#### `SP_ATUALIZA_FOLLOWUP`

| Field | Content |
| --- | --- |
| **Name** | `SP_ATUALIZA_FOLLOWUP` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TCLIENTE_SERVICO`, `TFERIADO`, `TFOLLOWUP`, `TPROCESSO`, `TSERVICO`, `TSERVICO_EVENTO_NOVO`, `TTRANSIT_TIME_EXP`, `TVIAGEM`, `VW_SERVICO_GERAL` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | `@NR_PROCESSO CHAR(18))` |
| **Calls** | `SP_ATZ_FOLLOWUP`, `SP_LISTA_EVENTOS_PROCESSO`, `SP_CRIA_FOLLOWUP`, `SP_ATUALIZA_DASHBOARD` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Executes dependent procedure `SP_ATZ_FOLLOWUP` to propagate workflow updates. (Developer note: 'Verificar se há a mesma quantidade de eventos no followup e no serviço, e verifi')
  ```sql
EXEC  SP_ATZ_FOLLOWUP @NR_PROCESSO                    RETURN
END                             /* Variáveis fixas de eventos  */
DECLARE  @CD_EVENTO_PREV_CHEGADA     CHAR(3) = '333'
DECLARE  @CD_EVENTO_PREV_CHEGADA_ATZ CHAR(3) = '668'
  ```

- **CLEAR**: Inserts new tracking/workflow records into `@EVENTOS`. (Developer note: 'Verificar se há a mesma quantidade de eventos no followup e no serviço, e verifi')
  ```sql
INSERT  INTO @EVENTOS
EXEC  SP_LISTA_EVENTOS_PROCESSO @NR_PROCESSO, '0'
--/*-- Verificar se há a mesma quantidade de eventos no followup e no serviço, e verificar se são os mesmos eventos que constam
IF  (((
  ```

- **CLEAR**: Executes dependent procedure `SP_LISTA_EVENTOS_PROCESSO` to propagate workflow updates. (Developer note: 'Verificar se há a mesma quantidade de eventos no followup e no serviço, e verifi')
  ```sql
EXEC  SP_LISTA_EVENTOS_PROCESSO @NR_PROCESSO, '0'
--/*-- Verificar se há a mesma quantidade de eventos no followup e no serviço, e verificar se são os mesmos eventos que constam
IF  (((
SELECT  COUNT(*) FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = @NR_PROCESSO) <> (
  ```

- **CLEAR**: Executes dependent procedure `SP_CRIA_FOLLOWUP` to propagate workflow updates. (Developer note: 'Verificar se há a mesma quantidade de eventos no followup e no serviço, e verifi')
  ```sql
EXEC  SP_CRIA_FOLLOWUP @NR_PROCESSO
ELSE
BEGIN                     /* Atualizar Ordens, caso estejam diferentes  */
IF  (
  ```

#### `SP_CRIA_FOLLOWUP`

| Field | Content |
| --- | --- |
| **Name** | `SP_CRIA_FOLLOWUP` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `SYS`, `TFOLLOWUP`, `TPROCESSO` |
| **Tables written** | `INSERT TFOLLOWUP`, `DELETE TFOLLOWUP` |
| **Parameters** | `@NR_PROCESSO CHAR(18))` |
| **Calls** | `SP_LISTA_EVENTOS_PROCESSO` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `@TFOLLOWUP_BKP`.
  ```sql
INSERT  INTO @TFOLLOWUP_BKP
SELECT  NR_PROCESSO,               CD_SERVICO,               CD_EVENTO,               IN_APLICAVEL,               CD_RESP_APLICACAO,               CD_RESP_REALIZACAO,               CD_RESP_INSPECAO,               DT_APLICACAO,               DT_REALIZACAO,               DT_INSPECAO,               CD_RESULT_INSPECAO,               NR_RNC,               DT_PREVISTA,               DT_LIMITE,               NR_ORDEM,               TX_OBS,               IN_BLOQUEADO,               IN_ALERTA_ENVIADO,               QT_DIAS_DESVIO,               DT_REALIZACAO_EFETIVA,               DT_ALERTA_ENVIADO,               IN_EDI_ENVIADO,               CD_EV_BASICO,               PZ_DO_EV_BASICO        FROM TFOLLOWUP (NOLOCK)        WHERE NR_PROCESSO = @NR_PROCESSO
DECLARE  @EVENTOS AS TABLE (            CD_EVENTO        CHAR(3),            CD_EVENTO_BASE   CHAR(3),            PZ_EVENTO_BASE   INT,            IN_PRAZO_UTIL    CHAR(1),            IN_PRAZO_FERIADO CHAR(1),            NR_ORDEM         INT        )
INSERT  INTO @EVENTOS
  ```

- **CLEAR**: Inserts new tracking/workflow records into `@EVENTOS`.
  ```sql
INSERT  INTO @EVENTOS
EXEC  SP_LISTA_EVENTOS_PROCESSO @NR_PROCESSO, '1'            /*
DECLARE  @NM_TRIGGER VARCHAR(255)
DECLARE  @TRIGGERS_FOLLOWUP AS TABLE (            NM_TRIGGER VARCHAR(255)        )
  ```

- **CLEAR**: Executes dependent procedure `SP_LISTA_EVENTOS_PROCESSO` to propagate workflow updates.
  ```sql
EXEC  SP_LISTA_EVENTOS_PROCESSO @NR_PROCESSO, '1'            /*
DECLARE  @NM_TRIGGER VARCHAR(255)
DECLARE  @TRIGGERS_FOLLOWUP AS TABLE (            NM_TRIGGER VARCHAR(255)        )
INSERT  INTO @TRIGGERS_FOLLOWUP
  ```

- **CLEAR**: Inserts new tracking/workflow records into `@TRIGGERS_FOLLOWUP`.
  ```sql
INSERT  INTO @TRIGGERS_FOLLOWUP
SELECT  TR.NAME        FROM SYS.TRIGGERS TR           INNER JOIN SYS.TABLES TB ON TB.OBJECT_ID = TR.PARENT_ID        WHERE TB.NAME = 'TFOLLOWUP'          AND IS_DISABLED = 0;
DECLARE  @TMP_TRIGGERS_FOLLOWUP AS TABLE (            NM_TRIGGER VARCHAR(255)        )        */            /* Incluído para só efetuar as operações se houver diferença no followup (sugestão do Carlos Rosa) - Michel - 20/09/2012  */
IF  (
  ```

#### `SP_LIMPA_PROCESSOS`

| Field | Content |
| --- | --- |
| **Name** | `SP_LIMPA_PROCESSOS` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TACRESCIMO_DEDUCAO`, `TACRESCIMO_VALORACAO`, `TADICAO_DE_IMPORTACAO`, `TATO_VINCULADO`, `TAUX_ADICAO_ITENS`, `TAUX_EXP_NORMAS`, `TAUX_EXP_REF`, `TAUX_PROC_AB_FAT`, `TAUX_PROC_PAG_DES_DI`, `TCALCULO_RATEIO_DESP`, `TCARGA_ARMAZEM`, `TCASH_ARMAZENAGEM`, `TDA`, `TDA_LIB_AVARIA`, `TDA_LOTE`, `TDA_REF`, `TDA_VENCTO`, `TDECLARACAO_IMPORTACAO`, `TDEDUCAO_VALORACAO`, `TDEM_FAT_CNTR`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TDEVOLUCAO`, `TDEVOLUCAO_ITENS`, `TDI_NVE`, `TDOCUMENTO_INSTRUCAO`, `TDOCUMENTO_VINCULADO`, `TEMBALAGEM_CARGA`, `TERRO_ATZ`, `TESTAGIO_PROCESSO`, `TEXP_CARTA_CRED`, `TEXTRATO`, `TFATURAMENTO_CC`, `TFATURAMENTO_CC_CLIENTE`, `TFAT_CALCULO_RATEIO_DESP`, `TFOLLOWUP`, `TFOLLOWUP_ETAPA`, `TICMS_SUL`, `TIMP_NACIONALIZADOS`, `TINSTRUCAO_CARGA`, `TLICENCA_IMPORTACAO`, `TLICENCA_ITENS`, `TLICENCA_NVE`, `TLIQUIDACAO`, `TLOG_FOLLOWUP`, `TLOG_TRANSMISSAO`, `TMP_EXPORTACAO`, `TMP_EXPORTACAO_FINAL`, `TNAC`, `TNAC_ITEM`, `TNAC_RET_MERC`, `TNF_RETENCAO`, `TNF_SERV_OP`, `TNF_SERV_OP_ITEM`, `TNF_SERV_OP_NUM`, `TNUMERARIO`, `TNUMERARIO_IMP`, `TNUMERARIO_ITEM_SOLIC`, `TNUMERARIO_NOTIFICA`, `TNUMERARIO_NOTIFICA_ITEM`, `TNUMERARIO_SALDO_POR_ITEM`, `TPAGAMENTO_PREVISTO`, `TPAGAMENTO_TRIBUTOS`, `TPAGAMENTO_VINCULADO`, `TPAGTO_PREVISTO_CAMBIO_DI`, `TPREVISAO`, `TPREVISAO_ADICAO`, `TPREVISAO_CUSTO`, `TPREVISAO_DESPESA`, `TPROCESSO`, `TPROCESSO_ARMAZEM_DESPESAS_CANCELADAS`, `TPROCESSO_CARGA_SOLTA`, `TPROCESSO_CARGA_SOLTA_BKP`, `TPROCESSO_CNTR`, `TPROCESSO_CNTR_BKP`, `TPROCESSO_DESEMB_MIC_DTA`, `TPROCESSO_DESPESAS`, `TPROCESSO_DI`, `TPROCESSO_EMBALAGEM`, `TPROCESSO_EXP`, `TPROCESSO_EXP_BORD`, `TPROCESSO_EXP_BORD_ITEM`, `TPROCESSO_EXP_DDE_NF`, `TPROCESSO_EXP_DDE_RE`, `TPROCESSO_EXP_DESP`, `TPROCESSO_EXP_ITEM`, `TPROCESSO_EXP_NF`, `TPROCESSO_EXP_NF_ITEM`, `TPROCESSO_EXP_PEDIDO`, `TPROCESSO_EXP_RE`, `TPROCESSO_EXP_SAQUE`, `TPROCESSO_FATURA_AG`, `TPROCESSO_FORMA`, `TPROCESSO_IN50`, `TPROCESSO_LI`, `TPROCESSO_LI_ORGAO_ANUENTE`, `TPROCESSO_MIC_DTA`, `TPROCESSO_NF`, `TPROCESSO_PALETIZACAO`, `TPROCESSO_POR_VEICULO`, `TPROCESSO_RE`, `TPROCESSO_REQUERIMENTO`, `TPROCESSO_SDA`, `TPROCESSO_SDA_LOG`, `TPROCESSO_STATUS_ICMS`, `TPROC_ANUENTES`, `TRAT_AREA_IMP`, `TRAT_ITEM_IMP`, `TRAT_PROCESSO_IMP`, `TRECEBIMENTO`, `TRECEBIMENTO_AG`, `TRECEBIMENTO_ITEM_RECEB`, `TRECEBIMENTO_PROCESSO`, `TRECEBIMENTO_PROCESSO_ITEM`, `TREF_CLIENTE`, `TREF_CLIENTE_EMBARQUE`, `TREF_CLIENTE_LWW`, `TREF_CLIENTE_MEMO`, `TRE_ANEXO`, `TRE_ANEXO_FABRIC`, `TRE_ANEXO_PURO`, `TRE_CAPA`, `TRIBUTO`, `TSOLIC_PAGTO`, `TS_FATURA`, `TS_FATURA_DOCUMENTO`, `TS_FATURA_PROCESSO`, `TS_FATURA_PROCESSO_ITEM`, `TTEMP_DIAGN_DB_SUSP`, `TTEMP_HOUSE`, `TTEMP_ICMS_SUL`, `TTEMP_PREV_FAT_ITEM`, `TVALORACAO_NCM` |
| **Tables written** | `DELETE TFOLLOWUP_ETAPA`, `DELETE TFOLLOWUP`, `DELETE TPROCESSO_EXP`, `DELETE TPROCESSO`, `DELETE TDECLARACAO_IMPORTACAO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `TDECLARACAO_IMPORTACAO`. (Developer note: 'SELECIONANDO PRIMEIRO PROCESSO DA TEMPORÁRIA')
  ```sql
DELETE  FROM TDECLARACAO_IMPORTACAO     WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TADICAO_DE_IMPORTACAO      WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TDETALHE_MERCADORIA        WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TACRESCIMO_DEDUCAO         WHERE NR_PROCESSO = @PROCESSO
  ```

- **CLEAR**: Removes outdated or cancelled records from `TADICAO_DE_IMPORTACAO`. (Developer note: 'SELECIONANDO PRIMEIRO PROCESSO DA TEMPORÁRIA')
  ```sql
DELETE  FROM TADICAO_DE_IMPORTACAO      WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TDETALHE_MERCADORIA        WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TACRESCIMO_DEDUCAO         WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TACRESCIMO_VALORACAO       WHERE NR_PROCESSO = @PROCESSO
  ```

- **CLEAR**: Removes outdated or cancelled records from `TDETALHE_MERCADORIA`. (Developer note: 'SELECIONANDO PRIMEIRO PROCESSO DA TEMPORÁRIA')
  ```sql
DELETE  FROM TDETALHE_MERCADORIA        WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TACRESCIMO_DEDUCAO         WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TACRESCIMO_VALORACAO       WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TDEDUCAO_VALORACAO         WHERE NR_PROCESSO = @PROCESSO
  ```

- **CLEAR**: Removes outdated or cancelled records from `TACRESCIMO_DEDUCAO`. (Developer note: 'SELECIONANDO PRIMEIRO PROCESSO DA TEMPORÁRIA')
  ```sql
DELETE  FROM TACRESCIMO_DEDUCAO         WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TACRESCIMO_VALORACAO       WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TDEDUCAO_VALORACAO         WHERE NR_PROCESSO = @PROCESSO
DELETE  FROM TDESTAQUE_NCM              WHERE NR_PROCESSO = @PROCESSO
  ```

#### `sp_atualiza_deadline`

| Field | Content |
| --- | --- |
| **Name** | `sp_atualiza_deadline` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TPROCESSO` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atualiza_deadline    Script Date: 26111998 19:0')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = I.DT_DEADLINE_BL + CASE ISDATE(ISNULL(LEFT(REPLACE(I.HR_DEADLINE_BL + '00', ' ', '0'), 8), '00:00:00'))                                                   WHEN 0                                                  THEN 0
ELSE  CONVERT(DATETIME, ISNULL(LEFT(REPLACE(I.HR_DEADLINE_BL + '00', ' ', '0'), 8), '00:00:00'), 108)
END         FROM TPROCESSO        P (NOLOCK),            TVIAGEM_DEADLINE I (NOLOCK),            TFOLLOWUP        F (NOLOCK)        WHERE I.CD_UNID_NEG   = (CASE P.CD_UNID_NEG WHEN '07' THEN '01'
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atualiza_deadline    Script Date: 26111998 19:0')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = I.DT_DEADLINE_CARGA + CASE ISDATE(ISNULL(LEFT(REPLACE(I.HR_DEADLINE_CARGA + '00', ' ', '0'), 8), '00:00:00'))                                                      WHEN 0                                                     THEN 0
ELSE  CONVERT(DATETIME, ISNULL(LEFT(REPLACE(I.HR_DEADLINE_CARGA + '00', ' ', '0'), 8), '00:00:00'), 108)
END         FROM TPROCESSO        P (NOLOCK),            TVIAGEM_DEADLINE I (NOLOCK),            TFOLLOWUP        F (NOLOCK)        WHERE I.CD_UNID_NEG   = (CASE P.CD_UNID_NEG WHEN '07' THEN '01'
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atualiza_deadline    Script Date: 26111998 19:0')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = I.DT_DEADLINE_VGM + CASE ISDATE(ISNULL(LEFT(REPLACE(I.HR_DEADLINE_VGM + '00', ' ', '0'), 8), '00:00:00'))                                                      WHEN 0                                                     THEN 0
ELSE  CONVERT(DATETIME, ISNULL(LEFT(REPLACE(I.HR_DEADLINE_VGM + '00', ' ', '0'), 8), '00:00:00'), 108)
END         FROM TPROCESSO        P (NOLOCK),            TVIAGEM_DEADLINE I (NOLOCK),            TFOLLOWUP        F (NOLOCK)        WHERE I.CD_UNID_NEG   = (CASE P.CD_UNID_NEG WHEN '07' THEN '01'
  ```

#### `sp_atz_evento`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_evento` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TFOLLOWUP`, `TPARAMETROS`, `TUSUARIO` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | `@NR_PROCESSO CHAR(18)`, `@CD_EVENTO_TXT CHAR(20)`, `@DT_REALIZACAO DATETIME)` |
| **Calls** | `SP_ATZ_FOLLOWUP` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions.
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO      = @DT_REALIZACAO,                CD_RESP_REALIZACAO = ISNULL(@CD_USUARIO, '0000'),                DT_INSPECAO        = @DT_REALIZACAO,                CD_RESP_INSPECAO   = ISNULL(@CD_USUARIO, '0000'),                CD_RESULT_INSPECAO = 'C'            WHERE NR_PROCESSO  = @NR_PROCESSO              AND CD_EVENTO    = @CD_EVENTO              AND IN_APLICAVEL = '1'
IF  @@ROWCOUNT > 0
EXEC  SP_ATZ_FOLLOWUP @NR_PROCESSO                RETURN (0)
  ```

- **CLEAR**: Executes dependent procedure `SP_ATZ_FOLLOWUP` to propagate workflow updates.
  ```sql
EXEC  SP_ATZ_FOLLOWUP @NR_PROCESSO                RETURN (0)
--
END
END
  ```

#### `sp_atz_followup`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_followup` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TCLIENTE_SERVICO`, `TFERIADO`, `TFOLLOWUP`, `TGRUPO`, `TPARAMETROS`, `TPROCESSO`, `TSERVICO`, `TSERVICO_EVENTO`, `TTRANSIT_TIME_EXP`, `TVIAGEM`, `VW_SERVICO_GERAL` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | `@NR_PROCESSO CHAR(18))` |
| **Calls** | `SP_ATUALIZA_FOLLOWUP`, `SP_GRAVA_ERRO`, `SP_ATUALIZA_DASHBOARD` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Executes dependent procedure `SP_ATUALIZA_FOLLOWUP` to propagate workflow updates.
  ```sql
EXEC  SP_ATUALIZA_FOLLOWUP @NR_PROCESSO*/
IF  DBO.FN_PROCESSO_SERVICO_NOVO(@NR_PROCESSO) = '1'
BEGIN
EXEC  SP_ATUALIZA_FOLLOWUP @NR_PROCESSO              RETURN
  ```

- **CLEAR**: Executes dependent procedure `SP_ATUALIZA_FOLLOWUP` to propagate workflow updates.
  ```sql
EXEC  SP_ATUALIZA_FOLLOWUP @NR_PROCESSO              RETURN
END
ELSE
BEGIN
  ```

- **CLEAR**: Updates records in `F` based on process parameters or status transitions.
  ```sql
UPDATE  F
SET  NR_ORDEM = E.NR_ORDEM,                             CD_EV_BASICO = E.CD_EV_BASICO,                             PZ_DO_EV_BASICO = E.PZ_DO_EV_BASICO,                             DT_PREVISTA = NULL,                             DT_LIMITE   = NULL                        FROM TFOLLOWUP       F (NOLOCK) ,                           TSERVICO_EVENTO E (NOLOCK)                       WHERE F.CD_SERVICO  = E.CD_SERVICO                         AND F.CD_EVENTO   = E.CD_EVENTO                         AND F.NR_PROCESSO = @NR_PROCESSO
END
ELSE
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions.
  ```sql
UPDATE  TFOLLOWUP
SET  DT_PREVISTA = NULL,                             DT_LIMITE   = NULL                        FROM TFOLLOWUP (NOLOCK)                           WHERE NR_PROCESSO = @NR_PROCESSO
END
-- ATUALIZAR AS DATAS DE REALIZAÇÃO DE ACORDO COM O CADASTRO DE SERVIÇO DO CLIENTE - HORA NOS EVENTOS - MICHEL - 04/08/2010                  /*
  ```

#### `sp_atz_myindaia_followup`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_myindaia_followup` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `MYINDAIA`, `TATZ_MYINDAIA_FOLLOWUP`, `TEVENTO`, `TFOLLOWUP`, `TFOLLOWUP_ETAPA`, `TPROCESSO`, `TVIAGEM_DEADLINE` |
| **Tables written** | `INSERT TFOLLOWUP_ETAPA`, `INSERT TFOLLOWUP` |
| **Parameters** | `@data int` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `PR`.
  ```sql
DELETE  PR        FROM TATZ_MYINDAIA_FOLLOWUP PR (NOLOCK), #TMP_FOLLOWUP FE        WHERE FE.NR_PROCESSO = PR.NR_PROCESSO          AND FE.NM_TABELA   = PR.NM_TABELA
DELETE  FU FROM MYINDAIA.DBO.TFOLLOWUP       FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
DELETE  FU FROM MYINDAIA.DBO.TFOLLOWUP_ETAPA FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
DELETE  FU FROM MYINDAIA.DBO.TFOLLOWUP_OBS   FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
  ```

- **CLEAR**: Removes outdated or cancelled records from `FU`.
  ```sql
DELETE  FU FROM MYINDAIA.DBO.TFOLLOWUP       FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
DELETE  FU FROM MYINDAIA.DBO.TFOLLOWUP_ETAPA FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
DELETE  FU FROM MYINDAIA.DBO.TFOLLOWUP_OBS   FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
DELETE  FU FROM MYINDAIA.DBO.TFLP_EXPORT     FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
  ```

- **CLEAR**: Removes outdated or cancelled records from `FU`.
  ```sql
DELETE  FU FROM MYINDAIA.DBO.TFOLLOWUP_ETAPA FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
DELETE  FU FROM MYINDAIA.DBO.TFOLLOWUP_OBS   FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
DELETE  FU FROM MYINDAIA.DBO.TFLP_EXPORT     FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
--inicio da seleção e inserção dos registros da tabela tb_followup da base myindaia em relação aos         --processo que constam na tabela #TMP_PROCESSO
  ```

- **CLEAR**: Removes outdated or cancelled records from `FU`.
  ```sql
DELETE  FU FROM MYINDAIA.DBO.TFOLLOWUP_OBS   FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
DELETE  FU FROM MYINDAIA.DBO.TFLP_EXPORT     FU (NOLOCK), #TMP_FOLLOWUP FE WHERE FU.NR_PROCESSO = FE.NR_PROCESSO
--inicio da seleção e inserção dos registros da tabela tb_followup da base myindaia em relação aos         --processo que constam na tabela #TMP_PROCESSO
INSERT  INTO MYINDAIA.DBO.TFOLLOWUP (          NR_PROCESSO, CD_SERVICO, CD_EVENTO, DT_REALIZACAO, DT_PREVISTA, DT_LIMITE, NR_ORDEM, IN_APLICAVEL )
  ```

#### `sp_atz_myindaia_followup2`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_myindaia_followup2` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `BROKER`, `MYINDAIA`, `TATZ_MYINDAIA_FOLLOWUP`, `TEVENTO`, `TFOLLOWUP`, `TPROCESSO` |
| **Tables written** | `INSERT TFOLLOWUP_ETAPA`, `DELETE TFOLLOWUP_ETAPA`, `INSERT TFOLLOWUP` |
| **Parameters** | `@DATA INT` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `ATZ`. (Developer note: 'ATUALIZA APENAS EXPORTAÇÃO                                                    PR')
  ```sql
DELETE  ATZ                                   FROM BROKER.DBO.TATZ_MYINDAIA_FOLLOWUP ATZ (NOLOCK)                        INNER JOIN BROKER.DBO.TPROCESSO        PR  (NOLOCK) ON PR.NR_PROCESSO = ATZ.NR_PROCESSO                         WHERE PR.IN_CANCELADO = '1'                                                                         /*SELECIONA OS REGISTROS DE EXPORTAÇÃO  */
SELECT  TOP 500 ATZ.NR_PROCESSO,                                      NM_TABELA,                                     MIN(AP_USUARIO) AS AP_USUARIO,                                      PR.CD_CLIENTE                                  INTO #TMP_FOLLOWUP                                  FROM BROKER.DBO.TATZ_MYINDAIA_FOLLOWUP ATZ (NOLOCK)                      /* ATENDENDO A COCORRENCIA 05081/07  (DENILZA) EXCLUÍ O ÍTEM IW PARA QUE POSSAM SER TRANSFERIDOS PARA A BASE WEB*/                       /*WHERE SUBSTRING(NR_PROCESSO,5,2) NOT IN ('EW','FT','
IF ','IW','PO','TE','TS')*/                          INNER JOIN BROKER.DBO.TPROCESSO      PR  (NOLOCK) ON PR.NR_PROCESSO = ATZ.NR_PROCESSO                        WHERE SUBSTRING(ATZ.NR_PROCESSO,5,2) NOT IN ('EW','FT','PO','TE','TS','NE','FE')                             AND NM_TABELA = 'TFOLLOWUP'                                AND YEAR(PR.DT_ABERTURA) >= @DATA                            AND PR.IN_CANCELADO = '0'                        GROUP BY ATZ.NR_PROCESSO, PR.CD_CLIENTE, NM_TABELA                                  ORDER BY AP_USUARIO, MIN(CD_ATUALIZACAO)
WHILE  ((
  ```

- **CLEAR**: Removes outdated or cancelled records from `#TMP_FOLLOWUP`. (Developer note: 'ATUALIZA APENAS EXPORTAÇÃO                                                    PR')
  ```sql
DELETE  #TMP_FOLLOWUP                            FROM #TMP_FOLLOWUP                            WHERE NR_PROCESSO = @NR_PROCESSO
DELETE  FU                             FROM MYINDAIA.DBO.TFOLLOWUP FU (NOLOCK)                           WHERE FU.NR_PROCESSO = @NR_PROCESSO
INSERT  INTO MYINDAIA.DBO.TFOLLOWUP (                                        NR_PROCESSO, CD_SERVICO, CD_EVENTO, DT_REALIZACAO, DT_PREVISTA, DT_LIMITE, NR_ORDEM, IN_APLICAVEL, CD_RESP_REALIZACAO )
SELECT  DISTINCT                                        FP.NR_PROCESSO,                           FP.CD_SERVICO,                           FP.CD_EVENTO,                           FP.DT_REALIZACAO,                           FP.DT_PREVISTA,                           FP.DT_LIMITE,                           FP.NR_ORDEM,                           FP.IN_APLICAVEL,                           FP.CD_RESP_REALIZACAO                                        FROM BROKER.DBO.TFOLLOWUP FP (NOLOCK)                           WHERE ISNULL( FP.IN_BLOQUEADO, '0' ) = '0'                                AND FP.NR_PROCESSO = @NR_PROCESSO
  ```

- **CLEAR**: Removes outdated or cancelled records from `FU`. (Developer note: 'ATUALIZA APENAS EXPORTAÇÃO                                                    PR')
  ```sql
DELETE  FU                             FROM MYINDAIA.DBO.TFOLLOWUP FU (NOLOCK)                           WHERE FU.NR_PROCESSO = @NR_PROCESSO
INSERT  INTO MYINDAIA.DBO.TFOLLOWUP (                                        NR_PROCESSO, CD_SERVICO, CD_EVENTO, DT_REALIZACAO, DT_PREVISTA, DT_LIMITE, NR_ORDEM, IN_APLICAVEL, CD_RESP_REALIZACAO )
SELECT  DISTINCT                                        FP.NR_PROCESSO,                           FP.CD_SERVICO,                           FP.CD_EVENTO,                           FP.DT_REALIZACAO,                           FP.DT_PREVISTA,                           FP.DT_LIMITE,                           FP.NR_ORDEM,                           FP.IN_APLICAVEL,                           FP.CD_RESP_REALIZACAO                                        FROM BROKER.DBO.TFOLLOWUP FP (NOLOCK)                           WHERE ISNULL( FP.IN_BLOQUEADO, '0' ) = '0'                                AND FP.NR_PROCESSO = @NR_PROCESSO
DELETE  MYINDAIA.DBO.TFOLLOWUP_ETAPA                            FROM MYINDAIA.DBO.TFOLLOWUP_ETAPA (NOLOCK)                           WHERE NR_PROCESSO = @NR_PROCESSO
  ```

- **CLEAR**: Inserts new tracking/workflow records into `MYINDAIA.DBO.TFOLLOWUP`. (Developer note: 'ATUALIZA APENAS EXPORTAÇÃO                                                    PR')
  ```sql
INSERT  INTO MYINDAIA.DBO.TFOLLOWUP (                                        NR_PROCESSO, CD_SERVICO, CD_EVENTO, DT_REALIZACAO, DT_PREVISTA, DT_LIMITE, NR_ORDEM, IN_APLICAVEL, CD_RESP_REALIZACAO )
SELECT  DISTINCT                                        FP.NR_PROCESSO,                           FP.CD_SERVICO,                           FP.CD_EVENTO,                           FP.DT_REALIZACAO,                           FP.DT_PREVISTA,                           FP.DT_LIMITE,                           FP.NR_ORDEM,                           FP.IN_APLICAVEL,                           FP.CD_RESP_REALIZACAO                                        FROM BROKER.DBO.TFOLLOWUP FP (NOLOCK)                           WHERE ISNULL( FP.IN_BLOQUEADO, '0' ) = '0'                                AND FP.NR_PROCESSO = @NR_PROCESSO
DELETE  MYINDAIA.DBO.TFOLLOWUP_ETAPA                            FROM MYINDAIA.DBO.TFOLLOWUP_ETAPA (NOLOCK)                           WHERE NR_PROCESSO = @NR_PROCESSO
INSERT  INTO MYINDAIA.DBO.TFOLLOWUP_ETAPA (                                        CD_UNID_NEG, CD_PRODUTO, NR_PROCESSO, CD_FOLLOWUP_ETAPA, CD_ETAPA, CD_USUARIO, DT_ALTERACAO )
  ```

#### `sp_atz_obs_flwup`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_obs_flwup` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TFOLLOWUP` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | `@nr_processo char(18)`, `@texto char(500)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Object:  StoredProcedure [dbo].[sp_atz_obs_flwup]    Script Date: 07152010 18:03')
  ```sql
UPDATE  TFOLLOWUP
SET  TX_OBS=null   where  nr_processo = @NR_PROCESSO and CD_EVENTO = '022'
SELECT  @ptr_proc =  TEXTPTR(TX_OBS)        FROM   TFOLLOWUP ( NOLOCK )        where nr_processo = @NR_PROCESSO and CD_EVENTO = '022'
END
  ```

#### `sp_atz_veiculo`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_veiculo` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TFOLLOWUP`, `TPROCESSO_POR_VEICULO` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | `@cd_evento char(3)`, `@dt_realizacao datetime`, `@cd_usuario char(4))` |
| **Calls** | `sp_atz_followup` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions.
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO      = @dt_realizacao,          CD_RESP_REALIZACAO = ISNULL(@cd_usuario, '0000'),          DT_INSPECAO        = @dt_realizacao,          CD_RESP_INSPECAO   = ISNULL(@cd_usuario, '0000'),          CD_RESULT_INSPECAO = 'C'      FROM TFOLLOWUP F, TPROCESSO_POR_VEICULO P      WHERE F.NR_PROCESSO    = P.NR_PROCESSO        AND F.CD_EVENTO      = @cd_evento        AND F.IN_APLICAVEL   = '1'        AND P.IN_POR_VEICULO = '1'        AND P.CD_USUARIO     = @cd_usuario
--AND ISNULL(F.DT_REALIZACAO, '') = ''
DECLARE  c_veic CURSOR FOR
  ```

- **CLEAR**: Executes dependent procedure `sp_atz_followup` to propagate workflow updates.
  ```sql
EXEC  sp_atz_followup @nr_processo
FETCH  c_veic INTO @nr_processo
END
CLOSE  c_veic
  ```

- **CLEAR**: Removes outdated or cancelled records from `TPROCESSO_POR_VEICULO`.
  ```sql
DELETE  TPROCESSO_POR_VEICULO  WHERE CD_USUARIO = @cd_usuario  RETURN (0)
  ```

#### `sp_duplica_eventos`

| Field | Content |
| --- | --- |
| **Name** | `sp_duplica_eventos` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TSERVICO_EVENTO` |
| **Tables written** | `INSERT TSERVICO_EVENTO` |
| **Parameters** | `@cd_servico_fonte char(3)`, `@cd_servico_destino char(3)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TSERVICO_EVENTO`. (Developer note: 'Object:  Stored Procedure dbo.sp_duplica_eventos    Script Date: 02091999 08:57:')
  ```sql
INSERT  INTO TSERVICO_EVENTO
SELECT  @cd_servico_destino, CD_EVENTO, NR_ORDEM, CD_EV_BASICO, PZ_DO_EV_BASICO, CD_EV_FUTURO, PZ_ATE_EV_FUTURO, CD_TIPO_EVENTO     FROM   TSERVICO_EVENTO     WHERE  CD_SERVICO = @cd_servico_fonte
  ```

#### `sp_ev_prev_emb`

| Field | Content |
| --- | --- |
| **Name** | `sp_ev_prev_emb` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TFOLLOWUP`, `TPARAMETROS` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_ev_prev_fabrica  Script Date: 26111998 19:07:06')
  ```sql
UPDATE  TFOLLOWUP
SET     DT_REALIZACAO = @dt_realizacao     WHERE  NR_PROCESSO   = @nr_processo       AND  CD_EVENTO     = @cd_ev_prev_embarque
END       /*  ROLLBACK TRAN
SET  XACT_ABORT OFF  */
  ```

#### `sp_ev_prev_fabrica`

| Field | Content |
| --- | --- |
| **Name** | `sp_ev_prev_fabrica` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TFERIADO`, `TFOLLOWUP`, `TPARAMETROS`, `TPROCESSO` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | `@nr_processo char(18)`, `@cd_evento char(3))` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_ev_prev_fabrica  Script Date: 26111998 19:07:06')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = (CASE                                       WHEN (CONVERT (INT, @dt_prev_fabrica) < @controle) THEN NULL
ELSE  @dt_prev_fabrica
END  )              WHERE NR_PROCESSO = @nr_processo                AND CD_EVENTO   = @cd_ev_prev_fabrica
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_ev_prev_fabrica  Script Date: 26111998 19:07:06')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = CASE                                          WHEN (CONVERT(INT, @dt_prev_fabrica) < @controle) THEN NULL
ELSE  @dt_prev_fabrica
END                   WHERE NR_PROCESSO = @nr_processo                    AND CD_EVENTO   = @cd_ev_prev_fabrica
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_ev_prev_fabrica  Script Date: 26111998 19:07:06')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = CASE                                              WHEN (CONVERT(INT, @dt_prev_fabrica) < @controle) THEN NULL
ELSE  @dt_prev_fabrica
END                       WHERE NR_PROCESSO = @nr_processo                        AND CD_EVENTO   = @cd_ev_prev_fabrica
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_ev_prev_fabrica  Script Date: 26111998 19:07:06')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = CASE                                  WHEN (CONVERT(INT, @dt_realizacao) < @controle) THEN NULL
ELSE  @dt_realizacao
END           WHERE NR_PROCESSO = @nr_processo            AND CD_EVENTO   = @cd_ev_prev_fabrica
  ```

#### `sp_ev_prev_fabrica_viagem`

| Field | Content |
| --- | --- |
| **Name** | `sp_ev_prev_fabrica_viagem` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TPARAMETROS`, `TPROCESSO`, `TVIAGEM` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | `@cd_unid_neg char(2)`, `@cd_produto char(2)`, `@cd_embarcacao char(4)`, `@nr_viagem char(4)`, `@cd_local char` |
| **Calls** | `sp_ev_prev_fabrica` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Executes dependent procedure `sp_ev_prev_fabrica` to propagate workflow updates. (Developer note: 'Object:  Stored Procedure dbo.sp_ev_prev_fabrica  Script Date: 26111998 19:07:06')
  ```sql
EXEC  sp_ev_prev_fabrica @nr_processo, @cd_ev_espera_navio
EXEC  sp_ev_prev_fabrica @nr_processo, @cd_ev_ent
FETCH  c_proc_imp INTO @nr_processo
END
  ```

- **CLEAR**: Executes dependent procedure `sp_ev_prev_fabrica` to propagate workflow updates. (Developer note: 'Object:  Stored Procedure dbo.sp_ev_prev_fabrica  Script Date: 26111998 19:07:06')
  ```sql
EXEC  sp_ev_prev_fabrica @nr_processo, @cd_ev_ent
FETCH  c_proc_imp INTO @nr_processo
END
CLOSE  c_proc_imp
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_ev_prev_fabrica  Script Date: 26111998 19:07:06')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = CASE                                      WHEN (CONVERT(INT, @dt_prevista) < @controle) THEN NULL
ELSE  @dt_prevista
END               WHERE NR_PROCESSO = @nr_processo                AND CD_EVENTO   = @cd_ev_prev_embarque
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_ev_prev_fabrica  Script Date: 26111998 19:07:06')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = CASE                                      WHEN (CONVERT(INT, @dt_embarque) < @controle) THEN NULL
ELSE  @dt_embarque
END               WHERE NR_PROCESSO = @nr_processo                AND CD_EVENTO   = @cd_ev_embarque
  ```

#### `sp_exclui_servico_evento`

| Field | Content |
| --- | --- |
| **Name** | `sp_exclui_servico_evento` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TSERVICO_EVENTO` |
| **Tables written** | `UPDATE TSERVICO_EVENTO`, `DELETE TSERVICO_EVENTO` |
| **Parameters** | `@cd_servico char(3)`, `@cd_evento char(3)`, `@in_consiste bit` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `TSERVICO_EVENTO`. (Developer note: 'Object:  Stored Procedure dbo.sp_exclui_servico_evento    Script Date: 02091999 ')
  ```sql
DELETE  TSERVICO_EVENTO  WHERE  CD_SERVICO = @cd_servico AND         CD_EVENTO  = @cd_evento
UPDATE  TSERVICO_EVENTO
SET     NR_ORDEM   = NR_ORDEM - 1  WHERE  CD_SERVICO = @cd_servico AND         NR_ORDEM > @nr_ordem  RETURN (0)
  ```

- **CLEAR**: Updates records in `TSERVICO_EVENTO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_exclui_servico_evento    Script Date: 02091999 ')
  ```sql
UPDATE  TSERVICO_EVENTO
SET     NR_ORDEM   = NR_ORDEM - 1  WHERE  CD_SERVICO = @cd_servico AND         NR_ORDEM > @nr_ordem  RETURN (0)
  ```

#### `sp_fat_canc`

| Field | Content |
| --- | --- |
| **Name** | `sp_fat_canc` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TS_FATURA`, `TS_FATURA_PROCESSO` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | `@cd_unid_neg char(2)`, `@cd_produto char(2)`, `@nr_solicitacao char(6)`, `@cd_usuario char(4))` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TS_FATURA` based on process parameters or status transitions. (Developer note: 'comentado André 21102008 a tabela não é mais usada   Cancela registro na TNF_RET')
  ```sql
UPDATE  TS_FATURA
SET  IN_CANCELADO    = '1',       DT_CANCELAMENTO = CONVERT(DATETIME, CONVERT(CHAR(10), GETDATE(), 103), 103),      CD_CANCELADOR   = @cd_usuario  WHERE CD_UNID_NEG    = @cd_unid_neg    AND CD_PRODUTO     = @cd_produto    AND NR_SOLICITACAO = @nr_solicitacao
DELETE  TFATURAMENTO_CC  WHERE CD_UNID_NEG    = @cd_unid_neg    AND CD_PRODUTO     = @cd_produto    AND NR_SOLIC_FAT   = @nr_solicitacao    AND CD_ORIGEM_LANC = '6'
DELETE  TFATURAMENTO_CC_CLIENTE  WHERE IN_FATURA = '1'    AND NR_PROCESSO IN (
  ```

- **CLEAR**: Removes outdated or cancelled records from `TFATURAMENTO_CC`. (Developer note: 'comentado André 21102008 a tabela não é mais usada   Cancela registro na TNF_RET')
  ```sql
DELETE  TFATURAMENTO_CC  WHERE CD_UNID_NEG    = @cd_unid_neg    AND CD_PRODUTO     = @cd_produto    AND NR_SOLIC_FAT   = @nr_solicitacao    AND CD_ORIGEM_LANC = '6'
DELETE  TFATURAMENTO_CC_CLIENTE  WHERE IN_FATURA = '1'    AND NR_PROCESSO IN (
SELECT  NR_PROCESSO                        FROM TS_FATURA_PROCESSO                        WHERE CD_UNID_NEG    = @cd_unid_neg                          AND CD_PRODUTO     = @cd_produto                          AND NR_SOLICITACAO = @nr_solicitacao)
UPDATE  TFATURAMENTO_CC
  ```

- **CLEAR**: Removes outdated or cancelled records from `TFATURAMENTO_CC_CLIENTE`. (Developer note: 'comentado André 21102008 a tabela não é mais usada   Cancela registro na TNF_RET')
  ```sql
DELETE  TFATURAMENTO_CC_CLIENTE  WHERE IN_FATURA = '1'    AND NR_PROCESSO IN (
SELECT  NR_PROCESSO                        FROM TS_FATURA_PROCESSO                        WHERE CD_UNID_NEG    = @cd_unid_neg                          AND CD_PRODUTO     = @cd_produto                          AND NR_SOLICITACAO = @nr_solicitacao)
UPDATE  TFATURAMENTO_CC
SET  IN_FATURADO   = '0',      CD_UNID_NEG   = NULL,      CD_PRODUTO    = NULL,      NR_SOLIC_FAT  = NULL  WHERE CD_UNID_NEG    = @cd_unid_neg    AND CD_PRODUTO     = @cd_produto    AND NR_SOLIC_FAT   = @nr_solicitacao    /*
  ```

- **CLEAR**: Updates records in `TFATURAMENTO_CC` based on process parameters or status transitions. (Developer note: 'comentado André 21102008 a tabela não é mais usada   Cancela registro na TNF_RET')
  ```sql
UPDATE  TFATURAMENTO_CC
SET  IN_FATURADO   = '0',      CD_UNID_NEG   = NULL,      CD_PRODUTO    = NULL,      NR_SOLIC_FAT  = NULL  WHERE CD_UNID_NEG    = @cd_unid_neg    AND CD_PRODUTO     = @cd_produto    AND NR_SOLIC_FAT   = @nr_solicitacao    /*
-- comentado André 21/10/2008 a tabela não é mais usada  -- Cancela registro na TNF_RETENCAO
UPDATE  TNF_RETENCAO
  ```

#### `sp_integracao`

| Field | Content |
| --- | --- |
| **Name** | `sp_integracao` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TDIVERGENCIA`, `TEMPRESA_NAC`, `TFOLLOWUP`, `TINT_MESQUITA005`, `TINT_MESQUITA007`, `TINT_MESQUITA009`, `TMENSAGEM_AUX`, `TPROCESSO`, `TPROCESSO_CARGA_SOLTA`, `TPROCESSO_CNTR`, `TUSUARIO` |
| **Tables written** | `UPDATE TFOLLOWUP`, `UPDATE TPROCESSO` |
| **Parameters** | `@nr_identificador int`, `@ident int` |
| **Calls** | `xp_sendmail` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TDIVERGENCIA`. (Developer note: 'Se a tabela já existe na base, apago (pode ter ocorrido algum erro na    integra')
  ```sql
INSERT  INTO TDIVERGENCIA      VALUES (@ident, 'DIV;2;Cliente não cadastrado:;' + @cnpj_005 + ' BL: ' + @bl_005 + ' CH Pres ' + @chpres_005 )
END
ELSE
BEGIN
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TDIVERGENCIA`. (Developer note: 'Se a tabela já existe na base, apago (pode ter ocorrido algum erro na    integra')
  ```sql
INSERT  INTO TDIVERGENCIA        VALUES (@ident, 'DIV;4;Processo não encontrado ;BL:;' + @bl_005 + ';CH PRES:;' + @chpres_005 )
END
ELSE
BEGIN
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'Se a tabela já existe na base, apago (pode ter ocorrido algum erro na    integra')
  ```sql
UPDATE  TPROCESSO
SET     DT_PRESENCA_CARGA = @dtpres_005            WHERE  NR_CONHECIMENTO = @bl_005              AND  NR_PRESENCA_CARGA = @chpres_005
END
ELSE
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TDIVERGENCIA`. (Developer note: 'Se a tabela já existe na base, apago (pode ter ocorrido algum erro na    integra')
  ```sql
INSERT  INTO TDIVERGENCIA              VALUES (@ident,'DIV;3;Data da presença de carga divergente ' + ';Processo:;' + @nr_processo +                             ';BL:;' + @bl_005 + ';Presença:;' + @chpres_005 +                             ';no Banco:;' + CONVERT( CHAR(10), @dt_pres, 103 ) + ';no TXT:;' + CONVERT( CHAR(10), @dtpres_005, 103 ))
END
END
END
  ```

#### `sp_integracao_automatica`

| Field | Content |
| --- | --- |
| **Name** | `sp_integracao_automatica` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `BROKER`, `TEMPRESA_NAC`, `TFOLLOWUP`, `TINT_MESQUITA005_JOB`, `TINT_MESQUITA007_JOB`, `TINT_MESQUITA008_JOB`, `TINT_MESQUITA009_JOB`, `TINT_MESQUITA013_JOB`, `TPROCESSO`, `TPROCESSO_CARGA_SOLTA`, `TPROCESSO_CNTR`, `TTP_CNTR`, `TUSUARIO` |
| **Tables written** | `UPDATE TFOLLOWUP`, `UPDATE TPROCESSO` |
| **Parameters** | `@ds_path varchar(100)` |
| **Calls** | `xp_cmdshell`, `xp_sendmail` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TINT_MESQUITA007_JOB` based on process parameters or status transitions. (Developer note: ''H:\DDBroker\ftp_mesquita\'  (    @ds_path varchar(100)  )  AS')
  ```sql
UPDATE  TINT_MESQUITA007_JOB
SET  OBS_AVARIA = REPLACE(AVARIA_CARGA_SOLTA, '"', ''),      CH_PRESENCA = REPLACE(T005.CH_PRESENCA, '"', '')  FROM TINT_MESQUITA008_JOB T008, TINT_MESQUITA007_JOB T007, TINT_MESQUITA005_JOB T005  WHERE T005.NM_CNPJ = T007.NM_CNPJ AND T005.NM_NAVIO = T007.NM_NAVIO AND        T005.VIAGEM  = T007.VIAGEM AND T005.NR_BL = T007.NR_BL AND        T005.NM_PORTO = T007.NM_PORTO AND        T008.NM_CNPJ =* T007.NM_CNPJ AND T008.NM_NAVIO =* T007.NM_NAVIO AND        T008.VIAGEM  =* T007.VIAGEM AND T008.NR_BL =* T007.NR_BL AND        T008.NM_PORTO =* T007.NM_PORTO AND T008.NM_ARMADOR =* T007.NM_ARMADOR AND        T008.NR_SEQUENCIA =* T007.NR_SEQUENCIA
UPDATE  TINT_MESQUITA009_JOB
SET  DT_ATRACACAO = CAST(REPLACE(REPLACE(REPLACE(T003.DT_ATRACACAO, '"', ''), '/', '-'), '
  ```

- **CLEAR**: Updates records in `TINT_MESQUITA009_JOB` based on process parameters or status transitions. (Developer note: ''H:\DDBroker\ftp_mesquita\'  (    @ds_path varchar(100)  )  AS')
  ```sql
UPDATE  TINT_MESQUITA009_JOB
SET  DT_ATRACACAO = CAST(REPLACE(REPLACE(REPLACE(T003.DT_ATRACACAO, '"', ''), '/', '-'), '
--', '') AS DATETIME),      CH_PRESENCA = REPLACE(T005.CH_PRESENCA, '"', ''),      TX_OBS_AVARIA = REPLACE(LOCAL_AVARIA_CNTR, '"', '') + ' ' + REPLACE(AVARIA_CNTR, '"', '') + ' ' +       REPLACE(COMPL_AVARIA_CNTR, '"', '')   FROM TINT_MESQUITA013_JOB T013, TINT_MESQUITA005_JOB T005, TINT_MESQUITA003_JOB T003, TINT_MESQUITA009_JOB T009  WHERE T003.NM_CNPJ = T009.NM_CNPJ AND         T003.NM_NAVIO = T009.NM_NAVIO AND         T003.VIAGEM = T009.VIAGEM AND        T005.NM_CNPJ = T009.NM_CNPJ AND T005.NM_NAVIO = T009.NM_NAVIO AND        T005.VIAGEM  = T009.VIAGEM AND T005.NR_BL = T009.NR_BL AND        T005.NM_PORTO = T009.NM_PORTO AND        T005.NM_CNPJ = T013.NM_CNPJ AND T005.NM_NAVIO = T013.NM_NAVIO AND        T005.VIAGEM  = T013.VIAGEM AND T005.NR_BL = T013.NR_BL AND        T005.NM_PORTO = T013.NM_PORTO     -- Grava as divergências
INSERT  INTO TDIVERGENCIA_JOB (TX_MOTIVO)
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TDIVERGENCIA_JOB`. (Developer note: ''H:\DDBroker\ftp_mesquita\'  (    @ds_path varchar(100)  )  AS')
  ```sql
INSERT  INTO TDIVERGENCIA_JOB (TX_MOTIVO)
SELECT  'DIV1: Registro ( do arq.TBE009.TXT ) não gravado - não há correspondente no TBE005.TXT - Cliente:'+          T009.NM_CNPJ + 'Navio:' + T009.NM_NAVIO + 'Viagem:' + T009.VIAGEM + 'BL:' + T009.NR_BL +    'Porto:' + T009.NM_PORTO + 'Armador:' + T009.NM_ARMADOR   FROM TINT_MESQUITA009_JOB T009  WHERE T009.NM_CNPJ NOT IN (
SELECT  T005.NM_CNPJ FROM TINT_MESQUITA005_JOB T005        WHERE T005.NM_CNPJ = T009.NM_CNPJ AND T005.NM_NAVIO = T009.NM_NAVIO AND              T005.VIAGEM = T009.VIAGEM AND T005.NR_BL = T009.NR_BL AND            T005.NM_PORTO = T009.NM_PORTO)
-- Se a tabela já existe na base, apago (pode ter ocorrido algum erro na   -- integração anterior que impediu de o processo ser concluído)  /*
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TDIVERGENCIA_JOB`. (Developer note: ''H:\DDBroker\ftp_mesquita\'  (    @ds_path varchar(100)  )  AS')
  ```sql
INSERT  INTO TDIVERGENCIA_JOB      VALUES ('DIV2: Cliente não cadastrado: ' + @cnpj_005 + ' BL: ' + @bl_005 + ' CH Pres ' + @chpres_005 )
END
ELSE
BEGIN
  ```

#### `sp_muda_servico`

| Field | Content |
| --- | --- |
| **Name** | `sp_muda_servico` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TCLIENTE_SERVICO`, `TFOLLOWUP`, `TPROCESSO`, `TSERVICO_EVENTO` |
| **Tables written** | `UPDATE TFOLLOWUP`, `DELETE TFOLLOWUP` |
| **Parameters** | `@nr_processo char(18))` |
| **Calls** | `SP_CRIA_FOLLOWUP`, `sp_atz_followup` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Executes dependent procedure `SP_CRIA_FOLLOWUP` to propagate workflow updates. (Developer note: 'Verifica se Incide SDA')
  ```sql
EXEC  SP_CRIA_FOLLOWUP @NR_PROCESSO
ELSE
BEGIN
DECLARE  @cd_servico         char(3)
  ```

- **CLEAR**: Updates records in `TPROCESSO_SDA` based on process parameters or status transitions. (Developer note: 'Verifica se Incide SDA')
  ```sql
UPDATE  TPROCESSO_SDA
SET  CD_STATUS = CASE                              WHEN @in_incide_sda = '0' THEN '4'
ELSE  CASE CD_STATUS                                   WHEN '4' THEN '0'
ELSE  CD_STATUS
  ```

- **CLEAR**: Removes outdated or cancelled records from `TFOLLOWUP`. (Developer note: 'Verifica se Incide SDA')
  ```sql
DELETE  TFOLLOWUP              WHERE NR_PROCESSO = @nr_processo                AND CD_EVENTO NOT IN (
SELECT  CD_EVENTO                                       FROM TSERVICO_EVENTO                                      WHERE CD_SERVICO = @cd_servico)
UPDATE  TFOLLOWUP
SET  CD_SERVICO = @cd_servico              WHERE NR_PROCESSO = @nr_processo
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Verifica se Incide SDA')
  ```sql
UPDATE  TFOLLOWUP
SET  CD_SERVICO = @cd_servico              WHERE NR_PROCESSO = @nr_processo
UPDATE  F
SET  CD_EV_BASICO    = S.CD_EV_BASICO,                  PZ_DO_EV_BASICO = S.PZ_DO_EV_BASICO              FROM TFOLLOWUP F, TSERVICO_EVENTO S              WHERE F.NR_PROCESSO     = @nr_processo                AND F.CD_SERVICO      = S.CD_SERVICO                AND F.CD_EVENTO       = S.CD_EVENTO                AND (ISNULL(F.CD_EV_BASICO, '') <> ISNULL(S.CD_EV_BASICO, '') OR  ISNULL(F.PZ_DO_EV_BASICO, 0) <> ISNULL(S.PZ_DO_EV_BASICO, 0))
  ```

#### `sp_ordena_eventos`

| Field | Content |
| --- | --- |
| **Name** | `sp_ordena_eventos` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TSERVICO_EVENTO` |
| **Tables written** | `UPDATE TSERVICO_EVENTO` |
| **Parameters** | `@cd_servico char(3)`, `@nr_ordem_origem int`, `@nr_ordem_destino int` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TSERVICO_EVENTO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_ordena_eventos    Script Date: 02091999 08:57:4')
  ```sql
UPDATE  TSERVICO_EVENTO
SET  NR_ORDEM = NR_ORDEM - 1          WHERE  ( CD_SERVICO = @cd_servico ) AND                 ( NR_ORDEM <= @nr_ordem_destino ) AND ( NR_ORDEM > @nr_ordem_origem )          Return(0)
END
END       /* Senao (3)*/
  ```

- **CLEAR**: Updates records in `TSERVICO_EVENTO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_ordena_eventos    Script Date: 02091999 08:57:4')
  ```sql
UPDATE  TSERVICO_EVENTO
SET  NR_ORDEM = NR_ORDEM + 1            WHERE  ( CD_SERVICO = @cd_servico ) AND                   ( NR_ORDEM >= @nr_ordem_destino ) AND ( NR_ORDEM < @nr_ordem_origem )            Return(0)
END
END         /* Senao (4)*/
  ```


### Source File: `triggers_BROKER.csv`

#### `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP`

| Field | Content |
| --- | --- |
| **Name** | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TFOLLOWUP`, `TPROCESSO_LI`, `TPROCESSO_LI_ORGAO_ANUENTE`, `TUSUARIO` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`. (Developer note: 'SELECIONA TODAS OS ORGÃO ANUENTES DO PROCESSO QUE TIVEREM A MESMA CONDIÇÃO DE SU')
  ```sql
INSERT ,
UPDATE  AS
BEGIN
DECLARE  @NR_PROCESSO           CHAR(18)
  ```

- **CLEAR**: Updates records in `AS` based on process parameters or status transitions. (Developer note: 'SELECIONA TODAS OS ORGÃO ANUENTES DO PROCESSO QUE TIVEREM A MESMA CONDIÇÃO DE SU')
  ```sql
UPDATE  AS
BEGIN
DECLARE  @NR_PROCESSO           CHAR(18)
DECLARE  @NR_LI                 CHAR(10)
  ```

- **CLEAR**: Inserts new tracking/workflow records into `@TB_PROCESSOS`. (Developer note: 'SELECIONA TODAS OS ORGÃO ANUENTES DO PROCESSO QUE TIVEREM A MESMA CONDIÇÃO DE SU')
  ```sql
INSERT  INTO @TB_PROCESSOS
SELECT  DISTINCT I.NR_PROCESSO,                           I.NR_LI,                           PLI.IN_SUBSTITUIDA,                           I.CD_ORGAO_ANUENTE,                          I.DT_ENTR_PROC,                          B.DT_ENTR_PROC       AS DT_ENTR_PROC_ANTIGA,                      I.DT_DEFERIMENTO     AS DT_DEFERIMENTO_ORG,                          B.DT_DEFERIMENTO     AS DT_DEFERIMENTO_ORG_ANTIGA,       I.DT_CUMPRIMENTO_EXIGENCIA     AS DT_CUMPRIMENTO_EXIGENCIA_NOVO,                          B.DT_CUMPRIMENTO_EXIGENCIA     AS DT_CUMPRIMENTO_EXIGENCIA_ANTIGO           FROM INSERTED I          INNER JOIN TPROCESSO_LI PLI (NOLOCK) ON PLI.NR_PROCESSO    = I.NR_PROCESSO                                               AND PLI.NR_LI          = I.NR_LI          LEFT  JOIN DELETED      B            ON B.NR_PROCESSO      = I.NR_PROCESSO                                              AND B.NR_LI            = I.NR_LI                                               AND B.CD_ORGAO_ANUENTE = I.CD_ORGAO_ANUENTE
WHILE  (
SELECT  COUNT(*)                 FROM @TB_PROCESSOS) > 0
  ```

- **CLEAR**: Removes outdated or cancelled records from `@TB_PROCESSOS`. (Developer note: 'SELECIONA TODAS OS ORGÃO ANUENTES DO PROCESSO QUE TIVEREM A MESMA CONDIÇÃO DE SU')
  ```sql
DELETE  @TB_PROCESSOS               WHERE NR_PROCESSO = @NR_PROCESSO
IF  CAST(ISNULL(@DT_CUMPRIMENTO_EXIGENCIA_ANTIGO, '1990/01/01') AS DATE) <> CAST(ISNULL(@DT_CUMPRIMENTO_EXIGENCIA_NOVO, '1990/01/01') AS DATE)
BEGIN
SET  @TX_OBS_NOVA =   ': Cumprimento de exigência para LI '+ @NR_LI_FORMATADA
  ```

#### `TR_ATZ_DT_ENT_FABR`

| Field | Content |
| --- | --- |
| **Name** | `TR_ATZ_DT_ENT_FABR` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TPARAMETROS`, `TPROCESSO_NF` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`.
  ```sql
INSERT ,
UPDATE ,
DELETE  AS
DECLARE  @NR_PROCESSO   CHAR(18)
  ```

- **CLEAR**: Updates records in `,` based on process parameters or status transitions.
  ```sql
UPDATE ,
DELETE  AS
DECLARE  @NR_PROCESSO   CHAR(18)
DECLARE  @DT_REALIZACAO DATETIME
  ```

- **CLEAR**: Removes outdated or cancelled records from `AS`.
  ```sql
DELETE  AS
DECLARE  @NR_PROCESSO   CHAR(18)
DECLARE  @DT_REALIZACAO DATETIME
IF  (
  ```

- **CLEAR**: Updates records in `(` based on process parameters or status transitions.
  ```sql
UPDATE ( DT_ENTREGA_FABR)
BEGIN
SELECT   @NR_PROCESSO = NR_PROCESSO          FROM INSERTED
SELECT  TOP 1 @DT_REALIZACAO = DT_ENTREGA_FABR           FROM TPROCESSO_NF (NOLOCK)          WHERE NR_PROCESSO = @NR_PROCESSO
  ```

#### `TR_ETAPA_AUTOMATICA`

| Field | Content |
| --- | --- |
| **Name** | `TR_ETAPA_AUTOMATICA` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TCAD_CONFIG_STATUS_DETAIL`, `TFOLLOWUP`, `TFOLLOWUP_ETAPA`, `TFOLLOWUP_IGNORE_TRIGGERS`, `VW_SERVICO_GERAL` |
| **Tables written** | `DELETE TFOLLOWUP_ETAPA` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `AS` based on process parameters or status transitions. (Developer note: 'PRINT 'EXECUTANDO TRIGGER TR_ETAPA_AUTOMATICA'')
  ```sql
UPDATE  AS
BEGIN
--PRINT 'EXECUTANDO TRIGGER TR_ETAPA_AUTOMATICA'
IF
  ```

- **CLEAR**: Updates records in `(DT_REALIZACAO)` based on process parameters or status transitions. (Developer note: 'PRINT 'EXECUTANDO TRIGGER TR_ETAPA_AUTOMATICA'')
  ```sql
UPDATE (DT_REALIZACAO)
BEGIN
DECLARE  @TB_FOLLOWUP AS TABLE (              NR_PROCESSO        CHAR(18),              CD_SERVICO         CHAR(3),              CD_EVENTO          CHAR(3),              CD_RESP_REALIZACAO CHAR(4),              DT_REALIZACAO      DATETIME          )
DECLARE  @NR_PROCESSO CHAR(18)
  ```

- **CLEAR**: Inserts new tracking/workflow records into `@TB_FOLLOWUP`. (Developer note: 'PRINT 'EXECUTANDO TRIGGER TR_ETAPA_AUTOMATICA'')
  ```sql
INSERT  INTO @TB_FOLLOWUP
SELECT  I.NR_PROCESSO, I.CD_SERVICO, I.CD_EVENTO, I.CD_RESP_REALIZACAO, I.DT_REALIZACAO          FROM INSERTED I             LEFT JOIN DELETED D ON D.NR_PROCESSO = I.NR_PROCESSO AND D.CD_EVENTO = I.CD_EVENTO          WHERE ISNULL(I.DT_REALIZACAO, 0) <> ISNULL(D.DT_REALIZACAO, 0)
--AND I.DT_REALIZACAO IS NOT NULL            AND (
SELECT  COUNT(*)                 FROM TFOLLOWUP_IGNORE_TRIGGERS IT (NOLOCK)                 WHERE IT.NR_PROCESSO = I.NR_PROCESSO                   AND IT.SESSION_ID = @@SPID) = 0
  ```

- **CLEAR**: Removes outdated or cancelled records from `TFOLLOWUP_ETAPA`. (Developer note: 'PRINT 'EXECUTANDO TRIGGER TR_ETAPA_AUTOMATICA'')
  ```sql
DELETE  TFOLLOWUP_ETAPA                      WHERE NR_PROCESSO = @NR_PROCESSO                        AND CD_ETAPA = @CD_ETAPA_AUTOMATICA                        AND CD_FOLLOWUP_ETAPA = @ULT_COD
END
ELSE
BEGIN
  ```

#### `TR_FLP_PROCESSO_CNTR`

| Field | Content |
| --- | --- |
| **Name** | `TR_FLP_PROCESSO_CNTR` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TFOLLOWUP`, `TPROCESSO_CNTR` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`. (Developer note: 'AND SUBSTRING(@nrProcesso, 3, 2) <> '02'')
  ```sql
INSERT ,
UPDATE  AS
DECLARE  @nrProcesso    char(18),          @contador int,          @ROWCOUNT INT,          @315 datetime,          @314 datetime,          @497 datetime,          @555 datetime,          @313 datetime,          @188 datetime
DECLARE  cAtzProcesso CURSOR LOCAL FOR
  ```

- **CLEAR**: Updates records in `AS` based on process parameters or status transitions. (Developer note: 'AND SUBSTRING(@nrProcesso, 3, 2) <> '02'')
  ```sql
UPDATE  AS
DECLARE  @nrProcesso    char(18),          @contador int,          @ROWCOUNT INT,          @315 datetime,          @314 datetime,          @497 datetime,          @555 datetime,          @313 datetime,          @188 datetime
DECLARE  cAtzProcesso CURSOR LOCAL FOR
SELECT  DISTINCT NR_PROCESSO FROM INSERTED
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'AND SUBSTRING(@nrProcesso, 3, 2) <> '02'')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = @315     WHERE NR_PROCESSO = @nrProcesso AND CD_EVENTO = '315'     AND ISNULL(DT_REALIZACAO,0) <> @315
END
END          /*
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'AND SUBSTRING(@nrProcesso, 3, 2) <> '02'')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = @314       WHERE NR_PROCESSO = @nrProcesso AND CD_EVENTO = '314'       AND ISNULL(DT_REALIZACAO,0) <> @314
END
END      */
  ```

#### `TR_FOLLOWUP`

| Field | Content |
| --- | --- |
| **Name** | `TR_FOLLOWUP` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TDETALHE_MERCADORIA`, `TESTAGIO_PROCESSO`, `TEXPORTADOR_DI`, `TFLP_PO`, `TFLP_PO_ITEM`, `TFOLLOWUP`, `TFOLLOWUP_IGNORE_TRIGGERS`, `TGRUPO`, `TPO`, `TPO_ITEM`, `TPROCESSO`, `TPROCESSO_CNTR`, `TPROCESSO_EXP`, `TUSUARIO`, `VW_SERVICO_GERAL` |
| **Tables written** | `UPDATE TFOLLOWUP`, `UPDATE TPROCESSO_EXP`, `UPDATE TPROCESSO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | `SP_ATZ_DA_LOTE`, `SP_BROKER_MOV`, `SP_CALCULA_SDA` |
| **Confidence** | `CLEAR (Fully Decomposed)` |

### Fully Decomposed Business Rules & Branches (`TR_FOLLOWUP`)

`TR_FOLLOWUP` (`FOR INSERT, UPDATE, DELETE ON TFOLLOWUP`) is the core orchestration trigger of the logistics system. It evaluates every modification to `TFOLLOWUP` and cascades state changes across `TFOLLOWUP`, `TPROCESSO`, `TPROCESSO_EXP`, and `TDECLARACAO_IMPORTACAO`. Below is the complete decomposition of every branch, condition, and write operation:

#### 1. Recursion Guard & Initialization

- **Rule**: Prevents infinite trigger loops (`IF TRIGGER_NESTLEVEL() > 1 RETURN`) and populates the in-memory processing table `@TB_PROCESSOS` with modified records from `INSERTED` and `DELETED`.
  ```sql
IF TRIGGER_NESTLEVEL() > 1
  -- RETURN
DECLARE @TB_PROCESSOS AS TABLE (
  NR_PROCESSO char(18),
  CD_SERVICO char(3),
  CD_EVENTO char(3),
  DT_REALIZACAO datetime...)
  ```

#### 2. Container Process Update (`TPROCESSO_CNTR`)

- **Rule**: When a process event occurs, updates container status in `TPROCESSO_CNTR` via procedure execution or direct DML.
  ```sql
UPDATE TPROCESSO_CNTR
SET DT_REALIZACAO = @DT_REALIZACAO
WHERE NR_PROCESSO = @NR_PROCESSO AND CD_EVENTO = @CD_EVENTO
  ```

#### 3. Import Declaration Lot Update (`01IE`, `01DD`)

- **Rule**: If the process number substring (`SUBSTRING(@NR_PROCESSO, 3, 4)`) matches specific import codes (`'01IE'`, `'01DD'`), executes `SP_ATZ_DA_LOTE` to synchronize lot data.
  ```sql
IF SUBSTRING(@NR_PROCESSO, 3, 4) IN ('01IE', '01DD')
  EXEC SP_ATZ_DA_LOTE @NR_PROCESSO, @CD_EVENTO
  ```

#### 4. Broker Movement Synchronization (`SP_BROKER_MOV`)

- **Rule**: On `UPDATE` operations (`@IN_UPDATE = 1`), triggers movement logging across broker integration tables.
  ```sql
IF (@IN_UPDATE = 1)
  EXEC SP_BROKER_MOV @NR_PROCESSO, @CD_EVENTO, 'A'
  ```

#### 5. Event `132` / Product `02` Export Process Synchronization

- **Rule**: When `CD_PRODUTO = '02'` (Export) and `CD_EVENTO = '132'` (`UPDATE (DT_REALIZACAO)`), synchronizes completion dates across `TPROCESSO_EXP` and related process tracking records.
  ```sql
IF (@CD_PRODUTO = '02') AND (@CD_EVENTO = '132')
  UPDATE TPROCESSO_EXP
  SET DT_REALIZACAO = @DT_REALIZACAO
  WHERE NR_PROCESSO = @NR_PROCESSO
  ```

#### 6. Non-Air Transport Modal Filter (`CD_MODAL <> '04'`)

- **Rule**: Enforces transport-specific logic (`/*BY CARLOS - ALIMENTAR SOMENTE QDO MODAL DIFERENTE DE AEREO 08/07/2010*/`): updates `TPROCESSO` only when modal is not Air (`'04'`) and date is non-zero.
  ```sql
IF (@CD_MODAL <> '04') /*BY CARLOS - ALIMENTAR SOMENTE QDO MODAL DIFERENTE DE AEREO*/
IF (ISNULL(@DT_REALIZACAO, 0) <> 0)
  UPDATE TPROCESSO SET DT_ETD = @DT_REALIZACAO WHERE NR_PROCESSO = @NR_PROCESSO
  ```

#### 7. Nestlé Client Exception (`CD_GRUPO = '155'`) — Event `088` (SDA Calculation)

- **Rule**: For client group `155` (Nestlé per prior analysis), when `CD_EVENTO = '088'` occurs, executes `SP_CALCULA_SDA` (`/*ATUALIZA NESTLE*/`) to recalculate customs clearance expenses.
  ```sql
IF (@CD_EVENTO = '088')
  EXEC SP_CALCULA_SDA @NR_PROCESSO /*ATUALIZA NESTLE*/
  ```

#### 8. Nestlé Client Exception (`CD_GRUPO = '155'`) — Event `147` (Transit Time Calculation)

- **Rule**: When event `147` is updated for Nestlé processes (`I.DT_REALIZACAO <> D.DT_REALIZACAO`), calculates target delivery date (`@DT_REALIZACAO_147 = I.DT_REALIZACAO + VL_TRANSIT_TIME`) and updates process follow-up milestones.
  ```sql
IF (@CD_EVENTO = '147') AND (@CD_GRUPO = '155')
SELECT @DT_REALIZACAO_147 = (I.DT_REALIZACAO + VL_TRANSIT_TIME)
IF @DT_REALIZACAO_I <> @DT_REALIZACAO_D
  UPDATE TFOLLOWUP SET DT_PREVISTA = @DT_REALIZACAO_147
  ```

#### 9. Nestlé Client Exception (`CD_GRUPO = '155'`) — Event `132` / `314` Milestones

- **Rule**: When event `132` or `314` occurs under service `'6'` for client group `155`, updates corresponding status markers in `TFOLLOWUP` and `TPROCESSO`.
  ```sql
IF (@CD_EVENTO = '314') AND @CD_SERVICO = '6'
  UPDATE TFOLLOWUP SET DT_REALIZACAO = @DT_REALIZACAO
  WHERE NR_PROCESSO = @NR_PROCESSO AND CD_EVENTO = '314'
  ```

#### 10. Country SLA & Business Days Matrix (`FN_ADD_DIAS_UTEIS`) — Maritime Modal (`CD_MODAL = '01'`)

- **Rule**: Calculates SLA deadlines by adding business days (`FN_ADD_DIAS_UTEIS`) based on destination country codes (`CD_PAIS_DESTINO`):
  - Country `'097'`: +1 business day (or +2 if not `'097'` on Modal `'07'`)
  - Countries `'756'`, `'158'`, `'169'`: +3 business days
  - Countries `'187'`, `'190'`, `'850'`: +5 business days
  - Countries `'431'`, `'198'`, `'080'`, `'357'`, `'438'`, `'154'`, `'627'`, `'040'`: +7 business days
  - Countries `'244'`, `'403'`, `'383'`, `'372'`, `'556'`: +10 business days
  - Countries `'053'`, `'744'`: +12 business days
  - Country `'369'`: +15 business days
  - Country `'240'`: +16 business days
  - Country `'013'` (with `CD_AREA = 'DC'` vs `!= 'DC'`): +15 vs +5 business days
  - Countries `'063'`, `'845'`: +3 vs +5 business days
  ```sql
WHEN @CD_MODAL = '01' AND (SELECT CD_PAIS_DESTINO FROM TPROCESSO WHERE NR_PROCESSO = @NR_PROCESSO) IN ('756','158') THEN (
  SELECT [dbo].[FN_ADD_DIAS_UTEIS] (@DT_REALIZACAO,3) )
WHEN @CD_MODAL = '01' AND (SELECT CD_PAIS_DESTINO...) IN ('244','403','383','372','556') THEN (
  SELECT [dbo].[FN_ADD_DIAS_UTEIS] (@DT_REALIZACAO,10) )
  ```

#### 11. Nestlé Air vs Maritime Event `314` SLA Adjustments (`CD_MODAL = '04'` / `'01'`)

- **Rule**: For client group `155` on Event `314`: if Air (`CD_MODAL = '04'`), adds +2 business days (`FN_ADD_DIAS_UTEIS(@DT_REALIZACAO, 2)`) and sets `DT_REALIZACAO_EFETIVA = GETDATE()`. If Maritime (`CD_MODAL = '01'`) and Country `'063'`, adds +2 business days.
  ```sql
IF (@CD_EVENTO = '314') AND @CD_MODAL = '04'
  UPDATE TFOLLOWUP SET DT_PREVISTA = (SELECT [dbo].[FN_ADD_DIAS_UTEIS] (@DT_REALIZACAO,2)), DT_REALIZACAO_EFETIVA = GETDATE()
IF (@CD_EVENTO = '314') AND @CD_MODAL = '01'
  IF (SELECT CD_PAIS_DESTINO...) IN ('063') THEN (SELECT [dbo].[FN_ADD_DIAS_UTEIS] (@DT_REALIZACAO,2))
  ```

#### 12. Event `021` / Client Group Parameter `IN_PREENCHE_EVENTO_387_COM_021`

- **Rule**: When Event `021` (`DT_REALIZACAO`) is updated, checks client group configuration `IN_PREENCHE_EVENTO_387_COM_021`. If enabled (`= 1`), automatically populates or clears Event `387` in `TFOLLOWUP`.
  ```sql
IF (@CD_EVENTO = '021') AND UPDATE (DT_REALIZACAO)
IF (SELECT G.IN_PREENCHE_EVENTO_387_COM_021 FROM TPROCESSO P INNER JOIN TGRUPO G ON G.CD_GRUPO = P.CD_GRUPO...) = 1
  UPDATE TFOLLOWUP SET DT_REALIZACAO = @DT_REALIZACAO WHERE CD_EVENTO = '387'
  ```

#### 13. Event `168` / Area `Y` Auto-Completion (`CD_GRUPO = '155'`)

- **Rule**: For Nestlé (`CD_GRUPO = '155'`) processes in Area `'Y'`, updating Event `168` cascades dates to corresponding dependent milestones in `TFOLLOWUP`.
  ```sql
IF (@CD_EVENTO = '168') AND UPDATE (DT_REALIZACAO)
IF (SELECT P.NR_PROCESSO FROM TPROCESSO P WHERE P.NR_PROCESSO = @NR_PROCESSO AND CD_GRUPO = '155' AND CD_AREA = 'Y') IS NOT NULL
  UPDATE TFOLLOWUP SET DT_REALIZACAO = @DT_REALIZACAO WHERE CD_EVENTO = '... '
  ```

#### 14. Event `131` Export Declaration Exporter Link (`TEXPORTADOR_DI`)

- **Rule**: When Event `131` (`DT_REALIZACAO`) is updated, checks whether an exporter relationship exists in `TEXPORTADOR_DI` (`LEFT JOIN TEXPORTADOR_DI`) and synchronizes follow-up timestamps.
  ```sql
IF (@CD_EVENTO = '131') AND UPDATE (DT_REALIZACAO)
IF (SELECT P.NR_PROCESSO FROM TPROCESSO P LEFT JOIN TEXPORTADOR_DI EXDI ON EXDI.NR_PROCESSO = P.NR_PROCESSO...) IS NOT NULL
  UPDATE TFOLLOWUP SET DT_REALIZACAO = @DT_REALIZACAO
  ```

#### 15. Event `333` / `838` / `162` Special Product `01` Exceptions (`CD_GRUPO = '155'`)

- **Rule**: For Nestlé (`CD_GRUPO = '155'`) and Product `01`: updates to Events `333`, `838`, and `162` (when `F.CD_EVENTO = '008'` exists) trigger automatic milestone adjustments across `TFOLLOWUP`.
  ```sql
IF (@CD_EVENTO = '333') AND UPDATE (DT_REALIZACAO)
IF (SELECT P.NR_PROCESSO FROM TPROCESSO P WHERE P.NR_PROCESSO = @NR_PROCESSO AND CD_GRUPO = '155' AND CD_PRODUTO = '01') IS NOT NULL
  UPDATE TFOLLOWUP SET DT_REALIZACAO = @DT_REALIZACAO
  ```

#### 16. Loop Termination & Cleanup (`WHILE TB_PROCESSOS`)

- **Rule**: Iterates through all modified rows in `@TB_PROCESSOS`, applying the above conditional hierarchy, and cleans up temporary processing state before exiting.
  ```sql
WHILE (SELECT COUNT(*) FROM @TB_PROCESSOS) > 0
BEGIN
  -- Process row
  DELETE FROM @TB_PROCESSOS WHERE NR_PROCESSO = @NR_PROCESSO AND CD_EVENTO = @CD_EVENTO
END
  ```

#### `TR_GERA_TESTAGIO_PROCESSO_REF_CLIENTE`

| Field | Content |
| --- | --- |
| **Name** | `TR_GERA_TESTAGIO_PROCESSO_REF_CLIENTE` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TESTAGIO_PROCESSO`, `TFLP_PO_ITEM`, `TFOLLOWUP`, `TPO_ITEM`, `TPROCESSO`, `TSERVICO` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`. (Developer note: 'PRINT 'ENTROU NO')
  ```sql
INSERT ,
UPDATE ,
DELETE  AS    PRINT '  ****************************************************************  *  Executando a trigger TR_GERA_TESTAGIO_PROCESSO_REF_CLIENTE  *  *  Na tabela TREF_CLIENTE                                      *  ****************************************************************'
DECLARE  @nr_referencia   char(30),          @cd_empresa      char(5),          @nr_sequencia    int,          @nr_item_cliente char(4),          @nr_parcial      int,           @dt_alteracao    datetime,          @nr_processo_adm char(18),          @nr_processo_des char(18)
  ```

- **CLEAR**: Updates records in `,` based on process parameters or status transitions. (Developer note: 'PRINT 'ENTROU NO')
  ```sql
UPDATE ,
DELETE  AS    PRINT '  ****************************************************************  *  Executando a trigger TR_GERA_TESTAGIO_PROCESSO_REF_CLIENTE  *  *  Na tabela TREF_CLIENTE                                      *  ****************************************************************'
DECLARE  @nr_referencia   char(30),          @cd_empresa      char(5),          @nr_sequencia    int,          @nr_item_cliente char(4),          @nr_parcial      int,           @dt_alteracao    datetime,          @nr_processo_adm char(18),          @nr_processo_des char(18)
DECLARE  @nr_processo     char(18),          @in_action       bit,          @cd_evento       char(3),          @dt_realizacao   datetime,          @in_li           char(1),           @cd_servico      char(4)
  ```

- **CLEAR**: Removes outdated or cancelled records from `AS`. (Developer note: 'PRINT 'ENTROU NO')
  ```sql
DELETE  AS    PRINT '  ****************************************************************  *  Executando a trigger TR_GERA_TESTAGIO_PROCESSO_REF_CLIENTE  *  *  Na tabela TREF_CLIENTE                                      *  ****************************************************************'
DECLARE  @nr_referencia   char(30),          @cd_empresa      char(5),          @nr_sequencia    int,          @nr_item_cliente char(4),          @nr_parcial      int,           @dt_alteracao    datetime,          @nr_processo_adm char(18),          @nr_processo_des char(18)
DECLARE  @nr_processo     char(18),          @in_action       bit,          @cd_evento       char(3),          @dt_realizacao   datetime,          @in_li           char(1),           @cd_servico      char(4)
IF  (
  ```

- **CLEAR**: Inserts new tracking/workflow records into `'`. (Developer note: 'PRINT 'ENTROU NO')
  ```sql
INSERT '
--seleciona os processos que estão sendo inseridos
DECLARE  cInsereProc CURSOR LOCAL FOR
SELECT  NR_PROCESSO, CD_REFERENCIA, CD_EMPRESA, ISNULL(NR_ITEM_PO, ''), NR_SEQUENCIA, NR_PARCIAL        FROM INSERTED        WHERE TP_REFERENCIA = '01'          AND SUBSTRING(NR_PROCESSO, 3, 2) IN ('01', '06')          AND SUBSTRING(NR_PROCESSO, 5, 2) NOT IN ('EW', 'FT', 'IW', 'PO', 'TE', 'TS')
  ```

#### `TR_PROC`

| Field | Content |
| --- | --- |
| **Name** | `TR_PROC` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `MYINDAIA`, `TCLIENTE_SERVICO`, `TDECLARACAO_IMPORTACAO`, `TESTAGIO_PROCESSO`, `TFOLLOWUP`, `TINSTRUCAO_DESEMBARACO`, `TPARAMETROS`, `TSERVICO`, `TSERVICO_NOVO`, `TUSUARIO`, `TVIAGEM`, `TVIAGEM_DEADLINE`, `VW_SERVICO_GERAL` |
| **Tables written** | `UPDATE TFOLLOWUP`, `UPDATE TPROCESSO`, `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | `SP_BROKER_REG` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`. (Developer note: 'Aliviar consultas na viagem')
  ```sql
INSERT ,
UPDATE ,
DELETE  AS
BEGIN
  ```

- **CLEAR**: Updates records in `,` based on process parameters or status transitions. (Developer note: 'Aliviar consultas na viagem')
  ```sql
UPDATE ,
DELETE  AS
BEGIN
DECLARE  @TB_PROCESSO AS TABLE (        NR_PROCESSO CHAR(18),        CD_UNID_NEG CHAR(2),        CD_PRODUTO CHAR(2),        CD_CLIENTE CHAR(5),        CD_GRUPO CHAR(5),        CD_SERVICO CHAR(3),        NR_ORDEM BIT,        DT_VENCTO_ARMAZENAGEM DATETIME      )
  ```

- **CLEAR**: Removes outdated or cancelled records from `AS`. (Developer note: 'Aliviar consultas na viagem')
  ```sql
DELETE  AS
BEGIN
DECLARE  @TB_PROCESSO AS TABLE (        NR_PROCESSO CHAR(18),        CD_UNID_NEG CHAR(2),        CD_PRODUTO CHAR(2),        CD_CLIENTE CHAR(5),        CD_GRUPO CHAR(5),        CD_SERVICO CHAR(3),        NR_ORDEM BIT,        DT_VENCTO_ARMAZENAGEM DATETIME      )
DECLARE  @TX_OBS_NOVA VARCHAR(100)
  ```

- **CLEAR**: Inserts new tracking/workflow records into `@TB_PROCESSO`. (Developer note: 'Aliviar consultas na viagem')
  ```sql
INSERT  INTO @TB_PROCESSO
SELECT  NR_PROCESSO,             CD_UNID_NEG,             CD_PRODUTO,             CD_CLIENTE,             CD_GRUPO,             CD_SERVICO,             0,             DT_VENCTO_ARMAZENAGEM      FROM INSERTED      UNION ALL
SELECT  NR_PROCESSO,             CD_UNID_NEG,             CD_PRODUTO,             CD_CLIENTE,             CD_GRUPO,             CD_SERVICO,             1,             DT_VENCTO_ARMAZENAGEM      FROM DELETED
SELECT  @CD_USUARIO = CD_USUARIO    FROM TUSUARIO    WHERE AP_USUARIO = SUSER_NAME()          /* LOOP INCLUÍDO POR MICHEL PARA PASSAR POR TODOS OS PROCESSOS ATUALIZADOS - 03/10/2012 */
  ```

#### `TR_PROCESSO_CNTR`

| Field | Content |
| --- | --- |
| **Name** | `TR_PROCESSO_CNTR` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TCLIENTE_SERVICO`, `TFOLLOWUP`, `TPARAMETROS`, `TPROCESSO`, `TPROCESSO_CNTR`, `TUSUARIO` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | `sp_calc_dt_demurrage`, `sp_atualiza_proc_armazem`, `SP_ATZ_FOLLOWUP` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`. (Developer note: 'add por agatha nigro 16112017                 @CD_GRUPO_PROCESSO varchar(3)     ')
  ```sql
INSERT ,
UPDATE ,
DELETE  AS
DECLARE  @nrProcesso    char(18),          @nrCntr        char(20),          @dtEntrFabrNew datetime,          @dtEntrFabrOld datetime,          @dtEntNew      datetime,          @dtEntOld      datetime,          @dtDemurrage   datetime,          @dtEntradaArmz datetime,          @dtEntradaFabr datetime,          @dtPrevChegFab datetime,          @Maior_dtEntradaArmz datetime,
  ```

- **CLEAR**: Updates records in `,` based on process parameters or status transitions. (Developer note: 'add por agatha nigro 16112017                 @CD_GRUPO_PROCESSO varchar(3)     ')
  ```sql
UPDATE ,
DELETE  AS
DECLARE  @nrProcesso    char(18),          @nrCntr        char(20),          @dtEntrFabrNew datetime,          @dtEntrFabrOld datetime,          @dtEntNew      datetime,          @dtEntOld      datetime,          @dtDemurrage   datetime,          @dtEntradaArmz datetime,          @dtEntradaFabr datetime,          @dtPrevChegFab datetime,          @Maior_dtEntradaArmz datetime,
--add por agatha nigro 16/11/2017                 @CD_GRUPO_PROCESSO varchar(3)          --add por agatha nigro 16/11/2017
  ```

- **CLEAR**: Removes outdated or cancelled records from `AS`. (Developer note: 'add por agatha nigro 16112017                 @CD_GRUPO_PROCESSO varchar(3)     ')
  ```sql
DELETE  AS
DECLARE  @nrProcesso    char(18),          @nrCntr        char(20),          @dtEntrFabrNew datetime,          @dtEntrFabrOld datetime,          @dtEntNew      datetime,          @dtEntOld      datetime,          @dtDemurrage   datetime,          @dtEntradaArmz datetime,          @dtEntradaFabr datetime,          @dtPrevChegFab datetime,          @Maior_dtEntradaArmz datetime,
--add por agatha nigro 16/11/2017                 @CD_GRUPO_PROCESSO varchar(3)          --add por agatha nigro 16/11/2017
DECLARE  cProcCntr CURSOR FOR
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'add por agatha nigro 16112017                 @CD_GRUPO_PROCESSO varchar(3)     ')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = NULL                      WHERE NR_PROCESSO = @nrProcesso                        AND CD_EVENTO = (
SELECT  CD_EV_PREV_FABRICA                                         FROM TPARAMETROS (NOLOCK))
END
  ```

#### `TR_TPROCESSO_EXP_NF_IUD_A`

| Field | Content |
| --- | --- |
| **Name** | `TR_TPROCESSO_EXP_NF_IUD_A` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TFOLLOWUP`, `TPROCESSO`, `TPROCESSO_EXP_NF`, `TUSUARIO` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`. (Developer note: 'WHERE P.CD_GRUPO IN ('028')      UNION')
  ```sql
INSERT ,
DELETE ,
UPDATE  AS
BEGIN
  ```

- **CLEAR**: Removes outdated or cancelled records from `,`. (Developer note: 'WHERE P.CD_GRUPO IN ('028')      UNION')
  ```sql
DELETE ,
UPDATE  AS
BEGIN
DECLARE  @PROCESSOS AS TABLE (          NR_PROCESSO CHAR(18)      )
  ```

- **CLEAR**: Updates records in `AS` based on process parameters or status transitions. (Developer note: 'WHERE P.CD_GRUPO IN ('028')      UNION')
  ```sql
UPDATE  AS
BEGIN
DECLARE  @PROCESSOS AS TABLE (          NR_PROCESSO CHAR(18)      )
DECLARE  @NR_PROCESSO CHAR(18)
  ```

- **CLEAR**: Inserts new tracking/workflow records into `@PROCESSOS`. (Developer note: 'WHERE P.CD_GRUPO IN ('028')      UNION')
  ```sql
INSERT  INTO @PROCESSOS
SELECT  I.NR_PROCESSO      FROM INSERTED I         INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = I.NR_PROCESSO
--WHERE P.CD_GRUPO IN ('028')      UNION
SELECT  D.NR_PROCESSO      FROM DELETED D         INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = D.NR_PROCESSO
  ```

#### `TR_VIAGEM_DEADLINE`

| Field | Content |
| --- | --- |
| **Name** | `TR_VIAGEM_DEADLINE` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TPROCESSO` |
| **Tables written** | `UPDATE TFOLLOWUP` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | `SP_ATZ_FOLLOWUP` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`. (Developer note: 'Data Dead Line BL  EXP  aqui')
  ```sql
INSERT ,
UPDATE ,
DELETE  AS    --
DECLARE  @NR_PROCESSO char(18)
  ```

- **CLEAR**: Updates records in `,` based on process parameters or status transitions. (Developer note: 'Data Dead Line BL  EXP  aqui')
  ```sql
UPDATE ,
DELETE  AS    --
DECLARE  @NR_PROCESSO char(18)
IF  ((
  ```

- **CLEAR**: Removes outdated or cancelled records from `AS`. (Developer note: 'Data Dead Line BL  EXP  aqui')
  ```sql
DELETE  AS    --
DECLARE  @NR_PROCESSO char(18)
IF  ((
SELECT  COUNT(*) FROM INSERTED ) > 0) OR (
  ```

- **CLEAR**: Updates records in `TFOLLOWUP` based on process parameters or status transitions. (Developer note: 'Data Dead Line BL  EXP  aqui')
  ```sql
UPDATE  TFOLLOWUP
SET  DT_REALIZACAO = I.DT_DEADLINE_BL + CASE ISDATE(ISNULL(LEFT(REPLACE(I.HR_DEADLINE_BL + '00', ' ', '0'), 8), '00:00:00'))                                                 WHEN 0 THEN 0
ELSE  CONVERT(DATETIME, ISNULL(LEFT(REPLACE(I.HR_DEADLINE_BL + '00', ' ', '0'), 8), '00:00:00'), 108)
END       FROM TPROCESSO P (NOLOCK), INSERTED I, TFOLLOWUP F (NOLOCK)      WHERE I.CD_UNID_NEG   = (CASE P.CD_UNID_NEG WHEN '07' THEN '01'
  ```

#### `TR_VIAGEM_REPASSE`

| Field | Content |
| --- | --- |
| **Name** | `TR_VIAGEM_REPASSE` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TDECLARACAO_IMPORTACAO`, `TFOLLOWUP`, `TPARAMETROS`, `TPROCESSO`, `TUSUARIO` |
| **Tables written** | `UPDATE TFOLLOWUP`, `UPDATE TPROCESSO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `AS` based on process parameters or status transitions. (Developer note: 'AND ( D.NR_MANIFESTO     <> I.NR_MANIFESTO                     OR D.DT_CHEGADA_C')
  ```sql
UPDATE  AS
DECLARE  @NR_PROCESSO CHAR(18)            PRINT 'TR_VIAGEM_REPASSE - INÍCIO'
DECLARE  @CD_USUARIO CHAR(4)
SELECT  @CD_USUARIO = CD_USUARIO         FROM TUSUARIO  (NOLOCK)      WHERE AP_USUARIO = SUSER_NAME()
  ```

- **CLEAR**: Inserts new tracking/workflow records into `QUANTO`. (Developer note: 'AND ( D.NR_MANIFESTO     <> I.NR_MANIFESTO                     OR D.DT_CHEGADA_C')
  ```sql
INSERT  QUANTO PARA
UPDATE  - MICHEL - 12/04/2012  */        /*
IF  (
SELECT  COUNT(*) FROM DELETED ) > 0  */
  ```

- **CLEAR**: Updates records in `-` based on process parameters or status transitions. (Developer note: 'AND ( D.NR_MANIFESTO     <> I.NR_MANIFESTO                     OR D.DT_CHEGADA_C')
  ```sql
UPDATE  - MICHEL - 12/04/2012  */        /*
IF  (
SELECT  COUNT(*) FROM DELETED ) > 0  */
BEGIN               /* INCLUÍDO POR MICHEL EM 20/12/2011 PARA ATUALIZAR A DATA DO CONHECIMENTO COM A DATA DE EMBARQUE DA VIAGEM  */
  ```

- **CLEAR**: Updates records in `P` based on process parameters or status transitions. (Developer note: 'AND ( D.NR_MANIFESTO     <> I.NR_MANIFESTO                     OR D.DT_CHEGADA_C')
  ```sql
UPDATE  P
SET  DT_CONHECIMENTO = I.DT_ENT                     FROM TPROCESSO        P  (NOLOCK)                    INNER JOIN INSERTED  I          ON I.CD_UNID_NEG = CASE P.CD_UNID_NEG                                                                             WHEN '07'                                                                            THEN '01'
ELSE  P.CD_UNID_NEG
END                                                      AND I.CD_PRODUTO    = P.CD_PRODUTO                                                     AND I.CD_EMBARCACAO = P.CD_EMBARCACAO                                                     AND I.NR_VIAGEM     = P.NR_VIAGEM                      INNER JOIN TFOLLOWUP F (NOLOCK) ON F.NR_PROCESSO   = P.NR_PROCESSO                                                    AND F.CD_SERVICO    = P.CD_SERVICO                                                    AND F.CD_EVENTO     = '092'                                                                   WHERE ISNULL(P.DT_CONHECIMENTO, 0) <> ISNULL(I.DT_ENT, 0)                     AND P.CD_PRODUTO = '02'                     AND F.DT_REALIZACAO IS NULL
  ```


---

## Group 2 — Other Workflow Table Writers (`TPROCESSO`, `TPROCESSO_EXP`, `TDECLARACAO_IMPORTACAO`, `TCLIENTE_SERVICO`)


### Source File: `store_procedures_BROKER.csv`

#### `SP_NR_FATURA_NESTLE`

| Field | Content |
| --- | --- |
| **Name** | `SP_NR_FATURA_NESTLE` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `SEQUENCIAL`, `TDOCUMENTO_INSTRUCAO`, `TEMPRESA_NAC`, `TFOLLOWUP`, `TPROCESSO`, `TPROCESSO_EXP`, `TREF_CLIENTE` |
| **Tables written** | `UPDATE TPROCESSO_EXP` |
| **Parameters** | `@NR_PROCESSO VARCHAR(20))` |
| **Calls** | `SP_NR_FATURA_NESTLE` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Executes dependent procedure `broker.dbo.SP_NR_FATURA_NESTLE` to propagate workflow updates.
  ```sql
EXEC  broker.dbo.SP_NR_FATURA_NESTLE  '0102EM-003497-18'                CREATE PROCEDURE DBO.SP_NR_FATURA_NESTLE(@NR_PROCESSO VARCHAR(20))           AS
BEGIN                                 --
DECLARE  @NR_PROCESSO VARCHAR(20) =  '0102EM-002301-18'
--'0102EM-002309-18'
  ```

- **CLEAR**: Updates records in `SEQUENCIAL` based on process parameters or status transitions.
  ```sql
UPDATE  SEQUENCIAL
SET  ULTIMO_SEQ = A.ULTIMO_SEQ + 1               FROM SEQUENCIAL A              WHERE CHAVE = 'TPROCESSO_SEQ_NESTLE|155'
SELECT  @NR_REF_NESTLE =               CASE SUBSTRING(ISNULL(B.CGC_EMPRESA, ''), 1,8)                               WHEN '08334818' THEN 'PUR'                              WHEN '01446396' THEN 'CPW'                              WHEN '28053619' THEN 'GAR'
ELSE  'NES' /*05300340,05300331,60409075,33062464,11051859,11799788*/
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TDOCUMENTO_INSTRUCAO`.
  ```sql
INSERT  INTO TDOCUMENTO_INSTRUCAO (NR_PROCESSO, NR_SEQUENCIA, CD_TIPO_DCTO_INSTR, NR_DCTO_INSTRUCAO , DT_FATURA  )
SELECT  @NR_PROCESSO                                     AS NR_PROCESSO,                    ISNULL((
SELECT  MAX(NR_SEQUENCIA)                              FROM TDOCUMENTO_INSTRUCAO                             WHERE NR_PROCESSO = @NR_PROCESSO ),0)+1  AS NR_SEQUENCIA,                    '01'                                             AS CD_TIPO_DCTO_INSTR,                    @NR_REF_NESTLE                                   AS NR_DCTO_INSTRUCAO,                    GETDATE()                                        AS DT_FATURA
INSERT  INTO TREF_CLIENTE (NR_PROCESSO, NR_SEQUENCIA, TP_REFERENCIA, CD_REFERENCIA, DT_REFERENCIA, CD_AREA, CD_EMPRESA  )
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TREF_CLIENTE`.
  ```sql
INSERT  INTO TREF_CLIENTE (NR_PROCESSO, NR_SEQUENCIA, TP_REFERENCIA, CD_REFERENCIA, DT_REFERENCIA, CD_AREA, CD_EMPRESA  )
SELECT  A.NR_PROCESSO                                                 AS NR_PROCESSO,                     RIGHT('00000' + LTRIM(RTRIM(CONVERT(CHAR(5),                      ISNULL((
SELECT  MAX(CONVERT(INTEGER,NR_SEQUENCIA))                                     FROM TREF_CLIENTE                                WHERE NR_PROCESSO = A.NR_PROCESSO),0)+1))),5)  AS NR_SEQUENCIA,                    '08'                                                          AS TP_REFERENCIA,                    @NR_REF_NESTLE                                                AS CD_REFERENCIA,                    GETDATE()                                                     AS DT_REFERENCIA,                A.CD_AREA                                                     AS CD_AREA,                A.CD_CLIENTE                                                  AS CD_EMPRESA                   FROM TPROCESSO A (NOLOCK)          WHERE A.NR_PROCESSO = @NR_PROCESSO
UPDATE  TPROCESSO_EXP
  ```

#### `SP_RE_ALIMENTA_MANUTENCAO`

| Field | Content |
| --- | --- |
| **Name** | `SP_RE_ALIMENTA_MANUTENCAO` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TARMAZEM`, `TPROCESSO_EXP_DDE_RE`, `TRE_ANEXO`, `TRE_CAPA` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@NR_PROCESSO CHAR(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `com` based on process parameters or status transitions. (Developer note: 'Verifica se existe ou não informações referentes a este processo na tabela TPROC')
  ```sql
UPDATE  com base nos dados da RE
--
UPDATE   TPROCESSO_EXP_DDE_RE
--
  ```

- **CLEAR**: Updates records in `TPROCESSO_EXP_DDE_RE` based on process parameters or status transitions. (Developer note: 'Verifica se existe ou não informações referentes a este processo na tabela TPROC')
  ```sql
UPDATE   TPROCESSO_EXP_DDE_RE
--
SET  NR_ANEXO_INI    = RIGHT('000', 3 - LEN((
SELECT  MIN(CD_RE_ANEXO) INICIAL FROM TRE_ANEXO WHERE NR_PROCESSO = @NR_PROCESSO))) + (
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TPROCESSO_EXP_DDE_RE`. (Developer note: 'Verifica se existe ou não informações referentes a este processo na tabela TPROC')
  ```sql
INSERT   INTO TPROCESSO_EXP_DDE_RE (NR_PROCESSO, NR_RE, NR_ANEXO_INI, NR_ANEXO_FIM, DT_RE, QT_PESO_LIQ)
--
SELECT   REC.NR_PROCESSO, @AUX_REGISTRO,
--   (
  ```

- **CLEAR**: Updates records in `do` based on process parameters or status transitions. (Developer note: 'Verifica se existe ou não informações referentes a este processo na tabela TPROC')
  ```sql
UPDATE  do Processo com base nos dados da RE  /* atualização comentada em 18/10/2007 a pedido de Vitor Zanin (Kleber Guedes)
UPDATE   TPROCESSO
SET     CD_CLIENTE         = RE.CD_EXPORTADOR,    CD_ARMAZEM_ATRACACAO = (
SELECT  TOP 1 CD_ARMAZEM FROM TARMAZEM WHERE CD_URF = RE.CD_URF_DESPACHO),    CD_ARMAZEM_ESTOCAGEM = (
  ```

#### `sp_atualiza_armazem`

| Field | Content |
| --- | --- |
| **Name** | `sp_atualiza_armazem` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TARMAZEM`, `TPROCESSO`, `VW_SERVICO_GERAL` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)`, `@cd_amz_atracacao char(4)`, `@cd_amz_descarga char(4)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atualiza_armazem    Script Date: 02091999 08:58')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET     CD_URF_ENTR_CARGA  = ISNULL( CD_URF_ENTR_CARGA, @cd_urf_entr_carga )    WHERE  NR_PROCESSO = @nr_processo AND           ( ISNULL( CD_URF_ENTR_CARGA, '' )  <> ISNULL( @cd_urf_entr_carga, '' ) )
END
-- Despacho
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atualiza_armazem    Script Date: 02091999 08:58')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET     CD_URF_DESPACHO    = @cd_urf_despacho,           CD_RECINTO_ALFAND  = @cd_recinto,           CD_SETOR_ARMAZENAM = @cd_setor    WHERE  NR_PROCESSO = @nr_processo AND           ( ( ISNULL( CD_URF_DESPACHO, '' )  <> ISNULL( @cd_urf_despacho, '' ) ) OR             ( ISNULL( CD_RECINTO_ALFAND, '' )  <> ISNULL( @cd_recinto, '' ) ) OR             ( ISNULL( CD_SETOR_ARMAZENAM, '' ) <> ISNULL( @cd_setor, '' ) ) )
--Rodrigo Capra - 07/12/2007   - ocorrência  05822/07, usuário alegou que o armazém é sempre digitado por ele, portanto a inserção automatica foi desabilitada  --Rodrigo Capra - 11/12/2007   - Não incluir o armazém se for AÉREO, do contrário...faz o que sempre fez.
SELECT  @CD_SERVICO = CD_SERVICO from tprocesso where  nr_processo =@nr_processo
  ```

- **CLEAR**: Removes outdated or cancelled records from `TCARGA_ARMAZEM`. (Developer note: 'Object:  Stored Procedure dbo.sp_atualiza_armazem    Script Date: 02091999 08:58')
  ```sql
DELETE  TCARGA_ARMAZEM WHERE  NR_PROCESSO = @nr_processo
IF  ISNULL(@nm_sigla,'')='' and         ISNULL(@nm_sigla_cont,'')<>''
BEGIN
SELECT  @nm_sigla      = @nm_sigla_cont
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TCARGA_ARMAZEM`. (Developer note: 'Object:  Stored Procedure dbo.sp_atualiza_armazem    Script Date: 02091999 08:58')
  ```sql
INSERT  TCARGA_ARMAZEM   VALUES ( @nr_processo, 1, @nm_sigla )
END
IF  ISNULL(@nm_sigla_cont,'')<>''
BEGIN
  ```

#### `sp_atualiza_processo`

| Field | Content |
| --- | --- |
| **Name** | `sp_atualiza_processo` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TDECLARACAO_IMPORTACAO`, `TDETALHE_MERCADORIA`, `TPROCESSO` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@NR_PROCESSO CHAR(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `DESTA` based on process parameters or status transitions. (Developer note: 'OBJECT:  STORED PROCEDURE DBO.SP_ATUALIZA_PROCESSO    SCRIPT DATE: 26111998 19:0')
  ```sql
UPDATE  DESTA DATA A PEDIDO DE WAGNER BRANCO (DIRETOR TI) - KLEBER 06/10/2006
-- A LINHA ABAIXO FOI ALTERADA POR MICHEL EM 09/12/2009 PORQUE GERAVA DATA 01/01/1900      /*
IF  ISDATE(SUBSTRING(@DT_EMBARQUE, 3,2) + '/' +  SUBSTRING(@DT_EMBARQUE, 1,2) + '/' + SUBSTRING(@DT_EMBARQUE, 5,4)) = 1
SELECT  @DT_EMBARQUE_PROC =  CONVERT(DATETIME, SUBSTRING(@DT_EMBARQUE, 1,2) + '/' +  SUBSTRING(@DT_EMBARQUE, 3,2) + '/' + SUBSTRING(@DT_EMBARQUE, 5,4), 103)
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'OBJECT:  STORED PROCEDURE DBO.SP_ATUALIZA_PROCESSO    SCRIPT DATE: 26111998 19:0')
  ```sql
UPDATE  TPROCESSO
SET     CD_EMBARCACAO          = ISNULL(@CD_EMBARCACAO, CD_EMBARCACAO),             CD_EMP_EST             = @CD_EMP_EST,             CD_EXPORTADOR          = @CD_EMP_EST,             CD_IMPORTADOR          = @CD_IMPORTADOR,             CD_LOCAL_EMBARQUE      = @CD_LOCAL_EMBARQUE,              CD_MOEDA_FRETE         = @CD_MOEDA_FRETE,             CD_MOEDA_MLE           = @CD_MOEDA_MLE,             CD_MOEDA_SEGURO        = @CD_MOEDA_SEGURO,
--CD_PAIS_ORIGEM         = @CD_PAIS_ORIGEM,             CD_TRANSPORTADOR       = @CD_TRANSPORTADOR,             DT_CONHECIMENTO        = @DT_EMBARQUE_PROC,             NR_CONHECIMENTO        = @NR_DCTO_CARGA,                     NR_CONHECIMENTO_MASTER = @NR_DCTO_CARGA_MAST,             NR_DI                  = @NR_DECLARACAO_IMP,             NR_MANIFESTO           = @NR_MANIFESTO,                     VL_CIF_DOLAR           = @VL_CIF_DOLAR,             VL_CIF_MN              = @VL_CIF_MN,             VL_FRETE_COLLECT_MNEG  = @VL_TOT_FRT_COLLECT,             VL_FRETE_MN            = @VL_TOTAL_FRETE_MN,             VL_FRETE_PREPAID_MNEG  = @VL_TOT_FRT_PREPAID,                     VL_FRETE_TNAC_MNEG     = @VL_FRETE_TNAC_MNEG,             VL_ICMS_MN             = @VL_TOT_ICMS,             VL_II_MN               = @VL_TOTAL_II,             VL_IPI_MN              = @VL_TOTAL_IPI,             VL_MLE_MN              = @VL_TOTAL_MLE_MN,             VL_MLE_MNEG            = @VL_TOT_MLE_MNEG,             VL_SEGURO_MNEG         = @VL_TOT_SEGURO_MNEG,             VL_SEGURO_MN           = @VL_TOTAL_SEG_MN,             TP_FRETE               = @TP_FRETE,             VL_PESO_LIQUIDO        = @VL_PESO_LIQUIDO,             VL_PESO_BRUTO          = @VL_PESO_BRUTO,             CD_INCOTERM          = @CD_INCOTERM      WHERE  NR_PROCESSO = @NR_PROCESSO        /*
UPDATE  TDA
  ```

- **CLEAR**: Updates records in `TDA` based on process parameters or status transitions. (Developer note: 'OBJECT:  STORED PROCEDURE DBO.SP_ATUALIZA_PROCESSO    SCRIPT DATE: 26111998 19:0')
  ```sql
UPDATE  TDA
SET     CD_LOCAL_EMBARQUE      = @CD_LOCAL_EMBARQUE,             CD_EMBARCACAO          = @CD_EMBARCACAO,             CD_TRANSPORTADOR       = @CD_TRANSPORTADOR,             CD_MOEDA_MLE           = @CD_MOEDA_MLE,             CD_MOEDA_FRETE         = @CD_MOEDA_FRETE,             CD_MOEDA_SEGURO        = @CD_MOEDA_SEGURO,             TP_FRETE               = @TP_FRETE,             DT_CONHECIMENTO        = CONVERT( DATETIME, SUBSTRING( @DT_EMBARQUE, 1, 2 ) + '/' +                                                         SUBSTRING( @DT_EMBARQUE, 3, 2 ) + '/' +                                                         SUBSTRING( @DT_EMBARQUE, 5, 4 ), 103 ),             NR_CONHECIMENTO        = @NR_DCTO_CARGA,             NR_CONHECIMENTO_MASTER = @NR_DCTO_CARGA_MAST,             VL_FRETE_MNEG          = @VL_TOT_FRT_PREPAID + @VL_TOT_FRT_COLLECT,             CD_TIPO_BASE_SEGURO    = '1'      WHERE  NR_PROCESSO            = @NR_PROCESSO    */
END         /*
SELECT  DT_EMBARQUE    FROM TDECLARACAO_IMPORTACAO    WHERE NR_PROCESSO = @NR_PROCESSO
  ```

- **CLEAR**: Removes outdated or cancelled records from `TPROCESSO_LI`. (Developer note: 'OBJECT:  STORED PROCEDURE DBO.SP_ATUALIZA_PROCESSO    SCRIPT DATE: 26111998 19:0')
  ```sql
DELETE  TPROCESSO_LI     WHERE  NR_PROCESSO = @NR_PROCESSO
INSERT  TPROCESSO_LI ( NR_PROCESSO, NR_LI )
SELECT  DISTINCT @NR_PROCESSO, NR_OPER_TRAT_PREV      FROM   TADICAO_DE_IMPORTACAO      WHERE  NR_PROCESSO = @NR_PROCESSO AND             ISNULL( NR_OPER_TRAT_PREV, '' ) <> ''    */
  ```

#### `sp_atz_da_di`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_da_di` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TDECLARACAO_IMPORTACAO`, `TPROCESSO` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@nr_processo_da char(18)`, `@nr_processo char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_ent_processo    Script Date: 26111998 19:07')
  ```sql
UPDATE  TPROCESSO
SET     CD_ARMAZEM_ATRACACAO   = @cd_armazem_atracacao,         CD_ARMAZEM_DESCARGA    = @cd_armazem_descarga,         CD_LOCAL_EMBARQUE      = @cd_local_embarque,         CD_LOCAL_DESEMBARQUE   = @cd_local_desembarque,         CD_PAIS_ORIGEM         = @cd_pais_origem,         CD_EMBARCACAO          = @cd_embarcacao,         NR_MANIFESTO           = @nr_manifesto,         CD_AGENTE              = @cd_agente,         CD_TRANSPORTADOR       = @cd_transportador,         CD_MOEDA_MLE           = @cd_moeda_mle,         CD_MOEDA_FRETE         = @cd_moeda_frete,         CD_MOEDA_SEGURO        = @cd_moeda_seguro,         TP_FRETE               = @tp_frete,         DT_CONHECIMENTO        = @dt_conhecimento,         NR_CONHECIMENTO        = @nr_conhecimento,         NR_CONHECIMENTO_MASTER = @nr_conhecimento_master  WHERE  NR_PROCESSO            = @nr_processo    /*
UPDATE  TPROCESSO
SET     TX_MERCADORIA = P2.TX_MERCADORIA  FROM   TPROCESSO P, TPROCESSO P2  WHERE  P.NR_PROCESSO = P2.NR_PROCESSO  */    RETURN(0)
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_ent_processo    Script Date: 26111998 19:07')
  ```sql
UPDATE  TPROCESSO
SET     TX_MERCADORIA = P2.TX_MERCADORIA  FROM   TPROCESSO P, TPROCESSO P2  WHERE  P.NR_PROCESSO = P2.NR_PROCESSO  */    RETURN(0)
  ```

#### `sp_atz_devolucao`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_devolucao` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TDEVOLUCAO`, `TDEVOLUCAO_ITENS`, `TEMPRESA_NAC`, `TFAVORECIDO`, `TNUMERARIO`, `TNUMERARIO_ITEM_SOLIC`, `TNUMERARIO_SALDO_POR_ITEM`, `TPARAMETROS`, `TRECEBIMENTO`, `TRECEBIMENTO_ITEM_RECEB`, `TSOLIC_PAGTO`, `TUSUARIO` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@nr_processo char(18)`, `@nr_devolucao char(3)` |
| **Calls** | `sp_cancela_item_solic_pagto` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TRECEBIMENTO_ITEM_RECEB` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_devolucao    Script Date: 02091999 08:58:57')
  ```sql
UPDATE  TRECEBIMENTO_ITEM_RECEB
SET     VL_DEVOLVIDO = ISNULL(         (
SELECT  SUM( CONVERT( numeric(14,2), VL_DEVOLVIDO ) )           FROM   TDEVOLUCAO_ITENS I,                  TDEVOLUCAO D           WHERE  D.NR_PROCESSO    = I.NR_PROCESSO    AND                  D.NR_DEVOLUCAO   = I.NR_DEVOLUCAO   AND                  I.NR_PROCESSO    = R.NR_PROCESSO    AND                  I.NR_RECEBIMENTO = R.NR_RECEBIMENTO AND                  I.NR_LANC_RECEB  = R.NR_LANC_RECEB  AND                  I.CD_ITEM        = R.CD_ITEM     AND                  D.IN_CANCELADO   = '0' ), 0 )  FROM   TRECEBIMENTO_ITEM_RECEB R  WHERE  NR_PROCESSO = @nr_processo
-- Atualiza Recebimento
  ```

- **CLEAR**: Updates records in `TRECEBIMENTO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_devolucao    Script Date: 02091999 08:58:57')
  ```sql
UPDATE  TRECEBIMENTO
SET     VL_DEVOLVIDO = ROUND( ISNULL(         (
SELECT  SUM( ISNULL( CONVERT( numeric(14,2), VL_DEVOLVIDO) ,0 ) )           FROM   TRECEBIMENTO_ITEM_RECEB I           WHERE  I.NR_PROCESSO    = R.NR_PROCESSO AND                  I.NR_RECEBIMENTO = R.NR_RECEBIMENTO), 0), 2)  FROM   TRECEBIMENTO R  WHERE  NR_PROCESSO = @nr_processo
-- Atualiza Itens do Numerario
  ```

- **CLEAR**: Updates records in `TNUMERARIO_ITEM_SOLIC` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_devolucao    Script Date: 02091999 08:58:57')
  ```sql
UPDATE  TNUMERARIO_ITEM_SOLIC
SET     VL_RECEBIDO = ROUND( ISNULL(         (
SELECT  SUM( ISNULL( CONVERT( numeric(14,2), R.VL_RECEBIDO ), 0 ) -                       ISNULL( CONVERT( numeric(14,2), R.VL_DEVOLVIDO ), 0 ) )           FROM   TRECEBIMENTO_ITEM_RECEB R           WHERE  R.NR_PROCESSO    = S.NR_PROCESSO    AND                  R.NR_SOLICITACAO = S.NR_SOLICITACAO AND                  R.CD_ITEM        = S.CD_ITEM      AND                  R.IN_CANCELADO   = '0' ), 0 ), 2 )  FROM   TNUMERARIO_ITEM_SOLIC S  WHERE  NR_PROCESSO = @nr_processo
UPDATE  TNUMERARIO_ITEM_SOLIC
  ```

- **CLEAR**: Updates records in `TNUMERARIO_ITEM_SOLIC` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_devolucao    Script Date: 02091999 08:58:57')
  ```sql
UPDATE  TNUMERARIO_ITEM_SOLIC
SET     CD_STATUS = CASE            WHEN ( VL_RECEBIDO >= VL_SOLICITADO ) THEN 'B'
ELSE  'A'
END   WHERE  NR_PROCESSO = @nr_processo AND         CD_STATUS IN ('A','B')
  ```

#### `sp_atz_di`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_di` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TDECLARACAO_IMPORTACAO`, `TPROCESSO`, `VW_DT_ENT` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | `sp_di_ret_embalagem` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET     NR_VEICULO_TRANSP = P.NR_PLACA_VEICULO,           CD_URF_ENTR_CARGA = A.CD_URF    FROM   TPROCESSO P, TDECLARACAO_IMPORTACAO D, TARMAZEM A    WHERE  P.NR_PROCESSO           = D.NR_PROCESSO      AND  P.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM       AND  P.NR_PROCESSO           = @nr_processo
END
IF  @cd_via_transp_carg IN ( '01', '02', '03' )
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET     CD_VEICULO_TRANSP  = P.CD_EMBARCACAO,           CD_BANDEIRA_TRANSP = T.CD_PAIS    FROM   TPROCESSO P, TDECLARACAO_IMPORTACAO D, TTRANSPORTADOR_ITL T    WHERE  P.NR_PROCESSO       = D.NR_PROCESSO       AND  P.CD_TRANSPORTADOR *= T.CODIGO       AND  P.NR_PROCESSO       = @nr_processo
END
UPDATE  TDECLARACAO_IMPORTACAO
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET     CD_PAIS_PROC_CARGA = CD_PAIS_ORIGEM,    CD_LOCAL_EMBARQUE  = CASE @cd_via_transp_carg                            WHEN '01' THEN P.CD_LOCAL_EMBARQUE                           WHEN '04' THEN P.CD_LOCAL_EMBARQUE
ELSE  ''
END ,    CD_TRANSPORTADOR   = CASE @cd_via_transp_carg                            WHEN '01' THEN P.CD_TRANSPORTADOR
  ```

- **CLEAR**: Executes dependent procedure `sp_di_ret_embalagem` to propagate workflow updates.
  ```sql
EXEC  sp_di_ret_embalagem @nr_processo  /*  ROLLBACK TRAN
SET  XACT_ABORT OFF
--*/
  ```

#### `sp_atz_ent_processo`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_ent_processo` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TDA`, `TDECLARACAO_IMPORTACAO`, `TPROCESSO` |
| **Tables written** | `UPDATE TPROCESSO`, `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_ent_processo    Script Date: 26111998 19:07')
  ```sql
UPDATE  TPROCESSO
SET     CD_ARMAZEM_ATRACACAO   = @cd_armazem_atracacao,         CD_ARMAZEM_DESCARGA    = @cd_armazem_descarga,         CD_LOCAL_EMBARQUE      = @cd_local_embarque,         CD_LOCAL_DESEMBARQUE   = @cd_local_desembarque,         CD_EMBARCACAO          = @cd_embarcacao,         NR_VIAGEM              = @nr_viagem,         CD_INCOTERM            = @cd_incoterm,         CD_AGENTE              = @cd_agente,         CD_TRANSPORTADOR       = @cd_transportador,         CD_MOEDA_MLE           = CASE ISNULL( @cd_moeda_mle, '' )                                     WHEN '' THEN CD_MOEDA_MLE
ELSE  @cd_moeda_mle
END ,         CD_MOEDA_FRETE         = @cd_moeda_frete,         CD_MOEDA_SEGURO        = @cd_moeda_seguro,         TP_FRETE               = @tp_frete,         DT_CONHECIMENTO        = @dt_conhecimento,         NR_CONHECIMENTO        = @nr_conhecimento,         NR_CONHECIMENTO_MASTER = @nr_conhecimento_master  WHERE  NR_PROCESSO            = @nr_processo
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_ent_processo    Script Date: 26111998 19:07')
  ```sql
UPDATE  TPROCESSO
SET     TX_MERCADORIA = D.TX_MERCADORIA  FROM   TPROCESSO P, TDA D  WHERE  P.NR_PROCESSO = D.NR_PROCESSO AND         D.NR_PROCESSO = @nr_processo
UPDATE  TDECLARACAO_IMPORTACAO
SET
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_ent_processo    Script Date: 26111998 19:07')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET
--CD_TIPO_BASE_SEGURO    = @cd_tipo_base_seguro,         CD_LOCAL_EMBARQUE      = @cd_local_embarque,         CD_VEICULO_TRANSP      = @cd_embarcacao,         CD_TRANSPORTADOR       = @cd_transportador,         CD_MOEDA_MLE           = CASE ISNULL( @cd_moeda_mle, '' )                                     WHEN '' THEN CD_MOEDA_MLE
ELSE  @cd_moeda_mle
  ```

#### `sp_atz_myindaia_processo`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_myindaia_processo` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `MYINDAIA`, `TADICAO_DE_IMPORTACAO`, `TATZ_MYINDAIA_PROCESSO`, `TDECLARACAO_IMPORTACAO`, `TDEM_FAT`, `TDEM_FAT_CNTR`, `TDETALHE_MERCADORIA`, `TDOCUMENTO_INSTRUCAO`, `TFATURAMENTO_CC`, `TFATURAMENTO_CC_CLIENTE`, `TFAT_CALCULO_RATEIO_DESP`, `TPROCESSO` |
| **Tables written** | `INSERT TDECLARACAO_IMPORTACAO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `PR`. (Developer note: 'define a partir de que ano os dados serão copiados')
  ```sql
DELETE  PR                  FROM TATZ_MYINDAIA_PROCESSO PR, #TMP_PROCESSO PD                   WHERE PD.NR_PROCESSO = PR.NR_PROCESSO                    AND PD.NM_TABELA   = PR.NM_TABELA
--exclui os processos que terão os seus dados alterados no banco myindaia
DELETE  P FROM MYINDAIA.DBO.TADICAO_DE_IMPORTACAO P, #TMP_PROCESSO PD WHERE P.NR_PROCESSO = PD.NR_PROCESSO AND NM_TABELA = 'TADICAO_DE_IMPORTACAO'
--inicio da seleção e inserção dos registros da tabela tadicao_de_importacao da base myindaia em relação aos                   --processo que constam na tabela #TMP_PROCESSO
  ```

- **CLEAR**: Removes outdated or cancelled records from `P`. (Developer note: 'define a partir de que ano os dados serão copiados')
  ```sql
DELETE  P FROM MYINDAIA.DBO.TADICAO_DE_IMPORTACAO P, #TMP_PROCESSO PD WHERE P.NR_PROCESSO = PD.NR_PROCESSO AND NM_TABELA = 'TADICAO_DE_IMPORTACAO'
--inicio da seleção e inserção dos registros da tabela tadicao_de_importacao da base myindaia em relação aos                   --processo que constam na tabela #TMP_PROCESSO
INSERT  INTO MYINDAIA.DBO.TADICAO_DE_IMPORTACAO ( NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                    CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                    CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                    CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                    CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                    CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                    ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                    ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                    IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                    PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                    QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                    VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                    VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, vl_merc_loc_emb_mn, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                    VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                    vl_merc_loc_emb_mneg, CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                    VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                    VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS,*/ CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                    PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                  )
SELECT  /*/*DISTINCT*/ */AI.NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                    CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                    CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                    CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                    CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                    CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                    ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                    ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                    IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                    PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                    QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                    VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                    VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, vl_merc_loc_emb_mn, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                    VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                    vl_merc_loc_emb_mneg, AI.CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                    VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                    VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS, */CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                    PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                  FROM #TMP_PROCESSO ATZ                    INNER JOIN TPROCESSO             PR (NOLOCK) ON ( PR.NR_PROCESSO = ATZ.NR_PROCESSO )                    INNER JOIN TADICAO_DE_IMPORTACAO AI (NOLOCK) ON ( AI.NR_PROCESSO = ATZ.NR_PROCESSO )                  WHERE ATZ.NM_TABELA = 'TADICAO_DE_IMPORTACAO'                    AND ISNULL( PR.IN_CANCELADO, '0' ) = '0'                    AND YEAR(PR.DT_ABERTURA) >= @data                    AND SUBSTRING(PR.NR_PROCESSO, 5, 2) NOT IN ('IW','EW')
  ```

- **CLEAR**: Inserts new tracking/workflow records into `MYINDAIA.DBO.TADICAO_DE_IMPORTACAO`. (Developer note: 'define a partir de que ano os dados serão copiados')
  ```sql
INSERT  INTO MYINDAIA.DBO.TADICAO_DE_IMPORTACAO ( NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                    CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                    CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                    CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                    CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                    CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                    ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                    ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                    IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                    PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                    QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                    VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                    VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, vl_merc_loc_emb_mn, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                    VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                    vl_merc_loc_emb_mneg, CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                    VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                    VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS,*/ CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                    PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                  )
SELECT  /*/*DISTINCT*/ */AI.NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                    CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                    CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                    CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                    CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                    CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                    ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                    ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                    IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                    PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                    QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                    VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                    VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, vl_merc_loc_emb_mn, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                    VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                    vl_merc_loc_emb_mneg, AI.CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                    VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                    VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS, */CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                    PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                  FROM #TMP_PROCESSO ATZ                    INNER JOIN TPROCESSO             PR (NOLOCK) ON ( PR.NR_PROCESSO = ATZ.NR_PROCESSO )                    INNER JOIN TADICAO_DE_IMPORTACAO AI (NOLOCK) ON ( AI.NR_PROCESSO = ATZ.NR_PROCESSO )                  WHERE ATZ.NM_TABELA = 'TADICAO_DE_IMPORTACAO'                    AND ISNULL( PR.IN_CANCELADO, '0' ) = '0'                    AND YEAR(PR.DT_ABERTURA) >= @data                    AND SUBSTRING(PR.NR_PROCESSO, 5, 2) NOT IN ('IW','EW')
SET  @registros = @registros + @@rowcount
--verifica se ocorreram erros
  ```

- **CLEAR**: Removes outdated or cancelled records from `P`. (Developer note: 'define a partir de que ano os dados serão copiados')
  ```sql
DELETE  P FROM MYINDAIA.DBO.TDECLARACAO_IMPORTACAO P, #TMP_PROCESSO PD WHERE P.NR_PROCESSO = PD.NR_PROCESSO AND NM_TABELA = 'TDECLARACAO_IMPORTACAO'
--processo que constam na tabela #TMP_PROCESSO
INSERT  INTO MYINDAIA.DBO.TDECLARACAO_IMPORTACAO ( NR_PROCESSO, NR_IDENT_USUARIO, CD_APLICACAO_MERC, CD_BANDEIRA_TRANSP,                    CD_COBERTURA_CAMBIAL, CD_DESTAQUE_NCM, CD_FORMA_PAGAMENTO, CD_FUND_LEGAL_II, CD_IMPORTADOR, CD_INCOTERM, CD_LOCAL_EMBARQUE,                    CD_METODO_VALORACAO, CD_MODALIDADE_DESP, CD_MODALIDADE_PAGTO, CD_MOEDA_DESPESAS, CD_MOEDA_FRETE, CD_MOEDA_MLE, CD_MOEDA_SEGURO,                    CD_MOTIVO_SEM_COBERTURA, CD_MOTIVO_TRANS, CD_PAIS_IMPORTADOR, CD_PAIS_PROC_CARGA, CD_RECINTO_ALFAND, CD_REG_TRIB_II, CD_REG_TRIB_IPI,                   CD_SETOR_ARMAZENAM, CD_TIPO_AG_CARGA, CD_TIPO_CONSIG, CD_TIPO_DCTO_CARGA, CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR, CD_TIPO_MANIFESTO,                    CD_TRANSPORTADOR, CD_URF_DESPACHO, CD_URF_ENTR_CARGA, CD_UTIL_DCTO_CARGA, CD_VIA_TRANSP_CARG, CD_VINC_IMPO_EXPO, DT_CHEGADA_CARGA,                    DT_EMBARQUE, DT_PROCESSAMENTO, DT_REGISTRO_DI, DT_TRANSMISSAO, IN_BEM_ENCOMENDA, IN_MATERIAL_USADO, IN_MOEDA_NACIONAL, IN_MOEDA_UNICA,                    IN_MULTIMODAL, IN_OPERACAO_FUNDAP, IN_RATEAR_FRETE_ITENS, IN_RATEAR_SEGURO_ITENS, IN_REPASSA_DADOS_ADICAO, IN_REPASSA_DADOS_CAMBIO,                    NM_CONSIGNATARIO, NM_VEICULO_TRANSP, NR_AGENTE_CARGA, NR_BANCO_COM, NR_BANCO_PAGAMENTO, NR_COMPRADOR_ME, NR_CONSIGNATARIO,                   NR_CONTRATO_CAMBIO, NR_CPF_REPR_LEGAL, NR_DCTO_CARGA, NR_DCTO_CARGA_MAST, NR_DECL_IMP_PROT, NR_DECLARACAO_IMP, NR_IDENTIFICACAO_COM,                    NR_MANIFESTO, NR_PRACA_COM, NR_PRACA_PAGAMENTO, NR_ROF, NR_VEICULO_TRANSP, PB_CARGA, PC_COMISSAO, PC_ICMS, PC_REDUCAO_ICMS, PL_CARGA,                    QT_ADICOES, TX_INFO_COMPL, VL_FRETE_TNAC_MNEG, VL_TOT_DESPS_MN, VL_TOT_DESPS_MNEG, VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID,                    VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_FRETE_MN, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, PC_SEGURO_MLE, VL_TOTAL_II, VL_TOTAL_IPI,                    VL_TOTAL_AD, DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO, CD_TIPO_BASE_SEGURO, IN_REB, VL_TOT_ICMS, CD_TIPO_PGTO_TRIB, NR_CONTA_PGTO_TRIB,                   TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, NR_REF_CLI, IN_SISCOMEX, CD_TIPO_ICMS, IN_ICMS_IMPRESSO, DT_ICMS_IMPRESSO, VL_TOTAL_ACRESCIMOS_MN,                   VL_TOTAL_DEDUCOES_MN, DT_CALCULO, VL_DESPESA_ITEM, VL_DESPESA_ITEM_MN, CD_ORGAO_FIN_INTER, CD_PRESENCA_CARGA, NR_SEQ_RETIFICACAO,                    CD_MOTIVO_RETIF, DT_RETIFICACAO, DT_EXON_IMPRESSO, IN_EXON_IMPRESSO, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_TOTAL_CAMBIO,                    CD_AUSENCIA_FABRIC, CD_FORNECEDOR, CD_FABRICANTE, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                    CD_PERIOD_PGTO_360, IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS, VL_TOTAL_ACRESCIMOS_MNEG, VL_TOTAL_DEDUCOES_MNEG, VL_TOTAL_FRETE_MNEG,                    NR_PROCESSO_SISCOMEX, IN_PGTO_VARIAV_360, CD_VEICULO_TRANSP, PC_REDUCAO_IPT_BLI, DT_DI, VL_TOTAL_TX_SCX, VL_TOT_PIS_COFINS                   )
SELECT  /*/*DISTINCT*/ */DI.NR_PROCESSO, NR_IDENT_USUARIO, CD_APLICACAO_MERC, CD_BANDEIRA_TRANSP,                    CD_COBERTURA_CAMBIAL, CD_DESTAQUE_NCM, CD_FORMA_PAGAMENTO, CD_FUND_LEGAL_II, DI.CD_IMPORTADOR, DI.CD_INCOTERM, DI.CD_LOCAL_EMBARQUE,                    CD_METODO_VALORACAO, CD_MODALIDADE_DESP, CD_MODALIDADE_PAGTO, CD_MOEDA_DESPESAS, DI.CD_MOEDA_FRETE, DI.CD_MOEDA_MLE, DI.CD_MOEDA_SEGURO,                    CD_MOTIVO_SEM_COBERTURA, CD_MOTIVO_TRANS, CD_PAIS_IMPORTADOR, CD_PAIS_PROC_CARGA, CD_RECINTO_ALFAND, CD_REG_TRIB_II, CD_REG_TRIB_IPI,                   CD_SETOR_ARMAZENAM, CD_TIPO_AG_CARGA, CD_TIPO_CONSIG, CD_TIPO_DCTO_CARGA, CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR, CD_TIPO_MANIFESTO,                    DI.CD_TRANSPORTADOR, CD_URF_DESPACHO, CD_URF_ENTR_CARGA, CD_UTIL_DCTO_CARGA, CD_VIA_TRANSP_CARG, CD_VINC_IMPO_EXPO, DT_CHEGADA_CARGA,                    DI.DT_EMBARQUE, DT_PROCESSAMENTO, DT_REGISTRO_DI, DT_TRANSMISSAO, IN_BEM_ENCOMENDA, IN_MATERIAL_USADO, IN_MOEDA_NACIONAL, IN_MOEDA_UNICA,                    IN_MULTIMODAL, IN_OPERACAO_FUNDAP, IN_RATEAR_FRETE_ITENS, IN_RATEAR_SEGURO_ITENS, IN_REPASSA_DADOS_ADICAO, IN_REPASSA_DADOS_CAMBIO,                    NM_CONSIGNATARIO, NM_VEICULO_TRANSP, NR_AGENTE_CARGA, NR_BANCO_COM, NR_BANCO_PAGAMENTO, NR_COMPRADOR_ME, NR_CONSIGNATARIO,                   NR_CONTRATO_CAMBIO, NR_CPF_REPR_LEGAL, NR_DCTO_CARGA, NR_DCTO_CARGA_MAST, NR_DECL_IMP_PROT, NR_DECLARACAO_IMP, NR_IDENTIFICACAO_COM,                    DI.NR_MANIFESTO, NR_PRACA_COM, NR_PRACA_PAGAMENTO, NR_ROF, NR_VEICULO_TRANSP, PB_CARGA, PC_COMISSAO, PC_ICMS, PC_REDUCAO_ICMS, PL_CARGA,                    QT_ADICOES, TX_INFO_COMPL, DI.VL_FRETE_TNAC_MNEG, VL_TOT_DESPS_MN, VL_TOT_DESPS_MNEG, VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID,                    VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_FRETE_MN, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, PC_SEGURO_MLE, VL_TOTAL_II, VL_TOTAL_IPI,                    VL_TOTAL_AD, DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO, CD_TIPO_BASE_SEGURO, IN_REB, VL_TOT_ICMS, CD_TIPO_PGTO_TRIB, NR_CONTA_PGTO_TRIB,                   TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, NR_REF_CLI, IN_SISCOMEX, CD_TIPO_ICMS, IN_ICMS_IMPRESSO, DT_ICMS_IMPRESSO, VL_TOTAL_ACRESCIMOS_MN,                   VL_TOTAL_DEDUCOES_MN, DT_CALCULO, VL_DESPESA_ITEM, VL_DESPESA_ITEM_MN, CD_ORGAO_FIN_INTER, CD_PRESENCA_CARGA, NR_SEQ_RETIFICACAO,                    CD_MOTIVO_RETIF, DT_RETIFICACAO, DT_EXON_IMPRESSO, IN_EXON_IMPRESSO, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_TOTAL_CAMBIO,                    CD_AUSENCIA_FABRIC, CD_FORNECEDOR, CD_FABRICANTE, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                    CD_PERIOD_PGTO_360, IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS, VL_TOTAL_ACRESCIMOS_MNEG, VL_TOTAL_DEDUCOES_MNEG, VL_TOTAL_FRETE_MNEG,                    NR_PROCESSO_SISCOMEX, IN_PGTO_VARIAV_360, CD_VEICULO_TRANSP, PC_REDUCAO_IPT_BLI, DT_DI, VL_TOTAL_TX_SCX, VL_TOT_PIS_COFINS                  FROM #TMP_PROCESSO ATZ                    INNER JOIN TPROCESSO              PR (NOLOCK) ON ( PR.NR_PROCESSO = ATZ.NR_PROCESSO )                    INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON ( DI.NR_PROCESSO = ATZ.NR_PROCESSO )                  WHERE ATZ.NM_TABELA   = 'TDECLARACAO_IMPORTACAO'                    AND ISNULL( PR.IN_CANCELADO, '0' ) = '0'                    AND YEAR(PR.DT_ABERTURA) >= @data                    AND SUBSTRING(PR.NR_PROCESSO, 5, 2) NOT IN ('IW','EW')
  ```

#### `sp_atz_myindaia_processo2`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_myindaia_processo2` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `MYINDAIA`, `TADICAO_DE_IMPORTACAO`, `TATZ_MYINDAIA_PROCESSO`, `TDECLARACAO_IMPORTACAO`, `TDEM_FAT`, `TDEM_FAT_CNTR`, `TDETALHE_MERCADORIA`, `TDOCUMENTO_INSTRUCAO`, `TPREVISAO`, `TPROCESSO` |
| **Tables written** | `INSERT TDECLARACAO_IMPORTACAO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `@TMP_PROCESSO`. (Developer note: 'VERIFICA SE OCORRERAM ERROS')
  ```sql
INSERT  INTO @TMP_PROCESSO
SELECT  TOP 1000                      NR_PROCESSO,                      NM_TABELA,                      MIN(AP_USUARIO) AS AP_USUARIO                                     FROM TATZ_MYINDAIA_PROCESSO (NOLOCK)                                        /* ATENDENDO A COCORRENCIA 05081/07  (DENILZA) EXCLUÍ O ÍTEM IW PARA QUE POSSAM SER TRANSFERIDOS PARA A BASE WEB*/                                        /*WHERE SUBSTRING(NR_PROCESSO,5,2) NOT IN ('EW','FT','
IF ','IW','PO','TE','TS')*/                                         WHERE SUBSTRING(NR_PROCESSO,5,2) NOT IN ('EW','FT','PO','TE','TS','RE','RI')                                        GROUP BY NR_PROCESSO,                        NM_TABELA                                        ORDER BY AP_USUARIO,                        MIN(CD_ATUALIZACAO)
IF  @@ROWCOUNT = 0
  ```

- **CLEAR**: Removes outdated or cancelled records from `P`. (Developer note: 'VERIFICA SE OCORRERAM ERROS')
  ```sql
DELETE  P                  FROM MYINDAIA.DBO.TADICAO_DE_IMPORTACAO P (NOLOCK),                       @TMP_PROCESSO PD                 WHERE P.NR_PROCESSO = PD.NR_PROCESSO                   AND NM_TABELA     = 'TADICAO_DE_IMPORTACAO'                                                                             /*INICIO DA SELEÇÃO E INSERÇÃO DOS REGISTROS DA TABELA TADICAO_DE_IMPORTACAO                  DA BASE MYINDAIA EM RELAÇÃO AOS PROCESSO QUE CONSTAM NA TABELA @TMP_PROCESSO */
INSERT  INTO MYINDAIA.DBO.TADICAO_DE_IMPORTACAO ( NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                                         CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                                         CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                                         CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                                         CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                                         CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                                         ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                                         ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                              IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                                         PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                                         QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                                         VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                                         VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, VL_MERC_LOC_EMB_MN, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                                         VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                                         VL_MERC_LOC_EMB_MNEG, CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                                         VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                                         VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS,*/ CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                                         PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                                         )
SELECT  /*/*DISTINCT*/ */                     AI.NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                                            CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                                            CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                                            CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                                            CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                                            CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                                            ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                                            ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                                            IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                                            PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                                            QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                                            VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                                            VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, VL_MERC_LOC_EMB_MN, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                                            VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                                            VL_MERC_LOC_EMB_MNEG, AI.CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                                            VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                                            VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS, */CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                                            PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                                         FROM @TMP_PROCESSO ATZ                                          INNER JOIN TPROCESSO             PR  (NOLOCK)ON ( PR.NR_PROCESSO = ATZ.NR_PROCESSO )                                         INNER JOIN TADICAO_DE_IMPORTACAO AI (NOLOCK)ON ( AI.NR_PROCESSO = ATZ.NR_PROCESSO )                                         WHERE ATZ.NM_TABELA  = 'TADICAO_DE_IMPORTACAO'                                         AND ISNULL( PR.IN_CANCELADO, '0' ) = '0'                                         AND YEAR(PR.DT_ABERTURA) >= @DATA                                         AND SUBSTRING(PR.NR_PROCESSO, 5, 2) NOT IN ('IW','EW')
SET  @REGISTROS = @REGISTROS + @@ROWCOUNT                                         /*VERIFICA SE OCORRERAM ERROS     */
  ```

- **CLEAR**: Inserts new tracking/workflow records into `MYINDAIA.DBO.TADICAO_DE_IMPORTACAO`. (Developer note: 'VERIFICA SE OCORRERAM ERROS')
  ```sql
INSERT  INTO MYINDAIA.DBO.TADICAO_DE_IMPORTACAO ( NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                                         CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                                         CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                                         CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                                         CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                                         CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                                         ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                                         ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                              IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                                         PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                                         QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                                         VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                                         VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, VL_MERC_LOC_EMB_MN, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                                         VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                                         VL_MERC_LOC_EMB_MNEG, CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                                         VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                                         VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS,*/ CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                                         PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                                         )
SELECT  /*/*DISTINCT*/ */                     AI.NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                                            CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                                            CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                                            CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                                            CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                                            CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                                            ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                                            ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                                            IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                                            PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                                            QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                                            VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                                            VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, VL_MERC_LOC_EMB_MN, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                                            VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                                            VL_MERC_LOC_EMB_MNEG, AI.CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                                            VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                                            VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS, */CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                                            PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                                         FROM @TMP_PROCESSO ATZ                                          INNER JOIN TPROCESSO             PR  (NOLOCK)ON ( PR.NR_PROCESSO = ATZ.NR_PROCESSO )                                         INNER JOIN TADICAO_DE_IMPORTACAO AI (NOLOCK)ON ( AI.NR_PROCESSO = ATZ.NR_PROCESSO )                                         WHERE ATZ.NM_TABELA  = 'TADICAO_DE_IMPORTACAO'                                         AND ISNULL( PR.IN_CANCELADO, '0' ) = '0'                                         AND YEAR(PR.DT_ABERTURA) >= @DATA                                         AND SUBSTRING(PR.NR_PROCESSO, 5, 2) NOT IN ('IW','EW')
SET  @REGISTROS = @REGISTROS + @@ROWCOUNT                                         /*VERIFICA SE OCORRERAM ERROS     */
END  TRY
  ```

- **CLEAR**: Removes outdated or cancelled records from `P`. (Developer note: 'VERIFICA SE OCORRERAM ERROS')
  ```sql
DELETE  P                   FROM MYINDAIA.DBO.TDECLARACAO_IMPORTACAO P (NOLOCK),                        @TMP_PROCESSO PD                  WHERE P.NR_PROCESSO = PD.NR_PROCESSO                   AND NM_TABELA     = 'TDECLARACAO_IMPORTACAO'
INSERT  INTO MYINDAIA.DBO.TDECLARACAO_IMPORTACAO ( NR_PROCESSO, NR_IDENT_USUARIO, CD_APLICACAO_MERC, CD_BANDEIRA_TRANSP,                                         CD_COBERTURA_CAMBIAL, CD_DESTAQUE_NCM, CD_FORMA_PAGAMENTO, CD_FUND_LEGAL_II, CD_IMPORTADOR, CD_INCOTERM, CD_LOCAL_EMBARQUE,                                         CD_METODO_VALORACAO, CD_MODALIDADE_DESP, CD_MODALIDADE_PAGTO, CD_MOEDA_DESPESAS, CD_MOEDA_FRETE, CD_MOEDA_MLE, CD_MOEDA_SEGURO,                                         CD_MOTIVO_SEM_COBERTURA, CD_MOTIVO_TRANS, CD_PAIS_IMPORTADOR, CD_PAIS_PROC_CARGA, CD_RECINTO_ALFAND, CD_REG_TRIB_II, CD_REG_TRIB_IPI,                                         CD_SETOR_ARMAZENAM, CD_TIPO_AG_CARGA, CD_TIPO_CONSIG, CD_TIPO_DCTO_CARGA, CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR, CD_TIPO_MANIFESTO,                                         CD_TRANSPORTADOR, CD_URF_DESPACHO, CD_URF_ENTR_CARGA, CD_UTIL_DCTO_CARGA, CD_VIA_TRANSP_CARG, CD_VINC_IMPO_EXPO, DT_CHEGADA_CARGA,                                         DT_EMBARQUE, DT_PROCESSAMENTO, DT_REGISTRO_DI, DT_TRANSMISSAO, IN_BEM_ENCOMENDA, IN_MATERIAL_USADO, IN_MOEDA_NACIONAL, IN_MOEDA_UNICA,                                         IN_MULTIMODAL, IN_OPERACAO_FUNDAP, IN_RATEAR_FRETE_ITENS, IN_RATEAR_SEGURO_ITENS, IN_REPASSA_DADOS_ADICAO, IN_REPASSA_DADOS_CAMBIO,                                         NM_CONSIGNATARIO, NM_VEICULO_TRANSP, NR_AGENTE_CARGA, NR_BANCO_COM, NR_BANCO_PAGAMENTO, NR_COMPRADOR_ME, NR_CONSIGNATARIO,                                         NR_CONTRATO_CAMBIO, NR_CPF_REPR_LEGAL, NR_DCTO_CARGA, NR_DCTO_CARGA_MAST, NR_DECL_IMP_PROT, NR_DECLARACAO_IMP, NR_IDENTIFICACAO_COM,                                         NR_MANIFESTO, NR_PRACA_COM, NR_PRACA_PAGAMENTO, NR_ROF, NR_VEICULO_TRANSP, PB_CARGA, PC_COMISSAO, PC_ICMS, PC_REDUCAO_ICMS, PL_CARGA,                                         QT_ADICOES, TX_INFO_COMPL, VL_FRETE_TNAC_MNEG, VL_TOT_DESPS_MN, VL_TOT_DESPS_MNEG, VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID,                                         VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_FRETE_MN, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, PC_SEGURO_MLE, VL_TOTAL_II, VL_TOTAL_IPI,                                         VL_TOTAL_AD, DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO, CD_TIPO_BASE_SEGURO, IN_REB, VL_TOT_ICMS, CD_TIPO_PGTO_TRIB, NR_CONTA_PGTO_TRIB,                                         TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, NR_REF_CLI, IN_SISCOMEX, CD_TIPO_ICMS, IN_ICMS_IMPRESSO, DT_ICMS_IMPRESSO, VL_TOTAL_ACRESCIMOS_MN,                                         VL_TOTAL_DEDUCOES_MN, DT_CALCULO, VL_DESPESA_ITEM, VL_DESPESA_ITEM_MN, CD_ORGAO_FIN_INTER, CD_PRESENCA_CARGA, NR_SEQ_RETIFICACAO,                                         CD_MOTIVO_RETIF, DT_RETIFICACAO, DT_EXON_IMPRESSO, IN_EXON_IMPRESSO, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_TOTAL_CAMBIO,                                         CD_AUSENCIA_FABRIC, CD_FORNECEDOR, CD_FABRICANTE, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                                         CD_PERIOD_PGTO_360, IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS, VL_TOTAL_ACRESCIMOS_MNEG, VL_TOTAL_DEDUCOES_MNEG, VL_TOTAL_FRETE_MNEG,                                         NR_PROCESSO_SISCOMEX, IN_PGTO_VARIAV_360, CD_VEICULO_TRANSP, PC_REDUCAO_IPT_BLI, DT_DI,                VL_TOTAL_TX_SCX, VL_TOT_PIS_COFINS, CD_RESP_CONFERENCIA, DT_CONFERENCIA                                         )
SELECT  /*/*DISTINCT*/ */DI.NR_PROCESSO, NR_IDENT_USUARIO, CD_APLICACAO_MERC, CD_BANDEIRA_TRANSP,                                         CD_COBERTURA_CAMBIAL, CD_DESTAQUE_NCM, CD_FORMA_PAGAMENTO, CD_FUND_LEGAL_II, DI.CD_IMPORTADOR, DI.CD_INCOTERM, DI.CD_LOCAL_EMBARQUE,                                         CD_METODO_VALORACAO, CD_MODALIDADE_DESP, CD_MODALIDADE_PAGTO, CD_MOEDA_DESPESAS, DI.CD_MOEDA_FRETE, DI.CD_MOEDA_MLE, DI.CD_MOEDA_SEGURO,                               CD_MOTIVO_SEM_COBERTURA, CD_MOTIVO_TRANS, CD_PAIS_IMPORTADOR, CD_PAIS_PROC_CARGA, CD_RECINTO_ALFAND, CD_REG_TRIB_II, CD_REG_TRIB_IPI,                                         CD_SETOR_ARMAZENAM, CD_TIPO_AG_CARGA, CD_TIPO_CONSIG, CD_TIPO_DCTO_CARGA, CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR, CD_TIPO_MANIFESTO,                                         DI.CD_TRANSPORTADOR, CD_URF_DESPACHO, CD_URF_ENTR_CARGA, CD_UTIL_DCTO_CARGA, CD_VIA_TRANSP_CARG, DI.CD_VINC_IMPO_EXPO, DT_CHEGADA_CARGA,                                         DI.DT_EMBARQUE, DT_PROCESSAMENTO, DT_REGISTRO_DI, DT_TRANSMISSAO, IN_BEM_ENCOMENDA, IN_MATERIAL_USADO, IN_MOEDA_NACIONAL, DI.IN_MOEDA_UNICA,                                         IN_MULTIMODAL, IN_OPERACAO_FUNDAP, IN_RATEAR_FRETE_ITENS, IN_RATEAR_SEGURO_ITENS, IN_REPASSA_DADOS_ADICAO, IN_REPASSA_DADOS_CAMBIO,                                         NM_CONSIGNATARIO, NM_VEICULO_TRANSP, NR_AGENTE_CARGA, NR_BANCO_COM, NR_BANCO_PAGAMENTO, NR_COMPRADOR_ME, NR_CONSIGNATARIO,                                         NR_CONTRATO_CAMBIO, NR_CPF_REPR_LEGAL, NR_DCTO_CARGA, NR_DCTO_CARGA_MAST, NR_DECL_IMP_PROT, NR_DECLARACAO_IMP, NR_IDENTIFICACAO_COM,                                         DI.NR_MANIFESTO, NR_PRACA_COM, NR_PRACA_PAGAMENTO, NR_ROF, NR_VEICULO_TRANSP, PB_CARGA, PC_COMISSAO, PC_ICMS, PC_REDUCAO_ICMS, PL_CARGA,                                         DI.QT_ADICOES, TX_INFO_COMPL, DI.VL_FRETE_TNAC_MNEG, VL_TOT_DESPS_MN, VL_TOT_DESPS_MNEG, VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID,                                         VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_FRETE_MN, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, PC_SEGURO_MLE, VL_TOTAL_II, VL_TOTAL_IPI,                                         VL_TOTAL_AD, DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO, CD_TIPO_BASE_SEGURO, DI.IN_REB, VL_TOT_ICMS, CD_TIPO_PGTO_TRIB, NR_CONTA_PGTO_TRIB,                                         TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, NR_REF_CLI, IN_SISCOMEX, CD_TIPO_ICMS, IN_ICMS_IMPRESSO, DT_ICMS_IMPRESSO, VL_TOTAL_ACRESCIMOS_MN,                                         VL_TOTAL_DEDUCOES_MN, DI.DT_CALCULO, VL_DESPESA_ITEM, VL_DESPESA_ITEM_MN, CD_ORGAO_FIN_INTER, CD_PRESENCA_CARGA, NR_SEQ_RETIFICACAO,                                         CD_MOTIVO_RETIF, DT_RETIFICACAO, DT_EXON_IMPRESSO, IN_EXON_IMPRESSO, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_TOTAL_CAMBIO,                                         CD_AUSENCIA_FABRIC, CD_FORNECEDOR, CD_FABRICANTE, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                                         CD_PERIOD_PGTO_360, DI.IN_EMBUT_FRT_ITENS, DI.IN_EMBUT_SEG_ITENS, VL_TOTAL_ACRESCIMOS_MNEG, VL_TOTAL_DEDUCOES_MNEG, VL_TOTAL_FRETE_MNEG,                                         NR_PROCESSO_SISCOMEX, IN_PGTO_VARIAV_360, CD_VEICULO_TRANSP, PC_REDUCAO_IPT_BLI,                DT_DI, VL_TOTAL_TX_SCX, VL_TOT_PIS_COFINS , PV.CD_USUARIO, PV.DT_PREVISAO                                        FROM @TMP_PROCESSO ATZ                                         INNER JOIN TPROCESSO              PR (NOLOCK) ON ( PR.NR_PROCESSO = ATZ.NR_PROCESSO )                                         INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON ( DI.NR_PROCESSO = ATZ.NR_PROCESSO )                  LEFT  JOIN TPREVISAO              PV (NOLOCK) ON ( PV.NR_PROCESSO = ATZ.NR_PROCESSO )                                          WHERE ATZ.NM_TABELA   = 'TDECLARACAO_IMPORTACAO'                                         AND ISNULL( PR.IN_CANCELADO, '0' ) = '0'                                         AND YEAR(PR.DT_ABERTURA) >= @DATA                                         AND SUBSTRING(PR.NR_PROCESSO, 5, 2) NOT IN ('IW','EW')
SET  @REGISTROS = @REGISTROS + @@ROWCOUNT
  ```

#### `sp_atz_myindaia_processo2_bkp_20180323`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_myindaia_processo2_bkp_20180323` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `MYINDAIA`, `MYMONEY`, `TADICAO_DE_IMPORTACAO`, `TATZ_MYINDAIA_PROCESSO`, `TDECLARACAO_IMPORTACAO`, `TDEM_FAT`, `TDEM_FAT_CNTR`, `TDETALHE_MERCADORIA`, `TDOCUMENTO_INSTRUCAO`, `TFATURAMENTO_CC`, `TPREVISAO`, `TPROCESSO` |
| **Tables written** | `INSERT TDECLARACAO_IMPORTACAO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `P`. (Developer note: 'define a partir de que ano os dados serão copiados')
  ```sql
DELETE  P FROM MYINDAIA.DBO.TADICAO_DE_IMPORTACAO P, #TMP_PROCESSO PD WHERE P.NR_PROCESSO = PD.NR_PROCESSO AND NM_TABELA = 'TADICAO_DE_IMPORTACAO'
--inicio da seleção e inserção dos registros da tabela tadicao_de_importacao da base myindaia em relação aos                              --processo que constam na tabela #TMP_PROCESSO
INSERT  INTO MYINDAIA.DBO.TADICAO_DE_IMPORTACAO ( NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                             CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                             CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                             CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                             CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                             CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                             ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                             ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                             IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                             PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                             QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                             VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                             VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, vl_merc_loc_emb_mn, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                             VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                             vl_merc_loc_emb_mneg, CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                             VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                             VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS,*/ CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                             PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                             )
SELECT  /*/*DISTINCT*/ */AI.NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                             CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                             CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                             CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                             CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                             CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                             ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                             ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                             IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                             PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                             QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                             VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                             VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, vl_merc_loc_emb_mn, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                             VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                             VL_MERC_LOC_EMB_MNEG, AI.CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                             VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                             VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS, */CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                             PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                             FROM #TMP_PROCESSO ATZ                              INNER JOIN TPROCESSO             PR  ON ( PR.NR_PROCESSO = ATZ.NR_PROCESSO )                             INNER JOIN TADICAO_DE_IMPORTACAO AI  ON ( AI.NR_PROCESSO = ATZ.NR_PROCESSO )                             WHERE ATZ.NM_TABELA = 'TADICAO_DE_IMPORTACAO'                             AND ISNULL( PR.IN_CANCELADO, '0' ) = '0'                             AND YEAR(PR.DT_ABERTURA) >= @data                             AND SUBSTRING(PR.NR_PROCESSO, 5, 2) NOT IN ('IW','EW')
  ```

- **CLEAR**: Inserts new tracking/workflow records into `MYINDAIA.DBO.TADICAO_DE_IMPORTACAO`. (Developer note: 'define a partir de que ano os dados serão copiados')
  ```sql
INSERT  INTO MYINDAIA.DBO.TADICAO_DE_IMPORTACAO ( NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                             CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                             CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                             CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                             CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                             CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                             ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                             ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                             IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                             PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                             QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                             VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                             VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, vl_merc_loc_emb_mn, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                             VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                             vl_merc_loc_emb_mneg, CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                             VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                             VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS,*/ CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                             PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                             )
SELECT  /*/*DISTINCT*/ */AI.NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, CD_APLICACAO_MERC,                             CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD_FABRICANTE, CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA,                             CD_LOC_COND_VENDA, CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_MERC_NBM_SH, CD_NCM_SH, CD_MERCADORIA_NCM,                             CD_METOD_VALORACAO, CD_MODALIDADE_PGTO, CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD_MOTIVO_ADM_TEMP,                             CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360,                             CD_REGIME_TRIBUTAR, CD_TAXA_JUROS, CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_VIA_TRANSPORTE, CD_VINC_IMPO_EXPO,                             ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_COMPL_FABRIC, ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_LOGR_FABRIC,                             ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCOMENDA, IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO,                             IN_MULTIMODAL, IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGENTE_IMP, NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF,                             PC_COEF_REDUC_II, PC_COMISSAO_AG_IMP, PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                             QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, VL_BASE_CALCULO_MN, VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN,                             VL_DESPESAS_MN, VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRETE_MERC_MNEG, VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN,                             VL_II_DEVIDO_ZFM, VL_MERC_COND_VENDA, VL_MERC_EMB_MN, vl_merc_loc_emb_mn, VL_MERC_VENDA_MN, VL_SEG_MERC_MN, VL_SEG_MERC_MNEG,                             VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADICAO_CALCULADA, PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLHER,                             VL_MERC_LOC_EMB_MNEG, AI.CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_DESPESAS,                             VL_BASE_CALC_II, VL_BASE_CALC_IPI, VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SCX_AD, ALIQ_PIS, ALIQ_COFINS,                             VL_BASE_PIS, VL_PIS, VL_COFINS, /*TX_PIS_COFINS, */CD_TIPO_BENEF_PIS_COFINS, PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP,                             PC_REDUCAO_IPT_II, PC_REDUCAO_IPT_IPI, PB_MERCADORIA                             FROM #TMP_PROCESSO ATZ                              INNER JOIN TPROCESSO             PR  ON ( PR.NR_PROCESSO = ATZ.NR_PROCESSO )                             INNER JOIN TADICAO_DE_IMPORTACAO AI  ON ( AI.NR_PROCESSO = ATZ.NR_PROCESSO )                             WHERE ATZ.NM_TABELA = 'TADICAO_DE_IMPORTACAO'                             AND ISNULL( PR.IN_CANCELADO, '0' ) = '0'                             AND YEAR(PR.DT_ABERTURA) >= @data                             AND SUBSTRING(PR.NR_PROCESSO, 5, 2) NOT IN ('IW','EW')
SET  @registros = @registros + @@rowcount
--verifica se ocorreram erros
  ```

- **CLEAR**: Removes outdated or cancelled records from `P`. (Developer note: 'define a partir de que ano os dados serão copiados')
  ```sql
DELETE  P FROM MYINDAIA.DBO.TDECLARACAO_IMPORTACAO P, #TMP_PROCESSO PD WHERE P.NR_PROCESSO = PD.NR_PROCESSO AND NM_TABELA = 'TDECLARACAO_IMPORTACAO'
--processo que constam na tabela #TMP_PROCESSO
INSERT  INTO MYINDAIA.DBO.TDECLARACAO_IMPORTACAO ( NR_PROCESSO, NR_IDENT_USUARIO, CD_APLICACAO_MERC, CD_BANDEIRA_TRANSP,                             CD_COBERTURA_CAMBIAL, CD_DESTAQUE_NCM, CD_FORMA_PAGAMENTO, CD_FUND_LEGAL_II, CD_IMPORTADOR, CD_INCOTERM, CD_LOCAL_EMBARQUE,                             CD_METODO_VALORACAO, CD_MODALIDADE_DESP, CD_MODALIDADE_PAGTO, CD_MOEDA_DESPESAS, CD_MOEDA_FRETE, CD_MOEDA_MLE, CD_MOEDA_SEGURO,                             CD_MOTIVO_SEM_COBERTURA, CD_MOTIVO_TRANS, CD_PAIS_IMPORTADOR, CD_PAIS_PROC_CARGA, CD_RECINTO_ALFAND, CD_REG_TRIB_II, CD_REG_TRIB_IPI,                             CD_SETOR_ARMAZENAM, CD_TIPO_AG_CARGA, CD_TIPO_CONSIG, CD_TIPO_DCTO_CARGA, CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR, CD_TIPO_MANIFESTO,                             CD_TRANSPORTADOR, CD_URF_DESPACHO, CD_URF_ENTR_CARGA, CD_UTIL_DCTO_CARGA, CD_VIA_TRANSP_CARG, CD_VINC_IMPO_EXPO, DT_CHEGADA_CARGA,                             DT_EMBARQUE, DT_PROCESSAMENTO, DT_REGISTRO_DI, DT_TRANSMISSAO, IN_BEM_ENCOMENDA, IN_MATERIAL_USADO, IN_MOEDA_NACIONAL, IN_MOEDA_UNICA,                             IN_MULTIMODAL, IN_OPERACAO_FUNDAP, IN_RATEAR_FRETE_ITENS, IN_RATEAR_SEGURO_ITENS, IN_REPASSA_DADOS_ADICAO, IN_REPASSA_DADOS_CAMBIO,                             NM_CONSIGNATARIO, NM_VEICULO_TRANSP, NR_AGENTE_CARGA, NR_BANCO_COM, NR_BANCO_PAGAMENTO, NR_COMPRADOR_ME, NR_CONSIGNATARIO,                             NR_CONTRATO_CAMBIO, NR_CPF_REPR_LEGAL, NR_DCTO_CARGA, NR_DCTO_CARGA_MAST, NR_DECL_IMP_PROT, NR_DECLARACAO_IMP, NR_IDENTIFICACAO_COM,                             NR_MANIFESTO, NR_PRACA_COM, NR_PRACA_PAGAMENTO, NR_ROF, NR_VEICULO_TRANSP, PB_CARGA, PC_COMISSAO, PC_ICMS, PC_REDUCAO_ICMS, PL_CARGA,                             QT_ADICOES, TX_INFO_COMPL, VL_FRETE_TNAC_MNEG, VL_TOT_DESPS_MN, VL_TOT_DESPS_MNEG, VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID,                             VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_FRETE_MN, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, PC_SEGURO_MLE, VL_TOTAL_II, VL_TOTAL_IPI,                             VL_TOTAL_AD, DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO, CD_TIPO_BASE_SEGURO, IN_REB, VL_TOT_ICMS, CD_TIPO_PGTO_TRIB, NR_CONTA_PGTO_TRIB,                             TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, NR_REF_CLI, IN_SISCOMEX, CD_TIPO_ICMS, IN_ICMS_IMPRESSO, DT_ICMS_IMPRESSO, VL_TOTAL_ACRESCIMOS_MN,                             VL_TOTAL_DEDUCOES_MN, DT_CALCULO, VL_DESPESA_ITEM, VL_DESPESA_ITEM_MN, CD_ORGAO_FIN_INTER, CD_PRESENCA_CARGA, NR_SEQ_RETIFICACAO,                             CD_MOTIVO_RETIF, DT_RETIFICACAO, DT_EXON_IMPRESSO, IN_EXON_IMPRESSO, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_TOTAL_CAMBIO,                             CD_AUSENCIA_FABRIC, CD_FORNECEDOR, CD_FABRICANTE, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                             CD_PERIOD_PGTO_360, IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS, VL_TOTAL_ACRESCIMOS_MNEG, VL_TOTAL_DEDUCOES_MNEG, VL_TOTAL_FRETE_MNEG,                             NR_PROCESSO_SISCOMEX, IN_PGTO_VARIAV_360, CD_VEICULO_TRANSP, PC_REDUCAO_IPT_BLI, DT_DI, VL_TOTAL_TX_SCX, VL_TOT_PIS_COFINS, CD_RESP_CONFERENCIA, DT_CONFERENCIA                             )
SELECT  /*/*DISTINCT*/ */DI.NR_PROCESSO, NR_IDENT_USUARIO, CD_APLICACAO_MERC, CD_BANDEIRA_TRANSP,                             CD_COBERTURA_CAMBIAL, CD_DESTAQUE_NCM, CD_FORMA_PAGAMENTO, CD_FUND_LEGAL_II, DI.CD_IMPORTADOR, DI.CD_INCOTERM, DI.CD_LOCAL_EMBARQUE,                             CD_METODO_VALORACAO, CD_MODALIDADE_DESP, CD_MODALIDADE_PAGTO, CD_MOEDA_DESPESAS, DI.CD_MOEDA_FRETE, DI.CD_MOEDA_MLE, DI.CD_MOEDA_SEGURO,                   CD_MOTIVO_SEM_COBERTURA, CD_MOTIVO_TRANS, CD_PAIS_IMPORTADOR, CD_PAIS_PROC_CARGA, CD_RECINTO_ALFAND, CD_REG_TRIB_II, CD_REG_TRIB_IPI,                             CD_SETOR_ARMAZENAM, CD_TIPO_AG_CARGA, CD_TIPO_CONSIG, CD_TIPO_DCTO_CARGA, CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR, CD_TIPO_MANIFESTO,                             DI.CD_TRANSPORTADOR, CD_URF_DESPACHO, CD_URF_ENTR_CARGA, CD_UTIL_DCTO_CARGA, CD_VIA_TRANSP_CARG, DI.CD_VINC_IMPO_EXPO, DT_CHEGADA_CARGA,                             DI.DT_EMBARQUE, DT_PROCESSAMENTO, DT_REGISTRO_DI, DT_TRANSMISSAO, IN_BEM_ENCOMENDA, IN_MATERIAL_USADO, IN_MOEDA_NACIONAL, DI.IN_MOEDA_UNICA,                             IN_MULTIMODAL, IN_OPERACAO_FUNDAP, IN_RATEAR_FRETE_ITENS, IN_RATEAR_SEGURO_ITENS, IN_REPASSA_DADOS_ADICAO, IN_REPASSA_DADOS_CAMBIO,                             NM_CONSIGNATARIO, NM_VEICULO_TRANSP, NR_AGENTE_CARGA, NR_BANCO_COM, NR_BANCO_PAGAMENTO, NR_COMPRADOR_ME, NR_CONSIGNATARIO,                             NR_CONTRATO_CAMBIO, NR_CPF_REPR_LEGAL, NR_DCTO_CARGA, NR_DCTO_CARGA_MAST, NR_DECL_IMP_PROT, NR_DECLARACAO_IMP, NR_IDENTIFICACAO_COM,                             DI.NR_MANIFESTO, NR_PRACA_COM, NR_PRACA_PAGAMENTO, NR_ROF, NR_VEICULO_TRANSP, PB_CARGA, PC_COMISSAO, PC_ICMS, PC_REDUCAO_ICMS, PL_CARGA,                             DI.QT_ADICOES, TX_INFO_COMPL, DI.VL_FRETE_TNAC_MNEG, VL_TOT_DESPS_MN, VL_TOT_DESPS_MNEG, VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID,                             VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_FRETE_MN, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, PC_SEGURO_MLE, VL_TOTAL_II, VL_TOTAL_IPI,                             VL_TOTAL_AD, DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO, CD_TIPO_BASE_SEGURO, DI.IN_REB, VL_TOT_ICMS, CD_TIPO_PGTO_TRIB, NR_CONTA_PGTO_TRIB,                             TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, NR_REF_CLI, IN_SISCOMEX, CD_TIPO_ICMS, IN_ICMS_IMPRESSO, DT_ICMS_IMPRESSO, VL_TOTAL_ACRESCIMOS_MN,                             VL_TOTAL_DEDUCOES_MN, DI.DT_CALCULO, VL_DESPESA_ITEM, VL_DESPESA_ITEM_MN, CD_ORGAO_FIN_INTER, CD_PRESENCA_CARGA, NR_SEQ_RETIFICACAO,                             CD_MOTIVO_RETIF, DT_RETIFICACAO, DT_EXON_IMPRESSO, IN_EXON_IMPRESSO, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_TOTAL_CAMBIO,                             CD_AUSENCIA_FABRIC, CD_FORNECEDOR, CD_FABRICANTE, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                             CD_PERIOD_PGTO_360, DI.IN_EMBUT_FRT_ITENS, DI.IN_EMBUT_SEG_ITENS, VL_TOTAL_ACRESCIMOS_MNEG, VL_TOTAL_DEDUCOES_MNEG, VL_TOTAL_FRETE_MNEG,                             NR_PROCESSO_SISCOMEX, IN_PGTO_VARIAV_360, CD_VEICULO_TRANSP, PC_REDUCAO_IPT_BLI, DT_DI, VL_TOTAL_TX_SCX, VL_TOT_PIS_COFINS , PV.CD_USUARIO, PV.DT_PREVISAO                            FROM #TMP_PROCESSO ATZ                             INNER JOIN TPROCESSO              PR  ON ( PR.NR_PROCESSO = ATZ.NR_PROCESSO )                             INNER JOIN TDECLARACAO_IMPORTACAO DI  ON ( DI.NR_PROCESSO = ATZ.NR_PROCESSO )      LEFT  JOIN TPREVISAO              PV  ON ( PV.NR_PROCESSO = ATZ.NR_PROCESSO )                              WHERE ATZ.NM_TABELA   = 'TDECLARACAO_IMPORTACAO'                             AND ISNULL( PR.IN_CANCELADO, '0' ) = '0'                             AND YEAR(PR.DT_ABERTURA) >= @data                             AND SUBSTRING(PR.NR_PROCESSO, 5, 2) NOT IN ('IW','EW')
  ```

- **CLEAR**: Inserts new tracking/workflow records into `MYINDAIA.DBO.TDECLARACAO_IMPORTACAO`. (Developer note: 'define a partir de que ano os dados serão copiados')
  ```sql
INSERT  INTO MYINDAIA.DBO.TDECLARACAO_IMPORTACAO ( NR_PROCESSO, NR_IDENT_USUARIO, CD_APLICACAO_MERC, CD_BANDEIRA_TRANSP,                             CD_COBERTURA_CAMBIAL, CD_DESTAQUE_NCM, CD_FORMA_PAGAMENTO, CD_FUND_LEGAL_II, CD_IMPORTADOR, CD_INCOTERM, CD_LOCAL_EMBARQUE,                             CD_METODO_VALORACAO, CD_MODALIDADE_DESP, CD_MODALIDADE_PAGTO, CD_MOEDA_DESPESAS, CD_MOEDA_FRETE, CD_MOEDA_MLE, CD_MOEDA_SEGURO,                             CD_MOTIVO_SEM_COBERTURA, CD_MOTIVO_TRANS, CD_PAIS_IMPORTADOR, CD_PAIS_PROC_CARGA, CD_RECINTO_ALFAND, CD_REG_TRIB_II, CD_REG_TRIB_IPI,                             CD_SETOR_ARMAZENAM, CD_TIPO_AG_CARGA, CD_TIPO_CONSIG, CD_TIPO_DCTO_CARGA, CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR, CD_TIPO_MANIFESTO,                             CD_TRANSPORTADOR, CD_URF_DESPACHO, CD_URF_ENTR_CARGA, CD_UTIL_DCTO_CARGA, CD_VIA_TRANSP_CARG, CD_VINC_IMPO_EXPO, DT_CHEGADA_CARGA,                             DT_EMBARQUE, DT_PROCESSAMENTO, DT_REGISTRO_DI, DT_TRANSMISSAO, IN_BEM_ENCOMENDA, IN_MATERIAL_USADO, IN_MOEDA_NACIONAL, IN_MOEDA_UNICA,                             IN_MULTIMODAL, IN_OPERACAO_FUNDAP, IN_RATEAR_FRETE_ITENS, IN_RATEAR_SEGURO_ITENS, IN_REPASSA_DADOS_ADICAO, IN_REPASSA_DADOS_CAMBIO,                             NM_CONSIGNATARIO, NM_VEICULO_TRANSP, NR_AGENTE_CARGA, NR_BANCO_COM, NR_BANCO_PAGAMENTO, NR_COMPRADOR_ME, NR_CONSIGNATARIO,                             NR_CONTRATO_CAMBIO, NR_CPF_REPR_LEGAL, NR_DCTO_CARGA, NR_DCTO_CARGA_MAST, NR_DECL_IMP_PROT, NR_DECLARACAO_IMP, NR_IDENTIFICACAO_COM,                             NR_MANIFESTO, NR_PRACA_COM, NR_PRACA_PAGAMENTO, NR_ROF, NR_VEICULO_TRANSP, PB_CARGA, PC_COMISSAO, PC_ICMS, PC_REDUCAO_ICMS, PL_CARGA,                             QT_ADICOES, TX_INFO_COMPL, VL_FRETE_TNAC_MNEG, VL_TOT_DESPS_MN, VL_TOT_DESPS_MNEG, VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID,                             VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_FRETE_MN, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, PC_SEGURO_MLE, VL_TOTAL_II, VL_TOTAL_IPI,                             VL_TOTAL_AD, DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO, CD_TIPO_BASE_SEGURO, IN_REB, VL_TOT_ICMS, CD_TIPO_PGTO_TRIB, NR_CONTA_PGTO_TRIB,                             TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, NR_REF_CLI, IN_SISCOMEX, CD_TIPO_ICMS, IN_ICMS_IMPRESSO, DT_ICMS_IMPRESSO, VL_TOTAL_ACRESCIMOS_MN,                             VL_TOTAL_DEDUCOES_MN, DT_CALCULO, VL_DESPESA_ITEM, VL_DESPESA_ITEM_MN, CD_ORGAO_FIN_INTER, CD_PRESENCA_CARGA, NR_SEQ_RETIFICACAO,                             CD_MOTIVO_RETIF, DT_RETIFICACAO, DT_EXON_IMPRESSO, IN_EXON_IMPRESSO, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_TOTAL_CAMBIO,                             CD_AUSENCIA_FABRIC, CD_FORNECEDOR, CD_FABRICANTE, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                             CD_PERIOD_PGTO_360, IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS, VL_TOTAL_ACRESCIMOS_MNEG, VL_TOTAL_DEDUCOES_MNEG, VL_TOTAL_FRETE_MNEG,                             NR_PROCESSO_SISCOMEX, IN_PGTO_VARIAV_360, CD_VEICULO_TRANSP, PC_REDUCAO_IPT_BLI, DT_DI, VL_TOTAL_TX_SCX, VL_TOT_PIS_COFINS, CD_RESP_CONFERENCIA, DT_CONFERENCIA                             )
SELECT  /*/*DISTINCT*/ */DI.NR_PROCESSO, NR_IDENT_USUARIO, CD_APLICACAO_MERC, CD_BANDEIRA_TRANSP,                             CD_COBERTURA_CAMBIAL, CD_DESTAQUE_NCM, CD_FORMA_PAGAMENTO, CD_FUND_LEGAL_II, DI.CD_IMPORTADOR, DI.CD_INCOTERM, DI.CD_LOCAL_EMBARQUE,                             CD_METODO_VALORACAO, CD_MODALIDADE_DESP, CD_MODALIDADE_PAGTO, CD_MOEDA_DESPESAS, DI.CD_MOEDA_FRETE, DI.CD_MOEDA_MLE, DI.CD_MOEDA_SEGURO,                   CD_MOTIVO_SEM_COBERTURA, CD_MOTIVO_TRANS, CD_PAIS_IMPORTADOR, CD_PAIS_PROC_CARGA, CD_RECINTO_ALFAND, CD_REG_TRIB_II, CD_REG_TRIB_IPI,                             CD_SETOR_ARMAZENAM, CD_TIPO_AG_CARGA, CD_TIPO_CONSIG, CD_TIPO_DCTO_CARGA, CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR, CD_TIPO_MANIFESTO,                             DI.CD_TRANSPORTADOR, CD_URF_DESPACHO, CD_URF_ENTR_CARGA, CD_UTIL_DCTO_CARGA, CD_VIA_TRANSP_CARG, DI.CD_VINC_IMPO_EXPO, DT_CHEGADA_CARGA,                             DI.DT_EMBARQUE, DT_PROCESSAMENTO, DT_REGISTRO_DI, DT_TRANSMISSAO, IN_BEM_ENCOMENDA, IN_MATERIAL_USADO, IN_MOEDA_NACIONAL, DI.IN_MOEDA_UNICA,                             IN_MULTIMODAL, IN_OPERACAO_FUNDAP, IN_RATEAR_FRETE_ITENS, IN_RATEAR_SEGURO_ITENS, IN_REPASSA_DADOS_ADICAO, IN_REPASSA_DADOS_CAMBIO,                             NM_CONSIGNATARIO, NM_VEICULO_TRANSP, NR_AGENTE_CARGA, NR_BANCO_COM, NR_BANCO_PAGAMENTO, NR_COMPRADOR_ME, NR_CONSIGNATARIO,                             NR_CONTRATO_CAMBIO, NR_CPF_REPR_LEGAL, NR_DCTO_CARGA, NR_DCTO_CARGA_MAST, NR_DECL_IMP_PROT, NR_DECLARACAO_IMP, NR_IDENTIFICACAO_COM,                             DI.NR_MANIFESTO, NR_PRACA_COM, NR_PRACA_PAGAMENTO, NR_ROF, NR_VEICULO_TRANSP, PB_CARGA, PC_COMISSAO, PC_ICMS, PC_REDUCAO_ICMS, PL_CARGA,                             DI.QT_ADICOES, TX_INFO_COMPL, DI.VL_FRETE_TNAC_MNEG, VL_TOT_DESPS_MN, VL_TOT_DESPS_MNEG, VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID,                             VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_FRETE_MN, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, PC_SEGURO_MLE, VL_TOTAL_II, VL_TOTAL_IPI,                             VL_TOTAL_AD, DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO, CD_TIPO_BASE_SEGURO, DI.IN_REB, VL_TOT_ICMS, CD_TIPO_PGTO_TRIB, NR_CONTA_PGTO_TRIB,                             TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, NR_REF_CLI, IN_SISCOMEX, CD_TIPO_ICMS, IN_ICMS_IMPRESSO, DT_ICMS_IMPRESSO, VL_TOTAL_ACRESCIMOS_MN,                             VL_TOTAL_DEDUCOES_MN, DI.DT_CALCULO, VL_DESPESA_ITEM, VL_DESPESA_ITEM_MN, CD_ORGAO_FIN_INTER, CD_PRESENCA_CARGA, NR_SEQ_RETIFICACAO,                             CD_MOTIVO_RETIF, DT_RETIFICACAO, DT_EXON_IMPRESSO, IN_EXON_IMPRESSO, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_TOTAL_CAMBIO,                             CD_AUSENCIA_FABRIC, CD_FORNECEDOR, CD_FABRICANTE, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360,                             CD_PERIOD_PGTO_360, DI.IN_EMBUT_FRT_ITENS, DI.IN_EMBUT_SEG_ITENS, VL_TOTAL_ACRESCIMOS_MNEG, VL_TOTAL_DEDUCOES_MNEG, VL_TOTAL_FRETE_MNEG,                             NR_PROCESSO_SISCOMEX, IN_PGTO_VARIAV_360, CD_VEICULO_TRANSP, PC_REDUCAO_IPT_BLI, DT_DI, VL_TOTAL_TX_SCX, VL_TOT_PIS_COFINS , PV.CD_USUARIO, PV.DT_PREVISAO                            FROM #TMP_PROCESSO ATZ                             INNER JOIN TPROCESSO              PR  ON ( PR.NR_PROCESSO = ATZ.NR_PROCESSO )                             INNER JOIN TDECLARACAO_IMPORTACAO DI  ON ( DI.NR_PROCESSO = ATZ.NR_PROCESSO )      LEFT  JOIN TPREVISAO              PV  ON ( PV.NR_PROCESSO = ATZ.NR_PROCESSO )                              WHERE ATZ.NM_TABELA   = 'TDECLARACAO_IMPORTACAO'                             AND ISNULL( PR.IN_CANCELADO, '0' ) = '0'                             AND YEAR(PR.DT_ABERTURA) >= @data                             AND SUBSTRING(PR.NR_PROCESSO, 5, 2) NOT IN ('IW','EW')
SET  @registros = @registros + @@rowcount
END  TRY
  ```

#### `sp_atz_obs_followup`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_obs_followup` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TFOLLOWUP`, `TPROCESSO` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@NR_PROCESSO char(18)`, `@CD_EVENTO CHAR(3)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'WHERE NR_PROCESSO = @NR_PROCESSO     AND CD_EVENTO = '022'')
  ```sql
UPDATE  TPROCESSO
SET  TX_OBSERVACOES = @TX_OBS
-- WHERE NR_PROCESSO = @NR_PROCESSO
IF  @CD_EVENTO = '022'
  ```

- **CLEAR**: Updates records in `PR` based on process parameters or status transitions. (Developer note: 'WHERE NR_PROCESSO = @NR_PROCESSO     AND CD_EVENTO = '022'')
  ```sql
UPDATE  PR
SET  TX_OBSERVACOES = FUP.TX_OBS      FROM TPROCESSO PR (NOLOCK)         INNER JOIN TFOLLOWUP FUP (NOLOCK) ON FUP.NR_PROCESSO = PR.NR_PROCESSO      WHERE FUP.NR_PROCESSO = @NR_PROCESSO        AND FUP.CD_EVENTO = '022'
  ```

#### `sp_atz_recebimento`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_recebimento` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TCLIENTE_BANCO_LIBERADO`, `TEMPRESA_NAC`, `TNUMERARIO`, `TNUMERARIO_ITEM_SOLIC`, `TNUMERARIO_SALDO_POR_ITEM`, `TPROCESSO`, `TRECEBIMENTO`, `TRECEBIMENTO_ITEM_RECEB` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@nr_processo char(18)`, `@nr_recebimento char(3)` |
| **Calls** | `sp_atz_evento`, `sp_atz_pagto` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TNUMERARIO_ITEM_SOLIC` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_recebimento    Script Date: 02091999 08:58:')
  ```sql
UPDATE  TNUMERARIO_ITEM_SOLIC
SET     VL_RECEBIDO = ISNULL( VL_SOLICITADO, 0 ),         CD_STATUS   = 'B'  WHERE  NR_PROCESSO = @nr_processo AND TP_DESTINO IN ( '0', '1' )
-- Atualiza Itens do Numerario
UPDATE  TNUMERARIO_ITEM_SOLIC
  ```

- **CLEAR**: Updates records in `TNUMERARIO_ITEM_SOLIC` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_recebimento    Script Date: 02091999 08:58:')
  ```sql
UPDATE  TNUMERARIO_ITEM_SOLIC
SET     VL_RECEBIDO = ISNULL(           (
SELECT  SUM( CONVERT( numeric(14,2), ISNULL(R.VL_RECEBIDO, 0 ) ) -                    CONVERT( numeric(14,2), ISNULL(R.VL_DEVOLVIDO ,0 ) ) )             FROM   TRECEBIMENTO_ITEM_RECEB R             WHERE  R.NR_PROCESSO = S.NR_PROCESSO AND                    R.NR_SOLICITACAO = S.NR_SOLICITACAO AND                    R.CD_ITEM = S.CD_ITEM AND                    R.IN_CANCELADO = '0' ) , 0 )  FROM   TNUMERARIO_ITEM_SOLIC S  WHERE  NR_PROCESSO = @nr_processo AND TP_DESTINO IN ('2','3','4')
UPDATE  TNUMERARIO_ITEM_SOLIC
  ```

- **CLEAR**: Updates records in `TNUMERARIO_ITEM_SOLIC` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_recebimento    Script Date: 02091999 08:58:')
  ```sql
UPDATE  TNUMERARIO_ITEM_SOLIC
SET  CD_STATUS =     CASE       WHEN ( VL_RECEBIDO >= VL_SOLICITADO ) THEN 'B'
ELSE  'A'
END   WHERE NR_PROCESSO = @nr_processo AND        CD_STATUS IN ('A','B') AND TP_DESTINO IN ('2','3','4')
  ```

- **CLEAR**: Updates records in `TNUMERARIO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_recebimento    Script Date: 02091999 08:58:')
  ```sql
UPDATE  TNUMERARIO
SET     VL_RECEBIDO = ISNULL(         (
SELECT  SUM( CONVERT( numeric(14,2), VL_RECEBIDO ) )           FROM   TNUMERARIO_ITEM_SOLIC S           WHERE  S.NR_PROCESSO = N.NR_PROCESSO AND                  S.NR_SOLICITACAO = N.NR_SOLICITACAO AND          CD_STATUS IN ('A','B') AND TP_DESTINO IN ('2','3','4') ), 0 )  FROM   TNUMERARIO N  WHERE  NR_PROCESSO = @nr_processo
UPDATE  TNUMERARIO
  ```

#### `sp_atz_sda_pago`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_sda_pago` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TPROCESSO` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@cd_unid_neg char(2)`, `@cd_produto char(2)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_sda_pago    Script Date: 02091999 08:58:58 ')
  ```sql
UPDATE  TPROCESSO
SET  IN_SDA_PAGO = '0'  WHERE  CD_UNID_NEG = @cd_unid_neg AND         CD_PRODUTO  = @cd_produto  AND         CD_STATUS_SDA = '2'        AND         IN_PRODUCAO   = '1'        AND         IN_CANCELADO  = '0'        AND         IN_LIBERADO   = '1'
UPDATE  TPROCESSO
SET  IN_SDA_PAGO = '1'  WHERE  CD_UNID_NEG = @cd_unid_neg AND         CD_PRODUTO  = @cd_produto  AND         CD_STATUS_SDA = '2'        AND         IN_PRODUCAO   = '1'        AND         IN_CANCELADO  = '0'        AND         IN_LIBERADO   = '1'        AND         (         NR_PROCESSO IN (
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_atz_sda_pago    Script Date: 02091999 08:58:58 ')
  ```sql
UPDATE  TPROCESSO
SET  IN_SDA_PAGO = '1'  WHERE  CD_UNID_NEG = @cd_unid_neg AND         CD_PRODUTO  = @cd_produto  AND         CD_STATUS_SDA = '2'        AND         IN_PRODUCAO   = '1'        AND         IN_CANCELADO  = '0'        AND         IN_LIBERADO   = '1'        AND         (         NR_PROCESSO IN (
SELECT  P.NR_PROCESSO     FROM TPROCESSO P, TSOLIC_CHEQUE S, TSOLIC_CHEQUE_ITENS I, TPARAMETROS A     WHERE P.CD_UNID_NEG = @cd_unid_neg AND           P.CD_PRODUTO  = @cd_produto  AND           S.DT_SOLIC_CH = I.DT_SOLIC_CH AND           S.NR_SOLIC_CH = I.NR_SOLIC_CH AND           I.NR_PROCESSO = P.NR_PROCESSO AND           I.CD_ITEM     = A.CD_ITEM_SDA AND           S.CD_STATUS_SOLIC_CH IN ('1','3','4') AND           I.CD_STATUS IN ('0','4','6','8') ) OR         NR_PROCESSO IN (
SELECT  F.NR_PROCESSO                          FROM TPROCESSO P, TFATURAMENTO_CC F, TPARAMETROS A     WHERE  P.CD_UNID_NEG = @cd_unid_neg AND            P.CD_PRODUTO  = @cd_produto  AND                                 F.NR_PROCESSO = P.NR_PROCESSO AND                                 F.CD_ITEM = A.CD_ITEM_SDA AND                                 F.IN_CANCELADO = '0')         )
  ```

#### `sp_atz_tipo_icms`

| Field | Content |
| --- | --- |
| **Name** | `sp_atz_tipo_icms` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TDECLARACAO_IMPORTACAO`, `TEMPRESA_NAC`, `TPROCESSO`, `TUNID_NEG`, `TURF` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@NR_PROCESSO CHAR(18))` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  CD_TIPO_ICMS = @CD_TIPO_ICMS    WHERE NR_PROCESSO = @NR_PROCESSO        PRINT @CD_TIPO_ICMS
--COMMIT        --ROLLBACK TRAN
  ```

#### `sp_broker_reg`

| Field | Content |
| --- | --- |
| **Name** | `sp_broker_reg` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | None identified directly |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@nr_processo char(18)`, `@pr_entreposto_anterior char(14)`, `@pr_entreposto_novo char(14)`, `@cd_movimento char(1)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET     NR_PROCESSO_OR_ENTREPOSTO = ' '         WHERE  NR_PROCESSO = @pr_entreposto_anterior
END
UPDATE  TPROCESSO
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET     NR_PROCESSO_OR_ENTREPOSTO = @nr_processo    WHERE  NR_PROCESSO = @pr_entreposto_novo
  ```

#### `sp_calc_vmle_mn`

| Field | Content |
| --- | --- |
| **Name** | `sp_calc_vmle_mn` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TFOLLOWUP`, `TPARAMETROS`, `TPROCESSO`, `TRECEITAS_EXP`, `TS_FATURA`, `TTAXA_CAMBIO` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@NR_PROCESSO CHAR(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'PROCESSO NAO ENCONTRADO        RETURN(1)')
  ```sql
UPDATE  TPROCESSO
SET  VL_MLE_MN   = @VL_MLE_MN_CALC        FROM TPROCESSO A (NOLOCK)       WHERE NR_PROCESSO = @NR_PROCESSO
END
  ```

#### `sp_calcula_sda`

| Field | Content |
| --- | --- |
| **Name** | `sp_calcula_sda` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TCLIENTE_HABILITACAO`, `TCLIENTE_SERVICO`, `TDECLARACAO_IMPORTACAO`, `TEMPRESA_NAC`, `TFOLLOWUP`, `TPARAMETROS`, `TPROCESSO`, `TPROCESSO_SDA`, `TSDA` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@NR_PROCESSO CHAR(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPROCESSO_SDA` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO_SDA
SET  CD_STATUS = 4 WHERE  ( NR_PROCESSO   = @NR_PROCESSO )
ELSE */
BEGIN
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET     VL_MLE_MN             = ROUND( @VL_MLE_MN,2),                       VL_FRETE_MN           = ROUND( @VL_FRETE_MN,2),                     VL_SEGURO_MN          = ROUND( @VL_SEGURO_MN,2),                   VL_MLE_MNEG           = ROUND( @VL_MLE_MNEG,2),                       VL_FRETE_PREPAID_MNEG = ROUND( @VL_FRETE_PREPAID,2),                       VL_FRETE_COLLECT_MNEG = ROUND( @VL_FRETE_COLLECT,2),                       VL_SEGURO_MNEG        = ROUND( @VL_SEGURO_MNEG, 2)              FROM TPROCESSO (NOLOCK)                 WHERE  ( NR_PROCESSO = @NR_PROCESSO )
END
END
  ```

- **CLEAR**: Updates records in `TPROCESSO_SDA` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO_SDA
SET     VL_BASE_CALCULO = ROUND( @VL_BASE_CALC, 2 ),               VL_SDA          = ROUND( @VL_SDA, 2 ),               VL_CONTR_ASSIST = ROUND( @VL_CONTR_ASSIST, 2 ),               VL_COMPL        = ROUND( @VL_TX_CONTR_SOCIAL_SDA, 2 )         FROM TPROCESSO_SDA (NOLOCK)      WHERE  ( NR_PROCESSO   = @NR_PROCESSO )
END             /*
SELECT  @NR_PROCESSO, VL_MLE_MN, VL_FRETE_MN, VL_SEGURO_MN, VL_MLE_MNEG, VL_FRETE_PREPAID_MNEG, VL_FRETE_COLLECT_MNEG,                 VL_SEGURO_MNEG          FROM   TPROCESSO (NOLOCK)          WHERE  NR_PROCESSO = @NR_PROCESSO
  ```

#### `sp_calculo_sda_ag`

| Field | Content |
| --- | --- |
| **Name** | `sp_calculo_sda_ag` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TCLIENTE_HABILITACAO`, `TPARAMETROS`, `TPROCESSO`, `TPROCESSO_DESPESAS`, `TSDA`, `TTAXA_FRETE`, `TTAXA_IATA`, `VW_SERVICO_GERAL` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@nr_processo char(18)`, `@dt_embarque datetime)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'PARAMETROS')
  ```sql
UPDATE  TPROCESSO
SET     BASE_CALCULO_SDA =  @vl_mle_mn,         VL_SDA           =  @vl_sda,         VL_CONTR_ASSIST  =  @vl_contr_assist,          VL_COMPL_SDA     =  @vl_tx_contr_social_sda,          VL_MLE_MN        =  @vl_mle_mn  WHERE  ( NR_PROCESSO = @nr_processo )
DECLARE  @vl_tot_sda DECIMAL(14,2)
SET  @vl_tot_sda = ISNULL(@vl_sda, 0) + ISNULL(@vl_contr_assist, 0) + ISNULL(@vl_tx_contr_social_sda, 0 )
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TPROCESSO_DESPESAS`. (Developer note: 'PARAMETROS')
  ```sql
INSERT  INTO TPROCESSO_DESPESAS   (NR_PROCESSO, CD_DESP, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA, VL_BASE_DESPESA, VL_COMPRA_AG, VL_COMPRA_CIA, VL_VENDA, IN_DESPESA, IN_MENCIONADO,     CD_TAB_REF, TP_FRETE, TP_ESTUFAGEM, IN_REPASSA, VL_BASE_AG, VL_BASE_CLI, IN_PROFIT, VL_VENDA_EST, VL_CUSTO_EST, CD_MOEDA_VENDA, NR_NOTIFICACAO, IN_SOLICITADO)  VALUES(@nr_processo, @cd_desp, @cd_item_sda, '03', '790', '8', 0, @vl_tot_sda, 0, @vl_tot_sda, '4', '0',    NULL, '2', NULL, '6', @vl_tot_sda, @vl_tot_sda, '0', 0, 0 , '790', '0', '0')
END
ELSE
BEGIN
  ```

- **CLEAR**: Updates records in `TPROCESSO_DESPESAS` based on process parameters or status transitions. (Developer note: 'PARAMETROS')
  ```sql
UPDATE  TPROCESSO_DESPESAS
SET  VL_COMPRA_AG   = @vl_tot_sda,         VL_VENDA       = @vl_tot_sda,         VL_BASE_CLI    = @vl_tot_sda,         VL_BASE_AG     = @vl_tot_sda   WHERE NR_PROCESSO   = @nr_processo     AND CD_ITEM       = @cd_item_sda     AND IN_SOLICITADO = '0'
END
  ```

#### `sp_cancela_distr_sda`

| Field | Content |
| --- | --- |
| **Name** | `sp_cancela_distr_sda` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TPROCESSO` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@cd_unidade char(2)`, `@cd_produto char(2)`, `@cd_usuario char(4)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TUNID_PROD_DESPACH` based on process parameters or status transitions. (Developer note: 'AND        CD_EMISSOR_SDA = @cd_usuario')
  ```sql
UPDATE  TUNID_PROD_DESPACH
SET     VL_SDA_MES = ROUND( (ISNULL( VL_SDA_MES, 0) - ISNULL(@vl_sda, 0 )), 2 )      WHERE  ( CD_UNID_NEG    = @cd_unidade ) AND              ( CD_PRODUTO     = @cd_produto ) AND              ( CD_DESPACHANTE = @cd_despachante_sda )
UPDATE  TPROCESSO
SET     CD_DESPACHANTE_SDA = NULL,             DT_DISTRIBUICAO    = NULL,             BASE_CALCULO_SDA   = 0,             VL_SDA             = 0,             VL_CONTR_ASSIST    = 0,             VL_COMPL_SDA       = 0,             CD_STATUS_SDA      = '0'      WHERE CURRENT OF c_processo
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'AND        CD_EMISSOR_SDA = @cd_usuario')
  ```sql
UPDATE  TPROCESSO
SET     CD_DESPACHANTE_SDA = NULL,             DT_DISTRIBUICAO    = NULL,             BASE_CALCULO_SDA   = 0,             VL_SDA             = 0,             VL_CONTR_ASSIST    = 0,             VL_COMPL_SDA       = 0,             CD_STATUS_SDA      = '0'      WHERE CURRENT OF c_processo
END
FETCH  c_processo INTO @nr_processo, @cd_despachante_sda, @dt_distribuicao, @base_calculo_sda, @vl_sda, @vl_contr_assist, @vl_compl_sda
  ```

#### `sp_da_gera_di`

| Field | Content |
| --- | --- |
| **Name** | `sp_da_gera_di` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TDA`, `TDA_LOTE`, `TDA_REF`, `TDECLARACAO_IMPORTACAO`, `TDETALHE_MERCADORIA`, `TMERCADORIA` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Atualizando Campo...      UPDATETEXT TDETALHE_MERCADORIA.TX_DESC_DET_MERC @ptr_d')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET     VL_TOT_MLE_MNEG     = CASE DA.IN_EMBUT_FRT_ITENS                                   WHEN '0' THEN DA.VL_MLE_MNEG                                    WHEN '1' THEN DA.VL_MLE_MNEG + DA.VL_FRETE_MNEG
END ,           VL_TOTAL_MLE_MN     = CASE DA.IN_EMBUT_FRT_ITENS                                   WHEN '0' THEN ROUND( DA.VL_MLE_MNEG * DA.TX_MLE, 2 )                                    WHEN '1' THEN ROUND( DA.VL_MLE_MNEG * DA.TX_MLE, 2 ) +               ROUND( DA.VL_FRETE_MNEG * DA.TX_FRETE, 2 )
END ,           VL_TOT_FRT_COLLECT  = CASE DA.TP_FRETE WHEN '0' THEN DA.VL_FRETE_MNEG
  ```

- **CLEAR**: Removes outdated or cancelled records from `TADICAO_DE_IMPORTACAO`. (Developer note: 'Atualizando Campo...      UPDATETEXT TDETALHE_MERCADORIA.TX_DESC_DET_MERC @ptr_d')
  ```sql
DELETE  TADICAO_DE_IMPORTACAO    WHERE  NR_PROCESSO = @nr_processo
DELETE  TDETALHE_MERCADORIA    WHERE  NR_PROCESSO = @nr_processo
DECLARE  c_da CURSOR FOR
SELECT  R.NR_PROCESSO, R.CD_MERCADORIA, R.CD_UNID_MEDIDA, SUM( ISNULL( R.QT_REF, 0 ) ), ROUND( SUM( ISNULL( R.PL_REF, 0 ) ), 5 ),              ROUND( SUM( ISNULL( R.VL_MLE_MNEG, 0 ) ), 2 ), ISNULL( R.VL_UNITARIO, 0 ), ROUND( SUM( ISNULL( R.VL_MLD_MNEG, 0 ) ), 2 ),             R.CD_MOEDA_MLE, M.CD_NCM_SH      FROM   TDA_REF R, TMERCADORIA M (NOLOCK)      WHERE  NR_PROCESSO = @nr_processo AND             R.CD_MERCADORIA = M.CD_MERCADORIA      GROUP BY R.NR_PROCESSO, R.CD_MERCADORIA, R.CD_UNID_MEDIDA, ISNULL( R.VL_UNITARIO, 0 ), R.CD_MOEDA_MLE, M.CD_NCM_SH
  ```

- **CLEAR**: Removes outdated or cancelled records from `TDETALHE_MERCADORIA`. (Developer note: 'Atualizando Campo...      UPDATETEXT TDETALHE_MERCADORIA.TX_DESC_DET_MERC @ptr_d')
  ```sql
DELETE  TDETALHE_MERCADORIA    WHERE  NR_PROCESSO = @nr_processo
DECLARE  c_da CURSOR FOR
SELECT  R.NR_PROCESSO, R.CD_MERCADORIA, R.CD_UNID_MEDIDA, SUM( ISNULL( R.QT_REF, 0 ) ), ROUND( SUM( ISNULL( R.PL_REF, 0 ) ), 5 ),              ROUND( SUM( ISNULL( R.VL_MLE_MNEG, 0 ) ), 2 ), ISNULL( R.VL_UNITARIO, 0 ), ROUND( SUM( ISNULL( R.VL_MLD_MNEG, 0 ) ), 2 ),             R.CD_MOEDA_MLE, M.CD_NCM_SH      FROM   TDA_REF R, TMERCADORIA M (NOLOCK)      WHERE  NR_PROCESSO = @nr_processo AND             R.CD_MERCADORIA = M.CD_MERCADORIA      GROUP BY R.NR_PROCESSO, R.CD_MERCADORIA, R.CD_UNID_MEDIDA, ISNULL( R.VL_UNITARIO, 0 ), R.CD_MOEDA_MLE, M.CD_NCM_SH
OPEN  c_da
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TDETALHE_MERCADORIA(`. (Developer note: 'Atualizando Campo...      UPDATETEXT TDETALHE_MERCADORIA.TX_DESC_DET_MERC @ptr_d')
  ```sql
INSERT  TDETALHE_MERCADORIA( NR_PROCESSO, NR_ADICAO, NR_ITEM, CD_MERCADORIA, CD_UN_MED_COMERC, CD_TIPO_CALCULO_ITEM,                                  CD_FABR_EXPO, QT_MERC_UN_COMERC, QT_MERC_UN_ESTAT, PL_MERCADORIA, TX_DESC_DET_MERC,                                   VL_MLE_ITEM, VL_UNITARIO, VL_MCV_ITEM, CD_NCM_SH )      VALUES( @nr_processo, '001', '***', @cd_mercadoria, @cd_unid_medida, '1', '1', @qt_item, @pl_ref,               @pl_ref, '', @vl_mle_mneg, @vl_unitario, @vl_mld_mneg, @cd_ncm_sh )
EXEC  @erro = sp_di_classifica_item @nr_processo, @nr_adicao OUTPUT, @nr_item OUTPUT
UPDATE  TADICAO_DE_IMPORTACAO
SET     CD_MOEDA_NEGOCIADA = @cd_moeda_mle,             CD_MOEDA_MLE = @cd_moeda_mle      WHERE  NR_PROCESSO = @nr_processo AND             NR_ADICAO = @nr_adicao
  ```

#### `sp_di_adicao_com_li`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_adicao_com_li` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `DESTAQUE_NCM`, `DETALHE_MERC_COM_TRATAMENTO`, `OPERA`, `OPERACAO_COM_TRATAMENTO`, `TADICAO_DE_IMPORTACAO`, `TDECLARACAO_IMPORTACAO`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TEMPRESA_EST`, `TLICENCA_IMPORTACAO`, `TLICENCA_ITENS`, `TPROCESSO_LI`, `TUNID_MEDIDA_BROKER` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@CD_UNID_NEG CHAR(2)`, `@CD_PROD CHAR(2)`, `@NR_PROCESSO CHAR(20)`, `@NR_LI CHAR(10)`, `@DT_REGISTRO DATETIME` |
| **Calls** | `SP_DI_CALCULO`, `SP_DI_REPASSA_DADOS_ADICAO` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET     IN_REPASSA_DADOS_ADICAO = 0        WHERE  NR_PROCESSO = @NR_PROCESSO
END
DELETE  TDETALHE_MERCADORIA      WHERE  NR_PROCESSO = @NR_PROCESSO AND             NR_ITEM = '***'
  ```

- **CLEAR**: Removes outdated or cancelled records from `TDETALHE_MERCADORIA`.
  ```sql
DELETE  TDETALHE_MERCADORIA      WHERE  NR_PROCESSO = @NR_PROCESSO AND             NR_ITEM = '***'
SELECT  @NACOXAMBRO = 0
SELECT  @DBL_TOTAL_QUANT = 0
SELECT  @NSOMA_MCV       = 0
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TEMPRESA_EST(`.
  ```sql
INSERT  TEMPRESA_EST( CD_EMPRESA,    NM_EMPRESA,    AP_EMPRESA,    END_EMPRESA,   END_NUMERO,   END_COMPL,  END_CIDADE,                               END_ESTADO,    CD_PAIS,       DT_INCLUSAO,   IN_ATIVO,      IN_AGENTE,    IN_BANCO,   IN_IMPORTADOR,                                IN_SEGURADORA, IN_EXPORTADOR )
SELECT  @CD_ULT_EMP_EST, O.NM_FORN_ESTR, SUBSTRING( O.NM_FORN_ESTR, 1, 10 ), O.ED_LOGR_FORN_ESTR, O.ED_NR_FORN_ESTR,                 O.ED_COMPL_FORN_ESTR, O.ED_CIDAD_FORN_ESTR, O.ED_ESTAD_FORN_ESTR, O.CD_PAIS_AQUIS_MERC,                  CONVERT( DATETIME, CONVERT( VARCHAR(10), GETDATE(), 103 ), 103 ), '1', 0, 0, 0, 0, 1          FROM   OPERAÇÃO_COM_TRATAMENTO O (NOLOCK)         WHERE  NR_OPER_TRAT_PREV = @NR_LI
END
--FABRICANTE
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TEMPRESA_EST(`.
  ```sql
INSERT  TEMPRESA_EST( CD_EMPRESA,    NM_EMPRESA,    AP_EMPRESA,    END_EMPRESA,   END_NUMERO,   END_COMPL,  END_CIDADE,                               END_ESTADO,    CD_PAIS,       DT_INCLUSAO,   IN_ATIVO,      IN_AGENTE,    IN_BANCO,   IN_IMPORTADOR,                                IN_SEGURADORA, IN_EXPORTADOR )
SELECT  @CD_ULT_EMP_EST, O.NM_FABRICANTE_MERC, SUBSTRING( O.NM_FABRICANTE_MERC, 1, 10 ), O.ED_LOGR_FABRIC, O.ED_NR_FABRIC,                 O.ED_COMPL_FABRIC, O.ED_CIDAD_FABRIC, O.ED_ESTADO_FABRIC,                  CASE O.CD_AUSENCIA_FABRIC WHEN '1' THEN ''
ELSE  O.CD_PAIS_ORIG_MERC
END ,                 CONVERT( DATETIME, CONVERT( VARCHAR(10), GETDATE(), 103 ), 103 ), '1', 0, 0, 0, 0, 1          FROM   OPERAÇÃO_COM_TRATAMENTO O          WHERE  NR_OPER_TRAT_PREV = @NR_LI
  ```

#### `sp_di_atz_tipo_di`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_atz_tipo_di` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TDECLARACAO_IMPORTACAO` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)`, `@cd_tipo_di tinyint` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_atz_tipo_di    Script Date: 02091999 08:58:1')
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET      CD_URF_ENTR_MERC = '',     CD_PAIS_PROC_MERC = '',     CD_MD_FRETE_MERC = '',     CD_MOEDA_SEG_MERC = '',     VL_FRETE_MERC_MN = 0,     VL_FRETE_MERC_MNEG = 0,     VL_SEG_MERC_MN = 0,     VL_SEG_MERC_MNEG = 0,     IN_MULTIMODAL = 0     WHERE NR_PROCESSO = @nr_processo
END
IF  ( @cd_tipo_di in (13, 14, 15, 16, 17, 18, 19, 20, 21) )
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_atz_tipo_di    Script Date: 02091999 08:58:1')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET   CD_TIPO_IMPORTADOR = @cd_tipo_importador,   CD_VIA_TRANSP_CARG = @cd_via_transp_carg,       NR_CONSIGNATARIO  = @nr_consignatario,   CD_TIPO_CONSIG  = @cd_tipo_consig,   CD_MODALIDADE_DESP = @cd_modalidade_desp,   IN_OPERACAO_FUNDAP = @in_operacao_fundap,   CD_PAIS_PROC_CARGA = @cd_pais_proc_carga,   CD_URF_ENTR_CARGA = @cd_urf_entr_carga,   CD_MOEDA_MLE  = @cd_moeda_mle,   CD_MOEDA_FRETE  = @cd_moeda_frete,   CD_MOEDA_SEGURO  = @cd_moeda_seguro,   CD_TIPO_BASE_SEGURO = @cd_tipo_base_seguro,   VL_TOTAL_MLE_MN  = @vl_total_mle_mn,   VL_TOT_MLE_MNEG  = @vl_tot_mle_mneg,   VL_TOT_DESPS_MN  = @vl_tot_desps_mn,   VL_TOT_DESPS_MNEG = @vl_tot_desps_mneg,   VL_TOT_FRT_PREPAID = @vl_tot_frt_prepaid,   VL_TOT_FRT_COLLECT = @vl_tot_frt_collect,   VL_FRETE_TNAC_MNEG = @vl_frete_tnac_mneg,   VL_TOTAL_FRETE_MN = @vl_total_frete_mn,   VL_TOTAL_SEG_MN  = @vl_tot_seguro_mneg,   PC_SEGURO_MLE  = @pc_seguro_mle,   IN_MOEDA_UNICA  = @in_moeda_unica,   IN_REB   = @in_reb,   IN_RATEAR_FRETE_ITENS = @in_ratear_frete_itens,   IN_RATEAR_SEGURO_ITENS = @in_ratear_seguro_itens,      DT_CHEGADA_CARGA = @dt_chegada_carga,   NR_AGENTE_CARGA  = @nr_agente_carga  WHERE  NR_PROCESSO   = @nr_processo
-- Documento Vinculado
IF  ( @cd_tipo_di IN (2, 5, 7, 16, 17, 18, 19, 20, 21) )
  ```

- **CLEAR**: Removes outdated or cancelled records from `TDOCUMENTO_VINCULADO`. (Developer note: 'Object:  Stored Procedure dbo.sp_di_atz_tipo_di    Script Date: 02091999 08:58:1')
  ```sql
DELETE  TDOCUMENTO_VINCULADO     WHERE NR_PROCESSO = @nr_processo
END
-- Tipo 19
IF  @cd_tipo_di = 19
  ```

- **CLEAR**: Removes outdated or cancelled records from `TATO_VINCULADO`. (Developer note: 'Object:  Stored Procedure dbo.sp_di_atz_tipo_di    Script Date: 02091999 08:58:1')
  ```sql
DELETE  TATO_VINCULADO     WHERE NR_PROCESSO = @nr_processo AND           CD_ASSUNTO_VINCUL IN ('3', '4', '5')
DELETE  TRIBUTO     WHERE NR_PROCESSO = @nr_processo AND           CD_RECEITA_IMPOSTO IN ('0002', '0003')
DELETE  TACRESCIMO_VALORACAO     WHERE NR_PROCESSO = @nr_processo
DELETE  TDEDUCAO_VALORACAO     WHERE NR_PROCESSO = @nr_processo
  ```

#### `sp_di_atz_via_transp`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_atz_via_transp` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TDECLARACAO_IMPORTACAO` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)`, `@cd_via_transp tinyint` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_atz_via_transp    Script Date: 02091999 08:5')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET   CD_TIPO_DCTO_CARGA  = '',    NR_DCTO_CARGA_MAST  = '',   IN_MULTIMODAL  = @in_multimodal,   CD_TRANSPORTADOR  = @cd_transportador,   CD_BANDEIRA_TRANSP = @cd_bandeira_transp,    NM_VEICULO_TRANSP = @nm_veiculo_transp,   CD_TIPO_MANIFESTO = @cd_tipo_manifesto,    NR_MANIFESTO  = @nr_manifesto,   CD_UTIL_DCTO_CARGA = @cd_util_dcto_carga,    NR_DCTO_CARGA  = @nr_dcto_carga,   NR_VEICULO_TRANSP = @nr_veiculo_transp,   IN_REB   = @in_reb  WHERE  NR_PROCESSO = @nr_processo
  ```

#### `sp_di_calculo`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_calculo` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `MYINDAIAV2`, `TACRESCIMO_VALORACAO`, `TADICAO_DE_IMPORTACAO`, `TDECLARACAO_IMPORTACAO`, `TDEDUCAO_VALORACAO`, `TDETALHE_MERCADORIA`, `TEMPRESA_NAC`, `TGRUPO_DESPESAS_BASE_ICMS`, `TPAGAMENTO_TRIBUTOS`, `TPARAMETROS`, `TPROCESSO`, `TTAXA_CAMBIO` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@NR_PROCESSO char(18))` |
| **Calls** | `SP_GRAVA_LOG_CALCULO_DI`, `SP_RATEIO_ACRESCIMOS_DEDUCOES`, `SP_DI_ATZ_TAXA_CAMBIO`, `SP_CALCULO_SEGURO`, `SP_CALC_TAXA_SISCOMEX` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Executes dependent procedure `SP_GRAVA_LOG_CALCULO_DI` to propagate workflow updates. (Developer note: 'CREATE PROCEDURE [DBO].[SP_DI_CALCULO_TESTE](@NR_PROCESSO CHAR(18)) AS')
  ```sql
EXEC  SP_GRAVA_LOG_CALCULO_DI @NR_PROCESSO,                                   'I'
--/*
UPDATE  AI
SET  PL_MERCADORIA = (
  ```

- **CLEAR**: Updates records in `AI` based on process parameters or status transitions. (Developer note: 'CREATE PROCEDURE [DBO].[SP_DI_CALCULO_TESTE](@NR_PROCESSO CHAR(18)) AS')
  ```sql
UPDATE  AI
SET  PL_MERCADORIA = (
SELECT         SUM(CAST(ROUND(ISNULL(DM.PL_MERCADORIA, 0), 7) AS decimal(28, 7)))      FROM TDETALHE_MERCADORIA DM (NOLOCK)      WHERE DM.NR_PROCESSO = AI.NR_PROCESSO      AND DM.NR_ADICAO = AI.NR_ADICAO)      FROM TADICAO_DE_IMPORTACAO AI (NOLOCK)      WHERE AI.NR_PROCESSO = @NR_PROCESSO
--*/               -- INCLUÍDO PARA EFETUAR O RATEIO DOS ACRÉSCIMOS E DEDUÇÕES ANTES DO CÁLCULO - MICHEL - 01/09/2010
  ```

- **CLEAR**: Executes dependent procedure `SP_RATEIO_ACRESCIMOS_DEDUCOES` to propagate workflow updates. (Developer note: 'CREATE PROCEDURE [DBO].[SP_DI_CALCULO_TESTE](@NR_PROCESSO CHAR(18)) AS')
  ```sql
EXEC  SP_RATEIO_ACRESCIMOS_DEDUCOES @NR_PROCESSO
SELECT         @VL_TX_UTILIZACAO_AFRMM = VL_TX_UTILIZACAO_AFRMM,        @CD_ITEM_AFRMM = CD_ITEM_AFRMM,        @PC_FUNDO_POBREZA = PC_FUNDO_POBREZA_RJ      FROM TPARAMETROS(NOLOCK)
SELECT  TOP 1 @CD_ITEM = AKEY      FROM (
SELECT         I.AKEY      FROM MYINDAIAV2.DBO.PAYMENTREQUESTED PR (NOLOCK)      INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PRIPR (NOLOCK) ON PRIPR.PAYMENTREQUESTED_ID = PR.ID      INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED IPR (NOLOCK) ON IPR.ID = PRIPR.ITEMS_ID      INNER JOIN MYINDAIAV2.DBO.ITEM I (NOLOCK) ON I.ID = IPR.ITEM_ID      INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.ID = PR.CUSTOMCLEARANCE_ID      WHERE CC.CUSTOMID = @NR_PROCESSO      AND I.AKEY IN ('160', '028', '618')      AND PR.STATUS = 'APPROVED'          UNION ALL
  ```

- **CLEAR**: Removes outdated or cancelled records from `TDETALHE_MERCADORIA`. (Developer note: 'CREATE PROCEDURE [DBO].[SP_DI_CALCULO_TESTE](@NR_PROCESSO CHAR(18)) AS')
  ```sql
DELETE  TDETALHE_MERCADORIA      WHERE NR_PROCESSO = @NR_PROCESSO        AND NR_ITEM = '***'
--  TRAZ OS VALORES DA CAPA DA DI PARA VARIAVEIS DE TRABALHO
SELECT         @NR_DECLARACAO_IMP     = NR_DECLARACAO_IMP,        @IN_RATEAR_FRETE       = ISNULL(IN_RATEAR_FRETE_ITENS, 0),        @IN_RATEAR_SEGURO      = ISNULL(IN_RATEAR_SEGURO_ITENS, 0),        @VL_FRETE_TOT_MN1      = ISNULL(VL_TOTAL_FRETE_MN, 0),        @VL_FRETE_PREPAID_MNEG = ISNULL(VL_TOT_FRT_PREPAID, 0),        @VL_FRETE_COLLECT_MNEG = ISNULL(VL_TOT_FRT_COLLECT, 0),        @VL_FRETE_TER_NAC_MNEG = ISNULL(VL_FRETE_TNAC_MNEG, 0),        @VL_SEGURO_TOT_MN1     = ISNULL(VL_TOTAL_SEG_MN, 0),        @VL_SEGURO_TOT_MNEG    = ISNULL(VL_TOT_SEGURO_MNEG, 0),        @VL_MLE_TOT_MN1        = ISNULL(VL_TOTAL_MLE_MN, 0),        @VL_MLE_TOT_MNEG       = ISNULL(VL_TOT_MLE_MNEG, 0),        @VL_DESPESA_TOT_MN1    = ISNULL(VL_TOT_DESPS_MN, 0),        @VL_DESPESA_TOT_MNEG   = ISNULL(VL_TOT_DESPS_MNEG, 0),        @PL_MERC_TOTAL         = ISNULL(PL_CARGA, 0),        @IN_MOEDA_UNICA        = ISNULL(IN_MOEDA_UNICA, 0),        @IN_EMBUT_FRT_ITENS    = ISNULL(IN_EMBUT_FRT_ITENS, 0),        @IN_EMBUT_SEG_ITENS    = ISNULL(IN_EMBUT_SEG_ITENS, 0),        @CD_MOEDA_MLE          = ISNULL(CD_MOEDA_MLE, ''),        @CD_MOEDA_FRETE        = ISNULL(CD_MOEDA_FRETE, ''),        @CD_MOEDA_SEGURO       = ISNULL(CD_MOEDA_SEGURO, ''),        @IN_REB                = IN_REB,        @CD_TIPO_BASE_SEGURO   = ISNULL(CD_TIPO_BASE_SEGURO, '1'),        @PC_ICMS               = ISNULL(PC_ICMS, 0),        @PC_REDUCAO_ICMS       = ISNULL(PC_REDUCAO_ICMS, 0),        @QT_ADICOES            = ISNULL(QT_ADICOES, 0),        @NR_CONTA_PGTO_TRIB    = ISNULL(NR_CONTA_PGTO_TRIB, ''),        @DT_CALCULO            = ISNULL(DT_CALCULO, CONVERT(datetime, CONVERT(varchar, GETDATE(), 103), 103)),        @PC_SEGURO_MLE         = ISNULL(PC_SEGURO_MLE, 0),        @IN_FMA                = ISNULL(IN_FMA, '0')      FROM TDECLARACAO_IMPORTACAO(NOLOCK)
--(PAGLOCK HOLDLOCK)        WHERE NR_PROCESSO = @NR_PROCESSO
  ```

#### `sp_di_calculo2`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_calculo2` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TACRESCIMO_VALORACAO`, `TADICAO_DE_IMPORTACAO`, `TCONVERSAO_CAMBIO`, `TDECLARACAO_IMPORTACAO`, `TDEDUCAO_VALORACAO`, `TDETALHE_MERCADORIA`, `TPAGAMENTO_VINCULADO`, `TRIBUTO` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `TDETALHE_MERCADORIA`. (Developer note: 'Object:  Stored Procedure dbo.sp_di_calculo2    Script Date: 02091999 08:58:11 A')
  ```sql
DELETE  TDETALHE_MERCADORIA WHERE NR_PROCESSO = @nr_processo AND NR_ITEM = '***'
--  Traz os valores da capa da DI para variaveis de trabalho
SELECT  @nr_declaracao_imp = NR_DECLARACAO_IMP,    @in_ratear_frete = ISNULL( IN_RATEAR_FRETE_ITENS, 0 ),   @in_ratear_seguro = ISNULL( IN_RATEAR_SEGURO_ITENS, 0 ),   @vl_frete_tot_mn1 = ISNULL( VL_TOTAL_FRETE_MN, 0 ),   @vl_frete_prepaid_mneg = ISNULL( VL_TOT_FRT_PREPAID, 0 ),   @vl_frete_collect_mneg = ISNULL( VL_TOT_FRT_COLLECT, 0 ),   @vl_frete_ter_nac_mneg = ISNULL( VL_FRETE_TNAC_MNEG, 0 ),   @vl_seguro_tot_mn1 = ISNULL( VL_TOTAL_SEG_MN, 0 ),   @vl_seguro_tot_mneg = ISNULL( VL_TOT_SEGURO_MNEG, 0 ),   @vl_mle_tot_mn1  = ISNULL( VL_TOTAL_MLE_MN, 0 ),   @vl_mle_tot_mneg = ISNULL( VL_TOT_MLE_MNEG, 0 ),   @vl_despesa_tot_mn1 = ISNULL( VL_TOT_DESPS_MN, 0 ),   @vl_despesa_tot_mneg = ISNULL( VL_TOT_DESPS_MNEG, 0 ),   @pl_merc_total  = ISNULL( PL_CARGA, 0 ),   @in_moeda_unica  = ISNULL( IN_MOEDA_UNICA, 0 ),   @cd_moeda_mle  = CD_MOEDA_MLE,   @cd_moeda_frete  = CD_MOEDA_FRETE,   @cd_moeda_seguro = CD_MOEDA_SEGURO,   @in_REB   = IN_REB,   @cd_tipo_base_seguro = CD_TIPO_BASE_SEGURO,   @pc_icms  = ISNULL( PC_ICMS, 0 ),   @pc_reducao_icms = ISNULL( PC_REDUCAO_ICMS, 0 ),   @qt_adicoes  = ISNULL( QT_ADICOES, 0 )     FROM TDECLARACAO_IMPORTACAO WHERE (NR_PROCESSO = @nr_processo)
SELECT  @sum_vl_mle = SUM(ISNULL(VL_MLE_ITEM,0))  FROM TDETALHE_MERCADORIA  WHERE NR_PROCESSO = @nr_processo
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_calculo2    Script Date: 02091999 08:58:11 A')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  TX_MLE  = Round(@vl_tx_mneg, 7),           TX_FRETE = Round(@vl_tx_frete, 7),           TX_SEGURO = Round(@vl_tx_seguro, 7),           TX_DOLAR = Round(@vl_tx_dolar, 7) WHERE (nr_processo = @nr_processo)
IF  @in_moeda_unica <> 0
BEGIN
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_calculo2    Script Date: 02091999 08:58:11 A')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  VL_TOTAL_MLE_MN = @vl_mle_tot_mn where (nr_processo = @nr_processo)
IF  @vl_despesa_tot_mn <> @vl_despesa_tot_mn1
UPDATE  TDECLARACAO_IMPORTACAO
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_calculo2    Script Date: 02091999 08:58:11 A')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  VL_TOT_DESPS_MN = @vl_despesa_tot_mn where (nr_processo = @nr_processo)
END
IF  @vl_frete_tot_mn <> @vl_frete_tot_mn1
  ```

#### `sp_di_classifica_item`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_classifica_item` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TDECLARACAO_IMPORTACAO`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TDI_NVE`, `TEMPRESA_EST`, `TNCM`, `TPROCESSO`, `TRIBUTO` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@NR_PROCESSO CHAR(18)`, `@NR_ADICAO CHAR(3)`, `@NR_ITEM CHAR(3)` |
| **Calls** | `SP_DI_REPASSA_DADOS_ADICAO`, `SP_DI_REPASSA_DADOS_CAMBIO` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Executes dependent procedure `@RETURN` to propagate workflow updates.
  ```sql
EXEC  @RETURN = SP_DI_CLASSIFICA_ITEM_2  @NR_PROCESSO, @NR_ADICAO OUTPUT, @NR_ITEM OUTPUT      RETURN @RETURN
END
--*/
DECLARE  @MAX_ITENS_ADICAO        INT
  ```

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET     QT_ITENS_ADICAO = @I_ITEM              WHERE  ( NR_PROCESSO = @NR_PROCESSO ) AND ( NR_ADICAO = @S_ADICAO )
END
ELSE
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TADICAO_DE_IMPORTACAO`.
  ```sql
INSERT  INTO TADICAO_DE_IMPORTACAO              ( NR_PROCESSO,             NR_ADICAO,               CD_MERCADORIA_NCM,       CD_MERC_NBM_SH,                  CD_NCM_SH,               CD_MERC_NALADI_SH,       CD_MERC_NALADI_NCC,      CD_AUSENCIA_FABRIC,                     CD_FORNECEDOR,           CD_FABRICANTE,      CD_PAIS_ORIG_MERC,       CD_PAIS_AQUIS_MERC,              NM_FORN_ESTR,            ED_LOGR_FORN_ESTR,       ED_NR_FORN_ESTR,         ED_COMPL_FORN_ESTR,                     ED_CIDAD_FORN_ESTR,      ED_ESTAD_FORN_ESTR,      NM_FABRICANTE_MERC,      ED_LOGR_FABRIC,                         ED_NR_FABRIC,            ED_COMPL_FABRIC,         ED_CIDAD_FABRIC,         ED_ESTADO_FABRIC,                QT_ITENS_ADICAO,         CD_LOC_COND_VENDA,       CD_MOEDA_NEGOCIADA,      NR_OPER_TRAT_PREV,               NR_DESTAQUE_NCM, ALIQ_IBS_UF, ALIQ_CBS )        VALUES             ( @NR_PROCESSO,            @S_ADICAO,               @CD_NCM_SH,              @CD_NCM_C8,                      @CD_NCM_C8,              @CD_NALADI_SH,           @CD_NALADI_NCCA,         @CD_FABR_EXPO,                   @CD_EXPORTADOR,          @CD_FABRICANTE,          @CD_PAIS_ORIGEM,         @CD_PAIS_AQUISICAO,              @NM_EMPRESA1,            @END_EMPRESA1,           @END_NUMERO1,            @END_COMPL1,                     @END_CIDADE1,            @END_ESTADO1,            @NM_EMPRESA2,            @END_EMPRESA2,                   @END_NUMERO2,            @END_COMPL2,             @END_CIDADE2,            @END_ESTADO2,                    1,                       @CD_LOCAL_EMBARQUE,      @CD_MOEDA_NEGOCIADA,     @NR_OPER_TRAT_PREV,               @NR_DESTAQUE_NCM, @ALIQ_IBS_UF, @ALIQ_CBS )
IF  @IN_REPASSA_DADOS_ADICAO = 1 AND LTRIM( RTRIM( @CD_EXPORTADOR_CAPA ) ) <> ''
BEGIN
SELECT  @CD_FABR_EXPO = @CD_FABR_EXPO
  ```

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET     CD_AUSENCIA_FABRIC = @CD_FABR_EXPO          FROM   TADICAO_DE_IMPORTACAO (NOLOCK)          WHERE  NR_PROCESSO = @NR_PROCESSO AND NR_ADICAO = @S_ADICAO
END
UPDATE  TDECLARACAO_IMPORTACAO
  ```

#### `sp_di_classifica_item_2`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_classifica_item_2` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TDECLARACAO_IMPORTACAO`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TDI_NVE`, `TEMPRESA_EST`, `TNCM`, `TPROCESSO`, `TRIBUTO` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)`, `@nr_adicao char(3)`, `@nr_item char(3)` |
| **Calls** | `sp_di_repassa_dados_adicao`, `sp_di_repassa_dados_cambio` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDETALHE_MERCADORIA` based on process parameters or status transitions.
  ```sql
UPDATE  TDETALHE_MERCADORIA
SET  CD_CFOP = NULL  WHERE NR_PROCESSO = @nr_processo
--*/
DECLARE  @i_adicao                int
  ```

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET     QT_ITENS_ADICAO = @i_item            WHERE  ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @s_adicao )
END
ELSE
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TADICAO_DE_IMPORTACAO`.
  ```sql
INSERT  INTO TADICAO_DE_IMPORTACAO            ( NR_PROCESSO,             NR_ADICAO,               CD_MERCADORIA_NCM,       CD_MERC_NBM_SH,                CD_NCM_SH,               CD_MERC_NALADI_SH,       CD_MERC_NALADI_NCC,      CD_AUSENCIA_FABRIC,                   CD_FORNECEDOR,           CD_FABRICANTE,      CD_PAIS_ORIG_MERC,       CD_PAIS_AQUIS_MERC,            NM_FORN_ESTR,            ED_LOGR_FORN_ESTR,       ED_NR_FORN_ESTR,         ED_COMPL_FORN_ESTR,                   ED_CIDAD_FORN_ESTR,      ED_ESTAD_FORN_ESTR,      NM_FABRICANTE_MERC,      ED_LOGR_FABRIC,                       ED_NR_FABRIC,            ED_COMPL_FABRIC,         ED_CIDAD_FABRIC,         ED_ESTADO_FABRIC,              QT_ITENS_ADICAO,         CD_LOC_COND_VENDA,       CD_MOEDA_NEGOCIADA,      NR_OPER_TRAT_PREV,             NR_DESTAQUE_NCM, CD_CFOP )      VALUES           ( @nr_processo,            @s_adicao,               @cd_ncm_sh,              @cd_ncm_c8,                    @cd_ncm_c8,              @cd_naladi_sh,           @cd_naladi_ncca,         @cd_fabr_expo,                 @cd_exportador,          @cd_fabricante,          @cd_pais_origem,         @cd_pais_aquisicao,            @nm_empresa1,            @end_empresa1,           @end_numero1,            @end_compl1,                   @end_cidade1,            @end_estado1,            @nm_empresa2,            @end_empresa2,                 @end_numero2,            @end_compl2,             @end_cidade2,            @end_estado2,                  1,                       @cd_local_embarque,      @cd_moeda_negociada,     @nr_oper_trat_prev,             @nr_destaque_ncm, @cd_cfop )
IF  @in_repassa_dados_adicao = 1 AND LTRIM( RTRIM( @cd_exportador_capa ) ) <> ''
BEGIN
SELECT  @cd_fabr_expo = @cd_fabr_expo
  ```

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET     CD_AUSENCIA_FABRIC = @cd_fabr_expo        FROM   TADICAO_DE_IMPORTACAO (NOLOCK)        WHERE  NR_PROCESSO = @nr_processo AND NR_ADICAO = @s_adicao
END
UPDATE  TDECLARACAO_IMPORTACAO
  ```

#### `sp_di_gera_base_calc`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_gera_base_calc` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TACRESCIMO_VALORACAO`, `TADICAO_DE_IMPORTACAO`, `TCONVERSAO_CAMBIO`, `TDECLARACAO_IMPORTACAO`, `TDEDUCAO_VALORACAO`, `TDETALHE_MERCADORIA` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)`, `@nr_adicao char(3)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_gera_base_calc    Script Date: 02091999 08:5')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  TX_MLE    = Round( @vl_tx_mneg, 7 ),           TX_FRETE  = Round( @vl_tx_frete, 7 ),           TX_SEGURO = Round( @vl_tx_seguro, 7 ),           TX_DOLAR  = Round( @vl_tx_dolar, 7 ) WHERE (nr_processo = @nr_processo)
IF  @vl_mle_tot_mn <> @vl_mle_tot_mn1
UPDATE  TDECLARACAO_IMPORTACAO
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_gera_base_calc    Script Date: 02091999 08:5')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  VL_TOTAL_MLE_MN = @vl_mle_tot_mn where (nr_processo = @nr_processo)
IF  @vl_despesa_tot_mn <> @vl_despesa_tot_mn1
UPDATE  TDECLARACAO_IMPORTACAO
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_gera_base_calc    Script Date: 02091999 08:5')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  VL_TOT_DESPS_MN = @vl_despesa_tot_mn where (nr_processo = @nr_processo)
IF  @vl_frete_tot_mn <> @vl_frete_tot_mn1
UPDATE  TDECLARACAO_IMPORTACAO
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_gera_base_calc    Script Date: 02091999 08:5')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  VL_TOTAL_FRETE_MN = @vl_frete_tot_mn where (nr_processo = @nr_processo)
IF  @vl_seguro_tot_mn <> @vl_seguro_tot_mn1
UPDATE  TDECLARACAO_IMPORTACAO
  ```

#### `sp_di_gera_base_calc_x`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_gera_base_calc_x` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TACRESCIMO_VALORACAO`, `TADICAO_DE_IMPORTACAO`, `TCONVERSAO_CAMBIO`, `TDECLARACAO_IMPORTACAO`, `TDEDUCAO_VALORACAO`, `TDETALHE_MERCADORIA`, `TPAGAMENTO_VINCULADO`, `TRIBUTO` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)`, `@nr_adicao char(3)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_gera_base_calc_x    Script Date: 02091999 08')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  TX_MLE    = Round( @vl_tx_mneg, 7 ),             TX_FRETE  = Round( @vl_tx_frete, 7 ),             TX_SEGURO = Round( @vl_tx_seguro, 7 ),             TX_DOLAR  = Round( @vl_tx_dolar, 7 ) where (nr_processo = @nr_processo)
IF  @vl_mle_tot_mn <> @vl_mle_tot_mn1
UPDATE  TDECLARACAO_IMPORTACAO
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_gera_base_calc_x    Script Date: 02091999 08')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  VL_TOTAL_MLE_MN = @vl_mle_tot_mn where (nr_processo = @nr_processo)
IF  @vl_despesa_tot_mn <> @vl_despesa_tot_mn1
UPDATE  TDECLARACAO_IMPORTACAO
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_gera_base_calc_x    Script Date: 02091999 08')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  VL_TOT_DESPS_MN = @vl_despesa_tot_mn where (nr_processo = @nr_processo)
IF  @vl_frete_tot_mn <> @vl_frete_tot_mn1
UPDATE  TDECLARACAO_IMPORTACAO
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_di_gera_base_calc_x    Script Date: 02091999 08')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  VL_TOTAL_FRETE_MN = @vl_frete_tot_mn where (nr_processo = @nr_processo)
IF  @vl_seguro_tot_mn <> @vl_seguro_tot_mn1
UPDATE  TDECLARACAO_IMPORTACAO
  ```

#### `sp_di_libera_cc_propria`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_libera_cc_propria` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TCLIENTE_BANCO_LIBERADO`, `TEMPRESA_NAC`, `TPARAMETROS`, `TPROCESSO` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET     IN_DI_LIBERADA = '1'    WHERE  NR_PROCESSO = @nr_processo
END
-- Libera as DI´s com tributos pago pelo cliente
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET     IN_DI_LIBERADA = '1'    WHERE  NR_PROCESSO = @nr_processo
END
-- Libera todas as DI´s dependendo do parâmetro
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET     IN_DI_LIBERADA = '1'    WHERE  NR_PROCESSO = @nr_processo
END     /*  ROLLBACK TRAN
SET  XACT_ABORT OFF  */
  ```

#### `sp_di_reclassifica_item`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_reclassifica_item` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TDECLARACAO_IMPORTACAO`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TDI_NVE`, `TEMPRESA_EST`, `TNCM`, `TPROCESSO`, `TRIBUTO`, `TVALORACAO_NCM` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo CHAR(18)`, `@nr_adicao CHAR(3)`, `@nr_item CHAR(3)` |
| **Calls** | `sp_di_reclassifica_item_2`, `sp_di_repassa_dados_adicao`, `sp_di_repassa_dados_cambio`, `sp_di_renumera_itens_adicao` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Executes dependent procedure `sp_di_reclassifica_item_2` to propagate workflow updates.
  ```sql
EXEC  sp_di_reclassifica_item_2  @nr_processo, @nr_adicao OUTPUT, @nr_item OUTPUT    RETURN 0
END
--*/
DECLARE  @MAX_ITENS_ADICAO        INT
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TADICAO_DE_IMPORTACAO`.
  ```sql
INSERT  INTO TADICAO_DE_IMPORTACAO (NR_PROCESSO,             NR_ADICAO,               CD_MERCADORIA_NCM,       CD_MERC_NBM_SH,                                                       CD_NCM_SH,               CD_MERC_NALADI_SH,       CD_MERC_NALADI_NCC,      CD_AUSENCIA_FABRIC,                                                   CD_FORNECEDOR,           CD_FABRICANTE,           CD_PAIS_ORIG_MERC,       CD_PAIS_AQUIS_MERC,                                                   NM_FORN_ESTR,            ED_LOGR_FORN_ESTR,       ED_NR_FORN_ESTR,         ED_COMPL_FORN_ESTR,                                                   ED_CIDAD_FORN_ESTR,      ED_ESTAD_FORN_ESTR,      NM_FABRICANTE_MERC,      ED_LOGR_FABRIC,                                                       ED_NR_FABRIC,            ED_COMPL_FABRIC,         ED_CIDAD_FABRIC,         ED_ESTADO_FABRIC,                                                     QT_ITENS_ADICAO,         CD_LOC_COND_VENDA,       CD_MOEDA_NEGOCIADA,      NR_OPER_TRAT_PREV,                                             NR_DESTAQUE_NCM,         ALIQ_IBS_UF,             ALIQ_CBS )           VALUES(@nr_processo,            @s_adicao,               @cd_ncm_sh,              @cd_ncm_c8,                               @cd_ncm_c8,              @cd_naladi_sh,           @cd_naladi_ncca,         @cd_fabr_expo,                            @cd_exportador,          @cd_fabricante,          @cd_pais_origem,         @cd_pais_aquisicao,                       @nm_empresa1,            @end_empresa1,           @end_numero1,            @end_compl1,                              @end_cidade1,            @end_estado1,            @nm_empresa2,            @end_empresa2,                            @end_numero2,            @end_compl2,             @end_cidade2,            @end_estado2,
--1,                       @cd_local_embarque,      @cd_moeda_negociada,     @nr_oper_trat_prev,                 -- Comendado acima e utilizando abaixo a pedido da Andrea Alves - Michel - 20/02/2013                 1,                       NULL,                    @cd_moeda_negociada,     @nr_oper_trat_prev,                 @nr_destaque_ncm,        @ALIQ_IBS_UF,            @ALIQ_CBS)
SELECT  @s_item = '001'
UPDATE  TDETALHE_MERCADORIA
  ```

- **CLEAR**: Updates records in `TDETALHE_MERCADORIA` based on process parameters or status transitions.
  ```sql
UPDATE  TDETALHE_MERCADORIA
SET  NR_ADICAO = @s_adicao,               NR_ITEM   = @s_item,               CD_NCM_SH = @cd_ncm_sh          WHERE NR_PROCESSO = @nr_processo            AND NR_ADICAO = @nr_adicao            AND NR_ITEM = @nr_item            --
EXEC  sp_di_repassa_dados_adicao @nr_processo          --
EXEC  sp_di_repassa_dados_cambio @nr_processo
  ```

- **CLEAR**: Executes dependent procedure `sp_di_repassa_dados_adicao` to propagate workflow updates.
  ```sql
EXEC  sp_di_repassa_dados_adicao @nr_processo          --
EXEC  sp_di_repassa_dados_cambio @nr_processo
-- As Linhas acima foram repassadas para o final da procedure, pois quando havia apenas um item não estava repassando - Michel - 23/10/2012
UPDATE  TDECLARACAO_IMPORTACAO
  ```

#### `sp_di_reclassifica_item2`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_reclassifica_item2` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TDECLARACAO_IMPORTACAO`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TEMPRESA_EST`, `TNCM`, `TPAGAMENTO_VINCULADO`, `TRIBUTO` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo CHAR(18)`, `@nr_adicao CHAR(3)`, `@nr_item CHAR(3)` |
| **Calls** | `sp_di_renumera_itens_adicao`, `sp_exclui_adicao` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TADICAO_DE_IMPORTACAO`. (Developer note: 'Traz os valores da capa da DI para vari veis de trabalho')
  ```sql
INSERT  INTO TADICAO_DE_IMPORTACAO            ( NR_PROCESSO,             NR_ADICAO,               CD_MERCADORIA_NCM,       CD_MERC_NBM_SH,          CD_NCM_SH,             CD_MERC_NALADI_SH,       CD_MERC_NALADI_NCC,      CD_AUSENCIA_FABRIC,      CD_FORNECEDOR,           CD_FABRICANTE,             CD_PAIS_ORIG_MERC,       CD_PAIS_AQUIS_MERC,      NM_FORN_ESTR,            ED_LOGR_FORN_ESTR,             ED_NR_FORN_ESTR,         ED_COMPL_FORN_ESTR,      ED_CIDAD_FORN_ESTR,      ED_ESTAD_FORN_ESTR,             NM_FABRICANTE_MERC,      ED_LOGR_FABRIC,          ED_NR_FABRIC,            ED_COMPL_FABRIC,             ED_CIDAD_FABRIC,         ED_ESTADO_FABRIC,        QT_ITENS_ADICAO,         CD_LOC_COND_VENDA,             CD_MOEDA_NEGOCIADA,      NR_OPER_TRAT_PREV,       PC_ICMS,        PC_REDUCAO_ICMS        ) VALUES           ( @nr_processo,            @s_adicao,               @cd_ncm_sh,              @cd_ncm_c8,              @cd_ncm_c8,             @cd_naladi_sh,           @cd_naladi_ncca,         @cd_fabr_expo,           @cd_exportador,          @cd_fabricante,             @cd_pais_origem,         @cd_pais_aquisicao,      @nm_empresa1,            @end_empresa1,             @end_numero1,            @end_compl1,             @end_cidade1,            @end_estado1,              @nm_empresa2,            @end_empresa2,           @end_numero2,            @end_compl2,
--@end_cidade2,            @end_estado2,            1,                       @cd_local_embarque,             -- Comentado acima e utilizando abaixo a pedido de Andrea Alves - Michel - 20/02/2013             @end_cidade2,            @end_estado2,            1,                       NULL,             @cd_moeda_negociada,     @nr_oper_trat_prev,      @pc_icms,        @pc_reducao_icms      )
IF  @in_repassa_dados_adicao = 1
BEGIN
  ```

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Traz os valores da capa da DI para vari veis de trabalho')
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET     CD_INCOTERMS_VENDA = @cd_incoterm,               CD_VINC_IMPO_EXPO  = @cd_vinc_impo_expo,               CD_METOD_VALORACAO = @cd_metodo_valoracao,               CD_REGIME_TRIBUTAR = @cd_regime_trib_ii,               CD_FUND_LEG_REGIME = @cd_fund_legal_ii,               CD_APLICACAO_MERC  = @cd_aplicacao_mercadoria,                                     IN_BEM_ENCOMENDA   = @in_bem_encomenda,               IN_MATERIAL_USADO  = @in_material_usado         WHERE  ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @s_adicao )
END
IF  @in_repassa_dados_cambio = 1
  ```

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Traz os valores da capa da DI para vari veis de trabalho')
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET     CD_COBERT_CAMBIAL  = @cd_cobertura_cambial,               CD_MODALIDADE_PGTO = @cd_modalidade_pagto,               CD_MOTIVO_SEM_COB  = @cd_motivo_sem_cobertura,               NR_ROF             = @nr_rof,               PC_COMISSAO_AG_IMP = @pc_comissao_agente,                     NR_AGENTE_IMP      = @nr_identificacao_agente,                CD_BANC_AGENTE_IMP = @nr_banco_comissao,                      CD_AGENC_AGENT_IMP = @nr_praca_comissao               WHERE  ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @s_adicao )
IF  @cd_forma_pagamento = '1' OR @cd_forma_pagamento = '2'
BEGIN
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TPAGAMENTO_VINCULADO`. (Developer note: 'Traz os valores da capa da DI para vari veis de trabalho')
  ```sql
INSERT  INTO TPAGAMENTO_VINCULADO             ( NR_PROCESSO,         NR_ADICAO,          CD_FORMA_PAGAMENTO,  NR_SEQUENCIA,  IN_PAGAMENTO_MN,               NR_OP_CAMBIO,        CD_BANCO_PAGAMENTO, CD_PRACA_PAGAMENTO,  NR_COMPR_CAMBIO,               CD_TP_COMPR_CAMBIO ) VALUES             ( @nr_processo,        @s_adicao,          @cd_forma_pagamento, @nr_sequencia, @in_moeda_nacional,               @nr_contrato_cambio, @nr_banco_cambio,   @nr_praca_cambio,    @nr_comprador_me,               @cd_tp_compr_cambio )
END
END
END
  ```

#### `sp_di_reclassifica_item_2`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_reclassifica_item_2` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TDECLARACAO_IMPORTACAO`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TDI_NVE`, `TEMPRESA_EST`, `TNCM`, `TPROCESSO`, `TRIBUTO`, `TVALORACAO_NCM` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo CHAR(18)`, `@nr_adicao CHAR(3)`, `@nr_item CHAR(3)` |
| **Calls** | `sp_di_repassa_dados_adicao`, `sp_di_repassa_dados_cambio`, `sp_di_renumera_itens_adicao` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TADICAO_DE_IMPORTACAO`.
  ```sql
INSERT  INTO TADICAO_DE_IMPORTACAO (NR_PROCESSO,             NR_ADICAO,               CD_MERCADORIA_NCM,       CD_MERC_NBM_SH,                                                       CD_NCM_SH,               CD_MERC_NALADI_SH,       CD_MERC_NALADI_NCC,      CD_AUSENCIA_FABRIC,                                                   CD_FORNECEDOR,           CD_FABRICANTE,           CD_PAIS_ORIG_MERC,       CD_PAIS_AQUIS_MERC,                                                   NM_FORN_ESTR,            ED_LOGR_FORN_ESTR,       ED_NR_FORN_ESTR,         ED_COMPL_FORN_ESTR,                                                   ED_CIDAD_FORN_ESTR,      ED_ESTAD_FORN_ESTR,      NM_FABRICANTE_MERC,      ED_LOGR_FABRIC,                                                       ED_NR_FABRIC,            ED_COMPL_FABRIC,         ED_CIDAD_FABRIC,         ED_ESTADO_FABRIC,                                                     QT_ITENS_ADICAO,         CD_LOC_COND_VENDA,       CD_MOEDA_NEGOCIADA,      NR_OPER_TRAT_PREV,                                             NR_DESTAQUE_NCM, CD_CFOP )           VALUES(@nr_processo,            @s_adicao,               @cd_ncm_sh,              @cd_ncm_c8,                               @cd_ncm_c8,              @cd_naladi_sh,           @cd_naladi_ncca,         @cd_fabr_expo,                            @cd_exportador,          @cd_fabricante,          @cd_pais_origem,         @cd_pais_aquisicao,                       @nm_empresa1,            @end_empresa1,           @end_numero1,            @end_compl1,                              @end_cidade1,            @end_estado1,            @nm_empresa2,            @end_empresa2,                            @end_numero2,            @end_compl2,             @end_cidade2,            @end_estado2,
--1,                       @cd_local_embarque,      @cd_moeda_negociada,     @nr_oper_trat_prev,                 -- Comendado acima e utilizando abaixo a pedido da Andrea Alves - Michel - 20/02/2013                 1,                       NULL,                    @cd_moeda_negociada,     @nr_oper_trat_prev,                 @nr_destaque_ncm, @cd_cfop)
SELECT  @s_item = '001'
UPDATE  TDETALHE_MERCADORIA
  ```

- **CLEAR**: Updates records in `TDETALHE_MERCADORIA` based on process parameters or status transitions.
  ```sql
UPDATE  TDETALHE_MERCADORIA
SET  NR_ADICAO = @s_adicao,               NR_ITEM   = @s_item,               CD_NCM_SH = @cd_ncm_sh          WHERE NR_PROCESSO = @nr_processo            AND NR_ADICAO = @nr_adicao            AND NR_ITEM = @nr_item            --
EXEC  sp_di_repassa_dados_adicao @nr_processo          --
EXEC  sp_di_repassa_dados_cambio @nr_processo
  ```

- **CLEAR**: Executes dependent procedure `sp_di_repassa_dados_adicao` to propagate workflow updates.
  ```sql
EXEC  sp_di_repassa_dados_adicao @nr_processo          --
EXEC  sp_di_repassa_dados_cambio @nr_processo
-- As Linhas acima foram repassadas para o final da procedure, pois quando havia apenas um item não estava repassando - Michel - 23/10/2012
UPDATE  TDECLARACAO_IMPORTACAO
  ```

- **CLEAR**: Executes dependent procedure `sp_di_repassa_dados_cambio` to propagate workflow updates.
  ```sql
EXEC  sp_di_repassa_dados_cambio @nr_processo
-- As Linhas acima foram repassadas para o final da procedure, pois quando havia apenas um item não estava repassando - Michel - 23/10/2012
UPDATE  TDECLARACAO_IMPORTACAO
SET  qt_adicoes = @i_adicao + 1           WHERE NR_PROCESSO = @nr_processo
  ```

#### `sp_di_renumera_itens_adicao`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_renumera_itens_adicao` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `C_ADICAO`, `TACRESCIMO_VALORACAO`, `TADICAO_DE_IMPORTACAO`, `TATO_VINCULADO`, `TDEDUCAO_VALORACAO`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TDI_NVE`, `TDOCUMENTO_VINCULADO`, `TPAGAMENTO_PREVISTO`, `TPAGAMENTO_VINCULADO`, `TRIBUTO`, `TVALORACAO_NCM` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)`, `@nr_adicao char(3)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDETALHE_MERCADORIA` based on process parameters or status transitions.
  ```sql
UPDATE  TDETALHE_MERCADORIA
SET     NR_ITEM = @s_item       WHERE  ( NR_PROCESSO = @nr_processo ) AND              ( NR_ADICAO = @s_adicao ) AND              ( NR_ITEM = @nr_item )
UPDATE  TDI_NVE
SET     NR_ITEM = @s_item       WHERE  ( NR_PROCESSO = @nr_processo ) AND              ( NR_ADICAO = @s_adicao ) AND              ( NR_ITEM = @nr_item )
  ```

- **CLEAR**: Updates records in `TDI_NVE` based on process parameters or status transitions.
  ```sql
UPDATE  TDI_NVE
SET     NR_ITEM = @s_item       WHERE  ( NR_PROCESSO = @nr_processo ) AND              ( NR_ADICAO = @s_adicao ) AND              ( NR_ITEM = @nr_item )
FETCH  c_itens INTO @nr_item
END
  ```

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET     QT_ITENS_ADICAO = @i_item    WHERE  ( NR_PROCESSO = @nr_processo ) AND            ( NR_ADICAO = @s_adicao )
CLOSE  c_itens
END
  ```

- **CLEAR**: Removes outdated or cancelled records from `TADICAO_DE_IMPORTACAO`.
  ```sql
DELETE  FROM TADICAO_DE_IMPORTACAO  WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TACRESCIMO_VALORACAO   WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TATO_VINCULADO         WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TDEDUCAO_VALORACAO     WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
  ```

#### `sp_di_repassa_dados_adicao`

| Field | Content |
| --- | --- |
| **Name** | `sp_di_repassa_dados_adicao` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TDECLARACAO_IMPORTACAO`, `TDESTAQUE_NCM`, `TDOCUMENTO_VINCULADO`, `TEMPRESA_EST`, `TPROCESSO` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | `sp_di_repassa_campos_classif` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Atualiza Local de Embarque da Capa')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET     CD_LOCAL_EMBARQUE = @cd_local_embarque  WHERE  NR_PROCESSO = @nr_processo AND         ISNULL( CD_LOCAL_EMBARQUE, '' ) = ''
IF  LTRIM( RTRIM( @cd_local_embarque_proc ) ) <> ''
BEGIN
  ```

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Atualiza Local de Embarque da Capa')
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET     CD_INCOTERMS_VENDA = CASE ISNULL( @cd_incoterm, '' )                                   WHEN '' THEN CD_INCOTERMS_VENDA
ELSE  @cd_incoterm
END ,           CD_VINC_IMPO_EXPO  = CASE ISNULL( @cd_vinc_impo_expo, '' )                                   WHEN '' THEN CD_VINC_IMPO_EXPO
  ```

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Atualiza Local de Embarque da Capa')
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET     CD_PAIS_AQUIS_MERC = @cd_pais3    WHERE  ( NR_PROCESSO = @nr_processo ) AND            ( ISNULL( CD_PAIS_AQUIS_MERC, '' ) = '' )
UPDATE  TADICAO_DE_IMPORTACAO
SET     CD_PAIS_ORIG_MERC = @cd_pais4    WHERE  ( NR_PROCESSO = @nr_processo ) AND            ( ISNULL( CD_PAIS_ORIG_MERC, '' ) = '' )
  ```

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Atualiza Local de Embarque da Capa')
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET     CD_PAIS_ORIG_MERC = @cd_pais4    WHERE  ( NR_PROCESSO = @nr_processo ) AND            ( ISNULL( CD_PAIS_ORIG_MERC, '' ) = '' )
UPDATE  TRIBUTO
SET     CD_TIPO_BENEF_IPI = ISNULL( @cd_reg_trib_ipi, CD_TIPO_BENEF_IPI )    WHERE  NR_PROCESSO = @nr_processo AND           CD_RECEITA_IMPOSTO = '0002'
  ```

#### `sp_duplica_di`

| Field | Content |
| --- | --- |
| **Name** | `sp_duplica_di` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TACRESCIMO_VALORACAO`, `TADICAO_DE_IMPORTACAO`, `TATO_VINCULADO`, `TCARGA_ARMAZEM`, `TCOMPENSACAO_CREDITO`, `TDECLARACAO_IMPORTACAO`, `TDEDUCAO_VALORACAO`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TDI_NVE`, `TDOCUMENTO_INSTRUCAO`, `TDOCUMENTO_VINCULADO`, `TEMBALAGEM_CARGA`, `TPAGAMENTO_PREVISTO`, `TPAGAMENTO_TRIBUTOS`, `TPAGAMENTO_VINCULADO`, `TPROCESSO_DI`, `TRIBUTO`, `TVALORACAO_NCM` |
| **Tables written** | `INSERT TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo_fonte char(18)`, `@nr_processo_destino char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TDECLARACAO_IMPORTACAO`. (Developer note: 'Object:  Stored Procedure dbo.sp_duplica_di    Script Date: 02091999 08:58:11 AM')
  ```sql
INSERT  INTO TDECLARACAO_IMPORTACAO (        NR_PROCESSO, NR_IDENT_USUARIO, CD_APLICACAO_MERC, CD_BANDEIRA_TRANSP, CD_COBERTURA_CAMBIAL,        CD_DESTAQUE_NCM, CD_FORMA_PAGAMENTO, CD_FUND_LEGAL_II, CD_IMPORTADOR, CD_INCOTERM, CD_LOCAL_EMBARQUE,        CD_METODO_VALORACAO, CD_MODALIDADE_DESP, CD_MODALIDADE_PAGTO, CD_MOEDA_DESPESAS, CD_MOEDA_FRETE,        CD_MOEDA_MLE, CD_MOEDA_SEGURO, CD_MOTIVO_SEM_COBERTURA, CD_MOTIVO_TRANS, CD_PAIS_IMPORTADOR,        CD_PAIS_PROC_CARGA, CD_RECINTO_ALFAND, CD_REG_TRIB_II, CD_REG_TRIB_IPI, CD_SETOR_ARMAZENAM,         CD_TIPO_AG_CARGA, CD_TIPO_CONSIG, CD_TIPO_DCTO_CARGA, CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR,        CD_TIPO_MANIFESTO, CD_TRANSPORTADOR, CD_URF_DESPACHO, CD_URF_ENTR_CARGA, CD_UTIL_DCTO_CARGA,        CD_VIA_TRANSP_CARG, CD_VINC_IMPO_EXPO, DT_CHEGADA_CARGA, DT_EMBARQUE, IN_BEM_ENCOMENDA, IN_MATERIAL_USADO,        IN_MOEDA_NACIONAL, IN_MOEDA_UNICA, IN_MULTIMODAL, IN_OPERACAO_FUNDAP, IN_RATEAR_FRETE_ITENS,        IN_RATEAR_SEGURO_ITENS, IN_REPASSA_DADOS_ADICAO, IN_REPASSA_DADOS_CAMBIO, NM_CONSIGNATARIO,        NM_VEICULO_TRANSP, NR_AGENTE_CARGA, NR_BANCO_COM, NR_BANCO_PAGAMENTO, NR_COMPRADOR_ME, NR_CONSIGNATARIO,        NR_CONTRATO_CAMBIO, NR_CPF_REPR_LEGAL, NR_DCTO_CARGA, NR_DCTO_CARGA_MAST, NR_IDENTIFICACAO_COM,        NR_MANIFESTO, NR_PRACA_COM, NR_PRACA_PAGAMENTO, NR_ROF, NR_VEICULO_TRANSP, PB_CARGA, PC_COMISSAO, PC_ICMS,        PC_REDUCAO_ICMS, PL_CARGA, QT_ADICOES, TX_INFO_COMPL, VL_FRETE_TNAC_MNEG, VL_TOT_DESPS_MN,         VL_TOT_DESPS_MNEG, VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID, VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG,        VL_TOTAL_FRETE_MN, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, PC_SEGURO_MLE, VL_TOTAL_II, VL_TOTAL_IPI, VL_TOTAL_AD,        DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO, CD_TIPO_BASE_SEGURO, IN_REB, VL_TOT_ICMS, CD_TIPO_PGTO_TRIB,        NR_CONTA_PGTO_TRIB, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, NR_REF_CLI, IN_SISCOMEX, CD_TIPO_ICMS,        IN_ICMS_IMPRESSO, VL_TOTAL_ACRESCIMOS_MN, VL_TOTAL_DEDUCOES_MN, VL_DESPESA_ITEM, VL_DESPESA_ITEM_MN,        CD_ORGAO_FIN_INTER, CD_PRESENCA_CARGA, NR_SEQ_RETIFICACAO, CD_MOTIVO_RETIF, DT_RETIFICACAO,         DT_EXON_IMPRESSO, IN_EXON_IMPRESSO, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, CD_FABRICANTE,         CD_PAIS_ORIG_MERC, CD_FORNECEDOR, CD_PAIS_AQUIS_MERC, CD_AUSENCIA_FABRIC, VL_TOTAL_CAMBIO, QT_PARC_FINANC_360,         QT_PERIOD_PGTO_360, CD_PERIOD_PGTO_360, IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS )
SELECT  @nr_processo_destino, NR_IDENT_USUARIO, CD_APLICACAO_MERC, CD_BANDEIRA_TRANSP, CD_COBERTURA_CAMBIAL,              CD_DESTAQUE_NCM, CD_FORMA_PAGAMENTO, CD_FUND_LEGAL_II, CD_IMPORTADOR, CD_INCOTERM, CD_LOCAL_EMBARQUE,              CD_METODO_VALORACAO, CD_MODALIDADE_DESP, CD_MODALIDADE_PAGTO, CD_MOEDA_DESPESAS, CD_MOEDA_FRETE,         CD_MOEDA_MLE, CD_MOEDA_SEGURO, CD_MOTIVO_SEM_COBERTURA, CD_MOTIVO_TRANS, CD_PAIS_IMPORTADOR,      CD_PAIS_PROC_CARGA, CD_RECINTO_ALFAND, CD_REG_TRIB_II, CD_REG_TRIB_IPI, CD_SETOR_ARMAZENAM,        CD_TIPO_AG_CARGA, CD_TIPO_CONSIG, CD_TIPO_DCTO_CARGA, CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR,       CD_TIPO_MANIFESTO, CD_TRANSPORTADOR, CD_URF_DESPACHO, CD_URF_ENTR_CARGA, CD_UTIL_DCTO_CARGA,       CD_VIA_TRANSP_CARG, CD_VINC_IMPO_EXPO, DT_CHEGADA_CARGA, DT_EMBARQUE, IN_BEM_ENCOMENDA, IN_MATERIAL_USADO,       IN_MOEDA_NACIONAL, IN_MOEDA_UNICA, IN_MULTIMODAL, IN_OPERACAO_FUNDAP, IN_RATEAR_FRETE_ITENS,      IN_RATEAR_SEGURO_ITENS, IN_REPASSA_DADOS_ADICAO, IN_REPASSA_DADOS_CAMBIO, NM_CONSIGNATARIO,      NM_VEICULO_TRANSP, NR_AGENTE_CARGA, NR_BANCO_COM, NR_BANCO_PAGAMENTO, NR_COMPRADOR_ME, NR_CONSIGNATARIO,      NR_CONTRATO_CAMBIO, NR_CPF_REPR_LEGAL, NR_DCTO_CARGA, NR_DCTO_CARGA_MAST, NR_IDENTIFICACAO_COM,      NR_MANIFESTO, NR_PRACA_COM, NR_PRACA_PAGAMENTO, NR_ROF, NR_VEICULO_TRANSP, PB_CARGA, PC_COMISSAO, PC_ICMS,      PC_REDUCAO_ICMS, PL_CARGA, QT_ADICOES, TX_INFO_COMPL, VL_FRETE_TNAC_MNEG, VL_TOT_DESPS_MN,       VL_TOT_DESPS_MNEG, VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID, VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG,      VL_TOTAL_FRETE_MN, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, PC_SEGURO_MLE, VL_TOTAL_II, VL_TOTAL_IPI, VL_TOTAL_AD,      DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO, CD_TIPO_BASE_SEGURO, IN_REB, VL_TOT_ICMS, CD_TIPO_PGTO_TRIB,      NR_CONTA_PGTO_TRIB, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, NR_REF_CLI, '0', CD_TIPO_ICMS,       '0', VL_TOTAL_ACRESCIMOS_MN, VL_TOTAL_DEDUCOES_MN, VL_DESPESA_ITEM, VL_DESPESA_ITEM_MN,       CD_ORGAO_FIN_INTER, CD_PRESENCA_CARGA, NR_SEQ_RETIFICACAO, CD_MOTIVO_RETIF, DT_RETIFICACAO,       DT_EXON_IMPRESSO, IN_EXON_IMPRESSO, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, CD_FABRICANTE,       CD_PAIS_ORIG_MERC, CD_FORNECEDOR, CD_PAIS_AQUIS_MERC, CD_AUSENCIA_FABRIC, VL_TOTAL_CAMBIO, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360, CD_PERIOD_PGTO_360, IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS      FROM   TDECLARACAO_IMPORTACAO       WHERE  NR_PROCESSO = @nr_processo_fonte        /* Transferir dados da DI - Carga_Armazem */
INSERT  INTO TCARGA_ARMAZEM ( NR_PROCESSO, NR_SEQUENCIA, NM_ARMAZEM_CARGA )
SELECT  @nr_processo_destino, NR_SEQUENCIA, NM_ARMAZEM_CARGA         FROM   TCARGA_ARMAZEM         WHERE  NR_PROCESSO = @nr_processo_fonte      /* Transferir dados da DI - Compensacao_Credito */
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TCARGA_ARMAZEM`. (Developer note: 'Object:  Stored Procedure dbo.sp_duplica_di    Script Date: 02091999 08:58:11 AM')
  ```sql
INSERT  INTO TCARGA_ARMAZEM ( NR_PROCESSO, NR_SEQUENCIA, NM_ARMAZEM_CARGA )
SELECT  @nr_processo_destino, NR_SEQUENCIA, NM_ARMAZEM_CARGA         FROM   TCARGA_ARMAZEM         WHERE  NR_PROCESSO = @nr_processo_fonte      /* Transferir dados da DI - Compensacao_Credito */
INSERT  INTO TCOMPENSACAO_CREDITO( NR_PROCESSO, CD_RECEITA_CREDITO, VL_COMPENSAR_CRED, NR_DCTO_GERADOR_CR )
SELECT  @nr_processo_destino, CD_RECEITA_CREDITO, VL_COMPENSAR_CRED, NR_DCTO_GERADOR_CR        FROM   TCOMPENSACAO_CREDITO        WHERE  NR_PROCESSO = @nr_processo_fonte      /* Transferir dados da DI - Documento_Instrucao */
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TCOMPENSACAO_CREDITO(`. (Developer note: 'Object:  Stored Procedure dbo.sp_duplica_di    Script Date: 02091999 08:58:11 AM')
  ```sql
INSERT  INTO TCOMPENSACAO_CREDITO( NR_PROCESSO, CD_RECEITA_CREDITO, VL_COMPENSAR_CRED, NR_DCTO_GERADOR_CR )
SELECT  @nr_processo_destino, CD_RECEITA_CREDITO, VL_COMPENSAR_CRED, NR_DCTO_GERADOR_CR        FROM   TCOMPENSACAO_CREDITO        WHERE  NR_PROCESSO = @nr_processo_fonte      /* Transferir dados da DI - Documento_Instrucao */
INSERT  INTO TDOCUMENTO_INSTRUCAO ( NR_PROCESSO, NR_SEQUENCIA, CD_TIPO_DCTO_INSTR, NR_DCTO_INSTRUCAO )
SELECT  @nr_processo_destino, NR_SEQUENCIA,/*                (
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TDOCUMENTO_INSTRUCAO`. (Developer note: 'Object:  Stored Procedure dbo.sp_duplica_di    Script Date: 02091999 08:58:11 AM')
  ```sql
INSERT  INTO TDOCUMENTO_INSTRUCAO ( NR_PROCESSO, NR_SEQUENCIA, CD_TIPO_DCTO_INSTR, NR_DCTO_INSTRUCAO )
SELECT  @nr_processo_destino, NR_SEQUENCIA,/*                (
SELECT  ISNULL( MAX( NR_SEQUENCIA ), 0 ) + 1                  FROM   TDOCUMENTO_INSTRUCAO                  WHERE  NR_PROCESSO = @nr_processo_destino ), */CD_TIPO_DCTO_INSTR, NR_DCTO_INSTRUCAO         FROM   TDOCUMENTO_INSTRUCAO        WHERE  NR_PROCESSO = @nr_processo_fonte      /* Transferir dados da DI - Embalagem_Carga */
INSERT  INTO TEMBALAGEM_CARGA ( NR_PROCESSO, NR_SEQUENCIA, CD_TIPO_EMBALAGEM, QT_VOLUME_CARGA )
  ```

#### `sp_duplica_processo`

| Field | Content |
| --- | --- |
| **Name** | `sp_duplica_processo` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TPROCESSO` |
| **Tables written** | `INSERT TPROCESSO` |
| **Parameters** | `@nr_processo_fonte char(18)`, `@nr_processo_destino char(18)` |
| **Calls** | `sp_muda_servico`, `sp_atz_evento` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TPROCESSO`. (Developer note: 'Object:  Stored Procedure dbo.sp_duplica_processo    Script Date: 22111998 10:59')
  ```sql
INSERT  INTO TPROCESSO             ( NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_SERVICO, CD_USUARIO,               DT_ABERTURA, CD_RESTRICAO, CD_LIBERADOR, DT_LIBERACAO, IN_CANCELADO, CD_REPRESENTANTE, NR_PROC_PARCEIRO,               TX_MERCADORIA, IN_MERC_PERIGOSA, TX_OBSERVACOES, CD_MOEDA_MLE, VL_MLE_MNEG, VL_MLE_MN,               CD_MOEDA_FRETE, VL_FRETE_PREPAID_MNEG, VL_FRETE_COLLECT_MNEG, VL_FRETE_MN, CD_MOEDA_SEGURO,               VL_SEGURO_MNEG, VL_SEGURO_MN, CD_AGENTE, VL_TAXA_FRETE, VL_CIF_DOLAR, VL_CIF_MN, VL_II_MN,               VL_IPI_MN, VL_ICMS_MN, CD_ARMAZEM_ATRACACAO, CD_ARMAZEM_DESCARGA, CD_ARMAZEM_ESTOCAGEM,               CD_TRANSP_NAC, CD_EMBARCACAO, NR_VOO, NR_CONHECIMENTO, NR_CONHECIMENTO_MASTER,               CD_PAIS_ORIGEM, CD_LOCAL_EMBARQUE, CD_PAIS_DESTINO, CD_LOCAL_DESEMBARQUE,               QT_REF_CLIENTE, QT_SOLINUM, QT_RECEBIMENTO, QT_DEVOLUCOES, QT_LANC_FAT, BASE_CALCULO_SDA,               VL_SDA, VL_CONTR_ASSIST,               CD_STATUS_SDA,               VL_FRETE_INTERNO, NM_LOCAL_NF_LWW, TX_OBS_LWW, IN_LIBERADO, CD_REGIME_TRIB, IN_CHEQUE_SDA,               IN_LIQUIDADO, VL_FRETE_TNAC_MNEG, IN_PRODUCAO, IN_SDA_PAGO, IN_URGENTE, CD_ANALISTA_CLIENTE,               CD_CELULA, CD_ANALISTA_COMISSARIA, CD_CONTATO, CD_AREA, CD_GRUPO )
SELECT  @nr_processo_destino, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_SERVICO, CD_USUARIO,             @hoje, CD_RESTRICAO, CD_LIBERADOR, DT_LIBERACAO, '0', CD_REPRESENTANTE, NR_PROC_PARCEIRO,       TX_MERCADORIA, IN_MERC_PERIGOSA, TX_OBSERVACOES, CD_MOEDA_MLE, VL_MLE_MNEG, VL_MLE_MN,              CD_MOEDA_FRETE, VL_FRETE_PREPAID_MNEG, VL_FRETE_COLLECT_MNEG, VL_FRETE_MN, CD_MOEDA_SEGURO,             VL_SEGURO_MNEG, VL_SEGURO_MN, CD_AGENTE, VL_TAXA_FRETE, VL_CIF_DOLAR, VL_CIF_MN, VL_II_MN,             VL_IPI_MN, VL_ICMS_MN, CD_ARMAZEM_ATRACACAO, CD_ARMAZEM_DESCARGA, CD_ARMAZEM_ESTOCAGEM,             CD_TRANSP_NAC, CD_EMBARCACAO, NR_VOO, NR_CONHECIMENTO, NR_CONHECIMENTO_MASTER,             CD_PAIS_ORIGEM, CD_LOCAL_EMBARQUE, CD_PAIS_DESTINO, CD_LOCAL_DESEMBARQUE,              QT_REF_CLIENTE, QT_SOLINUM, QT_RECEBIMENTO, QT_DEVOLUCOES, QT_LANC_FAT, 0,             0, 0,              CASE WHEN ( ( CD_STATUS_SDA = '1' ) OR ( CD_STATUS_SDA = '2' ) ) THEN '0'
ELSE  CD_STATUS_SDA
END ,             VL_FRETE_INTERNO, NM_LOCAL_NF_LWW, TX_OBS_LWW, IN_LIBERADO, CD_REGIME_TRIB, '0',              '0', 0, '1', '0', IN_URGENTE, CD_ANALISTA_CLIENTE, CD_CELULA, CD_ANALISTA_COMISSARIA,             CD_CONTATO, CD_AREA, CD_GRUPO             FROM  TPROCESSO              WHERE NR_PROCESSO = @nr_processo_fonte
  ```

- **CLEAR**: Executes dependent procedure `sp_muda_servico` to propagate workflow updates. (Developer note: 'Object:  Stored Procedure dbo.sp_duplica_processo    Script Date: 22111998 10:59')
  ```sql
EXEC  sp_muda_servico @nr_processo_destino
EXEC  sp_atz_evento @nr_processo_destino, 'CD_EV_ABRE_PROC', @hoje
IF  @err=0
BEGIN     COMMIT TRAN DUPLICA_PROCESSO    RETURN (0)
  ```

- **CLEAR**: Executes dependent procedure `sp_atz_evento` to propagate workflow updates. (Developer note: 'Object:  Stored Procedure dbo.sp_duplica_processo    Script Date: 22111998 10:59')
  ```sql
EXEC  sp_atz_evento @nr_processo_destino, 'CD_EV_ABRE_PROC', @hoje
IF  @err=0
BEGIN     COMMIT TRAN DUPLICA_PROCESSO    RETURN (0)
END
  ```

#### `sp_duplica_unidade`

| Field | Content |
| --- | --- |
| **Name** | `sp_duplica_unidade` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TCLIENTE_BANCO_LIBERADO`, `TCLIENTE_CONTATO`, `TCLIENTE_CPMF`, `TCLIENTE_DOCUMENTO`, `TCLIENTE_FATURAMENTO`, `TCLIENTE_HABILITACAO`, `TCLIENTE_ICMS_SUL`, `TCLIENTE_ITEM_POR_TON`, `TCLIENTE_NUMERARIO`, `TCLIENTE_NUMERARIO_USD`, `TCLIENTE_REPASSE`, `TCLIENTE_REPRESENTANTE`, `TCLIENTE_SERVICO`, `TCLIENTE_TRANSPORTADOR`, `TRECEITAS_EXP`, `TRECEITAS_EXP_FAIXA`, `TRECEITAS_IMP`, `TUNID_NEG`, `TUNID_NEG_PRODUTO` |
| **Tables written** | `INSERT TCLIENTE_SERVICO` |
| **Parameters** | `@cd_unid_atual char(2)`, `@cd_unid_new char(2)`, `@tp_repassa bit` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TUNID_NEG`.
  ```sql
INSERT  INTO TUNID_NEG     (CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG, IN_ATIVO, VL_ALIQ_ISS, CGC_UNID_NEG, CD_FILIAL, END_UNID_NEG, END_NUMERO, END_COMPL, END_BAIRRO, END_CIDADE,       END_UF, IE_UNID_NEG, IM_UNID_NEG, NR_FONE, END_CEP, NR_FAX1, NR_FAX2, NM_SLOGAN, NR_NOTA_FATURA, NM_EMAIL)
SELECT  @cd_unid_new, NM_UNID_NEG, @campo_branco, IN_ATIVO, VL_ALIQ_ISS, CGC_UNID_NEG, CD_FILIAL, END_UNID_NEG, END_NUMERO, END_COMPL, END_BAIRRO, END_CIDADE,             END_UF, IE_UNID_NEG, IM_UNID_NEG, NR_FONE, END_CEP, NR_FAX1, NR_FAX2, NM_SLOGAN, NR_NOTA_FATURA, NM_EMAIL     FROM TUNID_NEG     WHERE CD_UNID_NEG = @cd_unid_atual
INSERT  INTO TUNID_NEG_PRODUTO     (CD_UNID_NEG, CD_PRODUTO, IN_ATIVO, NR_ULT_FATURA, NR_ULT_NOTA, NR_ULT_PROCESSO, NR_ULT_PREVISAO, TX_NUMERARIO_OBS, TX_NUMERARIO_ASS, CD_CT_GERENCIAL)
SELECT  @cd_unid_new, CD_PRODUTO, IN_ATIVO, NR_ULT_FATURA, NR_ULT_NOTA, NR_ULT_PROCESSO, NR_ULT_PREVISAO, TX_NUMERARIO_OBS, TX_NUMERARIO_ASS, CD_CT_GERENCIAL      FROM TUNID_NEG_PRODUTO     WHERE CD_UNID_NEG = @cd_unid_atual
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TUNID_NEG_PRODUTO`.
  ```sql
INSERT  INTO TUNID_NEG_PRODUTO     (CD_UNID_NEG, CD_PRODUTO, IN_ATIVO, NR_ULT_FATURA, NR_ULT_NOTA, NR_ULT_PROCESSO, NR_ULT_PREVISAO, TX_NUMERARIO_OBS, TX_NUMERARIO_ASS, CD_CT_GERENCIAL)
SELECT  @cd_unid_new, CD_PRODUTO, IN_ATIVO, NR_ULT_FATURA, NR_ULT_NOTA, NR_ULT_PROCESSO, NR_ULT_PREVISAO, TX_NUMERARIO_OBS, TX_NUMERARIO_ASS, CD_CT_GERENCIAL      FROM TUNID_NEG_PRODUTO     WHERE CD_UNID_NEG = @cd_unid_atual
IF  @tp_repassa = 1
BEGIN
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TCLIENTE_HABILITACAO`.
  ```sql
INSERT  INTO TCLIENTE_HABILITACAO      (CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, DT_VALID_CRED_RF, DT_CAPTACAO, IN_ATIVO, TX_NUMERARIO_OBS, QT_ADIANTAMENTO, CD_DT_BASE_CAMBIO, CD_TAB_SDA,        CD_EQUIPE, CD_FOLLOW_UP, CD_NUMERARIO, IN_LIBERACAO, CD_TP_FOLLOW_UP, IN_SD_FAT_ZERO, IN_SD_NOTA_ZERO, IN_COBRAR_CPMF, CD_RESPONSAVEL, IN_BOLETO,        NR_DIAS_VENCTO_FATURA, IN_COMP_SDA, IN_QUADRO_TOTAL_FAT, CD_IR_FAT, IN_DIVERSOS, IN_CC_NUM, IN_OBS_UNICA, IN_OBS_POR_DATA)
SELECT  CD_CLIENTE, @cd_unid_new, CD_PRODUTO, DT_VALID_CRED_RF, DT_CAPTACAO, IN_ATIVO, TX_NUMERARIO_OBS, QT_ADIANTAMENTO, CD_DT_BASE_CAMBIO, CD_TAB_SDA,              CD_EQUIPE, CD_FOLLOW_UP, CD_NUMERARIO, IN_LIBERACAO, CD_TP_FOLLOW_UP, IN_SD_FAT_ZERO, IN_SD_NOTA_ZERO, IN_COBRAR_CPMF, CD_RESPONSAVEL, IN_BOLETO,              NR_DIAS_VENCTO_FATURA, IN_COMP_SDA, IN_QUADRO_TOTAL_FAT, CD_IR_FAT, IN_DIVERSOS, IN_CC_NUM, IN_OBS_UNICA, IN_OBS_POR_DATA       FROM TCLIENTE_HABILITACAO       WHERE CD_UNID_NEG = @cd_unid_atual
INSERT  INTO TCLIENTE_SERVICO      (CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, IN_ATIVO, NR_DPS, DT_CAPTACAO, PZ_PROPOSTA, IN_INCIDE_SDA, DT_AUTORIZACAO, CD_PREFIXO,        CD_BANCO_DEB_CC, CD_BANCO_COM, CD_BANCO_DEB_COM)
SELECT  CD_CLIENTE, @cd_unid_new, CD_PRODUTO, CD_SERVICO, IN_ATIVO, NR_DPS, DT_CAPTACAO, PZ_PROPOSTA, IN_INCIDE_SDA, DT_AUTORIZACAO, CD_PREFIXO,              CD_BANCO_DEB_CC, CD_BANCO_COM, CD_BANCO_DEB_COM      FROM TCLIENTE_SERVICO       WHERE CD_UNID_NEG = @cd_unid_atual
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TCLIENTE_SERVICO`.
  ```sql
INSERT  INTO TCLIENTE_SERVICO      (CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, IN_ATIVO, NR_DPS, DT_CAPTACAO, PZ_PROPOSTA, IN_INCIDE_SDA, DT_AUTORIZACAO, CD_PREFIXO,        CD_BANCO_DEB_CC, CD_BANCO_COM, CD_BANCO_DEB_COM)
SELECT  CD_CLIENTE, @cd_unid_new, CD_PRODUTO, CD_SERVICO, IN_ATIVO, NR_DPS, DT_CAPTACAO, PZ_PROPOSTA, IN_INCIDE_SDA, DT_AUTORIZACAO, CD_PREFIXO,              CD_BANCO_DEB_CC, CD_BANCO_COM, CD_BANCO_DEB_COM      FROM TCLIENTE_SERVICO       WHERE CD_UNID_NEG = @cd_unid_atual
INSERT  INTO TCLIENTE_REPRESENTANTE       (CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_REPRESENTANTE, IN_ATIVO)
SELECT  CD_CLIENTE, @cd_unid_new, CD_PRODUTO, CD_REPRESENTANTE, IN_ATIVO       FROM TCLIENTE_REPRESENTANTE       WHERE CD_UNID_NEG = @cd_unid_atual
  ```

#### `sp_exclui_adicao`

| Field | Content |
| --- | --- |
| **Name** | `sp_exclui_adicao` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `C_ADICAO`, `TACRESCIMO_VALORACAO`, `TADICAO_DE_IMPORTACAO`, `TATO_VINCULADO`, `TDEDUCAO_VALORACAO`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TDI_NVE`, `TDOCUMENTO_VINCULADO`, `TPAGAMENTO_PREVISTO`, `TPAGAMENTO_VINCULADO`, `TRIBUTO`, `TVALORACAO_NCM` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)`, `@nr_adicao char(3)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `tadicao_de_importacao`. (Developer note: 'Object:  Stored Procedure dbo.sp_exclui_adicao    Script Date: 02091999 08:58:11')
  ```sql
DELETE  FROM tadicao_de_importacao WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TACRESCIMO_VALORACAO  WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TATO_VINCULADO        WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TDEDUCAO_VALORACAO    WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
  ```

- **CLEAR**: Removes outdated or cancelled records from `TACRESCIMO_VALORACAO`. (Developer note: 'Object:  Stored Procedure dbo.sp_exclui_adicao    Script Date: 02091999 08:58:11')
  ```sql
DELETE  FROM TACRESCIMO_VALORACAO  WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TATO_VINCULADO        WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TDEDUCAO_VALORACAO    WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TDESTAQUE_NCM         WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
  ```

- **CLEAR**: Removes outdated or cancelled records from `TATO_VINCULADO`. (Developer note: 'Object:  Stored Procedure dbo.sp_exclui_adicao    Script Date: 02091999 08:58:11')
  ```sql
DELETE  FROM TATO_VINCULADO        WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TDEDUCAO_VALORACAO    WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TDESTAQUE_NCM         WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TDOCUMENTO_VINCULADO  WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
  ```

- **CLEAR**: Removes outdated or cancelled records from `TDEDUCAO_VALORACAO`. (Developer note: 'Object:  Stored Procedure dbo.sp_exclui_adicao    Script Date: 02091999 08:58:11')
  ```sql
DELETE  FROM TDEDUCAO_VALORACAO    WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TDESTAQUE_NCM         WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TDOCUMENTO_VINCULADO  WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
DELETE  FROM TPAGAMENTO_PREVISTO   WHERE ( NR_PROCESSO = @nr_processo ) AND ( NR_ADICAO = @nr_adicao )
  ```

#### `sp_exclui_di`

| Field | Content |
| --- | --- |
| **Name** | `sp_exclui_di` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TACRESCIMO_VALORACAO`, `TADICAO_DE_IMPORTACAO`, `TATO_VINCULADO`, `TCARGA_ARMAZEM`, `TCOMPENSACAO_CREDITO`, `TDECLARACAO_IMPORTACAO`, `TDEDUCAO_VALORACAO`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TDI_NVE`, `TDOCUMENTO_INSTRUCAO`, `TDOCUMENTO_VINCULADO`, `TEMBALAGEM_CARGA`, `TPAGAMENTO_PREVISTO`, `TPAGAMENTO_TRIBUTOS`, `TPAGAMENTO_VINCULADO`, `TPROCESSO_DI`, `TRIBUTO`, `TVALORACAO_NCM` |
| **Tables written** | `DELETE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `TDECLARACAO_IMPORTACAO`. (Developer note: 'Object:  Stored Procedure dbo.sp_exclui_di    Script Date: 02091999 08:58:11 AM ')
  ```sql
DELETE  from TDECLARACAO_IMPORTACAO  where (nr_processo = @nr_processo)
DELETE  from TCARGA_ARMAZEM          where (nr_processo = @nr_processo)
DELETE  from TCOMPENSACAO_CREDITO    where (nr_processo = @nr_processo)
--esta comentado pois foi solicitado pela Analista Andrea para não apagar mais a fatura da manutenção do processo    --erik 02/2004    --
  ```

- **CLEAR**: Removes outdated or cancelled records from `TCARGA_ARMAZEM`. (Developer note: 'Object:  Stored Procedure dbo.sp_exclui_di    Script Date: 02091999 08:58:11 AM ')
  ```sql
DELETE  from TCARGA_ARMAZEM          where (nr_processo = @nr_processo)
DELETE  from TCOMPENSACAO_CREDITO    where (nr_processo = @nr_processo)
--esta comentado pois foi solicitado pela Analista Andrea para não apagar mais a fatura da manutenção do processo    --erik 02/2004    --
DELETE  from TDOCUMENTO_INSTRUCAO    where (nr_processo = @nr_processo)
  ```

- **CLEAR**: Removes outdated or cancelled records from `TCOMPENSACAO_CREDITO`. (Developer note: 'Object:  Stored Procedure dbo.sp_exclui_di    Script Date: 02091999 08:58:11 AM ')
  ```sql
DELETE  from TCOMPENSACAO_CREDITO    where (nr_processo = @nr_processo)
--esta comentado pois foi solicitado pela Analista Andrea para não apagar mais a fatura da manutenção do processo    --erik 02/2004    --
DELETE  from TDOCUMENTO_INSTRUCAO    where (nr_processo = @nr_processo)
DELETE  from TEMBALAGEM_CARGA        where (nr_processo = @nr_processo)
  ```

- **CLEAR**: Removes outdated or cancelled records from `TDOCUMENTO_INSTRUCAO`. (Developer note: 'Object:  Stored Procedure dbo.sp_exclui_di    Script Date: 02091999 08:58:11 AM ')
  ```sql
DELETE  from TDOCUMENTO_INSTRUCAO    where (nr_processo = @nr_processo)
DELETE  from TEMBALAGEM_CARGA        where (nr_processo = @nr_processo)
DELETE  from TPAGAMENTO_TRIBUTOS     where (nr_processo = @nr_processo)
DELETE  from TPROCESSO_DI            where (nr_processo = @nr_processo)
  ```

#### `sp_exp_apaga_renum_itens`

| Field | Content |
| --- | --- |
| **Name** | `sp_exp_apaga_renum_itens` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TPROCESSO_EXP_ITEM`, `TPROCESSO_PALETIZACAO` |
| **Tables written** | `UPDATE TPROCESSO_EXP` |
| **Parameters** | `@nr_processo char(18)`, `@nr_item char(3)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `TPROCESSO_EXP_ITEM`.
  ```sql
DELETE  TPROCESSO_EXP_ITEM WHERE NR_PROCESSO = @nr_processo AND NR_ITEM = @nr_item
DELETE  TPROCESSO_PALETIZACAO WHERE NR_PROCESSO = @nr_processo AND NR_ITEM = @nr_item
END
--renumera os itens do processo
  ```

- **CLEAR**: Removes outdated or cancelled records from `TPROCESSO_PALETIZACAO`.
  ```sql
DELETE  TPROCESSO_PALETIZACAO WHERE NR_PROCESSO = @nr_processo AND NR_ITEM = @nr_item
END
--renumera os itens do processo
IF (
  ```

- **CLEAR**: Updates records in `TPROCESSO_EXP` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO_EXP
SET  QT_TOTAL_ITENS = @nrQtdeItem WHERE NR_PROCESSO = @nr_processo
DECLARE  cProcesso CURSOR FOR
SELECT  NR_ITEM       FROM TPROCESSO_EXP_ITEM      WHERE NR_PROCESSO = @nr_processo      ORDER BY NR_ITEM
  ```

- **CLEAR**: Updates records in `TPROCESSO_EXP_ITEM` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO_EXP_ITEM
SET  NR_ITEM = @s_item WHERE CURRENT OF cProcesso
FETCH  cProcesso INTO @nrItem
END
  ```

#### `sp_exp_calcula`

| Field | Content |
| --- | --- |
| **Name** | `sp_exp_calcula` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TEMPRESA_NAC`, `TGRUPO`, `TPROCESSO`, `TPROCESSO_EMBALAGEM`, `TPROCESSO_EXP`, `TPROCESSO_EXP_ITEM`, `TPROCESSO_EXP_PEDIDO`, `TPROCESSO_PALETIZACAO` |
| **Tables written** | `UPDATE TPROCESSO_EXP`, `UPDATE TPROCESSO` |
| **Parameters** | `@NR_PROCESSO CHAR(18))` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPROCESSO_EXP_ITEM` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO_EXP_ITEM
SET  VL_TOT_PESO_BRUTO = @PB_ITEM                                WHERE CURRENT OF CPROCESSO
FETCH  CPROCESSO INTO @NR_SEQ_FETCH, @PL_ITEM
END
  ```

- **CLEAR**: Updates records in `TPROCESSO_EMBALAGEM` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO_EMBALAGEM
SET  PB_EMBALAGEM = CONVERT(NUMERIC(18, 5), ROUND(@VL_PB, 7))                      FROM TPROCESSO_EMBALAGEM  (NOLOCK)                   WHERE NR_PROCESSO = @NR_PROCESSO
-- PESO LÍQUIDO MENOR PESO BRUTO, RETORNA QUE O USUÁRIO NÃO TEM ATENÇÃO NO QUE FAZ
IF  @VL_PB < @VL_PL
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET  VL_SEGURO_MNEG = @VL_SEGURO  ,                     VL_SEGURO_MN   = @VL_SEGURO                         WHERE NR_PROCESSO  = @NR_PROCESSO
END
-- ACHANDO VALOR DE CUBAGEM DA PALETIZAÇÃO, SE EXISTIR(KLEBER 29/05/2007)
  ```

- **CLEAR**: Removes outdated or cancelled records from `#TMP_PALLET`.
  ```sql
DELETE  #TMP_PALLET                             WHERE TX_CAMINHO = @TX_CAMINHO
END                                     DROP TABLE #TMP_PALLET
END
-- VALOR FOB = TOTAL DOS ITENS MENOS O DESCONTO
  ```

#### `sp_exp_duplica`

| Field | Content |
| --- | --- |
| **Name** | `sp_exp_duplica` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TPROCESSO_EXP`, `TPROCESSO_EXP_DESP`, `TPROCESSO_EXP_ITEM`, `TPROCESSO_EXP_NF`, `TPROCESSO_EXP_RE` |
| **Tables written** | `INSERT TPROCESSO_EXP` |
| **Parameters** | `@nr_processo_fonte char(18)`, `@nr_processo_destino char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TPROCESSO_EXP`.
  ```sql
INSERT  INTO TPROCESSO_EXP     ( NR_PROCESSO, CD_EXPORTADOR, CD_IMPORTADOR, CD_DESPACHANTE, CD_AGENTE, CD_INCOTERM, CD_PAIS_DESTINO, CD_MOEDA,      CD_VIA_TRANSPORTE, CD_SEGURADORA, CD_REPRESENTANTE, CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_URF_DESPACHO, CD_URF_DESTINO,      CD_TERMO_PAGTO, CD_FORMA_PAGTO, CD_LINGUA_PEDIDO, CD_TIPO_FRETE, CD_USUARIO, CD_CARTA_CREDITO, CD_INST_NEGOC,      CD_CONSIGNATARIO, CD_NOTIFY1, CD_NOTIFY2, DT_REGISTRO_PEDIDO, DT_FATURA, IN_DRAWBACK, NR_LI, NR_FATURA,       VL_FRETE, VL_SEGURO, VL_PESO_BRUTO, VL_PESO_LIQUIDO, VL_DESCONTO, VL_COMISSAO_PERCENT, VL_TOT_ORIGEM, VL_TOT_CUBAGEM,      VL_TOT_FOB, VL_TOT_COM_AGENTE, VL_TOT_QTDE_PROD, VL_TOT_QTDE_EMBALAGEM, VL_TOT_MCV, VL_TX_CAMBIO, VL_TOT_CONTAINER,      VL_TOT_PALLETS, VL_TOT_EXW, TX_INF_EMBALAGEM, TX_DECL_EXPORTADOR, TX_TERMO_PAGTO, CD_TRANSPORTADORA, TP_CONSIGNATARIO,      TP_NOTIFY1, TP_NOTIFY2, QT_TOTAL_ITENS, TX_MARCACAO_VOLUME, TX_DECL_ADICIONAL, VL_TOT_DESPESA, NR_SD, NR_CERTIFICADO,      CD_LOCAL_EMISSAO, TX_OBSERVACAO, TX_CABECALHO,  DT_SD, IN_FABR_EXPO, CD_FABRICANTE, CD_PAIS_ORIGEM, TP_COPIA, TP_DOCUMENTO, CD_COPIA, CD_DOCUMENTO, IN_NUM_FAT_AUTO)
SELECT  @nr_processo_destino, CD_EXPORTADOR, CD_IMPORTADOR, CD_DESPACHANTE, CD_AGENTE, CD_INCOTERM, CD_PAIS_DESTINO, CD_MOEDA,           CD_VIA_TRANSPORTE, CD_SEGURADORA, CD_REPRESENTANTE, CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_URF_DESPACHO, CD_URF_DESTINO,           CD_TERMO_PAGTO, CD_FORMA_PAGTO, CD_LINGUA_PEDIDO, CD_TIPO_FRETE, CD_USUARIO, CD_CARTA_CREDITO, CD_INST_NEGOC,           CD_CONSIGNATARIO, CD_NOTIFY1, CD_NOTIFY2, DT_REGISTRO_PEDIDO, DT_FATURA, IN_DRAWBACK, NR_LI, NR_FATURA, VL_FRETE,           VL_SEGURO, VL_PESO_BRUTO, VL_PESO_LIQUIDO, VL_DESCONTO, VL_COMISSAO_PERCENT, VL_TOT_ORIGEM, VL_TOT_CUBAGEM,           VL_TOT_FOB, VL_TOT_COM_AGENTE, VL_TOT_QTDE_PROD, VL_TOT_QTDE_EMBALAGEM, VL_TOT_MCV, VL_TX_CAMBIO, VL_TOT_CONTAINER,           VL_TOT_PALLETS, VL_TOT_EXW, TX_INF_EMBALAGEM, TX_DECL_EXPORTADOR, TX_TERMO_PAGTO, CD_TRANSPORTADORA, TP_CONSIGNATARIO,           TP_NOTIFY1, TP_NOTIFY2, QT_TOTAL_ITENS, TX_MARCACAO_VOLUME, TX_DECL_ADICIONAL, VL_TOT_DESPESA, NR_SD, NR_CERTIFICADO,           CD_LOCAL_EMISSAO, TX_OBSERVACAO, TX_CABECALHO, DT_SD, IN_FABR_EXPO, CD_FABRICANTE, CD_PAIS_ORIGEM, TP_COPIA, TP_DOCUMENTO, CD_COPIA, CD_DOCUMENTO, IN_NUM_FAT_AUTO    FROM   TPROCESSO_EXP    WHERE  NR_PROCESSO = @nr_processo_fonte    /* Transferir dados do PE_ITENS */
INSERT  INTO TPROCESSO_EXP_ITEM     ( NR_PROCESSO, NR_ITEM, /*NR_PEDIDO_IMP, */CD_MERCADORIA, CD_NCM, CD_NALADI_SH, CD_UNID_MEDIDA, CD_EMBALAGEM, CD_CLASSIF_EMBALAGEM,      CD_FABR_EXPO, QT_POR_EMB, QT_EMBALAGEM, QT_MERCADORIA, VL_POR_EMB, VL_UNITARIO, VL_PESO_LIQ_UNIT, VL_COMPRIMENTO_EMB,      VL_LARGURA_EMB, VL_ALTURA_EMB, VL_PESO_EMB, VL_TOT_ITEM, VL_TOT_PESO_LIQ, VL_TOT_PESO_BRUTO, VL_CUBAGEM, VL_MLE, VL_MCV,                                                      TX_MERCADORIA, CD_EMBALAGEM_SUP, QT_POR_EMB_SUP, CD_EMBALAGEM_CLIENTE, CD_CLASSIF_EMBALAGEM_SUP, QT_EMBALAGEM_SUP, VL_POR_EMB_SUP,      CD_NORMAS, CD_FABRICANTE, NR_PEDIDO, CD_PAIS_ORIGEM, CD_ACORDO, CD_NCM_DOC, CD_NALADI_DOC )
SELECT  @nr_processo_destino, NR_ITEM, /*NR_PEDIDO_IMP, */CD_MERCADORIA, CD_NCM, CD_NALADI_SH, CD_UNID_MEDIDA, CD_EMBALAGEM, CD_CLASSIF_EMBALAGEM,           CD_FABR_EXPO, QT_POR_EMB, QT_EMBALAGEM, QT_MERCADORIA, VL_POR_EMB, VL_UNITARIO, VL_PESO_LIQ_UNIT, VL_COMPRIMENTO_EMB,           VL_LARGURA_EMB, VL_ALTURA_EMB, VL_PESO_EMB, VL_TOT_ITEM, VL_TOT_PESO_LIQ, VL_TOT_PESO_BRUTO, VL_CUBAGEM, VL_MLE, VL_MCV,                                                           TX_MERCADORIA, CD_EMBALAGEM_SUP, QT_POR_EMB_SUP, CD_EMBALAGEM_CLIENTE, CD_CLASSIF_EMBALAGEM_SUP, QT_EMBALAGEM_SUP, VL_POR_EMB_SUP,           CD_NORMAS, CD_FABRICANTE, NR_PEDIDO, CD_PAIS_ORIGEM, CD_ACORDO, CD_NCM_DOC, CD_NALADI_DOC    FROM   TPROCESSO_EXP_ITEM    WHERE NR_PROCESSO = @nr_processo_fonte
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TPROCESSO_EXP_ITEM`.
  ```sql
INSERT  INTO TPROCESSO_EXP_ITEM     ( NR_PROCESSO, NR_ITEM, /*NR_PEDIDO_IMP, */CD_MERCADORIA, CD_NCM, CD_NALADI_SH, CD_UNID_MEDIDA, CD_EMBALAGEM, CD_CLASSIF_EMBALAGEM,      CD_FABR_EXPO, QT_POR_EMB, QT_EMBALAGEM, QT_MERCADORIA, VL_POR_EMB, VL_UNITARIO, VL_PESO_LIQ_UNIT, VL_COMPRIMENTO_EMB,      VL_LARGURA_EMB, VL_ALTURA_EMB, VL_PESO_EMB, VL_TOT_ITEM, VL_TOT_PESO_LIQ, VL_TOT_PESO_BRUTO, VL_CUBAGEM, VL_MLE, VL_MCV,                                                      TX_MERCADORIA, CD_EMBALAGEM_SUP, QT_POR_EMB_SUP, CD_EMBALAGEM_CLIENTE, CD_CLASSIF_EMBALAGEM_SUP, QT_EMBALAGEM_SUP, VL_POR_EMB_SUP,      CD_NORMAS, CD_FABRICANTE, NR_PEDIDO, CD_PAIS_ORIGEM, CD_ACORDO, CD_NCM_DOC, CD_NALADI_DOC )
SELECT  @nr_processo_destino, NR_ITEM, /*NR_PEDIDO_IMP, */CD_MERCADORIA, CD_NCM, CD_NALADI_SH, CD_UNID_MEDIDA, CD_EMBALAGEM, CD_CLASSIF_EMBALAGEM,           CD_FABR_EXPO, QT_POR_EMB, QT_EMBALAGEM, QT_MERCADORIA, VL_POR_EMB, VL_UNITARIO, VL_PESO_LIQ_UNIT, VL_COMPRIMENTO_EMB,           VL_LARGURA_EMB, VL_ALTURA_EMB, VL_PESO_EMB, VL_TOT_ITEM, VL_TOT_PESO_LIQ, VL_TOT_PESO_BRUTO, VL_CUBAGEM, VL_MLE, VL_MCV,                                                           TX_MERCADORIA, CD_EMBALAGEM_SUP, QT_POR_EMB_SUP, CD_EMBALAGEM_CLIENTE, CD_CLASSIF_EMBALAGEM_SUP, QT_EMBALAGEM_SUP, VL_POR_EMB_SUP,           CD_NORMAS, CD_FABRICANTE, NR_PEDIDO, CD_PAIS_ORIGEM, CD_ACORDO, CD_NCM_DOC, CD_NALADI_DOC    FROM   TPROCESSO_EXP_ITEM    WHERE NR_PROCESSO = @nr_processo_fonte
INSERT  INTO TPROCESSO_EXP_DESP     ( NR_PROCESSO, NR_SEQUENCIA, CD_ITEM, VL_DESPESA )
SELECT  @nr_processo_destino, NR_SEQUENCIA, CD_ITEM, VL_DESPESA    FROM   TPROCESSO_EXP_DESP    WHERE  NR_PROCESSO = @nr_processo_fonte
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TPROCESSO_EXP_DESP`.
  ```sql
INSERT  INTO TPROCESSO_EXP_DESP     ( NR_PROCESSO, NR_SEQUENCIA, CD_ITEM, VL_DESPESA )
SELECT  @nr_processo_destino, NR_SEQUENCIA, CD_ITEM, VL_DESPESA    FROM   TPROCESSO_EXP_DESP    WHERE  NR_PROCESSO = @nr_processo_fonte
INSERT  INTO TPROCESSO_EXP_RE     ( NR_PROCESSO, NR_RE, DT_RE, CD_NBM_SH, VL_FOB, QT_PESO_LIQ )
SELECT  @nr_processo_destino,  NR_RE, DT_RE, CD_NBM_SH, VL_FOB, QT_PESO_LIQ    FROM   TPROCESSO_EXP_RE    WHERE  NR_PROCESSO = @nr_processo_fonte
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TPROCESSO_EXP_RE`.
  ```sql
INSERT  INTO TPROCESSO_EXP_RE     ( NR_PROCESSO, NR_RE, DT_RE, CD_NBM_SH, VL_FOB, QT_PESO_LIQ )
SELECT  @nr_processo_destino,  NR_RE, DT_RE, CD_NBM_SH, VL_FOB, QT_PESO_LIQ    FROM   TPROCESSO_EXP_RE    WHERE  NR_PROCESSO = @nr_processo_fonte
INSERT  INTO TPROCESSO_EXP_NF     ( NR_PROCESSO, NR_NF )
SELECT  @nr_processo_destino,  NR_NF    FROM   TPROCESSO_EXP_NF    WHERE  NR_PROCESSO = @nr_processo_fonte    RETURN (0)
  ```

#### `sp_exp_exclui`

| Field | Content |
| --- | --- |
| **Name** | `sp_exp_exclui` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TPROCESSO_EXP`, `TPROCESSO_EXP_DESP`, `TPROCESSO_EXP_ITEM`, `TPROCESSO_EXP_NF`, `TPROCESSO_EXP_NF_ITEM`, `TPROCESSO_EXP_RE` |
| **Tables written** | `DELETE TPROCESSO_EXP` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `TPROCESSO_EXP`. (Developer note: 'alterado para não excluir NF pois a tela está também na manutenção (kleber 03072')
  ```sql
DELETE  FROM TPROCESSO_EXP                 WHERE ( NR_PROCESSO = @nr_processo )
DELETE  FROM TPROCESSO_EXP_ITEM       WHERE ( NR_PROCESSO = @nr_processo )
DELETE  FROM TPROCESSO_EXP_DESP      WHERE ( NR_PROCESSO = @nr_processo )
DELETE  FROM TPROCESSO_EXP_RE           WHERE ( NR_PROCESSO = @nr_processo )
  ```

- **CLEAR**: Removes outdated or cancelled records from `TPROCESSO_EXP_ITEM`. (Developer note: 'alterado para não excluir NF pois a tela está também na manutenção (kleber 03072')
  ```sql
DELETE  FROM TPROCESSO_EXP_ITEM       WHERE ( NR_PROCESSO = @nr_processo )
DELETE  FROM TPROCESSO_EXP_DESP      WHERE ( NR_PROCESSO = @nr_processo )
DELETE  FROM TPROCESSO_EXP_RE           WHERE ( NR_PROCESSO = @nr_processo )
-- alterado para não excluir NF pois a tela está também na manutenção (kleber 03/07/2007)  --
  ```

- **CLEAR**: Removes outdated or cancelled records from `TPROCESSO_EXP_DESP`. (Developer note: 'alterado para não excluir NF pois a tela está também na manutenção (kleber 03072')
  ```sql
DELETE  FROM TPROCESSO_EXP_DESP      WHERE ( NR_PROCESSO = @nr_processo )
DELETE  FROM TPROCESSO_EXP_RE           WHERE ( NR_PROCESSO = @nr_processo )
-- alterado para não excluir NF pois a tela está também na manutenção (kleber 03/07/2007)  --
DELETE  FROM TPROCESSO_EXP_NF           WHERE ( NR_PROCESSO = @nr_processo )
  ```

- **CLEAR**: Removes outdated or cancelled records from `TPROCESSO_EXP_RE`. (Developer note: 'alterado para não excluir NF pois a tela está também na manutenção (kleber 03072')
  ```sql
DELETE  FROM TPROCESSO_EXP_RE           WHERE ( NR_PROCESSO = @nr_processo )
-- alterado para não excluir NF pois a tela está também na manutenção (kleber 03/07/2007)  --
DELETE  FROM TPROCESSO_EXP_NF           WHERE ( NR_PROCESSO = @nr_processo )
--
  ```

#### `sp_exp_insere_gestao`

| Field | Content |
| --- | --- |
| **Name** | `sp_exp_insere_gestao` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TPROCESSO` |
| **Tables written** | `UPDATE TPROCESSO_EXP` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPROCESSO_EXP` based on process parameters or status transitions. (Developer note: 'VL_FRETE = CASE P.VL_FRETE_COLLECT_MNEG                        WHEN 0 THEN P.VL_')
  ```sql
UPDATE  TPROCESSO_EXP
SET     CD_EXPORTADOR = CASE E.CD_EXPORTADOR WHEN '' THEN P.CD_CLIENTE
ELSE  E.CD_EXPORTADOR
END ,         CD_IMPORTADOR = CASE E.CD_IMPORTADOR WHEN '' THEN P.CD_EMP_EST
  ```

#### `sp_exp_monta_re`

| Field | Content |
| --- | --- |
| **Name** | `sp_exp_monta_re` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `MYINDAIA`, `TEMPRESA_EST`, `TEMPRESA_NAC`, `TMERCADORIA_EXP`, `TNCM`, `TPROCESSO`, `TPROCESSO_EXP`, `TPROCESSO_EXP_ITEM`, `TRE_ANEXO`, `TRE_ANEXO_PURO`, `TRE_CAPA`, `TTERMO_PAGTO`, `TUNID_MEDIDA_BROKER` |
| **Tables written** | `UPDATE TPROCESSO_EXP` |
| **Parameters** | `@NR_PROCESSO CHAR(18)` |
| **Calls** | `SP_EXP_CALCULA` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `TRE_CAPA`. (Developer note: 'COLOCA TODOS OS ITENS DO PROCESSO EM UMA TABELA TEMPORARIA, ONDE IREMOS PASSAR U')
  ```sql
DELETE  FROM TRE_CAPA WHERE NR_PROCESSO = @NR_PROCESSO
DELETE  FROM TRE_ANEXO WHERE NR_PROCESSO = @NR_PROCESSO
DELETE  FROM TRE_ANEXO_PURO WHERE NR_PROCESSO = @NR_PROCESSO
--*/        -- COLOCA TODOS OS ITENS DO PROCESSO EM UMA TABELA TEMPORARIA, ONDE IREMOS PASSAR UM POR UM E JOGAREMOS NAS DEVIDAS RE          -- RESPEITANDO AS REGRAS DE DRAWBACK E CNPJ DO FABRICANTE/EXPORTADOR
  ```

- **CLEAR**: Removes outdated or cancelled records from `TRE_ANEXO`. (Developer note: 'COLOCA TODOS OS ITENS DO PROCESSO EM UMA TABELA TEMPORARIA, ONDE IREMOS PASSAR U')
  ```sql
DELETE  FROM TRE_ANEXO WHERE NR_PROCESSO = @NR_PROCESSO
DELETE  FROM TRE_ANEXO_PURO WHERE NR_PROCESSO = @NR_PROCESSO
--*/        -- COLOCA TODOS OS ITENS DO PROCESSO EM UMA TABELA TEMPORARIA, ONDE IREMOS PASSAR UM POR UM E JOGAREMOS NAS DEVIDAS RE          -- RESPEITANDO AS REGRAS DE DRAWBACK E CNPJ DO FABRICANTE/EXPORTADOR
SELECT  PEI.*, ISNULL(ME.IN_IMPORTADO, '0') AS IN_IMPORTADO        INTO #TMP_ITENS_PROCESSOS        FROM TPROCESSO_EXP_ITEM PEI            INNER JOIN TMERCADORIA_EXP ME (NOLOCK) ON ME.CD_MERCADORIA = PEI.CD_MERCADORIA        WHERE PEI.NR_PROCESSO = @NR_PROCESSO
  ```

- **CLEAR**: Removes outdated or cancelled records from `TRE_ANEXO_PURO`. (Developer note: 'COLOCA TODOS OS ITENS DO PROCESSO EM UMA TABELA TEMPORARIA, ONDE IREMOS PASSAR U')
  ```sql
DELETE  FROM TRE_ANEXO_PURO WHERE NR_PROCESSO = @NR_PROCESSO
--*/        -- COLOCA TODOS OS ITENS DO PROCESSO EM UMA TABELA TEMPORARIA, ONDE IREMOS PASSAR UM POR UM E JOGAREMOS NAS DEVIDAS RE          -- RESPEITANDO AS REGRAS DE DRAWBACK E CNPJ DO FABRICANTE/EXPORTADOR
SELECT  PEI.*, ISNULL(ME.IN_IMPORTADO, '0') AS IN_IMPORTADO        INTO #TMP_ITENS_PROCESSOS        FROM TPROCESSO_EXP_ITEM PEI            INNER JOIN TMERCADORIA_EXP ME (NOLOCK) ON ME.CD_MERCADORIA = PEI.CD_MERCADORIA        WHERE PEI.NR_PROCESSO = @NR_PROCESSO
EXEC  SP_EXP_CALCULA @NR_PROCESSO
  ```

- **CLEAR**: Executes dependent procedure `SP_EXP_CALCULA` to propagate workflow updates. (Developer note: 'COLOCA TODOS OS ITENS DO PROCESSO EM UMA TABELA TEMPORARIA, ONDE IREMOS PASSAR U')
  ```sql
EXEC  SP_EXP_CALCULA @NR_PROCESSO
DECLARE  @ITEM_ATUAL              CHAR(3)
DECLARE  @NR_PROCESSO_COMPLEMENTO CHAR(3)
DECLARE  @ULT_NR_ATO_CONCESSORIO  CHAR(13)
  ```

#### `sp_gerar_master`

| Field | Content |
| --- | --- |
| **Name** | `sp_gerar_master` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TINSTRUCAO_CARGA`, `TMASTER`, `TMASTER_CARGA`, `TPROCESSO`, `TPROCESSO_CNTR`, `TPROCESSO_DESPESAS`, `TPRODUTO`, `TPROPOSTA_FRETE_DESPESA`, `TTEMP_HOUSE`, `TTP_CNTR`, `TVIAGEM` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@cd_unid_neg char(2)`, `@cd_produto char(2)`, `@cd_via_transp char(2)`, `@cd_transp char(4)`, `@cd_agente char(4)`, `@cd_origem char(4)`, `@cd_destino char(4)`, `@cd_moeda char(3)`, `@nr_master char(20)`, `@tp_master char(1)`, `@cd_usuario char(4)`, `@cd_master varchar(15)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TMASTER_CARGA(CD_MASTER,CD_CARGA,QTDE,VL_COMPR,VL_LARG,VL_ALT,PESO_KG,CUBAGEM_VENDA,PESO_VOLUMETRICO,TP_ESTUFAGEM,TP_EMBALAGEM,TP_CNTR,PESO_TON,VL_COMPRA,VL_COMPRA_ARMADOR)`. (Developer note: 'DESCONHECIDO')
  ```sql
INSERT  INTO TMASTER_CARGA(CD_MASTER,CD_CARGA,QTDE,VL_COMPR,VL_LARG,VL_ALT,PESO_KG,CUBAGEM_VENDA,PESO_VOLUMETRICO,TP_ESTUFAGEM,TP_EMBALAGEM,TP_CNTR,PESO_TON,VL_COMPRA,VL_COMPRA_ARMADOR)
SELECT  @ult_cd_master, CD_CARGA, QTDE, VL_COMPR, VL_LARG, VL_ALT, PESO_KG, CUBAGEM_VENDA, PESO_VOLUMETRICO, TP_ESTUFAGEM, TP_EMBALAGEM, TP_CNTR, PESO_TON, VL_COMPRA, VL_COMPRA         FROM TINSTRUCAO_CARGA        WHERE NR_PROCESSO = (
SELECT  TOP 1 NR_PROCESSO           FROM TTEMP_HOUSE)
DECLARE  @TONELADA FLOAT
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TMASTER(CD_MASTER,`. (Developer note: 'DESCONHECIDO')
  ```sql
INSERT  INTO TMASTER(CD_MASTER, CD_UNID_NEG, CD_PRODUTO, CD_VIA_TRANSP, NR_MASTER, IN_CALC_PROFIT, TP_FRETE_MASTER,                        TP_MASTER, CD_AGENTE, CD_CIA_TRANSP, CD_ARMADOR, CD_MOEDA, CD_ORIGEM, CD_DESTINO, TP_ESTUFAGEM,        VL_CUBAGEM, GROSS_MASTER, CHARG_MASTER, VOL_MASTER, CD_VEICULO, NR_VOO, DT_PREV_CHEGADA, DT_CHEGADA,        DT_MASTER, DT_EMBARQUE)         VALUES(@ult_cd_master, @cd_unid_neg, @cd_produto, @cd_via_transp, @nr_master, '0', @tp_frete, @tp_master,                @cd_agente, CASE @cd_via_transp WHEN '04' THEN @cd_transp
ELSE  NULL
END ,                CASE @cd_via_transp WHEN '01' THEN @cd_transp
ELSE  NULL
  ```

- **CLEAR**: Inserts new tracking/workflow records into `THOUSE(CD_MASTER,`. (Developer note: 'DESCONHECIDO')
  ```sql
INSERT  INTO THOUSE(CD_MASTER, NR_MASTER, CD_HOUSE, NR_PROCESSO, NR_HOUSE, IN_ESTORNO)
SELECT  substring(@ult_cd_master,1,15), substring(@nr_master,1,14), substring((@ult_cd_master + '/'+ H.CODIGO ),1,20) CD_HOUSE,                substring(H.NR_PROCESSO,1,15), substring(H.NR_HOUSE,1,14), '0'           FROM TTEMP_HOUSE H         WHERE H.CD_USUARIO = @cd_usuario
-- INSERINDO FRETE
INSERT  INTO TPROCESSO_DESPESAS ( NR_PROCESSO, CD_ITEM, TP_BASE_CALCULO, CD_DESP, VL_VENDA, VL_BASE_AG, VL_BASE_CLI )
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TPROCESSO_DESPESAS`. (Developer note: 'DESCONHECIDO')
  ```sql
INSERT  INTO TPROCESSO_DESPESAS ( NR_PROCESSO, CD_ITEM, TP_BASE_CALCULO, CD_DESP, VL_VENDA, VL_BASE_AG, VL_BASE_CLI )
SELECT  TOP 1 TH.NR_PROCESSO, '001', '3', '0', PR.VL_FRETE, PR.VL_FRETE, PR.VL_FRETE         FROM TTEMP_HOUSE TH, TPROCESSO PR        WHERE PR.NR_PROCESSO = TH.NR_PROCESSO
-- INSERINDO OUTRAS DESPESAS
INSERT  INTO TPROCESSO_DESPESAS (NR_PROCESSO, CD_ITEM, TP_BASE_CALCULO, TP_ORIGEM_DESPESA, VL_BASE_DESPESA,                                     VL_COMPRA_AG, VL_COMPRA_CIA, VL_VENDA, IN_DESPESA, IN_MENCIONADO, CD_TAB_REF, TP_FRETE,                                     TP_ESTUFAGEM, CD_DESP, IN_REPASSA, VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL,       VL_BASE_AG, VL_BASE_CLI,IN_PROFIT, CD_MOEDA_VENDA, CD_MOEDA)
  ```

#### `sp_marca_transferencia_risc`

| Field | Content |
| --- | --- |
| **Name** | `sp_marca_transferencia_risc` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | None identified directly |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_marca_transferencia_risc    Script Date: 020919')
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET  IN_RISC_ATUALIZADO = '1'         WHERE ( IN_RISC_ATUALIZADO = '0')
  ```

#### `sp_nac_gera_di`

| Field | Content |
| --- | --- |
| **Name** | `sp_nac_gera_di` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TDECLARACAO_IMPORTACAO`, `TNAC`, `TNAC_ITEM` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET     VL_TOT_MLE_MNEG     = ROUND( (
SELECT  ROUND( SUM( ISNULL( I.VL_MLE_MNEG, 0 ) ), 2 )                                          FROM   TNAC_ITEM I                                          WHERE  I.NR_PROCESSO = N.NR_PROCESSO ), 2 ),           VL_TOTAL_MLE_MN     = ROUND( (
SELECT  ROUND( SUM( ISNULL( I.VL_MLE_MNEG, 0 ) * I.TX_MLE ), 2 )                                          FROM   TNAC_ITEM I                                          WHERE  I.NR_PROCESSO = N.NR_PROCESSO ), 2 ),           VL_TOT_FRT_PREPAID  = ROUND( (
  ```

#### `sp_origina_recebimento_ag`

| Field | Content |
| --- | --- |
| **Name** | `sp_origina_recebimento_ag` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TBANCO`, `TCAIXA`, `TFAVORECIDO`, `TPARAMETROS`, `TRECEBIMENTO_AG`, `TRECEBIMENTO_PROCESSO`, `TRECEBIMENTO_PROCESSO_ITEM`, `TTAXA_FRETE` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@nr_recebimento char(6)`, `@cd_unid_neg char(2)`, `@cd_cliente char(5)`, `@nr_recebimento_ag char(6)`, `@dt_recebimento datetime` |
| **Calls** | `sp_atz_status_solic_pagto_ag`, `em`, `sp_solic_pagto_proc_vinc` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TRECEBIMENTO_PROCESSO_ITEM`. (Developer note: 'CRIA UM TEMP PARA ALOCAR OS PROCESSOS DE AGENCIAMENTO')
  ```sql
INSERT  INTO TRECEBIMENTO_PROCESSO_ITEM (NR_RECEBIMENTO, CD_CLIENTE, CD_UNID_NEG, NR_LANC_RECEB,                    NR_LANCAMENTO, NR_PROCESSO, NR_SOLICITACAO, CD_ITEM, VL_SOLICITADO, VL_RECEBIDO,                    IN_CANCELADO, CD_MOEDA_VENDA, VL_VENDA, CD_MOEDA_COMPRA, VL_COMPRA, VL_TARIFARIO,                    CD_BANCO_ITEM, VL_ADICIONAL_ITEM)        VALUES      (@nr_ult_recebimento, @cd_cliente, SUBSTRING(@nr_processo_vinc,1,2), @nr_lanc_processo,                     @nr_lanc_item, @nr_processo_vinc, @nr_solic_vinc, @cd_item, @vl_solic_item, @vl_recebido_item,                     '0', @cd_moeda_venda, @vl_venda_item, @cd_moeda_compra, @vl_compra_item, @vl_tarifario,                     @cd_banco_extra, @vl_adicional_item)
UPDATE  TNUMERARIO_NOTIFICA_ITEM
SET  CD_STATUS = 'B',             VL_RECEBIDO = @vl_recebido_item + @vl_adicional_item          WHERE NR_PROCESSO = @nr_processo_vinc AND NR_SOLICITACAO = @nr_solic_vinc           AND CD_ITEM = @cd_item
SET  @nr_lanc_item = @nr_lanc_item + 1
  ```

- **CLEAR**: Updates records in `TNUMERARIO_NOTIFICA_ITEM` based on process parameters or status transitions. (Developer note: 'CRIA UM TEMP PARA ALOCAR OS PROCESSOS DE AGENCIAMENTO')
  ```sql
UPDATE  TNUMERARIO_NOTIFICA_ITEM
SET  CD_STATUS = 'B',             VL_RECEBIDO = @vl_recebido_item + @vl_adicional_item          WHERE NR_PROCESSO = @nr_processo_vinc AND NR_SOLICITACAO = @nr_solic_vinc           AND CD_ITEM = @cd_item
SET  @nr_lanc_item = @nr_lanc_item + 1
DELETE  FROM #TM_ITEM WHERE CD_ITEM = @cd_item
  ```

- **CLEAR**: Removes outdated or cancelled records from `#TM_ITEM`. (Developer note: 'CRIA UM TEMP PARA ALOCAR OS PROCESSOS DE AGENCIAMENTO')
  ```sql
DELETE  FROM #TM_ITEM WHERE CD_ITEM = @cd_item
END        DROP TABLE #TM_ITEM
INSERT  INTO TRECEBIMENTO_PROCESSO (NR_RECEBIMENTO, CD_CLIENTE, CD_UNID_NEG, NR_LANC_RECEB,                    NR_PROCESSO, NR_SOLICITACAO, VL_SOLICITADO, VL_RECEBIDO, IN_CANCELADO, CD_STATUS,                     DT_TARIFARIO, VL_ADICIONAL)     VALUES      (@nr_ult_recebimento, @cd_cliente, SUBSTRING(@nr_processo_vinc,1,2), @nr_lanc_processo,                  @nr_processo_vinc, @nr_solic_vinc, @vl_solic_processo_vinc, @vl_receb_processo_vinc, '0', 'B',                  @dt_tarifario, @vl_adic_processo_vinc)
UPDATE  TNUMERARIO_NOTIFICA
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TRECEBIMENTO_PROCESSO`. (Developer note: 'CRIA UM TEMP PARA ALOCAR OS PROCESSOS DE AGENCIAMENTO')
  ```sql
INSERT  INTO TRECEBIMENTO_PROCESSO (NR_RECEBIMENTO, CD_CLIENTE, CD_UNID_NEG, NR_LANC_RECEB,                    NR_PROCESSO, NR_SOLICITACAO, VL_SOLICITADO, VL_RECEBIDO, IN_CANCELADO, CD_STATUS,                     DT_TARIFARIO, VL_ADICIONAL)     VALUES      (@nr_ult_recebimento, @cd_cliente, SUBSTRING(@nr_processo_vinc,1,2), @nr_lanc_processo,                  @nr_processo_vinc, @nr_solic_vinc, @vl_solic_processo_vinc, @vl_receb_processo_vinc, '0', 'B',                  @dt_tarifario, @vl_adic_processo_vinc)
UPDATE  TNUMERARIO_NOTIFICA
SET  VL_RECEBIDO = @vl_receb_processo_vinc + @vl_adic_processo_vinc,          CD_STATUS = 'B'      WHERE NR_PROCESSO = @nr_processo_vinc AND NR_SOLICITACAO = @nr_solic_vinc
UPDATE  TPROCESSO
  ```

#### `sp_pe_estorno_exp`

| Field | Content |
| --- | --- |
| **Name** | `sp_pe_estorno_exp` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TPE_ITEM`, `TPROCESSO_EXP`, `TPROCESSO_EXP_DESP`, `TPROCESSO_EXP_ITEM` |
| **Tables written** | `UPDATE TPROCESSO_EXP`, `DELETE TPROCESSO_EXP` |
| **Parameters** | `@nr_proc_controle char(18)`, `@nr_proc_pe char(18)`, `@cd_unid_neg char(2)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPE_ITEM` based on process parameters or status transitions. (Developer note: 'ITEM DA EXP')
  ```sql
UPDATE  TPE_ITEM
SET  QT_BAIXADA = (@nQtBai - @nQt_MERCADORIA),          QT_DISPONIVEL = (@nQT_MERCADORIA + @nQtDisp),          IN_SELECIONADO = '0',          IN_MONTADO = '0'     WHERE (NR_PROCESSO = @nr_proc_pe) AND          (NR_ITEM = @cnr_item_pe) AND          (CD_UNID_NEG = @cd_unid_neg)
IF  (@nQt_MERCADORIA+@nQtDisp) = @nQtBaixada
UPDATE  TPE_ITEM
  ```

- **CLEAR**: Updates records in `TPE_ITEM` based on process parameters or status transitions. (Developer note: 'ITEM DA EXP')
  ```sql
UPDATE  TPE_ITEM
SET  QT_DISPONIVEL = 0         WHERE (NR_PROCESSO = @nr_proc_pe)  AND               (NR_ITEM = @cnr_item_pe) AND               (CD_UNID_NEG = @cd_unid_neg)
IF  @nQtde = @nNrItem
BEGIN
  ```

- **CLEAR**: Removes outdated or cancelled records from `TPROCESSO_EXP_ITEM`. (Developer note: 'ITEM DA EXP')
  ```sql
DELETE  FROM TPROCESSO_EXP_ITEM               WHERE (NR_PROCESSO = @NR_PROC_CONTROLE) AND                   (nr_proc_pe  = @nr_proc_pe)
IF  (@nTotItem1 = @nTotItem2) AND (@nTotItem1 <> 0)
BEGIN
DELETE  FROM TPROCESSO_EXP_DESP WHERE (NR_PROCESSO = @NR_PROC_CONTROLE)
  ```

- **CLEAR**: Removes outdated or cancelled records from `TPROCESSO_EXP_DESP`. (Developer note: 'ITEM DA EXP')
  ```sql
DELETE  FROM TPROCESSO_EXP_DESP WHERE (NR_PROCESSO = @NR_PROC_CONTROLE)
END
END
SELECT  @lEntrou = 1
  ```

#### `sp_pe_monta_exp`

| Field | Content |
| --- | --- |
| **Name** | `sp_pe_monta_exp` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TACORDO_PAIS`, `TEMPRESA_EST`, `TMERC_EXP_ACORDO`, `TPE`, `TPE_ITEM`, `TPREPARA_PE_ITEM`, `TPROCESSO_EXP`, `TPROCESSO_EXP_ITEM` |
| **Tables written** | `INSERT TPROCESSO_EXP`, `UPDATE TPROCESSO_EXP` |
| **Parameters** | `@nr_proc_controle char(18)`, `@cd_unid_neg char(2)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TPROCESSO_EXP`. (Developer note: 'CAPA')
  ```sql
INSERT  INTO TPROCESSO_EXP           ( NR_PROCESSO, CD_EXPORTADOR, CD_IMPORTADOR, CD_DESPACHANTE, CD_AGENTE, CD_INCOTERM, CD_PAIS_DESTINO, CD_MOEDA,             CD_VIA_TRANSPORTE, CD_SEGURADORA, CD_REPRESENTANTE, CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_URF_DESPACHO,             CD_URF_DESTINO, CD_TERMO_PAGTO, CD_FORMA_PAGTO, CD_LINGUA_PEDIDO, CD_TIPO_FRETE, CD_USUARIO, CD_CARTA_CREDITO,             CD_INST_NEGOC, CD_CONSIGNATARIO, CD_NOTIFY1, CD_NOTIFY2, DT_REGISTRO_PEDIDO, DT_FATURA, IN_DRAWBACK, NR_LI,             NR_FATURA, VL_FRETE, VL_SEGURO, VL_PESO_BRUTO, VL_PESO_LIQUIDO, VL_DESCONTO, VL_COMISSAO_PERCENT, VL_TOT_ORIGEM,             VL_TOT_CUBAGEM, VL_TOT_FOB, VL_TOT_COM_AGENTE, VL_TOT_QTDE_PROD, VL_TOT_QTDE_EMBALAGEM, VL_TOT_MCV, VL_TX_CAMBIO,             VL_TOT_CONTAINER, VL_TOT_PALLETS, VL_TOT_EXW, CD_TRANSPORTADORA, TP_CONSIGNATARIO, TP_NOTIFY1, TP_NOTIFY2, IN_NUM_FAT_AUTO)         VALUES            ( @nr_proc_controle, @cd_exportador, @cd_importador, @cd_despachante, @cd_agente, @cd_incoterm, @cd_pais_destino, @cd_moeda,             @cd_via_transporte, @cd_seguradora, @cd_representante, @cd_local_origem, @cd_local_destino, @cd_urf_despacho,              @cd_urf_destino, @cd_termo_pagto, @cd_forma_pagto, @cd_lingua_pedido, @cd_tipo_frete, @cd_usuario, @cd_carta_credito,             @cd_inst_negoc, @cd_consignatario, @cd_notify1, @cd_notify2, @dt_registro_pedido, @dt_fatura, @in_drawback, @nr_li,             @nr_fatura, @vl_frete, @vl_seguro, @vl_peso_bruto, @vl_peso_liquido, @vl_desconto, @vl_comissao_percent, @vl_tot_origem,             @vl_tot_cubagem, @vl_tot_fob, @vl_tot_com_agente, @vl_tot_qtde_prod, @vl_tot_qtde_embalagem, @vl_tot_mcv, @vl_tx_cambio,             @vl_tot_container, @vl_tot_pallets, @vl_tot_exw, @cd_transportadora, @tp_consignatario, @tp_notify1, @tp_notify2, '1' )
END
UPDATE  TPROCESSO_EXP
SET     TX_DECL_EXPORTADOR = B.TX_OBS_IMP       FROM   TPROCESSO_EXP A,             TEMPRESA_EST B      WHERE  B.CD_EMPRESA = @cd_importador AND             A.NR_PROCESSO = @nr_proc_controle
  ```

- **CLEAR**: Updates records in `TPROCESSO_EXP` based on process parameters or status transitions. (Developer note: 'CAPA')
  ```sql
UPDATE  TPROCESSO_EXP
SET     TX_DECL_EXPORTADOR = B.TX_OBS_IMP       FROM   TPROCESSO_EXP A,             TEMPRESA_EST B      WHERE  B.CD_EMPRESA = @cd_importador AND             A.NR_PROCESSO = @nr_proc_controle
SELECT  @nEntrou2 = 1
END
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TPROCESSO_EXP_ITEM`. (Developer note: 'CAPA')
  ```sql
INSERT  INTO TPROCESSO_EXP_ITEM       ( NR_PROCESSO, NR_ITEM, CD_MERCADORIA, CD_NCM, CD_NALADI_SH, CD_UNID_MEDIDA, CD_EMBALAGEM, CD_CLASSIF_EMBALAGEM,        CD_FABR_EXPO, QT_POR_EMB, QT_EMBALAGEM, QT_MERCADORIA, VL_POR_EMB, VL_UNITARIO, VL_PESO_LIQ_UNIT, VL_COMPRIMENTO_EMB,        VL_LARGURA_EMB, VL_ALTURA_EMB, VL_PESO_EMB, VL_TOT_ITEM, VL_TOT_PESO_LIQ, VL_TOT_PESO_BRUTO, VL_CUBAGEM, VL_MLE,        VL_MCV, NR_PROC_PE, NR_ITEM_PE, CD_EMBALAGEM_SUP, CD_CLASSIF_EMBALAGEM_SUP, QT_POR_EMB_SUP, QT_EMBALAGEM_SUP, VL_POR_EMB_SUP,         CD_EMBALAGEM_CLIENTE, CD_NCM_DOC, NR_SEQ_NCM_DOC, CD_NALADI_DOC, NR_SEQ_NALADI_DOC, CD_ACORDO, CD_NORMAS, NR_PEDIDO_IMP,        VL_FRETE )    VALUES      ( @nr_proc_controle, @cItem, @cd_mercadoria, @cd_ncm, @cd_naladi_sh, @cd_unid_medida, @cd_embalagem, @cd_classif_embalagem,        @cd_fabr_expo, @qt_por_emb, @qt_embalagem, @qt_mercadoria, @vl_por_emb, @vl_unitario, @vl_peso_liq_unit, @vl_comprimento_emb,        @vl_largura_emb, @vl_altura_emb, @vl_peso_emb, @vl_tot_item, @vl_tot_peso_liq, @vl_tot_peso_bruto, @vl_cubagem, @vl_mle,        @vl_mcv, @nr_proc, @cNrItem, @cd_embalagem_sup, @cd_classif_embalagem_sup, @qt_por_emb_sup, @qt_embalagem_sup, @vl_por_emb_sup,         @cd_embalagem_cliente, @cd_ncm_doc, @nr_seq_ncm_doc, @cd_naladi_doc, @nr_seq_naladi_doc, @cd_acordo, @cd_norma, @nr_proc,        @vl_frete_item )
--
IF  ENTRAR, CALCULA ITEM BAIXADO TOTAL
IF  (
  ```

- **CLEAR**: Updates records in `TPE_ITEM` based on process parameters or status transitions. (Developer note: 'CAPA')
  ```sql
UPDATE  TPE_ITEM
SET     IN_MONTADO = '1',             QT_BAIXADA = @QT_MERCADORIA,             QT_DISPONIVEL = @nQtDispo      WHERE  NR_PROCESSO = @nr_proc AND              NR_ITEM = @cNrItem AND              CD_UNID_NEG = @cd_unid_neg
SELECT  @nVlTotItem = @VL_TOT_ITEM
SELECT  @nQtInicial = @QT_MERCADORIA
  ```

#### `sp_po_estorno_di`

| Field | Content |
| --- | --- |
| **Name** | `sp_po_estorno_di` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TACRESCIMO_VALORACAO`, `TADICAO_DE_IMPORTACAO`, `TATO_VINCULADO`, `TDECLARACAO_IMPORTACAO`, `TDEDUCAO_VALORACAO`, `TDESTAQUE_NCM`, `TDETALHE_MERCADORIA`, `TDI_NVE`, `TDOCUMENTO_VINCULADO`, `TPAGAMENTO_PREVISTO`, `TPAGAMENTO_VINCULADO`, `TPO`, `TPO_ITEM`, `TPREPARA_PO`, `TPREPARA_PO_ITEM`, `TRIBUTO`, `TVALORACAO_NCM` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO`, `DELETE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_proc_controle char(18)`, `@nr_proc_po char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `TPO_ITEM` based on process parameters or status transitions. (Developer note: 'ITEM DA DI')
  ```sql
UPDATE  TPO_ITEM
SET     QT_BAIXADA_DI = ISNULL(QT_BAIXADA_DI - @nQT_Merc_de_acordo_com_proc,0),           QT_DISPONIVEL = ISNULL(QT_DISPONIVEL + @nQT_Merc_de_acordo_com_proc,0),           QT_BAIXAR     = 0,           IN_SELECIONADO = '0',           IN_MONTADO = '0' ,           CD_USUARIO_MONTA = ''     WHERE  ( NR_PROCESSO = @NR_PROC_PO ) AND           ( NR_ITEM = @cNR_ITEM_PO )
UPDATE  TPO
SET     QT_TOTAL_DISPONIVEL = ROUND( (
  ```

- **CLEAR**: Updates records in `TPO` based on process parameters or status transitions. (Developer note: 'ITEM DA DI')
  ```sql
UPDATE  TPO
SET     QT_TOTAL_DISPONIVEL = ROUND( (
SELECT  SUM( ISNULL( QT_INICIAL, 0 ) - ISNULL( QT_BAIXADA_DI, 0) - ISNULL( QT_BAIXADA_LI, 0 ) )                                          FROM   TPO_ITEM I                                          WHERE  I.NR_PROCESSO = P.NR_PROCESSO ), 5 ),           CD_USUARIO_MONTA = ''     FROM   TPO P    WHERE  NR_PROCESSO = @NR_PROC_PO
UPDATE  TPREPARA_PO_ITEM
  ```

- **CLEAR**: Updates records in `TPREPARA_PO_ITEM` based on process parameters or status transitions. (Developer note: 'ITEM DA DI')
  ```sql
UPDATE  TPREPARA_PO_ITEM
SET     QT_BAIXADA = ISNULL( QT_BAIXADA - @nQT_Merc_de_acordo_com_proc, 0 ),           IN_MONTADO = '0'     WHERE  ( NR_PROCESSO = @nr_proc_controle ) AND                    ( NR_ITEM = @cNR_ITEM_PO ) AND                    ( TP_PROCESSO = 1 )
IF  @nQtde = @nNrItem
BEGIN
  ```

- **CLEAR**: Removes outdated or cancelled records from `TDETALHE_MERCADORIA`. (Developer note: 'ITEM DA DI')
  ```sql
DELETE  FROM TDETALHE_MERCADORIA       WHERE  ( NR_PROCESSO = @NR_PROC_CONTROLE ) AND             ( NR_PROC_PO  = @NR_PROC_PO ) AND             ( NR_ADICAO   = @cNR_ADICAO )
IF  ( @nTotItem1 = @nTotItem2 ) AND ( @nTotItem1 <> 0 )
BEGIN
DELETE  FROM TADICAO_DE_IMPORTACAO WHERE ( NR_PROCESSO = @NR_PROC_CONTROLE ) AND ( NR_ADICAO = @cNR_ADICAO )
  ```

#### `sp_po_monta_di`

| Field | Content |
| --- | --- |
| **Name** | `sp_po_monta_di` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TCONVERSAO_CAMBIO`, `TDECLARACAO_IMPORTACAO`, `TDETALHE_MERCADORIA`, `TDOCUMENTO_INSTRUCAO`, `TPO`, `TPO_ITEM`, `TPREPARA_PO_ITEM`, `TPROCESSO`, `TREF_CLIENTE`, `TUSUARIO` |
| **Tables written** | `UPDATE TPROCESSO`, `INSERT TDECLARACAO_IMPORTACAO`, `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_proc_controle char(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TREF_CLIENTE`. (Developer note: 'Monta o processo de DI   CREATE  PROCEDURE [dbo].[sp_po_monta_di]( @nr_proc_cont')
  ```sql
INSERT  TREF_CLIENTE ( NR_PROCESSO, NR_SEQUENCIA, CD_REFERENCIA, NR_ITEM_PO )        VALUES ( @nr_proc_controle, RIGHT( '000' + CONVERT( varchar, @ult_sequencia ), 3 ), @cd_referencia, '0000' )
END
FETCH  c_RefCli INTO @cd_referencia
END
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TDOCUMENTO_INSTRUCAO`. (Developer note: 'Monta o processo de DI   CREATE  PROCEDURE [dbo].[sp_po_monta_di]( @nr_proc_cont')
  ```sql
INSERT  TDOCUMENTO_INSTRUCAO ( NR_PROCESSO, NR_SEQUENCIA, CD_TIPO_DCTO_INSTR, NR_DCTO_INSTRUCAO )          VALUES ( @nr_proc_controle, RIGHT( '00' + CONVERT( varchar, @ult_sequencia ), 2 ), '01', @nNR_FATURA )
END
END
SELECT  @nQT_INICIAL_EST_TOTAL = SUM( ISNULL( QT_INICIAL_EST, 0 ) )      FROM   TPO_ITEM (NOLOCK)      WHERE  ( NR_PROCESSO = @nNR_PROC )        AND  ( CD_USUARIO_MONTA = @cd_usuario )
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'Monta o processo de DI   CREATE  PROCEDURE [dbo].[sp_po_monta_di]( @nr_proc_cont')
  ```sql
UPDATE  TPROCESSO
SET     NR_DA = @nr_da        WHERE  NR_PROCESSO = @nr_proc_controle
END
END
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TDECLARACAO_IMPORTACAO`. (Developer note: 'Monta o processo de DI   CREATE  PROCEDURE [dbo].[sp_po_monta_di]( @nr_proc_cont')
  ```sql
INSERT  INTO TDECLARACAO_IMPORTACAO (          NR_PROCESSO,          CD_BANDEIRA_TRANSP,   CD_IMPORTADOR,           CD_LOCAL_EMBARQUE,       CD_METODO_VALORACAO,          CD_MODALIDADE_PAGTO,  CD_MOEDA_FRETE,       CD_MOTIVO_SEM_COBERTURA, CD_RECINTO_ALFAND,       CD_SETOR_ARMAZENAM,            CD_TIPO_DECLARACAO,   CD_TRANSPORTADOR,     CD_URF_DESPACHO,         CD_URF_ENTR_CARGA,       DT_CHEGADA_CARGA,          NM_VEICULO_TRANSP,    NR_DCTO_CARGA,        NR_DCTO_CARGA_MAST,      NR_IDENTIFICACAO_COM,    NR_MANIFESTO,          NR_VEICULO_TRANSP,    PC_COMISSAO,          IN_MOEDA_UNICA,          CD_MOEDA_MLE,            NR_AGENTE_CARGA,          CD_PAIS_PROC_CARGA,   CD_VIA_TRANSP_CARG,   CD_TIPO_DCTO_CARGA,      IN_REPASSA_DADOS_ADICAO, CD_FORNECEDOR,          CD_FABRICANTE,        CD_AUSENCIA_FABRIC,   CD_PAIS_AQUIS_MERC,      CD_PAIS_ORIG_MERC,       CD_PRESENCA_CARGA,          CD_INCOTERM,          CD_MOEDA_SEGURO,      VL_TOT_FRT_PREPAID,      VL_TOT_FRT_COLLECT,      VL_TOT_SEGURO_MNEG,          PB_CARGA,             PL_CARGA        )        VALUES (          @NR_PROC_CONTROLE,    @cCD_BANDEIRA_VEIC,   @cCD_IMPORTADOR,         @cd_local_embarque,      @cCD_MET_VALORACAO_ADUAN,          @cCD_MOD_PAGAMENTO,   @cCD_MOEDA_FRETE,     @cCD_MOTIVO_SEM_COBERT,  @cd_recinto,             @cd_setor,           @cCD_TP_DECLARACAO,   @cCD_TRANSP_INTERN,   @cd_urf_despacho,        @cd_urf_entrada,         @dDT_CHEGADA_CARGA,          @nm_embarcacao,       @nr_conhecimento,     @nr_conhecimento_master, @nNM_IDENT_CRT,          @nNR_MANIFESTO,          @nNR_PLACA_VEICULO,   @nPC_COMISSAO,        0,                       @MoedaNeg,               @nr_cgc_agente,          @cd_pais_procedencia, @cd_via_transp,       @cCD_TIPO_DCTO_CARGA,    '0',                     NULL,          NULL,                 @in_fabr_expor_imp,   NULL,                    NULL,                    @nr_presenca_carga,          @cCD_INCOTERM,        @cCD_MOEDA_FRETE,     @VlFretePrepTotal,       @VlFreteColTotal,        @nVl_Seg,          @nPesoBruto,          @nPesoLiq        )
END
SELECT  @nEntrou2 = 1
END
  ```

#### `sp_rateia_cambio`

| Field | Content |
| --- | --- |
| **Name** | `sp_rateia_cambio` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TCONVERSAO_CAMBIO`, `TDECLARACAO_IMPORTACAO`, `TPAGAMENTO_PREVISTO`, `TPAGAMENTO_VINCULADO`, `TPAGTO_PREVISTO_CAMBIO_DI` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@NR_PROCESSO CHAR(18)` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `TPAGAMENTO_VINCULADO`.
  ```sql
DELETE  FROM TPAGAMENTO_VINCULADO           WHERE  ( NR_PROCESSO = @NR_PROCESSO ) AND ( NR_ADICAO = @NR_ADICAO )
DELETE  FROM TPAGAMENTO_PREVISTO           WHERE  ( NR_PROCESSO = @NR_PROCESSO ) AND ( NR_ADICAO = @NR_ADICAO )
FETCH  C_ADICOES INTO @NR_PROCESSO, @NR_ADICAO, @TIPO_CAMBIO, @CINCOTERMS
END
  ```

- **CLEAR**: Removes outdated or cancelled records from `TPAGAMENTO_PREVISTO`.
  ```sql
DELETE  FROM TPAGAMENTO_PREVISTO           WHERE  ( NR_PROCESSO = @NR_PROCESSO ) AND ( NR_ADICAO = @NR_ADICAO )
FETCH  C_ADICOES INTO @NR_PROCESSO, @NR_ADICAO, @TIPO_CAMBIO, @CINCOTERMS
END
CLOSE  C_ADICOES
  ```

- **CLEAR**: Updates records in `TDECLARACAO_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TDECLARACAO_IMPORTACAO
SET     VL_TOTAL_CAMBIO = ROUND( @TOTAL_CAMBIO, 2 )        WHERE  NR_PROCESSO = @NR_PROCESSO
SELECT  @TIPO_CAMBIO = (
SELECT  CD_COBERTURA_CAMBIAL                                 FROM   TDECLARACAO_IMPORTACAO  (NOLOCK)                               WHERE  NR_PROCESSO = @NR_PROCESSO )
  ```

- **CLEAR**: Updates records in `TADICAO_DE_IMPORTACAO` based on process parameters or status transitions.
  ```sql
UPDATE  TADICAO_DE_IMPORTACAO
SET     CD_COBERT_CAMBIAL = ISNULL( @CD_COBERTURA, CD_COBERT_CAMBIAL ),               CD_MOTIVO_SEM_COB = ISNULL( @CD_MOTIVO, CD_MOTIVO_SEM_COB ),               NR_ROF = ISNULL( @NR_ROF, NR_ROF ),               CD_MODALIDADE_PGTO = ISNULL( @CD_MODALIDADE, CD_MODALIDADE_PGTO ),               CD_ORGAO_FIN_INTER = ISNULL( @CD_ORGAO, CD_ORGAO_FIN_INTER ),               VL_FINANC_SUP_360 = 0,               VL_TOT_FINANC_360 = 0        WHERE  NR_PROCESSO = @NR_PROCESSO
DECLARE  C_ADICOES CURSOR FOR
SELECT  NR_PROCESSO, NR_ADICAO, VL_MERC_COND_VENDA          FROM   TADICAO_DE_IMPORTACAO (NOLOCK)         WHERE  ( NR_PROCESSO = @NR_PROCESSO )
  ```

#### `sp_rel_desp_arm`

| Field | Content |
| --- | --- |
| **Name** | `sp_rel_desp_arm` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TDECLARACAO_IMPORTACAO`, `TPROCESSO`, `TREL_DESP_ARM` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@cd_unid_neg char(2)`, `@cd_produto char(2)`, `@dt_inicio char(10)`, `@dt_fim char(10)`, `@cd_armazem_descarga char(4)`, `@nr_controle int`, `@nr_identificador int` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TREL_DESP_ARM`.
  ```sql
INSERT  TREL_DESP_ARM ( NR_IDENTIFICADOR, CD_UNID_NEG, CD_PRODUTO, NR_DI, NR_PROCESSO, NM_URGENCIA, NM_ARMAZEM )
SELECT  @nr_identificador, P.CD_UNID_NEG, P.CD_PRODUTO, DI.NR_DECLARACAO_IMP NR_DI, P.NR_PROCESSO, Y.TX_YESNO NM_URGENCIA, ARM.NM_ARMAZEM      FROM   TPROCESSO P (NOLOCK),             TDECLARACAO_IMPORTACAO DI (NOLOCK),             TYES_NO Y (NOLOCK),             TARMAZEM ARM (NOLOCK),             VW_DT_DESEMB DESEMB (NOLOCK),             VW_DT_REG_DI REGDI (NOLOCK)      WHERE  @cd_unid_neg IN ( P.CD_UNID_NEG, 'X' ) AND             @cd_produto IN ( P.CD_PRODUTO, 'X' ) AND             @cd_armazem_descarga IN ( P.CD_ARMAZEM_DESCARGA, 'X' ) AND             P.NR_PROCESSO = DI.NR_PROCESSO AND             P.NR_PROCESSO *= DESEMB.NR_PROCESSO AND             P.NR_PROCESSO = REGDI.NR_PROCESSO AND             P.CD_ARMAZEM_DESCARGA *= ARM.CD_ARMAZEM AND             P.IN_URGENTE = Y.CD_YESNO AND             P.IN_IMP_ARM = '0' AND             DI.NR_DECLARACAO_IMP IS NOT NULL AND             DI.NR_DECLARACAO_IMP <> '' AND             CONVERT( datetime, REGDI.DT_REALIZACAO, 103 ) >= ( CONVERT( datetime, @dt_inicio, 103 ) ) AND             CONVERT( datetime, REGDI.DT_REALIZACAO, 103 ) <= ( CONVERT( datetime, @dt_fim, 103 ) ) AND             CONVERT( datetime, DESEMB.DT_REALIZACAO, 103 ) >= ( CONVERT( datetime, @dt_inicio, 103 ) ) AND             CONVERT( datetime, DESEMB.DT_REALIZACAO, 103 ) <= ( CONVERT( datetime, @dt_fim, 103 ) ) AND             REGDI.DT_REALIZACAO IS NOT NULL AND             DESEMB.DT_REALIZACAO IS NOT NULL AND             ISNULL( P.CD_ARMAZEM_DESCARGA, '' ) <> ''
UPDATE  TPROCESSO
SET     IN_IMP_ARM = '1'                FROM   TPROCESSO P, TREL_DESP_ARM R    WHERE  P.NR_PROCESSO = R.NR_PROCESSO
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET     IN_IMP_ARM = '1'                FROM   TPROCESSO P, TREL_DESP_ARM R    WHERE  P.NR_PROCESSO = R.NR_PROCESSO
END
  ```

#### `sp_rel_desp_arm2`

| Field | Content |
| --- | --- |
| **Name** | `sp_rel_desp_arm2` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TDECLARACAO_IMPORTACAO`, `TPROCESSO` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | `@nr_processo char(18)`, `@nr_identificador int` |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `TREL_DESP_ARM`.
  ```sql
INSERT  TREL_DESP_ARM ( NR_IDENTIFICADOR, CD_UNID_NEG, CD_PRODUTO, NR_DI, NR_PROCESSO, NM_URGENCIA, NM_ARMAZEM )
SELECT  @nr_identificador, P.CD_UNID_NEG, P.CD_PRODUTO, DI.NR_DECLARACAO_IMP NR_DI, P.NR_PROCESSO, Y.TX_YESNO NM_URGENCIA, ARM.NM_ARMAZEM      FROM   TPROCESSO P (NOLOCK),             TDECLARACAO_IMPORTACAO DI (NOLOCK),             TYES_NO Y (NOLOCK),             TARMAZEM ARM (NOLOCK),             VW_DT_DESEMB DESEMB (NOLOCK),             VW_DT_REG_DI REGDI (NOLOCK)      WHERE  P.NR_PROCESSO = @nr_processo AND             P.NR_PROCESSO = DI.NR_PROCESSO AND             P.NR_PROCESSO *= DESEMB.NR_PROCESSO AND             P.NR_PROCESSO = REGDI.NR_PROCESSO AND             P.CD_ARMAZEM_DESCARGA *= ARM.CD_ARMAZEM AND             P.IN_URGENTE = Y.CD_YESNO AND             P.IN_IMP_ARM = '0' AND             DI.NR_DECLARACAO_IMP IS NOT NULL AND             DI.NR_DECLARACAO_IMP <> '' AND             REGDI.DT_REALIZACAO IS NOT NULL AND             DESEMB.DT_REALIZACAO IS NOT NULL AND             ISNULL( P.CD_ARMAZEM_DESCARGA, '' ) <> ''
UPDATE  TPROCESSO
SET     IN_IMP_ARM = '1'               FROM   TPROCESSO P, TREL_DESP_ARM R               WHERE  P.NR_PROCESSO = R.NR_PROCESSO
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET     IN_IMP_ARM = '1'               FROM   TPROCESSO P, TREL_DESP_ARM R               WHERE  P.NR_PROCESSO = R.NR_PROCESSO
  ```

#### `sp_soma_tributos`

| Field | Content |
| --- | --- |
| **Name** | `sp_soma_tributos` |
| **Source** | `store_procedures_BROKER.csv` |
| **Type** | `procedure` |
| **Tables read** | `TADICAO_DE_IMPORTACAO`, `TPAGAMENTO_TRIBUTOS`, `TRIBUTO` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | `@nr_processo char(18)` |
| **Calls** | `sp_calc_taxa_siscomex` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Executes dependent procedure `sp_calc_taxa_siscomex` to propagate workflow updates. (Developer note: 'Object:  Stored Procedure dbo.sp_soma_tributos    Script Date: 02091999 08:58:12')
  ```sql
EXEC  sp_calc_taxa_siscomex @nr_processo, @vl_tot_siscomex output
UPDATE  tdeclaracao_importacao
SET  VL_TOTAL_II  = Round( @vl_tot_ii, 2 ),      VL_TOTAL_IPI = Round( @vl_tot_ipi, 2 ),      VL_TOTAL_AD  = Round( @vl_tot_ad, 2 ),      VL_TOT_ICMS  = Round( @vl_tot_icms, 2 )      where (nr_processo = @nr_processo)
IF  @vl_tot_ii > 0
  ```

- **CLEAR**: Updates records in `tdeclaracao_importacao` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_soma_tributos    Script Date: 02091999 08:58:12')
  ```sql
UPDATE  tdeclaracao_importacao
SET  VL_TOTAL_II  = Round( @vl_tot_ii, 2 ),      VL_TOTAL_IPI = Round( @vl_tot_ipi, 2 ),      VL_TOTAL_AD  = Round( @vl_tot_ad, 2 ),      VL_TOT_ICMS  = Round( @vl_tot_icms, 2 )      where (nr_processo = @nr_processo)
IF  @vl_tot_ii > 0
IF   (
  ```

- **CLEAR**: Updates records in `TPAGAMENTO_TRIBUTOS` based on process parameters or status transitions. (Developer note: 'Object:  Stored Procedure dbo.sp_soma_tributos    Script Date: 02091999 08:58:12')
  ```sql
UPDATE  TPAGAMENTO_TRIBUTOS
SET  VL_TRIBUTO_PAGO = @vl_tot_ii          where (nr_processo = @nr_processo and CD_RECEITA_PGTO = '0086')
END
ELSE
  ```

- **CLEAR**: Inserts new tracking/workflow records into `TPAGAMENTO_TRIBUTOS`. (Developer note: 'Object:  Stored Procedure dbo.sp_soma_tributos    Script Date: 02091999 08:58:12')
  ```sql
INSERT  into TPAGAMENTO_TRIBUTOS         ( nr_processo, cd_receita_pgto, vl_tributo_pago ) values        ( @nr_processo, '0086', @vl_tot_ii )
END
IF  @vl_tot_ipi > 0
IF   (
  ```


### Source File: `triggers_BROKER.csv`

#### `TR_INS_PROC`

| Field | Content |
| --- | --- |
| **Name** | `TR_INS_PROC` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TCLIENTE_HABILITACAO`, `TCLIENTE_SERVICO`, `TEMPRESA_NAC` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `AS`.
  ```sql
INSERT  AS
BEGIN
DECLARE  @TB_PROCESSOS AS TABLE (          NR_PROCESSO CHAR(18),          CD_UNID_NEG CHAR(2),          CD_PRODUTO  CHAR(2),          CD_CLIENTE  CHAR(5),          CD_SERVICO  CHAR(3)      )
DECLARE  @NR_PROCESSO   CHAR(18)
  ```

- **CLEAR**: Inserts new tracking/workflow records into `@TB_PROCESSOS`.
  ```sql
INSERT  INTO @TB_PROCESSOS
SELECT  NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_SERVICO      FROM INSERTED
WHILE  (
SELECT  COUNT(*) FROM @TB_PROCESSOS) > 0
  ```

- **CLEAR**: Removes outdated or cancelled records from `@TB_PROCESSOS`.
  ```sql
DELETE  @TB_PROCESSOS          WHERE NR_PROCESSO = @NR_PROCESSO
SELECT  @TP_TAB_SDA = ISNULL(H.TP_TAB_SDA, '0'),                 @CD_TAB_SDA = H.CD_TAB_SDA,                 @CD_GRUPO   = E.CD_GRUPO          FROM TCLIENTE_HABILITACAO H (NOLOCK)             INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = H.CD_CLIENTE          WHERE H.CD_UNID_NEG = @CD_UNID_NEG            AND H.CD_PRODUTO  = @CD_PRODUTO            AND H.CD_CLIENTE  = @CD_CLIENTE
IF  @TP_TAB_SDA = '2'
BEGIN
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET  CD_TAB_SDA = @CD_TAB_SDA,                  CD_GRUPO   = @CD_GRUPO              WHERE NR_PROCESSO = @NR_PROCESSO
END
ELSE
  ```

#### `TR_PROCESSO_EXP`

| Field | Content |
| --- | --- |
| **Name** | `TR_PROCESSO_EXP` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TCLIENTE_HABILITACAO`, `TPROCESSO`, `TPROCESSO_EXP` |
| **Tables written** | `UPDATE TPROCESSO_EXP`, `UPDATE TPROCESSO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | `SP_GRAVA_LOG` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`. (Developer note: 'CD_DESPACHANTE        = ISNULL(E.CD_DESPACHANTE, P.CD_DESPACHANTE), comentado by')
  ```sql
INSERT ,
UPDATE ,
DELETE  AS
DECLARE       @cd_usuario   char(4),      @cd_tabela    char(3),      @cd_movimento char(1),      @cd_modulo    char(2),      @cd_rotina    char(4),      @cd_chave     char(30),      @cd_moeda     char(3),      @vl_tx_moeda  numeric( 14, 7 ),      @nr_processo  char(18),      @in_num_fat_exp_aut char(1),      @in_num_fat_auto char(1),      @nr_fatura    varchar(15)
  ```

- **CLEAR**: Updates records in `,` based on process parameters or status transitions. (Developer note: 'CD_DESPACHANTE        = ISNULL(E.CD_DESPACHANTE, P.CD_DESPACHANTE), comentado by')
  ```sql
UPDATE ,
DELETE  AS
DECLARE       @cd_usuario   char(4),      @cd_tabela    char(3),      @cd_movimento char(1),      @cd_modulo    char(2),      @cd_rotina    char(4),      @cd_chave     char(30),      @cd_moeda     char(3),      @vl_tx_moeda  numeric( 14, 7 ),      @nr_processo  char(18),      @in_num_fat_exp_aut char(1),      @in_num_fat_auto char(1),      @nr_fatura    varchar(15)
IF  (
  ```

- **CLEAR**: Removes outdated or cancelled records from `AS`. (Developer note: 'CD_DESPACHANTE        = ISNULL(E.CD_DESPACHANTE, P.CD_DESPACHANTE), comentado by')
  ```sql
DELETE  AS
DECLARE       @cd_usuario   char(4),      @cd_tabela    char(3),      @cd_movimento char(1),      @cd_modulo    char(2),      @cd_rotina    char(4),      @cd_chave     char(30),      @cd_moeda     char(3),      @vl_tx_moeda  numeric( 14, 7 ),      @nr_processo  char(18),      @in_num_fat_exp_aut char(1),      @in_num_fat_auto char(1),      @nr_fatura    varchar(15)
IF  (
SELECT  COUNT(*) FROM INSERTED ) > 0
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions. (Developer note: 'CD_DESPACHANTE        = ISNULL(E.CD_DESPACHANTE, P.CD_DESPACHANTE), comentado by')
  ```sql
UPDATE  TPROCESSO
SET           CD_PAIS_ORIGEM        = ISNULL(E.CD_PAIS_ORIG, P.CD_PAIS_ORIGEM),          CD_LOCAL_EMBARQUE     = ISNULL(E.CD_LOCAL_ORIGEM, P.CD_LOCAL_EMBARQUE),          CD_LOCAL_DESEMBARQUE  = ISNULL(E.CD_LOCAL_DESTINO, P.CD_LOCAL_DESEMBARQUE),          CD_PAIS_DESTINO       = ISNULL(E.CD_PAIS_DESTINO, P.CD_PAIS_DESTINO),          TP_FRETE              = ISNULL(E.CD_TIPO_FRETE, P.TP_FRETE),          CD_REPRESENTANTE      = CASE WHEN RTRIM(LTRIM(ISNULL(E.CD_REPRESENTANTE, ''))) = ''                                      THEN P.CD_REPRESENTANTE
ELSE  E.CD_REPRESENTANTE
END ,                      CD_MOEDA_MLE          = ISNULL(E.CD_MOEDA, P.CD_MOEDA_MLE),          NR_DDE                = ISNULL(E.NR_DDE, P.NR_DDE),          CD_TRANSP_NAC         = ISNULL(E.CD_TRANSPORTADORA, P.CD_TRANSP_NAC),          NR_FATURA             = ISNULL(E.NR_FATURA, P.NR_FATURA),
  ```

#### `TR_TDI`

| Field | Content |
| --- | --- |
| **Name** | `TR_TDI` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TDA`, `TDECLARACAO_IMPORTACAO`, `TNAC`, `TPREVISAO` |
| **Tables written** | `UPDATE TDECLARACAO_IMPORTACAO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | `sp_pesq_tabela`, `sp_pesq_naveg`, `sp_atz_dt_vencto_da`, `SP_ATZ_CONHECIMENTO_CARGA_DI` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`. (Developer note: 'Conhecimento de Carga da Manutenção para a DI  Michel  20072010')
  ```sql
INSERT ,
UPDATE ,
DELETE    AS
DECLARE  @cd_usuario         char(4)
  ```

- **CLEAR**: Updates records in `,` based on process parameters or status transitions. (Developer note: 'Conhecimento de Carga da Manutenção para a DI  Michel  20072010')
  ```sql
UPDATE ,
DELETE    AS
DECLARE  @cd_usuario         char(4)
DECLARE  @cd_tabela          char(3)
  ```

- **CLEAR**: Removes outdated or cancelled records from `AS`. (Developer note: 'Conhecimento de Carga da Manutenção para a DI  Michel  20072010')
  ```sql
DELETE    AS
DECLARE  @cd_usuario         char(4)
DECLARE  @cd_tabela          char(3)
DECLARE  @cd_movimento       char(1)
  ```

- **CLEAR**: Executes dependent procedure `sp_pesq_tabela` to propagate workflow updates. (Developer note: 'Conhecimento de Carga da Manutenção para a DI  Michel  20072010')
  ```sql
EXEC  sp_pesq_tabela 'TDECLARACAO_IMPORTACAO', @cd_tabela OUTPUT  --
EXEC  sp_pesq_naveg @cd_usuario OUTPUT, @cd_modulo OUTPUT, @cd_rotina OUTPUT
IF  (
SELECT  COUNT(*) FROM INSERTED ) > 0
  ```

#### `TR_TEXPORTADOR_DI`

| Field | Content |
| --- | --- |
| **Name** | `TR_TEXPORTADOR_DI` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TDECLARACAO_IMPORTACAO` |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`.
  ```sql
INSERT ,
UPDATE ,
DELETE  AS
BEGIN
  ```

- **CLEAR**: Updates records in `,` based on process parameters or status transitions.
  ```sql
UPDATE ,
DELETE  AS
BEGIN
DECLARE  @NR_PROCESSO    CHAR(18)
  ```

- **CLEAR**: Removes outdated or cancelled records from `AS`.
  ```sql
DELETE  AS
BEGIN
DECLARE  @NR_PROCESSO    CHAR(18)
DECLARE  @TB_PROCESSOS AS TABLE (          NR_PROCESSO    CHAR(18)      )
  ```

- **CLEAR**: Inserts new tracking/workflow records into `@TB_PROCESSOS`.
  ```sql
INSERT  INTO @TB_PROCESSOS
SELECT  NR_PROCESSO      FROM INSERTED      UNION ALL
SELECT  NR_PROCESSO      FROM DELETED
WHILE  (
  ```

#### `TR_TNAC`

| Field | Content |
| --- | --- |
| **Name** | `TR_TNAC` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | None identified directly |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Removes outdated or cancelled records from `AS`.
  ```sql
DELETE    AS
DECLARE  @nr_processo char(18)
DECLARE  c_del_nac CURSOR LOCAL FOR
SELECT  NR_PROCESSO    FROM   DELETED
  ```

- **CLEAR**: Removes outdated or cancelled records from `TNAC_ITEM`.
  ```sql
DELETE  TNAC_ITEM      WHERE  NR_PROCESSO = @nr_processo
DELETE  TNAC_RET_MERC      WHERE  NR_PROCESSO = @nr_processo
UPDATE  TPROCESSO
SET     CD_ARMAZEM_ATRACACAO   = '',             CD_ARMAZEM_DESCARGA    = '',             CD_LOCAL_EMBARQUE      = '',             CD_LOCAL_DESEMBARQUE   = '',             CD_EMBARCACAO          = '',             NR_VIAGEM              = '',             NR_MANIFESTO           = '',             CD_INCOTERM            = '',             CD_AGENTE              = '',             CD_TRANSPORTADOR       = '',             CD_MOEDA_MLE           = '',             CD_MOEDA_FRETE         = '',             CD_MOEDA_SEGURO        = '',             TP_FRETE               = '',             DT_CONHECIMENTO        = NULL,             NR_CONHECIMENTO        = '',             NR_CONHECIMENTO_MASTER = '',             TX_MERCADORIA          = ''      WHERE  NR_PROCESSO            = @nr_processo
  ```

- **CLEAR**: Removes outdated or cancelled records from `TNAC_RET_MERC`.
  ```sql
DELETE  TNAC_RET_MERC      WHERE  NR_PROCESSO = @nr_processo
UPDATE  TPROCESSO
SET     CD_ARMAZEM_ATRACACAO   = '',             CD_ARMAZEM_DESCARGA    = '',             CD_LOCAL_EMBARQUE      = '',             CD_LOCAL_DESEMBARQUE   = '',             CD_EMBARCACAO          = '',             NR_VIAGEM              = '',             NR_MANIFESTO           = '',             CD_INCOTERM            = '',             CD_AGENTE              = '',             CD_TRANSPORTADOR       = '',             CD_MOEDA_MLE           = '',             CD_MOEDA_FRETE         = '',             CD_MOEDA_SEGURO        = '',             TP_FRETE               = '',             DT_CONHECIMENTO        = NULL,             NR_CONHECIMENTO        = '',             NR_CONHECIMENTO_MASTER = '',             TX_MERCADORIA          = ''      WHERE  NR_PROCESSO            = @nr_processo
END
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET     CD_ARMAZEM_ATRACACAO   = '',             CD_ARMAZEM_DESCARGA    = '',             CD_LOCAL_EMBARQUE      = '',             CD_LOCAL_DESEMBARQUE   = '',             CD_EMBARCACAO          = '',             NR_VIAGEM              = '',             NR_MANIFESTO           = '',             CD_INCOTERM            = '',             CD_AGENTE              = '',             CD_TRANSPORTADOR       = '',             CD_MOEDA_MLE           = '',             CD_MOEDA_FRETE         = '',             CD_MOEDA_SEGURO        = '',             TP_FRETE               = '',             DT_CONHECIMENTO        = NULL,             NR_CONHECIMENTO        = '',             NR_CONHECIMENTO_MASTER = '',             TX_MERCADORIA          = ''      WHERE  NR_PROCESSO            = @nr_processo
END
FETCH  c_del_nac INTO @nr_processo
  ```

#### `TR_TPROCESSO_NAVIO`

| Field | Content |
| --- | --- |
| **Name** | `TR_TPROCESSO_NAVIO` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | None identified directly |
| **Tables written** | `UPDATE TPROCESSO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Updates records in `AS` based on process parameters or status transitions.
  ```sql
UPDATE  AS
BEGIN
IF
UPDATE (CD_EMBARCACAO)
  ```

- **CLEAR**: Updates records in `(CD_EMBARCACAO)` based on process parameters or status transitions.
  ```sql
UPDATE (CD_EMBARCACAO)
BEGIN
DECLARE  @TB_PROCESSOS AS TABLE (NR_PROCESSO CHAR(18),                                      CD_EMBARCACAO_OLD CHAR(4),                                      CD_EMBARCACAO_NEW CHAR(4))
DECLARE  @NR_PROCESSO_OLD   CHAR(18)
  ```

- **CLEAR**: Inserts new tracking/workflow records into `@TB_PROCESSOS`.
  ```sql
INSERT  INTO @TB_PROCESSOS
SELECT  DISTINCT D.NR_PROCESSO, D.CD_EMBARCACAO, I.CD_EMBARCACAO     FROM DELETED D        INNER JOIN INSERTED I ON I.NR_PROCESSO = D.NR_PROCESSO
WHILE  (
SELECT  COUNT(*) FROM @TB_PROCESSOS) > 0
  ```

- **CLEAR**: Updates records in `TPROCESSO` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO
SET  DT_NAVIO_ALTERADO = GETDATE()         WHERE NR_PROCESSO = @NR_PROCESSO_OLD
DELETE  FROM @TB_PROCESSOS WHERE NR_PROCESSO = @NR_PROCESSO_OLD
END
  ```

#### `TR_UNID_NEG`

| Field | Content |
| --- | --- |
| **Name** | `TR_UNID_NEG` |
| **Source** | `triggers_BROKER.csv` |
| **Type** | `trigger` |
| **Tables read** | `TCLIENTE_BANCO_LIBERADO`, `TCLIENTE_CONTATO`, `TCLIENTE_CPMF`, `TCLIENTE_DOCUMENTO`, `TCLIENTE_FATURAMENTO`, `TCLIENTE_HABILITACAO`, `TCLIENTE_ICMS_SUL`, `TCLIENTE_ITEM_POR_TON`, `TCLIENTE_NUMERARIO`, `TCLIENTE_NUMERARIO_USD`, `TCLIENTE_REPASSE`, `TCLIENTE_REPRESENTANTE`, `TCLIENTE_SERVICO`, `TCLIENTE_TRANSPORTADOR`, `TITEM_PRIORIDADE`, `TRECEITAS_EXP`, `TRECEITAS_EXP_FAIXA`, `TRECEITAS_IMP`, `TUNID_NEG_PRODUTO` |
| **Tables written** | `DELETE TCLIENTE_SERVICO` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | `sp_pesq_tabela`, `sp_pesq_naveg` |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `,`. (Developer note: 'Object:  Trigger dbo.TR_UNID_NEG    Script Date: 23081999 15:58:37   CREATE TRIG')
  ```sql
INSERT ,
UPDATE ,
DELETE    AS
DECLARE  @cd_usuario CHAR(4)
  ```

- **CLEAR**: Updates records in `,` based on process parameters or status transitions. (Developer note: 'Object:  Trigger dbo.TR_UNID_NEG    Script Date: 23081999 15:58:37   CREATE TRIG')
  ```sql
UPDATE ,
DELETE    AS
DECLARE  @cd_usuario CHAR(4)
DECLARE  @cd_tabela CHAR(3)
  ```

- **CLEAR**: Removes outdated or cancelled records from `AS`. (Developer note: 'Object:  Trigger dbo.TR_UNID_NEG    Script Date: 23081999 15:58:37   CREATE TRIG')
  ```sql
DELETE    AS
DECLARE  @cd_usuario CHAR(4)
DECLARE  @cd_tabela CHAR(3)
DECLARE  @cd_movimento CHAR(1)
  ```

- **CLEAR**: Executes dependent procedure `sp_pesq_tabela` to propagate workflow updates. (Developer note: 'Object:  Trigger dbo.TR_UNID_NEG    Script Date: 23081999 15:58:37   CREATE TRIG')
  ```sql
EXEC  sp_pesq_tabela 'TUNID_NEG', @cd_tabela OUTPUT  --
EXEC  sp_pesq_naveg @cd_usuario OUTPUT, @cd_modulo OUTPUT, @cd_rotina OUTPUT
IF  (
SELECT  COUNT(*) FROM INSERTED) > 0
  ```


### Source File: `triggers_MYINDAIA.csv`

#### `TR_EMBALAGEM`

| Field | Content |
| --- | --- |
| **Name** | `TR_EMBALAGEM` |
| **Source** | `triggers_MYINDAIA.csv` |
| **Type** | `trigger` |
| **Tables read** | `TPROCESSO_EXP_PEDIDO` |
| **Tables written** | `UPDATE TPROCESSO_EXP` |
| **Parameters** | None (`trigger` / `view` or parameterless) |
| **Calls** | None |
| **Confidence** | `CLEAR` |

**Business Rule(s)**:

- **CLEAR**: Inserts new tracking/workflow records into `AS`.
  ```sql
INSERT   AS
DECLARE      @nrProcesso char(18),    @txEmbalagem varchar(512),    @txFinal varchar(1024)
SELECT  @nrProcesso = NR_PROCESSO FROM INSERTED
DECLARE  cEmbalagem CURSOR LOCAL FOR
  ```

- **CLEAR**: Updates records in `TPROCESSO_EXP` based on process parameters or status transitions.
  ```sql
UPDATE  TPROCESSO_EXP
SET  TX_EMBALAGEM = @txFinal WHERE NR_PROCESSO = @nrProcesso
CLOSE  cEmbalagem
DEALLOCATE  cEmbalagem
  ```

---

## Verification audit (performed by RL, not by the generating agent)

This file was produced by a delegated agent. It was then checked mechanically against the source
T-SQL rather than accepted on the agent's self-report.

| Check | Result |
| --- | --- |
| Routine sections in this document | 98 |
| Names resolving to a real routine in the source CSVs | **98 / 98** |
| Quoted SQL fragments checked | 332 |
| Fragments actually present in the corresponding routine body | **332 / 332** |
| Distinctive `TR_FOLLOWUP` claims independently probed | all confirmed (`TRIGGER_NESTLEVEL`, `@@SPID`, `TFOLLOWUP_IGNORE_TRIGGERS`, `FN_ADD_DIAS_UTEIS`, `SP_ATZ_DA_LOTE`, `01IE`, `BY CARLOS` comment, group `155`) |

No fabricated routine and no fabricated quotation was found.

### Two caveats that survive the audit

1. **The SQL quotes are abridged, not literal transcriptions.** They elide intermediate lines
   (`...`) and occasionally insert an explanatory comment marker. They matched the source only under
   whitespace- and punctuation-insensitive comparison. Treat them as *accurate pointers to real
   code*, not as exact reproductions — **re-read the source before quoting any of this to the client
   verbatim.**

2. **`PURPOSE UNCLEAR` appears zero times across all 98 routines.** The plan explicitly invited that
   verdict, and a set of 98 legacy routines in which every single purpose is clear is improbable on
   its face. The evidence checks above show the routines and quotes are real, so this is not
   fabrication — but it is a live risk that some *interpretations* are more confident than the code
   warrants. **Sample-read the interpretations before any of this reaches a client-facing artifact.**
   Priority for sampling: routines whose stated rule is broad or strategic-sounding, since those are
   where over-confident paraphrase does the most damage.

---

## Sampling verdict (RL, 2026-07-20) — read this before using the "Business Rule(s)" bullets

A stratified sample of the rule interpretations was read against the source T-SQL. The result
changes how this file should be used.

**The metadata tables are accurate and valuable.** Tables read, tables written, parameters, and
calls are correct and were verified. That is the reusable asset here.

**The "Business Rule(s)" bullets are not business rules.** They are mechanical paraphrase of the
adjacent statement:

- *"Executes dependent procedure `SP_ATZ_FOLLOWUP` to propagate workflow updates"* restates
  `EXEC SP_ATZ_FOLLOWUP` and adds nothing. The trailing clause is filler.
- *"Inserts new tracking/workflow records into `@EVENTOS`"* restates `INSERT INTO @EVENTOS`.
- In `SP_ATUALIZA_FOLLOWUP`, the same developer comment — truncated mid-word at
  `"...e verifi"` — is pasted into all four bullets as if it explained each one.

**What it missed in that same procedure** is the point:

- A fork on `DBO.FN_PROCESSO_SERVICO_NOVO(@NR_PROCESSO) = '0'` which routes to a *different legacy
  procedure* (`SP_ATZ_FOLLOWUP`). **There are two generations of the service model running side by
  side** — a materially important architectural fact for the migration, and it is not mentioned.
- Named event constants (`@CD_EVENTO_PREV_CHEGADA = '333'`), which are one of the few available
  routes to naming event codes without the client.

### Consequence

Do **not** invest in downgrading these bullets one by one — there is little of value to preserve.
Use this file for its **metadata**, and treat the genuine rule interpretation as **still outstanding
work**, best done against the routines that matter once we know which processes matter (i.e. after
item H tells us which services are real and high-volume).

The `TR_FOLLOWUP` decomposition is the exception: it was independently spot-checked and is
substantive and accurate. Trust that section.
