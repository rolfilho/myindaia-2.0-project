object datm_abre_proc: Tdatm_abre_proc
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 344
  Top = 97
  Height = 576
  Width = 936
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TUNID_NEG_PRODUTO (NOLOCK)'
      'WHERE (CD_UNID_NEG+CD_PRODUTO) IN '
      '               (SELECT (CD_UNID_NEG+CD_PRODUTO) '
      '               FROM TUSUARIO_HABILITACAO (NOLOCK)'
      '               WHERE CD_USUARIO=:CD_USUARIO'
      '              AND IN_ATIVO='#39'1'#39') ')
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_usuario_habilitacao_NR_ULT_FATURA: TFloatField
      FieldName = 'NR_ULT_FATURA'
    end
    object qry_usuario_habilitacao_NR_ULT_NOTA: TFloatField
      FieldName = 'NR_ULT_NOTA'
    end
    object qry_usuario_habilitacao_NR_ULT_PROCESSO: TFloatField
      FieldName = 'NR_ULT_PROCESSO'
    end
    object qry_usuario_habilitacao_NR_ULT_PREVISAO: TStringField
      FieldName = 'NR_ULT_PREVISAO'
      Size = 6
    end
    object qry_usuario_habilitacao_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_usuario_habilitacao_TX_NUMERARIO_ASS: TMemoField
      FieldName = 'TX_NUMERARIO_ASS'
      BlobType = ftMemo
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
    object qry_usuario_habilitacao_look_ap_produto: TStringField
      DisplayLabel = 'Apelido'
      FieldKind = fkLookup
      FieldName = 'look_ap_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'AP_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 25
      Lookup = True
    end
    object qry_usuario_habilitacao_look_nm_produto: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'look_nm_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 25
      Lookup = True
    end
    object qry_usuario_habilitacao_look_nm_unid_neg: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_unid_neg'
      LookupDataSet = qry_unidade_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 35
      Lookup = True
    end
    object qry_usuario_habilitacao_look_ap_unid_neg: TStringField
      FieldKind = fkLookup
      FieldName = 'look_ap_unid_neg'
      LookupDataSet = qry_unidade_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'AP_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 25
      Lookup = True
    end
  end
  object ds_usuario_habilitacao_: TDataSource
    DataSet = qry_usuario_habilitacao_
    Left = 48
    Top = 64
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 160
    Top = 64
  end
  object ds_unid_neg_produto: TDataSource
    DataSet = qry_unid_neg_produto_
    Left = 272
    Top = 64
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_PAIS '
      'FROM TUNID_NEG '
      'WHERE CD_UNID_NEG = :CD_UNID_NEG'
      '')
    Left = 160
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TUNID_NEG.CD_PAIS'
      Size = 3
    end
  end
  object qry_unid_neg_produto_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_usuario_habilitacao_
    RequestLive = True
    SQL.Strings = (
      'SELECT UNP.*'
      'FROM  TUNID_NEG_PRODUTO AS UNP'
      'WHERE CD_UNID_NEG=:CD_UNID_NEG AND'
      'CD_PRODUTO=:CD_PRODUTO'
      ''
      ' ')
    Left = 272
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_produto_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 5
      Lookup = True
    end
    object qry_unid_neg_produto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG_PRODUTO.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUNID_NEG_PRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_unid_neg_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG_PRODUTO.IN_ATIVO'
      Size = 1
    end
    object qry_unid_neg_produto_NR_ULT_FATURA: TFloatField
      FieldName = 'NR_ULT_FATURA'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_FATURA'
    end
    object qry_unid_neg_produto_NR_ULT_NOTA: TFloatField
      FieldName = 'NR_ULT_NOTA'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_NOTA'
    end
    object qry_unid_neg_produto_NR_ULT_PROCESSO: TFloatField
      FieldName = 'NR_ULT_PROCESSO'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_PROCESSO'
    end
    object qry_unid_neg_produto_NR_ULT_PREVISAO: TStringField
      FieldName = 'NR_ULT_PREVISAO'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_PREVISAO'
      Size = 6
    end
    object qry_unid_neg_produto_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      Origin = 'TUNID_NEG_PRODUTO.TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_unid_neg_produto_TX_NUMERARIO_ASS: TMemoField
      FieldName = 'TX_NUMERARIO_ASS'
      Origin = 'TUNID_NEG_PRODUTO.TX_NUMERARIO_ASS'
      BlobType = ftMemo
    end
    object qry_unid_neg_produto_look_nm_produto: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'look_nm_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_unid_neg_produto_look_ap_produto: TStringField
      DisplayLabel = 'Apelido'
      FieldKind = fkLookup
      FieldName = 'look_ap_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'AP_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Lookup = True
    end
    object qry_unid_neg_produto_look_nm_unid_neg: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TPRODUTO')
    Left = 160
    Top = 120
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
    object qry_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TPRODUTO.IN_ATIVO'
      Size = 1
    end
    object qry_produto_CD_VIATRANSP: TStringField
      FieldName = 'CD_VIATRANSP'
      Origin = 'TPRODUTO.CD_VIATRANSP'
      Size = 1
    end
    object qry_produto_TP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 160
    Top = 176
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 272
    Top = 120
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 272
    Top = 176
  end
  object ds_cliente_habilitacao: TDataSource
    Left = 48
    Top = 176
  end
  object qry_processo_: TQuery
    BeforeInsert = qry_processo_BeforeInsert
    AfterCancel = qry_processo_AfterCancel
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, NR_PROP' +
        'OSTA, CD_AGENTE,'
      
        '  VL_OTHER_CHARGE, TP_ESTUFAGEM,VL_TARIFA_FRETE, DT_ABERTURA, CD' +
        '_USUARIO, CD_SERVICO,'
      
        '  NR_PROC_RISC, CD_PAIS_DESTINO, CD_PAIS_ORIGEM, TP_FRETE, TP_CA' +
        'RGA, TP_PROCESSO,'
      
        '  VL_FRETE, CD_STATUS_SDA, IN_LIBERADO, CD_RESTRICAO, NR_CONHECI' +
        'MENTO,'
      
        '  NR_CONHECIMENTO_MASTER, CD_AREA, IN_ROUTING, IN_PEDIDO, VL_HOU' +
        'SE, CHARGEABLE,'
      
        '  CD_INCOTERM, CD_ORIGEM, CD_DESTINO, CD_CIA_TRANSP, CD_TAB_FRET' +
        'E_VENDA,'
      
        '  CD_TAB_FRETE_COMPRA, CD_MOEDA_FRETE,CD_ARMADOR, VL_PESO_BRUTO,' +
        ' CUBAGEM, QTD_VOLUME,'
      
        '  VL_RATEIO, REF_CLIENTE, NR_CONTA_CONTABIL, CD_CT_LUCRO, CD_LOC' +
        'AL_CONSOLIDACAO,'
      
        '  CD_CELULA, CD_ANALISTA_COMISSARIA, IN_ENTREPOSTO, CD_LOCAL_EMB' +
        'ARQUE, CD_LOCAL_DESEMBARQUE,'
      
        '  VL_FRETE_COLLECT_MNEG, VL_FRETE_PREPAID_MNEG, ID_CODIGO_INSTR_' +
        'DESEMB, NR_MANIFESTO, CD_EMBARCACAO,'
      '  TX_MERCADORIA, CD_REPRESENTANTE'
      'FROM TPROCESSO'
      'WHERE NR_PROCESSO IS NULL')
    Left = 160
    Top = 224
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_processo_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPROCESSO.DT_ABERTURA'
    end
    object qry_processo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPROCESSO.CD_USUARIO'
      Size = 4
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 3
    end
    object qry_processo_NR_PROC_RISC: TStringField
      FieldName = 'NR_PROC_RISC'
      Origin = 'TPROCESSO.NR_PROC_RISC'
      Size = 5
    end
    object qry_processo_CD_STATUS_SDA: TStringField
      FieldName = 'CD_STATUS_SDA'
      Origin = 'TPROCESSO.CD_STATUS_SDA'
      Size = 1
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TPROCESSO.IN_LIBERADO'
      Size = 1
    end
    object qry_processo_CD_RESTRICAO: TStringField
      FieldName = 'CD_RESTRICAO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 30
    end
    object qry_processo_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 30
    end
    object qry_processo_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 2
    end
    object qry_processo_CD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
    object qry_processo_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 3
    end
    object qry_processo_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      Origin = 'DBBROKER.TPROCESSO.NR_PROPOSTA'
      FixedChar = True
    end
    object qry_processo_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'DBBROKER.TPROCESSO.CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'DBBROKER.TPROCESSO.CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_processo_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      Origin = 'DBBROKER.TPROCESSO.CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      Origin = 'DBBROKER.TPROCESSO.CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      Origin = 'DBBROKER.TPROCESSO.CD_CIA_TRANSP'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'DBBROKER.TPROCESSO.CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_processo_CD_TAB_FRETE_VENDA: TStringField
      FieldName = 'CD_TAB_FRETE_VENDA'
      Origin = 'DBBROKER.TPROCESSO.CD_TAB_FRETE_VENDA'
      FixedChar = True
      Size = 6
    end
    object qry_processo_CD_TAB_FRETE_COMPRA: TStringField
      FieldName = 'CD_TAB_FRETE_COMPRA'
      Origin = 'DBBROKER.TPROCESSO.CD_TAB_FRETE_COMPRA'
      FixedChar = True
      Size = 6
    end
    object qry_processo_IN_ROUTING: TStringField
      FieldName = 'IN_ROUTING'
      Origin = 'DBBROKER.TPROCESSO.IN_ROUTING'
      FixedChar = True
      Size = 1
    end
    object qry_processo_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TPROCESSO.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_processo_TP_CARGA: TStringField
      FieldName = 'TP_CARGA'
      Origin = 'DBBROKER.TPROCESSO.TP_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_processo_VL_OTHER_CHARGE: TFloatField
      FieldName = 'VL_OTHER_CHARGE'
      Origin = 'DBBROKER.TPROCESSO.VL_OTHER_CHARGE'
    end
    object qry_processo_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TPROCESSO.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_processo_TP_PROCESSO: TStringField
      FieldName = 'TP_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO.TP_PROCESSO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_IN_PEDIDO: TStringField
      FieldName = 'IN_PEDIDO'
      Origin = 'DBBROKER.TPROCESSO.IN_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
      Origin = 'DBBROKER.TPROCESSO.CHARGEABLE'
    end
    object qry_processo_VL_TARIFA_FRETE: TFloatField
      FieldName = 'VL_TARIFA_FRETE'
      Origin = 'DBBROKER.TPROCESSO.VL_TARIFA_FRETE'
    end
    object qry_processo_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'DBBROKER.TPROCESSO.VL_FRETE'
    end
    object qry_processo_VL_HOUSE: TFloatField
      FieldName = 'VL_HOUSE'
      Origin = 'DBBROKER.TPROCESSO.VL_HOUSE'
    end
    object qry_processo_CUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
      Origin = 'DBBROKER.TPROCESSO.CUBAGEM'
    end
    object qry_processo_QTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
      Origin = 'DBBROKER.TPROCESSO.QTD_VOLUME'
    end
    object qry_processo_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      Origin = 'DBBROKER.TPROCESSO.CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_processo_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'DBBROKER.TPROCESSO.VL_PESO_BRUTO'
    end
    object qry_processo_VL_RATEIO: TFloatField
      FieldName = 'VL_RATEIO'
      Origin = 'DBBROKER.TPROCESSO.VL_RATEIO'
    end
    object qry_processo_REF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      Origin = 'DBBROKER.TPROCESSO.REF_CLIENTE'
      FixedChar = True
    end
    object qry_processo_NR_CONTA_CONTABIL: TStringField
      FieldName = 'NR_CONTA_CONTABIL'
      Origin = 'DBBROKER.TPROCESSO.NR_CONTA_CONTABIL'
      FixedChar = True
      Size = 40
    end
    object qry_processo_CD_CT_LUCRO: TStringField
      FieldName = 'CD_CT_LUCRO'
      Origin = 'DBBROKER.TPROCESSO.CD_CT_LUCRO'
      FixedChar = True
      Size = 25
    end
    object qry_processo_CD_LOCAL_CONSOLIDACAO: TStringField
      FieldName = 'CD_LOCAL_CONSOLIDACAO'
      Origin = 'DBBROKER.TPROCESSO.CD_LOCAL_CONSOLIDACAO'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_CELULA: TStringField
      FieldName = 'CD_CELULA'
      Origin = 'DBBROKER.TPROCESSO.CD_CELULA'
      FixedChar = True
      Size = 2
    end
    object qry_processo_CD_ANALISTA_COMISSARIA: TStringField
      FieldName = 'CD_ANALISTA_COMISSARIA'
      Origin = 'DBBROKER.TPROCESSO.CD_ANALISTA_COMISSARIA'
      FixedChar = True
      Size = 4
    end
    object qry_processo_IN_ENTREPOSTO: TStringField
      FieldName = 'IN_ENTREPOSTO'
      Origin = 'DBBROKER.TPROCESSO.IN_ENTREPOSTO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'DBBROKER.TPROCESSO.CD_LOCAL_EMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'DBBROKER.TPROCESSO.CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_VL_FRETE_COLLECT_MNEG: TFloatField
      FieldName = 'VL_FRETE_COLLECT_MNEG'
      Origin = 'DBBROKER.TPROCESSO.VL_FRETE_COLLECT_MNEG'
    end
    object qry_processo_VL_FRETE_PREPAID_MNEG: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MNEG'
      Origin = 'DBBROKER.TPROCESSO.VL_FRETE_PREPAID_MNEG'
    end
    object qry_processo_ID_CODIGO_INSTR_DESEMB: TStringField
      FieldName = 'ID_CODIGO_INSTR_DESEMB'
      Origin = 'DBBROKER.TPROCESSO.ID_CODIGO_INSTR_DESEMB'
      FixedChar = True
      Size = 13
    end
    object qry_processo_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'DBBROKER.TPROCESSO.NR_MANIFESTO'
      FixedChar = True
      Size = 15
    end
    object qry_processo_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'DBBROKER.TPROCESSO.CD_EMBARCACAO'
      FixedChar = True
      Size = 4
    end
    object qry_processo_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'DBBROKER.TPROCESSO.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_processo_CD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'DBBROKER.TPROCESSO.CD_REPRESENTANTE'
      FixedChar = True
      Size = 5
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 160
    Top = 280
  end
  object qry_ult_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_PROCESSO) ULTIMO'
      'FROM   TPROCESSO'
      'WHERE  SUBSTRING( NR_PROCESSO, 1, 6 ) = :NR_PROCESSO AND'
      '       DT_ABERTURA BETWEEN ( :INICIO ) AND ( :FIM )'
      '')
    Left = 160
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FIM'
        ParamType = ptUnknown
      end>
    object qry_ult_processo_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TUSUARIO_HABILITACAO UH (NOLOCK)'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39)
    Left = 376
    Top = 8
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
  object ds_traz_default: TDataSource
    DataSet = qry_traz_default_
    Left = 376
    Top = 64
  end
  object ds_empresa_nac: TDataSource
    Left = 272
    Top = 280
  end
  object qry_cliente_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CS.*'
      'FROM TCLIENTE_SERVICO CS (NOLOCK)'
      
        '   INNER JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = CS.CD_SERVIC' +
        'O'
      'WHERE CS.CD_UNID_NEG = :CD_UNID_NEG'
      '  AND CS.CD_PRODUTO  = :CD_PRODUTO'
      '  AND CS.CD_CLIENTE  = :CD_CLIENTE'
      '  AND CS.CD_SERVICO  = :CD_SERVICO'
      '  AND CS.IN_ATIVO    = '#39'1'#39
      '  AND S.IN_ATIVO     = '#39'1'#39)
    Left = 48
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
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
    object qry_cliente_servico_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCLIENTE_SERVICO.IN_ATIVO'
      Size = 1
    end
    object qry_cliente_servico_NR_DPS: TStringField
      FieldName = 'NR_DPS'
      Origin = 'TCLIENTE_SERVICO.NR_DPS'
      Size = 8
    end
    object qry_cliente_servico_DT_CAPTACAO: TDateTimeField
      FieldName = 'DT_CAPTACAO'
      Origin = 'TCLIENTE_SERVICO.DT_CAPTACAO'
    end
    object qry_cliente_servico_IN_INCIDE_SDA: TStringField
      FieldName = 'IN_INCIDE_SDA'
      Origin = 'TCLIENTE_SERVICO.IN_INCIDE_SDA'
      Size = 1
    end
    object qry_cliente_servico_PZ_PROPOSTA: TIntegerField
      FieldName = 'PZ_PROPOSTA'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
    end
    object qry_cliente_servico_look_nm_servico: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldKind = fkLookup
      FieldName = 'look_servico'
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 35
      Lookup = True
    end
    object qry_cliente_servico_DT_AUTORIZACAO: TDateTimeField
      FieldName = 'DT_AUTORIZACAO'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
    end
    object qry_cliente_servico_CD_PREFIXO: TStringField
      FieldName = 'CD_PREFIXO'
      Origin = 'TCLIENTE_SERVICO.CD_UNID_NEG'
      Size = 2
    end
  end
  object ds_cliente_servico: TDataSource
    DataSet = qry_cliente_servico_
    Left = 48
    Top = 280
  end
  object qry_servico_: TQuery
    BeforeOpen = qry_servico_BeforeOpen
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TSERVICO (NOLOCK)')
    Left = 376
    Top = 120
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
    object qry_servico_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 1
    end
    object qry_servico_CD_CLASSIFICACAO: TStringField
      FieldName = 'CD_CLASSIFICACAO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 2
    end
    object qry_servico_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 2
    end
    object qry_servico_NR_DIAS_CONCLUSAO: TIntegerField
      FieldName = 'NR_DIAS_CONCLUSAO'
      Origin = 'TSERVICO.NM_SERVICO'
    end
    object qry_servico_CD_EVENTO_CONCLUSOR: TStringField
      FieldName = 'CD_EVENTO_CONCLUSOR'
      Origin = 'TSERVICO.CD_CLASSIFICACAO'
      Size = 3
    end
    object qry_servico_IN_FOLLOWUP: TStringField
      FieldName = 'IN_FOLLOWUP'
      Origin = 'TSERVICO.CD_VIA_TRANSPORTE'
      Size = 1
    end
    object qry_servico_IN_ADM_TEMP: TStringField
      FieldName = 'IN_ADM_TEMP'
      Origin = 'TSERVICO.IN_ATIVO'
      Size = 1
    end
    object qry_servico_TP_SERVICO: TStringField
      FieldName = 'TP_SERVICO'
      Origin = 'DBBROKER.TSERVICO.TP_SERVICO'
      FixedChar = True
      Size = 1
    end
    object qry_servico_CD_CT_CUSTO_1: TStringField
      FieldName = 'CD_CT_CUSTO_1'
      Origin = 'DBBROKER.TSERVICO.CD_CT_CUSTO_1'
      FixedChar = True
      Size = 25
    end
    object qry_servico_CD_CT_CUSTO_2: TStringField
      FieldName = 'CD_CT_CUSTO_2'
      Origin = 'DBBROKER.TSERVICO.CD_CT_CUSTO_2'
      FixedChar = True
      Size = 25
    end
    object qry_servico_CD_CT_CUSTO_3: TStringField
      FieldName = 'CD_CT_CUSTO_3'
      Origin = 'DBBROKER.TSERVICO.CD_CT_CUSTO_3'
      FixedChar = True
      Size = 25
    end
    object qry_servico_CD_CT_CUSTO_4: TStringField
      FieldName = 'CD_CT_CUSTO_4'
      Origin = 'DBBROKER.TSERVICO.CD_CT_CUSTO_4'
      FixedChar = True
      Size = 25
    end
    object qry_servico_CD_CT_CUSTO_5: TStringField
      FieldName = 'CD_CT_CUSTO_5'
      Origin = 'DBBROKER.TSERVICO.CD_CT_CUSTO_5'
      FixedChar = True
      Size = 25
    end
    object qry_servico_CD_CT_CUSTO_6: TStringField
      FieldName = 'CD_CT_CUSTO_6'
      Origin = 'DBBROKER.TSERVICO.CD_CT_CUSTO_6'
      FixedChar = True
      Size = 25
    end
    object qry_servico_CD_CT_CUSTO_7: TStringField
      FieldName = 'CD_CT_CUSTO_7'
      Origin = 'DBBROKER.TSERVICO.CD_CT_CUSTO_7'
      FixedChar = True
      Size = 25
    end
    object qry_servico_CD_CT_CUSTO_8: TStringField
      FieldName = 'CD_CT_CUSTO_8'
      Origin = 'DBBROKER.TSERVICO.CD_CT_CUSTO_8'
      FixedChar = True
      Size = 25
    end
    object qry_servico_CD_CT_CUSTO_9: TStringField
      FieldName = 'CD_CT_CUSTO_9'
      Origin = 'DBBROKER.TSERVICO.CD_CT_CUSTO_9'
      FixedChar = True
      Size = 25
    end
    object qry_servico_CD_CT_CUSTO_10: TStringField
      FieldName = 'CD_CT_CUSTO_10'
      Origin = 'DBBROKER.TSERVICO.CD_CT_CUSTO_10'
      FixedChar = True
      Size = 25
    end
    object qry_servico_IN_INDENT: TStringField
      FieldName = 'IN_INDENT'
      Origin = 'DBBROKER.TSERVICO.IN_INDENT'
      FixedChar = True
      Size = 1
    end
    object qry_servico_CD_EV_INI: TStringField
      FieldName = 'CD_EV_INI'
      Origin = 'DBBROKER.TSERVICO.CD_EV_INI'
      FixedChar = True
      Size = 3
    end
    object qry_servico_CD_EV_FIM: TStringField
      FieldName = 'CD_EV_FIM'
      Origin = 'DBBROKER.TSERVICO.CD_EV_FIM'
      FixedChar = True
      Size = 3
    end
    object qry_servico_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TSERVICO.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_servico_TP_CTRL_VENCTO: TStringField
      FieldName = 'TP_CTRL_VENCTO'
      Origin = 'DBBROKER.TSERVICO.TP_CTRL_VENCTO'
      FixedChar = True
      Size = 1
    end
    object qry_servico_IN_CHECK: TStringField
      FieldName = 'IN_CHECK'
      Origin = 'DBBROKER.TSERVICO.IN_CHECK'
      FixedChar = True
      Size = 1
    end
    object qry_servico_CD_CT_CUSTO_11: TStringField
      FieldName = 'CD_CT_CUSTO_11'
      Origin = 'DBBROKER.TSERVICO.CD_CT_CUSTO_11'
      FixedChar = True
      Size = 25
    end
    object qry_servico_IN_ALADI: TStringField
      FieldName = 'IN_ALADI'
      Origin = 'DBBROKER.TSERVICO.IN_ALADI'
      FixedChar = True
      Size = 1
    end
    object qry_servico_IN_FUMIGACAO: TStringField
      FieldName = 'IN_FUMIGACAO'
      Origin = 'DBBROKER.TSERVICO.IN_FUMIGACAO'
      FixedChar = True
      Size = 1
    end
    object qry_servico_NR_CAD_CONFIG_STATUS: TIntegerField
      FieldName = 'NR_CAD_CONFIG_STATUS'
      Origin = 'DBBROKER.TSERVICO.NR_CAD_CONFIG_STATUS'
    end
    object qry_servico_IN_SUBSTITUI: TStringField
      FieldName = 'IN_SUBSTITUI'
      Origin = 'DBBROKER.TSERVICO.IN_SUBSTITUI'
      FixedChar = True
      Size = 1
    end
    object qry_servico_IN_LI: TStringField
      FieldName = 'IN_LI'
      Origin = 'DBBROKER.TSERVICO.IN_LI'
      FixedChar = True
      Size = 1
    end
  end
  object ds_servico: TDataSource
    DataSet = qry_servico_
    Left = 376
    Top = 176
  end
  object sp_follow_up: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_FOLLOW_UP'
    Left = 376
    Top = 224
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
        Name = '@cd_servico'
        ParamType = ptInput
      end>
  end
  object sp_duplica_processo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_duplica_processo'
    Left = 376
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo_fonte'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_processo_destino'
        ParamType = ptInput
      end>
  end
  object qry_proc_aux_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, CD_PRODUTO, NR_PROCESSO, CD_CLIENTE, CD_SERV' +
        'ICO'
      'FROM  TPROCESSO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 48
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_aux_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_proc_aux_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_proc_aux_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_aux_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 5
    end
    object qry_proc_aux_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 3
    end
  end
  object sp_atz_evento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_evento'
    Left = 376
    Top = 336
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
        Name = '@cd_evento_txt'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_realizacao'
        ParamType = ptInput
      end>
  end
  object qry_ref_cli_: TQuery
    CachedUpdates = True
    AfterPost = qry_ref_cli_AfterPost
    AfterDelete = qry_ref_cli_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TREF_CLIENTE WHERE  '
      'NR_PROCESSO=:NR_PROCESSO'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    UpdateObject = updRef_Cli
    Left = 272
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ref_cli_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TREF_CLIENTE.NR_PROCESSO'
      Size = 18
    end
    object qry_ref_cli_NR_SEQUENCIA: TStringField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TREF_CLIENTE.NR_SEQUENCIA'
      Size = 3
    end
    object qry_ref_cli_CD_REFERENCIA: TStringField
      DisplayWidth = 16
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 16
    end
    object qry_ref_cli_NR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_ref_cli_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qry_ref_cli_CD_REF_EXP: TStringField
      DisplayWidth = 16
      FieldName = 'CD_REF_EXP'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_REF_EXP'
      FixedChar = True
      Size = 16
    end
    object qry_ref_cli_DT_REFERENCIA: TDateTimeField
      FieldName = 'DT_REFERENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.DT_REFERENCIA'
    end
    object qry_ref_cli_TP_REFERENCIA: TStringField
      FieldName = 'TP_REFERENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.TP_REFERENCIA'
      FixedChar = True
      Size = 2
    end
    object qry_ref_cli_NR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_PARCIAL'
    end
    object qry_ref_cli_IN_FLAG_LI: TStringField
      FieldName = 'IN_FLAG_LI'
      Origin = 'DBBROKER.TREF_CLIENTE.IN_FLAG_LI'
      FixedChar = True
      Size = 1
    end
    object qry_ref_cli_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object qry_ult_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT MAX (NR_SEQUENCIA)  ULTIMO '
      'FROM TREF_CLIENTE (NOLOCK)'
      'WHERE NR_PROCESSO=:NR_PROCESSO')
    Left = 472
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ult_ref_cli_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TREF_CLIENTE.NR_SEQUENCIA'
      Size = 3
    end
  end
  object qry_li_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      '* FROM TPROCESSO_LI WHERE '
      'NR_PROCESSO <> '#39#39)
    Left = 472
    Top = 224
    object qry_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_LI.NR_PROCESSO'
      Size = 18
    end
    object qry_li_NR_LI: TStringField
      DisplayLabel = 'Nr LI'
      FieldName = 'NR_LI'
      Origin = 'TPROCESSO_LI.NR_LI'
      Size = 10
    end
    object qry_li_DT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'TPROCESSO_LI.DT_REGISTRO'
    end
  end
  object qry_doc_instrucao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TDOCUMENTO_INSTRUCAO WHERE '
      'NR_PROCESSO IS NULL')
    Left = 272
    Top = 392
    object qry_doc_instrucao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDOCUMENTO_INSTRUCAO.NR_PROCESSO'
      Size = 18
    end
    object qry_doc_instrucao_NR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TDOCUMENTO_INSTRUCAO.NR_SEQUENCIA'
    end
    object qry_doc_instrucao_CD_TIPO_DCTO_INSTR: TStringField
      FieldName = 'CD_TIPO_DCTO_INSTR'
      Origin = 'TDOCUMENTO_INSTRUCAO.CD_TIPO_DCTO_INSTR'
      Size = 2
    end
    object qry_doc_instrucao_NR_DCTO_INSTRUCAO: TStringField
      FieldName = 'NR_DCTO_INSTRUCAO'
      Origin = 'TDOCUMENTO_INSTRUCAO.NR_DCTO_INSTRUCAO'
      Size = 25
    end
    object qry_doc_instrucao_Look_doc_inst_emb: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_doc_inst_emb'
      LookupDataSet = tbl_doc_instr_emb_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_TIPO_DCTO_INSTR'
      Size = 60
      Lookup = True
    end
    object qry_doc_instrucao_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'DBBROKER.TDOCUMENTO_INSTRUCAO.DT_FATURA'
    end
    object qry_doc_instrucao_CD_COND_VENDA_ENT: TStringField
      FieldName = 'CD_COND_VENDA_ENT'
      Origin = 'DBBROKER.TDOCUMENTO_INSTRUCAO.CD_COND_VENDA_ENT'
      FixedChar = True
      Size = 1
    end
    object qry_doc_instrucao_NR_DIAS: TIntegerField
      FieldName = 'NR_DIAS'
      Origin = 'DBBROKER.TDOCUMENTO_INSTRUCAO.NR_DIAS'
    end
    object qry_doc_instrucao_DT_VENCTO_FATURA: TDateTimeField
      FieldName = 'DT_VENCTO_FATURA'
      Origin = 'DBBROKER.TDOCUMENTO_INSTRUCAO.DT_VENCTO_FATURA'
    end
    object qry_doc_instrucao_DT_VENCTO_EADI: TDateTimeField
      FieldName = 'DT_VENCTO_EADI'
      Origin = 'DBBROKER.TDOCUMENTO_INSTRUCAO.DT_VENCTO_EADI'
    end
    object qry_doc_instrucao_DT_VENCTO_NAC: TDateTimeField
      FieldName = 'DT_VENCTO_NAC'
      Origin = 'DBBROKER.TDOCUMENTO_INSTRUCAO.DT_VENCTO_NAC'
    end
    object qry_doc_instrucao_IN_AVISO_EADI: TStringField
      FieldName = 'IN_AVISO_EADI'
      Origin = 'DBBROKER.TDOCUMENTO_INSTRUCAO.IN_AVISO_EADI'
      FixedChar = True
      Size = 2
    end
    object qry_doc_instrucao_IN_ABERTURA_PROC: TStringField
      FieldName = 'IN_ABERTURA_PROC'
      Origin = 'DBBROKER.TDOCUMENTO_INSTRUCAO.IN_ABERTURA_PROC'
      FixedChar = True
      Size = 1
    end
  end
  object qry_conhecimento_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_CONHECIMENTO'
      'FROM TPROCESSO'
      
        'WHERE NR_CONHECIMENTO = :NR_CONHECIMENTO AND CD_PRODUTO = :CD_PR' +
        'ODUTO')
    Left = 472
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONHECIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_conhecimento_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_conhecimento_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'TPROCESSO.NR_CONHECIMENTO'
      Size = 30
    end
  end
  object qry_conhecimento_master_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_CONHECIMENTO_MASTER'
      'FROM TPROCESSO (NOLOCK)'
      
        'WHERE NR_CONHECIMENTO_MASTER = :NR_CONHECIMENTO_MASTER  AND CD_P' +
        'RODUTO = :CD_PRODUTO'
      '')
    Left = 472
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONHECIMENTO_MASTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_conhecimento_master_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_conhecimento_master_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Origin = 'TPROCESSO.NR_CONHECIMENTO_MASTER'
      Size = 30
    end
  end
  object sp_ult_sequencia: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ult_sequencia'
    Left = 472
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@identificador'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@chave'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_sequencia'
        ParamType = ptOutput
      end>
  end
  object qry_area_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TAREA (NOLOCK)'
      'WHERE  CD_AREA = :CD_AREA')
    Left = 472
    Top = 8
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
  object qry_ult_processo_por_ano_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_PROCESSO) ULTIMO  FROM TPROCESSO'
      'WHERE CD_UNID_NEG=:CD_UNID_NEG AND '
      'CD_PRODUTO=:CD_PRODUTO AND'
      'SUBSTRING(NR_PROCESSO, 5, 2) = :CD_PREFIXO AND'
      'DT_ABERTURA BETWEEN :INICIO AND :FIM')
    Left = 168
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PREFIXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FIM'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG (NOLOCK)')
    Left = 48
    Top = 392
    object qry_unidade_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unidade_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
    object qry_unidade_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 10
    end
  end
  object qry_cliente_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT H.CD_CLIENTE, H.IN_ATIVO, H.DT_VALID_CRED_RF, E.NM_EMPRES' +
        'A, H.DT_VALID_ANVISA, E.CD_GRUPO'
      'FROM   TCLIENTE_HABILITACAO H (NOLOCK), TEMPRESA_NAC E (NOLOCK)'
      'WHERE  CD_UNID_NEG  = :CD_UNID_NEG AND'
      '       CD_PRODUTO   = :CD_PRODUTO  AND'
      '       CD_CLIENTE   = :CD_CLIENTE  AND'
      '       E.CD_EMPRESA = H.CD_CLIENTE AND'
      '       H.IN_ATIVO = '#39'1'#39' AND'
      '       E.IN_ATIVO = '#39'1'#39)
    Left = 48
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qry_cliente_habilitacao_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCLIENTE_HABILITACAO.IN_ATIVO'
      Size = 1
    end
    object qry_cliente_habilitacao_DT_VALID_CRED_RF: TDateTimeField
      FieldName = 'DT_VALID_CRED_RF'
      Origin = 'TCLIENTE_HABILITACAO.DT_VALID_CRED_RF'
    end
    object qry_cliente_habilitacao_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 50
    end
    object qry_cliente_habilitacao_DT_VALID_ANVISA: TDateTimeField
      FieldName = 'DT_VALID_ANVISA'
    end
    object qry_cliente_habilitacao_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
  end
  object ds_doc_instrucao: TDataSource
    DataSet = qry_doc_instrucao_
    Left = 376
    Top = 392
  end
  object ds_doc_instr_emb: TDataSource
    DataSet = tbl_doc_instr_emb_
    Left = 472
    Top = 336
  end
  object tbl_doc_instr_emb_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TDOC_INSTRUCAO_DESPACHO'
    UpdateMode = upWhereKeyOnly
    Left = 472
    Top = 392
    object tbl_doc_instr_emb_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 2
    end
    object tbl_doc_instr_emb_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object qry_doc_inst_temp_: TQuery
    CachedUpdates = True
    BeforePost = qry_doc_inst_temp_BeforePost
    AfterPost = qry_doc_inst_temp_AfterPost
    AfterDelete = qry_doc_inst_temp_AfterDelete
    OnNewRecord = qry_doc_inst_temp_NewRecord
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      'NR_IDENTIFICADOR,'
      
        'NR_SEQUENCIA, CD_TIPO_DCTO_INSTR ,NR_DCTO_INSTRUCAO, DT_DOCUMENT' +
        'O'
      'FROM TDOCUMENTO_INSTRUCAO_TEMP '
      'WHERE  NR_IDENTIFICADOR IS NULL')
    Left = 584
    Top = 396
    object StringField5: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_doc_inst_emb'
      LookupDataSet = tbl_doc_instr_emb_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_TIPO_DCTO_INSTR'
      Size = 60
      Lookup = True
    end
    object qry_doc_inst_temp_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'TDOCUMENTO_INSTRUCAO_TEMP.NR_IDENTIFICADOR'
    end
    object qry_doc_inst_temp_NR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TDOCUMENTO_INSTRUCAO_TEMP.NR_SEQUENCIA'
    end
    object qry_doc_inst_temp_CD_TIPO_DCTO_INSTR: TStringField
      FieldName = 'CD_TIPO_DCTO_INSTR'
      Origin = 'TDOCUMENTO_INSTRUCAO_TEMP.CD_TIPO_DCTO_INSTR'
      Size = 2
    end
    object qry_doc_inst_temp_NR_DCTO_INSTRUCAO: TStringField
      FieldName = 'NR_DCTO_INSTRUCAO'
      Origin = 'TDOCUMENTO_INSTRUCAO_TEMP.NR_DCTO_INSTRUCAO'
      Size = 25
    end
    object qry_doc_inst_temp_DT_DOCUMENTO: TDateTimeField
      FieldName = 'DT_DOCUMENTO'
      Origin = 'DBBROKER.TDOCUMENTO_INSTRUCAO_TEMP.DT_DOCUMENTO'
    end
  end
  object ds_doc_inst_temp: TDataSource
    DataSet = qry_doc_inst_temp_
    Left = 584
    Top = 336
  end
  object qry_ult_doc_inst_temp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(ISNULL(NR_IDENTIFICADOR, 1))  AS ULTIMO'
      'FROM TDOCUMENTO_INSTRUCAO_TEMP (NOLOCK)'
      '')
    Left = 584
    Top = 280
    object qry_ult_doc_inst_temp_ULTIMO: TIntegerField
      FieldName = 'ULTIMO'
    end
  end
  object Up_tdoc: TUpdateSQL
    ModifySQL.Strings = (
      'update TDOCUMENTO_INSTRUCAO_TEMP'
      'set'
      '  NR_IDENTIFICADOR = :NR_IDENTIFICADOR,'
      '  NR_SEQUENCIA = :NR_SEQUENCIA,'
      '  CD_TIPO_DCTO_INSTR = :CD_TIPO_DCTO_INSTR,'
      '  NR_DCTO_INSTRUCAO = :NR_DCTO_INSTRUCAO,'
      '  DT_DOCUMENTO = :DT_DOCUMENTO'
      'where'
      '  NR_IDENTIFICADOR = :OLD_NR_IDENTIFICADOR and'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA')
    InsertSQL.Strings = (
      'insert into TDOCUMENTO_INSTRUCAO_TEMP'
      
        '  (NR_IDENTIFICADOR, NR_SEQUENCIA, CD_TIPO_DCTO_INSTR, NR_DCTO_I' +
        'NSTRUCAO, '
      '   DT_DOCUMENTO)'
      'values'
      
        '  (:NR_IDENTIFICADOR, :NR_SEQUENCIA, :CD_TIPO_DCTO_INSTR, :NR_DC' +
        'TO_INSTRUCAO, '
      '   :DT_DOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from TDOCUMENTO_INSTRUCAO_TEMP'
      'where'
      '  NR_IDENTIFICADOR = :OLD_NR_IDENTIFICADOR and'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA')
    Left = 584
    Top = 224
  end
  object qry_local_docs_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_TIPO_DCTO_INSTR, NR_DCTO_INSTRUCAO, DESCR' +
        'ICAO'
      
        'FROM TDOCUMENTO_INSTRUCAO (NOLOCK), TDOC_INSTRUCAO_DESPACHO (NOL' +
        'OCK)'
      'WHERE CODIGO = CD_TIPO_DCTO_INSTR'
      'AND CD_TIPO_DCTO_INSTR =:CD_TIPO_DCTO_INSTR'
      'AND NR_DCTO_INSTRUCAO =:NR_DCTO_INSTRUCAO')
    Left = 584
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_TIPO_DCTO_INSTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_DCTO_INSTRUCAO'
        ParamType = ptUnknown
      end>
    object qry_local_docs_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDOCUMENTO_INSTRUCAO.NR_PROCESSO'
      Size = 18
    end
    object qry_local_docs_CD_TIPO_DCTO_INSTR: TStringField
      FieldName = 'CD_TIPO_DCTO_INSTR'
      Origin = 'TDOCUMENTO_INSTRUCAO.CD_TIPO_DCTO_INSTR'
      Size = 2
    end
    object qry_local_docs_NR_DCTO_INSTRUCAO: TStringField
      FieldName = 'NR_DCTO_INSTRUCAO'
      Origin = 'TDOCUMENTO_INSTRUCAO.NR_DCTO_INSTRUCAO'
      Size = 25
    end
    object qry_local_docs_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TDOC_INSTRUCAO_DESPACHO.DESCRICAO'
      Size = 120
    end
  end
  object qry_apaga_temp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE TDOCUMENTO_INSTRUCAO_TEMP'
      'WHERE NR_IDENTIFICADOR =:NR_IDENTIFICADOR')
    Left = 584
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
  end
  object qry_ult_seq_tdoc_temp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT (MAX(ISNULL(NR_SEQUENCIA, 0)) + 1) AS SEQ'
      'FROM TDOCUMENTO_INSTRUCAO_TEMP'
      'WHERE NR_IDENTIFICADOR =:NR_IDENTIFICADOR')
    Left = 584
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
    object qry_ult_seq_tdoc_temp_SEQ: TIntegerField
      FieldName = 'SEQ'
    end
  end
  object qry_empresa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, IN_RESTRICAO , CGC_EM' +
        'PRESA, CPF_EMPRESA'
      'FROM   TEMPRESA_NAC (NOLOCK)'
      'WHERE CD_EMPRESA=:CD_EMPRESA'
      ' '
      ' ')
    Left = 272
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
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
    object qry_empresa_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
    object qry_empresa_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Origin = 'TEMPRESA_NAC.IN_RESTRICAO'
      Size = 1
    end
    object qry_empresa_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qry_empresa_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CPF_EMPRESA'
      FixedChar = True
      Size = 11
    end
  end
  object qry_proposta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  DISTINCT TP.NR_PROPOSTA, TPF.CD_MOEDA,TPF.TP_CARGA,TPF.O' +
        'THER_VENDA, TP.TP_PROPOSTA,'
      
        '      TPI.CD_INCOTERM,TPF.CD_TAB_FRETE,TPF.CD_TAB_FRETE_COMPRA, ' +
        'TP.PESO_TAXADO'
      
        'FROM TPROPOSTA TP (NOLOCK), TPROPOSTA_ITEM TPI (NOLOCK), TPROPOS' +
        'TA_FRETE TPF (NOLOCK)'
      
        '    WHERE (TP.NR_PROPOSTA = TPI.NR_PROPOSTA) AND (TP.DT_VALIDADE' +
        ' >= CONVERT(DATETIME,:DT_VENCTO,103)) AND'
      
        '         (TPI.NR_PROPOSTA = TPF.NR_PROPOSTA  AND TPI.CD_SERVICO ' +
        '= TPF.CD_SERVICO)'
      
        '          AND  (TP.CD_EMPRESA = :CD_EMPRESA) AND (TPI.CD_SERVICO' +
        ' = :CD_SERVICO)AND'
      
        '           (TPI.CD_PRODUTO=:CD_PRODUTO) AND (TPI.CD_UNID_NEG = :' +
        'CD_UNID_NEG) AND (TPF.CD_ORIGEM =:CD_ORIGEM) AND'
      '            (TPF.CD_DESTINO =:CD_DESTINO)  AND'
      '              (TP.NR_PROPOSTA=:NR_PROPOSTA)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 584
    Top = 64
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'DT_VENCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_DESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end>
    object qry_proposta_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_proposta_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_proposta_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      FixedChar = True
      Size = 6
    end
    object qry_proposta_CD_TAB_FRETE_COMPRA: TStringField
      FieldName = 'CD_TAB_FRETE_COMPRA'
      FixedChar = True
      Size = 6
    end
    object qry_proposta_TP_CARGA: TStringField
      FieldName = 'TP_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_proposta_TP_PROPOSTA: TStringField
      FieldName = 'TP_PROPOSTA'
      FixedChar = True
      Size = 1
    end
    object qry_proposta_PESO_TAXADO: TFloatField
      FieldName = 'PESO_TAXADO'
    end
    object qry_proposta_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_proposta_OTHER_VENDA: TFloatField
      FieldName = 'OTHER_VENDA'
    end
  end
  object qry_cotacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROPOSTA, TPF.CD_MOEDA, TP.TP_PROPOSTA, TPI.VL_FRET' +
        'E_VENDA, TPI.VL_FRETE_CUSTO, TPI.OTHER_VENDA,'
      
        '      TPI.CD_INCOTERM,TPF.CD_TAB_FRETE,TPF.CD_TAB_FRETE_COMPRA, ' +
        'TP.PESO_TAXADO, TPI.VL_VENDA, TPI.VL_CUSTO, TPI.OTHER_CUSTO,'
      
        ' TPI.VL_CHARGEABLE, TPI.VL_PESO_TON, TPI.VL_PESO_KG, TPI.TP_ESTU' +
        'FAGEM, TPI.QTDE_VOL , TPI.VL_CUBAGEM,TPI.VL_CUSTO'
      
        '    FROM TPROPOSTA TP (NOLOCK), TPROPOSTA_ITEM TPI (NOLOCK), TPR' +
        'OPOSTA_FRETE TPF (NOLOCK) WHERE (TP.NR_PROPOSTA = TPI.NR_PROPOST' +
        'A) AND'
      '     (TP.DT_VALIDADE >=  CONVERT(DATETIME,:DT_VENCTO,103)) AND'
      
        '         (TPI.NR_PROPOSTA = TPF.NR_PROPOSTA  AND TPI.CD_SERVICO ' +
        '= TPF.CD_SERVICO)'
      
        '          AND  (TP.CD_EMPRESA = :CD_EMPRESA) AND (TPI.CD_SERVICO' +
        ' = :CD_SERVICO)AND'
      
        '           (TPI.CD_PRODUTO=:CD_PRODUTO) AND (TP.CD_UNID_NEG = :C' +
        'D_UNID_NEG) AND (TPF.CD_ORIGEM =:CD_ORIGEM) AND'
      
        '            (TPF.CD_DESTINO =:CD_DESTINO)   AND  (TP.NR_PROPOSTA' +
        '=:NR_PROPOSTA) AND (TP.TP_PROPOSTA = '#39'1'#39')'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 688
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'DT_VENCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_DESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end>
    object qry_cotacao_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_cotacao_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_TP_PROPOSTA: TStringField
      FieldName = 'TP_PROPOSTA'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_VL_FRETE_VENDA: TFloatField
      FieldName = 'VL_FRETE_VENDA'
    end
    object qry_cotacao_VL_FRETE_CUSTO: TFloatField
      FieldName = 'VL_FRETE_CUSTO'
    end
    object qry_cotacao_OTHER_VENDA: TFloatField
      FieldName = 'OTHER_VENDA'
    end
    object qry_cotacao_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_cotacao_CD_TAB_FRETE_COMPRA: TStringField
      FieldName = 'CD_TAB_FRETE_COMPRA'
      FixedChar = True
      Size = 5
    end
    object qry_cotacao_PESO_TAXADO: TFloatField
      FieldName = 'PESO_TAXADO'
    end
    object qry_cotacao_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qry_cotacao_VL_CUSTO: TFloatField
      FieldName = 'VL_CUSTO'
    end
    object qry_cotacao_OTHER_CUSTO: TFloatField
      FieldName = 'OTHER_CUSTO'
    end
    object qry_cotacao_VL_CHARGEABLE: TFloatField
      FieldName = 'VL_CHARGEABLE'
    end
    object qry_cotacao_VL_PESO_TON: TFloatField
      FieldName = 'VL_PESO_TON'
    end
    object qry_cotacao_VL_PESO_KG: TFloatField
      FieldName = 'VL_PESO_KG'
    end
    object qry_cotacao_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_QTDE_VOL: TFloatField
      FieldName = 'QTDE_VOL'
    end
    object qry_cotacao_VL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
    end
  end
  object qry_conhec_vinc: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TH.CD_MASTER, TH.CD_HOUSE, TH.NR_PROCESSO, TP.CD_ORIGEM, ' +
        'TP.CD_DESTINO,'
      
        ' (SELECT TOR.NM_PORTO FROM TPORTO TOR (NOLOCK) WHERE TOR.CD_PORT' +
        'O =TP.CD_ORIGEM)NM_ORIGEM,'
      
        ' (SELECT TDE.NM_PORTO FROM TPORTO TDE (NOLOCK) WHERE TDE.CD_PORT' +
        'O =TP.CD_DESTINO)NM_DESTNO'
      
        '  FROM THOUSE TH (NOLOCK), TPROCESSO TP (NOLOCK) WHERE  TH.NR_PR' +
        'OCESSO = TP.NR_PROCESSO AND'
      '    TH.NR_MASTER = :NR_MASTER'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 688
    Top = 64
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_MASTER'
        ParamType = ptUnknown
      end>
    object qry_conhec_vincCD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_conhec_vincCD_HOUSE: TStringField
      FieldName = 'CD_HOUSE'
      FixedChar = True
    end
    object qry_conhec_vincNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 14
    end
    object qry_conhec_vincCD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_conhec_vincCD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_conhec_vincNM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_conhec_vincNM_DESTNO: TStringField
      FieldName = 'NM_DESTNO'
      FixedChar = True
      Size = 50
    end
  end
  object ds_conhec_vinc: TDataSource
    DataSet = qry_conhec_vinc
    Left = 688
    Top = 120
  end
  object sp_vincula_processo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_vincula_processo'
    Left = 688
    Top = 176
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
        Name = '@nr_proc_vinc'
        ParamType = ptInput
      end>
  end
  object qry_celula_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT C.CD_CELULA, C.NM_CELULA, C.CD_ANALISTA, U.NM_USUARIO AS ' +
        'NM_ANALISTA'
      'FROM   TCELULA C (NOLOCK), TUSUARIO U (NOLOCK)'
      'WHERE  C.CD_ANALISTA = U.CD_USUARIO AND'
      '       C.CD_CELULA = :CD_CELULA'
      '')
    Left = 688
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptUnknown
      end>
  end
  object sp_atz_followup: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_followup'
    Left = 696
    Top = 344
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
      end>
  end
  object updRef_Cli: TUpdateSQL
    ModifySQL.Strings = (
      'update TREF_CLIENTE'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_SEQUENCIA = :NR_SEQUENCIA,'
      '  CD_REFERENCIA = :CD_REFERENCIA,'
      '  CD_REF_EXP = :CD_REF_EXP,'
      '  DT_REFERENCIA = :DT_REFERENCIA,'
      '  TP_REFERENCIA = :TP_REFERENCIA,'
      '  CD_AREA = :CD_AREA,'
      '  NR_ITEM_PO = :NR_ITEM_PO,'
      '  NR_PARCIAL = :NR_PARCIAL,'
      '  IN_FLAG_LI = :IN_FLAG_LI,'
      '  CD_EMPRESA = :CD_EMPRESA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA')
    InsertSQL.Strings = (
      'insert into TREF_CLIENTE'
      
        '  (NR_PROCESSO, NR_SEQUENCIA, CD_REFERENCIA, CD_REF_EXP, DT_REFE' +
        'RENCIA, '
      
        '   TP_REFERENCIA, CD_AREA, NR_ITEM_PO, NR_PARCIAL, IN_FLAG_LI, C' +
        'D_EMPRESA)'
      'values'
      
        '  (:NR_PROCESSO, :NR_SEQUENCIA, :CD_REFERENCIA, :CD_REF_EXP, :DT' +
        '_REFERENCIA, '
      
        '   :TP_REFERENCIA, :CD_AREA, :NR_ITEM_PO, :NR_PARCIAL, :IN_FLAG_' +
        'LI, :CD_EMPRESA)')
    DeleteSQL.Strings = (
      'delete from TREF_CLIENTE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA')
    Left = 320
    Top = 341
  end
  object qry_intrucao_desemb: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ID_CODIGO, CD_CLIENTE, IN_AUTORIZADO'
      'FROM TINSTRUCAO_DESEMBARACO'
      'WHERE ID_CODIGO = :ID_CODIGO')
    Left = 696
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_CODIGO'
        ParamType = ptInput
      end>
    object qry_intrucao_desembID_CODIGO: TStringField
      FieldName = 'ID_CODIGO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO.ID_CODIGO'
      FixedChar = True
      Size = 13
    end
    object qry_intrucao_desembCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_intrucao_desembIN_AUTORIZADO: TStringField
      FieldName = 'IN_AUTORIZADO'
      Origin = 'DBBROKER.TINSTRUCAO_DESEMBARACO.IN_AUTORIZADO'
      FixedChar = True
      Size = 1
    end
  end
  object qryFatores: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DISTINCT FC.NM_CAMPO_PROCESSO, FC.NM_FATOR_CAMPO, FC.NM_L' +
        'OOKUP_TABELA, FC.NM_LOOKUP_SQL, FC.NM_LOOKUP_CAMPO_CHAVE, FC.NM_' +
        'LOOKUP_CAMPO_RETORNO'
      'FROM TFATORES F'
      '   INNER JOIN TFATORES_SERVICOS FS ON FS.CD_FATOR = F.CD_FATOR'
      '   INNER JOIN TFATORES_CAMPOS FC ON FC.CD_FATOR = F.CD_FATOR'
      '   LEFT JOIN TEMPRESA_NAC E ON E.CD_GRUPO = F.CD_GRUPO'
      'WHERE ((E.CD_EMPRESA = :CD_EMPRESA) OR (F.CD_GRUPO = '#39'XXX'#39'))'
      '  AND CD_UNID_NEG IN ('#39'XX'#39', :CD_UNID_NEG)'
      '  AND CD_PRODUTO IN ('#39'XX'#39', :CD_PRODUTO)'
      '  AND CD_SERVICO = :CD_SERVICO'
      '  AND IN_OPCIONAL = 0')
    Left = 784
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'CD_SERVICO'
        ParamType = ptInput
      end>
    object qryFatoresNM_CAMPO_PROCESSO: TStringField
      FieldName = 'NM_CAMPO_PROCESSO'
      FixedChar = True
      Size = 10
    end
    object qryFatoresNM_FATOR_CAMPO: TStringField
      FieldName = 'NM_FATOR_CAMPO'
      FixedChar = True
      Size = 100
    end
    object qryFatoresNM_LOOKUP_TABELA: TStringField
      FieldName = 'NM_LOOKUP_TABELA'
      FixedChar = True
      Size = 100
    end
    object qryFatoresNM_LOOKUP_SQL: TStringField
      FieldName = 'NM_LOOKUP_SQL'
      FixedChar = True
      Size = 100
    end
    object qryFatoresNM_LOOKUP_CAMPO_CHAVE: TStringField
      FieldName = 'NM_LOOKUP_CAMPO_CHAVE'
      FixedChar = True
      Size = 100
    end
    object qryFatoresNM_LOOKUP_CAMPO_RETORNO: TStringField
      FieldName = 'NM_LOOKUP_CAMPO_RETORNO'
      FixedChar = True
      Size = 100
    end
  end
  object qryCamposProcesso: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT C.NAME AS FIELD_NAME, UPPER(T.NAME) AS TYPE_NAME, C.MAX_L' +
        'ENGTH AS FIELD_SIZE'
      'FROM SYS.ALL_COLUMNS C'
      '   INNER JOIN SYS.TYPES T ON T.SYSTEM_TYPE_ID = C.SYSTEM_TYPE_ID'
      'WHERE C.OBJECT_ID = OBJECT_ID('#39'TPROCESSO'#39')'
      'ORDER BY C.NAME')
    Left = 784
    Top = 320
    object qryCamposProcessoFIELD_NAME: TStringField
      FieldName = 'FIELD_NAME'
      FixedChar = True
      Size = 255
    end
    object qryCamposProcessoTYPE_NAME: TStringField
      FieldName = 'TYPE_NAME'
      FixedChar = True
      Size = 255
    end
    object qryCamposProcessoFIELD_SIZE: TSmallintField
      FieldName = 'FIELD_SIZE'
    end
  end
  object qry_BID_Nestle: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT  *'
      'FROM TBID')
    UpdateObject = up_BID_Nestle
    Left = 40
    Top = 456
    object qry_BID_NestleCONTRACT_ID: TIntegerField
      FieldName = 'CONTRACT_ID'
    end
    object qry_BID_NestleCARRIER: TStringField
      FieldName = 'CARRIER'
      FixedChar = True
      Size = 255
    end
    object qry_BID_NestleCOMMODITY: TStringField
      FieldName = 'COMMODITY'
      FixedChar = True
      Size = 10
    end
    object qry_BID_NestleAREA: TStringField
      FieldName = 'AREA'
      FixedChar = True
      Size = 50
    end
    object qry_BID_NestleUNIQUE_IDENTIFIER: TStringField
      FieldName = 'UNIQUE_IDENTIFIER'
      FixedChar = True
      Size = 12
    end
    object qry_BID_NestleORIGIN_SERVICE: TStringField
      FieldName = 'ORIGIN_SERVICE'
      FixedChar = True
      Size = 5
    end
    object qry_BID_NestleDESTINATION_SERVICE: TStringField
      FieldName = 'DESTINATION_SERVICE'
      FixedChar = True
      Size = 5
    end
    object qry_BID_NestleCD_ORIG_COUNTRY: TStringField
      FieldName = 'CD_ORIG_COUNTRY'
      FixedChar = True
      Size = 3
    end
    object qry_BID_NestleORIG_COUNTRY: TStringField
      FieldName = 'ORIG_COUNTRY'
      FixedChar = True
      Size = 120
    end
    object qry_BID_NestleCD_DEST_COUNTRY: TStringField
      FieldName = 'CD_DEST_COUNTRY'
      FixedChar = True
      Size = 3
    end
    object qry_BID_NestleDEST_COUNTRY: TStringField
      FieldName = 'DEST_COUNTRY'
      FixedChar = True
      Size = 120
    end
    object qry_BID_NestleCD_ORIGIN_CITY: TStringField
      FieldName = 'CD_ORIGIN_CITY'
      FixedChar = True
      Size = 4
    end
    object qry_BID_NestleORIGIN_CITY: TStringField
      FieldName = 'ORIGIN_CITY'
      FixedChar = True
      Size = 50
    end
    object qry_BID_NestleCD_DEST_CITY: TStringField
      FieldName = 'CD_DEST_CITY'
      FixedChar = True
      Size = 3
    end
    object qry_BID_NestleDEST_CITY: TStringField
      FieldName = 'DEST_CITY'
      FixedChar = True
      Size = 120
    end
    object qry_BID_NestleCD_PORT_LOAD: TStringField
      FieldName = 'CD_PORT_LOAD'
      FixedChar = True
      Size = 4
    end
    object qry_BID_NestlePORT_LOAD: TStringField
      FieldName = 'PORT_LOAD'
      FixedChar = True
      Size = 50
    end
    object qry_BID_NestleCD_PORT_DISCHARGE: TStringField
      FieldName = 'CD_PORT_DISCHARGE'
      FixedChar = True
      Size = 4
    end
    object qry_BID_NestlePORT_DISCHARGE: TStringField
      FieldName = 'PORT_DISCHARGE'
      FixedChar = True
      Size = 50
    end
    object qry_BID_NestleCD_EQUIPMENT: TStringField
      FieldName = 'CD_EQUIPMENT'
      FixedChar = True
      Size = 2
    end
    object qry_BID_NestleEQUIPMENT: TStringField
      FieldName = 'EQUIPMENT'
      FixedChar = True
    end
    object qry_BID_NestleTOTAL_PRICE: TFloatField
      FieldName = 'TOTAL_PRICE'
    end
    object qry_BID_NestlePRICE_CURRENCY: TStringField
      FieldName = 'PRICE_CURRENCY'
      FixedChar = True
      Size = 10
    end
    object qry_BID_NestleBASE_RATE: TFloatField
      FieldName = 'BASE_RATE'
    end
    object qry_BID_NestleBASE_RATE_CURRENCY: TFloatField
      FieldName = 'BASE_RATE_CURRENCY'
    end
    object qry_BID_NestleTRANSIT_TIME: TIntegerField
      FieldName = 'TRANSIT_TIME'
    end
    object qry_BID_NestleCD_DEST_NEST: TStringField
      FieldName = 'CD_DEST_NEST'
      FixedChar = True
      Size = 3
    end
    object qry_BID_NestleDEST_NEST: TStringField
      FieldName = 'DEST_NEST'
      FixedChar = True
      Size = 120
    end
    object qry_BID_NestleCD_ORIG_NEST: TStringField
      FieldName = 'CD_ORIG_NEST'
      FixedChar = True
      Size = 3
    end
    object qry_BID_NestleORIG_NEST: TStringField
      FieldName = 'ORIG_NEST'
      FixedChar = True
      Size = 120
    end
    object qry_BID_NestlePRODUCT: TStringField
      FieldName = 'PRODUCT'
      FixedChar = True
      Size = 255
    end
    object qry_BID_NestleSHIPPING_TERMS: TStringField
      FieldName = 'SHIPPING_TERMS'
      FixedChar = True
      Size = 10
    end
    object qry_BID_NestleTRAFFIC_TYPE: TStringField
      FieldName = 'TRAFFIC_TYPE'
      FixedChar = True
      Size = 255
    end
    object qry_BID_NestleCARRIER_AWARD: TFloatField
      FieldName = 'CARRIER_AWARD'
    end
    object qry_BID_NestleCARRIER_ALLOCATION: TIntegerField
      FieldName = 'CARRIER_ALLOCATION'
    end
    object qry_BID_NestleCD_CARRIER: TStringField
      FieldName = 'CD_CARRIER'
      FixedChar = True
      Size = 4
    end
  end
  object ds_BID_Nestle: TDataSource
    DataSet = qry_BID_Nestle
    Left = 128
    Top = 456
  end
  object up_BID_Nestle: TUpdateSQL
    ModifySQL.Strings = (
      'update TBID'
      'set'
      '  CONTRACT_ID = :CONTRACT_ID,'
      '  CARRIER = :CARRIER,'
      '  COMMODITY = :COMMODITY,'
      '  AREA = :AREA,'
      '  UNIQUE_IDENTIFIER = :UNIQUE_IDENTIFIER,'
      '  ORIGIN_SERVICE = :ORIGIN_SERVICE,'
      '  DESTINATION_SERVICE = :DESTINATION_SERVICE,'
      '  CD_ORIG_COUNTRY = :CD_ORIG_COUNTRY,'
      '  ORIG_COUNTRY = :ORIG_COUNTRY,'
      '  CD_DEST_COUNTRY = :CD_DEST_COUNTRY,'
      '  DEST_COUNTRY = :DEST_COUNTRY,'
      '  CD_ORIGIN_CITY = :CD_ORIGIN_CITY,'
      '  ORIGIN_CITY = :ORIGIN_CITY,'
      '  CD_DEST_CITY = :CD_DEST_CITY,'
      '  DEST_CITY = :DEST_CITY,'
      '  CD_PORT_LOAD = :CD_PORT_LOAD,'
      '  PORT_LOAD = :PORT_LOAD,'
      '  CD_PORT_DISCHARGE = :CD_PORT_DISCHARGE,'
      '  PORT_DISCHARGE = :PORT_DISCHARGE,'
      '  CD_EQUIPMENT = :CD_EQUIPMENT,'
      '  EQUIPMENT = :EQUIPMENT,'
      '  TOTAL_PRICE = :TOTAL_PRICE,'
      '  PRICE_CURRENCY = :PRICE_CURRENCY,'
      '  BASE_RATE = :BASE_RATE,'
      '  BASE_RATE_CURRENCY = :BASE_RATE_CURRENCY,'
      '  TRANSIT_TIME = :TRANSIT_TIME,'
      '  CD_DEST_NEST = :CD_DEST_NEST,'
      '  DEST_NEST = :DEST_NEST,'
      '  CD_ORIG_NEST = :CD_ORIG_NEST,'
      '  ORIG_NEST = :ORIG_NEST,'
      '  PRODUCT = :PRODUCT,'
      '  SHIPPING_TERMS = :SHIPPING_TERMS,'
      '  TRAFFIC_TYPE = :TRAFFIC_TYPE,'
      '  CARRIER_AWARD = :CARRIER_AWARD,'
      '  CARRIER_ALLOCATION = :CARRIER_ALLOCATION,'
      '  CD_CARRIER = :CD_CARRIER'
      'where'
      '  CONTRACT_ID = :OLD_CONTRACT_ID and'
      '  CARRIER = :OLD_CARRIER and'
      '  COMMODITY = :OLD_COMMODITY and'
      '  AREA = :OLD_AREA and'
      '  UNIQUE_IDENTIFIER = :OLD_UNIQUE_IDENTIFIER and'
      '  ORIGIN_SERVICE = :OLD_ORIGIN_SERVICE and'
      '  DESTINATION_SERVICE = :OLD_DESTINATION_SERVICE and'
      '  CD_ORIG_COUNTRY = :OLD_CD_ORIG_COUNTRY and'
      '  ORIG_COUNTRY = :OLD_ORIG_COUNTRY and'
      '  CD_DEST_COUNTRY = :OLD_CD_DEST_COUNTRY and'
      '  DEST_COUNTRY = :OLD_DEST_COUNTRY and'
      '  CD_ORIGIN_CITY = :OLD_CD_ORIGIN_CITY and'
      '  ORIGIN_CITY = :OLD_ORIGIN_CITY and'
      '  CD_DEST_CITY = :OLD_CD_DEST_CITY and'
      '  DEST_CITY = :OLD_DEST_CITY and'
      '  CD_PORT_LOAD = :OLD_CD_PORT_LOAD and'
      '  PORT_LOAD = :OLD_PORT_LOAD and'
      '  CD_PORT_DISCHARGE = :OLD_CD_PORT_DISCHARGE and'
      '  PORT_DISCHARGE = :OLD_PORT_DISCHARGE and'
      '  CD_EQUIPMENT = :OLD_CD_EQUIPMENT and'
      '  EQUIPMENT = :OLD_EQUIPMENT and'
      '  TOTAL_PRICE = :OLD_TOTAL_PRICE and'
      '  PRICE_CURRENCY = :OLD_PRICE_CURRENCY and'
      '  BASE_RATE = :OLD_BASE_RATE and'
      '  BASE_RATE_CURRENCY = :OLD_BASE_RATE_CURRENCY and'
      '  TRANSIT_TIME = :OLD_TRANSIT_TIME and'
      '  CD_DEST_NEST = :OLD_CD_DEST_NEST and'
      '  DEST_NEST = :OLD_DEST_NEST and'
      '  CD_ORIG_NEST = :OLD_CD_ORIG_NEST and'
      '  ORIG_NEST = :OLD_ORIG_NEST and'
      '  PRODUCT = :OLD_PRODUCT and'
      '  SHIPPING_TERMS = :OLD_SHIPPING_TERMS and'
      '  TRAFFIC_TYPE = :OLD_TRAFFIC_TYPE and'
      '  CARRIER_AWARD = :OLD_CARRIER_AWARD and'
      '  CARRIER_ALLOCATION = :OLD_CARRIER_ALLOCATION')
    InsertSQL.Strings = (
      'insert into TBID'
      
        '  (CONTRACT_ID, CARRIER, COMMODITY, AREA, UNIQUE_IDENTIFIER, ORI' +
        'GIN_SERVICE, '
      
        '   DESTINATION_SERVICE, CD_ORIG_COUNTRY, ORIG_COUNTRY, CD_DEST_C' +
        'OUNTRY, '
      
        '   DEST_COUNTRY, CD_ORIGIN_CITY, ORIGIN_CITY, CD_DEST_CITY, DEST' +
        '_CITY, '
      
        '   CD_PORT_LOAD, PORT_LOAD, CD_PORT_DISCHARGE, PORT_DISCHARGE, C' +
        'D_EQUIPMENT, '
      
        '   EQUIPMENT, TOTAL_PRICE, PRICE_CURRENCY, BASE_RATE, BASE_RATE_' +
        'CURRENCY, '
      
        '   TRANSIT_TIME, CD_DEST_NEST, DEST_NEST, CD_ORIG_NEST, ORIG_NES' +
        'T, PRODUCT, '
      
        '   SHIPPING_TERMS, TRAFFIC_TYPE, CARRIER_AWARD, CARRIER_ALLOCATI' +
        'ON, CD_CARRIER)'
      'values'
      
        '  (:CONTRACT_ID, :CARRIER, :COMMODITY, :AREA, :UNIQUE_IDENTIFIER' +
        ', :ORIGIN_SERVICE, '
      
        '   :DESTINATION_SERVICE, :CD_ORIG_COUNTRY, :ORIG_COUNTRY, :CD_DE' +
        'ST_COUNTRY, '
      
        '   :DEST_COUNTRY, :CD_ORIGIN_CITY, :ORIGIN_CITY, :CD_DEST_CITY, ' +
        ':DEST_CITY, '
      
        '   :CD_PORT_LOAD, :PORT_LOAD, :CD_PORT_DISCHARGE, :PORT_DISCHARG' +
        'E, :CD_EQUIPMENT, '
      
        '   :EQUIPMENT, :TOTAL_PRICE, :PRICE_CURRENCY, :BASE_RATE, :BASE_' +
        'RATE_CURRENCY, '
      
        '   :TRANSIT_TIME, :CD_DEST_NEST, :DEST_NEST, :CD_ORIG_NEST, :ORI' +
        'G_NEST, '
      
        '   :PRODUCT, :SHIPPING_TERMS, :TRAFFIC_TYPE, :CARRIER_AWARD, :CA' +
        'RRIER_ALLOCATION, '
      '   :CD_CARRIER)')
    DeleteSQL.Strings = (
      'delete from TBID'
      'where'
      '  CONTRACT_ID = :OLD_CONTRACT_ID and'
      '  CARRIER = :OLD_CARRIER and'
      '  COMMODITY = :OLD_COMMODITY and'
      '  AREA = :OLD_AREA and'
      '  UNIQUE_IDENTIFIER = :OLD_UNIQUE_IDENTIFIER and'
      '  ORIGIN_SERVICE = :OLD_ORIGIN_SERVICE and'
      '  DESTINATION_SERVICE = :OLD_DESTINATION_SERVICE and'
      '  CD_ORIG_COUNTRY = :OLD_CD_ORIG_COUNTRY and'
      '  ORIG_COUNTRY = :OLD_ORIG_COUNTRY and'
      '  CD_DEST_COUNTRY = :OLD_CD_DEST_COUNTRY and'
      '  DEST_COUNTRY = :OLD_DEST_COUNTRY and'
      '  CD_ORIGIN_CITY = :OLD_CD_ORIGIN_CITY and'
      '  ORIGIN_CITY = :OLD_ORIGIN_CITY and'
      '  CD_DEST_CITY = :OLD_CD_DEST_CITY and'
      '  DEST_CITY = :OLD_DEST_CITY and'
      '  CD_PORT_LOAD = :OLD_CD_PORT_LOAD and'
      '  PORT_LOAD = :OLD_PORT_LOAD and'
      '  CD_PORT_DISCHARGE = :OLD_CD_PORT_DISCHARGE and'
      '  PORT_DISCHARGE = :OLD_PORT_DISCHARGE and'
      '  CD_EQUIPMENT = :OLD_CD_EQUIPMENT and'
      '  EQUIPMENT = :OLD_EQUIPMENT and'
      '  TOTAL_PRICE = :OLD_TOTAL_PRICE and'
      '  PRICE_CURRENCY = :OLD_PRICE_CURRENCY and'
      '  BASE_RATE = :OLD_BASE_RATE and'
      '  BASE_RATE_CURRENCY = :OLD_BASE_RATE_CURRENCY and'
      '  TRANSIT_TIME = :OLD_TRANSIT_TIME and'
      '  CD_DEST_NEST = :OLD_CD_DEST_NEST and'
      '  DEST_NEST = :OLD_DEST_NEST and'
      '  CD_ORIG_NEST = :OLD_CD_ORIG_NEST and'
      '  ORIG_NEST = :OLD_ORIG_NEST and'
      '  PRODUCT = :OLD_PRODUCT and'
      '  SHIPPING_TERMS = :OLD_SHIPPING_TERMS and'
      '  TRAFFIC_TYPE = :OLD_TRAFFIC_TYPE and'
      '  CARRIER_AWARD = :OLD_CARRIER_AWARD and'
      '  CARRIER_ALLOCATION = :OLD_CARRIER_ALLOCATION')
    Left = 229
    Top = 456
  end
  object qry_Representante: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT EN.CD_EMPRESA, EN.NM_EMPRESA'
      'FROM TCLIENTE_REPRESENTANTE CR'
      
        '   INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = CR.CD_REPRESENT' +
        'ANTE'
      'WHERE CR.CD_CLIENTE = :CD_CLIENTE'
      '  AND CR.CD_UNID_NEG = :CD_UNID_NEG'
      '  AND CR.CD_PRODUTO = :CD_PRODUTO'
      '  AND CR.CD_SERVICO = :CD_SERVICO'
      '  AND EN.CD_EMPRESA = :CD_REPRESENTANTE'
      '  AND ISNULL(EN.IN_REPRESENTANTE, '#39'0'#39') = '#39'1'#39)
    Left = 416
    Top = 468
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
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_REPRESENTANTE'
        ParamType = ptInput
      end>
    object qry_RepresentanteCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_RepresentanteNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
  end
  object qry_LocalEmbarque: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO, CD_UF'
      'FROM TLOCAL_EMBARQUE'
      'WHERE CODIGO = :CODIGO')
    Left = 512
    Top = 468
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object qry_LocalEmbarqueCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CODIGO'
      FixedChar = True
      Size = 4
    end
    object qry_LocalEmbarqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.DESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qry_LocalEmbarqueCD_UF: TStringField
      FieldName = 'CD_UF'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CD_UF'
      FixedChar = True
      Size = 2
    end
  end
end
