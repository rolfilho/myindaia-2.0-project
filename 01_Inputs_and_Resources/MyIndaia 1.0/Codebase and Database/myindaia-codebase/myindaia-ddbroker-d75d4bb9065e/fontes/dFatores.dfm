object datmFatores: TdatmFatores
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 299
  Top = 114
  Height = 589
  Width = 624
  object dsFatores: TDataSource
    DataSet = qryFatores
    OnStateChange = dsFatoresStateChange
    Left = 36
    Top = 24
  end
  object qryFatores: TQuery
    Tag = 1
    CachedUpdates = True
    AfterPost = qryFatoresAfterPost
    AfterDelete = qryFatoresAfterPost
    AfterScroll = qryFatoresAfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TFATORES')
    UpdateObject = updFatores
    Left = 132
    Top = 24
    object qryFatoresCD_FATOR: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_FATOR'
      Origin = 'DBBROKER.TFATORES.CD_FATOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFatoresNM_FATOR: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_FATOR'
      Origin = 'DBBROKER.TFATORES.NM_FATOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 255
    end
    object qryFatoresDS_FATOR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DS_FATOR'
      Origin = 'DBBROKER.TFATORES.DS_FATOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 255
    end
    object qryFatoresCD_UNID_NEG: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TFATORES.CD_UNID_NEG'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qryFatoresCD_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TFATORES.CD_PRODUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qryFatoresIN_OPCIONAL: TStringField
      DisplayLabel = 'Opcional'
      FieldName = 'IN_OPCIONAL'
      Origin = 'DBBROKER.TFATORES.IN_OPCIONAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryFatoresCD_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TFATORES.CD_GRUPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qryFatoresNM_CAMPO_PROCESSO: TStringField
      DisplayLabel = 'Campo Processo'
      FieldName = 'NM_CAMPO_PROCESSO'
      Origin = 'DBBROKER.TFATORES.NM_CAMPO_PROCESSO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 100
    end
    object qryFatoresNM_TABELA: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'NM_TABELA'
      Origin = 'DBBROKER.TFATORES.NM_TABELA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 100
    end
    object qryFatoresNM_CAMPO_CHAVE_TABELA: TStringField
      DisplayLabel = 'Campo Chave'
      FieldName = 'NM_CAMPO_CHAVE_TABELA'
      Origin = 'DBBROKER.TFATORES.NM_CAMPO_CHAVE_TABELA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 100
    end
    object qryFatoresNM_CAMPO_RETORNO_TABELA: TStringField
      DisplayLabel = 'Campo Retorno'
      FieldName = 'NM_CAMPO_RETORNO_TABELA'
      Origin = 'DBBROKER.TFATORES.NM_CAMPO_RETORNO_TABELA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 100
    end
    object qryFatoresCD_COMPARADOR: TStringField
      DisplayLabel = 'Comparador'
      FieldName = 'CD_COMPARADOR'
      Origin = 'DBBROKER.TFATORES.CD_COMPARADOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qryFatoresNM_SQL: TStringField
      DisplayLabel = 'SQL'
      FieldName = 'NM_SQL'
      Origin = 'DBBROKER.TFATORES.NM_SQL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 255
    end
    object qryFatoresNM_RETORNO: TStringField
      DisplayLabel = 'Retorno'
      FieldName = 'NM_RETORNO'
      Origin = 'DBBROKER.TFATORES.NM_RETORNO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 255
    end
    object qryFatoresLK_NM_UNID_NEG: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_UNID_NEG'
      LookupDataSet = qryUnidades
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 100
      Lookup = True
    end
    object qryFatoresLK_NM_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_PRODUTO'
      LookupDataSet = qryProdutos
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 100
      Lookup = True
    end
    object qryFatoresLK_NM_OPCIONAL: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_OPCIONAL'
      LookupDataSet = qryOpcional
      LookupKeyFields = 'CD_OPCIONAL'
      LookupResultField = 'NM_OPCIONAL'
      KeyFields = 'IN_OPCIONAL'
      Size = 3
      Lookup = True
    end
    object qryFatoresLK_NM_GRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_GRUPO'
      LookupDataSet = qryGrupos
      LookupKeyFields = 'CD_GRUPO'
      LookupResultField = 'NM_GRUPO'
      KeyFields = 'CD_GRUPO'
      Size = 100
      Lookup = True
    end
    object qryFatoresLK_NM_COMPARADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_COMPARADOR'
      LookupDataSet = qryComparadores
      LookupKeyFields = 'CD_COMPARADOR'
      LookupResultField = 'NM_COMPARADOR'
      KeyFields = 'CD_COMPARADOR'
      Size = 50
      Lookup = True
    end
  end
  object updFatores: TUpdateSQL
    ModifySQL.Strings = (
      'update TFATORES'
      'set'
      '  NM_FATOR = :NM_FATOR,'
      '  DS_FATOR = :DS_FATOR,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  IN_OPCIONAL = :IN_OPCIONAL,'
      '  CD_GRUPO = :CD_GRUPO,'
      '  NM_CAMPO_PROCESSO = :NM_CAMPO_PROCESSO,'
      '  NM_TABELA = :NM_TABELA,'
      '  NM_CAMPO_CHAVE_TABELA = :NM_CAMPO_CHAVE_TABELA,'
      '  NM_CAMPO_RETORNO_TABELA = :NM_CAMPO_RETORNO_TABELA,'
      '  CD_COMPARADOR = :CD_COMPARADOR,'
      '  NM_SQL = :NM_SQL,'
      '  NM_RETORNO = :NM_RETORNO'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR')
    InsertSQL.Strings = (
      'insert into TFATORES'
      '  (NM_FATOR, DS_FATOR, CD_UNID_NEG, CD_PRODUTO, IN_OPCIONAL, '
      'CD_GRUPO, '
      '   NM_CAMPO_PROCESSO, NM_TABELA, NM_CAMPO_CHAVE_TABELA, '
      'NM_CAMPO_RETORNO_TABELA, '
      '   CD_COMPARADOR, NM_SQL, NM_RETORNO)'
      'values'
      
        '  (:NM_FATOR, :DS_FATOR, :CD_UNID_NEG, :CD_PRODUTO, :IN_OPCIONAL' +
        ', '
      ':CD_GRUPO, '
      '   :NM_CAMPO_PROCESSO, :NM_TABELA, :NM_CAMPO_CHAVE_TABELA, '
      ':NM_CAMPO_RETORNO_TABELA, '
      '   :CD_COMPARADOR, :NM_SQL, :NM_RETORNO)')
    DeleteSQL.Strings = (
      'delete from TFATORES'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR')
    Left = 236
    Top = 24
  end
  object dsUnidades: TDataSource
    DataSet = qryUnidades
    Left = 396
    Top = 24
  end
  object qryUnidades: TQuery
    Tag = 2
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM (SELECT '#39'XX'#39' AS CD_UNID_NEG, '#39'Todas'#39' NM_UNID_NEG'
      '      UNION ALL'
      '      SELECT CD_UNID_NEG, RTRIM(AP_UNID_NEG) AS NM_UNID_NEG'
      '      FROM TUNID_NEG'
      '      WHERE IN_ATIVO = 1) AS VW'
      
        'ORDER BY CASE WHEN CD_UNID_NEG = '#39'XX'#39' THEN '#39'0'#39' ELSE NM_UNID_NEG ' +
        'END')
    Left = 500
    Top = 24
    object qryUnidadesCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryUnidadesNM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 10
    end
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 396
    Top = 72
  end
  object qryProdutos: TQuery
    Tag = 2
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      
        'FROM (SELECT '#39'XX'#39' AS CD_PRODUTO, '#39'Todos'#39' AS NM_PRODUTO, '#39'XX'#39' AS ' +
        'TP_PRODUTO'
      '      UNION ALL'
      
        '      SELECT CD_PRODUTO, RTRIM(NM_PRODUTO) AS NM_PRODUTO, TP_PRO' +
        'DUTO'
      '      FROM TPRODUTO'
      '      WHERE IN_ATIVO = 1) AS VW'
      
        'ORDER BY CASE WHEN CD_PRODUTO = '#39'XX'#39' THEN '#39'0'#39' ELSE NM_PRODUTO EN' +
        'D')
    Left = 500
    Top = 72
    object qryProdutosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryProdutosNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qryProdutosTP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object dsGrupos: TDataSource
    DataSet = qryGrupos
    Left = 396
    Top = 120
  end
  object qryGrupos: TQuery
    Tag = 2
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM (SELECT '#39'XXX'#39' AS CD_GRUPO, '#39'Todos'#39' AS NM_GRUPO'
      '      UNION ALL'
      '      SELECT CD_GRUPO, RTRIM(NM_GRUPO) AS NM_GRUPO'
      '      FROM TGRUPO'
      '      WHERE IN_ATIVO = 1) AS VW'
      'ORDER BY CASE WHEN CD_GRUPO = '#39'XXX'#39' THEN '#39'0'#39' ELSE NM_GRUPO END')
    Left = 500
    Top = 120
    object qryGruposCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryGruposNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
  object dsCamposProcesso: TDataSource
    DataSet = qryCamposProcesso
    Left = 396
    Top = 168
  end
  object qryCamposProcesso: TQuery
    Tag = 2
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM VW_DEFINICAO_TABELA'
      'WHERE NM_TABELA = '#39'TPROCESSO'#39)
    Left = 500
    Top = 168
    object qryCamposProcessoNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      FixedChar = True
      Size = 255
    end
    object qryCamposProcessoNM_COLUNA: TStringField
      FieldName = 'NM_COLUNA'
      FixedChar = True
      Size = 255
    end
    object qryCamposProcessoDS_TIPO: TStringField
      FieldName = 'DS_TIPO'
      FixedChar = True
      Size = 255
    end
    object qryCamposProcessoIS_PERMITE_NULO: TBooleanField
      FieldName = 'IS_PERMITE_NULO'
    end
  end
  object dsTabelas: TDataSource
    DataSet = qryTabelas
    Left = 396
    Top = 216
  end
  object qryTabelas: TQuery
    Tag = 2
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT OBJECT_ID AS ID_TABELA, UPPER(NAME) AS NM_TABELA'
      'FROM SYS.TABLES'
      'ORDER BY NM_TABELA')
    Left = 500
    Top = 216
    object qryTabelasID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
    object qryTabelasNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      FixedChar = True
      Size = 255
    end
  end
  object dsCamposTabela: TDataSource
    DataSet = qryCamposTabela
    Left = 396
    Top = 264
  end
  object qryCamposTabela: TQuery
    Tag = 2
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UPPER(NM_TABELA) AS NM_TABELA, UPPER(NM_COLUNA) AS NM_COL' +
        'UNA'
      'FROM VW_DEFINICAO_TABELA')
    Left = 500
    Top = 264
    object qryCamposTabelaNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      FixedChar = True
      Size = 255
    end
    object qryCamposTabelaNM_COLUNA: TStringField
      FieldName = 'NM_COLUNA'
      FixedChar = True
      Size = 255
    end
  end
  object dsComparadores: TDataSource
    DataSet = qryComparadores
    Left = 396
    Top = 312
  end
  object qryComparadores: TQuery
    Tag = 2
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCOMPARADORES_FATOR'
      'ORDER BY NM_COMPARADOR')
    Left = 500
    Top = 312
    object qryComparadoresCD_COMPARADOR: TStringField
      FieldName = 'CD_COMPARADOR'
      Origin = 'DBBROKER.TCOMPARADORES_FATOR.CD_COMPARADOR'
      FixedChar = True
      Size = 2
    end
    object qryComparadoresNM_COMPARADOR: TStringField
      FieldName = 'NM_COMPARADOR'
      Origin = 'DBBROKER.TCOMPARADORES_FATOR.NM_COMPARADOR'
      FixedChar = True
      Size = 100
    end
  end
  object dsOpcional: TDataSource
    DataSet = qryOpcional
    Left = 396
    Top = 360
  end
  object qryOpcional: TQuery
    Tag = 2
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT 1 AS CD_OPCIONAL, '#39'Sim'#39' AS NM_OPCIONAL'
      'UNION ALL'
      'SELECT 2 AS CD_OPCIONAL, '#39'N'#227'o'#39' AS NM_OPCIONAL')
    Left = 500
    Top = 360
    object qryOpcionalCD_OPCIONAL: TIntegerField
      FieldName = 'CD_OPCIONAL'
    end
    object qryOpcionalNM_OPCIONAL: TStringField
      FieldName = 'NM_OPCIONAL'
      FixedChar = True
      Size = 3
    end
  end
  object dsServicos: TDataSource
    DataSet = qryServicos
    Left = 396
    Top = 408
  end
  object qryServicos: TQuery
    Tag = 2
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      
        'FROM (SELECT 0 AS CD_SERVICO, '#39'Todos'#39' AS NM_SERVICO, '#39'XX'#39' AS CD_' +
        'CLASSIFICACAO, '#39'XX'#39' AS CD_VIA_TRANSPORTE'
      '      UNION ALL'
      
        '      SELECT CD_SERVICO, RTRIM(NM_SERVICO) AS NM_SERVICO, CD_CLA' +
        'SSIFICACAO, CD_VIA_TRANSPORTE'
      '      FROM TSERVICO_NOVO'
      '      WHERE IN_ATIVO = 1) AS VW'
      'ORDER BY CASE WHEN CD_SERVICO = 0 THEN '#39'0'#39' ELSE NM_SERVICO END')
    Left = 500
    Top = 408
    object qryServicosCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
    end
    object qryServicosNM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qryServicosCD_CLASSIFICACAO: TStringField
      FieldName = 'CD_CLASSIFICACAO'
      FixedChar = True
      Size = 2
    end
    object qryServicosCD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
  end
  object dsFatoresServicos: TDataSource
    DataSet = qryFatoresServicos
    OnStateChange = dsFatoresStateChange
    Left = 36
    Top = 72
  end
  object qryFatoresServicos: TQuery
    CachedUpdates = True
    AfterPost = qryFatoresAfterPost
    AfterDelete = qryFatoresAfterPost
    OnNewRecord = qryFatoresServicosNewRecord
    DatabaseName = 'DBBROKER'
    DataSource = dsFatores
    SQL.Strings = (
      'SELECT *'
      'FROM TFATORES_SERVICOS'
      'WHERE CD_FATOR = :CD_FATOR')
    UpdateObject = updFatoresServicos
    Left = 132
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_FATOR'
        ParamType = ptInput
        Size = 4
      end>
    object qryFatoresServicosCD_FATOR: TIntegerField
      FieldName = 'CD_FATOR'
      Origin = 'DBBROKER.TFATORES_SERVICOS.CD_FATOR'
    end
    object qryFatoresServicosCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TFATORES_SERVICOS.CD_SERVICO'
    end
    object qryFatoresServicosLK_NM_SERVICO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_SERVICO'
      LookupDataSet = qryServicos
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 100
      Lookup = True
    end
  end
  object updFatoresServicos: TUpdateSQL
    ModifySQL.Strings = (
      'update TFATORES_SERVICOS'
      'set'
      '  CD_FATOR = :CD_FATOR,'
      '  CD_SERVICO = :CD_SERVICO'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  CD_SERVICO = :OLD_CD_SERVICO')
    InsertSQL.Strings = (
      'insert into TFATORES_SERVICOS'
      '  (CD_FATOR, CD_SERVICO)'
      'values'
      '  (:CD_FATOR, :CD_SERVICO)')
    DeleteSQL.Strings = (
      'delete from TFATORES_SERVICOS'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  CD_SERVICO = :OLD_CD_SERVICO')
    Left = 236
    Top = 72
  end
  object dsFatoresCampos: TDataSource
    DataSet = qryFatoresCampos
    OnStateChange = dsFatoresStateChange
    Left = 36
    Top = 120
  end
  object qryFatoresCampos: TQuery
    CachedUpdates = True
    AfterPost = qryFatoresAfterPost
    AfterDelete = qryFatoresAfterPost
    OnNewRecord = qryFatoresServicosNewRecord
    DatabaseName = 'DBBROKER'
    DataSource = dsFatores
    SQL.Strings = (
      'SELECT *'
      'FROM TFATORES_CAMPOS'
      'WHERE CD_FATOR = :CD_FATOR')
    UpdateObject = updFatoresCampos
    Left = 132
    Top = 120
    ParamData = <
      item
        DataType = ftAutoInc
        Name = 'CD_FATOR'
        ParamType = ptInput
        Size = 4
      end>
    object qryFatoresCamposCD_FATOR: TIntegerField
      FieldName = 'CD_FATOR'
      Origin = 'DBBROKER.TFATORES_CAMPOS.CD_FATOR'
    end
    object qryFatoresCamposNM_CAMPO_PROCESSO: TStringField
      FieldName = 'NM_CAMPO_PROCESSO'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_CAMPO_PROCESSO'
      FixedChar = True
      Size = 100
    end
    object qryFatoresCamposNM_FATOR_CAMPO: TStringField
      FieldName = 'NM_FATOR_CAMPO'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_FATOR_CAMPO'
      FixedChar = True
      Size = 100
    end
    object qryFatoresCamposNM_LOOKUP_TABELA: TStringField
      FieldName = 'NM_LOOKUP_TABELA'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_LOOKUP_TABELA'
      FixedChar = True
      Size = 100
    end
    object qryFatoresCamposNM_LOOKUP_SQL: TStringField
      FieldName = 'NM_LOOKUP_SQL'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_LOOKUP_SQL'
      FixedChar = True
      Size = 255
    end
    object qryFatoresCamposNM_LOOKUP_CAMPO_CHAVE: TStringField
      FieldName = 'NM_LOOKUP_CAMPO_CHAVE'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_LOOKUP_CAMPO_CHAVE'
      FixedChar = True
      Size = 100
    end
    object qryFatoresCamposNM_LOOKUP_CAMPO_RETORNO: TStringField
      FieldName = 'NM_LOOKUP_CAMPO_RETORNO'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_LOOKUP_CAMPO_RETORNO'
      FixedChar = True
      Size = 100
    end
  end
  object updFatoresCampos: TUpdateSQL
    ModifySQL.Strings = (
      'update TFATORES_CAMPOS'
      'set'
      '  CD_FATOR = :CD_FATOR,'
      '  NM_CAMPO_PROCESSO = :NM_CAMPO_PROCESSO,'
      '  NM_FATOR_CAMPO = :NM_FATOR_CAMPO,'
      '  NM_LOOKUP_TABELA = :NM_LOOKUP_TABELA,'
      '  NM_LOOKUP_SQL = :NM_LOOKUP_SQL,'
      '  NM_LOOKUP_CAMPO_CHAVE = :NM_LOOKUP_CAMPO_CHAVE,'
      '  NM_LOOKUP_CAMPO_RETORNO = :NM_LOOKUP_CAMPO_RETORNO'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  NM_CAMPO_PROCESSO = :OLD_NM_CAMPO_PROCESSO')
    InsertSQL.Strings = (
      'insert into TFATORES_CAMPOS'
      
        '  (CD_FATOR, NM_CAMPO_PROCESSO, NM_FATOR_CAMPO, NM_LOOKUP_TABELA' +
        ', NM_LOOKUP_SQL, '
      '   NM_LOOKUP_CAMPO_CHAVE, NM_LOOKUP_CAMPO_RETORNO)'
      'values'
      
        '  (:CD_FATOR, :NM_CAMPO_PROCESSO, :NM_FATOR_CAMPO, :NM_LOOKUP_TA' +
        'BELA, :NM_LOOKUP_SQL, '
      '   :NM_LOOKUP_CAMPO_CHAVE, :NM_LOOKUP_CAMPO_RETORNO)')
    DeleteSQL.Strings = (
      'delete from TFATORES_CAMPOS'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  NM_CAMPO_PROCESSO = :OLD_NM_CAMPO_PROCESSO')
    Left = 236
    Top = 120
  end
  object dsFatoresTriggers: TDataSource
    DataSet = qryFatoresTriggers
    OnStateChange = dsFatoresStateChange
    Left = 36
    Top = 168
  end
  object qryFatoresTriggers: TQuery
    CachedUpdates = True
    AfterPost = qryFatoresAfterPost
    AfterDelete = qryFatoresAfterPost
    OnNewRecord = qryFatoresServicosNewRecord
    DatabaseName = 'DBBROKER'
    DataSource = dsFatores
    SQL.Strings = (
      'SELECT *'
      'FROM TFATORES_TRIGGERS'
      'WHERE CD_FATOR = :CD_FATOR')
    UpdateObject = updFatoresTriggers
    Left = 132
    Top = 168
    ParamData = <
      item
        DataType = ftAutoInc
        Name = 'CD_FATOR'
        ParamType = ptInput
        Size = 4
      end>
    object qryFatoresTriggersCD_FATOR: TIntegerField
      FieldName = 'CD_FATOR'
      Origin = 'DBBROKER.TFATORES_TRIGGERS.CD_FATOR'
    end
    object qryFatoresTriggersNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'DBBROKER.TFATORES_TRIGGERS.NM_TABELA'
      FixedChar = True
      Size = 100
    end
    object qryFatoresTriggersNM_CAMPOS_CHAVE: TStringField
      FieldName = 'NM_CAMPOS_CHAVE'
      Origin = 'DBBROKER.TFATORES_TRIGGERS.NM_CAMPOS_CHAVE'
      FixedChar = True
      Size = 255
    end
    object qryFatoresTriggersNM_CAMPOS_UPDATE: TStringField
      FieldName = 'NM_CAMPOS_UPDATE'
      Origin = 'DBBROKER.TFATORES_TRIGGERS.NM_CAMPOS_UPDATE'
      FixedChar = True
      Size = 255
    end
  end
  object updFatoresTriggers: TUpdateSQL
    ModifySQL.Strings = (
      'update TFATORES_TRIGGERS'
      'set'
      '  CD_FATOR = :CD_FATOR,'
      '  NM_TABELA = :NM_TABELA,'
      '  NM_CAMPOS_CHAVE = :NM_CAMPOS_CHAVE,'
      '  NM_CAMPOS_UPDATE = :NM_CAMPOS_UPDATE'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  NM_TABELA = :OLD_NM_TABELA')
    InsertSQL.Strings = (
      'insert into TFATORES_TRIGGERS'
      '  (CD_FATOR, NM_TABELA, NM_CAMPOS_CHAVE, NM_CAMPOS_UPDATE)'
      'values'
      '  (:CD_FATOR, :NM_TABELA, :NM_CAMPOS_CHAVE, :NM_CAMPOS_UPDATE)')
    DeleteSQL.Strings = (
      'delete from TFATORES_TRIGGERS'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  NM_TABELA = :OLD_NM_TABELA')
    Left = 236
    Top = 168
  end
  object dsFatoresEvento: TDataSource
    DataSet = qryFatoresEvento
    OnStateChange = dsFatoresStateChange
    Left = 36
    Top = 216
  end
  object qryFatoresEvento: TQuery
    CachedUpdates = True
    AfterPost = qryFatoresEventoAfterPost
    AfterDelete = qryFatoresAfterPost
    OnCalcFields = qryFatoresEventoCalcFields
    OnNewRecord = qryFatoresServicosNewRecord
    DatabaseName = 'DBBROKER'
    DataSource = dsFatores
    SQL.Strings = (
      'SELECT *'
      'FROM TFATORES_EVENTO'
      'WHERE CD_FATOR = :CD_FATOR'
      'ORDER BY NR_PRIORIDADE')
    UpdateObject = updFatoresEvento
    Left = 132
    Top = 216
    ParamData = <
      item
        DataType = ftAutoInc
        Name = 'CD_FATOR'
        ParamType = ptInput
        Size = 4
      end>
    object qryFatoresEventoCD_FATOR: TIntegerField
      FieldName = 'CD_FATOR'
      Origin = 'DBBROKER.TFATORES_EVENTO.CD_FATOR'
    end
    object qryFatoresEventoCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'DBBROKER.TFATORES_EVENTO.CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qryFatoresEventoCD_EVENTO_ANTERIOR: TStringField
      FieldName = 'CD_EVENTO_ANTERIOR'
      Origin = 'DBBROKER.TFATORES_EVENTO.CD_EVENTO_ANTERIOR'
      FixedChar = True
      Size = 3
    end
    object qryFatoresEventoCD_EVENTO_BASE: TStringField
      FieldName = 'CD_EVENTO_BASE'
      Origin = 'DBBROKER.TFATORES_EVENTO.CD_EVENTO_BASE'
      FixedChar = True
      Size = 3
    end
    object qryFatoresEventoPZ_EVENTO_BASE: TIntegerField
      FieldName = 'PZ_EVENTO_BASE'
      Origin = 'DBBROKER.TFATORES_EVENTO.PZ_EVENTO_BASE'
    end
    object qryFatoresEventoNR_PRIORIDADE: TIntegerField
      FieldName = 'NR_PRIORIDADE'
      Origin = 'DBBROKER.TFATORES_EVENTO.NR_PRIORIDADE'
    end
    object qryFatoresEventoIN_ALTERAR: TStringField
      FieldName = 'IN_ALTERAR'
      Origin = 'DBBROKER.TFATORES_EVENTO.IN_ALTERAR'
      FixedChar = True
      Size = 1
    end
    object qryFatoresEventoIN_EXCLUIR: TStringField
      FieldName = 'IN_EXCLUIR'
      Origin = 'DBBROKER.TFATORES_EVENTO.IN_EXCLUIR'
      FixedChar = True
      Size = 1
    end
    object qryFatoresEventoCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TFATORES_EVENTO.CD_SERVICO'
    end
    object qryFatoresEventoLK_NM_EVENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_EVENTO'
      LookupDataSet = qryEventos
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO'
      Size = 100
      Lookup = True
    end
    object qryFatoresEventoLK_NM_EVENTO_ANTERIOR: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_EVENTO_ANTERIOR'
      LookupDataSet = qryEventos
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO_ANTERIOR'
      Size = 100
      Lookup = True
    end
    object qryFatoresEventoLK_NM_EVENTO_BASE: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_EVENTO_BASE'
      LookupDataSet = qryEventos
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO_BASE'
      Size = 100
      Lookup = True
    end
    object qryFatoresEventoLK_NM_SERVICO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_SERVICO'
      LookupDataSet = qryServicos
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 255
      Lookup = True
    end
    object qryFatoresEventoIN_INCLUIR: TStringField
      FieldKind = fkCalculated
      FieldName = 'IN_INCLUIR'
      Size = 1
      Calculated = True
    end
    object qryFatoresEventoNM_OPERACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NM_OPERACAO'
      Size = 10
      Calculated = True
    end
    object qryFatoresEventoIN_PRAZO_UTIL: TStringField
      FieldName = 'IN_PRAZO_UTIL'
      Origin = 'DBBROKER.TFATORES_EVENTO.IN_PRAZO_UTIL'
      FixedChar = True
      Size = 1
    end
    object qryFatoresEventoIN_PRAZO_FERIADO: TStringField
      FieldName = 'IN_PRAZO_FERIADO'
      Origin = 'DBBROKER.TFATORES_EVENTO.IN_PRAZO_FERIADO'
      FixedChar = True
      Size = 1
    end
  end
  object updFatoresEvento: TUpdateSQL
    ModifySQL.Strings = (
      'update TFATORES_EVENTO'
      'set'
      '  CD_FATOR = :CD_FATOR,'
      '  CD_EVENTO = :CD_EVENTO,'
      '  CD_EVENTO_ANTERIOR = :CD_EVENTO_ANTERIOR,'
      '  CD_EVENTO_BASE = :CD_EVENTO_BASE,'
      '  PZ_EVENTO_BASE = :PZ_EVENTO_BASE,'
      '  NR_PRIORIDADE = :NR_PRIORIDADE,'
      '  IN_ALTERAR = :IN_ALTERAR,'
      '  IN_EXCLUIR = :IN_EXCLUIR,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  IN_PRAZO_UTIL = :IN_PRAZO_UTIL,'
      '  IN_PRAZO_FERIADO = :IN_PRAZO_FERIADO'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  CD_EVENTO = :OLD_CD_EVENTO and'
      '  CD_SERVICO = :OLD_CD_SERVICO')
    InsertSQL.Strings = (
      'insert into TFATORES_EVENTO'
      '  (CD_FATOR, CD_EVENTO, CD_EVENTO_ANTERIOR, CD_EVENTO_BASE, '
      'PZ_EVENTO_BASE, '
      
        '   NR_PRIORIDADE, IN_ALTERAR, IN_EXCLUIR, CD_SERVICO, IN_PRAZO_U' +
        'TIL, '
      'IN_PRAZO_FERIADO)'
      'values'
      '  (:CD_FATOR, :CD_EVENTO, :CD_EVENTO_ANTERIOR, :CD_EVENTO_BASE, '
      ':PZ_EVENTO_BASE, '
      '   :NR_PRIORIDADE, :IN_ALTERAR, :IN_EXCLUIR, :CD_SERVICO, '
      ':IN_PRAZO_UTIL, '
      '   :IN_PRAZO_FERIADO)')
    DeleteSQL.Strings = (
      'delete from TFATORES_EVENTO'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  CD_EVENTO = :OLD_CD_EVENTO and'
      '  CD_SERVICO = :OLD_CD_SERVICO')
    Left = 236
    Top = 216
  end
  object dsEventos: TDataSource
    DataSet = qryEventos
    Left = 396
    Top = 456
  end
  object qryEventos: TQuery
    Tag = 2
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EVENTO, NM_EVENTO'
      'FROM TEVENTO')
    Left = 500
    Top = 456
    object qryEventosCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'DBBROKER.TEVENTO.CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qryEventosNM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Origin = 'DBBROKER.TEVENTO.NM_EVENTO'
      FixedChar = True
      Size = 50
    end
  end
end
