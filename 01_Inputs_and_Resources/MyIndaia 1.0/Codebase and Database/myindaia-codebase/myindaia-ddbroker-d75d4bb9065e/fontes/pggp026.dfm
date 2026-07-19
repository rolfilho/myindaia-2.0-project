object datm_consulta_exp: Tdatm_consulta_exp
  Left = 157
  Top = 148
  Height = 144
  Width = 216
  object qry_exp_: TQuery
    OnCalcFields = qry_exp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  P.NR_PROCESSO, P.CD_EXPORTADOR, E.AP_EMPRESA, P.DT_REGIS' +
        'TRO_PEDIDO, P.CD_INCOTERM'
      'FROM TPROCESSO_EXP P,'
      'TEMPRESA_NAC E'
      'WHERE P.CD_EXPORTADOR *= E.CD_EMPRESA'
      'ORDER BY'
      'P.NR_PROCESSO'
      '')
    Left = 104
    Top = 32
    object qry_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_exp_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Size = 5
    end
    object qry_exp_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_exp_DT_REGISTRO_PEDIDO: TDateTimeField
      FieldName = 'DT_REGISTRO_PEDIDO'
    end
    object qry_exp_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Size = 3
    end
    object qry_exp_CalcNrProcesso: TStringField
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
  end
  object ds_exp: TDataSource
    DataSet = qry_exp_
    Left = 24
    Top = 32
  end
end
