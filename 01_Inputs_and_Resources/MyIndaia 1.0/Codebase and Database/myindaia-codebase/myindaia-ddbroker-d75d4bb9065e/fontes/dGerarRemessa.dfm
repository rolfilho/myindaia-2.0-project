object datm_gerar_remessa: Tdatm_gerar_remessa
  OldCreateOrder = False
  Left = 341
  Top = 240
  Height = 325
  Width = 363
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 64
    Top = 40
  end
  object qry_disp_remessa_: TQuery
    CachedUpdates = True
    AfterPost = qry_disp_remessa_AfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TOP 1 DT_DISP, CD_BANCO, VL_DISP, VL_UTILIZADO'
      '  FROM TDISP_REMESSA'
      'ORDER BY DT_DISP DESC'
      ''
      ''
      ' ')
    UpdateObject = Update_disp
    Left = 64
    Top = 96
    object qry_disp_remessa_DT_DISP: TDateTimeField
      FieldName = 'DT_DISP'
      Origin = 'DBBROKER.TDISP_REMESSA.DT_DISP'
    end
    object qry_disp_remessa_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_disp_remessa_VL_DISP: TFloatField
      FieldName = 'VL_DISP'
      Origin = 'DBBROKER.TDISP_REMESSA.VL_DISP'
    end
    object qry_disp_remessa_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'DBBROKER.TDISP_REMESSA.VL_UTILIZADO'
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO FROM TBANCO'
      ' WHERE CD_BANCO = :CD_BANCO')
    Left = 64
    Top = 160
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TBANCO.CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'DBBROKER.TBANCO.NM_BANCO'
      FixedChar = True
      Size = 40
    end
  end
  object qry_tt_saldo_disp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  SUM(VL_DISP) AS VL_DISP , SUM(VL_UTILIZADO) AS VL_UTILIZ' +
        'ADO'
      '  FROM TDISP_REMESSA')
    Left = 64
    Top = 216
    object qry_tt_saldo_disp_VL_DISP: TFloatField
      FieldName = 'VL_DISP'
      Origin = 'DBBROKER.TDISP_REMESSA.VL_DISP'
    end
    object qry_tt_saldo_disp_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'DBBROKER.TDISP_REMESSA.VL_UTILIZADO'
    end
  end
  object qry_processo_faturas_: TQuery
    AfterPost = qry_processo_faturas_AfterPost
    OnCalcFields = qry_processo_faturas_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT H.NR_MASTER, H.NR_HOUSE, F.NR_PROCESSO, F.CD_CLIENTE, F.C' +
        'D_AGENTE, F.IN_SELECIONADO, (SELECT E.NM_EMPRESA FROM TEMPRESA_N' +
        'AC E WHERE E.CD_EMPRESA = F.CD_CLIENTE)NM_EMPRESA,'
      
        '    (((ISNULL(SUM(VL_DEB_AGENTE),0) + ISNULL(SUM(VL_CRE_BRASIL),' +
        '0)) - (ISNULL(SUM(VL_CRE_AGENTE),0)+ ISNULL(SUM(VL_DEB_BRASIL),0' +
        ')))) AS TOTAL, (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGE' +
        'NTE = F.CD_AGENTE)NM_AGENTE'
      '  FROM TPROCESSO_FATURA_AG F, THOUSE H'
      
        '  WHERE    F.CD_AGENTE IN    (SELECT TACC.CD_AGENTE FROM TAGENTE' +
        ' TACC WHERE TACC.CD_ACCOUNT =:CD_AGENTE)'
      
        '           AND F.CD_MOEDA = :CD_MOEDA AND F.CD_VIA_TRANSP = :CD_' +
        'VIA_TRANSP AND F.NR_PROCESSO = H.NR_PROCESSO'
      ''
      ''
      ''
      ''
      ''
      ''
      
        'GROUP BY H.NR_MASTER, H.NR_HOUSE, F.NR_PROCESSO, F.CD_CLIENTE, F' +
        '.CD_AGENTE, F.IN_SELECIONADO'
      
        'ORDER BY H.NR_MASTER, H.NR_HOUSE, F.NR_PROCESSO, F.CD_CLIENTE, F' +
        '.CD_AGENTE'
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
      ' ')
    Left = 248
    Top = 40
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_AGENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end>
    object qry_processo_faturas_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_processo_faturas_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_processo_faturas_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_processo_faturas_TOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '0.00'
    end
    object qry_processo_faturas_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_faturas_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_faturas_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_processo_faturas_calc_tp_fatura: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_fatura'
      Size = 1
      Calculated = True
    end
    object qry_processo_faturas_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_processo_faturas_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
  end
  object ds_processo_faturas: TDataSource
    DataSet = qry_processo_faturas_
    Left = 248
    Top = 96
  end
  object Update_disp: TUpdateSQL
    ModifySQL.Strings = (
      'update TDISP_REMESSA'
      'set'
      '  DT_DISP = :DT_DISP,'
      '  CD_BANCO = :CD_BANCO,'
      '  VL_DISP = :VL_DISP,'
      '  VL_UTILIZADO = :VL_UTILIZADO'
      'where'
      '  DT_DISP = :OLD_DT_DISP')
    InsertSQL.Strings = (
      'insert into TDISP_REMESSA'
      '  (DT_DISP, CD_BANCO, VL_DISP, VL_UTILIZADO)'
      'values'
      '  (:DT_DISP, :CD_BANCO, :VL_DISP, :VL_UTILIZADO)')
    DeleteSQL.Strings = (
      'delete from TDISP_REMESSA'
      'where'
      '  DT_DISP = :OLD_DT_DISP')
    Left = 152
    Top = 96
  end
end
