object datm_local_emissao: Tdatm_local_emissao
  Left = 140
  Top = 183
  Height = 247
  Width = 571
  object ds_local_emis: TDataSource
    DataSet = qry_local_emis_
    Left = 32
    Top = 93
  end
  object qry_local_emis_: TQuery
    BeforeInsert = qry_local_emis_BeforeInsert
    BeforeEdit = qry_local_emis_BeforeEdit
    AfterPost = qry_local_emis_AfterPost
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLOCAL_EMISSAO ORDER BY'
      'CODIGO')
    Left = 32
    Top = 20
    object qry_local_emis_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TLOCAL_EMISSAO.CODIGO'
      Size = 3
    end
    object qry_local_emis_NOME: TStringField
      FieldName = 'NOME'
      Origin = 'TLOCAL_EMISSAO.NOME'
      Size = 50
    end
    object qry_local_emis_ESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'TLOCAL_EMISSAO.ESTADO'
      Size = 2
    end
    object qry_local_emis_PAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'TLOCAL_EMISSAO.PAIS'
      Size = 3
    end
    object qry_local_emis_LookPais: TStringField
      FieldName = 'LookPais'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PAIS'
      Lookup = True
    end
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT * '
      'FROM TPAIS ORDER BY'
      'DESCRICAO')
    Left = 128
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
end
