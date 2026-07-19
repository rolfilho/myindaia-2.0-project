object datm_exp_saque: Tdatm_exp_saque
  OldCreateOrder = True
  Left = 334
  Top = 321
  Height = 358
  Width = 518
  object ds_proc_exp: TDataSource
    DataSet = qry_proc_exp_
    Left = 38
    Top = 73
  end
  object qry_proc_exp_: TQuery
    OnCalcFields = qry_proc_exp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, DT_EMISSAO, NR_SAQUE, VL_TOT_SAQUE, DT_VCTO_' +
        'SAQUE'
      'FROM TPROCESSO_EXP_SAQUE'
      'WHERE (SUBSTRING(NR_PROCESSO, 1,2) = :CD_UNID_NEG) ORDER BY '
      'NR_PROCESSO')
    Left = 123
    Top = 73
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_proc_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_proc_exp_DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object qry_proc_exp_NR_SAQUE: TStringField
      FieldName = 'NR_SAQUE'
      Size = 10
    end
    object qry_proc_exp_VL_TOT_SAQUE: TFloatField
      FieldName = 'VL_TOT_SAQUE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_proc_exp_DT_VCTO_SAQUE: TDateTimeField
      FieldName = 'DT_VCTO_SAQUE'
    end
    object qry_proc_exp_CalcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 123
    Top = 167
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 39
    Top = 167
  end
  object qry_exp_saque_: TQuery
    BeforeInsert = qry_exp_saque_BeforeInsert
    BeforeEdit = qry_exp_saque_BeforeEdit
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_exp
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TPROCESSO_EXP_SAQUE'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '      NR_SAQUE = :NR_SAQUE     ')
    Left = 123
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end
      item
        DataType = ftString
        Name = 'NR_SAQUE'
        ParamType = ptUnknown
        Size = 11
      end>
    object qry_exp_saque_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_SAQUE.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_saque_DT_VCTO_SAQUE: TDateTimeField
      FieldName = 'DT_VCTO_SAQUE'
      Origin = 'TPROCESSO_EXP_SAQUE.CD_COND_PAGTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_exp_saque_DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Origin = 'TPROCESSO_EXP_SAQUE.DT_VCTO_SAQUE'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_exp_saque_DT_INICIAL: TDateTimeField
      FieldName = 'DT_INICIAL'
      Origin = 'TPROCESSO_EXP_SAQUE.DT_EMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_exp_saque_NR_SAQUE: TStringField
      FieldName = 'NR_SAQUE'
      Origin = 'TPROCESSO_EXP_SAQUE.DT_INICIAL'
      Size = 10
    end
    object qry_exp_saque_QT_DIAS_PAGTO: TIntegerField
      FieldName = 'QT_DIAS_PAGTO'
      Origin = 'TPROCESSO_EXP_SAQUE.NR_SAQUE'
      DisplayFormat = '#000'
      EditFormat = '#000'
    end
    object qry_exp_saque_TP_VCTO: TStringField
      FieldName = 'TP_VCTO'
      Origin = 'TPROCESSO_EXP_SAQUE.QT_DIAS_PAGTO'
      Size = 1
    end
    object qry_exp_saque_TP_EMPRESA_PAGTO: TStringField
      FieldName = 'TP_EMPRESA_PAGTO'
      Origin = 'TPROCESSO_EXP_SAQUE.TP_VCTO'
      Size = 1
    end
    object qry_exp_saque_TX_VALUE: TMemoField
      FieldName = 'TX_VALUE'
      Origin = 'TPROCESSO_EXP_SAQUE.TP_EMPRESA_PAGTO'
      BlobType = ftMemo
    end
    object qry_exp_saque_TX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'TPROCESSO_EXP_SAQUE.TX_VALUE'
      BlobType = ftMemo
    end
    object qry_exp_saque_VL_TOT_SAQUE: TFloatField
      FieldName = 'VL_TOT_SAQUE'
      Origin = 'TPROCESSO_EXP_SAQUE.TX_OBSERVACAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_exp_saque_CD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'TPROCESSO_EXP_SAQUE.NR_PROCESSO'
      Size = 6
    end
    object qry_exp_saque_LookTermoPagto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTermoPagto'
      LookupDataSet = qry_termo_pagto_
      LookupKeyFields = 'CD_TERMO_PAGTO'
      LookupResultField = 'NM_TERMO_PAGTO'
      KeyFields = 'CD_TERMO_PAGTO'
      Size = 40
      Lookup = True
    end
    object qry_exp_saque_NR_PARCELAS: TStringField
      FieldName = 'NR_PARCELAS'
      Origin = 'TPROCESSO_EXP_SAQUE.NR_PROCESSO'
      Size = 3
    end
    object qry_exp_saque_TP_INDICADOR: TStringField
      FieldName = 'TP_INDICADOR'
      Origin = 'TPROCESSO_EXP_SAQUE.NR_PROCESSO'
      Size = 1
    end
    object qry_exp_saque_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPROCESSO_EXP_SAQUE.NR_FATURA'
      FixedChar = True
      Size = 80
    end
  end
  object ds_exp_saque: TDataSource
    DataSet = qry_exp_saque_
    Left = 39
    Top = 120
  end
  object qry_ttp_data_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM '
      'TTP_DATA_SAQUE'
      'ORDER BY CODIGO')
    Left = 415
    Top = 26
    object qry_ttp_data_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_DATA_SAQUE.CODIGO'
      Size = 1
    end
    object qry_ttp_data_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_DATA_SAQUE.CODIGO'
      Size = 30
    end
  end
  object ds_ttp_data: TDataSource
    DataSet = qry_ttp_data_
    Left = 262
    Top = 26
  end
  object qry_ttp_para_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM '
      'TTP_PARA_SAQUE'
      'ORDER BY CODIGO')
    Left = 415
    Top = 73
    object qry_ttp_para_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_PARA_SAQUE.CODIGO'
      Size = 1
    end
    object qry_ttp_para_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_PARA_SAQUE.DESCRICAO'
      Size = 15
    end
  end
  object ds_ttp_para: TDataSource
    DataSet = qry_ttp_para_
    Left = 262
    Top = 73
  end
  object qry_termo_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_TERMO_PAGTO, NM_TERMO_PAGTO, CD_EXPORTADOR, NR_PERIODI' +
        'CIDADE, TP_INDICADOR, NR_PARCELAS'
      'FROM TTERMO_PAGTO '
      'ORDER BY CD_TERMO_PAGTO'
      '')
    Left = 415
    Top = 120
    object qry_termo_pagto_CD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'TTERMO_PAGTO.CD_TERMO_PAGTO'
      Size = 6
    end
    object qry_termo_pagto_NM_TERMO_PAGTO: TStringField
      FieldName = 'NM_TERMO_PAGTO'
      Origin = 'TTERMO_PAGTO.NM_TERMO_PAGTO'
      Size = 50
    end
    object qry_termo_pagto_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TTERMO_PAGTO.CD_EXPORTADOR'
      Size = 5
    end
    object qry_termo_pagto_NR_PERIODICIDADE: TIntegerField
      FieldName = 'NR_PERIODICIDADE'
      Origin = 'TTERMO_PAGTO.NR_PERIODICIDADE'
    end
    object qry_termo_pagto_TP_INDICADOR: TStringField
      FieldName = 'TP_INDICADOR'
      Origin = 'TTERMO_PAGTO.TP_INDICADOR'
      Size = 1
    end
    object qry_termo_pagto_NR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
      Origin = 'TTERMO_PAGTO.NR_PARCELAS'
    end
  end
  object ds_termo_pagto: TDataSource
    DataSet = qry_termo_pagto_
    Left = 262
    Top = 120
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG'
      'FROM TUNID_NEG_PRODUTO '
      'WHERE (CD_UNID_NEG+CD_PRODUTO) IN '
      '               (SELECT (CD_UNID_NEG+CD_PRODUTO) '
      '               FROM TUSUARIO_HABILITACAO '
      '               WHERE CD_USUARIO=:CD_USUARIO'
      '              AND IN_ATIVO='#39'1'#39
      '              AND CD_PRODUTO='#39'02'#39')')
    Left = 123
    Top = 221
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 123
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_ret_data_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DT_CONHECIMENTO AS DT_REALIZACAO'
      'FROM TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 419
    Top = 221
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = '0102EA-0985-09'
      end>
    object qry_ret_data_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFOLLOWUP.DT_REALIZACAO'
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 39
    Top = 26
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_EXPORTADOR, NR_FATURA, DT_FATURA, CD_TERM' +
        'O_PAGTO, VL_TOT_MCV,'
      '       CASE DATEPART( m, DT_FATURA )'
      '          WHEN 1 THEN "JANUARY"'
      '          WHEN 2 THEN "FEBRUARY"'
      '          WHEN 3 THEN "MARCH"'
      '          WHEN 4 THEN "APRIL"'
      '          WHEN 5 THEN "MAY"'
      '          WHEN 6 THEN "JUNE"'
      '          WHEN 7 THEN "JULY"'
      '          WHEN 8 THEN "AUGUST"'
      '          WHEN 9 THEN "SEPTEMBER"'
      '          WHEN 10 THEN "OCTOBER"'
      '          WHEN 11 THEN "NOVEMBER"'
      '          WHEN 12 THEN "DECEMBER"'
      
        '       END + " " + RIGHT( "0" + CONVERT( varchar(2), DATEPART( d' +
        'd, DT_FATURA ) ), 2 ) +'
      
        '       CASE RIGHT( CONVERT( varchar(2), DATEPART( d, DT_FATURA )' +
        ' ), 1 )'
      '          WHEN "1" THEN "ST"'
      '          WHEN "2" THEN "ND"'
      '          ELSE "TH"'
      
        '       END + ", " + CONVERT( char(4), DATEPART( yyyy, DT_FATURA ' +
        ') ) AS STR_DT_FATURA'
      'FROM   TPROCESSO_EXP'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 123
    Top = 26
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPROCESSO_EXP.DT_FATURA'
    end
    object qry_processo_CD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'TPROCESSO_EXP.CD_TERMO_PAGTO'
      Size = 6
    end
    object qry_processo_VL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      Origin = 'TPROCESSO_EXP.DT_FATURA'
    end
    object qry_processo_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 5
    end
    object qry_processo_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 15
    end
    object qry_processo_STR_DT_FATURA: TStringField
      FieldName = 'STR_DT_FATURA'
    end
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '')
    Left = 262
    Top = 272
  end
  object qry_tp_indicador_periodo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT TP_INDICADOR, NM_INDICADOR'
      'FROM TTP_INDICADOR_PERIODO'
      'ORDER BY NM_INDICADOR')
    Left = 415
    Top = 167
    object qry_tp_indicador_periodo_TP_INDICADOR: TStringField
      FieldName = 'TP_INDICADOR'
      Origin = 'TTP_INDICADOR_PERIODO.TP_INDICADOR'
      Size = 1
    end
    object qry_tp_indicador_periodo_NM_INDICADOR: TStringField
      FieldName = 'NM_INDICADOR'
      Origin = 'TTP_INDICADOR_PERIODO.NM_INDICADOR'
    end
  end
  object ds_tp_indicador_periodo: TDataSource
    DataSet = qry_tp_indicador_periodo_
    Left = 262
    Top = 167
  end
  object qry_ret_prev_carregamento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT F.DT_REALIZACAO'
      'FROM TFOLLOWUP F,'
      '     TPARAMETROS P'
      
        'WHERE NR_PROCESSO = :NR_PROCESSO and F.CD_EVENTO = P.CD_EV_PREV_' +
        'CARREGAMENTO')
    Left = 262
    Top = 221
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ret_prev_carregamento_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFOLLOWUP.DT_REALIZACAO'
    end
  end
end
