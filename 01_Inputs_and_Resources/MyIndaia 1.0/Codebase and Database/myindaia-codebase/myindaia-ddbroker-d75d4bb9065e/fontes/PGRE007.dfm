object datm_rel_ev_critico: Tdatm_rel_ev_critico
  Left = 324
  Top = 231
  Height = 435
  Width = 518
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG,'
      '       AP_UNID_NEG'
      'FROM TUNID_NEG ( NOLOCK )'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 351
    Top = 28
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 10
    end
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA,'
      '       AP_EMPRESA'
      'FROM TEMPRESA_NAC ( NOLOCK )'
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Params.Data = {010001000A43445F434C49454E54450001020030000100}
    Left = 439
    Top = 92
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 10
    end
  end
  object qry_area_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_AREA,'
      '       NM_AREA'
      'FROM TAREA ( NOLOCK )'
      'WHERE CD_AREA = :CD_AREA')
    Params.Data = {010001000743445F415245410001020030000000}
    Left = 351
    Top = 160
    object qry_area_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TAREA.CD_AREA'
      Size = 2
    end
    object qry_area_NM_AREA: TStringField
      FieldName = 'NM_AREA'
      Origin = 'TAREA.NM_AREA'
      Size = 50
    end
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO,'
      '       NM_GRUPO'
      'FROM TGRUPO ( NOLOCK )'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Params.Data = {010001000843445F475255504F0001020030000000}
    Left = 351
    Top = 92
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO,'
      '       NM_PRODUTO'
      'FROM TPRODUTO ( NOLOCK )'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Params.Data = {010001000A43445F50524F4455544F0001020030000000}
    Left = 440
    Top = 28
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 40
    end
  end
  object qry_evento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EVENTO,'
      '       NM_EVENTO,'
      '       IN_ATIVO'
      'FROM TEVENTO ( NOLOCK )'
      'WHERE CD_EVENTO = :CD_EVENTO')
    Params.Data = {010001000943445F4556454E544F0001020030000000}
    Left = 440
    Top = 160
    object qry_evento_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 3
    end
    object qry_evento_NM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Origin = 'TEVENTO.NM_EVENTO'
      Size = 50
    end
    object qry_evento_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TEVENTO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_ev_realiz_fora_meta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO,'
      '       NR_DIAS,'
      '       DT_INICIO,'
      '       DT_FIM'
      'FROM TREL_EV_CRITICO'
      'WHERE IN_ATRAZADO      = '#39'1'#39
      '  AND IN_REALIZADO     = '#39'1'#39
      '  AND NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      '  AND NR_PRAZO = :NR_PRAZO'
      'ORDER BY NR_DIAS DESC')
    Params.Data = {
      01000200104E525F4944454E544946494341444F520003040000000000000008
      4E525F5052415A4F00000000}
    Left = 192
    Top = 112
    object qry_ev_realiz_fora_meta_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_ev_realiz_fora_meta_NR_DIAS: TIntegerField
      FieldName = 'NR_DIAS'
    end
    object qry_ev_realiz_fora_meta_DT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
    end
    object qry_ev_realiz_fora_meta_DT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
    end
  end
  object qry_ev_nao_realiz_fora_meta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO,'
      '       NR_DIAS,'
      '       DT_INICIO,'
      '       DT_FIM'
      'FROM TREL_EV_CRITICO'
      'WHERE IN_ATRAZADO      = '#39'1'#39
      '  AND IN_REALIZADO     = '#39'0'#39
      '  AND NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      '  AND NR_PRAZO = :NR_PRAZO'
      'ORDER BY NR_DIAS DESC')
    Params.Data = {
      01000200104E525F4944454E544946494341444F520003040000000000000008
      4E525F5052415A4F00000000}
    Left = 192
    Top = 184
    object qry_ev_nao_realiz_fora_meta_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_ev_nao_realiz_fora_meta_NR_DIAS: TIntegerField
      FieldName = 'NR_DIAS'
    end
    object qry_ev_nao_realiz_fora_meta_DT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
    end
    object qry_ev_nao_realiz_fora_meta_DT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
    end
  end
  object qry_ev_realizado_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO,'
      '       NR_DIAS,'
      '       DT_INICIO,'
      '       DT_FIM'
      'FROM TREL_EV_CRITICO'
      'WHERE IN_ATRAZADO      = '#39'0'#39
      '  AND IN_REALIZADO     = '#39'1'#39
      '  AND NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      '  AND NR_PRAZO = :NR_PRAZO'
      'ORDER BY DT_INICIO')
    Params.Data = {
      01000200104E525F4944454E544946494341444F520003040000000000000008
      4E525F5052415A4F00000000}
    Left = 192
    Top = 32
    object qry_ev_realizado_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_ev_realizado_NR_DIAS: TIntegerField
      FieldName = 'NR_DIAS'
    end
    object qry_ev_realizado_DT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
    end
    object qry_ev_realizado_DT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
    end
  end
  object sp_rel_ev_critico: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_ev_critico'
    Params.Data = {
      01000C0006526573756C74040304000000000000000C4063645F756E69645F6E
      656701010200300000000B4063645F70726F6475746F01010200300000000940
      63645F677275706F01010200300000000B4063645F636C69656E746501010200
      30000000084063645F6172656101010200300000000A4063645F6576656E746F
      01010200300000000A4064745F696E6963696F010B080000002C845D40CB4200
      00074064745F66696D010B080000002C845D40CB420000084064745F686F6A65
      010B080000002C845D40CB420000084074705F64696173010102003000000011
      406E725F6964656E746966696361646F7202030400000000000000}
    Left = 352
    Top = 328
  end
  object qry_ev_basico_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 440
    Top = 224
  end
  object qry_ev_nao_realiz_ainda_na_meta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO,'
      '       NR_DIAS,'
      '       DT_INICIO,'
      '       DT_FIM'
      'FROM TREL_EV_CRITICO'
      'WHERE IN_ATRAZADO      = '#39'0'#39
      '  AND IN_REALIZADO     = '#39'0'#39
      '  AND NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      '  AND NR_PRAZO = :NR_PRAZO'
      'ORDER BY NR_DIAS DESC')
    Params.Data = {
      01000200104E525F4944454E544946494341444F520003040000000000000008
      4E525F5052415A4F00000000}
    Left = 192
    Top = 256
    object qry_ev_nao_realiz_ainda_na_meta_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_ev_nao_realiz_ainda_na_meta_NR_DIAS: TIntegerField
      FieldName = 'NR_DIAS'
    end
    object qry_ev_nao_realiz_ainda_na_meta_DT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
    end
    object qry_ev_nao_realiz_ainda_na_meta_DT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
    end
  end
  object qry_group_prazos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PRAZO, COUNT(*)'
      'FROM TREL_EV_CRITICO'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      'GROUP BY NR_PRAZO'
      'ORDER BY NR_PRAZO')
    Params.Data = {01000100104E525F4944454E544946494341444F5200030400000000000000}
    Left = 48
    Top = 144
    object qry_group_prazos_NR_PRAZO: TFloatField
      FieldName = 'NR_PRAZO'
    end
  end
  object sp_rel_ev_critico_po: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_ev_critico_po'
    Params.Data = {
      01000C0006526573756C74040304000000000000000C4063645F756E69645F6E
      656701010200300000000B4063645F70726F6475746F01010200300000000940
      63645F677275706F01010200300000000B4063645F636C69656E746501010200
      30000000084063645F6172656101010200300000000A4063645F6576656E746F
      01010200300000000A4064745F696E6963696F010B080000002C845D40CB4200
      00074064745F66696D010B080000002C845D40CB420000084064745F686F6A65
      010B080000002C845D40CB420000084074705F64696173010102003000000011
      406E725F6964656E746966696361646F7202030400000000000000}
    Left = 352
    Top = 280
  end
end
