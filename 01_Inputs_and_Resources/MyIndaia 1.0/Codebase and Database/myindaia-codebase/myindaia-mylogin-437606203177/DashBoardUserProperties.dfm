object dtmDashBoardUserProperties: TdtmDashBoardUserProperties
  OldCreateOrder = False
  Left = 225
  Top = 82
  Height = 215
  Width = 296
  object conDashBoard: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXDataSnap'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DriverName=DataSnap'
      'HostName=INDAIAWEB'
      'Port=9876'
      'Filters={}'
      'CommunicationProtocol=tcp/ip'
      'ConnectTimeout=5000'
      'User_Name=MyLogin'
      'Password=123')
    Left = 32
    Top = 16
  end
  object dspcUserProperties: TDSProviderConnection
    ServerClassName = 'TdssmUserProperties'
    SQLConnection = conDashBoard
    Left = 136
    Top = 16
  end
  object ssmGetLoginNamesFrom: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'AUserCode'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 2000
        Value = 
          'Nestle_Teste;Nestle;A;mairlon.macedo;cebrace;carlam;rodrigo.c;r.' +
          'capim;andrea.cebrace;nelson.cebrace;cebrace.imp;whirlpool.exp;wh' +
          'irlpool.imp;Nestle2;andrea.abril;carol.abril;abril.imp'
      end>
    SQLConnection = conDashBoard
    ServerMethodName = 'TdssmUserProperties.GetLoginNamesFrom'
    Left = 136
    Top = 80
  end
end
