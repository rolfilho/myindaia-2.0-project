object datm_item_contabil: Tdatm_item_contabil
  OldCreateOrder = False
  Left = 227
  Top = 107
  Height = 372
  Width = 400
  object qry_mod_receb_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOD_CONTABIL, NM_MOD_CONTABIL'
      '   FROM TTP_MODULO_CONTABIL'
      '  WHERE TP_MOD_CONTABIL = '#39'R'#39)
    Left = 148
    Top = 10
    object qry_mod_receb_CD_MOD_CONTABIL: TStringField
      FieldName = 'CD_MOD_CONTABIL'
      Origin = 'DBBROKER.TTP_MODULO_CONTABIL.CD_MOD_CONTABIL'
      FixedChar = True
      Size = 2
    end
    object qry_mod_receb_NM_MOD_CONTABIL: TStringField
      FieldName = 'NM_MOD_CONTABIL'
      Origin = 'DBBROKER.TTP_MODULO_CONTABIL.NM_MOD_CONTABIL'
      FixedChar = True
      Size = 100
    end
  end
  object qry_mod_pagto_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOD_CONTABIL, NM_MOD_CONTABIL'
      '   FROM TTP_MODULO_CONTABIL'
      '  WHERE TP_MOD_CONTABIL = '#39'P'#39)
    Left = 156
    Top = 70
    object qry_mod_pagto_CD_MOD_CONTABIL: TStringField
      FieldName = 'CD_MOD_CONTABIL'
      Origin = 'DBBROKER.TTP_MODULO_CONTABIL.CD_MOD_CONTABIL'
      FixedChar = True
      Size = 2
    end
    object qry_mod_pagto_NM_MOD_CONTABIL: TStringField
      FieldName = 'NM_MOD_CONTABIL'
      Origin = 'DBBROKER.TTP_MODULO_CONTABIL.NM_MOD_CONTABIL'
      FixedChar = True
      Size = 100
    end
  end
  object ds_item_contabil: TDataSource
    DataSet = qry_item_contabil_
    Left = 44
    Top = 60
  end
  object qry_item_contabil_: TQuery
    BeforePost = qry_item_contabil_BeforePost
    OnCalcFields = qry_item_contabil_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      '       FROM TITEM_CONTABIL'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 44
    Top = 8
    object qry_item_contabil_CD_ITEM_CONTABIL: TStringField
      FieldName = 'CD_ITEM_CONTABIL'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_ITEM_CONTABIL'
      FixedChar = True
      Size = 3
    end
    object qry_item_contabil_NM_ITEM_CONTABIL: TStringField
      FieldName = 'NM_ITEM_CONTABIL'
      Origin = 'DBBROKER.TITEM_CONTABIL.NM_ITEM_CONTABIL'
      FixedChar = True
      Size = 100
    end
    object qry_item_contabil_IN_CONTABILIZA: TStringField
      FieldName = 'IN_CONTABILIZA'
      Origin = 'DBBROKER.TITEM_CONTABIL.IN_CONTABILIZA'
      FixedChar = True
      Size = 1
    end
    object qry_item_contabil_IN_PAGTO_DEB_PROVISAO: TStringField
      FieldName = 'IN_PAGTO_DEB_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.IN_PAGTO_DEB_PROVISAO'
      FixedChar = True
      Size = 1
    end
    object qry_item_contabil_IN_PAGTO_CRE_PROVISAO: TStringField
      FieldName = 'IN_PAGTO_CRE_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.IN_PAGTO_CRE_PROVISAO'
      FixedChar = True
      Size = 1
    end
    object qry_item_contabil_IN_PAGTO_DEB_BAIXA: TStringField
      FieldName = 'IN_PAGTO_DEB_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.IN_PAGTO_DEB_BAIXA'
      FixedChar = True
      Size = 1
    end
    object qry_item_contabil_IN_PAGTO_CRE_BAIXA: TStringField
      FieldName = 'IN_PAGTO_CRE_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.IN_PAGTO_CRE_BAIXA'
      FixedChar = True
      Size = 1
    end
    object qry_item_contabil_IN_RECEB_DEB_PROVISAO: TStringField
      FieldName = 'IN_RECEB_DEB_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.IN_RECEB_DEB_PROVISAO'
      FixedChar = True
      Size = 1
    end
    object qry_item_contabil_IN_RECEB_CRE_PROVISAO: TStringField
      FieldName = 'IN_RECEB_CRE_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.IN_RECEB_CRE_PROVISAO'
      FixedChar = True
      Size = 1
    end
    object qry_item_contabil_IN_RECEB_DEB_BAIXA: TStringField
      FieldName = 'IN_RECEB_DEB_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.IN_RECEB_DEB_BAIXA'
      FixedChar = True
      Size = 1
    end
    object qry_item_contabil_IN_RECEB_CRE_BAIXA: TStringField
      FieldName = 'IN_RECEB_CRE_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.IN_RECEB_CRE_BAIXA'
      FixedChar = True
      Size = 1
    end
    object qry_item_contabil_CD_MODULO_RECEB_PROV: TStringField
      FieldName = 'CD_MODULO_RECEB_PROV'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_MODULO_RECEB_PROV'
      FixedChar = True
      Size = 2
    end
    object qry_item_contabil_CD_MODULO_RECEB_BAIX: TStringField
      FieldName = 'CD_MODULO_RECEB_BAIX'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_MODULO_RECEB_BAIX'
      FixedChar = True
      Size = 2
    end
    object qry_item_contabil_CD_MODULO_PAGTO_PROV: TStringField
      FieldName = 'CD_MODULO_PAGTO_PROV'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_MODULO_PAGTO_PROV'
      FixedChar = True
      Size = 2
    end
    object qry_item_contabil_Look_mod_pagto_baixa: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_mod_pagto_baixa'
      LookupDataSet = qry_mod_pagto_
      LookupKeyFields = 'CD_MOD_CONTABIL'
      LookupResultField = 'NM_MOD_CONTABIL'
      KeyFields = 'CD_MODULO_PAGTO_BAIX'
      Size = 60
      Lookup = True
    end
    object qry_item_contabil_Look_mod_pagto_prov: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_mod_pagto_prov'
      LookupDataSet = qry_mod_pagto_
      LookupKeyFields = 'CD_MOD_CONTABIL'
      LookupResultField = 'NM_MOD_CONTABIL'
      KeyFields = 'CD_MODULO_PAGTO_PROV'
      Size = 80
      Lookup = True
    end
    object qry_item_contabil_Look_mod_receb_baixa: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_mod_receb_baixa'
      LookupDataSet = qry_mod_receb_
      LookupKeyFields = 'CD_MOD_CONTABIL'
      LookupResultField = 'NM_MOD_CONTABIL'
      KeyFields = 'CD_MODULO_RECEB_BAIX'
      Size = 60
      Lookup = True
    end
    object qry_item_contabil_Look_mod_receb_prov: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_mod_receb_prov'
      LookupDataSet = qry_mod_receb_
      LookupKeyFields = 'CD_MOD_CONTABIL'
      LookupResultField = 'NM_MOD_CONTABIL'
      KeyFields = 'CD_MODULO_RECEB_PROV'
      Size = 80
      Lookup = True
    end
    object qry_item_contabil_CD_HIST_CONTABIL: TStringField
      FieldName = 'CD_HIST_CONTABIL'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_HIST_CONTABIL'
      FixedChar = True
      Size = 10
    end
    object qry_item_contabil_NM_HIST_COMPLEMENTAR: TStringField
      FieldName = 'NM_HIST_COMPLEMENTAR'
      Origin = 'DBBROKER.TITEM_CONTABIL.NM_HIST_COMPLEMENTAR'
      FixedChar = True
      Size = 250
    end
    object qry_item_contabil_CD_MODULO_PAGTO_BAIX: TStringField
      FieldName = 'CD_MODULO_PAGTO_BAIX'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_MODULO_PAGTO_BAIX'
      FixedChar = True
      Size = 2
    end
    object qry_item_contabil_NR_OUTRO_PAGTO_CRE_PROVISAO: TStringField
      FieldName = 'NR_OUTRO_PAGTO_CRE_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.NR_OUTRO_PAGTO_CRE_PROVISAO'
      FixedChar = True
      Size = 40
    end
    object qry_item_contabil_NR_OUTRO_PAGTO_CRE_BAIXA: TStringField
      FieldName = 'NR_OUTRO_PAGTO_CRE_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.NR_OUTRO_PAGTO_CRE_BAIXA'
      FixedChar = True
      Size = 40
    end
    object qry_item_contabil_NR_OUTRO_PAGTO_DEB_PROVISAO: TStringField
      FieldName = 'NR_OUTRO_PAGTO_DEB_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.NR_OUTRO_PAGTO_DEB_PROVISAO'
      FixedChar = True
      Size = 40
    end
    object qry_item_contabil_NR_OUTRO_PAGTO_DEB_BAIXA: TStringField
      FieldName = 'NR_OUTRO_PAGTO_DEB_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.NR_OUTRO_PAGTO_DEB_BAIXA'
      FixedChar = True
      Size = 40
    end
    object qry_item_contabil_NR_OUTRO_RECEB_CRE_PROVISAO: TStringField
      FieldName = 'NR_OUTRO_RECEB_CRE_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.NR_OUTRO_RECEB_CRE_PROVISAO'
      FixedChar = True
      Size = 40
    end
    object qry_item_contabil_NR_OUTRO_RECEB_CRE_BAIXA: TStringField
      FieldName = 'NR_OUTRO_RECEB_CRE_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.NR_OUTRO_RECEB_CRE_BAIXA'
      FixedChar = True
      Size = 40
    end
    object qry_item_contabil_NR_OUTRO_RECEB_DEB_PROVISAO: TStringField
      FieldName = 'NR_OUTRO_RECEB_DEB_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.NR_OUTRO_RECEB_DEB_PROVISAO'
      FixedChar = True
      Size = 40
    end
    object qry_item_contabil_NR_OUTRO_RECEB_DEB_BAIXA: TStringField
      FieldName = 'NR_OUTRO_RECEB_DEB_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.NR_OUTRO_RECEB_DEB_BAIXA'
      FixedChar = True
      Size = 40
    end
    object qry_item_contabil_calc_in_contabiliza: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_in_contabiliza'
      Size = 3
      Calculated = True
    end
    object qry_item_contabil_CD_HIST_RECEB_PROVISAO: TStringField
      FieldName = 'CD_HIST_RECEB_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_HIST_RECEB_PROVISAO'
      FixedChar = True
      Size = 10
    end
    object qry_item_contabil_CD_HIST_RECEB_BAIXA: TStringField
      FieldName = 'CD_HIST_RECEB_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_HIST_RECEB_BAIXA'
      FixedChar = True
      Size = 10
    end
    object qry_item_contabil_CD_HIST_PAGTO_PROVISAO: TStringField
      FieldName = 'CD_HIST_PAGTO_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_HIST_PAGTO_PROVISAO'
      FixedChar = True
      Size = 10
    end
    object qry_item_contabil_CD_HIST_PAGTO_BAIXA: TStringField
      FieldName = 'CD_HIST_PAGTO_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_HIST_PAGTO_BAIXA'
      FixedChar = True
      Size = 10
    end
    object qry_item_contabil_NM_HIST_PAGTO_PROVISAO: TStringField
      FieldName = 'NM_HIST_PAGTO_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.NM_HIST_PAGTO_PROVISAO'
      FixedChar = True
      Size = 250
    end
    object qry_item_contabil_NM_HIST_RECEB_PROVISAO: TStringField
      FieldName = 'NM_HIST_RECEB_PROVISAO'
      Origin = 'DBBROKER.TITEM_CONTABIL.NM_HIST_RECEB_PROVISAO'
      FixedChar = True
      Size = 250
    end
    object qry_item_contabil_NM_HIST_RECEB_BAIXA: TStringField
      FieldName = 'NM_HIST_RECEB_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.NM_HIST_RECEB_BAIXA'
      FixedChar = True
      Size = 250
    end
    object qry_item_contabil_NM_HIST_PAGTO_BAIXA: TStringField
      FieldName = 'NM_HIST_PAGTO_BAIXA'
      Origin = 'DBBROKER.TITEM_CONTABIL.NM_HIST_PAGTO_BAIXA'
      FixedChar = True
      Size = 250
    end
    object qry_item_contabil_CD_HIST_RECEB_PROVISAOII: TStringField
      FieldName = 'CD_HIST_RECEB_PROVISAOII'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_HIST_RECEB_PROVISAOII'
      FixedChar = True
      Size = 10
    end
    object qry_item_contabil_CD_HIST_PAGTO_PROVISAOII: TStringField
      FieldName = 'CD_HIST_PAGTO_PROVISAOII'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_HIST_PAGTO_PROVISAOII'
      FixedChar = True
      Size = 10
    end
    object qry_item_contabil_CD_HIST_RECEB_BAIXAII: TStringField
      FieldName = 'CD_HIST_RECEB_BAIXAII'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_HIST_RECEB_BAIXAII'
      FixedChar = True
      Size = 10
    end
    object qry_item_contabil_CD_HIST_PAGTO_BAIXAII: TStringField
      FieldName = 'CD_HIST_PAGTO_BAIXAII'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_HIST_PAGTO_BAIXAII'
      FixedChar = True
      Size = 10
    end
    object qry_item_contabil_NM_HIST_RECEB_PROVISAOII: TStringField
      FieldName = 'NM_HIST_RECEB_PROVISAOII'
      Origin = 'DBBROKER.TITEM_CONTABIL.NM_HIST_RECEB_PROVISAOII'
      FixedChar = True
      Size = 250
    end
    object qry_item_contabil_NM_HIST_RECEB_BAIXAII: TStringField
      FieldName = 'NM_HIST_RECEB_BAIXAII'
      Origin = 'DBBROKER.TITEM_CONTABIL.NM_HIST_RECEB_BAIXAII'
      FixedChar = True
      Size = 250
    end
    object qry_item_contabil_NM_HIST_PAGTO_PROVISAOII: TStringField
      FieldName = 'NM_HIST_PAGTO_PROVISAOII'
      Origin = 'DBBROKER.TITEM_CONTABIL.NM_HIST_PAGTO_PROVISAOII'
      FixedChar = True
      Size = 250
    end
    object qry_item_contabil_NM_HIST_PAGTO_BAIXAII: TStringField
      FieldName = 'NM_HIST_PAGTO_BAIXAII'
      Origin = 'DBBROKER.TITEM_CONTABIL.NM_HIST_PAGTO_BAIXAII'
      FixedChar = True
      Size = 250
    end
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'update TITEM_CONTABIL'
      'set'
      '  CD_ITEM_CONTABIL = :CD_ITEM_CONTABIL,'
      '  NM_ITEM_CONTABIL = :NM_ITEM_CONTABIL,'
      '  IN_CONTABILIZA = :IN_CONTABILIZA,'
      '  IN_PAGTO_DEB_PROVISAO = :IN_PAGTO_DEB_PROVISAO,'
      '  IN_PAGTO_CRE_PROVISAO = :IN_PAGTO_CRE_PROVISAO,'
      '  IN_PAGTO_DEB_BAIXA = :IN_PAGTO_DEB_BAIXA,'
      '  IN_PAGTO_CRE_BAIXA = :IN_PAGTO_CRE_BAIXA,'
      '  IN_RECEB_DEB_PROVISAO = :IN_RECEB_DEB_PROVISAO,'
      '  IN_RECEB_DEB_BAIXA = :IN_RECEB_DEB_BAIXA,'
      '  IN_RECEB_CRE_BAIXA = :IN_RECEB_CRE_BAIXA,'
      '  IN_RECEB_CRE_PROVISAO = :IN_RECEB_CRE_PROVISAO,'
      '  CD_MODULO_RECEB_PROV = :CD_MODULO_RECEB_PROV,'
      '  CD_MODULO_RECEB_BAIX = :CD_MODULO_RECEB_BAIX,'
      '  CD_MODULO_PAGTO_PROV = :CD_MODULO_PAGTO_PROV,'
      '  CD_MODULO_PAGTO_BAIX = :CD_MODULO_PAGTO_BAIX,'
      '  CD_HIST_CONTABIL = :CD_HIST_CONTABIL,'
      '  NM_HIST_COMPLEMENTAR = :NM_HIST_COMPLEMENTAR,'
      '  NR_OUTRO_PAGTO_CRE_PROVISAO = :NR_OUTRO_PAGTO_CRE_PROVISAO,'
      '  NR_OUTRO_PAGTO_CRE_BAIXA = :NR_OUTRO_PAGTO_CRE_BAIXA,'
      '  NR_OUTRO_PAGTO_DEB_PROVISAO = :NR_OUTRO_PAGTO_DEB_PROVISAO,'
      '  NR_OUTRO_PAGTO_DEB_BAIXA = :NR_OUTRO_PAGTO_DEB_BAIXA,'
      '  NR_OUTRO_RECEB_CRE_PROVISAO = :NR_OUTRO_RECEB_CRE_PROVISAO,'
      '  NR_OUTRO_RECEB_CRE_BAIXA = :NR_OUTRO_RECEB_CRE_BAIXA,'
      '  NR_OUTRO_RECEB_DEB_PROVISAO = :NR_OUTRO_RECEB_DEB_PROVISAO,'
      '  NR_OUTRO_RECEB_DEB_BAIXA = :NR_OUTRO_RECEB_DEB_BAIXA,'
      '  CD_HIST_RECEB_PROVISAO = :CD_HIST_RECEB_PROVISAO,'
      '  CD_HIST_RECEB_BAIXA = :CD_HIST_RECEB_BAIXA,'
      '  CD_HIST_PAGTO_PROVISAO = :CD_HIST_PAGTO_PROVISAO,'
      '  CD_HIST_PAGTO_BAIXA = :CD_HIST_PAGTO_BAIXA,'
      '  NM_HIST_RECEB_PROVISAO = :NM_HIST_RECEB_PROVISAO,'
      '  NM_HIST_RECEB_BAIXA = :NM_HIST_RECEB_BAIXA,'
      '  NM_HIST_PAGTO_PROVISAO = :NM_HIST_PAGTO_PROVISAO,'
      '  NM_HIST_PAGTO_BAIXA = :NM_HIST_PAGTO_BAIXA,'
      '  CD_HIST_RECEB_PROVISAOII = :CD_HIST_RECEB_PROVISAOII,'
      '  CD_HIST_RECEB_BAIXAII = :CD_HIST_RECEB_BAIXAII,'
      '  CD_HIST_PAGTO_PROVISAOII = :CD_HIST_PAGTO_PROVISAOII,'
      '  CD_HIST_PAGTO_BAIXAII = :CD_HIST_PAGTO_BAIXAII,'
      '  NM_HIST_RECEB_PROVISAOII = :NM_HIST_RECEB_PROVISAOII,'
      '  NM_HIST_RECEB_BAIXAII = :NM_HIST_RECEB_BAIXAII,'
      '  NM_HIST_PAGTO_PROVISAOII = :NM_HIST_PAGTO_PROVISAOII,'
      '  NM_HIST_PAGTO_BAIXAII = :NM_HIST_PAGTO_BAIXAII'
      'where'
      '  CD_ITEM_CONTABIL = :OLD_CD_ITEM_CONTABIL')
    InsertSQL.Strings = (
      'insert into TITEM_CONTABIL'
      
        '  (CD_ITEM_CONTABIL, NM_ITEM_CONTABIL, IN_CONTABILIZA, IN_PAGTO_' +
        'DEB_PROVISAO, '
      
        '   IN_PAGTO_CRE_PROVISAO, IN_PAGTO_DEB_BAIXA, IN_PAGTO_CRE_BAIXA' +
        ', IN_RECEB_DEB_PROVISAO, '
      
        '   IN_RECEB_DEB_BAIXA, IN_RECEB_CRE_BAIXA, IN_RECEB_CRE_PROVISAO' +
        ', CD_MODULO_RECEB_PROV, '
      
        '   CD_MODULO_RECEB_BAIX, CD_MODULO_PAGTO_PROV, CD_MODULO_PAGTO_B' +
        'AIX, CD_HIST_CONTABIL, '
      
        '   NM_HIST_COMPLEMENTAR, NR_OUTRO_PAGTO_CRE_PROVISAO, NR_OUTRO_P' +
        'AGTO_CRE_BAIXA, '
      
        '   NR_OUTRO_PAGTO_DEB_PROVISAO, NR_OUTRO_PAGTO_DEB_BAIXA, NR_OUT' +
        'RO_RECEB_CRE_PROVISAO, '
      
        '   NR_OUTRO_RECEB_CRE_BAIXA, NR_OUTRO_RECEB_DEB_PROVISAO, NR_OUT' +
        'RO_RECEB_DEB_BAIXA, '
      
        '   CD_HIST_RECEB_PROVISAO, CD_HIST_RECEB_BAIXA, CD_HIST_PAGTO_PR' +
        'OVISAO, '
      
        '   CD_HIST_PAGTO_BAIXA, NM_HIST_RECEB_PROVISAO, NM_HIST_RECEB_BA' +
        'IXA, NM_HIST_PAGTO_PROVISAO, '
      
        '   NM_HIST_PAGTO_BAIXA, CD_HIST_RECEB_PROVISAOII, CD_HIST_RECEB_' +
        'BAIXAII, '
      
        '   CD_HIST_PAGTO_PROVISAOII, CD_HIST_PAGTO_BAIXAII, NM_HIST_RECE' +
        'B_PROVISAOII, '
      
        '   NM_HIST_RECEB_BAIXAII, NM_HIST_PAGTO_PROVISAOII, NM_HIST_PAGT' +
        'O_BAIXAII)'
      'values'
      
        '  (:CD_ITEM_CONTABIL, :NM_ITEM_CONTABIL, :IN_CONTABILIZA, :IN_PA' +
        'GTO_DEB_PROVISAO, '
      
        '   :IN_PAGTO_CRE_PROVISAO, :IN_PAGTO_DEB_BAIXA, :IN_PAGTO_CRE_BA' +
        'IXA, :IN_RECEB_DEB_PROVISAO, '
      
        '   :IN_RECEB_DEB_BAIXA, :IN_RECEB_CRE_BAIXA, :IN_RECEB_CRE_PROVI' +
        'SAO, :CD_MODULO_RECEB_PROV, '
      
        '   :CD_MODULO_RECEB_BAIX, :CD_MODULO_PAGTO_PROV, :CD_MODULO_PAGT' +
        'O_BAIX, '
      
        '   :CD_HIST_CONTABIL, :NM_HIST_COMPLEMENTAR, :NR_OUTRO_PAGTO_CRE' +
        '_PROVISAO, '
      
        '   :NR_OUTRO_PAGTO_CRE_BAIXA, :NR_OUTRO_PAGTO_DEB_PROVISAO, :NR_' +
        'OUTRO_PAGTO_DEB_BAIXA, '
      
        '   :NR_OUTRO_RECEB_CRE_PROVISAO, :NR_OUTRO_RECEB_CRE_BAIXA, :NR_' +
        'OUTRO_RECEB_DEB_PROVISAO, '
      
        '   :NR_OUTRO_RECEB_DEB_BAIXA, :CD_HIST_RECEB_PROVISAO, :CD_HIST_' +
        'RECEB_BAIXA, '
      
        '   :CD_HIST_PAGTO_PROVISAO, :CD_HIST_PAGTO_BAIXA, :NM_HIST_RECEB' +
        '_PROVISAO, '
      
        '   :NM_HIST_RECEB_BAIXA, :NM_HIST_PAGTO_PROVISAO, :NM_HIST_PAGTO' +
        '_BAIXA, '
      
        '   :CD_HIST_RECEB_PROVISAOII, :CD_HIST_RECEB_BAIXAII, :CD_HIST_P' +
        'AGTO_PROVISAOII, '
      
        '   :CD_HIST_PAGTO_BAIXAII, :NM_HIST_RECEB_PROVISAOII, :NM_HIST_R' +
        'ECEB_BAIXAII, '
      '   :NM_HIST_PAGTO_PROVISAOII, :NM_HIST_PAGTO_BAIXAII)')
    DeleteSQL.Strings = (
      'delete from TITEM_CONTABIL'
      'where'
      '  CD_ITEM_CONTABIL = :OLD_CD_ITEM_CONTABIL')
    Left = 320
    Top = 56
  end
end
