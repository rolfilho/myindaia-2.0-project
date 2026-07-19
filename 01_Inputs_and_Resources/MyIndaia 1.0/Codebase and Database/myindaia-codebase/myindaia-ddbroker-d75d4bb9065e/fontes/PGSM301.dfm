object datm_trans_nota: Tdatm_trans_nota
  OldCreateOrder = True
  Left = 180
  Top = 157
  Height = 173
  Width = 717
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC (NOLOCK)'
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Left = 24
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_cliente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
  end
  object ds_lista_: TDataSource
    DataSet = qry_lista_
    Left = 104
    Top = 8
  end
  object qry_lista_: TQuery
    OnCalcFields = qry_lista_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT D.NR_PROCESSO, D.NR_DECLARACAO_IMP, P.CD_UNID_NEG, '
      #9'P.CD_PRODUTO'
      'FROM TDECLARACAO_IMPORTACAO D (NOLOCK), TPROCESSO P (NOLOCK)'
      'WHERE D.NR_PROCESSO = P.NR_PROCESSO AND'
      '      P.CD_CLIENTE = :CD_CLIENTE'
      'ORDER BY P.CD_UNID_NEG, P.CD_PRODUTO, P.NR_PROCESSO DESC')
    Left = 177
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    object qry_lista_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_lista_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      FixedChar = True
      Size = 10
    end
    object qry_lista_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_lista_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_lista_NR_PROCESSO_AUX: TStringField
      FieldKind = fkCalculated
      FieldName = 'NR_PROCESSO_AUX'
      Size = 18
      Calculated = True
    end
    object qry_lista_NR_DECLARACAO_IMP_Aux: TStringField
      FieldKind = fkCalculated
      FieldName = 'NR_DECLARACAO_IMP_Aux'
      Calculated = True
    end
  end
end
