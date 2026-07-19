object datm_sda_cancel: Tdatm_sda_cancel
  OldCreateOrder = True
  Left = 237
  Top = 130
  Height = 464
  Width = 588
  object ds_processo_sda: TDataSource
    DataSet = qry_processo_sda_
    Left = 37
    Top = 72
  end
  object qry_processo_sda_: TQuery
    OnCalcFields = qry_processo_sda_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT S.NR_PROCESSO, SUBSTRING( S.NR_PROCESSO, 5, 14 ) AS CalcP' +
        'rocesso, S.IN_CANCEL, S.CD_STATUS,'
      '       E.AP_EMPRESA, SE.NM_SERVICO,'
      
        '       ( ISNULL( S.VL_SDA, 0 ) + ISNULL( S.VL_CONTR_ASSIST, 0 ) ' +
        '+ ISNULL( S.VL_COMPL, 0 ) ) AS VL_SDA'
      
        'FROM   TPROCESSO_SDA S (NOLOCK), TPROCESSO P (NOLOCK), TEMPRESA_' +
        'NAC E (NOLOCK), VW_SERVICO_GERAL SE (NOLOCK)'
      'WHERE  S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       P.CD_SERVICO = SE.CD_SERVICO AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       P.CD_PRODUTO = :CD_PRODUTO AND'
      '       P.CD_CELULA = :CD_CELULA AND'
      '       S.DT_DISTRIBUICAO = :DT_DISTRIBUICAO AND'
      '       P.IN_CANCELADO = '#39'0'#39' AND'
      '       P.IN_LIBERADO = '#39'1'#39' AND'
      '       S.CD_STATUS IN ( '#39'0'#39', '#39'1'#39', '#39'2'#39' )'
      'ORDER BY S.NR_PROCESSO'
      '')
    Left = 37
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_DISTRIBUICAO'
        ParamType = ptUnknown
      end>
    object qry_processo_sda_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_sda_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Size = 1
    end
    object qry_processo_sda_IN_CANCEL: TStringField
      FieldName = 'IN_CANCEL'
      Size = 1
    end
    object qry_processo_sda_AP_EMPRESA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_processo_sda_NM_SERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_processo_sda_VL_SDA: TFloatField
      DisplayLabel = 'Valor S.D.A.'
      FieldName = 'VL_SDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_processo_sda_CalcSelecao: TStringField
      DisplayLabel = ' '
      FieldKind = fkCalculated
      FieldName = 'CalcSelecao'
      Size = 1
      Calculated = True
    end
    object qry_processo_sda_CalcProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldName = 'CalcProcesso'
      Size = 14
    end
    object qry_processo_sda_CalcImpresso: TStringField
      DisplayLabel = 'Imp.'
      FieldKind = fkCalculated
      FieldName = 'CalcImpresso'
      Size = 1
      Calculated = True
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG'
      '')
    Left = 131
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM   TPRODUTO'
      'WHERE  CD_PRODUTO = :CD_PRODUTO')
    Left = 226
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
  end
  object qry_celula_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CELULA, NM_CELULA'
      'FROM   TCELULA'
      'WHERE  CD_CELULA = :CD_CELULA')
    Left = 322
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptUnknown
      end>
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, CD_CELULA'
      'FROM   TUSUARIO U'
      'WHERE  CD_USUARIO = :CD_USUARIO'
      '')
    Left = 410
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qry_atz_todos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TPROCESSO_SDA'
      'SET    IN_CANCEL = :IN_CANCEL,'
      '       CD_USUARIO_CANCEL = :CD_USUARIO_CANCEL'
      'WHERE  NR_PROCESSO IN ( SELECT S.NR_PROCESSO'
      
        '                        FROM   TPROCESSO_SDA S (NOLOCK), TPROCES' +
        'SO P (NOLOCK), TEMPRESA_NAC E (NOLOCK), VW_SERVICO_GERAL SE (NOL' +
        'OCK)'
      '                        WHERE  S.NR_PROCESSO = P.NR_PROCESSO AND'
      '                               P.CD_CLIENTE = E.CD_EMPRESA AND'
      '                               P.CD_SERVICO = SE.CD_SERVICO AND'
      '                               P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '                               P.CD_PRODUTO = :CD_PRODUTO AND'
      '                               P.CD_CELULA = :CD_CELULA AND'
      
        '                               S.DT_DISTRIBUICAO = :DT_DISTRIBUI' +
        'CAO AND'
      '                               P.IN_CANCELADO = '#39'0'#39' AND'
      '                               P.IN_LIBERADO = '#39'1'#39' AND'
      '                               S.CD_STATUS IN ( '#39'1'#39', '#39'2'#39' ) )'
      '')
    Left = 491
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_CANCEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO_CANCEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_DISTRIBUICAO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object StringField2: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.DT_ABERTURA'
      Size = 3
    end
    object StringField3: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 5
    end
    object StringField4: TStringField
      DisplayLabel = 'Processo'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'Calc_nr_processo'
      Size = 14
      Calculated = True
    end
    object StringField5: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 2
    end
    object StringField7: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'NM_SERVICO'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 50
    end
    object StringField8: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 1
    end
    object StringField9: TStringField
      DisplayLabel = ' '
      FieldKind = fkCalculated
      FieldName = 'CalcSelecao'
      Size = 1
      Calculated = True
    end
    object StringField10: TStringField
      FieldName = 'IN_DISTR'
      Origin = 'TPROCESSO_SDA.NR_PROCESSO'
      Size = 1
    end
    object StringField11: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'AP_EMPRESA'
      Origin = 'TPROCESSO_SDA.NR_PROCESSO'
      Size = 10
    end
  end
end
