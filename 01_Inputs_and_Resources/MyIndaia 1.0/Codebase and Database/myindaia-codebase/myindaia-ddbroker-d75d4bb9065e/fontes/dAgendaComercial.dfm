object datm_agenda_comercial: Tdatm_agenda_comercial
  OldCreateOrder = False
  Left = 283
  Top = 161
  Height = 479
  Width = 741
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, UH.CD_UNID_NEG, TU.NM_UNID_NEG FROM TUSUAR' +
        'IO_HABILITACAO UH with(nolock)'
      'LEFT JOIN TUNID_NEG TU  ON (TU.CD_UNID_NEG = UH.CD_UNID_NEG)'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39
      ' ')
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
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
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 272
    Top = 8
  end
  object qry_agenda_comercial_: TQuery
    CachedUpdates = True
    BeforePost = qry_agenda_comercial_BeforePost
    AfterPost = qry_agenda_comercial_AfterPost
    OnCalcFields = qry_agenda_comercial_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TA.CD_AGENDA, TA.CD_VENDEDOR, TA.IN_PERIODO, TV.NM_VENDED' +
        'OR,'
      
        '    TA.DT_AGENDA, TA.HR_AGENDA, TA.NR_PROC_COMERC, TP.CD_EMPRESA' +
        ', (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRESA' +
        ' = TP.CD_EMPRESA)NM_EMPRESA,'
      
        '    TA.IN_CANCELADO, TA.TP_AGENDA, TA.OBS_AGENDA,TA.NM_CONTATO, ' +
        'TA.IN_PARTICULAR'
      
        '     FROM TAGENDA_COMERC TA LEFT JOIN TVENDEDOR TV ON(TV.CD_VEND' +
        'EDOR = TA.CD_VENDEDOR)'
      
        '     LEFT JOIN TPROC_COMERC TP ON (TP.NR_PROC_COMERC = TA.NR_PRO' +
        'C_COMERC)'
      '  WHERE TA.CD_VENDEDOR=:CD_VENDEDOR'
      '    AND TA.IN_CANCELADO = '#39'0'#39
      '    ORDER BY TA.DT_AGENDA DESC'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDate_agenda_comercial
    Left = 168
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VENDEDOR'
        ParamType = ptUnknown
      end>
    object qry_agenda_comercial_CD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_AGENDA'
    end
    object qry_agenda_comercial_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_agenda_comercial_IN_PERIODO: TStringField
      FieldName = 'IN_PERIODO'
      Origin = 'DBBROKER.TAGENDA_COMERC.IN_PERIODO'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_comercial_DT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.DT_AGENDA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_agenda_comercial_HR_AGENDA: TDateTimeField
      FieldName = 'HR_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.HR_AGENDA'
      OnChange = qry_agenda_comercial_HR_AGENDAChange
      DisplayFormat = 'hh:nn'
      EditMask = '!99:99;1;_'
    end
    object qry_agenda_comercial_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TAGENDA_COMERC.IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_comercial_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      Origin = 'DBBROKER.TAGENDA_COMERC.NATUREZA'
      FixedChar = True
      Size = 18
    end
    object qry_agenda_comercial_TP_AGENDA: TStringField
      FieldName = 'TP_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_AGENDA'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_comercial_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_AGENDA'
      FixedChar = True
      Size = 30
    end
    object qry_agenda_comercial_NM_VENDEDOR: TStringField
      FieldName = 'NM_VENDEDOR'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_comercial_calc_periodo: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'calc_periodo'
      Size = 15
      Calculated = True
    end
    object qry_agenda_comercial_calc_tp_agenda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_agenda'
      Size = 15
      Calculated = True
    end
    object qry_agenda_comercial_calc_cancelado: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_cancelado'
      Size = 10
      Calculated = True
    end
    object qry_agenda_comercial_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_agenda_comercial_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_comercial_OBS_AGENDA: TMemoField
      FieldName = 'OBS_AGENDA'
      BlobType = ftMemo
    end
    object qry_agenda_comercial_IN_PARTICULAR: TStringField
      FieldName = 'IN_PARTICULAR'
      FixedChar = True
      Size = 1
    end
  end
  object ds_agenda_comercial: TDataSource
    DataSet = qry_agenda_comercial_
    Left = 168
    Top = 184
  end
  object qry_agenda_semanal_: TQuery
    OnCalcFields = qry_agenda_semanal_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TA.DT_AGENDA, TA.TP_AGENDA, TA.IN_PERIODO, TA.NR_PROC_COM' +
        'ERC, TA.NM_CONTATO,'
      
        'TA.HR_AGENDA, TP.CD_EMPRESA, TE.NM_EMPRESA, TE.END_EMPRESA, TE.E' +
        'ND_NUMERO, TE.END_CIDADE,'
      
        'TE.END_BAIRRO, TE.END_COMPL, TE.END_UF, TE.END_CEP, TE.CGC_EMPRE' +
        'SA, TE.CPF_EMPRESA,'
      
        'TE.IE_EMPRESA, TE.NR_TELEFONE, TE.NR_FAX, TA.OBS_AGENDA, TA.IN_P' +
        'ARTICULAR,'
      
        'TA.CD_VENDEDOR, (SELECT TV.NM_VENDEDOR FROM TVENDEDOR TV WHERE T' +
        'V.CD_VENDEDOR = TA.CD_VENDEDOR)NM_VENDEDOR'
      
        ' FROM TAGENDA_COMERC TA LEFT JOIN TPROC_COMERC TP ON(TP.NR_PROC_' +
        'COMERC = TA.NR_PROC_COMERC)'
      ' LEFT JOIN TEMPRESA_NAC TE ON (TE.CD_EMPRESA =  TP.CD_EMPRESA)'
      '      WHERE (TA.DT_AGENDA BETWEEN ( :DT_AGENDA1)'
      '                                   AND ( :DT_AGENDA2))'
      '                        AND (TA.CD_VENDEDOR =:CD_VENDEDOR)'
      '                        AND(TA.IN_CANCELADO = '#39'0'#39')'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '          ORDER BY TA.DT_AGENDA , TA.IN_PERIODO'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 72
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_AGENDA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_AGENDA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_VENDEDOR'
        ParamType = ptUnknown
      end>
    object qry_agenda_semanal_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_agenda_semanal_IN_PERIODO: TStringField
      FieldName = 'IN_PERIODO'
      Origin = 'DBBROKER.TAGENDA_COMERC.IN_PERIODO'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_semanal_DT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.DT_AGENDA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_agenda_semanal_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      Origin = 'DBBROKER.TAGENDA_COMERC.NATUREZA'
      FixedChar = True
      Size = 18
    end
    object qry_agenda_semanal_OBS_AGENDA: TMemoField
      FieldName = 'OBS_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.OBS_AGENDA'
      BlobType = ftMemo
    end
    object qry_agenda_semanal_HR_AGENDA: TDateTimeField
      FieldName = 'HR_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_AGENDA'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:99;1;_'
    end
    object qry_agenda_semanal_TP_AGENDA: TStringField
      FieldName = 'TP_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.OBS_AGENDA'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_semanal_calc_sem_tp_agenda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_sem_tp_agenda'
      Size = 15
      Calculated = True
    end
    object qry_agenda_semanal_calc_sem_periodo: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'calc_sem_periodo'
      Size = 15
      Calculated = True
    end
    object qry_agenda_semanal_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_agenda_semanal_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_semanal_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_semanal_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_agenda_semanal_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_agenda_semanal_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_agenda_semanal_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_semanal_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_agenda_semanal_END_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_agenda_semanal_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qry_agenda_semanal_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      FixedChar = True
      Size = 11
    end
    object qry_agenda_semanal_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      FixedChar = True
    end
    object qry_agenda_semanal_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_agenda_semanal_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qry_agenda_semanal_NM_VENDEDOR: TStringField
      FieldName = 'NM_VENDEDOR'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_semanal_calc_descricao_tp_agenda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_descricao_tp_agenda'
      Size = 4000
      Calculated = True
    end
    object qry_agenda_semanal_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 30
    end
    object qry_agenda_semanal_IN_PARTICULAR: TStringField
      FieldName = 'IN_PARTICULAR'
      FixedChar = True
      Size = 1
    end
  end
  object ds_agenda_semanal: TDataSource
    DataSet = qry_agenda_semanal_
    Left = 168
    Top = 56
  end
  object qry_agenda_mensal_: TQuery
    OnCalcFields = qry_agenda_mensal_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TA.DT_AGENDA, TA.TP_AGENDA, TA.IN_PERIODO, TA.NR_PROC_COM' +
        'ERC,  TA.NM_CONTATO,'
      
        'TA.HR_AGENDA, TP.CD_EMPRESA, TE.NM_EMPRESA, TE.END_EMPRESA, TE.E' +
        'ND_NUMERO, TE.END_CIDADE,'
      
        'TE.END_BAIRRO, TE.END_COMPL, TE.END_UF, TE.END_CEP, TE.CGC_EMPRE' +
        'SA, TE.CPF_EMPRESA,'
      
        'TE.IE_EMPRESA, TE.NR_TELEFONE, TE.NR_FAX, TA.OBS_AGENDA,  TA.IN_' +
        'PARTICULAR,'
      
        'TA.CD_VENDEDOR, (SELECT TV.NM_VENDEDOR FROM TVENDEDOR TV WHERE T' +
        'V.CD_VENDEDOR = TA.CD_VENDEDOR)NM_VENDEDOR'
      
        ' FROM TAGENDA_COMERC TA LEFT JOIN TPROC_COMERC TP ON(TP.NR_PROC_' +
        'COMERC = TA.NR_PROC_COMERC)'
      ' LEFT JOIN TEMPRESA_NAC TE ON (TE.CD_EMPRESA =  TP.CD_EMPRESA)'
      '       WHERE ( DATEPART(MM, TA.DT_AGENDA) =:MES) AND'
      '         (TA.CD_VENDEDOR =:CD_VENDEDOR) AND'
      '         (TA.IN_CANCELADO = '#39'0'#39')'
      '          ORDER BY TA.DT_AGENDA , TA.IN_PERIODO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_VENDEDOR'
        ParamType = ptUnknown
      end>
    object qry_agenda_mensal_IN_PERIODO: TStringField
      FieldName = 'IN_PERIODO'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_mensal_DT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_agenda_mensal_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_agenda_mensal_TP_AGENDA: TStringField
      FieldName = 'TP_AGENDA'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_mensal_calc_mens_periodo: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'calc_mens_periodo'
      Size = 15
      Calculated = True
    end
    object qry_agenda_mensal_calc_mens_tp_agenda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_mens_tp_agenda'
      Size = 15
      Calculated = True
    end
    object qry_agenda_mensal_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_agenda_mensal_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_mensal_HR_AGENDA: TDateTimeField
      FieldName = 'HR_AGENDA'
    end
    object qry_agenda_mensal_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_mensal_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_agenda_mensal_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_agenda_mensal_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_agenda_mensal_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_mensal_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_agenda_mensal_END_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_agenda_mensal_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qry_agenda_mensal_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      FixedChar = True
      Size = 11
    end
    object qry_agenda_mensal_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      FixedChar = True
    end
    object qry_agenda_mensal_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_agenda_mensal_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qry_agenda_mensal_OBS_AGENDA: TMemoField
      FieldName = 'OBS_AGENDA'
      BlobType = ftMemo
    end
    object qry_agenda_mensal_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_agenda_mensal_NM_VENDEDOR: TStringField
      FieldName = 'NM_VENDEDOR'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_mensal_calc_descricao_tp_agenda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_descricao_tp_agenda'
      Size = 4000
      Calculated = True
    end
    object qry_agenda_mensal_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 30
    end
    object qry_agenda_mensal_IN_PARTICULAR: TStringField
      FieldName = 'IN_PARTICULAR'
      FixedChar = True
      Size = 1
    end
  end
  object ds_agenda_mensal: TDataSource
    DataSet = qry_agenda_mensal_
    Left = 168
    Top = 120
  end
  object qry_proc_historico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TPROC_COMERC_HISTORICO'
      'WHERE NR_PROC_COMERC=:NR_PROC_COMERC'
      'ORDER BY CD_HIST_PROC_COMERC')
    Left = 48
    Top = 184
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROC_COMERC'
        ParamType = ptUnknown
      end>
    object qry_proc_historico_CD_HIST_PROC_COMERC: TIntegerField
      FieldName = 'CD_HIST_PROC_COMERC'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.CD_HIST_PROC_COMERC'
    end
    object qry_proc_historico_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_proc_historico_DT_HISTORICO: TDateTimeField
      FieldName = 'DT_HISTORICO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.DT_HISTORICO'
    end
    object qry_proc_historico_HR_HISTORICO: TDateTimeField
      FieldName = 'HR_HISTORICO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.HR_HISTORICO'
    end
    object qry_proc_historico_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.NM_HISTORICO'
      FixedChar = True
      Size = 50
    end
    object qry_proc_historico_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_proc_historico_TX_OBS_HISTORICO: TMemoField
      FieldName = 'TX_OBS_HISTORICO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.TX_OBS_HISTORICO'
      BlobType = ftMemo
    end
  end
  object qry_ult_agenda_comercial: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_AGENDA) AS ULTIMO FROM TAGENDA_COMERC')
    Left = 168
    Top = 240
    object qry_ult_agenda_comercialULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_AGENDA'
    end
  end
  object qry_agenda_diaria_: TQuery
    OnCalcFields = qry_agenda_diaria_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TA.DT_AGENDA, TA.TP_AGENDA, TA.IN_PERIODO, TA.NR_PROC_COM' +
        'ERC,   TA.NM_CONTATO,'
      
        'TA.HR_AGENDA, TP.CD_EMPRESA, TE.NM_EMPRESA, TE.END_EMPRESA, TE.E' +
        'ND_NUMERO, TE.END_CIDADE,'
      
        'TE.END_BAIRRO, TE.END_COMPL, TE.END_UF, TE.END_CEP, TE.CGC_EMPRE' +
        'SA, TE.CPF_EMPRESA,'
      
        'TE.IE_EMPRESA, TE.NR_TELEFONE, TE.NR_FAX, TA.OBS_AGENDA, TA.IN_P' +
        'ARTICULAR,'
      
        'TA.CD_VENDEDOR, (SELECT TV.NM_VENDEDOR FROM TVENDEDOR TV WHERE T' +
        'V.CD_VENDEDOR = TA.CD_VENDEDOR)NM_VENDEDOR'
      
        ' FROM TAGENDA_COMERC TA LEFT JOIN TPROC_COMERC TP ON(TP.NR_PROC_' +
        'COMERC = TA.NR_PROC_COMERC)'
      ' LEFT JOIN TEMPRESA_NAC TE ON (TE.CD_EMPRESA =  TP.CD_EMPRESA)'
      '  WHERE( TA.CD_VENDEDOR=:CD_VENDEDOR) AND'
      '     (TA.DT_AGENDA=:DT_AGENDA) AND (TA.IN_CANCELADO='#39'0'#39')'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ORDER BY  TA.IN_PERIODO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 240
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VENDEDOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_AGENDA'
        ParamType = ptUnknown
      end>
    object qry_agenda_diaria_DT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_agenda_diaria_TP_AGENDA: TStringField
      FieldName = 'TP_AGENDA'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_diaria_IN_PERIODO: TStringField
      FieldName = 'IN_PERIODO'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_diaria_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_agenda_diaria_HR_AGENDA: TDateTimeField
      FieldName = 'HR_AGENDA'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:99;1;_'
    end
    object qry_agenda_diaria_calc_diar_tp_agenda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_diar_tp_agenda'
      Size = 15
      Calculated = True
    end
    object qry_agenda_diaria_calc_diar_periodo: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'calc_diar_periodo'
      Size = 15
      Calculated = True
    end
    object qry_agenda_diaria_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_agenda_diaria_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_diaria_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_diaria_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_agenda_diaria_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_agenda_diaria_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_agenda_diaria_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_diaria_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_agenda_diaria_END_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_agenda_diaria_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qry_agenda_diaria_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      FixedChar = True
      Size = 11
    end
    object qry_agenda_diaria_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      FixedChar = True
    end
    object qry_agenda_diaria_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_agenda_diaria_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qry_agenda_diaria_OBS_AGENDA: TMemoField
      FieldName = 'OBS_AGENDA'
      BlobType = ftMemo
    end
    object qry_agenda_diaria_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_agenda_diaria_NM_VENDEDOR: TStringField
      FieldName = 'NM_VENDEDOR'
      FixedChar = True
      Size = 50
    end
    object qry_agenda_diaria_calc_descricao_tp_agenda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_descricao_tp_agenda'
      Size = 4000
      Calculated = True
    end
    object qry_agenda_diaria_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 30
    end
    object qry_agenda_diaria_IN_PARTICULAR: TStringField
      FieldName = 'IN_PARTICULAR'
      FixedChar = True
      Size = 1
    end
  end
  object ds_agenda_diaria: TDataSource
    DataSet = qry_agenda_diaria_
    Left = 48
    Top = 288
  end
  object UpDate_agenda_comercial: TUpdateSQL
    ModifySQL.Strings = (
      'update  TAGENDA_COMERC'
      'set'
      '  CD_AGENDA = :CD_AGENDA,'
      '  CD_VENDEDOR = :CD_VENDEDOR,'
      '  IN_PERIODO = :IN_PERIODO,'
      '  DT_AGENDA = :DT_AGENDA,'
      '  NR_PROC_COMERC = :NR_PROC_COMERC,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  OBS_AGENDA = :OBS_AGENDA,'
      '  TP_AGENDA = :TP_AGENDA,'
      '  NM_CONTATO = :NM_CONTATO,'
      '  HR_AGENDA = :HR_AGENDA'
      'where'
      '  CD_AGENDA = :OLD_CD_AGENDA and'
      '  CD_VENDEDOR = :OLD_CD_VENDEDOR and'
      '  IN_PERIODO = :OLD_IN_PERIODO and'
      '  DT_AGENDA = :OLD_DT_AGENDA')
    InsertSQL.Strings = (
      'insert into  TAGENDA_COMERC'
      
        '  (CD_AGENDA, CD_VENDEDOR, IN_PERIODO, DT_AGENDA, NR_PROC_COMERC' +
        ', IN_CANCELADO, '
      '   OBS_AGENDA, TP_AGENDA, NM_CONTATO, HR_AGENDA)'
      'values'
      
        '  (:CD_AGENDA, :CD_VENDEDOR, :IN_PERIODO, :DT_AGENDA, :NR_PROC_C' +
        'OMERC, '
      
        '   :IN_CANCELADO, :OBS_AGENDA, :TP_AGENDA, :NM_CONTATO, :HR_AGEN' +
        'DA)')
    DeleteSQL.Strings = (
      'delete from  TAGENDA_COMERC'
      'where'
      '  CD_AGENDA = :OLD_CD_AGENDA and'
      '  CD_VENDEDOR = :OLD_CD_VENDEDOR and'
      '  IN_PERIODO = :OLD_IN_PERIODO and'
      '  DT_AGENDA = :OLD_DT_AGENDA')
    Left = 168
    Top = 296
  end
  object qry_Up_proc_comerc_hist_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'insert into TPROC_COMERC_HISTORICO'
      
        '  (CD_AGENDA, CD_HIST_PROC_COMERC, IN_PERIODO, DT_HISTORICO, HR_' +
        'HISTORICO, NR_PROC_COMERC,'
      '   TX_OBS_HISTORICO,  NM_CONTATO, NM_HISTORICO)'
      'values'
      
        '  (:CD_AGENDA, :CD_HIST_PROC_COMERC, :IN_PERIODO, :DT_HISTORICO,' +
        ' :HR_HISTORICO, :NR_PROC_COMERC,'
      '   :TX_OBS_HISTORICO, :NM_CONTATO, :NM_HISTORICO)'
      ' '
      ' '
      ' ')
    Left = 272
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_AGENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_HIST_PROC_COMERC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'IN_PERIODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftTime
        Name = 'HR_HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROC_COMERC'
        ParamType = ptUnknown
      end
      item
        DataType = ftBlob
        Name = 'TX_OBS_HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NM_CONTATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NM_HISTORICO'
        ParamType = ptUnknown
      end>
  end
  object qry_agenda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      '             FROM TAGENDA_COMERC'
      '             WHERE CD_VENDEDOR=:CD_VENDEDOR AND'
      '               DT_AGENDA=CONVERT(DATETIME,:DT_AGENDA,103) AND'
      '                IN_PERIODO=:IN_PERIODO AND'
      '                 IN_CANCELADO=:IN_CANCELADO'
      ' ')
    Left = 272
    Top = 120
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VENDEDOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'DT_AGENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'IN_PERIODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'IN_CANCELADO'
        ParamType = ptUnknown
      end>
    object qry_agenda_CD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_AGENDA'
    end
    object qry_agenda_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_agenda_IN_PERIODO: TStringField
      FieldName = 'IN_PERIODO'
      Origin = 'DBBROKER.TAGENDA_COMERC.IN_PERIODO'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_DT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.DT_AGENDA'
    end
    object qry_agenda_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      Origin = 'DBBROKER.TAGENDA_COMERC.HR_AGENDA'
      FixedChar = True
      Size = 18
    end
    object qry_agenda_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TAGENDA_COMERC.NATUREZA'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_OBS_AGENDA: TMemoField
      FieldName = 'OBS_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.IN_CANCELADO'
      BlobType = ftMemo
    end
    object qry_agenda_TP_AGENDA: TStringField
      FieldName = 'TP_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.OBS_AGENDA'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'DBBROKER.TAGENDA_COMERC.OBS_AGENDA'
      FixedChar = True
      Size = 30
    end
    object qry_agenda_HR_AGENDA: TDateTimeField
      FieldName = 'HR_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.OBS_AGENDA'
    end
  end
  object pp_diario: TppBDEPipeline
    DataSource = ds_agenda_diaria
    UserName = '_diario'
    Left = 280
    Top = 184
  end
  object pp_semanal: TppBDEPipeline
    DataSource = ds_agenda_semanal
    UserName = '_semanal'
    Left = 280
    Top = 248
  end
  object pp_mensal: TppBDEPipeline
    DataSource = ds_agenda_mensal
    UserName = '_mensal'
    Left = 280
    Top = 304
  end
end
