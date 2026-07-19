object datm_hist_padrao: Tdatm_hist_padrao
  OldCreateOrder = True
  Left = 118
  Top = 105
  Height = 198
  Width = 328
  object ds_hist_padrao: TDataSource
    DataSet = qry_hist_padrao_
    Left = 132
    Top = 80
  end
  object qry_hist_padrao_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_hist_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM THIST_PADRAO'
      'WHERE CD_HISTORICO = :CD_HISTORICO'
      'ORDER BY'
      'CD_HISTORICO')
    Left = 132
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_HISTORICO'
        ParamType = ptUnknown
      end>
    object qry_hist_padrao_CD_HISTORICO: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_HISTORICO'
      Origin = 'THIST_PADRAO.CD_HISTORICO'
      Size = 3
    end
    object qry_hist_padrao_NM_HISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'NM_HISTORICO'
      Origin = 'THIST_PADRAO.NM_HISTORICO'
      Size = 50
    end
    object qry_hist_padrao_TX_HISTORICO: TMemoField
      FieldName = 'TX_HISTORICO'
      Origin = 'THIST_PADRAO.CD_HISTORICO'
      BlobType = ftMemo
    end
  end
  object qry_ult_historico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_HISTORICO) AS ULTIMO'
      'FROM THIST_PADRAO')
    Left = 228
    Top = 24
    object qry_ult_historico_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
  end
  object qry_hist_lista_: TQuery
    AfterScroll = qry_hist_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_HISTORICO, NM_HISTORICO FROM THIST_PADRAO'
      'WHERE CD_HISTORICO <> '#39#39
      'ORDER BY'
      'CD_HISTORICO')
    Left = 33
    Top = 24
    object qry_hist_lista_CD_HISTORICO: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_HISTORICO'
      Origin = 'THIST_PADRAO.CD_HISTORICO'
      Size = 3
    end
    object qry_hist_lista_NM_HISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'NM_HISTORICO'
      Origin = 'THIST_PADRAO.NM_HISTORICO'
      Size = 50
    end
  end
  object ds_hist_lista: TDataSource
    DataSet = qry_hist_lista_
    Left = 33
    Top = 80
  end
end
