object datm_dse: Tdatm_dse
  OldCreateOrder = False
  Left = 192
  Top = 103
  Height = 570
  Width = 698
  object qry_dse: TQuery
    CachedUpdates = True
    AfterOpen = qry_dseAfterOpen
    AfterInsert = qry_dseAfterInsert
    AfterEdit = qry_dseAfterEdit
    AfterPost = qry_dseAfterPost
    AfterCancel = qry_dseAfterCancel
    AfterDelete = qry_dseAfterPost
    AfterScroll = qry_dseAfterOpen
    OnCalcFields = qry_dseCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      '   TDSE'
      'WHERE'
      '   SUBSTRING(NR_PROCESSO,1,2) = :CD_UNID_NEG AND'
      '   SUBSTRING(NR_PROCESSO,3,2) = :CD_PRODUTO   '
      '   '
      '')
    UpdateObject = upd_dse
    Left = 43
    Top = 32
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
    object qry_dseNR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TDSE.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_dseNR_DSE: TStringField
      DisplayLabel = 'Nr. DSE'
      FieldName = 'NR_DSE'
      Origin = 'DBBROKER.TDSE.NR_DSE'
      FixedChar = True
      Size = 12
    end
    object qry_dseCD_EXPORTADOR: TStringField
      DisplayLabel = 'C'#243'd. Exportador'
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TDSE.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_dseCD_URF_DESPACHO: TStringField
      DisplayLabel = 'C'#243'd. URF Despacho'
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'DBBROKER.TDSE.CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qry_dseCD_URF_EMBARQUE: TStringField
      DisplayLabel = 'C'#243'd. URF Embarque'
      FieldName = 'CD_URF_EMBARQUE'
      Origin = 'DBBROKER.TDSE.CD_URF_EMBARQUE'
      FixedChar = True
      Size = 7
    end
    object qry_dseIN_CARGA_ARMAZ: TStringField
      DisplayLabel = 'Carga Sujeita a Armazenamento'
      FieldName = 'IN_CARGA_ARMAZ'
      Origin = 'DBBROKER.TDSE.IN_CARGA_ARMAZ'
      FixedChar = True
      Size = 1
    end
    object qry_dseTP_COURRIER: TStringField
      DisplayLabel = 'Postal/Courrier'
      FieldName = 'TP_COURRIER'
      Origin = 'DBBROKER.TDSE.TP_COURRIER'
      FixedChar = True
      Size = 1
    end
    object qry_dseCD_CNPJ_COURRIER: TStringField
      DisplayLabel = 'CNPJ Courrier'
      FieldName = 'CD_CNPJ_COURRIER'
      Origin = 'DBBROKER.TDSE.CD_CNPJ_COURRIER'
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object qry_dseCD_PAIS_FINAL: TStringField
      DisplayLabel = 'Pa'#237's Destino Final'
      FieldName = 'CD_PAIS_FINAL'
      Origin = 'DBBROKER.TDSE.CD_PAIS_FINAL'
      FixedChar = True
      Size = 3
    end
    object qry_dseCD_IDENT_VEICULO: TStringField
      DisplayLabel = 'Identificador do Ve'#237'culo Transportador'
      FieldName = 'CD_IDENT_VEICULO'
      Origin = 'DBBROKER.TDSE.CD_IDENT_VEICULO'
      FixedChar = True
      Size = 30
    end
    object qry_dseVL_PESO_BRUTO: TFloatField
      DisplayLabel = 'Total Peso Bruto'
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'DBBROKER.TDSE.VL_PESO_BRUTO'
      EditFormat = '#0.00000'
    end
    object qry_dseCD_MOEDA: TStringField
      DisplayLabel = 'C'#243'd. Moeda'
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TDSE.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_dseVL_TOTAL_MOEDA: TFloatField
      DisplayLabel = 'Valor Total das NCM na Moeda'
      FieldName = 'VL_TOTAL_MOEDA'
      Origin = 'DBBROKER.TDSE.VL_TOTAL_MOEDA'
      EditFormat = '#0.00000'
    end
    object qry_dseDT_ABERTURA_DSE: TDateTimeField
      DisplayLabel = 'Data de Abertura DSE'
      FieldName = 'DT_ABERTURA_DSE'
      Origin = 'DBBROKER.TDSE.DT_ABERTURA_DSE'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_dseDT_REGISTRO_DSE: TDateTimeField
      DisplayLabel = 'Data Registro DSE'
      FieldName = 'DT_REGISTRO_DSE'
      Origin = 'DBBROKER.TDSE.DT_REGISTRO_DSE'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_dseLK_NM_EXPORTADOR: TStringField
      DisplayLabel = 'Exportador'
      FieldKind = fkCalculated
      FieldName = 'LK_NM_EXPORTADOR'
      Size = 100
      Calculated = True
    end
    object qry_dseLK_TP_EXPORTADOR: TStringField
      DisplayLabel = 'Tipo Exp'
      FieldKind = fkCalculated
      FieldName = 'LK_TP_EXPORTADOR'
      Size = 100
      Calculated = True
    end
    object qry_dseLK_NATUREZA: TStringField
      DisplayLabel = 'Natureza'
      FieldKind = fkCalculated
      FieldName = 'LK_NATUREZA'
      Size = 100
      Calculated = True
    end
    object qry_dseLK_URF_DESPACHO: TStringField
      DisplayLabel = 'URF Despacho'
      FieldKind = fkCalculated
      FieldName = 'LK_URF_DESPACHO'
      Size = 100
      Calculated = True
    end
    object qry_dseLK_URF_EMBARQUE: TStringField
      DisplayLabel = 'URF Embarque'
      FieldKind = fkCalculated
      FieldName = 'LK_URF_EMBARQUE'
      Size = 100
      Calculated = True
    end
    object qry_dseLK_PAIS: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldKind = fkCalculated
      FieldName = 'LK_PAIS'
      Size = 100
      Calculated = True
    end
    object qry_dseLK_VIA_TRANSPORTE: TStringField
      DisplayLabel = 'Via Transp.'
      FieldKind = fkCalculated
      FieldName = 'LK_VIA_TRANSPORTE'
      Size = 100
      Calculated = True
    end
    object qry_dseLK_MOEDA: TStringField
      DisplayLabel = 'Moeda'
      FieldKind = fkCalculated
      FieldName = 'LK_MOEDA'
      Size = 100
      Calculated = True
    end
    object qry_dseLK_AP_MOEDA: TStringField
      DisplayLabel = 'Moeda'
      FieldKind = fkCalculated
      FieldName = 'LK_AP_MOEDA'
      Size = 5
      Calculated = True
    end
    object qry_dseCNPJ_EXPORTADOR: TStringField
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'CNPJ_EXPORTADOR'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
      Calculated = True
    end
    object qry_dseCALC_NR_PROCESSO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NR_PROCESSO'
      Calculated = True
    end
    object qry_dseTP_EXPORTADOR: TStringField
      FieldName = 'TP_EXPORTADOR'
      FixedChar = True
      Size = 2
    end
    object qry_dseCD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_dseNR_DIE: TStringField
      FieldName = 'NR_DIE'
      FixedChar = True
    end
    object qry_dseNR_DSIE: TStringField
      FieldName = 'NR_DSIE'
      FixedChar = True
      Size = 50
    end
    object qry_dseDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object qry_dseNR_DI: TStringField
      FieldName = 'NR_DI'
      FixedChar = True
    end
    object qry_dseDT_EMISSAO_DI: TDateTimeField
      FieldName = 'DT_EMISSAO_DI'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_dseNR_DSI: TStringField
      FieldName = 'NR_DSI'
      FixedChar = True
    end
    object qry_dseCD_UL_EMISSAO_DI: TStringField
      FieldName = 'CD_UL_EMISSAO_DI'
      FixedChar = True
      Size = 7
    end
    object qry_dseCD_UL_EMISSAO_DSI: TStringField
      FieldName = 'CD_UL_EMISSAO_DSI'
      FixedChar = True
      Size = 7
    end
    object qry_dseDT_EMISSAO_DSI: TDateTimeField
      FieldName = 'DT_EMISSAO_DSI'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_dseVL_QTD_TOTAL: TFloatField
      FieldName = 'VL_QTD_TOTAL'
      EditFormat = '#0.00000'
    end
    object qry_dseSTR_RECINTO: TStringField
      FieldName = 'STR_RECINTO'
      FixedChar = True
      Size = 30
    end
    object qry_dseSTR_SETOR: TStringField
      FieldName = 'STR_SETOR'
      FixedChar = True
      Size = 30
    end
    object qry_dseIN_OUTROS_DOC: TStringField
      FieldName = 'IN_OUTROS_DOC'
      FixedChar = True
      Size = 1
    end
    object qry_dseIN_INF_PRES_CARGA: TStringField
      FieldName = 'IN_INF_PRES_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_dseSTR_USUARIO: TStringField
      FieldName = 'STR_USUARIO'
      FixedChar = True
      Size = 30
    end
    object qry_dseTX_DOC_INSTRUTIVOS: TMemoField
      FieldName = 'TX_DOC_INSTRUTIVOS'
      BlobType = ftMemo
    end
    object qry_dseTX_INF_COMPLEMENTARES: TMemoField
      FieldName = 'TX_INF_COMPLEMENTARES'
      BlobType = ftMemo
    end
    object qry_dseTX_SITUACAO_DSE: TMemoField
      FieldName = 'TX_SITUACAO_DSE'
      BlobType = ftMemo
    end
    object qry_dseLK_UL_DI: TStringField
      FieldKind = fkCalculated
      FieldName = 'LK_UL_DI'
      Size = 120
      Calculated = True
    end
    object qry_dseLK_UL_DSI: TStringField
      FieldKind = fkCalculated
      FieldName = 'LK_UL_DSI'
      Size = 120
      Calculated = True
    end
    object qry_dseCD_NATUREZA: TStringField
      FieldName = 'CD_NATUREZA'
      FixedChar = True
      Size = 2
    end
    object qry_dseCALC_SITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_SITUACAO'
      Size = 60
      Calculated = True
    end
  end
  object ds_dse: TDataSource
    DataSet = qry_dse
    OnStateChange = ds_dseStateChange
    OnDataChange = ds_dseDataChange
    Left = 136
    Top = 32
  end
  object upd_dse: TUpdateSQL
    ModifySQL.Strings = (
      'update TDSE'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_DSE = :NR_DSE,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  TP_EXPORTADOR = :TP_EXPORTADOR,'
      '  CD_NATUREZA = :CD_NATUREZA,'
      '  CD_URF_DESPACHO = :CD_URF_DESPACHO,'
      '  CD_URF_EMBARQUE = :CD_URF_EMBARQUE,'
      '  IN_CARGA_ARMAZ = :IN_CARGA_ARMAZ,'
      '  TP_COURRIER = :TP_COURRIER,'
      '  CD_CNPJ_COURRIER = :CD_CNPJ_COURRIER,'
      '  CD_PAIS_FINAL = :CD_PAIS_FINAL,'
      '  CD_VIA_TRANSPORTE = :CD_VIA_TRANSPORTE,'
      '  CD_IDENT_VEICULO = :CD_IDENT_VEICULO,'
      '  VL_PESO_BRUTO = :VL_PESO_BRUTO,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  VL_TOTAL_MOEDA = :VL_TOTAL_MOEDA,'
      '  DT_ABERTURA_DSE = :DT_ABERTURA_DSE,'
      '  DT_REGISTRO_DSE = :DT_REGISTRO_DSE,'
      '  NR_DIE = :NR_DIE,'
      '  NR_DSIE = :NR_DSIE,'
      '  DIAS = :DIAS,'
      '  NR_DI = :NR_DI,'
      '  CD_UL_EMISSAO_DI = :CD_UL_EMISSAO_DI,'
      '  DT_EMISSAO_DI = :DT_EMISSAO_DI,'
      '  NR_DSI = :NR_DSI,'
      '  CD_UL_EMISSAO_DSI = :CD_UL_EMISSAO_DSI,'
      '  DT_EMISSAO_DSI = :DT_EMISSAO_DSI,'
      '  VL_QTD_TOTAL = :VL_QTD_TOTAL,'
      '  STR_RECINTO = :STR_RECINTO,'
      '  STR_SETOR = :STR_SETOR,'
      '  IN_OUTROS_DOC = :IN_OUTROS_DOC,'
      '  IN_INF_PRES_CARGA = :IN_INF_PRES_CARGA,'
      '  STR_USUARIO = :STR_USUARIO,'
      '  TX_DOC_INSTRUTIVOS = :TX_DOC_INSTRUTIVOS,'
      '  TX_INF_COMPLEMENTARES = :TX_INF_COMPLEMENTARES,'
      '  TX_SITUACAO_DSE = :TX_SITUACAO_DSE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TDSE'
      
        '  (NR_PROCESSO, NR_DSE, CD_EXPORTADOR, TP_EXPORTADOR, CD_NATUREZ' +
        'A, CD_URF_DESPACHO, '
      
        '   CD_URF_EMBARQUE, IN_CARGA_ARMAZ, TP_COURRIER, CD_CNPJ_COURRIE' +
        'R, CD_PAIS_FINAL, '
      
        '   CD_VIA_TRANSPORTE, CD_IDENT_VEICULO, VL_PESO_BRUTO, CD_MOEDA,' +
        ' VL_TOTAL_MOEDA, '
      
        '   DT_ABERTURA_DSE, DT_REGISTRO_DSE, NR_DIE, NR_DSIE, DIAS, NR_D' +
        'I, CD_UL_EMISSAO_DI, '
      
        '   DT_EMISSAO_DI, NR_DSI, CD_UL_EMISSAO_DSI, DT_EMISSAO_DSI, VL_' +
        'QTD_TOTAL, '
      
        '   STR_RECINTO, STR_SETOR, IN_OUTROS_DOC, IN_INF_PRES_CARGA, STR' +
        '_USUARIO, '
      '   TX_DOC_INSTRUTIVOS, TX_INF_COMPLEMENTARES, TX_SITUACAO_DSE)'
      'values'
      
        '  (:NR_PROCESSO, :NR_DSE, :CD_EXPORTADOR, :TP_EXPORTADOR, :CD_NA' +
        'TUREZA, '
      
        '   :CD_URF_DESPACHO, :CD_URF_EMBARQUE, :IN_CARGA_ARMAZ, :TP_COUR' +
        'RIER, :CD_CNPJ_COURRIER, '
      
        '   :CD_PAIS_FINAL, :CD_VIA_TRANSPORTE, :CD_IDENT_VEICULO, :VL_PE' +
        'SO_BRUTO, '
      
        '   :CD_MOEDA, :VL_TOTAL_MOEDA, :DT_ABERTURA_DSE, :DT_REGISTRO_DS' +
        'E, :NR_DIE, '
      
        '   :NR_DSIE, :DIAS, :NR_DI, :CD_UL_EMISSAO_DI, :DT_EMISSAO_DI, :' +
        'NR_DSI, '
      
        '   :CD_UL_EMISSAO_DSI, :DT_EMISSAO_DSI, :VL_QTD_TOTAL, :STR_RECI' +
        'NTO, :STR_SETOR, '
      
        '   :IN_OUTROS_DOC, :IN_INF_PRES_CARGA, :STR_USUARIO, :TX_DOC_INS' +
        'TRUTIVOS, '
      '   :TX_INF_COMPLEMENTARES, :TX_SITUACAO_DSE)')
    DeleteSQL.Strings = (
      'delete from TDSE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 232
    Top = 32
  end
  object qry_dse_item: TQuery
    CachedUpdates = True
    AfterInsert = qry_dse_itemAfterInsert
    AfterEdit = qry_dse_itemAfterEdit
    AfterPost = qry_dse_itemAfterPost
    AfterDelete = qry_dse_itemAfterPost
    AfterScroll = qry_dse_itemAfterScroll
    OnCalcFields = qry_dse_itemCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      
        '  (SELECT COUNT(I.ID_ITEM)   FROM TDSE_ITEM I WHERE I.NR_PROCESS' +
        'O = :NR_PROCESSO) AS '#39'MAXIMO'#39' ,'
      
        '  (SELECT MIN(I.ID_ITEM)-1 FROM TDSE_ITEM I WHERE I.NR_PROCESSO ' +
        '= :NR_PROCESSO) AS '#39'MINIMO'#39' ,'
      
        '  (SELECT SUM(VL_TOTAL_ITEM)       FROM TDSE_ITEM I WHERE I.NR_P' +
        'ROCESSO = :NR_PROCESSO) AS '#39'VL_TOTAL_ACUMULADO'#39','
      
        '  (SELECT SUM(VL_PESO_LIQUIDO)     FROM TDSE_ITEM I WHERE I.NR_P' +
        'ROCESSO = :NR_PROCESSO) AS '#39'VL_PESO_ACUMULADO'#39','
      '  *'
      'FROM'
      '  TDSE_ITEM'
      'WHERE'
      '  NR_PROCESSO = :NR_PROCESSO'
      ' '
      ' ')
    UpdateObject = upd_dse_item
    Left = 43
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_dse_itemID_ITEM: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ID_ITEM'
      Origin = 'DBBROKER.TDSE_ITEM.ID_ITEM'
    end
    object qry_dse_itemNR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TDSE_ITEM.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_dse_itemCD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'DBBROKER.TDSE_ITEM.CD_NCM'
      FixedChar = True
      Size = 11
    end
    object qry_dse_itemCD_DESTAQUE_NCM: TStringField
      FieldName = 'CD_DESTAQUE_NCM'
      Origin = 'DBBROKER.TDSE_ITEM.CD_DESTAQUE_NCM'
      FixedChar = True
      Size = 3
    end
    object qry_dse_itemQT_UNID_MED_ESTATISTICA: TFloatField
      DisplayLabel = 'Qtd. Uni. Med.'
      FieldName = 'QT_UNID_MED_ESTATISTICA'
      Origin = 'DBBROKER.TDSE_ITEM.QT_UNID_MED_ESTATISTICA'
      EditFormat = '#0.000000'
    end
    object qry_dse_itemCD_UNID_MED_COMERCIALIZADA: TStringField
      FieldName = 'CD_UNID_MED_COMERCIALIZADA'
      Origin = 'DBBROKER.TDSE_ITEM.CD_UNID_MED_COMERCIALIZADA'
      FixedChar = True
      Size = 3
    end
    object qry_dse_itemVL_PESO_LIQUIDO: TFloatField
      DisplayLabel = 'Peso L'#237'q.'
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'DBBROKER.TDSE_ITEM.VL_PESO_LIQUIDO'
      EditFormat = '#0.000000'
    end
    object qry_dse_itemVL_TOTAL_ITEM: TFloatField
      DisplayLabel = 'Vl. Total Item'
      FieldName = 'VL_TOTAL_ITEM'
      Origin = 'DBBROKER.TDSE_ITEM.VL_TOTAL_ITEM'
      EditFormat = '#0.000000'
    end
    object qry_dse_itemTX_DESC_MERCADORIA_L1: TStringField
      DisplayLabel = 'Desc. Linha 1'
      FieldName = 'TX_DESC_MERCADORIA_L1'
      Origin = 'DBBROKER.TDSE_ITEM.TX_DESC_MERCADORIA_L1'
      FixedChar = True
      Size = 80
    end
    object qry_dse_itemTX_DESC_MERCADORIA_L2: TStringField
      DisplayLabel = 'Desc. Linha 2'
      FieldName = 'TX_DESC_MERCADORIA_L2'
      Origin = 'DBBROKER.TDSE_ITEM.TX_DESC_MERCADORIA_L2'
      FixedChar = True
      Size = 80
    end
    object qry_dse_itemTX_DESC_MERCADORIA_L3: TStringField
      DisplayLabel = 'Desc. Linha 3'
      FieldName = 'TX_DESC_MERCADORIA_L3'
      Origin = 'DBBROKER.TDSE_ITEM.TX_DESC_MERCADORIA_L3'
      FixedChar = True
      Size = 80
    end
    object qry_dse_itemLK_CD_NCM: TStringField
      DisplayLabel = 'NCM'
      FieldKind = fkCalculated
      FieldName = 'LK_CD_NCM'
      Size = 100
      Calculated = True
    end
    object qry_dse_itemLK_UNIDADE_MEDIDA: TStringField
      DisplayLabel = 'Unid. Medida'
      FieldKind = fkCalculated
      FieldName = 'LK_UNIDADE_MEDIDA'
      Size = 100
      Calculated = True
    end
    object qry_dse_itemCALC_VL_ACUMULADO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_VL_ACUMULADO'
      Calculated = True
    end
    object qry_dse_itemCALC_PESO_ACUMULADO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_PESO_ACUMULADO'
      Calculated = True
    end
    object qry_dse_itemITEM_DE_TOTAL: TStringField
      FieldKind = fkCalculated
      FieldName = 'ITEM_DE_TOTAL'
      Size = 15
      Calculated = True
    end
    object qry_dse_itemCALC_NR_PROCESSO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NR_PROCESSO'
      Calculated = True
    end
    object qry_dse_itemMAXIMO: TIntegerField
      FieldName = 'MAXIMO'
    end
    object qry_dse_itemMINIMO: TIntegerField
      FieldName = 'MINIMO'
    end
    object qry_dse_itemCALC_NR_ATUAL: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NR_ATUAL'
      Size = 10
      Calculated = True
    end
    object qry_dse_itemVL_TOTAL_ACUMULADO: TFloatField
      FieldName = 'VL_TOTAL_ACUMULADO'
      EditFormat = '#0.000000'
    end
    object qry_dse_itemVL_PESO_ACUMULADO: TFloatField
      FieldName = 'VL_PESO_ACUMULADO'
      EditFormat = '#0.000000'
    end
    object qry_dse_itemQT_COMERCIALIZADA: TFloatField
      FieldName = 'QT_COMERCIALIZADA'
      EditFormat = '#0.000000'
    end
  end
  object ds_dse_item: TDataSource
    DataSet = qry_dse_item
    OnStateChange = ds_dse_itemStateChange
    Left = 136
    Top = 160
  end
  object upd_dse_item: TUpdateSQL
    ModifySQL.Strings = (
      'update TDSE_ITEM'
      'set'
      '  ID_ITEM = :ID_ITEM,'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_NCM = :CD_NCM,'
      '  CD_DESTAQUE_NCM = :CD_DESTAQUE_NCM,'
      '  CD_UNID_MED_COMERCIALIZADA = :CD_UNID_MED_COMERCIALIZADA,'
      '  QT_UNID_MED_ESTATISTICA = :QT_UNID_MED_ESTATISTICA,'
      '  QT_COMERCIALIZADA = :QT_COMERCIALIZADA,'
      '  VL_PESO_LIQUIDO = :VL_PESO_LIQUIDO,'
      '  VL_TOTAL_ITEM = :VL_TOTAL_ITEM,'
      '  TX_DESC_MERCADORIA_L1 = :TX_DESC_MERCADORIA_L1,'
      '  TX_DESC_MERCADORIA_L2 = :TX_DESC_MERCADORIA_L2,'
      '  TX_DESC_MERCADORIA_L3 = :TX_DESC_MERCADORIA_L3'
      'where'
      '  ID_ITEM = :OLD_ID_ITEM and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TDSE_ITEM'
      
        '  (ID_ITEM, NR_PROCESSO, CD_NCM, CD_DESTAQUE_NCM, CD_UNID_MED_CO' +
        'MERCIALIZADA, '
      
        '   QT_UNID_MED_ESTATISTICA, QT_COMERCIALIZADA, VL_PESO_LIQUIDO, ' +
        'VL_TOTAL_ITEM, '
      
        '   TX_DESC_MERCADORIA_L1, TX_DESC_MERCADORIA_L2, TX_DESC_MERCADO' +
        'RIA_L3)'
      'values'
      
        '  (:ID_ITEM, :NR_PROCESSO, :CD_NCM, :CD_DESTAQUE_NCM, :CD_UNID_M' +
        'ED_COMERCIALIZADA, '
      
        '   :QT_UNID_MED_ESTATISTICA, :QT_COMERCIALIZADA, :VL_PESO_LIQUID' +
        'O, :VL_TOTAL_ITEM, '
      
        '   :TX_DESC_MERCADORIA_L1, :TX_DESC_MERCADORIA_L2, :TX_DESC_MERC' +
        'ADORIA_L3)')
    DeleteSQL.Strings = (
      'delete from TDSE_ITEM'
      'where'
      '  ID_ITEM = :OLD_ID_ITEM and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 232
    Top = 160
  end
  object qry_tp_exp: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  DESCRICAO'
      'FROM'
      '  TTP_EXPORTADOR')
    Left = 43
    Top = 288
    object qry_tp_expCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTP_EXPORTADOR.CODIGO'
      FixedChar = True
      Size = 2
    end
    object qry_tp_expDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TTP_EXPORTADOR.DESCRICAO'
      FixedChar = True
      Size = 50
    end
  end
  object ds_tp_exp: TDataSource
    DataSet = qry_tp_exp
    Left = 136
    Top = 288
  end
  object qry_tp_natureza: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      '   CODIGO, '
      '   DESCRICAO '
      'FROM '
      '   TTP_NATUREZA_OPERACAO')
    Left = 43
    Top = 224
    object qry_tp_naturezaCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTP_NATUREZA_OPERACAO.CODIGO'
      FixedChar = True
      Size = 2
    end
    object qry_tp_naturezaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TTP_NATUREZA_OPERACAO.DESCRICAO'
      FixedChar = True
      Size = 50
    end
  end
  object ds_tp_natureza: TDataSource
    DataSet = qry_tp_natureza
    Left = 136
    Top = 224
  end
  object sp_exclui_dse: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exclui_dse'
    Left = 136
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object sp_inclui_dse: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_inclui_dse'
    Left = 40
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object ByHLLAPI: TByHLLAPI
    HLLAPIKind = hkUndefined
    IPAddress = '127.0.0.1'
    IPPort = 4321
    TimeOut = 60000
    Left = 136
    Top = 423
  end
  object qry_trans_DSE: TQuery
    OnCalcFields = qry_trans_DSECalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '   TDSE'
      'WHERE'
      '   NR_PROCESSO = :NR_PROCESSO'
      ''
      ''
      ' ')
    Left = 40
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_trans_DSENR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TDSE.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_trans_DSENR_DSE: TStringField
      FieldName = 'NR_DSE'
      Origin = 'DBBROKER.TDSE.NR_DSE'
      FixedChar = True
      Size = 12
    end
    object qry_trans_DSECD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TDSE.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_trans_DSETP_EXPORTADOR: TStringField
      FieldName = 'TP_EXPORTADOR'
      Origin = 'DBBROKER.TDSE.TP_EXPORTADOR'
      FixedChar = True
      Size = 2
    end
    object qry_trans_DSECD_NATUREZA: TStringField
      FieldName = 'CD_NATUREZA'
      Origin = 'DBBROKER.TDSE.CD_NATUREZA'
      FixedChar = True
      Size = 1
    end
    object qry_trans_DSECD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'DBBROKER.TDSE.CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qry_trans_DSECD_URF_EMBARQUE: TStringField
      FieldName = 'CD_URF_EMBARQUE'
      Origin = 'DBBROKER.TDSE.CD_URF_EMBARQUE'
      FixedChar = True
      Size = 7
    end
    object qry_trans_DSEIN_CARGA_ARMAZ: TStringField
      FieldName = 'IN_CARGA_ARMAZ'
      Origin = 'DBBROKER.TDSE.IN_CARGA_ARMAZ'
      FixedChar = True
      Size = 1
    end
    object qry_trans_DSETP_COURRIER: TStringField
      FieldName = 'TP_COURRIER'
      Origin = 'DBBROKER.TDSE.TP_COURRIER'
      FixedChar = True
      Size = 1
    end
    object qry_trans_DSECD_CNPJ_COURRIER: TStringField
      FieldName = 'CD_CNPJ_COURRIER'
      Origin = 'DBBROKER.TDSE.CD_CNPJ_COURRIER'
      FixedChar = True
      Size = 14
    end
    object qry_trans_DSECD_PAIS_FINAL: TStringField
      FieldName = 'CD_PAIS_FINAL'
      Origin = 'DBBROKER.TDSE.CD_PAIS_FINAL'
      FixedChar = True
      Size = 3
    end
    object qry_trans_DSECD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'DBBROKER.TDSE.CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_trans_DSECD_IDENT_VEICULO: TStringField
      FieldName = 'CD_IDENT_VEICULO'
      Origin = 'DBBROKER.TDSE.CD_IDENT_VEICULO'
      FixedChar = True
      Size = 30
    end
    object qry_trans_DSEVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'DBBROKER.TDSE.VL_PESO_BRUTO'
    end
    object qry_trans_DSECD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TDSE.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_trans_DSEVL_TOTAL_MOEDA: TFloatField
      FieldName = 'VL_TOTAL_MOEDA'
      Origin = 'DBBROKER.TDSE.VL_TOTAL_MOEDA'
    end
    object qry_trans_DSEDT_ABERTURA_DSE: TDateTimeField
      FieldName = 'DT_ABERTURA_DSE'
      Origin = 'DBBROKER.TDSE.DT_ABERTURA_DSE'
    end
    object qry_trans_DSEDT_REGISTRO_DSE: TDateTimeField
      FieldName = 'DT_REGISTRO_DSE'
      Origin = 'DBBROKER.TDSE.DT_REGISTRO_DSE'
    end
    object qry_trans_DSECALC_CNPJ_EXP: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_CNPJ_EXP'
      Size = 30
      Calculated = True
    end
    object qry_trans_DSENR_DIE: TStringField
      FieldName = 'NR_DIE'
      Origin = 'DBBROKER.TDSE.NR_DIE'
      FixedChar = True
    end
    object qry_trans_DSENR_DSIE: TStringField
      FieldName = 'NR_DSIE'
      Origin = 'DBBROKER.TDSE.NR_DSIE'
      FixedChar = True
      Size = 50
    end
    object qry_trans_DSEDIAS: TIntegerField
      FieldName = 'DIAS'
      Origin = 'DBBROKER.TDSE.DIAS'
    end
    object qry_trans_DSENR_DI: TStringField
      FieldName = 'NR_DI'
      Origin = 'DBBROKER.TDSE.NR_DI'
      FixedChar = True
    end
    object qry_trans_DSECD_UL_EMISSAO_DI: TStringField
      FieldName = 'CD_UL_EMISSAO_DI'
      Origin = 'DBBROKER.TDSE.CD_UL_EMISSAO_DI'
      FixedChar = True
      Size = 7
    end
    object qry_trans_DSEDT_EMISSAO_DI: TDateTimeField
      FieldName = 'DT_EMISSAO_DI'
      Origin = 'DBBROKER.TDSE.DT_EMISSAO_DI'
    end
    object qry_trans_DSENR_DSI: TStringField
      FieldName = 'NR_DSI'
      Origin = 'DBBROKER.TDSE.NR_DSI'
      FixedChar = True
    end
    object qry_trans_DSECD_UL_EMISSAO_DSI: TStringField
      FieldName = 'CD_UL_EMISSAO_DSI'
      Origin = 'DBBROKER.TDSE.CD_UL_EMISSAO_DSI'
      FixedChar = True
      Size = 7
    end
    object qry_trans_DSEDT_EMISSAO_DSI: TDateTimeField
      FieldName = 'DT_EMISSAO_DSI'
      Origin = 'DBBROKER.TDSE.DT_EMISSAO_DSI'
    end
    object qry_trans_DSEVL_QTD_TOTAL: TFloatField
      FieldName = 'VL_QTD_TOTAL'
      Origin = 'DBBROKER.TDSE.VL_QTD_TOTAL'
    end
    object qry_trans_DSESTR_RECINTO: TStringField
      FieldName = 'STR_RECINTO'
      Origin = 'DBBROKER.TDSE.STR_RECINTO'
      FixedChar = True
      Size = 30
    end
    object qry_trans_DSESTR_SETOR: TStringField
      FieldName = 'STR_SETOR'
      Origin = 'DBBROKER.TDSE.STR_SETOR'
      FixedChar = True
      Size = 30
    end
    object qry_trans_DSEIN_OUTROS_DOC: TStringField
      FieldName = 'IN_OUTROS_DOC'
      Origin = 'DBBROKER.TDSE.IN_OUTROS_DOC'
      FixedChar = True
      Size = 1
    end
    object qry_trans_DSEIN_INF_PRES_CARGA: TStringField
      FieldName = 'IN_INF_PRES_CARGA'
      Origin = 'DBBROKER.TDSE.IN_INF_PRES_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_trans_DSESTR_USUARIO: TStringField
      FieldName = 'STR_USUARIO'
      Origin = 'DBBROKER.TDSE.STR_USUARIO'
      FixedChar = True
      Size = 30
    end
    object qry_trans_DSETX_DOC_INSTRUTIVOS: TMemoField
      FieldName = 'TX_DOC_INSTRUTIVOS'
      Origin = 'DBBROKER.TDSE.TX_DOC_INSTRUTIVOS'
      BlobType = ftMemo
    end
    object qry_trans_DSETX_INF_COMPLEMENTARES: TMemoField
      FieldName = 'TX_INF_COMPLEMENTARES'
      Origin = 'DBBROKER.TDSE.TX_INF_COMPLEMENTARES'
      BlobType = ftMemo
    end
    object qry_trans_DSETX_SITUACAO_DSE: TMemoField
      FieldName = 'TX_SITUACAO_DSE'
      Origin = 'DBBROKER.TDSE.TX_SITUACAO_DSE'
      BlobType = ftMemo
    end
  end
  object qry_dse_volume: TQuery
    CachedUpdates = True
    AfterInsert = qry_dse_volumeAfterInsert
    AfterPost = qry_dse_volumeAfterDelete
    AfterDelete = qry_dse_volumeAfterDelete
    OnCalcFields = qry_dse_volumeCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TDSE_VOLUMES WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = upd_dse_volume
    Left = 43
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_dse_volumeNR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TDSE_VOLUMES.NR_PROCESSO'
      FixedChar = True
    end
    object qry_dse_volumeNR_SEQUENCIA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'NR_SEQUENCIA'
      Origin = 'DBBROKER.TDSE_VOLUMES.NR_SEQUENCIA'
    end
    object qry_dse_volumeCD_ESPECIE: TStringField
      DisplayLabel = 'C'#243'd. Esp'#233'cie'
      FieldName = 'CD_ESPECIE'
      Origin = 'DBBROKER.TDSE_VOLUMES.CD_ESPECIE'
      FixedChar = True
      Size = 2
    end
    object qry_dse_volumeVL_QUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'VL_QUANTIDADE'
      Origin = 'DBBROKER.TDSE_VOLUMES.VL_QUANTIDADE'
      EditFormat = '#0.000000'
    end
    object qry_dse_volumeTX_MARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'TX_MARCA'
      Origin = 'DBBROKER.TDSE_VOLUMES.TX_MARCA'
      FixedChar = True
      Size = 60
    end
    object qry_dse_volumeCALC_NM_ESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldKind = fkCalculated
      FieldName = 'CALC_NM_ESPECIE'
      Size = 120
      Calculated = True
    end
  end
  object ds_dse_volume: TDataSource
    DataSet = qry_dse_volume
    OnStateChange = ds_dse_itemStateChange
    Left = 136
    Top = 96
  end
  object upd_dse_volume: TUpdateSQL
    ModifySQL.Strings = (
      'update TDSE_VOLUMES'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_SEQUENCIA = :NR_SEQUENCIA,'
      '  CD_ESPECIE = :CD_ESPECIE,'
      '  VL_QUANTIDADE = :VL_QUANTIDADE,'
      '  TX_MARCA = :TX_MARCA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA')
    InsertSQL.Strings = (
      'insert into TDSE_VOLUMES'
      
        '  (NR_PROCESSO, NR_SEQUENCIA, CD_ESPECIE, VL_QUANTIDADE, TX_MARC' +
        'A)'
      'values'
      
        '  (:NR_PROCESSO, :NR_SEQUENCIA, :CD_ESPECIE, :VL_QUANTIDADE, :TX' +
        '_MARCA)')
    DeleteSQL.Strings = (
      'delete from TDSE_VOLUMES'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA')
    Left = 232
    Top = 96
  end
  object sp_atualiza_dse: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atualiza_dse'
    Left = 232
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@NR_DSE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@DT_REGISTRO'
        ParamType = ptInput
      end>
  end
end
