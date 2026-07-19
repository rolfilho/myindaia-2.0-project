object datm_pe: Tdatm_pe
  Left = 200
  Top = 104
  Height = 320
  Width = 439
  object ds_pe: TDataSource
    DataSet = qry_pe_
    Left = 40
    Top = 24
  end
  object qry_pe_: TQuery
    BeforeEdit = qry_pe_BeforeEdit
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, DT_REGISTRO_PEDIDO,  CD_EXPORTADOR'
      'FROM TPE'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG'
      'ORDER BY NR_PROCESSO')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 141
    Top = 24
    object qry_pe_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_DT_REGISTRO_PEDIDO: TDateTimeField
      FieldName = 'DT_REGISTRO_PEDIDO'
      Origin = 'TPE.DT_REGISTRO_PEDIDO'
    end
    object qry_pe_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPE.NR_PROCESSO'
      Size = 5
    end
    object qry_pe_LookNmExportador: TStringField
      FieldName = 'LookNmExportador'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 60
      Lookup = True
    end
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 141
    Top = 101
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 32
    Top = 103
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '')
    Left = 301
    Top = 93
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 136
    Top = 176
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG'
      'FROM TUNID_NEG_PRODUTO '
      'WHERE (CD_UNID_NEG+CD_PRODUTO) IN '
      '               (SELECT (CD_UNID_NEG+CD_PRODUTO) '
      '               FROM TUSUARIO_HABILITACAO '
      '               WHERE CD_USUARIO=:CD_USUARIO'
      '              AND IN_ATIVO='#39'1'#39
      '              AND CD_PRODUTO='#39'02'#39')')
    Params.Data = {010001000A43445F5553554152494F0001020030000100}
    Left = 296
    Top = 24
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
  end
end
