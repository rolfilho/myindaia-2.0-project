object datm_dem_fat: Tdatm_dem_fat
  OldCreateOrder = True
  Left = 398
  Top = 184
  Height = 382
  Width = 516
  object qry_fat_cntr_: TQuery
    AfterOpen = qry_fat_cntr_AfterOpen
    AfterClose = qry_fat_cntr_AfterClose
    BeforePost = qry_fat_cntr_BeforePost
    AfterPost = qry_fat_cntr_AfterPost
    AfterScroll = qry_fat_cntr_AfterScroll
    OnCalcFields = qry_fat_cntr_CalcFields
    OnPostError = qry_fat_cntr_PostError
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, NR_FATURA, NR_CNTR, NR_PROCESSO, NR_PERIODO,' +
        ' NR_DIAS_COBRADOS, VL_DIARIA,'
      
        '       VL_FATURA_MNEG, CD_MOEDA_FATURA, TX_FATURA, VL_FATURA_MN,' +
        ' VL_DESCONTO_MNEG, VL_DESCONTO,'
      
        '       VL_DEPOSITO, VL_ACRESCIMO_MNEG, VL_ACRESCIMO, VL_TOTAL, I' +
        'N_PARCIAL, DT_INICIO,'
      
        '       DT_FIM, DT_VENCIMENTO, DT_PAGAMENTO, NR_SOLIC_PAGTO, IN_R' +
        'ECIBO, IN_FATURADO, DT_FATURA'
      'FROM   TDEM_FAT_CNTR'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       NR_FATURA   = :NR_FATURA   AND'
      '       NR_CNTR     = :NR_CNTR     AND'
      '       NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_PERIODO  = :NR_PERIODO')
    Left = 125
    Top = 107
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PERIODO'
        ParamType = ptInput
      end>
    object qry_fat_cntr_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TDEMURRAGE_FATURA.CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_cntr_NR_FATURA: TStringField
      DisplayLabel = 'N'#186' Fatura'
      FieldName = 'NR_FATURA'
      Origin = 'TDEMURRAGE_FATURA.NR_FATURA'
    end
    object qry_fat_cntr_NR_CNTR: TStringField
      DisplayLabel = 'N'#186' Cont'#226'iner'
      FieldName = 'NR_CNTR'
      Origin = 'TDEMURRAGE_FATURA.NR_CNTR'
      OnChange = qry_fat_cntr_NR_CNTRChange
      EditMask = 'LLLL-999-999-9;0;_'
    end
    object qry_fat_cntr_NR_PROCESSO: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TDEMURRAGE_FATURA.NR_PROCESSO'
      OnChange = qry_fat_cntr_NR_PROCESSOChange
      Size = 18
    end
    object qry_fat_cntr_NR_PERIODO: TStringField
      FieldName = 'NR_PERIODO'
      Size = 3
    end
    object qry_fat_cntr_CD_MOEDA_FATURA: TStringField
      FieldName = 'CD_MOEDA_FATURA'
      Origin = 'TDEMURRAGE_FATURA.CD_MOEDA_FATURA'
      Size = 3
    end
    object qry_fat_cntr_TX_FATURA: TFloatField
      FieldName = 'TX_FATURA'
      Origin = 'TDEMURRAGE_FATURA.TX_FATURA'
      OnChange = qry_fat_cntr_TX_FATURAChange
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_fat_cntr_VL_DIARIA: TFloatField
      FieldName = 'VL_DIARIA'
      Origin = 'TDEMURRAGE_FATURA.VL_DIARIA'
      OnChange = qry_fat_cntr_VL_DIARIAChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cntr_VL_FATURA_MNEG: TFloatField
      FieldName = 'VL_FATURA_MNEG'
      Origin = 'TDEMURRAGE_FATURA.VL_FATURA_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cntr_VL_FATURA_MN: TFloatField
      DisplayLabel = 'Valor Fatura'
      FieldName = 'VL_FATURA_MN'
      Origin = 'TDEMURRAGE_FATURA.VL_FATURA_MN'
      OnChange = qry_fat_cntr_VL_FATURA_MNChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cntr_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TDEMURRAGE_FATURA.VL_DESCONTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cntr_VL_DEPOSITO: TFloatField
      FieldName = 'VL_DEPOSITO'
      Origin = 'TDEMURRAGE_FATURA.VL_DEPOSITO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cntr_VL_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VL_TOTAL'
      Origin = 'TDEMURRAGE_FATURA.VL_TOTAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cntr_VL_DESCONTO_MNEG: TFloatField
      FieldName = 'VL_DESCONTO_MNEG'
      Origin = 'TDEMURRAGE_FATURA.CD_UNID_NEG'
      OnChange = qry_fat_cntr_VL_DESCONTO_MNEGChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cntr_VL_ACRESCIMO_MNEG: TFloatField
      FieldName = 'VL_ACRESCIMO_MNEG'
      Origin = 'TDEMURRAGE_FATURA.NR_FATURA'
      OnChange = qry_fat_cntr_VL_ACRESCIMO_MNEGChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cntr_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'TDEMURRAGE_FATURA.NR_CNTR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cntr_DT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
      Origin = 'TDEMURRAGE_FATURA.DT_INICIO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_cntr_DT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
      Origin = 'TDEMURRAGE_FATURA.DT_FIM'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_cntr_DT_VENCIMENTO: TDateTimeField
      DisplayLabel = 'Dt. Vencto'
      FieldName = 'DT_VENCIMENTO'
      Origin = 'TDEMURRAGE_FATURA.DT_VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_cntr_DT_PAGAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'DT_PAGAMENTO'
      Origin = 'TDEMURRAGE_FATURA.DT_PAGAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_cntr_DT_FATURA: TDateTimeField
      DisplayLabel = 'Dt. Fatura'
      FieldName = 'DT_FATURA'
      Origin = 'TDEMURRAGE_FATURA.DT_FATURA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_cntr_IN_PARCIAL: TStringField
      FieldName = 'IN_PARCIAL'
      Origin = 'TDEMURRAGE_FATURA.IN_PARCIAL'
      Size = 1
    end
    object qry_fat_cntr_IN_RECIBO: TStringField
      FieldName = 'IN_RECIBO'
      Origin = 'TDEMURRAGE_FATURA.IN_RECIBO'
      Size = 1
    end
    object qry_fat_cntr_IN_FATURADO: TStringField
      FieldName = 'IN_FATURADO'
      Origin = 'TDEMURRAGE_FATURA.IN_FATURADO'
      Size = 1
    end
    object qry_fat_cntr_NR_SOLIC_PAGTO: TStringField
      FieldName = 'NR_SOLIC_PAGTO'
      Origin = 'TDEMURRAGE_FATURA.NR_SOLIC_PAGTO'
      Size = 3
    end
    object qry_fat_cntr_LookMoeda: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMoeda'
      Size = 30
      Calculated = True
    end
    object qry_fat_cntr_LookParcial: TStringField
      FieldKind = fkLookup
      FieldName = 'LookParcial'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_PARCIAL'
      Size = 3
      Lookup = True
    end
    object qry_fat_cntr_LookRecibo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookRecibo'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_RECIBO'
      Size = 3
      Lookup = True
    end
    object qry_fat_cntr_LookFaturado: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFaturado'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_FATURADO'
      Size = 3
      Lookup = True
    end
    object qry_fat_cntr_LookNrCheque: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookNrCheque'
      Size = 6
      Calculated = True
    end
    object qry_fat_cntr_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
    object qry_fat_cntr_CalcDiasCobrar: TIntegerField
      DisplayLabel = 'Dias a Cobrar'
      FieldKind = fkCalculated
      FieldName = 'CalcDiasCobrar'
      Calculated = True
    end
    object qry_fat_cntr_CalcDiasCorridos: TIntegerField
      DisplayLabel = 'Dias Corridos'
      FieldKind = fkCalculated
      FieldName = 'CalcDiasCorridos'
      Calculated = True
    end
    object qry_fat_cntr_CalcVlTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlTotal'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_fat_cntr_NR_DIAS_COBRADOS: TIntegerField
      FieldName = 'NR_DIAS_COBRADOS'
      Origin = 'TDEM_FAT_CNTR.CD_UNID_NEG'
    end
  end
  object ds_fat_cntr: TDataSource
    DataSet = qry_fat_cntr_
    Left = 125
    Top = 158
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM   TYES_NO')
    Left = 374
    Top = 6
    object qry_yes_no_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 1
    end
    object qry_yes_no_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA'
      'FROM   TMOEDA_BROKER'
      'WHERE  CD_MOEDA = :CD_MOEDA')
    Left = 374
    Top = 57
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptInput
      end>
  end
  object qry_solic_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT NR_DOCTO'
      'FROM   TSOLIC_PAGTO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO AND'
      '       CD_ITEM = :CD_ITEM')
    Left = 374
    Top = 110
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptInput
      end>
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_USUARIO, DT_ABER' +
        'TURA, CD_CLIENTE,'
      
        '       CD_SERVICO, CD_REPRESENTANTE, CD_TRANSP_NAC_DOC, CD_TRANS' +
        'P_NAC, IN_IMP_ARM,'
      
        '       CD_AREA, TX_MERCADORIA, TX_OBSERVACOES, CD_RESTRICAO, CD_' +
        'LIBERADOR, DT_LIBERACAO,'
      
        '       CD_DESPACHANTE, IN_ETIQUETA, IN_LIBERADO, IN_CANCELADO, I' +
        'N_PRODUCAO, TX_OBS_INT,'
      
        '       NR_PRESENCA_CARGA, DT_PRESENCA_CARGA, NR_DI, NR_DA, NR_PE' +
        'RIODO_ARMAZENAGEM,'
      
        '       DT_VENCTO_ARMAZENAGEM, NR_DDE, DT_REG_DDE, IN_ENTREPOSTO,' +
        ' NR_PROCESSO_OR_ENTREPOSTO'
      'FROM   TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 211
    Top = 6
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
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_processo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPROCESSO.CD_USUARIO'
      Size = 4
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
    object qry_processo_CD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'TPROCESSO.CD_REPRESENTANTE'
      Size = 5
    end
    object qry_processo_CD_TRANSP_NAC_DOC: TStringField
      FieldName = 'CD_TRANSP_NAC_DOC'
      Origin = 'TPROCESSO.CD_TRANSP_NAC_DOC'
      Size = 4
    end
    object qry_processo_CD_TRANSP_NAC: TStringField
      FieldName = 'CD_TRANSP_NAC'
      Origin = 'TPROCESSO.CD_TRANSP_NAC'
      Size = 4
    end
    object qry_processo_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TPROCESSO.CD_AREA'
      Size = 2
    end
    object qry_processo_CD_RESTRICAO: TStringField
      FieldName = 'CD_RESTRICAO'
      Origin = 'TPROCESSO.CD_RESTRICAO'
      Size = 1
    end
    object qry_processo_CD_LIBERADOR: TStringField
      FieldName = 'CD_LIBERADOR'
      Origin = 'TPROCESSO.CD_LIBERADOR'
      Size = 4
    end
    object qry_processo_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
    object qry_processo_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPROCESSO.DT_ABERTURA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_processo_DT_LIBERACAO: TDateTimeField
      FieldName = 'DT_LIBERACAO'
      Origin = 'TPROCESSO.DT_LIBERACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_processo_DT_PRESENCA_CARGA: TDateTimeField
      FieldName = 'DT_PRESENCA_CARGA'
      Origin = 'TPROCESSO.NR_PROCESSO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_processo_DT_VENCTO_ARMAZENAGEM: TDateTimeField
      FieldName = 'DT_VENCTO_ARMAZENAGEM'
      Origin = 'TPROCESSO.CD_USUARIO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_processo_DT_REG_DDE: TDateTimeField
      FieldName = 'DT_REG_DDE'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_processo_IN_IMP_ARM: TStringField
      FieldName = 'IN_IMP_ARM'
      Origin = 'TPROCESSO.IN_IMP_ARM'
      Size = 1
    end
    object qry_processo_IN_ETIQUETA: TStringField
      FieldName = 'IN_ETIQUETA'
      Origin = 'TPROCESSO.IN_ETIQUETA'
      Size = 1
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 1
    end
    object qry_processo_IN_PRODUCAO: TStringField
      FieldName = 'IN_PRODUCAO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_IN_ENTREPOSTO: TStringField
      FieldName = 'IN_ENTREPOSTO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_NR_PRESENCA_CARGA: TStringField
      FieldName = 'NR_PRESENCA_CARGA'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 36
    end
    object qry_processo_NR_DI: TStringField
      FieldName = 'NR_DI'
      Origin = 'TPROCESSO.NR_PROCESSO'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object qry_processo_NR_DA: TStringField
      FieldName = 'NR_DA'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object qry_processo_NR_PERIODO_ARMAZENAGEM: TIntegerField
      FieldName = 'NR_PERIODO_ARMAZENAGEM'
      Origin = 'TPROCESSO.CD_PRODUTO'
    end
    object qry_processo_NR_DDE: TStringField
      FieldName = 'NR_DDE'
      Origin = 'TPROCESSO.NR_PROCESSO'
      EditMask = '##########-#;0;_'
      Size = 11
    end
    object qry_processo_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TPROCESSO.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_processo_TX_OBSERVACOES: TMemoField
      FieldName = 'TX_OBSERVACOES'
      Origin = 'TPROCESSO.TX_OBSERVACOES'
      BlobType = ftMemo
    end
    object qry_processo_TX_OBS_INT: TMemoField
      FieldName = 'TX_OBS_INT'
      Origin = 'TPROCESSO.NR_PROCESSO'
      BlobType = ftMemo
    end
    object qry_processo_LookUnidNeg: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUnidNeg'
      Size = 10
      Calculated = True
    end
    object qry_processo_LookProduto: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookProduto'
      Size = 40
      Calculated = True
    end
    object qry_processo_LookUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUsuario'
      Size = 50
      Calculated = True
    end
    object qry_processo_CalcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
    object qry_processo_LookCliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCliente'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookServico: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookServico'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookRepresentante: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookRepresentante'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookViaTransporte: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookViaTransporte'
      Size = 2
      Calculated = True
    end
    object qry_processo_LookTranspNac: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookTranspNac'
      Size = 60
      Calculated = True
    end
    object qry_processo_LookTranspNacDoc: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookTranspNacDoc'
      Size = 60
      Calculated = True
    end
    object qry_processo_LookArea: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookArea'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookRestricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookRestricao'
      Size = 30
      Calculated = True
    end
    object qry_processo_LookLiberador: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookLiberador'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookServicoAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookServicoAtivo'
      Size = 1
      Calculated = True
    end
    object qry_processo_LookDespachante: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookDespachante'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookImpArm: TStringField
      FieldKind = fkLookup
      FieldName = 'LookImpArm'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_IMP_ARM'
      Size = 3
      Lookup = True
    end
    object qry_processo_LookEtiqueta: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEtiqueta'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ETIQUETA'
      Size = 3
      Lookup = True
    end
    object qry_processo_LookEntreposto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEntreposto'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ENTREPOSTO'
      Size = 3
      Lookup = True
    end
    object qry_processo_NR_PROCESSO_OR_ENTREPOSTO: TStringField
      FieldName = 'NR_PROCESSO_OR_ENTREPOSTO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO, AP_PRODUTO'
      'FROM   TPRODUTO'
      'WHERE  CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_PRODUTO IN ( SELECT CD_PRODUTO'
      '                       FROM   TUSUARIO_HABILITACAO'
      '                       WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                              IN_ATIVO = '#39'1'#39' )'
      '')
    Left = 374
    Top = 213
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UP.CD_UNID_NEG, U.AP_UNID_NEG, UP.CD_PRODUTO, P.AP_PRODUT' +
        'O'
      'FROM   TUNID_NEG_PRODUTO UP, TUNID_NEG U, TPRODUTO P'
      'WHERE  UP.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '       UP.CD_PRODUTO = P.CD_PRODUTO AND'
      '       ( UP.CD_UNID_NEG + UP.CD_PRODUTO ) IN'
      '          ( SELECT ( CD_UNID_NEG + CD_PRODUTO )'
      '            FROM   TUSUARIO_HABILITACAO'
      '            WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                   IN_ATIVO = '#39'1'#39' )'
      ''
      '')
    Left = 374
    Top = 262
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG '
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_UNID_NEG IN ( SELECT CD_UNID_NEG'
      '                        FROM   TUSUARIO_HABILITACAO'
      '                        WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                               IN_ATIVO = '#39'1'#39' )'
      '')
    Left = 374
    Top = 162
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
  end
  object sp_calc_dias_cntr: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_calc_dias_cntr'
    Left = 234
    Top = 266
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
        Name = '@nr_cntr'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_dias_corridos'
        ParamType = ptOutput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@nr_dias_cobrar'
        ParamType = ptOutput
      end>
  end
  object qry_proc_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_CNTR, VL_CHEQUE_CAUCAO, IN_DEPOSITADO'
      'FROM   TPROCESSO_CNTR'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_CNTR = :NR_CNTR')
    Left = 211
    Top = 58
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end>
  end
  object qry_fat_: TQuery
    AfterPost = qry_fat_AfterPost
    AfterScroll = qry_fat_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, NR_FATURA, VL_FATURA, VL_DESCONTO, VL_DEPOSI' +
        'TO, VL_ACRESCIMO,'
      
        '       VL_FATURA_TOTAL, DT_VENCTO, DT_PAGTO, IN_RECIBO, IN_FATUR' +
        'ADO, DT_FATURA, NR_NF, TP_FAT_DEM'
      ',IN_DISPUTE, VL_DISPUTE, OBS_DISPUTE'
      'FROM   TDEM_FAT (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       NR_FATURA   = :NR_FATURA')
    Left = 35
    Top = 107
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end>
    object qry_fat_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TDEM_FAT.CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_NR_FATURA: TStringField
      DisplayLabel = 'N'#186' Fatura'
      FieldName = 'NR_FATURA'
      Origin = 'TDEM_FAT.NR_FATURA'
      OnChange = qry_fat_NR_FATURAChange
    end
    object qry_fat_VL_FATURA: TFloatField
      DisplayLabel = 'Valor Fatura'
      FieldName = 'VL_FATURA'
      Origin = 'TDEM_FAT.VL_FATURA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_VL_DESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'VL_DESCONTO'
      Origin = 'TDEM_FAT.VL_DESCONTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_VL_DEPOSITO: TFloatField
      DisplayLabel = 'Dep'#243'sito'
      FieldName = 'VL_DEPOSITO'
      Origin = 'TDEM_FAT.VL_DEPOSITO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_VL_ACRESCIMO: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'VL_ACRESCIMO'
      Origin = 'TDEM_FAT.VL_ACRESCIMO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_VL_FATURA_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VL_FATURA_TOTAL'
      Origin = 'TDEM_FAT.CD_UNID_NEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_DT_VENCTO: TDateTimeField
      DisplayLabel = 'Dt. Vencto.'
      FieldName = 'DT_VENCTO'
      Origin = 'TDEM_FAT.DT_VENCTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_DT_PAGTO: TDateTimeField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'DT_PAGTO'
      Origin = 'TDEM_FAT.DT_PAGTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_IN_RECIBO: TStringField
      FieldName = 'IN_RECIBO'
      Origin = 'TDEM_FAT.IN_RECIBO'
      Size = 1
    end
    object qry_fat_IN_FATURADO: TStringField
      FieldName = 'IN_FATURADO'
      Origin = 'TDEM_FAT.IN_FATURADO'
      Size = 1
    end
    object qry_fat_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TDEM_FAT.DT_FATURA'
    end
    object qry_fat_LookRecibo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookRecibo'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_RECIBO'
      Size = 3
      Lookup = True
    end
    object qry_fat_LookFaturado: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFaturado'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_FATURADO'
      Size = 3
      Lookup = True
    end
    object qry_fat_NR_NF: TStringField
      FieldName = 'NR_NF'
      Origin = 'TDEM_FAT.CD_UNID_NEG'
      Size = 10
    end
    object qry_fat_TP_FAT_DEM: TStringField
      FieldName = 'TP_FAT_DEM'
      Origin = 'TDEM_FAT.CD_UNID_NEG'
      Size = 1
    end
    object qry_fat_LookTpFatDem: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTpFatDem'
      LookupDataSet = qry_tp_fat_dem_
      LookupKeyFields = 'TP_FAT_DEM'
      LookupResultField = 'NM_TP_FAT_DEM'
      KeyFields = 'TP_FAT_DEM'
      Lookup = True
    end
    object qry_fat_IN_DISPUTE: TStringField
      FieldName = 'IN_DISPUTE'
      Origin = 'TDEM_FAT.IN_DISPUTE'
      Size = 1
    end
    object qry_fat_VL_DISPUTE: TFloatField
      FieldName = 'VL_DISPUTE'
      Origin = 'DBBROKER.TDEM_FAT.VL_DISPUTE'
    end
    object qry_fat_OBS_DISPUTE: TMemoField
      FieldName = 'OBS_DISPUTE'
      Origin = 'DBBROKER.TDEM_FAT.OBS_DISPUTE'
      BlobType = ftMemo
      Size = 1
    end
  end
  object ds_fat: TDataSource
    DataSet = qry_fat_
    Left = 35
    Top = 158
  end
  object qry_totais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT SUM( ISNULL( VL_FATURA_MN, 0 ) ) AS VL_FATURA, SUM( ISNUL' +
        'L( VL_DESCONTO, 0 ) ) AS VL_DESCONTO,'
      
        '       SUM( ISNULL( VL_DEPOSITO, 0 ) ) AS VL_DEPOSITO, SUM( ISNU' +
        'LL( VL_ACRESCIMO, 0 ) ) AS VL_ACRESCIMO,'
      
        '       SUM( ISNULL( VL_FATURA_MN, 0 ) ) - SUM( ISNULL( VL_DESCON' +
        'TO, 0 ) ) -'
      
        '       SUM( ISNULL( VL_DEPOSITO, 0 ) ) + SUM( ISNULL( VL_ACRESCI' +
        'MO, 0 ) ) AS VL_TOTAL'
      'FROM   TDEM_FAT_CNTR ( NOLOCK )'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       NR_FATURA = :NR_FATURA')
    Left = 285
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end>
    object qry_totais_VL_FATURA: TFloatField
      FieldName = 'VL_FATURA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_totais_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_totais_VL_DEPOSITO: TFloatField
      FieldName = 'VL_DEPOSITO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_totais_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_totais_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object qry_dias_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM( ISNULL( NR_DIAS_COBRADOS, 0 ) ) AS NR_DIAS_COBRADOS'
      'FROM   TDEM_FAT_CNTR ( NOLOCK )'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_CNTR     = :NR_CNTR     AND'
      '       NR_FATURA   <> :NR_FATURA')
    Left = 285
    Top = 57
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end>
    object qry_dias_NR_DIAS_COBRADOS: TIntegerField
      FieldName = 'NR_DIAS_COBRADOS'
    end
  end
  object qry_soma_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM(ISNULL(D.VL_FATURA_TOTAL, 0)) VL_TOT_TELA'
      'FROM   TDEM_FAT D (NOLOCK)'
      'WHERE  D.CD_UNID_NEG = :CD_UNID_NEG AND'
      
        '       ( ( D.NR_FATURA = :NR_FATURA ) OR ( :NR_FATURA = '#39#39' ) ) A' +
        'ND'
      '       ( ( D.CD_UNID_NEG+D.NR_FATURA IN '
      '                 ( SELECT C.CD_UNID_NEG+C.NR_FATURA'
      '                   FROM   TDEM_FAT_CNTR C'
      '                   WHERE  D.CD_UNID_NEG *= C.CD_UNID_NEG AND'
      '                          D.NR_FATURA   *= C.NR_FATURA AND'
      
        '                          C.NR_CNTR     = :NR_CNTR ) ) OR ( :NR_' +
        'CNTR = '#39#39' ) ) AND'
      '       ( ( D.CD_UNID_NEG+D.NR_FATURA IN'
      '                 ( SELECT C.CD_UNID_NEG+C.NR_FATURA'
      '                   FROM   TDEM_FAT_CNTR C'
      '                   WHERE  D.CD_UNID_NEG *= C.CD_UNID_NEG AND'
      '                          D.NR_FATURA   *= C.NR_FATURA AND'
      
        '                          C.NR_PROCESSO = :NR_PROCESSO ) ) OR ( ' +
        ':NR_PROCESSO = '#39#39' ) )')
    Left = 33
    Top = 214
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_soma_fat_VL_TOT_TELA: TFloatField
      FieldName = 'VL_TOT_TELA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object qry_soma_fat_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM( ISNULL( VL_TOTAL, 0 ) ) AS VL_TOT_TELA'
      'FROM   TDEM_FAT_CNTR (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       ( ( NR_FATURA = :NR_FATURA ) OR ( :NR_FATURA = '#39#39' ) ) AND'
      '       ( ( NR_CNTR = :NR_CNTR ) OR ( :NR_CNTR = '#39#39' ) ) AND'
      
        '       ( ( NR_PROCESSO = :NR_PROCESSO ) OR ( :NR_PROCESSO = '#39#39' )' +
        ' )')
    Left = 123
    Top = 214
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_soma_fat_cntr_VL_TOT_TELA: TFloatField
      FieldName = 'VL_TOT_TELA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_soma_fat: TDataSource
    DataSet = qry_soma_fat_
    Left = 33
    Top = 265
  end
  object ds_soma_fat_cntr: TDataSource
    DataSet = qry_soma_fat_cntr_
    Left = 123
    Top = 265
  end
  object qry_lista_cntr_: TQuery
    AfterScroll = qry_lista_cntr_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NR_FATURA, NR_CNTR, NR_PROCESSO, NR_PERIODO,'
      '       SUBSTRING( NR_PROCESSO, 5, 14 ) AS CalcNrProcesso,'
      '       NR_DIAS_COBRADOS, VL_TOTAL, DT_VENCIMENTO, DT_PAGAMENTO'
      'FROM   TDEM_FAT_CNTR'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       ( ( NR_FATURA = :NR_FATURA ) OR ( :NR_FATURA = '#39#39' ) ) AND'
      '       ( ( NR_CNTR = :NR_CNTR ) OR ( :NR_CNTR = '#39#39' ) ) AND'
      
        '       ( ( NR_PROCESSO = :NR_PROCESSO ) OR ( :NR_PROCESSO = '#39#39' )' +
        ' )')
    Left = 125
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_lista_cntr_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_lista_cntr_NR_FATURA: TStringField
      DisplayLabel = 'N'#186' Fatura'
      FieldName = 'NR_FATURA'
    end
    object qry_lista_cntr_NR_CNTR: TStringField
      DisplayLabel = 'N'#186' Cntr'
      FieldName = 'NR_CNTR'
      EditMask = 'LLLL-999-999-9;0;_'
    end
    object qry_lista_cntr_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_lista_cntr_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldName = 'CalcNrProcesso'
      Size = 14
    end
    object qry_lista_cntr_NR_PERIODO: TStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'NR_PERIODO'
      Size = 3
    end
    object qry_lista_cntr_VL_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_cntr_DT_VENCIMENTO: TDateTimeField
      DisplayLabel = 'Dt. Vencto.'
      FieldName = 'DT_VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_lista_cntr_DT_PAGAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Pagto.'
      FieldName = 'DT_PAGAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_lista_cntr_NR_DIAS_COBRADOS: TIntegerField
      FieldName = 'NR_DIAS_COBRADOS'
    end
  end
  object ds_lista_cntr: TDataSource
    DataSet = qry_lista_cntr_
    Left = 125
    Top = 57
  end
  object qry_lista_fat_: TQuery
    AfterScroll = qry_lista_fat_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT D.CD_UNID_NEG, D.NR_FATURA, D.DT_VENCTO, D.VL_FATURA, D.V' +
        'L_ACRESCIMO,'
      '       D.VL_DESCONTO, D.VL_DEPOSITO, D.VL_FATURA_TOTAL'
      'FROM   TDEM_FAT D (NOLOCK)'
      'WHERE  D.CD_UNID_NEG = :CD_UNID_NEG AND'
      
        '       ( ( D.NR_FATURA = :NR_FATURA ) OR ( :NR_FATURA = '#39#39' ) ) A' +
        'ND'
      '       ( ( D.CD_UNID_NEG+D.NR_FATURA IN '
      '                 ( SELECT C.CD_UNID_NEG+C.NR_FATURA'
      '                   FROM   TDEM_FAT_CNTR C'
      '                   WHERE  D.CD_UNID_NEG *= C.CD_UNID_NEG AND'
      '                          D.NR_FATURA   *= C.NR_FATURA AND'
      
        '                          C.NR_CNTR     = :NR_CNTR ) ) OR ( :NR_' +
        'CNTR = '#39#39' ) ) AND'
      '       ( ( D.CD_UNID_NEG+D.NR_FATURA IN'
      '                 ( SELECT C.CD_UNID_NEG+C.NR_FATURA'
      '                   FROM   TDEM_FAT_CNTR C'
      '                   WHERE  D.CD_UNID_NEG *= C.CD_UNID_NEG AND'
      '                          D.NR_FATURA   *= C.NR_FATURA AND'
      
        '                          C.NR_PROCESSO = :NR_PROCESSO ) ) OR ( ' +
        ':NR_PROCESSO = '#39#39' ) )')
    Left = 35
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_lista_fat_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TDEM_FAT.CD_UNID_NEG'
      Size = 2
    end
    object qry_lista_fat_NR_FATURA: TStringField
      DisplayLabel = 'N'#186' Fatura'
      FieldName = 'NR_FATURA'
      Origin = 'TDEM_FAT.NR_FATURA'
    end
    object qry_lista_fat_DT_VENCTO: TDateTimeField
      DisplayLabel = 'Dt. Vencto.'
      FieldName = 'DT_VENCTO'
      Origin = 'TDEM_FAT.DT_VENCTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_lista_fat_VL_FATURA: TFloatField
      DisplayLabel = 'Valor Fatura'
      FieldName = 'VL_FATURA'
      Origin = 'TDEM_FAT.VL_FATURA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_fat_VL_ACRESCIMO: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'VL_ACRESCIMO'
      Origin = 'TDEM_FAT.NR_FATURA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_fat_VL_DESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'VL_DESCONTO'
      Origin = 'TDEM_FAT.VL_DESCONTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_fat_VL_DEPOSITO: TFloatField
      DisplayLabel = 'Dep'#243'sito'
      FieldName = 'VL_DEPOSITO'
      Origin = 'TDEM_FAT.VL_DEPOSITO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_fat_VL_FATURA_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VL_FATURA_TOTAL'
      Origin = 'TDEM_FAT.VL_FATURA_TOTAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_lista_fat: TDataSource
    DataSet = qry_lista_fat_
    Left = 35
    Top = 57
  end
  object qry_vl_total_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ( SUM( ISNULL( VL_FATURA_MN, 0 ) ) - SUM( ISNULL( VL_DESC' +
        'ONTO, 0 ) ) -'
      
        '         SUM( ISNULL( VL_DEPOSITO, 0 ) ) + SUM( ISNULL( VL_ACRES' +
        'CIMO, 0 ) ) ) -'
      
        '       ( SELECT ISNULL( VL_FATURA_MN, 0 ) - ISNULL( VL_DESCONTO,' +
        ' 0 ) -'
      
        '                ISNULL( VL_DEPOSITO, 0 ) + ISNULL( VL_ACRESCIMO,' +
        ' 0 )'
      '         FROM   TDEM_FAT_CNTR ( NOLOCK )'
      '         WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '                NR_FATURA   = :NR_FATURA   AND'
      '                NR_PROCESSO = :NR_PROCESSO AND'
      '                NR_CNTR     = :NR_CNTR     AND'
      '                NR_PERIODO  = :NR_PERIODO ) AS VL_TOTAL'
      'FROM   TDEM_FAT_CNTR ( NOLOCK )'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       NR_FATURA   = :NR_FATURA'
      '')
    Left = 285
    Top = 113
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end>
    object qry_vl_total_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
  end
  object qry_tp_fat_dem_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT TP_FAT_DEM, NM_TP_FAT_DEM'
      'FROM   TTP_FAT_DEM')
    Left = 285
    Top = 162
    object qry_tp_fat_dem_TP_FAT_DEM: TStringField
      FieldName = 'TP_FAT_DEM'
      Origin = 'TTP_FAT_DEM.TP_FAT_DEM'
      Size = 1
    end
    object qry_tp_fat_dem_NM_TP_FAT_DEM: TStringField
      FieldName = 'NM_TP_FAT_DEM'
      Origin = 'TTP_FAT_DEM.NM_TP_FAT_DEM'
    end
  end
end
