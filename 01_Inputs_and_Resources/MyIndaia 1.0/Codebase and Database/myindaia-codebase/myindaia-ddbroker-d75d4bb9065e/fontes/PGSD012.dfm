object datm_sda_distr: Tdatm_sda_distr
  OldCreateOrder = True
  Left = 200
  Top = 110
  Height = 225
  Width = 504
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
        'rocesso, P.CD_UNID_NEG, P.CD_PRODUTO, P.CD_CLIENTE, E.AP_EMPRESA' +
        ','
      '       P.CD_SERVICO, SE.NM_SERVICO, S.CD_STATUS, S.IN_DISTR'
      
        'FROM   TPROCESSO P, TPROCESSO_SDA S, TEMPRESA_NAC E, VW_SERVICO_' +
        'GERAL SE'
      'WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       P.CD_SERVICO = SE.CD_SERVICO AND'
      '       P.IN_CANCELADO = '#39'0'#39' AND'
      '       P.IN_LIBERADO = '#39'1'#39' AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       P.CD_PRODUTO = :CD_PRODUTO AND'
      '       P.CD_CELULA = :CD_CELULA AND'
      '       S.CD_STATUS = '#39'0'#39' AND'
      '       S.VL_SDA <> '#39'0'#39
      'ORDER BY'
      'P.DT_ABERTURA DESC, P.NR_PROCESSO')
    Left = 37
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptInput
      end>
    object qry_processo_sda_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_sda_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.DT_ABERTURA'
      Size = 3
    end
    object qry_processo_sda_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 5
    end
    object qry_processo_sda_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 2
    end
    object qry_processo_sda_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 2
    end
    object qry_processo_sda_NM_SERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'NM_SERVICO'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 50
    end
    object qry_processo_sda_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 1
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
    object qry_processo_sda_IN_DISTR: TStringField
      FieldName = 'IN_DISTR'
      Origin = 'TPROCESSO_SDA.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_sda_AP_EMPRESA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'AP_EMPRESA'
      Origin = 'TPROCESSO_SDA.NR_PROCESSO'
      Size = 10
    end
  end
  object sp_distribui_sda: TStoredProc
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    StoredProcName = 'dbo.sp_distribui_sda'
    Left = 415
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
        Name = '@cd_usuario'
        ParamType = ptInput
      end>
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG'
      '')
    Left = 140
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM   TPRODUTO'
      'WHERE  CD_PRODUTO = :CD_PRODUTO')
    Left = 235
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC'
      '')
    Left = 140
    Top = 72
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
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM VW_SERVICO_GERAL')
    Left = 235
    Top = 72
    object qry_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'VW_SERVICO_GERAL.CD_SERVICO'
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'VW_SERVICO_GERAL.NM_SERVICO'
      Size = 50
    end
  end
  object qry_verifica_sda_hab_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo_sda
    SQL.Strings = (
      'SELECT TP_TAB_SDA, CD_TAB_SDA'
      'FROM   TCLIENTE_HABILITACAO'
      
        'WHERE  CD_CLIENTE = :CD_CLIENTE AND CD_UNID_NEG = :CD_UNID_NEG A' +
        'ND CD_PRODUTO = :CD_PRODUTO AND IN_ATIVO = '#39'1'#39
      '')
    Left = 415
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    object qry_verifica_sda_hab_TP_TAB_SDA: TStringField
      FieldName = 'TP_TAB_SDA'
      Origin = 'TCLIENTE_HABILITACAO.TP_TAB_SDA'
      Size = 1
    end
    object qry_verifica_sda_hab_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Origin = 'TCLIENTE_HABILITACAO.CD_TAB_SDA'
      Size = 3
    end
  end
  object qry_verifica_sda_serv_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo_sda
    SQL.Strings = (
      'SELECT CD_TAB_SDA'
      'FROM   TCLIENTE_SERVICO'
      'WHERE  CD_CLIENTE = :CD_CLIENTE AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_SERVICO = :CD_SERVICO AND'
      '       IN_ATIVO = '#39'1'#39
      '')
    Left = 415
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptInput
      end>
    object qry_verifica_sda_serv_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Origin = 'TCLIENTE_SERVICO.CD_TAB_SDA'
      Size = 3
    end
  end
  object qry_celula_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CELULA, NM_CELULA'
      'FROM   TCELULA'
      'WHERE  CD_CELULA = :CD_CELULA')
    Left = 320
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptInput
      end>
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, CD_CELULA'
      'FROM   TUSUARIO U'
      'WHERE  CD_USUARIO = :CD_USUARIO'
      '')
    Left = 320
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
  end
  object qry_atz_todos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TPROCESSO_SDA'
      'SET    IN_DISTR = :IN_DISTR,'
      '       CD_USUARIO_DISTR = :CD_USUARIO_DISTR'
      'WHERE  NR_PROCESSO IN ( SELECT S.NR_PROCESSO'
      
        '                        FROM   TPROCESSO P, TPROCESSO_SDA S, TEM' +
        'PRESA_NAC E, VW_SERVICO_GERAL SE'
      '                        WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '                               P.IN_CANCELADO = '#39'0'#39' AND'
      '                               P.IN_LIBERADO = '#39'1'#39' AND'
      '                               P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '                               P.CD_PRODUTO = :CD_PRODUTO AND'
      '                               P.CD_CELULA = :CD_CELULA AND'
      '                               S.CD_STATUS = '#39'0'#39' AND'
      '                               ( VL_MLE_MN + VL_CIF_MN ) > 0 )')
    Left = 37
    Top = 124
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_DISTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO_DISTR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptInput
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
