object dtmDocumentosFaturamento: TdtmDocumentosFaturamento
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 739
  Width = 795
  object CapaMyIndaiaV2: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'idFatura'
        DataType = ftSmallint
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'SET LANGUAGE BRAZILIAN'
      ''
      'SELECT TOP 1 '
      '       '#39'Santos, '#39' + '
      '       CONVERT(VARCHAR(02),DATEPART(DAY,B.CREATED)) + '#39' de '#39' + '
      '       DATENAME(MONTH,B.CREATED) + '#39' de '#39' + '
      
        '       CONVERT(VARCHAR(04),DATEPART(YEAR,B.CREATED)) AS EMISSAOE' +
        'XTENSO,'
      '       B.SENIORKEY                                   AS FATURA ,'
      
        '       CASE WHEN INVOICERECEIVERTYPE = '#39'CUSTOMER'#39' THEN C.NAME   ' +
        '      ELSE A.NM_AGENTE     END NOMECLIENTE,'
      
        '       CASE WHEN INVOICERECEIVERTYPE = '#39'CUSTOMER'#39' THEN C.STREET ' +
        '      ELSE A.DS_ENDERECO   END ENDCLIENTE,'
      
        '       CASE WHEN INVOICERECEIVERTYPE = '#39'CUSTOMER'#39' THEN C.CITY   ' +
        '      ELSE L.NM_CIDADE     END CIDADECLIENTE,'
      
        '       CASE WHEN INVOICERECEIVERTYPE = '#39'CUSTOMER'#39' THEN C.STATE  ' +
        '      ELSE A.END_UF        END UFCLIENTE,'
      
        '       CASE WHEN INVOICERECEIVERTYPE = '#39'CUSTOMER'#39' THEN C.ZIPCODE' +
        '      ELSE A.NR_ZIP_CODE   END CEPCLIENTE,'
      
        '       CASE WHEN INVOICERECEIVERTYPE = '#39'CUSTOMER'#39' THEN C.INSCEST' +
        'ADUAL ELSE '#39#39'              END INSCESTADUAL,'
      
        '       CASE WHEN INVOICERECEIVERTYPE = '#39'CUSTOMER'#39' THEN C.NEIGHBO' +
        'RHOOD ELSE '#39#39'              END BAIRROCLIENTE,'
      
        '       CASE WHEN INVOICERECEIVERTYPE = '#39'CUSTOMER'#39' THEN C.TAXID  ' +
        '      ELSE A.NR_CGC_AGENTE END CNPJCLIENTE,'
      
        '       UN.NM_UNID_NEG                               AS NOME_INDA' +
        'IA,'
      '       LTRIM(RTRIM(UN.END_UNID_NEG)) +'#39', '#39'  + '
      
        '       LTRIM(RTRIM(UN.END_NUMERO))                  AS END_INDAI' +
        'A,'
      '       LTRIM(RTRIM(UN.END_BAIRRO))   + '#39'-'#39'  + '
      '       LTRIM(RTRIM(UN.END_CIDADE))   + '#39'-'#39'  + '
      
        '       UN.END_UF                                    AS CIDADE_IN' +
        'DAIA,'
      '       '#39'CEP: '#39' + SUBSTRING (UN.END_CEP,1,2)  + '
      '                 SUBSTRING (UN.END_CEP,1,3)  + '#39'-'#39'+ '
      
        '                 SUBSTRING (UN.END_CEP,6,3)         AS CEP_INDAI' +
        'A,'
      '       '#39'TEL: '#39'+UN.NR_FONE +'#39'/ '#39'+ '
      
        '       '#39'FAX: '#39'+UN.NR_FAX1                           AS TELFAX_IN' +
        'DAIA,'
      '       '#39'CNPJ: '#39' + SUBSTRING(UN.CGC_UNID_NEG,1,2) + '#39'.'#39' + '
      '                  SUBSTRING(UN.CGC_UNID_NEG,3,3) + '#39'.'#39' + '
      '                  SUBSTRING(UN.CGC_UNID_NEG,6,3) + '#39'/'#39' + '
      '                  SUBSTRING(UN.CGC_UNID_NEG,9,4) + '#39'-'#39' + '
      '                  SUBSTRING(UN.CGC_UNID_NEG,13,2)  AS CPNJ'
      'FROM BILLING B (NOLOCK)'
      
        'LEFT JOIN BILLING_ITEMINVOICED       BII(NOLOCK) ON BII.BILLING_' +
        'ID=B.ID'
      
        'LEFT JOIN BILLING_CASHREQUESTED      BCR(NOLOCK) ON BCR.BILLING_' +
        'ID=B.ID'
      
        'LEFT JOIN CASHREQUESTED              CR (NOLOCK) ON CR.ID=BCR.CA' +
        'SHREQUESTS_ID'
      
        'LEFT JOIN ITEMINVOICED               II (NOLOCK) ON II.ID=BII.IT' +
        'ENSINVOICED_ID'
      
        'INNER JOIN CUSTOMCLEARANCE           CC (NOLOCK) ON CC.ID=ISNULL' +
        '(II.CUSTOMCLEARANCE_ID,CR.CUSTOMCLEARANCE_ID)'
      
        'INNER JOIN CUSTOMER                  C  (NOLOCK) ON C.ID=CC.CUST' +
        'OMER_ID'
      
        'LEFT JOIN  BROKER.DBO.TUNID_NEG      UN (NOLOCK) ON UN.CD_UNID_N' +
        'EG = B.BRANCH_ID'
      
        'INNER JOIN BROKER.DBO.TPROCESSO      P  (NOLOCK) ON P.NR_PROCESS' +
        'O=CC.CUSTOMID'
      
        'LEFT JOIN BROKER.DBO.TAGENTE         A  (NOLOCK) ON A.CD_AGENTE=' +
        'P.CD_AGENTE'
      
        'LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE L  (NOLOCK) ON L.CODIGO=A.C' +
        'D_CIDADE'
      'WHERE B.ID = :IDFATURA')
    Left = 152
    object CapaMyIndaiaV2EmissaoExtenso: TWideStringField
      FieldName = 'EmissaoExtenso'
      ReadOnly = True
      Size = 52
    end
    object CapaMyIndaiaV2Fatura: TWideStringField
      FieldName = 'Fatura'
      Size = 255
    end
    object CapaMyIndaiaV2NomeCliente: TWideStringField
      FieldName = 'NomeCliente'
      Size = 255
    end
    object CapaMyIndaiaV2BairroCliente: TWideStringField
      FieldName = 'BairroCliente'
      Size = 255
    end
    object CapaMyIndaiaV2CNPJCliente: TWideStringField
      FieldName = 'CNPJCliente'
      Size = 255
    end
    object CapaMyIndaiaV2EndCliente: TWideStringField
      FieldName = 'EndCliente'
      Size = 255
    end
    object CapaMyIndaiaV2CidadeCliente: TWideStringField
      FieldName = 'CidadeCliente'
      Size = 255
    end
    object CapaMyIndaiaV2UFCliente: TWideStringField
      FieldName = 'UFCliente'
      Size = 255
    end
    object CapaMyIndaiaV2CepCliente: TWideStringField
      FieldName = 'CepCliente'
      Size = 255
    end
    object CapaMyIndaiaV2inscEstadual: TWideStringField
      FieldName = 'inscEstadual'
      Size = 255
    end
    object CapaMyIndaiaV2NOME_INDAIA: TStringField
      FieldName = 'NOME_INDAIA'
      FixedChar = True
      Size = 50
    end
    object CapaMyIndaiaV2END_INDAIA: TStringField
      FieldName = 'END_INDAIA'
      ReadOnly = True
      Size = 58
    end
    object CapaMyIndaiaV2CIDADE_INDAIA: TStringField
      FieldName = 'CIDADE_INDAIA'
      ReadOnly = True
      Size = 64
    end
    object CapaMyIndaiaV2CEP_INDAIA: TStringField
      FieldName = 'CEP_INDAIA'
      ReadOnly = True
      Size = 14
    end
    object CapaMyIndaiaV2TELFAX_INDAIA: TStringField
      FieldName = 'TELFAX_INDAIA'
      ReadOnly = True
      Size = 52
    end
    object CapaMyIndaiaV2CPNJ: TStringField
      FieldName = 'CPNJ'
      ReadOnly = True
      Size = 24
    end
  end
  object CapaBroker: TADOQuery
    AutoCalcFields = False
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'ProcessoID'
        DataType = ftSmallint
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      '/*CapaBroker*/'
      ''
      'DECLARE @NR_PROCESSO VARCHAR(20)'
      
        'SET @NR_PROCESSO = (SELECT CUSTOMID FROM MYINDAIAV2.DBO.CUSTOMCL' +
        'EARANCE CCV2 WHERE ID=  :PROCESSOID)'
      ''
      ''
      'SELECT P.NR_PROCESSO,'
      '       CC.NM_CONTATO NOMEANALISTA,'
      
        '       CONVERT(VARCHAR(500), ISNULL(SUBSTRING(STUFF((SELECT DIST' +
        'INCT '#39', '#39' + LTRIM(RTRIM(ISNULL(CD_REFERENCIA,'#39#39')))+'
      
        '                                                                ' +
        '    CASE WHEN LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39'))) <> '#39'0000'#39' and'
      
        '                                                                ' +
        '              LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39'))) <> '#39#39
      
        '                                                                ' +
        '         THEN '#39'-'#39'+LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39')))'
      
        '                                                                ' +
        '         ELSE '#39#39
      
        '                                                                ' +
        '    END     '
      
        '        '#9#9#9#9#9#9#9'                   FROM BROKER.DBO.TREF_CLIENTE (' +
        'NOLOCK) '
      
        '        '#9#9#9#9#9#9#9'                  WHERE NR_PROCESSO = P.NR_PROCES' +
        'SO '
      
        '        '#9#9#9#9#9#9#9'                    AND TP_REFERENCIA IN (CASE WH' +
        'EN P.CD_PRODUTO = 1 '
      
        '        '#9#9#9#9#9#9#9'                                               TH' +
        'EN G.TP_PEDIDO_BUSCA_IMP '
      
        '        '#9#9#9#9#9#9#9'                                               EL' +
        'SE G.TP_PEDIDO_BUSCA '
      '        '#9#9#9#9#9#9#9'                                          END,'
      
        '        '#9#9#9#9#9#9#9'                                          CASE WH' +
        'EN G.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') THEN '#39'01'#39
      
        '                                                                ' +
        '                                                                ' +
        '                                   WHEN G.CD_GRUPO = '#39'155'#39
      
        '        '#9#9#9#9#9#9#9'                                               TH' +
        'EN '#39'02'#39
      
        '        '#9#9#9#9#9#9#9'                                               EL' +
        'SE '#39#39
      '        '#9#9#9#9#9#9#9'                                          END)'
      
        '        '#9#9#9#9#9#9#9'                  /* ORDER BY TP_REFERENCIA DESC ' +
        ' */'
      
        '       '#9#9#9#9#9#9#9'               FOR XML PATH('#39#39')), 1, 2, '#39#39'),1,500)' +
        ', '#39#39'))  AS PEDIDOCLIENTE,'
      '--       NR_DI,'
      '       CASE WHEN P.CD_PRODUTO = 1 '
      '            THEN NR_DI'
      '            ELSE P.CD_DUE'
      '       END AS NR_DI,'
      '       NR_PLACA_VEICULO,'
      '       DT_PRESENCA_CARGA,'
      '       LE.DESCRICAO,'
      '       VL_CIF_MN,'
      '       VL_MLE_MN,'
      #9'   CONVERT(VARCHAR(300),'
      #9'   STUFF ((SELECT '#39','#39' + LTRIM(RTRIM(ISNULL(E.DESCRICAO, '#39#39')))'
      '                 FROM  BROKER.DBO.TEMBALAGEM_CARGA EC (NOLOCK) '
      
        '            LEFT  JOIN BROKER.DBO.TTP_EMBALAGEM    E  (NOLOCK) O' +
        'N E.CODIGO = EC.CD_TIPO_EMBALAGEM'
      '                WHERE  EC.NR_PROCESSO      = P.NR_PROCESSO '
      '              FOR XML PATH('#39#39')), 1, 1, '#39#39'))  AS DESCRICAO,'
      '       P.TX_MERCADORIA,'
      '       V.NM_VIA_TRANSPORTE,'
      '       A.NM_AREA,'
      '       CCO.NM_CONTATO,'
      '       AG.NM_AGENTE,'
      '       CASE P.CD_PRODUTO '
      '           WHEN 1  THEN '#39'IMPORTA'#199#195'O'#39' '
      '           WHEN 2  THEN '#39'EXPORTA'#199#195'O'#39' '
      '           WHEN 3  THEN '#39'AGENCIAMENTO'#39' '
      '           WHEN 6  THEN '#39'ADM PEDIDO'#39' '
      '           WHEN 10 THEN '#39'AGENCIAMENTO'#39' '
      '        END NM_DESPACHO,'
      
        '       CONVERT(VARCHAR(500), SUBSTRING(ISNULL(STUFF((SELECT DIST' +
        'INCT '#39'  '#39'+ LTRIM(RTRIM(ISNULL(CD_REFERENCIA,'#39#39')))+'
      
        '                                                                ' +
        '    CASE WHEN LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39'))) <> '#39'0000'#39' and'
      
        '                                                                ' +
        '              LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39'))) <> '#39#39
      
        '                                                                ' +
        '         THEN '#39'-'#39'+LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39')))'
      
        '                                                                ' +
        '         ELSE '#39#39
      
        '                                                                ' +
        '    END    '
      
        '        '#9#9#9#9#9#9#9#9#9'            FROM BROKER.DBO.TREF_CLIENTE (NOLOC' +
        'K)'
      '        '#9#9#9#9#9#9#9#9#9'           WHERE NR_PROCESSO=P.NR_PROCESSO '
      
        '        '#9#9#9#9#9#9#9#9#9'             AND TP_REFERENCIA IN  (CASE WHEN P' +
        '.CD_PRODUTO = 1 '
      
        '        '#9#9#9#9#9#9#9'                                               TH' +
        'EN G.TP_PEDIDO_BUSCA_IMP '
      
        '        '#9#9#9#9#9#9#9'                                               EL' +
        'SE G.TP_PEDIDO_BUSCA '
      '        '#9#9#9#9#9#9#9'                                          END,'
      
        '        '#9#9#9#9#9#9#9'                                          CASE WH' +
        'EN G.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') THEN '#39'01'#39
      
        '                                                                ' +
        '                                                                ' +
        '                                   WHEN G.CD_GRUPO = '#39'155'#39
      
        '        '#9#9#9#9#9#9#9'                                               TH' +
        'EN '#39'02'#39
      
        '        '#9#9#9#9#9#9#9'                                               EL' +
        'SE '#39#39
      '        '#9#9#9#9#9#9#9'                                          END)'
      
        '        '#9#9#9#9#9#9#9'                --   ORDER BY TP_REFERENCIA DESC ' +
        '                                              '
      
        '        '#9#9#9#9#9#9#9'                   FOR XML PATH('#39#39')), 1, 2, '#39#39'),'#39 +
        #39'),1,500))  NM_REFERENCIA,'
      
        '        CASE WHEN ISNULL(S.CD_VIA_TRANSPORTE,SN.CD_VIA_TRANSPORT' +
        'E) <> '#39'01'#39'  '
      
        '             THEN (SELECT TOP 1 CONVERT(VARCHAR, ISNULL(P.QT_EMB' +
        'ALAGEM, '#39#39'))+'#39' - '#39'+'
      
        '                                                 ISNULL(E.DESCRI' +
        'CAO,'#39#39' )'
      
        '                     FROM BROKER.DBO.TPROCESSO_EMBALAGEM P (NOLO' +
        'CK), '
      
        '                          BROKER.DBO.TTP_EMBALAGEM       E (NOLO' +
        'CK)'
      #9#9#9#9'    WHERE P.CD_EMBALAGEM = E.CODIGO '
      #9#9#9#9'      AND P.NR_PROCESSO  = P.NR_PROCESSO)'
      
        '             ELSE (SELECT TOP 1 CONVERT(VARCHAR, ISNULL(VL_QTDE,' +
        ' '#39#39')) +'#39' - '#39'+'
      
        '                                                 ISNULL(NM_ESPEC' +
        'IE , '#39#39')'
      
        '                     FROM BROKER.DBO.TPROCESSO_CARGA_SOLTA (NOLO' +
        'CK)'
      '                    WHERE NR_PROCESSO = P.NR_PROCESSO)'
      '        END VOLUME,'
      '        LD.DESCRICAO NM_LOCAL_DESEMBARQUE,'
      '       CASE ISNULL(S.CD_VIA_TRANSPORTE,SN.CD_VIA_TRANSPORTE)'
      '            WHEN 1 THEN N.NM_EMBARCACAO '
      '            WHEN 4 THEN P.NR_VOO '
      '            WHEN 7 THEN P.NR_PLACA_VEICULO '
      '            ELSE '#39#39' '
      '       END NM_VEICULO,'
      '   '
      '       (SELECT DT_REALIZACAO '
      '          FROM BROKER.DBO.TFOLLOWUP F (NOLOCK)'
      '         WHERE F.NR_PROCESSO = P.NR_PROCESSO'
      '           AND F.CD_SERVICO  = P.CD_SERVICO          '
      '           AND CD_EVENTO     = '#39'162'#39') DT_ENTRADA,'
      '           '
      
        '       (SELECT CONVERT(DATETIME, CONVERT(VARCHAR, DT_REALIZACAO,' +
        ' 103), 103) '
      '          FROM BROKER.DBO.TFOLLOWUP F(NOLOCK)'
      '         WHERE F.NR_PROCESSO = P.NR_PROCESSO '
      '           AND F.CD_SERVICO  = P.CD_SERVICO'
      '           AND CD_EVENTO     = '#39'088'#39') DT_DESEMBARACO, '
      '           '
      '      LE.DESCRICAO NM_LOCAL_EMBARQUE,'
      '       '
      '       CASE WHEN P.CD_PRODUTO = 1 '
      '            THEN '#39'DI N'#186#39' '
      '            ELSE CASE WHEN (SELECT TOP 1 NR_RE '
      
        '                              FROM BROKER.DBO.TPROCESSO_EXP_RE (' +
        'NOLOCK)'
      
        '                             WHERE NR_PROCESSO = P.NR_PROCESSO) ' +
        'IS NOT NULL '
      '                      THEN  '#39'RE N'#186#39
      '                      ELSE  '#39'DUE N'#176#39
      '                  END     '
      '       END TIPO_DOC,'
      '       '
      '       CASE WHEN P.CD_PRODUTO = 1 '
      '            THEN NR_DI'
      '            ELSE ISNULL((SELECT TOP 1 NR_RE '
      
        '                          FROM BROKER.DBO.TPROCESSO_EXP_RE (NOLO' +
        'CK)'
      
        '                         WHERE NR_PROCESSO = P.NR_PROCESSO) , P.' +
        'CD_DUE)'
      '       END NR_DOC,'#9
      '       '#9#9#9#9'   '#9#9#9#9#9#9'   '#9#9#9#9#9#9'   '
      '       PESO.VL_PESO_BRUTO,'
      '       PESO.VL_PESO_LIQUIDO,'
      '       '
      '       CASE WHEN P.CD_PRODUTO = 1 '
      '            THEN (SELECT TOP 1 NM_EMPRESA '
      '                    FROM BROKER.DBO.TEMPRESA_EST (NOLOCK)'
      '                   WHERE CD_EMPRESA IN (SELECT CD_FORNECEDOR '
      
        '                                          FROM BROKER.DBO.TADICA' +
        'O_DE_IMPORTACAO (NOLOCK) '
      
        '                                         WHERE NR_PROCESSO = P.N' +
        'R_PROCESSO))'
      #9#9#9'ELSE '#39#39' '
      #9'   END NM_EXPORTADOR, '
      #9'   CONVERT(VARCHAR(300),'
      
        #9'   STUFF ((SELECT '#39','#39' + LTRIM(RTRIM(ISNULL(D.NR_DCTO_INSTRUCAO,' +
        ' '#39#39')))'
      
        '                 FROM BROKER.DBO.TDOCUMENTO_INSTRUCAO D WITH (NO' +
        'LOCK)'
      '                WHERE D.NR_PROCESSO   = P.NR_PROCESSO'
      '                AND D.CD_TIPO_DCTO_INSTR = '#39'01'#39'   '
      '              FOR XML PATH('#39#39')), 1, 1, '#39#39') ) AS FATURA_PROCESSO,'
      ' P.NR_CONHECIMENTO,'
      'ISNULL(EE.NM_EMPRESA, EN.NM_EMPRESA) AS IMPORTADOR'
      #9'   '
      'FROM BROKER.DBO.TPROCESSO             P   (NOLOCK)'
      
        'LEFT JOIN BROKER.DBO.TEMPRESA_EST EE (NOLOCK) ON EE.CD_EMPRESA =' +
        ' P.CD_IMPORTADOR'
      
        'INNER JOIN BROKER.DBO.TEMPRESA_NAC     EN (NOLOCK) ON EN.CD_EMPR' +
        'ESA       = P.CD_CLIENTE'
      
        'INNER JOIN BROKER.DBO.TGRUPO           G  (NOLOCK) ON G.CD_GRUPO' +
        '          = P.CD_GRUPO'
      
        'LEFT JOIN BROKER.DBO.TAREA             A  (NOLOCK) ON A.CD_AREA ' +
        '          = P.CD_AREA'
      
        'LEFT JOIN BROKER.DBO.TCLIENTE_CONTATO CCO (NOLOCK) ON CCO.CD_UNI' +
        'D_NEG     = P.CD_UNID_NEG '
      
        '                                                  AND CCO.CD_PRO' +
        'DUTO      = P.CD_PRODUTO '
      
        '                                                  AND CCO.CD_CLI' +
        'ENTE      = P.CD_CLIENTE'
      
        '                                                  AND CCO.CD_CON' +
        'TATO      = P.CD_CONTATO'
      
        'LEFT JOIN BROKER.DBO.TSERVICO         S   (NOLOCK) ON S.CD_SERVI' +
        'CO        = P.CD_SERVICO'
      
        'LEFT JOIN BROKER.DBO.TSERVICO_NOVO    SN  (NOLOCK) ON SN.CD_SERV' +
        'ICO       = P.CD_SERVICO'
      
        'LEFT JOIN BROKER.DBO.TVIA_TRANSPORTE  V   (NOLOCK) ON V.CD_VIA_T' +
        'RANSPORTE = ISNULL(S.CD_VIA_TRANSPORTE,SN.CD_VIA_TRANSPORTE)'
      
        'LEFT JOIN BROKER.DBO.TEMBARCACAO      N   (NOLOCK) ON N.CD_EMBAR' +
        'CACAO     = P.CD_EMBARCACAO'
      
        'LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE  LD  (NOLOCK) ON LD.CODIGO ' +
        '          = P.CD_LOCAL_DESEMBARQUE'
      
        'LEFT JOIN BROKER.DBO.TCLIENTE_CONTATO CC  (NOLOCK) ON CC.CD_CLIE' +
        'NTE       = P.CD_CLIENTE'
      
        '                                                  AND CC.CD_UNID' +
        '_NEG      = P.CD_UNID_NEG'
      
        '                                                  AND CC.CD_PROD' +
        'UTO       = P.CD_PRODUTO'
      
        '                                                  AND CC.CD_CONT' +
        'ATO       = P.CD_CONTATO'
      ''
      
        'LEFT  JOIN BROKER.DBO.TLOCAL_EMBARQUE  LE (NOLOCK) ON LE.CODIGO ' +
        '          = CD_LOCAL_EMBARQUE'
      ''
      
        'LEFT  JOIN BROKER.DBO.TAGENTE          AG (NOLOCK) ON AG.CD_AGEN' +
        'TE        = P.CD_AGENTE'
      ''
      'OUTER APPLY (SELECT P1.NR_PROCESSO,'
      '                   SUM(DISTINCT CASE P1.CD_PRODUTO  '
      '                                     WHEN 1  THEN DI.PB_CARGA'
      
        '                                     WHEN 2  THEN P1.VL_PESO_BRU' +
        'TO'
      '                                     WHEN 3  THEN DI.PB_CARGA'
      
        '                                     WHEN 10 THEN P1.VL_PESO_BRU' +
        'TO '
      '                                END) VL_PESO_BRUTO,'
      '                   SUM(DISTINCT CASE P1.CD_PRODUTO '
      '                                     WHEN 1  THEN DI.PL_CARGA'
      
        '                                     WHEN 2  THEN P1.VL_PESO_LIQ' +
        'UIDO'
      '                                     WHEN 3  THEN DI.PL_CARGA'
      
        '                                     WHEN 10 THEN P1.VL_PESO_LIQ' +
        'UIDO '
      '                                END) VL_PESO_LIQUIDO'
      'FROM BROKER.DBO.TPROCESSO                    P1 (NOLOCK)'
      
        'INNER JOIN BROKER.DBO.TDECLARACAO_IMPORTACAO DI (NOLOCK)  ON DI.' +
        'NR_PROCESSO = P1.NR_PROCESSO '
      
        '                                                         AND A.C' +
        'D_AREA      = P1.CD_AREA'
      
        'WHERE P1.NR_PROCESSO = P.NR_PROCESSO                            ' +
        '                           '
      'GROUP BY P1.NR_PROCESSO'
      ')                                         PESO       '
      'WHERE P.NR_PROCESSO = @NR_PROCESSO')
    Left = 152
    Top = 64
    object CapaBrokerNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object CapaBrokerPedidoCliente: TWideStringField
      FieldName = 'PedidoCliente'
      ReadOnly = True
      Size = 4000
    end
    object CapaBrokerNomeAnalista: TStringField
      FieldName = 'NomeAnalista'
      Size = 50
    end
    object CapaBrokerNR_DI: TStringField
      DisplayWidth = 30
      FieldName = 'NR_DI'
      FixedChar = True
      Size = 14
    end
    object CapaBrokerNR_PLACA_VEICULO: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      FixedChar = True
      Size = 15
    end
    object CapaBrokerDT_PRESENCA_CARGA: TDateTimeField
      FieldName = 'DT_PRESENCA_CARGA'
    end
    object CapaBrokerDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object CapaBrokerVL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
    end
    object CapaBrokerVL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
    end
    object CapaBrokerDescricao_1: TStringField
      FieldName = 'Descricao_1'
      FixedChar = True
      Size = 120
    end
    object CapaBrokerTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object CapaBrokerNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
    end
    object CapaBrokerNM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 50
    end
    object CapaBrokerNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Size = 50
    end
    object CapaBrokerNM_REFERENCIA: TWideStringField
      FieldName = 'NM_REFERENCIA'
      ReadOnly = True
      Size = 4000
    end
    object CapaBrokerVOLUME: TStringField
      FieldName = 'VOLUME'
      ReadOnly = True
      Size = 153
    end
    object CapaBrokerNM_LOCAL_EMBARQUE: TStringField
      FieldName = 'NM_LOCAL_EMBARQUE'
      Size = 50
    end
    object CapaBrokerNM_VEICULO: TStringField
      FieldName = 'NM_VEICULO'
      ReadOnly = True
      Size = 40
    end
    object CapaBrokerDT_ENTRADA: TDateTimeField
      FieldName = 'DT_ENTRADA'
      ReadOnly = True
    end
    object CapaBrokerTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      ReadOnly = True
      Size = 8
    end
    object CapaBrokerNR_DOC: TStringField
      FieldName = 'NR_DOC'
      ReadOnly = True
      Size = 30
    end
    object CapaBrokerDT_DESEMBARACO: TDateTimeField
      FieldName = 'DT_DESEMBARACO'
      ReadOnly = True
    end
    object CapaBrokerNM_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'NM_LOCAL_DESEMBARQUE'
      ReadOnly = True
      Size = 50
    end
    object CapaBrokerVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      ReadOnly = True
    end
    object CapaBrokerVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      ReadOnly = True
    end
    object CapaBrokerNM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      Size = 60
    end
    object CapaBrokerNM_DESPACHO: TStringField
      FieldName = 'NM_DESPACHO'
      ReadOnly = True
      Size = 12
    end
    object CapaBrokerNM_EXPORTADOR: TStringField
      FieldName = 'NM_EXPORTADOR'
      ReadOnly = True
      Size = 100
    end
    object CapaBrokerFATURA_PROCESSO: TStringField
      FieldName = 'FATURA_PROCESSO'
      ReadOnly = True
      Size = 300
    end
    object CapaBrokerNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object CapaBrokerIMPORTADOR: TStringField
      FieldName = 'IMPORTADOR'
      Size = 100
    end
  end
  object ItensDocumento: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'idFatura'
        DataType = ftSmallint
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'DECLARE @IDFATURA BIGINT'
      'SET @IDFATURA = :IDFATURA'
      ''
      'DECLARE @TAB_INVOICED TABLE'
      '       (TYPE VARCHAR(510),'
      '        ID BIGINT, '
      '        ITEM_ID BIGINT, '
      '        NR_PROCESSO VARCHAR(20), '
      '        NAME VARCHAR(510), '
      '        CODIGO_ITEM BIGINT,'
      '        VALORITEM NUMERIC(19,2)) '
      '        '
      'INSERT INTO @TAB_INVOICED'
      'SELECT   B.TYPE,'
      '         B.ID,         '
      '         II.ITEM_ID, '
      '         CC.CUSTOMID   AS NR_PROCESSO,'
      '         I.NAME,'
      '         I.ID AS CODIGO_ITEM,'
      '         SUM(II.PRICE) AS VALORITEM'
      'FROM MYINDAIAV2.DBO.BILLING                      B   (NOLOCK)'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED   BII (NOLOCK)ON ' +
        'BII.BILLING_ID = B.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED           II  (NOLOCK)ON ' +
        'II.ID          = BII.ITENSINVOICED_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE        CC  (NOLOCK)ON ' +
        'CC.ID          = II.CUSTOMCLEARANCE_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEM                   I   (NOLOCK)ON ' +
        'I.ID           = II.ITEM_ID'
      'WHERE B.ID=@IDFATURA'
      ''
      'GROUP BY I.NAME,'
      '         B.ID,'
      '         CC.CUSTOMID,'
      '         B.TYPE,'
      '         II.ITEM_ID ,'
      '         I.ID'
      ''
      'DECLARE @TAB_CASHREQUEST TABLE '
      '       (TYPE VARCHAR(510), '
      '        ID BIGINT, '
      '        NAME VARCHAR(510), '
      '        CODIGO_ITEM BIGINT, '
      '        NR_PROCESSO VARCHAR(20), '
      '        VALORITEMCLIENTE NUMERIC(19,2) )'
      ''
      'INSERT INTO @TAB_CASHREQUEST'
      ''
      'SELECT   B.TYPE,'
      '         B.ID,'
      '         I.NAME,'
      '         I.ID AS CODIGO_ITEM,'
      '         CC.CUSTOMID    AS NR_PROCESSO,'
      '         SUM(ICR.PRICE) AS VALORITEMCLIENTE'
      
        'FROM MYINDAIAV2.DBO.BILLING                               B   (N' +
        'OLOCK)'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING_CASHREQUESTED           BC  (N' +
        'OLOCK)ON BC.BILLING_ID=B.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED                   CR  (N' +
        'OLOCK)ON CR.ID=BC.CASHREQUESTS_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                 CC  (N' +
        'OLOCK)ON CC.ID = CR.CUSTOMCLEARANCE_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED CIC (N' +
        'OLOCK)ON CIC.CASHREQUESTED_ID=CR.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               ICR (N' +
        'OLOCK)ON ICR.ID=CIC.ITEMS_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEM                            I   (N' +
        'OLOCK)ON I.ID=ICR.ITEM_ID'
      'WHERE B.ID =@IDFATURA '
      '  AND  DESTINO=2 '
      'GROUP BY I.NAME,'
      '         B.ID,'
      '         CC.CUSTOMID,'
      '         B.TYPE,'
      '         I.ID'
      '         '
      '--UNION ALL'
      ''
      '--SELECT   B.TYPE,'
      '--         B.ID,'
      '--         I.NAME,'
      '--         I.ID AS CODIGO_ITEM,'
      '--         CC.CUSTOMID    AS NR_PROCESSO,'
      '--         SUM(ICR.PRICE) AS VALORITEMCLIENTE'
      
        '--FROM MYINDAIAV2.DBO.BILLING                               B   ' +
        '(NOLOCK)'
      
        '--INNER JOIN MYINDAIAV2.DBO.BILLING_CASHREQUESTED           BC  ' +
        '(NOLOCK)ON BC.BILLING_ID=B.ID'
      
        '--INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED                   CR  ' +
        '(NOLOCK)ON CR.ID=BC.CASHREQUESTS_ID'
      
        '--INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                 CC  ' +
        '(NOLOCK)ON CC.ID = CR.CUSTOMCLEARANCE_ID'
      
        '--INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED CIC ' +
        '(NOLOCK)ON CIC.CASHREQUESTED_ID=CR.ID'
      
        '--INNER JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               ICR ' +
        '(NOLOCK)ON ICR.ID=CIC.ITEMS_ID'
      
        '--INNER JOIN MYINDAIAV2.DBO.ITEM                            I   ' +
        '(NOLOCK)ON I.ID=ICR.ITEM_ID'
      
        '--LEFT JOIN @TAB_INVOICED                                   TI  ' +
        '        ON TI.CODIGO_ITEM = I.ID '
      '--WHERE B.ID =@IDFATURA '
      '--  AND DESTINO=1'
      '--  AND TI.NR_PROCESSO IS NULL  '
      '--GROUP BY I.NAME,'
      '--         B.ID,'
      '--         CC.CUSTOMID,'
      '--         B.TYPE,'
      '--         I.ID      '
      ''
      ''
      ''
      ''
      'SELECT ITEM, '
      '       SUM(VALORITEMCLIENTE) AS VALORITEMCLIENTE, '
      '       SUM(VALORITEM)        AS VALORITEM '
      ' FROM( '
      'SELECT CONVERT(VARCHAR(1000),SUBSTRING(ISNULL(ITEM, '#39#39') +'
      '       '#9#9#9#9#9#9#9#9#9'CASE WHEN ISNULL(ITEM_DESC,'#39#39') = '#39#39' '
      '       '#9#9#9#9#9#9#9#9#9'     THEN '#39#39
      '       '#9#9#9#9#9#9#9#9#9'     ELSE '#39'('#39'+ITEM_DESC +'#39')'#39
      '       '#9#9#9#9#9#9#9#9#9'END,1,1000)) AS ITEM,'
      '       VALORITEMCLIENTE, '
      '       VALORITEM'
      'FROM('
      'SELECT CASE WHEN (SELECT COUNT(DISTINCT II2.CUSTOMCLEARANCE_ID) '
      
        '                    FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII' +
        '2(NOLOCK)'
      
        '                   INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED    II2' +
        ' (NOLOCK)ON BII2.ITENSINVOICED_ID = II2.ID'
      '                  WHERE BILLING_ID = A.ID) > 1 '
      '                    AND A.TYPE = '#39'TAX_RECEIPT'#39' '
      '            THEN ISNULL(A.NAME, '#39#39')        +'#39' ('#39'+'
      '                 ISNULL(A.NR_PROCESSO, '#39#39') + '#39' - '#39' + '
      
        '                 ISNULL(STUFF((SELECT DISTINCT '#39', '#39'+  LTRIM(RTRI' +
        'M(ISNULL(CD_REFERENCIA,'#39#39'))) +'
      
        '       '#9#9#9#9#9#9#9#9#9'     CASE WHEN LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39')' +
        ')) <> '#39'0000'#39' and'
      
        '                                                       LTRIM(RTR' +
        'IM(ISNULL(NR_ITEM_PO,'#39#39'))) <> '#39#39
      
        '                                                  THEN '#39'-'#39'+LTRIM' +
        '(RTRIM(ISNULL(NR_ITEM_PO,'#39#39')))'
      '                                                  ELSE '#39#39
      '                                             END'
      
        '                                 FROM BROKER.DBO.TREF_CLIENTE (N' +
        'OLOCK) '
      '                                WHERE NR_PROCESSO=P.NR_PROCESSO '
      
        '                                  AND TP_REFERENCIA IN (CASE WHE' +
        'N P.CD_PRODUTO = 1 '
      '        '#9#9#9#9#9#9#9'                   THEN P.TP_PEDIDO_BUSCA_IMP '
      '        '#9#9#9#9#9#9#9'                   ELSE P.TP_PEDIDO_BUSCA '
      '        '#9#9#9#9#9#9#9'              END,'
      '        '#9#9#9#9#9#9#9'              CASE WHEN P.CD_GRUPO = '#39'155'#39
      '        '#9#9#9#9#9#9#9'                   THEN '#39'02'#39
      '        '#9#9#9#9#9#9#9'                   ELSE '#39#39
      '        '#9#9#9#9#9#9#9'              END)'
      '        '#9#9#9#9'       -- ORDER BY TP_REFERENCIA DESC     '
      '                  FOR XML PATH('#39#39')), 1, 1, '#39#39') +'#39')'#39', '#39#39')'
      '            ELSE  ISNULL(A.NAME , '#39#39')'
      '       END AS ITEM,'
      '       STUFF((SELECT TOP 50 '#39', '#39' + SENIORKEY'
      
        '                FROM MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED    ' +
        '                         BPR (NOLOCK)'
      
        '          INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED            ' +
        '          PR  (NOLOCK) ON PR.ID = BPR.PAYMENTS_ID'
      
        '          INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENT' +
        'REQUESTED PRIR(NOLOCK) ON PRIR.PAYMENTREQUESTED_ID = PR.ID'
      
        '          INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED        ' +
        '          IPR (NOLOCK) ON IPR.ID = PRIR.ITEMS_ID'
      '               WHERE PR.BILLING_ID = A.ID'
      '                 AND IPR.ITEM_ID   = A.ITEM_ID '
      '         FOR XML PATH('#39#39')), 1, 1, '#39#39')   ITEM_DESC,      '
      '       0 VALORITEMCLIENTE,'
      '       VALORITEM'
      'FROM @TAB_INVOICED A'
      'CROSS APPLY '
      '( SELECT P1.NR_PROCESSO, '
      '         P1.CD_GRUPO , '
      '         P1.CD_PRODUTO, '
      '         ISNULL(G.TP_PEDIDO_BUSCA,'#39'01'#39')     AS TP_PEDIDO_BUSCA,'
      
        '         ISNULL(G.TP_PEDIDO_BUSCA_IMP,'#39'01'#39') AS TP_PEDIDO_BUSCA_I' +
        'MP'
      '    FROM BROKER.DBO.TPROCESSO P1 WITH(NOLOCK) '
      '   INNER '
      
        '    JOIN BROKER.DBO.TGRUPO    G  (NOLOCK)ON G.CD_GRUPO    = P1.C' +
        'D_GRUPO    '
      '   WHERE P1.NR_PROCESSO = A.NR_PROCESSO     '
      ' ) P'
      ') TAB_A'
      ''
      ''
      'UNION ALL'
      ''
      ''
      
        'SELECT CONVERT(VARCHAR(1000), SUBSTRING( CASE WHEN (SELECT COUNT' +
        '(DISTINCT II2.CUSTOMCLEARANCE_ID) '
      
        '       '#9#9#9#9#9#9#9#9#9'              FROM MYINDAIAV2.DBO.BILLING_ITEMIN' +
        'VOICED BII2(NOLOCK)'
      
        '       '#9#9#9#9#9#9#9#9#9'        INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED  ' +
        '       II2 (NOLOCK) ON BII2.ITENSINVOICED_ID = II2.ID'
      '       '#9#9#9#9#9#9#9#9#9'             WHERE BILLING_ID=A.ID) > 1'
      '       '#9#9#9#9#9#9#9#9#9'               AND A.TYPE = '#39'TAX_RECEIPT'#39' '
      '       '#9#9#9#9#9#9#9#9#9'      THEN ISNULL(A.NAME, '#39#39') +'#39' ('#39'+'
      '       '#9#9#9#9#9#9#9#9#9'           ISNULL(A.NR_PROCESSO, '#39#39') + '#39' - '#39' + '
      
        '       '#9#9#9#9#9#9#9#9#9'           ISNULL(STUFF(( SELECT DISTINCT '#39', '#39' +' +
        ' LTRIM(RTRIM(ISNULL(CD_REFERENCIA,'#39#39'))) +'
      
        '       '#9#9#9#9#9#9#9#9#9'                                        CASE WHE' +
        'N LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39'))) <> '#39'0000'#39' and'
      
        '                                                                ' +
        '                          LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39'))) <>' +
        ' '#39#39
      
        '                                                                ' +
        '                     THEN '#39'-'#39'+LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39'))' +
        ')'
      
        '                                                                ' +
        '                     ELSE '#39#39
      
        '                                                                ' +
        '                END    '
      
        '       '#9#9#9#9#9#9#9#9#9'                            FROM BROKER.DBO.TREF' +
        '_CLIENTE (NOLOCK) '
      
        '       '#9#9#9#9#9#9#9#9#9'                           WHERE NR_PROCESSO = P' +
        '.NR_PROCESSO '
      
        '       '#9#9#9#9#9#9#9#9#9'                             AND TP_REFERENCIA I' +
        'N (CASE WHEN P.CD_PRODUTO = 1 '
      
        '        '#9#9#9#9#9#9#9'                                                 ' +
        '           THEN P.TP_PEDIDO_BUSCA_IMP '
      
        '        '#9#9#9#9#9#9#9'                                                 ' +
        '           ELSE P.TP_PEDIDO_BUSCA '
      
        '          '#9#9#9#9#9#9#9'                                               ' +
        '        END,'
      
        '        '#9#9#9#9#9#9#9'                                                 ' +
        '      CASE WHEN P.CD_GRUPO = '#39'155'#39
      
        '        '#9#9#9#9#9#9#9'                                                 ' +
        '           THEN '#39'02'#39
      
        '        '#9#9#9#9#9#9#9'                                                 ' +
        '           ELSE '#39#39
      
        '        '#9#9#9#9#9#9#9'                                                 ' +
        '      END)'
      
        '        '#9#9#9#9'                                            -- ORDER' +
        ' BY TP_REFERENCIA DESC   '
      
        '       '#9#9#9#9#9#9#9#9#9'                 FOR XML PATH('#39#39')  ), 1, 1, '#39#39') ' +
        ','#39#39')'
      '       '#9#9#9#9#9#9#9#9#9'     ELSE ISNULL(A.NAME, '#39#39')'
      '       '#9#9#9#9#9#9#9#9#9'END, 1, 1000)) AS ITEM,'
      '       VALORITEMCLIENTE,'
      '       0   AS VALORITEM'
      'FROM @TAB_CASHREQUEST A'
      'CROSS APPLY '
      '( SELECT P1.NR_PROCESSO, '
      '         P1.CD_GRUPO , '
      '         P1.CD_PRODUTO, '
      '         ISNULL(G.TP_PEDIDO_BUSCA,'#39'01'#39')     AS TP_PEDIDO_BUSCA,'
      
        '         ISNULL(G.TP_PEDIDO_BUSCA_IMP,'#39'01'#39') AS TP_PEDIDO_BUSCA_I' +
        'MP'
      '    FROM BROKER.DBO.TPROCESSO P1  (NOLOCK) '
      '   INNER '
      
        '    JOIN BROKER.DBO.TGRUPO    G   (NOLOCK)ON G.CD_GRUPO    = P1.' +
        'CD_GRUPO    '
      '   WHERE P1.NR_PROCESSO = A.NR_PROCESSO     '
      ' ) P'
      ''
      ')AS TAB'
      'GROUP BY ITEM')
    Left = 152
    Top = 168
    object ItensDocumentoItem: TWideStringField
      FieldName = 'Item'
      Size = 1000
    end
    object ItensDocumentoValorItem: TBCDField
      FieldName = 'ValorItem'
      Precision = 19
      Size = 2
    end
    object ItensDocumentoValorItemCliente: TFMTBCDField
      FieldName = 'ValorItemCliente'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object dsCapaMyIndaiaV2: TDataSource
    DataSet = cdsCapaMyIndaiaV2
    Left = 392
  end
  object dsCapaBroker: TDataSource
    DataSet = cdsCapaBroker
    Left = 392
    Top = 64
  end
  object dsItensDocumento: TDataSource
    DataSet = cdsItensDocumento
    Left = 400
    Top = 176
  end
  object ppCapaMyIndaiaV2: TppDBPipeline
    DataSource = dsCapaMyIndaiaV2
    UserName = 'CapaMyIndaiaV2'
    Left = 656
    Top = 8
    object ppCapaMyIndaiaV2ppField1: TppField
      FieldAlias = 'EmissaoExtenso'
      FieldName = 'EmissaoExtenso'
      FieldLength = 52
      DisplayWidth = 52
      Position = 0
    end
    object ppCapaMyIndaiaV2ppField2: TppField
      FieldAlias = 'Fatura'
      FieldName = 'Fatura'
      FieldLength = 255
      DisplayWidth = 255
      Position = 1
    end
    object ppCapaMyIndaiaV2ppField3: TppField
      FieldAlias = 'NomeCliente'
      FieldName = 'NomeCliente'
      FieldLength = 255
      DisplayWidth = 255
      Position = 2
    end
    object ppCapaMyIndaiaV2ppField4: TppField
      FieldAlias = 'BairroCliente'
      FieldName = 'BairroCliente'
      FieldLength = 255
      DisplayWidth = 255
      Position = 3
    end
    object ppCapaMyIndaiaV2ppField5: TppField
      FieldAlias = 'CNPJCliente'
      FieldName = 'CNPJCliente'
      FieldLength = 255
      DisplayWidth = 255
      Position = 4
    end
    object ppCapaMyIndaiaV2ppField6: TppField
      FieldAlias = 'EndCliente'
      FieldName = 'EndCliente'
      FieldLength = 255
      DisplayWidth = 255
      Position = 5
    end
    object ppCapaMyIndaiaV2ppField7: TppField
      FieldAlias = 'CidadeCliente'
      FieldName = 'CidadeCliente'
      FieldLength = 255
      DisplayWidth = 255
      Position = 6
    end
    object ppCapaMyIndaiaV2ppField8: TppField
      FieldAlias = 'UFCliente'
      FieldName = 'UFCliente'
      FieldLength = 255
      DisplayWidth = 255
      Position = 7
    end
    object ppCapaMyIndaiaV2ppField9: TppField
      FieldAlias = 'CepCliente'
      FieldName = 'CepCliente'
      FieldLength = 255
      DisplayWidth = 255
      Position = 8
    end
    object ppCapaMyIndaiaV2ppField10: TppField
      FieldAlias = 'inscEstadual'
      FieldName = 'inscEstadual'
      FieldLength = 255
      DisplayWidth = 255
      Position = 9
    end
    object ppCapaMyIndaiaV2ppField11: TppField
      FieldAlias = 'NOME_INDAIA'
      FieldName = 'NOME_INDAIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 10
    end
    object ppCapaMyIndaiaV2ppField12: TppField
      FieldAlias = 'END_INDAIA'
      FieldName = 'END_INDAIA'
      FieldLength = 58
      DisplayWidth = 58
      Position = 11
    end
    object ppCapaMyIndaiaV2ppField13: TppField
      FieldAlias = 'CIDADE_INDAIA'
      FieldName = 'CIDADE_INDAIA'
      FieldLength = 64
      DisplayWidth = 64
      Position = 12
    end
    object ppCapaMyIndaiaV2ppField14: TppField
      FieldAlias = 'CEP_INDAIA'
      FieldName = 'CEP_INDAIA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 13
    end
    object ppCapaMyIndaiaV2ppField15: TppField
      FieldAlias = 'TELFAX_INDAIA'
      FieldName = 'TELFAX_INDAIA'
      FieldLength = 52
      DisplayWidth = 52
      Position = 14
    end
    object ppCapaMyIndaiaV2ppField16: TppField
      FieldAlias = 'CPNJ'
      FieldName = 'CPNJ'
      FieldLength = 24
      DisplayWidth = 24
      Position = 15
    end
  end
  object ppItensDocumento: TppDBPipeline
    DataSource = dsItensDocumento
    UserName = 'ItensDocumento'
    Left = 664
    Top = 176
    object ppItensDocumentoppField1: TppField
      FieldAlias = 'Item'
      FieldName = 'Item'
      FieldLength = 1000
      DisplayWidth = 1000
      Position = 0
    end
    object ppItensDocumentoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ValorItem'
      FieldName = 'ValorItem'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 20
      Position = 1
    end
    object ppItensDocumentoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ValorItemCliente'
      FieldName = 'ValorItemCliente'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 2
    end
  end
  object dspCapaMyIndaiaV2: TDataSetProvider
    DataSet = CapaMyIndaiaV2
    Left = 272
  end
  object cdsCapaMyIndaiaV2: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'idFatura'
        ParamType = ptInput
        Size = -1
        Value = 0
      end>
    ProviderName = 'dspCapaMyIndaiaV2'
    Left = 528
    object cdsCapaMyIndaiaV2EmissaoExtenso: TWideStringField
      FieldName = 'EmissaoExtenso'
      ReadOnly = True
      Size = 52
    end
    object cdsCapaMyIndaiaV2Fatura: TWideStringField
      FieldName = 'Fatura'
      Size = 255
    end
    object cdsCapaMyIndaiaV2NomeCliente: TWideStringField
      FieldName = 'NomeCliente'
      Size = 255
    end
    object cdsCapaMyIndaiaV2BairroCliente: TWideStringField
      FieldName = 'BairroCliente'
      Size = 255
    end
    object cdsCapaMyIndaiaV2CNPJCliente: TWideStringField
      FieldName = 'CNPJCliente'
      Size = 255
    end
    object cdsCapaMyIndaiaV2EndCliente: TWideStringField
      FieldName = 'EndCliente'
      Size = 255
    end
    object cdsCapaMyIndaiaV2CidadeCliente: TWideStringField
      FieldName = 'CidadeCliente'
      Size = 255
    end
    object cdsCapaMyIndaiaV2UFCliente: TWideStringField
      FieldName = 'UFCliente'
      Size = 255
    end
    object cdsCapaMyIndaiaV2CepCliente: TWideStringField
      FieldName = 'CepCliente'
      Size = 255
    end
    object cdsCapaMyIndaiaV2inscEstadual: TWideStringField
      FieldName = 'inscEstadual'
      Size = 255
    end
    object cdsCapaMyIndaiaV2NOME_INDAIA: TStringField
      FieldName = 'NOME_INDAIA'
      FixedChar = True
      Size = 50
    end
    object cdsCapaMyIndaiaV2END_INDAIA: TStringField
      FieldName = 'END_INDAIA'
      ReadOnly = True
      Size = 58
    end
    object cdsCapaMyIndaiaV2CIDADE_INDAIA: TStringField
      FieldName = 'CIDADE_INDAIA'
      ReadOnly = True
      Size = 64
    end
    object cdsCapaMyIndaiaV2CEP_INDAIA: TStringField
      FieldName = 'CEP_INDAIA'
      ReadOnly = True
      Size = 14
    end
    object cdsCapaMyIndaiaV2TELFAX_INDAIA: TStringField
      FieldName = 'TELFAX_INDAIA'
      ReadOnly = True
      Size = 52
    end
    object cdsCapaMyIndaiaV2CPNJ: TStringField
      FieldName = 'CPNJ'
      ReadOnly = True
      Size = 24
    end
  end
  object dspCapaBroker: TDataSetProvider
    DataSet = CapaBroker
    Left = 272
    Top = 56
  end
  object cdsCapaBroker: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR_PROCESSO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'PedidoCliente'
        Attributes = [faReadonly]
        DataType = ftWideString
        Size = 4000
      end
      item
        Name = 'NomeAnalista'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NR_DI'
        Attributes = [faFixed]
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NR_PLACA_VEICULO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DT_PRESENCA_CARGA'
        DataType = ftDateTime
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VL_CIF_MN'
        DataType = ftFloat
      end
      item
        Name = 'VL_MLE_MN'
        DataType = ftFloat
      end
      item
        Name = 'Descricao_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 120
      end
      item
        Name = 'TX_MERCADORIA'
        DataType = ftMemo
      end
      item
        Name = 'NM_VIA_TRANSPORTE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NM_AREA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NM_CONTATO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NM_REFERENCIA'
        Attributes = [faReadonly]
        DataType = ftWideString
        Size = 4000
      end
      item
        Name = 'VOLUME'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 153
      end
      item
        Name = 'NM_LOCAL_EMBARQUE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NM_VEICULO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DT_ENTRADA'
        Attributes = [faReadonly]
        DataType = ftDateTime
      end
      item
        Name = 'TIPO_DOC'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NR_DOC'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DT_DESEMBARACO'
        Attributes = [faReadonly]
        DataType = ftDateTime
      end
      item
        Name = 'NM_LOCAL_DESEMBARQUE'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VL_PESO_BRUTO'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'VL_PESO_LIQUIDO'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'NM_AGENTE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NM_DESPACHO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NM_EXPORTADOR'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FATURA_PROCESSO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 300
      end
      item
        Name = 'NR_CONHECIMENTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IMPORTADOR'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ProcessoID'
        ParamType = ptInput
        Size = -1
        Value = 0
      end>
    ProviderName = 'dspCapaBroker'
    StoreDefs = True
    Left = 528
    Top = 64
    object cdsCapaBrokerNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object cdsCapaBrokerNomeAnalista: TStringField
      FieldName = 'NomeAnalista'
      Size = 50
    end
    object cdsCapaBrokerPedidoCliente: TWideStringField
      FieldName = 'PedidoCliente'
      ReadOnly = True
      Size = 4000
    end
    object cdsCapaBrokerNR_DI: TStringField
      FieldName = 'NR_DI'
      FixedChar = True
      Size = 10
    end
    object cdsCapaBrokerNR_PLACA_VEICULO: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      FixedChar = True
      Size = 15
    end
    object cdsCapaBrokerDT_PRESENCA_CARGA: TDateTimeField
      FieldName = 'DT_PRESENCA_CARGA'
    end
    object cdsCapaBrokerDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsCapaBrokerVL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
    end
    object cdsCapaBrokerVL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
    end
    object cdsCapaBrokerDescricao_1: TStringField
      FieldName = 'Descricao_1'
      FixedChar = True
      Size = 120
    end
    object cdsCapaBrokerTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object cdsCapaBrokerNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
    end
    object cdsCapaBrokerNM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 50
    end
    object cdsCapaBrokerNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Size = 50
    end
    object cdsCapaBrokerNM_REFERENCIA: TWideStringField
      FieldName = 'NM_REFERENCIA'
      ReadOnly = True
      Size = 4000
    end
    object cdsCapaBrokerVOLUME: TStringField
      FieldName = 'VOLUME'
      ReadOnly = True
      Size = 153
    end
    object cdsCapaBrokerNM_LOCAL_EMBARQUE: TStringField
      FieldName = 'NM_LOCAL_EMBARQUE'
      Size = 50
    end
    object cdsCapaBrokerNM_VEICULO: TStringField
      FieldName = 'NM_VEICULO'
      ReadOnly = True
      Size = 40
    end
    object cdsCapaBrokerDT_ENTRADA: TDateTimeField
      FieldName = 'DT_ENTRADA'
      ReadOnly = True
    end
    object cdsCapaBrokerTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      ReadOnly = True
      Size = 8
    end
    object cdsCapaBrokerNR_DOC: TStringField
      FieldName = 'NR_DOC'
      ReadOnly = True
      Size = 30
    end
    object cdsCapaBrokerDT_DESEMBARACO: TDateTimeField
      FieldName = 'DT_DESEMBARACO'
      ReadOnly = True
    end
    object cdsCapaBrokerNM_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'NM_LOCAL_DESEMBARQUE'
      ReadOnly = True
      Size = 50
    end
    object cdsCapaBrokerVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      ReadOnly = True
    end
    object cdsCapaBrokerVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      ReadOnly = True
    end
    object cdsCapaBrokerNM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      Size = 60
    end
    object cdsCapaBrokerNM_DESPACHO: TStringField
      FieldName = 'NM_DESPACHO'
      ReadOnly = True
      Size = 12
    end
    object cdsCapaBrokerNM_EXPORTADOR: TStringField
      FieldName = 'NM_EXPORTADOR'
      ReadOnly = True
      Size = 100
    end
    object cdsCapaBrokerFATURA_PROCESSO: TStringField
      FieldName = 'FATURA_PROCESSO'
      ReadOnly = True
      Size = 300
    end
    object cdsCapaBrokerNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object cdsCapaBrokerIMPORTADOR: TStringField
      FieldName = 'IMPORTADOR'
      Size = 30
    end
  end
  object dspItensDocumento: TDataSetProvider
    DataSet = ItensDocumento
    Left = 264
    Top = 168
  end
  object cdsItensDocumento: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'idFatura'
        ParamType = ptInput
        Size = -1
        Value = 0
      end>
    ProviderName = 'dspItensDocumento'
    Left = 528
    Top = 176
    object cdsItensDocumentoItem: TWideStringField
      FieldName = 'Item'
      Size = 1000
    end
    object cdsItensDocumentoValorItem: TBCDField
      FieldName = 'ValorItem'
      Precision = 19
      Size = 2
    end
    object cdsItensDocumentoValorItemCliente: TFMTBCDField
      FieldName = 'ValorItemCliente'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object ppCapaBroker: TppDBPipeline
    DataSource = dsCapaBroker
    UserName = 'CapaBroker'
    Left = 656
    Top = 72
    object ppCapaBrokerppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppCapaBrokerppField2: TppField
      FieldAlias = 'NomeAnalista'
      FieldName = 'NomeAnalista'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppCapaBrokerppField3: TppField
      FieldAlias = 'PedidoCliente'
      FieldName = 'PedidoCliente'
      FieldLength = 4000
      DisplayWidth = 4000
      Position = 2
    end
    object ppCapaBrokerppField4: TppField
      FieldAlias = 'NR_DI'
      FieldName = 'NR_DI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppCapaBrokerppField5: TppField
      FieldAlias = 'NR_PLACA_VEICULO'
      FieldName = 'NR_PLACA_VEICULO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppCapaBrokerppField6: TppField
      FieldAlias = 'DT_PRESENCA_CARGA'
      FieldName = 'DT_PRESENCA_CARGA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppCapaBrokerppField7: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppCapaBrokerppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_CIF_MN'
      FieldName = 'VL_CIF_MN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppCapaBrokerppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_MLE_MN'
      FieldName = 'VL_MLE_MN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppCapaBrokerppField10: TppField
      FieldAlias = 'Descricao_1'
      FieldName = 'Descricao_1'
      FieldLength = 120
      DisplayWidth = 120
      Position = 9
    end
    object ppCapaBrokerppField11: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppCapaBrokerppField12: TppField
      FieldAlias = 'NM_VIA_TRANSPORTE'
      FieldName = 'NM_VIA_TRANSPORTE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppCapaBrokerppField13: TppField
      FieldAlias = 'NM_AREA'
      FieldName = 'NM_AREA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object ppCapaBrokerppField14: TppField
      FieldAlias = 'NM_CONTATO'
      FieldName = 'NM_CONTATO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object ppCapaBrokerppField15: TppField
      FieldAlias = 'NM_REFERENCIA'
      FieldName = 'NM_REFERENCIA'
      FieldLength = 4000
      DisplayWidth = 4000
      Position = 14
    end
    object ppCapaBrokerppField16: TppField
      FieldAlias = 'VOLUME'
      FieldName = 'VOLUME'
      FieldLength = 153
      DisplayWidth = 153
      Position = 15
    end
    object ppCapaBrokerppField17: TppField
      FieldAlias = 'NM_LOCAL_EMBARQUE'
      FieldName = 'NM_LOCAL_EMBARQUE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 16
    end
    object ppCapaBrokerppField18: TppField
      FieldAlias = 'NM_VEICULO'
      FieldName = 'NM_VEICULO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 17
    end
    object ppCapaBrokerppField19: TppField
      FieldAlias = 'DT_ENTRADA'
      FieldName = 'DT_ENTRADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 18
    end
    object ppCapaBrokerppField20: TppField
      FieldAlias = 'TIPO_DOC'
      FieldName = 'TIPO_DOC'
      FieldLength = 8
      DisplayWidth = 8
      Position = 19
    end
    object ppCapaBrokerppField21: TppField
      FieldAlias = 'NR_DOC'
      FieldName = 'NR_DOC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 20
    end
    object ppCapaBrokerppField22: TppField
      FieldAlias = 'DT_DESEMBARACO'
      FieldName = 'DT_DESEMBARACO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
    object ppCapaBrokerppField23: TppField
      FieldAlias = 'NM_LOCAL_DESEMBARQUE'
      FieldName = 'NM_LOCAL_DESEMBARQUE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 22
    end
    object ppCapaBrokerppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_BRUTO'
      FieldName = 'VL_PESO_BRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppCapaBrokerppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_LIQUIDO'
      FieldName = 'VL_PESO_LIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppCapaBrokerppField26: TppField
      FieldAlias = 'NM_AGENTE'
      FieldName = 'NM_AGENTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 25
    end
    object ppCapaBrokerppField27: TppField
      FieldAlias = 'NM_DESPACHO'
      FieldName = 'NM_DESPACHO'
      FieldLength = 12
      DisplayWidth = 12
      Position = 26
    end
    object ppCapaBrokerppField28: TppField
      FieldAlias = 'NM_EXPORTADOR'
      FieldName = 'NM_EXPORTADOR'
      FieldLength = 100
      DisplayWidth = 100
      Position = 27
    end
    object ppCapaBrokerppField29: TppField
      FieldAlias = 'FATURA_PROCESSO'
      FieldName = 'FATURA_PROCESSO'
      FieldLength = 300
      DisplayWidth = 300
      Position = 28
    end
    object ppCapaBrokerppField30: TppField
      FieldAlias = 'NR_CONHECIMENTO'
      FieldName = 'NR_CONHECIMENTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 29
    end
    object ppCapaBrokerppField31: TppField
      FieldAlias = 'IMPORTADOR'
      FieldName = 'IMPORTADOR'
      FieldLength = 30
      DisplayWidth = 30
      Position = 30
    end
  end
  object ModelosDocumentos: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      'SELECT CONVERT(int, CD_UNID_NEG) AS CD_UNID_NEG, '
      '             CONVERT(int, CD_PRODUTO) AS CD_PRODUTO,'
      '             CONVERT(int, CD_MODULO) AS CD_ROTINA, '
      '             DESCRIAO AS DESCRICAO, '
      '             NM_PATH, '
      '             CD_GRUPO,'
      '             CD_TIPO_DOCTO'
      'FROM BROKER.dbo.TMODELO_DOC (NOLOCK)'
      'WHERE (CD_SISTEMA = 23)')
    Left = 152
    Top = 304
    object ModelosDocumentosCD_UNID_NEG: TIntegerField
      FieldName = 'CD_UNID_NEG'
      ReadOnly = True
    end
    object ModelosDocumentosCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      ReadOnly = True
    end
    object ModelosDocumentosCD_ROTINA: TIntegerField
      FieldName = 'CD_ROTINA'
      ReadOnly = True
    end
    object ModelosDocumentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 50
    end
    object ModelosDocumentosNM_PATH: TStringField
      FieldName = 'NM_PATH'
      FixedChar = True
      Size = 100
    end
    object ModelosDocumentosCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object ModelosDocumentosCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
  end
  object dspModelosDocumentos: TDataSetProvider
    DataSet = ModelosDocumentos
    Left = 272
    Top = 304
  end
  object dsModelosDocumentos: TDataSource
    DataSet = cdsModelosDocumentos
    Left = 400
    Top = 304
  end
  object cdsModelosDocumentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModelosDocumentos'
    Left = 528
    Top = 304
    object cdsModelosDocumentosCD_UNID_NEG: TIntegerField
      FieldName = 'CD_UNID_NEG'
      ReadOnly = True
    end
    object cdsModelosDocumentosCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      ReadOnly = True
    end
    object cdsModelosDocumentosCD_ROTINA: TIntegerField
      FieldName = 'CD_ROTINA'
      ReadOnly = True
    end
    object cdsModelosDocumentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 50
    end
    object cdsModelosDocumentosNM_PATH: TStringField
      FieldName = 'NM_PATH'
      FixedChar = True
      Size = 100
    end
    object cdsModelosDocumentosCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object cdsModelosDocumentosCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
  end
  object Report: TppReport
    AutoStop = False
    DataPipeline = ppItensDocumento
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\ddbroker\FaturamentoERP\Documentos\Modelos\relFatura_RPS.rtm'
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    PDFSettings.EmbedFontOptions = []
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 64
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppItensDocumento'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText33: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText33'
        Border.mmPadding = 0
        DataField = 'Item'
        DataPipeline = ppItensDocumento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppItensDocumento'
        mmHeight = 3440
        mmLeft = 7673
        mmTop = 0
        mmWidth = 145521
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText36: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText36'
        BlankWhenZero = True
        Border.mmPadding = 0
        DataField = 'ValorItem'
        DataPipeline = ppItensDocumento
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppItensDocumento'
        mmHeight = 3440
        mmLeft = 165894
        mmTop = 0
        mmWidth = 33602
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 66411
      mmPrintPosition = 0
      object SubNumerario: TppSubReport
        DesignLayer = ppDesignLayer2
        UserName = 'SubNumerario'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppNumerario'
        mmHeight = 8996
        mmLeft = 0
        mmTop = 11642
        mmWidth = 210000
        BandType = 8
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppNumerario
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Duplex = dpNone
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.SaveDeviceSettings = False
          PrinterSetup.mmMarginBottom = 0
          PrinterSetup.mmMarginLeft = 0
          PrinterSetup.mmMarginRight = 0
          PrinterSetup.mmMarginTop = 0
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '19.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppNumerario'
          object ppTitleBand1: TppTitleBand
            Background.Brush.Style = bsClear
            Border.mmPadding = 0
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            Border.mmPadding = 0
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppDBText52: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText52'
              Border.mmPadding = 0
              DataField = 'FP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3440
              mmLeft = 5821
              mmTop = 529
              mmWidth = 30163
              BandType = 4
              LayerName = Foreground
            end
            object ppLabel47: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label47'
              Border.mmPadding = 0
              Caption = 'R$'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              Transparent = True
              mmHeight = 3440
              mmLeft = 62177
              mmTop = 529
              mmWidth = 3704
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText53: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText53'
              Border.mmPadding = 0
              DataField = 'TotalNumerario'
              DataPipeline = ppNumerario
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppNumerario'
              mmHeight = 3387
              mmLeft = 68263
              mmTop = 529
              mmWidth = 20373
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText54: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText54'
              Border.mmPadding = 0
              DataField = 'DataNumerario'
              DataPipeline = ppNumerario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppNumerario'
              mmHeight = 3387
              mmLeft = 97367
              mmTop = 529
              mmWidth = 20108
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText41: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText1'
              Border.mmPadding = 0
              DataField = 'SeniorKey'
              DataPipeline = ppNumerario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppNumerario'
              mmHeight = 3440
              mmLeft = 38100
              mmTop = 529
              mmWidth = 20373
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppFooterBand2: TppFooterBand
            Visible = False
            Background.Brush.Style = bsClear
            Border.mmPadding = 0
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
          object ppSummaryBand2: TppSummaryBand
            Background.Brush.Style = bsClear
            Border.mmPadding = 0
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDesignLayers1: TppDesignLayers
            object ppDesignLayer1: TppDesignLayer
              UserName = 'Foreground'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
      object ppDBText39: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText39'
        Border.mmPadding = 0
        DataField = 'Honor'#225'rio'
        DataPipeline = ppTotaisFatura
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTotaisFatura'
        mmHeight = 3440
        mmLeft = 172773
        mmTop = 18785
        mmWidth = 28046
        BandType = 8
        LayerName = Foreground1
      end
      object ppDBText44: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText44'
        Border.mmPadding = 0
        DataField = 'valorTibutavel'
        DataPipeline = ppTotaisFatura
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTotaisFatura'
        mmHeight = 3440
        mmLeft = 172773
        mmTop = 39688
        mmWidth = 28046
        BandType = 8
        LayerName = Foreground1
      end
      object R1: TppRegion
        DesignLayer = ppDesignLayer2
        UserName = 'R1'
        Brush.Style = bsClear
        Caption = 'R1'
        Pen.Style = psClear
        ShiftRelativeTo = SubNumerario
        Stretch = True
        Transparent = True
        mmHeight = 15346
        mmLeft = 6879
        mmTop = 20373
        mmWidth = 112184
        BandType = 8
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppDBText50: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText50'
          Border.mmPadding = 0
          DataField = 'ir'
          DataPipeline = ppTotaisFatura
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTotaisFatura'
          mmHeight = 3440
          mmLeft = 68792
          mmTop = 26194
          mmWidth = 34925
          BandType = 8
          LayerName = Foreground1
        end
        object ppDBText51: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText501'
          Border.mmPadding = 0
          DataField = 'cofins'
          DataPipeline = ppTotaisFatura
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTotaisFatura'
          mmHeight = 3440
          mmLeft = 68792
          mmTop = 30692
          mmWidth = 34925
          BandType = 8
          LayerName = Foreground1
        end
        object ppLabel58: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label45'
          Border.mmPadding = 0
          Caption = 'RETEN'#199#195'O IMPOSTO DE RENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 3704
          mmLeft = 7938
          mmTop = 26194
          mmWidth = 53446
          BandType = 8
          LayerName = Foreground1
        end
        object ppLabel59: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label59'
          Border.mmPadding = 0
          Caption = 'RETEN'#199#195'O DE PIS/COFINS/CSLL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 3725
          mmLeft = 7938
          mmTop = 30692
          mmWidth = 53446
          BandType = 8
          LayerName = Foreground1
        end
        object ppLabel1: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label35'
          Border.mmPadding = 0
          Caption = 'TOTAL NUMER'#193'RIO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 3704
          mmLeft = 7938
          mmTop = 21960
          mmWidth = 40217
          BandType = 8
          LayerName = Foreground1
        end
      end
      object RegISS: TppRegion
        DesignLayer = ppDesignLayer2
        UserName = 'RegISS'
        Brush.Style = bsClear
        Caption = 'RegISS'
        Pen.Style = psClear
        ShiftRelativeTo = R1
        Stretch = True
        Transparent = True
        mmHeight = 4763
        mmLeft = 6879
        mmTop = 34660
        mmWidth = 112184
        BandType = 8
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLabel60: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label60'
          Border.mmPadding = 0
          Caption = 'I.S.S. retido na fonte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 3704
          mmLeft = 7938
          mmTop = 34925
          mmWidth = 26458
          BandType = 8
          LayerName = Foreground1
        end
        object ppDBText35: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText35'
          Border.mmPadding = 0
          DataField = 'iss'
          DataPipeline = ppTotaisFatura
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTotaisFatura'
          mmHeight = 3387
          mmLeft = 68792
          mmTop = 35190
          mmWidth = 34925
          BandType = 8
          LayerName = Foreground1
        end
      end
      object R2: TppRegion
        DesignLayer = ppDesignLayer2
        UserName = 'R2'
        Brush.Style = bsClear
        Caption = 'R2'
        Pen.Style = psClear
        ShiftRelativeTo = RegISS
        Stretch = True
        Transparent = True
        mmHeight = 11377
        mmLeft = 6879
        mmTop = 38365
        mmWidth = 112184
        BandType = 8
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppDBText61: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText61'
          Border.mmPadding = 0
          DataField = 'TpFatura'
          DataPipeline = ppTotaisFatura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppTotaisFatura'
          mmHeight = 4233
          mmLeft = 7938
          mmTop = 44451
          mmWidth = 54240
          BandType = 8
          LayerName = Foreground1
        end
        object ppDBText63: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText504'
          Border.mmPadding = 0
          DataField = 'TotalDescontadoImposto'
          DataPipeline = ppTotaisFatura
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTotaisFatura'
          mmHeight = 3704
          mmLeft = 68792
          mmTop = 44450
          mmWidth = 34925
          BandType = 8
          LayerName = Foreground1
        end
        object ppDBText65: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText65'
          Border.mmPadding = 0
          DataField = 'valorTibutavel'
          DataPipeline = ppTotaisFatura
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTotaisFatura'
          mmHeight = 3440
          mmLeft = 68792
          mmTop = 39158
          mmWidth = 34925
          BandType = 8
          LayerName = Foreground1
        end
        object ppLine47: TppLine
          DesignLayer = ppDesignLayer2
          UserName = 'Line19'
          Border.mmPadding = 0
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 1323
          mmLeft = 7672
          mmTop = 43392
          mmWidth = 110331
          BandType = 8
          LayerName = Foreground1
        end
        object ppDBText47: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText38'
          Border.mmPadding = 0
          DataField = 'TIPO_SALDO'
          DataPipeline = ppFaturamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFaturamento'
          mmHeight = 3704
          mmLeft = 7938
          mmTop = 39688
          mmWidth = 17463
          BandType = 8
          LayerName = Foreground1
        end
      end
      object ppDBText34: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText34'
        Border.mmPadding = 0
        DataField = 'TotalNumerario'
        DataPipeline = ppNumerario
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppNumerario'
        mmHeight = 3440
        mmLeft = 68792
        mmTop = 21960
        mmWidth = 34925
        BandType = 8
        LayerName = Foreground1
      end
    end
    object ppPageStyle2: TppPageStyle
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 297000
      mmPrintPosition = 0
      object ppLine50: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 109009
        mmLeft = 165100
        mmTop = 119063
        mmWidth = 2381
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label1'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'EMISS'#195'O:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3725
        mmLeft = 124619
        mmTop = 33602
        mmWidth = 48419
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel46: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label2'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'VENCIMENTO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3725
        mmLeft = 174890
        mmTop = 33602
        mmWidth = 26458
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel57: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label3'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'N/REFER'#202'NCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3725
        mmLeft = 124619
        mmTop = 47096
        mmWidth = 25135
        BandType = 10
        LayerName = PageLayer1
      end
      object ppImage8: TppImage
        DesignLayer = ppDesignLayer3
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        Picture.Data = {
          0A544A504547496D616765D0B30000FFD8FFE130554578696600004D4D002A00
          000008000B000B00020000002600000092011200030000000100010000011A00
          0500000001000000B8011B000500000001000000C00128000300000001000300
          00013100020000001E000000C80132000200000014000000E6013B0002000000
          13000000FA9C9D0001000000260000010DEA1C00070000080C00000133876900
          040000000100000940000011DC57696E646F77732050686F746F20456469746F
          722031302E302E31303031312E3136333834000005A550000027100005A55000
          00271041646F62652050686F746F73686F7020435336202857696E646F777329
          00323032303A30323A32382031363A31373A303300566572696469616E612050
          61756C656C6C610056006500720069006400690061006E006100200050006100
          75006C0065006C006C00610000001CEA00000008000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000008900300
          0200000014000009A69004000200000014000009BA9291000200000003393600
          00929200020000000339360000A001000300000001FFFF0000A0020004000000
          01000000A7A0030004000000010000003BEA1C00070000080C000009CE000000
          00323032303A30323A32302031373A34333A333100323032303A30323A323020
          31373A34333A3331001CEA000000080000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000601030003000000
          0100060000011A0005000000010000122A011B00050000000100001232012800
          03000000010002000002010004000000010000123A020200040000000100001E
          130000000000000048000000010000004800000001FFD8FFE20C584943435F50
          524F46494C4500010100000C484C696E6F021000006D6E74725247422058595A
          2007CE00020009000600310000616373704D5346540000000049454320735247
          420000000000000000000000010000F6D6000100000000D32D48502020000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000001163707274000001500000003364657363000001
          840000006C77747074000001F000000014626B70740000020400000014725859
          5A00000218000000146758595A0000022C000000146258595A00000240000000
          14646D6E640000025400000070646D6464000002C40000008876756564000003
          4C0000008676696577000003D4000000246C756D69000003F8000000146D6561
          730000040C0000002474656368000004300000000C725452430000043C000008
          0C675452430000043C0000080C625452430000043C0000080C74657874000000
          00436F70797269676874202863292031393938204865776C6574742D5061636B
          61726420436F6D70616E79000064657363000000000000001273524742204945
          4336313936362D322E3100000000000000000000001273524742204945433631
          3936362D322E3100000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000058595A20000000
          000000F35100010000000116CC58595A20000000000000000000000000000000
          0058595A200000000000006FA2000038F50000039058595A2000000000000062
          990000B785000018DA58595A2000000000000024A000000F840000B6CF646573
          63000000000000001649454320687474703A2F2F7777772E6965632E63680000
          0000000000000000001649454320687474703A2F2F7777772E6965632E636800
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000064657363000000000000002E49454320363139
          36362D322E312044656661756C742052474220636F6C6F757220737061636520
          2D207352474200000000000000000000002E4945432036313936362D322E3120
          44656661756C742052474220636F6C6F7572207370616365202D207352474200
          0000000000000000000000000000000000000000006465736300000000000000
          2C5265666572656E63652056696577696E6720436F6E646974696F6E20696E20
          49454336313936362D322E3100000000000000000000002C5265666572656E63
          652056696577696E6720436F6E646974696F6E20696E2049454336313936362D
          322E310000000000000000000000000000000000000000000000000000766965
          77000000000013A4FE00145F2E0010CF140003EDCC0004130B00035C9E000000
          0158595A2000000000004C09560050000000571FE76D65617300000000000000
          01000000000000000000000000000000000000028F0000000273696720000000
          004352542063757276000000000000040000000005000A000F00140019001E00
          230028002D00320037003B00400045004A004F00540059005E00630068006D00
          720077007C00810086008B00900095009A009F00A400A900AE00B200B700BC00
          C100C600CB00D000D500DB00E000E500EB00F000F600FB01010107010D011301
          19011F0125012B01320138013E0145014C0152015901600167016E0175017C01
          83018B0192019A01A101A901B101B901C101C901D101D901E101E901F201FA02
          03020C0214021D0226022F02380241024B0254025D02670271027A0284028E02
          9802A202AC02B602C102CB02D502E002EB02F50300030B03160321032D033803
          43034F035A03660372037E038A039603A203AE03BA03C703D303E003EC03F904
          0604130420042D043B0448045504630471047E048C049A04A804B604C404D304
          E104F004FE050D051C052B053A05490558056705770586059605A605B505C505
          D505E505F6060606160627063706480659066A067B068C069D06AF06C006D106
          E306F507070719072B073D074F076107740786079907AC07BF07D207E507F808
          0B081F08320846085A086E0882089608AA08BE08D208E708FB09100925093A09
          4F09640979098F09A409BA09CF09E509FB0A110A270A3D0A540A6A0A810A980A
          AE0AC50ADC0AF30B0B0B220B390B510B690B800B980BB00BC80BE10BF90C120C
          2A0C430C5C0C750C8E0CA70CC00CD90CF30D0D0D260D400D5A0D740D8E0DA90D
          C30DDE0DF80E130E2E0E490E640E7F0E9B0EB60ED20EEE0F090F250F410F5E0F
          7A0F960FB30FCF0FEC1009102610431061107E109B10B910D710F51113113111
          4F116D118C11AA11C911E81207122612451264128412A312C312E31303132313
          431363138313A413C513E5140614271449146A148B14AD14CE14F01512153415
          561578159B15BD15E0160316261649166C168F16B216D616FA171D1741176517
          8917AE17D217F7181B18401865188A18AF18D518FA19201945196B199119B719
          DD1A041A2A1A511A771A9E1AC51AEC1B141B3B1B631B8A1BB21BDA1C021C2A1C
          521C7B1CA31CCC1CF51D1E1D471D701D991DC31DEC1E161E401E6A1E941EBE1E
          E91F131F3E1F691F941FBF1FEA20152041206C209820C420F0211C2148217521
          A121CE21FB22272255228222AF22DD230A23382366239423C223F0241F244D24
          7C24AB24DA250925382568259725C725F726272657268726B726E82718274927
          7A27AB27DC280D283F287128A228D429062938296B299D29D02A022A352A682A
          9B2ACF2B022B362B692B9D2BD12C052C392C6E2CA22CD72D0C2D412D762DAB2D
          E12E162E4C2E822EB72EEE2F242F5A2F912FC72FFE3035306C30A430DB311231
          4A318231BA31F2322A3263329B32D4330D3346337F33B833F1342B3465349E34
          D83513354D358735C235FD3637367236AE36E937243760379C37D73814385038
          8C38C839053942397F39BC39F93A363A743AB23AEF3B2D3B6B3BAA3BE83C273C
          653CA43CE33D223D613DA13DE03E203E603EA03EE03F213F613FA23FE2402340
          6440A640E74129416A41AC41EE4230427242B542F7433A437D43C04403444744
          8A44CE45124555459A45DE4622466746AB46F04735477B47C04805484B489148
          D7491D496349A949F04A374A7D4AC44B0C4B534B9A4BE24C2A4C724CBA4D024D
          4A4D934DDC4E254E6E4EB74F004F494F934FDD5027507150BB51065150519B51
          E65231527C52C75313535F53AA53F65442548F54DB5528557555C2560F565C56
          A956F75744579257E0582F587D58CB591A596959B85A075A565AA65AF55B455B
          955BE55C355C865CD65D275D785DC95E1A5E6C5EBD5F0F5F615FB36005605760
          AA60FC614F61A261F56249629C62F06343639763EB6440649464E9653D659265
          E7663D669266E8673D679367E9683F689668EC6943699A69F16A486A9F6AF76B
          4F6BA76BFF6C576CAF6D086D606DB96E126E6B6EC46F1E6F786FD1702B708670
          E0713A719571F0724B72A67301735D73B87414747074CC7528758575E1763E76
          9B76F8775677B37811786E78CC792A798979E77A467AA57B047B637BC27C217C
          817CE17D417DA17E017E627EC27F237F847FE5804780A8810A816B81CD823082
          9282F4835783BA841D848084E3854785AB860E867286D7873B879F8804886988
          CE8933899989FE8A648ACA8B308B968BFC8C638CCA8D318D988DFF8E668ECE8F
          368F9E9006906E90D6913F91A89211927A92E3934D93B69420948A94F4955F95
          C99634969F970A977597E0984C98B89924999099FC9A689AD59B429BAF9C1C9C
          899CF79D649DD29E409EAE9F1D9F8B9FFAA069A0D8A147A1B6A226A296A306A3
          76A3E6A456A4C7A538A5A9A61AA68BA6FDA76EA7E0A852A8C4A937A9A9AA1CAA
          8FAB02AB75ABE9AC5CACD0AD44ADB8AE2DAEA1AF16AF8BB000B075B0EAB160B1
          D6B24BB2C2B338B3AEB425B49CB513B58AB601B679B6F0B768B7E0B859B8D1B9
          4AB9C2BA3BBAB5BB2EBBA7BC21BC9BBD15BD8FBE0ABE84BEFFBF7ABFF5C070C0
          ECC167C1E3C25FC2DBC358C3D4C451C4CEC54BC5C8C646C6C3C741C7BFC83DC8
          BCC93AC9B9CA38CAB7CB36CBB6CC35CCB5CD35CDB5CE36CEB6CF37CFB8D039D0
          BAD13CD1BED23FD2C1D344D3C6D449D4CBD54ED5D1D655D6D8D75CD7E0D864D8
          E8D96CD9F1DA76DAFBDB80DC05DC8ADD10DD96DE1CDEA2DF29DFAFE036E0BDE1
          44E1CCE253E2DBE363E3EBE473E4FCE584E60DE696E71FE7A9E832E8BCE946E9
          D0EA5BEAE5EB70EBFBEC86ED11ED9CEE28EEB4EF40EFCCF058F0E5F172F1FFF2
          8CF319F3A7F434F4C2F550F5DEF66DF6FBF78AF819F8A8F938F9C7FA57FAE7FB
          77FC07FC98FD29FDBAFE4BFEDCFF6DFFFFFFED000C41646F62655F434D0002FF
          EE000E41646F626500648000000001FFDB0084000C08080809080C09090C110B
          0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E1014
          0E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108003900A00301
          2200021101031101FFDD0004000AFFC4013F0000010501010101010100000000
          000000030001020405060708090A0B0100010501010101010100000000000000
          010002030405060708090A0B1000010401030204020507060805030C33010002
          110304211231054151611322718132061491A1B14223241552C16233347282D1
          4307259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B3
          84C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
          E6F637475767778797A7B7C7D7E7F71100020201020404030405060707060535
          0100021103213112044151617122130532819114A1B14223C152D1F0332462E1
          728292435315637334F1250616A2B283072635C2D2449354A317644555367465
          E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6
          C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F54260
          4AC6E81F5BBA27D61B6FABA5DAFB1F8C03AC0FADCCD1C5CD6C7A81BFB8B64C41
          9E3BAE47EA33BEA29C9CDFF9ACD736EDACFB4EEF5BE8CBFD3DBF6925BF4B7FD0
          4401477FD897AF4962E27D6FE8399D62EE8B45E4E7631B05AC2C735A3D13177E
          95CDF4FDAB3B37FC667D55C6B9D4516DBD42C6187FD8EB36B41FF8DF654FFF00
          ADBD2E13B5229EAD25C862FF008D2FAA775C29BECBF05E7FEE4D4E68F9BABF57
          6AEB29BA9BEA65D43DB6D5600EAEC610E6B9A756B98F6FB5CD7246246E294CD2
          547AAF5BE93D1A817F54CAAF16B74ECDE7DCE8FA5E9D6DDD659B67F31AB9B3FE
          357EAD389FB3539B94C1FE129A096FFD3756E48449D829EC962E27D6FE8799D7
          2DE8345AF3D42973DAF61ADE1B357F39FA42DD8AB749FF00181F55FAAE43712A
          CA38F94F20368C969A9C49E18D2FFD1B9FFC8F5171BF573FFCAE750FF8CCAFC8
          D4E10D257A50B4D6EFAAA4ABE7F50C1E9D8CECACFBD98D8ECE6CB1C1A27F744F
          D27FF2172F6FF8D2FAAE1E5B8A32B3834C1763D0E2DFFC17D24D11276087B049
          7214FF008D3FAA8EB05792EC9C2278FB450E6FFE7BF55751859D87D431999785
          733231EC12CB6B70734FCDBF9CD48C48DC29CD6FD6DE88EFAC07EAE8B5FF00B4
          8123D3F4DDB6457F6A3FA58F4FF995B2B90ADDF51BFE7D96B1AEFF009CDB9D2E
          FD36D9F43DFDFECBFD0FFD77AEB2EBA9A2A75B73DB5D6CD5CF71803E651236A0
          751D547466B26CFAC78A73DDD3F129BB36F668F34069634FE70B6D7BD8D66CFC
          FF00FB6FF9D5573FEB0F47CCA1F8B45F92F0603ECC2ADE5D1DD8DBB639ADDDFC
          850E9BD6BEAD74CA598B532CC269D26EA9ED2E3FBCFB1CDF7394B1C320099427
          29748D57F852619658922B24231FD29583FE0C5E8D242C6CAC7CAA85D8D636DA
          9DC3D86469D9154045685981BD43FFD0F543C15E59FE26BFE51EAFFD4ABFEAEE
          5EA6782BCB3FC4D7FCA3D5FF00A957FD5DCA48FC93FF0007F348D8B9D87D31DD
          5BFC64F52E9A6D7D58D91939433856E2D3663B5DEA598A5CC877A7916B29AEDF
          E42F5EC3C1C3C0A1B8D854578F430436BA9A1AD1F26AF31FAABFFE563A9FFC66
          67FD5B17AAA59771E415270FEB8F48C0EA9F57F39B97535EFA68B2DA2D206FAD
          F5B5D656FADFF49BEE6FBBF7D9EC5CA7F8A7EAAEC7FAB1D4DF92E2717A73DD7B
          473B586BF5EE6563F77731F66DFDF7AEE3AF7FC87D47FF000ADDFF009EDEBCFF
          00FC5461B73FEAEF5CC17BB6B72A2973B9816526B2EFFA4947F9B37DC286C83E
          A574A3F5DFADE67D63FAC3FAC558EE6B29C576B56E336328DBFF0071B12BDBFA
          2FF0F6DBEADDFE13D5F54AEBAEA636BA9ADAEB6886B1A00007F25AD5E61FE2BF
          AA0E89D4B3BEAB756FD572DF683487E80DCD1E9594EFFF00866369B717FD3B3F
          EB6BD452CB7C55D3F47C945CBEBDF56BA3FD60C4762F52A1AF24115DE0016D67
          B3E9B7E9376FFDB7FE9179A7D47A7371FF00C645B8FD42D76465D0DC8AAEBDC4
          9361AC36B65B2EF77E92B6B3E92F57CFCFC3E9B876E7675CDC7C6A1BBACB5E74
          03FEFCE77D1631BEFB1EBCA3EA3E7BBA97F8C8B7A8B98EABED8DC8BD95BB470A
          DE01A377FD676238EF867DA94362F59F59BEA4750FAC7F58B1B2F3B2EBFD898B
          B630C6F0F207BEFF00E46FC87FE8DD6B5DFD1D6F8EB1F563A6D6DC519D83875D
          621B4FAB5541A0766D7B9BB579D7AB91F5DFEBC65747EB19B6E2F4DC57DC29C0
          ADDB03CE3BBD2156DFA2EC877BF22EB1FEA5BE97A95D3E9FF82EE713EA07D4EC
          40055D2A87C77B81B8FF00ECCBAD4242A848F4D828B57EB07D6AFA8593D3AEC5
          EA39D8D9B558D2DF46922F7924437D0F47D4D976EFE6ECFCC5CDFF00896B6D1F
          B5F1CB8FA6D38F6061E03DDEB31EE8FDF736BAFD4FEA2ED3399F55FEAC61D9D5
          1F898B82CA41DAEAAAAEB7B9D076D34EC6B5CFB6CFCD62E27FC4BEEFB475A2E0
          41231C99EC49C93AA23F9B9EFD374F42C69FFF002D6EFEB3BFF6C576FD73A165
          757CBC7DF7B5B834C17D3077124FE91ED74EDDFE9FE8ABFF0045FA45C3D3FF00
          E5ADDFD777FED8AE9732CBFAC7D627F4CC8C87E361D4E2C6D559D85E5AD6D8E9
          77E7D96EFF00CEFA14B3F47FA4FD2296225C42513C3C18F88CAB8A87F5583993
          1E18C651E2E3222237C367FAC7F75E93ED1D3706B6D3EAD38D5B043585CD6000
          7912154CCEB9F571D43EBC9CCC6B6A7887561EDB0B81FCDF4EBDEF727A3EACF4
          0A0433029779D8DF50FF009D76F72B1657D2BA650FCA7574E2D55097581AD640
          FEC8517EAEF4E391BF089FFBB4FEB2B5E088AD779FFEAB79EFA984B33F3AA6EE
          6D6E631ED63B98DCF6D46C6FFA6F4767A8BAD5C97D5279B3ABE7DA4169B9A2DD
          AEFA403ECB1ED0FF00E5ED5D6A7735FCE9F28FFD159CA7F331F397FD393FFFD1
          F543A885C97D4BFAB7D03A166667ECCEA7F6EBF21AD16545F5B8B431CFF76DA7
          DDF49FB5747D5A8AB27A5E5E3DB79C4AEDA6C63F243834D6D734B5D6EF77B5BE
          9FD258DD17A2E7556F4F7DF5F4E6E3F4EA4B29BF1AB26CB03DBB1AFA6C76DFB2
          54F6BB7DAC67AFEB3D381D0EBBA46CD6C2FAB3D07A4FD6FBBAB9EA7FE50CD758
          E18763EB1AE4381DAC6696FD21FA2FDF5D365E7616130D9977D78EC024BAC706
          E83BFBBFACB98CDFAA39F637AAE155F64BB1BACDCEBACCBC9639F914FA901CDA
          DA3DB7FD97FEF37F494FD9BFB0B4733A6620EBBD2B2B2EFADE2AA2EC3A29BC6F
          B6CB2C15BFD563BF7FD1C7B7D6F6A475AB37A29BD9391D37A8D77F4A6E5D66DC
          9A1C0B2B7B4D82BB5BB7D5633DDF9AFDEB07A1F4AE8FF5199F62664DB956F53B
          EB0DADDB37374F4FD676DD9E9E3B3FC25AFF00F8BFE714BA7FD4CFB060746A7D
          5A45DD272ECCABAF6D7B4BD967DA26A63A77B3DB7D7BFDDE9FE850FAA7D5EB72
          7A966D98D938F737AED421973C8865758C77ED6561DF6CC46B6D65EDAB7D1E9E
          459EAFA888AD45E8A6EFD6CFAAFF0055FACD3EBF5ADB8D656D21B9AD78AAC6B4
          7BB69B1FFA3B58DFDDB996FA7FE0D62E47D55EA7D2AA66CFAE991878AEF6D432
          836CD00FA35BEDBEBFA2CFDC6ADFCAFAB35645BD0DAF732EC5E8DB83EBBDBEA1
          B07A2716A77BF77BD8FDB6FBD47AA744CD7F5BAFAD610A325EDC738A7172E763
          01717FAF8D631B67A4F76ED991FA3FD3549096C2D4E37FCC8E9E7D0EA5D7FA8E
          67D6468B2B1456E76EA26D732B65BF67ADCFFD16E76F7FE97D2F4FF9CF515E3F
          56FA2F48FAD0FF00ACF97D48D3764EE6B29BDEC6D7AB1956D61743F6555B3FEB
          6AC5BD103BA3E1F4275D8D4E5B2DAF2FD3A6BF4AA2DA322BCBBDB8D8C1CED95B
          77FA4A5D4FA1E73BAD3BABE1B71B29D7630C57E3E6825B5805CEF531EC636CDB
          5DBEA7EB546CFD37FA44ACF7535BEB07D40E87D7F21BD4EBB2CC2CE3B5E32F15
          C06F223D2B5EDF735CF67F83BAAF4ADFF8459A7EADF5BC6C86603FEBBDCDB1F1
          B28B18C37107E87BECC8759B9FF9ABA7FAB5D2C749E8B8F82DBC648AC39DEA37
          467BDCEB7650D976CA2BDFB2966EFE6D6167FD4BCDC87F50C66DB5DB89D5724E
          4DB75AE77A8CDDE9FE85D5B07E9FECDE97F939FEB51F664848ED7A0DB450F36C
          74DFA99D1B13A9D395D4B36FEB1D5EA1EAE33B3EDDE6B0D3EEB71717E8B5AC7B
          D9EEFD2FA36FA7E9FA6B1B37EA7FD5FE9F73BADE2FD61CAE9787D4EE6B37E35A
          36BDD6BCB8575E4D7F4ABDFBFF009CF53D2FF48BA3FAC7F56ECEBB6D15BAD6E3
          63D15D919158272B7BC7A5E932EFCCC3B6BFE9957FDAAFE69367741CECCFABD8
          982E6E1D79B876D1732B656462138EF0F6D4DAA37D34DB53767B3E87F51212F1
          DF7535723EABF47C1FAD5FF3BF2B3DD45AE76955858DA89753F63DA091BDDFA3
          FD22D3EA9D1BA4F526B736CB3D2739AD2DCAADE0070FA54B8BBE83F6CFE86CFE
          73FD1D8ABF5BE839995D531FAB62581D6D143F1FECCF7963407B9961C8C6B5AC
          B7D1BFD9E8DFFA2FD3E2FE8BF46A8BFEAAB2DFAB2FFAAEDC8A5B90EB19959158
          0E3586BB23ED4FAEBA9CEF52BA1DE9BEB62319904484883B7F82894232152163
          B360E3E5D75633F1FADE4E4E3E55ADA6AB2AAEBBF576EFD23EFF0077E89BE9FB
          AD46B3A7F44C1C8A6FEB3D40E46403BE819D73435A469EA558FF00A3ABDBFE93
          67B158EB1D086737A5B318B31ABE9B9B5666C0DF696D4DB59E956D66DD9BBD55
          4BA8740EA03AB67750C366266B7A9D2CA2CAB3C39C29F4C166DA76876FC3BB77
          A97E27E8FF004FFA4F511F7647A817FBA2303FE34568C50D3735FBD294BFE926
          CEE81835645D9E3A85DD3BD72E75AF658D60D46EB3F4960FA3EDF53F91F98B6E
          9731D531D5BBD461682D7CCEE047B5FBBF3B72E72FFAA74B3A2F46E9F9194DBB
          17A25D5E464599425B632965AD2D32EDB5575FABFA263DDE9D5457E9FBD74753
          AA754C7525AEA9CD06B2C82D2D23D859B7DBB76A6CE664059E2AD13184637C22
          ACD97FFFD2F47EB7876E7F46CEC2A369B7271EDAABDF21BB9EC731BBE377B755
          CDE77D5DEB25FEFA19D46B3854E361B0643B1DB85756DDB75CCDA3F48DB6CF4E
          EFB657FAED5E97A1E9FA6BB2493E37D122DE37A9E3656366608EAA2CEAB5D782
          DADCFDB7B6B6E4B0FE9B2AAFB132FF00532B2A7DB53EB65D5FA5FAB5DFA4B958
          E89D2BEB01C5E877E6BDDEAE36264B335B7D8E369B6EF4FECE5EE66EF73767E9
          1FEA7AB52EA924B5A0978FE93F577ABD6DC9C7C9ADACA7270ACC6C8B2EB8DD65
          973CBF6D8D7D1E8FDA29D8FF007E466D3FB43FC17F36AC74AE85D5F1B17A254D
          2DC2FD9F85938D92D6BCDA3D67FA0CC7C8AD8E1B2E6EFA6CBF659FCDFA9E9AEA
          1248F17828DBCA742E8BD5B0F2319D6E232AC8C7AAC6E667BB2EDB7ED56381FD
          2FA1EDF51B6DDFA777DADBFAAFF338C87D1FA27D60C6EA7D3F2EDADB48A8E433
          AA16DC5C2FF546FC7B2BDC1D764538D6FD0FB7DBF6B67AABAF492D75D95AB959
          D81D42EEB1465E3D81B8F5E264D2F697107D5B5D8EEA1FB00DBEDF46CF7ACCE9
          DF56BA861E4F49BBD41EDC37D1D709B6C79C8B4B182AB1DBFF009ED97FADFA67
          7A76B2BF62EA12405D23578BC6FAB5D6717A2749C06D6D14F4EB2E199815580B
          723739CEC7C965990DD9636BB1DEBFD8F2BF47EFFF0081A95AA3EADF53B70BA6
          E1675AE762D59375B998E6F792287B6EFB260FAD5B69FB4D5458EA37D6FF00D1
          FE67F375AEA924E3C5E1B94EAF29D5BEAD756CEBFAD6436D1EB5DF67774479BA
          C6FA0FAD81B73DBB47EAEEB2CFA5E97F3DFE110FEB0743FAC19F959A71D8C0FB
          28ADBD3B31B7161AACAE2D7D96EE0EB31EEF59AE6D7F6067A76D4FFD6575E924
          38B4DBC3FE6AB5794EAFD1FACE5750BF26CC56F50AB268AD98753B25F8E30AD1
          FD23DD47F39EAD9B2EFB6E3FEB9FA3FB3FF35E9A2F50E89F58EF39C70F35B8D6
          5F81463E3DBBDE76DD5BDEFC83F9D654DBEB77A5F6A6BFED357F3BFCE3174C92
          1AE9B2B578FA3A175C14F52FB0D43A3D59180EC6A30C643AD9CB2DDACEA1EBB7
          FA3FA4DFD17A8CFD3E4FF3F91EFAAB56FF0060754C2CDCAB3A5398CC7C8E9C6A
          F4EDBAD8767077B326D757FA66FE87DB6E5536B321EBA54923C5AAB578BC4FAB
          9D71A32AB6D628C4CCE94FC3763D96877EB71B5B9573286FA4E65AD7FA7F68DD
          664BFF00ED42EABA5635989D2F0F16DDA2CC7A2BA9FB356EE631AC76CFE4FB55
          A49095F541B7FFD9FFED278450686F746F73686F7020332E30003842494D0404
          00000000003E1C015A00031B25471C020000024DC11C02500012566572696469
          616E61205061756C656C6C611C0237000832303230303232301C023C00063137
          343333313842494D0425000000000010EFAA8401380DF49554E16C5C17047F5A
          3842494D043A0000000000F9000000100000000100000000000B7072696E744F
          7574707574000000050000000050737453626F6F6C0100000000496E7465656E
          756D00000000496E746500000000436C726D0000000F7072696E745369787465
          656E426974626F6F6C000000000B7072696E7465724E616D6554455854000000
          0100000000000F7072696E7450726F6F6653657475704F626A63000000160043
          006F006E00660069006700750072006100E700E3006F00200064006500200050
          0072006F0076006100000000000A70726F6F6653657475700000000100000000
          426C746E656E756D0000000C6275696C74696E50726F6F660000000970726F6F
          66434D594B003842494D043B00000000022D0000001000000001000000000012
          7072696E744F75747075744F7074696F6E7300000017000000004370746E626F
          6F6C0000000000436C6272626F6F6C00000000005267734D626F6F6C00000000
          0043726E43626F6F6C0000000000436E7443626F6F6C00000000004C626C7362
          6F6F6C00000000004E677476626F6F6C0000000000456D6C44626F6F6C000000
          0000496E7472626F6F6C000000000042636B674F626A63000000010000000000
          0052474243000000030000000052642020646F7562406FE00000000000000000
          0047726E20646F7562406FE0000000000000000000426C2020646F7562406FE0
          00000000000000000042726454556E744623526C740000000000000000000000
          00426C6420556E744623526C7400000000000000000000000052736C74556E74
          4623526C7440BA6E8F480000000000000A766563746F7244617461626F6F6C01
          0000000050675073656E756D0000000050675073000000005067504300000000
          4C656674556E744623526C74000000000000000000000000546F7020556E7446
          23526C7400000000000000000000000053636C20556E74462350726340590000
          000000000000001063726F705768656E5072696E74696E67626F6F6C00000000
          0E63726F7052656374426F74746F6D6C6F6E67000000000000000C63726F7052
          6563744C6566746C6F6E67000000000000000D63726F70526563745269676874
          6C6F6E67000000000000000B63726F7052656374546F706C6F6E670000000000
          3842494D03ED000000000010005DFAE100020002005DFAE1000200023842494D
          042600000000000E000000000000000000003F8000003842494D040D00000000
          00040000001E3842494D04190000000000040000001E3842494D03F300000000
          0009000000000000000001003842494D271000000000000A0001000000000000
          00023842494D03F5000000000048002F66660001006C66660006000000000001
          002F6666000100A1999A0006000000000001003200000001005A000000060000
          00000001003500000001002D000000060000000000013842494D03F800000000
          00700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D04080000000000100000
          00010000024000000240000000003842494D041E000000000004000000003842
          494D041A00000000035B0000000600000000000000000000003B000000A70000
          00130066006100740075007200610073005F0069006E0064006100690061005F
          0032003000320030000000010000000000000000000000000000000000000001
          0000000000000000000000A70000003B00000000000000000000000000000000
          010000000000000000000000000000000000000010000000010000000000006E
          756C6C0000000200000006626F756E64734F626A630000000100000000000052
          6374310000000400000000546F70206C6F6E6700000000000000004C6566746C
          6F6E67000000000000000042746F6D6C6F6E670000003B00000000526768746C
          6F6E67000000A700000006736C69636573566C4C73000000014F626A63000000
          01000000000005736C6963650000001200000007736C69636549446C6F6E6700
          0000000000000767726F757049446C6F6E6700000000000000066F726967696E
          656E756D0000000C45536C6963654F726967696E0000000D6175746F47656E65
          72617465640000000054797065656E756D0000000A45536C6963655479706500
          000000496D672000000006626F756E64734F626A630000000100000000000052
          6374310000000400000000546F70206C6F6E6700000000000000004C6566746C
          6F6E67000000000000000042746F6D6C6F6E670000003B00000000526768746C
          6F6E67000000A70000000375726C54455854000000010000000000006E756C6C
          54455854000000010000000000004D7367655445585400000001000000000006
          616C74546167544558540000000100000000000E63656C6C5465787449734854
          4D4C626F6F6C010000000863656C6C5465787454455854000000010000000000
          09686F727A416C69676E656E756D0000000F45536C696365486F727A416C6967
          6E0000000764656661756C740000000976657274416C69676E656E756D000000
          0F45536C69636556657274416C69676E0000000764656661756C740000000B62
          67436F6C6F7254797065656E756D0000001145536C6963654247436F6C6F7254
          797065000000004E6F6E6500000009746F704F75747365746C6F6E6700000000
          0000000A6C6566744F75747365746C6F6E67000000000000000C626F74746F6D
          4F75747365746C6F6E67000000000000000B72696768744F75747365746C6F6E
          6700000000003842494D042800000000000C000000023FF00000000000003842
          494D041100000000000101003842494D0414000000000004000000013842494D
          040C000000001E2F00000001000000A000000039000001E000006AE000001E13
          00180001FFD8FFE20C584943435F50524F46494C4500010100000C484C696E6F
          021000006D6E74725247422058595A2007CE0002000900060031000061637370
          4D5346540000000049454320735247420000000000000000000000010000F6D6
          000100000000D32D485020200000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000001163707274
          000001500000003364657363000001840000006C77747074000001F000000014
          626B707400000204000000147258595A00000218000000146758595A0000022C
          000000146258595A0000024000000014646D6E640000025400000070646D6464
          000002C400000088767565640000034C0000008676696577000003D400000024
          6C756D69000003F8000000146D6561730000040C000000247465636800000430
          0000000C725452430000043C0000080C675452430000043C0000080C62545243
          0000043C0000080C7465787400000000436F7079726967687420286329203139
          3938204865776C6574742D5061636B61726420436F6D70616E79000064657363
          0000000000000012735247422049454336313936362D322E3100000000000000
          0000000012735247422049454336313936362D322E3100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000058595A20000000000000F35100010000000116CC58595A20
          0000000000000000000000000000000058595A200000000000006FA2000038F5
          0000039058595A2000000000000062990000B785000018DA58595A2000000000
          000024A000000F840000B6CF6465736300000000000000164945432068747470
          3A2F2F7777772E6965632E636800000000000000000000001649454320687474
          703A2F2F7777772E6965632E6368000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000064657363
          000000000000002E4945432036313936362D322E312044656661756C74205247
          4220636F6C6F7572207370616365202D20735247420000000000000000000000
          2E4945432036313936362D322E312044656661756C742052474220636F6C6F75
          72207370616365202D2073524742000000000000000000000000000000000000
          0000000064657363000000000000002C5265666572656E63652056696577696E
          6720436F6E646974696F6E20696E2049454336313936362D322E310000000000
          0000000000002C5265666572656E63652056696577696E6720436F6E64697469
          6F6E20696E2049454336313936362D322E310000000000000000000000000000
          00000000000000000000000076696577000000000013A4FE00145F2E0010CF14
          0003EDCC0004130B00035C9E0000000158595A2000000000004C095600500000
          00571FE76D656173000000000000000100000000000000000000000000000000
          0000028F00000002736967200000000043525420637572760000000000000400
          00000005000A000F00140019001E00230028002D00320037003B00400045004A
          004F00540059005E00630068006D00720077007C00810086008B00900095009A
          009F00A400A900AE00B200B700BC00C100C600CB00D000D500DB00E000E500EB
          00F000F600FB01010107010D01130119011F0125012B01320138013E0145014C
          0152015901600167016E0175017C0183018B0192019A01A101A901B101B901C1
          01C901D101D901E101E901F201FA0203020C0214021D0226022F02380241024B
          0254025D02670271027A0284028E029802A202AC02B602C102CB02D502E002EB
          02F50300030B03160321032D03380343034F035A03660372037E038A039603A2
          03AE03BA03C703D303E003EC03F9040604130420042D043B0448045504630471
          047E048C049A04A804B604C404D304E104F004FE050D051C052B053A05490558
          056705770586059605A605B505C505D505E505F6060606160627063706480659
          066A067B068C069D06AF06C006D106E306F507070719072B073D074F07610774
          0786079907AC07BF07D207E507F8080B081F08320846085A086E0882089608AA
          08BE08D208E708FB09100925093A094F09640979098F09A409BA09CF09E509FB
          0A110A270A3D0A540A6A0A810A980AAE0AC50ADC0AF30B0B0B220B390B510B69
          0B800B980BB00BC80BE10BF90C120C2A0C430C5C0C750C8E0CA70CC00CD90CF3
          0D0D0D260D400D5A0D740D8E0DA90DC30DDE0DF80E130E2E0E490E640E7F0E9B
          0EB60ED20EEE0F090F250F410F5E0F7A0F960FB30FCF0FEC1009102610431061
          107E109B10B910D710F511131131114F116D118C11AA11C911E8120712261245
          1264128412A312C312E31303132313431363138313A413C513E5140614271449
          146A148B14AD14CE14F01512153415561578159B15BD15E0160316261649166C
          168F16B216D616FA171D17411765178917AE17D217F7181B18401865188A18AF
          18D518FA19201945196B199119B719DD1A041A2A1A511A771A9E1AC51AEC1B14
          1B3B1B631B8A1BB21BDA1C021C2A1C521C7B1CA31CCC1CF51D1E1D471D701D99
          1DC31DEC1E161E401E6A1E941EBE1EE91F131F3E1F691F941FBF1FEA20152041
          206C209820C420F0211C2148217521A121CE21FB22272255228222AF22DD230A
          23382366239423C223F0241F244D247C24AB24DA250925382568259725C725F7
          26272657268726B726E827182749277A27AB27DC280D283F287128A228D42906
          2938296B299D29D02A022A352A682A9B2ACF2B022B362B692B9D2BD12C052C39
          2C6E2CA22CD72D0C2D412D762DAB2DE12E162E4C2E822EB72EEE2F242F5A2F91
          2FC72FFE3035306C30A430DB3112314A318231BA31F2322A3263329B32D4330D
          3346337F33B833F1342B3465349E34D83513354D358735C235FD3637367236AE
          36E937243760379C37D738143850388C38C839053942397F39BC39F93A363A74
          3AB23AEF3B2D3B6B3BAA3BE83C273C653CA43CE33D223D613DA13DE03E203E60
          3EA03EE03F213F613FA23FE24023406440A640E74129416A41AC41EE42304272
          42B542F7433A437D43C044034447448A44CE45124555459A45DE4622466746AB
          46F04735477B47C04805484B489148D7491D496349A949F04A374A7D4AC44B0C
          4B534B9A4BE24C2A4C724CBA4D024D4A4D934DDC4E254E6E4EB74F004F494F93
          4FDD5027507150BB51065150519B51E65231527C52C75313535F53AA53F65442
          548F54DB5528557555C2560F565C56A956F75744579257E0582F587D58CB591A
          596959B85A075A565AA65AF55B455B955BE55C355C865CD65D275D785DC95E1A
          5E6C5EBD5F0F5F615FB36005605760AA60FC614F61A261F56249629C62F06343
          639763EB6440649464E9653D659265E7663D669266E8673D679367E9683F6896
          68EC6943699A69F16A486A9F6AF76B4F6BA76BFF6C576CAF6D086D606DB96E12
          6E6B6EC46F1E6F786FD1702B708670E0713A719571F0724B72A67301735D73B8
          7414747074CC7528758575E1763E769B76F8775677B37811786E78CC792A7989
          79E77A467AA57B047B637BC27C217C817CE17D417DA17E017E627EC27F237F84
          7FE5804780A8810A816B81CD8230829282F4835783BA841D848084E3854785AB
          860E867286D7873B879F8804886988CE8933899989FE8A648ACA8B308B968BFC
          8C638CCA8D318D988DFF8E668ECE8F368F9E9006906E90D6913F91A89211927A
          92E3934D93B69420948A94F4955F95C99634969F970A977597E0984C98B89924
          999099FC9A689AD59B429BAF9C1C9C899CF79D649DD29E409EAE9F1D9F8B9FFA
          A069A0D8A147A1B6A226A296A306A376A3E6A456A4C7A538A5A9A61AA68BA6FD
          A76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC5CACD0AD44ADB8AE2D
          AEA1AF16AF8BB000B075B0EAB160B1D6B24BB2C2B338B3AEB425B49CB513B58A
          B601B679B6F0B768B7E0B859B8D1B94AB9C2BA3BBAB5BB2EBBA7BC21BC9BBD15
          BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1E3C25FC2DBC358C3D4C451C4CE
          C54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9B9CA38CAB7CB36CBB6CC35CCB5
          CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1BED23FD2C1D344D3C6D449D4CB
          D54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9F1DA76DAFBDB80DC05DC8ADD10
          DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE253E2DBE363E3EBE473E4FCE584
          E60DE696E71FE7A9E832E8BCE946E9D0EA5BEAE5EB70EBFBEC86ED11ED9CEE28
          EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3A7F434F4C2F550F5DEF66DF6FB
          F78AF819F8A8F938F9C7FA57FAE7FB77FC07FC98FD29FDBAFE4BFEDCFF6DFFFF
          FFED000C41646F62655F434D0002FFEE000E41646F626500648000000001FFDB
          0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513131811
          0C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11
          110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0CFFC0001108003900A003012200021101031101FFDD0004000AFFC401
          3F0000010501010101010100000000000000030001020405060708090A0B0100
          010501010101010100000000000000010002030405060708090A0B1000010401
          030204020507060805030C330100021103042112310541516113227181320614
          91A1B14223241552C16233347282D14307259253F0E1F163733516A2B2832644
          93546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4
          A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F71100
          0202010204040304050607070605350100021103213112044151617122130532
          819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B28307
          2635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4
          E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA
          000C03010002110311003F00F542604AC6E81F5BBA27D61B6FABA5DAFB1F8C03
          AC0FADCCD1C5CD6C7A81BFB8B64C419E3BAE47EA33BEA29C9CDFF9ACD736EDAC
          FB4EEF5BE8CBFD3DBF6925BF4B7FD04401477FD897AF4962E27D6FE8399D62EE
          8B45E4E7631B05AC2C735A3D13177E95CDF4FDAB3B37FC667D55C6B9D4516DBD
          42C6187FD8EB36B41FF8DF654FFF00ADBD2E13B5229EAD25C862FF008D2FAA77
          5C29BECBF05E7FEE4D4E68F9BABF576AEB29BA9BEA65D43DB6D5600EAEC610E6
          B9A756B98F6FB5CD7246246E294CD2547AAF5BE93D1A817F54CAAF16B74ECDE7
          DCE8FA5E9D6DDD659B67F31AB9B3FE357EAD389FB3539B94C1FE129A096FFD37
          56E48449D829EC962E27D6FE8799D72DE8345AF3D42973DAF61ADE1B357F39FA
          42DD8AB749FF00181F55FAAE43712ACA38F94F20368C969A9C49E18D2FFD1B9F
          FC8F5171BF573FFCAE750FF8CCAFC8D4E10D257A50B4D6EFAAA4ABE7F50C1E9D
          8CECACFBD98D8ECE6CB1C1A27F744FD27FF2172F6FF8D2FAAE1E5B8A32B3834C
          1763D0E2DFFC17D24D11276087B0497214FF008D3FAA8EB05792EC9C2278FB45
          0E6FFE7BF55751859D87D431999785733231EC12CB6B70734FCDBF9CD48C48DC
          29CD6FD6DE88EFAC07EAE8B5FF00B48123D3F4DDB6457F6A3FA58F4FF995B2B9
          0ADDF51BFE7D96B1AEFF009CDB9D2EFD36D9F43DFDFECBFD0FFD77AEB2EBA9A2
          A75B73DB5D6CD5CF71803E651236A0751D547466B26CFAC78A73DDD3F129BB36
          F668F34069634FE70B6D7BD8D66CFCFF00FB6FF9D5573FEB0F47CCA1F8B45F92
          F0603ECC2ADE5D1DD8DBB639ADDDFC850E9BD6BEAD74CA598B532CC269D26EA9
          ED2E3FBCFB1CDF7394B1C32009942729748D57F852619658922B24231FD29583
          FE0C5E8D242C6CAC7CAA85D8D636DA9DC3D86469D9154045685981BD43FFD0F5
          43C15E59FE26BFE51EAFFD4ABFEAEE5EA6782BCB3FC4D7FCA3D5FF00A957FD5D
          CA48FC93FF0007F348D8B9D87D31DD5BFC64F52E9A6D7D58D91939433856E2D3
          663B5DEA598A5CC877A7916B29AEDFE42F5EC3C1C3C0A1B8D854578F430436BA
          9A1AD1F26AF31FAABFFE563A9FFC6667FD5B17AAA59771E415270FEB8F48C0EA
          9F57F39B97535EFA68B2DA2D206FADF5B5D656FADFF49BEE6FBBF7D9EC5CA7F8
          A7EAAEC7FAB1D4DF92E2717A73DD7B473B586BF5EE6563F77731F66DFDF7AEE3
          AF7FC87D47FF000ADDFF009EDEBCFF00FC5461B73FEAEF5CC17BB6B72A2973B9
          816526B2EFFA4947F9B37DC286C83EA574A3F5DFADE67D63FAC3FAC558EE6B29
          C576B56E336328DBFF0071B12BDBFA2FF0F6DBEADDFE13D5F54AEBAEA636BA9A
          DAEB6886B1A00007F25AD5E61FE2BFAA0E89D4B3BEAB756FD572DF683487E80D
          CD1E9594EFFF00866369B717FD3B3FEB6BD452CB7C55D3F47C945CBEBDF56BA3
          FD60C4762F52A1AF24115DE0016D67B3E9B7E9376FFDB7FE9179A7D47A7371FF
          00C645B8FD42D76465D0DC8AAEBDC49361AC36B65B2EF77E92B6B3E92F57CFCF
          C3E9B876E7675CDC7C6A1BBACB5E7403FEFCE77D1631BEFB1EBCA3EA3E7BBA97
          F8C8B7A8B98EABED8DC8BD95BB470ADE01A377FD676238EF867DA94362F59F59
          BEA4750FAC7F58B1B2F3B2EBFD898BB630C6F0F207BEFF00E46FC87FE8DD6B5D
          FD1D6F8EB1F563A6D6DC519D83875D621B4FAB5541A0766D7B9BB579D7AB91F5
          DFEBC65747EB19B6E2F4DC57DC29C0ADDB03CE3BBD2156DFA2EC877BF22EB1FE
          A5BE97A95D3E9FF82EE713EA07D4EC40055D2A87C77B81B8FF00ECCBAD4242A8
          48F4D828B57EB07D6AFA8593D3AEC5EA39D8D9B558D2DF46922F7924437D0F47
          D4D976EFE6ECFCC5CDFF00896B6D1FB5F1CB8FA6D38F6061E03DDEB31EE8FDF7
          36BAFD4FEA2ED3399F55FEAC61D9D51F898B82CA41DAEAAAAEB7B9D076D34EC6
          B5CFB6CFCD62E27FC4BEEFB475A2E041231C99EC49C93AA23F9B9EFD374F42C6
          9FFF002D6EFEB3BFF6C576FD73A165757CBC7DF7B5B834C17D3077124FE91ED7
          4EDDFE9FE8ABFF0045FA45C3D3FF00E5ADDFD777FED8AE9732CBFAC7D627F4CC
          8C87E361D4E2C6D559D85E5AD6D8E977E7D96EFF00CEFA14B3F47FA4FD229622
          5C42513C3C18F88CAB8A87F55839931E18C651E2E3222237C367FAC7F75E93ED
          1D3706B6D3EAD38D5B043585CD60007912154CCEB9F571D43EBC9CCC6B6A7887
          561EDB0B81FCDF4EBDEF727A3EACF40A0433029779D8DF50FF009D76F72B1657
          D2BA650FCA7574E2D55097581AD640FEC8517EAEF4E391BF089FFBB4FEB2B5E0
          88AD779FFEAB79EFA984B33F3AA6EE6D6E631ED63B98DCF6D46C6FFA6F4767A8
          BAD5C97D5279B3ABE7DA4169B9A2DDAEFA403ECB1ED0FF00E5ED5D6A7735FCE9
          F28FFD159CA7F331F397FD393FFFD1F543A885C97D4BFAB7D03A166667ECCEA7
          F6EBF21AD16545F5B8B431CFF76DA7DDF49FB5747D5A8AB27A5E5E3DB79C4AED
          A6C63F243834D6D734B5D6EF77B5BE9FD258DD17A2E7556F4F7DF5F4E6E3F4EA
          4B29BF1AB26CB03DBB1AFA6C76DFB254F6BB7DAC67AFEB3D381D0EBBA46CD6C2
          FAB3D07A4FD6FBBAB9EA7FE50CD758E18763EB1AE4381DAC6696FD21FA2FDF5D
          365E7616130D9977D78EC024BAC706E83BFBBFACB98CDFAA39F637AAE155F64B
          B1BACDCEBACCBC9639F914FA901CDADA3DB7FD97FEF37F494FD9BFB0B4733A66
          20EBBD2B2B2EFADE2AA2EC3A29BC6FB6CB2C15BFD563BF7FD1C7B7D6F6A475AB
          37A29BD9391D37A8D77F4A6E5D66DC9A1C0B2B7B4D82BB5BB7D5633DDF9AFDEB
          07A1F4AE8FF5199F62664DB956F53BEB0DADDB37374F4FD676DD9E9E3B3FC25A
          FF00F8BFE714BA7FD4CFB060746A7D5A45DD272ECCABAF6D7B4BD967DA26A63A
          77B3DB7D7BFDDE9FE850FAA7D5EB727A966D98D938F737AED421973C8865758C
          77ED6561DF6CC46B6D65EDAB7D1E9E459EAFA888AD45E8A6EFD6CFAAFF0055FA
          CD3EBF5ADB8D656D21B9AD78AAC6B47BB69B1FFA3B58DFDDB996FA7FE0D62E47
          D55EA7D2AA66CFAE991878AEF6D432836CD00FA35BEDBEBFA2CFDC6ADFCAFAB3
          5645BD0DAF732EC5E8DB83EBBDBEA1B07A2716A77BF77BD8FDB6FBD47AA744CD
          7F5BAFAD610A325EDC738A7172E76301717FAF8D631B67A4F76ED991FA3FD354
          9096C2D4E37FCC8E9E7D0EA5D7FA8E67D6468B2B1456E76EA26D732B65BF67AD
          CFFD16E76F7FE97D2F4FF9CF515E3F56FA2F48FAD0FF00ACF97D48D3764EE6B2
          9BDEC6D7AB1956D61743F6555B3FEB6AC5BD103BA3E1F4275D8D4E5B2DAF2FD3
          A6BF4AA2DA322BCBBDB8D8C1CED95B77FA4A5D4FA1E73BAD3BABE1B71B29D763
          0C57E3E6825B5805CEF531EC636CDB5DBEA7EB546CFD37FA44ACF7535BEB07D4
          0E87D7F21BD4EBB2CC2CE3B5E32F15C06F223D2B5EDF735CF67F83BAAF4ADFF8
          459A7EADF5BC6C86603FEBBDCDB1F1B28B18C37107E87BECC8759B9FF9ABA7FA
          B5D2C749E8B8F82DBC648AC39DEA37467BDCEB7650D976CA2BDFB2966EFE6D61
          67FD4BCDC87F50C66DB5DB89D5724E4DB75AE77A8CDDE9FE85D5B07E9FECDE97
          F939FEB51F664848ED7A0DB450F36C74DFA99D1B13A9D395D4B36FEB1D5EA1EA
          E33B3EDDE6B0D3EEB71717E8B5AC7BD9EEFD2FA36FA7E9FA6B1B37EA7FD5FE9F
          73BADE2FD61CAE9787D4EE6B37E35A36BDD6BCB8575E4D7F4ABDFBFF009CF53D
          2FF48BA3FAC7F56ECEBB6D15BAD6E363D15D919158272B7BC7A5E932EFCCC3B6
          BFE9957FDAAFE69367741CECCFABD8982E6E1D79B876D1732B656462138EF0F6
          D4DAA37D34DB53767B3E87F51212F1DF7535723EABF47C1FAD5FF3BF2B3DD45A
          E76955858DA89753F63DA091BDDFA3FD22D3EA9D1BA4F526B736CB3D2739AD2D
          CAADE0070FA54B8BBE83F6CFE86CFE73FD1D8ABF5BE839995D531FAB62581D6D
          143F1FECCF7963407B9961C8C6B5ACB7D1BFD9E8DFFA2FD3E2FE8BF46A8BFEAA
          B2DFAB2FFAAEDC8A5B90EB199591580E3586BB23ED4FAEBA9CEF52BA1DE9BEB6
          2319904484883B7F82894232152163B360E3E5D75633F1FADE4E4E3E55ADA6AB
          2AAEBBF576EFD23EFF0077E89BE9FBAD46B3A7F44C1C8A6FEB3D40E46403BE81
          9D73435A469EA558FF00A3ABDBFE9367B158EB1D086737A5B318B31ABE9B9B56
          66C0DF696D4DB59E956D66DD9BBD554BA8740EA03AB67750C366266B7A9D2CA2
          CAB3C39C29F4C166DA76876FC3BB77A97E27E8FF004FFA4F511F7647A817FBA2
          303FE34568C50D3735FBD294BFE926CEE81835645D9E3A85DD3BD72E75AF658D
          60D46EB3F4960FA3EDF53F91F98B6E9731D531D5BBD461682D7CCEE047B5FBBF
          3B72E72FFAA74B3A2F46E9F9194DBB17A25D5E464599425B632965AD2D32EDB5
          575FABFA263DDE9D5457E9FBD74753AA754C7525AEA9CD06B2C82D2D23D859B7
          DBB76A6CE664059E2AD13184637C22ACD97FFFD2F47EB7876E7F46CEC2A369B7
          271EDAABDF21BB9EC731BBE377B755CDE77D5DEB25FEFA19D46B3854E361B064
          3B1DB85756DDB75CCDA3F48DB6CF4EEFB657FAED5E97A1E9FA6BB2493E37D122
          DE37A9E3656366608EAA2CEAB5D782DADCFDB7B6B6E4B0FE9B2AAFB132FF0053
          2B2A7DB53EB65D5FA5FAB5DFA4B958E89D2BEB01C5E877E6BDDEAE36264B335B
          7D8E369B6EF4FECE5EE66EF73767E91FEA7AB52EA924B5A0978FE93F577ABD6D
          C9C7C9ADACA7270ACC6C8B2EB8DD65973CBF6D8D7D1E8FDA29D8FF007E466D3F
          B43FC17F36AC74AE85D5F1B17A254D2DC2FD9F85938D92D6BCDA3D67FA0CC7C8
          AD8E1B2E6EFA6CBF659FCDFA9E9AEA1248F17828DBCA742E8BD5B0F2319D6E23
          2AC8C7AAC6E667BB2EDB7ED56381FD2FA1EDF51B6DDFA777DADBFAAFF338C87D
          1FA27D60C6EA7D3F2EDADB48A8E433AA16DC5C2FF546FC7B2BDC1D764538D6FD
          0FB7DBF6B67AABAF492D75D95AB959D81D42EEB1465E3D81B8F5E264D2F69710
          7D5B5D8EEA1FB00DBEDF46CF7ACCE9DF56BA861E4F49BBD41EDC37D1D709B6C7
          9C8B4B182AB1DBFF009ED97FADFA677A76B2BF62EA12405D23578BC6FAB5D671
          7A2749C06D6D14F4EB2E199815580B723739CEC7C965990DD9636BB1DEBFD8F2
          BF47EFFF0081A95AA3EADF53B70BA6E1675AE762D59375B998E6F792287B6EFB
          260FAD5B69FB4D5458EA37D6FF00D1FE67F375AEA924E3C5E1B94EAF29D5BEAD
          756CEBFAD6436D1EB5DF67774479BAC6FA0FAD81B73DBB47EAEEB2CFA5E97F3D
          FE110FEB0743FAC19F959A71D8C0FB28ADBD3B31B7161AACAE2D7D96EE0EB31E
          EF59AE6D7F6067A76D4FFD6575E92438B4DBC3FE6AB5794EAFD1FACE5750BF26
          CC56F50AB268AD98753B25F8E30AD1FD23DD47F39EAD9B2EFB6E3FEB9FA3FB3F
          F35E9A2F50E89F58EF39C70F35B8D65F81463E3DBBDE76DD5BDEFC83F9D654DB
          EB77A5F6A6BFED357F3BFCE3174C921AE9B2B578FA3A175C14F52FB0D43A3D59
          180EC6A30C643AD9CB2DDACEA1EBB7FA3FA4DFD17A8CFD3E4FF3F91EFAAB56FF
          0060754C2CDCAB3A5398CC7C8E9C6AF4EDBAD8767077B326D757FA66FE87DB6E
          5536B321EBA54923C5AAB578BC4FAB9D71A32AB6D628C4CCE94FC3763D96877E
          B71B5B9573286FA4E65AD7FA7F68DD664BFF00ED42EABA5635989D2F0F16DDA2
          CC7A2BA9FB356EE631AC76CFE4FB55A49095F541B7FFD9003842494D04210000
          0000005500000001010000000F00410064006F00620065002000500068006F00
          74006F00730068006F00700000001300410064006F0062006500200050006800
          6F0074006F00730068006F0070002000430053003600000001003842494D0406
          0000000000070008010100010100FFE10E43687474703A2F2F6E732E61646F62
          652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D22
          EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B6339
          64223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E
          733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F7265
          20352E332D633031312036362E3134353636312C20323031322F30322F30362D
          31343A35363A32372020202020202020223E203C7264663A52444620786D6C6E
          733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F3032
          2F32322D7264662D73796E7461782D6E7323223E203C7264663A446573637269
          7074696F6E207264663A61626F75743D222220786D6C6E733A786D703D226874
          74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E
          733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74
          732F312E312F2220786D6C6E733A70686F746F73686F703D22687474703A2F2F
          6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F2220786D6C
          6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861
          702F312E302F6D6D2F2220786D6C6E733A73744576743D22687474703A2F2F6E
          732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F7572
          63654576656E74232220786D703A4D6F64696679446174653D22323032302D30
          322D32385431363A31373A30332D30333A30302220786D703A43726561746F72
          546F6F6C3D2257696E646F77732050686F746F20456469746F722031302E302E
          31303031312E31363338342220786D703A437265617465446174653D22323032
          302D30322D32305431373A34333A33312220786D703A4D657461646174614461
          74653D22323032302D30322D32385431363A31373A30332D30333A3030222064
          633A666F726D61743D22696D6167652F6A706567222070686F746F73686F703A
          436F6C6F724D6F64653D2234222070686F746F73686F703A4461746543726561
          7465643D22323032302D30322D32305431373A34333A33312E3039362220786D
          704D4D3A496E7374616E636549443D22786D702E6969643A3931454131413739
          3545354145413131384346384543333246373737304143462220786D704D4D3A
          446F63756D656E7449443D22786D702E6469643A384345413141373935453541
          45413131384346384543333246373737304143462220786D704D4D3A4F726967
          696E616C446F63756D656E7449443D22786D702E6469643A3843454131413739
          354535414541313138434638454333324637373730414346223E203C64633A63
          726561746F723E203C7264663A5365713E203C7264663A6C693E566572696469
          616E61205061756C656C6C613C2F7264663A6C693E203C2F7264663A5365713E
          203C2F64633A63726561746F723E203C786D704D4D3A486973746F72793E203C
          7264663A5365713E203C7264663A6C692073744576743A616374696F6E3D2273
          61766564222073744576743A696E7374616E636549443D22786D702E6969643A
          3843454131413739354535414541313138434638454333324637373730414346
          222073744576743A7768656E3D22323032302D30322D32385431363A31333A35
          392D30333A3030222073744576743A736F6674776172654167656E743D224164
          6F62652050686F746F73686F7020435336202857696E646F7773292220737445
          76743A6368616E6765643D222F222F3E203C7264663A6C692073744576743A61
          6374696F6E3D227361766564222073744576743A696E7374616E636549443D22
          786D702E6969643A393145413141373935453541454131313843463845433332
          4637373730414346222073744576743A7768656E3D22323032302D30322D3238
          5431363A31373A30332D30333A3030222073744576743A736F66747761726541
          67656E743D2241646F62652050686F746F73686F7020435336202857696E646F
          777329222073744576743A6368616E6765643D222F222F3E203C2F7264663A53
          65713E203C2F786D704D4D3A486973746F72793E203C2F7264663A4465736372
          697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E20
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          3C3F787061636B657420656E643D2277223F3EFFEE002141646F626500644000
          00000203001003020408000000000000000000000000FFDB0084000101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010202020202020202020202030303030303030303030101010101
          0101010101010202010202030303030303030303030303030303030303030303
          03030303030303030303030303030303030303030303030303030303FFC20014
          08003B00A704011100021101031101041100FFC400FE00000104020301010000
          000000000000000006070809050A010304020B01000006030100000000000000
          000000000003050607080102040910000104020201020306020B010000000007
          040506080203010900100A204114113112163839213630403213341525353718
          3A19110001050100010302030502070A0F000005010203040607081112130014
          21151610314122093217205181C12376B73042242575B5B67718B840F06171D1
          F133435435454767287812000201020403050307080803090000000102031104
          211205060031134151221407106132718142232415082091A1B15233B3B53072
          B27334251617F0623540C14353638374B476FFDA000E04010102110311040000
          0000FCFF00F237F89FB0A28C7E80535274810000000000000009A11277B2F186
          4BE274D1AA1AE5400001C86F9A9F7CDA5D08388926F13B99023B493919CE6453
          94EBF8001905F2D395F8175C33A26C90775A27A4255465D8D95355B84298A925
          0D72F6F555D6A22AB53B7C25BE54C598B1AC4FA62D3B355935CE4A585414A4C2
          57D4F098FDB36EAE75D4DA8A3BD8DACD9DD465759056BBC246F9360A21FCC15B
          4EBCEA001BDE78BF2051A4958E0F43692FEC5B1EE31AB5B2969B997930F6A786
          EDC45E5F563F4A5A768AC23C3997FF00A0B784B23EBF9A70FB00C7B9198F0F77
          B214717010276EF91E24C85441AAE7A72D0B5BB3EAE6B11869A2CD5B9B46AF2B
          134B89C1035B43E8C20AFAB074E40037BDF17E40A33F772E3D5A1A7B54C0BC20
          037C6F14A41A3BCAE463F426F6B63EBD4F9C03789F185FB495052C226BFF00E9
          D4CC0C0998939F1D87A8239206EBD37FDB3631695596468EB4EF636E1DA3C599
          52011469EBA29D2564AE0B2B488320D86A8CB8EBDFD248EDD772F5B72C0CC836
          39A0EE5AF1AED9ED36405A2D71588B8DCAE94A39591BF634B5076A90A645A6D6
          6598B118646E4735D06F1A8B46AF14B1601DFD2E0B16AD7065E2616D878D46AB
          F0E49C26EBC8AE6B194A858266F8AB75AF0AB16FC9A0EC452C16A6930C4EA6EE
          323EF95C4CCF3E716DCB80BCEE08DC7B5D26F9899ECC6DCB0AEFE65BBBEDB393
          CED22988B605CE438F60F0D293175B93726BEADE2F92A0B41AFCAD1B6BEE6B4E
          7FEBCA5FE079DE36B9C99B5B80D4E39E07A71DCBCE2CF85B853D728ECB78DC2B
          4CE02B3395E4CF54449378DD47C99FD092F50DBE5DA6E6E9142A8E8A06A5C45E
          69FB689E946E9C04FBDE8697460506BC564FAB403B8926242846D522CD1000C8
          27EC33DCD1304F72152C03BC85A001C00739071A80C83900003800E76C1C6990
          D81CE01CE707CE327D0C1F38C9FFDA0008010200010500E38E39E46B618485E9
          37C65E3A0C012D2D0EA85F5A7D657286284C6850611E9B637E2A54990A687169
          8A7AEDCFA63FC79AED16AA8C446DC6B14E82212ED200846B98AFFD547C5ACAF6
          CB246BDDBB4A7D331BB957E12AA3B7BAADC895F6BEB90B987C4DFF001411AC40
          484AA3FF00A1F55F8DC3AB08142CA8282285AE1DD5D61014747AF923608CA422
          1082E40E222560DEC4DC73C65C7A75B7C71FF64CD8DD3079ECBC7608138B5B66
          C281A9199682383C0C2D5D8B99CCED6DA71A8103C2265924060D326FEC101CE2
          076BD8948CBAB0D51A70C41E8EAD570A49AFB194E0A8A480D4E8B1F69BF551F6
          715C98436FF202163A1B106B39A5182F86568725CB471E9D6E7EA49F3F769F4A
          ABFB9134AAD35DFB31E78E71E7CED94931D5486C7D9690570AB437A6AE2458C3
          5513AB2D7CF665120E8C87253FD1075A6FDA22D53204C93239A54D5D44BABC9B
          C14543881D5AE39C201E71C7DBCD5EA90F95FCA2BEA1BF2CB91F673E71C7F117
          D507310D93360045766E16C40CBA6236FF00C957F261A0834262F3D10116B642
          CBC148501AEF031953436FA4A5393A80C26762B8983AC0AA14550AD8AEBD8951
          04A6F0270D1BCF6ADC1007B9715D001412078ABC7BD4EDBD987D1A7446E9338C
          48154ADE6224F758C3A876669588D0C13D78754518296A07CB60F28422F1AB3E
          A44F98C68BBC88A091E76473F3332CCDF630196296B46F834508AD32B8A41F7B
          11CF5418C793DBFC3E46FE6646D72EC0B7C42C85F492188C81FCB9E4DF85FCC2
          F6CB266CE9F74F88FCB74725B2E9EC49B6733CC49C9161251B1486753349282D
          90486CCF04B747DDE1B923995953D37BB4F9710C7F3E2B3D4895C98C48855BDF
          883147E8490C8CB5F8712F913D3CB5CBE7EDD146C93175E5B544DC8AD70A412A
          2249619E9CFDC67FEE7FCAE03F67E4EF9F997997DFE73F7F9C7DFC7DDCFA71F7
          FCBCF979F3FFDA0008010300010500F16352F41A3E340D8B5CF66CC32D59FAE9
          D3B146E5CDEADB7778DCDCBDDD7922BB4A04B1DF575DCF7B51F0DCB79489195D
          1763B22CF9AF1DBAB668D9C71CF3CE88E3D28E36C65EF5710BC32C17AFFF001E
          91A5C97F1F951EFF000AB6972438A4CB7E2A9EB6BA6D5714844BE74E01B10D96
          0FE244AFF65B15F9E19EBCFD257FED0DD9E9D71556E6B97669972B47B24DC62B
          195A742765665AE8E0E1B34AA529F38DB970E797E2498BD3E4836AFD98E2A32F
          22D9B9EDD2870C754826FCFF00AC4BACB4421C1DCD5C81DB75545C756D245E16
          86D6E33FA4AFFDA75FF257A3D7F29E58F2EB12F485A5DB864D8D3A9D5E56C830
          47BF3933DE7E4494AF56AD2FF322488289F940B52C1A55856B6E7D8451C8A8B2
          7E33162F9F38E65BF4787CD6E68B07CD58B07A2C7BC17343739AC68DFB5CE3CE
          19FD4C593F29251B932F4CEDBD1B828738DB9679288C69C9249D4275AA5C9ABE
          B944AD76A90B95A316161976B85314993AD92C591016EC0848C0DFE6BE75F1B1
          56EC32C346ED58E8C77A3C37EB714D96D41B536BD7CEE49CB86851A325AAF673
          9EAC7721E1729DD8649506CD1AF7386CD1B3151BD267A7728E36377D4A0FC1A9
          469D4839CF47D17D4A5FC5A77EAD487C4FF87EA38D29F3E784A93F1EDD1A13EE
          C93A6FA3CB14BCECD4993E5A51264B9E0970D7C2FD3822C70CB5A5C52A94E875
          EAC34A1C9671A92EFD5BD225C752AD3A70D79E84D96FCB4A1C33E13A4CD467A5
          2EA51EA87EDF157F88FE9BE7F3F3FFDA0008010100010500F2D0F5877529B077
          E3A5DD7DDAEEC1A5845804A85240F50F096787929DC9A2B6768210BC6A69737D
          722B5499804A1FE9C79D9A977B909E5476DEBEAE63C566AADD43F6317423F39F
          6DFF006FD0762230C88C1F98B7B7AF765C13E83BB653BB3123DBB9DBA0D993DA
          1F139441AE85FF00FD77561EB2AFB5CA6DE3DB33DBDE5A2CCF5877F69DB45447
          939C72D0770044ECA0947D840EA784973AFE09B7804C0B357EE12876DBAB6E8D
          9E9EE66FDA47AEF9185A17ED8AB5DD92DCCB952F035C7B4D58E75EE1668855B8
          E9A3AAF0201FA91EA76D9F64F76AEC4E05D64EC204A4FEDDCEC2DA3B1678913A
          D5D60EE5BB8BEF227372E78C4D760DED5FB65241D861047B52210C034EF6FDDF
          DFB844CEDE4007D5FF0062F96BEA9A54E164DA4B5D913234369DBD3DCCDFB488
          8BFF001F7E9DAC7FE5CD63229ECE7DAD9963961979ECFBABA466577EBFBABF18
          F661DCADB9EEE629504CD2BF711F6F928C3DAEE70BC96DEC48271CB0F70C7BAB
          A0AA89DDA61C2641CA53B1C7B06B4AA7C0C1CAD1D8334766B9E3B4CBE71FC7CE
          D67BA318F61B4CA17DD48BE2DD28FD9CFA59FEE121D717AB3A3FD85DC5EA58F2
          48EC57A2DBB920D67CF6DD861C813EE2B2AD7EB8403ED6CD3523B053C7645D0B
          760D2F5C70F6E709D7D67F7211A0256A8F1D82F5C1CDACEE47B518DF6576A9D2
          E8860D91B56C14A1B222F56FF4465A0D76A6B81D9AFC1EAD8636CFACE19072FD
          17021884AD804871F29A438FA3EBE75E17123AFF002AD611FC4A6260A64E9D89
          06EC883E5178ADB4FF006BF887718E8AE37AAC795878F1577AEE21D731A1BEFE
          934113C8A58C39D489C828C162DA88DD64EBB25D7C2683878FC2B12D05789B82
          F7F5F88EC2549D72D105801709E89795DB360D76078075759FBB6157A9FB7CBC
          8A0502D5A3A486B1563DB4F798F550752786EB356F7F0F525AAF546743FA9B09
          1FC67B171A44294B341E6A3AAC915AC1662ABD1B80899A835419FAEE21195533
          68CEC7D4DA991F15DB3AF4171E8EA6009AB93334C9C13432073064ADB5167760
          700854B0CD8DF5A15F5DF986D47E3FFB0BF3E7CE7CE7D7E7C7DFE73EBF2F4E3F
          B3E7FFDA0008010400010500F05768C206A987C66DB0825AEAC0C2F6DB2563F5
          95CA19213180C1D0616062DF15608BD2B652E29B0817465129DBFAD6187963EC
          6E9F3DAE8E49A3B3066DDBB4A6D334BEB52208E51FEC529EBFABEDC5D1B9E002
          17FF00874A7672BF853773D9553FE378BECED7F33A8292685AD1B53D63AD31F1
          8FC5D69F3CF36B2C334CD643D9206EB384C0CC13D120C89EC3D7FF00F9887EE3
          DA79A4E6DCDAC115720B8363F271F40E6AD37F6B96559A3AAD2155C2A1536A37
          1F0AB1ACDF10438F65CDD5E1BA404E795D22A5BD49F3CF35AFE2EB4BF5592CFD
          DBBD2AF7EE6E9DCB5566ED0BD3B7A2546DC1A2C9D989556EA902EA2EE86285A0
          EB7295A3C7B2F80814363098FE84BA92FD35FC554E9A4B2BD18DE69C4B1D2E97
          A0C6A34804B698EF5D0416B61317AE77A824895C07B249AA69C75CD1A9A04497
          56A186404412B85F100B66C8476332CD53DEB621726140FC1165F50DE96D6F90
          55E1579C3C3564F1EAFBA5DD4320EE25216F5D33884A954DD442CACE50270084
          DB1643346E7CF4F8DF112A6B03CCE01326F0D0CD8FE825FBA2069E421058BBFA
          4251CD8E74FF00130CC7658CCF43C8515D96731983EF653DF10132EC5F29844A
          24C6AD4CF32C4D9BA0A54C99655057C9495BC9AF0B7286E5319D326490885652
          8E39339891628988C40D44C6E7222E864949067886485524111A9DE70F0F8B82
          AFAE25556A9B9F272BA7D012396DF640A6486246325B2022445FA1246222F7B1
          ACE656FCF28E684167656197995E9B5CA7C488F42DCE54529441FD4ADFDD7DA3
          AFB3F24FF51FFFDA0008010202063F00009A0E3756CFF4FF00739BED7F4552D7
          91F97B8884404C603E39A28D1CF505288CC6946E441FE834AD6BD4FDC474ED3E
          F6E1A185841713979150B95CB6F14AC3C239B0009200352071A56B9A5CFD5D32
          F6DA29E17A15CF14C8B246D95806199181A3004568403F91AE6EEDCD7BE5B6FE
          9B6CF71712E577C9146333B6445676A01C95493D8389F76FA6DAE9D43428AE9E
          DDA430CD0912C61599724F1C6F807535CB435C0FB27BDBC9D22B4890B3BB90AA
          AAA2A5998D000073278B8D3F6BE91A95C5842EC24BC684476832FC3965770CED
          27348D50BE5F13AA2D0FB695E3D4EBFF0041B5B86EB7D5CAB7DEC8971713141E
          64B1AA4C3227DA30F01EEC286A63F49A5DF1643D477202D855FAE498BAFF00B1
          93F75E3F8B953B481C4FA4EFAF526CADF5B8878ED6212DD5CA13C8490DAC733C
          64F60902135AF2C78F207D493633E14379677B6C9E2FFD492DC46B4ED2ECA073
          AD38B3D736F6AD6D7FA35C2078A7B7952686453F49248D99187654134381C789
          6E2E2558EDD14B33310AAAA054B313400018924D00E7C5C586A5EABD9DD6A113
          6568EC639EFC86AD32E7B48A58B303CC752A3973E0580F5363B0BC2C065BFB5B
          BB218F2632DC4090AA9EF791477D071E91EA3A6DE4571A7CFAE48F1CB13AC91C
          886D1E8E8E84ABA9EC65241EC3C7A5BFFE6B4AFF00E85BF06CBD42F5274CD3F5
          4CB9BCB190CD754C0D4DB40259C0208A131806B81E151F7B5F2DB17CA263A5EA
          221FEB66F2D5CBEFCB5F7706C7D3DF5274BD4B53CB9BCBACBD3B9CBFB42DA611
          CE5476911903B48E37AD8FA9172B06C5974E996FDD9DE30B6C50894978FC6BE1
          AE2B8F7717D63F874D523BBD9075295A4749A79C0BA291091734FE304208FC23
          C3DA39F1E7F716B36D65678D1A6754048C485A9AB1A762827DDC69FA76ADBF75
          2936F42F9A4B6B28A7105CB2B547999160323A0A78515D52BE2C5829169A0ED8
          DCD616B044AAA90306B60A390149550549E6492598E24924F0194D548C3DBF8A
          534C7A72FF00367E20D1761EE13A4EE6BE92D6D56F5555E4B5B79F4B54BC9A10
          E0813ADA99042D815720AB2B00445A7ED0D97671CF4FADBA9A349EF6E5CE2F2D
          CDDC8AD34B248C4BB55820663911168A2EF6F6F7D8FA66A3A54C854ACB046596
          A299A39028922907D1922647538AB03C7AE9F87BD37579E7F4FADC5F3C30CACC
          C239AC6F23823994572A49240F926CAA03E542455569A67E10F69EE0B8D2BD34
          D31CB6B335BB6579C41189AEB3107C422C2DADE26AA7992659060992D743D81B
          034EB382340AD298925BA94F6B4F732069A566389CCD941344445A28B8D27766
          CFD3352D3655A347736D0CCA6B87274343DC4508E608238DADA06CCD62E5BD07
          D53539AEEDB4E99BAA34BD4D622254B69642D32DB5C44F9D632CC33A367CC511
          8ED7D3FD26B8B5837FDC6D1D2E2B49AE1CC71C0D2595B2BCD984721CF1465DE3
          1908EA05AE1819772FAA9A7586BDEB6EA17324F797F37DB3A3573923B692E103
          2E1F5924D944B23C8C19CAAA8E3A7A8DCE97143988A48D028CC798A3102A71A8
          E7C7A79BD7D15D6F4AB2F56E3BC77B91A3CB12911C41648A7985A9C90DC2C8B9
          558E492552D9B3045237BEB9A8B86BFBED846E2520501927D39657A0E4066734
          1C6B7DDFEA8BCFE0DAF1ACEF4F564595F5B0626CEDD6479A34AC8DD3568DD155
          638630B48C54492BB492662070B0A4304110140A022000760000000EEA71ABCD
          ABDE6991EE18E226D1D5A1374D3F248D154E795643E09232190A12580A660F6B
          7B3BB8B3D427863CC4B648C04758C1353950BB050792D1460053D9F8A5FEEE5F
          E6CFC6DF141D9FC8CFB7D7EFEA6B5FCC20E35FBEDF9F65DB5BBBCCF94BB73962
          FF00322B2C44B919428BB8CDAB92688466760B8F0558508F67A73E92D95DA4DB
          920BA9351B9552A4DBC46230DBAC98D55E7CF23AAE0722073E17527D19BED9B6
          71BEF3D6744D3ADADA59503C56E23D36DE4966287C2F200556357052AC5DD5D5
          0A3681BE3F113EB66E8DC7B9354B286E9ADADF5092DB4E805C22CCB144917C61
          55C02F1986327044CAAACC1DFD2E8EF27ED7BABBBEB8627BCF52E48AD71A8031
          C471E9E6C0F4F76C68FA56E0B9D55EF648AD6089276B78ADDE2EA4D22AF58A33
          B854EA3D1D91C8A94246BF4387FB6F17F2A8B8DF3B92E216921B1D775098A0C0
          B74EDED982D7B33114AF656BC6A1B9B796FEBEB4DBE2E1A24B2D3E4F2C332856
          6CCEB570AA1C2A96CD24B8B965141C56EF6F4D792E356B9BBBB989AF69CD352B
          F371BB35BD3B6A69761746CA5862944486632CCA638E389E4CCFD477200086BC
          CF204F1AB46DF1AEAF383F2F4E1AFB29C7AB7EA06A7BC6D751B6DC8AC2386285
          E368335E1B9F1B3310D4072D4531F70A9D3FF13C379DA2E8F053EC3D193AC7EC
          06CFF7B9B20F178F972C398C7815E5C7AA1F890D777E58C9B7B5487517683A4F
          135BC773709739E499DB252248C8734A768C0E163A66F5D3DA588C425B2BE83E
          AAEADBAA8196485D90F85864668A5468DA8ACC99D5194E85E997E20B46DC3B5A
          DC05B683705A4DD78A25C162F33109E5608B455CD2AA05002A280009AC3717AB
          7B2B6C58C842B4BA5595C5DDD0423131F9C45453D95122B838AB0E13687A75BF
          D67DD571B83CEEABAE6A40DEDEEA1716C93DBBC524CBE38D2295D82C2AC554A9
          32192419CEDCF47F7FE693EECD3AD2182F20016682E6D6D92DFCC439C3002401
          83C6E0ABA3153460ACB6FB47D30F5B36D6E0D956A725AC1AD5B5C2496F0824AC
          68F124D208D4515631705107C0AA053836BB97D5AD93B6EDDEAAF2695A7DC5ED
          CAAFED279E0910622A01AD473041E35ADB116E9BC9FD50BCBF8EF65DC1A956F2
          F6E258D5D3A323550C56795DBA76F03288D846CDD5E98077F7A3FEA77AD3A2EB
          1633ED7FBAAC841642292D59A311437174EA23964CB02F4C29147003D73862FA
          DFA61B975CB5D661BED46E67768E278E368AE228A368995C92708CD48A6070E2
          E6EFD28DFC96FA7CB4CD6D7B1195182D422B15A87641E049B224C13C2CEE0713
          E84FB9B685BEAA902CAEAB1DD4B2A46ECCA92748B280ACC8C14934AA91D9C1D6
          FD49DD573AF6BA2291610F1A43676665428CF6B66A1A3EB50F86697A8E302B94
          8AF10E9FA56FCB16DA6D7AB34F1BD9969E551457CAC5F2C524AAAA1C82CA1866
          50A70F66AF0683791DBEBAF6B2ADBCB22E648E731B086475A1CC89215665A1A8
          04531E3671BADA1B8AD7755A21FBD6FA7D4AB6D72ED09EA337D6CCBA824D3F8E
          24482016E729AC017A4DBD6EF74EDBD675BB4BA5897446D3AECDB25901001247
          228B9B716D39B91D537B22CCAE8D1A82823301F44346D5F5596E752B5D46DCEB
          D2DBDC9B613DBAD8DD47307286369D1E7784489184321FAC5441E15F554EDDF3
          E9ADDAEA28FB63FCCA5FB343D2B492458FA9332223DD79ACD1DC890143900111
          551B46EF4F0D77B16DEDEE7CED947175DE4BA6E97959A4B71716AD73046A2653
          0ACD83BA48D1C817C1BF743B7BFBD5DE1731DF7DD6B24F1ADC5A4722D2D225B8
          124990C6D568FAD3CF242AC91C92B74C05876F6C2B9BA5D58DCDB4B780DDBF9C
          BB84CD1BEA31457B33B746E6EA3122A4A1912366A4660055D358BDD17686B5A3
          EDD7B58E3C97D765925B8476ABC564D35CB44C23003DCF56359C65022932F578
          DDBA35A6A5243BF26D5AF6485DA7432B593EA4F2AC50DC00CB6F2CD604C56F23
          2936CEE84E5299D6CF50DADB7757D0F63C7A7CD15FC3A84E65177759A2F2CF6F
          0BDC5D32BC004C66BB12224EAE1292901D74DB2D9D70E235D4E07BF8637E9CD7
          5A7AE7EBDBC32678B2BB131B3289A0696249225990BE3BBEF3574BD876BCE907
          95B3963118591164F3124303DC5DCF0ACC4C6A6396E329643247126662DB6B51
          DC70DFCFB2FED5E4AD1AF049368C650481A8C99EBAA8913325BB9794E999C5BA
          89C7DA93D53DDF368532DAEB561A698AEC4ECF13B5B472C5342F0B4A44522931
          B2522CAC95A382194DB26A1757A37D1D5FACDAA40A3CB8B5F385A8B24B786DC5
          B1B2A5BB58369ED26259573D27E340D56F25BBFF006E2D3429098E3BB78A17D5
          16F6192DCCD6F1BAB4BD38048CACC3A75AAB86A85E3706B170EFFE899741B48A
          106452A2F12E6E9A7222AE75262786AE7C2F40062A788ECDB48D67FDEBFBD4CC
          75CF39FE59D2F3798C853AC63F266CFEA4695E4B3D3C19437DAF8DB3AADE5C5D
          1D8367A34E5E28EE9E289F51F356ED6E6686375698470ACA5330318350E1AA07
          B3778D2FADF79FDD777D1E957ABD5E849D3E965C7A99E99298E6A531E363E93B
          8357D4344D0BFD2B692F9D162F7D3DCEA6630935B5C131CDD1921A249D131752
          EDE470B3031321F4B46F089B6F26A5657325F4B6D00BAB91731320B6805AB09D
          EDE39E163733BF4AE0DBC816D1D90932B6DC7D46D9AFE33BEE5B19DE381E0CD6
          1672DCF4E79A38A56111EA430994F51E22E723200C6357D0EFEE679F4F7D6A68
          9618AC993A565D33D279D268D58223AE66D461BC9A19F3284B6504AAFAA305F5
          DEA7AA6AF17A836EB6D0CF6CE860D2E5BDB12A6DCC3D332DAAC0D2C88F9DD502
          387140EA776D86A1A85F697756B7902697696FA61BF5D4ADCAC4C67328033B4A
          ED2C3244B35AF9358C3BB3D731DDD61B362BB5D56C74D496C6DCD9F512FEE72F
          599222B14D25DC657EA25E9C9666170D466346E374EB1B7B4D92E37049A31960
          8112567695A20CB1AA2324D5A9A650CAE0E06878DF16BA25ECB63A569BB66D6E
          ECCA592CE6E7516F38D2C0CF213D54021811ADE3092D65044CB980E3D31D6753
          BCBFB5D2F50D9B34B369A2002CCEA87CACC6292775692DE68D5E511891812B13
          A558975E369DA6B76EA9A85CC937DEB64D048134F509232AC322DBAE53148B1C
          6B24D713C778AECF1E53969EA06F58E379F78ADC4D1D8588B03F531C17F25BC7
          2747375AE5E6B7CB33B17542006895149277D585EA5FEB3A1DBEDF8EFAD668EC
          50CC6ECC93C525AC2913451DC5024732C2584CA1B2F5183291A8582DBBEABA73
          EDB9EE6DDE485A146D5A09140B3F32B6F6F0C6268DC3344E24684AFEF5BC40ED
          EB6D4B706A175A84F672BEA368FA4B5BC3637014308FCC1E9984A3930246CD76
          D70A3AA19402E7D2B8F70C775A16897505EB6A17896925C4D0CF14E45ADAB472
          89CDAC73C65E43712A4C18A242BD232063B02D0C6F6C97DAEDE5BCD7DE4CF565
          D2E1B7B992D6F9AD9E8B6135DBC712E5995D54B06E9012AC69AF0D622BA4D52D
          37549A6C57A2C80EA58265912FA75A3450C6EA5A03771C12C5D454616F572177
          85ADE417E352B0DD3611DACB1412C335C69925CD8CC2624470ACD1946B88E59A
          28D2368A360C8086AFB073E347EBFF00A5FA7D57FF00ACF569F00FF0BD1FACCF
          FF009B4FFC3E7871B772FDD54F2EBFF4CAF90E67FC2D71E9FCB8E6AD78EDE3B7
          81CF976F1DBF3FB3B781CF83CF83C1F8B97FC7CDECEDF60E7C1E7C76FB3FFFDA
          0008010302063F00E20B8BA832C527C26A0D70AF20491877FF0040F159459DD4
          54E2061CBB48E1E371475241F941A1FC88E0856B2BB0007793F2F02DEF22CB29
          506950703EF04FB2D34BD2ACA5B8D4AE2458E28A352F248EC68A888A096624D0
          002BC59EB5BEF7368969AADCC68D169AB70D36A2C5FE2CD0A4452348B1124CF2
          088B02913C8C08FC8B25D4E32B6ABFBBA803E8D3B313877F06FC5B3793FDBECE
          74FD787024B6B36688FD23451F316201F9B80DE4F30FF9595BF51E1A29A36494
          73041047CA0E3C000549E1596C5950F6B517FB441FD1C16F245947ECB2B7E806
          BFA38BD47521C22D411423EB1798E2FBFBE7FED1E33DA59BBC7DF4A2FE7341FA
          78AF965AF7674AFF006B8CF7766E91F7D2ABF9C547E9E2DDAD56B701C65EDF15
          70C0FBF856D5D0ADD6414A803C38D3961DFC7DD7B3B6D5EEA77E284A5BC4F295
          04D0172A08404E00B951EFE355D576F7A45A2C5BCEE90C705F6A5716C6EACD19
          4AB79385EEC45148D539A4789A43F05421656D4B75EF7D93AB6A17970ECF2DD2
          32DE990F326B03CAD9401800A15140000500068E452AEA48208A104604107104
          768F6E9BFD75FE0AF0925CC424B755918A9E4C448B9413DC5A95F70E0BDC5C31
          1D8A0D147700A30007FC13C2CD6D72E920EE27F48E447B8E1C69DA9C8805C9C9
          88EE756257DE011515E5523970DAECB12BDDB7C00E34A9A281DD5352C7985141
          CEBC192EAE99893CAB451F20E43F5F7F02482E1D241DA091FAB879678D7EF38F
          22B38C33C65852A061983531A72E277BE0C6D45C396031268CD8731CCF3C7970
          20B2768B4E414551E1AFBD80FCC0720077F00A0727DD5E27B7D411CD8D542F50
          1C49342A337C4A549A8C429A1C0F16F120A22DD803E40F4E23FEE17F5B71B6FD
          32FC3C4BA9E9B7CC00D42EE4863B799BEA944B2472452BBBCF75317CF3351A08
          238E183206621EE64BABCB9B866A972D248C4F79624927DE4D78D02D743B0D6A
          5D9734C06A092ADC0B24B5E72CEF238E9C12443EB22955924EA2AA82C18A3417
          FA75AC7136A5A35ADCCC514275672658DE775000EA4A23569080333D58F89893
          ECD37FAEBFC15E1BE46FE327B74BFF00DAFECBF1125B633C214151CFEAEB51F2
          946CC076D0FB6E2FD96913158D4F79CC0B53DC00E7DF871A88B827CBC72B1201
          A162D210057B0579918D3963C4B6BA4E9D0430A315CC50339A1A126BCBE7A9EF
          3C7F8E2A3B95547EA5E2E6EAF2791E2015416248CC5C60072AD31C061C47FF00
          CD3FC43C6CFD956B72B0CDAA5C5BDBF508A88C4921567A7D228B560B5198802A
          2B5E347D95E98FA49A55FEEC7B35B89352D5E1F3AFD3766442A8E4234AE519DC
          264861F0C6A8E7330A69DBBEDB4D8BB16CB4FB0B755F72E5B62C3F3F1B036E6B
          3BFB5CD5B4E4D4E1B99EDCCF20B716F6CE269A59E38F245D28D012C5D72F25E6
          40E36E4918FAB6DBB6C47750CD734FD1EDB3B54B728D190492410688170FCD5C
          786D23CBB754D7C5514C5C3F2A57B29EDB2D263B66EB21415A835CA08A014AE3
          5E19ADDBB68CA715343DBEF07910411D878EADEE9524539E6D130A13DF94D063
          DB857DFC078AC2E6661D8EC147CF978F31776B48162CA91278550120D69DA481
          CFF35061C4F7D6E309198B29E4559AB43F276118838F067BCD3A78AE0F331B03
          53DE6B4C7DF4A9ED3C6686C6E653D81DC28F9F2E3C4731814592A9511251556B
          F487305F0F88835C79578B6BFB2D3A48DC4DD46AB541A1A900620638F1A5EE5D
          0E796CF54B378E486453E38E589F3A48A7BD5A847C98F165A67AFBE92C977A9C
          15C97BA64CB04A8EC4195E257CA61495BEB24B712496E64F1C71464D381750ED
          7DFB791E63F56D71630A1EDCA650ACC29EE5AD388F6D7A29B0ACF696D533C325
          C98E596E351D444122C8B15EEA0E56536E59416B6804519AB2B16562BC4FAAEE
          1F4A3555DFE9A6BDB5ACD1DFAA5B5BB1CCD167458F34F1412BB322B05628723B
          1A03EC432AD630C2A3BC5711F9B8B8CB3C4606F81426205701C86520604D4D7D
          FCF880413471B2D7A81D6B9B1C08F09A8A61970C6BDF5E3509638C04653D2045
          68730229CE840AD2B5A72E2C7AE14C654F5BC03C46AD4E431A2E5A114FCFC5C2
          9A2DC92B9589A7871CC01A1CA4E18D3B08A8E2D6475430A95CE40346A7C46941
          D981A000F303832DC8531D085F0F854D2884A8E606151CCF6D7B6359278E496A
          7E15C40EE2D41515E42869DE3971048E80DB045070C3304A548ED01B123E9538
          659E6492E33828545328C7354D06070A2D30F776B34E057210A4E20376122870
          E7D86868698710AA9533026AC31C0D2809A2834C7102B4C09E25588A8B8F0E66
          CB41253F670F011DBCB3F3C3E1367009056367AAD2871A106B4C473EDE1B205F
          2DD3A643CF365EE0B5CD9B1CC1A9F361C4C8A17CDB48284AD484CA43509E5534
          F7F7711A0FF102524E1F468298FCB5F938CC248FEEEC94E9E5F1D72F2E5F166C
          73E6F7FF00CBC4E8A17CD348312A09C994D6848C2A69EFF6419E9933AD6BCA95
          15AFBB8B978D1249BAE465CC1404AE04508AD7956B45A0C31E2F7A07AA518050
          4E514C6A73600904500A8A8F163CB8728D94F960E2A41F1301502A31C09A76F6
          FBF8122001FA40D4B56AD5C6841E67F60A823BFB78B2215238CDB1A90DCDC2B7
          3AD68D5A02298F1032A2BE6539D8BE5C871C29DC05083439AB41C5B99CA95772
          18E6A651CB1C405EF15CD5E218E57CB189284D46001A1C797CFCB8B76914333C
          CCADE2A513C343872E6713861CB8BE8D1519D27003D7C593C42A00342395683B
          7898C66AA00C8D51E2C7B4138D454901415A63C5A5B93484805DB373254122BC
          850E1FAF8B6652B1CA65CAC0B614A0398D6A47322BCBDDC062423098034353D3
          3F4B2D49342398A57BB898A44AAAAC02B752A587C9DB5189232D397BB8BD3191
          248B9722E60010462D514A9186029CEB8D38BA3CCAC4A42E6C0392332D47C414
          13CA9F2E18A18CAE430072B9B9372CA0F326B8D09069DBC5BB264CAD0B541208
          0F4614C49A1AD3024E27F226A75B90FDDD29CFE957B3FEFE25F8F9FD3F8BE7FF
          00B00F67FFDA0008010101063F00FAE69DEBC87E4D5F0BCBFAF5E123B01A08F7
          183D1CC6EC9CCB2ECC623C3E674658C0D8ECE7D165F7DA8216B5ED746AA9222B
          7FDC36389F1439B41D274981023F4FABA363618CC746302142D104A773EF3687
          C053B5F211991AAC85F248C6A2BDC88C6AB936FCBF7435036D79D6B74586D708
          6DBA77DA2F4D942F6C19C1E9787CF6685C4A64E8CB1FCB0C924527B7DCC72B55
          17FC0C0717E5C15BA3E8DD3F561B158A04E2038534B690FDC8E80BA0E245ED52
          1945B62CCAD6ACB3CD1C4CF5F573913EB3FCB3CA8E791738DBEA32706E018987
          5393D6C7773564A930B0904238F3674742AE241EC46B13E56CA9F1FAAB7D1515
          7EA8870C3EE152A4ED414470D1F5E5B776F5CB3236282AD5AD0B5F2CF3CB2391
          1AD6A2AAAFD52D474BDBF380254AD1AB644F3E84EDD27BDBF6677352CD6687A2
          2E4AB056168EF4B3764B0DA492B5638E495E9EDFDBFE2FAF1C337FD403984B8E
          F1A4019C9BB841F930581CC7E6A42BF32928E6A0694CBDC9CB108E7C23A49D3E
          E636A3DDEE572FBDBED4B9E640CF1FF6D77C62A038817B9D8E250BFA5A01A2B4
          49922171ED796695F8AAE8D7ED5DE95955644554456A2B907ED38078BBBCD0F3
          E28AEFCBBA3E9A507CE7004628D55B2DA11ABE805B362CED485C8A8F968BECB1
          AE45455F54F4FA7681BE30D5DB538D2574B5B9CF57E51B22AC485BEE7FB040CD
          8A90B6F5FDCD6411CB2397F046AAFD1AE7BD5F09AEE6DBBCED85AA771DB9CF15
          CB6944CFF8FB597831AAB4EFD7491A9EE639D1A3646AA39AAA8A8BF54C58AA37
          0992236A0A23C70FAD35CBD7AEDA91B0D6A74EA5664962D5AB133D191C6C6B9E
          F72A2222AAFD52D1E63C41DA64F3C429A5FA85BAE1AC8F20492A3E349A29DC27
          A19FCFE8638E689C8E62BA9A23917D53F0FA9345278AD6F7E2E08669AC2F25E8
          9CCFA59289204F73E3680CBEB6EE82E5856FF663AF5667BFF7222AFE1F5E6964
          76D9A3D90D667B84E5C69ECCEA039001A008421EA217E6A058395AF5088EB91F
          AA7BA29A363D3FC5F5E69FFF00D61E447FB5CD7FD30FF8DDE2DF54E919492C3A
          AC7B8843439CC0CB62391D14D0D7DCEBAD81CADB9ABC8C56CAC86DC8F8D53D1C
          89F4F7B38473F92EB20599C1A3F20B893CB7B923F7AD64ACDDBAC5F73FEF7DBF
          27A7BBF0F5FA974BE4678ADD639D642099B058DC48122D2612ACB23DB1C2CBBB
          5C85A3F981EF9E4723636CF6A2748AA88D455FAE0C7BC6510A7BC840FD472047
          8D0441630D295E8754B57973345051A7304DFF00B822D637E3B0E6C4EF5FE654
          FDFF0058035FD4F70D2607B3D4E554476285C991C8643EEF9C3353A6B156F369
          E367B542DA3B4760847F2CAF59BD59EDF446B5BF4E0F82C89FD7128DAC7CD581
          0CB4416B4723FE38E5B92431BA1A713DFF00823E5731AABFC7E8D1DCC704E7B1
          6F8B5692988D8F453E027D2642958ACF825FD301E7D440346DC9DF22BA4B12D7
          927737FD1FAB6357B5E5773D2301B5D613292C96AFE8A9D8A7AE96EB98D572AC
          4D0772FCA95ABC4DF4647144D8E28DA88D6B5A889F5243346F8668A47C52C52B
          1D1C914B1B95B247231E88E63D8E4F454544545FDBFD353FD64E4BFF0076497E
          AAEDFC87E7D5FACF1EC1E3FB4EF753CBAE5AB1486F44238DEFB78FE271A66C54
          96199021DDE521915C62ABA392BFB9B235EC5731D7B49D93B86CDD9F597E2CBF
          28C71A258CE39CF4157448446630DCDC0DCA99C0E202508E3AD0BDD14D7658E2
          6BAC4F34AAE91C1FA3709EF7D4B9C6A82DEAF7A2B007626983097DBC8927D868
          804F6E705A60D6513DB3D2215ACD59D8AAD7C6E45FAF0A3FA86EAB1C0C377B21
          FDC4DB97401E9C304EC03DA30278B6D713F78F8A527732B575E322BE36B4F3C8
          949EB2FC6A9F34BEFD4FF59BEDB8003D3BC8FDF66D48F8FE18FD76CECC88DD41
          E7E2F9780CDC92C6FF00C90C6F4A2B8B9C310236EC19F6AD7ACAD5F952C16DB7
          901E41F42D1B085DB1646E183E80A6679964EA4B33E5804E530216E55CF0BA54
          A37246D95D14B76746A3EC4F34AAE91C3F67C83B7F57E69A917662B544E62B7D
          A7CEDE8E589FEF6A4920D275DB6A072FE0F8A547C523555AF6AB5553EBA46DFB
          AE4330CF3FB8A73BCA737DB76ECE8B8B3B7FBEF8F0674D1DECE10D9850F0D501
          635785D68BF8269590B191C57227D6489B3CF0A770D1F99F4B545FC6ACDF9B1E
          4368BA7E771819878E6AC704E9FB9242F2883DE58223C5688FD6AB548392CC6F
          4A12CDED5472A2A03E3FE166B7A3F04F0870190CEE732BCE32B5D39210DA158E
          846A52CEB42620C4D0A6702BDED1A2033675A1056A8937C3F2CCAAD8EC664776
          42F79CF6C90CE0AA6DAFDB7488E4731F1C83E396657FBBD151517D7D7EBC85E4
          9E6F63BB0EAFC4DFD399EA1CC0979319FD2DA75D3C6885A13ADE75997F458509
          EC304572F75D2DDAAE6DB1C3E68A348D6374EF63B91F38CA544A196C07F5236E
          2B35411CE7A520195EEF78186A88F7AB9EF4AC3A8C6CF555555F6FE3F5C33D3D
          13FF00D53CDFF0FF00F2874EFDFF00E3FACC722F1666D5E5CDCCCAD06D755782
          D0004A56B4640A68B50214095CB37347A4332C91BADC88D7D21D0470D6F8BDCE
          5496E4B774666E587BA49AD4964990B3348E5F57492CEE7CD2C8F55FDEAAAABF
          595A79E19D12EF3F217E18B79508D43DFA3EAE5DCAAA44CD9B9718D1E1AF0A89
          3E7AD6E27C561B331AD6AB91CAC70730329D6AB675BCF33C70E4D5ABC55BF353
          0CB8585C866D471323638810A742159E4F4F59646ABDDFCCAAABFB3FA6A7FAC9
          C97FEEC92FD746FF00513A17FDEC857EDF067FE49F0D7FE826BBEB0F83F1F17F
          55F5CF16B3B841BAAE7425229F453E87C71BF622399F885D791D627287B9693F
          CF46C28DF92F7AB2389AE95519F4E63DAE63D8E56B9AE456B9AE6AFA39AE6AFA
          2B5C8A9E8A8BFB3C96F31CF86B8239B69B3B9CE0FCEAFDD8ADD68F686DBABABA
          8DD110E8F89905D1794686A3524B08E746B72D490B7D5F04C8CFEA0C23BA932A
          DE25C2FBFF0074DBED7259E293033DD089687BC6B73F95C9B4E55F4BC133F2DB
          64F609D9AAE65CFB7812081F1493B678BA778D9FD34FC0CF12FC71C1718DDE97
          9C2746DC71511B4EC1AF318A2B6B3A60F5D71C48FF0029AF68A0E916BC44D4B1
          07448D96799B2C8E8A37415FCB2B78BA5F2ACB1D0E7BCBF8FE3AB428AD56A451
          289C1C56522627EEF591CEFC117D7D7EBC99F22FCA0EBBDA3B3F3ACB72503CA7
          2FA6E8FAE3A57223F7DA3DD87D2CA13220ECD98B37095800899A6BB252ACD96B
          433C2D9151B3B11D996BDAAD737FAA8E851CD727A39AA9E471AF5454FE0A9F5E
          2BF3DA76E21F6763E3C6173ECBF335648A8B48F5CE9304D71D122A2CFF006D03
          9CF48D1515EE446FAA7AFD67307C9386E3B4FB92009872CF40EA62BF564AC1D3
          D9B142BCC905BF6D5BA4EFCF4649A4860FB7A9453D91A32572B9C8AD15B70B91
          813D523AD8FC2628143037F832058413E68DADFE1FCFEBF5CD31C77A8F43D908
          66B839E3A11E6AFD703167F3F7612A64899A02FED47A0CA546BB95EB333E3555
          46FEF7222E1678FF00F63372B11242BEDF6A2C6ED068D59E8D4FC13D1AA9F87F
          0FDBE2D78BF8EE21BBE7077C7C2F8DBE5355A6D3E7CC89D1C398E51273C9DB42
          88BA55EDD396D5C7A4ECF91CAD6C4DF45FE65F44D37F4AD9F876F6DEE8FE6B4E
          163EB316A73D1E4EBDA3BD8AAF4D8277007D1530FAD053AE959E9F2FB964FE64
          5F6AFE1FB3C66FE96FCEBC77E9F0756E7F3F8F9981BAD69D0A787ECCF73D124F
          2FF9682CB8A1C871F6B4B7CD3129C5EE749EE546B9157FB5AD25C7CCD2177A03
          0EC9F67E2FB24668F9DED27CA929EB580FA71E249C7F6C740DE64F1572832E57
          2149EE96364EB14934522F43F2FF00FA70771E03D9B42F96EEF77FE1D745CDC6
          174A7274F96F9CBB9537671A0A5BE4AD7BA59AC482E7BD248F574D6267AB9EB5
          34FCE3C2FF003AFC9F3A391D72865BC82EAF8DC273E948449EB56034B8029608
          DFA2B27A2BE3969D985CD4F47C6F45F4FA83A9F937E3190C570ECE78E3579FF8
          D3E20F09754E5BCE393647785721B413B8A60CBD760DD45ED265C546D8C94904
          7EB5E76B69C75ABBDF1BBB5F9C3E3A53AF407F68E99D4B47AEE47B99A6279CD8
          F3EE8FBD21B54C56B9C1A61F22110F62C412D4254DD14F4EEC09246AB13A58A5
          B3D7FCC0F047CA3E13DDF435EBD8DDEF7C62DC630856D8196410C135F355CB13
          CB07324A448915485902D213A2224F3CAA88BF509BE69E18F9E9E4D13A0D4B54
          F3DDFBB5E3798E16DDE8DCAE82B969B97CD7341628FBDA9F233E1735EDF56AA2
          FE3F583E897788E0B25E1E60B01A5E6195F0ABC7FF006730E758C11A2B036EA6
          F04BDF548D7D5757A7703C1F314330CC96ABC966289B516C3E44F1EFCE9F1B7C
          0CF2078FEDEA79863BC8FEAFADD5F4E5BF9BE9B473C4653DBCC47390362C18C9
          892A535E52B90B56227A36948F58BE364533191F27F24F9373CDA713B3CC7980
          1C4D6A9A3D007365D0F00DB69F5B4CF8EB61AA57AF0451FE7B135AC7A3DDF242
          AABFCAA89F5441F93BC42D1E2941F24B5755CF09C01AF54BD6958E224054369F
          5EC0580A4CCF96D0F658B03E4993DEC8625FC3EAAF4E6F27F2B8B60AFE92DE44
          79EB4472627297354386D53043331E85904CE794A82EFC16258988B232199AEF
          E3F4DC678E9CBB3FC3B193DF176F4972A5FBFA1E8DBE8045E8085715ADDD5B74
          045A06C4F5D3E6A1492BC3222B9AE5735CAD5797D970DDAFF78B432844165490
          FDC56A2081DAB2CB360732E435E9B2C1C0E10BDB7CD0472471CCB12AC6F7B93F
          1FD98723D1C295D273C1FAFCD5DDEE7415F4146CFE2EA99A53EA428726AF8D06
          942A0E39E0AF3FB9BF0CB235FEA9E9EBF5E4B3C2F79F14B51C27775E183C58E1
          D8CF1B7E0E8D82A3575232D6547896FE9DC812F1F0EE3322C929182F74E9C71D
          F49A3588A2D84B7178DE078AF5AF1EBC72D9E2743AD27E6541E41F2B8BA016EC
          92DAD7FDDE5748149D8E7FBC5E83CE28F397A096E1A9383CF588C56277B2CBAE
          32F43FD46BA3F35C4E7F1F80D9723E9353C22CA745E790F446E4FA193EADCE88
          E42E0610620D1D0C79A1B94A262C899EFCB6982625656926B0F4F749E0033A94
          9CA08E0357CECB8AFEA652DDF1EB3D2CBD0CF49B8E979F0C9B140F95AC40E5F0
          FC8933C94AF66FECA786CFA587BDF7D924DF5E4307D54F0E23C88D36879FC9C2
          BAE98D3C98CA19BE722AE69DFD2B2798E81361FA2B797EFF004EB603CB01C985
          B9CFA34AC548EDD37CCBF3F89DB9B80B9B3F88620970F83CA6D166F2272EF3FE
          A46F3FA2758EA1AC238B7E6F3909E79502E8A9169C3810D44FD8AF35C828C6FB
          2E925B3D5BC9C0187B5CBE802E9194E4508AE501E1E47CB4D57CF6906F8EBA3D
          4F1ACA0A16FDD734E6DA2B43AD90152B2D1123560F5B5F983DB241631B98E83D
          DFC7AEF7D76A74937A1AA638BF27AF40CE6B9F1005142C17A2ED54333CE681A0
          C44EA7CF432C81AF481D5B24AB6E9A49F64FF18FA06A72A2759E36E5B81702CE
          F4D12330C53F2183B180E023F387745ADC24F6055FE84032FDA190933F4609E2
          6E8E9D4B1146B236748E4DCE47B4F57E0DE47790E6BADE3B4BE3FEB78273F872
          D639673E82B1E4E9716D3543F07CCC7BF23B3AD38D804E3A4A16EC89B9556CA2
          D16B5D0D8D21EF22050B9DB6F9174107C5751A710FD1E1B9BF7A295694580DF6
          DF3CC11A4FBF0C1E36DC8A09DE28D402C958AD7E51F6A3ACE6B780E670D6303A
          2EDB9E2DB893A3F5BCB9FB3A3BD3644BDB00B82C96E77E2B01CB315BBBF9BB51
          10B7010A2056E51A7692B59B963D9147076DC472A37C8807926A2796AF63EDD4
          78A58CDE3BCC6A78D75080888F1D83A05F678C4643136C170F491D012DEA2EA2
          FBF2BC4B95445DF11783D2E979E9343C03B0F7B76B3945DC8D217A5884F47B39
          63D86D7E67495735EC3813FE2F295CAFB89C56D96DD024D0CCCF8648DB64005E
          71278E357C7F76466F1B36B6AD26E2FF004D9794462AFB48E6B39C9D37247A7D
          8EC2F71DA5D06A6F2AD1862489B23A3AF1C839DDA32C0AA6097CB0DC791188A9
          9D35A4E58275FACCFF008F56B956F84749763363A1084C4659E734D705D4B6C6
          392FBA3F6CB5BE2731D2A60B9DD38C67FDA447796BD075FA1923CF9084D3B8C9
          2E5185139C64FAA744A2AD504D88F21F1D26B9678645748E4F6BD3E86E8BF5BF
          0067F4ED838556C915F0B67E48D93C8DB3A84E5AD1A4B38D2698FF00CE2C768B
          9D7BD4C41D4935CCAD0A39B61646C31A85FAEE393023B08BE516EFC83E7F0660
          E6A39885DA6B73DC064E63D204F476E3F607C09015989CCE8088AAB6FD9ECBB2
          315B256F89CC7489F5C2E4D5B81B32F1F63E64FD23B4DF6BFA6DA01BB508E30E
          D07DF23A97E46839245B7F322C5F07BFDFFCBEBF5E51F41E6988E5DE4775D5F3
          9FAA652B711B3D9C4F12C160BC68FCF6D94C9754E74E1FA3C7C3B505AF2166C8
          C710AE4907E4E9D1AD2CD4658AEC73C5E71D8E1D6AA7948BC5369CB02715CAED
          7A15CC172FB98CD7D222FEA5ABBBD7052E2C57452BCEB694E3CF02810966E2D1
          50598DC11DA6B129B3692644854E5C52C7F4A219DFF263F45BC01B36D0F227A9
          64F3E84F2D8B35ABCDC6F38CB82B40423115BECE126DAAA93413BDCC65B96B74
          1CE8CC702D5D2F1A01740BDD0351DCE9178F47DA23330B8FE5F1C432C4AD8E6E
          9888EB094E0E72632038B8F9A295F29C91AD64D2781E68009E2FC7707A2FE99B
          D45FD27638EDF01B6DD4F91593E47DB6A9419D1E9EBBF50419AE97635B545549
          229E957B6416FC1F6B22BBE0959E3CE8B3D94E75DBE8EF327B32BE55F4CE83E4
          C54F1F88F8D9B01A6345429E32901B0FB2C062C265688D3344D5D11A78F576AF
          3EAD7AF0AC5F02714D47719F044F23D1FB899C9765DEBFB1BB36638572984AD1
          CCD437A8AD6CE634472B3AF75A7191766FD1D6C266B2B116BC0D6C912F19E79D
          175A2F3BCCB3FE4E07CA6A76C68CE5220E3724276920BB5A2BE7CA52358B5A28
          3A0F9D6D4B0591EF6AFBD1AF8D53D788E8FA2E680751DB75BF363A7F26E97015
          ED37F1B4B03E3E8F9395419EDC530D958E84C04A5EB5AF3162A9FBAFB223D83D
          CC5A12246E54F39F9CE145F30E81ABE41E7A654073FEF3776F0D9EB6CF196ADD
          E9B8E876595CE8C203C2F41C895BF4057E60A2E292274C560B4E8E3645048DEE
          E679E9396FE531D97C859F187BA8EE8002D99EF1A4B77B3B5AE3F4998BDB6BEC
          2F5F4E36F92B56C408CF04258E968B1971F335B3249E26F8EB23C56778491CAF
          33D0F905DB66EEF1CD1698F6DB8780DD6BC155D458A4CC9F361D92DB3AC09AF1
          3AAD9B95ADBE48EDCB3AB58C6F8E9AC00CE7BE3D6EF4DE58DDE1BD0F2A77B715
          8F30EE3AA0725A115D57604F523F527B07F0DA27745DA390569444AF67CA94A2
          744E63A96A61BA2F8AEA737E58E139E6B4683DC53D7974F1676C28BC647B12F3
          927BDDAEBF496327A60ED86A95A2FA158BC767F1A1123A27B3B594C7730E5F95
          CA643759313E38F6109E5950E81AFEF38EBC567A568EB39D568CD57DC4263351
          C662FDCA55725066A6912AC8CB0F72566F9B663077B19E47750C391E1953C7FE
          2E53AA67B9F62F7F8ED16147BFACF4A1BABCB58C453E8BA0E6E5EA53A31E6465
          B133FC57EC5E916E7D94B17D794A6AC5E11A9B3CC7C43E57D4731C463ED90CD9
          BCCF95DAEE83CE40742E1823A48362DCEE398E6E074046DCC826CC569C91495D
          6FC8EA335B9B96DBC5CF8A762F71E0F0DF22F4FC56C76C9A6607EF734A6B3A47
          8861CA39D5F53ABD14376856390E3EF99145E4A52CF0A9646C51BA5F1A356149
          F29AF96EA9E19793C43B0E3B59B8CA6D315CDFC8DCDF30EE798871FF006840F6
          B2F640FCB62BE7080B1A4C8DFB5096BD17DB597FF2363FDBD37F2EFF00B647DD
          FE960DF1FF00D927F4EFC5E9F9F41EFF00EF6FF54FFC4BFA67DBFF00CB7E4FC7
          F33F67B7F1F4FAEADF27F7EDF27EA77FBFFED33F07F7EFEFFB2A7EEFEF27ED7F
          E0DF9E7BBFB3F1FF00A3FB6F8BDBF87A7D7F1FDFFE5FFD7F4BFBFF007FF1FF00
          3FFE5FAFFD3F5FC7FCBFB53F7FF0FF00CFFE4FAFE3FE4FDFFB3F8FEEFE3FF8FE
          EFDBFC7FCDF49FDAFE1FE7FDDFB1DFDAFE1FBBFB3FBFFDF7F9BF67FFDA000801
          0401063F00FAD3E0B9BEC5741AAC755B577443141E8067D856A676CE6EC4BF74
          545D2A767D8669C90FA4523D57DBEE44F6AA2FFB80CD3F5FD4FE9408608CC247
          5CFCA4C97FB8BF5C75B2B2C1F005A042C47EDA34657FB9CD46FF002FA7AFAAA2
          286D186B1F761CF8A1C6C55AF8A587EE4695A90DEA363E19D91CF17CF56763BD
          AF6B5EDF5F45445F54FF000341B1D2DCFCBB3D970E44F9CBFF00058B3F662855
          596EDFB3F6F5229ED4FF000D685CEF646C73DDE9E888ABF87D5ADA727D1AE9F3
          748C590160828B2E27D8569D6A96EC56FB633447DA77C705E89DEF462B17DDE8
          8AAA8BE9FE174BBFE3AE92A18EA1706126741A5069B50664A639DB62364839F4
          0D48EA14D19AF7CF1FAC288E454F627F2227D45C52CF42050F549A7A95A2C4BD
          6E217927BC2263D5236A2555ACAE9C4577CEDFF49FD86AFF001FC3EA4CCF43EB
          B9511AA85B1BA6CA529AD687515D256A3E14B6033B54A93A2B3317DCCF9E38FD
          CD5F54F54FA60D7F58880DC9A6486B47A8CCEB33EDB2AABE8C921988858A1F85
          FF00BFDCE735113F15F44FAA5A2CA1D11A5024A3F9A8190446A1519723F5F457
          57BD4659EB4BED722A3BD1CAAD722A2FA2A7D4B62C4B1415E08A49A79E691B14
          30C31355F2CB2CAF56B238A363555CE5544444F55FA98317ED39A206217398E1
          99588AEC2D3A4639CD7471BB3340A567BD1ED5454493F05FC3EAA8F93B00FCCD
          DB922475A0DA83D2E42391EE77B13D6F1D114C6C6DF77EF574C889FC7D3EB981
          60C4691416436C4ED502432DC17685DAB2E034EE8AC54B956496BD98246FE2D7
          B1CE6AA7EE5FAE4FFF0056984FFA2C2BE96A750EB38DC892448D5435D28CB475
          12667C907A831ADBA5DBF3B3F167AC29EF4FDDEBF4B1BBA2986D646A3949BB9F
          6F9A351AABE88E5B2ECE22A357D7D7D7DBE9E9F4CA3CC7AD633584E56492441E
          9946553733216FBE7740189369149DB5D89EB22B2272469FDAF4FADED3E8F619
          4F9FDAC8E820DADB7D9B54D95B2F28CB2C393BEDD154B959B10E591CAF8BFD23
          7D3D5BF8FD13A5E2C1A80EF3B7EBC9D8217203670F319A89078961083EF340F7
          DD6399463ACBF1B7FD1A7BBD53F155FF000FC8DF5555F4CDE87F7AAAFF00F79B
          43F44F37CEF49631BB2D193E779F0DAFA75ABDCBB93A8639A5BA9A7D18EAD6DA
          FACF282F2CFB8EAAE7B57E2B2E63D13D5BF5083E75840F4ACBBD6733AC2D0467
          B77AD2B3235D7CFEBF6455964F684D13B08B2CF34F32A2BDCBEC6B19E8D4B99A
          DF61B33A80F7A192192B93135259A0F91BEDFB8A175B1B2F0CBB17EF8E7AF245
          346E4456B9153D7EBB9F01106485DC3C526F6A3A8599164AD64BE0F4426007A7
          920458EBD6D058CE185A57EC44C67DFAC31C92B5D2311E943C33C5696F65B9BE
          76EB2B740B63A57C7F9CDD1A32BE8F5C4CB46D58D0A51CA8EB35A88D1B2AAD49
          CC5959ACA4B1C51B129E7F9CE04088656898CB26A7A35C869CC584635B35E35A
          1B914A4EFDBB2F6FB9DEAF4898ABE91B18C446A5A05B0C665B4E1AEC32416861
          E0230A539A2998E648D74172B4CC4556B97D15111C8BF8A2A2FD439AE7C4C937
          C74DF173DA9CE60085AB04AA72FEA233344A1B94B2F76ECD3DB1F97D3E7EDCD2
          32AFB958DB159C8BEBFC8BF4086F10B2128F5525C6314371A4B456E5A424492B
          F9B0B52531358869907B6C09A334B62BB7E191AFB11C6D727B557EACECBAF83C
          CEDBBB9F284EE97D45F9A6D8A08A6EBB22D184517D0538EDCE5C844C4B646FBA
          36D99ED4CF623922646D473084D9BA8CF4F47B2E482EBB7DA888BE8E6CEAC4F4
          445FE3F588D47143189A3D7E3B45896BA0E66505477070B0F42422076A453353
          2200D30BD2D7822AB69162B36E39A48DE92C6DFE5D8E80A4892933BE38913246
          54444492F93E78EBD6E444446A27BEC4EE5FC113EB46AAAAABFDECE913F15F5F
          FE8195FF001FF87E46FF00AB7A1FF6CDA1FA09FF002E643FD8B9BFDBDE3FE58E
          DFFF003CE47EB5077A14B10AC9758B44ED0DD15A6B601D08AE9148255164E5B3
          33638E0A4376E0145DD9D151903E78DD23918EF72FECC3F1C1D76BDCD5078F45
          D1F4B5A095B248042A66C983070DD631CA90DC3D708C8F8637FA3FE0AEE7FA7B
          5CD55E216F031518F73B8C6E4028634568A141F991C239F563DA03A825D24511
          82D00FA9F151AB2B9B03ECCAD7CBEB1C6E63F31D03C9FF00217B7F4D39B00837
          4AB95CF7482D91C308A672AC44EA0B6C39770D52EB055B2D49248D6BD657AB9B
          147F1A35CE625AE2024FC8CFFDFEA345B2D24AEFC7D57DFF009C68ADC6EF5FE3
          FCBF8A7E1FBBEB9CF2CE4989C160344635453724806301070C46D64C0654E0BB
          468E3E8431109C7A16255E085D3B9CC967F546FAAC6EF433FF00F2E2FF00B318
          FEB49FF5B3A4FF009832BFE1F51E9877759DD30EDF0A263E909121498EBA364B
          FBA25AD6496AD5CBF6A0B0C8AADE481518C6AAC8D577AFA2FA250F28A3DCE761
          CDD32012E3B22F0A4DC71EC15842191958855B7D2823A6B371266AFC3E8D8DAA
          D5455FC7F6F4FF0026F41D0B2B3E4B4B2F472EF0AC144685F0D474F6439164A4
          0BDA2120F7462EB8891677A46D6B91C8A9E888BF42686DA94F3A410B8AE33680
          A5FCBB4A03F36A8C492C0ABB35795938C2D4DCC6DAA36E19A9DC8D1BF2C4E56B
          1CDFD39C83C9AC16FB0A3A1F840677B7E38B5B2826A451FC750653D006B56883
          69D68DAD646C7CCB146D4F46318C446A38699EE1E3FF0027A16FDD5EE94E7B82
          D06A3535AB39AD63E71726AA78C4C16D53D5D1B9C8BEC77D16C6F29EA9F9CF40
          D5746FD4FD63B574A75ADA69B787008A3F9E9C611B436CD2906D5104C8B963A3
          0B9B5E058DC8E6BDE88E4C8719E816AE32E6302E51B9FDA669CDA0673BACCB85
          804C3A107F76CB70BABDA63658A7A7699357B54E77C32B5DEA8E44CAF20EF9C9
          36DCFC7C9ED0596EA394D043288ACF93D5D5445B1735DB224731155CCA6DB525
          585555B0B2367A351B4CBF6CF1E395D2B4DF8ED11C1F38D1ECF494E377AB2470
          F6EC08D507F73EC5F731CF63D1AEF4FC17D3F1D367A9F40D59CED3ACD200D6E9
          BBBF4D9BF586AF5D780C566AB330619128D882F3FB14AF4D14628425282AAAB2
          44491F1FABBA571AEA1DEB9CED73B7B8ECFCE70E34361E61A6B2D7488FB62C71
          BD615FCCBEF8D53805B5B046C48A07CE913A473DD27AAFD14E7DA4D486D75E21
          B329A76130632F0AA91D720343D26547D7216EE4CE9A378D7395C8F46AA3D13D
          3F05FD8FCFA10A8A6E31B198905A4CCFBE60B96CC94E2BEEAFEBF22557DB85D1
          A3FD3D15ED54FDFF00E019AF9FB95879E9C5108425FBB07DD53A25E5A93306DC
          B7591156C56AD71CC7C8CFF7ED6AA7F1FAE6697317D2A96CC2BAC3FA5EBCC744
          74808ACF38BB3114B3795B78957DF562E5DCD9A9558A9D36D25F6BFDD5923F89
          FD2AEEBF3BB9DE073628556E48EC3E99C06AE5238C4FC2505D8AD19B0DF91696
          7D1356DA9B992D324ACF8A34744903A17F0D03A23B78868431FCDCDD6C983388
          194C06AB9E335CC55BB6A1FB490B53B6427ACCB4D81B13ED3DAB231B1A7E0DED
          7109934F5C957D5D525C05B0740B50A6707C61F3572CB044B2DC7345D4B5AA8A
          FBA6AC456763D8F73111B03DAC4C25CA4C9CBE046D13C9AFCC0FA897AC5CD0D9
          8C7373C5890742C1FF0052011CC65B63E8B274F49E68E573266B3D19D440D0BD
          A8ADAF391EDDDCD69953A3613D96A4429FC3991944E4766FA8E8A95A474D4D2E
          DCBB628B246C524CE48D18D665B9CDE34CD03EE01BFA559F5169357A41EF2346
          D6F070BD8929EC205D268A8B6C4705B4564104B27A45F022B648CB10078BDBE3
          7292E646D1922D5EAA59E9DF3D5AEC8AAFA18D9EF9D969DCAD4151960A2DA852
          DFAB58914DECF993A167C616B63BA313D66D2F676E4A76ABAFAE62F6DEC11A43
          859D6C53D7057C8E415D568CCF639474D2C6E77A2C7EE4005B259DD9E0F094F2
          24C76E856CCE3C9C5A336E7D1FD388286CE64FCE864348CB0FB45DB3323B50C9
          F12FCEAE47C62AA6227B9F141AD037766284DD60C3DA3C35696671C040C9C962
          9B2A5DB4F585EF6A4F59F66B472C0D9A274A8EFADC11251E806E448C00DA0B34
          560AD52934AD586EFE785C20598AE80C838483648229609EEAC334917C91431F
          ABDCFCC17D441A5BDCF3EE752B91C94FB36102BCA5E516CC91D8DF5C75B55E97
          589C2AB10E6FCD65732D95206A5A4FF85C3D2F652E7EEB2AEC72B8B6D0D34656
          4B1426B00908D12822D8C92FABA9DC8DB2D69607257589D1FBFDAF6BBDED72C6
          467D4A74476F1A51BD042BEB343B0026996D42FA9688685E16B65A2C8FA51981
          4C1E59DEFF007AB7DD239B6132052DD9309CC02620C4A44751D1CC3075FDF45A
          5017337295134EC417493680EAF69F1AFAFDBFAB959335E8AD6A5F3EE92C7E80
          93970D115A352303AA26BE2D513B96A44108A965B63F2796245B1FD8737D19FB
          D3EAC0FF00CAF6AEEEEFDE295ADD699A8466123189A5FB8809FDA7E68EA9163A
          1C8A7D9BF34A31F23DDEACF639EBF79F591277AF1B6F3E07952D35F123B4138A
          165366D3C0ADE7E6303695882F1160DAB56C490A7BFEDFD5CE6CC8F456B7F66B
          5A352DA915CC9E4A0943DFF7EB75455B4AA94BE25493EED67F6FC7EDFE6F7FA7
          A7E3F58207A027A0C4E5978E0522BAD6E52CEB4B99E84EA7155BE08E3DF4C93C
          4DE0D1323B4DACFAEB29496691AD99AB0B98EE2F06CC7BF009B111A6B3AF2428
          5425CE426C54907E9A1699C9DC4AC67EA6843C8F216E4486FAD09DACA523A357
          7CCA33F33AAE3D5A1F22C8632F591C22F8B59B13972445D48B14AC3C9BD29BDB
          707575B527CAEACE93F95D1351CB135415B42A4074DD26D048C50BC8CF5A61D8
          F907FC74C817AC561ACF51552EC6B3C87A992B104CC7B5ACA89EAAD6F6AAB7FF
          0056688C50F20E87E9F16685DF7B68604A9CC8CA3E5CF4B41F4DD77375C74966
          58DCC99EC816293E56FE0F62F41A172F9DCA580E401D6E6A102F3CB1B5876A36
          782858B0596DC6B1213B042FCD3D39EA45647B86470A48F7BBDDEFFADF09C755
          3F09BCDE122338E12ECAC76E86D752DA760BFD886B0C888CFA4A8F5AE942DC6C
          9463EA48F5563A472B5DF5A13E24458B5A2BBCFAC15A20E1A8424B3295B217EE
          A318CA504B4CA3A64B2FF8FE36BE39FD53D3D5AEFAD85509727CF8FCF72B027F
          38FAF95FCD2D94DBD8874525D1934C4659AB91A75DA32AC6FA30A456BDF37AAC
          E9EE6A7D71F2A5A53C268E979119B677295C54F1E6BF5D3A1CD15FB2276E78A7
          9C313A90CD6995DB61ED55643233D5CEF722E32A19AB0D524489166741CA5A06
          4E287283E38AFC904742EC02626D3986D9AF0470DAB576D572B1CCE7468C5567
          B7A56D58D92E6B20207E962320B9097E31F503EAAF8A17725A30D96973F31614
          915891CD9A28A46223A26B115557755AD34F6DC1D0E691EB81CC33235652EDD4
          436C953B59D111D3B43289D96D470C5622A523E3B0CFC1BF3391FEA894FE2B5A
          8A77B9714363DD6C2C82EA4BD143DCAE91E754FC23068E1AF2B46DFBA5A92B26
          75658FD593391AF45C457267F43789110662CEFF003373985C063F305E28A29E
          BD690DCB2D7FD3D250B8E75486096424F22C45911CCF4591791D631449E2F2C5
          E1D84DB8D455CF5E2E483141E4E46E673F6475E42D600D0D05796599C4278ECB
          7DD03214F8BE66BBEB05566AB20F88DF49D50021AA9F2D3C57CA736121CDDB01
          AF981CCF6C58D2DA0B95208D896A3921F4547FC2DF9991B0BB4C426E52947AF4
          F87A3ABAB908D11719F2C376B6B8F5657C94870BFB67BE94852BD5B3024BF1BD
          2AFAB9DEDE90325A5A95B99DEC1CE21C717102880A2DA0E7E4747882D3906C95
          6BD16121F5639C855B36228A16C952077CB1B7F9BDDFB72BF37F765ECFCCAFFA
          FF00783F77F7DEBF974BE9FA4BECBFE11F987FF13E9F87DAFBBD7EB3BEDFD1DE
          9F61F87E80F7FE8EF4F9E6F4FC8BE4FE7FB4F4FED7BBF1F93DDEBFF817FFD9}
        mmHeight = 18521
        mmLeft = 8731
        mmTop = 8996
        mmWidth = 44715
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine51: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line4'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 56356
        mmWidth = 196850
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine52: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line5'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 80169
        mmWidth = 196586
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine53: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line6'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 96044
        mmWidth = 196850
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine54: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line7'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 123031
        mmWidth = 196586
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine58: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line11'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123296
        mmTop = 261144
        mmWidth = 78581
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine61: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line14'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123296
        mmTop = 283105
        mmWidth = 78846
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine62: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line15'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 164307
        mmLeft = 201877
        mmTop = 118798
        mmWidth = 2381
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine63: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line16'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123561
        mmTop = 45773
        mmWidth = 78317
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine64: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line17'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123561
        mmTop = 32808
        mmWidth = 78581
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine65: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12171
        mmLeft = 123561
        mmTop = 32808
        mmWidth = 1323
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine66: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line20'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12171
        mmLeft = 201877
        mmTop = 32808
        mmWidth = 1058
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine67: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line23'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 228071
        mmWidth = 196850
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine68: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line24'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 118798
        mmWidth = 196850
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine69: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line25'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 52652
        mmWidth = 196850
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine70: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line26'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 5292
        mmTop = 75406
        mmWidth = 196850
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine71: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line27'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 23019
        mmLeft = 5027
        mmTop = 52652
        mmWidth = 2381
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine72: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line28'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 110861
        mmLeft = 5027
        mmTop = 118798
        mmWidth = 2381
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel61: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label4'
        Border.mmPadding = 0
        Caption = 'OBSERVA'#199#213'ES:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4106
        mmLeft = 6879
        mmTop = 243153
        mmWidth = 27771
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine73: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line18'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 123561
        mmTop = 44979
        mmWidth = 78581
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine74: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line21'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123561
        mmTop = 51858
        mmWidth = 78581
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine75: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line201'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 22754
        mmLeft = 201877
        mmTop = 52652
        mmWidth = 1058
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine76: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line202'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 201877
        mmTop = 45773
        mmWidth = 1058
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine77: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line30'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 123561
        mmTop = 45773
        mmWidth = 1058
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel62: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label5'
        Border.mmPadding = 0
        Caption = 'DADOS DO CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 52917
        mmWidth = 39158
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel64: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label6'
        Border.mmPadding = 0
        Caption = 'DADOS DO PROCESSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 76465
        mmWidth = 41010
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine78: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line31'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 53975
        mmLeft = 5027
        mmTop = 229394
        mmWidth = 2117
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine79: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line32'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 241300
        mmWidth = 117211
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine80: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line33'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 42069
        mmLeft = 122238
        mmTop = 241300
        mmWidth = 529
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine81: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line34'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 283105
        mmWidth = 117211
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine82: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line35'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 23019
        mmLeft = 123561
        mmTop = 8996
        mmWidth = 1588
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine83: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line203'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 23019
        mmLeft = 201877
        mmTop = 8996
        mmWidth = 1058
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine84: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line37'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123561
        mmTop = 32015
        mmWidth = 78581
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine85: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line38'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123561
        mmTop = 8996
        mmWidth = 78581
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine86: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line39'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 8996
        mmWidth = 117740
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine87: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line40'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 5027
        mmTop = 44979
        mmWidth = 118004
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine88: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line41'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 35983
        mmLeft = 5027
        mmTop = 8996
        mmWidth = 2381
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine89: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line42'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 35983
        mmLeft = 122767
        mmTop = 8996
        mmWidth = 794
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine90: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line43'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 76200
        mmWidth = 196850
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine91: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line44'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 118004
        mmWidth = 197115
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine92: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line45'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 41804
        mmLeft = 5027
        mmTop = 76200
        mmWidth = 2381
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine93: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line46'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 41804
        mmLeft = 201877
        mmTop = 76200
        mmWidth = 2381
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel66: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label7'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'INDAI'#193' LOG'#205'STICA INTERNACIONAL LTDA.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 28840
        mmWidth = 97367
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel67: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label8'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'NATUREZA DA OPERA'#199#195'O: PRESTA'#199#195'O DE SERVI'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4106
        mmLeft = 5027
        mmTop = 47096
        mmWidth = 115888
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel68: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label9'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'RECIBO PROVIS'#211'RIO DE SERVI'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 124090
        mmTop = 11906
        mmWidth = 77258
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel69: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label11'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'RAZ'#195'O SOCIAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 57679
        mmWidth = 26988
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel70: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label12'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'ENDERE'#199'O:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 61913
        mmWidth = 26988
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel73: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label13'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'MUNIC'#205'PIO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 66411
        mmWidth = 26988
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel74: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label14'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'C.N.P.J.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 70908
        mmWidth = 26988
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel75: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label15'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'C'#211'DIGO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 147902
        mmTop = 57679
        mmWidth = 15346
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel76: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label16'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'BAIRRO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 114565
        mmTop = 66411
        mmWidth = 14817
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel77: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label17'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 147638
        mmTop = 70908
        mmWidth = 6615
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel78: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label18'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'INSCR. EST:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 100806
        mmTop = 70908
        mmWidth = 19579
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel79: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label19'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 170657
        mmTop = 70908
        mmWidth = 8996
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel80: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label20'
        AutoSize = False
        Border.mmPadding = 0
        Caption = #193'REA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 81492
        mmWidth = 26988
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel81: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label21'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'S/REFER'#202'NCIA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 85725
        mmWidth = 26988
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel82: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label201'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'ANALISTA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 122502
        mmTop = 81492
        mmWidth = 17463
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel83: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label23'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'NATUREZA DO DESPACHO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 96838
        mmWidth = 43127
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel84: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label24'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'VE'#205'CULOS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 101071
        mmWidth = 26988
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel85: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label25'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'VOLUMES:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 105304
        mmWidth = 26988
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel86: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label26'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'VALOR FOB:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 109538
        mmWidth = 26988
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel87: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label27'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'N'#186' DI / DUE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 113771
        mmWidth = 26988
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel88: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label202'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'DESTINO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 138377
        mmTop = 105304
        mmWidth = 22754
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel89: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label29'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'PESO L'#205'QUIDO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 138377
        mmTop = 109538
        mmWidth = 22754
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel90: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label30'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'MODAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 82286
        mmTop = 96838
        mmWidth = 20108
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel91: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label31'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'ORIGEM:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 82286
        mmTop = 105304
        mmWidth = 20108
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel92: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label32'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'PESO BRUTO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 82286
        mmTop = 109538
        mmWidth = 20108
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel93: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label33'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'VALOR CIF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 82286
        mmTop = 113771
        mmWidth = 20108
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel94: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label34'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'DESCRI'#199#195'O DA DESPESA OU DO SERVI'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 5556
        mmTop = 119327
        mmWidth = 75671
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel97: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label37'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'VALOR DOS SERVI'#199'OS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 165894
        mmTop = 119327
        mmWidth = 35454
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel98: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label38'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'COMISS'#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 126736
        mmTop = 249503
        mmWidth = 34396
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel100: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label40'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'TOTAL TRIBUT'#193'VEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 270405
        mmWidth = 33073
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel104: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label44'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'www.myindaia.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 283634
        mmWidth = 197115
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel107: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label50'
        Border.mmPadding = 0
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 167482
        mmTop = 249503
        mmWidth = 3704
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel109: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label52'
        Border.mmPadding = 0
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 167482
        mmTop = 270405
        mmWidth = 3704
        BandType = 10
        LayerName = PageLayer1
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText48'
        Border.mmPadding = 0
        DataField = 'PREVIEW'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 124354
        mmTop = 18785
        mmWidth = 77258
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel113: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label63'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'DESEMBARA'#199'O:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 138377
        mmTop = 113771
        mmWidth = 22754
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel114: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label65'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'AGENTE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 138377
        mmTop = 96838
        mmWidth = 22754
        BandType = 10
        LayerName = PageLayer1
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText37'
        Border.mmPadding = 0
        DataField = 'LBL_EXPORTADOR'
        DataPipeline = ppFaturamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFaturamento'
        mmHeight = 3440
        mmLeft = 82286
        mmTop = 101071
        mmWidth = 20108
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line10'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 240507
        mmWidth = 196850
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine14: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line13'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 42598
        mmLeft = 165100
        mmTop = 240771
        mmWidth = 2381
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine16: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line22'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 42598
        mmLeft = 123031
        mmTop = 240771
        mmWidth = 2381
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label42'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 
          #8220'Este Recibo Provis'#243'rio de Servi'#231'os '#8211' RPS '#8211' n'#227'o tem validade com' +
          'o nota fiscal, devendo ser convertido em nota fiscal eletr'#244'nica ' +
          'at'#233' o 10'#186' dia subseq'#252'ente ao de sua emiss'#227'o, n'#227'o podendo ultrapa' +
          'ssar o dia 05 do m'#234's seguinte ao da presta'#231#227'o do servi'#231'o'#8221'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 9525
        mmLeft = 13494
        mmTop = 230982
        mmWidth = 179652
        BandType = 10
        LayerName = PageLayer1
      end
      object Cancelado: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Cancelado'
        Angle = 45
        Border.mmPadding = 0
        Caption = 'CANCELADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 60
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 107156
        mmLeft = 39688
        mmTop = 100806
        mmWidth = 119592
        BandType = 10
        LayerName = PageLayer1
        RotatedOriginLeft = 5582
        RotatedOriginTop = 86265
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label39'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'FATURA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 122502
        mmTop = 85725
        mmWidth = 26723
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label41'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'IMPORTADOR:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 138374
        mmTop = 101339
        mmWidth = 22754
        BandType = 10
        LayerName = PageLayer1
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NR_EMISSAO'
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 123031
        mmPrintPosition = 0
        object ppDBText3: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText1'
          Border.mmPadding = 0
          DataField = 'END_INDAIA'
          DataPipeline = ppCapaMyIndaiaV2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 2910
          mmLeft = 7408
          mmTop = 33867
          mmWidth = 34131
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText4: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText2'
          Border.mmPadding = 0
          DataField = 'CNPJUnidFat'
          DataPipeline = ppFaturamento
          DisplayFormat = '00.000.000/0000-00;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFaturamento'
          mmHeight = 2910
          mmLeft = 17463
          mmTop = 37042
          mmWidth = 42598
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText5: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText3'
          Border.mmPadding = 0
          DataField = 'TelUnidFat'
          DataPipeline = ppFaturamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFaturamento'
          mmHeight = 2910
          mmLeft = 14817
          mmTop = 40217
          mmWidth = 45508
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText6: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText4'
          Border.mmPadding = 0
          DataField = 'BairroUnidFat'
          DataPipeline = ppFaturamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFaturamento'
          mmHeight = 2910
          mmLeft = 61383
          mmTop = 34131
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText7: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText5'
          Border.mmPadding = 0
          DataField = 'IEUnidFat'
          DataPipeline = ppFaturamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFaturamento'
          mmHeight = 2910
          mmLeft = 69321
          mmTop = 37042
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText8: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText6'
          Border.mmPadding = 0
          DataField = 'FaxUnidFat'
          DataPipeline = ppFaturamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFaturamento'
          mmHeight = 2910
          mmLeft = 69321
          mmTop = 40217
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText9: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText7'
          Border.mmPadding = 0
          DataField = 'NM_VIA_TRANSPORTE'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3683
          mmLeft = 167482
          mmTop = 19050
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText10: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText8'
          Border.mmPadding = 0
          DataField = 'DataVencimento'
          DataPipeline = ppFaturamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFaturamento'
          mmHeight = 3440
          mmLeft = 174890
          mmTop = 40481
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText11: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText10'
          Border.mmPadding = 0
          DataField = 'NR_PROCESSO'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3704
          mmLeft = 155046
          mmTop = 47361
          mmWidth = 43392
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText12: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText11'
          Border.mmPadding = 0
          DataField = 'NomeCliente'
          DataPipeline = ppCapaMyIndaiaV2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 3440
          mmLeft = 34660
          mmTop = 57679
          mmWidth = 110331
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText13: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText12'
          Border.mmPadding = 0
          DataField = 'EndCliente'
          DataPipeline = ppCapaMyIndaiaV2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 3440
          mmLeft = 34660
          mmTop = 62442
          mmWidth = 165365
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText14: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText13'
          Border.mmPadding = 0
          DataField = 'CNPJCliente'
          DataPipeline = ppCapaMyIndaiaV2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 3440
          mmLeft = 34660
          mmTop = 70644
          mmWidth = 64294
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText15: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText14'
          Border.mmPadding = 0
          DataField = 'CidadeCliente'
          DataPipeline = ppCapaMyIndaiaV2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 3440
          mmLeft = 34660
          mmTop = 66675
          mmWidth = 76200
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText16: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText15'
          Border.mmPadding = 0
          DataField = 'NM_AREA'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 34925
          mmTop = 81492
          mmWidth = 85196
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText17: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText16'
          Border.mmPadding = 0
          DataField = 'NM_REFERENCIA'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          WordWrap = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 6879
          mmLeft = 34925
          mmTop = 85725
          mmWidth = 105040
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText18: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText17'
          Border.mmPadding = 0
          DataField = 'BairroCliente'
          DataPipeline = ppCapaMyIndaiaV2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 3440
          mmLeft = 129911
          mmTop = 66675
          mmWidth = 70115
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText19: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText18'
          Border.mmPadding = 0
          DataField = 'inscEstadual'
          DataPipeline = ppCapaMyIndaiaV2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 3440
          mmLeft = 120915
          mmTop = 70644
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText20: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText19'
          Border.mmPadding = 0
          DataField = 'UFCliente'
          DataPipeline = ppCapaMyIndaiaV2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 3440
          mmLeft = 155046
          mmTop = 70644
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText21: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText20'
          Border.mmPadding = 0
          DataField = 'CepCliente'
          DataPipeline = ppCapaMyIndaiaV2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 3440
          mmLeft = 179917
          mmTop = 70644
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText22: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText21'
          Border.mmPadding = 0
          DataField = 'NM_CONTATO'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 142611
          mmTop = 81492
          mmWidth = 57415
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText23: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText22'
          Border.mmPadding = 0
          DataField = 'NM_NAT_DESPACHO'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 51065
          mmTop = 96838
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText24: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText23'
          Border.mmPadding = 0
          DataField = 'NM_VEICULO'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 34925
          mmTop = 101071
          mmWidth = 45508
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText25: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText24'
          BlankWhenZero = True
          Border.mmPadding = 0
          DataField = 'VOLUME'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 34925
          mmTop = 105040
          mmWidth = 45508
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText26: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText25'
          Border.mmPadding = 0
          DataField = 'VL_FOB'
          DataPipeline = ppCapaBroker
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 40217
          mmTop = 109273
          mmWidth = 40217
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText27: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText27'
          Border.mmPadding = 0
          DataField = 'NM_VIA_TRANSPORTE'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3969
          mmLeft = 104246
          mmTop = 96309
          mmWidth = 41010
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText28: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText28'
          Border.mmPadding = 0
          DataField = 'NM_LOCAL_EMBARQUE'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 104246
          mmTop = 105040
          mmWidth = 41010
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText29: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText29'
          Border.mmPadding = 0
          DataField = 'VL_PESO_BRUTO'
          DataPipeline = ppCapaBroker
          DisplayFormat = '#0.,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 104246
          mmTop = 109802
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText30: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText30'
          Border.mmPadding = 0
          DataField = 'VL_CIF_MN'
          DataPipeline = ppCapaBroker
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 109009
          mmTop = 114035
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText31: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText31'
          Border.mmPadding = 0
          DataField = 'NM_LOCAL_DESEMBARQUE'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 162190
          mmTop = 105040
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText32: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText32'
          Border.mmPadding = 0
          DataField = 'VL_PESO_LIQUIDO'
          DataPipeline = ppCapaBroker
          DisplayFormat = '#0.,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 162454
          mmTop = 109802
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel116: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label22'
          Border.mmPadding = 0
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 34925
          mmTop = 109273
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel117: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label46'
          Border.mmPadding = 0
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 104246
          mmTop = 114035
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText57: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText57'
          Border.mmPadding = 0
          DataField = 'RPS'
          DataPipeline = ppFaturamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 14
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppFaturamento'
          mmHeight = 5821
          mmLeft = 167482
          mmTop = 24606
          mmWidth = 30692
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBText40: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText9'
          Border.mmPadding = 0
          DataField = 'NR_DI'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 34925
          mmTop = 113506
          mmWidth = 45773
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppLabel119: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label62'
          Border.mmPadding = 0
          Caption = 'RPS - '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 14
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 5842
          mmLeft = 153988
          mmTop = 24606
          mmWidth = 13420
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText46: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText40'
          Border.mmPadding = 0
          DataField = 'NM_EXPORTADOR'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 104246
          mmTop = 101071
          mmWidth = 41010
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText48: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText401'
          Border.mmPadding = 0
          DataField = 'NM_AGENTE'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 162454
          mmTop = 96838
          mmWidth = 35454
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText55: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText46'
          Border.mmPadding = 0
          DataField = 'DT_DESEMBARACO'
          DataPipeline = ppCapaBroker
          DisplayFormat = 'mm/dd/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 162454
          mmTop = 114035
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel120: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label10'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 14
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          Visible = False
          mmHeight = 5821
          mmLeft = 158221
          mmTop = 10054
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel121: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label64'
          Border.mmPadding = 0
          Caption = 'CNPJ.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 3175
          mmLeft = 7408
          mmTop = 37042
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel122: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label66'
          Border.mmPadding = 0
          Caption = 'TEL.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 3175
          mmLeft = 7408
          mmTop = 40217
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel123: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label67'
          Border.mmPadding = 0
          Caption = 'I.EST.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 3175
          mmLeft = 61383
          mmTop = 37042
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel124: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label68'
          Border.mmPadding = 0
          Caption = 'FAX.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 3175
          mmLeft = 61383
          mmTop = 40217
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel125: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label69'
          Border.mmPadding = 0
          Caption = 'I.MUN.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 3175
          mmLeft = 79904
          mmTop = 37042
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText58: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText55'
          Border.mmPadding = 0
          DataField = 'IMUnidFat'
          DataPipeline = ppFaturamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFaturamento'
          mmHeight = 2910
          mmLeft = 88371
          mmTop = 37042
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText59: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText59'
          Border.mmPadding = 0
          DataField = 'CEP_INDAIA'
          DataPipeline = ppCapaMyIndaiaV2
          DisplayFormat = '00000-000;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 2910
          mmLeft = 48948
          mmTop = 33867
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel126: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label70'
          Border.mmPadding = 0
          Caption = 'CEP:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 3175
          mmLeft = 42598
          mmTop = 33867
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText62: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText62'
          Border.mmPadding = 0
          DataField = 'CIDADE_INDAIA'
          DataPipeline = ppCapaMyIndaiaV2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 2910
          mmLeft = 76465
          mmTop = 33867
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText64: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText64'
          Border.mmPadding = 0
          DataField = 'END_UF'
          DataPipeline = ppCapaMyIndaiaV2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaMyIndaiaV2'
          mmHeight = 2910
          mmLeft = 92075
          mmTop = 33867
          mmWidth = 4233
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText66: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText58'
          Border.mmPadding = 0
          DataField = 'DataEmissao'
          DataPipeline = ppFaturamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFaturamento'
          mmHeight = 3440
          mmLeft = 127794
          mmTop = 40481
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel3: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label28'
          Border.mmPadding = 0
          Caption = ' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 34925
          mmTop = 119591
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText42: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText42'
          Border.mmPadding = 0
          DataField = 'FATURA_PROCESSO'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 142875
          mmTop = 85725
          mmWidth = 57415
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText43: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText43'
          Border.mmPadding = 0
          DataField = 'IMPORTADOR'
          DataPipeline = ppCapaBroker
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppCapaBroker'
          mmHeight = 3440
          mmLeft = 162186
          mmTop = 100809
          mmWidth = 35454
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        PrintHeight = phDynamic
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 230000
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'ANO_EMISSAO'
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      StartOnOddPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      NewFile = False
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBMemo2: TppDBMemo
          DesignLayer = ppDesignLayer2
          UserName = 'DBMemo2'
          Border.mmPadding = 0
          CharWrap = False
          DataField = 'obs'
          DataPipeline = ppFaturamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          RemoveEmptyLines = False
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppFaturamento'
          mmHeight = 3969
          mmLeft = 7673
          mmTop = 0
          mmWidth = 145521
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          mmLeading = 0
        end
        object ppLabel4: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label36'
          Border.mmPadding = 0
          Caption = ' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 29898
          mmTop = 0
          mmWidth = 27252
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBText37: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText26'
          Border.mmPadding = 0
          DataField = 'name'
          DataPipeline = ppReembolso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppReembolso'
          mmHeight = 3440
          mmLeft = 7673
          mmTop = 794
          mmWidth = 145521
          BandType = 5
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBText38: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText41'
          BlankWhenZero = True
          Border.mmPadding = 0
          DataField = 'ValorReembolso'
          DataPipeline = ppReembolso
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReembolso'
          mmHeight = 3440
          mmLeft = 165894
          mmTop = 794
          mmWidth = 33602
          BandType = 5
          GroupNo = 1
          LayerName = Foreground1
        end
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'PageLayer1'
        LayerType = ltPage
        Index = 0
      end
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 1
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object Faturamento: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'Nota'
        DataType = ftInteger
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  B.ID BILLIND_ID,'
      '        ISNULL(B.SENIORKEY,B.ID) RPS,'
      '        CONVERT(VARCHAR,CREATED,103) DATAEMISSAO,'
      '        CONVERT(VARCHAR,DUEDATE,103) DATAVENCIMENTO,'
      '        UN.NM_UNID_NEG NOMEUNIDFAT,'
      '        UN.END_UNID_NEG ENDUNIDFAT,'
      '        UN.CGC_UNID_NEG CNPJUNIDFAT,'
      '        UN.NR_FONE TELUNIDFAT,'
      '        UN.END_BAIRRO BAIRROUNIDFAT,'
      '        UN.IE_UNID_NEG IEUNIDFAT,'
      '        UN.IM_UNID_NEG IMUNIDFAT,'
      '        UN.END_CIDADE CIDADEUNIDFAT,'
      '        UN.NR_FAX1 FAXUNIDFAT,'
      '        UN.END_UF UFUNIDFAT,'
      '        UN.END_CEP CEPUNIDFAT ,'
      '        CONVERT(VARCHAR(4000),ISNULL(B.OBS,'#39#39')) OBS      ,'
      '       '#39'-'#39' + RIGHT(YEAR(B.CREATED), 2) + '
      '       CASE WHEN B.TOTAL < 0 THEN '#39'C'#39' ELSE '#39#39' END'
      '      AS ANO_BASF '
      'FROM BILLING      B  (NOLOCK)'
      'INNER JOIN BRANCH BR (NOLOCK) ON BR.ID=B.BRANCH_ID'
      
        'INNER JOIN BROKER.DBO.TUNID_NEG UN  (NOLOCK) ON UN.CD_UNID_NEG=B' +
        'R.AKEY'
      'WHERE B.ID= :NOTA')
    Left = 152
    Top = 232
    object Faturamentobillind_id: TLargeintField
      FieldName = 'billind_id'
      ReadOnly = True
    end
    object FaturamentoRPS: TWideStringField
      FieldName = 'RPS'
      Size = 255
    end
    object FaturamentoDataEmissao: TStringField
      FieldName = 'DataEmissao'
      ReadOnly = True
      Size = 30
    end
    object FaturamentoDataVencimento: TStringField
      FieldName = 'DataVencimento'
      ReadOnly = True
      Size = 30
    end
    object FaturamentoNomeUnidFat: TStringField
      FieldName = 'NomeUnidFat'
      FixedChar = True
      Size = 50
    end
    object FaturamentoEndUnidFat: TStringField
      FieldName = 'EndUnidFat'
      FixedChar = True
      Size = 50
    end
    object FaturamentoCNPJUnidFat: TStringField
      FieldName = 'CNPJUnidFat'
      FixedChar = True
      Size = 14
    end
    object FaturamentoTelUnidFat: TStringField
      FieldName = 'TelUnidFat'
    end
    object FaturamentoBairroUnidFat: TStringField
      FieldName = 'BairroUnidFat'
      FixedChar = True
      Size = 30
    end
    object FaturamentoIEUnidFat: TStringField
      FieldName = 'IEUnidFat'
      FixedChar = True
    end
    object FaturamentoIMUnidFat: TStringField
      FieldName = 'IMUnidFat'
      FixedChar = True
    end
    object FaturamentoCidadeUnidFat: TStringField
      FieldName = 'CidadeUnidFat'
      FixedChar = True
      Size = 30
    end
    object FaturamentoFaxUnidFat: TStringField
      FieldName = 'FaxUnidFat'
    end
    object FaturamentoUFUnidFat: TStringField
      FieldName = 'UFUnidFat'
      FixedChar = True
      Size = 2
    end
    object FaturamentoCEPUnidFat: TStringField
      FieldName = 'CEPUnidFat'
      FixedChar = True
      Size = 8
    end
    object Faturamentoobs: TStringField
      FieldName = 'obs'
      ReadOnly = True
      Size = 4000
    end
    object FaturamentoANO_BASF: TStringField
      FieldName = 'ANO_BASF'
      ReadOnly = True
      Size = 5
    end
  end
  object dspFaturamento: TDataSetProvider
    DataSet = Faturamento
    Left = 272
    Top = 232
  end
  object dsFaturamento: TDataSource
    DataSet = cdsFaturamento
    Left = 400
    Top = 232
  end
  object cdsFaturamento: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 19
        Name = 'Nota'
        ParamType = ptInput
        Size = 8
      end>
    ProviderName = 'dspFaturamento'
    Left = 528
    Top = 232
    object cdsFaturamentobillind_id: TLargeintField
      FieldName = 'billind_id'
      ReadOnly = True
    end
    object cdsFaturamentoRPS: TWideStringField
      FieldName = 'RPS'
      Size = 255
    end
    object cdsFaturamentoDataEmissao: TStringField
      FieldName = 'DataEmissao'
      ReadOnly = True
      Size = 30
    end
    object cdsFaturamentoDataVencimento: TStringField
      FieldName = 'DataVencimento'
      ReadOnly = True
      Size = 30
    end
    object cdsFaturamentoNomeUnidFat: TStringField
      FieldName = 'NomeUnidFat'
      FixedChar = True
      Size = 50
    end
    object cdsFaturamentoEndUnidFat: TStringField
      FieldName = 'EndUnidFat'
      FixedChar = True
      Size = 50
    end
    object cdsFaturamentoCNPJUnidFat: TStringField
      FieldName = 'CNPJUnidFat'
      FixedChar = True
      Size = 14
    end
    object cdsFaturamentoTelUnidFat: TStringField
      FieldName = 'TelUnidFat'
    end
    object cdsFaturamentoBairroUnidFat: TStringField
      FieldName = 'BairroUnidFat'
      FixedChar = True
      Size = 30
    end
    object cdsFaturamentoIEUnidFat: TStringField
      FieldName = 'IEUnidFat'
      FixedChar = True
    end
    object cdsFaturamentoIMUnidFat: TStringField
      FieldName = 'IMUnidFat'
      FixedChar = True
    end
    object cdsFaturamentoCidadeUnidFat: TStringField
      FieldName = 'CidadeUnidFat'
      FixedChar = True
      Size = 30
    end
    object cdsFaturamentoFaxUnidFat: TStringField
      FieldName = 'FaxUnidFat'
    end
    object cdsFaturamentoUFUnidFat: TStringField
      FieldName = 'UFUnidFat'
      FixedChar = True
      Size = 2
    end
    object cdsFaturamentoCEPUnidFat: TStringField
      FieldName = 'CEPUnidFat'
      FixedChar = True
      Size = 8
    end
    object cdsFaturamentoobs: TStringField
      FieldName = 'obs'
      ReadOnly = True
      Size = 4000
    end
    object cdsFaturamentoANO_BASF: TStringField
      FieldName = 'ANO_BASF'
      ReadOnly = True
      Size = 3
    end
  end
  object ppFaturamento: TppDBPipeline
    DataSource = dsFaturamento
    UserName = 'Faturamento'
    Left = 664
    Top = 240
    object ppFaturamentoppField1: TppField
      FieldAlias = 'billind_id'
      FieldName = 'billind_id'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 0
    end
    object ppFaturamentoppField2: TppField
      FieldAlias = 'RPS'
      FieldName = 'RPS'
      FieldLength = 255
      DisplayWidth = 255
      Position = 1
    end
    object ppFaturamentoppField3: TppField
      FieldAlias = 'DataEmissao'
      FieldName = 'DataEmissao'
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object ppFaturamentoppField4: TppField
      FieldAlias = 'DataVencimento'
      FieldName = 'DataVencimento'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppFaturamentoppField5: TppField
      FieldAlias = 'NomeUnidFat'
      FieldName = 'NomeUnidFat'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppFaturamentoppField6: TppField
      FieldAlias = 'EndUnidFat'
      FieldName = 'EndUnidFat'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppFaturamentoppField7: TppField
      FieldAlias = 'CNPJUnidFat'
      FieldName = 'CNPJUnidFat'
      FieldLength = 14
      DisplayWidth = 14
      Position = 6
    end
    object ppFaturamentoppField8: TppField
      FieldAlias = 'TelUnidFat'
      FieldName = 'TelUnidFat'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppFaturamentoppField9: TppField
      FieldAlias = 'BairroUnidFat'
      FieldName = 'BairroUnidFat'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object ppFaturamentoppField10: TppField
      FieldAlias = 'IEUnidFat'
      FieldName = 'IEUnidFat'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object ppFaturamentoppField11: TppField
      FieldAlias = 'IMUnidFat'
      FieldName = 'IMUnidFat'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object ppFaturamentoppField12: TppField
      FieldAlias = 'CidadeUnidFat'
      FieldName = 'CidadeUnidFat'
      FieldLength = 30
      DisplayWidth = 30
      Position = 11
    end
    object ppFaturamentoppField13: TppField
      FieldAlias = 'FaxUnidFat'
      FieldName = 'FaxUnidFat'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppFaturamentoppField14: TppField
      FieldAlias = 'UFUnidFat'
      FieldName = 'UFUnidFat'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppFaturamentoppField15: TppField
      FieldAlias = 'CEPUnidFat'
      FieldName = 'CEPUnidFat'
      FieldLength = 8
      DisplayWidth = 8
      Position = 14
    end
    object ppFaturamentoppField16: TppField
      FieldAlias = 'obs'
      FieldName = 'obs'
      FieldLength = 4000
      DisplayWidth = 4000
      Position = 15
    end
    object ppFaturamentoppField17: TppField
      FieldAlias = 'ANO_BASF'
      FieldName = 'ANO_BASF'
      FieldLength = 3
      DisplayWidth = 3
      Position = 16
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.GuidCollationType = gcString
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = Report
    IniStorageType = 'IniFile'
    IniStorageName = '($LocalAppData)\RBuilder\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 8
  end
  object TotaisFatura: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'idFatura'
        DataType = ftWideString
        Precision = 19
        Size = 8
        Value = '16174'
      end>
    SQL.Strings = (
      'SELECT CONVERT(VARCHAR,CR.CREATED,103)    DATANUMERARIO,'
      '       CR.CASHREQUESTTOTAL                TOTALNUMERARIO,'
      '       SUM(ISNULL(PR.PAYMENTTOTAL,0)) + '
      '           ISNULL(R.TOTALREEMBOLSO,0)     TOTALDESPESA,'
      '      (ISNULL(B.TOTAL,0) * -1) + '
      '      ISNULL((CASE WHEN B.TOTAL > 0 '
      '                   THEN R.TOTALREEMBOLSO * - 1  '
      '                   ELSE R.TOTALREEMBOLSO '
      '              END ),0)                    TOTALFATURA,'
      '       CASE WHEN  B.TOTAL > 0 '
      '            THEN '#39'N/FAVOR'#39' '
      '            ELSE '#39'S/FAVOR'#39' '
      '       END                                TPFATURA,'
      '       VALORTIBUTAVEL,'
      '       ISNULL((SELECT TOP 1 SUM(II.PRICE) HONORARIO'
      '                 FROM BILLING              B2  (NOLOCK)'
      
        '           INNER JOIN BILLING_ITEMINVOICED BII (NOLOCK)ON BII.BI' +
        'LLING_ID=B2.ID'
      
        '           INNER JOIN ITEMINVOICED         II  (NOLOCK)ON II.ID=' +
        'BII.ITENSINVOICED_ID'
      
        '           INNER JOIN ITEM                 I   (NOLOCK)ON I.ID=I' +
        'I.ITEM_ID'
      
        '           INNER JOIN CUSTOMCLEARANCE      CC  (NOLOCK)ON CC.ID=' +
        'II.CUSTOMCLEARANCE_ID'
      '        WHERE I.AKEY=822 '
      '          AND CC.ID IN (SELECT DISTINCT II.CUSTOMCLEARANCE_ID'
      '                          FROM ITEMINVOICED         II  (NOLOCK)'
      
        '                    INNER JOIN BILLING_ITEMINVOICED BII (NOLOCK)' +
        ' ON II.ID=BII.ITENSINVOICED_ID'
      '                         WHERE BILLING_ID=B.ID) '
      '                           AND STATUS <> '#39'CLOSED'#39
      '        GROUP BY B2.ID),0)                HONOR'#193'RIO,'
      '        ISNULL(B.IR,0) AS IR,'
      '        ISNULL(B.COFINS,0) AS COFINS,'
      '        ISNULL(B.ISS,0) ISS,'
      '        (( (ISNULL(B.TOTAL,0) + ISNULL(R.TOTALREEMBOLSO,0)) - '
      '            ISNULL(B.IR,0) - '
      '            ISNULL(B.COFINS,0) - '
      '            ISNULL(B.ISS,0) ) * -1) TOTALDESCONTADOIMPOSTO'
      'FROM BILLING                       B'
      
        'LEFT JOIN BILLING_CASHREQUESTED    BCR (NOLOCK)ON BCR.BILLING_ID' +
        ' = B.ID'
      
        'LEFT JOIN CASHREQUESTED            CR  (NOLOCK)ON CR.ID         ' +
        ' = BCR.CASHREQUESTS_ID'
      
        'LEFT JOIN BILLING_PAYMENTREQUESTED BPR (NOLOCK)ON BPR.BILLING_ID' +
        ' = B.ID'
      
        'LEFT JOIN PAYMENTREQUESTED         PR  (NOLOCK)ON PR.ID         ' +
        ' = BPR.PAYMENTS_ID'
      
        'LEFT JOIN VW_TOTALREEMBOLSOFATURA  R   (NOLOCK)ON R.BILLING_ID  ' +
        ' = B.ID'
      ' WHERE B.ID= :IDFATURA'
      'GROUP BY CR.CREATED,'
      '         CR.CASHREQUESTTOTAL,'
      '         B.TOTAL,'
      '         VALORTIBUTAVEL,'
      '         B.ID,'
      '         ISNULL(B.IR,0),'
      '         ISNULL(B.ISS,0),'
      '         ISNULL(B.COFINS,0),'
      '         R.TOTALREEMBOLSO')
    Left = 144
    Top = 368
    object TotaisFaturaDataNumerario: TStringField
      FieldName = 'DataNumerario'
      ReadOnly = True
      Size = 30
    end
    object TotaisFaturaTotalNumerario: TBCDField
      FieldName = 'TotalNumerario'
      Precision = 19
      Size = 2
    end
    object TotaisFaturaTotalDespesa: TFMTBCDField
      FieldName = 'TotalDespesa'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object TotaisFaturaTotalFatura: TBCDField
      FieldName = 'TotalFatura'
      Precision = 19
      Size = 2
    end
    object TotaisFaturaTpFatura: TStringField
      FieldName = 'TpFatura'
      ReadOnly = True
      Size = 7
    end
    object TotaisFaturavalorTibutavel: TBCDField
      FieldName = 'valorTibutavel'
      Precision = 19
      Size = 2
    end
    object TotaisFaturaHonorário: TFMTBCDField
      FieldName = 'Honor'#225'rio'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object TotaisFaturair: TBCDField
      FieldName = 'ir'
      Precision = 19
      Size = 2
    end
    object TotaisFaturacofins: TBCDField
      FieldName = 'cofins'
      Precision = 19
      Size = 2
    end
    object TotaisFaturaTotalDescontadoImposto: TFMTBCDField
      FieldName = 'TotalDescontadoImposto'
      ReadOnly = True
      Precision = 21
      Size = 2
    end
    object TotaisFaturaiss: TBCDField
      FieldName = 'iss'
      Precision = 19
      Size = 2
    end
  end
  object dspTotaisFatura: TDataSetProvider
    DataSet = TotaisFatura
    Left = 272
    Top = 368
  end
  object dsTotaisFatura: TDataSource
    DataSet = cdsTotaisFatura
    Left = 400
    Top = 368
  end
  object cdsTotaisFatura: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 19
        Name = 'idFatura'
        ParamType = ptInput
        Size = 8
        Value = '16174'
      end>
    ProviderName = 'dspTotaisFatura'
    Left = 528
    Top = 368
    object cdsTotaisFaturaDataNumerario: TStringField
      FieldName = 'DataNumerario'
      ReadOnly = True
      Size = 30
    end
    object cdsTotaisFaturaTotalNumerario: TBCDField
      FieldName = 'TotalNumerario'
      Precision = 19
      Size = 2
    end
    object cdsTotaisFaturaTotalDespesa: TFMTBCDField
      FieldName = 'TotalDespesa'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsTotaisFaturaTotalFatura: TBCDField
      FieldName = 'TotalFatura'
      Precision = 19
      Size = 2
    end
    object cdsTotaisFaturaTpFatura: TStringField
      FieldName = 'TpFatura'
      ReadOnly = True
      Size = 7
    end
    object cdsTotaisFaturavalorTibutavel: TBCDField
      FieldName = 'valorTibutavel'
      Precision = 19
      Size = 2
    end
    object cdsTotaisFaturaHonorário: TFMTBCDField
      FieldName = 'Honor'#225'rio'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsTotaisFaturair: TBCDField
      FieldName = 'ir'
      Precision = 19
      Size = 2
    end
    object cdsTotaisFaturacofins: TBCDField
      FieldName = 'cofins'
      Precision = 19
      Size = 2
    end
    object cdsTotaisFaturaTotalDescontadoImposto: TFMTBCDField
      FieldName = 'TotalDescontadoImposto'
      ReadOnly = True
      Precision = 21
      Size = 2
    end
    object cdsTotaisFaturaiss: TBCDField
      FieldName = 'iss'
      Precision = 19
      Size = 2
    end
  end
  object ppTotaisFatura: TppDBPipeline
    DataSource = dsTotaisFatura
    UserName = 'TotaisFatura'
    Left = 672
    Top = 368
    object ppTotaisFaturappField1: TppField
      FieldAlias = 'DataNumerario'
      FieldName = 'DataNumerario'
      FieldLength = 30
      DisplayWidth = 30
      Position = 0
    end
    object ppTotaisFaturappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalNumerario'
      FieldName = 'TotalNumerario'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 20
      Position = 1
    end
    object ppTotaisFaturappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalDespesa'
      FieldName = 'TotalDespesa'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 2
    end
    object ppTotaisFaturappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalFatura'
      FieldName = 'TotalFatura'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 20
      Position = 3
    end
    object ppTotaisFaturappField5: TppField
      FieldAlias = 'TpFatura'
      FieldName = 'TpFatura'
      FieldLength = 7
      DisplayWidth = 7
      Position = 4
    end
    object ppTotaisFaturappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'valorTibutavel'
      FieldName = 'valorTibutavel'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 20
      Position = 5
    end
    object ppTotaisFaturappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'Honor'#225'rio'
      FieldName = 'Honor'#225'rio'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 6
    end
    object ppTotaisFaturappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'ir'
      FieldName = 'ir'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 20
      Position = 7
    end
    object ppTotaisFaturappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'cofins'
      FieldName = 'cofins'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 20
      Position = 8
    end
    object ppTotaisFaturappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalDescontadoImposto'
      FieldName = 'TotalDescontadoImposto'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 22
      Position = 9
    end
    object ppTotaisFaturappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'iss'
      FieldName = 'iss'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 20
      Position = 10
    end
  end
  object dsNumerario: TDataSource
    DataSet = cdsNumerario
    Left = 384
    Top = 424
  end
  object dspNumerario: TDataSetProvider
    DataSet = Numerario
    Left = 272
    Top = 424
  end
  object cdsNumerario: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 19
        Name = 'idFatura'
        ParamType = ptInput
        Size = 8
        Value = 0
      end>
    ProviderName = 'dspNumerario'
    Left = 528
    Top = 424
    object cdsNumerarioid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object cdsNumerarioDataNumerario: TStringField
      FieldName = 'DataNumerario'
      ReadOnly = True
      Size = 30
    end
    object cdsNumerarioTotalNumerario: TBCDField
      FieldName = 'TotalNumerario'
      Precision = 19
      Size = 2
    end
    object cdsNumerarioSomaNumerario: TFMTBCDField
      FieldName = 'SomaNumerario'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsNumerarioSeniorKey: TWideStringField
      FieldName = 'SeniorKey'
      ReadOnly = True
      Size = 257
    end
  end
  object ppNumerario: TppDBPipeline
    DataSource = dsNumerario
    UserName = 'Numerario'
    Left = 672
    Top = 432
    object ppNumerarioppField1: TppField
      FieldAlias = 'id'
      FieldName = 'id'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 0
    end
    object ppNumerarioppField2: TppField
      FieldAlias = 'DataNumerario'
      FieldName = 'DataNumerario'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppNumerarioppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalNumerario'
      FieldName = 'TotalNumerario'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 20
      Position = 2
    end
    object ppNumerarioppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SomaNumerario'
      FieldName = 'SomaNumerario'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 3
    end
    object ppNumerarioppField5: TppField
      FieldAlias = 'SeniorKey'
      FieldName = 'SeniorKey'
      FieldLength = 257
      DisplayWidth = 257
      Position = 4
    end
  end
  object Numerario: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'idFatura'
        DataType = ftSmallint
        Precision = 19
        Size = 8
        Value = 0
      end>
    SQL.Strings = (
      'SELECT CR.ID,'
      '       CONVERT(VARCHAR,CR.RECEIVEDDATE,103) DATANUMERARIO,'
      '       CR.CASHREQUESTTOTAL                  TOTALNUMERARIO,'
      '       (SELECT SUM(ISNULL(CR2.CASHREQUESTTOTAL,0)) '
      '          FROM BILLING                   B2   (NOLOCK)'
      
        '        INNER JOIN BILLING_CASHREQUESTED BCR2 (NOLOCK)ON BCR2.BI' +
        'LLING_ID = B2.ID'
      
        '        INNER JOIN CASHREQUESTED         CR2  (NOLOCK)ON CR2.ID ' +
        '         = BCR2.CASHREQUESTS_ID'
      '        WHERE B2.ID= B.ID '
      '          AND CASHREQUESTTOTAL <> '#39'0.00'#39')   SOMANUMERARIO,'
      '       '#39'('#39'+ CR.SENIORKEY + '#39')'#39'              SENIORKEY'
      'FROM BILLING                      B   (NOLOCK)'
      
        'INNER JOIN BILLING_CASHREQUESTED  BCR (NOLOCK) ON BCR.BILLING_ID' +
        ' = B.ID'
      
        'INNER JOIN CASHREQUESTED          CR  (NOLOCK) ON CR.ID         ' +
        ' = BCR.CASHREQUESTS_ID'
      'WHERE B.ID= :IDFATURA '
      '  AND CASHREQUESTTOTAL <> '#39'0.00'#39
      'GROUP BY CR.ID,'
      '         CR.CREATED,'
      '         CR.CASHREQUESTTOTAL,'
      '         B.ID,'
      '         CR.RECEIVEDDATE,'
      '         CR.SENIORKEY')
    Left = 144
    Top = 424
    object Numerarioid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object NumerarioDataNumerario: TStringField
      FieldName = 'DataNumerario'
      ReadOnly = True
      Size = 30
    end
    object NumerarioTotalNumerario: TBCDField
      FieldName = 'TotalNumerario'
      Precision = 19
      Size = 2
    end
    object NumerarioSomaNumerario: TFMTBCDField
      FieldName = 'SomaNumerario'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object NumerarioSeniorKey: TWideStringField
      FieldName = 'SeniorKey'
      ReadOnly = True
      Size = 257
    end
  end
  object Consolidado: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'ProcessoID'
        DataType = ftInteger
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'idFatura'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT SUM(HONORARIO)       AS HONORARIO,'
      '       SUM(IR)              AS IR,'
      '       SUM(COFINS)          AS COFINS, '
      '       SUM(ISS)             AS ISS,'
      '       SUM(TOTASERVICOS)    AS TOTASERVICOS,'
      '       SUM(TOTALFATSERVICO) AS TOTALFATSERVICO,'
      '       SUM(TOTALFATDESPESA) AS TOTALFATDESPESA,'
      
        '      (SUM(TOTALFATSERVICO) + SUM(TOTALFATDESPESA))*-1  AS TOTAL' +
        'CONSOLIDADO,'
      
        '       SUM(TOTASERVICOS)    + SUM(TOTALDESPESA)         AS TOTAL' +
        'GERAL'
      'FROM '
      '(SELECT SUM(ISNULL(II.PRICE,0))  AS HONORARIO,'
      '        ISNULL(B2.IR, 0)         AS IR,'
      '        ISNULL(B2.COFINS,0)      AS COFINS,'
      '        ISNULL(B2.ISS, 0)        AS ISS,'
      '        ISNULL(B2.TOTAL,0)       AS TOTASERVICOS,'
      '        0                        AS TOTALDESPESA,'
      '        (ISNULL(B2.TOTAL, 0)  - '
      '         ISNULL(B2.COFINS,0)  - '
      '         ISNULL(B2.IR,0)      - '
      '         ISNULL(B2.ISS,0)'
      '         )                       AS TOTALFATSERVICO, '
      '        0                        AS TOTALFATDESPESA'
      '    FROM BILLING                    B2 (NOLOCK)'
      
        '    INNER JOIN BILLING_ITEMINVOICED BII(NOLOCK) ON BII.BILLING_I' +
        'D = B2.ID'
      
        '    INNER JOIN ITEMINVOICED         II (NOLOCK) ON II.ID        ' +
        '  = BII.ITENSINVOICED_ID'
      
        '    INNER JOIN ITEM                 I  (NOLOCK) ON I.ID         ' +
        '  = II.ITEM_ID'
      
        '    INNER JOIN CUSTOMCLEARANCE      CC (NOLOCK) ON CC.ID        ' +
        '  = II.CUSTOMCLEARANCE_ID'
      '    WHERE B2.TYPE   = '#39'TAX_INVOICE'#39'  '
      '      AND B2.STATUS <> '#39'CLOSED'#39' '
      '      AND CC.ID     =   :PROCESSOID'
      'GROUP BY ISNULL(B2.COFINS,0),'
      '         ISNULL(B2.IR,0),'
      '         ISNULL(B2.ISS,0),'
      '         ISNULL(B2.TOTAL, 0)'
      '         '
      '    UNION ALL'
      '    '
      '    SELECT  DISTINCT 0                 AS HONORARIO,'
      '                     0                 AS IR,'
      '                     0                 AS COFINS,'
      '                     ISNULL(B2.ISS,0)  AS ISS,'
      '                     0                 AS TOTASERVICOS,'
      '                     SUM(II.PRICE)     AS TOTALDESPESA,'
      '                     0                 AS TOTALFATSERVICO,'
      '                     (ISNULL(B2.TOTAL,0) + '
      '                      ISNULL(R.PRICE,0) - '
      '                      ISNULL(B2.ISS,0))  AS TOTALFATDESPESA'
      '    FROM BILLING                    B2  (NOLOCK)'
      
        '    INNER JOIN BILLING_ITEMINVOICED BII (NOLOCK)ON BII.BILLING_I' +
        'D = B2.ID'
      
        '    INNER JOIN ITEMINVOICED         II  (NOLOCK)ON II.ID        ' +
        '  = BII.ITENSINVOICED_ID'
      
        '    INNER JOIN ITEM                 I   (NOLOCK)ON I.ID         ' +
        '  = II.ITEM_ID'
      
        '    INNER JOIN CUSTOMCLEARANCE      CC  (NOLOCK)ON CC.ID        ' +
        '  = II.CUSTOMCLEARANCE_ID'
      
        '    LEFT  JOIN REFUND               R   (NOLOCK)ON R.BILLING_ID ' +
        '  = B2.ID'
      '    WHERE B2.ID = :IDFATURA '
      '    GROUP BY ISNULL(B2.ISS,0),'
      '             ISNULL(B2.TOTAL,0),'
      '             ISNULL(R.PRICE,0)'
      ' ) AS TABELA')
    Left = 144
    Top = 480
    object ConsolidadoHonorario: TFMTBCDField
      FieldName = 'Honorario'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoIr: TFMTBCDField
      FieldName = 'Ir'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoIss: TFMTBCDField
      FieldName = 'Iss'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoCofins: TFMTBCDField
      FieldName = 'Cofins'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoTotalFatServico: TFMTBCDField
      FieldName = 'TotalFatServico'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoTotaServicos: TFMTBCDField
      FieldName = 'TotaServicos'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoTotalFatDespesa: TFMTBCDField
      FieldName = 'TotalFatDespesa'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoTotalConsolidado: TFMTBCDField
      FieldName = 'TotalConsolidado'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoTotalGeral: TFMTBCDField
      FieldName = 'TotalGeral'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object dspConsolidado: TDataSetProvider
    DataSet = Consolidado
    Left = 272
    Top = 480
  end
  object cdsConsolidado: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 19
        Name = 'ProcessoID'
        ParamType = ptInput
        Size = 8
      end
      item
        DataType = ftInteger
        Name = 'idFatura'
        ParamType = ptInput
        Size = -1
      end>
    ProviderName = 'dspConsolidado'
    Left = 528
    Top = 480
    object cdsConsolidadoHonorario: TFMTBCDField
      FieldName = 'Honorario'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoIr: TFMTBCDField
      FieldName = 'Ir'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoCofins: TFMTBCDField
      FieldName = 'Cofins'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoTotalFatServico: TFMTBCDField
      FieldName = 'TotalFatServico'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoTotaServicos: TFMTBCDField
      FieldName = 'TotaServicos'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoTotalFatDespesa: TFMTBCDField
      FieldName = 'TotalFatDespesa'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoTotalConsolidado: TFMTBCDField
      FieldName = 'TotalConsolidado'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoIss: TFMTBCDField
      FieldName = 'Iss'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoTotalGeral: TFMTBCDField
      FieldName = 'TotalGeral'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object dsConsolidado: TDataSource
    DataSet = cdsConsolidado
    Left = 384
    Top = 480
  end
  object ppConsolidado: TppDBPipeline
    DataSource = dsConsolidado
    UserName = 'Consolidado'
    Left = 672
    Top = 488
    object ppConsolidadoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'Honorario'
      FieldName = 'Honorario'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 0
    end
    object ppConsolidadoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'Ir'
      FieldName = 'Ir'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 1
    end
    object ppConsolidadoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'Cofins'
      FieldName = 'Cofins'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 2
    end
    object ppConsolidadoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalFatServico'
      FieldName = 'TotalFatServico'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 3
    end
    object ppConsolidadoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotaServicos'
      FieldName = 'TotaServicos'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 4
    end
    object ppConsolidadoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalFatDespesa'
      FieldName = 'TotalFatDespesa'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 5
    end
    object ppConsolidadoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalConsolidado'
      FieldName = 'TotalConsolidado'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 6
    end
    object ppConsolidadoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'Iss'
      FieldName = 'Iss'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 7
    end
    object ppConsolidadoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalGeral'
      FieldName = 'TotalGeral'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 8
    end
  end
  object Reembolso: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'billing_id'
        DataType = ftSmallint
        Precision = 19
        Size = 8
        Value = 0
      end>
    SQL.Strings = (
      'SELECT CASE WHEN SUM(ISNULL(PRICE,0)) > 0 '
      '            THEN '#39'Reembolso'#39' '
      '            ELSE NULL '
      '       END        AS NAME,'
      '       SUM(ISNULL(PRICE,0)) AS VALORREEMBOLSO'
      ' FROM REFUND (NOLOCK)'
      ' WHERE BILLING_ID  =  :BILLING_ID')
    Left = 144
    Top = 544
    object Reembolsoname: TStringField
      FieldName = 'name'
      ReadOnly = True
      Size = 9
    end
    object ReembolsoValorReembolso: TFMTBCDField
      FieldName = 'ValorReembolso'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object dspReembolso: TDataSetProvider
    DataSet = Reembolso
    Left = 272
    Top = 544
  end
  object dsReembolso: TDataSource
    DataSet = cdsReembolso
    Left = 384
    Top = 536
  end
  object cdsReembolso: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 19
        Name = 'billing_id'
        ParamType = ptInput
        Size = 8
        Value = 0
      end>
    ProviderName = 'dspReembolso'
    Left = 528
    Top = 544
    object cdsReembolsoname: TStringField
      FieldName = 'name'
      ReadOnly = True
      Size = 9
    end
    object cdsReembolsoValorReembolso: TFMTBCDField
      DisplayWidth = 20
      FieldName = 'ValorReembolso'
      MaxValue = '0'
      MinValue = '0'
      Precision = 19
      Size = 2
    end
  end
  object ppReembolso: TppDBPipeline
    DataSource = dsReembolso
    UserName = 'Reembolso'
    Left = 672
    Top = 536
    object ppReembolsoppField1: TppField
      FieldAlias = 'name'
      FieldName = 'name'
      FieldLength = 9
      DisplayWidth = 9
      Position = 0
    end
    object ppReembolsoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ValorReembolso'
      FieldName = 'ValorReembolso'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 20
      Position = 1
    end
  end
  object ItensDocsemImposto: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'idFatura'
        DataType = ftSmallint
        Size = -1
        Value = 1077
      end>
    SQL.Strings = (
      '/*'
      'SELECT ITEM,'
      '       SUM(VALORITEMCLIENTE) VALORITEMCLIENTE,'
      '       SUM(VALORITEM) VALORITEM'
      'FROM       '
      
        '(SELECT CASE WHEN (SELECT COUNT(DISTINCT II2.CUSTOMCLEARANCE_ID)' +
        ' FROM BILLING_ITEMINVOICED BII2'
      
        '                   INNER JOIN ITEMINVOICED II2 ON BII2.ITENSINVO' +
        'ICED_ID=II2.ID'
      
        '                  WHERE BILLING_ID=B.ID) > 1 AND B.TYPE='#39'TAX_REC' +
        'EIPT'#39' THEN I.NAME +'#39'('#39'+CC.CUSTOMID + '#39'-'#39' + (SELECT MASTER.DBO.RO' +
        'WCONCATLEFT(LTRIM(RTRIM(ISNULL(CD_REFERENCIA,'#39#39')))+'#39'-'#39'+LTRIM(RTR' +
        'IM(ISNULL(NR_ITEM_PO,'#39#39')))+ '#39' - '#39' )'
      
        '       FROM BROKER.DBO.TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO=P' +
        '.NR_PROCESSO AND TP_REFERENCIA IN ('
      
        '       (CASE WHEN P.CD_PRODUTO='#39'02'#39' THEN (SELECT ISNULL(TP_PEDID' +
        'O_BUSCA,'#39'01'#39') FROM BROKER.DBO.TGRUPO (NOLOCK) WHERE CD_GRUPO = G' +
        '.CD_GRUPO)'
      
        '       ELSE (SELECT ISNULL(TP_PEDIDO_BUSCA_IMP,'#39'01'#39') FROM BROKER' +
        '.DBO.TGRUPO (NOLOCK) WHERE CD_GRUPO = G.CD_GRUPO)END),'#39'04'#39') ) + ' +
        #39')'#39' /*+ CASE WHEN ISNULL(PR.SENIORKEY,'#39#39') = '#39#39' THEN '#39#39' ELSE '#39' ('#39 +
        '+MASTER.DBO.ROWCONCAT(PR.SENIORKEY + '#39','#39')+'#39')'#39' END*/ '
      
        '       ELSE  I.NAME /*+  '#39' ('#39'+MASTER.DBO.ROWCONCAT(CASE WHEN ISN' +
        'ULL(PR.SENIORKEY,'#39#39') = '#39#39' THEN '#39#39' ELSE PR.SENIORKEY END  + '#39','#39')+' +
        #39')'#39'*/ END'
      
        '       +  (SELECT CASE WHEN ISNULL( MASTER.DBO.ROWCONCAT(SENIORK' +
        'EY),'#39#39') = '#39#39' THEN '#39#39' ELSE '#39' ('#39' + MASTER.DBO.ROWCONCAT(SENIORKEY ' +
        '+ '#39','#39') + '#39')'#39' END'
      '          FROM BILLING_PAYMENTREQUESTED BPR '
      
        '          INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED PR ON PR.ID' +
        ' = BPR.PAYMENTS_ID'
      
        '              INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAY' +
        'MENTREQUESTED PRIR ON PRIR.PAYMENTREQUESTED_ID = PR.ID'
      
        '              INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED IPR' +
        ' ON IPR.ID = PRIR.ITEMS_ID'
      
        '          WHERE PR.BILLING_ID = B.ID AND IPR.ITEM_ID=II.ITEM_ID ' +
        ') ITEM,'
      '      '
      '       0 VALORITEMCLIENTE,'
      '       SUM(II.PRICE) VALORITEM'
      'FROM BILLING B'
      'INNER JOIN BILLING_ITEMINVOICED BII ON BII.BILLING_ID=B.ID'
      
        '--INNER JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED BPR ON BPR.' +
        'BILLING_ID=B.ID'
      
        '--INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED PR ON PR.ID = BPR.P' +
        'AYMENTS_ID'
      
        '--INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTE' +
        'D PRIR ON PRIR.PAYMENTREQUESTED_ID = PR.ID'
      
        '--INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED IPR ON IPR.ID =' +
        ' PRIR.ITEMS_ID'
      
        'INNER JOIN ITEMINVOICED II          ON II.ID=BII.ITENSINVOICED_I' +
        'D'
      
        'INNER JOIN CUSTOMCLEARANCE CC       ON CC.ID=II.CUSTOMCLEARANCE_' +
        'ID'
      'INNER JOIN CUSTOMER C               ON C.ID=CC.CUSTOMER_ID'
      'INNER JOIN ITEM I                   ON I.ID=II.ITEM_ID'
      'INNER JOIN BROKER.DBO.TPROCESSO P ON P.NR_PROCESSO =CC.CUSTOMID'
      'INNER JOIN BROKER.DBO.TGRUPO G ON G.CD_GRUPO=P.CD_GRUPO'
      'WHERE B.ID=  /*IDFATURA*/'
      
        'GROUP BY I.NAME,B.ID,CC.CUSTOMID,G.CD_GRUPO,P.NR_PROCESSO,P.CD_P' +
        'RODUTO,B.TYPE,II.ITEM_ID ) AS TABELAITENS'
      'GROUP BY ITEM'
      ''
      '*/'
      ''
      'WITH TAB (TYPE, ID, ITEM_ID, NR_PROCESSO, NAME, VALORITEM) '
      'AS ('
      'SELECT B.TYPE, '
      '       B.ID, '
      '       II.ITEM_ID, '
      '       CC.CUSTOMID   AS NR_PROCESSO, '
      '       I.NAME,'
      '       SUM(II.PRICE) AS VALORITEM'
      'FROM MYINDAIAV2.DBO.BILLING                    B   (NOLOCK)'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK)ON BI' +
        'I.BILLING_ID = B.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED         II  (NOLOCK)ON II' +
        '.ID          = BII.ITENSINVOICED_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE      CC  (NOLOCK)ON CC' +
        '.ID          = II.CUSTOMCLEARANCE_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEM                 I   (NOLOCK)ON I.' +
        'ID           = II.ITEM_ID'
      'WHERE B.ID = :IDFATURA'
      ''
      'GROUP BY I.NAME,'
      '         B.ID,'
      '         CC.CUSTOMID,'
      '         B.TYPE,'
      '         II.ITEM_ID '
      ')'
      ''
      ''
      ''
      'SELECT CONVERT(VARCHAR(8000), SUBSTRING( ISNULL(ITEM, '#39#39') +'
      '      '#9#9#9#9#9#9#9#9#9' CASE WHEN ISNULL(ITEM_DESC,'#39#39') = '#39#39' '
      '      '#9#9#9#9#9#9#9#9#9'      THEN '#39#39
      '      '#9#9#9#9#9#9#9#9#9'      ELSE '#39'('#39'+ITEM_DESC +'#39')'#39
      '      '#9#9#9#9#9#9#9#9#9' END,1,8000)) AS ITEM,'
      '       VALORITEMCLIENTE, '
      '       VALORITEM'
      '       '
      'FROM ('
      
        ' SELECT CASE WHEN (SELECT COUNT(DISTINCT II2.CUSTOMCLEARANCE_ID)' +
        ' '
      
        '                     FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED BI' +
        'I2 (NOLOCK)'
      
        '               INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED         II' +
        '2  (NOLOCK)ON BII2.ITENSINVOICED_ID=II2.ID'
      '                    WHERE BILLING_ID = A.ID) > 1 '
      '              AND A.TYPE='#39'TAX_RECEIPT'#39' '
      '             THEN ISNULL(A.NAME, '#39#39')       + '#39'('#39' +'
      '                  ISNULL(A.NR_PROCESSO,'#39#39') + '#39'-'#39' + '
      '                  ISNULL(STUFF((SELECT  DISTINCT '#39', '#39' + '
      
        '                                LTRIM(RTRIM(ISNULL(CD_REFERENCIA' +
        ','#39#39')))+'
      
        '                                CASE WHEN LTRIM(RTRIM(ISNULL(NR_' +
        'ITEM_PO,'#39#39'))) <> '#39'0000'#39' and'
      
        '                                          LTRIM(RTRIM(ISNULL(NR_' +
        'ITEM_PO,'#39#39'))) <> '#39#39
      
        '                                     THEN '#39'-'#39'+LTRIM(RTRIM(ISNULL' +
        '(NR_ITEM_PO,'#39#39')))'
      '                                     ELSE '#39#39
      '                                END'
      
        '                           FROM BROKER.DBO.TREF_CLIENTE (NOLOCK)' +
        ' '
      '                          WHERE NR_PROCESSO  = P.NR_PROCESSO '
      
        '                            AND TP_REFERENCIA IN (CASE WHEN P.CD' +
        '_PRODUTO = 1 '
      '        '#9#9#9#9#9#9#9'                   THEN P.TP_PEDIDO_BUSCA_IMP '
      '        '#9#9#9#9#9#9#9'                   ELSE P.TP_PEDIDO_BUSCA '
      '        '#9#9#9#9#9#9#9'              END,'
      '        '#9#9#9#9#9#9#9'              CASE WHEN P.CD_GRUPO = '#39'155'#39
      '        '#9#9#9#9#9#9#9'                   THEN '#39'02'#39
      '        '#9#9#9#9#9#9#9'                   ELSE '#39#39
      '        '#9#9#9#9#9#9#9'              END)'
      '        '#9#9#9#9'--ORDER BY TP_REFERENCIA DESC    '
      '                     FOR XML PATH('#39#39')), 1, 1, '#39#39') + '#39')'#39' , '#39#39')'
      '             ELSE  ISNULL(A.NAME , '#39#39')'
      '        END  AS ITEM,   '
      '             '
      '        STUFF((SELECT  TOP 50 '#39', '#39' + ISNULL(SENIORKEY, '#39#39')'
      
        '                  FROM MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED  ' +
        '            BPR  (NOLOCK)'
      
        '            INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED          ' +
        '            PR   (NOLOCK)ON PR.ID = BPR.PAYMENTS_ID'
      
        '            INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYME' +
        'NTREQUESTED PRIR (NOLOCK)ON PRIR.PAYMENTREQUESTED_ID = PR.ID'
      
        '            INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED      ' +
        '            IPR  (NOLOCK)ON IPR.ID = PRIR.ITEMS_ID'
      '          WHERE PR.BILLING_ID = A.ID '
      '            AND IPR.ITEM_ID   = A.ITEM_ID  '
      
        '         FOR XML PATH('#39#39')), 1, 1, '#39#39') AS ITEM_DESC,             ' +
        '  '
      '       0                              AS VALORITEMCLIENTE,'
      '       A.VALORITEM                    AS VALORITEM'
      '   FROM TAB A'
      'CROSS APPLY '
      '( SELECT P1.NR_PROCESSO, '
      '         P1.CD_GRUPO , '
      '         P1.CD_PRODUTO, '
      '         ISNULL(G.TP_PEDIDO_BUSCA,'#39'01'#39')     AS TP_PEDIDO_BUSCA,'
      
        '         ISNULL(G.TP_PEDIDO_BUSCA_IMP,'#39'01'#39') AS TP_PEDIDO_BUSCA_I' +
        'MP'
      '    FROM BROKER.DBO.TPROCESSO P1 (NOLOCK) '
      '    LEFT '
      
        '    JOIN BROKER.DBO.TGRUPO    G   (NOLOCK)ON G.CD_GRUPO    = P1.' +
        'CD_GRUPO    '
      '   WHERE P1.NR_PROCESSO = A.NR_PROCESSO     '
      ' ) P'
      ' '
      ') ITENS')
    Left = 152
    Top = 120
    object ItensDocsemImpostoItem: TWideStringField
      FieldName = 'Item'
      ReadOnly = True
      Size = 4000
    end
    object ItensDocsemImpostovaloritemCliente: TIntegerField
      FieldName = 'valoritemCliente'
      ReadOnly = True
    end
    object ItensDocsemImpostovalorItem: TFMTBCDField
      FieldName = 'valorItem'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object dspItensDocsemImposto: TDataSetProvider
    DataSet = ItensDocsemImposto
    Left = 272
    Top = 120
  end
  object dsItensDocsemImposto: TDataSource
    DataSet = cdsItensDocsemImposto
    Left = 392
    Top = 120
  end
  object cdsItensDocsemImposto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'idFatura'
        ParamType = ptInput
        Size = -1
        Value = 1077
      end>
    ProviderName = 'dspItensDocsemImposto'
    Left = 528
    Top = 120
    object cdsItensDocsemImpostoItem: TWideStringField
      FieldName = 'Item'
      ReadOnly = True
      Size = 4000
    end
    object cdsItensDocsemImpostovaloritemCliente: TIntegerField
      FieldName = 'valoritemCliente'
      ReadOnly = True
    end
    object cdsItensDocsemImpostovalorItem: TFMTBCDField
      FieldName = 'valorItem'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object ppItensDocsemImposto: TppDBPipeline
    DataSource = dsItensDocsemImposto
    UserName = 'ItensDocsemImposto'
    Left = 656
    Top = 128
  end
  object ConsolidadoNumerario: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'ProcessoID'
        DataType = ftInteger
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'idFatura'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT SUM(HONORARIO)       AS HONORARIO,'
      '       SUM(IR)              AS IR,'
      '       SUM(COFINS)          AS COFINS, '
      '       SUM(ISS)             AS ISS,'
      '       SUM(TOTASERVICOS)    AS TOTASERVICOS,'
      '       SUM(TOTALFATSERVICO) AS TOTALFATSERVICO,'
      '       SUM(TOTALFATDESPESA) AS TOTALFATDESPESA,'
      #9#9'SUM(SOMANUMERARIO) AS SOMANUMERARIO,'
      
        '      (SUM(SOMANUMERARIO) -  SUM(TOTASERVICOS) + SUM(IR) + SUM(C' +
        'OFINS)) AS TOTALCONSOLIDADO,'
      '       SUM(TOTASERVICOS)          AS TOTALGERAL'
      '       '
      '       '
      'FROM '
      '(SELECT SUM(ISNULL(II.PRICE,0))  AS HONORARIO,'
      '        ISNULL(B2.IR, 0)         AS IR,'
      '        ISNULL(B2.COFINS,0)      AS COFINS,'
      '        ISNULL(B2.ISS, 0)        AS ISS,'
      '        ISNULL(B2.TOTAL,0)       AS TOTASERVICOS,'
      '        0                        AS TOTALDESPESA,'
      '        (ISNULL(B2.TOTAL, 0)  - '
      '         ISNULL(B2.COFINS,0)  - '
      '         ISNULL(B2.IR,0)      - '
      '         ISNULL(B2.ISS,0)'
      '         )                       AS TOTALFATSERVICO, '
      
        '         CAST('#39'0'#39' AS NUMERIC(9,2))                        AS TOT' +
        'ALFATDESPESA,'
      '        0 AS SOMANUMERARIO'
      '    FROM BILLING                    B2 (NOLOCK)'
      
        '    INNER JOIN BILLING_ITEMINVOICED BII(NOLOCK) ON BII.BILLING_I' +
        'D = B2.ID'
      
        '    INNER JOIN ITEMINVOICED         II (NOLOCK) ON II.ID        ' +
        '  = BII.ITENSINVOICED_ID'
      
        '    INNER JOIN ITEM                 I  (NOLOCK) ON I.ID         ' +
        '  = II.ITEM_ID'
      
        '    INNER JOIN CUSTOMCLEARANCE      CC (NOLOCK) ON CC.ID        ' +
        '  = II.CUSTOMCLEARANCE_ID'
      '    WHERE B2.TYPE   = '#39'TAX_INVOICE'#39'  '
      '      AND B2.STATUS <> '#39'CLOSED'#39' '
      '      AND CC.ID     =  :PROCESSOID '
      ''
      'GROUP BY ISNULL(B2.COFINS,0),'
      '         ISNULL(B2.IR,0),'
      '         ISNULL(B2.ISS,0),'
      '         ISNULL(B2.TOTAL, 0)'
      '         '
      '    UNION ALL'
      '    '
      '    SELECT  DISTINCT 0                 AS HONORARIO,'
      '                     0                 AS IR,'
      '                     0                 AS COFINS,'
      '                     ISNULL(B2.ISS,0)  AS ISS,'
      '                     0                 AS TOTASERVICOS,'
      '                     /*SUM(II.PRICE)*/0     AS TOTALDESPESA,'
      '                     0                 AS TOTALFATSERVICO,'
      
        '                      CAST('#39'0'#39' AS NUMERIC(9,2))  AS TOTALFATDESP' +
        'ESA,'
      '                      SUM(CR.cashRequestTotal) SOMANUMERARIO'
      ''
      '    FROM BILLING                    B2  (NOLOCK)'
      
        '    INNER JOIN BILLING_ITEMINVOICED BII (NOLOCK)ON BII.BILLING_I' +
        'D = B2.ID'
      
        '    INNER JOIN ITEMINVOICED         II  (NOLOCK)ON II.ID        ' +
        '  = BII.ITENSINVOICED_ID'
      
        '    INNER JOIN ITEM                 I   (NOLOCK)ON I.ID         ' +
        '  = II.ITEM_ID'
      
        '    INNER JOIN CUSTOMCLEARANCE      CC  (NOLOCK)ON CC.ID        ' +
        '  = II.CUSTOMCLEARANCE_ID'
      
        '    LEFT  JOIN REFUND               R   (NOLOCK)ON R.BILLING_ID ' +
        '  = B2.ID'
      
        #9'INNER JOIN CASHREQUESTED          CR  (NOLOCK) ON CR.customClea' +
        'rance_id          = cc.id                          '
      '    WHERE B2.ID = :IDFATURA '
      '    GROUP BY ISNULL(B2.ISS,0),'
      '             ISNULL(B2.TOTAL,0),'
      '             ISNULL(R.PRICE,0)'
      ' ) AS TABELA'
      '')
    Left = 144
    Top = 608
    object ConsolidadoNumerarioHONORARIO: TFMTBCDField
      FieldName = 'HONORARIO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoNumerarioIR: TFMTBCDField
      FieldName = 'IR'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoNumerarioCOFINS: TFMTBCDField
      FieldName = 'COFINS'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoNumerarioISS: TFMTBCDField
      FieldName = 'ISS'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoNumerarioTOTASERVICOS: TFMTBCDField
      FieldName = 'TOTASERVICOS'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoNumerarioTOTALFATSERVICO: TFMTBCDField
      FieldName = 'TOTALFATSERVICO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoNumerarioSOMANUMERARIO: TFMTBCDField
      FieldName = 'SOMANUMERARIO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoNumerarioTOTALCONSOLIDADO: TFMTBCDField
      FieldName = 'TOTALCONSOLIDADO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoNumerarioTOTALGERAL: TFMTBCDField
      FieldName = 'TOTALGERAL'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ConsolidadoNumerarioTOTALFATDESPESA: TFMTBCDField
      FieldName = 'TOTALFATDESPESA'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object dspConsolidadoNumerario: TDataSetProvider
    DataSet = ConsolidadoNumerario
    Left = 272
    Top = 608
  end
  object cdsConsolidadoNumerario: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 19
        Name = 'ProcessoID'
        ParamType = ptInput
        Size = 8
      end
      item
        DataType = ftInteger
        Name = 'idFatura'
        ParamType = ptInput
        Size = -1
      end>
    ProviderName = 'dspConsolidadoNumerario'
    Left = 528
    Top = 608
    object cdsConsolidadoNumerarioHONORARIO: TFMTBCDField
      FieldName = 'HONORARIO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoNumerarioIR: TFMTBCDField
      FieldName = 'IR'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoNumerarioCOFINS: TFMTBCDField
      FieldName = 'COFINS'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoNumerarioISS: TFMTBCDField
      FieldName = 'ISS'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoNumerarioTOTASERVICOS: TFMTBCDField
      FieldName = 'TOTASERVICOS'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoNumerarioTOTALFATSERVICO: TFMTBCDField
      FieldName = 'TOTALFATSERVICO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoNumerarioSOMANUMERARIO: TFMTBCDField
      FieldName = 'SOMANUMERARIO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoNumerarioTOTALCONSOLIDADO: TFMTBCDField
      FieldName = 'TOTALCONSOLIDADO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoNumerarioTOTALGERAL: TFMTBCDField
      FieldName = 'TOTALGERAL'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsConsolidadoNumerarioTOTALFATDESPESA: TFMTBCDField
      FieldName = 'TOTALFATDESPESA'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object dsConsolidadoNumerario: TDataSource
    DataSet = cdsConsolidadoNumerario
    Left = 405
    Top = 608
  end
  object ppConsolidadoNumerario: TppDBPipeline
    DataSource = dsConsolidadoNumerario
    UserName = 'ConsolidadoNumerario'
    Left = 672
    Top = 608
    object ppConsolidadoNumerarioppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'HONORARIO'
      FieldName = 'HONORARIO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 0
    end
    object ppConsolidadoNumerarioppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IR'
      FieldName = 'IR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 1
    end
    object ppConsolidadoNumerarioppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'COFINS'
      FieldName = 'COFINS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 2
    end
    object ppConsolidadoNumerarioppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'ISS'
      FieldName = 'ISS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 3
    end
    object ppConsolidadoNumerarioppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTASERVICOS'
      FieldName = 'TOTASERVICOS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 4
    end
    object ppConsolidadoNumerarioppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALFATSERVICO'
      FieldName = 'TOTALFATSERVICO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 5
    end
    object ppConsolidadoNumerarioppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SOMANUMERARIO'
      FieldName = 'SOMANUMERARIO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 6
    end
    object ppConsolidadoNumerarioppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALCONSOLIDADO'
      FieldName = 'TOTALCONSOLIDADO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 7
    end
    object ppConsolidadoNumerarioppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALGERAL'
      FieldName = 'TOTALGERAL'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 8
    end
    object ppConsolidadoNumerarioppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALFATDESPESA'
      FieldName = 'TOTALFATDESPESA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 9
    end
  end
  object dsNumerarioConsolidado: TDataSource
    DataSet = cdsNumerarioConsolidado
    Left = 405
    Top = 666
  end
  object ppNumerarioConsolidado: TppDBPipeline
    DataSource = dsNumerarioConsolidado
    UserName = 'NumerarioConsolidado'
    Left = 672
    Top = 674
    object ppNumerarioConsolidadoppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppNumerarioConsolidadoppField2: TppField
      FieldAlias = 'DATANUMERARIO'
      FieldName = 'DATANUMERARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppNumerarioConsolidadoppField3: TppField
      FieldAlias = 'TOTALNUMERARIO'
      FieldName = 'TOTALNUMERARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppNumerarioConsolidadoppField4: TppField
      FieldAlias = 'SOMANUMERARIO'
      FieldName = 'SOMANUMERARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppNumerarioConsolidadoppField5: TppField
      FieldAlias = 'SENIORKEY'
      FieldName = 'SENIORKEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object cdsNumerarioConsolidado: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'idFatura'
        ParamType = ptInput
        Size = 8
      end>
    ProviderName = 'dspNumerarioConsolidado'
    Left = 528
    Top = 664
    object cdsNumerarioConsolidadoID: TLargeintField
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdsNumerarioConsolidadoDATANUMERARIO: TStringField
      FieldName = 'DATANUMERARIO'
      ReadOnly = True
      Size = 30
    end
    object cdsNumerarioConsolidadoTOTALNUMERARIO: TBCDField
      FieldName = 'TOTALNUMERARIO'
      Precision = 19
      Size = 2
    end
    object cdsNumerarioConsolidadoSOMANUMERARIO: TFMTBCDField
      FieldName = 'SOMANUMERARIO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cdsNumerarioConsolidadoSENIORKEY: TWideStringField
      FieldName = 'SENIORKEY'
      ReadOnly = True
      Size = 257
    end
  end
  object dspNumerarioConsolidado: TDataSetProvider
    DataSet = NumerarioConsolidado
    Left = 272
    Top = 664
  end
  object NumerarioConsolidado: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'idFatura'
        DataType = ftInteger
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CR.ID,'
      '       CONVERT(VARCHAR,CR.RECEIVEDDATE,103) DATANUMERARIO,'
      '       CR.CASHREQUESTTOTAL                  TOTALNUMERARIO,'
      '  SUM(CR.cashRequestTotal) SOMANUMERARIO,'
      '  '
      #9'   '#39'('#39'+ CR.SENIORKEY + '#39')'#39'              SENIORKEY'
      'FROM BILLING                      B   (NOLOCK)'
      'LEFT JOIN BILLING_ITEMINVOICED BII ON BII.Billing_id = B.id'
      'LEFT JOIN ITEMINVOICED II ON II.ID=BII.ITENSINVOICED_ID'
      'LEFT JOIN CUSTOMCLEARANCE CC ON CC.ID=II.CUSTOMCLEARANCE_ID'
      
        'INNER JOIN CASHREQUESTED          CR  (NOLOCK) ON CR.customClear' +
        'ance_id          = cc.id'
      'WHERE B.ID= :idFatura '
      '  AND CASHREQUESTTOTAL <> '#39'0.00'#39
      'GROUP BY CR.ID,'
      '         CR.CREATED,'
      '         CR.CASHREQUESTTOTAL,'
      '         B.ID,'
      '         CR.RECEIVEDDATE,'
      '         CR.SENIORKEY')
    Left = 144
    Top = 664
    object NumerarioConsolidadoID: TLargeintField
      FieldName = 'ID'
      ReadOnly = True
    end
    object NumerarioConsolidadoDATANUMERARIO: TStringField
      FieldName = 'DATANUMERARIO'
      ReadOnly = True
      Size = 30
    end
    object NumerarioConsolidadoTOTALNUMERARIO: TBCDField
      FieldName = 'TOTALNUMERARIO'
      Precision = 19
      Size = 2
    end
    object NumerarioConsolidadoSOMANUMERARIO: TFMTBCDField
      FieldName = 'SOMANUMERARIO'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object NumerarioConsolidadoSENIORKEY: TWideStringField
      FieldName = 'SENIORKEY'
      ReadOnly = True
      Size = 257
    end
  end
end
