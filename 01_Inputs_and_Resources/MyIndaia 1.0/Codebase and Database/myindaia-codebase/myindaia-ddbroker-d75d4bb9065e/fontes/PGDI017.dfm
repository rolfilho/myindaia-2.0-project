object datm_DI: Tdatm_DI
  OldCreateOrder = True
  Left = 919
  Top = 330
  Height = 485
  Width = 598
  object qry_empresa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA , NM_EMPRESA, CGC_EMPRESA'
      'FROM TEMPRESA_NAC (NOLOCK)'
      'WHERE CD_EMPRESA= :CD_EMPRESA')
    Left = 160
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_empresa_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_empresa_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO , NM_SERVICO, CD_VIA_TRANSPORTE'
      'FROM TSERVICO TSERVICO (NOLOCK)'
      'WHERE CD_SERVICO = :CD_SERVICO')
    Left = 260
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
    object qry_servico_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 2
    end
    object qry_servico_LookViaTranspSiscomex: TStringField
      FieldKind = fkLookup
      FieldName = 'LookViaTranspSiscomex'
      LookupDataSet = qry_via_transp_
      LookupKeyFields = 'CD_VIA_TRANSP'
      LookupResultField = 'CD_VIA_TRANSP_SISCOMEX'
      KeyFields = 'CD_VIA_TRANSPORTE'
      Size = 2
      Lookup = True
    end
  end
  object qry_di_: TQuery
    AfterOpen = qry_di_AfterOpen
    AfterClose = qry_di_AfterClose
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT  NR_PROCESSO, CD_IMPORTADOR, CD_BANDEIRA_TRANSP, IN_MOEDA' +
        '_UNICA,  '
      #9'CD_TIPO_DECLARACAO, NR_DECLARACAO_IMP, '
      #9'TX_DOLAR, QT_ADICOES, CD_VIA_TRANSP_CARG,'
      #9'NR_DCTO_CARGA, NR_DCTO_CARGA_MAST, '
      
        #9'CD_TIPO_DCTO_CARGA, CD_TIPO_MANIFESTO, NR_MANIFESTO, HR_DI, HR_' +
        'CALCULO,'
      
        #9'DT_CHEGADA_CARGA, DT_EMBARQUE, CD_VEICULO_TRANSP, CD_TRANSPORTA' +
        'DOR,'
      #9'CD_PAIS_PROC_CARGA, NM_VEICULO_TRANSP, NR_VEICULO_TRANSP, '
      #9'VL_FRETE_TNAC_MNEG, IN_REPASSA_DADOS_CAMBIO,'
      
        #9'CD_TIPO_IMPORTADOR, CD_LOCAL_EMBARQUE, CD_MOEDA_MLE, CD_MOEDA_F' +
        'RETE, '
      
        #9'VL_TOT_FRT_COLLECT, VL_TOT_FRT_PREPAID, CD_URF_DESPACHO, CD_URF' +
        '_ENTR_CARGA, '
      
        #9'CD_RECINTO_ALFAND, CD_SETOR_ARMAZENAM, NR_AGENTE_CARGA, CD_PRES' +
        'ENCA_CARGA, '
      
        #9'CD_INCOTERM, PB_CARGA, PL_CARGA, CD_TIPO_BASE_SEGURO, PC_SEGURO' +
        '_MLE,VL_TOT_MLE_MNEG,'#9#9
      #9'CD_MOEDA_SEGURO,IN_EMBUT_FRT_ITENS, CD_VINC_IMPO_EXPO '
      'FROM    TDECLARACAO_IMPORTACAO (NOLOCK)'
      'WHERE   NR_PROCESSO = :NR_PROCESSO AND'
      
        '        ( ( NR_DECLARACAO_IMP <> '#39#39' ) OR ( NR_DECLARACAO_IMP IS ' +
        'NOT NULL ) )')
    Left = 160
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_di_CD_TIPO_DECLARACAO: TStringField
      FieldName = 'CD_TIPO_DECLARACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 2
    end
    object qry_di_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 10
    end
    object qry_di_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_CD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 2
    end
    object qry_di_NR_DCTO_CARGA: TStringField
      FieldName = 'NR_DCTO_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 30
    end
    object qry_di_NR_DCTO_CARGA_MAST: TStringField
      FieldName = 'NR_DCTO_CARGA_MAST'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_IMPORTADOR'
      Size = 30
    end
    object qry_di_CD_TIPO_DCTO_CARGA: TStringField
      FieldName = 'CD_TIPO_DCTO_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 2
    end
    object qry_di_DT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 8
    end
    object qry_di_DT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_IMPORTADOR'
      Size = 8
    end
    object qry_di_CD_PAIS_PROC_CARGA: TStringField
      FieldName = 'CD_PAIS_PROC_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 3
    end
    object qry_di_NM_VEICULO_TRANSP: TStringField
      FieldName = 'NM_VEICULO_TRANSP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 30
    end
    object qry_di_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 1
    end
    object qry_di_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 4
    end
    object qry_di_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 3
    end
    object qry_di_VL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_IMPORTADOR'
    end
    object qry_di_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object qry_di_CD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      Size = 7
    end
    object qry_di_CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Size = 7
    end
    object qry_di_CD_SETOR_ARMAZENAM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAM'
      Size = 3
    end
    object qry_di_NR_AGENTE_CARGA: TStringField
      FieldName = 'NR_AGENTE_CARGA'
      Size = 14
    end
    object qry_di_CD_PRESENCA_CARGA: TStringField
      FieldName = 'CD_PRESENCA_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 36
    end
    object qry_di_CD_TIPO_MANIFESTO: TStringField
      FieldName = 'CD_TIPO_MANIFESTO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 1
    end
    object qry_di_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_IMPORTADOR'
      Size = 15
    end
    object qry_di_VL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_NR_VEICULO_TRANSP: TStringField
      FieldName = 'NR_VEICULO_TRANSP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 15
    end
    object qry_di_CD_VEICULO_TRANSP: TStringField
      FieldName = 'CD_VEICULO_TRANSP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 4
    end
    object qry_di_CD_BANDEIRA_TRANSP: TStringField
      FieldName = 'CD_BANDEIRA_TRANSP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 3
    end
    object qry_di_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 4
    end
    object qry_di_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 3
    end
    object qry_di_IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 3
    end
    object qry_di_HR_DI: TStringField
      FieldName = 'HR_DI'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.HR_DI'
      FixedChar = True
      Size = 8
    end
    object qry_di_HR_CALCULO: TStringField
      FieldName = 'HR_CALCULO'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.HR_CALCULO'
      FixedChar = True
      Size = 8
    end
    object qry_di_IN_REPASSA_DADOS_CAMBIO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_CAMBIO'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.IN_REPASSA_DADOS_CAMBIO'
    end
    object qry_di_PB_CARGA: TFloatField
      FieldName = 'PB_CARGA'
    end
    object qry_di_PL_CARGA: TFloatField
      FieldName = 'PL_CARGA'
    end
    object qry_di_CD_TIPO_BASE_SEGURO: TStringField
      FieldName = 'CD_TIPO_BASE_SEGURO'
      Size = 1
    end
    object qry_di_PC_SEGURO_MLE: TFloatField
      FieldName = 'PC_SEGURO_MLE'
    end
    object qry_di_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
    end
    object qry_di_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_di_IN_EMBUT_FRT_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_FRT_ITENS'
    end
    object qry_di_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Size = 1
    end
  end
  object qry_tp_decl_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT Codigo , Descricao'
      'FROM TTIPO_DECLARACAO TTIPO_DECLARACAO (NOLOCK)'
      'WHERE Codigo = :CODIGO')
    Left = 260
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_tp_decl_Codigo: TStringField
      FieldName = 'Codigo'
      Origin = 'TTIPO_DECLARACAO.Codigo'
      Size = 2
    end
    object qry_tp_decl_Descricao: TStringField
      FieldName = 'Descricao'
      Origin = 'TTIPO_DECLARACAO.Descricao'
      Size = 120
    end
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG , NM_UNID_NEG, AP_UNID_NEG , IN_ATIVO'
      'FROM TUNID_NEG TUNID_NEG (NOLOCK)'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 48
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unidade_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unidade_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Size = 60
    end
    object qry_unidade_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
    object qry_unidade_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG.IN_ATIVO'
      Size = 1
    end
  end
  object qry_processo_: TQuery
    AfterClose = qry_processo_AfterClose
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  P.NR_PROCESSO '
      '       ,P.CD_CLIENTE '
      '       ,P.CD_UNID_NEG'
      '       ,P.NR_CONHECIMENTO'
      '       ,P.NR_CONHECIMENTO_MASTER'
      '       ,P.CD_SERVICO'
      '       ,P.CD_PAIS_ORIGEM'
      '       ,E.CD_EMBARCACAO'
      '       ,E.NM_EMBARCACAO'
      '       ,T.CD_PAIS'
      '       ,P.CD_MOEDA_MLE'
      '       ,P.CD_MOEDA_FRETE'
      '       ,P.VL_FRETE_COLLECT_MNEG'
      '       ,P.VL_FRETE_PREPAID_MNEG'
      '       ,N.CD_TIPO_PESSOA'
      '       ,P.CD_LOCAL_EMBARQUE'
      '       ,P.IN_CANCELADO'
      '       ,P.IN_LIBERADO'
      '       ,P.IN_PRODUCAO'
      '       ,P.CD_ARMAZEM_DESCARGA'
      '       ,P.CD_AGENTE'
      '       ,P.NR_MANIFESTO'
      '       ,P.NR_PLACA_VEICULO'
      '       ,P.CD_PRODUTO'
      '       ,A.CD_URF CD_URF_ENTRADA'
      '       ,P.VL_FRETE_TNAC_MNEG'
      '       ,P.CD_TRANSPORTADOR'
      '       ,P.ID_CODIGO_INSTR_DESEMB'
      '       ,P.CD_TERMO_PAGTO'
      '       ,P.VL_PESO_BRUTO'
      '       ,P.VL_PESO_LIQUIDO'
      '       ,P.VL_MLE_MNEG'
      '       ,P.TP_FRETE'
      
        '       ,isnull(EN.CD_TIPO_BASE_SEGURO_DI, G.CD_TIPO_BASE_SEGURO_' +
        'DI) AS CD_TIPO_BASE_SEGURO_DI'
      
        '       ,isnull(EN.PC_SEGURO_MLE_DI, G.PC_SEGURO_MLE_DI) AS PC_SE' +
        'GURO_MLE_DI '
      '       ,P.CD_GRUPO            '
      '  FROM    TPROCESSO          P  (NOLOCK)'
      
        'LEFT JOIN TEMBARCACAO        E  (NOLOCK) ON E.CD_EMBARCACAO = CA' +
        'SE WHEN ISNULL(P.IN_BALDEACAO, '#39'0'#39') = '#39'0'#39
      
        '                                                                ' +
        '  THEN P.CD_EMBARCACAO'
      
        '                                                                ' +
        '  ELSE P.CD_EMBARCACAO_BALDEACAO'
      
        '                                                             END' +
        '     '
      
        'LEFT JOIN TEMPRESA_NAC       N  (NOLOCK) ON N.CD_EMPRESA    = P.' +
        'CD_CLIENTE '
      
        'LEFT JOIN TARMAZEM           A  (NOLOCK) ON A.CD_ARMAZEM    = P.' +
        'CD_ARMAZEM_ATRACACAO'
      
        'LEFT JOIN TTRANSPORTADOR_ITL T  (NOLOCK) ON T.CODIGO        = P.' +
        'CD_TRANSPORTADOR'
      
        '     JOIN TEMPRESA_NAC       EN (NOLOCK) ON EN.CD_EMPRESA   = P.' +
        'CD_CLIENTE '
      
        '     JOIN TGRUPO             G  (NOLOCK) ON G.CD_GRUPO      = EN' +
        '.CD_GRUPO'
      ''
      ' WHERE P.NR_PROCESSO   = :NR_PROCESSO ')
    Left = 48
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 3
    end
    object qry_processo_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 30
    end
    object qry_processo_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 30
    end
    object qry_processo_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
    object qry_processo_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Size = 40
    end
    object qry_processo_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Size = 1
    end
    object qry_processo_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Size = 1
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Size = 1
    end
    object qry_processo_IN_PRODUCAO: TStringField
      FieldName = 'IN_PRODUCAO'
      Size = 1
    end
    object qry_processo_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_processo_VL_FRETE_COLLECT_MNEG: TFloatField
      FieldName = 'VL_FRETE_COLLECT_MNEG'
    end
    object qry_processo_CD_ARMAZEM_DESCARGA: TStringField
      FieldName = 'CD_ARMAZEM_DESCARGA'
      Size = 4
    end
    object qry_processo_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Size = 4
    end
    object qry_processo_LookAgente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAgente'
      LookupDataSet = qry_agente_
      LookupKeyFields = 'CD_AGENTE'
      LookupResultField = 'NR_CGC_AGENTE'
      KeyFields = 'CD_AGENTE'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
      Lookup = True
    end
    object qry_processo_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Size = 15
    end
    object qry_processo_VL_FRETE_PREPAID_MNEG: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MNEG'
    end
    object qry_processo_NR_PLACA_VEICULO: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      Size = 15
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_processo_CD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Size = 7
    end
    object qry_processo_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Size = 4
    end
    object qry_processo_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
    end
    object qry_processo_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      Size = 4
    end
    object qry_processo_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 3
    end
    object qry_processo_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Size = 3
    end
    object qry_processo_ID_CODIGO_INSTR_DESEMB: TStringField
      FieldName = 'ID_CODIGO_INSTR_DESEMB'
      FixedChar = True
      Size = 13
    end
    object qry_processo_CD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      FixedChar = True
      Size = 6
    end
    object qry_processo_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qry_processo_VL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
    object qry_processo_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
    end
    object qry_processo_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Size = 1
    end
    object qry_processo_PC_SEGURO_MLE_DI: TFloatField
      FieldName = 'PC_SEGURO_MLE_DI'
    end
    object qry_processo_CD_TIPO_BASE_SEGURO_DI: TStringField
      FieldName = 'CD_TIPO_BASE_SEGURO_DI'
      Size = 1
    end
    object qry_processo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
  end
  object ds_taxa_cambio: TDataSource
    DataSet = tbl_taxa_cambio_
    Left = 48
    Top = 132
  end
  object tbl_taxa_cambio_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TCONVERSAO_CAMBIO'
    UpdateMode = upWhereKeyOnly
    Left = 160
    Top = 132
    object tbl_taxa_cambio_Codigo: TStringField
      FieldName = 'Codigo'
      Size = 3
    end
    object tbl_taxa_cambio_Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
    object tbl_taxa_cambio_Taxa_Conversao: TStringField
      FieldName = 'Taxa_Conversao'
      Size = 9
    end
    object tbl_taxa_cambio_Vigencia_Inicio_Taxa: TStringField
      FieldName = 'Vigencia_Inicio_Taxa'
      Size = 10
    end
    object tbl_taxa_cambio_Vigencia_Fim_Taxa: TStringField
      FieldName = 'Vigencia_Fim_Taxa'
      Size = 10
    end
  end
  object sp_di_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_calculo'
    Left = 260
    Top = 132
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object qry_via_transp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TVIA_TRANSP_BROKER')
    Left = 352
    Top = 24
    object qry_via_transp_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSP'
      Size = 2
    end
    object qry_via_transp_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      Origin = 'TVIA_TRANSPORTE.NM_VIA_TRANSP'
    end
    object qry_via_transp_CD_VIA_TRANSP_SISCOMEX: TStringField
      FieldName = 'CD_VIA_TRANSP_SISCOMEX'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSP_SISCOMEX'
      Size = 2
    end
    object qry_via_transp_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TVIA_TRANSPORTE.IN_ATIVO'
      Size = 1
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG '
      '               FROM TUSUARIO_HABILITACAO (NOLOCK)'
      '               WHERE CD_USUARIO=:CD_USUARIO'
      '              AND IN_ATIVO='#39'1'#39)
    Left = 352
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
  end
  object qry_ev_dt_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  '
      '('
      'SELECT DT_REALIZACAO'
      'FROM VW_DT_EMBARQUE '
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      ') DT_EMBARQUE,'
      '('
      'SELECT DT_REALIZACAO'
      'FROM VW_DT_CHEGADA '
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      ') DT_CHEGADA')
    Left = 352
    Top = 132
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ev_dt_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object qry_ev_dt_DT_CHEGADA: TDateTimeField
      FieldName = 'DT_CHEGADA'
    end
  end
  object qry_agente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_AGENTE, NR_CGC_AGENTE'
      'FROM TAGENTE (NOLOCK)')
    Left = 48
    Top = 190
    object qry_agente_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TAGENTE.CD_AGENTE'
      Size = 4
    end
    object qry_agente_NR_CGC_AGENTE: TStringField
      FieldName = 'NR_CGC_AGENTE'
      Origin = 'TAGENTE.NR_CGC_AGENTE'
      Size = 14
    end
  end
  object sp_di_ret_embalagem: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_ret_embalagem'
    Left = 156
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object sp_di_gera_adm_temp: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_gera_adm_temp'
    Left = 280
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object sp_po_exclui: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_exclui'
    Left = 375
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object sp_da_gera_di: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_da_gera_di'
    Left = 159
    Top = 254
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object sp_nac_gera_di: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_nac_gera_di'
    Left = 253
    Top = 254
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object sp_di_classifica_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_classifica_item'
    Left = 55
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_adicao'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = '@nr_item'
        ParamType = ptOutput
      end>
    object sp_di_classifica_itemNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object sp_di_classifica_itemNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qryHistCalc: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '#39'Ver Resumo'#39' AS NM_OPCAO,'
      '       '#39'C'#225'lculo'#39' AS NM_OPERACAO,'
      
        '       RTRIM(SUBSTRING(H.NR_PROCESSO, 5, 14)) AS NR_PROCESSO_BAS' +
        'ICO,'
      '       H.DT_OPERACAO AS DT_REALIZACAO,'
      '       H.*,'
      '       U.NM_USUARIO,'
      '       (SELECT NM_SERVICO'
      '        FROM TSERVICO S (NOLOCK)'
      '        WHERE S.CD_SERVICO = H.CD_SERVICO) AS NM_SERVICO,'
      '       (SELECT R.Nome'
      '        FROM TRECINTO_SETORES_IMPORTACAO R (NOLOCK)'
      '        WHERE R.Orgao   = H.CD_URF_ENTR_CARGA'
      '          AND R.Recinto = H.CD_RECINTO_ALFAND'
      '          AND R.Setor   = H.CD_SETOR_ARMAZENAM) AS NM_RECINTO,'
      '       CASE H.CD_APLICACAO'
      '           WHEN '#39'1'#39' THEN '#39'Consumo'#39
      '           WHEN '#39'2'#39' THEN '#39'Revenda'#39
      '       END AS NM_APLICACAO,'
      '       (SELECT NM_AREA'
      '        FROM TAREA A (NOLOCK)'
      '        WHERE A.CD_AREA = H.CD_AREA) AS NM_AREA,'
      '       (SELECT NM_TRANSP_ROD'
      '        FROM TTRANSP_ROD T (NOLOCK)'
      
        '        WHERE T.CD_TRANSP_ROD = H.CD_TRANSP_NAC) AS NM_TRANSP_RO' +
        'D,'
      '       (SELECT NM_EMBARCACAO'
      '        FROM TEMBARCACAO E (NOLOCK)'
      
        '        WHERE E.CD_EMBARCACAO = H.CD_EMBARCACAO) AS NM_EMBARCACA' +
        'O'
      'FROM THISTORICO_CALCULO_DI H  (NOLOCK)'
      
        '   LEFT JOIN TUSUARIO      U  (NOLOCK) ON ((H.CD_USUARIO IS NOT ' +
        'NULL) AND (U.CD_USUARIO = H.CD_USUARIO)) OR ((H.CD_USUARIO IS NU' +
        'LL) AND U.AP_USUARIO = SUSER_NAME(H.ID_USUARIO))'
      'WHERE H.NR_PROCESSO = :NR_PROCESSO'
      'UNION'
      'SELECT '#39#39' AS NM_OPCAO,'
      '       E.NM_EVENTO AS NM_OPERACAO,'
      
        '       RTRIM(SUBSTRING(F.NR_PROCESSO, 5, 14)) AS NR_PROCESSO_BAS' +
        'ICO,'
      '       F.DT_REALIZACAO,'
      '       F.NR_PROCESSO,'
      '       F.DT_REALIZACAO_EFETIVA AS DT_OPERACAO,'
      '       F.CD_RESP_REALIZACAO AS CD_USUARIO,'
      '       NULL AS ID_USUARIO,'
      '       NULL AS VL_TOTAL_AD,'
      '       NULL AS DT_CALCULO,'
      '       NULL AS TX_DOLAR,'
      '       NULL AS VL_CIF_MN,'
      '       NULL AS CD_MOEDA_MLE,'
      '       NULL AS TX_MLE,'
      '       NULL AS VL_MLE_MN,'
      '       NULL AS VL_MLE_MNEG,'
      '       NULL AS VL_II,'
      '       NULL AS VL_IPI,'
      '       NULL AS VL_PIS,'
      '       NULL AS VL_COFINS,'
      '       NULL AS VL_ICMS,'
      '       NULL AS VL_FUNDO_POBREZA,'
      '       NULL AS VL_TRIBUTO_PAGO,'
      '       NULL AS VL_SDA,'
      '       NULL AS VL_DESPS_MN,'
      '       NULL AS VL_ACRESCIMOS_MN,'
      '       NULL AS VL_DESPS_MNEG,'
      '       NULL AS VL_DEDUCOES_MN,'
      '       NULL AS CD_MOEDA_SEGURO,'
      '       NULL AS TX_SEGURO,'
      '       NULL AS VL_SEG_MN,'
      '       NULL AS VL_SEGURO_MNEG,'
      '       NULL AS CD_MOEDA_FRETE,'
      '       NULL AS TX_FRETE,'
      '       NULL AS VL_FRETE_MN,'
      '       NULL AS VL_FRETE_MNEG,'
      '       NULL AS CD_SERVICO,'
      '       NULL AS CD_RECINTO_ALFAND,'
      '       NULL AS CD_SETOR_ARMAZENAM,'
      '       NULL AS CD_URF_ENTR_CARGA,'
      '       NULL AS CD_APLICACAO,'
      '       NULL AS CD_AREA,'
      '       NULL AS CD_TRANSP_NAC,'
      '       NULL AS CD_EMBARCACAO,'
      '       NULL AS DT_CHEG_NAVIO,'
      '       U.NM_USUARIO,'
      '       NULL AS NM_SERVICO,'
      '       NULL AS NM_RECINTO,'
      '       NULL AS NM_APLICACAO,'
      '       NULL AS NM_AREA,'
      '       NULL AS NM_TRANSP_ROD,'
      '       NULL AS NM_EMBARCACAO'
      'FROM TFOLLOWUP F (NOLOCK)'
      '   INNER JOIN TEVENTO E ON E.CD_EVENTO = F.CD_EVENTO'
      '   LEFT JOIN TUSUARIO U ON U.CD_USUARIO = F.CD_RESP_REALIZACAO'
      'WHERE F.NR_PROCESSO = :NR_PROCESSO'
      
        '  AND F.CD_EVENTO IN ('#39'021'#39', '#39'088'#39', '#39'416'#39', '#39'419'#39') -- REGISTRO, D' +
        'ESEMBARA'#199'O, ANALISE DOC, CONFEC'#199#195'O'
      'ORDER BY DT_OPERACAO DESC')
    Left = 336
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryHistCalcNM_OPCAO: TStringField
      FieldName = 'NM_OPCAO'
      FixedChar = True
      Size = 10
    end
    object qryHistCalcNR_PROCESSO_BASICO: TStringField
      FieldName = 'NR_PROCESSO_BASICO'
      FixedChar = True
      Size = 14
    end
    object qryHistCalcNM_OPERACAO: TStringField
      FieldName = 'NM_OPERACAO'
      FixedChar = True
      Size = 50
    end
    object qryHistCalcDT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
    end
    object qryHistCalcNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 14
    end
    object qryHistCalcDT_OPERACAO: TDateTimeField
      FieldName = 'DT_OPERACAO'
    end
    object qryHistCalcCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryHistCalcID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
    end
    object qryHistCalcVL_TOTAL_AD: TFloatField
      FieldName = 'VL_TOTAL_AD'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcDT_CALCULO: TDateTimeField
      FieldName = 'DT_CALCULO'
    end
    object qryHistCalcTX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      DisplayFormat = '0.,0000'
    end
    object qryHistCalcVL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcCD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      FixedChar = True
      Size = 3
    end
    object qryHistCalcTX_MLE: TFloatField
      FieldName = 'TX_MLE'
      DisplayFormat = '0.,0000'
    end
    object qryHistCalcVL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_II: TFloatField
      FieldName = 'VL_II'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_IPI: TFloatField
      FieldName = 'VL_IPI'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_PIS: TFloatField
      FieldName = 'VL_PIS'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_FUNDO_POBREZA: TFloatField
      FieldName = 'VL_FUNDO_POBREZA'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_TRIBUTO_PAGO: TFloatField
      FieldName = 'VL_TRIBUTO_PAGO'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_SDA: TFloatField
      FieldName = 'VL_SDA'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_DESPS_MN: TFloatField
      FieldName = 'VL_DESPS_MN'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_ACRESCIMOS_MN: TFloatField
      FieldName = 'VL_ACRESCIMOS_MN'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_DEDUCOES_MN: TFloatField
      FieldName = 'VL_DEDUCOES_MN'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_DESPS_MNEG: TFloatField
      FieldName = 'VL_DESPS_MNEG'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcCD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      FixedChar = True
      Size = 3
    end
    object qryHistCalcTX_SEGURO: TFloatField
      FieldName = 'TX_SEGURO'
      DisplayFormat = '0.,0000'
    end
    object qryHistCalcVL_SEG_MN: TFloatField
      FieldName = 'VL_SEG_MN'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcCD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qryHistCalcTX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
      DisplayFormat = '0.,0000'
    end
    object qryHistCalcVL_FRETE_MN: TFloatField
      FieldName = 'VL_FRETE_MN'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcVL_FRETE_MNEG: TFloatField
      FieldName = 'VL_FRETE_MNEG'
      DisplayFormat = '0.,00'
    end
    object qryHistCalcCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qryHistCalcCD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      FixedChar = True
      Size = 7
    end
    object qryHistCalcCD_SETOR_ARMAZENAM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAM'
      FixedChar = True
      Size = 3
    end
    object qryHistCalcCD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      FixedChar = True
      Size = 7
    end
    object qryHistCalcCD_APLICACAO: TStringField
      FieldName = 'CD_APLICACAO'
      FixedChar = True
      Size = 1
    end
    object qryHistCalcCD_AREA: TStringField
      FieldName = 'CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qryHistCalcCD_TRANSP_NAC: TStringField
      FieldName = 'CD_TRANSP_NAC'
      FixedChar = True
      Size = 4
    end
    object qryHistCalcCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      FixedChar = True
      Size = 4
    end
    object qryHistCalcDT_CHEG_NAVIO: TDateTimeField
      FieldName = 'DT_CHEG_NAVIO'
    end
    object qryHistCalcNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qryHistCalcNM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qryHistCalcNM_RECINTO: TStringField
      FieldName = 'NM_RECINTO'
      FixedChar = True
      Size = 30
    end
    object qryHistCalcNM_APLICACAO: TStringField
      FieldName = 'NM_APLICACAO'
      FixedChar = True
      Size = 7
    end
    object qryHistCalcNM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 50
    end
    object qryHistCalcNM_TRANSP_ROD: TStringField
      FieldName = 'NM_TRANSP_ROD'
      FixedChar = True
      Size = 60
    end
    object qryHistCalcNM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
  end
  object dsHistcalc: TDataSource
    DataSet = qryHistCalc
    Left = 400
    Top = 272
  end
  object qryInsereDoctos: TQuery
    AfterClose = qry_processo_AfterClose
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'INSERT INTO TDOCUMENTO_INSTRUCAO (NR_PROCESSO, NR_SEQUENCIA, CD_' +
        'TIPO_DCTO_INSTR, NR_DCTO_INSTRUCAO)'
      'SELECT P.NR_PROCESSO,'
      '       ISNULL((SELECT MAX(NR_SEQUENCIA) + 1 '
      '                 FROM TDOCUMENTO_INSTRUCAO D'
      '                WHERE D.NR_PROCESSO = P.NR_PROCESSO),1),'
      '       '#39'26'#39','
      '       '#39'GUIA DE ICMS/EXONERA'#199#195'O'#39' '
      '  FROM TPROCESSO P'
      
        '  LEFT JOIN TDOCUMENTO_INSTRUCAO A (NOLOCK) ON A.CD_TIPO_DCTO_IN' +
        'STR = '#39'26'#39
      
        '                                           AND A.NR_DCTO_INSTRUC' +
        'AO  = '#39'GUIA DE ICMS/EXONERA'#199#195'O'#39
      
        '                                           AND A.NR_PROCESSO    ' +
        '    = P.NR_PROCESSO'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO1'
      '  AND A.NR_PROCESSO IS NULL '
      '  '
      '  '
      '  '
      
        'INSERT INTO TDOCUMENTO_INSTRUCAO (NR_PROCESSO, NR_SEQUENCIA, CD_' +
        'TIPO_DCTO_INSTR, NR_DCTO_INSTRUCAO)'
      'SELECT P.NR_PROCESSO,'
      '       ISNULL((SELECT MAX(NR_SEQUENCIA) + 1 '
      '                 FROM TDOCUMENTO_INSTRUCAO D'
      '                WHERE D.NR_PROCESSO = P.NR_PROCESSO),1),'
      '       '#39'26'#39','
      '       '#39'MIC/DTA '#39' + ISNULL(LTRIM(RTRIM(P.NR_MANIFESTO)),'#39#39')'
      '  FROM TPROCESSO P'
      
        '  LEFT JOIN TDOCUMENTO_INSTRUCAO A (NOLOCK) ON A.CD_TIPO_DCTO_IN' +
        'STR = '#39'26'#39
      
        '                                           AND A.NR_DCTO_INSTRUC' +
        'AO  = '#39'MIC/DTA '#39' + ISNULL(LTRIM(RTRIM(P.NR_MANIFESTO)),'#39#39')'
      
        '                                           AND A.NR_PROCESSO    ' +
        '    = P.NR_PROCESSO'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO2'
      '  AND A.NR_PROCESSO IS NULL '
      '  AND ISNULL(P.NR_MANIFESTO, '#39#39') <> '#39#39)
    Left = 55
    Top = 323
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO1'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO2'
        ParamType = ptInput
        Size = 18
      end>
  end
  object qryInsereDeducao: TQuery
    AfterClose = qry_processo_AfterClose
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'INSERT INTO TACRESCIMO_DEDUCAO (NR_PROCESSO, CD_DESPESA,CD_MOEDA' +
        ', VL_MOEDA, TP_BASE, TP_DESPESA )'
      'SELECT A.NR_PROCESSO,'
      '       1                  AS CD_DESPESA,'
      '       '#39'220'#39'              AS CD_MOEDA,'
      '       VL_FRETE_TNAC_MNEG AS VL_MOEDA,'
      '       '#39'Valor'#39'            AS TP_BASE,'
      '       '#39'D'#39'                AS TP_DESPESA'
      '  FROM TPROCESSO               A (NOLOCK)'
      
        '  LEFT JOIN TACRESCIMO_DEDUCAO B (NOLOCK) ON B.NR_PROCESSO = A.N' +
        'R_PROCESSO'
      
        '                                         AND B.VL_MOEDA    = A.V' +
        'L_FRETE_TNAC_MNEG'
      '                                         AND B.TP_DESPESA  = '#39'D'#39
      ' WHERE A.NR_PROCESSO = :NR_PROCESSO'
      '   AND ISNULL(VL_FRETE_TNAC_MNEG,0) >0'
      '   AND B.NR_PROCESSO IS NULL')
    Left = 140
    Top = 319
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
  end
  object qryInsereEmbalagem: TQuery
    AfterClose = qry_processo_AfterClose
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'INSERT INTO TEMBALAGEM_CARGA (NR_PROCESSO, NR_SEQUENCIA, CD_TIPO' +
        '_EMBALAGEM, QT_VOLUME_CARGA)'
      ' SELECT A.NR_PROCESSO, '
      '        A.NR_SEQUENCIA, '
      '        TP_ESTUFAGEM AS CD_TIPO_EMBALAGEM, '
      '        VL_QTDE      AS QT_VOLUME_CARGA '
      '   FROM TPROCESSO_CARGA_SOLTA A (NOLOCK)'
      
        ' LEFT JOIN TEMBALAGEM_CARGA   B (NOLOCK) ON B.NR_PROCESSO       ' +
        '= A.NR_PROCESSO'
      
        '                                        AND B.CD_TIPO_EMBALAGEM ' +
        '= A.TP_ESTUFAGEM'
      
        '                                        AND B.QT_VOLUME_CARGA   ' +
        '= A.VL_QTDE'
      '  WHERE A.NR_PROCESSO = :NR_PROCESSO'
      '    AND B.NR_PROCESSO IS NULL')
    Left = 236
    Top = 312
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
  end
  object qryRefCliente: TQuery
    AfterClose = qry_processo_AfterClose
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_REFERENCIA'
      'FROM TREF_CLIENTE R (NOLOCK)'
      'INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = R.NR_PROCESSO'
      'INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = P.CD_GRUPO'
      'WHERE '
      
        'P.NR_PROCESSO = :NR_PROCESSO AND R.TP_REFERENCIA = CASE WHEN P.C' +
        'D_PRODUTO='#39'01'#39' THEN G.TP_PEDIDO_BUSCA_IMP WHEN P.CD_PRODUTO='#39'02'#39 +
        ' THEN G.TP_PEDIDO_BUSCA END'
      'GROUP BY CD_REFERENCIA')
    Left = 54
    Top = 377
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
end
