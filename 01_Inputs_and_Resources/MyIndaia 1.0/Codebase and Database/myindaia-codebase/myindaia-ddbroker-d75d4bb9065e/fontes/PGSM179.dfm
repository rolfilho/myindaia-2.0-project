object datm_modalidade_trans: Tdatm_modalidade_trans
  OldCreateOrder = True
  Left = 307
  Top = 217
  Height = 191
  Width = 270
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 157
    Top = 12
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 157
    Top = 69
  end
  object qry_modalidade_trans_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TMODALIDADE_TRANS ORDER BY'
      'NM_MODALIDADE_TRANS')
    Left = 53
    Top = 12
    object qry_modalidade_trans_CD_MODALIDADE_TRANS: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_MODALIDADE_TRANS'
      Origin = 'TMODALIDADE_TRANS.CD_MODALIDADE_TRANS'
      Size = 3
    end
    object qry_modalidade_trans_NM_MODALIDADE_TRANS: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_MODALIDADE_TRANS'
      Origin = 'TMODALIDADE_TRANS.NM_MODALIDADE_TRANS'
      Size = 30
    end
    object qry_modalidade_trans_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TMODALIDADE_TRANS.IN_ATIVO'
      Size = 1
    end
    object qry_modalidade_trans_LookAtivo: TStringField
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
  object ds_modalidade_trans: TDataSource
    DataSet = qry_modalidade_trans_
    Left = 53
    Top = 69
  end
end
