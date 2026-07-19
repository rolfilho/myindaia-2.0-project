object dtmDuimp: TdtmDuimp
  OldCreateOrder = False
  Height = 333
  Width = 425
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=broker'
      'User_Name=sa'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    LoginPrompt = False
    Left = 41
    Top = 29
  end
end
