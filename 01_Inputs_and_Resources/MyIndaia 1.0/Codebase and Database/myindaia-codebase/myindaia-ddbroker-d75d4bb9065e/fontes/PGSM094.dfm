object datm_conta: Tdatm_conta
  OnCreate = datm_contaCreate
  Left = 304
  Top = 158
  Height = 290
  Width = 471
  object ds_conta: TDataSource
    DataSet = qry_conta_
    Left = 136
    Top = 77
  end
  object tbl_yesno_: TTable
    Active = True
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 32
    Top = 20
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
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 32
    Top = 77
  end
  object qry_conta_: TQuery
    AfterScroll = qry_conta_AfterScroll
    OnCalcFields = qry_conta_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TCONTA_CAIXA ORDER BY'
      'NM_CONTA')
    Left = 136
    Top = 20
    object qry_conta_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTA_CAIXA.CD_COLIGADA'
      Size = 2
    end
    object qry_conta_CD_CONTA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_CONTA'
      Origin = 'TCONTA_CAIXA.CD_CONTA'
      Size = 3
    end
    object qry_conta_NM_CONTA: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_CONTA'
      Origin = 'TCONTA_CAIXA.NM_CONTA'
    end
    object qry_conta_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TCONTA_CAIXA.TP_CONTA'
      Size = 1
    end
    object qry_conta_CD_BANCO: TStringField
      DisplayLabel = 'Cód. Banco'
      FieldName = 'CD_BANCO'
      Origin = 'TCONTA_CAIXA.CD_BANCO'
      Size = 3
    end
    object qry_conta_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCONTA_CAIXA.IN_ATIVO'
      Size = 1
    end
    object qry_conta_IN_BAIXA_ACERTO: TStringField
      FieldName = 'IN_BAIXA_ACERTO'
      Origin = 'TCONTA_CAIXA.CD_COLIGADA'
      Size = 1
    end
    object qry_conta_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCONTA_CAIXA.CD_CONTA'
      Size = 1
    end
    object qry_conta_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCONTA_CAIXA.NM_CONTA'
      Size = 3
    end
    object qry_conta_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_conta_look_banco: TStringField
      FieldName = 'look_banco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 25
      Lookup = True
    end
    object qry_conta_look_coligada: TStringField
      FieldName = 'look_coligada'
      LookupDataSet = qry_coligada_
      LookupKeyFields = 'CD_COLIGADA'
      LookupResultField = 'NM_COLIGADA'
      KeyFields = 'CD_COLIGADA'
      Lookup = True
    end
    object qry_conta_look_baixa_acerto: TStringField
      FieldName = 'look_baixa_acerto'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_BAIXA_ACERTO'
      Size = 1
      Lookup = True
    end
    object qry_conta_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCONTA_CAIXA.NM_CONTA'
      OnChange = qry_conta_CD_CT_CONTABILChange
      Size = 10
    end
    object qry_conta_LookCtContabil: TStringField
      DisplayLabel = 'Conta Contábil'
      FieldName = 'LookCtContabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_conta_LookAcesso: TStringField
      DisplayLabel = 'Acesso'
      FieldName = 'LookAcesso'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_ACESSO'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 1
      Lookup = True
    end
    object qry_conta_LookAux: TStringField
      DisplayLabel = 'Aux'
      FieldName = 'LookAux'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_AUX'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 3
      Lookup = True
    end
    object qry_conta_IN_EXIBE: TStringField
      FieldName = 'IN_EXIBE'
      Origin = 'TCONTA_CAIXA.CD_COLIGADA'
      Size = 1
    end
    object qry_conta_LookExibe: TStringField
      FieldName = 'LookExibe'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_EXIBE'
      Size = 3
      Lookup = True
    end
    object qry_conta_LookCtContabilRM: TStringField
      FieldName = 'LookCtContabilRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_conta_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCONTA_CAIXA.CD_COLIGADA'
      Size = 2
    end
    object qry_conta_LookUnidNeg: TStringField
      FieldName = 'LookUnidNeg'
      Size = 50
      Calculated = True
    end
  end
  object qry_tp_conta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTP_CONTA')
    Left = 32
    Top = 136
    object qry_tp_conta_CD_TP_CONTA: TStringField
      FieldName = 'CD_TP_CONTA'
      Origin = 'TTP_CONTA.CD_TP_CONTA'
      Size = 1
    end
    object qry_tp_conta_NM_TP_CONTA: TStringField
      FieldName = 'NM_TP_CONTA'
      Origin = 'TTP_CONTA.NM_TP_CONTA'
      Size = 15
    end
  end
  object qry_banco_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TBANCO')
    Left = 136
    Top = 136
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
    object qry_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 10
    end
    object qry_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NR_CONTA'
      Size = 10
    end
    object qry_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 5
    end
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TBANCO.TP_CONTA'
      Size = 1
    end
    object qry_banco_IN_FINANCEIRO: TStringField
      FieldName = 'IN_FINANCEIRO'
      Origin = 'TBANCO.IN_FINANCEIRO'
      Size = 1
    end
    object qry_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
    object qry_banco_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TBANCO.FORMCONT'
      Size = 1
    end
    object qry_banco_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TBANCO.LEXTENSO2'
      Size = 3
    end
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 136
    Top = 194
  end
  object qry_coligada_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TCOLIGADA')
    Left = 248
    Top = 136
    object qry_coligada_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCOLIGADA.CD_COLIGADA'
      Size = 2
    end
    object qry_coligada_NM_COLIGADA: TStringField
      FieldName = 'NM_COLIGADA'
      Origin = 'TCOLIGADA.NM_COLIGADA'
    end
  end
  object ds_coligada: TDataSource
    DataSet = qry_coligada_
    Left = 248
    Top = 194
  end
  object qry_ct_contabilRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM   TCONTABIL_PLANO'
      'WHERE  CD_COLIGADA = :CD_COLIGADA')
    Params.Data = {010001000B43445F434F4C49474144410001020030000000}
    Left = 248
    Top = 20
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
  object ds_conta_contabil: TDataSource
    DataSet = qry_ct_contabilRM_
    Left = 248
    Top = 77
  end
  object ds_tp_conta: TDataSource
    DataSet = qry_tp_conta_
    Left = 32
    Top = 194
  end
  object qry_ct_contabil_unica_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCT_CONTABIL'
      'WHERE  CD_ACESSO+CD_AUX = :CD_ACESSO_AUX'
      'ORDER BY'
      'CD_CT_CONTABIL')
    Params.Data = {010001000D43445F41434553534F5F4155580001020030000000}
    Left = 367
    Top = 20
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
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX FROM TC' +
        'T_CONTABIL'
      'ORDER BY'
      'CD_CT_CONTABIL'
      '')
    Left = 367
    Top = 76
    object qry_ct_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_ct_contabil_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
    object qry_ct_contabil_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCT_CONTABIL.CD_ACESSO'
      Size = 1
    end
    object qry_ct_contabil_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCT_CONTABIL.CD_AUX'
      Size = 3
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SISTEMA_CONTABIL'
      'FROM TPARAMETROS')
    Left = 367
    Top = 136
    object qry_param_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TPARAMETROS.CD_SISTEMA_CONTABIL'
      Size = 1
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG '
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 368
    Top = 192
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
end
