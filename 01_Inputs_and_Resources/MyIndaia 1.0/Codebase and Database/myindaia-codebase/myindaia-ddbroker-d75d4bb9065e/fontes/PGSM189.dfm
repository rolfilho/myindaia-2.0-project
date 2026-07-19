object datm_normas: Tdatm_normas
  OldCreateOrder = True
  Left = 200
  Top = 211
  Height = 247
  Width = 571
  object ds_normas: TDataSource
    DataSet = qry_normas_
    Left = 136
    Top = 77
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 328
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
    Left = 328
    Top = 77
  end
  object qry_normas_: TQuery
    BeforeInsert = qry_normas_BeforeInsert
    BeforeEdit = qry_normas_BeforeEdit
    AfterPost = qry_normas_AfterPost
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, NOME, NM_DESCRICAO, IN_ATIVO, CD_PAIS'
      'FROM   TNORMAS'
      'WHERE  CODIGO = :CD_NORMA ')
    Left = 136
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_NORMA'
        ParamType = ptUnknown
      end>
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
    object qry_normas_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TNORMAS.IN_ATIVO'
      Size = 1
    end
    object qry_normas_LookAtivo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
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
    object qry_normas_LookPais: TStringField
      FieldKind = fkLookup
      FieldName = 'LookPais'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS'
      Size = 120
      Lookup = True
    end
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM   TPAIS')
    Left = 240
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
  object qry_lista_: TQuery
    AfterScroll = qry_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, NOME, IN_ATIVO, CD_PAIS'
      'FROM   TNORMAS'
      'WHERE  ( ( CODIGO IN ( SELECT CD_NORMA'
      '                        FROM   TACORDO_NORMA'
      '                        WHERE  CD_ACORDO = :CD_ACORDO ) ) OR'
      '         ( :CD_ACORDO = '#39#39' ) )'
      'ORDER BY'
      'CODIGO')
    Left = 49
    Top = 21
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACORDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ACORDO'
        ParamType = ptUnknown
      end>
    object qry_lista_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 10
    end
    object qry_lista_NOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qry_lista_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_lista_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 3
    end
    object qry_lista_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_lista_LookPais: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldKind = fkLookup
      FieldName = 'LookPais'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS'
      Size = 120
      Lookup = True
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 48
    Top = 77
  end
end
