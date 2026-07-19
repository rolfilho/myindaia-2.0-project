object datm_ag: Tdatm_ag
  OldCreateOrder = True
  Left = 266
  Top = 157
  Height = 413
  Width = 382
  object ds_ag: TDataSource
    DataSet = qry_ag_
    Left = 100
    Top = 77
  end
  object qry_ag_: TQuery
    CachedUpdates = True
    AfterPost = qry_ag_AfterPost
    AfterDelete = qry_ag_AfterDelete
    AfterScroll = qry_ag_AfterScroll
    OnCalcFields = qry_ag_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      
        '  TA.CD_AGENTE, TA.NM_AGENTE, TA.TP_AG, TA.END_UF, TA.CD_MOEDA_C' +
        'ONTA_1, TA.CD_MOEDA_CONTA_2, TA.NR_CONTA_1,'
      
        '  TA.IN_ATIVO, TA.NR_CGC_AGENTE, TA.NM_AGENTE_REDUZIDO,TL.DESCRI' +
        'CAO, TL.CD_SIGLA, TA.NR_CONTA_2, TA.ST_ROUTING_INF,'
      
        '  TA.NR_SIGLA, TA.DS_ENDERECO, TA.CD_CIDADE, TA.NR_ZIP_CODE, TPA' +
        '.NM_PAIS, TA.DS_HOMEPAGE, TA.DS_PROFIT,TA.NR_CONTA_4,'
      
        '  TA.NR_IATA, TA.NR_FONE, TA.NR_FAX, TA.NM_BANCO_INTERN,  TA.DS_' +
        'TIPO_AGENTE,  TA.CD_MOEDA_CONTA_3, TA.CD_MOEDA_CONTA_4,'
      
        '  (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = ' +
        'TA.CD_MOEDA_CONTA_1) MOEDA_CONTA_1,TA.NR_CONTA_3,'
      
        '  (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = ' +
        'TA.CD_MOEDA_CONTA_2) MOEDA_CONTA_2, TA.ST_ROUTING_INF_2,'
      
        '  (SELECT TB.NM_BANCO FROM TBCO_ITL TB WHERE TB.CD_BANCO = TA.CD' +
        '_BCO) NM_BCO_ITL, TA.NR_PRAZO_PAGTO, TA.ST_SWIFT_1, TA.ST_SWIFT_' +
        '2,'
      
        '  TA.CD_PAIS,TA.TX_OBX, TA.CD_BCO , CD_BCO_2, (SELECT TB.NM_BANC' +
        'O FROM TBCO_ITL TB WHERE TB.CD_BANCO = TA.CD_BCO_2) NM_BCO_ITL_2' +
        ','
      
        '  (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = ' +
        'TA.CD_MOEDA_CONTA_3) MOEDA_CONTA_3,'
      
        '  (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = ' +
        'TA.CD_MOEDA_CONTA_4) MOEDA_CONTA_4, DS_SCAC_CODE'
      ''
      
        'FROM TAGENTE TA  LEFT JOIN TLOCAL_EMBARQUE TL ON (TL.CODIGO = TA' +
        '.CD_CIDADE)'
      ''
      
        '  LEFT JOIN TPAIS_BROKER TPA ON(TPA.CD_PAIS = TA.CD_PAIS) WHERE ' +
        'TP_AG = :TP_AG  ORDER BY'
      '   TA.NM_AGENTE'
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
      ' ')
    UpdateObject = upd_qry_ag_
    Left = 99
    Top = 21
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'TP_AG'
        ParamType = ptUnknown
      end>
    object qry_ag_CD_AGENTE: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_AGENTE'
      Origin = 'TAGENTE.CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_ag_NM_AGENTE: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_AGENTE'
      Origin = 'TAGENTE.NM_AGENTE'
      Size = 60
    end
    object qry_ag_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TAGENTE.IN_ATIVO'
      Size = 1
    end
    object qry_ag_NR_CGC_AGENTE: TStringField
      FieldName = 'NR_CGC_AGENTE'
      Origin = 'TAGENTE.CD_AGENTE'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_ag_NM_AGENTE_REDUZIDO: TStringField
      FieldName = 'NM_AGENTE_REDUZIDO'
      Origin = 'DBBROKER.TAGENTE.NM_AGENTE_REDUZIDO'
      FixedChar = True
      Size = 30
    end
    object qry_ag_NR_SIGLA: TStringField
      FieldName = 'NR_SIGLA'
      Origin = 'DBBROKER.TAGENTE.NR_SIGLA'
      FixedChar = True
      Size = 8
    end
    object qry_ag_DS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'DBBROKER.TAGENTE.DS_ENDERECO'
      FixedChar = True
      Size = 255
    end
    object qry_ag_NR_ZIP_CODE: TStringField
      FieldName = 'NR_ZIP_CODE'
      Origin = 'DBBROKER.TAGENTE.NR_ZIP_CODE'
      FixedChar = True
      Size = 8
    end
    object qry_ag_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Origin = 'DBBROKER.TAGENTE.NM_PAIS'
      FixedChar = True
      Size = 30
    end
    object qry_ag_NR_FONE: TStringField
      FieldName = 'NR_FONE'
      Origin = 'DBBROKER.TAGENTE.NR_FONE'
      FixedChar = True
    end
    object qry_ag_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      Origin = 'DBBROKER.TAGENTE.NR_FAX'
      FixedChar = True
    end
    object qry_ag_DS_HOMEPAGE: TStringField
      FieldName = 'DS_HOMEPAGE'
      Origin = 'DBBROKER.TAGENTE.DS_HOMEPAGE'
      FixedChar = True
      Size = 60
    end
    object qry_ag_NM_BANCO_INTERN: TStringField
      FieldName = 'NM_BANCO_INTERN'
      Origin = 'DBBROKER.TAGENTE.NM_BANCO_INTERN'
      FixedChar = True
      Size = 30
    end
    object qry_ag_DS_TIPO_AGENTE: TStringField
      FieldName = 'DS_TIPO_AGENTE'
      Origin = 'DBBROKER.TAGENTE.DS_TIPO_AGENTE'
      FixedChar = True
      Size = 1
    end
    object qry_ag_CD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      Origin = 'DBBROKER.TAGENTE.CD_CIDADE'
      FixedChar = True
      Size = 4
    end
    object qry_ag_CD_BCO: TStringField
      FieldName = 'CD_BCO'
      Origin = 'DBBROKER.TAGENTE.CD_BCO'
      FixedChar = True
      Size = 3
    end
    object qry_ag_look_nm_bco: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_bco'
      LookupDataSet = qry_bco_
      LookupKeyFields = 'CD_BCO'
      LookupResultField = 'NM_BCO'
      KeyFields = 'CD_BCO'
      Size = 30
      Lookup = True
    end
    object qry_ag_calc_Ativo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_Ativo'
      Size = 3
      Calculated = True
    end
    object qry_ag_NR_IATA: TStringField
      FieldName = 'NR_IATA'
      EditMask = '99\-9\-9999\-999;1;_'
      FixedChar = True
      Size = 16
    end
    object qry_ag_CD_SIGLA: TStringField
      FieldName = 'CD_SIGLA'
      FixedChar = True
      Size = 3
    end
    object qry_ag_calc_nacionalidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nacionalidade'
      Size = 15
      Calculated = True
    end
    object qry_ag_TP_AG: TStringField
      FieldName = 'TP_AG'
      FixedChar = True
      Size = 1
    end
    object qry_ag_DS_PROFIT: TStringField
      FieldName = 'DS_PROFIT'
      FixedChar = True
      Size = 8
    end
    object qry_ag_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_ag_CD_MOEDA_CONTA_1: TStringField
      FieldName = 'CD_MOEDA_CONTA_1'
      FixedChar = True
      Size = 3
    end
    object qry_ag_CD_MOEDA_CONTA_2: TStringField
      FieldName = 'CD_MOEDA_CONTA_2'
      FixedChar = True
      Size = 3
    end
    object qry_ag_NR_CONTA_1: TStringField
      FieldName = 'NR_CONTA_1'
      FixedChar = True
      Size = 25
    end
    object qry_ag_NR_CONTA_2: TStringField
      FieldName = 'NR_CONTA_2'
      FixedChar = True
      Size = 25
    end
    object qry_ag_ST_ROUTING_INF: TStringField
      FieldName = 'ST_ROUTING_INF'
      FixedChar = True
      Size = 25
    end
    object qry_ag_MOEDA_CONTA_1: TStringField
      FieldName = 'MOEDA_CONTA_1'
      FixedChar = True
      Size = 6
    end
    object qry_ag_MOEDA_CONTA_2: TStringField
      FieldName = 'MOEDA_CONTA_2'
      FixedChar = True
      Size = 6
    end
    object qry_ag_NM_BCO_ITL: TStringField
      FieldName = 'NM_BCO_ITL'
      FixedChar = True
      Size = 50
    end
    object qry_ag_TX_OBX: TStringField
      FieldName = 'TX_OBX'
      FixedChar = True
      Size = 255
    end
    object qry_ag_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qry_ag_NR_CONTA_4: TStringField
      FieldName = 'NR_CONTA_4'
      FixedChar = True
      Size = 25
    end
    object qry_ag_CD_MOEDA_CONTA_3: TStringField
      FieldName = 'CD_MOEDA_CONTA_3'
      FixedChar = True
      Size = 3
    end
    object qry_ag_CD_MOEDA_CONTA_4: TStringField
      FieldName = 'CD_MOEDA_CONTA_4'
      FixedChar = True
      Size = 3
    end
    object qry_ag_NR_CONTA_3: TStringField
      FieldName = 'NR_CONTA_3'
      FixedChar = True
      Size = 25
    end
    object qry_ag_ST_ROUTING_INF_2: TStringField
      FieldName = 'ST_ROUTING_INF_2'
      FixedChar = True
      Size = 25
    end
    object qry_ag_CD_BCO_2: TStringField
      FieldName = 'CD_BCO_2'
      FixedChar = True
      Size = 3
    end
    object qry_ag_NM_BCO_ITL_2: TStringField
      FieldName = 'NM_BCO_ITL_2'
      FixedChar = True
      Size = 50
    end
    object qry_ag_MOEDA_CONTA_3: TStringField
      FieldName = 'MOEDA_CONTA_3'
      FixedChar = True
      Size = 6
    end
    object qry_ag_MOEDA_CONTA_4: TStringField
      FieldName = 'MOEDA_CONTA_4'
      FixedChar = True
      Size = 6
    end
    object qry_ag_NR_PRAZO_PAGTO: TStringField
      FieldName = 'NR_PRAZO_PAGTO'
      FixedChar = True
      Size = 3
    end
    object qry_ag_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_ag_ST_SWIFT_1: TStringField
      FieldName = 'ST_SWIFT_1'
      FixedChar = True
      Size = 50
    end
    object qry_ag_ST_SWIFT_2: TStringField
      FieldName = 'ST_SWIFT_2'
      FixedChar = True
      Size = 50
    end
    object qry_ag_DS_SCAC_CODE: TStringField
      FieldName = 'DS_SCAC_CODE'
      FixedChar = True
      Size = 4
    end
  end
  object qry_ult_ag_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(A.CD_AGENTE) ULTIMO'
      'FROM  TAGENTE A')
    Left = 168
    Top = 84
    object qry_ult_ag_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TAGENTE.CD_AGENTE'
      Size = 4
    end
  end
  object ds_ag_tx: TDataSource
    DataSet = qry_ag_tx_
    Left = 280
    Top = 85
  end
  object qry_ag_tx_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TAGENTE_TAXA ORDER BY'
      'NM_TAXA')
    Left = 280
    Top = 20
    object qry_ag_tx_CD_TAXA: TStringField
      FieldName = 'CD_TAXA'
      Origin = 'TAGENTE_TAXA.CD_TAXA'
      Size = 4
    end
    object qry_ag_tx_NM_TAXA: TStringField
      FieldName = 'NM_TAXA'
      Origin = 'TAGENTE_TAXA.NM_TAXA'
      Size = 30
    end
    object qry_ag_tx_VL_CPTZ_CNTR_20: TFloatField
      FieldName = 'VL_CPTZ_CNTR_20'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_CNTR_20'
    end
    object qry_ag_tx_VL_CPTZ_CNTR_40: TFloatField
      FieldName = 'VL_CPTZ_CNTR_40'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_CNTR_40'
    end
    object qry_ag_tx_VL_CPTZ_C_SOLTA: TFloatField
      FieldName = 'VL_CPTZ_C_SOLTA'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_C_SOLTA'
    end
    object qry_ag_tx_VL_CPTZ_MINIMA: TFloatField
      FieldName = 'VL_CPTZ_MINIMA'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_MINIMA'
    end
    object qry_ag_tx_VL_LIBERACAO_BL: TFloatField
      FieldName = 'VL_LIBERACAO_BL'
      Origin = 'TAGENTE_TAXA.VL_LIBERACAO_BL'
    end
    object qry_ag_tx_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TAGENTE_TAXA.IN_ATIVO'
      Size = 1
    end
  end
  object upd_qry_ag_: TUpdateSQL
    ModifySQL.Strings = (
      'update TAGENTE'
      'set'
      '  CD_AGENTE = :CD_AGENTE,'
      '  NM_AGENTE = :NM_AGENTE,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  NR_CGC_AGENTE = :NR_CGC_AGENTE,'
      '  NM_AGENTE_REDUZIDO = :NM_AGENTE_REDUZIDO,'
      '  NR_SIGLA = :NR_SIGLA,'
      '  DS_ENDERECO = :DS_ENDERECO,'
      '  CD_CIDADE = :CD_CIDADE,'
      '  NR_ZIP_CODE = :NR_ZIP_CODE,'
      '  NR_IATA = :NR_IATA,'
      '  NR_FONE = :NR_FONE,'
      '  NR_FAX = :NR_FAX,'
      '  DS_HOMEPAGE = :DS_HOMEPAGE,'
      '  DS_PROFIT = :DS_PROFIT,'
      '  NR_PRAZO_PAGTO = :NR_PRAZO_PAGTO,'
      '  NM_BANCO_INTERN = :NM_BANCO_INTERN,'
      '  DS_TIPO_AGENTE = :DS_TIPO_AGENTE,'
      '  CD_PAIS = :CD_PAIS,'
      '  CD_BCO = :CD_BCO,'
      '  TP_AG = :TP_AG,'
      '  END_UF = :END_UF,'
      '  CD_MOEDA_CONTA_1 = :CD_MOEDA_CONTA_1,'
      '  CD_MOEDA_CONTA_2 = :CD_MOEDA_CONTA_2,'
      '  NR_CONTA_1 = :NR_CONTA_1,'
      '  NR_CONTA_2 = :NR_CONTA_2,'
      '  ST_ROUTING_INF = :ST_ROUTING_INF,'
      '  TX_OBX = :TX_OBX,'
      '  CD_BCO_2 = :CD_BCO_2,'
      '  CD_MOEDA_CONTA_3 = :CD_MOEDA_CONTA_3,'
      '  CD_MOEDA_CONTA_4 = :CD_MOEDA_CONTA_4,'
      '  NR_CONTA_3 = :NR_CONTA_3,'
      '  NR_CONTA_4 = :NR_CONTA_4,'
      '  ST_ROUTING_INF_2 = :ST_ROUTING_INF_2,'
      '  ST_SWIFT_1 = :ST_SWIFT_1,'
      '  ST_SWIFT_2 = :ST_SWIFT_2,'
      '  DS_SCAC_CODE = :DS_SCAC_CODE'
      'where'
      '  CD_AGENTE = :OLD_CD_AGENTE')
    InsertSQL.Strings = (
      'insert into TAGENTE'
      
        '  (CD_AGENTE, NM_AGENTE, IN_ATIVO, NR_CGC_AGENTE, NM_AGENTE_REDU' +
        'ZIDO, NR_SIGLA, '
      
        '   DS_ENDERECO, CD_CIDADE, NR_ZIP_CODE, NR_IATA, NR_FONE, NR_FAX' +
        ', DS_HOMEPAGE, '
      
        '   DS_PROFIT, NR_PRAZO_PAGTO, NM_BANCO_INTERN, DS_TIPO_AGENTE, C' +
        'D_PAIS, '
      
        '   CD_BCO, TP_AG, END_UF, CD_MOEDA_CONTA_1, CD_MOEDA_CONTA_2, NR' +
        '_CONTA_1, '
      
        '   NR_CONTA_2, ST_ROUTING_INF, TX_OBX, CD_BCO_2, CD_MOEDA_CONTA_' +
        '3, CD_MOEDA_CONTA_4, '
      
        '   NR_CONTA_3, NR_CONTA_4, ST_ROUTING_INF_2, ST_SWIFT_1, ST_SWIF' +
        'T_2, DS_SCAC_CODE)'
      'values'
      
        '  (:CD_AGENTE, :NM_AGENTE, :IN_ATIVO, :NR_CGC_AGENTE, :NM_AGENTE' +
        '_REDUZIDO, '
      
        '   :NR_SIGLA, :DS_ENDERECO, :CD_CIDADE, :NR_ZIP_CODE, :NR_IATA, ' +
        ':NR_FONE, '
      
        '   :NR_FAX, :DS_HOMEPAGE, :DS_PROFIT, :NR_PRAZO_PAGTO, :NM_BANCO' +
        '_INTERN, '
      
        '   :DS_TIPO_AGENTE, :CD_PAIS, :CD_BCO, :TP_AG, :END_UF, :CD_MOED' +
        'A_CONTA_1, '
      
        '   :CD_MOEDA_CONTA_2, :NR_CONTA_1, :NR_CONTA_2, :ST_ROUTING_INF,' +
        ' :TX_OBX, '
      
        '   :CD_BCO_2, :CD_MOEDA_CONTA_3, :CD_MOEDA_CONTA_4, :NR_CONTA_3,' +
        ' :NR_CONTA_4, '
      '   :ST_ROUTING_INF_2, :ST_SWIFT_1, :ST_SWIFT_2, :DS_SCAC_CODE)')
    DeleteSQL.Strings = (
      'delete from TAGENTE'
      'where'
      '  CD_AGENTE = :OLD_CD_AGENTE')
    Left = 176
    Top = 24
  end
  object qry_local_embarque_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TLOCAL_EMBARQUE')
    Left = 272
    Top = 156
    object qry_local_embarque_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CODIGO'
      FixedChar = True
      Size = 4
    end
    object qry_local_embarque_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.DESCRICAO'
      FixedChar = True
      Size = 50
    end
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PAIS, NM_PAIS'
      'FROM TPAIS_BROKER')
    Left = 272
    Top = 216
    object qry_pais_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_pais_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS'
      FixedChar = True
      Size = 120
    end
  end
  object qry_bco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TBCO')
    Left = 272
    Top = 272
    object qry_bco_CD_BCO: TStringField
      FieldName = 'CD_BCO'
      Origin = 'DBBROKER.TBCO.CD_BCO'
      FixedChar = True
      Size = 3
    end
    object qry_bco_NM_BCO: TStringField
      FieldName = 'NM_BCO'
      Origin = 'DBBROKER.TBCO.NM_BCO'
      FixedChar = True
      Size = 50
    end
  end
  object qry_agente_taxa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TAXA, NM_TAXA'
      'FROM TAGENTE_TAXA')
    Left = 24
    Top = 21
    object qry_agente_taxa_CD_TAXA: TStringField
      FieldName = 'CD_TAXA'
      Origin = 'DBBROKER.TAGENTE_TAXA.CD_TAXA'
      FixedChar = True
      Size = 4
    end
    object qry_agente_taxa_NM_TAXA: TStringField
      FieldName = 'NM_TAXA'
      Origin = 'DBBROKER.TAGENTE_TAXA.NM_TAXA'
      FixedChar = True
      Size = 30
    end
  end
  object ds_contato: TDataSource
    DataSet = qry_contato_
    Left = 16
    Top = 256
  end
  object qry_contato_: TQuery
    CachedUpdates = True
    BeforePost = qry_contato_BeforePost
    AfterPost = qry_contato_AfterPost
    AfterDelete = qry_contato_AfterDelete
    OnNewRecord = qry_contato_NewRecord
    DatabaseName = 'DBBROKER'
    DataSource = ds_ag
    SQL.Strings = (
      'SELECT *'
      '   FROM TCONTATO_AG '
      '     WHERE CD_AGENTE =:CD_AGENTE')
    UpdateMode = upWhereChanged
    UpdateObject = upd_contato
    Left = 96
    Top = 256
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_AGENTE'
        ParamType = ptUnknown
      end>
    object qry_contato_CD_CONTATO: TStringField
      FieldName = 'CD_CONTATO'
      Origin = 'DBBROKER.TCONTATO_AG.CD_CONTATO'
      FixedChar = True
      Size = 4
    end
    object qry_contato_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'DBBROKER.TCONTATO_AG.CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_contato_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'DBBROKER.TCONTATO_AG.NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_contato_NR_FONE_CONTATO: TStringField
      FieldName = 'NR_FONE_CONTATO'
      Origin = 'DBBROKER.TCONTATO_AG.NR_FONE_CONTATO'
      FixedChar = True
    end
    object qry_contato_DS_EMAIL_CONTATO: TStringField
      FieldName = 'DS_EMAIL_CONTATO'
      Origin = 'DBBROKER.TCONTATO_AG.DS_EMAIL_CONTATO'
      FixedChar = True
      Size = 40
    end
    object qry_contato_DS_CARGO_CONTATO: TStringField
      FieldName = 'DS_CARGO_CONTATO'
      Origin = 'DBBROKER.TCONTATO_AG.DS_CARGO_CONTATO'
      FixedChar = True
    end
    object qry_contato_DS_DEPTO_CONTATO: TStringField
      FieldName = 'DS_DEPTO_CONTATO'
      Origin = 'DBBROKER.TCONTATO_AG.DS_DEPTO_CONTATO'
      FixedChar = True
    end
  end
  object upd_contato: TUpdateSQL
    ModifySQL.Strings = (
      'update TCONTATO_AG'
      'set'
      '  CD_AGENTE = :CD_AGENTE,'
      '  CD_CONTATO = :CD_CONTATO,'
      '  NM_CONTATO = :NM_CONTATO,'
      '  NR_FONE_CONTATO = :NR_FONE_CONTATO,'
      '  DS_EMAIL_CONTATO = :DS_EMAIL_CONTATO,'
      '  DS_CARGO_CONTATO = :DS_CARGO_CONTATO,'
      '  DS_DEPTO_CONTATO = :DS_DEPTO_CONTATO'
      'where'
      '  CD_AGENTE = :OLD_CD_AGENTE and'
      '  CD_CONTATO = :OLD_CD_CONTATO')
    InsertSQL.Strings = (
      'insert into TCONTATO_AG'
      '  (CD_AGENTE, CD_CONTATO, NM_CONTATO, NR_FONE_CONTATO, '
      'DS_EMAIL_CONTATO, '
      '   DS_CARGO_CONTATO, DS_DEPTO_CONTATO)'
      'values'
      '  (:CD_AGENTE, :CD_CONTATO, :NM_CONTATO, :NR_FONE_CONTATO, '
      ':DS_EMAIL_CONTATO, '
      '   :DS_CARGO_CONTATO, :DS_DEPTO_CONTATO)')
    DeleteSQL.Strings = (
      'delete from TCONTATO_AG'
      'where'
      '  CD_AGENTE = :OLD_CD_AGENTE and'
      '  CD_CONTATO = :OLD_CD_CONTATO')
    Left = 176
    Top = 256
  end
  object qry_ult_contato_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(A.CD_CONTATO) ULTIMO'
      'FROM  TCONTATO_AG A')
    Left = 48
    Top = 160
    object qry_ult_contato_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TCONTATO_AG.CD_CONTATO'
      FixedChar = True
      Size = 4
    end
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 144
    Top = 160
  end
end
