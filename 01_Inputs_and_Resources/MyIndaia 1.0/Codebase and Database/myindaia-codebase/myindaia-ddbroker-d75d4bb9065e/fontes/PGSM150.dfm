object datm_disp_legal: Tdatm_disp_legal
  Left = 200
  Top = 104
  Height = 308
  Width = 273
  object qry_disp_legal_: TQuery
    BeforeInsert = qry_disp_legal_BeforeInsert
    BeforeEdit = qry_disp_legal_BeforeEdit
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TTP_EXONERACAO'
      'ORDER BY'
      'CD_EX')
    Left = 128
    Top = 32
    object qry_disp_legal_CD_EX: TStringField
      FieldName = 'CD_EX'
      Origin = 'TTP_EXONERACAO.CD_EX'
      Size = 3
    end
    object qry_disp_legal_NM_EX: TStringField
      FieldName = 'NM_EX'
      Origin = 'TTP_EXONERACAO.NM_EX'
      Size = 30
    end
    object qry_disp_legal_CD_TRIB: TStringField
      FieldName = 'CD_TRIB'
      Origin = 'TTP_EXONERACAO.CD_TRIB'
      Size = 1
    end
    object qry_disp_legal_LookupTributo: TStringField
      FieldName = 'LookupTributo'
      LookupDataSet = qry_trat_tribut_
      LookupKeyFields = 'CD_TRAT_TRIB_ICMS'
      LookupResultField = 'NM_TRAT_TRIB_ICMS'
      KeyFields = 'CD_TRIB'
      Lookup = True
    end
    object qry_disp_legal_NM_FUND_LEGAL: TStringField
      FieldName = 'NM_FUND_LEGAL'
      Origin = 'TTP_EXONERACAO.CD_EX'
      Size = 240
    end
  end
  object ds_disp_legal: TDataSource
    DataSet = qry_disp_legal_
    Left = 32
    Top = 32
  end
  object qry_trat_tribut_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_TRAT_TRIB_ICMS')
    Left = 128
    Top = 104
    object qry_trat_tribut_CD_TRAT_TRIB_ICMS: TStringField
      FieldName = 'CD_TRAT_TRIB_ICMS'
      Origin = 'TTP_TRAT_TRIB_ICMS.CD_TRAT_TRIB_ICMS'
      Size = 1
    end
    object qry_trat_tribut_NM_TRAT_TRIB_ICMS: TStringField
      FieldName = 'NM_TRAT_TRIB_ICMS'
      Origin = 'TTP_TRAT_TRIB_ICMS.NM_TRAT_TRIB_ICMS'
    end
  end
  object ds_trat_tribut: TDataSource
    DataSet = qry_trat_tribut_
    Left = 32
    Top = 104
  end
  object qry_ult_disp_legal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_EX) AS ULTIMO'
      'FROM TTP_EXONERACAO')
    Left = 46
    Top = 189
    object qry_ult_disp_legal_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TTP_EXONERACAO.CD_EX'
      Size = 3
    end
  end
end
