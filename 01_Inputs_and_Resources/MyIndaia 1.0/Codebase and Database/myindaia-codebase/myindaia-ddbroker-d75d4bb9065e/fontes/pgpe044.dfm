object datm_exp_bordero: Tdatm_exp_bordero
  OldCreateOrder = True
  Left = 68
  Top = 96
  Height = 468
  Width = 642
  object ds_proc_exp: TDataSource
    DataSet = qry_proc_exp_
    Left = 40
    Top = 24
  end
  object qry_proc_exp_: TQuery
    OnCalcFields = qry_proc_exp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, DT_ENVIO, NR_FATURA, DT_FATURA, NR_PROTOCOLO'
      'FROM TPROCESSO_EXP_BORD'
      'WHERE (SUBSTRING(NR_PROCESSO, 1,2) = :CD_UNID_NEG) ORDER BY'
      'NR_PROCESSO')
    Left = 126
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_proc_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_proc_exp_DT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
    end
    object qry_proc_exp_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Size = 15
    end
    object qry_proc_exp_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
    end
    object qry_proc_exp_NR_PROTOCOLO: TStringField
      FieldName = 'NR_PROTOCOLO'
      Size = 30
    end
    object qry_proc_exp_CalcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 126
    Top = 85
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
    Left = 32
    Top = 87
  end
  object qry_exp_bord_: TQuery
    BeforeInsert = qry_exp_bord_BeforeInsert
    BeforeEdit = qry_exp_bord_BeforeEdit
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_exp
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TPROCESSO_EXP_BORD'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND NR_FATURA = :NR_FATURA')
    Left = 127
    Top = 159
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end>
    object qry_exp_bord_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_BORD.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_bord_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPROCESSO_EXP_BORD.CD_EXPORTADOR'
      Size = 5
    end
    object qry_exp_bord_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPROCESSO_EXP_BORD.NR_PROCESSO'
      Size = 5
    end
    object qry_exp_bord_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPROCESSO_EXP_BORD.DT_FATURA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_exp_bord_DT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
      Origin = 'TPROCESSO_EXP_BORD.DT_ENVIO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_exp_bord_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPROCESSO_EXP_BORD.NR_FATURA'
      Size = 15
    end
    object qry_exp_bord_NR_PROTOCOLO: TStringField
      FieldName = 'NR_PROTOCOLO'
      Origin = 'TPROCESSO_EXP_BORD.NR_PROTOCOLO'
      Size = 30
    end
    object qry_exp_bord_TX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'TPROCESSO_EXP_BORD.TX_OBSERVACAO'
      BlobType = ftMemo
    end
    object qry_exp_bord_LookExportador: TStringField
      FieldKind = fkLookup
      FieldName = 'LookExportador'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 50
      Lookup = True
    end
    object qry_exp_bord_LookImportador: TStringField
      FieldKind = fkLookup
      FieldName = 'LookImportador'
      LookupDataSet = qry_emp_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Size = 50
      Lookup = True
    end
  end
  object ds_exp_bord_: TDataSource
    DataSet = qry_exp_bord_
    Left = 32
    Top = 160
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG'
      'FROM TUNID_NEG_PRODUTO '
      'WHERE (CD_UNID_NEG+CD_PRODUTO) IN '
      '               (SELECT (CD_UNID_NEG+CD_PRODUTO) '
      '               FROM TUSUARIO_HABILITACAO '
      '               WHERE CD_USUARIO=:CD_USUARIO'
      '              AND IN_ATIVO='#39'1'#39
      '              AND CD_PRODUTO='#39'02'#39')')
    Left = 320
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 323
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 248
    Top = 160
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_FATURA, DT_FATURA, VL_TOT_MCV, CD_EXPORTA' +
        'DOR, CD_IMPORTADOR'
      'FROM TPROCESSO_EXP'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 322
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 15
    end
    object qry_processo_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPROCESSO_EXP.DT_FATURA'
    end
    object qry_processo_VL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      Origin = 'TPROCESSO_EXP.VL_TOT_MCV'
    end
    object qry_processo_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 5
    end
    object qry_processo_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPROCESSO_EXP.NR_FATURA'
      Size = 5
    end
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '')
    Left = 525
    Top = 21
  end
  object ds_exp_bord_item: TDataSource
    DataSet = qry_exp_bord_item_
    Left = 32
    Top = 224
  end
  object qry_exp_bord_item_: TQuery
    BeforeInsert = qry_exp_bord_item_BeforeInsert
    BeforeEdit = qry_exp_bord_item_BeforeEdit
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_exp
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TPROCESSO_EXP_BORD_ITEM'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '   AND NR_FATURA = :NR_FATURA')
    Left = 129
    Top = 223
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end>
    object qry_exp_bord_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_bord_item_NR_SEQUENCIA: TStringField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.NR_SEQUENCIA'
      Size = 5
    end
    object qry_exp_bord_item_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.CD_DOCUMENTO'
      Size = 3
    end
    object qry_exp_bord_item_NR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.NR_REFERENCIA'
      Size = 10
    end
    object qry_exp_bord_item_QT_ORIGINAIS: TIntegerField
      FieldName = 'QT_ORIGINAIS'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.QT_ORIGINAIS'
      DisplayFormat = '#000'
      EditFormat = '#000'
    end
    object qry_exp_bord_item_QT_COPIAS: TIntegerField
      FieldName = 'QT_COPIAS'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.QT_COPIAS'
      DisplayFormat = '#000'
      EditFormat = '#000'
    end
    object qry_exp_bord_item_TX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.TX_OBSERVACAO'
      BlobType = ftMemo
    end
    object qry_exp_bord_item_LookDocumento: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDocumento'
      LookupDataSet = qry_tp_documento_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DOCUMENTO'
      Size = 50
      Lookup = True
    end
    object qry_exp_bord_item_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPROCESSO_EXP_BORD_ITEM.NR_FATURA'
      FixedChar = True
      Size = 15
    end
  end
  object qry_tp_documento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_DOCUMENTO'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '      CD_PRODUTO = :CD_PRODUTO'
      '  '
      '')
    Left = 323
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_tp_documento_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_DOCUMENTO.CODIGO'
      Size = 3
    end
    object qry_tp_documento_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_DOCUMENTO.DESCRICAO'
      Size = 50
    end
    object qry_tp_documento_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TTP_DOCUMENTO.CD_UNID_NEG'
      Size = 2
    end
    object qry_tp_documento_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TTP_DOCUMENTO.CD_PRODUTO'
      Size = 2
    end
  end
  object ds_emp_est_: TDataSource
    DataSet = qry_emp_est_
    Left = 32
    Top = 279
  end
  object qry_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_EST'
      'WHERE IN_ATIVO = '#39'1'#39' AND IN_IMPORTADOR = '#39'1'#39)
    Left = 126
    Top = 279
    object qry_emp_est_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
    object qry_emp_est_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 60
    end
  end
  object qry_ult_doc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_SEQUENCIA) AS ULTIMO'
      'FROM TPROCESSO_EXP_BORD_ITEM'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND NR_FATURA = :NR_FATURA')
    Left = 322
    Top = 277
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptInput
      end>
    object qry_ult_doc_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.NR_SEQUENCIA'
      Size = 5
    end
  end
end
