object datm_pe_prepara: Tdatm_pe_prepara
  OldCreateOrder = True
  Left = 200
  Top = 104
  Height = 426
  Width = 610
  object qry_pe_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_EXPORTADOR, CD_VIA_TRANSPORTE, '
      
        '               DT_REGISTRO_PEDIDO, IN_SELECIONADO, QT_TOTAL_ITEN' +
        'S'
      'FROM TPE'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG'
      'ORDER BY NR_PROCESSO')
    Left = 128
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_pe_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TPE.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_pe_DT_REGISTRO_PEDIDO: TDateTimeField
      FieldName = 'DT_REGISTRO_PEDIDO'
      Origin = 'TPE.DT_REGISTRO_PEDIDO'
    end
    object qry_pe_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPE.IN_SELECIONADO'
      Size = 1
    end
    object qry_pe_QT_TOTAL_ITENS: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPE.QT_TOTAL_ITENS'
      Size = 3
    end
    object qry_pe_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPE.NR_PROCESSO'
      Size = 5
    end
    object qry_pe_LookNmCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmCliente'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookViaTransporte: TStringField
      FieldKind = fkLookup
      FieldName = 'LookViaTransporte'
      LookupDataSet = qry_via_transporte_
      LookupKeyFields = 'CD_VIA_TRANSPORTE'
      LookupResultField = 'NM_VIA_TRANSPORTE'
      KeyFields = 'CD_VIA_TRANSPORTE'
      Lookup = True
    end
  end
  object ds_pe: TDataSource
    DataSet = qry_pe_
    Left = 34
    Top = 15
  end
  object ds_via_transporte: TDataSource
    DataSet = qry_via_transporte_
    Left = 34
    Top = 76
  end
  object qry_via_transporte_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM  TVIA_TRANSPORTE'
      'ORDER BY NM_VIA_TRANSPORTE    ')
    Left = 128
    Top = 76
    object qry_via_transporte_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_via_transporte_NM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      Origin = 'TVIA_TRANSPORTE.NM_VIA_TRANSPORTE'
    end
  end
  object ds_pe_itens: TDataSource
    DataSet = qry_pe_itens_
    Left = 34
    Top = 138
  end
  object qry_pe_itens_: TQuery
    OnCalcFields = qry_pe_itens_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_pe
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_ITEM, CD_MERCADORIA, CD_NCM, '
      
        '               QT_MERCADORIA, QT_BAIXADA, IN_SELECIONADO, VL_UNI' +
        'TARIO,'
      '               QT_BAIXAR, QT_DISPONIVEL'
      'FROM TPE_ITEM'
      
        'WHERE (NR_PROCESSO = :NR_PROCESSO)  AND (IN_MONTADO <> '#39'1'#39') AND ' +
        'CD_UNID_NEG = :CD_UNID_NEG'
      'ORDER BY NR_ITEM')
    Left = 128
    Top = 138
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_pe_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPE_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_pe_itens_CD_MERCADORIA: TStringField
      DisplayWidth = 20
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPE_ITEM.CD_MERCADORIA'
    end
    object qry_pe_itens_CD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'TPE_ITEM.CD_NCM'
      Size = 11
    end
    object qry_pe_itens_QT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'TPE_ITEM.QT_MERCADORIA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_QT_BAIXADA: TFloatField
      FieldName = 'QT_BAIXADA'
      Origin = 'TPE_ITEM.QT_BAIXADA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPE_ITEM.IN_SELECIONADO'
      Size = 1
    end
    object qry_pe_itens_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TPE_ITEM.VL_UNITARIO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_QT_BAIXAR: TFloatField
      FieldName = 'QT_BAIXAR'
      Origin = 'TPE_ITEM.QT_BAIXAR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_QT_DISPONIVEL: TFloatField
      FieldName = 'QT_DISPONIVEL'
      Origin = 'TPE_ITEM.QT_DISPONIVEL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_CalcQtBaixada: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcQtBaixada'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_pe_itens_CalcQTDisp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcQTDisp'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
  end
  object sp_pe_marca_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_pe_marca_item'
    Left = 515
    Top = 16
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
        Name = '@in_selecionado'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end>
  end
  object qry_prep_pe_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPREPARA_PE'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 349
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_prep_pe_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREPARA_PE.NR_PROCESSO'
      Size = 18
    end
    object qry_prep_pe_NR_PROC_OLD: TStringField
      FieldName = 'NR_PROC_OLD'
      Origin = 'TPREPARA_PE.NR_PROC_OLD'
      Size = 18
    end
    object qry_prep_pe_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPREPARA_PE.CD_IMPORTADOR'
      Size = 5
    end
    object qry_prep_pe_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPREPARA_PE.CD_EXPORTADOR'
      Size = 5
    end
    object qry_prep_pe_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPREPARA_PE.CD_FABRICANTE'
      Size = 5
    end
    object qry_prep_pe_QT_BAIXADA: TFloatField
      FieldName = 'QT_BAIXADA'
      Origin = 'TPREPARA_PE.QT_BAIXADA'
    end
    object qry_prep_pe_VL_TOT_BAIXADO: TFloatField
      FieldName = 'VL_TOT_BAIXADO'
      Origin = 'TPREPARA_PE.VL_TOT_BAIXADO'
    end
    object qry_prep_pe_IN_PREPARACAO: TStringField
      FieldName = 'IN_PREPARACAO'
      Origin = 'TPREPARA_PE.IN_PREPARACAO'
      Size = 1
    end
    object qry_prep_pe_QT_TOTAL_ITEM: TStringField
      FieldName = 'QT_TOTAL_ITEM'
      Origin = 'TPREPARA_PE.QT_TOTAL_ITEM'
      Size = 3
    end
    object qry_prep_pe_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPREPARA_PE.IN_MONTADO'
      Size = 1
    end
  end
  object ds_prep_pe: TDataSource
    DataSet = qry_prep_pe_
    Left = 258
    Top = 16
  end
  object qry_prep_item_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPREPARA_PE_ITEM'
      'WHERE (NR_PROCESSO = :NR_PROCESSO) AND'
      '               (IN_MONTADO <> '#39'1'#39')')
    Left = 349
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_prep_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREPARA_PE_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_prep_item_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPREPARA_PE_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_prep_item_NR_PROC_OLD: TStringField
      FieldName = 'NR_PROC_OLD'
      Origin = 'TPREPARA_PE_ITEM.NR_PROC_OLD'
      Size = 18
    end
    object qry_prep_item_NR_ITEM_OLD: TStringField
      FieldName = 'NR_ITEM_OLD'
      Origin = 'TPREPARA_PE_ITEM.NR_ITEM_OLD'
      Size = 3
    end
    object qry_prep_item_CD_MERCADORIA: TStringField
      DisplayWidth = 20
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPREPARA_PE_ITEM.CD_MERCADORIA'
    end
    object qry_prep_item_DT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
      Origin = 'TPREPARA_PE_ITEM.DT_BAIXA'
    end
    object qry_prep_item_IN_PREPARACAO: TStringField
      FieldName = 'IN_PREPARACAO'
      Origin = 'TPREPARA_PE_ITEM.IN_PREPARACAO'
      Size = 1
    end
    object qry_prep_item_QT_BAIXADA: TFloatField
      FieldName = 'QT_BAIXADA'
      Origin = 'TPREPARA_PE_ITEM.QT_BAIXADA'
    end
    object qry_prep_item_VL_BAIXADO: TFloatField
      FieldName = 'VL_BAIXADO'
      Origin = 'TPREPARA_PE_ITEM.VL_BAIXADO'
    end
    object qry_prep_item_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPREPARA_PE_ITEM.IN_MONTADO'
      Size = 1
    end
  end
  object ds_prep_item: TDataSource
    DataSet = qry_prep_item_
    Left = 258
    Top = 72
  end
  object qry_pe_selec_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, IN_SELECIONADO'
      'FROM TPE'
      'WHERE IN_SELECIONADO = '#39'1'#39' AND CD_UNID_NEG = :CD_UNID_NEG'
      '')
    Left = 258
    Top = 137
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_pe_selec_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_selec_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPO.IN_SELECIONADO'
      Size = 1
    end
  end
  object sp_pe_prep_inc_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_pe_prep_inc_item'
    Left = 515
    Top = 200
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
        Name = '@nr_item'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_proc_old'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_item_old'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_baixa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@qt_baixar'
        ParamType = ptInput
      end>
  end
  object sp_pe_prep_inc_proc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_pe_prep_inc_proc'
    Left = 515
    Top = 144
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
        Name = '@nr_proc_old'
        ParamType = ptInput
      end>
  end
  object qry_pe_valor_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, QT_TOTAL_ITEM'
      'FROM TPREPARA_PE'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 128
    Top = 265
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_pe_valor_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREPARA_PO.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_valor_QT_TOTAL_ITEM: TStringField
      FieldName = 'QT_TOTAL_ITEM'
      Origin = 'TPREPARA_PO.QT_TOTAL_ITEM'
      Size = 3
    end
  end
  object ds_pe_valor: TDataSource
    DataSet = qry_pe_valor_
    Left = 34
    Top = 265
  end
  object qry_verif_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_PROC_OLD, NR_ITEM_OLD, '
      '              QT_BAIXADA, DT_BAIXA'
      'FROM TPREPARA_PE_ITEM'
      'WHERE (NR_PROC_OLD = :NR_PROCESSO) AND'
      '               (NR_ITEM_OLD = :NR_ITEM) AND'
      '               (NR_PROCESSO = :NR_PROC) AND'
      '               (IN_MONTADO <> '#39'1'#39')'
      '          ')
    Left = 349
    Top = 137
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROC'
        ParamType = ptUnknown
      end>
    object qry_verif_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREPARA_PE_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_verif_item_NR_PROC_OLD: TStringField
      FieldName = 'NR_PROC_OLD'
      Origin = 'TPREPARA_PE_ITEM.NR_PROC_OLD'
      Size = 18
    end
    object qry_verif_item_NR_ITEM_OLD: TStringField
      FieldName = 'NR_ITEM_OLD'
      Origin = 'TPREPARA_PE_ITEM.NR_ITEM_OLD'
      Size = 3
    end
    object qry_verif_item_QT_BAIXADA: TFloatField
      FieldName = 'QT_BAIXADA'
      Origin = 'TPREPARA_PE_ITEM.QT_BAIXADA'
    end
    object qry_verif_item_DT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
      Origin = 'TPREPARA_PE_ITEM.DT_BAIXA'
    end
  end
  object sp_pe_desmarca: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_pe_desmarca'
    Left = 515
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end>
  end
  object sp_pe_exclui_prep: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_pe_exclui_prep'
    Left = 515
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end>
  end
  object qry_muda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      '')
    Left = 352
    Top = 195
  end
  object sp_pe_monta_exp: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_pe_monta_exp'
    Left = 515
    Top = 80
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 129
    Top = 202
    object qry_emp_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_emp_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 34
    Top = 204
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 34
    Top = 335
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  NR_PROCESSO , CD_CLIENTE , CD_UNID_NEG'
      'FROM TPROCESSO P, TEMBARCACAO E, TEMPRESA_NAC N'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       P.IN_CANCELADO = '#39'0'#39' AND'
      '       P.IN_LIBERADO = '#39'1'#39' AND'
      '       P.IN_PRODUCAO = '#39'1'#39' AND'
      '       P.CD_EMBARCACAO *= E.CD_EMBARCACAO AND'
      '       P.CD_CLIENTE *= N.CD_EMPRESA')
    Left = 128
    Top = 335
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG IN '
      '              ( SELECT CD_UNID_NEG '
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE (CD_USUARIO = :CD_USUARIO) AND'
      '                               (CD_UNID_NEG = :CD_UNID_NEG) )')
    Left = 261
    Top = 196
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
end
