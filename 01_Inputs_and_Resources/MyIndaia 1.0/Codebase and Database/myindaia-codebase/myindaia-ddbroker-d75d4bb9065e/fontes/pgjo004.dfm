object datm_LI: Tdatm_LI
  Left = 200
  Top = 104
  Height = 271
  Width = 559
  object qry_empresa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA , NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE CD_EMPRESA= :CD_EMPRESA')
    Params.Data = {010001000A43445F454D50524553410001020030000000}
    Left = 160
    Top = 76
    object qry_empresa_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO , NM_SERVICO, CD_VIA_TRANSPORTE'
      'FROM TSERVICO TSERVICO'
      'WHERE CD_SERVICO = :CD_SERVICO')
    Params.Data = {010001000A43445F5345525649434F0001020030000000}
    Left = 260
    Top = 76
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
    object qry_servico_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 2
    end
  end
  object qry_li_: TQuery
    BeforeEdit = qry_li_BeforeEdit
    OnCalcFields = qry_li_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT  NR_PROCESSO, CD_IMPORTADOR, CD_SERVICO,  DT_PROCESSO_LI,' +
        '  NR_REGISTRO_LI, DT_REGISTRO_LI, TP_CAMBIO'
      'FROM TLICENCA_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO  OR'
      '               NR_PROCESSO LIKE '#39':NR_PROCESSO%'#39
      '')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 120
    Top = 152
    object qry_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_li_NR_REGISTRO_LI: TStringField
      FieldName = 'NR_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.NR_REGISTRO_LI'
      EditMask = '!99/9999999-9;0;'
      Size = 10
    end
    object qry_li_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TLICENCA_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_li_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TLICENCA_IMPORTACAO.CD_SERVICO'
      Size = 3
    end
    object qry_li_DT_PROCESSO_LI: TDateTimeField
      FieldName = 'DT_PROCESSO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_PROCESSO_LI'
    end
    object qry_li_DT_REGISTRO_LI: TDateTimeField
      FieldName = 'DT_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_REGISTRO_LI'
    end
    object qry_li_calc_nr_proc: TStringField
      FieldName = 'calc_nr_proc'
      Size = 18
      Calculated = True
    end
    object qry_li_TP_CAMBIO: TStringField
      FieldName = 'TP_CAMBIO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 1
    end
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG , AP_UNID_NEG , IN_ATIVO'
      'FROM TUNID_NEG TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 48
    Top = 76
    object qry_unidade_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unidade_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
    object qry_unidade_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG.IN_ATIVO'
      Size = 1
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  NR_PROCESSO , CD_CLIENTE , CD_UNID_NEG ,  '
      #9'NR_CONHECIMENTO, NR_CONHECIMENTO_MASTER,'
      #9'CD_SERVICO, CD_PAIS_ORIGEM, E.NM_EMBARCACAO,'
      #9'N.CD_TIPO_PESSOA'
      'FROM TPROCESSO P, TEMBARCACAO E, TEMPRESA_NAC N'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      #9'P.CD_EMBARCACAO *= E.CD_EMBARCACAO AND'
      #9'P.CD_CLIENTE *= N.CD_EMPRESA')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 48
    Top = 24
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 3
    end
    object qry_processo_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 18
    end
    object qry_processo_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
    object qry_processo_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Size = 40
    end
    object qry_processo_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Size = 1
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG'
      '               FROM TUSUARIO_HABILITACAO '
      '               WHERE CD_USUARIO=:CD_USUARIO'
      '              AND IN_ATIVO='#39'1'#39)
    Params.Data = {010001000A43445F5553554152494F0001020030000100}
    Left = 416
    Top = 76
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
  end
  object qry_ev_dt_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  '
      '('
      'SELECT DT_REALIZACAO'
      'FROM VW_DT_EMBARQUE '
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      ') DT_EMBARQUE,'
      '('
      'SELECT DT_REALIZACAO'
      'FROM VW_DT_CHEGADA '
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      ') DT_CHEGADA')
    Params.Data = {
      010002000B4E525F50524F434553534F00010200300000000B4E525F50524F43
      4553534F0001020030000000}
    Left = 416
    Top = 132
    object qry_ev_dt_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object qry_ev_dt_DT_CHEGADA: TDateTimeField
      FieldName = 'DT_CHEGADA'
    end
  end
  object qry_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TREF_CLIENTE WHERE  '
      'CD_REFERENCIA <> '#39#39)
    Left = 259
    Top = 22
    object qry_ref_cli_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TREF_CLIENTE.NR_PROCESSO'
      Size = 18
    end
    object qry_ref_cli_NR_SEQUENCIA: TStringField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TREF_CLIENTE.NR_SEQUENCIA'
      Size = 2
    end
    object qry_ref_cli_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
  end
  object ds_li: TDataSource
    DataSet = qry_li_
    Left = 40
    Top = 152
  end
end
