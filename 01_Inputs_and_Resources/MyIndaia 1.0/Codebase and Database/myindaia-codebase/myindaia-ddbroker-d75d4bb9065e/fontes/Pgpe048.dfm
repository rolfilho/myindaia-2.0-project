object datm_sel_unid_cli_serv_anal: Tdatm_sel_unid_cli_serv_anal
  Left = 200
  Top = 108
  Height = 310
  Width = 566
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
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT *'
      'FROM TSERVICO'
      'WHERE CD_SERVICO = :CD_SERVICO ')
    Params.Data = {010001000A43445F5345525649434F0001020030000000}
    Left = 41
    Top = 202
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
    Left = 136
    Top = 83
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
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM   TUSUARIO'
      'WHERE  CD_USUARIO = :CD_USUARIO')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 135
    Top = 22
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
  end
  object sp_rel_and_processo_exp: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_and_processo_exp'
    Params.Data = {
      0100080006526573756C74040304000000000000000C4063645F756E69645F6E
      65670101020030000000094063645F677275706F01010200300000000B406364
      5F636C69656E746501010200300000000B4063645F7365727669636F01010200
      300000000C4063645F616E616C6973746101010200300000000B40736F5F756C
      745F6F6273010102003000000011406E725F6964656E746966696361646F7202
      030400000000000000}
    Left = 345
    Top = 93
  end
  object qry_apaga_dados: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TREL_AND_PROCESSO_EXP'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Params.Data = {01000100104E525F4944454E544946494341444F5200030400000000000000}
    Left = 344
    Top = 36
    object StringField1: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object StringField2: TStringField
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
    Left = 43
    Top = 146
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
  object sp_rel_cont_averb: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_cont_averb'
    Params.Data = {
      0100080006526573756C740403040000000000000011406E725F6964656E7469
      66696361646F72020304000000000000000C4063645F756E69645F6E65670101
      020030000000094063645F677275706F01010200300000000B4063645F636C69
      656E746501010200300000000B4063645F7365727669636F0101020030000000
      0C4063645F616E616C6973746101010200300000000E40696E5F70726F635F61
      766572620101020030000000}
    Left = 344
    Top = 152
  end
end
