object datm_consulta_exp_bord: Tdatm_consulta_exp_bord
  Left = 157
  Top = 148
  Height = 144
  Width = 216
  object qry_exp_: TQuery
    OnCalcFields = qry_exp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  NR_PROCESSO, DT_ENVIO, NR_PROTOCOLO, NR_FATURA, DT_FATUR' +
        'A'
      'FROM TPROCESSO_EXP_BORD'
      'WHERE SubString( NR_PROCESSO,1,2) = :CD_UNID_NEG'
      'ORDER BY'
      'NR_PROCESSO'
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
    object qry_exp_DT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
    end
    object qry_exp_NR_PROTOCOLO: TStringField
      FieldName = 'NR_PROTOCOLO'
      Size = 30
    end
    object qry_exp_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Size = 15
    end
    object qry_exp_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
    end
  end
  object ds_exp: TDataSource
    DataSet = qry_exp_
    Left = 24
    Top = 32
  end
end
