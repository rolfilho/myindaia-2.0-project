object datm_exp_itens: Tdatm_exp_itens
  OldCreateOrder = True
  Left = 239
  Top = 200
  Height = 413
  Width = 684
  object ds_exp: TDataSource
    DataSet = qry_exp_
    Left = 32
    Top = 11
  end
  object qry_exp_: TQuery
    CachedUpdates = True
    AfterPost = qry_exp_AfterPost
    AfterDelete = qry_exp_AfterDelete
    OnCalcFields = qry_exp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_INCOTERM, QT_TOTAL_ITENS, CD_EXPORTADOR, ' +
        'CD_IMPORTADOR, VL_TOT_QTDE_PROD, VL_TOT_QTDE_EMBALAGEM, VL_TOT_C' +
        'UBAGEM, '
      
        '       VL_PESO_LIQUIDO, VL_TOT_EXW, VL_TOT_FOB, VL_FRETE, VL_SEG' +
        'URO, VL_TOT_MCV, CD_LINGUA_PEDIDO, IN_FABR_EXPO, CD_FABRICANTE, ' +
        'CD_PAIS_ORIGEM, CD_PAIS_DESTINO'
      'FROM TPROCESSO_EXP (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    UpdateObject = updExp
    Left = 114
    Top = 9
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_CalcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
    object qry_exp_QT_TOTAL_ITENS: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPE.NR_PROCESSO'
      Size = 3
    end
    object qry_exp_VL_TOT_QTDE_PROD: TFloatField
      FieldName = 'VL_TOT_QTDE_PROD'
      Origin = 'TPE.NR_PROCESSO'
    end
    object qry_exp_VL_TOT_QTDE_EMBALAGEM: TFloatField
      FieldName = 'VL_TOT_QTDE_EMBALAGEM'
      Origin = 'TPE.QT_TOTAL_ITENS'
    end
    object qry_exp_VL_TOT_CUBAGEM: TFloatField
      FieldName = 'VL_TOT_CUBAGEM'
      Origin = 'TPE.CD_IMPORTADOR'
    end
    object qry_exp_VL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'TPE.VL_TOT_QTDE_PROD'
    end
    object qry_exp_VL_TOT_EXW: TFloatField
      FieldName = 'VL_TOT_EXW'
      Origin = 'TPE.VL_TOT_QTDE_EMBALAGEM'
    end
    object qry_exp_VL_TOT_FOB: TFloatField
      FieldName = 'VL_TOT_FOB'
      Origin = 'TPE.NR_PROCESSO'
    end
    object qry_exp_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'TPE.QT_TOTAL_ITENS'
    end
    object qry_exp_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPE.CD_IMPORTADOR'
    end
    object qry_exp_VL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      Origin = 'TPE.VL_TOT_QTDE_PROD'
    end
    object qry_exp_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 3
    end
    object qry_exp_CD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 1
    end
    object qry_exp_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 5
    end
    object qry_exp_IN_FABR_EXPO: TStringField
      FieldName = 'IN_FABR_EXPO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 1
    end
    object qry_exp_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPROCESSO_EXP.CD_INCOTERM'
      Size = 5
    end
    object qry_exp_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPROCESSO_EXP.QT_TOTAL_ITENS'
      Size = 3
    end
    object qry_exp_CD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 3
    end
    object qry_exp_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 5
    end
  end
  object ds_exp_itens: TDataSource
    DataSet = qry_exp_itens_
    Left = 32
    Top = 59
  end
  object qry_exp_itens_: TQuery
    CachedUpdates = True
    BeforeInsert = qry_exp_itens_BeforeInsert
    BeforeEdit = qry_exp_itens_BeforeEdit
    BeforePost = qry_exp_itens_BeforePost
    AfterPost = qry_exp_itens_AfterPost
    AfterDelete = qry_exp_itens_AfterDelete
    AfterScroll = qry_exp_itens_AfterScroll
    OnCalcFields = qry_exp_itens_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *, '
      
        '      (SELECT TOP 1 NR_CNTR FROM TPROCESSO_EXP_PEDIDO E (NOLOCK)' +
        ' '
      '        WHERE E.NR_PROCESSO = I.NR_PROCESSO'
      
        '          AND E.NR_FATURA = I.NR_PEDIDO_IMP) AS NR_CONTAINER_PED' +
        'IDO'
      'FROM   TPROCESSO_EXP_ITEM I (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_PROCESSO, NR_ITEM')
    UpdateObject = upd_exp_itens
    Left = 115
    Top = 60
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_exp_itens_NR_PROCESSO: TStringField
      DisplayWidth = 18
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPROCESSO_EXP_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_exp_itens_NR_PEDIDO_IMP: TStringField
      DisplayWidth = 15
      FieldName = 'NR_PEDIDO_IMP'
      Origin = 'TPROCESSO_EXP_ITEM.NR_PEDIDO_IMP'
      Size = 15
    end
    object qry_exp_itens_CD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPROCESSO_EXP_ITEM.CD_MERCADORIA'
      Size = 40
    end
    object qry_exp_itens_CD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'TPROCESSO_EXP_ITEM.CD_NCM'
      OnChange = qry_exp_itens_CD_NCMChange
      EditMask = '9999.99.99;0;_'
      Size = 11
    end
    object qry_exp_itens_CD_SULF_NCM: TStringField
      FieldName = 'CD_SULF_NCM'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.CD_SULF_NCM'
      OnChange = qry_exp_itens_CD_NCMChange
      FixedChar = True
      Size = 2
    end
    object qry_exp_itens_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TPROCESSO_EXP_ITEM.CD_NALADI_SH'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_exp_itens_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'TPROCESSO_EXP_ITEM.CD_UNID_MEDIDA'
      Size = 3
    end
    object qry_exp_itens_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TPROCESSO_EXP_ITEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_exp_itens_CD_CLASSIF_EMBALAGEM: TStringField
      FieldName = 'CD_CLASSIF_EMBALAGEM'
      Origin = 'TPROCESSO_EXP_ITEM.CD_CLASSIF_EMBALAGEM'
      Size = 30
    end
    object qry_exp_itens_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TPROCESSO_EXP_ITEM.CD_FABR_EXPO'
      Size = 1
    end
    object qry_exp_itens_QT_POR_EMB: TFloatField
      FieldName = 'QT_POR_EMB'
      Origin = 'TPROCESSO_EXP_ITEM.QT_POR_EMB'
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object qry_exp_itens_QT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
      Origin = 'TPROCESSO_EXP_ITEM.QT_EMBALAGEM'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object qry_exp_itens_QT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'TPROCESSO_EXP_ITEM.QT_MERCADORIA'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_exp_itens_VL_POR_EMB: TFloatField
      FieldName = 'VL_POR_EMB'
      Origin = 'TPROCESSO_EXP_ITEM.VL_POR_EMB'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_itens_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TPROCESSO_EXP_ITEM.VL_UNITARIO'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
      DisplayFormat = '#0,.000000'
      EditFormat = '#0.000000'
    end
    object qry_exp_itens_VL_PESO_LIQ_UNIT: TFloatField
      FieldName = 'VL_PESO_LIQ_UNIT'
      Origin = 'TPROCESSO_EXP_ITEM.VL_PESO_LIQ_UNIT'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_exp_itens_VL_COMPRIMENTO_EMB: TFloatField
      FieldName = 'VL_COMPRIMENTO_EMB'
      Origin = 'TPROCESSO_EXP_ITEM.VL_COMPRIMENTO_EMB'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qry_exp_itens_VL_LARGURA_EMB: TFloatField
      FieldName = 'VL_LARGURA_EMB'
      Origin = 'TPROCESSO_EXP_ITEM.VL_LARGURA_EMB'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qry_exp_itens_VL_ALTURA_EMB: TFloatField
      FieldName = 'VL_ALTURA_EMB'
      Origin = 'TPROCESSO_EXP_ITEM.VL_ALTURA_EMB'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qry_exp_itens_VL_PESO_EMB: TFloatField
      FieldName = 'VL_PESO_EMB'
      Origin = 'TPROCESSO_EXP_ITEM.VL_PESO_EMB'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qry_exp_itens_VL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
      Origin = 'TPROCESSO_EXP_ITEM.VL_TOT_ITEM'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_itens_VL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
      Origin = 'TPROCESSO_EXP_ITEM.VL_TOT_PESO_LIQ'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_exp_itens_VL_TOT_PESO_BRUTO: TFloatField
      FieldName = 'VL_TOT_PESO_BRUTO'
      Origin = 'TPROCESSO_EXP_ITEM.VL_TOT_PESO_BRUTO'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_exp_itens_VL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
      Origin = 'TPROCESSO_EXP_ITEM.VL_CUBAGEM'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qry_exp_itens_VL_MLE: TFloatField
      FieldName = 'VL_MLE'
      Origin = 'TPROCESSO_EXP_ITEM.VL_MLE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_itens_VL_MCV: TFloatField
      FieldName = 'VL_MCV'
      Origin = 'TPROCESSO_EXP_ITEM.VL_MCV'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_itens_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TPROCESSO_EXP_ITEM.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_exp_itens_NR_PROC_PE: TStringField
      FieldName = 'NR_PROC_PE'
      Origin = 'TPROCESSO_EXP_ITEM.NR_PROC_PE'
      Size = 18
    end
    object qry_exp_itens_NR_ITEM_PE: TStringField
      FieldName = 'NR_ITEM_PE'
      Origin = 'TPROCESSO_EXP_ITEM.NR_ITEM_PE'
      Size = 3
    end
    object qry_exp_itens_CD_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_EMBALAGEM_SUP'
      Origin = 'TPROCESSO_EXP_ITEM.CD_NCM'
      Size = 4
    end
    object qry_exp_itens_CD_CLASSIF_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_CLASSIF_EMBALAGEM_SUP'
      Origin = 'TPROCESSO_EXP_ITEM.CD_NALADI_SH'
      Size = 30
    end
    object qry_exp_itens_QT_POR_EMB_SUP: TFloatField
      FieldName = 'QT_POR_EMB_SUP'
      Origin = 'TPROCESSO_EXP_ITEM.CD_UNID_MEDIDA'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
    end
    object qry_exp_itens_QT_EMBALAGEM_SUP: TFloatField
      FieldName = 'QT_EMBALAGEM_SUP'
      Origin = 'TPROCESSO_EXP_ITEM.CD_EMBALAGEM'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
    end
    object qry_exp_itens_VL_POR_EMB_SUP: TFloatField
      FieldName = 'VL_POR_EMB_SUP'
      Origin = 'TPROCESSO_EXP_ITEM.CD_CLASSIF_EMBALAGEM'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_exp_itens_CD_EMBALAGEM_CLIENTE: TStringField
      FieldName = 'CD_EMBALAGEM_CLIENTE'
      Origin = 'TPROCESSO_EXP_ITEM.CD_FABR_EXPO'
      Size = 10
    end
    object qry_exp_itens_CD_NORMAS: TStringField
      FieldName = 'CD_NORMAS'
      Origin = 'TPROCESSO_EXP_ITEM.CD_NCM'
      Size = 10
    end
    object qry_exp_itens_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPROCESSO_EXP_ITEM.CD_UNID_MEDIDA'
      Size = 5
    end
    object qry_exp_itens_NR_PEDIDO: TStringField
      DisplayWidth = 30
      FieldName = 'NR_PEDIDO'
      Origin = 'TPROCESSO_EXP_ITEM.CD_EMBALAGEM'
      Size = 30
    end
    object qry_exp_itens_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPROCESSO_EXP_ITEM.CD_UNID_MEDIDA'
      Size = 3
    end
    object qry_exp_itens_CD_NCM_DOC: TStringField
      FieldName = 'CD_NCM_DOC'
      Origin = 'TPROCESSO_EXP_ITEM.CD_UNID_MEDIDA'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_exp_itens_CD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'TPROCESSO_EXP_ITEM.CD_UNID_MEDIDA'
      Size = 10
    end
    object qry_exp_itens_CD_NALADI_DOC: TStringField
      FieldName = 'CD_NALADI_DOC'
      Origin = 'TPROCESSO_EXP_ITEM.CD_CLASSIF_EMBALAGEM'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_exp_itens_NR_SEQ_NCM_DOC: TIntegerField
      FieldName = 'NR_SEQ_NCM_DOC'
      Origin = 'TPROCESSO_EXP_ITEM.CD_CLASSIF_EMBALAGEM'
    end
    object qry_exp_itens_NR_SEQ_NALADI_DOC: TIntegerField
      FieldName = 'NR_SEQ_NALADI_DOC'
      Origin = 'TPROCESSO_EXP_ITEM.CD_FABR_EXPO'
    end
    object qry_exp_itens_NR_SEQ_NALADI: TIntegerField
      FieldName = 'NR_SEQ_NALADI'
      Origin = 'TPROCESSO_EXP_ITEM.CD_NALADI_SH'
    end
    object qry_exp_itens_NR_SEQ_NCM: TIntegerField
      FieldName = 'NR_SEQ_NCM'
      Origin = 'TPROCESSO_EXP_ITEM.CD_UNID_MEDIDA'
    end
    object qry_exp_itens_NR_ANEXO: TStringField
      FieldName = 'NR_ANEXO'
      Origin = 'TPROCESSO_EXP_ITEM.CD_EMBALAGEM'
      Size = 3
    end
    object qry_exp_itens_NR_ATO_CONCESSORIO: TStringField
      FieldName = 'NR_ATO_CONCESSORIO'
      Origin = 'TPROCESSO_EXP_ITEM.CD_CLASSIF_EMBALAGEM'
      Size = 13
    end
    object qry_exp_itens_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TPROCESSO_EXP_ITEM.CD_CLASSIF_EMBALAGEM'
      Size = 1
    end
    object qry_exp_itens_DT_REMESSA: TDateTimeField
      FieldName = 'DT_REMESSA'
      Origin = 'TPROCESSO_EXP_ITEM.QT_POR_EMB'
    end
    object qry_exp_itens_NR_ORDER: TStringField
      DisplayWidth = 35
      FieldName = 'NR_ORDER'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.NR_ORDER'
      FixedChar = True
      Size = 35
    end
    object qry_exp_itens_NM_EMB_PACKING: TStringField
      FieldName = 'NM_EMB_PACKING'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.NM_EMB_PACKING'
      FixedChar = True
      Size = 15
    end
    object qry_exp_itens_VL_FRETE_INT: TFloatField
      FieldName = 'VL_FRETE_INT'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.VL_FRETE_INT'
      OnChange = qry_exp_itens_QT_MERCADORIAChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_exp_itens_NR_NF: TStringField
      FieldName = 'NR_NF'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.NR_NF'
      FixedChar = True
      Size = 10
    end
    object qry_exp_itens_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.VL_SEGURO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_exp_itens_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.VL_FRETE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_exp_itens_VL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.VL_DESPESA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_exp_itens_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.VL_DESCONTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_exp_itens_IN_ACORDO: TBooleanField
      FieldName = 'IN_ACORDO'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.IN_ACORDO'
    end
    object qry_exp_itens_TP_ACORDO: TStringField
      FieldName = 'TP_ACORDO'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.TP_ACORDO'
      FixedChar = True
      Size = 1
    end
    object qry_exp_itens_NR_ORDEM_CERT_ORIGEM: TStringField
      FieldName = 'NR_ORDEM_CERT_ORIGEM'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.NR_ORDEM_CERT_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_exp_itens_VL_COM_AGENTE: TFloatField
      FieldName = 'VL_COM_AGENTE'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.VL_COM_AGENTE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_exp_itens_VL_SEM_COBERTURA_CAMBIAL: TFloatField
      FieldName = 'VL_SEM_COBERTURA_CAMBIAL'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.VL_SEM_COBERTURA_CAMBIAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_exp_itens_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.VL_ACRESCIMO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_exp_itens_QT_BAIXADA: TFloatField
      FieldName = 'QT_BAIXADA'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.QT_BAIXADA'
    end
    object qry_exp_itens_TX_BILLING_DOC: TStringField
      FieldName = 'TX_BILLING_DOC'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.TX_BILLING_DOC'
      FixedChar = True
      Size = 10
    end
    object qry_exp_itens_TX_DELIVERY_NOTE: TStringField
      FieldName = 'TX_DELIVERY_NOTE'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.TX_DELIVERY_NOTE'
      FixedChar = True
      Size = 10
    end
    object qry_exp_itens_CD_UNID_MEDIDA_ESTAT: TStringField
      FieldName = 'CD_UNID_MEDIDA_ESTAT'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.CD_UNID_MEDIDA_ESTAT'
      FixedChar = True
      Size = 3
    end
    object qry_exp_itens_QT_UNID_MEDIDA_ESTAT: TFloatField
      FieldName = 'QT_UNID_MEDIDA_ESTAT'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.QT_UNID_MEDIDA_ESTAT'
    end
    object qry_exp_itens_CD_CFOP: TStringField
      DisplayWidth = 5
      FieldName = 'CD_CFOP'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.CD_CFOP'
      EditMask = '#.###;0;_'
      FixedChar = True
      Size = 4
    end
    object qry_exp_itens_NR_CONTAINER_PEDIDO: TStringField
      FieldName = 'NR_CONTAINER_PEDIDO'
      FixedChar = True
    end
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      ''
      '')
    Left = 497
    Top = 107
  end
  object qry_naladi_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CODIGO'
      'FROM TNALADISH (NOLOCK)'
      'WHERE CODIGO = :CODIGO')
    Left = 278
    Top = 59
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_naladi_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 8
    end
  end
  object qry_embalagem_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      
        'SELECT CD_EMBALAGEM, CD_EMBALAGEM_SUP, NM_EMBALAGEM_S, NM_EMBALA' +
        'GEM_P, QT_EMBALAGEM_SUP'
      'FROM TEMBALAGEM (NOLOCK)')
    Left = 278
    Top = 219
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
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, CD_GRUPO'
      'FROM TEMPRESA_NAC (NOLOCK)'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 120
    Top = 123
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
    object qry_emp_nac_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TEMPRESA_NAC.CD_GRUPO'
      Size = 3
    end
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 32
    Top = 123
  end
  object qry_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_MERCADORIA, AP_MERCADORIA, NM_MERCADORIA, PL_MERCADORI' +
        'A, VL_UNITARIO, CD_IMPORTADOR, CD_GRUPO, CD_UN_MED_COMERC, CD_NC' +
        'M_SH, CD_SULF_NCM, CD_NALADI_SH, CD_NALADI_NCCA, CD_EXPORTADOR, ' +
        'CD_PAIS_AQUISICAO, CD_PAIS_ORIGEM, CD_TIPO_CALCULO, CD_FABR_EXPO' +
        ', CD_FABRICANTE, CD_EMBALAGEM, QT_POR_EMBALAGEM, TX_DESC_INGLES,' +
        ' TX_DESC_ESP'
      'FROM TMERCADORIA_EXP (NOLOCK)'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA'
      'AND CD_MERCADORIA IS NOT NULL'
      '')
    Left = 386
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_mercadoria_CD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 40
    end
    object qry_mercadoria_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
      Size = 25
    end
    object qry_mercadoria_NM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_mercadoria_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
    end
    object qry_mercadoria_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TMERCADORIA.NM_MERCADORIA'
    end
    object qry_mercadoria_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TMERCADORIA.PL_MERCADORIA'
      Size = 5
    end
    object qry_mercadoria_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TMERCADORIA.VL_UNITARIO'
      Size = 3
    end
    object qry_mercadoria_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'TMERCADORIA.CD_IMPORTADOR'
      Size = 3
    end
    object qry_mercadoria_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TMERCADORIA.CD_GRUPO'
      Size = 11
    end
    object qry_mercadoria_CD_SULF_NCM: TStringField
      FieldName = 'CD_SULF_NCM'
      Origin = 'DBBROKER.TMERCADORIA_EXP.CD_SULF_NCM'
      FixedChar = True
      Size = 2
    end
    object qry_mercadoria_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TMERCADORIA.CD_UN_MED_COMERC'
      Size = 8
    end
    object qry_mercadoria_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'TMERCADORIA.CD_NCM_SH'
      Size = 7
    end
    object qry_mercadoria_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TMERCADORIA.CD_NALADI_SH'
      Size = 5
    end
    object qry_mercadoria_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TMERCADORIA.CD_NALADI_NCCA'
      Size = 3
    end
    object qry_mercadoria_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TMERCADORIA.CD_EXPORTADOR'
      Size = 3
    end
    object qry_mercadoria_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TMERCADORIA.CD_PAIS_AQUISICAO'
      Size = 1
    end
    object qry_mercadoria_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TMERCADORIA.CD_PAIS_ORIGEM'
      Size = 1
    end
    object qry_mercadoria_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TMERCADORIA.CD_TIPO_CALCULO'
      Size = 5
    end
    object qry_mercadoria_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 4
    end
    object qry_mercadoria_QT_POR_EMBALAGEM: TFloatField
      FieldName = 'QT_POR_EMBALAGEM'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
    end
    object qry_mercadoria_TX_DESC_INGLES: TMemoField
      FieldName = 'TX_DESC_INGLES'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_mercadoria_TX_DESC_ESP: TMemoField
      FieldName = 'TX_DESC_ESP'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
      BlobType = ftMemo
    end
  end
  object qry_total_itens_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TOTAL=COUNT(NR_ITEM)'
      'FROM TPROCESSO_EXP_ITEM (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 278
    Top = 123
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_total_itens_TOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
  end
  object qry_ncm_doc_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO, NR_SEQ'
      'FROM   TNCM_EXP (NOLOCK)'
      'WHERE CODIGO = :CODIGO'
      '  AND NR_SEQ = :NR_SEQ')
    Left = 120
    Top = 171
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NR_SEQ'
        ParamType = ptUnknown
      end>
    object qry_ncm_doc_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNCM_EXP.CODIGO'
      Size = 8
    end
    object qry_ncm_doc_NR_SEQ: TIntegerField
      FieldName = 'NR_SEQ'
      Origin = 'TNCM_EXP.CODIGO'
    end
    object qry_ncm_doc_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TNCM_EXP.CODIGO'
      Size = 255
    end
  end
  object ds_ncm_doc: TDataSource
    DataSet = qry_ncm_doc_
    Left = 32
    Top = 171
  end
  object qry_naladish_doc_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO, NR_SEQ'
      'FROM   TNALADISH_EXP (NOLOCK)'
      'WHERE CODIGO = :CODIGO'
      '  AND NR_SEQ = :NR_SEQ')
    Left = 120
    Top = 219
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NR_SEQ'
        ParamType = ptUnknown
      end>
    object qry_naladish_doc_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNALADISH_EXP.CODIGO'
      Size = 8
    end
    object qry_naladish_doc_DESCRICAO: TStringField
      DisplayWidth = 200
      FieldName = 'DESCRICAO'
      Origin = 'TNALADISH_EXP.DESCRICAO'
      Size = 200
    end
    object qry_naladish_doc_NR_SEQ: TIntegerField
      FieldName = 'NR_SEQ'
      Origin = 'TNALADISH_EXP.CODIGO'
    end
  end
  object ds_naladish_doc: TDataSource
    DataSet = qry_naladish_doc_
    Left = 32
    Top = 219
  end
  object qry_acordo_normas_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.CD_ACORDO, A.CD_NORMA, N.NM_DESCRICAO'
      'FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO  A (NOLOCK)'
      '  LEFT JOIN TNORMAS N (NOLOCK) ON (N.CODIGO = A.CD_NORMA)'
      'WHERE A.CD_ACORDO = :CD_ACORDO AND A.CD_NORMA = :CD_NORMA'
      'ORDER BY'
      'A.CD_NORMA'
      '')
    Left = 386
    Top = 171
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACORDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_NORMA'
        ParamType = ptUnknown
      end>
    object qry_acordo_normas_CD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'TACORDO_NORMA.CD_ACORDO'
      Size = 10
    end
    object qry_acordo_normas_CD_NORMA: TStringField
      FieldName = 'CD_NORMA'
      Origin = 'TACORDO_NORMA.CD_NORMA'
      Size = 10
    end
    object qry_acordo_normas_NM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      Origin = 'TNORMAS.NM_DESCRICAO'
      Size = 200
    end
  end
  object qry_merc_acordo_pais_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      
        'SELECT A.CD_ACORDO, M.CD_MERCADORIA, M.CD_NORMA, M.CD_NCM_DOC, M' +
        '.NR_SEQ_NCM, M.CD_NALADI_SH_DOC, M.NR_SEQ_NALADI, M.TX_MERCADORI' +
        'A'
      'FROM   TACORDO_PAIS A (NOLOCK), TMERC_EXP_ACORDO M (NOLOCK)'
      'WHERE  M.CD_ACORDO = A.CD_ACORDO AND'
      '       M.CD_ACORDO = :CD_ACORDO AND'
      '       M.CD_NORMA = :CD_NORMA AND'
      '       A.CD_PAIS = :CD_PAIS AND'
      '       M.CD_MERCADORIA = :CD_MERCADORIA')
    Left = 386
    Top = 123
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACORDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_NORMA'
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
    object qry_merc_acordo_pais_CD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'TACORDO_PAIS.CD_ACORDO'
      Size = 10
    end
    object qry_merc_acordo_pais_CD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERC_EXP_ACORDO.CD_MERCADORIA'
      Size = 40
    end
    object qry_merc_acordo_pais_CD_NORMA: TStringField
      FieldName = 'CD_NORMA'
      Origin = 'TACORDO_PAIS.CD_ACORDO'
      Size = 10
    end
    object qry_merc_acordo_pais_CD_NCM_DOC: TStringField
      FieldName = 'CD_NCM_DOC'
      Origin = 'TMERC_EXP_ACORDO.CD_MERCADORIA'
      Size = 8
    end
    object qry_merc_acordo_pais_CD_NALADI_SH_DOC: TStringField
      FieldName = 'CD_NALADI_SH_DOC'
      Origin = 'TMERC_EXP_ACORDO.CD_NORMA'
      Size = 8
    end
    object qry_merc_acordo_pais_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TMERC_EXP_ACORDO.CD_NCM_DOC'
      BlobType = ftMemo
    end
    object qry_merc_acordo_pais_NR_SEQ_NCM: TIntegerField
      FieldName = 'NR_SEQ_NCM'
      Origin = 'TACORDO_PAIS.CD_ACORDO'
    end
    object qry_merc_acordo_pais_NR_SEQ_NALADI: TIntegerField
      FieldName = 'NR_SEQ_NALADI'
      Origin = 'TMERC_EXP_ACORDO.CD_MERCADORIA'
    end
  end
  object sp_exp_calcula: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exp_calcula'
    Left = 497
    Top = 59
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
  object sp_exp_repassa_ncm_naladi_doc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exp_repassa_ncm_naladi_doc'
    Left = 497
    Top = 11
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
  object qry_merc_acordo_norma_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT A.CD_ACORDO, M.CD_MERCADORIA, M.CD_NORMA, M.CD_NCM_DOC, M' +
        '.NR_SEQ_NCM, M.CD_NALADI_SH_DOC, M.NR_SEQ_NALADI, M.TX_MERCADORI' +
        'A'
      'FROM   TACORDO_PAIS A (NOLOCK), TMERC_EXP_ACORDO M (NOLOCK)'
      'WHERE  M.CD_ACORDO = A.CD_ACORDO AND'
      '       A.CD_PAIS = :CD_PAIS AND'
      '       M.CD_MERCADORIA = :CD_MERCADORIA'
      '')
    Left = 386
    Top = 59
    ParamData = <
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
  object qry_tot_acordo_norma_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT_ACORDO_NORMA'
      
        'FROM   TACORDO_PAIS A (NOLOCK), TMERC_EXP_ACORDO M (NOLOCK), TNO' +
        'RMAS N (NOLOCK)'
      'WHERE  M.CD_ACORDO = A.CD_ACORDO AND'
      '       M.CD_NORMA = N.CODIGO AND'
      '       A.CD_PAIS = :CD_PAIS AND'
      '       N.CD_PAIS = :CD_PAIS AND'
      '       M.CD_MERCADORIA = :CD_MERCADORIA AND'
      '       M.CD_ACORDO <> '#39'EM BRANCO'#39
      '')
    Left = 386
    Top = 219
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
    object qry_tot_acordo_norma_TOT_ACORDO_NORMA: TIntegerField
      FieldName = 'TOT_ACORDO_NORMA'
    end
  end
  object qry_embal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TEMBALAGEM (NOLOCK)'
      'WHERE CD_EMBALAGEM = :CD_EMBALAGEM')
    Left = 278
    Top = 171
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMBALAGEM'
        ParamType = ptInput
      end>
    object qry_embal_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'DBBROKER.TEMBALAGEM.CD_EMBALAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_embal_NM_EMBALAGEM_S: TStringField
      FieldName = 'NM_EMBALAGEM_S'
      Origin = 'DBBROKER.TEMBALAGEM.NM_EMBALAGEM_S'
      FixedChar = True
      Size = 50
    end
    object qry_embal_NM_EMBALAGEM_P: TStringField
      FieldName = 'NM_EMBALAGEM_P'
      Origin = 'DBBROKER.TEMBALAGEM.NM_EMBALAGEM_P'
      FixedChar = True
      Size = 50
    end
    object qry_embal_CD_TIPO: TStringField
      FieldName = 'CD_TIPO'
      Origin = 'DBBROKER.TEMBALAGEM.CD_TIPO'
      FixedChar = True
      Size = 1
    end
    object qry_embal_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TEMBALAGEM.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_embal_NR_COMPRIMENTO: TFloatField
      FieldName = 'NR_COMPRIMENTO'
      Origin = 'DBBROKER.TEMBALAGEM.NR_COMPRIMENTO'
    end
    object qry_embal_NR_ALTURA: TFloatField
      FieldName = 'NR_ALTURA'
      Origin = 'DBBROKER.TEMBALAGEM.NR_ALTURA'
    end
    object qry_embal_NR_PESO: TFloatField
      FieldName = 'NR_PESO'
      Origin = 'DBBROKER.TEMBALAGEM.NR_PESO'
    end
    object qry_embal_NR_LARGURA: TFloatField
      FieldName = 'NR_LARGURA'
      Origin = 'DBBROKER.TEMBALAGEM.NR_LARGURA'
    end
    object qry_embal_CD_CLASSIF: TFloatField
      FieldName = 'CD_CLASSIF'
      Origin = 'DBBROKER.TEMBALAGEM.CD_CLASSIF'
    end
    object qry_embal_CD_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_EMBALAGEM_SUP'
      Origin = 'DBBROKER.TEMBALAGEM.CD_EMBALAGEM_SUP'
      FixedChar = True
      Size = 4
    end
    object qry_embal_QT_EMBALAGEM_SUP: TFloatField
      FieldName = 'QT_EMBALAGEM_SUP'
      Origin = 'DBBROKER.TEMBALAGEM.QT_EMBALAGEM_SUP'
    end
    object qry_embal_CD_EMBALAGEM_CLIENTE: TStringField
      FieldName = 'CD_EMBALAGEM_CLIENTE'
      Origin = 'DBBROKER.TEMBALAGEM.CD_EMBALAGEM_CLIENTE'
      FixedChar = True
      Size = 10
    end
    object qry_embal_NM_DESCR_DETALHADA: TStringField
      FieldName = 'NM_DESCR_DETALHADA'
      Origin = 'DBBROKER.TEMBALAGEM.NM_DESCR_DETALHADA'
      FixedChar = True
      Size = 50
    end
    object qry_embal_NM_DESCR_DETALHADA_INGLES: TStringField
      FieldName = 'NM_DESCR_DETALHADA_INGLES'
      Origin = 'DBBROKER.TEMBALAGEM.NM_DESCR_DETALHADA_INGLES'
      FixedChar = True
      Size = 50
    end
    object qry_embal_NM_DESCR_DETALHADA_ESPANHOL: TStringField
      FieldName = 'NM_DESCR_DETALHADA_ESPANHOL'
      Origin = 'DBBROKER.TEMBALAGEM.NM_DESCR_DETALHADA_ESPANHOL'
      FixedChar = True
      Size = 50
    end
    object qry_embal_CD_UNID_MED_EMB: TStringField
      FieldName = 'CD_UNID_MED_EMB'
      Origin = 'DBBROKER.TEMBALAGEM.CD_UNID_MED_EMB'
      FixedChar = True
      Size = 3
    end
    object qry_embal_QT_MERC_EMB: TFloatField
      FieldName = 'QT_MERC_EMB'
      Origin = 'DBBROKER.TEMBALAGEM.QT_MERC_EMB'
    end
  end
  object qry_ncm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO'
      'FROM TNCM (NOLOCK)'
      'WHERE CODIGO = :CODIGO')
    Left = 278
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_ncm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNCM.CODIGO'
      Size = 8
    end
  end
  object updExp: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_EXP'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  QT_TOTAL_ITENS = :QT_TOTAL_ITENS,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  CD_IMPORTADOR = :CD_IMPORTADOR,'
      '  VL_TOT_QTDE_PROD = :VL_TOT_QTDE_PROD,'
      '  VL_TOT_QTDE_EMBALAGEM = :VL_TOT_QTDE_EMBALAGEM,'
      '  VL_TOT_CUBAGEM = :VL_TOT_CUBAGEM,'
      '  VL_PESO_LIQUIDO = :VL_PESO_LIQUIDO,'
      '  VL_TOT_EXW = :VL_TOT_EXW,'
      '  VL_TOT_FOB = :VL_TOT_FOB,'
      '  VL_FRETE = :VL_FRETE,'
      '  VL_SEGURO = :VL_SEGURO,'
      '  VL_TOT_MCV = :VL_TOT_MCV,'
      '  CD_LINGUA_PEDIDO = :CD_LINGUA_PEDIDO,'
      '  IN_FABR_EXPO = :IN_FABR_EXPO,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_PAIS_ORIGEM = :CD_PAIS_ORIGEM,'
      '  CD_PAIS_DESTINO = :CD_PAIS_DESTINO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO_EXP'
      
        '  (NR_PROCESSO, CD_INCOTERM, QT_TOTAL_ITENS, CD_EXPORTADOR, CD_I' +
        'MPORTADOR, '
      
        '   VL_TOT_QTDE_PROD, VL_TOT_QTDE_EMBALAGEM, VL_TOT_CUBAGEM, VL_P' +
        'ESO_LIQUIDO, '
      
        '   VL_TOT_EXW, VL_TOT_FOB, VL_FRETE, VL_SEGURO, VL_TOT_MCV, CD_L' +
        'INGUA_PEDIDO, '
      '   IN_FABR_EXPO, CD_FABRICANTE, CD_PAIS_ORIGEM, CD_PAIS_DESTINO)'
      'values'
      
        '  (:NR_PROCESSO, :CD_INCOTERM, :QT_TOTAL_ITENS, :CD_EXPORTADOR, ' +
        ':CD_IMPORTADOR, '
      
        '   :VL_TOT_QTDE_PROD, :VL_TOT_QTDE_EMBALAGEM, :VL_TOT_CUBAGEM, :' +
        'VL_PESO_LIQUIDO, '
      
        '   :VL_TOT_EXW, :VL_TOT_FOB, :VL_FRETE, :VL_SEGURO, :VL_TOT_MCV,' +
        ' :CD_LINGUA_PEDIDO, '
      
        '   :IN_FABR_EXPO, :CD_FABRICANTE, :CD_PAIS_ORIGEM, :CD_PAIS_DEST' +
        'INO)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_EXP'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 197
    Top = 13
  end
  object upd_exp_itens: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_EXP_ITEM'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ITEM = :NR_ITEM,'
      '  NR_PEDIDO_IMP = :NR_PEDIDO_IMP,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  CD_NCM = :CD_NCM,'
      '  CD_SULF_NCM = :CD_SULF_NCM,'
      '  CD_NALADI_SH = :CD_NALADI_SH,'
      '  CD_UNID_MEDIDA = :CD_UNID_MEDIDA,'
      '  CD_EMBALAGEM = :CD_EMBALAGEM,'
      '  CD_CLASSIF_EMBALAGEM = :CD_CLASSIF_EMBALAGEM,'
      '  CD_FABR_EXPO = :CD_FABR_EXPO,'
      '  QT_POR_EMB = :QT_POR_EMB,'
      '  QT_EMBALAGEM = :QT_EMBALAGEM,'
      '  QT_MERCADORIA = :QT_MERCADORIA,'
      '  VL_POR_EMB = :VL_POR_EMB,'
      '  VL_UNITARIO = :VL_UNITARIO,'
      '  VL_PESO_LIQ_UNIT = :VL_PESO_LIQ_UNIT,'
      '  VL_COMPRIMENTO_EMB = :VL_COMPRIMENTO_EMB,'
      '  VL_LARGURA_EMB = :VL_LARGURA_EMB,'
      '  VL_ALTURA_EMB = :VL_ALTURA_EMB,'
      '  VL_PESO_EMB = :VL_PESO_EMB,'
      '  VL_TOT_ITEM = :VL_TOT_ITEM,'
      '  VL_TOT_PESO_LIQ = :VL_TOT_PESO_LIQ,'
      '  VL_TOT_PESO_BRUTO = :VL_TOT_PESO_BRUTO,'
      '  VL_CUBAGEM = :VL_CUBAGEM,'
      '  VL_MLE = :VL_MLE,'
      '  VL_MCV = :VL_MCV,'
      '  VL_SEGURO = :VL_SEGURO,'
      '  VL_FRETE = :VL_FRETE,'
      '  VL_DESPESA = :VL_DESPESA,'
      '  VL_DESCONTO = :VL_DESCONTO,'
      '  TX_MERCADORIA = :TX_MERCADORIA,'
      '  NR_PROC_PE = :NR_PROC_PE,'
      '  NR_ITEM_PE = :NR_ITEM_PE,'
      '  CD_EMBALAGEM_SUP = :CD_EMBALAGEM_SUP,'
      '  CD_CLASSIF_EMBALAGEM_SUP = :CD_CLASSIF_EMBALAGEM_SUP,'
      '  QT_POR_EMB_SUP = :QT_POR_EMB_SUP,'
      '  QT_EMBALAGEM_SUP = :QT_EMBALAGEM_SUP,'
      '  VL_POR_EMB_SUP = :VL_POR_EMB_SUP,'
      '  CD_EMBALAGEM_CLIENTE = :CD_EMBALAGEM_CLIENTE,'
      '  CD_NORMAS = :CD_NORMAS,'
      '  IN_ACORDO = :IN_ACORDO,'
      '  NR_SEQ_NALADI = :NR_SEQ_NALADI,'
      '  NR_SEQ_NCM = :NR_SEQ_NCM,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  NR_PEDIDO = :NR_PEDIDO,'
      '  CD_PAIS_ORIGEM = :CD_PAIS_ORIGEM,'
      '  TP_ACORDO = :TP_ACORDO,'
      '  CD_NCM_DOC = :CD_NCM_DOC,'
      '  CD_NALADI_DOC = :CD_NALADI_DOC,'
      '  CD_ACORDO = :CD_ACORDO,'
      '  NR_SEQ_NCM_DOC = :NR_SEQ_NCM_DOC,'
      '  NR_SEQ_NALADI_DOC = :NR_SEQ_NALADI_DOC,'
      '  NR_ORDEM_CERT_ORIGEM = :NR_ORDEM_CERT_ORIGEM,'
      '  NR_ANEXO = :NR_ANEXO,'
      '  NR_ATO_CONCESSORIO = :NR_ATO_CONCESSORIO,'
      '  VL_COM_AGENTE = :VL_COM_AGENTE,'
      '  IN_TRANSFERIDO = :IN_TRANSFERIDO,'
      '  VL_SEM_COBERTURA_CAMBIAL = :VL_SEM_COBERTURA_CAMBIAL,'
      '  VL_ACRESCIMO = :VL_ACRESCIMO,'
      '  DT_REMESSA = :DT_REMESSA,'
      '  NR_ORDER = :NR_ORDER,'
      '  NM_EMB_PACKING = :NM_EMB_PACKING,'
      '  VL_FRETE_INT = :VL_FRETE_INT,'
      '  QT_BAIXADA = :QT_BAIXADA,'
      '  NR_NF = :NR_NF,'
      '  TX_BILLING_DOC = :TX_BILLING_DOC,'
      '  TX_DELIVERY_NOTE = :TX_DELIVERY_NOTE,'
      '  CD_UNID_MEDIDA_ESTAT = :CD_UNID_MEDIDA_ESTAT,'
      '  QT_UNID_MEDIDA_ESTAT = :QT_UNID_MEDIDA_ESTAT,'
      '  CD_CFOP = :CD_CFOP'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    InsertSQL.Strings = (
      'insert into TPROCESSO_EXP_ITEM'
      
        '  (NR_PROCESSO, NR_ITEM, NR_PEDIDO_IMP, CD_MERCADORIA, CD_NCM, C' +
        'D_SULF_NCM, '
      
        '   CD_NALADI_SH, CD_UNID_MEDIDA, CD_EMBALAGEM, CD_CLASSIF_EMBALA' +
        'GEM, CD_FABR_EXPO, '
      
        '   QT_POR_EMB, QT_EMBALAGEM, QT_MERCADORIA, VL_POR_EMB, VL_UNITA' +
        'RIO, VL_PESO_LIQ_UNIT, '
      
        '   VL_COMPRIMENTO_EMB, VL_LARGURA_EMB, VL_ALTURA_EMB, VL_PESO_EM' +
        'B, VL_TOT_ITEM, '
      
        '   VL_TOT_PESO_LIQ, VL_TOT_PESO_BRUTO, VL_CUBAGEM, VL_MLE, VL_MC' +
        'V, VL_SEGURO, '
      
        '   VL_FRETE, VL_DESPESA, VL_DESCONTO, TX_MERCADORIA, NR_PROC_PE,' +
        ' NR_ITEM_PE, '
      
        '   CD_EMBALAGEM_SUP, CD_CLASSIF_EMBALAGEM_SUP, QT_POR_EMB_SUP, Q' +
        'T_EMBALAGEM_SUP, '
      
        '   VL_POR_EMB_SUP, CD_EMBALAGEM_CLIENTE, CD_NORMAS, IN_ACORDO, N' +
        'R_SEQ_NALADI, '
      
        '   NR_SEQ_NCM, CD_FABRICANTE, NR_PEDIDO, CD_PAIS_ORIGEM, TP_ACOR' +
        'DO, CD_NCM_DOC, '
      
        '   CD_NALADI_DOC, CD_ACORDO, NR_SEQ_NCM_DOC, NR_SEQ_NALADI_DOC, ' +
        'NR_ORDEM_CERT_ORIGEM, '
      
        '   NR_ANEXO, NR_ATO_CONCESSORIO, VL_COM_AGENTE, IN_TRANSFERIDO, ' +
        'VL_SEM_COBERTURA_CAMBIAL, '
      
        '   VL_ACRESCIMO, DT_REMESSA, NR_ORDER, NM_EMB_PACKING, VL_FRETE_' +
        'INT, QT_BAIXADA, '
      
        '   NR_NF, TX_BILLING_DOC, TX_DELIVERY_NOTE, CD_UNID_MEDIDA_ESTAT' +
        ', QT_UNID_MEDIDA_ESTAT, '
      '   CD_CFOP)'
      'values'
      
        '  (:NR_PROCESSO, :NR_ITEM, :NR_PEDIDO_IMP, :CD_MERCADORIA, :CD_N' +
        'CM, :CD_SULF_NCM, '
      
        '   :CD_NALADI_SH, :CD_UNID_MEDIDA, :CD_EMBALAGEM, :CD_CLASSIF_EM' +
        'BALAGEM, '
      
        '   :CD_FABR_EXPO, :QT_POR_EMB, :QT_EMBALAGEM, :QT_MERCADORIA, :V' +
        'L_POR_EMB, '
      
        '   :VL_UNITARIO, :VL_PESO_LIQ_UNIT, :VL_COMPRIMENTO_EMB, :VL_LAR' +
        'GURA_EMB, '
      
        '   :VL_ALTURA_EMB, :VL_PESO_EMB, :VL_TOT_ITEM, :VL_TOT_PESO_LIQ,' +
        ' :VL_TOT_PESO_BRUTO, '
      
        '   :VL_CUBAGEM, :VL_MLE, :VL_MCV, :VL_SEGURO, :VL_FRETE, :VL_DES' +
        'PESA, :VL_DESCONTO, '
      
        '   :TX_MERCADORIA, :NR_PROC_PE, :NR_ITEM_PE, :CD_EMBALAGEM_SUP, ' +
        ':CD_CLASSIF_EMBALAGEM_SUP, '
      
        '   :QT_POR_EMB_SUP, :QT_EMBALAGEM_SUP, :VL_POR_EMB_SUP, :CD_EMBA' +
        'LAGEM_CLIENTE, '
      
        '   :CD_NORMAS, :IN_ACORDO, :NR_SEQ_NALADI, :NR_SEQ_NCM, :CD_FABR' +
        'ICANTE, '
      
        '   :NR_PEDIDO, :CD_PAIS_ORIGEM, :TP_ACORDO, :CD_NCM_DOC, :CD_NAL' +
        'ADI_DOC, '
      
        '   :CD_ACORDO, :NR_SEQ_NCM_DOC, :NR_SEQ_NALADI_DOC, :NR_ORDEM_CE' +
        'RT_ORIGEM, '
      
        '   :NR_ANEXO, :NR_ATO_CONCESSORIO, :VL_COM_AGENTE, :IN_TRANSFERI' +
        'DO, :VL_SEM_COBERTURA_CAMBIAL, '
      
        '   :VL_ACRESCIMO, :DT_REMESSA, :NR_ORDER, :NM_EMB_PACKING, :VL_F' +
        'RETE_INT, '
      
        '   :QT_BAIXADA, :NR_NF, :TX_BILLING_DOC, :TX_DELIVERY_NOTE, :CD_' +
        'UNID_MEDIDA_ESTAT, '
      '   :QT_UNID_MEDIDA_ESTAT, :CD_CFOP)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_EXP_ITEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    Left = 197
    Top = 60
  end
  object qryLotes: TQuery
    CachedUpdates = True
    AfterOpen = qryLotesAfterOpen
    BeforeInsert = qryLotesBeforeInsert
    BeforeEdit = qryLotesBeforeEdit
    BeforePost = qryLotesBeforePost
    AfterPost = qryLotesAfterPost
    AfterDelete = qryLotesAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      'CD_FORNECIMENTO_LOTE'
      ',CD_RAP'
      ',CD_RAP_ANO'
      ',CD_FORNECIMENTO'
      ',CD_GRUPO'
      ',CHAVE_NOTA'
      ',CD_LOTE'
      ',CD_SKU'
      ',DT_FABRICACAO'
      ',DT_VENCIMENTO'
      ',QT_MERCADORIA'
      ',QT_PESO_LIQ'
      ',QT_PESO_BRUTO'
      ',NR_PROCESSO'
      'FROM TRAP_FORNECIMENTO_LOTE A (NOLOCK) '
      'WHERE CD_FORNECIMENTO = :CD_FORNECIMENTO'
      '  AND CD_GRUPO        =:CD_GRUPO'
      '  AND CD_SKU          = :CD_MERCADORIA')
    UpdateObject = updLotes
    Left = 547
    Top = 234
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_FORNECIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptInput
      end>
    object qryLotesCD_FORNECIMENTO: TStringField
      FieldName = 'CD_FORNECIMENTO'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.CD_FORNECIMENTO'
      Size = 10
    end
    object qryLotesCD_SKU: TStringField
      FieldName = 'CD_SKU'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.CD_SKU'
      Size = 16
    end
    object qryLotesCD_LOTE: TStringField
      FieldName = 'CD_LOTE'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.CD_LOTE'
    end
    object qryLotesCHAVE_NOTA: TStringField
      FieldName = 'CHAVE_NOTA'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.CHAVE_NOTA'
      Size = 44
    end
    object qryLotesDT_FABRICACAO: TDateTimeField
      FieldName = 'DT_FABRICACAO'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.DT_FABRICACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!00/00/0000;1;_'
    end
    object qryLotesDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.DT_VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!00/00/0000;1;_'
    end
    object qryLotesQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.QT_MERCADORIA'
      DisplayFormat = '##,##0.00'
    end
    object qryLotesQT_PESO_LIQ: TFloatField
      FieldName = 'QT_PESO_LIQ'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.QT_PESO_LIQ'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qryLotesQT_PESO_BRUTO: TFloatField
      FieldName = 'QT_PESO_BRUTO'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.QT_PESO_BRUTO'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qryLotesCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.CD_GRUPO'
      Size = 3
    end
    object qryLotesCD_RAP_ANO: TStringField
      FieldName = 'CD_RAP_ANO'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.CD_RAP_ANO'
      Size = 2
    end
    object qryLotesCD_RAP: TStringField
      FieldName = 'CD_RAP'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.CD_RAP'
      Size = 6
    end
    object qryLotesNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.NR_PROCESSO'
      Size = 18
    end
    object qryLotesCD_FORNECIMENTO_LOTE: TIntegerField
      FieldName = 'CD_FORNECIMENTO_LOTE'
      Origin = 'DBBROKER.TRAP_FORNECIMENTO_LOTE.CD_FORNECIMENTO_LOTE'
    end
  end
  object dsLotes: TDataSource
    DataSet = qryLotes
    Left = 593
    Top = 232
  end
  object updLotes: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE TRAP_FORNECIMENTO_LOTE'
      'SET   '
      'CD_RAP                 = :CD_RAP'
      ',CD_RAP_ANO             = :CD_RAP_ANO'
      ',CD_FORNECIMENTO        = :CD_FORNECIMENTO'
      ',CD_GRUPO               = :CD_GRUPO'
      ',CHAVE_NOTA             = :CHAVE_NOTA'
      ',CD_LOTE                = :CD_LOTE'
      ',CD_SKU                 = :CD_SKU'
      ',DT_FABRICACAO          = :DT_FABRICACAO'
      ',DT_VENCIMENTO          = :DT_VENCIMENTO'
      ',QT_MERCADORIA          = :QT_MERCADORIA'
      ',QT_PESO_LIQ            = :QT_PESO_LIQ'
      ',QT_PESO_BRUTO          = :QT_PESO_BRUTO'
      ',NR_PROCESSO              =:NR_PROCESSO'
      'WHERE CD_FORNECIMENTO_LOTE   = :OLD_CD_FORNECIMENTO_LOTE'
      'AND CD_FORNECIMENTO = :OLD_CD_FORNECIMENTO'
      'AND CD_GRUPO = :OLD_CD_GRUPO')
    InsertSQL.Strings = (
      'INSERT INTO  TRAP_FORNECIMENTO_LOTE'
      '( CD_RAP ,CD_RAP_ANO ,CD_FORNECIMENTO ,CD_GRUPO ,CHAVE_NOTA '
      
        ',CD_LOTE ,CD_SKU ,DT_FABRICACAO ,DT_VENCIMENTO ,QT_MERCADORIA ,Q' +
        'T_PESO_LIQ  ,QT_PESO_BRUTO , NR_PROCESSO )'
      'VALUES'
      '(:CD_RAP ,:CD_RAP_ANO ,:CD_FORNECIMENTO ,:CD_GRUPO ,:CHAVE_NOTA '
      
        ',:CD_LOTE ,:CD_SKU ,:DT_FABRICACAO ,:DT_VENCIMENTO ,:QT_MERCADOR' +
        'IA ,:QT_PESO_LIQ  ,:QT_PESO_BRUTO, :NR_PROCESSO )')
    DeleteSQL.Strings = (
      'DELETE FROM TRAP_FORNECIMENTO_LOTE'
      'WHERE  CD_FORNECIMENTO_LOTE   = :OLD_CD_FORNECIMENTO_LOTE'
      '      AND CD_FORNECIMENTO = :OLD_CD_FORNECIMENTO'
      '      AND CD_GRUPO = :OLD_CD_GRUPO')
    Left = 494
    Top = 232
  end
  object qryGrupoProcesso: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO '
      'FROM TPROCESSO (NOLOCK) '
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 590
    Top = 106
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryGrupoProcessoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
  end
  object qryRap: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_RAP,'
      '       CD_RAP_ANO,'
      '       NR_FORNECIMENTO, '
      '       CD_GRUPO'
      'FROM MYINDAIA..TRAP A (NOLOCK) '
      'WHERE NR_FORNECIMENTO = :NR_FORNECIMENTO'
      '  AND NR_PROCESSO     = :NR_PROCESSO'
      '  AND CD_GRUPO        = :CD_GRUPO')
    Left = 594
    Top = 162
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_FORNECIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end>
    object qryRapCD_RAP: TStringField
      FieldName = 'CD_RAP'
      Size = 6
    end
    object qryRapCD_RAP_ANO: TStringField
      FieldName = 'CD_RAP_ANO'
      Size = 2
    end
  end
  object ds_Exp_Itens_Cntr: TDataSource
    DataSet = qry_Exp_Itens_Cntr
    Left = 29
    Top = 277
  end
  object qry_Exp_Itens_Cntr: TQuery
    CachedUpdates = True
    BeforeInsert = qry_Exp_Itens_CntrBeforeInsert
    BeforeEdit = qry_Exp_Itens_CntrBeforeEdit
    BeforePost = qry_Exp_Itens_CntrBeforePost
    AfterPost = qry_Exp_Itens_CntrAfterPost
    AfterDelete = qry_Exp_Itens_CntrAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TPROCESSO_EXP_ITEM_CONTAINER(NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO'
      'AND NR_ITEM = :NR_ITEM')
    UpdateObject = upd_Exp_Itens_Cntr
    Left = 134
    Top = 277
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptInput
        Size = 3
      end>
    object qry_Exp_Itens_CntrNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM_CONTAINER.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_Exp_Itens_CntrNR_CONTR: TStringField
      FieldName = 'NR_CONTR'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM_CONTAINER.NR_CONTR'
      FixedChar = True
    end
    object qry_Exp_Itens_CntrNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM_CONTAINER.NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_Exp_Itens_CntrQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM_CONTAINER.QT_MERCADORIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_Exp_Itens_CntrQT_PESO_BRUTO: TFloatField
      FieldName = 'QT_PESO_BRUTO'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM_CONTAINER.QT_PESO_BRUTO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_Exp_Itens_CntrVL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM_CONTAINER.VL_CUBAGEM'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
  end
  object upd_Exp_Itens_Cntr: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_EXP_ITEM_CONTAINER'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_CONTR = :NR_CONTR,'
      '  NR_ITEM = :NR_ITEM,'
      '  QT_MERCADORIA = :QT_MERCADORIA,'
      '  QT_PESO_BRUTO = :QT_PESO_BRUTO,'
      '  VL_CUBAGEM = :VL_CUBAGEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_CONTR = :OLD_NR_CONTR and'
      '  NR_ITEM = :OLD_NR_ITEM '
      '')
    InsertSQL.Strings = (
      'insert into TPROCESSO_EXP_ITEM_CONTAINER'
      '  (NR_PROCESSO, NR_CONTR, NR_ITEM,'
      'QT_MERCADORIA, QT_PESO_BRUTO, '
      '   VL_CUBAGEM)'
      'values'
      '  (:NR_PROCESSO, :NR_CONTR, :NR_ITEM, '
      ':QT_MERCADORIA, :QT_PESO_BRUTO, '
      '   :VL_CUBAGEM)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_EXP_ITEM_CONTAINER'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_CONTR = :OLD_NR_CONTR and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '')
    Left = 234
    Top = 278
  end
  object qryProcContainer: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_CNTR'
      'FROM  TPROCESSO_CNTR (NOLOCK) '
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 357
    Top = 296
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
    Left = 365
    Top = 299
  end
  object cdsProcContainer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcContainer'
    Left = 388
    Top = 302
    object cdsProcContainerNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
    end
  end
  object dspProcContainer: TDataSetProvider
    DataSet = qryProcContainer
    Left = 380
    Top = 297
  end
end
