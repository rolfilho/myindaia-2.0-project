object datm_acesso_scx: Tdatm_acesso_scx
  OldCreateOrder = True
  Left = 639
  Top = 316
  Height = 273
  Width = 342
  object ds_acesso_scx: TDataSource
    DataSet = qry_acesso_scx_
    Left = 48
    Top = 72
  end
  object qry_acesso_scx_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TACESSO_SCX_EXP ORDER BY'
      'NM_USUARIO')
    Left = 48
    Top = 16
    object qry_acesso_scx_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TACESSO_SCX_EXP.CD_ACESSO'
      Size = 10
    end
    object qry_acesso_scx_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TACESSO_SCX_EXP.NM_USUARIO'
      Size = 30
    end
    object qry_acesso_scx_CD_SENHA_SCX: TStringField
      FieldName = 'CD_SENHA_SCX'
      Origin = 'TACESSO_SCX_EXP.CD_SENHA_SCX'
      Size = 30
    end
    object qry_acesso_scx_CPF_USUARIO: TStringField
      FieldName = 'CPF_USUARIO'
      Origin = 'TACESSO_SCX_EXP.CPF_USUARIO'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object qry_acesso_scx_CNPJ_REPRES: TStringField
      FieldName = 'CNPJ_REPRES'
      Origin = 'TACESSO_SCX_EXP.CD_ACESSO'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_acesso_scx_CPF_REPRES: TStringField
      FieldName = 'CPF_REPRES'
      Origin = 'TACESSO_SCX_EXP.CPF_REPRES'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object qry_acesso_scx_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TACESSO_SCX_EXP.IN_ATIVO'
      Size = 1
    end
    object qry_acesso_scx_LookAtivo: TStringField
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
  object tbl_yesno_: TTable
    Active = True
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
end
