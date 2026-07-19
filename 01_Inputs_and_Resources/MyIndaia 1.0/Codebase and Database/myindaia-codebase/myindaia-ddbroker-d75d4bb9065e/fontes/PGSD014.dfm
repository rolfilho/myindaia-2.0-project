object datm_sda_emissao: Tdatm_sda_emissao
  OldCreateOrder = True
  Left = 689
  Top = 418
  Height = 432
  Width = 782
  object ds_processo_sda: TDataSource
    DataSet = cds_Processo_sda_
    Left = 654
    Top = 300
  end
  object qry_processo_sda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT S.NR_PROCESSO, SUBSTRING( S.NR_PROCESSO, 5, 14 ) AS CALCP' +
        'ROCESSO, S.IN_EMITE, E.AP_EMPRESA, SE.NM_SERVICO,'
      
        '       S.VL_BASE_CALCULO, S.VL_SDA, S.VL_CONTR_ASSIST, S.VL_COMP' +
        'L, (S.VL_SDA + S.VL_CONTR_ASSIST) AS SOMA, LE.DESCRICAO LOCAL, C' +
        'D_USUARIO_EMITE, IN_EMITINDO,'
      
        '       CONVERT( VARCHAR(15), S.DT_DISTRIBUICAO, 103 ) AS DT_DIST' +
        'RIBUICAO'
      'FROM   TPROCESSO_SDA S (NOLOCK)'
      
        '  INNER JOIN TPROCESSO P (NOLOCK) ON S.NR_PROCESSO = P.NR_PROCES' +
        'SO'
      
        '  INNER JOIN TEMPRESA_NAC E (NOLOCK) ON P.CD_CLIENTE = E.CD_EMPR' +
        'ESA'
      
        '  INNER JOIN VW_SERVICO_GERAL SE (NOLOCK) ON P.CD_SERVICO = SE.C' +
        'D_SERVICO'
      
        '  LEFT JOIN TLOCAL_EMBARQUE LE (NOLOCK) ON LE.CODIGO = CASE WHEN' +
        ' SUBSTRING(P.NR_PROCESSO, 3,2) = '#39'02'#39' THEN P.CD_LOCAL_EMBARQUE E' +
        'LSE P.CD_LOCAL_DESEMBARQUE END'
      'WHERE P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '      P.CD_PRODUTO = :CD_PRODUTO AND'
      '      :CD_CELULA IN (P.CD_CELULA, '#39#39') AND'
      '      S.CD_DESPACHANTE = :CD_DESPACHANTE AND'
      
        '      (S.DT_DISTRIBUICAO BETWEEN CAST(:DT_INICIAL_DISTRIBUICAO A' +
        'S date) AND CAST(:DT_FINAL_DISTRIBUICAO AS date)) AND'
      '      P.IN_CANCELADO = '#39'0'#39' AND'
      '      P.IN_LIBERADO = '#39'1'#39' AND'
      '      S.CD_STATUS = '#39'1'#39
      'ORDER BY S.DT_DISTRIBUICAO, E.AP_EMPRESA, S.NR_PROCESSO')
    Left = 660
    Top = 117
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_DESPACHANTE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_INICIAL_DISTRIBUICAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FINAL_DISTRIBUICAO'
        ParamType = ptInput
      end>
    object qry_processo_sda_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_sda_IN_EMITE: TStringField
      FieldName = 'IN_EMITE'
      Size = 1
    end
    object qry_processo_sda_AP_EMPRESA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_processo_sda_NM_SERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_processo_sda_VL_BASE_CALCULO: TFloatField
      DisplayLabel = 'Base de C'#225'lculo'
      FieldName = 'VL_BASE_CALCULO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_processo_sda_VL_SDA: TFloatField
      DisplayLabel = 'Valor S.D.A.'
      FieldName = 'VL_SDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_processo_sda_VL_CONTR_ASSIST: TFloatField
      FieldName = 'VL_CONTR_ASSIST'
    end
    object qry_processo_sda_VL_COMPL: TFloatField
      FieldName = 'VL_COMPL'
    end
    object qry_processo_sda_CalcProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldName = 'CalcProcesso'
      Size = 14
    end
    object qry_processo_sda_SOMA: TFloatField
      FieldName = 'SOMA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_processo_sda_LOCAL: TStringField
      FieldName = 'LOCAL'
      FixedChar = True
      Size = 50
    end
    object qry_processo_sda_CD_USUARIO_EMITE: TStringField
      FieldName = 'CD_USUARIO_EMITE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_sda_IN_EMITINDO: TStringField
      FieldName = 'IN_EMITINDO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_sda_DT_DISTRIBUICAO: TStringField
      DisplayLabel = 'Dt. Distribui'#231#227'o'
      FieldName = 'DT_DISTRIBUICAO'
      FixedChar = True
      Size = 15
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM   TUNID_NEG (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG'
      '')
    Left = 33
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM   TPRODUTO (NOLOCK)'
      'WHERE  CD_PRODUTO = :CD_PRODUTO')
    Left = 128
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
  end
  object qry_celula_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CELULA, NM_CELULA'
      'FROM   TCELULA (NOLOCK)'
      'WHERE  CD_CELULA = :CD_CELULA')
    Left = 224
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptInput
      end>
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, CD_CELULA'
      'FROM   TUSUARIO U (NOLOCK)'
      'WHERE  CD_USUARIO = :CD_USUARIO'
      '')
    Left = 322
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
  end
  object qry_atz_todos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TPROCESSO_SDA'
      'SET    IN_EMITE = :IN_EMITE,'
      '       CD_USUARIO_EMITE = :CD_USUARIO_EMITE'
      'WHERE  NR_PROCESSO IN ( SELECT S.NR_PROCESSO'
      
        '                        FROM   TPROCESSO_SDA S (NOLOCK), TPROCES' +
        'SO P (NOLOCK), TEMPRESA_NAC E (NOLOCK), VW_SERVICO_GERAL SE (NOL' +
        'OCK)'
      '                        WHERE  S.NR_PROCESSO = P.NR_PROCESSO AND'
      '                               P.CD_CLIENTE = E.CD_EMPRESA AND'
      '                               P.CD_SERVICO = SE.CD_SERVICO AND'
      '                               P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '                               P.CD_PRODUTO = :CD_PRODUTO AND'
      '                               P.CD_CELULA = :CD_CELULA AND'
      
        '                               S.CD_DESPACHANTE = :CD_DESPACHANT' +
        'E AND'
      
        '                               S.DT_DISTRIBUICAO = :DT_DISTRIBUI' +
        'CAO AND'
      '                               P.IN_CANCELADO = '#39'0'#39' AND'
      '                               P.IN_LIBERADO = '#39'1'#39' AND'
      '                               S.CD_STATUS = '#39'1'#39' )'
      '')
    Left = 323
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_EMITE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO_EMITE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_DESPACHANTE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_DISTRIBUICAO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object StringField2: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.DT_ABERTURA'
      Size = 3
    end
    object StringField3: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 5
    end
    object StringField4: TStringField
      DisplayLabel = 'Processo'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'Calc_nr_processo'
      Size = 14
      Calculated = True
    end
    object StringField5: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 2
    end
    object StringField7: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'NM_SERVICO'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 50
    end
    object StringField8: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 1
    end
    object StringField9: TStringField
      DisplayLabel = ' '
      FieldKind = fkCalculated
      FieldName = 'CalcSelecao'
      Size = 1
      Calculated = True
    end
    object StringField10: TStringField
      FieldName = 'IN_DISTR'
      Origin = 'TPROCESSO_SDA.NR_PROCESSO'
      Size = 1
    end
    object StringField11: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'AP_EMPRESA'
      Origin = 'TPROCESSO_SDA.NR_PROCESSO'
      Size = 10
    end
  end
  object qry_desp_: TQuery
    AfterScroll = qry_desp_AfterScroll
    OnCalcFields = qry_desp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DISTINCT S.CD_DESPACHANTE, D.NM_DESPACHANTE, D.NR_REGISTR' +
        'O, D.CD_MOD_SDA, D.CD_DESP_SDA,'
      '       SUBSTRING( CPF_DESPACHANTE, 1, 3 ) + '#39'.'#39' +'
      '       SUBSTRING( CPF_DESPACHANTE, 4, 3 ) + '#39'.'#39' +'
      '       SUBSTRING( CPF_DESPACHANTE, 7, 3 ) + '#39'-'#39' +'
      '       SUBSTRING( CPF_DESPACHANTE, 10, 2 ) AS CPF_DESPACHANTE,'
      '       ISNULL( D.NR_CONTA_CORRENTE, '#39#39') AS NR_CONTA_CORRENTE, '
      
        '       ISNULL( D.NR_DIGITO_CONTA_CORRENTE, '#39#39' ) AS NR_DIGITO_CON' +
        'TA_CORRENTE'
      
        'FROM   TPROCESSO_SDA S (NOLOCK), TPROCESSO P (NOLOCK), TDESPACHA' +
        'NTE D'
      'WHERE  S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       S.CD_DESPACHANTE = D.CD_DESPACHANTE AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       P.CD_PRODUTO = :CD_PRODUTO AND'
      '       :CD_CELULA IN (P.CD_CELULA, '#39#39') AND'
      '       P.IN_CANCELADO = '#39'0'#39' AND'
      '       P.IN_LIBERADO = '#39'1'#39' AND'
      '       ISNULL( S.CD_DESPACHANTE, '#39#39' ) <> '#39#39' AND'
      
        '       (S.DT_DISTRIBUICAO BETWEEN CAST(:DT_INICIAL_DISTRIBUICAO ' +
        'AS date) AND CAST(:DT_FINAL_DISTRIBUICAO AS date)) AND       '
      '       S.CD_STATUS = '#39'1'#39
      'ORDER BY D.NM_DESPACHANTE'
      '')
    Left = 37
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_INICIAL_DISTRIBUICAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FINAL_DISTRIBUICAO'
        ParamType = ptInput
      end>
    object qry_desp_CD_DESPACHANTE: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TPROCESSO_SDA.CD_DESPACHANTE'
      Size = 3
    end
    object qry_desp_NM_DESPACHANTE: TStringField
      DisplayLabel = 'Despachante'
      FieldName = 'NM_DESPACHANTE'
      Size = 50
    end
    object qry_desp_NR_REGISTRO: TStringField
      FieldName = 'NR_REGISTRO'
      Size = 9
    end
    object qry_desp_CPF_DESPACHANTE: TStringField
      FieldName = 'CPF_DESPACHANTE'
      Size = 14
    end
    object qry_desp_CD_MOD_SDA: TStringField
      FieldName = 'CD_MOD_SDA'
      Size = 2
    end
    object qry_desp_NR_CONTA_CORRENTE: TStringField
      FieldName = 'NR_CONTA_CORRENTE'
      Size = 10
    end
    object qry_desp_NR_DIGITO_CONTA_CORRENTE: TStringField
      FieldName = 'NR_DIGITO_CONTA_CORRENTE'
      Size = 1
    end
    object qry_desp_CalcNrContaCorrente: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrContaCorrente'
      Calculated = True
    end
    object qry_desp_CD_DESP_SDA: TStringField
      FieldName = 'CD_DESP_SDA'
      Size = 12
    end
  end
  object ds_desp: TDataSource
    DataSet = qry_desp_
    Left = 37
    Top = 196
  end
  object qry_mod_sda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOD_SDA, NM_MOD_SDA'
      'FROM TTP_MOD_SDA (NOLOCK)')
    Left = 131
    Top = 136
    object qry_mod_sda_CD_MOD_SDA: TStringField
      FieldName = 'CD_MOD_SDA'
      Origin = 'TTP_MOD_SDA.CD_MOD_SDA'
      Size = 2
    end
    object qry_mod_sda_NM_MOD_SDA: TStringField
      FieldName = 'NM_MOD_SDA'
      Origin = 'TTP_MOD_SDA.NM_MOD_SDA'
    end
  end
  object ds_mod_sda: TDataSource
    DataSet = qry_mod_sda_
    Left = 131
    Top = 196
  end
  object qry_ajuste_impressao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TAJUSTE_IMPRESSAO_SDA (NOLOCK)'
      'WHERE CD_DOCUMENTO = :CD_DOCUMENTO AND'
      'CD_UNID_NEG = :CD_UNID_NEG')
    Left = 226
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_DOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
    object qry_ajuste_impressao_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_DOCUMENTO: TStringField
      FieldName = 'L_NR_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_DOCUMENTO: TStringField
      FieldName = 'C_NR_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_OPERACAO: TStringField
      FieldName = 'C_NR_OPERACAO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_OPERACAO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NM_IMP_EXP: TStringField
      FieldName = 'L_NM_IMP_EXP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NM_IMP_EXP'
      Size = 3
    end
    object qry_ajuste_impressao_C_NM_IMP_EXP: TStringField
      FieldName = 'C_NM_IMP_EXP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NM_IMP_EXP'
      Size = 3
    end
    object qry_ajuste_impressao_L_NM_DESP: TStringField
      FieldName = 'L_NM_DESP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NM_DESP'
      Size = 3
    end
    object qry_ajuste_impressao_C_NM_DESP: TStringField
      FieldName = 'C_NM_DESP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NM_DESP'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_CPF: TStringField
      FieldName = 'C_NR_CPF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_CPF'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_SDA: TStringField
      FieldName = 'L_VL_SDA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_VL_SDA'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_SDA: TStringField
      FieldName = 'C_VL_SDA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_VL_SDA'
      Size = 3
    end
    object qry_ajuste_impressao_C_DT_EMISSAO: TStringField
      FieldName = 'C_DT_EMISSAO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_DT_EMISSAO'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_TAXA: TStringField
      FieldName = 'L_VL_TAXA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_VL_TAXA'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_TAXA: TStringField
      FieldName = 'C_VL_TAXA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_VL_TAXA'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_TOTAL: TStringField
      FieldName = 'L_VL_TOTAL'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_VL_TOTAL'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_TOTAL: TStringField
      FieldName = 'C_VL_TOTAL'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_VL_TOTAL'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_PROCESSO: TStringField
      FieldName = 'L_NR_PROCESSO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_PROCESSO: TStringField
      FieldName = 'C_NR_PROCESSO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_CONHECIMENTO: TStringField
      FieldName = 'L_NR_CONHECIMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_CONHECIMENTO: TStringField
      FieldName = 'C_NR_CONHECIMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_OPERACAO'
      Size = 3
    end
    object qry_ajuste_impressao_L_URF_DESPACHO: TStringField
      FieldName = 'L_URF_DESPACHO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NM_IMP_EXP'
      Size = 3
    end
    object qry_ajuste_impressao_C_URF_DESPACHO: TStringField
      FieldName = 'C_URF_DESPACHO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NM_IMP_EXP'
      Size = 3
    end
    object qry_ajuste_impressao_C_OPER_IMP: TStringField
      FieldName = 'C_OPER_IMP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_OPER_EXP: TStringField
      FieldName = 'C_OPER_EXP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_OPERACAO'
      Size = 3
    end
    object qry_ajuste_impressao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 2
    end
    object qry_ajuste_impressao_L_OPER_IMP: TStringField
      FieldName = 'L_OPER_IMP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_OPER_EXP: TStringField
      FieldName = 'L_OPER_EXP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_CPF: TStringField
      FieldName = 'L_NR_CPF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_OPERACAO'
      Size = 3
    end
    object qry_ajuste_impressao_L_VEIC: TStringField
      FieldName = 'L_VEIC'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_DT_ENT: TStringField
      FieldName = 'L_DT_ENT'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_REF: TStringField
      FieldName = 'L_REF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_MASTER: TStringField
      FieldName = 'L_MASTER'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_OPERACAO'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_CIF: TStringField
      FieldName = 'L_VL_CIF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NM_IMP_EXP'
      Size = 3
    end
    object qry_ajuste_impressao_C_REF: TStringField
      FieldName = 'C_REF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_TP_DOCUMENTO: TStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 1
    end
    object qry_ajuste_impressao_C_NM_COMPL_SDA: TStringField
      FieldName = 'C_NM_COMPL_SDA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_CIF: TStringField
      FieldName = 'C_VL_CIF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_CNPJ: TStringField
      FieldName = 'C_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_OBS: TStringField
      FieldName = 'L_OBS'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_OBS: TStringField
      FieldName = 'C_OBS'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NM_COMPL_SDA: TStringField
      FieldName = 'L_NM_COMPL_SDA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_NR_LINHA_GUIA: TStringField
      FieldName = 'NR_LINHA_GUIA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_CNPJ: TStringField
      FieldName = 'L_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_DT_EMISSAO: TStringField
      FieldName = 'L_DT_EMISSAO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_CONTA_CORRENTE: TStringField
      FieldName = 'L_NR_CONTA_CORRENTE'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_CONTA_CORRENTE: TStringField
      FieldName = 'C_NR_CONTA_CORRENTE'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_CD_DESP_SDA: TStringField
      FieldName = 'C_CD_DESP_SDA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
  end
  object qry_consiste_sda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ROUND( SUM( CASE IN_RESTITUI'
      '                     WHEN '#39'0'#39' THEN ISNULL( VL_ITEM, 0 )'
      '                     WHEN '#39'1'#39' THEN ISNULL( VL_ITEM, 0 ) * (-1)'
      '                   END ), 2 ) VL_SDA'
      'FROM   TFATURAMENTO_CC (NOLOCK)'
      
        'WHERE  CD_ITEM IN ( SELECT CD_ITEM_SDA FROM TPARAMETROS (NOLOCK)' +
        ' ) AND'
      '       IN_CANCELADO = '#39'0'#39' AND'
      '       NR_PROCESSO = :NR_PROCESSO'
      'GROUP BY NR_PROCESSO')
    Left = 226
    Top = 196
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object qry_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_REFERENCIA'
      'FROM TREF_CLIENTE (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 38
    Top = 261
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_ref_cli_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
  end
  object qry_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.NR_PROCESSO, '
      '       B.CD_IMPORTADOR, '
      
        '       ISNULL(B.NR_DECLARACAO_IMP, A.NR_DI) AS NR_DECLARACAO_IMP' +
        ' , '
      '       DT_REGISTRO_DI,'
      
        '       ISNULL(B.DT_CHEGADA_CARGA,REPLACE(CONVERT(VARCHAR(20),C.D' +
        'T_REALIZACAO,103), '#39'/'#39', '#39#39')) AS DT_CHEGADA_CARGA         '
      'FROM TPROCESSO                    A (NOLOCK) '
      
        'LEFT JOIN TDECLARACAO_IMPORTACAO  B (NOLOCK) ON B.NR_PROCESSO = ' +
        'A.NR_PROCESSO'
      
        'LEFT JOIN TFOLLOWUP               C (NOLOCK) ON C.NR_PROCESSO = ' +
        'A.NR_PROCESSO '
      
        '                                            AND C.CD_EVENTO   = ' +
        #39'162'#39
      'WHERE A.NR_PROCESSO = :NR_PROCESSO')
    Left = 131
    Top = 258
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_di_NR_PROCESSO: TStringField
      DisplayWidth = 18
      FieldName = 'NR_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_di_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 10
    end
    object qry_di_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 8
    end
    object qry_di_DT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 8
    end
  end
  object qry_exp_proc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_SD, CD_INCOTERM, VL_TOT_MCV'
      'FROM   TPROCESSO_EXP (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 131
    Top = 319
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_exp_proc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_proc_NR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'TPROCESSO_EXP.NR_SD'
      Size = 11
    end
    object qry_exp_proc_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 3
    end
    object qry_exp_proc_VL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      Origin = 'TPROCESSO_EXP.NR_SD'
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ISNULL( VL_TX_CONTR_SOCIAL_SDA, 0 ) VL_TX_CONTR_SOCIAL_SD' +
        'A'
      'FROM TPARAMETROS (NOLOCK)')
    Left = 322
    Top = 196
    object qry_param_VL_TX_CONTR_SOCIAL_SDA: TFloatField
      FieldName = 'VL_TX_CONTR_SOCIAL_SDA'
    end
  end
  object qry_dados_sda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO, P.CD_CLIENTE,' +
        ' P.NR_VIAGEM, P.NR_VOO'
      '       ,P.NR_CONHECIMENTO'
      '       ,P.NR_CONHECIMENTO_MASTER'
      '       ,P.VL_CIF_MN'
      '       ,E.NM_EMPRESA, E.CD_TIPO_PESSOA'
      
        '       ,E.END_EMPRESA,E.END_CIDADE,E.END_BAIRRO,E.END_CEP,E.END_' +
        'UF,'
      '       SUBSTRING( CGC_EMPRESA, 1, 2 )  + '#39'.'#39' +'
      '       SUBSTRING( CGC_EMPRESA, 3, 3 )  + '#39'.'#39' +'
      '       SUBSTRING( CGC_EMPRESA, 6, 3 )  + '#39'/'#39' +'
      '       SUBSTRING( CGC_EMPRESA, 9, 4 )  + '#39'-'#39' +'
      '       SUBSTRING( CGC_EMPRESA, 13, 2 ) AS CGC_EMPRESA,'
      '       SUBSTRING( CPF_EMPRESA, 1, 3 ) + '#39'.'#39' +'
      '       SUBSTRING( CPF_EMPRESA, 4, 3 ) + '#39'.'#39' +'
      '       SUBSTRING( CPF_EMPRESA, 7, 3 ) + '#39'-'#39' +'
      '       SUBSTRING( CPF_EMPRESA, 10, 2 ) AS CPF_EMPRESA,'
      '       H.IN_COMP_SDA,'
      '       SE.CD_VIA_TRANSPORTE,'
      '       EM.NM_EMBARCACAO'
      'FROM   TPROCESSO P (NOLOCK)'
      
        '  INNER JOIN TEMPRESA_NAC E (NOLOCK) on P.CD_CLIENTE = E.CD_EMPR' +
        'ESA'
      
        '  INNER JOIN VW_SERVICO_GERAL SE (NOLOCK) on P.CD_SERVICO = SE.C' +
        'D_SERVICO'
      
        '  INNER JOIN TCLIENTE_HABILITACAO H (NOLOCK) on P.CD_UNID_NEG = ' +
        'H.CD_UNID_NEG AND P.CD_PRODUTO = H.CD_PRODUTO AND P.CD_CLIENTE =' +
        ' H.CD_CLIENTE'
      
        '  LEFT JOIN TEMBARCACAO EM (NOLOCK) on P.CD_EMBARCACAO = EM.CD_E' +
        'MBARCACAO'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 33
    Top = 79
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_dados_sda_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_dados_sda_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_dados_sda_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_dados_sda_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_dados_sda_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Size = 15
    end
    object qry_dados_sda_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      Size = 18
    end
    object qry_dados_sda_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object qry_dados_sda_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Size = 30
    end
    object qry_dados_sda_VL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
    end
    object qry_dados_sda_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_dados_sda_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Size = 1
    end
    object qry_dados_sda_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 18
    end
    object qry_dados_sda_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Size = 14
    end
    object qry_dados_sda_IN_COMP_SDA: TStringField
      FieldName = 'IN_COMP_SDA'
      Size = 1
    end
    object qry_dados_sda_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_dados_sda_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Size = 40
    end
    object qry_dados_sda_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_dados_sda_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_dados_sda_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_dados_sda_END_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_dados_sda_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
  end
  object rp_sda: TRAWPrinter
    LinhasPorPagina = 67
    Impressora = HPDeskJet
    Left = 419
    Top = 136
  end
  object qry_di_urf_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DI.CD_URF_DESPACHO, U.DESCRICAO'
      'FROM TDECLARACAO_IMPORTACAO DI (NOLOCK), TURF U (NOLOCK)'
      'WHERE DI.CD_URF_DESPACHO = U.CODIGO AND'
      '               DI.NR_PROCESSO = :NR_PROCESSO')
    Left = 226
    Top = 258
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_di_urf_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_di_urf_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_URF_DESPACHO'
      Size = 120
    end
  end
  object qry_exp_urf_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PE.CD_URF_DESPACHO, U.DESCRICAO'
      'FROM TPROCESSO_EXP  PE (NOLOCK), TURF U (NOLOCK)'
      'WHERE PE.CD_URF_DESPACHO = U.CODIGO AND'
      '               PE.NR_PROCESSO = :NR_PROCESSO')
    Left = 226
    Top = 319
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_exp_urf_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TPROCESSO_EXP.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_exp_urf_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TURF.DESCRICAO'
      Size = 120
    end
  end
  object cds_Processo_sda_: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_DESPACHANTE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_INICIAL_DISTRIBUICAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FINAL_DISTRIBUICAO'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_processo_sda'
    OnCalcFields = cds_Processo_sda_CalcFields
    Left = 657
    Top = 250
    object cds_Processo_sda_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object cds_Processo_sda_IN_EMITE: TStringField
      FieldName = 'IN_EMITE'
      Size = 1
    end
    object cds_Processo_sda_AP_EMPRESA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object cds_Processo_sda_NM_SERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object cds_Processo_sda_VL_BASE_CALCULO: TFloatField
      DisplayLabel = 'Base de C'#225'lculo'
      FieldName = 'VL_BASE_CALCULO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object cds_Processo_sda_VL_SDA: TFloatField
      DisplayLabel = 'Valor S.D.A.'
      FieldName = 'VL_SDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object cds_Processo_sda_VL_CONTR_ASSIST: TFloatField
      FieldName = 'VL_CONTR_ASSIST'
    end
    object cds_Processo_sda_VL_COMPL: TFloatField
      FieldName = 'VL_COMPL'
    end
    object cds_Processo_sda_CalcProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldName = 'CalcProcesso'
      Size = 14
    end
    object cds_Processo_sda_SOMA: TFloatField
      FieldName = 'SOMA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object cds_Processo_sda_LOCAL: TStringField
      FieldName = 'LOCAL'
      FixedChar = True
      Size = 50
    end
    object cds_Processo_sda_CalcSelecao: TStringField
      DisplayLabel = '  '
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'CalcSelecao'
      Size = 2
      Calculated = True
    end
    object cds_Processo_sda_CD_USUARIO_EMITE: TStringField
      FieldName = 'CD_USUARIO_EMITE'
      FixedChar = True
      Size = 4
    end
    object cds_Processo_sda_IN_EMITINDO: TStringField
      FieldName = 'IN_EMITINDO'
      Size = 1
    end
    object cds_Processo_sda_DT_DISTRIBUICAO: TStringField
      DisplayLabel = 'Dt. Distribui'#231#227'o'
      FieldName = 'DT_DISTRIBUICAO'
      FixedChar = True
      Size = 15
    end
  end
  object dsp_processo_sda: TDataSetProvider
    DataSet = qry_processo_sda_
    Left = 657
    Top = 175
  end
end
