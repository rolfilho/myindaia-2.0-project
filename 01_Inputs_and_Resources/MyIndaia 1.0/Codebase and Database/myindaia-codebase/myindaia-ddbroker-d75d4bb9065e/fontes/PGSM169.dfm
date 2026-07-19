object datm_ct_contabil: Tdatm_ct_contabil
  OldCreateOrder = True
  Left = 355
  Top = 220
  Height = 263
  Width = 900
  object ds_ct_contabil: TDataSource
    DataSet = qry_ct_contabil_
    Left = 39
    Top = 97
  end
  object qry_ct_contabil_: TQuery
    BeforeOpen = qry_ct_contabil_BeforeOpen
    AfterInsert = qry_ct_contabil_AfterInsert
    BeforePost = qry_ct_contabil_BeforePost
    AfterScroll = qry_ct_contabil_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *  FROM TCT_CONTABIL where ANO_CONTA =:ANO_CONTA'
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 40
    Top = 33
    ParamData = <
      item
        DataType = ftString
        Name = 'ANO_CONTA'
        ParamType = ptUnknown
      end>
    object qry_ct_contabil_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabil_CD_CT_CONTABIL_PAI: TStringField
      DisplayLabel = 'Conta Pai'
      FieldName = 'CD_CT_CONTABIL_PAI'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL_PAI'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabil_CD_CT_CONTABIL_FLUXO: TStringField
      FieldName = 'CD_CT_CONTABIL_FLUXO'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL_FLUXO'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabil_NM_CT_CONTABIL: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
    object qry_ct_contabil_IN_DISTRIBUI: TStringField
      FieldName = 'IN_DISTRIBUI'
      Origin = 'TCT_CONTABIL.IN_DISTRIBUI'
      Size = 1
    end
    object qry_ct_contabil_CD_ACESSO: TStringField
      DisplayLabel = 'Acesso'
      FieldName = 'CD_ACESSO'
      Origin = 'TCT_CONTABIL.CD_ACESSO'
      Size = 1
    end
    object qry_ct_contabil_CD_AUX: TStringField
      DisplayLabel = 'Aux.'
      FieldName = 'CD_AUX'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 3
    end
    object qry_ct_contabil_CD_GRAU: TStringField
      DisplayLabel = 'Grau'
      FieldName = 'CD_GRAU'
      Origin = 'TCT_CONTABIL.CD_GRAU'
      Size = 1
    end
    object qry_ct_contabil_CD_IDENTIFICADOR: TStringField
      FieldName = 'CD_IDENTIFICADOR'
      Origin = 'TCT_CONTABIL.CD_IDENTIFICADOR'
      Size = 1
    end
    object qry_ct_contabil_IN_EMBARQUE: TStringField
      FieldName = 'IN_EMBARQUE'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_ct_contabil_IN_CONTABILIZA: TStringField
      FieldName = 'IN_CONTABILIZA'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 1
    end
    object qry_ct_contabil_LookDistribui: TStringField
      DisplayLabel = 'Distr. Ger.'
      FieldKind = fkLookup
      FieldName = 'LookDistribui'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 3
      Lookup = True
    end
    object qry_ct_contabil_LookIndicador: TStringField
      DisplayLabel = 'Indicador'
      FieldKind = fkLookup
      FieldName = 'LookIndicador'
      LookupDataSet = qry_tp_indicador_
      LookupKeyFields = 'TP_INDICADOR'
      LookupResultField = 'NM_INDICADOR'
      KeyFields = 'CD_IDENTIFICADOR'
      Lookup = True
    end
    object qry_ct_contabil_IN_REEMBOLSO: TStringField
      FieldName = 'IN_REEMBOLSO'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_ct_contabil_LookReembolso: TStringField
      FieldKind = fkLookup
      FieldName = 'LookReembolso'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_REEMBOLSO'
      Size = 3
      Lookup = True
    end
    object qry_ct_contabil_CD_RATEIO: TStringField
      DisplayLabel = 'C'#243'd. Rateio'
      FieldName = 'CD_RATEIO'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_RATEIO'
      FixedChar = True
      Size = 4
    end
    object qry_ct_contabil_ANO_CONTA: TStringField
      FieldName = 'ANO_CONTA'
      Origin = 'DBBROKER.TCT_CONTABIL.ANO_CONTA'
      FixedChar = True
      Size = 4
    end
    object qry_ct_contabil_IN_FLUXO_CAIXA_BANCO: TStringField
      FieldName = 'IN_FLUXO_CAIXA_BANCO'
      Origin = 'DBBROKER.TCT_CONTABIL.IN_FLUXO_CAIXA_BANCO'
      FixedChar = True
      Size = 1
    end
    object qry_ct_contabil_IN_FLUXO_CAIXA_FLUXO: TStringField
      FieldName = 'IN_FLUXO_CAIXA_FLUXO'
      Origin = 'DBBROKER.TCT_CONTABIL.IN_FLUXO_CAIXA_FLUXO'
      FixedChar = True
      Size = 1
    end
  end
  object tbl_yesno_: TTable
    Active = True
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 130
    Top = 33
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
    object tbl_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Required = True
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 130
    Top = 97
  end
  object ds_ct_contabil_gerencial: TDataSource
    DataSet = qry_ct_contabil_gerencial_
    Left = 322
    Top = 97
  end
  object qry_ct_contabil_gerencial_: TQuery
    AfterDelete = qry_ct_contabil_gerencial_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TCT_CONTABIL_GERENCIAL'
      'WHERE CD_CT_CONTABIL = :CD_CT_CONTABIL'
      'ORDER BY CD_MES, CD_ANO, CD_CT_GERENCIAL')
    Left = 322
    Top = 33
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
      end>
    object qry_ct_contabil_gerencial_CD_ANO: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'CD_ANO'
      Origin = 'TCT_CONTABIL_GERENCIAL.CD_CT_CONTABIL'
      EditMask = '9999;1;_'
      Size = 4
    end
    object qry_ct_contabil_gerencial_CD_MES: TStringField
      FieldName = 'CD_MES'
      Origin = 'TCT_CONTABIL_GERENCIAL.CD_CT_GERENCIAL'
      Size = 2
    end
    object qry_ct_contabil_gerencial_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL_GERENCIAL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabil_gerencial_CD_CT_GERENCIAL: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TCT_CONTABIL_GERENCIAL.CD_CT_GERENCIAL'
      Size = 4
    end
    object qry_ct_contabil_gerencial_LookCtContabil: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtContabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_ct_contabil_gerencial_LookCtGerencial: TStringField
      DisplayLabel = 'Conta Gerencial'
      FieldKind = fkLookup
      FieldName = 'LookCtGerencial'
      LookupDataSet = qry_ct_gerencial_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GERENCIAL'
      Lookup = True
    end
    object qry_ct_contabil_gerencial_VL_PORCENTAGEM: TFloatField
      DisplayLabel = 'Porcentagem'
      FieldName = 'VL_PORCENTAGEM'
      Origin = 'TCT_CONTABIL_GERENCIAL.CD_CT_CONTABIL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ct_contabil_gerencial_LookMes: TStringField
      DisplayLabel = 'M'#234's'
      FieldKind = fkLookup
      FieldName = 'LookMes'
      LookupDataSet = qry_meses_
      LookupKeyFields = 'CD_MES'
      LookupResultField = 'NM_MES'
      KeyFields = 'CD_MES'
      Size = 10
      Lookup = True
    end
  end
  object ds_ct_gerencial: TDataSource
    DataSet = qry_ct_gerencial_
    Left = 211
    Top = 97
  end
  object qry_ct_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT * FROM TCT_GERENCIAL'
      'ORDER BY '
      'CD_CT_GERENCIAL')
    Left = 211
    Top = 33
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
  object ds_tp_indicador: TDataSource
    DataSet = qry_tp_indicador_
    Left = 442
    Top = 97
  end
  object qry_tp_indicador_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_INDICADOR')
    Left = 442
    Top = 33
    object qry_tp_indicador_TP_INDICADOR: TStringField
      FieldName = 'TP_INDICADOR'
      Origin = 'TTP_INDICADOR.TP_INDICADOR'
      Size = 1
    end
    object qry_tp_indicador_NM_INDICADOR: TStringField
      FieldName = 'NM_INDICADOR'
      Origin = 'TTP_INDICADOR.NM_INDICADOR'
    end
  end
  object sp_exclui_conta_contabil: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exclui_ct_contabil'
    Left = 672
    Top = 33
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_ct_contabil'
        ParamType = ptInput
      end>
  end
  object qry_acesso_aux_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT'
      'FROM TCT_CONTABIL'
      'WHERE CD_ACESSO = :CD_ACESSO AND'
      'CD_AUX = :CD_AUX')
    Left = 672
    Top = 97
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_AUX'
        ParamType = ptUnknown
      end>
    object qry_acesso_aux_TOT: TIntegerField
      FieldName = 'TOT'
    end
  end
  object qry_arv_: TQuery
    OnCalcFields = qry_arv_CalcFields
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, CD_CT_CONTABIL_PAI, NM_CT_CONTABIL'
      'FROM TCT_CONTABIL'
      'WHERE CD_GRAU = :CD_GRAU'
      'ORDER BY CD_CT_CONTABIL')
    Left = 211
    Top = 177
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRAU'
        ParamType = ptUnknown
      end>
    object qry_arv_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_arv_CD_CT_CONTABIL_PAI: TStringField
      FieldName = 'CD_CT_CONTABIL_PAI'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL_PAI'
      FixedChar = True
      Size = 12
    end
    object qry_arv_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
    object qry_arv_CalcCtContabil: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcCtContabil'
      Size = 12
      Calculated = True
    end
    object qry_arv_CalcCtContabilPai: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcCtContabilPai'
      Size = 12
      Calculated = True
    end
  end
  object qry_graus_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT MAX( DISTINCT(CD_GRAU) ) NR_GRAUS'
      'FROM TCT_CONTABIL'
      'ORDER BY NR_GRAUS')
    Left = 130
    Top = 177
    object qry_graus_NR_GRAUS: TStringField
      FieldName = 'NR_GRAUS'
      Origin = 'TCT_CONTABIL.CD_GRAU'
      Size = 1
    end
  end
  object qry_ct_pai_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_GRAU'
      'FROM TCT_CONTABIL'
      'WHERE CD_CT_CONTABIL = :CD_CT_CONTABIL_PAI')
    Left = 38
    Top = 177
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL_PAI'
        ParamType = ptUnknown
      end>
    object qry_ct_pai_CD_GRAU: TStringField
      FieldName = 'CD_GRAU'
      Origin = 'TCT_CONTABIL.CD_GRAU'
      Size = 1
    end
  end
  object qry_soma_ct_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ROUND( ISNULL( SUM( VL_PORCENTAGEM ), 0 ), 2) SOMA'
      'FROM   TCT_CONTABIL_GERENCIAL'
      'WHERE  CD_CT_CONTABIL = :CD_CT_CONTABIL AND'
      '       CD_MES = :CD_MES AND'
      '       CD_ANO = :CD_ANO')
    Left = 321
    Top = 177
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ANO'
        ParamType = ptUnknown
      end>
    object qry_soma_ct_gerencial_SOMA: TFloatField
      FieldName = 'SOMA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
  end
  object ds_meses: TDataSource
    DataSet = qry_meses_
    Left = 555
    Top = 97
  end
  object qry_meses_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT * FROM TMESES'
      'ORDER BY '
      'CD_MES')
    Left = 555
    Top = 33
    object qry_meses_CD_MES: TStringField
      FieldName = 'CD_MES'
      Origin = 'TMESES.CD_MES'
      Size = 2
    end
    object qry_meses_NM_MES: TStringField
      FieldName = 'NM_MES'
      Origin = 'TMESES.NM_MES'
      Size = 10
    end
  end
  object qry_por_mes_ano_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT CD_MES+CD_ANO PERIODO'
      'FROM   TCT_CONTABIL_GERENCIAL'
      'WHERE  CD_CT_CONTABIL = :CD_CT_CONTABIL')
    Left = 441
    Top = 177
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
      end>
    object qry_por_mes_ano_PERIODO: TStringField
      FieldName = 'PERIODO'
      Origin = 'TCT_CONTABIL_GERENCIAL.CD_MES'
      Size = 6
    end
  end
  object sp_si_digito: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_si_digito'
    Left = 560
    Top = 178
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_ct_contabil'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = '@digito'
        ParamType = ptOutput
        Value = 1
      end>
  end
  object qry_contabil_novo: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TDP_CONTABIL_NOVO'
      'WHERE TX_OLD = :CD_CT_CONTABIL')
    Left = 800
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
      end>
    object qry_contabil_novoTX_OLD: TStringField
      FieldName = 'TX_OLD'
      Origin = 'DBBROKER.TDP_CONTABIL_NOVO.TX_OLD'
      FixedChar = True
      Size = 12
    end
    object qry_contabil_novoTX_NEW: TStringField
      FieldName = 'TX_NEW'
      Origin = 'DBBROKER.TDP_CONTABIL_NOVO.TX_NEW'
      FixedChar = True
      Size = 7
    end
  end
  object ds_contabil_novo: TDataSource
    DataSet = qry_contabil_novo
    Left = 808
    Top = 104
  end
end
