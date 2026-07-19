object datm_servico: Tdatm_servico
  OldCreateOrder = True
  Left = 248
  Top = 176
  Height = 331
  Width = 647
  object ds_servico: TDataSource
    DataSet = qry_servico_
    Left = 31
    Top = 17
  end
  object qry_ult_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_SERVICO) AS ULTIMO'
      'FROM TSERVICO')
    Left = 338
    Top = 17
    object qry_ult_servico_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 130
    Top = 73
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
    object tbl_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Required = True
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 31
    Top = 73
  end
  object ds_classif: TDataSource
    DataSet = qry_classif_
    Left = 224
    Top = 17
  end
  object qry_classif_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TSERVICO_CLASSIFICACAO'
      'ORDER BY'
      'CD_CLASSIFICACAO')
    Left = 338
    Top = 73
    object qry_classif_CD_CLASSIFICACAO: TStringField
      FieldName = 'CD_CLASSIFICACAO'
      Origin = 'TSERVICO_CLASSIFICACAO.CD_CLASSIFICACAO'
      Size = 2
    end
    object qry_classif_NM_CLASSIFICACAO: TStringField
      FieldName = 'NM_CLASSIFICACAO'
      Origin = 'TSERVICO_CLASSIFICACAO.NM_CLASSIFICACAO'
    end
  end
  object ds_via_transp: TDataSource
    DataSet = qry_via_transp_
    Left = 31
    Top = 180
  end
  object qry_via_transp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TVIA_TRANSP_BROKER (NOLOCK)'
      'ORDER BY'
      'CD_VIA_TRANSP')
    Left = 130
    Top = 180
    object qry_via_transp_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSP'
      Size = 2
    end
    object qry_via_transp_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSP'
    end
  end
  object ds_servico_evento: TDataSource
    DataSet = qry_servico_evento_
    Left = 31
    Top = 129
  end
  object qry_servico_evento_: TQuery
    CachedUpdates = True
    AfterPost = qry_servico_evento_AfterPost
    AfterDelete = qry_servico_evento_AfterDelete
    AfterScroll = qry_servico_evento_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TSERVICO_EVENTO'
      'WHERE CD_SERVICO = :CD_SERVICO'
      'ORDER BY NR_ORDEM')
    UpdateObject = upd_servico_evento_
    Left = 130
    Top = 129
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_servico_evento_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO_EVENTO.CD_SERVICO'
      Size = 3
    end
    object qry_servico_evento_CD_EVENTO: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_EVENTO'
      Origin = 'TSERVICO_EVENTO.CD_EVENTO'
      Size = 3
    end
    object qry_servico_evento_NR_ORDEM: TFloatField
      DisplayLabel = 'Ordem'
      FieldName = 'NR_ORDEM'
      Origin = 'TSERVICO_EVENTO.NR_ORDEM'
    end
    object qry_servico_evento_CD_EV_BASICO: TStringField
      FieldName = 'CD_EV_BASICO'
      Origin = 'TSERVICO_EVENTO.CD_EV_BASICO'
      Size = 3
    end
    object qry_servico_evento_PZ_DO_EV_BASICO: TFloatField
      DisplayLabel = 'Prazo ap'#243's Evento Base'
      FieldName = 'PZ_DO_EV_BASICO'
      Origin = 'TSERVICO_EVENTO.PZ_DO_EV_BASICO'
    end
    object qry_servico_evento_CD_EV_FUTURO: TStringField
      FieldName = 'CD_EV_FUTURO'
      Origin = 'TSERVICO_EVENTO.CD_EV_FUTURO'
      Size = 3
    end
    object qry_servico_evento_PZ_ATE_EV_FUTURO: TFloatField
      DisplayLabel = 'Prazo at'#233' Evento Futuro'
      FieldName = 'PZ_ATE_EV_FUTURO'
      Origin = 'TSERVICO_EVENTO.PZ_ATE_EV_FUTURO'
    end
    object qry_servico_evento_LookEvento: TStringField
      DisplayLabel = 'Evento'
      FieldKind = fkLookup
      FieldName = 'LookEvento'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO'
      Size = 50
      Lookup = True
    end
    object qry_servico_evento_Look_ev_basico: TStringField
      DisplayLabel = 'Evento Base'
      FieldKind = fkLookup
      FieldName = 'Look_ev_basico'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_BASICO'
      Size = 50
      Lookup = True
    end
    object qry_servico_evento_Look_ev_futuro: TStringField
      DisplayLabel = 'Evento Futuro'
      FieldKind = fkLookup
      FieldName = 'Look_ev_futuro'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_FUTURO'
      Size = 50
      Lookup = True
    end
    object qry_servico_evento_LookServico: TStringField
      FieldKind = fkLookup
      FieldName = 'LookServico'
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
    object qry_servico_evento_CD_TIPO_EVENTO: TStringField
      FieldName = 'CD_TIPO_EVENTO'
      Origin = 'DBBROKER.TSERVICO_EVENTO.CD_TIPO_EVENTO'
      FixedChar = True
      Size = 2
    end
    object qry_servico_evento_IN_DASHBOARD: TBooleanField
      FieldName = 'IN_DASHBOARD'
      Origin = 'DBBROKER.TSERVICO_EVENTO.IN_DASHBOARD'
    end
    object qry_servico_evento_IN_PRAZO_UTIL: TStringField
      FieldName = 'IN_PRAZO_UTIL'
      Origin = 'DBBROKER.TSERVICO_EVENTO.IN_PRAZO_UTIL'
      FixedChar = True
      Size = 1
    end
    object qry_servico_evento_IN_PRAZO_FERIADO: TStringField
      FieldName = 'IN_PRAZO_FERIADO'
      Origin = 'DBBROKER.TSERVICO_EVENTO.IN_PRAZO_FERIADO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_evento: TDataSource
    DataSet = qry_evento_
    Left = 224
    Top = 73
  end
  object qry_evento_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT * FROM TEVENTO (NOLOCK)'
      'ORDER BY '
      'CD_EVENTO')
    Left = 338
    Top = 129
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
  end
  object qry_ult_ordem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_ORDEM) AS ULTIMO'
      'FROM TSERVICO_EVENTO'
      'WHERE CD_SERVICO = :CD_SERVICO')
    Left = 224
    Top = 129
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_ult_ordem_ULTIMO: TFloatField
      FieldName = 'ULTIMO'
      Origin = 'TSERVICO_EVENTO.NR_ORDEM'
    end
  end
  object qry_ev_base_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_ORDEM'
      'FROM TSERVICO_EVENTO'
      'WHERE CD_SERVICO = :CD_SERVICO AND'
      'CD_EVENTO = :CD_EV_BASICO')
    Left = 31
    Top = 234
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EV_BASICO'
        ParamType = ptUnknown
      end>
    object qry_ev_base_NR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = 'TSERVICO_EVENTO.NR_ORDEM'
    end
  end
  object qry_ev_futuro_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_ORDEM'
      'FROM TSERVICO_EVENTO'
      'WHERE CD_SERVICO = :CD_SERVICO AND'
      'CD_EVENTO = :CD_EV_FUTURO')
    Left = 130
    Top = 234
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EV_FUTURO'
        ParamType = ptUnknown
      end>
    object qry_ev_futuro_NR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = 'TSERVICO_EVENTO.NR_ORDEM'
    end
  end
  object sp_ordena_evento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ordena_eventos'
    Left = 338
    Top = 178
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_servico'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_ordem_origem'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_ordem_destino'
        ParamType = ptInput
      end>
  end
  object sp_exclui_servico_evento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exclui_servico_evento'
    Left = 338
    Top = 234
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_servico'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_evento'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@in_consiste'
        ParamType = ptInput
      end>
  end
  object qry_se_conclusor_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_SERVICO, CD_EVENTO '
      'FROM   TSERVICO_EVENTO SE'
      'WHERE  CD_SERVICO = :CD_SERVICO AND'
      '       CD_EVENTO =:CD_EVENTO')
    Left = 431
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EVENTO'
        ParamType = ptUnknown
      end>
  end
  object qry_grupo_servico_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO'
      'FROM TGRUPO_SERVICO (NOLOCK)'
      '')
    Left = 429
    Top = 72
    object qry_grupo_servico_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO_SERVICO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_servico_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO_SERVICO.CD_GRUPO'
      Size = 60
    end
  end
  object qry_ctrl_vencto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_CTRL_VENCTO (NOLOCK)')
    Left = 429
    Top = 136
    object qry_ctrl_vencto_TP_CTRL_VENCTO: TStringField
      FieldName = 'TP_CTRL_VENCTO'
      Origin = 'TTP_CTRL_VENCTO.TP_CTRL_VENCTO'
      Size = 1
    end
    object qry_ctrl_vencto_NM_TP_CTRL_VENCTO: TStringField
      FieldName = 'NM_TP_CTRL_VENCTO'
      Origin = 'TTP_CTRL_VENCTO.NM_TP_CTRL_VENCTO'
    end
  end
  object qry_ttp_tipo_evento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TIPO_EVENTO, NM_TIPO_EVENTO'
      'FROM TTP_TIPO_EVENTO (NOLOCK)')
    Left = 224
    Top = 234
  end
  object ds_ttp_tipo_evento: TDataSource
    DataSet = qry_ttp_tipo_evento_
    Left = 223
    Top = 185
  end
  object upd_servico: TUpdateSQL
    ModifySQL.Strings = (
      'update TSERVICO'
      'set'
      '  NM_SERVICO = :NM_SERVICO,'
      '  CD_CLASSIFICACAO = :CD_CLASSIFICACAO,'
      '  CD_VIA_TRANSPORTE = :CD_VIA_TRANSPORTE,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  NR_DIAS_CONCLUSAO = :NR_DIAS_CONCLUSAO,'
      '  CD_EVENTO_CONCLUSOR = :CD_EVENTO_CONCLUSOR,'
      '  IN_FOLLOWUP = :IN_FOLLOWUP,'
      '  IN_ADM_TEMP = :IN_ADM_TEMP,'
      '  IN_INDENT = :IN_INDENT,'
      '  CD_EV_INI = :CD_EV_INI,'
      '  CD_EV_FIM = :CD_EV_FIM,'
      '  CD_GRUPO = :CD_GRUPO,'
      '  TP_CTRL_VENCTO = :TP_CTRL_VENCTO,'
      '  TP_SERVICO = :TP_SERVICO,'
      '  CD_CT_CUSTO_1 = :CD_CT_CUSTO_1,'
      '  CD_CT_CUSTO_2 = :CD_CT_CUSTO_2,'
      '  CD_CT_CUSTO_3 = :CD_CT_CUSTO_3,'
      '  CD_CT_CUSTO_4 = :CD_CT_CUSTO_4,'
      '  CD_CT_CUSTO_5 = :CD_CT_CUSTO_5,'
      '  CD_CT_CUSTO_6 = :CD_CT_CUSTO_6,'
      '  CD_CT_CUSTO_7 = :CD_CT_CUSTO_7,'
      '  CD_CT_CUSTO_8 = :CD_CT_CUSTO_8,'
      '  CD_CT_CUSTO_9 = :CD_CT_CUSTO_9,'
      '  CD_CT_CUSTO_10 = :CD_CT_CUSTO_10,'
      '  CD_CT_CUSTO_11 = :CD_CT_CUSTO_11,'
      '  IN_ALADI = :IN_ALADI,'
      '  IN_FUMIGACAO = :IN_FUMIGACAO,'
      '  NR_CAD_CONFIG_STATUS = :NR_CAD_CONFIG_STATUS,'
      '  IN_SUBSTITUI = :IN_SUBSTITUI,'
      '  IN_LI = :IN_LI'
      'where'
      '  CD_SERVICO = :OLD_CD_SERVICO')
    InsertSQL.Strings = (
      'insert into TSERVICO'
      '  (CD_SERVICO, NM_SERVICO, CD_CLASSIFICACAO, CD_VIA_TRANSPORTE, '
      'IN_ATIVO, '
      '   NR_DIAS_CONCLUSAO, CD_EVENTO_CONCLUSOR, IN_FOLLOWUP, '
      'IN_ADM_TEMP, IN_INDENT, '
      '   CD_EV_INI, CD_EV_FIM, CD_GRUPO, TP_CTRL_VENCTO, TP_SERVICO, '
      '   CD_CT_CUSTO_1, CD_CT_CUSTO_2, CD_CT_CUSTO_3, CD_CT_CUSTO_4, '
      'CD_CT_CUSTO_5, '
      '   CD_CT_CUSTO_6, CD_CT_CUSTO_7, CD_CT_CUSTO_8, CD_CT_CUSTO_9, '
      'CD_CT_CUSTO_10, '
      
        '   CD_CT_CUSTO_11, IN_ALADI, IN_FUMIGACAO, NR_CAD_CONFIG_STATUS,' +
        ' '
      'IN_SUBSTITUI, '
      '   IN_LI)'
      'values'
      
        '  (:CD_SERVICO, :NM_SERVICO, :CD_CLASSIFICACAO, :CD_VIA_TRANSPOR' +
        'TE, '
      ':IN_ATIVO, '
      '   :NR_DIAS_CONCLUSAO, :CD_EVENTO_CONCLUSOR, :IN_FOLLOWUP, '
      ':IN_ADM_TEMP, '
      
        '   :IN_INDENT, :CD_EV_INI, :CD_EV_FIM, :CD_GRUPO, :TP_CTRL_VENCT' +
        'O, '
      '   :TP_SERVICO, :CD_CT_CUSTO_1, :CD_CT_CUSTO_2, :CD_CT_CUSTO_3, '
      ':CD_CT_CUSTO_4, '
      
        '   :CD_CT_CUSTO_5, :CD_CT_CUSTO_6, :CD_CT_CUSTO_7, :CD_CT_CUSTO_' +
        '8, '
      ':CD_CT_CUSTO_9, '
      '   :CD_CT_CUSTO_10, :CD_CT_CUSTO_11, :IN_ALADI, :IN_FUMIGACAO, '
      ':NR_CAD_CONFIG_STATUS, '
      '   :IN_SUBSTITUI, :IN_LI)')
    DeleteSQL.Strings = (
      'delete from TSERVICO'
      'where'
      '  CD_SERVICO = :OLD_CD_SERVICO')
    Left = 155
    Top = 17
  end
  object qry_servico_: TQuery
    CachedUpdates = True
    BeforePost = qry_servico_BeforePost
    AfterPost = qry_servico_AfterPost
    AfterScroll = qry_servico_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT S.*, SC.NM_CLASSIFICACAO, VT.NM_VIA_TRANSP'
      
        'FROM TSERVICO S LEFT JOIN TSERVICO_CLASSIFICACAO SC ON SC.CD_CLA' +
        'SSIFICACAO = S.CD_CLASSIFICACAO'
      
        '   LEFT JOIN TVIA_TRANSP_BROKER VT ON VT.CD_VIA_TRANSP = S.CD_VI' +
        'A_TRANSPORTE'
      'ORDER BY CD_SERVICO')
    UpdateObject = upd_servico
    Left = 90
    Top = 17
    object qry_servico_CD_SERVICO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
    object qry_servico_CD_CLASSIFICACAO: TStringField
      FieldName = 'CD_CLASSIFICACAO'
      Origin = 'TSERVICO.CD_CLASSIFICACAO'
      EditMask = '!99;0; '
      Size = 2
    end
    object qry_servico_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TSERVICO.CD_VIA_TRANSPORTE'
      EditMask = '!99;0; '
      Size = 2
    end
    object qry_servico_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TSERVICO.IN_ATIVO'
      Size = 1
    end
    object qry_servico_NR_DIAS_CONCLUSAO: TIntegerField
      FieldName = 'NR_DIAS_CONCLUSAO'
      Origin = 'TSERVICO.CD_SERVICO'
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object qry_servico_CD_EVENTO_CONCLUSOR: TStringField
      FieldName = 'CD_EVENTO_CONCLUSOR'
      Origin = 'TSERVICO.NM_SERVICO'
      EditMask = '!999;0; '
      Size = 3
    end
    object qry_servico_IN_FOLLOWUP: TStringField
      FieldName = 'IN_FOLLOWUP'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 1
    end
    object qry_servico_LookEventoConclusor: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEventoConclusor'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO_CONCLUSOR'
      Size = 50
      Lookup = True
    end
    object qry_servico_LookClassif: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'LookClassif'
      LookupDataSet = qry_classif_
      LookupKeyFields = 'CD_CLASSIFICACAO'
      LookupResultField = 'NM_CLASSIFICACAO'
      KeyFields = 'CD_CLASSIFICACAO'
      Lookup = True
    end
    object qry_servico_LookViaTransp: TStringField
      DisplayLabel = 'Via Transporte'
      FieldKind = fkLookup
      FieldName = 'LookViaTransp'
      LookupDataSet = qry_via_transp_
      LookupKeyFields = 'CD_VIA_TRANSP'
      LookupResultField = 'NM_VIA_TRANSP'
      KeyFields = 'CD_VIA_TRANSPORTE'
      Lookup = True
    end
    object qry_servico_LookAtivo: TStringField
      Alignment = taCenter
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
    object qry_servico_IN_ADM_TEMP: TStringField
      FieldName = 'IN_ADM_TEMP'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 1
    end
    object qry_servico_LookAdmTemp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAdmTemp'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ADM_TEMP'
      Size = 3
      Lookup = True
    end
    object qry_servico_IN_INDENT: TStringField
      FieldName = 'IN_INDENT'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 1
    end
    object qry_servico_CD_EV_INI: TStringField
      FieldName = 'CD_EV_INI'
      Origin = 'TSERVICO.CD_SERVICO'
      EditMask = '!999;0; '
      Size = 3
    end
    object qry_servico_CD_EV_FIM: TStringField
      FieldName = 'CD_EV_FIM'
      Origin = 'TSERVICO.NM_SERVICO'
      EditMask = '!999;0; '
      Size = 3
    end
    object qry_servico_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TSERVICO.CD_CLASSIFICACAO'
      EditMask = '!999;0; '
      Size = 3
    end
    object qry_servico_LookInicial: TStringField
      FieldKind = fkLookup
      FieldName = 'LookInicial'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_INI'
      Size = 50
      Lookup = True
    end
    object qry_servico_LookFim: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFim'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_FIM'
      Size = 50
      Lookup = True
    end
    object qry_servico_LookServico: TStringField
      FieldKind = fkLookup
      FieldName = 'LookServico'
      LookupDataSet = qry_grupo_servico_
      LookupKeyFields = 'CD_GRUPO'
      LookupResultField = 'NM_GRUPO'
      KeyFields = 'CD_GRUPO'
      Size = 50
      Lookup = True
    end
    object qry_servico_TP_CTRL_VENCTO: TStringField
      FieldName = 'TP_CTRL_VENCTO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 1
    end
    object qry_servico_LookContVenc: TStringField
      FieldKind = fkLookup
      FieldName = 'LookContVenc'
      LookupDataSet = qry_ctrl_vencto_
      LookupKeyFields = 'TP_CTRL_VENCTO'
      LookupResultField = 'NM_TP_CTRL_VENCTO'
      KeyFields = 'TP_CTRL_VENCTO'
      Size = 10
      Lookup = True
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
    object qry_servico_LookAladi: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAladi'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ALADI'
      Size = 1
      Lookup = True
    end
    object qry_servico_LookFumigacao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFumigacao'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_FUMIGACAO'
      Size = 1
      Lookup = True
    end
    object qry_servico_IN_CHECK: TStringField
      FieldName = 'IN_CHECK'
      Origin = 'DBBROKER.TSERVICO.IN_CHECK'
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
    object qry_servico_NM_CLASSIFICACAO: TStringField
      FieldName = 'NM_CLASSIFICACAO'
      FixedChar = True
    end
    object qry_servico_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
  end
  object upd_servico_evento_: TUpdateSQL
    ModifySQL.Strings = (
      'update TSERVICO_EVENTO'
      'set'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_EVENTO = :CD_EVENTO,'
      '  NR_ORDEM = :NR_ORDEM,'
      '  CD_EV_BASICO = :CD_EV_BASICO,'
      '  PZ_DO_EV_BASICO = :PZ_DO_EV_BASICO,'
      '  CD_EV_FUTURO = :CD_EV_FUTURO,'
      '  PZ_ATE_EV_FUTURO = :PZ_ATE_EV_FUTURO,'
      '  CD_TIPO_EVENTO = :CD_TIPO_EVENTO,'
      '  IN_DASHBOARD = :IN_DASHBOARD,'
      '  IN_PRAZO_UTIL = :IN_PRAZO_UTIL,'
      '  IN_PRAZO_FERIADO = :IN_PRAZO_FERIADO'
      'where'
      '  CD_SERVICO = :OLD_CD_SERVICO and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    InsertSQL.Strings = (
      'insert into TSERVICO_EVENTO'
      
        '  (CD_SERVICO, CD_EVENTO, NR_ORDEM, CD_EV_BASICO, PZ_DO_EV_BASIC' +
        'O, CD_EV_FUTURO, '
      
        '   PZ_ATE_EV_FUTURO, CD_TIPO_EVENTO, IN_DASHBOARD, IN_PRAZO_UTIL' +
        ', IN_PRAZO_FERIADO)'
      'values'
      
        '  (:CD_SERVICO, :CD_EVENTO, :NR_ORDEM, :CD_EV_BASICO, :PZ_DO_EV_' +
        'BASICO, '
      
        '   :CD_EV_FUTURO, :PZ_ATE_EV_FUTURO, :CD_TIPO_EVENTO, :IN_DASHBO' +
        'ARD, :IN_PRAZO_UTIL, '
      '   :IN_PRAZO_FERIADO)')
    DeleteSQL.Strings = (
      'delete from TSERVICO_EVENTO'
      'where'
      '  CD_SERVICO = :OLD_CD_SERVICO and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    Left = 179
    Top = 129
  end
  object sp_ordena_eventos_novo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ordena_eventos_novo'
    Left = 474
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@cd_servico'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_ordem_origem'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_ordem_destino'
        ParamType = ptInput
      end>
  end
  object sp_exclui_servico_evento_novo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exclui_servico_evento_novo'
    Left = 474
    Top = 234
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@cd_servico'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_evento'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@in_consiste'
        ParamType = ptInput
      end>
  end
end
