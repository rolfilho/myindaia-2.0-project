object datm_acordo: Tdatm_acordo
  OldCreateOrder = True
  Left = 455
  Top = 195
  Height = 384
  Width = 571
  object ds_acordo: TDataSource
    DataSet = qry_acordo_
    Left = 105
    Top = 77
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 32
    Top = 20
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
    Left = 32
    Top = 77
  end
  object qry_acordo_: TQuery
    BeforeInsert = qry_acordo_BeforeInsert
    BeforeEdit = qry_acordo_BeforeEdit
    AfterPost = qry_acordo_AfterPost
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, NOME, IN_ATIVO, FIESP_ID'
      'FROM TACORDO ORDER BY'
      'CODIGO')
    Left = 105
    Top = 20
    object qry_acordo_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TACORDO.CODIGO'
      Size = 10
    end
    object qry_acordo_NOME: TStringField
      FieldName = 'NOME'
      Origin = 'TACORDO.NOME'
      Size = 50
    end
    object qry_acordo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TACORDO.IN_ATIVO'
      Size = 1
    end
    object qry_acordo_LookAtivo: TStringField
      DisplayWidth = 3
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_acordo_FIESP_ID: TIntegerField
      FieldName = 'FIESP_ID'
      Origin = 'DBBROKER.TACORDO.FIESP_ID'
    end
  end
  object ds_normas: TDataSource
    DataSet = qry_normas_
    Left = 181
    Top = 77
  end
  object qry_normas_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, NOME, NM_DESCRICAO, CD_PAIS'
      'FROM TNORMAS ORDER BY'
      'CODIGO')
    Left = 181
    Top = 20
    object qry_normas_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNORMAS.CODIGO'
      Size = 10
    end
    object qry_normas_NOME: TStringField
      FieldName = 'NOME'
      Origin = 'TNORMAS.NOME'
      Size = 50
    end
    object qry_normas_NM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      Origin = 'TNORMAS.CODIGO'
      Size = 200
    end
    object qry_normas_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TNORMAS.CODIGO'
      Size = 3
    end
  end
  object qry_acordo_norma_: TQuery
    BeforeInsert = qry_acordo_norma_BeforeInsert
    BeforeEdit = qry_acordo_norma_BeforeEdit
    OnCalcFields = qry_acordo_norma_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_acordo
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TACORDO_NORMA '
      'WHERE CD_ACORDO = :CODIGO'
      'ORDER BY'
      'CD_NORMA')
    Left = 267
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_acordo_norma_CD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'TACORDO_NORMA.CD_ACORDO'
      Size = 10
    end
    object qry_acordo_norma_CD_NORMA: TStringField
      FieldName = 'CD_NORMA'
      Origin = 'TACORDO_NORMA.CD_NORMA'
      Size = 10
    end
    object qry_acordo_norma_LookNmDescricao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmDescricao'
      LookupDataSet = qry_normas_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NM_DESCRICAO'
      KeyFields = 'CD_NORMA'
      Size = 60
      Lookup = True
    end
    object qry_acordo_norma_LookPais: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldKind = fkCalculated
      FieldName = 'LookPais'
      Size = 120
      Calculated = True
    end
  end
  object ds_acordo_norma: TDataSource
    DataSet = qry_acordo_norma_
    Left = 267
    Top = 77
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPAIS ORDER BY'
      'DESCRICAO')
    Left = 339
    Top = 20
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
  object ds_pais: TDataSource
    DataSet = qry_pais_
    Left = 339
    Top = 77
  end
  object qry_acordo_pais_: TQuery
    BeforeInsert = qry_acordo_pais_BeforeInsert
    BeforeEdit = qry_acordo_pais_BeforeEdit
    DatabaseName = 'DBBROKER'
    DataSource = ds_acordo
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TACORDO_PAIS '
      'WHERE CD_ACORDO = :CODIGO'
      'ORDER BY'
      'CD_PAIS')
    Left = 411
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_acordo_pais_CD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'TACORDO_PAIS.CD_ACORDO'
      Size = 10
    end
    object qry_acordo_pais_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TACORDO_PAIS.CD_PAIS'
      Size = 3
    end
    object qry_acordo_pais_LookNmPais: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmPais'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS'
      Size = 60
      Lookup = True
    end
    object qry_acordo_pais_SIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA'
      Size = 10
    end
  end
  object ds_acordo_pais: TDataSource
    DataSet = qry_acordo_pais_
    Left = 411
    Top = 77
  end
  object qry_apaga_pais_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'DELETE '
      'FROM TACORDO_PAIS'
      'WHERE CD_ACORDO = :CD_ACORDO')
    Left = 131
    Top = 140
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ACORDO'
        ParamType = ptUnknown
      end>
  end
  object qry_apaga_norma_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE '
      'FROM TACORDO_NORMA'
      'WHERE CD_ACORDO = :CD_ACORDO')
    Left = 35
    Top = 140
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACORDO'
        ParamType = ptUnknown
      end>
  end
  object qryClassificacao: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM CLASSIFICACOES_DECLARACAO_ORIGEM ORDER BY SIGLA')
    Left = 35
    Top = 196
  end
  object dsClassificacao: TDataSource
    DataSet = qryClassificacao
    Left = 35
    Top = 253
  end
end
