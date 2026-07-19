object datm_urf_scx_exp: Tdatm_urf_scx_exp
  Left = 200
  Top = 105
  Height = 150
  Width = 295
  object qry_urf_scx_exp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TURF_SCX_EXP ORDER BY'
      'NM_URF')
    Left = 64
    Top = 16
    object qry_urf_scx_exp_CD_URF: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_URF'
      Origin = 'TURF_SCX_EXP.CD_URF'
      Size = 7
    end
    object qry_urf_scx_exp_NM_URF: TStringField
      DisplayLabel = 'U.R.F.'
      FieldName = 'NM_URF'
      Origin = 'TURF_SCX_EXP.NM_URF'
      Size = 30
    end
    object qry_urf_scx_exp_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TURF_SCX_EXP.CD_VIA_TRANSP'
      Size = 2
    end
    object qry_urf_scx_exp_LookViaTransp: TStringField
      DisplayLabel = 'Via Transporte'
      FieldName = 'LookViaTransp'
      LookupDataSet = qry_via_transp_broker_
      LookupKeyFields = 'CD_VIA_TRANSP'
      LookupResultField = 'NM_VIA_TRANSP'
      KeyFields = 'CD_VIA_TRANSP'
      Lookup = True
    end
  end
  object ds_urf_scx_exp: TDataSource
    DataSet = qry_urf_scx_exp_
    Left = 64
    Top = 64
  end
  object qry_via_transp_broker_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_VIA_TRANSP, NM_VIA_TRANSP FROM'
      'TVIA_TRANSP_BROKER WHERE IN_ATIVO =  '#39'1'#39' ORDER BY'
      'NM_VIA_TRANSP')
    Left = 180
    Top = 16
    object qry_via_transp_broker_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TVIA_TRANSP_BROKER.CD_VIA_TRANSP'
      Size = 2
    end
    object qry_via_transp_broker_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      Origin = 'TVIA_TRANSP_BROKER.NM_VIA_TRANSP'
    end
  end
  object ds_via_transp_broker: TDataSource
    DataSet = qry_via_transp_broker_
    Left = 180
    Top = 64
  end
end
