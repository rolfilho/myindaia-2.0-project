object FireDacMSSQLConnection: TFireDacMSSQLConnection
  OldCreateOrder = True
  Height = 198
  Width = 282
  object Connection: TFDConnection
    Params.Strings = (
      'Database=Broker'
      'User_Name=sa'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object queryProcesso: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT'
      'P.NR_PROCESSO AS NrProcesso, /*12*/'
      'P.CD_AGENTE AS Carrier, /*1*/'
      'P.BOOKING_CONTRACT_NUMBER AS ContractNumber, /*2*/'
      'EN.NM_EMPRESA + '#39' '#39' +'
      'SUBSTRING(EN.CGC_EMPRESA,  1, 2) + '#39'.'#39' +'
      'SUBSTRING(EN.CGC_EMPRESA,  3, 3) + '#39'.'#39' +'
      'SUBSTRING(EN.CGC_EMPRESA,  6, 3) + '#39'/'#39' +'
      'SUBSTRING(EN.CGC_EMPRESA,  9, 4) + '#39'-'#39' +'
      'SUBSTRING(EN.CGC_EMPRESA, 13, 2)'
      'AS Shipper, /*4*/'
      'EE.NM_EMPRESA AS Consignee, /*6*/'
      'P.BOOKING_CONTRACT_PARTY AS ContractParty, /*7*/'
      'CASE ISNULL(TP_NOTIFY1_PROC, 5) '
      #9'WHEN 0 then --Importador'
      
        #9'(SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTAD' +
        'OR = 1 AND CD_EMPRESA = CD_NOTIFY1_PROC'
      
        #9' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (' +
        'NOLOCK) WHERE CD_GRUPO = P.CD_GRUPO))'
      #9'WHEN 1 THEN --Agente'
      
        #9'(SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA ' +
        '= CD_NOTIFY1_PROC'
      #9'AND IN_AGENTE = '#39'1'#39' AND IN_ATIVO = '#39'1'#39')'
      #9'WHEN 2 THEN --Transportadora'
      
        #9'(SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = CD_NOT' +
        'IFY1_PROC)'
      #9'WHEN 3 THEN --Banco'
      
        #9'(SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA ' +
        '= CD_NOTIFY1_PROC'
      #9' AND IN_BANCO = '#39'1'#39' AND IN_ATIVO = '#39'1'#39')'
      #9'WHEN 4 THEN --Despachante'
      
        #9'(SELECT NM_DESPACHANTE FROM TDESPACHANTE WHERE CD_DESPACHANTE =' +
        ' CD_NOTIFY1_PROC)'
      'END AS NotifyParty, /*8*/'
      
        'Cast(ISNULL(STUFF((SELECT TOP 1 '#39','#39' + LTRIM(RTRIM(R.CD_REFERENCI' +
        'A))'
      #9#9'   FROM TREF_CLIENTE R WITH (NOLOCK)'
      #9#9#9'   WHERE R.NR_PROCESSO   = P.NR_PROCESSO'
      #9#9#9#9' AND R.TP_REFERENCIA = '#39'04'#39
      
        #9'   FOR XML PATH('#39#39')), 1, 1, '#39#39'), '#39#39') as Varchar(300)) AS Shippe' +
        'rReferenceNumber, /*11*/'
      'ISNULL(P.BOOKING_MOVE_TYPE, 0) AS MoveType, /*14*/'
      
        'PB_COLETA.NM_SIGLA_2L + LE_COLETA.CD_SIGLA AS PlaceofCarrierRece' +
        'ipt, /*15 Exemplo BRSSZ */'
      
        'ISNULL(PB_ENTREGA.NM_SIGLA_2L, PB_DESEMBARQUE.NM_SIGLA_2L) + ISN' +
        'ULL(LE_ENTREGA.CD_SIGLA, LE_DESEMBARQUE.CD_SIGLA) AS PlaceofCarr' +
        'ierDelivery, /*17 Exemplo BRSSZ */'
      
        'REPLACE(CONVERT(CHAR(15), EV131.DT_REALIZACAO, 106),'#39' '#39','#39'-'#39') AS ' +
        'EarliestDeparture, /*16*/'
      'P.BOOKING_HS_CODE AS HSCode, /*24*/'
      'P.VL_PESO_BRUTO AS CargoWeight, /*25*/'
      'P.CD_INCOTERM AS PaymentDetails, /*29*/'
      'P.BOOKING_CUSTOMER_COMMENTS AS CustomerComments, /*30*/'
      'P.BOOKING_PARTNER_EMAIL AS PartneremailNotifications, /*31*/'
      'P.CD_CLIENTE AS CodigoEmpresa,'
      'P.CD_AREA AS CodigoArea'
      'FROM TPROCESSO P'
      'INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = P.CD_CLIENTE'
      'LEFT JOIN TEMPRESA_EST EE ON EE.CD_EMPRESA = P.CD_IMPORTADOR'
      
        'LEFT JOIN TLOCAL_EMBARQUE LE_COLETA ON LE_COLETA.CODIGO = P.CD_L' +
        'OCAL_EMBARQUE'
      
        'LEFT JOIN TPAIS_BROKER PB_COLETA ON PB_COLETA.CD_PAIS = LE_COLET' +
        'A.CD_PAIS'
      
        'LEFT JOIN TLOCAL_EMBARQUE LE_ENTREGA ON LE_ENTREGA.CODIGO = P.CD' +
        '_LOCAL_ENTREGA'
      
        'LEFT JOIN TPAIS_BROKER PB_ENTREGA ON PB_ENTREGA.CD_PAIS = LE_ENT' +
        'REGA.CD_PAIS'
      
        'LEFT JOIN TLOCAL_EMBARQUE LE_DESEMBARQUE ON LE_DESEMBARQUE.CODIG' +
        'O = P.CD_LOCAL_DESEMBARQUE'
      
        'LEFT JOIN TPAIS_BROKER PB_DESEMBARQUE ON PB_DESEMBARQUE.CD_PAIS ' +
        '= LE_DESEMBARQUE.CD_PAIS'
      
        'LEFT JOIN TFOLLOWUP EV131 ON EV131.NR_PROCESSO = P.NR_PROCESSO A' +
        'ND EV131.CD_EVENTO = '#39'131'#39
      'WHERE P.NR_PROCESSO = :NrProcesso')
    Left = 56
    Top = 112
    ParamData = <
      item
        Name = 'NRPROCESSO'
        DataType = ftString
        ParamType = ptInput
        Value = '0102EM-000100-21'
      end>
    object queryProcessoNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Origin = 'NrProcesso'
      Required = True
      FixedChar = True
      Size = 18
    end
    object queryProcessoCarrier: TStringField
      FieldName = 'Carrier'
      Origin = 'Carrier'
      FixedChar = True
      Size = 4
    end
    object queryProcessoContractNumber: TStringField
      FieldName = 'ContractNumber'
      Origin = 'ContractNumber'
      Size = 35
    end
    object queryProcessoShipper: TStringField
      FieldName = 'Shipper'
      Origin = 'Shipper'
      Size = 80
    end
    object queryProcessoConsignee: TStringField
      FieldName = 'Consignee'
      Origin = 'Consignee'
      Size = 100
    end
    object queryProcessoContractParty: TStringField
      FieldName = 'ContractParty'
      Origin = 'ContractParty'
      Size = 200
    end
    object queryProcessoNotifyParty: TStringField
      FieldName = 'NotifyParty'
      Origin = 'NotifyParty'
      ReadOnly = True
      Size = 100
    end
    object queryProcessoShipperReferenceNumber: TStringField
      FieldName = 'ShipperReferenceNumber'
      Origin = 'ShipperReferenceNumber'
      ReadOnly = True
      Size = 300
    end
    object queryProcessoMoveType: TStringField
      FieldName = 'MoveType'
      Origin = 'MoveType'
      FixedChar = True
      Size = 1
    end
    object queryProcessoPlaceofCarrierReceipt: TStringField
      FieldName = 'PlaceofCarrierReceipt'
      Origin = 'PlaceofCarrierReceipt'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object queryProcessoPlaceofCarrierDelivery: TStringField
      FieldName = 'PlaceofCarrierDelivery'
      Origin = 'PlaceofCarrierDelivery'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object queryProcessoEarliestDeparture: TStringField
      FieldName = 'EarliestDeparture'
      Origin = 'EarliestDeparture'
      ReadOnly = True
      Size = 8000
    end
    object queryProcessoHSCode: TStringField
      FieldName = 'HSCode'
      Origin = 'HSCode'
      Size = 6
    end
    object queryProcessoCargoWeight: TFloatField
      FieldName = 'CargoWeight'
      Origin = 'CargoWeight'
    end
    object queryProcessoPaymentDetails: TStringField
      FieldName = 'PaymentDetails'
      Origin = 'PaymentDetails'
      FixedChar = True
      Size = 3
    end
    object queryProcessoCustomerComments: TMemoField
      FieldName = 'CustomerComments'
      Origin = 'CustomerComments'
      BlobType = ftMemo
      Size = 2147483647
    end
    object queryProcessoPartneremailNotifications: TMemoField
      FieldName = 'PartneremailNotifications'
      Origin = 'PartneremailNotifications'
      BlobType = ftMemo
      Size = 2147483647
    end
    object queryProcessoCodigoEmpresa: TStringField
      FieldName = 'CodigoEmpresa'
      Origin = 'CodigoEmpresa'
      FixedChar = True
      Size = 5
    end
    object queryProcessoCodigoArea: TStringField
      FieldName = 'CodigoArea'
      Origin = 'CodigoArea'
      FixedChar = True
      Size = 2
    end
  end
  object queryContainers: TFDQuery
    Connection = Connection
    SQL.Strings = (
      
        'SELECT COUNT(TP_CNTR) AS QTDE_TP_CNTR, TP_CNTR FROM TPROCESSO_CN' +
        'TR WHERE NR_PROCESSO = :NrProcesso GROUP BY TP_CNTR')
    Left = 144
    Top = 112
    ParamData = <
      item
        Name = 'NRPROCESSO'
        ParamType = ptInput
      end>
    object queryContainersQTDE_TP_CNTR: TIntegerField
      FieldName = 'QTDE_TP_CNTR'
      Origin = 'QTDE_TP_CNTR'
      ReadOnly = True
    end
    object queryContainersTP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'TP_CNTR'
      FixedChar = True
      Size = 2
    end
  end
  object queryAuxiliar: TFDQuery
    Connection = Connection
    Left = 104
    Top = 8
  end
end
