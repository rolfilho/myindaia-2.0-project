object datm_LI_Capa: Tdatm_LI_Capa
  OldCreateOrder = True
  Left = 225
  Top = 134
  Height = 466
  Width = 569
  object ds_li: TDataSource
    DataSet = qry_li_
    Left = 40
    Top = 16
  end
  object qry_li_: TQuery
    BeforeInsert = qry_li_BeforeInsert
    BeforeEdit = qry_li_BeforeEdit
    AfterScroll = qry_li_AfterScroll
    OnCalcFields = qry_li_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLICENCA_IMPORTACAO '
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 144
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_li_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'TLICENCA_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 15
    end
    object qry_li_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Origin = 'TLICENCA_IMPORTACAO.NR_ATO_DRAWBACK'
      EditMask = '!9999-99-999999-9;0;_'
      Size = 13
    end
    object qry_li_NR_COMUNICADO_COMPRA: TStringField
      FieldName = 'NR_COMUNICADO_COMPRA'
      Origin = 'TLICENCA_IMPORTACAO.NR_COMUNICADO_COMPRA'
      EditMask = '!9999-99-999999-9;0;_'
      Size = 13
    end
    object qry_li_NR_REGISTRO_LI: TStringField
      FieldName = 'NR_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.NR_REGISTRO_LI'
      EditMask = '!99/9999999-9;0;'
      Size = 10
    end
    object qry_li_NR_PROCESSO_SISCOMEX: TStringField
      FieldName = 'NR_PROCESSO_SISCOMEX'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 8
    end
    object qry_li_CD_MOD_PAGAMENTO: TStringField
      FieldName = 'CD_MOD_PAGAMENTO'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOD_PAGAMENTO'
      Size = 2
    end
    object qry_li_CD_IMPORTADOR: TStringField
      DisplayWidth = 5
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
      FixedChar = True
      Size = 1
    end
    object qry_li_CD_MOEDA_FOB: TStringField
      FieldName = 'CD_MOEDA_FOB'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_FOB'
      OnChange = qry_li_CD_MOEDA_FOBChange
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
    object qry_li_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 3
    end
    object qry_li_DT_PROCESSO_LI: TDateTimeField
      FieldName = 'DT_PROCESSO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_PROCESSO_LI'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_li_DT_REGISTRO_LI: TDateTimeField
      FieldName = 'DT_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_REGISTRO_LI'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_li_QT_TOTAL_PES_LIQ: TFloatField
      FieldName = 'QT_TOTAL_PES_LIQ'
      Origin = 'TLICENCA_IMPORTACAO.QT_TOTAL_PES_LIQ'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_li_QT_MED_ESTATISTICA: TFloatField
      FieldName = 'QT_MED_ESTATISTICA'
      Origin = 'TLICENCA_IMPORTACAO.QT_MED_ESTATISTICA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_li_TP_CAMBIO: TStringField
      FieldName = 'TP_CAMBIO'
      Origin = 'TLICENCA_IMPORTACAO.TP_CAMBIO'
      Size = 1
    end
    object qry_li_TP_ACORDO_ALADI: TStringField
      FieldName = 'TP_ACORDO_ALADI'
      Origin = 'TLICENCA_IMPORTACAO.NR_IDENT_USUARIO'
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
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_li_VL_SEGURO_MOEDA: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_SEGURO_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_li_VL_DESPESA_MOEDA: TFloatField
      FieldName = 'VL_DESPESA_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_DESPESA_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_li_VL_DESCONTO_MOEDA: TFloatField
      FieldName = 'VL_DESCONTO_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_DESCONTO_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_li_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      OnChange = qry_li_CD_MOEDA_FOBChange
      Size = 3
    end
    object qry_li_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Origin = 'TLICENCA_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 1
    end
    object qry_li_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TLICENCA_IMPORTACAO.NR_ATO_DRAWBACK'
      Size = 3
    end
    object qry_li_QT_DIAS_COBERTURA: TIntegerField
      FieldName = 'QT_DIAS_COBERTURA'
      Origin = 'TLICENCA_IMPORTACAO.NR_COMUNICADO_COMPRA'
    end
    object qry_li_VL_TOTAL_MOEDA: TFloatField
      FieldName = 'VL_TOTAL_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.NR_REGISTRO_LI'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_li_IN_MONTADA: TStringField
      FieldName = 'IN_MONTADA'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 1
    end
    object qry_li_QT_TOTAL_ITEM: TStringField
      FieldName = 'QT_TOTAL_ITEM'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 3
    end
    object qry_li_NR_LI_SUBSTITUIDO: TStringField
      FieldName = 'NR_LI_SUBSTITUIDO'
      Origin = 'DBBROKER.TLICENCA_IMPORTACAO.NR_LI_SUBSTITUIDO'
      FixedChar = True
      Size = 10
    end
    object qry_li_calc_nr_proc: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_proc'
      Size = 18
      Calculated = True
    end
    object qry_li_IN_EMBUT_FRT_ITENS: TStringField
      FieldName = 'IN_EMBUT_FRT_ITENS'
      Origin = 'DBBROKER.TLICENCA_IMPORTACAO.IN_EMBUT_FRT_ITENS'
      FixedChar = True
      Size = 1
    end
    object qry_li_DT_TRANSMISSAO: TDateTimeField
      FieldName = 'DT_TRANSMISSAO'
      Origin = 'DBBROKER.TLICENCA_IMPORTACAO.DT_TRANSMISSAO'
    end
    object qry_li_NR_IDENT_TRANSMISSAO: TIntegerField
      FieldName = 'NR_IDENT_TRANSMISSAO'
      Origin = 'DBBROKER.TLICENCA_IMPORTACAO.NR_IDENT_TRANSMISSAO'
    end
    object qry_li_ENQ_MAT_USADO: TIntegerField
      FieldName = 'ENQ_MAT_USADO'
    end
    object qry_li_OP_NACIONALIZACAO: TStringField
      FieldName = 'OP_NACIONALIZACAO'
      Size = 2
    end
    object qry_li_VL_FRETE_MOEDA_MERC: TFloatField
      FieldName = 'VL_FRETE_MOEDA_MERC'
      Origin = 'TLICENCA_IMPORTACAO.VL_FRETE_MOEDA_MERC'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
  end
  object qry_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_li
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_REFERENCIA, NR_ITEM_PO'
      'FROM TREF_CLIENTE ( NOLOCK )'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY CD_REFERENCIA, NR_ITEM_PO')
    Left = 144
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_ref_cli_NR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TREF_CLIENTE.NR_PROCESSO'
      Size = 18
    end
    object qry_ref_cli_CD_REFERENCIA: TStringField
      DisplayLabel = 'Nr. Refer'#234'ncia'
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
    object qry_ref_cli_NR_ITEM_PO: TStringField
      DisplayLabel = 'Item'
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
  end
  object ds_taxa_cambio: TDataSource
    DataSet = tbl_taxa_cambio_
    Left = 40
    Top = 248
  end
  object tbl_taxa_cambio_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TCONVERSAO_CAMBIO'
    UpdateMode = upWhereKeyOnly
    Left = 144
    Top = 248
    object tbl_taxa_cambio_Codigo: TStringField
      FieldName = 'Codigo'
      Size = 3
    end
    object tbl_taxa_cambio_Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
    object tbl_taxa_cambio_Taxa_Conversao: TStringField
      FieldName = 'Taxa_Conversao'
      Size = 9
    end
    object tbl_taxa_cambio_Vigencia_Inicio_Taxa: TStringField
      FieldName = 'Vigencia_Inicio_Taxa'
      Size = 10
    end
    object tbl_taxa_cambio_Vigencia_Fim_Taxa: TStringField
      FieldName = 'Vigencia_Fim_Taxa'
      Size = 10
    end
  end
  object ds_ref_cli_: TDataSource
    DataSet = qry_ref_cli_
    Left = 40
    Top = 72
  end
  object ds_anuentes: TDataSource
    DataSet = qry_anuentes_
    Left = 40
    Top = 128
  end
  object qry_anuentes_: TQuery
    BeforePost = qry_anuentes_BeforePost
    AfterPost = qry_anuentes_AfterPost
    BeforeDelete = qry_anuentes_BeforeDelete
    OnCalcFields = qry_anuentes_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM  TPROC_ANUENTES '
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 144
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_anuentes_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROC_ANUENTES.NR_PROCESSO'
      Size = 18
    end
    object qry_anuentes_ORGAO: TStringField
      FieldName = 'ORGAO'
      Origin = 'TPROC_ANUENTES.ORGAO'
      Size = 16
    end
    object qry_anuentes_PROCESSO: TStringField
      DisplayWidth = 20
      FieldName = 'PROCESSO'
      Origin = 'TPROC_ANUENTES.PROCESSO'
      Size = 120
    end
    object qry_anuentes_CGC: TStringField
      FieldName = 'CGC'
      Origin = 'TPROC_ANUENTES.CGC'
      Size = 18
    end
    object qry_anuentes_look_orgao: TStringField
      DisplayLabel = 'Org'#227'o Anuente'
      DisplayWidth = 120
      FieldKind = fkLookup
      FieldName = 'look_orgao'
      LookupDataSet = qry_orgao_anuentes_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ORGAO'
      Size = 120
      Lookup = True
    end
    object qry_anuentes_CalcCodNomeOrgao: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcCodNomeOrgao'
      Size = 140
      Calculated = True
    end
  end
  object qry_orgao_anuentes_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TORGAO_ANUENTES ( NOLOCK )')
    Left = 240
    Top = 128
  end
  object qry_tp_acordo_tarif_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_ACORDO_TARIF')
    Left = 144
    Top = 184
  end
  object ds_tp_acordo_tarif: TDataSource
    DataSet = qry_tp_acordo_tarif_
    Left = 40
    Top = 184
  end
  object sp_li_exclui: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_li_exclui'
    Left = 336
    Top = 16
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
  object sp_li_monta_li: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_li_monta_li'
    Left = 336
    Top = 72
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
  object sp_li_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_li_calculo'
    Left = 336
    Top = 126
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
  object qry_fund_legal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TFUND_LEG_REG_TRIBUT ( NOLOCK )'
      'WHERE CODIGO IN'
      '( SELECT CD_FUND_LEGAL'
      '  FROM TTP_FUND_LEGAL T ( NOLOCK )'
      '  WHERE CD_REGIME_TRIB = :CD_REGIME_TRIB )')
    Left = 240
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_REGIME_TRIB'
        ParamType = ptUnknown
      end>
  end
  object SqlAuxiliar: TQuery
    DatabaseName = 'DBBROKER'
    Left = 240
    Top = 191
  end
end
