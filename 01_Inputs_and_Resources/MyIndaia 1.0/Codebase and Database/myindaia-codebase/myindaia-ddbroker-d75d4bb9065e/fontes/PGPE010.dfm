object datm_pe_duplica: Tdatm_pe_duplica
  Left = 200
  Top = 104
  Height = 150
  Width = 215
  object ds_pe: TDataSource
    DataSet = qry_pe_
    Left = 24
    Top = 24
  end
  object qry_pe_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO '
      'FROM TPE'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {
      010002000B4E525F50524F434553534F00010200300000000B43445F554E4944
      5F4E45470001020030000000}
    Left = 96
    Top = 24
    object qry_pe_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE.NR_PROCESSO'
      Size = 18
    end
  end
end
