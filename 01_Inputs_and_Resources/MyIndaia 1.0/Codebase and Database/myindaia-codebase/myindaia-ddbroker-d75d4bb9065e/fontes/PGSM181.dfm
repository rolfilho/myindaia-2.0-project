object datm_familia_prod: Tdatm_familia_prod
  OldCreateOrder = True
  Left = 307
  Top = 217
  Height = 167
  Width = 351
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 151
    Top = 12
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 151
    Top = 69
  end
  object qry_familia_prod_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TFAMILIA_PROD ORDER BY'
      'NM_FAMILIA_PROD')
    Left = 47
    Top = 12
    object qry_familia_prod_CD_FAMILIA_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_FAMILIA_PROD'
      Origin = 'TFAMILIA_PROD.CD_FAMILIA_PROD'
      Size = 8
    end
    object qry_familia_prod_NM_FAMILIA_PROD: TStringField
      DisplayLabel = 'Fam'#237'lia'
      FieldName = 'NM_FAMILIA_PROD'
      Origin = 'TFAMILIA_PROD.NM_FAMILIA_PROD'
      Size = 40
    end
    object qry_familia_prod_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TFAMILIA_PROD.CD_EXPORTADOR'
      Size = 5
    end
    object qry_familia_prod_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TFAMILIA_PROD.IN_ATIVO'
      Size = 1
    end
    object qry_familia_prod_LookAtivo: TStringField
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
    object qry_familia_prod_LookExportador: TStringField
      DisplayLabel = 'Exportador'
      FieldKind = fkLookup
      FieldName = 'LookExportador'
      LookupDataSet = qry_empresa_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 60
      Lookup = True
    end
  end
  object ds_familia_prod: TDataSource
    DataSet = qry_familia_prod_
    Left = 47
    Top = 69
  end
  object ds_emp_estrangeira: TDataSource
    DataSet = qry_empresa_est_
    Left = 251
    Top = 69
  end
  object qry_empresa_est_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_EST'
      'ORDER BY NM_EMPRESA')
    Left = 251
    Top = 12
    object qry_empresa_est_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_est_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 60
    end
  end
end
