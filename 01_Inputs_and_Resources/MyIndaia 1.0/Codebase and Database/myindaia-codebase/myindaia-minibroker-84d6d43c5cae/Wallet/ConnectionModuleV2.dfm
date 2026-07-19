object FireDacMSSQLConnectionV2: TFireDacMSSQLConnectionV2
  OldCreateOrder = True
  OnDestroy = DataModuleDestroy
  Height = 430
  Width = 405
  object Connection: TFDConnection
    Params.Strings = (
      'Database=MYINDAIAV2'
      'User_Name=sa'
      'Password=123'
      'Server=indaia10'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 16
    Top = 8
  end
  object qryUsuarioWallet: TFDQuery
    Connection = Connection
    SQL.Strings = (
      '  SELECT TOP 1 B.ID AS CD_USUARIO_WALLET, '
      '               A.CD_USUARIO, '
      '               A.NM_EMAIL, '
      '               ISNULL(H.CD_PRODUTO,'#39'01'#39') AS CD_PRODUTO_PADRAO, '
      
        '               ISNULL(H.CD_UNID_NEG, '#39'01'#39') AS CD_UNID_NEG_PADRAO' +
        ','
      '               b.financial_auth '
      '    FROM BROKER.DBO.TUSUARIO              A (NOLOCK)'
      '    LEFT'
      
        '    JOIN BROKER.DBO.TUSUARIO_HABILITACAO  H (NOLOCK) ON H.CD_USU' +
        'ARIO = A.CD_USUARIO'
      
        '                                                    AND ISNULL(H' +
        '.IN_DEFAULT, 0) = 1'
      
        '    JOIN MYINDAIAV2.DBO.AUTHUSER          B (NOLOCK) ON B.USERNA' +
        'ME = A.NM_EMAIL'
      ' WHERE A.AP_USUARIO= :AP_USUARIO')
    Left = 88
    Top = 8
    ParamData = <
      item
        Name = 'AP_USUARIO'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object HTTPRIO_Pedidos: THTTPRIO
    OnAfterExecute = HTTPRIO_Alterado_AfterExecute
    OnBeforeExecute = HTTPRIO_Alterado_BeforeExecute
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    HTTPWebNode.OnBeforePost = HTTPRIO_Alterado_HTTPWebNode1BeforePost
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 40
    Top = 80
  end
  object HTTPRIO2_CPA: THTTPRIO
    OnAfterExecute = HTTPRIO_Alterado_AfterExecute
    OnBeforeExecute = HTTPRIO_Alterado_BeforeExecute
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    HTTPWebNode.OnBeforePost = HTTPRIO_Alterado_HTTPWebNode1BeforePost
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 144
    Top = 144
  end
  object HTTPRIO_CPA_Senior: THTTPRIO
    OnAfterExecute = HTTPRIO_Alterado_AfterExecute
    OnBeforeExecute = HTTPRIO_Alterado_BeforeExecute
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    HTTPWebNode.OnBeforePost = HTTPRIO_Alterado_HTTPWebNode1BeforePost
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 264
    Top = 144
  end
  object HTTPRIO_CRE: THTTPRIO
    OnAfterExecute = HTTPRIO_Alterado_AfterExecute
    OnBeforeExecute = HTTPRIO_Alterado_BeforeExecute
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    HTTPWebNode.OnBeforePost = HTTPRIO_Alterado_HTTPWebNode1BeforePost
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 144
    Top = 80
  end
  object HTTPRIO_CRE_Senior: THTTPRIO
    OnAfterExecute = HTTPRIO_Alterado_AfterExecute
    OnBeforeExecute = HTTPRIO_Alterado_BeforeExecute
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    HTTPWebNode.OnBeforePost = HTTPRIO_Alterado_HTTPWebNode1BeforePost
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 264
    Top = 80
  end
  object qryImpressaoNumerario: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT'
      '       NUM.ID AS ID_NUMERARIO,'
      '       CC.CUSTOMID AS NR_PROCESSO,      '
      '       P.FILIAL_NOME,'#9
      '       P.FILIAL_ENDERECO,   '
      '       P.FILIAL_CNPJ,'
      '       P.FILIAL_NR_FONE,'
      '       CLI.NAME AS CLIENTE_NOME, '
      '       SUBSTRING(CLI.TAXID,1,2) +'#39'.'#39'+'
      '       SUBSTRING(CLI.TAXID,3,3)+'#39'.'#39'+        '
      '       SUBSTRING(CLI.TAXID,6,3)+'#39'/'#39'+        '
      '       SUBSTRING(CLI.TAXID,9,4)+'#39'-'#39'+       '
      '       SUBSTRING(CLI.TAXID,13,2) AS CLIENTE_CNPJ,'
      '       CLI.FONE AS CLIENTE_FONE,'
      '       P.DT_CHEGADA'#9','
      '       P.EMBARCACAO ,       '
      '       NUM.CREATED,        '
      '       P.NM_AREA,'
      '       P.NM_LOCAL_DESEMBARQUE,'
      '       P.NM_LOCAL_EMBARQUE,'
      '       P.NM_VIA_TRANSPORTE,'
      '       P.NR_BL,'
      '       P.NM_EXPORTADOR,'
      '       P.NM_IMPORTADOR,'
      '       P.MOEDA_MLE,'
      '       P.VL_MLE,'
      '       P.VL_MLE_MN,'
      '       '
      '       P.MOEDA_FRETE,   '
      '       P.VL_FRETE,'
      '       P.VL_FRETE_MN,'
      '       '
      '       P.VL_CIF_DOLAR,'
      '       P.VL_CIF_MN,'
      '       '
      #9'   P.MOEDA_SEGURO,'
      #9'   P.VL_SEGURO,'
      #9'   '
      #9'   P.TX_DOLAR,'
      #9'   P.TX_EURO,'
      #9'   P.CD_REFERENCIA,'
      #9'   P.TX_MERCADORIA,'
      #9'   P.NM_CONTATO'
      '       '
      ' FROM MYINDAIAV2.DBO.CASHREQUESTED    NUM   (NOLOCK)'
      
        ' JOIN MYINDAIAV2.DBO.CUSTOMER         CLI   (NOLOCK)  ON CLI.ID ' +
        ' = NUM.CUSTOMER_ID'
      
        ' JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE  CC    (NOLOCK)  ON CC.ID  ' +
        ' = NUM.CUSTOMCLEARANCE_ID      '
      
        ' CROSS APPLY(SELECT  VT.NM_VIA_TRANSPORTE                  AS NM' +
        '_VIA_TRANSPORTE,'
      
        '                     ARE.NM_AREA                           AS NM' +
        '_AREA,'
      
        '                     LD.DESCRICAO                          AS NM' +
        '_LOCAL_DESEMBARQUE,'
      
        '                     EV161.DT_REALIZACAO                   AS DT' +
        '_CHEGADA,'
      
        '                     PR.NR_CONHECIMENTO                    AS NR' +
        '_BL,'
      
        '(SELECT TOP 1 EX.NM_EMPRESA FROM BROKER.DBO.TEXPORTADOR_DI EXDI ' +
        ' (NOLOCK)  '
      
        #9#9#9#9#9' LEFT JOIN BROKER.DBO.TEMPRESA_EST           EX    (NOLOCK)' +
        '  ON EX.CD_EMPRESA        = ISNULL(EXDI.CD_EXPORTADOR, PR.CD_EXP' +
        'ORTADOR) '
      #9#9#9#9#9' WHERE EXDI.NR_PROCESSO     = PR.NR_PROCESSO'
      #9#9#9#9#9' )'
      '                        AS NM_EXPORTADOR,'
      
        '                     IM.NM_EMPRESA                         AS NM' +
        '_IMPORTADOR,'
      
        '                     PR.VL_MLE_MNEG                        AS VL' +
        '_MLE,'
      
        '                     PR.VL_MLE_MN                          AS VL' +
        '_MLE_MN,'
      
        '                     PR.VL_FRETE_PREPAID_MNEG              AS VL' +
        '_FRETE, '
      
        '                     PR.VL_FRETE_MN                        AS VL' +
        '_FRETE_MN,'
      
        '                     PR.VL_CIF_DOLAR                       AS VL' +
        '_CIF_DOLAR,'
      
        '                     PR.VL_CIF_MN                          AS VL' +
        '_CIF_MN,'
      
        '                     LE.DESCRICAO                          AS NM' +
        '_LOCAL_EMBARQUE,'
      '                    (SELECT AP_MOEDA'
      '                     FROM BROKER.DBO.TMOEDA_BROKER (NOLOCK)'
      
        '                     WHERE CD_MOEDA = PR.CD_MOEDA_MLE)     AS MO' +
        'EDA_MLE,'
      '                    (SELECT AP_MOEDA'
      '                     FROM BROKER.DBO.TMOEDA_BROKER (NOLOCK)'
      
        '                     WHERE CD_MOEDA = PR.CD_MOEDA_FRETE)   AS MO' +
        'EDA_FRETE,'
      ''
      
        '                     UPPER(EMP.AP_UNID_NEG)                AS FI' +
        'LIAL_NOME,'
      
        '                     EMP.NR_FONE                           AS FI' +
        'LIAL_NR_FONE,'
      '                     RTRIM(ISNULL(EMP.END_UNID_NEG, '#39#39')) +'#39' '#39'+ '
      '                     RTRIM(ISNULL(EMP.END_BAIRRO, '#39#39'))   +'#39' '#39'+'
      '                     RTRIM(ISNULL(EMP.END_CIDADE, '#39#39'))   +'#39' '#39'+'
      
        '                     '#39'CEP: '#39' + RTRIM(ISNULL(EMP.END_CEP, '#39#39')) AS' +
        ' FILIAL_ENDERECO,'#9'      '
      '                     SUBSTRING(EMP.CGC_UNID_NEG,1,2) +'#39'.'#39'+'
      
        '                     SUBSTRING(EMP.CGC_UNID_NEG,3,3)+'#39'.'#39'+       ' +
        ' '
      
        '                     SUBSTRING(EMP.CGC_UNID_NEG,6,3)+'#39'/'#39'+       ' +
        ' '
      '                     SUBSTRING(EMP.CGC_UNID_NEG,9,4)+'#39'-'#39'+       '
      
        '                     SUBSTRING(EMP.CGC_UNID_NEG,13,2)      AS FI' +
        'LIAL_CNPJ, '
      
        '                     EMBAR.NM_EMBARCACAO                   AS EM' +
        'BARCACAO,'
      '                    (SELECT AP_MOEDA'
      '                     FROM BROKER.DBO.TMOEDA_BROKER (NOLOCK)'
      
        '                     WHERE CD_MOEDA = DI.CD_MOEDA_SEGURO)  AS MO' +
        'EDA_SEGURO,                     '
      
        '                     DI.VL_TOT_SEGURO_MNEG                 AS VL' +
        '_SEGURO,   '
      '                    (SELECT TX_CAMBIO '
      '                       FROM BROKER.DBO.TTAXA_CAMBIO (NOLOCK)'
      
        '                      WHERE DATEADD(DAY, DATEDIFF(DAY, 0, GETDAT' +
        'E()), 0) BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA '
      
        '                        AND CD_MOEDA = 220 /*DOLAR*/)      AS TX' +
        '_DOLAR,'
      '                    (SELECT TX_CAMBIO '
      '                       FROM BROKER.DBO.TTAXA_CAMBIO (NOLOCK)'
      
        '                      WHERE DATEADD(DAY, DATEDIFF(DAY, 0, GETDAT' +
        'E()), 0) BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA '
      
        '                        AND CD_MOEDA = 978 /*EURO*/)      AS TX_' +
        'EURO,'
      
        '                     CAST(PR.TX_MERCADORIA AS VARCHAR(500)) AS T' +
        'X_MERCADORIA,'
      
        '                    CAST(STUFF((SELECT '#39','#39' + LTRIM(RTRIM(REF.CD_' +
        'REFERENCIA))'
      
        '                                  FROM BROKER.DBO.TREF_CLIENTE R' +
        'EF WITH (NOLOCK)'
      
        '                                 WHERE REF.NR_PROCESSO   = PR.NR' +
        '_PROCESSO    '
      
        '                                   AND REF.TP_REFERENCIA = '#39'01'#39' ' +
        ' '
      
        '                          FOR XML PATH('#39#39')), 1, 1, '#39#39') AS VARCHA' +
        'R(500))   AS CD_REFERENCIA  , '
      '                   (SELECT TOP 1 NM_CONTATO '
      '                      FROM BROKER.dbo.TCLIENTE_CONTATO T'
      '                     WHERE t.CD_UNID_NEG = PR.CD_UNID_NEG '
      '                       AND t.CD_CONTATO  = PR.CD_CONTATO'
      
        '                       AND t.CD_CLIENTE  = PR.CD_CLIENTE  ) NM_C' +
        'ONTATO'
      '                        '#9#9'                     '
      
        '   FROM BROKER.DBO.TPROCESSO                   PR    (NOLOCK)   ' +
        '             '
      
        '   JOIN BROKER.DBO.VW_SERVICO_GERAL            SV    (NOLOCK)  O' +
        'N SV.CD_SERVICO        = PR.CD_SERVICO '
      
        '   JOIN BROKER.DBO.TVIA_TRANSPORTE             VT    (NOLOCK)  O' +
        'N VT.CD_VIA_TRANSPORTE = SV.CD_VIA_TRANSPORTE  '
      
        '--   LEFT JOIN BROKER.DBO.TEXPORTADOR_DI         EXDI  (NOLOCK) ' +
        ' ON EXDI.NR_PROCESSO     = PR.NR_PROCESSO'
      
        '--   LEFT JOIN BROKER.DBO.TEMPRESA_EST           EX    (NOLOCK) ' +
        ' ON EX.CD_EMPRESA        = ISNULL(EXDI.CD_EXPORTADOR, PR.CD_EXPO' +
        'RTADOR)  '
      
        '   LEFT JOIN BROKER.DBO.TEMPRESA_EST           IM    (NOLOCK)  O' +
        'N IM.CD_EMPRESA        = PR.CD_IMPORTADOR'
      
        '   LEFT JOIN BROKER.DBO.TAREA                  ARE   (NOLOCK)  O' +
        'N ARE.CD_AREA          = PR.CD_AREA  '
      
        '   LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE        LD    (NOLOCK)  O' +
        'N LD.CODIGO            = PR.CD_LOCAL_DESEMBARQUE             '
      
        '   LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE        LE    (NOLOCK)  O' +
        'N LE.CODIGO            = PR.CD_LOCAL_EMBARQUE             '
      
        '   LEFT JOIN BROKER.DBO.TFOLLOWUP              EV161 (NOLOCK)  O' +
        'N EV161.NR_PROCESSO    = PR.NR_PROCESSO'
      
        '                                                              AN' +
        'D EV161.CD_EVENTO      = '#39'161'#39
      
        '   LEFT JOIN BROKER.DBO.TEMBARCACAO            EMBAR (NOLOCK)  O' +
        'N EMBAR.CD_EMBARCACAO  = PR.CD_EMBARCACAO'
      
        '   LEFT JOIN BROKER.DBO.TDECLARACAO_IMPORTACAO DI    (NOLOCK)  O' +
        'N DI.NR_PROCESSO       = PR.NR_PROCESSO    '
      
        '        JOIN BROKER.DBO.TUNID_NEG              EMP   (NOLOCK)  O' +
        'N EMP.CD_UNID_NEG      = PR.CD_UNID_NEG        '
      '        WHERE PR.NR_PROCESSO = CAST(CC.CUSTOMID AS CHAR(18))'
      '             ) AS P    '
      ''
      
        'WHERE NUM.ID in (SELECT ITEM FROM BROKER.DBO.LIST_TO_TABLE(:NUM_' +
        'ID))')
    Left = 56
    Top = 216
    ParamData = <
      item
        Name = 'NUM_ID'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryImpressaoNumerarioNR_PROCESSO: TWideStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      Required = True
      Size = 255
    end
    object qryImpressaoNumerarioFILIAL_NOME: TStringField
      FieldName = 'FILIAL_NOME'
      Origin = 'FILIAL_NOME'
      ReadOnly = True
      Size = 10
    end
    object qryImpressaoNumerarioFILIAL_ENDERECO: TStringField
      FieldName = 'FILIAL_ENDERECO'
      Origin = 'FILIAL_ENDERECO'
      ReadOnly = True
      Size = 121
    end
    object qryImpressaoNumerarioFILIAL_CNPJ: TStringField
      FieldName = 'FILIAL_CNPJ'
      Origin = 'FILIAL_CNPJ'
      ReadOnly = True
      Size = 18
    end
    object qryImpressaoNumerarioFILIAL_NR_FONE: TStringField
      FieldName = 'FILIAL_NR_FONE'
      Origin = 'FILIAL_NR_FONE'
    end
    object qryImpressaoNumerarioCLIENTE_NOME: TWideStringField
      FieldName = 'CLIENTE_NOME'
      Origin = 'CLIENTE_NOME'
      Size = 255
    end
    object qryImpressaoNumerarioCLIENTE_CNPJ: TWideStringField
      FieldName = 'CLIENTE_CNPJ'
      Origin = 'CLIENTE_CNPJ'
      ReadOnly = True
      Size = 18
    end
    object qryImpressaoNumerarioCLIENTE_FONE: TWideStringField
      FieldName = 'CLIENTE_FONE'
      Origin = 'CLIENTE_FONE'
      Size = 255
    end
    object qryImpressaoNumerarioDT_CHEGADA: TSQLTimeStampField
      FieldName = 'DT_CHEGADA'
      Origin = 'DT_CHEGADA'
    end
    object qryImpressaoNumerarioEMBARCACAO: TStringField
      FieldName = 'EMBARCACAO'
      Origin = 'EMBARCACAO'
      Size = 40
    end
    object qryImpressaoNumerarioCREATED: TSQLTimeStampField
      FieldName = 'CREATED'
      Origin = 'CREATED'
    end
    object qryImpressaoNumerarioNM_AREA: TStringField
      FieldName = 'NM_AREA'
      Origin = 'NM_AREA'
      FixedChar = True
      Size = 50
    end
    object qryImpressaoNumerarioNM_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'NM_LOCAL_DESEMBARQUE'
      Origin = 'NM_LOCAL_DESEMBARQUE'
      Size = 50
    end
    object qryImpressaoNumerarioNM_LOCAL_EMBARQUE: TStringField
      FieldName = 'NM_LOCAL_EMBARQUE'
      Origin = 'NM_LOCAL_EMBARQUE'
      Size = 50
    end
    object qryImpressaoNumerarioNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      Origin = 'NM_VIA_TRANSPORTE'
    end
    object qryImpressaoNumerarioNR_BL: TStringField
      FieldName = 'NR_BL'
      Origin = 'NR_BL'
      FixedChar = True
      Size = 30
    end
    object qryImpressaoNumerarioNM_EXPORTADOR: TStringField
      FieldName = 'NM_EXPORTADOR'
      Origin = 'NM_EXPORTADOR'
      Size = 100
    end
    object qryImpressaoNumerarioMOEDA_MLE: TStringField
      FieldName = 'MOEDA_MLE'
      Origin = 'MOEDA_MLE'
      ReadOnly = True
      Size = 6
    end
    object qryImpressaoNumerarioVL_MLE: TFloatField
      FieldName = 'VL_MLE'
      Origin = 'VL_MLE'
    end
    object qryImpressaoNumerarioMOEDA_FRETE: TStringField
      FieldName = 'MOEDA_FRETE'
      Origin = 'MOEDA_FRETE'
      ReadOnly = True
      Size = 6
    end
    object qryImpressaoNumerarioVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'VL_FRETE'
    end
    object qryImpressaoNumerarioVL_CIF_DOLAR: TFloatField
      FieldName = 'VL_CIF_DOLAR'
      Origin = 'VL_CIF_DOLAR'
    end
    object qryImpressaoNumerarioVL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
      Origin = 'VL_CIF_MN'
    end
    object qryImpressaoNumerarioMOEDA_SEGURO: TStringField
      FieldName = 'MOEDA_SEGURO'
      Origin = 'MOEDA_SEGURO'
      ReadOnly = True
      Size = 6
    end
    object qryImpressaoNumerarioVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'VL_SEGURO'
    end
    object qryImpressaoNumerarioID_NUMERARIO: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_NUMERARIO'
      Origin = 'ID_NUMERARIO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object qryImpressaoNumerarioNM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      Origin = 'NM_IMPORTADOR'
      Size = 100
    end
    object qryImpressaoNumerarioVL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
      Origin = 'VL_MLE_MN'
    end
    object qryImpressaoNumerarioVL_FRETE_MN: TFloatField
      FieldName = 'VL_FRETE_MN'
      Origin = 'VL_FRETE_MN'
    end
    object qryImpressaoNumerarioTX_MERCADORIA: TStringField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TX_MERCADORIA'
      ReadOnly = True
      Size = 500
    end
    object qryImpressaoNumerarioCD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'CD_REFERENCIA'
      ReadOnly = True
      Size = 500
    end
    object qryImpressaoNumerarioTX_EURO: TFloatField
      FieldName = 'TX_EURO'
      Origin = 'TX_EURO'
      ReadOnly = True
    end
    object qryImpressaoNumerarioTX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      Origin = 'TX_DOLAR'
    end
    object qryImpressaoNumerarioNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'NM_CONTATO'
      ReadOnly = True
      Size = 50
    end
  end
  object qryImpressaoNumerarioItem: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT NUM.ID AS ID_NUMERARIO,'
      '      CASE ITEM.DESTINO  '
      '            WHEN 1 THEN '#39'D'#201'BITOS INDAI'#193#39
      '            WHEN 2 THEN '#39'D'#201'BITOS CLIENTE'#39'            '
      '        END DESTINO,'
      '        CASE ITEM.DESTINO  '
      '            WHEN 1 THEN '#39'TOTAL INDAI'#193#39
      '            WHEN 2 THEN '#39'TOTAL CLIENTE'#39'            '
      '        END DESTINO_DESC,        '
      '        I.NAME, '
      '        CAST(ITEM.PRICE AS NUMERIC(15,2)) AS PRICE,'
      '        '#39'( '#39' +ISNULL(NR_BANCO, '#39'-'#39') +'#39' ) '#39
      '            + ISNULL(NM_BANCO, '#39#39')                  '
      '        +'#39'  |  AG'#202'NCIA: '#39' + ISNULL(CD_AGENCIA, '#39'-'#39')   '
      '        +'#39'  |  CTA: '#39' + ISNULL(NR_CONTA, '#39'-'#39')         AS CONTA,'
      '        SUM(PRICE) OVER(PARTITION BY( DESTINO)) AS TOTAL_DESTINO'
      '        '
      
        ' FROM MYINDAIAV2.DBO.CASHREQUESTED                   NUM      (N' +
        'OLOCK)'
      
        ' JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED NUM_ITEM (N' +
        'OLOCK) ON NUM_ITEM.CASHREQUESTED_ID = NUM.ID'
      
        ' JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               ITEM     (N' +
        'OLOCK) ON ITEM.ID = NUM_ITEM.ITEMS_ID '
      
        ' JOIN MYINDAIAV2.DBO.ITEM                            I        (N' +
        'OLOCK) ON I.ID = ITEM.ITEM_ID  '
      
        ' JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                 CC       (N' +
        'OLOCK) ON CC.ID = NUM.CUSTOMCLEARANCE_ID     '
      
        ' OUTER APPLY(SELECT B.NR_BANCO,  B.NM_BANCO,B.CD_AGENCIA, B.NR_C' +
        'ONTA'
      
        '               FROM BROKER.DBO.TPROCESSO             PR       (N' +
        'OLOCK)                               '
      
        '               OUTER APPLY(SELECT TOP 1 G.CD_BANCO_ADIANTAMENTO ' +
        '                                  '
      
        '                             FROM BROKER.DBO.TCLIENTE_BANCO G (N' +
        'OLOCK)                                   '
      
        '                            WHERE G.CD_GRUPO = PR.CD_GRUPO      ' +
        '                            '
      
        '                              AND ISNULL(G.CD_BANCO_ADIANTAMENTO' +
        ', '#39#39') <> '#39#39
      
        '                              AND CAST(G.CD_CLIENTE AS INTEGER) ' +
        '= CAST(PR.CD_CLIENTE AS INTEGER)                              '
      
        '                           ) CONTA_CLIENTE                      ' +
        '       '
      '                                                         '
      '               OUTER APPLY(SELECT TOP 1 G.CD_BANCO_ADIANTAMENTO'
      
        '                             FROM BROKER.DBO.TCLIENTE_BANCO G (N' +
        'OLOCK)                                   '
      
        '                            WHERE G.CD_GRUPO = PR.CD_GRUPO      ' +
        '                            '
      
        '                        AND ISNULL(G.CD_BANCO_ADIANTAMENTO, '#39#39') ' +
        '<> '#39#39
      
        '                              AND G.CD_CLIENTE = 0) CONTA_CLIENT' +
        'E_ZERO                                  '
      '                                                                '
      
        '               LEFT JOIN BROKER.DBO.TBANCO B (NOLOCK) ON B.CD_BA' +
        'NCO = ISNULL(CONTA_CLIENTE.CD_BANCO_ADIANTAMENTO,               ' +
        '                   '
      
        '                                                                ' +
        '             CONTA_CLIENTE_ZERO.CD_BANCO_ADIANTAMENTO )         ' +
        '                           '
      
        '                                                         AND B.I' +
        'N_ATIVO = 1    '
      
        '              WHERE PR.NR_PROCESSO = CAST(CC.CUSTOMID AS CHAR(18' +
        '))'
      '              AND ITEM.DESTINO = '#39'1'#39
      '             ) AS P   '
      'WHERE NUM.ID = :NUM_ID'
      ''
      'ORDER BY ITEM.DESTINO, I.NAME, ITEM.PRICE')
    Left = 200
    Top = 216
    ParamData = <
      item
        Name = 'NUM_ID'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryImpressaoNumerarioItemDESTINO: TStringField
      FieldName = 'DESTINO'
      Origin = 'DESTINO'
      ReadOnly = True
      Size = 15
    end
    object qryImpressaoNumerarioItemDESTINO_DESC: TStringField
      FieldName = 'DESTINO_DESC'
      Origin = 'DESTINO_DESC'
      ReadOnly = True
      Size = 13
    end
    object qryImpressaoNumerarioItemNAME: TWideStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 255
    end
    object qryImpressaoNumerarioItemPRICE: TBCDField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object qryImpressaoNumerarioItemCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      ReadOnly = True
      Required = True
      Size = 87
    end
    object qryImpressaoNumerarioItemTOTAL_DESTINO: TFMTBCDField
      FieldName = 'TOTAL_DESTINO'
      Origin = 'TOTAL_DESTINO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object qryImpressaoNumerarioItemID_NUMERARIO: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_NUMERARIO'
      Origin = 'ID_NUMERARIO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
  end
  object cdsImpressaoNumerario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImpressaoNumerario'
    AfterScroll = cdsImpressaoNumerarioAfterScroll
    Left = 56
    Top = 312
    object cdsImpressaoNumerarioNR_PROCESSO: TWideStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 255
    end
    object cdsImpressaoNumerarioFILIAL_NOME: TStringField
      FieldName = 'FILIAL_NOME'
      ReadOnly = True
      Size = 10
    end
    object cdsImpressaoNumerarioFILIAL_ENDERECO: TStringField
      FieldName = 'FILIAL_ENDERECO'
      ReadOnly = True
      Size = 121
    end
    object cdsImpressaoNumerarioFILIAL_CNPJ: TStringField
      FieldName = 'FILIAL_CNPJ'
      ReadOnly = True
      Size = 18
    end
    object cdsImpressaoNumerarioFILIAL_NR_FONE: TStringField
      FieldName = 'FILIAL_NR_FONE'
    end
    object cdsImpressaoNumerarioCLIENTE_NOME: TWideStringField
      FieldName = 'CLIENTE_NOME'
      Size = 255
    end
    object cdsImpressaoNumerarioCLIENTE_CNPJ: TWideStringField
      FieldName = 'CLIENTE_CNPJ'
      ReadOnly = True
      Size = 18
    end
    object cdsImpressaoNumerarioCLIENTE_FONE: TWideStringField
      FieldName = 'CLIENTE_FONE'
      Size = 255
    end
    object cdsImpressaoNumerarioDT_CHEGADA: TSQLTimeStampField
      FieldName = 'DT_CHEGADA'
    end
    object cdsImpressaoNumerarioEMBARCACAO: TStringField
      FieldName = 'EMBARCACAO'
      Size = 40
    end
    object cdsImpressaoNumerarioCREATED: TSQLTimeStampField
      FieldName = 'CREATED'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object cdsImpressaoNumerarioNM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 50
    end
    object cdsImpressaoNumerarioNM_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'NM_LOCAL_DESEMBARQUE'
      Size = 50
    end
    object cdsImpressaoNumerarioNM_LOCAL_EMBARQUE: TStringField
      FieldName = 'NM_LOCAL_EMBARQUE'
      Size = 50
    end
    object cdsImpressaoNumerarioNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
    end
    object cdsImpressaoNumerarioNR_BL: TStringField
      FieldName = 'NR_BL'
      FixedChar = True
      Size = 30
    end
    object cdsImpressaoNumerarioNM_EXPORTADOR: TStringField
      FieldName = 'NM_EXPORTADOR'
      Size = 100
    end
    object cdsImpressaoNumerarioMOEDA_MLE: TStringField
      FieldName = 'MOEDA_MLE'
      ReadOnly = True
      Size = 6
    end
    object cdsImpressaoNumerarioVL_MLE: TFloatField
      FieldName = 'VL_MLE'
      DisplayFormat = '##,##0.00'
    end
    object cdsImpressaoNumerarioMOEDA_FRETE: TStringField
      FieldName = 'MOEDA_FRETE'
      ReadOnly = True
      Size = 6
    end
    object cdsImpressaoNumerarioVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      DisplayFormat = '##,##0.00'
    end
    object cdsImpressaoNumerarioVL_CIF_DOLAR: TFloatField
      FieldName = 'VL_CIF_DOLAR'
      DisplayFormat = '##,##0.00'
    end
    object cdsImpressaoNumerarioVL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
      DisplayFormat = '##,##0.00'
    end
    object cdsImpressaoNumerarioMOEDA_SEGURO: TStringField
      FieldName = 'MOEDA_SEGURO'
      ReadOnly = True
      Size = 6
    end
    object cdsImpressaoNumerarioVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      DisplayFormat = '##,##0.00'
    end
    object cdsImpressaoNumerarioID_NUMERARIO: TLargeintField
      FieldName = 'ID_NUMERARIO'
      ReadOnly = True
    end
    object cdsImpressaoNumerarioNM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      Size = 100
    end
    object cdsImpressaoNumerarioVL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
      DisplayFormat = '##,##0.00'
    end
    object cdsImpressaoNumerarioVL_FRETE_MN: TFloatField
      FieldName = 'VL_FRETE_MN'
      DisplayFormat = '##,##0.00'
    end
    object cdsImpressaoNumerarioTX_MERCADORIA: TStringField
      FieldName = 'TX_MERCADORIA'
      ReadOnly = True
      Size = 500
    end
    object cdsImpressaoNumerarioCD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      ReadOnly = True
      Size = 500
    end
    object cdsImpressaoNumerarioTX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      DisplayFormat = '##,####0.0000'
    end
    object cdsImpressaoNumerarioTX_EURO: TFloatField
      FieldName = 'TX_EURO'
      ReadOnly = True
      DisplayFormat = '##,####0.0000'
    end
    object cdsImpressaoNumerarioNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      ReadOnly = True
      Size = 50
    end
  end
  object cdsImpressaoNumerarioItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImpressaoNumerarioItem'
    Left = 192
    Top = 312
    object cdsImpressaoNumerarioItemID_NUMERARIO: TLargeintField
      FieldName = 'ID_NUMERARIO'
      ReadOnly = True
    end
    object cdsImpressaoNumerarioItemDESTINO: TStringField
      FieldName = 'DESTINO'
      ReadOnly = True
      Size = 15
    end
    object cdsImpressaoNumerarioItemDESTINO_DESC: TStringField
      FieldName = 'DESTINO_DESC'
      ReadOnly = True
      Size = 13
    end
    object cdsImpressaoNumerarioItemNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object cdsImpressaoNumerarioItemPRICE: TBCDField
      FieldName = 'PRICE'
      ReadOnly = True
      DisplayFormat = '##,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsImpressaoNumerarioItemCONTA: TStringField
      FieldName = 'CONTA'
      ReadOnly = True
      Required = True
      Size = 87
    end
    object cdsImpressaoNumerarioItemTOTAL_DESTINO: TFMTBCDField
      FieldName = 'TOTAL_DESTINO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object dspImpressaoNumerario: TDataSetProvider
    DataSet = qryImpressaoNumerario
    Left = 56
    Top = 264
  end
  object dsImpressaoNumerarioItem: TDataSource
    DataSet = cdsImpressaoNumerarioItem
    Left = 192
    Top = 368
  end
  object dspImpressaoNumerarioItem: TDataSetProvider
    DataSet = qryImpressaoNumerarioItem
    Left = 192
    Top = 264
  end
  object dsImpressaoNumerario: TDataSource
    DataSet = cdsImpressaoNumerario
    Left = 56
    Top = 368
  end
  object qryArquivoNumerario: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT *'
      'FROM MYINDAIAV2.DBO.FN_EDI_NUMERARIO_( :NUM_ID)'
      'order by ID_NUMERARIO, ORDEM'
      '')
    Left = 328
    Top = 216
    ParamData = <
      item
        Name = 'NUM_ID'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryArquivoNumerarioORDEM: TStringField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      FixedChar = True
      Size = 1
    end
    object qryArquivoNumerarioTX_EDI: TMemoField
      FieldName = 'TX_EDI'
      Origin = 'TX_EDI'
      BlobType = ftMemo
      Size = 2147483647
    end
  end
end
