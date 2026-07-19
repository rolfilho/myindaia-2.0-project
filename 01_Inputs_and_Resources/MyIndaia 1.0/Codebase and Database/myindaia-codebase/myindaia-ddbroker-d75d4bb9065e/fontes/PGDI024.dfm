object datm_icms_online: Tdatm_icms_online
  OldCreateOrder = True
  Left = 374
  Top = 223
  Height = 408
  Width = 607
  object qry_lista_processos_: TQuery
    AfterScroll = qry_lista_processos_AfterScroll
    OnCalcFields = qry_lista_processos_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT D.NR_PROCESSO, D.IN_ICMS_IMPRESSO, D.IN_EXON_IMPRESSO, E.' +
        'END_UF AS UF_CLIENTE, U.END_UF AS UF_DESPACHO, D.CD_IMPORTADOR, ' +
        'E.AP_EMPRESA,'
      '       CASE :CD_TIPO_ICMS'
      '         WHEN '#39'1'#39' THEN D.DT_ICMS_IMPRESSO'
      '         WHEN '#39'2'#39' THEN D.DT_ICMS_IMPRESSO'
      '         WHEN '#39'3'#39' THEN D.DT_EXON_IMPRESSO'
      '         WHEN '#39'4'#39' THEN D.DT_ICMS_IMPRESSO'
      '       END DT_IMPRESSAO,'
      '       CASE :CD_TIPO_ICMS'
      '         WHEN '#39'1'#39' THEN D.IN_ICMS_IMPRESSO'
      '         WHEN '#39'2'#39' THEN D.IN_ICMS_IMPRESSO'
      '         WHEN '#39'3'#39' THEN D.IN_EXON_IMPRESSO'
      '         WHEN '#39'4'#39' THEN D.IN_ICMS_IMPRESSO'
      '       END IN_IMPRESSAO,'
      '       (SELECT CASE ISNULL(D.IN_CALCULOU_COM_AFRMM, 0)'
      '                   WHEN 1 THEN SUM(AD.VL_BASE_CALC_ICMS_AFRMM)'
      '               ELSE SUM(AD.VL_BASE_CALC_ICMS)'
      '               END'
      '        FROM TADICAO_DE_IMPORTACAO AD'
      
        '        WHERE AD.NR_PROCESSO = D.NR_PROCESSO) AS VL_BASE_CALC_IC' +
        'MS,'
      '       (SELECT CASE ISNULL(D.IN_CALCULOU_COM_AFRMM, 0)'
      '                   WHEN 1 THEN SUM(AD.VL_BASE_CALC_ICMS_AFRMM)'
      '               ELSE SUM(AD.VL_BASE_CALC_ICMS)'
      '               END'
      '        FROM TADICAO_DE_IMPORTACAO AD'
      '        WHERE AD.NR_PROCESSO = D.NR_PROCESSO'
      
        '          AND ISNULL(AD.IN_FUNDO_POBREZA, '#39'0'#39') = '#39'1'#39') AS VL_BASE' +
        '_CALC_ICMS_FUNDO,'
      '       D.IN_REB, D.VL_TOTAL_MLE_MN, D.VL_TOTAL_FRETE_MN,'
      '       D.VL_TOTAL_SEG_MN, D.VL_TOTAL_II, D.VL_TOTAL_IPI,'
      '       D.VL_TOTAL_AD, D.VL_TOT_ICMS, A.NM_LOCAL_DESP,'
      
        '       A.CD_UF CD_UF_ARM, U.END_UF UF_UNID_NEG, P.VL_CIF_MN, ( S' +
        'ELECT SUM( VL_TX_SCX_AD ) FROM TADICAO_DE_IMPORTACAO AD WHERE AD' +
        '.NR_PROCESSO = D.NR_PROCESSO ) AS VL_TAXA_SISCOMEX, D.VL_TOT_PIS' +
        '_COFINS,'
      
        '       ( SELECT SUM( VL_PIS ) FROM TADICAO_DE_IMPORTACAO AD WHER' +
        'E AD.NR_PROCESSO = D.NR_PROCESSO ) AS VL_PIS,'
      
        '       ( SELECT SUM( VL_COFINS ) FROM TADICAO_DE_IMPORTACAO AD W' +
        'HERE AD.NR_PROCESSO = D.NR_PROCESSO ) AS VL_COFINS,'
      
        '       ( SELECT SUM( VL_ICMS_A_RECOLHER_AFRMM ) FROM TADICAO_DE_' +
        'IMPORTACAO AD WHERE AD.NR_PROCESSO = D.NR_PROCESSO ) AS VL_ICMS_' +
        'A_RECOLHER_AFRMM,'
      
        '       ( SELECT SUM( VL_ICMS_A_RECOLHER ) FROM TADICAO_DE_IMPORT' +
        'ACAO AD WHERE AD.NR_PROCESSO = D.NR_PROCESSO ) AS VL_ICMS_A_RECO' +
        'LHER'
      'FROM TDECLARACAO_IMPORTACAO D'
      'JOIN TPROCESSO    P ON (P.NR_PROCESSO = D.NR_PROCESSO)'
      'JOIN TEMPRESA_NAC E ON (E.CD_EMPRESA  = D.CD_IMPORTADOR)'
      'JOIN TURF         U ON (U.CODIGO      = D.CD_URF_DESPACHO)'
      'LEFT JOIN TARMAZEM A ON (A.CD_ARMAZEM = P.CD_ARMAZEM_DESCARGA)'
      'WHERE P.IN_CANCELADO = '#39'0'#39' AND'
      '      P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '      D.DT_REGISTRO_DI = :DT_BASE AND'
      '      ( ( (:CD_TIPO_ICMS = '#39'1'#39') AND'
      '          (D.CD_TIPO_ICMS IN ('#39'1'#39','#39'4'#39') ) AND'
      '          (U.END_UF = E.END_UF) AND (E.END_UF IN ('#39'SP'#39', '#39'RJ'#39')) '
      '         ) OR'
      '        ( (:CD_TIPO_ICMS = '#39'2'#39') AND'
      '          (D.CD_TIPO_ICMS IN ('#39'2'#39','#39'5'#39') ) /*AND'
      '          ((U.END_UF + E.END_UF IN ('#39'SPRJ'#39', '#39'RJSP'#39')) OR'
      
        '           ((U.END_UF NOT IN ('#39'SP'#39', '#39'RJ'#39')) AND (E.END_UF NOT IN ' +
        '('#39'SP'#39', '#39'RJ'#39'))))*/ '
      '         ) OR'
      '        ( (:CD_TIPO_ICMS = '#39'3'#39') AND'
      '          (D.CD_TIPO_ICMS IN ('#39'3'#39','#39'4'#39','#39'5'#39') ) '
      '         ) OR'
      '        ( (:CD_TIPO_ICMS = '#39'4'#39') AND'
      '          (D.CD_TIPO_ICMS IN ('#39'1'#39','#39'4'#39') ) AND'
      '          (U.END_UF = E.END_UF) '
      '         ) OR'
      #9#9' ('
      #9#9#9':IN_SEM_ADICAO = '#39'1'#39
      #9#9' )           '
      '       ) AND'
      '        ('
      '           ( '
      
        '             (:IN_SEM_ADICAO = '#39'0'#39') AND (SELECT COUNT(NR_PROCESS' +
        'O) FROM TADICAO_DE_IMPORTACAO WHERE NR_PROCESSO = D.NR_PROCESSO ' +
        'AND IN_PERMITE_CAT63 = '#39'0'#39') <> 0'
      '           )'
      '           OR'#9#9#9
      '           ('
      
        '             (:IN_SEM_ADICAO = '#39'1'#39') AND (SELECT COUNT(NR_PROCESS' +
        'O) FROM TADICAO_DE_IMPORTACAO WHERE NR_PROCESSO = D.NR_PROCESSO ' +
        'AND IN_PERMITE_CAT63 = '#39'0'#39') = 0'
      '           )'
      '         )'#9#9
      'ORDER BY DATEPART(YEAR, P.DT_ABERTURA), P.NR_PROCESSO')
    Left = 48
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_TIPO_ICMS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_TIPO_ICMS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DT_BASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_TIPO_ICMS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_TIPO_ICMS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_TIPO_ICMS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_TIPO_ICMS'
        ParamType = ptUnknown
      end
      item
        DataType = ftBoolean
        Name = 'IN_SEM_ADICAO'
        ParamType = ptOutput
      end
      item
        DataType = ftBoolean
        Name = 'IN_SEM_ADICAO'
        ParamType = ptOutput
      end
      item
        DataType = ftBoolean
        Name = 'IN_SEM_ADICAO'
        ParamType = ptOutput
      end>
    object qry_lista_processos_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_lista_processos_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object qry_lista_processos_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_lista_processos_DT_IMPRESSAO: TDateTimeField
      FieldName = 'DT_IMPRESSAO'
    end
    object qry_lista_processos_IN_IMPRESSAO: TStringField
      FieldName = 'IN_IMPRESSAO'
      Size = 1
    end
    object qry_lista_processos_VL_BASE_CALC_ICMS: TFloatField
      FieldName = 'VL_BASE_CALC_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_processos_VL_BASE_CALC_ICMS_FUNDO: TFloatField
      FieldName = 'VL_BASE_CALC_ICMS_FUNDO'
    end
    object qry_lista_processos_IN_REB: TStringField
      FieldName = 'IN_REB'
      Size = 1
    end
    object qry_lista_processos_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
    end
    object qry_lista_processos_VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
    end
    object qry_lista_processos_VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
    end
    object qry_lista_processos_VL_TOTAL_II: TFloatField
      FieldName = 'VL_TOTAL_II'
    end
    object qry_lista_processos_VL_TOTAL_IPI: TFloatField
      FieldName = 'VL_TOTAL_IPI'
    end
    object qry_lista_processos_VL_TOTAL_AD: TFloatField
      FieldName = 'VL_TOTAL_AD'
    end
    object qry_lista_processos_VL_TOT_ICMS: TFloatField
      FieldName = 'VL_TOT_ICMS'
    end
    object qry_lista_processos_NM_LOCAL_DESP: TStringField
      FieldName = 'NM_LOCAL_DESP'
    end
    object qry_lista_processos_CD_UF_ARM: TStringField
      FieldName = 'CD_UF_ARM'
      Size = 2
    end
    object qry_lista_processos_UF_UNID_NEG: TStringField
      FieldName = 'UF_UNID_NEG'
      Size = 2
    end
    object qry_lista_processos_VL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
    end
    object qry_lista_processos_IN_ICMS_IMPRESSO: TStringField
      FieldName = 'IN_ICMS_IMPRESSO'
      Size = 1
    end
    object qry_lista_processos_calc_NR_PROCESSO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_NR_PROCESSO'
      Size = 14
      Calculated = True
    end
    object qry_lista_processos_calc_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_STATUS'
      Size = 1
      Calculated = True
    end
    object qry_lista_processos_IN_EXON_IMPRESSO: TStringField
      FieldName = 'IN_EXON_IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object qry_lista_processos_VL_TAXA_SISCOMEX: TFloatField
      FieldName = 'VL_TAXA_SISCOMEX'
    end
    object qry_lista_processos_VL_TOT_PIS_COFINS: TFloatField
      FieldName = 'VL_TOT_PIS_COFINS'
    end
    object qry_lista_processos_VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object qry_lista_processos_VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object qry_lista_processos_VL_ICMS_A_RECOLHER_AFRMM: TFloatField
      FieldName = 'VL_ICMS_A_RECOLHER_AFRMM'
    end
    object qry_lista_processos_VL_ICMS_A_RECOLHER: TFloatField
      FieldName = 'VL_ICMS_A_RECOLHER'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_lista_processos_UF_CLIENTE: TStringField
      FieldName = 'UF_CLIENTE'
      FixedChar = True
      Size = 2
    end
    object qry_lista_processos_UF_DESPACHO: TStringField
      FieldName = 'UF_DESPACHO'
      FixedChar = True
      Size = 2
    end
  end
  object ds_lista_processos: TDataSource
    DataSet = qry_lista_processos_
    Left = 48
    Top = 87
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT AP_UNID_NEG'
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 160
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
  end
  object qry_icms_bloqueado_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, IN_BLOQUEADO'
      'FROM TFOLLOWUP'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'CD_EVENTO = ( SELECT CD_EV_PAG_ICMS FROM TPARAMETROS )')
    Left = 256
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_icms_bloqueado_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_icms_bloqueado_IN_BLOQUEADO: TStringField
      FieldName = 'IN_BLOQUEADO'
      Size = 1
    end
  end
  object sp_atz_evento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_evento'
    Left = 392
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 1
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_evento_txt'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_realizacao'
        ParamType = ptInput
      end>
  end
  object qry_di_imp_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS,'
      '       IN_ICMS_IMPRESSO, DT_ICMS_IMPRESSO,'
      '       IN_EXON_IMPRESSO, DT_EXON_IMPRESSO'
      'FROM TDECLARACAO_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO       ')
    Left = 256
    Top = 87
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_imp_NR_PROCESSO: TStringField
      DisplayWidth = 18
      FieldName = 'NR_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_di_imp_IN_ICMS_IMPRESSO: TStringField
      FieldName = 'IN_ICMS_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_ICMS_IMPRESSO'
      Size = 1
    end
    object qry_di_imp_DT_ICMS_IMPRESSO: TDateTimeField
      FieldName = 'DT_ICMS_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_ICMS_IMPRESSO'
    end
    object qry_di_imp_IN_EXON_IMPRESSO: TStringField
      FieldName = 'IN_EXON_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_EXON_IMPRESSO'
      Size = 1
    end
    object qry_di_imp_DT_EXON_IMPRESSO: TDateTimeField
      FieldName = 'DT_EXON_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_EXON_IMPRESSO'
    end
    object qry_di_imp_IN_EMBUT_FRT_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_FRT_ITENS'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_imp_IN_EMBUT_SEG_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_SEG_ITENS'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_EMBUT_FRT_ITENS'
    end
  end
  object qry_despachante_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_DESPACHANTE, AP_DESPACHANTE, NM_DESPACHANTE, CPF_DESPA' +
        'CHANTE'
      'FROM   TDESPACHANTE'
      'WHERE  CD_DESPACHANTE = :CD_DESPACHANTE')
    Left = 392
    Top = 93
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_DESPACHANTE'
        ParamType = ptUnknown
      end>
    object qry_despachante_AP_DESPACHANTE: TStringField
      FieldName = 'AP_DESPACHANTE'
      Origin = 'TDESPACHANTE.AP_DESPACHANTE'
      Size = 10
    end
    object qry_despachante_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 3
    end
    object qry_despachante_NM_DESPACHANTE: TStringField
      FieldName = 'NM_DESPACHANTE'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 50
    end
    object qry_despachante_CPF_DESPACHANTE: TStringField
      FieldName = 'CPF_DESPACHANTE'
      Origin = 'TDESPACHANTE.AP_DESPACHANTE'
      Size = 11
    end
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, CD_CELULA'
      'FROM   TUSUARIO U'
      'WHERE  CD_USUARIO = :CD_USUARIO'
      '')
    Left = 483
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qry_processos_cat63_exoneracao_: TQuery
    OnCalcFields = qry_processos_cat63_exoneracao_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT D.NR_PROCESSO, D.IN_ICMS_IMPRESSO, D.IN_EXON_IMPRESSO, E.' +
        'END_UF, D.CD_IMPORTADOR, E.AP_EMPRESA,'
      '       (SELECT SUM(VL_BASE_CALC_ICMS)'
      '        FROM TADICAO_DE_IMPORTACAO AD'
      
        '        WHERE AD.NR_PROCESSO = D.NR_PROCESSO) AS VL_BASE_CALC_IC' +
        'MS,'
      '       (SELECT SUM(VL_ICMS_A_RECOLHER)'
      '        FROM TADICAO_DE_IMPORTACAO AD'
      '        WHERE AD.NR_PROCESSO = D.NR_PROCESSO) AS VALOR_ICMS,'
      '       SI.IN_EXONERACAO, SI.IN_ICMS_EMITIDO'
      'FROM TDECLARACAO_IMPORTACAO D'
      '  INNER JOIN TPROCESSO P ON (P.NR_PROCESSO = D.NR_PROCESSO)'
      
        '  INNER JOIN TPROCESSO_STATUS_ICMS SI ON (SI.NR_PROCESSO = P.NR_' +
        'PROCESSO)'
      '  INNER JOIN TEMPRESA_NAC E ON (E.CD_EMPRESA = D.CD_IMPORTADOR)'
      '  LEFT JOIN TARMAZEM A ON (A.CD_ARMAZEM = P.CD_ARMAZEM_DESCARGA)'
      'WHERE P.IN_CANCELADO = '#39'0'#39' AND'
      '      P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '      D.DT_REGISTRO_DI = :DT_BASE')
    Left = 88
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_BASE'
        ParamType = ptInput
      end>
    object qry_processos_cat63_exoneracao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_processos_cat63_exoneracao_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_processos_cat63_exoneracao_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_processos_cat63_exoneracao_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
    object qry_processos_cat63_exoneracao_VL_BASE_CALC_ICMS: TFloatField
      FieldName = 'VL_BASE_CALC_ICMS'
    end
    object qry_processos_cat63_exoneracao_IN_ICMS_IMPRESSO: TStringField
      FieldName = 'IN_ICMS_IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object qry_processos_cat63_exoneracao_IN_EXON_IMPRESSO: TStringField
      FieldName = 'IN_EXON_IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object qry_processos_cat63_exoneracao_calc_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_status'
      Size = 1
      Calculated = True
    end
    object qry_processos_cat63_exoneracao_VALOR_ICMS: TFloatField
      FieldName = 'VALOR_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_processos_cat63_exoneracao_IN_EXONERACAO: TStringField
      FieldName = 'IN_EXONERACAO'
      FixedChar = True
      Size = 1
    end
    object qry_processos_cat63_exoneracao_IN_ICMS_EMITIDO: TStringField
      FieldName = 'IN_ICMS_EMITIDO'
      FixedChar = True
      Size = 1
    end
  end
  object qry_processos_cat63_icms_: TQuery
    OnCalcFields = qry_processos_cat63_icms_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT D.NR_PROCESSO, D.IN_ICMS_IMPRESSO, D.IN_EXON_IMPRESSO, E.' +
        'END_UF, D.CD_IMPORTADOR, E.AP_EMPRESA,'
      '       (SELECT SUM(VL_BASE_CALC_ICMS)'
      '        FROM TADICAO_DE_IMPORTACAO AD'
      
        '        WHERE AD.NR_PROCESSO = D.NR_PROCESSO) AS VL_BASE_CALC_IC' +
        'MS,'
      '       (SELECT SUM(VL_ICMS_CALCULADO - VL_ICMS_A_RECOLHER)'
      '        FROM TADICAO_DE_IMPORTACAO AD'
      '        WHERE AD.NR_PROCESSO = D.NR_PROCESSO) AS VALOR_ICMS,'
      '       SI.IN_EXONERACAO, SI.IN_ICMS_EMITIDO'
      'FROM TDECLARACAO_IMPORTACAO D'
      '  INNER JOIN TPROCESSO P ON (P.NR_PROCESSO = D.NR_PROCESSO)'
      
        '  INNER JOIN TPROCESSO_STATUS_ICMS SI ON (SI.NR_PROCESSO = P.NR_' +
        'PROCESSO) AND (SI.IN_EXONERACAO = '#39'2'#39')'
      '  INNER JOIN TEMPRESA_NAC E ON (E.CD_EMPRESA = D.CD_IMPORTADOR)'
      '  LEFT JOIN TARMAZEM A ON (A.CD_ARMAZEM = P.CD_ARMAZEM_DESCARGA)'
      'WHERE P.IN_CANCELADO = '#39'0'#39' AND'
      '      P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '      D.DT_REGISTRO_DI = :DT_BASE')
    Left = 80
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_BASE'
        ParamType = ptInput
      end>
    object qry_processos_cat63_icms_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_processos_cat63_icms_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_processos_cat63_icms_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_processos_cat63_icms_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
    object qry_processos_cat63_icms_VL_BASE_CALC_ICMS: TFloatField
      FieldName = 'VL_BASE_CALC_ICMS'
    end
    object qry_processos_cat63_icms_IN_ICMS_IMPRESSO: TStringField
      FieldName = 'IN_ICMS_IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object qry_processos_cat63_icms_IN_EXON_IMPRESSO: TStringField
      FieldName = 'IN_EXON_IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object qry_processos_cat63_icms_calc_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_status'
      Size = 1
      Calculated = True
    end
    object qry_processos_cat63_icms_VALOR_ICMS: TFloatField
      FieldName = 'VALOR_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_processos_cat63_icms_IN_EXONERACAO: TStringField
      FieldName = 'IN_EXONERACAO'
      FixedChar = True
      Size = 1
    end
    object qry_processos_cat63_icms_IN_ICMS_EMITIDO: TStringField
      FieldName = 'IN_ICMS_EMITIDO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_processos_cat63_exoneracao: TDataSource
    DataSet = qry_processos_cat63_exoneracao_
    Left = 264
    Top = 184
  end
  object ds_processos_cat63_icms: TDataSource
    DataSet = qry_processos_cat63_icms_
    Left = 264
    Top = 256
  end
  object qry_Consulta_DI_ICMS: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DECLARE'
      '@TIPO_ICMS_INDEX INTEGER = :TIPO_ICMS_INDEX,'
      '@ICMS_TRIBUTACAO INTEGER = :ICMS_TRIBUTACAO,'
      '@NR_PROCESSO VARCHAR(16) =  :NR_PROCESSO'
      ''
      'SELECT '
      'NM_EMPRESA,  '
      'CGC_EMPRESA,'
      'IE_EMPRESA,'
      'IN_IE,'
      'ENDERECO,'
      'END_BAIRRO,'
      'END_CIDADE,'
      'IBGE_CIDADE,'
      'COD_TOM_CIDADE_PR,'
      'END_UF,'
      'END_CEP,'
      'NR_TELEFONE,'
      'NR_DECLARACAO_IMP,'
      'DT_REGISTRO_DI,'
      'PC_ICMS,'
      'REF_CLIENTE, '
      
        'CONVERT(NUMERIC(10,2),(SUM(VL_FISCAL)))                AS VL_FIS' +
        'CAL,'
      
        'CONVERT(NUMERIC(10,2),SUM(VL_ICMS_AFRMM))              AS VL_ICM' +
        'S_AFRMM,'
      
        'CONVERT(NUMERIC(10,2),MAX(PC_ICMS))                    AS PC_ICM' +
        'S,'
      'CONVERT(NUMERIC(10,2),SUM(II))  '#9'                   AS II,'
      'CONVERT(NUMERIC(10,2),SUM(IPI)) '#9'                   AS IPI,'
      'CONVERT(NUMERIC(10,2),SUM(ISNULL(AD, 0)))  '#9'           AS AD,'
      'CONVERT(NUMERIC(10,2),SUM(MCV))   '#9'                   AS MCV,'
      
        'CONVERT(NUMERIC(10,2),SUM(VL_FRETE))                   AS VL_FRE' +
        'TE,'
      
        'CONVERT(NUMERIC(10,2),SUM(VL_SEGURO))                  AS VL_SEG' +
        'URO,'
      'CONVERT(NUMERIC(10,2),SUM(PIS))                        AS PIS, '
      
        'CONVERT(NUMERIC(10,2),SUM(COFINS))                     AS COFINS' +
        ','
      
        'CONVERT(NUMERIC(10,2),SUM(TX_SISCOMEX))                AS TX_SIS' +
        'COMEX,'
      
        'CONVERT(NUMERIC(10,2),SUM(VL_BASE_CALC_ICMS))          AS VL_BAS' +
        'E_CALC_ICMS,'
      
        '/*CONVERT(NUMERIC(10,2),SUM(VL_AFRMM_ITEM))              AS VL_A' +
        'FRMM_ITEM,*/'
      
        'CONVERT(NUMERIC(10,2),SUM(VL_AFRMM))                   AS VL_AFR' +
        'MM_ITEM,'
      
        'CONVERT(NUMERIC(10,2),SUM(VL_FECP))                    AS VL_FEC' +
        'P'
      'FROM ('
      #9#9'SELECT '
      #9#9'/*DISTINCT*/'
      #9#9'EN.NM_EMPRESA,  '
      #9#9'EN.CGC_EMPRESA,'
      #9#9'CASE EN.IE_EMPRESA'
      #9#9' WHEN '#39'ISENTO'#39' THEN '#39#39
      #9#9' ELSE EN.IE_EMPRESA'
      #9#9'END IE_EMPRESA,  '
      #9#9'ISNUMERIC(EN.IE_EMPRESA) IN_IE,'
      #9#9'(EN.END_EMPRESA + '#39', '#39' + EN.END_NUMERO) AS ENDERECO,'
      #9#9'EN.END_BAIRRO,'
      #9#9'EN.END_CIDADE,'
      #9#9'Right(LO.COD_IBGE, 5) IBGE_CIDADE,'
      #9#9'LO.COD_TOM COD_TOM_CIDADE_PR,'
      #9#9'EN.END_UF,'
      #9#9'EN.END_CEP,'
      
        #9#9'Right(Replace(Replace(Replace(U.NR_FONE,'#39'-'#39','#39#39'),'#39')'#39','#39#39'),'#39' '#39','#39#39 +
        '), 10) AS NR_TELEFONE,'
      #9#9'DI.NR_DECLARACAO_IMP,'
      #9#9'DI.DT_REGISTRO_DI,'
      
        #9#9'DBO.FN_CONCATENA_REFRENCIA(AD.NR_PROCESSO) REF_CLIENTE,       ' +
        '       '
      #9#9'(AD.VL_MERC_LOC_EMB_MN + '
      #9#9' AD.VL_ACRESCIMOS_MN - '
      #9#9' AD.VL_DEDUCOES_MN + '
      
        #9#9' (CASE WHEN ISNULL(DI.IN_EMBUT_FRT_ITENS,0) = 0 THEN AD.VL_FRE' +
        'TE_MERC_MN ELSE 0 END) + /*Se embutir frete, soma frete, sen'#227'o, ' +
        'soma 0*/'
      
        #9#9' (CASE WHEN ISNULL(DI.IN_EMBUT_SEG_ITENS,0) = 0 THEN AD.VL_SEG' +
        '_MERC_MN ELSE 0 END) /*Se embutir seguro, soma seguro, sen'#227'o, so' +
        'ma 0*/                          '
      
        #9#9')                                                      AS VL_F' +
        'ISCAL,'
      #9#9'(CASE WHEN @TIPO_ICMS_INDEX <> 3 THEN '
      #9#9#9'AD.VL_ICMS_A_RECOLHER_AFRMM'
      #9#9' ELSE'
      #9#9#9'AD.VL_ICMS_DEVIDO_AFRMM'
      
        #9#9' END)                                                  AS VL_I' +
        'CMS_AFRMM,'
      
        #9#9'AD.PC_ICMS                                             AS PC_I' +
        'CMS,'
      #9#9'II.VL_IPT_A_RECOLHER  '#9'   '#9#9#9#9#9#9#9'   AS II,'
      #9#9'IPI.VL_IPT_A_RECOLHER '#9'   '#9#9#9#9#9#9#9'   AS IPI,'
      #9#9'ISNULL(DU.VL_IPT_A_RECOLHER, 0)  '#9'                   AS AD,'
      #9#9'AD.VL_MERC_VENDA_MN   '#9'   '#9#9#9#9#9#9#9'   AS MCV,'
      #9#9'AD.VL_FRETE_MERC_MN        '#9#9#9#9#9#9#9'   AS VL_FRETE,'
      #9#9'AD.VL_SEG_MERC_MN          '#9#9#9#9#9#9#9'   AS VL_SEGURO,'
      #9#9'AD.VL_PIS                  '#9#9#9#9#9#9#9'   AS PIS, '
      #9#9'AD.VL_COFINS               '#9#9#9#9#9#9#9'   AS COFINS,'
      #9#9'AD.VL_TX_SCX_AD            '#9#9#9#9#9#9#9'   AS TX_SISCOMEX,'
      #9#9'AD.VL_BASE_CALC_ICMS_AFRMM '#9#9#9#9#9#9#9'   AS VL_BASE_CALC_ICMS,'
      #9'/*'#9'DM.VL_AFRMM_ITEM           '#9#9#9#9#9#9#9'   AS VL_AFRMM_ITEM,'#9'*/'
      #9#9'AD.VL_AFRMM             '#9#9#9#9#9#9#9'   AS VL_AFRMM,'#9
      #9#9'(CASE WHEN @TIPO_ICMS_INDEX <> 3 '
      #9#9' THEN '
      #9#9#9'(CASE ISNULL(AD.IN_FUNDO_POBREZA, 0)'
      '             WHEN 1 '
      '             THEN ((AD.VL_ICMS_A_RECOLHER_AFRMM / AD.PC_ICMS) '
      '             * (SELECT PC_FUNDO_POBREZA_RJ FROM TPARAMETROS))'
      '             ELSE 0'
      '             END)'
      #9#9' ELSE 0            '
      
        #9#9' END)                                                  AS VL_F' +
        'ECP'#9
      #9#9'FROM   TADICAO_DE_IMPORTACAO AD'#9
      
        #9#9'INNER JOIN TDECLARACAO_IMPORTACAO DI ON DI.NR_PROCESSO = AD.NR' +
        '_PROCESSO'
      
        #9#9'LEFT JOIN TRIBUTO II  ON (II.NR_PROCESSO        = AD.NR_PROCES' +
        'SO AND'
      #9#9#9#9#9#9#9#9'  II.NR_ADICAO          = AD.NR_ADICAO AND'
      #9#9#9#9#9#9#9#9'  II.CD_RECEITA_IMPOSTO = '#39'0001'#39')'
      
        #9#9'LEFT JOIN TRIBUTO IPI ON (IPI.NR_PROCESSO '#9#9' = AD.NR_PROCESSO ' +
        'AND'
      #9#9#9#9#9#9#9#9'  IPI.NR_ADICAO   '#9#9' = AD.NR_ADICAO AND'
      #9#9#9#9#9#9#9#9'  IPI.CD_RECEITA_IMPOSTO = '#39'0002'#39')'
      
        #9#9'LEFT JOIN TRIBUTO DU  ON (DU.NR_PROCESSO  '#9#9'= AD.NR_PROCESSO A' +
        'ND'
      #9#9#9#9#9#9#9#9'  DU.NR_ADICAO    '#9#9'= AD.NR_ADICAO AND'
      #9#9#9#9#9#9#9#9'  DU.CD_RECEITA_IMPOSTO = '#39'0003'#39')'
      #9#9'LEFT JOIN TTP_EXONERACAO E ON E.CD_EX = AD.CD_FUND_LEGAL_ICMS'
      
        #9#9'--LEFT JOIN TDETALHE_MERCADORIA DM ON DM.NR_PROCESSO = DI.NR_P' +
        'ROCESSO'
      #9#9'INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = DI.CD_IMPORTADOR'
      
        #9#9'INNER JOIN TUNID_NEG U ON U.CD_UNID_NEG = SUBSTRING(DI.NR_PROC' +
        'ESSO, 1, 2)'
      #9#9'INNER JOIN ESTADO UF ON UF.SIGLA = EN.END_UF'
      
        #9#9'INNER JOIN LOCALIDADE LO ON LO.ID_ESTADO = UF.ID AND LO.NOME =' +
        ' EN.END_CIDADE'
      #9#9'WHERE (AD.NR_PROCESSO = @NR_PROCESSO)'
      #9#9'/* AND '
      #9#9#9'  ('
      #9#9#9#9'   ('
      #9#9#9#9#9#9'(@ICMS_TRIBUTACAO IN ('#39'1'#39','#39'2'#39','#39'4'#39')) AND '
      #9#9#9#9#9#9'(AD.CD_TRIBUTACAO_ICMS IN ('#39'1'#39','#39'4'#39')) AND '
      #9#9#9#9#9#9'('
      #9#9#9#9#9#9' (AD.CD_FUND_LEGAL_ICMS IS NULL) OR '
      #9#9#9#9#9#9' (AD.CD_FUND_LEGAL_ICMS = '#39#39'))'
      #9#9#9#9'   ) '
      #9#9#9#9'   OR '
      #9#9#9#9'   ('
      #9#9#9#9#9#9'(@ICMS_TRIBUTACAO = '#39'3'#39') AND '
      #9#9#9#9#9#9'('
      #9#9#9#9#9#9' (AD.CD_FUND_LEGAL_ICMS IS NOT NULL) AND '
      #9#9#9#9#9#9' (AD.CD_FUND_LEGAL_ICMS <> '#39#39' ))'
      #9#9#9#9'   )'
      #9#9#9'  )*/'
      ') SelectPrincipal'
      'GROUP BY '
      'NM_EMPRESA,  '
      'CGC_EMPRESA,'
      'IE_EMPRESA,'
      'IN_IE,'
      'ENDERECO,'
      'END_BAIRRO,'
      'END_CIDADE,'
      'IBGE_CIDADE,'
      'COD_TOM_CIDADE_PR,'
      'END_UF,'
      'END_CEP,'
      'NR_TELEFONE,'
      'NR_DECLARACAO_IMP,'
      'DT_REGISTRO_DI,'
      'PC_ICMS,'
      'REF_CLIENTE')
    Left = 412
    Top = 188
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPO_ICMS_INDEX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ICMS_TRIBUTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        NumericScale = 18
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_uf_icms_online: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM CAD_UF_ICMS_ONLINE')
    Left = 412
    Top = 252
  end
end
