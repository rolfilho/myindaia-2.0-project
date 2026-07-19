object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 230
  Width = 401
  object BrokerConnection: TFDConnection
    Params.Strings = (
      'Database=BROKER'
      'Password=123'
      'User_Name=SA'
      'Server=indaia10'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 16
  end
  object QueryConsulta: TFDQuery
    Connection = BrokerConnection
    SQL.Strings = (
      'SELECT  '
      ''
      
        '/***************************************************************' +
        '*******/'
      
        '--TABELA (ZAPSEXP0001D - Atualiza'#231#227'o - Processo de Exporta'#231#227'o - ' +
        'Header)'
      
        '/***************************************************************' +
        '*******/'
      
        'RC01.CD_REFERENCIA                                              ' +
        '            AS PROCESSNUMBERID,'
      
        'P.NR_PROCESSO                                                   ' +
        '            AS PROCESSBROKERID,'
      'CASE '
      'WHEN P.CD_SERVICO='#39'6'#39' THEN TR.AP_TRANSP_ROD'
      'ELSE EMB.NM_EMBARCACAO + ISNULL('#39' - '#39' + VD.VIAGEMDOAGENTE, '#39#39')  '
      'END'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'AS VESSEL,'
      ''
      
        'Cast(ISNULL(STUFF((SELECT DISTINCT '#39'/ '#39' + LTRIM(RTRIM(R.CD_REFER' +
        'ENCIA)) '
      'FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) '
      'WHERE R.NR_PROCESSO = P.NR_PROCESSO '
      'AND R.TP_REFERENCIA = '#39'05'#39' '
      
        'FOR XML PATH('#39#39')), 1, 1, '#39#39'), '#39#39') as Varchar(MAX))'#9#9#9#9#9#9#9'AS RESE' +
        'RVE,'
      ''
      'CASE'
      
        'WHEN P.CD_SERVICO='#39'6'#39' AND P.CD_CLIENTE='#39'01597'#39' /*JACAREI*/ THEN ' +
        #39'9999905'#39
      
        'WHEN P.CD_SERVICO='#39'6'#39' AND P.CD_CLIENTE='#39'00393'#39' /*CA'#199'APAVA*/ THEN' +
        ' '#39'9999906'#39
      
        'WHEN P.CD_SERVICO='#39'6'#39' AND P.CD_CLIENTE='#39'01729'#39' /*BARRA VELHA*/ T' +
        'HEN '#39'9999907'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'9981403'#39' THEN '#39'99' +
        '99909'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'1010304'#39' THEN '#39'99' +
        '99906'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0812001'#39' THEN '#39'99' +
        '99905'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0927700'#39' THEN '#39'99' +
        '99904'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0710100'#39' THEN '#39'99' +
        '99903'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0710600'#39' THEN '#39'99' +
        '99903'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0710700'#39' THEN '#39'99' +
        '99903'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0719500'#39' THEN '#39'99' +
        '99903'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0716600'#39' THEN '#39'99' +
        '99903'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0717600'#39' THEN '#39'99' +
        '99903'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0717700'#39' THEN '#39'99' +
        '99903'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0917800'#39' THEN '#39'99' +
        '99902'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0910103'#39' THEN '#39'99' +
        '99902'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0915100'#39' THEN '#39'99' +
        '99902'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0920151'#39' THEN '#39'99' +
        '99901'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0927502'#39' THEN '#39'99' +
        '99901'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'1010500'#39' THEN '#39'10' +
        '10500'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'1017700'#39' THEN '#39'10' +
        '10500'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0925100'#39' THEN '#39'09' +
        '25100'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0927800'#39' THEN '#39'09' +
        '25100'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0817800'#39' THEN '#39'07' +
        '17600'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0110100'#39' THEN '#39'01' +
        '10100'#39
      
        'WHEN P.CD_SERVICO!='#39'6'#39' AND PE.CD_URF_DESPACHO='#39'0117600'#39' THEN '#39'01' +
        '10100'#39
      'END '#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'AS URFCLEARENCE,'
      ''
      'CASE'
      'WHEN P.CD_INCOTERM='#39'FCA'#39' THEN '#39'PROPRIO'#39
      'WHEN P.CD_SERVICO='#39'6'#39' AND P.CD_TRANSP_NAC='#39'1601'#39' THEN '#39'50000842'#39
      'WHEN P.CD_SERVICO='#39'6'#39' AND P.CD_TRANSP_NAC='#39'0521'#39' THEN '#39'50000326'#39
      'WHEN P.CD_SERVICO='#39'6'#39' AND P.CD_TRANSP_NAC='#39'1670'#39' THEN '#39'50000901'#39
      'WHEN P.CD_SERVICO='#39'6'#39' AND P.CD_TRANSP_NAC='#39'0735'#39' THEN '#39'50000686'#39
      'WHEN P.CD_SERVICO='#39'6'#39' AND P.CD_TRANSP_NAC='#39'0827'#39' THEN '#39'50000196'#39
      'WHEN P.CD_SERVICO='#39'6'#39' AND P.CD_TRANSP_NAC='#39'1512'#39' THEN '#39'50000793'#39
      'WHEN P.CD_SERVICO='#39'6'#39' AND P.CD_TRANSP_NAC='#39'0917'#39' THEN '#39'10010777'#39
      'WHEN P.CD_SERVICO!='#39'6'#39' AND P.CD_AGENTE='#39'0003'#39' THEN '#39'10012535'#39
      'WHEN P.CD_SERVICO!='#39'6'#39' AND P.CD_AGENTE='#39'0021'#39' THEN '#39'10012535'#39
      'WHEN P.CD_SERVICO!='#39'6'#39' AND P.CD_AGENTE='#39'0338'#39' THEN '#39'50000621'#39
      'WHEN P.CD_SERVICO!='#39'6'#39' AND P.CD_AGENTE='#39'0204'#39' THEN '#39'10002895'#39
      'WHEN P.CD_SERVICO!='#39'6'#39' AND P.CD_AGENTE='#39'0777'#39' THEN '#39'50000731'#39
      'END'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'AS CARRIER,'
      ''
      
        'ISNULL(CONVERT(DATE,F131.DT_REALIZACAO), NULL)   AS PLANNEDDATES' +
        'HIP,'
      'ISNULL(CONVERT(DATE,F132.DT_REALIZACAO), NULL)   AS SHIPDATE,'
      
        'ISNULL(CONVERT(DATE,F147.DT_REALIZACAO), NULL) '#9'AS PLANNEDDATELO' +
        'AD,'
      ''
      
        'P.VL_TRANSIT_TIME                                               ' +
        '            AS TRANSITTIME,'
      
        'P.NR_DDE                                                        ' +
        '            AS DDE,'
      
        'P.CD_CANAL                                                      ' +
        '            AS DDECHANNEL,'
      'ISNULL(CONVERT(DATE,P.DT_REG_DDE), NULL)         AS DDEDATE,'
      
        'ISNULL(CONVERT(DATE,F141.DT_REALIZACAO), NULL)   AS AVERBACAODAT' +
        'E,'
      
        'P.CD_DUE                                                        ' +
        '            AS DUENUMBER,'
      'ISNULL(CONVERT(DATE,F124.DT_REALIZACAO), NULL)   AS DUEDATE,'
      
        'P.CD_RUC                                                        ' +
        '            AS RUCNUMBER,'
      'ISNULL(CONVERT(DATE,F124.DT_REALIZACAO), NULL)   AS RUCDATE,'
      
        'P.CD_CHAVE_ACESSO_DUE                                           ' +
        '           AS ACCESSKEY,'
      ''
      ''
      ''
      
        '/***************************************************************' +
        '*******/'
      
        '--TABELA (ZAPSEXP0004D - Atualiza'#231#227'o - Processo de Exporta'#231#227'o - ' +
        'AWB - B/L)'
      
        '/***************************************************************' +
        '*******/'
      
        'RC01.CD_REFERENCIA                                              ' +
        '            AS PROCESSNUMBERID,'
      
        'P.NR_CONHECIMENTO                                               ' +
        '            AS MASTER,'
      
        #39#39#9#9#9#9'                                                          ' +
        '  AS HOUSE,'
      'ISNULL(CONVERT(DATE,P.DT_CONHECIMENTO), NULL)    AS ISSUEDATE,'
      'ISNULL(CONVERT(DATE,F135.DT_REALIZACAO), NULL)   AS RELEASEDATE,'
      ''
      ''
      
        '/***************************************************************' +
        '*******/'
      
        '--TABELA (ZAPSEXP0003D - Atualiza'#231#227'o - Processo de Exporta'#231#227'o - ' +
        'RE - Header)'
      
        '/***************************************************************' +
        '*******/'
      '---N'#227'o ser'#225' preenchido'
      ''
      ''
      
        '/***************************************************************' +
        '*******/'
      
        '--TABELA (ZAPSEXP0005S - Atualiza'#231#227'o - Textos do Processo de Exp' +
        'orta'#231#227'o)'
      
        '/***************************************************************' +
        '*******/'
      '---N'#227'o ser'#225' preenchido'
      ''
      ''
      ''
      
        '/***************************************************************' +
        '*******/'
      '--TABELA (ZAPSEXP0033D - Atualiza'#231#227'o - Cabe'#231'alho Ordem Venda)'
      
        '/***************************************************************' +
        '*******/'
      
        'RC01.CD_REFERENCIA                                  AS PROCESSNU' +
        'MBERID,'
      'RC01.CD_REFERENCIA'#9#9#9#9#9#9#9#9#9'AS SONUMBER,'
      ''
      '(SELECT TOP 1 LTRIM(RTRIM(R.CD_REFERENCIA)) '
      'FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) '
      'WHERE R.NR_PROCESSO = P.NR_PROCESSO '
      'AND R.TP_REFERENCIA = '#39'48'#39' )                        AS VSART,'
      ''
      ''
      
        '/***************************************************************' +
        '*******/'
      
        '--TABELA (ZAPSEXP0034D - Atualiza'#231#227'o - Cabe'#231'alho Ordem Venda - P' +
        'arceiro) '
      
        '/***************************************************************' +
        '*******/'
      '/***DIVIDI PELO TIPO QUE TEMOS QUE INFORMAR (SP E ZR)***/'
      
        '/***O QUE TIVER NULL NO CAMPO PARVW OU PARVW_1 N'#195'O PRECISA ENVIA' +
        'R***/'
      ''
      
        'RC01.CD_REFERENCIA                                      AS PROCE' +
        'SSNUMBERID,'
      'RC01.CD_REFERENCIA'#9#9#9#9#9#9#9#9#9#9'AS SONUMBER,'
      #39'SP'#39#9#9#9#9#9#9#9#9#9#9#9#9#9'AS PARVW,'
      'CASE'
      '--WHEN P.CD_INCOTERM='#39'FCA'#39' THEN '#39'PROPRIO'#39
      'WHEN P.CD_TRANSP_NAC='#39'1601'#39' THEN '#39'50000842'#39
      'WHEN P.CD_TRANSP_NAC='#39'0521'#39' THEN '#39'50000326'#39
      'WHEN P.CD_TRANSP_NAC='#39'1670'#39' THEN '#39'50000901'#39
      'WHEN P.CD_TRANSP_NAC='#39'0735'#39' THEN '#39'50000686'#39
      'WHEN P.CD_TRANSP_NAC='#39'0827'#39' THEN '#39'50000196'#39
      'WHEN P.CD_TRANSP_NAC='#39'1512'#39' THEN '#39'50000793'#39
      'WHEN P.CD_TRANSP_NAC='#39'0917'#39' THEN '#39'10010777'#39
      'END'#9#9#9#9#9#9#9#9#9#9#9#9#9#9'AS KUNDE_D,'
      ''
      #39'ZR'#39#9#9#9#9#9#9#9#9#9#9#9#9#9'AS PARVW_1,'
      'CASE'
      '--WHEN P.CD_INCOTERM='#39'FCA'#39' THEN '#39'PROPRIO'#39
      'WHEN P.CD_SERVICO='#39'6'#39' THEN NULL'
      'WHEN P.CD_SERVICO!='#39'6'#39' AND P.CD_AGENTE='#39'0003'#39' THEN '#39'10012535'#39
      'WHEN P.CD_SERVICO!='#39'6'#39' AND P.CD_AGENTE='#39'0021'#39' THEN '#39'10012535'#39
      'WHEN P.CD_SERVICO!='#39'6'#39' AND P.CD_AGENTE='#39'0338'#39' THEN '#39'50000621'#39
      'WHEN P.CD_SERVICO!='#39'6'#39' AND P.CD_AGENTE='#39'0204'#39' THEN '#39'10002895'#39
      'WHEN P.CD_SERVICO!='#39'6'#39' AND P.CD_AGENTE='#39'0777'#39' THEN '#39'50000731'#39
      'END'#9#9#9#9#9#9#9#9#9#9#9#9#9#9'AS KUNDE_D_1'
      ''
      ' '#9'                             '
      '                      '
      'FROM       BROKER.DBO.TPROCESSO        P    (NOLOCK)'
      ''
      
        'LEFT  JOIN BROKER.DBO.TTRANSP_ROD'#9'   TR   (NOLOCK) ON TR.CD_TRAN' +
        'SP_ROD = P.CD_TRANSP_NAC'
      
        'INNER JOIN BROKER.DBO.TREF_CLIENTE     RC01 (NOLOCK) ON RC01.NR_' +
        'PROCESSO = P.NR_PROCESSO AND RC01.TP_REFERENCIA = '#39'01'#39
      
        'INNER JOIN BROKER.DBO.TREF_CLIENTE     RC05 (NOLOCK) ON RC05.NR_' +
        'PROCESSO = P.NR_PROCESSO AND RC05.TP_REFERENCIA = '#39'05'#39
      
        'LEFT  JOIN BROKER.DBO.TPROCESSO_EXP    PE   (NOLOCK) ON PE.NR_PR' +
        'OCESSO   = P.NR_PROCESSO'
      
        'LEFT  JOIN BROKER.DBO.TFOLLOWUP        F131 (NOLOCK) ON F131.NR_' +
        'PROCESSO = P.NR_PROCESSO AND F131.CD_EVENTO = '#39'131'#39'             ' +
        '                         '
      
        'LEFT  JOIN BROKER.DBO.TFOLLOWUP        F132 (NOLOCK) ON F132.NR_' +
        'PROCESSO = P.NR_PROCESSO AND F132.CD_EVENTO = '#39'132'#39'             ' +
        '                         '
      
        'LEFT  JOIN BROKER.DBO.TFOLLOWUP        F135 (NOLOCK) ON F135.NR_' +
        'PROCESSO = P.NR_PROCESSO AND F135.CD_EVENTO = '#39'135'#39
      
        'LEFT  JOIN BROKER.DBO.TFOLLOWUP        F141 (NOLOCK) ON F141.NR_' +
        'PROCESSO = P.NR_PROCESSO AND F141.CD_EVENTO = '#39'141'#39
      
        'LEFT  JOIN BROKER.DBO.TFOLLOWUP        F147 (NOLOCK) ON F147.NR_' +
        'PROCESSO = P.NR_PROCESSO AND F147.CD_EVENTO = '#39'147'#39
      
        'LEFT  JOIN BROKER.DBO.TFOLLOWUP        F124 (NOLOCK) ON F124.NR_' +
        'PROCESSO = P.NR_PROCESSO AND F124.CD_EVENTO = '#39'124'#39
      
        'LEFT  JOIN BROKER.DBO.TEMBARCACAO      EMB  (NOLOCK) ON EMB.CD_E' +
        'MBARCACAO = P.CD_EMBARCACAO'
      
        'LEFT  JOIN BROKER.DBO.TVIAGEM_DEADLINE VD   (NOLOCK) ON VD.CD_UN' +
        'ID_NEG    = P.CD_UNID_NEG '
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'AND VD.CD_PRODUTO = P.CD_PRODUTO '
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'AND VD.CD_EMBARCACAO = P.CD_EMBARCACAO'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'AND VD.NR_VIAGEM  = P.NR_VIAGEM'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'AND VD.CD_AGENTE  = P.CD_AGENTE    '
      ''
      'WHERE P.CD_GRUPO   = '#39'241'#39
      'AND P.CD_PRODUTO = '#39'02'#39
      
        'AND ( ( F141.DT_REALIZACAO IS NULL AND F141.IN_APLICAVEL='#39'1'#39' ) O' +
        'R (F141.DT_REALIZACAO IS NOT NULL  AND F141.DT_REALIZACAO >= DAT' +
        'EADD(DAY, -5, CONVERT(DATE, GETDATE()))) )'
      'AND P.IN_CANCELADO = 0'
      ''
      
        '  GROUP BY RC01.CD_REFERENCIA, P.NR_PROCESSO, EMB.NM_EMBARCACAO,' +
        ' VD.VIAGEMDOAGENTE, F131.DT_REALIZACAO, F124.DT_REALIZACAO'
      
        '  ,F147.DT_REALIZACAO, F141.DT_REALIZACAO, F135.DT_REALIZACAO, F' +
        '132.DT_REALIZACAO, P.VL_TRANSIT_TIME, P.NR_DDE, P.CD_CANAL'
      
        '  , P.DT_REG_DDE, P.CD_DUE, P.CD_RUC, P.CD_CHAVE_ACESSO_DUE, P.N' +
        'R_CONHECIMENTO, P.DT_CONHECIMENTO, P.CD_SERVICO, TR.NM_TRANSP_RO' +
        'D'
      
        '  , P.CD_CLIENTE, PE.CD_URF_DESPACHO, P.CD_INCOTERM, P.CD_TRANSP' +
        '_NAC, P.CD_AGENTE, TR.AP_TRANSP_ROD'
      ''
      'ORDER BY P.NR_PROCESSO')
    Left = 48
    Top = 104
    object QueryConsultaPROCESSNUMBERID: TStringField
      FieldName = 'PROCESSNUMBERID'
      Origin = 'PROCESSNUMBERID'
      Required = True
      FixedChar = True
      Size = 30
    end
    object QueryConsultaPROCESSBROKERID: TStringField
      FieldName = 'PROCESSBROKERID'
      Origin = 'PROCESSBROKERID'
      Required = True
      FixedChar = True
      Size = 18
    end
    object QueryConsultaVESSEL: TStringField
      FieldName = 'VESSEL'
      Origin = 'VESSEL'
      ReadOnly = True
      Size = 73
    end
    object QueryConsultaRESERVE: TMemoField
      FieldName = 'RESERVE'
      Origin = 'RESERVE'
      ReadOnly = True
      BlobType = ftMemo
      Size = 2147483647
    end
    object QueryConsultaURFCLEARENCE: TStringField
      FieldName = 'URFCLEARENCE'
      Origin = 'URFCLEARENCE'
      ReadOnly = True
      Size = 7
    end
    object QueryConsultaCARRIER: TStringField
      FieldName = 'CARRIER'
      Origin = 'CARRIER'
      ReadOnly = True
      Size = 8
    end
    object QueryConsultaPLANNEDDATESHIP: TDateField
      FieldName = 'PLANNEDDATESHIP'
      Origin = 'PLANNEDDATESHIP'
      ReadOnly = True
    end
    object QueryConsultaSHIPDATE: TDateField
      FieldName = 'SHIPDATE'
      Origin = 'SHIPDATE'
      ReadOnly = True
    end
    object QueryConsultaPLANNEDDATELOAD: TDateField
      FieldName = 'PLANNEDDATELOAD'
      Origin = 'PLANNEDDATELOAD'
      ReadOnly = True
    end
    object QueryConsultaTRANSITTIME: TIntegerField
      FieldName = 'TRANSITTIME'
      Origin = 'TRANSITTIME'
    end
    object QueryConsultaDDE: TStringField
      FieldName = 'DDE'
      Origin = 'DDE'
      FixedChar = True
      Size = 11
    end
    object QueryConsultaDDECHANNEL: TStringField
      FieldName = 'DDECHANNEL'
      Origin = 'DDECHANNEL'
      FixedChar = True
      Size = 1
    end
    object QueryConsultaDDEDATE: TDateField
      FieldName = 'DDEDATE'
      Origin = 'DDEDATE'
      ReadOnly = True
    end
    object QueryConsultaAVERBACAODATE: TDateField
      FieldName = 'AVERBACAODATE'
      Origin = 'AVERBACAODATE'
      ReadOnly = True
    end
    object QueryConsultaDUENUMBER: TStringField
      FieldName = 'DUENUMBER'
      Origin = 'DUENUMBER'
      Size = 14
    end
    object QueryConsultaDUEDATE: TDateField
      FieldName = 'DUEDATE'
      Origin = 'DUEDATE'
      ReadOnly = True
    end
    object QueryConsultaRUCNUMBER: TStringField
      FieldName = 'RUCNUMBER'
      Origin = 'RUCNUMBER'
      Size = 35
    end
    object QueryConsultaRUCDATE: TDateField
      FieldName = 'RUCDATE'
      Origin = 'RUCDATE'
      ReadOnly = True
    end
    object QueryConsultaACCESSKEY: TStringField
      FieldName = 'ACCESSKEY'
      Origin = 'ACCESSKEY'
    end
    object QueryConsultaPROCESSNUMBERID_1: TStringField
      FieldName = 'PROCESSNUMBERID_1'
      Origin = 'PROCESSNUMBERID'
      Required = True
      FixedChar = True
      Size = 30
    end
    object QueryConsultaMASTER: TStringField
      FieldName = 'MASTER'
      Origin = 'MASTER'
      FixedChar = True
      Size = 30
    end
    object QueryConsultaHOUSE: TStringField
      FieldName = 'HOUSE'
      Origin = 'HOUSE'
      ReadOnly = True
      Required = True
      Size = 1
    end
    object QueryConsultaISSUEDATE: TDateField
      FieldName = 'ISSUEDATE'
      Origin = 'ISSUEDATE'
      ReadOnly = True
    end
    object QueryConsultaRELEASEDATE: TDateField
      FieldName = 'RELEASEDATE'
      Origin = 'RELEASEDATE'
      ReadOnly = True
    end
    object QueryConsultaPROCESSNUMBERID_2: TStringField
      FieldName = 'PROCESSNUMBERID_2'
      Origin = 'PROCESSNUMBERID'
      Required = True
      FixedChar = True
      Size = 30
    end
    object QueryConsultaSONUMBER: TStringField
      FieldName = 'SONUMBER'
      Origin = 'SONUMBER'
      Required = True
      FixedChar = True
      Size = 30
    end
    object QueryConsultaVSART: TStringField
      FieldName = 'VSART'
      Origin = 'VSART'
      ReadOnly = True
      Size = 30
    end
    object QueryConsultaPROCESSNUMBERID_3: TStringField
      FieldName = 'PROCESSNUMBERID_3'
      Origin = 'PROCESSNUMBERID'
      Required = True
      FixedChar = True
      Size = 30
    end
    object QueryConsultaSONUMBER_1: TStringField
      FieldName = 'SONUMBER_1'
      Origin = 'SONUMBER'
      Required = True
      FixedChar = True
      Size = 30
    end
    object QueryConsultaPARVW: TStringField
      FieldName = 'PARVW'
      Origin = 'PARVW'
      ReadOnly = True
      Required = True
      Size = 2
    end
    object QueryConsultaKUNDE_D: TStringField
      FieldName = 'KUNDE_D'
      Origin = 'KUNDE_D'
      ReadOnly = True
      Size = 8
    end
    object QueryConsultaPARVW_1: TStringField
      FieldName = 'PARVW_1'
      Origin = 'PARVW_1'
      ReadOnly = True
      Required = True
      Size = 2
    end
    object QueryConsultaKUNDE_D_1: TStringField
      FieldName = 'KUNDE_D_1'
      Origin = 'KUNDE_D_1'
      ReadOnly = True
      Size = 8
    end
  end
  object FDQuery1: TFDQuery
    Connection = BrokerConnection
    Left = 208
    Top = 88
  end
end
