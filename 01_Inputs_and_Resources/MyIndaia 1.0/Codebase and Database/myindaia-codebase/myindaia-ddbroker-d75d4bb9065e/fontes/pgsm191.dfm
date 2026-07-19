object datm_cabecalho: Tdatm_cabecalho
  Left = 31
  Top = 117
  Height = 247
  Width = 571
  object ds_cabecalho: TDataSource
    DataSet = qry_cabecalho_
    Left = 136
    Top = 77
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 32
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
    Left = 32
    Top = 77
  end
  object qry_cabecalho_: TQuery
    BeforeInsert = qry_cabecalho_BeforeInsert
    BeforeEdit = qry_cabecalho_BeforeEdit
    AfterPost = qry_cabecalho_AfterPost
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TCABECALHO ORDER BY'
      'CODIGO')
    Left = 136
    Top = 20
    object qry_cabecalho_CODIGO: TStringField
      DisplayLabel = '9999;0;_'
      FieldName = 'CODIGO'
      Origin = 'TCABECALHO.CODIGO'
      EditMask = '9999;0;_'
      Size = 4
    end
    object qry_cabecalho_NOME: TStringField
      FieldName = 'NOME'
      Origin = 'TCABECALHO.NOME'
      Size = 30
    end
    object qry_cabecalho_TEXTO: TMemoField
      FieldName = 'TEXTO'
      Origin = 'TCABECALHO.TEXTO'
      BlobType = ftMemo
    end
  end
  object qry_ultimo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CODIGO) ULTIMO'
      'FROM  TCABECALHO')
    Left = 224
    Top = 20
    object qry_ultimo_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
  end
end
