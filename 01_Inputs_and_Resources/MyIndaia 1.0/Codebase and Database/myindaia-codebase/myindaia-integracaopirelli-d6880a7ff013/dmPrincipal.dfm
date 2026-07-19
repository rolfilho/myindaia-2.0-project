object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 398
  Width = 306
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=BROKER'
      'User_Name=sa'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    Connected = True
    LoginPrompt = False
    Left = 39
    Top = 22
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 152
    Top = 24
  end
  object qryArquivosProcessos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'DISTINCT'
      'TP.NR_PROCESSO,'
      
        'CASE WHEN TP.CD_SERVICO !='#39'6'#39' THEN EV135.DT_REALIZACAO ELSE EV76' +
        '3.DT_REALIZACAO END AS DT_REALIZACAO'
      ','
      'DOC.NM_ARQUIVO'
      ','
      'CASE '
      'WHEN DOC.NM_ARQUIVO = '#39'CE01.PDF'#39' '
      'THEN '
      '  (CASE WHEN TP.CD_SERVICO !='#39'6'#39' THEN '#39'BL_'#39'  ELSE '#39'CRT_'#39' END )'
      
        '  + (SELECT TOP 1 RTRIM(FAT.NR_DCTO_INSTRUCAO) FROM BROKER.DBO.T' +
        'DOCUMENTO_INSTRUCAO FAT WHERE FAT.NR_PROCESSO = TP.NR_PROCESSO A' +
        'ND FAT.CD_TIPO_DCTO_INSTR='#39'01'#39')'
      ' + '#39'.pdf'#39
      'ELSE '
      '  (CASE WHEN TP.CD_SERVICO !='#39'6'#39' THEN '#39'BL_'#39'  ELSE '#39'CRT_'#39' END )'
      
        '  + (SELECT TOP 1 RTRIM(FAT.NR_DCTO_INSTRUCAO) FROM BROKER.DBO.T' +
        'DOCUMENTO_INSTRUCAO FAT WHERE FAT.NR_PROCESSO = TP.NR_PROCESSO A' +
        'ND FAT.CD_TIPO_DCTO_INSTR='#39'01'#39') + '#39'_'#39'+ SUBSTRING(DOC.NM_ARQUIVO,' +
        '3,2) + '#39'.pdf'#39
      'END'
      ' '
      'AS NOME_ARQUIVO_DESTINO'
      ''
      'FROM BROKER.DBO.TPROCESSO TP (nolock)'
      ''
      
        'LEFT JOIN BROKER.DBO.TFOLLOWUP EV135 (nolock) ON TP.NR_PROCESSO ' +
        '= EV135.NR_PROCESSO AND EV135.CD_EVENTO='#39'135'#39
      
        'LEFT JOIN BROKER.DBO.TFOLLOWUP EV763 (nolock) ON TP.NR_PROCESSO ' +
        '= EV763.NR_PROCESSO AND EV763.CD_EVENTO='#39'763'#39
      
        'LEFT JOIN BROKER.DBO.TPROCESSO_DOCTOS DOC (nolock) ON DOC.NR_PRO' +
        'CESSO = TP.NR_PROCESSO AND DOC.CD_TIPO_DOCTO = '#39'70'#39
      ''
      'WHERE TP.CD_PRODUTO = '#39'02'#39
      'AND TP.CD_GRUPO = '#39'C22'#39
      'AND ('
      
        '( TP.CD_SERVICO!='#39'6'#39' AND EV135.DT_REALIZACAO IS NOT NULL AND EV1' +
        '35.IN_EDI_ENVIADO IS NULL AND EV135.IN_APLICAVEL='#39'1'#39' )'
      'OR'
      
        '( TP.CD_SERVICO='#39'6'#39' AND EV763.DT_REALIZACAO IS NOT NULL AND EV76' +
        '3.IN_EDI_ENVIADO IS NULL AND EV763.IN_APLICAVEL='#39'1'#39' AND CONVERT(' +
        'DATE,EV763.DT_REALIZACAO) > '#39'2022-08-01'#39' )'
      ')'
      'AND TP.NR_PROCESSO = :NR_PROCESSO')
    Left = 184
    Top = 87
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = Null
      end>
    object qryArquivosProcessosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryArquivosProcessosDT_REALIZACAO: TSQLTimeStampField
      FieldName = 'DT_REALIZACAO'
      Origin = 'DT_REALIZACAO'
    end
    object qryArquivosProcessosNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Origin = 'NM_ARQUIVO'
      FixedChar = True
      Size = 15
    end
    object qryArquivosProcessosNOME_ARQUIVO_DESTINO: TStringField
      FieldName = 'NOME_ARQUIVO_DESTINO'
      Origin = 'NOME_ARQUIVO_DESTINO'
      ReadOnly = True
      Size = 31
    end
  end
  object qryFilaProcessos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'DISTINCT'
      'TP.NR_PROCESSO'
      'FROM BROKER.DBO.TPROCESSO TP (nolock)'
      
        'LEFT JOIN BROKER.DBO.TFOLLOWUP EV135 (nolock) ON TP.NR_PROCESSO ' +
        '= EV135.NR_PROCESSO AND EV135.CD_EVENTO='#39'135'#39
      
        'LEFT JOIN BROKER.DBO.TFOLLOWUP EV763 (nolock) ON TP.NR_PROCESSO ' +
        '= EV763.NR_PROCESSO AND EV763.CD_EVENTO='#39'763'#39
      'WHERE TP.CD_PRODUTO = '#39'02'#39
      'AND TP.CD_GRUPO = '#39'C22'#39
      'AND ('
      
        '( TP.CD_SERVICO!='#39'6'#39' AND EV135.DT_REALIZACAO IS NOT NULL AND EV1' +
        '35.IN_EDI_ENVIADO IS NULL AND EV135.IN_APLICAVEL='#39'1'#39' )'
      'OR'
      
        '( TP.CD_SERVICO='#39'6'#39' AND EV763.DT_REALIZACAO IS NOT NULL AND EV76' +
        '3.IN_EDI_ENVIADO IS NULL AND EV763.IN_APLICAVEL='#39'1'#39' AND CONVERT(' +
        'DATE,EV763.DT_REALIZACAO) > '#39'2022-08-23'#39' )'
      ')')
    Left = 50
    Top = 88
    object qryFilaProcessosNR_PROCESSO: TStringField
      DisplayLabel = 'N'#250'mero Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
  end
  object qryFilaArqFaturamentoExpo: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'TP.NR_PROCESSO'
      ',B.CREATED'
      ',DOC.NM_ARQUIVO'
      
        ',(SELECT TOP 1 RTRIM(FAT.NR_DCTO_INSTRUCAO) FROM BROKER.DBO.TDOC' +
        'UMENTO_INSTRUCAO FAT WHERE FAT.NR_PROCESSO = TP.NR_PROCESSO AND ' +
        'FAT.CD_TIPO_DCTO_INSTR='#39'01'#39')+ '#39'_Faturamento_'#39'+ DOC.NM_ARQUIVO AS' +
        ' NOME_ARQUIVO_DESTINO'
      ',DOC_ENV.DT_ENVIO_CLIENTE'
      'FROM BROKER.DBO.TPROCESSO TP (NOLOCK)'
      
        '--LEFT JOIN BROKER.DBO.TFOLLOWUP EV092 (NOLOCK) ON TP.NR_PROCESS' +
        'O = EV092.NR_PROCESSO AND EV092.CD_EVENTO='#39'092'#39
      
        'INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.CUST' +
        'OMID = TP.NR_PROCESSO'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED II (NOLOCK) ON II.CUSTOMC' +
        'LEARANCE_ID = CC.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) ON I' +
        'I.ID = BII.ITENSINVOICED_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING B (NOLOCK) ON B.ID = BII.BILLI' +
        'NG_ID'
      
        'INNER JOIN BROKER.DBO.TPROCESSO_DOCTOS DOC (NOLOCK) ON DOC.NR_PR' +
        'OCESSO = TP.NR_PROCESSO AND DOC.CD_TIPO_DOCTO IN ('#39'63'#39','#39'155'#39') AN' +
        'D '
      
        '                                                     ( DOC.NM_AR' +
        'QUIVO IN ( (CASE WHEN B.TYPE = '#39'TAX_RECEIPT'#39' THEN '
      
        '                                                                ' +
        '                 ('#39'FT'#39' + CONVERT(VARCHAR(MAX),B.ID) + '#39'.PDF'#39') EL' +
        'SE  '
      
        '                                                                ' +
        '                 ('#39'NF'#39' + CONVERT(VARCHAR(MAX),B.NR_NOTA) + '#39'99'#39' ' +
        '+ '#39'.PDF'#39') '
      
        '                                                                ' +
        '            END ) '
      
        '                                                                ' +
        '          ) '
      
        '                                                         OR DOC.' +
        'NM_ARQUIVO IN ('#39'RPS'#39' + CONVERT(VARCHAR(MAX),B.ID) + '#39'.PDF'#39') '
      '                                                      )'
      
        'LEFT JOIN BROKER.DBO.TPROCESSO_DOCTOS_ENVIADOS DOC_ENV ON DOC_EN' +
        'V.NR_PROCESSO = TP.NR_PROCESSO AND DOC_ENV.NM_ARQUIVO = DOC.NM_A' +
        'RQUIVO'
      'WHERE'
      'TP.CD_PRODUTO = '#39'02'#39
      'AND TP.IN_CANCELADO='#39'0'#39
      'AND TP.CD_GRUPO = '#39'C22'#39
      'AND TP.CD_SERVICO NOT IN ('#39'7'#39','#39'13'#39','#39'43'#39')'
      'AND DOC_ENV.DT_ENVIO_CLIENTE IS NULL'
      
        'AND ( B.CREATED < GETDATE() AND B.CREATED > CAST('#39'2021-12-01'#39' AS' +
        ' DATE))'
      ''
      ''
      ''
      ''
      'UNION ALL'
      ''
      ''
      ''
      'SELECT'
      'TP.NR_PROCESSO'
      ',B.CREATED'
      ',DOC.NM_ARQUIVO'
      
        ',(SELECT TOP 1 RTRIM(FAT.NR_DCTO_INSTRUCAO) FROM BROKER.DBO.TDOC' +
        'UMENTO_INSTRUCAO FAT WHERE FAT.NR_PROCESSO = TP.NR_PROCESSO AND ' +
        'FAT.CD_TIPO_DCTO_INSTR='#39'01'#39')+ '#39'_Recibo_'#39'+ DOC.NM_ARQUIVO AS NOME' +
        '_ARQUIVO_DESTINO'
      ',DOC_ENV.DT_ENVIO_CLIENTE'
      'FROM BROKER.DBO.TPROCESSO TP (NOLOCK)'
      
        '--LEFT JOIN BROKER.DBO.TFOLLOWUP EV092 (NOLOCK) ON TP.NR_PROCESS' +
        'O = EV092.NR_PROCESSO AND EV092.CD_EVENTO='#39'092'#39
      
        'INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.CUST' +
        'OMID = TP.NR_PROCESSO'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED II (NOLOCK) ON II.CUSTOMC' +
        'LEARANCE_ID = CC.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) ON I' +
        'I.ID = BII.ITENSINVOICED_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING B (NOLOCK) ON B.ID = BII.BILLI' +
        'NG_ID'
      
        'INNER JOIN BROKER.DBO.TPROCESSO_DOCTOS DOC (NOLOCK) ON DOC.NR_PR' +
        'OCESSO = TP.NR_PROCESSO AND DOC.CD_TIPO_DOCTO IN ('#39'25'#39')'
      
        'LEFT JOIN BROKER.DBO.TPROCESSO_DOCTOS_ENVIADOS DOC_ENV ON DOC_EN' +
        'V.NR_PROCESSO = TP.NR_PROCESSO AND DOC_ENV.NM_ARQUIVO = DOC.NM_A' +
        'RQUIVO'
      'WHERE'
      'TP.CD_PRODUTO = '#39'02'#39
      'AND TP.IN_CANCELADO='#39'0'#39
      'AND TP.CD_GRUPO = '#39'C22'#39
      'AND TP.CD_SERVICO NOT IN ('#39'7'#39','#39'13'#39','#39'43'#39')'
      'AND B.TYPE='#39'TAX_RECEIPT'#39
      'AND DOC_ENV.DT_ENVIO_CLIENTE IS NULL'
      
        'AND ( B.CREATED < GETDATE() AND B.CREATED > CAST('#39'2021-12-01'#39' AS' +
        ' DATE))')
    Left = 74
    Top = 259
    object qryFilaArqFaturamentoExpoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryFilaArqFaturamentoExpoCREATED: TSQLTimeStampField
      FieldName = 'CREATED'
      Origin = 'CREATED'
    end
    object qryFilaArqFaturamentoExpoNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Origin = 'NM_ARQUIVO'
      Required = True
      FixedChar = True
      Size = 15
    end
    object qryFilaArqFaturamentoExpoNOME_ARQUIVO_DESTINO: TStringField
      FieldName = 'NOME_ARQUIVO_DESTINO'
      Origin = 'NOME_ARQUIVO_DESTINO'
      ReadOnly = True
      Size = 51
    end
    object qryFilaArqFaturamentoExpoDT_ENVIO_CLIENTE: TSQLTimeStampField
      FieldName = 'DT_ENVIO_CLIENTE'
      Origin = 'DT_ENVIO_CLIENTE'
    end
  end
  object qryUpdateDoc: TFDQuery
    Connection = FDConnection1
    Left = 194
    Top = 259
  end
  object qryFilaArqFaturamentoImpo: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'TP.NR_PROCESSO'
      ',B.CREATED'
      ',DOC.NM_ARQUIVO'
      
        ',(SELECT TOP 1 RTRIM(RC.CD_REFERENCIA) FROM BROKER.DBO.TREF_CLIE' +
        'NTE RC WHERE RC.NR_PROCESSO = TP.NR_PROCESSO AND RC.TP_REFERENCI' +
        'A='#39'01'#39')+ '#39'_Faturamento_'#39'+ DOC.NM_ARQUIVO AS NOME_ARQUIVO_DESTINO'
      ',DOC_ENV.DT_ENVIO_CLIENTE'
      'FROM BROKER.DBO.TPROCESSO TP (NOLOCK)'
      
        '--LEFT JOIN BROKER.DBO.TFOLLOWUP EV092 (NOLOCK) ON TP.NR_PROCESS' +
        'O = EV092.NR_PROCESSO AND EV092.CD_EVENTO='#39'092'#39
      
        'INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.CUST' +
        'OMID = TP.NR_PROCESSO'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED II (NOLOCK) ON II.CUSTOMC' +
        'LEARANCE_ID = CC.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) ON I' +
        'I.ID = BII.ITENSINVOICED_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING B (NOLOCK) ON B.ID = BII.BILLI' +
        'NG_ID'
      
        'INNER JOIN BROKER.DBO.TPROCESSO_DOCTOS DOC (NOLOCK) ON DOC.NR_PR' +
        'OCESSO = TP.NR_PROCESSO AND '
      
        '                                                       DOC.CD_TI' +
        'PO_DOCTO IN ('#39'63'#39','#39'155'#39') AND '
      
        '                                                       ( DOC.NM_' +
        'ARQUIVO IN ( (CASE WHEN B.TYPE = '#39'TAX_RECEIPT'#39' THEN '
      
        '                                                                ' +
        '                 ('#39'FT'#39' + CONVERT(VARCHAR(MAX),B.ID) + '#39'.PDF'#39') EL' +
        'SE '
      
        '                                                                ' +
        '                 ('#39'NF'#39' + CONVERT(VARCHAR(MAX),B.NR_NOTA) + '#39'99'#39' ' +
        '+ '#39'.PDF'#39') '
      
        '                                                                ' +
        '               END ) '
      
        '                                                                ' +
        '             ) OR DOC.NM_ARQUIVO IN ('#39'RPS'#39' + CONVERT(VARCHAR(MAX' +
        '),B.ID) + '#39'.PDF'#39') '
      '                                                        )'
      
        'LEFT JOIN BROKER.DBO.TPROCESSO_DOCTOS_ENVIADOS DOC_ENV ON DOC_EN' +
        'V.NR_PROCESSO = TP.NR_PROCESSO AND DOC_ENV.NM_ARQUIVO = DOC.NM_A' +
        'RQUIVO'
      'WHERE'
      'TP.CD_PRODUTO = '#39'01'#39
      'AND TP.IN_CANCELADO='#39'0'#39
      'AND TP.CD_GRUPO = '#39'C22'#39
      'AND DOC_ENV.DT_ENVIO_CLIENTE IS NULL'
      
        'AND ( B.CREATED < GETDATE() AND B.CREATED > CAST('#39'2023-12-01'#39' AS' +
        ' DATE))'
      ''
      ''
      ''
      'UNION ALL'
      ''
      ''
      'SELECT'
      'TP.NR_PROCESSO'
      ',B.CREATED'
      ',DOC.NM_ARQUIVO'
      
        ',(SELECT TOP 1 RTRIM(RC.CD_REFERENCIA) FROM BROKER.DBO.TREF_CLIE' +
        'NTE RC WHERE RC.NR_PROCESSO = TP.NR_PROCESSO AND RC.TP_REFERENCI' +
        'A='#39'01'#39')+ '#39'_Recibo_'#39'+ DOC.NM_ARQUIVO AS NOME_ARQUIVO_DESTINO'
      ',DOC_ENV.DT_ENVIO_CLIENTE'
      'FROM BROKER.DBO.TPROCESSO TP (NOLOCK)'
      
        '--LEFT JOIN BROKER.DBO.TFOLLOWUP EV092 (NOLOCK) ON TP.NR_PROCESS' +
        'O = EV092.NR_PROCESSO AND EV092.CD_EVENTO='#39'092'#39
      
        'INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.CUST' +
        'OMID = TP.NR_PROCESSO'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED II (NOLOCK) ON II.CUSTOMC' +
        'LEARANCE_ID = CC.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) ON I' +
        'I.ID = BII.ITENSINVOICED_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING B (NOLOCK) ON B.ID = BII.BILLI' +
        'NG_ID'
      
        'INNER JOIN BROKER.DBO.TPROCESSO_DOCTOS DOC (NOLOCK) ON DOC.NR_PR' +
        'OCESSO = TP.NR_PROCESSO AND '
      
        '                                                       DOC.CD_TI' +
        'PO_DOCTO IN ('#39'25'#39') '
      
        'LEFT JOIN BROKER.DBO.TPROCESSO_DOCTOS_ENVIADOS DOC_ENV ON DOC_EN' +
        'V.NR_PROCESSO = TP.NR_PROCESSO AND DOC_ENV.NM_ARQUIVO = DOC.NM_A' +
        'RQUIVO'
      'WHERE'
      'TP.CD_PRODUTO = '#39'01'#39
      'AND TP.IN_CANCELADO='#39'0'#39
      'AND TP.CD_GRUPO = '#39'C22'#39
      'AND B.TYPE='#39'TAX_RECEIPT'#39
      'AND DOC_ENV.DT_ENVIO_CLIENTE IS NULL'
      
        'AND ( B.CREATED < GETDATE() AND B.CREATED > CAST('#39'2023-12-01'#39' AS' +
        ' DATE))')
    Left = 66
    Top = 339
    object qryFilaArqFaturamentoImpoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryFilaArqFaturamentoImpoCREATED: TSQLTimeStampField
      FieldName = 'CREATED'
      Origin = 'CREATED'
    end
    object qryFilaArqFaturamentoImpoNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Origin = 'NM_ARQUIVO'
      Required = True
      FixedChar = True
      Size = 15
    end
    object qryFilaArqFaturamentoImpoNOME_ARQUIVO_DESTINO: TStringField
      FieldName = 'NOME_ARQUIVO_DESTINO'
      Origin = 'NOME_ARQUIVO_DESTINO'
      ReadOnly = True
      Size = 56
    end
    object qryFilaArqFaturamentoImpoDT_ENVIO_CLIENTE: TSQLTimeStampField
      FieldName = 'DT_ENVIO_CLIENTE'
      Origin = 'DT_ENVIO_CLIENTE'
    end
  end
  object qryAtualizaEvento: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'UPDATE TFOLLOWUP SET IN_EDI_ENVIADO = 1'
      'WHERE NR_PROCESSO = :NR_PROCESSO '
      'AND CD_EVENTO = :EVENTO')
    Left = 200
    Top = 346
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        Name = 'EVENTO'
        ParamType = ptInput
      end>
  end
  object qryFilaProcessosEv141: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'DISTINCT'
      'EV141.DT_REALIZACAO,'
      'EV141.IN_EDI_ENVIADO ,'
      'TP.NR_PROCESSO'
      'FROM BROKER.DBO.TPROCESSO TP (nolock)'
      
        'LEFT JOIN BROKER.DBO.TFOLLOWUP EV141 (nolock) ON TP.NR_PROCESSO ' +
        '= EV141.NR_PROCESSO AND EV141.CD_EVENTO='#39'141'#39
      
        'LEFT JOIN BROKER.DBO.TPROCESSO_DOCTOS DOC (nolock) ON DOC.NR_PRO' +
        'CESSO = TP.NR_PROCESSO AND DOC.CD_TIPO_DOCTO = '#39'21'#39' AND DOC.CD_T' +
        'IPO_DOCTO = '#39'164'#39
      'WHERE TP.CD_PRODUTO = '#39'02'#39
      'AND TP.CD_GRUPO = '#39'C22'#39
      'AND EV141.IN_APLICAVEL='#39'1'#39
      'AND EV141.IN_EDI_ENVIADO IS NULL '
      'AND EV141.DT_REALIZACAO IS NOT NULL '
      'AND EV141.DT_REALIZACAO < GETDATE() '
      'AND EV141.DT_REALIZACAO > CAST('#39'2024-01-23'#39' AS DATETIME)')
    Left = 50
    Top = 152
    object StringField1: TStringField
      DisplayLabel = 'N'#250'mero Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
  end
  object qryArquivosProcessosEv141: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'DISTINCT'
      'DOC.CD_TIPO_DOCTO,'
      'TP.NR_PROCESSO,'
      
        'CASE WHEN TP.CD_SERVICO !='#39'6'#39' THEN EV141.DT_REALIZACAO ELSE EV14' +
        '1.DT_REALIZACAO END AS DT_REALIZACAO,'
      'DOC.NM_ARQUIVO,'
      '(CASE '
      '   WHEN SUBSTRING(DOC.NM_ARQUIVO, 1, 2) = '#39'CO'#39'  THEN'
      #9'  SUBSTRING(DOC.NM_ARQUIVO, 1, 2) '
      
        #9'    + '#39'_'#39' + (SELECT TOP 1 RTRIM(FAT.NR_DCTO_INSTRUCAO) FROM BRO' +
        'KER.DBO.TDOCUMENTO_INSTRUCAO FAT WHERE FAT.NR_PROCESSO = TP.NR_P' +
        'ROCESSO AND FAT.CD_TIPO_DCTO_INSTR='#39'01'#39') + '#39'_'#39'+ '
      #9#9'+ SUBSTRING(DOC.NM_ARQUIVO, 3, LEN(DOC.NM_ARQUIVO))'
      '   WHEN SUBSTRING(DOC.NM_ARQUIVO, 1, 3) = '#39'DUE'#39' THEN'
      '      SUBSTRING(DOC.NM_ARQUIVO, 1, 3) '
      
        #9'    + '#39'_'#39' + (SELECT TOP 1 RTRIM(FAT.NR_DCTO_INSTRUCAO) FROM BRO' +
        'KER.DBO.TDOCUMENTO_INSTRUCAO FAT WHERE FAT.NR_PROCESSO = TP.NR_P' +
        'ROCESSO AND FAT.CD_TIPO_DCTO_INSTR='#39'01'#39') + '#39'_'#39'+ '
      '        + SUBSTRING(DOC.NM_ARQUIVO, 4, LEN(DOC.NM_ARQUIVO))'
      'ELSE'
      '  DOC.NM_ARQUIVO'
      'END)'
      'AS NOME_ARQUIVO_DESTINO'
      'FROM BROKER.DBO.TPROCESSO TP (nolock)'
      
        'LEFT JOIN BROKER.DBO.TFOLLOWUP EV141 (nolock) ON TP.NR_PROCESSO ' +
        '= EV141.NR_PROCESSO AND EV141.CD_EVENTO='#39'141'#39
      
        'LEFT JOIN BROKER.DBO.TPROCESSO_DOCTOS DOC (nolock) ON DOC.NR_PRO' +
        'CESSO = TP.NR_PROCESSO AND (DOC.CD_TIPO_DOCTO = '#39'21'#39' OR DOC.CD_T' +
        'IPO_DOCTO = '#39'164'#39')'
      'WHERE TP.CD_PRODUTO = '#39'02'#39
      'AND TP.CD_GRUPO = '#39'C22'#39
      'AND EV141.IN_APLICAVEL='#39'1'#39
      'AND EV141.IN_EDI_ENVIADO IS NULL '
      'AND EV141.DT_REALIZACAO IS NOT NULL '
      'AND EV141.DT_REALIZACAO < GETDATE() '
      'AND EV141.DT_REALIZACAO > CAST('#39'2024-01-20'#39' AS DATETIME)'
      'AND TP.NR_PROCESSO = :NR_PROCESSO')
    Left = 184
    Top = 151
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Value = '0102ER-000186-24'
      end>
    object qryArquivosProcessosEv141CD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
      Origin = 'CD_TIPO_DOCTO'
    end
    object qryArquivosProcessosEv141NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryArquivosProcessosEv141DT_REALIZACAO: TSQLTimeStampField
      FieldName = 'DT_REALIZACAO'
      Origin = 'DT_REALIZACAO'
      ReadOnly = True
    end
    object qryArquivosProcessosEv141NM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Origin = 'NM_ARQUIVO'
      FixedChar = True
      Size = 15
    end
    object qryArquivosProcessosEv141NOME_ARQUIVO_DESTINO: TStringField
      FieldName = 'NOME_ARQUIVO_DESTINO'
      Origin = 'NOME_ARQUIVO_DESTINO'
      ReadOnly = True
      FixedChar = True
      Size = 45
    end
  end
end
