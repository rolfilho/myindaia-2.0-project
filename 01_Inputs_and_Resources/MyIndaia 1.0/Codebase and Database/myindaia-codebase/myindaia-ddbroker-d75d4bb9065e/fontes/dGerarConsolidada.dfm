object datm_gerar_consolidada: Tdatm_gerar_consolidada
  OldCreateOrder = False
  Left = 185
  Top = 161
  Height = 151
  Width = 224
  object qry_lista_proc_: TQuery
    CachedUpdates = True
    AfterPost = qry_lista_proc_AfterPost
    AfterDelete = qry_lista_proc_AfterDelete
    OnCalcFields = qry_lista_proc_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT  TP.NR_PROCESSO, TP.CD_CLIENTE, TP.CD_EMP_EST, TP.IN_SELE' +
        'CIONADO, ISNULL(TP.TP_ESTUFAGEM,'#39'0'#39') AS TP_ESTUFAGEM, TP.NR_PROP' +
        'OSTA,'
      
        '(SELECT TN.NM_EMPRESA FROM TEMPRESA_NAC TN WHERE TP.CD_CLIENTE =' +
        ' TN.CD_EMPRESA)NM_CLIENTE, TP.CD_PRODUTO,'
      
        ' (SELECT TE.NM_EMPRESA FROM TEMPRESA_EST TE WHERE TP.CD_EMP_EST ' +
        '= TE.CD_EMPRESA)NM_IMP, TP.CD_SERVICO,'
      
        '  TP.CHARGEABLE, TP.QTD_VOLUME, TP.VL_PESO_BRUTO, TP.CD_INCOTERM' +
        ', TP.IN_PEDIDO,'
      '  TP.CD_TAB_FRETE_VENDA FROM TSERVICO TS, TPROCESSO TP'
      
        ' WHERE TP.CD_UNID_NEG =:CD_UNID_NEG AND TP.CD_PRODUTO =:CD_PRODU' +
        'TO AND TP.CD_ORIGEM=:CD_ORIGEM AND TP.CD_DESTINO=:CD_DESTINO'
      
        '  AND TP.CD_AGENTE=:CD_AGENTE AND TP.CD_MOEDA_FRETE=:CD_MOEDA AN' +
        'D  ISNULL(TP.CHARGEABLE,0) > 0 AND TP.TP_PROCESSO = '#39'1'#39
      
        '  AND TP.CD_SERVICO = TS.CD_SERVICO AND TS.CD_VIA_TRANSPORTE =:C' +
        'D_VIA_TRANSP AND TS.TP_SERVICO = '#39'1'#39
      ''
      ''
      ''
      ''
      '   AND NOT EXISTS ( SELECT TH.NR_PROCESSO FROM THOUSE TH'
      
        '                                 WHERE TH.NR_PROCESSO = TP.NR_PR' +
        'OCESSO AND TH.IN_ESTORNO = '#39'0'#39')'
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
    UpdateObject = UpDate_proc_lista
    Left = 40
    Top = 14
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
        Name = 'CD_DESTINO'
        ParamType = ptUnknown
      end
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
    object qry_lista_proc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_lista_proc_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_lista_proc_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_lista_proc_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_lista_proc_NM_IMP: TStringField
      FieldName = 'NM_IMP'
      FixedChar = True
      Size = 60
    end
    object qry_lista_proc_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 12
      Calculated = True
    end
    object qry_lista_proc_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_lista_proc_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_lista_proc_calc_estufagem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_estufagem'
      Size = 3
      Calculated = True
    end
    object qry_lista_proc_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_lista_proc_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_lista_proc_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_lista_proc_CD_TAB_FRETE_VENDA: TStringField
      FieldName = 'CD_TAB_FRETE_VENDA'
      FixedChar = True
      Size = 5
    end
    object qry_lista_proc_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
    end
    object qry_lista_proc_QTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
    end
    object qry_lista_proc_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qry_lista_proc_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_lista_proc_IN_PEDIDO: TStringField
      FieldName = 'IN_PEDIDO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_lista_proc: TDataSource
    DataSet = qry_lista_proc_
    Left = 40
    Top = 38
  end
  object ds_proc_conhec: TDataSource
    DataSet = qry_proc_conhec_
    Left = 136
    Top = 30
  end
  object qry_proc_conhec_: TQuery
    OnCalcFields = qry_proc_conhec_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  TP.NR_PROCESSO, TP.CD_CLIENTE, TP.CD_EMP_EST, TH.NR_HOUS' +
        'E,'
      
        '(SELECT TN.NM_EMPRESA FROM TEMPRESA_NAC TN WHERE TP.CD_CLIENTE =' +
        ' TN.CD_EMPRESA)NM_CLIENTE,'
      
        ' (SELECT TE.NM_EMPRESA FROM TEMPRESA_EST TE WHERE TP.CD_EMP_EST ' +
        '= TE.CD_EMPRESA)NM_IMP'
      '  FROM TPROCESSO TP , THOUSE TH'
      
        '    WHERE TP.NR_PROCESSO = TH.NR_PROCESSO AND TH.CD_MASTER =:CD_' +
        'MASTER'
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 136
    Top = 52
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_MASTER'
        ParamType = ptUnknown
      end>
    object qry_proc_conhec_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_proc_conhec_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_proc_conhec_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_proc_conhec_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_proc_conhec_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_proc_conhec_NM_IMP: TStringField
      FieldName = 'NM_IMP'
      FixedChar = True
      Size = 60
    end
    object qry_proc_conhec_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 10
      Calculated = True
    end
  end
  object UpDate_proc_lista: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  IN_PEDIDO = :IN_PEDIDO,'
      '  IN_SELECIONADO = :IN_SELECIONADO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO'
      '  (NR_PROCESSO, IN_PEDIDO, IN_SELECIONADO)'
      'values'
      '  (:NR_PROCESSO, :IN_PEDIDO, :IN_SELECIONADO)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 40
    Top = 54
  end
end
