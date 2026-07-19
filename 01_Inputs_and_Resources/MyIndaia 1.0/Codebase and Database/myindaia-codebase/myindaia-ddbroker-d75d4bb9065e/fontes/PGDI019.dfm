object datm_DI_Adicao: Tdatm_DI_Adicao
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 485
  Top = 190
  Height = 820
  Width = 1088
  object ds_adicao: TDataSource
    DataSet = qry_adicao_
    Left = 29
    Top = 57
  end
  object ds_ad_ato_legal_ncm: TDataSource
    DataSet = tbl_ad_ato_leg_ncm_
    Left = 708
    Top = 151
  end
  object tbl_ad_ato_leg_ncm_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = tbl_ad_ato_leg_ncm_BeforePost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    Filter = 'CD_ASSUNTO_VINCUL = '#39'1'#39
    Filtered = True
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TATO_VINCULADO'
    UpdateMode = upWhereChanged
    Left = 841
    Top = 151
    object tbl_ad_ato_leg_ncm_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_ad_ato_leg_ncm_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_ato_leg_ncm_CD_ASSUNTO_VINCUL: TStringField
      FieldName = 'CD_ASSUNTO_VINCUL'
      Size = 1
    end
    object tbl_ad_ato_leg_ncm_SG_TIPO_ATO_VINCUL: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'SG_TIPO_ATO_VINCUL'
      Size = 5
    end
    object tbl_ad_ato_leg_ncm_SG_ORG_ATO_VINCUL: TStringField
      DisplayLabel = 'Org'#227'o Emissor'
      FieldName = 'SG_ORG_ATO_VINCUL'
      Size = 6
    end
    object tbl_ad_ato_leg_ncm_DT_ANO_ATO_VINCUL: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'DT_ANO_ATO_VINCUL'
      Size = 4
    end
    object tbl_ad_ato_leg_ncm_NR_ATO_VINCULADO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NR_ATO_VINCULADO'
      Size = 6
    end
    object tbl_ad_ato_leg_ncm_NR_EX_ATO_VINCUL: TStringField
      DisplayLabel = '"EX"'
      FieldName = 'NR_EX_ATO_VINCUL'
      OnChange = tbl_ad_ato_leg_ncm_NR_EX_ATO_VINCULChange
      Size = 3
    end
  end
  object ds_ad_ato_legal_nbm: TDataSource
    DataSet = tbl_ad_ato_legal_nbm_
    Left = 708
    Top = 203
  end
  object tbl_ad_ato_legal_nbm_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = tbl_ad_ato_legal_nbm_BeforePost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    Filter = 'CD_ASSUNTO_VINCUL = '#39'2'#39
    Filtered = True
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TATO_VINCULADO'
    UpdateMode = upWhereChanged
    Left = 841
    Top = 203
    object tbl_ad_ato_legal_nbm_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_ad_ato_legal_nbm_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_ato_legal_nbm_CD_ASSUNTO_VINCUL: TStringField
      FieldName = 'CD_ASSUNTO_VINCUL'
      Size = 1
    end
    object tbl_ad_ato_legal_nbm_SG_TIPO_ATO_VINCUL: TStringField
      FieldName = 'SG_TIPO_ATO_VINCUL'
      Size = 5
    end
    object tbl_ad_ato_legal_nbm_SG_ORG_ATO_VINCUL: TStringField
      FieldName = 'SG_ORG_ATO_VINCUL'
      Size = 6
    end
    object tbl_ad_ato_legal_nbm_DT_ANO_ATO_VINCUL: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'DT_ANO_ATO_VINCUL'
      Size = 4
    end
    object tbl_ad_ato_legal_nbm_NR_ATO_VINCULADO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NR_ATO_VINCULADO'
      Size = 6
    end
    object tbl_ad_ato_legal_nbm_NR_EX_ATO_VINCUL: TStringField
      DisplayLabel = '"EX"'
      FieldName = 'NR_EX_ATO_VINCUL'
      OnChange = tbl_ad_ato_legal_nbm_NR_EX_ATO_VINCULChange
      Size = 3
    end
  end
  object ds_ad_ato_legal_acordo_tar: TDataSource
    DataSet = tbl_ad_ato_legal_acordo_tar_
    Left = 708
    Top = 302
  end
  object tbl_ad_ato_legal_acordo_tar_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = tbl_ad_ato_legal_acordo_tar_BeforePost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    Filter = 'CD_ASSUNTO_VINCUL = '#39'5'#39' OR CD_ASSUNTO_VINCUL = '#39'3'#39
    Filtered = True
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TATO_VINCULADO'
    UpdateMode = upWhereChanged
    Left = 841
    Top = 302
    object tbl_ad_ato_legal_acordo_tar_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_ad_ato_legal_acordo_tar_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_ato_legal_acordo_tar_CD_ASSUNTO_VINCUL: TStringField
      FieldName = 'CD_ASSUNTO_VINCUL'
      Size = 1
    end
    object tbl_ad_ato_legal_acordo_tar_SG_TIPO_ATO_VINCUL: TStringField
      FieldName = 'SG_TIPO_ATO_VINCUL'
      OnChange = tbl_ad_ato_legal_acordo_tar_SG_TIPO_ATO_VINCULChange
      Size = 5
    end
    object tbl_ad_ato_legal_acordo_tar_SG_ORG_ATO_VINCUL: TStringField
      FieldName = 'SG_ORG_ATO_VINCUL'
      OnChange = tbl_ad_ato_legal_acordo_tar_SG_ORG_ATO_VINCULChange
      Size = 6
    end
    object tbl_ad_ato_legal_acordo_tar_DT_ANO_ATO_VINCUL: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'DT_ANO_ATO_VINCUL'
      OnChange = tbl_ad_ato_legal_acordo_tar_DT_ANO_ATO_VINCULChange
      Size = 4
    end
    object tbl_ad_ato_legal_acordo_tar_NR_ATO_VINCULADO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NR_ATO_VINCULADO'
      OnChange = tbl_ad_ato_legal_acordo_tar_NR_ATO_VINCULADOChange
      Size = 6
    end
    object tbl_ad_ato_legal_acordo_tar_NR_EX_ATO_VINCUL: TStringField
      DisplayLabel = '"EX"'
      FieldName = 'NR_EX_ATO_VINCUL'
      OnChange = tbl_ad_ato_legal_acordo_tar_NR_EX_ATO_VINCULChange
      Size = 3
    end
  end
  object ds_ad_ato_legal_benef_ipi: TDataSource
    DataSet = tbl_ad_ato_legal_benef_ipi_
    Left = 708
    Top = 103
  end
  object tbl_ad_ato_legal_benef_ipi_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = tbl_ad_ato_legal_benef_ipi_BeforePost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    Filter = 'CD_ASSUNTO_VINCUL = '#39'4'#39
    Filtered = True
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TATO_VINCULADO'
    UpdateMode = upWhereChanged
    Left = 841
    Top = 103
    object tbl_ad_ato_legal_benef_ipi_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_ad_ato_legal_benef_ipi_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_ato_legal_benef_ipi_CD_ASSUNTO_VINCUL: TStringField
      FieldName = 'CD_ASSUNTO_VINCUL'
      Size = 1
    end
    object tbl_ad_ato_legal_benef_ipi_SG_TIPO_ATO_VINCUL: TStringField
      FieldName = 'SG_TIPO_ATO_VINCUL'
      Size = 5
    end
    object tbl_ad_ato_legal_benef_ipi_SG_ORG_ATO_VINCUL: TStringField
      FieldName = 'SG_ORG_ATO_VINCUL'
      Size = 6
    end
    object tbl_ad_ato_legal_benef_ipi_DT_ANO_ATO_VINCUL: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'DT_ANO_ATO_VINCUL'
      Size = 4
    end
    object tbl_ad_ato_legal_benef_ipi_NR_ATO_VINCULADO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NR_ATO_VINCULADO'
      Size = 6
    end
    object tbl_ad_ato_legal_benef_ipi_NR_EX_ATO_VINCUL: TStringField
      DisplayLabel = '"EX"'
      FieldName = 'NR_EX_ATO_VINCUL'
      OnChange = tbl_ad_ato_legal_benef_ipi_NR_EX_ATO_VINCULChange
      Size = 3
    end
  end
  object ds_ad_ato_legal_antidump: TDataSource
    DataSet = tbl_ad_ato_legal_antidump_
    Left = 708
    Top = 250
  end
  object tbl_ad_ato_legal_antidump_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = tbl_ad_ato_legal_antidump_BeforePost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    Filter = 'CD_ASSUNTO_VINCUL = '#39'6'#39
    Filtered = True
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TATO_VINCULADO'
    UpdateMode = upWhereChanged
    Left = 841
    Top = 250
    object tbl_ad_ato_legal_antidump_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_ad_ato_legal_antidump_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_ato_legal_antidump_CD_ASSUNTO_VINCUL: TStringField
      FieldName = 'CD_ASSUNTO_VINCUL'
      Size = 1
    end
    object tbl_ad_ato_legal_antidump_SG_TIPO_ATO_VINCUL: TStringField
      FieldName = 'SG_TIPO_ATO_VINCUL'
      Size = 5
    end
    object tbl_ad_ato_legal_antidump_SG_ORG_ATO_VINCUL: TStringField
      FieldName = 'SG_ORG_ATO_VINCUL'
      Size = 6
    end
    object tbl_ad_ato_legal_antidump_DT_ANO_ATO_VINCUL: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'DT_ANO_ATO_VINCUL'
      Size = 4
    end
    object tbl_ad_ato_legal_antidump_NR_ATO_VINCULADO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NR_ATO_VINCULADO'
      Size = 6
    end
    object tbl_ad_ato_legal_antidump_NR_EX_ATO_VINCUL: TStringField
      DisplayLabel = '"EX"'
      FieldName = 'NR_EX_ATO_VINCUL'
      OnChange = tbl_ad_ato_legal_antidump_NR_EX_ATO_VINCULChange
      Size = 3
    end
  end
  object ds_ad_destaque_ncm: TDataSource
    DataSet = tbl_ad_destaque_ncm_
    Left = 288
    Top = 151
  end
  object tbl_ad_destaque_ncm_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = tbl_ad_destaque_ncm_BeforePost
    AfterPost = tbl_ad_destaque_ncm_AfterPost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TDESTAQUE_NCM'
    UpdateMode = upWhereChanged
    Left = 380
    Top = 151
    object tbl_ad_destaque_ncm_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_ad_destaque_ncm_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_destaque_ncm_NR_DESTAQUE_NCM: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NR_DESTAQUE_NCM'
      Size = 3
    end
    object tbl_ad_destaque_ncm_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
    end
  end
  object ds_ad_docto_vinc: TDataSource
    DataSet = tbl_ad_docto_vinc_
    Left = 288
    Top = 203
  end
  object tbl_ad_docto_vinc_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = tbl_ad_docto_vinc_BeforePost
    AfterPost = tbl_ad_docto_vinc_AfterPost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TDOCUMENTO_VINCULADO'
    UpdateMode = upWhereChanged
    Left = 380
    Top = 203
    object tbl_ad_docto_vinc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_ad_docto_vinc_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_docto_vinc_CD_TIPO_DCTO_VINC: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'CD_TIPO_DCTO_VINC'
      Size = 1
    end
    object tbl_ad_docto_vinc_NR_DCTO_VINCULADO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NR_DCTO_VINCULADO'
      Size = 15
    end
    object tbl_ad_docto_vinc_Look_tp_docto_vinc: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkLookup
      FieldName = 'Look_tp_docto_vinc'
      LookupDataSet = tbl_tp_doc_vinc_
      LookupKeyFields = 'CD_TIPO_DOCTO_VINC'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_TIPO_DCTO_VINC'
      Size = 10
      Lookup = True
    end
    object tbl_ad_docto_vinc_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
    end
  end
  object dsq_ad_cambio_pg_antecip: TDataSource
    DataSet = qry_ad_cambio_pg_antec_
    Left = 492
    Top = 352
  end
  object dsq_ad_cambio_pg_avista: TDataSource
    DataSet = qry_ad_cambio_pg_avista_
    Left = 492
    Top = 450
  end
  object ds_ad_cambio_parc_var: TDataSource
    DataSet = tbl_ad_cambio_parc_var_
    Left = 492
    Top = 403
  end
  object tbl_ad_cambio_parc_var_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = tbl_ad_cambio_parc_var_BeforePost
    AfterPost = tbl_ad_cambio_parc_var_AfterPost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TPAGAMENTO_PREVISTO'
    UpdateMode = upWhereChanged
    Left = 592
    Top = 403
    object tbl_ad_cambio_parc_var_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_ad_cambio_parc_var_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_cambio_parc_var_DT_PREV_PGTO_360: TStringField
      DisplayLabel = 'M'#234's/Ano'
      FieldName = 'DT_PREV_PGTO_360'
      EditMask = '!99/9999;0; '
      Size = 6
    end
    object tbl_ad_cambio_parc_var_VL_PREV_PGTO_360: TFloatField
      DisplayLabel = 'Valor da Parcela'
      FieldName = 'VL_PREV_PGTO_360'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      currency = True
    end
    object tbl_ad_cambio_parc_var_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
    end
  end
  object ds_ad_acrescimos: TDataSource
    DataSet = tbl_ad_acrescimos_
    Left = 288
    Top = 403
  end
  object tbl_ad_acrescimos_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    AfterPost = tbl_ad_acrescimos_AfterPost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TACRESCIMO_VALORACAO'
    UpdateMode = upWhereChanged
    Left = 380
    Top = 403
    object tbl_ad_acrescimos_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_ad_acrescimos_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_acrescimos_CD_MET_ACRES_VALOR: TStringField
      FieldName = 'CD_MET_ACRES_VALOR'
      Size = 3
    end
    object tbl_ad_acrescimos_VL_ACRESCIMO_MOEDA: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Valor na Moeda'
      FieldName = 'VL_ACRESCIMO_MOEDA'
      OnChange = tbl_ad_acrescimos_VL_ACRESCIMO_MOEDAChange
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_acrescimos_CD_MD_NEGOC_ACRES: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'CD_MD_NEGOC_ACRES'
      Size = 3
    end
    object tbl_ad_acrescimos_VL_ACRESCIMO_MN: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Valor em Real'
      FieldName = 'VL_ACRESCIMO_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_acrescimos_Look_nm_acrescimo: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'Look_nm_acrescimo'
      LookupDataSet = tbl_tp_acres_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MET_ACRES_VALOR'
      Size = 40
      Lookup = True
    end
  end
  object ds_ad_deducoes: TDataSource
    DataSet = tbl_ad_deducoes_
    Left = 288
    Top = 450
  end
  object tbl_ad_deducoes_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    AfterPost = tbl_ad_deducoes_AfterPost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TDEDUCAO_VALORACAO'
    UpdateMode = upWhereKeyOnly
    Left = 837
    Top = 641
    object tbl_ad_deducoes_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_ad_deducoes_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_deducoes_CD_MET_DEDUC_VALOR: TStringField
      FieldName = 'CD_MET_DEDUC_VALOR'
      Size = 3
    end
    object tbl_ad_deducoes_VL_DEDUCAO_MNEG: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Valor na Moeda'
      FieldName = 'VL_DEDUCAO_MNEG'
      OnChange = tbl_ad_deducoes_VL_DEDUCAO_MNEGChange
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_deducoes_CD_MD_NEGOC_DEDUC: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'CD_MD_NEGOC_DEDUC'
      Size = 3
    end
    object tbl_ad_deducoes_VL_DEDUCAO_MN: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Valor em Real'
      FieldName = 'VL_DEDUCAO_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_deducoes_Look_nm_deducao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'Look_nm_deducao'
      LookupDataSet = tbl_tp_dedu_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MET_DEDUC_VALOR'
      Size = 40
      Lookup = True
    end
  end
  object ds_ad_ii: TDataSource
    DataSet = qry_ad_ii_
    Left = 708
    Top = 352
  end
  object ds_ad_ipi: TDataSource
    DataSet = qry_ad_ipi_
    Left = 708
    Top = 403
  end
  object ds_ad_antidump: TDataSource
    DataSet = qry_ad_antidump_
    Left = 708
    Top = 450
  end
  object tbl_ad_antidump_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = tbl_ad_antidump_BeforePost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    Filter = 'CD_RECEITA_IMPOSTO = '#39'0003'#39
    Filtered = True
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO;CD_RECEITA_IMPOSTO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TRIBUTO'
    UpdateMode = upWhereChanged
    Left = 833
    Top = 547
    object tbl_ad_antidump_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_ad_antidump_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_antidump_CD_RECEITA_IMPOSTO: TStringField
      FieldName = 'CD_RECEITA_IMPOSTO'
      Size = 4
    end
    object tbl_ad_antidump_CD_TIPO_ALIQ_IPT: TStringField
      FieldName = 'CD_TIPO_ALIQ_IPT'
      Size = 1
    end
    object tbl_ad_antidump_VL_BASE_CALC_ADVAL: TFloatField
      FieldName = 'VL_BASE_CALC_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_PC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_VL_CALC_IPT_ADVAL: TFloatField
      FieldName = 'VL_CALC_IPT_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_NM_UN_ALIQ_ESP_IPT: TStringField
      FieldName = 'NM_UN_ALIQ_ESP_IPT'
      Size = 15
    end
    object tbl_ad_antidump_CD_TIPO_RECIPIENTE: TStringField
      FieldName = 'CD_TIPO_RECIPIENTE'
      Size = 2
    end
    object tbl_ad_antidump_QT_ML_RECIPIENTE: TFloatField
      FieldName = 'QT_ML_RECIPIENTE'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_QT_MERC_UN_ALIQ_ES: TFloatField
      FieldName = 'QT_MERC_UN_ALIQ_ES'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_VL_ALIQ_ESPEC_IPT: TFloatField
      FieldName = 'VL_ALIQ_ESPEC_IPT'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_VL_CALC_IPT_ESPEC: TFloatField
      FieldName = 'VL_CALC_IPT_ESPEC'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_CD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      Size = 1
    end
    object tbl_ad_antidump_PC_ALIQ_REDUZIDA: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_PC_REDUCAO_IPT_BLI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_BLI'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_PC_ALIQ_ACOR_TARIF: TFloatField
      FieldName = 'PC_ALIQ_ACOR_TARIF'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_VL_CALC_II_AC_TARI: TFloatField
      FieldName = 'VL_CALC_II_AC_TARI'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_VL_IMPOSTO_DEVIDO: TFloatField
      FieldName = 'VL_IMPOSTO_DEVIDO'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_VL_IPT_A_RECOLHER: TFloatField
      FieldName = 'VL_IPT_A_RECOLHER'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_antidump_CD_TIPO_DIREITO: TStringField
      FieldName = 'CD_TIPO_DIREITO'
      Size = 1
    end
    object tbl_ad_antidump_NR_NOTA_COMPL_TIPI: TStringField
      FieldName = 'NR_NOTA_COMPL_TIPI'
      Size = 2
    end
  end
  object sp_di_renumera_itens_adicao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_renumera_itens_adicao;1'
    Left = 957
    Top = 57
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
        Name = '@nr_adicao'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField2: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_di_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_calculo;1'
    Left = 957
    Top = 7
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
      end>
  end
  object ds_ad_itens_w: TDataSource
    DataSet = qry_itens_
    Left = 29
    Top = 103
  end
  object ds_di: TDataSource
    DataSet = qry_di_
    OnStateChange = ds_diStateChange
    Left = 29
    Top = 7
  end
  object qry_ad_cambio_pg_antec_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = qry_ad_cambio_pg_antec_BeforePost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    DataSource = ds_adicao
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPAGAMENTO_VINCULADO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = :NR_ADICAO AND'
      'CD_FORMA_PAGAMENTO = '#39'1'#39)
    UpdateMode = upWhereChanged
    Left = 592
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_ad_cambio_pg_antec_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_PROCESSO'
      Size = 18
    end
    object qry_ad_cambio_pg_antec_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_ADICAO'
      Size = 3
    end
    object qry_ad_cambio_pg_antec_CD_FORMA_PAGAMENTO: TStringField
      FieldName = 'CD_FORMA_PAGAMENTO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_FORMA_PAGAMENTO'
      Size = 1
    end
    object qry_ad_cambio_pg_antec_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TPAGAMENTO_VINCULADO.NR_SEQUENCIA'
    end
    object qry_ad_cambio_pg_antec_IN_PAGAMENTO_MN: TStringField
      FieldName = 'IN_PAGAMENTO_MN'
      Origin = 'TPAGAMENTO_VINCULADO.IN_PAGAMENTO_MN'
      Size = 1
    end
    object qry_ad_cambio_pg_antec_CD_BANCO_PAGAMENTO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'CD_BANCO_PAGAMENTO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_BANCO_PAGAMENTO'
      Size = 5
    end
    object qry_ad_cambio_pg_antec_CD_PRACA_PAGAMENTO: TStringField
      DisplayLabel = 'Pra'#231'a'
      FieldName = 'CD_PRACA_PAGAMENTO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_PRACA_PAGAMENTO'
      Size = 4
    end
    object qry_ad_cambio_pg_antec_NR_OP_CAMBIO: TStringField
      DisplayLabel = 'N'#186' Contrato'
      FieldName = 'NR_OP_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_OP_CAMBIO'
      EditMask = '99999999;0;_'
      Size = 8
    end
    object qry_ad_cambio_pg_antec_VL_VINC_MD_CAMBIO: TFloatField
      DisplayLabel = 'Valor Vinculado'
      FieldName = 'VL_VINC_MD_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.VL_VINC_MD_CAMBIO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      currency = True
    end
    object qry_ad_cambio_pg_antec_NR_COMPR_CAMBIO: TStringField
      DisplayLabel = 'Comprador (M.Est.)'
      FieldName = 'NR_COMPR_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_COMPR_CAMBIO'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_ad_cambio_pg_antec_CD_TP_COMPR_CAMBIO: TStringField
      FieldName = 'CD_TP_COMPR_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_TP_COMPR_CAMBIO'
      Size = 1
    end
    object qry_ad_cambio_pg_antec_Look_Moeda_Nac: TStringField
      DisplayLabel = 'M.Nac.'
      FieldKind = fkLookup
      FieldName = 'Look_Moeda_Nac'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_PAGAMENTO_MN'
      Size = 3
      Lookup = True
    end
  end
  object qry_ad_cambio_pg_avista_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = qry_ad_cambio_pg_avista_BeforePost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    DataSource = ds_adicao
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_SEQUENCIA, NR_PROCESSO, NR_ADICAO, CD_FORMA_PAGAMENTO ' +
        ', IN_PAGAMENTO_MN , '
      ' CD_BANCO_PAGAMENTO , '
      ' CD_PRACA_PAGAMENTO , NR_OP_CAMBIO , '
      ' VL_VINC_MD_CAMBIO , NR_COMPR_CAMBIO , '
      ' CD_TP_COMPR_CAMBIO'
      'FROM TPAGAMENTO_VINCULADO (NOLOCK)'
      
        'WHERE NR_PROCESSO = :NR_PROCESSO AND NR_ADICAO = :NR_ADICAO AND ' +
        'CD_FORMA_PAGAMENTO = '#39'2'#39)
    UpdateMode = upWhereChanged
    Left = 592
    Top = 450
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_ad_cambio_pg_avista_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TPAGAMENTO_VINCULADO.NR_SEQUENCIA'
    end
    object qry_ad_cambio_pg_avista_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_PROCESSO'
      Size = 18
    end
    object qry_ad_cambio_pg_avista_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_ADICAO'
      Size = 3
    end
    object qry_ad_cambio_pg_avista_CD_FORMA_PAGAMENTO: TStringField
      FieldName = 'CD_FORMA_PAGAMENTO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_FORMA_PAGAMENTO'
      Size = 1
    end
    object qry_ad_cambio_pg_avista_CD_BANCO_PAGAMENTO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'CD_BANCO_PAGAMENTO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_BANCO_PAGAMENTO'
      Size = 5
    end
    object qry_ad_cambio_pg_avista_CD_PRACA_PAGAMENTO: TStringField
      DisplayLabel = 'Pra'#231'a'
      FieldName = 'CD_PRACA_PAGAMENTO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_PRACA_PAGAMENTO'
      Size = 4
    end
    object qry_ad_cambio_pg_avista_NR_OP_CAMBIO: TStringField
      DisplayLabel = 'N'#186' Contrato'
      FieldName = 'NR_OP_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_OP_CAMBIO'
      EditMask = '99999999;0;_'
      Size = 8
    end
    object qry_ad_cambio_pg_avista_VL_VINC_MD_CAMBIO: TFloatField
      DisplayLabel = 'Valor Vinculado'
      FieldName = 'VL_VINC_MD_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.VL_VINC_MD_CAMBIO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      currency = True
    end
    object qry_ad_cambio_pg_avista_NR_COMPR_CAMBIO: TStringField
      DisplayLabel = 'Comprador (M.Est.)'
      FieldName = 'NR_COMPR_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_COMPR_CAMBIO'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_ad_cambio_pg_avista_CD_TP_COMPR_CAMBIO: TStringField
      FieldName = 'CD_TP_COMPR_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_TP_COMPR_CAMBIO'
      Size = 1
    end
    object qry_ad_cambio_pg_avista_IN_PAGAMENTO_MN: TStringField
      FieldName = 'IN_PAGAMENTO_MN'
      Origin = 'TPAGAMENTO_VINCULADO.IN_PAGAMENTO_MN'
      Size = 1
    end
    object qry_ad_cambio_pg_avista_Look_Moeda_nac: TStringField
      DisplayLabel = 'M.Nac.'
      FieldKind = fkLookup
      FieldName = 'Look_Moeda_nac'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_PAGAMENTO_MN'
      Size = 3
      Lookup = True
    end
  end
  object qry_ncm_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO , UNIDADE_MEDIDA , '
      ' ALIQUOTA_II , DATA_INICIO_VIG_II , '
      ' DATA_FIM_VIG_II , ALIQUOTA_II_MERCOSUL , '
      ' DATA_INICIO_VIG_II_MSUL , '
      ' DATA_FIM_VIG_II_MSUL , ALIQUOTA_IPI , '
      ' DATA_INICIO_VIG_IPI , DATA_FIM_VIG_IPI,'
      ' ALIQUOTA_GATT ,  DATA_INICIO_VIG_GATT,'
      ' DATA_FIM_VIG_GATT'
      'FROM TNCM TNCM (NOLOCK)'
      'WHERE CODIGO = :CODIGO')
    UpdateMode = upWhereChanged
    Left = 380
    Top = 250
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_ncm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNCM.CODIGO'
      Size = 8
    end
    object qry_ncm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TNCM.DESCRICAO'
      Size = 120
    end
    object qry_ncm_UNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'TNCM.UNIDADE_MEDIDA'
      Size = 4
    end
    object qry_ncm_ALIQUOTA_II: TStringField
      FieldName = 'ALIQUOTA_II'
      Origin = 'TNCM.ALIQUOTA_II'
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_II: TStringField
      FieldName = 'DATA_INICIO_VIG_II'
      Origin = 'TNCM.DATA_INICIO_VIG_II'
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_II: TStringField
      FieldName = 'DATA_FIM_VIG_II'
      Origin = 'TNCM.DATA_FIM_VIG_II'
      Size = 10
    end
    object qry_ncm_ALIQUOTA_II_MERCOSUL: TStringField
      FieldName = 'ALIQUOTA_II_MERCOSUL'
      Origin = 'TNCM.ALIQUOTA_II_MERCOSUL'
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_II_MSUL: TStringField
      FieldName = 'DATA_INICIO_VIG_II_MSUL'
      Origin = 'TNCM.DATA_INICIO_VIG_II_MSUL'
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_II_MSUL: TStringField
      FieldName = 'DATA_FIM_VIG_II_MSUL'
      Origin = 'TNCM.DATA_FIM_VIG_II_MSUL'
      Size = 10
    end
    object qry_ncm_ALIQUOTA_IPI: TStringField
      FieldName = 'ALIQUOTA_IPI'
      Origin = 'TNCM.ALIQUOTA_IPI'
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_IPI: TStringField
      FieldName = 'DATA_INICIO_VIG_IPI'
      Origin = 'TNCM.DATA_INICIO_VIG_IPI'
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_IPI: TStringField
      FieldName = 'DATA_FIM_VIG_IPI'
      Origin = 'TNCM.DATA_FIM_VIG_IPI'
      Size = 10
    end
    object qry_ncm_DATA_INICIO_VIG_GATT: TStringField
      FieldName = 'DATA_INICIO_VIG_GATT'
      Origin = 'DBBROKER.TNCM.DATA_INICIO_VIG_GATT'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_GATT: TStringField
      FieldName = 'DATA_FIM_VIG_GATT'
      Origin = 'DBBROKER.TNCM.DATA_FIM_VIG_GATT'
      FixedChar = True
      Size = 10
    end
  end
  object ds_ncm: TDataSource
    DataSet = qry_ncm_
    Left = 288
    Top = 250
  end
  object qry_fund_leg_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT Codigo , Descricao , Reg_Tribut_1 , '
      ' Reg_Tribut_2 , Reg_Tribut_3 , '
      ' Reg_Tribut_4'
      'FROM TFUND_LEG_REG_TRIBUT (NOLOCK)'
      'WHERE Codigo = :CODIGO')
    UpdateMode = upWhereChanged
    Left = 380
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_fund_leg_Codigo: TStringField
      FieldName = 'Codigo'
      Origin = 'TFUND_LEG_REG_TRIBUT.Codigo'
      Size = 2
    end
    object qry_fund_leg_Descricao: TStringField
      FieldName = 'Descricao'
      Origin = 'TFUND_LEG_REG_TRIBUT.Descricao'
      Size = 120
    end
    object qry_fund_leg_Reg_Tribut_1: TStringField
      FieldName = 'Reg_Tribut_1'
      Origin = 'TFUND_LEG_REG_TRIBUT.Reg_Tribut_1'
      Size = 1
    end
    object qry_fund_leg_Reg_Tribut_2: TStringField
      FieldName = 'Reg_Tribut_2'
      Origin = 'TFUND_LEG_REG_TRIBUT.Reg_Tribut_2'
      Size = 1
    end
    object qry_fund_leg_Reg_Tribut_3: TStringField
      FieldName = 'Reg_Tribut_3'
      Origin = 'TFUND_LEG_REG_TRIBUT.Reg_Tribut_3'
      Size = 1
    end
    object qry_fund_leg_Reg_Tribut_4: TStringField
      FieldName = 'Reg_Tribut_4'
      Origin = 'TFUND_LEG_REG_TRIBUT.Reg_Tribut_4'
      Size = 1
    end
  end
  object ds_fund_leg: TDataSource
    DataSet = qry_fund_leg_
    Left = 288
    Top = 7
  end
  object ds_urf_entrada: TDataSource
    DataSet = qry_urf_entrada_
    Left = 288
    Top = 57
  end
  object qry_urf_entrada_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeEdit
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO'
      'FROM TURF (NOLOCK)'
      'WHERE CODIGO = :CODIGO')
    UpdateMode = upWhereChanged
    Left = 380
    Top = 57
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object ds_mot_sem_cobertura: TDataSource
    DataSet = qry_mot_sem_cobertura_
    Left = 492
    Top = 57
  end
  object qry_mot_sem_cobertura_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO'
      'FROM TMOT_SEM_COBERT_CAMBIAL (NOLOCK)'
      'WHERE CODIGO = :CODIGO')
    UpdateMode = upWhereChanged
    Left = 592
    Top = 57
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_mot_sem_cobertura_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TMOT_SEM_COBERT_CAMBIAL.CODIGO'
      Size = 2
    end
    object qry_mot_sem_cobertura_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TMOT_SEM_COBERT_CAMBIAL.DESCRICAO'
      Size = 120
    end
  end
  object ds_mod_pagto: TDataSource
    DataSet = qry_mod_pagto_
    Left = 288
    Top = 103
  end
  object qry_mod_pagto_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO'
      'FROM TMODALID_PAGAMENTO (NOLOCK)'
      'WHERE CODIGO = :CODIGO')
    UpdateMode = upWhereChanged
    Left = 380
    Top = 103
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_mod_pagto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TMODALID_PAGAMENTO.CODIGO'
      Size = 2
    end
    object qry_mod_pagto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TMODALID_PAGAMENTO.DESCRICAO'
      Size = 120
    end
  end
  object qry_atrib_nve_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_NOMENC_NCM , CD_ATRIBUTO_NCM , '
      ' IN_MULTIPLA_ESPECIF , CD_NIVEL_NCM , '
      ' NM_ATRIBUTO'
      'FROM TATRIB_VALORACAO_NVE (NOLOCK)'
      'WHERE CD_NOMENC_NCM = :CD_NCM AND'
      'CD_NIVEL_NCM = :CD_NIVEL')
    UpdateMode = upWhereChanged
    Left = 841
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_NCM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_NIVEL'
        ParamType = ptUnknown
      end>
    object qry_atrib_nve_CD_NOMENC_NCM: TStringField
      FieldName = 'CD_NOMENC_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_NOMENC_NCM'
      Size = 8
    end
    object qry_atrib_nve_CD_ATRIBUTO_NCM: TStringField
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_atrib_nve_IN_MULTIPLA_ESPECIF: TStringField
      FieldName = 'IN_MULTIPLA_ESPECIF'
      Origin = 'TATRIB_VALORACAO_NVE.IN_MULTIPLA_ESPECIF'
      Size = 1
    end
    object qry_atrib_nve_CD_NIVEL_NCM: TStringField
      FieldName = 'CD_NIVEL_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_NIVEL_NCM'
      Size = 3
    end
    object qry_atrib_nve_NM_ATRIBUTO: TStringField
      FieldName = 'NM_ATRIBUTO'
      Origin = 'TATRIB_VALORACAO_NVE.NM_ATRIBUTO'
      Size = 249
    end
  end
  object ds_atrib_nve: TDataSource
    DataSet = qry_atrib_nve_
    Left = 708
    Top = 7
  end
  object ds_espec_nve: TDataSource
    DataSet = qry_espec_nve_
    Left = 708
    Top = 57
  end
  object qry_espec_nve_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_NOMENC_NCM , CD_ATRIBUTO_NCM , '
      ' CD_ESPECIF_NCM , CD_NIVEL_NCM , '
      ' NM_ESPECIF_NCM'
      'FROM TAB_ESPECIF_VALORACAO_NVE (NOLOCK)'
      'WHERE CD_NOMENC_NCM = :CD_NCM AND'
      'CD_NIVEL_NCM = :CD_NIVEL AND '
      'CD_ATRIBUTO_NCM = :CD_ATRIBUTO_NCM')
    UpdateMode = upWhereChanged
    Left = 841
    Top = 57
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_NCM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_NIVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ATRIBUTO_NCM'
        ParamType = ptUnknown
      end>
  end
  object ds_nve: TDataSource
    DataSet = qry_nve_
    OnStateChange = ds_nveStateChange
    Left = 492
    Top = 103
  end
  object qry_nve_: TQuery
    AfterPost = qry_nve_AfterPost
    AfterDelete = qry_nve_AfterDelete
    OnNewRecord = qry_nve_NewRecord
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_ADICAO , '
      ' CD_NIVEL_NVE , CD_ATRIBUTO_NCM , '
      ' CD_ESPECIF_NCM'
      'FROM TVALORACAO_NCM (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND '
      'NR_ADICAO = :NR_ADICAO')
    UpdateMode = upWhereChanged
    Left = 592
    Top = 103
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_nve_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TVALORACAO_NCM.NR_PROCESSO'
      Size = 18
    end
    object qry_nve_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TVALORACAO_NCM.NR_ADICAO'
      Size = 3
    end
    object qry_nve_CD_NIVEL_NVE: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'CD_NIVEL_NVE'
      Origin = 'TVALORACAO_NCM.CD_NIVEL_NVE'
      Size = 3
    end
    object qry_nve_CD_ATRIBUTO_NCM: TStringField
      DisplayLabel = 'Atributo'
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TVALORACAO_NCM.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_nve_CD_ESPECIF_NCM: TStringField
      DisplayLabel = 'Especifica'#231#227'o'
      FieldName = 'CD_ESPECIF_NCM'
      Origin = 'TVALORACAO_NCM.CD_ESPECIF_NCM'
      Size = 4
    end
    object qry_nve_LookNivel: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNivel'
      LookupDataSet = qry_nivel_
      LookupKeyFields = 'CD_NIVEL_NVE'
      LookupResultField = 'NM_NIVEL'
      KeyFields = 'CD_NIVEL_NVE'
      Size = 30
      Lookup = True
    end
    object qry_nve_LookAtributo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAtributo'
      LookupDataSet = qry_atrib_nve_desc_
      LookupKeyFields = 'CD_ATRIBUTO_NCM'
      LookupResultField = 'NM_ATRIBUTO'
      KeyFields = 'CD_ATRIBUTO_NCM'
      Size = 50
      Lookup = True
    end
    object qry_nve_LookEspecif: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEspecif'
      LookupDataSet = qry_espec_nve_
      LookupKeyFields = 'CD_ESPECIF_NCM'
      LookupResultField = 'NM_ESPECIF_NCM'
      KeyFields = 'CD_ESPECIF_NCM'
      Size = 50
      Lookup = True
    end
  end
  object ds_abrangencia_nve: TDataSource
    DataSet = qry_abrangencia_nve_
    Left = 492
    Top = 203
  end
  object ds_atrib_nve_desc: TDataSource
    DataSet = qry_atrib_nve_desc_
    Left = 492
    Top = 250
  end
  object qry_atrib_nve_desc_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    Filter = 'CD_ATRIBUTO_NCM = '#39'2'#39
    SQL.Strings = (
      'SELECT CD_NOMENC_NCM , CD_ATRIBUTO_NCM , '
      ' IN_MULTIPLA_ESPECIF , CD_NIVEL_NCM , '
      ' NM_ATRIBUTO'
      'FROM TATRIB_VALORACAO_NVE (NOLOCK)'
      'WHERE CD_NOMENC_NCM = :CD_NCM AND'
      'CD_NIVEL_NCM = :CD_NIVEL AND'
      'CD_ATRIBUTO_NCM = :CD_ATRIBUTO')
    UpdateMode = upWhereChanged
    Left = 592
    Top = 250
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_NCM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_NIVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ATRIBUTO'
        ParamType = ptUnknown
      end>
    object StringField3: TStringField
      FieldName = 'CD_NOMENC_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_NOMENC_NCM'
      Size = 8
    end
    object StringField4: TStringField
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object StringField5: TStringField
      FieldName = 'IN_MULTIPLA_ESPECIF'
      Origin = 'TATRIB_VALORACAO_NVE.IN_MULTIPLA_ESPECIF'
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'CD_NIVEL_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_NIVEL_NCM'
      Size = 3
    end
    object StringField7: TStringField
      FieldName = 'NM_ATRIBUTO'
      Origin = 'TATRIB_VALORACAO_NVE.NM_ATRIBUTO'
      Size = 249
    end
  end
  object ds_espec_nve_desc: TDataSource
    DataSet = qry_espec_nve_desc_
    Left = 492
    Top = 302
  end
  object qry_espec_nve_desc_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_NOMENC_NCM , CD_ATRIBUTO_NCM , '
      ' CD_ESPECIF_NCM , CD_NIVEL_NCM , '
      ' NM_ESPECIF_NCM'
      'FROM TAB_ESPECIF_VALORACAO_NVE (NOLOCK)'
      'WHERE CD_NOMENC_NCM = :CD_NCM AND'
      'CD_NIVEL_NCM = :CD_NIVEL AND '
      'CD_ATRIBUTO_NCM = :CD_ATRIBUTO AND'
      'CD_ESPECIF_NCM = :CD_ESPECIF')
    UpdateMode = upWhereChanged
    Left = 592
    Top = 302
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_NCM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_NIVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ATRIBUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ESPECIF'
        ParamType = ptUnknown
      end>
    object qry_espec_nve_desc_CD_NOMENC_NCM: TStringField
      FieldName = 'CD_NOMENC_NCM'
      Origin = 'TESPECIF_VALORACAO_NVE.CD_NOMENC_NCM'
      Size = 8
    end
    object qry_espec_nve_desc_CD_ATRIBUTO_NCM: TStringField
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TESPECIF_VALORACAO_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_espec_nve_desc_CD_ESPECIF_NCM: TStringField
      FieldName = 'CD_ESPECIF_NCM'
      Origin = 'TESPECIF_VALORACAO_NVE.CD_ESPECIF_NCM'
      Size = 4
    end
    object qry_espec_nve_desc_CD_NIVEL_NCM: TStringField
      FieldName = 'CD_NIVEL_NCM'
      Origin = 'TESPECIF_VALORACAO_NVE.CD_NIVEL_NCM'
      Size = 3
    end
    object qry_espec_nve_desc_NM_ESPECIF_NCM: TStringField
      FieldName = 'NM_ESPECIF_NCM'
      Origin = 'TESPECIF_VALORACAO_NVE.NM_ESPECIF_NCM'
      Size = 249
    end
  end
  object ds_empresa_est: TDataSource
    DataSet = tbl_empresa_est_
    Left = 288
    Top = 302
  end
  object tbl_empresa_est_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_EST'
    UpdateMode = upWhereChanged
    Left = 380
    Top = 302
    object tbl_empresa_est_CD_EMPRESA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EMPRESA'
      Required = True
      Size = 5
    end
    object tbl_empresa_est_AP_EMPRESA: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_est_NM_EMPRESA: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'NM_EMPRESA'
      Size = 60
    end
    object tbl_empresa_est_END_EMPRESA: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'END_EMPRESA'
      Size = 60
    end
    object tbl_empresa_est_END_NUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object tbl_empresa_est_END_COMPL: TStringField
      DisplayLabel = 'Compl.Endere'#231'o'
      FieldName = 'END_COMPL'
      Size = 41
    end
    object tbl_empresa_est_END_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object tbl_empresa_est_END_ESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'END_ESTADO'
      Size = 30
    end
    object tbl_empresa_est_CD_PAIS: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'CD_PAIS'
      Size = 3
    end
    object tbl_empresa_est_NR_TELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'NR_TELEFONE'
      Size = 15
    end
    object tbl_empresa_est_NR_FAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'NR_FAX'
      Size = 15
    end
    object tbl_empresa_est_DT_INCLUSAO: TDateTimeField
      DisplayLabel = 'Inclus'#227'o'
      FieldName = 'DT_INCLUSAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object ds_pais: TDataSource
    DataSet = tbl_pais_
    Left = 492
    Top = 498
  end
  object tbl_pais_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TPAIS'
    UpdateMode = upWhereChanged
    Left = 592
    Top = 498
    object tbl_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object tbl_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_local_embarque: TDataSource
    DataSet = tbl_local_embarque_
    Left = 708
    Top = 547
  end
  object tbl_local_embarque_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TLOCAL_EMBARQUE'
    UpdateMode = upWhereChanged
    Left = 953
    Top = 594
    object tbl_local_embarque_CODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 4
    end
    object tbl_local_embarque_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object ds_reg_trib: TDataSource
    DataSet = tbl_reg_trib_
    Left = 29
    Top = 403
  end
  object tbl_reg_trib_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TREG_TRIBUTARIO'
    UpdateMode = upWhereChanged
    Left = 116
    Top = 403
  end
  object ds_motivo: TDataSource
    DataSet = tbl_motivo_
    Left = 288
    Top = 547
  end
  object tbl_motivo_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TMOT_SEM_COBERT_CAMBIAL'
    UpdateMode = upWhereChanged
    Left = 380
    Top = 450
    object tbl_motivo_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 2
    end
    object tbl_motivo_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_tp_doc_vinc: TDataSource
    DataSet = tbl_tp_doc_vinc_
    Left = 121
    Top = 540
  end
  object tbl_tp_doc_vinc_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TIPO_DOCTO_VINC'
    ReadOnly = True
    TableName = 'TTP_DOCTO_VINC'
    UpdateMode = upWhereChanged
    Left = 592
    Top = 547
    object tbl_tp_doc_vinc_CD_TIPO_DOCTO_VINC: TStringField
      FieldName = 'CD_TIPO_DOCTO_VINC'
      Required = True
      Size = 1
    end
    object tbl_tp_doc_vinc_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object ds_metodo_valoracao: TDataSource
    DataSet = tbl_metodo_valoracao_
    Left = 957
    Top = 151
  end
  object tbl_metodo_valoracao_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TMETODO_VALOR_ADUANEIRA'
    UpdateMode = upWhereChanged
    Left = 957
    Top = 641
  end
  object ds_tp_acres: TDataSource
    DataSet = tbl_tp_acres_
    Left = 29
    Top = 498
  end
  object tbl_tp_acres_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TAB_ACRESCIMO'
    UpdateMode = upWhereChanged
    Left = 380
    Top = 547
    object tbl_tp_acres_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object tbl_tp_acres_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 250
    end
    object tbl_tp_acres_DESCRICAO_REDUZIDA: TStringField
      FieldName = 'DESCRICAO_REDUZIDA'
      Size = 55
    end
  end
  object tbl_tp_dedu_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TAB_DEDUCAO'
    UpdateMode = upWhereChanged
    Left = 116
    Top = 450
    object tbl_tp_dedu_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object tbl_tp_dedu_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 250
    end
    object tbl_tp_dedu_DESCRICAO_REDUZIDA: TStringField
      FieldName = 'DESCRICAO_REDUZIDA'
      Size = 55
    end
  end
  object ds_tp_dedu: TDataSource
    DataSet = tbl_tp_dedu_
    Left = 29
    Top = 547
  end
  object ds_moeda: TDataSource
    DataSet = tbl_moeda_
    Left = 708
    Top = 594
  end
  object tbl_moeda_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TMOEDA'
    UpdateMode = upWhereChanged
    Left = 959
    Top = 257
  end
  object ds_tp_vinc_expo_impo: TDataSource
    DataSet = tbl_tp_vinc_expo_impo_
    Left = 492
    Top = 547
  end
  object tbl_tp_vinc_expo_impo_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_VINC_EXPO_IMPO'
    ReadOnly = True
    TableName = 'TTP_VINC_EXPO_IMPO'
    UpdateMode = upWhereChanged
    Left = 592
    Top = 594
    object tbl_tp_vinc_expo_impo_CD_VINC_EXPO_IMPO: TStringField
      FieldName = 'CD_VINC_EXPO_IMPO'
      Required = True
      Size = 1
    end
    object tbl_tp_vinc_expo_impo_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object ds_tp_ato_legal: TDataSource
    DataSet = tbl_tp_ato_legal_
    Left = 288
    Top = 498
  end
  object tbl_tp_ato_legal_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TTP_ATO_LEGAL'
    UpdateMode = upWhereChanged
    Left = 380
    Top = 498
    object tbl_tp_ato_legal_Codigo: TStringField
      FieldName = 'Codigo'
      Size = 10
    end
    object tbl_tp_ato_legal_Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
  end
  object ds_orgao_emissor: TDataSource
    DataSet = tbl_orgao_emissor_
    Left = 29
    Top = 352
  end
  object tbl_orgao_emissor_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TORGAO_EMISS_ATO_LEGAL'
    UpdateMode = upWhereChanged
    Left = 116
    Top = 352
    object tbl_orgao_emissor_Codigo: TStringField
      FieldName = 'Codigo'
      Size = 10
    end
    object tbl_orgao_emissor_Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
  end
  object ds_unid_med: TDataSource
    DataSet = tbl_unid_med_
    Left = 708
    Top = 498
  end
  object tbl_unid_med_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TUNID_MEDIDA'
    UpdateMode = upWhereChanged
    Left = 833
    Top = 498
    object tbl_unid_med_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 2
    end
    object tbl_unid_med_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_via_transporte: TDataSource
    AutoEdit = False
    DataSet = tbl_via_transporte_
    Left = 29
    Top = 302
  end
  object tbl_via_transporte_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_VIA_TRANSPORTE'
    ReadOnly = True
    TableName = 'TVIA_TRANSPORTE'
    UpdateMode = upWhereChanged
    Left = 116
    Top = 302
    object tbl_via_transporte_CD_VIA_TRANSPORTE: TStringField
      DisplayWidth = 2
      FieldName = 'CD_VIA_TRANSPORTE'
      Size = 2
    end
    object tbl_via_transporte_NM_VIA_TRANSPORTE: TStringField
      DisplayLabel = 'Via de Transporte'
      FieldName = 'NM_VIA_TRANSPORTE'
    end
  end
  object ds_taxa_cambio: TDataSource
    DataSet = tbl_taxa_cambio_
    Left = 29
    Top = 203
  end
  object tbl_taxa_cambio_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TCONVERSAO_CAMBIO'
    UpdateMode = upWhereChanged
    Left = 116
    Top = 203
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
  object ds_acordo_tarif: TDataSource
    DataSet = tbl_acordo_tarif_
    Left = 288
    Top = 594
  end
  object tbl_acordo_tarif_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TIPO_ACORDO_TAR'
    ReadOnly = True
    TableName = 'TTP_ACORDO_TARIF'
    UpdateMode = upWhereChanged
    Left = 380
    Top = 594
    object tbl_acordo_tarif_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Required = True
      Size = 1
    end
    object tbl_acordo_tarif_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 288
    Top = 352
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    UpdateMode = upWhereChanged
    Left = 380
    Top = 352
  end
  object qry_inst_financ_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO'
      'FROM TINST_FINANC_INTERNACIONAL (NOLOCK)'
      'WHERE CODIGO = :CODIGO')
    UpdateMode = upWhereChanged
    Left = 592
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
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
  object dsq_inst_financ_: TDataSource
    DataSet = qry_inst_financ_
    Left = 492
    Top = 7
  end
  object sp_exclui_adicao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exclui_adicao'
    Left = 709
    Top = 641
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
        Name = '@nr_adicao'
        ParamType = ptInput
      end>
    object StringField8: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField9: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object ds_tp_recipiente: TDataSource
    DataSet = tbl_tp_recipiente_
    Left = 29
    Top = 250
  end
  object tbl_tp_recipiente_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TRECIPIENTE'
    UpdateMode = upWhereChanged
    Left = 116
    Top = 250
    object tbl_tp_recipiente_Codigo: TStringField
      FieldName = 'Codigo'
      Size = 2
    end
    object tbl_tp_recipiente_Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
  end
  object ds_assoc_acresc: TDataSource
    DataSet = qry_assoc_acresc_
    Left = 29
    Top = 450
  end
  object qry_assoc_acresc_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COD_INCOTERMS , COD_ACR_DECR'
      'FROM TAB_ASSOCIACAO_ACRESCIMO (NOLOCK)'
      'WHERE COD_INCOTERMS = :COD_INCOTERMS')
    UpdateMode = upWhereChanged
    Left = 116
    Top = 498
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_INCOTERMS'
        ParamType = ptUnknown
      end>
    object qry_assoc_acresc_COD_INCOTERMS: TStringField
      FieldName = 'COD_INCOTERMS'
      Origin = 'TAB_ASSOCIACAO_ACRESCIMO.COD_INCOTERMS'
      Size = 3
    end
    object qry_assoc_acresc_COD_ACR_DECR: TStringField
      FieldName = 'COD_ACR_DECR'
      Origin = 'TAB_ASSOCIACAO_ACRESCIMO.COD_ACR_DECR'
      Size = 3
    end
    object qry_assoc_acresc_look_Descricao: TStringField
      FieldKind = fkLookup
      FieldName = 'look_Descricao'
      LookupDataSet = tbl_tp_acres_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'COD_ACR_DECR'
      Size = 40
      Lookup = True
    end
  end
  object ds_assoc_ded: TDataSource
    DataSet = qry_assoc_ded_
    Left = 29
    Top = 594
  end
  object qry_assoc_ded_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COD_INCOTERMS , COD_ACR_DECR'
      'FROM TAB_ASSOCIACAO_DEDUCAO (NOLOCK)'
      'WHERE COD_INCOTERMS =:COD_INCOTERMS ')
    UpdateMode = upWhereChanged
    Left = 116
    Top = 594
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_INCOTERMS'
        ParamType = ptUnknown
      end>
    object qry_assoc_ded_COD_INCOTERMS: TStringField
      FieldName = 'COD_INCOTERMS'
      Origin = 'TAB_ASSOCIACAO_DEDUCAO.COD_INCOTERMS'
      Size = 3
    end
    object qry_assoc_ded_COD_ACR_DECR: TStringField
      FieldName = 'COD_ACR_DECR'
      Origin = 'TAB_ASSOCIACAO_DEDUCAO.COD_ACR_DECR'
      Size = 3
    end
    object qry_assoc_ded_look_Descricao: TStringField
      FieldKind = fkLookup
      FieldName = 'look_Descricao'
      LookupDataSet = tbl_tp_dedu_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'COD_ACR_DECR'
      Size = 40
      Lookup = True
    end
  end
  object ds_nve_pesq: TDataSource
    Left = 492
    Top = 151
  end
  object qry_nve_pesq_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_ADICAO , '
      ' CD_ABRANGENCIA_NCM , CD_ATRIBUTO_NCM , '
      ' CD_ESPECIF_NCM'
      'FROM TVALORACAO_NCM (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND '
      'NR_ADICAO = :NR_ADICAO AND'
      'CD_ABRANGENCIA_NCM = :CD_ABRANGENCIA_NCM AND'
      'CD_ATRIBUTO_NCM = :CD_ATRIBUTO_NCM AND'
      'CD_ESPECIF_NCM = :CD_ESPECIF_NCM')
    UpdateMode = upWhereChanged
    Left = 592
    Top = 151
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ABRANGENCIA_NCM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ATRIBUTO_NCM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ESPECIF_NCM'
        ParamType = ptUnknown
      end>
  end
  object ds_incoterms: TDataSource
    DataSet = tbl_incoterms_
    Left = 29
    Top = 151
  end
  object tbl_incoterms_: TTable
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TINCOTERMS_VENDA'
    UpdateMode = upWhereChanged
    Left = 116
    Top = 151
  end
  object tbl_tributacao_icms: TTable
    DatabaseName = 'DBBROKER'
    ReadOnly = True
    TableName = 'TTRIBUTACAO_ICMS'
    UpdateMode = upWhereChanged
    Left = 957
    Top = 302
    object tbl_tributacao_icmsCD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      Required = True
      Size = 1
    end
    object tbl_tributacao_icmsNM_TRIBUTACAO_ICMS: TStringField
      FieldName = 'NM_TRIBUTACAO_ICMS'
      Required = True
    end
  end
  object qry_di_: TQuery
    CachedUpdates = True
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    AfterPost = qry_di_AfterPost
    BeforeDelete = qry_adicao_BeforeDelete
    AfterDelete = qry_di_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, QT_ADICOES, CD_MOEDA_MLE,'
      'DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO,'
      'CD_URF_DESPACHO, CD_RECINTO_ALFAND,'
      'CD_TIPO_DECLARACAO, DT_REGISTRO_DI,'
      'IN_MOEDA_UNICA, IN_FMA, DT_PAGAMENTO_DARF'
      'FROM TDECLARACAO_IMPORTACAO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateMode = upWhereChanged
    UpdateObject = upd_di
    Left = 116
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_di_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
      Origin = 'TDECLARACAO_IMPORTACAO.QT_ADICOES'
      DisplayFormat = '000'
    end
    object qry_di_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_di_DT_ULTIMA_ALTERACAO: TDateTimeField
      FieldName = 'DT_ULTIMA_ALTERACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_ULTIMA_ALTERACAO'
    end
    object qry_di_IN_RISC_ATUALIZADO: TStringField
      FieldName = 'IN_RISC_ATUALIZADO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_RISC_ATUALIZADO'
      Size = 1
    end
    object qry_di_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_di_CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_RECINTO_ALFAND'
      Size = 7
    end
    object qry_di_CD_TIPO_DECLARACAO: TStringField
      FieldName = 'CD_TIPO_DECLARACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_DECLARACAO'
      Size = 2
    end
    object qry_di_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 8
    end
    object qry_di_IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_IN_FMA: TStringField
      FieldName = 'IN_FMA'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.IN_FMA'
      OnChange = qry_di_IN_FMAChange
      FixedChar = True
      Size = 1
    end
    object qry_di_DT_PAGAMENTO_DARF: TDateTimeField
      FieldName = 'DT_PAGAMENTO_DARF'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.DT_PAGAMENTO_DARF'
    end
  end
  object qry_adicao_: TQuery
    CachedUpdates = True
    AfterOpen = qry_adicao_AfterOpen
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    AfterPost = qry_adicao_AfterPost
    BeforeDelete = qry_adicao_BeforeDelete
    AfterScroll = qry_adicao_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT '
      '  NR_PROCESSO'
      ', NR_ADICAO'
      ', CD_ACORDO_ALADI'
      ', CD_AGENC_AGENT_IMP'
      ', CD_APLICACAO_MERC'
      ', CD_AUSENCIA_FABRIC'
      ', CD_BANC_AGENTE_IMP'
      ', CD_COBERT_CAMBIAL'
      ', CD_FABRICANTE'
      ', CD_FORNECEDOR'
      ', CD_FUND_LEG_REGIME'
      ', CD_INCOTERMS_VENDA'
      ', CD_LOC_COND_VENDA'
      ', CD_MD_FRETE_MERC'
      ', CD_MERC_NALADI_NCC'
      ', CD_MERC_NALADI_SH'
      ', CD_MERC_NBM_SH'
      ', CD_NCM_SH'
      ', CD_MERCADORIA_NCM'
      ', CD_METOD_VALORACAO'
      ', CD_MODALIDADE_PGTO'
      ', CD_MOEDA_NEGOCIADA'
      ', CD_MOEDA_SEG_MERC'
      ', CD_MOEDAS_DESPESAS'
      ', CD_MOTIVO_ADM_TEMP'
      ', CD_MOTIVO_SEM_COB'
      ', CD_ORGAO_FIN_INTER'
      ', CD_PAIS_AQUIS_MERC'
      ', CD_PAIS_ORIG_MERC'
      ', CD_PAIS_PROC_MERC'
      ', CD_PERIOD_PGTO_360'
      ', CD_REGIME_TRIBUTAR'
      ', CD_TAXA_JUROS'
      ', CD_TIPO_ACORDO_TAR'
      ', CD_TIPO_AGENTE_IMP'
      ', CD_URF_ENTR_MERC'
      ', CD_VIA_TRANSPORTE'
      ', CD_VINC_IMPO_EXPO'
      ', ED_CIDAD_FABRIC'
      ', ED_CIDAD_FORN_ESTR'
      ', ED_COMPL_FABRIC'
      ', ED_COMPL_FORN_ESTR'
      ', ED_ESTAD_FORN_ESTR'
      ', ED_ESTADO_FABRIC'
      ', ED_LOGR_FABRIC'
      ', ED_LOGR_FORN_ESTR'
      ', ED_NR_FABRIC'
      ', ED_NR_FORN_ESTR'
      ', IN_BEM_ENCOMENDA'
      ', IN_IPI_NAO_TRIBUT'
      ', IN_JUROS_ATE_360'
      ', IN_MATERIAL_USADO'
      ', IN_MULTIMODAL'
      ', IN_PGTO_VARIAV_360'
      ', NM_FABRICANTE_MERC'
      ', NM_FORN_ESTR'
      ', NR_AGENTE_IMP'
      ', NR_DCTO_REDUCAO'
      ', NR_OPER_TRAT_PREV'
      ', NR_ROF'
      ', PC_COEF_REDUC_II'
      ', PC_COMISSAO_AG_IMP'
      ', PC_TAXA_JUROS'
      ', PL_MERCADORIA'
      ', QT_ITENS_ADICAO'
      ', QT_PARC_FINANC_360'
      ', QT_PERIOD_PGTO_360'
      ', QT_UN_ESTATISTICA'
      ', TX_COMPL_VL_ADUAN'
      ', VL_ACRESCIMOS_MN'
      ', VL_BASE_CALCULO_MN'
      ', VL_CALC_DCR_DOLAR'
      ', VL_COMISSAO_AG_IMP'
      ', VL_DEDUCOES_MN'
      ', VL_DESPESAS_MN'
      ', VL_DESPESAS_MNEG'
      ', VL_FINANC_SUP_360'
      ', VL_FRETE_MERC_MN'
      ', VL_FRETE_MERC_MNEG'
      ', VL_II_A_REC_ZFM'
      ', VL_II_CALC_DCR_MN'
      ', VL_II_DEVIDO_ZFM'
      ', VL_MERC_COND_VENDA'
      ', VL_MERC_EMB_MN'
      ', VL_MERC_LOC_EMB_MN'
      ', VL_MERC_VENDA_MN'
      ', VL_SEG_MERC_MN'
      ', VL_SEG_MERC_MNEG'
      ', VL_TOT_FINANC_360'
      ', VL_UNID_LOC_EMP'
      ', IN_ADICAO_CALCULADA'
      ', PC_ICMS'
      ', PC_REDUCAO_ICMS'
      ', VL_ICMS_CALCULADO'
      ', VL_ICMS_A_RECOLHER'
      ', VL_MERC_LOC_EMB_MNEG'
      ', CD_MOEDA_MLE'
      ', TX_MLE'
      ', TX_FRETE'
      ', TX_SEGURO'
      ', TX_DOLAR'
      ', CD_TRIBUTACAO_ICMS'
      ', CD_FUND_LEGAL_ICMS'
      ', VL_DESPESAS'
      ', VL_BASE_CALC_II'
      ', VL_BASE_CALC_IPI'
      ', VL_BASE_CALC_ICMS'
      ', NR_DESTAQUE_NCM'
      ', NR_ATO_DRAWBACK'
      ', VL_TX_SCX_AD'
      ', ALIQ_PIS'
      ', ALIQ_COFINS'
      ', VL_BASE_PIS'
      ', VL_PIS'
      ', VL_COFINS'
      ', TX_PIS_COFINS'
      ', CD_TIPO_BENEF_PIS_COFINS'
      ', PC_REDUCAO_PIS_COFINS'
      ', IN_MANUAL_NCM'
      ', CD_CFOP'
      ', PC_REDUCAO_IPT_II'
      ', PC_REDUCAO_IPT_IPI'
      ', PB_MERCADORIA'
      ', IN_PERMITE_CAT63'
      ', CD_FUND_LEGAL_PISCOFINS'
      ', VL_BASE_CALC_ICMS_AFRMM'
      ', VL_ICMS_A_RECOLHER_AFRMM'
      ', VL_ICMS_DEVIDO_AFRMM'
      ', IN_FUNDO_POBREZA'
      ', QT_MESES_ADM_TEMP'
      ', VL_PIS_CALCULADO'
      ', VL_COFINS_CALCULADO'
      ', VL_ALIQUOTA_ESPECIFICA_PIS'
      ', VL_ALIQUOTA_ESPECIFICA_COFINS'
      ', QTD_UNID_ESPECIFICA_PIS'
      ', QTD_UNID_ESPECIFICA_COFINS'
      ', CD_UNIDADE_MEDIDA_PIS'
      ', CD_UNIDADE_MEDIDA_COFINS'
      ', IN_SUSPENDE_II_RETIFIC'
      ', IN_SUSPENDE_IPI_RETIFIC'
      ', IN_SUSPENDE_PIS_COFINS_RETIFIC'
      ', VL_AFRMM'
      ', ALIQ_PIS_REDUZIDA'
      ', ALIQ_COFINS_REDUZIDA'
      ', VL_MULTA_II'
      ', VL_JUROS_II'
      ', VL_MULTA_IPI'
      ', VL_JUROS_IPI'
      ', VL_MULTA_PIS'
      ', VL_JUROS_PIS'
      ', VL_MULTA_COFINS'
      ', VL_JUROS_COFINS'
      ', ISNULL(CD_TP_PGMTO_AFRMM, '#39'1'#39') AS CD_TP_PGMTO_AFRMM '
      ', CD_TP_ISENCAO'
      ', CD_TP_SUSPENSAO'
      ', NR_PARCELA_ENTREPOSTO'
      ', DT_VENCIMENTO_SUSPENSAO'
      ', NR_ATO_CONCESSORIO'
      ', CD_FUND_LEGAL_II_DUIMP'
      ', CD_FUND_LEGAL_IPI_DUIMP'
      ', CD_FUND_LEGAL_PISCOFINS_DUIMP'
      ',VL_IS'
      ',VL_CIDE'
      ',VL_DIR_COMP'
      ',VL_MED_SAL'
      ',VL_OUTROS_TRIB'
      ',ALIQ_IBS_UF'
      ',ALIQ_IBS_MUN'
      ',ALIQ_CBS'
      ',VL_IBS_MUN'
      ',VL_IBS_UF'
      ',VL_CBS'
      ',VL_BASE_IBS_CBS'
      'FROM TADICAO_DE_IMPORTACAO (NOLOCK)'
      'WHERE NR_PROCESSO =:NR_PROCESSO'
      'ORDER BY NR_PROCESSO, NR_ADICAO')
    UpdateMode = upWhereChanged
    UpdateObject = upd_adicao
    Left = 116
    Top = 57
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_adicao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_adicao_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_ADICAO'
      Size = 3
    end
    object qry_adicao_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_ACORDO_ALADI'
      EditMask = '999'
      Size = 3
    end
    object qry_adicao_CD_AGENC_AGENT_IMP: TStringField
      FieldName = 'CD_AGENC_AGENT_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_AGENC_AGENT_IMP'
      Size = 4
    end
    object qry_adicao_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_APLICACAO_MERC'
      Size = 1
    end
    object qry_adicao_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_AUSENCIA_FABRIC'
      OnChange = qry_adicao_CD_AUSENCIA_FABRICChange
      Size = 1
    end
    object qry_adicao_CD_BANC_AGENTE_IMP: TStringField
      FieldName = 'CD_BANC_AGENTE_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_BANC_AGENTE_IMP'
      Size = 5
    end
    object qry_adicao_CD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_COBERT_CAMBIAL'
      Size = 1
    end
    object qry_adicao_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_FABRICANTE'
      OnChange = qry_adicao_CD_FABRICANTEChange
      Size = 5
    end
    object qry_adicao_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_FORNECEDOR'
      OnChange = qry_adicao_CD_FORNECEDORChange
      Size = 5
    end
    object qry_adicao_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_FUND_LEG_REGIME'
      OnChange = qry_adicao_CD_FUND_LEG_REGIMEChange
      Size = 2
    end
    object qry_adicao_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_INCOTERMS_VENDA'
      Size = 3
    end
    object qry_adicao_CD_LOC_COND_VENDA: TStringField
      FieldName = 'CD_LOC_COND_VENDA'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_LOC_COND_VENDA'
      Size = 4
    end
    object qry_adicao_CD_MD_FRETE_MERC: TStringField
      FieldName = 'CD_MD_FRETE_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MD_FRETE_MERC'
      Size = 3
    end
    object qry_adicao_CD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MERC_NALADI_NCC'
      OnChange = qry_adicao_CD_MERC_NALADI_NCCChange
      Size = 7
    end
    object qry_adicao_CD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MERC_NALADI_SH'
      OnChange = qry_adicao_CD_MERC_NALADI_SHChange
      Size = 8
    end
    object qry_adicao_CD_MERC_NBM_SH: TStringField
      FieldName = 'CD_MERC_NBM_SH'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MERC_NBM_SH'
      Size = 8
    end
    object qry_adicao_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_NCM_SH'
      Size = 8
    end
    object qry_adicao_CD_MERCADORIA_NCM: TStringField
      FieldName = 'CD_MERCADORIA_NCM'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MERCADORIA_NCM'
      OnChange = qry_adicao_CD_MERCADORIA_NCMChange
      Size = 11
    end
    object qry_adicao_CD_METOD_VALORACAO: TStringField
      FieldName = 'CD_METOD_VALORACAO'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_METOD_VALORACAO'
      Size = 2
    end
    object qry_adicao_CD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MODALIDADE_PGTO'
      OnChange = qry_adicao_CD_MODALIDADE_PGTOChange
      Size = 2
    end
    object qry_adicao_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object qry_adicao_CD_MOEDA_SEG_MERC: TStringField
      FieldName = 'CD_MOEDA_SEG_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MOEDA_SEG_MERC'
      Size = 3
    end
    object qry_adicao_CD_MOEDAS_DESPESAS: TStringField
      FieldName = 'CD_MOEDAS_DESPESAS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MOEDAS_DESPESAS'
      Size = 3
    end
    object qry_adicao_CD_MOTIVO_ADM_TEMP: TStringField
      FieldName = 'CD_MOTIVO_ADM_TEMP'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MOTIVO_ADM_TEMP'
      Size = 2
    end
    object qry_adicao_CD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MOTIVO_SEM_COB'
      OnChange = qry_adicao_CD_MOTIVO_SEM_COBChange
      Size = 2
    end
    object qry_adicao_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object qry_adicao_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_PAIS_AQUIS_MERC'
      OnChange = qry_adicao_CD_PAIS_AQUIS_MERCChange
      Size = 3
    end
    object qry_adicao_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_PAIS_ORIG_MERC'
      OnChange = qry_adicao_CD_PAIS_ORIG_MERCChange
      Size = 3
    end
    object qry_adicao_CD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_PAIS_PROC_MERC'
      Size = 3
    end
    object qry_adicao_CD_PERIOD_PGTO_360: TStringField
      FieldName = 'CD_PERIOD_PGTO_360'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_PERIOD_PGTO_360'
      Size = 1
    end
    object qry_adicao_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_REGIME_TRIBUTAR'
      OnChange = qry_adicao_CD_FUND_LEG_REGIMEChange
      Size = 1
    end
    object qry_adicao_CD_TAXA_JUROS: TStringField
      FieldName = 'CD_TAXA_JUROS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_TAXA_JUROS'
      Size = 4
    end
    object qry_adicao_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object qry_adicao_CD_TIPO_AGENTE_IMP: TStringField
      FieldName = 'CD_TIPO_AGENTE_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_TIPO_AGENTE_IMP'
      Size = 1
    end
    object qry_adicao_CD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_URF_ENTR_MERC'
      EditMask = '9999999;0;_'
      Size = 7
    end
    object qry_adicao_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_adicao_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_VINC_IMPO_EXPO'
      Size = 1
    end
    object qry_adicao_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_adicao_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_TRIBUTACAO_ICMS'
      Size = 1
    end
    object qry_adicao_ED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_CIDAD_FABRIC'
      Size = 25
    end
    object qry_adicao_ED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object qry_adicao_ED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_COMPL_FABRIC'
      Size = 21
    end
    object qry_adicao_ED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object qry_adicao_ED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object qry_adicao_ED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_ESTADO_FABRIC'
      Size = 25
    end
    object qry_adicao_ED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_LOGR_FABRIC'
      Size = 40
    end
    object qry_adicao_ED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object qry_adicao_ED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_NR_FABRIC'
      Size = 6
    end
    object qry_adicao_ED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_NR_FORN_ESTR'
      Size = 6
    end
    object qry_adicao_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
      Origin = 'TADICAO_DE_IMPORTACAO.IN_BEM_ENCOMENDA'
    end
    object qry_adicao_IN_IPI_NAO_TRIBUT: TBooleanField
      FieldName = 'IN_IPI_NAO_TRIBUT'
      Origin = 'TADICAO_DE_IMPORTACAO.IN_IPI_NAO_TRIBUT'
    end
    object qry_adicao_IN_JUROS_ATE_360: TBooleanField
      FieldName = 'IN_JUROS_ATE_360'
      Origin = 'TADICAO_DE_IMPORTACAO.IN_JUROS_ATE_360'
    end
    object qry_adicao_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
      Origin = 'TADICAO_DE_IMPORTACAO.IN_MATERIAL_USADO'
    end
    object qry_adicao_IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
      Origin = 'TADICAO_DE_IMPORTACAO.IN_MULTIMODAL'
    end
    object qry_adicao_IN_PGTO_VARIAV_360: TBooleanField
      FieldName = 'IN_PGTO_VARIAV_360'
      Origin = 'TADICAO_DE_IMPORTACAO.IN_PGTO_VARIAV_360'
    end
    object qry_adicao_IN_ADICAO_CALCULADA: TBooleanField
      FieldName = 'IN_ADICAO_CALCULADA'
      Origin = 'TADICAO_DE_IMPORTACAO.IN_ADICAO_CALCULADA'
    end
    object qry_adicao_NM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.NM_FABRICANTE_MERC'
      Size = 60
    end
    object qry_adicao_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.NM_FORN_ESTR'
      Size = 60
    end
    object qry_adicao_NR_AGENTE_IMP: TStringField
      FieldName = 'NR_AGENTE_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_AGENTE_IMP'
      Size = 14
    end
    object qry_adicao_NR_DCTO_REDUCAO: TStringField
      FieldName = 'NR_DCTO_REDUCAO'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_DCTO_REDUCAO'
      Size = 8
    end
    object qry_adicao_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_OPER_TRAT_PREV'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object qry_adicao_NR_ROF: TStringField
      FieldName = 'NR_ROF'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_ROF'
      EditMask = 'AAA/AAAAA;0;'
      Size = 8
    end
    object qry_adicao_PC_COEF_REDUC_II: TFloatField
      FieldName = 'PC_COEF_REDUC_II'
      Origin = 'TADICAO_DE_IMPORTACAO.PC_COEF_REDUC_II'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_PC_COMISSAO_AG_IMP: TFloatField
      FieldName = 'PC_COMISSAO_AG_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.PC_COMISSAO_AG_IMP'
      DisplayFormat = '#0,.000'
      EditFormat = '#.###'
    end
    object qry_adicao_PC_TAXA_JUROS: TFloatField
      FieldName = 'PC_TAXA_JUROS'
      Origin = 'TADICAO_DE_IMPORTACAO.PC_TAXA_JUROS'
      DisplayFormat = '#0,.00#'
    end
    object qry_adicao_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      Origin = 'TADICAO_DE_IMPORTACAO.PC_ICMS'
      OnChange = qry_adicao_PC_ICMSChange
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_PC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
      Origin = 'TADICAO_DE_IMPORTACAO.PC_REDUCAO_ICMS'
      OnChange = qry_adicao_PC_REDUCAO_ICMSChange
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TADICAO_DE_IMPORTACAO.PL_MERCADORIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#.#####'
    end
    object qry_adicao_QT_ITENS_ADICAO: TIntegerField
      FieldName = 'QT_ITENS_ADICAO'
      Origin = 'TADICAO_DE_IMPORTACAO.QT_ITENS_ADICAO'
    end
    object qry_adicao_QT_PARC_FINANC_360: TIntegerField
      FieldName = 'QT_PARC_FINANC_360'
      Origin = 'TADICAO_DE_IMPORTACAO.QT_PARC_FINANC_360'
    end
    object qry_adicao_QT_PERIOD_PGTO_360: TIntegerField
      FieldName = 'QT_PERIOD_PGTO_360'
      Origin = 'TADICAO_DE_IMPORTACAO.QT_PERIOD_PGTO_360'
    end
    object qry_adicao_QT_UN_ESTATISTICA: TFloatField
      FieldName = 'QT_UN_ESTATISTICA'
      Origin = 'TADICAO_DE_IMPORTACAO.QT_UN_ESTATISTICA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#.#####'
    end
    object qry_adicao_TX_COMPL_VL_ADUAN: TStringField
      FieldName = 'TX_COMPL_VL_ADUAN'
      Origin = 'TADICAO_DE_IMPORTACAO.TX_COMPL_VL_ADUAN'
      Size = 250
    end
    object qry_adicao_TX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
      Origin = 'TADICAO_DE_IMPORTACAO.TX_FRETE'
    end
    object qry_adicao_TX_SEGURO: TFloatField
      FieldName = 'TX_SEGURO'
      Origin = 'TADICAO_DE_IMPORTACAO.TX_SEGURO'
    end
    object qry_adicao_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      Origin = 'TADICAO_DE_IMPORTACAO.TX_DOLAR'
    end
    object qry_adicao_VL_ACRESCIMOS_MN: TFloatField
      FieldName = 'VL_ACRESCIMOS_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_ACRESCIMOS_MN'
    end
    object qry_adicao_VL_CALC_DCR_DOLAR: TFloatField
      FieldName = 'VL_CALC_DCR_DOLAR'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_CALC_DCR_DOLAR'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_COMISSAO_AG_IMP: TFloatField
      FieldName = 'VL_COMISSAO_AG_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_COMISSAO_AG_IMP'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_DEDUCOES_MN: TFloatField
      FieldName = 'VL_DEDUCOES_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_DEDUCOES_MN'
    end
    object qry_adicao_VL_DESPESAS_MN: TFloatField
      FieldName = 'VL_DESPESAS_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_DESPESAS_MN'
    end
    object qry_adicao_VL_DESPESAS_MNEG: TFloatField
      FieldName = 'VL_DESPESAS_MNEG'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_DESPESAS_MNEG'
    end
    object qry_adicao_VL_FINANC_SUP_360: TFloatField
      FieldName = 'VL_FINANC_SUP_360'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_FINANC_SUP_360'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_FRETE_MERC_MN: TFloatField
      FieldName = 'VL_FRETE_MERC_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_FRETE_MERC_MN'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_FRETE_MERC_MNEG: TFloatField
      FieldName = 'VL_FRETE_MERC_MNEG'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_FRETE_MERC_MNEG'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_II_A_REC_ZFM: TFloatField
      FieldName = 'VL_II_A_REC_ZFM'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_II_A_REC_ZFM'
    end
    object qry_adicao_VL_II_CALC_DCR_MN: TFloatField
      FieldName = 'VL_II_CALC_DCR_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_II_CALC_DCR_MN'
    end
    object qry_adicao_VL_II_DEVIDO_ZFM: TFloatField
      FieldName = 'VL_II_DEVIDO_ZFM'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_II_DEVIDO_ZFM'
    end
    object qry_adicao_VL_MERC_COND_VENDA: TFloatField
      FieldName = 'VL_MERC_COND_VENDA'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_MERC_COND_VENDA'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_MERC_EMB_MN: TFloatField
      FieldName = 'VL_MERC_EMB_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_MERC_EMB_MN'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_MERC_VENDA_MN: TFloatField
      FieldName = 'VL_MERC_VENDA_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_MERC_VENDA_MN'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_vl_merc_loc_emb_mn: TFloatField
      FieldName = 'vl_merc_loc_emb_mn'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_ADICAO'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_vl_merc_loc_emb_mneg: TFloatField
      FieldName = 'vl_merc_loc_emb_mneg'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_ACORDO_ALADI'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_SEG_MERC_MN: TFloatField
      FieldName = 'VL_SEG_MERC_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_SEG_MERC_MN'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_SEG_MERC_MNEG: TFloatField
      FieldName = 'VL_SEG_MERC_MNEG'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_SEG_MERC_MNEG'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_TOT_FINANC_360: TFloatField
      FieldName = 'VL_TOT_FINANC_360'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_TOT_FINANC_360'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_UNID_LOC_EMP: TFloatField
      FieldName = 'VL_UNID_LOC_EMP'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_UNID_LOC_EMP'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_vl_base_calculo_mn: TFloatField
      FieldName = 'vl_base_calculo_mn'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_PROCESSO'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_ICMS_CALCULADO: TFloatField
      FieldName = 'VL_ICMS_CALCULADO'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_ICMS_CALCULADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_ICMS_A_RECOLHER: TFloatField
      FieldName = 'VL_ICMS_A_RECOLHER'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_ICMS_A_RECOLHER'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
      Origin = 'TADICAO_DE_IMPORTACAO.TX_MLE'
    end
    object qry_adicao_Look_Pais_origem: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Pais_origem'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_ORIG_MERC'
      Size = 40
      Lookup = True
    end
    object qry_adicao_Look_Pais_Aquisicao: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Pais_Aquisicao'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_AQUIS_MERC'
      Size = 40
      Lookup = True
    end
    object qry_adicao_Look_Pais_Procedencia: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Pais_Procedencia'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_PROC_MERC'
      Size = 40
      Lookup = True
    end
    object qry_adicao_Look_Exportador: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Exportador'
      LookupDataSet = tbl_empresa_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FORNECEDOR'
      Size = 60
      Lookup = True
    end
    object qry_adicao_Look_Fabricante: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Fabricante'
      LookupDataSet = tbl_empresa_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FABRICANTE'
      Size = 60
      Lookup = True
    end
    object qry_adicao_Look_Loc_Cond_Venda: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Loc_Cond_Venda'
      LookupDataSet = tbl_local_embarque_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_LOC_COND_VENDA'
      Size = 40
      Lookup = True
    end
    object qry_adicao_Look_Reg_Trib: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Reg_Trib'
      LookupDataSet = tbl_reg_trib_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_REGIME_TRIBUTAR'
      Size = 40
      Lookup = True
    end
    object qry_adicao_Look_Mot_Sem_Cobertura: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Mot_Sem_Cobertura'
      LookupDataSet = tbl_motivo_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOTIVO_SEM_COB'
      Size = 60
      Lookup = True
    end
    object qry_adicao_Look_Metodo_Valoracao: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Metodo_Valoracao'
      LookupDataSet = tbl_metodo_valoracao_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_METOD_VALORACAO'
      Size = 50
      Lookup = True
    end
    object qry_adicao_Look_nm_Trib_ICMS: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_Trib_ICMS'
      LookupDataSet = tbl_tributacao_icms
      LookupKeyFields = 'CD_TRIBUTACAO_ICMS'
      LookupResultField = 'NM_TRIBUTACAO_ICMS'
      KeyFields = 'CD_TRIBUTACAO_ICMS'
      Lookup = True
    end
    object qry_adicao_Look_Mot_Ad_Temp: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Mot_Ad_Temp'
      LookupDataSet = tbl_mot_ad_temp_
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CD_MOTIVO_ADM_TEMP'
      Size = 80
      Lookup = True
    end
    object qry_adicao_Look_Disp_Legal: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Disp_Legal'
      LookupDataSet = qry_disp_legal_
      LookupKeyFields = 'CD_EX'
      LookupResultField = 'NM_EX'
      KeyFields = 'CD_FUND_LEGAL_ICMS'
      Size = 120
      Lookup = True
    end
    object qry_adicao_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_PROCESSO'
      Size = 3
    end
    object qry_adicao_VL_DESPESAS: TFloatField
      FieldName = 'VL_DESPESAS'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_NR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_AGENC_AGENT_IMP'
      EditMask = '999'
      Size = 3
    end
    object qry_adicao_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_AGENC_AGENT_IMP'
      Size = 13
    end
    object qry_adicao_ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_APLICACAO_MERC'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_AUSENCIA_FABRIC'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_BASE_PIS: TFloatField
      FieldName = 'VL_BASE_PIS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_BANC_AGENTE_IMP'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_PIS: TFloatField
      FieldName = 'VL_PIS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_COBERT_CAMBIAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_FABRICANTE'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_TX_PIS_COFINS: TMemoField
      FieldName = 'TX_PIS_COFINS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_FORNECEDOR'
      BlobType = ftMemo
    end
    object qry_adicao_CD_TIPO_BENEF_PIS_COFINS: TStringField
      FieldName = 'CD_TIPO_BENEF_PIS_COFINS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_FUND_LEG_REGIME'
      OnChange = qry_adicao_CD_FUND_LEG_REGIMEChange
      Size = 1
    end
    object qry_adicao_PC_REDUCAO_PIS_COFINS: TFloatField
      FieldName = 'PC_REDUCAO_PIS_COFINS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_INCOTERMS_VENDA'
    end
    object qry_adicao_IN_MANUAL_NCM: TStringField
      FieldName = 'IN_MANUAL_NCM'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_LOC_COND_VENDA'
      Size = 1
    end
    object qry_adicao_VL_BASE_CALC_ICMS: TFloatField
      FieldName = 'VL_BASE_CALC_ICMS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_BASE_CALC_ICMS'
    end
    object qry_adicao_CD_FUND_LEGAL_PISCOFINS: TStringField
      FieldName = 'CD_FUND_LEGAL_PISCOFINS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.CD_FUND_LEGAL_PISCOFINS'
      FixedChar = True
      Size = 2
    end
    object qry_adicao_VL_BASE_CALC_II: TFloatField
      FieldName = 'VL_BASE_CALC_II'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_BASE_CALC_II'
    end
    object qry_adicao_VL_BASE_CALC_IPI: TFloatField
      FieldName = 'VL_BASE_CALC_IPI'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_BASE_CALC_IPI'
    end
    object qry_adicao_VL_TX_SCX_AD: TFloatField
      FieldName = 'VL_TX_SCX_AD'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_TX_SCX_AD'
    end
    object qry_adicao_PC_REDUCAO_IPT_II: TFloatField
      FieldName = 'PC_REDUCAO_IPT_II'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.PC_REDUCAO_IPT_II'
    end
    object qry_adicao_PC_REDUCAO_IPT_IPI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_IPI'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.PC_REDUCAO_IPT_IPI'
    end
    object qry_adicao_PB_MERCADORIA: TFloatField
      FieldName = 'PB_MERCADORIA'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.PB_MERCADORIA'
    end
    object qry_adicao_IN_PERMITE_CAT63: TStringField
      FieldName = 'IN_PERMITE_CAT63'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.IN_PERMITE_CAT63'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_VL_BASE_CALC_ICMS_AFRMM: TFloatField
      FieldName = 'VL_BASE_CALC_ICMS_AFRMM'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_BASE_CALC_ICMS_AFRMM'
    end
    object qry_adicao_VL_ICMS_A_RECOLHER_AFRMM: TFloatField
      FieldName = 'VL_ICMS_A_RECOLHER_AFRMM'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_ICMS_A_RECOLHER_AFRMM'
    end
    object qry_adicao_VL_ICMS_DEVIDO_AFRMM: TFloatField
      FieldName = 'VL_ICMS_DEVIDO_AFRMM'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_ICMS_DEVIDO_AFRMM'
    end
    object qry_adicao_CD_CFOP: TStringField
      DisplayWidth = 5
      FieldName = 'CD_CFOP'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.CD_CFOP'
      EditMask = '#.###;0;_'
      FixedChar = True
      Size = 4
    end
    object qry_adicao_IN_FUNDO_POBREZA: TStringField
      FieldName = 'IN_FUNDO_POBREZA'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.IN_FUNDO_POBREZA'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_VL_ALIQUOTA_ESPECIFICA_PIS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_PIS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_ALIQUOTA_ESPECIFICA_PIS'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_COFINS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_ALIQUOTA_ESPECIFICA_COFINS'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_adicao_QTD_UNID_ESPECIFICA_PIS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_PIS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.QTD_UNID_ESPECIFICA_PIS'
      DisplayFormat = '#0,.#####'
      EditFormat = '#.#####'
    end
    object qry_adicao_QTD_UNID_ESPECIFICA_COFINS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_COFINS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.QTD_UNID_ESPECIFICA_COFINS'
      DisplayFormat = '#0,.#####'
      EditFormat = '#.#####'
    end
    object qry_adicao_CD_UNIDADE_MEDIDA_PIS: TStringField
      FieldName = 'CD_UNIDADE_MEDIDA_PIS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.CD_UNIDADE_MEDIDA_PIS'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_CD_UNIDADE_MEDIDA_COFINS: TStringField
      FieldName = 'CD_UNIDADE_MEDIDA_COFINS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.CD_UNIDADE_MEDIDA_COFINS'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_QT_MESES_ADM_TEMP: TIntegerField
      FieldName = 'QT_MESES_ADM_TEMP'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.QT_MESES_ADM_TEMP'
    end
    object qry_adicao_VL_PIS_CALCULADO: TFloatField
      FieldName = 'VL_PIS_CALCULADO'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_PIS_CALCULADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_COFINS_CALCULADO: TFloatField
      FieldName = 'VL_COFINS_CALCULADO'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_COFINS_CALCULADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_IN_SUSPENDE_II_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_II_RETIFIC'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.IN_SUSPENDE_II_RETIFIC'
    end
    object qry_adicao_IN_SUSPENDE_IPI_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_IPI_RETIFIC'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.IN_SUSPENDE_IPI_RETIFIC'
    end
    object qry_adicao_IN_SUSPENDE_PIS_COFINS_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_PIS_COFINS_RETIFIC'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.IN_SUSPENDE_PIS_COFINS_RETIFIC'
    end
    object qry_adicao_VL_AFRMM: TFloatField
      FieldName = 'VL_AFRMM'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_AFRMM'
    end
    object qry_adicao_ALIQ_PIS_REDUZIDA: TFloatField
      FieldName = 'ALIQ_PIS_REDUZIDA'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.ALIQ_PIS_REDUZIDA'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_ALIQ_COFINS_REDUZIDA: TFloatField
      FieldName = 'ALIQ_COFINS_REDUZIDA'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.ALIQ_COFINS_REDUZIDA'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_Look_NM_NCM: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_NM_NCM'
      LookupDataSet = qry_ncm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_NCM_SH'
      Size = 200
      Lookup = True
    end
    object qry_adicao_VL_MULTA_II: TFloatField
      FieldName = 'VL_MULTA_II'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_MULTA_II'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_JUROS_II: TFloatField
      FieldName = 'VL_JUROS_II'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_JUROS_II'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_MULTA_IPI: TFloatField
      FieldName = 'VL_MULTA_IPI'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_MULTA_IPI'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_JUROS_IPI: TFloatField
      FieldName = 'VL_JUROS_IPI'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_JUROS_IPI'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_MULTA_PIS: TFloatField
      FieldName = 'VL_MULTA_PIS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_MULTA_PIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_JUROS_PIS: TFloatField
      FieldName = 'VL_JUROS_PIS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_JUROS_PIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_MULTA_COFINS: TFloatField
      FieldName = 'VL_MULTA_COFINS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_MULTA_COFINS'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_VL_JUROS_COFINS: TFloatField
      FieldName = 'VL_JUROS_COFINS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.VL_JUROS_COFINS'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_adicao_CD_TP_PGMTO_AFRMM: TStringField
      FieldName = 'CD_TP_PGMTO_AFRMM'
      Size = 1
    end
    object qry_adicao_CD_TP_ISENCAO: TStringField
      FieldName = 'CD_TP_ISENCAO'
      Size = 4
    end
    object qry_adicao_CD_TP_SUSPENSAO: TStringField
      DisplayWidth = 4
      FieldName = 'CD_TP_SUSPENSAO'
      Size = 4
    end
    object qry_adicao_NR_PARCELA_ENTREPOSTO: TIntegerField
      FieldName = 'NR_PARCELA_ENTREPOSTO'
    end
    object qry_adicao_Look_Tp_Suspensao: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Tp_Suspensao'
      LookupDataSet = tbl_TTP_SUSPENSAO_AFRMM
      LookupKeyFields = 'CD_TP_SUSPENSAO'
      LookupResultField = 'DS_TP_SUSPENSAO'
      KeyFields = 'CD_TP_SUSPENSAO'
      Size = 60
      Lookup = True
    end
    object qry_adicao_Look_CD_TP_ISENCAO: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_TP_ISENCAO'
      LookupDataSet = tbl_TTP_ISENCAO_AFRMM
      LookupKeyFields = 'CD_TP_ISENCAO'
      LookupResultField = 'DS_TP_ISENCAO'
      KeyFields = 'CD_TP_ISENCAO'
      Size = 60
      Lookup = True
    end
    object qry_adicao_DT_VENCIMENTO_SUSPENSAO: TDateTimeField
      FieldName = 'DT_VENCIMENTO_SUSPENSAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_adicao_NR_ATO_CONCESSORIO: TStringField
      FieldName = 'NR_ATO_CONCESSORIO'
      Size = 15
    end
    object qry_adicao_CD_FUND_LEGAL_II_DUIMP: TStringField
      FieldName = 'CD_FUND_LEGAL_II_DUIMP'
      Size = 4
    end
    object qry_adicao_CD_FUND_LEGAL_IPI_DUIMP: TStringField
      FieldName = 'CD_FUND_LEGAL_IPI_DUIMP'
      Size = 4
    end
    object qry_adicao_CD_FUND_LEGAL_PISCOFINS_DUIMP: TStringField
      FieldName = 'CD_FUND_LEGAL_PISCOFINS_DUIMP'
      Size = 4
    end
    object qry_adicao_Look_fund_legal_ii_duimp: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_fund_legal_ii_duimp'
      LookupDataSet = tblFundLegalIIDuimp
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_FUND_LEGAL_II_DUIMP'
      Size = 250
      Lookup = True
    end
    object qry_adicao_Look_fund_legal_ipi_duimp: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_fund_legal_ipi_duimp'
      LookupDataSet = tblFundLegalIPIDuimp
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_FUND_LEGAL_IPI_DUIMP'
      Size = 250
      Lookup = True
    end
    object qry_adicao_Look_fund_legal_piscofins_duimp: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_fund_legal_piscofins_duimp'
      LookupDataSet = tblFundLegalPisCofinsDuimp
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_FUND_LEGAL_PISCOFINS_DUIMP'
      Size = 250
      Lookup = True
    end
    object qry_adicao_VL_IS: TFloatField
      FieldName = 'VL_IS'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_CIDE: TFloatField
      FieldName = 'VL_CIDE'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_DIR_COMP: TFloatField
      FieldName = 'VL_DIR_COMP'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_MED_SAL: TFloatField
      FieldName = 'VL_MED_SAL'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_OUTROS_TRIB: TFloatField
      FieldName = 'VL_OUTROS_TRIB'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_ALIQ_IBS_UF: TFloatField
      FieldName = 'ALIQ_IBS_UF'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_ALIQ_IBS_MUN: TFloatField
      FieldName = 'ALIQ_IBS_MUN'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_ALIQ_CBS: TFloatField
      FieldName = 'ALIQ_CBS'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_IBS_MUN: TFloatField
      FieldName = 'VL_IBS_MUN'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_IBS_UF: TFloatField
      FieldName = 'VL_IBS_UF'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_CBS: TFloatField
      FieldName = 'VL_CBS'
      DisplayFormat = '#0,.00'
    end
    object qry_adicao_VL_BASE_IBS_CBS: TFloatField
      FieldName = 'VL_BASE_IBS_CBS'
      DisplayFormat = '#0,.00'
    end
  end
  object qry_itens_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    DataSource = ds_adicao
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_ADICAO, NR_ITEM,'
      'CD_NCM_SH, CD_NALADI_SH, CD_NALADI_NCCA,'
      'QT_MERC_UN_COMERC, CD_UN_MED_COMERC,'
      'QT_MERC_UN_ESTAT, PL_MERCADORIA, PC_DESCONTO_MERC,'
      'VL_UNITARIO, VL_DESCONTO_MERC, VL_MLE_ITEM,'
      'VL_FRETE_ITEM, VL_SEGURO_ITEM, VL_MCV_ITEM,'
      'VL_UNID_COND_VENDA, CD_TIPO_CALCULO_ITEM,'
      'CD_MERCADORIA, CD_FABR_EXPO, CD_EXPORTADOR,'
      'CD_PAIS_ORIGEM, CD_FABRICANTE, CD_PAIS_AQUISICAO'
      'FROM TDETALHE_MERCADORIA (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = :NR_ADICAO')
    UpdateMode = upWhereChanged
    Left = 116
    Top = 103
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDETALHE_MERCADORIA.NR_PROCESSO'
      Size = 18
    end
    object qry_itens_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TDETALHE_MERCADORIA.NR_ADICAO'
      Size = 3
    end
    object qry_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TDETALHE_MERCADORIA.NR_ITEM'
      EditMask = '000'
      Size = 3
    end
    object qry_itens_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TDETALHE_MERCADORIA.CD_NCM_SH'
      EditMask = '9999.99.99-9999;0;_'
      Size = 11
    end
    object qry_itens_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TDETALHE_MERCADORIA.CD_NALADI_SH'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_itens_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'TDETALHE_MERCADORIA.CD_NALADI_NCCA'
      EditMask = '9999.99.9;0;_'
      Size = 7
    end
    object qry_itens_QT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
      Origin = 'TDETALHE_MERCADORIA.QT_MERC_UN_COMERC'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.#######'
    end
    object qry_itens_QT_MERC_UN_ESTAT: TFloatField
      FieldName = 'QT_MERC_UN_ESTAT'
      Origin = 'TDETALHE_MERCADORIA.QT_MERC_UN_ESTAT'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.#######'
    end
    object qry_itens_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TDETALHE_MERCADORIA.PL_MERCADORIA'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.#######'
    end
    object qry_itens_PC_DESCONTO_MERC: TFloatField
      FieldName = 'PC_DESCONTO_MERC'
      Origin = 'TDETALHE_MERCADORIA.PC_DESCONTO_MERC'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.##'
    end
    object qry_itens_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TDETALHE_MERCADORIA.VL_UNITARIO'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.#######'
    end
    object qry_itens_VL_DESCONTO_MERC: TFloatField
      FieldName = 'VL_DESCONTO_MERC'
      Origin = 'TDETALHE_MERCADORIA.VL_DESCONTO_MERC'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.#######'
    end
    object qry_itens_VL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_MLE_ITEM'
    end
    object qry_itens_VL_FRETE_ITEM: TFloatField
      FieldName = 'VL_FRETE_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_FRETE_ITEM'
    end
    object qry_itens_VL_SEGURO_ITEM: TFloatField
      FieldName = 'VL_SEGURO_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_SEGURO_ITEM'
    end
    object qry_itens_VL_MCV_ITEM: TFloatField
      FieldName = 'VL_MCV_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_MCV_ITEM'
    end
    object qry_itens_VL_UNID_COND_VENDA: TFloatField
      FieldName = 'VL_UNID_COND_VENDA'
      Origin = 'TDETALHE_MERCADORIA.VL_UNID_COND_VENDA'
    end
    object qry_itens_CD_TIPO_CALCULO_ITEM: TStringField
      FieldName = 'CD_TIPO_CALCULO_ITEM'
      Origin = 'TDETALHE_MERCADORIA.CD_TIPO_CALCULO_ITEM'
      Size = 1
    end
    object qry_itens_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TDETALHE_MERCADORIA.CD_MERCADORIA'
      Size = 30
    end
    object qry_itens_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TDETALHE_MERCADORIA.CD_FABR_EXPO'
      Size = 1
    end
    object qry_itens_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TDETALHE_MERCADORIA.CD_EXPORTADOR'
      EditMask = '99999'
      Size = 5
    end
    object qry_itens_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TDETALHE_MERCADORIA.CD_PAIS_ORIGEM'
      EditMask = '999'
      Size = 3
    end
    object qry_itens_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TDETALHE_MERCADORIA.CD_FABRICANTE'
      EditMask = '99999'
      Size = 5
    end
    object qry_itens_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TDETALHE_MERCADORIA.CD_PAIS_AQUISICAO'
      EditMask = '999'
      Size = 3
    end
    object qry_itens_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'TDETALHE_MERCADORIA.NR_PROCESSO'
      EditMask = '999;0;'
      Size = 3
    end
  end
  object sp_di_repassa_campos_classif: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_repassa_campos_classif'
    Left = 957
    Top = 103
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
        Name = '@nr_adicao'
        ParamType = ptInput
      end>
  end
  object qry_ad_ii_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = qry_ad_ii_BeforePost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    DataSource = ds_adicao
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TRIBUTO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = :NR_ADICAO AND'
      'CD_RECEITA_IMPOSTO = '#39'0001'#39)
    UpdateMode = upWhereChanged
    Left = 835
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_ad_ii_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TRIBUTO.NR_PROCESSO'
      Size = 18
    end
    object qry_ad_ii_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TRIBUTO.NR_ADICAO'
      Size = 3
    end
    object qry_ad_ii_CD_RECEITA_IMPOSTO: TStringField
      FieldName = 'CD_RECEITA_IMPOSTO'
      Origin = 'TRIBUTO.CD_RECEITA_IMPOSTO'
      Size = 4
    end
    object qry_ad_ii_CD_TIPO_ALIQ_IPT: TStringField
      FieldName = 'CD_TIPO_ALIQ_IPT'
      Origin = 'TRIBUTO.CD_TIPO_ALIQ_IPT'
      Size = 1
    end
    object qry_ad_ii_VL_BASE_CALC_ADVAL: TFloatField
      FieldName = 'VL_BASE_CALC_ADVAL'
      Origin = 'TRIBUTO.VL_BASE_CALC_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_PC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
      Origin = 'TRIBUTO.PC_ALIQ_NORM_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_VL_CALC_IPT_ADVAL: TFloatField
      FieldName = 'VL_CALC_IPT_ADVAL'
      Origin = 'TRIBUTO.VL_CALC_IPT_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_NM_UN_ALIQ_ESP_IPT: TStringField
      FieldName = 'NM_UN_ALIQ_ESP_IPT'
      Origin = 'TRIBUTO.NM_UN_ALIQ_ESP_IPT'
      Size = 15
    end
    object qry_ad_ii_CD_TIPO_RECIPIENTE: TStringField
      FieldName = 'CD_TIPO_RECIPIENTE'
      Origin = 'TRIBUTO.CD_TIPO_RECIPIENTE'
      Size = 2
    end
    object qry_ad_ii_QT_ML_RECIPIENTE: TFloatField
      FieldName = 'QT_ML_RECIPIENTE'
      Origin = 'TRIBUTO.QT_ML_RECIPIENTE'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_QT_MERC_UN_ALIQ_ES: TFloatField
      FieldName = 'QT_MERC_UN_ALIQ_ES'
      Origin = 'TRIBUTO.QT_MERC_UN_ALIQ_ES'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_VL_ALIQ_ESPEC_IPT: TFloatField
      FieldName = 'VL_ALIQ_ESPEC_IPT'
      Origin = 'TRIBUTO.VL_ALIQ_ESPEC_IPT'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_VL_CALC_IPT_ESPEC: TFloatField
      FieldName = 'VL_CALC_IPT_ESPEC'
      Origin = 'TRIBUTO.VL_CALC_IPT_ESPEC'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_CD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      Origin = 'TRIBUTO.CD_TIPO_BENEF_IPI'
      Size = 1
    end
    object qry_ad_ii_PC_ALIQ_REDUZIDA: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA'
      Origin = 'TRIBUTO.PC_ALIQ_REDUZIDA'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_PC_REDUCAO_IPT_BLI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_BLI'
      Origin = 'TRIBUTO.PC_REDUCAO_IPT_BLI'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_PC_ALIQ_ACOR_TARIF: TFloatField
      FieldName = 'PC_ALIQ_ACOR_TARIF'
      Origin = 'TRIBUTO.PC_ALIQ_ACOR_TARIF'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_VL_CALC_II_AC_TARI: TFloatField
      FieldName = 'VL_CALC_II_AC_TARI'
      Origin = 'TRIBUTO.VL_CALC_II_AC_TARI'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_VL_IMPOSTO_DEVIDO: TFloatField
      FieldName = 'VL_IMPOSTO_DEVIDO'
      Origin = 'TRIBUTO.VL_IMPOSTO_DEVIDO'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_VL_IPT_A_RECOLHER: TFloatField
      FieldName = 'VL_IPT_A_RECOLHER'
      Origin = 'TRIBUTO.VL_IPT_A_RECOLHER'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ii_CD_TIPO_DIREITO: TStringField
      FieldName = 'CD_TIPO_DIREITO'
      Origin = 'TRIBUTO.CD_TIPO_DIREITO'
      Size = 1
    end
    object qry_ad_ii_NR_NOTA_COMPL_TIPI: TStringField
      FieldName = 'NR_NOTA_COMPL_TIPI'
      Origin = 'TRIBUTO.NR_NOTA_COMPL_TIPI'
      Size = 2
    end
  end
  object qry_ad_ipi_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = qry_ad_ipi_BeforePost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    DataSource = ds_adicao
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TRIBUTO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = :NR_ADICAO AND'
      'CD_RECEITA_IMPOSTO = '#39'0002'#39)
    UpdateMode = upWhereChanged
    Left = 838
    Top = 403
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_ad_ipi_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TRIBUTO.NR_PROCESSO'
      Size = 18
    end
    object qry_ad_ipi_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TRIBUTO.NR_ADICAO'
      Size = 3
    end
    object qry_ad_ipi_CD_RECEITA_IMPOSTO: TStringField
      FieldName = 'CD_RECEITA_IMPOSTO'
      Origin = 'TRIBUTO.CD_RECEITA_IMPOSTO'
      Size = 4
    end
    object qry_ad_ipi_CD_TIPO_ALIQ_IPT: TStringField
      FieldName = 'CD_TIPO_ALIQ_IPT'
      Origin = 'TRIBUTO.CD_TIPO_ALIQ_IPT'
      Size = 1
    end
    object qry_ad_ipi_VL_BASE_CALC_ADVAL: TFloatField
      FieldName = 'VL_BASE_CALC_ADVAL'
      Origin = 'TRIBUTO.VL_BASE_CALC_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_PC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
      Origin = 'TRIBUTO.PC_ALIQ_NORM_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_VL_CALC_IPT_ADVAL: TFloatField
      FieldName = 'VL_CALC_IPT_ADVAL'
      Origin = 'TRIBUTO.VL_CALC_IPT_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_NM_UN_ALIQ_ESP_IPT: TStringField
      FieldName = 'NM_UN_ALIQ_ESP_IPT'
      Origin = 'TRIBUTO.NM_UN_ALIQ_ESP_IPT'
      Size = 15
    end
    object qry_ad_ipi_CD_TIPO_RECIPIENTE: TStringField
      FieldName = 'CD_TIPO_RECIPIENTE'
      Origin = 'TRIBUTO.CD_TIPO_RECIPIENTE'
      Size = 2
    end
    object qry_ad_ipi_QT_ML_RECIPIENTE: TFloatField
      FieldName = 'QT_ML_RECIPIENTE'
      Origin = 'TRIBUTO.QT_ML_RECIPIENTE'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_QT_MERC_UN_ALIQ_ES: TFloatField
      FieldName = 'QT_MERC_UN_ALIQ_ES'
      Origin = 'TRIBUTO.QT_MERC_UN_ALIQ_ES'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_VL_ALIQ_ESPEC_IPT: TFloatField
      FieldName = 'VL_ALIQ_ESPEC_IPT'
      Origin = 'TRIBUTO.VL_ALIQ_ESPEC_IPT'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_VL_CALC_IPT_ESPEC: TFloatField
      FieldName = 'VL_CALC_IPT_ESPEC'
      Origin = 'TRIBUTO.VL_CALC_IPT_ESPEC'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_CD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      Origin = 'TRIBUTO.CD_TIPO_BENEF_IPI'
      OnChange = qry_adicao_CD_FUND_LEG_REGIMEChange
      Size = 1
    end
    object qry_ad_ipi_PC_ALIQ_REDUZIDA: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA'
      Origin = 'TRIBUTO.PC_ALIQ_REDUZIDA'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_PC_REDUCAO_IPT_BLI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_BLI'
      Origin = 'TRIBUTO.PC_REDUCAO_IPT_BLI'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_PC_ALIQ_ACOR_TARIF: TFloatField
      FieldName = 'PC_ALIQ_ACOR_TARIF'
      Origin = 'TRIBUTO.PC_ALIQ_ACOR_TARIF'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_VL_CALC_II_AC_TARI: TFloatField
      FieldName = 'VL_CALC_II_AC_TARI'
      Origin = 'TRIBUTO.VL_CALC_II_AC_TARI'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_VL_IMPOSTO_DEVIDO: TFloatField
      FieldName = 'VL_IMPOSTO_DEVIDO'
      Origin = 'TRIBUTO.VL_IMPOSTO_DEVIDO'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_VL_IPT_A_RECOLHER: TFloatField
      FieldName = 'VL_IPT_A_RECOLHER'
      Origin = 'TRIBUTO.VL_IPT_A_RECOLHER'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_ipi_CD_TIPO_DIREITO: TStringField
      FieldName = 'CD_TIPO_DIREITO'
      Origin = 'TRIBUTO.CD_TIPO_DIREITO'
      Size = 1
    end
    object qry_ad_ipi_NR_NOTA_COMPL_TIPI: TStringField
      FieldName = 'NR_NOTA_COMPL_TIPI'
      Origin = 'TRIBUTO.NR_NOTA_COMPL_TIPI'
      Size = 2
    end
  end
  object qry_ad_antidump_: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforePost = qry_ad_antidump_BeforePost
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    DataSource = ds_adicao
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TRIBUTO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = :NR_ADICAO AND'
      'CD_RECEITA_IMPOSTO = '#39'0003'#39)
    UpdateMode = upWhereChanged
    Left = 835
    Top = 450
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_ad_antidump_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TRIBUTO.NR_PROCESSO'
      Size = 18
    end
    object qry_ad_antidump_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TRIBUTO.NR_ADICAO'
      Size = 3
    end
    object qry_ad_antidump_CD_RECEITA_IMPOSTO: TStringField
      FieldName = 'CD_RECEITA_IMPOSTO'
      Origin = 'TRIBUTO.CD_RECEITA_IMPOSTO'
      Size = 4
    end
    object qry_ad_antidump_CD_TIPO_ALIQ_IPT: TStringField
      FieldName = 'CD_TIPO_ALIQ_IPT'
      Origin = 'TRIBUTO.CD_TIPO_ALIQ_IPT'
      Size = 1
    end
    object qry_ad_antidump_VL_BASE_CALC_ADVAL: TFloatField
      FieldName = 'VL_BASE_CALC_ADVAL'
      Origin = 'TRIBUTO.VL_BASE_CALC_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_PC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
      Origin = 'TRIBUTO.PC_ALIQ_NORM_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_VL_CALC_IPT_ADVAL: TFloatField
      FieldName = 'VL_CALC_IPT_ADVAL'
      Origin = 'TRIBUTO.VL_CALC_IPT_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_NM_UN_ALIQ_ESP_IPT: TStringField
      FieldName = 'NM_UN_ALIQ_ESP_IPT'
      Origin = 'TRIBUTO.NM_UN_ALIQ_ESP_IPT'
      Size = 15
    end
    object qry_ad_antidump_CD_TIPO_RECIPIENTE: TStringField
      FieldName = 'CD_TIPO_RECIPIENTE'
      Origin = 'TRIBUTO.CD_TIPO_RECIPIENTE'
      Size = 2
    end
    object qry_ad_antidump_QT_ML_RECIPIENTE: TFloatField
      FieldName = 'QT_ML_RECIPIENTE'
      Origin = 'TRIBUTO.QT_ML_RECIPIENTE'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_QT_MERC_UN_ALIQ_ES: TFloatField
      FieldName = 'QT_MERC_UN_ALIQ_ES'
      Origin = 'TRIBUTO.QT_MERC_UN_ALIQ_ES'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_VL_ALIQ_ESPEC_IPT: TFloatField
      FieldName = 'VL_ALIQ_ESPEC_IPT'
      Origin = 'TRIBUTO.VL_ALIQ_ESPEC_IPT'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_VL_CALC_IPT_ESPEC: TFloatField
      FieldName = 'VL_CALC_IPT_ESPEC'
      Origin = 'TRIBUTO.VL_CALC_IPT_ESPEC'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_CD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      Origin = 'TRIBUTO.CD_TIPO_BENEF_IPI'
      Size = 1
    end
    object qry_ad_antidump_PC_ALIQ_REDUZIDA: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA'
      Origin = 'TRIBUTO.PC_ALIQ_REDUZIDA'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_PC_REDUCAO_IPT_BLI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_BLI'
      Origin = 'TRIBUTO.PC_REDUCAO_IPT_BLI'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_PC_ALIQ_ACOR_TARIF: TFloatField
      FieldName = 'PC_ALIQ_ACOR_TARIF'
      Origin = 'TRIBUTO.PC_ALIQ_ACOR_TARIF'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_VL_CALC_II_AC_TARI: TFloatField
      FieldName = 'VL_CALC_II_AC_TARI'
      Origin = 'TRIBUTO.VL_CALC_II_AC_TARI'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_VL_IMPOSTO_DEVIDO: TFloatField
      FieldName = 'VL_IMPOSTO_DEVIDO'
      Origin = 'TRIBUTO.VL_IMPOSTO_DEVIDO'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_VL_IPT_A_RECOLHER: TFloatField
      FieldName = 'VL_IPT_A_RECOLHER'
      Origin = 'TRIBUTO.VL_IPT_A_RECOLHER'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_antidump_CD_TIPO_DIREITO: TStringField
      FieldName = 'CD_TIPO_DIREITO'
      Origin = 'TRIBUTO.CD_TIPO_DIREITO'
      Size = 1
    end
    object qry_ad_antidump_NR_NOTA_COMPL_TIPI: TStringField
      FieldName = 'NR_NOTA_COMPL_TIPI'
      Origin = 'TRIBUTO.NR_NOTA_COMPL_TIPI'
      Size = 2
    end
  end
  object qry_taxa_cambio_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM   TTAXA_CAMBIO (NOLOCK)'
      'WHERE  CD_MOEDA = :CD_MOEDA AND'
      
        '       :DT_REGISTRO BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VI' +
        'GENCIA')
    UpdateMode = upWhereChanged
    Left = 953
    Top = 419
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_REGISTRO'
        ParamType = ptUnknown
      end>
    object qry_taxa_cambio_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TTAXA_CAMBIO.CD_MOEDA'
      Size = 3
    end
    object qry_taxa_cambio_DT_INICIO_VIGENCIA: TDateTimeField
      FieldName = 'DT_INICIO_VIGENCIA'
      Origin = 'TTAXA_CAMBIO.DT_INICIO_VIGENCIA'
    end
    object qry_taxa_cambio_DT_TERMINO_VIGENCIA: TDateTimeField
      FieldName = 'DT_TERMINO_VIGENCIA'
      Origin = 'TTAXA_CAMBIO.DT_TERMINO_VIGENCIA'
    end
    object qry_taxa_cambio_TX_CAMBIO: TFloatField
      FieldName = 'TX_CAMBIO'
      Origin = 'TTAXA_CAMBIO.TX_CAMBIO'
    end
  end
  object tbl_mot_ad_temp_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TMOT_ADMISSAO_TEMP'
    UpdateMode = upWhereChanged
    Left = 959
    Top = 204
  end
  object ds_mot_ad_temp: TDataSource
    DataSet = tbl_mot_ad_temp_
    Left = 834
    Top = 594
  end
  object qry_abrangencia_nve_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TABRANGENCIA_NVE (NOLOCK)'
      'WHERE DESCRICAO = :DESCRICAO')
    UpdateMode = upWhereChanged
    Left = 592
    Top = 202
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
    object qry_abrangencia_nve_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TABRANGENCIA_NVE.CODIGO'
      Size = 1
    end
    object qry_abrangencia_nve_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TABRANGENCIA_NVE.DESCRICAO'
      Size = 35
    end
  end
  object ds_nivel: TDataSource
    DataSet = qry_nivel_
    Left = 491
    Top = 641
  end
  object qry_nivel_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TAB_NIVEL (NOLOCK)')
    UpdateMode = upWhereChanged
    Left = 591
    Top = 641
    object qry_nivel_CD_NIVEL_NVE: TStringField
      FieldName = 'CD_NIVEL_NVE'
      Origin = 'TAB_NIVEL.CD_NIVEL_NVE'
      Size = 3
    end
    object qry_nivel_NM_NIVEL: TStringField
      FieldName = 'NM_NIVEL'
      Origin = 'TAB_NIVEL.NM_NIVEL'
      Size = 50
    end
  end
  object qry_disp_legal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTP_EXONERACAO (NOLOCK)'
      'ORDER BY'
      'CD_EX'
      '')
    UpdateMode = upWhereChanged
    Left = 287
    Top = 641
    object qry_disp_legal_CD_EX: TStringField
      FieldName = 'CD_EX'
      Origin = 'TTP_EXONERACAO.CD_EX'
      Size = 3
    end
    object qry_disp_legal_NM_EX: TStringField
      FieldName = 'NM_EX'
      Origin = 'TTP_EXONERACAO.NM_EX'
      Size = 30
    end
    object qry_disp_legal_CD_TRIB: TStringField
      FieldName = 'CD_TRIB'
      Origin = 'TTP_EXONERACAO.CD_TRIB'
      Size = 1
    end
    object qry_disp_legal_LookupTributacao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupTributacao'
      LookupDataSet = qry_trat_tribut_
      LookupKeyFields = 'CD_TRAT_TRIB_ICMS'
      LookupResultField = 'NM_TRAT_TRIB_ICMS'
      KeyFields = 'CD_TRIB'
      Lookup = True
    end
    object qry_disp_legal_NM_FUND_LEGAL: TStringField
      FieldName = 'NM_FUND_LEGAL'
      Origin = 'TTP_EXONERACAO.CD_EX'
      Size = 240
    end
  end
  object qry_trat_tribut_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_TRAT_TRIB_ICMS (NOLOCK)')
    UpdateMode = upWhereChanged
    Left = 375
    Top = 641
    object qry_trat_tribut_CD_TRAT_TRIB_ICMS: TStringField
      FieldName = 'CD_TRAT_TRIB_ICMS'
      Origin = 'TTP_TRAT_TRIB_ICMS.CD_TRAT_TRIB_ICMS'
      Size = 1
    end
    object qry_trat_tribut_NM_TRAT_TRIB_ICMS: TStringField
      FieldName = 'NM_TRAT_TRIB_ICMS'
      Origin = 'TTP_TRAT_TRIB_ICMS.NM_TRAT_TRIB_ICMS'
    end
  end
  object sp_atz_tipo_icms: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_tipo_icms'
    Left = 119
    Top = 641
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
      end>
  end
  object qry_Aliquota_GATT: TQuery
    BeforeInsert = qry_adicao_BeforeInsert
    BeforeEdit = qry_adicao_BeforeEdit
    BeforeDelete = qry_adicao_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CASE RTRIM(ISNULL(ALIQUOTA_GATT, '#39#39'))'
      '           WHEN '#39#39' THEN NULL'
      '       ELSE CONVERT(FLOAT, REPLACE(ALIQUOTA_GATT, '#39','#39', '#39'.'#39'))'
      '       END AS ALIQUOTA_GATT'
      'FROM TNCM (NOLOCK)'
      'WHERE CODIGO = :CODIGO')
    UpdateMode = upWhereChanged
    Left = 956
    Top = 370
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_Aliquota_GATTALIQUOTA_GATT: TFloatField
      FieldName = 'ALIQUOTA_GATT'
    end
  end
  object upd_adicao: TUpdateSQL
    ModifySQL.Strings = (
      'update TADICAO_DE_IMPORTACAO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ADICAO = :NR_ADICAO,'
      '  CD_ACORDO_ALADI = :CD_ACORDO_ALADI,'
      '  CD_AGENC_AGENT_IMP = :CD_AGENC_AGENT_IMP,'
      '  CD_APLICACAO_MERC = :CD_APLICACAO_MERC,'
      '  CD_AUSENCIA_FABRIC = :CD_AUSENCIA_FABRIC,'
      '  CD_BANC_AGENTE_IMP = :CD_BANC_AGENTE_IMP,'
      '  CD_COBERT_CAMBIAL = :CD_COBERT_CAMBIAL,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_FORNECEDOR = :CD_FORNECEDOR,'
      '  CD_FUND_LEG_REGIME = :CD_FUND_LEG_REGIME,'
      '  CD_INCOTERMS_VENDA = :CD_INCOTERMS_VENDA,'
      '  CD_LOC_COND_VENDA = :CD_LOC_COND_VENDA,'
      '  CD_MD_FRETE_MERC = :CD_MD_FRETE_MERC,'
      '  CD_MERC_NALADI_NCC = :CD_MERC_NALADI_NCC,'
      '  CD_MERC_NALADI_SH = :CD_MERC_NALADI_SH,'
      '  CD_MERC_NBM_SH = :CD_MERC_NBM_SH,'
      '  CD_NCM_SH = :CD_NCM_SH,'
      '  CD_MERCADORIA_NCM = :CD_MERCADORIA_NCM,'
      '  CD_METOD_VALORACAO = :CD_METOD_VALORACAO,'
      '  CD_MODALIDADE_PGTO = :CD_MODALIDADE_PGTO,'
      '  CD_MOEDA_NEGOCIADA = :CD_MOEDA_NEGOCIADA,'
      '  CD_MOEDA_SEG_MERC = :CD_MOEDA_SEG_MERC,'
      '  CD_MOEDAS_DESPESAS = :CD_MOEDAS_DESPESAS,'
      '  CD_MOTIVO_ADM_TEMP = :CD_MOTIVO_ADM_TEMP,'
      '  CD_MOTIVO_SEM_COB = :CD_MOTIVO_SEM_COB,'
      '  CD_ORGAO_FIN_INTER = :CD_ORGAO_FIN_INTER,'
      '  CD_PAIS_AQUIS_MERC = :CD_PAIS_AQUIS_MERC,'
      '  CD_PAIS_ORIG_MERC = :CD_PAIS_ORIG_MERC,'
      '  CD_PAIS_PROC_MERC = :CD_PAIS_PROC_MERC,'
      '  CD_PERIOD_PGTO_360 = :CD_PERIOD_PGTO_360,'
      '  CD_REGIME_TRIBUTAR = :CD_REGIME_TRIBUTAR,'
      '  CD_TAXA_JUROS = :CD_TAXA_JUROS,'
      '  CD_TIPO_ACORDO_TAR = :CD_TIPO_ACORDO_TAR,'
      '  CD_TIPO_AGENTE_IMP = :CD_TIPO_AGENTE_IMP,'
      '  CD_URF_ENTR_MERC = :CD_URF_ENTR_MERC,'
      '  CD_VIA_TRANSPORTE = :CD_VIA_TRANSPORTE,'
      '  CD_VINC_IMPO_EXPO = :CD_VINC_IMPO_EXPO,'
      '  ED_CIDAD_FABRIC = :ED_CIDAD_FABRIC,'
      '  ED_CIDAD_FORN_ESTR = :ED_CIDAD_FORN_ESTR,'
      '  ED_COMPL_FABRIC = :ED_COMPL_FABRIC,'
      '  ED_COMPL_FORN_ESTR = :ED_COMPL_FORN_ESTR,'
      '  ED_ESTAD_FORN_ESTR = :ED_ESTAD_FORN_ESTR,'
      '  ED_ESTADO_FABRIC = :ED_ESTADO_FABRIC,'
      '  ED_LOGR_FABRIC = :ED_LOGR_FABRIC,'
      '  ED_LOGR_FORN_ESTR = :ED_LOGR_FORN_ESTR,'
      '  ED_NR_FABRIC = :ED_NR_FABRIC,'
      '  ED_NR_FORN_ESTR = :ED_NR_FORN_ESTR,'
      '  IN_BEM_ENCOMENDA = :IN_BEM_ENCOMENDA,'
      '  IN_IPI_NAO_TRIBUT = :IN_IPI_NAO_TRIBUT,'
      '  IN_JUROS_ATE_360 = :IN_JUROS_ATE_360,'
      '  IN_MATERIAL_USADO = :IN_MATERIAL_USADO,'
      '  IN_MULTIMODAL = :IN_MULTIMODAL,'
      '  IN_PGTO_VARIAV_360 = :IN_PGTO_VARIAV_360,'
      '  NM_FABRICANTE_MERC = :NM_FABRICANTE_MERC,'
      '  NM_FORN_ESTR = :NM_FORN_ESTR,'
      '  NR_AGENTE_IMP = :NR_AGENTE_IMP,'
      '  NR_DCTO_REDUCAO = :NR_DCTO_REDUCAO,'
      '  NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV,'
      '  NR_ROF = :NR_ROF,'
      '  PC_COEF_REDUC_II = :PC_COEF_REDUC_II,'
      '  PC_COMISSAO_AG_IMP = :PC_COMISSAO_AG_IMP,'
      '  PC_TAXA_JUROS = :PC_TAXA_JUROS,'
      '  PL_MERCADORIA = :PL_MERCADORIA,'
      '  QT_ITENS_ADICAO = :QT_ITENS_ADICAO,'
      '  QT_PARC_FINANC_360 = :QT_PARC_FINANC_360,'
      '  QT_PERIOD_PGTO_360 = :QT_PERIOD_PGTO_360,'
      '  QT_UN_ESTATISTICA = :QT_UN_ESTATISTICA,'
      '  TX_COMPL_VL_ADUAN = :TX_COMPL_VL_ADUAN,'
      '  VL_ACRESCIMOS_MN = :VL_ACRESCIMOS_MN,'
      '  vl_base_calculo_mn = :vl_base_calculo_mn,'
      '  VL_CALC_DCR_DOLAR = :VL_CALC_DCR_DOLAR,'
      '  VL_COMISSAO_AG_IMP = :VL_COMISSAO_AG_IMP,'
      '  VL_DEDUCOES_MN = :VL_DEDUCOES_MN,'
      '  VL_DESPESAS_MN = :VL_DESPESAS_MN,'
      '  VL_DESPESAS_MNEG = :VL_DESPESAS_MNEG,'
      '  VL_FINANC_SUP_360 = :VL_FINANC_SUP_360,'
      '  VL_FRETE_MERC_MN = :VL_FRETE_MERC_MN,'
      '  VL_FRETE_MERC_MNEG = :VL_FRETE_MERC_MNEG,'
      '  VL_II_A_REC_ZFM = :VL_II_A_REC_ZFM,'
      '  VL_II_CALC_DCR_MN = :VL_II_CALC_DCR_MN,'
      '  VL_II_DEVIDO_ZFM = :VL_II_DEVIDO_ZFM,'
      '  VL_MERC_COND_VENDA = :VL_MERC_COND_VENDA,'
      '  VL_MERC_EMB_MN = :VL_MERC_EMB_MN,'
      '  vl_merc_loc_emb_mn = :vl_merc_loc_emb_mn,'
      '  VL_MERC_VENDA_MN = :VL_MERC_VENDA_MN,'
      '  VL_SEG_MERC_MN = :VL_SEG_MERC_MN,'
      '  VL_SEG_MERC_MNEG = :VL_SEG_MERC_MNEG,'
      '  VL_TOT_FINANC_360 = :VL_TOT_FINANC_360,'
      '  VL_UNID_LOC_EMP = :VL_UNID_LOC_EMP,'
      '  IN_ADICAO_CALCULADA = :IN_ADICAO_CALCULADA,'
      '  PC_ICMS = :PC_ICMS,'
      '  PC_REDUCAO_ICMS = :PC_REDUCAO_ICMS,'
      '  VL_ICMS_CALCULADO = :VL_ICMS_CALCULADO,'
      '  VL_ICMS_A_RECOLHER = :VL_ICMS_A_RECOLHER,'
      '  vl_merc_loc_emb_mneg = :vl_merc_loc_emb_mneg,'
      '  CD_MOEDA_MLE = :CD_MOEDA_MLE,'
      '  TX_MLE = :TX_MLE,'
      '  TX_FRETE = :TX_FRETE,'
      '  TX_SEGURO = :TX_SEGURO,'
      '  TX_DOLAR = :TX_DOLAR,'
      '  CD_TRIBUTACAO_ICMS = :CD_TRIBUTACAO_ICMS,'
      '  CD_FUND_LEGAL_ICMS = :CD_FUND_LEGAL_ICMS,'
      '  VL_DESPESAS = :VL_DESPESAS,'
      '  VL_BASE_CALC_II = :VL_BASE_CALC_II,'
      '  VL_BASE_CALC_IPI = :VL_BASE_CALC_IPI,'
      '  VL_BASE_CALC_ICMS = :VL_BASE_CALC_ICMS,'
      '  NR_DESTAQUE_NCM = :NR_DESTAQUE_NCM,'
      '  NR_ATO_DRAWBACK = :NR_ATO_DRAWBACK,'
      '  VL_TX_SCX_AD = :VL_TX_SCX_AD,'
      '  ALIQ_PIS = :ALIQ_PIS,'
      '  ALIQ_COFINS = :ALIQ_COFINS,'
      '  VL_BASE_PIS = :VL_BASE_PIS,'
      '  VL_PIS = :VL_PIS,'
      '  VL_COFINS = :VL_COFINS,'
      '  TX_PIS_COFINS = :TX_PIS_COFINS,'
      '  CD_TIPO_BENEF_PIS_COFINS = :CD_TIPO_BENEF_PIS_COFINS,'
      '  PC_REDUCAO_PIS_COFINS = :PC_REDUCAO_PIS_COFINS,'
      '  IN_MANUAL_NCM = :IN_MANUAL_NCM,'
      '  CD_CFOP = :CD_CFOP,'
      '  PC_REDUCAO_IPT_II = :PC_REDUCAO_IPT_II,'
      '  PC_REDUCAO_IPT_IPI = :PC_REDUCAO_IPT_IPI,'
      '  PB_MERCADORIA = :PB_MERCADORIA,'
      '  IN_PERMITE_CAT63 = :IN_PERMITE_CAT63,'
      '  CD_FUND_LEGAL_PISCOFINS = :CD_FUND_LEGAL_PISCOFINS,'
      '  VL_BASE_CALC_ICMS_AFRMM = :VL_BASE_CALC_ICMS_AFRMM,'
      '  VL_ICMS_A_RECOLHER_AFRMM = :VL_ICMS_A_RECOLHER_AFRMM,'
      '  VL_ICMS_DEVIDO_AFRMM = :VL_ICMS_DEVIDO_AFRMM,'
      '  IN_FUNDO_POBREZA = :IN_FUNDO_POBREZA,'
      '  QT_MESES_ADM_TEMP = :QT_MESES_ADM_TEMP,'
      '  VL_PIS_CALCULADO = :VL_PIS_CALCULADO,'
      '  VL_COFINS_CALCULADO = :VL_COFINS_CALCULADO,'
      '  VL_ALIQUOTA_ESPECIFICA_PIS = :VL_ALIQUOTA_ESPECIFICA_PIS,'
      
        '  VL_ALIQUOTA_ESPECIFICA_COFINS = :VL_ALIQUOTA_ESPECIFICA_COFINS' +
        ','
      '  QTD_UNID_ESPECIFICA_PIS = :QTD_UNID_ESPECIFICA_PIS,'
      '  QTD_UNID_ESPECIFICA_COFINS = :QTD_UNID_ESPECIFICA_COFINS,'
      '  CD_UNIDADE_MEDIDA_PIS = :CD_UNIDADE_MEDIDA_PIS,'
      '  CD_UNIDADE_MEDIDA_COFINS = :CD_UNIDADE_MEDIDA_COFINS,'
      '  IN_SUSPENDE_II_RETIFIC = :IN_SUSPENDE_II_RETIFIC,'
      '  IN_SUSPENDE_IPI_RETIFIC = :IN_SUSPENDE_IPI_RETIFIC,'
      
        '  IN_SUSPENDE_PIS_COFINS_RETIFIC = :IN_SUSPENDE_PIS_COFINS_RETIF' +
        'IC,'
      '  VL_AFRMM = :VL_AFRMM,'
      '  ALIQ_PIS_REDUZIDA = :ALIQ_PIS_REDUZIDA,'
      '  ALIQ_COFINS_REDUZIDA = :ALIQ_COFINS_REDUZIDA,'
      '  VL_MULTA_II = :VL_MULTA_II,'
      '  VL_JUROS_II = :VL_JUROS_II,'
      '  VL_MULTA_IPI = :VL_MULTA_IPI,'
      '  VL_JUROS_IPI = :VL_JUROS_IPI,'
      '  VL_MULTA_PIS = :VL_MULTA_PIS,'
      '  VL_JUROS_PIS = :VL_JUROS_PIS,'
      '  VL_MULTA_COFINS = :VL_MULTA_COFINS,'
      '  VL_JUROS_COFINS = :VL_JUROS_COFINS,'
      '  CD_TP_PGMTO_AFRMM      = :CD_TP_PGMTO_AFRMM ,   '
      '  CD_TP_ISENCAO          = :CD_TP_ISENCAO ,       '
      '  CD_TP_SUSPENSAO        = :CD_TP_SUSPENSAO ,      '
      '  NR_PARCELA_ENTREPOSTO  = :NR_PARCELA_ENTREPOSTO,'
      '  DT_VENCIMENTO_SUSPENSAO = :DT_VENCIMENTO_SUSPENSAO,'
      '  NR_ATO_CONCESSORIO = :NR_ATO_CONCESSORIO,'
      '  CD_FUND_LEGAL_II_DUIMP = :CD_FUND_LEGAL_II_DUIMP,'
      '  CD_FUND_LEGAL_IPI_DUIMP = :CD_FUND_LEGAL_IPI_DUIMP,'
      
        '  CD_FUND_LEGAL_PISCOFINS_DUIMP = :CD_FUND_LEGAL_PISCOFINS_DUIMP' +
        ','
      '  VL_IS = :VL_IS, '
      '  VL_CIDE = :VL_CIDE, '
      '  VL_DIR_COMP = :VL_DIR_COMP, '
      '  VL_MED_SAL = :VL_MED_SAL, '
      '  VL_OUTROS_TRIB = :VL_OUTROS_TRIB, '
      '  ALIQ_IBS_UF = :ALIQ_IBS_UF, '
      '  ALIQ_IBS_MUN = :ALIQ_IBS_MUN, '
      '  ALIQ_CBS = :ALIQ_CBS, '
      '  VL_IBS_MUN = :VL_IBS_MUN,'
      '  VL_IBS_UF = :VL_IBS_UF, '
      '  VL_CBS = :VL_CBS, '
      '  VL_BASE_IBS_CBS = :VL_BASE_IBS_CBS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO')
    InsertSQL.Strings = (
      'insert into TADICAO_DE_IMPORTACAO'
      
        '  (NR_PROCESSO, NR_ADICAO, CD_ACORDO_ALADI, CD_AGENC_AGENT_IMP, ' +
        'CD_APLICACAO_MERC, '
      
        '   CD_AUSENCIA_FABRIC, CD_BANC_AGENTE_IMP, CD_COBERT_CAMBIAL, CD' +
        '_FABRICANTE, '
      
        '   CD_FORNECEDOR, CD_FUND_LEG_REGIME, CD_INCOTERMS_VENDA, CD_LOC' +
        '_COND_VENDA, '
      
        '   CD_MD_FRETE_MERC, CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, CD_M' +
        'ERC_NBM_SH, '
      
        '   CD_NCM_SH, CD_MERCADORIA_NCM, CD_METOD_VALORACAO, CD_MODALIDA' +
        'DE_PGTO, '
      
        '   CD_MOEDA_NEGOCIADA, CD_MOEDA_SEG_MERC, CD_MOEDAS_DESPESAS, CD' +
        '_MOTIVO_ADM_TEMP, '
      
        '   CD_MOTIVO_SEM_COB, CD_ORGAO_FIN_INTER, CD_PAIS_AQUIS_MERC, CD' +
        '_PAIS_ORIG_MERC, '
      
        '   CD_PAIS_PROC_MERC, CD_PERIOD_PGTO_360, CD_REGIME_TRIBUTAR, CD' +
        '_TAXA_JUROS, '
      
        '   CD_TIPO_ACORDO_TAR, CD_TIPO_AGENTE_IMP, CD_URF_ENTR_MERC, CD_' +
        'VIA_TRANSPORTE, '
      
        '   CD_VINC_IMPO_EXPO, ED_CIDAD_FABRIC, ED_CIDAD_FORN_ESTR, ED_CO' +
        'MPL_FABRIC, '
      
        '   ED_COMPL_FORN_ESTR, ED_ESTAD_FORN_ESTR, ED_ESTADO_FABRIC, ED_' +
        'LOGR_FABRIC, '
      
        '   ED_LOGR_FORN_ESTR, ED_NR_FABRIC, ED_NR_FORN_ESTR, IN_BEM_ENCO' +
        'MENDA, '
      
        '   IN_IPI_NAO_TRIBUT, IN_JUROS_ATE_360, IN_MATERIAL_USADO, IN_MU' +
        'LTIMODAL, '
      
        '   IN_PGTO_VARIAV_360, NM_FABRICANTE_MERC, NM_FORN_ESTR, NR_AGEN' +
        'TE_IMP, '
      
        '   NR_DCTO_REDUCAO, NR_OPER_TRAT_PREV, NR_ROF, PC_COEF_REDUC_II,' +
        ' PC_COMISSAO_AG_IMP, '
      
        '   PC_TAXA_JUROS, PL_MERCADORIA, QT_ITENS_ADICAO, QT_PARC_FINANC' +
        '_360, QT_PERIOD_PGTO_360, '
      
        '   QT_UN_ESTATISTICA, TX_COMPL_VL_ADUAN, VL_ACRESCIMOS_MN, vl_ba' +
        'se_calculo_mn, '
      
        '   VL_CALC_DCR_DOLAR, VL_COMISSAO_AG_IMP, VL_DEDUCOES_MN, VL_DES' +
        'PESAS_MN, '
      
        '   VL_DESPESAS_MNEG, VL_FINANC_SUP_360, VL_FRETE_MERC_MN, VL_FRE' +
        'TE_MERC_MNEG, '
      
        '   VL_II_A_REC_ZFM, VL_II_CALC_DCR_MN, VL_II_DEVIDO_ZFM, VL_MERC' +
        '_COND_VENDA, '
      
        '   VL_MERC_EMB_MN, vl_merc_loc_emb_mn, VL_MERC_VENDA_MN, VL_SEG_' +
        'MERC_MN, '
      
        '   VL_SEG_MERC_MNEG, VL_TOT_FINANC_360, VL_UNID_LOC_EMP, IN_ADIC' +
        'AO_CALCULADA, '
      
        '   PC_ICMS, PC_REDUCAO_ICMS, VL_ICMS_CALCULADO, VL_ICMS_A_RECOLH' +
        'ER, vl_merc_loc_emb_mneg, '
      
        '   CD_MOEDA_MLE, TX_MLE, TX_FRETE, TX_SEGURO, TX_DOLAR, CD_TRIBU' +
        'TACAO_ICMS, '
      
        '   CD_FUND_LEGAL_ICMS, VL_DESPESAS, VL_BASE_CALC_II, VL_BASE_CAL' +
        'C_IPI, '
      
        '   VL_BASE_CALC_ICMS, NR_DESTAQUE_NCM, NR_ATO_DRAWBACK, VL_TX_SC' +
        'X_AD, ALIQ_PIS, '
      
        '   ALIQ_COFINS, VL_BASE_PIS, VL_PIS, VL_COFINS, TX_PIS_COFINS, C' +
        'D_TIPO_BENEF_PIS_COFINS, '
      
        '   PC_REDUCAO_PIS_COFINS, IN_MANUAL_NCM, CD_CFOP, PC_REDUCAO_IPT' +
        '_II, PC_REDUCAO_IPT_IPI, '
      
        '   PB_MERCADORIA, IN_PERMITE_CAT63, CD_FUND_LEGAL_PISCOFINS, VL_' +
        'BASE_CALC_ICMS_AFRMM, '
      
        '   VL_ICMS_A_RECOLHER_AFRMM, VL_ICMS_DEVIDO_AFRMM, IN_FUNDO_POBR' +
        'EZA, QT_MESES_ADM_TEMP, '
      
        '   VL_PIS_CALCULADO, VL_COFINS_CALCULADO, VL_ALIQUOTA_ESPECIFICA' +
        '_PIS, VL_ALIQUOTA_ESPECIFICA_COFINS, '
      
        '   QTD_UNID_ESPECIFICA_PIS, QTD_UNID_ESPECIFICA_COFINS, CD_UNIDA' +
        'DE_MEDIDA_PIS, '
      
        '   CD_UNIDADE_MEDIDA_COFINS, IN_SUSPENDE_II_RETIFIC, IN_SUSPENDE' +
        '_IPI_RETIFIC, '
      
        '   IN_SUSPENDE_PIS_COFINS_RETIFIC, VL_AFRMM, ALIQ_PIS_REDUZIDA, ' +
        'ALIQ_COFINS_REDUZIDA, '
      
        '   VL_MULTA_II, VL_JUROS_II, VL_MULTA_IPI, VL_JUROS_IPI, VL_MULT' +
        'A_PIS, '
      
        '   VL_JUROS_PIS, VL_MULTA_COFINS, VL_JUROS_COFINS ,CD_TP_PGMTO_A' +
        'FRMM  ,'
      
        '   CD_TP_ISENCAO ,CD_TP_SUSPENSAO ,NR_PARCELA_ENTREPOSTO, DT_VEN' +
        'CIMENTO_SUSPENSAO, NR_ATO_CONCESSORIO, '
      
        '   CD_FUND_LEGAL_II_DUIMP, CD_FUND_LEGAL_IPI_DUIMP, CD_FUND_LEGA' +
        'L_PISCOFINS_DUIMP,'
      
        '  VL_IS, VL_CIDE, VL_DIR_COMP, VL_MED_SAL, VL_OUTROS_TRIB, ALIQ_' +
        'IBS_UF, ALIQ_IBS_MUN, ALIQ_CBS, '
      '  VL_IBS_MUN,VL_IBS_UF , VL_CBS, VL_BASE_IBS_CBS'
      ')'
      'values'
      
        '  (:NR_PROCESSO, :NR_ADICAO, :CD_ACORDO_ALADI, :CD_AGENC_AGENT_I' +
        'MP, :CD_APLICACAO_MERC, '
      
        '   :CD_AUSENCIA_FABRIC, :CD_BANC_AGENTE_IMP, :CD_COBERT_CAMBIAL,' +
        ' :CD_FABRICANTE, '
      
        '   :CD_FORNECEDOR, :CD_FUND_LEG_REGIME, :CD_INCOTERMS_VENDA, :CD' +
        '_LOC_COND_VENDA, '
      
        '   :CD_MD_FRETE_MERC, :CD_MERC_NALADI_NCC, :CD_MERC_NALADI_SH, :' +
        'CD_MERC_NBM_SH, '
      
        '   :CD_NCM_SH, :CD_MERCADORIA_NCM, :CD_METOD_VALORACAO, :CD_MODA' +
        'LIDADE_PGTO, '
      
        '   :CD_MOEDA_NEGOCIADA, :CD_MOEDA_SEG_MERC, :CD_MOEDAS_DESPESAS,' +
        ' :CD_MOTIVO_ADM_TEMP, '
      
        '   :CD_MOTIVO_SEM_COB, :CD_ORGAO_FIN_INTER, :CD_PAIS_AQUIS_MERC,' +
        ' :CD_PAIS_ORIG_MERC, '
      
        '   :CD_PAIS_PROC_MERC, :CD_PERIOD_PGTO_360, :CD_REGIME_TRIBUTAR,' +
        ' :CD_TAXA_JUROS, '
      
        '   :CD_TIPO_ACORDO_TAR, :CD_TIPO_AGENTE_IMP, :CD_URF_ENTR_MERC, ' +
        ':CD_VIA_TRANSPORTE, '
      
        '   :CD_VINC_IMPO_EXPO, :ED_CIDAD_FABRIC, :ED_CIDAD_FORN_ESTR, :E' +
        'D_COMPL_FABRIC, '
      
        '   :ED_COMPL_FORN_ESTR, :ED_ESTAD_FORN_ESTR, :ED_ESTADO_FABRIC, ' +
        ':ED_LOGR_FABRIC, '
      
        '   :ED_LOGR_FORN_ESTR, :ED_NR_FABRIC, :ED_NR_FORN_ESTR, :IN_BEM_' +
        'ENCOMENDA, '
      
        '   :IN_IPI_NAO_TRIBUT, :IN_JUROS_ATE_360, :IN_MATERIAL_USADO, :I' +
        'N_MULTIMODAL, '
      
        '   :IN_PGTO_VARIAV_360, :NM_FABRICANTE_MERC, :NM_FORN_ESTR, :NR_' +
        'AGENTE_IMP, '
      
        '   :NR_DCTO_REDUCAO, :NR_OPER_TRAT_PREV, :NR_ROF, :PC_COEF_REDUC' +
        '_II, :PC_COMISSAO_AG_IMP, '
      
        '   :PC_TAXA_JUROS, :PL_MERCADORIA, :QT_ITENS_ADICAO, :QT_PARC_FI' +
        'NANC_360, '
      
        '   :QT_PERIOD_PGTO_360, :QT_UN_ESTATISTICA, :TX_COMPL_VL_ADUAN, ' +
        ':VL_ACRESCIMOS_MN, '
      
        '   :vl_base_calculo_mn, :VL_CALC_DCR_DOLAR, :VL_COMISSAO_AG_IMP,' +
        ' :VL_DEDUCOES_MN, '
      
        '   :VL_DESPESAS_MN, :VL_DESPESAS_MNEG, :VL_FINANC_SUP_360, :VL_F' +
        'RETE_MERC_MN, '
      
        '   :VL_FRETE_MERC_MNEG, :VL_II_A_REC_ZFM, :VL_II_CALC_DCR_MN, :V' +
        'L_II_DEVIDO_ZFM, '
      
        '   :VL_MERC_COND_VENDA, :VL_MERC_EMB_MN, :vl_merc_loc_emb_mn, :V' +
        'L_MERC_VENDA_MN, '
      
        '   :VL_SEG_MERC_MN, :VL_SEG_MERC_MNEG, :VL_TOT_FINANC_360, :VL_U' +
        'NID_LOC_EMP, '
      
        '   :IN_ADICAO_CALCULADA, :PC_ICMS, :PC_REDUCAO_ICMS, :VL_ICMS_CA' +
        'LCULADO, '
      
        '   :VL_ICMS_A_RECOLHER, :vl_merc_loc_emb_mneg, :CD_MOEDA_MLE, :T' +
        'X_MLE, '
      
        '   :TX_FRETE, :TX_SEGURO, :TX_DOLAR, :CD_TRIBUTACAO_ICMS, :CD_FU' +
        'ND_LEGAL_ICMS, '
      
        '   :VL_DESPESAS, :VL_BASE_CALC_II, :VL_BASE_CALC_IPI, :VL_BASE_C' +
        'ALC_ICMS, '
      
        '   :NR_DESTAQUE_NCM, :NR_ATO_DRAWBACK, :VL_TX_SCX_AD, :ALIQ_PIS,' +
        ' :ALIQ_COFINS, '
      
        '   :VL_BASE_PIS, :VL_PIS, :VL_COFINS, :TX_PIS_COFINS, :CD_TIPO_B' +
        'ENEF_PIS_COFINS, '
      
        '   :PC_REDUCAO_PIS_COFINS, :IN_MANUAL_NCM, :CD_CFOP, :PC_REDUCAO' +
        '_IPT_II, '
      
        '   :PC_REDUCAO_IPT_IPI, :PB_MERCADORIA, :IN_PERMITE_CAT63, :CD_F' +
        'UND_LEGAL_PISCOFINS, '
      
        '   :VL_BASE_CALC_ICMS_AFRMM, :VL_ICMS_A_RECOLHER_AFRMM, :VL_ICMS' +
        '_DEVIDO_AFRMM, '
      
        '   :IN_FUNDO_POBREZA, :QT_MESES_ADM_TEMP, :VL_PIS_CALCULADO, :VL' +
        '_COFINS_CALCULADO, '
      
        '   :VL_ALIQUOTA_ESPECIFICA_PIS, :VL_ALIQUOTA_ESPECIFICA_COFINS, ' +
        ':QTD_UNID_ESPECIFICA_PIS, '
      
        '   :QTD_UNID_ESPECIFICA_COFINS, :CD_UNIDADE_MEDIDA_PIS, :CD_UNID' +
        'ADE_MEDIDA_COFINS, '
      
        '   :IN_SUSPENDE_II_RETIFIC, :IN_SUSPENDE_IPI_RETIFIC, :IN_SUSPEN' +
        'DE_PIS_COFINS_RETIFIC, '
      
        '   :VL_AFRMM, :ALIQ_PIS_REDUZIDA, :ALIQ_COFINS_REDUZIDA, :VL_MUL' +
        'TA_II, '
      
        '   :VL_JUROS_II, :VL_MULTA_IPI, :VL_JUROS_IPI, :VL_MULTA_PIS, :V' +
        'L_JUROS_PIS, '
      '   :VL_MULTA_COFINS, :VL_JUROS_COFINS, :CD_TP_PGMTO_AFRMM  ,'
      
        '   :CD_TP_ISENCAO ,:CD_TP_SUSPENSAO  ,:NR_PARCELA_ENTREPOSTO, :D' +
        'T_VENCIMENTO_SUSPENSAO,NR_ATO_CONCESSORIO,'
      
        '   :CD_FUND_LEGAL_II_DUIMP,:CD_FUND_LEGAL_IPI_DUIMP,:CD_FUND_LEG' +
        'AL_PISCOFINS_DUIMP,'
      
        '   :VL_IS, :VL_CIDE, :VL_DIR_COMP, :VL_MED_SAL, :VL_OUTROS_TRIB,' +
        ' :ALIQ_IBS_UF, :ALIQ_IBS_MUN, :ALIQ_CBS, '
      '   :VL_IBS_MUN, :VL_IBS_UF , :VL_CBS, :VL_BASE_IBS_CBS'
      ')')
    DeleteSQL.Strings = (
      'delete from TADICAO_DE_IMPORTACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO')
    Left = 184
    Top = 56
  end
  object upd_di: TUpdateSQL
    ModifySQL.Strings = (
      'update TDECLARACAO_IMPORTACAO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  QT_ADICOES = :QT_ADICOES,'
      '  CD_MOEDA_MLE = :CD_MOEDA_MLE,'
      '  DT_ULTIMA_ALTERACAO = :DT_ULTIMA_ALTERACAO,'
      '  IN_RISC_ATUALIZADO = :IN_RISC_ATUALIZADO,'
      '  CD_URF_DESPACHO = :CD_URF_DESPACHO,'
      '  CD_RECINTO_ALFAND = :CD_RECINTO_ALFAND,'
      '  CD_TIPO_DECLARACAO = :CD_TIPO_DECLARACAO,'
      '  DT_REGISTRO_DI = :DT_REGISTRO_DI,'
      '  IN_MOEDA_UNICA = :IN_MOEDA_UNICA,'
      '  IN_FMA = :IN_FMA,'
      '  DT_PAGAMENTO_DARF = :DT_PAGAMENTO_DARF'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TDECLARACAO_IMPORTACAO'
      
        '  (NR_PROCESSO, QT_ADICOES, CD_MOEDA_MLE, DT_ULTIMA_ALTERACAO, I' +
        'N_RISC_ATUALIZADO, '
      
        '   CD_URF_DESPACHO, CD_RECINTO_ALFAND, CD_TIPO_DECLARACAO, DT_RE' +
        'GISTRO_DI, '
      '   IN_MOEDA_UNICA, IN_FMA, DT_PAGAMENTO_DARF)'
      'values'
      
        '  (:NR_PROCESSO, :QT_ADICOES, :CD_MOEDA_MLE, :DT_ULTIMA_ALTERACA' +
        'O, :IN_RISC_ATUALIZADO, '
      
        '   :CD_URF_DESPACHO, :CD_RECINTO_ALFAND, :CD_TIPO_DECLARACAO, :D' +
        'T_REGISTRO_DI, '
      '   :IN_MOEDA_UNICA, :IN_FMA, :DT_PAGAMENTO_DARF)')
    DeleteSQL.Strings = (
      'delete from TDECLARACAO_IMPORTACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 184
    Top = 8
  end
  object tbl_TTP_ISENCAO_AFRMM: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TP_ISENCAO'
    ReadOnly = True
    TableName = 'TTP_ISENCAO_AFRMM'
    UpdateMode = upWhereChanged
    Left = 961
    Top = 481
  end
  object tbl_TTP_SUSPENSAO_AFRMM: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TP_SUSPENSAO'
    ReadOnly = True
    TableName = 'TTP_SUSPENSAO_AFRMM'
    UpdateMode = upWhereChanged
    Left = 963
    Top = 532
  end
  object qryValidaViaTransp: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT E.CD_VIA_TRANSPORTE '
      '  FROM TPROCESSO            A (NOLOCK)'
      
        '  JOIN TGRUPO               B (NOLOCK) ON B.CD_GRUPO     = A.CD_' +
        'GRUPO'
      
        '  LEFT JOIN TSERVICO        C (NOLOCK) ON C.CD_SERVICO   = A.CD_' +
        'SERVICO'
      
        '                                      AND B.DT_NOVO_FOLLOWUP_IMP' +
        ' IS NULL'
      
        '  LEFT JOIN TSERVICO_NOVO   D (NOLOCK) ON D.CD_SERVICO   = A.CD_' +
        'SERVICO'
      
        '                                      AND B.DT_NOVO_FOLLOWUP_IMP' +
        ' IS NOT NULL'
      
        '  LEFT JOIN TVIA_TRANSPORTE E (NOLOCK) ON E.CD_VIA_TRANSPORTE = ' +
        'ISNULL(D.CD_VIA_TRANSPORTE, B.CD_VIA_TRANSP_CC)'
      'WHERE E.CD_VIA_TRANSPORTE = '#39'01'#39
      '  AND A.NR_PROCESSO = :nr_processo'
      '                                    ')
    Left = 187
    Top = 126
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptInput
        Size = 18
      end>
  end
  object tblFundLegalIIDuimp: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TFUNDAMENTO_LEGAL_pucomex'
    UpdateMode = upWhereChanged
    Left = 709
    Top = 697
  end
  object tblFundLegalIPIDuimp: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TFUNDAMENTO_LEGAL_pucomex'
    UpdateMode = upWhereChanged
    Left = 833
    Top = 697
  end
  object tblFundLegalPisCofinsDuimp: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TFUNDAMENTO_LEGAL_pucomex'
    UpdateMode = upWhereChanged
    Left = 958
    Top = 697
  end
end
