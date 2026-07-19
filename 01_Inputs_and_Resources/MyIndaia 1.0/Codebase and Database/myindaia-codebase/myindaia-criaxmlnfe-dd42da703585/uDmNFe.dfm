object dmNFe: TdmNFe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=broker'
      'User_Name=sa'
      'Password=123'
      'Server=indaia10'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object QCab: TFDQuery
    Connection = FDConnection1
    Left = 136
    Top = 24
  end
  object QDet: TFDQuery
    Connection = FDConnection1
    Left = 56
    Top = 80
  end
  object QCntr: TFDQuery
    Connection = FDConnection1
    Left = 136
    Top = 80
  end
end
