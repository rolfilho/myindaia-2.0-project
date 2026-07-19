object datm_nac: Tdatm_nac
  OldCreateOrder = True
  Left = 308
  Top = 135
  Height = 503
  Width = 778
  object qry_nac_: TQuery
    CachedUpdates = True
    AfterScroll = qry_nac_AfterScroll
    OnCalcFields = qry_nac_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TNAC'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = us_nac
    Left = 163
    Top = 42
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_nac_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNAC.NR_PROCESSO'
      Size = 18
    end
    object qry_nac_CD_COMPRADOR: TStringField
      FieldName = 'CD_COMPRADOR'
      Origin = 'TNAC.CD_COMPRADOR'
      Size = 5
    end
    object qry_nac_IN_NAC_EXTERNA: TStringField
      FieldName = 'IN_NAC_EXTERNA'
      Origin = 'TNAC.IN_NAC_EXTERNA'
      Size = 1
    end
    object qry_nac_IN_EXPORTACAO: TStringField
      FieldName = 'IN_EXPORTACAO'
      Origin = 'TNAC.IN_EXPORTACAO'
      OnChange = qry_nac_IN_EXPORTACAOChange
      Size = 1
    end
    object qry_nac_IN_IMP_DIRETA: TStringField
      FieldName = 'IN_IMP_DIRETA'
      Origin = 'TNAC.IN_IMP_DIRETA'
      Size = 1
    end
    object qry_nac_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TNAC.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_nac_LookMoedaMLE: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMoedaMLE'
      Size = 30
      Calculated = True
    end
    object qry_nac_NR_DI: TStringField
      FieldName = 'NR_DI'
      Origin = 'TNAC.NR_PROCESSO'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object qry_nac_DT_DI: TDateTimeField
      FieldName = 'DT_DI'
      Origin = 'TNAC.NR_DA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_nac_LookComprador: TStringField
      DisplayLabel = 'Comprador'
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'LookComprador'
      Size = 50
      Calculated = True
    end
    object qry_nac_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      Origin = 'TNAC.VL_MLE_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_nac_VL_MLE_DOLAR: TFloatField
      FieldName = 'VL_MLE_DOLAR'
      Origin = 'TNAC.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_nac_VL_MLD_MNEG: TFloatField
      FieldName = 'VL_MLD_MNEG'
      Origin = 'TNAC.NR_DA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_nac_VL_MLD_DOLAR: TFloatField
      FieldName = 'VL_MLD_DOLAR'
      Origin = 'TNAC.CD_COMPRADOR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_nac_DT_CALCULO: TDateTimeField
      FieldName = 'DT_CALCULO'
      Origin = 'TNAC.NR_PROCESSO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_nac_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TNAC.NR_PROCESSO'
      Size = 3
    end
    object qry_nac_LookIncoterm: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookIncoterm'
      Size = 3
      Calculated = True
    end
    object qry_nac_DT_VENDA: TDateTimeField
      FieldName = 'DT_VENDA'
      Origin = 'TNAC.NR_PROCESSO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
  end
  object ds_nac: TDataSource
    DataSet = qry_nac_
    Left = 45
    Top = 42
  end
  object qry_lista_nac_item_: TQuery
    AfterScroll = qry_lista_nac_item_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT N.NR_PROCESSO, N.NR_PROCESSO_DA, N.NR_REF, N.CD_MERCADORI' +
        'A, M.AP_MERCADORIA, M.CD_MATERIAL, N.NR_LOTE,'
      '       N.VL_MLD_MNEG, N.PL_NAC'
      'FROM   TNAC_ITEM N, TMERCADORIA M'
      'WHERE  N.CD_MERCADORIA *= M.CD_MERCADORIA AND'
      '       N.NR_PROCESSO = :NR_PROCESSO')
    Left = 163
    Top = 97
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_lista_nac_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_lista_nac_item_NR_PROCESSO_DA: TStringField
      FieldName = 'NR_PROCESSO_DA'
      Size = 18
    end
    object qry_lista_nac_item_NR_REF: TStringField
      DisplayLabel = 'N'#186'  Ref.'
      FieldName = 'NR_REF'
      Size = 15
    end
    object qry_lista_nac_item_CD_MERCADORIA: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_MERCADORIA'
      Size = 30
    end
    object qry_lista_nac_item_AP_MERCADORIA: TStringField
      DisplayLabel = 'Mercadoria'
      FieldName = 'AP_MERCADORIA'
      Size = 25
    end
    object qry_lista_nac_item_CD_MATERIAL: TStringField
      DisplayLabel = 'Artigo'
      FieldName = 'CD_MATERIAL'
      Size = 10
    end
    object qry_lista_nac_item_NR_LOTE: TStringField
      DisplayLabel = 'N'#186' Lote'
      FieldName = 'NR_LOTE'
      Size = 12
    end
    object qry_lista_nac_item_VL_MLD_MNEG: TFloatField
      DisplayLabel = 'Valor MLD'
      FieldName = 'VL_MLD_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_nac_item_PL_NAC: TFloatField
      DisplayLabel = 'Peso L'#237'q.'
      FieldName = 'PL_NAC'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
  end
  object ds_lista_nac_item: TDataSource
    DataSet = qry_lista_nac_item_
    Left = 45
    Top = 97
  end
  object qry_nac_item_: TQuery
    CachedUpdates = True
    BeforeEdit = qry_nac_item_BeforeEdit
    OnCalcFields = qry_nac_item_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TNAC_ITEM'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_PROCESSO_DA = :NR_PROCESSO_DA AND'
      '       NR_REF = :NR_REF AND'
      '       CD_MERCADORIA = :CD_MERCADORIA AND'
      '       NR_LOTE = :NR_LOTE'
      '')
    UpdateObject = us_nac_item
    Left = 163
    Top = 151
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO_DA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end>
    object qry_nac_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNAC_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_nac_item_NR_PROCESSO_DA: TStringField
      FieldName = 'NR_PROCESSO_DA'
      Origin = 'TNAC_ITEM.NR_PROCESSO_DA'
      Size = 18
    end
    object qry_nac_item_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TNAC_ITEM.NR_REF'
      Size = 15
    end
    object qry_nac_item_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TNAC_ITEM.CD_MERCADORIA'
      OnChange = qry_nac_item_CD_MERCADORIAChange
      Size = 30
    end
    object qry_nac_item_NR_LOTE: TStringField
      FieldName = 'NR_LOTE'
      Origin = 'TNAC_ITEM.NR_LOTE'
      Size = 12
    end
    object qry_nac_item_QT_NAC: TIntegerField
      FieldName = 'QT_NAC'
      Origin = 'TNAC_ITEM.QT_NAC'
      OnChange = qry_nac_item_QT_NACChange
      EditFormat = '#####'
    end
    object qry_nac_item_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TNAC_ITEM.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_nac_item_LookMoedaMLE: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMoedaMLE'
      Calculated = True
    end
    object qry_nac_item_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TNAC_ITEM.NR_PROCESSO'
      Size = 3
    end
    object qry_nac_item_LookMoedaFrete: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMoedaFrete'
      Size = 3
      Calculated = True
    end
    object qry_nac_item_LookMercadoria: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMercadoria'
      Size = 50
      Calculated = True
    end
    object qry_nac_item_PL_UNIT: TFloatField
      FieldName = 'PL_UNIT'
      Origin = 'TNAC_ITEM.NR_PROCESSO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_nac_item_PL_NAC: TFloatField
      FieldName = 'PL_NAC'
      Origin = 'TNAC_ITEM.NR_PROCESSO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_nac_item_VL_MLD_MNEG: TFloatField
      FieldName = 'VL_MLD_MNEG'
      Origin = 'TNAC_ITEM.NR_PROCESSO_DA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_nac_item_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      Origin = 'TNAC_ITEM.VL_MLE_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_nac_item_VL_MLE_DOLAR: TFloatField
      FieldName = 'VL_MLE_DOLAR'
      Origin = 'TNAC_ITEM.NR_REF'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_nac_item_VL_MLD_DOLAR: TFloatField
      FieldName = 'VL_MLD_DOLAR'
      Origin = 'TNAC_ITEM.CD_MERCADORIA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_nac_item_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TNAC_ITEM.NR_PROCESSO'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_nac_item_VL_FRETE_MNEG: TFloatField
      FieldName = 'VL_FRETE_MNEG'
      Origin = 'TNAC_ITEM.NR_PROCESSO_DA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_nac_item_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
      Origin = 'TNAC_ITEM.NR_PROCESSO'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_nac_item_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      Origin = 'TNAC_ITEM.NR_PROCESSO_DA'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_nac_item_LookNrDA: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookNrDA'
      EditMask = '99/9999999-9;0;'
      Size = 10
      Calculated = True
    end
    object qry_nac_item_LookDtDA: TDateField
      FieldKind = fkCalculated
      FieldName = 'LookDtDA'
      Calculated = True
    end
    object qry_nac_item_IN_EMBUT_FRT_ITENS: TStringField
      FieldName = 'IN_EMBUT_FRT_ITENS'
      Origin = 'TNAC_ITEM.NR_PROCESSO'
      Size = 1
    end
    object qry_nac_item_LookMaterial: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMaterial'
      Size = 10
      Calculated = True
    end
  end
  object ds_nac_item: TDataSource
    DataSet = qry_nac_item_
    Left = 45
    Top = 151
  end
  object us_nac: TUpdateSQL
    ModifySQL.Strings = (
      'update TNAC'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_COMPRADOR = :CD_COMPRADOR,'
      '  IN_NAC_EXTERNA = :IN_NAC_EXTERNA,'
      '  IN_EXPORTACAO = :IN_EXPORTACAO,'
      '  IN_IMP_DIRETA = :IN_IMP_DIRETA,'
      '  CD_MOEDA_MLE = :CD_MOEDA_MLE,'
      '  VL_MLE_MNEG = :VL_MLE_MNEG,'
      '  NR_DI = :NR_DI,'
      '  DT_DI = :DT_DI,'
      '  VL_MLE_DOLAR = :VL_MLE_DOLAR,'
      '  VL_MLD_MNEG = :VL_MLD_MNEG,'
      '  VL_MLD_DOLAR = :VL_MLD_DOLAR,'
      '  DT_CALCULO = :DT_CALCULO,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  DT_VENDA = :DT_VENDA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TNAC'
      
        '  (NR_PROCESSO, CD_COMPRADOR, IN_NAC_EXTERNA, IN_EXPORTACAO, IN_' +
        'IMP_DIRETA, '
      
        '   CD_MOEDA_MLE, VL_MLE_MNEG, NR_DI, DT_DI, VL_MLE_DOLAR, VL_MLD' +
        '_MNEG, '
      '   VL_MLD_DOLAR, DT_CALCULO, CD_INCOTERM, DT_VENDA)'
      'values'
      
        '  (:NR_PROCESSO, :CD_COMPRADOR, :IN_NAC_EXTERNA, :IN_EXPORTACAO,' +
        ' :IN_IMP_DIRETA, '
      
        '   :CD_MOEDA_MLE, :VL_MLE_MNEG, :NR_DI, :DT_DI, :VL_MLE_DOLAR, :' +
        'VL_MLD_MNEG, '
      '   :VL_MLD_DOLAR, :DT_CALCULO, :CD_INCOTERM, :DT_VENDA)')
    DeleteSQL.Strings = (
      'delete from TNAC'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 280
    Top = 42
  end
  object us_nac_item: TUpdateSQL
    ModifySQL.Strings = (
      'update TNAC_ITEM'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_DA = :NR_PROCESSO_DA,'
      '  NR_REF = :NR_REF,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  NR_LOTE = :NR_LOTE,'
      '  QT_NAC = :QT_NAC,'
      '  VL_MLE_MNEG = :VL_MLE_MNEG,'
      '  CD_MOEDA_MLE = :CD_MOEDA_MLE,'
      '  CD_MOEDA_FRETE = :CD_MOEDA_FRETE,'
      '  PL_NAC = :PL_NAC,'
      '  VL_MLD_MNEG = :VL_MLD_MNEG,'
      '  VL_MLE_DOLAR = :VL_MLE_DOLAR,'
      '  VL_MLD_DOLAR = :VL_MLD_DOLAR,'
      '  VL_UNITARIO = :VL_UNITARIO,'
      '  TX_MLE = :TX_MLE,'
      '  TX_DOLAR = :TX_DOLAR,'
      '  PL_UNIT = :PL_UNIT,'
      '  VL_FRETE_MNEG = :VL_FRETE_MNEG,'
      '  IN_EMBUT_FRT_ITENS = :IN_EMBUT_FRT_ITENS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_DA = :OLD_NR_PROCESSO_DA and'
      '  NR_REF = :OLD_NR_REF and'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LOTE = :OLD_NR_LOTE')
    InsertSQL.Strings = (
      'insert into TNAC_ITEM'
      
        '  (NR_PROCESSO, NR_PROCESSO_DA, NR_REF, CD_MERCADORIA, NR_LOTE, ' +
        'QT_NAC, '
      
        '   VL_MLE_MNEG, CD_MOEDA_MLE, CD_MOEDA_FRETE, PL_NAC, VL_MLD_MNE' +
        'G, VL_MLE_DOLAR, '
      
        '   VL_MLD_DOLAR, VL_UNITARIO, TX_MLE, TX_DOLAR, PL_UNIT, VL_FRET' +
        'E_MNEG, '
      '   IN_EMBUT_FRT_ITENS)'
      'values'
      
        '  (:NR_PROCESSO, :NR_PROCESSO_DA, :NR_REF, :CD_MERCADORIA, :NR_L' +
        'OTE, :QT_NAC, '
      
        '   :VL_MLE_MNEG, :CD_MOEDA_MLE, :CD_MOEDA_FRETE, :PL_NAC, :VL_ML' +
        'D_MNEG, '
      
        '   :VL_MLE_DOLAR, :VL_MLD_DOLAR, :VL_UNITARIO, :TX_MLE, :TX_DOLA' +
        'R, :PL_UNIT, '
      '   :VL_FRETE_MNEG, :IN_EMBUT_FRT_ITENS)')
    DeleteSQL.Strings = (
      'delete from TNAC_ITEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_DA = :OLD_NR_PROCESSO_DA and'
      '  NR_REF = :OLD_NR_REF and'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LOTE = :OLD_NR_LOTE')
    Left = 280
    Top = 151
  end
  object qry_lote_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDA_LOTE'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       CD_MERCADORIA = :CD_MERCADORIA AND'
      '       NR_REF = :NR_REF AND'
      '       NR_LOTE = :NR_LOTE'
      '')
    Left = 537
    Top = 421
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end>
  end
  object qry_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MERCADORIA, AP_MERCADORIA, CD_MATERIAL'
      'FROM   TMERCADORIA'
      'WHERE  CD_MERCADORIA = :CD_MERCADORIA'
      '')
    Left = 537
    Top = 199
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG'
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_UNID_NEG IN ( SELECT CD_UNID_NEG'
      '                        FROM   TUSUARIO_HABILITACAO'
      '                        WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                               IN_ATIVO = '#39'1'#39' )'
      '')
    Left = 537
    Top = 42
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
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
    Left = 537
    Top = 97
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, IN_CANCELADO, IN_LI' +
        'BERADO, IN_PRODUCAO, CD_CLIENTE'
      'FROM   TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 652
    Top = 151
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
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 1
    end
    object qry_processo_IN_PRODUCAO: TStringField
      FieldName = 'IN_PRODUCAO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 5
    end
  end
  object qry_lista_ret_merc_: TQuery
    AfterScroll = qry_lista_ret_merc_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TNAC_RET_MERC'
      'WHERE  NR_PROCESSO    = :NR_PROCESSO AND'
      '       NR_PROCESSO_DA = :NR_PROCESSO_DA AND'
      '       CD_MERCADORIA  = :CD_MERCADORIA AND'
      '       NR_REF         = :NR_REF AND'
      '       NR_LOTE        = :NR_LOTE')
    Left = 163
    Top = 199
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO_DA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end>
    object qry_lista_ret_merc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNAC_RET_MERC.NR_PROCESSO'
      Size = 18
    end
    object qry_lista_ret_merc_NR_PROCESSO_DA: TStringField
      FieldName = 'NR_PROCESSO_DA'
      Origin = 'TNAC_RET_MERC.NR_PROCESSO'
      Size = 18
    end
    object qry_lista_ret_merc_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TNAC_RET_MERC.NR_REF'
      Size = 15
    end
    object qry_lista_ret_merc_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TNAC_RET_MERC.CD_MERCADORIA'
      Size = 30
    end
    object qry_lista_ret_merc_NR_LOTE: TStringField
      FieldName = 'NR_LOTE'
      Origin = 'TNAC_RET_MERC.NR_LOTE'
      Size = 12
    end
    object qry_lista_ret_merc_DT_RET: TDateTimeField
      DisplayLabel = 'Data Ret.'
      FieldName = 'DT_RET'
      Origin = 'TNAC_RET_MERC.DT_RET'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_lista_ret_merc_QT_RET: TIntegerField
      DisplayLabel = 'Volumes'
      FieldName = 'QT_RET'
      Origin = 'TNAC_RET_MERC.QT_RET'
      EditFormat = '#####'
    end
    object qry_lista_ret_merc_PL_RET: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PL_RET'
      Origin = 'TNAC_RET_MERC.NR_PROCESSO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
  end
  object ds_lista_ret_merc: TDataSource
    DataSet = qry_lista_ret_merc_
    Left = 45
    Top = 199
  end
  object qry_ret_merc_: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TNAC_RET_MERC'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_PROCESSO_DA = :NR_PROCESSO_DA AND'
      '       NR_REF = :NR_REF AND'
      '       CD_MERCADORIA = :CD_MERCADORIA AND'
      '       NR_LOTE = :NR_LOTE AND'
      '       DT_RET = :DT_RET')
    UpdateObject = us_ret_merc
    Left = 163
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO_DA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_RET'
        ParamType = ptUnknown
      end>
    object qry_ret_merc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNAC_RET_MERC.NR_PROCESSO'
      Size = 18
    end
    object qry_ret_merc_NR_PROCESSO_DA: TStringField
      FieldName = 'NR_PROCESSO_DA'
      Origin = 'TNAC_RET_MERC.NR_PROCESSO'
      Size = 18
    end
    object qry_ret_merc_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TNAC_RET_MERC.NR_REF'
      Size = 15
    end
    object qry_ret_merc_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TNAC_RET_MERC.CD_MERCADORIA'
      Size = 30
    end
    object qry_ret_merc_NR_LOTE: TStringField
      FieldName = 'NR_LOTE'
      Origin = 'TNAC_RET_MERC.NR_LOTE'
      Size = 12
    end
    object qry_ret_merc_DT_RET: TDateTimeField
      FieldName = 'DT_RET'
      Origin = 'TNAC_RET_MERC.DT_RET'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_ret_merc_QT_RET: TIntegerField
      FieldName = 'QT_RET'
      Origin = 'TNAC_RET_MERC.QT_RET'
      OnChange = qry_ret_merc_QT_RETChange
      EditFormat = '#####'
    end
    object qry_ret_merc_PL_RET: TFloatField
      FieldName = 'PL_RET'
      Origin = 'TNAC_RET_MERC.NR_PROCESSO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_ret_merc_LookMercadoria: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMercadoria'
      Calculated = True
    end
  end
  object ds_ret_merc: TDataSource
    DataSet = qry_ret_merc_
    Left = 45
    Top = 255
  end
  object us_ret_merc: TUpdateSQL
    ModifySQL.Strings = (
      'update TNAC_RET_MERC'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_DA = :NR_PROCESSO_DA,'
      '  NR_REF = :NR_REF,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  NR_LOTE = :NR_LOTE,'
      '  DT_RET = :DT_RET,'
      '  QT_RET = :QT_RET,'
      '  PL_RET = :PL_RET'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_DA = :OLD_NR_PROCESSO_DA and'
      '  NR_REF = :OLD_NR_REF and'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LOTE = :OLD_NR_LOTE and'
      '  DT_RET = :OLD_DT_RET')
    InsertSQL.Strings = (
      'insert into TNAC_RET_MERC'
      
        '  (NR_PROCESSO, NR_PROCESSO_DA, NR_REF, CD_MERCADORIA, NR_LOTE, ' +
        'DT_RET, '
      '   QT_RET, PL_RET)'
      'values'
      
        '  (:NR_PROCESSO, :NR_PROCESSO_DA, :NR_REF, :CD_MERCADORIA, :NR_L' +
        'OTE, :DT_RET, '
      '   :QT_RET, :PL_RET)')
    DeleteSQL.Strings = (
      'delete from TNAC_RET_MERC'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_DA = :OLD_NR_PROCESSO_DA and'
      '  NR_REF = :OLD_NR_REF and'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LOTE = :OLD_NR_LOTE and'
      '  DT_RET = :OLD_DT_RET')
    Left = 280
    Top = 255
  end
  object qry_existe_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) EXISTEDI'
      'FROM TDECLARACAO_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 652
    Top = 42
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_existe_di_EXISTEDI: TIntegerField
      FieldName = 'EXISTEDI'
    end
  end
  object qry_consiste_ret_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM( QT_RET ) AS QT_RET'
      'FROM   TNAC_RET_MERC'
      'WHERE  NR_PROCESSO   = :NR_PROCESSO AND'
      '       CD_MERCADORIA = :CD_MERCADORIA AND'
      '       NR_REF        = :NR_REF AND'
      '       NR_LOTE       = :NR_LOTE AND'
      '       DT_RET        <> :DT_RET  '
      '')
    Left = 652
    Top = 97
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_RET'
        ParamType = ptUnknown
      end>
    object qry_consiste_ret_QT_RET: TIntegerField
      FieldName = 'QT_RET'
      Origin = 'TNAC_RET_MERC.QT_RET'
    end
  end
  object qry_merc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MERCADORIA, M.AP_MERCADORIA, M.CD_AREA, A.NM_AREA, M' +
        '.CD_PROPRIETARIO,'
      
        '       M.CD_MATERIAL, P.NM_PROPRIETARIO, M.CD_EMBALAGEM_SCX, B.D' +
        'ESCRICAO AS NM_EMBALAGEM,'
      '       M.PL_MERCADORIA, M.CD_UN_MED_COMERC'
      
        'FROM   TMERCADORIA M, TAREA A, TPROPRIETARIO_MERC P, TTP_EMBALAG' +
        'EM B'
      'WHERE  M.CD_AREA *= A.CD_AREA AND'
      '       M.CD_PROPRIETARIO *= P.CD_PROPRIETARIO AND'
      '       M.CD_EMBALAGEM_SCX *= B.CODIGO AND'
      '       M.CD_MERCADORIA = :CD_MERCADORIA')
    Left = 163
    Top = 310
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_merc_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Size = 30
    end
    object qry_merc_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Size = 25
    end
    object qry_merc_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Size = 2
    end
    object qry_merc_NM_AREA: TStringField
      FieldName = 'NM_AREA'
      Size = 50
    end
    object qry_merc_CD_PROPRIETARIO: TStringField
      FieldName = 'CD_PROPRIETARIO'
      Size = 3
    end
    object qry_merc_CD_MATERIAL: TStringField
      FieldName = 'CD_MATERIAL'
      Size = 10
    end
    object qry_merc_NM_PROPRIETARIO: TStringField
      FieldName = 'NM_PROPRIETARIO'
      Size = 50
    end
    object qry_merc_CD_EMBALAGEM_SCX: TStringField
      FieldName = 'CD_EMBALAGEM_SCX'
      Size = 2
    end
    object qry_merc_NM_EMBALAGEM: TStringField
      FieldName = 'NM_EMBALAGEM'
      Size = 120
    end
    object qry_merc_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qry_merc_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Size = 3
    end
  end
  object ds_merc: TDataSource
    DataSet = qry_merc_
    Left = 44
    Top = 310
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
    Left = 537
    Top = 151
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qry_ref_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TREF_CLIENTE'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 163
    Top = 362
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ref_cliente_NR_PROCESSO: TStringField
      DisplayLabel = 'Nr Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TREF_CLIENTE.NR_PROCESSO'
      Size = 18
    end
    object qry_ref_cliente_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
    object qry_ref_cliente_CD_REF_EXP: TStringField
      FieldName = 'CD_REF_EXP'
      Origin = 'TREF_CLIENTE.NR_PROCESSO'
      Size = 15
    end
    object qry_ref_cliente_NR_SEQUENCIA: TStringField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_SEQUENCIA'
      FixedChar = True
      Size = 3
    end
  end
  object ds_ref_cliente: TDataSource
    DataSet = qry_ref_cliente_
    Left = 46
    Top = 362
  end
  object qry_comprador_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA AS CD_COMPRADOR, NM_EMPRESA AS NM_COMPRADOR'
      'FROM   TEMPRESA_NAC'
      'WHERE  CD_EMPRESA = :CD_COMPRADOR')
    Left = 537
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COMPRADOR'
        ParamType = ptUnknown
      end>
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_MOEDA, AP_MOEDA'
      'FROM   TMOEDA_BROKER'
      'WHERE  CD_MOEDA = :CD_MOEDA')
    Left = 537
    Top = 310
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end>
  end
  object qry_da_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT NR_DI, ( SELECT DT_REALIZACAO '
      '                FROM   TFOLLOWUP F '
      '                WHERE  F.NR_PROCESSO = P.NR_PROCESSO AND'
      
        '                       F.CD_EVENTO IN ( SELECT CD_EV_REG_DI FROM' +
        ' TPARAMETROS ) ) AS DT_DI'
      'FROM   TPROCESSO P'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 537
    Top = 362
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_tot_nac_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( SUM( ISNULL( PL_NAC, 0 ) ), 0 ) AS PL_TOT_NAC,'
      
        '       ISNULL( SUM( ISNULL( VL_MLD_MNEG, 0 ) ), 0 ) AS VL_TOT_ML' +
        'D_MNEG'
      'FROM   TNAC_ITEM'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 385
    Top = 97
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_tot_nac_item_PL_TOT_NAC: TFloatField
      FieldName = 'PL_TOT_NAC'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_tot_nac_item_VL_TOT_MLD_MNEG: TFloatField
      FieldName = 'VL_TOT_MLD_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object qry_tot_ret_merc_: TQuery
    OnCalcFields = qry_tot_ret_merc_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( SUM( ISNULL( QT_RET, 0 ) ), 0 ) AS QT_TOT_RET,'
      '       ISNULL( SUM( ISNULL( PL_RET, 0 ) ), 0 ) AS PL_TOT_RET'
      'FROM   TNAC_RET_MERC'
      'WHERE  NR_PROCESSO    = :NR_PROCESSO AND'
      '       NR_PROCESSO_DA = :NR_PROCESSO_DA AND'
      '       NR_REF         = :NR_REF AND'
      '       CD_MERCADORIA  = :CD_MERCADORIA AND'
      '       NR_LOTE        = :NR_LOTE')
    Left = 385
    Top = 199
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO_DA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end>
    object qry_tot_ret_merc_QT_TOT_RET: TIntegerField
      FieldName = 'QT_TOT_RET'
      EditFormat = '#####'
    end
    object qry_tot_ret_merc_PL_TOT_RET: TFloatField
      FieldName = 'PL_TOT_RET'
      DisplayFormat = '#0,.00000'
    end
    object qry_tot_ret_merc_CalcQtAgRetirada: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CalcQtAgRetirada'
      Calculated = True
    end
    object qry_tot_ret_merc_CalcPlAgRetirada: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcPlAgRetirada'
      DisplayFormat = '#0,.00000'
      Calculated = True
    end
  end
  object ds_tot_ret_merc: TDataSource
    DataSet = qry_tot_ret_merc_
    Left = 281
    Top = 199
  end
  object ds_tot_nac_item: TDataSource
    DataSet = qry_tot_nac_item_
    Left = 281
    Top = 97
  end
  object qry_incoterm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO AS CD_INCOTERM, DESCRICAO AS NM_INCOTERM'
      'FROM   TINCOTERMS_VENDA'
      'WHERE  CODIGO = :CD_INCOTERM')
    Left = 651
    Top = 199
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_INCOTERM'
        ParamType = ptUnknown
      end>
  end
  object qry_comprador_est_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA AS CD_COMPRADOR, NM_EMPRESA AS NM_COMPRADOR'
      'FROM   TEMPRESA_EST'
      'WHERE  CD_EMPRESA = :CD_COMPRADOR')
    Left = 652
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COMPRADOR'
        ParamType = ptUnknown
      end>
  end
end
