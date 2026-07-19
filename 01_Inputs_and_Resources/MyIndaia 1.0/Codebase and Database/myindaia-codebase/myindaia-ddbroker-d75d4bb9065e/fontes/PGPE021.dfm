object datm_exp_capa: Tdatm_exp_capa
  OldCreateOrder = True
  Left = 719
  Top = 383
  Height = 637
  Width = 821
  object ds_exp: TDataSource
    DataSet = qry_exp_
    Left = 40
    Top = 8
  end
  object qry_exp_: TQuery
    CachedUpdates = True
    AfterOpen = qry_exp_AfterOpen
    BeforeInsert = qry_exp_BeforeInsert
    BeforeEdit = qry_exp_BeforeEdit
    BeforePost = qry_exp_BeforePost
    AfterPost = qry_exp_AfterPost
    AfterCancel = qry_exp_AfterCancel
    AfterDelete = qry_exp_AfterDelete
    AfterScroll = qry_exp_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM   TPROCESSO_EXP (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = Upd_exp
    Left = 155
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_NR_OUTRAS_REF: TStringField
      FieldName = 'NR_OUTRAS_REF'
      Origin = 'TPROCESSO_EXP.NR_OUTRAS_REF'
      Size = 30
    end
    object qry_exp_TP_CONSIGNATARIO: TStringField
      FieldName = 'TP_CONSIGNATARIO'
      Origin = 'TPROCESSO_EXP.TP_CONSIGNATARIO'
      Size = 1
    end
    object qry_exp_TP_NOTIFY1: TStringField
      FieldName = 'TP_NOTIFY1'
      Origin = 'TPROCESSO_EXP.TP_NOTIFY1'
      Size = 1
    end
    object qry_exp_TP_NOTIFY2: TStringField
      FieldName = 'TP_NOTIFY2'
      Origin = 'TPROCESSO_EXP.TP_NOTIFY2'
      Size = 1
    end
    object qry_exp_TP_COPIA: TStringField
      FieldName = 'TP_COPIA'
      Origin = 'TPROCESSO_EXP.CD_IMPORTADOR'
      Size = 1
    end
    object qry_exp_TP_DOCUMENTO: TStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'TPROCESSO_EXP.CD_DESPACHANTE'
      Size = 1
    end
    object qry_exp_TP_POS_AD: TStringField
      FieldName = 'TP_POS_AD'
      Origin = 'TPROCESSO_EXP.CD_TRANSPORTADORA'
      Size = 1
    end
    object qry_exp_IN_DRAWBACK: TBooleanField
      FieldName = 'IN_DRAWBACK'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
    end
    object qry_exp_IN_FABR_EXPO: TStringField
      FieldName = 'IN_FABR_EXPO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 1
    end
    object qry_exp_IN_VENDA_INCOTERM: TBooleanField
      FieldName = 'IN_VENDA_INCOTERM'
      Origin = 'TPROCESSO_EXP.CD_MOEDA'
    end
    object qry_exp_IN_DECL_AD_INSTR_EMB: TStringField
      FieldName = 'IN_DECL_AD_INSTR_EMB'
      Origin = 'TPROCESSO_EXP.CD_MOEDA'
      Size = 1
    end
    object qry_exp_IN_DECL_AD_PACKING_LIST: TStringField
      FieldName = 'IN_DECL_AD_PACKING_LIST'
      Origin = 'TPROCESSO_EXP.CD_VIA_TRANSPORTE'
      Size = 1
    end
    object qry_exp_IN_REFERENCIA_FAT_INST: TStringField
      FieldName = 'IN_REFERENCIA_FAT_INST'
      Origin = 'TPROCESSO_EXP.CD_MOEDA'
      Size = 1
    end
    object qry_exp_in_num_fat_auto: TStringField
      FieldName = 'IN_NUM_FAT_AUTO'
      Origin = 'TPROCESSO_EXP.CD_TRANSPORTADORA'
      Size = 1
    end
    object qry_exp_IN_ETIQUETA: TStringField
      FieldName = 'IN_ETIQUETA'
      Origin = 'DBBROKER.TPROCESSO_EXP.IN_ETIQUETA'
      FixedChar = True
      Size = 1
    end
    object qry_exp_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPROCESSO_EXP.CD_EXPORTADOR'
      Size = 5
    end
    object qry_exp_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPROCESSO_EXP.CD_IMPORTADOR'
      Size = 5
    end
    object qry_exp_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPROCESSO_EXP.NR_OUTRAS_REF'
      Size = 5
    end
    object qry_exp_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPROCESSO_EXP.CD_EXPORTADOR'
      Size = 3
    end
    object qry_exp_CD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      Origin = 'TPROCESSO_EXP.CD_PAIS_DESTINO'
      Size = 3
    end
    object qry_exp_CD_PAIS_ORIG: TStringField
      FieldName = 'CD_PAIS_ORIG'
      Origin = 'TPROCESSO_EXP.CD_MOEDA'
      Size = 3
    end
    object qry_exp_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPROCESSO_EXP.CD_INCOTERM'
      OnChange = qry_exp_CD_INCOTERMChange
      Size = 3
    end
    object qry_exp_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TPROCESSO_EXP.CD_MOEDA'
      OnChange = qry_exp_CD_MOEDAChange
      Size = 3
    end
    object qry_exp_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TPROCESSO_EXP.CD_AGENTE'
      Size = 4
    end
    object qry_exp_CD_SEGURADORA: TStringField
      FieldName = 'CD_SEGURADORA'
      Origin = 'TPROCESSO_EXP.CD_SEGURADORA'
      Size = 5
    end
    object qry_exp_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TPROCESSO_EXP.CD_DESPACHANTE'
      Size = 3
    end
    object qry_exp_CD_LOCAL_DESPACHO: TStringField
      FieldName = 'CD_LOCAL_DESPACHO'
      Origin = 'TPROCESSO_EXP.CD_TRANSPORTADORA'
      Size = 4
    end
    object qry_exp_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TPROCESSO_EXP.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_exp_CD_TRANSPORTADORA: TStringField
      FieldName = 'CD_TRANSPORTADORA'
      Origin = 'TPROCESSO_EXP.CD_TRANSPORTADORA'
      Size = 4
    end
    object qry_exp_CD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'TPROCESSO_EXP.CD_REPRESENTANTE'
      Size = 5
    end
    object qry_exp_CD_LOCAL_ORIGEM: TStringField
      FieldName = 'CD_LOCAL_ORIGEM'
      Origin = 'TPROCESSO_EXP.CD_LOCAL_ORIGEM'
      Size = 4
    end
    object qry_exp_CD_LOCAL_DESTINO: TStringField
      FieldName = 'CD_LOCAL_DESTINO'
      Origin = 'TPROCESSO_EXP.CD_LOCAL_DESTINO'
      Size = 4
    end
    object qry_exp_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TPROCESSO_EXP.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_exp_CD_URF_DESTINO: TStringField
      FieldName = 'CD_URF_DESTINO'
      Origin = 'TPROCESSO_EXP.CD_URF_DESTINO'
      Size = 7
    end
    object qry_exp_CD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'TPROCESSO_EXP.CD_TERMO_PAGTO'
      Size = 6
    end
    object qry_exp_CD_FORMA_PAGTO: TStringField
      FieldName = 'CD_FORMA_PAGTO'
      Origin = 'TPROCESSO_EXP.CD_FORMA_PAGTO'
      Size = 1
    end
    object qry_exp_CD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      Origin = 'TPROCESSO_EXP.CD_LINGUA_PEDIDO'
      Size = 1
    end
    object qry_exp_CD_TIPO_FRETE: TStringField
      FieldName = 'CD_TIPO_FRETE'
      Origin = 'TPROCESSO_EXP.CD_TIPO_FRETE'
      Size = 1
    end
    object qry_exp_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPROCESSO_EXP.CD_USUARIO'
      Size = 4
    end
    object qry_exp_CD_CARTA_CREDITO: TStringField
      FieldName = 'CD_CARTA_CREDITO'
      Origin = 'TPROCESSO_EXP.CD_CARTA_CREDITO'
      Size = 15
    end
    object qry_exp_CD_INST_NEGOC: TStringField
      FieldName = 'CD_INST_NEGOC'
      Origin = 'TPROCESSO_EXP.CD_INST_NEGOC'
      Size = 5
    end
    object qry_exp_CD_CONSIGNATARIO: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      Origin = 'TPROCESSO_EXP.CD_CONSIGNATARIO'
      Size = 5
    end
    object qry_exp_CD_NOTIFY1: TStringField
      FieldName = 'CD_NOTIFY1'
      Origin = 'TPROCESSO_EXP.CD_NOTIFY1'
      Size = 5
    end
    object qry_exp_CD_NOTIFY2: TStringField
      FieldName = 'CD_NOTIFY2'
      Origin = 'TPROCESSO_EXP.CD_NOTIFY2'
      Size = 5
    end
    object qry_exp_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TPROCESSO_EXP.CD_INCOTERM'
      Size = 5
    end
    object qry_exp_CD_COPIA: TStringField
      DisplayWidth = 5
      FieldName = 'CD_COPIA'
      Origin = 'TPROCESSO_EXP.CD_AGENTE'
      Size = 5
    end
    object qry_exp_CD_LOCAL_EMISSAO: TStringField
      FieldName = 'CD_LOCAL_EMISSAO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 3
    end
    object qry_exp_CD_BANCO_SAQUE_BORDERO: TStringField
      FieldName = 'CD_BANCO_SAQUE_BORDERO'
      Origin = 'TPROCESSO_EXP.CD_MOEDA'
      Size = 5
    end
    object qry_exp_CD_ENQUAD_OP: TStringField
      FieldName = 'CD_ENQUAD_OP'
      Origin = 'TPROCESSO_EXP.CD_TRANSPORTADORA'
      Size = 5
    end
    object qry_exp_DT_REGISTRO_PEDIDO: TDateTimeField
      FieldName = 'DT_REGISTRO_PEDIDO'
      Origin = 'TPROCESSO_EXP.DT_REGISTRO_PEDIDO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_exp_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPROCESSO_EXP.DT_FATURA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_exp_DT_SD: TDateTimeField
      FieldName = 'DT_SD'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_exp_DT_REG_DDE: TDateTimeField
      FieldName = 'DT_REG_DDE'
      Origin = 'TPROCESSO_EXP.CD_MOEDA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_exp_QT_TOTAL_ITENS: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPROCESSO_EXP.QT_TOTAL_ITENS'
      Size = 3
    end
    object qry_exp_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'TPROCESSO_EXP.CD_VIA_TRANSPORTE'
      OnChange = qry_exp_VL_ACRESCIMOChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'TPROCESSO_EXP.VL_FRETE'
      OnChange = qry_exp_VL_FRETEChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPROCESSO_EXP.VL_SEGURO'
      OnChange = qry_exp_VL_SEGUROChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'TPROCESSO_EXP.VL_PESO_BRUTO'
      OnChange = qry_exp_VL_PESO_BRUTOChange
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_exp_VL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'TPROCESSO_EXP.VL_PESO_LIQUIDO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_exp_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TPROCESSO_EXP.VL_DESCONTO'
      OnChange = qry_exp_VL_DESCONTOChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_COMISSAO_PERCENT: TFloatField
      FieldName = 'VL_COMISSAO_PERCENT'
      Origin = 'TPROCESSO_EXP.VL_COMISSAO_PERCENT'
      OnChange = qry_exp_VL_COMISSAO_PERCENTChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_TOT_ORIGEM: TFloatField
      FieldName = 'VL_TOT_ORIGEM'
      Origin = 'TPROCESSO_EXP.VL_TOT_ORIGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_TOT_CUBAGEM: TFloatField
      FieldName = 'VL_TOT_CUBAGEM'
      Origin = 'TPROCESSO_EXP.VL_TOT_CUBAGEM'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qry_exp_VL_TOT_FOB: TFloatField
      FieldName = 'VL_TOT_FOB'
      Origin = 'TPROCESSO_EXP.VL_TOT_FOB'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_TOT_COM_AGENTE: TFloatField
      FieldName = 'VL_TOT_COM_AGENTE'
      Origin = 'TPROCESSO_EXP.VL_TOT_COM_AGENTE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_TOT_QTDE_PROD: TFloatField
      FieldName = 'VL_TOT_QTDE_PROD'
      Origin = 'TPROCESSO_EXP.VL_TOT_QTDE_PROD'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_TOT_QTDE_EMBALAGEM: TFloatField
      FieldName = 'VL_TOT_QTDE_EMBALAGEM'
      Origin = 'TPROCESSO_EXP.VL_TOT_QTDE_EMBALAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      Origin = 'TPROCESSO_EXP.VL_TOT_MCV'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_TOT_EXW: TFloatField
      FieldName = 'VL_TOT_EXW'
      Origin = 'TPROCESSO_EXP.VL_TOT_EXW'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_TX_CAMBIO: TFloatField
      FieldName = 'VL_TX_CAMBIO'
      Origin = 'TPROCESSO_EXP.VL_TX_CAMBIO'
      OnChange = qry_exp_VL_TX_CAMBIOChange
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_exp_VL_TOT_CONTAINER: TFloatField
      FieldName = 'VL_TOT_CONTAINER'
      Origin = 'TPROCESSO_EXP.VL_TOT_CONTAINER'
      OnChange = qry_exp_VL_TOT_CONTAINERChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_TOT_PALLETS: TFloatField
      FieldName = 'VL_TOT_PALLETS'
      Origin = 'TPROCESSO_EXP.VL_TOT_PALLETS'
      OnChange = qry_exp_VL_TOT_PALLETSChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_TOT_DESPESA: TFloatField
      FieldName = 'VL_TOT_DESPESA'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_SEM_COBERTURA_CAMBIAL: TFloatField
      FieldName = 'VL_SEM_COBERTURA_CAMBIAL'
      Origin = 'TPROCESSO_EXP.CD_TRANSPORTADORA'
      OnChange = qry_exp_VL_SEM_COBERTURA_CAMBIALChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_VL_FRETE_INT: TFloatField
      FieldName = 'VL_FRETE_INT'
      Origin = 'DBBROKER.TPROCESSO_EXP.VL_FRETE_INT'
      OnChange = qry_exp_VL_FRETE_INTChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_TX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      Origin = 'TPROCESSO_EXP.TX_INF_EMBALAGEM'
      BlobType = ftMemo
    end
    object qry_exp_TX_TERMO_PAGTO: TMemoField
      FieldName = 'TX_TERMO_PAGTO'
      Origin = 'TPROCESSO_EXP.TX_TERMO_PAGTO'
      BlobType = ftMemo
    end
    object qry_exp_TX_DECL_ADICIONAL: TMemoField
      FieldName = 'TX_DECL_ADICIONAL'
      Origin = 'TPROCESSO_EXP.TX_DECL_ADICIONAL'
      BlobType = ftMemo
    end
    object qry_exp_TX_DECL_EXPORTADOR: TMemoField
      FieldName = 'TX_DECL_EXPORTADOR'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      BlobType = ftMemo
    end
    object qry_exp_TX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'TPROCESSO_EXP.CD_DESPACHANTE'
      BlobType = ftMemo
    end
    object qry_exp_TX_CABECALHO: TMemoField
      FieldName = 'TX_CABECALHO'
      Origin = 'TPROCESSO_EXP.CD_AGENTE'
      BlobType = ftMemo
    end
    object qry_exp_TX_MERCADORIA_BL: TMemoField
      FieldName = 'TX_MERCADORIA_BL'
      Origin = 'TPROCESSO_EXP.CD_MOEDA'
      BlobType = ftMemo
    end
    object qry_exp_TX_DECL_ADIC_INST_EMB: TMemoField
      FieldName = 'TX_DECL_ADIC_INST_EMB'
      Origin = 'TPROCESSO_EXP.CD_TRANSPORTADORA'
      BlobType = ftMemo
    end
    object qry_exp_TX_CRIT_ORIG_FORM_A: TMemoField
      FieldName = 'TX_CRIT_ORIG_FORM_A'
      Origin = 'TPROCESSO_EXP.CD_TRANSPORTADORA'
      BlobType = ftMemo
    end
    object qry_exp_NR_LI: TStringField
      FieldName = 'NR_LI'
      Origin = 'TPROCESSO_EXP.NR_LI'
      EditMask = '!99/9999999-9;0;'
      Size = 10
    end
    object qry_exp_NR_FATURA: TStringField
      DisplayWidth = 30
      FieldName = 'NR_FATURA'
      Origin = 'TPROCESSO_EXP.NR_FATURA'
      Size = 30
    end
    object qry_exp_NR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      EditMask = '!9999999999-9;0;_'
      Size = 11
    end
    object qry_exp_NR_CERTIFICADO: TStringField
      FieldName = 'NR_CERTIFICADO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 10
    end
    object qry_exp_NR_DDE: TStringField
      FieldName = 'NR_DDE'
      Origin = 'TPROCESSO_EXP.CD_MOEDA'
      EditMask = '##########-#;0;'
      Size = 11
    end
    object qry_exp_TX_LOGOMARCA: TStringField
      FieldName = 'TX_LOGOMARCA'
      Origin = 'DBBROKER.TPROCESSO_EXP.TX_LOGOMARCA'
      FixedChar = True
      Size = 25
    end
    object qry_exp_CD_BANCO_SAQUE: TStringField
      FieldName = 'CD_BANCO_SAQUE'
      Origin = 'DBBROKER.TPROCESSO_EXP.CD_BANCO_SAQUE'
      FixedChar = True
      Size = 5
    end
    object qry_exp_VL_INLAND_FREIGHT: TFloatField
      FieldName = 'VL_INLAND_FREIGHT'
      Origin = 'DBBROKER.TPROCESSO_EXP.VL_INLAND_FREIGHT'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object qry_exp_TX_MARCACAO_VOLUME: TMemoField
      FieldName = 'TX_MARCACAO_VOLUME'
      Origin = 'TPROCESSO_EXP.TX_MARCACAO_VOLUME'
      BlobType = ftMemo
    end
    object qry_exp_TX_MARCACAO_VOLUME_ESP: TMemoField
      FieldName = 'TX_MARCACAO_VOLUME_ESP'
      Origin = 'TPROCESSO_EXP.TX_MARCACAO_VOLUME_ESP'
      BlobType = ftMemo
    end
    object qry_exp_CD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'TPROCESSO_EXP.CD_ACORDO'
      FixedChar = True
      Size = 10
    end
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC (NOLOCK) '
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 145
    Top = 368
    object qry_emp_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_emp_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object ds_via_transporte: TDataSource
    DataSet = qry_via_transporte_
    Left = 40
    Top = 104
  end
  object qry_via_transporte_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM  TVIA_TRANSPORTE (NOLOCK)'
      'ORDER BY NM_VIA_TRANSPORTE    ')
    Left = 144
    Top = 104
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
  object qry_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, CD_PAIS'
      'FROM TEMPRESA_EST (NOLOCK)'
      'ORDER BY NM_EMPRESA')
    Left = 145
    Top = 416
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
    object qry_emp_est_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_EST.AP_EMPRESA'
      Size = 10
    end
    object qry_emp_est_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 3
    end
  end
  object ds_emp_est: TDataSource
    DataSet = qry_emp_est_
    Left = 41
    Top = 416
  end
  object qry_lingua_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TIDIOMA (NOLOCK)')
    Left = 144
    Top = 200
    object qry_lingua_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TIDIOMA.CODIGO'
      Size = 1
    end
    object qry_lingua_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIDIOMA.DESCRICAO'
      Size = 30
    end
  end
  object qry_tp_frete_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_FRETE (NOLOCK)')
    Left = 152
    Top = 56
    object qry_tp_frete_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_FRETE.CODIGO'
      Size = 1
    end
    object qry_tp_frete_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_FRETE.DESCRICAO'
      Size = 30
    end
  end
  object qry_tp_pessoa_exp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_PESSOA_EXP (NOLOCK)')
    Left = 144
    Top = 248
    object qry_tp_pessoa_exp_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_PESSOA_EXP.CODIGO'
      Size = 1
    end
    object qry_tp_pessoa_exp_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_PESSOA_EXP.DESCRICAO'
      Size = 40
    end
  end
  object ds_tp_frete: TDataSource
    DataSet = qry_tp_frete_
    Left = 40
    Top = 56
  end
  object ds_tp_pessoa_exp: TDataSource
    DataSet = qry_tp_pessoa_exp_
    Left = 40
    Top = 248
  end
  object ds_lingua: TDataSource
    DataSet = qry_lingua_
    Left = 40
    Top = 200
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 41
    Top = 368
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '')
    Left = 512
    Top = 152
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM TITEM (NOLOCK) '
      'WHERE (CD_TIPO_ITEM = '#39'D'#39')  AND '
      '               (IN_ATIVO = 1)'
      'ORDER BY CD_ITEM')
    Left = 320
    Top = 464
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
  end
  object ds_item: TDataSource
    DataSet = qry_item_
    Left = 232
    Top = 464
  end
  object qry_exp_desp_: TQuery
    BeforeInsert = qry_exp_desp_BeforeInsert
    BeforeEdit = qry_exp_desp_BeforeEdit
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPROCESSO_EXP_DESP (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 320
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_exp_desp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_DESP.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_desp_NR_SEQUENCIA: TStringField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TPROCESSO_EXP_DESP.NR_SEQUENCIA'
      Size = 5
    end
    object qry_exp_desp_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TPROCESSO_EXP_DESP.CD_ITEM'
      Size = 3
    end
    object qry_exp_desp_VL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
      Origin = 'TPROCESSO_EXP_DESP.VL_DESPESA'
      OnChange = qry_exp_desp_VL_DESPESAChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_desp_LookNmItem: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 60
      Lookup = True
    end
  end
  object ds_exp_desp: TDataSource
    DataSet = qry_exp_desp_
    Left = 232
    Top = 8
  end
  object qry_exp_tot_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TOTAL=COUNT(*)'
      'FROM TPROCESSO_EXP_DESP (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 512
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_exp_tot_desp_TOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
  end
  object qry_ret_tot_despesa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TOTAL= SUM( VL_DESPESA )'
      'FROM TPROCESSO_EXP_DESP (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 512
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ret_tot_despesa_TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qry_exp_itens_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO'
      'FROM TPROCESSO_EXP_ITEM (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 410
    Top = 55
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_exp_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_ITEM.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_PAIS_ORIGEM, CD_LOCAL_EMBARQUE, CD_LOCAL_' +
        'DESEMBARQUE,'
      
        '  CD_PAIS_DESTINO, TP_FRETE, CD_REPRESENTANTE, CD_MOEDA_MLE, NR_' +
        'DDE, NR_FATURA,'
      
        '  CD_DESPACHANTE, CD_AGENTE, VL_FRETE_COLLECT_MNEG, VL_MLE_MNEG,' +
        ' VL_CIF_MN,'
      
        '  VL_PESO_BRUTO, VL_PESO_LIQUIDO, VL_SEGURO_MNEG, DT_REG_DDE, IN' +
        '_ETIQUETA,'
      
        '  CD_EMP_EST, CD_EXPORTADOR, VL_FRETE_PREPAID_MNEG, CD_IMPORTADO' +
        'R,'
      '  CD_LINGUA_PEDIDO, CD_VIA_TRANSPORTE,'
      '  CASE'
      
        '    WHEN CD_PAIS_DESTINO IN ('#39'063'#39','#39'097'#39','#39'158'#39','#39'169'#39','#39'196'#39','#39'199'#39 +
        ','#39'239'#39','#39'245'#39','#39'317'#39','#39'331'#39','#39'345'#39','#39'493'#39','#39'521'#39','#39'580'#39','#39'586'#39','#39'589'#39','#39'64' +
        '7'#39','#39'687'#39','#39'845'#39','#39'850'#39')'
      '    THEN '#39'2'#39
      '    ELSE '#39'1'#39' '
      '  END AS CD_LINGUA_PAIS'
      'FROM TPROCESSO P (NOLOCK), TSERVICO S (NOLOCK)'
      'WHERE S.CD_SERVICO = P.CD_SERVICO'
      '  AND NR_PROCESSO = :NR_PROCESSO')
    Left = 408
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'DBBROKER.TPROCESSO.CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_processo_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'DBBROKER.TPROCESSO.CD_LOCAL_EMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      Origin = 'DBBROKER.TPROCESSO.CD_PAIS_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_processo_CD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'DBBROKER.TPROCESSO.CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TPROCESSO.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'DBBROKER.TPROCESSO.CD_REPRESENTANTE'
      FixedChar = True
      Size = 5
    end
    object qry_processo_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'DBBROKER.TPROCESSO.CD_MOEDA_MLE'
      FixedChar = True
      Size = 3
    end
    object qry_processo_NR_DDE: TStringField
      FieldName = 'NR_DDE'
      Origin = 'DBBROKER.TPROCESSO.NR_DDE'
      FixedChar = True
      Size = 11
    end
    object qry_processo_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPROCESSO.NR_FATURA'
      FixedChar = True
      Size = 30
    end
    object qry_processo_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'DBBROKER.TPROCESSO.CD_DESPACHANTE'
      FixedChar = True
      Size = 3
    end
    object qry_processo_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'DBBROKER.TPROCESSO.CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_VL_FRETE_COLLECT_MNEG: TFloatField
      FieldName = 'VL_FRETE_COLLECT_MNEG'
      Origin = 'DBBROKER.TPROCESSO.VL_FRETE_COLLECT_MNEG'
    end
    object qry_processo_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      Origin = 'DBBROKER.TPROCESSO.VL_MLE_MNEG'
    end
    object qry_processo_VL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
      Origin = 'DBBROKER.TPROCESSO.VL_CIF_MN'
    end
    object qry_processo_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'DBBROKER.TPROCESSO.VL_PESO_BRUTO'
    end
    object qry_processo_VL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'DBBROKER.TPROCESSO.VL_PESO_LIQUIDO'
    end
    object qry_processo_VL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
      Origin = 'DBBROKER.TPROCESSO.VL_SEGURO_MNEG'
    end
    object qry_processo_DT_REG_DDE: TDateTimeField
      FieldName = 'DT_REG_DDE'
      Origin = 'DBBROKER.TPROCESSO.DT_REG_DDE'
    end
    object qry_processo_IN_ETIQUETA: TStringField
      FieldName = 'IN_ETIQUETA'
      Origin = 'DBBROKER.TPROCESSO.IN_ETIQUETA'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      Origin = 'DBBROKER.TPROCESSO.CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_processo_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TPROCESSO.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_processo_VL_FRETE_PREPAID_MNEG: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MNEG'
      Origin = 'DBBROKER.TPROCESSO.VL_FRETE_PREPAID_MNEG'
    end
    object qry_processo_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'DBBROKER.TPROCESSO.CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_processo_CD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      Origin = 'DBBROKER.TPROCESSO.CD_LINGUA_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'DBBROKER.TSERVICO.CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_processo_CD_LINGUA_PAIS: TStringField
      FieldName = 'CD_LINGUA_PAIS'
      FixedChar = True
      Size = 1
    end
  end
  object ds_exp_re_: TDataSource
    DataSet = qry_exp_re_
    Left = 232
    Top = 56
  end
  object qry_exp_re_: TQuery
    BeforeInsert = qry_exp_re_BeforeInsert
    BeforeEdit = qry_exp_re_BeforeEdit
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPROCESSO_EXP_RE (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 320
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_exp_re_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_RE.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_re_NR_RE: TStringField
      FieldName = 'NR_RE'
      Origin = 'TPROCESSO_EXP_RE.NR_PROCESSO'
      EditMask = '!99/9999999-999;0;_'
      Size = 12
    end
    object qry_exp_re_DT_RE: TDateTimeField
      DisplayLabel = 'dd/mm/yyyy'
      FieldName = 'DT_RE'
      Origin = 'TPROCESSO_EXP_RE.NR_PROCESSO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_exp_re_CD_NBM_SH: TStringField
      FieldName = 'CD_NBM_SH'
      Origin = 'TPROCESSO_EXP_RE.NR_PROCESSO'
      EditMask = '9999\.99\.9999;0;_'
      Size = 11
    end
    object qry_exp_re_VL_FOB: TFloatField
      FieldName = 'VL_FOB'
      Origin = 'TPROCESSO_EXP_RE.NR_RE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_re_QT_PESO_LIQ: TFloatField
      FieldName = 'QT_PESO_LIQ'
      Origin = 'TPROCESSO_EXP_RE.DT_RE'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_exp_re_NR_TRANSM_RE: TStringField
      FieldName = 'NR_TRANSM_RE'
      Origin = 'TPROCESSO_EXP_RE.DT_RE'
      Size = 10
    end
    object qry_exp_re_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TPROCESSO_EXP_RE.CD_NBM_SH'
      Size = 1
    end
    object qry_exp_re_LookCanal: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCanal'
      LookupDataSet = qry_tp_canal_
      LookupKeyFields = 'CD_CANAL'
      LookupResultField = 'NM_CANAL'
      KeyFields = 'CD_CANAL'
      Lookup = True
    end
  end
  object qry_exp_verif_re_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPROCESSO_EXP_RE (NOLOCK) '
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '              NR_RE = :NR_RE'
      '')
    Left = 407
    Top = 416
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_RE'
        ParamType = ptUnknown
      end>
  end
  object ds_exp_nf: TDataSource
    DataSet = qry_exp_nf_
    Left = 14
    Top = 522
  end
  object qry_exp_nf_: TQuery
    CachedUpdates = True
    BeforeInsert = qry_exp_nf_BeforeInsert
    BeforeEdit = qry_exp_nf_BeforeEdit
    AfterPost = qry_exp_nf_AfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TPROCESSO_EXP_NF (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = Upd_Nf
    Left = 150
    Top = 527
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_exp_nf_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_EXP_NF.NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 18
    end
    object qry_exp_nf_NR_NF: TStringField
      FieldName = 'NR_NF'
      Origin = 'DBBROKER.TPROCESSO_EXP_NF.NR_NF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object qry_exp_nf_VL_NOTA: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VL_NOTA'
      Origin = 'DBBROKER.TPROCESSO_EXP_NF.NR_NF'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_nf_NF_SERIE: TStringField
      FieldName = 'NF_SERIE'
      Origin = 'DBBROKER.TPROCESSO_EXP_NF.NF_SERIE'
      FixedChar = True
      Size = 3
    end
    object qry_exp_nf_VL_TAXA: TFloatField
      DisplayLabel = 'Taxa de Convers'#227'o'
      FieldName = 'VL_TAXA'
      Origin = 'DBBROKER.TPROCESSO_EXP_NF.VL_TAXA'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_exp_nf_CHAVE_NOTA: TStringField
      FieldName = 'CHAVE_NOTA'
      Origin = 'DBBROKER.TPROCESSO_EXP_NF.CHAVE_NOTA'
      FixedChar = True
      Size = 44
    end
    object qry_exp_nf_DT_NOTA: TDateTimeField
      DisplayLabel = 'Data Nota'
      FieldName = 'DT_NOTA'
      Origin = 'DBBROKER.TPROCESSO_EXP_NF.DT_NOTA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
  end
  object qry_exp_verif_nf_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPROCESSO_EXP_NF (NOLOCK) '
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '              NR_NF = :NR_NF'
      '')
    Left = 407
    Top = 464
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_NF'
        ParamType = ptUnknown
      end>
  end
  object ds_ret_obs_imp: TDataSource
    DataSet = qry_ret_obs_imp_
    Left = 232
    Top = 368
  end
  object qry_ret_obs_imp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT TX_OBS_IMP'
      'FROM TEMPRESA_EST (NOLOCK)'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Left = 320
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_ret_obs_imp_TX_OBS_IMP: TMemoField
      FieldName = 'TX_OBS_IMP'
      Origin = 'TEMPRESA_EST.TX_OBS_IMP'
      BlobType = ftMemo
    end
  end
  object qry_exp_ped_: TQuery
    CachedUpdates = True
    BeforeInsert = qry_exp_ped_BeforeInsert
    BeforeEdit = qry_exp_ped_BeforeEdit
    AfterPost = qry_exp_ped_AfterDelete
    AfterDelete = qry_exp_ped_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM  TPROCESSO_EXP_PEDIDO (NOLOCK) '
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = updExpPedido
    Left = 321
    Top = 297
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_exp_ped_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_exp_ped_NR_PEDIDO: TStringField
      DisplayWidth = 30
      FieldName = 'NR_PEDIDO'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.NR_PEDIDO'
      FixedChar = True
      Size = 30
    end
    object qry_exp_ped_NR_FATURA: TStringField
      DisplayWidth = 30
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.NR_FATURA'
      FixedChar = True
      Size = 30
    end
    object qry_exp_ped_TX_MARCACAO_VOLUME: TMemoField
      FieldName = 'TX_MARCACAO_VOLUME'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.TX_MARCACAO_VOLUME'
      BlobType = ftMemo
    end
    object qry_exp_ped_TX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.TX_INF_EMBALAGEM'
      BlobType = ftMemo
    end
    object qry_exp_ped_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.VL_DESCONTO'
    end
    object qry_exp_ped_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.VL_FRETE'
    end
    object qry_exp_ped_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_exp_ped_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.VL_SEGURO'
    end
    object qry_exp_ped_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.VL_ACRESCIMO'
    end
    object qry_exp_ped_VL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.VL_PESO_LIQUIDO'
    end
    object qry_exp_ped_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.VL_PESO_BRUTO'
    end
    object qry_exp_ped_VL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.VL_CUBAGEM'
    end
    object qry_exp_ped_IN_INTEGRADO: TStringField
      FieldName = 'IN_INTEGRADO'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.IN_INTEGRADO'
      FixedChar = True
      Size = 1
    end
    object qry_exp_ped_VL_INLAND_FREIGHT: TFloatField
      FieldName = 'VL_INLAND_FREIGHT'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.VL_INLAND_FREIGHT'
    end
    object qry_exp_ped_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
    end
    object qry_exp_ped_AP_CONTAINER_FATURA: TStringField
      FieldName = 'AP_CONTAINER_FATURA'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.AP_CONTAINER_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_exp_ped_DS_PEDIDO_IMP: TStringField
      DisplayWidth = 40
      FieldName = 'DS_PEDIDO_IMP'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.DS_PEDIDO_IMP'
      FixedChar = True
      Size = 40
    end
    object qry_exp_ped_OBS_CERTIFICADOORIGEM: TMemoField
      FieldName = 'OBS_CERTIFICADOORIGEM'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.OBS_CERTIFICADOORIGEM'
      BlobType = ftMemo
    end
  end
  object ds_exp_ped: TDataSource
    DataSet = qry_exp_ped_
    Left = 234
    Top = 298
  end
  object qry_tp_canal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_CANAL (NOLOCK)')
    Left = 407
    Top = 368
  end
  object qry_dde_re_: TQuery
    BeforeInsert = qry_dde_re_BeforeInsert
    BeforeEdit = qry_dde_re_BeforeEdit
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPROCESSO_EXP_DDE_RE (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 320
    Top = 155
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_dde_re_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_DDE_RE.NR_PROCESSO'
      Size = 18
    end
    object qry_dde_re_NR_RE: TStringField
      DisplayLabel = 'RE'
      FieldName = 'NR_RE'
      Origin = 'TPROCESSO_EXP_DDE_RE.NR_RE'
      EditMask = '!99/9999999;0;_'
      Size = 12
    end
    object qry_dde_re_NR_ANEXO_INI: TStringField
      DisplayLabel = 'Anexo Inicial'
      FieldName = 'NR_ANEXO_INI'
      Origin = 'TPROCESSO_EXP_DDE_RE.NR_PROCESSO'
      EditMask = '999;0;'
      Size = 3
    end
    object qry_dde_re_NR_ANEXO_FIM: TStringField
      DisplayLabel = 'Anexo Final'
      FieldName = 'NR_ANEXO_FIM'
      Origin = 'TPROCESSO_EXP_DDE_RE.NR_RE'
      EditMask = '999;0;'
      Size = 3
    end
  end
  object qry_dde_nf_: TQuery
    BeforeInsert = qry_dde_nf_BeforeInsert
    BeforeEdit = qry_dde_nf_BeforeEdit
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPROCESSO_EXP_DDE_NF (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 320
    Top = 202
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_dde_nf_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_DDE_NF.NR_PROCESSO'
      Size = 18
    end
    object qry_dde_nf_NR_NF_INI: TStringField
      DisplayLabel = 'Nota Fiscal Inicial'
      FieldName = 'NR_NF_INI'
      Origin = 'TPROCESSO_EXP_DDE_NF.NR_PROCESSO'
      Size = 10
    end
    object qry_dde_nf_NR_NF_FIM: TStringField
      DisplayLabel = 'Nota Fiscal Final'
      FieldName = 'NR_NF_FIM'
      Origin = 'TPROCESSO_EXP_DDE_NF.NR_NF_INI'
      Size = 10
    end
    object qry_dde_nf_SERIE_NF: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE_NF'
      Origin = 'TPROCESSO_EXP_DDE_NF.NR_PROCESSO'
      Size = 3
    end
  end
  object ds_dde_re: TDataSource
    DataSet = qry_dde_re_
    Left = 232
    Top = 155
  end
  object ds_dde_nf: TDataSource
    DataSet = qry_dde_nf_
    Left = 232
    Top = 202
  end
  object sp_exp_calcula: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exp_calcula'
    Left = 512
    Top = 200
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
  object sp_atz_evento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_evento'
    Left = 512
    Top = 248
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
        Name = '@cd_evento_txt'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_realizacao'
        ParamType = ptInput
      end>
  end
  object qry_ttp_pos_ad_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP_POS_AD, NM_TP_POS_AD'
      'FROM TTP_POS_AD (NOLOCK)')
    Left = 144
    Top = 296
    object qry_ttp_pos_ad_TP_POS_AD: TStringField
      FieldName = 'TP_POS_AD'
      Origin = 'TTP_POS_AD.TP_POS_AD'
      Size = 1
    end
    object qry_ttp_pos_ad_NM_TP_POS_AD: TStringField
      FieldName = 'NM_TP_POS_AD'
      Origin = 'TTP_POS_AD.NM_TP_POS_AD'
    end
  end
  object qry_cliente_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT IN_NUM_FAT_EXP_AUT'
      'FROM   TPROCESSO P (NOLOCK), TCLIENTE_HABILITACAO H (NOLOCK)'
      'WHERE  P.NR_PROCESSO = :NR_PROCESSO AND'
      '       P.CD_CLIENTE = H.CD_CLIENTE AND'
      '       P.CD_UNID_NEG = H.CD_UNID_NEG AND'
      '       P.CD_PRODUTO = H.CD_PRODUTO')
    Left = 512
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_cliente_habilitacao_IN_NUM_FAT_EXP_AUT: TStringField
      FieldName = 'IN_NUM_FAT_EXP_AUT'
      Origin = 'TCLIENTE_HABILITACAO.IN_NUM_FAT_EXP_AUT'
      Size = 1
    end
  end
  object qry_atz_des_re_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_RE '
      'FROM    TPROCESSO_EXP_RE (NOLOCK) '
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '              SUBSTRING(NR_RE,1,9)  =  :NR_RE')
    Left = 320
    Top = 416
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_RE'
        ParamType = ptUnknown
      end>
  end
  object ds_atz_des_re: TDataSource
    DataSet = qry_atz_des_re_
    Left = 232
    Top = 416
  end
  object qry_atz_des_re_dde_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_RE '
      'FROM    TPROCESSO_EXP_DDE_RE (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO '
      '      AND SUBSTRING(NR_RE,1,9)  =  :NR_RE'
      '      AND NR_ANEXO_INI = :NR_ANEXO_INI'
      '      AND NR_ANEXO_FIM = :NR_ANEXO_FIM'
      '    ')
    Left = 145
    Top = 464
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_RE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ANEXO_INI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ANEXO_FIM'
        ParamType = ptUnknown
      end>
  end
  object ds_atz_des_re_dde: TDataSource
    DataSet = qry_atz_des_re_dde_
    Left = 41
    Top = 464
  end
  object qry_taxa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( TX_CAMBIO, 0 ) AS TX_CAMBIO'
      'FROM   TTAXA_CAMBIO (NOLOCK)'
      'WHERE CD_MOEDA = :CD_MOEDA'
      
        'AND CONVERT( datetime, CONVERT( char(10), GETDATE(), 103 ), 103 ' +
        ') BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA'
      '')
    Left = 408
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptInput
      end>
    object qry_taxa_TX_CAMBIO: TFloatField
      FieldName = 'TX_CAMBIO'
    end
  end
  object ds_controle_re: TDataSource
    DataSet = qry_controle_re
    OnStateChange = ds_controle_reStateChange
    Left = 234
    Top = 250
  end
  object qry_controle_re: TQuery
    AutoCalcFields = False
    CachedUpdates = True
    AfterInsert = qry_controle_reAfterInsert
    AfterPost = qry_controle_reAfterPost
    AfterDelete = qry_controle_reAfterDelete
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      
        'SELECT NR_RE_SISCOMEX, DT_DATA_RE, CD_STATUS_RE, TX_SITUACAO_RE,' +
        ' '
      
        '       DT_DATA_TRANSMISSAO, CD_NUMERO_TRANSMISSAO, VL_ESQUE_PG_T' +
        'OTAL,'
      
        '       PESO_LIQUIDO_TOTAL, QT_ANEXOS, NR_PROCESSO, NR_PROCESSO_C' +
        'OMPLEMENTO, IN_SELECIONADO'
      '  FROM TRE_CAPA (NOLOCK)'
      ' WHERE NR_PROCESSO = :NR_PROCESSO '
      '')
    UpdateObject = up_controle_re
    Left = 322
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_controle_reNR_RE_SISCOMEX: TStringField
      FieldName = 'NR_RE_SISCOMEX'
      Origin = 'DBBROKER.TRE_CAPA.NR_RE_SISCOMEX'
      FixedChar = True
      Size = 30
    end
    object qry_controle_reDT_DATA_RE: TDateTimeField
      FieldName = 'DT_DATA_RE'
      Origin = 'DBBROKER.TRE_CAPA.DT_DATA_RE'
      EditMask = '99/99/9999;1;_'
    end
    object qry_controle_reCD_STATUS_RE: TStringField
      FieldName = 'CD_STATUS_RE'
      Origin = 'DBBROKER.TRE_CAPA.CD_STATUS_RE'
      FixedChar = True
      Size = 1
    end
    object qry_controle_reTX_SITUACAO_RE: TStringField
      FieldName = 'TX_SITUACAO_RE'
      Origin = 'DBBROKER.TRE_CAPA.TX_SITUACAO_RE'
      FixedChar = True
      Size = 40
    end
    object qry_controle_reDT_DATA_TRANSMISSAO: TDateTimeField
      FieldName = 'DT_DATA_TRANSMISSAO'
      Origin = 'DBBROKER.TRE_CAPA.DT_DATA_TRANSMISSAO'
    end
    object qry_controle_reCD_NUMERO_TRANSMISSAO: TIntegerField
      FieldName = 'CD_NUMERO_TRANSMISSAO'
      Origin = 'DBBROKER.TRE_CAPA.CD_NUMERO_TRANSMISSAO'
    end
    object qry_controle_reVL_ESQUE_PG_TOTAL: TFloatField
      FieldName = 'VL_ESQUE_PG_TOTAL'
      Origin = 'DBBROKER.TRE_CAPA.VL_ESQUE_PG_TOTAL'
      DisplayFormat = '#0,.00'
    end
    object qry_controle_rePESO_LIQUIDO_TOTAL: TFloatField
      FieldName = 'PESO_LIQUIDO_TOTAL'
      Origin = 'DBBROKER.TRE_CAPA.PESO_LIQUIDO_TOTAL'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0,.00000'
    end
    object qry_controle_reQT_ANEXOS: TIntegerField
      FieldName = 'QT_ANEXOS'
      Origin = 'DBBROKER.TRE_CAPA.QT_ANEXOS'
    end
    object qry_controle_reNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRE_CAPA.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_controle_reNR_PROCESSO_COMPLEMENTO: TStringField
      FieldName = 'NR_PROCESSO_COMPLEMENTO'
      Origin = 'DBBROKER.TRE_CAPA.NR_PROCESSO_COMPLEMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_controle_reIN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TRE_CAPA.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
  end
  object up_controle_re: TUpdateSQL
    ModifySQL.Strings = (
      'update TRE_CAPA'
      'set'
      '  NR_RE_SISCOMEX = :NR_RE_SISCOMEX,'
      '  DT_DATA_RE = :DT_DATA_RE,'
      '  CD_STATUS_RE = :CD_STATUS_RE,'
      '  TX_SITUACAO_RE = :TX_SITUACAO_RE,'
      '  VL_ESQUE_PG_TOTAL = :VL_ESQUE_PG_TOTAL,'
      '  PESO_LIQUIDO_TOTAL = :PESO_LIQUIDO_TOTAL,'
      '  QT_ANEXOS = :QT_ANEXOS,'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO,'
      '  IN_SELECIONADO = :IN_SELECIONADO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO')
    InsertSQL.Strings = (
      'insert into TRE_CAPA'
      
        '  (NR_RE_SISCOMEX, DT_DATA_RE, CD_STATUS_RE, TX_SITUACAO_RE, VL_' +
        'ESQUE_PG_TOTAL, '
      
        '   PESO_LIQUIDO_TOTAL, QT_ANEXOS, NR_PROCESSO, NR_PROCESSO_COMPL' +
        'EMENTO, '
      '   IN_SELECIONADO)'
      'values'
      
        '  (:NR_RE_SISCOMEX, :DT_DATA_RE, :CD_STATUS_RE, :TX_SITUACAO_RE,' +
        ' :VL_ESQUE_PG_TOTAL, '
      
        '   :PESO_LIQUIDO_TOTAL, :QT_ANEXOS, :NR_PROCESSO, :NR_PROCESSO_C' +
        'OMPLEMENTO, '
      '   :IN_SELECIONADO)')
    DeleteSQL.Strings = (
      'delete from TRE_CAPA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO')
    Left = 408
    Top = 152
  end
  object ds_ttp_pos_ad: TDataSource
    DataSet = qry_ttp_pos_ad_
    Left = 40
    Top = 296
  end
  object qry_forma_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM TFORMA_PAGAR (NOLOCK)')
    Left = 144
    Top = 152
    object qry_forma_pagto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TFORMA_PAGAR.CODIGO'
      Size = 1
    end
    object qry_forma_pagto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TFORMA_PAGAR.DESCRICAO'
      Size = 30
    end
  end
  object ds_forma_pagto: TDataSource
    DataSet = qry_forma_pagto_
    Left = 40
    Top = 152
  end
  object updExpPedido: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_EXP_PEDIDO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PEDIDO = :NR_PEDIDO,'
      '  NR_FATURA = :NR_FATURA,'
      '  TX_MARCACAO_VOLUME = :TX_MARCACAO_VOLUME,'
      '  TX_INF_EMBALAGEM = :TX_INF_EMBALAGEM,'
      '  VL_DESCONTO = :VL_DESCONTO,'
      '  VL_FRETE = :VL_FRETE,'
      '  TX_MERCADORIA = :TX_MERCADORIA,'
      '  VL_SEGURO = :VL_SEGURO,'
      '  VL_ACRESCIMO = :VL_ACRESCIMO,'
      '  VL_PESO_LIQUIDO = :VL_PESO_LIQUIDO,'
      '  VL_PESO_BRUTO = :VL_PESO_BRUTO,'
      '  VL_CUBAGEM = :VL_CUBAGEM,'
      '  VL_INLAND_FREIGHT = :VL_INLAND_FREIGHT,'
      '  NR_CNTR = :NR_CNTR,'
      '  AP_CONTAINER_FATURA = :AP_CONTAINER_FATURA,'
      '  DS_PEDIDO_IMP = :DS_PEDIDO_IMP,'
      '  OBS_CERTIFICADOORIGEM = :OBS_CERTIFICADOORIGEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PEDIDO = :OLD_NR_PEDIDO')
    InsertSQL.Strings = (
      'insert into TPROCESSO_EXP_PEDIDO'
      
        '  (NR_PROCESSO, NR_PEDIDO, NR_FATURA, TX_MARCACAO_VOLUME, TX_INF' +
        '_EMBALAGEM, '
      
        '   VL_DESCONTO, VL_FRETE, TX_MERCADORIA, VL_SEGURO, VL_ACRESCIMO' +
        ', VL_PESO_LIQUIDO, '
      
        '   VL_PESO_BRUTO, VL_CUBAGEM, VL_INLAND_FREIGHT, NR_CNTR, AP_CON' +
        'TAINER_FATURA, '
      '   DS_PEDIDO_IMP, OBS_CERTIFICADOORIGEM)'
      'values'
      
        '  (:NR_PROCESSO, :NR_PEDIDO, :NR_FATURA, :TX_MARCACAO_VOLUME, :T' +
        'X_INF_EMBALAGEM, '
      
        '   :VL_DESCONTO, :VL_FRETE, :TX_MERCADORIA, :VL_SEGURO, :VL_ACRE' +
        'SCIMO, '
      
        '   :VL_PESO_LIQUIDO, :VL_PESO_BRUTO, :VL_CUBAGEM, :VL_INLAND_FRE' +
        'IGHT, :NR_CNTR, '
      '   :AP_CONTAINER_FATURA, :DS_PEDIDO_IMP, :OBS_CERTIFICADOORIGEM)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_EXP_PEDIDO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PEDIDO = :OLD_NR_PEDIDO')
    Left = 412
    Top = 299
  end
  object qryRefCliente: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM   TREF_CLIENTE (NOLOCK)')
    Left = 616
    Top = 352
  end
  object dtsRefCliente: TDataSource
    DataSet = qryRefCliente
    Left = 528
    Top = 352
  end
  object qry_exp_itens_Imp: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPROCESSO_EXP_ITEM (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 613
    Top = 409
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_embalagem_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      
        'SELECT CD_EMBALAGEM, CD_EMBALAGEM_SUP, NM_EMBALAGEM_S, NM_EMBALA' +
        'GEM_P, QT_EMBALAGEM_SUP'
      'FROM TEMBALAGEM (NOLOCK)')
    Left = 523
    Top = 420
    object qry_embalagem_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'DBBROKER.TEMBALAGEM.CD_EMBALAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_embalagem_CD_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_EMBALAGEM_SUP'
      Origin = 'DBBROKER.TEMBALAGEM.CD_EMBALAGEM_SUP'
      FixedChar = True
      Size = 4
    end
    object qry_embalagem_NM_EMBALAGEM_S: TStringField
      FieldName = 'NM_EMBALAGEM_S'
      Origin = 'DBBROKER.TEMBALAGEM.NM_EMBALAGEM_S'
      FixedChar = True
      Size = 50
    end
    object qry_embalagem_NM_EMBALAGEM_P: TStringField
      FieldName = 'NM_EMBALAGEM_P'
      Origin = 'DBBROKER.TEMBALAGEM.NM_EMBALAGEM_P'
      FixedChar = True
      Size = 50
    end
    object qry_embalagem_QT_EMBALAGEM_SUP: TFloatField
      FieldName = 'QT_EMBALAGEM_SUP'
      Origin = 'DBBROKER.TEMBALAGEM.QT_EMBALAGEM_SUP'
    end
  end
  object qry_merc_acordo_norma_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT A.CD_ACORDO, M.CD_MERCADORIA, M.CD_NORMA, M.CD_NCM_DOC, M' +
        '.NR_SEQ_NCM, M.CD_NALADI_SH_DOC, M.NR_SEQ_NALADI, M.TX_MERCADORI' +
        'A'
      
        'FROM   TACORDO_PAIS A (NOLOCK), TMERC_EXP_ACORDO M (NOLOCK), TNO' +
        'RMAS N (NOLOCK)'
      'WHERE  M.CD_ACORDO = A.CD_ACORDO AND'
      '       M.CD_NORMA = N.CODIGO AND'
      '       A.CD_PAIS = :CD_PAIS AND'
      '       N.CD_PAIS = :CD_PAIS AND'
      '       M.CD_MERCADORIA = :CD_MERCADORIA')
    Left = 527
    Top = 484
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PAIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PAIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_merc_acordo_norma_CD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'TMERC_EXP_ACORDO.CD_ACORDO'
      Size = 10
    end
    object qry_merc_acordo_norma_CD_NORMA: TStringField
      FieldName = 'CD_NORMA'
      Origin = 'TMERC_EXP_ACORDO.CD_NORMA'
      Size = 10
    end
    object qry_merc_acordo_norma_CD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      Origin = 'TACORDO_PAIS.CD_ACORDO'
      Size = 40
    end
    object qry_merc_acordo_norma_CD_NCM_DOC: TStringField
      FieldName = 'CD_NCM_DOC'
      Origin = 'TMERC_EXP_ACORDO.CD_MERCADORIA'
      Size = 8
    end
    object qry_merc_acordo_norma_NR_SEQ_NCM: TIntegerField
      FieldName = 'NR_SEQ_NCM'
      Origin = 'TMERC_EXP_ACORDO.CD_NORMA'
    end
    object qry_merc_acordo_norma_CD_NALADI_SH_DOC: TStringField
      FieldName = 'CD_NALADI_SH_DOC'
      Origin = 'TMERC_EXP_ACORDO.CD_NCM_DOC'
      Size = 8
    end
    object qry_merc_acordo_norma_NR_SEQ_NALADI: TIntegerField
      FieldName = 'NR_SEQ_NALADI'
      Origin = 'TMERC_EXP_ACORDO.NR_SEQ_NCM'
    end
    object qry_merc_acordo_norma_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TMERC_EXP_ACORDO.CD_NALADI_SH_DOC'
      BlobType = ftMemo
    end
  end
  object Upd_exp: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_EXP'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_OUTRAS_REF = :NR_OUTRAS_REF,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  CD_IMPORTADOR = :CD_IMPORTADOR,'
      '  CD_DESPACHANTE = :CD_DESPACHANTE,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  CD_PAIS_DESTINO = :CD_PAIS_DESTINO,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  CD_VIA_TRANSPORTE = :CD_VIA_TRANSPORTE,'
      '  CD_TRANSPORTADORA = :CD_TRANSPORTADORA,'
      '  CD_SEGURADORA = :CD_SEGURADORA,'
      '  CD_REPRESENTANTE = :CD_REPRESENTANTE,'
      '  CD_LOCAL_ORIGEM = :CD_LOCAL_ORIGEM,'
      '  CD_LOCAL_DESTINO = :CD_LOCAL_DESTINO,'
      '  CD_URF_DESPACHO = :CD_URF_DESPACHO,'
      '  CD_URF_DESTINO = :CD_URF_DESTINO,'
      '  CD_TERMO_PAGTO = :CD_TERMO_PAGTO,'
      '  CD_FORMA_PAGTO = :CD_FORMA_PAGTO,'
      '  CD_LINGUA_PEDIDO = :CD_LINGUA_PEDIDO,'
      '  CD_TIPO_FRETE = :CD_TIPO_FRETE,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  CD_CARTA_CREDITO = :CD_CARTA_CREDITO,'
      '  CD_INST_NEGOC = :CD_INST_NEGOC,'
      '  CD_CONSIGNATARIO = :CD_CONSIGNATARIO,'
      '  CD_NOTIFY1 = :CD_NOTIFY1,'
      '  CD_NOTIFY2 = :CD_NOTIFY2,'
      '  DT_REGISTRO_PEDIDO = :DT_REGISTRO_PEDIDO,'
      '  DT_FATURA = :DT_FATURA,'
      '  IN_DRAWBACK = :IN_DRAWBACK,'
      '  NR_LI = :NR_LI,'
      '  NR_FATURA = :NR_FATURA,'
      '  QT_TOTAL_ITENS = :QT_TOTAL_ITENS,'
      '  TX_INF_EMBALAGEM = :TX_INF_EMBALAGEM,'
      '  TX_MARCACAO_VOLUME = :TX_MARCACAO_VOLUME,'
      '  TX_TERMO_PAGTO = :TX_TERMO_PAGTO,'
      '  TX_DECL_ADICIONAL = :TX_DECL_ADICIONAL,'
      '  TX_DECL_EXPORTADOR = :TX_DECL_EXPORTADOR,'
      '  TP_NOTIFY1 = :TP_NOTIFY1,'
      '  TP_NOTIFY2 = :TP_NOTIFY2,'
      '  TP_CONSIGNATARIO = :TP_CONSIGNATARIO,'
      '  VL_FRETE = :VL_FRETE,'
      '  VL_SEGURO = :VL_SEGURO,'
      '  VL_PESO_BRUTO = :VL_PESO_BRUTO,'
      '  VL_PESO_LIQUIDO = :VL_PESO_LIQUIDO,'
      '  VL_DESCONTO = :VL_DESCONTO,'
      '  VL_COMISSAO_PERCENT = :VL_COMISSAO_PERCENT,'
      '  VL_TOT_ORIGEM = :VL_TOT_ORIGEM,'
      '  VL_TOT_CUBAGEM = :VL_TOT_CUBAGEM,'
      '  VL_TOT_FOB = :VL_TOT_FOB,'
      '  VL_TOT_COM_AGENTE = :VL_TOT_COM_AGENTE,'
      '  VL_TOT_QTDE_PROD = :VL_TOT_QTDE_PROD,'
      '  VL_TOT_QTDE_EMBALAGEM = :VL_TOT_QTDE_EMBALAGEM,'
      '  VL_TOT_MCV = :VL_TOT_MCV,'
      '  VL_TOT_EXW = :VL_TOT_EXW,'
      '  VL_TX_CAMBIO = :VL_TX_CAMBIO,'
      '  VL_TOT_CONTAINER = :VL_TOT_CONTAINER,'
      '  VL_TOT_PALLETS = :VL_TOT_PALLETS,'
      '  VL_TOT_DESPESA = :VL_TOT_DESPESA,'
      '  NR_SD = :NR_SD,'
      '  NR_CERTIFICADO = :NR_CERTIFICADO,'
      '  CD_LOCAL_EMISSAO = :CD_LOCAL_EMISSAO,'
      '  CD_ACORDO = :CD_ACORDO,'
      '  TX_OBSERVACAO = :TX_OBSERVACAO,'
      '  TX_CABECALHO = :TX_CABECALHO,'
      '  DT_SD = :DT_SD,'
      '  IN_FABR_EXPO = :IN_FABR_EXPO,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_PAIS_ORIGEM = :CD_PAIS_ORIGEM,'
      '  TP_COPIA = :TP_COPIA,'
      '  CD_COPIA = :CD_COPIA,'
      '  TP_DOCUMENTO = :TP_DOCUMENTO,'
      '  CD_DOCUMENTO = :CD_DOCUMENTO,'
      '  CD_PAIS_ORIG = :CD_PAIS_ORIG,'
      '  IN_VENDA_INCOTERM = :IN_VENDA_INCOTERM,'
      '  TX_MERCADORIA_BL = :TX_MERCADORIA_BL,'
      '  IN_DECL_AD_INSTR_EMB = :IN_DECL_AD_INSTR_EMB,'
      '  IN_DECL_AD_PACKING_LIST = :IN_DECL_AD_PACKING_LIST,'
      '  CD_BANCO_SAQUE_BORDERO = :CD_BANCO_SAQUE_BORDERO,'
      '  NR_DDE = :NR_DDE,'
      '  IN_REFERENCIA_FAT_INST = :IN_REFERENCIA_FAT_INST,'
      '  DT_REG_DDE = :DT_REG_DDE,'
      '  IN_ETIQUETA = :IN_ETIQUETA,'
      '  CD_ENQUAD_OP = :CD_ENQUAD_OP,'
      '  VL_SEM_COBERTURA_CAMBIAL = :VL_SEM_COBERTURA_CAMBIAL,'
      '  TX_DECL_ADIC_INST_EMB = :TX_DECL_ADIC_INST_EMB,'
      '  TX_CRIT_ORIG_FORM_A = :TX_CRIT_ORIG_FORM_A,'
      '  CD_LOCAL_DESPACHO = :CD_LOCAL_DESPACHO,'
      '  VL_ACRESCIMO = :VL_ACRESCIMO,'
      '  TP_POS_AD = :TP_POS_AD,'
      '  in_num_fat_auto = :in_num_fat_auto,'
      '  VL_FRETE_INT = :VL_FRETE_INT,'
      '  TX_LOGOMARCA = :TX_LOGOMARCA,'
      '  CD_BANCO_SAQUE = :CD_BANCO_SAQUE,'
      '  VL_INLAND_FREIGHT = :VL_INLAND_FREIGHT,'
      '  TX_MARCACAO_VOLUME_ESP = :TX_MARCACAO_VOLUME_ESP'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO_EXP'
      
        '  (NR_PROCESSO, NR_OUTRAS_REF, CD_EXPORTADOR, CD_IMPORTADOR, CD_' +
        'DESPACHANTE, '
      
        '   CD_AGENTE, CD_INCOTERM, CD_PAIS_DESTINO, CD_MOEDA, CD_VIA_TRA' +
        'NSPORTE, '
      
        '   CD_TRANSPORTADORA, CD_SEGURADORA, CD_REPRESENTANTE, CD_LOCAL_' +
        'ORIGEM, '
      
        '   CD_LOCAL_DESTINO, CD_URF_DESPACHO, CD_URF_DESTINO, CD_TERMO_P' +
        'AGTO, CD_FORMA_PAGTO, '
      
        '   CD_LINGUA_PEDIDO, CD_TIPO_FRETE, CD_USUARIO, CD_CARTA_CREDITO' +
        ', CD_INST_NEGOC, '
      
        '   CD_CONSIGNATARIO, CD_NOTIFY1, CD_NOTIFY2, DT_REGISTRO_PEDIDO,' +
        ' DT_FATURA, '
      
        '   IN_DRAWBACK, NR_LI, NR_FATURA, QT_TOTAL_ITENS, TX_INF_EMBALAG' +
        'EM, TX_MARCACAO_VOLUME, '
      
        '   TX_TERMO_PAGTO, TX_DECL_ADICIONAL, TX_DECL_EXPORTADOR, TP_NOT' +
        'IFY1, TP_NOTIFY2, '
      
        '   TP_CONSIGNATARIO, VL_FRETE, VL_SEGURO, VL_PESO_BRUTO, VL_PESO' +
        '_LIQUIDO, '
      
        '   VL_DESCONTO, VL_COMISSAO_PERCENT, VL_TOT_ORIGEM, VL_TOT_CUBAG' +
        'EM, VL_TOT_FOB, '
      
        '   VL_TOT_COM_AGENTE, VL_TOT_QTDE_PROD, VL_TOT_QTDE_EMBALAGEM, V' +
        'L_TOT_MCV, '
      
        '   VL_TOT_EXW, VL_TX_CAMBIO, VL_TOT_CONTAINER, VL_TOT_PALLETS, V' +
        'L_TOT_DESPESA, '
      
        '   NR_SD, NR_CERTIFICADO, CD_LOCAL_EMISSAO, CD_ACORDO, TX_OBSERV' +
        'ACAO, TX_CABECALHO, '
      
        '   DT_SD, IN_FABR_EXPO, CD_FABRICANTE, CD_PAIS_ORIGEM, TP_COPIA,' +
        ' CD_COPIA, '
      
        '   TP_DOCUMENTO, CD_DOCUMENTO, CD_PAIS_ORIG, IN_VENDA_INCOTERM, ' +
        'TX_MERCADORIA_BL, '
      
        '   IN_DECL_AD_INSTR_EMB, IN_DECL_AD_PACKING_LIST, CD_BANCO_SAQUE' +
        '_BORDERO, '
      
        '   NR_DDE, IN_REFERENCIA_FAT_INST, DT_REG_DDE, IN_ETIQUETA, CD_E' +
        'NQUAD_OP, '
      
        '   VL_SEM_COBERTURA_CAMBIAL, TX_DECL_ADIC_INST_EMB, TX_CRIT_ORIG' +
        '_FORM_A, '
      
        '   CD_LOCAL_DESPACHO, VL_ACRESCIMO, TP_POS_AD, in_num_fat_auto, ' +
        'VL_FRETE_INT, '
      
        '   TX_LOGOMARCA, CD_BANCO_SAQUE, VL_INLAND_FREIGHT, TX_MARCACAO_' +
        'VOLUME_ESP)'
      'values'
      
        '  (:NR_PROCESSO, :NR_OUTRAS_REF, :CD_EXPORTADOR, :CD_IMPORTADOR,' +
        ' :CD_DESPACHANTE, '
      
        '   :CD_AGENTE, :CD_INCOTERM, :CD_PAIS_DESTINO, :CD_MOEDA, :CD_VI' +
        'A_TRANSPORTE, '
      
        '   :CD_TRANSPORTADORA, :CD_SEGURADORA, :CD_REPRESENTANTE, :CD_LO' +
        'CAL_ORIGEM, '
      
        '   :CD_LOCAL_DESTINO, :CD_URF_DESPACHO, :CD_URF_DESTINO, :CD_TER' +
        'MO_PAGTO, '
      
        '   :CD_FORMA_PAGTO, :CD_LINGUA_PEDIDO, :CD_TIPO_FRETE, :CD_USUAR' +
        'IO, :CD_CARTA_CREDITO, '
      
        '   :CD_INST_NEGOC, :CD_CONSIGNATARIO, :CD_NOTIFY1, :CD_NOTIFY2, ' +
        ':DT_REGISTRO_PEDIDO, '
      
        '   :DT_FATURA, :IN_DRAWBACK, :NR_LI, :NR_FATURA, :QT_TOTAL_ITENS' +
        ', :TX_INF_EMBALAGEM, '
      
        '   :TX_MARCACAO_VOLUME, :TX_TERMO_PAGTO, :TX_DECL_ADICIONAL, :TX' +
        '_DECL_EXPORTADOR, '
      
        '   :TP_NOTIFY1, :TP_NOTIFY2, :TP_CONSIGNATARIO, :VL_FRETE, :VL_S' +
        'EGURO, '
      
        '   :VL_PESO_BRUTO, :VL_PESO_LIQUIDO, :VL_DESCONTO, :VL_COMISSAO_' +
        'PERCENT, '
      
        '   :VL_TOT_ORIGEM, :VL_TOT_CUBAGEM, :VL_TOT_FOB, :VL_TOT_COM_AGE' +
        'NTE, :VL_TOT_QTDE_PROD, '
      
        '   :VL_TOT_QTDE_EMBALAGEM, :VL_TOT_MCV, :VL_TOT_EXW, :VL_TX_CAMB' +
        'IO, :VL_TOT_CONTAINER, '
      
        '   :VL_TOT_PALLETS, :VL_TOT_DESPESA, :NR_SD, :NR_CERTIFICADO, :C' +
        'D_LOCAL_EMISSAO, '
      
        '   :CD_ACORDO, :TX_OBSERVACAO, :TX_CABECALHO, :DT_SD, :IN_FABR_E' +
        'XPO, :CD_FABRICANTE, '
      
        '   :CD_PAIS_ORIGEM, :TP_COPIA, :CD_COPIA, :TP_DOCUMENTO, :CD_DOC' +
        'UMENTO, '
      
        '   :CD_PAIS_ORIG, :IN_VENDA_INCOTERM, :TX_MERCADORIA_BL, :IN_DEC' +
        'L_AD_INSTR_EMB, '
      
        '   :IN_DECL_AD_PACKING_LIST, :CD_BANCO_SAQUE_BORDERO, :NR_DDE, :' +
        'IN_REFERENCIA_FAT_INST, '
      
        '   :DT_REG_DDE, :IN_ETIQUETA, :CD_ENQUAD_OP, :VL_SEM_COBERTURA_C' +
        'AMBIAL, '
      
        '   :TX_DECL_ADIC_INST_EMB, :TX_CRIT_ORIG_FORM_A, :CD_LOCAL_DESPA' +
        'CHO, :VL_ACRESCIMO, '
      
        '   :TP_POS_AD, :in_num_fat_auto, :VL_FRETE_INT, :TX_LOGOMARCA, :' +
        'CD_BANCO_SAQUE, '
      '   :VL_INLAND_FREIGHT, :TX_MARCACAO_VOLUME_ESP)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_EXP'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 96
    Top = 8
  end
  object sp_calcula_sda: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_calcula_sda'
    Left = 512
    Top = 296
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
      end>
  end
  object qry_acordos_normas: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT PAN.CD_PAIS, PAN.CD_ACORDO, PAN.CD_NORMA, PAN.CD_IDIOMA, ' +
        'P.NM_PAIS PAIS, I.DESCRICAO IDIOMA, N.NM_DESCRICAO NORMA'
      'FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO PAN (NOLOCK)'
      '   INNER JOIN TPAIS_BROKER P (NOLOCK) ON P.CD_PAIS = PAN.CD_PAIS'
      '   INNER JOIN TIDIOMA I (NOLOCK) ON I.CODIGO = PAN.CD_IDIOMA'
      '   LEFT  JOIN TNORMAS N (NOLOCK) ON N.CODIGO = PAN.CD_NORMA'
      'WHERE PAN.CD_PAIS = :CD_PAIS'
      'ORDER BY CD_ACORDO')
    Left = 289
    Top = 515
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PAIS'
        ParamType = ptInput
      end>
    object qry_acordos_normasCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TCONFIG_PAIS_ACORDO_NORMA_PADRAO.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_acordos_normasCD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'DBBROKER.TCONFIG_PAIS_ACORDO_NORMA_PADRAO.CD_ACORDO'
      FixedChar = True
      Size = 10
    end
    object qry_acordos_normasCD_NORMA: TStringField
      FieldName = 'CD_NORMA'
      Origin = 'DBBROKER.TCONFIG_PAIS_ACORDO_NORMA_PADRAO.CD_NORMA'
      FixedChar = True
      Size = 10
    end
    object qry_acordos_normasCD_IDIOMA: TStringField
      FieldName = 'CD_IDIOMA'
      Origin = 'DBBROKER.TCONFIG_PAIS_ACORDO_NORMA_PADRAO.CD_IDIOMA'
      FixedChar = True
      Size = 1
    end
    object qry_acordos_normasPais: TStringField
      FieldName = 'Pais'
      FixedChar = True
      Size = 120
    end
    object qry_acordos_normasIdioma: TStringField
      FieldName = 'Idioma'
      FixedChar = True
      Size = 30
    end
    object qry_acordos_normasNorma: TStringField
      FieldName = 'Norma'
      FixedChar = True
      Size = 200
    end
  end
  object ds_acordos_normas: TDataSource
    DataSet = qry_acordos_normas
    Left = 393
    Top = 515
  end
  object qryProcContainer: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_CNTR'
      'FROM  TPROCESSO_CNTR (NOLOCK) '
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 642
    Top = 21
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryProcContainerNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
    end
  end
  object dsProcContainer: TDataSource
    DataSet = cdsProcContainer
    Left = 640
    Top = 177
  end
  object cdsProcContainer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcContainer'
    Left = 644
    Top = 121
    object cdsProcContainerNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
    end
  end
  object dspProcContainer: TDataSetProvider
    DataSet = qryProcContainer
    Left = 644
    Top = 71
  end
  object qryUpdateProcesso: TQuery
    AfterOpen = qry_exp_AfterOpen
    BeforeInsert = qry_exp_BeforeInsert
    BeforeEdit = qry_exp_BeforeEdit
    BeforePost = qry_exp_BeforePost
    AfterPost = qry_exp_AfterPost
    AfterCancel = qry_exp_AfterCancel
    AfterDelete = qry_exp_AfterDelete
    AfterScroll = qry_exp_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TPROCESSO '
      'SET CD_RUC = :CD_RUC'
      'FROM   TPROCESSO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 644
    Top = 493
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_RUC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object Upd_Nf: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE TPROCESSO_EXP_NF'
      'SET'
      '   NR_PROCESSO = :NR_PROCESSO,'
      '  NR_NF       = :NR_NF,'
      '  DT_NOTA    = :DT_NOTA,'
      '  VL_NOTA    = :VL_NOTA,'
      '  NF_SERIE   = :NF_SERIE,'
      '  VL_TAXA    = :VL_TAXA,'
      '  CHAVE_NOTA = :CHAVE_NOTA'
      'WHERE'
      '      NR_PROCESSO = :OLD_NR_PROCESSO'
      '  AND NR_NF       = :OLD_NR_NF ')
    InsertSQL.Strings = (
      'INSERT INTO TPROCESSO_EXP_NF'
      
        '  (NR_PROCESSO,   NR_NF,  DT_NOTA,  VL_NOTA,  NF_SERIE,  VL_TAXA' +
        ',  CHAVE_NOTA )'
      'VALUES'
      
        '  (:NR_PROCESSO, :NR_NF, :DT_NOTA, :VL_NOTA, :NF_SERIE, :VL_TAXA' +
        ',  :CHAVE_NOTA)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_EXP_NF'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_NF = :OLD_NR_NF')
    Left = 86
    Top = 518
  end
  object qry_acordo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.CODIGO, A.NOME, A.IN_ATIVO, A.FIESP_ID'
      'FROM TACORDO A '
      'INNER JOIN TACORDO_PAIS P ON P.CD_ACORDO=A.CODIGO '
      'WHERE P.CD_PAIS  = :CD_PAIS and IN_ATIVO = '#39'1'#39
      'ORDER BY CODIGO')
    Left = 611
    Top = 542
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PAIS'
        ParamType = ptInput
        Value = '023'
      end>
    object qry_acordo_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TACORDO.CODIGO'
      Size = 10
    end
    object qry_acordo_NOME: TStringField
      FieldName = 'NOME'
      Origin = 'TACORDO.NOME'
      Size = 50
    end
    object qry_acordo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TACORDO.IN_ATIVO'
      Size = 1
    end
    object qry_acordo_FIESP_ID: TIntegerField
      FieldName = 'FIESP_ID'
    end
  end
  object ds_acordo: TDataSource
    DataSet = qry_acordo_
    Left = 507
    Top = 542
  end
end
