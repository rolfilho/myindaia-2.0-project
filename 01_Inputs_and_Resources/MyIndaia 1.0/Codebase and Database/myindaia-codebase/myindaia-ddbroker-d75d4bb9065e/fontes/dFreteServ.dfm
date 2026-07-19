object datm_frete_serv: Tdatm_frete_serv
  OldCreateOrder = False
  Left = 230
  Top = 173
  Height = 330
  Width = 835
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 24
    Top = 168
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    OnDataChange = ds_listaDataChange
    Left = 17
    Top = 58
  end
  object qry_lista_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      ' tt.cd_tab_frete,'
      ' tt.desc_tab_frete,'
      ' tt.cd_origem_tab_frete,'
      ' tt.cd_destino_tab_frete,'
      ' tt.TP_EMP_FRETE,'
      ' tt.CD_VIA_TRANSP,'
      ' tt.CD_AGENTE_TAB_FRETE as CODIGO,'
      ' tt.IN_DESEMBARACO,'
      ' a.NM_AGENTE as NM_REF,'
      ' tt.CD_ARMADOR,'
      ' arm.DESCRICAO NM_ARM,'
      ' tt.CD_CIA_TRANSP_TAB_FRETE,'
      ' cia.DESCRICAO NM_CIA'
      ' FROM TTAB_FRETE tt '
      ' left JOIN TAGENTE a ON tt.CD_AGENTE_TAB_FRETE     = a.CD_AGENTE'
      ' left JOIN TTRANSPORTADOR_ITL arm ON tt.CD_ARMADOR = arm.CODIGO'
      
        ' left JOIN TTRANSPORTADOR_ITL cia ON tt.CD_CIA_TRANSP_TAB_FRETE ' +
        '= cia.CODIGO'
      ' WHERE '
      ' tt.CD_ORIGEM_TAB_FRETE = :CD_ORIGEM'
      ' AND tt.CD_DESTINO_TAB_FRETE= :CD_DESTINO'
      ' and tt.CD_VIA_TRANSP= :CD_VIA_TRANSP --01=maritima    04=aerea'
      ' and tt.TP_EMP_FRETE= :TP_EMP_FRETE  '
      ' and ( :CD_ARMADOR IN ( tt.CD_ARMADOR, '#39#39') )'
      ' and ( :CD_CIA     IN ( tt.CD_CIA_TRANSP_TAB_FRETE, '#39#39') )'
      ' and ( :CD_AGENCIA IN ( tt.CD_AGENTE_TAB_FRETE, '#39#39') )'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      'order by tt.CD_TAB_FRETE'
      '')
    Left = 17
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_DESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TP_EMP_FRETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ARMADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_AGENCIA'
        ParamType = ptUnknown
      end>
    object qry_lista_cd_tab_frete: TStringField
      FieldName = 'cd_tab_frete'
      FixedChar = True
      Size = 5
    end
    object qry_lista_desc_tab_frete: TStringField
      FieldName = 'desc_tab_frete'
      FixedChar = True
      Size = 80
    end
    object qry_lista_cd_origem_tab_frete: TStringField
      FieldName = 'cd_origem_tab_frete'
      FixedChar = True
      Size = 4
    end
    object qry_lista_cd_destino_tab_frete: TStringField
      FieldName = 'cd_destino_tab_frete'
      FixedChar = True
      Size = 4
    end
    object qry_lista_TP_EMP_FRETE: TStringField
      FieldName = 'TP_EMP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_lista_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_lista_CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 4
    end
    object qry_lista_IN_DESEMBARACO: TIntegerField
      FieldName = 'IN_DESEMBARACO'
    end
    object qry_lista_NM_REF: TStringField
      FieldName = 'NM_REF'
      FixedChar = True
      Size = 60
    end
    object qry_lista_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_lista_NM_ARM: TStringField
      FieldName = 'NM_ARM'
      FixedChar = True
      Size = 60
    end
    object qry_lista_CD_CIA_TRANSP_TAB_FRETE: TStringField
      FieldName = 'CD_CIA_TRANSP_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_lista_NM_CIA: TStringField
      FieldName = 'NM_CIA'
      FixedChar = True
      Size = 60
    end
  end
  object qry_frete_: TQuery
    CachedUpdates = True
    BeforePost = qry_frete_BeforePost
    AfterPost = qry_frete_aplica
    AfterDelete = qry_frete_aplica
    AfterScroll = qry_frete_AfterScroll
    OnCalcFields = qry_frete_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TT.CD_TAB_FRETE, TT.DESC_TAB_FRETE, TT.DT_TAB_FRETE, TT.C' +
        'D_EMPRESA,TT.QTD_DIAS_TAB_FRETE,'
      
        ' TT.CD_AGENTE_TAB_FRETE, TT.CD_CIA_TRANSP_TAB_FRETE, TT.NR_TRANS' +
        'IT_TIME, TT.NR_FRQUENCIA,  TT.IN_ATIVO,'
      
        'TT.CD_MOEDA_TAB_FRETE, TT.TRANSIT_TIME_TAB_FRETE, TT.TP_FREQUENC' +
        'IA_TAB_FRETE, TT.TX_OBS_TAB_FRETE,'
      
        'TT.CD_ORIGEM_TAB_FRETE, TT.CD_DESTINO_TAB_FRETE, TT.TP_EMP_FRETE' +
        ', TT.VL_OTHER_CHARGE,'
      'TT.CD_ARMADOR, TT.CD_VIA_TRANSP,TT.TP_CARGA, TT.IN_DESEMBARACO,'
      
        '(SELECT TA.NM_AGENTE FROM TAGENTE TA WHERE TA.CD_AGENTE = TT.CD_' +
        'AGENTE_TAB_FRETE) NM_AGENTE,'
      
        '(SELECT TAR.DESCRICAO FROM TTRANSPORTADOR_ITL TAR WHERE TAR.CODI' +
        'GO = TT.CD_ARMADOR)NM_ARMADOR,'
      
        '(SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRESA =' +
        ' TT.CD_EMPRESA)NM_EMPRESA,'
      
        '(SELECT TC.DESCRICAO FROM TTRANSPORTADOR_ITL TC WHERE TC.CODIGO ' +
        '= TT.CD_CIA_TRANSP_TAB_FRETE)NM_CIA_TRANSP,'
      
        '(SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TT' +
        '.CD_MOEDA_TAB_FRETE)NM_MOEDA,'
      
        '(SELECT TC.TP_TARIFA FROM TTRANSPORTADOR_ITL TC WHERE TC.CODIGO ' +
        '= TT.CD_CIA_TRANSP_TAB_FRETE)TARIFA'
      
        ' FROM TTAB_FRETE TT  WHERE TT.CD_ORIGEM_TAB_FRETE = :CD_ORIGEM A' +
        'ND TT.CD_DESTINO_TAB_FRETE =:CD_DESTINO'
      
        '     AND TT.TP_EMP_FRETE=:TP_EMP_FRETE AND TT.CD_VIA_TRANSP = :C' +
        'D_VIA_TRANSP'
      ''
      ''
      ''
      ''
      '')
    UpdateObject = UpDAte_frete
    Left = 529
    Top = 10
    ParamData = <
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
        Name = 'TP_EMP_FRETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end>
    object qry_frete_DESC_TAB_FRETE: TStringField
      FieldName = 'DESC_TAB_FRETE'
      FixedChar = True
      Size = 30
    end
    object qry_frete_DT_TAB_FRETE: TDateTimeField
      FieldName = 'DT_TAB_FRETE'
      EditMask = '!##/##/9999;1;_'
    end
    object qry_frete_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_frete_QTD_DIAS_TAB_FRETE: TFloatField
      FieldName = 'QTD_DIAS_TAB_FRETE'
    end
    object qry_frete_CD_CIA_TRANSP_TAB_FRETE: TStringField
      FieldName = 'CD_CIA_TRANSP_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_frete_CD_MOEDA_TAB_FRETE: TStringField
      FieldName = 'CD_MOEDA_TAB_FRETE'
      LookupDataSet = qry_cntr_
      FixedChar = True
      Size = 3
    end
    object qry_frete_TRANSIT_TIME_TAB_FRETE: TStringField
      FieldName = 'TRANSIT_TIME_TAB_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_frete_TP_FREQUENCIA_TAB_FRETE: TStringField
      FieldName = 'TP_FREQUENCIA_TAB_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_frete_CD_ORIGEM_TAB_FRETE: TStringField
      FieldName = 'CD_ORIGEM_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_frete_CD_DESTINO_TAB_FRETE: TStringField
      FieldName = 'CD_DESTINO_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_frete_TP_EMP_FRETE: TStringField
      FieldName = 'TP_EMP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_frete_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_frete_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_frete_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_frete_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 50
    end
    object qry_frete_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_frete_NM_CIA_TRANSP: TStringField
      FieldName = 'NM_CIA_TRANSP'
      FixedChar = True
      Size = 50
    end
    object qry_frete_TP_CARGA: TStringField
      FieldName = 'TP_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_frete_Look_nm_tp_Freg: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_Freg'
      LookupDataSet = qry_tipo_frequencia_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TP_FREQUENCIA_TAB_FRETE'
      Size = 15
      Lookup = True
    end
    object qry_frete_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_frete_CD_TAB_FRETE: TStringField
      DisplayWidth = 5
      FieldName = 'CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_frete_TX_OBS_TAB_FRETE: TStringField
      FieldName = 'TX_OBS_TAB_FRETE'
      FixedChar = True
      Size = 255
    end
    object qry_frete_VL_OTHER_CHARGE: TFloatField
      FieldName = 'VL_OTHER_CHARGE'
    end
    object qry_frete_NR_TRANSIT_TIME: TFloatField
      FieldName = 'NR_TRANSIT_TIME'
    end
    object qry_frete_NR_FRQUENCIA: TFloatField
      FieldName = 'NR_FRQUENCIA'
    end
    object qry_frete_calc_tp_tarifa: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_tarifa'
      Size = 10
      Calculated = True
    end
    object qry_frete_TARIFA: TStringField
      FieldName = 'TARIFA'
      FixedChar = True
      Size = 1
    end
    object qry_frete_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_frete_IN_DESEMBARACO: TIntegerField
      FieldName = 'IN_DESEMBARACO'
    end
    object qry_frete_CD_AGENTE_TAB_FRETE: TStringField
      FieldName = 'CD_AGENTE_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
  end
  object ds_frete: TDataSource
    DataSet = qry_frete_
    Left = 529
    Top = 58
  end
  object UpDAte_frete: TUpdateSQL
    ModifySQL.Strings = (
      'update TTAB_FRETE'
      'set'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  DESC_TAB_FRETE = :DESC_TAB_FRETE,'
      '  DT_TAB_FRETE = :DT_TAB_FRETE,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  QTD_DIAS_TAB_FRETE = :QTD_DIAS_TAB_FRETE,'
      '  CD_AGENTE_TAB_FRETE = :CD_AGENTE_TAB_FRETE,'
      '  CD_CIA_TRANSP_TAB_FRETE = :CD_CIA_TRANSP_TAB_FRETE,'
      '  CD_MOEDA_TAB_FRETE = :CD_MOEDA_TAB_FRETE,'
      '  NR_FRQUENCIA = :NR_FRQUENCIA,'
      '  TP_FREQUENCIA_TAB_FRETE = :TP_FREQUENCIA_TAB_FRETE,'
      '  TRANSIT_TIME_TAB_FRETE = :TRANSIT_TIME_TAB_FRETE,'
      '  NR_TRANSIT_TIME = :NR_TRANSIT_TIME,'
      '  CD_ORIGEM_TAB_FRETE = :CD_ORIGEM_TAB_FRETE,'
      '  CD_DESTINO_TAB_FRETE = :CD_DESTINO_TAB_FRETE,'
      '  TX_OBS_TAB_FRETE = :TX_OBS_TAB_FRETE,'
      '  TP_EMP_FRETE = :TP_EMP_FRETE,'
      '  CD_ARMADOR = :CD_ARMADOR,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  TP_CARGA = :TP_CARGA,'
      '  VL_OTHER_CHARGE = :VL_OTHER_CHARGE,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  IN_DESEMBARACO = :IN_DESEMBARACO'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE')
    InsertSQL.Strings = (
      'insert into TTAB_FRETE'
      
        '  (CD_TAB_FRETE, DESC_TAB_FRETE, DT_TAB_FRETE, CD_EMPRESA, QTD_D' +
        'IAS_TAB_FRETE, '
      
        '   CD_AGENTE_TAB_FRETE, CD_CIA_TRANSP_TAB_FRETE, CD_MOEDA_TAB_FR' +
        'ETE, NR_FRQUENCIA, '
      
        '   TP_FREQUENCIA_TAB_FRETE, TRANSIT_TIME_TAB_FRETE, NR_TRANSIT_T' +
        'IME, CD_ORIGEM_TAB_FRETE, '
      
        '   CD_DESTINO_TAB_FRETE, TX_OBS_TAB_FRETE, TP_EMP_FRETE, CD_ARMA' +
        'DOR, CD_VIA_TRANSP, '
      '   TP_CARGA, VL_OTHER_CHARGE, IN_ATIVO, IN_DESEMBARACO)'
      'values'
      
        '  (:CD_TAB_FRETE, :DESC_TAB_FRETE, :DT_TAB_FRETE, :CD_EMPRESA, :' +
        'QTD_DIAS_TAB_FRETE, '
      
        '   :CD_AGENTE_TAB_FRETE, :CD_CIA_TRANSP_TAB_FRETE, :CD_MOEDA_TAB' +
        '_FRETE, '
      
        '   :NR_FRQUENCIA, :TP_FREQUENCIA_TAB_FRETE, :TRANSIT_TIME_TAB_FR' +
        'ETE, :NR_TRANSIT_TIME, '
      
        '   :CD_ORIGEM_TAB_FRETE, :CD_DESTINO_TAB_FRETE, :TX_OBS_TAB_FRET' +
        'E, :TP_EMP_FRETE, '
      
        '   :CD_ARMADOR, :CD_VIA_TRANSP, :TP_CARGA, :VL_OTHER_CHARGE, :IN' +
        '_ATIVO, '
      '   :IN_DESEMBARACO)')
    DeleteSQL.Strings = (
      'delete from TTAB_FRETE'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE')
    Left = 529
    Top = 106
  end
  object qry_ult_frete_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_TAB_FRETE) AS ULTIMO '
      '   FROM TTAB_FRETE')
    Left = 127
    Top = 229
    object qry_ult_frete_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TTAB_FRETE.CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
  end
  object qry_tipo_frequencia_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TTIPO_FREQUENCIA')
    Left = 247
    Top = 181
  end
  object qry_ult_tarifas_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_ITEM_TAB_FRETE) AS ULTIMO'
      '  FROM TTAB_FRETE_ITEM '
      '   WHERE CD_TAB_FRETE=:CD_TAB_FRETE')
    Left = 247
    Top = 229
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end>
    object qry_ult_tarifas_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_ITEM_TAB_FRETE'
      FixedChar = True
      Size = 2
    end
  end
  object qry_tarifa_aerea_: TQuery
    CachedUpdates = True
    BeforePost = qry_tarifa_aerea_BeforePost
    AfterPost = qry_tarifa_aerea_Aplica
    BeforeDelete = qry_tarifa_aerea_BeforeDelete
    AfterDelete = qry_tarifa_aerea_Aplica
    AfterScroll = qry_tarifa_aerea_AfterScroll
    OnCalcFields = qry_tarifa_aerea_CalcFields
    OnNewRecord = qry_tarifa_aerea_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TAB_FRETE, CD_ITEM_TAB_FRETE, PESO_TAB_FRETE, TP_FRETE' +
        ', TP_ESTUFAGEM,'
      
        '  VOLUME_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRETE' +
        ', CD_TAB_REF,'
      
        '  VL_VENDA_TAB_FRETE, PERC_VENDA_TAB_FRETE, VL_DIFERENCA, VL_COM' +
        'PRA_CIA_ARMADOR'
      '  FROM TTAB_FRETE_ITEM'
      
        '     WHERE CD_TAB_FRETE =:CD_TAB_FRETE AND TP_ESTUFAGEM = :TP_ES' +
        'TUFAGEM'
      'ORDER BY CD_ITEM_TAB_FRETE '
      ' '
      ' ')
    UpdateObject = UpDate_tarifa_aerea
    Left = 345
    Top = 10
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'TP_ESTUFAGEM'
        ParamType = ptUnknown
      end>
    object qry_tarifa_aerea_CD_TAB_FRETE: TStringField
      DisplayWidth = 5
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_tarifa_aerea_PESO_TAB_FRETE: TFloatField
      FieldName = 'PESO_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.PESO_TAB_FRETE'
      DisplayFormat = '00'
    end
    object qry_tarifa_aerea_VOLUME_TAB_FRETE: TStringField
      FieldName = 'VOLUME_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VOLUME_TAB_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE: TStringField
      FieldName = 'TTIPO_SIMBOLO_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TTIPO_SIMBOLO_TAB_FRETE'
      FixedChar = True
      Size = 15
    end
    object qry_tarifa_aerea_VL_COMPRA_TAB_FRETE: TFloatField
      FieldName = 'VL_COMPRA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_TAB_FRETE'
      OnChange = qry_tarifa_aerea_VL_COMPRA_TAB_FRETEChange
      DisplayFormat = '0.00'
    end
    object qry_tarifa_aerea_VL_VENDA_TAB_FRETE: TFloatField
      FieldName = 'VL_VENDA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_VENDA_TAB_FRETE'
      OnChange = qry_tarifa_aerea_VL_VENDA_TAB_FRETEChange
      DisplayFormat = '0.00'
    end
    object qry_tarifa_aerea_PERC_VENDA_TAB_FRETE: TFloatField
      FieldName = 'PERC_VENDA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.PERC_VENDA_TAB_FRETE'
    end
    object qry_tarifa_aerea_VL_DIFERENCA: TFloatField
      FieldName = 'VL_DIFERENCA'
      LookupDataSet = qry_cntr_
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_DIFERENCA'
    end
    object qry_tarifa_aerea_VL_COMPRA_CIA_ARMADOR: TFloatField
      FieldName = 'VL_COMPRA_CIA_ARMADOR'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_CIA_ARMADOR'
      DisplayFormat = '0.00'
    end
    object qry_tarifa_aerea_CD_ITEM_TAB_FRETE: TStringField
      FieldName = 'CD_ITEM_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_ITEM_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_tarifa_aerea_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_tarifa_aerea_CD_TAB_REF: TStringField
      FieldName = 'CD_TAB_REF'
      FixedChar = True
      Size = 6
    end
    object qry_tarifa_aerea_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_tarifa_aerea_calc_tp_simb_maritimo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_simb_maritimo'
      Calculated = True
    end
  end
  object ds_tarifa_aerea: TDataSource
    DataSet = qry_tarifa_aerea_
    Left = 345
    Top = 58
  end
  object UpDate_tarifa_aerea: TUpdateSQL
    ModifySQL.Strings = (
      'update TTAB_FRETE_ITEM'
      'set'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  CD_ITEM_TAB_FRETE = :CD_ITEM_TAB_FRETE,'
      '  PESO_TAB_FRETE = :PESO_TAB_FRETE,'
      '  TP_FRETE = :TP_FRETE,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  VOLUME_TAB_FRETE = :VOLUME_TAB_FRETE,'
      '  TTIPO_SIMBOLO_TAB_FRETE = :TTIPO_SIMBOLO_TAB_FRETE,'
      '  VL_COMPRA_TAB_FRETE = :VL_COMPRA_TAB_FRETE,'
      '  CD_TAB_REF = :CD_TAB_REF,'
      '  VL_VENDA_TAB_FRETE = :VL_VENDA_TAB_FRETE,'
      '  PERC_VENDA_TAB_FRETE = :PERC_VENDA_TAB_FRETE,'
      '  VL_DIFERENCA = :VL_DIFERENCA,'
      '  VL_COMPRA_CIA_ARMADOR = :VL_COMPRA_CIA_ARMADOR'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_ITEM_TAB_FRETE = :OLD_CD_ITEM_TAB_FRETE')
    InsertSQL.Strings = (
      'insert into TTAB_FRETE_ITEM'
      
        '  (CD_TAB_FRETE, CD_ITEM_TAB_FRETE, PESO_TAB_FRETE, TP_FRETE, TP' +
        '_ESTUFAGEM, '
      
        '   VOLUME_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRET' +
        'E, CD_TAB_REF, '
      
        '   VL_VENDA_TAB_FRETE, PERC_VENDA_TAB_FRETE, VL_DIFERENCA, VL_CO' +
        'MPRA_CIA_ARMADOR)'
      'values'
      
        '  (:CD_TAB_FRETE, :CD_ITEM_TAB_FRETE, :PESO_TAB_FRETE, :TP_FRETE' +
        ', :TP_ESTUFAGEM, '
      
        '   :VOLUME_TAB_FRETE, :TTIPO_SIMBOLO_TAB_FRETE, :VL_COMPRA_TAB_F' +
        'RETE, :CD_TAB_REF, '
      
        '   :VL_VENDA_TAB_FRETE, :PERC_VENDA_TAB_FRETE, :VL_DIFERENCA, :V' +
        'L_COMPRA_CIA_ARMADOR)')
    DeleteSQL.Strings = (
      'delete from TTAB_FRETE_ITEM'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_ITEM_TAB_FRETE = :OLD_CD_ITEM_TAB_FRETE')
    Left = 345
    Top = 106
  end
  object qry_frete_despesas_: TQuery
    CachedUpdates = True
    BeforePost = qry_frete_despesas_BeforePost
    AfterPost = qry_frete_despesas_AfterPost
    BeforeDelete = qry_frete_despesas_BeforeDelete
    AfterDelete = qry_frete_despesas_AfterDelete
    AfterScroll = qry_frete_despesas_AfterScroll
    OnCalcFields = qry_frete_despesas_CalcFields
    OnNewRecord = qry_frete_despesas_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TAB_FRETE, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIG' +
        'EM_DESPESA, CD_TAB_REF, TP_ESTUFAGEM,VL_INTERVALO_INICIAL,'
      
        'CODIGO, VL_BASE_DESPESA, VL_COMPRA_AG, VL_COMPRA_CIA, VL_VENDA, ' +
        'IN_DESPESA, IN_MENCIONADO, TP_FRETE, VL_INTERVALO_FINAL, TP_CNTR'
      'FROM TTAB_FRETE_DESPESA'
      'WHERE CD_TAB_FRETE=:CD_TAB_FRETE AND TP_ESTUFAGEM=:TP_ESTUFAGEM')
    UpdateObject = UpDate_despesas
    Left = 233
    Top = 10
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'TP_ESTUFAGEM'
        ParamType = ptUnknown
      end>
    object qry_frete_despesas_CD_TAB_FRETE: TStringField
      DisplayWidth = 5
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_frete_despesas_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.CD_ITEM'
      OnChange = qry_frete_despesas_CD_ITEMChange
      OnSetText = qry_frete_despesas_CD_ITEMSetText
      FixedChar = True
      Size = 3
    end
    object qry_frete_despesas_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.TP_BASE_CALCULO'
      OnChange = qry_frete_despesas_TP_BASE_CALCULOChange
      FixedChar = True
      Size = 2
    end
    object qry_frete_despesas_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.CD_MOEDA'
      OnSetText = qry_frete_despesas_CD_MOEDASetText
      FixedChar = True
      Size = 3
    end
    object qry_frete_despesas_TP_ORIGEM_DESPESA: TStringField
      FieldName = 'TP_ORIGEM_DESPESA'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.TP_ORIGEM_DESPESA'
      OnChange = qry_frete_despesas_TP_ORIGEM_DESPESAChange
      FixedChar = True
      Size = 1
    end
    object qry_frete_despesas_VL_BASE_DESPESA: TFloatField
      FieldName = 'VL_BASE_DESPESA'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.VL_BASE_DESPESA'
      DisplayFormat = '0.000'
    end
    object qry_frete_despesas_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.VL_COMPRA_AG'
      OnChange = qry_frete_despesas_VL_COMPRA_AGChange
      DisplayFormat = '0.000'
    end
    object qry_frete_despesas_VL_COMPRA_CIA: TFloatField
      FieldName = 'VL_COMPRA_CIA'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.VL_COMPRA_CIA'
      DisplayFormat = '0.000'
    end
    object qry_frete_despesas_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.VL_VENDA'
      DisplayFormat = '0.000'
    end
    object qry_frete_despesas_IN_DESPESA: TStringField
      FieldName = 'IN_DESPESA'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.IN_DESPESA'
      OnChange = qry_frete_despesas_IN_DESPESAChange
      FixedChar = True
      Size = 1
    end
    object qry_frete_despesas_IN_MENCIONADO: TStringField
      FieldName = 'IN_MENCIONADO'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.IN_MENCIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_frete_despesas_Look_nm_depesa_por: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_depesa_por'
      LookupDataSet = qry_depesa_por_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'IN_DESPESA'
      Lookup = True
    end
    object qry_frete_despesas_Look_nm_mencionado: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_mencionado'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_MENCIONADO'
      Size = 3
      Lookup = True
    end
    object qry_frete_despesas_Look_nm_origem_custo: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_origem_custo'
      LookupDataSet = qry_origem_custo_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'TP_ORIGEM_DESPESA'
      Size = 15
      Lookup = True
    end
    object qry_frete_despesas_Look_nm_tp_base: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_base'
      LookupDataSet = qry_tp_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_FRETE'
      LookupResultField = 'NM_TP_BASE_CALC_FRETE'
      KeyFields = 'TP_BASE_CALCULO'
      Size = 40
      Lookup = True
    end
    object qry_frete_despesas_CD_TAB_REF: TStringField
      FieldName = 'CD_TAB_REF'
      FixedChar = True
      Size = 6
    end
    object qry_frete_despesas_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_frete_despesas_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_frete_despesas_VL_INTERVALO_INICIAL: TFloatField
      FieldName = 'VL_INTERVALO_INICIAL'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.VL_INTERVALO_INICIAL'
      DisplayFormat = '0.000'
    end
    object qry_frete_despesas_VL_INTERVALO_FINAL: TFloatField
      FieldName = 'VL_INTERVALO_FINAL'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.VL_INTERVALO_FINAL'
      DisplayFormat = '0.000'
    end
    object qry_frete_despesas_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_frete_despesas_calcItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcItem'
      Size = 100
      Calculated = True
    end
    object qry_frete_despesas_calcMoeda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMoeda'
      Size = 100
      Calculated = True
    end
    object qry_frete_despesas_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qry_frete_despesas_lookTpCntr: TStringField
      FieldKind = fkLookup
      FieldName = 'lookTpCntr'
      LookupDataSet = qryTpCntr
      LookupKeyFields = 'TP_CNTR'
      LookupResultField = 'NM_TP_CNTR'
      KeyFields = 'TP_CNTR'
      Size = 30
      Lookup = True
    end
  end
  object ds_despesas: TDataSource
    DataSet = qry_frete_despesas_
    Left = 233
    Top = 58
  end
  object UpDate_despesas: TUpdateSQL
    ModifySQL.Strings = (
      'update TTAB_FRETE_DESPESA'
      'set'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  TP_ORIGEM_DESPESA = :TP_ORIGEM_DESPESA,'
      '  CD_TAB_REF = :CD_TAB_REF,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  VL_INTERVALO_INICIAL = :VL_INTERVALO_INICIAL,'
      '  CODIGO = :CODIGO,'
      '  VL_BASE_DESPESA = :VL_BASE_DESPESA,'
      '  VL_COMPRA_AG = :VL_COMPRA_AG,'
      '  VL_COMPRA_CIA = :VL_COMPRA_CIA,'
      '  VL_VENDA = :VL_VENDA,'
      '  IN_DESPESA = :IN_DESPESA,'
      '  IN_MENCIONADO = :IN_MENCIONADO,'
      '  TP_FRETE = :TP_FRETE,'
      '  VL_INTERVALO_FINAL = :VL_INTERVALO_FINAL,'
      '  TP_CNTR = :TP_CNTR'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TTAB_FRETE_DESPESA'
      
        '  (CD_TAB_FRETE, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_D' +
        'ESPESA, '
      
        '   CD_TAB_REF, TP_ESTUFAGEM, VL_INTERVALO_INICIAL, CODIGO, VL_BA' +
        'SE_DESPESA, '
      
        '   VL_COMPRA_AG, VL_COMPRA_CIA, VL_VENDA, IN_DESPESA, IN_MENCION' +
        'ADO, TP_FRETE, '
      '   VL_INTERVALO_FINAL, TP_CNTR)'
      'values'
      
        '  (:CD_TAB_FRETE, :CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA, :TP_ORI' +
        'GEM_DESPESA, '
      
        '   :CD_TAB_REF, :TP_ESTUFAGEM, :VL_INTERVALO_INICIAL, :CODIGO, :' +
        'VL_BASE_DESPESA, '
      
        '   :VL_COMPRA_AG, :VL_COMPRA_CIA, :VL_VENDA, :IN_DESPESA, :IN_ME' +
        'NCIONADO, '
      '   :TP_FRETE, :VL_INTERVALO_FINAL, :TP_CNTR)')
    DeleteSQL.Strings = (
      'delete from TTAB_FRETE_DESPESA'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CODIGO = :OLD_CODIGO')
    Left = 233
    Top = 106
  end
  object qry_moeda_broker_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT AP_MOEDA, CD_MOEDA, NM_MOEDA FROM TMOEDA_BROKER ORDER BY ' +
        'NM_MOEDA')
    Left = 487
    Top = 181
    object qry_moeda_broker_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qry_moeda_broker_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_moeda_broker_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.AP_MOEDA'
      FixedChar = True
      Size = 6
    end
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM FROM TITEM'
      ' WHERE CD_VIA_TRANSPORTE = :CD_VIA_TRANSP'
      ' OR CD_VIA_TRANSPORTE = '#39'10'#39
      'ORDER BY NM_ITEM')
    Left = 607
    Top = 181
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end>
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'DBBROKER.TITEM.NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TITEM.CD_ITEM'
      FixedChar = True
      Size = 3
    end
  end
  object qry_origem_custo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ORIGEM_DESP, NM_ORIGEM_DESP'
      '    FROM TORIGEM_DESPESA'
      '  WHERE TP_DESCRICAO = "3"')
    Left = 727
    Top = 181
    object qry_origem_custo_NM_ORIGEM_DESP: TStringField
      FieldName = 'NM_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.NM_ORIGEM_DESP'
      FixedChar = True
    end
    object qry_origem_custo_CD_ORIGEM_DESP: TStringField
      FieldName = 'CD_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.CD_ORIGEM_DESP'
      FixedChar = True
      Size = 1
    end
  end
  object qry_depesa_por_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ORIGEM_DESP, NM_ORIGEM_DESP'
      '    FROM TORIGEM_DESPESA'
      '  WHERE TP_DESCRICAO = "1"')
    Left = 487
    Top = 229
    object qry_depesa_por_NM_ORIGEM_DESP: TStringField
      FieldName = 'NM_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.NM_ORIGEM_DESP'
      FixedChar = True
    end
    object qry_depesa_por_CD_ORIGEM_DESP: TStringField
      FieldName = 'CD_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.CD_ORIGEM_DESP'
      FixedChar = True
      Size = 1
    end
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO FROM TYES_NO')
    Left = 607
    Top = 229
    object qry_yes_no_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'DBBROKER.TYES_NO.TX_YESNO'
      FixedChar = True
      Size = 3
    end
    object qry_yes_no_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'DBBROKER.TYES_NO.CD_YESNO'
      FixedChar = True
      Size = 1
    end
  end
  object qry_tp_base_calc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TP_BASE_CALC_FRETE,'
      '    NM_TP_BASE_CALC_FRETE'
      
        '      FROM TTP_BASE_CALC_FRETE WHERE CD_VIA_TRANSP = '#39'10'#39' OR CD_' +
        'VIA_TRANSP= :CD_VIA_TRANSP')
    Left = 727
    Top = 229
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end>
    object qry_tp_base_calc_CD_TP_BASE_CALC_FRETE: TStringField
      FieldName = 'CD_TP_BASE_CALC_FRETE'
      Origin = 'DBBROKER.TTP_BASE_CALC_FRETE.CD_TP_BASE_CALC_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_tp_base_calc_NM_TP_BASE_CALC_FRETE: TStringField
      FieldName = 'NM_TP_BASE_CALC_FRETE'
      Origin = 'DBBROKER.TTP_BASE_CALC_FRETE.NM_TP_BASE_CALC_FRETE'
      FixedChar = True
      Size = 100
    end
  end
  object qry_tarifas_FCL_: TQuery
    CachedUpdates = True
    BeforePost = qry_tarifas_FCL_BeforePost
    AfterPost = qry_tarifas_FCL_Aplica
    BeforeDelete = qry_tarifas_FCL_BeforeDelete
    AfterDelete = qry_tarifas_FCL_Aplica
    AfterScroll = qry_tarifas_FCL_AfterScroll
    OnNewRecord = qry_tarifas_FCL_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TAB_FRETE, CD_ITEM_TAB_FRETE, VOLUME_TAB_FRETE,TP_ESTU' +
        'FAGEM,'
      
        '  VL_COMPRA_TAB_FRETE,  VL_VENDA_TAB_FRETE,  VL_COMPRA_CIA_ARMAD' +
        'OR,'
      '   TP_FRETE, CD_TAB_REF'
      '     FROM TTAB_FRETE_ITEM'
      
        '   WHERE CD_TAB_FRETE=:CD_TAB_FRETE AND TP_ESTUFAGEM =:TP_ESTUFA' +
        'GEM'
      ' '
      ' '
      ' ')
    UpdateObject = Update_tarifas_FCL
    Left = 441
    Top = 10
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'TP_ESTUFAGEM'
        ParamType = ptUnknown
      end>
    object qry_tarifas_FCL_CD_TAB_FRETE: TStringField
      DisplayWidth = 5
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_tarifas_FCL_CD_ITEM_TAB_FRETE: TStringField
      FieldName = 'CD_ITEM_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_ITEM_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_tarifas_FCL_VOLUME_TAB_FRETE: TStringField
      FieldName = 'VOLUME_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VOLUME_TAB_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_tarifas_FCL_VL_COMPRA_TAB_FRETE: TFloatField
      FieldName = 'VL_COMPRA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_TAB_FRETE'
      OnChange = qry_tarifas_FCL_VL_COMPRA_TAB_FRETEChange
      DisplayFormat = '0.00'
    end
    object qry_tarifas_FCL_VL_VENDA_TAB_FRETE: TFloatField
      FieldName = 'VL_VENDA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_VENDA_TAB_FRETE'
      OnChange = qry_tarifas_FCL_VL_VENDA_TAB_FRETEChange
      DisplayFormat = '0.00'
    end
    object qry_tarifas_FCL_VL_COMPRA_CIA_ARMADOR: TFloatField
      FieldName = 'VL_COMPRA_CIA_ARMADOR'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_CIA_ARMADOR'
      DisplayFormat = '0.00'
    end
    object qry_tarifas_FCL_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_tarifas_FCL_CD_TAB_REF: TStringField
      FieldName = 'CD_TAB_REF'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_TAB_REF'
      FixedChar = True
      Size = 6
    end
    object qry_tarifas_FCL_Look_nm_cntr: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_cntr'
      LookupDataSet = qry_cntr_
      LookupKeyFields = 'TP_CNTR'
      LookupResultField = 'NM_TP_CNTR'
      KeyFields = 'VOLUME_TAB_FRETE'
      Lookup = True
    end
    object qry_tarifas_FCL_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
  end
  object ds_tarifas_FCL: TDataSource
    DataSet = qry_tarifas_FCL_
    Left = 441
    Top = 58
  end
  object Update_tarifas_FCL: TUpdateSQL
    ModifySQL.Strings = (
      'update TTAB_FRETE_ITEM'
      'set'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  CD_ITEM_TAB_FRETE = :CD_ITEM_TAB_FRETE,'
      '  VOLUME_TAB_FRETE = :VOLUME_TAB_FRETE,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  VL_COMPRA_TAB_FRETE = :VL_COMPRA_TAB_FRETE,'
      '  VL_VENDA_TAB_FRETE = :VL_VENDA_TAB_FRETE,'
      '  VL_COMPRA_CIA_ARMADOR = :VL_COMPRA_CIA_ARMADOR,'
      '  TP_FRETE = :TP_FRETE,'
      '  CD_TAB_REF = :CD_TAB_REF'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_ITEM_TAB_FRETE = :OLD_CD_ITEM_TAB_FRETE')
    InsertSQL.Strings = (
      'insert into TTAB_FRETE_ITEM'
      '  (CD_TAB_FRETE, CD_ITEM_TAB_FRETE, VOLUME_TAB_FRETE, '
      'TP_ESTUFAGEM, VL_COMPRA_TAB_FRETE, '
      '   VL_VENDA_TAB_FRETE, VL_COMPRA_CIA_ARMADOR, TP_FRETE, '
      'CD_TAB_REF)'
      'values'
      '  (:CD_TAB_FRETE, :CD_ITEM_TAB_FRETE, :VOLUME_TAB_FRETE, '
      ':TP_ESTUFAGEM, '
      '   :VL_COMPRA_TAB_FRETE, :VL_VENDA_TAB_FRETE, '
      ':VL_COMPRA_CIA_ARMADOR, :TP_FRETE, '
      '   :CD_TAB_REF)')
    DeleteSQL.Strings = (
      'delete from TTAB_FRETE_ITEM'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_ITEM_TAB_FRETE = :OLD_CD_ITEM_TAB_FRETE')
    Left = 441
    Top = 106
  end
  object qry_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP_CNTR, NM_TP_CNTR'
      '  FROM TTP_CNTR WHERE IN_ATIVO="1"')
    Left = 367
    Top = 229
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
  object qry_despesa_FCL_: TQuery
    CachedUpdates = True
    BeforePost = qry_despesa_FCL_BeforePost
    AfterPost = qry_despesa_FCL_Aplica
    BeforeDelete = qry_despesa_FCL_BeforeDelete
    AfterDelete = qry_despesa_FCL_Aplica
    AfterScroll = qry_despesa_FCL_AfterScroll
    OnCalcFields = qry_despesa_FCL_CalcFields
    OnNewRecord = qry_despesa_FCL_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TAB_FRETE, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIG' +
        'EM_DESPESA, CD_TAB_REF,TP_ESTUFAGEM, CODIGO,'
      
        '  VL_BASE_DESPESA, VL_COMPRA_AG, VL_COMPRA_CIA, VL_VENDA, IN_DES' +
        'PESA, IN_MENCIONADO, TP_FRETE, TP_CNTR,'
      
        '     VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL FROM TTAB_FRETE_DE' +
        'SPESA'
      '        WHERE CD_TAB_FRETE=:CD_TAB_FRETE AND TP_ESTUFAGEM="1"'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = Update_despesa_FCL
    Left = 129
    Top = 10
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end>
    object qry_despesa_FCL_CD_TAB_FRETE: TStringField
      DisplayWidth = 5
      FieldName = 'CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_despesa_FCL_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      OnChange = qry_despesa_FCL_CD_ITEMChange
      OnSetText = qry_frete_despesas_CD_ITEMSetText
      FixedChar = True
      Size = 3
    end
    object qry_despesa_FCL_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      OnChange = qry_despesa_FCL_TP_BASE_CALCULOChange
      FixedChar = True
      Size = 2
    end
    object qry_despesa_FCL_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      OnSetText = qry_frete_despesas_CD_MOEDASetText
      FixedChar = True
      Size = 3
    end
    object qry_despesa_FCL_TP_ORIGEM_DESPESA: TStringField
      FieldName = 'TP_ORIGEM_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_FCL_CD_TAB_REF: TStringField
      FieldName = 'CD_TAB_REF'
      FixedChar = True
      Size = 6
    end
    object qry_despesa_FCL_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_FCL_VL_BASE_DESPESA: TFloatField
      FieldName = 'VL_BASE_DESPESA'
      DisplayFormat = '0.000'
    end
    object qry_despesa_FCL_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
      OnChange = qry_despesa_FCL_VL_COMPRA_AGChange
      DisplayFormat = '0.000'
    end
    object qry_despesa_FCL_VL_COMPRA_CIA: TFloatField
      FieldName = 'VL_COMPRA_CIA'
      DisplayFormat = '0.000'
    end
    object qry_despesa_FCL_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      OnChange = qry_despesa_FCL_VL_VENDAChange
      DisplayFormat = '0.000'
    end
    object qry_despesa_FCL_IN_DESPESA: TStringField
      FieldName = 'IN_DESPESA'
      OnChange = qry_despesa_FCL_IN_DESPESAChange
      FixedChar = True
      Size = 1
    end
    object qry_despesa_FCL_IN_MENCIONADO: TStringField
      FieldName = 'IN_MENCIONADO'
      OnChange = qry_despesa_FCL_VL_VENDAChange
      FixedChar = True
      Size = 1
    end
    object qry_despesa_FCL_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_FCL_Look_nm_despesa: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_despesa'
      LookupDataSet = qry_depesa_por_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'IN_DESPESA'
      Size = 15
      Lookup = True
    end
    object qry_despesa_FCL_Look_nm_origem: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_origem'
      LookupDataSet = qry_origem_custo_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'TP_ORIGEM_DESPESA'
      Size = 15
      Lookup = True
    end
    object qry_despesa_FCL_Look_nm_mencionado: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_mencionado'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_MENCIONADO'
      Size = 3
      Lookup = True
    end
    object qry_despesa_FCL_Look_nm_tp_base: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_base'
      LookupDataSet = qry_tp_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_FRETE'
      LookupResultField = 'NM_TP_BASE_CALC_FRETE'
      KeyFields = 'TP_BASE_CALCULO'
      Lookup = True
    end
    object qry_despesa_FCL_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_despesa_FCL_VL_INTERVALO_INICIAL: TFloatField
      FieldName = 'VL_INTERVALO_INICIAL'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.VL_INTERVALO_INICIAL'
      DisplayFormat = '0.000'
    end
    object qry_despesa_FCL_VL_INTERVALO_FINAL: TFloatField
      FieldName = 'VL_INTERVALO_FINAL'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.VL_INTERVALO_FINAL'
      DisplayFormat = '0.000'
    end
    object qry_despesa_FCL_calcItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcItem'
      Size = 100
      Calculated = True
    end
    object qry_despesa_FCL_calcMoeda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMoeda'
      Size = 100
      Calculated = True
    end
    object qry_despesa_FCL_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qry_despesa_FCL_lookTpCntr: TStringField
      FieldKind = fkLookup
      FieldName = 'lookTpCntr'
      LookupDataSet = qryTpCntr
      LookupKeyFields = 'TP_CNTR'
      LookupResultField = 'NM_TP_CNTR'
      KeyFields = 'TP_CNTR'
      Size = 30
      Lookup = True
    end
  end
  object ds_desepsa_FCL: TDataSource
    DataSet = qry_despesa_FCL_
    Left = 129
    Top = 58
  end
  object Update_despesa_FCL: TUpdateSQL
    ModifySQL.Strings = (
      'update TTAB_FRETE_DESPESA'
      'set'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  TP_ORIGEM_DESPESA = :TP_ORIGEM_DESPESA,'
      '  CD_TAB_REF = :CD_TAB_REF,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  CODIGO = :CODIGO,'
      '  VL_BASE_DESPESA = :VL_BASE_DESPESA,'
      '  VL_COMPRA_AG = :VL_COMPRA_AG,'
      '  VL_COMPRA_CIA = :VL_COMPRA_CIA,'
      '  VL_VENDA = :VL_VENDA,'
      '  IN_DESPESA = :IN_DESPESA,'
      '  IN_MENCIONADO = :IN_MENCIONADO,'
      '  TP_FRETE = :TP_FRETE,'
      '  TP_CNTR = :TP_CNTR,'
      '  VL_INTERVALO_INICIAL = :VL_INTERVALO_INICIAL,'
      '  VL_INTERVALO_FINAL = :VL_INTERVALO_FINAL'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TTAB_FRETE_DESPESA'
      
        '  (CD_TAB_FRETE, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_D' +
        'ESPESA, '
      
        '   CD_TAB_REF, TP_ESTUFAGEM, CODIGO, VL_BASE_DESPESA, VL_COMPRA_' +
        'AG, VL_COMPRA_CIA, '
      
        '   VL_VENDA, IN_DESPESA, IN_MENCIONADO, TP_FRETE, TP_CNTR, VL_IN' +
        'TERVALO_INICIAL, '
      '   VL_INTERVALO_FINAL)'
      'values'
      
        '  (:CD_TAB_FRETE, :CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA, :TP_ORI' +
        'GEM_DESPESA, '
      
        '   :CD_TAB_REF, :TP_ESTUFAGEM, :CODIGO, :VL_BASE_DESPESA, :VL_CO' +
        'MPRA_AG, '
      
        '   :VL_COMPRA_CIA, :VL_VENDA, :IN_DESPESA, :IN_MENCIONADO, :TP_F' +
        'RETE, :TP_CNTR, '
      '   :VL_INTERVALO_INICIAL, :VL_INTERVALO_FINAL)')
    DeleteSQL.Strings = (
      'delete from TTAB_FRETE_DESPESA'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CODIGO = :OLD_CODIGO')
    Left = 129
    Top = 106
  end
  object qry_ult_despesa_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_frete
    SQL.Strings = (
      'SELECT MAX(CODIGO) AS ULTIMO FROM TTAB_FRETE_DESPESA WHERE'
      '  CD_TAB_FRETE=:CD_TAB_FRETE')
    Left = 127
    Top = 181
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end>
    object qry_ult_despesa_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.CODIGO'
      FixedChar = True
      Size = 3
    end
  end
  object qry_lista_iata: TQuery
    CachedUpdates = True
    BeforePost = qry_lista_iataBeforePost
    AfterPost = qry_lista_iata_aplica
    AfterDelete = qry_lista_iata_aplica
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TAB_FRETE, DESC_TAB_FRETE,'
      '   CD_ORIGEM_TAB_FRETE, TP_EMP_FRETE,'
      
        '   (SELECT TP.CD_SIGLA FROM TPORTO TP WHERE TP.CD_PORTO = CD_ORI' +
        'GEM_TAB_FRETE)AP_ORIGEM,'
      
        '   (SELECT TP.NM_PORTO FROM TPORTO TP WHERE TP.CD_PORTO = CD_ORI' +
        'GEM_TAB_FRETE)NM_ORIGEM,'
      
        '   (SELECT TP.CD_SIGLA FROM TPORTO TP WHERE TP.CD_PORTO = CD_DES' +
        'TINO_TAB_FRETE)AP_DESTINO,'
      
        '   (SELECT TP.NM_PORTO FROM TPORTO TP WHERE TP.CD_PORTO = CD_DES' +
        'TINO_TAB_FRETE)NM_DESTINO,'
      '   CD_DESTINO_TAB_FRETE, CD_MOEDA_TAB_FRETE'
      '    FROM TTAB_FRETE'
      '       WHERE TP_EMP_FRETE = '#39'6'#39
      ' ')
    UpdateObject = update_list_iata
    Left = 641
    Top = 10
    object qry_lista_iataCD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE.CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_lista_iataCD_ORIGEM_TAB_FRETE: TStringField
      FieldName = 'CD_ORIGEM_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE.CD_ORIGEM_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_lista_iataCD_DESTINO_TAB_FRETE: TStringField
      FieldName = 'CD_DESTINO_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE.CD_DESTINO_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_lista_iataCD_MOEDA_TAB_FRETE: TStringField
      FieldName = 'CD_MOEDA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE.CD_MOEDA_TAB_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_lista_iataAP_ORIGEM: TStringField
      FieldName = 'AP_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_lista_iataNM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_lista_iataAP_DESTINO: TStringField
      FieldName = 'AP_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_lista_iataNM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_lista_iataLook_nm_moeda: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_moeda'
      LookupDataSet = qry_moeda_broker_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA_TAB_FRETE'
      Size = 8
      Lookup = True
    end
    object qry_lista_iataTP_EMP_FRETE: TStringField
      FieldName = 'TP_EMP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_lista_iataDESC_TAB_FRETE: TStringField
      FieldName = 'DESC_TAB_FRETE'
      FixedChar = True
      Size = 80
    end
  end
  object ds_lista_iata: TDataSource
    DataSet = qry_lista_iata
    Left = 641
    Top = 58
  end
  object qry_item_iata_: TQuery
    CachedUpdates = True
    BeforePost = qry_item_iata_BeforePost
    AfterPost = qry_item_iata_Aplica
    AfterDelete = qry_item_iata_Aplica
    AfterScroll = qry_item_iata_AfterScroll
    OnNewRecord = qry_item_iata_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TAB_FRETE, CD_ITEM_TAB_FRETE, PESO_TAB_FRETE, TP_FRETE' +
        ', TP_ESTUFAGEM,'
      
        '  VOLUME_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRETE' +
        ', CD_TAB_REF,'
      
        '  VL_VENDA_TAB_FRETE, PERC_VENDA_TAB_FRETE, VL_DIFERENCA, VL_COM' +
        'PRA_CIA_ARMADOR'
      '  FROM TTAB_FRETE_ITEM'
      '     WHERE CD_TAB_FRETE =:CD_TAB_FRETE'
      'ORDER BY CD_ITEM_TAB_FRETE '
      ' '
      ' '
      ' ')
    UpdateObject = update_item_iata
    Left = 729
    Top = 10
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end>
    object qry_item_iata_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_TAB_FRETE'
      FixedChar = True
      Size = 6
    end
    object qry_item_iata_CD_ITEM_TAB_FRETE: TStringField
      FieldName = 'CD_ITEM_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_ITEM_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_item_iata_PESO_TAB_FRETE: TFloatField
      FieldName = 'PESO_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.PESO_TAB_FRETE'
    end
    object qry_item_iata_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_item_iata_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_item_iata_VOLUME_TAB_FRETE: TStringField
      FieldName = 'VOLUME_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VOLUME_TAB_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_item_iata_TTIPO_SIMBOLO_TAB_FRETE: TStringField
      FieldName = 'TTIPO_SIMBOLO_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TTIPO_SIMBOLO_TAB_FRETE'
      FixedChar = True
      Size = 15
    end
    object qry_item_iata_VL_COMPRA_TAB_FRETE: TFloatField
      FieldName = 'VL_COMPRA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_TAB_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_item_iata_CD_TAB_REF: TStringField
      FieldName = 'CD_TAB_REF'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_TAB_REF'
      FixedChar = True
      Size = 6
    end
    object qry_item_iata_VL_VENDA_TAB_FRETE: TFloatField
      FieldName = 'VL_VENDA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_VENDA_TAB_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_item_iata_PERC_VENDA_TAB_FRETE: TFloatField
      FieldName = 'PERC_VENDA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.PERC_VENDA_TAB_FRETE'
    end
    object qry_item_iata_VL_DIFERENCA: TFloatField
      FieldName = 'VL_DIFERENCA'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_DIFERENCA'
      DisplayFormat = '0.00'
    end
    object qry_item_iata_VL_COMPRA_CIA_ARMADOR: TFloatField
      FieldName = 'VL_COMPRA_CIA_ARMADOR'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_CIA_ARMADOR'
      DisplayFormat = '0.00'
    end
  end
  object ds_item_iata: TDataSource
    DataSet = qry_item_iata_
    Left = 729
    Top = 58
  end
  object update_item_iata: TUpdateSQL
    ModifySQL.Strings = (
      'update TTAB_FRETE_ITEM'
      'set'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  CD_ITEM_TAB_FRETE = :CD_ITEM_TAB_FRETE,'
      '  PESO_TAB_FRETE = :PESO_TAB_FRETE,'
      '  TP_FRETE = :TP_FRETE,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  VOLUME_TAB_FRETE = :VOLUME_TAB_FRETE,'
      '  TTIPO_SIMBOLO_TAB_FRETE = :TTIPO_SIMBOLO_TAB_FRETE,'
      '  VL_COMPRA_TAB_FRETE = :VL_COMPRA_TAB_FRETE,'
      '  CD_TAB_REF = :CD_TAB_REF,'
      '  VL_VENDA_TAB_FRETE = :VL_VENDA_TAB_FRETE,'
      '  PERC_VENDA_TAB_FRETE = :PERC_VENDA_TAB_FRETE,'
      '  VL_DIFERENCA = :VL_DIFERENCA,'
      '  VL_COMPRA_CIA_ARMADOR = :VL_COMPRA_CIA_ARMADOR'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_ITEM_TAB_FRETE = :OLD_CD_ITEM_TAB_FRETE')
    InsertSQL.Strings = (
      'insert into TTAB_FRETE_ITEM'
      
        '  (CD_TAB_FRETE, CD_ITEM_TAB_FRETE, PESO_TAB_FRETE, TP_FRETE, TP' +
        '_ESTUFAGEM, '
      
        '   VOLUME_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRET' +
        'E, CD_TAB_REF, '
      
        '   VL_VENDA_TAB_FRETE, PERC_VENDA_TAB_FRETE, VL_DIFERENCA, VL_CO' +
        'MPRA_CIA_ARMADOR)'
      'values'
      
        '  (:CD_TAB_FRETE, :CD_ITEM_TAB_FRETE, :PESO_TAB_FRETE, :TP_FRETE' +
        ', :TP_ESTUFAGEM, '
      
        '   :VOLUME_TAB_FRETE, :TTIPO_SIMBOLO_TAB_FRETE, :VL_COMPRA_TAB_F' +
        'RETE, :CD_TAB_REF, '
      
        '   :VL_VENDA_TAB_FRETE, :PERC_VENDA_TAB_FRETE, :VL_DIFERENCA, :V' +
        'L_COMPRA_CIA_ARMADOR)')
    DeleteSQL.Strings = (
      'delete from TTAB_FRETE_ITEM'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_ITEM_TAB_FRETE = :OLD_CD_ITEM_TAB_FRETE')
    Left = 729
    Top = 106
  end
  object update_list_iata: TUpdateSQL
    ModifySQL.Strings = (
      'update TTAB_FRETE'
      'set'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  DESC_TAB_FRETE = :DESC_TAB_FRETE,'
      '  CD_MOEDA_TAB_FRETE = :CD_MOEDA_TAB_FRETE,'
      '  CD_ORIGEM_TAB_FRETE = :CD_ORIGEM_TAB_FRETE,'
      '  CD_DESTINO_TAB_FRETE = :CD_DESTINO_TAB_FRETE,'
      '  TP_EMP_FRETE = :TP_EMP_FRETE'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE')
    InsertSQL.Strings = (
      'insert into TTAB_FRETE'
      
        '  (CD_TAB_FRETE, DESC_TAB_FRETE, CD_MOEDA_TAB_FRETE, CD_ORIGEM_T' +
        'AB_FRETE, '
      '   CD_DESTINO_TAB_FRETE, TP_EMP_FRETE)'
      'values'
      
        '  (:CD_TAB_FRETE, :DESC_TAB_FRETE, :CD_MOEDA_TAB_FRETE, :CD_ORIG' +
        'EM_TAB_FRETE, '
      '   :CD_DESTINO_TAB_FRETE, :TP_EMP_FRETE)')
    DeleteSQL.Strings = (
      'delete from TTAB_FRETE'
      'where'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE')
    Left = 641
    Top = 106
  end
  object qryTpCntr: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP_CNTR,  NM_TP_CNTR   FROM TTP_CNTR')
    Left = 367
    Top = 181
    object qryTpCntrTP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qryTpCntrNM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
      FixedChar = True
    end
  end
end
