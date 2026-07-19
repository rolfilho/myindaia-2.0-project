object datm_imp_varias_di: Tdatm_imp_varias_di
  Left = 200
  Top = 108
  Height = 135
  Width = 278
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Params.Data = {010001000A43445F454D50524553410001020030000000}
    Left = 196
    Top = 28
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
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
      'SELECT P.CD_UNID_NEG, P.CD_CLIENTE, D.NR_PROCESSO'
      'FROM TPROCESSO P, TDECLARACAO_IMPORTACAO D'
      'WHERE P.NR_PROCESSO = D.NR_PROCESSO AND'
      'IN_PRODUCAO = '#39'1'#39' AND'
      'IN_CANCELADO = '#39'0'#39' AND'
      'IN_LIBERADO = '#39'1'#39)
    Left = 116
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
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
  end
end
