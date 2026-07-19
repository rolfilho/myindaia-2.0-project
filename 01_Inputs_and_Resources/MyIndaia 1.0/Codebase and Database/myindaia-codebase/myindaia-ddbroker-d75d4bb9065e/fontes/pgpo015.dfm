object datm_po_prepara: Tdatm_po_prepara
  Left = 200
  Top = 104
  Height = 592
  Width = 756
  object qry_ret_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO_HABILITACAO'
      'WHERE CD_USUARIO= :CD_USUARIO AND  '
      '               IN_ATIVO = 1 AND '
      '               IN_DEFAULT = 1')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 40
    Top = 112
    object qry_ret_unid_neg_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 4
    end
    object qry_ret_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_ret_unid_neg_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_ret_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO_HABILITACAO.IN_ATIVO'
      Size = 1
    end
    object qry_ret_unid_neg_IN_DEFAULT: TStringField
      FieldName = 'IN_DEFAULT'
      Origin = 'TUSUARIO_HABILITACAO.IN_DEFAULT'
      Size = 1
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 40
    Top = 48
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  NR_PROCESSO , CD_CLIENTE , CD_UNID_NEG'
      'FROM TPROCESSO P, TEMBARCACAO E, TEMPRESA_NAC N'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       P.IN_CANCELADO = '#39'0'#39' AND'
      '       P.IN_LIBERADO = '#39'1'#39' AND'
      '       P.IN_PRODUCAO = '#39'1'#39' AND'
      '       P.CD_EMBARCACAO *= E.CD_EMBARCACAO AND'
      '       P.CD_CLIENTE *= N.CD_EMPRESA')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 136
    Top = 48
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
  end
  object qry_po_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_IMPORTADOR, CD_VIA_TRANSP, '
      '               DT_ABERTURA, IN_SELECIONADO, QT_TOTAL_ITENS'
      'FROM TPO')
    Left = 136
    Top = 176
    object qry_po_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object qry_po_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_po_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TPO.CD_FABRICANTE'
      Size = 2
    end
    object qry_po_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPO.NR_PROCESSO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_po_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Size = 1
    end
    object qry_po_QT_TOTAL_ITENS: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPO.NR_PROCESSO'
      Size = 3
    end
    object qry_po_LookNmCliente: TStringField
      FieldName = 'LookNmCliente'
      LookupDataSet = tbl_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_po_LookNmViaTransp: TStringField
      FieldName = 'LookNmViaTransp'
      LookupDataSet = qry_via_transporte_
      LookupKeyFields = 'CD_VIA_TRANSPORTE'
      LookupResultField = 'NM_VIA_TRANSPORTE'
      KeyFields = 'CD_VIA_TRANSP'
      Size = 120
      Lookup = True
    end
  end
  object ds_po: TDataSource
    DataSet = qry_po_
    Left = 40
    Top = 176
  end
  object ds_via_transporte: TDataSource
    DataSet = qry_via_transporte_
    Left = 31
    Top = 237
  end
  object qry_via_transporte_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM  TVIA_TRANSPORTE'
      'ORDER BY NM_VIA_TRANSPORTE    ')
    Left = 135
    Top = 237
    object qry_via_transporte_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_via_transporte_NM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      Origin = 'TVIA_TRANSPORTE.NM_VIA_TRANSPORTE'
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = tbl_empresa_nac_
    Left = 302
    Top = 192
  end
  object tbl_empresa_nac_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_NAC'
    UpdateMode = upWhereKeyOnly
    Left = 402
    Top = 192
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
    object tbl_empresa_nac_CD_BANCO_IMPOSTOS: TStringField
      FieldName = 'CD_BANCO_IMPOSTOS'
      Size = 3
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
      Size = 6
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
  object ds_po_itens: TDataSource
    DataSet = qry_po_itens_
    Left = 40
    Top = 304
  end
  object qry_po_itens_: TQuery
    OnCalcFields = qry_po_itens_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_po
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ITEM, CD_MERCADORIA, CD_NCM_SH, IN_NECESS' +
        'ITA_LI,'
      
        '               QT_INICIAL, QT_BAIXADA_LI, QT_BAIXADA_DI, IN_SELE' +
        'CIONADO, VL_UNITARIO,'
      '               QT_BAIXAR, QT_DISPONIVEL'
      'FROM TPO_ITEM'
      'WHERE (NR_PROCESSO = :NR_PROCESSO)  AND (IN_MONTADO <> '#39'1'#39')'
      'ORDER BY NR_ITEM')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 136
    Top = 304
    object qry_po_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_po_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPO_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_po_itens_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPO_ITEM.CD_MERCADORIA'
      Size = 15
    end
    object qry_po_itens_CD_NCM_SH: TStringField
      DisplayLabel = '9999.99.99-9999;0;_'
      FieldName = 'CD_NCM_SH'
      Origin = 'TPO_ITEM.CD_NCM_SH'
      EditMask = '9999.99.99-9999;0;_'
      Size = 11
    end
    object qry_po_itens_IN_NECESSITA_LI: TBooleanField
      FieldName = 'IN_NECESSITA_LI'
      Origin = 'TPO_ITEM.IN_NECESSITA_LI'
    end
    object qry_po_itens_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPO_ITEM.IN_SELECIONADO'
      Size = 1
    end
    object qry_po_itens_QT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
      Origin = 'TPO_ITEM.QT_INICIAL'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qry_po_itens_QT_BAIXADA_LI: TFloatField
      FieldName = 'QT_BAIXADA_LI'
      Origin = 'TPO_ITEM.QT_BAIXADA_LI'
    end
    object qry_po_itens_QT_BAIXADA_DI: TFloatField
      FieldName = 'QT_BAIXADA_DI'
      Origin = 'TPO_ITEM.QT_BAIXADA_DI'
    end
    object qry_po_itens_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TPO_ITEM.VL_UNITARIO'
    end
    object qry_po_itens_QT_BAIXAR: TFloatField
      FieldName = 'QT_BAIXAR'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      EditFormat = '#0.000'
    end
    object qry_po_itens_QT_DISPONIVEL: TFloatField
      FieldName = 'QT_DISPONIVEL'
      Origin = 'TPO_ITEM.NR_PROCESSO'
    end
    object qry_po_itens_CalcQtBaixada: TFloatField
      FieldName = 'CalcQtBaixada'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
      Calculated = True
    end
    object qry_po_itens_CalcQTDisp: TFloatField
      FieldName = 'CalcQTDisp'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
      Calculated = True
    end
  end
  object sp_po_marca_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_marca_item'
    Params.Data = {
      0100030006526573756C74040304000000000000000C406E725F70726F636573
      736F01010200300000000F40696E5F73656C6563696F6E61646F010102003000
      0000}
    Left = 656
    Top = 16
  end
  object qry_prep_po_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPREPARA_PO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 408
    Top = 264
    object qry_prep_po_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREPARA_PO.NR_PROCESSO'
      Size = 18
    end
    object qry_prep_po_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPREPARA_PO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_prep_po_CD_PAIS_TRANSBORDO: TStringField
      FieldName = 'CD_PAIS_TRANSBORDO'
      Origin = 'TPREPARA_PO.CD_PAIS_TRANSBORDO'
      Size = 3
    end
    object qry_prep_po_CD_PAGTO_CAMBIO: TStringField
      FieldName = 'CD_PAGTO_CAMBIO'
      Origin = 'TPREPARA_PO.CD_PAGTO_CAMBIO'
      Size = 4
    end
    object qry_prep_po_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TPREPARA_PO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_prep_po_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPREPARA_PO.CD_EXPORTADOR'
      Size = 5
    end
    object qry_prep_po_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPREPARA_PO.CD_FABRICANTE'
      Size = 5
    end
    object qry_prep_po_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TPREPARA_PO.CD_PAIS_PROCEDENCIA'
      Size = 3
    end
    object qry_prep_po_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TPREPARA_PO.CD_VIA_TRANSP'
      Size = 2
    end
    object qry_prep_po_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TPREPARA_PO.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_prep_po_CD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'TPREPARA_PO.CD_URF_ENTRADA'
      Size = 7
    end
    object qry_prep_po_DT_REC_FAX_DOCS: TDateTimeField
      FieldName = 'DT_REC_FAX_DOCS'
      Origin = 'TPREPARA_PO.DT_REC_FAX_DOCS'
    end
    object qry_prep_po_DT_REC_DOCS: TDateTimeField
      FieldName = 'DT_REC_DOCS'
      Origin = 'TPREPARA_PO.DT_REC_DOCS'
    end
    object qry_prep_po_DT_PREV_CHEGADA_FABR: TDateTimeField
      FieldName = 'DT_PREV_CHEGADA_FABR'
      Origin = 'TPREPARA_PO.DT_PREV_CHEGADA_FABR'
    end
    object qry_prep_po_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Origin = 'TPREPARA_PO.DT_EMBARQUE'
    end
    object qry_prep_po_DT_TRANSBORDO: TDateTimeField
      FieldName = 'DT_TRANSBORDO'
      Origin = 'TPREPARA_PO.DT_TRANSBORDO'
    end
    object qry_prep_po_DT_CONH_EMBARQUE: TDateTimeField
      FieldName = 'DT_CONH_EMBARQUE'
      Origin = 'TPREPARA_PO.DT_CONH_EMBARQUE'
    end
    object qry_prep_po_NR_CONH_EMBARQUE: TStringField
      FieldName = 'NR_CONH_EMBARQUE'
      Origin = 'TPREPARA_PO.NR_CONH_EMBARQUE'
      Size = 18
    end
    object qry_prep_po_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TPREPARA_PO.NR_MANIFESTO'
      Size = 15
    end
    object qry_prep_po_NR_CONH_TRANSBORDO: TStringField
      FieldName = 'NR_CONH_TRANSBORDO'
      Origin = 'TPREPARA_PO.NR_CONH_TRANSBORDO'
      Size = 15
    end
    object qry_prep_po_NM_IDENT_TRANSBORDO: TStringField
      FieldName = 'NM_IDENT_TRANSBORDO'
      Origin = 'TPREPARA_PO.NM_IDENT_TRANSBORDO'
      Size = 30
    end
    object qry_prep_po_QT_BAIXADA: TFloatField
      FieldName = 'QT_BAIXADA'
      Origin = 'TPREPARA_PO.QT_BAIXADA'
    end
    object qry_prep_po_TP_EMBARQUE: TStringField
      FieldName = 'TP_EMBARQUE'
      Origin = 'TPREPARA_PO.TP_EMBARQUE'
      Size = 1
    end
    object qry_prep_po_TP_CALC_RAT_DESPESA: TStringField
      FieldName = 'TP_CALC_RAT_DESPESA'
      Origin = 'TPREPARA_PO.TP_CALC_RAT_DESPESA'
      Size = 1
    end
    object qry_prep_po_VL_TOT_BAIXADO: TFloatField
      FieldName = 'VL_TOT_BAIXADO'
      Origin = 'TPREPARA_PO.VL_TOT_BAIXADO'
    end
    object qry_prep_po_VL_TOT_FRETE: TFloatField
      FieldName = 'VL_TOT_FRETE'
      Origin = 'TPREPARA_PO.VL_TOT_FRETE'
    end
    object qry_prep_po_VL_TOT_SEGURO: TFloatField
      FieldName = 'VL_TOT_SEGURO'
      Origin = 'TPREPARA_PO.VL_TOT_SEGURO'
    end
    object qry_prep_po_IN_PREPARACAO: TStringField
      FieldName = 'IN_PREPARACAO'
      Origin = 'TPREPARA_PO.IN_PREPARACAO'
      Size = 1
    end
    object qry_prep_po_QT_TOTAL_ITEM: TStringField
      FieldName = 'QT_TOTAL_ITEM'
      Origin = 'TPREPARA_PO.QT_TOTAL_ITEM'
      Size = 3
    end
    object qry_prep_po_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TPREPARA_PO.CD_PAIS_AQUISICAO'
      Size = 3
    end
    object qry_prep_po_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPREPARA_PO.CD_PAIS_ORIGEM'
      Size = 3
    end
  end
  object ds_prep_po: TDataSource
    DataSet = qry_prep_po_
    Left = 296
    Top = 264
  end
  object qry_prep_item_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPREPARA_PO_ITEM'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 408
    Top = 320
    object qry_prep_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREPARA_PO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_prep_item_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPREPARA_PO_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_prep_item_NR_PROC_OLD: TStringField
      FieldName = 'NR_PROC_OLD'
      Origin = 'TPREPARA_PO_ITEM.NR_PROC_OLD'
      Size = 18
    end
    object qry_prep_item_NR_ITEM_OLD: TStringField
      FieldName = 'NR_ITEM_OLD'
      Origin = 'TPREPARA_PO_ITEM.NR_ITEM_OLD'
      Size = 3
    end
    object qry_prep_item_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPREPARA_PO_ITEM.CD_MERCADORIA'
      Size = 15
    end
    object qry_prep_item_DT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
      Origin = 'TPREPARA_PO_ITEM.DT_BAIXA'
    end
    object qry_prep_item_QT_BAIXADA: TFloatField
      FieldName = 'QT_BAIXADA'
      Origin = 'TPREPARA_PO_ITEM.QT_BAIXADA'
    end
    object qry_prep_item_NR_SEGURO_DEFINITIVO: TStringField
      FieldName = 'NR_SEGURO_DEFINITIVO'
      Origin = 'TPREPARA_PO_ITEM.NR_SEGURO_DEFINITIVO'
      Size = 12
    end
    object qry_prep_item_VL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
      Origin = 'TPREPARA_PO_ITEM.VL_DESPESA'
    end
    object qry_prep_item_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TPREPARA_PO_ITEM.VL_DESCONTO'
    end
    object qry_prep_item_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPREPARA_PO_ITEM.VL_SEGURO'
    end
    object qry_prep_item_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'TPREPARA_PO_ITEM.VL_ACRESCIMO'
    end
    object qry_prep_item_VL_DEDUCAO: TFloatField
      FieldName = 'VL_DEDUCAO'
      Origin = 'TPREPARA_PO_ITEM.VL_DEDUCAO'
    end
    object qry_prep_item_VL_FRETE_NACIONAL: TFloatField
      FieldName = 'VL_FRETE_NACIONAL'
      Origin = 'TPREPARA_PO_ITEM.VL_FRETE_NACIONAL'
    end
    object qry_prep_item_VL_FRETE_PREPAID: TFloatField
      FieldName = 'VL_FRETE_PREPAID'
      Origin = 'TPREPARA_PO_ITEM.VL_FRETE_PREPAID'
    end
    object qry_prep_item_VL_FRETE_COLLECT: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'TPREPARA_PO_ITEM.VL_FRETE_COLLECT'
    end
    object qry_prep_item_VL_BAIXADO: TFloatField
      FieldName = 'VL_BAIXADO'
      Origin = 'TPREPARA_PO_ITEM.VL_BAIXADO'
    end
    object qry_prep_item_VL_BAIXADO_RATEIO: TFloatField
      FieldName = 'VL_BAIXADO_RATEIO'
      Origin = 'TPREPARA_PO_ITEM.VL_BAIXADO_RATEIO'
    end
    object qry_prep_item_IN_PREPARACAO: TStringField
      FieldName = 'IN_PREPARACAO'
      Origin = 'TPREPARA_PO_ITEM.IN_PREPARACAO'
      Size = 1
    end
  end
  object ds_prep_item: TDataSource
    DataSet = qry_prep_item_
    Left = 296
    Top = 320
  end
  object ds_prep_nve: TDataSource
    DataSet = qry_prep_nve_
    Left = 296
    Top = 384
  end
  object qry_prep_nve_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_prep_item
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPREPARA_PO_ITEM'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '               NR_ITEM = :NR_ITEM')
    Params.Data = {
      010002000B4E525F50524F434553534F0001020030000000074E525F4954454D
      0001020030000000}
    Left = 408
    Top = 384
    object qry_prep_nve_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREPARA_PO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_prep_nve_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPREPARA_PO_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_prep_nve_NR_PROC_OLD: TStringField
      FieldName = 'NR_PROC_OLD'
      Origin = 'TPREPARA_PO_ITEM.NR_PROC_OLD'
      Size = 18
    end
    object qry_prep_nve_NR_ITEM_OLD: TStringField
      FieldName = 'NR_ITEM_OLD'
      Origin = 'TPREPARA_PO_ITEM.NR_ITEM_OLD'
      Size = 3
    end
    object qry_prep_nve_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPREPARA_PO_ITEM.CD_MERCADORIA'
      Size = 15
    end
    object qry_prep_nve_DT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
      Origin = 'TPREPARA_PO_ITEM.DT_BAIXA'
    end
    object qry_prep_nve_QT_BAIXADA: TFloatField
      FieldName = 'QT_BAIXADA'
      Origin = 'TPREPARA_PO_ITEM.QT_BAIXADA'
    end
    object qry_prep_nve_NR_SEGURO_DEFINITIVO: TStringField
      FieldName = 'NR_SEGURO_DEFINITIVO'
      Origin = 'TPREPARA_PO_ITEM.NR_SEGURO_DEFINITIVO'
      Size = 12
    end
    object qry_prep_nve_VL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
      Origin = 'TPREPARA_PO_ITEM.VL_DESPESA'
    end
    object qry_prep_nve_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TPREPARA_PO_ITEM.VL_DESCONTO'
    end
    object qry_prep_nve_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPREPARA_PO_ITEM.VL_SEGURO'
    end
    object qry_prep_nve_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'TPREPARA_PO_ITEM.VL_ACRESCIMO'
    end
    object qry_prep_nve_VL_DEDUCAO: TFloatField
      FieldName = 'VL_DEDUCAO'
      Origin = 'TPREPARA_PO_ITEM.VL_DEDUCAO'
    end
    object qry_prep_nve_VL_FRETE_NACIONAL: TFloatField
      FieldName = 'VL_FRETE_NACIONAL'
      Origin = 'TPREPARA_PO_ITEM.VL_FRETE_NACIONAL'
    end
    object qry_prep_nve_VL_FRETE_PREPAID: TFloatField
      FieldName = 'VL_FRETE_PREPAID'
      Origin = 'TPREPARA_PO_ITEM.VL_FRETE_PREPAID'
    end
    object qry_prep_nve_VL_FRETE_COLLECT: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'TPREPARA_PO_ITEM.VL_FRETE_COLLECT'
    end
    object qry_prep_nve_VL_BAIXADO: TFloatField
      FieldName = 'VL_BAIXADO'
      Origin = 'TPREPARA_PO_ITEM.VL_BAIXADO'
    end
    object qry_prep_nve_VL_BAIXADO_RATEIO: TFloatField
      FieldName = 'VL_BAIXADO_RATEIO'
      Origin = 'TPREPARA_PO_ITEM.VL_BAIXADO_RATEIO'
    end
    object qry_prep_nve_IN_PREPARACAO: TStringField
      FieldName = 'IN_PREPARACAO'
      Origin = 'TPREPARA_PO_ITEM.IN_PREPARACAO'
      Size = 1
    end
  end
  object qry_po_selec_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, IN_SELECIONADO'
      'FROM TPO'
      'WHERE IN_SELECIONADO = '#39'1'#39
      '')
    Left = 296
    Top = 448
    object qry_po_selec_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object qry_po_selec_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPO.IN_SELECIONADO'
      Size = 1
    end
  end
  object sp_po_proc_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_proc_item'
    Params.Data = {
      0100040006526573756C74040304000000000000010C406E725F70726F636573
      736F01010200300000000C406E725F70726F635F6F6C6401010200300000000C
      406E725F6974656D5F6F6C640101020030000000}
    Left = 664
    Top = 88
  end
  object sp_po_prep_inc_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_prep_inc_item'
    Params.Data = {
      0100080006526573756C74040304000000000000000C406E725F70726F636573
      736F010102003000000008406E725F6974656D01010200300000000C406E725F
      70726F635F6F6C6401010200300000000C406E725F6974656D5F6F6C64010102
      0030000000094064745F6261697861010B080000002C845D40CB4200000A4071
      745F626169786172010608000000000000000000000005407469706F01010200
      30000000}
    Left = 664
    Top = 200
  end
  object sp_po_prep_inc_proc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_prep_inc_proc'
    Params.Data = {
      0100030006526573756C74040304000000000000000C406E725F70726F636573
      736F01010200300000000C406E725F70726F635F6F6C640101020030000000}
    Left = 664
    Top = 144
  end
  object qry_po_valor_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, QT_TOTAL_ITEM'
      'FROM TPREPARA_PO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 136
    Top = 448
    object qry_po_valor_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREPARA_PO.NR_PROCESSO'
      Size = 18
    end
    object qry_po_valor_QT_TOTAL_ITEM: TStringField
      FieldName = 'QT_TOTAL_ITEM'
      Origin = 'TPREPARA_PO.QT_TOTAL_ITEM'
      Size = 3
    end
  end
  object ds_po_valor: TDataSource
    DataSet = qry_po_valor_
    Left = 56
    Top = 448
  end
  object qry_po_nve_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_po_itens
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPO_NVE'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '               NR_ITEM = :NR_ITEM')
    Params.Data = {
      010002000B4E525F50524F434553534F0001020030000100074E525F4954454D
      0001020030000100}
    Left = 136
    Top = 368
    object qry_po_nve_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO_NVE.NR_PROCESSO'
      Size = 18
    end
    object qry_po_nve_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPO_NVE.NR_ITEM'
      Size = 3
    end
    object qry_po_nve_CD_NIVEL_NVE: TStringField
      FieldName = 'CD_NIVEL_NVE'
      Origin = 'TPO_NVE.CD_NIVEL_NVE'
      Size = 3
    end
    object qry_po_nve_CD_ATRIBUTO_NCM: TStringField
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TPO_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_po_nve_CD_ESPECIF_NCM: TStringField
      FieldName = 'CD_ESPECIF_NCM'
      Origin = 'TPO_NVE.CD_ESPECIF_NCM'
      Size = 4
    end
  end
  object ds_po_nve: TDataSource
    DataSet = qry_po_nve_
    Left = 40
    Top = 368
  end
  object sp_po_prep_inc_nve: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_prep_inc_nve'
    Params.Data = {
      0100030006526573756C74040304000000000000000C406E725F70726F636573
      736F010102003000000008406E725F6974656D0101020030000000}
    Left = 664
    Top = 264
  end
  object qry_verif_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_PROC_OLD, NR_ITEM_OLD, '
      '              QT_BAIXADA, DT_BAIXA'
      'FROM TPREPARA_PO_ITEM'
      'WHERE (NR_PROC_OLD = :NR_PROCESSO) AND'
      '               (NR_ITEM_OLD = :NR_ITEM)'
      '          ')
    Params.Data = {
      010002000B4E525F50524F434553534F0001020030000100074E525F4954454D
      0001020030000000}
    Left = 408
    Top = 448
    object qry_verif_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREPARA_PO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_verif_item_NR_PROC_OLD: TStringField
      FieldName = 'NR_PROC_OLD'
      Origin = 'TPREPARA_PO_ITEM.NR_PROC_OLD'
      Size = 18
    end
    object qry_verif_item_NR_ITEM_OLD: TStringField
      FieldName = 'NR_ITEM_OLD'
      Origin = 'TPREPARA_PO_ITEM.NR_ITEM_OLD'
      Size = 3
    end
    object qry_verif_item_QT_BAIXADA: TFloatField
      FieldName = 'QT_BAIXADA'
      Origin = 'TPREPARA_PO_ITEM.NR_PROC_OLD'
    end
    object qry_verif_item_DT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
      Origin = 'TPREPARA_PO_ITEM.NR_ITEM_OLD'
    end
  end
  object sp_po_desmarca: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_desmarca'
    Params.Data = {0100010006526573756C7404030400000000000000}
    Left = 664
    Top = 336
  end
  object sp_po_exclui_prep: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_exclui_prep'
    Params.Data = {
      0100020006526573756C74040304000000000000000C406E725F70726F636573
      736F0101020030000000}
    Left = 664
    Top = 408
  end
  object qry_muda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      '')
    Left = 512
    Top = 136
  end
  object sp_po_monta_di: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_monta_di'
    Left = 400
    Top = 48
  end
  object sp_po_monta_li: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_monta_li'
    Left = 504
    Top = 48
  end
end
