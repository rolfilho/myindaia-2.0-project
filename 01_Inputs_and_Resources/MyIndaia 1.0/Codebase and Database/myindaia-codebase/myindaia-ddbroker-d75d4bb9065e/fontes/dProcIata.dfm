object datm_proc_iata: Tdatm_proc_iata
  OldCreateOrder = False
  Left = 42
  Top = 87
  Height = 480
  Width = 886
  object qry_lista_cia_: TQuery
    CachedUpdates = True
    AfterOpen = qry_lista_cia_AfterOpen
    AfterPost = qry_lista_cia_AfterPost
    OnCalcFields = qry_lista_cia_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MASTER, M.CD_UNID_NEG,M.CD_PRODUTO, M.CD_VIA_TRANSP,' +
        ' M.CD_CIA_TRANSP, M.DT_EMBARQUE, M.IN_SEL_IATA,'
      
        '  M.DT_EMISSAO_DTA,  M.NR_MASTER, M.CHARG_MASTER, ISNULL(M.TARIF' +
        'A_AUX,0) AS TARIFA_IMPRESSA, M.NR_RELATORIO,'
      '  CASE '
      '   WHEN R.IN_CONVERSAO_IATA = '#39'1'#39' THEN ISNULL(E.VL_TAXA,0)'
      '   ELSE ISNULL(T.VL_TAXA,0) END as VL_TAXA,  M.TP_FRETE_MASTER,'
      '  CASE'
      
        '   WHEN R.IN_CONVERSAO_IATA = '#39'1'#39' THEN ISNULL((M.CHARG_MASTER * ' +
        'M.TARIFA_AUX * E.VL_TAXA),0)'
      
        '   ELSE ISNULL((M.CHARG_MASTER * M.TARIFA_AUX * T.VL_TAXA),0) EN' +
        'D AS FRETE_REAL,'
      '  ISNULL(M.TARIFA_CUSTO_CIA,0) as TARIFA_CUSTO_CIA,'
      '  CASE'
      '   WHEN R.IN_CONVERSAO_IATA = '#39'1'#39' THEN'
      '    ISNULL((SELECT SUM(D.VL_COMPRA_AG)* E.VL_TAXA'
      '              FROM TMASTER_DESPESAS D'
      
        '             WHERE D.CD_MASTER = M.CD_MASTER AND TP_DUE = '#39'A'#39'),0' +
        ')'
      '   ELSE ISNULL((SELECT SUM(D.VL_COMPRA_AG)* T.VL_TAXA'
      '                  FROM TMASTER_DESPESAS D'
      
        '                  WHERE D.CD_MASTER = M.CD_MASTER AND TP_DUE = '#39 +
        'A'#39'),0) END AS OTHER_CH_AG,'
      '  CASE'
      '   WHEN R.IN_CONVERSAO_IATA = '#39'1'#39' THEN'
      '   ISNULL((SELECT SUM(D.VL_COMPRA_AG) * E.VL_TAXA'
      '             FROM TMASTER_DESPESAS D'
      '            WHERE D.CD_MASTER = M.CD_MASTER AND TP_DUE = '#39'C'#39'),0)'
      '   ELSE ISNULL((SELECT SUM(D.VL_COMPRA_AG) * T.VL_TAXA'
      '                  FROM TMASTER_DESPESAS D'
      
        '                 WHERE D.CD_MASTER = M.CD_MASTER AND TP_DUE = '#39'C' +
        #39'),0) END AS OTHER_CH_CIA,'
      '  CASE'
      '   WHEN R.IN_CONVERSAO_IATA = '#39'1'#39' THEN'
      
        '   ISNULL((SELECT SUM(P.VL_COMISS_IATA) * T.VL_TAXA FROM TPROCES' +
        'SO P, THOUSE H'
      '            WHERE P.NR_PROCESSO = H.NR_PROCESSO AND'
      '              H.CD_MASTER = M.CD_MASTER),0)'
      
        '  ELSE ISNULL((SELECT SUM(P.VL_COMISS_IATA) * T.VL_TAXA FROM TPR' +
        'OCESSO P, THOUSE H'
      '                WHERE P.NR_PROCESSO = H.NR_PROCESSO AND'
      '                 H.CD_MASTER = M.CD_MASTER),0) END AS  COM_IATA,'
      '  ISNULL(M.GROSS_MASTER,0) AS VL_PESO_BRUTO,'
      '  CASE'
      '   WHEN R.IN_CONVERSAO_IATA = '#39'1'#39' THEN'
      
        '   ISNULL((SELECT SUM(P.  VL_OVER) * E.VL_TAXA FROM TPROCESSO P,' +
        ' THOUSE H'
      '     WHERE P.NR_PROCESSO = H.NR_PROCESSO AND'
      '           H.CD_MASTER = M.CD_MASTER),0)'
      
        '   ELSE ISNULL((SELECT SUM(P.  VL_OVER) * T.VL_TAXA FROM TPROCES' +
        'SO P, THOUSE H'
      '               WHERE P.NR_PROCESSO = H.NR_PROCESSO AND'
      '               H.CD_MASTER = M.CD_MASTER),0) END AS VL_OVER,'
      ''
      
        '  (SELECT MO.AP_MOEDA FROM TMOEDA_BROKER MO WHERE MO.CD_MOEDA = ' +
        'M.CD_MOEDA)AP_MOEDA,'
      ''
      
        '  R.IN_CALC_IR_IATA, R.IN_CALC_IR_OVER, R.TP_FATURA, R.IN_IRRF_M' +
        'IN, R.IN_IRRF_FATURA'
      ''
      '  FROM TPRODUTO PR, TMASTER M'
      
        '  LEFT JOIN TTAXA_IATA T ON (T.CD_MOEDA = M.CD_MOEDA AND T.DT_IN' +
        'ICIO = M.DT_EMISSAO_DTA)'
      
        '  LEFT JOIN TTAXA_IATA E ON (E.CD_MOEDA = M.CD_MOEDA AND E.DT_IN' +
        'ICIO = M.DT_EMBARQUE)'
      '  LEFT JOIN TTRANSPORTADOR_ITL R ON(R.CODIGO = M.CD_CIA_TRANSP)'
      
        '  WHERE  M.CD_UNID_NEG = :CD_UNID_NEG AND M.CD_PRODUTO = :CD_PRO' +
        'DUTO'
      '  AND M.CD_PRODUTO = PR.CD_PRODUTO AND PR.TP_PRODUTO = '#39'02'#39
      
        '  AND M.CD_VIA_TRANSP = '#39'04'#39' AND M.IN_ACCOUNT IN('#39'1'#39', '#39'2'#39', '#39'3'#39', ' +
        #39'4'#39', '#39'5'#39', '#39'6'#39', '#39'7'#39', '#39'9'#39')'
      '  AND M.CD_CIA_TRANSP = :CD_CIA AND M.IN_SEL_IATA IN ('#39'0'#39','#39'1'#39')'
      
        '  AND M.DT_EMISSAO_DTA BETWEEN CONVERT(DATETIME, :DT_INICIO ,103' +
        ')'
      '  AND CONVERT(DATETIME, :DT_FIM,103)'
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
      ' ')
    UpdateObject = Update_Lista
    Left = 40
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
        Name = 'CD_CIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'DT_FIM'
        ParamType = ptUnknown
      end>
    object qry_lista_cia_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_lista_cia_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_lista_cia_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_lista_cia_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_lista_cia_CD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      FixedChar = True
      Size = 4
    end
    object qry_lista_cia_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object qry_lista_cia_DT_EMISSAO_DTA: TDateTimeField
      FieldName = 'DT_EMISSAO_DTA'
    end
    object qry_lista_cia_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 25
    end
    object qry_lista_cia_CHARG_MASTER: TFloatField
      FieldName = 'CHARG_MASTER'
      DisplayFormat = '0.000'
    end
    object qry_lista_cia_TARIFA_IMPRESSA: TFloatField
      FieldName = 'TARIFA_IMPRESSA'
      DisplayFormat = '0.00'
    end
    object qry_lista_cia_VL_TAXA: TFloatField
      FieldName = 'VL_TAXA'
      DisplayFormat = '0.00'
    end
    object qry_lista_cia_FRETE_REAL: TFloatField
      FieldName = 'FRETE_REAL'
      DisplayFormat = '0.00'
    end
    object qry_lista_cia_TARIFA_CUSTO_CIA: TFloatField
      FieldName = 'TARIFA_CUSTO_CIA'
      DisplayFormat = '0.00'
    end
    object qry_lista_cia_OTHER_CH_AG: TFloatField
      FieldName = 'OTHER_CH_AG'
      DisplayFormat = '0.00'
    end
    object qry_lista_cia_OTHER_CH_CIA: TFloatField
      FieldName = 'OTHER_CH_CIA'
      DisplayFormat = '0.00'
    end
    object qry_lista_cia_COM_IATA: TFloatField
      FieldName = 'COM_IATA'
      DisplayFormat = '0.00'
    end
    object qry_lista_cia_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_lista_cia_VL_OVER: TFloatField
      FieldName = 'VL_OVER'
      DisplayFormat = '0.00'
    end
    object qry_lista_cia_calc_tt_prepaid: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_tt_prepaid'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qry_lista_cia_IN_SEL_IATA: TStringField
      FieldName = 'IN_SEL_IATA'
      FixedChar = True
      Size = 1
    end
    object qry_lista_cia_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qry_lista_cia_TP_FRETE_MASTER: TStringField
      FieldName = 'TP_FRETE_MASTER'
      FixedChar = True
      Size = 1
    end
    object qry_lista_cia_calc_tt_collect: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_tt_collect'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qry_lista_cia_NR_RELATORIO: TStringField
      FieldName = 'NR_RELATORIO'
      FixedChar = True
      Size = 6
    end
    object qry_lista_cia_IN_CALC_IR_IATA: TStringField
      FieldName = 'IN_CALC_IR_IATA'
      FixedChar = True
      Size = 1
    end
    object qry_lista_cia_IN_CALC_IR_OVER: TStringField
      FieldName = 'IN_CALC_IR_OVER'
      FixedChar = True
      Size = 1
    end
    object qry_lista_cia_TP_FATURA: TStringField
      FieldName = 'TP_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_lista_cia_IN_IRRF_MIN: TStringField
      FieldName = 'IN_IRRF_MIN'
      FixedChar = True
      Size = 1
    end
    object qry_lista_cia_IN_IRRF_FATURA: TStringField
      FieldName = 'IN_IRRF_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_lista_cia_calc_vl_ir: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_ir'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qry_lista_cia_calc_ir_iata: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_ir_iata'
      Calculated = True
    end
    object qry_lista_cia_calc_ir_over: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_ir_over'
      Calculated = True
    end
  end
  object ds_lista_cia: TDataSource
    DataSet = qry_lista_cia_
    Left = 24
    Top = 64
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
    Left = 128
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
    Top = 17
  end
  object sp_receb_cia_aerea: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_receb_cia_aerea'
    Left = 351
    Top = 82
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
        DataType = ftFloat
        Name = '@vl_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@peso_master'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cia'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_ir_iata'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_ir_over'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_relatorio'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_iata'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_over'
        ParamType = ptInput
      end>
  end
  object sp_pagto_cia_aerea: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_pagto_cia_aerea'
    Left = 474
    Top = 17
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
        Name = '@tp_destino'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@peso_master'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cia'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_vencto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@docto'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_ir_iata'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_ir_over'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_relatorio'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_iata'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_over'
        ParamType = ptInput
      end>
  end
  object Update_Lista: TUpdateSQL
    ModifySQL.Strings = (
      'update TMASTER'
      'set'
      '  CD_MASTER = :CD_MASTER,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  NR_MASTER = :NR_MASTER,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  DT_EMISSAO_DTA = :DT_EMISSAO_DTA,'
      '  CD_CIA_TRANSP = :CD_CIA_TRANSP,'
      '  DT_EMBARQUE = :DT_EMBARQUE,'
      '  TP_FRETE_MASTER = :TP_FRETE_MASTER,'
      '  CHARG_MASTER = :CHARG_MASTER,'
      '  TARIFA_CUSTO_CIA = :TARIFA_CUSTO_CIA,'
      '  IN_SEL_IATA = :IN_SEL_IATA,'
      '  NR_RELATORIO = :NR_RELATORIO'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_VIA_TRANSP = :OLD_CD_VIA_TRANSP')
    InsertSQL.Strings = (
      'insert into TMASTER'
      
        '  (CD_MASTER, CD_UNID_NEG, CD_PRODUTO, NR_MASTER, CD_VIA_TRANSP,' +
        ' DT_EMISSAO_DTA, '
      
        '   CD_CIA_TRANSP, DT_EMBARQUE, TP_FRETE_MASTER, CHARG_MASTER, TA' +
        'RIFA_CUSTO_CIA, '
      '   IN_SEL_IATA, NR_RELATORIO)'
      'values'
      
        '  (:CD_MASTER, :CD_UNID_NEG, :CD_PRODUTO, :NR_MASTER, :CD_VIA_TR' +
        'ANSP, :DT_EMISSAO_DTA, '
      
        '   :CD_CIA_TRANSP, :DT_EMBARQUE, :TP_FRETE_MASTER, :CHARG_MASTER' +
        ', :TARIFA_CUSTO_CIA, '
      '   :IN_SEL_IATA, :NR_RELATORIO)')
    DeleteSQL.Strings = (
      'delete from TMASTER'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_VIA_TRANSP = :OLD_CD_VIA_TRANSP')
    Left = 32
    Top = 120
  end
  object qry_lista_armador_: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MASTER, M.CD_UNID_NEG, M.CD_PRODUTO, M.CD_VIA_TRANSP' +
        ', M.NR_MASTER,'
      '  M.CD_AGENTE, M.CD_ARMADOR, M.CD_NOTIFICADOR, M.TARIFA_AUX,'
      
        '  M.TP_FRETE_MASTER, (SELECT SUM(VL_OVER) FROM TPROCESSO P, THOU' +
        'SE H WHERE H.CD_MASTER = M.CD_MASTER AND'
      '                H.NR_PROCESSO = P.NR_PROCESSO) AS VL_COMISSAO,'
      '  M.CD_MOEDA, M.CD_ORIGEM, M.CD_DESTINO,'
      
        '  (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGENTE = M.CD_AG' +
        'ENTE) NM_AGENTE,'
      
        '  (SELECT T.DESCRICAO FROM TTRANSPORTADOR_ITL T WHERE T.CODIGO =' +
        ' M.CD_ARMADOR) NM_ARMADOR,'
      
        '  (SELECT N.NM_NOTIFICADOR FROM TNOTIFICADOR N WHERE N.CD_NOTIFI' +
        'CADOR = M.CD_NOTIFICADOR) NM_NOTIFICADOR,'
      
        '  (SELECT MO.AP_MOEDA FROM TMOEDA_BROKER MO WHERE MO.CD_MOEDA = ' +
        'M.CD_MOEDA) AP_MOEDA,'
      
        '  (SELECT O.CD_SIGLA_CIDADE FROM TPORTO O WHERE O.CD_PORTO = M.C' +
        'D_ORIGEM) NM_ORIGEM,'
      
        '  (SELECT D.CD_SIGLA_CIDADE FROM TPORTO D WHERE D.CD_PORTO = M.C' +
        'D_DESTINO) NM_DESTINO'
      ''
      ''
      '  FROM TMASTER M'
      
        '   WHERE M.CD_UNID_NEG = :CD_UNID_NEG AND M.CD_PRODUTO =:CD_PROD' +
        'UTO'
      '     AND M.CD_VIA_TRANSP = '#39'01'#39' AND M.TP_FRETE_MASTER = '#39'0'#39
      '     AND M.IN_ACCOUNT NOT IN('#39'0'#39','#39'2'#39')'
      ''
      ' ')
    UpdateObject = UpdateSQL1
    Left = 32
    Top = 208
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
    object qry_lista_armador_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_lista_armador_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_lista_armador_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_lista_armador_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_lista_armador_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_lista_armador_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_lista_armador_CD_NOTIFICADOR: TStringField
      FieldName = 'CD_NOTIFICADOR'
      FixedChar = True
      Size = 4
    end
    object qry_lista_armador_TP_FRETE_MASTER: TStringField
      FieldName = 'TP_FRETE_MASTER'
      FixedChar = True
      Size = 1
    end
    object qry_lista_armador_VL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      DisplayFormat = '0.00'
    end
    object qry_lista_armador_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_lista_armador_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_lista_armador_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_lista_armador_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_lista_armador_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 60
    end
    object qry_lista_armador_NM_NOTIFICADOR: TStringField
      FieldName = 'NM_NOTIFICADOR'
      FixedChar = True
      Size = 50
    end
    object qry_lista_armador_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_lista_armador_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_lista_armador_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_lista_armador_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 25
    end
    object qry_lista_armador_TARIFA_AUX: TFloatField
      FieldName = 'TARIFA_AUX'
      DisplayFormat = '0.00'
    end
  end
  object ds_lista_armador: TDataSource
    DataSet = qry_lista_armador_
    Left = 40
    Top = 256
  end
  object qry_house_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, H.CD_MASTER, H.NR_MASTER, H.CD_HOUSE, H.NR' +
        '_HOUSE, P.VL_OVER, P.VL_COMISS_IATA'
      '  FROM TPROCESSO P, THOUSE H'
      '  WHERE H.CD_MASTER = :CD_MASTER'
      '   AND H.NR_PROCESSO = P.NR_PROCESSO')
    Left = 40
    Top = 312
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end>
    object qry_house_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_house_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      Origin = 'DBBROKER.THOUSE.CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_house_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      Origin = 'DBBROKER.THOUSE.NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_house_CD_HOUSE: TStringField
      FieldName = 'CD_HOUSE'
      Origin = 'DBBROKER.THOUSE.CD_HOUSE'
      FixedChar = True
    end
    object qry_house_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      Origin = 'DBBROKER.THOUSE.NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_house_VL_OVER: TFloatField
      FieldName = 'VL_OVER'
      Origin = 'DBBROKER.TPROCESSO.VL_OVER'
      DisplayFormat = '0.00'
    end
    object qry_house_VL_COMISS_IATA: TFloatField
      FieldName = 'VL_COMISS_IATA'
      Origin = 'DBBROKER.TPROCESSO.VL_COMISS_IATA'
      DisplayFormat = '0.00'
    end
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'update TMASTER'
      'set'
      '  CD_MASTER = :CD_MASTER,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  NR_MASTER = :NR_MASTER,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  CD_ORIGEM = :CD_ORIGEM,'
      '  CD_DESTINO = :CD_DESTINO,'
      '  TP_FRETE_MASTER = :TP_FRETE_MASTER,'
      '  CD_ARMADOR = :CD_ARMADOR,'
      '  CD_NOTIFICADOR = :CD_NOTIFICADOR,'
      '  TARIFA_AUX = :TARIFA_AUX'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_VIA_TRANSP = :OLD_CD_VIA_TRANSP')
    InsertSQL.Strings = (
      'insert into TMASTER'
      
        '  (CD_MASTER, CD_UNID_NEG, CD_PRODUTO, NR_MASTER, CD_VIA_TRANSP,' +
        ' CD_AGENTE, '
      
        '   CD_MOEDA, CD_ORIGEM, CD_DESTINO, TP_FRETE_MASTER, CD_ARMADOR,' +
        ' CD_NOTIFICADOR, '
      '   TARIFA_AUX)'
      'values'
      
        '  (:CD_MASTER, :CD_UNID_NEG, :CD_PRODUTO, :NR_MASTER, :CD_VIA_TR' +
        'ANSP, :CD_AGENTE, '
      
        '   :CD_MOEDA, :CD_ORIGEM, :CD_DESTINO, :TP_FRETE_MASTER, :CD_ARM' +
        'ADOR, :CD_NOTIFICADOR, '
      '   :TARIFA_AUX)')
    DeleteSQL.Strings = (
      'delete from TMASTER'
      'where'
      '  CD_MASTER = :OLD_CD_MASTER and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_VIA_TRANSP = :OLD_CD_VIA_TRANSP')
    Left = 112
    Top = 216
  end
  object ds_house: TDataSource
    DataSet = qry_house_
    Left = 104
    Top = 312
  end
  object qry_ult_ref_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RIGHT( '#39'000'#39' + CONVERT( varchar, ( CONVERT( int, ISNULL( ' +
        'MAX( NR_REF ), '#39'000'#39' ) ) + 1 ) ), 3 ) ULT_REF'
      'FROM   TSOLIC_PAGTO'
      'WHERE  DT_MONTAGEM = CONVERT( datetime, :DT_MONTAGEM, 103)'
      '      AND TP_DESTINO IN('#39'2'#39','#39'4'#39')'
      ' ')
    Left = 448
    Top = 80
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_MONTAGEM'
        ParamType = ptUnknown
      end>
    object qry_ult_ref_ULT_REF: TStringField
      FieldName = 'ULT_REF'
      FixedChar = True
      Size = 3
    end
  end
  object sp_monta_pagto_ctapagar: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_monta_pagto_ctapagar'
    Left = 344
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_montagem'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_vencto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@tp_pagto'
        ParamType = ptInput
      end>
  end
  object qry_ult_ref_receb_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RIGHT( '#39'000'#39' + CONVERT( varchar, ( CONVERT( int, ISNULL( ' +
        'MAX( NR_REF ), '#39'000'#39' ) ) + 1 ) ), 3 ) ULT_REF'
      'FROM   TRECEBIMENTO_IATA'
      'WHERE  DT_MONTAGEM = CONVERT( datetime, :DT_MONTAGEM, 103)'
      ''
      '  ')
    Left = 272
    Top = 88
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_MONTAGEM'
        ParamType = ptUnknown
      end>
    object qry_ult_ref_receb_ULT_REF: TStringField
      FieldName = 'ULT_REF'
      FixedChar = True
      Size = 3
    end
  end
  object qry_receb_pendente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT SUM(R.VL_ITEM) AS VALOR, R.NR_REF, R.DT_MONTAGEM, R.CD_CI' +
        'A,'
      
        ' (SELECT T.DESCRICAO FROM TTRANSPORTADOR_ITL T WHERE T.CODIGO = ' +
        'R.CD_CIA) NM_CIA'
      ' FROM TRECEBIMENTO_IATA R'
      ''
      ' WHERE R.DT_MONTAGEM = CONVERT(DATETIME, :DT_MOTAGEM,103)'
      '   AND ( ( R.CD_CIA = :CD_CIA ) or ( :CD_CIA = '#39#39' ) )'
      '   AND R.CD_STATUS = '#39'0'#39
      ' GROUP BY R.NR_REF, R.DT_MONTAGEM, R.CD_CIA'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 312
    Top = 152
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'DT_MOTAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_CIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_CIA'
        ParamType = ptUnknown
      end>
    object qry_receb_pendente_NR_REF: TStringField
      FieldName = 'NR_REF'
      FixedChar = True
      Size = 3
    end
    object qry_receb_pendente_DT_MONTAGEM: TDateTimeField
      FieldName = 'DT_MONTAGEM'
    end
    object qry_receb_pendente_CD_CIA: TStringField
      FieldName = 'CD_CIA'
      FixedChar = True
      Size = 4
    end
    object qry_receb_pendente_VALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '0.00'
    end
    object qry_receb_pendente_NM_CIA: TStringField
      FieldName = 'NM_CIA'
      FixedChar = True
      Size = 60
    end
  end
  object ds_receb_pendente: TDataSource
    DataSet = qry_receb_pendente_
    Left = 320
    Top = 216
  end
  object qry_receb_item_pendente_: TQuery
    OnCalcFields = qry_receb_item_pendente_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_receb_pendente
    SQL.Strings = (
      
        'SELECT R.NR_REF, R.DT_MONTAGEM, R.NR_PROCESSO, R.CD_ITEM, R.CD_C' +
        'IA, R.VL_ITEM, R.CD_FAVORECIDO,'
      'R.CD_STATUS, R.COD_MASTER,'
      
        '  (SELECT I.NM_ITEM FROM TITEM I WHERE I.CD_ITEM = R.CD_ITEM) NM' +
        '_ITEM'
      '  FROM TRECEBIMENTO_IATA R'
      '   WHERE R.DT_MONTAGEM = :DT_MONTAGEM'
      '    AND R.NR_REF = :NR_REF'
      ' ')
    Left = 440
    Top = 144
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_MONTAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_REF'
        ParamType = ptUnknown
      end>
    object qry_receb_item_pendente_NR_REF: TStringField
      FieldName = 'NR_REF'
      FixedChar = True
      Size = 3
    end
    object qry_receb_item_pendente_DT_MONTAGEM: TDateTimeField
      FieldName = 'DT_MONTAGEM'
    end
    object qry_receb_item_pendente_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_receb_item_pendente_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_receb_item_pendente_CD_CIA: TStringField
      FieldName = 'CD_CIA'
      FixedChar = True
      Size = 4
    end
    object qry_receb_item_pendente_VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      DisplayFormat = '0.00'
    end
    object qry_receb_item_pendente_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      FixedChar = True
      Size = 5
    end
    object qry_receb_item_pendente_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      FixedChar = True
      Size = 2
    end
    object qry_receb_item_pendente_COD_MASTER: TStringField
      FieldName = 'COD_MASTER'
      FixedChar = True
      Size = 18
    end
    object qry_receb_item_pendente_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_receb_item_pendente_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 10
      Calculated = True
    end
  end
  object ds_receb_item_pendente_: TDataSource
    DataSet = qry_receb_item_pendente_
    Left = 448
    Top = 208
  end
  object sp_efetua_recebimento_iata: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_efetua_recebimento_iata'
    Left = 328
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_montagem'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_receb'
        ParamType = ptInput
      end>
  end
  object sp_fatura_relatorio_cia: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_fatura_relatorio_cia'
    Left = 448
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_relatorio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cia'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end>
  end
  object qry_impressao_rel_: TQuery
    OnCalcFields = qry_impressao_rel_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MASTER, M.CD_UNID_NEG,M.CD_PRODUTO, M.CD_VIA_TRANSP,' +
        ' M.CD_CIA_TRANSP, M.DT_EMBARQUE, M.IN_SEL_IATA,'
      
        '  M.DT_EMISSAO_DTA,  M.NR_MASTER, M.CHARG_MASTER, ISNULL(M.TARIF' +
        'A_AUX,0) AS TARIFA_IMPRESSA, M.NR_RELATORIO,'
      '  ISNULL(T.VL_TAXA,0)as VL_TAXA,  M.TP_FRETE_MASTER,'
      
        '  CAST(ISNULL((M.CHARG_MASTER * M.TARIFA_AUX * T.VL_TAXA),0) AS ' +
        'NUMERIC(15,2)) AS FRETE_REAL,'
      
        '  CAST(ISNULL(M.TARIFA_CUSTO_CIA,0)AS NUMERIC(15,2)) as TARIFA_C' +
        'USTO_CIA,'
      '  CAST(ISNULL((SELECT SUM(D.VL_COMPRA_AG)* T.VL_TAXA'
      '    FROM TMASTER_DESPESAS D'
      
        '      WHERE D.CD_MASTER = M.CD_MASTER AND TP_DUE = '#39'A'#39'),0) AS NU' +
        'MERIC(15,2))AS  OTHER_CH_AG,'
      '  CAST(ISNULL((SELECT SUM(D.VL_COMPRA_AG) * T.VL_TAXA'
      '    FROM TMASTER_DESPESAS D'
      
        '      WHERE D.CD_MASTER = M.CD_MASTER AND TP_DUE = '#39'C'#39'),0)AS NUM' +
        'ERIC(15,2))AS OTHER_CH_CIA,'
      
        '  CAST(ISNULL((SELECT SUM(P.VL_COMISS_IATA) * T.VL_TAXA FROM TPR' +
        'OCESSO P, THOUSE H'
      '     WHERE P.NR_PROCESSO = H.NR_PROCESSO AND'
      
        '           H.CD_MASTER = M.CD_MASTER),0) AS NUMERIC(15,2)) AS CO' +
        'M_IATA,  ISNULL(M.GROSS_MASTER,0) AS VL_PESO_BRUTO,'
      
        '   CAST(ISNULL((SELECT SUM(P.  VL_OVER) * T.VL_TAXA FROM TPROCES' +
        'SO P, THOUSE H'
      '     WHERE P.NR_PROCESSO = H.NR_PROCESSO AND'
      
        '           H.CD_MASTER = M.CD_MASTER),0) AS NUMERIC(15,2))AS VL_' +
        'OVER,'
      
        '  (SELECT MO.AP_MOEDA FROM TMOEDA_BROKER MO WHERE MO.CD_MOEDA = ' +
        'M.CD_MOEDA)AP_MOEDA,'
      '  C.DESCRICAO AS NM_CIA, U.NM_UNID_NEG,'
      
        '  C.IN_CALC_IR_IATA, C.IN_CALC_IR_OVER, C.TP_FATURA, C.IN_IRRF_M' +
        'IN, C.IN_IRRF_FATURA'
      '  FROM TPRODUTO PR, TMASTER M'
      '  LEFT JOIN TTRANSPORTADOR_ITL C ON(C.CODIGO = M.CD_CIA_TRANSP)'
      '  LEFT JOIN TUNID_NEG U ON (U.CD_UNID_NEG = M.CD_UNID_NEG)'
      
        '  LEFT JOIN TTAXA_IATA T ON (T.CD_MOEDA = M.CD_MOEDA AND T.DT_IN' +
        'ICIO = M.DT_EMISSAO_DTA)'
      
        '  WHERE  M.CD_UNID_NEG = :CD_UNID_NEG AND M.CD_PRODUTO = :CD_PRO' +
        'DUTO'
      '  AND M.CD_PRODUTO = PR.CD_PRODUTO AND PR.TP_PRODUTO = '#39'02'#39
      '  AND M.CD_VIA_TRANSP = '#39'04'#39
      '  AND M.CD_CIA_TRANSP = :CD_CIA  AND M.IN_SEL_IATA = '#39'1'#39
      
        '  AND M.DT_EMISSAO_DTA BETWEEN CONVERT(DATETIME, :DT_INICIO ,103' +
        ')'
      '  AND CONVERT(DATETIME, :DT_FIM,103)'
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 328
    Top = 336
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
        Name = 'CD_CIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'DT_FIM'
        ParamType = ptUnknown
      end>
    object qry_impressao_rel_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_impressao_rel_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_impressao_rel_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_impressao_rel_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_impressao_rel_CD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      FixedChar = True
      Size = 4
    end
    object qry_impressao_rel_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object qry_impressao_rel_IN_SEL_IATA: TStringField
      FieldName = 'IN_SEL_IATA'
      FixedChar = True
      Size = 1
    end
    object qry_impressao_rel_DT_EMISSAO_DTA: TDateTimeField
      FieldName = 'DT_EMISSAO_DTA'
    end
    object qry_impressao_rel_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 25
    end
    object qry_impressao_rel_CHARG_MASTER: TFloatField
      FieldName = 'CHARG_MASTER'
    end
    object qry_impressao_rel_TARIFA_IMPRESSA: TFloatField
      FieldName = 'TARIFA_IMPRESSA'
    end
    object qry_impressao_rel_NR_RELATORIO: TStringField
      FieldName = 'NR_RELATORIO'
      FixedChar = True
      Size = 6
    end
    object qry_impressao_rel_VL_TAXA: TFloatField
      FieldName = 'VL_TAXA'
    end
    object qry_impressao_rel_TP_FRETE_MASTER: TStringField
      FieldName = 'TP_FRETE_MASTER'
      FixedChar = True
      Size = 1
    end
    object qry_impressao_rel_FRETE_REAL: TFloatField
      FieldName = 'FRETE_REAL'
    end
    object qry_impressao_rel_TARIFA_CUSTO_CIA: TFloatField
      FieldName = 'TARIFA_CUSTO_CIA'
    end
    object qry_impressao_rel_OTHER_CH_AG: TFloatField
      FieldName = 'OTHER_CH_AG'
    end
    object qry_impressao_rel_OTHER_CH_CIA: TFloatField
      FieldName = 'OTHER_CH_CIA'
    end
    object qry_impressao_rel_COM_IATA: TFloatField
      FieldName = 'COM_IATA'
    end
    object qry_impressao_rel_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qry_impressao_rel_VL_OVER: TFloatField
      FieldName = 'VL_OVER'
    end
    object qry_impressao_rel_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_impressao_rel_NM_CIA: TStringField
      FieldName = 'NM_CIA'
      FixedChar = True
      Size = 60
    end
    object qry_impressao_rel_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_impressao_rel_calc_tt_prepaid: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_tt_prepaid'
      Calculated = True
    end
    object qry_impressao_rel_calc_tt_collect: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_tt_collect'
      Calculated = True
    end
    object qry_impressao_rel_IN_IRRF_FATURA: TStringField
      FieldName = 'IN_IRRF_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_impressao_rel_IN_CALC_IR_IATA: TStringField
      FieldName = 'IN_CALC_IR_IATA'
      FixedChar = True
      Size = 1
    end
    object qry_impressao_rel_IN_CALC_IR_OVER: TStringField
      FieldName = 'IN_CALC_IR_OVER'
      FixedChar = True
      Size = 1
    end
    object qry_impressao_rel_calc_vl_ir: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_ir'
      Calculated = True
    end
    object qry_impressao_rel_vl_tt_relatorio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'vl_tt_relatorio'
      Calculated = True
    end
    object qry_impressao_rel_calc_vl_pp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_pp'
      Calculated = True
    end
    object qry_impressao_rel_TP_FATURA: TStringField
      FieldName = 'TP_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_impressao_rel_IN_IRRF_MIN: TStringField
      FieldName = 'IN_IRRF_MIN'
      FixedChar = True
      Size = 1
    end
    object qry_impressao_rel_calc_sinal_ir: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_sinal_ir'
      Size = 1
      Calculated = True
    end
  end
  object ds_impressa_rel: TDataSource
    DataSet = qry_impressao_rel_
    Left = 408
    Top = 328
  end
  object pp_impressao_rel: TppBDEPipeline
    DataSource = ds_impressa_rel
    UserName = 'pp_impressao_rel'
    Left = 472
    Top = 344
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TOP 1 VL_MIN_IR, VL_ALIQ_IR FROM TPARAMETROS')
    Left = 624
    Top = 16
    object qry_param_VL_MIN_IR: TFloatField
      FieldName = 'VL_MIN_IR'
    end
    object qry_param_VL_ALIQ_IR: TFloatField
      FieldName = 'VL_ALIQ_IR'
    end
  end
end
