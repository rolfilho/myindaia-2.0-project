object datm_integra_basf: Tdatm_integra_basf
  OldCreateOrder = True
  Left = 224
  Top = 171
  Height = 232
  Width = 531
  object qry_pe_capa_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_UNID_NEG, CD_IMPORTADOR, CD_AGENTE, CD_MO' +
        'EDA, CD_VIA_TRANSPORTE, CD_INCOTERM, VL_PESO_BRUTO, VL_PESO_LIQU' +
        'IDO, VL_FRETE,'
      
        '       VL_SEGURO, CD_EXPORTADOR, CD_FABRICANTE, TP_CONSIGNATARIO' +
        ', CD_CONSIGNATARIO, QT_TOTAL_ITENS, VL_TOT_QTDE_PROD, VL_TOT_FOB' +
        ', VL_TOT_MCV, DT_REGISTRO_PEDIDO'
      'FROM  TPE (NOLOCK)'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '      NR_PROCESSO = :NR_PROCESSO')
    Left = 31
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_pe_capa_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_capa_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPE.CD_IMPORTADOR'
      Size = 5
    end
    object qry_pe_capa_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TPE.CD_AGENTE'
      Size = 4
    end
    object qry_pe_capa_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TPE.CD_MOEDA'
      Size = 3
    end
    object qry_pe_capa_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TPE.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_pe_capa_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPE.CD_INCOTERM'
      Size = 3
    end
    object qry_pe_capa_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'TPE.VL_PESO_BRUTO'
    end
    object qry_pe_capa_VL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'TPE.VL_PESO_LIQUIDO'
    end
    object qry_pe_capa_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'TPE.VL_FRETE'
    end
    object qry_pe_capa_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPE.VL_SEGURO'
    end
    object qry_pe_capa_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPE.NR_PROCESSO'
      Size = 2
    end
    object qry_pe_capa_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPE.NR_PROCESSO'
      Size = 5
    end
    object qry_pe_capa_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPE.NR_PROCESSO'
      Size = 5
    end
    object qry_pe_capa_TP_CONSIGNATARIO: TStringField
      FieldName = 'TP_CONSIGNATARIO'
      Origin = 'TPE.NR_PROCESSO'
      Size = 1
    end
    object qry_pe_capa_CD_CONSIGNATARIO: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      Origin = 'TPE.NR_PROCESSO'
      Size = 5
    end
    object qry_pe_capa_QT_TOTAL_ITENS: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPE.NR_PROCESSO'
      Size = 3
    end
    object qry_pe_capa_VL_TOT_QTDE_PROD: TFloatField
      FieldName = 'VL_TOT_QTDE_PROD'
      Origin = 'TPE.NR_PROCESSO'
    end
    object qry_pe_capa_VL_TOT_FOB: TFloatField
      FieldName = 'VL_TOT_FOB'
      Origin = 'TPE.CD_UNID_NEG'
    end
    object qry_pe_capa_VL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      Origin = 'TPE.CD_IMPORTADOR'
    end
    object qry_pe_capa_DT_REGISTRO_PEDIDO: TDateTimeField
      FieldName = 'DT_REGISTRO_PEDIDO'
      Origin = 'TPE.NR_PROCESSO'
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_pe_capa_
    Left = 31
    Top = 72
  end
  object qry_pe_itens_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPE_ITEM (NOLOCK)'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '              NR_PROCESSO = :NR_PROCESSO')
    Left = 122
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_pe_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPE_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_pe_itens_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPE_ITEM.CD_UNID_NEG'
      Size = 2
    end
    object qry_pe_itens_NR_PEDIDO_IMP: TStringField
      FieldName = 'NR_PEDIDO_IMP'
      Origin = 'TPE_ITEM.NR_PEDIDO_IMP'
      Size = 18
    end
    object qry_pe_itens_CD_MERCADORIA: TStringField
      DisplayWidth = 20
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPE_ITEM.CD_MERCADORIA'
    end
    object qry_pe_itens_CD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'TPE_ITEM.CD_NCM'
      Size = 11
    end
    object qry_pe_itens_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TPE_ITEM.CD_NALADI_SH'
      Size = 8
    end
    object qry_pe_itens_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'TPE_ITEM.CD_UNID_MEDIDA'
      Size = 3
    end
    object qry_pe_itens_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TPE_ITEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_pe_itens_CD_CLASSIF_EMBALAGEM: TStringField
      FieldName = 'CD_CLASSIF_EMBALAGEM'
      Origin = 'TPE_ITEM.CD_CLASSIF_EMBALAGEM'
      Size = 30
    end
    object qry_pe_itens_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TPE_ITEM.CD_FABR_EXPO'
      Size = 1
    end
    object qry_pe_itens_CD_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_EMBALAGEM_SUP'
      Origin = 'TPE_ITEM.CD_EMBALAGEM_SUP'
      Size = 4
    end
    object qry_pe_itens_CD_CLASSIF_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_CLASSIF_EMBALAGEM_SUP'
      Origin = 'TPE_ITEM.CD_CLASSIF_EMBALAGEM_SUP'
      Size = 30
    end
    object qry_pe_itens_QT_POR_EMB: TFloatField
      FieldName = 'QT_POR_EMB'
      Origin = 'TPE_ITEM.QT_POR_EMB'
    end
    object qry_pe_itens_QT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
      Origin = 'TPE_ITEM.QT_EMBALAGEM'
    end
    object qry_pe_itens_QT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'TPE_ITEM.QT_MERCADORIA'
    end
    object qry_pe_itens_QT_POR_EMB_SUP: TFloatField
      FieldName = 'QT_POR_EMB_SUP'
      Origin = 'TPE_ITEM.QT_POR_EMB_SUP'
    end
    object qry_pe_itens_QT_EMBALAGEM_SUP: TFloatField
      FieldName = 'QT_EMBALAGEM_SUP'
      Origin = 'TPE_ITEM.QT_EMBALAGEM_SUP'
    end
    object qry_pe_itens_VL_POR_EMB: TFloatField
      FieldName = 'VL_POR_EMB'
      Origin = 'TPE_ITEM.VL_POR_EMB'
    end
    object qry_pe_itens_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TPE_ITEM.VL_UNITARIO'
    end
    object qry_pe_itens_VL_PESO_LIQ_UNIT: TFloatField
      FieldName = 'VL_PESO_LIQ_UNIT'
      Origin = 'TPE_ITEM.VL_PESO_LIQ_UNIT'
    end
    object qry_pe_itens_VL_COMPRIMENTO_EMB: TFloatField
      FieldName = 'VL_COMPRIMENTO_EMB'
      Origin = 'TPE_ITEM.VL_COMPRIMENTO_EMB'
    end
    object qry_pe_itens_VL_LARGURA_EMB: TFloatField
      FieldName = 'VL_LARGURA_EMB'
      Origin = 'TPE_ITEM.VL_LARGURA_EMB'
    end
    object qry_pe_itens_VL_ALTURA_EMB: TFloatField
      FieldName = 'VL_ALTURA_EMB'
      Origin = 'TPE_ITEM.VL_ALTURA_EMB'
    end
    object qry_pe_itens_VL_PESO_EMB: TFloatField
      FieldName = 'VL_PESO_EMB'
      Origin = 'TPE_ITEM.VL_PESO_EMB'
    end
    object qry_pe_itens_VL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
      Origin = 'TPE_ITEM.VL_TOT_ITEM'
    end
    object qry_pe_itens_VL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
      Origin = 'TPE_ITEM.VL_TOT_PESO_LIQ'
    end
    object qry_pe_itens_VL_TOT_PESO_BRUTO: TFloatField
      FieldName = 'VL_TOT_PESO_BRUTO'
      Origin = 'TPE_ITEM.VL_TOT_PESO_BRUTO'
    end
    object qry_pe_itens_VL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
      Origin = 'TPE_ITEM.VL_CUBAGEM'
    end
    object qry_pe_itens_VL_MLE: TFloatField
      FieldName = 'VL_MLE'
      Origin = 'TPE_ITEM.VL_MLE'
    end
    object qry_pe_itens_VL_MCV: TFloatField
      FieldName = 'VL_MCV'
      Origin = 'TPE_ITEM.VL_MCV'
    end
    object qry_pe_itens_VL_POR_EMB_SUP: TFloatField
      FieldName = 'VL_POR_EMB_SUP'
      Origin = 'TPE_ITEM.VL_POR_EMB_SUP'
    end
    object qry_pe_itens_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TPE_ITEM.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_pe_itens_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPE_ITEM.IN_SELECIONADO'
      Size = 1
    end
    object qry_pe_itens_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPE_ITEM.IN_MONTADO'
      Size = 1
    end
    object qry_pe_itens_QT_BAIXADA: TFloatField
      FieldName = 'QT_BAIXADA'
      Origin = 'TPE_ITEM.QT_BAIXADA'
    end
    object qry_pe_itens_QT_BAIXAR: TFloatField
      FieldName = 'QT_BAIXAR'
      Origin = 'TPE_ITEM.QT_BAIXAR'
    end
    object qry_pe_itens_QT_DISPONIVEL: TFloatField
      FieldName = 'QT_DISPONIVEL'
      Origin = 'TPE_ITEM.QT_DISPONIVEL'
    end
    object qry_pe_itens_CD_EMBALAGEM_CLIENTE: TStringField
      FieldName = 'CD_EMBALAGEM_CLIENTE'
      Origin = 'TPE_ITEM.CD_EMBALAGEM_CLIENTE'
      Size = 10
    end
    object qry_pe_itens_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPE_ITEM.CD_FABRICANTE'
      Size = 5
    end
    object qry_pe_itens_NR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      Origin = 'TPE_ITEM.NR_PEDIDO'
      Size = 18
    end
    object qry_pe_itens_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'DBBROKER.TPE_ITEM.VL_FRETE'
    end
  end
  object qry_empresa_est_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, IN_IMPORTADOR, IN_AGENTE'
      'FROM TEMPRESA_EST (NOLOCK)'
      'WHERE NM_EMPRESA = :NM_EMPRESA'
      '')
    Left = 227
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NM_EMPRESA'
        ParamType = ptUnknown
      end>
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
    object qry_empresa_est_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
      Origin = 'TEMPRESA_EST.IN_IMPORTADOR'
    end
    object qry_empresa_est_IN_AGENTE: TBooleanField
      FieldName = 'IN_AGENTE'
      Origin = 'TEMPRESA_EST.IN_AGENTE'
    end
  end
  object qry_ult_cod_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT isnull( MAX( CD_EMPRESA ),0 ) ULTCOD'
      'FROM TEMPRESA_EST')
    Left = 355
    Top = 16
    object qry_ult_cod_emp_est_ULTCOD: TStringField
      FieldName = 'ULTCOD'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
  end
  object qry_ult_cod_transp_: TQuery
    DatabaseName = 'BROKER'
    SQL.Strings = (
      'SELECT isnull( MAX( CD_VIA_TRANSP ),0 ) ULTCOD'
      'FROM TVIA_TRANSP_BROKER')
    Left = 355
    Top = 72
    object qry_ult_cod_transp_ULTCOD: TStringField
      FieldName = 'ULTCOD'
      Size = 2
    end
  end
  object qry_limpa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'DELETE FROM TPE WHERE NR_PROCESSO = :NR_PROCESSO AND CD_UNID_NEG' +
        ' = :CD_UNID_NEG'
      
        'DELETE FROM TPE_ITEM WHERE NR_PROCESSO = :NR_PROCESSO AND CD_UNI' +
        'D_NEG = :CD_UNID_NEG'
      '')
    Left = 31
    Top = 137
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
  end
  object qry_cgc1_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, CGC_EMPRESA, CD_GRUPO'
      'FROM TEMPRESA_NAC (NOLOCK)'
      'WHERE LEFT(CGC_EMPRESA,12) = :CGC_EMPRESA')
    Left = 122
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CGC_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_cgc1_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Size = 5
    end
    object qry_cgc1_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
    object qry_cgc1_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
  end
  object qry_cgc2_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, CGC_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE CGC_EMPRESA = :CGC_EMPRESA')
    Left = 458
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CGC_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_cgc2_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cgc2_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TEMPRESA_NAC.CGC_EMPRESA'
      Size = 14
    end
  end
  object qry_de_para_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TDE_PARA (NOLOCK)'
      
        'WHERE (CD_TABELA = :CD_TABELA) AND (CD_EXTERNO = :CD_EXTERNO) AN' +
        'D (CD_UNID_NEG = :CD_UNID_NEG) AND (CD_PRODUTO = '#39'02'#39')'
      '')
    Left = 227
    Top = 137
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_TABELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EXTERNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_de_para_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TDE_PARA.CD_UNID_NEG'
      Size = 2
    end
    object qry_de_para_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TDE_PARA.CD_PRODUTO'
      Size = 2
    end
    object qry_de_para_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TDE_PARA.CD_TABELA'
      Size = 2
    end
    object qry_de_para_CD_DDBROKER: TStringField
      FieldName = 'CD_DDBROKER'
      Origin = 'TDE_PARA.CD_DDBROKER'
      Size = 5
    end
    object qry_de_para_CD_EXTERNO: TStringField
      FieldName = 'CD_EXTERNO'
      Origin = 'TDE_PARA.CD_EXTERNO'
      Size = 15
    end
  end
  object qry_pe_itens_total_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TOTAL = COUNT(*)'
      'FROM TPE_ITEM'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '               NR_PROCESSO = :NR_PROCESSO')
    Left = 355
    Top = 137
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_pe_itens_total_TOTAL: TIntegerField
      FieldName = 'TOTAL'
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
  end
  object qry_merc_exp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_MERCADORIA, AP_MERCADORIA, VL_UNITARIO, QT_POR_EMBALAG' +
        'EM, PL_MERCADORIA, NM_MERCADORIA, CD_EXPORTADOR, CD_GRUPO, CD_EM' +
        'BALAGEM, CD_UN_MED_COMERC, CD_FABR_EXPO, CD_FABRICANTE'
      'FROM TMERCADORIA_EXP (NOLOCK)'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA')
    Left = 227
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_merc_exp_CD_MERCADORIA: TStringField
      DisplayWidth = 20
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA_EXP.CD_MERCADORIA'
    end
    object qry_merc_exp_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TMERCADORIA_EXP.VL_UNITARIO'
    end
    object qry_merc_exp_QT_POR_EMBALAGEM: TFloatField
      FieldName = 'QT_POR_EMBALAGEM'
      Origin = 'TMERCADORIA_EXP.QT_POR_EMBALAGEM'
    end
    object qry_merc_exp_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TMERCADORIA_EXP.PL_MERCADORIA'
    end
    object qry_merc_exp_NM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      Origin = 'TMERCADORIA_EXP.CD_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_merc_exp_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Origin = 'TMERCADORIA_EXP.CD_MERCADORIA'
      Size = 25
    end
    object qry_merc_exp_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TMERCADORIA_EXP.CD_MERCADORIA'
      Size = 5
    end
    object qry_merc_exp_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TMERCADORIA_EXP.AP_MERCADORIA'
      Size = 3
    end
    object qry_merc_exp_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TMERCADORIA_EXP.CD_MERCADORIA'
      Size = 4
    end
    object qry_merc_exp_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'TMERCADORIA_EXP.CD_MERCADORIA'
      Size = 3
    end
    object qry_merc_exp_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TMERCADORIA_EXP.CD_MERCADORIA'
      Size = 1
    end
    object qry_merc_exp_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TMERCADORIA_EXP.CD_MERCADORIA'
      Size = 5
    end
  end
  object qry_embalagem_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      
        'SELECT CD_EMBALAGEM, NM_EMBALAGEM_S, CD_EMBALAGEM_SUP, QT_EMBALA' +
        'GEM_SUP'
      'FROM   TEMBALAGEM (NOLOCK)'
      'WHERE  CD_EMBALAGEM = :CD_EMBALAGEM')
    Left = 122
    Top = 137
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMBALAGEM'
        ParamType = ptUnknown
      end>
    object qry_embalagem_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_embalagem_NM_EMBALAGEM_S: TStringField
      DisplayWidth = 50
      FieldName = 'NM_EMBALAGEM_S'
      Origin = 'TEMBALAGEM.NM_EMBALAGEM_S'
      Size = 50
    end
    object qry_embalagem_CD_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_EMBALAGEM_SUP'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_embalagem_QT_EMBALAGEM_SUP: TFloatField
      FieldName = 'QT_EMBALAGEM_SUP'
      Origin = 'TEMBALAGEM.NM_EMBALAGEM_S'
    end
  end
end
