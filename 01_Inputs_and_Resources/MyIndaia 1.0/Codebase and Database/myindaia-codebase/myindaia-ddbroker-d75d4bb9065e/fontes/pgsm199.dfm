object datm_retorno_fi: Tdatm_retorno_fi
  Left = 200
  Top = 108
  Height = 288
  Width = 513
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_EST'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Params.Data = {010001000A43445F454D50524553410001020030000000}
    Left = 196
    Top = 28
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_EST.AP_EMPRESA'
      Size = 10
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 36
    Top = 28
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object qry_processo_: TQuery
    Filtered = True
    OnCalcFields = qry_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT(P.CD_UNID_NEG), P.CD_CLIENTE, P.NR_PROCESSO'
      'FROM TPROCESSO P, TPROCESSO_EXP E, TPROCESSO_EXP_RE R'
      'WHERE E.NR_PROCESSO = P.NR_PROCESSO AND'
      '      R.NR_PROCESSO = E.NR_PROCESSO')
    Left = 120
    Top = 28
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_calc_nr_processo: TStringField
      DisplayWidth = 18
      FieldName = 'calc_nr_processo'
      Size = 18
      Calculated = True
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
  end
  object qry_de_para_: TQuery
    Filtered = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EXTERNO'
      'FROM TDE_PARA'
      
        'WHERE (CD_TABELA = '#39'01'#39') AND (CD_DDBROKER = :CD_DDBROKER) AND (C' +
        'D_UNID_NEG = :CD_UNID_NEG) AND (CD_PRODUTO = '#39'02'#39')'
      ''
      '')
    Params.Data = {
      010002000B43445F444442524F4B455200010200300000000B43445F554E4944
      5F4E45470001020030000000}
    Left = 32
    Top = 96
    object qry_de_para_CD_EXTERNO: TStringField
      FieldName = 'CD_EXTERNO'
      Origin = 'TDE_PARA.CD_EXTERNO'
      Size = 15
    end
  end
  object qry_proc_re_: TQuery
    Filtered = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_RE, DT_RE'
      'FROM TPROCESSO_EXP_RE'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 360
    Top = 28
    object qry_proc_re_NR_RE: TStringField
      FieldName = 'NR_RE'
      Origin = 'TPROCESSO_EXP_RE.NR_RE'
      Size = 12
    end
    object qry_proc_re_DT_RE: TDateTimeField
      FieldName = 'DT_RE'
      Origin = 'TPROCESSO_EXP_RE.DT_RE'
    end
  end
  object qry_proc_nf_: TQuery
    Filtered = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_NF'
      'FROM TPROCESSO_EXP_NF'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 440
    Top = 28
    object qry_proc_nf_NR_NF: TStringField
      FieldName = 'NR_NF'
      Origin = 'TPROCESSO_EXP_NF.NR_NF'
      Size = 10
    end
  end
  object qry_proc_saque_: TQuery
    Filtered = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DT_VCTO_SAQUE, VL_TOT_SAQUE'
      'FROM TPROCESSO_EXP_SAQUE'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 280
    Top = 28
    object qry_proc_saque_DT_VCTO_SAQUE: TDateTimeField
      FieldName = 'DT_VCTO_SAQUE'
      Origin = 'TPROCESSO_EXP_SAQUE.DT_VCTO_SAQUE'
    end
    object qry_proc_saque_VL_TOT_SAQUE: TFloatField
      FieldName = 'VL_TOT_SAQUE'
      Origin = 'TPROCESSO_EXP_SAQUE.VL_TOT_SAQUE'
    end
  end
  object qry_proc_exp_: TQuery
    Filtered = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.CD_UNID_NEG, P.CD_CLIENTE, E.NR_PROCESSO, E.CD_IMPORTAD' +
        'OR, E.NR_FATURA, E.DT_FATURA, P.CD_MOEDA_MLE, E.NR_SD'
      'FROM TPROCESSO P, TPROCESSO_EXP E'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO AND'
      '      E.NR_PROCESSO = P.NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 120
    Top = 95
    object qry_proc_exp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_proc_exp_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_proc_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_exp_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPROCESSO_EXP.CD_IMPORTADOR'
      Size = 5
    end
    object qry_proc_exp_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPROCESSO_EXP.NR_FATURA'
      Size = 15
    end
    object qry_proc_exp_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPROCESSO_EXP.DT_FATURA'
    end
    object qry_proc_exp_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TPROCESSO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_proc_exp_NR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'TPROCESSO_EXP.NR_SD'
      Size = 11
    end
  end
  object qry_proc_flp_: TQuery
    Filtered = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DT_REALIZACAO'
      'FROM TFOLLOWUP F, TPARAMETROS P'
      'WHERE F.NR_PROCESSO = :NR_PROCESSO AND'
      '      F.CD_EVENTO = P.CD_EV_EMBARQUE'
      '')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 196
    Top = 95
    object qry_proc_flp_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFOLLOWUP.DT_REALIZACAO'
    end
  end
end
