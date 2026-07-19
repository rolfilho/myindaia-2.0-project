object datm_trans_LI: Tdatm_trans_LI
  OldCreateOrder = True
  Left = 225
  Top = 113
  Height = 362
  Width = 619
  object REGIMP: TDatabase
    AliasName = 'DBLicenca'
    DatabaseName = 'REGIMP'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 56
    Top = 16
  end
  object qry_li_scx_: TQuery
    AutoCalcFields = False
    DatabaseName = 'REGIMP'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   OPERA'#199#195'O_COM_TRATAMENTO'
      'WHERE  NR_IDENT_USUARIO = :NR_IDENT_USUARIO'
      'ORDER BY NR_IDENT_USUARIO')
    Left = 176
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_IDENT_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object tbl_Numerador_LI_: TTable
    DatabaseName = 'REGIMP'
    TableName = 'NUMERADOR_REG_IMP'
    Left = 176
    Top = 251
  end
  object qry_li_itens_scx_: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   DETALHE_MERC_COM_TRATAMENTO'
      'WHERE  NR_TRAT_IMP_MICRO = :NR_TRAT_IMP_MICRO'
      'AND    NR_SEQ_PRODUTO = :NR_SEQ_PRODUTO')
    Left = 176
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_TRAT_IMP_MICRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SEQ_PRODUTO'
        ParamType = ptUnknown
      end>
  end
  object qry_dest_NCM_scx_: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   DESTAQUE_NCM'
      'WHERE  NR_TRAT_IMP_MICRO = :NR_TRAT_IMP_MICRO')
    Left = 176
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_TRAT_IMP_MICRO'
        ParamType = ptUnknown
      end>
  end
  object qry_proc_anuentes_scx_: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   PROCESSO_ANUENTE'
      'WHERE  NR_TRAT_IMP_MICRO = :NR_TRAT_IMP_MICRO')
    Left = 176
    Top = 195
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_TRAT_IMP_MICRO'
        ParamType = ptUnknown
      end>
  end
  object RS_Diag_LI: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    Left = 56
    Top = 251
  end
  object TABSISCO: TDatabase
    AliasName = 'DBTabelas'
    DatabaseName = 'DBSISCOMEX'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 56
    Top = 72
  end
  object RS_TB: TQuery
    DatabaseName = 'TABSISCO'
    SQL.Strings = (
      'SELECT * FROM TAB_CONVERSAO_CAMBIO ')
    Left = 56
    Top = 195
  end
  object qry_li_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    DataSource = ds_li_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLICENCA_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY '
      'NR_PROCESSO')
    Left = 400
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 20
      end>
    object qry_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
    end
    object qry_li_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'TLICENCA_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 15
    end
    object qry_li_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Origin = 'TLICENCA_IMPORTACAO.NR_ATO_DRAWBACK'
      Size = 13
    end
    object qry_li_NR_COMUNICADO_COMPRA: TStringField
      FieldName = 'NR_COMUNICADO_COMPRA'
      Origin = 'TLICENCA_IMPORTACAO.NR_COMUNICADO_COMPRA'
      Size = 13
    end
    object qry_li_NR_REGISTRO_LI: TStringField
      FieldName = 'NR_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.NR_REGISTRO_LI'
      Size = 10
    end
    object qry_li_CD_MOD_PAGAMENTO: TStringField
      FieldName = 'CD_MOD_PAGAMENTO'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOD_PAGAMENTO'
      Size = 2
    end
    object qry_li_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TLICENCA_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_li_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'TLICENCA_IMPORTACAO.CD_ACORDO_ALADI'
      Size = 3
    end
    object qry_li_CD_REGIME_TRIBUTACAO: TStringField
      FieldName = 'CD_REGIME_TRIBUTACAO'
      Origin = 'TLICENCA_IMPORTACAO.CD_REGIME_TRIBUTACAO'
      Size = 1
    end
    object qry_li_CD_FUND_LEGAL: TStringField
      FieldName = 'CD_FUND_LEGAL'
      Origin = 'TLICENCA_IMPORTACAO.CD_FUND_LEGAL'
      Size = 2
    end
    object qry_li_CD_AGENCIA_SECEX: TStringField
      FieldName = 'CD_AGENCIA_SECEX'
      Origin = 'TLICENCA_IMPORTACAO.CD_AGENCIA_SECEX'
      Size = 4
    end
    object qry_li_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TLICENCA_IMPORTACAO.CD_PAIS_PROCEDENCIA'
      Size = 3
    end
    object qry_li_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TLICENCA_IMPORTACAO.CD_INCOTERM'
      Size = 3
    end
    object qry_li_CD_INSTITUICAO_FINANC: TStringField
      FieldName = 'CD_INSTITUICAO_FINANC'
      Origin = 'TLICENCA_IMPORTACAO.CD_INSTITUICAO_FINANC'
      Size = 2
    end
    object qry_li_CD_MOT_SEM_COBERTURA: TStringField
      FieldName = 'CD_MOT_SEM_COBERTURA'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOT_SEM_COBERTURA'
      Size = 2
    end
    object qry_li_CD_CONDICAO_MERC: TStringField
      FieldName = 'CD_CONDICAO_MERC'
      Origin = 'TLICENCA_IMPORTACAO.CD_CONDICAO_MERC'
      Size = 1
    end
    object qry_li_CD_MOEDA_FOB: TStringField
      FieldName = 'CD_MOEDA_FOB'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_FOB'
      Size = 3
    end
    object qry_li_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TLICENCA_IMPORTACAO.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_li_CD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'TLICENCA_IMPORTACAO.CD_URF_ENTRADA'
      Size = 7
    end
    object qry_li_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_li_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_li_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_li_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Origin = 'TLICENCA_IMPORTACAO.CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object qry_li_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TLICENCA_IMPORTACAO.CD_SERVICO'
      Size = 3
    end
    object qry_li_DT_PROCESSO_LI: TDateTimeField
      FieldName = 'DT_PROCESSO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_PROCESSO_LI'
    end
    object qry_li_DT_REGISTRO_LI: TDateTimeField
      FieldName = 'DT_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_REGISTRO_LI'
    end
    object qry_li_QT_DIAS_COBERTURA: TIntegerField
      FieldName = 'QT_DIAS_COBERTURA'
      Origin = 'TLICENCA_IMPORTACAO.QT_DIAS_COBERTURA'
    end
    object qry_li_QT_TOTAL_PES_LIQ: TFloatField
      FieldName = 'QT_TOTAL_PES_LIQ'
      Origin = 'TLICENCA_IMPORTACAO.QT_TOTAL_PES_LIQ'
    end
    object qry_li_QT_MED_ESTATISTICA: TFloatField
      FieldName = 'QT_MED_ESTATISTICA'
      Origin = 'TLICENCA_IMPORTACAO.QT_MED_ESTATISTICA'
    end
    object qry_li_QT_TOTAL_ITEM: TStringField
      FieldName = 'QT_TOTAL_ITEM'
      Origin = 'TLICENCA_IMPORTACAO.QT_TOTAL_ITEM'
      Size = 3
    end
    object qry_li_TP_CAMBIO: TStringField
      FieldName = 'TP_CAMBIO'
      Origin = 'TLICENCA_IMPORTACAO.TP_CAMBIO'
      Size = 1
    end
    object qry_li_TP_ACORDO_ALADI: TStringField
      FieldName = 'TP_ACORDO_ALADI'
      Origin = 'TLICENCA_IMPORTACAO.TP_ACORDO_ALADI'
      Size = 1
    end
    object qry_li_TX_INFO_COMPLEMENTAR: TMemoField
      FieldName = 'TX_INFO_COMPLEMENTAR'
      Origin = 'TLICENCA_IMPORTACAO.TX_INFO_COMPLEMENTAR'
      BlobType = ftMemo
    end
    object qry_li_VL_FRETE_MOEDA: TFloatField
      FieldName = 'VL_FRETE_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_FRETE_MOEDA'
    end
    object qry_li_VL_SEGURO_MOEDA: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_SEGURO_MOEDA'
    end
    object qry_li_VL_DESPESA_MOEDA: TFloatField
      FieldName = 'VL_DESPESA_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_DESPESA_MOEDA'
    end
    object qry_li_VL_DESCONTO_MOEDA: TFloatField
      FieldName = 'VL_DESCONTO_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_DESCONTO_MOEDA'
    end
    object qry_li_VL_TOTAL_MOEDA: TFloatField
      FieldName = 'VL_TOTAL_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_TOTAL_MOEDA'
    end
    object qry_li_NR_PROCESSO_SISCOMEX: TStringField
      FieldName = 'NR_PROCESSO_SISCOMEX'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO_SISCOMEX'
      Size = 8
    end
    object qry_li_IN_MONTADA: TStringField
      FieldName = 'IN_MONTADA'
      Origin = 'TLICENCA_IMPORTACAO.IN_MONTADA'
      Size = 1
    end
    object qry_li_NR_LI_SUBSTITUIDO: TStringField
      FieldName = 'NR_LI_SUBSTITUIDO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 10
    end
    object qry_li_IN_EMBUT_FRT_ITENS: TStringField
      FieldName = 'IN_EMBUT_FRT_ITENS'
      Origin = 'DBBROKER.TLICENCA_IMPORTACAO.IN_EMBUT_FRT_ITENS'
      FixedChar = True
      Size = 1
    end
  end
  object qry_li_itens_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    DataSource = ds_li_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLICENCA_ITENS'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_PROCESSO, NR_ITEM')
    Left = 400
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object ds_li_lista: TDataSource
    DataSet = qry_li_lista_
    Left = 264
    Top = 16
  end
  object qry_li_lista_: TQuery
    AfterOpen = qry_li_lista_AfterOpen
    OnCalcFields = qry_li_lista_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT L.NR_PROCESSO, L.DT_PROCESSO_LI, E.NM_EMPRESA, L.NR_REGIS' +
        'TRO_LI, L.DT_REGISTRO_LI'
      'FROM TLICENCA_IMPORTACAO L, TEMPRESA_NAC E'
      'WHERE L.CD_IMPORTADOR *= E.CD_EMPRESA'
      '  AND L.IN_MONTADA = '#39'1'#39
      '  AND SUBSTRING(L.NR_PROCESSO, 1, 2) = :CD_UNID_NEG'
      '  AND :NR_PROCESSO IN (L.NR_PROCESSO, '#39#39')'
      'ORDER BY L.NR_PROCESSO')
    Left = 333
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Size = 2
        Value = ''
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 20
        Value = ''
      end>
    object qry_li_lista_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
    end
    object qry_li_lista_NM_EMPRESA: TStringField
      DisplayLabel = 'Importador'
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_li_lista_DT_PROCESSO_LI: TDateTimeField
      DisplayLabel = 'Data Processo'
      FieldName = 'DT_PROCESSO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_PROCESSO_LI'
    end
    object qry_li_lista_NR_REGISTRO_LI: TStringField
      DisplayLabel = 'Registro LI'
      FieldName = 'NR_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.NR_REGISTRO_LI'
      Size = 10
    end
    object qry_li_lista_DT_REGISTRO_LI: TDateTimeField
      DisplayLabel = 'Data Registro'
      FieldName = 'DT_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_REGISTRO_LI'
    end
    object qry_li_lista_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Calculated = True
    end
  end
  object qry_emp_nac_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TOP 1 E.CD_EMPRESA, E.NM_EMPRESA, E.CD_TIPO_PESSOA, E.CD_' +
        'PAIS_IMPORTADOR,'
      
        'E.CD_ATIV_ECONOMICA, E.END_EMPRESA, E.END_NUMERO, E.END_BAIRRO, ' +
        'E.END_CIDADE,'
      
        'E.END_UF, E.END_CEP, E.CGC_EMPRESA, E.CPF_EMPRESA, E.OUTRO_DOC, ' +
        'C.NR_FONE'
      'FROM TEMPRESA_NAC E'
      'LEFT OUTER JOIN TCLIENTE_CONTATO C'
      'ON ( E.CD_EMPRESA = C.CD_CLIENTE )'
      'WHERE'
      'E.CD_EMPRESA = :CD_CLIENTE')
    Left = 512
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
  end
  object qry_emp_est_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_EMPRESA, NM_EMPRESA, END_EMPRESA, END_NUMERO, END_COMP' +
        'L,'
      'END_CIDADE, END_ESTADO, CD_PAIS'
      'FROM TEMPRESA_EST'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Left = 512
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qry_unid_med_broker_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA'
      'FROM TUNID_MEDIDA_BROKER'
      'WHERE CD_UNID_MEDIDA = :CD_UNID_MEDIDA')
    Left = 512
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_MEDIDA'
        ParamType = ptUnknown
      end>
  end
  object qry_proc_anuentes_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPROC_ANUENTES'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 400
    Top = 195
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_ag_secex_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TAB_AGENCIA_SECEX'
      'WHERE CODIGO = :CODIGO')
    Left = 512
    Top = 251
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 512
    Top = 195
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object qry_numera_li_: TQuery
    AutoCalcFields = False
    DatabaseName = 'REGIMP'
    SQL.Strings = (
      'SELECT MID( MAX( NR_TRAT_IMP_MICRO ), 1, 5 ) AS ULTIMO'
      'FROM   OPERA'#199#195'O_COM_TRATAMENTO'
      'WHERE  MID( NR_TRAT_IMP_MICRO, 7, 2 ) = :NR_ANO')
    Left = 288
    Top = 252
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptUnknown
      end>
  end
end
