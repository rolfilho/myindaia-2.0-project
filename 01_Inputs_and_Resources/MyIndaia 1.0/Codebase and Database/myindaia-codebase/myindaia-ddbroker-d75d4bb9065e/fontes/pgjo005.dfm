object datm_LI_Capa: Tdatm_LI_Capa
  Left = 57
  Top = 86
  Height = 580
  Width = 715
  object ds_li: TDataSource
    DataSet = qry_li_
    Left = 40
    Top = 24
  end
  object qry_li_: TQuery
    BeforeInsert = qry_li_BeforeInsert
    BeforeEdit = qry_li_BeforeEdit
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TLICENCA_IMPORTACAO '
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 133
    Top = 24
    object qry_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_li_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'TLICENCA_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 15
    end
    object qry_li_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Origin = 'TLICENCA_IMPORTACAO.NR_ATO_DRAWBACK'
      EditMask = '!9999-99-999999-9;0;_'
      Size = 13
    end
    object qry_li_NR_COMUNICADO_COMPRA: TStringField
      FieldName = 'NR_COMUNICADO_COMPRA'
      Origin = 'TLICENCA_IMPORTACAO.NR_COMUNICADO_COMPRA'
      EditMask = '!9999-99-999999-9;0;_'
      Size = 13
    end
    object qry_li_NR_REGISTRO_LI: TStringField
      FieldName = 'NR_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.NR_REGISTRO_LI'
      EditMask = '!99/9999999-9;0;'
      Size = 10
    end
    object qry_li_NR_PROCESSO_SISCOMEX: TStringField
      FieldName = 'NR_PROCESSO_SISCOMEX'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 8
    end
    object qry_li_CD_MOD_PAGAMENTO: TStringField
      FieldName = 'CD_MOD_PAGAMENTO'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOD_PAGAMENTO'
      Size = 2
    end
    object qry_li_CD_IMPORTADOR: TStringField
      DisplayWidth = 5
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TLICENCA_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_li_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'TLICENCA_IMPORTACAO.CD_ACORDO_ALADI'
      Size = 3
    end
    object qry_li_CD_REGIME_TRIBUTACAO: TStringField
      FieldName = 'CD_REGIME_TRIBUTACAO'
      Origin = 'TLICENCA_IMPORTACAO.CD_REGIME_TRIBUTACAO'
      Size = 1
    end
    object qry_li_CD_FUND_LEGAL: TStringField
      FieldName = 'CD_FUND_LEGAL'
      Origin = 'TLICENCA_IMPORTACAO.CD_FUND_LEGAL'
      Size = 2
    end
    object qry_li_CD_AGENCIA_SECEX: TStringField
      FieldName = 'CD_AGENCIA_SECEX'
      Origin = 'TLICENCA_IMPORTACAO.CD_AGENCIA_SECEX'
      Size = 4
    end
    object qry_li_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TLICENCA_IMPORTACAO.CD_PAIS_PROCEDENCIA'
      Size = 3
    end
    object qry_li_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TLICENCA_IMPORTACAO.CD_INCOTERM'
      Size = 3
    end
    object qry_li_CD_INSTITUICAO_FINANC: TStringField
      FieldName = 'CD_INSTITUICAO_FINANC'
      Origin = 'TLICENCA_IMPORTACAO.CD_INSTITUICAO_FINANC'
      Size = 2
    end
    object qry_li_CD_MOT_SEM_COBERTURA: TStringField
      FieldName = 'CD_MOT_SEM_COBERTURA'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOT_SEM_COBERTURA'
      Size = 2
    end
    object qry_li_CD_CONDICAO_MERC: TStringField
      FieldName = 'CD_CONDICAO_MERC'
      Origin = 'TLICENCA_IMPORTACAO.CD_CONDICAO_MERC'
      Size = 1
    end
    object qry_li_CD_MOEDA_FOB: TStringField
      FieldName = 'CD_MOEDA_FOB'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_FOB'
      Size = 3
    end
    object qry_li_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TLICENCA_IMPORTACAO.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_li_CD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'TLICENCA_IMPORTACAO.CD_URF_ENTRADA'
      Size = 7
    end
    object qry_li_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_li_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_li_DT_PROCESSO_LI: TDateTimeField
      FieldName = 'DT_PROCESSO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_PROCESSO_LI'
      EditMask = '!99/99/9999;1;'
    end
    object qry_li_DT_REGISTRO_LI: TDateTimeField
      FieldName = 'DT_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_REGISTRO_LI'
      EditMask = '!99/99/9999;1;'
    end
    object qry_li_QT_TOTAL_PES_LIQ: TFloatField
      FieldName = 'QT_TOTAL_PES_LIQ'
      Origin = 'TLICENCA_IMPORTACAO.QT_TOTAL_PES_LIQ'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_li_QT_MED_ESTATISTICA: TFloatField
      FieldName = 'QT_MED_ESTATISTICA'
      Origin = 'TLICENCA_IMPORTACAO.QT_MED_ESTATISTICA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_li_TP_CAMBIO: TStringField
      FieldName = 'TP_CAMBIO'
      Origin = 'TLICENCA_IMPORTACAO.TP_CAMBIO'
      Size = 1
    end
    object qry_li_TP_ACORDO_ALADI: TStringField
      FieldName = 'TP_ACORDO_ALADI'
      Origin = 'TLICENCA_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 1
    end
    object qry_li_TX_INFO_COMPLEMENTAR: TMemoField
      FieldName = 'TX_INFO_COMPLEMENTAR'
      Origin = 'TLICENCA_IMPORTACAO.TX_INFO_COMPLEMENTAR'
      BlobType = ftMemo
    end
    object qry_li_VL_FRETE_MOEDA: TFloatField
      FieldName = 'VL_FRETE_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_FRETE_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_li_VL_SEGURO_MOEDA: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_SEGURO_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_li_VL_DESPESA_MOEDA: TFloatField
      FieldName = 'VL_DESPESA_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_DESPESA_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_li_VL_DESCONTO_MOEDA: TFloatField
      FieldName = 'VL_DESCONTO_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_DESCONTO_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_li_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 3
    end
    object qry_li_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Origin = 'TLICENCA_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 1
    end
    object qry_li_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TLICENCA_IMPORTACAO.NR_ATO_DRAWBACK'
      Size = 3
    end
    object qry_li_QT_DIAS_COBERTURA: TIntegerField
      FieldName = 'QT_DIAS_COBERTURA'
      Origin = 'TLICENCA_IMPORTACAO.NR_COMUNICADO_COMPRA'
    end
    object qry_li_VL_TOTAL_MOEDA: TFloatField
      FieldName = 'VL_TOTAL_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.NR_REGISTRO_LI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_li_LookImportador: TStringField
      FieldName = 'LookImportador'
      LookupDataSet = tbl_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Size = 50
      Lookup = True
    end
    object qry_li_LookPaisProc: TStringField
      DisplayLabel = 'País Procedência'
      FieldName = 'LookPaisProc'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_PROCEDENCIA'
      Size = 120
      Lookup = True
    end
    object qry_li_IN_MONTADA: TStringField
      FieldName = 'IN_MONTADA'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 1
    end
    object qry_li_LookURFEntrada: TStringField
      FieldName = 'LookURFEntrada'
      LookupDataSet = qry_urf_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_URF_ENTRADA'
      Size = 120
      Lookup = True
    end
    object qry_li_LookURFDespacho: TStringField
      FieldName = 'LookURFDespacho'
      LookupDataSet = qry_urf_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_URF_DESPACHO'
      Size = 120
      Lookup = True
    end
    object qry_li_LookIncoterm: TStringField
      FieldName = 'LookIncoterm'
      LookupDataSet = qry_incoterm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_INCOTERM'
      Size = 60
      Lookup = True
    end
    object qry_li_LookMoeda: TStringField
      FieldName = 'LookMoeda'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_FOB'
      Size = 120
      Lookup = True
    end
  end
  object qry_ref_cli_: TQuery
    BeforePost = qry_ref_cli_BeforePost
    AfterPost = qry_ref_cli_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM  TREF_CLIENTE WHERE'
      'NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 133
    Top = 78
    object qry_ref_cli_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TREF_CLIENTE.NR_PROCESSO'
      Size = 18
    end
    object qry_ref_cli_NR_SEQUENCIA: TStringField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TREF_CLIENTE.NR_SEQUENCIA'
      Size = 2
    end
    object qry_ref_cli_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
  end
  object ds_taxa_cambio: TDataSource
    DataSet = tbl_taxa_cambio_
    Left = 40
    Top = 140
  end
  object tbl_taxa_cambio_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TCONVERSAO_CAMBIO'
    UpdateMode = upWhereKeyOnly
    Left = 133
    Top = 140
    object tbl_taxa_cambio_Codigo: TStringField
      FieldName = 'Codigo'
      Size = 3
    end
    object tbl_taxa_cambio_Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
    object tbl_taxa_cambio_Taxa_Conversao: TStringField
      FieldName = 'Taxa_Conversao'
      Size = 9
    end
    object tbl_taxa_cambio_Vigencia_Inicio_Taxa: TStringField
      FieldName = 'Vigencia_Inicio_Taxa'
      Size = 10
    end
    object tbl_taxa_cambio_Vigencia_Fim_Taxa: TStringField
      FieldName = 'Vigencia_Fim_Taxa'
      Size = 10
    end
  end
  object ds_ref_cli_: TDataSource
    DataSet = qry_ref_cli_
    Left = 40
    Top = 80
  end
  object tbl_empresa_nac_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    ReadOnly = True
    TableName = 'TEMPRESA_NAC'
    Left = 131
    Top = 206
    object tbl_empresa_nac_CD_EMPRESA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_EMPRESA'
      Size = 5
    end
    object tbl_empresa_nac_AP_EMPRESA: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_nac_NM_EMPRESA: TStringField
      DisplayLabel = 'Razão Social'
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_END_EMPRESA: TStringField
      DisplayLabel = 'Endereço'
      FieldName = 'END_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_END_NUMERO: TStringField
      DisplayLabel = 'Número'
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object tbl_empresa_nac_END_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object tbl_empresa_nac_END_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'END_BAIRRO'
      Size = 30
    end
    object tbl_empresa_nac_END_UF: TStringField
      DisplayLabel = 'UF'
      FieldName = 'END_UF'
      Size = 2
    end
    object tbl_empresa_nac_END_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'END_CEP'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object tbl_empresa_nac_CD_TIPO_PESSOA: TStringField
      DisplayLabel = 'Tipo de Pessoa'
      FieldName = 'CD_TIPO_PESSOA'
      Size = 1
    end
    object tbl_empresa_nac_CGC_EMPRESA: TStringField
      DisplayLabel = 'CGC'
      FieldName = 'CGC_EMPRESA'
      EditMask = '99.999.999\/9999\-99;0;_'
      Size = 14
    end
    object tbl_empresa_nac_CPF_EMPRESA: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CPF_EMPRESA'
      EditMask = '999.999.999\-99;0;_'
      Size = 11
    end
    object tbl_empresa_nac_IE_EMPRESA: TStringField
      DisplayLabel = 'Inscr.Estadual'
      FieldName = 'IE_EMPRESA'
    end
    object tbl_empresa_nac_OUTRO_DOC: TStringField
      DisplayLabel = 'Outro Docto.'
      FieldName = 'OUTRO_DOC'
    end
    object tbl_empresa_nac_CD_TIPO_REF: TStringField
      FieldName = 'CD_TIPO_REF'
      Size = 1
    end
    object tbl_empresa_nac_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Size = 3
    end
    object tbl_empresa_nac_DT_INCLUSAO: TDateTimeField
      DisplayLabel = 'Inclusão'
      FieldName = 'DT_INCLUSAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object tbl_empresa_nac_IN_FATURAMENTO: TStringField
      FieldName = 'IN_FATURAMENTO'
      Size = 1
    end
    object tbl_empresa_nac_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object tbl_empresa_nac_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Size = 1
    end
    object tbl_empresa_nac_IN_EVENTUAL: TStringField
      FieldName = 'IN_EVENTUAL'
      Size = 1
    end
    object tbl_empresa_nac_IN_CLIENTE: TBooleanField
      FieldName = 'IN_CLIENTE'
    end
    object tbl_empresa_nac_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
    end
    object tbl_empresa_nac_IN_EXPORTADOR: TBooleanField
      FieldName = 'IN_EXPORTADOR'
    end
    object tbl_empresa_nac_IN_OUTROS: TBooleanField
      FieldName = 'IN_OUTROS'
    end
    object tbl_empresa_nac_CD_BANCO_IMPOSTOS: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'CD_BANCO_IMPOSTOS'
      Size = 3
    end
    object tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField
      DisplayLabel = 'Agência'
      FieldName = 'NR_AG_BANCO_IMPOSTOS'
      Size = 5
    end
    object tbl_empresa_nac_CD_SDA: TStringField
      FieldName = 'CD_SDA'
      Size = 4
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = tbl_empresa_nac_
    Left = 41
    Top = 206
  end
  object ds_fund_legal_reg_trib: TDataSource
    DataSet = tbl_fund_legal_reg_trib_
    Left = 247
    Top = 83
  end
  object tbl_reg_trib_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TREG_TRIBUTARIO'
    UpdateMode = upWhereKeyOnly
    Left = 337
    Top = 143
    object tbl_reg_trib_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 1
    end
    object tbl_reg_trib_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_reg_trib: TDataSource
    DataSet = tbl_reg_trib_
    Left = 247
    Top = 143
  end
  object ds_mod_pagto: TDataSource
    DataSet = tbl_mod_pagto_
    Left = 247
    Top = 203
  end
  object tbl_mod_pagto_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TMODALID_PAGAMENTO'
    UpdateMode = upWhereKeyOnly
    Left = 337
    Top = 203
    object tbl_mod_pagto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 2
    end
    object tbl_mod_pagto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object tbl_motivo_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TMOT_SEM_COBERT_CAMBIAL'
    UpdateMode = upWhereKeyOnly
    Left = 337
    Top = 267
    object tbl_motivo_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 2
    end
    object tbl_motivo_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_motivo: TDataSource
    DataSet = tbl_motivo_
    Left = 247
    Top = 267
  end
  object qry_inst_financ_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO'
      'FROM TINST_FINANC_INTERNACIONAL TINST_FINANC_INTERNACIONAL'
      'WHERE CODIGO = :CODIGO')
    Params.Data = {0100010006434F4449474F0001020030000000}
    Left = 336
    Top = 379
    object qry_inst_financ_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TINST_FINANC_INTERNACIONAL.CODIGO'
      Size = 2
    end
    object qry_inst_financ_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TINST_FINANC_INTERNACIONAL.DESCRICAO'
      Size = 120
    end
  end
  object ds_inst_financ_: TDataSource
    DataSet = qry_inst_financ_
    Left = 246
    Top = 379
  end
  object ds_agencia_secex: TDataSource
    DataSet = tbl_agencia_secex_
    Left = 240
    Top = 448
  end
  object tbl_agencia_secex_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TAB_AGENCIA_SECEX'
    Left = 344
    Top = 448
    object tbl_agencia_secex_CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 4
    end
    object tbl_agencia_secex_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 120
    end
    object tbl_agencia_secex_CGC_SECEX: TStringField
      FieldName = 'CGC_SECEX'
      Size = 18
    end
  end
  object tbl_fund_legal_reg_trib_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    TableName = 'TFUND_LEG_REG_TRIBUT'
    Left = 384
    Top = 83
    object tbl_fund_legal_reg_trib_Codigo: TStringField
      FieldName = 'Codigo'
      Size = 2
    end
    object tbl_fund_legal_reg_trib_Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
  end
  object ds_ttp_fund_legal: TDataSource
    AutoEdit = False
    DataSet = tbl_ttp_fund_legal_
    Left = 33
    Top = 459
  end
  object tbl_ttp_fund_legal_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_REGIME_TRIB'
    ReadOnly = True
    TableName = 'TTP_FUND_LEGAL'
    UpdateMode = upWhereKeyOnly
    Left = 134
    Top = 459
    object tbl_ttp_fund_legal_CD_REGIME_TRIB: TStringField
      FieldName = 'CD_REGIME_TRIB'
      Required = True
      Size = 1
    end
    object tbl_ttp_fund_legal_CD_FUND_LEGAL: TStringField
      FieldName = 'CD_FUND_LEGAL'
      Required = True
      Size = 2
    end
  end
  object tbl_ttp_acordo_tarif_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TIPO_ACORDO_TAR'
    ReadOnly = True
    TableName = 'TTP_ACORDO_TARIF'
    UpdateMode = upWhereKeyOnly
    Left = 364
    Top = 326
    object tbl_ttp_acordo_tarif_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Required = True
      Size = 1
    end
    object tbl_ttp_acordo_tarif_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object ds_ttp_acordo_tarif: TDataSource
    DataSet = tbl_ttp_acordo_tarif_
    Left = 248
    Top = 326
  end
  object ds_orgao_anuente: TDataSource
    DataSet = tbl_orgao_anuente_
    Left = 496
    Top = 32
  end
  object tbl_orgao_anuente_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TAB_ORGAO_ANUENTES'
    Left = 600
    Top = 32
    object tbl_orgao_anuente_CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 16
    end
    object tbl_orgao_anuente_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object tbl_orgao_anuente_CGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
  end
  object ds_anuentes: TDataSource
    DataSet = qry_anuentes_
    Left = 504
    Top = 112
  end
  object qry_anuentes_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM  TPROC_ANUENTES '
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 600
    Top = 111
    object qry_anuentes_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROC_ANUENTES.NR_PROCESSO'
      Size = 18
    end
    object qry_anuentes_ORGAO: TStringField
      FieldName = 'ORGAO'
      Origin = 'TPROC_ANUENTES.ORGAO'
      Size = 16
    end
    object qry_anuentes_PROCESSO: TStringField
      DisplayWidth = 20
      FieldName = 'PROCESSO'
      Origin = 'TPROC_ANUENTES.PROCESSO'
      Size = 120
    end
    object qry_anuentes_CGC: TStringField
      FieldName = 'CGC'
      Origin = 'TPROC_ANUENTES.CGC'
      Size = 18
    end
    object qry_anuentes_LOOK_ORGAO: TStringField
      FieldName = 'LOOK_ORGAO'
      LookupDataSet = tbl_orgao_anuente_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'NR_PROCESSO'
      Size = 16
      Lookup = True
    end
  end
  object ds_aladi: TDataSource
    DataSet = tbl_aladi_
    Left = 504
    Top = 200
  end
  object tbl_aladi_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TAB_ALADI'
    UpdateMode = upWhereKeyOnly
    Left = 577
    Top = 199
    object tbl_aladi_CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 3
    end
    object tbl_aladi_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TPAIS')
    Left = 128
    Top = 317
  end
  object qry_urf_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TURF')
    Left = 40
    Top = 317
  end
  object qry_incoterm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TINCOTERMS_VENDA')
    Left = 128
    Top = 373
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TMOEDA')
    Left = 39
    Top = 373
  end
end
