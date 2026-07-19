object datm_monta_adm: Tdatm_monta_adm
  OldCreateOrder = True
  OnCreate = datm_monta_admCreate
  Left = 65534
  Top = 148
  Height = 481
  Width = 1007
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 237
    Top = 83
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39' AND IN_ATIVO = '#39'1'#39)
    Left = 237
    Top = 26
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object ds_usuario: TDataSource
    DataSet = qry_usuario_
    Left = 702
    Top = 83
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM TUSUARIO')
    Left = 702
    Top = 26
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT HM_PARA_SOLIC_CH, NR_ULT_NOTA, IN_CANC_CH_ADM, CD_SISTEMA' +
        '_CONTABIL'
      'FROM TPARAMETROS')
    Left = 811
    Top = 26
    object qry_param_HM_PARA_SOLIC_CH: TStringField
      FieldName = 'HM_PARA_SOLIC_CH'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 5
    end
    object qry_param_NR_ULT_NOTA: TStringField
      FieldName = 'NR_ULT_NOTA'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 6
    end
    object qry_param_IN_CANC_CH_ADM: TStringField
      FieldName = 'IN_CANC_CH_ADM'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 1
    end
    object qry_param_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 1
    end
  end
  object qry_monta_adm_: TQuery
    OnCalcFields = qry_monta_adm_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_grd_adm
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_LANCTO = :DT_LANCTO AND'
      '       CD_CT_CONTABIL = :CD_CT_CONTABIL AND'
      '       TP_NATUREZA = :TP_NATUREZA AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO AND'
      '       IN_SOLICITADO = '#39'1'#39' AND ( NR_REF = '#39#39' OR NR_REF IS NULL )')
    Left = 63
    Top = 26
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TP_NATUREZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_monta_adm_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 2
    end
    object qry_monta_adm_DT_LANCTO: TDateTimeField
      FieldName = 'DT_LANCTO'
      Origin = 'TADM.CD_UNID_NEG'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_monta_adm_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'C'#243'd. Conta Cont'#225'bil'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TADM.NR_LANCTO'
      OnChange = qry_monta_adm_CD_CT_CONTABILChange
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_monta_adm_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TADM.TP_NATUREZA'
      Size = 1
    end
    object qry_monta_adm_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
    object qry_monta_adm_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TADM.NR_REF'
      Size = 3
    end
    object qry_monta_adm_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TADM.CD_FAVORECIDO'
      Size = 5
    end
    object qry_monta_adm_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TADM.CD_BANCO'
      Size = 3
    end
    object qry_monta_adm_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TADM.NR_DOCTO'
      Size = 6
    end
    object qry_monta_adm_VL_LANCTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCTO'
      Origin = 'TADM.VL_LANCTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_monta_adm_CD_USUARIO_SOLIC: TStringField
      FieldName = 'CD_USUARIO_SOLIC'
      Origin = 'TADM.CD_USUARIO_SOLIC'
      Size = 4
    end
    object qry_monta_adm_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      Origin = 'TADM.CD_USUARIO_MONTA'
      Size = 4
    end
    object qry_monta_adm_IN_SOLICITADO: TStringField
      FieldName = 'IN_SOLICITADO'
      Origin = 'TADM.IN_SOLICITADO'
      Size = 1
    end
    object qry_monta_adm_CD_STATUS_ADM: TStringField
      FieldName = 'CD_STATUS_ADM'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 2
    end
    object qry_monta_adm_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
    object qry_monta_adm_DT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
      Origin = 'TADM.DT_LANCTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_monta_adm_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TADM.NR_LANCTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_monta_adm_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TADM.DT_LANCTO'
      Size = 3
    end
    object qry_monta_adm_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 1
    end
    object qry_monta_adm_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TADM.CD_CT_CONTABIL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_monta_adm_VL_PERC_DESCONTO: TFloatField
      FieldName = 'VL_PERC_DESCONTO'
      Origin = 'TADM.NR_REF'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_monta_adm_TX_HISTORICO: TMemoField
      FieldName = 'TX_HISTORICO'
      Origin = 'TADM.CD_CT_CONTABIL'
      BlobType = ftMemo
    end
    object qry_monta_adm_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkLookup
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_monta_adm_LookUnidNeg: TStringField
      DisplayLabel = 'Unidade Neg'#243'cio'
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_monta_adm_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldKind = fkLookup
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_monta_adm_LookUsuarioMonta: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUsuarioMonta'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'NM_USUARIO'
      KeyFields = 'CD_USUARIO_MONTA'
      Size = 50
      Lookup = True
    end
    object qry_monta_adm_LookUsuarioSolic: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUsuarioSolic'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'NM_USUARIO'
      KeyFields = 'CD_USUARIO_SOLIC'
      Size = 50
      Lookup = True
    end
    object qry_monta_adm_LookCtContabil: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtContabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_monta_adm_LookAcesso: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAcesso'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_ACESSO'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 1
      Lookup = True
    end
    object qry_monta_adm_LookAux: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAux'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_AUX'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 3
      Lookup = True
    end
    object qry_monta_adm_LookSolicitado: TStringField
      DisplayLabel = 'Solicitado'
      FieldKind = fkLookup
      FieldName = 'LookSolicitado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_SOLICITADO'
      Size = 3
      Lookup = True
    end
    object qry_monta_adm_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_adm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_ADM'
      Size = 30
      Lookup = True
    end
    object qry_monta_adm_LookHistorico: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldKind = fkLookup
      FieldName = 'LookHistorico'
      LookupDataSet = qry_historico_
      LookupKeyFields = 'CD_HISTORICO'
      LookupResultField = 'NM_HISTORICO'
      KeyFields = 'CD_HISTORICO'
      Size = 50
      Lookup = True
    end
    object qry_monta_adm_CalcVlTotal: TFloatField
      DisplayLabel = 'Valor'
      FieldKind = fkCalculated
      FieldName = 'CalcVlTotal'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
      Calculated = True
    end
    object qry_monta_adm_TP_LANCAMENTO: TStringField
      FieldName = 'TP_LANCAMENTO'
      Origin = 'TADM.NR_REF'
      Size = 1
    end
    object qry_monta_adm_LookCtContacontabil: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtContacontabil'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_monta_adm_LookCtContabilRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtContabilRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_monta_adm_IN_TED: TStringField
      FieldName = 'IN_TED'
      Origin = 'TADM.CD_STATUS_ADM'
      Size = 1
    end
  end
  object ds_monta_adm: TDataSource
    DataSet = qry_monta_adm_
    Left = 63
    Top = 83
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 504
    Top = 83
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO'
      'WHERE CD_BANCO <> '#39#39' AND IN_ATIVO = '#39'1'#39
      '')
    Left = 504
    Top = 26
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
  end
  object qry_status_solic_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TSTATUS_SOLIC_PAGTO')
    Left = 597
    Top = 26
    object qry_status_solic_adm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TSTATUS_SOLIC_PAGTO.CODIGO'
      Size = 2
    end
    object qry_status_solic_adm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TSTATUS_SOLIC_PAGTO.DESCRICAO'
      Size = 30
    end
  end
  object ds_status_solic_adm: TDataSource
    DataSet = qry_status_solic_adm_
    Left = 597
    Top = 83
  end
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 319
    Top = 83
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO'
      'WHERE CD_FAVORECIDO <> '#39#39' AND IN_ATIVO = '#39'1'#39)
    Left = 319
    Top = 26
    object qry_favorecido_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favorecido_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
  end
  object qry_ct_contabil_unica_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCT_CONTABIL'
      
        'WHERE  CD_ACESSO+CD_AUX = :CD_ACESSO_AUX AND CD_IDENTIFICADOR = ' +
        #39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 418
    Top = 26
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACESSO_AUX'
        ParamType = ptUnknown
      end>
    object qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 10
    end
    object qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX FROM TC' +
        'T_CONTABIL'
      'WHERE CD_IDENTIFICADOR = '#39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 418
    Top = 83
    object qry_ct_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 10
    end
    object qry_ct_contabil_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
    object qry_ct_contabil_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_ct_contabil_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 3
    end
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 63
    Top = 144
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
    object tbl_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Required = True
    end
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 158
    Top = 200
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 158
    Top = 144
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
  end
  object ds_servico: TDataSource
    Left = 237
    Top = 200
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 319
    Top = 200
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 319
    Top = 144
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
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 418
    Top = 200
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO,'
      'CD_CLIENTE'
      'FROM TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '                IN_CANCELADO = '#39'0'#39' AND'
      '                IN_LIBERADO = '#39'1'#39' AND'
      '                IN_PRODUCAO ='#39'1'#39)
    Left = 418
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
    object qry_processo_LookUnidNeg: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_processo_LookProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_processo_LookCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCliente'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_processo_LookServico: TStringField
      FieldKind = fkLookup
      FieldName = 'LookServico'
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
  end
  object qry_grd_adm_: TQuery
    AfterOpen = qry_grd_adm_AfterOpen
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, DT_LANCTO, NR_LANCAMENTO, NR_REF, CD_FAVOREC' +
        'IDO, CD_ACESSO, CD_AUX, CD_CT_CONTABIL,'
      
        '       CD_BANCO, ( VL_LANCTO - VL_DESCONTO ) VL_LANCTO, TP_NATUR' +
        'EZA, TP_LANCAMENTO, CD_STATUS_ADM, CD_USUARIO_MONTA, DT_VENCTO, ' +
        'DT_PAGTO'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG   = :CD_UNID_NEG AND'
      '       DT_VENCTO BETWEEN :DT_INICIO AND :DT_TERMINO AND'
      '       CD_FAVORECIDO = :CD_FAVORECIDO AND'
      '       TP_NATUREZA = :TP_NATUREZA AND'
      '       TP_LANCAMENTO = :TP_LANCAMENTO AND'
      '       IN_SOLICITADO = '#39'1'#39' AND ( NR_REF = '#39#39' OR NR_REF IS NULL )')
    Left = 158
    Top = 26
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_TERMINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_FAVORECIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TP_NATUREZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TP_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_grd_adm_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 2
    end
    object qry_grd_adm_DT_LANCTO: TDateTimeField
      FieldName = 'DT_LANCTO'
      Origin = 'TADM.CD_UNID_NEG'
    end
    object qry_grd_adm_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TADM.CD_FAVORECIDO'
      Size = 5
    end
    object qry_grd_adm_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TADM.NR_REF'
      Size = 3
    end
    object qry_grd_adm_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TADM.CD_ACESSO'
      Size = 1
    end
    object qry_grd_adm_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TADM.CD_AUX'
      Size = 3
    end
    object qry_grd_adm_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TADM.CD_CT_CONTABIL'
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_grd_adm_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TADM.CD_BANCO'
      Size = 3
    end
    object qry_grd_adm_VL_LANCTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCTO'
      Origin = 'TADM.VL_LANCTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_grd_adm_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TADM.TP_NATUREZA'
      Size = 1
    end
    object qry_grd_adm_CD_STATUS_ADM: TStringField
      FieldName = 'CD_STATUS_ADM'
      Origin = 'TADM.CD_STATUS_ADM'
      Size = 2
    end
    object qry_grd_adm_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      Origin = 'TADM.CD_USUARIO_MONTA'
      Size = 4
    end
    object qry_grd_adm_DT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
      Origin = 'TADM.DT_VENCTO'
    end
    object qry_grd_adm_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TADM.DT_PAGTO'
    end
    object qry_grd_adm_LookCtContabil: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtContabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_grd_adm_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_adm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_ADM'
      Size = 30
      Lookup = True
    end
    object qry_grd_adm_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
    object qry_grd_adm_LookCtContabilRM: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtContabilRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
  end
  object ds_grd_adm: TDataSource
    DataSet = qry_grd_adm_
    Left = 158
    Top = 83
  end
  object qry_ref_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, NR_REF, SUM( ISNULL( VL_LANCTO, 0 ) - ISNULL' +
        '( VL_DESCONTO, 0 ) ) VL_LANCTO, MAX( DT_PAGTO ) DT_PAGTO,'
      '       MAX( CD_FAVORECIDO ) CD_FAVORECIDO, CD_BANCO, NR_DOCTO'
      'FROM   TADM'
      'WHERE  ISNULL( CD_USUARIO_MONTA, '#39#39' ) <> '#39#39' AND'
      '       ISNULL( NR_REF, '#39#39' ) <> '#39#39' AND'
      '       CD_STATUS_ADM <> '#39'19'#39' AND'
      '       TP_NATUREZA = '#39'D'#39' AND'
      '       DT_PAGTO = :DT_PAGTO AND'
      '       CD_UNID_NEG = :CD_UNID_NEG'
      'GROUP BY CD_UNID_NEG, NR_REF, CD_BANCO, NR_DOCTO')
    Left = 504
    Top = 144
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_PAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_ref_pagto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_ref_pagto_NR_REF: TStringField
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_ref_pagto_VL_LANCTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ref_pagto_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
    end
    object qry_ref_pagto_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_ref_pagto_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_ref_pagto_NR_DOCTO: TStringField
      DisplayLabel = 'N'#186' Docto.'
      FieldName = 'NR_DOCTO'
      Size = 6
    end
    object qry_ref_pagto_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldKind = fkLookup
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_ref_pagto_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkLookup
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
  end
  object ds_ref_pagto: TDataSource
    DataSet = qry_ref_pagto_
    Left = 504
    Top = 200
  end
  object qry_ref_pagto_itens_: TQuery
    AfterScroll = qry_ref_pagto_itens_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_ref_pagto
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, DT_LANCTO, CD_CT_CONTABIL, NR_LANCAMENTO, NR' +
        '_REF, ( ISNULL( VL_LANCTO, 0 ) - ISNULL( VL_DESCONTO, 0 ) ) VL_L' +
        'ANCTO, DT_PAGTO, CD_STATUS_ADM, IN_TRANSF_FIN, NR_DOCTO '
      'FROM   TADM'
      'WHERE  DT_PAGTO = :DT_PAGTO AND'
      '       NR_REF = :NR_REF AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       TP_NATUREZA = '#39'D'#39' AND'
      '       CD_STATUS_ADM <> '#39'19'#39' AND'
      '       ISNULL( NR_REF, '#39#39' ) <> '#39#39)
    Left = 597
    Top = 144
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Size = 3
      end>
    object qry_ref_pagto_itens_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_ref_pagto_itens_DT_LANCTO: TDateTimeField
      FieldName = 'DT_LANCTO'
    end
    object qry_ref_pagto_itens_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_CT_CONTABIL'
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_ref_pagto_itens_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object qry_ref_pagto_itens_NR_REF: TStringField
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_ref_pagto_itens_VL_LANCTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ref_pagto_itens_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
    end
    object qry_ref_pagto_itens_CD_STATUS_ADM: TStringField
      FieldName = 'CD_STATUS_ADM'
      Size = 2
    end
    object qry_ref_pagto_itens_LookCtContabil: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtContabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_ref_pagto_itens_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_adm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_ADM'
      Size = 30
      Lookup = True
    end
    object qry_ref_pagto_itens_IN_TRANSF_FIN: TStringField
      FieldName = 'IN_TRANSF_FIN'
      Size = 1
    end
    object qry_ref_pagto_itens_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Size = 6
    end
    object qry_ref_pagto_itens_LookCtContabilRM: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtContabilRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
  end
  object ds_ref_pagto_itens: TDataSource
    DataSet = qry_ref_pagto_itens_
    Left = 597
    Top = 200
  end
  object qry_ref_recebto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, NR_REF, SUM( ISNULL( VL_LANCTO, 0 ) - ISNULL' +
        '( VL_DESCONTO, 0 ) ) VL_LANCTO, MAX( DT_PAGTO ) DT_PAGTO,'
      '       MAX( CD_FAVORECIDO ) CD_FAVORECIDO, CD_BANCO, NR_DOCTO'
      'FROM   TADM'
      'WHERE  ISNULL( CD_USUARIO_MONTA, '#39#39' ) <> '#39#39' AND'
      '       ISNULL( NR_REF, '#39#39' ) <> '#39#39' AND'
      '       CD_STATUS_ADM <> '#39'19'#39' AND'
      '       DT_PAGTO = :DT_PAGTO AND'
      '       DT_PAGTO = :CD_UNID_NEG AND'
      '       TP_NATUREZA = '#39'C'#39
      'GROUP BY CD_UNID_NEG, NR_REF, CD_BANCO, NR_DOCTO')
    Left = 702
    Top = 144
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_PAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_ref_recebto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_ref_recebto_NR_REF: TStringField
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_ref_recebto_VL_LANCTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ref_recebto_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
    end
    object qry_ref_recebto_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_ref_recebto_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_ref_recebto_NR_DOCTO: TStringField
      DisplayLabel = 'N'#186' Docto.'
      FieldName = 'NR_DOCTO'
      Size = 6
    end
    object qry_ref_recebto_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldKind = fkLookup
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_ref_recebto_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkLookup
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
  end
  object ds_ref_recebto: TDataSource
    DataSet = qry_ref_recebto_
    Left = 702
    Top = 200
  end
  object qry_ref_recebto_itens_: TQuery
    AfterScroll = qry_ref_recebto_itens_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_ref_recebto
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, DT_LANCTO, CD_CT_CONTABIL, NR_LANCAMENTO, NR' +
        '_REF, ( ISNULL( VL_LANCTO, 0 ) - ISNULL( VL_DESCONTO, 0 ) ) VL_L' +
        'ANCTO, DT_PAGTO, CD_STATUS_ADM, IN_TRANSF_FIN, NR_DOCTO'
      'FROM   TADM'
      'WHERE  DT_PAGTO = :DT_PAGTO AND'
      '       NR_REF = :NR_REF AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_STATUS_ADM <> '#39'19'#39' AND'
      '       TP_NATUREZA = '#39'C'#39' AND'
      '       ISNULL( NR_REF, '#39#39' ) <> '#39#39)
    Left = 811
    Top = 144
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_ref_recebto_itens_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_ref_recebto_itens_DT_LANCTO: TDateTimeField
      FieldName = 'DT_LANCTO'
    end
    object qry_ref_recebto_itens_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_CT_CONTABIL'
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_ref_recebto_itens_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object qry_ref_recebto_itens_NR_REF: TStringField
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_ref_recebto_itens_VL_LANCTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ref_recebto_itens_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
    end
    object qry_ref_recebto_itens_CD_STATUS_ADM: TStringField
      FieldName = 'CD_STATUS_ADM'
      Size = 2
    end
    object qry_ref_recebto_itens_LookCtContabil: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtContabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_ref_recebto_itens_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_adm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_ADM'
      Size = 30
      Lookup = True
    end
    object qry_ref_recebto_itens_IN_TRANSF_FIN: TStringField
      FieldName = 'IN_TRANSF_FIN'
      Size = 1
    end
    object qry_ref_recebto_itens_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Size = 6
    end
    object qry_ref_recebto_itens_LookCtContabilRM: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtContabilRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
  end
  object ds_ref_recebto_itens: TDataSource
    DataSet = qry_ref_recebto_itens_
    Left = 811
    Top = 200
  end
  object qry_monta_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ref_pagto_itens
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, NR_REF, CD_BANCO, NR_LANCAMENTO, NR_DOCTO, C' +
        'D_USUARIO_MONTA, DT_PAGTO, DT_LANCTO, CD_CT_CONTABIL, CD_STATUS_' +
        'ADM, CD_CT_CUSTO'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_LANCTO = :DT_LANCTO AND'
      '       CD_CT_CONTABIL = :CD_CT_CONTABIL AND'
      '       TP_NATUREZA = '#39'D'#39' AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 597
    Top = 257
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_monta_pagto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 2
    end
    object qry_monta_pagto_DT_LANCTO: TDateTimeField
      FieldName = 'DT_LANCTO'
      Origin = 'TADM.DT_LANCTO'
    end
    object qry_monta_pagto_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TADM.CD_CT_CONTABIL'
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_monta_pagto_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
    object qry_monta_pagto_CD_STATUS_ADM: TStringField
      FieldName = 'CD_STATUS_ADM'
      Origin = 'TADM.CD_STATUS_ADM'
      Size = 2
    end
    object qry_monta_pagto_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
    object qry_monta_pagto_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TADM.NR_REF'
      Size = 3
    end
    object qry_monta_pagto_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 6
    end
    object qry_monta_pagto_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      Origin = 'TADM.NR_REF'
      Size = 4
    end
    object qry_monta_pagto_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TADM.CD_BANCO'
    end
    object qry_monta_pagto_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TADM.CD_CT_CUSTO'
      FixedChar = True
      Size = 4
    end
  end
  object qry_monta_recebto_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ref_recebto_itens
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, NR_REF, CD_BANCO, NR_LANCAMENTO, NR_DOCTO, C' +
        'D_USUARIO_MONTA, DT_PAGTO, DT_LANCTO, CD_CT_CONTABIL, CD_STATUS_' +
        'ADM'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_LANCTO = :DT_LANCTO AND'
      '       CD_CT_CONTABIL = :CD_CT_CONTABIL AND'
      '       TP_NATUREZA = '#39'C'#39' AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 811
    Top = 257
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_monta_recebto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 2
    end
    object qry_monta_recebto_DT_LANCTO: TDateTimeField
      FieldName = 'DT_LANCTO'
      Origin = 'TADM.DT_LANCTO'
    end
    object qry_monta_recebto_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TADM.CD_CT_CONTABIL'
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_monta_recebto_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
    object qry_monta_recebto_CD_STATUS_ADM: TStringField
      FieldName = 'CD_STATUS_ADM'
      Origin = 'TADM.CD_STATUS_ADM'
      Size = 2
    end
    object qry_monta_recebto_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
    object qry_monta_recebto_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TADM.NR_REF'
      Size = 3
    end
    object qry_monta_recebto_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 6
    end
    object qry_monta_recebto_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      Origin = 'TADM.NR_REF'
      Size = 4
    end
    object qry_monta_recebto_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TADM.CD_BANCO'
    end
  end
  object qry_ult_ref_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RIGHT( '#39'000'#39' + CONVERT( varchar, ( CONVERT( int, ISNULL( ' +
        'MAX( NR_REF ), '#39'000'#39' ) ) + 1 ) ), 3 ) ULT_REF'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      
        '       CONVERT( datetime, DT_PAGTO, 103 ) = CONVERT( datetime, C' +
        'ONVERT( char(10), GETDATE(), 103 ), 103 )')
    Left = 63
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_ult_ref_ULT_REF: TStringField
      FieldName = 'ULT_REF'
      Size = 3
    end
  end
  object qry_historico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_HISTORICO, NM_HISTORICO, TX_HISTORICO'
      'FROM THIST_PADRAO')
    Left = 63
    Top = 257
    object qry_historico_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'THIST_PADRAO.CD_HISTORICO'
      Size = 3
    end
    object qry_historico_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'THIST_PADRAO.NM_HISTORICO'
      Size = 50
    end
    object qry_historico_TX_HISTORICO: TMemoField
      FieldName = 'TX_HISTORICO'
      Origin = 'THIST_PADRAO.CD_HISTORICO'
      BlobType = ftMemo
    end
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO')
    Left = 237
    Top = 144
    object qry_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
  end
  object qry_rel_liq_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT_LIQ'
      'FROM   TADM A, TFAVORECIDO F, TEMPRESA_NAC E'
      'WHERE  A.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       A.DT_LANCTO = :DT_LANCTO AND'
      '       A.CD_CT_CONTABIL = :CD_CT_CONTABIL AND'
      '       A.TP_NATUREZA = :TP_NATUREZA AND'
      '       A.NR_LANCAMENTO = :NR_LANCAMENTO AND'
      '       A.CD_FAVORECIDO = F.CD_FAVORECIDO AND'
      '       F.CGC_EMPRESA = E.CGC_EMPRESA AND'
      '       A.CD_STATUS_ADM NOT IN ( '#39'4'#39', '#39'17'#39' ) AND'
      '       ISNULL( A.NR_DOCTO, '#39#39' ) <> '#39#39' AND'
      
        '       A.CD_CT_CONTABIL NOT IN ( '#39'6110102800'#39', '#39'6410509100'#39' ) AN' +
        'D'
      '       E.CD_GRUPO IN ( SELECT E.CD_GRUPO '
      
        '                       FROM   TLIQUIDACAO L, TPROCESSO P, TEMPRE' +
        'SA_NAC E'
      '                       WHERE  L.NR_PROCESSO = P.NR_PROCESSO AND'
      '                              P.CD_CLIENTE = E.CD_EMPRESA AND'
      '                              L.IN_CANCELADO = '#39'0'#39' AND'
      
        '                              L.NR_RELATORIO = A.NR_RELATORIO AN' +
        'D'
      '                              L.NR_ANO = A.NR_ANO )'
      '')
    Left = 504
    Top = 257
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TP_NATUREZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_rel_liq_TOT_LIQ: TIntegerField
      FieldName = 'TOT_LIQ'
    end
  end
  object qry_ult_lancto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ISNULL( RIGHT( '#39'000'#39' + CONVERT( varchar(3), (CONVERT( int' +
        ', MAX( ISNULL( NR_LANCAMENTO, '#39'000'#39' ) ) ) + 1 ) ), 3 ), '#39'001'#39' ) ' +
        'NR_LANCAMENTO'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_LANCTO = :DT_LANCTO'
      '')
    Left = 418
    Top = 257
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptUnknown
      end>
    object qry_ult_lancto_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
  end
  object qry_ins_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'INSERT TADM ( CD_UNID_NEG, DT_LANCTO, CD_CT_CONTABIL, TP_NATUREZ' +
        'A, NR_LANCAMENTO,'
      
        '              NR_REF, CD_FAVORECIDO, CD_ACESSO, CD_AUX, CD_BANCO' +
        ', NR_DOCTO, VL_LANCTO,'
      
        '              CD_STATUS_ADM, CD_USUARIO_SOLIC, CD_USUARIO_MONTA,' +
        ' IN_SOLICITADO,'
      
        '              DT_VENCTO, DT_PAGTO, CD_HISTORICO, CD_STATUS_CHEQU' +
        'E, IN_TRANSF_FIN,'
      
        '              VL_DESCONTO, VL_PERC_DESCONTO, CD_USUARIO_IMP, TX_' +
        'HISTORICO, TP_LANCAMENTO, CD_CT_CUSTO )'
      
        'SELECT CD_UNID_NEG, DT_LANCTO, CD_CT_CONTABIL, TP_NATUREZA, :NR_' +
        'NOVO_LANCAMENTO,'
      
        '       NULL, CD_FAVORECIDO, CD_ACESSO, CD_AUX, CD_BANCO, NULL, V' +
        'L_LANCTO,'
      
        '       '#39'16'#39', CD_USUARIO_SOLIC, NULL, '#39'1'#39', DT_VENCTO, DT_PAGTO, C' +
        'D_HISTORICO,'
      
        '       '#39'0'#39', '#39'0'#39', VL_DESCONTO, VL_PERC_DESCONTO, CD_USUARIO_IMP, ' +
        'TX_HISTORICO, TP_LANCAMENTO, CD_CT_CUSTO'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_LANCTO = :DT_LANCTO AND'
      '       CD_CT_CONTABIL = :CD_CT_CONTABIL AND'
      '       TP_NATUREZA = :TP_NATUREZA AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 319
    Top = 257
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_NOVO_LANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TP_NATUREZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
  end
  object qry_ct_contabilRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM   TCONTABIL_PLANO'
      'WHERE  CD_COLIGADA = '#39'01'#39)
    Left = 158
    Top = 257
    object qry_ct_contabilRM_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCONTABIL_PLANO.CD_CT_CONTABIL'
      Size = 10
    end
    object qry_ct_contabilRM_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCONTABIL_PLANO.NM_CT_CONTABIL'
      Size = 40
    end
  end
  object qry_soma_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM ( VL_LANCTO - VL_DESCONTO ) VL_TOTAL'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG   = :CD_UNID_NEG AND'
      '       DT_VENCTO BETWEEN :DT_INICIO AND :DT_TERMINO AND'
      '       CD_FAVORECIDO = :CD_FAVORECIDO AND'
      '       TP_NATUREZA = :TP_NATUREZA AND'
      '       TP_LANCAMENTO = :TP_LANCAMENTO AND'
      '       IN_SOLICITADO = '#39'1'#39' AND ( NR_REF = '#39#39' OR NR_REF IS NULL )')
    Left = 911
    Top = 27
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_TERMINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_FAVORECIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'TP_NATUREZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'TP_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_soma_adm_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_soma_adm: TDataSource
    DataSet = qry_soma_adm_
    Left = 909
    Top = 76
  end
end
