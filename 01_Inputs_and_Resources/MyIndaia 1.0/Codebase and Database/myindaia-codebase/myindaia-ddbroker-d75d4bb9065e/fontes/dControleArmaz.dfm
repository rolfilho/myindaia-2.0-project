object datm_controle_armazenagem: Tdatm_controle_armazenagem
  OldCreateOrder = True
  Left = 454
  Top = 142
  Height = 419
  Width = 395
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG IN '
      '              ( SELECT CD_UNID_NEG '
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Left = 87
    Top = 28
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO IN '
      '              ( SELECT CD_PRODUTO'
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Left = 188
    Top = 28
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Size = 10
    end
    object qry_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object qry_armazem_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ARMAZEM, NM_ARMAZEM  FROM'
      'TARMAZEM'
      'WHERE CD_ARMAZEM=:CD_ARMAZEM')
    Left = 79
    Top = 92
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end>
    object qry_armazem_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TARMAZEM.CD_ARMAZEM'
      Size = 4
    end
    object qry_armazem_NM_ARMAZEM: TStringField
      FieldName = 'NM_ARMAZEM'
      Origin = 'TARMAZEM.NM_ARMAZEM'
      Size = 50
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO_HABILITACAO'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      '               CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO')
    Left = 199
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
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
      end>
    object qry_usuario_habilitacao_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO_HABILITACAO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_arm_vencido_: TQuery
    OnCalcFields = qry_arm_vencido_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT PA.NR_PROCESSO,NR_PERIODO, P.CD_ARMAZEM_DESCARGA, PA.CD_T' +
        'ABELA, PA.DT_VENCTO, E.CD_EMPRESA, E.NM_EMPRESA'
      'FROM TPROCESSO_ARMAZENAGEM PA,  TPROCESSO P, TEMPRESA_NAC E'
      'WHERE ISNULL(PA.DT_PAGTO, 0) = 0'
      'AND PA.DT_VENCTO BETWEEN :DT_INICIO AND :DT_FIM'
      
        'AND ((SUBSTRING(PA.NR_PROCESSO, 1,2)=:CD_UNID_NEG) OR (:CD_UNID_' +
        'NEG = '#39'X'#39'))'
      
        'AND ((SUBSTRING(PA.NR_PROCESSO, 3,2)=:CD_PRODUTO) OR (:CD_PRODUT' +
        'O = '#39'X'#39'))'
      'AND PA.NR_PROCESSO = P.NR_PROCESSO'
      
        'AND ((P.CD_ARMAZEM_DESCARGA =:CD_ARMAZEM) OR (:CD_ARMAZEM = '#39'X'#39')' +
        ') '
      'AND ISNULL(PA.IN_PRORROG, '#39#39') = '#39#39
      'AND P.CD_CLIENTE = E.CD_EMPRESA'
      'ORDER BY  PA.NR_PROCESSO')
    Left = 96
    Top = 168
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_FIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Value = '02'
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Value = '02'
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
        Value = 'X'
      end
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
        Value = 'X'
      end>
    object qry_arm_vencido_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_arm_vencido_NR_PERIODO: TIntegerField
      FieldName = 'NR_PERIODO'
    end
    object qry_arm_vencido_NrCalcProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'NrCalcProcesso'
      Size = 15
      Calculated = True
    end
    object qry_arm_vencido_CD_ARMAZEM_DESCARGA: TStringField
      FieldName = 'CD_ARMAZEM_DESCARGA'
      Size = 4
    end
    object qry_arm_vencido_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Size = 3
    end
    object qry_arm_vencido_DT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
    end
    object qry_arm_vencido_LookArmazem: TStringField
      FieldKind = fkLookup
      FieldName = 'LookArmazem'
      LookupDataSet = qry_armazem_
      LookupKeyFields = 'CD_ARMAZEM'
      LookupResultField = 'NM_ARMAZEM'
      KeyFields = 'CD_ARMAZEM_DESCARGA'
      Size = 60
      Lookup = True
    end
    object qry_arm_vencido_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Size = 5
    end
    object qry_arm_vencido_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
  end
  object ds_arm_vencido: TDataSource
    DataSet = qry_arm_vencido_
    Left = 192
    Top = 168
  end
  object qry_arm_tabela_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TARM_TABELA WHERE CD_ARMAZEM =:CD_ARMAZEM'
      'AND CD_TABELA =:CD_TABELA')
    Left = 80
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_TABELA'
        ParamType = ptUnknown
      end>
    object qry_arm_tabela_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TARM_TABELA.CD_ARMAZEM'
      Size = 4
    end
    object qry_arm_tabela_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TARM_TABELA.CD_TABELA'
      Size = 3
    end
    object qry_arm_tabela_NM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'TARM_TABELA.NM_TABELA'
      Size = 50
    end
    object qry_arm_tabela_IN_PADRAO: TStringField
      FieldName = 'IN_PADRAO'
      Origin = 'TARM_TABELA.IN_PADRAO'
      Size = 1
    end
    object qry_arm_tabela_IN_SABDOM: TStringField
      FieldName = 'IN_SABDOM'
      Origin = 'TARM_TABELA.IN_SABDOM'
      Size = 1
    end
    object qry_arm_tabela_IN_FERIADO: TStringField
      FieldName = 'IN_FERIADO'
      Origin = 'TARM_TABELA.IN_FERIADO'
      Size = 1
    end
    object qry_arm_tabela_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TARM_TABELA.IN_ATIVO'
      Size = 1
    end
  end
  object qry_arm_tab_periodo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TARM_TAB_PERIODO'
      'WHERE CD_ARMAZEM =:CD_ARMAZEM'
      'AND CD_TABELA =:CD_TABELA')
    Left = 248
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_TABELA'
        ParamType = ptUnknown
      end>
    object qry_arm_tab_periodo_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TARM_TAB_PERIODO.CD_ARMAZEM'
      Size = 4
    end
    object qry_arm_tab_periodo_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TARM_TAB_PERIODO.CD_TABELA'
      Size = 3
    end
    object qry_arm_tab_periodo_NR_PERIODO: TIntegerField
      FieldName = 'NR_PERIODO'
      Origin = 'TARM_TAB_PERIODO.NR_PERIODO'
    end
    object qry_arm_tab_periodo_QT_DIAS: TIntegerField
      FieldName = 'QT_DIAS'
      Origin = 'TARM_TAB_PERIODO.QT_DIAS'
    end
    object qry_arm_tab_periodo_VL_PERCENTUAL: TFloatField
      FieldName = 'VL_PERCENTUAL'
      Origin = 'TARM_TAB_PERIODO.VL_PERCENTUAL'
    end
    object qry_arm_tab_periodo_VL_TX_ADICIONAL: TFloatField
      FieldName = 'VL_TX_ADICIONAL'
      Origin = 'TARM_TAB_PERIODO.VL_TX_ADICIONAL'
    end
  end
  object qry_feriado_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TFERIADO'
      'WHERE DT_FERIADO=:DATA')
    Left = 96
    Top = 312
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object qry_feriado_DT_FERIADO: TDateTimeField
      FieldName = 'DT_FERIADO'
      Origin = 'TFERIADO.DT_FERIADO'
    end
    object qry_feriado_NM_FERIADO: TStringField
      FieldName = 'NM_FERIADO'
      Origin = 'TFERIADO.NM_FERIADO'
      Size = 50
    end
  end
  object qry_armazem_processo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TPROCESSO_ARMAZENAGEM'
      'WHERE NR_PROCESSO =:NR_PROCESSO')
    Left = 208
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_armazem_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_ARMAZENAGEM.NR_PROCESSO'
      Size = 18
    end
    object qry_armazem_processo_NR_PERIODO: TIntegerField
      FieldName = 'NR_PERIODO'
      Origin = 'TPROCESSO_ARMAZENAGEM.NR_PERIODO'
    end
    object qry_armazem_processo_DT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
      Origin = 'TPROCESSO_ARMAZENAGEM.DT_VENCTO'
    end
    object qry_armazem_processo_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TPROCESSO_ARMAZENAGEM.DT_PAGTO'
    end
    object qry_armazem_processo_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TPROCESSO_ARMAZENAGEM.CD_TABELA'
      Size = 3
    end
    object qry_armazem_processo_IN_PRORROG: TStringField
      FieldName = 'IN_PRORROG'
      Origin = 'TPROCESSO_ARMAZENAGEM.NR_PROCESSO'
      Size = 1
    end
    object qry_armazem_processo_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'DBBROKER.TPROCESSO_ARMAZENAGEM.CD_ARMAZEM'
      FixedChar = True
      Size = 4
    end
  end
end
