object datm_sel_unid_prod_cli_arm: Tdatm_sel_unid_prod_cli_arm
  Left = 200
  Top = 108
  Height = 457
  Width = 551
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 44
    Top = 20
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Params.Data = {010001000A43445F434C49454E54450001020030000100}
    Left = 133
    Top = 20
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
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TGRUPO'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Params.Data = {010001000843445F475255504F0001020030000000}
    Left = 44
    Top = 85
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO.NM_GRUPO'
      Size = 50
    end
    object qry_grupo_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'TGRUPO.DT_INCLUSAO'
    end
    object qry_grupo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TGRUPO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 133
    Top = 85
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
  object sp_rel_cliente_arm: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_cliente_arm'
    Params.Data = {
      01000A0006526573756C74040304000000000000010C4063645F756E69645F6E
      656701010200300000000B4063645F70726F6475746F01010200300000000940
      63645F677275706F01010200300000000B4063645F636C69656E746501010200
      300000000B4063645F61726D617A656D01010200300000000B4063645F736572
      7669636F01010200300000000A4064745F696E6963696F010102003000000007
      4064745F66696D010102003000000011406E725F6964656E746966696361646F
      7203030400010000000001}
    Left = 241
    Top = 17
  end
  object qry_amz_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_ARMAZEM, NM_ARMAZEM '
      'FROM TARMAZEM'
      'WHERE CD_ARMAZEM = :CD_ARMAZEM'
      '')
    Params.Data = {010001000A43445F41524D415A454D0001020030000000}
    Left = 43
    Top = 156
    object qry_amz_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TARMAZEM.CD_ARMAZEM'
      Size = 4
    end
    object qry_amz_NM_ARMAZEM: TStringField
      FieldName = 'NM_ARMAZEM'
      Origin = 'TARMAZEM.NM_ARMAZEM'
      Size = 50
    end
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT *'
      'FROM TSERVICO'
      'WHERE CD_SERVICO = :CD_SERVICO ')
    Params.Data = {010001000A43445F5345525649434F0001020030000000}
    Left = 134
    Top = 151
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
  object qry_cliente_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT S.CD_CLIENTE, S.CD_UNID_NEG, S.CD_PRODUTO,  S.CD_SERVICO'
      'FROM TCLIENTE_SERVICO S, TEMPRESA_NAC E'
      'WHERE ( S.CD_UNID_NEG = :CD_UNID_NEG OR :CD_UNID_NEG = '#39#39') AND'
      '      ( S.CD_PRODUTO = :CD_PRODUTO OR :CD_PRODUTO = '#39#39') AND'
      '      ( S.CD_SERVICO = :CD_SERVICO OR :CD_SERVICO = '#39#39')'
      '      '
      ''
      '')
    Params.Data = {
      010006000B43445F554E49445F4E454700010200300000000B43445F554E4944
      5F4E454700010200300000000A43445F50524F4455544F00010200300000000A
      43445F50524F4455544F00010200300000000A43445F5345525649434F000000
      000A43445F5345525649434F00000000}
    Left = 241
    Top = 143
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
  end
end
