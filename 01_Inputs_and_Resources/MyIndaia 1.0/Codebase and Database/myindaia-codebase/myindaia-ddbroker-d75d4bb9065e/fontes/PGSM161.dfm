object datm_enquad_op: Tdatm_enquad_op
  OldCreateOrder = True
  Left = 307
  Top = 217
  Height = 191
  Width = 218
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 136
    Top = 12
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 136
    Top = 69
  end
  object qry_enquad_op_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TENQUAD_OP ORDER BY'
      'NM_ENQUAD_OP'
      '')
    Left = 32
    Top = 12
    object qry_enquad_op_CD_ENQUAD_OP: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_ENQUAD_OP'
      Origin = 'TENQUAD_OP.CD_ENQUAD_OP'
      Size = 5
    end
    object qry_enquad_op_NM_ENQUAD_OP: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_ENQUAD_OP'
      Origin = 'TENQUAD_OP.NM_ENQUAD_OP'
      Size = 60
    end
    object qry_enquad_op_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TENQUAD_OP.IN_ATIVO'
      Size = 1
    end
    object qry_enquad_op_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
  end
  object ds_enquad_op: TDataSource
    DataSet = qry_enquad_op_
    Left = 32
    Top = 69
  end
end
