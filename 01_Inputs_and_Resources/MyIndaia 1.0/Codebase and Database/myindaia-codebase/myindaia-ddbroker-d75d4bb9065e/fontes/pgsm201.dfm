object datm_ncm_exp: Tdatm_ncm_exp
  Left = 446
  Top = 185
  Height = 150
  Width = 282
  object qry_ncm_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TNCM_EXP'
      'ORDER BY'
      'CODIGO')
    Left = 120
    Top = 16
    object qry_ncm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNCM_EXP.CODIGO'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_ncm_NR_SEQ: TIntegerField
      FieldName = 'NR_SEQ'
      Origin = 'TNCM_EXP.CODIGO'
    end
    object qry_ncm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TNCM_EXP.CODIGO'
      Size = 255
    end
  end
  object ds_ncm_: TDataSource
    DataSet = qry_ncm_
    Left = 32
    Top = 16
  end
  object qry_verifica_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, NR_SEQ'
      'FROM TNCM_EXP'
      'WHERE CODIGO = :CODIGO'
      'ORDER BY'
      'CODIGO, NR_SEQ DESC')
    Params.Data = {0100010006434F4449474F00030400000000000000}
    Left = 192
    Top = 16
    object qry_verifica_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNCM_EXP.CODIGO'
      Size = 8
    end
    object qry_verifica_NR_SEQ: TIntegerField
      FieldName = 'NR_SEQ'
      Origin = 'TNCM_EXP.NR_SEQ'
    end
  end
end
