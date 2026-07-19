object datm_emissao_remessa: Tdatm_emissao_remessa
  OldCreateOrder = False
  Left = 285
  Top = 161
  Height = 222
  Width = 469
  object qry_remessa_: TQuery
    CachedUpdates = True
    AfterPost = qry_remessa_AfterPost
    AfterScroll = qry_remessa_AfterScroll
    OnCalcFields = qry_remessa_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TR.NR_REMESSA,  TR.CD_AGENTE, TR.CD_MOEDA, TR.IN_EMISSAO,' +
        ' TR.VL_BANCO, TR.NR_CONTRATO_CAMBIO, TR.CD_BANCO,'
      
        '   TR.VL_CORRETORA, TR.VL_TOTAL, TR.VL_MOEDA, TR.VL_TOTAL_REAL, ' +
        'TR.DT_REMESSA, TR.DT_ENVIO_REMESSA,'
      
        '   (SELECT TA.NM_AGENTE FROM TAGENTE TA WHERE TA.CD_AGENTE = TR.' +
        'CD_AGENTE)NM_AGENTE,'
      
        '   (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA =' +
        ' TR.CD_MOEDA)AP_MOEDA, TR.CD_VIA_TRANSP,'
      
        '   (SELECT TB.NM_BANCO FROM TBANCO TB WHERE TB.CD_BANCO = TR.CD_' +
        'BANCO)NM_BANCO,'
      
        '   (SELECT TV.NM_VIA_TRANSP FROM TVIA_TRANSP_BROKER TV  WHERE TV' +
        '.CD_VIA_TRANSP = TR.CD_VIA_TRANSP)NM_VIA_TRANSP  FROM TREMESSA T' +
        'R'
      ''
      ''
      '     ORDER BY'
      '      NR_REMESSA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpADte_remessa
    Left = 112
    Top = 24
    object qry_remessa_NR_REMESSA: TStringField
      FieldName = 'NR_REMESSA'
      FixedChar = True
      Size = 10
    end
    object qry_remessa_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_remessa_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_remessa_IN_EMISSAO: TStringField
      FieldName = 'IN_EMISSAO'
      FixedChar = True
      Size = 1
    end
    object qry_remessa_VL_BANCO: TFloatField
      FieldName = 'VL_BANCO'
      DisplayFormat = '0.00'
    end
    object qry_remessa_VL_CORRETORA: TFloatField
      FieldName = 'VL_CORRETORA'
      DisplayFormat = '0.00'
    end
    object qry_remessa_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '0.00'
    end
    object qry_remessa_VL_MOEDA: TFloatField
      FieldName = 'VL_MOEDA'
      OnChange = qry_remessa_VL_MOEDAChange
      DisplayFormat = '0.00000'
      Precision = 6
    end
    object qry_remessa_VL_TOTAL_REAL: TFloatField
      FieldName = 'VL_TOTAL_REAL'
      DisplayFormat = '0.00'
    end
    object qry_remessa_DT_REMESSA: TDateTimeField
      FieldName = 'DT_REMESSA'
    end
    object qry_remessa_DT_ENVIO_REMESSA: TDateTimeField
      FieldName = 'DT_ENVIO_REMESSA'
    end
    object qry_remessa_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_remessa_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_remessa_calc_in_emissao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_in_emissao'
      Size = 10
      Calculated = True
    end
    object qry_remessa_NR_CONTRATO_CAMBIO: TStringField
      FieldName = 'NR_CONTRATO_CAMBIO'
      FixedChar = True
    end
    object qry_remessa_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_remessa_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 40
    end
    object qry_remessa_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_remessa_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
  end
  object ds_remessa: TDataSource
    DataSet = qry_remessa_
    Left = 32
    Top = 24
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.CD_CLIENTE, TP.VL_ACCOUNT, TP.CD_ORIGE' +
        'M, TP.CD_DESTINO,'
      
        '    (SELECT TPO.NM_PORTO FROM TPORTO TPO WHERE TPO.CD_PORTO = TP' +
        '.CD_ORIGEM)NM_ORIGEM,'
      
        '    (SELECT TPO.NM_PORTO FROM TPORTO TPO WHERE TPO.CD_PORTO = TP' +
        '.CD_DESTINO)NM_DESTINO,'
      
        '    (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRE' +
        'SA = TP.CD_CLIENTE)NM_CLIENTE'
      '    FROM TREMESSA_PROCESSO TR, TPROCESSO TP'
      
        '      WHERE TP.NR_PROCESSO = TR.NR_PROCESSO AND TR.NR_REMESSA = ' +
        ':NR_REMESSA'
      ' '
      ' ')
    Left = 112
    Top = 72
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_REMESSA'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_processo_VL_ACCOUNT: TFloatField
      FieldName = 'VL_ACCOUNT'
      DisplayFormat = '0.00'
    end
    object qry_processo_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_processo_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_processo_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_processo_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 32
    Top = 72
  end
  object UpADte_remessa: TUpdateSQL
    ModifySQL.Strings = (
      'update TREMESSA'
      'set'
      '  NR_REMESSA = :NR_REMESSA,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  IN_EMISSAO = :IN_EMISSAO,'
      '  VL_BANCO = :VL_BANCO,'
      '  VL_CORRETORA = :VL_CORRETORA,'
      '  VL_TOTAL = :VL_TOTAL,'
      '  VL_MOEDA = :VL_MOEDA,'
      '  VL_TOTAL_REAL = :VL_TOTAL_REAL,'
      '  DT_REMESSA = :DT_REMESSA,'
      '  DT_ENVIO_REMESSA = :DT_ENVIO_REMESSA,'
      '  NR_CONTRATO_CAMBIO = :NR_CONTRATO_CAMBIO'
      'where'
      '  NR_REMESSA = :OLD_NR_REMESSA')
    InsertSQL.Strings = (
      'insert into TREMESSA'
      
        '  (NR_REMESSA, CD_AGENTE, CD_MOEDA, IN_EMISSAO, VL_BANCO, VL_COR' +
        'RETORA, '
      
        '   VL_TOTAL, VL_MOEDA, VL_TOTAL_REAL, DT_REMESSA, DT_ENVIO_REMES' +
        'SA, NR_CONTRATO_CAMBIO)'
      'values'
      
        '  (:NR_REMESSA, :CD_AGENTE, :CD_MOEDA, :IN_EMISSAO, :VL_BANCO, :' +
        'VL_CORRETORA, '
      
        '   :VL_TOTAL, :VL_MOEDA, :VL_TOTAL_REAL, :DT_REMESSA, :DT_ENVIO_' +
        'REMESSA, '
      '   :NR_CONTRATO_CAMBIO)')
    DeleteSQL.Strings = (
      'delete from TREMESSA'
      'where'
      '  NR_REMESSA = :OLD_NR_REMESSA')
    Left = 200
    Top = 24
  end
  object sp_distribui_remessa_AG: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_remessa_AG'
    Left = 112
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_remessa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_agente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_taxa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_banco'
        ParamType = ptInput
      end>
  end
  object dsRelER: TDataSource
    DataSet = qryRelER
    Left = 296
    Top = 72
  end
  object qryRelER: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        #9'SELECT (CASE R.CD_VIA_TRANSP WHEN '#39'01'#39' THEN '#39'DEMONSTRATIVO DE I' +
        'MPORTA'#199#213'ES CONSOLIDADAS DE TRANSPORTE MAR'#205'TIMO INTERNACIONAL'#39
      
        #9'                             WHEN '#39'04'#39' THEN '#39'DEMONSTRATIVO DE I' +
        'MPORTA'#199#213'ES CONSOLIDADAS DE TRANSPORTE A'#201'REO INTERNACIONAL'#39' END )' +
        ' AS TITULO1,'
      #9'       UN.NM_UNID_NEG,'
      #9'       ISNULL(RTRIM(UN.END_UNID_NEG), '#39#39') + '#39', '#39'  +'
      #9'       ISNULL(RTRIM(UN.END_NUMERO), '#39#39')   + '#39' - '#39' +'
      #9'       ISNULL(RTRIM(UN.END_CIDADE), '#39#39')   + '#39'/'#39'   +'
      #9'       ISNULL(RTRIM(UN.END_UF), '#39#39')       + '#39' - CEP: '#39' +'
      #9'       SUBSTRING(UN.END_CEP, 1, 5) + '#39'-'#39'   +'
      #9'       SUBSTRING(UN.END_CEP, 6, 3) AS ENDERECO_UNID,'
      #9'       '#39'Tel: '#39' + UN.NR_FONE AS TEL_UNID,'
      #9'       '#39'FAX: '#39' + UN.NR_FAX1 AS FAX_UNID,'
      #9'       (CASE R.CD_VIA_TRANSP WHEN '#39'01'#39' THEN '#39'MASTER B/L'#39
      
        #9'                             WHEN '#39'04'#39' THEN '#39'AWB'#39' END ) AS CAMP' +
        'O1,'
      #9'       (CASE R.CD_VIA_TRANSP WHEN '#39'01'#39' THEN '#39'HOUSE B/L'#39
      
        #9'                             WHEN '#39'04'#39' THEN '#39'HAWB'#39' END ) AS CAM' +
        'PO2,'
      #9'       (CASE R.CD_VIA_TRANSP WHEN '#39'01'#39' THEN '#39'NAVIO'#39
      
        #9'                             WHEN '#39'04'#39' THEN '#39'COMP. A'#201'REA'#39' END )' +
        ' AS CAMPO3,'
      #9'       (CASE R.CD_VIA_TRANSP WHEN '#39'01'#39' THEN '#39'VLR CC HB/L'#39
      
        #9'                             WHEN '#39'04'#39' THEN '#39'VLR CC HAWB'#39' END )' +
        ' AS CAMPO4,'
      
        #9'       (SELECT AP_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = R.C' +
        'D_MOEDA) AS AP_MOEDA,'
      #9'       A.NM_AGENTE AS NOME_AGENTE,'
      '         A.NR_CONTA_1, A.ST_ROUTING_INF, A.ST_SWIFT_1,'
      #9'        B.NM_BANCO, B.END_BANCO,'
      
        #9'       ISNULL(LTRIM((SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHER' +
        'E CODIGO = B.CD_CIDADE)), '#39#39') + '#39'/'#39' +'
      #9'       ISNULL(LTRIM(B.END_UF), '#39#39') + '#39' '#39' +'
      
        #9'       ISNULL(LTRIM((SELECT DESCRICAO FROM TPAIS WHERE CODIGO =' +
        ' B.CD_PAIS)), '#39#39') AS END_BANCO2,'
      
        #9'       (CASE R.CD_VIA_TRANSP WHEN '#39'01'#39' THEN (SELECT EMB.NM_EMBA' +
        'RCACAO FROM  TEMBARCACAO EMB (NOLOCK)       WHERE EMB.CD_EMBARCA' +
        'CAO = M.CD_VEICULO)'
      
        '                               WHEN '#39'04'#39' THEN (SELECT TI.DESCRIC' +
        'AO      FROM  TTRANSPORTADOR_ITL TI (NOLOCK) WHERE TI.CODIGO = M' +
        '.CD_VEICULO) END)         AS NOME_NAVIO,'
      #9'       H.NR_HOUSE, H.NR_MASTER, P.CD_INCOTERM,'
      
        #9'       ISNULL(P.VL_FRETE_COLLECT_MNEG, 0) + ISNULL(P.VL_FRETE_P' +
        'REPAID_MNEG, 0) AS VALOR_CC,'
      #9'       ISNULL(P.VL_PROFIT_AGENTE, 0) AS VALOR_REMESSA,'
      
        #9'       ISNULL(P.VL_FRETE_COLLECT_MNEG, 0) + ISNULL(P.VL_FRETE_P' +
        'REPAID_MNEG, 0) - ISNULL(P.VL_PROFIT_AGENTE, 0) AS VALOR_DEDUCAO' +
        ','
      '         RP.NR_PAGINA, RP.NR_LINHA'
      #9'  FROM TREMESSA R (NOLOCK)'
      
        #9' INNER JOIN TREMESSA_PROCESSO RP (NOLOCK) ON RP.NR_REMESSA = R.' +
        'NR_REMESSA'
      
        #9' INNER JOIN TPROCESSO P (NOLOCK) ON RP.NR_PROCESSO = P.NR_PROCE' +
        'SSO AND P.VL_ACCOUNT > 0'
      
        #9' LEFT  JOIN TUNID_NEG UN (NOLOCK) ON UN.CD_UNID_NEG = P.CD_UNID' +
        '_NEG'
      #9' LEFT  JOIN THOUSE H (NOLOCK) ON H.NR_PROCESSO = P.NR_PROCESSO'
      '   LEFT  JOIN TMASTER M (NOLOCK) ON M.CD_MASTER = H.CD_MASTER'
      #9' LEFT  JOIN TBCO_ITL B (NOLOCK) ON B.CD_BANCO = R.CD_BANCO'
      '   LEFT  JOIN TAGENTE  A (NOLOCK) ON A.CD_AGENTE = R.CD_AGENTE'
      #9' WHERE R.NR_REMESSA = :nr_remessa'
      #9' ORDER BY RP.NR_PAGINA, RP.NR_LINHA'
      '')
    Left = 296
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_remessa'
        ParamType = ptInput
      end>
    object qryRelERTITULO1: TStringField
      FieldName = 'TITULO1'
      FixedChar = True
      Size = 77
    end
    object qryRelERNM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qryRelERENDERECO_UNID: TStringField
      FieldName = 'ENDERECO_UNID'
      FixedChar = True
      Size = 111
    end
    object qryRelERTEL_UNID: TStringField
      FieldName = 'TEL_UNID'
      FixedChar = True
      Size = 25
    end
    object qryRelERFAX_UNID: TStringField
      FieldName = 'FAX_UNID'
      FixedChar = True
      Size = 25
    end
    object qryRelERCAMPO1: TStringField
      FieldName = 'CAMPO1'
      FixedChar = True
      Size = 10
    end
    object qryRelERCAMPO2: TStringField
      FieldName = 'CAMPO2'
      FixedChar = True
      Size = 9
    end
    object qryRelERCAMPO3: TStringField
      FieldName = 'CAMPO3'
      FixedChar = True
      Size = 11
    end
    object qryRelERCAMPO4: TStringField
      FieldName = 'CAMPO4'
      FixedChar = True
      Size = 11
    end
    object qryRelERAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryRelERNOME_AGENTE: TStringField
      FieldName = 'NOME_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qryRelERNM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 50
    end
    object qryRelEREND_BANCO: TStringField
      FieldName = 'END_BANCO'
      FixedChar = True
      Size = 255
    end
    object qryRelEREND_BANCO2: TStringField
      FieldName = 'END_BANCO2'
      FixedChar = True
      Size = 177
    end
    object qryRelERNOME_NAVIO: TStringField
      FieldName = 'NOME_NAVIO'
      FixedChar = True
      Size = 40
    end
    object qryRelERNR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qryRelERNR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qryRelERCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryRelERVALOR_CC: TFloatField
      FieldName = 'VALOR_CC'
    end
    object qryRelERVALOR_REMESSA: TFloatField
      FieldName = 'VALOR_REMESSA'
    end
    object qryRelERVALOR_DEDUCAO: TFloatField
      FieldName = 'VALOR_DEDUCAO'
    end
    object qryRelERNR_PAGINA: TIntegerField
      FieldName = 'NR_PAGINA'
    end
    object qryRelERNR_LINHA: TIntegerField
      FieldName = 'NR_LINHA'
    end
    object qryRelERNR_CONTA_1: TStringField
      FieldName = 'NR_CONTA_1'
      FixedChar = True
      Size = 25
    end
    object qryRelERST_ROUTING_INF: TStringField
      FieldName = 'ST_ROUTING_INF'
      FixedChar = True
      Size = 25
    end
    object qryRelERST_SWIFT_1: TStringField
      FieldName = 'ST_SWIFT_1'
      FixedChar = True
      Size = 50
    end
  end
  object ppRelER: TppBDEPipeline
    DataSource = dsRelER
    UserName = '_relER'
    Left = 296
    Top = 128
    object ppRelERppField1: TppField
      FieldAlias = 'TITULO1'
      FieldName = 'TITULO1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppRelERppField2: TppField
      FieldAlias = 'NM_UNID_NEG'
      FieldName = 'NM_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppRelERppField3: TppField
      FieldAlias = 'ENDERECO_UNID'
      FieldName = 'ENDERECO_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppRelERppField4: TppField
      FieldAlias = 'TEL_UNID'
      FieldName = 'TEL_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppRelERppField5: TppField
      FieldAlias = 'FAX_UNID'
      FieldName = 'FAX_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppRelERppField6: TppField
      FieldAlias = 'CAMPO1'
      FieldName = 'CAMPO1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppRelERppField7: TppField
      FieldAlias = 'CAMPO2'
      FieldName = 'CAMPO2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppRelERppField8: TppField
      FieldAlias = 'CAMPO3'
      FieldName = 'CAMPO3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppRelERppField9: TppField
      FieldAlias = 'CAMPO4'
      FieldName = 'CAMPO4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppRelERppField10: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppRelERppField11: TppField
      FieldAlias = 'NOME_AGENTE'
      FieldName = 'NOME_AGENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppRelERppField12: TppField
      FieldAlias = 'NM_BANCO'
      FieldName = 'NM_BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppRelERppField13: TppField
      FieldAlias = 'END_BANCO'
      FieldName = 'END_BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppRelERppField14: TppField
      FieldAlias = 'END_BANCO2'
      FieldName = 'END_BANCO2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppRelERppField15: TppField
      FieldAlias = 'NOME_NAVIO'
      FieldName = 'NOME_NAVIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppRelERppField16: TppField
      FieldAlias = 'NR_HOUSE'
      FieldName = 'NR_HOUSE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppRelERppField17: TppField
      FieldAlias = 'NR_MASTER'
      FieldName = 'NR_MASTER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppRelERppField18: TppField
      FieldAlias = 'CD_INCOTERM'
      FieldName = 'CD_INCOTERM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppRelERppField19: TppField
      FieldAlias = 'VALOR_CC'
      FieldName = 'VALOR_CC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppRelERppField20: TppField
      FieldAlias = 'VALOR_REMESSA'
      FieldName = 'VALOR_REMESSA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppRelERppField21: TppField
      FieldAlias = 'VALOR_DEDUCAO'
      FieldName = 'VALOR_DEDUCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppRelERppField22: TppField
      FieldAlias = 'NR_PAGINA'
      FieldName = 'NR_PAGINA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppRelERppField23: TppField
      FieldAlias = 'NR_LINHA'
      FieldName = 'NR_LINHA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppRelERppField24: TppField
      FieldAlias = 'ST_ROUTING_INF'
      FieldName = 'ST_ROUTING_INF'
      FieldLength = 25
      DisplayWidth = 25
      Position = 23
    end
    object ppRelERppField25: TppField
      FieldAlias = 'ST_SWIFT_1'
      FieldName = 'ST_SWIFT_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 24
    end
    object ppRelERppField26: TppField
      FieldAlias = 'NR_CONTA_1'
      FieldName = 'NR_CONTA_1'
      FieldLength = 25
      DisplayWidth = 25
      Position = 25
    end
  end
  object dsRelERTotal: TDataSource
    DataSet = qryRelERTotal
    Left = 392
    Top = 72
  end
  object qryRelERTotal: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT SUM(ISNULL(P.VL_FRETE_COLLECT_MNEG, 0) + ISNULL(P.VL_FRET' +
        'E_PREPAID_MNEG, 0)) AS TOTAL_CC, '
      '       SUM(ISNULL(P.VL_PROFIT_AGENTE, 0)) AS TOTAL_REMESSA,'
      
        '       SUM(ISNULL(P.VL_FRETE_COLLECT_MNEG, 0) + ISNULL(P.VL_FRET' +
        'E_PREPAID_MNEG, 0) - ISNULL(P.VL_PROFIT_AGENTE, 0)) AS TOTAL_DED' +
        'UCAO '
      '  FROM TREMESSA R, TREMESSA_PROCESSO RP, TPROCESSO P'
      ' WHERE R.NR_REMESSA = :nr_remessa'
      '   AND R.NR_REMESSA = RP.NR_REMESSA'
      '   AND RP.NR_PROCESSO = P.NR_PROCESSO'
      ' GROUP BY RP.NR_PAGINA'
      '')
    Left = 392
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_remessa'
        ParamType = ptInput
      end>
    object qryRelERTotalTOTAL_CC: TFloatField
      FieldName = 'TOTAL_CC'
    end
    object qryRelERTotalTOTAL_REMESSA: TFloatField
      FieldName = 'TOTAL_REMESSA'
    end
    object qryRelERTotalTOTAL_DEDUCAO: TFloatField
      FieldName = 'TOTAL_DEDUCAO'
    end
  end
  object ppRelERTotal: TppBDEPipeline
    DataSource = dsRelERTotal
    UserName = '_relERTotal'
    Left = 392
    Top = 128
    object ppRelERTotalppField1: TppField
      FieldAlias = 'TOTAL_CC'
      FieldName = 'TOTAL_CC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppRelERTotalppField2: TppField
      FieldAlias = 'TOTAL_REMESSA'
      FieldName = 'TOTAL_REMESSA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppRelERTotalppField3: TppField
      FieldAlias = 'TOTAL_DEDUCAO'
      FieldName = 'TOTAL_DEDUCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
end
