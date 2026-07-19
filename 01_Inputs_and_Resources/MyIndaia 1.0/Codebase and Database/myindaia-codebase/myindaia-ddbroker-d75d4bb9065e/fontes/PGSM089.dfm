object datm_favor: Tdatm_favor
  OldCreateOrder = True
  OnCreate = datm_favorCreate
  Left = 341
  Top = 168
  Height = 342
  Width = 563
  object ds_favor: TDataSource
    DataSet = qry_favor_
    Left = 136
    Top = 77
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 32
    Top = 20
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 32
    Top = 77
  end
  object qry_favor_: TQuery
    AfterPost = qry_favor_AfterPost
    AfterScroll = qry_favor_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TFAVORECIDO ORDER BY'
      'NM_FAVORECIDO')
    Left = 136
    Top = 20
    object qry_favor_CD_FAVORECIDO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favor_NM_FAVORECIDO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
    object qry_favor_AP_FAVORECIDO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_FAVORECIDO'
      Origin = 'TFAVORECIDO.AP_FAVORECIDO'
      Size = 10
    end
    object qry_favor_END_FAVORECIDO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'END_FAVORECIDO'
      Origin = 'TFAVORECIDO.END_FAVORECIDO'
      Size = 50
    end
    object qry_favor_END_NUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'END_NUMERO'
      Origin = 'TFAVORECIDO.END_NUMERO'
      Size = 6
    end
    object qry_favor_END_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'END_CIDADE'
      Origin = 'TFAVORECIDO.END_CIDADE'
      Size = 30
    end
    object qry_favor_END_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'END_BAIRRO'
      Origin = 'TFAVORECIDO.END_BAIRRO'
      Size = 30
    end
    object qry_favor_END_UF: TStringField
      DisplayLabel = 'UF'
      FieldName = 'END_UF'
      Origin = 'TFAVORECIDO.END_UF'
      Size = 2
    end
    object qry_favor_END_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'END_CEP'
      Origin = 'TFAVORECIDO.END_CEP'
      EditMask = '00000\-999;0;_'
      Size = 8
    end
    object qry_favor_NR_FONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'NR_FONE'
      Origin = 'TFAVORECIDO.NR_FONE'
      EditMask = '(999)9999-9999;1;_'
      Size = 15
    end
    object qry_favor_NR_FAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'NR_FAX'
      Origin = 'TFAVORECIDO.NR_FAX'
      EditMask = '(999)9999-9999;1;_'
      Size = 15
    end
    object qry_favor_NM_CONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'NM_CONTATO'
      Origin = 'TFAVORECIDO.NM_CONTATO'
      Size = 50
    end
    object qry_favor_TX_CARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'TX_CARGO'
      Origin = 'TFAVORECIDO.TX_CARGO'
      Size = 25
    end
    object qry_favor_TX_DEPARTAMENTO: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'TX_DEPARTAMENTO'
      Origin = 'TFAVORECIDO.TX_DEPARTAMENTO'
      Size = 50
    end
    object qry_favor_CD_TIPO_PESSOA: TStringField
      DisplayLabel = 'C'#243'd Tipo Pessoa'
      FieldName = 'CD_TIPO_PESSOA'
      Origin = 'TFAVORECIDO.CD_TIPO_PESSOA'
      Size = 1
    end
    object qry_favor_CGC_EMPRESA: TStringField
      DisplayLabel = 'CGC Empresa'
      FieldName = 'CGC_EMPRESA'
      Origin = 'TFAVORECIDO.CGC_EMPRESA'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_favor_CPF_EMPRESA: TStringField
      DisplayLabel = 'CPF Empresa'
      FieldName = 'CPF_EMPRESA'
      Origin = 'TFAVORECIDO.CPF_EMPRESA'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object qry_favor_IE_EMPRESA: TStringField
      DisplayLabel = 'IE Empresa'
      FieldName = 'IE_EMPRESA'
      Origin = 'TFAVORECIDO.IE_EMPRESA'
      EditMask = '999.999.999.999;0;_'
    end
    object qry_favor_DT_INCLUSAO: TDateTimeField
      DisplayLabel = 'Data  Inclus'#227'o'
      FieldName = 'DT_INCLUSAO'
      Origin = 'TFAVORECIDO.DT_INCLUSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_favor_IN_CONTROLA_IR: TBooleanField
      FieldName = 'IN_CONTROLA_IR'
      Origin = 'TFAVORECIDO.IN_CONTROLA_IR'
    end
    object qry_favor_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TFAVORECIDO.IN_ATIVO'
      Size = 1
    end
    object qry_favor_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_favor_look_controla_ir: TStringField
      FieldKind = fkLookup
      FieldName = 'look_controla_ir'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CONTROLA_IR'
      Size = 3
      Lookup = True
    end
    object qry_favor_CD_RECOL: TStringField
      FieldName = 'CD_RECOL'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 4
    end
    object qry_favor_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 1
    end
    object qry_favor_LookAcesso: TStringField
      DisplayLabel = 'Acesso'
      FieldKind = fkLookup
      FieldName = 'LookAcesso'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_ACESSO'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 1
      Lookup = True
    end
    object qry_favor_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 3
    end
    object qry_favor_LookAux: TStringField
      DisplayLabel = 'Aux'
      FieldKind = fkLookup
      FieldName = 'LookAux'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_AUX'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 3
      Lookup = True
    end
    object qry_favor_LookCtcontabil: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtcontabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_favor_look_nm_natureza: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_natureza'
      LookupDataSet = qry_cd_recol_ir_
      LookupKeyFields = 'CD_RECOL'
      LookupResultField = 'NM_NATUREZA'
      KeyFields = 'CD_RECOL'
      Size = 40
      Lookup = True
    end
    object qry_favor_NR_INSS: TStringField
      FieldName = 'NR_INSS'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 11
    end
    object qry_favor_look_tp_pessoa: TStringField
      FieldKind = fkLookup
      FieldName = 'look_tp_pessoa'
      LookupDataSet = qry_tp_pessoa_
      LookupKeyFields = 'CD_TIPO_PESSOA'
      LookupResultField = 'NM_TIPO_PESSOA'
      KeyFields = 'CD_TIPO_PESSOA'
      Size = 30
      Lookup = True
    end
    object qry_favor_IN_TRANSP: TStringField
      FieldName = 'IN_TRANSP'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 1
    end
    object qry_favor_look_transp: TStringField
      FieldKind = fkLookup
      FieldName = 'look_transp'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_TRANSP'
      Size = 3
      Lookup = True
    end
    object qry_favor_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 3
    end
    object qry_favor_NR_AGENCIA: TStringField
      FieldName = 'NR_AGENCIA'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 5
    end
    object qry_favor_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TFAVORECIDO.AP_FAVORECIDO'
      Size = 12
    end
    object qry_favor_NR_DAC: TStringField
      FieldName = 'NR_DAC'
      Origin = 'TFAVORECIDO.END_FAVORECIDO'
      Size = 2
    end
    object qry_favor_END_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
    end
    object qry_favor_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 3
    end
    object qry_favor_LookBanco: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_favor_LookCtContabilRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtContabilRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_favor_ALIQ_IRFF: TFloatField
      FieldName = 'ALIQ_IRFF'
      Origin = 'DBBROKER.TFAVORECIDO.ALIQ_IRFF'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_favor_ALIQ_INSS: TFloatField
      FieldName = 'ALIQ_INSS'
      Origin = 'DBBROKER.TFAVORECIDO.ALIQ_INSS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_favor_ALIQ_PISCOFINS: TFloatField
      FieldName = 'ALIQ_PISCOFINS'
      Origin = 'DBBROKER.TFAVORECIDO.ALIQ_PISCOFINS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_favor_NR_CONTA_CONTABIL: TStringField
      FieldName = 'NR_CONTA_CONTABIL'
      Origin = 'DBBROKER.TFAVORECIDO.NR_CONTA_CONTABIL'
      FixedChar = True
      Size = 40
    end
    object qry_favor_TP_FAVORECIDO: TStringField
      FieldName = 'TP_FAVORECIDO'
      Origin = 'DBBROKER.TFAVORECIDO.TP_FAVORECIDO'
      FixedChar = True
      Size = 1
    end
    object qry_favor_ALIQ_ISS: TFloatField
      FieldName = 'ALIQ_ISS'
      Origin = 'DBBROKER.TFAVORECIDO.ALIQ_ISS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_favor_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TFAVORECIDO.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_favor_IM_EMPRESA: TStringField
      FieldName = 'IM_EMPRESA'
      Origin = 'DBBROKER.TFAVORECIDO.IM_EMPRESA'
      FixedChar = True
    end
    object qry_favor_CD_CT_CONTABIL_REDUZIDA_NOVO: TStringField
      FieldName = 'CD_CT_CONTABIL_REDUZIDA_NOVO'
      Origin = 'DBBROKER.TFAVORECIDO.CD_CT_CONTABIL_REDUZIDA_NOVO'
      FixedChar = True
      Size = 7
    end
  end
  object qry_ult_favor_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(F.CD_FAVORECIDO) ULTIMO'
      'FROM  TFAVORECIDO F')
    Left = 240
    Top = 20
    object qry_ult_favor_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
  end
  object qry_cmd_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 352
    Top = 20
  end
  object qry_ct_contabilRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM   TCONTABIL_PLANO'
      'WHERE  CD_COLIGADA = '#39'01'#39)
    Left = 240
    Top = 77
    object qry_ct_contabilRM_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCONTABIL_PLANO.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabilRM_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCONTABIL_PLANO.CD_CT_CONTABIL'
      Size = 40
    end
  end
  object qry_cd_recol_ir_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCD_RECOL_IR')
    Left = 352
    Top = 77
  end
  object qry_tp_pessoa_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT CD_TIPO_PESSOA, NM_TIPO_PESSOA'
      'FROM TTIPO_PESSOA'
      'WHERE IN_FAVORECIDO = '#39'1'#39)
    Left = 32
    Top = 140
    object qry_tp_pessoa_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Origin = 'TTIPO_PESSOA.CD_TIPO_PESSOA'
      Size = 1
    end
    object qry_tp_pessoa_NM_TIPO_PESSOA: TStringField
      FieldName = 'NM_TIPO_PESSOA'
      Origin = 'TTIPO_PESSOA.NM_TIPO_PESSOA'
      Size = 30
    end
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 446
    Top = 77
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TBANCO')
    Left = 446
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
    object qry_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
    object qry_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NM_BANCO'
      Size = 10
    end
    object qry_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.AP_BANCO'
      Size = 5
    end
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 1
    end
    object qry_banco_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TBANCO.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_banco_IN_FINANCEIRO: TStringField
      FieldName = 'IN_FINANCEIRO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TBANCO.FORMCONT'
      Size = 1
    end
    object qry_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TBANCO.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SISTEMA_CONTABIL'
      'FROM TPARAMETROS')
    Left = 136
    Top = 140
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
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCT_CONTABIL'
      
        'WHERE  CD_ACESSO+CD_AUX = :CD_ACESSO_AUX AND CD_IDENTIFICADOR = ' +
        #39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 240
    Top = 140
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
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX FROM TC' +
        'T_CONTABIL'
      'WHERE CD_IDENTIFICADOR = '#39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 352
    Top = 140
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
      Origin = 'TCT_CONTABIL.CD_ACESSO'
      Size = 1
    end
    object qry_ct_contabil_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCT_CONTABIL.CD_AUX'
      Size = 3
    end
  end
  object qry_favor_contas: TQuery
    BeforeInsert = qry_favor_contasBeforeInsert
    AfterInsert = qry_favor_contasAfterInsert
    AfterEdit = qry_favor_contasAfterEdit
    AfterPost = qry_favor_contasAfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT A.* FROM'
      'TFAVORECIDO_CONTAS A'
      'where'
      '  A.CD_FAVORECIDO =:CD_FAVORECIDO ')
    Left = 40
    Top = 195
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_FAVORECIDO'
        ParamType = ptUnknown
        Size = 6
      end>
    object qry_favor_contasCD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'DBBROKER.TFAVORECIDO_CONTAS.CD_FAVORECIDO'
      FixedChar = True
      Size = 5
    end
    object qry_favor_contasCD_CT_CONTABIL: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TFAVORECIDO_CONTAS.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_favor_contasLookupNM_Contabil: TStringField
      DisplayLabel = 'Nome da Conta'
      FieldKind = fkLookup
      FieldName = 'LookupNM_Contabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_favor_contasCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TFAVORECIDO_CONTAS.CODIGO'
    end
    object qry_favor_contasALIQ_IRFF: TFloatField
      FieldName = 'ALIQ_IRFF'
      Origin = 'DBBROKER.TFAVORECIDO_CONTAS.ALIQ_IRFF'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_favor_contasALIQ_INSS: TFloatField
      FieldName = 'ALIQ_INSS'
      Origin = 'DBBROKER.TFAVORECIDO_CONTAS.ALIQ_INSS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_favor_contasALIQ_ISS: TFloatField
      FieldName = 'ALIQ_ISS'
      Origin = 'DBBROKER.TFAVORECIDO_CONTAS.ALIQ_ISS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_favor_contasALIQ_PISCOFINS: TFloatField
      FieldName = 'ALIQ_PISCOFINS'
      Origin = 'DBBROKER.TFAVORECIDO_CONTAS.ALIQ_PISCOFINS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_favor_contasCD_RATEIO: TStringField
      DisplayLabel = 'C'#243'd. Rateio'
      FieldName = 'CD_RATEIO'
      Origin = 'DBBROKER.TFAVORECIDO_CONTAS.CD_RATEIO'
      FixedChar = True
      Size = 4
    end
  end
  object dts_favor_contas: TDataSource
    DataSet = qry_favor_contas
    Left = 40
    Top = 253
  end
  object qryFavorContasInc: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT B.* FROM'
      'TFAVORECIDO_CONTAS B')
    Left = 168
    Top = 196
    object qryFavorContasIncCD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'DBBROKER.TFAVORECIDO_CONTAS.CD_FAVORECIDO'
      FixedChar = True
      Size = 5
    end
    object qryFavorContasIncCD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TFAVORECIDO_CONTAS.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
  end
  object dtsFavorContasInc: TDataSource
    DataSet = qryFavorContasInc
    Left = 168
    Top = 253
  end
end
