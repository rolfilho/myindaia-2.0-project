object datm_naladi_ncca_exp: Tdatm_naladi_ncca_exp
  Left = 446
  Top = 185
  Height = 150
  Width = 282
  object qry_naladi_: TQuery
    AfterPost = qry_naladi_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TNALADINCCA_EXP'
      'ORDER BY'
      'CODIGO')
    Left = 120
    Top = 16
    object qry_naladi_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNALADINCCA_EXP.CODIGO'
      EditMask = '9999.99.9;0;_'
      Size = 7
    end
    object qry_naladi_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TNALADINCCA_EXP.DESCRICAO'
      Size = 120
    end
    object qry_naladi_NR_SEQ: TIntegerField
      FieldName = 'NR_SEQ'
      Origin = 'TNALADINCCA_EXP.CODIGO'
    end
  end
  object ds_naladi_: TDataSource
    DataSet = qry_naladi_
    Left = 32
    Top = 16
  end
  object qry_verifica_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, NR_SEQ'
      'FROM TNALADINCCA_EXP'
      'WHERE CODIGO = :CODIGO'
      'ORDER BY'
      'CODIGO, NR_SEQ DESC')
    Params.Data = {0100010006434F4449474F00030400000000000000}
    Left = 192
    Top = 16
    object qry_verifica_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNALADINCCA_EXP.CODIGO'
      Size = 7
    end
    object qry_verifica_NR_SEQ: TIntegerField
      FieldName = 'NR_SEQ'
      Origin = 'TNALADINCCA_EXP.NR_SEQ'
    end
  end
end
