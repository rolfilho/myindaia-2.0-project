object dtmIntegracao: TdtmIntegracao
  OldCreateOrder = False
  Height = 163
  Width = 408
  object qryDespesaDE: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PROCESSO'
        Size = -1
        Value = Null
      end
      item
        Name = 'FATURA'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ''
      'SELECT DISTINCT'
      #39'DE'#39' TP_REGISTRO,'
      
        '(SELECT TOP 1 CD_REFERENCIA FROM BROKER.DBO.TREF_CLIENTE RC (NOL' +
        'OCK)'
      '        WHERE RC.NR_PROCESSO = CC.CUSTOMID '
      '          AND TP_REFERENCIA='#39'01'#39') NR_PROCESSO,'
      
        'REPLACE(CONVERT(VARCHAR,CASE WHEN P.CD_GRUPO='#39'644'#39' THEN GETDATE(' +
        ') ELSE PR.CREATED END,103),'#39'/'#39','#39#39') DT_PAGTO,'
      'DESP.CD_EXTERNO CD_DESPESA,'
      
        'CASE WHEN P.CD_GRUPO = '#39'644'#39' THEN '#39#39' ELSE I.AKEY END CD_DESPESA_' +
        'INDAIA,'
      'SUM(II.PRICE) VL_DESPESA,'
      'CASE WHEN P.CD_GRUPO = '#39'644'#39' THEN '#39#39' ELSE I.NAME END NM_ITEM,'
      #39'2'#39' PAGTO_EF_PREV,'
      #39'1'#39' DESP_IMP,'
      #39'S'#39' ADIANTAMENTO ,'
      #39#39' FILLER'
      ''
      'FROM PAYMENTREQUESTED                            PR   (NOLOCK)'
      
        'LEFT  JOIN PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PIPR (NOLOCK)ON' +
        ' PIPR.PAYMENTREQUESTED_ID = PR.ID'
      
        'LEFT  JOIN ITEMPAYMENTREQUESTED                  II   (NOLOCK)ON' +
        ' II.ID                    = PIPR.ITEMS_ID'
      
        'LEFT  JOIN ITEM                                  I    (NOLOCK)ON' +
        ' I.ID                     = II.ITEM_ID'
      
        'LEFT  JOIN CUSTOMCLEARANCE                       CC   (NOLOCK)ON' +
        ' CC.ID                    = PR.CUSTOMCLEARANCE_ID'
      
        'LEFT  JOIN BILLING                               B    (NOLOCK)ON' +
        ' B.ID                     = PR.BILLING_ID'
      
        'INNER JOIN CUSTOMER                              C    (NOLOCK)ON' +
        ' C.ID                     = CC.CUSTOMER_ID'
      
        'LEFT  JOIN BROKER.DBO.TPROCESSO                  P    (NOLOCK)ON' +
        ' P.NR_PROCESSO            = CC.CUSTOMID'
      ''
      
        'OUTER APPLY (SELECT CD_EXTERNO FROM BROKER.DBO.TDE_PARA (NOLOCK)' +
        ' WHERE CD_TABELA ='#9'   (CASE WHEN P.CD_GRUPO='#39'028'#39' THEN '#39'68'#39
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' WHEN P.CD_GRUPO='#39'155'#39'    THEN '#39'77'#39
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' WHEN P.CD_GRUPO='#39'B50'#39'    THEN '#39'87'#39
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' WHEN P.CD_GRUPO='#39'644'#39'    THEN '#39'91'#39
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9' WHEN P.CD_GRUPO='#39'154'#39'    THEN '#39'89'#39
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'ELSE '#39'74'#39' END )'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'AND CD_DDBROKER = RIGHT('#39'000'#39'+CONVERT(VARCHAR,'
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'CASE WHEN P.CD_GRUPO = '#39'644'#39' THEN I.ID ELSE I.AKE' +
        'Y END ),3) '
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'AND CD_GRUPO    = P.CD_GRUPO) DESP'
      ''
      'WHERE CC.CUSTOMID = :PROCESSO'
      '  AND B.ID        = :FATURA'
      ''
      
        'GROUP BY  REPLACE(CONVERT(VARCHAR,CASE WHEN P.CD_GRUPO='#39'644'#39' THE' +
        'N GETDATE() ELSE PR.CREATED END,103),'#39'/'#39','#39#39'),'
      '         CC.CUSTOMID,'
      '         CASE WHEN P.CD_GRUPO = '#39'644'#39' THEN '#39#39' ELSE I.NAME END,'
      '         P.CD_GRUPO, '
      #9#9' CASE WHEN P.CD_GRUPO = '#39'644'#39' THEN '#39#39' ELSE I.AKEY END,'
      #9#9'  DESP.CD_EXTERNO')
    Left = 32
    Top = 8
    object qryDespesaDETP_REGISTRO: TStringField
      FieldName = 'TP_REGISTRO'
      ReadOnly = True
      Size = 2
    end
    object qryDespesaDENR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qryDespesaDEDT_PAGTO: TStringField
      FieldName = 'DT_PAGTO'
      ReadOnly = True
      Size = 8000
    end
    object qryDespesaDECD_DESPESA: TStringField
      FieldName = 'CD_DESPESA'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object qryDespesaDECD_DESPESA_INDAIA: TWideStringField
      FieldName = 'CD_DESPESA_INDAIA'
      Size = 255
    end
    object qryDespesaDEVL_DESPESA: TFMTBCDField
      FieldName = 'VL_DESPESA'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object qryDespesaDENM_ITEM: TWideStringField
      FieldName = 'NM_ITEM'
      Size = 255
    end
    object qryDespesaDEPAGTO_EF_PREV: TStringField
      FieldName = 'PAGTO_EF_PREV'
      ReadOnly = True
      Size = 1
    end
    object qryDespesaDEDESP_IMP: TStringField
      FieldName = 'DESP_IMP'
      ReadOnly = True
      Size = 1
    end
    object qryDespesaDEADIANTAMENTO: TStringField
      FieldName = 'ADIANTAMENTO'
      ReadOnly = True
      Size = 1
    end
    object qryDespesaDEFILLER: TStringField
      FieldName = 'FILLER'
      ReadOnly = True
      Size = 1
    end
  end
  object qryDespesaDI: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Processo'
        DataType = ftString
        Size = 2
        Value = #39#39
      end>
    SQL.Strings = (
      'SELECT '#39'DI'#39' TP_REGISTRO_DI,'
      '       (SELECT TOP 1  CD_REFERENCIA'
      '          FROM BROKER.DBO.TREF_CLIENTE RC (NOLOCK)'
      '         WHERE RC.NR_PROCESSO = P.NR_PROCESSO '
      '           AND TP_REFERENCIA  = '#39'01'#39') NR_PROCESSO ,'
      '           '
      '---ALTERADO'
      
        '       REPLACE(CONVERT(VARCHAR,F162.DT_REALIZACAO,103),'#39'/'#39','#39#39')  ' +
        'DT_CHEGADA ,'
      ''
      '       NR_DECLARACAO_IMP NR_REGISTRO_DI,       '
      
        '       ISNULL((REPLACE(CONVERT(VARCHAR,F045.DT_REALIZACAO,103),'#39 +
        '/'#39','#39#39')) ,    '
      
        '               REPLACE(CONVERT(VARCHAR,F001.DT_REALIZACAO,103),'#39 +
        '/'#39','#39#39') )  DT_RECEBIMENTO_DOCTOS,                  '
      '      '
      #9'  '
      #9'  CASE G.CD_GRUPO'
      '           WHEN '#39'B50'#39' THEN '#39'013'#39
      '           WHEN '#39'028'#39' THEN '#39'001'#39
      #9#9'   ---INCLUIR'
      #9#9'   WHEN '#39'154'#39' THEN '#39'001'#39
      '           ELSE '#39'IND'#39
      '      END  AS CD_DESPACHANTE,'
      '      '
      '     (SELECT CD_EXTERNO '
      '        FROM BROKER.DBO.TDE_PARA (NOLOCK)'
      '       WHERE CD_UNID_NEG = P.CD_UNID_NEG '
      '         AND CD_TABELA   = (CASE WHEN P.CD_GRUPO='#39'028'#39' '
      '                                 THEN '#39#39
      
        '                                 ELSE (CASE WHEN P.CD_GRUPO='#39'155' +
        #39' '
      '                                            THEN 79 '
      '                                            ELSE '#39#39' '
      '                                       END) '
      '                            END) '
      
        '         AND CD_DDBROKER = RIGHT('#39'0000'#39'+CONVERT(VARCHAR,P.CD_AGE' +
        'NTE),4) '
      '         AND CD_GRUPO    = P.CD_GRUPO) AS CD_AGENTE,'
      '                  '
      '     ISNULL(MON.DT_CAIXA,DT_REGISTRO_DI) DT_PAGTO_IMPOSTO,     '
      '     TX_MLE TX_MERCADORIA,'
      
        '     REPLACE(CONVERT(VARCHAR,F088.DT_REALIZACAO,103),'#39'/'#39','#39#39') AS ' +
        'DT_DESEMBARACO,'
      '     DL.CD_MOEDA_FRETE,'
      '     DL.VL_TOT_FRT_PREPAID VL_FRETE_MOEDA,'
      '     TX_FRETE,'
      '     VL_TOT_SEGURO_MNEG VL_SEGURO_MOEDA,'
      '     DL.CD_MOEDA_SEGURO,'
      '     TX_SEGURO,'
      '     TX_DOLAR,'
      '     SUBSTRING(P.NR_PROCESSO,5,15) AS REF_CLIENTE,'
      '     CASE WHEN NR_CONHECIMENTO_MASTER ='#39#39' '
      '          THEN NR_CONHECIMENTO '
      '          ELSE NR_CONHECIMENTO_MASTER '
      '     END NR_MASTER,'
      '     CD_TIPO_DECLARACAO TP_DECLARACAO,'
      '     CD_URF_DESPACHO    URF_DESPACHO,'
      '     CD_URF_ENTR_CARGA  URF_ENTRADA,'
      '     CD_RECINTO_ALFAND,'
      '     CD_MODALIDADE_DESP MODALIDADE_DESPACHO,'
      '     CD_TIPO_DCTO_CARGA TP_CONHECIMENTO,'
      
        '     LEFT(CONVERT(VARCHAR,CD_TIPO_MANIFESTO) + '#39'  '#39',2) TP_DOCUME' +
        'NTO,'
      '     CD_UTIL_DCTO_CARGA UTILIZACAO,'
      '     NR_DCTO_CARGA NR_IDENTIFICACAO,'
      '     PB_CARGA PESO_BRUTO,'
      '     DL.VL_TOT_MLE_MNEG  TOT_FOB_MOEDA,   '
      '     FATURA_SERV.NR_NOTA NR_FATURA_SERVICO,   '
      
        '     NOTA.NR_NOTA                 AS NR_NOTA_FISCAL_ENTRADA,    ' +
        '    '
      
        '     NOTA.DT_NOTA_FISCAL_ENTRADA  AS DT_NOTA_FISCAL_ENTRADA,    ' +
        '    '
      
        '     NOTA.VL_NOTA                 AS VL_TOT_NOTA_FISCAL_ENTRADA,' +
        '            '
      
        '     REPLACE(CONVERT(VARCHAR,F164.DT_REALIZACAO,103),'#39'/'#39','#39#39') AS ' +
        'DT_ENTREGA_MERC,   '
      '     DT_REGISTRO_DI ,'
      '     VL_FRETE_COLLECT_MNEG -'
      '     CASE WHEN VL_FRETE_COLLECT_MNEG > 0 '
      '           AND SUBSTRING(P.NR_PROCESSO, 6, 1) = '#39'R'#39
      '          THEN P.VL_FRETE_TNAC_MNEG'
      '          ELSE 0'
      '     END AS VL_FRETE_COLLECT_MNEG,     '
      
        '     ROUND(P.VL_FRETE_TNAC_MNEG * TX_FRETE,2) VL_FRETE_TERR_NACI' +
        'ONAL,'
      '     '#39#39' OBS,'
      '     SUBSTRING(DESCRICAO,1,30)LOCAL_DESEMBARACO,'
      '     END_UF  UF_DESEMBARACO,'
      '     '#39'TX'#39' TP_REGISTRO_TX,'
      '     P.NR_PROCESSO,'
      '     P.CD_MOEDA_MLE CD_MOEDA,'
      '     TX_MLE TX_MOEDA,'
      
        '    (SELECT TOP 1 '#39'001DE'#39'+LTRIM(RTRIM(REPLACE(CD_REFERENCIA,'#39'ID'#39 +
        ','#39#39'))) '
      '       FROM BROKER.DBO.TREF_CLIENTE '
      '      WHERE TP_REFERENCIA = '#39'04'#39' '
      '        AND NR_PROCESSO   = P.NR_PROCESSO ) AS REF_CLIENTE_DOC'
      '        '
      'FROM BROKER.DBO.TPROCESSO                       P  (NOLOCK)'
      
        '   INNER JOIN BROKER.DBO.TDECLARACAO_IMPORTACAO DL (NOLOCK) ON D' +
        'L.NR_PROCESSO = P.NR_PROCESSO'
      
        '   LEFT  JOIN BROKER.DBO.TURF                   UR (NOLOCK) ON U' +
        'R.CODIGO      = DL.CD_URF_DESPACHO'
      
        '   INNER JOIN BROKER.DBO.TGRUPO                 G  (NOLOCK) ON G' +
        '.CD_GRUPO     = P.CD_GRUPO'
      ' '
      
        '   LEFT JOIN BROKER.DBO.TFOLLOWUP           F045 (NOLOCK) ON F04' +
        '5.NR_PROCESSO = P.NR_PROCESSO '
      
        '                                                         AND F04' +
        '5.CD_SERVICO  = P.CD_SERVICO'
      
        '                                                         AND F04' +
        '5.CD_EVENTO   = '#39'045'#39
      
        '   LEFT JOIN BROKER.DBO.TFOLLOWUP           F001 (NOLOCK) ON F00' +
        '1.NR_PROCESSO = P.NR_PROCESSO '
      
        '                                                         AND F00' +
        '1.CD_SERVICO  = P.CD_SERVICO'
      
        '                                                         AND F00' +
        '1.CD_EVENTO   = '#39'001'#39
      
        '   LEFT JOIN BROKER.DBO.TFOLLOWUP           F164 (NOLOCK) ON F16' +
        '4.NR_PROCESSO = P.NR_PROCESSO '
      
        '                                                         AND F16' +
        '4.CD_SERVICO  = P.CD_SERVICO'
      
        '                                                         AND F16' +
        '4.CD_EVENTO   = '#39'164'#39'     '
      
        '   LEFT JOIN BROKER.DBO.TFOLLOWUP           F088 (NOLOCK) ON F08' +
        '8.NR_PROCESSO = P.NR_PROCESSO '
      
        '                                                         AND F08' +
        '8.CD_SERVICO  = P.CD_SERVICO'
      
        '                                                         AND F08' +
        '8.CD_EVENTO   = '#39'088'#39' '
      ''
      '--INCLUIR'
      
        '   LEFT JOIN BROKER.DBO.TFOLLOWUP           F162 (NOLOCK) ON F16' +
        '2.NR_PROCESSO = P.NR_PROCESSO '
      
        '                                                         AND F16' +
        '2.CD_SERVICO  = P.CD_SERVICO'
      
        '                                                         AND F16' +
        '2.CD_EVENTO   = '#39'162'#39' '
      ''
      ''
      ''
      '   OUTER APPLY'
      '  (SELECT TOP 1  NR_NOTA  ,'
      
        '                 REPLACE(CONVERT(VARCHAR,DT_NOTA,103),'#39'/'#39','#39#39') AS' +
        ' DT_NOTA_FISCAL_ENTRADA ,'
      '                 VL_NOTA'
      '        FROM BROKER.DBO.TPROCESSO_NF NF (NOLOCK) '
      '       WHERE NF.NR_PROCESSO = P.NR_PROCESSO) NOTA'
      '  '
      '   OUTER APPLY('
      '     SELECT TOP 1 E2.NR_NOTA'
      '       FROM MYMONEY.DBO.TB_EMISSAO         E2 (NOLOCK)'
      
        ' INNER JOIN MYMONEY.DBO.TB_EMISSAO_DETALHE ED2 (NOLOCK) ON ED2.N' +
        'R_EMISSAO    = E2.NR_EMISSAO '
      
        '                                                       AND ED2.A' +
        'NO_EMISSAO   = E2.ANO_EMISSAO'
      
        ' INNER JOIN MYMONEY.DBO.TB_LANCTO_FUP      LF2 (NOLOCK) ON LF2.N' +
        'R_LANCTO     = ED2.NR_LANCTO '
      
        '                                                       AND LF2.A' +
        'NO_LANCTO    = ED2.ANO_LANCTO'
      
        '                                                       AND LF2.C' +
        'D_ROTINA IN (603)'
      
        '                                                       AND ((LF2' +
        '.NR_EMISSAO  = ED2.NR_EMISSAO'
      
        '                                                       AND LF2.A' +
        'NO_EMISSAO   = ED2.ANO_EMISSAO)'
      
        '                                                       OR (LF2.N' +
        'R_LANCTO_FUP = ED2.NR_LANCTO_FUP))'
      
        ' INNER JOIN MYMONEY.DBO.TB_LANCTO          L2 (NOLOCK) ON L2.NR_' +
        'LANCTO       = ED2.NR_LANCTO '
      
        '                                                      AND L2.ANO' +
        '_LANCTO      = ED2.ANO_LANCTO'
      '   WHERE L2.NR_PROCESSO  = P.NR_PROCESSO '
      '     AND E2.IN_CANCELADO = 0 '
      '     AND E2.IN_EMITIDO   = 1'
      '     AND E2.NR_NOTA IS NOT NULL'
      '   ORDER BY E2.NR_NOTA) FATURA_SERV     '
      '    '
      '  OUTER APPLY('
      
        '             SELECT TOP 1 REPLACE(CONVERT(VARCHAR, DT_CAIXA, 103' +
        '),'#39'/'#39','#39#39') AS DT_CAIXA'
      '               FROM MYMONEY.DBO.TB_LANCTO       L  (NOLOCK)'
      
        '         INNER JOIN MYMONEY.DBO.TB_LANCTO_FUP   LF (NOLOCK) ON L' +
        'F.NR_LANCTO     = L.NR_LANCTO '
      
        '                                                           AND L' +
        'F.ANO_LANCTO    = L.ANO_LANCTO'
      
        '                                                           AND L' +
        'F.CD_ROTINA IN (403)'
      
        '         INNER JOIN MYMONEY.DBO.TB_LANCTO_CAIXA LC (NOLOCK) ON L' +
        'C.NR_LANCTO     = L.NR_LANCTO'
      
        '                                                           AND L' +
        'C.ANO_LANCTO    = L.ANO_LANCTO'
      
        '                                                           AND L' +
        'C.NR_LANCTO_FUP = LF.NR_LANCTO_FUP'
      
        '         INNER JOIN MYMONEY.DBO.TB_CAIXA        C  (NOLOCK) ON C' +
        '.NR_CAIXA       = LC.NR_CAIXA'
      
        '                                                           AND C' +
        '.ANO_CAIXA      = LC.ANO_CAIXA'
      '              WHERE L.NR_PROCESSO = P.NR_PROCESSO'
      
        '                AND CD_ITEM       = 32) MON                     ' +
        '                                  '
      '        '
      'WHERE P.NR_PROCESSO= :PROCESSO')
    Left = 32
    Top = 64
    object qryDespesaDITP_REGISTRO_DI: TStringField
      FieldName = 'TP_REGISTRO_DI'
      ReadOnly = True
      Size = 2
    end
    object qryDespesaDInr_processo: TStringField
      FieldName = 'nr_processo'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qryDespesaDIDT_CHEGADA: TStringField
      FieldName = 'DT_CHEGADA'
      ReadOnly = True
      Size = 8000
    end
    object qryDespesaDINR_REGISTRO_DI: TStringField
      FieldName = 'NR_REGISTRO_DI'
      FixedChar = True
      Size = 10
    end
    object qryDespesaDIDT_RECEBIMENTO_DOCTOS: TStringField
      FieldName = 'DT_RECEBIMENTO_DOCTOS'
      ReadOnly = True
      Size = 8000
    end
    object qryDespesaDICD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      ReadOnly = True
      Size = 3
    end
    object qryDespesaDICD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object qryDespesaDIDT_PAGTO_IMPOSTO: TStringField
      FieldName = 'DT_PAGTO_IMPOSTO'
      ReadOnly = True
      Size = 8000
    end
    object qryDespesaDITX_MERCADORIA: TFloatField
      FieldName = 'TX_MERCADORIA'
    end
    object qryDespesaDIDT_DESEMBARACO: TStringField
      FieldName = 'DT_DESEMBARACO'
      ReadOnly = True
      Size = 8000
    end
    object qryDespesaDICD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qryDespesaDIVL_FRETE_MOEDA: TFloatField
      FieldName = 'VL_FRETE_MOEDA'
    end
    object qryDespesaDITX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
    end
    object qryDespesaDIVL_SEGURO_MOEDA: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
    end
    object qryDespesaDICD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      FixedChar = True
      Size = 3
    end
    object qryDespesaDITX_SEGURO: TFloatField
      FieldName = 'TX_SEGURO'
    end
    object qryDespesaDITX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
    end
    object qryDespesaDIREF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      ReadOnly = True
      Size = 15
    end
    object qryDespesaDINR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qryDespesaDITP_DECLARACAO: TStringField
      FieldName = 'TP_DECLARACAO'
      FixedChar = True
      Size = 2
    end
    object qryDespesaDIURF_DESPACHO: TStringField
      FieldName = 'URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qryDespesaDIURF_ENTRADA: TStringField
      FieldName = 'URF_ENTRADA'
      FixedChar = True
      Size = 7
    end
    object qryDespesaDICD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      FixedChar = True
      Size = 7
    end
    object qryDespesaDIMODALIDADE_DESPACHO: TStringField
      FieldName = 'MODALIDADE_DESPACHO'
      FixedChar = True
      Size = 1
    end
    object qryDespesaDITP_CONHECIMENTO: TStringField
      FieldName = 'TP_CONHECIMENTO'
      FixedChar = True
      Size = 2
    end
    object qryDespesaDITP_DOCUMENTO: TStringField
      FieldName = 'TP_DOCUMENTO'
      ReadOnly = True
      Size = 2
    end
    object qryDespesaDIUTILIZACAO: TStringField
      FieldName = 'UTILIZACAO'
      FixedChar = True
      Size = 1
    end
    object qryDespesaDINR_IDENTIFICACAO: TStringField
      FieldName = 'NR_IDENTIFICACAO'
      FixedChar = True
      Size = 30
    end
    object qryDespesaDIPESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
    end
    object qryDespesaDITOT_FOB_MOEDA: TFloatField
      FieldName = 'TOT_FOB_MOEDA'
    end
    object qryDespesaDINR_FATURA_SERVICO: TIntegerField
      FieldName = 'NR_FATURA_SERVICO'
      ReadOnly = True
    end
    object qryDespesaDINR_NOTA_FISCAL_ENTRADA: TStringField
      FieldName = 'NR_NOTA_FISCAL_ENTRADA'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qryDespesaDIDT_NOTA_FISCAL_ENTRADA: TStringField
      FieldName = 'DT_NOTA_FISCAL_ENTRADA'
      ReadOnly = True
      Size = 8000
    end
    object qryDespesaDIVL_TOT_NOTA_FISCAL_ENTRADA: TFloatField
      FieldName = 'VL_TOT_NOTA_FISCAL_ENTRADA'
      ReadOnly = True
    end
    object qryDespesaDIDT_ENTREGA_MERC: TStringField
      FieldName = 'DT_ENTREGA_MERC'
      ReadOnly = True
      Size = 8000
    end
    object qryDespesaDIDT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      FixedChar = True
      Size = 8
    end
    object qryDespesaDIVL_FRETE_COLLECT_MNEG: TFloatField
      FieldName = 'VL_FRETE_COLLECT_MNEG'
      ReadOnly = True
    end
    object qryDespesaDIVL_FRETE_TERR_NACIONAL: TFloatField
      FieldName = 'VL_FRETE_TERR_NACIONAL'
      ReadOnly = True
    end
    object qryDespesaDIOBS: TStringField
      FieldName = 'OBS'
      ReadOnly = True
      Size = 1
    end
    object qryDespesaDILOCAL_DESEMBARACO: TStringField
      FieldName = 'LOCAL_DESEMBARACO'
      ReadOnly = True
      Size = 30
    end
    object qryDespesaDIUF_DESEMBARACO: TStringField
      FieldName = 'UF_DESEMBARACO'
      FixedChar = True
      Size = 2
    end
    object qryDespesaDITP_REGISTRO_TX: TStringField
      FieldName = 'TP_REGISTRO_TX'
      ReadOnly = True
      Size = 2
    end
    object qryDespesaDINR_PROCESSO_1: TStringField
      FieldName = 'NR_PROCESSO_1'
      FixedChar = True
      Size = 18
    end
    object qryDespesaDICD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qryDespesaDITX_MOEDA: TFloatField
      FieldName = 'TX_MOEDA'
    end
    object qryDespesaDIref_cliente_doc: TStringField
      FieldName = 'ref_cliente_doc'
      ReadOnly = True
      Size = 8000
    end
  end
  object dspDespesaDE: TDataSetProvider
    DataSet = qryDespesaDE
    Left = 120
    Top = 8
  end
  object dspDespesaDI: TDataSetProvider
    DataSet = qryDespesaDI
    Left = 120
    Top = 64
  end
  object dsDespesaDE: TDataSource
    DataSet = cds_despesas_de
    Left = 216
    Top = 8
  end
  object cds_despesas_de: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <
      item
        DataType = ftString
        Name = 'Processo'
        ParamType = ptInput
        Size = 2
        Value = #39#39
      end
      item
        DataType = ftInteger
        Name = 'Fatura'
        ParamType = ptInput
        Size = -1
        Value = 0
      end>
    ProviderName = 'dspDespesaDE'
    Left = 312
    Top = 8
    object cds_despesas_deTP_REGISTRO: TStringField
      FieldName = 'TP_REGISTRO'
      ReadOnly = True
      Size = 2
    end
    object cds_despesas_deNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object cds_despesas_deDT_PAGTO: TStringField
      FieldName = 'DT_PAGTO'
      ReadOnly = True
      Size = 8000
    end
    object cds_despesas_deCD_DESPESA: TStringField
      FieldName = 'CD_DESPESA'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object cds_despesas_deCD_DESPESA_INDAIA: TWideStringField
      FieldName = 'CD_DESPESA_INDAIA'
      Size = 255
    end
    object cds_despesas_deVL_DESPESA: TFMTBCDField
      FieldName = 'VL_DESPESA'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object cds_despesas_deNM_ITEM: TWideStringField
      FieldName = 'NM_ITEM'
      Size = 255
    end
    object cds_despesas_dePAGTO_EF_PREV: TStringField
      FieldName = 'PAGTO_EF_PREV'
      ReadOnly = True
      Size = 1
    end
    object cds_despesas_deDESP_IMP: TStringField
      FieldName = 'DESP_IMP'
      ReadOnly = True
      Size = 1
    end
    object cds_despesas_deADIANTAMENTO: TStringField
      FieldName = 'ADIANTAMENTO'
      ReadOnly = True
      Size = 1
    end
    object cds_despesas_deFILLER: TStringField
      FieldName = 'FILLER'
      ReadOnly = True
      Size = 1
    end
  end
  object cds_despesas_di: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'Processo'
        ParamType = ptInput
        Size = 2
        Value = #39#39
      end>
    ProviderName = 'dspDespesaDI'
    Left = 312
    Top = 64
    object cds_despesas_diTP_REGISTRO_DI: TStringField
      FieldName = 'TP_REGISTRO_DI'
      ReadOnly = True
      Size = 2
    end
    object cds_despesas_dinr_processo: TStringField
      FieldName = 'nr_processo'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object cds_despesas_diDT_CHEGADA: TStringField
      FieldName = 'DT_CHEGADA'
      ReadOnly = True
      Size = 8000
    end
    object cds_despesas_diNR_REGISTRO_DI: TStringField
      FieldName = 'NR_REGISTRO_DI'
      FixedChar = True
      Size = 10
    end
    object cds_despesas_diDT_RECEBIMENTO_DOCTOS: TStringField
      FieldName = 'DT_RECEBIMENTO_DOCTOS'
      ReadOnly = True
      Size = 8000
    end
    object cds_despesas_diCD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      ReadOnly = True
      Size = 3
    end
    object cds_despesas_diCD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object cds_despesas_diDT_PAGTO_IMPOSTO: TStringField
      FieldName = 'DT_PAGTO_IMPOSTO'
      ReadOnly = True
      Size = 8000
    end
    object cds_despesas_diTX_MERCADORIA: TFloatField
      FieldName = 'TX_MERCADORIA'
    end
    object cds_despesas_diDT_DESEMBARACO: TStringField
      FieldName = 'DT_DESEMBARACO'
      ReadOnly = True
      Size = 8000
    end
    object cds_despesas_diCD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object cds_despesas_diVL_FRETE_MOEDA: TFloatField
      FieldName = 'VL_FRETE_MOEDA'
    end
    object cds_despesas_diTX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
    end
    object cds_despesas_diVL_SEGURO_MOEDA: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
    end
    object cds_despesas_diCD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      FixedChar = True
      Size = 3
    end
    object cds_despesas_diTX_SEGURO: TFloatField
      FieldName = 'TX_SEGURO'
    end
    object cds_despesas_diTX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
    end
    object cds_despesas_diREF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      ReadOnly = True
      Size = 15
    end
    object cds_despesas_diNR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object cds_despesas_diTP_DECLARACAO: TStringField
      FieldName = 'TP_DECLARACAO'
      FixedChar = True
      Size = 2
    end
    object cds_despesas_diURF_DESPACHO: TStringField
      FieldName = 'URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object cds_despesas_diURF_ENTRADA: TStringField
      FieldName = 'URF_ENTRADA'
      FixedChar = True
      Size = 7
    end
    object cds_despesas_diCD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      FixedChar = True
      Size = 7
    end
    object cds_despesas_diMODALIDADE_DESPACHO: TStringField
      FieldName = 'MODALIDADE_DESPACHO'
      FixedChar = True
      Size = 1
    end
    object cds_despesas_diTP_CONHECIMENTO: TStringField
      FieldName = 'TP_CONHECIMENTO'
      FixedChar = True
      Size = 2
    end
    object cds_despesas_diTP_DOCUMENTO: TStringField
      FieldName = 'TP_DOCUMENTO'
      ReadOnly = True
      Size = 2
    end
    object cds_despesas_diUTILIZACAO: TStringField
      FieldName = 'UTILIZACAO'
      FixedChar = True
      Size = 1
    end
    object cds_despesas_diNR_IDENTIFICACAO: TStringField
      FieldName = 'NR_IDENTIFICACAO'
      FixedChar = True
      Size = 30
    end
    object cds_despesas_diPESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
    end
    object cds_despesas_diTOT_FOB_MOEDA: TFloatField
      FieldName = 'TOT_FOB_MOEDA'
    end
    object cds_despesas_diNR_FATURA_SERVICO: TIntegerField
      FieldName = 'NR_FATURA_SERVICO'
      ReadOnly = True
    end
    object cds_despesas_diNR_NOTA_FISCAL_ENTRADA: TStringField
      FieldName = 'NR_NOTA_FISCAL_ENTRADA'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object cds_despesas_diDT_NOTA_FISCAL_ENTRADA: TStringField
      FieldName = 'DT_NOTA_FISCAL_ENTRADA'
      ReadOnly = True
      Size = 8000
    end
    object cds_despesas_diVL_TOT_NOTA_FISCAL_ENTRADA: TFloatField
      FieldName = 'VL_TOT_NOTA_FISCAL_ENTRADA'
      ReadOnly = True
    end
    object cds_despesas_diDT_ENTREGA_MERC: TStringField
      FieldName = 'DT_ENTREGA_MERC'
      ReadOnly = True
      Size = 8000
    end
    object cds_despesas_diDT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      FixedChar = True
      Size = 8
    end
    object cds_despesas_diVL_FRETE_COLLECT_MNEG: TFloatField
      FieldName = 'VL_FRETE_COLLECT_MNEG'
      ReadOnly = True
    end
    object cds_despesas_diVL_FRETE_TERR_NACIONAL: TFloatField
      FieldName = 'VL_FRETE_TERR_NACIONAL'
      ReadOnly = True
    end
    object cds_despesas_diOBS: TStringField
      FieldName = 'OBS'
      ReadOnly = True
      Size = 1
    end
    object cds_despesas_diLOCAL_DESEMBARACO: TStringField
      FieldName = 'LOCAL_DESEMBARACO'
      ReadOnly = True
      Size = 30
    end
    object cds_despesas_diUF_DESEMBARACO: TStringField
      FieldName = 'UF_DESEMBARACO'
      FixedChar = True
      Size = 2
    end
    object cds_despesas_diTP_REGISTRO_TX: TStringField
      FieldName = 'TP_REGISTRO_TX'
      ReadOnly = True
      Size = 2
    end
    object cds_despesas_diNR_PROCESSO_1: TStringField
      FieldName = 'NR_PROCESSO_1'
      FixedChar = True
      Size = 18
    end
    object cds_despesas_diCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object cds_despesas_diTX_MOEDA: TFloatField
      FieldName = 'TX_MOEDA'
    end
    object cds_despesas_diref_cliente_doc: TStringField
      FieldName = 'ref_cliente_doc'
      ReadOnly = True
      Size = 8000
    end
  end
  object dsDespesaDI: TDataSource
    DataSet = cds_despesas_di
    Left = 216
    Top = 64
  end
end
