object datm_instrucao_embarque: Tdatm_instrucao_embarque
  OldCreateOrder = False
  Left = 279
  Top = 188
  Height = 777
  Width = 648
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 540
    Top = 165
  end
  object qry_via_transp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TVIA_TRANSP_BROKER'
      'WHERE CD_VIA_TRANSP =:CD_VIA_TRANSP')
    Left = 540
    Top = 316
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end>
    object qry_via_transp_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_via_transp_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.NM_VIA_TRANSP'
      FixedChar = True
    end
    object qry_via_transp_CD_VIA_TRANSP_SISCOMEX: TStringField
      FieldName = 'CD_VIA_TRANSP_SISCOMEX'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.CD_VIA_TRANSP_SISCOMEX'
      FixedChar = True
      Size = 2
    end
    object qry_via_transp_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_via_transp_NM_VIA_TRANSP_INGLES: TStringField
      FieldName = 'NM_VIA_TRANSP_INGLES'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.NM_VIA_TRANSP_INGLES'
      FixedChar = True
    end
    object qry_via_transp_NM_VIA_TRANSP_ESP: TStringField
      FieldName = 'NM_VIA_TRANSP_ESP'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.NM_VIA_TRANSP_ESP'
      FixedChar = True
    end
    object qry_via_transp_CONSTANTE_CUBAGEM: TFloatField
      FieldName = 'CONSTANTE_CUBAGEM'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.NM_VIA_TRANSP_ESP'
    end
  end
  object qry_incoterms_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      '   FROM TINCOTERMS_VENDA'
      '   ')
    Left = 152
    Top = 315
    object qry_incoterms_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TINCOTERMS_VENDA.CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_incoterms_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TINCOTERMS_VENDA.DESCRICAO'
      FixedChar = True
      Size = 60
    end
  end
  object qry_tp_frete_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      '  FROM TTP_FRETE'
      '  ')
    Left = 152
    Top = 363
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, UH.CD_UNID_NEG, TUN.NM_UNID_NEG, UH.CD_PRO' +
        'DUTO,TP.NM_PRODUTO, UH.IN_ATIVO, UH.IN_DEFAULT,TU.NM_USUARIO  FR' +
        'OM TUSUARIO_HABILITACAO UH'
      'LEFT JOIN TUSUARIO TU ON(TU.CD_USUARIO = UH.CD_USUARIO)'
      'LEFT JOIN TUNID_NEG TUN ON (TUN.CD_UNID_NEG = UH.CD_UNID_NEG)'
      'LEFT JOIN TPRODUTO TP ON(TP.CD_PRODUTO = UH.CD_PRODUTO)'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      ''
      'UH.IN_DEFAULT='#39'1'#39
      ' '
      ' '
      ' ')
    Left = 540
    Top = 269
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_traz_default_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_IN_DEFAULT: TStringField
      FieldName = 'IN_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qry_traz_default_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
  end
  object qry_processo_: TQuery
    CachedUpdates = True
    AfterPost = qry_processo_AfterPost
    AfterDelete = qry_processo_AfterDelete
    AfterScroll = qry_processo_AfterScroll
    OnCalcFields = qry_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.TP_PROCESSO, (SELECT TPROP.TP_PROPOSTA' +
        ' FROM TPROPOSTA TPROP WHERE TPROP.NR_PROPOSTA = TP.NR_PROPOSTA)T' +
        'P_PROPOSTA,'
      
        '   TP.CD_CLIENTE,(SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHER' +
        'E TE.CD_EMPRESA = TP.CD_CLIENTE) NM_EMPRESA,'
      
        '   TP.CD_UNID_NEG, (SELECT TU.NM_UNID_NEG FROM TUNID_NEG TU WHER' +
        'E TU.CD_UNID_NEG = TP.CD_UNID_NEG) NM_UNID_NEG,'
      
        '   TP.CD_PRODUTO,(SELECT TPR.NM_PRODUTO FROM TPRODUTO TPR WHERE ' +
        'TPR.CD_PRODUTO = TP.CD_PRODUTO)NM_PRODUTO,'
      
        '   TP.CD_SERVICO,TS.NM_SERVICO, TS.CD_VIA_TRANSPORTE, TP.IN_ROUT' +
        'ING, TP.QTD_VOLUME, TP.CUBAGEM, TP.CHARGEABLE, TP.CD_ESTUFAGEM,'
      
        '   TP.CD_AGENTE, (SELECT TA.NM_AGENTE FROM TAGENTE TA WHERE TA.C' +
        'D_AGENTE = TP.CD_AGENTE)NM_AGENTE,'
      
        '   TP.CD_INCOTERM,TP.NR_PROPOSTA,TP.TX_DESCR,TP.VL_HOUSE, VL_FRE' +
        'TE, TP.IN_PEDIDO,'
      
        '   TP.TP_FRETE, TP.IN_CANCELADO, TP.IN_LIBERADO, TP.VL_RATEIO, T' +
        'P.CD_CIA_TRANSP, TP.CD_ARMADOR,'
      '   TP.CD_EMP_EST, TES.NM_EMPRESA,'
      '   RTRIM(TES.END_EMPRESA) +'
      
        '   RTRIM(CASE ISNULL(TES.END_NUMERO,'#39#39') WHEN '#39#39' THEN '#39#39' ELSE '#39', ' +
        #39'  + TES.END_NUMERO END) +'
      
        '   RTRIM(CASE ISNULL(TES.END_COMPL,'#39#39')  WHEN '#39#39' THEN '#39#39' ELSE '#39'  ' +
        #39'  + TES.END_COMPL  END) +'
      
        '   RTRIM(CASE ISNULL(TES.END_CIDADE,'#39#39') WHEN '#39#39' THEN '#39#39' ELSE '#39' -' +
        ' '#39' + TES.END_CIDADE END) +'
      
        '   RTRIM(CASE ISNULL(TES.END_ESTADO,'#39#39') WHEN '#39#39' THEN '#39#39' ELSE '#39' -' +
        ' '#39' + TES.END_ESTADO END) +'
      
        '   RTRIM(CASE ISNULL(TES.CD_PAIS,'#39#39')    WHEN '#39#39' THEN '#39#39' ELSE '#39' -' +
        ' '#39' + (SELECT DESCRICAO FROM TPAIS WHERE CODIGO = TES.CD_PAIS) EN' +
        'D) AS END_EMPRESA,'
      '   TES.NR_TELEFONE, TES.NM_CONTATO,'
      
        '   TP.TP_CARGA, TP.VL_TARIFA_FRETE, TP.VL_OTHER_CHARGE, TP.REF_C' +
        'LIENTE, TP.CD_LOCAL_CONSOLIDACAO,'
      
        '   TP.CD_ORIGEM, TPO.NM_PORTO,TPOR.NM_PORTO, TP.TP_ESTUFAGEM,  T' +
        'PO.CD_SIGLA_CIDADE,'
      
        '   TP.CD_DESTINO, TPO.CD_SIGLA,TPOR.CD_SIGLA, TP.CD_MOEDA_FRETE,' +
        ' TPOR.CD_SIGLA_CIDADE,'
      
        '   TP.IN_CUBAGEM, TP.VL_PESO_BRUTO, TP.CD_TAB_FRETE_VENDA, TP.IN' +
        '_SELECIONADO,(SELECT D.NM_PORTO FROM TPORTO D WHERE D.CD_PORTO =' +
        ' TP.CD_LOCAL_CONSOLIDACAO)NM_CONSOLIDACAO,'
      
        '   (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA =' +
        ' TP.CD_MOEDA_FRETE)NM_MOEDA,'
      
        '   TP.CD_EMBARCACAO, (SELECT EMB.NM_EMBARCACAO FROM TEMBARCACAO ' +
        'EMB WHERE EMB.CD_EMBARCACAO = TP.CD_EMBARCACAO) AS NOME_NAVIO,'
      '   TP.NR_VIAGEM, TP.NR_VIAGEM_ARMADOR'
      
        ' FROM TPROCESSO TP   LEFT JOIN TSERVICO TS ON (TS.CD_SERVICO = T' +
        'P.CD_SERVICO )'
      ' LEFT JOIN TPORTO TPO ON(TPO.CD_PORTO = TP.CD_ORIGEM )'
      ' LEFT JOIN TPORTO TPOR ON(TPOR.CD_PORTO = TP.CD_DESTINO )'
      ' LEFT JOIN TEMPRESA_EST TES ON (TES.CD_EMPRESA = TP.CD_EMP_EST)'
      
        ' WHERE  TP.CD_UNID_NEG =:CD_UNID_NEG AND  TP.CD_PRODUTO =:CD_PRO' +
        'DUTO AND TP.IN_LIBERADO = '#39'1'#39' AND TP.IN_PEDIDO IN ('#39'0'#39','#39'1'#39','#39'2'#39') ' +
        'AND'
      
        '        TS.CD_VIA_TRANSPORTE=:CD_VIA_TRANSP AND TS.TP_SERVICO='#39'1' +
        #39' AND TP.NR_PROCESSO NOT IN(SELECT H.NR_PROCESSO FROM THOUSE H W' +
        'HERE H.NR_PROCESSO = TP.NR_PROCESSO)'
      ''
      ''
      ''
      'ORDER BY TP.NR_PROCESSO')
    UpdateObject = UpDAte_processo
    Left = 152
    Top = 217
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
    object qry_processo_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_processo_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_processo_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_processo_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qry_processo_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_processo_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      OnChange = qry_processo_CD_INCOTERMChange
      FixedChar = True
      Size = 3
    end
    object qry_processo_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_processo_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_processo_TP_CARGA: TStringField
      FieldName = 'TP_CARGA'
      FixedChar = True
      Size = 1
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
    object qry_processo_Look_incoterm: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_incoterm'
      LookupDataSet = qry_incoterms_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CODIGO'
      KeyFields = 'CD_INCOTERM'
      Size = 5
      Lookup = True
    end
    object qry_processo_Look_tp_frete: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_frete'
      LookupDataSet = qry_tp_frete_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TP_FRETE'
      Size = 10
      Lookup = True
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_NM_EMPRESA_1: TStringField
      FieldName = 'NM_EMPRESA_1'
      FixedChar = True
      Size = 60
    end
    object qry_processo_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 60
    end
    object qry_processo_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_processo_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_processo_CD_TAB_FRETE_VENDA: TStringField
      FieldName = 'CD_TAB_FRETE_VENDA'
      FixedChar = True
      Size = 6
    end
    object qry_processo_IN_ROUTING: TStringField
      FieldName = 'IN_ROUTING'
      FixedChar = True
      Size = 1
    end
    object qry_processo_QTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
      DisplayFormat = '00'
    end
    object qry_processo_CUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
      OnChange = qry_processo_CUBAGEMChange
      DisplayFormat = '0.000'
    end
    object qry_processo_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
      OnChange = qry_processo_CHARGEABLEChange
      DisplayFormat = '0.000'
    end
    object qry_processo_CD_ESTUFAGEM: TStringField
      FieldName = 'CD_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_processo_IN_CUBAGEM: TStringField
      FieldName = 'IN_CUBAGEM'
      OnChange = qry_processo_IN_CUBAGEMChange
      FixedChar = True
      Size = 1
    end
    object qry_processo_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      OnChange = qry_processo_CUBAGEMChange
      DisplayFormat = '0.000'
    end
    object qry_processo_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 15
      Calculated = True
    end
    object qry_processo_TX_DESCR: TStringField
      FieldName = 'TX_DESCR'
      FixedChar = True
      Size = 255
    end
    object qry_processo_NM_PORTO: TStringField
      FieldName = 'NM_PORTO'
      FixedChar = True
      Size = 50
    end
    object qry_processo_NM_PORTO_1: TStringField
      FieldName = 'NM_PORTO_1'
      FixedChar = True
      Size = 50
    end
    object qry_processo_CD_SIGLA: TStringField
      FieldName = 'CD_SIGLA'
      FixedChar = True
      Size = 3
    end
    object qry_processo_CD_SIGLA_1: TStringField
      FieldName = 'CD_SIGLA_1'
      FixedChar = True
      Size = 3
    end
    object qry_processo_VL_TARIFA_FRETE: TFloatField
      FieldName = 'VL_TARIFA_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_OTHER_CHARGE: TFloatField
      FieldName = 'VL_OTHER_CHARGE'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_HOUSE: TFloatField
      FieldName = 'VL_HOUSE'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_processo_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      OnChange = qry_processo_TP_ESTUFAGEMChange
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_processo_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_processo_NM_MOEDA: TStringField
      DisplayWidth = 6
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_processo_VL_RATEIO: TFloatField
      FieldName = 'VL_RATEIO'
    end
    object qry_processo_TP_PROCESSO: TStringField
      FieldName = 'TP_PROCESSO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_TP_PROPOSTA: TStringField
      FieldName = 'TP_PROPOSTA'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_SIGLA_CIDADE: TStringField
      FieldName = 'CD_SIGLA_CIDADE'
      FixedChar = True
      Size = 3
    end
    object qry_processo_CD_SIGLA_CIDADE_1: TStringField
      FieldName = 'CD_SIGLA_CIDADE_1'
      FixedChar = True
      Size = 3
    end
    object qry_processo_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_REF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      FixedChar = True
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
    object qry_processo_IN_PEDIDO: TStringField
      FieldName = 'IN_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_LOCAL_CONSOLIDACAO: TStringField
      FieldName = 'CD_LOCAL_CONSOLIDACAO'
      FixedChar = True
      Size = 4
    end
    object qry_processo_NM_CONSOLIDACAO: TStringField
      FieldName = 'NM_CONSOLIDACAO'
      FixedChar = True
      Size = 50
    end
    object qry_processo_calcEndCompleto: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcEndCompleto'
      Size = 255
      Calculated = True
    end
    object qry_processo_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      FixedChar = True
      Size = 4
    end
    object qry_processo_NOME_NAVIO: TStringField
      FieldName = 'NOME_NAVIO'
      FixedChar = True
      Size = 40
    end
    object qry_processo_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      OnSetText = qry_processo_NR_VIAGEMSetText
      EditMask = '99/99;0;_'
      FixedChar = True
      Size = 15
    end
    object qry_processo_NR_VIAGEM_ARMADOR: TStringField
      FieldName = 'NR_VIAGEM_ARMADOR'
      FixedChar = True
      Size = 15
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 40
    Top = 217
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
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  CD_MOEDA_FRETE = :CD_MOEDA_FRETE,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  IN_LIBERADO = :IN_LIBERADO,'
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
      '  CD_ESTUFAGEM = :CD_ESTUFAGEM,'
      '  IN_CUBAGEM = :IN_CUBAGEM,'
      '  TX_DESCR = :TX_DESCR,'
      '  VL_TARIFA_FRETE = :VL_TARIFA_FRETE,'
      '  VL_OTHER_CHARGE = :VL_OTHER_CHARGE,'
      '  VL_FRETE = :VL_FRETE,'
      '  VL_HOUSE = :VL_HOUSE,'
      '  VL_RATEIO = :VL_RATEIO,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  IN_PEDIDO = :IN_PEDIDO,'
      '  IN_SELECIONADO = :IN_SELECIONADO,'
      '  REF_CLIENTE = :REF_CLIENTE,'
      '  CD_LOCAL_CONSOLIDACAO = :CD_LOCAL_CONSOLIDACAO,'
      '  CD_EMBARCACAO = :CD_EMBARCACAO,'
      '  NR_VIAGEM = :NR_VIAGEM,'
      '  NR_VIAGEM_ARMADOR = :NR_VIAGEM_ARMADOR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO'
      
        '  (NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_SERVICO,' +
        ' '
      'IN_CANCELADO, '
      '   CD_MOEDA_FRETE, CD_AGENTE, IN_LIBERADO, VL_PESO_BRUTO, '
      'CD_INCOTERM, '
      '   TP_PROCESSO, TP_FRETE, CD_EMP_EST, NR_PROPOSTA, TP_CARGA, '
      'CD_ORIGEM, '
      '   CD_DESTINO, CD_TAB_FRETE_VENDA, CD_CIA_TRANSP, CD_ARMADOR, '
      'IN_ROUTING, '
      '   QTD_VOLUME, CUBAGEM, CHARGEABLE, CD_ESTUFAGEM, IN_CUBAGEM, '
      'TX_DESCR, '
      '   VL_TARIFA_FRETE, VL_OTHER_CHARGE, VL_FRETE, VL_HOUSE, '
      'VL_RATEIO, TP_ESTUFAGEM, '
      
        '   IN_PEDIDO, IN_SELECIONADO, REF_CLIENTE, CD_LOCAL_CONSOLIDACAO' +
        ','
      'CD_EMBARCACAO, NR_VIAGEM, NR_VIAGEM_ARMADOR)'
      'values'
      '  (:NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_CLIENTE, '
      ':CD_SERVICO, :IN_CANCELADO, '
      '   :CD_MOEDA_FRETE, :CD_AGENTE, :IN_LIBERADO, :VL_PESO_BRUTO, '
      ':CD_INCOTERM, '
      
        '   :TP_PROCESSO, :TP_FRETE, :CD_EMP_EST, :NR_PROPOSTA, :TP_CARGA' +
        ', '
      ':CD_ORIGEM, '
      
        '   :CD_DESTINO, :CD_TAB_FRETE_VENDA, :CD_CIA_TRANSP, :CD_ARMADOR' +
        ', '
      ':IN_ROUTING, '
      
        '   :QTD_VOLUME, :CUBAGEM, :CHARGEABLE, :CD_ESTUFAGEM, :IN_CUBAGE' +
        'M, '
      ':TX_DESCR, '
      '   :VL_TARIFA_FRETE, :VL_OTHER_CHARGE, :VL_FRETE, :VL_HOUSE, '
      ':VL_RATEIO, '
      '   :TP_ESTUFAGEM, :IN_PEDIDO, :IN_SELECIONADO, :REF_CLIENTE, '
      ':CD_LOCAL_CONSOLIDACAO, :CD_EMBARCACAO, :NR_VIAGEM,'
      ':NR_VIAGEM_ARMADOR)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 248
    Top = 217
  end
  object qry_instrucao_carga_: TQuery
    CachedUpdates = True
    BeforePost = qry_instrucao_carga_BeforePost
    AfterPost = qry_instrucao_carga_AfterPost
    BeforeDelete = qry_instrucao_carga_BeforeDelete
    AfterDelete = qry_instrucao_carga_AfterDelete
    OnNewRecord = qry_instrucao_carga_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_CARGA, QTDE, VL_COMPR, VL_LARG, CD_VIA_TR' +
        'ANSP, TP_ESTUFAGEM,'
      '    VL_ALT, PESO_KG, CUBAGEM_VENDA, PESO_VOLUMETRICO, VL_VENDA'
      '     FROM TINSTRUCAO_CARGA'
      '       WHERE NR_PROCESSO=:NR_PROCESSO'
      ''
      ' '
      ' ')
    UpdateObject = UpDAte_carga
    Left = 151
    Top = 56
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_instrucao_carga_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.NR_PROCESSO'
      FixedChar = True
    end
    object qry_instrucao_carga_CD_CARGA: TStringField
      FieldName = 'CD_CARGA'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.CD_CARGA'
      FixedChar = True
      Size = 3
    end
    object qry_instrucao_carga_QTDE: TFloatField
      FieldName = 'QTDE'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.QTDE'
      OnChange = qry_instrucao_carga_QTDEChange
      DisplayFormat = '00'
    end
    object qry_instrucao_carga_VL_COMPR: TFloatField
      FieldName = 'VL_COMPR'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.VL_COMPR'
      OnChange = qry_instrucao_carga_QTDEChange
      DisplayFormat = '0.00'
    end
    object qry_instrucao_carga_VL_LARG: TFloatField
      FieldName = 'VL_LARG'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.VL_LARG'
      OnChange = qry_instrucao_carga_QTDEChange
      DisplayFormat = '0.00'
    end
    object qry_instrucao_carga_VL_ALT: TFloatField
      FieldName = 'VL_ALT'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.VL_ALT'
      OnChange = qry_instrucao_carga_QTDEChange
      DisplayFormat = '0.00'
    end
    object qry_instrucao_carga_PESO_KG: TFloatField
      FieldName = 'PESO_KG'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.PESO_KG'
      OnChange = qry_instrucao_carga_PESO_KGChange
      DisplayFormat = '0.000'
    end
    object qry_instrucao_carga_CUBAGEM_VENDA: TFloatField
      FieldName = 'CUBAGEM_VENDA'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.CUBAGEM_VENDA'
      OnChange = qry_instrucao_carga_QTDEChange
      DisplayFormat = '0.000'
    end
    object qry_instrucao_carga_PESO_VOLUMETRICO: TFloatField
      FieldName = 'PESO_VOLUMETRICO'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.PESO_VOLUMETRICO'
      OnChange = qry_instrucao_carga_PESO_KGChange
      DisplayFormat = '0.000'
    end
    object qry_instrucao_carga_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_instrucao_carga_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_instrucao_carga_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
  end
  object ds_instr_carga: TDataSource
    DataSet = qry_instrucao_carga_
    Left = 41
    Top = 56
  end
  object qry_ult_instr_carga_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT MAX(CD_CARGA) AS ULTIMO FROM TINSTRUCAO_CARGA'
      '   WHERE NR_PROCESSO=:NR_PROCESSO')
    Left = 540
    Top = 218
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ult_instr_carga_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.CD_CARGA'
      FixedChar = True
      Size = 3
    end
  end
  object UpDAte_carga: TUpdateSQL
    ModifySQL.Strings = (
      'update TINSTRUCAO_CARGA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_CARGA = :CD_CARGA,'
      '  QTDE = :QTDE,'
      '  VL_COMPR = :VL_COMPR,'
      '  VL_LARG = :VL_LARG,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  VL_ALT = :VL_ALT,'
      '  PESO_KG = :PESO_KG,'
      '  CUBAGEM_VENDA = :CUBAGEM_VENDA,'
      '  PESO_VOLUMETRICO = :PESO_VOLUMETRICO,'
      '  VL_VENDA = :VL_VENDA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CARGA = :OLD_CD_CARGA')
    InsertSQL.Strings = (
      'insert into TINSTRUCAO_CARGA'
      
        '  (NR_PROCESSO, CD_CARGA, QTDE, VL_COMPR, VL_LARG, CD_VIA_TRANSP' +
        ', TP_ESTUFAGEM, '
      '   VL_ALT, PESO_KG, CUBAGEM_VENDA, PESO_VOLUMETRICO, VL_VENDA)'
      'values'
      
        '  (:NR_PROCESSO, :CD_CARGA, :QTDE, :VL_COMPR, :VL_LARG, :CD_VIA_' +
        'TRANSP, '
      
        '   :TP_ESTUFAGEM, :VL_ALT, :PESO_KG, :CUBAGEM_VENDA, :PESO_VOLUM' +
        'ETRICO, '
      '   :VL_VENDA)')
    DeleteSQL.Strings = (
      'delete from TINSTRUCAO_CARGA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CARGA = :OLD_CD_CARGA')
    Left = 248
    Top = 56
  end
  object ds_incoterm: TDataSource
    DataSet = qry_incoterms_
    Left = 40
    Top = 315
  end
  object ds_tp_frete: TDataSource
    DataSet = qry_tp_frete_
    Left = 40
    Top = 365
  end
  object qry_tab_venda_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TAB_FRETE, PESO_TAB_FRETE, VL_VENDA_TAB_FRETE, VL_COMP' +
        'RA_TAB_FRETE,'
      'TP_ESTUFAGEM, TTIPO_SIMBOLO_TAB_FRETE FROM TPROPOSTA_FRETE_ITEM'
      '  WHERE CD_TAB_FRETE=:CD_TAB_FRETE AND NR_PROPOSTA=:NR_PROPOSTA'
      '    AND CD_PRODUTO = :CD_PRODUTO AND CD_SERVICO=:CD_SERVICO'
      ''
      ''
      ' ')
    Left = 540
    Top = 59
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
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_tab_venda_item_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_TAB_FRETE'
      FixedChar = True
      Size = 6
    end
    object qry_tab_venda_item_PESO_TAB_FRETE: TFloatField
      FieldName = 'PESO_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.PESO_TAB_FRETE'
    end
    object qry_tab_venda_item_VL_VENDA_TAB_FRETE: TFloatField
      FieldName = 'VL_VENDA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_VENDA_TAB_FRETE'
    end
    object qry_tab_venda_item_TTIPO_SIMBOLO_TAB_FRETE: TStringField
      FieldName = 'TTIPO_SIMBOLO_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TTIPO_SIMBOLO_TAB_FRETE'
      FixedChar = True
      Size = 15
    end
    object qry_tab_venda_item_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_tab_venda_item_VL_COMPRA_TAB_FRETE: TFloatField
      FieldName = 'VL_COMPRA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_TAB_FRETE'
    end
  end
  object qry_tab_frete_despesa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TF.CD_TAB_FRETE,'
      
        '   TF.CD_ITEM, (SELECT TI.NM_ITEM FROM TITEM TI WHERE TI.CD_ITEM' +
        ' = TF.CD_ITEM)NM_ITEM,'
      
        '   TF.TP_BASE_CALCULO, (SELECT TB.NM_TP_BASE_CALC_FRETE FROM TTP' +
        '_BASE_CALC_FRETE TB WHERE TB.CD_TP_BASE_CALC_FRETE = TF.TP_BASE_' +
        'CALCULO)NM_BASE_CALC,'
      
        '   TF.CD_MOEDA,(SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE T' +
        'M.CD_MOEDA = TF.CD_MOEDA)NM_MOEDA,'
      
        '   TF.TP_ORIGEM_DESPESA, (SELECT TOR.NM_ORIGEM_DESP FROM TORIGEM' +
        '_DESPESA TOR WHERE TOR.CD_ORIGEM_DESP =  TF.TP_ORIGEM_DESPESA AN' +
        'D TOR.TP_DESCRICAO = '#39'0'#39')NM_ORI_CUSTO,'
      '   TF.CD_TAB_REF, TF.TP_ESTUFAGEM,TF.VL_INTERVALO_INICIAL,'
      '   TF.VL_BASE_DESPESA,'
      '   TF.VL_COMPRA_AG, TF.VL_COMPRA_CIA, TF.VL_VENDA,'
      
        '   TF.IN_DESPESA,(SELECT TORG.NM_ORIGEM_DESP FROM TORIGEM_DESPES' +
        'A TORG WHERE TORG.CD_ORIGEM_DESP = TF.IN_DESPESA AND TORG.TP_DES' +
        'CRICAO = '#39'1'#39')NM_DESPESA_POR,'
      
        '   TF.IN_MENCIONADO, (SELECT TY.TX_YESNO FROM TYES_NO TY WHERE T' +
        'Y.CD_YESNO=TF.IN_MENCIONADO)NM_MENCIONADO,'
      '   TF.TP_FRETE,'
      '   TF.VL_INTERVALO_FINAL'
      '     FROM TPROPOSTA_FRETE_DESPESA TF'
      
        '        WHERE TF.CD_TAB_FRETE=:CD_TAB_FRETE AND TF.TP_ESTUFAGEM=' +
        #39'0'#39
      
        '         AND TF.IN_DESPESA = '#39'4'#39' AND TF.NR_PROPOSTA=:NR_PROPOSTA' +
        ' AND'
      
        '           TF.CD_SERVICO=:CD_SERVICO AND TF.CD_PRODUTO=:CD_PRODU' +
        'TO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 152
    Top = 268
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
    object qry_tab_frete_despesa_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      FixedChar = True
      Size = 6
    end
    object qry_tab_frete_despesa_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_tab_frete_despesa_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_tab_frete_despesa_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      FixedChar = True
      Size = 2
    end
    object qry_tab_frete_despesa_NM_BASE_CALC: TStringField
      DisplayWidth = 10
      FieldName = 'NM_BASE_CALC'
      FixedChar = True
      Size = 10
    end
    object qry_tab_frete_despesa_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_tab_frete_despesa_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_tab_frete_despesa_TP_ORIGEM_DESPESA: TStringField
      FieldName = 'TP_ORIGEM_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_tab_frete_despesa_NM_ORI_CUSTO: TStringField
      FieldName = 'NM_ORI_CUSTO'
      FixedChar = True
    end
    object qry_tab_frete_despesa_CD_TAB_REF: TStringField
      FieldName = 'CD_TAB_REF'
      FixedChar = True
      Size = 6
    end
    object qry_tab_frete_despesa_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_tab_frete_despesa_VL_INTERVALO_INICIAL: TFloatField
      FieldName = 'VL_INTERVALO_INICIAL'
      DisplayFormat = '0.00'
    end
    object qry_tab_frete_despesa_VL_BASE_DESPESA: TFloatField
      FieldName = 'VL_BASE_DESPESA'
    end
    object qry_tab_frete_despesa_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
    end
    object qry_tab_frete_despesa_VL_COMPRA_CIA: TFloatField
      FieldName = 'VL_COMPRA_CIA'
    end
    object qry_tab_frete_despesa_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_tab_frete_despesa_IN_DESPESA: TStringField
      FieldName = 'IN_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_tab_frete_despesa_NM_DESPESA_POR: TStringField
      FieldName = 'NM_DESPESA_POR'
      FixedChar = True
    end
    object qry_tab_frete_despesa_IN_MENCIONADO: TStringField
      FieldName = 'IN_MENCIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_tab_frete_despesa_NM_MENCIONADO: TStringField
      FieldName = 'NM_MENCIONADO'
      FixedChar = True
      Size = 3
    end
    object qry_tab_frete_despesa_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_tab_frete_despesa_VL_INTERVALO_FINAL: TFloatField
      FieldName = 'VL_INTERVALO_FINAL'
      DisplayFormat = '0.00'
    end
  end
  object ds_frete_despesa: TDataSource
    DataSet = qry_tab_frete_despesa_
    Left = 40
    Top = 266
  end
  object qry_instrucao_lcl_: TQuery
    CachedUpdates = True
    BeforePost = qry_instrucao_lcl_BeforePost
    AfterPost = qry_instrucao_lcl_AfterPost
    BeforeDelete = qry_instrucao_lcl_BeforeDelete
    AfterDelete = qry_instrucao_lcl_AfterDelete
    AfterScroll = qry_instrucao_lcl_AfterScroll
    OnCalcFields = qry_instrucao_lcl_CalcFields
    OnNewRecord = qry_instrucao_lcl_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TI.NR_PROCESSO, TI.CD_CARGA, TI.QTDE, TI.VL_COMPR, TI.VL_' +
        'LARG, TI.CD_VIA_TRANSP, TI.TP_ESTUFAGEM,'
      
        '    TI.VL_ALT, TI.PESO_TON, TI.CUBAGEM_VENDA, TI.PESO_VOLUMETRIC' +
        'O,'
      
        '    TI.TP_EMBALAGEM, (SELECT TE.NM_EMBALAGEM_S FROM TEMBALAGEM T' +
        'E WHERE TE.CD_EMBALAGEM = TI.TP_EMBALAGEM)NM_EMBALAGEM'
      '     FROM TINSTRUCAO_CARGA TI'
      '       WHERE TI.NR_PROCESSO=:NR_PROCESSO'
      '        AND TI.CD_VIA_TRANSP='#39'01'#39' AND TI.TP_ESTUFAGEM = '#39'0'#39
      ''
      ' '
      ' '
      ' ')
    UpdateObject = UpDAte_instr_lcl
    Left = 152
    Top = 110
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_instrucao_lcl_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object qry_instrucao_lcl_CD_CARGA: TStringField
      FieldName = 'CD_CARGA'
      FixedChar = True
      Size = 3
    end
    object qry_instrucao_lcl_QTDE: TFloatField
      FieldName = 'QTDE'
      OnChange = qry_instrucao_lcl_PESO_VOLUMETRICOChange
      DisplayFormat = '00'
    end
    object qry_instrucao_lcl_VL_COMPR: TFloatField
      FieldName = 'VL_COMPR'
    end
    object qry_instrucao_lcl_VL_LARG: TFloatField
      FieldName = 'VL_LARG'
    end
    object qry_instrucao_lcl_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_instrucao_lcl_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_instrucao_lcl_VL_ALT: TFloatField
      FieldName = 'VL_ALT'
    end
    object qry_instrucao_lcl_PESO_TON: TFloatField
      FieldName = 'PESO_TON'
      OnChange = qry_instrucao_lcl_PESO_VOLUMETRICOChange
      DisplayFormat = '0.000'
    end
    object qry_instrucao_lcl_CUBAGEM_VENDA: TFloatField
      FieldName = 'CUBAGEM_VENDA'
    end
    object qry_instrucao_lcl_PESO_VOLUMETRICO: TFloatField
      FieldName = 'PESO_VOLUMETRICO'
      OnChange = qry_instrucao_lcl_PESO_VOLUMETRICOChange
      DisplayFormat = '0.000'
    end
    object qry_instrucao_lcl_TP_EMBALAGEM: TStringField
      FieldName = 'TP_EMBALAGEM'
      OnChange = qry_instrucao_lcl_TP_EMBALAGEMChange
      OnSetText = qry_instrucao_lcl_TP_EMBALAGEMSetText
      FixedChar = True
      Size = 4
    end
    object qry_instrucao_lcl_NM_EMBALAGEM: TStringField
      FieldName = 'NM_EMBALAGEM'
      FixedChar = True
      Size = 50
    end
    object qry_instrucao_lcl_calcEMBALAGEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcEMBALAGEM'
      Size = 100
      Calculated = True
    end
  end
  object ds_instrucao_lcl: TDataSource
    DataSet = qry_instrucao_lcl_
    Left = 40
    Top = 112
  end
  object UpDAte_instr_lcl: TUpdateSQL
    ModifySQL.Strings = (
      'update TINSTRUCAO_CARGA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_CARGA = :CD_CARGA,'
      '  QTDE = :QTDE,'
      '  VL_COMPR = :VL_COMPR,'
      '  VL_LARG = :VL_LARG,'
      '  VL_ALT = :VL_ALT,'
      '  CUBAGEM_VENDA = :CUBAGEM_VENDA,'
      '  PESO_VOLUMETRICO = :PESO_VOLUMETRICO,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  TP_EMBALAGEM = :TP_EMBALAGEM,'
      '  PESO_TON = :PESO_TON'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CARGA = :OLD_CD_CARGA')
    InsertSQL.Strings = (
      'insert into TINSTRUCAO_CARGA'
      
        '  (NR_PROCESSO, CD_CARGA, QTDE, VL_COMPR, VL_LARG, VL_ALT, CUBAG' +
        'EM_VENDA, '
      
        '   PESO_VOLUMETRICO, CD_VIA_TRANSP, TP_ESTUFAGEM, TP_EMBALAGEM, ' +
        'PESO_TON)'
      'values'
      
        '  (:NR_PROCESSO, :CD_CARGA, :QTDE, :VL_COMPR, :VL_LARG, :VL_ALT,' +
        ' :CUBAGEM_VENDA, '
      
        '   :PESO_VOLUMETRICO, :CD_VIA_TRANSP, :TP_ESTUFAGEM, :TP_EMBALAG' +
        'EM, :PESO_TON)')
    DeleteSQL.Strings = (
      'delete from TINSTRUCAO_CARGA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CARGA = :OLD_CD_CARGA')
    Left = 248
    Top = 109
  end
  object qry_instrucao_fcl_: TQuery
    CachedUpdates = True
    BeforePost = qry_instrucao_fcl_BeforePost
    AfterPost = qry_instrucao_fcl_AfterPost
    BeforeDelete = qry_instrucao_fcl_BeforeDelete
    AfterDelete = qry_instrucao_fcl_AfterDelete
    AfterScroll = qry_instrucao_fcl_AfterScroll
    OnCalcFields = qry_instrucao_fcl_CalcFields
    OnNewRecord = qry_instrucao_fcl_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TI.NR_PROCESSO, TI.CD_CARGA, TI.QTDE,   TI.CD_VIA_TRANSP,' +
        ' TI.TP_ESTUFAGEM,'
      '    TI.PESO_TON,  TI.PESO_VOLUMETRICO,TI.VL_VENDA, TI.VL_COMPRA,'
      '    TI.TP_CNTR'
      '     FROM TINSTRUCAO_CARGA TI'
      '       WHERE TI.NR_PROCESSO=:NR_PROCESSO'
      '        AND TI.CD_VIA_TRANSP='#39'01'#39' AND TI.TP_ESTUFAGEM = '#39'1'#39
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDate_instr_fcl
    Left = 152
    Top = 164
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_instrucao_fcl_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object qry_instrucao_fcl_CD_CARGA: TStringField
      FieldName = 'CD_CARGA'
      FixedChar = True
      Size = 3
    end
    object qry_instrucao_fcl_QTDE: TFloatField
      FieldName = 'QTDE'
      OnChange = qry_instrucao_fcl_PESO_VOLUMETRICOChange
      DisplayFormat = '00'
    end
    object qry_instrucao_fcl_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_instrucao_fcl_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_instrucao_fcl_PESO_TON: TFloatField
      FieldName = 'PESO_TON'
      OnChange = qry_instrucao_fcl_PESO_VOLUMETRICOChange
      DisplayFormat = '0.000'
    end
    object qry_instrucao_fcl_PESO_VOLUMETRICO: TFloatField
      FieldName = 'PESO_VOLUMETRICO'
      OnChange = qry_instrucao_fcl_PESO_VOLUMETRICOChange
      DisplayFormat = '0.000'
    end
    object qry_instrucao_fcl_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      OnChange = qry_instrucao_fcl_TP_CNTRChange
      OnSetText = qry_instrucao_fcl_TP_CNTRSetText
      FixedChar = True
      Size = 2
    end
    object qry_instrucao_fcl_Look_nm_cntr: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_cntr'
      LookupDataSet = qry_cntr_
      LookupKeyFields = 'TP_CNTR'
      LookupResultField = 'NM_TP_CNTR'
      KeyFields = 'TP_CNTR'
      Lookup = True
    end
    object qry_instrucao_fcl_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      OnChange = qry_instrucao_fcl_VL_VENDAChange
      DisplayFormat = '0.00'
    end
    object qry_instrucao_fcl_VL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
      Origin = 'DBBROKER.TINSTRUCAO_CARGA.VL_COMPRA'
    end
    object qry_instrucao_fcl_calcCNTR: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCNTR'
      Size = 100
      Calculated = True
    end
  end
  object ds_instrucao_fcl: TDataSource
    DataSet = qry_instrucao_fcl_
    Left = 40
    Top = 168
  end
  object UpDate_instr_fcl: TUpdateSQL
    ModifySQL.Strings = (
      'update TINSTRUCAO_CARGA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_CARGA = :CD_CARGA,'
      '  QTDE = :QTDE,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  PESO_TON = :PESO_TON,'
      '  PESO_VOLUMETRICO = :PESO_VOLUMETRICO,'
      '  VL_VENDA = :VL_VENDA,'
      '  VL_COMPRA = :VL_COMPRA,'
      '  TP_CNTR = :TP_CNTR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CARGA = :OLD_CD_CARGA')
    InsertSQL.Strings = (
      'insert into TINSTRUCAO_CARGA'
      
        '  (NR_PROCESSO, CD_CARGA, QTDE, CD_VIA_TRANSP, TP_ESTUFAGEM, PES' +
        'O_TON, '
      '   PESO_VOLUMETRICO, VL_VENDA, VL_COMPRA, TP_CNTR)'
      'values'
      
        '  (:NR_PROCESSO, :CD_CARGA, :QTDE, :CD_VIA_TRANSP, :TP_ESTUFAGEM' +
        ', :PESO_TON, '
      '   :PESO_VOLUMETRICO, :VL_VENDA, :VL_COMPRA, :TP_CNTR)')
    DeleteSQL.Strings = (
      'delete from TINSTRUCAO_CARGA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CARGA = :OLD_CD_CARGA')
    Left = 248
    Top = 163
  end
  object qry_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP_CNTR, NM_TP_CNTR  FROM '
      '  TTP_CNTR')
    Left = 540
    Top = 5
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
  object qry_rel_instrucao_: TQuery
    OnCalcFields = qry_rel_instrucao_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.CD_UNID_NEG, TP.CD_PRODUTO,  TP.CD_CLI' +
        'ENTE , TP.CD_EMP_EST, TP.REF_CLIENTE,'
      
        ' TP.CD_ORIGEM, TP.CD_DESTINO, TP.QTD_VOLUME, TP.VL_PESO_BRUTO, T' +
        'P.CUBAGEM, TP.CHARGEABLE,'
      ' TP.VL_TARIFA_FRETE, TP.VL_FRETE, TP.TX_DESCR, TP.TP_ESTUFAGEM,'
      
        ' TN.NM_EMPRESA AS NM_CLIENTE, TN.END_EMPRESA AS END_CLIENTE, TN.' +
        'END_NUMERO AS NUMERO_CLIENTE,'
      
        ' TN.END_CIDADE AS CIDADE_CLIENTE, TN.END_BAIRRO AS BAIRRO_CLIENT' +
        'E, TN.END_CEP AS CEP_CLIENTE,'
      
        ' TN.NR_TELEFONE AS FONE_CLIENTE, TN.NR_FAX AS FAX_CLIENTE, TN.CG' +
        'C_EMPRESA AS CGC_CLIENTE,'
      
        ' TE.NM_EMPRESA AS NM_EXPORTADOR, TE.END_EMPRESA AS END_EXPORTADO' +
        'R, TE.END_NUMERO AS NUMERO_EXPORTADOR,'
      
        ' TE.END_CIDADE AS CIDADE_EXPORTADOR, TE.NM_CONTATO AS CONTATO_EX' +
        'PORTADOR,'
      
        ' TA.NM_AGENTE, TA.NR_FONE AS FONE_AGNETE, TA.NR_FAX AS FAX_AGENT' +
        'E,'
      
        ' TC.DESCRICAO AS NM_CIA, TE.NM_CONTATO AS CONTATO_EXP, TE.NR_TEL' +
        'EFONE AS FONE_EXP, TE.NR_FAX AS FAX_EXP,'
      
        '  TOR.NM_PORTO AS NM_ORIGEM, TOR.CD_SIGLA AS SIGLA_ORIGEM, TOR.C' +
        'D_SIGLA_CIDADE AS SIGLA_CID_ORIGEM,'
      
        '  TDE.NM_PORTO AS NM_DESTINO, TDE.CD_SIGLA AS SIGLA_DESTINO, TDE' +
        '.CD_SIGLA_CIDADE AS SIGLA_CID_DESTINO,'
      ' TP.CD_ARMADOR, TAR.DESCRICAO AS NM_ARMADOR, TP.TP_FRETE,'
      
        ' TP.CD_INCOTERM, (SELECT TI.DESCRICAO FROM TINCOTERMS_VENDA TI W' +
        'HERE TI.CODIGO = TP.CD_INCOTERM)NM_INCOTERM,'
      
        ' (SELECT TF.DESCRICAO FROM TTP_FRETE TF WHERE TF.CODIGO = TP.TP_' +
        'FRETE)NM_FRETE,'
      
        ' TM.NM_MOEDA, TM.AP_MOEDA, TU.NM_UNID_NEG, TU.END_UNID_NEG, TU.E' +
        'ND_NUMERO AS NUMERO_UNID,'
      
        ' TU.END_UF AS UF_UNID_NEG, TU.NR_FONE AS FONE_UNID, TU.END_CEP A' +
        'S CEP_UNID, TU.NR_FAX1 AS FAX_UNID,'
      ' TU.END_BAIRRO AS BAIRRO_UNID, TU.END_CIDADE AS CIDADE_UNID'
      'FROM TPROCESSO TP'
      '  LEFT JOIN TPORTO TOR ON(TOR.CD_PORTO = TP.CD_ORIGEM)'
      '  LEFT JOIN TPORTO TDE ON(TDE.CD_PORTO = TP.CD_DESTINO)'
      '  LEFT JOIN TUNID_NEG TU ON(TU.CD_UNID_NEG = TP.CD_UNID_NEG)'
      '  LEFT JOIN TEMPRESA_NAC TN ON(TN.CD_EMPRESA = TP.CD_CLIENTE)'
      '  LEFT JOIN TEMPRESA_EST TE ON(TE.CD_EMPRESA = TP.CD_EMP_EST)'
      '  LEFT JOIN TAGENTE TA ON(TA.CD_AGENTE = TP.CD_AGENTE)'
      
        '  LEFT JOIN TTRANSPORTADOR_ITL TC ON(TC.CODIGO = TP.CD_CIA_TRANS' +
        'P)'
      
        '  LEFT JOIN TTRANSPORTADOR_ITL TAR ON(TAR.CODIGO = TP.CD_ARMADOR' +
        ')'
      
        '  LEFT JOIN TMOEDA_BROKER TM ON (TM.CD_MOEDA = TP.CD_MOEDA_FRETE' +
        ')'
      ' WHERE TP.NR_PROCESSO =:NR_PROCESSO'
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
      ' ')
    Left = 152
    Top = 4
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_rel_instrucao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_rel_instrucao_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_rel_instrucao_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_rel_instrucao_REF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      FixedChar = True
    end
    object qry_rel_instrucao_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_rel_instrucao_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_rel_instrucao_QTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
    end
    object qry_rel_instrucao_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qry_rel_instrucao_CUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
    end
    object qry_rel_instrucao_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
    end
    object qry_rel_instrucao_VL_TARIFA_FRETE: TFloatField
      FieldName = 'VL_TARIFA_FRETE'
    end
    object qry_rel_instrucao_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object qry_rel_instrucao_TX_DESCR: TStringField
      FieldName = 'TX_DESCR'
      FixedChar = True
      Size = 255
    end
    object qry_rel_instrucao_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_rel_instrucao_END_CLIENTE: TStringField
      FieldName = 'END_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_rel_instrucao_NUMERO_CLIENTE: TStringField
      FieldName = 'NUMERO_CLIENTE'
      FixedChar = True
      Size = 6
    end
    object qry_rel_instrucao_CIDADE_CLIENTE: TStringField
      FieldName = 'CIDADE_CLIENTE'
      FixedChar = True
      Size = 30
    end
    object qry_rel_instrucao_BAIRRO_CLIENTE: TStringField
      FieldName = 'BAIRRO_CLIENTE'
      FixedChar = True
      Size = 30
    end
    object qry_rel_instrucao_CEP_CLIENTE: TStringField
      FieldName = 'CEP_CLIENTE'
      FixedChar = True
      Size = 8
    end
    object qry_rel_instrucao_FONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 15
    end
    object qry_rel_instrucao_FAX_CLIENTE: TStringField
      FieldName = 'FAX_CLIENTE'
      FixedChar = True
      Size = 15
    end
    object qry_rel_instrucao_NM_EXPORTADOR: TStringField
      FieldName = 'NM_EXPORTADOR'
      FixedChar = True
      Size = 60
    end
    object qry_rel_instrucao_END_EXPORTADOR: TStringField
      FieldName = 'END_EXPORTADOR'
      FixedChar = True
      Size = 60
    end
    object qry_rel_instrucao_NUMERO_EXPORTADOR: TStringField
      FieldName = 'NUMERO_EXPORTADOR'
      FixedChar = True
      Size = 6
    end
    object qry_rel_instrucao_CIDADE_EXPORTADOR: TStringField
      FieldName = 'CIDADE_EXPORTADOR'
      FixedChar = True
      Size = 30
    end
    object qry_rel_instrucao_CONTATO_EXPORTADOR: TStringField
      FieldName = 'CONTATO_EXPORTADOR'
      FixedChar = True
      Size = 50
    end
    object qry_rel_instrucao_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_rel_instrucao_FONE_AGNETE: TStringField
      FieldName = 'FONE_AGNETE'
      FixedChar = True
    end
    object qry_rel_instrucao_FAX_AGENTE: TStringField
      FieldName = 'FAX_AGENTE'
      FixedChar = True
    end
    object qry_rel_instrucao_NM_CIA: TStringField
      FieldName = 'NM_CIA'
      FixedChar = True
      Size = 60
    end
    object qry_rel_instrucao_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_rel_instrucao_SIGLA_ORIGEM: TStringField
      FieldName = 'SIGLA_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_instrucao_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_rel_instrucao_SIGLA_DESTINO: TStringField
      FieldName = 'SIGLA_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_rel_instrucao_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_rel_instrucao_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 60
    end
    object qry_rel_instrucao_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 12
      Calculated = True
    end
    object qry_rel_instrucao_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_instrucao_NM_INCOTERM: TStringField
      FieldName = 'NM_INCOTERM'
      FixedChar = True
      Size = 60
    end
    object qry_rel_instrucao_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_rel_instrucao_NM_FRETE: TStringField
      FieldName = 'NM_FRETE'
      FixedChar = True
      Size = 30
    end
    object qry_rel_instrucao_SIGLA_CID_ORIGEM: TStringField
      FieldName = 'SIGLA_CID_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_instrucao_SIGLA_CID_DESTINO: TStringField
      FieldName = 'SIGLA_CID_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_rel_instrucao_calc_nm_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Size = 50
      Calculated = True
    end
    object qry_rel_instrucao_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qry_rel_instrucao_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_rel_instrucao_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_rel_instrucao_calc_vl_selling_price: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_selling_price'
      Calculated = True
    end
    object qry_rel_instrucao_calc_end_cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_cliente'
      Size = 150
      Calculated = True
    end
    object qry_rel_instrucao_CGC_CLIENTE: TStringField
      FieldName = 'CGC_CLIENTE'
      FixedChar = True
      Size = 14
    end
    object qry_rel_instrucao_CONTATO_EXP: TStringField
      FieldName = 'CONTATO_EXP'
      FixedChar = True
      Size = 50
    end
    object qry_rel_instrucao_FONE_EXP: TStringField
      FieldName = 'FONE_EXP'
      FixedChar = True
      Size = 15
    end
    object qry_rel_instrucao_FAX_EXP: TStringField
      FieldName = 'FAX_EXP'
      FixedChar = True
      Size = 15
    end
    object qry_rel_instrucao_Look_nm_frete: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_frete'
      LookupDataSet = qry_tp_frete_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TP_FRETE'
      Size = 10
      Lookup = True
    end
    object qry_rel_instrucao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_rel_instrucao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_rel_instrucao_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_rel_instrucao_END_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_rel_instrucao_NUMERO_UNID: TStringField
      FieldName = 'NUMERO_UNID'
      FixedChar = True
      Size = 6
    end
    object qry_rel_instrucao_UF_UNID_NEG: TStringField
      FieldName = 'UF_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_rel_instrucao_FONE_UNID: TStringField
      FieldName = 'FONE_UNID'
      FixedChar = True
    end
    object qry_rel_instrucao_CEP_UNID: TStringField
      FieldName = 'CEP_UNID'
      FixedChar = True
      Size = 8
    end
    object qry_rel_instrucao_FAX_UNID: TStringField
      FieldName = 'FAX_UNID'
      FixedChar = True
    end
    object qry_rel_instrucao_cacl_end_unidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'cacl_end_unidade'
      Size = 150
      Calculated = True
    end
    object qry_rel_instrucao_BAIRRO_UNID: TStringField
      FieldName = 'BAIRRO_UNID'
      FixedChar = True
      Size = 30
    end
    object qry_rel_instrucao_CIDADE_UNID: TStringField
      FieldName = 'CIDADE_UNID'
      FixedChar = True
      Size = 30
    end
  end
  object ds_rel_instrucao: TDataSource
    DataSet = qry_rel_instrucao_
    Left = 40
    Top = 4
  end
  object pp_rel_instrucao: TppBDEPipeline
    DataSource = ds_rel_instrucao
    UserName = 'rel_instrucao'
    Left = 346
    Top = 4
    object pp_rel_instrucaoppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField2: TppField
      FieldAlias = 'CD_CLIENTE'
      FieldName = 'CD_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField3: TppField
      FieldAlias = 'CD_EMP_EST'
      FieldName = 'CD_EMP_EST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField4: TppField
      FieldAlias = 'REF_CLIENTE'
      FieldName = 'REF_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField5: TppField
      FieldAlias = 'CD_ORIGEM'
      FieldName = 'CD_ORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField6: TppField
      FieldAlias = 'CD_DESTINO'
      FieldName = 'CD_DESTINO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField7: TppField
      FieldAlias = 'QTD_VOLUME'
      FieldName = 'QTD_VOLUME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField8: TppField
      FieldAlias = 'VL_PESO_BRUTO'
      FieldName = 'VL_PESO_BRUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField9: TppField
      FieldAlias = 'CUBAGEM'
      FieldName = 'CUBAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField10: TppField
      FieldAlias = 'CHARGEABLE'
      FieldName = 'CHARGEABLE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField11: TppField
      FieldAlias = 'VL_TARIFA_FRETE'
      FieldName = 'VL_TARIFA_FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField12: TppField
      FieldAlias = 'VL_FRETE'
      FieldName = 'VL_FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField13: TppField
      FieldAlias = 'TX_DESCR'
      FieldName = 'TX_DESCR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField14: TppField
      FieldAlias = 'NM_CLIENTE'
      FieldName = 'NM_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField15: TppField
      FieldAlias = 'END_CLIENTE'
      FieldName = 'END_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField16: TppField
      FieldAlias = 'NUMERO_CLIENTE'
      FieldName = 'NUMERO_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField17: TppField
      FieldAlias = 'CIDADE_CLIENTE'
      FieldName = 'CIDADE_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField18: TppField
      FieldAlias = 'BAIRRO_CLIENTE'
      FieldName = 'BAIRRO_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField19: TppField
      FieldAlias = 'CEP_CLIENTE'
      FieldName = 'CEP_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField20: TppField
      FieldAlias = 'FONE_CLIENTE'
      FieldName = 'FONE_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField21: TppField
      FieldAlias = 'FAX_CLIENTE'
      FieldName = 'FAX_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField22: TppField
      FieldAlias = 'NM_EXPORTADOR'
      FieldName = 'NM_EXPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField23: TppField
      FieldAlias = 'END_EXPORTADOR'
      FieldName = 'END_EXPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField24: TppField
      FieldAlias = 'NUMERO_EXPORTADOR'
      FieldName = 'NUMERO_EXPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField25: TppField
      FieldAlias = 'CIDADE_EXPORTADOR'
      FieldName = 'CIDADE_EXPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField26: TppField
      FieldAlias = 'CONTATO_EXPORTADOR'
      FieldName = 'CONTATO_EXPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField27: TppField
      FieldAlias = 'NM_AGENTE'
      FieldName = 'NM_AGENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField28: TppField
      FieldAlias = 'FONE_AGNETE'
      FieldName = 'FONE_AGNETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField29: TppField
      FieldAlias = 'FAX_AGENTE'
      FieldName = 'FAX_AGENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField30: TppField
      FieldAlias = 'NM_CIA'
      FieldName = 'NM_CIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField31: TppField
      FieldAlias = 'NM_ORIGEM'
      FieldName = 'NM_ORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField32: TppField
      FieldAlias = 'SIGLA_ORIGEM'
      FieldName = 'SIGLA_ORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField33: TppField
      FieldAlias = 'NM_DESTINO'
      FieldName = 'NM_DESTINO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField34: TppField
      FieldAlias = 'SIGLA_DESTINO'
      FieldName = 'SIGLA_DESTINO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField35: TppField
      FieldAlias = 'CD_ARMADOR'
      FieldName = 'CD_ARMADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField36: TppField
      FieldAlias = 'NM_ARMADOR'
      FieldName = 'NM_ARMADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField37: TppField
      FieldAlias = 'calc_processo'
      FieldName = 'calc_processo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField38: TppField
      FieldAlias = 'CD_INCOTERM'
      FieldName = 'CD_INCOTERM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField39: TppField
      FieldAlias = 'NM_INCOTERM'
      FieldName = 'NM_INCOTERM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField40: TppField
      FieldAlias = 'TP_FRETE'
      FieldName = 'TP_FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField41: TppField
      FieldAlias = 'NM_FRETE'
      FieldName = 'NM_FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField42: TppField
      FieldAlias = 'SIGLA_CID_ORIGEM'
      FieldName = 'SIGLA_CID_ORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField43: TppField
      FieldAlias = 'SIGLA_CID_DESTINO'
      FieldName = 'SIGLA_CID_DESTINO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField44: TppField
      FieldAlias = 'calc_nm_usuario'
      FieldName = 'calc_nm_usuario'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField45: TppField
      FieldAlias = 'NM_MOEDA'
      FieldName = 'NM_MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField46: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField47: TppField
      FieldAlias = 'TP_ESTUFAGEM'
      FieldName = 'TP_ESTUFAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField48: TppField
      FieldAlias = 'calc_vl_selling_price'
      FieldName = 'calc_vl_selling_price'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField49: TppField
      FieldAlias = 'calc_end_cliente'
      FieldName = 'calc_end_cliente'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField50: TppField
      FieldAlias = 'CGC_CLIENTE'
      FieldName = 'CGC_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField51: TppField
      FieldAlias = 'CONTATO_EXP'
      FieldName = 'CONTATO_EXP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField52: TppField
      FieldAlias = 'FONE_EXP'
      FieldName = 'FONE_EXP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField53: TppField
      FieldAlias = 'FAX_EXP'
      FieldName = 'FAX_EXP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField54: TppField
      FieldAlias = 'Look_nm_frete'
      FieldName = 'Look_nm_frete'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField55: TppField
      FieldAlias = 'CD_UNID_NEG'
      FieldName = 'CD_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField56: TppField
      FieldAlias = 'CD_PRODUTO'
      FieldName = 'CD_PRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField57: TppField
      FieldAlias = 'NM_UNID_NEG'
      FieldName = 'NM_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField58: TppField
      FieldAlias = 'END_UNID_NEG'
      FieldName = 'END_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField59: TppField
      FieldAlias = 'NUMERO_UNID'
      FieldName = 'NUMERO_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField60: TppField
      FieldAlias = 'UF_UNID_NEG'
      FieldName = 'UF_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField61: TppField
      FieldAlias = 'FONE_UNID'
      FieldName = 'FONE_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField62: TppField
      FieldAlias = 'CEP_UNID'
      FieldName = 'CEP_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField63: TppField
      FieldAlias = 'FAX_UNID'
      FieldName = 'FAX_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField64: TppField
      FieldAlias = 'cacl_end_unidade'
      FieldName = 'cacl_end_unidade'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField65: TppField
      FieldAlias = 'BAIRRO_UNID'
      FieldName = 'BAIRRO_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object pp_rel_instrucaoppField66: TppField
      FieldAlias = 'CIDADE_UNID'
      FieldName = 'CIDADE_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
  end
  object qry_rel_dimensao_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 540
    Top = 112
  end
  object PP_dimesao_aerea: TppBDEPipeline
    DataSource = ds_instr_carga
    UserName = 'PP_dimesao_aerea'
    Left = 346
    Top = 58
    object PP_dimesao_aereappField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PP_dimesao_aereappField2: TppField
      FieldAlias = 'CD_CARGA'
      FieldName = 'CD_CARGA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PP_dimesao_aereappField3: TppField
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PP_dimesao_aereappField4: TppField
      FieldAlias = 'VL_COMPR'
      FieldName = 'VL_COMPR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PP_dimesao_aereappField5: TppField
      FieldAlias = 'VL_LARG'
      FieldName = 'VL_LARG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PP_dimesao_aereappField6: TppField
      FieldAlias = 'VL_ALT'
      FieldName = 'VL_ALT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PP_dimesao_aereappField7: TppField
      FieldAlias = 'PESO_KG'
      FieldName = 'PESO_KG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PP_dimesao_aereappField8: TppField
      FieldAlias = 'CUBAGEM_VENDA'
      FieldName = 'CUBAGEM_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PP_dimesao_aereappField9: TppField
      FieldAlias = 'PESO_VOLUMETRICO'
      FieldName = 'PESO_VOLUMETRICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PP_dimesao_aereappField10: TppField
      FieldAlias = 'CD_VIA_TRANSP'
      FieldName = 'CD_VIA_TRANSP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PP_dimesao_aereappField11: TppField
      FieldAlias = 'TP_ESTUFAGEM'
      FieldName = 'TP_ESTUFAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PP_dimesao_aereappField12: TppField
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object pp_dimensao_LCL: TppBDEPipeline
    DataSource = ds_instrucao_lcl
    UserName = '_dimensao_LCL'
    Left = 346
    Top = 111
    object pp_dimensao_LCLppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pp_dimensao_LCLppField2: TppField
      FieldAlias = 'CD_CARGA'
      FieldName = 'CD_CARGA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 1
    end
    object pp_dimensao_LCLppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pp_dimensao_LCLppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_COMPR'
      FieldName = 'VL_COMPR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pp_dimensao_LCLppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_LARG'
      FieldName = 'VL_LARG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pp_dimensao_LCLppField6: TppField
      FieldAlias = 'CD_VIA_TRANSP'
      FieldName = 'CD_VIA_TRANSP'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
    object pp_dimensao_LCLppField7: TppField
      FieldAlias = 'TP_ESTUFAGEM'
      FieldName = 'TP_ESTUFAGEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object pp_dimensao_LCLppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_ALT'
      FieldName = 'VL_ALT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pp_dimensao_LCLppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PESO_TON'
      FieldName = 'PESO_TON'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pp_dimensao_LCLppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUBAGEM_VENDA'
      FieldName = 'CUBAGEM_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pp_dimensao_LCLppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PESO_VOLUMETRICO'
      FieldName = 'PESO_VOLUMETRICO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pp_dimensao_LCLppField12: TppField
      FieldAlias = 'TP_EMBALAGEM'
      FieldName = 'TP_EMBALAGEM'
      FieldLength = 4
      DisplayWidth = 4
      Position = 11
    end
    object pp_dimensao_LCLppField13: TppField
      FieldAlias = 'NM_EMBALAGEM'
      FieldName = 'NM_EMBALAGEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
  end
  object pp_dimensao_FCL: TppBDEPipeline
    DataSource = ds_instrucao_fcl
    UserName = '_dimensao_FCL'
    Left = 346
    Top = 164
    object pp_dimensao_FCLppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pp_dimensao_FCLppField2: TppField
      FieldAlias = 'CD_CARGA'
      FieldName = 'CD_CARGA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pp_dimensao_FCLppField3: TppField
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pp_dimensao_FCLppField4: TppField
      FieldAlias = 'CD_VIA_TRANSP'
      FieldName = 'CD_VIA_TRANSP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pp_dimensao_FCLppField5: TppField
      FieldAlias = 'TP_ESTUFAGEM'
      FieldName = 'TP_ESTUFAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pp_dimensao_FCLppField6: TppField
      FieldAlias = 'PESO_TON'
      FieldName = 'PESO_TON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pp_dimensao_FCLppField7: TppField
      FieldAlias = 'PESO_VOLUMETRICO'
      FieldName = 'PESO_VOLUMETRICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pp_dimensao_FCLppField8: TppField
      FieldAlias = 'TP_CNTR'
      FieldName = 'TP_CNTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pp_dimensao_FCLppField9: TppField
      FieldAlias = 'Look_nm_cntr'
      FieldName = 'Look_nm_cntr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pp_dimensao_FCLppField10: TppField
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pp_dimensao_FCLppField11: TppField
      FieldAlias = 'VL_COMPRA'
      FieldName = 'VL_COMPRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppRepAg
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 346
    Top = 512
  end
  object dsShippingMar: TDataSource
    DataSet = qryShippingMar
    Left = 40
    Top = 464
  end
  object dsRelDet1: TDataSource
    DataSet = qryRelDet1
    Left = 40
    Top = 512
  end
  object qryRelDet1: TQuery
    Active = True
    OnCalcFields = qryRelDet1CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT (SELECT CASE ISNULL(I.NM_ITEM_INGLES, '#39#39')'
      '               WHEN '#39#39' THEN I.NM_ITEM'
      
        '               ELSE I.NM_ITEM_INGLES END FROM TITEM I (NOLOCK) W' +
        'HERE PFD.CD_ITEM = I.CD_ITEM) AS NM_ITEM,'
      '        CASE PFD.CD_MOEDA'
      '          WHEN '#39'220'#39' THEN '#39'USD'#39
      '          WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '          ELSE (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) ' +
        'WHERE M.CD_MOEDA = PFD.CD_MOEDA)'
      '        END AS MOEDA,  '
      '        ISNULL(PFD.VL_BASE_AG, 0) AS COMPRA,'
      '        ISNULL(PFD.VL_VENDA  , 0) AS VENDA,'
      
        '        ISNULL(PFD.VL_VENDA  , 0) - ISNULL(PFD.VL_BASE_AG, 0) AS' +
        ' PROFIT,'
      '       (CASE ISNULL(PFD.IN_PROFIT, '#39'0'#39')'
      '           WHEN '#39'0'#39' THEN 0'
      
        '           WHEN '#39'1'#39' THEN  ISNULL(PFD.VL_VENDA  , 0) - ISNULL(PFD' +
        '.VL_BASE_AG, 0)'
      '        END) AS PROFIT_AG,'
      '        (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39') '
      
        '           WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO)*ISNULL(PFD.VL_B' +
        'ASE_AG, 0)'
      
        '           WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'2'#39'))*ISNULL(PFD' +
        '.VL_BASE_AG, 0)'
      
        '           WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'4'#39'))*ISNULL(PFD' +
        '.VL_BASE_AG, 0)'
      '           WHEN '#39'14'#39' THEN CASE'
      
        '                            WHEN   (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO)) '
      
        '                                 > (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO))'
      
        '                            THEN (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      
        '                            ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      '                          END'
      '           ELSE ISNULL(PFD.VL_BASE_AG, 0) END) AS COMPRA_TOT,'
      '        (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39') '
      
        '           WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO)*ISNULL(PFD.VL_V' +
        'ENDA, 0)'
      
        '           WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'2'#39'))*ISNULL(PFD' +
        '.VL_VENDA, 0)'
      
        '           WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'4'#39'))*ISNULL(PFD' +
        '.VL_VENDA, 0)'
      '           WHEN '#39'14'#39' THEN CASE'
      
        '                            WHEN   (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO)) '
      
        '                                 > (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO))'
      
        '                            THEN (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_VENDA, 0)'
      
        '                            ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_VENDA, 0)'
      '                          END'
      '           ELSE ISNULL(PFD.VL_VENDA, 0) END) AS VENDA_TOT,'
      '        (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39') '
      
        '           WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO)*ISNULL(PFD.VL_V' +
        'ENDA, 0)'
      
        '           WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'2'#39'))*ISNULL(PFD' +
        '.VL_VENDA, 0)'
      
        '           WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'4'#39'))*ISNULL(PFD' +
        '.VL_VENDA, 0)'
      '           WHEN '#39'14'#39' THEN CASE'
      
        '                            WHEN   (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO)) '
      
        '                                 > (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO))'
      
        '                            THEN (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_VENDA, 0)'
      
        '                            ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_VENDA, 0)'
      '                          END'
      '           ELSE ISNULL(PFD.VL_VENDA, 0) END) -'
      '        (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39') '
      
        '           WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO)*ISNULL(PFD.VL_B' +
        'ASE_AG, 0)'
      
        '           WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'2'#39'))*ISNULL(PFD' +
        '.VL_BASE_AG, 0)'
      
        '           WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'4'#39'))*ISNULL(PFD' +
        '.VL_BASE_AG, 0)'
      '           WHEN '#39'14'#39' THEN CASE'
      
        '                            WHEN   (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO)) '
      
        '                                 > (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO))'
      
        '                            THEN (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      
        '                            ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      '                          END'
      '           ELSE ISNULL(PFD.VL_BASE_AG, 0) END) AS PROFIT_TOT,'
      '        (CASE ISNULL(PFD.IN_PROFIT, '#39'0'#39')'
      '           WHEN '#39'0'#39'  THEN 0'
      
        '           WHEN '#39'1'#39'  THEN (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39')' +
        ' '
      
        '                            WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ')*ISNULL(PFD.VL_VENDA, 0)'
      
        '                            WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ' AND PC.TP_CNTR IN (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO =' +
        ' '#39'2'#39'))*ISNULL(PFD.VL_VENDA, 0)'
      
        '                            WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ' AND PC.TP_CNTR IN (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO =' +
        ' '#39'4'#39'))*ISNULL(PFD.VL_VENDA, 0)'
      '                            WHEN '#39'14'#39' THEN CASE'
      
        '                                             WHEN   (SELECT ISNU' +
        'LL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORI' +
        'A PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM T' +
        'PROCESSO (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO)) '
      
        '                                                  > (SELECT ISNU' +
        'LL(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORI' +
        'A PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM T' +
        'PROCESSO (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO))'
      
        '                                             THEN (SELECT ISNULL' +
        '(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA ' +
        'PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPR' +
        'OCESSO (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.V' +
        'L_VENDA, 0)'
      
        '                                             ELSE (SELECT ISNULL' +
        '(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA ' +
        'PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPR' +
        'OCESSO (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.V' +
        'L_VENDA, 0)'
      '                                           END'
      ''
      '                            ELSE ISNULL(PFD.VL_VENDA, 0) END) -'
      '                         (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39') '
      
        '                            WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ')*ISNULL(PFD.VL_BASE_AG, 0)'
      
        '                            WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ' AND PC.TP_CNTR IN (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO =' +
        ' '#39'2'#39'))*ISNULL(PFD.VL_BASE_AG, 0)'
      
        '                            WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ' AND PC.TP_CNTR IN (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO =' +
        ' '#39'4'#39'))*ISNULL(PFD.VL_BASE_AG, 0)'
      ' '#9#9#9'    WHEN '#39'14'#39' THEN CASE'
      
        #9#9#9'                     WHEN   (SELECT ISNULL(SUM(ISNULL(PM.VL_C' +
        'UBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE P' +
        'M.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHE' +
        'RE NR_PROCESSO = P.NR_PROCESSO)) '
      
        #9#9#9'                          > (SELECT ISNULL(SUM(ISNULL(PM.VL_P' +
        'ESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE P' +
        'M.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHE' +
        'RE NR_PROCESSO = P.NR_PROCESSO))'
      
        #9#9#9'                     THEN (SELECT ISNULL(SUM(ISNULL(PM.VL_CUB' +
        'AGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.' +
        'NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE' +
        ' NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      
        ' '#9#9#9'                     ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL_PE' +
        'SO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM' +
        '.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHER' +
        'E NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      '   '#9#9#9'                   END'
      '                            ELSE ISNULL(PFD.VL_BASE_AG, 0) END)'
      '         END) AS PROFIT_TOT_AG,'
      '        PFD.IN_PROFIT, PFD.TP_BASE_CALCULO '
      '  FROM TPROCESSO P (NOLOCK)'
      
        '  LEFT JOIN TPROPOSTA PROP (NOLOCK) ON  PROP.NR_PROPOSTA = P.NR_' +
        'PROPOSTA'
      '                                    AND PROP.TP_PROPOSTA = '#39'1'#39
      
        '  LEFT JOIN TPROPOSTA_FRETE PF (NOLOCK) ON PF.NR_PROPOSTA = PROP' +
        '.NR_PROPOSTA'
      
        '  LEFT JOIN TPROPOSTA_FRETE_DESPESA PFD (NOLOCK) ON PFD.NR_PROPO' +
        'STA = PROP.NR_PROPOSTA'
      
        '                                                 AND PFD.TP_ESTU' +
        'FAGEM = P.TP_ESTUFAGEM'
      
        '                                                 AND PFD.NR_ITEM' +
        '_PROPOSTA = '#39'1'#39
      '  LEFT JOIN TAGENTE AG (NOLOCK) ON AG.CD_AGENTE = P.CD_AGENTE'
      ' WHERE P.NR_PROCESSO = :NR_PROCESSO'
      
        '   AND PFD.CD_ITEM NOT IN (SELECT CD_ITEM FROM TTAB_FRETE_DESPES' +
        'A TFD (NOLOCK) WHERE TFD.CD_TAB_FRETE = PF.CD_TAB_FRETE)'
      '   AND PFD.TP_ORIGEM_DESPESA = '#39'7'#39)
    Left = 152
    Top = 512
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryRelDet1NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qryRelDet1MOEDA: TStringField
      FieldName = 'MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryRelDet1COMPRA: TFloatField
      FieldName = 'COMPRA'
    end
    object qryRelDet1PROFIT: TFloatField
      FieldName = 'PROFIT'
    end
    object qryRelDet1PROFIT_AG: TFloatField
      FieldName = 'PROFIT_AG'
    end
    object qryRelDet1VENDA: TFloatField
      FieldName = 'VENDA'
    end
    object qryRelDet1COMPRA_TOT: TFloatField
      FieldName = 'COMPRA_TOT'
    end
    object qryRelDet1VENDA_TOT: TFloatField
      FieldName = 'VENDA_TOT'
    end
    object qryRelDet1IN_PROFIT: TStringField
      FieldName = 'IN_PROFIT'
      FixedChar = True
      Size = 1
    end
    object qryRelDet1PROFIT_TOT: TFloatField
      FieldName = 'PROFIT_TOT'
    end
    object qryRelDet1PROFIT_TOT_AG: TFloatField
      FieldName = 'PROFIT_TOT_AG'
    end
    object qryRelDet1calcItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcItem'
      Size = 100
      Calculated = True
    end
    object qryRelDet1TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      FixedChar = True
      Size = 2
    end
  end
  object dsRelDet2: TDataSource
    DataSet = qryRelDet2
    Left = 40
    Top = 560
  end
  object qryRelDet2: TQuery
    Active = True
    OnCalcFields = qryRelDet1CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT (SELECT CASE ISNULL(I.NM_ITEM_INGLES, '#39#39')'
      '               WHEN '#39#39' THEN I.NM_ITEM'
      
        '               ELSE I.NM_ITEM_INGLES END FROM TITEM I (NOLOCK) W' +
        'HERE PFD.CD_ITEM = I.CD_ITEM) AS NM_ITEM,'
      '        CASE PFD.CD_MOEDA'
      '          WHEN '#39'220'#39' THEN '#39'USD'#39
      '          WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '          ELSE (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) ' +
        'WHERE M.CD_MOEDA = PFD.CD_MOEDA)'
      '        END AS MOEDA,  '
      '        ISNULL(PFD.VL_BASE_AG, 0) AS COMPRA,'
      '        ISNULL(PFD.VL_VENDA  , 0) AS VENDA,'
      
        '        ISNULL(PFD.VL_VENDA  , 0) - ISNULL(PFD.VL_BASE_AG, 0) AS' +
        ' PROFIT,'
      '       (CASE ISNULL(PFD.IN_PROFIT, '#39'0'#39')'
      '           WHEN '#39'0'#39' THEN 0'
      
        '           WHEN '#39'1'#39' THEN  ISNULL(PFD.VL_VENDA  , 0) - ISNULL(PFD' +
        '.VL_BASE_AG, 0)'
      '        END) AS PROFIT_AG,'
      '        (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39') '
      
        '           WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO)*ISNULL(PFD.VL_B' +
        'ASE_AG, 0)'
      
        '           WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'2'#39'))*ISNULL(PFD' +
        '.VL_BASE_AG, 0)'
      
        '           WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'4'#39'))*ISNULL(PFD' +
        '.VL_BASE_AG, 0)'
      '           WHEN '#39'14'#39' THEN CASE'
      
        '                            WHEN   (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO)) '
      
        '                                 > (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO))'
      
        '                            THEN (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      
        '                            ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      '                          END'
      '           ELSE ISNULL(PFD.VL_BASE_AG, 0) END) AS COMPRA_TOT,'
      '        (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39') '
      
        '           WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO)*ISNULL(PFD.VL_V' +
        'ENDA, 0)'
      
        '           WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'2'#39'))*ISNULL(PFD' +
        '.VL_VENDA, 0)'
      
        '           WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'4'#39'))*ISNULL(PFD' +
        '.VL_VENDA, 0)'
      '           WHEN '#39'14'#39' THEN CASE'
      
        '                            WHEN   (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO)) '
      
        '                                 > (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO))'
      
        '                            THEN (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_VENDA, 0)'
      
        '                            ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_VENDA, 0)'
      '                          END'
      '           ELSE ISNULL(PFD.VL_VENDA, 0) END) AS VENDA_TOT,'
      '        (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39') '
      
        '           WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO)*ISNULL(PFD.VL_V' +
        'ENDA, 0)'
      
        '           WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'2'#39'))*ISNULL(PFD' +
        '.VL_VENDA, 0)'
      
        '           WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'4'#39'))*ISNULL(PFD' +
        '.VL_VENDA, 0)'
      '           WHEN '#39'14'#39' THEN CASE'
      
        '                            WHEN   (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO)) '
      
        '                                 > (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO))'
      
        '                            THEN (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_VENDA, 0)'
      
        '                            ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_VENDA, 0)'
      '                          END'
      '           ELSE ISNULL(PFD.VL_VENDA, 0) END) -'
      '        (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39') '
      
        '           WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO)*ISNULL(PFD.VL_B' +
        'ASE_AG, 0)'
      
        '           WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'2'#39'))*ISNULL(PFD' +
        '.VL_BASE_AG, 0)'
      
        '           WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR P' +
        'C (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO AND PC.TP_CNTR I' +
        'N (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = '#39'4'#39'))*ISNULL(PFD' +
        '.VL_BASE_AG, 0)'
      '           WHEN '#39'14'#39' THEN CASE'
      
        '                            WHEN   (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO)) '
      
        '                                 > (SELECT ISNULL(SUM(ISNULL(PM.' +
        'VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHE' +
        'RE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK)' +
        ' WHERE NR_PROCESSO = P.NR_PROCESSO))'
      
        '                            THEN (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      
        '                            ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL' +
        '_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE' +
        ' PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) W' +
        'HERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      '                          END'
      '           ELSE ISNULL(PFD.VL_BASE_AG, 0) END) AS PROFIT_TOT,'
      '        (CASE ISNULL(PFD.IN_PROFIT, '#39'0'#39')'
      '           WHEN '#39'0'#39'  THEN 0'
      
        '           WHEN '#39'1'#39'  THEN (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39')' +
        ' '
      
        '                            WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ')*ISNULL(PFD.VL_VENDA, 0)'
      
        '                            WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ' AND PC.TP_CNTR IN (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO =' +
        ' '#39'2'#39'))*ISNULL(PFD.VL_VENDA, 0)'
      
        '                            WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ' AND PC.TP_CNTR IN (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO =' +
        ' '#39'4'#39'))*ISNULL(PFD.VL_VENDA, 0)'
      '                            WHEN '#39'14'#39' THEN CASE'
      
        '                                             WHEN   (SELECT ISNU' +
        'LL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORI' +
        'A PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM T' +
        'PROCESSO (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO)) '
      
        '                                                  > (SELECT ISNU' +
        'LL(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORI' +
        'A PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM T' +
        'PROCESSO (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO))'
      
        '                                             THEN (SELECT ISNULL' +
        '(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA ' +
        'PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPR' +
        'OCESSO (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.V' +
        'L_VENDA, 0)'
      
        '                                             ELSE (SELECT ISNULL' +
        '(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA ' +
        'PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPR' +
        'OCESSO (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.V' +
        'L_VENDA, 0)'
      '                                           END'
      ''
      '                            ELSE ISNULL(PFD.VL_VENDA, 0) END) -'
      '                         (CASE ISNULL(PFD.TP_BASE_CALCULO, '#39'0'#39') '
      
        '                            WHEN '#39'10'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ')*ISNULL(PFD.VL_BASE_AG, 0)'
      
        '                            WHEN '#39'11'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ' AND PC.TP_CNTR IN (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO =' +
        ' '#39'2'#39'))*ISNULL(PFD.VL_BASE_AG, 0)'
      
        '                            WHEN '#39'12'#39' THEN (SELECT COUNT(*) FROM' +
        ' TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = P.NR_PROCESSO' +
        ' AND PC.TP_CNTR IN (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO =' +
        ' '#39'4'#39'))*ISNULL(PFD.VL_BASE_AG, 0)'
      ' '#9#9#9'    WHEN '#39'14'#39' THEN CASE'
      
        #9#9#9'                     WHEN   (SELECT ISNULL(SUM(ISNULL(PM.VL_C' +
        'UBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE P' +
        'M.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHE' +
        'RE NR_PROCESSO = P.NR_PROCESSO)) '
      
        #9#9#9'                          > (SELECT ISNULL(SUM(ISNULL(PM.VL_P' +
        'ESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE P' +
        'M.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHE' +
        'RE NR_PROCESSO = P.NR_PROCESSO))'
      
        #9#9#9'                     THEN (SELECT ISNULL(SUM(ISNULL(PM.VL_CUB' +
        'AGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.' +
        'NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE' +
        ' NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      
        ' '#9#9#9'                     ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL_PE' +
        'SO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM' +
        '.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHER' +
        'E NR_PROCESSO = P.NR_PROCESSO))*ISNULL(PFD.VL_BASE_AG, 0)'
      '   '#9#9#9'                   END'
      '                            ELSE ISNULL(PFD.VL_BASE_AG, 0) END)'
      '         END) AS PROFIT_TOT_AG,'
      '        PFD.IN_PROFIT, PFD.TP_BASE_CALCULO '
      '  FROM TPROCESSO P (NOLOCK)'
      
        '  LEFT JOIN TPROPOSTA PROP (NOLOCK) ON  PROP.NR_PROPOSTA = P.NR_' +
        'PROPOSTA'
      '                                    AND PROP.TP_PROPOSTA = '#39'1'#39
      
        '  LEFT JOIN TPROPOSTA_FRETE PF (NOLOCK) ON PF.NR_PROPOSTA = PROP' +
        '.NR_PROPOSTA'
      
        '  LEFT JOIN TPROPOSTA_FRETE_DESPESA PFD (NOLOCK) ON PFD.NR_PROPO' +
        'STA = PROP.NR_PROPOSTA'
      
        '                                                 AND PFD.TP_ESTU' +
        'FAGEM = P.TP_ESTUFAGEM'
      
        '                                                 AND PFD.NR_ITEM' +
        '_PROPOSTA = '#39'1'#39
      '  LEFT JOIN TAGENTE AG (NOLOCK) ON AG.CD_AGENTE = P.CD_AGENTE'
      ' WHERE P.NR_PROCESSO = :NR_PROCESSO'
      
        '   AND PFD.CD_ITEM IN (SELECT CD_ITEM FROM TTAB_FRETE_DESPESA TF' +
        'D (NOLOCK) WHERE TFD.CD_TAB_FRETE = PF.CD_TAB_FRETE)'
      '')
    Left = 152
    Top = 561
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'MOEDA'
      FixedChar = True
      Size = 6
    end
    object FloatField1: TFloatField
      FieldName = 'COMPRA'
    end
    object FloatField2: TFloatField
      FieldName = 'PROFIT'
    end
    object FloatField3: TFloatField
      FieldName = 'PROFIT_AG'
    end
    object FloatField4: TFloatField
      FieldName = 'VENDA'
    end
    object qryRelDet2COMPRA_TOT: TFloatField
      FieldName = 'COMPRA_TOT'
    end
    object qryRelDet2VENDA_TOT: TFloatField
      FieldName = 'VENDA_TOT'
    end
    object qryRelDet2IN_PROFIT: TStringField
      FieldName = 'IN_PROFIT'
      FixedChar = True
      Size = 1
    end
    object qryRelDet2PROFIT_TOT: TFloatField
      FieldName = 'PROFIT_TOT'
    end
    object qryRelDet2PROFIT_TOT_AG: TFloatField
      FieldName = 'PROFIT_TOT_AG'
    end
    object qryRelDet2calcItem2: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcItem'
      Size = 100
      Calculated = True
    end
    object qryRelDet2TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      FixedChar = True
      Size = 2
    end
  end
  object ppDet1: TppBDEPipeline
    DataSource = dsRelDet1
    UserName = 'Det1'
    Left = 248
    Top = 512
    object ppDet1ppField1: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDet1ppField2: TppField
      FieldAlias = 'MOEDA'
      FieldName = 'MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 1
    end
    object ppDet1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'COMPRA'
      FieldName = 'COMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDet1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROFIT'
      FieldName = 'PROFIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDet1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROFIT_AG'
      FieldName = 'PROFIT_AG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDet1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VENDA'
      FieldName = 'VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDet1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'COMPRA_TOT'
      FieldName = 'COMPRA_TOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDet1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VENDA_TOT'
      FieldName = 'VENDA_TOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDet1ppField9: TppField
      FieldAlias = 'IN_PROFIT'
      FieldName = 'IN_PROFIT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object ppDet1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROFIT_TOT'
      FieldName = 'PROFIT_TOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDet1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROFIT_TOT_AG'
      FieldName = 'PROFIT_TOT_AG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDet1ppField12: TppField
      FieldAlias = 'calcItem'
      FieldName = 'calcItem'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
    object ppDet1ppField13: TppField
      FieldAlias = 'TP_BASE_CALCULO'
      FieldName = 'TP_BASE_CALCULO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 12
    end
  end
  object ppDet2: TppBDEPipeline
    DataSource = dsRelDet2
    UserName = 'Det2'
    Left = 248
    Top = 560
    object ppDet2ppField1: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDet2ppField2: TppField
      FieldAlias = 'MOEDA'
      FieldName = 'MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 1
    end
    object ppDet2ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'COMPRA'
      FieldName = 'COMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDet2ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROFIT'
      FieldName = 'PROFIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDet2ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROFIT_AG'
      FieldName = 'PROFIT_AG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDet2ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VENDA'
      FieldName = 'VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDet2ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'COMPRA_TOT'
      FieldName = 'COMPRA_TOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDet2ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VENDA_TOT'
      FieldName = 'VENDA_TOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDet2ppField9: TppField
      FieldAlias = 'IN_PROFIT'
      FieldName = 'IN_PROFIT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object ppDet2ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROFIT_TOT'
      FieldName = 'PROFIT_TOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDet2ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROFIT_TOT_AG'
      FieldName = 'PROFIT_TOT_AG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDet2ppField12: TppField
      FieldAlias = 'calcItem'
      FieldName = 'calcItem'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
    object ppDet2ppField13: TppField
      FieldAlias = 'TP_BASE_CALCULO'
      FieldName = 'TP_BASE_CALCULO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 12
    end
  end
  object ppRepAg: TppReport
    AutoStop = False
    DataPipeline = ppGeral1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\SIagenteLCL.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 346
    Top = 464
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppGeral1'
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 222780
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = True
        DataPipelineName = 'ppDet2'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 154517
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = ppDet2
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDet2'
          object ppTitleBand5: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText76: TppDBText
              UserName = 'DBText76'
              DataField = 'calcItem'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 800
              mmTop = 0
              mmWidth = 50271
              BandType = 4
            end
            object ppDBText77: TppDBText
              UserName = 'DBText77'
              DataField = 'MOEDA'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 54769
              mmTop = 0
              mmWidth = 20000
              BandType = 4
            end
            object ppDBText78: TppDBText
              UserName = 'DBText78'
              DataField = 'COMPRA'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 75671
              mmTop = 0
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText79: TppDBText
              UserName = 'DBText79'
              DataField = 'MOEDA'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 111919
              mmTop = 0
              mmWidth = 20000
              BandType = 4
            end
            object ppDBText80: TppDBText
              UserName = 'DBText80'
              DataField = 'VENDA'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 133086
              mmTop = 0
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText81: TppDBText
              UserName = 'DBText81'
              DataField = 'PROFIT_AG'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 173830
              mmTop = 0
              mmWidth = 21696
              BandType = 4
            end
          end
          object ppSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2381
            mmPrintPosition = 0
          end
        end
      end
      object ppLabel35: TppLabel
        UserName = 'Label1'
        Caption = 'Attention to Mr/s.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4360
        mmLeft = 10319
        mmTop = 28310
        mmWidth = 32131
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label2'
        Caption = 'TO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 35454
        mmTop = 22754
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = ' SHIPPING INSTRUCTIONS - '
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 5556
        mmLeft = 529
        mmTop = 34396
        mmWidth = 196057
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 529
        mmTop = 39952
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Shipper/Exporter: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 41275
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Address: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 45508
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Cnee/Importer: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 57679
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Address: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 61913
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Commodity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 75671
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Incoterm '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 79904
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Container 20'#39
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 84138
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Container 40'#39' '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 88371
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Weight/KG'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 92604
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Dims/CBM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 96838
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Volume'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 101071
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = ' AGREED RATES:'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 5556
        mmLeft = 529
        mmTop = 131498
        mmWidth = 196057
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 529
        mmTop = 137054
        mmWidth = 196057
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 265
        mmTop = 130969
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Currency'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3556
        mmLeft = 111919
        mmTop = 139965
        mmWidth = 20000
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = '   Selling Rate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 133350
        mmTop = 139965
        mmWidth = 32279
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = '   Buying Rate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3556
        mmLeft = 75406
        mmTop = 139965
        mmWidth = 32279
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Currency'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3556
        mmLeft = 54504
        mmTop = 139965
        mmWidth = 20000
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Profit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3556
        mmLeft = 173832
        mmTop = 140229
        mmWidth = 21696
        BandType = 0
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubReport4'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport3
        TraverseAllData = True
        DataPipelineName = 'ppDet1'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 196057
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport7: TppChildReport
          AutoStop = False
          DataPipeline = ppDet1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDet1'
          object ppTitleBand7: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppLabel84: TppLabel
              UserName = 'Label304'
              AutoSize = False
              Caption = 'Expenses abroad:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3900
              mmLeft = 3000
              mmTop = 0
              mmWidth = 42863
              BandType = 1
            end
          end
          object ppDetailBand9: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText94: TppDBText
              UserName = 'DBText94'
              DataField = 'calcItem'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 794
              mmTop = 264
              mmWidth = 50800
              BandType = 4
            end
            object ppDBText95: TppDBText
              UserName = 'DBText95'
              DataField = 'MOEDA'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 54769
              mmTop = 264
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText96: TppDBText
              UserName = 'DBText96'
              DataField = 'COMPRA_TOT'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 75671
              mmTop = 264
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText97: TppDBText
              UserName = 'DBText97'
              DataField = 'MOEDA'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 111919
              mmTop = 264
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText98: TppDBText
              UserName = 'DBText98'
              DataField = 'VENDA_TOT'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 133086
              mmTop = 264
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText99: TppDBText
              UserName = 'DBText99'
              DataField = 'PROFIT_TOT_AG'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 173832
              mmTop = 264
              mmWidth = 21696
              BandType = 4
            end
          end
          object ppSummaryBand7: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
          end
        end
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        DataField = 'NM_EXPORTADOR'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 41275
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        DataField = 'END_EXPORTADOR1'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 45508
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        DataField = 'END_EXPORTADOR2'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 49213
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'NM_EMPRESA'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 57415
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        DataField = 'END_EXPORTADOR3'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 52917
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText59: TppDBText
        UserName = 'DBText59'
        DataField = 'END_IMPORTADOR1'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 61913
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'END_IMPORTADOR2'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 65617
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText61: TppDBText
        UserName = 'DBText61'
        DataField = 'CNPJ_IMPORTADOR'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 69321
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'calcVolume'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 101071
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText63: TppDBText
        UserName = 'DBText601'
        DataField = 'calcDims'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 96838
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = 'calcWeight'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 92604
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = 'CNTR40'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 88371
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText66: TppDBText
        UserName = 'DBText66'
        DataField = 'CNTR20'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 84138
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText67: TppDBText
        UserName = 'DBText67'
        DataField = 'CD_INCOTERM'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 79904
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText68: TppDBText
        UserName = 'DBText68'
        DataField = 'calcCommodity'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 75671
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText69: TppDBText
        UserName = 'DBText69'
        DataField = 'NM_AGENTE'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 4741
        mmLeft = 43921
        mmTop = 23019
        mmWidth = 150813
        BandType = 0
      end
      object ppRegion2: TppRegion
        UserName = 'Region2'
        Brush.Style = bsClear
        Caption = 'Region2'
        Pen.Style = psClear
        ShiftRelativeTo = ppSubReport2
        Stretch = True
        Transparent = True
        mmHeight = 25665
        mmLeft = 0
        mmTop = 165100
        mmWidth = 197644
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel77: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = ' TOTAL of the RATES:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          mmHeight = 5556
          mmLeft = 529
          mmTop = 168010
          mmWidth = 196057
          BandType = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 2117
          mmLeft = 265
          mmTop = 173567
          mmWidth = 196057
          BandType = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 2117
          mmLeft = 529
          mmTop = 167481
          mmWidth = 196057
          BandType = 0
        end
        object ppLabel78: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'Currency'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3556
          mmLeft = 111919
          mmTop = 176742
          mmWidth = 20108
          BandType = 0
        end
        object ppLabel79: TppLabel
          UserName = 'Label23'
          AutoSize = False
          Caption = '   Selling Rate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3556
          mmLeft = 133350
          mmTop = 176742
          mmWidth = 32279
          BandType = 0
        end
        object ppLabel80: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = '   Buying Rate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3556
          mmLeft = 75142
          mmTop = 176742
          mmWidth = 32279
          BandType = 0
        end
        object ppLabel81: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Caption = 'Currency'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3556
          mmLeft = 54240
          mmTop = 176742
          mmWidth = 20108
          BandType = 0
        end
        object ppLabel82: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Profit'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3556
          mmLeft = 174361
          mmTop = 177006
          mmWidth = 21696
          BandType = 0
        end
        object ppLabel83: TppLabel
          UserName = 'Label83'
          AutoSize = False
          Caption = 'Shipping rates:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3969
          mmLeft = 3440
          mmTop = 180976
          mmWidth = 42863
          BandType = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'calcItem'
          DataPipeline = ppDet3
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDet3'
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 185738
          mmWidth = 50800
          BandType = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'MOEDA'
          DataPipeline = ppDet3
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDet3'
          mmHeight = 3969
          mmLeft = 55298
          mmTop = 185738
          mmWidth = 20108
          BandType = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText901'
          DataField = 'COMPRA_TOT'
          DataPipeline = ppDet3
          DisplayFormat = '#0.,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDet3'
          mmHeight = 3969
          mmLeft = 76200
          mmTop = 185738
          mmWidth = 32015
          BandType = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'MOEDA'
          DataPipeline = ppDet3
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDet3'
          mmHeight = 3969
          mmLeft = 112448
          mmTop = 185738
          mmWidth = 20108
          BandType = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'VENDA_TOT'
          DataPipeline = ppDet3
          DisplayFormat = '#0.,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDet3'
          mmHeight = 3969
          mmLeft = 133615
          mmTop = 185738
          mmWidth = 32015
          BandType = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'PROFIT_TOT'
          DataPipeline = ppDet3
          DisplayFormat = '#0.,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDet3'
          mmHeight = 3969
          mmLeft = 174361
          mmTop = 185738
          mmWidth = 21696
          BandType = 0
        end
      end
      object ppRegion3: TppRegion
        UserName = 'Region3'
        Brush.Style = bsClear
        Caption = 'Region3'
        Pen.Style = psClear
        ShiftRelativeTo = ppSubReport4
        Stretch = True
        Transparent = True
        mmHeight = 21960
        mmLeft = 265
        mmTop = 200819
        mmWidth = 197644
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 2117
          mmLeft = 530
          mmTop = 202407
          mmWidth = 196057
          BandType = 0
        end
        object ppLabel85: TppLabel
          UserName = 'Label31'
          AutoSize = False
          Caption = ' Remarks:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          mmHeight = 5556
          mmLeft = 529
          mmTop = 202936
          mmWidth = 196321
          BandType = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 2117
          mmLeft = 530
          mmTop = 208492
          mmWidth = 196057
          BandType = 0
        end
        object ppDBMemo2: TppDBMemo
          UserName = 'DBMemo2'
          CharWrap = False
          DataField = 'TX_DESCR'
          DataPipeline = ppGeral1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppGeral1'
          mmHeight = 11377
          mmLeft = 1853
          mmTop = 209815
          mmWidth = 193940
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppRegion2
        TraverseAllData = True
        DataPipelineName = 'ppDet2'
        mmHeight = 4763
        mmLeft = 0
        mmTop = 190765
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport6: TppChildReport
          AutoStop = False
          DataPipeline = ppDet2
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDet2'
          object ppTitleBand6: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand8: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText88: TppDBText
              UserName = 'DBText88'
              DataField = 'calcItem'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 794
              mmTop = 529
              mmWidth = 50800
              BandType = 4
            end
            object ppDBText89: TppDBText
              UserName = 'DBText89'
              DataField = 'MOEDA'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 54769
              mmTop = 529
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText90: TppDBText
              UserName = 'DBText90'
              DataField = 'COMPRA_TOT'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 75671
              mmTop = 529
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText91: TppDBText
              UserName = 'DBText91'
              DataField = 'MOEDA'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 111919
              mmTop = 529
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText92: TppDBText
              UserName = 'DBText92'
              DataField = 'VENDA_TOT'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 133086
              mmTop = 529
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText93: TppDBText
              UserName = 'DBText93'
              DataField = 'PROFIT_TOT_AG'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3969
              mmLeft = 174361
              mmTop = 529
              mmWidth = 21696
              BandType = 4
            end
          end
          object ppSummaryBand6: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2381
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport1
        TraverseAllData = True
        DataPipelineName = 'ppDet1'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 160073
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = ppDet1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDet1'
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppLabel76: TppLabel
              UserName = 'Label1'
              AutoSize = False
              Caption = 'Expenses abroad:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              mmHeight = 3900
              mmLeft = 3000
              mmTop = 0
              mmWidth = 42863
              BandType = 1
            end
          end
          object ppDetailBand7: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText82: TppDBText
              UserName = 'DBText82'
              DataField = 'calcItem'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 794
              mmTop = 0
              mmWidth = 50800
              BandType = 4
            end
            object ppDBText83: TppDBText
              UserName = 'DBText83'
              DataField = 'MOEDA'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 54769
              mmTop = 0
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText84: TppDBText
              UserName = 'DBText84'
              DataField = 'COMPRA'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 75671
              mmTop = 0
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText85: TppDBText
              UserName = 'DBText85'
              DataField = 'MOEDA'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 111919
              mmTop = 0
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText86: TppDBText
              UserName = 'DBText801'
              DataField = 'VENDA'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 133086
              mmTop = 0
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText87: TppDBText
              UserName = 'DBText87'
              DataField = 'PROFIT_AG'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 173832
              mmTop = 0
              mmWidth = 21696
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2117
            mmPrintPosition = 0
          end
        end
      end
      object ppLabel86: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'Customer PO#'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 105304
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'ETA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 126471
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'ETS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 122238
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Vessel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 109538
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 'Pick Up Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 118004
        mmWidth = 42863
        BandType = 0
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        DataField = 'calcRefCli'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 105304
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText71: TppDBText
        UserName = 'DBText71'
        DataField = 'PICKUP'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 118004
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
        DataField = 'NAVIO'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 109538
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText73: TppDBText
        UserName = 'DBText73'
        DataField = 'ETD'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 122238
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText74: TppDBText
        UserName = 'DBText74'
        DataField = 'ETA'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 126471
        mmWidth = 150813
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1323
        mmLeft = 529
        mmTop = 33867
        mmWidth = 195792
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Pen.Width = 2
        Position = lpRight
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 188648
        mmLeft = 194469
        mmTop = 33867
        mmWidth = 2381
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Pen.Width = 2
        Position = lpRight
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 189177
        mmLeft = 0
        mmTop = 33867
        mmWidth = 529
        BandType = 0
      end
      object ppDBText103: TppDBText
        UserName = 'DBText103'
        DataField = 'NM_CONTATO'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 4360
        mmLeft = 43656
        mmTop = 28575
        mmWidth = 150813
        BandType = 0
      end
      object ppImage3: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0954474946496D616765143B000047494638396101035200F70000FFFFFFFFFF
          F7F7FFFFFFFFEFF7FFF7F7FFEDEFFFFFEEFFF7FFF7FFE6FFFFFFF7F7DAFFFFF7
          F7F7F7F7EEF7F6FFF0F7FFFFF5EEEFF8F4E6F8FFDBF7FFDAF6F8E6F3F6EEEFFF
          EFEDF8DCF0F6CEF3F9E7E7E7E7E4F9C5EFF7DAE8F1E5E5EFCEE6F2DBE0E3C4E6
          F0B4E9F3D9DBF0DED8FAC6E0EFC8DBE6D6D7E0D6D6D8BFDCEAB3DFF0B1DEE8C9
          D9DEBBD5E0A5D9E8CFCBE2C4CFD7B2D4E3BFCFDFCCCCCC9DD7E3B5CED3BDCDD2
          A4CEE1C5C4D6C1C2DE97CEDFB5C5CF99CCCCACC5D38BCDDCBCBED59EC7DBBEBD
          CF91C8D4ACBECCB6B7CCA0BBD1A8B7BF90BAD481BFCFB1AFDE7CBEDC9AB5C4AE
          ADD7B0ABC97EBAC3ACA9BE72B8C6A5A7CDA9A8B07CB1CE61B6E064B5D172B1D0
          8FAAC05AB5D6A1A3BC50B9D15BB3DF9FA1B690A6B44FB5E06BAEC174AABE82A6
          B57FA6C066ABCF63ABC659ADD29E99B79999CC9D9AAF5BAAC4959AB750ABD16A
          A5BE99999963A6BB52ABB95AA8BC829DAD4FA8C69294AC4FA6B78D8CB67394B0
          6699998090A65A9AB88F89AD8D8A9F7B8E9E7091A75995AB84869D8584A48486
          938582AD6C87987585907C7FAA7D7D975587A562829A747A947A78866D7A9356
          7F95617C914D7C986F71A4756F9575718867758563709C2A7BAD6C6B8D626F78
          536F9064698F566E83546D796666664B6A8263637F476A925664764B63765C5B
          8540648560588B5A586E5857793B607657558454566D3B5B7A42586E4D527249
          545C2F56765349881D598434536A4F47784B48594B45674C4186344969474553
          2E4B5D44436B294A69464358483C88483F7645444A1A4A7B473D79194A722F45
          530F4B7C1B486C104A7231435A423A690F4A6942377B4336854137732042681A
          42743A3B5A1B427C10437211436A18426A0F437A1F3E590941693A316A3A2E7A
          3333661C38543033521C384B333333372B730E396417366434304B342D591036
          5B1D323F1131671033482C28632D286A07355A10335229295B2B28532A294800
          33662428580631502A28332A2543112A491A283D202252082A4C05295A202140
          21204A0D2840211F2A07223D1C1B3D191A2E081E300A1B2719182021F9040007
          0000002C00000000010352000008FF0001081C4850A08083020A1624C0906180
          870F154A9C48B1A2C58B18336ADCC8B1A34782ED428A1C49B2A4C9932853AA5C
          C9B2A5CB973063CA9C49B3A6CD9B313FEADCC9B3A7CF9F40830ADD08B12082A3
          43932A5DCAD423CEA750A34A9D4AB5AAD5AB369B6ADDCAB5ABD7A004108A1500
          F1A859B35FD3AA5D3B11ABDBB770E3CA9D4B3725DBBB78F3EACD083140D8B107
          158ADD4BB8F0CFBA88132B5ECC38B1E1C790230FEDDB9760DFB106322794CCB9
          F3C0C6A0438B1E4D1AA5E7D3A8530BA40CA1E840050A1AFE1DACBA76DED2B873
          EBDE6DD5B6EFDF791908670091B644D80A802BF7CABBB9F3E7D04F2E9F4E3D29
          03C006264CC810E283F6070F109AFF855DBDFCD0E8E8D3AB176DBEBD7B8D080F
          1C9C100208122850BE7C41C25F870B15194C900042EF15F8D17A0826A8A05B06
          36E820000264668009477C91471A69ACA1E1866FBC91C6174E08B102070B18F0
          E089142DA8E28A2CCE84E28BD50510E10A60B89106165AE48845193C8E31461A
          700409871B6428414308140C98505F0534E91A8CD3B528E594548E0465504F16
          94E5953B292040064EC05105166BE458061956F8A0C30D37B8408310FC81C146
          1E79B081040D240E38DC0003508650005A72E959958416AAA0A088A2C6500B79
          54B1C5A358A431850A134820610298629A410A401C61059D70408127A6080DC7
          000107A41AD16AABE6B5255394B5FFCAD7AB3D196AEBADCF25BA14ADBAC26700
          10706081851754489AC1660DF03900430619B0C002DC0101461E7EB821840825
          4A9819431114D067AC69C52A2E654A8DCB2BABE30285EBBAEC92D6EBBB8F0990
          8010197AE1451963A82000020A40E0AFBF322294C00209307440072614C1861F
          A1E24970660020471EBA807A65EEC5150BF5ADB8155DAC6EBB20878C186795B9
          CAEBB9F06624AF0E370A9B06121308801C9F3266B65D082288900105A91E9440
          062B20E1861F5FE8C04102E009971C000EA0CBC0570D44DDC075638527807028
          7FE48071C43590B14419533D9C404FF324F2D9683368B1AC14817B97DB5AB29D
          32473392212C166420B180CC5E5EFF1A820E534CA1DF175020E1030D3A138C29
          073A80D1471F4B7C1021810445BD74577C4208D8602507659C400D5144F55804
          99BA53DAA8A70E5557E45E047752ADC71DFB40B3CFBD51581958D1321C4E9428
          DC4199B9F0451A3CF258AF171A5621440C1D3CE0EC02311C6147267D5C714518
          D85FD185111130FB55711F74217E1757882186F82C0090F546171841BEF5F06F
          FF00715F2B540117E3E71F8811649BADFAFF008409EBD64731B96109659D939D
          ED7692001D90810A5420C317329099A31C04036C0896BD8855051EC9410E18A2
          13188E7003123DEB08F4A0873B56C8C27E80A20264A99F56C6D6057DA430852B
          C4473FA490141064431FE860A13BFFE2D18F4F584D8600281B1FF0C14474E883
          1CF8F04730827098005AF18AD299615FCA76018138C00302F180039A5636AC35
          4029C2C948D914B246859C11005E232097C402110384000C8FA2821B44600006
          C006010230011BD290232F6CE14C5010820E80D0A929B8E10D74A0C37EB03505
          742CE392CB18C630A2810E3E1CC4805A89501FE8118D5246E319CF08C7346090
          14194C6319D180862CA1B18C787892721281C1345EB90C680C231CF868C40792
          D8C60361F198C7EC0AFD4677823D9082082F7801114881861320C0015D2CA65A
          9AC6C6A73D8D9B4C23631A6B673BCA18200140488321D3208404780B02023101
          18AA60AF2D7C480449D28C00E8E3FF021F7C616870F08123A8814A6644831808
          0DC71588E9BDAD8CB169120045387CE10B8412031AE180450724B2B91826105D
          025842389EE10B6998541ACC40C74201309B81500D039C60874581110E72D821
          6681A91532771A40651264037BF8C63BE6108840ECC1107BE0872EF690CD3426
          F127DAB44CAC8A0911A78E200B667882569FB001B291736E1069000132130232
          94810A65982001A2769D0FB0A10CF6C2DB0AB2D5D008FD4C053A80821B5E6151
          4DA2F219D01003050C4000A74E049418010C5A30000B6F30E319C7882C30D091
          09037CB2209BA3DFAB8AD3877030E3B38F7DC639D021036216246A0789033922
          7B0C4E4EA30B12120CDF38C2D3DAFFAA2E2D63FCC12CF8A1872CC0E30F86B047
          130CC10F59BCA08B5B6963BA0612C7376EC00CA5B80738AA010E70DCA3142FE8
          9F1C05E5A708E9200F2ED341020E1080A82D0009EABCD71828A82D6661260340
          00C65F81018C6880966834A0C05164632AE1286B0012830D12D5873140B12018
          CBF82C318E418CC9DEB2C05B346C41F864004DE8231CE1408786D1818F608031
          6A10F92F006C200F7C90E3C4E428C610C8363683E494B6B68DF1D992FB90A759
          A0139560421D72B00A7E18E20FFB98450EEAF0834E44C2024D01A744401C8034
          76AD624F98853AD4518D6A20431958AE46287E6096ED72F73202A0C014EC8637
          110C68001148800BD2F0A82D8C41FF720891CD59901203584A03A19A6446373C
          A10227DC210C29B0D4B61AF25F9AD16EB902613243C642000018411B09563031
          BA118E2578545C0D251B1D8B43E003ECA008A01E82A845BD030640A0D0CA120E
          0C8C20EA1A0CC108231008722813BA8EC8F8D6204BCB1FD6710F5CE420075998
          03118800882C9080C7F6B0C71C9832460078E00539F8C10B36F050D34AC4037A
          90AE327E410B64208316B470C52FEE110B227013B1B6BB9C1DDFBA8535288182
          7C3A4006905086478D21069B6169ADF9459E2E60C3BECC982534A871084CC5A0
          463E60AF650F9DB107C010301F6D963E11C20772441AB4D1C046690140B32C19
          40022097C003C076E8CF31576A04FF5096C4B565228208B82FB58631AE676EAB
          A614F305CD983238A2B08A55E498099528C52A98A08E66644317B1F6C9160982
          834E80C318C600C72C2A9105310AE402CFCEC21EE6D0841754621ED5E83632AC
          016E7157231DE5B8C728BABA408D30C0003720C31AB620071A148C21065001BB
          D37084090C44368D16486B04C0077460BC94C4A08627022D010E54C10F763842
          0C52908212C0000463344009AE30884C80A21171A881A0AFD697311EC4044BE0
          432632D1083C0CE1E18D4087268761525F742317C304B3003A50832EF4A111AB
          0F3E1EE230041684A7BF0FA9800996BF7CCAA7A0051568C8A03F5E822584A10F
          9CE0C425B2DF073B5CA10582EE23FFD6FC127899D3FCFC54EA4AA3F7708F74A4
          031367980738F6518842EC63CA5108C594D5B1EC24A29B234D8303B3700FE680
          0CDC708053A60B4FE0014D270BA4D00910D809B1D00ED6600DC9900CBB800CAE
          F0088F700DD78065CA100B1B80146D7711C9210147C0665B40062A60000F854E
          64E606FAD26580D710099009E7005A06E50BD1100E8C803D22C0019E400DDDD0
          0D9AB40CD3A00D8320001FD007D3400F1B860EF4E083262000151031B0617A26
          B008B9008551880EA0D00309200AE1604A26954AA92001EAF34612D00276000B
          D880432B9461F15087D8300DA0300496751069D405DAA00DD3100CC1900BB9B0
          4BFCC31082F60171C009D3100E42FFB442E71089E7100EA96007C77210B01173
          1B817E9C38251F11711331000DF000A5900ED7300F825008EDE07EA9A80ED625
          0882205DEAD0094DA3721BA14D65E3001B100AFBC00DBB708117880CBC000EDF
          600BF0200B5D874D0EF003AE600E18E86DAE100B90400275500ED69081B15009
          1680644F558215F17619300569502C53C00162410150308E7400331D25000DC1
          58DDA083A5E40DB9D0033C70076E3005CC300E01374BE1400F621002A9E00E65
          180DF4455FDD700EA66002061001C521003DD00AF4D00DD1E00C16E90CD1E00D
          F4900B53E00B02070D28850E8D80895E520178B00CEE700EB3445FA5347BD150
          84F4A00D7CA086497410833091DDFF800DE1204BE8A00D32E08E1190194B3090
          EED00DD04091A6140D158550D0700EEEB0907C088A17D18954B9229F088A0FC1
          4DC9120023D00CF3F0956A8009F7D00EF40708FB700FF78009738096F7D00C49
          97390C376051F554179008E0600ECE980CB46081BBA00CC6200B96F00F917016
          1E5009CA7081D6208CD2A80739100BE57081BF600C75E08D6A04001120002190
          8E559007EC28000D20002A400672400570000409A0190A111626900BD170529F
          D583A9800109B0024E700815A9839F050D87D00A2AE90B24E59BF3850F4B1801
          C40491D3E00EF4250D14557BD1300CDE804ABEC05AC7200D93150704D101A030
          9124F50CC07094E7E00D18265FDBFF3959F1B0524F23019CD00DC2200C07595F
          1A251B5D2085ED090CDDE0853B695117050DF4000A181095FFD7165519A008D2
          1303E6553536028060080A2A035990088560084D40040E6A086A900389600880
          0008D4A61373D904EB700DDFC60BB130A2BC1075EB200B68900F8A30100E0008
          567681B4700DA7F00490A0077AA00ECAB00BD6C00BBCC06547F19F0B642A0920
          026655057C370107D0240BE0026560A46CB002A4321143F06F277590DD700948
          031E71C00E27459D7FF50CD4700CB2249ED0C99DD3000BFDF93B32700BE8000C
          08B59EEB490D92F80C17B96091250DC3800E3D30100F2009FA70719FD50D9558
          0476D00AD400A7C2F00C799A0A57FFF8341F900B878AA8A25559101104E23051
          A1F50CDD300D88B0044B7009E1300CB3A449D3400E2B463108607E02BAAAB9D2
          11D5E63A4561017BA00719CAA0F55708394004B71A053280077390A05DA56495
          E952633302A8A00EBF600DAE700675500995600CDF000FFFB00D96B00D3CF434
          4D0075BF980CD5500A39E0002F0009B3000EBF7081A7A0A1C24A9913A1590910
          9AF59607A6992A07A0667940066FF00521B02F08D024CCF23471E059AEF959E1
          D00757E3AFE7F057F89978D410A60455A6A0050DB70002701401E8297BC3F0A6
          EC190EB730085D8008059994B9B90C2630103D004418360E284B0FA650029B51
          04DE60907D150E225B932D300D0FFF3B4BE760079E19001AC00AFD80B2E3C00E
          DDE00EE8606907D101A9100EDD294B09D507FE57A053C9AA52EB1C1E91AE1321
          1B4CD39568D90E67100A5F390FF5370FED700FA150086C890B233016AF433186
          551444000E5876653E3A07DFC00FFFF00ED31A08C4090023500AD550AE19580D
          4D30103F600C55860CD998749AA5AE87051169460363F0286E205EF23A2F4202
          06212010FC2A168DD00D012BB057E08E61D108F5C00C7E059DB2E408D572087F
          859BB424B19F5904E760849A7452E1900B7A0800123008E8207091D60DAD8001
          EA13529C80088D8008C88B088C5003FA0600AB19AA17CB94DE505A61B10486F7
          59B3D79496C627202009C79BBC88FF90095DC0874FD307EE100DACB59EE78008
          A4F7102FA611531BBFBBE111C8C54D5BF3BE2C3A1016500AEA708AB0780FD7D0
          0EB0380F015C7F22D109DCD811B9B81A6F940386BB0BBB600EDA4802CDC00FF9
          70C1FFB0091A404C7AD00CB400C1BB500D75C04D276008A5800BB8F00BA78006
          71791138300789100A321C0A73B08012F1C273100438B0C33CDCC33BCC057330
          07380000415CC4417C02177101465CC45C511C03C332C24207F9555E0E40013E
          400664102AE6F82F101351CFD9BA9FB50C7B8A77A6700EC0894AF4E50E623001
          37801FBE400DB81970B920B132D208C8399F9345B002307243D0A6C0809BE370
          094D03010450012CC77208D10397FF44A69BB40CA5751085075AD91B0EF8962C
          000031988510D97109E7000CAC8550E7100724A913F25BCAA5D11138705419BA
          CA7FD0CAADBCCAB06C0663B407F6000EE5700A51B00EEBB00F809008FBB00EE9
          907FEEB70E7F70106800CBB00C8BCA0CCB45A55C0F810016E098B4900CD6600C
          660009168CC19B2005691404B3A00CD30CC1A34002021104BD000FF0A00E225A
          09483C7E88A5C401DC0ED720C3AB3012EC5C105C10134F0000A1800B24510917
          310724810BA130400190190B700337A20574C00309401E0B4003E0F506509001
          B00101A9020020500BCBF0A50609BC25C05200D001B9D00D644A5FE7900B29E0
          2C2B3005AD00703A080DC10B288FFF6AD2F4050D9F458F231B35005003D3A094
          BEA083E350088207015623001A60034B70057630088BF0D48B200A2F6B902C19
          0EA220BC119209E8909406190EC15BB0A3B37B3B703D7C00D5C84B51A82459D0
          50B482773AA6FCD6A0D11116400AFC600F6C79D7788D96E9300FC6106B28A00B
          FD7B0D5CC00AAB80094DD0049DB00AB8C004B8908048EC01DFA0CB79FDB55F89
          96C9C60F9BC0465E0409200AC1D4956C78FB0E6DA00111E10095F0B7206C0C4F
          804D52B00DBD400AEB000FA8B0652E259527E0CFEDB00A54341017F004F1DC0E
          5CC074B90D08459C082341DC419C08FE3CC40261DC2301461581DB219108E1F2
          10E0A16684A4056F0004FA4AB140FF1049EB384C96499C3BB04B3AA849E1C009
          1280103BF06F30DD8FA2E0042AB03729B00CDEA04991B59EDDC009F303007D3C
          A6DDF9599465227C22002D800DCC7091CEF0589586855E82014B6009AA700B18
          560F16EE0DDE80B2802AE097801012000B9EF59A4AE90EEA7D35C4F900351007
          A0000BCB2089923885DD405176BA49D3C0BCEAE3D632110A4F000330F00489F0
          DB38B10A80F01642FE0441E0128960C4A19018426E13345CDCCD710D7300E44F
          51E4479E151DE10181300BA5100A5D2EC3A5700A621E0AA7E0E567070E4D7010
          7A300FE5500E393002677006B99A055DF703D9906C7AC0344D600FEA600CA5F0
          E77F2EE6821E0AABD009A4C00A81FF700173E9004FF0A2C9800CC6B00E76DB0B
          6D4060804204C6F00B20CC0BB8B0078A30038AF00E8AD00B17AC0B4DD0345229
          102710CFAB805C057101D2DD7F008003EDC0DC0241EB2281CFED80C40221D023
          41DD14F1042421EB063D1070070739220740F0006BD50006C0036F9023561002
          84D568FE564A92FC4B88B087007005BD8BD30F4B0D79F04FE29502538D78A0AC
          B309D105EE70C6CF20E078C052FE0200D6CB0C26B5E001170E351043100987D8
          800EF1A8E0CE300EA8044B5F9AA7047B992660DFC3F0A5C0400F8B70100A9F09
          D880B224A59C25250D9108D415254BCE090BE2ED3FFA7C02F5DC0EEC3CE450C1
          4A4B8E15ABB06CC2EE12D7000027FF20158970012A21DDEDA0F2370146548E12
          1EA818CBE6EB51D1F200F0F235D111E5E56C4410054CD0F44EDFF44910F54970
          0AE5300FA5D0451B8009A390046AF003B8C0CB86106439A006D36409DB18CDFD
          7B0A4FBFF649C0F44CF00448266105E101AB500DCF180B9DF00DDF6004A99AF4
          1600099A0EC1B4800B66400A8AA00152A00896F00EF970B7FB6CE9050AEB2171
          0DAEAE10B81E12CC4DEB0571F9EDB0F99D3F1002FDDB944F11AB00E4C4DEC4B1
          22002B90216E760414D0240570002B3006F652052E801037D9F01E1D0EB01578
          BCBBB40F0B0C39E306792004606094A6045A0D2E108360C667085AD8B004C4F4
          348597F128C50CD4700B232B1057FF100EDDF0EE144551E3A04A84D80AB3079D
          CCB00CD16F9902E0B249299EE8D005065102AAF0A7025F84A19A0BE6EFEECD19
          0EA0409300A100C04082050D1E04D04EE142860D1926BA708D61A8500E2D5EB4
          B80A10468E1D2F860230C763430030469E6C97C843458C41122ED48892238C97
          1EE75C60295367C76B7324EEF40852245086088D126C108081854EFB9AA54B77
          0DEA35AAD7CA95339735DD9E81167ECCE21728CB3E4080D44579646F168E0B0E
          1CD4990755EEDCAA50C1EDEBB4C1C1518268D42143564D900545AC50EC4D0AE0
          452C64BB1C57AB74A28D1445BD36BDFBF7EFDD3B457B037CE6BB512120BE0072
          E21AE8618E411C450BAA2E2872A8FFC2D5085BCF6E57BBF46EDE063FFF8610C0
          80882A72AAE47192E140010206545459B3C64D8C04092E79EBF64CFB3360D1C2
          F5104000C0034EE1801D63969E59B4561C168880024714356AD0862DC3BF0C5B
          8B81023475F325C000D3F3660901046000800A5409C71769D463861D53283890
          855CD879451A0DA501E69C56BA18A285108098269A68B4F3859965A691010002
          0408231C134D540F1B220692E0127D7261C6191FF1C3669121762881034F00DC
          4EBB70063910B4DE10022A089318C20517A2AEC4B221A1742A294B862AC1ED22
          004EF0D2229A4EA2E9A732D76473CB2C9F44AA81814EE8241B3BABC2F31A65B8
          C9AA9D669E38F08240BE81878B44FF0CF9031233D669668F071E10200BABCCA9
          A69A3CAB02C79866B2E96484DD186060834AAA516614122C18010D45A4706B2F
          3DAAA12519C794C902802036C9271FCD7A7927D74D34E02DA2854E28ED098688
          B5CDB5A344C2619585AEB900A150A065483738AF1DE8B7000AFA8D80174370E2
          8D2AE0988203030C4890032BE420830C21566805C00D39EC661913C203608354
          BA39E6180D5544871309CE0D418857A8D98EC66872E9A03F50C241713B66BCB9
          E25C030058029D6888E19846761039178044E871501814CF112585030FCC7846
          ED8699E6960F5C340091739EE198635FBC2906D921E831513B6060D6C6400106
          C2009665D283A66968BAE9A2C96DFFB1250828183CE0081740E6C8A91D5C2A49
          29118A28B272158A9C6DE79A4AAC5C28913900613B6DB7E166E81AB7B9C66895
          B7130989CAADBB2669CA8BC09C03ED2FDF5653218A1622BC929FBA7C76ED87DE
          8E5B6FBA2F3A13A669DDEE3A7398E698236EAFC14E241185CCB61B6F862C175D
          A1B9E35E9C71D00D97BB1DCB134F1DEC85DCC412DB019202F582209EC8220A26
          8E3F3E0AE59938C31875D4C9E689BD00182110528C7821082248D9038495D1C8
          E61A4ACF50BE7CF3A3C8E28920F602D5496E3F630081C58C3943FE447098837B
          0FF23D45195A1C4386A9A4B00D56F0EA1FB6A8CC3FF2C18A04ED2608CA3ACA05
          AA6594D62CA434CC32D642AC35A7FF94D4243754A39AB644281C747D86024EA0
          031554A8020304000204C8800FD290863180A115379B9734BA910A0C10404E32
          584634FA250C61A8281E7F004003925282548CC347FDEA17354421018268A241
          2982503810318173C90016E60106319CC68C7A5C2135CDF0063034040CED7403
          08028840823A500B740C6318DB19063640510100044002A2E8063004C9465F9C
          4315FB03C020CEC1C69C1D2360161B081EB4811F68E48C18DD18C24014201010
          7A1025AB8181E41A328713840222C60A854B60B01A2E54225A8928DB134EB00A
          5C3C612068AB44102A91CA0CAA446C41B880E96C273C537A4034540A02204251
          9BD990D29417C8A04320E79055A8FF669900E0024C3C9008575E000630580517
          A2B5916B9CE00495A8040C82104E00783394B604002E75C9CBB405819B27B800
          ED1892B944108B0B5C2065DF7A12AD6F26E21AC3BBA6E952591256F6139B0025
          D6500E7ACF7C326E9EC36B873801209A6A728D955EE3C2402AF1CF76FE24114F
          B866347977256CFD464E0351842C6441CB2AD5B4A6E000C7F3D6F187FDB54A03
          07D200B006320243D84921E558054D71B18A59307516B3B04520DC1280A44CED
          7DBF410002CCD00C229020074C00442974D109E9458117B44046AC7E51070BB4
          41112890022B58A108526CC3571A709F5166B30ADEA8A91214842042980580B8
          A1C620A6DBDF043BB9D8829C8B00FF9F1100058400873294610C2E6861000430
          011D7C210D5B280325A8C10E68F8423BE77044029408802284C38EC3D050D3C8
          B1843E0E600026A8457602E4B47330490059E5431DB7C3C6363A420C7DF86234
          06090CFB0C231C9904400FA6A15B6AE8AC1B62589909AE138DF4E42C1AE820C4
          720A80815C549218C700868FEA9109066CAB11EEC8D07A4C140E5170F15C5D98
          4689A261DA670CA31BB9A009A81A0842A05C832604119EB3F8F613D2A0AD9DA1
          5885E9422ACC76A0742199FBAB9A44821A0A7B40582ED91DE070718163926628
          0B1E4D3C2D32CD8678209AB664898B537CCCD554843439190A8B310C000DB723
          14A2414D341BE239904C095A1254FF88E764B910605A102711F631E48EAC3820
          03208319D6206D4CA310192B04C649DEF20745F3402F1356717D7B13D5061C01
          18B0621DF780739CEDA18E79D4B91DE5A0CA3C56F104BD00A0814911C006CE10
          8BB8444521FDD8479C156D0F7B74E20416C8565EFBA82D04EF8114B838051346
          718D3390A0128F78042FFC87D65F302111DF78072B6670022904A10DB2C81529
          A6579A9C806437B506AC05F9325821C333351DF4E006190BC2956D52019B9D6C
          1ACAE0062048400007384002560085CA52210F07A34677DCD10701D816007670
          4777A2115B68A0A3064D02C010B0316E0DCD081D71180802D24D8E8D593267E7
          E8063AD011484BDAC71BCB60C140FF8620DC003D2340DD680522E2D08756004D
          3D392B771700C09C16784343E7550F3BF0D0470164E21C0392AF891C61073B64
          021BE1488F83A4D1DF7080225A7E66EC9570F1E339D0046B27109C9BC6442529
          0BAE1D99C3B943423A41D3D1041089634848D5E4A6A09F394C0A6131E3C21C65
          63F17528BCABF1079FD03A1DBFA4E919E19BCFF75913DE792E73D740F30759B2
          F3DDA5DD73A70BBB42BE3EC18AFC15D7192472DAD3160A9AB064A544592CA806
          024D3DD4C1F08747FC24AC421575AC8314882C880648718F3B5F251D98A8831A
          10BFF9266C60205395F467AA0A80E939C010E0A8C62FAA318A0D2C061CCA80FD
          2F643F8A52D82333F9E8852214B1FF8D77F0FE1B9D80F4ADDB2EFC33274BD7CB
          6A070E0652D8822076208A1D76F48DED0003489B0CC671831338509D041840B2
          6E480315B6400961506319E830E3670C70898F639169B9F8C0B912D485780043
          40BEE8C6C48C40FA0B08000397083741DA0E0171AE65480568102462F005FB60
          0F0C00000130815C702D3B6286EDE8867008077A4087FCE8AE8EC18621589925
          A80707C9191FE906DADA16442099FBCB1977380774888778488556582E410A87
          4620880123B03281B176FA26182016618A3A5B52300AFBB99788BA239C88BE09
          85973B012E40BAB7D339770242915931B1D3B2AEE91290B83215CBC2B4412417
          73309FCB9C24BC8627109EB83313FFB273BB9AC81C90F0801FF4B0315CC2D938
          3B34B427C84942B5E3430B9A92BC1B8AC8F0002EF8B2287BBA9D602C011B8827
          C004412884428084425884472C8453880AC65B074578B98270804898B3C5BB86
          5178044A244548348383F88D8368AF11B29566C8146348020B800470E0054848
          0241700563D0C57DC8955CC98C5FCC876FF88639C081209037BEC035E28B32E3
          83BA5D4BBE45640878C21ABE793E0D8ABE6B34363F6380E1A8023A1817377081
          0540170690B62F900315A2835778C116692FF272876EE8066FC0C070D0075898
          80EE3B1049D0877038877E94917A88867B41906D0C014EA08770302F62602E68
          70876958023BD8C779C4407AB884FF8B399738D8C7D71A060464AE7E443F3B38
          C879EC067770071B589945D0877118877E3C8771A8077468916D49815C0048EE
          121085F40E7AE0841BC885909C477DC0C16B5C1390283231113B2E6C0732BB30
          24249321E3B1B6130DB5E182FD1132256CBB1CC3C22B6C08AA580DDD813A329B
          C37212B2AC539C80C29A76E83AA86BCA68F4C23DB44A435CCAB8844BADBC4AB9
          2442A89B12B61BA52DEBCAA2203340F41A5BF9C2B9EC9DC5FA8D04C101B0D807
          75B807466334CA5B08385384FD69A001DBA66FB88774A8B33A4BB4384BB47DD0
          85174045AB3208E1398C8148900D58057858875960822430065CD08311389542
          88054840856FE0077EE8455DE9C5FFDF03846630064868821F6882404003C813
          A985302C5AB34666444B6754BE9262CE81D888E90CB66BBCC6C34C1003C80024
          80832A480338D08109184803E0002450362518835710050C308008000010D084
          54B0CFFB04855BE083EA38900A9004553085FBCC855610054770B604210068FB
          8041280674204992448769E0841610003EA8050035850C35055880375031000C
          E8836988C11125C973880651280201E8820BC5D00C0585806B8007580455B04F
          0DDD504D008124620001A88154D0B707855074E05009F80055685153000558A8
          15A1DC89A75389762016A4C34B87F03030714AB93333A26B1B33CB09B413BB90
          F24A13C352299526B15326A45408FF0E4BD320884323E4C3AE219629954B62E1
          3AC1714BC00433B944BBB50C9C3A94CB69821C3A7588AC43D3C01426C0244BB2
          FC3BA0602C6D019513F80352400552E8844F20055228854C2D05525004228896
          047100AAA2AA04F18026E8844ED0D44D3D55543D55434016F1E08D1378AA2778
          811770000BD80040200578E0075D980552780104C8815020013328851C380122
          980348D8147870567B58877550075E7085AB781E70C80678E80C83C08DBE5A08
          5F638DC03A88C11A08DC00A66BB0B56AD432ED1C366F792C6D49001D70832AA8
          0237400273C9AAC8BA0130C80315A2021110C7E0B9800BA8808235D84779D700
          A8000A6058866D813000D873A12AFF25120F0778812EE8838C1D843890818B69
          A78135D89075D703310019B8023E40593E18843E088318304F016800820DD982
          EDB6A4F08082C5000C985902180008808003C1802540D94148D93818820E3890
          4799599AD54EA0281C2A598976F8AB6C5208AA905386200D0F681D7E12CC34F5
          9A0B584B18A05AAAB51D2B5CC21390888342B3A97D1629F5D286080289C027B6
          21A5B6119641E5CB9FB8862E0300ACF909AE554A2BE95B2DCBCAB72C3B3734B3
          6B0053E6F4433FCD53B43C4B50729DAEF59AC19C5BDA085B36940D2B5C0562F1
          3BBD033CC6B2ADAAD22C01B0805B3DDD56495DF669AFACA2B401B38047791406
          2858B7B080E013301DBCAAA1FA86FF7DC0296308854A28855800842C90057EF8
          0654088439C881117000266886B5508C1CA80470A80433F883A7E2055EE0066E
          000CC0C0055440034F3108A54CCAD2384B85D8C4703D3EBD7AC6C15B3A7255D7
          0F62D7C572D784752100903628488371210315809407008003289834588332F8
          02210881A32108582D080510A19521591E70031AC8807351A2D1E50BC1E30BC8
          92E09519088B31806E1B80A350A2976A606E6980DF4161A3B85F07AEDFAAD909
          9558A539501FC3B9895522441F73890B089DBAA15C908A9620A88890D261616A
          C213A839B2F500D598CA4384086F52A6BE1D8A1C9E831D76089AA04218889634
          C5271B86010DB332D0011D2BB989FF3139A90B002817FB095B3A8175D22822CE
          288632943966E3760A935008295B291D97506230E3022BE19B385C85331C6380
          E2613C16643F1E0A9A08E490BA631F560823BE62D39983FD3901D3C1852F7E82
          30F69A33E6828A00894C1E313E5E0D224E0497508D34334CDBFA9DD21500013E
          88D29BB401D341D9253DD4EC0F095E61DB92B4489B9A17C085ABB88A76A886AB
          C0040B780158CB075D4005545003122001638885117881503805EB7D8111D800
          48A89464006770460657D0E3A3881B6A3C8A6842E783A8A066443EECD4BB6BE0
          AB8280BE18869395796102F0D917F24E24708376210320C88004F01601480015
          B082197203308801F80C0F771D21FF6DB9DF0688000A08833C808215480001D8
          A4541C4D11BA2AF7F96001F88D95090057B62D02008140A08987CEE7FB958240
          C85198CBE5CF73801990696D498A0680617695398A705BA066939E7802A4136A
          2A899D8B40D7D67996A3060AB3111DBB8181B1218DAC44D7696908B3C188AB5E
          1DC0F19299539399F36A99D06A8BE06A8E806A94586A3691A661A3AA01288008
          88E93FF883F5F10CD2438340D0EB20582D2BD33D4338144340943FD03DBC9293
          41A4EB3FB81190FEE88198E67BC00A6EB0066B40AB6A50030408825C4185D313
          0C26E00541D02AD48304AF32040B4802D8DB8570FE0557188526A8E98320DB76
          50CE83409BBD3D8A768ECE777E8DFF8600D7ECB4E76B3C90088800A590801B60
          036593832FA001F3B4980C30EE3C184F28B0E0119660DF10A1949636F04B0321
          70C08170576056C42789E8F176A974F387A8F9E00318E90AB00442809458CEE5
          1D20840A381023D806930CEE03118F0F6E5AB6F6EF86C8A5AAFCEF01B7C6C479
          3B0247F00457F005D74E7745057B803334400A0068827570D67DF8AB02489048
          E08768D5CC79781E469385E0738026483475D807450080E1666C82F0E8170007
          C82E07C94E066B480665888526E8C47F988551803D65F80565288424A85E48D8
          E6200882479B046E086757C004239F35A348468420DBDE360821BBA0F725080A
          6B4E195ED7DF662C83EE3E170A8EFFE1500239D0022D800321D8BE9079801090
          213AA0833780821B80CF7301E190F6D96D9C0032D0022CC8832B1060B790D8CF
          1859FEDE8D0CF6E511FA60E1B60171E8820458024B00854530491620844FE083
          2EA80116C8841E90F44CF8044580810A00857E588438F8001320849C8D034DD0
          8436E8800718024BB0F51D60E0E85B7036F91AF3DD75B63E700FE0D35F27F662
          37768FB8C6060201578C0AE56300DB62804E50079C2A8752B800AAD20059D887
          79B833AA808A75B08748700B00B08052500789508752906560E60B0B081DA830
          07D9FB055A50865940852CC0015D680657400670B6065728844AB08766E80443
          40055B40854A680248F01F578885FF52909EE9F1E8D2341C8880ED6FCDF28558
          DF83D80897D8ED492ECD7A06F3C5921AA538170AD8D779350E1DC8008E3EB609
          70012598A134608329008210A80EEA060057969A3D1F181D880E6BBB013C3F90
          4DFAEE5D3E1084E869EBF660934E451B90872568017CD0865BC0875B300049F0
          875BB8857E188416E8873888017A48854B888741F8806050FB60680123C00713
          88837ED08660F0873898005508864C100750A022263DF69D38C375FAFB35E19B
          D940437D1AFCC457FC04675707F80170800A5CF00001230023B08AABA01410F8
          0C1050844EA88453C033AAA88444B0045F7B8273276663205F38718011E00248
          E8048A1805DA438548D803559905FF5EF07764D85E78D88CDD84D66640275D8C
          854840031498B4162FCD63BA064008021CC0012E401B5C8067767E02DA392964
          29081CD83ADB91A582A8086821080FC08163F2FEEA1FF9C00395039180127002
          37A8AC32B0029559FFCD72812900683860032110012E2AF992078800110418B8
          B166CB9631603E0810C080810200062602A848E022818A1A015CDCE87163C390
          02020468C000000C7143C2E8BB2161D0340CC1384D58816E500B7C7162A01325
          6A991D0171B0A5A060E08AB8108DA685A0D067C9844BB732DD9AD6E123D6AC1F
          DB71EDEAF52BD8B062C7922D6BF62CDAB46A139DF000E304175C6AE7D2AD6BF7
          2EDEBC75B5F2CD7A52CDBC6BED42FF3900F09041A7C0CAAA996B478423010792
          CFA4E38A493266001648DDBB86AC5ABA6C3FFAF275B061448E1C2F82B4BD8002
          4D2763C892D136668F1FBF7FF6667D6B562A87A0557F826C40008024F200A43D
          005A05F65AA520A4C786DAFAB5BA461CED006D9C339634F8F0E2B38AAC608002
          902F70AAA471E32343C3870626D02023470B1C385F90B8082141A400171550C0
          01092470441954209407100918C60002084C6440450A288011561D8DA7514832
          6853C415F80041012231C1024B0C40D0D3470CF1C41195288EE4020B06616013
          C3203D14A1CD0799E4F2C10783145183368DC471CB2D1F6CC8975E4D3AF92494
          514A3925955556B9A4560D001049FF60F324E200012705B14E3BD7D411CB35F7
          EC61D84680DCA38E3A866C741211EBACD38C20BCA4B30E174B0EF0675F0E6451
          0D37B429734A259D34338B1E829C524D281B58600196599D8003A61E54BA6945
          385CC029A8A162255204114C14021279A451851C55C430C1010D0C4040021CE8
          C05E1A64C0E1061847DC10C204124C38D1020BB800C518086D51051B4A0260A1
          64143DABC000CA7D841C9622EDE04F1729E0A3CD34F8A862001EE8D0330C3A76
          D4E04F1C296893CB25E88C7B853EDAF8B3C410FEB0D0453FD804C36D0DE236A2
          0D8FA2566425C2092BBC30C30D3B4C97C10504F04029E9EC890647003850C93D
          E0C442825CF7445298460F7462E7FF3A7354D480720EA0626728249C02A72199
          8157C09F39577492465A02C0853AC8EC920C37A330D144259008A20C2FC6C4BC
          33CF064B3D35D55593476A041719B0C00D5FA4A185166F40B14202184D94C1B1
          5FB84106DB6458A1841034AC30B7082EF8A07615CA6E91470C068479D2031818
          101F03D5568D110884D42041179948B2080C0F2C91C915574CD3480573C02041
          1C8B780E83001EF061C91F15C060890718E02189247B6080C11F961082071F57
          19FC30EEB9EBBE3BEFBD77252A72231863713636B0490438F3CCA3860098BC89
          CA062B6B360B9CEAFC403800446493CD3ACC8772CF3D9F58D090B57C2587ED47
          3CBF20DB6CBBFC12CB19A398A38CFF32EF77123DFA56EBBF3FFF9C867418030C
          C0011FA4E13E69488310389080F84864022938827AD2A0A0355030576D234319
          CA50052C78A18369B841020EA3B11DD84058062815691E8295F3B130000F0190
          482C218F4670021F5DD0C84904804300E8F038C8891A0F070220A9F9AE88463C
          221293F89D509144003FB84639CAD10C1084A412F348072E46F00040A8031CCD
          18C14646D00C755C431D26D888053AC1955590E00195B0D817C9079E16B2AC7C
          1AD9402C0A65286530417EB4F9CC9A18401220F6AF90863CA447426221053464
          012B70C201C720491D70C06F04B090001210021D40410E725803D8B020CA0C96
          41591CF40216E000C2031CC03002FF18411CAEA0C009F90505548461480850AA
          0060E4222C14C9614E40084D68620E15D0C8451C700210F8902439CB19005FD8
          100DA0200244542236B3A9CD6D5289894D544339B8618E52500A003F00473BB0
          28084184229DD6AB90027030462C92A08700084236A2680C3DE8211616B39E1C
          39153592000010E548C62E90810C5E3C4219D64886355C118B26B0694E1A391F
          2233AA51AB31A02113B88118D890AC347C81061970100F09B2000ED80D57075C
          551514B4AC0D8AD20D2B9808461AD2833E38E106277D404376080010D862130F
          00C05179383E165C4500420C4952FDA2C2860C2EA81AA9802C5091B58DD4B17C
          2ADC481BDE31836B72B3AC663D2BFF5AC132B547CC831BED30444812B18F6AA4
          097C9D4913C634F28475240F13D1AB88033AD19976A8631FD54B9319EC2935E5
          BC8017D5D8454291C10D3D26E31795F86B453D82D18D72B6B3A21240068EC0B6
          0CA6010A2635D0094B65800464600542000318DCE086036670B4ED1102051CC2
          8001F19003B1750312545055187AA0750FE8C0036060830A080006C1A85D0704
          2001180C4106181040073A00031854200220B080729D8ADD1EF4E00313A9800C
          76C0020948800F7C606F7A97FB800A64D7062C98100876B083E8F2C11F3B206B
          5A032CE001FB4E6A16280538C0A18E2C34447B09F66233229CE07B54A2302799
          43C728BC11227C034EE0D04584B7FF07A791E9CF015CB8863268411B6E3C3419
          AEE04513228400827AB6C636DED0220900200530A0400B108112D84685329496
          069504202FA58B8112DC40085070031CC8A036374CC105B98508B50610C00920
          61557000430B7089DD4FE0E1039F504536E451BB4FE8A318C590440524218E62
          6863102F518536E4910513A80214E29007211EB003374FE3163DA88026F0810F
          71F061028D68C404F8200E4567A2034308862AE2118F2508A00BC10886364031
          8138E0C378B72330AA53AD6A846D2A391519C137F6010F788C26029BB007F8F4
          F0825D07618CF740C50358C68048EC037C8104C0053A31EB7DCC61042F18C10F
          74B10F7BC8C202249BDA491C0089FF74CC06A2E640062D626188E24488C6373E
          37BA37F410AD39D2096BAB02ABD2E003112CA021167A0050A93A810C70A0DF1C
          C8C0041608208C24C005182C0319C09081130EB22120D046263E408E6274C1CF
          325882363811871AA4801C9C008228BC518244E3E116AA68813860D1854FC8E3
          0345C88523EC800E3CE484134B50852A3E60F20C04E3165740443F8A50847E80
          A20BC5A84502E2300D3B5C821E40E8023EFE7BEA5553BDEA568758A5F2778248
          70DD1060D48022B81E093002760F895284064812813954A2ED38700049401089
          4E4462DC1AB1C01FDAAE880B10D2C0419885328426D96AC4223A173577BA13AF
          F8AC20476B689B021C34E8C92A20FF6105131033E671D98006244005921CB21B
          1A74494C62F7169708419D01B00471C8C000C50883015250037298E2129E4845
          092C31AE16F400E57850BD365AB0845CF8C4454588470C00F001A8C002141FC0
          C60D63808F2BF4401B3200C0208A818141D44214AD40C70D58626A515DBDFCE6
          3FBF5738E56ACCB07FF316E5196630A4B1F97FA430ECBFBF64A6F6C38AE40013
          4C8BC529948221E0C0CEB8DAE21D20027E4443B0960B58C1BBE90A1C40810B9C
          9481100E211D462F5D4403108001A80019500115608142C0870A15C609405C09
          884326188011C8030C608036680228C0420DA8E0155C422A60C027B082B00080
          0CF40321088538B4002790C315F4FF013EE0410DF44326C401CE7D4031A84207
          64432D84C120F403BEF403E8484230C0A02A14C125E8430F909AD4911FFA9D21
          1AA69AFAED1F603980530D52B625C7B595840BD15F459484CF54C4A7D45FD5FC
          10CF900020004213BC80A414A001262022226048CCC70D4C011BC0541AD00119
          1CC10A50A0052E9202341E464000046492C161014250811BF48D480C55304842
          07888324088014BC03E8C89038C4410510823604833834820058022B309700D8
          8038040200A0C1379800C669039EE1C1035882382C231E4CC02AE08204E0813C
          4CA3141A8138C0000028822DCCA238609A4A74013F8C5FA8A4213996E359AD61
          F95CDB71B89F21E68F61B4507200FF1000745500A8A3FE25471E32DE2126223F
          A25B72E8DBB1E48728ADC10141810E3485C0D91B265E48060A0097A581287941
          42204142C6070CB0407251915B0C4407A8574354800D8424739DC0098484E978
          800080800D980A0B0C010BC00015998E7D4DC44B0AC003B040484697761D1308
          A040E884A409B00006E497354D9D391E25521A91FEB08C5091063C3EA5B5F08C
          3B820A72D4D1059EC466F5A356DED8F9680D6BA94097A501291119194C810EA8
          C0490D0BE64D80C1918116E80D18E4D692840448908662F15078DCE52125255F
          F6A5EEA41BDC05C09F98DB53165256DEE1616EA562669448B0D0801048816480
          0A00811594C11A88121690A51520FF810EAC00072C808184A6814C40081C811B
          C0DB5B2A0B1B848055D965298A0A46B01078881980F9A56DDE663725DE54D6D8
          6E2EA66FD6D86B5ED4631680D6AC96AD58417E48D258EAC7174C0112080110DC
          80740A011248922885120761811BA44063229E02B6A637C1A38DE1267996E793
          285E6FFEA67AAEA7219DCF22260005C400127C01DB60A62845D24BE527087A01
          D868011680601980016B86846CB227A89827822628D6A55B7A1AA8833EE81C79
          270EFD52046CDE014C004B2167E4250808DAA78776107FFA2708A6415C76E73E
          42E87828A88AAEE812A1A88BBE288C7AC49F14A703F180135841DB6490DE280B
          88A2121548D2280E4E83C6E874B0F1A8911A299126A992B267CE5CC4224A0007
          DC0012400119BC94248D81878AA024B1C10D2C80016059442C698A1E29992AA8
          989E299A22E23F2EE284ACD40AE800124C8123B2019DE6C7AEB0C11450226AA5
          E98694A99F9A279F06AAA0262055AD167C7E400AC4C00D0001A346A7674EC084
          8C84840EEA46FCA9A5DE26A566AAA6765672E8D2701184685620800CE9A05EAA
          A9F2E5A6A6AAAAF64F26624BE6816733AD6AA59E2AAD96A3ACDE2AAEE6EAB9D5
          2AAFA2A1AEFE2AB006EBFEF42AB19A9FB01E2BB2266B9F162BB3529DB23E2BB4
          462B00342BB5AAA1B45E2BB6E66AB56EAB80656BB6722BB886ABB88E2BB50604
          003B}
        mmHeight = 20902
        mmLeft = 794
        mmTop = 0
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        AutoSize = False
        Caption = 'Voy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 113771
        mmWidth = 42863
        BandType = 0
      end
      object ppDBText104: TppDBText
        UserName = 'DBText104'
        DataField = 'NR_VIAGEM_ARMADOR'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 113771
        mmWidth = 150813
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Shipping rates:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 144992
        mmWidth = 42863
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'calcItem'
        DataPipeline = ppDet3
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDet3'
        mmHeight = 3969
        mmLeft = 794
        mmTop = 150019
        mmWidth = 50271
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MOEDA'
        DataPipeline = ppDet3
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDet3'
        mmHeight = 3969
        mmLeft = 54769
        mmTop = 150019
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'COMPRA'
        DataPipeline = ppDet3
        DisplayFormat = '#0.,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDet3'
        mmHeight = 3969
        mmLeft = 75671
        mmTop = 150019
        mmWidth = 32015
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MOEDA'
        DataPipeline = ppDet3
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDet3'
        mmHeight = 3969
        mmLeft = 111919
        mmTop = 150019
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText802'
        DataField = 'VENDA'
        DataPipeline = ppDet3
        DisplayFormat = '#0.,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDet3'
        mmHeight = 3969
        mmLeft = 133086
        mmTop = 150019
        mmWidth = 32015
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PROFIT'
        DataPipeline = ppDet3
        DisplayFormat = '#0.,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDet3'
        mmHeight = 3969
        mmLeft = 173832
        mmTop = 150019
        mmWidth = 21696
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand8: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppRegion4: TppRegion
        UserName = 'Region4'
        Brush.Style = bsClear
        Caption = 'Region4'
        Pen.Style = psClear
        Transparent = True
        mmHeight = 6879
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBText75: TppDBText
          UserName = 'DBText75'
          DataField = 'calcUsuario'
          DataPipeline = ppGeral1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppGeral1'
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 2117
          mmWidth = 193411
          BandType = 7
        end
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1323
        mmLeft = 529
        mmTop = 0
        mmWidth = 195792
        BandType = 7
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object qryShippingMar: TQuery
    AutoCalcFields = False
    CachedUpdates = True
    OnCalcFields = qryShippingMarCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CASE PR.TP_PRODUTO'
      '       WHEN '#39'01'#39' THEN '#39'IMPORT'#39
      '       WHEN '#39'02'#39' THEN '#39'EXPORT'#39
      '       END AS PRODUTO ,'
      '       SUBSTRING(P.NR_PROCESSO, 5,14) AS NR_PROCESSO,'
      '       AG.NM_AGENTE,'
      '       ISNULL(AG.DS_ENDERECO, '#39#39') AS AGENTE_ENDERECO,'
      
        '       RTRIM(ISNULL((SELECT LE.DESCRICAO FROM TLOCAL_EMBARQUE LE' +
        ' (NOLOCK) WHERE LE.CODIGO = AG.CD_CIDADE), '#39#39')) +'
      
        '       RTRIM(CASE ISNULL(AG.CD_CIDADE,'#39#39') WHEN '#39#39' THEN '#39#39' ELSE '#39 +
        ' - '#39' + ISNULL((SELECT LE.CD_UF FROM TLOCAL_EMBARQUE LE (NOLOCK) ' +
        'WHERE LE.CODIGO = AG.CD_CIDADE),'#39#39') END) AS AGENTE_ENDERECO2,'
      '       EE.NM_EMPRESA AS NM_EXPORTADOR,'
      '       RTRIM(ISNULL(EE.END_NUMERO, '#39#39')) +'
      
        '       RTRIM(CASE ISNULL(EE.END_EMPRESA, '#39#39') WHEN '#39#39' THEN '#39#39' ELS' +
        'E '#39', '#39' + ISNULL(EE.END_EMPRESA, '#39#39') END) AS END_EXPORTADOR1,'
      '       RTRIM(ISNULL(EE.END_COMPL, '#39#39')) AS END_EXPORTADOR2,'
      '       RTRIM(ISNULL(EE.END_CIDADE, '#39#39')) +'
      
        '       RTRIM(CASE ISNULL(EE.CD_PAIS, '#39#39') WHEN '#39#39' THEN '#39#39' ELSE '#39',' +
        ' '#39' + ISNULL((SELECT PA.DESCRICAO FROM TPAIS PA (NOLOCK) WHERE PA' +
        '.CODIGO = EE.CD_PAIS), '#39#39') END) AS END_EXPORTADOR3,'
      '       EE.END_ESTADO,'
      '       EN.NM_EMPRESA,'
      '       RTRIM(ISNULL(EN.END_EMPRESA, '#39#39')) +'
      
        '       RTRIM(CASE ISNULL(EN.END_NUMERO, '#39#39') WHEN '#39#39' THEN '#39#39' ELSE' +
        ' '#39', '#39' + ISNULL(EN.END_NUMERO, '#39#39') END) AS END_IMPORTADOR1,'
      '       RTRIM(ISNULL(EN.END_BAIRRO, '#39#39')) +'
      
        '       RTRIM(CASE ISNULL(EN.END_CIDADE, '#39#39') WHEN '#39#39' THEN '#39#39' ELSE' +
        ' '#39' - '#39' + ISNULL(EN.END_CIDADE, '#39#39') END) +'
      
        '       RTRIM(CASE ISNULL(EN.END_UF, '#39#39')     WHEN '#39#39' THEN '#39#39' ELSE' +
        '  '#39' - '#39' + ISNULL(EN.END_UF, '#39#39') END) AS END_IMPORTADOR2,'
      '       CASE ISNULL(EN.CGC_EMPRESA, '#39#39') WHEN '#39#39' THEN '#39#39
      '       ELSE'
      '       '#39'CNPJ: '#39' + SUBSTRING(EN.CGC_EMPRESA, 1,2)  + '#39'.'#39' +'
      '                   SUBSTRING(EN.CGC_EMPRESA, 3,3)  + '#39'.'#39' +'
      '                  SUBSTRING(EN.CGC_EMPRESA, 6,3)  + '#39'/'#39' +'
      '                  SUBSTRING(EN.CGC_EMPRESA, 9,4) + '#39'-'#39' +'
      
        '                  SUBSTRING(EN.CGC_EMPRESA, 13,2) END AS CNPJ_IM' +
        'PORTADOR,'
      '       P.NR_CONHECIMENTO, P.NR_CONHECIMENTO_MASTER,'
      
        '       (SELECT DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE ' +
        'CODIGO = P.CD_TRANSPORTADOR) AS CARRIER,'
      
        '       (SELECT PO.NM_PORTO FROM TPORTO PO (NOLOCK) WHERE PO.CD_P' +
        'ORTO = P.CD_ORIGEM) AS LOCAL_EMBARQUE,'
      
        '       (SELECT PD.NM_PORTO FROM TPORTO PD (NOLOCK) WHERE PD.CD_P' +
        'ORTO = P.CD_DESTINO) AS LOCAL_DESEMBARQUE,'
      
        '       (SELECT EMB.NM_EMBARCACAO FROM TEMBARCACAO EMB (NOLOCK) W' +
        'HERE EMB.CD_EMBARCACAO = P.CD_EMBARCACAO) AS NAVIO,'
      
        '       CONVERT(DATETIME, (SELECT F1.DT_REALIZACAO FROM TFOLLOWUP' +
        ' F1 (NOLOCK) WHERE F1.CD_EVENTO = '#39'161'#39' AND F1.NR_PROCESSO = P.N' +
        'R_PROCESSO), 103) AS ETA,'
      
        '       CONVERT(DATETIME, (SELECT F2.DT_REALIZACAO FROM TFOLLOWUP' +
        ' F2 (NOLOCK) WHERE F2.CD_EVENTO = '#39'162'#39' AND F2.NR_PROCESSO = P.N' +
        'R_PROCESSO), 103) AS ETD,'
      
        '       CONVERT(DATETIME, (SELECT F3.DT_REALIZACAO FROM TFOLLOWUP' +
        ' F3 (NOLOCK) WHERE F3.CD_EVENTO = '#39'218'#39' AND F3.NR_PROCESSO = P.N' +
        'R_PROCESSO), 103) AS PICKUP,'
      '       (CASE P.TP_ESTUFAGEM'
      '        WHEN '#39'1'#39' THEN'
      
        '         (SELECT COUNT(*) FROM TPROCESSO_CNTR P2 (NOLOCK) WHERE ' +
        'P2.NR_PROCESSO = P.NR_PROCESSO AND'
      
        '          P2.TP_CNTR IN (SELECT TP.TP_CNTR FROM TTP_CNTR TP (NOL' +
        'OCK) WHERE TP.TP_PESO = '#39'2'#39'))'
      '        ELSE 0'
      '        END) AS CNTR20,'
      '       (CASE P.TP_ESTUFAGEM'
      '        WHEN '#39'1'#39' THEN'
      
        '          (SELECT COUNT(*) FROM TPROCESSO_CNTR P4 (NOLOCK)  WHER' +
        'E P4.NR_PROCESSO = P.NR_PROCESSO AND'
      
        '           P4.TP_CNTR IN (SELECT TP.TP_CNTR FROM TTP_CNTR TP (NO' +
        'LOCK) WHERE TP.TP_PESO = '#39'4'#39'))'
      '        ELSE 0'
      '        END) AS CNTR40,'
      '          P.CD_INCOTERM, P.TX_OBSERVACOES, P.TX_DESCR,'
      
        '       (SELECT U.NM_USUARIO FROM TUSUARIO U (NOLOCK) WHERE U.CD_' +
        'USUARIO = :USUARIO) AS USUARIO_EMISSAO,'
      
        '       (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) WHERE M.' +
        'CD_MOEDA = P.CD_MOEDA_FRETE) AS AP_MOEDA,'
      
        '       (SELECT CA.NM_CONTATO FROM TCONTATO_AG CA (NOLOCK) WHERE ' +
        'CA.CD_AGENTE = AG.CD_AGENTE) AS NM_CONTATO,'
      '       P.NR_VIAGEM_ARMADOR'
      '  FROM TPROCESSO P (NOLOCK)'
      '  LEFT JOIN TPRODUTO PR (NOLOCK) ON PR.CD_PRODUTO = P.CD_PRODUTO'
      '  LEFT JOIN TAGENTE AG (NOLOCK) ON AG.CD_AGENTE = P.CD_AGENTE'
      
        '  LEFT JOIN TEMPRESA_EST EE (NOLOCK) ON EE.CD_EMPRESA = P.CD_EMP' +
        '_EST'
      
        '  LEFT JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = P.CD_CLI' +
        'ENTE'
      
        '  LEFT JOIN TVIAGEM V (NOLOCK) ON V.CD_UNID_NEG = P.CD_UNID_NEG ' +
        'AND'
      '                                  V.CD_PRODUTO = '#39'01'#39' AND'
      
        '                                  V.CD_EMBARCACAO = P.CD_EMBARCA' +
        'CAO AND'
      '                                  V.NR_VIAGEM = P.NR_VIAGEM'
      ' WHERE P.NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 152
    Top = 464
    ParamData = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryShippingMarPRODUTO: TStringField
      FieldName = 'PRODUTO'
      FixedChar = True
      Size = 6
    end
    object qryShippingMarNR_PROCESSO: TStringField
      DisplayWidth = 14
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 14
    end
    object qryShippingMarNM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qryShippingMarAGENTE_ENDERECO: TStringField
      FieldName = 'AGENTE_ENDERECO'
      FixedChar = True
      Size = 255
    end
    object qryShippingMarAGENTE_ENDERECO2: TStringField
      FieldName = 'AGENTE_ENDERECO2'
      FixedChar = True
      Size = 55
    end
    object qryShippingMarNM_EXPORTADOR: TStringField
      FieldName = 'NM_EXPORTADOR'
      FixedChar = True
      Size = 60
    end
    object qryShippingMarEND_EXPORTADOR1: TStringField
      FieldName = 'END_EXPORTADOR1'
      FixedChar = True
      Size = 68
    end
    object qryShippingMarEND_EXPORTADOR2: TStringField
      FieldName = 'END_EXPORTADOR2'
      FixedChar = True
      Size = 41
    end
    object qryShippingMarEND_EXPORTADOR3: TStringField
      FieldName = 'END_EXPORTADOR3'
      FixedChar = True
      Size = 152
    end
    object qryShippingMarEND_ESTADO: TStringField
      FieldName = 'END_ESTADO'
      FixedChar = True
      Size = 30
    end
    object qryShippingMarNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qryShippingMarEND_IMPORTADOR1: TStringField
      FieldName = 'END_IMPORTADOR1'
      FixedChar = True
      Size = 58
    end
    object qryShippingMarEND_IMPORTADOR2: TStringField
      FieldName = 'END_IMPORTADOR2'
      FixedChar = True
      Size = 68
    end
    object qryShippingMarCNPJ_IMPORTADOR: TStringField
      FieldName = 'CNPJ_IMPORTADOR'
      FixedChar = True
      Size = 24
    end
    object qryShippingMarNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qryShippingMarLOCAL_EMBARQUE: TStringField
      FieldName = 'LOCAL_EMBARQUE'
      FixedChar = True
      Size = 50
    end
    object qryShippingMarLOCAL_DESEMBARQUE: TStringField
      FieldName = 'LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 50
    end
    object qryShippingMarCNTR20: TIntegerField
      FieldName = 'CNTR20'
    end
    object qryShippingMarCNTR40: TIntegerField
      FieldName = 'CNTR40'
    end
    object qryShippingMarCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryShippingMarUSUARIO_EMISSAO: TStringField
      FieldName = 'USUARIO_EMISSAO'
      FixedChar = True
      Size = 50
    end
    object qryShippingMarAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryShippingMarNR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      FixedChar = True
      Size = 30
    end
    object qryShippingMarCARRIER: TStringField
      FieldName = 'CARRIER'
      FixedChar = True
      Size = 60
    end
    object qryShippingMarPICKUP: TDateTimeField
      FieldName = 'PICKUP'
    end
    object qryShippingMarcalcWeight: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcWeight'
      Size = 50
      Calculated = True
    end
    object qryShippingMarcalcDims: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcDims'
      Size = 50
      Calculated = True
    end
    object qryShippingMarcalcVolume: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcVolume'
      Size = 50
      Calculated = True
    end
    object qryShippingMarcalcCommodity: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCommodity'
      Size = 500
      Calculated = True
    end
    object qryShippingMarcalcRefCli: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcRefCli'
      Size = 500
      Calculated = True
    end
    object qryShippingMarNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qryShippingMarcalcUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUsuario'
      Size = 255
      Calculated = True
    end
    object qryShippingMarTX_OBSERVACOES: TMemoField
      FieldName = 'TX_OBSERVACOES'
      BlobType = ftMemo
    end
    object qryShippingMarTX_DESCR: TStringField
      FieldName = 'TX_DESCR'
      FixedChar = True
      Size = 255
    end
    object qryShippingMarNAVIO: TStringField
      FieldName = 'NAVIO'
      FixedChar = True
      Size = 40
    end
    object qryShippingMarETA: TDateTimeField
      FieldName = 'ETA'
    end
    object qryShippingMarETD: TDateTimeField
      FieldName = 'ETD'
    end
    object qryShippingMarNR_VIAGEM_ARMADOR: TStringField
      FieldName = 'NR_VIAGEM_ARMADOR'
      FixedChar = True
      Size = 15
    end
  end
  object ppGeral1: TppBDEPipeline
    DataSource = dsShippingMar
    UserName = 'Geral1'
    Left = 248
    Top = 464
    object ppField1: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppField2: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppField3: TppField
      FieldAlias = 'NM_AGENTE'
      FieldName = 'NM_AGENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppField4: TppField
      FieldAlias = 'AGENTE_ENDERECO'
      FieldName = 'AGENTE_ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppField5: TppField
      FieldAlias = 'AGENTE_ENDERECO2'
      FieldName = 'AGENTE_ENDERECO2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppField6: TppField
      FieldAlias = 'NM_EXPORTADOR'
      FieldName = 'NM_EXPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppField7: TppField
      FieldAlias = 'END_EXPORTADOR1'
      FieldName = 'END_EXPORTADOR1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppField8: TppField
      FieldAlias = 'END_EXPORTADOR2'
      FieldName = 'END_EXPORTADOR2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppField9: TppField
      FieldAlias = 'END_EXPORTADOR3'
      FieldName = 'END_EXPORTADOR3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppField10: TppField
      FieldAlias = 'END_ESTADO'
      FieldName = 'END_ESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppField11: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppField12: TppField
      FieldAlias = 'END_IMPORTADOR1'
      FieldName = 'END_IMPORTADOR1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppField13: TppField
      FieldAlias = 'END_IMPORTADOR2'
      FieldName = 'END_IMPORTADOR2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppField14: TppField
      FieldAlias = 'CNPJ_IMPORTADOR'
      FieldName = 'CNPJ_IMPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppField15: TppField
      FieldAlias = 'NR_CONHECIMENTO'
      FieldName = 'NR_CONHECIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppField16: TppField
      FieldAlias = 'LOCAL_EMBARQUE'
      FieldName = 'LOCAL_EMBARQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppField17: TppField
      FieldAlias = 'LOCAL_DESEMBARQUE'
      FieldName = 'LOCAL_DESEMBARQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppField18: TppField
      FieldAlias = 'ETA'
      FieldName = 'ETA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppField19: TppField
      FieldAlias = 'ETD'
      FieldName = 'ETD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppField20: TppField
      FieldAlias = 'CNTR20'
      FieldName = 'CNTR20'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppField21: TppField
      FieldAlias = 'CNTR40'
      FieldName = 'CNTR40'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppField22: TppField
      FieldAlias = 'CD_INCOTERM'
      FieldName = 'CD_INCOTERM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppField23: TppField
      FieldAlias = 'USUARIO_EMISSAO'
      FieldName = 'USUARIO_EMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppField24: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppField25: TppField
      FieldAlias = 'NR_CONHECIMENTO_MASTER'
      FieldName = 'NR_CONHECIMENTO_MASTER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppField26: TppField
      FieldAlias = 'CARRIER'
      FieldName = 'CARRIER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppField27: TppField
      FieldAlias = 'PICKUP'
      FieldName = 'PICKUP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppField28: TppField
      FieldAlias = 'calcWeight'
      FieldName = 'calcWeight'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppField29: TppField
      FieldAlias = 'calcDims'
      FieldName = 'calcDims'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppField30: TppField
      FieldAlias = 'calcVolume'
      FieldName = 'calcVolume'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppField31: TppField
      FieldAlias = 'calcCommodity'
      FieldName = 'calcCommodity'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppField32: TppField
      FieldAlias = 'calcRefCli'
      FieldName = 'calcRefCli'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppField33: TppField
      FieldAlias = 'NAVIO'
      FieldName = 'NAVIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppField34: TppField
      FieldAlias = 'NR_HOUSE'
      FieldName = 'NR_HOUSE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppGeral1ppField35: TppField
      FieldAlias = 'NR_MASTER'
      FieldName = 'NR_MASTER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppGeral1ppField36: TppField
      FieldAlias = 'NM_ARMADOR'
      FieldName = 'NM_ARMADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppGeral1ppField37: TppField
      FieldAlias = 'NM_CONTATO'
      FieldName = 'NM_CONTATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppGeral1ppField38: TppField
      FieldAlias = 'NR_VIAGEM_ARMADOR'
      FieldName = 'NR_VIAGEM_ARMADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppGeral1ppField39: TppField
      FieldAlias = 'TX_DESCR'
      FieldName = 'TX_DESCR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppGeral1ppField40: TppField
      FieldAlias = 'calcUsuario'
      FieldName = 'calcUsuario'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppGeral1ppField41: TppField
      FieldAlias = 'TX_OBSERVACOES'
      FieldName = 'TX_OBSERVACOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
  end
  object ppDet3: TppBDEPipeline
    DataSource = dsRelDet3
    UserName = 'Det3'
    Left = 249
    Top = 615
    object ppDet3ppField1: TppField
      FieldAlias = 'COMPRA'
      FieldName = 'COMPRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDet3ppField2: TppField
      FieldAlias = 'VENDA'
      FieldName = 'VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDet3ppField3: TppField
      FieldAlias = 'PROFIT'
      FieldName = 'PROFIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDet3ppField4: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDet3ppField5: TppField
      FieldAlias = 'MOEDA'
      FieldName = 'MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDet3ppField6: TppField
      FieldAlias = 'calcItem'
      FieldName = 'calcItem'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDet3ppField7: TppField
      FieldAlias = 'COMPRA_TOT'
      FieldName = 'COMPRA_TOT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDet3ppField8: TppField
      FieldAlias = 'VENDA_TOT'
      FieldName = 'VENDA_TOT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDet3ppField9: TppField
      FieldAlias = 'PROFIT_TOT'
      FieldName = 'PROFIT_TOT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object qryRelDet3: TQuery
    OnCalcFields = qryRelDet3CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '  SELECT PF.CD_MOEDA,'
      '       CASE PF.CD_MOEDA'
      '          WHEN '#39'220'#39' THEN '#39'USD'#39
      '          WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '          ELSE (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) ' +
        'WHERE M.CD_MOEDA = PF.CD_MOEDA)'
      '        END AS MOEDA,'
      '        ISNULL(PRI.VL_CUSTO, 0) AS COMPRA,'
      '        ISNULL(PRI.VL_VENDA, 0) AS VENDA,'
      
        '       (ISNULL(PRI.VL_VENDA, 0) - ISNULL(PRI.VL_CUSTO, 0))AS PRO' +
        'FIT,'
      '        CASE'
      
        '         WHEN   (SELECT ISNULL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)),' +
        ' 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA =' +
        ' PRI.NR_PROPOSTA)'
      
        '              > (SELECT ISNULL(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0' +
        ')   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA =' +
        ' PRI.NR_PROPOSTA)'
      
        '         THEN (SELECT ISNULL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0' +
        ') FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA = P' +
        'RI.NR_PROPOSTA)*ISNULL(PRI.VL_CUSTO, 0)'
      
        '         ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0) ' +
        '  FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA = P' +
        'RI.NR_PROPOSTA)*ISNULL(PRI.VL_CUSTO, 0)'
      '       END AS COMPRA_TOT,'
      '       CASE'
      
        '         WHEN   (SELECT ISNULL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)),' +
        ' 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA =' +
        ' PRI.NR_PROPOSTA)'
      
        '              > (SELECT ISNULL(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0' +
        ')   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA =' +
        ' PRI.NR_PROPOSTA)'
      
        '         THEN (SELECT ISNULL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0' +
        ') FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA = P' +
        'RI.NR_PROPOSTA)*ISNULL(PRI.VL_VENDA, 0)'
      
        '         ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0) ' +
        '  FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA = P' +
        'RI.NR_PROPOSTA)*ISNULL(PRI.VL_VENDA, 0)'
      '       END AS VENDA_TOT,'
      '       CASE'
      
        '         WHEN   (SELECT ISNULL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)),' +
        ' 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA =' +
        ' PRI.NR_PROPOSTA)'
      
        '              > (SELECT ISNULL(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0' +
        ')   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA =' +
        ' PRI.NR_PROPOSTA)'
      
        '         THEN (SELECT ISNULL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0' +
        ') FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA = P' +
        'RI.NR_PROPOSTA)*(ISNULL(PRI.VL_VENDA, 0) - ISNULL(PRI.VL_CUSTO, ' +
        '0))'
      
        '         ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0) ' +
        '  FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA = P' +
        'RI.NR_PROPOSTA)*(ISNULL(PRI.VL_VENDA, 0) - ISNULL(PRI.VL_CUSTO, ' +
        '0))'
      '       END AS PROFIT_TOT'
      '  FROM TPROPOSTA_ITEM PRI (NOLOCK)'
      
        '  LEFT JOIN TPROPOSTA_FRETE PF (NOLOCK) ON PF.NR_PROPOSTA = PRI.' +
        'NR_PROPOSTA'
      
        '  INNER JOIN TAGENTE AG (NOLOCK) ON AG.CD_AGENTE = (SELECT CD_AG' +
        'ENTE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = :NR_PROCESSO)'
      
        ' WHERE PRI.NR_PROPOSTA = (SELECT NR_PROPOSTA FROM TPROCESSO (NOL' +
        'OCK) WHERE NR_PROCESSO = :NR_PROCESSO)'
      ''
      '')
    Left = 151
    Top = 614
    ParamData = <
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
    object qryRelDet2COMPRA: TFloatField
      FieldName = 'COMPRA'
    end
    object qryRelDet2VENDA: TFloatField
      FieldName = 'VENDA'
    end
    object qryRelDet2PROFIT: TFloatField
      FieldName = 'PROFIT'
    end
    object qryRelDet2CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qryRelDet2MOEDA: TStringField
      FieldName = 'MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryRelDet2calcItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcItem'
      Size = 100
      Calculated = True
    end
    object qryRelDet3COMPRA_TOT: TFloatField
      FieldName = 'COMPRA_TOT'
    end
    object qryRelDet3VENDA_TOT: TFloatField
      FieldName = 'VENDA_TOT'
    end
    object qryRelDet3PROFIT_TOT: TFloatField
      FieldName = 'PROFIT_TOT'
    end
  end
  object dsRelDet3: TDataSource
    DataSet = qryRelDet3
    Left = 44
    Top = 613
  end
  object dsRelDet3FCL: TDataSource
    DataSet = qryRelDet3FCL
    Left = 44
    Top = 677
  end
  object qryRelDet3FCL: TQuery
    OnCalcFields = qryRelDet3CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ' SELECT PF.CD_MOEDA,'
      '        CASE PF.CD_MOEDA'
      '          WHEN '#39'220'#39' THEN '#39'USD'#39
      '          WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '          ELSE (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) ' +
        'WHERE M.CD_MOEDA = PF.CD_MOEDA)'
      '        END AS MOEDA,'
      
        '        '#39'FRETE MAR'#205'TIMO - '#39' + (SELECT NM_TP_CNTR FROM TTP_CNTR W' +
        'HERE TP_CNTR = PM.TP_CNTR) AS NM_ITEM,'
      '        ISNULL(SUM(PM.VL_CUSTO), 0) AS COMPRA,'
      '        ISNULL(SUM(PM.VL_VENDA), 0) AS VENDA,'
      
        '       (ISNULL(SUM(PM.VL_VENDA), 0) - ISNULL(SUM(PM.VL_CUSTO), 0' +
        ')) AS PROFIT,'
      
        '        ISNULL(SUM(TI.QTDE), 0)*ISNULL(SUM(PM.VL_CUSTO), 0) AS C' +
        'OMPRA_TOT,'
      
        '        ISNULL(SUM(TI.QTDE), 0)*ISNULL(SUM(PM.VL_VENDA), 0) AS V' +
        'ENDA_TOT,'
      
        '        ISNULL(SUM(TI.QTDE), 0)*(ISNULL(SUM(PM.VL_VENDA), 0) - I' +
        'SNULL(SUM(PM.VL_CUSTO), 0)) AS PROFIT_TOT,'
      '        ISNULL(SUM(TI.QTDE), 0) AS QTDE'
      '  FROM TPROPOSTA_MERCADORIA PM (NOLOCK)'
      
        '  INNER JOIN TINSTRUCAO_CARGA TI (NOLOCK) ON TI.TP_CNTR = PM.TP_' +
        'CNTR AND TI.NR_PROCESSO = :NR_PROCESSO '
      
        '  LEFT  JOIN TPROPOSTA_FRETE PF (NOLOCK) ON PF.NR_PROPOSTA = PM.' +
        'NR_PROPOSTA'
      
        ' WHERE PM.NR_PROPOSTA = (SELECT NR_PROPOSTA FROM TPROCESSO (NOLO' +
        'CK) WHERE NR_PROCESSO = :NR_PROCESSO)'
      'GROUP BY PF.CD_MOEDA, PM.TP_CNTR'
      
        'HAVING ISNULL(SUM(PM.VL_CUSTO), 0) + ISNULL(SUM(PM.VL_VENDA), 0)' +
        ' > 0'
      '')
    Left = 151
    Top = 678
    ParamData = <
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
    object qryRelDet3FCLCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qryRelDet3FCLMOEDA: TStringField
      FieldName = 'MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryRelDet3FCLNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 37
    end
    object qryRelDet3FCLCOMPRA: TFloatField
      FieldName = 'COMPRA'
    end
    object qryRelDet3FCLVENDA: TFloatField
      FieldName = 'VENDA'
    end
    object qryRelDet3FCLPROFIT: TFloatField
      FieldName = 'PROFIT'
    end
    object qryRelDet3FCLCOMPRA_TOT: TFloatField
      FieldName = 'COMPRA_TOT'
    end
    object qryRelDet3FCLVENDA_TOT: TFloatField
      FieldName = 'VENDA_TOT'
    end
    object qryRelDet3FCLPROFIT_TOT: TFloatField
      FieldName = 'PROFIT_TOT'
    end
    object qryRelDet3FCLQTDE: TFloatField
      FieldName = 'QTDE'
    end
  end
  object ppDet3FCL: TppBDEPipeline
    DataSource = dsRelDet3FCL
    UserName = 'Det3FCL'
    Left = 249
    Top = 679
  end
  object ppRegAgFCL: TppReport
    AutoStop = False
    DataPipeline = ppGeral1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\SIagenteFCL.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 426
    Top = 464
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppGeral1'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 222780
      mmPrintPosition = 0
      object ppSubReport9: TppSubReport
        UserName = 'SubReport9'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = True
        DataPipelineName = 'ppDet3FCL'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 149754
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport9: TppChildReport
          AutoStop = False
          DataPipeline = ppDet3FCL
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDet3FCL'
          object ppTitleBand9: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand11: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppDBText33: TppDBText
              UserName = 'DBText76'
              DataField = 'NM_ITEM'
              DataPipeline = ppDet3FCL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3969
              mmLeft = 529
              mmTop = 794
              mmWidth = 50271
              BandType = 4
            end
            object ppDBText121: TppDBText
              UserName = 'DBText77'
              DataField = 'MOEDA'
              DataPipeline = ppDet3FCL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3969
              mmLeft = 54504
              mmTop = 794
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText122: TppDBText
              UserName = 'DBText78'
              DataField = 'COMPRA'
              DataPipeline = ppDet3FCL
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3969
              mmLeft = 75406
              mmTop = 794
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText123: TppDBText
              UserName = 'DBText79'
              DataField = 'MOEDA'
              DataPipeline = ppDet3FCL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3969
              mmLeft = 111654
              mmTop = 794
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText124: TppDBText
              UserName = 'DBText80'
              DataField = 'VENDA'
              DataPipeline = ppDet3FCL
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3969
              mmLeft = 132821
              mmTop = 794
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText125: TppDBText
              UserName = 'DBText81'
              DataField = 'PROFIT'
              DataPipeline = ppDet3FCL
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3969
              mmLeft = 173567
              mmTop = 794
              mmWidth = 21696
              BandType = 4
            end
          end
          object ppSummaryBand11: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport5: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport9
        TraverseAllData = True
        DataPipelineName = 'ppDet2'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 154517
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDet2
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDet2'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText13: TppDBText
              UserName = 'DBText76'
              DataField = 'calcItem'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 800
              mmTop = 0
              mmWidth = 50271
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText77'
              DataField = 'MOEDA'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 54769
              mmTop = 0
              mmWidth = 20000
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText78'
              DataField = 'COMPRA'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 75671
              mmTop = 0
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText79'
              DataField = 'MOEDA'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 111919
              mmTop = 0
              mmWidth = 20000
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText80'
              DataField = 'VENDA'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 133086
              mmTop = 0
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText81'
              DataField = 'PROFIT_AG'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 173830
              mmTop = 0
              mmWidth = 21696
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2381
            mmPrintPosition = 0
          end
        end
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Attention to Mr/s.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4360
        mmLeft = 10319
        mmTop = 28310
        mmWidth = 32131
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'TO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 35454
        mmTop = 22754
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = ' SHIPPING INSTRUCTIONS - '
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 5556
        mmLeft = 529
        mmTop = 34396
        mmWidth = 196057
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 529
        mmTop = 39952
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Shipper/Exporter: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 41275
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Address: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 45508
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Cnee/Importer: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 57679
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Address: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 61913
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Commodity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 75671
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Incoterm '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 79904
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Container 20'#39
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 84138
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Container 40'#39' '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 88371
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Weight/KG'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 92604
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Dims/CBM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3900
        mmLeft = 800
        mmTop = 96838
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = ' AGREED RATES:'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 5556
        mmLeft = 529
        mmTop = 131498
        mmWidth = 196057
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 529
        mmTop = 137054
        mmWidth = 196057
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 2117
        mmLeft = 265
        mmTop = 130969
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Currency'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3556
        mmLeft = 111919
        mmTop = 139965
        mmWidth = 20000
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = '   Selling Rate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 133350
        mmTop = 139965
        mmWidth = 32279
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = '   Buying Rate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3556
        mmLeft = 75406
        mmTop = 139965
        mmWidth = 32279
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Currency'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3556
        mmLeft = 54504
        mmTop = 139965
        mmWidth = 20000
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Profit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3556
        mmLeft = 173832
        mmTop = 140229
        mmWidth = 21696
        BandType = 0
      end
      object ppSubReport6: TppSubReport
        UserName = 'SubReport4'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport7
        TraverseAllData = True
        DataPipelineName = 'ppDet1'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 196057
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppDet1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDet1'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppLabel21: TppLabel
              UserName = 'Label304'
              AutoSize = False
              Caption = 'Expenses abroad:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3900
              mmLeft = 3000
              mmTop = 0
              mmWidth = 42863
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText19: TppDBText
              UserName = 'DBText94'
              DataField = 'calcItem'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 794
              mmTop = 264
              mmWidth = 50800
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText95'
              DataField = 'MOEDA'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 54769
              mmTop = 264
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText96'
              DataField = 'COMPRA_TOT'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 75671
              mmTop = 264
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText97'
              DataField = 'MOEDA'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 111919
              mmTop = 264
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText98'
              DataField = 'VENDA_TOT'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 133086
              mmTop = 264
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText99'
              DataField = 'PROFIT_TOT_AG'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 173832
              mmTop = 264
              mmWidth = 21696
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
          end
        end
      end
      object ppDBText25: TppDBText
        UserName = 'DBText54'
        DataField = 'NM_EXPORTADOR'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 41275
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText55'
        DataField = 'END_EXPORTADOR1'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 45508
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText56'
        DataField = 'END_EXPORTADOR2'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 49213
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText57'
        DataField = 'NM_EMPRESA'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 57415
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'DBText58'
        DataField = 'END_EXPORTADOR3'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 52917
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'DBText59'
        DataField = 'END_IMPORTADOR1'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 61913
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'DBText60'
        DataField = 'END_IMPORTADOR2'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 65617
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText61'
        DataField = 'CNPJ_IMPORTADOR'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 69321
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText601'
        DataField = 'calcDims'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 96838
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText64'
        DataField = 'calcWeight'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 92604
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText65'
        DataField = 'CNTR40'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 88371
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText66'
        DataField = 'CNTR20'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 84138
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText67'
        DataField = 'CD_INCOTERM'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 79904
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText39: TppDBText
        UserName = 'DBText68'
        DataField = 'calcCommodity'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 75671
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText40: TppDBText
        UserName = 'DBText69'
        DataField = 'NM_AGENTE'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 4741
        mmLeft = 43921
        mmTop = 23019
        mmWidth = 150813
        BandType = 0
      end
      object ppRegion1: TppRegion
        UserName = 'Region2'
        Brush.Style = bsClear
        Caption = 'Region2'
        Pen.Style = psClear
        ShiftRelativeTo = ppSubReport8
        Stretch = True
        Transparent = True
        mmHeight = 21431
        mmLeft = 0
        mmTop = 165100
        mmWidth = 197644
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel22: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = ' TOTAL of the RATES:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          mmHeight = 5556
          mmLeft = 529
          mmTop = 168010
          mmWidth = 196057
          BandType = 0
        end
        object ppLine15: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 2117
          mmLeft = 265
          mmTop = 173567
          mmWidth = 196057
          BandType = 0
        end
        object ppLine16: TppLine
          UserName = 'Line5'
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 2117
          mmLeft = 529
          mmTop = 167481
          mmWidth = 196057
          BandType = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'Currency'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3556
          mmLeft = 111919
          mmTop = 176742
          mmWidth = 20108
          BandType = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label23'
          AutoSize = False
          Caption = '   Selling Rate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3556
          mmLeft = 133350
          mmTop = 176742
          mmWidth = 32279
          BandType = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = '   Buying Rate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3556
          mmLeft = 75142
          mmTop = 176742
          mmWidth = 32279
          BandType = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Caption = 'Currency'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3556
          mmLeft = 54240
          mmTop = 176742
          mmWidth = 20108
          BandType = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Profit'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3556
          mmLeft = 174361
          mmTop = 177006
          mmWidth = 21696
          BandType = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label83'
          AutoSize = False
          Caption = 'Shipping rates:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3969
          mmLeft = 3440
          mmTop = 180976
          mmWidth = 42863
          BandType = 0
        end
      end
      object ppSubReport7: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport10
        TraverseAllData = True
        DataPipelineName = 'ppDet2'
        mmHeight = 4763
        mmLeft = 0
        mmTop = 190765
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppDet2
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDet2'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText47: TppDBText
              UserName = 'DBText88'
              DataField = 'calcItem'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 794
              mmTop = 529
              mmWidth = 50800
              BandType = 4
            end
            object ppDBText48: TppDBText
              UserName = 'DBText89'
              DataField = 'MOEDA'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 54769
              mmTop = 529
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText49: TppDBText
              UserName = 'DBText90'
              DataField = 'COMPRA_TOT'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 75671
              mmTop = 529
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText50: TppDBText
              UserName = 'DBText91'
              DataField = 'MOEDA'
              DataPipeline = ppDet2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 111919
              mmTop = 529
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText51: TppDBText
              UserName = 'DBText92'
              DataField = 'VENDA_TOT'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3900
              mmLeft = 133086
              mmTop = 529
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText52: TppDBText
              UserName = 'DBText93'
              DataField = 'PROFIT_TOT_AG'
              DataPipeline = ppDet2
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet2'
              mmHeight = 3969
              mmLeft = 174361
              mmTop = 529
              mmWidth = 21696
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2381
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport10: TppSubReport
        UserName = 'SubReport10'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppRegion1
        TraverseAllData = True
        DataPipelineName = 'ppDet3FCL'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 187061
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport10: TppChildReport
          AutoStop = False
          DataPipeline = ppDet3FCL
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDet3FCL'
          object ppTitleBand10: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand12: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText114: TppDBText
              UserName = 'DBText88'
              DataField = 'NM_ITEM'
              DataPipeline = ppDet3FCL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3900
              mmLeft = 794
              mmTop = 529
              mmWidth = 50800
              BandType = 4
            end
            object ppDBText115: TppDBText
              UserName = 'DBText89'
              DataField = 'MOEDA'
              DataPipeline = ppDet3FCL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3900
              mmLeft = 54769
              mmTop = 529
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText116: TppDBText
              UserName = 'DBText90'
              DataField = 'COMPRA_TOT'
              DataPipeline = ppDet3FCL
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3900
              mmLeft = 75671
              mmTop = 529
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText117: TppDBText
              UserName = 'DBText91'
              DataField = 'MOEDA'
              DataPipeline = ppDet3FCL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3900
              mmLeft = 111919
              mmTop = 529
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText118: TppDBText
              UserName = 'DBText92'
              DataField = 'VENDA_TOT'
              DataPipeline = ppDet3FCL
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3900
              mmLeft = 133086
              mmTop = 529
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText119: TppDBText
              UserName = 'DBText93'
              DataField = 'PROFIT_TOT'
              DataPipeline = ppDet3FCL
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet3FCL'
              mmHeight = 3969
              mmLeft = 174361
              mmTop = 529
              mmWidth = 21696
              BandType = 4
            end
          end
          object ppSummaryBand12: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2381
            mmPrintPosition = 0
          end
        end
      end
      object ppRegion5: TppRegion
        UserName = 'Region3'
        Brush.Style = bsClear
        Caption = 'Region3'
        Pen.Style = psClear
        ShiftRelativeTo = ppSubReport6
        Stretch = True
        Transparent = True
        mmHeight = 21960
        mmLeft = 265
        mmTop = 200819
        mmWidth = 197644
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLine17: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 2117
          mmLeft = 530
          mmTop = 202407
          mmWidth = 196057
          BandType = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label31'
          AutoSize = False
          Caption = ' Remarks:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          mmHeight = 5556
          mmLeft = 529
          mmTop = 202936
          mmWidth = 196321
          BandType = 0
        end
        object ppLine18: TppLine
          UserName = 'Line7'
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 2117
          mmLeft = 530
          mmTop = 208492
          mmWidth = 196057
          BandType = 0
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo2'
          CharWrap = False
          DataField = 'TX_DESCR'
          DataPipeline = ppGeral1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppGeral1'
          mmHeight = 11377
          mmLeft = 1853
          mmTop = 209815
          mmWidth = 193940
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object ppSubReport8: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport5
        TraverseAllData = True
        DataPipelineName = 'ppDet1'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 160073
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport8: TppChildReport
          AutoStop = False
          DataPipeline = ppDet1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDet1'
          object ppTitleBand8: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppLabel30: TppLabel
              UserName = 'Label1'
              AutoSize = False
              Caption = 'Expenses abroad:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              mmHeight = 3900
              mmLeft = 3000
              mmTop = 0
              mmWidth = 42863
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText53: TppDBText
              UserName = 'DBText82'
              DataField = 'calcItem'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 794
              mmTop = 0
              mmWidth = 50800
              BandType = 4
            end
            object ppDBText100: TppDBText
              UserName = 'DBText83'
              DataField = 'MOEDA'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 54769
              mmTop = 0
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText101: TppDBText
              UserName = 'DBText84'
              DataField = 'COMPRA'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 75671
              mmTop = 0
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText102: TppDBText
              UserName = 'DBText85'
              DataField = 'MOEDA'
              DataPipeline = ppDet1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 111919
              mmTop = 0
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText105: TppDBText
              UserName = 'DBText801'
              DataField = 'VENDA'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 133086
              mmTop = 0
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText106: TppDBText
              UserName = 'DBText87'
              DataField = 'PROFIT_AG'
              DataPipeline = ppDet1
              DisplayFormat = '#0.,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDet1'
              mmHeight = 3900
              mmLeft = 173832
              mmTop = 0
              mmWidth = 21696
              BandType = 4
            end
          end
          object ppSummaryBand9: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2117
            mmPrintPosition = 0
          end
        end
      end
      object ppLabel31: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'Customer PO#'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 101336
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'ETA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 122502
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'ETS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 118269
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Vessel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 105569
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 'Pick Up Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 114036
        mmWidth = 42863
        BandType = 0
      end
      object ppDBText107: TppDBText
        UserName = 'DBText70'
        DataField = 'calcRefCli'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 101336
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText108: TppDBText
        UserName = 'DBText71'
        DataField = 'PICKUP'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 114036
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText109: TppDBText
        UserName = 'DBText72'
        DataField = 'NAVIO'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 105569
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText110: TppDBText
        UserName = 'DBText73'
        DataField = 'ETD'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 118269
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText111: TppDBText
        UserName = 'DBText74'
        DataField = 'ETA'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 122502
        mmWidth = 150813
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line101'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1323
        mmLeft = 529
        mmTop = 33867
        mmWidth = 195792
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line8'
        Pen.Width = 2
        Position = lpRight
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 188648
        mmLeft = 194469
        mmTop = 33867
        mmWidth = 2381
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line9'
        Pen.Width = 2
        Position = lpRight
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 189177
        mmLeft = 0
        mmTop = 33867
        mmWidth = 529
        BandType = 0
      end
      object ppDBText112: TppDBText
        UserName = 'DBText103'
        DataField = 'NM_CONTATO'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 4360
        mmLeft = 43656
        mmTop = 28575
        mmWidth = 150813
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0954474946496D616765143B000047494638396101035200F70000FFFFFFFFFF
          F7F7FFFFFFFFEFF7FFF7F7FFEDEFFFFFEEFFF7FFF7FFE6FFFFFFF7F7DAFFFFF7
          F7F7F7F7EEF7F6FFF0F7FFFFF5EEEFF8F4E6F8FFDBF7FFDAF6F8E6F3F6EEEFFF
          EFEDF8DCF0F6CEF3F9E7E7E7E7E4F9C5EFF7DAE8F1E5E5EFCEE6F2DBE0E3C4E6
          F0B4E9F3D9DBF0DED8FAC6E0EFC8DBE6D6D7E0D6D6D8BFDCEAB3DFF0B1DEE8C9
          D9DEBBD5E0A5D9E8CFCBE2C4CFD7B2D4E3BFCFDFCCCCCC9DD7E3B5CED3BDCDD2
          A4CEE1C5C4D6C1C2DE97CEDFB5C5CF99CCCCACC5D38BCDDCBCBED59EC7DBBEBD
          CF91C8D4ACBECCB6B7CCA0BBD1A8B7BF90BAD481BFCFB1AFDE7CBEDC9AB5C4AE
          ADD7B0ABC97EBAC3ACA9BE72B8C6A5A7CDA9A8B07CB1CE61B6E064B5D172B1D0
          8FAAC05AB5D6A1A3BC50B9D15BB3DF9FA1B690A6B44FB5E06BAEC174AABE82A6
          B57FA6C066ABCF63ABC659ADD29E99B79999CC9D9AAF5BAAC4959AB750ABD16A
          A5BE99999963A6BB52ABB95AA8BC829DAD4FA8C69294AC4FA6B78D8CB67394B0
          6699998090A65A9AB88F89AD8D8A9F7B8E9E7091A75995AB84869D8584A48486
          938582AD6C87987585907C7FAA7D7D975587A562829A747A947A78866D7A9356
          7F95617C914D7C986F71A4756F9575718867758563709C2A7BAD6C6B8D626F78
          536F9064698F566E83546D796666664B6A8263637F476A925664764B63765C5B
          8540648560588B5A586E5857793B607657558454566D3B5B7A42586E4D527249
          545C2F56765349881D598434536A4F47784B48594B45674C4186344969474553
          2E4B5D44436B294A69464358483C88483F7645444A1A4A7B473D79194A722F45
          530F4B7C1B486C104A7231435A423A690F4A6942377B4336854137732042681A
          42743A3B5A1B427C10437211436A18426A0F437A1F3E590941693A316A3A2E7A
          3333661C38543033521C384B333333372B730E396417366434304B342D591036
          5B1D323F1131671033482C28632D286A07355A10335229295B2B28532A294800
          33662428580631502A28332A2543112A491A283D202252082A4C05295A202140
          21204A0D2840211F2A07223D1C1B3D191A2E081E300A1B2719182021F9040007
          0000002C00000000010352000008FF0001081C4850A08083020A1624C0906180
          870F154A9C48B1A2C58B18336ADCC8B1A34782ED428A1C49B2A4C9932853AA5C
          C9B2A5CB973063CA9C49B3A6CD9B313FEADCC9B3A7CF9F40830ADD08B12082A3
          43932A5DCAD423CEA750A34A9D4AB5AAD5AB369B6ADDCAB5ABD7A004108A1500
          F1A859B35FD3AA5D3B11ABDBB770E3CA9D4B3725DBBB78F3EACD083140D8B107
          158ADD4BB8F0CFBA88132B5ECC38B1E1C790230FEDDB9760DFB106322794CCB9
          F3C0C6A0438B1E4D1AA5E7D3A8530BA40CA1E840050A1AFE1DACBA76DED2B873
          EBDE6DD5B6EFDF791908670091B644D80A802BF7CABBB9F3E7D04F2E9F4E3D29
          03C006264CC810E283F6070F109AFF855DBDFCD0E8E8D3AB176DBEBD7B8D080F
          1C9C100208122850BE7C41C25F870B15194C900042EF15F8D17A0826A8A05B06
          36E820000264668009477C91471A69ACA1E1866FBC91C6174E08B102070B18F0
          E089142DA8E28A2CCE84E28BD50510E10A60B89106165AE48845193C8E31461A
          700409871B6428414308140C98505F0534E91A8CD3B528E594548E0465504F16
          94E5953B292040064EC05105166BE458061956F8A0C30D37B8408310FC81C146
          1E79B081040D240E38DC0003508650005A72E959958416AAA0A088A2C6500B79
          54B1C5A358A431850A134820610298629A410A401C61059D70408127A6080DC7
          000107A41AD16AABE6B5255394B5FFCAD7AB3D196AEBADCF25BA14ADBAC26700
          10706081851754489AC1660DF03900430619B0C002DC0101461E7EB821840825
          4A9819431114D067AC69C52A2E654A8DCB2BABE30285EBBAEC92D6EBBB8F0990
          8010197AE1451963A82000020A40E0AFBF322294C00209307440072614C1861F
          A1E24970660020471EBA807A65EEC5150BF5ADB8155DAC6EBB20878C186795B9
          CAEBB9F06624AF0E370A9B06121308801C9F3266B65D082288900105A91E9440
          062B20E1861F5FE8C04102E009971C000EA0CBC0570D44DDC075638527807028
          7FE48071C43590B14419533D9C404FF324F2D9683368B1AC14817B97DB5AB29D
          32473392212C166420B180CC5E5EFF1A820E534CA1DF175020E1030D3A138C29
          073A80D1471F4B7C1021810445BD74577C4208D8602507659C400D5144F55804
          99BA53DAA8A70E5557E45E047752ADC71DFB40B3CFBD51581958D1321C4E9428
          DC4199B9F0451A3CF258AF171A5621440C1D3CE0EC02311C6147267D5C714518
          D85FD185111130FB55711F74217E1757882186F82C0090F546171841BEF5F06F
          FF00715F2B540117E3E71F8811649BADFAFF008409EBD64731B96109659D939D
          ED7692001D90810A5420C317329099A31C04036C0896BD8855051EC9410E18A2
          13188E7003123DEB08F4A0873B56C8C27E80A20264A99F56C6D6057DA430852B
          C4473FA490141064431FE860A13BFFE2D18F4F584D8600281B1FF0C14474E883
          1CF8F04730827098005AF18AD299615FCA76018138C00302F180039A5636AC35
          4029C2C948D914B246859C11005E232097C402110384000C8FA2821B44600006
          C006010230011BD290232F6CE14C5010820E80D0A929B8E10D74A0C37EB03505
          742CE392CB18C630A2810E3E1CC4805A89501FE8118D5246E319CF08C7346090
          14194C6319D180862CA1B18C787892721281C1345EB90C680C231CF868C40792
          D8C60361F198C7EC0AFD4677823D9082082F7801114881861320C0015D2CA65A
          9AC6C6A73D8D9B4C23631A6B673BCA18200140488321D3208404780B02023101
          18AA60AF2D7C480449D28C00E8E3FF021F7C616870F08123A8814A6644831808
          0DC71588E9BDAD8CB169120045387CE10B8412031AE180450724B2B91826105D
          025842389EE10B6998541ACC40C74201309B81500D039C60874581110E72D821
          6681A91532771A40651264037BF8C63BE6108840ECC1107BE0872EF690CD3426
          F127DAB44CAC8A0911A78E200B667882569FB001B291736E1069000132130232
          94810A65982001A2769D0FB0A10CF6C2DB0AB2D5D008FD4C053A80821B5E6151
          4DA2F219D01003050C4000A74E049418010C5A30000B6F30E319C7882C30D091
          09037CB2209BA3DFAB8AD3877030E3B38F7DC639D021036216246A0789033922
          7B0C4E4EA30B12120CDF38C2D3DAFFAA2E2D63FCC12CF8A1872CC0E30F86B047
          130CC10F59BCA08B5B6963BA0612C7376EC00CA5B80738AA010E70DCA3142FE8
          9F1C05E5A708E9200F2ED341020E1080A82D0009EABCD71828A82D6661260340
          00C65F81018C6880966834A0C05164632AE1286B0012830D12D5873140B12018
          CBF82C318E418CC9DEB2C05B346C41F864004DE8231CE1408786D1818F608031
          6A10F92F006C200F7C90E3C4E428C610C8363683E494B6B68DF1D992FB90A759
          A0139560421D72B00A7E18E20FFB98450EEAF0834E44C2024D01A744401C8034
          76AD624F98853AD4518D6A20431958AE46287E6096ED72F73202A0C014EC8637
          110C68001148800BD2F0A82D8C41FF720891CD59901203584A03A19A6446373C
          A10227DC210C29B0D4B61AF25F9AD16EB902613243C642000018411B09563031
          BA118E2578545C0D251B1D8B43E003ECA008A01E82A845BD030640A0D0CA120E
          0C8C20EA1A0CC108231008722813BA8EC8F8D6204BCB1FD6710F5CE420075998
          03118800882C9080C7F6B0C71C9832460078E00539F8C10B36F050D34AC4037A
          90AE327E410B64208316B470C52FEE110B227013B1B6BB9C1DDFBA8535288182
          7C3A4006905086478D21069B6169ADF9459E2E60C3BECC982534A871084CC5A0
          463E60AF650F9DB107C010301F6D963E11C20772441AB4D1C046690140B32C19
          40022097C003C076E8CF31576A04FF5096C4B565228208B82FB58631AE676EAB
          A614F305CD983238A2B08A55E498099528C52A98A08E66644317B1F6C9160982
          834E80C318C600C72C2A9105310AE402CFCEC21EE6D0841754621ED5E83632AC
          016E7157231DE5B8C728BABA408D30C0003720C31AB620071A148C21065001BB
          D37084090C44368D16486B04C0077460BC94C4A08627022D010E54C10F763842
          0C52908212C0000463344009AE30884C80A21171A881A0AFD697311EC4044BE0
          432632D1083C0CE1E18D4087268761525F742317C304B3003A50832EF4A111AB
          0F3E1EE230041684A7BF0FA9800996BF7CCAA7A0051568C8A03F5E822584A10F
          9CE0C425B2DF073B5CA10582EE23FFD6FC127899D3FCFC54EA4AA3F7708F74A4
          031367980738F6518842EC63CA5108C594D5B1EC24A29B234D8303B3700FE680
          0CDC708053A60B4FE0014D270BA4D00910D809B1D00ED6600DC9900CBB800CAE
          F0088F700DD78065CA100B1B80146D7711C9210147C0665B40062A60000F854E
          64E606FAD26580D710099009E7005A06E50BD1100E8C803D22C0019E400DDDD0
          0D9AB40CD3A00D8320001FD007D3400F1B860EF4E083262000151031B0617A26
          B008B9008551880EA0D00309200AE1604A26954AA92001EAF34612D00276000B
          D880432B9461F15087D8300DA0300496751069D405DAA00DD3100CC1900BB9B0
          4BFCC31082F60171C009D3100E42FFB442E71089E7100EA96007C77210B01173
          1B817E9C38251F11711331000DF000A5900ED7300F825008EDE07EA9A80ED625
          0882205DEAD0094DA3721BA14D65E3001B100AFBC00DBB708117880CBC000EDF
          600BF0200B5D874D0EF003AE600E18E86DAE100B90400275500ED69081B15009
          1680644F558215F17619300569502C53C00162410150308E7400331D25000DC1
          58DDA083A5E40DB9D0033C70076E3005CC300E01374BE1400F621002A9E00E65
          180DF4455FDD700EA66002061001C521003DD00AF4D00DD1E00C16E90CD1E00D
          F4900B53E00B02070D28850E8D80895E520178B00CEE700EB3445FA5347BD150
          84F4A00D7CA086497410833091DDFF800DE1204BE8A00D32E08E1190194B3090
          EED00DD04091A6140D158550D0700EEEB0907C088A17D18954B9229F088A0FC1
          4DC9120023D00CF3F0956A8009F7D00EF40708FB700FF78009738096F7D00C49
          97390C376051F554179008E0600ECE980CB46081BBA00CC6200B96F00F917016
          1E5009CA7081D6208CD2A80739100BE57081BF600C75E08D6A04001120002190
          8E559007EC28000D20002A400672400570000409A0190A111626900BD170529F
          D583A9800109B0024E700815A9839F050D87D00A2AE90B24E59BF3850F4B1801
          C40491D3E00EF4250D14557BD1300CDE804ABEC05AC7200D93150704D101A030
          9124F50CC07094E7E00D18265FDBFF3959F1B0524F23019CD00DC2200C07595F
          1A251B5D2085ED090CDDE0853B695117050DF4000A181095FFD7165519A008D2
          1303E6553536028060080A2A035990088560084D40040E6A086A900389600880
          0008D4A61373D904EB700DDFC60BB130A2BC1075EB200B68900F8A30100E0008
          567681B4700DA7F00490A0077AA00ECAB00BD6C00BBCC06547F19F0B642A0920
          026655057C370107D0240BE0026560A46CB002A4321143F06F277590DD700948
          031E71C00E27459D7FF50CD4700CB2249ED0C99DD3000BFDF93B32700BE8000C
          08B59EEB490D92F80C17B96091250DC3800E3D30100F2009FA70719FD50D9558
          0476D00AD400A7C2F00C799A0A57FFF8341F900B878AA8A25559101104E23051
          A1F50CDD300D88B0044B7009E1300CB3A449D3400E2B463108607E02BAAAB9D2
          11D5E63A4561017BA00719CAA0F55708394004B71A053280077390A05DA56495
          E952633302A8A00EBF600DAE700675500995600CDF000FFFB00D96B00D3CF434
          4D0075BF980CD5500A39E0002F0009B3000EBF7081A7A0A1C24A9913A1590910
          9AF59607A6992A07A0667940066FF00521B02F08D024CCF23471E059AEF959E1
          D00757E3AFE7F057F89978D410A60455A6A0050DB70002701401E8297BC3F0A6
          EC190EB730085D8008059994B9B90C2630103D004418360E284B0FA650029B51
          04DE60907D150E225B932D300D0FFF3B4BE760079E19001AC00AFD80B2E3C00E
          DDE00EE8606907D101A9100EDD294B09D507FE57A053C9AA52EB1C1E91AE1321
          1B4CD39568D90E67100A5F390FF5370FED700FA150086C890B233016AF433186
          551444000E5876653E3A07DFC00FFFF00ED31A08C4090023500AD550AE19580D
          4D30103F600C55860CD998749AA5AE87051169460363F0286E205EF23A2F4202
          06212010FC2A168DD00D012BB057E08E61D108F5C00C7E059DB2E408D572087F
          859BB424B19F5904E760849A7452E1900B7A0800123008E8207091D60DAD8001
          EA13529C80088D8008C88B088C5003FA0600AB19AA17CB94DE505A61B10486F7
          59B3D79496C627202009C79BBC88FF90095DC0874FD307EE100DACB59EE78008
          A4F7102FA611531BBFBBE111C8C54D5BF3BE2C3A1016500AEA708AB0780FD7D0
          0EB0380F015C7F22D109DCD811B9B81A6F940386BB0BBB600EDA4802CDC00FF9
          70C1FFB0091A404C7AD00CB400C1BB500D75C04D276008A5800BB8F00BA78006
          71791138300789100A321C0A73B08012F1C273100438B0C33CDCC33BCC057330
          07380000415CC4417C02177101465CC45C511C03C332C24207F9555E0E40013E
          400664102AE6F82F101351CFD9BA9FB50C7B8A77A6700EC0894AF4E50E623001
          37801FBE400DB81970B920B132D208C8399F9345B002307243D0A6C0809BE370
          094D03010450012CC77208D10397FF44A69BB40CA5751085075AD91B0EF8962C
          000031988510D97109E7000CAC8550E7100724A913F25BCAA5D11138705419BA
          CA7FD0CAADBCCAB06C0663B407F6000EE5700A51B00EEBB00F809008FBB00EE9
          907FEEB70E7F70106800CBB00C8BCA0CCB45A55C0F810016E098B4900CD6600C
          660009168CC19B2005691404B3A00CD30CC1A34002021104BD000FF0A00E225A
          09483C7E88A5C401DC0ED720C3AB3012EC5C105C10134F0000A1800B24510917
          310724810BA130400190190B700337A20574C00309401E0B4003E0F506509001
          B00101A9020020500BCBF0A50609BC25C05200D001B9D00D644A5FE7900B29E0
          2C2B3005AD00703A080DC10B288FFF6AD2F4050D9F458F231B35005003D3A094
          BEA083E350088207015623001A60034B70057630088BF0D48B200A2F6B902C19
          0EA220BC119209E8909406190EC15BB0A3B37B3B703D7C00D5C84B51A82459D0
          50B482773AA6FCD6A0D11116400AFC600F6C79D7788D96E9300FC6106B28A00B
          FD7B0D5CC00AAB80094DD0049DB00AB8C004B8908048EC01DFA0CB79FDB55F89
          96C9C60F9BC0465E0409200AC1D4956C78FB0E6DA00111E10095F0B7206C0C4F
          804D52B00DBD400AEB000FA8B0652E259527E0CFEDB00A54341017F004F1DC0E
          5CC074B90D08459C082341DC419C08FE3CC40261DC2301461581DB219108E1F2
          10E0A16684A4056F0004FA4AB140FF1049EB384C96499C3BB04B3AA849E1C009
          1280103BF06F30DD8FA2E0042AB03729B00CDEA04991B59EDDC009F303007D3C
          A6DDF9599465227C22002D800DCC7091CEF0589586855E82014B6009AA700B18
          560F16EE0DDE80B2802AE097801012000B9EF59A4AE90EEA7D35C4F900351007
          A0000BCB2089923885DD405176BA49D3C0BCEAE3D632110A4F000330F00489F0
          DB38B10A80F01642FE0441E0128960C4A19018426E13345CDCCD710D7300E44F
          51E4479E151DE10181300BA5100A5D2EC3A5700A621E0AA7E0E567070E4D7010
          7A300FE5500E393002677006B99A055DF703D9906C7AC0344D600FEA600CA5F0
          E77F2EE6821E0AABD009A4C00A81FF700173E9004FF0A2C9800CC6B00E76DB0B
          6D4060804204C6F00B20CC0BB8B0078A30038AF00E8AD00B17AC0B4DD0345229
          102710CFAB805C057101D2DD7F008003EDC0DC0241EB2281CFED80C40221D023
          41DD14F1042421EB063D1070070739220740F0006BD50006C0036F9023561002
          84D568FE564A92FC4B88B087007005BD8BD30F4B0D79F04FE29502538D78A0AC
          B309D105EE70C6CF20E078C052FE0200D6CB0C26B5E001170E351043100987D8
          800EF1A8E0CE300EA8044B5F9AA7047B992660DFC3F0A5C0400F8B70100A9F09
          D880B224A59C25250D9108D415254BCE090BE2ED3FFA7C02F5DC0EEC3CE450C1
          4A4B8E15ABB06CC2EE12D7000027FF20158970012A21DDEDA0F2370146548E12
          1EA818CBE6EB51D1F200F0F235D111E5E56C4410054CD0F44EDFF44910F54970
          0AE5300FA5D0451B8009A390046AF003B8C0CB86106439A006D36409DB18CDFD
          7B0A4FBFF649C0F44CF00448266105E101AB500DCF180B9DF00DDF6004A99AF4
          1600099A0EC1B4800B66400A8AA00152A00896F00EF970B7FB6CE9050AEB2171
          0DAEAE10B81E12CC4DEB0571F9EDB0F99D3F1002FDDB944F11AB00E4C4DEC4B1
          22002B90216E760414D0240570002B3006F652052E801037D9F01E1D0EB01578
          BCBBB40F0B0C39E306792004606094A6045A0D2E108360C667085AD8B004C4F4
          348597F128C50CD4700B232B1057FF100EDDF0EE144551E3A04A84D80AB3079D
          CCB00CD16F9902E0B249299EE8D005065102AAF0A7025F84A19A0BE6EFEECD19
          0EA0409300A100C04082050D1E04D04EE142860D1926BA708D61A8500E2D5EB4
          B80A10468E1D2F860230C763430030469E6C97C843458C41122ED48892238C97
          1EE75C60295367C76B7324EEF40852245086088D126C108081854EFB9AA54B77
          0DEA35AAD7CA95339735DD9E81167ECCE21728CB3E4080D44579646F168E0B0E
          1CD4990755EEDCAA50C1EDEBB4C1C1518268D42143564D900545AC50EC4D0AE0
          452C64BB1C57AB74A28D1445BD36BDFBF7EFDD3B457B037CE6BB512120BE0072
          E21AE8618E411C450BAA2E2872A8FFC2D5085BCF6E57BBF46EDE063FFF8610C0
          80882A72AAE47192E140010206545459B3C64D8C04092E79EBF64CFB3360D1C2
          F5104000C0034EE1801D63969E59B4561C168880024714356AD0862DC3BF0C5B
          8B81023475F325C000D3F3660901046000800A5409C71769D463861D53283890
          855CD879451A0DA501E69C56BA18A285108098269A68B4F3859965A691010002
          0408231C134D540F1B220692E0127D7261C6191FF1C3669121762881034F00DC
          4EBB70063910B4DE10022A089318C20517A2AEC4B221A1742A294B862AC1ED22
          004EF0D2229A4EA2E9A732D76473CB2C9F44AA81814EE8241B3BABC2F31A65B8
          C9AA9D669E38F08240BE81878B44FF0CF9031233D669668F071E10200BABCCA9
          A69A3CAB02C79866B2E96484DD186060834AAA516614122C18010D45A4706B2F
          3DAAA12519C794C902802036C9271FCD7A7927D74D34E02DA2854E28ED098688
          B5CDB5A344C2619585AEB900A150A065483738AF1DE8B7000AFA8D80174370E2
          8D2AE0988203030C4890032BE420830C21566805C00D39EC661913C203608354
          BA39E6180D5544871309CE0D418857A8D98EC66872E9A03F50C241713B66BCB9
          E25C030058029D6888E19846761039178044E871501814CF112585030FCC7846
          ED8699E6960F5C340091739EE198635FBC2906D921E831513B6060D6C6400106
          C2009665D283A66968BAE9A2C96DFFB1250828183CE0081740E6C8A91D5C2A49
          29118A28B272158A9C6DE79A4AAC5C28913900613B6DB7E166E81AB7B9C66895
          B7130989CAADBB2669CA8BC09C03ED2FDF5653218A1622BC929FBA7C76ED87DE
          8E5B6FBA2F3A13A669DDEE3A7398E698236EAFC14E241185CCB61B6F862C175D
          A1B9E35E9C71D00D97BB1DCB134F1DEC85DCC412DB019202F582209EC8220A26
          8E3F3E0AE59938C31875D4C9E689BD00182110528C7821082248D9038495D1C8
          E61A4ACF50BE7CF3A3C8E28920F602D5496E3F630081C58C3943FE447098837B
          0FF23D45195A1C4386A9A4B00D56F0EA1FB6A8CC3FF2C18A04ED2608CA3ACA05
          AA6594D62CA434CC32D642AC35A7FF94D4243754A39AB644281C747D86024EA0
          031554A8020304000204C8800FD290863180A115379B9734BA910A0C10404E32
          584634FA250C61A8281E7F004003925282548CC347FDEA17354421018268A241
          2982503810318173C90016E60106319CC68C7A5C2135CDF0063034040CED7403
          08028840823A500B740C6318DB19063640510100044002A2E8063004C9465F9C
          4315FB03C020CEC1C69C1D2360161B081EB4811F68E48C18DD18C24014201010
          7A1025AB8181E41A328713840222C60A854B60B01A2E54225A8928DB134EB00A
          5C3C612068AB44102A91CA0CAA446C41B880E96C273C537A4034540A02204251
          9BD990D29417C8A04320E79055A8FF669900E0024C3C9008575E000630580517
          A2B5916B9CE00495A8040C82104E00783394B604002E75C9CBB405819B27B800
          ED1892B944108B0B5C2065DF7A12AD6F26E21AC3BBA6E952591256F6139B0025
          D6500E7ACF7C326E9EC36B873801209A6A728D955EE3C2402AF1CF76FE24114F
          B866347977256CFD464E0351842C6441CB2AD5B4A6E000C7F3D6F187FDB54A03
          07D200B006320243D84921E558054D71B18A59307516B3B04520DC1280A44CED
          7DBF410002CCD00C229020074C00442974D109E9458117B44046AC7E51070BB4
          41112890022B58A108526CC3571A709F5166B30ADEA8A91214842042980580B8
          A1C620A6DBDF043BB9D8829C8B00FF9F1100058400873294610C2E6861000430
          011D7C210D5B280325A8C10E68F8423BE77044029408802284C38EC3D050D3C8
          B1843E0E600026A8457602E4B47330490059E5431DB7C3C6363A420C7DF86234
          06090CFB0C231C9904400FA6A15B6AE8AC1B62589909AE138DF4E42C1AE820C4
          720A80815C549218C700868FEA9109066CAB11EEC8D07A4C140E5170F15C5D98
          4689A261DA670CA31BB9A009A81A0842A05C832604119EB3F8F613D2A0AD9DA1
          5885E9422ACC76A0742199FBAB9A44821A0A7B40582ED91DE070718163926628
          0B1E4D3C2D32CD8678209AB664898B537CCCD554843439190A8B310C000DB723
          14A2414D341BE239904C095A1254FF88E764B910605A102711F631E48EAC3820
          03208319D6206D4CA310192B04C649DEF20745F3402F1356717D7B13D5061C01
          18B0621DF780739CEDA18E79D4B91DE5A0CA3C56F104BD00A0814911C006CE10
          8BB8444521FDD8479C156D0F7B74E20416C8565EFBA82D04EF8114B838051346
          718D3390A0128F78042FFC87D65F302111DF78072B6670022904A10DB2C81529
          A6579A9C806437B506AC05F9325821C333351DF4E006190BC2956D52019B9D6C
          1ACAE0062048400007384002560085CA52210F07A34677DCD10701D816007670
          4777A2115B68A0A3064D02C010B0316E0DCD081D71180802D24D8E8D593267E7
          E8063AD011484BDAC71BCB60C140FF8620DC003D2340DD680522E2D08756004D
          3D392B771700C09C16784343E7550F3BF0D0470164E21C0392AF891C61073B64
          021BE1488F83A4D1DF7080225A7E66EC9570F1E339D0046B27109C9BC6442529
          0BAE1D99C3B943423A41D3D1041089634848D5E4A6A09F394C0A6131E3C21C65
          63F17528BCABF1079FD03A1DBFA4E919E19BCFF75913DE792E73D740F30759B2
          F3DDA5DD73A70BBB42BE3EC18AFC15D7192472DAD3160A9AB064A544592CA806
          024D3DD4C1F08747FC24AC421575AC8314882C880648718F3B5F251D98A8831A
          10BFF9266C60205395F467AA0A80E939C010E0A8C62FAA318A0D2C061CCA80FD
          2F643F8A52D82333F9E8852214B1FF8D77F0FE1B9D80F4ADDB2EFC33274BD7CB
          6A070E0652D8822076208A1D76F48DED0003489B0CC671831338509D041840B2
          6E480315B6400961506319E830E3670C70898F639169B9F8C0B912D485780043
          40BEE8C6C48C40FA0B08000397083741DA0E0171AE65480568102462F005FB60
          0F0C00000130815C702D3B6286EDE8867008077A4087FCE8AE8EC18621589925
          A80707C9191FE906DADA16442099FBCB1977380774888778488556582E410A87
          4620880123B03281B176FA26182016618A3A5B52300AFBB99788BA239C88BE09
          85973B012E40BAB7D339770242915931B1D3B2AEE91290B83215CBC2B4412417
          73309FCB9C24BC8627109EB83313FFB273BB9AC81C90F0801FF4B0315CC2D938
          3B34B427C84942B5E3430B9A92BC1B8AC8F0002EF8B2287BBA9D602C011B8827
          C004412884428084425884472C8453880AC65B074578B98270804898B3C5BB86
          5178044A244548348383F88D8368AF11B29566C8146348020B800470E0054848
          0241700563D0C57DC8955CC98C5FCC876FF88639C081209037BEC035E28B32E3
          83BA5D4BBE45640878C21ABE793E0D8ABE6B34363F6380E1A8023A1817377081
          0540170690B62F900315A2835778C116692FF272876EE8066FC0C070D0075898
          80EE3B1049D0877038877E94917A88867B41906D0C014EA08770302F62602E68
          70876958023BD8C779C4407AB884FF8B399738D8C7D71A060464AE7E443F3B38
          C879EC067770071B589945D0877118877E3C8771A8077468916D49815C0048EE
          121085F40E7AE0841BC885909C477DC0C16B5C1390283231113B2E6C0732BB30
          24249321E3B1B6130DB5E182FD1132256CBB1CC3C22B6C08AA580DDD813A329B
          C37212B2AC539C80C29A76E83AA86BCA68F4C23DB44A435CCAB8844BADBC4AB9
          2442A89B12B61BA52DEBCAA2203340F41A5BF9C2B9EC9DC5FA8D04C101B0D807
          75B807466334CA5B08385384FD69A001DBA66FB88774A8B33A4BB4384BB47DD0
          85174045AB3208E1398C8148900D58057858875960822430065CD08311389542
          88054840856FE0077EE8455DE9C5FFDF03846630064868821F6882404003C813
          A985302C5AB34666444B6754BE9262CE81D888E90CB66BBCC6C34C1003C80024
          80832A480338D08109184803E0002450362518835710050C308008000010D084
          54B0CFFB04855BE083EA38900A9004553085FBCC855610054770B604210068FB
          8041280674204992448769E0841610003EA8050035850C35055880375031000C
          E8836988C11125C973880651280201E8820BC5D00C0585806B8007580455B04F
          0DDD504D008124620001A88154D0B707855074E05009F80055685153000558A8
          15A1DC89A75389762016A4C34B87F03030714AB93333A26B1B33CB09B413BB90
          F24A13C352299526B15326A45408FF0E4BD320884323E4C3AE219629954B62E1
          3AC1714BC00433B944BBB50C9C3A94CB69821C3A7588AC43D3C01426C0244BB2
          FC3BA0602C6D019513F80352400552E8844F20055228854C2D05525004228896
          047100AAA2AA04F18026E8844ED0D44D3D55543D55434016F1E08D1378AA2778
          811770000BD80040200578E0075D980552780104C8815020013328851C380122
          980348D8147870567B58877550075E7085AB781E70C80678E80C83C08DBE5A08
          5F638DC03A88C11A08DC00A66BB0B56AD432ED1C366F792C6D49001D70832AA8
          0237400273C9AAC8BA0130C80315A2021110C7E0B9800BA8808235D84779D700
          A8000A6058866D813000D873A12AFF25120F0778812EE8838C1D843890818B69
          A78135D89075D703310019B8023E40593E18843E088318304F016800820DD982
          EDB6A4F08082C5000C985902180008808003C1802540D94148D93818820E3890
          4799599AD54EA0281C2A598976F8AB6C5208AA905386200D0F681D7E12CC34F5
          9A0B584B18A05AAAB51D2B5CC21390888342B3A97D1629F5D286080289C027B6
          21A5B6119641E5CB9FB8862E0300ACF909AE554A2BE95B2DCBCAB72C3B3734B3
          6B0053E6F4433FCD53B43C4B50729DAEF59AC19C5BDA085B36940D2B5C0562F1
          3BBD033CC6B2ADAAD22C01B0805B3DDD56495DF669AFACA2B401B38047791406
          2858B7B080E013301DBCAAA1FA86FF7DC0296308854A28855800842C90057EF8
          0654088439C881117000266886B5508C1CA80470A80433F883A7E2055EE0066E
          000CC0C0055440034F3108A54CCAD2384B85D8C4703D3EBD7AC6C15B3A7255D7
          0F62D7C572D784752100903628488371210315809407008003289834588332F8
          02210881A32108582D080510A19521591E70031AC8807351A2D1E50BC1E30BC8
          92E09519088B31806E1B80A350A2976A606E6980DF4161A3B85F07AEDFAAD909
          9558A539501FC3B9895522441F73890B089DBAA15C908A9620A88890D261616A
          C213A839B2F500D598CA4384086F52A6BE1D8A1C9E831D76089AA04218889634
          C5271B86010DB332D0011D2BB989FF3139A90B002817FB095B3A8175D22822CE
          288632943966E3760A935008295B291D97506230E3022BE19B385C85331C6380
          E2613C16643F1E0A9A08E490BA631F560823BE62D39983FD3901D3C1852F7E82
          30F69A33E6828A00894C1E313E5E0D224E0497508D34334CDBFA9DD21500013E
          88D29BB401D341D9253DD4EC0F095E61DB92B4489B9A17C085ABB88A76A886AB
          C0040B780158CB075D4005545003122001638885117881503805EB7D8111D800
          48A89464006770460657D0E3A3881B6A3C8A6842E783A8A066443EECD4BB6BE0
          AB8280BE18869395796102F0D917F24E24708376210320C88004F01601480015
          B082197203308801F80C0F771D21FF6DB9DF0688000A08833C808215480001D8
          A4541C4D11BA2AF7F96001F88D95090057B62D02008140A08987CEE7FB958240
          C85198CBE5CF73801990696D498A0680617695398A705BA066939E7802A4136A
          2A899D8B40D7D67996A3060AB3111DBB8181B1218DAC44D7696908B3C188AB5E
          1DC0F19299539399F36A99D06A8BE06A8E806A94586A3691A661A3AA01288008
          88E93FF883F5F10CD2438340D0EB20582D2BD33D4338144340943FD03DBC9293
          41A4EB3FB81190FEE88198E67BC00A6EB0066B40AB6A50030408825C4185D313
          0C26E00541D02AD48304AF32040B4802D8DB8570FE0557188526A8E98320DB76
          50CE83409BBD3D8A768ECE777E8DFF8600D7ECB4E76B3C90088800A590801B60
          036593832FA001F3B4980C30EE3C184F28B0E0119660DF10A1949636F04B0321
          70C08170576056C42789E8F176A974F387A8F9E00318E90AB00442809458CEE5
          1D20840A381023D806930CEE03118F0F6E5AB6F6EF86C8A5AAFCEF01B7C6C479
          3B0247F00457F005D74E7745057B803334400A0068827570D67DF8AB02489048
          E08768D5CC79781E469385E0738026483475D807450080E1666C82F0E8170007
          C82E07C94E066B480665888526E8C47F988551803D65F80565288424A85E48D8
          E6200882479B046E086757C004239F35A348468420DBDE360821BBA0F725080A
          6B4E195ED7DF662C83EE3E170A8EFFE1500239D0022D800321D8BE9079801090
          213AA0833780821B80CF7301E190F6D96D9C0032D0022CC8832B1060B790D8CF
          1859FEDE8D0CF6E511FA60E1B60171E8820458024B00854530491620844FE083
          2EA80116C8841E90F44CF8044580810A00857E588438F8001320849C8D034DD0
          8436E8800718024BB0F51D60E0E85B7036F91AF3DD75B63E700FE0D35F27F662
          37768FB8C6060201578C0AE56300DB62804E50079C2A8752B800AAD20059D887
          79B833AA808A75B08748700B00B08052500789508752906560E60B0B081DA830
          07D9FB055A50865940852CC0015D680657400670B6065728844AB08766E80443
          40055B40854A680248F01F578885FF52909EE9F1E8D2341C8880ED6FCDF28558
          DF83D80897D8ED492ECD7A06F3C5921AA538170AD8D779350E1DC8008E3EB609
          70012598A134608329008210A80EEA060057969A3D1F181D880E6BBB013C3F90
          4DFAEE5D3E1084E869EBF660934E451B90872568017CD0865BC0875B300049F0
          875BB8857E188416E8873888017A48854B888741F8806050FB60680123C00713
          88837ED08660F0873898005508864C100750A022263DF69D38C375FAFB35E19B
          D940437D1AFCC457FC04675707F80170800A5CF00001230023B08AABA01410F8
          0C1050844EA88453C033AAA88444B0045F7B8273276663205F38718011E00248
          E8048A1805DA438548D803559905FF5EF07764D85E78D88CDD84D66640275D8C
          854840031498B4162FCD63BA064008021CC0012E401B5C8067767E02DA392964
          29081CD83ADB91A582A8086821080FC08163F2FEEA1FF9C00395039180127002
          37A8AC32B0029559FFCD72812900683860032110012E2AF992078800110418B8
          B166CB9631603E0810C080810200062602A848E022818A1A015CDCE87163C390
          02020468C000000C7143C2E8BB2161D0340CC1384D58816E500B7C7162A01325
          6A991D0171B0A5A060E08AB8108DA685A0D067C9844BB732DD9AD6E123D6AC1F
          DB71EDEAF52BD8B062C7922D6BF62CDAB46A139DF000E304175C6AE7D2AD6BF7
          2EDEBC75B5F2CD7A52CDBC6BED42FF3900F09041A7C0CAAA996B478423010792
          CFA4E38A493266001648DDBB86AC5ABA6C3FFAF275B061448E1C2F82B4BD8002
          4D2763C892D136668F1FBF7FF6667D6B562A87A0557F826C40008024F200A43D
          005A05F65AA520A4C786DAFAB5BA461CED006D9C339634F8F0E2B38AAC608002
          902F70AAA471E32343C3870626D02023470B1C385F90B8082141A400171550C0
          01092470441954209407100918C60002084C6440450A288011561D8DA7514832
          6853C415F80041012231C1024B0C40D0D3470CF1C41195288EE4020B06616013
          C3203D14A1CD0799E4F2C10783145183368DC471CB2D1F6CC8975E4D3AF92494
          514A3925955556B9A4560D001049FF60F324E200012705B14E3BD7D411CB35F7
          EC61D84680DCA38E3A866C741211EBACD38C20BCA4B30E174B0EF0675F0E6451
          0D37B429734A259D34338B1E829C524D281B58600196599D8003A61E54BA6945
          385CC029A8A162255204114C14021279A451851C55C430C1010D0C4040021CE8
          C05E1A64C0E1061847DC10C204124C38D1020BB800C518086D51051B4A0260A1
          64143DABC000CA7D841C9622EDE04F1729E0A3CD34F8A862001EE8D0330C3A76
          D4E04F1C296893CB25E88C7B853EDAF8B3C410FEB0D0453FD804C36D0DE236A2
          0D8FA2566425C2092BBC30C30D3B4C97C10504F04029E9EC890647003850C93D
          E0C442825CF7445298460F7462E7FF3A7354D480720EA0626728249C02A72199
          8157C09F39577492465A02C0853AC8EC920C37A330D144259008A20C2FC6C4BC
          33CF064B3D35D55593476A041719B0C00D5FA4A185166F40B14202184D94C1B1
          5FB84106DB6458A1841034AC30B7082EF8A07615CA6E91470C068479D2031818
          101F03D5568D110884D42041179948B2080C0F2C91C915574CD3480573C02041
          1C8B780E83001EF061C91F15C060890718E02189247B6080C11F961082071F57
          19FC30EEB9EBBE3BEFBD77252A72231863713636B0490438F3CCA3860098BC89
          CA062B6B360B9CEAFC403800446493CD3ACC8772CF3D9F58D090B57C2587ED47
          3CBF20DB6CBBFC12CB19A398A38CFF32EF77123DFA56EBBF3FFF9C867418030C
          C0011FA4E13E69488310389080F84864022938827AD2A0A0355030576D234319
          CA50052C78A18369B841020EA3B11DD84058062815691E8295F3B130000F0190
          482C218F4670021F5DD0C84904804300E8F038C8891A0F070220A9F9AE88463C
          221293F89D509144003FB84639CAD10C1084A412F348072E46F00040A8031CCD
          18C14646D00C755C431D26D888053AC1955590E00195B0D817C9079E16B2AC7C
          1AD9402C0A65286530417EB4F9CC9A18401220F6AF90863CA447426221053464
          012B70C201C720491D70C06F04B090001210021D40410E725803D8B020CA0C96
          41591CF40216E000C2031CC03002FF18411CAEA0C009F90505548461480850AA
          0060E4222C14C9614E40084D68620E15D0C8451C700210F8902439CB19005FD8
          100DA0200244542236B3A9CD6D5289894D544339B8618E52500A003F00473BB0
          28084184229DD6AB90027030462C92A08700084236A2680C3DE8211616B39E1C
          39153592000010E548C62E90810C5E3C4219D64886355C118B26B0694E1A391F
          2233AA51AB31A02113B88118D890AC347C81061970100F09B2000ED80D57075C
          551514B4AC0D8AD20D2B9808461AD2833E38E106277D404376080010D862130F
          00C05179383E165C4500420C4952FDA2C2860C2EA81AA9802C5091B58DD4B17C
          2ADC481BDE31836B72B3AC663D2BFF5AC132B547CC831BED30444812B18F6AA4
          097C9D4913C634F28475240F13D1AB88033AD19976A8631FD54B9319EC2935E5
          BC8017D5D8454291C10D3D26E31795F86B453D82D18D72B6B3A21240068EC0B6
          0CA6010A2635D0094B65800464600542000318DCE086036670B4ED1102051CC2
          8001F19003B1750312545055187AA0750FE8C0036060830A080006C1A85D0704
          2001180C4106181040073A00031854200220B080729D8ADD1EF4E00313A9800C
          76C0020948800F7C606F7A97FB800A64D7062C98100876B083E8F2C11F3B206B
          5A032CE001FB4E6A16280538C0A18E2C34447B09F66233229CE07B54A2302799
          43C728BC11227C034EE0D04584B7FF07A791E9CF015CB8863268411B6E3C3419
          AEE04513228400827AB6C636DED0220900200530A0400B108112D84685329496
          069504202FA58B8112DC40085070031CC8A036374CC105B98508B50610C00920
          61557000430B7089DD4FE0E1039F504536E451BB4FE8A318C590440524218E62
          6863102F518536E4910513A80214E29007211EB003374FE3163DA88026F0810F
          71F061028D68C404F8200E4567A2034308862AE2118F2508A00BC10886364031
          8138E0C378B72330AA53AD6A846D2A391519C137F6010F788C26029BB007F8F4
          F0825D07618CF740C50358C68048EC037C8104C0053A31EB7DCC61042F18C10F
          74B10F7BC8C202249BDA491C0089FF74CC06A2E640062D626188E24488C6373E
          37BA37F410AD39D2096BAB02ABD2E003112CA021167A0050A93A810C70A0DF1C
          C8C0041608208C24C005182C0319C09081130EB22120D046263E408E6274C1CF
          325882363811871AA4801C9C008228BC518244E3E116AA68813860D1854FC8E3
          0345C88523EC800E3CE484134B50852A3E60F20C04E3165740443F8A50847E80
          A20BC5A84502E2300D3B5C821E40E8023EFE7BEA5553BDEA568758A5F2778248
          70DD1060D48022B81E093002760F895284064812813954A2ED38700049401089
          4E4462DC1AB1C01FDAAE880B10D2C0419885328426D96AC4223A173577BA13AF
          F8AC20476B689B021C34E8C92A20FF6105131033E671D98006244005921CB21B
          1A74494C62F7169708419D01B00471C8C000C50883015250037298E2129E4845
          092C31AE16F400E57850BD365AB0845CF8C4454588470C00F001A8C002141FC0
          C60D63808F2BF4401B3200C0208A818141D44214AD40C70D58626A515DBDFCE6
          3FBF5738E56ACCB07FF316E5196630A4B1F97FA430ECBFBF64A6F6C38AE40013
          4C8BC529948221E0C0CEB8DAE21D20027E4443B0960B58C1BBE90A1C40810B9C
          9481100E211D462F5D4403108001A80019500115608142C0870A15C609405C09
          884326188011C8030C608036680228C0420DA8E0155C422A60C027B082B00080
          0CF40321088538B4002790C315F4FF013EE0410DF44326C401CE7D4031A84207
          64432D84C120F403BEF403E8484230C0A02A14C125E8430F909AD4911FFA9D21
          1AA69AFAED1F603980530D52B625C7B595840BD15F459484CF54C4A7D45FD5FC
          10CF900020004213BC80A414A001262022226048CCC70D4C011BC0541AD00119
          1CC10A50A0052E9202341E464000046492C161014250811BF48D480C55304842
          07888324088014BC03E8C89038C4410510823604833834820058022B309700D8
          8038040200A0C1379800C669039EE1C1035882382C231E4CC02AE08204E0813C
          4CA3141A8138C0000028822DCCA238609A4A74013F8C5FA8A4213996E359AD61
          F95CDB71B89F21E68F61B4507200FF1000745500A8A3FE25471E32DE2126223F
          A25B72E8DBB1E48728ADC10141810E3485C0D91B265E48060A0097A581287941
          42204142C6070CB0407251915B0C4407A8574354800D8424739DC0098484E978
          800080800D980A0B0C010BC00015998E7D4DC44B0AC003B040484697761D1308
          A040E884A409B00006E497354D9D391E25521A91FEB08C5091063C3EA5B5F08C
          3B820A72D4D1059EC466F5A356DED8F9680D6BA94097A501291119194C810EA8
          C0490D0BE64D80C1918116E80D18E4D692840448908662F15078DCE52125255F
          F6A5EEA41BDC05C09F98DB53165256DEE1616EA562669448B0D0801048816480
          0A00811594C11A88121690A51520FF810EAC00072C808184A6814C40081C811B
          C0DB5B2A0B1B848055D965298A0A46B01078881980F9A56DDE663725DE54D6D8
          6E2EA66FD6D86B5ED4631680D6AC96AD58417E48D258EAC7174C0112080110DC
          80740A011248922885120761811BA44063229E02B6A637C1A38DE1267996E793
          285E6FFEA67AAEA7219DCF22260005C400127C01DB60A62845D24BE527087A01
          D868011680601980016B86846CB227A89827822628D6A55B7A1AA8833EE81C79
          270EFD52046CDE014C004B2167E4250808DAA78776107FFA2708A6415C76E73E
          42E87828A88AAEE812A1A88BBE288C7AC49F14A703F180135841DB6490DE280B
          88A2121548D2280E4E83C6E874B0F1A8911A299126A992B267CE5CC4224A0007
          DC0012400119BC94248D81878AA024B1C10D2C80016059442C698A1E29992AA8
          989E299A22E23F2EE284ACD40AE800124C8123B2019DE6C7AEB0C11450226AA5
          E98694A99F9A279F06AAA0262055AD167C7E400AC4C00D0001A346A7674EC084
          8C84840EEA46FCA9A5DE26A566AAA6765672E8D2701184685620800CE9A05EAA
          A9F2E5A6A6AAAAF64F26624BE6816733AD6AA59E2AAD96A3ACDE2AAEE6EAB9D5
          2AAFA2A1AEFE2AB006EBFEF42AB19A9FB01E2BB2266B9F162BB3529DB23E2BB4
          462B00342BB5AAA1B45E2BB6E66AB56EAB80656BB6722BB886ABB88E2BB50604
          003B}
        mmHeight = 20902
        mmLeft = 794
        mmTop = 0
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label52'
        AutoSize = False
        Caption = 'Voy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 109802
        mmWidth = 42863
        BandType = 0
      end
      object ppDBText113: TppDBText
        UserName = 'DBText104'
        DataField = 'NR_VIAGEM_ARMADOR'
        DataPipeline = ppGeral1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppGeral1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 109802
        mmWidth = 150813
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Shipping rates:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 144992
        mmWidth = 42863
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand10: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppRegion6: TppRegion
        UserName = 'Region4'
        Brush.Style = bsClear
        Caption = 'Region4'
        Pen.Style = psClear
        Transparent = True
        mmHeight = 6879
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBText120: TppDBText
          UserName = 'DBText75'
          DataField = 'calcUsuario'
          DataPipeline = ppGeral1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppGeral1'
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 2117
          mmWidth = 193411
          BandType = 7
        end
      end
      object ppLine22: TppLine
        UserName = 'Line10'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1323
        mmLeft = 529
        mmTop = 0
        mmWidth = 195792
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryRefCli: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      
        'SELECT CD_REFERENCIA, NR_ITEM_PO FROM TREF_CLIENTE (NOLOCK) WHER' +
        'E NR_PROCESSO = :NR_PROCESSO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 386
    Top = 315
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 15
      end>
    object qryRefCliCD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_REFERENCIA'
      FixedChar = True
      Size = 15
    end
    object qryRefCliNR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
  end
  object dsRefCli: TDataSource
    DataSet = qryRefCli
    Left = 282
    Top = 316
  end
end
