object datm_previsao_custo: Tdatm_previsao_custo
  Left = 279
  Top = 206
  Height = 195
  Width = 570
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG IN '
      '              ( SELECT CD_UNID_NEG '
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 44
    Top = 12
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object qry_processo_: TQuery
    OnCalcFields = qry_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO'
      'FROM TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 257
    Top = 12
    object qry_processo_Calc_Nr_Processo: TStringField
      FieldName = 'Calc_Nr_Processo'
      Size = 11
      Calculated = True
    end
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 257
    Top = 68
  end
  object qry_previsao_custo_: TQuery
    AfterOpen = qry_previsao_custo_AfterOpen
    AfterPost = qry_previsao_custo_AfterPost
    AfterDelete = qry_previsao_custo_AfterDelete
    AfterScroll = qry_previsao_custo_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPREVISAO_CUSTO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 369
    Top = 12
    object qry_previsao_custo_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TPREVISAO_CUSTO.NR_SEQUENCIA'
    end
    object qry_previsao_custo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREVISAO_CUSTO.NR_PROCESSO'
      Size = 18
    end
    object qry_previsao_custo_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TPREVISAO_CUSTO.CD_ITEM'
      Size = 3
    end
    object qry_previsao_custo_VL_CALCULADO: TFloatField
      FieldName = 'VL_CALCULADO'
      Origin = 'TPREVISAO_CUSTO.VL_CALCULADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_custo_VL_INFORMADO: TFloatField
      FieldName = 'VL_INFORMADO'
      Origin = 'TPREVISAO_CUSTO.VL_INFORMADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_custo_DT_LANCAMENTO: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
      Origin = 'TPREVISAO_CUSTO.DT_LANCAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999'
    end
    object qry_previsao_custo_VL_TAXA: TFloatField
      FieldName = 'VL_TAXA'
      Origin = 'TPREVISAO_CUSTO.VL_TAXA'
    end
    object qry_previsao_custo_IN_TRANSF: TStringField
      FieldName = 'IN_TRANSF'
      Origin = 'TPREVISAO_CUSTO.IN_TRANSF'
      Size = 1
    end
    object qry_previsao_custo_look_nm_item: TStringField
      FieldName = 'look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
  end
  object ds_previsao_custo: TDataSource
    DataSet = qry_previsao_custo_
    Left = 369
    Top = 68
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM, CD_TIPO_ITEM '
      'FROM TITEM '
      '')
    Left = 144
    Top = 12
    object StringField1: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object StringField2: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
  end
  object sp_atz_prev_custo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_prev_custo'
    Params.Data = {
      0100020006526573756C74040304000000000000000C406E725F70726F636573
      736F0101020030000000}
    Left = 44
    Top = 68
    object StringField8: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField9: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_apaga_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE TPREVISAO_CUSTO')
    Left = 144
    Top = 72
    object StringField3: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object StringField5: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
  end
  object qry_taxa_cambio_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TX_CAMBIO'#13
      'FROM TTAXA_CAMBIO'
      'WHERE :DT_LANCAMENTO BETWEEN DT_INICIO_VIGENCIA AND '
      'DT_TERMINO_VIGENCIA AND CD_MOEDA = '#39'220'#39)
    Params.Data = {010001000D44545F4C414E43414D454E544F000904005A950A000000}
    Left = 477
    Top = 12
    object qry_taxa_cambio_TX_CAMBIO: TFloatField
      FieldName = 'TX_CAMBIO'
    end
  end
  object qry_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(DI.NR_PROCESSO) TOTAL'
      'FROM TDECLARACAO_IMPORTACAO DI,'
      'TDETALHE_MERCADORIA I'
      'WHERE DI.NR_PROCESSO = I.NR_PROCESSO AND'
      'DI.NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 477
    Top = 68
    object qry_di_TOTAL: TIntegerField
      FieldName = 'TOTAL'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
  end
end
