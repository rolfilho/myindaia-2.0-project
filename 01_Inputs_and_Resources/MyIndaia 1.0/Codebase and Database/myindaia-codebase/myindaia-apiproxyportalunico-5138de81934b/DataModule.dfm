object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Connection: TFDConnection
    Params.Strings = (
      'Database=Broker'
      'User_Name=SA'
      'Password=123'
      'Server=ANTUERPIA'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
end
