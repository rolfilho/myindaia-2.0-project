object datm_exp: Tdatm_exp
  OldCreateOrder = True
  Left = 200
  Top = 104
  Height = 279
  Width = 166
  object ds_exp: TDataSource
    DataSet = qry_exp_
    Left = 25
  end
  object qry_exp_: TQuery
    BeforeEdit = qry_exp_BeforeEdit
    OnCalcFields = qry_exp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT PE.NR_PROCESSO, PE.DT_REGISTRO_PEDIDO, PE.CD_EXPORTADOR, ' +
        'E.NM_EMPRESA NM_EXPORTADOR'
      'FROM   TPROCESSO_EXP PE (NOLOCK), TEMPRESA_NAC E (NOLOCK)'
      'WHERE  PE.CD_EXPORTADOR *= E.CD_EMPRESA'
      '  AND  SUBSTRING( PE.NR_PROCESSO, 1, 2 ) = :CD_UNID_NEG'
      '  AND  DT_REGISTRO_PEDIDO > :DT_CONS_PROC'
      'ORDER BY'
      'NR_PROCESSO')
    Left = 97
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftDate
        Name = 'DT_CONS_PROC'
        ParamType = ptInput
      end>
    object qry_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_DT_REGISTRO_PEDIDO: TDateTimeField
      FieldName = 'DT_REGISTRO_PEDIDO'
      Origin = 'TPE.DT_REGISTRO_PEDIDO'
    end
    object qry_exp_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPE.NR_PROCESSO'
      Size = 5
    end
    object qry_exp_CalcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
    object qry_exp_NM_EXPORTADOR: TStringField
      DisplayLabel = 'Exportador'
      FieldName = 'NM_EXPORTADOR'
      Size = 50
    end
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC (NOLOCK)'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 96
    Top = 46
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 25
    Top = 46
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '')
    Left = 60
    Top = 192
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_UNID_NEG'
      'FROM TUNID_NEG (NOLOCK)'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 60
    Top = 100
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
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG'
      'FROM TUNID_NEG_PRODUTO (NOLOCK) '
      'WHERE (CD_UNID_NEG+CD_PRODUTO) IN '
      '               (SELECT (CD_UNID_NEG+CD_PRODUTO) '
      '               FROM TUSUARIO_HABILITACAO '
      '               WHERE CD_USUARIO=:CD_USUARIO'
      '              AND IN_ATIVO='#39'1'#39
      '              AND CD_PRODUTO='#39'02'#39')')
    Left = 60
    Top = 146
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
end
