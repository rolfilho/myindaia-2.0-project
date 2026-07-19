object datm_release: Tdatm_release
  OldCreateOrder = True
  Left = 269
  Top = 162
  Height = 195
  Width = 278
  object qry_lista_: TQuery
    BeforePost = qry_lista_BeforePost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *  '
      'FROM TRELEASE  ORDER BY '
      'NR_VERSAO DESC, NR_ITEM'
      ''
      ''
      ''
      '')
    Left = 19
    Top = 20
    object qry_lista_NR_VERSAO: TStringField
      DisplayWidth = 8
      FieldName = 'NR_VERSAO'
      Origin = 'TRELEASE.NR_VERSAO'
      Size = 8
    end
    object qry_lista_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TRELEASE.NR_ITEM'
      Size = 3
    end
    object qry_lista_PATH_TELA: TStringField
      FieldName = 'PATH_TELA'
      Origin = 'TRELEASE.PATH_TELA'
      Size = 200
    end
    object qry_lista_TX_PENDENCIA: TMemoField
      FieldName = 'TX_PENDENCIA'
      Origin = 'TRELEASE.TX_PENDENCIA'
      BlobType = ftMemo
    end
    object qry_lista_TX_ALTERACOES: TMemoField
      FieldName = 'TX_ALTERACOES'
      Origin = 'TRELEASE.TX_ALTERACOES'
      BlobType = ftMemo
    end
    object qry_lista_TX_RELEASE: TMemoField
      FieldName = 'TX_RELEASE'
      Origin = 'TRELEASE.TX_RELEASE'
      BlobType = ftMemo
    end
    object qry_lista_TP_RELEASE: TStringField
      FieldName = 'TP_RELEASE'
      Origin = 'TRELEASE.TP_RELEASE'
      Size = 1
    end
    object qry_lista_Look_release: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_release'
      LookupDataSet = qry_ttp_release_
      LookupKeyFields = 'TP_RELEASE'
      LookupResultField = 'NM_TP_RELEASE'
      KeyFields = 'TP_RELEASE'
      Lookup = True
    end
  end
  object qry_ttp_release_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_RELEASE')
    Left = 115
    Top = 20
    object qry_ttp_release_TP_RELEASE: TStringField
      FieldName = 'TP_RELEASE'
      Origin = 'TTP_RELEASE.TP_RELEASE'
      Size = 1
    end
    object qry_ttp_release_NM_TP_RELEASE: TStringField
      FieldName = 'NM_TP_RELEASE'
      Origin = 'TTP_RELEASE.NM_TP_RELEASE'
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 19
    Top = 92
  end
  object ds_ttp_release: TDataSource
    DataSet = qry_ttp_release_
    Left = 115
    Top = 92
  end
  object qry_ult_release_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX (NR_ITEM) AS ULTIMO'
      'FROM TRELEASE'
      'WHERE NR_VERSAO = :NR_VERSAO'
      ''
      '')
    Left = 203
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_VERSAO'
        ParamType = ptInput
      end>
    object qry_ult_release_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TRELEASE.NR_ITEM'
      Size = 3
    end
  end
end
