object datm_lib_proc: Tdatm_lib_proc
  OldCreateOrder = True
  Left = 264
  Top = 85
  Height = 489
  Width = 596
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 216
    Top = 55
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       IN_ATIVO = '#39'1'#39
      '')
    Left = 216
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
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
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM   TPRODUTO'
      'WHERE  CD_PRODUTO = :CD_PRODUTO AND'
      '       IN_ATIVO = '#39'1'#39)
    Left = 216
    Top = 106
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 216
    Top = 154
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 324
    Top = 7
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 324
    Top = 55
  end
  object qry_cliente_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TCLIENTE_HABILITACAO WHERE'
      'IN_ATIVO = '#39'1'#39)
    Left = 65
    Top = 7
    object qry_cliente_habilitacao_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_habilitacao_DT_VALID_CRED_RF: TDateTimeField
      FieldName = 'DT_VALID_CRED_RF'
      Origin = 'TCLIENTE_HABILITACAO.DT_VALID_CRED_RF'
    end
    object qry_cliente_habilitacao_DT_CAPTACAO: TDateTimeField
      FieldName = 'DT_CAPTACAO'
      Origin = 'TCLIENTE_HABILITACAO.DT_CAPTACAO'
    end
    object qry_cliente_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCLIENTE_HABILITACAO.IN_ATIVO'
      Size = 1
    end
    object qry_cliente_habilitacao_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      Origin = 'TCLIENTE_HABILITACAO.TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_cliente_habilitacao_QT_ADIANTAMENTO: TFloatField
      FieldName = 'QT_ADIANTAMENTO'
      Origin = 'TCLIENTE_HABILITACAO.QT_ADIANTAMENTO'
    end
    object qry_cliente_habilitacao_CD_DT_BASE_CAMBIO: TStringField
      FieldName = 'CD_DT_BASE_CAMBIO'
      Origin = 'TCLIENTE_HABILITACAO.CD_DT_BASE_CAMBIO'
      Size = 1
    end
    object qry_cliente_habilitacao_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Origin = 'TCLIENTE_HABILITACAO.CD_TAB_SDA'
      Size = 3
    end
    object qry_cliente_habilitacao_look_nm_cliente: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_cliente'
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 40
      Lookup = True
    end
  end
  object ds_cliente_habilitacao: TDataSource
    DataSet = qry_cliente_habilitacao_
    Left = 64
    Top = 55
  end
  object qry_rel_processo_: TQuery
    OnCalcFields = qry_rel_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.CD_UNID_NEG, P.CD_PRODUTO, P.NR_PROCESSO, P.CD_USUARIO,' +
        ' P.CD_CLIENTE, P.CD_RESTRICAO, E.AP_EMPRESA'
      'FROM   TPROCESSO P,'
      'TEMPRESA_NAC E'
      'WHERE  ( P.CD_UNID_NEG+P.CD_PRODUTO) IN'
      '               ( SELECT CD_UNID_NEG+CD_PRODUTO'
      '                 FROM   TUSUARIO_HABILITACAO'
      '                 WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                        IN_ATIVO = '#39'1'#39' ) AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       P.IN_LIBERADO  = '#39'0'#39' AND'
      '       P.IN_CANCELADO = '#39'0'#39' AND'
      'P.CD_UNID_NEG = :CD_UNID_NEG AND'
      'P.CD_PRODUTO  = :CD_PRODUTO'
      'ORDER BY'
      'P.NR_PROCESSO')
    Left = 216
    Top = 208
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
    object qry_rel_processo_NR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_rel_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_rel_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_rel_processo_CD_CLIENTE: TStringField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_rel_processo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object qry_rel_processo_CD_RESTRICAO: TStringField
      FieldName = 'CD_RESTRICAO'
      Size = 1
    end
    object qry_rel_processo_AP_EMPRESA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_rel_processo_look_ap_usuario: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldKind = fkLookup
      FieldName = 'look_ap_usuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 25
      Lookup = True
    end
    object qry_rel_processo_look_nm_pend: TStringField
      DisplayLabel = 'Pend'#234'ncia'
      FieldKind = fkLookup
      FieldName = 'look_nm_pend'
      LookupDataSet = qry_tp_pend_
      LookupKeyFields = 'CD_PEND'
      LookupResultField = 'NM_PEND'
      KeyFields = 'CD_RESTRICAO'
      Size = 45
      Lookup = True
    end
    object qry_rel_processo_Calc_Nr_Processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Calc_Nr_Processo'
      Size = 18
      Calculated = True
    end
  end
  object ds_rel_processo: TDataSource
    DataSet = qry_rel_processo_
    Left = 216
    Top = 264
  end
  object qry_ult_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_PROCESSO) ULTIMO  FROM TPROCESSO'
      'WHERE CD_UNID_NEG=:CD_UNID_NEG AND '
      'CD_PRODUTO=:CD_PRODUTO')
    Left = 64
    Top = 208
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
      end>
    object qry_ult_processo_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 11
    end
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TUSUARIO_HABILITACAO UH'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39' AND UH.IN_ATIVO='#39'1'#39)
    Left = 448
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 4
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_traz_default_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_traz_default_DT_HABILITACAO: TDateTimeField
      FieldName = 'DT_HABILITACAO'
      Origin = 'TUSUARIO_HABILITACAO.DT_HABILITACAO'
    end
    object qry_traz_default_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO_HABILITACAO.IN_ATIVO'
      Size = 1
    end
    object qry_traz_default_IN_DEFAULT: TStringField
      FieldName = 'IN_DEFAULT'
      Origin = 'TUSUARIO_HABILITACAO.IN_DEFAULT'
      Size = 1
    end
  end
  object ds_traz_default: TDataSource
    DataSet = qry_traz_default_
    Left = 448
    Top = 55
  end
  object qry_cliente_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TCLIENTE_SERVICO WHERE IN_ATIVO = '#39'1'#39)
    Left = 64
    Top = 106
    object qry_cliente_servico_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_servico_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_SERVICO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_servico_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_SERVICO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TCLIENTE_SERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_cliente_servico_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCLIENTE_SERVICO.IN_ATIVO'
      Size = 1
    end
    object qry_cliente_servico_NR_DPS: TStringField
      FieldName = 'NR_DPS'
      Origin = 'TCLIENTE_SERVICO.NR_DPS'
      Size = 8
    end
    object qry_cliente_servico_DT_CAPTACAO: TDateTimeField
      FieldName = 'DT_CAPTACAO'
      Origin = 'TCLIENTE_SERVICO.DT_CAPTACAO'
    end
    object qry_cliente_servico_IN_INCIDE_SDA: TStringField
      FieldName = 'IN_INCIDE_SDA'
      Origin = 'TCLIENTE_SERVICO.IN_INCIDE_SDA'
      Size = 1
    end
    object qry_cliente_servico_PZ_PROPOSTA: TIntegerField
      FieldName = 'PZ_PROPOSTA'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
    end
    object qry_cliente_servico_look_nm_servico: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldKind = fkLookup
      FieldName = 'look_servico'
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 35
      Lookup = True
    end
  end
  object ds_cliente_servico: TDataSource
    Left = 64
    Top = 154
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSERVICO WHERE IN_ATIVO='#39'1'#39)
    Left = 448
    Top = 106
    object qry_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
    object qry_servico_CD_CLASSIFICACAO: TStringField
      FieldName = 'CD_CLASSIFICACAO'
      Origin = 'TSERVICO.CD_CLASSIFICACAO'
      Size = 2
    end
    object qry_servico_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TSERVICO.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_servico_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TSERVICO.IN_ATIVO'
      Size = 1
    end
  end
  object ds_servico: TDataSource
    DataSet = qry_servico_
    Left = 448
    Top = 154
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TUSUARIO WHERE IN_ATIVO='#39'1'#39)
    Left = 324
    Top = 208
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_CD_SENHA: TStringField
      FieldName = 'CD_SENHA'
      Origin = 'TUSUARIO.CD_SENHA'
      Size = 10
    end
    object qry_usuario_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TUSUARIO.CD_CARGO'
      Size = 3
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
    object qry_usuario_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'TUSUARIO.AP_USUARIO'
      Size = 15
    end
    object qry_usuario_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO.IN_ATIVO'
      Size = 1
    end
  end
  object ds_usuario: TDataSource
    DataSet = qry_usuario_
    Left = 324
    Top = 264
  end
  object qry_tp_pend_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTP_PEND ')
    Left = 448
    Top = 208
    object qry_tp_pend_CD_PEND: TStringField
      FieldName = 'CD_PEND'
      Origin = 'TTP_PEND.CD_PEND'
      Size = 1
    end
    object qry_tp_pend_NM_PEND: TStringField
      FieldName = 'NM_PEND'
      Origin = 'TTP_PEND.NM_PEND'
      Size = 30
    end
  end
  object ds_tp_pend: TDataSource
    DataSet = qry_tp_pend_
    Left = 448
    Top = 264
  end
  object qry_processo_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    DataSource = ds_rel_processo
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, CD_PRODUTO, NR_PROCESSO, IN_CANCELADO, IN_LI' +
        'BERADO, CD_LIBERADOR, DT_LIBERACAO'
      'FROM   TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 324
    Top = 106
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TPROCESSO.IN_CANCELADO'
      Size = 1
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TPROCESSO.IN_LIBERADO'
      Size = 1
    end
    object qry_processo_CD_LIBERADOR: TStringField
      FieldName = 'CD_LIBERADOR'
      Origin = 'TPROCESSO.CD_LIBERADOR'
      Size = 4
    end
    object qry_processo_DT_LIBERACAO: TDateTimeField
      FieldName = 'DT_LIBERACAO'
      Origin = 'TPROCESSO.DT_LIBERACAO'
    end
    object qry_processo_calc_nr_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_processo'
      Size = 18
      Calculated = True
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 324
    Top = 154
  end
  object qryUpdateProcesso: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TPROCESSO'
      '   SET IN_LIBERADO  = '#39'1'#39
      '      ,CD_LIBERADOR = :CD_USUARIO'
      '      ,DT_LIBERACAO = GETDATE()'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 65
    Top = 268
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
  end
end
