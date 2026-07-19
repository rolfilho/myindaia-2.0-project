object datm_evento_realizacao: Tdatm_evento_realizacao
  Left = 104
  Top = 194
  Height = 171
  Width = 696
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO,'
      '               P.CD_CLIENTE, P.CD_SERVICO, P.IN_LIBERADO,'
      '               P.IN_CANCELADO, P.IN_PRODUCAO,'
      '              C.AP_EMPRESA, S.NM_SERVICO'
      'FROM TPROCESSO P, TEMPRESA_NAC C, TSERVICO S'
      'WHERE (P.CD_CLIENTE *= C.CD_EMPRESA) AND'
      '              (P.CD_SERVICO *= S.CD_SERVICO) AND'
      '              (P.NR_PROCESSO = :NR_PROCESSO)')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 20
    Top = 12
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_processo_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_processo_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Size = 1
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Size = 1
    end
    object qry_processo_IN_PRODUCAO: TStringField
      FieldName = 'IN_PRODUCAO'
      Size = 1
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 20
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
    Left = 119
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
      '               CD_PRODUTO = :CD_PRODUTO'
      ''
      '               ')
    Params.Data = {
      010003000A43445F5553554152494F00010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F0001020030000000}
    Left = 119
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
    Left = 220
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
  object qry_tfollowup_: TQuery
    BeforePost = qry_tfollowup_BeforePost
    DatabaseName = 'DBBROKER'
    DataSource = ds_followup_lista
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_SERVICO, CD_EVENTO, CD_RESP_REALIZACAO, D' +
        'T_REALIZACAO,'
      '               CD_RESP_INSPECAO, DT_INSPECAO, CD_RESULT_INSPECAO'
      'FROM TFOLLOWUP'
      'WHERE (NR_PROCESSO = :NR_PROCESSO) and'
      '               (CD_SERVICO = :CD_SERVICO) and'
      '               (CD_EVENTO = :CD_EVENTO) '
      'ORDER BY NR_ORDEM')
    Params.Data = {
      010003000B4E525F50524F434553534F000000000A43445F5345525649434F00
      0000000943445F4556454E544F0001020030000000}
    Left = 404
    Top = 12
    object qry_tfollowup_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 18
    end
    object qry_tfollowup_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TFOLLOWUP.CD_SERVICO'
      Size = 3
    end
    object qry_tfollowup_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TFOLLOWUP.CD_EVENTO'
      Size = 3
    end
    object qry_tfollowup_CD_RESP_INSPECAO: TStringField
      FieldName = 'CD_RESP_INSPECAO'
      Origin = 'TFOLLOWUP.CD_RESP_INSPECAO'
      Size = 4
    end
    object qry_tfollowup_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFOLLOWUP.DT_REALIZACAO'
    end
    object qry_tfollowup_CD_RESP_REALIZACAO: TStringField
      FieldName = 'CD_RESP_REALIZACAO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 4
    end
    object qry_tfollowup_DT_INSPECAO: TDateTimeField
      FieldName = 'DT_INSPECAO'
      Origin = 'TFOLLOWUP.CD_SERVICO'
    end
    object qry_tfollowup_CD_RESULT_INSPECAO: TStringField
      FieldName = 'CD_RESULT_INSPECAO'
      Origin = 'TFOLLOWUP.CD_EVENTO'
      Size = 1
    end
  end
  object ds_tfollowup: TDataSource
    DataSet = qry_tfollowup_
    Left = 404
    Top = 72
  end
  object qry_tevento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EVENTO, NM_EVENTO, IN_INSPECIONAVEL'
      'FROM TEVENTO'
      'WHERE CD_EVENTO = :CD_EVENTO')
    Params.Data = {010001000943445F4556454E544F0001020030000000}
    Left = 220
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
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC E, TPROCESSO P'
      'WHERE (E.CD_EMPRESA = P.CD_CLIENTE) '
      '')
    Left = 496
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
  object qry_servico: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO')
    Left = 596
    Top = 12
    object qry_servicoCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_servicoNM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
  end
  object qry_tfollowup_1_: TQuery
    BeforePost = qry_tfollowup_1_BeforePost
    AfterPost = qry_tfollowup_1_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_SERVICO, CD_EVENTO, CD_RESP_REALIZACAO, D' +
        'T_REALIZACAO,'
      
        '               CD_RESP_INSPECAO, DT_INSPECAO, CD_RESULT_INSPECAO' +
        ', IN_BLOQUEADO'
      'FROM TFOLLOWUP'
      'WHERE (CD_EVENTO = :CD_EVENTO) and'
      '               (NR_PROCESSO = :NR_PROCESSO)'
      'ORDER BY NR_ORDEM')
    Params.Data = {
      010002000943445F4556454E544F00010200300000000B4E525F50524F434553
      534F0001020030000000}
    Left = 496
    Top = 72
    object qry_tfollowup_1_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 18
    end
    object qry_tfollowup_1_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TFOLLOWUP.CD_SERVICO'
      Size = 3
    end
    object qry_tfollowup_1_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TFOLLOWUP.CD_EVENTO'
      Size = 3
    end
    object qry_tfollowup_1_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFOLLOWUP.DT_REALIZACAO'
    end
    object qry_tfollowup_1_CD_RESP_REALIZACAO: TStringField
      FieldName = 'CD_RESP_REALIZACAO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 4
    end
    object qry_tfollowup_1_CD_RESP_INSPECAO: TStringField
      FieldName = 'CD_RESP_INSPECAO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 4
    end
    object qry_tfollowup_1_DT_INSPECAO: TDateTimeField
      FieldName = 'DT_INSPECAO'
      Origin = 'TFOLLOWUP.CD_SERVICO'
    end
    object qry_tfollowup_1_CD_RESULT_INSPECAO: TStringField
      FieldName = 'CD_RESULT_INSPECAO'
      Origin = 'TFOLLOWUP.CD_EVENTO'
      Size = 1
    end
    object qry_tfollowup_1_IN_BLOQUEADO: TStringField
      FieldName = 'IN_BLOQUEADO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 1
    end
  end
  object sp_atz_followup: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_followup'
    Params.Data = {
      0100020006526573756C74040304000000000000000C406E725F70726F636573
      736F0101020030000000}
    Left = 596
    Top = 72
  end
  object qry_followup_lista_: TQuery
    OnCalcFields = qry_followup_lista_CalcFields
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
    Left = 316
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
      Size = 5
      Lookup = True
    end
    object qry_followup_lista_Look_Servico: TStringField
      FieldName = 'Look_Servico'
      LookupDataSet = qry_servico
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
  end
  object ds_followup_lista: TDataSource
    DataSet = qry_followup_lista_
    Left = 316
    Top = 72
  end
end
