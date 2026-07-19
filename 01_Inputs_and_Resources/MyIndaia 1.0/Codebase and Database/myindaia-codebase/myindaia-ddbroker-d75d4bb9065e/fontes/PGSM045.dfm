object datm_celula: Tdatm_celula
  Left = 200
  Top = 98
  Height = 257
  Width = 325
  object ds_celula: TDataSource
    DataSet = qry_celula_
    Left = 52
    Top = 24
  end
  object qry_celula_: TQuery
    OnCalcFields = qry_celula_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TCELULA'
      'ORDER BY'
      'CD_CELULA')
    Left = 124
    Top = 24
    object qry_celula_CD_CELULA: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_CELULA'
      Origin = 'TCELULA.CD_CELULA'
      Size = 2
    end
    object qry_celula_NM_CELULA: TStringField
      DisplayLabel = 'Célula'
      FieldName = 'NM_CELULA'
      Origin = 'TCELULA.NM_CELULA'
      Size = 30
    end
    object qry_celula_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TEQUIPE.IN_ATIVO'
      Size = 1
    end
    object qry_celula_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_celula_CD_ANALISTA: TStringField
      FieldName = 'CD_ANALISTA'
      Origin = 'TCELULA.IN_ATIVO'
      Size = 4
    end
    object qry_celula_LookAnalista: TStringField
      FieldName = 'LookAnalista'
      Size = 50
      Calculated = True
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 52
    Top = 88
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 124
    Top = 88
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
  end
  object qry_ult_celula_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_CELULA) AS ULTIMO'
      'FROM TCELULA')
    Left = 52
    Top = 148
    object qry_ult_celula_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TCELULA.CD_CELULA'
      Size = 2
    end
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT U.CD_USUARIO, U.NM_USUARIO'
      'FROM   TUSUARIO U'
      'WHERE  U.CD_USUARIO = :CD_ANALISTA AND'
      '       ( (  U.CD_USUARIO = :CD_USUARIO OR'
      '            U.CD_CARGO IN'
      '            ( SELECT CD_DESCENDENTE'
      '              FROM TCARGO_DESCENDENTE'
      '              WHERE CD_CARGO = U.CD_CARGO AND'
      '                    CD_DESCENDENTE <> :CD_CARGO ) ) OR'
      '      ( ( :CD_ANALISTA = '#39#39' ) AND ( :CD_CARGO = '#39#39' ) ) )')
    Params.Data = {
      010005000B43445F414E414C4953544100010200300000000A43445F55535541
      52494F00010200300000000843445F434152474F00010200300000000B43445F
      414E414C4953544100010200300000000843445F434152474F00010200300000
      00}
    Left = 198
    Top = 23
  end
end
