object datm_LI: Tdatm_LI
  OldCreateOrder = True
  Left = 992
  Top = 181
  Height = 509
  Width = 319
  object qry_empresa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      ' CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC ( NOLOCK )'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Left = 224
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_empresa_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      ' CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO TSERVICO ( NOLOCK )'
      'WHERE CD_SERVICO = :CD_SERVICO')
    Left = 136
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
  end
  object qry_li_: TQuery
    BeforeOpen = qry_li_BeforeOpen
    AfterOpen = qry_li_AfterOpen
    AfterScroll = qry_li_AfterScroll
    OnCalcFields = qry_li_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      
        ' NR_PROCESSO, CD_IMPORTADOR, CD_SERVICO, DT_PROCESSO_LI, NR_REGI' +
        'STRO_LI, DT_REGISTRO_LI,'
      
        ' TP_CAMBIO, IN_MONTADA, TP_RATEIO_PESO_LIQ, IN_RATEIO_PESO_LIQ, ' +
        'CD_CONDICAO_MERC'
      'FROM TLICENCA_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 136
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
    end
    object qry_li_NR_REGISTRO_LI: TStringField
      FieldName = 'NR_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.NR_REGISTRO_LI'
      EditMask = '!99/9999999-9;0;'
      Size = 10
    end
    object qry_li_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TLICENCA_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_li_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TLICENCA_IMPORTACAO.CD_SERVICO'
      Size = 3
    end
    object qry_li_DT_PROCESSO_LI: TDateTimeField
      FieldName = 'DT_PROCESSO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_PROCESSO_LI'
    end
    object qry_li_DT_REGISTRO_LI: TDateTimeField
      FieldName = 'DT_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_REGISTRO_LI'
    end
    object qry_li_calc_nr_proc: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_proc'
      Calculated = True
    end
    object qry_li_TP_CAMBIO: TStringField
      FieldName = 'TP_CAMBIO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 1
    end
    object qry_li_IN_MONTADA: TStringField
      FieldName = 'IN_MONTADA'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 1
    end
    object qry_li_TP_RATEIO_PESO_LIQ: TStringField
      FieldName = 'TP_RATEIO_PESO_LIQ'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 1
    end
    object qry_li_IN_RATEIO_PESO_LIQ: TStringField
      FieldName = 'IN_RATEIO_PESO_LIQ'
      Origin = 'DBBROKER.TLICENCA_IMPORTACAO.IN_RATEIO_PESO_LIQ'
      FixedChar = True
      Size = 1
    end
    object qry_li_CD_CONDICAO_MERC: TStringField
      FieldName = 'CD_CONDICAO_MERC'
      Origin = 'TLICENCA_IMPORTACAO.CD_CONDICAO_MERC'
      FixedChar = True
      Size = 1
    end
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      '  CD_UNID_NEG, AP_UNID_NEG, IN_ATIVO'
      'FROM TUNID_NEG ( NOLOCK )'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 40
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unidade_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unidade_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
    object qry_unidade_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG.IN_ATIVO'
      Size = 1
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      '  NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_SERVICO,'
      '  NR_CONHECIMENTO, NR_CONHECIMENTO_MASTER, CD_PAIS_ORIGEM'
      'FROM TPROCESSO P ( NOLOCK )'
      'WHERE P.NR_PROCESSO  = :NR_PROCESSO'
      '  AND P.IN_CANCELADO = '#39'0'#39
      '  AND P.IN_LIBERADO  = '#39'1'#39
      '  AND P.IN_PRODUCAO  = '#39'1'#39)
    Left = 40
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 3
    end
    object qry_processo_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 30
    end
    object qry_processo_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 30
    end
    object qry_processo_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      '  CD_UNID_NEG, CD_PRODUTO'
      'FROM TUSUARIO_HABILITACAO ( NOLOCK )'
      'WHERE CD_USUARIO = :CD_USUARIO'
      '  AND IN_ATIVO   = '#39'1'#39)
    Left = 224
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
  end
  object ds_li: TDataSource
    DataSet = qry_li_
    Left = 40
    Top = 16
  end
  object sp_li_duplica: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_li_duplica'
    Left = 40
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 1
      end
      item
        DataType = ftString
        Name = '@nr_processo_fonte'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_processo_destino'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_duplica'
        ParamType = ptInput
      end>
  end
  object sp_li_desmonta: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_li_desmonta'
    Left = 136
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      '  CD_PRODUTO, AP_PRODUTO, IN_ATIVO'
      'FROM TPRODUTO ( NOLOCK )'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Left = 136
    Top = 80
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
    object qry_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TPRODUTO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_Adicoes_DI_Copia: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      'DI.NR_PROCESSO,'
      'AI.NR_ADICAO,'
      'DI.CD_PAIS_PROC_CARGA,'
      'DI.CD_URF_DESPACHO,'
      'DI.CD_URF_ENTR_CARGA,'
      'AI.CD_REGIME_TRIBUTAR,'
      'AI.CD_FUND_LEG_REGIME,'
      'AI.CD_TIPO_ACORDO_TAR,'
      'AI.CD_ACORDO_ALADI,'
      'AI.CD_COBERT_CAMBIAL,'
      'AI.CD_MODALIDADE_PGTO,'
      'AI.PL_MERCADORIA,'
      'AI.CD_MOEDA_NEGOCIADA,'
      'AI.vl_merc_loc_emb_mneg,'
      'AI.CD_INCOTERMS_VENDA,'
      'AI.CD_MD_FRETE_MERC,'
      'AI.VL_FRETE_MERC_MNEG,'
      'DI.IN_EMBUT_FRT_ITENS'
      'FROM TDECLARACAO_IMPORTACAO DI (NOLOCK)  '
      
        'INNER JOIN TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO =' +
        ' DI.NR_PROCESSO'
      'WHERE DI.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY DI.NR_PROCESSO, AI.NR_ADICAO')
    Left = 151
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_Adicoes_DI_CopiaNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_Adicoes_DI_CopiaNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_Adicoes_DI_CopiaCD_PAIS_PROC_CARGA: TStringField
      FieldName = 'CD_PAIS_PROC_CARGA'
      FixedChar = True
      Size = 3
    end
    object qry_Adicoes_DI_CopiaCD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qry_Adicoes_DI_CopiaCD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      FixedChar = True
      Size = 7
    end
    object qry_Adicoes_DI_CopiaCD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      FixedChar = True
      Size = 1
    end
    object qry_Adicoes_DI_CopiaCD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      FixedChar = True
      Size = 2
    end
    object qry_Adicoes_DI_CopiaCD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      FixedChar = True
      Size = 1
    end
    object qry_Adicoes_DI_CopiaCD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      FixedChar = True
      Size = 3
    end
    object qry_Adicoes_DI_CopiaCD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      FixedChar = True
      Size = 1
    end
    object qry_Adicoes_DI_CopiaCD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      FixedChar = True
      Size = 2
    end
    object qry_Adicoes_DI_CopiaPL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qry_Adicoes_DI_CopiaCD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      FixedChar = True
      Size = 3
    end
    object qry_Adicoes_DI_Copiavl_merc_loc_emb_mneg: TFloatField
      FieldName = 'vl_merc_loc_emb_mneg'
    end
    object qry_Adicoes_DI_CopiaCD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_Adicoes_DI_CopiaCD_MD_FRETE_MERC: TStringField
      FieldName = 'CD_MD_FRETE_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_Adicoes_DI_CopiaVL_FRETE_MERC_MNEG: TFloatField
      FieldName = 'VL_FRETE_MERC_MNEG'
    end
    object qry_Adicoes_DI_CopiaIN_EMBUT_FRT_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_FRT_ITENS'
    end
  end
  object qry_Itens_DI_Copia: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      'NR_PROCESSO'
      ',NR_ADICAO'
      ',NR_ITEM'
      ',CD_EXPORTADOR'
      ',CD_FABR_EXPO'
      ',CD_FABRICANTE'
      ',CD_MERCADORIA'
      ',CD_NALADI_NCCA'
      ',CD_NALADI_SH'
      ',CD_NCM_SH'
      ',CD_PAIS_AQUISICAO'
      ',CD_PAIS_ORIGEM'
      ',CD_UN_MED_COMERC'
      ',PL_MERCADORIA'
      ',QT_MERC_UN_COMERC'
      ',QT_MERC_UN_ESTAT'
      ',TX_DESC_DET_MERC'
      ',NR_ITEM_PO'
      ',NR_PROC_PO'
      ',VL_UNID_COND_VENDA'
      ',VL_MLE_ITEM'
      ',NR_DESTAQUE_NCM'
      'FROM TDETALHE_MERCADORIA'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'AND NR_ADICAO = :NR_ADICAO'
      'ORDER BY NR_ADICAO, NR_ITEM')
    Left = 39
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptInput
      end>
    object qry_Itens_DI_CopiaNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_Itens_DI_CopiaNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_DI_CopiaNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_DI_CopiaCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_Itens_DI_CopiaCD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_FABR_EXPO'
      FixedChar = True
      Size = 1
    end
    object qry_Itens_DI_CopiaCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_Itens_DI_CopiaCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_MERCADORIA'
      FixedChar = True
      Size = 30
    end
    object qry_Itens_DI_CopiaCD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_NALADI_NCCA'
      FixedChar = True
      Size = 7
    end
    object qry_Itens_DI_CopiaCD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object qry_Itens_DI_CopiaCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qry_Itens_DI_CopiaCD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_DI_CopiaCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_DI_CopiaCD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_UN_MED_COMERC'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_DI_CopiaPL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.PL_MERCADORIA'
    end
    object qry_Itens_DI_CopiaQT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.QT_MERC_UN_COMERC'
    end
    object qry_Itens_DI_CopiaQT_MERC_UN_ESTAT: TFloatField
      FieldName = 'QT_MERC_UN_ESTAT'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.QT_MERC_UN_ESTAT'
    end
    object qry_Itens_DI_CopiaTX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object qry_Itens_DI_CopiaNR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_Itens_DI_CopiaNR_PROC_PO: TStringField
      FieldName = 'NR_PROC_PO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_PROC_PO'
      FixedChar = True
      Size = 30
    end
    object qry_Itens_DI_CopiaVL_UNID_COND_VENDA: TFloatField
      FieldName = 'VL_UNID_COND_VENDA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_UNID_COND_VENDA'
    end
    object qry_Itens_DI_CopiaVL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_MLE_ITEM'
    end
    object qry_Itens_DI_CopiaNR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_DESTAQUE_NCM'
      FixedChar = True
      Size = 3
    end
  end
  object qry_LIs_Copia: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO FROM TLICENCA_IMPORTACAO WHERE '
      'NR_PROCESSO LIKE :NR_PROCESSO_COPIA')
    Left = 39
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO_COPIA'
        ParamType = ptInput
      end>
    object qry_LIs_CopiaNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TLICENCA_IMPORTACAO.NR_PROCESSO'
      FixedChar = True
    end
  end
  object qry_Itens_Pedidos: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      'POI.NR_PROCESSO AS NR_REFERENCIA,'
      'POI.NR_ITEM_CLIENTE,'
      'POI.NR_PARCIAL, '
      'ISNULL(POI.NR_CNTR, '#39#39') AS NR_CNTR'
      'FROM TREF_CLIENTE R (NOLOCK)'
      'INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = R.NR_PROCESSO'
      
        'INNER JOIN TPO_ITEM POI (NOLOCK) ON POI.NR_PROCESSO = R.CD_REFER' +
        'ENCIA AND'
      #9#9#9#9#9#9'         POI.NR_ITEM_CLIENTE = R.NR_ITEM_PO AND'
      
        '                                                                ' +
        '                                         POI.NR_PARCIAL = R.NR_P' +
        'ARCIAL AND '
      
        '                                                                ' +
        '                                         POI.CD_EMPRESA = P.CD_C' +
        'LIENTE AND'
      #9#9#9#9#9#9'         POI.NR_PROCESSO IS NOT NULL'
      'WHERE '
      'P.NR_PROCESSO = :NR_PROCESSO')
    Left = 159
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_Itens_PedidosNR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      FixedChar = True
      Size = 30
    end
    object qry_Itens_PedidosNR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object qry_Itens_PedidosNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
    end
    object qry_Itens_PedidosNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
    end
  end
end
