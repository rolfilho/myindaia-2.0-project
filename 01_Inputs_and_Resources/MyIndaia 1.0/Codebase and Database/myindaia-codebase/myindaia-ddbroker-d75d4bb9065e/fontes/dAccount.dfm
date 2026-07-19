object datm_account: Tdatm_account
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 220
  Top = 215
  Height = 396
  Width = 602
  object qry_processo_: TQuery
    CachedUpdates = True
    AfterPost = qry_processo_AfterPost
    AfterScroll = qry_processo_AfterScroll
    OnCalcFields = qry_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.CD_CLIENTE, TP.CD_AGENTE, TP.VL_PROFIT' +
        '_HOUSE,TP.VL_DIVISAO, TP.VL_DESP_BRASIL,'
      
        '   (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRES' +
        'A = TP.CD_CLIENTE)NM_CLIENTE,'
      
        '   (SELECT TA.NM_AGENTE FROM TAGENTE TA WHERE TA.CD_AGENTE = TP.' +
        'CD_AGENTE)NM_AGENTE, TP.IN_ACCOUNT,'
      
        '   TH.NR_HOUSE, TH.NR_MASTER,TH.CD_MASTER, TP.VL_DESP_MASTER, TP' +
        '.VL_DESP_AG, TP.IN_LIBERADO,TP.CD_RESTRICAO,'
      
        '   TP.VL_PROFIT_BRASIL, TP.VL_PROFIT_AGENTE,  TP.VL_ACCOUNT,  TP' +
        '.CD_ORIGEM, TP.CD_DESTINO, TP.IN_SELECIONADO,'
      
        '   TP.CD_MOEDA_FRETE, (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM ' +
        'WHERE TM.CD_MOEDA = TP.CD_MOEDA_FRETE)AP_MOEDA,'
      
        '   (SELECT TPO.NM_PORTO FROM TPORTO TPO WHERE TPO.CD_PORTO = TP.' +
        'CD_ORIGEM )NM_ORIGEM, TP.DT_RECEBIMENTO, TS.CD_VIA_TRANSPORTE,'
      
        '   (SELECT TPO.NM_PORTO FROM TPORTO TPO WHERE TPO.CD_PORTO = TP.' +
        'CD_DESTINO )NM_DESTINO'
      '     FROM TPROCESSO TP, THOUSE TH, TSERVICO TS'
      '     WHERE  TP.NR_PROCESSO = TH.NR_PROCESSO'
      
        '       AND TP.CD_PRODUTO=:CD_PRODUTO AND TP.CD_UNID_NEG =:CD_UNI' +
        'D_NEG'
      '       AND TP.CD_SERVICO = TS.CD_SERVICO AND TS.TP_SERVICO = '#39'1'#39
      '       AND TP.IN_ACCOUNT in ('#39'1'#39','#39'3'#39','#39'4'#39','#39'6'#39','#39'7'#39','#39'8'#39')'
      ''
      ''
      ''
      ''
      '       ORDER BY'
      '         TP.NR_PROCESSO'
      ''
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
      ' ')
    UpdateObject = UpDate_Proc
    Left = 32
    Top = 32
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
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
    object qry_processo_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_processo_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_processo_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_processo_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_processo_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 11
      Calculated = True
    end
    object qry_processo_VL_PROFIT_HOUSE: TFloatField
      FieldName = 'VL_PROFIT_HOUSE'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_DIVISAO: TFloatField
      FieldName = 'VL_DIVISAO'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_DESP_BRASIL: TFloatField
      FieldName = 'VL_DESP_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_DESP_MASTER: TFloatField
      FieldName = 'VL_DESP_MASTER'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_DESP_AG: TFloatField
      FieldName = 'VL_DESP_AG'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_PROFIT_BRASIL: TFloatField
      FieldName = 'VL_PROFIT_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_PROFIT_AGENTE: TFloatField
      FieldName = 'VL_PROFIT_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_processo_IN_ACCOUNT: TStringField
      FieldName = 'IN_ACCOUNT'
      FixedChar = True
      Size = 1
    end
    object qry_processo_calc_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_status'
      Size = 12
      Calculated = True
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_RESTRICAO: TStringField
      FieldName = 'CD_RESTRICAO'
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
    object qry_processo_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_processo_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
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
    object qry_processo_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_VL_ACCOUNT: TFloatField
      FieldName = 'VL_ACCOUNT'
      DisplayFormat = '0.00'
    end
    object qry_processo_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_processo_calc_recebido: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_recebido'
      Size = 16
      Calculated = True
    end
    object qry_processo_DT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object qry_processo_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 112
    Top = 32
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
      'UH.IN_DEFAULT='#39'1'#39)
    Left = 32
    Top = 88
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
    object qry_traz_default_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
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
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 216
    Top = 32
  end
  object UpDate_Proc: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_RESTRICAO = :CD_RESTRICAO,'
      '  CD_MOEDA_FRETE = :CD_MOEDA_FRETE,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  IN_LIBERADO = :IN_LIBERADO,'
      '  CD_ORIGEM = :CD_ORIGEM,'
      '  CD_DESTINO = :CD_DESTINO,'
      '  VL_DESP_MASTER = :VL_DESP_MASTER,'
      '  VL_PROFIT_AGENTE = :VL_PROFIT_AGENTE,'
      '  VL_PROFIT_BRASIL = :VL_PROFIT_BRASIL,'
      '  VL_DIVISAO = :VL_DIVISAO,'
      '  VL_DESP_BRASIL = :VL_DESP_BRASIL,'
      '  VL_PROFIT_HOUSE = :VL_PROFIT_HOUSE,'
      '  VL_DESP_AG = :VL_DESP_AG,'
      '  IN_SELECIONADO = :IN_SELECIONADO,'
      '  IN_ACCOUNT = :IN_ACCOUNT,'
      '  VL_ACCOUNT = :VL_ACCOUNT'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO'
      
        '  (NR_PROCESSO, CD_CLIENTE, CD_RESTRICAO, CD_MOEDA_FRETE, CD_AGE' +
        'NTE, IN_LIBERADO, '
      
        '   CD_ORIGEM, CD_DESTINO, VL_DESP_MASTER, VL_PROFIT_AGENTE, VL_P' +
        'ROFIT_BRASIL, '
      
        '   VL_DIVISAO, VL_DESP_BRASIL, VL_PROFIT_HOUSE, VL_DESP_AG, IN_S' +
        'ELECIONADO, '
      '   IN_ACCOUNT, VL_ACCOUNT)'
      'values'
      
        '  (:NR_PROCESSO, :CD_CLIENTE, :CD_RESTRICAO, :CD_MOEDA_FRETE, :C' +
        'D_AGENTE, '
      
        '   :IN_LIBERADO, :CD_ORIGEM, :CD_DESTINO, :VL_DESP_MASTER, :VL_P' +
        'ROFIT_AGENTE, '
      
        '   :VL_PROFIT_BRASIL, :VL_DIVISAO, :VL_DESP_BRASIL, :VL_PROFIT_H' +
        'OUSE, :VL_DESP_AG, '
      '   :IN_SELECIONADO, :IN_ACCOUNT, :VL_ACCOUNT)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 32
    Top = 144
  end
  object qry_fatura_ag_: TQuery
    CachedUpdates = True
    BeforePost = qry_fatura_ag_BeforePost
    AfterPost = qry_fatura_ag_AfterPost
    AfterDelete = qry_fatura_ag_AfterDelete
    AfterScroll = qry_fatura_ag_AfterScroll
    OnCalcFields = qry_fatura_ag_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_FATURA, TP_FATURA,'
      
        'IN_FATURA, DT_FATURA, VL_FATURA, VL_CRE_AGENTE, VL_DEB_AGENTE, V' +
        'L_CRE_BRASIL, VL_DEB_BRASIL, VL_AJUSTE'
      ' FROM  TPROCESSO_FATURA_AG'
      '   WHERE NR_PROCESSO=:NR_PROCESSO  AND IN_FATURA IN ('#39'0'#39','#39'1'#39')'
      '     AND IN_COMPLEMENTAR = '#39'0'#39' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDAte_fat_ag
    Left = 120
    Top = 88
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = '0'
      end>
    object qry_fatura_ag_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_FATURA_AG.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_fatura_ag_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPROCESSO_FATURA_AG.NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_fatura_ag_TP_FATURA: TStringField
      FieldName = 'TP_FATURA'
      Origin = 'DBBROKER.TPROCESSO_FATURA_AG.TP_FATURA'
      OnChange = qry_fatura_ag_VL_FATURAChange
      FixedChar = True
      Size = 1
    end
    object qry_fatura_ag_IN_FATURA: TStringField
      FieldName = 'IN_FATURA'
      Origin = 'DBBROKER.TPROCESSO_FATURA_AG.IN_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_ag_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'DBBROKER.TPROCESSO_FATURA_AG.DT_FATURA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_fatura_ag_VL_FATURA: TFloatField
      FieldName = 'VL_FATURA'
      Origin = 'DBBROKER.TPROCESSO_FATURA_AG.VL_FATURA'
      OnChange = qry_fatura_ag_VL_FATURAChange
      DisplayFormat = '0.00'
    end
    object qry_fatura_ag_Look_tp_fatura: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_fatura'
      LookupDataSet = qry_tp_fatura_
      LookupKeyFields = 'CD_FATURA'
      LookupResultField = 'NM_FATURA'
      KeyFields = 'TP_FATURA'
      Size = 15
      Lookup = True
    end
    object qry_fatura_ag_VL_CRE_AGENTE: TFloatField
      FieldName = 'VL_CRE_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_fatura_ag_VL_DEB_AGENTE: TFloatField
      FieldName = 'VL_DEB_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_fatura_ag_VL_CRE_BRASIL: TFloatField
      FieldName = 'VL_CRE_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_fatura_ag_VL_DEB_BRASIL: TFloatField
      FieldName = 'VL_DEB_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_fatura_ag_VL_AJUSTE: TFloatField
      FieldName = 'VL_AJUSTE'
      DisplayFormat = '0.00'
    end
    object qry_fatura_ag_calc_vl_fatura: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_fatura'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object ds_fatura_ag: TDataSource
    DataSet = qry_fatura_ag_
    Left = 200
    Top = 88
  end
  object UpDAte_fat_ag: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_FATURA_AG'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_FATURA = :NR_FATURA,'
      '  TP_FATURA = :TP_FATURA,'
      '  IN_FATURA = :IN_FATURA,'
      '  DT_FATURA = :DT_FATURA,'
      '  VL_FATURA = :VL_FATURA,'
      '  VL_CRE_AGENTE = :VL_CRE_AGENTE,'
      '  VL_DEB_AGENTE = :VL_DEB_AGENTE,'
      '  VL_CRE_BRASIL = :VL_CRE_BRASIL,'
      '  VL_DEB_BRASIL = :VL_DEB_BRASIL,'
      '  VL_AJUSTE = :VL_AJUSTE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_FATURA = :OLD_NR_FATURA')
    InsertSQL.Strings = (
      'insert into TPROCESSO_FATURA_AG'
      
        '  (NR_PROCESSO, NR_FATURA, TP_FATURA, IN_FATURA, DT_FATURA, VL_F' +
        'ATURA, '
      
        '   VL_CRE_AGENTE, VL_DEB_AGENTE, VL_CRE_BRASIL, VL_DEB_BRASIL, V' +
        'L_AJUSTE)'
      'values'
      
        '  (:NR_PROCESSO, :NR_FATURA, :TP_FATURA, :IN_FATURA, :DT_FATURA,' +
        ' :VL_FATURA, '
      
        '   :VL_CRE_AGENTE, :VL_DEB_AGENTE, :VL_CRE_BRASIL, :VL_DEB_BRASI' +
        'L, :VL_AJUSTE)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_FATURA_AG'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_FATURA = :OLD_NR_FATURA')
    Left = 120
    Top = 144
  end
  object qry_tp_fatura_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FATURA, NM_FATURA  FROM TTP_FATURA')
    Left = 32
    Top = 200
    object qry_tp_fatura_CD_FATURA: TStringField
      FieldName = 'CD_FATURA'
      Origin = 'DBBROKER.TTP_FATURA.CD_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_tp_fatura_NM_FATURA: TStringField
      FieldName = 'NM_FATURA'
      Origin = 'DBBROKER.TTP_FATURA.NM_FATURA'
      FixedChar = True
      Size = 30
    end
  end
  object qry_master_: TQuery
    CachedUpdates = True
    AfterPost = qry_master_AfterPost
    AfterScroll = qry_master_AfterScroll
    OnCalcFields = qry_master_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MASTER, M.CD_UNID_NEG, M.CD_PRODUTO, M.CD_VIA_TRANSP' +
        ', M.IN_ACCOUNT, M.DT_CHEGADA,'
      
        '       M.NR_MASTER, M.CD_AGENTE, M.CD_ORIGEM, M.CD_DESTINO, M.CD' +
        '_MOEDA, M.DT_EMISSAO_DTA, M.DT_EMBARQUE,'
      '       (SELECT SUM(P.VL_ACCOUNT) FROM TPROCESSO P, THOUSE H'
      
        '          WHERE H.CD_MASTER = M.CD_MASTER AND H.NR_PROCESSO = P.' +
        'NR_PROCESSO )AS VL_ACCOUNT,'
      '       CASE M.CD_VIA_TRANSP'
      
        '        WHEN '#39'04'#39' THEN (SELECT T.DESCRICAO FROM TTRANSPORTADOR_I' +
        'TL T WHERE T.CODIGO = M.CD_CIA_TRANSP)'
      
        '        ELSE (SELECT T.DESCRICAO FROM TTRANSPORTADOR_ITL T WHERE' +
        ' T.CODIGO = M.CD_ARMADOR)'
      '       END AS NM_TRANSPORTADOR,'
      '       CASE M.CD_VIA_TRANSP'
      
        '        WHEN '#39'04'#39' THEN (SELECT O.CD_SIGLA FROM TPORTO O WHERE O.' +
        'CD_PORTO = M.CD_ORIGEM)'
      
        '        ELSE (SELECT O.CD_SIGLA_CIDADE FROM TPORTO O WHERE O.CD_' +
        'PORTO = M.CD_ORIGEM)'
      '       END AS NM_ORIGEM,'
      ''
      '     CASE M.CD_VIA_TRANSP'
      
        '        WHEN '#39'04'#39' THEN (SELECT O.CD_SIGLA FROM TPORTO O WHERE O.' +
        'CD_PORTO = M.CD_DESTINO)'
      
        '        ELSE (SELECT O.CD_SIGLA_CIDADE FROM TPORTO O WHERE O.CD_' +
        'PORTO = M.CD_DESTINO)'
      '       END AS NM_DESTINO,'
      ''
      '     CASE M.CD_VIA_TRANSP'
      '        WHEN '#39'04'#39' THEN M.CD_CIA_TRANSP'
      '        ELSE M.CD_ARMADOR'
      '       END AS COD_TRANSPORTADOR,'
      ''
      
        '    (SELECT V.NM_VIA_TRANSP FROM TVIA_TRANSP_BROKER V WHERE V.CD' +
        '_VIA_TRANSP = M.CD_VIA_TRANSP) NM_VIA_TRANSP,'
      
        '    (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGENTE = M.CD_' +
        'AGENTE)NM_AGENTE,'
      
        '    (SELECT MO.AP_MOEDA FROM TMOEDA_BROKER MO WHERE MO.CD_MOEDA ' +
        '= M.CD_MOEDA)AP_MOEDA,'
      
        '    (SELECT PR.TP_PRODUTO FROM TPRODUTO PR WHERE PR.CD_PRODUTO =' +
        ' M.CD_PRODUTO) TP_PRODUTO'
      ''
      '  FROM TMASTER M'
      
        '  WHERE M.CD_UNID_NEG =:CD_UNID_NEG AND M.CD_PRODUTO =:CD_PRODUT' +
        'O'
      '     AND M.IN_ACCOUNT IN ('#39'1'#39','#39'3'#39','#39'4'#39','#39'5'#39', '#39'6'#39')'
      ' ORDER BY'
      '  M.CD_MASTER'
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
      ' ')
    UpdateObject = Update_Master
    Left = 360
    Top = 24
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
      end>
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
    object qry_master_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_master_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_master_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 25
    end
    object qry_master_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_master_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_master_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_master_NM_TRANSPORTADOR: TStringField
      FieldName = 'NM_TRANSPORTADOR'
      FixedChar = True
      Size = 60
    end
    object qry_master_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_master_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_master_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
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
    object qry_master_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_master_COD_TRANSPORTADOR: TStringField
      FieldName = 'COD_TRANSPORTADOR'
      FixedChar = True
      Size = 4
    end
    object qry_master_VL_ACCOUNT: TFloatField
      FieldName = 'VL_ACCOUNT'
      DisplayFormat = '0.00'
    end
    object qry_master_IN_ACCOUNT: TStringField
      FieldName = 'IN_ACCOUNT'
      FixedChar = True
      Size = 1
    end
    object qry_master_calc_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_status'
      Size = 15
      Calculated = True
    end
    object qry_master_TP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_master_DT_CHEGADA: TDateTimeField
      FieldName = 'DT_CHEGADA'
    end
    object qry_master_DT_EMISSAO_DTA: TDateTimeField
      FieldName = 'DT_EMISSAO_DTA'
    end
    object qry_master_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
  end
  object ds_master: TDataSource
    DataSet = qry_master_
    Left = 360
    Top = 72
  end
  object qry_master_fatura_ag_: TQuery
    CachedUpdates = True
    BeforePost = qry_master_fatura_ag_BeforePost
    AfterPost = qry_master_fatura_ag_AfterPost
    AfterDelete = qry_master_fatura_ag_AfterDelete
    AfterScroll = qry_master_fatura_ag_AfterScroll
    OnCalcFields = qry_master_fatura_ag_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_MASTER, CD_FATURA, NR_FATURA, TP_FATURA, IN_FATURA, DT' +
        '_FATURA, VL_FATURA,'
      
        '       VL_CRE_AGENTE, VL_DEB_AGENTE, VL_CRE_BRASIL, VL_DEB_BRASI' +
        'L, VL_AJUSTE,'
      
        '       CD_VIA_TRANSP, CD_MOEDA, CD_AGENTE, CD_STATUS, CD_USUARIO' +
        '_CANC, DT_CANCELADO, DT_CONTABILIZACAO'
      '   FROM TMASTER_FATURA_AG'
      '     WHERE CD_MASTER = :CD_MASTER'
      '      AND IN_FATURA = '#39'0'#39
      '     AND IN_COMPLEMENTAR = '#39'0'#39
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdateMaster_fat
    Left = 360
    Top = 128
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end>
    object qry_master_fatura_ag_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.CD_MASTER'
      FixedChar = True
      Size = 18
    end
    object qry_master_fatura_ag_CD_FATURA: TStringField
      FieldName = 'CD_FATURA'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.CD_FATURA'
      FixedChar = True
      Size = 2
    end
    object qry_master_fatura_ag_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_master_fatura_ag_TP_FATURA: TStringField
      FieldName = 'TP_FATURA'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.TP_FATURA'
      OnChange = qry_master_fatura_ag_TP_FATURAChange
      FixedChar = True
      Size = 1
    end
    object qry_master_fatura_ag_IN_FATURA: TStringField
      FieldName = 'IN_FATURA'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.IN_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_master_fatura_ag_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.DT_FATURA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_master_fatura_ag_VL_FATURA: TFloatField
      FieldName = 'VL_FATURA'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.VL_FATURA'
      DisplayFormat = '0.00'
    end
    object qry_master_fatura_ag_VL_CRE_AGENTE: TFloatField
      FieldName = 'VL_CRE_AGENTE'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.VL_CRE_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_master_fatura_ag_VL_DEB_AGENTE: TFloatField
      FieldName = 'VL_DEB_AGENTE'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.VL_DEB_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_master_fatura_ag_VL_CRE_BRASIL: TFloatField
      FieldName = 'VL_CRE_BRASIL'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.VL_CRE_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_master_fatura_ag_VL_DEB_BRASIL: TFloatField
      FieldName = 'VL_DEB_BRASIL'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.VL_DEB_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_master_fatura_ag_VL_AJUSTE: TFloatField
      FieldName = 'VL_AJUSTE'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.VL_AJUSTE'
    end
    object qry_master_fatura_ag_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_master_fatura_ag_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_master_fatura_ag_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_master_fatura_ag_Look_tp_fatura: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_fatura'
      LookupDataSet = qry_tp_fatura_
      LookupKeyFields = 'CD_FATURA'
      LookupResultField = 'NM_FATURA'
      KeyFields = 'TP_FATURA'
      Lookup = True
    end
    object qry_master_fatura_ag_calc_vl_fatura: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_fatura'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qry_master_fatura_ag_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.CD_STATUS'
      FixedChar = True
      Size = 1
    end
    object qry_master_fatura_ag_CD_USUARIO_CANC: TStringField
      FieldName = 'CD_USUARIO_CANC'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.CD_USUARIO_CANC'
      FixedChar = True
      Size = 4
    end
    object qry_master_fatura_ag_DT_CANCELADO: TDateTimeField
      FieldName = 'DT_CANCELADO'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.DT_CANCELADO'
    end
    object qry_master_fatura_ag_DT_CONTABILIZACAO: TDateTimeField
      FieldName = 'DT_CONTABILIZACAO'
      Origin = 'DBBROKER.TMASTER_FATURA_AG.DT_CONTABILIZACAO'
    end
  end
  object ds_master_fat_ag: TDataSource
    DataSet = qry_master_fatura_ag_
    Left = 360
    Top = 184
  end
  object sp_calculo_fatura_master: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_calculo_fatura_master'
    Left = 360
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_master'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_via_transp'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_acc_master'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_account'
        ParamType = ptInput
      end>
  end
  object Update_Master: TUpdateSQL
    ModifySQL.Strings = (
      'update TMASTER'
      'set'
      '  IN_ACCOUNT = :IN_ACCOUNT'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_VIA_TRANSP = :OLD_CD_VIA_TRANSP')
    InsertSQL.Strings = (
      'insert into TMASTER'
      '  (IN_ACCOUNT)'
      'values'
      '  (:IN_ACCOUNT)')
    DeleteSQL.Strings = (
      'delete from TMASTER'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_VIA_TRANSP = :OLD_CD_VIA_TRANSP')
    Left = 464
    Top = 40
  end
  object sp_aprova_fat_master: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_aprova_fat_master'
    Left = 464
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_master'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_moeda'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_via_transp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_agente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Qtde_proc'
        ParamType = ptInputOutput
      end>
  end
  object UpdateMaster_fat: TUpdateSQL
    ModifySQL.Strings = (
      'update TMASTER_FATURA_AG'
      'set'
      '  CD_MASTER = :CD_MASTER,'
      '  NR_FATURA = :NR_FATURA,'
      '  CD_FATURA = :CD_FATURA,'
      '  TP_FATURA = :TP_FATURA,'
      '  IN_FATURA = :IN_FATURA,'
      '  DT_FATURA = :DT_FATURA,'
      '  VL_FATURA = :VL_FATURA,'
      '  VL_CRE_AGENTE = :VL_CRE_AGENTE,'
      '  VL_DEB_AGENTE = :VL_DEB_AGENTE,'
      '  VL_CRE_BRASIL = :VL_CRE_BRASIL,'
      '  VL_DEB_BRASIL = :VL_DEB_BRASIL,'
      '  VL_AJUSTE = :VL_AJUSTE,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  CD_AGENTE = :CD_AGENTE'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_FATURA = :OLD_CD_FATURA')
    InsertSQL.Strings = (
      'insert into TMASTER_FATURA_AG'
      
        '  (CD_MASTER, NR_FATURA, CD_FATURA, TP_FATURA, IN_FATURA, DT_FAT' +
        'URA, VL_FATURA, '
      
        '   VL_CRE_AGENTE, VL_DEB_AGENTE, VL_CRE_BRASIL, VL_DEB_BRASIL, V' +
        'L_AJUSTE, '
      '   CD_VIA_TRANSP, CD_MOEDA, CD_AGENTE)'
      'values'
      
        '  (:CD_MASTER, :NR_FATURA, :CD_FATURA, :TP_FATURA, :IN_FATURA, :' +
        'DT_FATURA, '
      
        '   :VL_FATURA, :VL_CRE_AGENTE, :VL_DEB_AGENTE, :VL_CRE_BRASIL, :' +
        'VL_DEB_BRASIL, '
      '   :VL_AJUSTE, :CD_VIA_TRANSP, :CD_MOEDA, :CD_AGENTE)')
    DeleteSQL.Strings = (
      'delete from TMASTER_FATURA_AG'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_FATURA = :OLD_CD_FATURA')
    Left = 472
    Top = 152
  end
  object sp_contabiliza_Fat_itl_master1: TADOStoredProc
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=BROKER;Data Source=CAMILA'
    CursorLocation = clUseServer
    LockType = ltReadOnly
    ProcedureName = 'sp_contabiliza_Fat_itl_master'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@cd_master'
        Attributes = [paNullable]
        DataType = ftString
        Size = 18
        Value = Null
      end
      item
        Name = '@dt_aprovacao'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@nr_docto'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 168
    Top = 208
  end
  object qry_fatura_itl_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 88
    Top = 312
  end
  object sp_contabiliza_fat: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_Fat_itl_master'
    Left = 496
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_master'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_aprovacao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_docto'
        ParamType = ptInput
      end>
  end
  object sp_contabiliza_Fat_itl_master: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'sp_contabiliza_Fat_itl_master'
    Left = 232
    Top = 264
  end
end
