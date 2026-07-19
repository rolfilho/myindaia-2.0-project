object datm_cliente_co: Tdatm_cliente_co
  Left = 200
  Top = 104
  Height = 288
  Width = 233
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 35
    Top = 16
  end
  object qry_empresa_nac_: TQuery
    OnCalcFields = qry_empresa_nac_CalcFields
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      
        'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, END_EMPRESA, END_NUME' +
        'RO, END_BAIRRO, END_CIDADE, END_UF, END_CEP, IE_EMPRESA, CPF_EMP' +
        'RESA, CGC_EMPRESA, IN_CLIENTE, IN_IMPORTADOR, IN_EXPORTADOR, IN_' +
        'REPRESENTANTE, IN_SEGURADORA, IN_COMPRADOR, IN_OUTROS, CD_GRUPO,' +
        ' CD_TIPO_PESSOA, OUTRO_DOC, DT_INCLUSAO, IN_FATURAMENTO, IN_ATIV' +
        'O FROM TEMPRESA_NAC'
      ''
      'ORDER BY CD_EMPRESA')
    Left = 140
    Top = 16
    object qry_empresa_nac_CD_EMPRESA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_nac_NM_EMPRESA: TStringField
      DisplayLabel = 'Razão Social'
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_empresa_nac_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TEMPRESA_NAC.END_CEP'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_empresa_nac_LookCliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'LookCliente'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CLIENTE'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_LookImportador: TStringField
      DisplayLabel = 'Importador'
      FieldName = 'LookImportador'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_IMPORTADOR'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_LookExportador: TStringField
      DisplayLabel = 'Exportador'
      FieldName = 'LookExportador'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_EXPORTADOR'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_LookRepresentante: TStringField
      DisplayLabel = 'Representante'
      FieldName = 'LookRepresentante'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_REPRESENTANTE'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_LookOutros: TStringField
      DisplayLabel = 'Outros'
      FieldName = 'LookOutros'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_OUTROS'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_LookGrupo: TStringField
      FieldName = 'LookGrupo'
      LookupDataSet = qry_grupo_
      LookupKeyFields = 'CD_GRUPO'
      LookupResultField = 'NM_GRUPO'
      KeyFields = 'CD_GRUPO'
      Size = 50
      Lookup = True
    end
    object qry_empresa_nac_LookTipoPessoa: TStringField
      FieldName = 'LookTipoPessoa'
      LookupDataSet = tbl_tipo_pessoa_
      LookupKeyFields = 'CD_TIPO_PESSOA'
      LookupResultField = 'NM_TIPO_PESSOA'
      KeyFields = 'CD_TIPO_PESSOA'
      Size = 30
      Lookup = True
    end
    object qry_empresa_nac_CalcCNPJ: TStringField
      DisplayLabel = 'C.N.P.J.'
      FieldName = 'CalcCNPJ'
      Calculated = True
    end
    object qry_empresa_nac_IN_CLIENTE: TBooleanField
      FieldName = 'IN_CLIENTE'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
    end
    object qry_empresa_nac_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
    end
    object qry_empresa_nac_IN_EXPORTADOR: TBooleanField
      FieldName = 'IN_EXPORTADOR'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
    end
    object qry_empresa_nac_IN_REPRESENTANTE: TBooleanField
      FieldName = 'IN_REPRESENTANTE'
      Origin = 'TEMPRESA_NAC.CGC_EMPRESA'
    end
    object qry_empresa_nac_IN_OUTROS: TBooleanField
      FieldName = 'IN_OUTROS'
      Origin = 'TEMPRESA_NAC.IN_CLIENTE'
    end
    object qry_empresa_nac_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TEMPRESA_NAC.IN_IMPORTADOR'
      Size = 3
    end
    object qry_empresa_nac_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Origin = 'TEMPRESA_NAC.IN_EXPORTADOR'
      Size = 1
    end
    object qry_empresa_nac_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 10
    end
    object qry_empresa_nac_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 50
    end
    object qry_empresa_nac_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 6
    end
    object qry_empresa_nac_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 30
    end
    object qry_empresa_nac_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 30
    end
    object qry_empresa_nac_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 2
    end
    object qry_empresa_nac_END_CEP: TStringField
      FieldName = 'END_CEP'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 8
    end
    object qry_empresa_nac_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 11
    end
    object qry_empresa_nac_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
    end
    object qry_empresa_nac_OUTRO_DOC: TStringField
      FieldName = 'OUTRO_DOC'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
    end
    object qry_empresa_nac_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
    end
    object qry_empresa_nac_IN_FATURAMENTO: TStringField
      FieldName = 'IN_FATURAMENTO'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 1
    end
    object qry_empresa_nac_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 1
    end
    object qry_empresa_nac_IN_SEGURADORA: TBooleanField
      FieldName = 'IN_SEGURADORA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
    end
    object qry_empresa_nac_IN_COMPRADOR: TBooleanField
      FieldName = 'IN_COMPRADOR'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 35
    Top = 72
  end
  object tbl_yesno_: TTable
    Active = True
    DatabaseName = 'DBBROKER'
    TableName = 'TYES_NO'
    Left = 140
    Top = 72
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
  object ds_grupo: TDataSource
    DataSet = qry_grupo_
    Left = 35
    Top = 128
  end
  object qry_grupo_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO'
      'FROM TGRUPO')
    Left = 140
    Top = 128
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO.NM_GRUPO'
      Size = 50
    end
  end
  object ds_tipo_pessoa: TDataSource
    DataSet = tbl_tipo_pessoa_
    Left = 35
    Top = 181
  end
  object tbl_tipo_pessoa_: TTable
    Active = True
    DatabaseName = 'DBBROKER'
    TableName = 'TTIPO_PESSOA'
    Left = 140
    Top = 181
    object tbl_tipo_pessoa_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Required = True
      Size = 1
    end
    object tbl_tipo_pessoa_NM_TIPO_PESSOA: TStringField
      FieldName = 'NM_TIPO_PESSOA'
      Size = 30
    end
  end
end
