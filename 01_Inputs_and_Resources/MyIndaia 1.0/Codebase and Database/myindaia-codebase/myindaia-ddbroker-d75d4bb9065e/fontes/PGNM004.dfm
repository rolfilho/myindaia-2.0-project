object datm_recebimento: Tdatm_recebimento
  OldCreateOrder = True
  Left = 206
  Top = 90
  Height = 483
  Width = 792
  object dsq_n_ref: TDataSource
    DataSet = qry_n_ref_
    Left = 524
    Top = 308
  end
  object qry_n_ref_: TQuery
    OnCalcFields = qry_n_ref_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT N.NR_PROCESSO , NR_SOLICITACAO ,'
      ' DT_SOLICITACAO , N.CD_USUARIO , CD_STATUS , '
      ' VL_SOLICITADO , VL_RECEBIDO , '
      ' QT_ITENS_SOLIC'
      'FROM TNUMERARIO N,'
      '            TPROCESSO P'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      '               N.NR_PROCESSO = P.NR_PROCESSO AND'
      '               N.CD_STATUS = '#39'A'#39' AND'
      '               N.NR_PROCESSO LIKE :CD_UNID_PROD'
      '')
    Left = 608
    Top = 308
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_PROD'
        ParamType = ptInput
      end>
    object qry_n_ref_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO.NR_PROCESSO'
      Size = 18
    end
    object qry_n_ref_Look_nr_processo: TStringField
      DisplayLabel = 'Processo'
      FieldKind = fkCalculated
      FieldName = 'Look_nr_processo'
      Size = 9
      Calculated = True
    end
    object qry_n_ref_NR_SOLICITACAO: TStringField
      DisplayLabel = 'N'#186' Solic'
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO.NR_SOLICITACAO'
      Size = 3
    end
    object qry_n_ref_DT_SOLICITACAO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_SOLICITACAO'
      Origin = 'TNUMERARIO.DT_SOLICITACAO'
    end
    object qry_n_ref_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TNUMERARIO.CD_USUARIO'
      Size = 4
    end
    object qry_n_ref_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO.CD_STATUS'
      Size = 1
    end
    object qry_n_ref_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Solicita'#231#227'o'
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
    end
    object qry_n_ref_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
    end
    object qry_n_ref_QT_ITENS_SOLIC: TIntegerField
      FieldName = 'QT_ITENS_SOLIC'
      Origin = 'TNUMERARIO.QT_ITENS_SOLIC'
    end
    object qry_n_ref_Status: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
  end
  object dsq_item_cd: TDataSource
    DataSet = qry_item_cd
    Left = 345
    Top = 308
  end
  object qry_item_cd: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT I.CD_ITEM, I.NM_ITEM, I.CD_TIPO_ITEM,  I.CD_TIPO_LANC_FAT'
      'FROM TITEM I,'
      '           TTIPO_ITEM T'
      'WHERE I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '              T.IN_RECEB_NUM = '#39'1'#39
      'ORDER BY I.CD_ITEM')
    Left = 435
    Top = 308
    object qry_item_cdCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_cdNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_cdCD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
    object qry_item_cdCD_TIPO_LANC_FAT: TStringField
      FieldName = 'CD_TIPO_LANC_FAT'
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
  end
  object dsq_item_nm: TDataSource
    DataSet = qry_item_nm
    Left = 345
    Top = 248
  end
  object qry_item_nm: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT I.CD_ITEM, I.NM_ITEM, I.CD_TIPO_ITEM'
      'FROM TITEM I,'
      '           TTIPO_ITEM T'
      'WHERE I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '              T.IN_RECEB_NUM = '#39'1'#39
      'ORDER BY NM_ITEM')
    Left = 435
    Top = 248
    object qry_item_nmCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_nmNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_nmCD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
  end
  object ds_itens_receb: TDataSource
    DataSet = qry_itens_receb_
    Left = 704
    Top = 64
  end
  object qry_itens_receb_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_receb
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_RECEBIMENTO , '
      '               NR_LANC_RECEB , NR_SOLICITACAO , '
      '               NR_LANCAMENTO , CD_ITEM , VL_SOLICITADO , '
      '               VL_RECEBIDO , IN_CANCELADO'
      'FROM TRECEBIMENTO_ITEM_RECEB '
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '               NR_RECEBIMENTO = :NR_RECEBIMENTO')
    Left = 704
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RECEBIMENTO'
        ParamType = ptInput
      end>
    object qry_itens_receb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_PROCESSO'
      Size = 18
    end
    object qry_itens_receb_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_RECEBIMENTO'
      Size = 3
    end
    object qry_itens_receb_NR_LANC_RECEB: TStringField
      FieldName = 'NR_LANC_RECEB'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_LANC_RECEB'
      Size = 6
    end
    object qry_itens_receb_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_receb_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_receb_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.CD_ITEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_receb_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_receb_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TNUMERARIO_ITEM_RECEB.NR_PROCESSO'
      Size = 3
    end
    object qry_itens_receb_LK_NM_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'LK_NM_ITEM'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 40
      Lookup = True
    end
    object qry_itens_receb_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_PROCESSO'
      Size = 1
    end
    object qry_itens_receb_LookCancelado: TStringField
      DisplayLabel = 'Cancelado'
      FieldKind = fkLookup
      FieldName = 'LookCancelado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 3
      Lookup = True
    end
  end
  object qry_itens_por_prioridade_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT N.NR_PROCESSO, N.NR_SOLICITACAO, N.NR_LANCAMENTO,'
      '               N.CD_ITEM, '
      
        '               N.VL_ITEM_CALCULADO, N.VL_SOLICITADO, N.CD_STATUS' +
        ','
      '               N.VL_RECEBIDO, N.VL_UTILIZADO, I.NR_PRIORIDADE'
      'FROM TNUMERARIO_ITEM_SOLIC N,'
      '           TPROCESSO P,'
      '           TITEM_PRIORIDADE I'
      'WHERE N.NR_PROCESSO = :NR_PROCESSO AND'
      '               P.NR_PROCESSO = N.NR_PROCESSO AND'
      '               N.CD_ITEM = I.CD_ITEM AND'
      '               I.CD_UNID_NEG = P.CD_UNID_NEG AND'
      '               I.CD_PRODUTO = P.CD_PRODUTO AND'
      
        '               (N.CD_STATUS = '#39'A'#39' OR N.NR_SOLICITACAO = '#39'999'#39') A' +
        'ND'
      '               ( N.TP_DESTINO = '#39'2'#39' OR N.TP_DESTINO = '#39'3'#39' ) '
      'ORDER BY I.NR_PRIORIDADE, N.NR_SOLICITACAO')
    Left = 345
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_itens_por_prioridade_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_itens_por_prioridade_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_por_prioridade_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_por_prioridade_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_itens_por_prioridade_VL_ITEM_CALCULADO: TFloatField
      FieldName = 'VL_ITEM_CALCULADO'
    end
    object qry_itens_por_prioridade_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
    end
    object qry_itens_por_prioridade_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Size = 1
    end
    object qry_itens_por_prioridade_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
    end
    object qry_itens_por_prioridade_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
    end
    object qry_itens_por_prioridade_NR_PRIORIDADE: TFloatField
      FieldName = 'NR_PRIORIDADE'
    end
  end
  object qry_verif_item_999_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    RequestLive = True
    Left = 524
    Top = 376
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '      CD_UNID_NEG IN'
      '              ( SELECT CD_UNID_NEG'
      '                FROM   TUSUARIO_HABILITACAO'
      '                WHERE  CD_USUARIO = :CD_USUARIO )')
    Left = 36
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TPRODUTO'
      'WHERE  CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_PRODUTO IN'
      '              ( SELECT CD_PRODUTO'
      '                FROM   TUSUARIO_HABILITACAO'
      '                WHERE  CD_USUARIO = :CD_USUARIO )')
    Left = 136
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Size = 10
    end
    object qry_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO_HABILITACAO'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      '               CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO'
      ''
      '               ')
    Left = 36
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    object qry_usuario_habilitacao_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO_HABILITACAO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT E.CD_EMPRESA, E.NM_EMPRESA, E.AP_EMPRESA,'
      '       E.IN_ATIVO, H.IN_ATIVO HABILIT_ATIVO,'
      '       ( SELECT COUNT(*)'
      '         FROM   TCLIENTE_BANCO_LIBERADO L'
      '         WHERE  H.CD_UNID_NEG = L.CD_UNID_NEG AND'
      '                H.CD_PRODUTO = L.CD_PRODUTO AND'
      '                H.CD_CLIENTE = L.CD_CLIENTE AND'
      '                L.IN_ATIVO = '#39'1'#39' ) BANCO_LIBERADO'
      'FROM   TEMPRESA_NAC E, TCLIENTE_HABILITACAO H'
      'WHERE  E.CD_EMPRESA = :CD_CLIENTE AND'
      '       E.CD_EMPRESA *= H.CD_CLIENTE AND'
      '       H.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       H.CD_PRODUTO = :CD_PRODUTO AND'
      '       E.IN_ATIVO = '#39'1'#39)
    Left = 136
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_cliente_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_cliente_HABILIT_ATIVO: TStringField
      FieldName = 'HABILIT_ATIVO'
      Size = 1
    end
    object qry_cliente_BANCO_LIBERADO: TIntegerField
      FieldName = 'BANCO_LIBERADO'
    end
  end
  object qry_processo_: TQuery
    AfterOpen = qry_processo_AfterOpen
    AfterScroll = qry_processo_AfterScroll
    OnCalcFields = qry_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO,'
      '       P.CD_CLIENTE, P.CD_SERVICO, S.NM_SERVICO, C.NM_EMPRESA'
      'FROM   TPROCESSO P,'
      '       TSERVICO S,'
      '       TEMPRESA_NAC C'
      
        'WHERE  ( ( P.CD_CLIENTE = :CD_CLIENTE ) OR ( :CD_CLIENTE = '#39#39' ) ' +
        ') AND'
      
        '       ( ( P.CD_UNID_NEG = :CD_UNID_NEG ) OR ( :CD_UNID_NEG = '#39#39 +
        ' ) ) AND'
      '       ( ( C.CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ) )  AND'
      
        '       ( ( P.CD_PRODUTO = :CD_PRODUTO ) OR ( :CD_PRODUTO = '#39#39' ) ' +
        ')  AND'
      
        '       ( ( P.NR_PROCESSO = :NR_PROCESSO ) OR ( :NR_PROCESSO = '#39#39 +
        ' ) )  AND'
      '       P.CD_CLIENTE   = C.CD_EMPRESA AND'
      '       P.CD_SERVICO   *= S.CD_SERVICO AND'
      '       P.IN_PRODUCAO  = '#39'1'#39' AND'
      '       P.IN_CANCELADO = '#39'0'#39' AND'
      '       ( ( P.NR_PROCESSO IN ( SELECT N.NR_PROCESSO'
      
        #9'      '#9'              FROM   TNUMERARIO N, TNUMERARIO_ITEM_SOLIC' +
        ' NI'
      #9#9'              WHERE  N.NR_PROCESSO = NI.NR_PROCESSO AND'
      
        '                                     N.NR_SOLICITACAO = NI.NR_SO' +
        'LICITACAO AND'
      
        #9#9'                     N.CD_STATUS = '#39'A'#39' AND NI.TP_DESTINO IN ('#39 +
        '2'#39', '#39'3'#39') ) AND'
      '                                     ( :NR_PROCESSO = '#39#39' ) ) OR'
      '  ( :NR_PROCESSO <> '#39#39' ) )'
      'ORDER BY P.NR_PROCESSO')
    Left = 228
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_processo_NM_SERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_processo_Calc_Nr_Processo: TStringField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Calc_Nr_Processo'
      Size = 18
      Calculated = True
    end
    object qry_processo_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 228
    Top = 64
  end
  object ds_itens_solinum: TDataSource
    AutoEdit = False
    DataSet = qry_itens_solinum_
    Left = 524
    Top = 64
  end
  object qry_itens_solinum_: TQuery
    OnCalcFields = qry_itens_solinum_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_solinum
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_SOLICITACAO , '
      '       NR_LANCAMENTO , CD_ITEM ,'
      '       CD_TIPO_CALCULO , CD_BANCO ,'
      '       VL_ITEM_CALCULADO , VL_SOLICITADO ,'
      '       CD_STATUS , VL_RECEBIDO , VL_UTILIZADO, TP_DESTINO'
      'FROM   TNUMERARIO_ITEM_SOLIC'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_SOLICITACAO = :NR_SOLICITACAO'
      '')
    Left = 524
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
    object qry_itens_solinum_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 18
    end
    object qry_itens_solinum_NR_SOLICITACAO: TStringField
      DisplayLabel = 'N'#186' Solic.'
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_solinum_NR_LANCAMENTO: TStringField
      DisplayLabel = 'Lanc.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_solinum_CD_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'CD_ITEM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_ITEM'
      Size = 3
    end
    object qry_itens_solinum_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_TIPO_CALCULO'
      Size = 3
    end
    object qry_itens_solinum_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 1
    end
    object qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField
      DisplayLabel = 'Calculado'
      FieldName = 'VL_ITEM_CALCULADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_ITEM_CALCULADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_solinum_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Solicitado'
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_solinum_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_solinum_VL_UTILIZADO: TFloatField
      DisplayLabel = 'Utilizado'
      FieldName = 'VL_UTILIZADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_UTILIZADO'
      DisplayFormat = '#0,.00'
    end
    object LK_STATUS_ITEM: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'status'
      LookupDataSet = qry_status_numer_
      LookupKeyFields = 'CD_STATUS'
      LookupResultField = 'NM_STATUS'
      KeyFields = 'CD_STATUS'
      Lookup = True
    end
    object qry_itens_solinum_LK_NM_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'LK_NM_ITEM'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 40
      Lookup = True
    end
    object qry_itens_solinum_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 3
    end
    object qry_itens_solinum_LK_NM_BANCO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_BANCO'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 35
      Lookup = True
    end
    object qry_itens_solinum_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 1
    end
    object qry_itens_solinum_LookTpDestino: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTpDestino'
      LookupDataSet = qry_tp_destino_
      LookupKeyFields = 'CD_TP_DESTINO'
      LookupResultField = 'NM_TP_DESTINO'
      KeyFields = 'TP_DESTINO'
      Lookup = True
    end
    object qry_itens_solinum_CalcVlSaldo: TFloatField
      DisplayLabel = 'Saldo'
      FieldKind = fkCalculated
      FieldName = 'CalcVlSaldo'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
  end
  object ds_solinum: TDataSource
    AutoEdit = False
    DataSet = qry_solinum_
    Left = 435
    Top = 64
  end
  object qry_solinum_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_SOLICITACAO, DT_SOLICITACAO, '
      '               CD_USUARIO, CD_STATUS,  DT_EMISSAO,'
      '               VL_SOLICITADO, VL_RECEBIDO'
      'FROM TNUMERARIO N'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '( ( CD_STATUS = '#39'A'#39' ) OR ( VL_RECEBIDO < VL_SOLICITADO ) )')
    Left = 435
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_solinum_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO.NR_PROCESSO'
      Size = 18
    end
    object qry_solinum_NR_SOLICITACAO: TStringField
      DisplayLabel = 'Solicita'#231#227'o N'#186
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO.NR_SOLICITACAO'
      Size = 3
    end
    object qry_solinum_DT_SOLICITACAO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_SOLICITACAO'
      Origin = 'TNUMERARIO.DT_SOLICITACAO'
    end
    object qry_solinum_CD_USUARIO: TStringField
      DisplayLabel = 'Solicitante'
      FieldName = 'CD_USUARIO'
      Origin = 'TNUMERARIO.CD_USUARIO'
      Size = 4
    end
    object qry_solinum_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO.NR_PROCESSO'
      Size = 1
    end
    object qry_solinum_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Vl. Solicitado'
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
    end
    object qry_solinum_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Vl. Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
    end
    object qry_solinum_DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Origin = 'TNUMERARIO.NR_PROCESSO'
    end
    object qry_solinum_LK_SOLICITANTE: TStringField
      DisplayLabel = 'Solicitante'
      FieldKind = fkLookup
      FieldName = 'LK_SOLICITANTE'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Lookup = True
    end
    object LK_STATUS_NUMER: TStringField
      FieldKind = fkLookup
      FieldName = 'Status'
      LookupDataSet = qry_status_numer_
      LookupKeyFields = 'CD_STATUS'
      LookupResultField = 'NM_STATUS'
      KeyFields = 'CD_STATUS'
      Lookup = True
    end
  end
  object qry_status_numer_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_STATUS_NUMER')
    Left = 37
    Top = 128
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TBANCO')
    Left = 36
    Top = 184
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
    object qry_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 10
    end
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT CD_REFERENCIA'
      'FROM TREF_CLIENTE'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 345
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_ref_cli_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
  end
  object ds_ref_cli: TDataSource
    DataSet = qry_ref_cli_
    Left = 345
    Top = 64
  end
  object qry_receb_: TQuery
    AfterOpen = qry_receb_AfterOpen
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_RECEBIMENTO, DT_RECEBIMENTO,'
      '               CD_USUARIO, CD_BANCO, VL_RECEBIMENTO, '
      '               IN_CANCELADO, DT_CANCELAMENTO, CD_USUARIO_CANC,'
      '               IN_TRANSFERIDO, NR_FP'
      'FROM TRECEBIMENTO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 608
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_receb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TRECEBIMENTO.NR_PROCESSO'
      Size = 18
    end
    object qry_receb_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      Origin = 'TRECEBIMENTO.NR_RECEBIMENTO'
      Size = 3
    end
    object qry_receb_DT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
      Origin = 'TRECEBIMENTO.DT_RECEBIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_receb_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TRECEBIMENTO.CD_USUARIO'
      Size = 4
    end
    object qry_receb_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TRECEBIMENTO.CD_BANCO'
      Size = 3
    end
    object qry_receb_VL_RECEBIMENTO: TFloatField
      FieldName = 'VL_RECEBIMENTO'
      Origin = 'TRECEBIMENTO.VL_RECEBIMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_receb_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TRECEBIMENTO.IN_CANCELADO'
      Size = 1
    end
    object qry_receb_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'TRECEBIMENTO.DT_CANCELAMENTO'
    end
    object qry_receb_CD_USUARIO_CANC: TStringField
      FieldName = 'CD_USUARIO_CANC'
      Origin = 'TRECEBIMENTO.CD_USUARIO_CANC'
      Size = 4
    end
    object qry_receb_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TRECEBIMENTO.IN_TRANSFERIDO'
      Size = 1
    end
    object qry_receb_LK_NM_USUARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_USUARIO'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 30
      Lookup = True
    end
    object qry_receb_LK_NM_BANCO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_BANCO'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'AP_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 30
      Lookup = True
    end
    object qry_receb_LK_NM_CANCELADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_CANCELADOR'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO_CANC'
      Lookup = True
    end
    object qry_receb_NR_FP: TStringField
      FieldName = 'NR_FP'
      Origin = 'TRECEBIMENTO.NR_PROCESSO'
      Size = 10
    end
    object qry_receb_LookCancelado: TStringField
      DisplayLabel = 'Cancelado'
      FieldKind = fkLookup
      FieldName = 'LookCancelado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 3
      Lookup = True
    end
  end
  object ds_receb: TDataSource
    DataSet = qry_receb_
    Left = 608
    Top = 64
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, AP_USUARIO'
      'FROM TUSUARIO')
    Left = 136
    Top = 128
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'TUSUARIO.AP_USUARIO'
      Size = 15
    end
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM, CD_TIPO_ITEM '
      'FROM TITEM '
      '')
    Left = 136
    Top = 184
    object StringField1: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object StringField2: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
  end
  object qry_itens_pendentes_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_SOLICITACAO ,'
      '               NR_LANCAMENTO , CD_ITEM ,'
      '               CD_TIPO_CALCULO , CD_BANCO ,'
      '               VL_ITEM_CALCULADO , VL_SOLICITADO ,'
      '               CD_STATUS , VL_RECEBIDO , VL_UTILIZADO'
      'FROM   TNUMERARIO_ITEM_SOLIC'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      
        '       CD_STATUS = '#39'A'#39'  AND ( TP_DESTINO = '#39'2'#39' OR TP_DESTINO = '#39 +
        '3'#39' )')
    Left = 345
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_itens_pendentes_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 18
    end
    object qry_itens_pendentes_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_pendentes_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_pendentes_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_ITEM'
      Size = 3
    end
    object qry_itens_pendentes_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_TIPO_CALCULO'
      Size = 3
    end
    object qry_itens_pendentes_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_BANCO'
      Size = 3
    end
    object qry_itens_pendentes_VL_ITEM_CALCULADO: TFloatField
      FieldName = 'VL_ITEM_CALCULADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_ITEM_CALCULADO'
    end
    object qry_itens_pendentes_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_SOLICITADO'
    end
    object qry_itens_pendentes_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_STATUS'
      Size = 1
    end
    object qry_itens_pendentes_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_RECEBIDO'
    end
    object qry_itens_pendentes_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_UTILIZADO'
    end
  end
  object sp_atz_receb: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_recebimento'
    Left = 228
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end>
    object StringField8: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField9: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_apaga_receb: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_apaga_receb'
    Left = 228
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@escopo'
        ParamType = ptInput
      end>
  end
  object sp_numerario_999: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_numerario_999'
    Left = 228
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_saldo_receb'
        ParamType = ptInput
      end>
  end
  object sp_cancela_recebimento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_recebimento'
    Left = 228
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_recebimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end>
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 36
    Top = 248
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 136
    Top = 248
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO')
    Left = 36
    Top = 308
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
  end
  object ds_servico: TDataSource
    DataSet = qry_servico_
    Left = 36
    Top = 376
  end
  object qry_autom_s_: TQuery
    OnCalcFields = qry_autom_s_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      
        'SELECT N.DT_SOLICITACAO, I.NR_PROCESSO, SUM( I.VL_SOLICITADO - I' +
        '.VL_RECEBIDO ) VL_SALDO'
      'FROM TNUMERARIO N,'
      '     TNUMERARIO_ITEM_SOLIC I,'
      '     TPROCESSO P,'
      '     TITEM X'
      'WHERE N.NR_PROCESSO = I.NR_PROCESSO AND'
      '      N.NR_SOLICITACAO = I.NR_SOLICITACAO AND'
      '      I.NR_PROCESSO = P.NR_PROCESSO AND'
      '      I.CD_STATUS = '#39'A'#39'  AND'
      '      ( I.TP_DESTINO = '#39'2'#39' OR I.TP_DESTINO = '#39'3'#39' ) AND'
      '      I.CD_ITEM = X.CD_ITEM AND'
      '      X.IN_FAV_SM = '#39'1'#39' AND'
      '      P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '      P.CD_PRODUTO  = :CD_PRODUTO AND'
      '      P.CD_CLIENTE  = :CD_CLIENTE AND'
      '      (I.VL_SOLICITADO - I.VL_RECEBIDO) <> 0'
      'GROUP BY N.DT_SOLICITACAO, I.NR_PROCESSO')
    Left = 524
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    object qry_autom_s_Calc_NR_PROCESSO: TStringField
      FieldKind = fkCalculated
      FieldName = 'Calc_NR_PROCESSO'
      Size = 18
      Calculated = True
    end
    object qry_autom_s_DT_SOLICITACAO: TDateTimeField
      FieldName = 'DT_SOLICITACAO'
    end
    object qry_autom_s_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_autom_s_VL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
  end
  object ds_autom_s: TDataSource
    AutoEdit = False
    DataSet = qry_autom_s_
    Left = 524
    Top = 184
  end
  object sp_receb_autom: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_receb_automat'
    Left = 228
    Top = 308
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_solicitacao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_lanc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end>
  end
  object qry_banco_liberado_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT B.CD_BANCO,  B.NM_BANCO'
      'FROM   TBANCO B,'
      '       TCLIENTE_BANCO_LIBERADO L'
      'WHERE  B.CD_BANCO = L.CD_BANCO AND'
      '       L.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       L.CD_PRODUTO = :CD_PRODUTO AND'
      '       L.CD_CLIENTE = :CD_CLIENTE AND'
      '       L.IN_ATIVO = '#39'1'#39' AND'
      '       B.IN_ATIVO = '#39'1'#39
      ''
      ''
      '')
    Left = 704
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    object qry_banco_liberado_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_liberado_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
  end
  object ds_banco_liberado: TDataSource
    AutoEdit = False
    DataSet = qry_banco_liberado_
    Left = 704
    Top = 184
  end
  object qry_autom_d_: TQuery
    OnCalcFields = qry_autom_d_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      
        'SELECT A.DT_LANCAMENTO, A.NR_PROCESSO, A.NR_LANCAMENTO, A.CD_ITE' +
        'M,  A.VL_SALDO'
      'FROM VW_ITENS_REEMBOLSO A, '
      '           TPROCESSO P'
      'WHERE A.IN_RECEBIDO = 0 AND'
      '              A.NR_PROCESSO = P.NR_PROCESSO AND'
      '              P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '              P.CD_PRODUTO = :CD_PRODUTO AND'
      '              P.CD_CLIENTE = :CD_CLIENTE')
    Left = 608
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    object qry_autom_d_Calc_NR_PROCESSO: TStringField
      FieldKind = fkCalculated
      FieldName = 'Calc_NR_PROCESSO'
      Size = 18
      Calculated = True
    end
    object qry_autom_d_DT_LANCAMENTO: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
      Origin = 'VW_ITENS_REEMBOLSO.DT_LANCAMENTO'
    end
    object qry_autom_d_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'VW_ITENS_REEMBOLSO.NR_PROCESSO'
      Size = 18
    end
    object qry_autom_d_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'VW_ITENS_REEMBOLSO.NR_LANCAMENTO'
      Size = 6
    end
    object qry_autom_d_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'VW_ITENS_REEMBOLSO.CD_ITEM'
      Size = 3
    end
    object qry_autom_d_VL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
      Origin = 'VW_ITENS_REEMBOLSO.VL_SALDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
  end
  object ds_autom_d: TDataSource
    AutoEdit = False
    DataSet = qry_autom_d_
    Left = 608
    Top = 184
  end
  object ds_tp_destino: TDataSource
    DataSet = qry_tp_destino_
    Left = 704
    Top = 308
  end
  object qry_tp_destino_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_DESTINO')
    Left = 704
    Top = 248
    object qry_tp_destino_CD_TP_DESTINO: TStringField
      FieldName = 'CD_TP_DESTINO'
      Origin = 'TTP_DESTINO.CD_TP_DESTINO'
      Size = 1
    end
    object qry_tp_destino_NM_TP_DESTINO: TStringField
      FieldName = 'NM_TP_DESTINO'
      Origin = 'TTP_DESTINO.NM_TP_DESTINO'
    end
  end
  object qry_solic_pend_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, N.NR_SOLICITACAO, N.VL_SOLICITADO'
      'FROM   TPROCESSO P, TSERVICO S, TNUMERARIO N'
      'WHERE  P.NR_PROCESSO  = N.NR_PROCESSO AND'
      '       P.CD_CLIENTE   = :CD_CLIENTE AND'
      '       P.CD_UNID_NEG  = :CD_UNID_NEG AND'
      '       P.CD_PRODUTO   = :CD_PRODUTO AND'
      '       N.VL_SOLICITADO - N.VL_RECEBIDO = :VL_SOLICITADO AND'
      '       P.CD_SERVICO   *= S.CD_SERVICO AND'
      '       P.IN_PRODUCAO  = '#39'1'#39' AND'
      '       P.IN_CANCELADO = '#39'0'#39' AND'
      '       N.VL_SOLICITADO > 0 AND'
      'P.NR_PROCESSO IN ( SELECT N.NR_PROCESSO'
      #9#9' FROM TNUMERARIO N, TNUMERARIO_ITEM_SOLIC NI'
      #9#9' WHERE N.NR_PROCESSO = NI.NR_PROCESSO AND'
      '                       N.NR_SOLICITACAO = NI.NR_SOLICITACAO AND'
      
        #9#9'       N.CD_STATUS = '#39'A'#39' AND ( NI.TP_DESTINO = '#39'2'#39' OR NI.TP_DE' +
        'STINO = '#39'3'#39' ) )')
    Left = 608
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
        Value = '00004'
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
        Value = '01'
      end
      item
        DataType = ftFloat
        Name = 'VL_SOLICITADO'
        ParamType = ptInput
        Value = 163.200000000000000000
      end>
  end
  object ds_solic_pend: TDataSource
    DataSet = qry_solic_pend_
    Left = 524
    Top = 248
  end
  object sp_atz_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_pagto'
    Left = 345
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_item'
        ParamType = ptInput
      end>
    object StringField11: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField12: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_distribui_numerario: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_numerario'
    Left = 700
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end>
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO'
      'FROM   TGRUPO'
      'WHERE  CD_GRUPO = :CD_GRUPO AND'
      '       IN_ATIVO = '#39'1'#39)
    Left = 136
    Top = 308
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
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
  end
  object qry_proc_pesq_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO'
      'FROM   TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       IN_CANCELADO = '#39'0'#39' AND'
      '       IN_LIBERADO = '#39'1'#39' AND'
      '       IN_PRODUCAO = '#39'1'#39)
    Left = 136
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object qry_caixa_ctrl_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(DT_MOVIMENTO) + 1 DT_MOVIMENTO'
      'FROM   TCAIXA_CONTROLE'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 435
    Top = 377
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
  end
  object qry_tot_receb_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_receb
    SQL.Strings = (
      'SELECT SUM(VL_RECEBIDO) TOT_RECEB'
      'FROM   TRECEBIMENTO_ITEM_RECEB'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_RECEBIMENTO = :NR_RECEBIMENTO')
    Left = 435
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_RECEBIMENTO'
        ParamType = ptInput
      end>
    object qry_tot_receb_TOT_RECEB: TFloatField
      FieldName = 'TOT_RECEB'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.VL_RECEBIDO'
    end
  end
  object qry_tot_pend_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ( SUM(VL_SOLICITADO) - SUM(VL_RECEBIDO) ) AS TOT_PEND'
      'FROM   TNUMERARIO_ITEM_SOLIC'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 435
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_tot_pend_TOT_PEND: TFloatField
      FieldName = 'TOT_PEND'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_SOLICITADO'
    end
  end
end
