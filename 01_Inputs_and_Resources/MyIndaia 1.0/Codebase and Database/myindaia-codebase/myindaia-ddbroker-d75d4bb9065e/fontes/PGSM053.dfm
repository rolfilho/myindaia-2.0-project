object datm_cargo: Tdatm_cargo
  OldCreateOrder = True
  Left = 344
  Top = 196
  Height = 532
  Width = 843
  object ds_controle_acesso: TDataSource
    DataSet = qry_controle_acesso_
    Left = 348
    Top = 444
  end
  object ds_cargo_modulo: TDataSource
    DataSet = qry_cargo_modulo_
    Left = 124
    Top = 444
  end
  object qry_cargo_modulo_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_cargo_lista
    RequestLive = True
    SQL.Strings = (
      'select * from TCARGO_MODULO'
      'WHERE CD_CARGO =  :CD_CARGO ')
    Left = 124
    Top = 395
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_CARGO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_cargo_modulo_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TCARGO_MODULO.CD_CARGO'
      Size = 3
    end
    object qry_cargo_modulo_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'TCARGO_MODULO.CD_MODULO'
      Size = 2
    end
    object qry_cargo_modulo_IN_ATIVO: TBooleanField
      FieldName = 'IN_ATIVO'
      Origin = 'TCARGO_MODULO.IN_ATIVO'
      DisplayValues = '1'
    end
    object TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_MODULO'
      LookupDataSet = qry_modulo_
      LookupKeyFields = 'CD_MODULO'
      LookupResultField = 'NM_MODULO'
      KeyFields = 'CD_MODULO'
      Size = 60
      Lookup = True
    end
  end
  object qry_controle_acesso_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_cargo_modulo
    RequestLive = True
    SQL.Strings = (
      'SELECT  * '
      'FROM TCONTROLE_ACESSO'
      'WHERE CD_CARGO= :CD_CARGO AND'
      '               CD_MODULO = :CD_MODULO')
    Left = 348
    Top = 395
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MODULO'
        ParamType = ptUnknown
      end>
    object qry_controle_acesso_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TCONTROLE_ACESSO.CD_CARGO'
      Size = 3
    end
    object qry_controle_acesso_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'TCONTROLE_ACESSO.CD_MODULO'
      Size = 2
    end
    object qry_controle_acesso_CD_ROTINA: TStringField
      FieldName = 'CD_ROTINA'
      Origin = 'TCONTROLE_ACESSO.CD_ROTINA'
      Size = 4
    end
    object qry_controle_acesso_IN_ACESSO: TBooleanField
      FieldName = 'IN_ACESSO'
      Origin = 'TCONTROLE_ACESSO.IN_ACESSO'
    end
    object qry_controle_acesso_IN_INCLUIR: TBooleanField
      FieldName = 'IN_INCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_INCLUIR'
    end
    object qry_controle_acesso_IN_MODIFICAR: TBooleanField
      FieldName = 'IN_MODIFICAR'
      Origin = 'TCONTROLE_ACESSO.IN_MODIFICAR'
    end
    object qry_controle_acesso_IN_EXCLUIR: TBooleanField
      FieldName = 'IN_EXCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_EXCLUIR'
    end
    object qry_controle_acesso_LK_MN_ROTINA: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_MN_ROTINA'
      LookupDataSet = qry_rotina_
      LookupKeyFields = 'CD_ROTINA'
      LookupResultField = 'NM_ROTINA'
      KeyFields = 'CD_ROTINA'
      Size = 50
      Lookup = True
    end
  end
  object ds_cargo: TDataSource
    DataSet = qry_cargo_
    Left = 20
    Top = 68
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 189
    Top = 124
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 181
    Top = 180
  end
  object qry_ult_cargo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_CARGO)  ULTIMO'
      'FROM TCARGO')
    Left = 99
    Top = 124
    object qry_ult_cargo_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TCARGO.CD_CARGO'
      Size = 3
    end
  end
  object sp_atz_cargo_desc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_cargo_desc'
    Left = 718
    Top = 76
  end
  object qry_cargo_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_cargo_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TCARGO '
      'WHERE CD_CARGO = :CD_CARGO')
    Left = 20
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_cargo_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TCARGO.CD_CARGO'
      Size = 3
    end
    object qry_cargo_NM_CARGO: TStringField
      FieldName = 'NM_CARGO'
      Origin = 'TCARGO.NM_CARGO'
      Size = 40
    end
    object qry_cargo_CD_NIVEL: TIntegerField
      FieldName = 'CD_NIVEL'
      Origin = 'TCARGO.CD_NIVEL'
    end
    object qry_cargo_CD_CARGO_PAI: TStringField
      FieldName = 'CD_CARGO_PAI'
      Origin = 'TCARGO.CD_CARGO_PAI'
      Size = 3
    end
    object qry_cargo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCARGO.IN_ATIVO'
      Size = 1
    end
    object qry_cargo_LK_NM_CARGO_PAI: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_CARGO_PAI'
      LookupDataSet = qry_vw_cargo_
      LookupKeyFields = 'CD_CARGO'
      LookupResultField = 'NM_CARGO'
      KeyFields = 'CD_CARGO_PAI'
      Size = 40
      Lookup = True
    end
    object qry_cargo_LK_ATIVO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_ATIVO'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_cargo_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TCARGO.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_cargo_IN_MANAGER: TStringField
      FieldName = 'IN_MANAGER'
      Origin = 'DBBROKER.TCARGO.IN_MANAGER'
      FixedChar = True
      Size = 1
    end
    object qry_cargo_IN_INTERNO: TStringField
      FieldName = 'IN_INTERNO'
      Origin = 'DBBROKER.TCARGO.IN_INTERNO'
      FixedChar = True
      Size = 1
    end
    object qry_cargo_IN_DASHBOARD_WEB: TStringField
      FieldName = 'IN_DASHBOARD_WEB'
      Origin = 'DBBROKER.TCARGO.IN_DASHBOARD_WEB'
      FixedChar = True
      Size = 1
    end
    object qry_cargo_DOC_PREFERENCIAL: TIntegerField
      FieldName = 'DOC_PREFERENCIAL'
      Origin = 'DBBROKER.TCARGO.DOC_PREFERENCIAL'
    end
    object qry_cargo_CD_SETOR: TIntegerField
      FieldName = 'CD_SETOR'
      Origin = 'DBBROKER.TCARGO.CD_SETOR'
    end
    object qry_cargo_IN_LIBERA_TRANSMISSAO_DI: TStringField
      FieldName = 'IN_LIBERA_TRANSMISSAO_DI'
      Origin = 'DBBROKER.TCARGO.IN_LIBERA_TRANSMISSAO_DI'
      FixedChar = True
      Size = 1
    end
  end
  object qry_cargo_lista_: TQuery
    OnCalcFields = qry_cargo_lista_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCARGO'
      'WHERE CD_CARGO IN '
      '              ( SELECT CD_DESCENDENTE'
      '                FROM TCARGO_DESCENDENTE'
      '                WHERE CD_CARGO = :CD_CARGO )'
      'ORDER BY'
      'NM_CARGO')
    Left = 94
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end>
    object qry_cargo_lista_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Size = 3
    end
    object qry_cargo_lista_NM_CARGO: TStringField
      FieldName = 'NM_CARGO'
      Size = 40
    end
    object qry_cargo_lista_CD_NIVEL: TIntegerField
      FieldName = 'CD_NIVEL'
    end
    object qry_cargo_lista_CD_CARGO_PAI: TStringField
      FieldName = 'CD_CARGO_PAI'
      Size = 3
    end
    object qry_cargo_lista_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_cargo_lista_LK_NM_CARGO_PAI: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_CARGO_PAI'
      LookupDataSet = qry_vw_cargo_
      LookupKeyFields = 'CD_CARGO'
      LookupResultField = 'NM_CARGO'
      KeyFields = 'CD_CARGO_PAI'
      Size = 40
      Lookup = True
    end
    object qry_cargo_lista_LK_ATIVO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_ATIVO'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_cargo_lista_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_cargo_lista_calcSELECIONADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcSELECIONADO'
      Size = 1
      Calculated = True
    end
  end
  object ds_cargo_lista: TDataSource
    DataSet = qry_cargo_lista_
    Left = 94
    Top = 68
  end
  object qry_vw_cargo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCARGO')
    Left = 183
    Top = 11
  end
  object ds_vw_cargo: TDataSource
    DataSet = qry_vw_cargo_
    Left = 183
    Top = 68
  end
  object qry_modulo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TMODULO')
    Left = 36
    Top = 392
  end
  object qry_rotina_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_cargo
    SQL.Strings = (
      'SELECT * '
      'FROM TMODULO_ROTINA')
    Left = 246
    Top = 396
    object qry_rotina_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'DBBROKER.TMODULO_ROTINA.CD_MODULO'
      FixedChar = True
      Size = 2
    end
    object qry_rotina_CD_ROTINA: TStringField
      FieldName = 'CD_ROTINA'
      Origin = 'DBBROKER.TMODULO_ROTINA.CD_ROTINA'
      FixedChar = True
      Size = 4
    end
    object qry_rotina_NM_ROTINA: TStringField
      FieldName = 'NM_ROTINA'
      Origin = 'DBBROKER.TMODULO_ROTINA.NM_ROTINA'
      FixedChar = True
      Size = 50
    end
    object qry_rotina_NM_MENU: TStringField
      FieldName = 'NM_MENU'
      Origin = 'DBBROKER.TMODULO_ROTINA.NM_MENU'
      FixedChar = True
      Size = 50
    end
    object qry_rotina_NM_FORM: TStringField
      FieldName = 'NM_FORM'
      Origin = 'DBBROKER.TMODULO_ROTINA.NM_FORM'
      FixedChar = True
      Size = 50
    end
  end
  object ds_modulo: TDataSource
    DataSet = qry_modulo_
    Left = 36
    Top = 441
  end
  object ds_rotina: TDataSource
    DataSet = qry_rotina_
    Left = 245
    Top = 450
  end
  object sp_atz_controle_acesso: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_controle_acesso'
    Left = 566
    Top = 24
  end
  object qry_cargo_modulo_p_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  *'
      'FROM TCARGO_MODULO'
      'WHERE CD_CARGO = :CD_CARGO  AND'
      '               CD_MODULO = :CD_MODULO ')
    Left = 291
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MODULO'
        ParamType = ptUnknown
      end>
    object qry_cargo_modulo_p_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TCARGO_MODULO.CD_CARGO'
      Size = 3
    end
    object qry_cargo_modulo_p_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'TCARGO_MODULO.CD_MODULO'
      Size = 2
    end
    object qry_cargo_modulo_p_IN_ATIVO: TBooleanField
      FieldName = 'IN_ATIVO'
      Origin = 'TCARGO_MODULO.IN_ATIVO'
    end
  end
  object qry_controle_acesso_p_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTROLE_ACESSO'
      'WHERE CD_CARGO = :CD_CARGO  AND'
      '               CD_MODULO = :CD_MODULO AND'
      '               CD_ROTINA = :CD_ROTINA')
    Left = 291
    Top = 68
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ROTINA'
        ParamType = ptUnknown
      end>
    object qry_controle_acesso_p_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TCONTROLE_ACESSO.CD_CARGO'
      Size = 3
    end
    object qry_controle_acesso_p_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'TCONTROLE_ACESSO.CD_MODULO'
      Size = 2
    end
    object qry_controle_acesso_p_CD_ROTINA: TStringField
      FieldName = 'CD_ROTINA'
      Origin = 'TCONTROLE_ACESSO.CD_ROTINA'
      Size = 4
    end
    object qry_controle_acesso_p_IN_ACESSO: TBooleanField
      FieldName = 'IN_ACESSO'
      Origin = 'TCONTROLE_ACESSO.IN_ACESSO'
    end
    object qry_controle_acesso_p_IN_INCLUIR: TBooleanField
      FieldName = 'IN_INCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_INCLUIR'
    end
    object qry_controle_acesso_p_IN_MODIFICAR: TBooleanField
      FieldName = 'IN_MODIFICAR'
      Origin = 'TCONTROLE_ACESSO.IN_MODIFICAR'
    end
    object qry_controle_acesso_p_IN_EXCLUIR: TBooleanField
      FieldName = 'IN_EXCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_EXCLUIR'
    end
  end
  object qry_tabelas_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TTABELA_DIGITALIZACAO')
    Left = 22
    Top = 125
    object qry_tabelas_ID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
      Origin = 'DBBROKER.TTABELA_DIGITALIZACAO.ID_TABELA'
    end
    object qry_tabelas_ID_CAMPO: TIntegerField
      FieldName = 'ID_CAMPO'
      Origin = 'DBBROKER.TTABELA_DIGITALIZACAO.ID_CAMPO'
    end
    object qry_tabelas_NM_EXIBICAO: TStringField
      FieldName = 'NM_EXIBICAO'
      Origin = 'DBBROKER.TTABELA_DIGITALIZACAO.NM_EXIBICAO'
      FixedChar = True
      Size = 100
    end
    object qry_tabelas_ID_CAMPO_PROCESSO: TIntegerField
      FieldName = 'ID_CAMPO_PROCESSO'
      Origin = 'DBBROKER.TTABELA_DIGITALIZACAO.ID_CAMPO_PROCESSO'
    end
    object qry_tabelas_NM_SQL_LOOKUP: TStringField
      FieldName = 'NM_SQL_LOOKUP'
      Origin = 'DBBROKER.TTABELA_DIGITALIZACAO.NM_SQL_LOOKUP'
      FixedChar = True
      Size = 255
    end
  end
  object qry_acesso_documento_: TQuery
    BeforeOpen = qry_acesso_documento_BeforeOpen
    BeforeRefresh = qry_acesso_documento_BeforeOpen
    DatabaseName = 'DBBROKER'
    DataSource = ds_tabelas
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CAD.ID_TABELA, CAD.CD_TIPO_DOCTO, CAD.IN_VISUALIZACAO, CA' +
        'D.IN_ALTERACAO'
      'FROM TCONTROLE_ACESSO_DIGITALIZACAO CAD'
      'WHERE CAD.CD_CARGO  = :CD_CARGO'
      '  AND CAD.ID_TABELA = :ID_TABELA')
    Left = 286
    Top = 125
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
        Size = 3
        Value = '001'
      end
      item
        DataType = ftInteger
        Name = 'ID_TABELA'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_acesso_documento_ID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
      Origin = 'DBBROKER.TCONTROLE_ACESSO_DIGITALIZACAO.ID_TABELA'
    end
    object qry_acesso_documento_CD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
      Origin = 'DBBROKER.TCONTROLE_ACESSO_DIGITALIZACAO.CD_TIPO_DOCTO'
    end
    object qry_acesso_documento_IN_VISUALIZACAO: TStringField
      FieldName = 'IN_VISUALIZACAO'
      Origin = 'DBBROKER.TCONTROLE_ACESSO_DIGITALIZACAO.IN_VISUALIZACAO'
      FixedChar = True
      Size = 1
    end
    object qry_acesso_documento_IN_ALTERACAO: TStringField
      FieldName = 'IN_ALTERACAO'
      Origin = 'DBBROKER.TCONTROLE_ACESSO_DIGITALIZACAO.IN_ALTERACAO'
      FixedChar = True
      Size = 1
    end
    object qry_acesso_documento_LK_NM_TIPO_DOCTO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_TIPO_DOCTO'
      LookupDataSet = qry_tipos_documento_
      LookupKeyFields = 'ID_TABELA;CD_TIPO_DOCTO'
      LookupResultField = 'NM_TIPO_DOCTO'
      KeyFields = 'ID_TABELA;CD_TIPO_DOCTO'
      Size = 100
      Lookup = True
    end
  end
  object ds_tabelas: TDataSource
    DataSet = qry_tabelas_
    Left = 22
    Top = 181
  end
  object ds_acesso_documento: TDataSource
    DataSet = qry_acesso_documento_
    Left = 278
    Top = 181
  end
  object sp_atz_controle_acesso_digitalizacao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_ATZ_CONTROLE_ACESSO_DIGITALIZACAO'
    Left = 724
    Top = 23
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@CD_CARGO'
        ParamType = ptInput
        Size = 3
        Value = 'XXX'
      end>
  end
  object qry_tipos_documento_: TQuery
    BeforeOpen = qry_acesso_documento_BeforeOpen
    BeforeRefresh = qry_acesso_documento_BeforeOpen
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_DOCTO_DIGITALIZADO')
    Left = 422
    Top = 21
    object qry_tipos_documento_CD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.CD_TIPO_DOCTO'
    end
    object qry_tipos_documento_NM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.NM_TIPO_DOCTO'
      FixedChar = True
      Size = 100
    end
    object qry_tipos_documento_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_tipos_documento_IN_MULTIPLOS_ARQ: TIntegerField
      FieldName = 'IN_MULTIPLOS_ARQ'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.IN_MULTIPLOS_ARQ'
    end
    object qry_tipos_documento_NM_PREFIXO_ARQ: TStringField
      FieldName = 'NM_PREFIXO_ARQ'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.NM_PREFIXO_ARQ'
      FixedChar = True
      Size = 4
    end
    object qry_tipos_documento_IN_ENVIA_WEB: TStringField
      FieldName = 'IN_ENVIA_WEB'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.IN_ENVIA_WEB'
      FixedChar = True
      Size = 1
    end
    object qry_tipos_documento_ID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.ID_TABELA'
    end
  end
  object ds_tipos_documento: TDataSource
    DataSet = qry_tipos_documento_
    Left = 422
    Top = 77
  end
  object sp_copia_acesso_digitalizacao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_COPIA_ACESSO_DIGITALIZACAO'
    Left = 566
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@CD_CARGO_ORIGEM'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftString
        Name = '@CD_CARGO_DESTINO'
        ParamType = ptInput
        Size = 3
      end>
  end
  object qry_sistema_novo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      ' FROM MYLOGIN.dbo.TB_SISTEMA')
    Left = 32
    Top = 264
    object qry_sistema_novoCD_SISTEMA: TIntegerField
      FieldName = 'CD_SISTEMA'
    end
    object qry_sistema_novoNM_SISTEMA: TStringField
      FieldName = 'NM_SISTEMA'
      FixedChar = True
      Size = 50
    end
    object qry_sistema_novoNM_APLICATIVO: TStringField
      FieldName = 'NM_APLICATIVO'
      FixedChar = True
      Size = 255
    end
    object qry_sistema_novoNM_PROCESSO: TStringField
      FieldName = 'NM_PROCESSO'
      FixedChar = True
      Size = 255
    end
  end
  object ds_sistema_novo: TDataSource
    DataSet = qry_sistema_novo
    Left = 32
    Top = 320
  end
  object qry_controle_acesso_sistema: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_cargo_lista
    SQL.Strings = (
      
        'select  DISTINCT CD_SISTEMA,CD_CARGO from [MYLOGIN].[dbo].[TB_CO' +
        'NTROLE_ACESSO]'
      'WHERE CD_CARGO =  CONVERT(INT, :CD_CARGO)')
    Left = 160
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_controle_acesso_sistemaLK_NM_SISTEMA: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'LK_NM_SISTEMA'
      LookupDataSet = qry_sistema_novo
      LookupKeyFields = 'CD_SISTEMA'
      LookupResultField = 'NM_SISTEMA'
      KeyFields = 'cd_sistema'
      Lookup = True
    end
    object qry_controle_acesso_sistemaCD_SISTEMA: TIntegerField
      FieldName = 'CD_SISTEMA'
    end
    object qry_controle_acesso_sistemaCD_CARGO: TIntegerField
      FieldName = 'CD_CARGO'
    end
  end
  object ds_controle_acesso_sistema: TDataSource
    DataSet = qry_controle_acesso_sistema
    Left = 152
    Top = 320
  end
  object qry_modulo_novo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select * from MYLOGIN.dbo.TB_MODULO')
    Left = 288
    Top = 264
    object qry_modulo_novoCD_SISTEMA: TIntegerField
      FieldName = 'CD_SISTEMA'
    end
    object qry_modulo_novoCD_MODULO: TIntegerField
      FieldName = 'CD_MODULO'
    end
    object qry_modulo_novoNM_MODULO: TStringField
      FieldName = 'NM_MODULO'
      FixedChar = True
      Size = 50
    end
  end
  object ds_modulo_novo: TDataSource
    DataSet = qry_modulo_novo
    Left = 280
    Top = 320
  end
  object qry_controle_acesso_modulo: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_controle_acesso_sistema
    SQL.Strings = (
      
        'select  DISTINCT CD_MODULO,CD_CARGO,CD_SISTEMA  from [MYLOGIN].[' +
        'dbo].[TB_CONTROLE_ACESSO]'
      'WHERE CD_CARGO= CONVERT(INT, :CD_CARGO)'
      ' AND CD_SISTEMA= CONVERT(INT, :CD_SISTEMA)'
      '')
    Left = 408
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_CARGO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CD_SISTEMA'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_controle_acesso_moduloCD_MODULO: TIntegerField
      FieldName = 'CD_MODULO'
    end
    object qry_controle_acesso_moduloCD_CARGO: TIntegerField
      FieldName = 'CD_CARGO'
    end
    object qry_controle_acesso_moduloCD_SISTEMA: TIntegerField
      FieldName = 'CD_SISTEMA'
    end
    object qry_controle_acesso_moduloLK_NM_MODULO: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'LK_NM_MODULO'
      LookupDataSet = qry_modulo_novo
      LookupKeyFields = 'CD_MODULO'
      LookupResultField = 'NM_MODULO'
      KeyFields = 'CD_MODULO'
      Lookup = True
    end
  end
  object ds_controle_acesso_modulo: TDataSource
    DataSet = qry_controle_acesso_modulo
    Left = 408
    Top = 320
  end
  object ds_controle_acesso_rotina: TDataSource
    DataSet = qry_controle_acesso_rotina
    Left = 640
    Top = 320
  end
  object qry_rotina_novo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select * from MYLOGIN.dbo.TB_ROTINA')
    Left = 528
    Top = 264
    object qry_rotina_novoCD_SISTEMA: TIntegerField
      FieldName = 'CD_SISTEMA'
    end
    object qry_rotina_novoCD_MODULO: TIntegerField
      FieldName = 'CD_MODULO'
    end
    object qry_rotina_novoCD_ROTINA: TIntegerField
      FieldName = 'CD_ROTINA'
    end
    object qry_rotina_novoNM_ROTINA: TStringField
      DisplayWidth = 100
      FieldName = 'NM_ROTINA'
      FixedChar = True
      Size = 50
    end
  end
  object ds_rotina_novo: TDataSource
    DataSet = qry_rotina_novo
    Left = 520
    Top = 320
  end
  object qry_controle_acesso_rotina: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    DataSource = ds_controle_acesso_modulo
    SQL.Strings = (
      'select  * from [MYLOGIN].[dbo].[TB_CONTROLE_ACESSO]'
      'WHERE CD_CARGO= CONVERT(INT, :CD_CARGO)'
      ' AND CD_SISTEMA= CONVERT(INT, :CD_SISTEMA)'
      ' AND CD_MODULO= CONVERT(INT, :CD_MODULO)'
      ''
      '')
    UpdateObject = up_controle_acesso
    Left = 640
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_CARGO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CD_SISTEMA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CD_MODULO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_controle_acesso_rotinaCD_SISTEMA: TIntegerField
      FieldName = 'CD_SISTEMA'
    end
    object qry_controle_acesso_rotinaCD_MODULO: TIntegerField
      FieldName = 'CD_MODULO'
    end
    object qry_controle_acesso_rotinaCD_ROTINA: TIntegerField
      FieldName = 'CD_ROTINA'
    end
    object qry_controle_acesso_rotinaCD_CARGO: TIntegerField
      FieldName = 'CD_CARGO'
    end
    object qry_controle_acesso_rotinaIN_VISIVEL: TBooleanField
      FieldName = 'IN_VISIVEL'
    end
    object qry_controle_acesso_rotinaLK_NM_ROTINA: TStringField
      DisplayWidth = 100
      FieldKind = fkLookup
      FieldName = 'LK_NM_ROTINA'
      LookupDataSet = qry_rotina_novo
      LookupKeyFields = 'CD_ROTINA'
      LookupResultField = 'NM_ROTINA'
      KeyFields = 'CD_ROTINA'
      Size = 60
      Lookup = True
    end
    object qry_controle_acesso_rotinaIN_ATIVO: TBooleanField
      DisplayWidth = 1
      FieldName = 'IN_ATIVO'
      DisplayValues = '1'
    end
  end
  object sp_copia_controle_acesso_novo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_COPIA_CONTROLE_ACESSO_NOVO'
    Left = 566
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@CD_CARGO_ORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CD_CARGO_DESTINO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CD_MODULO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CD_SISTEMA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@VCOPIAMODULO'
        ParamType = ptInput
      end>
  end
  object up_controle_acesso: TUpdateSQL
    Left = 768
    Top = 288
  end
end
