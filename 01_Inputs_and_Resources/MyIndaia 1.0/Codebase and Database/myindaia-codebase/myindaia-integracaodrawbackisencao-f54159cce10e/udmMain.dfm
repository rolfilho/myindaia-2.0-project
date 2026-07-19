object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 131
  Width = 258
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=BROKER'
      'User_Name=sa'
      'Password=123'
      'Server=indaia10'
      'DriverID=MSSQL')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    Left = 43
    Top = 25
  end
end
