object datm_print_recibo: Tdatm_print_recibo
  OldCreateOrder = True
  Left = 256
  Top = 206
  Height = 190
  Width = 185
  object qry_ref_: TQuery
    AfterInsert = qry_ref_AfterInsert
    BeforePost = qry_ref_BeforePost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TREFERENCIA_RECEB'
      'WHERE CD_USUARIO = :CD_USUARIO'
      'ORDER BY CD_REFERENCIA')
    Left = 24
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
        Value = '0'
      end>
    object qry_ref_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREFERENCIA_RECEB.CD_REFERENCIA'
      Size = 4
    end
    object qry_ref_TX_REFERENCIA: TMemoField
      FieldName = 'TX_REFERENCIA'
      Origin = 'TREFERENCIA_RECEB.TX_REFERENCIA'
      BlobType = ftMemo
    end
    object qry_ref_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TREFERENCIA_RECEB.CD_REFERENCIA'
      Size = 4
    end
  end
  object ds_ref_: TDataSource
    DataSet = qry_ref_
    Left = 108
    Top = 16
  end
  object qry_max_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL(MAX( CD_REFERENCIA ),0) MAX_CODIGO FROM'
      'TREFERENCIA_RECEB')
    Left = 24
    Top = 80
    object qry_max_MAX_CODIGO: TStringField
      FieldName = 'MAX_CODIGO'
      Origin = 'TREFERENCIA_RECEB.CD_REFERENCIA'
      Size = 4
    end
  end
end
