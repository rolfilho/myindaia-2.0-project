object datm_pesq_log: Tdatm_pesq_log
  Left = 200
  Top = 104
  Height = 178
  Width = 550
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, AP_USUARIO, NM_USUARIO'
      'FROM TUSUARIO'
      'WHERE CD_USUARIO <> '#39#39)
    Left = 31
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
    object qry_usuario_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 15
    end
  end
  object qry_tabela_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TABELA, NM_TABELA'
      'FROM TTABELA'
      'WHERE CD_TABELA <> '#39#39)
    Left = 103
    Top = 22
    object qry_tabela_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TTABELA.CD_TABELA'
      Size = 3
    end
    object qry_tabela_NM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'TTABELA.NM_TABELA'
      Size = 30
    end
  end
  object qry_modulo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MODULO, NM_MODULO, AP_MODULO'
      'FROM TMODULO'
      'WHERE CD_MODULO <> '#39#39)
    Left = 171
    Top = 22
    object qry_modulo_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'TMODULO.CD_MODULO'
      Size = 2
    end
    object qry_modulo_NM_MODULO: TStringField
      FieldName = 'NM_MODULO'
      Origin = 'TMODULO.NM_MODULO'
      Size = 60
    end
    object qry_modulo_AP_MODULO: TStringField
      FieldName = 'AP_MODULO'
      Origin = 'TMODULO.CD_MODULO'
      Size = 3
    end
  end
  object qry_rotina_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MODULO, CD_ROTINA, NM_ROTINA'
      'FROM TMODULO_ROTINA'
      'WHERE CD_ROTINA <> '#39#39)
    Left = 243
    Top = 22
    object qry_rotina_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'TMODULO_ROTINA.CD_MODULO'
      Size = 2
    end
    object qry_rotina_CD_ROTINA: TStringField
      FieldName = 'CD_ROTINA'
      Origin = 'TMODULO_ROTINA.CD_ROTINA'
      Size = 4
    end
    object qry_rotina_NM_ROTINA: TStringField
      FieldName = 'NM_ROTINA'
      Origin = 'TMODULO_ROTINA.NM_ROTINA'
      Size = 50
    end
  end
  object qry_mov_log_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOVIMENTO, NM_MOVIMENTO'
      'FROM TTP_MOV_LOG'
      'WHERE CD_MOVIMENTO <> '#39#39)
    Left = 307
    Top = 22
    object qry_mov_log_CD_MOVIMENTO: TStringField
      FieldName = 'CD_MOVIMENTO'
      Origin = 'TTP_MOV_LOG.CD_MOVIMENTO'
      Size = 1
    end
    object qry_mov_log_NM_MOVIMENTO: TStringField
      FieldName = 'NM_MOVIMENTO'
      Origin = 'TTP_MOV_LOG.NM_MOVIMENTO'
    end
  end
  object ds_log: TDataSource
    AutoEdit = False
    DataSet = qry_log_
    Left = 384
    Top = 80
  end
  object qry_log_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TLOG'
      'WHERE'
      'CD_USUARIO = "" '
      'ORDER BY NR_SEQUENCIA')
    Left = 384
    Top = 22
    object qry_log_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TLOG.NR_SEQUENCIA'
    end
    object qry_log_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TLOG.CD_USUARIO'
      Size = 4
    end
    object qry_log_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TLOG.CD_TABELA'
      Size = 3
    end
    object qry_log_CD_MOVIMENTO: TStringField
      FieldName = 'CD_MOVIMENTO'
      Origin = 'TLOG.CD_MOVIMENTO'
      Size = 1
    end
    object qry_log_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'TLOG.CD_MODULO'
      Size = 2
    end
    object qry_log_CD_ROTINA: TStringField
      FieldName = 'CD_ROTINA'
      Origin = 'TLOG.CD_ROTINA'
      Size = 4
    end
    object qry_log_CD_CHAVE: TStringField
      FieldName = 'CD_CHAVE'
      Origin = 'TLOG.CD_CHAVE'
      Size = 30
    end
    object qry_log_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TLOG.DT_MOVIMENTO'
    end
    object qry_log_LookUsuario: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'LookUsuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 15
      Lookup = True
    end
    object qry_log_LookTabela: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'LookTabela'
      LookupDataSet = qry_tabela_
      LookupKeyFields = 'CD_TABELA'
      LookupResultField = 'NM_TABELA'
      KeyFields = 'CD_TABELA'
      Size = 30
      Lookup = True
    end
    object qry_log_LookMovimento: TStringField
      DisplayLabel = 'Movimento'
      FieldName = 'LookMovimento'
      LookupDataSet = qry_mov_log_
      LookupKeyFields = 'CD_MOVIMENTO'
      LookupResultField = 'NM_MOVIMENTO'
      KeyFields = 'CD_MOVIMENTO'
      Lookup = True
    end
    object qry_log_LookModulo: TStringField
      DisplayLabel = 'Módulo'
      FieldName = 'LookModulo'
      LookupDataSet = qry_modulo_
      LookupKeyFields = 'CD_MODULO'
      LookupResultField = 'AP_MODULO'
      KeyFields = 'CD_MODULO'
      Size = 3
      Lookup = True
    end
    object qry_log_LookRotina: TStringField
      DisplayLabel = 'Rotina'
      FieldName = 'LookRotina'
      LookupDataSet = qry_rotina_
      LookupKeyFields = 'CD_ROTINA'
      LookupResultField = 'NM_ROTINA'
      KeyFields = 'CD_ROTINA'
      Size = 50
      Lookup = True
    end
  end
end
