object FireDacMSSQLConnection: TFireDacMSSQLConnection
  OldCreateOrder = True
  OnDestroy = DataModuleDestroy
  Height = 198
  Width = 282
  object Connection: TFDConnection
    Params.Strings = (
      'Database=Demo'
      'User_Name=sa'
      'Password=masterkey'
      'Server=127.0.0.1'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 16
    Top = 8
  end
end
