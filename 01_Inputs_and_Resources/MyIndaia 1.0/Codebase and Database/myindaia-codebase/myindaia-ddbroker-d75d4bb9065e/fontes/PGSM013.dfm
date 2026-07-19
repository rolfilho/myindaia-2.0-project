object datm_via_transp: Tdatm_via_transp
  OldCreateOrder = True
  Left = 432
  Top = 197
  Height = 237
  Width = 217
  object ds_via_transp: TDataSource
    DataSet = qry_via_transp_
    Left = 31
    Top = 17
  end
  object qry_via_transp_: TQuery
    OnCalcFields = qry_via_transp_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TVIA_TRANSP_BROKER'
      'ORDER BY'
      'CD_VIA_TRANSP')
    Left = 127
    Top = 17
    object qry_via_transp_CD_VIA_TRANSP: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSP'
      Size = 2
    end
    object qry_via_transp_NM_VIA_TRANSP: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_VIA_TRANSP'
      Origin = 'TVIA_TRANSPORTE.NM_VIA_TRANSP'
    end
    object qry_via_transp_CD_VIA_TRANSP_SISCOMEX: TStringField
      FieldName = 'CD_VIA_TRANSP_SISCOMEX'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSP_SISCOMEX'
      OnSetText = qry_via_transp_CD_VIA_TRANSP_SISCOMEXSetText
      Size = 2
    end
    object qry_via_transp_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TVIA_TRANSPORTE.IN_ATIVO'
      Size = 1
    end
    object qry_via_transp_NM_VIA_TRANSP_INGLES: TStringField
      FieldName = 'NM_VIA_TRANSP_INGLES'
      Origin = 'TVIA_TRANSP_BROKER.CD_VIA_TRANSP'
    end
    object qry_via_transp_NM_VIA_TRANSP_ESP: TStringField
      FieldName = 'NM_VIA_TRANSP_ESP'
      Origin = 'TVIA_TRANSP_BROKER.CD_VIA_TRANSP'
    end
    object qry_via_transp_CONSTANTE_CUBAGEM: TFloatField
      FieldName = 'CONSTANTE_CUBAGEM'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.CONSTANTE_CUBAGEM'
    end
    object qry_via_transp_IN_FCL: TStringField
      FieldName = 'IN_FCL'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.IN_FCL'
      FixedChar = True
      Size = 1
    end
    object qry_via_transp_IN_LCL: TStringField
      FieldName = 'IN_LCL'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.IN_LCL'
      FixedChar = True
      Size = 1
    end
    object qry_via_transp_IN_CS: TStringField
      FieldName = 'IN_CS'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.IN_CS'
      FixedChar = True
      Size = 1
    end
    object qry_via_transp_calcAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcAtivo'
      Size = 1
      Calculated = True
    end
    object qry_via_transp_LookScx: TStringField
      FieldKind = fkLookup
      FieldName = 'LookScx'
      LookupDataSet = qry_via_scx_
      LookupKeyFields = 'CD_VIA_TRANSPORTE'
      LookupResultField = 'NM_VIA_TRANSPORTE'
      KeyFields = 'CD_VIA_TRANSP_SISCOMEX'
      Size = 100
      Lookup = True
    end
    object qry_via_transp_FIESP_Id: TIntegerField
      FieldName = 'FIESP_Id'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.FIESP_Id'
    end
  end
  object qry_ult_via_transp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_VIA_TRANSP) AS ULTIMO'
      'FROM TVIA_TRANSP_BROKER')
    Left = 31
    Top = 136
    object qry_ult_via_transp_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSP'
      Size = 2
    end
  end
  object qry_via_scx_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TVIA_TRANSPORTE')
    Left = 127
    Top = 136
    object qry_via_scx_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_via_scx_NM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      Origin = 'TVIA_TRANSPORTE.NM_VIA_TRANSPORTE'
    end
  end
end
