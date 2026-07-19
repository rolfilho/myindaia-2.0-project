object datm_obs: Tdatm_obs
  OldCreateOrder = True
  Left = 321
  Top = 108
  Height = 177
  Width = 283
  object ds_obs: TDataSource
    DataSet = qry_obs_
    Left = 40
    Top = 28
  end
  object qry_obs_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TOBSERVACOES'
      'ORDER BY'
      'TX_DESCRICAO')
    Left = 144
    Top = 88
    object qry_obs_CD_OBS: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_OBS'
      Origin = 'TOBSERVACOES.CD_OBS'
      Size = 4
    end
    object qry_obs_TX_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'TX_DESCRICAO'
      Origin = 'TOBSERVACOES.TX_DESCRICAO'
      Size = 60
    end
    object qry_obs_TX_OBS: TMemoField
      DisplayLabel = 'Texto'
      FieldName = 'TX_OBS'
      Origin = 'TOBSERVACOES.TX_OBS'
      BlobType = ftMemo
    end
    object qry_obs_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TOBSERVACOES.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object qry_ult_obs_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_OBS) AS ULTIMO'
      'FROM TOBSERVACOES')
    Left = 40
    Top = 88
    object qry_ult_obs_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TOBSERVACOES.CD_OBS'
      Size = 4
    end
  end
end
