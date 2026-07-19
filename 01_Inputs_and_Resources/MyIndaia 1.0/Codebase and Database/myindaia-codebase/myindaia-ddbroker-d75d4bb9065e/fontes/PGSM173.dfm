object datm_ct_custo: Tdatm_ct_custo
  Left = 117
  Top = 104
  Height = 156
  Width = 289
  object ds_ct_custo: TDataSource
    DataSet = qry_ct_custo_
    Left = 36
    Top = 24
  end
  object qry_ct_custo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TCT_CUSTO'
      'WHERE CD_CT_CUSTO <> '#39#39
      'ORDER BY'
      'CD_CT_CUSTO')
    Left = 137
    Top = 24
    object qry_ct_custo_CD_CT_CUSTO: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_CT_CUSTO'
      Origin = 'TCT_CUSTO.CD_CT_CUSTO'
      Size = 3
    end
    object qry_ct_custo_NM_CT_CUSTO: TStringField
      DisplayLabel = 'Conta Custo'
      FieldName = 'NM_CT_CUSTO'
      Origin = 'TCT_CUSTO.NM_CT_CUSTO'
      Size = 40
    end
  end
end
