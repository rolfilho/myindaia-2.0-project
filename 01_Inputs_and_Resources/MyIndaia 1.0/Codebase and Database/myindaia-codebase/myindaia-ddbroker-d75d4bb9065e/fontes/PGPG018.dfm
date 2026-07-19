object datm_pesq_adm: Tdatm_pesq_adm
  OldCreateOrder = True
  Left = 264
  Top = 481
  Height = 287
  Width = 631
  object ds_pesq: TDataSource
    DataSet = qry_pesq_
    Left = 53
    Top = 74
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 157
    Top = 74
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'ORDER BY'
      'NM_UNID_NEG')
    Left = 157
    Top = 20
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 10
    end
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO'
      'ORDER BY'
      'NM_FAVORECIDO')
    Left = 336
    Top = 132
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
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 336
    Top = 186
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX'
      'FROM TCT_CONTABIL'
      'WHERE CD_IDENTIFICADOR = '#39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL'
      '')
    Left = 336
    Top = 20
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
  object ds_ct_contabil: TDataSource
    DataSet = qry_ct_contabil_
    Left = 336
    Top = 74
  end
  object qry_status_solic_adm_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM TSTATUS_SOLIC_PAGTO'
      'ORDER BY'
      'DESCRICAO')
    Left = 53
    Top = 132
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
    Left = 53
    Top = 186
  end
  object qry_historico_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_HISTORICO, NM_HISTORICO'
      'FROM THIST_PADRAO'
      'ORDER BY'
      'NM_HISTORICO')
    Left = 247
    Top = 132
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
  end
  object ds_historico: TDataSource
    DataSet = qry_historico_
    Left = 247
    Top = 186
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM TUSUARIO'
      'ORDER BY'
      'NM_USUARIO')
    Left = 157
    Top = 132
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
  object ds_usuario: TDataSource
    DataSet = qry_usuario_
    Left = 157
    Top = 186
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO'
      'ORDER BY'
      'NM_BANCO')
    Left = 247
    Top = 20
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
  object ds_calculo: TDataSource
    DataSet = qry_banco_
    Left = 247
    Top = 74
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
    Left = 441
    Top = 20
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
  object qry_pesq_: TQuery
    OnCalcFields = qry_pesq_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT S.CD_UNID_NEG, S.CD_ACESSO, S.CD_AUX, S.CD_CT_CONTABIL, S' +
        '.CD_USUARIO_SOLIC,'
      
        '       S.CD_BANCO, S.CD_FAVORECIDO, S.CD_HISTORICO, S.CD_STATUS_' +
        'ADM, S.VL_LANCTO,'
      
        '       S.NR_DOCTO, S.DT_VENCTO, S.DT_PAGTO, S.TP_NATUREZA, S.NR_' +
        'LANCAMENTO, S.NR_LANCAMENTO_SELECIONADO,'
      '       S.DT_LANCTO, S.IN_SELECIONADO'
      'FROM   TADM S, TUNID_NEG U'
      'WHERE  S.CD_UNID_NEG = U.CD_UNID_NEG')
    Left = 55
    Top = 20
    object qry_pesq_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 2
    end
    object qry_pesq_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TADM.CD_CT_CONTABIL'
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_pesq_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TADM.CD_FAVORECIDO'
      Size = 5
    end
    object qry_pesq_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TADM.CD_ACESSO'
      Size = 1
    end
    object qry_pesq_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TADM.CD_AUX'
      Size = 3
    end
    object qry_pesq_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TADM.CD_BANCO'
      Size = 3
    end
    object qry_pesq_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TADM.NR_DOCTO'
      Size = 6
    end
    object qry_pesq_VL_LANCTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCTO'
      Origin = 'TADM.VL_LANCTO'
      DisplayFormat = '#0,.00'
    end
    object qry_pesq_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TADM.TP_NATUREZA'
      Size = 1
    end
    object qry_pesq_CD_STATUS_ADM: TStringField
      FieldName = 'CD_STATUS_ADM'
      Origin = 'TADM.CD_STATUS_ADM'
      Size = 2
    end
    object qry_pesq_CD_USUARIO_SOLIC: TStringField
      FieldName = 'CD_USUARIO_SOLIC'
      Origin = 'TADM.CD_USUARIO_SOLIC'
      Size = 4
    end
    object qry_pesq_DT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
      Origin = 'TADM.DT_VENCTO'
    end
    object qry_pesq_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TADM.DT_PAGTO'
    end
    object qry_pesq_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'TADM.CD_HISTORICO'
      Size = 3
    end
    object qry_pesq_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
    object qry_pesq_LookCtContabil: TStringField
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
    object qry_pesq_LookFavorecido: TStringField
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
    object qry_pesq_LookBanco: TStringField
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
    object qry_pesq_LookStatus: TStringField
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
    object qry_pesq_LookUsuario: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldKind = fkLookup
      FieldName = 'LookUsuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'NM_USUARIO'
      KeyFields = 'CD_USUARIO_SOLIC'
      Size = 50
      Lookup = True
    end
    object qry_pesq_LookHistorico: TStringField
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
    object qry_pesq_LookUnidNeg: TStringField
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
    object qry_pesq_LookCtContabilRM: TStringField
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
    object qry_pesq_DT_LANCTO: TDateTimeField
      FieldName = 'DT_LANCTO'
      Origin = 'DBBROKER.TADM.DT_LANCTO'
    end
    object qry_pesq_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TADM.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_pesq_calcIN_SELECIONADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcIN_SELECIONADO'
      Size = 1
      Calculated = True
    end
    object qry_pesq_NR_LANCAMENTO_SELECIONADO: TStringField
      FieldName = 'NR_LANCAMENTO_SELECIONADO'
      Origin = 'DBBROKER.TADM.NR_LANCAMENTO_SELECIONADO'
      FixedChar = True
      Size = 3
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT HM_PARA_SOLIC_CH, CD_SISTEMA_CONTABIL'
      'FROM TPARAMETROS')
    Left = 439
    Top = 75
    object qry_param_HM_PARA_SOLIC_CH: TStringField
      FieldName = 'HM_PARA_SOLIC_CH'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 5
    end
    object qry_param_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 1
    end
  end
  object qry_ct_contabilRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM   TCONTABIL_PLANO'
      'WHERE  CD_COLIGADA = '#39'01'#39)
    Left = 434
    Top = 130
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
end
