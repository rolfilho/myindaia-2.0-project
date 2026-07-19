object datm_LI_Capa: Tdatm_LI_Capa
  Left = 54
  Top = 86
  Height = 644
  Width = 752
  object ds_li: TDataSource
    DataSet = qry_li_
    Left = 40
    Top = 24
  end
  object qry_li_: TQuery
    BeforeInsert = qry_li_BeforeInsert
    BeforeEdit = qry_li_BeforeEdit
    AfterScroll = qry_li_AfterScroll
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
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_li_DT_REGISTRO_LI: TDateTimeField
      FieldName = 'DT_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_REGISTRO_LI'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
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
      LookupDataSet = qry_emp_nac_
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
    object qry_li_LookFundLegal: TStringField
      FieldName = 'LookFundLegal'
      LookupDataSet = qry_fund_legal_
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CD_FUND_LEGAL'
      Size = 120
      Lookup = True
    end
    object qry_li_LookRegTrib: TStringField
      FieldName = 'LookRegTrib'
      LookupDataSet = qry_reg_trib_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_REGIME_TRIBUTACAO'
      Size = 120
      Lookup = True
    end
    object qry_li_LookAgSecex: TStringField
      FieldName = 'LookAgSecex'
      LookupDataSet = qry_agencia_secex_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_AGENCIA_SECEX'
      Size = 120
      Lookup = True
    end
    object qry_li_LookALADI: TStringField
      FieldName = 'LookALADI'
      LookupDataSet = qry_aladi_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_ACORDO_ALADI'
      Size = 120
      Lookup = True
    end
    object qry_li_LookModPagto: TStringField
      FieldName = 'LookModPagto'
      LookupDataSet = qry_mod_pagto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOD_PAGAMENTO'
      Size = 120
      Lookup = True
    end
    object qry_li_LookInstFinanc: TStringField
      FieldName = 'LookInstFinanc'
      LookupDataSet = qry_inst_financ_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_INSTITUICAO_FINANC'
      Size = 120
      Lookup = True
    end
    object qry_li_LookMotivo: TStringField
      FieldName = 'LookMotivo'
      LookupDataSet = qry_motivo_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOT_SEM_COBERTURA'
      Size = 120
      Lookup = True
    end
    object qry_li_LookMoedaMLE: TStringField
      FieldName = 'LookMoedaMLE'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_MLE'
      Size = 30
      Lookup = True
    end
    object qry_li_LookMoedaFrete: TStringField
      FieldName = 'LookMoedaFrete'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_FRETE'
      Size = 30
      Lookup = True
    end
    object qry_li_LookMoedaSeguro: TStringField
      FieldName = 'LookMoedaSeguro'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_SEGURO'
      Size = 30
      Lookup = True
    end
    object qry_li_LookMoedaFob: TStringField
      FieldName = 'LookMoedaFob'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_FOB'
      Size = 30
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
    Top = 78
  end
  object qry_inst_financ_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TINST_FINANC_INTERNACIONAL')
    Left = 40
    Top = 267
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
  object ds_anuentes: TDataSource
    DataSet = qry_anuentes_
    Left = 40
    Top = 548
  end
  object qry_anuentes_: TQuery
    BeforePost = qry_anuentes_BeforePost
    AfterPost = qry_anuentes_AfterPost
    BeforeDelete = qry_anuentes_BeforeDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM  TPROC_ANUENTES '
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 133
    Top = 548
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
      DisplayWidth = 120
      FieldName = 'LOOK_ORGAO'
      LookupDataSet = qry_orgao_anuentes_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ORGAO'
      Size = 120
      Lookup = True
    end
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TPAIS')
    Left = 133
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
    Left = 133
    Top = 373
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TMOEDA')
    Left = 40
    Top = 373
  end
  object qry_fund_legal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TFUND_LEG_REG_TRIBUT'
      'WHERE CODIGO IN'
      '( SELECT CD_FUND_LEGAL'
      '  FROM TTP_FUND_LEGAL T'
      '  WHERE CD_REGIME_TRIB = :CD_REGIME_TRIB )')
    Params.Data = {010001000E43445F524547494D455F545249420001020030000000}
    Left = 133
    Top = 437
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 133
    Top = 205
  end
  object qry_reg_trib_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TREG_TRIBUTARIO')
    Left = 40
    Top = 437
  end
  object qry_mod_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TMODALID_PAGAMENTO')
    Left = 40
    Top = 493
  end
  object qry_motivo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TMOT_SEM_COBERT_CAMBIAL')
    Left = 133
    Top = 493
  end
  object qry_agencia_secex_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TAB_AGENCIA_SECEX')
    Left = 133
    Top = 267
  end
  object qry_aladi_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TAB_ALADI')
    Left = 40
    Top = 205
  end
  object qry_ult_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_li
    SQL.Strings = (
      'SELECT MAX (NR_SEQUENCIA)  ULTIMO '
      'FROM TREF_CLIENTE'
      'WHERE NR_PROCESSO=:NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 236
    Top = 78
    object qry_ult_ref_cli_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TREF_CLIENTE.NR_SEQUENCIA'
      Size = 2
    end
  end
  object qry_orgao_anuentes_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TORGAO_ANUENTES')
    Left = 236
    Top = 24
  end
  object qry_tp_acordo_tarif_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_ACORDO_TARIF')
    Left = 340
    Top = 140
  end
  object ds_tp_acordo_tarif: TDataSource
    DataSet = qry_tp_acordo_tarif_
    Left = 234
    Top = 140
  end
end
