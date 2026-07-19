object datm_consulta_exp_saque: Tdatm_consulta_exp_saque
  Left = 157
  Top = 148
  Height = 144
  Width = 216
  object qry_exp_: TQuery
    OnCalcFields = qry_exp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  NR_PROCESSO, NR_SAQUE, DT_VCTO_SAQUE, VL_TOT_SAQUE'
      'FROM TPROCESSO_EXP_SAQUE'
      'WHERE SubString( NR_PROCESSO,1,2) = :CD_UNID_NEG'
      'ORDER BY'
      'NR_PROCESSO+NR_SAQUE'
      '')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 104
    Top = 32
    object qry_exp_CalcNrProcesso: TStringField
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
    object qry_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_exp_NR_SAQUE: TStringField
      FieldName = 'NR_SAQUE'
      Size = 10
    end
    object qry_exp_DT_VCTO_SAQUE: TDateTimeField
      FieldName = 'DT_VCTO_SAQUE'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_exp_VL_TOT_SAQUE: TFloatField
      FieldName = 'VL_TOT_SAQUE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_exp: TDataSource
    DataSet = qry_exp_
    Left = 24
    Top = 32
  end
end
