object datm_ctrl_demurrage: Tdatm_ctrl_demurrage
  OldCreateOrder = False
  Left = 216
  Top = 128
  Height = 405
  Width = 474
  object qry_demurrage_: TQuery
    CachedUpdates = True
    AfterPost = qry_demurrage_AfterPost
    AfterDelete = qry_demurrage_AfterDelete
    OnCalcFields = qry_demurrage_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TPC.NR_CNTR,TPC.CODIGO, TPC.NR_LACRE,TP.C' +
        'D_CLIENTE,TH.NR_HOUSE,TH.NR_MASTER, TA.DESCRICAO,TA.DIAS_DEMURRA' +
        'GE,'
      
        '  (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRESA' +
        ' = TP.CD_CLIENTE)NM_EMPRESA, TPC.DT_DEV_EFETIVA,'
      
        '   TPC.DT_DEMURRAGE, TPC.NR_FREE_TIME, TA.VL_DEMURRAGE,TPC.VL_DE' +
        'SC_DEMURRAGE, TPC.VL_CORRIGIDO,TPC.VL_CUSTO_TOTAL,'
      
        ' TPC.VL_VENDA_DEMURRAGE, TPC.IN_DEVOLVIDO ,TP.CD_ARMADOR, TPC.DT' +
        '_DEVOLUCAO_CNTR,TPC.VL_VENDA_TOTAL, TPC.VL_DEMURRAGE AS TT_DEMUR' +
        'RAGE'
      
        '  FROM  TPROCESSO_CNTR TPC, THOUSE TH,TPROCESSO TP LEFT JOIN TTR' +
        'ANSPORTADOR_ITL TA ON(TA.CODIGO =TP.CD_ARMADOR)'
      
        '  WHERE TP.NR_PROCESSO = TPC.NR_PROCESSO AND TP.TP_ESTUFAGEM = '#39 +
        '1'#39
      
        '  AND ISNULL(TPC.NR_CNTR,'#39#39') <> '#39#39' AND ISNULL(TPC.NR_LACRE,'#39#39') <' +
        '>'#39#39' AND TH.NR_PROCESSO = TP.NR_PROCESSO'
      '  AND (DT_DEMURRAGE BETWEEN :DT_INICIAL AND :DT_FINAL)'
      '  AND TPC.IN_DEVOLVIDO = '#39'0'#39
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
    UpdateObject = Update_Demurrage
    Left = 64
    Top = 16
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_FINAL'
        ParamType = ptUnknown
      end>
    object qry_demurrage_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_demurrage_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
    end
    object qry_demurrage_NR_LACRE: TStringField
      FieldName = 'NR_LACRE'
      FixedChar = True
    end
    object qry_demurrage_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_demurrage_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_demurrage_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_demurrage_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_demurrage_DT_DEMURRAGE: TDateTimeField
      FieldName = 'DT_DEMURRAGE'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_demurrage_DIAS_DEMURRAGE: TIntegerField
      FieldName = 'DIAS_DEMURRAGE'
    end
    object qry_demurrage_DT_DEV_EFETIVA: TDateTimeField
      FieldName = 'DT_DEV_EFETIVA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_demurrage_NR_FREE_TIME: TIntegerField
      FieldName = 'NR_FREE_TIME'
    end
    object qry_demurrage_IN_DEVOLVIDO: TStringField
      FieldName = 'IN_DEVOLVIDO'
      FixedChar = True
      Size = 1
    end
    object qry_demurrage_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_demurrage_DT_DEVOLUCAO_CNTR: TDateTimeField
      FieldName = 'DT_DEVOLUCAO_CNTR'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_demurrage_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 14
      Calculated = True
    end
    object qry_demurrage_CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_demurrage_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qry_demurrage_VL_DEMURRAGE: TFloatField
      FieldName = 'VL_DEMURRAGE'
      DisplayFormat = '0.00'
    end
    object qry_demurrage_VL_DESC_DEMURRAGE: TFloatField
      FieldName = 'VL_DESC_DEMURRAGE'
      DisplayFormat = '0.00'
    end
    object qry_demurrage_VL_CORRIGIDO: TFloatField
      FieldName = 'VL_CORRIGIDO'
      DisplayFormat = '0.00'
    end
    object qry_demurrage_VL_CUSTO_TOTAL: TFloatField
      FieldName = 'VL_CUSTO_TOTAL'
      DisplayFormat = '0.00'
    end
    object qry_demurrage_VL_VENDA_DEMURRAGE: TFloatField
      FieldName = 'VL_VENDA_DEMURRAGE'
      DisplayFormat = '0.00'
    end
    object qry_demurrage_VL_VENDA_TOTAL: TFloatField
      FieldName = 'VL_VENDA_TOTAL'
      DisplayFormat = '0.00'
    end
    object qry_demurrage_TT_DEMURRAGE: TFloatField
      FieldName = 'TT_DEMURRAGE'
      DisplayFormat = '0.00'
    end
  end
  object ds_demurrage: TDataSource
    DataSet = qry_demurrage_
    Left = 64
    Top = 72
  end
  object Update_Demurrage: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_CNTR'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_CNTR = :NR_CNTR,'
      '  CODIGO = :CODIGO,'
      '  DT_DEMURRAGE = :DT_DEMURRAGE,'
      '  NR_LACRE = :NR_LACRE,'
      '  NR_FREE_TIME = :NR_FREE_TIME,'
      '  DT_DEVOLUCAO_CNTR = :DT_DEVOLUCAO_CNTR,'
      '  IN_DEVOLVIDO = :IN_DEVOLVIDO,'
      '  DT_DEV_EFETIVA = :DT_DEV_EFETIVA,'
      '  VL_DESC_DEMURRAGE = :VL_DESC_DEMURRAGE,'
      '  VL_CORRIGIDO = :VL_CORRIGIDO,'
      '  VL_CUSTO_TOTAL = :VL_CUSTO_TOTAL,'
      '  VL_VENDA_DEMURRAGE = :VL_VENDA_DEMURRAGE,'
      '  VL_VENDA_TOTAL = :VL_VENDA_TOTAL,'
      '  VL_DEMURRAGE = :VL_DEMURRAGE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TPROCESSO_CNTR'
      
        '  (NR_PROCESSO, NR_CNTR, CODIGO, DT_DEMURRAGE, NR_LACRE, NR_FREE' +
        '_TIME, '
      
        '   DT_DEVOLUCAO_CNTR, IN_DEVOLVIDO, DT_DEV_EFETIVA, VL_DESC_DEMU' +
        'RRAGE, '
      
        '   VL_CORRIGIDO, VL_CUSTO_TOTAL, VL_VENDA_DEMURRAGE, VL_VENDA_TO' +
        'TAL, VL_DEMURRAGE)'
      'values'
      
        '  (:NR_PROCESSO, :NR_CNTR, :CODIGO, :DT_DEMURRAGE, :NR_LACRE, :N' +
        'R_FREE_TIME, '
      
        '   :DT_DEVOLUCAO_CNTR, :IN_DEVOLVIDO, :DT_DEV_EFETIVA, :VL_DESC_' +
        'DEMURRAGE, '
      
        '   :VL_CORRIGIDO, :VL_CUSTO_TOTAL, :VL_VENDA_DEMURRAGE, :VL_VEND' +
        'A_TOTAL, '
      '   :VL_DEMURRAGE)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_CNTR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CODIGO = :OLD_CODIGO')
    Left = 160
    Top = 16
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, UH.CD_UNID_NEG, TUN.NM_UNID_NEG, UH.CD_PRO' +
        'DUTO, UH.IN_ATIVO, UH.IN_DEFAULT,TU.NM_USUARIO  FROM TUSUARIO_HA' +
        'BILITACAO UH'
      'LEFT JOIN TUSUARIO TU ON(TU.CD_USUARIO = UH.CD_USUARIO)'
      
        'LEFT JOIN TUNID_NEG TUN ON (TUN.CD_UNID_NEG = UH.CD_UNID_NEG)WHE' +
        'RE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39
      ' ')
    Left = 64
    Top = 136
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
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 176
    Top = 72
  end
end
