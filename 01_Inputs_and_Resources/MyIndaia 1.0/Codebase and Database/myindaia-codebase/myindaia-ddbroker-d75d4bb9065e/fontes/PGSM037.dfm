object datm_evento: Tdatm_evento
  OldCreateOrder = True
  Left = 383
  Top = 125
  Height = 463
  Width = 336
  object ds_evento: TDataSource
    DataSet = qry_evento_
    Left = 32
    Top = 16
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 128
    Top = 80
  end
  object qry_etapa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ETAPA, NM_ETAPA'
      'FROM TETAPA')
    Left = 128
    Top = 204
    object qry_etapa_CD_ETAPA: TStringField
      FieldName = 'CD_ETAPA'
      Origin = 'TETAPA.CD_ETAPA'
      Size = 3
    end
    object qry_etapa_NM_ETAPA: TStringField
      FieldName = 'NM_ETAPA'
      Origin = 'TETAPA.NM_ETAPA'
      Size = 50
    end
  end
  object tbl_responsavel_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TRESPONSAVEL'
    Left = 128
    Top = 140
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 32
    Top = 80
  end
  object ds_responsavel: TDataSource
    DataSet = tbl_responsavel_
    Left = 32
    Top = 140
  end
  object qry_ult_evento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_EVENTO) AS ULTIMO'
      'FROM TEVENTO')
    Left = 32
    Top = 204
    object qry_ult_evento_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 3
    end
  end
  object qry_evento_: TQuery
    CachedUpdates = True
    AfterInsert = qry_evento_AfterInsert
    AfterPost = qry_evento_AfterPost
    AfterScroll = qry_evento_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT E.*, R.NM_RESPONSAVEL'
      
        'FROM TEVENTO E INNER JOIN TRESPONSAVEL R ON R.CD_RESPONSAVEL = E' +
        '.CD_RESPONSAVEL'
      'ORDER BY NM_EVENTO')
    UpdateObject = upd_evento
    Left = 128
    Top = 17
    object qry_evento_CD_EVENTO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EVENTO'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 3
    end
    object qry_evento_NM_EVENTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_EVENTO'
      Origin = 'TEVENTO.NM_EVENTO'
      Size = 50
    end
    object qry_evento_IN_INSPECIONAVEL: TStringField
      DisplayLabel = 'Inspec.'
      FieldName = 'IN_INSPECIONAVEL'
      Origin = 'TEVENTO.IN_INSPECIONAVEL'
      Size = 1
    end
    object qry_evento_PRZ_INSPECAO: TSmallintField
      DisplayLabel = 'Prazo'
      FieldName = 'PRZ_INSPECAO'
      Origin = 'TEVENTO.PRZ_INSPECAO'
    end
    object qry_evento_CD_RESPONSAVEL: TStringField
      FieldName = 'CD_RESPONSAVEL'
      Origin = 'TEVENTO.CD_RESPONSAVEL'
      Size = 1
    end
    object qry_evento_CD_ETAPA: TStringField
      FieldName = 'CD_ETAPA'
      Origin = 'TEVENTO.CD_ETAPA'
      Size = 3
    end
    object qry_evento_IN_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IN_ATIVO'
      Origin = 'TEVENTO.CD_ETAPA'
      Size = 1
    end
    object qry_evento_Look_Inspecionavel: TStringField
      DisplayLabel = 'Inspec.'
      FieldKind = fkLookup
      FieldName = 'Look_Inspecionavel'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_INSPECIONAVEL'
      Size = 3
      Lookup = True
    end
    object qry_evento_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_evento_AP_EVENTO: TStringField
      FieldName = 'AP_EVENTO'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 15
    end
    object qry_evento_AP_EVENTO_ESPANHOL: TStringField
      FieldName = 'AP_EVENTO_ESPANHOL'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 15
    end
    object qry_evento_AP_EVENTO_INGLES: TStringField
      FieldName = 'AP_EVENTO_INGLES'
      Origin = 'TEVENTO.NM_EVENTO'
      Size = 15
    end
    object qry_evento_CD_PREST_SERV: TStringField
      FieldName = 'CD_PREST_SERV'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 2
    end
    object qry_evento_LookPrestServ: TStringField
      FieldKind = fkLookup
      FieldName = 'LookPrestServ'
      LookupDataSet = qry_ttp_prest_serv_
      LookupKeyFields = 'CD_PREST_SERV'
      LookupResultField = 'NM_PREST_SERV'
      KeyFields = 'CD_PREST_SERV'
      Size = 2
      Lookup = True
    end
    object qry_evento_NM_INGLES: TStringField
      FieldName = 'NM_INGLES'
      Origin = 'DBBROKER.TEVENTO.NM_INGLES'
      FixedChar = True
      Size = 50
    end
    object qry_evento_NM_ESPANHOL: TStringField
      FieldName = 'NM_ESPANHOL'
      Origin = 'DBBROKER.TEVENTO.NM_ESPANHOL'
      FixedChar = True
      Size = 50
    end
    object qry_evento_PRZ_INSPECAO2: TSmallintField
      FieldName = 'PRZ_INSPECAO2'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO2'
    end
    object qry_evento_PRZ_INSPECAO3: TSmallintField
      FieldName = 'PRZ_INSPECAO3'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO3'
    end
    object qry_evento_IN_INSPECIONAVEL_IMP: TStringField
      FieldName = 'IN_INSPECIONAVEL_IMP'
      Origin = 'DBBROKER.TEVENTO.IN_INSPECIONAVEL_IMP'
      FixedChar = True
      Size = 1
    end
    object qry_evento_PRZ_INSPECAO1_IMP: TSmallintField
      FieldName = 'PRZ_INSPECAO1_IMP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO1_IMP'
    end
    object qry_evento_PRZ_INSPECAO2_IMP: TSmallintField
      FieldName = 'PRZ_INSPECAO2_IMP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO2_IMP'
    end
    object qry_evento_PRZ_INSPECAO3_IMP: TSmallintField
      FieldName = 'PRZ_INSPECAO3_IMP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO3_IMP'
    end
    object qry_evento_look_inspecionavel_imp: TStringField
      FieldKind = fkLookup
      FieldName = 'look_inspecionavel_imp'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_INSPECIONAVEL_IMP'
      Size = 3
      Lookup = True
    end
    object qry_evento_IN_INSPECIONAVEL_GP: TStringField
      FieldName = 'IN_INSPECIONAVEL_GP'
      Origin = 'DBBROKER.TEVENTO.IN_INSPECIONAVEL_GP'
      FixedChar = True
      Size = 1
    end
    object qry_evento_PRZ_INSPECAO1_GP: TSmallintField
      FieldName = 'PRZ_INSPECAO1_GP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO1_GP'
    end
    object qry_evento_PRZ_INSPECAO2_GP: TSmallintField
      FieldName = 'PRZ_INSPECAO2_GP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO2_GP'
    end
    object qry_evento_PRZ_INSPECAO3_GP: TSmallintField
      FieldName = 'PRZ_INSPECAO3_GP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO3_GP'
    end
    object qry_evento_IN_MOSTRAR_WEB_IMP: TStringField
      FieldName = 'IN_MOSTRAR_WEB_IMP'
      Origin = 'DBBROKER.TEVENTO.IN_MOSTRAR_WEB_IMP'
      FixedChar = True
      Size = 1
    end
    object qry_evento_IN_MOSTRAR_WEB_EXP: TStringField
      FieldName = 'IN_MOSTRAR_WEB_EXP'
      Origin = 'DBBROKER.TEVENTO.IN_MOSTRAR_WEB_EXP'
      FixedChar = True
      Size = 1
    end
    object qry_evento_IN_MOSTRAR_WEB_IMP_FILTRO: TStringField
      FieldName = 'IN_MOSTRAR_WEB_IMP_FILTRO'
      Origin = 'DBBROKER.TEVENTO.IN_MOSTRAR_WEB_IMP_FILTRO'
      FixedChar = True
      Size = 1
    end
    object qry_evento_IN_MOSTRAR_WEB_EXP_FILTRO: TStringField
      FieldName = 'IN_MOSTRAR_WEB_EXP_FILTRO'
      Origin = 'DBBROKER.TEVENTO.IN_MOSTRAR_WEB_EXP_FILTRO'
      FixedChar = True
      Size = 1
    end
    object qry_evento_IN_ACEITA_DESVIOS: TStringField
      FieldName = 'IN_ACEITA_DESVIOS'
      Origin = 'DBBROKER.TEVENTO.IN_ACEITA_DESVIOS'
      FixedChar = True
      Size = 1
    end
    object qry_evento_IN_INSPECIONAVEL_FI_IMP: TStringField
      FieldName = 'IN_INSPECIONAVEL_FI_IMP'
      Origin = 'DBBROKER.TEVENTO.IN_INSPECIONAVEL_FI_IMP'
      FixedChar = True
      Size = 1
    end
    object qry_evento_PRZ_INSPECAO1_FI_IMP: TSmallintField
      FieldName = 'PRZ_INSPECAO1_FI_IMP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO1_FI_IMP'
    end
    object qry_evento_PRZ_INSPECAO2_FI_IMP: TSmallintField
      FieldName = 'PRZ_INSPECAO2_FI_IMP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO2_FI_IMP'
    end
    object qry_evento_PRZ_INSPECAO3_FI_IMP: TSmallintField
      FieldName = 'PRZ_INSPECAO3_FI_IMP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO3_FI_IMP'
    end
    object qry_evento_IN_INSPECIONAVEL_FI_EXP: TStringField
      FieldName = 'IN_INSPECIONAVEL_FI_EXP'
      Origin = 'DBBROKER.TEVENTO.IN_INSPECIONAVEL_FI_EXP'
      FixedChar = True
      Size = 1
    end
    object qry_evento_PRZ_INSPECAO1_FI_EXP: TSmallintField
      FieldName = 'PRZ_INSPECAO1_FI_EXP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO1_FI_EXP'
    end
    object qry_evento_PRZ_INSPECAO2_FI_EXP: TSmallintField
      FieldName = 'PRZ_INSPECAO2_FI_EXP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO2_FI_EXP'
    end
    object qry_evento_PRZ_INSPECAO3_FI_EXP: TSmallintField
      FieldName = 'PRZ_INSPECAO3_FI_EXP'
      Origin = 'DBBROKER.TEVENTO.PRZ_INSPECAO3_FI_EXP'
    end
    object qry_evento_NM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Origin = 'DBBROKER.TRESPONSAVEL.NM_RESPONSAVEL'
      FixedChar = True
      Size = 15
    end
    object qry_evento_IN_OBS_AUT: TStringField
      FieldName = 'IN_OBS_AUT'
      Origin = 'DBBROKER.TEVENTO.IN_OBS_AUT'
      FixedChar = True
      Size = 1
    end
    object qry_evento_NM_OBS_AUT: TStringField
      FieldName = 'NM_OBS_AUT'
      Origin = 'DBBROKER.TEVENTO.NM_OBS_AUT'
      FixedChar = True
      Size = 255
    end
  end
  object qry_ttp_prest_serv_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PREST_SERV, NM_PREST_SERV'
      'FROM    TTP_PREST_SERV')
    Left = 129
    Top = 267
  end
  object ds_ttp_prest_serv: TDataSource
    DataSet = qry_ttp_prest_serv_
    Left = 30
    Top = 268
  end
  object upd_evento: TUpdateSQL
    ModifySQL.Strings = (
      'update TEVENTO'
      'set'
      '  NM_EVENTO = :NM_EVENTO,'
      '  NM_INGLES = :NM_INGLES,'
      '  NM_ESPANHOL = :NM_ESPANHOL,'
      '  IN_INSPECIONAVEL = :IN_INSPECIONAVEL,'
      '  PRZ_INSPECAO = :PRZ_INSPECAO,'
      '  CD_RESPONSAVEL = :CD_RESPONSAVEL,'
      '  CD_ETAPA = :CD_ETAPA,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  AP_EVENTO = :AP_EVENTO,'
      '  AP_EVENTO_ESPANHOL = :AP_EVENTO_ESPANHOL,'
      '  AP_EVENTO_INGLES = :AP_EVENTO_INGLES,'
      '  CD_PREST_SERV = :CD_PREST_SERV,'
      '  PRZ_INSPECAO2 = :PRZ_INSPECAO2,'
      '  PRZ_INSPECAO3 = :PRZ_INSPECAO3,'
      '  IN_INSPECIONAVEL_IMP = :IN_INSPECIONAVEL_IMP,'
      '  PRZ_INSPECAO1_IMP = :PRZ_INSPECAO1_IMP,'
      '  PRZ_INSPECAO2_IMP = :PRZ_INSPECAO2_IMP,'
      '  PRZ_INSPECAO3_IMP = :PRZ_INSPECAO3_IMP,'
      '  IN_INSPECIONAVEL_GP = :IN_INSPECIONAVEL_GP,'
      '  PRZ_INSPECAO1_GP = :PRZ_INSPECAO1_GP,'
      '  PRZ_INSPECAO2_GP = :PRZ_INSPECAO2_GP,'
      '  PRZ_INSPECAO3_GP = :PRZ_INSPECAO3_GP,'
      '  IN_MOSTRAR_WEB_IMP = :IN_MOSTRAR_WEB_IMP,'
      '  IN_MOSTRAR_WEB_EXP = :IN_MOSTRAR_WEB_EXP,'
      '  IN_MOSTRAR_WEB_IMP_FILTRO = :IN_MOSTRAR_WEB_IMP_FILTRO,'
      '  IN_MOSTRAR_WEB_EXP_FILTRO = :IN_MOSTRAR_WEB_EXP_FILTRO,'
      '  IN_ACEITA_DESVIOS = :IN_ACEITA_DESVIOS,'
      '  IN_INSPECIONAVEL_FI_IMP = :IN_INSPECIONAVEL_FI_IMP,'
      '  PRZ_INSPECAO1_FI_IMP = :PRZ_INSPECAO1_FI_IMP,'
      '  PRZ_INSPECAO2_FI_IMP = :PRZ_INSPECAO2_FI_IMP,'
      '  PRZ_INSPECAO3_FI_IMP = :PRZ_INSPECAO3_FI_IMP,'
      '  IN_INSPECIONAVEL_FI_EXP = :IN_INSPECIONAVEL_FI_EXP,'
      '  PRZ_INSPECAO1_FI_EXP = :PRZ_INSPECAO1_FI_EXP,'
      '  PRZ_INSPECAO2_FI_EXP = :PRZ_INSPECAO2_FI_EXP,'
      '  PRZ_INSPECAO3_FI_EXP = :PRZ_INSPECAO3_FI_EXP,'
      '  IN_OBS_AUT = :IN_OBS_AUT,'
      '  NM_OBS_AUT = :NM_OBS_AUT'
      'where'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    InsertSQL.Strings = (
      'insert into TEVENTO'
      '  (CD_EVENTO, NM_EVENTO, NM_INGLES, NM_ESPANHOL, '
      'IN_INSPECIONAVEL, PRZ_INSPECAO, '
      '   CD_RESPONSAVEL, CD_ETAPA, IN_ATIVO, AP_EVENTO, '
      'AP_EVENTO_ESPANHOL, AP_EVENTO_INGLES,'
      '   CD_PREST_SERV, PRZ_INSPECAO2, PRZ_INSPECAO3, '
      'IN_INSPECIONAVEL_IMP, PRZ_INSPECAO1_IMP, '
      '   PRZ_INSPECAO2_IMP, PRZ_INSPECAO3_IMP, IN_INSPECIONAVEL_GP, '
      'PRZ_INSPECAO1_GP, '
      '   PRZ_INSPECAO2_GP, PRZ_INSPECAO3_GP, IN_MOSTRAR_WEB_IMP, '
      'IN_MOSTRAR_WEB_EXP, '
      '   IN_MOSTRAR_WEB_IMP_FILTRO, IN_MOSTRAR_WEB_EXP_FILTRO, '
      'IN_ACEITA_DESVIOS, '
      '   IN_INSPECIONAVEL_FI_IMP, PRZ_INSPECAO1_FI_IMP, '
      'PRZ_INSPECAO2_FI_IMP, '
      '   PRZ_INSPECAO3_FI_IMP, IN_INSPECIONAVEL_FI_EXP, '
      'PRZ_INSPECAO1_FI_EXP, '
      '   PRZ_INSPECAO2_FI_EXP,'
      'PRZ_INSPECAO3_FI_EXP, IN_OBS_AUT, NM_OBS_AUT  )'
      'values'
      '  (:CD_EVENTO, :NM_EVENTO, :NM_INGLES, :NM_ESPANHOL,'
      ':IN_INSPECIONAVEL,'
      
        '   :PRZ_INSPECAO, :CD_RESPONSAVEL, :CD_ETAPA, :IN_ATIVO, :AP_EVE' +
        'NTO,'
      ':AP_EVENTO_ESPANHOL,'
      '   :AP_EVENTO_INGLES, :CD_PREST_SERV, :PRZ_INSPECAO2,'
      ':PRZ_INSPECAO3, :IN_INSPECIONAVEL_IMP,'
      '   :PRZ_INSPECAO1_IMP, :PRZ_INSPECAO2_IMP, :PRZ_INSPECAO3_IMP,'
      ':IN_INSPECIONAVEL_GP,'
      '   :PRZ_INSPECAO1_GP, :PRZ_INSPECAO2_GP, :PRZ_INSPECAO3_GP,'
      ':IN_MOSTRAR_WEB_IMP,'
      '   :IN_MOSTRAR_WEB_EXP, :IN_MOSTRAR_WEB_IMP_FILTRO,'
      ':IN_MOSTRAR_WEB_EXP_FILTRO,'
      
        '   :IN_ACEITA_DESVIOS, :IN_INSPECIONAVEL_FI_IMP, :PRZ_INSPECAO1_' +
        'FI_IMP,'
      '   :PRZ_INSPECAO2_FI_IMP, :PRZ_INSPECAO3_FI_IMP,'
      ':IN_INSPECIONAVEL_FI_EXP,'
      '   :PRZ_INSPECAO1_FI_EXP, :PRZ_INSPECAO2_FI_EXP,'
      ':PRZ_INSPECAO3_FI_EXP, :IN_OBS_AUT, :NM_OBS_AUT )')
    DeleteSQL.Strings = (
      'delete from TEVENTO'
      'where'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    Left = 200
    Top = 16
  end
end
