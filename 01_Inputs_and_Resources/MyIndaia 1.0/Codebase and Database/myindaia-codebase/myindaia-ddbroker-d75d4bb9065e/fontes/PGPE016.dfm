object datm_pe_consulta_prod: Tdatm_pe_consulta_prod
  OldCreateOrder = True
  Left = 223
  Top = 175
  Height = 191
  Width = 434
  object qry_pe_itens1_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.NR_PROCESSO, P.CD_EXPORTADOR, I.QT_MERCADORIA, I.NR_ITE' +
        'M, I.CD_NCM'
      'FROM TPE_ITEM I,'
      '     TPE P'
      'WHERE (I.CD_MERCADORIA = :CD_MERCADORIA) AND'
      '               (P.NR_PROCESSO   = I.NR_PROCESSO)')
    Left = 312
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_pe_itens1_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_itens1_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPE.CD_EXPORTADOR'
      Size = 5
    end
    object qry_pe_itens1_QT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'TPE_ITEM.QT_MERCADORIA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens1_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPE_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_pe_itens1_CD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'TPE_ITEM.CD_NCM'
      Size = 11
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Left = 119
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
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
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 39
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
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
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Left = 32
    Top = 100
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
    object qry_cliente_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 50
    end
    object qry_cliente_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 6
    end
    object qry_cliente_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 30
    end
    object qry_cliente_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Origin = 'TEMPRESA_NAC.END_EMPRESA'
      Size = 30
    end
    object qry_cliente_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'TEMPRESA_NAC.END_NUMERO'
      Size = 2
    end
    object qry_cliente_END_CEP: TStringField
      FieldName = 'END_CEP'
      Origin = 'TEMPRESA_NAC.END_CIDADE'
      Size = 8
    end
    object qry_cliente_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Origin = 'TEMPRESA_NAC.END_BAIRRO'
      Size = 1
    end
    object qry_cliente_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TEMPRESA_NAC.END_UF'
      Size = 14
    end
    object qry_cliente_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Origin = 'TEMPRESA_NAC.END_CEP'
      Size = 11
    end
    object qry_cliente_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_TIPO_PESSOA'
    end
    object qry_cliente_OUTRO_DOC: TStringField
      FieldName = 'OUTRO_DOC'
      Origin = 'TEMPRESA_NAC.CGC_EMPRESA'
    end
    object qry_cliente_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'TEMPRESA_NAC.CPF_EMPRESA'
    end
    object qry_cliente_IN_FATURAMENTO: TStringField
      FieldName = 'IN_FATURAMENTO'
      Origin = 'TEMPRESA_NAC.IE_EMPRESA'
      Size = 1
    end
    object qry_cliente_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TEMPRESA_NAC.OUTRO_DOC'
      Size = 1
    end
    object qry_cliente_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Origin = 'TEMPRESA_NAC.DT_INCLUSAO'
      Size = 1
    end
    object qry_cliente_IN_EVENTUAL: TStringField
      FieldName = 'IN_EVENTUAL'
      Origin = 'TEMPRESA_NAC.IN_FATURAMENTO'
      Size = 1
    end
    object qry_cliente_CD_TIPO_REF: TStringField
      FieldName = 'CD_TIPO_REF'
      Origin = 'TEMPRESA_NAC.IN_ATIVO'
      Size = 1
    end
    object qry_cliente_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Origin = 'TEMPRESA_NAC.IN_RESTRICAO'
      Size = 3
    end
    object qry_cliente_IN_CLIENTE: TBooleanField
      FieldName = 'IN_CLIENTE'
      Origin = 'TEMPRESA_NAC.IN_EVENTUAL'
    end
    object qry_cliente_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
      Origin = 'TEMPRESA_NAC.CD_TIPO_REF'
    end
    object qry_cliente_IN_EXPORTADOR: TBooleanField
      FieldName = 'IN_EXPORTADOR'
      Origin = 'TEMPRESA_NAC.CD_TAB_SDA'
    end
    object qry_cliente_IN_OUTROS: TBooleanField
      FieldName = 'IN_OUTROS'
      Origin = 'TEMPRESA_NAC.IN_CLIENTE'
    end
    object qry_cliente_NR_AG_BANCO_IMPOSTOS: TStringField
      FieldName = 'NR_AG_BANCO_IMPOSTOS'
      Origin = 'TEMPRESA_NAC.IN_EXPORTADOR'
      Size = 5
    end
    object qry_cliente_CD_SDA: TStringField
      FieldName = 'CD_SDA'
      Origin = 'TEMPRESA_NAC.IN_OUTROS'
      Size = 4
    end
    object qry_cliente_NR_CAE: TStringField
      FieldName = 'NR_CAE'
      Origin = 'TEMPRESA_NAC.CD_BANCO_IMPOSTOS'
      Size = 10
    end
    object qry_cliente_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TEMPRESA_NAC.NR_AG_BANCO_IMPOSTOS'
      Size = 3
    end
    object qry_cliente_IN_REPRESENTANTE: TBooleanField
      FieldName = 'IN_REPRESENTANTE'
      Origin = 'TEMPRESA_NAC.CD_SDA'
    end
    object qry_cliente_NM_INDICADO_POR: TStringField
      FieldName = 'NM_INDICADO_POR'
      Origin = 'TEMPRESA_NAC.NR_CAE'
      Size = 50
    end
    object qry_cliente_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TEMPRESA_NAC.CD_GRUPO'
      Size = 10
    end
    object qry_cliente_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      Origin = 'TEMPRESA_NAC.IN_REPRESENTANTE'
      BlobType = ftMemo
    end
    object qry_cliente_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Origin = 'TEMPRESA_NAC.NM_INDICADO_POR'
      Size = 3
    end
    object qry_cliente_CD_ATIV_ECONOMICA: TStringField
      FieldName = 'CD_ATIV_ECONOMICA'
      Origin = 'TEMPRESA_NAC.CD_CT_CONTABIL'
      Size = 4
    end
    object qry_cliente_IN_SEGURADORA: TBooleanField
      FieldName = 'IN_SEGURADORA'
      Origin = 'TEMPRESA_NAC.TX_OBS'
    end
    object qry_cliente_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TEMPRESA_NAC.CD_PAIS_IMPORTADOR'
      Size = 1
    end
    object qry_cliente_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TEMPRESA_NAC.CD_ATIV_ECONOMICA'
      Size = 3
    end
  end
  object ds_pe_itens1: TDataSource
    DataSet = qry_pe_itens1_
    Left = 225
    Top = 24
  end
  object qry_pe_itens2_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.NR_PROCESSO, P.CD_EXPORTADOR, I.QT_MERCADORIA, I.NR_ITE' +
        'M, I.CD_NCM'
      'FROM TPE_ITEM I,'
      '     TPE P'
      'WHERE (I.CD_MERCADORIA = :CD_MERCADORIA) AND'
      '               (P.CD_EXPORTADOR = :CD_EXPORTADOR) AND'
      '               (P.NR_PROCESSO   = I.NR_PROCESSO)')
    Left = 312
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EXPORTADOR'
        ParamType = ptUnknown
      end>
    object qry_pe_itens2_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_itens2_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPE.CD_EXPORTADOR'
      Size = 5
    end
    object qry_pe_itens2_QT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'TPE_ITEM.QT_MERCADORIA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens2_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPE_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_pe_itens2_CD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'TPE_ITEM.CD_NCM'
      Size = 11
    end
  end
  object ds_pe_itens2: TDataSource
    DataSet = qry_pe_itens2_
    Left = 225
    Top = 88
  end
end
