object datm_inst_negoc: Tdatm_inst_negoc
  Left = 200
  Top = 104
  Height = 221
  Width = 531
  object ds_inst_negoc: TDataSource
    DataSet = qry_inst_negoc_
    Left = 39
    Top = 97
  end
  object qry_inst_negoc_: TQuery
    AfterScroll = qry_inst_negoc_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TINST_NEGOC'
      'ORDER BY'
      'NM_INST_NEGOC')
    Left = 39
    Top = 33
    object qry_inst_negoc_CD_INST_NEGOC: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_INST_NEGOC'
      Origin = 'TINST_NEGOC.CD_INST_NEGOC'
      Size = 5
    end
    object qry_inst_negoc_NM_INST_NEGOC: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_INST_NEGOC'
      Origin = 'TINST_NEGOC.NM_INST_NEGOC'
      Size = 60
    end
    object qry_inst_negoc_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TINST_NEGOC.CD_INST_NEGOC'
      Size = 1
    end
    object qry_inst_negoc_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
  end
  object tbl_yesno_: TTable
    Active = True
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 338
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
    Left = 338
    Top = 97
  end
  object ds_pais: TDataSource
    DataSet = qry_pais_
    Left = 244
    Top = 97
  end
  object qry_pais_: TQuery
    AfterDelete = qry_pais_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPAIS'
      'ORDER BY DESCRICAO')
    Left = 244
    Top = 33
    object qry_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TPAIS.CODIGO'
      Size = 3
    end
    object qry_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TPAIS.DESCRICAO'
      Size = 120
    end
  end
  object ds_inst_negoc_pais: TDataSource
    DataSet = qry_inst_negoc_pais_
    Left = 149
    Top = 97
  end
  object qry_inst_negoc_pais_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TINST_NEGOC_PAIS'
      'WHERE CD_INST_NEGOC = :CD_INST_NEGOC ORDER BY '
      'CD_PAIS')
    Params.Data = {010001000D43445F494E53545F4E45474F430001020030000000}
    Left = 149
    Top = 33
    object qry_inst_negoc_pais_CD_INST_NEGOC: TStringField
      FieldName = 'CD_INST_NEGOC'
      Origin = 'TINST_NEGOC_PAIS.CD_INST_NEGOC'
      Size = 5
    end
    object qry_inst_negoc_pais_CD_PAIS: TStringField
      DisplayLabel = 'Cód. País'
      FieldName = 'CD_PAIS'
      Origin = 'TINST_NEGOC_PAIS.CD_PAIS'
      Size = 3
    end
    object qry_inst_negoc_pais_LookPais: TStringField
      DisplayLabel = 'País'
      FieldName = 'LookPais'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS'
      Size = 120
      Lookup = True
    end
    object qry_inst_negoc_pais_LookInstNegoc: TStringField
      DisplayLabel = 'Instrumento de Negociação'
      FieldName = 'LookInstNegoc'
      LookupDataSet = qry_inst_negoc_
      LookupKeyFields = 'CD_INST_NEGOC'
      LookupResultField = 'NM_INST_NEGOC'
      KeyFields = 'CD_INST_NEGOC'
      Size = 60
      Lookup = True
    end
  end
  object qry_ult_inst_negoc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX( CD_INST_NEGOC ) AS ULTIMO'
      'FROM TINST_NEGOC')
    Left = 436
    Top = 33
    object qry_ult_inst_negoc_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TINST_NEGOC.CD_INST_NEGOC'
      Size = 5
    end
  end
  object sp_exclui_inst_negoc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exclui_inst_negoc'
    Params.Data = {
      0100020006526573756C74040304000000000000010E4063645F696E73745F6E
      65676F630101020030000000}
    Left = 436
    Top = 97
  end
end
