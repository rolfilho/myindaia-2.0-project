object datm_AtualizaSISCOMEX: Tdatm_AtualizaSISCOMEX
  OldCreateOrder = True
  Left = 236
  Top = 176
  Height = 150
  Width = 215
  object db_siscomex: TDatabase
    AliasName = 'Acesso ao MDB - TABSISCO'
    DatabaseName = 'DBSISCOMEX'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 30
    Top = 12
  end
  object tbl_siscomex: TTable
    DatabaseName = 'DBSISCOMEX'
    TableName = 'TAB_RF'
    Left = 30
    Top = 68
  end
  object tbl_broker: TTable
    DatabaseName = 'DBBROKER'
    Exclusive = True
    UpdateMode = upWhereKeyOnly
    Left = 102
    Top = 12
  end
end
