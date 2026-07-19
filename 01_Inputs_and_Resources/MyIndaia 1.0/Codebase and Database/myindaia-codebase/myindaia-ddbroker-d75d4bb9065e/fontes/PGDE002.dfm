object datm_dem_cntr: Tdatm_dem_cntr
  Left = 10
  Top = 140
  Height = 740
  Width = 1019
  object qry_processo_: TQuery
    AfterOpen = qry_processo_AfterOpen
    AfterScroll = qry_processo_AfterScroll
    OnCalcFields = qry_processo_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_USUARIO, DT_ABER' +
        'TURA, CD_CLIENTE,'
      
        '       CD_SERVICO, CD_REPRESENTANTE, CD_TRANSP_NAC_DOC, CD_TRANS' +
        'P_NAC, IN_IMP_ARM,'
      
        '       CD_AREA, TX_MERCADORIA, TX_OBSERVACOES, CD_RESTRICAO, CD_' +
        'LIBERADOR, DT_LIBERACAO,'
      
        '       CD_DESPACHANTE, IN_ETIQUETA, IN_LIBERADO, IN_CANCELADO, I' +
        'N_PRODUCAO, TX_OBS_INT,'
      
        '       NR_PRESENCA_CARGA, DT_PRESENCA_CARGA, NR_DI, NR_DA, NR_PE' +
        'RIODO_ARMAZENAGEM,'
      
        '       DT_VENCTO_ARMAZENAGEM, NR_DDE, DT_REG_DDE, IN_ENTREPOSTO,' +
        ' NR_PROCESSO_OR_ENTREPOSTO'
      'FROM   TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 134
    Top = 217
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
    object qry_processo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPROCESSO.CD_USUARIO'
      Size = 4
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 3
    end
    object qry_processo_CD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'TPROCESSO.CD_REPRESENTANTE'
      Size = 5
    end
    object qry_processo_CD_TRANSP_NAC_DOC: TStringField
      FieldName = 'CD_TRANSP_NAC_DOC'
      Origin = 'TPROCESSO.CD_TRANSP_NAC_DOC'
      Size = 4
    end
    object qry_processo_CD_TRANSP_NAC: TStringField
      FieldName = 'CD_TRANSP_NAC'
      Origin = 'TPROCESSO.CD_TRANSP_NAC'
      Size = 4
    end
    object qry_processo_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TPROCESSO.CD_AREA'
      Size = 2
    end
    object qry_processo_CD_RESTRICAO: TStringField
      FieldName = 'CD_RESTRICAO'
      Origin = 'TPROCESSO.CD_RESTRICAO'
      Size = 1
    end
    object qry_processo_CD_LIBERADOR: TStringField
      FieldName = 'CD_LIBERADOR'
      Origin = 'TPROCESSO.CD_LIBERADOR'
      Size = 4
    end
    object qry_processo_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
    object qry_processo_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPROCESSO.DT_ABERTURA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_processo_DT_LIBERACAO: TDateTimeField
      FieldName = 'DT_LIBERACAO'
      Origin = 'TPROCESSO.DT_LIBERACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_processo_DT_PRESENCA_CARGA: TDateTimeField
      FieldName = 'DT_PRESENCA_CARGA'
      Origin = 'TPROCESSO.NR_PROCESSO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_processo_DT_VENCTO_ARMAZENAGEM: TDateTimeField
      FieldName = 'DT_VENCTO_ARMAZENAGEM'
      Origin = 'TPROCESSO.CD_USUARIO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_processo_DT_REG_DDE: TDateTimeField
      FieldName = 'DT_REG_DDE'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_processo_IN_IMP_ARM: TStringField
      FieldName = 'IN_IMP_ARM'
      Origin = 'TPROCESSO.IN_IMP_ARM'
      Size = 1
    end
    object qry_processo_IN_ETIQUETA: TStringField
      FieldName = 'IN_ETIQUETA'
      Origin = 'TPROCESSO.IN_ETIQUETA'
      Size = 1
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 1
    end
    object qry_processo_IN_PRODUCAO: TStringField
      FieldName = 'IN_PRODUCAO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_IN_ENTREPOSTO: TStringField
      FieldName = 'IN_ENTREPOSTO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_NR_PRESENCA_CARGA: TStringField
      FieldName = 'NR_PRESENCA_CARGA'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 36
    end
    object qry_processo_NR_DI: TStringField
      FieldName = 'NR_DI'
      Origin = 'TPROCESSO.NR_PROCESSO'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object qry_processo_NR_DA: TStringField
      FieldName = 'NR_DA'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object qry_processo_NR_PERIODO_ARMAZENAGEM: TIntegerField
      FieldName = 'NR_PERIODO_ARMAZENAGEM'
      Origin = 'TPROCESSO.CD_PRODUTO'
    end
    object qry_processo_NR_DDE: TStringField
      FieldName = 'NR_DDE'
      Origin = 'TPROCESSO.NR_PROCESSO'
      EditMask = '##########-#;0;_'
      Size = 11
    end
    object qry_processo_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TPROCESSO.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_processo_TX_OBSERVACOES: TMemoField
      FieldName = 'TX_OBSERVACOES'
      Origin = 'TPROCESSO.TX_OBSERVACOES'
      BlobType = ftMemo
    end
    object qry_processo_TX_OBS_INT: TMemoField
      FieldName = 'TX_OBS_INT'
      Origin = 'TPROCESSO.NR_PROCESSO'
      BlobType = ftMemo
    end
    object qry_processo_LookUnidNeg: TStringField
      FieldName = 'LookUnidNeg'
      Size = 10
      Calculated = True
    end
    object qry_processo_LookProduto: TStringField
      FieldName = 'LookProduto'
      Size = 40
      Calculated = True
    end
    object qry_processo_LookUsuario: TStringField
      FieldName = 'LookUsuario'
      Size = 50
      Calculated = True
    end
    object qry_processo_CalcNrProcesso: TStringField
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
    object qry_processo_LookCliente: TStringField
      FieldName = 'LookCliente'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookServico: TStringField
      FieldName = 'LookServico'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookRepresentante: TStringField
      FieldName = 'LookRepresentante'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookViaTransporte: TStringField
      FieldName = 'LookViaTransporte'
      Size = 2
      Calculated = True
    end
    object qry_processo_LookTranspNac: TStringField
      FieldName = 'LookTranspNac'
      Size = 60
      Calculated = True
    end
    object qry_processo_LookTranspNacDoc: TStringField
      FieldName = 'LookTranspNacDoc'
      Size = 60
      Calculated = True
    end
    object qry_processo_LookArea: TStringField
      FieldName = 'LookArea'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookRestricao: TStringField
      FieldName = 'LookRestricao'
      Size = 30
      Calculated = True
    end
    object qry_processo_LookLiberador: TStringField
      FieldName = 'LookLiberador'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookServicoAtivo: TStringField
      FieldName = 'LookServicoAtivo'
      Size = 1
      Calculated = True
    end
    object qry_processo_LookDespachante: TStringField
      FieldName = 'LookDespachante'
      Size = 50
      Calculated = True
    end
    object qry_processo_LookImpArm: TStringField
      FieldName = 'LookImpArm'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_IMP_ARM'
      Size = 3
      Lookup = True
    end
    object qry_processo_LookEtiqueta: TStringField
      FieldName = 'LookEtiqueta'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ETIQUETA'
      Size = 3
      Lookup = True
    end
    object qry_processo_LookEntreposto: TStringField
      FieldName = 'LookEntreposto'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ENTREPOSTO'
      Size = 3
      Lookup = True
    end
    object qry_processo_NR_PROCESSO_OR_ENTREPOSTO: TStringField
      FieldName = 'NR_PROCESSO_OR_ENTREPOSTO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 44
    Top = 217
  end
  object qry_cntr_: TQuery
    AfterOpen = qry_cntr_AfterOpen
    AfterClose = qry_cntr_AfterClose
    AfterCancel = qry_cntr_AfterCancel
    AfterScroll = qry_cntr_AfterScroll
    OnCalcFields = qry_cntr_CalcFields
    OnPostError = qry_cntr_PostError
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_CNTR, TP_CNTR, DT_ENT, DT_ENT_ARM, IN_DES' +
        'OVA, DT_DESOVA,'
      
        '       TP_DIAS,  NR_FREE_TIME, IN_DEMURRAGE, DT_DEMURRAGE, DT_EN' +
        'TREGA_FABRICA,'
      
        '       DT_DEVOLUCAO_CNTR, CD_STATUS_CNTR, DT_CARREGAMENTO, DT_RE' +
        'T_CNTR_FABRICA,'
      
        '       DT_ENTRADA_PATIO_TRANSP, IN_DEPOSITADO, IN_DEVOLVIDO, IN_' +
        'AVARIA, IN_LAVAGEM, IN_MESQUITA'
      'FROM   TPROCESSO_CNTR'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 134
    Top = 42
    object qry_cntr_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_CNTR.NR_PROCESSO'
      Size = 18
    end
    object qry_cntr_NR_CNTR: TStringField
      DisplayLabel = 'Nº Contêiner'
      FieldName = 'NR_CNTR'
      Origin = 'TPROCESSO_CNTR.NR_CNTR'
      EditMask = 'LLLL-999-999-9;0;_'
    end
    object qry_cntr_DT_ENT_ARM: TDateTimeField
      DisplayLabel = 'Dt. Ent. Arm.'
      FieldName = 'DT_ENT_ARM'
      Origin = 'TPROCESSO_CNTR.DT_ENT_ARM'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_cntr_IN_DESOVA: TStringField
      FieldName = 'IN_DESOVA'
      Origin = 'TPROCESSO_CNTR.IN_DESOVA'
      Size = 1
    end
    object qry_cntr_DT_DESOVA: TDateTimeField
      DisplayLabel = 'Dt.Desova'
      FieldName = 'DT_DESOVA'
      Origin = 'TPROCESSO_CNTR.DT_DESOVA'
      OnChange = qry_cntr_DT_DESOVAChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_cntr_IN_DEMURRAGE: TStringField
      FieldName = 'IN_DEMURRAGE'
      Origin = 'TPROCESSO_CNTR.IN_DEMURRAGE'
      Size = 1
    end
    object qry_cntr_DT_DEMURRAGE: TDateTimeField
      DisplayLabel = 'Dt.Demurrage'
      FieldName = 'DT_DEMURRAGE'
      Origin = 'TPROCESSO_CNTR.DT_DEMURRAGE'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'TPROCESSO_CNTR.NR_CNTR'
      Size = 2
    end
    object qry_cntr_NR_FREE_TIME: TIntegerField
      FieldName = 'NR_FREE_TIME'
      Origin = 'TPROCESSO_CNTR.DT_ENT_ARM'
    end
    object qry_cntr_LookDesova: TStringField
      DisplayLabel = 'Desova'
      FieldName = 'LookDesova'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_DESOVA'
      Size = 3
      Lookup = True
    end
    object qry_cntr_LookDemurrage: TStringField
      DisplayLabel = 'Demurrage'
      FieldName = 'LookDemurrage'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_DEMURRAGE'
      Size = 3
      Lookup = True
    end
    object qry_cntr_LookTpCntr: TStringField
      FieldName = 'LookTpCntr'
      LookupDataSet = qry_tp_cntr_
      LookupKeyFields = 'TP_CNTR'
      LookupResultField = 'NM_TP_CNTR'
      KeyFields = 'TP_CNTR'
      Lookup = True
    end
    object qry_cntr_DT_ENT: TDateTimeField
      FieldName = 'DT_ENT'
      Origin = 'TPROCESSO_CNTR.NR_CNTR'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_cntr_TP_DIAS: TStringField
      DisplayWidth = 1
      FieldName = 'TP_DIAS'
      Origin = 'TPROCESSO_CNTR.TP_CNTR'
      Size = 1
    end
    object qry_cntr_DT_ENTREGA_FABRICA: TDateTimeField
      FieldName = 'DT_ENTREGA_FABRICA'
      Origin = 'TPROCESSO_CNTR.DT_ENT'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_cntr_DT_DEVOLUCAO_CNTR: TDateTimeField
      DisplayLabel = 'Dt. Devolução'
      FieldName = 'DT_DEVOLUCAO_CNTR'
      Origin = 'TPROCESSO_CNTR.DT_ENT_ARM'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_cntr_CD_STATUS_CNTR: TStringField
      FieldName = 'CD_STATUS_CNTR'
      Origin = 'TPROCESSO_CNTR.IN_DESOVA'
      Size = 2
    end
    object qry_cntr_LookTpDias: TStringField
      FieldName = 'LookTpDias'
      LookupDataSet = qry_tp_dias_
      LookupKeyFields = 'TP_DIAS'
      LookupResultField = 'NM_TP_DIAS'
      KeyFields = 'TP_DIAS'
      Size = 10
      Lookup = True
    end
    object qry_cntr_LookStatusCntr: TStringField
      FieldName = 'LookStatusCntr'
      LookupDataSet = qry_status_cntr_
      LookupKeyFields = 'CD_STATUS_CNTR'
      LookupResultField = 'NM_STATUS_CNTR'
      KeyFields = 'CD_STATUS_CNTR'
      Lookup = True
    end
    object qry_cntr_CalcDiasCorridos: TFloatField
      FieldName = 'CalcDiasCorridos'
      Calculated = True
    end
    object qry_cntr_IN_DEPOSITADO: TStringField
      FieldName = 'IN_DEPOSITADO'
      Origin = 'TPROCESSO_CNTR.NR_PROCESSO'
      Size = 1
    end
    object qry_cntr_IN_DEVOLVIDO: TStringField
      FieldName = 'IN_DEVOLVIDO'
      Origin = 'TPROCESSO_CNTR.NR_CNTR'
      Size = 1
    end
    object qry_cntr_IN_AVARIA: TStringField
      FieldName = 'IN_AVARIA'
      Origin = 'TPROCESSO_CNTR.TP_CNTR'
      Size = 1
    end
    object qry_cntr_IN_LAVAGEM: TStringField
      FieldName = 'IN_LAVAGEM'
      Origin = 'TPROCESSO_CNTR.DT_ENT'
      Size = 1
    end
    object qry_cntr_CalcDiasCobrar: TFloatField
      FieldName = 'CalcDiasCobrar'
      Calculated = True
    end
    object qry_cntr_DT_CARREGAMENTO: TDateTimeField
      FieldName = 'DT_CARREGAMENTO'
      Origin = 'TPROCESSO_CNTR.NR_PROCESSO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_cntr_DT_RET_CNTR_FABRICA: TDateTimeField
      FieldName = 'DT_RET_CNTR_FABRICA'
      Origin = 'TPROCESSO_CNTR.NR_CNTR'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_cntr_DT_ENTRADA_PATIO_TRANSP: TDateTimeField
      FieldName = 'DT_ENTRADA_PATIO_TRANSP'
      Origin = 'TPROCESSO_CNTR.TP_CNTR'
    end
    object qry_cntr_IN_MESQUITA: TStringField
      FieldName = 'IN_MESQUITA'
      Origin = 'TPROCESSO_CNTR.NR_PROCESSO'
      Size = 1
    end
  end
  object ds_cntr: TDataSource
    DataSet = qry_cntr_
    Left = 44
    Top = 42
  end
  object qry_tp_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT TP_CNTR, NM_TP_CNTR'
      'FROM   TTP_CNTR')
    Left = 335
    Top = 42
    object qry_tp_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'TTP_CNTR.TP_CNTR'
      Size = 2
    end
    object qry_tp_cntr_NM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
      Origin = 'TTP_CNTR.NM_TP_CNTR'
    end
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM   TYES_NO')
    Left = 335
    Top = 97
    object qry_yes_no_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 1
    end
    object qry_yes_no_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG '
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_UNID_NEG IN ( SELECT CD_UNID_NEG'
      '                        FROM   TUSUARIO_HABILITACAO'
      '                        WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                               IN_ATIVO = '#39'1'#39' )'
      '')
    Params.Data = {
      010002000B43445F554E49445F4E454700010200300000000A43445F55535541
      52494F0001020030000000}
    Left = 233
    Top = 42
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO, AP_PRODUTO'
      'FROM   TPRODUTO'
      'WHERE  CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_PRODUTO IN ( SELECT CD_PRODUTO'
      '                       FROM   TUSUARIO_HABILITACAO'
      '                       WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                              IN_ATIVO = '#39'1'#39' )'
      '')
    Params.Data = {
      010002000A43445F50524F4455544F00010200300000000A43445F5553554152
      494F0001020030000000}
    Left = 233
    Top = 97
  end
  object qry_dt_desova_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT NR_PROCESSO, MAX( DT_DESOVA ) DT_DESOVA'
      'FROM TPROCESSO_CNTR'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'GROUP BY NR_PROCESSO'
      '')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 44
    Top = 271
    object qry_dt_desova_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_dt_desova_DT_DESOVA: TDateTimeField
      FieldName = 'DT_DESOVA'
    end
  end
  object sp_atz_evento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_evento'
    Params.Data = {
      0100040006526573756C74040304000100000000010C406E725F70726F636573
      736F01010200300000000E4063645F6576656E746F5F74787401010200300000
      000E4064745F7265616C697A6163616F010B080000002C845D40CB420000}
    Left = 475
    Top = 42
  end
  object qry_vw_dt_desova_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT *'
      'FROM VW_DT_DESOVA'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 44
    Top = 319
    object qry_vw_dt_desova_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'VW_DT_DESOVA.NR_PROCESSO'
      Size = 18
    end
    object qry_vw_dt_desova_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'VW_DT_DESOVA.CD_SERVICO'
      Size = 3
    end
    object qry_vw_dt_desova_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'VW_DT_DESOVA.DT_REALIZACAO'
    end
  end
  object qry_dt_ent_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DT_REALIZACAO'
      'FROM   VW_DT_ENT'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 44
    Top = 369
    object qry_dt_ent_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'VW_DT_CHEGADA.DT_REALIZACAO'
    end
  end
  object qry_tp_dias_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT TP_DIAS, NM_TP_DIAS'
      'FROM   TTP_DIAS')
    Left = 335
    Top = 217
    object qry_tp_dias_TP_DIAS: TStringField
      FieldName = 'TP_DIAS'
      Origin = 'TTP_DIAS.TP_DIAS'
      Size = 1
    end
    object qry_tp_dias_NM_TP_DIAS: TStringField
      FieldName = 'NM_TP_DIAS'
      Origin = 'TTP_DIAS.NM_TP_DIAS'
      Size = 10
    end
  end
  object qry_status_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_STATUS_CNTR, NM_STATUS_CNTR'
      'FROM   TSTATUS_CNTR')
    Left = 335
    Top = 153
    object qry_status_cntr_CD_STATUS_CNTR: TStringField
      FieldName = 'CD_STATUS_CNTR'
      Origin = 'TSTATUS_CNTR.CD_STATUS_CNTR'
      Size = 2
    end
    object qry_status_cntr_NM_STATUS_CNTR: TStringField
      FieldName = 'NM_STATUS_CNTR'
      Origin = 'TSTATUS_CNTR.NM_STATUS_CNTR'
    end
  end
  object qry_dep_: TQuery
    OnCalcFields = qry_dep_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_CNTR, NR_CHEQUE_CAUCAO, CD_BANCO_CAUCAO, ' +
        'DT_EMISSAO_CAUCAO,'
      
        '       VL_DEPOSITO, TX_DEPOSITO, VL_CHEQUE_CAUCAO, IN_DEPOSITADO' +
        ', IN_DEVOLVIDO'
      'FROM   TPROCESSO_CNTR'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 134
    Top = 97
    object qry_dep_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_CNTR.NR_PROCESSO'
      Size = 18
    end
    object qry_dep_NR_CNTR: TStringField
      DisplayLabel = 'Nº Contêiner'
      FieldName = 'NR_CNTR'
      Origin = 'TPROCESSO_CNTR.NR_CNTR'
      EditMask = 'llll-999-999-9;0;_'
    end
    object qry_dep_NR_CHEQUE_CAUCAO: TStringField
      DisplayLabel = 'Nº Cheque'
      FieldName = 'NR_CHEQUE_CAUCAO'
      Origin = 'TPROCESSO_CNTR.NR_CHEQUE_CAUCAO'
      Size = 7
    end
    object qry_dep_CD_BANCO_CAUCAO: TStringField
      FieldName = 'CD_BANCO_CAUCAO'
      Origin = 'TPROCESSO_CNTR.CD_BANCO_CAUCAO'
      Size = 3
    end
    object qry_dep_DT_EMISSAO_CAUCAO: TDateTimeField
      DisplayLabel = 'Dt. Emissão'
      FieldName = 'DT_EMISSAO_CAUCAO'
      Origin = 'TPROCESSO_CNTR.DT_EMISSAO_CAUCAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_dep_VL_DEPOSITO: TFloatField
      FieldName = 'VL_DEPOSITO'
      Origin = 'TPROCESSO_CNTR.VL_DEPOSITO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_dep_TX_DEPOSITO: TFloatField
      FieldName = 'TX_DEPOSITO'
      Origin = 'TPROCESSO_CNTR.TX_DEPOSITO'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_dep_VL_CHEQUE_CAUCAO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_CHEQUE_CAUCAO'
      Origin = 'TPROCESSO_CNTR.VL_CHEQUE_CAUCAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_dep_IN_DEPOSITADO: TStringField
      FieldName = 'IN_DEPOSITADO'
      Origin = 'TPROCESSO_CNTR.IN_DEPOSITADO'
      Size = 1
    end
    object qry_dep_IN_DEVOLVIDO: TStringField
      FieldName = 'IN_DEVOLVIDO'
      Origin = 'TPROCESSO_CNTR.IN_DEVOLVIDO'
      Size = 1
    end
    object qry_dep_LookBanco: TStringField
      FieldName = 'LookBanco'
      Size = 40
      Calculated = True
    end
    object qry_dep_LookApBanco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'LookApBanco'
      Size = 10
      Calculated = True
    end
    object qry_dep_LookDepositado: TStringField
      FieldName = 'LookDepositado'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_DEPOSITADO'
      Size = 3
      Lookup = True
    end
    object qry_dep_LookDevolvido: TStringField
      FieldName = 'LookDevolvido'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_DEVOLVIDO'
      Size = 3
      Lookup = True
    end
  end
  object ds_dep: TDataSource
    DataSet = qry_dep_
    Left = 44
    Top = 97
  end
  object qry_av_lav_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_CNTR, IN_AVARIA, TX_OBS_AVARIA, VL_AVARIA' +
        ', IN_LAVAGEM, VL_LAVAGEM'
      'FROM   TPROCESSO_CNTR'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 134
    Top = 153
    object qry_av_lav_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_CNTR.NR_PROCESSO'
      Size = 18
    end
    object qry_av_lav_NR_CNTR: TStringField
      DisplayLabel = 'Nº Contêiner'
      FieldName = 'NR_CNTR'
      Origin = 'TPROCESSO_CNTR.NR_CNTR'
      EditMask = 'llll-999-999-9;0;_'
    end
    object qry_av_lav_IN_AVARIA: TStringField
      FieldName = 'IN_AVARIA'
      Origin = 'TPROCESSO_CNTR.IN_AVARIA'
      Size = 1
    end
    object qry_av_lav_TX_OBS_AVARIA: TMemoField
      FieldName = 'TX_OBS_AVARIA'
      Origin = 'TPROCESSO_CNTR.TX_OBS_AVARIA'
      BlobType = ftMemo
    end
    object qry_av_lav_VL_AVARIA: TFloatField
      DisplayLabel = 'Valor Avaria'
      FieldName = 'VL_AVARIA'
      Origin = 'TPROCESSO_CNTR.VL_AVARIA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_av_lav_IN_LAVAGEM: TStringField
      FieldName = 'IN_LAVAGEM'
      Origin = 'TPROCESSO_CNTR.IN_LAVAGEM'
      Size = 1
    end
    object qry_av_lav_VL_LAVAGEM: TFloatField
      DisplayLabel = 'Valor Lavagem'
      FieldName = 'VL_LAVAGEM'
      Origin = 'TPROCESSO_CNTR.VL_LAVAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_av_lav_LookAvaria: TStringField
      DisplayLabel = 'Avaria'
      FieldName = 'LookAvaria'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_AVARIA'
      Size = 3
      Lookup = True
    end
    object qry_av_lav_LookLavagem: TStringField
      DisplayLabel = 'Lavagem'
      FieldName = 'LookLavagem'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_LAVAGEM'
      Size = 3
      Lookup = True
    end
  end
  object ds_av_lav: TDataSource
    DataSet = qry_av_lav_
    Left = 44
    Top = 153
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO, AP_BANCO'
      'FROM   TBANCO'
      'WHERE  CD_BANCO = :CD_BANCO')
    Params.Data = {010001000843445F42414E434F0001020030000000}
    Left = 335
    Top = 271
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UP.CD_UNID_NEG, U.AP_UNID_NEG, UP.CD_PRODUTO, P.AP_PRODUT' +
        'O'
      'FROM   TUNID_NEG_PRODUTO UP, TUNID_NEG U, TPRODUTO P'
      'WHERE  UP.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '       UP.CD_PRODUTO = P.CD_PRODUTO AND'
      '       ( UP.CD_UNID_NEG + UP.CD_PRODUTO ) IN'
      '          ( SELECT ( CD_UNID_NEG + CD_PRODUTO )'
      '            FROM   TUSUARIO_HABILITACAO'
      '            WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                   IN_ATIVO = '#39'1'#39' )'
      ''
      '')
    Params.Data = {010001000A43445F5553554152494F0001020030000100}
    Left = 233
    Top = 153
  end
  object sp_calc_dias_cntr: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_calc_dias_cntr'
    Params.Data = {
      0100050006526573756C74040304000000000000010C406E725F70726F636573
      736F010102003000000008406E725F636E7472010102003000000011406E725F
      646961735F636F727269646F73020304000000000000010F406E725F64696173
      5F636F6272617202030400000000000100}
    Left = 475
    Top = 97
  end
  object sp_calc_dt_demurrage: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_calc_dt_demurrage'
    Params.Data = {
      0100040006526573756C74040304000000000000010C406E725F70726F636573
      736F010102003000000008406E725F636E747201010200300000000D4064745F
      64656D757272616765020B080000002C845D40CB420100}
    Left = 475
    Top = 153
  end
  object qry_dt_nf_transp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DT_REALIZACAO'
      'FROM   VW_DT_NF_TRANSP'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 134
    Top = 425
    object DateTimeField1: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'VW_DT_CHEGADA.DT_REALIZACAO'
    end
  end
  object ds_nf_transp: TDataSource
    DataSet = qry_dt_nf_transp_
    Left = 44
    Top = 425
  end
  object qry_fat_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, NR_FATURA, NR_CNTR, NR_PROCESSO, NR_DIAS_COB' +
        'RADOS, VL_DIARIA,'
      
        '       VL_FATURA_MNEG, CD_MOEDA_FATURA, TX_FATURA, VL_FATURA_MN,' +
        ' VL_DESCONTO, VL_DEPOSITO,'
      
        '       VL_TOTAL, IN_PARCIAL, DT_INICIO, DT_FIM, DT_VENCIMENTO, D' +
        'T_PAGAMENTO, NR_SOLIC_PAGTO,'
      '       IN_RECIBO, IN_FATURADO, DT_FATURA'
      'FROM   TDEMURRAGE_FATURA'
      'WHERE  ( ( NR_FATURA = :NR_FATURA ) OR ( :NR_FATURA = '#39#39' ) ) AND'
      '       ( ( NR_CNTR = :NR_CNTR ) OR ( :NR_CNTR = '#39#39' ) ) AND'
      
        '       ( ( NR_PROCESSO = :NR_PROCESSO ) OR ( :NR_PROCESSO = '#39#39' )' +
        ' )')
    Params.Data = {
      01000600094E525F4641545552410001020030000000094E525F464154555241
      0001020030000000074E525F434E54520001020030000000074E525F434E5452
      00010200300000000B4E525F50524F434553534F00010200300000000B4E525F
      50524F434553534F0001020030000000}
    Left = 134
    Top = 271
    object qry_fat_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TDEMURRAGE_FATURA.CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_NR_FATURA: TStringField
      DisplayLabel = 'Nº Fatura'
      FieldName = 'NR_FATURA'
      Origin = 'TDEMURRAGE_FATURA.NR_FATURA'
    end
    object qry_fat_NR_CNTR: TStringField
      DisplayLabel = 'Nº Contâiner'
      FieldName = 'NR_CNTR'
      Origin = 'TDEMURRAGE_FATURA.NR_CNTR'
      EditMask = 'LLLL-999-999-9;0;_'
    end
    object qry_fat_NR_PROCESSO: TStringField
      DisplayLabel = 'Nº Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TDEMURRAGE_FATURA.NR_PROCESSO'
      Size = 18
    end
    object qry_fat_NR_DIAS_COBRADOS: TSmallintField
      DisplayLabel = 'Dias Cobrados'
      FieldName = 'NR_DIAS_COBRADOS'
      Origin = 'TDEMURRAGE_FATURA.NR_DIAS_COBRADOS'
    end
    object qry_fat_CD_MOEDA_FATURA: TStringField
      FieldName = 'CD_MOEDA_FATURA'
      Origin = 'TDEMURRAGE_FATURA.CD_MOEDA_FATURA'
      Size = 3
    end
    object qry_fat_TX_FATURA: TFloatField
      FieldName = 'TX_FATURA'
      Origin = 'TDEMURRAGE_FATURA.TX_FATURA'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_fat_VL_DIARIA: TFloatField
      FieldName = 'VL_DIARIA'
      Origin = 'TDEMURRAGE_FATURA.VL_DIARIA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_VL_FATURA_MNEG: TFloatField
      FieldName = 'VL_FATURA_MNEG'
      Origin = 'TDEMURRAGE_FATURA.VL_FATURA_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_VL_FATURA_MN: TFloatField
      DisplayLabel = 'Valor Fatura'
      FieldName = 'VL_FATURA_MN'
      Origin = 'TDEMURRAGE_FATURA.VL_FATURA_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TDEMURRAGE_FATURA.VL_DESCONTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_VL_DEPOSITO: TFloatField
      FieldName = 'VL_DEPOSITO'
      Origin = 'TDEMURRAGE_FATURA.VL_DEPOSITO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_VL_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VL_TOTAL'
      Origin = 'TDEMURRAGE_FATURA.VL_TOTAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_DT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
      Origin = 'TDEMURRAGE_FATURA.DT_INICIO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_DT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
      Origin = 'TDEMURRAGE_FATURA.DT_FIM'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_DT_VENCIMENTO: TDateTimeField
      DisplayLabel = 'Dt. Vencto'
      FieldName = 'DT_VENCIMENTO'
      Origin = 'TDEMURRAGE_FATURA.DT_VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_DT_PAGAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'DT_PAGAMENTO'
      Origin = 'TDEMURRAGE_FATURA.DT_PAGAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_DT_FATURA: TDateTimeField
      DisplayLabel = 'Dt. Fatura'
      FieldName = 'DT_FATURA'
      Origin = 'TDEMURRAGE_FATURA.DT_FATURA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_fat_IN_PARCIAL: TStringField
      FieldName = 'IN_PARCIAL'
      Origin = 'TDEMURRAGE_FATURA.IN_PARCIAL'
      Size = 1
    end
    object qry_fat_IN_RECIBO: TStringField
      FieldName = 'IN_RECIBO'
      Origin = 'TDEMURRAGE_FATURA.IN_RECIBO'
      Size = 1
    end
    object qry_fat_IN_FATURADO: TStringField
      FieldName = 'IN_FATURADO'
      Origin = 'TDEMURRAGE_FATURA.IN_FATURADO'
      Size = 1
    end
    object qry_fat_NR_SOLIC_PAGTO: TStringField
      FieldName = 'NR_SOLIC_PAGTO'
      Origin = 'TDEMURRAGE_FATURA.NR_SOLIC_PAGTO'
      Size = 3
    end
    object qry_fat_LookMoeda: TStringField
      FieldName = 'LookMoeda'
      Size = 30
      Calculated = True
    end
    object qry_fat_LookParcial: TStringField
      FieldName = 'LookParcial'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_PARCIAL'
      Size = 3
      Lookup = True
    end
    object qry_fat_LookRecibo: TStringField
      FieldName = 'LookRecibo'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_RECIBO'
      Size = 3
      Lookup = True
    end
    object qry_fat_LookFaturado: TStringField
      FieldName = 'LookFaturado'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_FATURADO'
      Size = 3
      Lookup = True
    end
    object qry_fat_LookNrCheque: TStringField
      FieldName = 'LookNrCheque'
      Size = 6
      Calculated = True
    end
    object qry_fat_CalcNrProcesso: TStringField
      DisplayLabel = 'Nº Processo'
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
    object qry_fat_CalcDiasCobrar: TIntegerField
      DisplayLabel = 'Dias a Cobrar'
      FieldName = 'CalcDiasCobrar'
      Calculated = True
    end
    object qry_fat_CalcDiasCorridos: TIntegerField
      DisplayLabel = 'Dias Corridos'
      FieldName = 'CalcDiasCorridos'
      Calculated = True
    end
    object qry_fat_CalcVlTotal: TFloatField
      FieldName = 'CalcVlTotal'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
  end
  object ds_tp_dias: TDataSource
    DataSet = qry_tp_dias_
    Left = 233
    Top = 217
  end
  object sp_repassa_tp_dias: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_dem_repassa_tp_dias'
    Params.Data = {
      0100030006526573756C74040304000000000000010C406E725F70726F636573
      736F0101020030000000084074705F646961730101020030000000}
    Left = 475
    Top = 217
  end
  object qry_transp_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT TR.AP_TRANSP_ROD'
      'FROM   TPROCESSO P, TTRANSP_ROD TR'
      'WHERE  TR.CD_TRANSP_ROD = P.CD_TRANSP_NAC  and'
      '                P.NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 376
    Top = 400
    object qry_transp_AP_TRANSP_ROD: TStringField
      FieldName = 'AP_TRANSP_ROD'
      Origin = 'TTRANSP_ROD.AP_TRANSP_ROD'
    end
  end
  object ds_transp: TDataSource
    DataSet = qry_transp_
    Left = 304
    Top = 400
  end
end
