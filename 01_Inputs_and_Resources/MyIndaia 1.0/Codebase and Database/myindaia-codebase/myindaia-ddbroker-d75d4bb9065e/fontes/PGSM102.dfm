object datm_param_sistema: Tdatm_param_sistema
  OldCreateOrder = True
  Left = 224
  Top = 145
  Height = 464
  Width = 629
  object ds_parametros: TDataSource
    DataSet = qry_parametros_
    Left = 48
    Top = 24
  end
  object tbl_tp_instal_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TTP_INSTAL'
    Left = 156
    Top = 129
    object tbl_tp_instal_CD_INSTAL: TStringField
      FieldName = 'CD_INSTAL'
      Required = True
      Size = 1
    end
    object tbl_tp_instal_NM_INSTAL: TStringField
      FieldName = 'NM_INSTAL'
      Required = True
      Size = 15
    end
  end
  object ds_tp_instal: TDataSource
    DataSet = tbl_tp_instal_
    Left = 48
    Top = 129
  end
  object qry_parametros_: TQuery
    AfterOpen = qry_parametros_AfterOpen
    OnCalcFields = qry_parametros_CalcFields
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPARAMETROS')
    Left = 153
    Top = 24
    object qry_parametros_INDICE: TStringField
      FieldName = 'INDICE'
      Origin = 'TPARAMETROS.INDICE'
      Size = 1
    end
    object qry_parametros_DT_SOLIC_CH: TDateTimeField
      FieldName = 'DT_SOLIC_CH'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
    end
    object qry_parametros_NR_SOLIC_CH: TIntegerField
      FieldName = 'NR_SOLIC_CH'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
    end
    object qry_parametros_HM_PARA_SOLIC_CH: TStringField
      FieldName = 'HM_PARA_SOLIC_CH'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 5
    end
    object qry_parametros_PATH_RISC: TStringField
      FieldName = 'PATH_RISC'
      Origin = 'TPARAMETROS.PATH_RISC'
      Size = 100
    end
    object qry_parametros_CD_INSTALACAO: TStringField
      FieldName = 'CD_INSTALACAO'
      Origin = 'TPARAMETROS.CD_INSTALACAO'
      Size = 1
    end
    object qry_parametros_NM_SERVIDOR: TStringField
      FieldName = 'NM_SERVIDOR'
      Origin = 'TPARAMETROS.NM_SERVIDOR'
      Size = 15
    end
    object qry_parametros_NM_CID_CHEQUE: TStringField
      FieldName = 'NM_CID_CHEQUE'
      Origin = 'TPARAMETROS.NM_CID_CHEQUE'
    end
    object qry_parametros_CD_ITEM_SDA: TStringField
      FieldName = 'CD_ITEM_SDA'
      Origin = 'TPARAMETROS.CD_ITEM_SDA'
      Size = 3
    end
    object qry_parametros_CD_ITEM_RECEB_NUM: TStringField
      FieldName = 'CD_ITEM_RECEB_NUM'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_NUM'
      Size = 3
    end
    object qry_parametros_CD_ITEM_DEVOL_NUM: TStringField
      FieldName = 'CD_ITEM_DEVOL_NUM'
      Origin = 'TPARAMETROS.CD_ITEM_DEVOL_NUM'
      Size = 3
    end
    object qry_parametros_CD_ITEM_EXTOR_NUM: TStringField
      FieldName = 'CD_ITEM_EXTOR_NUM'
      Origin = 'TPARAMETROS.CD_ITEM_EXTOR_NUM'
      Size = 3
    end
    object qry_parametros_CD_ITEM_SALDO_CRE: TStringField
      FieldName = 'CD_ITEM_SALDO_CRE'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_CRE'
      Size = 3
    end
    object qry_parametros_CD_ITEM_SALDO_DEB: TStringField
      FieldName = 'CD_ITEM_SALDO_DEB'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_DEB'
      Size = 3
    end
    object qry_parametros_CD_ITEM_RECEB_SD: TStringField
      FieldName = 'CD_ITEM_RECEB_SD'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_SD'
      Size = 3
    end
    object qry_parametros_CD_ITEM_PAGTO_SD: TStringField
      FieldName = 'CD_ITEM_PAGTO_SD'
      Origin = 'TPARAMETROS.CD_ITEM_PAGTO_SD'
      Size = 3
    end
    object qry_parametros_CD_ITEM_IR: TStringField
      FieldName = 'CD_ITEM_IR'
      Origin = 'TPARAMETROS.CD_ITEM_IR'
      Size = 3
    end
    object qry_parametros_VL_ALIQ_IR: TFloatField
      FieldName = 'VL_ALIQ_IR'
      Origin = 'TPARAMETROS.VL_ALIQ_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_parametros_VL_MIN_IR: TFloatField
      DisplayWidth = 10
      FieldName = 'VL_MIN_IR'
      Origin = 'TPARAMETROS.VL_MIN_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_parametros_CD_ITEM_CPMF: TStringField
      FieldName = 'CD_ITEM_CPMF'
      Origin = 'TPARAMETROS.CD_ITEM_CPMF'
      Size = 3
    end
    object qry_parametros_CD_EV_REG_DI: TStringField
      FieldName = 'CD_EV_REG_DI'
      Origin = 'TPARAMETROS.CD_EV_REG_DI'
      Size = 3
    end
    object qry_parametros_CD_EV_DESEMB: TStringField
      FieldName = 'CD_EV_DESEMB'
      Origin = 'TPARAMETROS.CD_EV_DESEMB'
      Size = 3
    end
    object qry_parametros_CD_EV_PAGTO_LI: TStringField
      FieldName = 'CD_EV_PAGTO_LI'
      Origin = 'TPARAMETROS.CD_EV_PAGTO_LI'
      Size = 3
    end
    object qry_parametros_CD_EV_ENT: TStringField
      FieldName = 'CD_EV_ENT'
      Origin = 'TPARAMETROS.CD_EV_ENT'
      Size = 3
    end
    object qry_parametros_CD_EV_CHEGADA: TStringField
      FieldName = 'CD_EV_CHEGADA'
      Origin = 'TPARAMETROS.CD_EV_CHEGADA'
      Size = 3
    end
    object qry_parametros_CD_EV_ENT_SETPIN: TStringField
      FieldName = 'CD_EV_ENT_SETPIN'
      Origin = 'TPARAMETROS.CD_EV_ENT_SETPIN'
      Size = 3
    end
    object qry_parametros_CD_EV_SAI_SETPIN: TStringField
      FieldName = 'CD_EV_SAI_SETPIN'
      Origin = 'TPARAMETROS.CD_EV_SAI_SETPIN'
      Size = 3
    end
    object qry_parametros_CD_EV_DESCARGA: TStringField
      FieldName = 'CD_EV_DESCARGA'
      Origin = 'TPARAMETROS.CD_EV_DESCARGA'
      Size = 3
    end
    object qry_parametros_CD_ITEM_COMISSAO: TStringField
      FieldName = 'CD_ITEM_COMISSAO'
      Origin = 'TPARAMETROS.CD_ITEM_COMISSAO'
      Size = 3
    end
    object qry_parametros_CD_ITEM_EXPED: TStringField
      FieldName = 'CD_ITEM_EXPED'
      Origin = 'TPARAMETROS.CD_ITEM_EXPED'
      Size = 3
    end
    object qry_parametros_CD_EV_PREV_CHEGADA: TStringField
      FieldName = 'CD_EV_PREV_CHEGADA'
      Origin = 'TPARAMETROS.CD_EV_PREV_CHEGADA'
      Size = 3
    end
    object qry_parametros_CD_EV_ETD: TStringField
      FieldName = 'CD_EV_ETD'
      Origin = 'TPARAMETROS.CD_EV_ETD'
      Size = 3
    end
    object qry_parametros_CD_EV_PREV_DESEMB: TStringField
      FieldName = 'CD_EV_PREV_DESEMB'
      Origin = 'TPARAMETROS.CD_EV_PREV_DESEMB'
      Size = 3
    end
    object qry_parametros_CD_EV_CONHECIMENTO: TStringField
      FieldName = 'CD_EV_CONHECIMENTO'
      Origin = 'TPARAMETROS.CD_EV_CONHECIMENTO'
      Size = 3
    end
    object qry_parametros_CD_EV_RECEB_DOC: TStringField
      FieldName = 'CD_EV_RECEB_DOC'
      Origin = 'TPARAMETROS.CD_EV_RECEB_DOC'
      Size = 3
    end
    object qry_parametros_CD_ITEM_II: TStringField
      FieldName = 'CD_ITEM_II'
      Origin = 'TPARAMETROS.CD_ITEM_II'
      Size = 3
    end
    object qry_parametros_CD_ITEM_IPI: TStringField
      FieldName = 'CD_ITEM_IPI'
      Origin = 'TPARAMETROS.CD_ITEM_IPI'
      Size = 3
    end
    object qry_parametros_CD_ITEM_ICMS: TStringField
      FieldName = 'CD_ITEM_ICMS'
      Origin = 'TPARAMETROS.CD_ITEM_ICMS'
      Size = 3
    end
    object qry_parametros_CD_ITEM_FRETE_AEREO: TStringField
      FieldName = 'CD_ITEM_FRETE_AEREO'
      Origin = 'TPARAMETROS.CD_ITEM_FRETE_AEREO'
      Size = 3
    end
    object qry_parametros_CD_ITEM_FRETE_MAR: TStringField
      FieldName = 'CD_ITEM_FRETE_MAR'
      Origin = 'TPARAMETROS.CD_ITEM_FRETE_MAR'
      Size = 3
    end
    object qry_parametros_CD_ITEM_SEGURO: TStringField
      FieldName = 'CD_ITEM_SEGURO'
      Origin = 'TPARAMETROS.CD_ITEM_SEGURO'
      Size = 3
    end
    object qry_parametros_CD_ITEM_VMLE: TStringField
      FieldName = 'CD_ITEM_VMLE'
      Origin = 'TPARAMETROS.CD_ITEM_VMLE'
      Size = 3
    end
    object qry_parametros_CD_ITEM_ACRESC: TStringField
      FieldName = 'CD_ITEM_ACRESC'
      Origin = 'TPARAMETROS.CD_ITEM_ACRESC'
      Size = 3
    end
    object qry_parametros_CD_ITEM_DED: TStringField
      FieldName = 'CD_ITEM_DED'
      Origin = 'TPARAMETROS.CD_ITEM_DED'
      Size = 3
    end
    object qry_parametros_CD_ITEM_SISCOMEX: TStringField
      FieldName = 'CD_ITEM_SISCOMEX'
      Origin = 'TPARAMETROS.CD_ITEM_SISCOMEX'
      Size = 3
    end
    object qry_parametros_CD_ITEM_AFRMM: TStringField
      FieldName = 'CD_ITEM_AFRMM'
      Origin = 'TPARAMETROS.CD_ITEM_AFRMM'
      Size = 3
    end
    object qry_parametros_CD_GRP_ITEM_FRETE: TStringField
      FieldName = 'CD_GRP_ITEM_FRETE'
      Origin = 'TPARAMETROS.CD_GRP_ITEM_FRETE'
      Size = 2
    end
    object qry_parametros_CD_GRP_ITEM_ARM: TStringField
      FieldName = 'CD_GRP_ITEM_ARM'
      Origin = 'TPARAMETROS.CD_GRP_ITEM_ARM'
      Size = 2
    end
    object qry_parametros_CD_GRP_ITEM_CAP: TStringField
      FieldName = 'CD_GRP_ITEM_CAP'
      Origin = 'TPARAMETROS.CD_GRP_ITEM_CAP'
      Size = 2
    end
    object qry_parametros_PATH_CONTABIL: TStringField
      FieldName = 'PATH_CONTABIL'
      Origin = 'TPARAMETROS.PATH_CONTABIL'
      Size = 100
    end
    object qry_parametros_PATH_GSM_SERVER: TStringField
      FieldName = 'PATH_GSM_SERVER'
      Origin = 'TPARAMETROS.PATH_GSM_SERVER'
      Size = 100
    end
    object qry_parametros_PATH_GSM_CLIENT: TStringField
      FieldName = 'PATH_GSM_CLIENT'
      Origin = 'TPARAMETROS.PATH_GSM_CLIENT'
      Size = 100
    end
    object qry_parametros_CD_ITEM_DESP_ORIG: TStringField
      FieldName = 'CD_ITEM_DESP_ORIG'
      Origin = 'TPARAMETROS.CD_ITEM_DESP_ORIG'
      Size = 3
    end
    object qry_parametros_CD_EV_EMBARQUE: TStringField
      FieldName = 'CD_EV_EMBARQUE'
      Origin = 'TPARAMETROS.CD_EV_EMBARQUE'
      Size = 3
    end
    object qry_parametros_CD_FAV_SM: TStringField
      FieldName = 'CD_FAV_SM'
      Origin = 'TPARAMETROS.CD_FAV_SM'
      Size = 5
    end
    object qry_parametros_PATH_NF_DBF: TStringField
      FieldName = 'PATH_NF_DBF'
      Origin = 'TPARAMETROS.PATH_NF_DBF'
      Size = 100
    end
    object qry_parametros_CD_EV_DIG_DI: TStringField
      FieldName = 'CD_EV_DIG_DI'
      Origin = 'TPARAMETROS.CD_EV_DIG_DI'
      Size = 3
    end
    object qry_parametros_CD_EV_ENTREGA_MERC: TStringField
      FieldName = 'CD_EV_ENTREGA_MERC'
      Origin = 'TPARAMETROS.CD_EV_ENTREGA_MERC'
      Size = 3
    end
    object qry_parametros_CD_GRP_ITEM_DESP_DESPACHO: TStringField
      FieldName = 'CD_GRP_ITEM_DESP_DESPACHO'
      Origin = 'TPARAMETROS.CD_GRP_ITEM_DESP_DESPACHO'
      Size = 2
    end
    object qry_parametros_CD_EV_AVERBACAO: TStringField
      FieldName = 'CD_EV_AVERBACAO'
      Origin = 'TPARAMETROS.CD_EV_AVERBACAO'
      Size = 3
    end
    object qry_parametros_CD_EV_NUM_IMP: TStringField
      FieldName = 'CD_EV_NUM_IMP'
      Origin = 'TPARAMETROS.CD_EV_NUM_IMP'
      Size = 3
    end
    object qry_parametros_CD_EV_REC_IMP: TStringField
      FieldName = 'CD_EV_REC_IMP'
      Origin = 'TPARAMETROS.CD_EV_REC_IMP'
      Size = 3
    end
    object qry_parametros_CD_EV_PAG_ICMS: TStringField
      FieldName = 'CD_EV_PAG_ICMS'
      Origin = 'TPARAMETROS.CD_EV_PAG_ICMS'
      Size = 3
    end
    object qry_parametros_CD_EV_PAG_ARM: TStringField
      FieldName = 'CD_EV_PAG_ARM'
      Origin = 'TPARAMETROS.CD_EV_PAG_ARM'
      Size = 3
    end
    object qry_parametros_CD_EV_NUM_FRETE: TStringField
      FieldName = 'CD_EV_NUM_FRETE'
      Origin = 'TPARAMETROS.CD_EV_NUM_FRETE'
      Size = 3
    end
    object qry_parametros_CD_EV_REC_FRETE: TStringField
      FieldName = 'CD_EV_REC_FRETE'
      Origin = 'TPARAMETROS.CD_EV_REC_FRETE'
      Size = 3
    end
    object qry_parametros_CD_EV_ABRE_PROC: TStringField
      FieldName = 'CD_EV_ABRE_PROC'
      Origin = 'TPARAMETROS.CD_EV_ABRE_PROC'
      Size = 3
    end
    object qry_parametros_CD_EV_NUM_EXP: TStringField
      FieldName = 'CD_EV_NUM_EXP'
      Origin = 'TPARAMETROS.CD_EV_NUM_EXP'
      Size = 3
    end
    object qry_parametros_CD_EV_PAG_SDA: TStringField
      FieldName = 'CD_EV_PAG_SDA'
      Origin = 'TPARAMETROS.CD_EV_PAG_SDA'
      Size = 3
    end
    object qry_parametros_CD_GRP_ITEM_ARM_IE: TStringField
      FieldName = 'CD_GRP_ITEM_ARM_IE'
      Origin = 'TPARAMETROS.CD_GRP_ITEM_ARM_IE'
      Size = 2
    end
    object qry_parametros_CD_EV_RECEP_ANALISE: TStringField
      FieldName = 'CD_EV_RECEP_ANALISE'
      Origin = 'TPARAMETROS.CD_EV_RECEP_ANALISE'
      Size = 3
    end
    object qry_parametros_CD_EV_PREV_CHEG_EE: TStringField
      FieldName = 'CD_EV_PREV_CHEG_EE'
      Origin = 'TPARAMETROS.CD_EV_PREV_CHEG_EE'
      Size = 3
    end
    object qry_parametros_CD_ITEM_NVOCC: TStringField
      FieldName = 'CD_ITEM_NVOCC'
      Origin = 'TPARAMETROS.CD_ITEM_NVOCC'
      Size = 3
    end
    object qry_parametros_CD_ITEM_EXT_RECEB: TStringField
      FieldName = 'CD_ITEM_EXT_RECEB'
      Origin = 'TPARAMETROS.CD_ITEM_EXT_RECEB'
      Size = 3
    end
    object qry_parametros_CD_ITEM_EXT_PAGTO: TStringField
      FieldName = 'CD_ITEM_EXT_PAGTO'
      Origin = 'TPARAMETROS.CD_ITEM_EXT_PAGTO'
      Size = 3
    end
    object qry_parametros_CD_EV_REC_EXP: TStringField
      FieldName = 'CD_EV_REC_EXP'
      Origin = 'TPARAMETROS.CD_EV_REC_EXP'
      Size = 3
    end
    object qry_parametros_CD_BANCO_CHEQUE: TStringField
      FieldName = 'CD_BANCO_CHEQUE'
      Origin = 'TPARAMETROS.CD_BANCO_CHEQUE'
      Size = 3
    end
    object qry_parametros_CD_HIST_NCH: TStringField
      FieldName = 'CD_HIST_NCH'
      Origin = 'TPARAMETROS.CD_HIST_NCH'
      Size = 8
    end
    object qry_parametros_CD_HIST_FRETE: TStringField
      FieldName = 'CD_HIST_FRETE'
      Origin = 'TPARAMETROS.CD_HIST_FRETE'
      Size = 8
    end
    object qry_parametros_CD_HIST_TRANSPORTE: TStringField
      FieldName = 'CD_HIST_TRANSPORTE'
      Origin = 'TPARAMETROS.CD_HIST_TRANSPORTE'
      Size = 8
    end
    object qry_parametros_CD_HIST_IR: TStringField
      FieldName = 'CD_HIST_IR'
      Origin = 'TPARAMETROS.CD_HIST_IR'
      Size = 8
    end
    object qry_parametros_CD_HIST_ISSQN: TStringField
      FieldName = 'CD_HIST_ISSQN'
      Origin = 'TPARAMETROS.CD_HIST_ISSQN'
      Size = 8
    end
    object qry_parametros_CD_HIST_SEST_SENAT: TStringField
      FieldName = 'CD_HIST_SEST_SENAT'
      Origin = 'TPARAMETROS.CD_HIST_SEST_SENAT'
      Size = 8
    end
    object qry_parametros_CD_MOEDA_CORRENTE: TStringField
      FieldName = 'CD_MOEDA_CORRENTE'
      Origin = 'TPARAMETROS.CD_MOEDA_CORRENTE'
      Size = 3
    end
    object qry_parametros_CD_ITEM_NAO_FAT: TStringField
      FieldName = 'CD_ITEM_NAO_FAT'
      Origin = 'TPARAMETROS.CD_ITEM_NAO_FAT'
      Size = 3
    end
    object qry_parametros_CD_EV_PAG_DEMUR: TStringField
      FieldName = 'CD_EV_PAG_DEMUR'
      Origin = 'TPARAMETROS.CD_EV_PAG_DEMUR'
      Size = 3
    end
    object qry_parametros_CD_EV_PRES_CARGA: TStringField
      FieldName = 'CD_EV_PRES_CARGA'
      Origin = 'TPARAMETROS.CD_EV_PRES_CARGA'
      Size = 3
    end
    object qry_parametros_CD_EV_VENCTO_LI: TStringField
      FieldName = 'CD_EV_VENCTO_LI'
      Origin = 'TPARAMETROS.CD_EV_VENCTO_LI'
      Size = 3
    end
    object qry_parametros_CD_ITEM_PAGO_CLI: TStringField
      FieldName = 'CD_ITEM_PAGO_CLI'
      Origin = 'TPARAMETROS.CD_ITEM_PAGO_CLI'
      Size = 3
    end
    object qry_parametros_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TPARAMETROS.CD_SISTEMA_CONTABIL'
      Size = 1
    end
    object qry_parametros_CD_EV_DESOVA: TStringField
      FieldName = 'CD_EV_DESOVA'
      Origin = 'TPARAMETROS.CD_EV_DESOVA'
      Size = 3
    end
    object qry_parametros_CD_EV_LIB_BL: TStringField
      FieldName = 'CD_EV_LIB_BL'
      Origin = 'TPARAMETROS.CD_EV_LIB_BL'
      Size = 3
    end
    object qry_parametros_CD_EV_PAGTO_ICMS: TStringField
      FieldName = 'CD_EV_PAGTO_ICMS'
      Origin = 'TPARAMETROS.CD_EV_PAGTO_ICMS'
      Size = 3
    end
    object qry_parametros_CD_EV_ENVIO_FAT: TStringField
      FieldName = 'CD_EV_ENVIO_FAT'
      Origin = 'TPARAMETROS.CD_EV_ENVIO_FAT'
      Size = 3
    end
    object qry_parametros_CD_EV_ESPERA_NAVIO: TStringField
      FieldName = 'CD_EV_ESPERA_NAVIO'
      Origin = 'TPARAMETROS.CD_EV_ESPERA_NAVIO'
      Size = 3
    end
    object qry_parametros_CD_EV_CI: TStringField
      FieldName = 'CD_EV_CI'
      Origin = 'TPARAMETROS.CD_EV_CI'
      Size = 3
    end
    object qry_parametros_VL_TX_CONTR_SOCIAL_SDA: TFloatField
      FieldName = 'VL_TX_CONTR_SOCIAL_SDA'
      Origin = 'TPARAMETROS.VL_TX_CONTR_SOCIAL_SDA'
    end
    object qry_parametros_CD_ITEM_ISS: TStringField
      FieldName = 'CD_ITEM_ISS'
      Origin = 'TPARAMETROS.CD_ITEM_ISS'
      Size = 3
    end
    object qry_parametros_PC_SEGURO_EXP: TFloatField
      FieldName = 'PC_SEGURO_EXP'
      Origin = 'TPARAMETROS.PC_SEGURO_EXP'
    end
    object qry_parametros_CD_EV_PREV_EMBARQUE: TStringField
      FieldName = 'CD_EV_PREV_EMBARQUE'
      Origin = 'TPARAMETROS.CD_EV_PREV_EMBARQUE'
      Size = 3
    end
    object qry_parametros_NR_ULT_NOTA: TStringField
      FieldName = 'NR_ULT_NOTA'
      Origin = 'TPARAMETROS.NR_ULT_NOTA'
      Size = 6
    end
    object qry_parametros_NR_ULT_FATURA: TStringField
      FieldName = 'NR_ULT_FATURA'
      Origin = 'TPARAMETROS.NT_ULT_FATURA'
      Size = 6
    end
    object qry_parametros_CD_EV_CAMBIO_OK: TStringField
      FieldName = 'CD_EV_CAMBIO_OK'
      Origin = 'TPARAMETROS.CD_EV_CAMBIO_OK'
      Size = 3
    end
    object qry_parametros_LookEvRegDI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRegDI'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_REG_DI'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvConhecimento: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvConhecimento'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_CONHECIMENTO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvPagtoLI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPagtoLI'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PAGTO_LI'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvEsperaNavio: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEsperaNavio'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ESPERA_NAVIO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvEnt: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEnt'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENT'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvEntSETPIN: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEntSETPIN'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENT_SETPIN'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvSaiSETPIN: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvSaiSETPIN'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_SAI_SETPIN'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvPrevDesemb: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPrevDesemb'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PREV_DESEMB'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvDesemb: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvDesemb'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_DESEMB'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvDescarga: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvDescarga'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_DESCARGA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvPrevChegada: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPrevChegada'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PREV_CHEGADA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvChegada: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvChegada'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_CHEGADA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvETD: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvETD'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ETD'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvDigDI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvDigDI'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_DIG_DI'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvCI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvCI'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_CI'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvRecepAnalise: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRecepAnalise'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_RECEP_ANALISE'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvRecebDoc: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRecebDoc'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_RECEB_DOC'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvAbreProc: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvAbreProc'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ABRE_PROC'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvNumImp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvNumImp'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_NUM_IMP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvRecImp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRecImp'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_REC_IMP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvNumFrete: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvNumFrete'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_NUM_FRETE'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvRecFrete: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRecFrete'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_REC_FRETE'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvNumExp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvNumExp'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_NUM_EXP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvRecExp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRecExp'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_REC_EXP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvPresCarga: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPresCarga'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PRES_CARGA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvVenctoLI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvVenctoLI'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_VENCTO_LI'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvDesova: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvDesova'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_DESOVA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvLibBL: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvLibBL'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_LIB_BL'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvPagDemur: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPagDemur'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PAG_DEMUR'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvPagtoICMS: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPagtoICMS'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PAGTO_ICMS'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvPagArm: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPagArm'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PAG_ARM'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvPagSDA: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPagSDA'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PAG_SDA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvPrevChegEE: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPrevChegEE'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PREV_CHEG_EE'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvEnvioFat: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEnvioFat'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENVIO_FAT'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvCambioOK: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvCambioOK'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_CAMBIO_OK'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvPrevEmbarque: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPrevEmbarque'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PREV_EMBARQUE'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvEmbarque: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEmbarque'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_EMBARQUE'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvEntregaMerc: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEntregaMerc'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENTREGA_MERC'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvAverbacao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvAverbacao'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_AVERBACAO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_TP_NCM: TStringField
      FieldName = 'TP_NCM'
      Origin = 'TPARAMETROS.INDICE'
      Size = 1
    end
    object qry_parametros_TP_NALADI: TStringField
      FieldName = 'TP_NALADI'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 1
    end
    object qry_parametros_LookItemSDA: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemSDA'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_SDA'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemRecebNum: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemRecebNum'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_RECEB_NUM'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemDevolNum: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemDevolNum'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_DEVOL_NUM'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemExtorNum: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemExtorNum'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_EXTOR_NUM'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemSaldoCre: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemSaldoCre'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_SALDO_CRE'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemSaldoDeb: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemSaldoDeb'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_SALDO_DEB'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemRecebSd: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemRecebSd'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_RECEB_SD'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemPagtoSd: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemPagtoSd'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_PAGTO_SD'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemIR: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemIR'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_IR'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemCPMF: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemCPMF'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_CPMF'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemComissao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemComissao'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_COMISSAO'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemExped: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemExped'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_EXPED'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemII: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemII'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_II'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemIPI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemIPI'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_IPI'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemICMS: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemICMS'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_ICMS'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemFreteAereo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemFreteAereo'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_FRETE_AEREO'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemFreteMar: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemFreteMar'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_FRETE_MAR'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemSeguro: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemSeguro'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_SEGURO'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemAcresc: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemAcresc'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_ACRESC'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemVMLE: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemVMLE'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_VMLE'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemDed: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemDed'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_DED'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemSISCOMEX: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemSISCOMEX'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_SISCOMEX'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemExtReceb: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemExtReceb'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_EXT_RECEB'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemExtPagto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemExtPagto'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_EXT_PAGTO'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemPagoCli: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemPagoCli'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_PAGO_CLI'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemAFRMM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemAFRMM'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_AFRMM'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemdespOrig: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemdespOrig'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_DESP_ORIG'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemNVOCC: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemNVOCC'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_NVOCC'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemNaoFat: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemNaoFat'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_NAO_FAT'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemISS: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemISS'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_ISS'
      Size = 30
      Lookup = True
    end
    object qry_parametros_CD_MOD_FAT: TStringField
      FieldName = 'CD_MOD_FAT'
      Origin = 'TPARAMETROS.INDICE'
      Size = 1
    end
    object qry_parametros_NR_ULT_NF_SERV: TStringField
      FieldName = 'NR_ULT_NF_SERV'
      Origin = 'TPARAMETROS.INDICE'
      Size = 6
    end
    object qry_parametros_CD_MOD_NF_SERV: TStringField
      FieldName = 'CD_MOD_NF_SERV'
      Origin = 'TPARAMETROS.INDICE'
      Size = 1
    end
    object qry_parametros_CD_EV_ENT_REC_FED: TStringField
      FieldName = 'CD_EV_ENT_REC_FED'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_LookEvEntRecFed: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEntRecFed'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENT_REC_FED'
      Size = 50
      Lookup = True
    end
    object qry_parametros_PATH_EXCEL: TStringField
      FieldName = 'PATH_EXCEL'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 255
    end
    object qry_parametros_PATH_WORD: TStringField
      FieldName = 'PATH_WORD'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
      Size = 255
    end
    object qry_parametros_PATH_DDMAP: TStringField
      FieldName = 'PATH_DDMAP'
      Origin = 'TPARAMETROS.PATH_RELATORIOS'
      Size = 100
    end
    object qry_parametros_NR_BOLETO_INICIAL: TStringField
      FieldName = 'NR_BOLETO_INICIAL'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
      Size = 10
    end
    object qry_parametros_NR_REMESSA_COB_AUT_INICIAL: TStringField
      FieldName = 'NR_REMESSA_COB_AUT_INICIAL'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 4
    end
    object qry_parametros_PATH_COB_AUT_IMP: TStringField
      FieldName = 'PATH_COB_AUT_IMP'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 255
    end
    object qry_parametros_PATH_COB_AUT_TRANS: TStringField
      FieldName = 'PATH_COB_AUT_TRANS'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
      Size = 255
    end
    object qry_parametros_NR_CARTEIRA_COB_AUT: TStringField
      FieldName = 'NR_CARTEIRA_COB_AUT'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_VL_PERC_MORA_DIA_COB_AUT: TFloatField
      FieldName = 'VL_PERC_MORA_DIA_COB_AUT'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_parametros_CD_EMPRESA_COB_AUT: TStringField
      FieldName = 'CD_EMPRESA_COB_AUT'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
    end
    object qry_parametros_CD_BANCO_COB_AUT: TStringField
      FieldName = 'CD_BANCO_COB_AUT'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_LookBanco: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO_COB_AUT'
      OnChange = qry_parametros_LookBancoChange
      Size = 40
      Lookup = True
    end
    object qry_parametros_CD_EV_REMOCAO: TStringField
      FieldName = 'CD_EV_REMOCAO'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_LookEvRemocao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRemocao'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_REMOCAO'
      Size = 30
      Lookup = True
    end
    object qry_parametros_IN_LIBERA_DI: TStringField
      FieldName = 'IN_LIBERA_DI'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 2
    end
    object qry_parametros_LookCtCaixa: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtCaixa'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CAIXA'
      Size = 40
      Lookup = True
    end
    object qry_parametros_LookCtCaixaRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtCaixaRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CAIXA'
      Size = 40
      Lookup = True
    end
    object qry_parametros_LookCtChPagtosDiv: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtChPagtosDiv'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CH_PAGTOS_DIV'
      Size = 40
      Lookup = True
    end
    object qry_parametros_LookCtChPagtosDivRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtChPagtosDivRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CH_PAGTOS_DIV'
      Size = 40
      Lookup = True
    end
    object qry_parametros_LookCtFatAClassif: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtFatAClassif'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_FAT_A_CLASSIF'
      Size = 40
      Lookup = True
    end
    object qry_parametros_LookCtFatAClassifRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtFatAClassifRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_FAT_A_CLASSIF'
      Size = 40
      Lookup = True
    end
    object qry_parametros_LookCtCtaAPagar: TStringField
      DisplayLabel = 'LookCtCtaAPagar'
      FieldKind = fkLookup
      FieldName = 'LookCtCtaaPagar'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CTAAPAGAR'
      Size = 40
      Lookup = True
    end
    object qry_parametros_LookCtCtaAPagarRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtCtaAPagarRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CTAAPAGAR'
      Size = 40
      Lookup = True
    end
    object qry_parametros_CD_EV_PREV_CARREGAMENTO: TStringField
      FieldName = 'CD_EV_PREV_CARREGAMENTO'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_LookEvPrevCarregamento: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPrevCarregamento'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PREV_CARREGAMENTO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_LOCAL_EMISSAO_SP: TStringField
      FieldName = 'CD_LOCAL_EMISSAO_SP'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_LookLocalEmissaoSP: TStringField
      FieldKind = fkLookup
      FieldName = 'LookLocalEmissaoSP'
      LookupDataSet = qry_local_emissao_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'CD_LOCAL_EMISSAO_SP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_ITEM_SERVICO_COMISSARIA: TStringField
      FieldName = 'CD_ITEM_SERVICO_COMISSARIA'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_LookItemServicocomissaria: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemServicocomissaria'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_SERVICO_COMISSARIA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_ABERT_DI: TStringField
      FieldName = 'CD_EV_ABERT_DI'
      Origin = 'TPARAMETROS.PATH_RELATORIOS'
      Size = 3
    end
    object qry_parametros_CD_EV_NF_ENTRADA: TStringField
      FieldName = 'CD_EV_NF_ENTRADA'
      Origin = 'TPARAMETROS.PATH_RELATORIOS'
      Size = 3
    end
    object qry_parametros_LookEvAbertDI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvAbertDI'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ABERT_DI'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvNFEntr: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvNFEntr'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_NF_ENTRADA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_MOD_FLP_AUT: TStringField
      FieldName = 'CD_MOD_FLP_AUT'
      Origin = 'TPARAMETROS.INDICE'
      Size = 2
    end
    object qry_parametros_NR_BCO_COB_AUT: TStringField
      FieldName = 'NR_BCO_COB_AUT'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      OnChange = qry_parametros_NR_BCO_COB_AUTChange
      Size = 3
    end
    object qry_parametros_NR_DIAS_CONCLUSAO_PO: TIntegerField
      FieldName = 'NR_DIAS_CONCLUSAO_PO'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
    end
    object qry_parametros_CD_EVENTO_CONCLUSOR_PO: TStringField
      FieldName = 'CD_EVENTO_CONCLUSOR_PO'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_IN_EXP_QUEBRA_VL_UNITARIO: TStringField
      FieldName = 'IN_EXP_QUEBRA_VL_UNITARIO'
      Origin = 'TPARAMETROS.PATH_RELATORIOS'
      Size = 1
    end
    object qry_parametros_IN_CANC_CH_ADM: TStringField
      FieldName = 'IN_CANC_CH_ADM'
      Origin = 'TPARAMETROS.PATH_SISCOMEX'
      Size = 1
    end
    object qry_parametros_IN_CANC_CH_OP: TStringField
      FieldName = 'IN_CANC_CH_OP'
      Origin = 'TPARAMETROS.PATH_RISC'
      Size = 1
    end
    object qry_parametros_CD_EV_PREV_ENTR_MERC: TStringField
      FieldName = 'CD_EV_PREV_ENTR_MERC'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_LookEvPrevEntrMerc: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPrevEntrMerc'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PREV_ENTR_MERC'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_NF_TRANSP: TStringField
      FieldName = 'CD_EV_NF_TRANSP'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_LookEvNfTransp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvNfTransp'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_NF_TRANSP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_CT_FRETE: TStringField
      FieldName = 'CD_CT_FRETE'
      Origin = 'TPARAMETROS.INDICE'
      Size = 10
    end
    object qry_parametros_CD_CT_TRANSPORTE: TStringField
      FieldName = 'CD_CT_TRANSPORTE'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 10
    end
    object qry_parametros_LookCtIR: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtIR'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_IR'
      Size = 40
      Lookup = True
    end
    object qry_parametros_LookCtIRRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtIRRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_IR'
      Size = 40
      Lookup = True
    end
    object qry_parametros_CD_CT_ISSQN: TStringField
      FieldName = 'CD_CT_ISSQN'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 10
    end
    object qry_parametros_CD_CT_SEST_SENAT: TStringField
      FieldName = 'CD_CT_SEST_SENAT'
      Origin = 'TPARAMETROS.PATH_RISC'
      Size = 10
    end
    object qry_parametros_LookCtINSS: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtINSS'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_INSS'
      Size = 40
      Lookup = True
    end
    object qry_parametros_CD_EV_CRUZE: TStringField
      FieldName = 'CD_EV_CRUZE'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_CD_EV_APRESENTACAO: TStringField
      FieldName = 'CD_EV_APRESENTACAO'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_IN_GESTAO_VINCULADOS: TStringField
      FieldName = 'IN_GESTAO_VINCULADOS'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
      Size = 1
    end
    object qry_parametros_LookEvCruze: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvCruze'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_CRUZE'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvApresentacao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvApresentacao'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_APRESENTACAO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_DOC_RE_IMP: TStringField
      FieldName = 'CD_DOC_RE_IMP'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_CD_DOC_FAT_IMP: TStringField
      FieldName = 'CD_DOC_FAT_IMP'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_CD_DOC_NF_IMP: TStringField
      FieldName = 'CD_DOC_NF_IMP'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_CD_DOC_RE_EXP: TStringField
      FieldName = 'CD_DOC_RE_EXP'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_CD_DOC_FAT_EXP: TStringField
      FieldName = 'CD_DOC_FAT_EXP'
      Origin = 'TPARAMETROS.PATH_RISC'
      Size = 3
    end
    object qry_parametros_CD_DOC_NF_EXP: TStringField
      FieldName = 'CD_DOC_NF_EXP'
      Origin = 'TPARAMETROS.CD_INSTALACAO'
      Size = 3
    end
    object qry_parametros_LookDocNFImp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDocNFImp'
      LookupDataSet = qry_documento_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DOC_NF_IMP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookDocNFExp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDocNFExp'
      LookupDataSet = qry_documento_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DOC_NF_EXP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookDocFatImp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDocFatImp'
      LookupDataSet = qry_documento_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DOC_FAT_IMP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookDocFatExp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDocFatExp'
      LookupDataSet = qry_documento_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DOC_FAT_EXP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookDocREImp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDocREImp'
      LookupDataSet = qry_documento_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DOC_RE_IMP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookDocREExp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDocREExp'
      LookupDataSet = qry_documento_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DOC_RE_EXP'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_PREV_FABRICA: TStringField
      FieldName = 'CD_EV_PREV_FABRICA'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_LookEvPrevFabrica: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPrevFabrica'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PREV_FABRICA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_IN_EXP_AGRUPA_ITENS: TStringField
      FieldName = 'IN_EXP_AGRUPA_ITENS'
      Origin = 'TPARAMETROS.INDICE'
      Size = 1
    end
    object qry_parametros_LookCtINSSRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtINSSRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_INSS'
      Size = 40
      Lookup = True
    end
    object qry_parametros_CD_EV_REG_DDE: TStringField
      FieldName = 'CD_EV_REG_DDE'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_LookEvRegDDE: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRegDDE'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_REG_DDE'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_REG_RE: TStringField
      FieldName = 'CD_EV_REG_RE'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_LookEvRegRE: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRegRE'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_REG_RE'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_EMISSAO_ETIQUETA: TStringField
      FieldName = 'CD_EV_EMISSAO_ETIQUETA'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_LookEvEmissaoEtiqueta: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEmissaoEtiqueta'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_EMISSAO_ETIQUETA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_IN_EXP_QUEBRA_FABRIC: TStringField
      FieldName = 'IN_EXP_QUEBRA_FABRIC'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 1
    end
    object qry_parametros_CD_DOC_CERT_ORIGEM: TStringField
      FieldName = 'CD_DOC_CERT_ORIGEM'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_CD_ITEM_DESCONTO: TStringField
      FieldName = 'CD_ITEM_DESCONTO'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_LookCtJuros: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtJuros'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL_JUROS'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookCtDesconto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtDesconto'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL_DESCONTO'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemDesconto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemDesconto'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_DESCONTO'
      Size = 30
      Lookup = True
    end
    object qry_parametros_CD_COB_CARTEIRA: TStringField
      FieldName = 'CD_COB_CARTEIRA'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_CD_COB_FORMA_CADASTRO: TStringField
      FieldName = 'CD_COB_FORMA_CADASTRO'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_CD_COB_TIPO_DOCTO: TStringField
      FieldName = 'CD_COB_TIPO_DOCTO'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_CD_COB_EMISSAO: TStringField
      FieldName = 'CD_COB_EMISSAO'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_CD_COB_DISTRIBUI: TStringField
      FieldName = 'CD_COB_DISTRIBUI'
      Origin = 'TPARAMETROS.PATH_RISC'
      Size = 3
    end
    object qry_parametros_CD_EV_ATRACACAO: TStringField
      FieldName = 'CD_EV_ATRACACAO'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_qry_parametros_LookEvAtracacao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvAtracacao'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ATRACACAO'
      Lookup = True
    end
    object qry_parametros_IN_EV_REG_DI: TStringField
      FieldName = 'IN_EV_REG_DI'
      Origin = 'TPARAMETROS.INDICE'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_DESEMB: TStringField
      FieldName = 'IN_EV_DESEMB'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PAGTO_LI: TStringField
      FieldName = 'IN_EV_PAGTO_LI'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_ENT: TStringField
      FieldName = 'IN_EV_ENT'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_CHEGADA: TStringField
      FieldName = 'IN_EV_CHEGADA'
      Origin = 'TPARAMETROS.PATH_RISC'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_ENT_SETPIN: TStringField
      FieldName = 'IN_EV_ENT_SETPIN'
      Origin = 'TPARAMETROS.CD_INSTALACAO'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_SAI_SETPIN: TStringField
      FieldName = 'IN_EV_SAI_SETPIN'
      Origin = 'TPARAMETROS.NM_SERVIDOR'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_DESCARGA: TStringField
      FieldName = 'IN_EV_DESCARGA'
      Origin = 'TPARAMETROS.NM_CID_CHEQUE'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PREV_CHEGADA: TStringField
      FieldName = 'IN_EV_PREV_CHEGADA'
      Origin = 'TPARAMETROS.CD_ITEM_SDA'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_ETD: TStringField
      FieldName = 'IN_EV_ETD'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_NUM'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PREV_DESEMB: TStringField
      FieldName = 'IN_EV_PREV_DESEMB'
      Origin = 'TPARAMETROS.CD_ITEM_DEVOL_NUM'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_CONHECIMENTO: TStringField
      FieldName = 'IN_EV_CONHECIMENTO'
      Origin = 'TPARAMETROS.CD_ITEM_EXTOR_NUM'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_RECEB_DOC: TStringField
      FieldName = 'IN_EV_RECEB_DOC'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_CRE'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_EMBARQUE: TStringField
      FieldName = 'IN_EV_EMBARQUE'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_DEB'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_DIG_DI: TStringField
      FieldName = 'IN_EV_DIG_DI'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_SD'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_ENTREGA_MERC: TStringField
      FieldName = 'IN_EV_ENTREGA_MERC'
      Origin = 'TPARAMETROS.CD_ITEM_PAGTO_SD'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_AVERBACAO: TStringField
      FieldName = 'IN_EV_AVERBACAO'
      Origin = 'TPARAMETROS.CD_ITEM_IR'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_NUM_IMP: TStringField
      FieldName = 'IN_EV_NUM_IMP'
      Origin = 'TPARAMETROS.VL_ALIQ_IR'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_REC_IMP: TStringField
      FieldName = 'IN_EV_REC_IMP'
      Origin = 'TPARAMETROS.VL_MIN_IR'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PAG_ICMS: TStringField
      FieldName = 'IN_EV_PAG_ICMS'
      Origin = 'TPARAMETROS.CD_ITEM_CPMF'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PAG_ARM: TStringField
      FieldName = 'IN_EV_PAG_ARM'
      Origin = 'TPARAMETROS.CD_EV_REG_DI'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_NUM_FRETE: TStringField
      FieldName = 'IN_EV_NUM_FRETE'
      Origin = 'TPARAMETROS.CD_EV_DESEMB'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_REC_FRETE: TStringField
      FieldName = 'IN_EV_REC_FRETE'
      Origin = 'TPARAMETROS.CD_EV_PAGTO_LI'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_ABRE_PROC: TStringField
      FieldName = 'IN_EV_ABRE_PROC'
      Origin = 'TPARAMETROS.CD_EV_ENT'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_NUM_EXP: TStringField
      FieldName = 'IN_EV_NUM_EXP'
      Origin = 'TPARAMETROS.CD_EV_CHEGADA'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PAG_SDA: TStringField
      FieldName = 'IN_EV_PAG_SDA'
      Origin = 'TPARAMETROS.CD_EV_ENT_SETPIN'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_RECEP_ANALISE: TStringField
      FieldName = 'IN_EV_RECEP_ANALISE'
      Origin = 'TPARAMETROS.CD_EV_SAI_SETPIN'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PREV_CHEG_EE: TStringField
      FieldName = 'IN_EV_PREV_CHEG_EE'
      Origin = 'TPARAMETROS.CD_EV_DESCARGA'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_REC_EXP: TStringField
      FieldName = 'IN_EV_REC_EXP'
      Origin = 'TPARAMETROS.CD_ITEM_COMISSAO'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PAG_DEMUR: TStringField
      FieldName = 'IN_EV_PAG_DEMUR'
      Origin = 'TPARAMETROS.CD_ITEM_EXPED'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PRES_CARGA: TStringField
      FieldName = 'IN_EV_PRES_CARGA'
      Origin = 'TPARAMETROS.CD_EV_PREV_CHEGADA'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_VENCTO_LI: TStringField
      FieldName = 'IN_EV_VENCTO_LI'
      Origin = 'TPARAMETROS.CD_EV_ETD'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_DESOVA: TStringField
      FieldName = 'IN_EV_DESOVA'
      Origin = 'TPARAMETROS.CD_EV_PREV_DESEMB'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_LIB_BL: TStringField
      FieldName = 'IN_EV_LIB_BL'
      Origin = 'TPARAMETROS.CD_EV_CONHECIMENTO'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PAGTO_ICMS: TStringField
      FieldName = 'IN_EV_PAGTO_ICMS'
      Origin = 'TPARAMETROS.CD_EV_RECEB_DOC'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_ENVIO_FAT: TStringField
      FieldName = 'IN_EV_ENVIO_FAT'
      Origin = 'TPARAMETROS.CD_ITEM_II'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_ESPERA_NAVIO: TStringField
      FieldName = 'IN_EV_ESPERA_NAVIO'
      Origin = 'TPARAMETROS.CD_ITEM_IPI'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_CAMBIO_OK: TStringField
      FieldName = 'IN_EV_CAMBIO_OK'
      Origin = 'TPARAMETROS.CD_ITEM_ICMS'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_CI: TStringField
      FieldName = 'IN_EV_CI'
      Origin = 'TPARAMETROS.CD_ITEM_FRETE_AEREO'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PREV_EMBARQUE: TStringField
      FieldName = 'IN_EV_PREV_EMBARQUE'
      Origin = 'TPARAMETROS.CD_ITEM_FRETE_MAR'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_ENT_REC_FED: TStringField
      FieldName = 'IN_EV_ENT_REC_FED'
      Origin = 'TPARAMETROS.CD_ITEM_SEGURO'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_REMOCAO: TStringField
      FieldName = 'IN_EV_REMOCAO'
      Origin = 'TPARAMETROS.CD_ITEM_VMLE'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_CONCLUSOR_PO: TStringField
      FieldName = 'IN_EV_CONCLUSOR_PO'
      Origin = 'TPARAMETROS.CD_ITEM_ACRESC'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PREV_CARREGAMENTO: TStringField
      FieldName = 'IN_EV_PREV_CARREGAMENTO'
      Origin = 'TPARAMETROS.CD_ITEM_DED'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_ABERT_DI: TStringField
      FieldName = 'IN_EV_ABERT_DI'
      Origin = 'TPARAMETROS.CD_ITEM_SISCOMEX'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_NF_ENTRADA: TStringField
      FieldName = 'IN_EV_NF_ENTRADA'
      Origin = 'TPARAMETROS.CD_ITEM_AFRMM'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PREV_ENTR_MERC: TStringField
      FieldName = 'IN_EV_PREV_ENTR_MERC'
      Origin = 'TPARAMETROS.CD_GRP_ITEM_FRETE'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_CRUZE: TStringField
      FieldName = 'IN_EV_CRUZE'
      Origin = 'TPARAMETROS.CD_GRP_ITEM_ARM'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_APRESENTACAO: TStringField
      FieldName = 'IN_EV_APRESENTACAO'
      Origin = 'TPARAMETROS.CD_GRP_ITEM_CAP'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_NF_TRANSP: TStringField
      FieldName = 'IN_EV_NF_TRANSP'
      Origin = 'TPARAMETROS.PATH_CONTABIL'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_PREV_FABRICA: TStringField
      FieldName = 'IN_EV_PREV_FABRICA'
      Origin = 'TPARAMETROS.PATH_GSM_SERVER'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_REG_DDE: TStringField
      FieldName = 'IN_EV_REG_DDE'
      Origin = 'TPARAMETROS.PATH_GSM_CLIENT'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_REG_RE: TStringField
      FieldName = 'IN_EV_REG_RE'
      Origin = 'TPARAMETROS.CD_ITEM_DESP_ORIG'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_EMISSAO_ETIQUETA: TStringField
      FieldName = 'IN_EV_EMISSAO_ETIQUETA'
      Origin = 'TPARAMETROS.CD_EV_EMBARQUE'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_IN_EV_ATRACACAO: TStringField
      FieldName = 'IN_EV_ATRACACAO'
      Origin = 'TPARAMETROS.CD_FAV_SM'
      OnGetText = qry_parametros_IN_EV_REG_DIGetText
      OnSetText = qry_parametros_IN_EV_REG_DISetText
      Size = 1
    end
    object qry_parametros_LookCtCtaAReceber: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtCtaAReceber'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CTAARECEBER'
      Size = 40
      Lookup = True
    end
    object qry_parametros_LookCtCtaAReceberRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtCtaAReceberRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CTAARECEBER'
      Size = 40
      Lookup = True
    end
    object qry_parametros_LookCtJurosRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtJurosRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL_JUROS'
      Size = 40
      Lookup = True
    end
    object qry_parametros_LookCtDescontoRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtDescontoRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL_DESCONTO'
      Size = 40
      Lookup = True
    end
    object qry_parametros_CD_CT_GER_CTAARECEBER: TStringField
      FieldName = 'CD_CT_GER_CTAARECEBER'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 4
    end
    object qry_parametros_LookCtGerCtaAReceber: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtGerCtaAReceber'
      LookupDataSet = qry_ct_gerencial_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GER_CTAARECEBER'
      Lookup = True
    end
    object qry_parametros_LookCtGerCtaAReceberRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtGerCtaAReceberRM'
      LookupDataSet = qry_ct_gerencialRM_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GER_CTAARECEBER'
      Lookup = True
    end
    object qry_parametros_CD_CT_GER_DESCONTO: TStringField
      FieldName = 'CD_CT_GER_DESCONTO'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 4
    end
    object qry_parametros_CD_CT_GER_FINANCEIRO: TStringField
      FieldName = 'CD_CT_GER_FINANCEIRO'
      Origin = 'TPARAMETROS.PATH_RELATORIOS'
      Size = 4
    end
    object qry_parametros_LookCtGerDesconto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtGerDesconto'
      LookupDataSet = qry_ct_gerencial_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GER_DESCONTO'
      Lookup = True
    end
    object qry_parametros_LookCtGerDescontoRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtGerDescontoRM'
      LookupDataSet = qry_ct_gerencialRM_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GER_DESCONTO'
      Lookup = True
    end
    object qry_parametros_LookCtGerFinanceiro: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtGerFinanceiro'
      LookupDataSet = qry_ct_gerencial_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GER_FINANCEIRO'
      Lookup = True
    end
    object qry_parametros_LookCtGerFinanceiroRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtGerFinanceiroRM'
      LookupDataSet = qry_ct_gerencialRM_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GER_FINANCEIRO'
      Lookup = True
    end
    object qry_parametros_IN_ARREDONDA_CPMF_ITEM: TStringField
      FieldName = 'IN_ARREDONDA_CPMF_ITEM'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 1
    end
    object qry_parametros_CD_EV_CANAL: TStringField
      FieldName = 'CD_EV_CANAL'
      Origin = 'TPARAMETROS.PATH_SISCOMEX'
      Size = 3
    end
    object qry_parametros_CD_EV_SOLIC_CAMBIO: TStringField
      FieldName = 'CD_EV_SOLIC_CAMBIO'
      Origin = 'TPARAMETROS.PATH_RISC'
      Size = 3
    end
    object qry_parametros_CD_EV_SOLIC_SEGURO: TStringField
      FieldName = 'CD_EV_SOLIC_SEGURO'
      Origin = 'TPARAMETROS.CD_INSTALACAO'
      Size = 3
    end
    object qry_parametros_CD_EV_RECEB_SEGURO: TStringField
      FieldName = 'CD_EV_RECEB_SEGURO'
      Origin = 'TPARAMETROS.NM_SERVIDOR'
      Size = 3
    end
    object qry_parametros_CD_EV_SOLIC_MINISTERIO: TStringField
      FieldName = 'CD_EV_SOLIC_MINISTERIO'
      Origin = 'TPARAMETROS.NM_CID_CHEQUE'
      Size = 3
    end
    object qry_parametros_CD_EV_RECEB_MINISTERIO: TStringField
      FieldName = 'CD_EV_RECEB_MINISTERIO'
      Origin = 'TPARAMETROS.CD_ITEM_SDA'
      Size = 3
    end
    object qry_parametros_CD_EV_LIBERACAO: TStringField
      FieldName = 'CD_EV_LIBERACAO'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_NUM'
      Size = 3
    end
    object qry_parametros_IN_EV_CANAL: TStringField
      FieldName = 'IN_EV_CANAL'
      Origin = 'TPARAMETROS.CD_ITEM_DEVOL_NUM'
      Size = 1
    end
    object qry_parametros_IN_EV_SOLIC_CAMBIO: TStringField
      FieldName = 'IN_EV_SOLIC_CAMBIO'
      Origin = 'TPARAMETROS.CD_ITEM_EXTOR_NUM'
      Size = 1
    end
    object qry_parametros_IN_EV_SOLIC_SEGURO: TStringField
      FieldName = 'IN_EV_SOLIC_SEGURO'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_CRE'
      Size = 1
    end
    object qry_parametros_IN_EV_RECEB_SEGURO: TStringField
      FieldName = 'IN_EV_RECEB_SEGURO'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_DEB'
      Size = 1
    end
    object qry_parametros_IN_EV_SOLIC_MINISTERIO: TStringField
      FieldName = 'IN_EV_SOLIC_MINISTERIO'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_SD'
      Size = 1
    end
    object qry_parametros_IN_EV_RECEB_MINISTERIO: TStringField
      FieldName = 'IN_EV_RECEB_MINISTERIO'
      Origin = 'TPARAMETROS.CD_ITEM_PAGTO_SD'
      Size = 1
    end
    object qry_parametros_IN_EV_LIBERACAO: TStringField
      FieldName = 'IN_EV_LIBERACAO'
      Origin = 'TPARAMETROS.CD_ITEM_IR'
      Size = 3
    end
    object qry_parametros_LookEvCanal: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvCanal'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_CANAL'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvSolicCambio: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvSolicCambio'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_SOLIC_CAMBIO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvSolicSeguro: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvSolicSeguro'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_SOLIC_SEGURO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvRecebSeguro: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRecebSeguro'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_RECEB_SEGURO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvSolicMinisterio: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvSolicMinisterio'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_SOLIC_MINISTERIO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvRecebMinisterio: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRecebMinisterio'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_RECEB_MINISTERIO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvLiberacao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvLiberacao'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_LIBERACAO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_PATH_WORK_IMAGE: TStringField
      FieldName = 'PATH_WORK_IMAGE'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 100
    end
    object qry_parametros_LookCtLP: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtLP'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_LP_SALDUS'
      Size = 40
      Lookup = True
    end
    object qry_parametros_NR_DIAS_ENTRE_VIAGENS: TIntegerField
      FieldName = 'NR_DIAS_ENTRE_VIAGENS'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      EditFormat = '99'
    end
    object qry_parametros_CD_EV_ENVIO_SAQUE_BORDERO: TStringField
      FieldName = 'CD_EV_ENVIO_SAQUE_BORDERO'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_IN_EV_ENVIO_SAQUE_BORDERO: TStringField
      FieldName = 'IN_EV_ENVIO_SAQUE_BORDERO'
      Origin = 'TPARAMETROS.NR_SOLIC_CH'
      Size = 1
    end
    object qry_parametros_LookEvEnvioSaqueBordero: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEnvioSaqueBordero'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENVIO_SAQUE_BORDERO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_VL_MINIMO_TED: TFloatField
      FieldName = 'VL_MINIMO_TED'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_parametros_CD_EV_INSP_MA: TStringField
      FieldName = 'CD_EV_INSP_MA'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_LookEvInspMA: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvInspMA'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_INSP_MA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_ITEM_XEROX: TStringField
      FieldName = 'CD_ITEM_XEROX'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_CD_ITEM_DEMURRAGE: TStringField
      FieldName = 'CD_ITEM_DEMURRAGE'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_LookItemDemurrage: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemDemurrage'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_DEMURRAGE'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_INSP_OK: TStringField
      FieldName = 'CD_EV_INSP_OK'
      Origin = 'TPARAMETROS.INDICE'
      Size = 3
    end
    object qry_parametros_CD_EV_ENVIO_DOC_CLI: TStringField
      FieldName = 'CD_EV_ENVIO_DOC_CLI'
      Origin = 'TPARAMETROS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_parametros_LookEvInspOk: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvInspOk'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_INSP_OK'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvEnvioDocCli: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEnvioDocCli'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENVIO_DOC_CLI'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_VENDA_NAC: TStringField
      FieldName = 'CD_EV_VENDA_NAC'
      Origin = 'TPARAMETROS.NM_SERVIDOR'
      Size = 3
    end
    object qry_parametros_CD_EV_ENVIO_DOC_NAC: TStringField
      FieldName = 'CD_EV_ENVIO_DOC_NAC'
      Origin = 'TPARAMETROS.NM_CID_CHEQUE'
      Size = 3
    end
    object qry_parametros_LookEvVendaNac: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvVendaNac'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_VENDA_NAC'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvEnvioDocNac: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEnvioDocNac'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENVIO_DOC_NAC'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_GRUPO_BASF: TStringField
      FieldName = 'CD_GRUPO_BASF'
      Origin = 'TPARAMETROS.NM_SERVIDOR'
      Size = 3
    end
    object qry_parametros_PC_MAX_SEGURO_DI: TFloatField
      FieldName = 'PC_MAX_SEGURO_DI'
      Origin = 'TPARAMETROS.NM_SERVIDOR'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_parametros_CD_USUARIO_DEMURRAGE: TStringField
      FieldName = 'CD_USUARIO_DEMURRAGE'
      Origin = 'TPARAMETROS.CD_INSTALACAO'
      Size = 4
    end
    object qry_parametros_CD_EV_ENV_COMEXT: TStringField
      FieldName = 'CD_EV_ENV_COMEXT'
      Origin = 'TPARAMETROS.NM_SERVIDOR'
      Size = 3
    end
    object qry_parametros_CD_EV_LIB_EST: TStringField
      FieldName = 'CD_EV_LIB_EST'
      Origin = 'TPARAMETROS.NM_CID_CHEQUE'
      Size = 3
    end
    object qry_parametros_CD_EV_FORM_DT: TStringField
      FieldName = 'CD_EV_FORM_DT'
      Origin = 'TPARAMETROS.CD_ITEM_SDA'
      Size = 3
    end
    object qry_parametros_CD_EV_LIB_FAB: TStringField
      FieldName = 'CD_EV_LIB_FAB'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_NUM'
      Size = 3
    end
    object qry_parametros_CD_EV_REC_DHL: TStringField
      FieldName = 'CD_EV_REC_DHL'
      Origin = 'TPARAMETROS.CD_ITEM_DEVOL_NUM'
      Size = 3
    end
    object qry_parametros_LookEvEnvComExt: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEnvComExt'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENV_COMEXT'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvLibEst: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvLibEst'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_LIB_EST'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvFormDt: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvFormDt'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_FORM_DT'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvLibFab: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvLibFab'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_LIB_FAB'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvRecDHL: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRecDHL'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_REC_DHL'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_EMAIL_LIB: TStringField
      FieldName = 'CD_EV_EMAIL_LIB'
      Origin = 'TPARAMETROS.CD_INSTALACAO'
      Size = 3
    end
    object qry_parametros_CD_EV_CONF_DOCS: TStringField
      FieldName = 'CD_EV_CONF_DOCS'
      Origin = 'TPARAMETROS.NM_SERVIDOR'
      Size = 3
    end
    object qry_parametros_LookEvEmailLib: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEmailLib'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_EMAIL_LIB'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvConfDocs: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvConfDocs'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_CONF_DOCS'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_SOLIC_DESOVA: TStringField
      FieldName = 'CD_EV_SOLIC_DESOVA'
      Origin = 'TPARAMETROS.CD_INSTALACAO'
      Size = 3
    end
    object qry_parametros_LookEvSolicDesova: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvSolicDesova'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_SOLIC_DESOVA'
      Size = 50
      Lookup = True
    end
    object qry_parametros_NR_DIAS_VENCTO_ENT_NAVIO: TSmallintField
      FieldName = 'NR_DIAS_VENCTO_ENT_NAVIO'
      Origin = 'TPARAMETROS.CD_INSTALACAO'
    end
    object qry_parametros_CD_ITEM_LOGISTICA: TStringField
      FieldName = 'CD_ITEM_LOGISTICA'
      Origin = 'TPARAMETROS.CD_INSTALACAO'
      Size = 3
    end
    object qry_parametros_LookItemLogistica: TStringField
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'LookItemLogistica'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_LOGISTICA'
      Size = 30
      Lookup = True
    end
    object qry_parametros_CD_EV_CERT_ORIGEM: TStringField
      FieldName = 'CD_EV_CERT_ORIGEM'
      Origin = 'TPARAMETROS.CD_INSTALACAO'
      Size = 3
    end
    object qry_parametros_LookEvCertOrigem: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvCertOrigem'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_CERT_ORIGEM'
      Size = 25
      Lookup = True
    end
    object qry_parametros_CD_EV_PED_REC: TStringField
      FieldName = 'CD_EV_PED_REC'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_NUM'
      Size = 3
    end
    object qry_parametros_LookEvPedRec: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'LookEvPedRec'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PED_REC'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_ENTR_MERC_FABR: TStringField
      FieldName = 'CD_EV_ENTR_MERC_FABR'
      Origin = 'TPARAMETROS.CD_ITEM_DEVOL_NUM'
      Size = 3
    end
    object qry_parametros_LookEvEntrMercFabr: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'LookEvEntrMercFabr'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENTR_MERC_FABR'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_NECESSIDADE: TStringField
      FieldName = 'CD_EV_NECESSIDADE'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_NUM'
      Size = 3
    end
    object qry_parametros_LookEvNecessidade: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'LookEvNecessidade'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_NECESSIDADE'
      Lookup = True
    end
    object qry_parametros_CD_GRUPO_BSG: TStringField
      FieldName = 'CD_GRUPO_BSG'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_NUM'
      Size = 3
    end
    object qry_parametros_LookGrupoBSG: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookGrupoBSG'
      Size = 50
      Calculated = True
    end
    object qry_parametros_LookGrupoBASF: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookGrupoBASF'
      Size = 50
      Calculated = True
    end
    object qry_parametros_CD_EV_ENVIO_DOC: TStringField
      FieldName = 'CD_EV_ENVIO_DOC'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_NUM'
      Size = 3
    end
    object qry_parametros_LookEvEnvioDoc: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvEnvioDoc'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENVIO_DOC'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_ENTR_EADI: TStringField
      FieldName = 'CD_EV_ENTR_EADI'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_NUM'
      Size = 3
    end
    object qry_parametros_LookEvEntrEADI: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'LookEvEntrEADI'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_ENTR_EADI'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_GRUPO_OXITENO: TStringField
      FieldName = 'CD_GRUPO_OXITENO'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_NUM'
      Size = 3
    end
    object qry_parametros_LookGrupoOxiteno: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'LookGrupoOxiteno'
      Size = 50
      Calculated = True
    end
    object qry_parametros_CD_EV_DT_CONSOLIDACAO: TStringField
      FieldName = 'CD_EV_DT_CONSOLIDACAO'
      Origin = 'TPARAMETROS.CD_ITEM_EXTOR_NUM'
      Size = 3
    end
    object qry_parametros_LookEvDtConsolidacao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvDtConsolidacao'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_DT_CONSOLIDACAO'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_EV_RECEB_PED: TStringField
      FieldName = 'CD_EV_RECEB_PED'
      Origin = 'TPARAMETROS.CD_ITEM_EXTOR_NUM'
      Size = 3
    end
    object qry_parametros_CD_EV_SOLIC_OV: TStringField
      FieldName = 'CD_EV_SOLIC_OV'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_CRE'
      Size = 3
    end
    object qry_parametros_CD_EV_SOLIC_REM: TStringField
      FieldName = 'CD_EV_SOLIC_REM'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_DEB'
      Size = 3
    end
    object qry_parametros_LookEvRecebPed: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'LookEvRecebPed'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_RECEB_PED'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvSolicOV: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvSolicOV'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_SOLIC_OV'
      Size = 50
      Lookup = True
    end
    object qry_parametros_LookEvSolicRem: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvSolicRem'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_SOLIC_REM'
      Size = 50
      Lookup = True
    end
    object qry_parametros_CD_ITEM_COFINS: TStringField
      FieldName = 'CD_ITEM_COFINS'
      Origin = 'TPARAMETROS.CD_ITEM_EXTOR_NUM'
      Size = 3
    end
    object qry_parametros_CD_ITEM_COFINS_RETENCAO: TStringField
      FieldName = 'CD_ITEM_COFINS_RETENCAO'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_CRE'
      Size = 3
    end
    object qry_parametros_LookItemCofins: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemCofins'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_COFINS'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemCofinsRet: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemCofinsRet'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_COFINS_RETENCAO'
      Size = 30
      Lookup = True
    end
    object qry_parametros_VL_ALIQ_COFINS: TFloatField
      FieldName = 'VL_ALIQ_COFINS'
      Origin = 'TPARAMETROS.CD_ITEM_EXTOR_NUM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_parametros_VL_ALIQ_COFINS_RETENCAO: TFloatField
      FieldName = 'VL_ALIQ_COFINS_RETENCAO'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_CRE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_parametros_CD_EV_DTA_TRANSP: TStringField
      FieldName = 'CD_EV_DTA_TRANSP'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_DEB'
      Size = 3
    end
    object qry_parametros_LookEvDtaTransp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvDtaTransp'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_DTA_TRANSP'
      Size = 30
      Lookup = True
    end
    object qry_parametros_CD_EV_PRES_CARGA_EADI: TStringField
      FieldName = 'CD_EV_PRES_CARGA_EADI'
      Origin = 'TPARAMETROS.CD_ITEM_RECEB_NUM'
      Size = 3
    end
    object qry_parametros_CD_EV_PARAM_DTA: TStringField
      FieldName = 'CD_EV_PARAM_DTA'
      Origin = 'TPARAMETROS.CD_ITEM_DEVOL_NUM'
      Size = 3
    end
    object qry_parametros_CD_EV_REG_DTA: TStringField
      FieldName = 'CD_EV_REG_DTA'
      Origin = 'TPARAMETROS.CD_ITEM_EXTOR_NUM'
      Size = 3
    end
    object qry_parametros_LookEvParamDTA: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvParamDTA'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PARAM_DTA'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookEvPresCargaEADI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvPresCargaEADI'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_PRES_CARGA_EADI'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookEvRegDTA: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEvRegDTA'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_REG_DTA'
      Size = 30
      Lookup = True
    end
    object qry_parametros_IN_CALC_MP164: TStringField
      FieldName = 'IN_CALC_MP164'
      Origin = 'TPARAMETROS.CD_ITEM_SALDO_CRE'
      Size = 1
    end
    object qry_parametros_CD_ITEM_MP164: TStringField
      FieldName = 'CD_ITEM_MP164'
      Origin = 'TPARAMETROS.CD_ITEM_EXTOR_NUM'
      Size = 3
    end
    object qry_parametros_LookItemMP164: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemMP164'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_MP164'
      Size = 3
      Lookup = True
    end
    object qry_parametros_IN_TX_SISC_DESP: TStringField
      FieldName = 'IN_TX_SISC_DESP'
      Origin = 'TPARAMETROS.CD_ITEM_EXTOR_NUM'
      Size = 1
    end
    object qry_parametros_CD_ITEM_COFINS_IMP: TStringField
      FieldName = 'CD_ITEM_COFINS_IMP'
      Origin = 'TPARAMETROS.CD_ITEM_IR'
      Size = 3
    end
    object qry_parametros_CD_ITEM_PIS_IMP: TStringField
      FieldName = 'CD_ITEM_PIS_IMP'
      Origin = 'TPARAMETROS.CD_ITEM_PAGTO_SD'
      Size = 3
    end
    object qry_parametros_LookItemPISImp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemPISImp'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_PIS_IMP'
      Size = 3
      Lookup = True
    end
    object qry_parametros_LookItemCOFINSImp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemCOFINSImp'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_COFINS_IMP'
      Size = 3
      Lookup = True
    end
    object qry_parametros_VL_MIN_DI_DIRETOR: TFloatField
      FieldName = 'VL_MIN_DI_DIRETOR'
      Origin = 'DBBROKER.TPARAMETROS.VL_MIN_DI_DIRETOR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_parametros_VL_AUTOCLOSER: TIntegerField
      FieldName = 'VL_AUTOCLOSER'
      Origin = 'DBBROKER.TPARAMETROS.VL_AUTOCLOSER'
    end
    object qry_parametros_VL_REMESSA: TFloatField
      FieldName = 'VL_REMESSA'
      Origin = 'DBBROKER.TPARAMETROS.VL_REMESSA'
    end
    object qry_parametros_NR_DIAS_DESEMB: TSmallintField
      FieldName = 'NR_DIAS_DESEMB'
      Origin = 'DBBROKER.TPARAMETROS.NR_DIAS_DESEMB'
    end
    object qry_parametros_NR_DIAS_NF_TRANSP: TSmallintField
      FieldName = 'NR_DIAS_NF_TRANSP'
      Origin = 'DBBROKER.TPARAMETROS.NR_DIAS_NF_TRANSP'
    end
    object qry_parametros_NR_DIAS_RET_CNTR: TSmallintField
      FieldName = 'NR_DIAS_RET_CNTR'
      Origin = 'DBBROKER.TPARAMETROS.NR_DIAS_RET_CNTR'
    end
    object qry_parametros_NR_DIAS_DEMURRAGE: TSmallintField
      FieldName = 'NR_DIAS_DEMURRAGE'
      Origin = 'DBBROKER.TPARAMETROS.NR_DIAS_DEMURRAGE'
    end
    object qry_parametros_IN_AVISO_DEMURRAGE: TStringField
      FieldName = 'IN_AVISO_DEMURRAGE'
      Origin = 'DBBROKER.TPARAMETROS.IN_AVISO_DEMURRAGE'
      FixedChar = True
      Size = 1
    end
    object qry_parametros_VL_VIABILIDADE_DB: TFloatField
      FieldName = 'VL_VIABILIDADE_DB'
      Origin = 'DBBROKER.TPARAMETROS.VL_VIABILIDADE_DB'
    end
    object qry_parametros_VL_VAR_CAMBIAL_DB: TFloatField
      FieldName = 'VL_VAR_CAMBIAL_DB'
      Origin = 'DBBROKER.TPARAMETROS.VL_VAR_CAMBIAL_DB'
    end
    object qry_parametros_PC_SEGURO_DB: TFloatField
      FieldName = 'PC_SEGURO_DB'
      Origin = 'DBBROKER.TPARAMETROS.PC_SEGURO_DB'
    end
    object qry_parametros_VL_ALIQ_AFRMM: TFloatField
      FieldName = 'VL_ALIQ_AFRMM'
      Origin = 'DBBROKER.TPARAMETROS.VL_ALIQ_AFRMM'
    end
    object qry_parametros_CD_EV_INSTRUCAO: TStringField
      FieldName = 'CD_EV_INSTRUCAO'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_INSTRUCAO'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_DEAD_LINE: TStringField
      FieldName = 'CD_DEAD_LINE'
      Origin = 'DBBROKER.TPARAMETROS.CD_DEAD_LINE'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_RECEB_COPIAS: TStringField
      FieldName = 'CD_EV_RECEB_COPIAS'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_RECEB_COPIAS'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_SOLIC_NF: TStringField
      FieldName = 'CD_EV_SOLIC_NF'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_SOLIC_NF'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_RECEB_NF: TStringField
      FieldName = 'CD_EV_RECEB_NF'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_RECEB_NF'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_SOLIC_NUM_IMP: TStringField
      FieldName = 'CD_EV_SOLIC_NUM_IMP'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_SOLIC_NUM_IMP'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_VL_MIN_COFINS: TFloatField
      FieldName = 'VL_MIN_COFINS'
      Origin = 'DBBROKER.TPARAMETROS.VL_MIN_COFINS'
    end
    object qry_parametros_CD_EV_DEAD_LINE_CC: TStringField
      FieldName = 'CD_EV_DEAD_LINE_CC'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_DEAD_LINE_CC'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_DEAD_LINE_DDE: TStringField
      FieldName = 'CD_EV_DEAD_LINE_DDE'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_DEAD_LINE_DDE'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_CONF_BOOK: TStringField
      FieldName = 'CD_EV_CONF_BOOK'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_CONF_BOOK'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_DEAD_DRAFT: TStringField
      FieldName = 'CD_EV_DEAD_DRAFT'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_DEAD_DRAFT'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_DEAD_LINE_CC_1: TStringField
      FieldName = 'CD_EV_DEAD_LINE_CC_1'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_DEAD_LINE_CC_1'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_ENTREGA_IMO: TStringField
      FieldName = 'CD_EV_ENTREGA_IMO'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_ENTREGA_IMO'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_ENTREGA_DDE: TStringField
      FieldName = 'CD_EV_ENTREGA_DDE'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_ENTREGA_DDE'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_INSPECAO: TStringField
      FieldName = 'CD_EV_INSPECAO'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_INSPECAO'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_FUMIGACAO: TStringField
      FieldName = 'CD_EV_FUMIGACAO'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_FUMIGACAO'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_ENTREGA_MERCAD: TStringField
      FieldName = 'CD_EV_ENTREGA_MERCAD'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_ENTREGA_MERCAD'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_ENTREGA_DRAFT_BL: TStringField
      FieldName = 'CD_EV_ENTREGA_DRAFT_BL'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_ENTREGA_DRAFT_BL'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_EV_IDENTIFICA_NOVO_PO: TStringField
      FieldName = 'CD_EV_IDENTIFICA_NOVO_PO'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_IDENTIFICA_NOVO_PO'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_IN_REMESSA: TStringField
      FieldName = 'IN_REMESSA'
      Origin = 'DBBROKER.TPARAMETROS.IN_REMESSA'
      FixedChar = True
      Size = 1
    end
    object qry_parametros_VL_FATURA: TFloatField
      FieldName = 'VL_FATURA'
      Origin = 'DBBROKER.TPARAMETROS.VL_FATURA'
    end
    object qry_parametros_VL_CORRETORA_AG: TFloatField
      FieldName = 'VL_CORRETORA_AG'
      Origin = 'DBBROKER.TPARAMETROS.VL_CORRETORA_AG'
    end
    object qry_parametros_VL_BANCO_AG: TFloatField
      FieldName = 'VL_BANCO_AG'
      Origin = 'DBBROKER.TPARAMETROS.VL_BANCO_AG'
    end
    object qry_parametros_VL_PERC_MIN: TFloatField
      FieldName = 'VL_PERC_MIN'
      Origin = 'DBBROKER.TPARAMETROS.VL_PERC_MIN'
    end
    object qry_parametros_IN_FORMA_RATEIO: TStringField
      FieldName = 'IN_FORMA_RATEIO'
      Origin = 'DBBROKER.TPARAMETROS.IN_FORMA_RATEIO'
      FixedChar = True
      Size = 1
    end
    object qry_parametros_IN_CONSOLIDACAO_LOCAL_DIF: TStringField
      FieldName = 'IN_CONSOLIDACAO_LOCAL_DIF'
      Origin = 'DBBROKER.TPARAMETROS.IN_CONSOLIDACAO_LOCAL_DIF'
      FixedChar = True
      Size = 1
    end
    object qry_parametros_NR_DIAS_VENCTO_DDE: TIntegerField
      FieldName = 'NR_DIAS_VENCTO_DDE'
      Origin = 'DBBROKER.TPARAMETROS.NR_DIAS_VENCTO_DDE'
    end
    object qry_parametros_CD_CT_PISCOFINS: TStringField
      FieldName = 'CD_CT_PISCOFINS'
      Origin = 'DBBROKER.TPARAMETROS.CD_CT_PISCOFINS'
      FixedChar = True
      Size = 10
    end
    object qry_parametros_IN_INTEGRACAO_CONTABIL: TStringField
      FieldName = 'IN_INTEGRACAO_CONTABIL'
      Origin = 'DBBROKER.TPARAMETROS.IN_INTEGRACAO_CONTABIL'
      FixedChar = True
      Size = 1
    end
    object qry_parametros_CD_ITEM_PIS_COFINS: TStringField
      FieldName = 'CD_ITEM_PIS_COFINS'
      Origin = 'DBBROKER.TPARAMETROS.CD_ITEM_PIS_COFINS'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_DT_CONTABILIZACAO: TDateTimeField
      FieldName = 'DT_CONTABILIZACAO'
      Origin = 'DBBROKER.TPARAMETROS.DT_CONTABILIZACAO'
    end
    object qry_parametros_DT_ALTER_FECH: TDateTimeField
      FieldName = 'DT_ALTER_FECH'
      Origin = 'DBBROKER.TPARAMETROS.DT_ALTER_FECH'
    end
    object qry_parametros_QT_DIAS_CAT63: TIntegerField
      FieldName = 'QT_DIAS_CAT63'
      Origin = 'DBBROKER.TPARAMETROS.QT_DIAS_CAT63'
    end
    object qry_parametros_CD_GRUPO_VALSPAR: TStringField
      FieldName = 'CD_GRUPO_VALSPAR'
      Origin = 'DBBROKER.TPARAMETROS.CD_GRUPO_VALSPAR'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_LookGrupoValspar: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookGrupoValspar'
      Size = 50
      Calculated = True
    end
    object qry_parametros_CD_GRUPO_VALTRA: TStringField
      FieldName = 'CD_GRUPO_VALTRA'
      Origin = 'DBBROKER.TPARAMETROS.CD_GRUPO_VALTRA'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_LookGrupoValtra: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookGrupoValtra'
      Size = 50
      Calculated = True
    end
    object qry_parametros_NR_ULT_RD: TStringField
      FieldName = 'NR_ULT_RD'
      Origin = 'DBBROKER.TPARAMETROS.NR_ULT_RD'
      FixedChar = True
      Size = 8
    end
    object qry_parametros_CD_GRUPO_CRODA: TStringField
      FieldName = 'CD_GRUPO_CRODA'
      Origin = 'DBBROKER.TPARAMETROS.CD_GRUPO_CRODA'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_LookGrupoCroda: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookGrupoCroda'
      Size = 50
      Calculated = True
    end
    object qry_parametros_NR_ULT_DEM: TStringField
      FieldName = 'NR_ULT_DEM'
      Origin = 'DBBROKER.TPARAMETROS.NR_ULT_DEM'
      FixedChar = True
      Size = 6
    end
    object qry_parametros_CD_GRUPO_SAINTG: TStringField
      FieldName = 'CD_GRUPO_SAINTG'
      Origin = 'DBBROKER.TPARAMETROS.CD_GRUPO_SAINTG'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_LookGrupoSaintG: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookGrupoSaintG'
      Size = 50
      Calculated = True
    end
    object qry_parametros_CD_GRUPO_BSH: TStringField
      FieldName = 'CD_GRUPO_BSH'
      Origin = 'DBBROKER.TPARAMETROS.CD_GRUPO_BSH'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_LookGrupoBSH: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookGrupoBSH'
      Size = 50
      Calculated = True
    end
    object qry_parametros_LookItemPisCofins: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemPisCofins'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_PIS_COFINS'
      Size = 30
      Lookup = True
    end
    object qry_parametros_CD_EV_DT_ENT_FABR: TStringField
      FieldName = 'CD_EV_DT_ENT_FABR'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_DT_ENT_FABR'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_LookCdEvEntFabr: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCdEvEntFabr'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_DT_ENT_FABR'
      Size = 100
      Lookup = True
    end
    object qry_parametros_CD_GRUPO_SOLVAY: TStringField
      FieldName = 'CD_GRUPO_SOLVAY'
      Origin = 'DBBROKER.TPARAMETROS.CD_GRUPO_SOLVAY'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_GRUPO_SOLVAYP: TStringField
      FieldName = 'CD_GRUPO_SOLVAYP'
      Origin = 'DBBROKER.TPARAMETROS.CD_GRUPO_SOLVAYP'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_GRUPO_SOLVAYQ: TStringField
      FieldName = 'CD_GRUPO_SOLVAYQ'
      Origin = 'DBBROKER.TPARAMETROS.CD_GRUPO_SOLVAYQ'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_GRUPO_WHITE: TStringField
      FieldName = 'CD_GRUPO_WHITE'
      Origin = 'DBBROKER.TPARAMETROS.CD_GRUPO_WHITE'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_GRUPO_MAKENI: TStringField
      FieldName = 'CD_GRUPO_MAKENI'
      Origin = 'DBBROKER.TPARAMETROS.CD_GRUPO_MAKENI'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_TP_EMULADOR: TStringField
      FieldName = 'TP_EMULADOR'
      Origin = 'DBBROKER.TPARAMETROS.TP_EMULADOR'
      FixedChar = True
      Size = 10
    end
    object qry_parametros_TIME_WAIT_EMULADOR: TIntegerField
      FieldName = 'TIME_WAIT_EMULADOR'
      Origin = 'DBBROKER.TPARAMETROS.TIME_WAIT_EMULADOR'
    end
    object qry_parametros_EXE_EMULADOR: TStringField
      FieldName = 'EXE_EMULADOR'
      Origin = 'DBBROKER.TPARAMETROS.EXE_EMULADOR'
      FixedChar = True
      Size = 40
    end
    object qry_parametros_PARAM_EMULADOR: TStringField
      FieldName = 'PARAM_EMULADOR'
      Origin = 'DBBROKER.TPARAMETROS.PARAM_EMULADOR'
      FixedChar = True
      Size = 40
    end
    object qry_parametros_TX_NOME_SESSION: TStringField
      FieldName = 'TX_NOME_SESSION'
      Origin = 'DBBROKER.TPARAMETROS.TX_NOME_SESSION'
      FixedChar = True
      Size = 40
    end
    object qry_parametros_NR_DIAS_CONS_PROC: TIntegerField
      FieldName = 'NR_DIAS_CONS_PROC'
      Origin = 'DBBROKER.TPARAMETROS.NR_DIAS_CONS_PROC'
    end
    object qry_parametros_IN_EXP_CALCULOS_RE: TStringField
      FieldName = 'IN_EXP_CALCULOS_RE'
      Origin = 'DBBROKER.TPARAMETROS.IN_EXP_CALCULOS_RE'
      FixedChar = True
      Size = 1
    end
    object qry_parametros_PC_FUNDO_POBREZA_RJ: TFloatField
      FieldName = 'PC_FUNDO_POBREZA_RJ'
      Origin = 'DBBROKER.TPARAMETROS.PC_FUNDO_POBREZA_RJ'
    end
    object qry_parametros_CD_ITEM_DESP_BANCO: TStringField
      FieldName = 'CD_ITEM_DESP_BANCO'
      Origin = 'DBBROKER.TPARAMETROS.CD_ITEM_DESP_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_CREDIT_NOTE: TStringField
      FieldName = 'CD_CREDIT_NOTE'
      Origin = 'DBBROKER.TPARAMETROS.CD_CREDIT_NOTE'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_DEBIT_NOTE: TStringField
      FieldName = 'CD_DEBIT_NOTE'
      Origin = 'DBBROKER.TPARAMETROS.CD_DEBIT_NOTE'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_VL_PC_PROTEC_CAMBIAL: TFloatField
      FieldName = 'VL_PC_PROTEC_CAMBIAL'
      Origin = 'DBBROKER.TPARAMETROS.VL_PC_PROTEC_CAMBIAL'
    end
    object qry_parametros_CD_BCO_FLUXO_CX: TStringField
      FieldName = 'CD_BCO_FLUXO_CX'
      Origin = 'DBBROKER.TPARAMETROS.CD_BCO_FLUXO_CX'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_CT_CAIXA: TStringField
      FieldName = 'CD_CT_CAIXA'
      Origin = 'DBBROKER.TPARAMETROS.CD_CT_CAIXA'
      FixedChar = True
      Size = 12
    end
    object qry_parametros_VL_TOLERANCIA_NF: TFloatField
      FieldName = 'VL_TOLERANCIA_NF'
      Origin = 'DBBROKER.TPARAMETROS.VL_TOLERANCIA_NF'
    end
    object qry_parametros_QT_DIAS_SENHA: TIntegerField
      FieldName = 'QT_DIAS_SENHA'
      Origin = 'DBBROKER.TPARAMETROS.QT_DIAS_SENHA'
    end
    object qry_parametros_CD_CT_CH_PAGTOS_DIV: TStringField
      FieldName = 'CD_CT_CH_PAGTOS_DIV'
      Origin = 'DBBROKER.TPARAMETROS.CD_CT_CH_PAGTOS_DIV'
      FixedChar = True
      Size = 12
    end
    object qry_parametros_CD_CT_FAT_A_CLASSIF: TStringField
      FieldName = 'CD_CT_FAT_A_CLASSIF'
      Origin = 'DBBROKER.TPARAMETROS.CD_CT_FAT_A_CLASSIF'
      FixedChar = True
      Size = 12
    end
    object qry_parametros_CD_CT_IR: TStringField
      FieldName = 'CD_CT_IR'
      Origin = 'DBBROKER.TPARAMETROS.CD_CT_IR'
      FixedChar = True
      Size = 12
    end
    object qry_parametros_CD_CT_CTAAPAGAR: TStringField
      FieldName = 'CD_CT_CTAAPAGAR'
      Origin = 'DBBROKER.TPARAMETROS.CD_CT_CTAAPAGAR'
      FixedChar = True
      Size = 12
    end
    object qry_parametros_CD_CT_INSS: TStringField
      FieldName = 'CD_CT_INSS'
      Origin = 'DBBROKER.TPARAMETROS.CD_CT_INSS'
      FixedChar = True
      Size = 12
    end
    object qry_parametros_CD_CT_LP_SALDUS: TStringField
      FieldName = 'CD_CT_LP_SALDUS'
      Origin = 'DBBROKER.TPARAMETROS.CD_CT_LP_SALDUS'
      FixedChar = True
      Size = 12
    end
    object qry_parametros_CD_CT_CONTABIL_JUROS: TStringField
      FieldName = 'CD_CT_CONTABIL_JUROS'
      Origin = 'DBBROKER.TPARAMETROS.CD_CT_CONTABIL_JUROS'
      FixedChar = True
      Size = 12
    end
    object qry_parametros_CD_CT_CONTABIL_DESCONTO: TStringField
      FieldName = 'CD_CT_CONTABIL_DESCONTO'
      Origin = 'DBBROKER.TPARAMETROS.CD_CT_CONTABIL_DESCONTO'
      FixedChar = True
      Size = 12
    end
    object qry_parametros_CD_CT_CTAARECEBER: TStringField
      FieldName = 'CD_CT_CTAARECEBER'
      Origin = 'DBBROKER.TPARAMETROS.CD_CT_CTAARECEBER'
      FixedChar = True
      Size = 12
    end
    object qry_parametros_CD_EV_DT_DEAD_LINE_TEMP: TStringField
      FieldName = 'CD_EV_DT_DEAD_LINE_TEMP'
      Origin = 'DBBROKER.TPARAMETROS.CD_EV_DT_DEAD_LINE_TEMP'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_VL_TX_UTILIZACAO_AFRMM: TFloatField
      FieldName = 'VL_TX_UTILIZACAO_AFRMM'
      Origin = 'DBBROKER.TPARAMETROS.VL_TX_UTILIZACAO_AFRMM'
      DisplayFormat = '#0,.00'
    end
    object qry_parametros_CD_ITEM_FRT_MAR_FI: TStringField
      FieldName = 'CD_ITEM_FRT_MAR_FI'
      Origin = 'DBBROKER.TPARAMETROS.CD_ITEM_FRT_MAR_FI'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_ITEM_FRT_AER_FI: TStringField
      FieldName = 'CD_ITEM_FRT_AER_FI'
      Origin = 'DBBROKER.TPARAMETROS.CD_ITEM_FRT_AER_FI'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_ITEM_FRT_ROD_FI: TStringField
      FieldName = 'CD_ITEM_FRT_ROD_FI'
      Origin = 'DBBROKER.TPARAMETROS.CD_ITEM_FRT_ROD_FI'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_CD_ITEM_FRT_SEGURO: TStringField
      FieldName = 'CD_ITEM_FRT_SEGURO'
      Origin = 'DBBROKER.TPARAMETROS.CD_ITEM_FRT_SEGURO'
      FixedChar = True
      Size = 3
    end
    object qry_parametros_LookItemFrtMarFI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemFrtMarFI'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'cd_item_frt_mar_fi'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemFrtSeguro: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemFrtSeguro'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_FRT_SEGURO'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemFrtAerFI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemFrtAerFI'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_FRT_AER_FI'
      Size = 30
      Lookup = True
    end
    object qry_parametros_LookItemFrtRodFI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemFrtRodFI'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM_FRT_ROD_FI'
      Size = 30
      Lookup = True
    end
  end
  object qry_evento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EVENTO, NM_EVENTO'
      'FROM TEVENTO')
    Left = 248
    Top = 129
    object qry_evento_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 3
    end
    object qry_evento_NM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Origin = 'TEVENTO.NM_EVENTO'
      Size = 50
    end
  end
  object qry_tp_ncm_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_NCM')
    Left = 156
    Top = 188
    object qry_tp_ncm_TP_NCM: TStringField
      FieldName = 'TP_NCM'
      Origin = 'TTP_NCM.TP_NCM'
      Size = 1
    end
    object qry_tp_ncm_NM_NCM: TStringField
      FieldName = 'NM_NCM'
      Origin = 'TTP_NCM.TP_NCM'
    end
  end
  object ds_tp_ncm: TDataSource
    DataSet = qry_tp_ncm_
    Left = 48
    Top = 188
  end
  object ds_tp_naladi: TDataSource
    DataSet = qry_tp_naladi_
    Left = 48
    Top = 253
  end
  object qry_tp_naladi_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_NALADI')
    Left = 156
    Top = 253
    object qry_tp_naladi_TP_NALADI: TStringField
      FieldName = 'TP_NALADI'
      Origin = 'TTP_NALADI.TP_NALADI'
      Size = 1
    end
    object qry_tp_naladi_NM_NALADI: TStringField
      FieldName = 'NM_NALADI'
      Origin = 'TTP_NALADI.TP_NALADI'
    end
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM TITEM')
    Left = 248
    Top = 188
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
  end
  object qry_tp_mod_fat_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_MOD_FAT')
    Left = 348
    Top = 24
    object qry_tp_mod_fat_CD_MOD_FAT: TStringField
      FieldName = 'CD_MOD_FAT'
      Origin = 'TTP_MOD_FAT.CD_MOD_FAT'
      Size = 1
    end
    object qry_tp_mod_fat_NM_MOD_FAT: TStringField
      FieldName = 'NM_MOD_FAT'
      Origin = 'TTP_MOD_FAT.NM_MOD_FAT'
    end
  end
  object ds_tp_mod_fat: TDataSource
    DataSet = qry_tp_mod_fat_
    Left = 248
    Top = 24
  end
  object qry_sistema_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TSISTEMA_CONTABIL')
    Left = 348
    Top = 188
    object qry_sistema_contabil_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TSISTEMA_CONTABIL.CD_SISTEMA_CONTABIL'
      Size = 1
    end
    object qry_sistema_contabil_NM_SISTEMA_CONTABIL: TStringField
      FieldName = 'NM_SISTEMA_CONTABIL'
      Origin = 'TSISTEMA_CONTABIL.NM_SISTEMA_CONTABIL'
      Size = 40
    end
  end
  object ds_sistema_contabil: TDataSource
    DataSet = qry_sistema_contabil_
    Left = 348
    Top = 129
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO, NR_BANCO'
      'FROM TBANCO')
    Left = 248
    Top = 253
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
    object qry_banco_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM TYES_NO')
    Left = 551
    Top = 24
    object qry_yes_no_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 1
    end
    object qry_yes_no_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
  end
  object ds_yesno: TDataSource
    DataSet = qry_yes_no_
    Left = 452
    Top = 24
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM TCT_CONTABIL')
    Left = 348
    Top = 253
    object qry_ct_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 10
    end
    object qry_ct_contabil_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
  end
  object qry_local_emissao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, NOME'
      'FROM   TLOCAL_EMISSAO')
    Left = 452
    Top = 253
    object qry_local_emissao_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TLOCAL_EMISSAO.CODIGO'
      Size = 3
    end
    object qry_local_emissao_NOME: TStringField
      FieldName = 'NOME'
      Origin = 'TLOCAL_EMISSAO.NOME'
      Size = 50
    end
  end
  object qry_ct_contabilRM_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM   TCONTABIL_PLANO'
      'WHERE CD_COLIGADA = '#39'01'#39)
    Left = 452
    Top = 188
    object qry_ct_contabilRM_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCONTABIL_PLANO.CD_CT_CONTABIL'
      Size = 10
    end
    object qry_ct_contabilRM_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCONTABIL_PLANO.NM_CT_CONTABIL'
      Size = 40
    end
  end
  object qry_documento_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM   TTP_DOCUMENTO')
    Left = 551
    Top = 188
    object qry_documento_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_DOCUMENTO.CODIGO'
      Size = 3
    end
    object qry_documento_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_DOCUMENTO.DESCRICAO'
      Size = 50
    end
  end
  object qry_carteira_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PARAMETRO, NM_PARAMETRO'
      'FROM TITENS_PARAMETRO'
      'WHERE CD_TIPO = '#39'001'#39
      'AND CD_BANCO = :CD_BANCO')
    Left = 156
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object qry_carteira_CD_PARAMETRO: TStringField
      FieldName = 'CD_PARAMETRO'
      Origin = 'TITENS_PARAMETRO.CD_PARAMETRO'
      Size = 3
    end
    object qry_carteira_NM_PARAMETRO: TStringField
      FieldName = 'NM_PARAMETRO'
      Origin = 'TITENS_PARAMETRO.NM_PARAMETRO'
      Size = 50
    end
  end
  object ds_carteira: TDataSource
    DataSet = qry_carteira_
    Left = 48
    Top = 312
  end
  object qry_cadastramento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PARAMETRO, NM_PARAMETRO'
      'FROM TITENS_PARAMETRO'
      'WHERE CD_TIPO = '#39'002'#39
      'AND CD_BANCO = :CD_BANCO')
    Left = 348
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'CD_PARAMETRO'
      Origin = 'TITENS_PARAMETRO.CD_PARAMETRO'
      Size = 3
    end
    object StringField2: TStringField
      FieldName = 'NM_PARAMETRO'
      Origin = 'TITENS_PARAMETRO.NM_PARAMETRO'
      Size = 50
    end
  end
  object ds_cadastramento: TDataSource
    DataSet = qry_cadastramento_
    Left = 248
    Top = 312
  end
  object ds_tp_docto: TDataSource
    DataSet = qry_tp_docto
    Left = 452
    Top = 312
  end
  object qry_tp_docto: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PARAMETRO, NM_PARAMETRO'
      'FROM TITENS_PARAMETRO'
      'WHERE CD_TIPO = '#39'003'#39
      'AND CD_BANCO = :CD_BANCO')
    Left = 551
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object StringField3: TStringField
      FieldName = 'CD_PARAMETRO'
      Origin = 'TITENS_PARAMETRO.CD_PARAMETRO'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'NM_PARAMETRO'
      Origin = 'TITENS_PARAMETRO.NM_PARAMETRO'
      Size = 50
    end
  end
  object ds_emissao: TDataSource
    DataSet = qry_emissao_
    Left = 48
    Top = 376
  end
  object qry_emissao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PARAMETRO, NM_PARAMETRO'
      'FROM TITENS_PARAMETRO'
      'WHERE CD_TIPO = '#39'004'#39
      'AND CD_BANCO = :CD_BANCO')
    Left = 156
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object StringField5: TStringField
      FieldName = 'CD_PARAMETRO'
      Origin = 'TITENS_PARAMETRO.CD_PARAMETRO'
      Size = 3
    end
    object StringField6: TStringField
      FieldName = 'NM_PARAMETRO'
      Origin = 'TITENS_PARAMETRO.NM_PARAMETRO'
      Size = 50
    end
  end
  object ds_distribui: TDataSource
    DataSet = qry_distribui
    Left = 248
    Top = 376
  end
  object qry_distribui: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PARAMETRO, NM_PARAMETRO'
      'FROM TITENS_PARAMETRO'
      'WHERE CD_TIPO = '#39'005'#39
      'AND CD_BANCO = :CD_BANCO')
    Left = 348
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object StringField7: TStringField
      FieldName = 'CD_PARAMETRO'
      Origin = 'TITENS_PARAMETRO.CD_PARAMETRO'
      Size = 3
    end
    object StringField8: TStringField
      FieldName = 'NM_PARAMETRO'
      Origin = 'TITENS_PARAMETRO.NM_PARAMETRO'
      Size = 50
    end
  end
  object qry_ct_gerencialRM_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_GERENCIAL, NM_CT_GERENCIAL'
      'FROM   TCONTABIL_GERENCIAL'
      'WHERE CD_COLIGADA = '#39'01'#39)
    Left = 452
    Top = 376
    object qry_ct_gerencialRM_CD_CT_GERENCIAL: TStringField
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TCONTABIL_GERENCIAL.CD_CT_GERENCIAL'
      Size = 4
    end
    object qry_ct_gerencialRM_NM_CT_GERENCIAL: TStringField
      FieldName = 'NM_CT_GERENCIAL'
      Origin = 'TCONTABIL_GERENCIAL.NM_CT_GERENCIAL'
    end
  end
  object qry_ct_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_GERENCIAL, NM_CT_GERENCIAL'
      'FROM   TCT_GERENCIAL'
      '')
    Left = 551
    Top = 376
    object qry_ct_gerencial_CD_CT_GERENCIAL: TStringField
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TCT_GERENCIAL.CD_CT_GERENCIAL'
      Size = 4
    end
    object qry_ct_gerencial_NM_CT_GERENCIAL: TStringField
      FieldName = 'NM_CT_GERENCIAL'
      Origin = 'TCT_GERENCIAL.NM_CT_GERENCIAL'
    end
  end
  object qry_param_dem_: TQuery
    CachedUpdates = True
    OnCalcFields = qry_param_dem_CalcFields
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT INDICE, NR_DIAS_DESEMB, NR_DIAS_NF_TRANSP, NR_DIAS_RET_CN' +
        'TR, NR_DIAS_DEMURRAGE, IN_AVISO_DEMURRAGE, CD_USUARIO_DEMURRAGE'
      'FROM   TPARAMETROS'
      '')
    UpdateObject = us_param_dem
    Left = 156
    Top = 74
    object qry_param_dem_INDICE: TStringField
      FieldName = 'INDICE'
      Origin = 'TPARAMETROS.INDICE'
      Size = 1
    end
    object qry_param_dem_NR_DIAS_DESEMB: TSmallintField
      FieldName = 'NR_DIAS_DESEMB'
      Origin = 'TPARAMETROS.NR_DIAS_DESEMB'
    end
    object qry_param_dem_NR_DIAS_NF_TRANSP: TSmallintField
      FieldName = 'NR_DIAS_NF_TRANSP'
      Origin = 'TPARAMETROS.NR_DIAS_NF_TRANSP'
    end
    object qry_param_dem_NR_DIAS_RET_CNTR: TSmallintField
      FieldName = 'NR_DIAS_RET_CNTR'
      Origin = 'TPARAMETROS.NR_DIAS_RET_CNTR'
    end
    object qry_param_dem_NR_DIAS_DEMURRAGE: TSmallintField
      FieldName = 'NR_DIAS_DEMURRAGE'
      Origin = 'TPARAMETROS.NR_DIAS_DEMURRAGE'
    end
    object qry_param_dem_IN_AVISO_DEMURRAGE: TStringField
      FieldName = 'IN_AVISO_DEMURRAGE'
      Origin = 'TPARAMETROS.IN_AVISO_DEMURRAGE'
      Size = 1
    end
    object qry_param_dem_CD_USUARIO_DEMURRAGE: TStringField
      FieldName = 'CD_USUARIO_DEMURRAGE'
      Origin = 'TPARAMETROS.INDICE'
      Size = 4
    end
    object qry_param_dem_LookAvisoDemurrage: TStringField
      DisplayLabel = 'Avisos de Demurrage'
      FieldKind = fkLookup
      FieldName = 'LookAvisoDemurrage'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_AVISO_DEMURRAGE'
      Size = 3
      Lookup = True
    end
    object qry_param_dem_LookUsuarioDemurrage: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUsuarioDemurrage'
      Size = 50
      Calculated = True
    end
  end
  object ds_param_dem: TDataSource
    DataSet = qry_param_dem_
    Left = 48
    Top = 76
  end
  object us_param_dem: TUpdateSQL
    ModifySQL.Strings = (
      'update TPARAMETROS'
      'set'
      '  INDICE = :INDICE,'
      '  NR_DIAS_DESEMB = :NR_DIAS_DESEMB,'
      '  NR_DIAS_NF_TRANSP = :NR_DIAS_NF_TRANSP,'
      '  NR_DIAS_RET_CNTR = :NR_DIAS_RET_CNTR,'
      '  NR_DIAS_DEMURRAGE = :NR_DIAS_DEMURRAGE,'
      '  IN_AVISO_DEMURRAGE = :IN_AVISO_DEMURRAGE,'
      '  CD_USUARIO_DEMURRAGE = :CD_USUARIO_DEMURRAGE'
      'where'
      '  INDICE = :OLD_INDICE')
    InsertSQL.Strings = (
      'insert into TPARAMETROS'
      
        '  (INDICE, NR_DIAS_DESEMB, NR_DIAS_NF_TRANSP, NR_DIAS_RET_CNTR, ' +
        'NR_DIAS_DEMURRAGE, '
      '   IN_AVISO_DEMURRAGE, CD_USUARIO_DEMURRAGE)'
      'values'
      
        '  (:INDICE, :NR_DIAS_DESEMB, :NR_DIAS_NF_TRANSP, :NR_DIAS_RET_CN' +
        'TR, :NR_DIAS_DEMURRAGE, '
      '   :IN_AVISO_DEMURRAGE, :CD_USUARIO_DEMURRAGE)')
    DeleteSQL.Strings = (
      'delete from TPARAMETROS'
      'where'
      '  INDICE = :OLD_INDICE')
    Left = 248
    Top = 75
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM   TUSUARIO'
      'WHERE  CD_USUARIO = :CD_USUARIO')
    Left = 551
    Top = 75
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object ds_usuario: TDataSource
    DataSet = qry_usuario_
    Left = 452
    Top = 75
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO'
      'FROM   TGRUPO'
      'WHERE  CD_GRUPO = :CD_GRUPO')
    Left = 551
    Top = 253
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO.NM_GRUPO'
      Size = 50
    end
  end
  object qry_tp_at_basf_: TQuery
    AfterPost = qry_tp_at_basf_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TTP_AT_BASF'
      'ORDER BY TP_AT_BASF DESC ')
    Left = 551
    Top = 129
    object qry_tp_at_basf_TP_AT_BASF: TStringField
      DisplayLabel = 'C'#243'd.'
      DisplayWidth = 2
      FieldName = 'TP_AT_BASF'
      Origin = 'TTP_AT_BASF.TP_AT_BASF'
      Size = 2
    end
    object qry_tp_at_basf_NM_TP_AT_BASF: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'NM_TP_AT_BASF'
      Origin = 'TTP_AT_BASF.NM_TP_AT_BASF'
      Size = 30
    end
    object qry_tp_at_basf_VL_TRANSMISSAO: TFloatField
      DisplayLabel = 'Vl. Trans.'
      FieldName = 'VL_TRANSMISSAO'
      Origin = 'TTP_AT_BASF.VL_TRANSMISSAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tp_at_basf_VL_FOLLOWUP: TFloatField
      DisplayLabel = 'Vl. Followup'
      FieldName = 'VL_FOLLOWUP'
      Origin = 'TTP_AT_BASF.VL_FOLLOWUP'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tp_at_basf_VL_REVISAO_FAT: TFloatField
      DisplayLabel = 'Vl. Revis'#227'o Fatura'
      FieldName = 'VL_REVISAO_FAT'
      Origin = 'TTP_AT_BASF.TP_AT_BASF'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tp_at_basf_VL_DEMURRAGE: TFloatField
      DisplayLabel = 'Vl. Demurrage'
      FieldName = 'VL_DEMURRAGE'
      Origin = 'TTP_AT_BASF.NM_TP_AT_BASF'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tp_at_basf_VL_ENT_BASF: TFloatField
      DisplayLabel = 'Vl. Ent. BASF'
      FieldName = 'VL_ENT_BASF'
      Origin = 'TTP_AT_BASF.VL_TRANSMISSAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tp_at_basf_VL_ENT_BSG: TFloatField
      DisplayLabel = 'Vl. Ent. BSG'
      FieldName = 'VL_ENT_BSG'
      Origin = 'TTP_AT_BASF.VL_FOLLOWUP'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tp_at_basf_VL_CHEC_DOC: TFloatField
      DisplayLabel = 'Vl. Checagem Doctos'
      FieldName = 'VL_CHEC_DOC'
      Origin = 'TTP_AT_BASF.VL_REVISAO_FAT'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_tp_at_basf: TDataSource
    DataSet = qry_tp_at_basf_
    Left = 452
    Top = 129
  end
end
