object datm_rel_extrato_cc: Tdatm_rel_extrato_cc
  OldCreateOrder = True
  Left = 366
  Top = 333
  Height = 150
  Width = 395
  object qry_coligada_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_COLIGADA, NM_COLIGADA'
      'FROM TCOLIGADA'
      'WHERE CD_COLIGADA <> '#39#39)
    Left = 130
    Top = 28
    object qry_coligada_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCOLIGADA.CD_COLIGADA'
      Size = 2
    end
    object qry_coligada_NM_COLIGADA: TStringField
      FieldName = 'NM_COLIGADA'
      Origin = 'TCOLIGADA.NM_COLIGADA'
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 291
    Top = 28
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO'
      'WHERE CD_BANCO <> '#39#39)
    Left = 207
    Top = 28
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
  end
  object sp_rel_extrato_cc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_extrato_cc'
    Left = 41
    Top = 28
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
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@dt_inicio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@dt_fim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_conciliacao'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
end
