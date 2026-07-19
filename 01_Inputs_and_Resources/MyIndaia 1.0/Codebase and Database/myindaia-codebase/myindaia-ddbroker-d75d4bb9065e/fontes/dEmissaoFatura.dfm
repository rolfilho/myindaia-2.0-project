object datm_emissao_fatura: Tdatm_emissao_fatura
  OldCreateOrder = False
  Left = 110
  Top = 153
  Height = 479
  Width = 741
  object qry_emissao_fatura_: TQuery
    CachedUpdates = True
    BeforePost = qry_emissao_fatura_BeforePost
    AfterPost = qry_emissao_fatura_AfterPost
    AfterScroll = qry_emissao_fatura_AfterScroll
    OnCalcFields = qry_emissao_fatura_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TF.NR_FATURA, TF.VL_FATURA, TF.DT_FATURA,' +
        ' TF.IN_FATURA, TF.VL_PROFIT_AG, TF.VL_PROFIT_BR,'
      
        '   TF.TP_FATURA,  TF.VL_CRE_AGENTE, TF.VL_DEB_AGENTE,  TF.VL_CRE' +
        '_BRASIL, TF.VL_DEB_BRASIL, TF.VL_AJUSTE,'
      
        '    (SELECT TA.NM_AGENTE FROM TAGENTE TA WHERE TA.CD_AGENTE = TP' +
        '.CD_AGENTE)NM_AGENTE,TP.CD_AGENTE, TP.IN_ACCOUNT,'
      
        '    (SELECT V.NM_VIA_TRANSP FROM TVIA_TRANSP_BROKER V WHERE V.CD' +
        '_VIA_transp = S.CD_VIA_TRANSPORTE) NM_VIA_TRANSP,'
      '    CASE S.CD_VIA_TRANSPORTE'
      
        '      WHEN '#39'04'#39' THEN (SELECT O.CD_SIGLA FROM TPORTO O WHERE O.CD' +
        '_PORTO = TP.CD_ORIGEM)'
      
        '      ELSE (SELECT O.CD_SIGLA_CIDADE FROM TPORTO O WHERE O.CD_PO' +
        'RTO = TP.CD_ORIGEM)'
      '     END AS AP_ORIGEM,'
      '    CASE S.CD_VIA_TRANSPORTE'
      
        '      WHEN '#39'04'#39' THEN (SELECT D.CD_SIGLA FROM TPORTO D WHERE D.CD' +
        '_PORTO = TP.CD_DESTINO)'
      
        '      ELSE (SELECT D.CD_SIGLA_CIDADE FROM TPORTO D WHERE D.CD_PO' +
        'RTO = TP.CD_DESTINO)'
      '     END AS AP_DESTINO,'
      
        '    (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M WHERE M.CD_MOEDA = T' +
        'P.CD_MOEDA_FRETE)AP_MOEDA,'
      '     TP.VL_ACCOUNT'
      ''
      '       FROM TPROCESSO TP, TPROCESSO_FATURA_AG TF, TSERVICO S'
      '       WHERE TP.NR_PROCESSO = TF.NR_PROCESSO'
      '         AND TP.CD_UNID_NEG = :CD_UNID_NEG'
      
        '         AND TP.CD_PRODUTO  = :CD_PRODUTO AND TF.IN_FATURA IN('#39'2' +
        #39','#39'3'#39')'
      '         AND TP.CD_SERVICO  = S.CD_SERVICO'
      '         AND TP.IN_ACCOUNT IN ("1", "3", "4", "6", "7", "8")'
      ''
      '  ORDER BY'
      '  TP.NR_PROCESSO'
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
    UpdateObject = UpDAte_emis_fatura
    Left = 64
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
      end>
    object qry_emissao_fatura_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_emissao_fatura_VL_FATURA: TFloatField
      FieldName = 'VL_FATURA'
      DisplayFormat = '0.00'
    end
    object qry_emissao_fatura_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_emissao_fatura_TP_FATURA: TStringField
      FieldName = 'TP_FATURA'
      OnChange = qry_emissao_fatura_TP_FATURAChange
      FixedChar = True
      Size = 1
    end
    object qry_emissao_fatura_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_emissao_fatura_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_emissao_fatura_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 10
      Calculated = True
    end
    object qry_emissao_fatura_IN_FATURA: TStringField
      FieldName = 'IN_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_emissao_fatura_VL_PROFIT_AG: TFloatField
      FieldName = 'VL_PROFIT_AG'
      DisplayFormat = '0.00'
    end
    object qry_emissao_fatura_VL_PROFIT_BR: TFloatField
      FieldName = 'VL_PROFIT_BR'
      DisplayFormat = '0.00'
    end
    object qry_emissao_fatura_calc_vl_fatura: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_fatura'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qry_emissao_fatura_Look_tp_fatura: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_fatura'
      LookupDataSet = qry_tp_fatura_
      LookupKeyFields = 'CD_FATURA'
      LookupResultField = 'NM_FATURA'
      KeyFields = 'TP_FATURA'
      Lookup = True
    end
    object qry_emissao_fatura_VL_CRE_AGENTE: TFloatField
      FieldName = 'VL_CRE_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_emissao_fatura_VL_DEB_AGENTE: TFloatField
      FieldName = 'VL_DEB_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_emissao_fatura_VL_CRE_BRASIL: TFloatField
      FieldName = 'VL_CRE_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_emissao_fatura_VL_DEB_BRASIL: TFloatField
      FieldName = 'VL_DEB_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_emissao_fatura_VL_AJUSTE: TFloatField
      FieldName = 'VL_AJUSTE'
      DisplayFormat = '0.00'
    end
    object qry_emissao_fatura_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object qry_emissao_fatura_AP_ORIGEM: TStringField
      FieldName = 'AP_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_emissao_fatura_AP_DESTINO: TStringField
      FieldName = 'AP_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_emissao_fatura_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_emissao_fatura_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_emissao_fatura_IN_ACCOUNT: TStringField
      FieldName = 'IN_ACCOUNT'
      FixedChar = True
      Size = 1
    end
    object qry_emissao_fatura_VL_ACCOUNT: TFloatField
      FieldName = 'VL_ACCOUNT'
      DisplayFormat = '0.00'
    end
  end
  object ds_emissao_fatura: TDataSource
    DataSet = qry_emissao_fatura_
    Left = 176
    Top = 16
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
    Left = 64
    Top = 80
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
    Left = 320
    Top = 12
  end
  object UpDAte_emis_fatura: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_FATURA_AG'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_FATURA = :NR_FATURA,'
      '  TP_FATURA = :TP_FATURA,'
      '  IN_FATURA = :IN_FATURA,'
      '  DT_FATURA = :DT_FATURA,'
      '  VL_FATURA = :VL_FATURA,'
      '  VL_PROFIT_AG = :VL_PROFIT_AG,'
      '  VL_PROFIT_BR = :VL_PROFIT_BR,'
      '  VL_CRE_AGENTE = :VL_CRE_AGENTE,'
      '  VL_DEB_AGENTE = :VL_DEB_AGENTE,'
      '  VL_CRE_BRASIL = :VL_CRE_BRASIL,'
      '  VL_DEB_BRASIL = :VL_DEB_BRASIL,'
      '  VL_AJUSTE = :VL_AJUSTE,'
      '  CD_AGENTE = :CD_AGENTE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_FATURA = :OLD_NR_FATURA')
    InsertSQL.Strings = (
      'insert into TPROCESSO_FATURA_AG'
      
        '  (NR_PROCESSO, NR_FATURA, TP_FATURA, IN_FATURA, DT_FATURA, VL_F' +
        'ATURA, '
      
        '   VL_PROFIT_AG, VL_PROFIT_BR, VL_CRE_AGENTE, VL_DEB_AGENTE, VL_' +
        'CRE_BRASIL, '
      '   VL_DEB_BRASIL, VL_AJUSTE, CD_AGENTE)'
      'values'
      
        '  (:NR_PROCESSO, :NR_FATURA, :TP_FATURA, :IN_FATURA, :DT_FATURA,' +
        ' :VL_FATURA, '
      
        '   :VL_PROFIT_AG, :VL_PROFIT_BR, :VL_CRE_AGENTE, :VL_DEB_AGENTE,' +
        ' :VL_CRE_BRASIL, '
      '   :VL_DEB_BRASIL, :VL_AJUSTE, :CD_AGENTE)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_FATURA_AG'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_FATURA = :OLD_NR_FATURA')
    Left = 64
    Top = 136
  end
  object qry_tp_fatura_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FATURA, NM_FATURA FROM TTP_FATURA')
    Left = 56
    Top = 208
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
  object qry_soma_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT (((ISNULL(SUM(VL_DEB_AGENTE),0) + ISNULL(SUM(VL_CRE_BRASI' +
        'L),0)) - (ISNULL(SUM(VL_CRE_AGENTE),0)+ ISNULL(SUM(VL_DEB_BRASIL' +
        '),0)))'
      
        ' + ISNULL(SUM( VL_AJUSTE),0)) AS TOTAL    FROM TPROCESSO_FATURA_' +
        'AG'
      ' WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 56
    Top = 264
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_soma_fat_TOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '0.00'
    end
  end
  object ds_soma_fat: TDataSource
    DataSet = qry_soma_fat_
    Left = 56
    Top = 312
  end
  object qry_master_: TQuery
    CachedUpdates = True
    BeforePost = qry_master_BeforePost
    AfterPost = qry_master_AfterPost
    AfterDelete = qry_master_AfterDelete
    AfterScroll = qry_master_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MASTER, CD_UNID_NEG, M.CD_PRODUTO, M.CD_VIA_TRANSP, ' +
        'M.NR_MASTER, F.CD_FATURA,'
      '       M.CD_AGENTE, M.CD_MOEDA,'
      '       M.CD_ORIGEM, M.CD_DESTINO, F.TX_OBS,'
      '       (SELECT SUM(P.VL_ACCOUNT) FROM TPROCESSO P, THOUSE H'
      
        '          WHERE H.CD_MASTER = M.CD_MASTER AND H.NR_PROCESSO = P.' +
        'NR_PROCESSO )AS VL_ACCOUNT,'
      
        '       (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGENTE = M.' +
        'CD_AGENTE)NM_AGENTE, M.IN_ACCOUNT,'
      
        '       (SELECT V.NM_VIA_TRANSP FROM TVIA_TRANSP_BROKER V WHERE V' +
        '.CD_VIA_transp = M.CD_VIA_TRANSP) NM_VIA_TRANSP,'
      '    CASE M.CD_VIA_TRANSP'
      
        '      WHEN '#39'04'#39' THEN (SELECT O.CD_SIGLA FROM TPORTO O WHERE O.CD' +
        '_PORTO = M.CD_ORIGEM)'
      
        '      ELSE (SELECT O.CD_SIGLA_CIDADE FROM TPORTO O WHERE O.CD_PO' +
        'RTO = M.CD_ORIGEM)'
      '     END AS AP_ORIGEM,'
      '    CASE M.CD_VIA_TRANSP'
      
        '      WHEN '#39'04'#39' THEN (SELECT D.CD_SIGLA FROM TPORTO D WHERE D.CD' +
        '_PORTO = M.CD_DESTINO)'
      
        '      ELSE (SELECT D.CD_SIGLA_CIDADE FROM TPORTO D WHERE D.CD_PO' +
        'RTO = M.CD_DESTINO)'
      '     END AS AP_DESTINO,'
      
        '    (SELECT MO.AP_MOEDA FROM TMOEDA_BROKER MO WHERE MO.CD_MOEDA ' +
        '= M.CD_MOEDA)AP_MOEDA,'
      
        '    F.VL_CRE_AGENTE, F.VL_DEB_AGENTE, F.VL_CRE_BRASIL, F.VL_DEB_' +
        'BRASIL, F.VL_AJUSTE, F.TP_FATURA,'
      '    F.NR_FATURA, F.DT_FATURA, F.IN_FATURA'
      '  FROM TMASTER_FATURA_AG F, TMASTER M'
      '    WHERE M.CD_UNID_NEG = :CD_UNID_NEG'
      '      AND M.CD_PRODUTO = :CD_PRODUTO'
      '      AND M.CD_MASTER = F.CD_MASTER'
      '      AND F.IN_FATURA  = '#39'1'#39
      ''
      '      ORDER BY'
      '       NR_MASTER'
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
    UpdateObject = Update_master
    Left = 328
    Top = 88
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
    object qry_master_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_master_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_master_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
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
    object qry_master_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_master_IN_ACCOUNT: TStringField
      FieldName = 'IN_ACCOUNT'
      FixedChar = True
      Size = 1
    end
    object qry_master_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object qry_master_AP_ORIGEM: TStringField
      FieldName = 'AP_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_master_AP_DESTINO: TStringField
      FieldName = 'AP_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_master_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_master_VL_CRE_AGENTE: TFloatField
      FieldName = 'VL_CRE_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_master_VL_DEB_AGENTE: TFloatField
      FieldName = 'VL_DEB_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_master_VL_CRE_BRASIL: TFloatField
      FieldName = 'VL_CRE_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_master_VL_DEB_BRASIL: TFloatField
      FieldName = 'VL_DEB_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_master_VL_AJUSTE: TFloatField
      FieldName = 'VL_AJUSTE'
      DisplayFormat = '0.00'
    end
    object qry_master_TP_FATURA: TStringField
      FieldName = 'TP_FATURA'
      OnChange = qry_master_TP_FATURAChange
      FixedChar = True
      Size = 1
    end
    object qry_master_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 25
    end
    object qry_master_CD_FATURA: TStringField
      FieldName = 'CD_FATURA'
      FixedChar = True
      Size = 2
    end
    object qry_master_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_master_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_master_IN_FATURA: TStringField
      FieldName = 'IN_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_master_VL_ACCOUNT: TFloatField
      FieldName = 'VL_ACCOUNT'
      DisplayFormat = '0.00'
    end
    object qry_master_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      BlobType = ftMemo
    end
  end
  object ds_master: TDataSource
    DataSet = qry_master_
    Left = 336
    Top = 144
  end
  object Update_master: TUpdateSQL
    ModifySQL.Strings = (
      'update  TMASTER_FATURA_AG'
      'set'
      '  CD_MASTER = :CD_MASTER,'
      '  NR_FATURA = :NR_FATURA,'
      '  CD_FATURA = :CD_FATURA,'
      '  TP_FATURA = :TP_FATURA,'
      '  IN_FATURA = :IN_FATURA,'
      '  DT_FATURA = :DT_FATURA,'
      '  VL_CRE_AGENTE = :VL_CRE_AGENTE,'
      '  VL_DEB_AGENTE = :VL_DEB_AGENTE,'
      '  VL_CRE_BRASIL = :VL_CRE_BRASIL,'
      '  VL_DEB_BRASIL = :VL_DEB_BRASIL,'
      '  VL_AJUSTE = :VL_AJUSTE,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  TX_OBS = :TX_OBS'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_FATURA = :OLD_CD_FATURA')
    InsertSQL.Strings = (
      'insert into  TMASTER_FATURA_AG'
      
        '  (CD_MASTER, NR_FATURA, CD_FATURA, TP_FATURA, IN_FATURA, DT_FAT' +
        'URA, VL_CRE_AGENTE, '
      
        '   VL_DEB_AGENTE, VL_CRE_BRASIL, VL_DEB_BRASIL, VL_AJUSTE, CD_VI' +
        'A_TRANSP, '
      '   CD_MOEDA, CD_AGENTE, TX_OBS)'
      'values'
      
        '  (:CD_MASTER, :NR_FATURA, :CD_FATURA, :TP_FATURA, :IN_FATURA, :' +
        'DT_FATURA, '
      
        '   :VL_CRE_AGENTE, :VL_DEB_AGENTE, :VL_CRE_BRASIL, :VL_DEB_BRASI' +
        'L, :VL_AJUSTE, '
      '   :CD_VIA_TRANSP, :CD_MOEDA, :CD_AGENTE, :TX_OBS)')
    DeleteSQL.Strings = (
      'delete from  TMASTER_FATURA_AG'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_FATURA = :OLD_CD_FATURA')
    Left = 416
    Top = 96
  end
  object qry_soma_fat_master_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT (((ISNULL(SUM(VL_DEB_AGENTE),0) + ISNULL(SUM(VL_CRE_BRASI' +
        'L),0)) - (ISNULL(SUM(VL_CRE_AGENTE),0)+ ISNULL(SUM(VL_DEB_BRASIL' +
        '),0)))'
      ' + ISNULL(SUM( VL_AJUSTE),0)) AS TOTAL    FROM TMASTER_FATURA_AG'
      ' WHERE CD_MASTER = :CD_MASTER')
    Left = 416
    Top = 192
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end>
    object qry_soma_fat_master_TOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '0.00'
    end
  end
  object ds_soma_fat_master: TDataSource
    DataSet = qry_soma_fat_master_
    Left = 424
    Top = 240
  end
  object qry_rel_imp_fat_: TQuery
    OnCalcFields = qry_rel_imp_fat_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MASTER, M.CD_UNID_NEG, M.CD_PRODUTO, M.CD_VIA_TRANSP' +
        ', M.CD_MOEDA, M.NR_MASTER,'
      '       F.NR_FATURA, M.TT_FRETE_MASTER, F.TP_FATURA,  F.TX_OBS,'
      '       M.DT_EMBARQUE, M.DT_EMISSAO_DTA AS DT_EMISSAO,'
      
        '       U.NM_UNID_NEG, U.END_UNID_NEG, U.CGC_UNID_NEG, U.END_NUME' +
        'RO,'
      
        '       U.END_BAIRRO, U.END_CIDADE, U.END_UF, U.NR_FONE, U.END_CE' +
        'P, U.NR_FAX1,'
      '       T.SIGLA_CIA_TRANSP,'
      '       '
      '        (CASE'
      
        '        WHEN M.CD_VIA_TRANSP = '#39'04'#39' AND A.IN_EMISSAO_EXP_AEREA =' +
        ' '#39'1'#39' AND P.TP_PRODUTO = '#39'02'#39' THEN'
      
        '          (SELECT B.DS_ENDERECO FROM TAGENTE B WHERE B.CD_AGENTE' +
        ' = A.CD_AG_EMISSAO_EXP_AEREA)'
      
        '        WHEN M.CD_VIA_TRANSP = '#39'01'#39' AND A.IN_EMISSAO_EXP_MARIT =' +
        ' '#39'1'#39' AND P.TP_PRODUTO = '#39'02'#39'THEN'
      
        '          (SELECT B.DS_ENDERECO FROM TAGENTE B WHERE B.CD_AGENTE' +
        ' = A.CD_AG_EMISSAO_EXP_MARIT)'
      
        '        WHEN M.CD_VIA_TRANSP = '#39'04'#39' AND A.IN_EMISSAO_IMP_AEREA =' +
        ' '#39'1'#39' AND P.TP_PRODUTO = '#39'01'#39'THEN'
      
        '          (SELECT B.DS_ENDERECO FROM TAGENTE B WHERE B.CD_AGENTE' +
        ' = A.CD_AG_EMISSAO_IMP_AEREA)'
      
        '        WHEN M.CD_VIA_TRANSP = '#39'01'#39' AND A.IN_EMISSAO_IMP_MARIT =' +
        ' '#39'1'#39'AND P.TP_PRODUTO = '#39'01'#39' THEN'
      
        '          (SELECT B.DS_ENDERECO FROM TAGENTE B WHERE B.CD_AGENTE' +
        ' = A.CD_AG_EMISSAO_IMP_MARIT)'
      '       ELSE  A.DS_ENDERECO END)AS END_AGENTE,'
      ''
      '       (CASE'
      
        '        WHEN M.CD_VIA_TRANSP = '#39'04'#39' AND A.IN_EMISSAO_EXP_AEREA =' +
        ' '#39'1'#39' AND P.TP_PRODUTO = '#39'02'#39' THEN'
      
        '          (SELECT B.NM_AGENTE FROM TAGENTE B WHERE B.CD_AGENTE =' +
        ' A.CD_AG_EMISSAO_EXP_AEREA)'
      
        '        WHEN M.CD_VIA_TRANSP = '#39'01'#39' AND A.IN_EMISSAO_EXP_MARIT =' +
        ' '#39'1'#39' AND P.TP_PRODUTO = '#39'02'#39'THEN'
      
        '          (SELECT B.NM_AGENTE FROM TAGENTE B WHERE B.CD_AGENTE =' +
        ' A.CD_AG_EMISSAO_EXP_MARIT)'
      
        '        WHEN M.CD_VIA_TRANSP = '#39'04'#39' AND A.IN_EMISSAO_IMP_AEREA =' +
        ' '#39'1'#39' AND P.TP_PRODUTO = '#39'01'#39'THEN'
      
        '          (SELECT B.NM_AGENTE FROM TAGENTE B WHERE B.CD_AGENTE =' +
        ' A.CD_AG_EMISSAO_IMP_AEREA)'
      
        '        WHEN M.CD_VIA_TRANSP = '#39'01'#39' AND A.IN_EMISSAO_IMP_MARIT =' +
        ' '#39'1'#39'AND P.TP_PRODUTO = '#39'01'#39' THEN'
      
        '          (SELECT B.NM_AGENTE FROM TAGENTE B WHERE B.CD_AGENTE =' +
        ' A.CD_AG_EMISSAO_IMP_MARIT)'
      '       ELSE  A.NM_AGENTE END)AS NM_AGENTE,'
      ''
      '       CASE'
      '        WHEN M.CD_VIA_TRANSP = '#39'01'#39' THEN   O.CD_SIGLA_CIDADE'
      '        ELSE O.CD_SIGLA END AS ORIGEM,'
      '       CASE'
      '        WHEN M.CD_VIA_TRANSP = '#39'01'#39' THEN   D.CD_SIGLA_CIDADE'
      '        ELSE D.CD_SIGLA END AS DESTINO,'
      '       CASE'
      '        WHEN F.TP_FATURA = '#39'0'#39' THEN F.VL_CRE_AGENTE'
      '        WHEN F.TP_FATURA = '#39'1'#39' THEN F.VL_DEB_AGENTE'
      '        WHEN F.TP_FATURA = '#39'2'#39' THEN F.VL_CRE_BRASIL'
      '        ELSE F.VL_DEB_BRASIL END VL_FATURA,'
      
        '      (SELECT MO.AP_MOEDA FROM TMOEDA_BROKER MO WHERE MO.CD_MOED' +
        'A = M.CD_MOEDA )AP_MOEDA,'
      
        '      (SELECT SUM(P.VL_FRETE) FROM TPROCESSO P, THOUSE H WHERE H' +
        '.CD_MASTER = M.CD_MASTER'
      '          AND P.NR_PROCESSO = H.NR_PROCESSO) AS VL_FRETE_VENDA,'
      
        '      (SELECT SUM(P.VL_ACCOUNT) FROM TPROCESSO P, THOUSE H WHERE' +
        ' H.CD_MASTER = M.CD_MASTER'
      '          AND P.NR_PROCESSO = H.NR_PROCESSO) AS VL_ACCOUNT,'
      '      CASE'
      '       WHEN M.CD_VIA_TRANSP = '#39'01'#39' THEN M.DT_EMBARQUE'
      '       ELSE M.DT_EMISSAO_DTA END AS DT_DOCUMENTO'
      '   FROM TMASTER_FATURA_AG F, TMASTER M'
      '   LEFT JOIN TAGENTE A ON(A.CD_AGENTE = M.CD_AGENTE)'
      '   LEFT JOIN TPORTO  O ON(O.CD_PORTO = M.CD_ORIGEM)'
      '   LEFT JOIN TPORTO  D ON(D.CD_PORTO = M.CD_DESTINO)'
      '   LEFT JOIN TUNID_NEG U ON (U.CD_UNID_NEG = M.CD_UNID_NEG)'
      '   LEFT JOIN TTRANSPORTADOR_ITL T ON(T.CODIGO = M.CD_CIA_TRANSP)'
      '   LEFT JOIN TPRODUTO P ON (P.CD_PRODUTO = M.CD_PRODUTO)'
      '    WHERE F.CD_MASTER = :CD_MASTER'
      '      AND F.NR_FATURA = :NR_FATURA'
      '      AND F.CD_MASTER = M.CD_MASTER'
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
      ''
      ' '
      ' ')
    Left = 176
    Top = 232
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_FATURA'
        ParamType = ptUnknown
      end>
    object qry_rel_imp_fat_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_rel_imp_fat_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_rel_imp_fat_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_rel_imp_fat_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_rel_imp_fat_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_rel_imp_fat_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_rel_imp_fat_TT_FRETE_MASTER: TFloatField
      FieldName = 'TT_FRETE_MASTER'
    end
    object qry_rel_imp_fat_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object qry_rel_imp_fat_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_rel_imp_fat_END_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_rel_imp_fat_CGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      FixedChar = True
      Size = 14
    end
    object qry_rel_imp_fat_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_rel_imp_fat_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_rel_imp_fat_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_rel_imp_fat_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_rel_imp_fat_NR_FONE: TStringField
      FieldName = 'NR_FONE'
      FixedChar = True
    end
    object qry_rel_imp_fat_END_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_rel_imp_fat_NR_FAX1: TStringField
      FieldName = 'NR_FAX1'
      FixedChar = True
    end
    object qry_rel_imp_fat_END_AGENTE: TStringField
      FieldName = 'END_AGENTE'
      FixedChar = True
      Size = 255
    end
    object qry_rel_imp_fat_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_rel_imp_fat_VL_FRETE_VENDA: TFloatField
      FieldName = 'VL_FRETE_VENDA'
    end
    object qry_rel_imp_fat_ORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_imp_fat_DESTINO: TStringField
      FieldName = 'DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_rel_imp_fat_DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object qry_rel_imp_fat_calc_unidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_unidade'
      Size = 250
      Calculated = True
    end
    object qry_rel_imp_fat_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 25
    end
    object qry_rel_imp_fat_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_rel_imp_fat_SIGLA_CIA_TRANSP: TStringField
      FieldName = 'SIGLA_CIA_TRANSP'
      FixedChar = True
      Size = 3
    end
    object qry_rel_imp_fat_calc_profit: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_profit'
      Calculated = True
    end
    object qry_rel_imp_fat_calc_profit_share: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_profit_share'
      Calculated = True
    end
    object qry_rel_imp_fat_VL_ACCOUNT: TFloatField
      FieldName = 'VL_ACCOUNT'
    end
    object qry_rel_imp_fat_calc_vl_fatura: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_fatura'
      Calculated = True
    end
    object qry_rel_imp_fat_calc_nm_fatura: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_fatura'
      Size = 150
      Calculated = True
    end
    object qry_rel_imp_fat_DT_DOCUMENTO: TDateTimeField
      FieldName = 'DT_DOCUMENTO'
    end
    object qry_rel_imp_fat_TP_FATURA: TStringField
      FieldName = 'TP_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_rel_imp_fat_calc_tp_fatura: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_fatura'
      Size = 150
      Calculated = True
    end
    object qry_rel_imp_fat_VL_FATURA: TFloatField
      FieldName = 'VL_FATURA'
    end
    object qry_rel_imp_fat_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      BlobType = ftMemo
    end
  end
  object ds_rel_imp_fat: TDataSource
    DataSet = qry_rel_imp_fat_
    Left = 176
    Top = 280
  end
  object pp_impressa_fatura: TppBDEPipeline
    DataSource = ds_rel_imp_fat
    UserName = 'pp_impressa_fatura'
    Left = 176
    Top = 336
  end
  object pp_impressa_fat_item: TppBDEPipeline
    DataSource = ds_rel_imp_fat_item_
    UserName = 'pp_impressa_fat_item'
    Left = 416
    Top = 304
  end
  object qry_rel_imp_fat_item_: TQuery
    OnCalcFields = qry_rel_imp_fat_item_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_rel_imp_fat
    SQL.Strings = (
      'SELECT F.CD_MASTER, F.CODIGO, F.CD_ITEM, F.VL_ITEM,'
      
        '    (SELECT I.NM_ITEM FROM TITEM I WHERE I.CD_ITEM = F.CD_ITEM) ' +
        'NM_ITEM,'
      
        '    (SELECT I.NM_ITEM_INGLES FROM TITEM I WHERE I.CD_ITEM = F.CD' +
        '_ITEM) NM_ITEM_INGLES'
      '      FROM TMASTER_FATURA_AG_ITEM F'
      '       WHERE F.CD_MASTER =:CD_MASTER'
      '         AND F.NR_FATURA =:NR_FATURA'
      ' ')
    Left = 288
    Top = 232
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_FATURA'
        ParamType = ptUnknown
      end>
    object qry_rel_imp_fat_item_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 18
    end
    object qry_rel_imp_fat_item_CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 2
    end
    object qry_rel_imp_fat_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_imp_fat_item_VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object qry_rel_imp_fat_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_rel_imp_fat_item_calc_tp_fatura: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_fatura'
      Size = 255
      Calculated = True
    end
    object qry_rel_imp_fat_item_NM_ITEM_INGLES: TStringField
      FieldName = 'NM_ITEM_INGLES'
      FixedChar = True
      Size = 30
    end
  end
  object ds_rel_imp_fat_item_: TDataSource
    DataSet = qry_rel_imp_fat_item_
    Left = 264
    Top = 280
  end
  object qry_reemissao_fatura_: TQuery
    OnCalcFields = qry_reemissao_fatura_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MASTER, CD_UNID_NEG, M.CD_PRODUTO, M.CD_VIA_TRANSP, ' +
        'M.NR_MASTER, F.CD_FATURA,'
      '       M.CD_AGENTE, M.CD_MOEDA,'
      '       M.CD_ORIGEM, M.CD_DESTINO,'
      
        '       (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGENTE = M.' +
        'CD_AGENTE)NM_AGENTE, M.IN_ACCOUNT,'
      
        '       (SELECT V.NM_VIA_TRANSP FROM TVIA_TRANSP_BROKER V WHERE V' +
        '.CD_VIA_transp = M.CD_VIA_TRANSP) NM_VIA_TRANSP,'
      '    CASE M.CD_VIA_TRANSP'
      
        '      WHEN '#39'04'#39' THEN (SELECT O.CD_SIGLA FROM TPORTO O WHERE O.CD' +
        '_PORTO = M.CD_ORIGEM)'
      
        '      ELSE (SELECT O.CD_SIGLA_CIDADE FROM TPORTO O WHERE O.CD_PO' +
        'RTO = M.CD_ORIGEM)'
      '     END AS AP_ORIGEM,'
      '    CASE M.CD_VIA_TRANSP'
      
        '      WHEN '#39'04'#39' THEN (SELECT D.CD_SIGLA FROM TPORTO D WHERE D.CD' +
        '_PORTO = M.CD_DESTINO)'
      
        '      ELSE (SELECT D.CD_SIGLA_CIDADE FROM TPORTO D WHERE D.CD_PO' +
        'RTO = M.CD_DESTINO)'
      '     END AS AP_DESTINO,'
      
        '    (SELECT MO.AP_MOEDA FROM TMOEDA_BROKER MO WHERE MO.CD_MOEDA ' +
        '= M.CD_MOEDA)AP_MOEDA,'
      '    CASE'
      '    WHEN F.TP_FATURA = '#39'0'#39' THEN F.VL_CRE_AGENTE'
      '    WHEN F.TP_FATURA = '#39'1'#39' THEN F.VL_DEB_AGENTE'
      '    WHEN F.TP_FATURA = '#39'2'#39' THEN F.VL_CRE_BRASIL'
      '    WHEN F.TP_FATURA = '#39'3'#39' THEN F.VL_DEB_BRASIL'
      '    ELSE VL_AJUSTE END VL_FATURA,'
      '    F.TP_FATURA, F.NR_FATURA, F.DT_FATURA, F.IN_FATURA'
      '  FROM TMASTER_FATURA_AG F, TMASTER M'
      '    WHERE M.CD_UNID_NEG = :CD_UNID_NEG'
      '      AND M.CD_PRODUTO  = :CD_PRODUTO'
      '      AND M.CD_MASTER   = F.CD_MASTER'
      '      AND F.TP_FATURA IN ('#39'2'#39', '#39'3'#39')'
      ''
      '      ORDER BY'
      '       M.CD_MASTER'
      ' '
      ' '
      ' ')
    Left = 528
    Top = 32
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
    object qry_reemissao_fatura_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_reemissao_fatura_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_reemissao_fatura_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_reemissao_fatura_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_reemissao_fatura_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 25
    end
    object qry_reemissao_fatura_CD_FATURA: TStringField
      FieldName = 'CD_FATURA'
      FixedChar = True
      Size = 2
    end
    object qry_reemissao_fatura_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_reemissao_fatura_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_reemissao_fatura_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_reemissao_fatura_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_reemissao_fatura_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_reemissao_fatura_IN_ACCOUNT: TStringField
      FieldName = 'IN_ACCOUNT'
      FixedChar = True
      Size = 1
    end
    object qry_reemissao_fatura_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object qry_reemissao_fatura_AP_ORIGEM: TStringField
      FieldName = 'AP_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_reemissao_fatura_AP_DESTINO: TStringField
      FieldName = 'AP_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_reemissao_fatura_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_reemissao_fatura_VL_FATURA: TFloatField
      FieldName = 'VL_FATURA'
      DisplayFormat = '0.00'
    end
    object qry_reemissao_fatura_TP_FATURA: TStringField
      FieldName = 'TP_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_reemissao_fatura_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_reemissao_fatura_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
    end
    object qry_reemissao_fatura_IN_FATURA: TStringField
      FieldName = 'IN_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_reemissao_fatura_calc_tp_fatura: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_fatura'
      Size = 40
      Calculated = True
    end
  end
  object ds_reemissao: TDataSource
    DataSet = qry_reemissao_fatura_
    Left = 544
    Top = 88
  end
end
