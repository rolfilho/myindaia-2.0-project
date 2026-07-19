object datm_termo_pagto: Tdatm_termo_pagto
  OldCreateOrder = True
  Left = 185
  Top = 227
  Height = 191
  Width = 773
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 137
    Top = 25
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 137
    Top = 82
  end
  object qry_termo_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TTERMO_PAGTO ORDER BY'
      'NM_TERMO_PAGTO'
      '')
    Left = 49
    Top = 25
    object qry_termo_pagto_CD_TERMO_PAGTO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'TTERMO_PAGTO.CD_TERMO_PAGTO'
      Size = 6
    end
    object qry_termo_pagto_NM_TERMO_PAGTO: TStringField
      DisplayLabel = 'Termo Pagamento'
      FieldName = 'NM_TERMO_PAGTO'
      Origin = 'TTERMO_PAGTO.NM_TERMO_PAGTO'
      Size = 50
    end
    object qry_termo_pagto_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TTERMO_PAGTO.CD_EXPORTADOR'
      Size = 5
    end
    object qry_termo_pagto_NR_PERIODICIDADE: TIntegerField
      FieldName = 'NR_PERIODICIDADE'
      Origin = 'TTERMO_PAGTO.NR_PERIODICIDADE'
    end
    object qry_termo_pagto_TP_INDICADOR: TStringField
      FieldName = 'TP_INDICADOR'
      Origin = 'TTERMO_PAGTO.TP_INDICADOR'
      Size = 1
    end
    object qry_termo_pagto_NR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
      Origin = 'TTERMO_PAGTO.NR_PARCELAS'
    end
    object qry_termo_pagto_CD_MODALIDADE_TRANS: TStringField
      FieldName = 'CD_MODALIDADE_TRANS'
      Origin = 'TTERMO_PAGTO.CD_MODALIDADE_TRANS'
      Size = 3
    end
    object qry_termo_pagto_CD_ENQUAD_OP: TStringField
      FieldName = 'CD_ENQUAD_OP'
      Origin = 'TTERMO_PAGTO.CD_ENQUAD_OP'
      Size = 5
    end
    object qry_termo_pagto_TX_TERMO_PORT: TMemoField
      FieldName = 'TX_TERMO_PORT'
      Origin = 'TTERMO_PAGTO.TX_TERMO_PORT'
      BlobType = ftMemo
    end
    object qry_termo_pagto_TX_TERMO_INGLES: TMemoField
      FieldName = 'TX_TERMO_INGLES'
      Origin = 'TTERMO_PAGTO.TX_TERMO_INGLES'
      BlobType = ftMemo
    end
    object qry_termo_pagto_TX_TERMO_ESP: TMemoField
      FieldName = 'TX_TERMO_ESP'
      Origin = 'TTERMO_PAGTO.TX_TERMO_ESP'
      BlobType = ftMemo
    end
    object qry_termo_pagto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TTERMO_PAGTO.IN_ATIVO'
      Size = 1
    end
    object qry_termo_pagto_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_termo_pagto_LookExportador: TStringField
      DisplayLabel = 'Exportador'
      FieldKind = fkLookup
      FieldName = 'LookExportador'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_termo_pagto_LookIndicadorPeriodo: TStringField
      DisplayLabel = 'Indicador'
      FieldKind = fkLookup
      FieldName = 'LookIndicadorPeriodo'
      LookupDataSet = qry_tp_indicador_periodo_
      LookupKeyFields = 'TP_INDICADOR'
      LookupResultField = 'NM_INDICADOR'
      KeyFields = 'TP_INDICADOR'
      Lookup = True
    end
    object qry_termo_pagto_LookModalidadeTrans: TStringField
      DisplayLabel = 'Modalidade de Transa'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'LookModalidadeTrans'
      LookupDataSet = qry_modalidade_trans_
      LookupKeyFields = 'CD_MODALIDADE_TRANS'
      LookupResultField = 'NM_MODALIDADE_TRANS'
      KeyFields = 'CD_MODALIDADE_TRANS'
      Size = 30
      Lookup = True
    end
    object qry_termo_pagto_LookEnquadOp: TStringField
      DisplayLabel = 'Enquadramento de Opera'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'LookEnquadOp'
      LookupDataSet = qry_enquad_op_
      LookupKeyFields = 'CD_ENQUAD_OP'
      LookupResultField = 'NM_ENQUAD_OP'
      KeyFields = 'CD_ENQUAD_OP'
      Size = 60
      Lookup = True
    end
  end
  object ds_termo_pagto: TDataSource
    DataSet = qry_termo_pagto_
    Left = 49
    Top = 82
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 228
    Top = 82
  end
  object qry_empresa_nac_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'ORDER BY NM_EMPRESA')
    Left = 228
    Top = 25
    object qry_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object ds_modalidade_trans: TDataSource
    DataSet = qry_modalidade_trans_
    Left = 338
    Top = 82
  end
  object qry_modalidade_trans_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_MODALIDADE_TRANS, NM_MODALIDADE_TRANS'
      'FROM TMODALIDADE_TRANS'
      'ORDER BY NM_MODALIDADE_TRANS')
    Left = 338
    Top = 25
    object qry_modalidade_trans_CD_MODALIDADE_TRANS: TStringField
      FieldName = 'CD_MODALIDADE_TRANS'
      Origin = 'TMODALIDADE_TRANS.CD_MODALIDADE_TRANS'
      Size = 3
    end
    object qry_modalidade_trans_NM_MODALIDADE_TRANS: TStringField
      FieldName = 'NM_MODALIDADE_TRANS'
      Origin = 'TMODALIDADE_TRANS.NM_MODALIDADE_TRANS'
      Size = 30
    end
  end
  object ds_enquad_op: TDataSource
    DataSet = qry_enquad_op_
    Left = 445
    Top = 82
  end
  object qry_enquad_op_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_ENQUAD_OP, NM_ENQUAD_OP'
      'FROM TENQUAD_OP'
      'ORDER BY NM_ENQUAD_OP')
    Left = 445
    Top = 25
    object qry_enquad_op_CD_ENQUAD_OP: TStringField
      FieldName = 'CD_ENQUAD_OP'
      Origin = 'TENQUAD_OP.CD_ENQUAD_OP'
      Size = 5
    end
    object qry_enquad_op_NM_ENQUAD_OP: TStringField
      FieldName = 'NM_ENQUAD_OP'
      Origin = 'TENQUAD_OP.NM_ENQUAD_OP'
      Size = 60
    end
  end
  object ds_tp_indicador_periodo: TDataSource
    DataSet = qry_tp_indicador_periodo_
    Left = 560
    Top = 82
  end
  object qry_tp_indicador_periodo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT TP_INDICADOR, NM_INDICADOR'
      'FROM TTP_INDICADOR_PERIODO'
      'ORDER BY NM_INDICADOR')
    Left = 560
    Top = 25
    object qry_tp_indicador_periodo_TP_INDICADOR: TStringField
      FieldName = 'TP_INDICADOR'
      Origin = 'TTP_INDICADOR_PERIODO.TP_INDICADOR'
      Size = 1
    end
    object qry_tp_indicador_periodo_NM_INDICADOR: TStringField
      FieldName = 'NM_INDICADOR'
      Origin = 'TTP_INDICADOR_PERIODO.NM_INDICADOR'
    end
  end
  object qry_ult_termo_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX( CD_TERMO_PAGTO ) AS ULTIMO'
      'FROM TTERMO_PAGTO')
    Left = 679
    Top = 25
    object qry_ult_termo_pagto_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TTERMO_PAGTO.CD_TERMO_PAGTO'
      Size = 6
    end
  end
end
