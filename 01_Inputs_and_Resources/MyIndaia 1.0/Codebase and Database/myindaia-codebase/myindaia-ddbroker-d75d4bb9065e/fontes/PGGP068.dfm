object datm_po_planilha: Tdatm_po_planilha
  OldCreateOrder = True
  Left = 354
  Top = 173
  Height = 258
  Width = 447
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 245
    Top = 31
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM   TPRODUTO'
      'WHERE  CD_PRODUTO = :CD_PRODUTO')
    Left = 48
    Top = 31
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
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
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Left = 151
    Top = 31
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
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
    Left = 47
    Top = 91
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
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
  object qry_apaga_dados: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TREL_FOLLOWUP_NAVIO'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Left = 146
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
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
  object qry_area_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_AREA, NM_AREA'
      'FROM   TAREA'
      'WHERE  CD_AREA = :CD_AREA')
    Left = 150
    Top = 95
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_AREA'
        ParamType = ptUnknown
      end>
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
  object sp_po_planilha: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_planilha'
    Left = 367
    Top = 27
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_area'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_grupo_area'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_inicio'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_fim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object qry_rel_po_planilha_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT   PR.NR_REFERENCIA, POI.NR_ITEM_CLIENTE, PR.NR_ORDEM, POI' +
        '.CD_MERCADORIA,'
      
        '         ( SELECT AP_MERCADORIA FROM TMERCADORIA WHERE CD_MERCAD' +
        'ORIA = POI.CD_MERCADORIA ) NOME_MERCADORIA,'
      
        '         ENPO.NM_EMPRESA, ( SELECT NM_VIA_TRANSP FROM TVIA_TRANS' +
        'P_BROKER WHERE CD_VIA_TRANSP = SE.CD_VIA_TRANSPORTE ) NOME_VIA_T' +
        'RANSPORTE,'
      
        '         PR.CD_INCOTERM, ( SELECT DESCRICAO FROM TLOCAL_EMBARQUE' +
        ' WHERE CODIGO = PR.CD_LOCAL_EMBARQUE ) NOME_LOCAL_EMBARQUE,'
      
        '         CASE SE.CD_VIA_TRANSPORTE WHEN '#39'01'#39' THEN EM.NM_EMBARCAC' +
        'AO ELSE PR.NR_VOO END AS NAVIO_VOO, AR.NM_AREA,'
      
        '         ( SELECT TOP 1 DT_REALIZACAO FROM TFLP_PO_ITEM WHERE NR' +
        '_PROCESSO = PR.NR_REFERENCIA AND NR_ITEM = POI.NR_ITEM_CLIENTE A' +
        'ND CD_EVENTO = '#39'354'#39' ) DATA_NECESSIDADE,'
      
        '         ( SELECT TOP 1 DT_REALIZACAO FROM TFLP_PO_ITEM WHERE NR' +
        '_PROCESSO = PR.NR_REFERENCIA AND NR_ITEM = POI.NR_ITEM_CLIENTE A' +
        'ND CD_EVENTO = '#39'300'#39' ) DATA_ALOCACAO,'
      
        '         ( SELECT TOP 1 DT_REALIZACAO FROM TFLP_PO_ITEM WHERE NR' +
        '_PROCESSO = PR.NR_REFERENCIA AND NR_ITEM = POI.NR_ITEM_CLIENTE A' +
        'ND CD_EVENTO = '#39'355'#39' ) DATA_RESERVA,'
      
        '         ( SELECT TOP 1 DT_REALIZACAO FROM TFLP_PO_ITEM WHERE NR' +
        '_PROCESSO = PR.NR_REFERENCIA AND NR_ITEM = POI.NR_ITEM_CLIENTE A' +
        'ND CD_EVENTO = '#39'359'#39' ) DATA_ETD,'
      
        '         ( SELECT TOP 1 DT_REALIZACAO FROM TFLP_PO_ITEM WHERE NR' +
        '_PROCESSO = PR.NR_REFERENCIA AND NR_ITEM = POI.NR_ITEM_CLIENTE A' +
        'ND CD_EVENTO = '#39'161'#39' ) DATA_ETA,'
      
        '         ( SELECT TOP 1 DT_REALIZACAO FROM TFLP_PO_ITEM WHERE NR' +
        '_PROCESSO = PR.NR_REFERENCIA AND NR_ITEM = POI.NR_ITEM_CLIENTE A' +
        'ND CD_EVENTO = '#39'001'#39' ) DATA_DOCS,'
      
        '      '#9' ( SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA =' +
        ' PR.CD_EXPORTADOR ) NM_EXPORTADOR,'
      
        '      '#9' ( SELECT NM_PEDIDO FROM TTP_PEDIDO WHERE CD_PEDIDO = PR.' +
        'CD_TP_PEDIDO ) NM_TP_PEDIDO'
      '  FROM TPROCESSO PR'
      
        '         LEFT  JOIN TPO PO       '#9'  (NOLOCK) ON ( PO.NR_PROCESSO' +
        '   = PR.NR_REFERENCIA )'
      
        '         LEFT  JOIN TPO_ITEM POI'#9'  (NOLOCK) ON ( POI.NR_PROCESSO' +
        '  = PO.NR_PROCESSO   )'
      
        '         LEFT  JOIN TEMPRESA_NAC ENPO  '#9'  (NOLOCK) ON ( PO.CD_IM' +
        'PORTADOR = ENPO.CD_EMPRESA  )'
      
        '         LEFT  JOIN TSERVICO SE           (NOLOCK) ON ( PR.CD_SE' +
        'RVICO    = SE.CD_SERVICO    )'
      
        '         LEFT  JOIN TEMBARCACAO EM '#9'  (NOLOCK) ON ( PR.CD_EMBARC' +
        'ACAO = EM.CD_EMBARCACAO )'
      
        '         LEFT  JOIN TAREA AR '#9#9'  (NOLOCK) ON ( POI.CD_AREA      ' +
        '= AR.CD_AREA       )'
      
        '   WHERE CONVERT(DATETIME,CONVERT(VARCHAR,PR.DT_ABERTURA,103),10' +
        '3) BETWEEN :DT_INICIO AND :DT_FIM'
      '     AND :CD_UNID_NEG            IN ( PR.CD_UNID_NEG, '#39'X'#39' )'
      '     AND :CD_PRODUTO             IN ( PR.CD_PRODUTO , '#39'X'#39' )'
      '     AND :CD_GRUPO               IN ( ENPO.CD_GRUPO , '#39'X'#39' )'
      '     AND :CD_CLIENTE             IN ( PR.CD_CLIENTE , '#39'X'#39' )'
      '     AND :CD_AREA                IN ( PR.CD_AREA    , '#39'X'#39' )'
      '     AND :CD_GRUPO_AREA          IN ( AR.NM_GRUPO   , '#39'X'#39' )'
      
        '     AND :CD_ANALISTA_COMISSARIA IN ( PR.CD_ANALISTA_COMISSARIA ' +
        ', '#39'X'#39' )'
      
        '     AND :CD_ANALISTA_CLIENTE    IN ( PR.CD_ANALISTA_CLIENTE    ' +
        ', '#39'X'#39' )'
      '     AND PR.IN_CANCELADO = '#39'0'#39
      '     AND PR.IN_LIBERADO  = '#39'1'#39
      ''
      '')
    Left = 48
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_FIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_AREA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO_AREA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ANALISTA_COMISSARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ANALISTA_CLIENTE'
        ParamType = ptUnknown
      end>
  end
end
