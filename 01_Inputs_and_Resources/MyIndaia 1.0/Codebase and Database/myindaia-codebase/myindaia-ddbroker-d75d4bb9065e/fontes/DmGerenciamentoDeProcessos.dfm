object dmdGerenciamentoProcessos: TdmdGerenciamentoProcessos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 196
  Top = 117
  Height = 150
  Width = 215
  object qryBroker: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = datm_main.SQLConnection
    Left = 40
    Top = 12
  end
  object qryListaProcessos: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT '
      #9'RTRIM(TP.NR_PROCESSO) AS NR_PROCESSO,'
      #9'RTRIM(TP.CD_CLIENTE) AS CD_CLIENTE,'
      #9'TP.DT_ABERTURA,'
      #9'RTRIM(TP.NR_CONHECIMENTO) AS NR_CONHECIMENTO,'
      #9'RTRIM(EN.NM_EMPRESA) AS NM_EMPRESA,'
      #9'RTRIM(EN.CGC_EMPRESA) AS CGC_EMPRESA,'
      #9'RTRIM(USU.NM_USUARIO) AS NM_USUARIO'
      'FROM TPROCESSO TP(NOLOCK)'
      
        'LEFT JOIN BROKER.DBO.TEMPRESA_NAC EN   (NOLOCK) ON EN.CD_EMPRESA' +
        '=TP.CD_CLIENTE'
      
        'LEFT JOIN BROKER.DBO.TUSUARIO          USU (NOLOCK) ON USU.CD_US' +
        'UARIO=TP.CD_USUARIO'
      'WHERE NR_PROCESSO IN ('#39'0101IM-000100-16'#39')')
    Left = 84
    Top = 40
    object qryListaProcessosNR_PROCESSO: TStringField
      DisplayLabel = 'N'#186'. Processo'
      DisplayWidth = 16
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryListaProcessosNR_CONHECIMENTO: TStringField
      DisplayLabel = 'N'#186'. Conhecimento'
      DisplayWidth = 20
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qryListaProcessosCD_CLIENTE: TStringField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryListaProcessosNM_EMPRESA: TStringField
      DisplayLabel = 'Raz'#227'o Social Cliente'
      DisplayWidth = 40
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qryListaProcessosCGC_EMPRESA: TStringField
      DisplayLabel = 'CNPJ Cliente'
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qryListaProcessosDT_ABERTURA: TDateTimeField
      DisplayLabel = 'Data Abertura'
      FieldName = 'DT_ABERTURA'
    end
    object qryListaProcessosNM_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      DisplayWidth = 20
      FieldName = 'NM_USUARIO'
      Visible = False
      FixedChar = True
      Size = 50
    end
  end
end
