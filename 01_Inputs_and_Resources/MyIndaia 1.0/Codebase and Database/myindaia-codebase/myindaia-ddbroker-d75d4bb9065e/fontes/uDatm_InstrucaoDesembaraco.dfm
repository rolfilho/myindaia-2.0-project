object Datm_InstrDesemb: TDatm_InstrDesemb
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 456
  Top = 172
  Height = 494
  Width = 435
  object qry_InstrucaoDesemb: TQuery
    CachedUpdates = True
    AfterInsert = qry_InstrucaoDesembAfterInsert
    AfterEdit = qry_InstrucaoDesembAfterInsert
    AfterPost = qry_InstrucaoDesembAfterPost
    AfterDelete = qry_InstrucaoDesembAfterPost
    AfterScroll = qry_InstrucaoDesembAfterScroll
    OnCalcFields = qry_InstrucaoDesembCalcFields
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT A.*, B.NM_USUARIO, C.NM_USUARIO NM_USUARIO_AUTORIZACAO, D' +
        '.AP_EMPRESA'
      'FROM'
      '  TINSTRUCAO_DESEMBARACO A'
      'LEFT JOIN TUSUARIO B     ON  B.CD_USUARIO = A.CD_USUARIO'
      
        'LEFT JOIN TUSUARIO C     ON  C.CD_USUARIO = A.CD_USUARIO_AUTORIZ' +
        'ACAO'
      'LEFT JOIN TEMPRESA_NAC D ON  D.CD_EMPRESA = A.CD_CLIENTE'
      'WHERE ISNULL(A.IN_AUTORIZADO, '#39'0'#39') IN ('#39'0'#39', :IN_AUTORIZADO)'
      '  AND A.DT_CRIACAO >= CASE :IN_30_DIAS'
      '                          WHEN '#39'0'#39' THEN 0'
      '                      ELSE DATEADD(DAY, -30, GETDATE())'
      '                      END'
      'ORDER BY RIGHT(RTRIM(ID_CODIGO), 2), ID_CODIGO')
    UpdateObject = updInstrucaoDesemb
    Left = 56
    Top = 109
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_AUTORIZADO'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'IN_30_DIAS'
        ParamType = ptInput
        Value = '1'
      end>
    object qry_InstrucaoDesembID_CODIGO: TStringField
      DisplayLabel = 'Id. Instru'#231#227'o Embarque'
      DisplayWidth = 18
      FieldName = 'ID_CODIGO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO.ID_CODIGO'
      FixedChar = True
      Size = 13
    end
    object qry_InstrucaoDesembCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO.CD_USUARIO'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object qry_InstrucaoDesembDT_CRIACAO: TDateTimeField
      DisplayLabel = 'Dt. Cria'#231#227'o'
      DisplayWidth = 12
      FieldName = 'DT_CRIACAO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO.DT_CRIACAO'
    end
    object qry_InstrucaoDesembNM_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      DisplayWidth = 14
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qry_InstrucaoDesembIN_AUTORIZADO: TStringField
      FieldName = 'IN_AUTORIZADO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO.IN_AUTORIZADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qry_InstrucaoDesembCD_USUARIO_AUTORIZACAO: TStringField
      FieldName = 'CD_USUARIO_AUTORIZACAO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO.CD_USUARIO_AUTORIZACAO'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object qry_InstrucaoDesembDT_AUTORIZACAO: TDateTimeField
      DisplayLabel = 'Dt. Autoriza'#231#227'o'
      DisplayWidth = 11
      FieldName = 'DT_AUTORIZACAO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO.DT_AUTORIZACAO'
    end
    object qry_InstrucaoDesembNM_USUARIO_AUTORIZACAO: TStringField
      DisplayLabel = 'Autorizado por'
      DisplayWidth = 12
      FieldName = 'NM_USUARIO_AUTORIZACAO'
      FixedChar = True
      Size = 50
    end
    object qry_InstrucaoDesembNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qry_InstrucaoDesembCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object qry_InstrucaoDesembAP_EMPRESA: TStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 20
      FieldName = 'AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
    object qry_InstrucaoDesembcalcNR_PROCESSO: TStringField
      DisplayLabel = 'Processo Vinculado'
      FieldKind = fkCalculated
      FieldName = 'calcNR_PROCESSO'
      Size = 10
      Calculated = True
    end
    object qry_InstrucaoDesembCD_RESPONSAVEL: TStringField
      FieldName = 'CD_RESPONSAVEL'
      FixedChar = True
      Size = 4
    end
    object qry_InstrucaoDesembCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      FixedChar = True
      Size = 4
    end
    object qry_InstrucaoDesembNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qry_InstrucaoDesembCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_InstrucaoDesembTX_OBSERVACOES: TStringField
      FieldName = 'TX_OBSERVACOES'
      FixedChar = True
      Size = 2000
    end
  end
  object dts_InstrucaoDesemb: TDataSource
    DataSet = qry_InstrucaoDesemb
    Left = 56
    Top = 15
  end
  object dts_ItensInstrucaoDesemb: TDataSource
    DataSet = qry_ItensInstrucaoDesemb
    Left = 200
    Top = 14
  end
  object qry_ItensInstrucaoDesemb: TQuery
    AfterScroll = qry_InstrucaoDesembAfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = dts_InstrucaoDesemb
    RequestLive = True
    SQL.Strings = (
      'select * from TINSTRUCAO_DESEMBARACO_PEDIDO'
      'where'
      '  ID_CODIGO =:ID_CODIGO')
    UpdateObject = updItensInstrucaoDesemb
    Left = 200
    Top = 109
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'ID_CODIGO'
        ParamType = ptUnknown
        Size = 14
      end>
    object qry_ItensInstrucaoDesembID_CODIGO: TStringField
      FieldName = 'ID_CODIGO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO_PEDIDO.ID_CODIGO'
      FixedChar = True
      Size = 13
    end
    object qry_ItensInstrucaoDesembNR_REFERENCIA: TStringField
      DisplayWidth = 16
      FieldName = 'NR_REFERENCIA'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO_PEDIDO.NR_REFERENCIA'
      FixedChar = True
      Size = 16
    end
    object qry_ItensInstrucaoDesembNR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO_PEDIDO.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_ItensInstrucaoDesembNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO_PEDIDO.NR_PARCIAL'
    end
    object qry_ItensInstrucaoDesembDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO_PEDIDO.DT_INCLUSAO'
    end
  end
  object updInstrucaoDesemb: TUpdateSQL
    ModifySQL.Strings = (
      'update TINSTRUCAO_DESEMBARACO'
      'set'
      '  ID_CODIGO = :ID_CODIGO,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_CRIACAO = :DT_CRIACAO,'
      '  IN_AUTORIZADO = :IN_AUTORIZADO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  DT_AUTORIZACAO = :DT_AUTORIZACAO,'
      '  CD_USUARIO_AUTORIZACAO = :CD_USUARIO_AUTORIZACAO,'
      '  CD_RESPONSAVEL = :CD_RESPONSAVEL,'
      '  CD_EMBARCACAO = :CD_EMBARCACAO,'
      '  NR_CONHECIMENTO = :NR_CONHECIMENTO,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  TX_OBSERVACOES = :TX_OBSERVACOES'
      'where'
      '  ID_CODIGO = :OLD_ID_CODIGO')
    InsertSQL.Strings = (
      'insert into TINSTRUCAO_DESEMBARACO'
      
        '  (ID_CODIGO, CD_USUARIO, DT_CRIACAO, IN_AUTORIZADO, CD_CLIENTE,' +
        ' NR_PROCESSO, '
      
        '   DT_AUTORIZACAO, CD_USUARIO_AUTORIZACAO, CD_RESPONSAVEL, CD_EM' +
        'BARCACAO, '
      '   NR_CONHECIMENTO, CD_EMPRESA, TX_OBSERVACOES)'
      'values'
      
        '  (:ID_CODIGO, :CD_USUARIO, :DT_CRIACAO, :IN_AUTORIZADO, :CD_CLI' +
        'ENTE, :NR_PROCESSO, '
      
        '   :DT_AUTORIZACAO, :CD_USUARIO_AUTORIZACAO, :CD_RESPONSAVEL, :C' +
        'D_EMBARCACAO, '
      '   :NR_CONHECIMENTO, :CD_EMPRESA, :TX_OBSERVACOES)')
    DeleteSQL.Strings = (
      'delete from TINSTRUCAO_DESEMBARACO'
      'where'
      '  ID_CODIGO = :OLD_ID_CODIGO')
    Left = 55
    Top = 60
  end
  object updItensInstrucaoDesemb: TUpdateSQL
    ModifySQL.Strings = (
      'update TINSTRUCAO_DESEMBARACO_PEDIDO'
      'set'
      '  ID_CODIGO = :ID_CODIGO,'
      '  NR_REFERENCIA = :NR_REFERENCIA,'
      '  NR_ITEM_PO = :NR_ITEM_PO,'
      '  NR_PARCIAL = :NR_PARCIAL,'
      '  DT_INCLUSAO = :DT_INCLUSAO'
      'where'
      '  ID_CODIGO = :OLD_ID_CODIGO and'
      '  NR_REFERENCIA = :OLD_NR_REFERENCIA and'
      '  NR_ITEM_PO = :OLD_NR_ITEM_PO and'
      '  NR_PARCIAL = :OLD_NR_PARCIAL')
    InsertSQL.Strings = (
      'insert into TINSTRUCAO_DESEMBARACO_PEDIDO'
      
        '  (ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL, DT_INCLUSAO' +
        ')'
      'values'
      
        '  (:ID_CODIGO, :NR_REFERENCIA, :NR_ITEM_PO, :NR_PARCIAL, :DT_INC' +
        'LUSAO)')
    DeleteSQL.Strings = (
      'delete from TINSTRUCAO_DESEMBARACO_PEDIDO'
      'where'
      '  ID_CODIGO = :OLD_ID_CODIGO and'
      '  NR_REFERENCIA = :OLD_NR_REFERENCIA and'
      '  NR_ITEM_PO = :OLD_NR_ITEM_PO and'
      '  NR_PARCIAL = :OLD_NR_PARCIAL')
    Left = 200
    Top = 59
  end
  object dtsItensPedido: TDataSource
    DataSet = qry_ItensPedido
    Left = 327
    Top = 12
  end
  object qry_ItensPedido: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.NR_PROCESSO,'
      '       A.CD_EMPRESA,'
      '       A.NR_ITEM_CLIENTE,'
      '       A.NR_PARCIAL,'
      '       A.QT_DISPONIVEL,'
      '       A.CD_UNID_MEDIDA,'
      '       A.NR_FATURA,'
      '       B.NM_SIGLA,'
      '       A.CD_MERCADORIA,'
      '       C.AP_MERCADORIA'
      'FROM TPO_ITEM A'
      
        '   LEFT JOIN TUNID_MEDIDA_BROKER B ON B.CD_UNID_MEDIDA = A.CD_UN' +
        'ID_MEDIDA'
      '   INNER JOIN TMERCADORIA C ON C.CD_MERCADORIA = A.CD_MERCADORIA'
      
        '   INNER JOIN TESTAGIO_PROCESSO D ON D.NR_REFERENCIA   = A.NR_PR' +
        'OCESSO'
      
        '                                 AND D.CD_EMPRESA      = A.CD_EM' +
        'PRESA'
      
        '                                 AND D.NR_ITEM_CLIENTE = A.NR_IT' +
        'EM_CLIENTE'
      
        '                                 AND D.NR_PARCIAL      = A.NR_PA' +
        'RCIAL'
      '   INNER JOIN TPROCESSO E ON E.NR_PROCESSO = D.NR_PROCESSO_ADM'
      '   INNER JOIN TEMPRESA_NAC F ON F.CD_EMPRESA = E.CD_CLIENTE'
      'where A.NR_PROCESSO   = :NR_PEDIDO'
      '  AND A.CD_EMPRESA    = :CD_EMPRESA'
      '  AND E.CD_GRUPO      = :CD_GRUPO'
      '  AND IN_SUBSTITUIDO  = '#39'0'#39
      '  AND A.NR_PARCIAL   <> 0'
      '  AND ISNULL(A.IN_UTILIZADO_INSTR_DESEMB, '#39#39') <> '#39'1'#39
      
        '  AND ((SUBSTRING(ISNULL(D.NR_PROCESSO_DES, '#39#39'),5,2) IN ('#39'DT'#39', '#39 +
        'IE'#39', '#39#39')))')
    Left = 326
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PEDIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end>
    object qry_ItensPedidoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPO_ITEM.NR_PROCESSO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qry_ItensPedidoNR_ITEM_CLIENTE: TStringField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'DBBROKER.TPO_ITEM.NR_ITEM_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object qry_ItensPedidoNR_PARCIAL: TIntegerField
      DisplayLabel = 'N'#186' Parcial'
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TPO_ITEM.NR_PARCIAL'
    end
    object qry_ItensPedidoQT_DISPONIVEL: TFloatField
      DisplayLabel = 'Qtd. Dispon'#237'vel'
      FieldName = 'QT_DISPONIVEL'
      Origin = 'DBBROKER.TPO_ITEM.QT_DISPONIVEL'
      DisplayFormat = '0.,00000'
    end
    object qry_ItensPedidoCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'DBBROKER.TPO_ITEM.CD_UNID_MEDIDA'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qry_ItensPedidoCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TPO_ITEM.CD_MERCADORIA'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object qry_ItensPedidoNM_SIGLA: TStringField
      DisplayLabel = 'Unid. Medida'
      DisplayWidth = 6
      FieldName = 'NM_SIGLA'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.NM_SIGLA'
      FixedChar = True
      Size = 3
    end
    object qry_ItensPedidoAP_MERCADORIA: TStringField
      DisplayLabel = 'Mercadoria'
      DisplayWidth = 40
      FieldName = 'AP_MERCADORIA'
      Origin = 'DBBROKER.TMERCADORIA.AP_MERCADORIA'
      FixedChar = True
      Size = 25
    end
    object qry_ItensPedidoCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_ItensPedidoNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 50
    end
  end
  object qry_Arquivos: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CASE RTRIM(ISNULL(PD.NM_DESCRICAO, '#39#39'))'
      '           WHEN '#39#39' THEN TDD.NM_TIPO_DOCTO'
      '       ELSE LTRIM(RTRIM(PD.NM_DESCRICAO))'
      '       END AS NM_DESCRICAO,'
      '       PD.NM_ARQUIVO,'
      '       PD.NM_ARQUIVO_PAI'
      
        'FROM TPROCESSO_DOCTOS PD INNER JOIN TTP_DOCTO_DIGITALIZADO TDD O' +
        'N TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO'
      
        '                                                              AN' +
        'D TDD.ID_TABELA     = PD.ID_TABELA'
      
        '   INNER JOIN TCONTROLE_ACESSO_DIGITALIZACAO CAD ON CAD.CD_TIPO_' +
        'DOCTO = PD.CD_TIPO_DOCTO'
      
        '                                                AND CAD.ID_TABEL' +
        'A     = PD.ID_TABELA'
      '   INNER JOIN SYS.TABLES ST ON ST.OBJECT_ID = PD.ID_TABELA'
      'WHERE PD.NR_PROCESSO      = :NR_PROCESSO'
      '  AND CAD.CD_CARGO        = :CD_CARGO'
      '  AND ST.NAME             = '#39'TINSTRUCAO_DESEMBARACO'#39
      '  AND PD.IN_ATIVO         = '#39'1'#39
      '  AND CAD.IN_VISUALIZACAO = '#39'1'#39
      'ORDER BY CASE ISNULL(NM_ARQUIVO_PAI, '#39#39')'
      '             WHEN '#39#39' THEN NM_ARQUIVO'
      '         ELSE NM_ARQUIVO_PAI'
      '         END')
    Left = 56
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptInput
      end>
    object qry_ArquivosNM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      FixedChar = True
      Size = 100
    end
    object qry_ArquivosNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      FixedChar = True
      Size = 10
    end
    object qry_ArquivosNM_ARQUIVO_PAI: TStringField
      FieldName = 'NM_ARQUIVO_PAI'
      FixedChar = True
      Size = 10
    end
  end
  object qryDespesas: TQuery
    CachedUpdates = True
    AfterOpen = qryDespesasAfterOpen
    AfterClose = qryDespesasAfterClose
    AfterInsert = qryDespesasAfterInsert
    AfterPost = qry_InstrucaoDesembAfterPost
    AfterDelete = qry_InstrucaoDesembAfterPost
    DatabaseName = 'DBBROKER'
    DataSource = dts_InstrucaoDesemb
    SQL.Strings = (
      'SELECT *'
      'FROM TINSTRUCAO_DESEMBARACO_DESPESAS'
      'WHERE ID_CODIGO = :ID_CODIGO')
    UpdateObject = updDespesas
    Left = 200
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_CODIGO'
        ParamType = ptInput
        Value = ''
      end>
    object qryDespesasID_CODIGO: TStringField
      FieldName = 'ID_CODIGO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO_DESPESAS.ID_CODIGO'
      FixedChar = True
      Size = 13
    end
    object qryDespesasNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO_DESPESAS.NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qryDespesasNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      LookupDataSet = qryFaturas
      LookupKeyFields = 'NR_FATURA'
      LookupResultField = 'NR_FATURA'
      KeyFields = 'NR_FATURA'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO_DESPESAS.NR_FATURA'
      FixedChar = True
      Size = 50
    end
    object qryDespesasVL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO_DESPESAS.VL_ITEM'
    end
    object qryDespesasLUP_NR_FATURA: TStringField
      FieldKind = fkLookup
      FieldName = 'LUP_NR_FATURA'
      LookupDataSet = qryFaturas
      LookupKeyFields = 'NR_FATURA'
      LookupResultField = 'NR_FATURA'
      KeyFields = 'NR_FATURA'
      Size = 50
      Lookup = True
    end
  end
  object updDespesas: TUpdateSQL
    ModifySQL.Strings = (
      'update TINSTRUCAO_DESEMBARACO_DESPESAS'
      'set'
      '  ID_CODIGO = :ID_CODIGO,'
      '  NM_ITEM = :NM_ITEM,'
      '  NR_FATURA = :NR_FATURA,'
      '  VL_ITEM = :VL_ITEM'
      'where'
      '  ID_CODIGO = :OLD_ID_CODIGO and'
      '  NM_ITEM = :OLD_NM_ITEM')
    InsertSQL.Strings = (
      'insert into TINSTRUCAO_DESEMBARACO_DESPESAS'
      '  (ID_CODIGO, NM_ITEM, NR_FATURA, VL_ITEM)'
      'values'
      '  (:ID_CODIGO, :NM_ITEM, :NR_FATURA, :VL_ITEM)')
    DeleteSQL.Strings = (
      'delete from TINSTRUCAO_DESEMBARACO_DESPESAS'
      'where'
      '  ID_CODIGO = :OLD_ID_CODIGO and'
      '  NM_ITEM = :OLD_NM_ITEM')
    Left = 200
    Top = 248
  end
  object dsDespesas: TDataSource
    DataSet = qryDespesas
    Left = 200
    Top = 200
  end
  object dsFaturas: TDataSource
    DataSet = qryFaturas
    Left = 304
    Top = 200
  end
  object qryFaturas: TQuery
    AfterInsert = qryDespesasAfterInsert
    AfterPost = qry_InstrucaoDesembAfterPost
    AfterDelete = qry_InstrucaoDesembAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT POI.NR_FATURA'
      
        'FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP INNER JOIN TPO_ITEM POI O' +
        'N POI.NR_PROCESSO = IDP.NR_REFERENCIA'
      'WHERE ID_CODIGO = :ID_CODIGO'
      '  AND POI.CD_EMPRESA = :CD_EMPRESA')
    Left = 304
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_CODIGO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
        Value = ''
      end>
    object qryFaturasNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPO_ITEM.NR_FATURA'
      FixedChar = True
      Size = 50
    end
  end
end
