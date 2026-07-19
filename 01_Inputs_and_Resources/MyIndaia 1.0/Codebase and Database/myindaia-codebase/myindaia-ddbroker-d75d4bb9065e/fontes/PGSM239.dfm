object datm_grupo_item: Tdatm_grupo_item
  OldCreateOrder = True
  Left = 243
  Top = 200
  Height = 204
  Width = 624
  object ds_grupo_item: TDataSource
    DataSet = qry_grupo_item_
    Left = 39
    Top = 91
  end
  object qry_grupo_item_: TQuery
    AfterScroll = qry_grupo_item_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TGRUPO_ITEM'
      'ORDER BY'
      'NM_GRUPO_ITEM')
    Left = 39
    Top = 27
    object qry_grupo_item_CD_GRUPO_ITEM: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_GRUPO_ITEM'
      Origin = 'TGRUPO_ITEM.CD_GRUPO_ITEM'
      Size = 2
    end
    object qry_grupo_item_NM_GRUPO_ITEM: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_GRUPO_ITEM'
      Origin = 'TGRUPO_ITEM.NM_GRUPO_ITEM'
      Size = 30
    end
    object qry_grupo_item_CD_ACESSO_CRE: TStringField
      FieldName = 'CD_ACESSO_CRE'
      Origin = 'DBBROKER.TGRUPO_ITEM.CD_ACESSO_CRE'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_item_CD_AUX_CRE: TStringField
      FieldName = 'CD_AUX_CRE'
      Origin = 'DBBROKER.TGRUPO_ITEM.CD_AUX_CRE'
      FixedChar = True
      Size = 3
    end
    object qry_grupo_item_CD_CT_CONTABIL_CRE: TStringField
      FieldName = 'CD_CT_CONTABIL_CRE'
      Origin = 'DBBROKER.TGRUPO_ITEM.CD_CT_CONTABIL_CRE'
      OnChange = qry_grupo_item_CD_CT_CONTABIL_CREChange
      FixedChar = True
      Size = 10
    end
    object qry_grupo_item_CD_ACESSO_DEB: TStringField
      FieldName = 'CD_ACESSO_DEB'
      Origin = 'DBBROKER.TGRUPO_ITEM.CD_ACESSO_DEB'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_item_CD_AUX_DEB: TStringField
      FieldName = 'CD_AUX_DEB'
      Origin = 'DBBROKER.TGRUPO_ITEM.CD_AUX_DEB'
      FixedChar = True
      Size = 3
    end
    object qry_grupo_item_CD_CT_CONTABIL_DEB: TStringField
      FieldName = 'CD_CT_CONTABIL_DEB'
      Origin = 'DBBROKER.TGRUPO_ITEM.CD_CT_CONTABIL_DEB'
      OnChange = qry_grupo_item_CD_CT_CONTABIL_DEBChange
      FixedChar = True
      Size = 10
    end
    object qry_grupo_item_LookAcessoCre: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAcessoCre'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_ACESSO'
      KeyFields = 'CD_CT_CONTABIL_CRE'
      Size = 1
      Lookup = True
    end
    object qry_grupo_item_LookAuxCre: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAuxCre'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_AUX'
      KeyFields = 'CD_CT_CONTABIL_CRE'
      Size = 3
      Lookup = True
    end
    object qry_grupo_item_NM_DESC_CONTABIL: TStringField
      FieldName = 'NM_DESC_CONTABIL'
      Origin = 'DBBROKER.TGRUPO_ITEM.NM_DESC_CONTABIL'
      FixedChar = True
      Size = 50
    end
    object qry_grupo_item_LookAcessoDeb: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAcessoDeb'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_ACESSO'
      KeyFields = 'CD_CT_CONTABIL_DEB'
      Size = 1
      Lookup = True
    end
    object qry_grupo_item_LookAuxDeb: TStringField
      DisplayWidth = 3
      FieldKind = fkLookup
      FieldName = 'LookAuxDeb'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_AUX'
      KeyFields = 'CD_CT_CONTABIL_DEB'
      Size = 3
      Lookup = True
    end
  end
  object qry_item_: TQuery
    AfterDelete = qry_item_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM   TITEM'
      '')
    Left = 260
    Top = 27
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
  object ds_grupo_item_item: TDataSource
    DataSet = qry_grupo_item_item_
    Left = 149
    Top = 91
  end
  object qry_grupo_item_item_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TGRUPO_ITEM_ITEM'
      'WHERE CD_GRUPO_ITEM = :CD_GRUPO_ITEM ORDER BY'
      'CD_ITEM')
    Left = 149
    Top = 27
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO_ITEM'
        ParamType = ptUnknown
      end>
    object qry_grupo_item_item_CD_GRUPO_ITEM: TStringField
      FieldName = 'CD_GRUPO_ITEM'
      Origin = 'TGRUPO_ITEM_ITEM.CD_GRUPO_ITEM'
      Size = 2
    end
    object qry_grupo_item_item_CD_ITEM: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_ITEM'
      Origin = 'TGRUPO_ITEM_ITEM.CD_ITEM'
      Size = 3
    end
    object qry_grupo_item_item_LookItem: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkLookup
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 50
      Lookup = True
    end
  end
  object qry_ult_grupo_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX( CD_GRUPO_ITEM ) AS ULTIMO'
      'FROM   TGRUPO_ITEM')
    Left = 260
    Top = 91
    object qry_ult_grupo_item_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TGRUPO_ITEM.CD_GRUPO_ITEM'
      Size = 2
    end
  end
  object sp_exclui_grupo_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exclui_grupo_item'
    Left = 395
    Top = 91
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_grupo_item'
        ParamType = ptInput
      end>
  end
  object qry_ct_contabil_unica_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL '
      'FROM TCT_CONTABIL (NOLOCK)'
      
        'WHERE  CD_ACESSO+CD_AUX = :CD_ACESSO_AUX AND CD_IDENTIFICADOR = ' +
        #39'A'#39
      'ORDER BY CD_CT_CONTABIL')
    Left = 390
    Top = 25
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACESSO_AUX'
        ParamType = ptUnknown
      end>
    object qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 10
    end
    object qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SISTEMA_CONTABIL'
      'FROM TPARAMETROS (NOLOCK)')
    Left = 506
    Top = 25
    object qry_param_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TPARAMETROS.CD_SISTEMA_CONTABIL'
      Size = 1
    end
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX FROM TC' +
        'T_CONTABIL (NOLOCK)'
      'WHERE CD_IDENTIFICADOR = '#39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 509
    Top = 90
    object qry_ct_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_ct_contabil_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
    object qry_ct_contabil_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCT_CONTABIL.CD_ACESSO'
      Size = 1
    end
    object qry_ct_contabil_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCT_CONTABIL.CD_AUX'
      Size = 3
    end
  end
end
