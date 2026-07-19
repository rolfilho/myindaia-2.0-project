object datm_duplica_param_cli: Tdatm_duplica_param_cli
  OldCreateOrder = True
  Left = 363
  Top = 127
  Height = 116
  Width = 289
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Left = 32
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
  end
  object sp_duplica_param_cli: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_duplica_param_cli'
    Left = 128
    Top = 20
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_cliente_fonte'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente_destino'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_servico'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@in_num'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@in_fat'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@in_item'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@in_repres'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CD_SERVICO_FONTE'
        ParamType = ptInput
      end>
  end
end
