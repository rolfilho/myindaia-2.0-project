object datm_usuario: Tdatm_usuario
  OldCreateOrder = True
  Left = 421
  Height = 652
  Width = 566
  object ds_usuario: TDataSource
    DataSet = qry_usuario_
    OnStateChange = ds_usuarioStateChange
    Left = 215
    Top = 77
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 32
    Top = 20
  end
  object ds_usuario_habilitacao: TDataSource
    DataSet = qry_usuario_habilitacao_
    Left = 313
    Top = 77
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 32
    Top = 77
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TUSUARIO_HABILITACAO'
      'WHERE CD_USUARIO=:CD_USUARIO')
    Left = 313
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object qry_usuario_habilitacao_CD_USUARIO: TStringField
      DisplayLabel = 'C'#243'd. Usu'#225'rio'
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      DisplayLabel = 'C'#243'd. Unid.'
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      DisplayLabel = 'C'#243'd. Prod.'
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_DT_HABILITACAO: TDateTimeField
      DisplayLabel = 'Habilita'#231#227'o'
      FieldName = 'DT_HABILITACAO'
      Origin = 'TUSUARIO_HABILITACAO.DT_HABILITACAO'
    end
    object qry_usuario_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO_HABILITACAO.IN_ATIVO'
      Size = 1
    end
    object qry_usuario_habilitacao_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_usuario_habilitacao_look_unidade: TStringField
      DisplayLabel = 'Unidade'
      FieldKind = fkLookup
      FieldName = 'look_unidade'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 35
      Lookup = True
    end
    object qry_usuario_habilitacao_look_produto: TStringField
      DisplayLabel = 'Produto'
      FieldKind = fkLookup
      FieldName = 'look_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 30
      Lookup = True
    end
    object qry_usuario_habilitacao_IN_DEFAULT: TStringField
      FieldName = 'IN_DEFAULT'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 1
    end
    object qry_usuario_habilitacao_look_default: TStringField
      FieldKind = fkLookup
      FieldName = 'look_default'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_DEFAULT'
      Size = 3
      Lookup = True
    end
    object qry_usuario_habilitacao_IN_ACESSO_SITE: TStringField
      FieldName = 'IN_ACESSO_SITE'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 1
    end
    object qry_usuario_habilitacao_look_acesso_site: TStringField
      FieldKind = fkLookup
      FieldName = 'look_acesso_site'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ACESSO_SITE'
      Lookup = True
    end
  end
  object qry_ult_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(U.CD_USUARIO) ULTIMO'
      'FROM  TUSUARIO U')
    Left = 434
    Top = 20
    object qry_ult_usuario_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM'
      'TUNID_NEG ORDER BY'
      'NM_UNID_NEG'
      '')
    Left = 32
    Top = 136
    object qry_unid_neg_CD_UNID_NEG: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG.IN_ATIVO'
      Size = 1
    end
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 32
    Top = 195
  end
  object ds_produto: TDataSource
    Left = 122
    Top = 195
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TPRODUTO')
    Left = 122
    Top = 136
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
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Origin = 'TPRODUTO.AP_PRODUTO'
      Size = 10
    end
    object qry_produto_CD_VIATRANSP: TStringField
      FieldName = 'CD_VIATRANSP'
      Origin = 'TPRODUTO.CD_VIATRANSP'
      Size = 1
    end
    object qry_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 1
    end
  end
  object qry_cargo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TCARGO ')
    Left = 215
    Top = 200
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
  end
  object ds_cargo: TDataSource
    DataSet = qry_cargo_
    Left = 215
    Top = 259
  end
  object qry_pesquisa_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS QTD_DEFAULT '
      'FROM  TUSUARIO_HABILITACAO'
      'WHERE CD_USUARIO=:CD_USUARIO AND '
      '               IN_DEFAULT='#39'1'#39' ')
    Left = 434
    Top = 77
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_pesquisa_default_QTD_DEFAULT: TIntegerField
      FieldName = 'QTD_DEFAULT'
    end
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TUSUARIO_HABILITACAO UH'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39)
    Left = 313
    Top = 195
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
  object qry_usuario_lista_: TQuery
    AfterScroll = qry_usuario_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO'
      'WHERE ( CD_USUARIO = :CD_USUARIO ) OR'
      '      ( ( :CD_USUARIO = '#39#39' ))')
    Left = 122
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_usuario_lista_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object qry_usuario_lista_CD_SENHA: TStringField
      FieldName = 'CD_SENHA'
      Size = 10
    end
    object qry_usuario_lista_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Size = 3
    end
    object qry_usuario_lista_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Size = 50
    end
    object qry_usuario_lista_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Size = 15
    end
    object qry_usuario_lista_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_usuario_lista_LK_NM_CARGO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_CARGO'
      LookupDataSet = qry_cargo_
      LookupKeyFields = 'CD_CARGO'
      LookupResultField = 'NM_CARGO'
      KeyFields = 'CD_CARGO'
      Size = 40
      Lookup = True
    end
    object qry_usuario_lista_LK_ATIVO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_ATIVO'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_usuario_lista_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TUSUARIO.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_usuario_lista: TDataSource
    DataSet = qry_usuario_lista_
    Left = 122
    Top = 77
  end
  object sp_atz_habilitacao_padrao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_habilitacao_padrao'
    Left = 434
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_default'
        ParamType = ptInput
      end>
  end
  object qry_apelido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) TOT'
      'FROM TUSUARIO '
      'WHERE AP_USUARIO = :AP_USUARIO AND'
      'CD_USUARIO <> :CD_USUARIO')
    Left = 313
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'AP_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object qry_apelido_TOT: TIntegerField
      FieldName = 'TOT'
    end
  end
  object sp_inclui_login: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_inclui_login'
    Left = 434
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@senha'
        ParamType = ptInput
      end>
  end
  object db_broker2: TDatabase
    AliasName = 'BROKER'
    DatabaseName = 'DDBROKER'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SA'
      'PASSWORD=123')
    SessionName = 'Default'
    Left = 434
    Top = 329
  end
  object sp_exclui_login: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exclui_login'
    Left = 434
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 1
      end
      item
        DataType = ftString
        Name = '@usuario'
        ParamType = ptInput
      end>
  end
  object qry_usuario_: TQuery
    CachedUpdates = True
    AfterInsert = qry_usuario_AfterInsert
    AfterPost = qry_usuario_AfterPost
    AfterDelete = qry_usuario_AfterDelete
    OnCalcFields = qry_usuario_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      'CD_USUARIO,'
      'CD_SENHA,'
      'CD_CARGO,'
      'NM_USUARIO,'
      'AP_USUARIO,'
      'IN_ATIVO,'
      'CD_INSTALACAO,'
      'CONVERT(TEXT,NM_EMAIL) NM_EMAIL,'
      'IN_AVISO_PO,'
      'CD_CELULA,'
      'CD_TRANSP_ROD,'
      'IN_SELECIONADO,'
      'CD_IDIOMA,'
      'DT_ULT_ALT_SENHA,'
      'IN_ALT_STATUS_RECEB,'
      'CD_EMPRESA,'
      'CD_CHEFIA,'
      'IN_MODO_PREVIEW,'
      'IN_FECHAR_MOV_FINANC,'
      'IN_PERMITE_FATURAMENTO,'
      'IN_PERMITE_ALTERA_REG_DDE,'
      'CD_COMPUTADOR,'
      'EXIBE_RESUMO,'
      'EXIBE_DETALHE,'
      'IN_ZERA_LIQUIDACAO,'
      'GRUPO_RAP,'
      'CD_GRUPO_DETALHES,'
      'SUPERVISA_PENDENCIAS,'
      'NM_SENHA_INICIAL,'
      'IN_MANAGER,'
      'IN_MANAGER_SITE,'
      'CD_SUPERIOR_DIRETO,'
      'QT_SENHA_INCORRETA'
      'FROM TUSUARIO (NOLOCK)'
      'WHERE CD_USUARIO = :CD_USUARIO')
    UpdateObject = upd_usuario
    Left = 215
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object qry_usuario_CD_USUARIO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_CD_SENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'CD_SENHA'
      Origin = 'TUSUARIO.CD_SENHA'
      Size = 10
    end
    object qry_usuario_CD_CARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CD_CARGO'
      Origin = 'TUSUARIO.CD_CARGO'
      Size = 3
    end
    object qry_usuario_NM_USUARIO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
    object qry_usuario_AP_USUARIO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_USUARIO'
      Origin = 'TUSUARIO.AP_USUARIO'
      Size = 15
    end
    object qry_usuario_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO.IN_ATIVO'
      OnChange = qry_usuario_IN_ATIVOChange
      Size = 1
    end
    object qry_usuario_LK_NM_CARGO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_CARGO'
      LookupDataSet = qry_cargo_
      LookupKeyFields = 'CD_CARGO'
      LookupResultField = 'NM_CARGO'
      KeyFields = 'CD_CARGO'
      Size = 40
      Lookup = True
    end
    object qry_usuario_IN_AVISO_PO: TStringField
      FieldName = 'IN_AVISO_PO'
      Origin = 'TUSUARIO.CD_SENHA'
      Size = 1
    end
    object qry_usuario_CD_CELULA: TStringField
      FieldName = 'CD_CELULA'
      Origin = 'TUSUARIO.CD_SENHA'
      Size = 2
    end
    object qry_usuario_LookCelula: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCelula'
      Size = 30
      Calculated = True
    end
    object qry_usuario_CD_TRANSP_ROD: TStringField
      FieldName = 'CD_TRANSP_ROD'
      Origin = 'DBBROKER.TUSUARIO.CD_TRANSP_ROD'
      FixedChar = True
      Size = 4
    end
    object qry_usuario_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TUSUARIO.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_CD_INSTALACAO: TStringField
      FieldName = 'CD_INSTALACAO'
      Origin = 'DBBROKER.TUSUARIO.CD_INSTALACAO'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_CD_IDIOMA: TIntegerField
      FieldName = 'CD_IDIOMA'
      Origin = 'DBBROKER.TUSUARIO.CD_IDIOMA'
    end
    object qry_usuario_DT_ULT_ALT_SENHA: TDateTimeField
      FieldName = 'DT_ULT_ALT_SENHA'
      Origin = 'DBBROKER.TUSUARIO.DT_ULT_ALT_SENHA'
    end
    object qry_usuario_IN_ALT_STATUS_RECEB: TStringField
      FieldName = 'IN_ALT_STATUS_RECEB'
      Origin = 'DBBROKER.TUSUARIO.IN_ALT_STATUS_RECEB'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TUSUARIO.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_usuario_CD_CHEFIA: TStringField
      FieldName = 'CD_CHEFIA'
      Origin = 'DBBROKER.TUSUARIO.CD_CHEFIA'
      FixedChar = True
      Size = 4
    end
    object qry_usuario_IN_MODO_PREVIEW: TStringField
      FieldName = 'IN_MODO_PREVIEW'
      Origin = 'DBBROKER.TUSUARIO.IN_MODO_PREVIEW'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_IN_FECHAR_MOV_FINANC: TStringField
      FieldName = 'IN_FECHAR_MOV_FINANC'
      Origin = 'DBBROKER.TUSUARIO.IN_FECHAR_MOV_FINANC'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_IN_PERMITE_FATURAMENTO: TStringField
      FieldName = 'IN_PERMITE_FATURAMENTO'
      Origin = 'DBBROKER.TUSUARIO.IN_PERMITE_FATURAMENTO'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_IN_PERMITE_ALTERA_REG_DDE: TStringField
      FieldName = 'IN_PERMITE_ALTERA_REG_DDE'
      Origin = 'DBBROKER.TUSUARIO.IN_PERMITE_ALTERA_REG_DDE'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_IN_ZERA_LIQUIDACAO: TStringField
      FieldName = 'IN_ZERA_LIQUIDACAO'
      Origin = 'DBBROKER.TUSUARIO.IN_ZERA_LIQUIDACAO'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_CD_COMPUTADOR: TIntegerField
      FieldName = 'CD_COMPUTADOR'
      Origin = 'DBBROKER.TUSUARIO.CD_COMPUTADOR'
    end
    object qry_usuario_EXIBE_RESUMO: TStringField
      FieldName = 'EXIBE_RESUMO'
      Origin = 'DBBROKER.TUSUARIO.EXIBE_RESUMO'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_EXIBE_DETALHE: TStringField
      FieldName = 'EXIBE_DETALHE'
      Origin = 'DBBROKER.TUSUARIO.EXIBE_DETALHE'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_GRUPO_RAP: TStringField
      FieldName = 'GRUPO_RAP'
      Origin = 'DBBROKER.TUSUARIO.GRUPO_RAP'
      FixedChar = True
      Size = 3
    end
    object qry_usuario_SUPERVISA_PENDENCIAS: TStringField
      FieldName = 'SUPERVISA_PENDENCIAS'
      Origin = 'DBBROKER.TUSUARIO.SUPERVISA_PENDENCIAS'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_NM_SENHA_INICIAL: TStringField
      FieldName = 'NM_SENHA_INICIAL'
      Origin = 'DBBROKER.TUSUARIO.NM_SENHA_INICIAL'
      FixedChar = True
      Size = 8
    end
    object qry_usuario_NM_EMAIL: TMemoField
      FieldName = 'NM_EMAIL'
      BlobType = ftMemo
    end
    object qry_usuario_CD_GRUPO_DETALHES: TStringField
      FieldName = 'CD_GRUPO_DETALHES'
      FixedChar = True
      Size = 3
    end
    object qry_usuario_IN_MANAGER: TStringField
      FieldName = 'IN_MANAGER'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_IN_MANAGER_SITE: TStringField
      FieldName = 'IN_MANAGER_SITE'
      FixedChar = True
      Size = 1
    end
    object qry_usuario_CD_SUPERIOR_DIRETO: TStringField
      FieldName = 'CD_SUPERIOR_DIRETO'
      FixedChar = True
      Size = 4
    end
    object qry_usuario_QT_SENHA_INCORRETA: TIntegerField
      FieldName = 'QT_SENHA_INCORRETA'
    end
  end
  object qry_lista_: TQuery
    AfterScroll = qry_lista_AfterScroll
    OnCalcFields = qry_lista_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT U.CD_USUARIO, U.CD_SENHA, U.NM_USUARIO, U.AP_USUARIO, U.I' +
        'N_ATIVO, C.NM_CARGO, U.IN_SELECIONADO'
      'FROM TUSUARIO U (NOLOCK)'
      '  INNER JOIN TCARGO C (NOLOCK) ON C.CD_CARGO = U.CD_CARGO'
      'WHERE'
      '  U.IN_ATIVO = '#39'1'#39
      'ORDER BY'
      'NM_USUARIO')
    Left = 122
    Top = 329
    object qry_lista_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object qry_lista_CD_SENHA: TStringField
      FieldName = 'CD_SENHA'
      Size = 10
    end
    object qry_lista_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Size = 50
    end
    object qry_lista_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Size = 15
    end
    object qry_lista_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_lista_NM_CARGO: TStringField
      FieldName = 'NM_CARGO'
      Size = 40
    end
    object qry_lista_LK_ATIVO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_ATIVO'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_lista_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_lista_calcSelecionado: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcSelecionado'
      Size = 1
      Calculated = True
    end
    object qry_lista_calcativo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcativo'
      Size = 1
      Calculated = True
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 32
    Top = 329
  end
  object guarda: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO'
      'WHERE ( CD_USUARIO = :CD_USUARIO OR'
      '              CD_CARGO IN'
      '              ( SELECT CD_DESCENDENTE'
      '                FROM TCARGO_DESCENDENTE'
      '                WHERE CD_CARGO = :CD_CARGO AND'
      '                      CD_DESCENDENTE <> :CD_CARGO ) ) OR'
      '      ( ( :CD_USUARIO = '#39#39' ) AND ( :CD_CARGO = '#39#39' ) )'
      'ORDER BY'
      'NM_USUARIO')
    Left = 207
    Top = 401
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object StringField2: TStringField
      FieldName = 'CD_SENHA'
      Size = 10
    end
    object StringField3: TStringField
      FieldName = 'CD_CARGO'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'NM_USUARIO'
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'AP_USUARIO'
      Size = 15
    end
    object StringField6: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object StringField7: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_CARGO'
      LookupDataSet = qry_cargo_
      LookupKeyFields = 'CD_CARGO'
      LookupResultField = 'NM_CARGO'
      KeyFields = 'CD_CARGO'
      Size = 40
      Lookup = True
    end
    object StringField8: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_ATIVO'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
  end
  object qry_celula_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_CELULA, NM_CELULA'
      'FROM   TCELULA'
      'WHERE  CD_CELULA = :CD_CELULA')
    Left = 313
    Top = 329
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptInput
      end>
  end
  object qry_usuario_permissao_: TQuery
    OnCalcFields = qry_usuario_permissao_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_USUARIO, CD_CLIENTE, IN_ATIVO'
      'FROM TPERMISSAO'
      'WHERE CD_USUARIO =:CD_USUARIO')
    Left = 313
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object qry_usuario_permissao_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPERMISSAO.CD_CLIENTE'
      Size = 5
    end
    object qry_usuario_permissao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TPERMISSAO.IN_ATIVO'
      Size = 1
    end
    object qry_usuario_permissao_LookNmCliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookNmCliente'
      Size = 50
      Calculated = True
    end
    object qry_usuario_permissao_LookAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookAtivo'
      Calculated = True
    end
    object qry_usuario_permissao_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPERMISSAO.CD_USUARIO'
      Size = 4
    end
  end
  object ds_usuario_permissao: TDataSource
    DataSet = qry_usuario_permissao_
    Left = 215
    Top = 328
  end
  object qry_empresa_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'ORDER BY CD_EMPRESA')
    Left = 122
    Top = 264
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
  object ds_empresa: TDataSource
    DataSet = qry_empresa_
    Left = 32
    Top = 264
  end
  object qry_permissao_area_: TQuery
    OnCalcFields = qry_permissao_area_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_USUARIO, CD_AREA, IN_ATIVO'
      'FROM TPERMISSAO_AREA (NOLOCK)'
      'WHERE CD_USUARIO =:CD_USUARIO')
    Left = 130
    Top = 397
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object qry_permissao_area_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TPERMISSAO_AREA.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_permissao_area_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TPERMISSAO_AREA.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_permissao_area_LookAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookAtivo'
      Calculated = True
    end
    object qry_permissao_area_LookNmArea: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookNmArea'
      Calculated = True
    end
    object qry_permissao_area_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TPERMISSAO_AREA.CD_AREA'
      FixedChar = True
      Size = 2
    end
  end
  object ds_permissao_area: TDataSource
    DataSet = qry_permissao_area_
    Left = 32
    Top = 397
  end
  object SqlPermissao_EmpresaEst: TQuery
    OnCalcFields = SqlPermissao_EmpresaEstCalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'select CD_USUARIO, CD_EMPRESA, IN_ATIVO from TPERMISSAO_EMPRESA_' +
        'EST(NOLOCK)'
      'WHERE CD_USUARIO =:CD_USUARIO')
    Left = 202
    Top = 461
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object SqlPermissao_EmpresaEstCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TPERMISSAO_EMPRESA_EST.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object SqlPermissao_EmpresaEstCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TPERMISSAO_EMPRESA_EST.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object SqlPermissao_EmpresaEstIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TPERMISSAO_EMPRESA_EST.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object SqlPermissao_EmpresaEstLookNmEmpresa: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'LookNmEmpresa'
      Calculated = True
    end
    object SqlPermissao_EmpresaEstLookAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookAtivo'
      Calculated = True
    end
  end
  object DtsPermissao_EmpresaEst: TDataSource
    DataSet = SqlPermissao_EmpresaEst
    Left = 56
    Top = 461
  end
  object ds_lingua: TDataSource
    DataSet = qry_lingua_
    Left = 304
    Top = 392
  end
  object qry_lingua_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TIDIOMA')
    Left = 376
    Top = 392
    object qry_lingua_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TIDIOMA.CODIGO'
      Size = 1
    end
    object qry_lingua_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIDIOMA.DESCRICAO'
      Size = 30
    end
  end
  object upd_usuario: TUpdateSQL
    ModifySQL.Strings = (
      'update TUSUARIO'
      'set'
      '  CD_USUARIO = :CD_USUARIO,'
      '  CD_SENHA = :CD_SENHA,'
      '  CD_CARGO = :CD_CARGO,'
      '  NM_USUARIO = :NM_USUARIO,'
      '  AP_USUARIO = :AP_USUARIO,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  CD_INSTALACAO = :CD_INSTALACAO,'
      '  NM_EMAIL = :NM_EMAIL,'
      '  IN_AVISO_PO = :IN_AVISO_PO,'
      '  CD_CELULA = :CD_CELULA,'
      '  CD_TRANSP_ROD = :CD_TRANSP_ROD,'
      '  IN_SELECIONADO = :IN_SELECIONADO,'
      '  CD_IDIOMA = :CD_IDIOMA,'
      '  DT_ULT_ALT_SENHA = :DT_ULT_ALT_SENHA,'
      '  IN_ALT_STATUS_RECEB = :IN_ALT_STATUS_RECEB,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  CD_CHEFIA = :CD_CHEFIA,'
      '  IN_MODO_PREVIEW = :IN_MODO_PREVIEW,'
      '  IN_FECHAR_MOV_FINANC = :IN_FECHAR_MOV_FINANC,'
      '  IN_PERMITE_FATURAMENTO = :IN_PERMITE_FATURAMENTO,'
      '  IN_PERMITE_ALTERA_REG_DDE = :IN_PERMITE_ALTERA_REG_DDE,'
      '  CD_COMPUTADOR = :CD_COMPUTADOR,'
      '  EXIBE_RESUMO = :EXIBE_RESUMO,'
      '  EXIBE_DETALHE = :EXIBE_DETALHE,'
      '  IN_ZERA_LIQUIDACAO = :IN_ZERA_LIQUIDACAO,'
      '  CD_GRUPO_DETALHES = :CD_GRUPO_DETALHES,'
      '  GRUPO_RAP = :GRUPO_RAP,'
      '  SUPERVISA_PENDENCIAS = :SUPERVISA_PENDENCIAS,'
      '  NM_SENHA_INICIAL = :NM_SENHA_INICIAL,'
      '  IN_MANAGER_SITE = :IN_MANAGER_SITE,'
      '  CD_SUPERIOR_DIRETO = :CD_SUPERIOR_DIRETO'
      'where'
      '  CD_USUARIO = :OLD_CD_USUARIO')
    InsertSQL.Strings = (
      'insert into TUSUARIO'
      
        '  (CD_USUARIO, CD_SENHA, CD_CARGO, NM_USUARIO, AP_USUARIO, IN_AT' +
        'IVO, CD_INSTALACAO, '
      
        '   NM_EMAIL, IN_AVISO_PO, CD_CELULA, CD_TRANSP_ROD, IN_SELECIONA' +
        'DO, CD_IDIOMA, '
      
        '   DT_ULT_ALT_SENHA, IN_ALT_STATUS_RECEB, CD_EMPRESA, CD_CHEFIA,' +
        ' IN_MODO_PREVIEW, '
      
        '   IN_FECHAR_MOV_FINANC, IN_PERMITE_FATURAMENTO, IN_PERMITE_ALTE' +
        'RA_REG_DDE, '
      
        '   CD_COMPUTADOR, EXIBE_RESUMO, EXIBE_DETALHE, IN_ZERA_LIQUIDACA' +
        'O, CD_GRUPO_DETALHES, GRUPO_RAP, '
      
        '   SUPERVISA_PENDENCIAS, NM_SENHA_INICIAL, IN_MANAGER_SITE, CD_S' +
        'UPERIOR_DIRETO)'
      'values'
      
        '  (:CD_USUARIO, :CD_SENHA, :CD_CARGO, :NM_USUARIO, :AP_USUARIO, ' +
        ':IN_ATIVO, '
      
        '   :CD_INSTALACAO, :NM_EMAIL, :IN_AVISO_PO, :CD_CELULA, :CD_TRAN' +
        'SP_ROD, '
      
        '   :IN_SELECIONADO, :CD_IDIOMA, :DT_ULT_ALT_SENHA, :IN_ALT_STATU' +
        'S_RECEB, '
      
        '   :CD_EMPRESA, :CD_CHEFIA, :IN_MODO_PREVIEW, :IN_FECHAR_MOV_FIN' +
        'ANC, :IN_PERMITE_FATURAMENTO, '
      
        '   :IN_PERMITE_ALTERA_REG_DDE, :CD_COMPUTADOR, :EXIBE_RESUMO, :E' +
        'XIBE_DETALHE, '
      
        '   :IN_ZERA_LIQUIDACAO, :CD_GRUPO_DETALHES, :GRUPO_RAP, :SUPERVI' +
        'SA_PENDENCIAS, :NM_SENHA_INICIAL, :IN_MANAGER_SITE, :CD_SUPERIOR' +
        '_DIRETO)')
    DeleteSQL.Strings = (
      'delete from TUSUARIO'
      'where'
      '  CD_USUARIO = :OLD_CD_USUARIO')
    Left = 216
    Top = 136
  end
  object ds_permissao_grupo_: TDataSource
    DataSet = qry_permissao_grupo_
    Left = 48
    Top = 544
  end
  object qry_permissao_grupo_: TQuery
    OnCalcFields = qry_permissao_grupo_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_USUARIO, CD_GRUPO, IN_ATIVO'
      'FROM TPERMISSAO_GRUPO (NOLOCK)'
      'WHERE CD_USUARIO =:CD_USUARIO')
    Left = 162
    Top = 544
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_permissao_grupo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TPERMISSAO_GRUPO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_permissao_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TPERMISSAO_GRUPO.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_permissao_grupo_LookNmGrupo: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookNmGrupo'
      Size = 100
      Calculated = True
    end
    object qry_permissao_grupo_LookAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookAtivo'
      Size = 15
      Calculated = True
    end
    object qry_permissao_grupo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TPERMISSAO_GRUPO.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_grupo: TDataSource
    DataSet = qry_grupo_
    Left = 320
    Top = 472
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO, UPPER(NM_GRUPO) AS NM_GRUPO'
      'FROM TGRUPO'
      'WHERE IN_ATIVO = '#39'1'#39
      'ORDER BY NM_GRUPO')
    Left = 384
    Top = 472
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TGRUPO.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'DBBROKER.TGRUPO.NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
end
