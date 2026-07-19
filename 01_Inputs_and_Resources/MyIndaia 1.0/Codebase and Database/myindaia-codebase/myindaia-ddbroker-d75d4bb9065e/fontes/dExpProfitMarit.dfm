object datm_exp_profit_marit: Tdatm_exp_profit_marit
  OldCreateOrder = False
  Left = 46
  Top = 187
  Height = 539
  Width = 838
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 256
    Top = 8
  end
  object qry_master_: TQuery
    CachedUpdates = True
    BeforePost = qry_master_BeforePost
    AfterPost = qry_master_AfterPost
    AfterDelete = qry_master_AfterDelete
    AfterScroll = qry_master_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      
        ' TM.CD_MASTER,TM.CD_UNID_NEG, TM.CD_PRODUTO, TM.CD_VIA_TRANSP, T' +
        'U.NM_UNID_NEG, TM.VL_CUBAGEM,'
      
        ' TM.NR_MASTER,TM.TARIFA_MASTER, TM.DT_CHEGADA, TM.DT_EMISSAO_DTA' +
        ','
      
        ' TM.TT_FRETE_MASTER, TM.NR_BOOKING, TM.IN_ACCOUNT, TM.TT_FRETE_C' +
        'IA,'
      ' TM.TP_MASTER,TM.TARIFA_CUSTO,TM.CD_TAB_FRETE,'
      ' TM.CD_ARMADOR,TAR.DESCRICAO AS NM_ARMADOR, TAR.DIAS_DEMURRAGE,'
      
        ' (SELECT TPR.NM_PRODUTO FROM TPRODUTO TPR WHERE TPR.CD_PRODUTO=T' +
        'M.CD_PRODUTO) NM_PRODUTO,'
      ' TM.CD_AGENTE, TG.NM_AGENTE, TM.TP_ESTUFAGEM,'
      ' TM.CD_MOEDA,TMO.NM_MOEDA, TMO.AP_MOEDA, TM.TARIFA_CUSTO_CIA,'
      
        ' TM.CD_ORIGEM, TP.NM_PORTO,TM.TT_DESPESA_MASTER,TM.DT_PREV_SAIDA' +
        ', TM.IN_CALC_PROFIT,'
      
        ' TM.CD_ARMAZEM_ATRACACAO, (SELECT TZA.NM_ARMAZEM FROM TARMAZEM T' +
        'ZA WHERE TZA.CD_ARMAZEM = TM.CD_ARMAZEM_ATRACACAO)NM_ATRACACAO,'
      
        ' TM.CD_ARMAZEM_DESCARGA, (SELECT TZD.NM_ARMAZEM FROM TARMAZEM TZ' +
        'D WHERE TZD.CD_ARMAZEM = TM.CD_ARMAZEM_DESCARGA)NM_DESCARGA,'
      ' TM.DT_EMBARQUE,TM.TP_FRETE_MASTER, TM.CD_DESTINO,TPOR.NM_PORTO,'
      ' TM.DT_PREV_CHEGADA,TM.NR_VIAGEM_TRANSBORDO,TM.DT_TRANSBORDO,'
      ' TM.NR_VOO, TM.TEXTO,'
      ' TM.DT_ABERTURA,TM.CHARG_MASTER, TM.GROSS_MASTER, TM.VOL_MASTER,'
      
        ' TM.CD_VEICULO, (SELECT TV.NM_EMBARCACAO FROM TEMBARCACAO TV WHE' +
        'RE TV.CD_EMBARCACAO = TM.CD_VEICULO)NM_VEICULO,'
      
        ' TM.CD_NOTIFICADOR, (SELECT TN.NM_NOTIFICADOR FROM TNOTIFICADOR ' +
        ' TN WHERE TN.CD_NOTIFICADOR = TM.CD_NOTIFICADOR)NM_NOTIFICADOR,'
      
        ' TM.CD_VEIC_TRANSBORDO,(SELECT TVE.NM_EMBARCACAO FROM TEMBARCACA' +
        'O TVE WHERE TVE.CD_EMBARCACAO = TM.CD_VEIC_TRANSBORDO)NM_VEICULO' +
        '_TRANSB,'
      
        ' TM.CD_PORTO_TRANSBORDO,(SELECT TPO.NM_PORTO FROM TPORTO TPO WHE' +
        'RE TPO.CD_PORTO = TM.CD_PORTO_TRANSBORDO)NM_PORTO_TRANSB'
      '  FROM TMASTER AS TM'
      '   LEFT JOIN TMOEDA_BROKER AS TMO'
      '    ON(TMO.CD_MOEDA = TM.CD_MOEDA)'
      '   LEFT JOIN TUNID_NEG TU ON (TU.CD_UNID_NEG = TM.CD_UNID_NEG)'
      ''
      '   LEFT JOIN TTRANSPORTADOR_ITL AS TAR'
      '    ON(TAR.CODIGO = TM.CD_ARMADOR)'
      ''
      '   LEFT JOIN TAGENTE AS TG'
      '   ON(TG.CD_AGENTE = TM.CD_AGENTE)'
      ''
      '   LEFT JOIN TPORTO AS TPOR'
      '   ON(TPOR.CD_PORTO = TM.CD_DESTINO)'
      ''
      '  LEFT JOIN TPORTO AS TP'
      '  ON(TP.CD_PORTO = TM.CD_ORIGEM)'
      ''
      ''
      
        ' WHERE  TM.CD_VIA_TRANSP= '#39'01'#39' AND TM.CD_UNID_NEG=:CD_UNID_NEG  ' +
        ' AND'
      '     TM.CD_PRODUTO=:CD_PRODUTO AND TM.CD_MASTER=:CD_MASTER'
      ''
      '   ORDER BY'
      '      TM.NR_MASTER'
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
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDate_master
    Left = 40
    Top = 72
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
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end>
    object qry_master_Look_nm_frete_master: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_frete_master'
      LookupDataSet = qry_tp_frete_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TP_FRETE_MASTER'
      Size = 15
      Lookup = True
    end
    object qry_master_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_master_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_master_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_master_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      OnChange = qry_master_NR_MASTERChange
      FixedChar = True
      Size = 25
    end
    object qry_master_TARIFA_MASTER: TFloatField
      FieldName = 'TARIFA_MASTER'
      DisplayFormat = '0.00'
    end
    object qry_master_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_master_TT_FRETE_MASTER: TFloatField
      FieldName = 'TT_FRETE_MASTER'
      DisplayFormat = '0.00'
    end
    object qry_master_TP_MASTER: TStringField
      FieldName = 'TP_MASTER'
      FixedChar = True
      Size = 1
    end
    object qry_master_TARIFA_CUSTO: TFloatField
      FieldName = 'TARIFA_CUSTO'
      DisplayFormat = '0.00'
    end
    object qry_master_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_master_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_master_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_master_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_master_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_master_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_master_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qry_master_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_master_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_master_NM_PORTO: TStringField
      FieldName = 'NM_PORTO'
      FixedChar = True
      Size = 50
    end
    object qry_master_DT_PREV_SAIDA: TDateTimeField
      FieldName = 'DT_PREV_SAIDA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_master_IN_CALC_PROFIT: TStringField
      FieldName = 'IN_CALC_PROFIT'
      FixedChar = True
      Size = 1
    end
    object qry_master_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_master_TP_FRETE_MASTER: TStringField
      FieldName = 'TP_FRETE_MASTER'
      FixedChar = True
      Size = 1
    end
    object qry_master_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_master_NM_PORTO_1: TStringField
      FieldName = 'NM_PORTO_1'
      FixedChar = True
      Size = 50
    end
    object qry_master_DT_PREV_CHEGADA: TDateTimeField
      FieldName = 'DT_PREV_CHEGADA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_master_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      FixedChar = True
      Size = 14
    end
    object qry_master_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_master_CHARG_MASTER: TFloatField
      FieldName = 'CHARG_MASTER'
      OnChange = qry_master_CHARG_MASTERChange
      DisplayFormat = '0.00'
    end
    object qry_master_GROSS_MASTER: TFloatField
      FieldName = 'GROSS_MASTER'
      DisplayFormat = '0.00'
    end
    object qry_master_VOL_MASTER: TFloatField
      FieldName = 'VOL_MASTER'
      OnChange = qry_master_VOL_MASTERChange
    end
    object qry_master_TT_DESPESA_MASTER: TFloatField
      FieldName = 'TT_DESPESA_MASTER'
      OnChange = qry_master_TT_DESPESA_MASTERChange
      DisplayFormat = '0.00'
    end
    object qry_master_DT_CHEGADA: TDateTimeField
      FieldName = 'DT_CHEGADA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_master_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_master_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 50
    end
    object qry_master_CD_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'CD_ARMAZEM_ATRACACAO'
      FixedChar = True
      Size = 4
    end
    object qry_master_NM_ATRACACAO: TStringField
      FieldName = 'NM_ATRACACAO'
      FixedChar = True
      Size = 50
    end
    object qry_master_CD_ARMAZEM_DESCARGA: TStringField
      FieldName = 'CD_ARMAZEM_DESCARGA'
      FixedChar = True
      Size = 4
    end
    object qry_master_NM_DESCARGA: TStringField
      FieldName = 'NM_DESCARGA'
      FixedChar = True
      Size = 50
    end
    object qry_master_CD_VEICULO: TStringField
      FieldName = 'CD_VEICULO'
      FixedChar = True
      Size = 4
    end
    object qry_master_NM_VEICULO: TStringField
      FieldName = 'NM_VEICULO'
      FixedChar = True
      Size = 50
    end
    object qry_master_CD_NOTIFICADOR: TStringField
      FieldName = 'CD_NOTIFICADOR'
      FixedChar = True
      Size = 4
    end
    object qry_master_NM_NOTIFICADOR: TStringField
      FieldName = 'NM_NOTIFICADOR'
      FixedChar = True
      Size = 50
    end
    object qry_master_NR_VIAGEM_TRANSBORDO: TStringField
      FieldName = 'NR_VIAGEM_TRANSBORDO'
      FixedChar = True
      Size = 15
    end
    object qry_master_DT_TRANSBORDO: TDateTimeField
      FieldName = 'DT_TRANSBORDO'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_master_CD_VEIC_TRANSBORDO: TStringField
      FieldName = 'CD_VEIC_TRANSBORDO'
      FixedChar = True
      Size = 4
    end
    object qry_master_NM_VEICULO_TRANSB: TStringField
      FieldName = 'NM_VEICULO_TRANSB'
      FixedChar = True
      Size = 50
    end
    object qry_master_CD_PORTO_TRANSBORDO: TStringField
      FieldName = 'CD_PORTO_TRANSBORDO'
      FixedChar = True
      Size = 4
    end
    object qry_master_NM_PORTO_TRANSB: TStringField
      FieldName = 'NM_PORTO_TRANSB'
      FixedChar = True
      Size = 50
    end
    object qry_master_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_master_DIAS_DEMURRAGE: TIntegerField
      FieldName = 'DIAS_DEMURRAGE'
    end
    object qry_master_NR_BOOKING: TStringField
      FieldName = 'NR_BOOKING'
      FixedChar = True
      Size = 30
    end
    object qry_master_IN_ACCOUNT: TStringField
      FieldName = 'IN_ACCOUNT'
      FixedChar = True
      Size = 1
    end
    object qry_master_VL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
      DisplayFormat = '0.00'
    end
    object qry_master_TARIFA_CUSTO_CIA: TFloatField
      FieldName = 'TARIFA_CUSTO_CIA'
      DisplayFormat = '0.00'
    end
    object qry_master_DT_EMISSAO_DTA: TDateTimeField
      FieldName = 'DT_EMISSAO_DTA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_master_TEXTO: TMemoField
      FieldName = 'TEXTO'
      BlobType = ftMemo
    end
    object qry_master_TT_FRETE_CIA: TFloatField
      FieldName = 'TT_FRETE_CIA'
    end
  end
  object ds_master: TDataSource
    DataSet = qry_master_
    Left = 152
    Top = 16
  end
  object UpDate_master: TUpdateSQL
    ModifySQL.Strings = (
      'update TMASTER'
      'set'
      '  CD_MASTER = :CD_MASTER,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  NR_MASTER = :NR_MASTER,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  TP_MASTER = :TP_MASTER,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  DT_EMISSAO_DTA = :DT_EMISSAO_DTA,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  DT_CHEGADA = :DT_CHEGADA,'
      '  CD_ORIGEM = :CD_ORIGEM,'
      '  DT_PREV_SAIDA = :DT_PREV_SAIDA,'
      '  NR_VOO = :NR_VOO,'
      '  CD_DESTINO = :CD_DESTINO,'
      '  DT_PREV_CHEGADA = :DT_PREV_CHEGADA,'
      '  DT_EMBARQUE = :DT_EMBARQUE,'
      '  TT_DESPESA_MASTER = :TT_DESPESA_MASTER,'
      '  DT_ABERTURA = :DT_ABERTURA,'
      '  TP_FRETE_MASTER = :TP_FRETE_MASTER,'
      '  VOL_MASTER = :VOL_MASTER,'
      '  GROSS_MASTER = :GROSS_MASTER,'
      '  CHARG_MASTER = :CHARG_MASTER,'
      '  CD_VEICULO = :CD_VEICULO,'
      '  CD_ARMADOR = :CD_ARMADOR,'
      '  CD_NOTIFICADOR = :CD_NOTIFICADOR,'
      '  CD_VEIC_TRANSBORDO = :CD_VEIC_TRANSBORDO,'
      '  CD_PORTO_TRANSBORDO = :CD_PORTO_TRANSBORDO,'
      '  NR_VIAGEM_TRANSBORDO = :NR_VIAGEM_TRANSBORDO,'
      '  DT_TRANSBORDO = :DT_TRANSBORDO,'
      '  TARIFA_MASTER = :TARIFA_MASTER,'
      '  TT_FRETE_MASTER = :TT_FRETE_MASTER,'
      '  TARIFA_CUSTO = :TARIFA_CUSTO,'
      '  TARIFA_CUSTO_CIA = :TARIFA_CUSTO_CIA,'
      '  CD_ARMAZEM_ATRACACAO = :CD_ARMAZEM_ATRACACAO,'
      '  CD_ARMAZEM_DESCARGA = :CD_ARMAZEM_DESCARGA,'
      '  nr_booking = :nr_booking,'
      '  VL_CUBAGEM = :VL_CUBAGEM,'
      '  IN_CALC_PROFIT = :IN_CALC_PROFIT,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  IN_ACCOUNT = :IN_ACCOUNT,'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  TT_FRETE_CIA = :TT_FRETE_CIA,'
      '  TEXTO = :TEXTO'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_VIA_TRANSP = :OLD_CD_VIA_TRANSP')
    InsertSQL.Strings = (
      'insert into TMASTER'
      
        '  (CD_MASTER, CD_UNID_NEG, CD_PRODUTO, NR_MASTER, CD_VIA_TRANSP,' +
        ' TP_MASTER, '
      
        '   CD_AGENTE, DT_EMISSAO_DTA, CD_MOEDA, DT_CHEGADA, CD_ORIGEM, D' +
        'T_PREV_SAIDA, '
      
        '   NR_VOO, CD_DESTINO, DT_PREV_CHEGADA, DT_EMBARQUE, TT_DESPESA_' +
        'MASTER, '
      
        '   DT_ABERTURA, TP_FRETE_MASTER, VOL_MASTER, GROSS_MASTER, CHARG' +
        '_MASTER, '
      
        '   CD_VEICULO, CD_ARMADOR, CD_NOTIFICADOR, CD_VEIC_TRANSBORDO, C' +
        'D_PORTO_TRANSBORDO, '
      
        '   NR_VIAGEM_TRANSBORDO, DT_TRANSBORDO, TARIFA_MASTER, TT_FRETE_' +
        'MASTER, '
      
        '   TARIFA_CUSTO, TARIFA_CUSTO_CIA, CD_ARMAZEM_ATRACACAO, CD_ARMA' +
        'ZEM_DESCARGA, '
      
        '   nr_booking, VL_CUBAGEM, IN_CALC_PROFIT, TP_ESTUFAGEM, IN_ACCO' +
        'UNT, CD_TAB_FRETE, '
      '   TT_FRETE_CIA, TEXTO)'
      'values'
      
        '  (:CD_MASTER, :CD_UNID_NEG, :CD_PRODUTO, :NR_MASTER, :CD_VIA_TR' +
        'ANSP, :TP_MASTER, '
      
        '   :CD_AGENTE, :DT_EMISSAO_DTA, :CD_MOEDA, :DT_CHEGADA, :CD_ORIG' +
        'EM, :DT_PREV_SAIDA, '
      
        '   :NR_VOO, :CD_DESTINO, :DT_PREV_CHEGADA, :DT_EMBARQUE, :TT_DES' +
        'PESA_MASTER, '
      
        '   :DT_ABERTURA, :TP_FRETE_MASTER, :VOL_MASTER, :GROSS_MASTER, :' +
        'CHARG_MASTER, '
      
        '   :CD_VEICULO, :CD_ARMADOR, :CD_NOTIFICADOR, :CD_VEIC_TRANSBORD' +
        'O, :CD_PORTO_TRANSBORDO, '
      
        '   :NR_VIAGEM_TRANSBORDO, :DT_TRANSBORDO, :TARIFA_MASTER, :TT_FR' +
        'ETE_MASTER, '
      
        '   :TARIFA_CUSTO, :TARIFA_CUSTO_CIA, :CD_ARMAZEM_ATRACACAO, :CD_' +
        'ARMAZEM_DESCARGA, '
      
        '   :nr_booking, :VL_CUBAGEM, :IN_CALC_PROFIT, :TP_ESTUFAGEM, :IN' +
        '_ACCOUNT, '
      '   :CD_TAB_FRETE, :TT_FRETE_CIA, :TEXTO)')
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
  object qry_house_: TQuery
    CachedUpdates = True
    BeforePost = qry_house_BeforePost
    AfterPost = qry_house_AfterPost
    AfterDelete = qry_house_AfterDelete
    AfterScroll = qry_house_AfterScroll
    OnCalcFields = qry_house_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TH.CD_MASTER, TH.NR_MASTER, TH.CD_HOUSE, TH.NR_HOUSE,  TP' +
        '.TP_FRETE, TP.VL_FRETE,'
      
        ' TH.NR_PROCESSO, TP.CD_CLIENTE, TP.IN_ACCOUNT, TP.IN_LIBERADO, T' +
        'P.CD_MOEDA_FRETE,   TP.DT_RECEBIMENTO,'
      
        ' (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRESA ' +
        '= TP.CD_CLIENTE)NM_EMPRESA'
      ''
      ''
      ''
      ''
      ''
      ' FROM THOUSE TH'
      ' LEFT JOIN TPROCESSO TP ON(TP.NR_PROCESSO = TH.NR_PROCESSO)'
      ' WHERE TH.CD_MASTER=:CD_MASTER'
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
      ' ')
    UpdateObject = UpDate_house
    Left = 40
    Top = 184
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end>
    object qry_house_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 10
      Calculated = True
    end
    object qry_house_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_house_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_house_CD_HOUSE: TStringField
      FieldName = 'CD_HOUSE'
      FixedChar = True
    end
    object qry_house_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_house_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 14
    end
    object qry_house_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_house_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_house_IN_ACCOUNT: TStringField
      FieldName = 'IN_ACCOUNT'
      FixedChar = True
      Size = 1
    end
    object qry_house_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      FixedChar = True
      Size = 1
    end
    object qry_house_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_house_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object qry_house_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_house_DT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object ds_house: TDataSource
    DataSet = qry_house_
    Left = 152
    Top = 136
  end
  object UpDate_house: TUpdateSQL
    ModifySQL.Strings = (
      'update THOUSE'
      'set'
      '  CD_MASTER = :CD_MASTER,'
      '  NR_MASTER = :NR_MASTER,'
      '  CD_HOUSE = :CD_HOUSE,'
      '  NR_HOUSE = :NR_HOUSE,'
      '  NR_PROCESSO = :NR_PROCESSO'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_HOUSE = :OLD_CD_HOUSE and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into THOUSE'
      '  (CD_MASTER, NR_MASTER, CD_HOUSE, NR_HOUSE, NR_PROCESSO)'
      'values'
      '  (:CD_MASTER, :NR_MASTER, :CD_HOUSE, :NR_HOUSE, :NR_PROCESSO)')
    DeleteSQL.Strings = (
      'delete from THOUSE'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_HOUSE = :OLD_CD_HOUSE and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 40
    Top = 232
  end
  object qry_item_despesa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select CD_ITEM, NM_ITEM, IN_CPMF from titem'
      'where IN_ATIVO='#39'1'#39' and (CD_VIA_TRANSPORTE= '#39'01'#39' OR'
      ' CD_VIA_TRANSPORTE = '#39'10'#39')'
      ''
      ''
      ''
      ''
      ''
      'ORDER BY NM_ITEM')
    Left = 448
    Top = 72
    object qry_item_despesa_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TITEM.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_item_despesa_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'DBBROKER.TITEM.NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_item_despesa_IN_CPMF: TStringField
      FieldName = 'IN_CPMF'
      Origin = 'DBBROKER.TITEM.IN_CPMF'
      FixedChar = True
      Size = 1
    end
  end
  object qry_ult_master_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_MASTER) AS ULTIMO'
      '   FROM TMASTER'
      '')
    Left = 152
    Top = 80
    object qry_ult_master_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TMASTER.CD_MASTER'
      FixedChar = True
      Size = 15
    end
  end
  object qry_ult_house_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_HOUSE) AS ULTIMO'
      ' FROM THOUSE'
      ' WHERE CD_MASTER=:CD_MASTER'
      '')
    Left = 40
    Top = 288
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end>
    object qry_ult_house_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.THOUSE.CD_HOUSE'
      FixedChar = True
    end
  end
  object qry_tp_frete_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM'
      ' TTP_FRETE')
    Left = 344
    Top = 16
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
      'SELECT CODIGO, DESCRICAO'
      '   FROM TINCOTERMS_VENDA'
      '   ')
    Left = 248
    Top = 64
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
  end
  object qry_base_calc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select '
      '   CD_TP_BASE_CALC_FRETE,'
      '   NM_TP_BASE_CALC_FRETE'
      'from'
      '  TTP_BASE_CALC_FRETE  with(nolock)'
      ' WHERE CD_VIA_TRANSP IN('#39'10'#39','#39'01'#39')')
    Left = 344
    Top = 80
    object qry_base_calc_CD_TP_BASE_CALC_FRETE: TStringField
      FieldName = 'CD_TP_BASE_CALC_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_base_calc_NM_TP_BASE_CALC_FRETE: TStringField
      FieldName = 'NM_TP_BASE_CALC_FRETE'
      FixedChar = True
      Size = 100
    end
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TYES_NO')
    Left = 248
    Top = 120
    object qry_yes_no_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'DBBROKER.TYES_NO.CD_YESNO'
      FixedChar = True
      Size = 1
    end
    object qry_yes_no_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'DBBROKER.TYES_NO.TX_YESNO'
      FixedChar = True
      Size = 3
    end
    object qry_yes_no_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Origin = 'DBBROKER.TYES_NO.IN_YESNO'
    end
  end
  object qry_calc_soma_pesos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      ''
      'SELECT SUM(CAST(TP.CHARGEABLE AS DECIMAL(15,2))) AS CHARGEABLE,'
      '       SUM(TP.QTD_VOLUME) AS QTDE,'
      '       SUM(CAST(TP.VL_PESO_BRUTO AS DECIMAL(15,2))) AS TON,'
      '       SUM(CAST(TP.CUBAGEM AS DECIMAL(15,2))) AS CUBAGEM,'
      '       COUNT(TP.NR_PROCESSO) PROCESSO,'
      '       SUM(CAST(TP.VL_MERCADORIA AS DECIMAL(15,2)))AS MERC'
      '       FROM THOUSE TH, TPROCESSO TP'
      'WHERE TH.CD_MASTER  = :CD_MASTER AND'
      '    TH.NR_PROCESSO = TP.NR_PROCESSO'
      ' '
      ' ')
    Left = 456
    Top = 16
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end>
    object qry_calc_soma_pesos_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
      Origin = 'DBBROKER.TPROCESSO.CHARGEABLE'
    end
    object qry_calc_soma_pesos_QTDE: TFloatField
      FieldName = 'QTDE'
      Origin = 'DBBROKER.TPROCESSO.QTD_VOLUME'
    end
    object qry_calc_soma_pesos_TON: TFloatField
      FieldName = 'TON'
      Origin = 'DBBROKER.TPROCESSO.VL_PESO_BRUTO'
    end
    object qry_calc_soma_pesos_CUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
      Origin = 'DBBROKER.TPROCESSO.CUBAGEM'
    end
    object qry_calc_soma_pesos_PROCESSO: TIntegerField
      FieldName = 'PROCESSO'
      Origin = 'DBBROKER.TPROCESSO.NR_PROCESSO'
    end
    object qry_calc_soma_pesos_MERC: TFloatField
      FieldName = 'MERC'
      Origin = 'DBBROKER.TPROCESSO.VL_MERCADORIA'
    end
  end
  object ds_cal_soma_pesos: TDataSource
    DataSet = qry_calc_soma_pesos_
    Left = 152
    Top = 192
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, TP.NM_PRODUTO, UH.CD_UNID_NEG, TUN.NM_UNID' +
        '_NEG, UH.CD_PRODUTO, UH.IN_ATIVO, UH.IN_DEFAULT,TU.NM_USUARIO  F' +
        'ROM TUSUARIO_HABILITACAO UH'
      'LEFT JOIN TUSUARIO TU ON(TU.CD_USUARIO = UH.CD_USUARIO)'
      'LEFT JOIN TPRODUTO TP ON(TP.CD_PRODUTO = UH.CD_PRODUTO)'
      
        'LEFT JOIN TUNID_NEG TUN ON (TUN.CD_UNID_NEG = UH.CD_UNID_NEG)WHE' +
        'RE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39
      ' ')
    Left = 48
    Top = 16
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
  object qry_pesq_cliente_: TQuery
    AfterScroll = qry_pesq_cliente_AfterScroll
    OnCalcFields = qry_pesq_cliente_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TH.NR_HOUSE, TH.NR_MASTER, TM.CD_MASTER, TP.CD_CLIENTE, T' +
        'M.TP_MASTER, TP.NR_PROCESSO, TM.NR_BOOKING,'
      
        'TM.CD_ORIGEM, (SELECT TPO.CD_SIGLA_CIDADE FROM TPORTO TPO WHERE ' +
        'TPO.CD_PORTO = TM.CD_ORIGEM)SIGLA_ORIGEM,TP.REF_CLIENTE,'
      
        'TM.CD_DESTINO, (SELECT TPOR.CD_SIGLA_CIDADE FROM TPORTO TPOR WHE' +
        'RE TPOR.CD_PORTO = TM.CD_DESTINO)SIGLA_DESTINO,'
      
        'TM.DT_PREV_CHEGADA, (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE W' +
        'HERE TE.CD_EMPRESA = TP.CD_CLIENTE) NM_CLIENTE,'
      
        'TM.CD_ARMADOR, (SELECT T.DESCRICAO FROM TTRANSPORTADOR_ITL T WHE' +
        'RE T.CODIGO = TM.CD_ARMADOR)NM_ARMADOR, TM.DT_EMBARQUE,'
      
        'TM.CD_VEICULO, (SELECT E.NM_EMBARCACAO FROM TEMBARCACAO E WHERE ' +
        'E.CD_EMBARCACAO = TM.CD_VEICULO)NM_VEICULO'
      'FROM THOUSE TH , TMASTER TM, TPROCESSO TP'
      ' WHERE TM.CD_UNID_NEG   = :CD_UNID_NEG'
      '   AND TM.CD_PRODUTO    = :CD_PRODUTO'
      '   AND TM.CD_VIA_TRANSP = '#39'01'#39
      '   AND (TM.CD_ORIGEM    = :CD_ORIGEM  OR :CD_ORIGEM  = '#39#39')'
      '   AND (TM.CD_DESTINO   = :CD_DESTINO OR :CD_DESTINO = '#39#39')'
      '   AND TM.CD_MASTER     = TH.CD_MASTER'
      '   AND TH.NR_PROCESSO   = TP.NR_PROCESSO'
      
        '   AND TP.IN_PEDIDO     IN ('#39'1'#39','#39'3'#39','#39'4'#39')  AND TP.IN_CANCELADO = ' +
        #39'0'#39
      'ORDER BY TM.DT_EMBARQUE DESC, TM.NR_BOOKING'
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
      ' ')
    Left = 48
    Top = 352
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
        Name = 'CD_ORIGEM'
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
        Name = 'CD_DESTINO'
        ParamType = ptUnknown
      end>
    object qry_pesq_cliente_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_pesq_cliente_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_pesq_cliente_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_pesq_cliente_SIGLA_ORIGEM: TStringField
      FieldName = 'SIGLA_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_pesq_cliente_SIGLA_DESTINO: TStringField
      FieldName = 'SIGLA_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_pesq_cliente_DT_PREV_CHEGADA: TDateTimeField
      FieldName = 'DT_PREV_CHEGADA'
    end
    object qry_pesq_cliente_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_pesq_cliente_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_pesq_cliente_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_pesq_cliente_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_pesq_cliente_TP_MASTER: TStringField
      FieldName = 'TP_MASTER'
      FixedChar = True
      Size = 1
    end
    object qry_pesq_cliente_calc_tp_master: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_master'
      Size = 1
      Calculated = True
    end
    object qry_pesq_cliente_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 10
      Calculated = True
    end
    object qry_pesq_cliente_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_pesq_cliente_NR_BOOKING: TStringField
      FieldName = 'NR_BOOKING'
      FixedChar = True
      Size = 30
    end
    object qry_pesq_cliente_REF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      FixedChar = True
    end
    object qry_pesq_cliente_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_pesq_cliente_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 60
    end
    object qry_pesq_cliente_CD_VEICULO: TStringField
      FieldName = 'CD_VEICULO'
      FixedChar = True
      Size = 4
    end
    object qry_pesq_cliente_NM_VEICULO: TStringField
      FieldName = 'NM_VEICULO'
      FixedChar = True
      Size = 40
    end
    object qry_pesq_cliente_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
  end
  object ds_pes_cliente: TDataSource
    DataSet = qry_pesq_cliente_
    Left = 32
    Top = 408
  end
  object qry_busca_proc_: TQuery
    OnCalcFields = qry_busca_proc_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO,TP.CD_TAB_FRETE_VENDA,TP.CD_TAB_FRETE_COMP' +
        'RA  FROM TPROCESSO TP, TSERVICO TS WHERE TP.CD_UNID_NEG =:CD_UNI' +
        'D_NEG AND TP.CD_SERVICO=TS.CD_SERVICO'
      
        '   AND TP.CD_PRODUTO = :CD_PRODUTO  AND TP.CD_MOEDA_FRETE=:CD_MO' +
        'EDA AND TP.CD_ORIGEM =:CD_ORIGEM AND TP.CD_AGENTE=:CD_AGENTE'
      
        '    AND TP.TP_PROCESSO=:TP_PROCESSO AND TP.CD_DESTINO =:CD_DESTI' +
        'NO AND TP.CD_ARMADOR =:CD_ARMADOR'
      
        '     AND TS.CD_VIA_TRANSPORTE = '#39'01'#39' AND TP.NR_PROCESSO NOT IN(S' +
        'ELECT  TH.NR_PROCESSO FROM THOUSE TH WHERE TH.NR_PROCESSO = TP.N' +
        'R_PROCESSO)'
      ''
      ''
      '     ORDER BY CD_TAB_FRETE_VENDA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 560
    Top = 16
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
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_AGENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'TP_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_DESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_ARMADOR'
        ParamType = ptUnknown
      end>
    object qry_busca_proc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_busca_proc_CD_TAB_FRETE_VENDA: TStringField
      FieldName = 'CD_TAB_FRETE_VENDA'
      Origin = 'DBBROKER.TPROCESSO.CD_TAB_FRETE_VENDA'
      FixedChar = True
      Size = 6
    end
    object qry_busca_proc_CD_TAB_FRETE_COMPRA: TStringField
      FieldName = 'CD_TAB_FRETE_COMPRA'
      Origin = 'DBBROKER.TPROCESSO.CD_TAB_FRETE_COMPRA'
      FixedChar = True
      Size = 6
    end
    object qry_busca_proc_calc_nr_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_processo'
      Size = 10
      Calculated = True
    end
  end
  object ds_other_charges: TDataSource
    DataSet = qry_other_charge_
    Left = 552
    Top = 80
  end
  object qry_processo_: TQuery
    CachedUpdates = True
    AfterPost = qry_processo_AfterPost
    AfterDelete = qry_processo_AfterDelete
    AfterScroll = qry_processo_AfterScroll
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.IN_LIBERADO, TP.CD_CLIENTE, TP.CHARGEA' +
        'BLE,TP.VL_RATEIO, TP.VL_OTHER_CHARGE_CUSTO,TP.VL_DESP_MASTER,'
      
        '  TP.QTD_VOLUME, TP.CUBAGEM,  TP.VL_OTHER_CHARGE, TP.VL_FRETE, T' +
        'P.VL_HOUSE, TP.VL_TARIFA_FRETE,ISNULL(TP.IN_ROUTING,'#39'0'#39') AS IN_R' +
        'OUTING,TP.OUTRA_TAXA,TP.VL_TT_VENDA,'
      
        '  (SELECT TN.NM_EMPRESA FROM TEMPRESA_NAC TN WHERE TP.CD_CLIENTE' +
        ' = TN.CD_EMPRESA)NM_EMPRESA,TP.VL_TT_CUSTO,TP.VL_PROFIT_LIQUIDO,'
      
        ' TP.TP_ESTUFAGEM, TP.VL_PESO_BRUTO,TP.CD_MOEDA_FRETE, TP.CD_DESP' +
        'ACHANTE, TP.CD_INCOTERM, TP.TP_FRETE,TP.CD_EMP_EST,TP.VL_RATEIO_' +
        'DESPESA, TP.VL_DIVISAO,TP.CD_TAB_FRETE_VENDA,'
      
        '  (SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA=TP' +
        '.CD_MOEDA_FRETE)NM_MOEDA,TP.VL_PROFIT_AGENTE,TP.VL_PROFIT_BRASIL' +
        ','
      
        '  (SELECT TE.NM_EMPRESA FROM TEMPRESA_EST TE WHERE TE.CD_EMPRESA' +
        '=TP.CD_EMP_EST)NM_EMP_EST,TP.TP_DIVISAO,TP.VL_DESP_BRASIL,'
      
        '  (SELECT TD.NM_COMISSARIA FROM TCOMISSARIA TD WHERE TD.CD_COMIS' +
        'SARIA = TP.CD_DESPACHANTE)NM_COMISSARIA, TP.VL_PROFIT_HOUSE,'
      
        ' (SELECT TPO.NM_PORTO FROM TPORTO TPO WHERE TPO.CD_PORTO = TP.CD' +
        '_DESTINO)NM_DESTINO, TP.CD_DESTINO, TP.VL_OTHER_CHARGE_CC, TP.VL' +
        '_OTHER_CHARGE_CUSTO_EX,'
      
        '  TP.CD_UNID_NEG, TP.CD_PRODUTO, TP.CD_ORIGEM, TP.CD_AGENTE, TP.' +
        'CD_ARMADOR, TP.OUTRA_TAXA_CUSTO,  TP.VL_OVER, TP.CD_SERVICO, TP.' +
        'VL_MLE_MNEG,'
      
        '  TP.VL_REC_AG, TP.VL_REC_BR, TP.VL_TT_PROF_BR, TP.VL_TT_PROF_AG' +
        ', TP.VL_VENDA_BRASIL,TP.VL_DESP_AG, TP.VL_DESP_REAL, TP.IN_AS_AG' +
        'REED,'
      
        '  (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA=TP' +
        '.CD_MOEDA_FRETE)AP_MOEDA,TP.REF_CLIENTE, TP.TP_PROCESSO, TP.IN_A' +
        'CCOUNT,'
      
        '  (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA=TP' +
        '.CD_MOEDA_MLE)AP_MOEDA_MLE, TP.CD_MOEDA_MLE, TP.VL_FAT_COMPLEMEN' +
        'TAR  FROM TPROCESSO TP'
      '    WHERE NR_PROCESSO =:NR_PROCESSO'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
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
      ' '
      ' ')
    UpdateObject = UpDAte_processo
    Left = 152
    Top = 248
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      FixedChar = True
      Size = 1
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
    object qry_processo_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_processo_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      FixedChar = True
      Size = 3
    end
    object qry_processo_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      OnChange = qry_processo_CD_INCOTERMChange
      FixedChar = True
      Size = 3
    end
    object qry_processo_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      OnChange = qry_processo_TP_FRETEChange
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_processo_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qry_processo_NM_EMP_EST: TStringField
      FieldName = 'NM_EMP_EST'
      FixedChar = True
      Size = 60
    end
    object qry_processo_Look_nm_incoterm: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_incoterm'
      LookupDataSet = qry_incoterm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CODIGO'
      KeyFields = 'CD_INCOTERM'
      Size = 3
      Lookup = True
    end
    object qry_processo_Look_nm_tp_frete: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_frete'
      LookupDataSet = qry_tp_frete_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TP_FRETE'
      Size = 10
      Lookup = True
    end
    object qry_processo_VL_OTHER_CHARGE: TFloatField
      FieldName = 'VL_OTHER_CHARGE'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      OnChange = qry_processo_VL_FRETEChange
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_HOUSE: TFloatField
      FieldName = 'VL_HOUSE'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_TARIFA_FRETE: TFloatField
      FieldName = 'VL_TARIFA_FRETE'
      OnChange = qry_processo_VL_TARIFA_FRETEChange
      DisplayFormat = '0.00'
    end
    object qry_processo_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
      DisplayFormat = '0.00'
    end
    object qry_processo_IN_ROUTING: TStringField
      FieldName = 'IN_ROUTING'
      FixedChar = True
      Size = 1
    end
    object qry_processo_VL_RATEIO: TFloatField
      FieldName = 'VL_RATEIO'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_OTHER_CHARGE_CUSTO: TFloatField
      FieldName = 'VL_OTHER_CHARGE_CUSTO'
      DisplayFormat = '0.00'
    end
    object qry_processo_OUTRA_TAXA: TFloatField
      FieldName = 'OUTRA_TAXA'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_RATEIO_DESPESA: TFloatField
      FieldName = 'VL_RATEIO_DESPESA'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_TT_VENDA: TFloatField
      FieldName = 'VL_TT_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_TT_CUSTO: TFloatField
      FieldName = 'VL_TT_CUSTO'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_DESP_MASTER: TFloatField
      FieldName = 'VL_DESP_MASTER'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_DIVISAO: TFloatField
      FieldName = 'VL_DIVISAO'
      OnChange = qry_processo_VL_DIVISAOChange
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_PROFIT_AGENTE: TFloatField
      FieldName = 'VL_PROFIT_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_PROFIT_BRASIL: TFloatField
      FieldName = 'VL_PROFIT_BRASIL'
      OnChange = qry_processo_VL_PROFIT_BRASILChange
      DisplayFormat = '0.00'
    end
    object qry_processo_TP_DIVISAO: TStringField
      FieldName = 'TP_DIVISAO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_VL_DESP_BRASIL: TFloatField
      FieldName = 'VL_DESP_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_PROFIT_LIQUIDO: TFloatField
      FieldName = 'VL_PROFIT_LIQUIDO'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_PROFIT_HOUSE: TFloatField
      FieldName = 'VL_PROFIT_HOUSE'
      DisplayFormat = '0.00'
    end
    object qry_processo_CD_TAB_FRETE_VENDA: TStringField
      FieldName = 'CD_TAB_FRETE_VENDA'
      FixedChar = True
      Size = 5
    end
    object qry_processo_CUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
    end
    object qry_processo_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qry_processo_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_processo_NM_COMISSARIA: TStringField
      FieldName = 'NM_COMISSARIA'
      FixedChar = True
      Size = 50
    end
    object qry_processo_QTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
    end
    object qry_processo_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_processo_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
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
    object qry_processo_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_processo_OUTRA_TAXA_CUSTO: TFloatField
      FieldName = 'OUTRA_TAXA_CUSTO'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_REC_AG: TFloatField
      FieldName = 'VL_REC_AG'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_REC_BR: TFloatField
      FieldName = 'VL_REC_BR'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_TT_PROF_BR: TFloatField
      FieldName = 'VL_TT_PROF_BR'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_TT_PROF_AG: TFloatField
      FieldName = 'VL_TT_PROF_AG'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_VENDA_BRASIL: TFloatField
      FieldName = 'VL_VENDA_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_DESP_AG: TFloatField
      FieldName = 'VL_DESP_AG'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_DESP_REAL: TFloatField
      FieldName = 'VL_DESP_REAL'
      DisplayFormat = '0.00'
    end
    object qry_processo_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_processo_VL_OVER: TFloatField
      FieldName = 'VL_OVER'
      DisplayFormat = '0.00'
    end
    object qry_processo_REF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      FixedChar = True
    end
    object qry_processo_VL_OTHER_CHARGE_CC: TFloatField
      FieldName = 'VL_OTHER_CHARGE_CC'
      DisplayFormat = '0.00'
    end
    object qry_processo_AP_MOEDA_MLE: TStringField
      FieldName = 'AP_MOEDA_MLE'
      FixedChar = True
      Size = 6
    end
    object qry_processo_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      FixedChar = True
      Size = 3
    end
    object qry_processo_TP_PROCESSO: TStringField
      FieldName = 'TP_PROCESSO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_processo_VL_OTHER_CHARGE_CUSTO_EX: TFloatField
      FieldName = 'VL_OTHER_CHARGE_CUSTO_EX'
      DisplayFormat = '0.00'
    end
    object qry_processo_IN_AS_AGREED: TStringField
      FieldName = 'IN_AS_AGREED'
      FixedChar = True
      Size = 1
    end
    object qry_processo_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_FAT_COMPLEMENTAR: TFloatField
      FieldName = 'VL_FAT_COMPLEMENTAR'
      DisplayFormat = '0.00'
    end
    object qry_processo_IN_ACCOUNT: TStringField
      FieldName = 'IN_ACCOUNT'
      FixedChar = True
      Size = 1
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 152
    Top = 304
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
      '  CD_MOEDA_MLE = :CD_MOEDA_MLE,'
      '  VL_MLE_MNEG = :VL_MLE_MNEG,'
      '  CD_MOEDA_FRETE = :CD_MOEDA_FRETE,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  IN_LIBERADO = :IN_LIBERADO,'
      '  VL_PESO_BRUTO = :VL_PESO_BRUTO,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  TP_PROCESSO = :TP_PROCESSO,'
      '  CD_DESPACHANTE = :CD_DESPACHANTE,'
      '  TP_FRETE = :TP_FRETE,'
      '  CD_EMP_EST = :CD_EMP_EST,'
      '  CD_ORIGEM = :CD_ORIGEM,'
      '  CD_DESTINO = :CD_DESTINO,'
      '  CD_TAB_FRETE_VENDA = :CD_TAB_FRETE_VENDA,'
      '  CD_ARMADOR = :CD_ARMADOR,'
      '  IN_ROUTING = :IN_ROUTING,'
      '  QTD_VOLUME = :QTD_VOLUME,'
      '  CUBAGEM = :CUBAGEM,'
      '  CHARGEABLE = :CHARGEABLE,'
      '  VL_TARIFA_FRETE = :VL_TARIFA_FRETE,'
      '  VL_OTHER_CHARGE = :VL_OTHER_CHARGE,'
      '  VL_FRETE = :VL_FRETE,'
      '  VL_HOUSE = :VL_HOUSE,'
      '  VL_RATEIO = :VL_RATEIO,'
      '  VL_OTHER_CHARGE_CUSTO = :VL_OTHER_CHARGE_CUSTO,'
      '  OUTRA_TAXA = :OUTRA_TAXA,'
      '  VL_RATEIO_DESPESA = :VL_RATEIO_DESPESA,'
      '  VL_TT_VENDA = :VL_TT_VENDA,'
      '  VL_TT_CUSTO = :VL_TT_CUSTO,'
      '  VL_DESP_MASTER = :VL_DESP_MASTER,'
      '  VL_PROFIT_AGENTE = :VL_PROFIT_AGENTE,'
      '  VL_PROFIT_BRASIL = :VL_PROFIT_BRASIL,'
      '  VL_DIVISAO = :VL_DIVISAO,'
      '  TP_DIVISAO = :TP_DIVISAO,'
      '  VL_DESP_BRASIL = :VL_DESP_BRASIL,'
      '  VL_PROFIT_LIQUIDO = :VL_PROFIT_LIQUIDO,'
      '  VL_PROFIT_HOUSE = :VL_PROFIT_HOUSE,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  VL_DESP_AG = :VL_DESP_AG,'
      '  VL_OVER = :VL_OVER,'
      '  IN_ACCOUNT = :IN_ACCOUNT,'
      '  OUTRA_TAXA_CUSTO = :OUTRA_TAXA_CUSTO,'
      '  VL_REC_AG = :VL_REC_AG,'
      '  VL_REC_BR = :VL_REC_BR,'
      '  VL_TT_PROF_BR = :VL_TT_PROF_BR,'
      '  VL_TT_PROF_AG = :VL_TT_PROF_AG,'
      '  VL_VENDA_BRASIL = :VL_VENDA_BRASIL,'
      '  VL_DESP_REAL = :VL_DESP_REAL,'
      '  REF_CLIENTE = :REF_CLIENTE,'
      '  VL_OTHER_CHARGE_CUSTO_EX = :VL_OTHER_CHARGE_CUSTO_EX,'
      '  VL_OTHER_CHARGE_CC = :VL_OTHER_CHARGE_CC,'
      '  IN_AS_AGREED = :IN_AS_AGREED,'
      '  VL_FAT_COMPLEMENTAR = :VL_FAT_COMPLEMENTAR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO'
      
        '  (NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_SERVICO,' +
        ' CD_MOEDA_MLE, '
      
        '   VL_MLE_MNEG, CD_MOEDA_FRETE, CD_AGENTE, IN_LIBERADO, VL_PESO_' +
        'BRUTO, '
      
        '   CD_INCOTERM, TP_PROCESSO, CD_DESPACHANTE, TP_FRETE, CD_EMP_ES' +
        'T, CD_ORIGEM, '
      
        '   CD_DESTINO, CD_TAB_FRETE_VENDA, CD_ARMADOR, IN_ROUTING, QTD_V' +
        'OLUME, '
      
        '   CUBAGEM, CHARGEABLE, VL_TARIFA_FRETE, VL_OTHER_CHARGE, VL_FRE' +
        'TE, VL_HOUSE, '
      
        '   VL_RATEIO, VL_OTHER_CHARGE_CUSTO, OUTRA_TAXA, VL_RATEIO_DESPE' +
        'SA, VL_TT_VENDA, '
      
        '   VL_TT_CUSTO, VL_DESP_MASTER, VL_PROFIT_AGENTE, VL_PROFIT_BRAS' +
        'IL, VL_DIVISAO, '
      
        '   TP_DIVISAO, VL_DESP_BRASIL, VL_PROFIT_LIQUIDO, VL_PROFIT_HOUS' +
        'E, TP_ESTUFAGEM, '
      
        '   VL_DESP_AG, VL_OVER, IN_ACCOUNT, OUTRA_TAXA_CUSTO, VL_REC_AG,' +
        ' VL_REC_BR, '
      
        '   VL_TT_PROF_BR, VL_TT_PROF_AG, VL_VENDA_BRASIL, VL_DESP_REAL, ' +
        'REF_CLIENTE, '
      
        '   VL_OTHER_CHARGE_CUSTO_EX, VL_OTHER_CHARGE_CC, IN_AS_AGREED, V' +
        'L_FAT_COMPLEMENTAR)'
      'values'
      
        '  (:NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_CLIENTE, :CD_SER' +
        'VICO, :CD_MOEDA_MLE, '
      
        '   :VL_MLE_MNEG, :CD_MOEDA_FRETE, :CD_AGENTE, :IN_LIBERADO, :VL_' +
        'PESO_BRUTO, '
      
        '   :CD_INCOTERM, :TP_PROCESSO, :CD_DESPACHANTE, :TP_FRETE, :CD_E' +
        'MP_EST, '
      
        '   :CD_ORIGEM, :CD_DESTINO, :CD_TAB_FRETE_VENDA, :CD_ARMADOR, :I' +
        'N_ROUTING, '
      
        '   :QTD_VOLUME, :CUBAGEM, :CHARGEABLE, :VL_TARIFA_FRETE, :VL_OTH' +
        'ER_CHARGE, '
      
        '   :VL_FRETE, :VL_HOUSE, :VL_RATEIO, :VL_OTHER_CHARGE_CUSTO, :OU' +
        'TRA_TAXA, '
      
        '   :VL_RATEIO_DESPESA, :VL_TT_VENDA, :VL_TT_CUSTO, :VL_DESP_MAST' +
        'ER, :VL_PROFIT_AGENTE, '
      
        '   :VL_PROFIT_BRASIL, :VL_DIVISAO, :TP_DIVISAO, :VL_DESP_BRASIL,' +
        ' :VL_PROFIT_LIQUIDO, '
      
        '   :VL_PROFIT_HOUSE, :TP_ESTUFAGEM, :VL_DESP_AG, :VL_OVER, :IN_A' +
        'CCOUNT, '
      
        '   :OUTRA_TAXA_CUSTO, :VL_REC_AG, :VL_REC_BR, :VL_TT_PROF_BR, :V' +
        'L_TT_PROF_AG, '
      
        '   :VL_VENDA_BRASIL, :VL_DESP_REAL, :REF_CLIENTE, :VL_OTHER_CHAR' +
        'GE_CUSTO_EX, '
      '   :VL_OTHER_CHARGE_CC, :IN_AS_AGREED, :VL_FAT_COMPLEMENTAR)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 152
    Top = 360
  end
  object qry_other_charge_: TQuery
    CachedUpdates = True
    BeforePost = qry_other_charge_BeforePost
    AfterPost = qry_other_charge_AfterPost
    BeforeDelete = qry_other_charge_BeforeDelete
    AfterDelete = qry_other_charge_AfterDelete
    AfterScroll = qry_other_charge_AfterScroll
    OnCalcFields = qry_other_charge_CalcFields
    OnNewRecord = qry_other_charge_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_DESP, CD_ITEM, TP_BASE_CALCULO, TP_FRETE,' +
        ' VL_COMPRA_AG, CD_MOEDA,  CD_MOEDA_VENDA, IN_PROFIT, VL_COMPRA_C' +
        'IA,'
      
        '  VL_VENDA, IN_MENCIONADO, IN_DESPESA, VL_BASE_CLI, IN_SOLICITAD' +
        'O, VL_BASE_AG,ISNULL(NR_NOTIFICACAO,'#39'0'#39') AS NR_NOTIFICACAO, CD_F' +
        'RETE,TP_DUE'
      '    FROM TPROCESSO_DESPESAS'
      '   WHERE NR_PROCESSO =:NR_PROCESSO AND'
      '      IN_MENCIONADO='#39'1'#39' AND IN_DESPESA = '#39'4'#39
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
    UpdateObject = UpDAte_charge
    Left = 448
    Top = 128
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_other_charge_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_other_charge_CD_DESP: TStringField
      FieldName = 'CD_DESP'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.CD_DESP'
      FixedChar = True
      Size = 4
    end
    object qry_other_charge_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.CD_ITEM'
      OnChange = qry_other_charge_CD_ITEMChange
      FixedChar = True
      Size = 3
    end
    object qry_other_charge_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.TP_BASE_CALCULO'
      OnChange = qry_other_charge_TP_BASE_CALCULOChange
      FixedChar = True
      Size = 2
    end
    object qry_other_charge_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_VENDA'
      OnChange = qry_other_charge_VL_VENDAChange
      DisplayFormat = '0.000'
    end
    object qry_other_charge_IN_MENCIONADO: TStringField
      FieldName = 'IN_MENCIONADO'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.IN_MENCIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_other_charge_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_other_charge_Look_nm_tp_calc: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_calc'
      LookupDataSet = qry_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_FRETE'
      LookupResultField = 'NM_TP_BASE_CALC_FRETE'
      KeyFields = 'TP_BASE_CALCULO'
      Lookup = True
    end
    object qry_other_charge_Look_nm_item: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_despesa_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 50
      Lookup = True
    end
    object qry_other_charge_IN_DESPESA: TStringField
      FieldName = 'IN_DESPESA'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.IN_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_other_charge_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_COMPRA_AG'
      DisplayFormat = '0.000'
    end
    object qry_other_charge_VL_BASE_CLI: TFloatField
      FieldName = 'VL_BASE_CLI'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_BASE_CLI'
      OnChange = qry_other_charge_TP_BASE_CALCULOChange
      DisplayFormat = '0.000'
    end
    object qry_other_charge_VL_BASE_AG: TFloatField
      FieldName = 'VL_BASE_AG'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_BASE_AG'
      DisplayFormat = '0.000'
    end
    object qry_other_charge_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_other_charge_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.CD_MOEDA_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_other_charge_NR_NOTIFICACAO: TStringField
      FieldName = 'NR_NOTIFICACAO'
      FixedChar = True
      Size = 3
    end
    object qry_other_charge_in_notificacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'in_notificacao'
      Size = 3
      Calculated = True
    end
    object qry_other_charge_CD_FRETE: TStringField
      FieldName = 'CD_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_other_charge_Look_nm_frete: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_frete'
      LookupDataSet = qry_tp_frete_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_FRETE'
      Size = 10
      Lookup = True
    end
    object qry_other_charge_IN_PROFIT: TStringField
      FieldName = 'IN_PROFIT'
      OnChange = qry_other_charge_VL_VENDAChange
      FixedChar = True
      Size = 1
    end
    object qry_other_charge_Look_in_profit: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_in_profit'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_PROFIT'
      Size = 3
      Lookup = True
    end
    object qry_other_charge_VL_COMPRA_CIA: TFloatField
      FieldName = 'VL_COMPRA_CIA'
      DisplayFormat = '0.000'
    end
    object qry_other_charge_TP_DUE: TStringField
      FieldName = 'TP_DUE'
      FixedChar = True
      Size = 1
    end
    object qry_other_charge_Look_nm_due: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_due'
      LookupDataSet = qry_tp_due_
      LookupKeyFields = 'CD_DUE'
      LookupResultField = 'NM_DUE'
      KeyFields = 'TP_DUE'
      Size = 10
      Lookup = True
    end
    object qry_other_charge_IN_SOLICITADO: TStringField
      FieldName = 'IN_SOLICITADO'
      FixedChar = True
      Size = 1
    end
  end
  object qry_ult_despesas_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT MAX(CD_DESP)  AS ULTIMO FROM TPROCESSO_DESPESAS'
      '   WHERE NR_PROCESSO =:NR_PROCESSO'
      ' ')
    Left = 240
    Top = 168
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ult_despesas_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.CD_DESP'
      FixedChar = True
      Size = 4
    end
  end
  object UpDAte_charge: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_DESPESAS'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_DESP = :CD_DESP,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  TP_FRETE = :TP_FRETE,'
      '  VL_COMPRA_AG = :VL_COMPRA_AG,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  CD_MOEDA_VENDA = :CD_MOEDA_VENDA,'
      '  IN_PROFIT = :IN_PROFIT,'
      '  VL_COMPRA_CIA = :VL_COMPRA_CIA,'
      '  VL_VENDA = :VL_VENDA,'
      '  IN_MENCIONADO = :IN_MENCIONADO,'
      '  IN_DESPESA = :IN_DESPESA,'
      '  VL_BASE_CLI = :VL_BASE_CLI,'
      '  VL_BASE_AG = :VL_BASE_AG,'
      '  NR_NOTIFICACAO = :NR_NOTIFICACAO,'
      '  CD_FRETE = :CD_FRETE,'
      '  TP_DUE = :TP_DUE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    InsertSQL.Strings = (
      'insert into TPROCESSO_DESPESAS'
      
        '  (NR_PROCESSO, CD_DESP, CD_ITEM, TP_BASE_CALCULO, TP_FRETE, VL_' +
        'COMPRA_AG, '
      
        '   CD_MOEDA, CD_MOEDA_VENDA, IN_PROFIT, VL_COMPRA_CIA, VL_VENDA,' +
        ' IN_MENCIONADO, '
      
        '   IN_DESPESA, VL_BASE_CLI, VL_BASE_AG, NR_NOTIFICACAO, CD_FRETE' +
        ', TP_DUE)'
      'values'
      
        '  (:NR_PROCESSO, :CD_DESP, :CD_ITEM, :TP_BASE_CALCULO, :TP_FRETE' +
        ', :VL_COMPRA_AG, '
      
        '   :CD_MOEDA, :CD_MOEDA_VENDA, :IN_PROFIT, :VL_COMPRA_CIA, :VL_V' +
        'ENDA, :IN_MENCIONADO, '
      
        '   :IN_DESPESA, :VL_BASE_CLI, :VL_BASE_AG, :NR_NOTIFICACAO, :CD_' +
        'FRETE, '
      '   :TP_DUE)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_DESPESAS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    Left = 448
    Top = 184
  end
  object qry_vl_brasil_: TQuery
    CachedUpdates = True
    BeforePost = qry_vl_brasil_BeforePost
    AfterPost = qry_vl_brasil_AfterPost
    BeforeDelete = qry_vl_brasil_BeforeDelete
    AfterDelete = qry_vl_brasil_AfterDelete
    AfterScroll = qry_vl_brasil_AfterScroll
    OnCalcFields = qry_vl_brasil_CalcFields
    OnNewRecord = qry_vl_brasil_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_DESP, CD_ITEM, TP_BASE_CALCULO,CD_MOEDA, ' +
        'TP_ORIGEM_DESPESA, IN_REPASSA,  VL_COMPRA_AG, CD_MOEDA_VENDA,'
      
        '  VL_VENDA, TP_FRETE, IN_MENCIONADO, IN_SOLICITADO, IN_DESPESA, ' +
        'VL_BASE_CLI, VL_BASE_AG, IN_PROFIT, VL_VENDA_EST, VL_CUSTO_EST, ' +
        'VL_COMPRA_CIA,'
      
        '  ISNULL(NR_NOTIFICACAO,'#39'0'#39') AS NR_NOTIFICACAO  FROM TPROCESSO_D' +
        'ESPESAS'
      '   WHERE NR_PROCESSO =:NR_PROCESSO AND'
      '      IN_MENCIONADO='#39'0'#39' AND IN_DESPESA = '#39'4'#39
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
    UpdateObject = UpDate_vl_brasil
    Left = 336
    Top = 128
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_vl_brasil_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_vl_brasil_CD_DESP: TStringField
      FieldName = 'CD_DESP'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.CD_DESP'
      FixedChar = True
      Size = 4
    end
    object qry_vl_brasil_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.CD_ITEM'
      OnChange = qry_vl_brasil_CD_ITEMChange
      FixedChar = True
      Size = 3
    end
    object qry_vl_brasil_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.TP_BASE_CALCULO'
      OnChange = qry_vl_brasil_TP_BASE_CALCULOChange
      FixedChar = True
      Size = 2
    end
    object qry_vl_brasil_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_vl_brasil_TP_ORIGEM_DESPESA: TStringField
      FieldName = 'TP_ORIGEM_DESPESA'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.TP_ORIGEM_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_vl_brasil_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_VENDA'
      OnChange = qry_vl_brasil_VL_VENDAChange
      DisplayFormat = '0.000'
    end
    object qry_vl_brasil_IN_MENCIONADO: TStringField
      FieldName = 'IN_MENCIONADO'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.IN_MENCIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_vl_brasil_IN_REPASSA: TStringField
      FieldName = 'IN_REPASSA'
      OnChange = qry_vl_brasil_IN_REPASSAChange
      FixedChar = True
      Size = 1
    end
    object qry_vl_brasil_Look_tp_base: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_base'
      LookupDataSet = qry_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_FRETE'
      LookupResultField = 'NM_TP_BASE_CALC_FRETE'
      KeyFields = 'TP_BASE_CALCULO'
      Lookup = True
    end
    object qry_vl_brasil_Look_nm_item: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_despesa_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_vl_brasil_Look_nm_moeda: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_moeda'
      LookupDataSet = qry_moeda_broker_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA_VENDA'
      Size = 5
      Lookup = True
    end
    object qry_vl_brasil_Look_nm_repassa: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_repassa'
      LookupDataSet = qry_repassa_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'IN_REPASSA'
      Size = 8
      Lookup = True
    end
    object qry_vl_brasil_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
      DisplayFormat = '0.000'
    end
    object qry_vl_brasil_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_vl_brasil_IN_DESPESA: TStringField
      FieldName = 'IN_DESPESA'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.IN_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_vl_brasil_VL_BASE_CLI: TFloatField
      FieldName = 'VL_BASE_CLI'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_BASE_CLI'
      OnChange = qry_vl_brasil_TP_BASE_CALCULOChange
      DisplayFormat = '0.000'
    end
    object qry_vl_brasil_VL_BASE_AG: TFloatField
      FieldName = 'VL_BASE_AG'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_BASE_AG'
      DisplayFormat = '0.000'
    end
    object qry_vl_brasil_IN_PROFIT: TStringField
      FieldName = 'IN_PROFIT'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.IN_PROFIT'
      OnChange = qry_vl_brasil_IN_PROFITChange
      FixedChar = True
      Size = 1
    end
    object qry_vl_brasil_Look_in_profit: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_in_profit'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_PROFIT'
      Size = 3
      Lookup = True
    end
    object qry_vl_brasil_VL_VENDA_EST: TFloatField
      FieldName = 'VL_VENDA_EST'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_VENDA_EST'
      DisplayFormat = '0.000'
    end
    object qry_vl_brasil_VL_CUSTO_EST: TFloatField
      FieldName = 'VL_CUSTO_EST'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_CUSTO_EST'
      DisplayFormat = '0.000'
    end
    object qry_vl_brasil_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.CD_MOEDA_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_vl_brasil_NR_NOTIFICACAO: TStringField
      FieldName = 'NR_NOTIFICACAO'
      FixedChar = True
      Size = 3
    end
    object qry_vl_brasil_in_notificacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'in_notificacao'
      Size = 3
      Calculated = True
    end
    object qry_vl_brasil_VL_COMPRA_CIA: TFloatField
      FieldName = 'VL_COMPRA_CIA'
      DisplayFormat = '0.000'
    end
    object qry_vl_brasil_IN_SOLICITADO: TStringField
      FieldName = 'IN_SOLICITADO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_vl_brasil: TDataSource
    DataSet = qry_vl_brasil_
    Left = 336
    Top = 176
  end
  object UpDate_vl_brasil: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_DESPESAS'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_DESP = :CD_DESP,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  TP_ORIGEM_DESPESA = :TP_ORIGEM_DESPESA,'
      '  IN_REPASSA = :IN_REPASSA,'
      '  VL_COMPRA_AG = :VL_COMPRA_AG,'
      '  CD_MOEDA_VENDA = :CD_MOEDA_VENDA,'
      '  VL_VENDA = :VL_VENDA,'
      '  TP_FRETE = :TP_FRETE,'
      '  IN_MENCIONADO = :IN_MENCIONADO,'
      '  IN_DESPESA = :IN_DESPESA,'
      '  VL_BASE_CLI = :VL_BASE_CLI,'
      '  VL_BASE_AG = :VL_BASE_AG,'
      '  IN_PROFIT = :IN_PROFIT,'
      '  VL_VENDA_EST = :VL_VENDA_EST,'
      '  VL_CUSTO_EST = :VL_CUSTO_EST,'
      '  VL_COMPRA_CIA = :VL_COMPRA_CIA,'
      '  NR_NOTIFICACAO = :NR_NOTIFICACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    InsertSQL.Strings = (
      'insert into TPROCESSO_DESPESAS'
      
        '  (NR_PROCESSO, CD_DESP, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_' +
        'ORIGEM_DESPESA, '
      
        '   IN_REPASSA, VL_COMPRA_AG, CD_MOEDA_VENDA, VL_VENDA, TP_FRETE,' +
        ' IN_MENCIONADO, '
      
        '   IN_DESPESA, VL_BASE_CLI, VL_BASE_AG, IN_PROFIT, VL_VENDA_EST,' +
        ' VL_CUSTO_EST, '
      '   VL_COMPRA_CIA, NR_NOTIFICACAO)'
      'values'
      
        '  (:NR_PROCESSO, :CD_DESP, :CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA' +
        ', :TP_ORIGEM_DESPESA, '
      
        '   :IN_REPASSA, :VL_COMPRA_AG, :CD_MOEDA_VENDA, :VL_VENDA, :TP_F' +
        'RETE, :IN_MENCIONADO, '
      
        '   :IN_DESPESA, :VL_BASE_CLI, :VL_BASE_AG, :IN_PROFIT, :VL_VENDA' +
        '_EST, :VL_CUSTO_EST, '
      '   :VL_COMPRA_CIA, :NR_NOTIFICACAO)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_DESPESAS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    Left = 456
    Top = 240
  end
  object qry_moeda_broker_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA, AP_MOEDA FROM '
      '   TMOEDA_BROKER '
      '   ORDER BY NM_MOEDA')
    Left = 152
    Top = 416
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
  object qry_orig_despesa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ORIGEM_DESP, NM_ORIGEM_DESP'
      '  FROM TORIGEM_DESPESA WHERE TP_DESCRICAO = '#39'3'#39
      '  ')
    Left = 240
    Top = 224
    object qry_orig_despesa_CD_ORIGEM_DESP: TStringField
      FieldName = 'CD_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.CD_ORIGEM_DESP'
      FixedChar = True
      Size = 1
    end
    object qry_orig_despesa_NM_ORIGEM_DESP: TStringField
      FieldName = 'NM_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.NM_ORIGEM_DESP'
      FixedChar = True
    end
  end
  object qry_mencionado_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ORIGEM_DESP, NM_ORIGEM_DESP'
      '  FROM TORIGEM_DESPESA WHERE TP_DESCRICAO = '#39'1'#39)
    Left = 240
    Top = 272
    object qry_mencionado_CD_ORIGEM_DESP: TStringField
      FieldName = 'CD_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.CD_ORIGEM_DESP'
      FixedChar = True
      Size = 1
    end
    object qry_mencionado_NM_ORIGEM_DESP: TStringField
      FieldName = 'NM_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.NM_ORIGEM_DESP'
      FixedChar = True
    end
  end
  object qry_repassa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ORIGEM_DESP, NM_ORIGEM_DESP'
      '  FROM TORIGEM_DESPESA WHERE TP_DESCRICAO = '#39'2'#39)
    Left = 240
    Top = 328
    object qry_repassa_CD_ORIGEM_DESP: TStringField
      FieldName = 'CD_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.CD_ORIGEM_DESP'
      FixedChar = True
      Size = 1
    end
    object qry_repassa_NM_ORIGEM_DESP: TStringField
      FieldName = 'NM_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.NM_ORIGEM_DESP'
      FixedChar = True
    end
  end
  object qry_despesa_house_: TQuery
    CachedUpdates = True
    BeforePost = qry_despesa_house_BeforePost
    AfterPost = qry_despesa_house_AfterPost
    BeforeDelete = qry_despesa_house_BeforeDelete
    AfterDelete = qry_despesa_house_AfterDelete
    AfterScroll = qry_despesa_house_AfterScroll
    OnNewRecord = qry_despesa_house_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_DESP, CD_ITEM, TP_BASE_CALCULO,CD_MOEDA, ' +
        'TP_ORIGEM_DESPESA, IN_REPASSA, VL_COMPRA_AG, VL_COMPRA_CIA, CD_F' +
        'RETE,'
      
        '  VL_VENDA, TP_FRETE, IN_MENCIONADO, IN_DESPESA, IN_SOLICITADO, ' +
        'VL_BASE_CLI, VL_BASE_AG, IN_PROFIT, VL_VENDA_EST, VL_CUSTO_EST  ' +
        'FROM TPROCESSO_DESPESAS'
      '   WHERE NR_PROCESSO =:NR_PROCESSO'
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
    UpdateObject = UpDAte_despesa_house
    Left = 568
    Top = 136
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_despesa_house_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_despesa_house_CD_DESP: TStringField
      FieldName = 'CD_DESP'
      FixedChar = True
      Size = 4
    end
    object qry_despesa_house_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      OnChange = qry_despesa_house_CD_ITEMChange
      FixedChar = True
      Size = 3
    end
    object qry_despesa_house_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      OnChange = qry_despesa_house_TP_BASE_CALCULOChange
      FixedChar = True
      Size = 2
    end
    object qry_despesa_house_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_despesa_house_TP_ORIGEM_DESPESA: TStringField
      FieldName = 'TP_ORIGEM_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_house_IN_REPASSA: TStringField
      FieldName = 'IN_REPASSA'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_house_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
      DisplayFormat = '0.000'
    end
    object qry_despesa_house_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      DisplayFormat = '0.000'
    end
    object qry_despesa_house_IN_MENCIONADO: TStringField
      FieldName = 'IN_MENCIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_house_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_house_Look_nm_moeda: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_moeda'
      LookupDataSet = qry_moeda_broker_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA'
      Size = 5
      Lookup = True
    end
    object qry_despesa_house_look_nm_tp_base: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_tp_base'
      LookupDataSet = qry_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_FRETE'
      LookupResultField = 'NM_TP_BASE_CALC_FRETE'
      KeyFields = 'TP_BASE_CALCULO'
      Size = 15
      Lookup = True
    end
    object qry_despesa_house_lokk_nm_repassa: TStringField
      FieldKind = fkLookup
      FieldName = 'lokk_nm_repassa'
      LookupDataSet = qry_repassa_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'IN_REPASSA'
      Size = 10
      Lookup = True
    end
    object qry_despesa_house_Look_nm_item: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_despesa_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_despesa_house_IN_DESPESA: TStringField
      FieldName = 'IN_DESPESA'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.IN_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_house_VL_BASE_CLI: TFloatField
      FieldName = 'VL_BASE_CLI'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_BASE_CLI'
      DisplayFormat = '0.000'
    end
    object qry_despesa_house_VL_BASE_AG: TFloatField
      FieldName = 'VL_BASE_AG'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_BASE_AG'
      OnChange = qry_despesa_house_TP_BASE_CALCULOChange
      DisplayFormat = '0.000'
    end
    object qry_despesa_house_IN_PROFIT: TStringField
      FieldName = 'IN_PROFIT'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.IN_PROFIT'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_house_VL_VENDA_EST: TFloatField
      FieldName = 'VL_VENDA_EST'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_VENDA_EST'
      DisplayFormat = '0.000'
    end
    object qry_despesa_house_VL_CUSTO_EST: TFloatField
      FieldName = 'VL_CUSTO_EST'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_CUSTO_EST'
      DisplayFormat = '0.000'
    end
    object qry_despesa_house_VL_COMPRA_CIA: TFloatField
      FieldName = 'VL_COMPRA_CIA'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.VL_COMPRA_CIA'
      DisplayFormat = '0.000'
    end
    object qry_despesa_house_CD_FRETE: TStringField
      FieldName = 'CD_FRETE'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.CD_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_house_Look_nm_origem: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_origem'
      LookupDataSet = qry_orig_despesa_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'TP_ORIGEM_DESPESA'
      Size = 10
      Lookup = True
    end
    object qry_despesa_house_IN_SOLICITADO: TStringField
      FieldName = 'IN_SOLICITADO'
      Origin = 'DBBROKER.TPROCESSO_DESPESAS.IN_SOLICITADO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_despesa_house: TDataSource
    DataSet = qry_despesa_house_
    Left = 560
    Top = 200
  end
  object UpDAte_despesa_house: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_DESPESAS'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_DESP = :CD_DESP,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  TP_ORIGEM_DESPESA = :TP_ORIGEM_DESPESA,'
      '  IN_REPASSA = :IN_REPASSA,'
      '  VL_COMPRA_AG = :VL_COMPRA_AG,'
      '  VL_COMPRA_CIA = :VL_COMPRA_CIA,'
      '  CD_FRETE = :CD_FRETE,'
      '  VL_VENDA = :VL_VENDA,'
      '  TP_FRETE = :TP_FRETE,'
      '  IN_MENCIONADO = :IN_MENCIONADO,'
      '  IN_DESPESA = :IN_DESPESA,'
      '  VL_BASE_CLI = :VL_BASE_CLI,'
      '  VL_BASE_AG = :VL_BASE_AG,'
      '  IN_PROFIT = :IN_PROFIT,'
      '  VL_VENDA_EST = :VL_VENDA_EST,'
      '  VL_CUSTO_EST = :VL_CUSTO_EST'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    InsertSQL.Strings = (
      'insert into TPROCESSO_DESPESAS'
      
        '  (NR_PROCESSO, CD_DESP, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_' +
        'ORIGEM_DESPESA, '
      
        '   IN_REPASSA, VL_COMPRA_AG, VL_COMPRA_CIA, CD_FRETE, VL_VENDA, ' +
        'TP_FRETE, '
      
        '   IN_MENCIONADO, IN_DESPESA, VL_BASE_CLI, VL_BASE_AG, IN_PROFIT' +
        ', VL_VENDA_EST, '
      '   VL_CUSTO_EST)'
      'values'
      
        '  (:NR_PROCESSO, :CD_DESP, :CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA' +
        ', :TP_ORIGEM_DESPESA, '
      
        '   :IN_REPASSA, :VL_COMPRA_AG, :VL_COMPRA_CIA, :CD_FRETE, :VL_VE' +
        'NDA, :TP_FRETE, '
      
        '   :IN_MENCIONADO, :IN_DESPESA, :VL_BASE_CLI, :VL_BASE_AG, :IN_P' +
        'ROFIT, '
      '   :VL_VENDA_EST, :VL_CUSTO_EST)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_DESPESAS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    Left = 672
    Top = 16
  end
  object qry_despesa_master_: TQuery
    CachedUpdates = True
    BeforePost = qry_despesa_master_BeforePost
    AfterPost = qry_despesa_master_AfterPost
    BeforeDelete = qry_despesa_master_BeforeDelete
    AfterDelete = qry_despesa_master_AfterDelete
    AfterScroll = qry_despesa_master_AfterScroll
    OnNewRecord = qry_despesa_master_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_MASTER, CD_REGISTRO, CD_ITEM, TP_BASE_CALCULO, CD_MOED' +
        'A, CD_FRETE,  TP_RESP_PAGTO, VL_INTERVALO_INICIAL,'
      
        '        TP_ORIGEM_DESPESA, VL_BASE_DESPESA, VL_COMPRA_AG, IN_DES' +
        'PESA, TP_FRETE, VL_INTERVALO_FINAL, VL_CUSTO_EST,'
      
        '        VL_BASE_VENDA, VL_VENDA, CD_MOEDA_VENDA, TP_DUE, IN_SOLI' +
        'CITADO'
      '          FROM TMASTER_DESPESAS   WHERE CD_MASTER=:CD_MASTER'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDAte_despesa_master
    Left = 344
    Top = 224
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end>
    object qry_despesa_master_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      Origin = 'DBBROKER.TMASTER_DESPESAS.CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_despesa_master_CD_REGISTRO: TStringField
      FieldName = 'CD_REGISTRO'
      Origin = 'DBBROKER.TMASTER_DESPESAS.CD_REGISTRO'
      FixedChar = True
      Size = 4
    end
    object qry_despesa_master_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TMASTER_DESPESAS.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_despesa_master_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      Origin = 'DBBROKER.TMASTER_DESPESAS.TP_BASE_CALCULO'
      OnChange = qry_despesa_master_TP_BASE_CALCULOChange
      FixedChar = True
      Size = 2
    end
    object qry_despesa_master_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TMASTER_DESPESAS.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_despesa_master_TP_ORIGEM_DESPESA: TStringField
      FieldName = 'TP_ORIGEM_DESPESA'
      Origin = 'DBBROKER.TMASTER_DESPESAS.TP_ORIGEM_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_master_VL_BASE_DESPESA: TFloatField
      FieldName = 'VL_BASE_DESPESA'
      Origin = 'DBBROKER.TMASTER_DESPESAS.VL_BASE_DESPESA'
      OnChange = qry_despesa_master_VL_BASE_DESPESAChange
      DisplayFormat = '0.00'
    end
    object qry_despesa_master_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
      Origin = 'DBBROKER.TMASTER_DESPESAS.VL_COMPRA_AG'
      DisplayFormat = '0.00'
    end
    object qry_despesa_master_IN_DESPESA: TStringField
      FieldName = 'IN_DESPESA'
      Origin = 'DBBROKER.TMASTER_DESPESAS.IN_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_master_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TMASTER_DESPESAS.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_master_Look_nm_item: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_despesa_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_despesa_master_Look_nm_moeda: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_moeda'
      LookupDataSet = qry_moeda_broker_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA'
      Size = 5
      Lookup = True
    end
    object qry_despesa_master_Look_base_calc: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_base_calc'
      LookupDataSet = qry_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_FRETE'
      LookupResultField = 'NM_TP_BASE_CALC_FRETE'
      KeyFields = 'TP_BASE_CALCULO'
      Size = 15
      Lookup = True
    end
    object qry_despesa_master_Look_origem_desp: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_origem_desp'
      LookupDataSet = qry_orig_despesa_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'TP_ORIGEM_DESPESA'
      Size = 18
      Lookup = True
    end
    object qry_despesa_master_TP_RESP_PAGTO: TStringField
      FieldName = 'TP_RESP_PAGTO'
      Origin = 'DBBROKER.TMASTER_DESPESAS.TP_RESP_PAGTO'
      OnChange = qry_despesa_master_TP_RESP_PAGTOChange
      FixedChar = True
      Size = 1
    end
    object qry_despesa_master_Look_resp_pagto: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_resp_pagto'
      LookupDataSet = qry_resp_pagto_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'TP_RESP_PAGTO'
      Size = 15
      Lookup = True
    end
    object qry_despesa_master_VL_INTERVALO_INICIAL: TFloatField
      FieldName = 'VL_INTERVALO_INICIAL'
      Origin = 'DBBROKER.TMASTER_DESPESAS.VL_INTERVALO_INICIAL'
    end
    object qry_despesa_master_VL_INTERVALO_FINAL: TFloatField
      FieldName = 'VL_INTERVALO_FINAL'
      Origin = 'DBBROKER.TMASTER_DESPESAS.VL_INTERVALO_FINAL'
    end
    object qry_despesa_master_VL_CUSTO_EST: TFloatField
      FieldName = 'VL_CUSTO_EST'
      Origin = 'DBBROKER.TMASTER_DESPESAS.VL_CUSTO_EST'
    end
    object qry_despesa_master_CD_FRETE: TStringField
      FieldName = 'CD_FRETE'
      Origin = 'DBBROKER.TMASTER_DESPESAS.CD_FRETE'
      OnChange = qry_despesa_master_TP_RESP_PAGTOChange
      FixedChar = True
      Size = 1
    end
    object qry_despesa_master_VL_BASE_VENDA: TFloatField
      FieldName = 'VL_BASE_VENDA'
      Origin = 'DBBROKER.TMASTER_DESPESAS.VL_BASE_VENDA'
      OnChange = qry_despesa_master_VL_BASE_VENDAChange
      DisplayFormat = '0.00'
    end
    object qry_despesa_master_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TMASTER_DESPESAS.VL_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_despesa_master_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      Origin = 'DBBROKER.TMASTER_DESPESAS.CD_MOEDA_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_despesa_master_TP_DUE: TStringField
      FieldName = 'TP_DUE'
      Origin = 'DBBROKER.TMASTER_DESPESAS.TP_DUE'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_master_Loo_nm_frete: TStringField
      FieldKind = fkLookup
      FieldName = 'Loo_nm_frete'
      LookupDataSet = qry_tp_frete_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_FRETE'
      Size = 10
      Lookup = True
    end
    object qry_despesa_master_Loo_nm_moeda_venda: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_moeda_venda'
      LookupDataSet = qry_moeda_broker_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA_VENDA'
      Size = 5
      Lookup = True
    end
    object qry_despesa_master_Look_tp_due: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_due'
      LookupDataSet = qry_tp_due_
      LookupKeyFields = 'CD_DUE'
      LookupResultField = 'NM_DUE'
      KeyFields = 'TP_DUE'
      Size = 7
      Lookup = True
    end
    object qry_despesa_master_IN_SOLICITADO: TStringField
      FieldName = 'IN_SOLICITADO'
      Origin = 'DBBROKER.TMASTER_DESPESAS.IN_SOLICITADO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_despesa_master: TDataSource
    DataSet = qry_despesa_master_
    Left = 336
    Top = 280
  end
  object UpDAte_despesa_master: TUpdateSQL
    ModifySQL.Strings = (
      'update TMASTER_DESPESAS'
      'set'
      '  CD_MASTER = :CD_MASTER,'
      '  CD_REGISTRO = :CD_REGISTRO,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  CD_FRETE = :CD_FRETE,'
      '  TP_RESP_PAGTO = :TP_RESP_PAGTO,'
      '  VL_INTERVALO_INICIAL = :VL_INTERVALO_INICIAL,'
      '  TP_ORIGEM_DESPESA = :TP_ORIGEM_DESPESA,'
      '  VL_BASE_DESPESA = :VL_BASE_DESPESA,'
      '  VL_COMPRA_AG = :VL_COMPRA_AG,'
      '  IN_DESPESA = :IN_DESPESA,'
      '  TP_FRETE = :TP_FRETE,'
      '  VL_INTERVALO_FINAL = :VL_INTERVALO_FINAL,'
      '  VL_CUSTO_EST = :VL_CUSTO_EST,'
      '  VL_BASE_VENDA = :VL_BASE_VENDA,'
      '  VL_VENDA = :VL_VENDA,'
      '  CD_MOEDA_VENDA = :CD_MOEDA_VENDA,'
      '  TP_DUE = :TP_DUE'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_REGISTRO = :OLD_CD_REGISTRO')
    InsertSQL.Strings = (
      'insert into TMASTER_DESPESAS'
      
        '  (CD_MASTER, CD_REGISTRO, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, C' +
        'D_FRETE, '
      
        '   TP_RESP_PAGTO, VL_INTERVALO_INICIAL, TP_ORIGEM_DESPESA, VL_BA' +
        'SE_DESPESA, '
      
        '   VL_COMPRA_AG, IN_DESPESA, TP_FRETE, VL_INTERVALO_FINAL, VL_CU' +
        'STO_EST, '
      '   VL_BASE_VENDA, VL_VENDA, CD_MOEDA_VENDA, TP_DUE)'
      'values'
      
        '  (:CD_MASTER, :CD_REGISTRO, :CD_ITEM, :TP_BASE_CALCULO, :CD_MOE' +
        'DA, :CD_FRETE, '
      
        '   :TP_RESP_PAGTO, :VL_INTERVALO_INICIAL, :TP_ORIGEM_DESPESA, :V' +
        'L_BASE_DESPESA, '
      
        '   :VL_COMPRA_AG, :IN_DESPESA, :TP_FRETE, :VL_INTERVALO_FINAL, :' +
        'VL_CUSTO_EST, '
      '   :VL_BASE_VENDA, :VL_VENDA, :CD_MOEDA_VENDA, :TP_DUE)')
    DeleteSQL.Strings = (
      'delete from TMASTER_DESPESAS'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_REGISTRO = :OLD_CD_REGISTRO')
    Left = 456
    Top = 296
  end
  object qry_ult_desp_master_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_pes_cliente
    SQL.Strings = (
      'SELECT MAX(CD_REGISTRO) AS ULTIMO FROM TMASTER_DESPESAS'
      '    WHERE CD_MASTER=:CD_MASTER')
    Left = 328
    Top = 336
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end>
    object qry_ult_desp_master_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TMASTER_DESPESAS.CD_REGISTRO'
      FixedChar = True
      Size = 4
    end
  end
  object qry_proc_cntr_: TQuery
    CachedUpdates = True
    BeforePost = qry_proc_cntr_BeforePost
    AfterPost = qry_proc_cntr_AfterPost
    BeforeDelete = qry_proc_cntr_BeforeDelete
    AfterDelete = qry_proc_cntr_AfterDelete
    AfterScroll = qry_proc_cntr_AfterScroll
    OnNewRecord = qry_proc_cntr_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_CNTR, CODIGO,  TP_CNTR, NR_LACRE, VL_VEND' +
        'A,'
      '   VL_PESO_TON,  TP_FRETE FROM TPROCESSO_CNTR'
      '   WHERE NR_PROCESSO = :NR_PROCESSO'
      ' ')
    UpdateObject = UpDate_cntr
    Left = 680
    Top = 80
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_cntr_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_proc_cntr_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
    end
    object qry_proc_cntr_CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_proc_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      OnChange = qry_proc_cntr_TP_CNTRChange
      FixedChar = True
      Size = 2
    end
    object qry_proc_cntr_NR_LACRE: TStringField
      FieldName = 'NR_LACRE'
      FixedChar = True
    end
    object qry_proc_cntr_VL_PESO_TON: TFloatField
      FieldName = 'VL_PESO_TON'
      OnChange = qry_proc_cntr_VL_PESO_TONChange
      DisplayFormat = '0.000'
    end
    object qry_proc_cntr_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
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
      Lookup = True
    end
    object qry_proc_cntr_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      OnChange = qry_proc_cntr_VL_PESO_TONChange
      DisplayFormat = '0.00'
    end
  end
  object ds_proc_cntr: TDataSource
    DataSet = qry_proc_cntr_
    Left = 664
    Top = 136
  end
  object UpDate_cntr: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_CNTR'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_CNTR = :NR_CNTR,'
      '  CODIGO = :CODIGO,'
      '  TP_CNTR = :TP_CNTR,'
      '  NR_LACRE = :NR_LACRE,'
      '  VL_VENDA = :VL_VENDA,'
      '  VL_PESO_TON = :VL_PESO_TON,'
      '  TP_FRETE = :TP_FRETE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TPROCESSO_CNTR'
      
        '  (NR_PROCESSO, NR_CNTR, CODIGO, TP_CNTR, NR_LACRE, VL_VENDA, VL' +
        '_PESO_TON, '
      '   TP_FRETE)'
      'values'
      
        '  (:NR_PROCESSO, :NR_CNTR, :CODIGO, :TP_CNTR, :NR_LACRE, :VL_VEN' +
        'DA, :VL_PESO_TON, '
      '   :TP_FRETE)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_CNTR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CODIGO = :OLD_CODIGO')
    Left = 672
    Top = 192
  end
  object qry_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP_CNTR, NM_TP_CNTR FROM TTP_CNTR')
    Left = 464
    Top = 352
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
  object qry_master_carga_: TQuery
    CachedUpdates = True
    BeforePost = qry_master_carga_BeforePost
    AfterPost = qry_master_carga_AfterPost
    AfterDelete = qry_master_carga_AfterDelete
    OnNewRecord = qry_master_carga_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_MASTER, CD_CARGA, QTDE, VL_COMPR, VL_LARG, VL_ALT, VL_' +
        'COMPRA, VL_COMPRA_ARMADOR,'
      
        '     PESO_KG, CUBAGEM_VENDA, PESO_VOLUMETRICO, TP_ESTUFAGEM, TP_' +
        'EMBALAGEM,'
      
        '      TP_CNTR, PESO_TON FROM TMASTER_CARGA WHERE CD_MASTER=:CD_M' +
        'ASTER'
      '               AND TP_ESTUFAGEM=:TP_ESTUFAGEM'
      ' '
      ' '
      ' ')
    UpdateObject = UpDAte_master_carga
    Left = 560
    Top = 256
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'TP_ESTUFAGEM'
        ParamType = ptUnknown
      end>
    object qry_master_carga_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_master_carga_CD_CARGA: TStringField
      FieldName = 'CD_CARGA'
      FixedChar = True
      Size = 3
    end
    object qry_master_carga_QTDE: TFloatField
      FieldName = 'QTDE'
      OnChange = qry_master_carga_PESO_TONChange
      DisplayFormat = '00'
    end
    object qry_master_carga_VL_COMPR: TFloatField
      FieldName = 'VL_COMPR'
    end
    object qry_master_carga_VL_LARG: TFloatField
      FieldName = 'VL_LARG'
    end
    object qry_master_carga_VL_ALT: TFloatField
      FieldName = 'VL_ALT'
    end
    object qry_master_carga_PESO_KG: TFloatField
      FieldName = 'PESO_KG'
      DisplayFormat = '0.000'
    end
    object qry_master_carga_CUBAGEM_VENDA: TFloatField
      FieldName = 'CUBAGEM_VENDA'
    end
    object qry_master_carga_PESO_VOLUMETRICO: TFloatField
      FieldName = 'PESO_VOLUMETRICO'
      OnChange = qry_master_carga_PESO_TONChange
      DisplayFormat = '0.000'
    end
    object qry_master_carga_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_master_carga_TP_EMBALAGEM: TStringField
      FieldName = 'TP_EMBALAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_master_carga_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qry_master_carga_PESO_TON: TFloatField
      FieldName = 'PESO_TON'
      OnChange = qry_master_carga_PESO_TONChange
      DisplayFormat = '0.000'
    end
    object qry_master_carga_Look_nm_cntr: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_cntr'
      LookupDataSet = qry_cntr_
      LookupKeyFields = 'TP_CNTR'
      LookupResultField = 'NM_TP_CNTR'
      KeyFields = 'TP_CNTR'
      Lookup = True
    end
    object qry_master_carga_VL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
      Origin = 'DBBROKER.TMASTER_CARGA.VL_COMPRA'
      DisplayFormat = '0.00'
    end
    object qry_master_carga_VL_COMPRA_ARMADOR: TFloatField
      FieldName = 'VL_COMPRA_ARMADOR'
      Origin = 'DBBROKER.TMASTER_CARGA.VL_COMPRA_ARMADOR'
      DisplayFormat = '0.00'
    end
  end
  object ds_master_carga: TDataSource
    DataSet = qry_master_carga_
    Left = 560
    Top = 304
  end
  object UpDAte_master_carga: TUpdateSQL
    ModifySQL.Strings = (
      'update TMASTER_CARGA'
      'set'
      '  CD_MASTER = :CD_MASTER,'
      '  CD_CARGA = :CD_CARGA,'
      '  QTDE = :QTDE,'
      '  VL_COMPR = :VL_COMPR,'
      '  VL_LARG = :VL_LARG,'
      '  VL_ALT = :VL_ALT,'
      '  VL_COMPRA = :VL_COMPRA,'
      '  VL_COMPRA_ARMADOR = :VL_COMPRA_ARMADOR,'
      '  PESO_KG = :PESO_KG,'
      '  CUBAGEM_VENDA = :CUBAGEM_VENDA,'
      '  PESO_VOLUMETRICO = :PESO_VOLUMETRICO,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  TP_EMBALAGEM = :TP_EMBALAGEM,'
      '  TP_CNTR = :TP_CNTR,'
      '  PESO_TON = :PESO_TON'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_CARGA = :OLD_CD_CARGA')
    InsertSQL.Strings = (
      'insert into TMASTER_CARGA'
      
        '  (CD_MASTER, CD_CARGA, QTDE, VL_COMPR, VL_LARG, VL_ALT, VL_COMP' +
        'RA, VL_COMPRA_ARMADOR, '
      
        '   PESO_KG, CUBAGEM_VENDA, PESO_VOLUMETRICO, TP_ESTUFAGEM, TP_EM' +
        'BALAGEM, '
      '   TP_CNTR, PESO_TON)'
      'values'
      
        '  (:CD_MASTER, :CD_CARGA, :QTDE, :VL_COMPR, :VL_LARG, :VL_ALT, :' +
        'VL_COMPRA, '
      
        '   :VL_COMPRA_ARMADOR, :PESO_KG, :CUBAGEM_VENDA, :PESO_VOLUMETRI' +
        'CO, :TP_ESTUFAGEM, '
      '   :TP_EMBALAGEM, :TP_CNTR, :PESO_TON)')
    DeleteSQL.Strings = (
      'delete from TMASTER_CARGA'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_CARGA = :OLD_CD_CARGA')
    Left = 560
    Top = 352
  end
  object qry_processo_carga_: TQuery
    CachedUpdates = True
    BeforePost = qry_processo_carga_BeforePost
    AfterPost = qry_processo_carga_AfterPost
    BeforeDelete = qry_processo_carga_BeforeDelete
    AfterDelete = qry_processo_carga_AfterDelete
    OnNewRecord = qry_processo_carga_NewRecord
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
      '        AND TI.CD_VIA_TRANSP='#39'01'#39' AND TI.TP_ESTUFAGEM ='#39'0'#39)
    UpdateObject = UpDAte_processo_carga
    Left = 672
    Top = 248
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_carga_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object qry_processo_carga_CD_CARGA: TStringField
      FieldName = 'CD_CARGA'
      FixedChar = True
      Size = 3
    end
    object qry_processo_carga_QTDE: TFloatField
      FieldName = 'QTDE'
      OnChange = qry_processo_carga_QTDEChange
      DisplayFormat = '00'
    end
    object qry_processo_carga_VL_COMPR: TFloatField
      FieldName = 'VL_COMPR'
    end
    object qry_processo_carga_VL_LARG: TFloatField
      FieldName = 'VL_LARG'
    end
    object qry_processo_carga_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_processo_carga_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_processo_carga_VL_ALT: TFloatField
      FieldName = 'VL_ALT'
    end
    object qry_processo_carga_PESO_TON: TFloatField
      FieldName = 'PESO_TON'
      OnChange = qry_processo_carga_QTDEChange
      DisplayFormat = '0.000'
    end
    object qry_processo_carga_CUBAGEM_VENDA: TFloatField
      FieldName = 'CUBAGEM_VENDA'
    end
    object qry_processo_carga_PESO_VOLUMETRICO: TFloatField
      FieldName = 'PESO_VOLUMETRICO'
      OnChange = qry_processo_carga_QTDEChange
      DisplayFormat = '0.00'
    end
    object qry_processo_carga_TP_EMBALAGEM: TStringField
      FieldName = 'TP_EMBALAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_processo_carga_NM_EMBALAGEM: TStringField
      FieldName = 'NM_EMBALAGEM'
      FixedChar = True
      Size = 50
    end
  end
  object ds_processo_carga: TDataSource
    DataSet = qry_processo_carga_
    Left = 672
    Top = 304
  end
  object UpDAte_processo_carga: TUpdateSQL
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
    Left = 680
    Top = 360
  end
  object qry_ult_instr_carga_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT MAX(CODIGO)  AS ULTIMO'
      '    FROM TPROCESSO_CNTR WHERE NR_PROCESSO =:NR_PROCESSO')
    Left = 640
    Top = 416
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ult_instr_carga_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROCESSO_CNTR.CODIGO'
      FixedChar = True
      Size = 3
    end
  end
  object qry_resp_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ORIGEM_DESP, NM_ORIGEM_DESP'
      '  FROM TORIGEM_DESPESA WHERE TP_DESCRICAO = '#39'0'#39
      '  ')
    Left = 472
    Top = 408
    object qry_resp_pagto_CD_ORIGEM_DESP: TStringField
      FieldName = 'CD_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.CD_ORIGEM_DESP'
      FixedChar = True
      Size = 1
    end
    object qry_resp_pagto_NM_ORIGEM_DESP: TStringField
      FieldName = 'NM_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.NM_ORIGEM_DESP'
      FixedChar = True
    end
  end
  object qry_nr_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      ''
      'SELECT TPC.NR_PROCESSO, '
      
        '(SELECT COUNT(TP.NR_PROCESSO) FROM TPROCESSO_CNTR TP WHERE NR_PR' +
        'OCESSO = :NR_PROCESSO'
      
        '  AND TP.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.' +
        'TP_PESO = '#39'1'#39'))CNTR20,'
      ''
      
        '(SELECT COUNT(TP.NR_PROCESSO) FROM TPROCESSO_CNTR TP WHERE NR_PR' +
        'OCESSO = :NR_PROCESSO'
      
        '  AND TP.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.' +
        'TP_PESO = '#39'2'#39'))CNTR40'
      ''
      ' FROM TPROCESSO_CNTR TPC WHERE TPC.NR_PROCESSO = :NR_PROCESSO')
    Left = 568
    Top = 416
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_nr_cntr_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_nr_cntr_CNTR20: TIntegerField
      FieldName = 'CNTR20'
    end
    object qry_nr_cntr_CNTR40: TIntegerField
      FieldName = 'CNTR40'
    end
  end
  object sp_atz_status_solic_pagto_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_status_solic_pagto_ag'
    Left = 264
    Top = 416
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
  object qry_tp_due_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTP_DUE'
      ' WHERE TP_DUE = '#39'3'#39' ')
    Left = 744
    Top = 72
    object qry_tp_due_CD_DUE: TStringField
      FieldName = 'CD_DUE'
      Origin = 'DBBROKER.TTP_DUE.CD_DUE'
      FixedChar = True
      Size = 1
    end
    object qry_tp_due_NM_DUE: TStringField
      FieldName = 'NM_DUE'
      Origin = 'DBBROKER.TTP_DUE.NM_DUE'
      FixedChar = True
      Size = 15
    end
    object qry_tp_due_TP_DUE: TStringField
      FieldName = 'TP_DUE'
      Origin = 'DBBROKER.TTP_DUE.TP_DUE'
      FixedChar = True
      Size = 1
    end
  end
  object qry_rel_pre_alerta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        '  SELECT TH.CD_MASTER, TH.CD_HOUSE, TH.NR_PROCESSO, TH.NR_MASTER' +
        ', TH.NR_HOUSE,'
      
        '   TM.CD_CIA_TRANSP, TM.NR_VOO, TM.DT_EMBARQUE, TM.DT_PREV_CHEGA' +
        'DA , TP.CD_EMP_EST, TP.REF_CLIENTE, TP.CD_DESPACHANTE,'
      
        '   TP.CD_INCOTERM, TP.CHARGEABLE, TP.VL_PESO_BRUTO, TP.QTD_VOLUM' +
        'E, TP.CUBAGEM,   TM.DT_PREV_SAIDA,'
      
        '   TP.CD_ORIGEM, TOR.NM_PORTO AS NM_ORIGEM, TOR.CD_SIGLA_CIDADE ' +
        'AS SIGLA_ORIGEM,'
      
        '   TP.CD_DESTINO, TDE.NM_PORTO AS NM_DESTINO, TDE.CD_SIGLA_CIDAD' +
        'E AS SIGLA_DESTINO,'
      
        '   TM.CD_CIA_TRANSP,(SELECT TC.DESCRICAO FROM TTRANSPORTADOR_ITL' +
        ' TC WHERE TC.CODIGO = TM.CD_ARMADOR)NM_ARMADOR,'
      
        '   (SELECT TE.NM_EMPRESA FROM TEMPRESA_EST TE WHERE TE.CD_EMPRES' +
        'A = TP.CD_EMP_EST)NM_EXP,'
      
        '   TP.CD_CLIENTE, (SELECT TN.NM_EMPRESA FROM TEMPRESA_NAC TN WHE' +
        'RE TN.CD_EMPRESA = TP.CD_CLIENTE)NM_CLIENTE,'
      
        '   (SELECT TCO.NM_COMISSARIA FROM TCOMISSARIA TCO WHERE TCO.CD_C' +
        'OMISSARIA = TP.CD_DESPACHANTE)NM_COMISSARIA,'
      
        '   TM.CD_VEICULO, (SELECT TV.NM_EMBARCACAO FROM TEMBARCACAO TV W' +
        'HERE TV.CD_EMBARCACAO = TM.CD_VEICULO)NM_NAVIO,'
      
        '   TP.CD_UNID_NEG, TU.NM_UNID_NEG, TU.CGC_UNID_NEG, TU.NR_FONE A' +
        'S FONE_UNID, TU.NR_FAX1 AS FAX_UNID'
      '   FROM THOUSE TH'
      '   LEFT JOIN TMASTER TM ON (TM.CD_MASTER = TH.CD_MASTER)'
      '   LEFT JOIN TPROCESSO TP ON (TP.NR_PROCESSO = TH.NR_PROCESSO)'
      '   LEFT JOIN TPORTO TOR ON (TOR.CD_PORTO = TP.CD_ORIGEM)'
      '   LEFT JOIN TPORTO TDE ON (TDE.CD_PORTO = TP.CD_DESTINO)'
      '   LEFT JOIN TUNID_NEG TU ON (TU.CD_UNID_NEG = TP.CD_UNID_NEG)'
      
        '   WHERE TH.CD_MASTER =:CD_MASTER AND TH.CD_HOUSE =:CD_HOUSE AND' +
        ' TH.NR_PROCESSO = :NR_PROCESSO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 323
    Top = 384
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_HOUSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_rel_pre_alerta_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_rel_pre_alerta_CD_HOUSE: TStringField
      FieldName = 'CD_HOUSE'
      FixedChar = True
    end
    object qry_rel_pre_alerta_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 14
    end
    object qry_rel_pre_alerta_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_rel_pre_alerta_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_rel_pre_alerta_CD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pre_alerta_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      FixedChar = True
      Size = 14
    end
    object qry_rel_pre_alerta_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object qry_rel_pre_alerta_DT_PREV_CHEGADA: TDateTimeField
      FieldName = 'DT_PREV_CHEGADA'
    end
    object qry_rel_pre_alerta_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_rel_pre_alerta_REF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      FixedChar = True
    end
    object qry_rel_pre_alerta_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      FixedChar = True
      Size = 3
    end
    object qry_rel_pre_alerta_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_pre_alerta_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
    end
    object qry_rel_pre_alerta_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qry_rel_pre_alerta_QTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
    end
    object qry_rel_pre_alerta_CUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
    end
    object qry_rel_pre_alerta_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pre_alerta_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pre_alerta_SIGLA_ORIGEM: TStringField
      FieldName = 'SIGLA_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_pre_alerta_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pre_alerta_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pre_alerta_SIGLA_DESTINO: TStringField
      FieldName = 'SIGLA_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_rel_pre_alerta_CD_CIA_TRANSP_1: TStringField
      FieldName = 'CD_CIA_TRANSP_1'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pre_alerta_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 60
    end
    object qry_rel_pre_alerta_NM_EXP: TStringField
      FieldName = 'NM_EXP'
      FixedChar = True
      Size = 60
    end
    object qry_rel_pre_alerta_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_rel_pre_alerta_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pre_alerta_NM_COMISSARIA: TStringField
      FieldName = 'NM_COMISSARIA'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pre_alerta_CD_VEICULO: TStringField
      FieldName = 'CD_VEICULO'
      FixedChar = True
      Size = 4
    end
    object qry_rel_pre_alerta_NM_NAVIO: TStringField
      FieldName = 'NM_NAVIO'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pre_alerta_calc_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_usuario'
      Size = 50
      Calculated = True
    end
    object qry_rel_pre_alerta_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 12
      Calculated = True
    end
    object qry_rel_pre_alerta_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_rel_pre_alerta_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_rel_pre_alerta_CGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      FixedChar = True
      Size = 14
    end
    object qry_rel_pre_alerta_FONE_UNID: TStringField
      FieldName = 'FONE_UNID'
      FixedChar = True
    end
    object qry_rel_pre_alerta_FAX_UNID: TStringField
      FieldName = 'FAX_UNID'
      FixedChar = True
    end
    object qry_rel_pre_alerta_DT_PREV_SAIDA: TDateTimeField
      FieldName = 'DT_PREV_SAIDA'
    end
  end
  object pp_Pre_alerta: TppBDEPipeline
    DataSource = ds_pre_alerta
    UserName = 'Pre_alerta'
    Left = 400
    Top = 409
  end
  object ds_pre_alerta: TDataSource
    DataSet = qry_rel_pre_alerta_
    Left = 400
    Top = 360
  end
  object pp_notificacao: TppBDEPipeline
    DataSource = ds_notificacao
    UserName = '_notificacao'
    Left = 752
    Top = 128
  end
  object ds_notificacao: TDataSource
    DataSet = qry_notificacao_
    Left = 752
    Top = 176
  end
  object qry_notificacao_: TQuery
    OnCalcFields = qry_notificacao_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  P.NR_PROCESSO, I.NR_SOLICITACAO, I.NR_LANCAMENTO, I.CD_I' +
        'TEM, I.CD_MOEDA_VENDA, I.VL_VENDA, I.VL_SOLICITADO,'
      
        '   P.CD_CLIENTE, E.NM_EMPRESA, E.END_EMPRESA, E.END_NUMERO, E.EN' +
        'D_CIDADE, E.END_BAIRRO, E.END_COMPL,'
      '   E.END_UF, E.END_CEP, CASE CD_TIPO_PESSOA'
      '                             WHEN '#39'0'#39' THEN CPF_EMPRESA'
      '                                 ELSE CGC_EMPRESA'
      
        '                             END AS CGC_CPF_EMRPESA, E.NR_TELEFO' +
        'NE, E.NR_FAX, P.REF_CLIENTE,'
      ''
      
        '   (SELECT IT.NM_ITEM FROM TITEM IT WHERE IT.CD_ITEM = I.CD_ITEM' +
        ') NM_ITEM'
      ''
      '   FROM TNUMERARIO_NOTIFICA_ITEM I, TPROCESSO P'
      '    LEFT JOIN TEMPRESA_NAC E ON (P.CD_CLIENTE = E.CD_EMPRESA)'
      '    WHERE P.NR_PROCESSO =:NR_PROCESSO'
      '     AND P.NR_PROCESSO = I.NR_PROCESSO'
      '     AND I.NR_SOLICITACAO = :NR_SOLICITACAO'
      ' '
      ''
      ' '
      ''
      ''
      ' ')
    Left = 752
    Top = 232
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
      end>
    object qry_notificacao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_notificacao_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      FixedChar = True
      Size = 3
    end
    object qry_notificacao_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_notificacao_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_notificacao_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_notificacao_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qry_notificacao_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
    end
    object qry_notificacao_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_notificacao_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_notificacao_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_notificacao_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_notificacao_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_notificacao_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_notificacao_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
      Size = 50
    end
    object qry_notificacao_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_notificacao_END_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_notificacao_CGC_CPF_EMRPESA: TStringField
      FieldName = 'CGC_CPF_EMRPESA'
      FixedChar = True
      Size = 14
    end
    object qry_notificacao_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_notificacao_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qry_notificacao_REF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      FixedChar = True
    end
    object qry_notificacao_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_notificacao_calc_nr_master: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_master'
      Calculated = True
    end
    object qry_notificacao_calc_nr_house: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_house'
      Calculated = True
    end
    object qry_notificacao_calc_nm_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Size = 50
      Calculated = True
    end
    object qry_notificacao_calc_dt_embarque: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'calc_dt_embarque'
      Calculated = True
    end
    object qry_notificacao_calc_end_empresa: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_empresa'
      Size = 200
      Calculated = True
    end
    object qry_notificacao_Look_ap_moeda: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_ap_moeda'
      LookupDataSet = qry_moeda_broker_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA_VENDA'
      Size = 8
      Lookup = True
    end
    object qry_notificacao_calc_tarifa_moeda: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_tarifa_moeda'
      Calculated = True
    end
    object qry_notificacao_calc_nm_navio: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_navio'
      Size = 50
      Calculated = True
    end
    object qry_notificacao_calc_dt_chegada: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_dt_chegada'
      Size = 10
      Calculated = True
    end
  end
  object sp_gerar_fatura_itl: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_gerar_fatura_itl'
    Left = 760
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_frete_master'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_agente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_via_transp'
        ParamType = ptInput
      end>
  end
  object sp_notificacao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_notificacao'
    Left = 728
    Top = 416
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
        Name = '@cd_banco'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_via_transp'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_notificacao'
        ParamType = ptOutput
      end>
  end
  object sp_calculo_sda_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_calculo_sda_ag'
    Left = 664
    Top = 416
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
        DataType = ftDateTime
        Name = '@dt_embarque'
        ParamType = ptInput
      end>
  end
end
