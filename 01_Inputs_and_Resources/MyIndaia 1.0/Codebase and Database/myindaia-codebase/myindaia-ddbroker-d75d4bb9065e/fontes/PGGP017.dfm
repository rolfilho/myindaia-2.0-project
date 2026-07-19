object datm_main: Tdatm_main
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 282
  Top = 83
  Height = 598
  Width = 910
  object tbl_parametro_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TPARAMETROS'
    Left = 221
    Top = 236
    object tbl_parametro_DT_SOLIC_CH: TDateTimeField
      FieldName = 'DT_SOLIC_CH'
    end
    object tbl_parametro_NR_SOLIC_CH: TIntegerField
      FieldName = 'NR_SOLIC_CH'
      Required = True
    end
    object tbl_parametro_HM_PARA_SOLIC_CH: TStringField
      FieldName = 'HM_PARA_SOLIC_CH'
      Size = 5
    end
    object tbl_parametro_PATH_RISC: TStringField
      FieldName = 'PATH_RISC'
      Size = 100
    end
    object tbl_parametro_NM_SERVIDOR: TStringField
      FieldName = 'NM_SERVIDOR'
      Size = 15
    end
    object tbl_parametro_NM_CID_CHEQUE: TStringField
      FieldName = 'NM_CID_CHEQUE'
    end
    object tbl_parametro_CD_ITEM_SDA: TStringField
      FieldName = 'CD_ITEM_SDA'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_RECEB_NUM: TStringField
      FieldName = 'CD_ITEM_RECEB_NUM'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_DEVOL_NUM: TStringField
      FieldName = 'CD_ITEM_DEVOL_NUM'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_EXTOR_NUM: TStringField
      FieldName = 'CD_ITEM_EXTOR_NUM'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_SALDO_CRE: TStringField
      FieldName = 'CD_ITEM_SALDO_CRE'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_SALDO_DEB: TStringField
      FieldName = 'CD_ITEM_SALDO_DEB'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_RECEB_SD: TStringField
      FieldName = 'CD_ITEM_RECEB_SD'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_PAGTO_SD: TStringField
      FieldName = 'CD_ITEM_PAGTO_SD'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_IR: TStringField
      FieldName = 'CD_ITEM_IR'
      Size = 3
    end
    object tbl_parametro_VL_ALIQ_IR: TFloatField
      FieldName = 'VL_ALIQ_IR'
    end
    object tbl_parametro_VL_MIN_IR: TFloatField
      FieldName = 'VL_MIN_IR'
    end
    object tbl_parametro_CD_EV_REG_DI: TStringField
      FieldName = 'CD_EV_REG_DI'
      Size = 3
    end
    object tbl_parametro_CD_EV_DESEMB: TStringField
      FieldName = 'CD_EV_DESEMB'
      Size = 3
    end
    object tbl_parametro_CD_EV_PAGTO_LI: TStringField
      FieldName = 'CD_EV_PAGTO_LI'
      Size = 3
    end
    object tbl_parametro_CD_EV_ENT: TStringField
      FieldName = 'CD_EV_ENT'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_CPMF: TStringField
      FieldName = 'CD_ITEM_CPMF'
      Size = 3
    end
    object tbl_parametro_CD_EV_CHEGADA: TStringField
      FieldName = 'CD_EV_CHEGADA'
      Size = 3
    end
    object tbl_parametro_CD_EV_ENT_SETPIN: TStringField
      FieldName = 'CD_EV_ENT_SETPIN'
      Size = 3
    end
    object tbl_parametro_CD_EV_SAI_SETPIN: TStringField
      FieldName = 'CD_EV_SAI_SETPIN'
      Size = 3
    end
    object tbl_parametro_CD_EV_DESCARGA: TStringField
      FieldName = 'CD_EV_DESCARGA'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_COMISSAO: TStringField
      FieldName = 'CD_ITEM_COMISSAO'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_EXPED: TStringField
      FieldName = 'CD_ITEM_EXPED'
      Size = 3
    end
    object tbl_parametro_CD_EV_PREV_CHEGADA: TStringField
      FieldName = 'CD_EV_PREV_CHEGADA'
      Size = 3
    end
    object tbl_parametro_CD_EV_ETD: TStringField
      FieldName = 'CD_EV_ETD'
      Size = 3
    end
    object tbl_parametro_CD_EV_PREV_DESEMB: TStringField
      FieldName = 'CD_EV_PREV_DESEMB'
      Size = 3
    end
    object tbl_parametro_CD_EV_CONHECIMENTO: TStringField
      FieldName = 'CD_EV_CONHECIMENTO'
      Size = 3
    end
    object tbl_parametro_CD_EV_RECEB_DOC: TStringField
      FieldName = 'CD_EV_RECEB_DOC'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_II: TStringField
      FieldName = 'CD_ITEM_II'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_IPI: TStringField
      FieldName = 'CD_ITEM_IPI'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_ICMS: TStringField
      FieldName = 'CD_ITEM_ICMS'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_FRETE_AEREO: TStringField
      FieldName = 'CD_ITEM_FRETE_AEREO'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_FRETE_MAR: TStringField
      FieldName = 'CD_ITEM_FRETE_MAR'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_SEGURO: TStringField
      FieldName = 'CD_ITEM_SEGURO'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_VMLE: TStringField
      FieldName = 'CD_ITEM_VMLE'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_ACRESC: TStringField
      FieldName = 'CD_ITEM_ACRESC'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_DED: TStringField
      FieldName = 'CD_ITEM_DED'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_SISCOMEX: TStringField
      FieldName = 'CD_ITEM_SISCOMEX'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_AFRMM: TStringField
      FieldName = 'CD_ITEM_AFRMM'
      Size = 3
    end
    object tbl_parametro_CD_GRP_ITEM_FRETE: TStringField
      FieldName = 'CD_GRP_ITEM_FRETE'
      Size = 2
    end
    object tbl_parametro_CD_GRP_ITEM_ARM: TStringField
      FieldName = 'CD_GRP_ITEM_ARM'
      Size = 2
    end
    object tbl_parametro_CD_GRP_ITEM_CAP: TStringField
      FieldName = 'CD_GRP_ITEM_CAP'
      Size = 2
    end
    object tbl_parametro_PATH_CONTABIL: TStringField
      FieldName = 'PATH_CONTABIL'
      Size = 100
    end
    object tbl_parametro_PATH_GSM_SERVER: TStringField
      FieldName = 'PATH_GSM_SERVER'
      Size = 100
    end
    object tbl_parametro_PATH_GSM_CLIENT: TStringField
      FieldName = 'PATH_GSM_CLIENT'
      Size = 100
    end
    object tbl_parametro_CD_INSTALACAO: TStringField
      FieldName = 'CD_INSTALACAO'
      Size = 1
    end
    object tbl_parametro_CD_MOEDA_CORRENTE: TStringField
      FieldName = 'CD_MOEDA_CORRENTE'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_NAO_FAT: TStringField
      FieldName = 'CD_ITEM_NAO_FAT'
      Size = 3
    end
    object tbl_parametro_CD_EV_ABRE_PROC: TStringField
      FieldName = 'CD_EV_ABRE_PROC'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_ISS: TStringField
      FieldName = 'CD_ITEM_ISS'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_EXT_RECEB: TStringField
      FieldName = 'CD_ITEM_EXT_RECEB'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_EXT_PAGTO: TStringField
      FieldName = 'CD_ITEM_EXT_PAGTO'
      Size = 3
    end
    object tbl_parametro_CD_ITEM_PAGO_CLI: TStringField
      FieldName = 'CD_ITEM_PAGO_CLI'
      Size = 3
    end
    object tbl_parametro_PATH_COB_AUT_IMP: TStringField
      FieldName = 'PATH_COB_AUT_IMP'
      Size = 255
    end
    object tbl_parametro_PATH_COB_AUT_TRANS: TStringField
      FieldName = 'PATH_COB_AUT_TRANS'
      Size = 255
    end
    object tbl_parametro_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Size = 1
    end
    object tbl_parametro_VL_MINIMO_TED: TFloatField
      FieldName = 'VL_MINIMO_TED'
    end
    object tbl_parametro_CD_ITEM_DEMURRAGE: TStringField
      FieldName = 'CD_ITEM_DEMURRAGE'
      Size = 3
    end
    object tbl_parametro_VL_AUTOCLOSER: TIntegerField
      FieldName = 'VL_AUTOCLOSER'
    end
    object tbl_parametro_IN_INTEGRACAO_CONTABIL: TStringField
      FieldName = 'IN_INTEGRACAO_CONTABIL'
      FixedChar = True
      Size = 1
    end
    object tbl_parametro_DT_CONTABILIZACAO: TDateTimeField
      FieldName = 'DT_CONTABILIZACAO'
    end
    object tbl_parametro_NR_ULT_RD: TStringField
      FieldName = 'NR_ULT_RD'
      FixedChar = True
      Size = 8
    end
    object tbl_parametro_NR_DIAS_CONS_PROC: TIntegerField
      FieldName = 'NR_DIAS_CONS_PROC'
    end
    object tbl_parametro_CD_EV_DT_ENT_FABR: TStringField
      FieldName = 'CD_EV_DT_ENT_FABR'
      FixedChar = True
      Size = 3
    end
  end
  object sp_data_hora_server: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_NT_Server_Data_Hora'
    Left = 442
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = '@dt_nt_server'
        ParamType = ptOutput
        Value = 36399.3488616088d
      end>
  end
  object db_broker: TDatabase
    AliasName = 'BROKER'
    Connected = True
    DatabaseName = 'DBBROKER'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SA'
      'PASSWORD=123'
      'HOST NAME='
      'DATABASE NAME=BROKER')
    SessionName = 'Default'
    BeforeConnect = db_brokerBeforeConnect
    Left = 128
    Top = 20
  end
  object qry_direito_acesso_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      ' CA.IN_ACESSO,'
      ' CA.IN_INCLUIR,'
      ' CA.IN_MODIFICAR,'
      ' CA.IN_EXCLUIR'
      'FROM TCONTROLE_ACESSO CA'
      'WHERE CA.CD_CARGO = :CD_CARGO'
      'AND CA.CD_MODULO = :CD_MODULO'
      'AND CA.CD_ROTINA = :CD_ROTINA'
      '  ')
    Left = 121
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ROTINA'
        ParamType = ptUnknown
      end>
    object qry_direito_acesso_IN_ACESSO: TBooleanField
      FieldName = 'IN_ACESSO'
      Origin = 'TCONTROLE_ACESSO.IN_ACESSO'
    end
    object qry_direito_acesso_IN_INCLUIR: TBooleanField
      FieldName = 'IN_INCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_INCLUIR'
    end
    object qry_direito_acesso_IN_MODIFICAR: TBooleanField
      FieldName = 'IN_MODIFICAR'
      Origin = 'TCONTROLE_ACESSO.IN_MODIFICAR'
    end
    object qry_direito_acesso_IN_EXCLUIR: TBooleanField
      FieldName = 'IN_EXCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_EXCLUIR'
    end
  end
  object qry_insere_log_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'INSERT INTO TLOG'
      '(CD_USUARIO, CD_TABELA, CD_MOVIMENTO, CD_MODULO,'
      'CD_ROTINA, CD_CHAVE, DT_MOVIMENTO)'
      'VALUES (:CD_USUARIO, :CD_TABELA, :CD_MOVIMENTO, :CD_MODULO,'
      ':CD_ROTINA, :CD_CHAVE, :DT_MOVIMENTO  )')
    Left = 120
    Top = 172
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_TABELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ROTINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CHAVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end>
  end
  object sp_atz_contabil: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_contabil'
    Left = 544
    Top = 236
  end
  object qry_di_calculo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '#9'IN_MOEDA_UNICA, '
      #9'ISNULL( VL_TOTAL_MLE_MN, 0 ) VL_TOTAL_MLE_MN,'
      #9'ISNULL( VL_TOT_MLE_MNEG, 0 ) VL_TOT_MLE_MNEG,'
      #9'ISNULL( PL_CARGA, 0 ) PL_CARGA,'
      #9'ISNULL( ('
      #9'SELECT  ISNULL( SUM( VL_MLE_ITEM ), 0)'
      #9'FROM TDETALHE_MERCADORIA DM'
      #9'WHERE DM.NR_PROCESSO = DI.NR_PROCESSO'
      #9'),0 ) SUM_VL_MLE_ITEM,'
      #9'ISNULL( ('
      #9'SELECT  ISNULL( SUM( VL_MLE_ITEM_MN ), 0)'
      #9'FROM TDETALHE_MERCADORIA DM'
      #9'WHERE DM.NR_PROCESSO = DI.NR_PROCESSO'
      #9'),0 ) SUM_VL_MLE_ITEM_MN,'
      #9'ISNULL( ('
      #9'SELECT  ISNULL( SUM( PL_MERCADORIA ), 0)'
      #9'FROM TDETALHE_MERCADORIA DM'
      #9'WHERE DM.NR_PROCESSO = DI.NR_PROCESSO'
      #9'),0 ) SUM_PL_MERCADORIA'
      'FROM TDECLARACAO_IMPORTACAO DI'
      'WHERE DI.NR_PROCESSO = :NR_PROCESSO')
    Left = 221
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_calculo_IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
    end
    object qry_di_calculo_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
    end
    object qry_di_calculo_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
    end
    object qry_di_calculo_PL_CARGA: TFloatField
      FieldName = 'PL_CARGA'
    end
    object qry_di_calculo_SUM_PL_MERCADORIA: TFloatField
      FieldName = 'SUM_PL_MERCADORIA'
    end
    object qry_di_calculo_SUM_VL_MLE_ITEM: TFloatField
      FieldName = 'SUM_VL_MLE_ITEM'
    end
    object qry_di_calculo_SUM_VL_MLE_ITEM_MN: TFloatField
      FieldName = 'SUM_VL_MLE_ITEM_MN'
    end
  end
  object sp_di_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_calculo'
    Left = 442
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object qry_di_taxa_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_MOEDA_MLE, CD_MOEDA_FRETE,'
      'CD_MOEDA_SEGURO, IN_MOEDA_UNICA, TX_MLE, TX_FRETE,'
      'TX_DOLAR, VL_TOTAL_MLE_MN, VL_TOT_DESPS_MN, '
      'VL_TOT_MLE_MNEG, VL_TOT_DESPS_MNEG, VL_TOTAL_FRETE_MN,'
      'VL_TOTAL_SEG_MN, VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID,'
      'VL_FRETE_TNAC_MNEG, VL_TOT_SEGURO_MNEG, '
      'TX_INFO_COMPL'
      'FROM TDECLARACAO_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 221
    Top = 172
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_taxa_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_di_taxa_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_di_taxa_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_di_taxa_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_di_taxa_IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_MOEDA_UNICA'
    end
    object qry_di_taxa_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_MLE'
    end
    object qry_di_taxa_TX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_FRETE'
    end
    object qry_di_taxa_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_taxa_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_taxa_VL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_MLE'
    end
    object qry_di_taxa_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_FRETE'
    end
    object qry_di_taxa_VL_TOT_DESPS_MNEG: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_SEGURO'
    end
    object qry_di_taxa_VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_MOEDA_UNICA'
    end
    object qry_di_taxa_VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_MLE'
    end
    object qry_di_taxa_VL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_FRETE'
    end
    object qry_di_taxa_VL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_DOLAR'
    end
    object qry_di_taxa_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_MLE_MN'
    end
    object qry_di_taxa_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      BlobType = ftMemo
    end
    object qry_di_taxa_VL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
  end
  object qry_adicao_taxa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA_MLE, TX_MLE'
      'FROM TADICAO_DE_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 326
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_adicao_taxa_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_adicao_taxa_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
      Origin = 'TADICAO_DE_IMPORTACAO.TX_MLE'
    end
  end
  object qry_calculo_erro_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT * FROM TCALCULO_ERRO'
      'WHERE NM_STORED_PROCEDURE = :NM_STORED_PROCEDURE AND'
      'CD_ERRO = :CD_ERRO')
    Left = 326
    Top = 172
    ParamData = <
      item
        DataType = ftString
        Name = 'NM_STORED_PROCEDURE'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'CD_ERRO'
        ParamType = ptUnknown
      end>
    object qry_calculo_erro_NM_STORED_PROCEDURE: TStringField
      FieldName = 'NM_STORED_PROCEDURE'
      Origin = 'TCALCULO_ERRO.NM_STORED_PROCEDURE'
      Size = 30
    end
    object qry_calculo_erro_CD_ERRO: TSmallintField
      FieldName = 'CD_ERRO'
      Origin = 'TCALCULO_ERRO.CD_ERRO'
    end
    object qry_calculo_erro_NM_MENSAGEM: TStringField
      FieldName = 'NM_MENSAGEM'
      Origin = 'TCALCULO_ERRO.NM_MENSAGEM'
      Size = 255
    end
  end
  object sp_navega: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_navegacao'
    Left = 544
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_modulo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_rotina'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@ES'
        ParamType = ptInput
      end>
  end
  object sp_ult_sequencia: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ult_sequencia'
    Left = 544
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@identificador'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@chave'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_sequencia'
        ParamType = ptOutput
      end>
  end
  object ds_di_taxa: TDataSource
    DataSet = qry_di_taxa_
    Left = 326
    Top = 236
  end
  object qry_verifica_integrid_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PB_CARGA, PL_CARGA FROM TDECLARACAO_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 442
    Top = 236
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object ds_calculo_: TDataSource
    DataSet = qry_di_calculo_
    Left = 221
    Top = 304
  end
  object sp_rel_followup_aut: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_followup_aut'
    Left = 664
    Top = 236
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end>
  end
  object qry_cli_rel_flp_aut_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT CD_CLIENTE, E.NM_EMPRESA NM_CLIENTE'
      'FROM   TPROCESSO P, TREL_FOLLOWUP_AUT R, TEMPRESA_NAC E'
      'WHERE  P.NR_PROCESSO = R.NR_PROCESSO AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA')
    Left = 666
    Top = 292
    object qry_cli_rel_flp_aut_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_cli_rel_flp_aut_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 50
    end
  end
  object qry_rel_flp_aut_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_cli_flp_aut
    SQL.Strings = (
      'SELECT R.*'
      'FROM   TPROCESSO P, TREL_FOLLOWUP_AUT R'
      'WHERE  P.NR_PROCESSO = R.NR_PROCESSO AND'
      '       P.CD_CLIENTE = :CD_CLIENTE'
      'ORDER BY R.NR_PROCESSO')
    Left = 667
    Top = 349
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
  end
  object ds_cli_flp_aut: TDataSource
    DataSet = qry_cli_rel_flp_aut_
    Left = 544
    Top = 300
  end
  object qry_param_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PATH_RELATORIOS, PATH_SISCOMEX, PATH_REI'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 328
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_param_unid_neg_PATH_RELATORIOS: TStringField
      FieldName = 'PATH_RELATORIOS'
      Origin = 'TUNID_NEG.PATH_RELATORIOS'
      Size = 100
    end
    object qry_param_unid_neg_PATH_SISCOMEX: TStringField
      FieldName = 'PATH_SISCOMEX'
      Origin = 'TUNID_NEG.PATH_SISCOMEX'
      Size = 100
    end
    object qry_param_unid_neg_PATH_REI: TStringField
      FieldName = 'PATH_REI'
      Origin = 'TUNID_NEG.PATH_REI'
      Size = 100
    end
  end
  object qry_atz_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TDECLARACAO_IMPORTACAO'
      'SET    DT_CALCULO = :DT_CALCULO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 219
    Top = 364
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_CALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object StringField2: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 2
    end
    object FloatField1: TFloatField
      FieldName = 'VL_CIF_MN'
      Origin = 'TPROCESSO.CD_UNID_NEG'
    end
  end
  object qry_atz_da_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TDA'
      'SET    DT_CALCULO = :DT_CALCULO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 219
    Top = 420
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_CALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object StringField3: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object StringField4: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 2
    end
    object FloatField2: TFloatField
      FieldName = 'VL_CIF_MN'
      Origin = 'TPROCESSO.CD_UNID_NEG'
    end
  end
  object sp_da_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_da_calculo'
    Left = 666
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object sp_nac_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_nac_calculo'
    Left = 666
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object qry_atz_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TNAC'
      'SET    DT_CALCULO = :DT_CALCULO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 219
    Top = 476
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_CALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object StringField5: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object StringField6: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 2
    end
    object FloatField3: TFloatField
      FieldName = 'VL_CIF_MN'
      Origin = 'TPROCESSO.CD_UNID_NEG'
    end
  end
  object qry_release_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_VERSAO, PATH_TELA, TX_RELEASE'
      'FROM TRELEASE'
      'WHERE NR_VERSAO =:NR_VERSAO')
    Left = 442
    Top = 307
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_VERSAO'
        ParamType = ptInput
        Value = '4.2h'
      end>
    object qry_release_NR_VERSAO: TStringField
      DisplayWidth = 8
      FieldName = 'NR_VERSAO'
      Origin = 'TRELEASE.NR_VERSAO'
      Size = 8
    end
    object qry_release_PATH_TELA: TStringField
      FieldName = 'PATH_TELA'
      Origin = 'TRELEASE.PATH_TELA'
      Size = 200
    end
    object qry_release_TX_RELEASE: TMemoField
      FieldName = 'TX_RELEASE'
      Origin = 'TRELEASE.NR_VERSAO'
      BlobType = ftMemo
    end
  end
  object ds_release: TDataSource
    DataSet = qry_release_
    Left = 442
    Top = 371
  end
  object ppBDE_release: TppBDEPipeline
    DataSource = ds_release
    UserName = 'BDE_release'
    Left = 443
    Top = 434
  end
  object ppRepRelease: TppReport
    AutoStop = False
    DataPipeline = ppBDE_release
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Release'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\RBREL001.rtm'
    Units = utPrinterPixels
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 442
    Top = 499
    Version = '7.02'
    mmColumnWidth = 197379
    DataPipelineName = 'ppBDE_release'
    object ppHeaderRelease: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 42598
      mmPrintPosition = 0
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617086590000424D865900000000000076000000280000002C01
          0000960000000100040000000000105900000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888888FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF88888887777777778888FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888
          8777777777777777777888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888887777777888888888888
          8877778FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF888887777788888888888888888888888778FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F8888777788888888888888888888888888888778FFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88877777888888888
          88888888888888888888888778FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF888777788888888888888888888888888888
          8888888878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF8887777888888888887777777777788888888888888888878FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF887777888
          888888777777777777777777778888888888888888FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF887777888888887777778888888
          88888888877888888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF888777888888877777788888FFFFFFFFFFFFFF88778888
          8888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          888777888888777778888FFFFFFFFFFFFFFFFFFFFF8878888888888878FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF887777888888777788
          8FFFFFFFFFFFFFFFFFFFFFFFFFFF87888888888878FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8887778888887777888FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF8788888888878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF88777888887777888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF878
          888888888FFFFFFFFFFFF888F888FFF888FFF88888FFFF88888FFF888FFFFFF8
          88FFF888FF88888888FFF888888FFF888FFF888888FFF88FFFF88FFF88888888
          F888FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888777888
          887778888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF887888888878FFFFFFF
          FFFF8648F7468FF747FF874467FFF7644447FF747FFFFFF7468FF747F8764466
          47FF76444478F8647FF76444668F8648FF8648F864446648F7468FFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88877788887777888FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87888888878FFFFFFFFFFF8448F7468FF7
          47FF8444447F746777448F7468FFFFF7468FF647F744677646F864466446F844
          7F844466447F8448FF8448F646776448F7468FFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF887778888777888FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF8788888878FFFFFFFFFFFF8648F7468FF747FF8468747F7468
          88768F747FFFFFF7468FF747F746888647F844788746F8648F746888746FF648
          FF8648F647887648F7468FFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF887778888777888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87
          88888878FFFFFFFFFFFF8648F7468FF747FF846F888F746767767F747FFFFFF7
          46FFF747F846676647F846FFFF88F8648F747FFF746FF648FF8648F746776648
          F7468FFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88778888777788FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF878888878FFFFFFFFF
          FFFF8648F7468FF747FF846FFFFF746777647F7468F867F746FFF747FF766666
          47F8468FF888F8648F747FFF746FF647FF8648F876666648F7468FFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88777888877788FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8778888778FFFFFFFFFFFFF8648F7467876
          47F87468888F746888647F74478647F746787647F876788746F844788746F864
          7F746787646FF646887448F866787648F7468FFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF88777888877788FFFFFFFFFFFFFFFFFFFF88888888888888FFFF
          FFFFFFFFFFFFF878888778FFFFFFFFFFFFFF8448F744444468F64664447F8446
          66448F74444448F744444448F864666647F864444447F8447F844444447F8444
          44447FF744666468F7468FFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888778
          88877788FFFFFFFFFFFFFFFFF88888877777777777788FFFFFFFFFFFFFFFF878
          887788FFFFFFFFFFFFFF8778F87776468FF76467778FF7644467FF8777667FF7
          7774467FFF86664678FF86664678F8778FF76644678FF77764678FFF7664668F
          F7468FFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8877788877888FFFFFFFFFF
          FFFFFF888877777778888888877778FFFFFFFFFFFFFF87787788FFFFFFFFFFFF
          FFFF8778FFFFF888FFFF7468FFFFFF88888FFFFFFF88FFFFFFF888FFFFF88888
          FFFFF88888FFF8778FFF88888FFFFFFFF88FFFFFF88888FFF7468FFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8877788877788FFFFFFFFFFFFFFF8888777788888
          888888888888768FFFFFFFFFFFFF8777788FFFFFFFFFFFFFFFFF8648FFFFFFFF
          FFFF877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF864
          7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7468FFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF8877788877788FFFFFFFFFFFFFF88887777888888888888888888888778
          FFFFFFFFFFFF87788FFFFFFFFFFFFFFFFFFF8648FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8647FFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7478FFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF887788877788
          FFFFFFFFFFFFFF8887777888888888888888888888888878FFFFFFFFFFF86788
          FFFFFFFFFFFFFFFFFFFFF88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF888888FFFFFFFFFFFF888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F888FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF887778877788FFFFFFFFFFFFFF8877
          77888888877777788888888888888878FFFFFFFFFF8788FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86444
          467FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF87778887788FFFFFFFFFFFFF88877788888777777777777
          7788888888888878FFFFFFFFFF88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF646776448FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          87788877788FFFFFFFFFFFF88777788887777778888888888778888888888878
          FFFFFFFFFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF88FFFF88888FFFF767FF8648FFFFFFF88888FFFFFF8888FFF88F
          FFF88888FFFFF888FF8FFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF887778887788FFFFFFF
          FFFFF887777888877778888FFFFFFFFFF88788888888877FFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8748F
          F76666678FF877777647F8778F86666668FFF866668F8648FF7666668FF86666
          7747FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF88778887788FFFFFFFFFFFF8877788877778
          888FFFFFFFFFFFFFFF8878888888878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8647F864444447FF74444
          4647F7448F646666468F8644446F8448F744444448F746666447FFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF88777887778FFFFFFFFFFFF887778887778888FFFFFFFFFFFFFFFF
          FFF878888888878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8648F846788746FF446776647F7468F767787
          448F8447744FF648F646787648F747887647FFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8877888
          7788FFFFFFFFFFF88777888777888FFFFFFFFFFFFFFFFFFFFFFF8788888878FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF8648F7468FF846F8448FF8647F7468F866666468F8468F77F8648
          F647FFF878F746777647FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88778887788FFFFFFFFFFF887
          7788777888FFFFFFFFFFFFFFFFFFFFFFFFFF8788888878FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8648F
          746FFF846F8448FF8647F7468F74644467FF8468FFFF8648F647FFF888F87646
          6647FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF88778877788FFFFFFFFFF8877788777888FFFFFFFF
          FFFFFFFFFFFFFFFFFFFF878888878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8648F746888746F844788
          7647F7468864777767FF8467888F8648F646888648F876787647FFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF88778887788FFFFFFFFFF8877788777888FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF878888878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8648F844466446FF644664447F7448F646776
          46F84466447F8448F744464448F844677448FFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8877887778FFF
          FFFFFFFF87778877788FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77888878FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF8647FF76444468FF864446668F7668F86444467F86466667FF768
          F876444678FF76444478FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88778887788FFFFFFFFFF8877887778
          8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87888778FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8647F
          FF888888FFFF8888888FF878FFF888888FFF844788FFF88FFFF88888FFFFF888
          88FFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF8777887788FFFFFFFFFF88777877788FFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF87877788FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8647FFFFFFFFFFFFFFFFF
          FFFFF8778FFFFFFFFFFF8678FFFF8668FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          778887788FFFFFFFFFF8877887788FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF8787788FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8647FFFFFFFFFFFFFFFFFFFFFFF747FFFFFFF
          FFFFFFFFFFFF8448FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8877888778FFFFFFFFF
          F8877787788FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87778FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF888FFFFFFFFFFFFFFFFFFFFFFF888FFFFFFFFFFFFFFFFFFFF88F
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF8777887788FFFFFFFFF88777877788FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86788FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF877888778FFFFFFFFFF8877888788FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF8788FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8877887
          788FFFFFFFFF8877788888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          88FFFFFFFFFFFFFFFFFF887777777788FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          87777777777888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF887777777777888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8877887788FFFFFFFFF88778
          888678FFFFFFF8777777777777778FFFFFFFF8777777777767878FFFFFFFFFFF
          FF8766444444446778FFF877777777777778FFFFFFFFF8766444444444466778
          FFF877777777777788FFFFF87777777777777778FFFFFFFFF766444444444466
          778FFF877777777777778FFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF877888778FFFFFFFFF8877788876647FFFFFFF744
          4444444444446FFFFFFFF8444444444444446FFFFFFFFFFFF864444666666444
          468FF7444444444444468FFFFFFF864444466666666444467FF8444444444444
          48FFFFF84444444444444448FFFFFFF8744446666666664444678F8444444444
          44447FFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF877887788FFFFFFFFF88778888764447FFFFFFF84444444444444468FF
          FFFFF86464444444644468FFFFFFFFFF86446666666666664467F84444444444
          44448FFFFFF864666666666666666664478864644444446468FFFFFF64444444
          44444447FFFFFFF74466666666666666664468864444444444447FFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8877887788FF
          FFFFFFF8777888766466468FFFFFF86466666666666648FFFFFFF86466666666
          666668FFFFFFFFF86466666666666666664477466666666666648FFFFFF74666
          6666666666666666447766666666666468FFFFFF7466666666666647FFFFFF84
          4666666666666666666646864666666666647FFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF877888778FFFFFFFFF88778888764
          6666468FFFFFF86466666666666648FFFFFFFF7466666666666667FFFFFFFF86
          4666666666666666666646666666666666647FFFFF8646666666666666444444
          664666666666666647FFFFFF7466666666666647FFFFFF746666666666666644
          444464666666666666647FFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF877888778FFFFFFFFF8877888766446666448FFFFFFF74
          66666666666647FFFFFFFF7466666666666667FFFFFFFF746666666666666666
          466644666666666666647FFFFF86466666666666664666664446666666666666
          47FFFFFF84666666666666468FFFFF7466666666666664666664464666666666
          666468FFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F877888788FFFFFFFFF87788887644666666647FFFFFFF7466666666666647FF
          FFFFFF7446666666666646FFFFFFFF6466666666666666444444666666666666
          666468FFFF864666666666666678FFF8744666666666666646FFFFFF86466666
          666666468FFFFF74666666666666678FFF87646666666666666468FFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8877887788FFFFFFF
          F8877888766446666666647FFFFFFF8466666666666646FFFFFFFF8646666666
          6666668FFFFFF86666666666666664677876446666666666666468FFFF864666
          6666666666FFFFFFF864666666666666468FFFFFF6466666666666648FFFFF74
          66666666666668FFFFFF864666666666666468FFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF887788778FFFFFFFFF8877877766466666
          6666647FFFFFFF84466666666666468FFFFFFF86466666666666668FFFFFF766
          666666666666467FFFF8746666666666666448FFFF8646666666666647FFFFFF
          FF76466666666666468FFFFFF6466666666666647FFFFF746666666666666FFF
          FFFFF86466666666666647FFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF877888778FFFFFFFFF8778877864466666666666468FFFFFF86
          466666666666648FFFFFFF86466666666666647FFFFFF74666666666666647FF
          FFFFF74666666666666647FFFFF746666666666666FFFFFFFFF6466666666666
          467FFFFFF7466666666666647FFFFF7466666666666668FFFFFFFF7466666666
          666647FFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8778
          88778FFFFFFFFF87788778F74666666666666468FFFFFFF7466666666666647F
          FFFFF886466666666666647FFFFFF74666666666666647FFFFFFF84466666666
          666647FFFFF7446666666666647FFFFFFFF8646666666666647FFFFFF8466666
          6666666468FFFF8646666666666647FFFFFFFF8646666666666646FFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF877888788FFFFFFFF8877
          87788FF74666666666666448FFFFFFF7466666666666647FFFFF887646666666
          6666646FFFFFF74666666666666448FFFFFFFF7466666666666647FFFFF86466
          6666666664678FFFFFFF646666666666647FFFFFF84666666666666468FFFFF7
          4666666666666478FFFFFFF7466666666666468FFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF877888788FFFFFFFF887787788FFF846666666
          66666647FFFFFFF7466666666666647FFFF877866466666666666668FFFFF746
          66666666666447FFFFFFFF84666666666666468FFFFF84466666666666447788
          88887466666666666468FFFFF86666666666666448FFFFF86466666666666646
          78888887666666666666468FFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF877887788FFFFFFFF87788778FFFFF86666666666666647FFFFFFF8
          466666666666646FFF8777876466666666666668FFFFF76666666666666447FF
          FFFFFFF6466666666666468FFFFFF74466666666666644666777666666666666
          6468FFFFFF6466666666666647FFFFFF74466666666666644666777666666666
          6666467FFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87788778
          FFFFFFFFF87788778FFFFFFF66666666666666468FFFFFF84466666666666468
          887778F86466666666666648FFFFF86466666666666447FFFFFFFFF746666666
          6666648FFFFFFF74446666666666664444446666666666666468FFFFFF746666
          6666666647FFFFFFF74446666666666664444444666666666666647FFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF887788778FFFFFFFFF87788778
          FFFFFFFF74666666666666468FFFFFFF646666666666664787778FFF74666666
          66666647FFFFF86466666666666647FFFFFFFFF7466666666666647FFFFFFFF7
          644666666666666666666666666666666467FFFFFF74666666666666478FFFFF
          FF8644466666666666666666666666666666647FFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF887888778FFFFFFFFF87788788FFFFFFFFF74666666
          666666468FFFFFFF74666666666666467E88FFFF7466666666666647FFFFFF64
          666666666666468FFFFFFFF8466666666666647FFFFFFFFF8766444444446666
          66666666666666666647FFFFFF84666666666666468FFFFFFFF8776444444666
          666666666666666666666468FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF87888778FFFFFFFFF87788788FFFFFFFFFF86666666666666647FFFFFFF
          746666666666664678FFFFF87466666666666646FFFFFF74666666666666468F
          FFFFFFF84666666666666468FFFFFFFFFF887766644444444444446666666666
          6646FFFFFF84666666666666468FFFFFFFFFF888776644444444444446666666
          66666468FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87888778FFFF
          FFFFF87788778FFFFFFFFFFF86666666666666647FFFFFFF8466666666666664
          7FFFFF8866466666666666668FFFFF76466666666666447FFFFFFFF846666666
          66666468FFFFFFFFFFFFFF8887776666666676666666666666468FFFFFF64666
          66666666448FFFFFFFFFFFFFF8887777666666676666666666666467FFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF887888778FFFFFFFFF87788778FFFF
          FFFFFFFFF6466666666666647FFFFFFF84666666666666647FFFF87E66466666
          666666648FFFFF86466666666666646FFFFFFFF84666666666666448FFFFFFFF
          FFFFFFFFFFFF8888888887666666666666468FFFFFF6466666666666647FFFFF
          FFFFFFFFFFFFFFF8888888888646666666666467FFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF887888778FFFFFFFFF87788778FFFFFFFFFFFFFF6466666
          6666666468FFFFFF864666666666666448FF8E8874666666666666648FFFFFF7
          4666666666666448FFFFFFF84666666666666647FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF8646666666666467FFFFFF7466666666666647FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF8646666666666647FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          887888878FFFFFFFFF87788778FFFFFFFFFFFFFFF74666666666666468FFFFFF
          F6466666666666664677778764666666666666648FFFFFF86466666666666646
          8FFFFFF74666666666666647FFFFFFF88888888888888FFFFFFFF86466666666
          66467FFFFFF84666666666666468FFFFFF88888888888888FFFFFFFFF7466666
          66666646FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF87888878FFFFFFFF
          F87788778FFFFFFFFFFFFFFFF74666666666666447FFFFFFF746666666666666
          6446667646666666666666648FFFFFFF646666666666666468FFFF8666666666
          66666647FFFFFF8646444444444468FFFFFFF8646666666666467FFFFFF84666
          666666666468FFFFFF746444444444448FFFFFFFF746666666666646FFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFF87888878FFFFFFFFF87788778FFFFFFFF
          FFFFFFFFF86666666666666647FFFFFFF7466666666666666664444466666666
          666666648FFFFFFF84466666666666664677776466666666666666468FFFFFF7
          44444444444447FFFFFFF7646666666666467FFFFFF86666666666666448FFFF
          FF8446444444444468FFFFFF8646666666666647FFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFF878888788FFFFFFFF87788878FFFFFFFFFFFFFFFFFF8666666
          6666666647FFFFFFF8466666666666666666666666666666666666648FFFFFFF
          F7466666666666666444444666666666666666468FFFFFF86466666666666478
          FFFF86466666666666468FFFFFFF6466666666666647FFFFFFF7466666666666
          4688FFF86466666666666467FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFF877
          888788FFFFFFFF88788878FFFFFFFFFFFFFFFFFFFF64666666666666468FFFFF
          87466666666666666646666666666666666666668FFFFFFFF864666666666666
          6664666666666666666666448FFFFFFF84466666666666466776646666666666
          6646FFFFFFFF7466666666666647FFFFFFF86466666666666466777646666666
          66666468FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF877888788FFFFFFFF887
          888778FFFFFFFFFFFFFFFFFFFF74666666666666468FFFF88666666666666664
          676466666666666666666647FFFFFFFFFF864466666666666666666644666666
          666666647FFFFFFFF74466666666664444444666666666666447FFFFFFFF7466
          6666666666468FFFFFFF86466666666666444444666666666666447FFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFF877888778FFFFFFFFF87888778FFFFFFFFFFF
          FFFFFFFFFF76666666666666468FF88777646666666666646886446666666666
          66666468FFFFFFFFFFF86446666666666666666467466666666666647FFFFFFF
          FF864466666666666446666666666666447FFFFFFFFF84666666666666468FFF
          FFFFF8644666666666666466666666666664478FFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFF887888778FFFFFFFFF87788878FFFFFFFFFFFFFFFFFFFFFF864666
          6666666664788767887466666666666448F86446666666666666467FFFFFFFFF
          FFFF87446666666666666446884666666666666468FFFFFFFFF8744446666666
          6666666666666644478FFFFFFFFF86666666666666468FFFFFFFFF8764446666
          6666666666666666644468FFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFF878888
          78FFFFFFFFF877888778FFFFFFFFFFFFFFFFFFFFFF864666666666666468E688
          FF7444444444444447FF876444466666444468FFFFFFFFFFFFFFF87644444666
          66444468F84666666666666468FFFFFFFFFFF876444444666666666444444447
          8FFFFFFFFFFFF6444444444444447FFFFFFFFFFF876444444466666666444444
          44678FFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF878888788FFFFFFFFF87888
          878FFFFFFFFFFFFFFFFFFFFFFF864666666666666466E88FFF86666667777777
          78FFFF876644444444678FFFFFFFFFFFFFFFFFF8766444444446678FF8666666
          6666666448FFFFFFFFFFFF88776644444444444444666788FFFFFFFFFFFFF777
          7777777777778FFFFFFFFFFFFF8776644444444444444466778FFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFF877888778FFFFFFFFF878888778FFFFFFFFFFFFF
          FFFFFFFFFFF646666666666664678FFFFF8877788FFFFFFFFFFFFFFF88776667
          788FFFFFFFFFFFFFFFFFFFFFF887776677788FFFFF6466666666666647FFFFFF
          FFFFFFFFFF8877777777767777888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF8887776766666777888FFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFF877888878FFFFFFFFF877888878FFFFFFFFFFFFFFFFFFFFFFFFF76666
          666666666468FFFFF88E888FFFFFFFFFFFFFFFFFFFFF8888FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF8888FFFFFFFFF7466666666666647FFFFFFFFFFFFFFFFFFFFF8
          8888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8888888FFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFF878888788
          FFFFFFFFF878888878FFFFFFFFFFFFFFFFFFFFFFFFF76466666666666468FFF8
          86788FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF7466666666666647FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF878888778FFFFFFFFF87788887
          78FFFFFFFFFFFFFFFFFFFFFFFFF86466666666666647F887778FFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF846666
          66666666468FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFF877888878FFFFFFFFFF878888877FFFFFFFFFFFFFFF
          FFFFFFFFFFF86466666666666646887788FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86666666666666468FFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666666666666668FF
          FFFFFFFFFFFFFFFFF866666666667FFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFF878888788FFFFFFFFFF7888888778FFFFFFFFFFFFFFFFFFFFFFFF886666
          6666666666466E88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF6466666666666448FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6444444444444447FFFFFFFFFFFFFFFFFF
          FF6444444444478FFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF877888878FFF
          FFFFFFF87888888778FFFFFFFFFFFFFFFFFFFFFF8888666666666666664678FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6466666666666647FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF7466666666666647FFFFFFFFFFFFFFFFFFFF86466666664468
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF878888778FFFFFFFFFF878888888
          78FFFFFFFFFFFFFFFFFF8888777E66666666666666467FFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74666
          66666666647FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84
          666666666666468FFFFFFFFFFFFFFFFFFFF74666666664468FFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFF878888878FFFFFFFFFFF8788888888788FFFFFFFFFFFF
          F8888777778876466666666666447FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74666666666666468FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86666666666666468F
          FFFFFFFFFFFFFFFFFFFF64666666666468FFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFF878888778FFFFFFFFFFF8788888888778888FFFF8888887777777888F8646
          6666666666647FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF86666666666666468FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666666666666448FFFFFFFFFFFFFFFFF
          FFFF864666666666447FFFFFFFFFFFFF0000FFFFFFFFFFFFFF8778888788FFFF
          FFFFFFF8788888888887778888887777777778888FFFF6466666666666647FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF86666666666666468FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF6666666666666647FFFFFFFFFFFFFFFFFFFFFF74666666666
          64478FFFFFFFFFFF0000FFFFFFFFFFFFFF878888878FFFFFFFFFFFF878888888
          8888777777777777777888FFFFFFF64444444444444468FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6444
          444444444447FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
          444444444444447FFFFFFFFFFFFFFFFFFFFFF86444444444444468FFFFFFFFFF
          0000FFFFFFFFFFFFF8878888878FFFFFFFFFFFFF877888888888888888777777
          888FFFFFFFF8864466666666666468FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7666666666666647FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7666666666666647F
          FFFFFFFFFFFFFFFFFFFFFF86666666666666478FFFFFFFFF0000FFFFFFFFFFFF
          F8788888878FFFFFFFFFFFFF887777778887777777778888FFFFFFFFF8877767
          8888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888888888FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888888888888FFFFFFFFFFFFFFFFF
          FFFFFFF8888888888888888FFFFFFFFF0000FFFFFFFFFFFFF8788888778FFFFF
          FFFFFFFFFF887777777777778888FFFFFFFFFFF88777788FFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFF88788888778FFFFFFFFFFFFFFFFF8888
          88888888FFFFFFFFFFFF888777888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFF88788888878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F8887767888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          87888888878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88887667888FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF878888888778FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF88887767888FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFF8788888888788FFFFFFFFFFFFFFFFFFF
          FFFFFFFF888877677888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFF87788888888788FFFFFFFFFFFFFFFFFFFFFFF88887767788
          88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          887888888888788FFFFFFFFFFFFFFFFFF88888777777888FFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFF878888888888778
          8888FFFFFFF88888877777777888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFF8878888888888777777888888877777
          777777888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFF877888888888888777777777777777777888FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFF88778788888888888888777777778888FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFF88777777778
          777777777788888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF888887777777888888888FFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        mmHeight = 22225
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 56356
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Release da Vers'#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 127794
        mmTop = 20373
        mmWidth = 39952
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NR_VERSAO'
        DataPipeline = ppBDE_release
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_release'
        mmHeight = 5027
        mmLeft = 172773
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 265
        mmWidth = 197644
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Dispon'#237'vel em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 1323
        mmWidth = 27781
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'PATH_TELA'
        DataPipeline = ppBDE_release
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppBDE_release'
        mmHeight = 6879
        mmLeft = 37306
        mmTop = 1323
        mmWidth = 153723
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppRegion1: TppRegion
        UserName = 'Region1'
        Brush.Style = bsClear
        Pen.Color = clWhite
        ShiftRelativeTo = ppDBMemo1
        Stretch = True
        Transparent = True
        mmHeight = 6879
        mmLeft = 0
        mmTop = 8202
        mmWidth = 194469
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Altera'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 2381
          mmTop = 9525
          mmWidth = 20902
          BandType = 4
        end
        object ppDBMemo2: TppDBMemo
          UserName = 'DBMemo2'
          CharWrap = False
          DataField = 'TX_RELEASE'
          DataPipeline = ppBDE_release
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppBDE_release'
          mmHeight = 4763
          mmLeft = 37306
          mmTop = 9525
          mmWidth = 153988
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 19579
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'TI - Desenvolvimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 71702
        mmTop = 14552
        mmWidth = 43392
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 265
        mmTop = 1323
        mmWidth = 196321
        BandType = 8
      end
      object ppNumPag: TppSystemVariable
        UserName = 'NumPag'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 87048
        mmTop = 4763
        mmWidth = 4498
        BandType = 8
      end
      object ppTotPag: TppSystemVariable
        UserName = 'TotPag'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 92604
        mmTop = 4763
        mmWidth = 4498
        BandType = 8
      end
      object ppVarRodapeEsq: TppVariable
        UserName = 'VarRodapeEsq'
        CalcOrder = 0
        CalcType = veReportEnd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = ppVarRodapeEsqCalc
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 4233
        mmWidth = 23019
        BandType = 8
      end
      object ppVarRodapeDir: TppVariable
        UserName = 'VarRodapeDir'
        CalcOrder = 1
        CalcType = vePageStart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = ppVarRodapeDirCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 4233
        mmWidth = 21167
        BandType = 8
      end
    end
  end
  object qry_look_aditivo_: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TATO_CONC_ADITIVO'
      'WHERE  NR_FORECAST = :NR_FORECAST')
    Left = 554
    Top = 446
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_FORECAST'
        ParamType = ptUnknown
      end>
    object qry_look_aditivo_NR_FORECAST: TStringField
      FieldName = 'NR_FORECAST'
      Origin = 'TATO_CONC_ADITIVO.NR_FORECAST'
      Size = 5
    end
    object qry_look_aditivo_NR_ADITIVO: TStringField
      FieldName = 'NR_ADITIVO'
      Origin = 'TATO_CONC_ADITIVO.NR_ADITIVO'
      Size = 2
    end
    object qry_look_aditivo_DT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
      Origin = 'TATO_CONC_ADITIVO.DT_VENCTO'
    end
  end
  object ds_ato_conc: TDataSource
    DataSet = qry_look_aditivo_
    Left = 556
    Top = 395
  end
  object db_suporte: TDatabase
    AliasName = 'SUPORTE'
    DatabaseName = 'db_suporte'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SA'
      'PASSWORD=123')
    SessionName = 'Default'
    Left = 208
    Top = 20
  end
  object db_broker_pendencias: TDatabase
    AliasName = 'Broker'
    DatabaseName = 'Pendencias'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME=BROKER'
      'USER NAME=SA'
      'PASSWORD=123')
    SessionName = 'Session1'
    Left = 304
    Top = 20
  end
  object Session1: TSession
    SessionName = 'Session1'
    Left = 440
    Top = 24
  end
  object qry_Forms: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DF.NM_FORM,'
      '       DF.NM_DATA_MODULE,'
      '       DF.NM_QUERY,'
      '       DF.ID_TABELA,'
      '       ST.NAME AS NM_TABELA,'
      '       DF.NM_CAMPO,'
      '       CASE ISNULL(SC.NAME, ISNULL(DF.NM_CAMPO, '#39'NR_PROCESSO'#39'))'
      '           WHEN '#39'NR_PROCESSO'#39' THEN '#39'1'#39
      '           WHEN '#39'ID_CODIGO'#39' THEN '#39'2'#39
      '           WHEN '#39'NR_REFERENCIA'#39' THEN '#39'3'#39
      '       ELSE '#39'0'#39
      '       END AS IN_PROCESSO'
      
        'FROM TDADOS_FORMS DF LEFT JOIN (TTABELA_DIGITALIZACAO TD INNER J' +
        'OIN SYS.COLUMNS SC ON SC.OBJECT_ID = TD.ID_TABELA AND SC.COLUMN_' +
        'ID = TD.ID_CAMPO) ON TD.ID_TABELA = DF.ID_TABELA'
      '   INNER JOIN SYS.TABLES ST ON ST.OBJECT_ID = DF.ID_TABELA'
      'WHERE DF.NM_FORM = :NM_FORM')
    Left = 122
    Top = 238
    ParamData = <
      item
        DataType = ftString
        Name = 'NM_FORM'
        ParamType = ptUnknown
      end>
    object qry_FormsNM_FORM: TStringField
      FieldName = 'NM_FORM'
      FixedChar = True
      Size = 50
    end
    object qry_FormsNM_DATA_MODULE: TStringField
      FieldName = 'NM_DATA_MODULE'
      FixedChar = True
      Size = 50
    end
    object qry_FormsNM_QUERY: TStringField
      FieldName = 'NM_QUERY'
      FixedChar = True
      Size = 50
    end
    object qry_FormsID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
    object qry_FormsNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      FixedChar = True
      Size = 255
    end
    object qry_FormsNM_CAMPO: TStringField
      FieldName = 'NM_CAMPO'
      FixedChar = True
      Size = 255
    end
    object qry_FormsIN_PROCESSO: TStringField
      FieldName = 'IN_PROCESSO'
      FixedChar = True
      Size = 1
    end
  end
  object MadExceptionHandler1: TMadExceptionHandler
    OnException = MadExceptionHandler1Exception
    Left = 688
    Top = 488
  end
  object SP_ALTERA_SENHA_OLD: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_ALTERA_SENHA'
    Left = 82
    Top = 388
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@senha_old'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@senha_new'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@usuario'
        ParamType = ptInput
      end>
  end
  object SP_REINCLUIR_USUARIO_BANCOS_OLD: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_REINCLUIR_USUARIO_BANCOS'
    Left = 82
    Top = 468
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@USUARIO'
        ParamType = ptInput
      end>
  end
  object SQLConnection: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbexpmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MSSQL'
      'HostName=INDAIA10'
      'DataBase=BROKER'
      'User_Name=SA'
      'Password=123'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False')
    VendorLib = 'oledb'
    Left = 32
    Top = 19
  end
  object qrySP_ALTERAR_USUARIO: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 80
    Top = 304
  end
  object qryTiposDoctos: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTP_DOCTO_DIGITALIZADO (NOLOCK)')
    Left = 547
    Top = 30
    object qryTiposDoctosCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.CD_TIPO_DOCTO'
    end
    object qryTiposDoctosNM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.NM_TIPO_DOCTO'
      FixedChar = True
      Size = 255
    end
    object qryTiposDoctosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryTiposDoctosIN_MULTIPLOS_ARQ: TIntegerField
      FieldName = 'IN_MULTIPLOS_ARQ'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.IN_MULTIPLOS_ARQ'
    end
    object qryTiposDoctosNM_PREFIXO_ARQ: TStringField
      FieldName = 'NM_PREFIXO_ARQ'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.NM_PREFIXO_ARQ'
      FixedChar = True
      Size = 4
    end
    object qryTiposDoctosIN_ENVIA_WEB: TStringField
      FieldName = 'IN_ENVIA_WEB'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.IN_ENVIA_WEB'
      FixedChar = True
      Size = 1
    end
    object qryTiposDoctosID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.ID_TABELA'
    end
  end
end
