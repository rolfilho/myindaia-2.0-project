object datm_banco: Tdatm_banco
  OldCreateOrder = True
  Left = 525
  Top = 244
  Height = 260
  Width = 405
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 28
    Top = 29
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TBANCO'
      'ORDER BY'
      'CD_BANCO')
    Left = 116
    Top = 29
    object qry_banco_CD_BANCO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
    object qry_banco_AP_BANCO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 10
    end
    object qry_banco_NR_CONTA: TStringField
      DisplayLabel = 'N'#186' Conta'
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NR_CONTA'
      Size = 10
    end
    object qry_banco_CD_AGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
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
    object qry_banco_LookAtivo: TStringField
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
    object qry_banco_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_DAC_AGENCIA: TStringField
      FieldName = 'DAC_AGENCIA'
      Origin = 'TBANCO.CANO'
      Size = 1
    end
    object qry_banco_LookCtContabil: TStringField
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
    object qry_banco_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TBANCO.CANO'
      Size = 1
    end
    object qry_banco_LookAcesso: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAcesso'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_ACESSO'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 1
      Lookup = True
    end
    object qry_banco_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TBANCO.CANO'
      Size = 3
    end
    object qry_banco_LookAux: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAux'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_AUX'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 3
      Lookup = True
    end
    object qry_banco_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TBANCO.CANO'
      Size = 6
    end
    object qry_banco_LookNmBco: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmBco'
      LookupDataSet = qry_bco_
      LookupKeyFields = 'CD_BCO'
      LookupResultField = 'NM_BCO'
      KeyFields = 'NR_BANCO'
      Size = 50
      Lookup = True
    end
    object qry_banco_LookCtContabilRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtContabilRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_banco_PATH_COB_AUT_TRANS: TStringField
      FieldName = 'PATH_COB_AUT_TRANS'
      Origin = 'TBANCO.CANO'
      Size = 255
    end
    object qry_banco_PATH_COB_AUT_IMP: TStringField
      FieldName = 'PATH_COB_AUT_IMP'
      Origin = 'TBANCO.CANO'
      Size = 255
    end
    object qry_banco_TX_INSTRUCAO: TStringField
      FieldName = 'TX_INSTRUCAO'
      Origin = 'TBANCO.CANO'
      Size = 250
    end
    object qry_banco_NR_REMESSA: TStringField
      FieldName = 'NR_REMESSA'
      Origin = 'TBANCO.CANO'
      Size = 6
    end
    object qry_banco_LVALOR: TIntegerField
      FieldName = 'LVALOR'
      Origin = 'TBANCO.CD_BANCO'
    end
    object qry_banco_CVALOR: TIntegerField
      FieldName = 'CVALOR'
      Origin = 'TBANCO.NM_BANCO'
    end
    object qry_banco_LEXTENSO: TIntegerField
      FieldName = 'LEXTENSO'
      Origin = 'TBANCO.AP_BANCO'
    end
    object qry_banco_CEXTENSO: TIntegerField
      FieldName = 'CEXTENSO'
      Origin = 'TBANCO.NR_CONTA'
    end
    object qry_banco_LFAVOR: TIntegerField
      FieldName = 'LFAVOR'
      Origin = 'TBANCO.CD_AGENCIA'
    end
    object qry_banco_CFAVOR: TIntegerField
      FieldName = 'CFAVOR'
      Origin = 'TBANCO.CD_CT_CONTABIL'
    end
    object qry_banco_LCIDADE: TIntegerField
      FieldName = 'LCIDADE'
      Origin = 'TBANCO.IN_ATIVO'
    end
    object qry_banco_CCIDADE: TIntegerField
      FieldName = 'CCIDADE'
      Origin = 'TBANCO.TP_CONTA'
    end
    object qry_banco_CDIA: TIntegerField
      FieldName = 'CDIA'
      Origin = 'TBANCO.IN_FINANCEIRO'
    end
    object qry_banco_CANO: TIntegerField
      FieldName = 'CANO'
      Origin = 'TBANCO.NR_BANCO'
    end
    object qry_banco_ANOMASK: TStringField
      FieldName = 'ANOMASK'
      Origin = 'TBANCO.LVALOR'
      Size = 4
    end
    object qry_banco_LEXTENSO2: TIntegerField
      FieldName = 'LEXTENSO2'
      Origin = 'TBANCO.LEXTENSO'
    end
    object qry_banco_CEXTENSO2: TIntegerField
      FieldName = 'CEXTENSO2'
      Origin = 'TBANCO.CEXTENSO'
    end
    object qry_banco_CMES: TIntegerField
      FieldName = 'CMES'
      Origin = 'TBANCO.LFAVOR'
    end
    object qry_banco_LCHEQUE: TIntegerField
      FieldName = 'LCHEQUE'
      Origin = 'TBANCO.CFAVOR'
    end
    object qry_banco_CCHEQUE: TIntegerField
      FieldName = 'CCHEQUE'
      Origin = 'TBANCO.LCIDADE'
    end
    object qry_banco_CBANCO: TIntegerField
      FieldName = 'CBANCO'
      Origin = 'TBANCO.CCIDADE'
    end
    object qry_banco_NR_DOC: TStringField
      FieldName = 'NR_DOC'
      Origin = 'DBBROKER.TBANCO.NR_DOC'
      FixedChar = True
      Size = 6
    end
    object qry_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TBANCO.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_banco_FORMCONT: TBooleanField
      FieldName = 'FORMCONT'
      Origin = 'DBBROKER.TBANCO.FORMCONT'
    end
    object qry_banco_IN_SM: TStringField
      FieldName = 'IN_SM'
      Origin = 'DBBROKER.TBANCO.IN_SM'
      FixedChar = True
      Size = 1
    end
    object qry_banco_IN_EXTRA_CAIXA: TStringField
      FieldName = 'IN_EXTRA_CAIXA'
      Origin = 'DBBROKER.TBANCO.IN_EXTRA_CAIXA'
      FixedChar = True
      Size = 1
    end
    object qry_banco_IN_IMPOSTOS: TStringField
      FieldName = 'IN_IMPOSTOS'
      Origin = 'DBBROKER.TBANCO.IN_IMPOSTOS'
      FixedChar = True
      Size = 1
    end
    object qry_banco_IN_BCO_FLUXO_OP: TStringField
      FieldName = 'IN_BCO_FLUXO_OP'
      Origin = 'DBBROKER.TBANCO.IN_BCO_FLUXO_OP'
      FixedChar = True
      Size = 1
    end
    object qry_banco_CD_CC_REDUZIDA: TStringField
      FieldName = 'CD_CC_REDUZIDA'
      Origin = 'DBBROKER.TBANCO.CD_CC_REDUZIDA'
      FixedChar = True
      Size = 7
    end
    object qry_banco_IN_INDAIA: TIntegerField
      FieldName = 'IN_INDAIA'
      Origin = 'DBBROKER.TBANCO.IN_INDAIA'
    end
  end
  object qry_ult_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_BANCO) AS ULTIMO'
      'FROM TBANCO')
    Left = 116
    Top = 89
    object qry_ult_banco_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 28
    Top = 156
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 116
    Top = 156
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX FROM TC' +
        'T_CONTABIL (NOLOCK)'
      'WHERE CD_IDENTIFICADOR = '#39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 28
    Top = 89
    object qry_ct_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
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
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_SISTEMA_CONTABIL'
      'FROM TPARAMETROS (NOLOCK)')
    Left = 220
    Top = 29
    object qry_param_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TPARAMETROS.CD_SISTEMA_CONTABIL'
      Size = 1
    end
  end
  object qry_ct_contabil_unica_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCT_CONTABIL (NOLOCK)'
      
        'WHERE  CD_ACESSO+CD_AUX = :CD_ACESSO_AUX AND CD_IDENTIFICADOR = ' +
        #39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 219
    Top = 89
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACESSO_AUX'
        ParamType = ptUnknown
      end>
    object qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
  end
  object qry_bco_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TBCO (NOLOCK)')
    Left = 215
    Top = 157
    object qry_bco_CD_BCO: TStringField
      FieldName = 'CD_BCO'
      Origin = 'TBCO.CD_BCO'
      Size = 3
    end
    object qry_bco_NM_BCO: TStringField
      FieldName = 'NM_BCO'
      Origin = 'TBCO.NM_BCO'
      Size = 50
    end
  end
  object qry_ct_contabilRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM   TCONTABIL_PLANO (NOLOCK)'
      'WHERE  CD_COLIGADA = '#39'01'#39)
    Left = 313
    Top = 156
    object qry_ct_contabilRM_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCONTABIL_PLANO.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabilRM_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCONTABIL_PLANO.NM_CT_CONTABIL'
      Size = 40
    end
  end
end
