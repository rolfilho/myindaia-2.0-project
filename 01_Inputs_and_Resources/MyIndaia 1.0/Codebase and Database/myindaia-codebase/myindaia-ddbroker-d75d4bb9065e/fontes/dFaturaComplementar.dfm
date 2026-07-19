object datm_fat_Itl_complementar: Tdatm_fat_Itl_complementar
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object qry_fatura_compl_: TQuery
    CachedUpdates = True
    BeforePost = qry_fatura_compl_BeforePost
    AfterPost = qry_fatura_compl_AfterDelete
    AfterDelete = qry_fatura_compl_AfterDelete
    AfterScroll = qry_fatura_compl_AfterScroll
    OnCalcFields = qry_fatura_compl_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MASTER, M.CD_UNID_NEG, M.CD_PRODUTO, M.CD_VIA_TRANSP' +
        ', M.NR_MASTER, M.CD_AGENTE,'
      '  M.CD_ORIGEM, M.CD_DESTINO, M.CD_MOEDA,'
      '  CASE'
      
        '   WHEN M.CD_VIA_TRANSP = '#39'01'#39' THEN (SELECT P.CD_SIGLA_CIDADE FR' +
        'OM TPORTO P WHERE P.CD_PORTO = M.CD_ORIGEM)'
      
        '   ELSE (SELECT P.CD_SIGLA FROM TPORTO P WHERE P.CD_PORTO = M.CD' +
        '_ORIGEM) END AS NM_ORIGEM,'
      '  CASE'
      
        '   WHEN M.CD_VIA_TRANSP = '#39'01'#39' THEN (SELECT P.CD_SIGLA_CIDADE FR' +
        'OM TPORTO P WHERE P.CD_PORTO = M.CD_DESTINO)'
      
        '   ELSE (SELECT P.CD_SIGLA FROM TPORTO P WHERE P.CD_PORTO = M.CD' +
        '_DESTINO) END AS NM_DESTINO,'
      
        '   (SELECT B.AP_MOEDA FROM TMOEDA_BROKER B WHERE B.CD_MOEDA = M.' +
        'CD_MOEDA) AP_MOEDA, M.DT_CHEGADA,'
      
        '   (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGENTE = M.CD_A' +
        'GENTE)NM_AGENTE, M.DT_EMBARQUE, M.DT_EMISSAO_DTA,'
      
        '   F.NR_FATURA, F.TP_FATURA, F.IN_FATURA, F.VL_CRE_BRASIL, F.VL_' +
        'DEB_BRASIL, F.VL_CRE_AGENTE, F.VL_DEB_AGENTE,'
      
        '   F.CD_FATURA, F.IN_COMPLEMENTAR, F.DT_FATURA, F.CD_STATUS, F.D' +
        'T_CONTABILIZACAO, F.TX_OBS,'
      
        '   (SELECT P.TP_PRODUTO FROM TPRODUTO P WHERE P.CD_PRODUTO = M.C' +
        'D_PRODUTO) TP_PRODUTO'
      ''
      ''
      ''
      ' FROM  TMASTER M, TMASTER_FATURA_AG F'
      '  WHERE M.CD_UNID_NEG = :CD_UNID_NEG'
      '   AND  M.CD_PRODUTO  = :CD_PRODUTO'
      '   AND  M.CD_MASTER = F.CD_MASTER'
      '   AND  F.IN_COMPLEMENTAR = '#39'1'#39
      ''
      'ORDER BY'
      '   M.CD_MASTER'
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
      ' ')
    UpdateObject = UpdateSQL1
    Left = 40
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
    object qry_fatura_compl_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_fatura_compl_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_compl_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_compl_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_compl_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_fatura_compl_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_fatura_compl_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_fatura_compl_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_fatura_compl_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_fatura_compl_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_fatura_compl_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_fatura_compl_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_fatura_compl_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 25
    end
    object qry_fatura_compl_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_fatura_compl_TP_FATURA: TStringField
      FieldName = 'TP_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_compl_IN_FATURA: TStringField
      FieldName = 'IN_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_compl_VL_CRE_BRASIL: TFloatField
      FieldName = 'VL_CRE_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_fatura_compl_VL_DEB_BRASIL: TFloatField
      FieldName = 'VL_DEB_BRASIL'
      DisplayFormat = '0.00'
    end
    object qry_fatura_compl_VL_CRE_AGENTE: TFloatField
      FieldName = 'VL_CRE_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_fatura_compl_VL_DEB_AGENTE: TFloatField
      FieldName = 'VL_DEB_AGENTE'
      DisplayFormat = '0.00'
    end
    object qry_fatura_compl_CD_FATURA: TStringField
      FieldName = 'CD_FATURA'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_compl_IN_COMPLEMENTAR: TStringField
      FieldName = 'IN_COMPLEMENTAR'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_compl_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_fatura_compl_calc_vl_fatura: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_fatura'
      Calculated = True
    end
    object qry_fatura_compl_calc_tp_fatura: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_fatura'
      Size = 15
      Calculated = True
    end
    object qry_fatura_compl_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      BlobType = ftMemo
    end
    object qry_fatura_compl_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_compl_DT_CONTABILIZACAO: TDateTimeField
      FieldName = 'DT_CONTABILIZACAO'
    end
    object qry_fatura_compl_TP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_compl_DT_CHEGADA: TDateTimeField
      FieldName = 'DT_CHEGADA'
    end
    object qry_fatura_compl_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object qry_fatura_compl_DT_EMISSAO_DTA: TDateTimeField
      FieldName = 'DT_EMISSAO_DTA'
    end
    object qry_fatura_compl_calc_in_imporesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_in_imporesso'
      Size = 25
      Calculated = True
    end
  end
  object ds_fatura_compl: TDataSource
    DataSet = qry_fatura_compl_
    Left = 40
    Top = 72
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'update TMASTER_FATURA_AG'
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
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  CD_STATUS = :CD_STATUS,'
      '  DT_CONTABILIZACAO = :DT_CONTABILIZACAO,'
      '  TX_OBS = :TX_OBS,'
      '  IN_COMPLEMENTAR = :IN_COMPLEMENTAR'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_FATURA = :OLD_CD_FATURA')
    InsertSQL.Strings = (
      'insert into TMASTER_FATURA_AG'
      
        '  (CD_MASTER, NR_FATURA, CD_FATURA, TP_FATURA, IN_FATURA, DT_FAT' +
        'URA, VL_CRE_AGENTE, '
      
        '   VL_DEB_AGENTE, VL_CRE_BRASIL, VL_DEB_BRASIL, CD_VIA_TRANSP, C' +
        'D_MOEDA, '
      
        '   CD_AGENTE, CD_STATUS, DT_CONTABILIZACAO, TX_OBS, IN_COMPLEMEN' +
        'TAR)'
      'values'
      
        '  (:CD_MASTER, :NR_FATURA, :CD_FATURA, :TP_FATURA, :IN_FATURA, :' +
        'DT_FATURA, '
      
        '   :VL_CRE_AGENTE, :VL_DEB_AGENTE, :VL_CRE_BRASIL, :VL_DEB_BRASI' +
        'L, :CD_VIA_TRANSP, '
      
        '   :CD_MOEDA, :CD_AGENTE, :CD_STATUS, :DT_CONTABILIZACAO, :TX_OB' +
        'S, :IN_COMPLEMENTAR)')
    DeleteSQL.Strings = (
      'delete from TMASTER_FATURA_AG'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_FATURA = :OLD_CD_FATURA')
    Left = 144
    Top = 24
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
    Top = 128
    ParamData = <
      item
        DataType = ftString
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
  object qry_fatura_item_: TQuery
    CachedUpdates = True
    BeforePost = qry_fatura_item_BeforePost
    AfterPost = qry_fatura_item_AfterDelete
    AfterDelete = qry_fatura_item_AfterDelete
    OnNewRecord = qry_fatura_item_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT F.CD_MASTER,  F.NR_FATURA, F.CODIGO,'
      '       F.CD_ITEM,  F.VL_ITEM,'
      
        '       (SELECT I.NM_ITEM FROM TITEM I WHERE I.CD_ITEM = F.CD_ITE' +
        'M) NM_ITEM'
      ' FROM TMASTER_FATURA_AG_ITEM F'
      'WHERE F.CD_MASTER = :CD_MASTER'
      '     AND  F.NR_FATURA = :NR_FATURA ')
    UpdateObject = UpdateSQL2
    Left = 40
    Top = 200
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
    object qry_fatura_item_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 18
    end
    object qry_fatura_item_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 6
    end
    object qry_fatura_item_CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_fatura_item_VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      DisplayFormat = '0.00'
    end
    object qry_fatura_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_fatura_item_Look_nm_item: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 50
      Lookup = True
    end
  end
  object ds_fat_item: TDataSource
    DataSet = qry_fatura_item_
    Left = 40
    Top = 264
  end
  object UpdateSQL2: TUpdateSQL
    ModifySQL.Strings = (
      'update TMASTER_FATURA_AG_ITEM'
      'set'
      '  CD_MASTER = :CD_MASTER,'
      '  NR_FATURA = :NR_FATURA,'
      '  CODIGO = :CODIGO,'
      '  CD_ITEM = :CD_ITEM,'
      '  VL_ITEM = :VL_ITEM'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  NR_FATURA = :OLD_NR_FATURA and'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TMASTER_FATURA_AG_ITEM'
      '  (CD_MASTER, NR_FATURA, CODIGO, CD_ITEM, VL_ITEM)'
      'values'
      '  (:CD_MASTER, :NR_FATURA, :CODIGO, :CD_ITEM, :VL_ITEM)')
    DeleteSQL.Strings = (
      'delete from TMASTER_FATURA_AG_ITEM'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  NR_FATURA = :OLD_NR_FATURA and'
      '  CODIGO = :OLD_CODIGO')
    Left = 112
    Top = 200
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM FROM TITEM'
      ' WHERE IN_ATIVO = '#39'1'#39
      '   AND  TP_ITEM IN('#39'0'#39', '#39'1'#39', '#39'2'#39')'
      'ORDER BY NM_ITEM')
    Left = 48
    Top = 320
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
  end
  object sp_calc_fat_master_compl: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_calculo_fatura_master_complementar'
    Left = 320
    Top = 32
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
        Name = '@cd_fatura'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_via_transp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_fatura'
        ParamType = ptInput
      end>
  end
  object qry_rel_imp_fat_: TQuery
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
    Left = 272
    Top = 168
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
    Left = 272
    Top = 224
  end
  object pp_impressa_fatura: TppBDEPipeline
    DataSource = ds_rel_imp_fat
    UserName = 'pp_impressa_fatura'
    Left = 272
    Top = 280
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
    Left = 392
    Top = 160
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
    Left = 392
    Top = 216
  end
  object pp_impressa_fat_item: TppBDEPipeline
    DataSource = ds_rel_imp_fat_item_
    UserName = 'pp_impressa_fat_item'
    Left = 400
    Top = 272
  end
  object sp_cont_Fat_itl_master_compl: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_Fat_itl_master_compl'
    Left = 328
    Top = 88
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
        Name = '@cd_fatura'
        ParamType = ptInput
      end>
  end
end
