object datm_consulta_padrao: Tdatm_consulta_padrao
  Left = 218
  Top = 113
  Height = 367
  Width = 422
  object Query: TQuery
    Left = 128
    Top = 72
  end
  object Tabela: TTable
    Filtered = True
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    Left = 129
    Top = 136
  end
  object ds_Tabela: TDataSource
    DataSet = Tabela
    Left = 68
    Top = 136
  end
end
