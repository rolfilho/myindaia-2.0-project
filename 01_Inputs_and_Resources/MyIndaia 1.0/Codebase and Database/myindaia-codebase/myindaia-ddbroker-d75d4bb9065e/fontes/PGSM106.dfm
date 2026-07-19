object datm_transportador_itl: Tdatm_transportador_itl
  OldCreateOrder = True
  Left = 255
  Top = 178
  Height = 403
  Width = 510
  object ds_transp_itl: TDataSource
    DataSet = qry_transp_itl_
    Left = 36
    Top = 16
  end
  object qry_transp_itl_: TQuery
    CachedUpdates = True
    AfterPost = qry_transp_itl_AfterPost
    AfterDelete = qry_transp_itl_AfterDelete
    AfterScroll = qry_transp_itl_AfterScroll
    OnCalcFields = qry_transp_itl_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TT.CODIGO, TT.DESCRICAO, TT.APELIDO, TT.CD_PAIS, TT.ST_CA' +
        'LCULO_IATA, TT.TP_COMISSAO, TT.CD_IATA_CIA_TRANSP, TT.IN_IRRF_MI' +
        'N,'
      
        '  (SELECT TP.DESCRICAO FROM TPAIS TP WHERE TP.CODIGO = TT.CD_PAI' +
        'S) NM_PAIS, TT.PERC_TARIFA, TT.VL_DEMURRAGE, TT.IN_IRRF_FATURA,'
      
        '   TT.END_CIA_TRANSP, TT.END_COMPL_CIA_TRANSP, TT.NM_HOME_PAGE_C' +
        'IA_TRANSP, TT.CD_MOEDA_DEMURRAGE, TT.DIAS_DEMURRAGE, TT.IN_CALC_' +
        'IR_IATA,'
      
        '    TT.CD_CIDADE,(SELECT TL.DESCRICAO FROM TLOCAL_EMBARQUE TL WH' +
        'ERE TL.CODIGO = TT.CD_CIDADE)NM_CIDADE, TT.NR_ACCOUNT, TT.IN_CAL' +
        'C_IR_OVER,'
      
        '    (SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA ' +
        '= TT.CD_MOEDA_DEMURRAGE)NM_MOEDA,TT.PERC_COMISSAO_CIA_TRANSP, TT' +
        '.IN_CONVERSAO_IATA,'
      
        '    TT.TP_TRANSPORTADOR, TT.TP_TARIFA,TT.CEP_END_VIA_TRANSP,TT.S' +
        'IGLA_CIA_TRANSP, TT.CGC_TRANSPORTADOR, TT.UF, TT.TP_FATURA, TT.T' +
        'X_OBS   FROM TTRANSPORTADOR_ITL TT'
      ''
      'ORDER BY TT.DESCRICAO')
    UpdateObject = UpDate_transp
    Left = 160
    Top = 16
    object qry_transp_itl_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTRANSPORTADOR_ITL.CODIGO'
      Size = 4
    end
    object qry_transp_itl_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTRANSPORTADOR_ITL.DESCRICAO'
      Size = 60
    end
    object qry_transp_itl_APELIDO: TStringField
      FieldName = 'APELIDO'
      Origin = 'TTRANSPORTADOR_ITL.APELIDO'
    end
    object qry_transp_itl_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TTRANSPORTADOR_ITL.CD_PAIS'
      Size = 3
    end
    object qry_transp_itl_CD_IATA_CIA_TRANSP: TStringField
      FieldName = 'CD_IATA_CIA_TRANSP'
      Origin = 'DBBROKER.TTRANSPORTADOR_ITL.CD_IATA_CIA_TRANSP'
      FixedChar = True
      Size = 3
    end
    object qry_transp_itl_END_CIA_TRANSP: TStringField
      FieldName = 'END_CIA_TRANSP'
      Origin = 'DBBROKER.TTRANSPORTADOR_ITL.END_CIA_TRANSP'
      FixedChar = True
      Size = 100
    end
    object qry_transp_itl_END_COMPL_CIA_TRANSP: TStringField
      FieldName = 'END_COMPL_CIA_TRANSP'
      Origin = 'DBBROKER.TTRANSPORTADOR_ITL.END_COMPL_CIA_TRANSP'
      FixedChar = True
      Size = 100
    end
    object qry_transp_itl_NM_HOME_PAGE_CIA_TRANSP: TStringField
      FieldName = 'NM_HOME_PAGE_CIA_TRANSP'
      Origin = 'DBBROKER.TTRANSPORTADOR_ITL.NM_HOME_PAGE_CIA_TRANSP'
      FixedChar = True
      Size = 50
    end
    object qry_transp_itl_CD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      Origin = 'DBBROKER.TTRANSPORTADOR_ITL.CD_CIDADE'
      FixedChar = True
      Size = 4
    end
    object qry_transp_itl_CEP_END_VIA_TRANSP: TStringField
      FieldName = 'CEP_END_VIA_TRANSP'
      Origin = 'DBBROKER.TTRANSPORTADOR_ITL.CEP_END_VIA_TRANSP'
      FixedChar = True
      Size = 8
    end
    object qry_transp_itl_PERC_COMISSAO_CIA_TRANSP: TFloatField
      FieldName = 'PERC_COMISSAO_CIA_TRANSP'
      Origin = 'DBBROKER.TTRANSPORTADOR_ITL.PERC_COMISSAO_CIA_TRANSP'
      DisplayFormat = '0.00'
    end
    object qry_transp_itl_SIGLA_CIA_TRANSP: TStringField
      FieldName = 'SIGLA_CIA_TRANSP'
      Origin = 'DBBROKER.TTRANSPORTADOR_ITL.SIGLA_CIA_TRANSP'
      FixedChar = True
      Size = 3
    end
    object qry_transp_itl_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qry_transp_itl_NM_CIDADE: TStringField
      FieldName = 'NM_CIDADE'
      FixedChar = True
      Size = 50
    end
    object qry_transp_itl_ST_CALCULO_IATA: TStringField
      FieldName = 'ST_CALCULO_IATA'
      FixedChar = True
      Size = 100
    end
    object qry_transp_itl_TP_COMISSAO: TStringField
      FieldName = 'TP_COMISSAO'
      FixedChar = True
      Size = 1
    end
    object qry_transp_itl_TP_TRANSPORTADOR: TStringField
      FieldName = 'TP_TRANSPORTADOR'
      FixedChar = True
      Size = 1
    end
    object qry_transp_itl_calc_tp_transportador: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_transportador'
      Size = 1
      Calculated = True
    end
    object qry_transp_itl_TP_TARIFA: TStringField
      FieldName = 'TP_TARIFA'
      FixedChar = True
      Size = 1
    end
    object qry_transp_itl_PERC_TARIFA: TFloatField
      FieldName = 'PERC_TARIFA'
      DisplayFormat = '0.00'
    end
    object qry_transp_itl_VL_DEMURRAGE: TFloatField
      FieldName = 'VL_DEMURRAGE'
      DisplayFormat = '0.00'
    end
    object qry_transp_itl_CD_MOEDA_DEMURRAGE: TStringField
      FieldName = 'CD_MOEDA_DEMURRAGE'
      FixedChar = True
      Size = 3
    end
    object qry_transp_itl_DIAS_DEMURRAGE: TIntegerField
      FieldName = 'DIAS_DEMURRAGE'
      DisplayFormat = '00'
    end
    object qry_transp_itl_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qry_transp_itl_CGC_TRANSPORTADOR: TStringField
      FieldName = 'CGC_TRANSPORTADOR'
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object qry_transp_itl_UF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qry_transp_itl_NR_ACCOUNT: TStringField
      FieldName = 'NR_ACCOUNT'
      FixedChar = True
      Size = 14
    end
    object qry_transp_itl_IN_IRRF_MIN: TStringField
      FieldName = 'IN_IRRF_MIN'
      FixedChar = True
      Size = 1
    end
    object qry_transp_itl_IN_IRRF_FATURA: TStringField
      FieldName = 'IN_IRRF_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_transp_itl_Look_ir_fatura: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_ir_fatura'
      LookupDataSet = qry_ir_fat_
      LookupKeyFields = 'CD_IR_FAT'
      LookupResultField = 'NM_IR_FAT'
      KeyFields = 'IN_IRRF_FATURA'
      Lookup = True
    end
    object qry_transp_itl_look_ir_min: TStringField
      FieldKind = fkLookup
      FieldName = 'look_ir_min'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_IRRF_MIN'
      Size = 3
      Lookup = True
    end
    object qry_transp_itl_TP_FATURA: TStringField
      FieldName = 'TP_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_transp_itl_IN_CALC_IR_IATA: TStringField
      FieldName = 'IN_CALC_IR_IATA'
      FixedChar = True
      Size = 1
    end
    object qry_transp_itl_IN_CALC_IR_OVER: TStringField
      FieldName = 'IN_CALC_IR_OVER'
      FixedChar = True
      Size = 1
    end
    object qry_transp_itl_calc_in_ir_iata: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_in_ir_iata'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CALC_IR_IATA'
      Size = 3
      Lookup = True
    end
    object qry_transp_itl_calc_in_ir_over: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_in_ir_over'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CALC_IR_OVER'
      Size = 3
      Lookup = True
    end
    object qry_transp_itl_vl_tt_relatorio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'vl_tt_relatorio'
      Calculated = True
    end
    object qry_transp_itl_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      BlobType = ftMemo
    end
    object qry_transp_itl_IN_CONVERSAO_IATA: TStringField
      FieldName = 'IN_CONVERSAO_IATA'
      FixedChar = True
      Size = 1
    end
  end
  object qry_ult_cod_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CODIGO)  ULTIMO'
      'FROM TTRANSPORTADOR_ITL')
    Left = 256
    Top = 16
    object qry_ult_cod_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TTRANSPORTADOR_ITL.CODIGO'
      Size = 4
    end
  end
  object qry_serie_conhec_: TQuery
    CachedUpdates = True
    BeforePost = qry_serie_conhec_BeforePost
    AfterPost = qry_serie_conhec_AfterPost
    AfterDelete = qry_serie_conhec_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TS.CODIGO, TS.CD_SERIE, TS.DT_ABERTURA, TS.CONHEC_INICIAL' +
        ', TS.DIG_INICIAL, TS.DIG_FINAL,'
      
        '   TS.CONHEC_FINAL, TS.IN_INCLUSAO, TS.IN_IATA, TS.QTDE_CONHEC, ' +
        '(SELECT COUNT(TC.NR_CONHECIMENTO)'
      
        '     FROM TCIA_CONHECIMENTOS TC WHERE TC.CODIGO = TS.CODIGO AND ' +
        'TC.CD_SERIE = TS.CD_SERIE'
      '       AND TC.IN_DISPONIVEL = '#39'1'#39') CONHEC_DISP'
      '    FROM TCIA_SERIE TS'
      '    WHERE TS.CODIGO=:CODIGO')
    UpdateObject = UpDate_serie
    Left = 40
    Top = 128
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_serie_conhec_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TCIA_SERIE.CODIGO'
      FixedChar = True
      Size = 4
    end
    object qry_serie_conhec_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'DBBROKER.TCIA_SERIE.DT_ABERTURA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_serie_conhec_CONHEC_INICIAL: TStringField
      FieldName = 'CONHEC_INICIAL'
      Origin = 'DBBROKER.TCIA_SERIE.CONHEC_INICIAL'
      EditMask = '!999-9999-999;1;_'
      FixedChar = True
    end
    object qry_serie_conhec_CONHEC_FINAL: TStringField
      FieldName = 'CONHEC_FINAL'
      Origin = 'DBBROKER.TCIA_SERIE.CONHEC_FINAL'
      EditMask = '!999-9999-999;1;_'
      FixedChar = True
    end
    object qry_serie_conhec_IN_INCLUSAO: TStringField
      FieldName = 'IN_INCLUSAO'
      Origin = 'DBBROKER.TCIA_SERIE.IN_INCLUSAO'
      FixedChar = True
      Size = 1
    end
    object qry_serie_conhec_IN_IATA: TStringField
      FieldName = 'IN_IATA'
      Origin = 'DBBROKER.TCIA_SERIE.IN_IATA'
      OnChange = qry_serie_conhec_IN_IATAChange
      FixedChar = True
      Size = 1
    end
    object qry_serie_conhec_QTDE_CONHEC: TIntegerField
      FieldName = 'QTDE_CONHEC'
      Origin = 'DBBROKER.TCIA_SERIE.QTDE_CONHEC'
      DisplayFormat = '00'
    end
    object qry_serie_conhec_CD_SERIE: TStringField
      FieldName = 'CD_SERIE'
      Origin = 'DBBROKER.TCIA_SERIE.CD_SERIE'
      FixedChar = True
      Size = 4
    end
    object qry_serie_conhec_CONHEC_DISP: TIntegerField
      FieldName = 'CONHEC_DISP'
    end
    object qry_serie_conhec_DIG_INICIAL: TStringField
      FieldName = 'DIG_INICIAL'
      FixedChar = True
      Size = 1
    end
    object qry_serie_conhec_DIG_FINAL: TStringField
      FieldName = 'DIG_FINAL'
      FixedChar = True
      Size = 1
    end
  end
  object ds_serie_conec: TDataSource
    DataSet = qry_serie_conhec_
    Left = 40
    Top = 184
  end
  object qry_ult_serie_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_transp_itl
    SQL.Strings = (
      'SELECT MAX(CD_SERIE) AS ULTIMO FROM TCIA_SERIE '
      '   WHERE CODIGO = :CODIGO')
    Left = 144
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_ult_serie_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TCIA_SERIE.CD_SERIE'
      FixedChar = True
      Size = 4
    end
  end
  object UpDate_transp: TUpdateSQL
    ModifySQL.Strings = (
      'update TTRANSPORTADOR_ITL'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  APELIDO = :APELIDO,'
      '  CD_PAIS = :CD_PAIS,'
      '  CD_IATA_CIA_TRANSP = :CD_IATA_CIA_TRANSP,'
      '  END_CIA_TRANSP = :END_CIA_TRANSP,'
      '  END_COMPL_CIA_TRANSP = :END_COMPL_CIA_TRANSP,'
      '  NM_HOME_PAGE_CIA_TRANSP = :NM_HOME_PAGE_CIA_TRANSP,'
      '  CD_CIDADE = :CD_CIDADE,'
      '  CEP_END_VIA_TRANSP = :CEP_END_VIA_TRANSP,'
      '  PERC_COMISSAO_CIA_TRANSP = :PERC_COMISSAO_CIA_TRANSP,'
      '  SIGLA_CIA_TRANSP = :SIGLA_CIA_TRANSP,'
      '  ST_CALCULO_IATA = :ST_CALCULO_IATA,'
      '  TP_COMISSAO = :TP_COMISSAO,'
      '  TP_TRANSPORTADOR = :TP_TRANSPORTADOR,'
      '  DIAS_DEMURRAGE = :DIAS_DEMURRAGE,'
      '  TP_TARIFA = :TP_TARIFA,'
      '  PERC_TARIFA = :PERC_TARIFA,'
      '  VL_DEMURRAGE = :VL_DEMURRAGE,'
      '  CD_MOEDA_DEMURRAGE = :CD_MOEDA_DEMURRAGE,'
      '  CGC_TRANSPORTADOR = :CGC_TRANSPORTADOR,'
      '  UF = :UF,'
      '  NR_ACCOUNT = :NR_ACCOUNT,'
      '  IN_IRRF_MIN = :IN_IRRF_MIN,'
      '  IN_IRRF_FATURA = :IN_IRRF_FATURA,'
      '  TP_FATURA = :TP_FATURA,'
      '  IN_CALC_IR_IATA = :IN_CALC_IR_IATA,'
      '  IN_CALC_IR_OVER = :IN_CALC_IR_OVER,'
      '  TX_OBS = :TX_OBS,'
      '  IN_CONVERSAO_IATA = :IN_CONVERSAO_IATA'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TTRANSPORTADOR_ITL'
      
        '  (CODIGO, DESCRICAO, APELIDO, CD_PAIS, CD_IATA_CIA_TRANSP, END_' +
        'CIA_TRANSP, '
      
        '   END_COMPL_CIA_TRANSP, NM_HOME_PAGE_CIA_TRANSP, CD_CIDADE, CEP' +
        '_END_VIA_TRANSP, '
      
        '   PERC_COMISSAO_CIA_TRANSP, SIGLA_CIA_TRANSP, ST_CALCULO_IATA, ' +
        'TP_COMISSAO, '
      
        '   TP_TRANSPORTADOR, DIAS_DEMURRAGE, TP_TARIFA, PERC_TARIFA, VL_' +
        'DEMURRAGE, '
      
        '   CD_MOEDA_DEMURRAGE, CGC_TRANSPORTADOR, UF, NR_ACCOUNT, IN_IRR' +
        'F_MIN, '
      
        '   IN_IRRF_FATURA, TP_FATURA, IN_CALC_IR_IATA, IN_CALC_IR_OVER, ' +
        'TX_OBS, '
      '   IN_CONVERSAO_IATA)'
      'values'
      
        '  (:CODIGO, :DESCRICAO, :APELIDO, :CD_PAIS, :CD_IATA_CIA_TRANSP,' +
        ' :END_CIA_TRANSP, '
      
        '   :END_COMPL_CIA_TRANSP, :NM_HOME_PAGE_CIA_TRANSP, :CD_CIDADE, ' +
        ':CEP_END_VIA_TRANSP, '
      
        '   :PERC_COMISSAO_CIA_TRANSP, :SIGLA_CIA_TRANSP, :ST_CALCULO_IAT' +
        'A, :TP_COMISSAO, '
      
        '   :TP_TRANSPORTADOR, :DIAS_DEMURRAGE, :TP_TARIFA, :PERC_TARIFA,' +
        ' :VL_DEMURRAGE, '
      
        '   :CD_MOEDA_DEMURRAGE, :CGC_TRANSPORTADOR, :UF, :NR_ACCOUNT, :I' +
        'N_IRRF_MIN, '
      
        '   :IN_IRRF_FATURA, :TP_FATURA, :IN_CALC_IR_IATA, :IN_CALC_IR_OV' +
        'ER, :TX_OBS, '
      '   :IN_CONVERSAO_IATA)')
    DeleteSQL.Strings = (
      'delete from TTRANSPORTADOR_ITL'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 336
    Top = 80
  end
  object UpDate_serie: TUpdateSQL
    ModifySQL.Strings = (
      'update TCIA_SERIE'
      'set'
      '  CODIGO = :CODIGO,'
      '  CD_SERIE = :CD_SERIE,'
      '  DT_ABERTURA = :DT_ABERTURA,'
      '  CONHEC_INICIAL = :CONHEC_INICIAL,'
      '  CONHEC_FINAL = :CONHEC_FINAL,'
      '  IN_INCLUSAO = :IN_INCLUSAO,'
      '  IN_IATA = :IN_IATA,'
      '  QTDE_CONHEC = :QTDE_CONHEC,'
      '  DIG_INICIAL = :DIG_INICIAL,'
      '  DIG_FINAL = :DIG_FINAL'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  CD_SERIE = :OLD_CD_SERIE')
    InsertSQL.Strings = (
      'insert into TCIA_SERIE'
      
        '  (CODIGO, CD_SERIE, DT_ABERTURA, CONHEC_INICIAL, CONHEC_FINAL, ' +
        'IN_INCLUSAO, '
      '   IN_IATA, QTDE_CONHEC, DIG_INICIAL, DIG_FINAL)'
      'values'
      
        '  (:CODIGO, :CD_SERIE, :DT_ABERTURA, :CONHEC_INICIAL, :CONHEC_FI' +
        'NAL, :IN_INCLUSAO, '
      '   :IN_IATA, :QTDE_CONHEC, :DIG_INICIAL, :DIG_FINAL)')
    DeleteSQL.Strings = (
      'delete from TCIA_SERIE'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  CD_SERIE = :OLD_CD_SERIE')
    Left = 144
    Top = 176
  end
  object qry_var_iata_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CAMPO, NM_VARIAVEL, NM_CAMPO'
      '   FROM TVARIAVEL_IATA')
    Left = 336
    Top = 16
    object qry_var_iata_CD_CAMPO: TStringField
      FieldName = 'CD_CAMPO'
      Origin = 'DBBROKER.TVARIAVEL_IATA.CD_CAMPO'
      FixedChar = True
      Size = 30
    end
    object qry_var_iata_NM_VARIAVEL: TStringField
      FieldName = 'NM_VARIAVEL'
      Origin = 'DBBROKER.TVARIAVEL_IATA.NM_VARIAVEL'
      FixedChar = True
      Size = 3
    end
    object qry_var_iata_NM_CAMPO: TStringField
      FieldName = 'NM_CAMPO'
      Origin = 'DBBROKER.TVARIAVEL_IATA.NM_CAMPO'
      FixedChar = True
      Size = 30
    end
  end
  object ds_var_iata: TDataSource
    DataSet = qry_var_iata_
    Left = 408
    Top = 16
  end
  object qry_notificador_: TQuery
    CachedUpdates = True
    AfterPost = qry_notificador_AfterPost
    AfterDelete = qry_notificador_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT TAN.CD_ARMADOR, TAN.CD_NOTIFICADOR, TN.NM_NOTIFICADOR,'
      
        '  TN.CD_CIDADE,(SELECT TL.DESCRICAO FROM TLOCAL_EMBARQUE TL WHER' +
        'E TL.CODIGO= TN.CD_CIDADE) NM_CIDADE,'
      '  TN.CD_PAIS, TN.END_FONE, TN.NM_CONTATO'
      '   FROM TARMADOR_NOTIFICADOR TAN'
      
        '     LEFT JOIN TNOTIFICADOR TN ON (TN.CD_NOTIFICADOR = TAN.CD_NO' +
        'TIFICADOR)'
      '   WHERE TAN.CD_ARMADOR=:CD_ARMADOR'
      '   ORDER BY'
      '     TN.NM_NOTIFICADOR'
      ' '
      ' ')
    UpdateObject = UpDate_notificador
    Left = 40
    Top = 248
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_ARMADOR'
        ParamType = ptUnknown
      end>
    object qry_notificador_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_notificador_CD_NOTIFICADOR: TStringField
      FieldName = 'CD_NOTIFICADOR'
      FixedChar = True
      Size = 4
    end
    object qry_notificador_NM_NOTIFICADOR: TStringField
      FieldName = 'NM_NOTIFICADOR'
      FixedChar = True
      Size = 50
    end
    object qry_notificador_CD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      FixedChar = True
      Size = 4
    end
    object qry_notificador_NM_CIDADE: TStringField
      DisplayWidth = 30
      FieldName = 'NM_CIDADE'
      FixedChar = True
      Size = 50
    end
    object qry_notificador_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_notificador_END_FONE: TStringField
      FieldName = 'END_FONE'
      FixedChar = True
      Size = 10
    end
    object qry_notificador_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
    end
  end
  object ds_notificador: TDataSource
    DataSet = qry_notificador_
    Left = 40
    Top = 312
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 120
    Top = 320
  end
  object UpDate_notificador: TUpdateSQL
    ModifySQL.Strings = (
      'update TARMADOR_NOTIFICADOR'
      'set'
      '  CD_NOTIFICADOR = :CD_NOTIFICADOR,'
      '  CD_ARMADOR = :CD_ARMADOR'
      'where'
      '  CD_NOTIFICADOR = :OLD_CD_NOTIFICADOR and'
      '  CD_ARMADOR = :OLD_CD_ARMADOR')
    InsertSQL.Strings = (
      'insert into TARMADOR_NOTIFICADOR'
      '  (CD_NOTIFICADOR, CD_ARMADOR)'
      'values'
      '  (:CD_NOTIFICADOR, :CD_ARMADOR)')
    DeleteSQL.Strings = (
      'delete from TARMADOR_NOTIFICADOR'
      'where'
      '  CD_NOTIFICADOR = :OLD_CD_NOTIFICADOR and'
      '  CD_ARMADOR = :OLD_CD_ARMADOR')
    Left = 144
    Top = 248
  end
  object qry_navio_: TQuery
    CachedUpdates = True
    AfterPost = qry_navio_AfterPost
    AfterDelete = qry_navio_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TAV.CD_ARMADOR,  TV.NM_EMBARCACAO, TV.CD_BANDEIRA,TAV.CD_' +
        'VEICULO,'
      
        '  (SELECT TP.NM_PAIS FROM TPAIS_BROKER TP WHERE TP.CD_PAIS = TV.' +
        'CD_BANDEIRA)NM_BANDEIRA'
      ''
      '   FROM TVEICULO_ARMADOR TAV'
      
        '     LEFT JOIN TEMBARCACAO TV ON (TV.CD_EMBARCACAO = TAV.CD_VEIC' +
        'ULO)'
      '   WHERE TAV.CD_ARMADOR=:CD_ARMADOR'
      '   ORDER BY'
      '     TV.NM_EMBARCACAO'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDate_navio
    Left = 336
    Top = 144
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_ARMADOR'
        ParamType = ptUnknown
      end>
    object qry_navio_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_navio_CD_BANDEIRA: TStringField
      FieldName = 'CD_BANDEIRA'
      FixedChar = True
      Size = 3
    end
    object qry_navio_CD_VEICULO: TStringField
      FieldName = 'CD_VEICULO'
      FixedChar = True
      Size = 4
    end
    object qry_navio_NM_BANDEIRA: TStringField
      FieldName = 'NM_BANDEIRA'
      FixedChar = True
      Size = 120
    end
    object qry_navio_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
  end
  object ds_navio: TDataSource
    DataSet = qry_navio_
    Left = 336
    Top = 200
  end
  object UpDate_navio: TUpdateSQL
    ModifySQL.Strings = (
      'update TVEICULO_ARMADOR'
      'set'
      '  CD_VEICULO = :CD_VEICULO,'
      '  CD_ARMADOR = :CD_ARMADOR'
      'where'
      '  CD_VEICULO = :OLD_CD_VEICULO and'
      '  CD_ARMADOR = :OLD_CD_ARMADOR')
    InsertSQL.Strings = (
      'insert into TVEICULO_ARMADOR'
      '  (CD_VEICULO, CD_ARMADOR)'
      'values'
      '  (:CD_VEICULO, :CD_ARMADOR)')
    DeleteSQL.Strings = (
      'delete from TVEICULO_ARMADOR'
      'where'
      '  CD_VEICULO = :OLD_CD_VEICULO and'
      '  CD_ARMADOR = :OLD_CD_ARMADOR')
    Left = 408
    Top = 144
  end
  object qry_ir_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_IR_FAT, NM_IR_FAT'
      'FROM TIR_FAT')
    Left = 344
    Top = 256
    object qry_ir_fat_CD_IR_FAT: TStringField
      FieldName = 'CD_IR_FAT'
      FixedChar = True
      Size = 1
    end
    object qry_ir_fat_NM_IR_FAT: TStringField
      FieldName = 'NM_IR_FAT'
      FixedChar = True
    end
  end
  object qry_yesno_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO, IN_YESNO'
      'FROM TYES_NO')
    Left = 360
    Top = 312
    object qry_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      FixedChar = True
      Size = 1
    end
    object qry_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      FixedChar = True
      Size = 3
    end
    object qry_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
    end
  end
end
