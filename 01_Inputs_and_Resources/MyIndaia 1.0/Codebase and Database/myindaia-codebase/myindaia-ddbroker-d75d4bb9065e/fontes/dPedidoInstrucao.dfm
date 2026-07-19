object datm_pedido_instrucao: Tdatm_pedido_instrucao
  OldCreateOrder = False
  Left = 147
  Top = 109
  Height = 437
  Width = 343
  object qry_processo_: TQuery
    CachedUpdates = True
    AfterPost = qry_processo_AfterPost
    AfterDelete = qry_processo_AfterDelete
    AfterScroll = qry_processo_AfterScroll
    OnCalcFields = qry_processo_CalcFields
    OnUpdateError = qry_proc_cntr_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.CD_CLIENTE, TP.CD_EMP_EST, TP.TP_PROCE' +
        'SSO, TP.CD_AGENTE, TP.CD_ORIGEM, TP.QTD_VOLUME,'
      
        ' TP.CD_DESTINO, TP.CD_CIA_TRANSP, TP.CD_ARMADOR, TP.CD_UNID_NEG,' +
        ' TP.CD_PRODUTO, TP.IN_ROUTING,TP.VL_PESO_BRUTO,'
      
        ' TP.TP_ESTUFAGEM, TP.CD_MOEDA_FRETE, TP.TP_FRETE, TP.TP_CARGA, T' +
        'P.CD_INCOTERM,TP.IN_PEDIDO, TP.CUBAGEM, TS.CD_VIA_TRANSPORTE,'
      
        ' (SELECT TN.NM_EMPRESA FROM TEMPRESA_NAC TN WHERE TN.CD_EMPRESA ' +
        '= TP.CD_CLIENTE)NM_CLIENTE, TP.CHARGEABLE,'
      
        ' (SELECT TE.NM_EMPRESA FROM TEMPRESA_EST TE WHERE TE.CD_EMPRESA ' +
        '= TP.CD_EMP_EST)NM_IMP, TP.IN_CUBAGEM,'
      
        ' (SELECT TA.NM_AGENTE FROM TAGENTE TA WHERE TA.CD_AGENTE = TP.CD' +
        '_AGENTE)NM_AGENTE,TP.VL_TARIFA_FRETE,TP.VL_FRETE,TP.VL_HOUSE,'
      
        ' (SELECT TT.DESCRICAO FROM TTRANSPORTADOR_ITL TT WHERE TT.CODIGO' +
        ' = TP.CD_CIA_TRANSP  AND TT.TP_TRANSPORTADOR = '#39'0'#39')NM_CIA,TP.VL_' +
        'OTHER_CHARGE,TP.VL_RATEIO,'
      
        ' (SELECT TAR.DESCRICAO FROM TTRANSPORTADOR_ITL  TAR WHERE TAR.CO' +
        'DIGO = TP.CD_ARMADOR AND TAR.TP_TRANSPORTADOR = '#39'1'#39')NM_ARMADOR,'
      
        ' (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER  TM WHERE TM.CD_MOEDA = ' +
        'TP.CD_MOEDA_FRETE)NM_MOEDA, TP.REF_CLIENTE,'
      
        ' (SELECT TPO.NM_PORTO FROM TPORTO  TPO WHERE TPO.CD_PORTO = TP.C' +
        'D_ORIGEM)NM_ORIGEM,TP.CD_TAB_FRETE_VENDA,'
      
        ' (SELECT TPOR.NM_PORTO FROM TPORTO  TPOR WHERE TPOR.CD_PORTO = T' +
        'P.CD_DESTINO)NM_DESTINO, TP.CD_SERVICO,'
      
        ' (SELECT TPOR.CD_SIGLA FROM TPORTO  TPOR WHERE TPOR.CD_PORTO = T' +
        'P.CD_DESTINO)AP_DESTINO, TP.DESCR_MERCADORIA,'
      
        ' (SELECT TPO.CD_SIGLA FROM TPORTO  TPO WHERE TPO.CD_PORTO = TP.C' +
        'D_ORIGEM)AP_ORIGEM, TP.NR_PROPOSTA,'
      
        ' (SELECT TPO.CD_SIGLA_CIDADE FROM TPORTO  TPO WHERE TPO.CD_PORTO' +
        ' = TP.CD_ORIGEM)AP_CIDADE_ORIGEM,'
      
        ' (SELECT TPO.CD_SIGLA_CIDADE FROM TPORTO  TPO WHERE TPO.CD_PORTO' +
        ' = TP.CD_DESTINO)AP_CIDADE_DESTINO'
      ''
      
        '   FROM TPROCESSO TP, TSERVICO TS, TPRODUTO TPR WHERE TP.CD_SERV' +
        'ICO = TS.CD_SERVICO AND TS.TP_SERVICO = '#39'1'#39' AND'
      
        '  TS.CD_VIA_TRANSPORTE = :CD_VIA_TRANSP AND   TP.IN_LIBERADO = '#39 +
        '1'#39' AND TP.CD_PRODUTO =TPR.CD_PRODUTO'
      
        '  AND TP.CD_UNID_NEG =:CD_UNID_NEG AND TP.CD_PRODUTO =:CD_PRODUT' +
        'O AND TP.IN_PEDIDO = :IN_PEDIDO'
      '    ORDER BY'
      '     TP.NR_PROCESSO'
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDAte_processo
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'IN_PEDIDO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_processo_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_processo_TP_PROCESSO: TStringField
      FieldName = 'TP_PROCESSO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_processo_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      OnChange = qry_processo_TP_ESTUFAGEMChange
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_processo_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_processo_TP_CARGA: TStringField
      FieldName = 'TP_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_processo_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_processo_NM_IMP: TStringField
      FieldName = 'NM_IMP'
      FixedChar = True
      Size = 50
    end
    object qry_processo_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_processo_NM_CIA: TStringField
      FieldName = 'NM_CIA'
      FixedChar = True
      Size = 60
    end
    object qry_processo_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 50
    end
    object qry_processo_NM_MOEDA: TStringField
      DisplayWidth = 6
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_processo_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_processo_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_processo_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 12
      Calculated = True
    end
    object qry_processo_AP_DESTINO: TStringField
      FieldName = 'AP_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_processo_AP_ORIGEM: TStringField
      FieldName = 'AP_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_processo_calc_tp_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_processo'
      Size = 1
      Calculated = True
    end
    object qry_processo_IN_ROUTING: TStringField
      FieldName = 'IN_ROUTING'
      FixedChar = True
      Size = 1
    end
    object qry_processo_Look_tp_incoterm: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_incoterm'
      LookupDataSet = qry_incoterm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CODIGO'
      KeyFields = 'CD_INCOTERM'
      Size = 3
      Lookup = True
    end
    object qry_processo_Look_tp_frete: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_frete'
      LookupDataSet = qry_tp_frete_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TP_FRETE'
      Size = 12
      Lookup = True
    end
    object qry_processo_IN_PEDIDO: TStringField
      FieldName = 'IN_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_IN_CUBAGEM: TStringField
      FieldName = 'IN_CUBAGEM'
      OnChange = qry_processo_IN_CUBAGEMChange
      FixedChar = True
      Size = 1
    end
    object qry_processo_QTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
      DisplayFormat = '00'
    end
    object qry_processo_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      DisplayFormat = '0.000'
    end
    object qry_processo_CUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
      OnChange = qry_processo_CUBAGEMChange
      DisplayFormat = '0.000'
    end
    object qry_processo_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
      OnChange = qry_processo_CHARGEABLEChange
    end
    object qry_processo_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_processo_VL_TARIFA_FRETE: TFloatField
      FieldName = 'VL_TARIFA_FRETE'
    end
    object qry_processo_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object qry_processo_VL_HOUSE: TFloatField
      FieldName = 'VL_HOUSE'
    end
    object qry_processo_VL_OTHER_CHARGE: TFloatField
      FieldName = 'VL_OTHER_CHARGE'
    end
    object qry_processo_VL_RATEIO: TFloatField
      FieldName = 'VL_RATEIO'
    end
    object qry_processo_CD_TAB_FRETE_VENDA: TStringField
      FieldName = 'CD_TAB_FRETE_VENDA'
      FixedChar = True
      Size = 5
    end
    object qry_processo_AP_CIDADE_ORIGEM: TStringField
      FieldName = 'AP_CIDADE_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_processo_AP_CIDADE_DESTINO: TStringField
      FieldName = 'AP_CIDADE_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_processo_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_processo_REF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      FixedChar = True
    end
    object qry_processo_DESCR_MERCADORIA: TStringField
      FieldName = 'DESCR_MERCADORIA'
      FixedChar = True
      Size = 100
    end
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, CD_UNID_NEG,'
      
        '(SELECT TU.NM_UNID_NEG FROM TUNID_NEG TU WHERE TU.CD_UNID_NEG =U' +
        'H.CD_UNID_NEG)NM_UNID_NEG,'
      
        'CD_PRODUTO,(SELECT TP.NM_PRODUTO FROM TPRODUTO TP WHERE TP.CD_PR' +
        'ODUTO = UH.CD_PRODUTO)NM_PRODUTO'
      ' FROM TUSUARIO_HABILITACAO UH'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39
      ' ')
    Left = 256
    Top = 160
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_traz_default_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 48
    Top = 24
  end
  object qry_tp_frete_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTP_FRETE')
    Left = 256
    Top = 56
    object qry_tp_frete_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTP_FRETE.CODIGO'
      FixedChar = True
      Size = 1
    end
    object qry_tp_frete_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TTP_FRETE.DESCRICAO'
      FixedChar = True
      Size = 30
    end
  end
  object qry_incoterm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TINCOTERMS_VENDA')
    Left = 256
    Top = 208
    object qry_incoterm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TINCOTERMS_VENDA.CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_incoterm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TINCOTERMS_VENDA.DESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qry_incoterm_SINAL: TStringField
      FieldName = 'SINAL'
      Origin = 'DBBROKER.TINCOTERMS_VENDA.SINAL'
      FixedChar = True
      Size = 1
    end
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 152
    Top = 192
  end
  object qry_processo_carga_: TQuery
    CachedUpdates = True
    BeforePost = qry_processo_carga_BeforePost
    AfterPost = qry_processo_carga_AfterPost
    AfterDelete = qry_processo_carga_AfterDelete
    OnCalcFields = qry_processo_carga_CalcFields
    OnNewRecord = qry_processo_carga_NewRecord
    OnUpdateError = qry_proc_cntr_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TI.NR_PROCESSO, TI.CD_CARGA, TI.QTDE, TI.VL_COMPR, TI.VL_' +
        'LARG, TI.CD_VIA_TRANSP, TI.TP_ESTUFAGEM,'
      
        '    TI.VL_ALT, TI.PESO_KG, TI.CUBAGEM_VENDA, TI.PESO_VOLUMETRICO' +
        ', TI.VL_VENDA,  TI.PESO_TON,'
      
        '    TI.TP_EMBALAGEM, (SELECT TE.NM_EMBALAGEM_S FROM TEMBALAGEM T' +
        'E WHERE TE.CD_EMBALAGEM = TI.TP_EMBALAGEM)NM_EMBALAGEM'
      '     FROM TINSTRUCAO_CARGA TI'
      '       WHERE TI.NR_PROCESSO=:NR_PROCESSO'
      ' ')
    UpdateObject = UpDate_proc_carga
    Left = 152
    Top = 272
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_carga_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.NR_PROCESSO'
      FixedChar = True
    end
    object qry_processo_carga_CD_CARGA: TStringField
      FieldName = 'CD_CARGA'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.CD_CARGA'
      FixedChar = True
      Size = 3
    end
    object qry_processo_carga_QTDE: TFloatField
      FieldName = 'QTDE'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.QTDE'
      OnChange = qry_processo_carga_QTDEChange
    end
    object qry_processo_carga_VL_COMPR: TFloatField
      FieldName = 'VL_COMPR'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.VL_COMPR'
      OnChange = qry_processo_carga_QTDEChange
      DisplayFormat = '#0,.00'
      EditFormat = '0.00'
    end
    object qry_processo_carga_VL_LARG: TFloatField
      FieldName = 'VL_LARG'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.VL_LARG'
      OnChange = qry_processo_carga_QTDEChange
      DisplayFormat = '#0,.00'
      EditFormat = '0.00'
    end
    object qry_processo_carga_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_processo_carga_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_processo_carga_VL_ALT: TFloatField
      FieldName = 'VL_ALT'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.VL_ALT'
      OnChange = qry_processo_carga_QTDEChange
      DisplayFormat = '#0,.00'
      EditFormat = '0.00'
    end
    object qry_processo_carga_PESO_KG: TFloatField
      FieldName = 'PESO_KG'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.PESO_KG'
      OnChange = qry_processo_carga_PESO_KGChange
      DisplayFormat = '0.000'
    end
    object qry_processo_carga_CUBAGEM_VENDA: TFloatField
      FieldName = 'CUBAGEM_VENDA'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.CUBAGEM_VENDA'
      OnChange = qry_processo_carga_QTDEChange
      DisplayFormat = '0.000'
    end
    object qry_processo_carga_PESO_VOLUMETRICO: TFloatField
      FieldName = 'PESO_VOLUMETRICO'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.PESO_VOLUMETRICO'
      OnChange = qry_processo_carga_PESO_KGChange
      DisplayFormat = '0.000'
    end
    object qry_processo_carga_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.VL_VENDA'
      DisplayFormat = '#0,.00'
      EditFormat = '0.00'
    end
    object qry_processo_carga_PESO_TON: TFloatField
      FieldName = 'PESO_TON'
      OnChange = qry_processo_carga_PESO_KGChange
      DisplayFormat = '0.000'
    end
    object qry_processo_carga_TP_EMBALAGEM: TStringField
      FieldName = 'TP_EMBALAGEM'
      OnChange = qry_processo_carga_TP_EMBALAGEMChange
      FixedChar = True
      Size = 4
    end
    object qry_processo_carga_NM_EMBALAGEM: TStringField
      FieldName = 'NM_EMBALAGEM'
      FixedChar = True
      Size = 50
    end
    object qry_processo_carga_calcEMBALAGEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcEMBALAGEM'
      Size = 100
      Calculated = True
    end
  end
  object ds_processo_carga: TDataSource
    DataSet = qry_processo_carga_
    Left = 152
    Top = 288
  end
  object UpDAte_processo: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_MOEDA_FRETE = :CD_MOEDA_FRETE,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  VL_PESO_BRUTO = :VL_PESO_BRUTO,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  TP_PROCESSO = :TP_PROCESSO,'
      '  TP_FRETE = :TP_FRETE,'
      '  CD_EMP_EST = :CD_EMP_EST,'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  TP_CARGA = :TP_CARGA,'
      '  CD_ORIGEM = :CD_ORIGEM,'
      '  CD_DESTINO = :CD_DESTINO,'
      '  CD_TAB_FRETE_VENDA = :CD_TAB_FRETE_VENDA,'
      '  CD_CIA_TRANSP = :CD_CIA_TRANSP,'
      '  CD_ARMADOR = :CD_ARMADOR,'
      '  IN_ROUTING = :IN_ROUTING,'
      '  QTD_VOLUME = :QTD_VOLUME,'
      '  CUBAGEM = :CUBAGEM,'
      '  CHARGEABLE = :CHARGEABLE,'
      '  IN_CUBAGEM = :IN_CUBAGEM,'
      '  VL_TARIFA_FRETE = :VL_TARIFA_FRETE,'
      '  VL_OTHER_CHARGE = :VL_OTHER_CHARGE,'
      '  VL_FRETE = :VL_FRETE,'
      '  VL_HOUSE = :VL_HOUSE,'
      '  VL_RATEIO = :VL_RATEIO,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  IN_PEDIDO = :IN_PEDIDO,'
      '  REF_CLIENTE = :REF_CLIENTE,'
      '  DESCR_MERCADORIA = :DESCR_MERCADORIA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO'
      
        '  (NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_SERVICO,' +
        ' CD_MOEDA_FRETE, '
      
        '   CD_AGENTE, VL_PESO_BRUTO, CD_INCOTERM, TP_PROCESSO, TP_FRETE,' +
        ' CD_EMP_EST, '
      
        '   NR_PROPOSTA, TP_CARGA, CD_ORIGEM, CD_DESTINO, CD_TAB_FRETE_VE' +
        'NDA, CD_CIA_TRANSP, '
      
        '   CD_ARMADOR, IN_ROUTING, QTD_VOLUME, CUBAGEM, CHARGEABLE, IN_C' +
        'UBAGEM, '
      
        '   VL_TARIFA_FRETE, VL_OTHER_CHARGE, VL_FRETE, VL_HOUSE, VL_RATE' +
        'IO, TP_ESTUFAGEM, '
      '   IN_PEDIDO, REF_CLIENTE, DESCR_MERCADORIA)'
      'values'
      
        '  (:NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_CLIENTE, :CD_SER' +
        'VICO, :CD_MOEDA_FRETE, '
      
        '   :CD_AGENTE, :VL_PESO_BRUTO, :CD_INCOTERM, :TP_PROCESSO, :TP_F' +
        'RETE, :CD_EMP_EST, '
      
        '   :NR_PROPOSTA, :TP_CARGA, :CD_ORIGEM, :CD_DESTINO, :CD_TAB_FRE' +
        'TE_VENDA, '
      
        '   :CD_CIA_TRANSP, :CD_ARMADOR, :IN_ROUTING, :QTD_VOLUME, :CUBAG' +
        'EM, :CHARGEABLE, '
      
        '   :IN_CUBAGEM, :VL_TARIFA_FRETE, :VL_OTHER_CHARGE, :VL_FRETE, :' +
        'VL_HOUSE, '
      
        '   :VL_RATEIO, :TP_ESTUFAGEM, :IN_PEDIDO, :REF_CLIENTE, :DESCR_M' +
        'ERCADORIA)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 48
    Top = 40
  end
  object UpDate_proc_carga: TUpdateSQL
    ModifySQL.Strings = (
      'update TINSTRUCAO_CARGA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_CARGA = :CD_CARGA,'
      '  QTDE = :QTDE,'
      '  VL_COMPR = :VL_COMPR,'
      '  VL_LARG = :VL_LARG,'
      '  VL_ALT = :VL_ALT,'
      '  PESO_KG = :PESO_KG,'
      '  CUBAGEM_VENDA = :CUBAGEM_VENDA,'
      '  PESO_VOLUMETRICO = :PESO_VOLUMETRICO,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  TP_EMBALAGEM = :TP_EMBALAGEM,'
      '  PESO_TON = :PESO_TON,'
      '  VL_VENDA = :VL_VENDA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CARGA = :OLD_CD_CARGA')
    InsertSQL.Strings = (
      'insert into TINSTRUCAO_CARGA'
      
        '  (NR_PROCESSO, CD_CARGA, QTDE, VL_COMPR, VL_LARG, VL_ALT, PESO_' +
        'KG, CUBAGEM_VENDA, '
      
        '   PESO_VOLUMETRICO, CD_VIA_TRANSP, TP_ESTUFAGEM, TP_EMBALAGEM, ' +
        'PESO_TON, '
      '   VL_VENDA)'
      'values'
      
        '  (:NR_PROCESSO, :CD_CARGA, :QTDE, :VL_COMPR, :VL_LARG, :VL_ALT,' +
        ' :PESO_KG, '
      
        '   :CUBAGEM_VENDA, :PESO_VOLUMETRICO, :CD_VIA_TRANSP, :TP_ESTUFA' +
        'GEM, :TP_EMBALAGEM, '
      '   :PESO_TON, :VL_VENDA)')
    DeleteSQL.Strings = (
      'delete from TINSTRUCAO_CARGA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CARGA = :OLD_CD_CARGA')
    Left = 152
    Top = 304
  end
  object qry_ult_proc_carga_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT MAX(CD_CARGA) ULTIMO FROM TINSTRUCAO_CARGA '
      'WHERE NR_PROCESSO=:NR_PROCESSO')
    Left = 256
    Top = 304
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ult_proc_carga_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.CD_CARGA'
      FixedChar = True
      Size = 3
    end
  end
  object qry_via_transp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TVIA_TRANSP_BROKER'
      'WHERE CD_VIA_TRANSP =:CD_VIA_TRANSP')
    Left = 256
    Top = 256
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end>
    object qry_via_transp_CONSTANTE_CUBAGEM: TFloatField
      FieldName = 'CONSTANTE_CUBAGEM'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.CONSTANTE_CUBAGEM'
    end
  end
  object qry_conhecimento_: TQuery
    CachedUpdates = True
    AfterPost = qry_conhecimento_AfterPost
    AfterDelete = qry_conhecimento_AfterDelete
    OnUpdateError = qry_proc_cntr_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TH.NR_MASTER, TM.NR_VOO,TM.DT_PREV_SAIDA, TM.CD_MASTER, T' +
        'M.CD_PRODUTO, TH.NR_HOUSE, TM.NR_BOOKING,'
      
        '  TM.CD_UNID_NEG, TM.CD_VIA_TRANSP, TM.CHARG_MASTER, TM.VOL_MAST' +
        'ER, TM.TARIFA_CUSTO, TM.DT_DEAD_LINE,'
      
        '  TM.CD_VEICULO, (SELECT TV.NM_EMBARCACAO FROM TEMBARCACAO TV WH' +
        'ERE TV.CD_EMBARCACAO = TM.CD_VEICULO)NM_VEICULO,'
      
        '  TM.CD_ARMAZEM_ATRACACAO, TM.CD_ARMAZEM_DESCARGA, TM.CD_NOTIFIC' +
        'ADOR,'
      
        '  (SELECT TA.NM_ARMAZEM FROM TARMAZEM TA WHERE TA.CD_ARMAZEM = T' +
        'M.CD_ARMAZEM_ATRACACAO)NM_ARMAZEM_RETIRADA,'
      
        '  (SELECT TA.NM_ARMAZEM FROM TARMAZEM TA WHERE TA.CD_ARMAZEM = T' +
        'M.CD_ARMAZEM_DESCARGA)NM_ARMAZEM_DESCARGA,'
      
        '  (SELECT TN.NM_NOTIFICADOR FROM TNOTIFICADOR TN WHERE TN.CD_NOT' +
        'IFICADOR = TM.CD_NOTIFICADOR)NM_NOTIFICADOR'
      '  FROM THOUSE TH, TMASTER TM'
      ''
      
        '  WHERE TM.CD_MASTER = TH.CD_MASTER AND TH.NR_PROCESSO=:NR_PROCE' +
        'SSO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDate_conhecimento
    Left = 48
    Top = 96
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_conhecimento_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      Origin = 'DBBROKER.THOUSE.NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_conhecimento_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      Origin = 'DBBROKER.TMASTER.NR_VOO'
      FixedChar = True
      Size = 14
    end
    object qry_conhecimento_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      Origin = 'DBBROKER.TMASTER.CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_conhecimento_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TMASTER.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimento_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TMASTER.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimento_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.TMASTER.CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimento_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      Origin = 'DBBROKER.THOUSE.NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_conhecimento_CHARG_MASTER: TFloatField
      FieldName = 'CHARG_MASTER'
      Origin = 'DBBROKER.TMASTER.CHARG_MASTER'
    end
    object qry_conhecimento_VOL_MASTER: TFloatField
      FieldName = 'VOL_MASTER'
      Origin = 'DBBROKER.TMASTER.VOL_MASTER'
    end
    object qry_conhecimento_TARIFA_CUSTO: TFloatField
      FieldName = 'TARIFA_CUSTO'
      Origin = 'DBBROKER.TMASTER.TARIFA_CUSTO'
    end
    object qry_conhecimento_NR_BOOKING: TStringField
      FieldName = 'NR_BOOKING'
      FixedChar = True
      Size = 30
    end
    object qry_conhecimento_DT_PREV_SAIDA: TDateTimeField
      FieldName = 'DT_PREV_SAIDA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_conhecimento_DT_DEAD_LINE: TDateTimeField
      FieldName = 'DT_DEAD_LINE'
      EditMask = '99\/00\/0000\ 99\:99 ;1;_'
    end
    object qry_conhecimento_CD_VEICULO: TStringField
      FieldName = 'CD_VEICULO'
      FixedChar = True
      Size = 4
    end
    object qry_conhecimento_NM_VEICULO: TStringField
      FieldName = 'NM_VEICULO'
      FixedChar = True
      Size = 40
    end
    object qry_conhecimento_CD_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'CD_ARMAZEM_ATRACACAO'
      FixedChar = True
      Size = 4
    end
    object qry_conhecimento_CD_ARMAZEM_DESCARGA: TStringField
      FieldName = 'CD_ARMAZEM_DESCARGA'
      FixedChar = True
      Size = 4
    end
    object qry_conhecimento_NM_ARMAZEM_RETIRADA: TStringField
      FieldName = 'NM_ARMAZEM_RETIRADA'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimento_NM_ARMAZEM_DESCARGA: TStringField
      FieldName = 'NM_ARMAZEM_DESCARGA'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimento_CD_NOTIFICADOR: TStringField
      FieldName = 'CD_NOTIFICADOR'
      FixedChar = True
      Size = 4
    end
    object qry_conhecimento_NM_NOTIFICADOR: TStringField
      FieldName = 'NM_NOTIFICADOR'
      FixedChar = True
      Size = 50
    end
  end
  object ds_conhecimento: TDataSource
    DataSet = qry_conhecimento_
    Left = 48
    Top = 112
  end
  object UpDate_conhecimento: TUpdateSQL
    ModifySQL.Strings = (
      'update TMASTER'
      'set'
      '  CD_MASTER = :CD_MASTER,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  NR_MASTER = :NR_MASTER,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  DT_PREV_SAIDA = :DT_PREV_SAIDA,'
      '  NR_VOO = :NR_VOO,'
      '  VOL_MASTER = :VOL_MASTER,'
      '  CHARG_MASTER = :CHARG_MASTER,'
      '  CD_VEICULO = :CD_VEICULO,'
      '  CD_NOTIFICADOR = :CD_NOTIFICADOR,'
      '  TARIFA_CUSTO = :TARIFA_CUSTO,'
      '  CD_ARMAZEM_ATRACACAO = :CD_ARMAZEM_ATRACACAO,'
      '  CD_ARMAZEM_DESCARGA = :CD_ARMAZEM_DESCARGA,'
      '  nr_booking = :nr_booking,'
      '  DT_DEAD_LINE = :DT_DEAD_LINE'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_VIA_TRANSP = :OLD_CD_VIA_TRANSP')
    InsertSQL.Strings = (
      'insert into TMASTER'
      
        '  (CD_MASTER, CD_UNID_NEG, CD_PRODUTO, NR_MASTER, CD_VIA_TRANSP,' +
        ' DT_PREV_SAIDA, '
      
        '   NR_VOO, VOL_MASTER, CHARG_MASTER, CD_VEICULO, CD_NOTIFICADOR,' +
        ' TARIFA_CUSTO, '
      
        '   CD_ARMAZEM_ATRACACAO, CD_ARMAZEM_DESCARGA, nr_booking, DT_DEA' +
        'D_LINE)'
      'values'
      
        '  (:CD_MASTER, :CD_UNID_NEG, :CD_PRODUTO, :NR_MASTER, :CD_VIA_TR' +
        'ANSP, :DT_PREV_SAIDA, '
      
        '   :NR_VOO, :VOL_MASTER, :CHARG_MASTER, :CD_VEICULO, :CD_NOTIFIC' +
        'ADOR, :TARIFA_CUSTO, '
      
        '   :CD_ARMAZEM_ATRACACAO, :CD_ARMAZEM_DESCARGA, :nr_booking, :DT' +
        '_DEAD_LINE)')
    DeleteSQL.Strings = (
      'delete from TMASTER'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_VIA_TRANSP = :OLD_CD_VIA_TRANSP')
    Left = 48
    Top = 128
  end
  object qry_tab_frete_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TAB_FRETE, PESO_TAB_FRETE, VL_VENDA_TAB_FRETE, VL_COMP' +
        'RA_TAB_FRETE,'
      'TP_ESTUFAGEM, TTIPO_SIMBOLO_TAB_FRETE FROM TPROPOSTA_FRETE_ITEM'
      
        '  WHERE CD_TAB_FRETE=:CD_TAB_FRETE AND NR_PROPOSTA = :NR_PROPOST' +
        'A'
      '     AND CD_SERVICO =:CD_SERVICO AND CD_PRODUTO=:CD_PRODUTO'
      '     ORDER BY PESO_TAB_FRETE'
      ''
      ' '
      ' '
      ' ')
    Left = 256
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
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
      end>
    object qry_tab_frete_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_TAB_FRETE'
      FixedChar = True
      Size = 6
    end
    object qry_tab_frete_PESO_TAB_FRETE: TFloatField
      FieldName = 'PESO_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.PESO_TAB_FRETE'
    end
    object qry_tab_frete_VL_VENDA_TAB_FRETE: TFloatField
      FieldName = 'VL_VENDA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_VENDA_TAB_FRETE'
    end
    object qry_tab_frete_VL_COMPRA_TAB_FRETE: TFloatField
      FieldName = 'VL_COMPRA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_TAB_FRETE'
    end
    object qry_tab_frete_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_tab_frete_TTIPO_SIMBOLO_TAB_FRETE: TStringField
      FieldName = 'TTIPO_SIMBOLO_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TTIPO_SIMBOLO_TAB_FRETE'
      FixedChar = True
      Size = 15
    end
  end
  object qry_proc_cntr_: TQuery
    CachedUpdates = True
    BeforePost = qry_proc_cntr_BeforePost
    AfterPost = qry_proc_cntr_AfterPost
    AfterDelete = qry_proc_cntr_AfterDelete
    OnCalcFields = qry_proc_cntr_CalcFields
    OnNewRecord = qry_proc_cntr_NewRecord
    OnUpdateError = qry_proc_cntr_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_CNTR, CODIGO,  TP_CNTR, NR_LACRE, VL_VEND' +
        'A, VL_CUBAGEM,'
      '   VL_PESO_TON,  TP_FRETE, VL_CUSTO_TOTAL  FROM TPROCESSO_CNTR'
      '   WHERE NR_PROCESSO = :NR_PROCESSO'
      ' '
      ' '
      ' ')
    UpdateObject = UpDate_proc_cntr
    Left = 48
    Top = 272
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_cntr_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_CNTR.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_proc_cntr_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      Origin = 'DBBROKER.TPROCESSO_CNTR.NR_CNTR'
      EditMask = '!AAAA 000000-0;1;_'
      FixedChar = True
    end
    object qry_proc_cntr_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TPROCESSO_CNTR.CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_proc_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'DBBROKER.TPROCESSO_CNTR.TP_CNTR'
      OnChange = qry_proc_cntr_TP_CNTRChange
      FixedChar = True
      Size = 2
    end
    object qry_proc_cntr_NR_LACRE: TStringField
      FieldName = 'NR_LACRE'
      Origin = 'DBBROKER.TPROCESSO_CNTR.NR_LACRE'
      FixedChar = True
    end
    object qry_proc_cntr_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TPROCESSO_CNTR.VL_VENDA'
      OnChange = qry_proc_cntr_VL_PESO_TONChange
    end
    object qry_proc_cntr_VL_PESO_TON: TFloatField
      FieldName = 'VL_PESO_TON'
      Origin = 'DBBROKER.TPROCESSO_CNTR.VL_PESO_TON'
      OnChange = qry_proc_cntr_VL_PESO_TONChange
      DisplayFormat = '0.000'
    end
    object qry_proc_cntr_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TPROCESSO_CNTR.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_proc_cntr_Look_nm_cntr: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_cntr'
      LookupDataSet = qry_cntr_
      LookupKeyFields = 'TP_CNTR'
      LookupResultField = 'NM_TP_CNTR'
      KeyFields = 'TP_CNTR'
      Size = 15
      Lookup = True
    end
    object qry_proc_cntr_VL_CUSTO_TOTAL: TFloatField
      FieldName = 'VL_CUSTO_TOTAL'
      Origin = 'DBBROKER.TPROCESSO_CNTR.VL_CUSTO_TOTAL'
    end
    object qry_proc_cntr_VL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
      Origin = 'DBBROKER.TPROCESSO_CNTR.VL_CUBAGEM'
      OnChange = qry_proc_cntr_VL_PESO_TONChange
      DisplayFormat = '0.000'
    end
    object qry_proc_cntr_calcNomeCNTR: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNomeCNTR'
      Size = 100
      Calculated = True
    end
  end
  object ds_proc_cntr: TDataSource
    DataSet = qry_proc_cntr_
    Left = 48
    Top = 288
  end
  object UpDate_proc_cntr: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_CNTR'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_CNTR = :NR_CNTR,'
      '  CODIGO = :CODIGO,'
      '  TP_CNTR = :TP_CNTR,'
      '  NR_LACRE = :NR_LACRE,'
      '  VL_VENDA = :VL_VENDA,'
      '  VL_CUBAGEM = :VL_CUBAGEM,'
      '  VL_PESO_TON = :VL_PESO_TON,'
      '  TP_FRETE = :TP_FRETE,'
      '  VL_CUSTO_TOTAL = :VL_CUSTO_TOTAL'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TPROCESSO_CNTR'
      
        '  (NR_PROCESSO, NR_CNTR, CODIGO, TP_CNTR, NR_LACRE, VL_VENDA, VL' +
        '_CUBAGEM, '
      '   VL_PESO_TON, TP_FRETE, VL_CUSTO_TOTAL)'
      'values'
      
        '  (:NR_PROCESSO, :NR_CNTR, :CODIGO, :TP_CNTR, :NR_LACRE, :VL_VEN' +
        'DA, :VL_CUBAGEM, '
      '   :VL_PESO_TON, :TP_FRETE, :VL_CUSTO_TOTAL)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_CNTR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CODIGO = :OLD_CODIGO')
    Left = 48
    Top = 304
  end
  object qry_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP_CNTR, NM_TP_CNTR FROM TTP_CNTR')
    Left = 256
    Top = 106
    object qry_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'DBBROKER.TTP_CNTR.TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qry_cntr_NM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
      Origin = 'DBBROKER.TTP_CNTR.NM_TP_CNTR'
      FixedChar = True
    end
  end
  object qry_ult_proc_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      
        'SELECT MAX(CODIGO) ULTIMO  FROM TPROCESSO_CNTR WHERE NR_PROCESSO' +
        '=:NR_PROCESSO'
      ' ')
    Left = 256
    Top = 352
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ult_proc_cntr_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROCESSO_CNTR.CODIGO'
      FixedChar = True
      Size = 3
    end
  end
  object qry_rel_pedido_instr_: TQuery
    OnCalcFields = qry_rel_pedido_instr_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.CD_UNID_NEG, TP.CD_CLIENTE, TN.NM_EMPR' +
        'ESA AS NM_CLIENTE, TN.END_EMPRESA AS END_CLIENTE,'
      
        '  TN.END_NUMERO AS NUMERO_CLIENTE, TN.END_CIDADE AS CIDADE_CLIEN' +
        'TE, TN.END_BAIRRO AS BAIRRO_CLIENTE,'
      
        '  TN.END_COMPL AS COMPL_CLIENTE, TN.END_UF AS UF_CLIENTE, TN.END' +
        '_CEP AS CEP_CLIENTE,'
      '  TN.NR_TELEFONE AS FONE_CLIENTE, TN.NR_FAX AS FAX_CLIENTE,'
      
        '  TP.CD_EMP_EST AS CD_EXP, TE.NM_EMPRESA AS NM_EXP, TE.END_EMPRE' +
        'SA AS END_EXP, TE.END_NUMERO AS NUMERO_EXP,'
      
        '  TE.END_COMPL AS COMPL_EXP, TE.END_CIDADE AS CIADDE_EXP, TE.NR_' +
        'TELEFONE AS FONE_EXP, TE.NR_FAX AS FAX_EXP,'
      
        '  TP.CD_ORIGEM, TOR.CD_SIGLA AS SIGLA_ORIGEM, TOR.NM_PORTO AS NM' +
        '_ORIGEM, TOR.CD_SIGLA_CIDADE AS SIGLA_CID_ORIGEM,'
      
        '  TP.CD_DESTINO, TDE.CD_SIGLA  AS SIGLA_DESTINO, TDE.NM_PORTO AS' +
        ' NM_DESTINO, TDE.CD_SIGLA_CIDADE AS SIGLA_CID_DESTINO,'
      
        '  TP.CD_AGENTE, TA.NM_AGENTE, TA.DS_ENDERECO, TA.NR_FONE, TA.NR_' +
        'FAX,'
      
        '  TP.CD_CIA_TRANSP, TCIA.DESCRICAO AS NM_CIA,TP.CD_ARMADOR, TAR.' +
        'DESCRICAO AS NM_ARMADOR,'
      
        '  TP.CD_MOEDA_FRETE, TM.AP_MOEDA, TM.NM_MOEDA, TP.DESCR_MERCADOR' +
        'IA,'
      
        '  TP.CD_INCOTERM,(SELECT TI.DESCRICAO FROM TINCOTERMS_VENDA TI W' +
        'HERE TI.CODIGO = TP.CD_INCOTERM)NM_INCOTERM,'
      
        '  TP.TP_CARGA, TP.QTD_VOLUME, TP.VL_PESO_BRUTO, TP.CUBAGEM, TP.C' +
        'HARGEABLE, TP.VL_TARIFA_FRETE, TP.VL_FRETE,'
      
        '  TU.NM_UNID_NEG, TU.END_UNID_NEG, TU.END_NUMERO AS NUMERO_UNID,' +
        ' TU.END_COMPL AS COMPL_UNID,'
      
        '  TU.END_BAIRRO AS BAIRRO_UNID, TU.END_CIDADE AS CIDADE_UNID, TU' +
        '.END_UF AS UF_UNID, TU.NR_FONE AS FONE_UNID,'
      
        '  TU.NR_FAX1 AS FAX_UNID, TU.END_CEP AS CEP_UNID, TMA.NR_BOOKING' +
        ','
      
        '  TMA.CD_VEICULO, TMA.CD_ARMAZEM_ATRACACAO, TMA.CD_ARMAZEM_DESCA' +
        'RGA, TMA.DT_DEAD_LINE, TMA.DT_PREV_SAIDA,'
      
        '  TAA.END_ARMAZEM AS END_ARMAZEM_ATRACACAO, TAA.NR_TELEFONE AS F' +
        'ONE_ARMAZEM_ATRACACAO,'
      
        '  TAA.NM_ARMAZEM AS NM_ARM_ATRACACAO, TAA.NM_CONTATO AS CONTATO_' +
        'ARM_ATRACACAO, TAA.NR_FAX AS FAX_ARM_ATRACACAO,'
      
        '  TAD.NM_ARMAZEM AS NM_ARM_ENTREGA, TAD.END_ARMAZEM AS END_ARMAZ' +
        'EM_ENTREGA, TAD.NR_TELEFONE AS FONE_ARM_ENTREGA,'
      
        '   TAD.NM_CONTATO AS CONTATO_ARM_ENTREGA, TAD.NR_FAX AS FAX_ARM_' +
        'ENTREGA,'
      
        '  (SELECT TL.DESCRICAO FROM TLOCAL_EMBARQUE TL WHERE TL.CODIGO =' +
        ' TAA.CD_CIDADE)CIDADE_ARM_ATRACACAO,'
      
        '  (SELECT TL.DESCRICAO FROM TLOCAL_EMBARQUE TL WHERE TL.CODIGO =' +
        ' TAD.CD_CIDADE)CIDADE_ARM_ENTREGA,'
      
        '(SELECT TV.NM_EMBARCACAO FROM TEMBARCACAO TV WHERE TV.CD_EMBARCA' +
        'CAO = TMA.CD_VEICULO)NM_VEICULO'
      '   FROM TPROCESSO TP'
      '  LEFT JOIN THOUSE TH ON (TH.NR_PROCESSO = TP.NR_PROCESSO)'
      '  LEFT JOIN TMASTER TMA ON (TMA.CD_MASTER = TH.CD_MASTER)'
      '  LEFT JOIN TEMPRESA_NAC TN ON(TN.CD_EMPRESA = TP.CD_CLIENTE)'
      '  LEFT JOIN TEMPRESA_EST TE ON(TE.CD_EMPRESA = TP.CD_EMP_EST)'
      '  LEFT JOIN TPORTO TOR ON(TOR.CD_PORTO = TP.CD_ORIGEM)'
      '  LEFT JOIN TPORTO TDE ON(TDE.CD_PORTO = TP.CD_DESTINO)'
      '  LEFT JOIN TAGENTE TA ON(TA.CD_AGENTE = TP.CD_AGENTE)'
      
        '  LEFT JOIN TTRANSPORTADOR_ITL TCIA ON(TCIA.CODIGO = TP.CD_CIA_T' +
        'RANSP)'
      
        '  LEFT JOIN TTRANSPORTADOR_ITL TAR ON(TAR.CODIGO = TP.CD_ARMADOR' +
        ')'
      '  LEFT JOIN TMOEDA_BROKER TM ON(TM.CD_MOEDA = TP.CD_MOEDA_FRETE)'
      '  LEFT JOIN TUNID_NEG TU ON (TU.CD_UNID_NEG = TP.CD_UNID_NEG)'
      
        '  LEFT JOIN TARMAZEM TAA ON (TAA.CD_ARMAZEM = TMA.CD_ARMAZEM_ATR' +
        'ACACAO)'
      
        '  LEFT JOIN TARMAZEM TAD ON (TAD.CD_ARMAZEM = TMA.CD_ARMAZEM_DES' +
        'CARGA)'
      '  WHERE TP.NR_PROCESSO =:NR_PROCESSO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 184
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_rel_pedido_instr_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_rel_pedido_instr_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_rel_pedido_instr_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_END_CLIENTE: TStringField
      FieldName = 'END_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_NUMERO_CLIENTE: TStringField
      FieldName = 'NUMERO_CLIENTE'
      FixedChar = True
      Size = 6
    end
    object qry_rel_pedido_instr_CIDADE_CLIENTE: TStringField
      FieldName = 'CIDADE_CLIENTE'
      FixedChar = True
      Size = 30
    end
    object qry_rel_pedido_instr_BAIRRO_CLIENTE: TStringField
      FieldName = 'BAIRRO_CLIENTE'
      FixedChar = True
      Size = 30
    end
    object qry_rel_pedido_instr_COMPL_CLIENTE: TStringField
      FieldName = 'COMPL_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_UF_CLIENTE: TStringField
      FieldName = 'UF_CLIENTE'
      FixedChar = True
      Size = 2
    end
    object qry_rel_pedido_instr_CEP_CLIENTE: TStringField
      FieldName = 'CEP_CLIENTE'
      FixedChar = True
      Size = 8
    end
    object qry_rel_pedido_instr_FONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 15
    end
    object qry_rel_pedido_instr_FAX_CLIENTE: TStringField
      FieldName = 'FAX_CLIENTE'
      FixedChar = True
      Size = 15
    end
    object qry_rel_pedido_instr_CD_EXP: TStringField
      FieldName = 'CD_EXP'
      FixedChar = True
      Size = 5
    end
    object qry_rel_pedido_instr_NM_EXP: TStringField
      FieldName = 'NM_EXP'
      FixedChar = True
      Size = 60
    end
    object qry_rel_pedido_instr_END_EXP: TStringField
      FieldName = 'END_EXP'
      FixedChar = True
      Size = 60
    end
    object qry_rel_pedido_instr_NUMERO_EXP: TStringField
      FieldName = 'NUMERO_EXP'
      FixedChar = True
      Size = 6
    end
    object qry_rel_pedido_instr_COMPL_EXP: TStringField
      FieldName = 'COMPL_EXP'
      FixedChar = True
      Size = 41
    end
    object qry_rel_pedido_instr_CIADDE_EXP: TStringField
      FieldName = 'CIADDE_EXP'
      FixedChar = True
      Size = 30
    end
    object qry_rel_pedido_instr_FONE_EXP: TStringField
      FieldName = 'FONE_EXP'
      FixedChar = True
      Size = 15
    end
    object qry_rel_pedido_instr_FAX_EXP: TStringField
      FieldName = 'FAX_EXP'
      FixedChar = True
      Size = 15
    end
    object qry_rel_pedido_instr_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pedido_instr_SIGLA_ORIGEM: TStringField
      FieldName = 'SIGLA_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_pedido_instr_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_SIGLA_CID_ORIGEM: TStringField
      FieldName = 'SIGLA_CID_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_pedido_instr_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pedido_instr_SIGLA_DESTINO: TStringField
      FieldName = 'SIGLA_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_rel_pedido_instr_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_SIGLA_CID_DESTINO: TStringField
      FieldName = 'SIGLA_CID_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_rel_pedido_instr_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pedido_instr_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_rel_pedido_instr_DS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      FixedChar = True
      Size = 255
    end
    object qry_rel_pedido_instr_NR_FONE: TStringField
      FieldName = 'NR_FONE'
      FixedChar = True
    end
    object qry_rel_pedido_instr_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
    end
    object qry_rel_pedido_instr_CD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pedido_instr_NM_CIA: TStringField
      FieldName = 'NM_CIA'
      FixedChar = True
      Size = 60
    end
    object qry_rel_pedido_instr_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pedido_instr_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 60
    end
    object qry_rel_pedido_instr_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_rel_pedido_instr_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_rel_pedido_instr_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qry_rel_pedido_instr_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_pedido_instr_NM_INCOTERM: TStringField
      FieldName = 'NM_INCOTERM'
      FixedChar = True
      Size = 60
    end
    object qry_rel_pedido_instr_TP_CARGA: TStringField
      FieldName = 'TP_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_rel_pedido_instr_QTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
    end
    object qry_rel_pedido_instr_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qry_rel_pedido_instr_CUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
    end
    object qry_rel_pedido_instr_calc_nm_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Size = 50
      Calculated = True
    end
    object qry_rel_pedido_instr_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_rel_pedido_instr_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
    end
    object qry_rel_pedido_instr_VL_TARIFA_FRETE: TFloatField
      FieldName = 'VL_TARIFA_FRETE'
    end
    object qry_rel_pedido_instr_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_END_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_NUMERO_UNID: TStringField
      FieldName = 'NUMERO_UNID'
      FixedChar = True
      Size = 6
    end
    object qry_rel_pedido_instr_COMPL_UNID: TStringField
      FieldName = 'COMPL_UNID'
      FixedChar = True
    end
    object qry_rel_pedido_instr_BAIRRO_UNID: TStringField
      FieldName = 'BAIRRO_UNID'
      FixedChar = True
      Size = 30
    end
    object qry_rel_pedido_instr_CIDADE_UNID: TStringField
      FieldName = 'CIDADE_UNID'
      FixedChar = True
      Size = 30
    end
    object qry_rel_pedido_instr_UF_UNID: TStringField
      FieldName = 'UF_UNID'
      FixedChar = True
      Size = 2
    end
    object qry_rel_pedido_instr_FONE_UNID: TStringField
      FieldName = 'FONE_UNID'
      FixedChar = True
    end
    object qry_rel_pedido_instr_FAX_UNID: TStringField
      FieldName = 'FAX_UNID'
      FixedChar = True
    end
    object qry_rel_pedido_instr_CEP_UNID: TStringField
      FieldName = 'CEP_UNID'
      FixedChar = True
      Size = 8
    end
    object qry_rel_pedido_instr_calc_nm_unidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_unidade'
      Size = 255
      Calculated = True
    end
    object qry_rel_pedido_instr_calc_end_cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_cliente'
      Size = 255
      Calculated = True
    end
    object qry_rel_pedido_instr_calc_emp_exp: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_emp_exp'
      Size = 255
      Calculated = True
    end
    object qry_rel_pedido_instr_calc_voo_viagem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_voo_viagem'
      Calculated = True
    end
    object qry_rel_pedido_instr_calc_dt_voo_viagem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_dt_voo_viagem'
      Size = 10
      Calculated = True
    end
    object qry_rel_pedido_instr_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object qry_rel_pedido_instr_DESCR_MERCADORIA: TStringField
      FieldName = 'DESCR_MERCADORIA'
      FixedChar = True
      Size = 100
    end
    object qry_rel_pedido_instr_NR_BOOKING: TStringField
      FieldName = 'NR_BOOKING'
      FixedChar = True
      Size = 30
    end
    object qry_rel_pedido_instr_CD_VEICULO: TStringField
      FieldName = 'CD_VEICULO'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pedido_instr_CD_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'CD_ARMAZEM_ATRACACAO'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pedido_instr_CD_ARMAZEM_DESCARGA: TStringField
      FieldName = 'CD_ARMAZEM_DESCARGA'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pedido_instr_DT_DEAD_LINE: TDateTimeField
      FieldName = 'DT_DEAD_LINE'
    end
    object qry_rel_pedido_instr_DT_PREV_SAIDA: TDateTimeField
      FieldName = 'DT_PREV_SAIDA'
    end
    object qry_rel_pedido_instr_FONE_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'FONE_ARMAZEM_ATRACACAO'
      FixedChar = True
      Size = 15
    end
    object qry_rel_pedido_instr_CONTATO_ARM_ATRACACAO: TStringField
      FieldName = 'CONTATO_ARM_ATRACACAO'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_FAX_ARM_ATRACACAO: TStringField
      FieldName = 'FAX_ARM_ATRACACAO'
      FixedChar = True
      Size = 15
    end
    object qry_rel_pedido_instr_FONE_ARM_ENTREGA: TStringField
      FieldName = 'FONE_ARM_ENTREGA'
      FixedChar = True
      Size = 15
    end
    object qry_rel_pedido_instr_CONTATO_ARM_ENTREGA: TStringField
      FieldName = 'CONTATO_ARM_ENTREGA'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_FAX_ARM_ENTREGA: TStringField
      FieldName = 'FAX_ARM_ENTREGA'
      FixedChar = True
      Size = 15
    end
    object qry_rel_pedido_instr_CIDADE_ARM_ATRACACAO: TStringField
      FieldName = 'CIDADE_ARM_ATRACACAO'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_CIDADE_ARM_ENTREGA: TStringField
      FieldName = 'CIDADE_ARM_ENTREGA'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_NM_VEICULO: TStringField
      FieldName = 'NM_VEICULO'
      FixedChar = True
      Size = 40
    end
    object qry_rel_pedido_instr_END_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'END_ARMAZEM_ATRACACAO'
      FixedChar = True
      Size = 80
    end
    object qry_rel_pedido_instr_NM_ARM_ATRACACAO: TStringField
      FieldName = 'NM_ARM_ATRACACAO'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_NM_ARM_ENTREGA: TStringField
      FieldName = 'NM_ARM_ENTREGA'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pedido_instr_END_ARMAZEM_ENTREGA: TStringField
      FieldName = 'END_ARMAZEM_ENTREGA'
      FixedChar = True
      Size = 80
    end
  end
  object ds_rel_pedido: TDataSource
    DataSet = qry_rel_pedido_instr_
    Left = 48
    Top = 200
  end
  object pp_pedido: TppBDEPipeline
    DataSource = ds_rel_pedido
    UserName = '_pedido'
    Left = 48
    Top = 216
  end
  object pp_carga: TppBDEPipeline
    DataSource = ds_processo_carga
    UserName = 'carga'
    Left = 152
    Top = 320
    object pp_cargappField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pp_cargappField2: TppField
      FieldAlias = 'CD_CARGA'
      FieldName = 'CD_CARGA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 1
    end
    object pp_cargappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pp_cargappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_COMPR'
      FieldName = 'VL_COMPR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pp_cargappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_LARG'
      FieldName = 'VL_LARG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pp_cargappField6: TppField
      FieldAlias = 'CD_VIA_TRANSP'
      FieldName = 'CD_VIA_TRANSP'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
    object pp_cargappField7: TppField
      FieldAlias = 'TP_ESTUFAGEM'
      FieldName = 'TP_ESTUFAGEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object pp_cargappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_ALT'
      FieldName = 'VL_ALT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pp_cargappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PESO_KG'
      FieldName = 'PESO_KG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pp_cargappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUBAGEM_VENDA'
      FieldName = 'CUBAGEM_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pp_cargappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PESO_VOLUMETRICO'
      FieldName = 'PESO_VOLUMETRICO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pp_cargappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pp_cargappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'PESO_TON'
      FieldName = 'PESO_TON'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pp_cargappField14: TppField
      FieldAlias = 'TP_EMBALAGEM'
      FieldName = 'TP_EMBALAGEM'
      FieldLength = 4
      DisplayWidth = 4
      Position = 13
    end
    object pp_cargappField15: TppField
      FieldAlias = 'NM_EMBALAGEM'
      FieldName = 'NM_EMBALAGEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 14
    end
  end
  object pp_cntr: TppBDEPipeline
    DataSource = ds_proc_cntr
    UserName = 'cntr'
    Left = 48
    Top = 320
  end
  object qry_consolidadas_: TQuery
    OnCalcFields = qry_consolidadas_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MASTER, M.CD_UNID_NEG, M.CD_PRODUTO, M.CD_VIA_TRANSP' +
        ', M.NR_MASTER, ISNULL(M.TP_ESTUFAGEM,'#39'0'#39') AS TP_ESTUFAGEM,'
      
        '       M.CD_AGENTE, M.CD_CIA_TRANSP, M.CD_ORIGEM, M.CD_DESTINO, ' +
        'M.CD_MOEDA ,'
      
        '       M.DT_PREV_SAIDA, M.NR_VOO,  M.NR_BOOKING, M.CD_ARMADOR, M' +
        '.CD_VEICULO,'
      
        '       (SELECT U.NM_UNID_NEG FROM TUNID_NEG U WHERE U.CD_UNID_NE' +
        'G = M.CD_UNID_NEG) NM_UNID_NEG,'
      
        '       (SELECT P.NM_PRODUTO  FROM TPRODUTO  P WHERE P.CD_PRODUTO' +
        '  = M.CD_PRODUTO ) NM_PRODUTO,'
      
        '       (SELECT A.NM_AGENTE   FROM TAGENTE   A WHERE A.CD_AGENTE ' +
        '  = M.CD_AGENTE  ) NM_AGENTE,'
      
        '       (SELECT C.DESCRICAO FROM TTRANSPORTADOR_ITL C WHERE C.COD' +
        'IGO  = M.CD_CIA_TRANSP) NM_CIA_TRANSP,'
      
        '       (SELECT C.DESCRICAO FROM TTRANSPORTADOR_ITL C WHERE C.COD' +
        'IGO  = M.CD_ARMADOR) NM_ARMADOR,'
      
        '       (SELECT O.CD_SIGLA    FROM TPORTO    O WHERE O.CD_PORTO  ' +
        '  = M.CD_ORIGEM  ) NM_ORIGEM,'
      
        '       (SELECT D.CD_SIGLA    FROM TPORTO    D WHERE D.CD_PORTO  ' +
        '  = M.CD_DESTINO ) NM_DESTINO,'
      
        '       (SELECT D.CD_SIGLA_CIDADE    FROM TPORTO    D WHERE D.CD_' +
        'PORTO    = M.CD_ORIGEM ) NM_ORIGEM_CID,'
      
        '       (SELECT D.CD_SIGLA_CIDADE    FROM TPORTO    D WHERE D.CD_' +
        'PORTO    = M.CD_DESTINO ) NM_DESTINO_CID,'
      
        '       (SELECT V.AP_MOEDA   FROM TMOEDA_BROKER   V WHERE V.CD_MO' +
        'EDA    = M.CD_MOEDA   ) NM_MOEDA,'
      
        '       (SELECT N.NM_EMBARCACAO   FROM TEMBARCACAO  N WHERE N.CD_' +
        'EMBARCACAO = M.CD_VEICULO   ) NM_EMBARCACAO'
      ''
      '  FROM TMASTER M'
      '   WHERE  M.CD_UNID_NEG = :CD_UNID_NEG'
      '      AND M.CD_PRODUTO  = :CD_PRODUTO'
      '      AND M.CD_VIA_TRANSP = :CD_VIA_TRANSP'
      '      AND M.TP_MASTER     = '#39'1'#39
      '      AND (SELECT COUNT(*) FROM THOUSE H, TPROCESSO P'
      
        '            WHERE H.CD_MASTER = M.CD_MASTER AND H.NR_PROCESSO = ' +
        'P.NR_PROCESSO  AND P.IN_PEDIDO = '#39'0'#39' ) < 2'
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
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 152
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end>
    object qry_consolidadas_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_consolidadas_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_consolidadas_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_consolidadas_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_consolidadas_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 25
    end
    object qry_consolidadas_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_consolidadas_CD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      FixedChar = True
      Size = 4
    end
    object qry_consolidadas_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_consolidadas_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_consolidadas_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_consolidadas_DT_PREV_SAIDA: TDateTimeField
      FieldName = 'DT_PREV_SAIDA'
    end
    object qry_consolidadas_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      FixedChar = True
      Size = 14
    end
    object qry_consolidadas_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_consolidadas_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_consolidadas_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_consolidadas_NM_CIA_TRANSP: TStringField
      FieldName = 'NM_CIA_TRANSP'
      FixedChar = True
      Size = 60
    end
    object qry_consolidadas_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_consolidadas_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_consolidadas_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_consolidadas_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_consolidadas_NM_ORIGEM_CID: TStringField
      FieldName = 'NM_ORIGEM_CID'
      FixedChar = True
      Size = 3
    end
    object qry_consolidadas_NM_DESTINO_CID: TStringField
      FieldName = 'NM_DESTINO_CID'
      FixedChar = True
      Size = 3
    end
    object qry_consolidadas_calc_tp_estufagem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_estufagem'
      Size = 3
      Calculated = True
    end
    object qry_consolidadas_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 60
    end
    object qry_consolidadas_NR_BOOKING: TStringField
      FieldName = 'NR_BOOKING'
      FixedChar = True
      Size = 30
    end
    object qry_consolidadas_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_consolidadas_CD_VEICULO: TStringField
      FieldName = 'CD_VEICULO'
      FixedChar = True
      Size = 4
    end
    object qry_consolidadas_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
  end
  object ds_consolidada: TDataSource
    DataSet = qry_consolidadas_
    Left = 152
    Top = 24
  end
  object qry_houses_: TQuery
    OnCalcFields = qry_houses_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_consolidada
    SQL.Strings = (
      
        'SELECT H.CD_MASTER, H.CD_HOUSE, H.NR_HOUSE, H.NR_PROCESSO, P.CD_' +
        'CLIENTE, P.CHARGEABLE,'
      
        ' (SELECT E.NM_EMPRESA FROM TEMPRESA_NAC E WHERE E.CD_EMPRESA = P' +
        '.CD_CLIENTE) NM_CLIENTE'
      '   FROM THOUSE H'
      '   LEFT JOIN TPROCESSO P ON (P.NR_PROCESSO = H.NR_PROCESSO)'
      '   WHERE CD_MASTER = :CD_MASTER'
      ' '
      ' ')
    Left = 152
    Top = 96
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end>
    object qry_houses_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_houses_CD_HOUSE: TStringField
      FieldName = 'CD_HOUSE'
      FixedChar = True
    end
    object qry_houses_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 14
    end
    object qry_houses_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_houses_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
      DisplayFormat = '0.00'
    end
    object qry_houses_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_houses_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_houses_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 10
      Calculated = True
    end
  end
  object ds_house: TDataSource
    DataSet = qry_houses_
    Left = 152
    Top = 112
  end
end
