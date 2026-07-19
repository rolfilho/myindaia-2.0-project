object FireDacMSSQLConnection: TFireDacMSSQLConnection
  OldCreateOrder = True
  Height = 198
  Width = 282
  object Connection: TFDConnection
    ConnectionName = 'Broker'
    Params.Strings = (
      'Database=BROKER'
      'User_Name=sa'
      'Password=123'
      'Server=ANTUERPIA'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 16
    Top = 8
  end
end
