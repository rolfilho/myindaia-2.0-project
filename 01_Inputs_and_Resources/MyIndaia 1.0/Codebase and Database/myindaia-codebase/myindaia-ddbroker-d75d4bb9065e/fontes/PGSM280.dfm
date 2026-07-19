object datm_recebimento_ag: Tdatm_recebimento_ag
  OldCreateOrder = False
  Left = 61
  Top = 76
  Height = 594
  Width = 889
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 56
    Top = 16
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, TP.NM_PRODUTO, UH.CD_UNID_NEG, TUN.NM_UNID' +
        '_NEG, UH.CD_PRODUTO, UH.IN_ATIVO, UH.IN_DEFAULT,TU.NM_USUARIO  F' +
        'ROM TUSUARIO_HABILITACAO UH (NOLOCK)'
      'LEFT JOIN TUSUARIO TU (NOLOCK) ON(TU.CD_USUARIO = UH.CD_USUARIO)'
      'LEFT JOIN TPRODUTO TP (NOLOCK) ON(TP.CD_PRODUTO = UH.CD_PRODUTO)'
      
        'LEFT JOIN TUNID_NEG TUN (NOLOCK) ON (TUN.CD_UNID_NEG = UH.CD_UNI' +
        'D_NEG)WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39
      ' ')
    Left = 56
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_traz_default_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_traz_default_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_IN_DEFAULT: TStringField
      FieldName = 'IN_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
  end
  object qry_notificacao_pend_: TQuery
    CachedUpdates = True
    AfterPost = qry_notificacao_pend_AfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DISTINCT TN.NR_PROCESSO, ISNULL((TN.VL_SOLICITADO - TN.VL' +
        '_RECEBIDO),0) AS VL_SOLICITADO, TN.DT_SOLICITACAO,  TS.TP_SERVIC' +
        'O, TS.CD_VIA_TRANSPORTE,'
      
        '    TN.NR_SOLICITACAO, TN.IN_SELECIONADO, TP.CD_UNID_NEG, TP.CD_' +
        'PRODUTO, TP.CD_CLIENTE, TP.NR_PROCESSO_VINC, PR.TP_PRODUTO,'
      
        '    (SELECT TE.NM_EMPRESA  FROM TEMPRESA_NAC TE (NOLOCK) WHERE T' +
        'E.CD_EMPRESA= TP.CD_CLIENTE)NM_EMPRESA'
      
        '     FROM TNUMERARIO_NOTIFICA TN (NOLOCK), TPROCESSO TP (NOLOCK)' +
        ', TSERVICO TS (NOLOCK), TPRODUTO PR (NOLOCK) WHERE'
      ''
      ''
      
        '    TP.CD_UNID_NEG =:CD_UNID_NEG AND TP.CD_PRODUTO=:CD_PRODUTO A' +
        'ND TP.CD_PRODUTO = PR.CD_PRODUTO AND TP.CD_SERVICO = TS.CD_SERVI' +
        'CO AND ISNULL(TS.TP_SERVICO,'#39'0'#39') = :TP_SERVICO'
      
        '      AND TN.NR_PROCESSO = TP.NR_PROCESSO AND TN.CD_STATUS IN ('#39 +
        'A'#39','#39'P'#39') AND TN.IN_EMITIDO = '#39'1'#39' AND TN.VL_SOLICITADO > 0'
      
        '       AND TN.NR_PROCESSO NOT IN (SELECT TR.NR_PROCESSO FROM TRE' +
        'CEBIMENTO_PROCESSO TR (NOLOCK) WHERE TR.NR_PROCESSO = TN.NR_PROC' +
        'ESSO'
      
        '        AND TR.NR_SOLICITACAO = TN.NR_SOLICITACAO AND TR.CD_STAT' +
        'US IN ('#39'A'#39','#39'B'#39'))'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '    '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = Up_notif_pedent
    Left = 54
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
        Name = 'TP_SERVICO'
        ParamType = ptInput
      end>
    object qry_notificacao_pend_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_notificacao_pend_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.VL_SOLICITADO'
      DisplayFormat = '0.00'
    end
    object qry_notificacao_pend_DT_SOLICITACAO: TDateTimeField
      FieldName = 'DT_SOLICITACAO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.DT_SOLICITACAO'
    end
    object qry_notificacao_pend_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.NR_SOLICITACAO'
      FixedChar = True
      Size = 3
    end
    object qry_notificacao_pend_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_notificacao_pend_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_notificacao_pend_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_notificacao_pend_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_notificacao_pend_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_notificacao_pend_TP_SERVICO: TStringField
      FieldName = 'TP_SERVICO'
      FixedChar = True
      Size = 1
    end
    object qry_notificacao_pend_NR_PROCESSO_VINC: TStringField
      FieldName = 'NR_PROCESSO_VINC'
      FixedChar = True
      Size = 14
    end
    object qry_notificacao_pend_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_notificacao_pend_TP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object ds_notif_pend: TDataSource
    DataSet = qry_notificacao_pend_
    Left = 56
    Top = 192
  end
  object qry_list_receb_: TQuery
    AfterScroll = qry_list_receb_AfterScroll
    OnCalcFields = qry_list_receb_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TR.NR_RECEBIMENTO, P.NR_PROCESSO, TR.DT_RECEBIMENTO, TR.I' +
        'N_ABERTO, TR.IN_CANCELADO, TR.CD_USUARIO, TR.CD_UNID_NEG,'
      
        '       TR.CD_USUARIO_CANC, TR.VL_RECEBIMENTO, TR.CD_BANCO, TR.CD' +
        '_CLIENTE, TR.DT_CANCELAMENTO,(SELECT TU.AP_USUARIO FROM TUSUARIO' +
        ' TU (NOLOCK) WHERE TU.CD_USUARIO = TR.CD_USUARIO) AP_USUARIO,'
      
        '       (SELECT TB.NM_BANCO FROM TBANCO TB (NOLOCK) WHERE TB.CD_B' +
        'ANCO =TR.CD_BANCO)NM_BANCO,  TR.TP_RECEBIMENTO,'
      
        '       (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE (NOLOCK) WHERE' +
        ' TE.CD_EMPRESA = TR.CD_CLIENTE)NM_CLIENTE,'
      
        '       ( CASE TR.IN_ABERTO WHEN '#39'A'#39' THEN '#39'Montado'#39' WHEN '#39'B'#39' THEN' +
        ' '#39'Baixado'#39' WHEN '#39'C'#39' THEN '#39'Cancelado'#39' WHEN '#39'P'#39' THEN '#39'Parcial'#39' END' +
        ' ) STATUS'
      
        '  FROM TRECEBIMENTO_AG TR (NOLOCK), TRECEBIMENTO_PROCESSO P (NOL' +
        'OCK)'
      
        ' WHERE ( ( TR.CD_CLIENTE = :CD_CLIENTE ) OR ( TR.CD_CLIENTE IN (' +
        ' SELECT EN.CD_EMPRESA FROM TEMPRESA_NAC EN (NOLOCK) WHERE EN.CD_' +
        'GRUPO = :CD_GRUPO ) ) OR ( ( :CD_CLIENTE = '#39#39' ) AND ( :CD_GRUPO ' +
        '= '#39#39' )))'
      
        '       AND TR.CD_UNID_NEG = :CD_UNID_NEG AND ( ( SUBSTRING(P.NR_' +
        'PROCESSO,3,2) = :CD_PRODUTO ) OR ( :CD_PRODUTO = '#39#39' ) ) AND'
      
        '       (DT_RECEBIMENTO BETWEEN CONVERT(DATETIME,:DT_INICIO,103) ' +
        'AND CONVERT(DATETIME,:DT_FINAL,103))'
      
        '       AND TR.NR_RECEBIMENTO = P.NR_RECEBIMENTO AND TR.CD_CLIENT' +
        'E = P.CD_CLIENTE AND TR.CD_UNID_NEG = P.CD_UNID_NEG'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      'ORDER BY P.NR_PROCESSO')
    Left = 157
    Top = 79
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
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
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FINAL'
        ParamType = ptInput
      end>
    object qry_list_receb_DT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object qry_list_receb_IN_ABERTO: TStringField
      FieldName = 'IN_ABERTO'
      FixedChar = True
      Size = 1
    end
    object qry_list_receb_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_list_receb_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_list_receb_CD_USUARIO_CANC: TStringField
      FieldName = 'CD_USUARIO_CANC'
      FixedChar = True
      Size = 4
    end
    object qry_list_receb_VL_RECEBIMENTO: TFloatField
      FieldName = 'VL_RECEBIMENTO'
      DisplayFormat = '0.00'
    end
    object qry_list_receb_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_list_receb_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_list_receb_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
    end
    object qry_list_receb_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qry_list_receb_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 40
    end
    object qry_list_receb_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_list_receb_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_list_receb_TP_RECEBIMENTO: TStringField
      FieldName = 'TP_RECEBIMENTO'
      FixedChar = True
      Size = 1
    end
    object qry_list_receb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_list_receb_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 15
      Calculated = True
    end
    object qry_list_receb_STATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 9
    end
    object qry_list_receb_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      FixedChar = True
      Size = 6
    end
  end
  object ds_list_receb: TDataSource
    DataSet = qry_list_receb_
    Left = 162
    Top = 139
  end
  object Up_notif_pedent: TUpdateSQL
    ModifySQL.Strings = (
      'update TNUMERARIO_NOTIFICA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  DT_SOLICITACAO = :DT_SOLICITACAO,'
      '  NR_SOLICITACAO = :NR_SOLICITACAO,'
      '  IN_SELECIONADO = :IN_SELECIONADO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SOLICITACAO = :OLD_NR_SOLICITACAO')
    InsertSQL.Strings = (
      'insert into TNUMERARIO_NOTIFICA'
      '  (NR_PROCESSO, DT_SOLICITACAO, NR_SOLICITACAO, IN_SELECIONADO)'
      'values'
      
        '  (:NR_PROCESSO,  :DT_SOLICITACAO, :NR_SOLICITACAO, :IN_SELECION' +
        'ADO)')
    DeleteSQL.Strings = (
      'delete from TNUMERARIO_NOTIFICA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SOLICITACAO = :OLD_NR_SOLICITACAO')
    Left = 164
    Top = 188
  end
  object qry_recebimento_: TQuery
    CachedUpdates = True
    AfterPost = qry_recebimento_AfterPost
    AfterScroll = qry_recebimento_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TR.NR_RECEBIMENTO, TR.CD_CLIENTE,TR.CD_UNID_NEG, TR.DT_RE' +
        'CEBIMENTO, TR.CD_USUARIO, TR.CD_BANCO, TR.VL_RECEBIMENTO,'
      
        '  TR.IN_CANCELADO, TR.DT_CANCELAMENTO, TR.CD_USUARIO_CANC, TR.IN' +
        '_TRANSFERIDO, TR.QT_ITENS_RECEB, TR.IN_TRANSF_CANC, TR.DT_FATURA' +
        ','
      
        '  TR.VL_DEVOLVIDO, TR.IN_FAV_SM, TR.DT_SOLIC_CH, TR.NR_SOLIC_CH,' +
        ' TR.NR_FP, TR.IN_CAMBIO, TR.IN_UNIFICADO, TR.IN_FATURADO,'
      
        '  TR.VL_TOT_RECEBIDO, TR.IN_MAIOR, TR.IN_ABERTO, TR.VL_TT_ADICIO' +
        'NAL, TR.TP_RECEBIMENTO, TR.VL_TOT_UTILIZADO, TR.NR_RECIBO,'
      
        '  (SELECT TB.NM_BANCO FROM TBANCO TB (NOLOCK) WHERE TB.CD_BANCO ' +
        '= TR.CD_BANCO)NM_BANCO, TR.NR_FATURA, TR.IN_EMITIDO_FAT FROM TRE' +
        'CEBIMENTO_AG TR (NOLOCK)'
      '  WHERE TR.NR_RECEBIMENTO=:NR_RECEBIMENTO'
      '    AND TR.CD_CLIENTE=:CD_CLIENTE'
      '     AND TR.CD_UNID_NEG =:CD_UNID_NEG'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = Update_receb
    Left = 56
    Top = 250
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_RECEBIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
    object qry_recebimento_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_recebimento_DT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.DT_RECEBIMENTO'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_recebimento_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_recebimento_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_recebimento_VL_RECEBIMENTO: TFloatField
      FieldName = 'VL_RECEBIMENTO'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.VL_RECEBIMENTO'
      OnChange = qry_recebimento_VL_RECEBIMENTOChange
      DisplayFormat = '0.00'
    end
    object qry_recebimento_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.DT_CANCELAMENTO'
    end
    object qry_recebimento_CD_USUARIO_CANC: TStringField
      FieldName = 'CD_USUARIO_CANC'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.CD_USUARIO_CANC'
      FixedChar = True
      Size = 4
    end
    object qry_recebimento_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.IN_TRANSFERIDO'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_QT_ITENS_RECEB: TIntegerField
      FieldName = 'QT_ITENS_RECEB'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.QT_ITENS_RECEB'
    end
    object qry_recebimento_IN_TRANSF_CANC: TStringField
      FieldName = 'IN_TRANSF_CANC'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.IN_TRANSF_CANC'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_VL_DEVOLVIDO: TFloatField
      FieldName = 'VL_DEVOLVIDO'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.VL_DEVOLVIDO'
      DisplayFormat = '0.00'
    end
    object qry_recebimento_IN_FAV_SM: TStringField
      FieldName = 'IN_FAV_SM'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.IN_FAV_SM'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_DT_SOLIC_CH: TStringField
      FieldName = 'DT_SOLIC_CH'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.DT_SOLIC_CH'
      FixedChar = True
      Size = 10
    end
    object qry_recebimento_NR_SOLIC_CH: TStringField
      FieldName = 'NR_SOLIC_CH'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.NR_SOLIC_CH'
      FixedChar = True
      Size = 3
    end
    object qry_recebimento_NR_FP: TStringField
      FieldName = 'NR_FP'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.NR_FP'
      FixedChar = True
      Size = 10
    end
    object qry_recebimento_IN_CAMBIO: TStringField
      FieldName = 'IN_CAMBIO'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.IN_CAMBIO'
      OnChange = qry_recebimento_IN_CAMBIOChange
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_IN_UNIFICADO: TStringField
      FieldName = 'IN_UNIFICADO'
      Origin = 'DBBROKER.TRECEBIMENTO_AG.IN_UNIFICADO'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 40
    end
    object qry_recebimento_VL_TOT_RECEBIDO: TFloatField
      FieldName = 'VL_TOT_RECEBIDO'
      OnChange = qry_recebimento_VL_RECEBIMENTOChange
      DisplayFormat = '0.00'
    end
    object qry_recebimento_IN_MAIOR: TStringField
      FieldName = 'IN_MAIOR'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_IN_ABERTO: TStringField
      FieldName = 'IN_ABERTO'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_VL_TT_ADICIONAL: TFloatField
      FieldName = 'VL_TT_ADICIONAL'
      DisplayFormat = '0.00'
    end
    object qry_recebimento_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_recebimento_TP_RECEBIMENTO: TStringField
      FieldName = 'TP_RECEBIMENTO'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_VL_TOT_UTILIZADO: TFloatField
      FieldName = 'VL_TOT_UTILIZADO'
      DisplayFormat = '0.00'
    end
    object qry_recebimento_IN_FATURADO: TStringField
      FieldName = 'IN_FATURADO'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 6
    end
    object qry_recebimento_NR_RECIBO: TStringField
      FieldName = 'NR_RECIBO'
      FixedChar = True
      Size = 6
    end
    object qry_recebimento_IN_EMITIDO_FAT: TStringField
      FieldName = 'IN_EMITIDO_FAT'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
    end
    object qry_recebimento_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      FixedChar = True
      Size = 6
    end
  end
  object ds_recebimento: TDataSource
    DataSet = qry_recebimento_
    Left = 169
    Top = 295
  end
  object qry_recebimento_processo_: TQuery
    CachedUpdates = True
    AfterPost = qry_recebimento_processo_AfterPost
    BeforeDelete = qry_recebimento_processo_BeforeDelete
    OnCalcFields = qry_recebimento_processo_CalcFields
    OnNewRecord = qry_recebimento_processo_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT *, ( CASE CD_STATUS WHEN '#39'A'#39' THEN '#39'Montado'#39' WHEN '#39'B'#39' THEN' +
        ' '#39'Baixado'#39' WHEN '#39'C'#39' THEN '#39'Cancelado'#39' WHEN '#39'P'#39' THEN '#39'Parcial'#39' END' +
        ' ) STATUS'
      '  FROM TRECEBIMENTO_PROCESSO (NOLOCK)'
      ' WHERE NR_RECEBIMENTO=:NR_RECEBIMENTO'
      '   AND CD_CLIENTE=:CD_CLIENTE'
      '   AND CD_UNID_NEG=:CD_UNID_NEG')
    UpdateObject = Update_receb_processo
    Left = 57
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_RECEBIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
    object qry_recebimento_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_recebimento_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_recebimento_processo_NR_LANC_RECEB: TStringField
      FieldName = 'NR_LANC_RECEB'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.NR_SOLICITACAO'
      FixedChar = True
      Size = 4
    end
    object qry_recebimento_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_recebimento_processo_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.NR_SOLICITACAO'
      FixedChar = True
      Size = 3
    end
    object qry_recebimento_processo_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.VL_SOLICITADO'
      DisplayFormat = '0.00'
    end
    object qry_recebimento_processo_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.VL_RECEBIDO'
      OnChange = qry_recebimento_processo_VL_RECEBIDOChange
      DisplayFormat = '0.00'
    end
    object qry_recebimento_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_processo_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.VL_UTILIZADO'
      OnChange = qry_recebimento_processo_VL_UTILIZADOChange
      DisplayFormat = '0.00'
    end
    object qry_recebimento_processo_VL_DEVOLVIDO: TFloatField
      FieldName = 'VL_DEVOLVIDO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.VL_DEVOLVIDO'
      DisplayFormat = '0.00'
    end
    object qry_recebimento_processo_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.CD_STATUS'
      FixedChar = True
      Size = 1
    end
    object qry_recebimento_processo_DT_TARIFARIO: TDateTimeField
      FieldName = 'DT_TARIFARIO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.DT_TARIFARIO'
      OnChange = qry_recebimento_processo_DT_TARIFARIOChange
      EditMask = '!99/99/9999;1;_'
    end
    object qry_recebimento_processo_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 10
      Calculated = True
    end
    object qry_recebimento_processo_VL_ADICIONAL: TFloatField
      FieldName = 'VL_ADICIONAL'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.VL_ADICIONAL'
      OnChange = qry_recebimento_processo_VL_ADICIONALChange
      DisplayFormat = '0.00'
    end
    object qry_recebimento_processo_calc_tt_processo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_tt_processo'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qry_recebimento_processo_NR_PRIORIDADE: TIntegerField
      FieldName = 'NR_PRIORIDADE'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO.NR_PRIORIDADE'
    end
    object qry_recebimento_processo_STATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 9
    end
    object qry_recebimento_processo_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      FixedChar = True
      Size = 6
    end
  end
  object ds_recb_processo: TDataSource
    DataSet = qry_recebimento_processo_
    Left = 58
    Top = 352
  end
  object Update_receb: TUpdateSQL
    ModifySQL.Strings = (
      'update TRECEBIMENTO_AG'
      'set'
      '  NR_RECEBIMENTO = :NR_RECEBIMENTO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  DT_RECEBIMENTO = :DT_RECEBIMENTO,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  CD_BANCO = :CD_BANCO,'
      '  VL_RECEBIMENTO = :VL_RECEBIMENTO,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  DT_CANCELAMENTO = :DT_CANCELAMENTO,'
      '  CD_USUARIO_CANC = :CD_USUARIO_CANC,'
      '  IN_TRANSFERIDO = :IN_TRANSFERIDO,'
      '  QT_ITENS_RECEB = :QT_ITENS_RECEB,'
      '  IN_TRANSF_CANC = :IN_TRANSF_CANC,'
      '  VL_DEVOLVIDO = :VL_DEVOLVIDO,'
      '  IN_FAV_SM = :IN_FAV_SM,'
      '  DT_SOLIC_CH = :DT_SOLIC_CH,'
      '  NR_SOLIC_CH = :NR_SOLIC_CH,'
      '  NR_FP = :NR_FP,'
      '  IN_CAMBIO = :IN_CAMBIO,'
      '  IN_UNIFICADO = :IN_UNIFICADO,'
      '  VL_TOT_RECEBIDO = :VL_TOT_RECEBIDO,'
      '  IN_MAIOR = :IN_MAIOR,'
      '  IN_ABERTO = :IN_ABERTO,'
      '  VL_TT_ADICIONAL = :VL_TT_ADICIONAL,'
      '  TP_RECEBIMENTO = :TP_RECEBIMENTO,'
      '  VL_TOT_UTILIZADO = :VL_TOT_UTILIZADO,'
      '  IN_FATURADO = :IN_FATURADO,'
      '  NR_FATURA = :NR_FATURA,'
      '  NR_RECIBO = :NR_RECIBO,'
      '  IN_EMITIDO_FAT = :IN_EMITIDO_FAT,'
      '  DT_FATURA = :DT_FATURA'
      'where'
      '  NR_RECEBIMENTO = :OLD_NR_RECEBIMENTO and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG')
    InsertSQL.Strings = (
      'insert into TRECEBIMENTO_AG'
      
        '  (NR_RECEBIMENTO, CD_CLIENTE, CD_UNID_NEG, DT_RECEBIMENTO, CD_U' +
        'SUARIO, '
      
        '   CD_BANCO, VL_RECEBIMENTO, IN_CANCELADO, DT_CANCELAMENTO, CD_U' +
        'SUARIO_CANC, '
      
        '   IN_TRANSFERIDO, QT_ITENS_RECEB, IN_TRANSF_CANC, VL_DEVOLVIDO,' +
        ' IN_FAV_SM, '
      
        '   DT_SOLIC_CH, NR_SOLIC_CH, NR_FP, IN_CAMBIO, IN_UNIFICADO, VL_' +
        'TOT_RECEBIDO, '
      
        '   IN_MAIOR, IN_ABERTO, VL_TT_ADICIONAL, TP_RECEBIMENTO, VL_TOT_' +
        'UTILIZADO, '
      '   IN_FATURADO, NR_FATURA, NR_RECIBO, IN_EMITIDO_FAT, DT_FATURA)'
      'values'
      
        '  (:NR_RECEBIMENTO, :CD_CLIENTE, :CD_UNID_NEG, :DT_RECEBIMENTO, ' +
        ':CD_USUARIO, '
      
        '   :CD_BANCO, :VL_RECEBIMENTO, :IN_CANCELADO, :DT_CANCELAMENTO, ' +
        ':CD_USUARIO_CANC, '
      
        '   :IN_TRANSFERIDO, :QT_ITENS_RECEB, :IN_TRANSF_CANC, :VL_DEVOLV' +
        'IDO, :IN_FAV_SM, '
      
        '   :DT_SOLIC_CH, :NR_SOLIC_CH, :NR_FP, :IN_CAMBIO, :IN_UNIFICADO' +
        ', :VL_TOT_RECEBIDO, '
      
        '   :IN_MAIOR, :IN_ABERTO, :VL_TT_ADICIONAL, :TP_RECEBIMENTO, :VL' +
        '_TOT_UTILIZADO, '
      
        '   :IN_FATURADO, :NR_FATURA, :NR_RECIBO, :IN_EMITIDO_FAT, :DT_FA' +
        'TURA)')
    DeleteSQL.Strings = (
      'delete from TRECEBIMENTO_AG'
      'where'
      '  NR_RECEBIMENTO = :OLD_NR_RECEBIMENTO and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG')
    Left = 170
    Top = 246
  end
  object qry_moeda_tarifario_: TQuery
    CachedUpdates = True
    BeforePost = qry_moeda_tarifario_BeforePost
    AfterPost = qry_moeda_tarifario_AfterPost
    AfterDelete = qry_moeda_tarifario_AfterDelete
    OnNewRecord = qry_moeda_tarifario_NewRecord
    DatabaseName = 'DBBROKER'
    DataSource = ds_recebimento
    SQL.Strings = (
      'SELECT  NR_RECEBIMENTO,  CD_CLIENTE , CD_UNID_NEG,'
      ' CD_MOEDA , VL_TARIFARIO ,'
      '    VL_MANUAL'
      '   FROM TRECEBIMENTO_TARIFARIO (NOLOCK)'
      '  WHERE NR_RECEBIMENTO=:NR_RECEBIMENTO'
      '  AND CD_CLIENTE=:CD_CLIENTE '
      ' '
      ' ')
    UpdateObject = Update_tarifario
    Left = 280
    Top = 20
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_RECEBIMENTO'
        ParamType = ptUnknown
        Size = 7
      end
      item
        DataType = ftFixedChar
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
        Size = 6
      end>
    object qry_moeda_tarifario_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_moeda_tarifario_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      OnChange = qry_moeda_tarifario_CD_MOEDAChange
      FixedChar = True
      Size = 3
    end
    object qry_moeda_tarifario_VL_TARIFARIO: TFloatField
      FieldName = 'VL_TARIFARIO'
      DisplayFormat = '0.00'
    end
    object qry_moeda_tarifario_VL_MANUAL: TFloatField
      FieldName = 'VL_MANUAL'
      DisplayFormat = '0.00'
    end
    object qry_moeda_tarifario_Look_nm_moeda: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_moeda'
      LookupDataSet = qry_moeda_broker_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA'
      Size = 5
      Lookup = True
    end
    object qry_moeda_tarifario_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TRECEBIMENTO_TARIFARIO.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_moeda_tarifario_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      Origin = 'DBBROKER.TRECEBIMENTO_TARIFARIO.NR_RECEBIMENTO'
      FixedChar = True
      Size = 6
    end
  end
  object ds_moeda_tarifario: TDataSource
    DataSet = qry_moeda_tarifario_
    Left = 280
    Top = 74
  end
  object Update_tarifario: TUpdateSQL
    ModifySQL.Strings = (
      'update TRECEBIMENTO_TARIFARIO'
      'set'
      '  NR_RECEBIMENTO = :NR_RECEBIMENTO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  VL_TARIFARIO = :VL_TARIFARIO,'
      '  VL_MANUAL = :VL_MANUAL'
      'where'
      '  NR_RECEBIMENTO = :OLD_NR_RECEBIMENTO and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_MOEDA = :OLD_CD_MOEDA')
    InsertSQL.Strings = (
      'insert into TRECEBIMENTO_TARIFARIO'
      
        '  (NR_RECEBIMENTO, CD_CLIENTE, CD_UNID_NEG, CD_MOEDA, VL_TARIFAR' +
        'IO, VL_MANUAL)'
      'values'
      
        '  (:NR_RECEBIMENTO, :CD_CLIENTE, :CD_UNID_NEG, :CD_MOEDA, :VL_TA' +
        'RIFARIO, '
      '   :VL_MANUAL)')
    DeleteSQL.Strings = (
      'delete from TRECEBIMENTO_TARIFARIO'
      'where'
      '  NR_RECEBIMENTO = :OLD_NR_RECEBIMENTO and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_MOEDA = :OLD_CD_MOEDA')
    Left = 281
    Top = 135
  end
  object qry_moeda_broker_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT AP_MOEDA , NM_MOEDA, CD_MOEDA '
      '   FROM TMOEDA_BROKER (NOLOCK)')
    Left = 280
    Top = 186
  end
  object Update_receb_processo: TUpdateSQL
    ModifySQL.Strings = (
      'update TRECEBIMENTO_PROCESSO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_RECEBIMENTO = :NR_RECEBIMENTO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  NR_LANC_RECEB = :NR_LANC_RECEB,'
      '  NR_SOLICITACAO = :NR_SOLICITACAO,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  VL_SOLICITADO = :VL_SOLICITADO,'
      '  VL_RECEBIDO = :VL_RECEBIDO,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  VL_UTILIZADO = :VL_UTILIZADO,'
      '  VL_DEVOLVIDO = :VL_DEVOLVIDO,'
      '  CD_STATUS = :CD_STATUS,'
      '  DT_TARIFARIO = :DT_TARIFARIO,'
      '  VL_ADICIONAL = :VL_ADICIONAL,'
      '  NR_PRIORIDADE = :NR_PRIORIDADE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_RECEBIMENTO = :OLD_NR_RECEBIMENTO and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  NR_LANC_RECEB = :OLD_NR_LANC_RECEB')
    InsertSQL.Strings = (
      'insert into TRECEBIMENTO_PROCESSO'
      
        '  (NR_PROCESSO, NR_RECEBIMENTO, CD_CLIENTE, NR_LANC_RECEB, NR_SO' +
        'LICITACAO, '
      
        '   CD_UNID_NEG, VL_SOLICITADO, VL_RECEBIDO, IN_CANCELADO, VL_UTI' +
        'LIZADO, '
      
        '   VL_DEVOLVIDO, CD_STATUS, DT_TARIFARIO, VL_ADICIONAL, NR_PRIOR' +
        'IDADE)'
      'values'
      
        '  (:NR_PROCESSO, :NR_RECEBIMENTO, :CD_CLIENTE, :NR_LANC_RECEB, :' +
        'NR_SOLICITACAO, '
      
        '   :CD_UNID_NEG, :VL_SOLICITADO, :VL_RECEBIDO, :IN_CANCELADO, :V' +
        'L_UTILIZADO, '
      
        '   :VL_DEVOLVIDO, :CD_STATUS, :DT_TARIFARIO, :VL_ADICIONAL, :NR_' +
        'PRIORIDADE)')
    DeleteSQL.Strings = (
      'delete from TRECEBIMENTO_PROCESSO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_RECEBIMENTO = :OLD_NR_RECEBIMENTO and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  NR_LANC_RECEB = :OLD_NR_LANC_RECEB')
    Left = 169
    Top = 351
  end
  object qry_receb_proc_item_: TQuery
    CachedUpdates = True
    AfterPost = qry_receb_proc_item_AfterPost
    BeforeDelete = qry_receb_proc_item_BeforeDelete
    OnNewRecord = qry_receb_proc_item_NewRecord
    DatabaseName = 'DBBROKER'
    DataSource = ds_recb_processo
    SQL.Strings = (
      'SELECT * FROM TRECEBIMENTO_PROCESSO_ITEM (NOLOCK)'
      
        '  WHERE NR_RECEBIMENTO=:NR_RECEBIMENTO AND NR_PROCESSO=:NR_PROCE' +
        'SSO'
      
        '   AND NR_SOLICITACAO =:NR_SOLICITACAO AND CD_CLIENTE =:CD_CLIEN' +
        'TE AND CD_UNID_NEG=:CD_UNID_NEG'
      ' '
      ' ')
    UpdateObject = Update_proc_item
    Left = 385
    Top = 16
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_RECEBIMENTO'
        ParamType = ptInput
        Size = 7
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftFixedChar
        Name = 'CD_CLIENTE'
        ParamType = ptInput
        Size = 6
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Size = 3
      end>
    object qry_receb_proc_item_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_receb_proc_item_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_receb_proc_item_NR_LANC_RECEB: TStringField
      FieldName = 'NR_LANC_RECEB'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.CD_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object qry_receb_proc_item_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.NR_LANCAMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_receb_proc_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_receb_proc_item_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.NR_SOLICITACAO'
      FixedChar = True
      Size = 3
    end
    object qry_receb_proc_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_receb_proc_item_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.VL_SOLICITADO'
      DisplayFormat = '0.00'
    end
    object qry_receb_proc_item_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.VL_RECEBIDO'
      OnChange = qry_receb_proc_item_VL_RECEBIDOChange
      DisplayFormat = '0.00'
    end
    object qry_receb_proc_item_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_receb_proc_item_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.VL_UTILIZADO'
      OnChange = qry_receb_proc_item_VL_UTILIZADOChange
      DisplayFormat = '0.00'
    end
    object qry_receb_proc_item_VL_DEVOLVIDO: TFloatField
      FieldName = 'VL_DEVOLVIDO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.VL_DEVOLVIDO'
      DisplayFormat = '0.00'
    end
    object qry_receb_proc_item_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.CD_MOEDA_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_receb_proc_item_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.VL_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_receb_proc_item_CD_MOEDA_COMPRA: TStringField
      FieldName = 'CD_MOEDA_COMPRA'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.CD_MOEDA_COMPRA'
      FixedChar = True
      Size = 3
    end
    object qry_receb_proc_item_VL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.VL_COMPRA'
      DisplayFormat = '0.00'
    end
    object qry_receb_proc_item_Look_nm_item: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 25
      Lookup = True
    end
    object qry_receb_proc_item_VL_TARIFARIO: TFloatField
      FieldName = 'VL_TARIFARIO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.VL_TARIFARIO'
    end
    object qry_receb_proc_item_Look_nm_moeda: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_moeda'
      LookupDataSet = qry_moeda_broker_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA_VENDA'
      Size = 5
      Lookup = True
    end
    object qry_receb_proc_item_CD_BANCO_ITEM: TStringField
      FieldName = 'CD_BANCO_ITEM'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.CD_BANCO_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_receb_proc_item_VL_ADICIONAL_ITEM: TFloatField
      FieldName = 'VL_ADICIONAL_ITEM'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.VL_ADICIONAL_ITEM'
      OnChange = qry_receb_proc_item_VL_ADICIONAL_ITEMChange
      DisplayFormat = '0.00'
    end
    object qry_receb_proc_item_LooK_nm_banco: TStringField
      FieldKind = fkLookup
      FieldName = 'LooK_nm_banco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_receb_proc_item_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      Origin = 'DBBROKER.TRECEBIMENTO_PROCESSO_ITEM.NR_RECEBIMENTO'
      FixedChar = True
      Size = 6
    end
  end
  object DDS_RECB_PROC_ITEM: TDataSource
    DataSet = qry_receb_proc_item_
    Left = 384
    Top = 70
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM '
      '  FROM TITEM (NOLOCK)')
    Left = 280
    Top = 249
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TITEM.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'DBBROKER.TITEM.NM_ITEM'
      FixedChar = True
      Size = 30
    end
  end
  object Update_proc_item: TUpdateSQL
    ModifySQL.Strings = (
      'update TRECEBIMENTO_PROCESSO_ITEM'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_RECEBIMENTO = :NR_RECEBIMENTO,'
      '  NR_LANC_RECEB = :NR_LANC_RECEB,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  NR_SOLICITACAO = :NR_SOLICITACAO,'
      '  NR_LANCAMENTO = :NR_LANCAMENTO,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_ITEM = :CD_ITEM,'
      '  VL_SOLICITADO = :VL_SOLICITADO,'
      '  VL_RECEBIDO = :VL_RECEBIDO,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  VL_UTILIZADO = :VL_UTILIZADO,'
      '  VL_DEVOLVIDO = :VL_DEVOLVIDO,'
      '  CD_MOEDA_VENDA = :CD_MOEDA_VENDA,'
      '  VL_VENDA = :VL_VENDA,'
      '  CD_MOEDA_COMPRA = :CD_MOEDA_COMPRA,'
      '  VL_COMPRA = :VL_COMPRA,'
      '  VL_TARIFARIO = :VL_TARIFARIO,'
      '  CD_BANCO_ITEM = :CD_BANCO_ITEM,'
      '  VL_ADICIONAL_ITEM = :VL_ADICIONAL_ITEM'
      'where'
      '  NR_RECEBIMENTO = :OLD_NR_RECEBIMENTO and'
      '  NR_LANC_RECEB = :OLD_NR_LANC_RECEB and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  NR_LANCAMENTO = :OLD_NR_LANCAMENTO and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG')
    InsertSQL.Strings = (
      'insert into TRECEBIMENTO_PROCESSO_ITEM'
      
        '  (NR_PROCESSO, NR_RECEBIMENTO, NR_LANC_RECEB, CD_CLIENTE, NR_SO' +
        'LICITACAO, '
      
        '   NR_LANCAMENTO, CD_UNID_NEG, CD_ITEM, VL_SOLICITADO, VL_RECEBI' +
        'DO, IN_CANCELADO, '
      
        '   VL_UTILIZADO, VL_DEVOLVIDO, CD_MOEDA_VENDA, VL_VENDA, CD_MOED' +
        'A_COMPRA, '
      '   VL_COMPRA, VL_TARIFARIO, CD_BANCO_ITEM, VL_ADICIONAL_ITEM)'
      'values'
      
        '  (:NR_PROCESSO, :NR_RECEBIMENTO, :NR_LANC_RECEB, :CD_CLIENTE, :' +
        'NR_SOLICITACAO, '
      
        '   :NR_LANCAMENTO, :CD_UNID_NEG, :CD_ITEM, :VL_SOLICITADO, :VL_R' +
        'ECEBIDO, '
      
        '   :IN_CANCELADO, :VL_UTILIZADO, :VL_DEVOLVIDO, :CD_MOEDA_VENDA,' +
        ' :VL_VENDA, '
      
        '   :CD_MOEDA_COMPRA, :VL_COMPRA, :VL_TARIFARIO, :CD_BANCO_ITEM, ' +
        ':VL_ADICIONAL_ITEM)')
    DeleteSQL.Strings = (
      'delete from TRECEBIMENTO_PROCESSO_ITEM'
      'where'
      '  NR_RECEBIMENTO = :OLD_NR_RECEBIMENTO and'
      '  NR_LANC_RECEB = :OLD_NR_LANC_RECEB and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  NR_LANCAMENTO = :OLD_NR_LANCAMENTO and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG')
    Left = 393
    Top = 128
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO '
      '  FROM TBANCO (NOLOCK)'
      ' WHERE IN_IMPOSTOS = '#39'0'#39
      'ORDER BY NM_BANCO')
    Left = 504
    Top = 16
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TBANCO.CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'DBBROKER.TBANCO.NM_BANCO'
      FixedChar = True
      Size = 40
    end
  end
  object sp_distribui_numerario_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_numerario_AG'
    Left = 512
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_maior'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_cancelamento'
        ParamType = ptInput
      end>
  end
  object sp_cancela_recebimento_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_recebimento_AG'
    Left = 520
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_cancelamento'
        ParamType = ptInput
      end>
  end
  object qry_caixa_ctrl_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(DT_MOVIMENTO) + 1 DT_MOVIMENTO'
      'FROM   TCAIXA_CONTROLE')
    Left = 528
    Top = 192
  end
  object qry_pesq_notificacao_: TQuery
    AfterScroll = qry_pesq_notificacao_AfterScroll
    OnCalcFields = qry_pesq_notificacao_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TN.NR_SOLICITACAO, TN.NR_PROCESSO, TN.DT_SOLICITACAO,TN.V' +
        'L_SOLICITADO, TN.VL_RECEBIDO, TN.DT_EMISSAO , TN.CD_STATUS,'
      
        '       ( CASE TN.CD_STATUS WHEN '#39'A'#39' THEN '#39'Aberto'#39' WHEN '#39'B'#39' THEN ' +
        #39'Baixado'#39' WHEN '#39'C'#39' THEN '#39'Cancelado'#39' WHEN '#39'P'#39' THEN '#39'Parcial'#39' END ' +
        ') STATUS'
      '  FROM TNUMERARIO_NOTIFICA TN (NOLOCK), TPROCESSO TP (NOLOCK)'
      
        ' WHERE TP.CD_UNID_NEG =:CD_UNID_NEG AND ( ( TP.CD_PRODUTO = :CD_' +
        'PRODUTO ) OR ( :CD_PRODUTO = '#39#39' ) )'
      
        '   AND ( ( TP.CD_CLIENTE = :CD_CLIENTE ) OR ( TP.CD_CLIENTE IN (' +
        ' SELECT EN.CD_EMPRESA FROM TEMPRESA_NAC EN (NOLOCK) WHERE EN.CD_' +
        'GRUPO = :CD_GRUPO ) )   OR ( ( :CD_GRUPO = '#39#39' ) AND ( :CD_CLIENT' +
        'E = '#39#39' ))) AND'
      
        '       TN.NR_PROCESSO = TP.NR_PROCESSO AND TN.VL_SOLICITADO > 0 ' +
        'AND'
      '       TN.CD_STATUS = :CD_STATUS'
      
        '   AND CONVERT(DATETIME,CONVERT(VARCHAR,TN.DT_EMISSAO,103),103) ' +
        'BETWEEN CONVERT(DATETIME, CONVERT(VARCHAR,:DT_INICIO,103),103) A' +
        'ND CONVERT(DATETIME, CONVERT(VARCHAR,:DT_FIM,103),103)'
      ' '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      'ORDER BY TN.NR_PROCESSO')
    Left = 280
    Top = 306
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
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    object qry_pesq_notificacao_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      FixedChar = True
      Size = 3
    end
    object qry_pesq_notificacao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_pesq_notificacao_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      DisplayFormat = '0.00'
    end
    object qry_pesq_notificacao_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      DisplayFormat = '0.00'
    end
    object qry_pesq_notificacao_DT_SOLICITACAO: TDateTimeField
      FieldName = 'DT_SOLICITACAO'
    end
    object qry_pesq_notificacao_DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object qry_pesq_notificacao_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      FixedChar = True
      Size = 1
    end
    object qry_pesq_notificacao_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 15
      Calculated = True
    end
    object qry_pesq_notificacao_STATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 9
    end
  end
  object ds_pesq_notificacao: TDataSource
    DataSet = qry_pesq_notificacao_
    Left = 280
    Top = 354
  end
  object qry_cgc_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_FAVORECIDO FROM TFAVORECIDO F (NOLOCK), TEMPRESA_NAC E' +
        ' (NOLOCK)'
      
        '   WHERE (F.CGC_EMPRESA = E.CGC_EMPRESA) OR (T.CPF_EMPRESA = E.C' +
        'PF_EMPRESA)'
      '      AND E.CD_EMPRESA = :CD_EMPRESA'
      ' ')
    Left = 400
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end>
  end
  object sp_atualiza_receb_num_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atualiza_receb_num_ag'
    Left = 401
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end>
  end
  object sp_atz_numerario_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_numerario_ag'
    Left = 699
    Top = 81
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Qtd_proc_vinc'
        ParamType = ptOutput
        Value = 0
      end>
  end
  object sp_orig_receb_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_origina_recebimento_ag'
    Left = 703
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_recebimento_ag'
        ParamType = ptOutput
        Value = Null
      end
      item
        DataType = ftDateTime
        Name = '@dt_recebimento'
        ParamType = ptInput
      end>
  end
  object sp_atz_tarifa_desemb: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_tarifario_desembaraco'
    Left = 704
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end>
  end
  object sp_canc_receb_vinc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_canc_recebimento_vinculado'
    Left = 704
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_maior'
        ParamType = ptInput
      end>
  end
  object sp_atz_status_solic_pagto_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_status_solic_pagto_ag'
    Left = 705
    Top = 296
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
  object sp_atz_pagto_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_pagto_ag'
    Left = 416
    Top = 312
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
      end
      item
        DataType = ftString
        Name = '@cd_item'
        ParamType = ptInput
      end>
  end
  object sp_distribui_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_pagto'
    Left = 714
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_destino'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_doc'
        ParamType = ptInput
      end>
  end
  object sp_solic_pagto_vinc_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_solic_pagto_vinc_ag'
    Left = 536
    Top = 256
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
      end
      item
        DataType = ftString
        Name = '@nr_solic'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagto'
        ParamType = ptInput
      end>
  end
  object sp_recebimento_filtro: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'DBO.sp_recebimento_filtro'
    Left = 536
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_maior'
        ParamType = ptInput
      end>
  end
  object sp_canc_receb_filtro: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_canc_receb_filtro'
    Left = 712
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_recebimento'
        ParamType = ptInput
      end>
  end
  object qry_fatura_: TQuery
    OnCalcFields = qry_fatura_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT R.NR_RECEBIMENTO, R.CD_CLIENTE, R.CD_UNID_NEG, RP.NR_LANC' +
        '_RECEB, R.DT_RECEBIMENTO,'
      
        '  RP.NR_PROCESSO, RP.NR_SOLICITACAO, RP.DT_TARIFARIO, RP.VL_RECE' +
        'BIDO, R.VL_RECEBIMENTO,'
      
        '  RP.VL_SOLICITADO, RP.VL_ADICIONAL, R.CD_BANCO, R.NR_FATURA, R.' +
        'NR_RECIBO,'
      '  B.NM_BANCO, B.CD_AGENCIA, B.NR_CONTA AS CONTA_BANCO,'
      
        '  U.NM_UNID_NEG, U.END_UNID_NEG, U.END_BAIRRO AS BAIRRO_UNID, U.' +
        'END_CEP AS CEP_UNID,'
      '  U.END_CIDADE AS CIDADE_UNID, U.END_UF AS UF_UNID,'
      
        '  (SELECT PA.NM_PAIS FROM TPAIS_BROKER PA (NOLOCK) WHERE PA.CD_P' +
        'AIS = U.CD_PAIS) PAIS_UNID,'
      '  U.NR_FONE AS FONE_UNID, U.NR_FAX1 AS FAX_UNID, U.CGC_UNID_NEG,'
      
        '  E.NM_EMPRESA AS NM_CLIENTE, E.END_EMPRESA AS END_CLIENTE, E.EN' +
        'D_NUMERO AS NUMERO_CLIENTE,'
      
        '  E.END_COMPL AS COMPL_CLIENTE, E.END_CEP AS CEP_CLIENTE, E.END_' +
        'CIDADE AS CIDADE_CLIENTE,'
      '  E.END_UF AS UF_CLIENTE, E.CGC_EMPRESA AS CGC_CLIENTE,'
      '  RI.NR_PROCESSO, RI.CD_ITEM,'
      
        '  (SELECT NM_ITEM FROM TITEM I (NOLOCK) WHERE I.CD_ITEM = RI.CD_' +
        'ITEM)NM_ITEM,'
      
        '  RI.VL_SOLICITADO AS VL_ITEM_SOLIC, RI.VL_RECEBIDO AS VL_ITEM_R' +
        'ECEB, ISNULL(RI.VL_VENDA,1) AS VENDA_ITEM,'
      '  RI.VL_TARIFARIO, RI.VL_ADICIONAL_ITEM,'
      
        '  (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) WHERE M.CD_MO' +
        'EDA = RI.CD_MOEDA_VENDA)AP_MOEDA_ITEM,RI.CD_MOEDA_VENDA,'
      
        '  P.CD_EMP_EST, (SELECT EST.NM_EMPRESA FROM TEMPRESA_EST EST (NO' +
        'LOCK) WHERE EST.CD_EMPRESA = P.CD_EMP_EST)NM_EMP_EST,'
      
        '  P.QTD_VOLUME, P.CHARGEABLE, P.VL_PESO_BRUTO, P.DT_EMBARQUE, DT' +
        '_CHEGADA, P.DESCR_MERCADORIA, P.REF_CLIENTE,'
      '  P.CD_ORIGEM, P.CD_DESTINO,'
      
        '  (SELECT PO.CD_SIGLA FROM TPORTO PO (NOLOCK) WHERE PO.CD_PORTO ' +
        '= P.CD_ORIGEM)NM_ORIGEM,'
      
        '  (SELECT PO.CD_SIGLA FROM TPORTO PO (NOLOCK) WHERE PO.CD_PORTO ' +
        '= P.CD_DESTINO)NM_DESTINO,'
      '  CASE'
      '  WHEN P.TP_PROCESSO = '#39'0'#39' THEN'
      
        '   (SELECT H.NR_MASTER FROM THOUSE H (NOLOCK) WHERE  H.NR_PROCES' +
        'SO = P.NR_PROCESSO AND H.IN_ESTORNO = '#39'0'#39' )'
      
        '  ELSE  (SELECT H.NR_HOUSE FROM THOUSE H (NOLOCK) WHERE  H.NR_PR' +
        'OCESSO = P.NR_PROCESSO AND H.IN_ESTORNO = '#39'0'#39' )'
      '  END AS NR_HOUSE,'
      
        '  (SELECT H.CD_MASTER FROM THOUSE H (NOLOCK) WHERE  H.NR_PROCESS' +
        'O = P.NR_PROCESSO AND H.IN_ESTORNO = '#39'0'#39' ) CD_MASTER,'
      '  P.NR_PROCESSO_VINC'
      
        'FROM  TRECEBIMENTO_PROCESSO_ITEM RI (NOLOCK), TRECEBIMENTO_PROCE' +
        'SSO RP (NOLOCK), TPROCESSO P (NOLOCK), TRECEBIMENTO_AG R (NOLOCK' +
        ')'
      
        ' LEFT JOIN TUNID_NEG U (NOLOCK) ON (U.CD_UNID_NEG = R.CD_UNID_NE' +
        'G)'
      ' LEFT JOIN TBANCO B (NOLOCK) ON (B.CD_BANCO = R.CD_BANCO)'
      
        ' LEFT JOIN TEMPRESA_NAC E (NOLOCK) ON (E.CD_EMPRESA = R.CD_CLIEN' +
        'TE)'
      
        ' WHERE (R.NR_RECEBIMENTO = :NR_RECEBIMENTO AND R.CD_CLIENTE =:CD' +
        '_CLIENTE AND R.CD_UNID_NEG =:CD_UNID_NEG)'
      
        ' AND (R.NR_RECEBIMENTO = RP.NR_RECEBIMENTO AND R.CD_CLIENTE = RP' +
        '.CD_CLIENTE AND R.CD_UNID_NEG = RP.CD_UNID_NEG)'
      
        ' AND (RP.NR_RECEBIMENTO = RI.NR_RECEBIMENTO AND RP.CD_CLIENTE = ' +
        'RI.CD_CLIENTE AND'
      
        '     RP.CD_UNID_NEG = RI.CD_UNID_NEG AND RP.NR_LANC_RECEB = RI.N' +
        'R_LANC_RECEB)'
      ' AND (RP.NR_PROCESSO = P.NR_PROCESSO)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 64
    Top = 415
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_RECEBIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
    object qry_fatura_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_fatura_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_fatura_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_NR_LANC_RECEB: TStringField
      FieldName = 'NR_LANC_RECEB'
      FixedChar = True
      Size = 4
    end
    object qry_fatura_DT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object qry_fatura_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_fatura_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      FixedChar = True
      Size = 3
    end
    object qry_fatura_DT_TARIFARIO: TDateTimeField
      FieldName = 'DT_TARIFARIO'
    end
    object qry_fatura_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
    end
    object qry_fatura_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
    end
    object qry_fatura_VL_ADICIONAL: TFloatField
      FieldName = 'VL_ADICIONAL'
    end
    object qry_fatura_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_fatura_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 40
    end
    object qry_fatura_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_fatura_END_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_fatura_BAIRRO_UNID: TStringField
      FieldName = 'BAIRRO_UNID'
      FixedChar = True
      Size = 30
    end
    object qry_fatura_CEP_UNID: TStringField
      FieldName = 'CEP_UNID'
      FixedChar = True
      Size = 8
    end
    object qry_fatura_CIDADE_UNID: TStringField
      FieldName = 'CIDADE_UNID'
      FixedChar = True
      Size = 30
    end
    object qry_fatura_UF_UNID: TStringField
      FieldName = 'UF_UNID'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_PAIS_UNID: TStringField
      FieldName = 'PAIS_UNID'
      FixedChar = True
      Size = 120
    end
    object qry_fatura_FONE_UNID: TStringField
      FieldName = 'FONE_UNID'
      FixedChar = True
    end
    object qry_fatura_FAX_UNID: TStringField
      FieldName = 'FAX_UNID'
      FixedChar = True
    end
    object qry_fatura_CGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      FixedChar = True
      Size = 14
    end
    object qry_fatura_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_fatura_END_CLIENTE: TStringField
      FieldName = 'END_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_fatura_NUMERO_CLIENTE: TStringField
      FieldName = 'NUMERO_CLIENTE'
      FixedChar = True
      Size = 6
    end
    object qry_fatura_COMPL_CLIENTE: TStringField
      FieldName = 'COMPL_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_fatura_CEP_CLIENTE: TStringField
      FieldName = 'CEP_CLIENTE'
      FixedChar = True
      Size = 8
    end
    object qry_fatura_CIDADE_CLIENTE: TStringField
      FieldName = 'CIDADE_CLIENTE'
      FixedChar = True
      Size = 30
    end
    object qry_fatura_UF_CLIENTE: TStringField
      FieldName = 'UF_CLIENTE'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_CGC_CLIENTE: TStringField
      FieldName = 'CGC_CLIENTE'
      FixedChar = True
      Size = 14
    end
    object qry_fatura_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_fatura_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_fatura_VL_ITEM_SOLIC: TFloatField
      FieldName = 'VL_ITEM_SOLIC'
    end
    object qry_fatura_VL_ITEM_RECEB: TFloatField
      FieldName = 'VL_ITEM_RECEB'
    end
    object qry_fatura_VENDA_ITEM: TFloatField
      FieldName = 'VENDA_ITEM'
    end
    object qry_fatura_VL_TARIFARIO: TFloatField
      FieldName = 'VL_TARIFARIO'
    end
    object qry_fatura_VL_ADICIONAL_ITEM: TFloatField
      FieldName = 'VL_ADICIONAL_ITEM'
    end
    object qry_fatura_AP_MOEDA_ITEM: TStringField
      FieldName = 'AP_MOEDA_ITEM'
      FixedChar = True
      Size = 6
    end
    object qry_fatura_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 6
    end
    object qry_fatura_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_fatura_NM_EMP_EST: TStringField
      FieldName = 'NM_EMP_EST'
      FixedChar = True
      Size = 60
    end
    object qry_fatura_QTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
    end
    object qry_fatura_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
    end
    object qry_fatura_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qry_fatura_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object qry_fatura_DT_CHEGADA: TDateTimeField
      FieldName = 'DT_CHEGADA'
    end
    object qry_fatura_DESCR_MERCADORIA: TStringField
      FieldName = 'DESCR_MERCADORIA'
      FixedChar = True
      Size = 100
    end
    object qry_fatura_REF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      FixedChar = True
    end
    object qry_fatura_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_fatura_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_fatura_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_fatura_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_fatura_VL_RECEBIMENTO: TFloatField
      FieldName = 'VL_RECEBIMENTO'
      DisplayFormat = '0.00'
    end
    object qry_fatura_calc_vl_receb_extenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_receb_extenso'
      Size = 255
      Calculated = True
    end
    object qry_fatura_NR_PROCESSO_1: TStringField
      FieldName = 'NR_PROCESSO_1'
      FixedChar = True
      Size = 18
    end
    object qry_fatura_calc_nm_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Size = 80
      Calculated = True
    end
    object qry_fatura_NR_RECIBO: TStringField
      FieldName = 'NR_RECIBO'
      FixedChar = True
      Size = 6
    end
    object qry_fatura_calc_vl_recebido: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_recebido'
      Calculated = True
    end
    object qry_fatura_calc_vl_moeda: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_moeda'
      Calculated = True
    end
    object qry_fatura_calc_vl_item_venda: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_item_venda'
      Calculated = True
    end
    object qry_fatura_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_fatura_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      FixedChar = True
      Size = 5
    end
    object qry_fatura_CONTA_BANCO: TStringField
      FieldName = 'CONTA_BANCO'
      FixedChar = True
      Size = 10
    end
    object qry_fatura_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_fatura_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_fatura_NR_PROCESSO_VINC: TStringField
      FieldName = 'NR_PROCESSO_VINC'
      FixedChar = True
      Size = 14
    end
    object qry_fatura_calc_nr_proc_vinc: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_proc_vinc'
      Size = 25
      Calculated = True
    end
  end
  object ds_fatura: TDataSource
    DataSet = qry_fatura_
    Left = 132
    Top = 415
  end
  object pp_fatura: TppBDEPipeline
    DataSource = ds_fatura
    UserName = 'fatura'
    Left = 251
    Top = 424
  end
  object pp_recibo: TppBDEPipeline
    DataSource = ds_fatura
    UserName = 'recibo'
    Left = 323
    Top = 424
  end
  object sp_emissao_fatura_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_emissao_fatura_ag'
    Left = 568
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end>
  end
  object sp_contabiliza_numerario: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_numerario'
    Left = 424
    Top = 433
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_receb'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_operacao'
        ParamType = ptInput
      end>
  end
  object sp_contabiliza_emissao_fat: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_emissao_fat'
    Left = 552
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_receb'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_fatura'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_operacao'
        ParamType = ptInput
      end>
  end
  object sp_contabiliza_emissao_recebido: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_emissao_recebido'
    Left = 424
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_receb'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_recibo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end>
  end
  object qry_devolucao_: TQuery
    AfterScroll = qry_devolucao_AfterScroll
    OnCalcFields = qry_devolucao_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT SUBSTRING(NR_PROCESSO,5,10) NR_PROCESSO, NR_DEVOLUCAO, DT' +
        '_DEVOLUCAO, CD_USUARIO, VL_DEVOLUCAO, IN_CANCELADO, DT_CANCELAME' +
        'NTO, CD_USUARIO_CANC, IN_TRANSFERIDO, NR_SOLIC_CH'
      'FROM TDEVOLUCAO  (NOLOCK)'
      'WHERE SUBSTRING(NR_PROCESSO,1,2) = :CD_UNID_NEG'
      
        '   AND CONVERT(DATETIME,CONVERT(VARCHAR,DT_DEVOLUCAO,103),103) B' +
        'ETWEEN CONVERT(DATETIME, CONVERT(VARCHAR,:DT_INICIO,103),103) AN' +
        'D CONVERT(DATETIME, CONVERT(VARCHAR,:DT_FIM,103),103)'
      ''
      ''
      '')
    Left = 124
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    object qry_devolucao_NR_PROCESSO: TStringField
      DisplayWidth = 10
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TDEVOLUCAO.NR_PROCESSO'
      FixedChar = True
      Size = 10
    end
    object qry_devolucao_NR_DEVOLUCAO: TStringField
      FieldName = 'NR_DEVOLUCAO'
      Origin = 'DBBROKER.TDEVOLUCAO.NR_DEVOLUCAO'
      FixedChar = True
      Size = 3
    end
    object qry_devolucao_DT_DEVOLUCAO: TDateTimeField
      FieldName = 'DT_DEVOLUCAO'
      Origin = 'DBBROKER.TDEVOLUCAO.DT_DEVOLUCAO'
    end
    object qry_devolucao_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TDEVOLUCAO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_devolucao_VL_DEVOLUCAO: TFloatField
      FieldName = 'VL_DEVOLUCAO'
      Origin = 'DBBROKER.TDEVOLUCAO.VL_DEVOLUCAO'
      DisplayFormat = '0.00'
    end
    object qry_devolucao_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TDEVOLUCAO.IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_devolucao_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'DBBROKER.TDEVOLUCAO.DT_CANCELAMENTO'
    end
    object qry_devolucao_CD_USUARIO_CANC: TStringField
      FieldName = 'CD_USUARIO_CANC'
      Origin = 'DBBROKER.TDEVOLUCAO.CD_USUARIO_CANC'
      FixedChar = True
      Size = 4
    end
    object qry_devolucao_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'DBBROKER.TDEVOLUCAO.IN_TRANSFERIDO'
      FixedChar = True
      Size = 1
    end
    object qry_devolucao_NR_SOLIC_CH: TStringField
      FieldName = 'NR_SOLIC_CH'
      Origin = 'DBBROKER.TDEVOLUCAO.NR_SOLIC_CH'
      FixedChar = True
      Size = 3
    end
    object qry_devolucao_Calc_Transferido: TStringField
      FieldKind = fkCalculated
      FieldName = 'Calc_Transferido'
      Size = 10
      Calculated = True
    end
  end
  object ds_devolucao_: TDataSource
    DataSet = qry_devolucao_
    Left = 40
    Top = 504
  end
  object sp_atz_fat_cc_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_fat_cc_ag'
    Left = 585
    Top = 496
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end>
  end
  object sp_distribui_recebimento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_recebimento'
    Left = 690
    Top = 25
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end>
  end
end
