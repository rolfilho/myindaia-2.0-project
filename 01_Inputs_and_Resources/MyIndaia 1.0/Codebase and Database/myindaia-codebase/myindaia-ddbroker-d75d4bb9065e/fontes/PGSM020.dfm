object datm_serv_classif: Tdatm_serv_classif
  Left = 215
  Top = 149
  Height = 196
  Width = 253
  object ds_serv_classif: TDataSource
    DataSet = qry_serv_classif_
    Left = 36
    Top = 25
  end
  object qry_serv_classif_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TSERVICO_CLASSIFICACAO'
      'ORDER BY'
      'CD_CLASSIFICACAO')
    Left = 140
    Top = 25
    object qry_serv_classif_CD_CLASSIFICACAO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_CLASSIFICACAO'
      Origin = 'TSERVICO_CLASSIFICACAO.CD_CLASSIFICACAO'
      Size = 2
    end
    object qry_serv_classif_NM_CLASSIFICACAO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_CLASSIFICACAO'
      Origin = 'TSERVICO_CLASSIFICACAO.NM_CLASSIFICACAO'
    end
  end
  object qry_ult_serv_classif_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_CLASSIFICACAO) AS ULTIMO'
      'FROM TSERVICO_CLASSIFICACAO')
    Left = 140
    Top = 84
    object qry_ult_serv_classif_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TSERVICO_CLASSIFICACAO.CD_CLASSIFICACAO'
      Size = 2
    end
  end
end
