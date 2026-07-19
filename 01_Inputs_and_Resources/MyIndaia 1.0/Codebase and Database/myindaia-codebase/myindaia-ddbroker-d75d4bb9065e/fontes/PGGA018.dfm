object datm_veiculo_realizacao: Tdatm_veiculo_realizacao
  Left = 16
  Top = 149
  Height = 171
  Width = 751
  object qry_processo_por_veiculo_: TQuery
    OnCalcFields = qry_processo_por_veiculo_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, NM_CLIENTE, NM_SERVICO, IN_POR_VEICULO'
      'FROM   TPROCESSO_POR_VEICULO'
      'WHERE CD_USUARIO = :CD_USUARIO')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 60
    Top = 12
    object qry_processo_por_veiculo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_POR_VEICULO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_por_veiculo_NM_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NM_CLIENTE'
      Origin = 'TPROCESSO_POR_VEICULO.NM_CLIENTE'
      Size = 50
    end
    object qry_processo_por_veiculo_NM_SERVICO: TStringField
      DisplayLabel = 'Serviço'
      FieldName = 'NM_SERVICO'
      Origin = 'TPROCESSO_POR_VEICULO.NM_SERVICO'
      Size = 50
    end
    object qry_processo_por_veiculo_IN_POR_VEICULO: TStringField
      FieldName = 'IN_POR_VEICULO'
      Origin = 'TPROCESSO_POR_VEICULO.IN_POR_VEICULO'
      Size = 1
    end
    object qry_processo_por_veiculo_CalcNrProcesso: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
  end
  object ds_processo_por_veiculo: TDataSource
    DataSet = qry_processo_por_veiculo_
    Left = 60
    Top = 72
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG IN '
      '              ( SELECT CD_UNID_NEG '
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 279
    Top = 12
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
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO_HABILITACAO'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      '               CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO')
    Params.Data = {
      010003000A43445F5553554152494F00010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F0001020030000000}
    Left = 279
    Top = 72
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
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO IN '
      '              ( SELECT CD_PRODUTO'
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 380
    Top = 12
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
  object qry_tevento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EVENTO, NM_EVENTO, IN_INSPECIONAVEL'
      'FROM TEVENTO'
      'WHERE CD_EVENTO = :CD_EVENTO')
    Params.Data = {010001000943445F4556454E544F0001020030000000}
    Left = 380
    Top = 72
    object qry_tevento_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 3
    end
    object qry_tevento_NM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Origin = 'TEVENTO.NM_EVENTO'
      Size = 50
    end
    object qry_tevento_IN_INSPECIONAVEL: TStringField
      FieldName = 'IN_INSPECIONAVEL'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 1
    end
  end
  object qry_empresa_nac_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC E, TPROCESSO P'
      'WHERE (E.CD_EMPRESA = P.CD_CLIENTE) '
      '')
    Left = 568
    Top = 12
    object qry_empresa_nac_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object qry_embarcacao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMBARCACAO, NM_EMBARCACAO'
      'FROM TEMBARCACAO'
      'WHERE CD_EMBARCACAO = :CD_EMBARCACAO AND'
      'IN_ATIVO = '#39'1'#39)
    Params.Data = {010001000D43445F454D424152434143414F0001020030000000}
    Left = 668
    Top = 12
  end
  object sp_atz_veiculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_veiculo'
    Params.Data = {
      0100040006526573756C74040304000000000000010A4063645F6576656E746F
      01010200300000000E4064745F7265616C697A6163616F010B080000002C845D
      40CB4200000B4063645F7573756172696F0101020030000000}
    Left = 668
    Top = 72
  end
  object qry_followup_lista_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT F.NR_PROCESSO, F.CD_SERVICO, F.CD_EVENTO'
      'FROM TFOLLOWUP F'
      'JOIN   TPROCESSO P'
      'ON      (F.NR_PROCESSO = P.NR_PROCESSO)'
      'WHERE (F.DT_REALIZACAO = :DT_REALIZACAO) and'
      '               (F.CD_EVENTO = :CD_EVENTO) and'
      '               (F.IN_APLICAVEL = '#39'1'#39')  and'
      '               (P.CD_UNID_NEG = :CD_UNID_NEG) and'
      '               (P.CD_PRODUTO = :CD_PRODUTO)'
      'ORDER BY F.NR_ORDEM')
    Params.Data = {
      010004000D44545F5245414C495A4143414F000B080000002C845D40CB420000
      0943445F4556454E544F00010200300000000B43445F554E49445F4E45470001
      0200300000000A43445F50524F4455544F0001020030000000}
    Left = 476
    Top = 12
    object qry_followup_lista_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 18
    end
    object qry_followup_lista_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TFOLLOWUP.CD_SERVICO'
      Size = 3
    end
    object qry_followup_lista_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TFOLLOWUP.CD_EVENTO'
      Size = 3
    end
    object qry_followup_lista_Look_nm_empresa: TStringField
      FieldName = 'Look_nm_empresa'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'NR_PROCESSO'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'NR_PROCESSO'
      Size = 50
      Lookup = True
    end
    object qry_followup_lista_nr_processo_calc: TStringField
      DisplayWidth = 14
      FieldName = 'nr_processo_calc'
      Size = 14
      Calculated = True
    end
    object qry_followup_lista_Look_cd_cliente: TStringField
      FieldName = 'Look_cd_cliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'NR_PROCESSO'
      LookupResultField = 'CD_EMPRESA'
      KeyFields = 'NR_PROCESSO'
      Size = 4
      Lookup = True
    end
    object qry_followup_lista_Look_Servico: TStringField
      FieldName = 'Look_Servico'
      LookupDataSet = qry_embarcacao_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
  end
  object ds_followup_lista: TDataSource
    DataSet = qry_followup_lista_
    Left = 476
    Top = 72
  end
  object qry_servico_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO')
    Left = 567
    Top = 72
  end
  object qry_exec_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 174
    Top = 72
  end
  object qry_viagem_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT NR_VIAGEM'
      'FROM   TVIAGEM'
      'WHERE  CD_UNID_NEG   = :CD_UNID_NEG AND'
      '       CD_PRODUTO    = :CD_PRODUTO AND'
      '       CD_EMBARCACAO = :CD_EMBARCACAO AND'
      '       NR_VIAGEM     = :NR_VIAGEM'
      '')
    Params.Data = {
      010004000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F00010200300000000D43445F454D424152434143414F00010200300000
      00094E525F56494147454D0001020030000000}
    Left = 174
    Top = 12
  end
end
