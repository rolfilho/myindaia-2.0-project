object datm_po_leitura: Tdatm_po_leitura
  OldCreateOrder = True
  Left = 200
  Top = 104
  Height = 470
  Width = 538
  object qry_po_: TQuery
    AfterPost = qry_po_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TPO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 338
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_po_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object qry_po_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'TPO.NR_IDENT_USUARIO'
      Size = 15
    end
    object qry_po_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_po_CD_CONSIGNATARIO: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      Origin = 'TPO.CD_CONSIGNATARIO'
      Size = 5
    end
    object qry_po_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPO.CD_FABRICANTE'
      Size = 5
    end
    object qry_po_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPO.CD_EXPORTADOR'
      Size = 5
    end
    object qry_po_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TPO.CD_VIA_TRANSP'
      Size = 2
    end
    object qry_po_CD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'TPO.CD_REPRESENTANTE'
      Size = 5
    end
    object qry_po_CD_MOD_PAGAMENTO: TStringField
      FieldName = 'CD_MOD_PAGAMENTO'
      Origin = 'TPO.CD_MOD_PAGAMENTO'
      Size = 2
    end
    object qry_po_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPO.CD_PAIS_ORIGEM'
      Size = 3
    end
    object qry_po_CD_REGIME_TRIB: TStringField
      FieldName = 'CD_REGIME_TRIB'
      Origin = 'TPO.CD_REGIME_TRIB'
      Size = 1
    end
    object qry_po_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TPO.CD_PAIS_PROCEDENCIA'
      Size = 3
    end
    object qry_po_CD_MOEDA_NEG: TStringField
      FieldName = 'CD_MOEDA_NEG'
      Origin = 'TPO.CD_MOEDA_NEG'
      Size = 3
    end
    object qry_po_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TPO.CD_PAIS_AQUISICAO'
      Size = 3
    end
    object qry_po_CD_TP_DECLARACAO: TStringField
      FieldName = 'CD_TP_DECLARACAO'
      Origin = 'TPO.CD_TP_DECLARACAO'
      Size = 2
    end
    object qry_po_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TPO.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_po_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPO.CD_INCOTERM'
      Size = 3
    end
    object qry_po_CD_TRANSP_INTERN: TStringField
      FieldName = 'CD_TRANSP_INTERN'
      Origin = 'TPO.CD_TRANSP_INTERN'
      Size = 4
    end
    object qry_po_CD_BANDEIRA_VEIC: TStringField
      FieldName = 'CD_BANDEIRA_VEIC'
      Origin = 'TPO.CD_BANDEIRA_VEIC'
      Size = 3
    end
    object qry_po_CD_SETOR_ARMAZENAGEM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAGEM'
      Origin = 'TPO.CD_SETOR_ARMAZENAGEM'
      Size = 3
    end
    object qry_po_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'TPO.CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object qry_po_CD_AGENTE_CARGA: TStringField
      FieldName = 'CD_AGENTE_CARGA'
      Origin = 'TPO.CD_AGENTE_CARGA'
      Size = 4
    end
    object qry_po_CD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'TPO.CD_URF_ENTRADA'
      Size = 7
    end
    object qry_po_CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Origin = 'TPO.CD_RECINTO_ALFAND'
      Size = 7
    end
    object qry_po_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TPO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_po_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TPO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_po_CD_MOEDA_CARGA: TStringField
      FieldName = 'CD_MOEDA_CARGA'
      Origin = 'TPO.CD_MOEDA_CARGA'
      Size = 3
    end
    object qry_po_CD_LOCAL_INCOTERM: TStringField
      FieldName = 'CD_LOCAL_INCOTERM'
      Origin = 'TPO.CD_LOCAL_INCOTERM'
      Size = 10
    end
    object qry_po_CD_TX_JUROS: TStringField
      FieldName = 'CD_TX_JUROS'
      Origin = 'TPO.CD_TX_JUROS'
      Size = 4
    end
    object qry_po_CD_INSTIT_FINANC: TStringField
      FieldName = 'CD_INSTIT_FINANC'
      Origin = 'TPO.CD_INSTIT_FINANC'
      Size = 2
    end
    object qry_po_CD_MOTIVO_CAMBIO_SEM_COBERT: TStringField
      FieldName = 'CD_MOTIVO_CAMBIO_SEM_COBERT'
      Origin = 'TPO.CD_MOTIVO_CAMBIO_SEM_COBERT'
      Size = 2
    end
    object qry_po_CD_BARRA: TStringField
      FieldName = 'CD_BARRA'
      Origin = 'TPO.CD_BARRA'
      Size = 11
    end
    object qry_po_CD_MET_VALORACAO_ADUAN: TStringField
      FieldName = 'CD_MET_VALORACAO_ADUAN'
      Origin = 'TPO.CD_MET_VALORACAO_ADUAN'
      Size = 2
    end
    object qry_po_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPO.DT_ABERTURA'
    end
    object qry_po_DT_EMISSAO_DOC_CARGA: TDateTimeField
      FieldName = 'DT_EMISSAO_DOC_CARGA'
      Origin = 'TPO.DT_EMISSAO_DOC_CARGA'
    end
    object qry_po_DT_CHEGADA_CARGA: TDateTimeField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'TPO.DT_CHEGADA_CARGA'
    end
    object qry_po_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPO.DT_FATURA'
    end
    object qry_po_IN_APLICACAO_MERC: TStringField
      FieldName = 'IN_APLICACAO_MERC'
      Origin = 'TPO.IN_APLICACAO_MERC'
      Size = 1
    end
    object qry_po_IN_COMISSAO: TBooleanField
      FieldName = 'IN_COMISSAO'
      Origin = 'TPO.IN_COMISSAO'
    end
    object qry_po_IN_DESCONTO: TBooleanField
      FieldName = 'IN_DESCONTO'
      Origin = 'TPO.IN_DESCONTO'
    end
    object qry_po_IN_TP_COMISSAO: TStringField
      FieldName = 'IN_TP_COMISSAO'
      Origin = 'TPO.IN_TP_COMISSAO'
      Size = 1
    end
    object qry_po_IN_TP_DESCONTO: TStringField
      FieldName = 'IN_TP_DESCONTO'
      Origin = 'TPO.IN_TP_DESCONTO'
      Size = 1
    end
    object qry_po_IN_INDICADOR_CONSIG_IMPORT: TBooleanField
      FieldName = 'IN_INDICADOR_CONSIG_IMPORT'
      Origin = 'TPO.IN_INDICADOR_CONSIG_IMPORT'
    end
    object qry_po_IN_INDICADOR_PROC: TStringField
      FieldName = 'IN_INDICADOR_PROC'
      Origin = 'TPO.IN_INDICADOR_PROC'
      Size = 1
    end
    object qry_po_IN_VINC_IMPO_EXPO: TStringField
      FieldName = 'IN_VINC_IMPO_EXPO'
      Origin = 'TPO.IN_VINC_IMPO_EXPO'
      Size = 1
    end
    object qry_po_IN_COND_MERCADORIA: TStringField
      FieldName = 'IN_COND_MERCADORIA'
      Origin = 'TPO.IN_COND_MERCADORIA'
      Size = 1
    end
    object qry_po_IN_FABR_EXPOR_IMP: TStringField
      FieldName = 'IN_FABR_EXPOR_IMP'
      Origin = 'TPO.IN_FABR_EXPOR_IMP'
      Size = 1
    end
    object qry_po_IN_INDIC_MULTMODAL: TBooleanField
      FieldName = 'IN_INDIC_MULTMODAL'
      Origin = 'TPO.IN_INDIC_MULTMODAL'
    end
    object qry_po_IN_FUNDAP: TBooleanField
      FieldName = 'IN_FUNDAP'
      Origin = 'TPO.IN_FUNDAP'
    end
    object qry_po_IN_UTILIZ_CARGA: TStringField
      FieldName = 'IN_UTILIZ_CARGA'
      Origin = 'TPO.IN_UTILIZ_CARGA'
      Size = 1
    end
    object qry_po_IN_INDIC_TX_JUROS: TBooleanField
      FieldName = 'IN_INDIC_TX_JUROS'
      Origin = 'TPO.IN_INDIC_TX_JUROS'
    end
    object qry_po_IN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'TPO.IN_SEGURO'
      Size = 1
    end
    object qry_po_NR_PLACA_VEICULO: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      Origin = 'TPO.NR_PLACA_VEICULO'
      Size = 15
    end
    object qry_po_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TPO.NR_MANIFESTO'
      Size = 15
    end
    object qry_po_NR_DOC_MASTER: TStringField
      FieldName = 'NR_DOC_MASTER'
      Origin = 'TPO.NR_DOC_MASTER'
      Size = 30
    end
    object qry_po_NR_DOC_HOUSE: TStringField
      FieldName = 'NR_DOC_HOUSE'
      Origin = 'TPO.NR_DOC_HOUSE'
      Size = 30
    end
    object qry_po_NR_BACEN: TStringField
      FieldName = 'NR_BACEN'
      Origin = 'TPO.NR_BACEN'
      Size = 8
    end
    object qry_po_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPO.NR_FATURA'
      Size = 15
    end
    object qry_po_NM_IDENT_CRT: TStringField
      FieldName = 'NM_IDENT_CRT'
      Origin = 'TPO.NM_IDENT_CRT'
      Size = 11
    end
    object qry_po_NM_VEICULO: TStringField
      FieldName = 'NM_VEICULO'
      Origin = 'TPO.NM_VEICULO'
      Size = 30
    end
    object qry_po_PC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'TPO.PC_COMISSAO'
    end
    object qry_po_PC_DESCONTO: TFloatField
      FieldName = 'PC_DESCONTO'
      Origin = 'TPO.PC_DESCONTO'
    end
    object qry_po_PC_SEGURO: TFloatField
      FieldName = 'PC_SEGURO'
      Origin = 'TPO.PC_SEGURO'
    end
    object qry_po_PC_COMISSAO_AGENTE: TFloatField
      FieldName = 'PC_COMISSAO_AGENTE'
      Origin = 'TPO.PC_COMISSAO_AGENTE'
    end
    object qry_po_PL_PO: TFloatField
      FieldName = 'PL_PO'
      Origin = 'TPO.PL_PO'
    end
    object qry_po_PB_PO: TFloatField
      FieldName = 'PB_PO'
      Origin = 'TPO.PB_PO'
    end
    object qry_po_QT_TOTAL_PESO: TFloatField
      FieldName = 'QT_TOTAL_PESO'
      Origin = 'TPO.QT_TOTAL_PESO'
    end
    object qry_po_QT_PORC_ICMS: TFloatField
      FieldName = 'QT_PORC_ICMS'
      Origin = 'TPO.QT_PORC_ICMS'
    end
    object qry_po_QT_TOTAL_ITENS: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPO.QT_TOTAL_ITENS'
      Size = 3
    end
    object qry_po_QT_PORC_RED_ICMS: TFloatField
      FieldName = 'QT_PORC_RED_ICMS'
      Origin = 'TPO.QT_PORC_RED_ICMS'
    end
    object qry_po_QT_PERIODICIDADE: TStringField
      FieldName = 'QT_PERIODICIDADE'
      Origin = 'TPO.QT_PERIODICIDADE'
      Size = 3
    end
    object qry_po_TP_COBERT_CAMBIO: TStringField
      FieldName = 'TP_COBERT_CAMBIO'
      Origin = 'TPO.TP_COBERT_CAMBIO'
      Size = 1
    end
    object qry_po_TP_CAMBIO: TBooleanField
      FieldName = 'TP_CAMBIO'
      Origin = 'TPO.TP_CAMBIO'
    end
    object qry_po_TP_DOC_CARGA: TStringField
      FieldName = 'TP_DOC_CARGA'
      Origin = 'TPO.TP_DOC_CARGA'
      Size = 2
    end
    object qry_po_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'TPO.TP_FRETE'
      Size = 1
    end
    object qry_po_TP_SEGURO: TStringField
      FieldName = 'TP_SEGURO'
      Origin = 'TPO.TP_SEGURO'
      Size = 1
    end
    object qry_po_TP_MOD_DESPACHO: TStringField
      FieldName = 'TP_MOD_DESPACHO'
      Origin = 'TPO.TP_MOD_DESPACHO'
      Size = 1
    end
    object qry_po_TP_MANIFESTO: TStringField
      FieldName = 'TP_MANIFESTO'
      Origin = 'TPO.TP_MANIFESTO'
      Size = 1
    end
    object qry_po_TX_JUROS: TFloatField
      FieldName = 'TX_JUROS'
      Origin = 'TPO.TX_JUROS'
    end
    object qry_po_TX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'TPO.TX_OBSERVACAO'
      BlobType = ftMemo
    end
    object qry_po_VL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'TPO.VL_COMISSAO'
    end
    object qry_po_VL_CARGA: TFloatField
      FieldName = 'VL_CARGA'
      Origin = 'TPO.VL_CARGA'
    end
    object qry_po_VL_CAMBIO: TFloatField
      FieldName = 'VL_CAMBIO'
      Origin = 'TPO.VL_CAMBIO'
    end
    object qry_po_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TPO.VL_DESCONTO'
    end
    object qry_po_VL_FRETE_PREPAID: TFloatField
      FieldName = 'VL_FRETE_PREPAID'
      Origin = 'TPO.VL_FRETE_PREPAID'
    end
    object qry_po_VL_FRETE_COLLECT: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'TPO.VL_FRETE_COLLECT'
    end
    object qry_po_VL_FRETE_TERRIT_NAC: TFloatField
      FieldName = 'VL_FRETE_TERRIT_NAC'
      Origin = 'TPO.VL_FRETE_TERRIT_NAC'
    end
    object qry_po_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPO.VL_SEGURO'
    end
    object qry_po_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'TPO.VL_TOTAL'
    end
    object qry_po_VL_TOTAL_PARCELA: TFloatField
      FieldName = 'VL_TOTAL_PARCELA'
      Origin = 'TPO.VL_TOTAL_PARCELA'
    end
    object qry_po_VL_PAGTO_ANTECIPADO: TFloatField
      FieldName = 'VL_PAGTO_ANTECIPADO'
      Origin = 'TPO.VL_PAGTO_ANTECIPADO'
    end
    object qry_po_VL_PAGTO_VISTA: TFloatField
      FieldName = 'VL_PAGTO_VISTA'
      Origin = 'TPO.VL_PAGTO_VISTA'
    end
    object qry_po_VL_PERIODIC_MENSAL: TFloatField
      FieldName = 'VL_PERIODIC_MENSAL'
      Origin = 'TPO.VL_PERIODIC_MENSAL'
    end
    object qry_po_VL_DESPESAS: TFloatField
      FieldName = 'VL_DESPESAS'
      Origin = 'TPO.VL_DESPESAS'
    end
    object qry_po_VL_DESCONTOS: TFloatField
      FieldName = 'VL_DESCONTOS'
      Origin = 'TPO.VL_DESCONTOS'
    end
    object qry_po_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPO.IN_SELECIONADO'
      Size = 1
    end
    object qry_po_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPO.IN_MONTADO'
      Size = 1
    end
    object qry_po_IN_IND_COND_MERC: TBooleanField
      FieldName = 'IN_IND_COND_MERC'
      Origin = 'TPO.NR_PROCESSO'
    end
    object qry_po_IN_IND_CAMBIO_ITENS: TBooleanField
      FieldName = 'IN_IND_CAMBIO_ITENS'
      Origin = 'TPO.NR_IDENT_USUARIO'
    end
    object qry_po_NR_PARCELAS: TStringField
      FieldName = 'NR_PARCELAS'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 3
    end
    object qry_po_IN_PERIODICIDADE: TStringField
      FieldName = 'IN_PERIODICIDADE'
      Origin = 'TPO.CD_CONSIGNATARIO'
      Size = 1
    end
    object qry_po_QT_TOTAL_DISPONIVEL: TFloatField
      FieldName = 'QT_TOTAL_DISPONIVEL'
      Origin = 'TPO.NR_PROCESSO'
    end
    object qry_po_CD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'TPO.CD_VIA_TRANSP'
      Size = 4
    end
    object qry_po_CD_USUARIO_INT: TStringField
      FieldName = 'CD_USUARIO_INT'
      Origin = 'TPO.CD_AGENTE_CARGA'
      Size = 4
    end
    object qry_po_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPO.CD_URF_DESPACHO'
      Size = 3
    end
  end
  object ds_po: TDataSource
    DataSet = qry_po_
    Left = 33
    Top = 24
  end
  object ds_po_itens: TDataSource
    DataSet = qry_po_itens_
    Left = 33
    Top = 92
  end
  object qry_po_itens_: TQuery
    AfterPost = qry_po_itens_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPO_ITEM'
      'WHERE (NR_PROCESSO = :NR_PROCESSO)  AND'
      '      (NR_ITEM = :NR_ITEM) ')
    Left = 338
    Top = 92
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end>
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
    object qry_po_itens_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPO_ITEM.CD_EXPORTADOR'
      Size = 5
    end
    object qry_po_itens_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TPO_ITEM.CD_NALADI_SH'
      Size = 8
    end
    object qry_po_itens_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TPO_ITEM.CD_PAIS_AQUISICAO'
      Size = 3
    end
    object qry_po_itens_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPO_ITEM.CD_MERCADORIA'
      Size = 30
    end
    object qry_po_itens_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPO_ITEM.CD_FABRICANTE'
      Size = 5
    end
    object qry_po_itens_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPO_ITEM.CD_PAIS_ORIGEM'
      Size = 3
    end
    object qry_po_itens_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TPO_ITEM.CD_NCM_SH'
      Size = 11
    end
    object qry_po_itens_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'TPO_ITEM.CD_NALADI_NCCA'
      Size = 7
    end
    object qry_po_itens_CD_MET_VALOR_ADUANEIRA: TStringField
      FieldName = 'CD_MET_VALOR_ADUANEIRA'
      Origin = 'TPO_ITEM.CD_MET_VALOR_ADUANEIRA'
      Size = 2
    end
    object qry_po_itens_CD_DISP_LEGAL_EXONERA: TStringField
      FieldName = 'CD_DISP_LEGAL_EXONERA'
      Origin = 'TPO_ITEM.CD_DISP_LEGAL_EXONERA'
      Size = 4
    end
    object qry_po_itens_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Origin = 'TPO_ITEM.CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object qry_po_itens_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPO_ITEM.CD_INCOTERM'
      Size = 3
    end
    object qry_po_itens_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'TPO_ITEM.CD_ACORDO_ALADI'
      Size = 3
    end
    object qry_po_itens_CD_REG_TRIB_II: TStringField
      FieldName = 'CD_REG_TRIB_II'
      Origin = 'TPO_ITEM.CD_REG_TRIB_II'
      Size = 6
    end
    object qry_po_itens_CD_FUND_LEGAL_II: TStringField
      FieldName = 'CD_FUND_LEGAL_II'
      Origin = 'TPO_ITEM.CD_FUND_LEGAL_II'
      Size = 2
    end
    object qry_po_itens_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'TPO_ITEM.CD_UNID_MEDIDA'
      Size = 3
    end
    object qry_po_itens_CD_UNID_MED_II: TStringField
      FieldName = 'CD_UNID_MED_II'
      Origin = 'TPO_ITEM.CD_UNID_MED_II'
      Size = 3
    end
    object qry_po_itens_CD_UNID_MED_IPI: TStringField
      FieldName = 'CD_UNID_MED_IPI'
      Origin = 'TPO_ITEM.CD_UNID_MED_IPI'
      Size = 3
    end
    object qry_po_itens_CD_UNID_MED_AD: TStringField
      FieldName = 'CD_UNID_MED_AD'
      Origin = 'TPO_ITEM.CD_UNID_MED_AD'
      Size = 3
    end
    object qry_po_itens_CD_AGENTE_CAMBIO: TStringField
      FieldName = 'CD_AGENTE_CAMBIO'
      Origin = 'TPO_ITEM.CD_AGENTE_CAMBIO'
      Size = 4
    end
    object qry_po_itens_CD_MOD_PAGTO: TStringField
      FieldName = 'CD_MOD_PAGTO'
      Origin = 'TPO_ITEM.CD_MOD_PAGTO'
      Size = 2
    end
    object qry_po_itens_CD_TX_JUROS: TStringField
      FieldName = 'CD_TX_JUROS'
      Origin = 'TPO_ITEM.CD_TX_JUROS'
      Size = 4
    end
    object qry_po_itens_CD_INSTITUICAO_FINANC: TStringField
      FieldName = 'CD_INSTITUICAO_FINANC'
      Origin = 'TPO_ITEM.CD_INSTITUICAO_FINANC'
      Size = 2
    end
    object qry_po_itens_CD_MOT_SEM_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_MOT_SEM_COBERT_CAMBIAL'
      Origin = 'TPO_ITEM.CD_MOT_SEM_COBERT_CAMBIAL'
      Size = 2
    end
    object qry_po_itens_CD_EX_II: TStringField
      FieldName = 'CD_EX_II'
      Origin = 'TPO_ITEM.CD_EX_II'
      Size = 3
    end
    object qry_po_itens_CD_EX_IPI: TStringField
      FieldName = 'CD_EX_IPI'
      Origin = 'TPO_ITEM.CD_EX_IPI'
      Size = 3
    end
    object qry_po_itens_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TPO_ITEM.CD_VIA_TRANSP'
      Size = 2
    end
    object qry_po_itens_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TPO_ITEM.CD_PAIS_PROCEDENCIA'
      Size = 3
    end
    object qry_po_itens_CD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'TPO_ITEM.CD_URF_ENTRADA'
      Size = 7
    end
    object qry_po_itens_IN_NECESSITA_LI: TBooleanField
      FieldName = 'IN_NECESSITA_LI'
      Origin = 'TPO_ITEM.IN_NECESSITA_LI'
    end
    object qry_po_itens_IN_INDICADOR_COND_MERC: TBooleanField
      FieldName = 'IN_INDICADOR_COND_MERC'
      Origin = 'TPO_ITEM.IN_INDICADOR_COND_MERC'
    end
    object qry_po_itens_IN_COND_MERC: TStringField
      FieldName = 'IN_COND_MERC'
      Origin = 'TPO_ITEM.IN_COND_MERC'
      Size = 1
    end
    object qry_po_itens_IN_APLIC_MERC: TStringField
      FieldName = 'IN_APLIC_MERC'
      Origin = 'TPO_ITEM.IN_APLIC_MERC'
      Size = 1
    end
    object qry_po_itens_NM_ORGAO_EMISSOR_AL_EX_NALADI: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AL_EX_NALADI'
      Origin = 'TPO_ITEM.NM_ORGAO_EMISSOR_AL_EX_NALADI'
      Size = 9
    end
    object qry_po_itens_NM_AL_EX_NALADI: TStringField
      FieldName = 'NM_AL_EX_NALADI'
      Origin = 'TPO_ITEM.NM_AL_EX_NALADI'
      Size = 9
    end
    object qry_po_itens_NM_ORGAO_EMISSOR_AL_NCM: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AL_NCM'
      Origin = 'TPO_ITEM.NM_ORGAO_EMISSOR_AL_NCM'
      Size = 9
    end
    object qry_po_itens_NM_AL_EX_NALADI_NCCA: TStringField
      FieldName = 'NM_AL_EX_NALADI_NCCA'
      Origin = 'TPO_ITEM.NM_AL_EX_NALADI_NCCA'
      Size = 9
    end
    object qry_po_itens_NM_ORG_EMISSOR_EX_NALADI_NCCA: TStringField
      FieldName = 'NM_ORG_EMISSOR_EX_NALADI_NCCA'
      Origin = 'TPO_ITEM.NM_ORG_EMISSOR_EX_NALADI_NCCA'
      Size = 9
    end
    object qry_po_itens_NM_AL_II: TStringField
      FieldName = 'NM_AL_II'
      Origin = 'TPO_ITEM.NM_AL_II'
      Size = 9
    end
    object qry_po_itens_NM_ORGAO_EMISSOR_II: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_II'
      Origin = 'TPO_ITEM.NM_ORGAO_EMISSOR_II'
      Size = 9
    end
    object qry_po_itens_NM_ORGAO_EMISSOR_IPI: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_IPI'
      Origin = 'TPO_ITEM.NM_ORGAO_EMISSOR_IPI'
      Size = 9
    end
    object qry_po_itens_NM_AL_IPI: TStringField
      FieldName = 'NM_AL_IPI'
      Origin = 'TPO_ITEM.NM_AL_IPI'
      Size = 9
    end
    object qry_po_itens_NM_AL_AD: TStringField
      FieldName = 'NM_AL_AD'
      Origin = 'TPO_ITEM.NM_AL_AD'
      Size = 9
    end
    object qry_po_itens_NM_ORGAO_EMISSOR_AD: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AD'
      Origin = 'TPO_ITEM.NM_ORGAO_EMISSOR_AD'
      Size = 9
    end
    object qry_po_itens_NM_IDENTIFICACAO: TStringField
      FieldName = 'NM_IDENTIFICACAO'
      Origin = 'TPO_ITEM.NM_IDENTIFICACAO'
      Size = 9
    end
    object qry_po_itens_NR_ANO_EMISSAO_AL_EX_NALADI: TStringField
      FieldName = 'NR_ANO_EMISSAO_AL_EX_NALADI'
      Origin = 'TPO_ITEM.NR_ANO_EMISSAO_AL_EX_NALADI'
      Size = 4
    end
    object qry_po_itens_NR_AL_EX_NALADI: TStringField
      FieldName = 'NR_AL_EX_NALADI'
      Origin = 'TPO_ITEM.NR_AL_EX_NALADI'
      Size = 6
    end
    object qry_po_itens_NR_EX_NCM: TStringField
      FieldName = 'NR_EX_NCM'
      Origin = 'TPO_ITEM.NR_EX_NCM'
      Size = 3
    end
    object qry_po_itens_NR_AL_EX_NCM: TStringField
      FieldName = 'NR_AL_EX_NCM'
      Origin = 'TPO_ITEM.NR_AL_EX_NCM'
      Size = 9
    end
    object qry_po_itens_NR_ANO_EMISSAO_AL: TStringField
      FieldName = 'NR_ANO_EMISSAO_AL'
      Origin = 'TPO_ITEM.NR_ANO_EMISSAO_AL'
      Size = 4
    end
    object qry_po_itens_NR_ATO_LEGAL: TStringField
      FieldName = 'NR_ATO_LEGAL'
      Origin = 'TPO_ITEM.NR_ATO_LEGAL'
      Size = 6
    end
    object qry_po_itens_NR_EX_NALADI: TStringField
      FieldName = 'NR_EX_NALADI'
      Origin = 'TPO_ITEM.NR_EX_NALADI'
      Size = 3
    end
    object qry_po_itens_NR_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_EX_NALADI_NCCA'
      Origin = 'TPO_ITEM.NR_EX_NALADI_NCCA'
      Size = 3
    end
    object qry_po_itens_NR_ANO_EMISSAO_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_ANO_EMISSAO_EX_NALADI_NCCA'
      Origin = 'TPO_ITEM.NR_ANO_EMISSAO_EX_NALADI_NCCA'
      Size = 4
    end
    object qry_po_itens_NR_AL_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_AL_EX_NALADI_NCCA'
      Origin = 'TPO_ITEM.NR_AL_EX_NALADI_NCCA'
      Size = 6
    end
    object qry_po_itens_NR_ANO_II: TStringField
      FieldName = 'NR_ANO_II'
      Origin = 'TPO_ITEM.NR_ANO_II'
      Size = 4
    end
    object qry_po_itens_NR_AL_II: TStringField
      FieldName = 'NR_AL_II'
      Origin = 'TPO_ITEM.NR_AL_II'
      Size = 6
    end
    object qry_po_itens_NR_ALIQ_NORMAL_II: TStringField
      FieldName = 'NR_ALIQ_NORMAL_II'
      Origin = 'TPO_ITEM.NR_ALIQ_NORMAL_II'
      Size = 10
    end
    object qry_po_itens_NR_ALIQ_ACORDO_II: TStringField
      FieldName = 'NR_ALIQ_ACORDO_II'
      Origin = 'TPO_ITEM.NR_ALIQ_ACORDO_II'
      Size = 10
    end
    object qry_po_itens_NR_ALIQ_REDUZIDA_II: TStringField
      FieldName = 'NR_ALIQ_REDUZIDA_II'
      Origin = 'TPO_ITEM.NR_ALIQ_REDUZIDA_II'
      Size = 10
    end
    object qry_po_itens_NR_ALIQ_PERC_RED_II: TStringField
      FieldName = 'NR_ALIQ_PERC_RED_II'
      Origin = 'TPO_ITEM.NR_ALIQ_PERC_RED_II'
      Size = 10
    end
    object qry_po_itens_NR_ANO_IPI: TStringField
      FieldName = 'NR_ANO_IPI'
      Origin = 'TPO_ITEM.NR_ANO_IPI'
      Size = 4
    end
    object qry_po_itens_NR_AL_IPI: TStringField
      FieldName = 'NR_AL_IPI'
      Origin = 'TPO_ITEM.NR_AL_IPI'
      Size = 6
    end
    object qry_po_itens_NR_NOTA_COMPL_IPI: TStringField
      FieldName = 'NR_NOTA_COMPL_IPI'
      Origin = 'TPO_ITEM.NR_NOTA_COMPL_IPI'
      Size = 2
    end
    object qry_po_itens_NR_ALIQ_NORMAL_IPI: TStringField
      FieldName = 'NR_ALIQ_NORMAL_IPI'
      Origin = 'TPO_ITEM.NR_ALIQ_NORMAL_IPI'
      Size = 10
    end
    object qry_po_itens_NR_ALIQ_REDUZIDA_IPI: TStringField
      FieldName = 'NR_ALIQ_REDUZIDA_IPI'
      Origin = 'TPO_ITEM.NR_ALIQ_REDUZIDA_IPI'
      Size = 10
    end
    object qry_po_itens_NR_ALIQ_PERC_RED_IPI: TStringField
      FieldName = 'NR_ALIQ_PERC_RED_IPI'
      Origin = 'TPO_ITEM.NR_ALIQ_PERC_RED_IPI'
      Size = 10
    end
    object qry_po_itens_NR_PROC_LI: TStringField
      FieldName = 'NR_PROC_LI'
      Origin = 'TPO_ITEM.NR_PROC_LI'
      Size = 18
    end
    object qry_po_itens_NR_EX_AD: TStringField
      FieldName = 'NR_EX_AD'
      Origin = 'TPO_ITEM.NR_EX_AD'
      Size = 3
    end
    object qry_po_itens_NR_ANO_AD: TStringField
      FieldName = 'NR_ANO_AD'
      Origin = 'TPO_ITEM.NR_ANO_AD'
      Size = 4
    end
    object qry_po_itens_NR_AL_AD: TStringField
      FieldName = 'NR_AL_AD'
      Origin = 'TPO_ITEM.NR_AL_AD'
      Size = 6
    end
    object qry_po_itens_NR_ALIQ_AD: TStringField
      FieldName = 'NR_ALIQ_AD'
      Origin = 'TPO_ITEM.NR_ALIQ_AD'
      Size = 10
    end
    object qry_po_itens_NR_BASE_CALC_AD: TFloatField
      FieldName = 'NR_BASE_CALC_AD'
      Origin = 'TPO_ITEM.NR_BASE_CALC_AD'
    end
    object qry_po_itens_NR_PARCELAS: TStringField
      FieldName = 'NR_PARCELAS'
      Origin = 'TPO_ITEM.NR_PARCELAS'
      Size = 3
    end
    object qry_po_itens_NR_PERIODICIDADE: TStringField
      FieldName = 'NR_PERIODICIDADE'
      Origin = 'TPO_ITEM.NR_PERIODICIDADE'
      Size = 3
    end
    object qry_po_itens_NR_ROF_BACEN: TStringField
      FieldName = 'NR_ROF_BACEN'
      Origin = 'TPO_ITEM.NR_ROF_BACEN'
      Size = 8
    end
    object qry_po_itens_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPO_ITEM.NR_FATURA'
      Size = 50
    end
    object qry_po_itens_PC_DESCONTO: TFloatField
      FieldName = 'PC_DESCONTO'
      Origin = 'TPO_ITEM.PC_DESCONTO'
    end
    object qry_po_itens_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      Origin = 'TPO_ITEM.PC_ICMS'
    end
    object qry_po_itens_PC_ICMS_REDUCAO: TFloatField
      FieldName = 'PC_ICMS_REDUCAO'
      Origin = 'TPO_ITEM.PC_ICMS_REDUCAO'
    end
    object qry_po_itens_PC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'TPO_ITEM.PC_COMISSAO'
    end
    object qry_po_itens_PL_ITEM: TFloatField
      FieldName = 'PL_ITEM'
      Origin = 'TPO_ITEM.PL_ITEM'
    end
    object qry_po_itens_QT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
      Origin = 'TPO_ITEM.QT_INICIAL'
    end
    object qry_po_itens_QT_BAIXADA_DI: TFloatField
      FieldName = 'QT_BAIXADA_DI'
      Origin = 'TPO_ITEM.QT_BAIXADA_DI'
    end
    object qry_po_itens_QT_BAIXADA_LI: TFloatField
      FieldName = 'QT_BAIXADA_LI'
      Origin = 'TPO_ITEM.QT_BAIXADA_LI'
    end
    object qry_po_itens_QT_ESPEC_II: TFloatField
      FieldName = 'QT_ESPEC_II'
      Origin = 'TPO_ITEM.QT_ESPEC_II'
    end
    object qry_po_itens_QT_ESPEC_IPI: TFloatField
      FieldName = 'QT_ESPEC_IPI'
      Origin = 'TPO_ITEM.QT_ESPEC_IPI'
    end
    object qry_po_itens_QT_AD: TFloatField
      FieldName = 'QT_AD'
      Origin = 'TPO_ITEM.QT_AD'
    end
    object qry_po_itens_QT_MED_ESTATISTICA: TFloatField
      FieldName = 'QT_MED_ESTATISTICA'
      Origin = 'TPO_ITEM.QT_MED_ESTATISTICA'
    end
    object qry_po_itens_TP_CALCULO: TStringField
      FieldName = 'TP_CALCULO'
      Origin = 'TPO_ITEM.TP_CALCULO'
      Size = 1
    end
    object qry_po_itens_TP_COMISSAO: TStringField
      FieldName = 'TP_COMISSAO'
      Origin = 'TPO_ITEM.TP_COMISSAO'
      Size = 1
    end
    object qry_po_itens_TP_ACORDO_TARIFARIO: TStringField
      FieldName = 'TP_ACORDO_TARIFARIO'
      Origin = 'TPO_ITEM.TP_ACORDO_TARIFARIO'
      Size = 1
    end
    object qry_po_itens_TP_TRIBUTACAO_IPI: TStringField
      FieldName = 'TP_TRIBUTACAO_IPI'
      Origin = 'TPO_ITEM.TP_TRIBUTACAO_IPI'
      Size = 1
    end
    object qry_po_itens_TP_CAMBIO: TStringField
      FieldName = 'TP_CAMBIO'
      Origin = 'TPO_ITEM.TP_CAMBIO'
      Size = 1
    end
    object qry_po_itens_TP_IND_TX_JUROS: TBooleanField
      FieldName = 'TP_IND_TX_JUROS'
      Origin = 'TPO_ITEM.TP_IND_TX_JUROS'
    end
    object qry_po_itens_TP_IND_PERIODICIDADE: TStringField
      FieldName = 'TP_IND_PERIODICIDADE'
      Origin = 'TPO_ITEM.TP_IND_PERIODICIDADE'
      Size = 1
    end
    object qry_po_itens_TP_RECIPIENTE: TStringField
      FieldName = 'TP_RECIPIENTE'
      Origin = 'TPO_ITEM.TP_RECIPIENTE'
      Size = 2
    end
    object qry_po_itens_TP_IND_MULTIMODAL: TStringField
      FieldName = 'TP_IND_MULTIMODAL'
      Origin = 'TPO_ITEM.TP_IND_MULTIMODAL'
      Size = 1
    end
    object qry_po_itens_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TPO_ITEM.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_po_itens_TX_JUROS_CAMBIO: TFloatField
      FieldName = 'TX_JUROS_CAMBIO'
      Origin = 'TPO_ITEM.TX_JUROS_CAMBIO'
    end
    object qry_po_itens_VL_DESPESA_MOEDA: TFloatField
      FieldName = 'VL_DESPESA_MOEDA'
      Origin = 'TPO_ITEM.VL_DESPESA_MOEDA'
    end
    object qry_po_itens_VL_DESCONTO_MOEDA: TFloatField
      FieldName = 'VL_DESCONTO_MOEDA'
      Origin = 'TPO_ITEM.VL_DESCONTO_MOEDA'
    end
    object qry_po_itens_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TPO_ITEM.VL_UNITARIO'
    end
    object qry_po_itens_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'TPO_ITEM.VL_TOTAL'
    end
    object qry_po_itens_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TPO_ITEM.VL_DESCONTO'
    end
    object qry_po_itens_VL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'TPO_ITEM.VL_COMISSAO'
    end
    object qry_po_itens_VL_ESPEC_II: TFloatField
      FieldName = 'VL_ESPEC_II'
      Origin = 'TPO_ITEM.VL_ESPEC_II'
    end
    object qry_po_itens_VL_ESPEC_IPI: TFloatField
      FieldName = 'VL_ESPEC_IPI'
      Origin = 'TPO_ITEM.VL_ESPEC_IPI'
    end
    object qry_po_itens_VL_ESPEC_AD: TFloatField
      FieldName = 'VL_ESPEC_AD'
      Origin = 'TPO_ITEM.VL_ESPEC_AD'
    end
    object qry_po_itens_VL_TOTAL_PARCELAS: TFloatField
      FieldName = 'VL_TOTAL_PARCELAS'
      Origin = 'TPO_ITEM.VL_TOTAL_PARCELAS'
    end
    object qry_po_itens_VL_COBERT_ACIMA_360: TFloatField
      FieldName = 'VL_COBERT_ACIMA_360'
      Origin = 'TPO_ITEM.VL_COBERT_ACIMA_360'
    end
    object qry_po_itens_VL_PAGTO_ANTECIPADO: TFloatField
      FieldName = 'VL_PAGTO_ANTECIPADO'
      Origin = 'TPO_ITEM.VL_PAGTO_ANTECIPADO'
    end
    object qry_po_itens_VL_PAGTO_AVISTA: TFloatField
      FieldName = 'VL_PAGTO_AVISTA'
      Origin = 'TPO_ITEM.VL_PAGTO_AVISTA'
    end
    object qry_po_itens_VL_FRETE_NAC_MOEDA: TFloatField
      FieldName = 'VL_FRETE_NAC_MOEDA'
      Origin = 'TPO_ITEM.VL_FRETE_NAC_MOEDA'
    end
    object qry_po_itens_VL_SEGURO_MOEDA: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
      Origin = 'TPO_ITEM.VL_SEGURO_MOEDA'
    end
    object qry_po_itens_VL_ACRESC_MOEDA: TFloatField
      FieldName = 'VL_ACRESC_MOEDA'
      Origin = 'TPO_ITEM.VL_ACRESC_MOEDA'
    end
    object qry_po_itens_VL_DEDUC_MOEDA: TFloatField
      FieldName = 'VL_DEDUC_MOEDA'
      Origin = 'TPO_ITEM.VL_DEDUC_MOEDA'
    end
    object qry_po_itens_VL_FRETE_PREPAID_MOEDA: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MOEDA'
      Origin = 'TPO_ITEM.VL_FRETE_PREPAID_MOEDA'
    end
    object qry_po_itens_VL_FRETE_COLLECT: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'TPO_ITEM.VL_FRETE_COLLECT'
    end
    object qry_po_itens_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPO_ITEM.IN_SELECIONADO'
      Size = 1
    end
    object qry_po_itens_QT_BAIXAR: TFloatField
      FieldName = 'QT_BAIXAR'
      Origin = 'TPO_ITEM.QT_BAIXAR'
    end
    object qry_po_itens_QT_DISPONIVEL: TFloatField
      FieldName = 'QT_DISPONIVEL'
      Origin = 'TPO_ITEM.QT_DISPONIVEL'
    end
    object qry_po_itens_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPO_ITEM.IN_MONTADO'
      Size = 1
    end
    object qry_po_itens_IN_FABR_EXP_PROD: TStringField
      FieldName = 'IN_FABR_EXP_PROD'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 1
    end
    object qry_po_itens_NR_ANO_EX_NCM: TStringField
      FieldName = 'NR_ANO_EX_NCM'
      Origin = 'TPO_ITEM.NR_ITEM'
      Size = 4
    end
    object qry_po_itens_NR_NUM_EX_NCM: TStringField
      FieldName = 'NR_NUM_EX_NCM'
      Origin = 'TPO_ITEM.CD_EXPORTADOR'
      Size = 6
    end
    object qry_po_itens_IN_IND_COND_MERC: TBooleanField
      FieldName = 'IN_IND_COND_MERC'
      Origin = 'TPO_ITEM.CD_NALADI_SH'
    end
    object qry_po_itens_NM_LOCAL_INCOTERM: TStringField
      FieldName = 'NM_LOCAL_INCOTERM'
      Origin = 'TPO_ITEM.CD_PAIS_AQUISICAO'
      Size = 10
    end
    object qry_po_itens_NM_TIPO_AL_AD: TStringField
      FieldName = 'NM_TIPO_AL_AD'
      Origin = 'TPO_ITEM.CD_MERCADORIA'
      Size = 10
    end
    object qry_po_itens_IN_IND_PERIODICIDADE: TStringField
      FieldName = 'IN_IND_PERIODICIDADE'
      Origin = 'TPO_ITEM.CD_FABRICANTE'
      Size = 1
    end
    object qry_po_itens_IN_REG_TRIB_IPI: TStringField
      FieldName = 'IN_REG_TRIB_IPI'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 1
    end
    object qry_po_itens_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Origin = 'TPO_ITEM.CD_NALADI_SH'
      Size = 13
    end
    object qry_po_itens_CD_MODALIDADE: TStringField
      FieldName = 'CD_MODALIDADE'
      Origin = 'TPO_ITEM.CD_EXPORTADOR'
      Size = 1
    end
    object qry_po_itens_IN_AVISO_DB: TStringField
      FieldName = 'IN_AVISO_DB'
      Origin = 'TPO_ITEM.CD_EXPORTADOR'
      Size = 1
    end
    object qry_po_itens_NR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'TPO_ITEM.CD_EXPORTADOR'
      Size = 4
    end
  end
  object qry_verif_po_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOTAL'
      'FROM TPO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 127
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_verif_po_TOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
  end
  object qry_verif_po_itens_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOTAL'
      'FROM TPO_ITEM'
      'WHERE (NR_PROCESSO = :NR_PROCESSO) AND'
      '               (NR_ITEM_CLIENTE = :NR_ITEM)')
    Left = 234
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end>
    object qry_verif_po_itens_TOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
  end
  object ds_verif_po: TDataSource
    DataSet = qry_verif_po_
    Left = 127
    Top = 92
  end
  object ds_verif_po_itens: TDataSource
    DataSet = qry_verif_po_itens_
    Left = 234
    Top = 92
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE CGC_EMPRESA = :CGC_EMPRESA')
    Left = 234
    Top = 164
    ParamData = <
      item
        DataType = ftString
        Name = 'CGC_EMPRESA'
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
  end
  object qry_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, IN_EXPORTADOR'
      'FROM TEMPRESA_EST'
      'WHERE NM_EMPRESA = :NM_EMPRESA')
    Left = 33
    Top = 164
    ParamData = <
      item
        DataType = ftString
        Name = 'NM_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_emp_est_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
    object qry_emp_est_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 60
    end
  end
  object qry_moeda_broker_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA'
      'FROM TMOEDA_BROKER'
      'WHERE CD_MOEDA = :CD_MOEDA')
    Left = 127
    Top = 164
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end>
    object qry_moeda_broker_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TMOEDA_BROKER.CD_MOEDA'
      Size = 3
    end
    object qry_moeda_broker_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'TMOEDA_BROKER.NM_MOEDA'
      Size = 30
    end
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM TPAIS'
      'WHERE CODIGO = :CD_PAIS_AQUISICAO')
    Left = 127
    Top = 235
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PAIS_AQUISICAO'
        ParamType = ptUnknown
      end>
    object qry_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TPAIS.CODIGO'
      Size = 3
    end
    object qry_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TPAIS.DESCRICAO'
      Size = 120
    end
  end
  object qry_apaga_itens_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE TPO_ITEM'
      'WHERE (NR_PROCESSO = :NR_PROCESSO) ')
    Left = 33
    Top = 312
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object StringField2: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPO_ITEM.NR_ITEM'
      Size = 3
    end
    object StringField3: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPO_ITEM.CD_EXPORTADOR'
      Size = 5
    end
    object StringField4: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TPO_ITEM.CD_NALADI_SH'
      Size = 8
    end
    object StringField5: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TPO_ITEM.CD_PAIS_AQUISICAO'
      Size = 3
    end
    object StringField6: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPO_ITEM.CD_MERCADORIA'
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPO_ITEM.CD_FABRICANTE'
      Size = 5
    end
    object StringField8: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPO_ITEM.CD_PAIS_ORIGEM'
      Size = 3
    end
    object StringField9: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TPO_ITEM.CD_NCM_SH'
      Size = 11
    end
    object StringField10: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'TPO_ITEM.CD_NALADI_NCCA'
      Size = 7
    end
    object StringField11: TStringField
      FieldName = 'CD_MET_VALOR_ADUANEIRA'
      Origin = 'TPO_ITEM.CD_MET_VALOR_ADUANEIRA'
      Size = 2
    end
    object StringField12: TStringField
      FieldName = 'CD_DISP_LEGAL_EXONERA'
      Origin = 'TPO_ITEM.CD_DISP_LEGAL_EXONERA'
      Size = 4
    end
    object StringField13: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Origin = 'TPO_ITEM.CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object StringField14: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPO_ITEM.CD_INCOTERM'
      Size = 3
    end
    object StringField15: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'TPO_ITEM.CD_ACORDO_ALADI'
      Size = 3
    end
    object StringField16: TStringField
      FieldName = 'CD_REG_TRIB_II'
      Origin = 'TPO_ITEM.CD_REG_TRIB_II'
      Size = 6
    end
    object StringField17: TStringField
      FieldName = 'CD_FUND_LEGAL_II'
      Origin = 'TPO_ITEM.CD_FUND_LEGAL_II'
      Size = 2
    end
    object StringField18: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'TPO_ITEM.CD_UNID_MEDIDA'
      Size = 3
    end
    object StringField19: TStringField
      FieldName = 'CD_UNID_MED_II'
      Origin = 'TPO_ITEM.CD_UNID_MED_II'
      Size = 3
    end
    object StringField20: TStringField
      FieldName = 'CD_UNID_MED_IPI'
      Origin = 'TPO_ITEM.CD_UNID_MED_IPI'
      Size = 3
    end
    object StringField21: TStringField
      FieldName = 'CD_UNID_MED_AD'
      Origin = 'TPO_ITEM.CD_UNID_MED_AD'
      Size = 3
    end
    object StringField22: TStringField
      FieldName = 'CD_AGENTE_CAMBIO'
      Origin = 'TPO_ITEM.CD_AGENTE_CAMBIO'
      Size = 4
    end
    object StringField23: TStringField
      FieldName = 'CD_MOD_PAGTO'
      Origin = 'TPO_ITEM.CD_MOD_PAGTO'
      Size = 2
    end
    object StringField24: TStringField
      FieldName = 'CD_TX_JUROS'
      Origin = 'TPO_ITEM.CD_TX_JUROS'
      Size = 4
    end
    object StringField25: TStringField
      FieldName = 'CD_INSTITUICAO_FINANC'
      Origin = 'TPO_ITEM.CD_INSTITUICAO_FINANC'
      Size = 2
    end
    object StringField26: TStringField
      FieldName = 'CD_MOT_SEM_COBERT_CAMBIAL'
      Origin = 'TPO_ITEM.CD_MOT_SEM_COBERT_CAMBIAL'
      Size = 2
    end
    object StringField27: TStringField
      FieldName = 'CD_EX_II'
      Origin = 'TPO_ITEM.CD_EX_II'
      Size = 3
    end
    object StringField28: TStringField
      FieldName = 'CD_EX_IPI'
      Origin = 'TPO_ITEM.CD_EX_IPI'
      Size = 3
    end
    object StringField29: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TPO_ITEM.CD_VIA_TRANSP'
      Size = 2
    end
    object StringField30: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TPO_ITEM.CD_PAIS_PROCEDENCIA'
      Size = 3
    end
    object StringField31: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'TPO_ITEM.CD_URF_ENTRADA'
      Size = 7
    end
    object BooleanField1: TBooleanField
      FieldName = 'IN_NECESSITA_LI'
      Origin = 'TPO_ITEM.IN_NECESSITA_LI'
    end
    object BooleanField2: TBooleanField
      FieldName = 'IN_INDICADOR_COND_MERC'
      Origin = 'TPO_ITEM.IN_INDICADOR_COND_MERC'
    end
    object StringField32: TStringField
      FieldName = 'IN_COND_MERC'
      Origin = 'TPO_ITEM.IN_COND_MERC'
      Size = 1
    end
    object StringField33: TStringField
      FieldName = 'IN_APLIC_MERC'
      Origin = 'TPO_ITEM.IN_APLIC_MERC'
      Size = 1
    end
    object StringField34: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AL_EX_NALADI'
      Origin = 'TPO_ITEM.NM_ORGAO_EMISSOR_AL_EX_NALADI'
      Size = 9
    end
    object StringField35: TStringField
      FieldName = 'NM_AL_EX_NALADI'
      Origin = 'TPO_ITEM.NM_AL_EX_NALADI'
      Size = 9
    end
    object StringField36: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AL_NCM'
      Origin = 'TPO_ITEM.NM_ORGAO_EMISSOR_AL_NCM'
      Size = 9
    end
    object StringField37: TStringField
      FieldName = 'NM_AL_EX_NALADI_NCCA'
      Origin = 'TPO_ITEM.NM_AL_EX_NALADI_NCCA'
      Size = 9
    end
    object StringField38: TStringField
      FieldName = 'NM_ORG_EMISSOR_EX_NALADI_NCCA'
      Origin = 'TPO_ITEM.NM_ORG_EMISSOR_EX_NALADI_NCCA'
      Size = 9
    end
    object StringField39: TStringField
      FieldName = 'NM_AL_II'
      Origin = 'TPO_ITEM.NM_AL_II'
      Size = 9
    end
    object StringField40: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_II'
      Origin = 'TPO_ITEM.NM_ORGAO_EMISSOR_II'
      Size = 9
    end
    object StringField41: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_IPI'
      Origin = 'TPO_ITEM.NM_ORGAO_EMISSOR_IPI'
      Size = 9
    end
    object StringField42: TStringField
      FieldName = 'NM_AL_IPI'
      Origin = 'TPO_ITEM.NM_AL_IPI'
      Size = 9
    end
    object StringField43: TStringField
      FieldName = 'NM_AL_AD'
      Origin = 'TPO_ITEM.NM_AL_AD'
      Size = 9
    end
    object StringField44: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AD'
      Origin = 'TPO_ITEM.NM_ORGAO_EMISSOR_AD'
      Size = 9
    end
    object StringField45: TStringField
      FieldName = 'NM_IDENTIFICACAO'
      Origin = 'TPO_ITEM.NM_IDENTIFICACAO'
      Size = 9
    end
    object StringField46: TStringField
      FieldName = 'NR_ANO_EMISSAO_AL_EX_NALADI'
      Origin = 'TPO_ITEM.NR_ANO_EMISSAO_AL_EX_NALADI'
      Size = 4
    end
    object StringField47: TStringField
      FieldName = 'NR_AL_EX_NALADI'
      Origin = 'TPO_ITEM.NR_AL_EX_NALADI'
      Size = 6
    end
    object StringField48: TStringField
      FieldName = 'NR_EX_NCM'
      Origin = 'TPO_ITEM.NR_EX_NCM'
      Size = 3
    end
    object StringField49: TStringField
      FieldName = 'NR_AL_EX_NCM'
      Origin = 'TPO_ITEM.NR_AL_EX_NCM'
      Size = 9
    end
    object StringField50: TStringField
      FieldName = 'NR_ANO_EMISSAO_AL'
      Origin = 'TPO_ITEM.NR_ANO_EMISSAO_AL'
      Size = 4
    end
    object StringField51: TStringField
      FieldName = 'NR_ATO_LEGAL'
      Origin = 'TPO_ITEM.NR_ATO_LEGAL'
      Size = 6
    end
    object StringField52: TStringField
      FieldName = 'NR_EX_NALADI'
      Origin = 'TPO_ITEM.NR_EX_NALADI'
      Size = 3
    end
    object StringField53: TStringField
      FieldName = 'NR_EX_NALADI_NCCA'
      Origin = 'TPO_ITEM.NR_EX_NALADI_NCCA'
      Size = 3
    end
    object StringField54: TStringField
      FieldName = 'NR_ANO_EMISSAO_EX_NALADI_NCCA'
      Origin = 'TPO_ITEM.NR_ANO_EMISSAO_EX_NALADI_NCCA'
      Size = 4
    end
    object StringField55: TStringField
      FieldName = 'NR_AL_EX_NALADI_NCCA'
      Origin = 'TPO_ITEM.NR_AL_EX_NALADI_NCCA'
      Size = 6
    end
    object StringField56: TStringField
      FieldName = 'NR_ANO_II'
      Origin = 'TPO_ITEM.NR_ANO_II'
      Size = 4
    end
    object StringField57: TStringField
      FieldName = 'NR_AL_II'
      Origin = 'TPO_ITEM.NR_AL_II'
      Size = 6
    end
    object StringField58: TStringField
      FieldName = 'NR_ALIQ_NORMAL_II'
      Origin = 'TPO_ITEM.NR_ALIQ_NORMAL_II'
      Size = 10
    end
    object StringField59: TStringField
      FieldName = 'NR_ALIQ_ACORDO_II'
      Origin = 'TPO_ITEM.NR_ALIQ_ACORDO_II'
      Size = 10
    end
    object StringField60: TStringField
      FieldName = 'NR_ALIQ_REDUZIDA_II'
      Origin = 'TPO_ITEM.NR_ALIQ_REDUZIDA_II'
      Size = 10
    end
    object StringField61: TStringField
      FieldName = 'NR_ALIQ_PERC_RED_II'
      Origin = 'TPO_ITEM.NR_ALIQ_PERC_RED_II'
      Size = 10
    end
    object StringField62: TStringField
      FieldName = 'NR_ANO_IPI'
      Origin = 'TPO_ITEM.NR_ANO_IPI'
      Size = 4
    end
    object StringField63: TStringField
      FieldName = 'NR_AL_IPI'
      Origin = 'TPO_ITEM.NR_AL_IPI'
      Size = 6
    end
    object StringField64: TStringField
      FieldName = 'NR_NOTA_COMPL_IPI'
      Origin = 'TPO_ITEM.NR_NOTA_COMPL_IPI'
      Size = 2
    end
    object StringField65: TStringField
      FieldName = 'NR_ALIQ_NORMAL_IPI'
      Origin = 'TPO_ITEM.NR_ALIQ_NORMAL_IPI'
      Size = 10
    end
    object StringField66: TStringField
      FieldName = 'NR_ALIQ_REDUZIDA_IPI'
      Origin = 'TPO_ITEM.NR_ALIQ_REDUZIDA_IPI'
      Size = 10
    end
    object StringField67: TStringField
      FieldName = 'NR_ALIQ_PERC_RED_IPI'
      Origin = 'TPO_ITEM.NR_ALIQ_PERC_RED_IPI'
      Size = 10
    end
    object StringField68: TStringField
      FieldName = 'NR_PROC_LI'
      Origin = 'TPO_ITEM.NR_PROC_LI'
      Size = 18
    end
    object StringField69: TStringField
      FieldName = 'NR_EX_AD'
      Origin = 'TPO_ITEM.NR_EX_AD'
      Size = 3
    end
    object StringField70: TStringField
      FieldName = 'NR_ANO_AD'
      Origin = 'TPO_ITEM.NR_ANO_AD'
      Size = 4
    end
    object StringField71: TStringField
      FieldName = 'NR_AL_AD'
      Origin = 'TPO_ITEM.NR_AL_AD'
      Size = 6
    end
    object StringField72: TStringField
      FieldName = 'NR_ALIQ_AD'
      Origin = 'TPO_ITEM.NR_ALIQ_AD'
      Size = 10
    end
    object FloatField1: TFloatField
      FieldName = 'NR_BASE_CALC_AD'
      Origin = 'TPO_ITEM.NR_BASE_CALC_AD'
    end
    object StringField73: TStringField
      FieldName = 'NR_PARCELAS'
      Origin = 'TPO_ITEM.NR_PARCELAS'
      Size = 3
    end
    object StringField74: TStringField
      FieldName = 'NR_PERIODICIDADE'
      Origin = 'TPO_ITEM.NR_PERIODICIDADE'
      Size = 3
    end
    object StringField75: TStringField
      FieldName = 'NR_ROF_BACEN'
      Origin = 'TPO_ITEM.NR_ROF_BACEN'
      Size = 8
    end
    object StringField76: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPO_ITEM.NR_FATURA'
      Size = 50
    end
    object FloatField2: TFloatField
      FieldName = 'PC_DESCONTO'
      Origin = 'TPO_ITEM.PC_DESCONTO'
    end
    object FloatField3: TFloatField
      FieldName = 'PC_ICMS'
      Origin = 'TPO_ITEM.PC_ICMS'
    end
    object FloatField4: TFloatField
      FieldName = 'PC_ICMS_REDUCAO'
      Origin = 'TPO_ITEM.PC_ICMS_REDUCAO'
    end
    object FloatField5: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'TPO_ITEM.PC_COMISSAO'
    end
    object FloatField6: TFloatField
      FieldName = 'PL_ITEM'
      Origin = 'TPO_ITEM.PL_ITEM'
    end
    object FloatField7: TFloatField
      FieldName = 'QT_INICIAL'
      Origin = 'TPO_ITEM.QT_INICIAL'
    end
    object FloatField8: TFloatField
      FieldName = 'QT_BAIXADA_DI'
      Origin = 'TPO_ITEM.QT_BAIXADA_DI'
    end
    object FloatField9: TFloatField
      FieldName = 'QT_BAIXADA_LI'
      Origin = 'TPO_ITEM.QT_BAIXADA_LI'
    end
    object FloatField10: TFloatField
      FieldName = 'QT_ESPEC_II'
      Origin = 'TPO_ITEM.QT_ESPEC_II'
    end
    object FloatField11: TFloatField
      FieldName = 'QT_ESPEC_IPI'
      Origin = 'TPO_ITEM.QT_ESPEC_IPI'
    end
    object FloatField12: TFloatField
      FieldName = 'QT_AD'
      Origin = 'TPO_ITEM.QT_AD'
    end
    object FloatField13: TFloatField
      FieldName = 'QT_MED_ESTATISTICA'
      Origin = 'TPO_ITEM.QT_MED_ESTATISTICA'
    end
    object StringField77: TStringField
      FieldName = 'TP_CALCULO'
      Origin = 'TPO_ITEM.TP_CALCULO'
      Size = 1
    end
    object StringField78: TStringField
      FieldName = 'TP_COMISSAO'
      Origin = 'TPO_ITEM.TP_COMISSAO'
      Size = 1
    end
    object StringField79: TStringField
      FieldName = 'TP_ACORDO_TARIFARIO'
      Origin = 'TPO_ITEM.TP_ACORDO_TARIFARIO'
      Size = 1
    end
    object StringField80: TStringField
      FieldName = 'TP_TRIBUTACAO_IPI'
      Origin = 'TPO_ITEM.TP_TRIBUTACAO_IPI'
      Size = 1
    end
    object StringField81: TStringField
      FieldName = 'TP_CAMBIO'
      Origin = 'TPO_ITEM.TP_CAMBIO'
      Size = 1
    end
    object BooleanField3: TBooleanField
      FieldName = 'TP_IND_TX_JUROS'
      Origin = 'TPO_ITEM.TP_IND_TX_JUROS'
    end
    object StringField82: TStringField
      FieldName = 'TP_IND_PERIODICIDADE'
      Origin = 'TPO_ITEM.TP_IND_PERIODICIDADE'
      Size = 1
    end
    object StringField83: TStringField
      FieldName = 'TP_RECIPIENTE'
      Origin = 'TPO_ITEM.TP_RECIPIENTE'
      Size = 2
    end
    object StringField84: TStringField
      FieldName = 'TP_IND_MULTIMODAL'
      Origin = 'TPO_ITEM.TP_IND_MULTIMODAL'
      Size = 1
    end
    object MemoField1: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TPO_ITEM.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object FloatField14: TFloatField
      FieldName = 'TX_JUROS_CAMBIO'
      Origin = 'TPO_ITEM.TX_JUROS_CAMBIO'
    end
    object FloatField15: TFloatField
      FieldName = 'VL_DESPESA_MOEDA'
      Origin = 'TPO_ITEM.VL_DESPESA_MOEDA'
    end
    object FloatField16: TFloatField
      FieldName = 'VL_DESCONTO_MOEDA'
      Origin = 'TPO_ITEM.VL_DESCONTO_MOEDA'
    end
    object FloatField17: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TPO_ITEM.VL_UNITARIO'
    end
    object FloatField18: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'TPO_ITEM.VL_TOTAL'
    end
    object FloatField19: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TPO_ITEM.VL_DESCONTO'
    end
    object FloatField20: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'TPO_ITEM.VL_COMISSAO'
    end
    object FloatField21: TFloatField
      FieldName = 'VL_ESPEC_II'
      Origin = 'TPO_ITEM.VL_ESPEC_II'
    end
    object FloatField22: TFloatField
      FieldName = 'VL_ESPEC_IPI'
      Origin = 'TPO_ITEM.VL_ESPEC_IPI'
    end
    object FloatField23: TFloatField
      FieldName = 'VL_ESPEC_AD'
      Origin = 'TPO_ITEM.VL_ESPEC_AD'
    end
    object FloatField24: TFloatField
      FieldName = 'VL_TOTAL_PARCELAS'
      Origin = 'TPO_ITEM.VL_TOTAL_PARCELAS'
    end
    object FloatField25: TFloatField
      FieldName = 'VL_COBERT_ACIMA_360'
      Origin = 'TPO_ITEM.VL_COBERT_ACIMA_360'
    end
    object FloatField26: TFloatField
      FieldName = 'VL_PAGTO_ANTECIPADO'
      Origin = 'TPO_ITEM.VL_PAGTO_ANTECIPADO'
    end
    object FloatField27: TFloatField
      FieldName = 'VL_PAGTO_AVISTA'
      Origin = 'TPO_ITEM.VL_PAGTO_AVISTA'
    end
    object FloatField28: TFloatField
      FieldName = 'VL_FRETE_NAC_MOEDA'
      Origin = 'TPO_ITEM.VL_FRETE_NAC_MOEDA'
    end
    object FloatField29: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
      Origin = 'TPO_ITEM.VL_SEGURO_MOEDA'
    end
    object FloatField30: TFloatField
      FieldName = 'VL_ACRESC_MOEDA'
      Origin = 'TPO_ITEM.VL_ACRESC_MOEDA'
    end
    object FloatField31: TFloatField
      FieldName = 'VL_DEDUC_MOEDA'
      Origin = 'TPO_ITEM.VL_DEDUC_MOEDA'
    end
    object FloatField32: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MOEDA'
      Origin = 'TPO_ITEM.VL_FRETE_PREPAID_MOEDA'
    end
    object FloatField33: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'TPO_ITEM.VL_FRETE_COLLECT'
    end
    object StringField85: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPO_ITEM.IN_SELECIONADO'
      Size = 1
    end
    object FloatField34: TFloatField
      FieldName = 'QT_BAIXAR'
      Origin = 'TPO_ITEM.QT_BAIXAR'
    end
    object FloatField35: TFloatField
      FieldName = 'QT_DISPONIVEL'
      Origin = 'TPO_ITEM.QT_DISPONIVEL'
    end
    object StringField86: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPO_ITEM.IN_MONTADO'
      Size = 1
    end
    object StringField87: TStringField
      FieldName = 'IN_FABR_EXP_PROD'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 1
    end
    object StringField88: TStringField
      FieldName = 'NR_ANO_EX_NCM'
      Origin = 'TPO_ITEM.NR_ITEM'
      Size = 4
    end
    object StringField89: TStringField
      FieldName = 'NR_NUM_EX_NCM'
      Origin = 'TPO_ITEM.CD_EXPORTADOR'
      Size = 6
    end
    object BooleanField4: TBooleanField
      FieldName = 'IN_IND_COND_MERC'
      Origin = 'TPO_ITEM.CD_NALADI_SH'
    end
    object StringField90: TStringField
      FieldName = 'NM_LOCAL_INCOTERM'
      Origin = 'TPO_ITEM.CD_PAIS_AQUISICAO'
      Size = 10
    end
    object StringField91: TStringField
      FieldName = 'NM_TIPO_AL_AD'
      Origin = 'TPO_ITEM.CD_MERCADORIA'
      Size = 10
    end
    object StringField92: TStringField
      FieldName = 'IN_IND_PERIODICIDADE'
      Origin = 'TPO_ITEM.CD_FABRICANTE'
      Size = 1
    end
    object StringField93: TStringField
      FieldName = 'IN_REG_TRIB_IPI'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 1
    end
  end
  object qry_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, CD_UN_MED_CO' +
        'MERC, PL_MERCADORIA, VL_UNITARIO, CD_TIPO_CALCULO, CD_FABR_EXPO,' +
        ' CD_EXPORTADOR,'
      
        '       CD_FABRICANTE, CD_PAIS_ORIGEM, CD_PAIS_AQUISICAO, CD_NCM_' +
        'SH, CD_NALADI_SH, CD_NALADI_NCCA, CD_IMPORTADOR, CD_GRUPO'
      'FROM   TMERCADORIA'
      'WHERE  CD_MERCADORIA = :CD_MERCADORIA')
    Left = 234
    Top = 235
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_mercadoria_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 30
    end
    object qry_mercadoria_NM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      Origin = 'TMERCADORIA.NM_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_mercadoria_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 25
    end
    object qry_mercadoria_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 3
    end
    object qry_mercadoria_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TMERCADORIA.NM_MERCADORIA'
    end
    object qry_mercadoria_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
    end
    object qry_mercadoria_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TMERCADORIA.CD_UN_MED_COMERC'
      Size = 1
    end
    object qry_mercadoria_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TMERCADORIA.PL_MERCADORIA'
      Size = 1
    end
    object qry_mercadoria_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TMERCADORIA.VL_UNITARIO'
      Size = 5
    end
    object qry_mercadoria_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TMERCADORIA.CD_TIPO_CALCULO'
      Size = 5
    end
    object qry_mercadoria_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TMERCADORIA.CD_FABR_EXPO'
      Size = 3
    end
    object qry_mercadoria_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TMERCADORIA.CD_EXPORTADOR'
      Size = 3
    end
    object qry_mercadoria_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TMERCADORIA.CD_FABRICANTE'
      Size = 11
    end
    object qry_mercadoria_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TMERCADORIA.CD_PAIS_ORIGEM'
      Size = 8
    end
    object qry_mercadoria_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'TMERCADORIA.CD_PAIS_AQUISICAO'
      Size = 7
    end
    object qry_mercadoria_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 5
    end
    object qry_mercadoria_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 3
    end
  end
  object qry_ult_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(EE.CD_EMPRESA) ULTIMO'
      'FROM  TEMPRESA_EST EE')
    Left = 33
    Top = 235
    object qry_ult_emp_est_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
  end
  object qry_unid_medida_broker_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA, NM_SIGLA'
      'FROM   TUNID_MEDIDA_BROKER'
      'WHERE  NM_SIGLA = :NM_SIGLA')
    Left = 127
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'NM_SIGLA'
        ParamType = ptUnknown
      end>
    object qry_unid_medida_broker_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'TUNID_MEDIDA_BROKER.CD_UNID_MEDIDA'
      Size = 3
    end
    object qry_unid_medida_broker_NM_UNID_MEDIDA: TStringField
      FieldName = 'NM_UNID_MEDIDA'
      Origin = 'TUNID_MEDIDA_BROKER.NM_UNID_MEDIDA'
      Size = 50
    end
    object qry_unid_medida_broker_NM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      Origin = 'TUNID_MEDIDA_BROKER.NM_SIGLA'
      Size = 3
    end
  end
  object qry_de_para_: TQuery
    DatabaseName = 'DBBROKER'
    Filtered = True
    SQL.Strings = (
      'SELECT CD_DDBROKER'
      'FROM TDE_PARA'
      
        'WHERE (CD_TABELA = :CD_TABELA) AND (CD_EXTERNO = :CD_EXTERNO) AN' +
        'D (CD_UNID_NEG = :CD_UNID_NEG) AND (CD_PRODUTO = '#39'01'#39')'
      ''
      '')
    Left = 338
    Top = 312
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
    object qry_de_para_CD_DDBROKER: TStringField
      FieldName = 'CD_DDBROKER'
      Origin = 'TDE_PARA.CD_DDBROKER'
      Size = 5
    end
  end
  object qry_po_int_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TPO'
      'WHERE  CD_USUARIO_INT = :CD_USUARIO')
    Left = 33
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object StringField94: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object StringField95: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'TPO.NR_IDENT_USUARIO'
      Size = 15
    end
    object StringField96: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 5
    end
    object StringField97: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      Origin = 'TPO.CD_CONSIGNATARIO'
      Size = 5
    end
    object StringField98: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPO.CD_FABRICANTE'
      Size = 5
    end
    object StringField99: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPO.CD_EXPORTADOR'
      Size = 5
    end
    object StringField100: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TPO.CD_VIA_TRANSP'
      Size = 2
    end
    object StringField101: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'TPO.CD_REPRESENTANTE'
      Size = 5
    end
    object StringField102: TStringField
      FieldName = 'CD_MOD_PAGAMENTO'
      Origin = 'TPO.CD_MOD_PAGAMENTO'
      Size = 2
    end
    object StringField103: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPO.CD_PAIS_ORIGEM'
      Size = 3
    end
    object StringField104: TStringField
      FieldName = 'CD_REGIME_TRIB'
      Origin = 'TPO.CD_REGIME_TRIB'
      Size = 1
    end
    object StringField105: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TPO.CD_PAIS_PROCEDENCIA'
      Size = 3
    end
    object StringField106: TStringField
      FieldName = 'CD_MOEDA_NEG'
      Origin = 'TPO.CD_MOEDA_NEG'
      Size = 3
    end
    object StringField107: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TPO.CD_PAIS_AQUISICAO'
      Size = 3
    end
    object StringField108: TStringField
      FieldName = 'CD_TP_DECLARACAO'
      Origin = 'TPO.CD_TP_DECLARACAO'
      Size = 2
    end
    object StringField109: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TPO.CD_URF_DESPACHO'
      Size = 7
    end
    object StringField110: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPO.CD_INCOTERM'
      Size = 3
    end
    object StringField111: TStringField
      FieldName = 'CD_TRANSP_INTERN'
      Origin = 'TPO.CD_TRANSP_INTERN'
      Size = 4
    end
    object StringField112: TStringField
      FieldName = 'CD_BANDEIRA_VEIC'
      Origin = 'TPO.CD_BANDEIRA_VEIC'
      Size = 3
    end
    object StringField113: TStringField
      FieldName = 'CD_SETOR_ARMAZENAGEM'
      Origin = 'TPO.CD_SETOR_ARMAZENAGEM'
      Size = 3
    end
    object StringField114: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'TPO.CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object StringField115: TStringField
      FieldName = 'CD_AGENTE_CARGA'
      Origin = 'TPO.CD_AGENTE_CARGA'
      Size = 4
    end
    object StringField116: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'TPO.CD_URF_ENTRADA'
      Size = 7
    end
    object StringField117: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Origin = 'TPO.CD_RECINTO_ALFAND'
      Size = 7
    end
    object StringField118: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TPO.CD_MOEDA_FRETE'
      Size = 3
    end
    object StringField119: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TPO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object StringField120: TStringField
      FieldName = 'CD_MOEDA_CARGA'
      Origin = 'TPO.CD_MOEDA_CARGA'
      Size = 3
    end
    object StringField121: TStringField
      FieldName = 'CD_LOCAL_INCOTERM'
      Origin = 'TPO.CD_LOCAL_INCOTERM'
      Size = 10
    end
    object StringField122: TStringField
      FieldName = 'CD_TX_JUROS'
      Origin = 'TPO.CD_TX_JUROS'
      Size = 4
    end
    object StringField123: TStringField
      FieldName = 'CD_INSTIT_FINANC'
      Origin = 'TPO.CD_INSTIT_FINANC'
      Size = 2
    end
    object StringField124: TStringField
      FieldName = 'CD_MOTIVO_CAMBIO_SEM_COBERT'
      Origin = 'TPO.CD_MOTIVO_CAMBIO_SEM_COBERT'
      Size = 2
    end
    object StringField125: TStringField
      FieldName = 'CD_BARRA'
      Origin = 'TPO.CD_BARRA'
      Size = 11
    end
    object StringField126: TStringField
      FieldName = 'CD_MET_VALORACAO_ADUAN'
      Origin = 'TPO.CD_MET_VALORACAO_ADUAN'
      Size = 2
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPO.DT_ABERTURA'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DT_EMISSAO_DOC_CARGA'
      Origin = 'TPO.DT_EMISSAO_DOC_CARGA'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'TPO.DT_CHEGADA_CARGA'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPO.DT_FATURA'
    end
    object StringField127: TStringField
      FieldName = 'IN_APLICACAO_MERC'
      Origin = 'TPO.IN_APLICACAO_MERC'
      Size = 1
    end
    object BooleanField5: TBooleanField
      FieldName = 'IN_COMISSAO'
      Origin = 'TPO.IN_COMISSAO'
    end
    object BooleanField6: TBooleanField
      FieldName = 'IN_DESCONTO'
      Origin = 'TPO.IN_DESCONTO'
    end
    object StringField128: TStringField
      FieldName = 'IN_TP_COMISSAO'
      Origin = 'TPO.IN_TP_COMISSAO'
      Size = 1
    end
    object StringField129: TStringField
      FieldName = 'IN_TP_DESCONTO'
      Origin = 'TPO.IN_TP_DESCONTO'
      Size = 1
    end
    object BooleanField7: TBooleanField
      FieldName = 'IN_INDICADOR_CONSIG_IMPORT'
      Origin = 'TPO.IN_INDICADOR_CONSIG_IMPORT'
    end
    object StringField130: TStringField
      FieldName = 'IN_INDICADOR_PROC'
      Origin = 'TPO.IN_INDICADOR_PROC'
      Size = 1
    end
    object StringField131: TStringField
      FieldName = 'IN_VINC_IMPO_EXPO'
      Origin = 'TPO.IN_VINC_IMPO_EXPO'
      Size = 1
    end
    object StringField132: TStringField
      FieldName = 'IN_COND_MERCADORIA'
      Origin = 'TPO.IN_COND_MERCADORIA'
      Size = 1
    end
    object StringField133: TStringField
      FieldName = 'IN_FABR_EXPOR_IMP'
      Origin = 'TPO.IN_FABR_EXPOR_IMP'
      Size = 1
    end
    object BooleanField8: TBooleanField
      FieldName = 'IN_INDIC_MULTMODAL'
      Origin = 'TPO.IN_INDIC_MULTMODAL'
    end
    object BooleanField9: TBooleanField
      FieldName = 'IN_FUNDAP'
      Origin = 'TPO.IN_FUNDAP'
    end
    object StringField134: TStringField
      FieldName = 'IN_UTILIZ_CARGA'
      Origin = 'TPO.IN_UTILIZ_CARGA'
      Size = 1
    end
    object BooleanField10: TBooleanField
      FieldName = 'IN_INDIC_TX_JUROS'
      Origin = 'TPO.IN_INDIC_TX_JUROS'
    end
    object StringField135: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'TPO.IN_SEGURO'
      Size = 1
    end
    object StringField136: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      Origin = 'TPO.NR_PLACA_VEICULO'
      Size = 15
    end
    object StringField137: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TPO.NR_MANIFESTO'
      Size = 15
    end
    object StringField138: TStringField
      FieldName = 'NR_DOC_MASTER'
      Origin = 'TPO.NR_DOC_MASTER'
      Size = 30
    end
    object StringField139: TStringField
      FieldName = 'NR_DOC_HOUSE'
      Origin = 'TPO.NR_DOC_HOUSE'
      Size = 30
    end
    object StringField140: TStringField
      FieldName = 'NR_BACEN'
      Origin = 'TPO.NR_BACEN'
      Size = 8
    end
    object StringField141: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPO.NR_FATURA'
      Size = 15
    end
    object StringField142: TStringField
      FieldName = 'NM_IDENT_CRT'
      Origin = 'TPO.NM_IDENT_CRT'
      Size = 11
    end
    object StringField143: TStringField
      FieldName = 'NM_VEICULO'
      Origin = 'TPO.NM_VEICULO'
      Size = 30
    end
    object FloatField36: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'TPO.PC_COMISSAO'
    end
    object FloatField37: TFloatField
      FieldName = 'PC_DESCONTO'
      Origin = 'TPO.PC_DESCONTO'
    end
    object FloatField38: TFloatField
      FieldName = 'PC_SEGURO'
      Origin = 'TPO.PC_SEGURO'
    end
    object FloatField39: TFloatField
      FieldName = 'PC_COMISSAO_AGENTE'
      Origin = 'TPO.PC_COMISSAO_AGENTE'
    end
    object FloatField40: TFloatField
      FieldName = 'PL_PO'
      Origin = 'TPO.PL_PO'
    end
    object FloatField41: TFloatField
      FieldName = 'PB_PO'
      Origin = 'TPO.PB_PO'
    end
    object FloatField42: TFloatField
      FieldName = 'QT_TOTAL_PESO'
      Origin = 'TPO.QT_TOTAL_PESO'
    end
    object FloatField43: TFloatField
      FieldName = 'QT_PORC_ICMS'
      Origin = 'TPO.QT_PORC_ICMS'
    end
    object StringField144: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPO.QT_TOTAL_ITENS'
      Size = 3
    end
    object FloatField44: TFloatField
      FieldName = 'QT_PORC_RED_ICMS'
      Origin = 'TPO.QT_PORC_RED_ICMS'
    end
    object StringField145: TStringField
      FieldName = 'QT_PERIODICIDADE'
      Origin = 'TPO.QT_PERIODICIDADE'
      Size = 3
    end
    object StringField146: TStringField
      FieldName = 'TP_COBERT_CAMBIO'
      Origin = 'TPO.TP_COBERT_CAMBIO'
      Size = 1
    end
    object BooleanField11: TBooleanField
      FieldName = 'TP_CAMBIO'
      Origin = 'TPO.TP_CAMBIO'
    end
    object StringField147: TStringField
      FieldName = 'TP_DOC_CARGA'
      Origin = 'TPO.TP_DOC_CARGA'
      Size = 2
    end
    object StringField148: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'TPO.TP_FRETE'
      Size = 1
    end
    object StringField149: TStringField
      FieldName = 'TP_SEGURO'
      Origin = 'TPO.TP_SEGURO'
      Size = 1
    end
    object StringField150: TStringField
      FieldName = 'TP_MOD_DESPACHO'
      Origin = 'TPO.TP_MOD_DESPACHO'
      Size = 1
    end
    object StringField151: TStringField
      FieldName = 'TP_MANIFESTO'
      Origin = 'TPO.TP_MANIFESTO'
      Size = 1
    end
    object FloatField45: TFloatField
      FieldName = 'TX_JUROS'
      Origin = 'TPO.TX_JUROS'
    end
    object MemoField2: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'TPO.TX_OBSERVACAO'
      BlobType = ftMemo
    end
    object FloatField46: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'TPO.VL_COMISSAO'
    end
    object FloatField47: TFloatField
      FieldName = 'VL_CARGA'
      Origin = 'TPO.VL_CARGA'
    end
    object FloatField48: TFloatField
      FieldName = 'VL_CAMBIO'
      Origin = 'TPO.VL_CAMBIO'
    end
    object FloatField49: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TPO.VL_DESCONTO'
    end
    object FloatField50: TFloatField
      FieldName = 'VL_FRETE_PREPAID'
      Origin = 'TPO.VL_FRETE_PREPAID'
    end
    object FloatField51: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'TPO.VL_FRETE_COLLECT'
    end
    object FloatField52: TFloatField
      FieldName = 'VL_FRETE_TERRIT_NAC'
      Origin = 'TPO.VL_FRETE_TERRIT_NAC'
    end
    object FloatField53: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPO.VL_SEGURO'
    end
    object FloatField54: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'TPO.VL_TOTAL'
    end
    object FloatField55: TFloatField
      FieldName = 'VL_TOTAL_PARCELA'
      Origin = 'TPO.VL_TOTAL_PARCELA'
    end
    object FloatField56: TFloatField
      FieldName = 'VL_PAGTO_ANTECIPADO'
      Origin = 'TPO.VL_PAGTO_ANTECIPADO'
    end
    object FloatField57: TFloatField
      FieldName = 'VL_PAGTO_VISTA'
      Origin = 'TPO.VL_PAGTO_VISTA'
    end
    object FloatField58: TFloatField
      FieldName = 'VL_PERIODIC_MENSAL'
      Origin = 'TPO.VL_PERIODIC_MENSAL'
    end
    object FloatField59: TFloatField
      FieldName = 'VL_DESPESAS'
      Origin = 'TPO.VL_DESPESAS'
    end
    object FloatField60: TFloatField
      FieldName = 'VL_DESCONTOS'
      Origin = 'TPO.VL_DESCONTOS'
    end
    object StringField152: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPO.IN_SELECIONADO'
      Size = 1
    end
    object StringField153: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPO.IN_MONTADO'
      Size = 1
    end
    object BooleanField12: TBooleanField
      FieldName = 'IN_IND_COND_MERC'
      Origin = 'TPO.NR_PROCESSO'
    end
    object BooleanField13: TBooleanField
      FieldName = 'IN_IND_CAMBIO_ITENS'
      Origin = 'TPO.NR_IDENT_USUARIO'
    end
    object StringField154: TStringField
      FieldName = 'NR_PARCELAS'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 3
    end
    object StringField155: TStringField
      FieldName = 'IN_PERIODICIDADE'
      Origin = 'TPO.CD_CONSIGNATARIO'
      Size = 1
    end
    object FloatField61: TFloatField
      FieldName = 'QT_TOTAL_DISPONIVEL'
      Origin = 'TPO.NR_PROCESSO'
    end
    object StringField156: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'TPO.CD_VIA_TRANSP'
      Size = 4
    end
    object StringField157: TStringField
      FieldName = 'CD_USUARIO_INT'
      Origin = 'TPO.CD_AGENTE_CARGA'
      Size = 4
    end
  end
  object sp_aviso_drawback: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_aviso_drawback'
    Left = 438
    Top = 24
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
  object qry_atz_po_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TPO'
      'SET    CD_USUARIO_INT = '#39#39
      'WHERE  CD_USUARIO_INT = :CD_USUARIO')
    Left = 127
    Top = 312
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object StringField158: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object StringField159: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'TPO.NR_IDENT_USUARIO'
      Size = 15
    end
    object StringField160: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 5
    end
    object StringField161: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      Origin = 'TPO.CD_CONSIGNATARIO'
      Size = 5
    end
    object StringField162: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPO.CD_FABRICANTE'
      Size = 5
    end
    object StringField163: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPO.CD_EXPORTADOR'
      Size = 5
    end
    object StringField164: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TPO.CD_VIA_TRANSP'
      Size = 2
    end
    object StringField165: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'TPO.CD_REPRESENTANTE'
      Size = 5
    end
    object StringField166: TStringField
      FieldName = 'CD_MOD_PAGAMENTO'
      Origin = 'TPO.CD_MOD_PAGAMENTO'
      Size = 2
    end
    object StringField167: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPO.CD_PAIS_ORIGEM'
      Size = 3
    end
    object StringField168: TStringField
      FieldName = 'CD_REGIME_TRIB'
      Origin = 'TPO.CD_REGIME_TRIB'
      Size = 1
    end
    object StringField169: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TPO.CD_PAIS_PROCEDENCIA'
      Size = 3
    end
    object StringField170: TStringField
      FieldName = 'CD_MOEDA_NEG'
      Origin = 'TPO.CD_MOEDA_NEG'
      Size = 3
    end
    object StringField171: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TPO.CD_PAIS_AQUISICAO'
      Size = 3
    end
    object StringField172: TStringField
      FieldName = 'CD_TP_DECLARACAO'
      Origin = 'TPO.CD_TP_DECLARACAO'
      Size = 2
    end
    object StringField173: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TPO.CD_URF_DESPACHO'
      Size = 7
    end
    object StringField174: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPO.CD_INCOTERM'
      Size = 3
    end
    object StringField175: TStringField
      FieldName = 'CD_TRANSP_INTERN'
      Origin = 'TPO.CD_TRANSP_INTERN'
      Size = 4
    end
    object StringField176: TStringField
      FieldName = 'CD_BANDEIRA_VEIC'
      Origin = 'TPO.CD_BANDEIRA_VEIC'
      Size = 3
    end
    object StringField177: TStringField
      FieldName = 'CD_SETOR_ARMAZENAGEM'
      Origin = 'TPO.CD_SETOR_ARMAZENAGEM'
      Size = 3
    end
    object StringField178: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'TPO.CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object StringField179: TStringField
      FieldName = 'CD_AGENTE_CARGA'
      Origin = 'TPO.CD_AGENTE_CARGA'
      Size = 4
    end
    object StringField180: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'TPO.CD_URF_ENTRADA'
      Size = 7
    end
    object StringField181: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Origin = 'TPO.CD_RECINTO_ALFAND'
      Size = 7
    end
    object StringField182: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TPO.CD_MOEDA_FRETE'
      Size = 3
    end
    object StringField183: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TPO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object StringField184: TStringField
      FieldName = 'CD_MOEDA_CARGA'
      Origin = 'TPO.CD_MOEDA_CARGA'
      Size = 3
    end
    object StringField185: TStringField
      FieldName = 'CD_LOCAL_INCOTERM'
      Origin = 'TPO.CD_LOCAL_INCOTERM'
      Size = 10
    end
    object StringField186: TStringField
      FieldName = 'CD_TX_JUROS'
      Origin = 'TPO.CD_TX_JUROS'
      Size = 4
    end
    object StringField187: TStringField
      FieldName = 'CD_INSTIT_FINANC'
      Origin = 'TPO.CD_INSTIT_FINANC'
      Size = 2
    end
    object StringField188: TStringField
      FieldName = 'CD_MOTIVO_CAMBIO_SEM_COBERT'
      Origin = 'TPO.CD_MOTIVO_CAMBIO_SEM_COBERT'
      Size = 2
    end
    object StringField189: TStringField
      FieldName = 'CD_BARRA'
      Origin = 'TPO.CD_BARRA'
      Size = 11
    end
    object StringField190: TStringField
      FieldName = 'CD_MET_VALORACAO_ADUAN'
      Origin = 'TPO.CD_MET_VALORACAO_ADUAN'
      Size = 2
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPO.DT_ABERTURA'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'DT_EMISSAO_DOC_CARGA'
      Origin = 'TPO.DT_EMISSAO_DOC_CARGA'
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'TPO.DT_CHEGADA_CARGA'
    end
    object DateTimeField8: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPO.DT_FATURA'
    end
    object StringField191: TStringField
      FieldName = 'IN_APLICACAO_MERC'
      Origin = 'TPO.IN_APLICACAO_MERC'
      Size = 1
    end
    object BooleanField14: TBooleanField
      FieldName = 'IN_COMISSAO'
      Origin = 'TPO.IN_COMISSAO'
    end
    object BooleanField15: TBooleanField
      FieldName = 'IN_DESCONTO'
      Origin = 'TPO.IN_DESCONTO'
    end
    object StringField192: TStringField
      FieldName = 'IN_TP_COMISSAO'
      Origin = 'TPO.IN_TP_COMISSAO'
      Size = 1
    end
    object StringField193: TStringField
      FieldName = 'IN_TP_DESCONTO'
      Origin = 'TPO.IN_TP_DESCONTO'
      Size = 1
    end
    object BooleanField16: TBooleanField
      FieldName = 'IN_INDICADOR_CONSIG_IMPORT'
      Origin = 'TPO.IN_INDICADOR_CONSIG_IMPORT'
    end
    object StringField194: TStringField
      FieldName = 'IN_INDICADOR_PROC'
      Origin = 'TPO.IN_INDICADOR_PROC'
      Size = 1
    end
    object StringField195: TStringField
      FieldName = 'IN_VINC_IMPO_EXPO'
      Origin = 'TPO.IN_VINC_IMPO_EXPO'
      Size = 1
    end
    object StringField196: TStringField
      FieldName = 'IN_COND_MERCADORIA'
      Origin = 'TPO.IN_COND_MERCADORIA'
      Size = 1
    end
    object StringField197: TStringField
      FieldName = 'IN_FABR_EXPOR_IMP'
      Origin = 'TPO.IN_FABR_EXPOR_IMP'
      Size = 1
    end
    object BooleanField17: TBooleanField
      FieldName = 'IN_INDIC_MULTMODAL'
      Origin = 'TPO.IN_INDIC_MULTMODAL'
    end
    object BooleanField18: TBooleanField
      FieldName = 'IN_FUNDAP'
      Origin = 'TPO.IN_FUNDAP'
    end
    object StringField198: TStringField
      FieldName = 'IN_UTILIZ_CARGA'
      Origin = 'TPO.IN_UTILIZ_CARGA'
      Size = 1
    end
    object BooleanField19: TBooleanField
      FieldName = 'IN_INDIC_TX_JUROS'
      Origin = 'TPO.IN_INDIC_TX_JUROS'
    end
    object StringField199: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'TPO.IN_SEGURO'
      Size = 1
    end
    object StringField200: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      Origin = 'TPO.NR_PLACA_VEICULO'
      Size = 15
    end
    object StringField201: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TPO.NR_MANIFESTO'
      Size = 15
    end
    object StringField202: TStringField
      FieldName = 'NR_DOC_MASTER'
      Origin = 'TPO.NR_DOC_MASTER'
      Size = 30
    end
    object StringField203: TStringField
      FieldName = 'NR_DOC_HOUSE'
      Origin = 'TPO.NR_DOC_HOUSE'
      Size = 30
    end
    object StringField204: TStringField
      FieldName = 'NR_BACEN'
      Origin = 'TPO.NR_BACEN'
      Size = 8
    end
    object StringField205: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPO.NR_FATURA'
      Size = 15
    end
    object StringField206: TStringField
      FieldName = 'NM_IDENT_CRT'
      Origin = 'TPO.NM_IDENT_CRT'
      Size = 11
    end
    object StringField207: TStringField
      FieldName = 'NM_VEICULO'
      Origin = 'TPO.NM_VEICULO'
      Size = 30
    end
    object FloatField62: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'TPO.PC_COMISSAO'
    end
    object FloatField63: TFloatField
      FieldName = 'PC_DESCONTO'
      Origin = 'TPO.PC_DESCONTO'
    end
    object FloatField64: TFloatField
      FieldName = 'PC_SEGURO'
      Origin = 'TPO.PC_SEGURO'
    end
    object FloatField65: TFloatField
      FieldName = 'PC_COMISSAO_AGENTE'
      Origin = 'TPO.PC_COMISSAO_AGENTE'
    end
    object FloatField66: TFloatField
      FieldName = 'PL_PO'
      Origin = 'TPO.PL_PO'
    end
    object FloatField67: TFloatField
      FieldName = 'PB_PO'
      Origin = 'TPO.PB_PO'
    end
    object FloatField68: TFloatField
      FieldName = 'QT_TOTAL_PESO'
      Origin = 'TPO.QT_TOTAL_PESO'
    end
    object FloatField69: TFloatField
      FieldName = 'QT_PORC_ICMS'
      Origin = 'TPO.QT_PORC_ICMS'
    end
    object StringField208: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPO.QT_TOTAL_ITENS'
      Size = 3
    end
    object FloatField70: TFloatField
      FieldName = 'QT_PORC_RED_ICMS'
      Origin = 'TPO.QT_PORC_RED_ICMS'
    end
    object StringField209: TStringField
      FieldName = 'QT_PERIODICIDADE'
      Origin = 'TPO.QT_PERIODICIDADE'
      Size = 3
    end
    object StringField210: TStringField
      FieldName = 'TP_COBERT_CAMBIO'
      Origin = 'TPO.TP_COBERT_CAMBIO'
      Size = 1
    end
    object BooleanField20: TBooleanField
      FieldName = 'TP_CAMBIO'
      Origin = 'TPO.TP_CAMBIO'
    end
    object StringField211: TStringField
      FieldName = 'TP_DOC_CARGA'
      Origin = 'TPO.TP_DOC_CARGA'
      Size = 2
    end
    object StringField212: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'TPO.TP_FRETE'
      Size = 1
    end
    object StringField213: TStringField
      FieldName = 'TP_SEGURO'
      Origin = 'TPO.TP_SEGURO'
      Size = 1
    end
    object StringField214: TStringField
      FieldName = 'TP_MOD_DESPACHO'
      Origin = 'TPO.TP_MOD_DESPACHO'
      Size = 1
    end
    object StringField215: TStringField
      FieldName = 'TP_MANIFESTO'
      Origin = 'TPO.TP_MANIFESTO'
      Size = 1
    end
    object FloatField71: TFloatField
      FieldName = 'TX_JUROS'
      Origin = 'TPO.TX_JUROS'
    end
    object MemoField3: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'TPO.TX_OBSERVACAO'
      BlobType = ftMemo
    end
    object FloatField72: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'TPO.VL_COMISSAO'
    end
    object FloatField73: TFloatField
      FieldName = 'VL_CARGA'
      Origin = 'TPO.VL_CARGA'
    end
    object FloatField74: TFloatField
      FieldName = 'VL_CAMBIO'
      Origin = 'TPO.VL_CAMBIO'
    end
    object FloatField75: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TPO.VL_DESCONTO'
    end
    object FloatField76: TFloatField
      FieldName = 'VL_FRETE_PREPAID'
      Origin = 'TPO.VL_FRETE_PREPAID'
    end
    object FloatField77: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'TPO.VL_FRETE_COLLECT'
    end
    object FloatField78: TFloatField
      FieldName = 'VL_FRETE_TERRIT_NAC'
      Origin = 'TPO.VL_FRETE_TERRIT_NAC'
    end
    object FloatField79: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPO.VL_SEGURO'
    end
    object FloatField80: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'TPO.VL_TOTAL'
    end
    object FloatField81: TFloatField
      FieldName = 'VL_TOTAL_PARCELA'
      Origin = 'TPO.VL_TOTAL_PARCELA'
    end
    object FloatField82: TFloatField
      FieldName = 'VL_PAGTO_ANTECIPADO'
      Origin = 'TPO.VL_PAGTO_ANTECIPADO'
    end
    object FloatField83: TFloatField
      FieldName = 'VL_PAGTO_VISTA'
      Origin = 'TPO.VL_PAGTO_VISTA'
    end
    object FloatField84: TFloatField
      FieldName = 'VL_PERIODIC_MENSAL'
      Origin = 'TPO.VL_PERIODIC_MENSAL'
    end
    object FloatField85: TFloatField
      FieldName = 'VL_DESPESAS'
      Origin = 'TPO.VL_DESPESAS'
    end
    object FloatField86: TFloatField
      FieldName = 'VL_DESCONTOS'
      Origin = 'TPO.VL_DESCONTOS'
    end
    object StringField216: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPO.IN_SELECIONADO'
      Size = 1
    end
    object StringField217: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPO.IN_MONTADO'
      Size = 1
    end
    object BooleanField21: TBooleanField
      FieldName = 'IN_IND_COND_MERC'
      Origin = 'TPO.NR_PROCESSO'
    end
    object BooleanField22: TBooleanField
      FieldName = 'IN_IND_CAMBIO_ITENS'
      Origin = 'TPO.NR_IDENT_USUARIO'
    end
    object StringField218: TStringField
      FieldName = 'NR_PARCELAS'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 3
    end
    object StringField219: TStringField
      FieldName = 'IN_PERIODICIDADE'
      Origin = 'TPO.CD_CONSIGNATARIO'
      Size = 1
    end
    object FloatField87: TFloatField
      FieldName = 'QT_TOTAL_DISPONIVEL'
      Origin = 'TPO.NR_PROCESSO'
    end
    object StringField220: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'TPO.CD_VIA_TRANSP'
      Size = 4
    end
    object StringField221: TStringField
      FieldName = 'CD_USUARIO_INT'
      Origin = 'TPO.CD_AGENTE_CARGA'
      Size = 4
    end
  end
  object qry_merc_com_ato_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.NR_PROCESSO, I.NR_ITEM, I.QT_INICIAL, I.CD_MERCADORIA, ' +
        'M.AP_MERCADORIA'
      'FROM   TPO_ITEM I, TMERCADORIA M'
      'WHERE  I.CD_MERCADORIA = M.CD_MERCADORIA AND'
      '       M.IN_ATO_DRAWBACK = '#39'1'#39' AND'
      '       I.IN_AVISO_DB = '#39'1'#39' AND'
      '       I.NR_PROCESSO = :NR_PROCESSO'
      
        'GROUP BY I.NR_PROCESSO, I.NR_ITEM, I.QT_INICIAL, I.CD_MERCADORIA' +
        ', M.AP_MERCADORIA'
      '')
    Left = 234
    Top = 312
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_atz_po_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TPO_ITEM'
      'SET    IN_AVISO_DB = '#39'0'#39
      'FROM   TPO_ITEM I, TPO P'
      'WHERE  I.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_USUARIO_INT = :CD_USUARIO')
    Left = 234
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object StringField222: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object StringField223: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'TPO.NR_IDENT_USUARIO'
      Size = 15
    end
    object StringField224: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 5
    end
    object StringField225: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      Origin = 'TPO.CD_CONSIGNATARIO'
      Size = 5
    end
    object StringField226: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPO.CD_FABRICANTE'
      Size = 5
    end
    object StringField227: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPO.CD_EXPORTADOR'
      Size = 5
    end
    object StringField228: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TPO.CD_VIA_TRANSP'
      Size = 2
    end
    object StringField229: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'TPO.CD_REPRESENTANTE'
      Size = 5
    end
    object StringField230: TStringField
      FieldName = 'CD_MOD_PAGAMENTO'
      Origin = 'TPO.CD_MOD_PAGAMENTO'
      Size = 2
    end
    object StringField231: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPO.CD_PAIS_ORIGEM'
      Size = 3
    end
    object StringField232: TStringField
      FieldName = 'CD_REGIME_TRIB'
      Origin = 'TPO.CD_REGIME_TRIB'
      Size = 1
    end
    object StringField233: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TPO.CD_PAIS_PROCEDENCIA'
      Size = 3
    end
    object StringField234: TStringField
      FieldName = 'CD_MOEDA_NEG'
      Origin = 'TPO.CD_MOEDA_NEG'
      Size = 3
    end
    object StringField235: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TPO.CD_PAIS_AQUISICAO'
      Size = 3
    end
    object StringField236: TStringField
      FieldName = 'CD_TP_DECLARACAO'
      Origin = 'TPO.CD_TP_DECLARACAO'
      Size = 2
    end
    object StringField237: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TPO.CD_URF_DESPACHO'
      Size = 7
    end
    object StringField238: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPO.CD_INCOTERM'
      Size = 3
    end
    object StringField239: TStringField
      FieldName = 'CD_TRANSP_INTERN'
      Origin = 'TPO.CD_TRANSP_INTERN'
      Size = 4
    end
    object StringField240: TStringField
      FieldName = 'CD_BANDEIRA_VEIC'
      Origin = 'TPO.CD_BANDEIRA_VEIC'
      Size = 3
    end
    object StringField241: TStringField
      FieldName = 'CD_SETOR_ARMAZENAGEM'
      Origin = 'TPO.CD_SETOR_ARMAZENAGEM'
      Size = 3
    end
    object StringField242: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'TPO.CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object StringField243: TStringField
      FieldName = 'CD_AGENTE_CARGA'
      Origin = 'TPO.CD_AGENTE_CARGA'
      Size = 4
    end
    object StringField244: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'TPO.CD_URF_ENTRADA'
      Size = 7
    end
    object StringField245: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Origin = 'TPO.CD_RECINTO_ALFAND'
      Size = 7
    end
    object StringField246: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TPO.CD_MOEDA_FRETE'
      Size = 3
    end
    object StringField247: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TPO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object StringField248: TStringField
      FieldName = 'CD_MOEDA_CARGA'
      Origin = 'TPO.CD_MOEDA_CARGA'
      Size = 3
    end
    object StringField249: TStringField
      FieldName = 'CD_LOCAL_INCOTERM'
      Origin = 'TPO.CD_LOCAL_INCOTERM'
      Size = 10
    end
    object StringField250: TStringField
      FieldName = 'CD_TX_JUROS'
      Origin = 'TPO.CD_TX_JUROS'
      Size = 4
    end
    object StringField251: TStringField
      FieldName = 'CD_INSTIT_FINANC'
      Origin = 'TPO.CD_INSTIT_FINANC'
      Size = 2
    end
    object StringField252: TStringField
      FieldName = 'CD_MOTIVO_CAMBIO_SEM_COBERT'
      Origin = 'TPO.CD_MOTIVO_CAMBIO_SEM_COBERT'
      Size = 2
    end
    object StringField253: TStringField
      FieldName = 'CD_BARRA'
      Origin = 'TPO.CD_BARRA'
      Size = 11
    end
    object StringField254: TStringField
      FieldName = 'CD_MET_VALORACAO_ADUAN'
      Origin = 'TPO.CD_MET_VALORACAO_ADUAN'
      Size = 2
    end
    object DateTimeField9: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPO.DT_ABERTURA'
    end
    object DateTimeField10: TDateTimeField
      FieldName = 'DT_EMISSAO_DOC_CARGA'
      Origin = 'TPO.DT_EMISSAO_DOC_CARGA'
    end
    object DateTimeField11: TDateTimeField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'TPO.DT_CHEGADA_CARGA'
    end
    object DateTimeField12: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPO.DT_FATURA'
    end
    object StringField255: TStringField
      FieldName = 'IN_APLICACAO_MERC'
      Origin = 'TPO.IN_APLICACAO_MERC'
      Size = 1
    end
    object BooleanField23: TBooleanField
      FieldName = 'IN_COMISSAO'
      Origin = 'TPO.IN_COMISSAO'
    end
    object BooleanField24: TBooleanField
      FieldName = 'IN_DESCONTO'
      Origin = 'TPO.IN_DESCONTO'
    end
    object StringField256: TStringField
      FieldName = 'IN_TP_COMISSAO'
      Origin = 'TPO.IN_TP_COMISSAO'
      Size = 1
    end
    object StringField257: TStringField
      FieldName = 'IN_TP_DESCONTO'
      Origin = 'TPO.IN_TP_DESCONTO'
      Size = 1
    end
    object BooleanField25: TBooleanField
      FieldName = 'IN_INDICADOR_CONSIG_IMPORT'
      Origin = 'TPO.IN_INDICADOR_CONSIG_IMPORT'
    end
    object StringField258: TStringField
      FieldName = 'IN_INDICADOR_PROC'
      Origin = 'TPO.IN_INDICADOR_PROC'
      Size = 1
    end
    object StringField259: TStringField
      FieldName = 'IN_VINC_IMPO_EXPO'
      Origin = 'TPO.IN_VINC_IMPO_EXPO'
      Size = 1
    end
    object StringField260: TStringField
      FieldName = 'IN_COND_MERCADORIA'
      Origin = 'TPO.IN_COND_MERCADORIA'
      Size = 1
    end
    object StringField261: TStringField
      FieldName = 'IN_FABR_EXPOR_IMP'
      Origin = 'TPO.IN_FABR_EXPOR_IMP'
      Size = 1
    end
    object BooleanField26: TBooleanField
      FieldName = 'IN_INDIC_MULTMODAL'
      Origin = 'TPO.IN_INDIC_MULTMODAL'
    end
    object BooleanField27: TBooleanField
      FieldName = 'IN_FUNDAP'
      Origin = 'TPO.IN_FUNDAP'
    end
    object StringField262: TStringField
      FieldName = 'IN_UTILIZ_CARGA'
      Origin = 'TPO.IN_UTILIZ_CARGA'
      Size = 1
    end
    object BooleanField28: TBooleanField
      FieldName = 'IN_INDIC_TX_JUROS'
      Origin = 'TPO.IN_INDIC_TX_JUROS'
    end
    object StringField263: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'TPO.IN_SEGURO'
      Size = 1
    end
    object StringField264: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      Origin = 'TPO.NR_PLACA_VEICULO'
      Size = 15
    end
    object StringField265: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TPO.NR_MANIFESTO'
      Size = 15
    end
    object StringField266: TStringField
      FieldName = 'NR_DOC_MASTER'
      Origin = 'TPO.NR_DOC_MASTER'
      Size = 30
    end
    object StringField267: TStringField
      FieldName = 'NR_DOC_HOUSE'
      Origin = 'TPO.NR_DOC_HOUSE'
      Size = 30
    end
    object StringField268: TStringField
      FieldName = 'NR_BACEN'
      Origin = 'TPO.NR_BACEN'
      Size = 8
    end
    object StringField269: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPO.NR_FATURA'
      Size = 15
    end
    object StringField270: TStringField
      FieldName = 'NM_IDENT_CRT'
      Origin = 'TPO.NM_IDENT_CRT'
      Size = 11
    end
    object StringField271: TStringField
      FieldName = 'NM_VEICULO'
      Origin = 'TPO.NM_VEICULO'
      Size = 30
    end
    object FloatField88: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'TPO.PC_COMISSAO'
    end
    object FloatField89: TFloatField
      FieldName = 'PC_DESCONTO'
      Origin = 'TPO.PC_DESCONTO'
    end
    object FloatField90: TFloatField
      FieldName = 'PC_SEGURO'
      Origin = 'TPO.PC_SEGURO'
    end
    object FloatField91: TFloatField
      FieldName = 'PC_COMISSAO_AGENTE'
      Origin = 'TPO.PC_COMISSAO_AGENTE'
    end
    object FloatField92: TFloatField
      FieldName = 'PL_PO'
      Origin = 'TPO.PL_PO'
    end
    object FloatField93: TFloatField
      FieldName = 'PB_PO'
      Origin = 'TPO.PB_PO'
    end
    object FloatField94: TFloatField
      FieldName = 'QT_TOTAL_PESO'
      Origin = 'TPO.QT_TOTAL_PESO'
    end
    object FloatField95: TFloatField
      FieldName = 'QT_PORC_ICMS'
      Origin = 'TPO.QT_PORC_ICMS'
    end
    object StringField272: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPO.QT_TOTAL_ITENS'
      Size = 3
    end
    object FloatField96: TFloatField
      FieldName = 'QT_PORC_RED_ICMS'
      Origin = 'TPO.QT_PORC_RED_ICMS'
    end
    object StringField273: TStringField
      FieldName = 'QT_PERIODICIDADE'
      Origin = 'TPO.QT_PERIODICIDADE'
      Size = 3
    end
    object StringField274: TStringField
      FieldName = 'TP_COBERT_CAMBIO'
      Origin = 'TPO.TP_COBERT_CAMBIO'
      Size = 1
    end
    object BooleanField29: TBooleanField
      FieldName = 'TP_CAMBIO'
      Origin = 'TPO.TP_CAMBIO'
    end
    object StringField275: TStringField
      FieldName = 'TP_DOC_CARGA'
      Origin = 'TPO.TP_DOC_CARGA'
      Size = 2
    end
    object StringField276: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'TPO.TP_FRETE'
      Size = 1
    end
    object StringField277: TStringField
      FieldName = 'TP_SEGURO'
      Origin = 'TPO.TP_SEGURO'
      Size = 1
    end
    object StringField278: TStringField
      FieldName = 'TP_MOD_DESPACHO'
      Origin = 'TPO.TP_MOD_DESPACHO'
      Size = 1
    end
    object StringField279: TStringField
      FieldName = 'TP_MANIFESTO'
      Origin = 'TPO.TP_MANIFESTO'
      Size = 1
    end
    object FloatField97: TFloatField
      FieldName = 'TX_JUROS'
      Origin = 'TPO.TX_JUROS'
    end
    object MemoField4: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'TPO.TX_OBSERVACAO'
      BlobType = ftMemo
    end
    object FloatField98: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'TPO.VL_COMISSAO'
    end
    object FloatField99: TFloatField
      FieldName = 'VL_CARGA'
      Origin = 'TPO.VL_CARGA'
    end
    object FloatField100: TFloatField
      FieldName = 'VL_CAMBIO'
      Origin = 'TPO.VL_CAMBIO'
    end
    object FloatField101: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TPO.VL_DESCONTO'
    end
    object FloatField102: TFloatField
      FieldName = 'VL_FRETE_PREPAID'
      Origin = 'TPO.VL_FRETE_PREPAID'
    end
    object FloatField103: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'TPO.VL_FRETE_COLLECT'
    end
    object FloatField104: TFloatField
      FieldName = 'VL_FRETE_TERRIT_NAC'
      Origin = 'TPO.VL_FRETE_TERRIT_NAC'
    end
    object FloatField105: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPO.VL_SEGURO'
    end
    object FloatField106: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'TPO.VL_TOTAL'
    end
    object FloatField107: TFloatField
      FieldName = 'VL_TOTAL_PARCELA'
      Origin = 'TPO.VL_TOTAL_PARCELA'
    end
    object FloatField108: TFloatField
      FieldName = 'VL_PAGTO_ANTECIPADO'
      Origin = 'TPO.VL_PAGTO_ANTECIPADO'
    end
    object FloatField109: TFloatField
      FieldName = 'VL_PAGTO_VISTA'
      Origin = 'TPO.VL_PAGTO_VISTA'
    end
    object FloatField110: TFloatField
      FieldName = 'VL_PERIODIC_MENSAL'
      Origin = 'TPO.VL_PERIODIC_MENSAL'
    end
    object FloatField111: TFloatField
      FieldName = 'VL_DESPESAS'
      Origin = 'TPO.VL_DESPESAS'
    end
    object FloatField112: TFloatField
      FieldName = 'VL_DESCONTOS'
      Origin = 'TPO.VL_DESCONTOS'
    end
    object StringField280: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPO.IN_SELECIONADO'
      Size = 1
    end
    object StringField281: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPO.IN_MONTADO'
      Size = 1
    end
    object BooleanField30: TBooleanField
      FieldName = 'IN_IND_COND_MERC'
      Origin = 'TPO.NR_PROCESSO'
    end
    object BooleanField31: TBooleanField
      FieldName = 'IN_IND_CAMBIO_ITENS'
      Origin = 'TPO.NR_IDENT_USUARIO'
    end
    object StringField282: TStringField
      FieldName = 'NR_PARCELAS'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 3
    end
    object StringField283: TStringField
      FieldName = 'IN_PERIODICIDADE'
      Origin = 'TPO.CD_CONSIGNATARIO'
      Size = 1
    end
    object FloatField113: TFloatField
      FieldName = 'QT_TOTAL_DISPONIVEL'
      Origin = 'TPO.NR_PROCESSO'
    end
    object StringField284: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'TPO.CD_VIA_TRANSP'
      Size = 4
    end
    object StringField285: TStringField
      FieldName = 'CD_USUARIO_INT'
      Origin = 'TPO.CD_AGENTE_CARGA'
      Size = 4
    end
  end
  object sp_flp_po: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_flp_po'
    Left = 438
    Top = 92
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
      end
      item
        DataType = ftString
        Name = '@cd_servico'
        ParamType = ptInput
      end>
  end
  object sp_flp_po_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_flp_po_item'
    Left = 438
    Top = 164
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
      end
      item
        DataType = ftString
        Name = '@nr_item_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_servico'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_item'
        ParamType = ptInput
      end>
  end
  object qry_flp_po_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO'
      'FROM TFLP_PO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 338
    Top = 164
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_flp_po_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFLP_PO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_flp_po_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_ITEM_CLIENTE'
      'FROM TFLP_PO_ITEM'
      'WHERE NR_PROCESSO     = :NR_PROCESSO'
      '  AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE')
    Left = 338
    Top = 235
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ITEM_CLIENTE'
        ParamType = ptUnknown
      end>
    object qry_flp_po_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFLP_PO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_flp_po_item_NR_ITEM_CLIENTE: TStringField
      DisplayWidth = 4
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'TFLP_PO_ITEM.NR_ITEM_CLIENTE'
      Size = 4
    end
  end
end
