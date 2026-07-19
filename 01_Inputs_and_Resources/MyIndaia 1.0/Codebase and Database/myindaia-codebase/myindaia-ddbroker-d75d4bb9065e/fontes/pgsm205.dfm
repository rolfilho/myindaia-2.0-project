object datm_naladi_sh_exp: Tdatm_naladi_sh_exp
  Left = 381
  Top = 183
  Height = 150
  Width = 407
  object qry_naladi_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TNALADISH_EXP'
      'ORDER BY'
      'CODIGO, NR_SEQ')
    Left = 120
    Top = 16
    object qry_naladi_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNALADISH_EXP.CODIGO'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_naladi_DESCRICAO: TStringField
      DisplayWidth = 200
      FieldName = 'DESCRICAO'
      Origin = 'TNALADISH_EXP.DESCRICAO'
      Size = 200
    end
    object qry_naladi_NR_SEQ: TIntegerField
      FieldName = 'NR_SEQ'
      Origin = 'TNALADISH_EXP.CODIGO'
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
      'FROM TNALADISH_EXP'
      'WHERE CODIGO = :CODIGO'
      'ORDER BY'
      'CODIGO, NR_SEQ DESC')
    Params.Data = {0100010006434F4449474F00030400000000000000}
    Left = 192
    Top = 16
    object qry_verifica_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNALADISH_EXP.CODIGO'
      Size = 8
    end
    object qry_verifica_NR_SEQ: TIntegerField
      FieldName = 'NR_SEQ'
      Origin = 'TNALADISH_EXP.NR_SEQ'
    end
  end
end
