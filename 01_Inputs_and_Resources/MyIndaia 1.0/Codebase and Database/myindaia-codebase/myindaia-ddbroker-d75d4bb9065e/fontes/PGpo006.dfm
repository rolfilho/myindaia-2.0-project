object datm_po_estorno: Tdatm_po_estorno
  Left = 200
  Top = 104
  Height = 370
  Width = 439
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 48
    Top = 24
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Params.Data = {010001000A43445F50524F4455544F0001020030000000}
    Left = 152
    Top = 24
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Origin = 'TPRODUTO.AP_PRODUTO'
      Size = 10
    end
  end
  object qry_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_DECLARACAO_IMP'
      'FROM   TDECLARACAO_IMPORTACAO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 256
    Top = 24
    object qry_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_di_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 10
    end
  end
  object qry_ret_po_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT(A.NR_PROCESSO), A.CD_IMPORTADOR, A.IN_MONTADO'
      'FROM   TPO A, TDETALHE_MERCADORIA B'
      'WHERE  ( B.NR_PROCESSO = :NR_PROCESSO ) AND'
      '       ( A.NR_PROCESSO = B.NR_PROC_PO ) AND'
      '       ( ISNULL( A.NR_DA, '#39#39' ) = '#39#39' )')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 360
    Top = 160
    object qry_ret_po_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object qry_ret_po_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_ret_po_di_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 1
    end
    object qry_ret_po_di_LookNmImportador: TStringField
      DisplayWidth = 80
      FieldName = 'LookNmImportador'
      LookupDataSet = tbl_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Size = 80
      Lookup = True
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = tbl_empresa_nac_
    Left = 48
    Top = 96
  end
  object tbl_empresa_nac_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_NAC'
    UpdateMode = upWhereKeyOnly
    Left = 152
    Top = 96
    object tbl_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Required = True
      Size = 5
    end
    object tbl_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_nac_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object tbl_empresa_nac_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object tbl_empresa_nac_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 30
    end
    object tbl_empresa_nac_END_UF: TStringField
      FieldName = 'END_UF'
      Size = 2
    end
    object tbl_empresa_nac_END_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object tbl_empresa_nac_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Size = 1
    end
    object tbl_empresa_nac_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
    object tbl_empresa_nac_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Size = 11
    end
    object tbl_empresa_nac_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
    end
    object tbl_empresa_nac_OUTRO_DOC: TStringField
      FieldName = 'OUTRO_DOC'
    end
    object tbl_empresa_nac_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
    end
    object tbl_empresa_nac_IN_FATURAMENTO: TStringField
      FieldName = 'IN_FATURAMENTO'
      Size = 1
    end
    object tbl_empresa_nac_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object tbl_empresa_nac_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Size = 1
    end
    object tbl_empresa_nac_IN_EVENTUAL: TStringField
      FieldName = 'IN_EVENTUAL'
      Size = 1
    end
    object tbl_empresa_nac_CD_TIPO_REF: TStringField
      FieldName = 'CD_TIPO_REF'
      Size = 1
    end
    object tbl_empresa_nac_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Size = 3
    end
    object tbl_empresa_nac_IN_CLIENTE: TBooleanField
      FieldName = 'IN_CLIENTE'
      Required = True
    end
    object tbl_empresa_nac_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
      Required = True
    end
    object tbl_empresa_nac_IN_EXPORTADOR: TBooleanField
      FieldName = 'IN_EXPORTADOR'
      Required = True
    end
    object tbl_empresa_nac_IN_OUTROS: TBooleanField
      FieldName = 'IN_OUTROS'
      Required = True
    end
    object tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField
      FieldName = 'NR_AG_BANCO_IMPOSTOS'
      Size = 5
    end
    object tbl_empresa_nac_CD_SDA: TStringField
      FieldName = 'CD_SDA'
      Size = 4
    end
    object tbl_empresa_nac_NR_CAE: TStringField
      FieldName = 'NR_CAE'
      Size = 10
    end
    object tbl_empresa_nac_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object tbl_empresa_nac_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
  end
  object qry_ret_po_li_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT(A.NR_PROCESSO), A.CD_IMPORTADOR, A.IN_MONTADO'
      'FROM   TPO A, TLICENCA_ITENS B'
      'WHERE ( B.NR_PROCESSO LIKE ( :NR_PROCESSO ) + '#39'%'#39' ) AND'
      '      ( A.NR_PROCESSO = B.NR_PROC_PO ) AND'
      '      ( ISNULL( A.NR_DA, '#39#39' ) = '#39#39' )')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 360
    Top = 96
    object qry_ret_po_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object qry_ret_po_li_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_ret_po_li_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 1
    end
    object qry_ret_po_li_LookNmImportador: TStringField
      DisplayWidth = 80
      FieldName = 'LookNmImportador'
      LookupDataSet = tbl_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Size = 80
      Lookup = True
    end
  end
  object qry_li_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_REGISTRO_LI'
      'FROM TLICENCA_IMPORTACAO'
      'WHERE NR_PROCESSO LIKE (:NR_PROCESSO)+'#39'%'#39)
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 360
    Top = 24
    object qry_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_li_NR_REGISTRO_LI: TStringField
      FieldName = 'NR_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 10
    end
  end
  object ds_ret_po_li: TDataSource
    DataSet = qry_ret_po_li_
    Left = 256
    Top = 96
  end
  object ds_ret_po_di: TDataSource
    DataSet = qry_ret_po_di_
    Left = 256
    Top = 160
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '')
    Left = 48
    Top = 256
  end
  object qry_verif_marc_li_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT(A.NR_PROCESSO), A.CD_IMPORTADOR, A.IN_MONTADO,'
      '               B.NR_PROC_PO'
      'FROM TPO A, TLICENCA_ITENS B'
      'WHERE (B.NR_PROCESSO = :NR_PROCESSO) AND'
      '              (A.NR_PROCESSO = B.NR_PROC_PO) AND'
      '              (A.IN_MONTADO = '#39'1'#39')')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 152
    Top = 160
    object qry_verif_marc_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object qry_verif_marc_li_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_verif_marc_li_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPO.IN_MONTADO'
      Size = 1
    end
    object qry_verif_marc_li_NR_PROC_PO: TStringField
      FieldName = 'NR_PROC_PO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_verif_marc_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT(A.NR_PROCESSO), A.CD_IMPORTADOR, A.IN_MONTADO,'
      '                                (B.NR_PROC_PO)'
      'FROM TPO A, TDETALHE_MERCADORIA B'
      'WHERE (B.NR_PROCESSO = :NR_PROCESSO) AND'
      '              (A.NR_PROCESSO = B.NR_PROC_PO) AND'
      '              (A.IN_MONTADO = '#39'1'#39')')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 48
    Top = 160
    object qry_verif_marc_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object qry_verif_marc_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_verif_marc_di_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPO.IN_MONTADO'
      Size = 1
    end
    object qry_verif_marc_di_NR_PROC_PO: TStringField
      FieldName = 'NR_PROC_PO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
  end
end
