object datm_finalidade_merc: Tdatm_finalidade_merc
  OldCreateOrder = True
  Left = 307
  Top = 217
  Height = 191
  Width = 257
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 159
    Top = 12
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 159
    Top = 69
  end
  object qry_finalidade_merc_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TFINALIDADE_MERC ORDER BY'
      'NM_FINALIDADE_MERC')
    Left = 55
    Top = 12
    object qry_finalidade_merc_CD_FINALIDADE_MERC: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_FINALIDADE_MERC'
      Origin = 'TFINALIDADE_MERC.CD_FINALIDADE_MERC'
      Size = 3
    end
    object qry_finalidade_merc_NM_FINALIDADE_MERC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_FINALIDADE_MERC'
      Origin = 'TFINALIDADE_MERC.NM_FINALIDADE_MERC'
      Size = 30
    end
    object qry_finalidade_merc_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TFINALIDADE_MERC.IN_ATIVO'
      Size = 1
    end
    object qry_finalidade_merc_LookAtivo: TStringField
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
    object qry_finalidade_merc_LEAD_TIME: TIntegerField
      FieldName = 'LEAD_TIME'
    end
  end
  object ds_finalidade_merc: TDataSource
    DataSet = qry_finalidade_merc_
    Left = 55
    Top = 69
  end
end
