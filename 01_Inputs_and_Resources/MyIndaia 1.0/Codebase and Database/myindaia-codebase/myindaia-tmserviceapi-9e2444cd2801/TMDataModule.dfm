object DMBroker: TDMBroker
  OldCreateOrder = False
  Height = 341
  Width = 428
  object Connection: TFDConnection
    Params.Strings = (
      'Database=TM'
      'User_Name=SA'
      'Password=123'
      'Server=ANTUERPIA'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FDLogin: TFDConnection
    Left = 104
    Top = 16
  end
  object Consulta: TFDQuery
    Connection = Connection
    Left = 32
    Top = 64
  end
  object Executa: TFDQuery
    Connection = Connection
    Left = 32
    Top = 112
  end
  object spProcessaPlanilha: TFDStoredProc
    Connection = Connection
    SchemaName = 'dbo'
    StoredProcName = 'TM..sp_processa_planilha'
    Left = 97
    Top = 112
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
      end
      item
        Position = 2
        Name = '@id_planilha'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = '@tipo'
        DataType = ftFixedWideChar
        ParamType = ptInput
        Size = 1
      end>
  end
end
