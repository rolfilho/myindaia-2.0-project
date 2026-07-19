object datm_proc_inspec: Tdatm_proc_inspec
  Left = 200
  Top = 108
  Height = 150
  Width = 559
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
    Left = 132
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
    Left = 132
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
    Left = 240
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
    AfterScroll = qry_tfollowup_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_SERVICO, CD_EVENTO, DT_INSPECAO, '
      '               CD_RESULT_INSPECAO, DT_REALIZACAO, NR_RNC,'
      '               CD_RESP_INSPECAO'
      'FROM TFOLLOWUP'
      'WHERE (NR_PROCESSO = :NR_PROCESSO) AND'
      '               (CD_SERVICO = :CD_SERVICO) AND'
      '               (IN_APLICAVEL = '#39'1'#39') AND'
      '               (DT_REALIZACAO IS NOT NULL)'
      'ORDER BY NR_ORDEM')
    Params.Data = {
      010002000B4E525F50524F434553534F00010200300000000A43445F53455256
      49434F0001020030000000}
    Left = 328
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
    object qry_tfollowup_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
    end
    object qry_tfollowup_NR_RNC: TStringField
      FieldName = 'NR_RNC'
      Origin = 'TFOLLOWUP.CD_SERVICO'
      EditMask = '999;0; '
      Size = 8
    end
    object qry_tfollowup_DT_INSPECAO: TDateTimeField
      FieldName = 'DT_INSPECAO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_tfollowup_CD_RESULT_INSPECAO: TStringField
      FieldName = 'CD_RESULT_INSPECAO'
      Origin = 'TFOLLOWUP.CD_SERVICO'
      Size = 1
    end
    object qry_tfollowup_Look_Evento: TStringField
      FieldName = 'Look_Evento'
      LookupDataSet = qry_tevento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO'
      Size = 50
      Lookup = True
    end
    object qry_tfollowup_CD_RESP_INSPECAO: TStringField
      FieldName = 'CD_RESP_INSPECAO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 4
    end
  end
  object ds_tfollowup: TDataSource
    DataSet = qry_tfollowup_
    Left = 328
    Top = 72
  end
  object qry_tevento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EVENTO, NM_EVENTO'
      'FROM TEVENTO')
    Left = 240
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
  end
end
