object datm_po: Tdatm_po
  OldCreateOrder = True
  Left = 428
  Top = 147
  Height = 444
  Width = 359
  object qry_po_: TQuery
    AfterOpen = qry_po_AfterOpen
    AfterClose = qry_po_AfterClose
    AfterEdit = qry_po_AfterEdit
    AfterPost = TirarCalculoseEditou
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND CD_EMPRESA = :CD_EMPRESA')
    Left = 96
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_po_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_po_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'DBBROKER.TPO.NR_IDENT_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qry_po_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'DBBROKER.TPO.CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_po_CD_CONSIGNATARIO: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      Origin = 'DBBROKER.TPO.CD_CONSIGNATARIO'
      FixedChar = True
      Size = 5
    end
    object qry_po_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'DBBROKER.TPO.CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_po_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TPO.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_po_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.TPO.CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_po_CD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'DBBROKER.TPO.CD_REPRESENTANTE'
      FixedChar = True
      Size = 5
    end
    object qry_po_CD_MOD_PAGAMENTO: TStringField
      FieldName = 'CD_MOD_PAGAMENTO'
      Origin = 'DBBROKER.TPO.CD_MOD_PAGAMENTO'
      FixedChar = True
      Size = 2
    end
    object qry_po_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'DBBROKER.TPO.CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_po_CD_REGIME_TRIB: TStringField
      FieldName = 'CD_REGIME_TRIB'
      Origin = 'DBBROKER.TPO.CD_REGIME_TRIB'
      FixedChar = True
      Size = 1
    end
    object qry_po_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'DBBROKER.TPO.CD_PAIS_PROCEDENCIA'
      FixedChar = True
      Size = 3
    end
    object qry_po_CD_MOEDA_NEG: TStringField
      FieldName = 'CD_MOEDA_NEG'
      Origin = 'DBBROKER.TPO.CD_MOEDA_NEG'
      FixedChar = True
      Size = 3
    end
    object qry_po_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'DBBROKER.TPO.CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qry_po_CD_TP_DECLARACAO: TStringField
      FieldName = 'CD_TP_DECLARACAO'
      Origin = 'DBBROKER.TPO.CD_TP_DECLARACAO'
      FixedChar = True
      Size = 2
    end
    object qry_po_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'DBBROKER.TPO.CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qry_po_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'DBBROKER.TPO.CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_po_CD_TRANSP_INTERN: TStringField
      FieldName = 'CD_TRANSP_INTERN'
      Origin = 'DBBROKER.TPO.CD_TRANSP_INTERN'
      FixedChar = True
      Size = 4
    end
    object qry_po_CD_BANDEIRA_VEIC: TStringField
      FieldName = 'CD_BANDEIRA_VEIC'
      Origin = 'DBBROKER.TPO.CD_BANDEIRA_VEIC'
      FixedChar = True
      Size = 3
    end
    object qry_po_CD_SETOR_ARMAZENAGEM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAGEM'
      Origin = 'DBBROKER.TPO.CD_SETOR_ARMAZENAGEM'
      FixedChar = True
      Size = 3
    end
    object qry_po_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'DBBROKER.TPO.CD_LOCAL_EMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_po_CD_AGENTE_CARGA: TStringField
      FieldName = 'CD_AGENTE_CARGA'
      Origin = 'DBBROKER.TPO.CD_AGENTE_CARGA'
      FixedChar = True
      Size = 4
    end
    object qry_po_CD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'DBBROKER.TPO.CD_URF_ENTRADA'
      FixedChar = True
      Size = 7
    end
    object qry_po_CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Origin = 'DBBROKER.TPO.CD_RECINTO_ALFAND'
      FixedChar = True
      Size = 7
    end
    object qry_po_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'DBBROKER.TPO.CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_po_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'DBBROKER.TPO.CD_MOEDA_SEGURO'
      FixedChar = True
      Size = 3
    end
    object qry_po_CD_MOEDA_CARGA: TStringField
      FieldName = 'CD_MOEDA_CARGA'
      Origin = 'DBBROKER.TPO.CD_MOEDA_CARGA'
      FixedChar = True
      Size = 3
    end
    object qry_po_CD_LOCAL_INCOTERM: TStringField
      FieldName = 'CD_LOCAL_INCOTERM'
      Origin = 'DBBROKER.TPO.CD_LOCAL_INCOTERM'
      FixedChar = True
      Size = 10
    end
    object qry_po_CD_TX_JUROS: TStringField
      FieldName = 'CD_TX_JUROS'
      Origin = 'DBBROKER.TPO.CD_TX_JUROS'
      FixedChar = True
      Size = 4
    end
    object qry_po_CD_INSTIT_FINANC: TStringField
      FieldName = 'CD_INSTIT_FINANC'
      Origin = 'DBBROKER.TPO.CD_INSTIT_FINANC'
      FixedChar = True
      Size = 2
    end
    object qry_po_CD_MOTIVO_CAMBIO_SEM_COBERT: TStringField
      FieldName = 'CD_MOTIVO_CAMBIO_SEM_COBERT'
      Origin = 'DBBROKER.TPO.CD_MOTIVO_CAMBIO_SEM_COBERT'
      FixedChar = True
      Size = 2
    end
    object qry_po_CD_BARRA: TStringField
      FieldName = 'CD_BARRA'
      Origin = 'DBBROKER.TPO.CD_BARRA'
      FixedChar = True
      Size = 11
    end
    object qry_po_CD_MET_VALORACAO_ADUAN: TStringField
      FieldName = 'CD_MET_VALORACAO_ADUAN'
      Origin = 'DBBROKER.TPO.CD_MET_VALORACAO_ADUAN'
      FixedChar = True
      Size = 2
    end
    object qry_po_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'DBBROKER.TPO.DT_ABERTURA'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_po_DT_EMISSAO_DOC_CARGA: TDateTimeField
      FieldName = 'DT_EMISSAO_DOC_CARGA'
      Origin = 'DBBROKER.TPO.DT_EMISSAO_DOC_CARGA'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_po_DT_CHEGADA_CARGA: TDateTimeField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'DBBROKER.TPO.DT_CHEGADA_CARGA'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_po_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'DBBROKER.TPO.DT_FATURA'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_po_IN_APLICACAO_MERC: TStringField
      FieldName = 'IN_APLICACAO_MERC'
      Origin = 'DBBROKER.TPO.IN_APLICACAO_MERC'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_COMISSAO: TBooleanField
      FieldName = 'IN_COMISSAO'
      Origin = 'DBBROKER.TPO.IN_COMISSAO'
    end
    object qry_po_IN_DESCONTO: TBooleanField
      FieldName = 'IN_DESCONTO'
      Origin = 'DBBROKER.TPO.IN_DESCONTO'
    end
    object qry_po_IN_TP_COMISSAO: TStringField
      FieldName = 'IN_TP_COMISSAO'
      Origin = 'DBBROKER.TPO.IN_TP_COMISSAO'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_TP_DESCONTO: TStringField
      FieldName = 'IN_TP_DESCONTO'
      Origin = 'DBBROKER.TPO.IN_TP_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_INDICADOR_CONSIG_IMPORT: TBooleanField
      FieldName = 'IN_INDICADOR_CONSIG_IMPORT'
      Origin = 'DBBROKER.TPO.IN_INDICADOR_CONSIG_IMPORT'
    end
    object qry_po_IN_INDICADOR_PROC: TStringField
      FieldName = 'IN_INDICADOR_PROC'
      Origin = 'DBBROKER.TPO.IN_INDICADOR_PROC'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_VINC_IMPO_EXPO: TStringField
      FieldName = 'IN_VINC_IMPO_EXPO'
      Origin = 'DBBROKER.TPO.IN_VINC_IMPO_EXPO'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_COND_MERCADORIA: TStringField
      FieldName = 'IN_COND_MERCADORIA'
      Origin = 'DBBROKER.TPO.IN_COND_MERCADORIA'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_FABR_EXPOR_IMP: TStringField
      FieldName = 'IN_FABR_EXPOR_IMP'
      Origin = 'DBBROKER.TPO.IN_FABR_EXPOR_IMP'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_INDIC_MULTMODAL: TBooleanField
      FieldName = 'IN_INDIC_MULTMODAL'
      Origin = 'DBBROKER.TPO.IN_INDIC_MULTMODAL'
    end
    object qry_po_IN_FUNDAP: TBooleanField
      FieldName = 'IN_FUNDAP'
      Origin = 'DBBROKER.TPO.IN_FUNDAP'
    end
    object qry_po_IN_UTILIZ_CARGA: TStringField
      FieldName = 'IN_UTILIZ_CARGA'
      Origin = 'DBBROKER.TPO.IN_UTILIZ_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_INDIC_TX_JUROS: TBooleanField
      FieldName = 'IN_INDIC_TX_JUROS'
      Origin = 'DBBROKER.TPO.IN_INDIC_TX_JUROS'
    end
    object qry_po_IN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'DBBROKER.TPO.IN_SEGURO'
      FixedChar = True
      Size = 1
    end
    object qry_po_NR_PLACA_VEICULO: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      Origin = 'DBBROKER.TPO.NR_PLACA_VEICULO'
      FixedChar = True
      Size = 15
    end
    object qry_po_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'DBBROKER.TPO.NR_MANIFESTO'
      FixedChar = True
      Size = 15
    end
    object qry_po_NR_DOC_MASTER: TStringField
      FieldName = 'NR_DOC_MASTER'
      Origin = 'DBBROKER.TPO.NR_DOC_MASTER'
      FixedChar = True
      Size = 30
    end
    object qry_po_NR_DOC_HOUSE: TStringField
      FieldName = 'NR_DOC_HOUSE'
      Origin = 'DBBROKER.TPO.NR_DOC_HOUSE'
      FixedChar = True
      Size = 30
    end
    object qry_po_NR_BACEN: TStringField
      FieldName = 'NR_BACEN'
      Origin = 'DBBROKER.TPO.NR_BACEN'
      FixedChar = True
      Size = 8
    end
    object qry_po_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPO.NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_po_NM_IDENT_CRT: TStringField
      FieldName = 'NM_IDENT_CRT'
      Origin = 'DBBROKER.TPO.NM_IDENT_CRT'
      FixedChar = True
      Size = 11
    end
    object qry_po_NM_VEICULO: TStringField
      FieldName = 'NM_VEICULO'
      Origin = 'DBBROKER.TPO.NM_VEICULO'
      FixedChar = True
      Size = 30
    end
    object qry_po_PC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'DBBROKER.TPO.PC_COMISSAO'
    end
    object qry_po_PC_DESCONTO: TFloatField
      FieldName = 'PC_DESCONTO'
      Origin = 'DBBROKER.TPO.PC_DESCONTO'
    end
    object qry_po_PC_SEGURO: TFloatField
      FieldName = 'PC_SEGURO'
      Origin = 'DBBROKER.TPO.PC_SEGURO'
    end
    object qry_po_PC_COMISSAO_AGENTE: TFloatField
      FieldName = 'PC_COMISSAO_AGENTE'
      Origin = 'DBBROKER.TPO.PC_COMISSAO_AGENTE'
    end
    object qry_po_PL_PO: TFloatField
      FieldName = 'PL_PO'
      Origin = 'DBBROKER.TPO.PL_PO'
    end
    object qry_po_PB_PO: TFloatField
      FieldName = 'PB_PO'
      Origin = 'DBBROKER.TPO.PB_PO'
    end
    object qry_po_QT_TOTAL_PESO: TFloatField
      FieldName = 'QT_TOTAL_PESO'
      Origin = 'DBBROKER.TPO.QT_TOTAL_PESO'
    end
    object qry_po_QT_PORC_ICMS: TFloatField
      FieldName = 'QT_PORC_ICMS'
      Origin = 'DBBROKER.TPO.QT_PORC_ICMS'
    end
    object qry_po_QT_TOTAL_ITENS: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'DBBROKER.TPO.QT_TOTAL_ITENS'
      FixedChar = True
      Size = 3
    end
    object qry_po_QT_PORC_RED_ICMS: TFloatField
      FieldName = 'QT_PORC_RED_ICMS'
      Origin = 'DBBROKER.TPO.QT_PORC_RED_ICMS'
    end
    object qry_po_QT_PERIODICIDADE: TStringField
      FieldName = 'QT_PERIODICIDADE'
      Origin = 'DBBROKER.TPO.QT_PERIODICIDADE'
      FixedChar = True
      Size = 3
    end
    object qry_po_TP_COBERT_CAMBIO: TStringField
      FieldName = 'TP_COBERT_CAMBIO'
      Origin = 'DBBROKER.TPO.TP_COBERT_CAMBIO'
      FixedChar = True
      Size = 1
    end
    object qry_po_TP_CAMBIO: TBooleanField
      FieldName = 'TP_CAMBIO'
      Origin = 'DBBROKER.TPO.TP_CAMBIO'
    end
    object qry_po_TP_DOC_CARGA: TStringField
      FieldName = 'TP_DOC_CARGA'
      Origin = 'DBBROKER.TPO.TP_DOC_CARGA'
      FixedChar = True
      Size = 2
    end
    object qry_po_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TPO.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_po_TP_SEGURO: TStringField
      FieldName = 'TP_SEGURO'
      Origin = 'DBBROKER.TPO.TP_SEGURO'
      FixedChar = True
      Size = 1
    end
    object qry_po_TP_MOD_DESPACHO: TStringField
      FieldName = 'TP_MOD_DESPACHO'
      Origin = 'DBBROKER.TPO.TP_MOD_DESPACHO'
      FixedChar = True
      Size = 1
    end
    object qry_po_TP_MANIFESTO: TStringField
      FieldName = 'TP_MANIFESTO'
      Origin = 'DBBROKER.TPO.TP_MANIFESTO'
      FixedChar = True
      Size = 1
    end
    object qry_po_TX_JUROS: TFloatField
      FieldName = 'TX_JUROS'
      Origin = 'DBBROKER.TPO.TX_JUROS'
    end
    object qry_po_TX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'DBBROKER.TPO.TX_OBSERVACAO'
      BlobType = ftMemo
    end
    object qry_po_VL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'DBBROKER.TPO.VL_COMISSAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_CARGA: TFloatField
      FieldName = 'VL_CARGA'
      Origin = 'DBBROKER.TPO.VL_CARGA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_CAMBIO: TFloatField
      FieldName = 'VL_CAMBIO'
      Origin = 'DBBROKER.TPO.VL_CAMBIO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'DBBROKER.TPO.VL_DESCONTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_FRETE_PREPAID: TFloatField
      FieldName = 'VL_FRETE_PREPAID'
      Origin = 'DBBROKER.TPO.VL_FRETE_PREPAID'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_FRETE_COLLECT: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'DBBROKER.TPO.VL_FRETE_COLLECT'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_FRETE_TERRIT_NAC: TFloatField
      FieldName = 'VL_FRETE_TERRIT_NAC'
      Origin = 'DBBROKER.TPO.VL_FRETE_TERRIT_NAC'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'DBBROKER.TPO.VL_SEGURO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'DBBROKER.TPO.VL_TOTAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_TOTAL_PARCELA: TFloatField
      FieldName = 'VL_TOTAL_PARCELA'
      Origin = 'DBBROKER.TPO.VL_TOTAL_PARCELA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_PAGTO_ANTECIPADO: TFloatField
      FieldName = 'VL_PAGTO_ANTECIPADO'
      Origin = 'DBBROKER.TPO.VL_PAGTO_ANTECIPADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_PAGTO_VISTA: TFloatField
      FieldName = 'VL_PAGTO_VISTA'
      Origin = 'DBBROKER.TPO.VL_PAGTO_VISTA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_PERIODIC_MENSAL: TFloatField
      FieldName = 'VL_PERIODIC_MENSAL'
      Origin = 'DBBROKER.TPO.VL_PERIODIC_MENSAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_DESPESAS: TFloatField
      FieldName = 'VL_DESPESAS'
      Origin = 'DBBROKER.TPO.VL_DESPESAS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_DESCONTOS: TFloatField
      FieldName = 'VL_DESCONTOS'
      Origin = 'DBBROKER.TPO.VL_DESCONTOS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TPO.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'DBBROKER.TPO.IN_MONTADO'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_IND_COND_MERC: TBooleanField
      FieldName = 'IN_IND_COND_MERC'
      Origin = 'DBBROKER.TPO.IN_IND_COND_MERC'
    end
    object qry_po_IN_IND_CAMBIO_ITENS: TBooleanField
      FieldName = 'IN_IND_CAMBIO_ITENS'
      Origin = 'DBBROKER.TPO.IN_IND_CAMBIO_ITENS'
    end
    object qry_po_NR_PARCELAS: TStringField
      FieldName = 'NR_PARCELAS'
      Origin = 'DBBROKER.TPO.NR_PARCELAS'
      FixedChar = True
      Size = 3
    end
    object qry_po_IN_PERIODICIDADE: TStringField
      FieldName = 'IN_PERIODICIDADE'
      Origin = 'DBBROKER.TPO.IN_PERIODICIDADE'
      FixedChar = True
      Size = 1
    end
    object qry_po_QT_TOTAL_DISPONIVEL: TFloatField
      FieldName = 'QT_TOTAL_DISPONIVEL'
      Origin = 'DBBROKER.TPO.QT_TOTAL_DISPONIVEL'
    end
    object qry_po_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      Origin = 'DBBROKER.TPO.CD_USUARIO_MONTA'
      FixedChar = True
      Size = 4
    end
    object qry_po_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TPO.CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qry_po_CD_COMPRADOR: TStringField
      FieldName = 'CD_COMPRADOR'
      Origin = 'DBBROKER.TPO.CD_COMPRADOR'
      FixedChar = True
      Size = 4
    end
    object qry_po_CD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'DBBROKER.TPO.CD_TERMO_PAGTO'
      FixedChar = True
      Size = 6
    end
    object qry_po_DT_NECESSIDADE: TDateTimeField
      FieldName = 'DT_NECESSIDADE'
      Origin = 'DBBROKER.TPO.DT_NECESSIDADE'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_po_CD_TIPO_FRETE: TStringField
      FieldName = 'CD_TIPO_FRETE'
      Origin = 'DBBROKER.TPO.CD_TIPO_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_po_CD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'DBBROKER.TPO.CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_po_IN_ENTREPOSTO: TStringField
      FieldName = 'IN_ENTREPOSTO'
      Origin = 'DBBROKER.TPO.IN_ENTREPOSTO'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_FATURADO: TStringField
      FieldName = 'IN_FATURADO'
      Origin = 'DBBROKER.TPO.IN_FATURADO'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_IMEDIATO: TStringField
      FieldName = 'IN_IMEDIATO'
      Origin = 'DBBROKER.TPO.IN_IMEDIATO'
      FixedChar = True
      Size = 1
    end
    object qry_po_VL_FRETE_INTERNO: TFloatField
      FieldName = 'VL_FRETE_INTERNO'
      Origin = 'DBBROKER.TPO.VL_FRETE_INTERNO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_EMBALAGEM: TFloatField
      FieldName = 'VL_EMBALAGEM'
      Origin = 'DBBROKER.TPO.VL_EMBALAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_TX_OBS_INTERNO: TMemoField
      FieldName = 'TX_OBS_INTERNO'
      Origin = 'DBBROKER.TPO.TX_OBS_INTERNO'
      BlobType = ftMemo
    end
    object qry_po_VL_PB_EMBALAGEM: TFloatField
      FieldName = 'VL_PB_EMBALAGEM'
      Origin = 'DBBROKER.TPO.VL_PB_EMBALAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_VL_PL_EMBALAGEM: TFloatField
      FieldName = 'VL_PL_EMBALAGEM'
      Origin = 'DBBROKER.TPO.VL_PL_EMBALAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_NR_DA: TStringField
      FieldName = 'NR_DA'
      Origin = 'DBBROKER.TPO.NR_DA'
      FixedChar = True
      Size = 10
    end
    object qry_po_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TPO.CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_po_TX_VOLUMES: TMemoField
      FieldName = 'TX_VOLUMES'
      Origin = 'DBBROKER.TPO.TX_VOLUMES'
      BlobType = ftMemo
    end
    object qry_po_TX_INF_ENTREPOSTO: TMemoField
      FieldName = 'TX_INF_ENTREPOSTO'
      Origin = 'DBBROKER.TPO.TX_INF_ENTREPOSTO'
      BlobType = ftMemo
    end
    object qry_po_TP_NEGOCIACAO: TStringField
      FieldName = 'TP_NEGOCIACAO'
      Origin = 'DBBROKER.TPO.TP_NEGOCIACAO'
      FixedChar = True
      Size = 3
    end
    object qry_po_NR_ARTICULO: TStringField
      FieldName = 'NR_ARTICULO'
      Origin = 'DBBROKER.TPO.NR_ARTICULO'
      FixedChar = True
      Size = 15
    end
    object qry_po_NR_ORDEM: TStringField
      FieldName = 'NR_ORDEM'
      Origin = 'DBBROKER.TPO.NR_ORDEM'
      FixedChar = True
      Size = 18
    end
    object qry_po_CD_USUARIO_INT: TStringField
      FieldName = 'CD_USUARIO_INT'
      Origin = 'DBBROKER.TPO.CD_USUARIO_INT'
      FixedChar = True
      Size = 4
    end
    object qry_po_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'DBBROKER.TPO.CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_po_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TPO.CD_BANCO'
      FixedChar = True
      Size = 5
    end
    object qry_po_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TPO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_po_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      Origin = 'DBBROKER.TPO.TX_OBS'
      BlobType = ftMemo
    end
    object qry_po_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'DBBROKER.TPO.CD_CANAL'
      FixedChar = True
      Size = 1
    end
    object qry_po_IN_CARGA_PERIGOSA: TStringField
      FieldName = 'IN_CARGA_PERIGOSA'
      Origin = 'DBBROKER.TPO.IN_CARGA_PERIGOSA'
      FixedChar = True
      Size = 1
    end
    object qry_po_VL_M3: TFloatField
      FieldName = 'VL_M3'
      Origin = 'DBBROKER.TPO.VL_M3'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_NM_EMPRESA_BASF: TStringField
      FieldName = 'NM_EMPRESA_BASF'
      Origin = 'DBBROKER.TPO.NM_EMPRESA_BASF'
      FixedChar = True
      Size = 4
    end
    object qry_po_IN_CALCULADO: TStringField
      FieldName = 'IN_CALCULADO'
      Origin = 'DBBROKER.TPO.IN_CALCULADO'
      FixedChar = True
      Size = 1
    end
    object qry_po_DT_CONHECIMENTO: TDateTimeField
      FieldName = 'DT_CONHECIMENTO'
      Origin = 'DBBROKER.TPO.DT_CONHECIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_po_CD_TRANSP_INTERNAC: TStringField
      FieldName = 'CD_TRANSP_INTERNAC'
      Origin = 'DBBROKER.TPO.CD_TRANSP_INTERNAC'
      FixedChar = True
      Size = 4
    end
    object qry_po_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'DBBROKER.TPO.NR_VIAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_po_DT_VIAGEM: TDateTimeField
      FieldName = 'DT_VIAGEM'
      Origin = 'DBBROKER.TPO.DT_VIAGEM'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_po_CD_LOCAL_DESTINO: TStringField
      FieldName = 'CD_LOCAL_DESTINO'
      Origin = 'DBBROKER.TPO.CD_LOCAL_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_po_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TPO.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object ds_po: TDataSource
    DataSet = qry_po_
    OnStateChange = HabilitaEdicao
    Left = 24
    Top = 64
  end
  object qry_ref_cli_: TQuery
    BeforePost = BeforePostRefCli
    AfterPost = qry_ref_cli_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM  TREF_CLIENTE  (NOLOCK) WHERE'
      'NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_SEQUENCIA')
    Left = 232
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ref_cli_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TREF_CLIENTE.NR_PROCESSO'
      Size = 18
    end
    object qry_ref_cli_NR_SEQUENCIA: TStringField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TREF_CLIENTE.NR_SEQUENCIA'
      Size = 2
    end
    object qry_ref_cli_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
    object qry_ref_cli_CD_REF_EXP: TStringField
      FieldName = 'CD_REF_EXP'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_REF_EXP'
      FixedChar = True
      Size = 15
    end
    object qry_ref_cli_DT_REFERENCIA: TDateTimeField
      FieldName = 'DT_REFERENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.DT_REFERENCIA'
    end
    object qry_ref_cli_TP_REFERENCIA: TStringField
      FieldName = 'TP_REFERENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.TP_REFERENCIA'
      FixedChar = True
      Size = 2
    end
    object qry_ref_cli_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qry_ref_cli_NR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_ref_cli_NR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_PARCIAL'
    end
    object qry_ref_cli_IN_FLAG_LI: TStringField
      FieldName = 'IN_FLAG_LI'
      Origin = 'DBBROKER.TREF_CLIENTE.IN_FLAG_LI'
      FixedChar = True
      Size = 1
    end
    object qry_ref_cli_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object ds_ref_cli_: TDataSource
    DataSet = qry_ref_cli_
    Left = 168
    Top = 24
  end
  object qry_po_lista_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      ' NR_PROCESSO,'
      ' EN.NM_EMPRESA,'
      ' IN_CALCULADO,'
      ' CD_IMPORTADOR, '
      ' PO.CD_EMPRESA,'
      ' ENC.NM_EMPRESA AS NM_CLIENTE'
      'FROM TPO PO (NOLOCK) '
      
        'JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA   = PO.CD_IMPORTA' +
        'DOR '
      'JOIN TEMPRESA_NAC ENC (NOLOCK) ON ENC.CD_EMPRESA = PO.CD_EMPRESA'
      'WHERE YEAR(DT_ABERTURA) >= YEAR(GETDATE()) -1 ')
    Left = 96
    Top = 16
    object qry_po_lista_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_po_lista_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_po_lista_IN_CALCULADO: TStringField
      FieldName = 'IN_CALCULADO'
      FixedChar = True
      Size = 1
    end
    object qry_po_lista_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_po_lista_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TPO.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_po_lista_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
  end
  object ds_po_lista: TDataSource
    DataSet = qry_po_lista_
    Left = 24
    Top = 16
  end
  object ds_po_itens: TDataSource
    DataSet = qry_po_itens_
    OnStateChange = HabilitaEdicao
    Left = 24
    Top = 128
  end
  object ds_po_nve: TDataSource
    DataSet = qry_po_nve_
    OnStateChange = HabilitaEdicao
    Left = 24
    Top = 288
  end
  object qry_po_nve_: TQuery
    AfterOpen = TirarCalculoseEditou
    AfterEdit = qry_po_AfterEdit
    BeforePost = qry_po_nve_BeforePost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TPO_NVE  (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND CD_EMPRESA = :CD_EMPRESA'
      '  AND NR_ITEM = :NR_ITEM')
    Left = 96
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qry_po_nve_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO_NVE.NR_PROCESSO'
      Size = 18
    end
    object qry_po_nve_NR_ITEM: TStringField
      DisplayWidth = 3
      FieldName = 'NR_ITEM'
      Origin = 'TPO_NVE.NR_ITEM'
      Size = 3
    end
    object qry_po_nve_CD_NIVEL_NVE: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'CD_NIVEL_NVE'
      Origin = 'TPO_NVE.CD_NIVEL_NVE'
      Size = 3
    end
    object qry_po_nve_CD_ATRIBUTO_NCM: TStringField
      DisplayLabel = 'Atributo'
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TPO_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_po_nve_CD_ESPECIF_NCM: TStringField
      DisplayLabel = 'Especifica'#231#227'o'
      FieldName = 'CD_ESPECIF_NCM'
      Origin = 'TPO_NVE.CD_ESPECIF_NCM'
      Size = 4
    end
    object qry_po_nve_CD_NCM_ATRIBUTO: TStringField
      FieldName = 'CD_NCM_ATRIBUTO'
      Origin = 'TPO_NVE.NR_PROCESSO'
      Size = 8
    end
    object qry_po_nve_CD_NCM_ESPECIF: TStringField
      FieldName = 'CD_NCM_ESPECIF'
      Origin = 'TPO_NVE.NR_ITEM'
      Size = 8
    end
    object qry_po_nve_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TPO_NVE.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object ds_tp_calc_item: TDataSource
    AutoEdit = False
    DataSet = tbl_tp_calc_item_
    Left = 24
    Top = 184
  end
  object tbl_tp_calc_item_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TIPO_CALCULO_ITEM'
    ReadOnly = True
    TableName = 'TTP_CALCULO_ITEM'
    UpdateMode = upWhereKeyOnly
    Left = 112
    Top = 184
    object tbl_tp_calc_item_CD_TIPO_CALCULO_ITEM: TStringField
      FieldName = 'CD_TIPO_CALCULO_ITEM'
      Required = True
      Size = 1
    end
    object tbl_tp_calc_item_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object qry_po_itens_: TQuery
    AfterEdit = qry_po_AfterEdit
    AfterPost = TirarCalculoseEditou
    AfterScroll = qry_po_itens_AfterScroll
    OnCalcFields = qry_po_itens_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPO_ITEM (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND CD_EMPRESA = :CD_EMPRESA'
      'order by NR_ITEM_CLIENTE, NR_PARCIAL'
      '')
    Left = 104
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_po_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPO_ITEM.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_po_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TPO_ITEM.NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TPO_ITEM.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_po_itens_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'DBBROKER.TPO_ITEM.CD_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object qry_po_itens_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'DBBROKER.TPO_ITEM.CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TPO_ITEM.CD_MERCADORIA'
      FixedChar = True
      Size = 30
    end
    object qry_po_itens_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'DBBROKER.TPO_ITEM.CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_po_itens_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'DBBROKER.TPO_ITEM.CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'DBBROKER.TPO_ITEM.CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qry_po_itens_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.CD_NALADI_NCCA'
      FixedChar = True
      Size = 7
    end
    object qry_po_itens_CD_MET_VALOR_ADUANEIRA: TStringField
      FieldName = 'CD_MET_VALOR_ADUANEIRA'
      Origin = 'DBBROKER.TPO_ITEM.CD_MET_VALOR_ADUANEIRA'
      FixedChar = True
      Size = 2
    end
    object qry_po_itens_CD_DISP_LEGAL_EXONERA: TStringField
      FieldName = 'CD_DISP_LEGAL_EXONERA'
      Origin = 'DBBROKER.TPO_ITEM.CD_DISP_LEGAL_EXONERA'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Origin = 'DBBROKER.TPO_ITEM.CD_MOEDA_NEGOCIADA'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'DBBROKER.TPO_ITEM.CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'DBBROKER.TPO_ITEM.CD_ACORDO_ALADI'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_REG_TRIB_II: TStringField
      FieldName = 'CD_REG_TRIB_II'
      Origin = 'DBBROKER.TPO_ITEM.CD_REG_TRIB_II'
      FixedChar = True
      Size = 6
    end
    object qry_po_itens_CD_FUND_LEGAL_II: TStringField
      FieldName = 'CD_FUND_LEGAL_II'
      Origin = 'DBBROKER.TPO_ITEM.CD_FUND_LEGAL_II'
      FixedChar = True
      Size = 2
    end
    object qry_po_itens_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'DBBROKER.TPO_ITEM.CD_UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_UNID_MED_II: TStringField
      FieldName = 'CD_UNID_MED_II'
      Origin = 'DBBROKER.TPO_ITEM.CD_UNID_MED_II'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_UNID_MED_IPI: TStringField
      FieldName = 'CD_UNID_MED_IPI'
      Origin = 'DBBROKER.TPO_ITEM.CD_UNID_MED_IPI'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_UNID_MED_AD: TStringField
      FieldName = 'CD_UNID_MED_AD'
      Origin = 'DBBROKER.TPO_ITEM.CD_UNID_MED_AD'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_AGENTE_CAMBIO: TStringField
      FieldName = 'CD_AGENTE_CAMBIO'
      Origin = 'DBBROKER.TPO_ITEM.CD_AGENTE_CAMBIO'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_CD_MOD_PAGTO: TStringField
      FieldName = 'CD_MOD_PAGTO'
      Origin = 'DBBROKER.TPO_ITEM.CD_MOD_PAGTO'
      FixedChar = True
      Size = 2
    end
    object qry_po_itens_CD_TX_JUROS: TStringField
      FieldName = 'CD_TX_JUROS'
      Origin = 'DBBROKER.TPO_ITEM.CD_TX_JUROS'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_CD_INSTITUICAO_FINANC: TStringField
      FieldName = 'CD_INSTITUICAO_FINANC'
      Origin = 'DBBROKER.TPO_ITEM.CD_INSTITUICAO_FINANC'
      FixedChar = True
      Size = 2
    end
    object qry_po_itens_CD_MOT_SEM_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_MOT_SEM_COBERT_CAMBIAL'
      Origin = 'DBBROKER.TPO_ITEM.CD_MOT_SEM_COBERT_CAMBIAL'
      FixedChar = True
      Size = 2
    end
    object qry_po_itens_CD_EX_II: TStringField
      FieldName = 'CD_EX_II'
      Origin = 'DBBROKER.TPO_ITEM.CD_EX_II'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_EX_IPI: TStringField
      FieldName = 'CD_EX_IPI'
      Origin = 'DBBROKER.TPO_ITEM.CD_EX_IPI'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.TPO_ITEM.CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_po_itens_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'DBBROKER.TPO_ITEM.CD_PAIS_PROCEDENCIA'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_CD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'DBBROKER.TPO_ITEM.CD_URF_ENTRADA'
      FixedChar = True
      Size = 7
    end
    object qry_po_itens_IN_NECESSITA_LI: TBooleanField
      FieldName = 'IN_NECESSITA_LI'
      Origin = 'DBBROKER.TPO_ITEM.IN_NECESSITA_LI'
    end
    object qry_po_itens_IN_INDICADOR_COND_MERC: TBooleanField
      FieldName = 'IN_INDICADOR_COND_MERC'
      Origin = 'DBBROKER.TPO_ITEM.IN_INDICADOR_COND_MERC'
    end
    object qry_po_itens_IN_COND_MERC: TStringField
      FieldName = 'IN_COND_MERC'
      Origin = 'DBBROKER.TPO_ITEM.IN_COND_MERC'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_IN_APLIC_MERC: TStringField
      FieldName = 'IN_APLIC_MERC'
      Origin = 'DBBROKER.TPO_ITEM.IN_APLIC_MERC'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_NM_ORGAO_EMISSOR_AL_EX_NALADI: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AL_EX_NALADI'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORGAO_EMISSOR_AL_EX_NALADI'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NM_AL_EX_NALADI: TStringField
      FieldName = 'NM_AL_EX_NALADI'
      Origin = 'DBBROKER.TPO_ITEM.NM_AL_EX_NALADI'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NM_ORGAO_EMISSOR_AL_NCM: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AL_NCM'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORGAO_EMISSOR_AL_NCM'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NM_AL_EX_NALADI_NCCA: TStringField
      FieldName = 'NM_AL_EX_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.NM_AL_EX_NALADI_NCCA'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NM_ORG_EMISSOR_EX_NALADI_NCCA: TStringField
      FieldName = 'NM_ORG_EMISSOR_EX_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORG_EMISSOR_EX_NALADI_NCCA'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NM_AL_II: TStringField
      FieldName = 'NM_AL_II'
      Origin = 'DBBROKER.TPO_ITEM.NM_AL_II'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NM_ORGAO_EMISSOR_II: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_II'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORGAO_EMISSOR_II'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NM_ORGAO_EMISSOR_IPI: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORGAO_EMISSOR_IPI'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NM_AL_IPI: TStringField
      FieldName = 'NM_AL_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NM_AL_IPI'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NM_AL_AD: TStringField
      FieldName = 'NM_AL_AD'
      Origin = 'DBBROKER.TPO_ITEM.NM_AL_AD'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NM_ORGAO_EMISSOR_AD: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AD'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORGAO_EMISSOR_AD'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NM_IDENTIFICACAO: TStringField
      FieldName = 'NM_IDENTIFICACAO'
      Origin = 'DBBROKER.TPO_ITEM.NM_IDENTIFICACAO'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NR_ANO_EMISSAO_AL_EX_NALADI: TStringField
      FieldName = 'NR_ANO_EMISSAO_AL_EX_NALADI'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_EMISSAO_AL_EX_NALADI'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_NR_AL_EX_NALADI: TStringField
      FieldName = 'NR_AL_EX_NALADI'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_EX_NALADI'
      FixedChar = True
      Size = 6
    end
    object qry_po_itens_NR_EX_NCM: TStringField
      FieldName = 'NR_EX_NCM'
      Origin = 'DBBROKER.TPO_ITEM.NR_EX_NCM'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_NR_AL_EX_NCM: TStringField
      FieldName = 'NR_AL_EX_NCM'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_EX_NCM'
      FixedChar = True
      Size = 9
    end
    object qry_po_itens_NR_ANO_EMISSAO_AL: TStringField
      FieldName = 'NR_ANO_EMISSAO_AL'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_EMISSAO_AL'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_NR_ATO_LEGAL: TStringField
      FieldName = 'NR_ATO_LEGAL'
      Origin = 'DBBROKER.TPO_ITEM.NR_ATO_LEGAL'
      FixedChar = True
      Size = 6
    end
    object qry_po_itens_NR_EX_NALADI: TStringField
      FieldName = 'NR_EX_NALADI'
      Origin = 'DBBROKER.TPO_ITEM.NR_EX_NALADI'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_NR_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_EX_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.NR_EX_NALADI_NCCA'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_NR_ANO_EMISSAO_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_ANO_EMISSAO_EX_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_EMISSAO_EX_NALADI_NCCA'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_NR_AL_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_AL_EX_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_EX_NALADI_NCCA'
      FixedChar = True
      Size = 6
    end
    object qry_po_itens_NR_ANO_II: TStringField
      FieldName = 'NR_ANO_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_II'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_NR_AL_II: TStringField
      FieldName = 'NR_AL_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_II'
      FixedChar = True
      Size = 6
    end
    object qry_po_itens_NR_ALIQ_NORMAL_II: TStringField
      FieldName = 'NR_ALIQ_NORMAL_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_NORMAL_II'
      FixedChar = True
      Size = 10
    end
    object qry_po_itens_NR_ALIQ_ACORDO_II: TStringField
      FieldName = 'NR_ALIQ_ACORDO_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_ACORDO_II'
      FixedChar = True
      Size = 10
    end
    object qry_po_itens_NR_ALIQ_REDUZIDA_II: TStringField
      FieldName = 'NR_ALIQ_REDUZIDA_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_REDUZIDA_II'
      FixedChar = True
      Size = 10
    end
    object qry_po_itens_NR_ALIQ_PERC_RED_II: TStringField
      FieldName = 'NR_ALIQ_PERC_RED_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_PERC_RED_II'
      FixedChar = True
      Size = 10
    end
    object qry_po_itens_NR_ANO_IPI: TStringField
      FieldName = 'NR_ANO_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_IPI'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_NR_AL_IPI: TStringField
      FieldName = 'NR_AL_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_IPI'
      FixedChar = True
      Size = 6
    end
    object qry_po_itens_NR_NOTA_COMPL_IPI: TStringField
      FieldName = 'NR_NOTA_COMPL_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_NOTA_COMPL_IPI'
      FixedChar = True
      Size = 2
    end
    object qry_po_itens_NR_ALIQ_NORMAL_IPI: TStringField
      FieldName = 'NR_ALIQ_NORMAL_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_NORMAL_IPI'
      FixedChar = True
      Size = 10
    end
    object qry_po_itens_NR_ALIQ_REDUZIDA_IPI: TStringField
      FieldName = 'NR_ALIQ_REDUZIDA_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_REDUZIDA_IPI'
      FixedChar = True
      Size = 10
    end
    object qry_po_itens_NR_ALIQ_PERC_RED_IPI: TStringField
      FieldName = 'NR_ALIQ_PERC_RED_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_PERC_RED_IPI'
      FixedChar = True
      Size = 10
    end
    object qry_po_itens_NR_PROC_LI: TStringField
      FieldName = 'NR_PROC_LI'
      Origin = 'DBBROKER.TPO_ITEM.NR_PROC_LI'
      FixedChar = True
      Size = 18
    end
    object qry_po_itens_NR_EX_AD: TStringField
      FieldName = 'NR_EX_AD'
      Origin = 'DBBROKER.TPO_ITEM.NR_EX_AD'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_NR_ANO_AD: TStringField
      FieldName = 'NR_ANO_AD'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_AD'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_NR_AL_AD: TStringField
      FieldName = 'NR_AL_AD'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_AD'
      FixedChar = True
      Size = 6
    end
    object qry_po_itens_NR_ALIQ_AD: TStringField
      FieldName = 'NR_ALIQ_AD'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_AD'
      FixedChar = True
      Size = 10
    end
    object qry_po_itens_NR_BASE_CALC_AD: TFloatField
      FieldName = 'NR_BASE_CALC_AD'
      Origin = 'DBBROKER.TPO_ITEM.NR_BASE_CALC_AD'
    end
    object qry_po_itens_NR_PARCELAS: TStringField
      FieldName = 'NR_PARCELAS'
      Origin = 'DBBROKER.TPO_ITEM.NR_PARCELAS'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_NR_PERIODICIDADE: TStringField
      FieldName = 'NR_PERIODICIDADE'
      Origin = 'DBBROKER.TPO_ITEM.NR_PERIODICIDADE'
      FixedChar = True
      Size = 3
    end
    object qry_po_itens_NR_ROF_BACEN: TStringField
      FieldName = 'NR_ROF_BACEN'
      Origin = 'DBBROKER.TPO_ITEM.NR_ROF_BACEN'
      FixedChar = True
      Size = 8
    end
    object qry_po_itens_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPO_ITEM.NR_FATURA'
      FixedChar = True
      Size = 50
    end
    object qry_po_itens_PC_DESCONTO: TFloatField
      FieldName = 'PC_DESCONTO'
      Origin = 'DBBROKER.TPO_ITEM.PC_DESCONTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      Origin = 'DBBROKER.TPO_ITEM.PC_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_PC_ICMS_REDUCAO: TFloatField
      FieldName = 'PC_ICMS_REDUCAO'
      Origin = 'DBBROKER.TPO_ITEM.PC_ICMS_REDUCAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_PC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'DBBROKER.TPO_ITEM.PC_COMISSAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_PL_ITEM: TFloatField
      FieldName = 'PL_ITEM'
      Origin = 'DBBROKER.TPO_ITEM.PL_ITEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_QT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
      Origin = 'DBBROKER.TPO_ITEM.QT_INICIAL'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_po_itens_QT_BAIXADA_DI: TFloatField
      FieldName = 'QT_BAIXADA_DI'
      Origin = 'DBBROKER.TPO_ITEM.QT_BAIXADA_DI'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_po_itens_QT_BAIXADA_LI: TFloatField
      FieldName = 'QT_BAIXADA_LI'
      Origin = 'DBBROKER.TPO_ITEM.QT_BAIXADA_LI'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_po_itens_QT_ESPEC_II: TFloatField
      FieldName = 'QT_ESPEC_II'
      Origin = 'DBBROKER.TPO_ITEM.QT_ESPEC_II'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_po_itens_QT_ESPEC_IPI: TFloatField
      FieldName = 'QT_ESPEC_IPI'
      Origin = 'DBBROKER.TPO_ITEM.QT_ESPEC_IPI'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_po_itens_QT_AD: TFloatField
      FieldName = 'QT_AD'
      Origin = 'DBBROKER.TPO_ITEM.QT_AD'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_po_itens_QT_MED_ESTATISTICA: TFloatField
      FieldName = 'QT_MED_ESTATISTICA'
      Origin = 'DBBROKER.TPO_ITEM.QT_MED_ESTATISTICA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_po_itens_TP_CALCULO: TStringField
      FieldName = 'TP_CALCULO'
      Origin = 'DBBROKER.TPO_ITEM.TP_CALCULO'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_TP_COMISSAO: TStringField
      FieldName = 'TP_COMISSAO'
      Origin = 'DBBROKER.TPO_ITEM.TP_COMISSAO'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_TP_ACORDO_TARIFARIO: TStringField
      FieldName = 'TP_ACORDO_TARIFARIO'
      Origin = 'DBBROKER.TPO_ITEM.TP_ACORDO_TARIFARIO'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_TP_TRIBUTACAO_IPI: TStringField
      FieldName = 'TP_TRIBUTACAO_IPI'
      Origin = 'DBBROKER.TPO_ITEM.TP_TRIBUTACAO_IPI'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_TP_CAMBIO: TStringField
      FieldName = 'TP_CAMBIO'
      Origin = 'DBBROKER.TPO_ITEM.TP_CAMBIO'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_TP_IND_TX_JUROS: TBooleanField
      FieldName = 'TP_IND_TX_JUROS'
      Origin = 'DBBROKER.TPO_ITEM.TP_IND_TX_JUROS'
    end
    object qry_po_itens_TP_IND_PERIODICIDADE: TStringField
      FieldName = 'TP_IND_PERIODICIDADE'
      Origin = 'DBBROKER.TPO_ITEM.TP_IND_PERIODICIDADE'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_TP_RECIPIENTE: TStringField
      FieldName = 'TP_RECIPIENTE'
      Origin = 'DBBROKER.TPO_ITEM.TP_RECIPIENTE'
      FixedChar = True
      Size = 2
    end
    object qry_po_itens_TP_IND_MULTIMODAL: TStringField
      FieldName = 'TP_IND_MULTIMODAL'
      Origin = 'DBBROKER.TPO_ITEM.TP_IND_MULTIMODAL'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'DBBROKER.TPO_ITEM.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_po_itens_TX_JUROS_CAMBIO: TFloatField
      FieldName = 'TX_JUROS_CAMBIO'
      Origin = 'DBBROKER.TPO_ITEM.TX_JUROS_CAMBIO'
    end
    object qry_po_itens_VL_DESPESA_MOEDA: TFloatField
      FieldName = 'VL_DESPESA_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_DESPESA_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_DESCONTO_MOEDA: TFloatField
      FieldName = 'VL_DESCONTO_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_DESCONTO_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'DBBROKER.TPO_ITEM.VL_UNITARIO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'DBBROKER.TPO_ITEM.VL_TOTAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'DBBROKER.TPO_ITEM.VL_DESCONTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'DBBROKER.TPO_ITEM.VL_COMISSAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_ESPEC_II: TFloatField
      FieldName = 'VL_ESPEC_II'
      Origin = 'DBBROKER.TPO_ITEM.VL_ESPEC_II'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_ESPEC_IPI: TFloatField
      FieldName = 'VL_ESPEC_IPI'
      Origin = 'DBBROKER.TPO_ITEM.VL_ESPEC_IPI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_ESPEC_AD: TFloatField
      FieldName = 'VL_ESPEC_AD'
      Origin = 'DBBROKER.TPO_ITEM.VL_ESPEC_AD'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_TOTAL_PARCELAS: TFloatField
      FieldName = 'VL_TOTAL_PARCELAS'
      Origin = 'DBBROKER.TPO_ITEM.VL_TOTAL_PARCELAS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_COBERT_ACIMA_360: TFloatField
      FieldName = 'VL_COBERT_ACIMA_360'
      Origin = 'DBBROKER.TPO_ITEM.VL_COBERT_ACIMA_360'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_PAGTO_ANTECIPADO: TFloatField
      FieldName = 'VL_PAGTO_ANTECIPADO'
      Origin = 'DBBROKER.TPO_ITEM.VL_PAGTO_ANTECIPADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_PAGTO_AVISTA: TFloatField
      FieldName = 'VL_PAGTO_AVISTA'
      Origin = 'DBBROKER.TPO_ITEM.VL_PAGTO_AVISTA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_FRETE_NAC_MOEDA: TFloatField
      FieldName = 'VL_FRETE_NAC_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_FRETE_NAC_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_SEGURO_MOEDA: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_SEGURO_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_ACRESC_MOEDA: TFloatField
      FieldName = 'VL_ACRESC_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_ACRESC_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_DEDUC_MOEDA: TFloatField
      FieldName = 'VL_DEDUC_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_DEDUC_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_FRETE_PREPAID_MOEDA: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_FRETE_PREPAID_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_VL_FRETE_COLLECT: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'DBBROKER.TPO_ITEM.VL_FRETE_COLLECT'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_po_itens_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TPO_ITEM.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_QT_BAIXAR: TFloatField
      FieldName = 'QT_BAIXAR'
      Origin = 'DBBROKER.TPO_ITEM.QT_BAIXAR'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_po_itens_QT_DISPONIVEL: TFloatField
      FieldName = 'QT_DISPONIVEL'
      Origin = 'DBBROKER.TPO_ITEM.QT_DISPONIVEL'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_po_itens_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'DBBROKER.TPO_ITEM.IN_MONTADO'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_IN_FABR_EXP_PROD: TStringField
      FieldName = 'IN_FABR_EXP_PROD'
      Origin = 'DBBROKER.TPO_ITEM.IN_FABR_EXP_PROD'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_NR_ANO_EX_NCM: TStringField
      FieldName = 'NR_ANO_EX_NCM'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_EX_NCM'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_NR_NUM_EX_NCM: TStringField
      FieldName = 'NR_NUM_EX_NCM'
      Origin = 'DBBROKER.TPO_ITEM.NR_NUM_EX_NCM'
      FixedChar = True
      Size = 6
    end
    object qry_po_itens_IN_IND_COND_MERC: TBooleanField
      FieldName = 'IN_IND_COND_MERC'
      Origin = 'DBBROKER.TPO_ITEM.IN_IND_COND_MERC'
    end
    object qry_po_itens_NM_LOCAL_INCOTERM: TStringField
      FieldName = 'NM_LOCAL_INCOTERM'
      Origin = 'DBBROKER.TPO_ITEM.NM_LOCAL_INCOTERM'
      FixedChar = True
      Size = 10
    end
    object qry_po_itens_NM_TIPO_AL_AD: TStringField
      FieldName = 'NM_TIPO_AL_AD'
      Origin = 'DBBROKER.TPO_ITEM.NM_TIPO_AL_AD'
      FixedChar = True
      Size = 10
    end
    object qry_po_itens_IN_IND_PERIODICIDADE: TStringField
      FieldName = 'IN_IND_PERIODICIDADE'
      Origin = 'DBBROKER.TPO_ITEM.IN_IND_PERIODICIDADE'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_IN_REG_TRIB_IPI: TStringField
      FieldName = 'IN_REG_TRIB_IPI'
      Origin = 'DBBROKER.TPO_ITEM.IN_REG_TRIB_IPI'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_QT_INICIAL_EST: TFloatField
      FieldName = 'QT_INICIAL_EST'
      Origin = 'DBBROKER.TPO_ITEM.QT_INICIAL_EST'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_po_itens_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      Origin = 'DBBROKER.TPO_ITEM.CD_USUARIO_MONTA'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_CD_MODALIDADE: TStringField
      FieldName = 'CD_MODALIDADE'
      Origin = 'DBBROKER.TPO_ITEM.CD_MODALIDADE'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Origin = 'DBBROKER.TPO_ITEM.NR_ATO_DRAWBACK'
      FixedChar = True
      Size = 13
    end
    object qry_po_itens_IN_AVISO_DB: TStringField
      FieldName = 'IN_AVISO_DB'
      Origin = 'DBBROKER.TPO_ITEM.IN_AVISO_DB'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_NR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'DBBROKER.TPO_ITEM.NR_ITEM_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_TX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'DBBROKER.TPO_ITEM.TX_OBSERVACAO'
      BlobType = ftMemo
    end
    object qry_po_itens_IN_REEIMPORTACAO: TStringField
      FieldName = 'IN_REEIMPORTACAO'
      Origin = 'DBBROKER.TPO_ITEM.IN_REEIMPORTACAO'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TPO_ITEM.CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qry_po_itens_NR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TPO_ITEM.NR_PARCIAL'
    end
    object qry_po_itens_CD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'DBBROKER.TPO_ITEM.CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'DBBROKER.TPO_ITEM.CD_EMBARCACAO'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'DBBROKER.TPO_ITEM.CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_po_itens_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'DBBROKER.TPO_ITEM.NR_VIAGEM'
      FixedChar = True
      Size = 15
    end
    object qry_po_itens_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      Origin = 'DBBROKER.TPO_ITEM.NR_VOO'
      FixedChar = True
      Size = 18
    end
    object qry_po_itens_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'DBBROKER.TPO_ITEM.NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qry_po_itens_NR_COURRIER: TStringField
      FieldName = 'NR_COURRIER'
      Origin = 'DBBROKER.TPO_ITEM.NR_COURRIER'
      FixedChar = True
      Size = 15
    end
    object qry_po_itens_IN_CONSOLIDADO: TStringField
      FieldName = 'IN_CONSOLIDADO'
      Origin = 'DBBROKER.TPO_ITEM.IN_CONSOLIDADO'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_IN_URGENTE: TStringField
      FieldName = 'IN_URGENTE'
      Origin = 'DBBROKER.TPO_ITEM.IN_URGENTE'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_IN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'DBBROKER.TPO_ITEM.IN_SEGURO'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_CD_MERC_FORNEC: TStringField
      FieldName = 'CD_MERC_FORNEC'
      Origin = 'DBBROKER.TPO_ITEM.CD_MERC_FORNEC'
      FixedChar = True
      Size = 15
    end
    object qry_po_itens_TP_DRAWBACK: TStringField
      FieldName = 'TP_DRAWBACK'
      Origin = 'DBBROKER.TPO_ITEM.TP_DRAWBACK'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_DT_ABERTURA_ITEM: TDateTimeField
      FieldName = 'DT_ABERTURA_ITEM'
      Origin = 'DBBROKER.TPO_ITEM.DT_ABERTURA_ITEM'
    end
    object qry_po_itens_calcNR_PARCIAL: TStringField
      DisplayLabel = 'N'#186' Parcial'
      FieldKind = fkCalculated
      FieldName = 'calcNR_PARCIAL'
      Size = 1
      Calculated = True
    end
    object qry_po_itens_IN_UTILIZADO_INSTR_DESEMB: TStringField
      FieldName = 'IN_UTILIZADO_INSTR_DESEMB'
      Origin = 'DBBROKER.TPO_ITEM.IN_UTILIZADO_INSTR_DESEMB'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_ID_CODIGO_INSTR_DESEMB: TStringField
      FieldName = 'ID_CODIGO_INSTR_DESEMB'
      Origin = 'DBBROKER.TPO_ITEM.ID_CODIGO_INSTR_DESEMB'
      FixedChar = True
      Size = 13
    end
    object qry_po_itens_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'DBBROKER.TPO_ITEM.DT_FATURA'
    end
    object qry_po_itens_IN_CORRECAO: TStringField
      FieldName = 'IN_CORRECAO'
      Origin = 'DBBROKER.TPO_ITEM.IN_CORRECAO'
      FixedChar = True
      Size = 1
    end
    object qry_po_itens_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TPO_ITEM.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object qry_tp_modalidade_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT * FROM TTP_MODALIDADE  (NOLOCK)')
    Left = 96
    Top = 232
    object qry_tp_modalidade_CD_MODALIDADE: TStringField
      FieldName = 'CD_MODALIDADE'
      Origin = 'TTP_MODALIDADE.CD_MODALIDADE'
      Size = 1
    end
    object qry_tp_modalidade_NM_MODALIDADE: TStringField
      FieldName = 'NM_MODALIDADE'
      Origin = 'TTP_MODALIDADE.NM_MODALIDADE'
      Size = 15
    end
  end
  object ds_tp_modalidade: TDataSource
    AutoEdit = False
    DataSet = qry_tp_modalidade_
    Left = 24
    Top = 240
  end
  object sp_po_apaga_renum_itens: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_apaga_renum_itens'
    Left = 232
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_empresa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_item'
        ParamType = ptInput
      end>
  end
end
