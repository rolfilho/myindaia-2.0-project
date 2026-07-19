object datm_atualiza_ncm: Tdatm_atualiza_ncm
  Left = 303
  Top = 183
  Height = 150
  Width = 215
  object ds_atualiza_ncm: TDataSource
    DataSet = qry_atualiza_ncm_
    Left = 30
    Top = 24
  end
  object qry_atualiza_ncm_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_NCM_SH'
      'FROM    TMERCADORIA'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA')
    Params.Data = {010001000D43445F4D45524341444F5249410001020030000000}
    Left = 130
    Top = 24
    object qry_atualiza_ncm_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TMERCADORIA.CD_NCM_SH'
      Size = 11
    end
  end
end
