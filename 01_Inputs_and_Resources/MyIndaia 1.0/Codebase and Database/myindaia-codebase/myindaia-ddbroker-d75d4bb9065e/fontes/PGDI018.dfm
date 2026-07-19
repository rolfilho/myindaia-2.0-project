object datm_DI_Capa: Tdatm_DI_Capa
  OldCreateOrder = True
  Left = 302
  Top = 18
  Height = 709
  Width = 852
  object ds_di_doc_instr_emb: TDataSource
    DataSet = tbl_di_doc_instr_emb_
    Left = 36
    Top = 60
  end
  object tbl_di_doc_instr_emb_: TTable
    BeforeInsert = qry_di_BeforeInsert
    BeforeEdit = qry_di_BeforeEdit
    BeforePost = tbl_di_doc_instr_emb_BeforePost
    AfterPost = tbl_di_doc_instr_emb_AfterPost
    BeforeDelete = qry_di_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TDOCUMENTO_INSTRUCAO'
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 60
    object tbl_di_doc_instr_emb_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
    end
    object tbl_di_doc_instr_emb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_di_doc_instr_emb_CD_TIPO_DCTO_INSTR: TStringField
      FieldName = 'CD_TIPO_DCTO_INSTR'
      Size = 2
    end
    object tbl_di_doc_instr_emb_NR_DCTO_INSTRUCAO: TStringField
      DisplayLabel = 'Identifica'#231#227'o'
      FieldName = 'NR_DCTO_INSTRUCAO'
      Size = 25
    end
    object tbl_di_doc_instr_emb_Look_Doc_Instr_Emb: TStringField
      DisplayLabel = 'Denomina'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'Look_Doc_Instr_Emb'
      LookupDataSet = tbl_doc_instr_emb_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_TIPO_DCTO_INSTR'
      Size = 40
      Lookup = True
    end
    object tbl_di_doc_instr_emb_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
    end
    object tbl_di_doc_instr_emb_CD_COND_VENDA_ENT: TStringField
      FieldName = 'CD_COND_VENDA_ENT'
      FixedChar = True
      Size = 1
    end
    object tbl_di_doc_instr_emb_NR_DIAS: TIntegerField
      FieldName = 'NR_DIAS'
    end
    object tbl_di_doc_instr_emb_DT_VENCTO_FATURA: TDateTimeField
      FieldName = 'DT_VENCTO_FATURA'
    end
    object tbl_di_doc_instr_emb_DT_VENCTO_EADI: TDateTimeField
      FieldName = 'DT_VENCTO_EADI'
    end
    object tbl_di_doc_instr_emb_DT_VENCTO_NAC: TDateTimeField
      FieldName = 'DT_VENCTO_NAC'
    end
    object tbl_di_doc_instr_emb_IN_AVISO_EADI: TStringField
      FieldName = 'IN_AVISO_EADI'
      FixedChar = True
      Size = 2
    end
    object tbl_di_doc_instr_emb_IN_ABERTURA_PROC: TStringField
      FieldName = 'IN_ABERTURA_PROC'
      FixedChar = True
      Size = 1
    end
  end
  object ds_di_proc_vinc: TDataSource
    DataSet = tbl_di_proc_vinc_
    Left = 36
    Top = 105
  end
  object tbl_di_proc_vinc_: TTable
    BeforeInsert = qry_di_BeforeInsert
    BeforeEdit = qry_di_BeforeEdit
    BeforePost = tbl_di_proc_vinc_BeforePost
    AfterPost = tbl_di_proc_vinc_AfterPost
    BeforeDelete = qry_di_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TPROCESSO_DI'
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 105
    object tbl_di_proc_vinc_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
    end
    object tbl_di_proc_vinc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_di_proc_vinc_CD_TIPO_PROCESSO: TStringField
      FieldName = 'CD_TIPO_PROCESSO'
      Size = 1
    end
    object tbl_di_proc_vinc_NR_PROCESSO_INSTR: TStringField
      DisplayLabel = 'Identifica'#231#227'o'
      FieldName = 'NR_PROCESSO_INSTR'
    end
    object tbl_di_proc_vinc_Look_Proc_Vinc: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkLookup
      FieldName = 'Look_Proc_Vinc'
      LookupDataSet = tbl_proc_vinc_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_TIPO_PROCESSO'
      Size = 30
      Lookup = True
    end
  end
  object ds_di_armazem: TDataSource
    DataSet = tbl_di_armazem_
    Left = 36
    Top = 150
  end
  object tbl_di_armazem_: TTable
    BeforeInsert = qry_di_BeforeInsert
    BeforeEdit = qry_di_BeforeEdit
    BeforePost = tbl_di_armazem_BeforePost
    AfterPost = tbl_di_armazem_AfterPost
    BeforeDelete = qry_di_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TCARGA_ARMAZEM'
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 150
    object tbl_di_armazem_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
    end
    object tbl_di_armazem_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_di_armazem_NM_ARMAZEM_CARGA: TStringField
      DisplayLabel = 'Armaz'#233'm'
      FieldName = 'NM_ARMAZEM_CARGA'
      Size = 10
    end
  end
  object tbl_di_volumes_: TTable
    BeforeInsert = qry_di_BeforeInsert
    BeforeEdit = qry_di_BeforeEdit
    BeforePost = tbl_di_volumes_BeforePost
    AfterPost = tbl_di_volumes_AfterPost
    BeforeDelete = qry_di_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TEMBALAGEM_CARGA'
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 194
    object tbl_di_volumes_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
    end
    object tbl_di_volumes_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_di_volumes_CD_TIPO_EMBALAGEM: TStringField
      FieldName = 'CD_TIPO_EMBALAGEM'
      Size = 2
    end
    object tbl_di_volumes_QT_VOLUME_CARGA: TStringField
      DisplayLabel = 'Quantidade'
      FieldName = 'QT_VOLUME_CARGA'
      OnChange = tbl_di_volumes_QT_VOLUME_CARGAChange
      EditMask = '99999;1;_'
      Size = 5
    end
    object tbl_di_volumes_Look_Embalagem: TStringField
      DisplayLabel = 'Embalagem'
      FieldKind = fkLookup
      FieldName = 'Look_Embalagem'
      LookupDataSet = tbl_embalagens_
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CD_TIPO_EMBALAGEM'
      Size = 120
      Lookup = True
    end
  end
  object ds_di_volumes: TDataSource
    DataSet = tbl_di_volumes_
    Left = 36
    Top = 194
  end
  object tbl_di_darf_: TTable
    BeforeInsert = qry_di_BeforeInsert
    BeforeEdit = qry_di_BeforeEdit
    BeforePost = tbl_di_darf_BeforePost
    AfterPost = tbl_di_darf_AfterPost
    BeforeDelete = qry_di_BeforeDelete
    OnCalcFields = tbl_di_darf_CalcFields
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TPAGAMENTO_TRIBUTOS'
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 242
    object tbl_di_darf_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_di_darf_CD_RECEITA_PGTO: TStringField
      DisplayLabel = 'Receita'
      FieldName = 'CD_RECEITA_PGTO'
      Size = 4
    end
    object tbl_di_darf_CD_BANCO_PGTO_TRIB: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'CD_BANCO_PGTO_TRIB'
      Size = 3
    end
    object tbl_di_darf_NR_AGENC_PGTO_TRIB: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'NR_AGENC_PGTO_TRIB'
      Size = 5
    end
    object tbl_di_darf_VL_TRIBUTO_PAGO: TFloatField
      DisplayLabel = 'Valor Total (R$)'
      FieldName = 'VL_TRIBUTO_PAGO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object tbl_di_darf_DT_PGTO_TRIBUTO: TStringField
      DisplayLabel = 'Data Pagamento'
      FieldName = 'DT_PGTO_TRIBUTO'
      EditMask = '!99/99/9999;0; '
      Size = 8
    end
    object tbl_di_darf_VL_MULTA_PGTO_TRIB: TFloatField
      FieldName = 'VL_MULTA_PGTO_TRIB'
    end
    object tbl_di_darf_VL_JUROS_PGTO_TRIB: TFloatField
      FieldName = 'VL_JUROS_PGTO_TRIB'
    end
    object tbl_di_darf_CALC_VL_ADM_TEMP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_VL_ADM_TEMP'
      Calculated = True
    end
  end
  object ds_di_darf: TDataSource
    DataSet = qry_di_darf_
    Left = 36
    Top = 242
  end
  object tbl_di_comp_trib_: TTable
    BeforeInsert = qry_di_BeforeInsert
    BeforeEdit = qry_di_BeforeEdit
    AfterPost = tbl_di_comp_trib_AfterPost
    BeforeDelete = qry_di_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TCOMPENSACAO_CREDITO'
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 290
    object tbl_di_comp_trib_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_di_comp_trib_CD_RECEITA_CREDITO: TStringField
      DisplayLabel = 'Receita'
      FieldName = 'CD_RECEITA_CREDITO'
      Size = 4
    end
    object tbl_di_comp_trib_VL_COMPENSAR_CRED: TFloatField
      DisplayLabel = 'Valor a Compensar (R$)'
      FieldName = 'VL_COMPENSAR_CRED'
      DisplayFormat = '#0,.00'
    end
    object tbl_di_comp_trib_NR_DCTO_GERADOR_CR: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'NR_DCTO_GERADOR_CR'
      Size = 15
    end
  end
  object ds_di_comp_trib: TDataSource
    DataSet = tbl_di_comp_trib_
    Left = 36
    Top = 290
  end
  object ds_di: TDataSource
    DataSet = qry_di_
    Left = 36
    Top = 14
  end
  object ds_tp_vinc_expo_impo: TDataSource
    DataSet = tbl_tp_vinc_expo_impo_
    Left = 503
    Top = 105
  end
  object tbl_tp_vinc_expo_impo_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_VINC_EXPO_IMPO'
    ReadOnly = True
    TableName = 'TTP_VINC_EXPO_IMPO'
    UpdateMode = upWhereKeyOnly
    Left = 575
    Top = 105
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
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 503
    Top = 14
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    ReadOnly = True
    TableName = 'TYES_NO'
    Left = 575
    Top = 14
  end
  object ds_empresa_nac: TDataSource
    DataSet = tbl_empresa_nac_
    Left = 199
    Top = 14
  end
  object tbl_empresa_nac_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    ReadOnly = True
    TableName = 'TEMPRESA_NAC'
    Left = 276
    Top = 14
    object tbl_empresa_nac_CD_EMPRESA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EMPRESA'
      Size = 5
    end
    object tbl_empresa_nac_AP_EMPRESA: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_nac_NM_EMPRESA: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_END_EMPRESA: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'END_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_END_NUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
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
      DisplayLabel = 'Inclus'#227'o'
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
    object tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'NR_AG_BANCO_IMPOSTOS'
      Size = 5
    end
    object tbl_empresa_nac_CD_SDA: TStringField
      FieldName = 'CD_SDA'
      Size = 4
    end
  end
  object tbl_transp_itl_: TTable
    DatabaseName = 'DBBROKER'
    ReadOnly = True
    TableName = 'TTRANSPORTADOR_ITL'
    UpdateMode = upWhereKeyOnly
    Left = 276
    Top = 60
    object tbl_transp_itl_CODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
      Size = 4
    end
    object tbl_transp_itl_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object tbl_transp_itl_APELIDO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'APELIDO'
    end
    object tbl_transp_itl_CD_PAIS: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'CD_PAIS'
      Size = 3
    end
  end
  object ds_transp_itl: TDataSource
    DataSet = tbl_transp_itl_
    Left = 199
    Top = 60
  end
  object tbl_local_embarque_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TLOCAL_EMBARQUE'
    UpdateMode = upWhereKeyOnly
    Left = 276
    Top = 150
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
  object ds_local_embarque: TDataSource
    DataSet = tbl_local_embarque_
    Left = 199
    Top = 105
  end
  object tbl_transp_rod_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TRANSP_ROD'
    ReadOnly = True
    TableName = 'dbo.TTRANSP_ROD'
    UpdateMode = upWhereKeyOnly
    Left = 276
    Top = 105
  end
  object ds_transp_rod: TDataSource
    DataSet = tbl_transp_rod_
    Left = 199
    Top = 150
  end
  object ds_tipo_declaracao: TDataSource
    DataSet = tbl_tipo_declaracao_
    Left = 199
    Top = 194
  end
  object tbl_tipo_declaracao_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TTIPO_DECLARACAO'
    UpdateMode = upWhereKeyOnly
    Left = 276
    Top = 194
    object tbl_tipo_declaracao_Codigo: TStringField
      FieldName = 'Codigo'
      Size = 2
    end
    object tbl_tipo_declaracao_Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
  end
  object ds_urf: TDataSource
    AutoEdit = False
    DataSet = tbl_urf_
    Left = 199
    Top = 242
  end
  object tbl_urf_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TURF'
    UpdateMode = upWhereKeyOnly
    Left = 276
    Top = 242
    object tbl_urf_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 7
    end
    object tbl_urf_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_pais: TDataSource
    DataSet = tbl_pais_
    Left = 199
    Top = 290
  end
  object tbl_pais_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TPAIS'
    UpdateMode = upWhereKeyOnly
    Left = 276
    Top = 290
    object tbl_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object tbl_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_recinto_alfandegado: TDataSource
    DataSet = tbl_recinto_alfandegado_
    Left = 503
    Top = 150
  end
  object tbl_recinto_alfandegado_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TREC_ALFANDEGADO'
    UpdateMode = upWhereKeyOnly
    Left = 575
    Top = 150
    object tbl_recinto_alfandegado_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 7
    end
    object tbl_recinto_alfandegado_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object tbl_recinto_alfandegado_COD_ORGAO_REC: TStringField
      FieldName = 'COD_ORGAO_REC'
      Size = 7
    end
  end
  object ds_recinto_setor: TDataSource
    DataSet = tbl_recinto_setor_
    Left = 503
    Top = 60
  end
  object tbl_recinto_setor_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Recinto'
    ReadOnly = True
    TableName = 'TRECINTO_SETORES_IMPORTACAO'
    UpdateMode = upWhereKeyOnly
    Left = 575
    Top = 60
    object tbl_recinto_setor_Orgao: TStringField
      FieldName = 'Orgao'
      Size = 7
    end
    object tbl_recinto_setor_Recinto: TStringField
      FieldName = 'Recinto'
      Size = 7
    end
    object tbl_recinto_setor_Setor: TStringField
      FieldName = 'Setor'
      Size = 3
    end
    object tbl_recinto_setor_Nome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object ds_reg_trib: TDataSource
    DataSet = tbl_reg_trib_
    Left = 349
    Top = 150
  end
  object tbl_reg_trib_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TREG_TRIBUTARIO'
    UpdateMode = upWhereKeyOnly
    Left = 423
    Top = 150
  end
  object ds_fund_legal_reg_trib: TDataSource
    DataSet = tbl_fund_legal_reg_trib_
    Left = 349
    Top = 194
  end
  object tbl_fund_legal_reg_trib_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TFUND_LEG_REG_TRIBUT'
    UpdateMode = upWhereKeyOnly
    Left = 423
    Top = 194
    object tbl_fund_legal_reg_trib_Codigo: TStringField
      FieldName = 'Codigo'
      Size = 2
    end
    object tbl_fund_legal_reg_trib_Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
    object tbl_fund_legal_reg_trib_Reg_Tribut_1: TStringField
      FieldName = 'Reg_Tribut_1'
      Size = 1
    end
    object tbl_fund_legal_reg_trib_Reg_Tribut_2: TStringField
      FieldName = 'Reg_Tribut_2'
      Size = 1
    end
    object tbl_fund_legal_reg_trib_Reg_Tribut_3: TStringField
      FieldName = 'Reg_Tribut_3'
      Size = 1
    end
    object tbl_fund_legal_reg_trib_Reg_Tribut_4: TStringField
      FieldName = 'Reg_Tribut_4'
      Size = 1
    end
  end
  object ds_motivo: TDataSource
    DataSet = tbl_motivo_
    Left = 349
    Top = 242
  end
  object tbl_motivo_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TMOT_SEM_COBERT_CAMBIAL'
    UpdateMode = upWhereKeyOnly
    Left = 423
    Top = 242
    object tbl_motivo_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 2
    end
    object tbl_motivo_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_mod_pagto: TDataSource
    DataSet = tbl_mod_pagto_
    Left = 349
    Top = 290
  end
  object tbl_mod_pagto_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TMODALID_PAGAMENTO'
    UpdateMode = upWhereKeyOnly
    Left = 423
    Top = 290
    object tbl_mod_pagto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 2
    end
    object tbl_mod_pagto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_metodo_valoracao: TDataSource
    DataSet = tbl_metodo_valoracao_
    Left = 349
    Top = 14
  end
  object tbl_metodo_valoracao_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TMETODO_VALOR_ADUANEIRA'
    UpdateMode = upWhereKeyOnly
    Left = 423
    Top = 14
  end
  object ds_moeda: TDataSource
    DataSet = tbl_moeda_
    Left = 349
    Top = 60
  end
  object tbl_moeda_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TMOEDA'
    UpdateMode = upWhereKeyOnly
    Left = 423
    Top = 60
    object tbl_moeda_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object tbl_moeda_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_embalagens: TDataSource
    DataSet = tbl_embalagens_
    Left = 349
    Top = 105
  end
  object tbl_embalagens_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TTP_EMBALAGEM'
    UpdateMode = upWhereKeyOnly
    Left = 423
    Top = 105
    object tbl_embalagens_Codigo: TStringField
      FieldName = 'Codigo'
      Size = 2
    end
    object tbl_embalagens_Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
  end
  object ds_taxa_cambio: TDataSource
    DataSet = tbl_taxa_cambio_
    Left = 503
    Top = 194
  end
  object tbl_taxa_cambio_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TCONVERSAO_CAMBIO'
    UpdateMode = upWhereKeyOnly
    Left = 575
    Top = 194
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
  object qry_ad_docto_vinc_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    DataSource = ds_di
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TDOCUMENTO_VINCULADO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 575
    Top = 290
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ad_docto_vinc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDOCUMENTO_VINCULADO.NR_PROCESSO'
      Size = 18
    end
    object qry_ad_docto_vinc_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TDOCUMENTO_VINCULADO.NR_ADICAO'
      Size = 3
    end
    object qry_ad_docto_vinc_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TDOCUMENTO_VINCULADO.NR_SEQUENCIA'
    end
    object qry_ad_docto_vinc_CD_TIPO_DCTO_VINC: TStringField
      FieldName = 'CD_TIPO_DCTO_VINC'
      Origin = 'TDOCUMENTO_VINCULADO.CD_TIPO_DCTO_VINC'
      Size = 1
    end
    object qry_ad_docto_vinc_NR_DCTO_VINCULADO: TStringField
      FieldName = 'NR_DCTO_VINCULADO'
      Origin = 'TDOCUMENTO_VINCULADO.NR_DCTO_VINCULADO'
      Size = 15
    end
  end
  object ds_doc_instr_emb: TDataSource
    DataSet = tbl_doc_instr_emb_
    Left = 503
    Top = 242
  end
  object tbl_doc_instr_emb_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TDOC_INSTRUCAO_DESPACHO'
    UpdateMode = upWhereKeyOnly
    Left = 575
    Top = 242
    object tbl_doc_instr_emb_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 2
    end
    object tbl_doc_instr_emb_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_proc_vinc: TDataSource
    AutoEdit = False
    DataSet = tbl_proc_vinc_
    Left = 199
    Top = 339
  end
  object tbl_proc_vinc_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TTP_PROCESSO_VINCULADO'
    UpdateMode = upWhereKeyOnly
    Left = 276
    Top = 339
  end
  object sp_recalcular_adicoes: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_recalcula_adicoes'
    Left = 276
    Top = 387
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
  object sp_atualiza_bco_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atualiza_bco_ag'
    Left = 120
    Top = 387
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
        Name = '@cd_banco'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_agenc'
        ParamType = ptInput
      end>
  end
  object sp_di_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_calculo'
    Left = 199
    Top = 387
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
  object ds_incoterms: TDataSource
    DataSet = tbl_incoterms_
    Left = 503
    Top = 339
  end
  object tbl_incoterms_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TINCOTERMS_VENDA'
    Left = 575
    Top = 339
  end
  object sp_exclui_di: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exclui_di'
    Left = 36
    Top = 387
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
  object qry_ref_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT RC.CD_REFERENCIA, RC.NR_PROCESSO, RC.NR_ITEM_PO'
      'FROM TPROCESSO                   P  (NOLOCK)'
      
        '   INNER JOIN TGRUPO_REF_COMPLEM G  (NOLOCK) ON G.CD_GRUPO = P.C' +
        'D_GRUPO'
      
        '   INNER JOIN TREF_CLIENTE       RC (NOLOCK) ON RC.NR_PROCESSO =' +
        ' P.NR_PROCESSO'
      
        '                                            AND RC.TP_REFERENCIA' +
        ' = G.TP_REFERENCIA'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY G.NR_ORDEM, RC.DT_REFERENCIA')
    Left = 423
    Top = 339
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ref_cliente_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
    object qry_ref_cliente_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TREF_CLIENTE.NR_PROCESSO'
      Size = 18
    end
    object qry_ref_cliente_NR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
  end
  object qry_processo_: TQuery
    BeforeDelete = qry_di_BeforeDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_PROC_RISC, CD_SERVICO'
      'FROM TPROCESSO TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 120
    Top = 339
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
    object qry_processo_NR_PROC_RISC: TStringField
      FieldName = 'NR_PROC_RISC'
      Origin = 'TPROCESSO.NR_PROC_RISC'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_CONTA, CD_AGENCIA, NR_BANCO'
      'FROM   TBANCO'
      'WHERE  CD_BANCO = :CD_BANCO')
    Left = 349
    Top = 339
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
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
    object qry_banco_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TBANCO.NR_BANCO'
      Size = 3
    end
  end
  object qry_adicao_taxa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA_MLE, TX_MLE'
      'FROM TADICAO_DE_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 36
    Top = 339
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_adicao_taxa_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_adicao_taxa_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
      Origin = 'TADICAO_DE_IMPORTACAO.TX_MLE'
    end
  end
  object Query3: TQuery
    DatabaseName = 'DBBROKER'
    Left = 503
    Top = 290
  end
  object sp_di_atz_tipo_di: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_atz_tipo_di'
    Left = 423
    Top = 387
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
        DataType = ftSmallint
        Name = '@cd_tipo_di'
        ParamType = ptInput
      end>
  end
  object sp_di_atz_via_transp: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_atz_via_transp'
    Left = 349
    Top = 387
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
        DataType = ftSmallint
        Name = '@cd_via_transp'
        ParamType = ptInput
      end>
  end
  object ds_via_transporte: TDataSource
    AutoEdit = False
    DataSet = tbl_via_transporte_
    OnDataChange = ds_via_transporteDataChange
    Left = 503
    Top = 387
  end
  object tbl_via_transporte_: TTable
    BeforeOpen = tbl_via_transporte_BeforeOpen
    AfterOpen = tbl_via_transporte_AfterOpen
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NM_VIA_TRANSPORTE'
    ReadOnly = True
    TableName = 'TVIA_TRANSPORTE'
    UpdateMode = upWhereKeyOnly
    Left = 575
    Top = 387
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
  object qry_di_: TQuery
    CachedUpdates = True
    BeforeInsert = qry_di_BeforeInsert
    BeforeEdit = qry_di_BeforeEdit
    BeforePost = qry_di_BeforePost
    AfterPost = qry_di_AfterPost
    BeforeDelete = qry_di_BeforeDelete
    AfterScroll = qry_di_AfterScroll
    OnCalcFields = qry_di_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TDECLARACAO_IMPORTACAO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = upd_di
    Left = 80
    Top = 14
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
    object qry_di_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 15
    end
    object qry_di_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_APLICACAO_MERC'
      Size = 1
    end
    object qry_di_CD_BANDEIRA_TRANSP: TStringField
      FieldName = 'CD_BANDEIRA_TRANSP'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_BANDEIRA_TRANSP'
      Size = 3
    end
    object qry_di_CD_COBERTURA_CAMBIAL: TStringField
      FieldName = 'CD_COBERTURA_CAMBIAL'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_COBERTURA_CAMBIAL'
      Size = 1
    end
    object qry_di_CD_DESTAQUE_NCM: TStringField
      FieldName = 'CD_DESTAQUE_NCM'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_DESTAQUE_NCM'
      EditMask = '999'
      Size = 3
    end
    object qry_di_CD_FORMA_PAGAMENTO: TStringField
      FieldName = 'CD_FORMA_PAGAMENTO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_FORMA_PAGAMENTO'
      Size = 1
    end
    object qry_di_CD_FUND_LEGAL_II: TStringField
      FieldName = 'CD_FUND_LEGAL_II'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_FUND_LEGAL_II'
      EditMask = '99'
      Size = 2
    end
    object qry_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_di_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_INCOTERM'
      Size = 3
    end
    object qry_di_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_LOCAL_EMBARQUE'
      OnChange = qry_di_CD_LOCAL_EMBARQUEChange
      Size = 4
    end
    object qry_di_CD_METODO_VALORACAO: TStringField
      FieldName = 'CD_METODO_VALORACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_METODO_VALORACAO'
      EditMask = '99'
      Size = 2
    end
    object qry_di_CD_MODALIDADE_DESP: TStringField
      FieldName = 'CD_MODALIDADE_DESP'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MODALIDADE_DESP'
      Size = 1
    end
    object qry_di_CD_MODALIDADE_PAGTO: TStringField
      FieldName = 'CD_MODALIDADE_PAGTO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MODALIDADE_PAGTO'
      Size = 2
    end
    object qry_di_CD_MOEDA_DESPESAS: TStringField
      FieldName = 'CD_MOEDA_DESPESAS'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_DESPESAS'
      Size = 3
    end
    object qry_di_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_di_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_di_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_di_CD_MOTIVO_SEM_COBERTURA: TStringField
      FieldName = 'CD_MOTIVO_SEM_COBERTURA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOTIVO_SEM_COBERTURA'
      Size = 2
    end
    object qry_di_CD_MOTIVO_TRANS: TStringField
      FieldName = 'CD_MOTIVO_TRANS'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOTIVO_TRANS'
      Size = 1
    end
    object qry_di_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object qry_di_CD_PAIS_PROC_CARGA: TStringField
      FieldName = 'CD_PAIS_PROC_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_PAIS_PROC_CARGA'
      Size = 3
    end
    object qry_di_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 2
    end
    object qry_di_CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_RECINTO_ALFAND'
      Size = 7
    end
    object qry_di_CD_REG_TRIB_II: TStringField
      FieldName = 'CD_REG_TRIB_II'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_REG_TRIB_II'
      EditMask = '9'
      Size = 1
    end
    object qry_di_CD_REG_TRIB_IPI: TStringField
      FieldName = 'CD_REG_TRIB_IPI'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_REG_TRIB_IPI'
      Size = 1
    end
    object qry_di_CD_SETOR_ARMAZENAM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAM'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_SETOR_ARMAZENAM'
      Size = 3
    end
    object qry_di_CD_TIPO_AG_CARGA: TStringField
      FieldName = 'CD_TIPO_AG_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_AG_CARGA'
      Size = 1
    end
    object qry_di_CD_TIPO_CONSIG: TStringField
      FieldName = 'CD_TIPO_CONSIG'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_CONSIG'
      Size = 1
    end
    object qry_di_CD_TIPO_DCTO_CARGA: TStringField
      FieldName = 'CD_TIPO_DCTO_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_DCTO_CARGA'
      Size = 2
    end
    object qry_di_CD_TIPO_DECLARACAO: TStringField
      FieldName = 'CD_TIPO_DECLARACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_DECLARACAO'
      Size = 2
    end
    object qry_di_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object qry_di_CD_TIPO_MANIFESTO: TStringField
      FieldName = 'CD_TIPO_MANIFESTO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_MANIFESTO'
      Size = 1
    end
    object qry_di_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TRANSPORTADOR'
      OnChange = qry_di_CD_TRANSPORTADORChange
      Size = 4
    end
    object qry_di_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_di_CD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_URF_ENTR_CARGA'
      Size = 7
    end
    object qry_di_CD_UTIL_DCTO_CARGA: TStringField
      FieldName = 'CD_UTIL_DCTO_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_UTIL_DCTO_CARGA'
      Size = 1
    end
    object qry_di_CD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_VIA_TRANSP_CARG'
      Size = 2
    end
    object qry_di_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_VINC_IMPO_EXPO'
      Size = 1
    end
    object qry_di_DT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_CHEGADA_CARGA'
      OnChange = qry_di_DT_CHEGADA_CARGAChange
      EditMask = '!99/99/9999;0;'
      Size = 8
    end
    object qry_di_DT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_EMBARQUE'
      OnChange = qry_di_DT_EMBARQUEChange
      EditMask = '!00/00/0000;0;'
      Size = 8
    end
    object qry_di_DT_PROCESSAMENTO: TStringField
      FieldName = 'DT_PROCESSAMENTO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_PROCESSAMENTO'
      EditMask = '!99/99/9999;0;'
      Size = 8
    end
    object qry_di_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_REGISTRO_DI'
      EditMask = '!99/99/9999;0;'
      Size = 8
    end
    object qry_di_DT_TRANSMISSAO: TStringField
      FieldName = 'DT_TRANSMISSAO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_TRANSMISSAO'
      EditMask = '!99/99/9999;0;'
      Size = 8
    end
    object qry_di_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_BEM_ENCOMENDA'
    end
    object qry_di_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_MATERIAL_USADO'
    end
    object qry_di_IN_MOEDA_NACIONAL: TStringField
      FieldName = 'IN_MOEDA_NACIONAL'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_MOEDA_NACIONAL'
      Size = 1
    end
    object qry_di_IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_MOEDA_UNICA'
    end
    object qry_di_IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_MULTIMODAL'
    end
    object qry_di_IN_OPERACAO_FUNDAP: TBooleanField
      FieldName = 'IN_OPERACAO_FUNDAP'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_OPERACAO_FUNDAP'
    end
    object qry_di_IN_RATEAR_FRETE_ITENS: TBooleanField
      FieldName = 'IN_RATEAR_FRETE_ITENS'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_RATEAR_FRETE_ITENS'
    end
    object qry_di_IN_RATEAR_SEGURO_ITENS: TBooleanField
      FieldName = 'IN_RATEAR_SEGURO_ITENS'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_RATEAR_SEGURO_ITENS'
    end
    object qry_di_IN_REPASSA_DADOS_ADICAO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_ADICAO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_REPASSA_DADOS_ADICAO'
      OnChange = qry_di_IN_REPASSA_DADOS_ADICAOChange
    end
    object qry_di_IN_REPASSA_DADOS_CAMBIO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_CAMBIO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_REPASSA_DADOS_CAMBIO'
      OnChange = qry_di_IN_REPASSA_DADOS_CAMBIOChange
    end
    object qry_di_NM_CONSIGNATARIO: TStringField
      FieldName = 'NM_CONSIGNATARIO'
      Origin = 'TDECLARACAO_IMPORTACAO.NM_CONSIGNATARIO'
      Size = 60
    end
    object qry_di_NM_VEICULO_TRANSP: TStringField
      FieldName = 'NM_VEICULO_TRANSP'
      Origin = 'TDECLARACAO_IMPORTACAO.NM_VEICULO_TRANSP'
      OnChange = qry_di_NM_VEICULO_TRANSPChange
      Size = 30
    end
    object qry_di_NR_AGENTE_CARGA: TStringField
      FieldName = 'NR_AGENTE_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_AGENTE_CARGA'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_di_NR_BANCO_COM: TStringField
      FieldName = 'NR_BANCO_COM'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_BANCO_COM'
      EditMask = '99999'
      Size = 5
    end
    object qry_di_NR_BANCO_PAGAMENTO: TStringField
      FieldName = 'NR_BANCO_PAGAMENTO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_BANCO_PAGAMENTO'
      EditMask = '99999'
      Size = 5
    end
    object qry_di_NR_COMPRADOR_ME: TStringField
      FieldName = 'NR_COMPRADOR_ME'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_COMPRADOR_ME'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_di_NR_CONSIGNATARIO: TStringField
      FieldName = 'NR_CONSIGNATARIO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_CONSIGNATARIO'
      EditMask = '!99999999/9999-99;0;'
      Size = 14
    end
    object qry_di_NR_CONTRATO_CAMBIO: TStringField
      FieldName = 'NR_CONTRATO_CAMBIO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_CONTRATO_CAMBIO'
      EditMask = '99999999'
      Size = 8
    end
    object qry_di_NR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object qry_di_NR_DECL_IMP_PROT: TStringField
      FieldName = 'NR_DECL_IMP_PROT'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_DECL_IMP_PROT'
      Size = 10
    end
    object qry_di_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_DECLARACAO_IMP'
      EditMask = '99/9999999-9;0;'
      Size = 15
    end
    object qry_di_NR_IDENTIFICACAO_COM: TStringField
      FieldName = 'NR_IDENTIFICACAO_COM'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_IDENTIFICACAO_COM'
      EditMask = '99999999999999'
      Size = 14
    end
    object qry_di_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_MANIFESTO'
      Size = 15
    end
    object qry_di_NR_PRACA_COM: TStringField
      FieldName = 'NR_PRACA_COM'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PRACA_COM'
      EditMask = '9999'
      Size = 4
    end
    object qry_di_NR_PRACA_PAGAMENTO: TStringField
      FieldName = 'NR_PRACA_PAGAMENTO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PRACA_PAGAMENTO'
      EditMask = '9999'
      Size = 5
    end
    object qry_di_NR_ROF: TStringField
      FieldName = 'NR_ROF'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_ROF'
      EditMask = 'AAA/AAAAA;0;'
      Size = 8
    end
    object qry_di_NR_VEICULO_TRANSP: TStringField
      FieldName = 'NR_VEICULO_TRANSP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_VEICULO_TRANSP'
      Size = 15
    end
    object qry_di_PB_CARGA: TFloatField
      FieldName = 'PB_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.PB_CARGA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_di_PC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'TDECLARACAO_IMPORTACAO.PC_COMISSAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.PC_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_PC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.PC_REDUCAO_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_PL_CARGA: TFloatField
      FieldName = 'PL_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.PL_CARGA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_di_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
      Origin = 'TDECLARACAO_IMPORTACAO.QT_ADICOES'
    end
    object qry_di_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_FRETE_TNAC_MNEG'
      OnChange = qry_di_VL_FRETE_TNAC_MNEGChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_VL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_DESPS_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_VL_TOT_DESPS_MNEG: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_DESPS_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_VL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_FRT_COLLECT'
      OnChange = qry_di_VL_TOT_FRT_COLLECTChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_VL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_FRT_PREPAID'
      OnChange = qry_di_VL_TOT_FRT_PREPAIDChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_MLE_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_VL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_SEGURO_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_FRETE_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_MLE_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_SEG_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_PC_SEGURO_MLE: TFloatField
      FieldName = 'PC_SEGURO_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.PC_SEGURO_MLE'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_di_VL_TOTAL_II: TFloatField
      FieldName = 'VL_TOTAL_II'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_II'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_VL_TOTAL_IPI: TFloatField
      FieldName = 'VL_TOTAL_IPI'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_IPI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_VL_TOTAL_AD: TFloatField
      FieldName = 'VL_TOTAL_AD'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_AD'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
    object qry_di_CD_TIPO_BASE_SEGURO: TStringField
      FieldName = 'CD_TIPO_BASE_SEGURO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_BASE_SEGURO'
      Size = 1
    end
    object qry_di_IN_REB: TStringField
      FieldName = 'IN_REB'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_REB'
      OnChange = qry_di_IN_REBChange
      Size = 1
    end
    object qry_di_VL_TOT_ICMS: TFloatField
      FieldName = 'VL_TOT_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_CD_TIPO_PGTO_TRIB: TStringField
      FieldName = 'CD_TIPO_PGTO_TRIB'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_PGTO_TRIB'
      Size = 1
    end
    object qry_di_NR_CONTA_PGTO_TRIB: TStringField
      FieldName = 'NR_CONTA_PGTO_TRIB'
      Size = 19
    end
    object qry_di_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_MLE'
    end
    object qry_di_TX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_FRETE'
    end
    object qry_di_TX_SEGURO: TFloatField
      FieldName = 'TX_SEGURO'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_SEGURO'
    end
    object qry_di_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_DOLAR'
    end
    object qry_di_NR_REF_CLI: TStringField
      FieldName = 'NR_REF_CLI'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_REF_CLI'
      Size = 15
    end
    object qry_di_IN_SISCOMEX: TStringField
      FieldName = 'IN_SISCOMEX'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_SISCOMEX'
      Size = 1
    end
    object qry_di_CD_TIPO_ICMS: TStringField
      FieldName = 'CD_TIPO_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_ICMS'
      Size = 1
    end
    object qry_di_IN_ICMS_IMPRESSO: TStringField
      FieldName = 'IN_ICMS_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_ICMS_IMPRESSO'
      Size = 1
    end
    object qry_di_DT_ICMS_IMPRESSO: TDateTimeField
      FieldName = 'DT_ICMS_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_ICMS_IMPRESSO'
    end
    object qry_di_VL_TOTAL_ACRESCIMOS_MN: TFloatField
      FieldName = 'VL_TOTAL_ACRESCIMOS_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_ACRESCIMOS_MN'
    end
    object qry_di_VL_TOTAL_DEDUCOES_MN: TFloatField
      FieldName = 'VL_TOTAL_DEDUCOES_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_DEDUCOES_MN'
    end
    object qry_di_VL_DESPESA_ITEM: TFloatField
      FieldName = 'VL_DESPESA_ITEM'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_DESPESA_ITEM'
    end
    object qry_di_VL_DESPESA_ITEM_MN: TFloatField
      FieldName = 'VL_DESPESA_ITEM_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_DESPESA_ITEM_MN'
    end
    object qry_di_Calc_VL_TOT_MLE_MN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_VL_TOT_MLE_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_di_Calc_VL_TOT_FRETE_MN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_VL_TOT_FRETE_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_di_Calc_VL_TOT_SEGURO_MN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_VL_TOT_SEGURO_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_di_Calc_TOT_FRETE_MNEG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_TOT_FRETE_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_di_Calc_VL_TOT_DESPESA_MN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_VL_TOT_DESPESA_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_di_DT_CALCULO: TDateTimeField
      FieldName = 'DT_CALCULO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_Look_tipo_declaracao: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tipo_declaracao'
      LookupDataSet = tbl_tipo_declaracao_
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CD_TIPO_DECLARACAO'
      Size = 80
      Lookup = True
    end
    object qry_di_Look_Importador: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Importador'
      LookupDataSet = tbl_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_di_Look_urf_despacho: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_urf_despacho'
      LookupDataSet = tbl_urf_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_URF_DESPACHO'
      Size = 60
      Lookup = True
    end
    object qry_di_Look_urf_entrada: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_urf_entrada'
      LookupDataSet = tbl_urf_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_URF_ENTR_CARGA'
      Size = 60
      Lookup = True
    end
    object qry_di_Look_transp_itl: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_transp_itl'
      LookupDataSet = tbl_transp_itl_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_TRANSPORTADOR'
      Size = 30
      Lookup = True
    end
    object qry_di_Look_Bandeira_Transp_itl: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Bandeira_Transp_itl'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_BANDEIRA_TRANSP'
      Size = 30
      Lookup = True
    end
    object qry_di_Look_Local_Embarque: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Local_Embarque'
      LookupDataSet = tbl_local_embarque_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_LOCAL_EMBARQUE'
      Size = 30
      Lookup = True
    end
    object qry_di_Look_Pais_Procedencia: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Pais_Procedencia'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_PROC_CARGA'
      Size = 40
      Lookup = True
    end
    object qry_di_Look_Moeda_MLE: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Moeda_MLE'
      LookupDataSet = tbl_moeda_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_MLE'
      Size = 40
      Lookup = True
    end
    object qry_di_Look_Moeda_Frete: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Moeda_Frete'
      LookupDataSet = tbl_moeda_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_FRETE'
      Size = 40
      Lookup = True
    end
    object qry_di_Look_Moeda_Seguro: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Moeda_Seguro'
      LookupDataSet = tbl_moeda_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_SEGURO'
      Size = 40
      Lookup = True
    end
    object qry_di_Look_Transp_Rod: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Transp_Rod'
      LookupDataSet = tbl_transp_rod_
      LookupKeyFields = 'CD_TRANSP_ROD'
      LookupResultField = 'AP_TRANSP_ROD'
      KeyFields = 'CD_TRANSPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_di_Look_Band_Cad_Transp: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Band_Cad_Transp'
      LookupDataSet = tbl_transp_itl_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CD_PAIS'
      KeyFields = 'CD_TRANSPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_di_Look_Met_Valoracao: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Met_Valoracao'
      LookupDataSet = tbl_metodo_valoracao_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_METODO_VALORACAO'
      Size = 50
      Lookup = True
    end
    object qry_di_Look_Reg_Trib_II: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Reg_Trib_II'
      LookupDataSet = tbl_reg_trib_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_REG_TRIB_II'
      Size = 50
      Lookup = True
    end
    object qry_di_Look_Fund_Legal: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Fund_Legal'
      LookupDataSet = tbl_fund_legal_reg_trib_
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CD_FUND_LEGAL_II'
      Size = 50
      Lookup = True
    end
    object qry_di_Look_Mot_Sem_Cobertura: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Mot_Sem_Cobertura'
      LookupDataSet = tbl_motivo_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOTIVO_SEM_COBERTURA'
      Size = 50
      Lookup = True
    end
    object qry_di_Look_Modalidade_Pagto: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Modalidade_Pagto'
      LookupDataSet = tbl_mod_pagto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MODALIDADE_PAGTO'
      Size = 50
      Lookup = True
    end
    object qry_di_CD_PRESENCA_CARGA: TStringField
      FieldName = 'CD_PRESENCA_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      OnChange = qry_di_CD_PRESENCA_CARGAChange
      Size = 36
    end
    object qry_di_NR_SEQ_RETIFICACAO: TStringField
      FieldName = 'NR_SEQ_RETIFICACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 2
    end
    object qry_di_CD_MOTIVO_RETIF: TStringField
      FieldName = 'CD_MOTIVO_RETIF'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 2
    end
    object qry_di_DT_RETIFICACAO: TDateTimeField
      FieldName = 'DT_RETIFICACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_APLICACAO_MERC'
    end
    object qry_di_LookMotivoRetif: TStringField
      FieldKind = fkLookup
      FieldName = 'LookMotivoRetif'
      LookupDataSet = qry_motivo_retif_
      LookupKeyFields = 'CD_MOTIVO_RETIF'
      LookupResultField = 'NM_MOTIVO_RETIF'
      KeyFields = 'CD_MOTIVO_RETIF'
      Size = 100
      Lookup = True
    end
    object qry_di_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_APLICACAO_MERC'
      Size = 1
    end
    object qry_di_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_BANDEIRA_TRANSP'
      Size = 3
    end
    object qry_di_LookFundLegalICMS: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFundLegalICMS'
      LookupDataSet = qry_disp_legal_
      LookupKeyFields = 'CD_EX'
      LookupResultField = 'NM_EX'
      KeyFields = 'CD_FUND_LEGAL_ICMS'
      Size = 30
      Lookup = True
    end
    object qry_di_LookTributacaoICMS: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTributacaoICMS'
      LookupDataSet = qry_tributacao_icms_
      LookupKeyFields = 'CD_TRIBUTACAO_ICMS'
      LookupResultField = 'NM_TRIBUTACAO_ICMS'
      KeyFields = 'CD_TRIBUTACAO_ICMS'
      Lookup = True
    end
    object qry_di_DT_EXON_IMPRESSO: TDateTimeField
      FieldName = 'DT_EXON_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_IN_EXON_IMPRESSO: TStringField
      FieldName = 'IN_EXON_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 1
    end
    object qry_di_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_APLICACAO_MERC'
      Size = 5
    end
    object qry_di_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_BANDEIRA_TRANSP'
      Size = 3
    end
    object qry_di_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_COBERTURA_CAMBIAL'
      Size = 5
    end
    object qry_di_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_DESTAQUE_NCM'
      Size = 3
    end
    object qry_di_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_FORMA_PAGAMENTO'
      Size = 1
    end
    object qry_di_LookFabricante: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFabricante'
      LookupDataSet = qry_emp_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FABRICANTE'
      Size = 60
      Lookup = True
    end
    object qry_di_LookExportador: TStringField
      FieldKind = fkLookup
      FieldName = 'LookExportador'
      LookupDataSet = qry_emp_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FORNECEDOR'
      Size = 60
      Lookup = True
    end
    object qry_di_Look_pais_orig: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_pais_orig'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_ORIG_MERC'
      Size = 120
      Lookup = True
    end
    object qry_di_Look_pais_export: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_pais_export'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_AQUIS_MERC'
      Size = 120
      Lookup = True
    end
    object qry_di_VL_TOTAL_CAMBIO: TFloatField
      FieldName = 'VL_TOTAL_CAMBIO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_Look_agente_transp: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'Look_agente_transp'
      LookupDataSet = qry_look_agente_
      LookupKeyFields = 'NR_CGC_AGENTE'
      LookupResultField = 'NM_AGENTE'
      KeyFields = 'NR_AGENTE_CARGA'
      Size = 50
      Lookup = True
    end
    object qry_di_Look_Recinto_Alf: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'Look_Recinto_Alf'
      LookupDataSet = tbl_recinto_alfandegado_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_RECINTO_ALFAND'
      Size = 60
      Lookup = True
    end
    object qry_di_look_setor: TStringField
      FieldKind = fkCalculated
      FieldName = 'look_setor'
      Calculated = True
    end
    object qry_di_QT_PARC_FINANC_360: TIntegerField
      FieldName = 'QT_PARC_FINANC_360'
    end
    object qry_di_QT_PERIOD_PGTO_360: TIntegerField
      FieldName = 'QT_PERIOD_PGTO_360'
    end
    object qry_di_CD_PERIOD_PGTO_360: TStringField
      FieldName = 'CD_PERIOD_PGTO_360'
      Size = 1
    end
    object qry_di_IN_EMBUT_FRT_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_FRT_ITENS'
    end
    object qry_di_IN_EMBUT_SEG_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_SEG_ITENS'
    end
    object qry_di_VL_TOTAL_ACRESCIMOS_MNEG: TFloatField
      FieldName = 'VL_TOTAL_ACRESCIMOS_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_VL_TOTAL_DEDUCOES_MNEG: TFloatField
      FieldName = 'VL_TOTAL_DEDUCOES_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_IDENT_USUARIO'
    end
    object qry_di_VL_TOTAL_FRETE_MNEG: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_APLICACAO_MERC'
    end
    object qry_di_IN_PGTO_VARIAV_360: TBooleanField
      FieldName = 'IN_PGTO_VARIAV_360'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_IDENT_USUARIO'
    end
    object qry_di_NR_DCTO_CARGA: TStringField
      FieldName = 'NR_DCTO_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 30
    end
    object qry_di_NR_DCTO_CARGA_MAST: TStringField
      FieldName = 'NR_DCTO_CARGA_MAST'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 30
    end
    object qry_di_PC_REDUCAO_IPT_BLI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_BLI'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_IDENT_USUARIO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_CD_VEICULO_TRANSP: TStringField
      FieldName = 'CD_VEICULO_TRANSP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_IDENT_USUARIO'
      OnChange = qry_di_CD_VEICULO_TRANSPChange
      Size = 4
    end
    object qry_di_VL_TOT_PIS_COFINS: TFloatField
      FieldName = 'VL_TOT_PIS_COFINS'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_BANDEIRA_TRANSP'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_di_NR_PROCESSO_SISCOMEX: TStringField
      FieldName = 'NR_PROCESSO_SISCOMEX'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.NR_PROCESSO_SISCOMEX'
      FixedChar = True
      Size = 8
    end
    object qry_di_DT_DI: TDateTimeField
      FieldName = 'DT_DI'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.DT_DI'
    end
    object qry_di_VL_TOTAL_TX_SCX: TFloatField
      FieldName = 'VL_TOTAL_TX_SCX'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.VL_TOTAL_TX_SCX'
    end
    object qry_di_VL_TOTAL_SEGURO_MN: TFloatField
      FieldName = 'VL_TOTAL_SEGURO_MN'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.VL_TOTAL_SEGURO_MN'
    end
    object qry_di_IN_CALCULOU_COM_AFRMM: TStringField
      FieldName = 'IN_CALCULOU_COM_AFRMM'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.IN_CALCULOU_COM_AFRMM'
      FixedChar = True
      Size = 1
    end
    object qry_di_HR_DI: TStringField
      FieldName = 'HR_DI'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.HR_DI'
      FixedChar = True
      Size = 8
    end
    object qry_di_HR_CALCULO: TStringField
      FieldName = 'HR_CALCULO'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.HR_CALCULO'
      FixedChar = True
      Size = 8
    end
    object qry_di_VL_TOTAL_II_SEM_SEGURO: TFloatField
      FieldName = 'VL_TOTAL_II_SEM_SEGURO'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.VL_TOTAL_II_SEM_SEGURO'
    end
    object qry_di_VL_TOTAL_IPI_SEM_SEGURO: TFloatField
      FieldName = 'VL_TOTAL_IPI_SEM_SEGURO'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.VL_TOTAL_IPI_SEM_SEGURO'
    end
    object qry_di_VL_TOT_ICMS_SEM_SEGURO: TFloatField
      FieldName = 'VL_TOT_ICMS_SEM_SEGURO'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.VL_TOT_ICMS_SEM_SEGURO'
    end
    object qry_di_NR_TRANSMISSAO: TStringField
      FieldName = 'NR_TRANSMISSAO'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.NR_TRANSMISSAO'
      FixedChar = True
      Size = 15
    end
    object qry_di_CD_USUARIO_TRANSMISSAO: TStringField
      FieldName = 'CD_USUARIO_TRANSMISSAO'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.CD_USUARIO_TRANSMISSAO'
      FixedChar = True
      Size = 4
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
    object qry_di_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_INFO_COMPL'
      BlobType = ftMemo
    end
    object qry_di_TX_INFO_COMPL_AUTO: TMemoField
      FieldName = 'TX_INFO_COMPL_AUTO'
      BlobType = ftMemo
    end
  end
  object qry_inst_financ_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO'
      'FROM TINST_FINANC_INTERNACIONAL TINST_FINANC_INTERNACIONAL'
      'WHERE CODIGO = :CODIGO')
    Left = 120
    Top = 440
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
  object ds_inst_financ_: TDataSource
    DataSet = qry_inst_financ_
    Left = 36
    Top = 440
  end
  object qry_taxa_cambio_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM   TTAXA_CAMBIO'
      'WHERE  CD_MOEDA = :CD_MOEDA AND'
      
        '       :DT_REGISTRO BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VI' +
        'GENCIA')
    Left = 199
    Top = 440
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
  object qry_motivo_retif_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TMOTIVO_RETIF')
    Left = 276
    Top = 440
    object qry_motivo_retif_CD_MOTIVO_RETIF: TStringField
      FieldName = 'CD_MOTIVO_RETIF'
      Origin = 'TMOTIVO_RETIF.CD_MOTIVO_RETIF'
      Size = 2
    end
    object qry_motivo_retif_NM_MOTIVO_RETIF: TStringField
      FieldName = 'NM_MOTIVO_RETIF'
      Origin = 'TMOTIVO_RETIF.NM_MOTIVO_RETIF'
      Size = 100
    end
  end
  object sp_atz_proc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atualiza_processo'
    Left = 349
    Top = 440
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
  object qry_tributacao_icms_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TRIBUTACAO_ICMS, NM_TRIBUTACAO_ICMS'
      'FROM TTRIBUTACAO_ICMS')
    Left = 120
    Top = 495
    object qry_tributacao_icms_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      Origin = 'TTRIBUTACAO_ICMS.CD_TRIBUTACAO_ICMS'
      Size = 1
    end
    object qry_tributacao_icms_NM_TRIBUTACAO_ICMS: TStringField
      FieldName = 'NM_TRIBUTACAO_ICMS'
      Origin = 'TTRIBUTACAO_ICMS.NM_TRIBUTACAO_ICMS'
    end
  end
  object qry_disp_legal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EX, NM_EX'
      'FROM TTP_EXONERACAO')
    UpdateMode = upWhereChanged
    Left = 36
    Top = 495
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
  end
  object sp_di_repassa_dados_adicao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_repassa_dados_adicao'
    Left = 423
    Top = 440
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
      end>
  end
  object sp_di_repassa_dados_cambio: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_repassa_dados_cambio'
    Left = 423
    Top = 495
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
      end>
  end
  object qry_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, CD_PAIS FROM TEMPRESA_EST'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 199
    Top = 495
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
    object qry_emp_est_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 3
    end
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO FROM TPAIS')
    Left = 276
    Top = 495
    object qry_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TPAIS.CODIGO'
      Size = 3
    end
    object qry_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TPAIS.DESCRICAO'
      Size = 120
    end
  end
  object qry_look_agente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_AGENTE, NR_CGC_AGENTE, NM_AGENTE FROM TAGENTE'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 503
    Top = 440
    object qry_look_agente_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TAGENTE.CD_AGENTE'
      Size = 4
    end
    object qry_look_agente_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      Origin = 'TAGENTE.NM_AGENTE'
      Size = 60
    end
    object qry_look_agente_NR_CGC_AGENTE: TStringField
      FieldName = 'NR_CGC_AGENTE'
      Size = 14
    end
  end
  object sp_atz_arm_di: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atualiza_armazem'
    Left = 349
    Top = 495
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
        Name = '@cd_amz_atracacao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_amz_descarga'
        ParamType = ptInput
      end>
  end
  object qry_emp_estrangeira_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PAIS FROM TEMPRESA_EST'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Left = 503
    Top = 495
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_emp_estrangeira_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TEMPRESA_EST.CD_PAIS'
      Size = 3
    end
  end
  object qry_proc_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT C.NR_PROCESSO, C.NR_CNTR, C.IN_DESOVA, T.NM_TP_CNTR'
      'FROM   TPROCESSO_CNTR C, TTP_CNTR T'
      'WHERE  C.TP_CNTR = T.TP_CNTR AND'
      '       C.NR_PROCESSO = :NR_PROCESSO')
    Left = 575
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_cntr_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_CNTR.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_cntr_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      Origin = 'TPROCESSO_CNTR.NR_CNTR'
    end
    object qry_proc_cntr_IN_DESOVA: TStringField
      FieldName = 'IN_DESOVA'
      Origin = 'TPROCESSO_CNTR.NR_PROCESSO'
      Size = 1
    end
    object qry_proc_cntr_NM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
      Origin = 'TPROCESSO_CNTR.NR_PROCESSO'
    end
  end
  object ds_recinto_setores_importacao: TDataSource
    DataSet = qry_recinto_setores_importacao_
    Left = 35
    Top = 595
  end
  object qry_recinto_setores_importacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TRECINTO_SETORES_IMPORTACAO')
    Left = 35
    Top = 545
    object qry_recinto_setores_importacao_Orgao: TStringField
      FieldName = 'Orgao'
      Origin = 'TRECINTO_SETORES_IMPORTACAO.Orgao'
      Size = 7
    end
    object qry_recinto_setores_importacao_Recinto: TStringField
      FieldName = 'Recinto'
      Origin = 'TRECINTO_SETORES_IMPORTACAO.Recinto'
      Size = 7
    end
    object qry_recinto_setores_importacao_Setor: TStringField
      FieldName = 'Setor'
      Origin = 'TRECINTO_SETORES_IMPORTACAO.Setor'
      Size = 3
    end
    object qry_recinto_setores_importacao_Nome: TStringField
      FieldName = 'Nome'
      Origin = 'TRECINTO_SETORES_IMPORTACAO.Nome'
      Size = 30
    end
  end
  object qry_proc_carga_solta_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, VL_QTDE, NM_ESPECIE'
      'FROM TPROCESSO_CARGA_SOLTA'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 575
    Top = 495
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_carga_solta_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_CARGA_SOLTA.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_carga_solta_VL_QTDE: TFloatField
      FieldName = 'VL_QTDE'
      Origin = 'TPROCESSO_CARGA_SOLTA.VL_QTDE'
    end
    object qry_proc_carga_solta_NM_ESPECIE: TStringField
      FieldName = 'NM_ESPECIE'
      Origin = 'TPROCESSO_CARGA_SOLTA.NR_PROCESSO'
      Size = 100
    end
  end
  object sp_atz_evento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_evento'
    Left = 198
    Top = 545
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 1
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_evento_txt'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_realizacao'
        ParamType = ptInput
      end>
  end
  object sp_di_distribui_deb_com: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_distribui_deb_com'
    Left = 272
    Top = 545
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
      end>
  end
  object ds_pagto_cambio_prev: TDataSource
    DataSet = qry_pagto_cambio_prev_
    Left = 120
    Top = 595
  end
  object qry_pagto_cambio_prev_: TQuery
    BeforeInsert = qry_pagto_cambio_prev_BeforeInsert
    BeforeEdit = qry_pagto_cambio_prev_BeforeEdit
    BeforePost = qry_pagto_cambio_prev_BeforePost
    AfterPost = qry_pagto_cambio_prev_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPAGTO_PREVISTO_CAMBIO_DI'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 196
    Top = 595
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_pagto_cambio_prev_DT_PREV_PGTO_360: TStringField
      FieldName = 'DT_PREV_PGTO_360'
      Origin = 'TPAGTO_PREVISTO_CAMBIO_DI.DT_PREV_PGTO_360'
      EditMask = '!99/9999;0; '
      Size = 6
    end
    object qry_pagto_cambio_prev_VL_PREV_PGTO_360: TFloatField
      FieldName = 'VL_PREV_PGTO_360'
      Origin = 'TPAGTO_PREVISTO_CAMBIO_DI.VL_PREV_PGTO_360'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pagto_cambio_prev_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPAGTO_PREVISTO_CAMBIO_DI.NR_PROCESSO'
      Size = 18
    end
    object qry_pagto_cambio_prev_NR_SEQUENCIA: TStringField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TPAGTO_PREVISTO_CAMBIO_DI.NR_PROCESSO'
      Size = 2
    end
  end
  object qry_ult_seq_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT MAX (NR_SEQUENCIA)  ULTIMO '
      'FROM TPAGTO_PREVISTO_CAMBIO_DI'
      'WHERE NR_PROCESSO=:NR_PROCESSO')
    Left = 274
    Top = 595
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ult_seq_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TPAGTO_PREVISTO_CAMBIO_DI.NR_SEQUENCIA'
      Size = 2
    end
  end
  object qry_emb_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMBARCACAO, NM_EMBARCACAO, CD_BANDEIRA'
      'FROM   TEMBARCACAO'
      'WHERE  CD_EMBARCACAO = :CD_EMBARCACAO ')
    Left = 119
    Top = 545
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMBARCACAO'
        ParamType = ptUnknown
      end>
    object qry_emb_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'TEMBARCACAO.CD_EMBARCACAO'
      Size = 4
    end
    object qry_emb_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Origin = 'TEMBARCACAO.NM_EMBARCACAO'
      Size = 40
    end
    object qry_emb_CD_BANDEIRA: TStringField
      FieldName = 'CD_BANDEIRA'
      Origin = 'TEMBARCACAO.CD_BANDEIRA'
      Size = 3
    end
  end
  object qry_banco_servico_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT S.CD_BANCO_DEB_CC, S.CD_BANCO_DEB_COM, H.CD_RESPONSAVEL'
      'FROM   TCLIENTE_SERVICO S, TCLIENTE_HABILITACAO H, TPROCESSO P'
      'WHERE  P.NR_PROCESSO = :NR_PROCESSO  AND'
      '       H.CD_UNID_NEG = P.CD_UNID_NEG AND'
      '       H.CD_PRODUTO  = P.CD_PRODUTO  AND'
      '       H.CD_CLIENTE  = P.CD_CLIENTE  AND'
      '       S.CD_UNID_NEG = H.CD_UNID_NEG AND'
      '       S.CD_PRODUTO  = H.CD_PRODUTO  AND'
      '       S.CD_CLIENTE  = H.CD_CLIENTE  AND'
      '       S.CD_SERVICO  = P.CD_SERVICO ')
    Left = 353
    Top = 545
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_banco_servico_CD_BANCO_DEB_CC: TStringField
      FieldName = 'CD_BANCO_DEB_CC'
      Origin = 'TCLIENTE_SERVICO.CD_BANCO_DEB_CC'
      Size = 3
    end
    object qry_banco_servico_CD_BANCO_DEB_COM: TStringField
      FieldName = 'CD_BANCO_DEB_COM'
      Origin = 'TCLIENTE_SERVICO.CD_BANCO_DEB_COM'
      Size = 3
    end
    object qry_banco_servico_CD_RESPONSAVEL: TStringField
      FieldName = 'CD_RESPONSAVEL'
      Origin = 'TCLIENTE_HABILITACAO.CD_RESPONSAVEL'
      Size = 1
    end
  end
  object qry_transp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TRANSP_ROD, NM_TRANSP_ROD, CNPJ_TRANSP_ROD'
      'FROM   TTRANSP_ROD R, TPROCESSO P'
      'WHERE  P.CD_TRANSP_NAC = R.CD_TRANSP_ROD AND'
      '       P.NR_PROCESSO = :NR_PROCESSO')
    Left = 424
    Top = 545
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_parametros_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT PC_MAX_SEGURO_DI '
      'FROM   TPARAMETROS')
    Left = 346
    Top = 595
    object qry_parametros_PC_MAX_SEGURO_DI: TFloatField
      FieldName = 'PC_MAX_SEGURO_DI'
      Origin = 'TPARAMETROS.PC_MAX_SEGURO_DI'
    end
  end
  object ds_acrescimo_valoracao: TDataSource
    Left = 652
    Top = 14
  end
  object qry_acrescimo_valoracao_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_acrescimo_valoracao
    SQL.Strings = (
      'SELECT SUM(VL_ACRESCIMO_MN) AS TOTAL_VL_ACRESCIMO'
      'FROM TACRESCIMO_VALORACAO'
      'WHERE NR_PROCESSO =:NR_PROCESSO'
      '')
    Left = 653
    Top = 60
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_acrescimo_valoracao_TOTAL_VL_ACRESCIMO: TFloatField
      FieldName = 'TOTAL_VL_ACRESCIMO'
      Origin = 'TACRESCIMO_VALORACAO.VL_ACRESCIMO_MN'
    end
  end
  object ds_adicao_importacao: TDataSource
    Left = 654
    Top = 105
  end
  object qry_adicao_importacao_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_adicao_importacao
    SQL.Strings = (
      'SELECT VL_DESPESAS_MN, TX_DOLAR'
      'FROM TADICAO_DE_IMPORTACAO '
      'WHERE  NR_PROCESSO=:NR_PROCESSO')
    Left = 654
    Top = 150
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_adicao_importacao_VL_DESPESAS_MN: TFloatField
      FieldName = 'VL_DESPESAS_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_DESPESAS_MN'
    end
    object qry_adicao_importacao_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_DESPESAS_MN'
    end
  end
  object ds_deducao_valoracao: TDataSource
    DataSet = qry_deducao_valoracao_
    Left = 654
    Top = 194
  end
  object qry_deducao_valoracao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT SUM(VL_DEDUCAO_MNEG) AS VL_TOT_MOEDA, SUM(VL_DEDUCAO_MN) ' +
        'AS VL_TOT_REAL'
      'FROM TDEDUCAO_VALORACAO'
      'WHERE NR_PROCESSO =:NR_PROCESSO'
      'GROUP BY VL_DEDUCAO_MNEG, VL_DEDUCAO_MN')
    Left = 654
    Top = 242
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_deducao_valoracao_VL_TOT_MOEDA: TFloatField
      FieldName = 'VL_TOT_MOEDA'
      Origin = 'TDEDUCAO_VALORACAO.VL_DEDUCAO_MNEG'
    end
    object qry_deducao_valoracao_VL_TOT_REAL: TFloatField
      FieldName = 'VL_TOT_REAL'
      Origin = 'TDEDUCAO_VALORACAO.VL_DEDUCAO_MN'
    end
  end
  object TIMP: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CONVERT(NUMERIC(15,2),VL_IPT_A_RECOLHER) AS VL_IMP'
      'FROM TRIBUTO'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'AND NR_ADICAO = :NR_ADICAO'
      'AND CD_RECEITA_IMPOSTO = :CD_RECEITA_IMPOSTO')
    Left = 654
    Top = 290
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
        Name = 'CD_RECEITA_IMPOSTO'
        ParamType = ptUnknown
      end>
  end
  object tbl_acrescimos: TTable
    AfterInsert = tbl_acrescimosAfterInsert
    OnPostError = tbl_acrescimosPostError
    DatabaseName = 'DBBROKER'
    Filter = 'TP_DESPESA = '#39'A'#39
    Filtered = True
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TACRESCIMO_DEDUCAO'
    Left = 750
    Top = 408
    object tbl_acrescimosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 18
    end
    object tbl_acrescimosCD_DESPESA: TStringField
      FieldName = 'CD_DESPESA'
      Required = True
      Size = 2
    end
    object tbl_acrescimosCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Required = True
      Size = 3
    end
    object tbl_acrescimosVL_MOEDA: TFloatField
      FieldName = 'VL_MOEDA'
      Required = True
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object tbl_acrescimosTP_DESPESA: TStringField
      FieldName = 'TP_DESPESA'
      Required = True
      Size = 1
    end
    object tbl_acrescimosTP_BASE: TStringField
      FieldName = 'TP_BASE'
      Required = True
      Size = 5
    end
    object tbl_acrescimoslck_nm_despesa: TStringField
      FieldKind = fkLookup
      FieldName = 'lck_nm_despesa'
      LookupDataSet = tbl_tp_acres_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DESPESA'
      Size = 50
      Lookup = True
    end
  end
  object ds_acrescimos: TDataSource
    DataSet = tbl_acrescimos
    Left = 739
    Top = 408
  end
  object tbl_deducoes: TTable
    AfterInsert = tbl_deducoesAfterInsert
    OnPostError = tbl_deducoesPostError
    DatabaseName = 'DBBROKER'
    Filter = 'TP_DESPESA = '#39'D'#39
    Filtered = True
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TACRESCIMO_DEDUCAO'
    Left = 661
    Top = 415
    object tbl_deducoesNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 18
    end
    object tbl_deducoesCD_DESPESA: TStringField
      FieldName = 'CD_DESPESA'
      Required = True
      Size = 2
    end
    object tbl_deducoesCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Required = True
      Size = 3
    end
    object tbl_deducoesVL_MOEDA: TFloatField
      FieldName = 'VL_MOEDA'
      Required = True
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object tbl_deducoesTP_DESPESA: TStringField
      FieldName = 'TP_DESPESA'
      Required = True
      Size = 1
    end
    object tbl_deducoesTP_BASE: TStringField
      FieldName = 'TP_BASE'
      Required = True
      Size = 5
    end
    object tbl_deducoeslck_nm_despesa: TStringField
      FieldKind = fkLookup
      FieldName = 'lck_nm_despesa'
      LookupDataSet = tbl_tp_dedu_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DESPESA'
      Size = 50
      Lookup = True
    end
  end
  object ds_deducoes: TDataSource
    DataSet = tbl_deducoes
    Left = 654
    Top = 412
  end
  object ds_tp_acres: TDataSource
    DataSet = tbl_tp_acres_
    Left = 655
    Top = 468
  end
  object ds_tp_dedu: TDataSource
    DataSet = tbl_tp_dedu_
    Left = 650
    Top = 466
  end
  object tbl_tp_dedu_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TAB_DEDUCAO'
    UpdateMode = upWhereChanged
    Left = 725
    Top = 475
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
  object tbl_tp_acres_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TAB_ACRESCIMO'
    UpdateMode = upWhereChanged
    Left = 711
    Top = 468
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
  object upd_di: TUpdateSQL
    ModifySQL.Strings = (
      'update TDECLARACAO_IMPORTACAO'
      'set'
      '  NR_IDENT_USUARIO = :NR_IDENT_USUARIO,'
      '  CD_APLICACAO_MERC = :CD_APLICACAO_MERC,'
      '  CD_BANDEIRA_TRANSP = :CD_BANDEIRA_TRANSP,'
      '  CD_COBERTURA_CAMBIAL = :CD_COBERTURA_CAMBIAL,'
      '  CD_DESTAQUE_NCM = :CD_DESTAQUE_NCM,'
      '  CD_FORMA_PAGAMENTO = :CD_FORMA_PAGAMENTO,'
      '  CD_FUND_LEGAL_II = :CD_FUND_LEGAL_II,'
      '  CD_IMPORTADOR = :CD_IMPORTADOR,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  CD_LOCAL_EMBARQUE = :CD_LOCAL_EMBARQUE,'
      '  CD_METODO_VALORACAO = :CD_METODO_VALORACAO,'
      '  CD_MODALIDADE_DESP = :CD_MODALIDADE_DESP,'
      '  CD_MODALIDADE_PAGTO = :CD_MODALIDADE_PAGTO,'
      '  CD_MOEDA_DESPESAS = :CD_MOEDA_DESPESAS,'
      '  CD_MOEDA_FRETE = :CD_MOEDA_FRETE,'
      '  CD_MOEDA_MLE = :CD_MOEDA_MLE,'
      '  CD_MOEDA_SEGURO = :CD_MOEDA_SEGURO,'
      '  CD_MOTIVO_SEM_COBERTURA = :CD_MOTIVO_SEM_COBERTURA,'
      '  CD_MOTIVO_TRANS = :CD_MOTIVO_TRANS,'
      '  CD_PAIS_IMPORTADOR = :CD_PAIS_IMPORTADOR,'
      '  CD_PAIS_PROC_CARGA = :CD_PAIS_PROC_CARGA,'
      '  CD_RECINTO_ALFAND = :CD_RECINTO_ALFAND,'
      '  CD_REG_TRIB_II = :CD_REG_TRIB_II,'
      '  CD_REG_TRIB_IPI = :CD_REG_TRIB_IPI,'
      '  CD_SETOR_ARMAZENAM = :CD_SETOR_ARMAZENAM,'
      '  CD_TIPO_AG_CARGA = :CD_TIPO_AG_CARGA,'
      '  CD_TIPO_CONSIG = :CD_TIPO_CONSIG,'
      '  CD_TIPO_DCTO_CARGA = :CD_TIPO_DCTO_CARGA,'
      '  CD_TIPO_DECLARACAO = :CD_TIPO_DECLARACAO,'
      '  CD_TIPO_IMPORTADOR = :CD_TIPO_IMPORTADOR,'
      '  CD_TIPO_MANIFESTO = :CD_TIPO_MANIFESTO,'
      '  CD_TRANSPORTADOR = :CD_TRANSPORTADOR,'
      '  CD_URF_DESPACHO = :CD_URF_DESPACHO,'
      '  CD_URF_ENTR_CARGA = :CD_URF_ENTR_CARGA,'
      '  CD_UTIL_DCTO_CARGA = :CD_UTIL_DCTO_CARGA,'
      '  CD_VIA_TRANSP_CARG = :CD_VIA_TRANSP_CARG,'
      '  CD_VINC_IMPO_EXPO = :CD_VINC_IMPO_EXPO,'
      '  DT_CHEGADA_CARGA = :DT_CHEGADA_CARGA,'
      '  DT_EMBARQUE = :DT_EMBARQUE,'
      '  DT_PROCESSAMENTO = :DT_PROCESSAMENTO,'
      '  DT_REGISTRO_DI = :DT_REGISTRO_DI,'
      '  DT_TRANSMISSAO = :DT_TRANSMISSAO,'
      '  IN_BEM_ENCOMENDA = :IN_BEM_ENCOMENDA,'
      '  IN_MATERIAL_USADO = :IN_MATERIAL_USADO,'
      '  IN_MOEDA_NACIONAL = :IN_MOEDA_NACIONAL,'
      '  IN_MOEDA_UNICA = :IN_MOEDA_UNICA,'
      '  IN_MULTIMODAL = :IN_MULTIMODAL,'
      '  IN_OPERACAO_FUNDAP = :IN_OPERACAO_FUNDAP,'
      '  IN_RATEAR_FRETE_ITENS = :IN_RATEAR_FRETE_ITENS,'
      '  IN_RATEAR_SEGURO_ITENS = :IN_RATEAR_SEGURO_ITENS,'
      '  IN_REPASSA_DADOS_ADICAO = :IN_REPASSA_DADOS_ADICAO,'
      '  IN_REPASSA_DADOS_CAMBIO = :IN_REPASSA_DADOS_CAMBIO,'
      '  NM_CONSIGNATARIO = :NM_CONSIGNATARIO,'
      '  NM_VEICULO_TRANSP = :NM_VEICULO_TRANSP,'
      '  NR_AGENTE_CARGA = :NR_AGENTE_CARGA,'
      '  NR_BANCO_COM = :NR_BANCO_COM,'
      '  NR_BANCO_PAGAMENTO = :NR_BANCO_PAGAMENTO,'
      '  NR_COMPRADOR_ME = :NR_COMPRADOR_ME,'
      '  NR_CONSIGNATARIO = :NR_CONSIGNATARIO,'
      '  NR_CONTRATO_CAMBIO = :NR_CONTRATO_CAMBIO,'
      '  NR_CPF_REPR_LEGAL = :NR_CPF_REPR_LEGAL,'
      '  NR_DCTO_CARGA = :NR_DCTO_CARGA,'
      '  NR_DCTO_CARGA_MAST = :NR_DCTO_CARGA_MAST,'
      '  NR_DECL_IMP_PROT = :NR_DECL_IMP_PROT,'
      '  NR_DECLARACAO_IMP = :NR_DECLARACAO_IMP,'
      '  NR_IDENTIFICACAO_COM = :NR_IDENTIFICACAO_COM,'
      '  NR_MANIFESTO = :NR_MANIFESTO,'
      '  NR_PRACA_COM = :NR_PRACA_COM,'
      '  NR_PRACA_PAGAMENTO = :NR_PRACA_PAGAMENTO,'
      '  NR_ROF = :NR_ROF,'
      '  NR_VEICULO_TRANSP = :NR_VEICULO_TRANSP,'
      '  PB_CARGA = :PB_CARGA,'
      '  PC_COMISSAO = :PC_COMISSAO,'
      '  PC_ICMS = :PC_ICMS,'
      '  PC_REDUCAO_ICMS = :PC_REDUCAO_ICMS,'
      '  PL_CARGA = :PL_CARGA,'
      '  QT_ADICOES = :QT_ADICOES,'
      '  TX_INFO_COMPL = :TX_INFO_COMPL,'
      '  VL_FRETE_TNAC_MNEG = :VL_FRETE_TNAC_MNEG,'
      '  VL_TOT_DESPS_MN = :VL_TOT_DESPS_MN,'
      '  VL_TOT_DESPS_MNEG = :VL_TOT_DESPS_MNEG,'
      '  VL_TOT_FRT_COLLECT = :VL_TOT_FRT_COLLECT,'
      '  VL_TOT_FRT_PREPAID = :VL_TOT_FRT_PREPAID,'
      '  VL_TOT_MLE_MNEG = :VL_TOT_MLE_MNEG,'
      '  VL_TOT_SEGURO_MNEG = :VL_TOT_SEGURO_MNEG,'
      '  VL_TOTAL_FRETE_MN = :VL_TOTAL_FRETE_MN,'
      '  VL_TOTAL_MLE_MN = :VL_TOTAL_MLE_MN,'
      '  VL_TOTAL_SEG_MN = :VL_TOTAL_SEG_MN,'
      '  PC_SEGURO_MLE = :PC_SEGURO_MLE,'
      '  VL_TOTAL_II = :VL_TOTAL_II,'
      '  VL_TOTAL_IPI = :VL_TOTAL_IPI,'
      '  VL_TOTAL_AD = :VL_TOTAL_AD,'
      '  DT_ULTIMA_ALTERACAO = :DT_ULTIMA_ALTERACAO,'
      '  IN_RISC_ATUALIZADO = :IN_RISC_ATUALIZADO,'
      '  CD_TIPO_BASE_SEGURO = :CD_TIPO_BASE_SEGURO,'
      '  IN_REB = :IN_REB,'
      '  VL_TOT_ICMS = :VL_TOT_ICMS,'
      '  CD_TIPO_PGTO_TRIB = :CD_TIPO_PGTO_TRIB,'
      '  NR_CONTA_PGTO_TRIB = :NR_CONTA_PGTO_TRIB,'
      '  TX_MLE = :TX_MLE,'
      '  TX_FRETE = :TX_FRETE,'
      '  TX_SEGURO = :TX_SEGURO,'
      '  TX_DOLAR = :TX_DOLAR,'
      '  NR_REF_CLI = :NR_REF_CLI,'
      '  IN_SISCOMEX = :IN_SISCOMEX,'
      '  CD_TIPO_ICMS = :CD_TIPO_ICMS,'
      '  IN_ICMS_IMPRESSO = :IN_ICMS_IMPRESSO,'
      '  DT_ICMS_IMPRESSO = :DT_ICMS_IMPRESSO,'
      '  VL_TOTAL_ACRESCIMOS_MN = :VL_TOTAL_ACRESCIMOS_MN,'
      '  VL_TOTAL_DEDUCOES_MN = :VL_TOTAL_DEDUCOES_MN,'
      '  VL_DESPESA_ITEM = :VL_DESPESA_ITEM,'
      '  VL_DESPESA_ITEM_MN = :VL_DESPESA_ITEM_MN,'
      '  CD_ORGAO_FIN_INTER = :CD_ORGAO_FIN_INTER,'
      '  CD_PRESENCA_CARGA = :CD_PRESENCA_CARGA,'
      '  NR_SEQ_RETIFICACAO = :NR_SEQ_RETIFICACAO,'
      '  CD_MOTIVO_RETIF = :CD_MOTIVO_RETIF,'
      '  DT_RETIFICACAO = :DT_RETIFICACAO,'
      '  DT_EXON_IMPRESSO = :DT_EXON_IMPRESSO,'
      '  IN_EXON_IMPRESSO = :IN_EXON_IMPRESSO,'
      '  CD_TRIBUTACAO_ICMS = :CD_TRIBUTACAO_ICMS,'
      '  CD_FUND_LEGAL_ICMS = :CD_FUND_LEGAL_ICMS,'
      '  VL_TOTAL_CAMBIO = :VL_TOTAL_CAMBIO,'
      '  CD_AUSENCIA_FABRIC = :CD_AUSENCIA_FABRIC,'
      '  CD_FORNECEDOR = :CD_FORNECEDOR,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_PAIS_AQUIS_MERC = :CD_PAIS_AQUIS_MERC,'
      '  CD_PAIS_ORIG_MERC = :CD_PAIS_ORIG_MERC,'
      '  QT_PARC_FINANC_360 = :QT_PARC_FINANC_360,'
      '  QT_PERIOD_PGTO_360 = :QT_PERIOD_PGTO_360,'
      '  CD_PERIOD_PGTO_360 = :CD_PERIOD_PGTO_360,'
      '  IN_EMBUT_FRT_ITENS = :IN_EMBUT_FRT_ITENS,'
      '  IN_EMBUT_SEG_ITENS = :IN_EMBUT_SEG_ITENS,'
      '  VL_TOTAL_ACRESCIMOS_MNEG = :VL_TOTAL_ACRESCIMOS_MNEG,'
      '  VL_TOTAL_DEDUCOES_MNEG = :VL_TOTAL_DEDUCOES_MNEG,'
      '  VL_TOTAL_FRETE_MNEG = :VL_TOTAL_FRETE_MNEG,'
      '  NR_PROCESSO_SISCOMEX = :NR_PROCESSO_SISCOMEX,'
      '  IN_PGTO_VARIAV_360 = :IN_PGTO_VARIAV_360,'
      '  CD_VEICULO_TRANSP = :CD_VEICULO_TRANSP,'
      '  PC_REDUCAO_IPT_BLI = :PC_REDUCAO_IPT_BLI,'
      '  DT_DI = :DT_DI,'
      '  VL_TOTAL_TX_SCX = :VL_TOTAL_TX_SCX,'
      '  VL_TOT_PIS_COFINS = :VL_TOT_PIS_COFINS,'
      '  VL_TOTAL_SEGURO_MN = :VL_TOTAL_SEGURO_MN,'
      '  IN_FMA = :IN_FMA,'
      '  DT_PAGAMENTO_DARF = :DT_PAGAMENTO_DARF,'
      '  TX_INFO_COMPL_AUTO = :TX_INFO_COMPL_AUTO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TDECLARACAO_IMPORTACAO'
      
        '  (NR_IDENT_USUARIO, CD_APLICACAO_MERC, CD_BANDEIRA_TRANSP, CD_C' +
        'OBERTURA_CAMBIAL, '
      
        '   CD_DESTAQUE_NCM, CD_FORMA_PAGAMENTO, CD_FUND_LEGAL_II, CD_IMP' +
        'ORTADOR, '
      
        '   CD_INCOTERM, CD_LOCAL_EMBARQUE, CD_METODO_VALORACAO, CD_MODAL' +
        'IDADE_DESP, '
      
        '   CD_MODALIDADE_PAGTO, CD_MOEDA_DESPESAS, CD_MOEDA_FRETE, CD_MO' +
        'EDA_MLE, '
      
        '   CD_MOEDA_SEGURO, CD_MOTIVO_SEM_COBERTURA, CD_MOTIVO_TRANS, CD' +
        '_PAIS_IMPORTADOR, '
      
        '   CD_PAIS_PROC_CARGA, CD_RECINTO_ALFAND, CD_REG_TRIB_II, CD_REG' +
        '_TRIB_IPI, '
      
        '   CD_SETOR_ARMAZENAM, CD_TIPO_AG_CARGA, CD_TIPO_CONSIG, CD_TIPO' +
        '_DCTO_CARGA, '
      
        '   CD_TIPO_DECLARACAO, CD_TIPO_IMPORTADOR, CD_TIPO_MANIFESTO, CD' +
        '_TRANSPORTADOR, '
      
        '   CD_URF_DESPACHO, CD_URF_ENTR_CARGA, CD_UTIL_DCTO_CARGA, CD_VI' +
        'A_TRANSP_CARG, '
      
        '   CD_VINC_IMPO_EXPO, DT_CHEGADA_CARGA, DT_EMBARQUE, DT_PROCESSA' +
        'MENTO, '
      
        '   DT_REGISTRO_DI, DT_TRANSMISSAO, IN_BEM_ENCOMENDA, IN_MATERIAL' +
        '_USADO, '
      
        '   IN_MOEDA_NACIONAL, IN_MOEDA_UNICA, IN_MULTIMODAL, IN_OPERACAO' +
        '_FUNDAP, '
      
        '   IN_RATEAR_FRETE_ITENS, IN_RATEAR_SEGURO_ITENS, IN_REPASSA_DAD' +
        'OS_ADICAO, '
      
        '   IN_REPASSA_DADOS_CAMBIO, NM_CONSIGNATARIO, NM_VEICULO_TRANSP,' +
        ' NR_AGENTE_CARGA, '
      
        '   NR_BANCO_COM, NR_BANCO_PAGAMENTO, NR_COMPRADOR_ME, NR_CONSIGN' +
        'ATARIO, '
      
        '   NR_CONTRATO_CAMBIO, NR_CPF_REPR_LEGAL, NR_DCTO_CARGA, NR_DCTO' +
        '_CARGA_MAST, '
      
        '   NR_DECL_IMP_PROT, NR_DECLARACAO_IMP, NR_IDENTIFICACAO_COM, NR' +
        '_MANIFESTO, '
      
        '   NR_PRACA_COM, NR_PRACA_PAGAMENTO, NR_ROF, NR_VEICULO_TRANSP, ' +
        'PB_CARGA, '
      
        '   PC_COMISSAO, PC_ICMS, PC_REDUCAO_ICMS, PL_CARGA, QT_ADICOES, ' +
        'TX_INFO_COMPL, '
      
        '   VL_FRETE_TNAC_MNEG, VL_TOT_DESPS_MN, VL_TOT_DESPS_MNEG, VL_TO' +
        'T_FRT_COLLECT, '
      
        '   VL_TOT_FRT_PREPAID, VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_T' +
        'OTAL_FRETE_MN, '
      
        '   VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, PC_SEGURO_MLE, VL_TOTAL_II,' +
        ' VL_TOTAL_IPI, '
      
        '   VL_TOTAL_AD, DT_ULTIMA_ALTERACAO, IN_RISC_ATUALIZADO, CD_TIPO' +
        '_BASE_SEGURO, '
      
        '   IN_REB, VL_TOT_ICMS, CD_TIPO_PGTO_TRIB, NR_CONTA_PGTO_TRIB, T' +
        'X_MLE, '
      
        '   TX_FRETE, TX_SEGURO, TX_DOLAR, NR_REF_CLI, IN_SISCOMEX, CD_TI' +
        'PO_ICMS, '
      
        '   IN_ICMS_IMPRESSO, DT_ICMS_IMPRESSO, VL_TOTAL_ACRESCIMOS_MN, V' +
        'L_TOTAL_DEDUCOES_MN, '
      
        '   VL_DESPESA_ITEM, VL_DESPESA_ITEM_MN, CD_ORGAO_FIN_INTER, CD_P' +
        'RESENCA_CARGA, '
      
        '   NR_SEQ_RETIFICACAO, CD_MOTIVO_RETIF, DT_RETIFICACAO, DT_EXON_' +
        'IMPRESSO, '
      
        '   IN_EXON_IMPRESSO, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, VL_' +
        'TOTAL_CAMBIO, '
      
        '   CD_AUSENCIA_FABRIC, CD_FORNECEDOR, CD_FABRICANTE, CD_PAIS_AQU' +
        'IS_MERC, '
      
        '   CD_PAIS_ORIG_MERC, QT_PARC_FINANC_360, QT_PERIOD_PGTO_360, CD' +
        '_PERIOD_PGTO_360, '
      
        '   IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS, VL_TOTAL_ACRESCIMOS_M' +
        'NEG, VL_TOTAL_DEDUCOES_MNEG, '
      
        '   VL_TOTAL_FRETE_MNEG, NR_PROCESSO_SISCOMEX, IN_PGTO_VARIAV_360' +
        ', CD_VEICULO_TRANSP, '
      
        '   PC_REDUCAO_IPT_BLI, DT_DI, VL_TOTAL_TX_SCX, VL_TOT_PIS_COFINS' +
        ', VL_TOTAL_SEGURO_MN, '
      '   IN_FMA, DT_PAGAMENTO_DARF, TX_INFO_COMPL_AUTO)'
      'values'
      
        '  (:NR_IDENT_USUARIO, :CD_APLICACAO_MERC, :CD_BANDEIRA_TRANSP, :' +
        'CD_COBERTURA_CAMBIAL, '
      
        '   :CD_DESTAQUE_NCM, :CD_FORMA_PAGAMENTO, :CD_FUND_LEGAL_II, :CD' +
        '_IMPORTADOR, '
      
        '   :CD_INCOTERM, :CD_LOCAL_EMBARQUE, :CD_METODO_VALORACAO, :CD_M' +
        'ODALIDADE_DESP, '
      
        '   :CD_MODALIDADE_PAGTO, :CD_MOEDA_DESPESAS, :CD_MOEDA_FRETE, :C' +
        'D_MOEDA_MLE, '
      
        '   :CD_MOEDA_SEGURO, :CD_MOTIVO_SEM_COBERTURA, :CD_MOTIVO_TRANS,' +
        ' :CD_PAIS_IMPORTADOR, '
      
        '   :CD_PAIS_PROC_CARGA, :CD_RECINTO_ALFAND, :CD_REG_TRIB_II, :CD' +
        '_REG_TRIB_IPI, '
      
        '   :CD_SETOR_ARMAZENAM, :CD_TIPO_AG_CARGA, :CD_TIPO_CONSIG, :CD_' +
        'TIPO_DCTO_CARGA, '
      
        '   :CD_TIPO_DECLARACAO, :CD_TIPO_IMPORTADOR, :CD_TIPO_MANIFESTO,' +
        ' :CD_TRANSPORTADOR, '
      
        '   :CD_URF_DESPACHO, :CD_URF_ENTR_CARGA, :CD_UTIL_DCTO_CARGA, :C' +
        'D_VIA_TRANSP_CARG, '
      
        '   :CD_VINC_IMPO_EXPO, :DT_CHEGADA_CARGA, :DT_EMBARQUE, :DT_PROC' +
        'ESSAMENTO, '
      
        '   :DT_REGISTRO_DI, :DT_TRANSMISSAO, :IN_BEM_ENCOMENDA, :IN_MATE' +
        'RIAL_USADO, '
      
        '   :IN_MOEDA_NACIONAL, :IN_MOEDA_UNICA, :IN_MULTIMODAL, :IN_OPER' +
        'ACAO_FUNDAP, '
      
        '   :IN_RATEAR_FRETE_ITENS, :IN_RATEAR_SEGURO_ITENS, :IN_REPASSA_' +
        'DADOS_ADICAO, '
      
        '   :IN_REPASSA_DADOS_CAMBIO, :NM_CONSIGNATARIO, :NM_VEICULO_TRAN' +
        'SP, :NR_AGENTE_CARGA, '
      
        '   :NR_BANCO_COM, :NR_BANCO_PAGAMENTO, :NR_COMPRADOR_ME, :NR_CON' +
        'SIGNATARIO, '
      
        '   :NR_CONTRATO_CAMBIO, :NR_CPF_REPR_LEGAL, :NR_DCTO_CARGA, :NR_' +
        'DCTO_CARGA_MAST, '
      
        '   :NR_DECL_IMP_PROT, :NR_DECLARACAO_IMP, :NR_IDENTIFICACAO_COM,' +
        ' :NR_MANIFESTO, '
      
        '   :NR_PRACA_COM, :NR_PRACA_PAGAMENTO, :NR_ROF, :NR_VEICULO_TRAN' +
        'SP, :PB_CARGA, '
      
        '   :PC_COMISSAO, :PC_ICMS, :PC_REDUCAO_ICMS, :PL_CARGA, :QT_ADIC' +
        'OES, :TX_INFO_COMPL, '
      
        '   :VL_FRETE_TNAC_MNEG, :VL_TOT_DESPS_MN, :VL_TOT_DESPS_MNEG, :V' +
        'L_TOT_FRT_COLLECT, '
      
        '   :VL_TOT_FRT_PREPAID, :VL_TOT_MLE_MNEG, :VL_TOT_SEGURO_MNEG, :' +
        'VL_TOTAL_FRETE_MN, '
      
        '   :VL_TOTAL_MLE_MN, :VL_TOTAL_SEG_MN, :PC_SEGURO_MLE, :VL_TOTAL' +
        '_II, :VL_TOTAL_IPI, '
      
        '   :VL_TOTAL_AD, :DT_ULTIMA_ALTERACAO, :IN_RISC_ATUALIZADO, :CD_' +
        'TIPO_BASE_SEGURO, '
      
        '   :IN_REB, :VL_TOT_ICMS, :CD_TIPO_PGTO_TRIB, :NR_CONTA_PGTO_TRI' +
        'B, :TX_MLE, '
      
        '   :TX_FRETE, :TX_SEGURO, :TX_DOLAR, :NR_REF_CLI, :IN_SISCOMEX, ' +
        ':CD_TIPO_ICMS, '
      
        '   :IN_ICMS_IMPRESSO, :DT_ICMS_IMPRESSO, :VL_TOTAL_ACRESCIMOS_MN' +
        ', :VL_TOTAL_DEDUCOES_MN, '
      
        '   :VL_DESPESA_ITEM, :VL_DESPESA_ITEM_MN, :CD_ORGAO_FIN_INTER, :' +
        'CD_PRESENCA_CARGA, '
      
        '   :NR_SEQ_RETIFICACAO, :CD_MOTIVO_RETIF, :DT_RETIFICACAO, :DT_E' +
        'XON_IMPRESSO, '
      
        '   :IN_EXON_IMPRESSO, :CD_TRIBUTACAO_ICMS, :CD_FUND_LEGAL_ICMS, ' +
        ':VL_TOTAL_CAMBIO, '
      
        '   :CD_AUSENCIA_FABRIC, :CD_FORNECEDOR, :CD_FABRICANTE, :CD_PAIS' +
        '_AQUIS_MERC, '
      
        '   :CD_PAIS_ORIG_MERC, :QT_PARC_FINANC_360, :QT_PERIOD_PGTO_360,' +
        ' :CD_PERIOD_PGTO_360, '
      
        '   :IN_EMBUT_FRT_ITENS, :IN_EMBUT_SEG_ITENS, :VL_TOTAL_ACRESCIMO' +
        'S_MNEG, '
      
        '   :VL_TOTAL_DEDUCOES_MNEG, :VL_TOTAL_FRETE_MNEG, :NR_PROCESSO_S' +
        'ISCOMEX, '
      
        '   :IN_PGTO_VARIAV_360, :CD_VEICULO_TRANSP, :PC_REDUCAO_IPT_BLI,' +
        ' :DT_DI, '
      
        '   :VL_TOTAL_TX_SCX, :VL_TOT_PIS_COFINS, :VL_TOTAL_SEGURO_MN, :I' +
        'N_FMA, '
      '   :DT_PAGAMENTO_DARF, :TX_INFO_COMPL_AUTO)')
    DeleteSQL.Strings = (
      'delete from TDECLARACAO_IMPORTACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 128
    Top = 16
  end
  object sp_di_atualiza_volumes: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_atualiza_volumes'
    Left = 736
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
        Value = 0
      end>
  end
  object SP_CALCULO_SEGURO: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_CALCULO_SEGURO'
    Left = 682
    Top = 349
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_SEGURO_MN'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = '@VL_SEGURO_MNEG'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = '@CD_TIPO_BASE_SEGURO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@PC_SEGURO_MLE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@CD_MOEDA_SEGURO'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = '@CD_MOEDA_MLE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@TX_MLE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CD_MOEDA_FRETE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@TX_FRETE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@TX_SEGURO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@TX_DOLAR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@IN_MOEDA_UNICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@IN_EMBUT_FRT_ITENS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOTAL_MLE_MN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOT_MLE_MNEG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOT_DESPS_MN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOT_DESPS_MNEG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOTAL_FRETE_MN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOT_FRT_COLLECT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOT_FRT_PREPAID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_FRETE_TNAC_MNEG'
        ParamType = ptInput
      end>
  end
  object qryMoedasTaxas: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT M.CD_MOEDA, DI.DT_CALCULO, C.TX_CAMBIO'
      'FROM TDECLARACAO_IMPORTACAO DI'
      '   INNER JOIN (SELECT NR_PROCESSO, CD_MOEDA_DESPESAS AS CD_MOEDA'
      '               FROM TDECLARACAO_IMPORTACAO'
      '               UNION'
      '               SELECT NR_PROCESSO, CD_MOEDA_FRETE AS CD_MOEDA'
      '               FROM TDECLARACAO_IMPORTACAO'
      '               UNION'
      '               SELECT NR_PROCESSO, CD_MOEDA_MLE AS CD_MOEDA'
      '               FROM TDECLARACAO_IMPORTACAO'
      '               UNION'
      '               SELECT NR_PROCESSO, CD_MOEDA_SEGURO AS CD_MOEDA'
      '               FROM TDECLARACAO_IMPORTACAO'
      '               UNION'
      
        '               SELECT NR_PROCESSO, CD_MOEDAS_DESPESAS AS CD_MOED' +
        'A'
      '               FROM TADICAO_DE_IMPORTACAO'
      '               UNION'
      '               SELECT NR_PROCESSO, CD_MOEDA_MLE AS CD_MOEDA'
      '               FROM TADICAO_DE_IMPORTACAO'
      '               UNION'
      
        '               SELECT NR_PROCESSO, CD_MOEDA_NEGOCIADA AS CD_MOED' +
        'A'
      
        '               FROM TADICAO_DE_IMPORTACAO) AS M ON M.NR_PROCESSO' +
        ' = DI.NR_PROCESSO'
      '   LEFT  JOIN TTAXA_CAMBIO C ON C.CD_MOEDA = M.CD_MOEDA'
      
        '                            AND CONVERT(DATETIME, CONVERT(VARCHA' +
        'R, DI.DT_CALCULO, 103), 103) BETWEEN C.DT_INICIO_VIGENCIA AND C.' +
        'DT_TERMINO_VIGENCIA'
      'WHERE DI.NR_PROCESSO = :NR_PROCESSO'
      '  AND ISNULL(M.CD_MOEDA, '#39#39') <> '#39#39
      '  AND C.TX_CAMBIO IS NULL')
    Left = 755
    Top = 51
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryMoedasTaxasCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qryMoedasTaxasDT_CALCULO: TDateTimeField
      FieldName = 'DT_CALCULO'
    end
    object qryMoedasTaxasTX_CAMBIO: TFloatField
      FieldName = 'TX_CAMBIO'
    end
  end
  object qry_DE_DI: TQuery
    CachedUpdates = True
    AfterPost = qry_DE_DIAfterPost
    AfterDelete = qry_DE_DIAfterPost
    OnNewRecord = qry_DE_DINewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TDECLARACAO_IMPORTACAO_DE'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = upd_DE_DI
    Left = 757
    Top = 148
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_DE_DINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO_DE.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_DE_DINR_DE_MERCOSUL: TStringField
      FieldName = 'NR_DE_MERCOSUL'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO_DE.NR_DE_MERCOSUL'
      FixedChar = True
      Size = 16
    end
    object qry_DE_DINR_RE_INICIAL: TStringField
      FieldName = 'NR_RE_INICIAL'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO_DE.NR_RE_INICIAL'
      FixedChar = True
      Size = 4
    end
    object qry_DE_DINR_RE_FINAL: TStringField
      FieldName = 'NR_RE_FINAL'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO_DE.NR_RE_FINAL'
      FixedChar = True
      Size = 4
    end
  end
  object ds_DE_DI: TDataSource
    DataSet = qry_DE_DI
    Left = 758
    Top = 185
  end
  object upd_DE_DI: TUpdateSQL
    ModifySQL.Strings = (
      'update TDECLARACAO_IMPORTACAO_DE'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_DE_MERCOSUL = :NR_DE_MERCOSUL,'
      '  NR_RE_INICIAL = :NR_RE_INICIAL,'
      '  NR_RE_FINAL = :NR_RE_FINAL'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_DE_MERCOSUL = :OLD_NR_DE_MERCOSUL and'
      '  NR_RE_INICIAL = :OLD_NR_RE_INICIAL and'
      '  NR_RE_FINAL = :OLD_NR_RE_FINAL')
    InsertSQL.Strings = (
      'insert into TDECLARACAO_IMPORTACAO_DE'
      '  (NR_PROCESSO, NR_DE_MERCOSUL, NR_RE_INICIAL, NR_RE_FINAL)'
      'values'
      '  (:NR_PROCESSO, :NR_DE_MERCOSUL, :NR_RE_INICIAL, :NR_RE_FINAL)')
    DeleteSQL.Strings = (
      'delete from TDECLARACAO_IMPORTACAO_DE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_DE_MERCOSUL = :OLD_NR_DE_MERCOSUL and'
      '  NR_RE_INICIAL = :OLD_NR_RE_INICIAL and'
      '  NR_RE_FINAL = :OLD_NR_RE_FINAL')
    Left = 756
    Top = 115
  end
  object qry_di_darf_: TQuery
    CachedUpdates = True
    BeforePost = qry_di_darf_BeforePost
    AfterPost = qry_di_darf_AfterPost
    BeforeDelete = qry_di_BeforeDelete
    AfterDelete = qry_di_darf_AfterPost
    OnCalcFields = qry_di_darf_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TPAGAMENTO_TRIBUTOS'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = upd_di_darf
    Left = 512
    Top = 547
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_darf_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPAGAMENTO_TRIBUTOS.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_di_darf_CD_RECEITA_PGTO: TStringField
      FieldName = 'CD_RECEITA_PGTO'
      Origin = 'DBBROKER.TPAGAMENTO_TRIBUTOS.CD_RECEITA_PGTO'
      FixedChar = True
      Size = 4
    end
    object qry_di_darf_CD_BANCO_PGTO_TRIB: TStringField
      FieldName = 'CD_BANCO_PGTO_TRIB'
      Origin = 'DBBROKER.TPAGAMENTO_TRIBUTOS.CD_BANCO_PGTO_TRIB'
      FixedChar = True
      Size = 3
    end
    object qry_di_darf_NR_AGENC_PGTO_TRIB: TStringField
      FieldName = 'NR_AGENC_PGTO_TRIB'
      Origin = 'DBBROKER.TPAGAMENTO_TRIBUTOS.NR_AGENC_PGTO_TRIB'
      FixedChar = True
      Size = 5
    end
    object qry_di_darf_VL_TRIBUTO_PAGO: TFloatField
      DisplayLabel = 'Valor Total (R$)'
      FieldName = 'VL_TRIBUTO_PAGO'
      Origin = 'DBBROKER.TPAGAMENTO_TRIBUTOS.VL_TRIBUTO_PAGO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_di_darf_DT_PGTO_TRIBUTO: TStringField
      FieldName = 'DT_PGTO_TRIBUTO'
      Origin = 'DBBROKER.TPAGAMENTO_TRIBUTOS.DT_PGTO_TRIBUTO'
      EditMask = '!99/99/9999;0; '
      FixedChar = True
      Size = 8
    end
    object qry_di_darf_VL_MULTA_PGTO_TRIB: TFloatField
      FieldName = 'VL_MULTA_PGTO_TRIB'
      Origin = 'DBBROKER.TPAGAMENTO_TRIBUTOS.VL_MULTA_PGTO_TRIB'
    end
    object qry_di_darf_VL_JUROS_PGTO_TRIB: TFloatField
      FieldName = 'VL_JUROS_PGTO_TRIB'
      Origin = 'DBBROKER.TPAGAMENTO_TRIBUTOS.VL_JUROS_PGTO_TRIB'
    end
    object qry_di_darf_CALC_VL_ADM_TEMP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_VL_ADM_TEMP'
      Calculated = True
    end
  end
  object upd_di_darf: TUpdateSQL
    ModifySQL.Strings = (
      'update TPAGAMENTO_TRIBUTOS'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_RECEITA_PGTO = :CD_RECEITA_PGTO,'
      '  CD_BANCO_PGTO_TRIB = :CD_BANCO_PGTO_TRIB,'
      '  NR_AGENC_PGTO_TRIB = :NR_AGENC_PGTO_TRIB,'
      '  VL_TRIBUTO_PAGO = :VL_TRIBUTO_PAGO,'
      '  DT_PGTO_TRIBUTO = :DT_PGTO_TRIBUTO,'
      '  VL_MULTA_PGTO_TRIB = :VL_MULTA_PGTO_TRIB,'
      '  VL_JUROS_PGTO_TRIB = :VL_JUROS_PGTO_TRIB'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_RECEITA_PGTO = :OLD_CD_RECEITA_PGTO')
    InsertSQL.Strings = (
      'insert into TPAGAMENTO_TRIBUTOS'
      
        '  (NR_PROCESSO, CD_RECEITA_PGTO, CD_BANCO_PGTO_TRIB, NR_AGENC_PG' +
        'TO_TRIB, '
      
        '   VL_TRIBUTO_PAGO, DT_PGTO_TRIBUTO, VL_MULTA_PGTO_TRIB, VL_JURO' +
        'S_PGTO_TRIB)'
      'values'
      
        '  (:NR_PROCESSO, :CD_RECEITA_PGTO, :CD_BANCO_PGTO_TRIB, :NR_AGEN' +
        'C_PGTO_TRIB, '
      
        '   :VL_TRIBUTO_PAGO, :DT_PGTO_TRIBUTO, :VL_MULTA_PGTO_TRIB, :VL_' +
        'JUROS_PGTO_TRIB)')
    DeleteSQL.Strings = (
      'delete from TPAGAMENTO_TRIBUTOS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_RECEITA_PGTO = :OLD_CD_RECEITA_PGTO')
    Left = 573
    Top = 548
  end
  object cdssp_observacoes_di_regras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
      end>
    ProviderName = 'dspsp_observacoes_di_regras'
    Left = 656
    Top = 600
  end
  object dspsp_observacoes_di_regras: TDataSetProvider
    DataSet = sp_observacoes_di_regras
    Left = 560
    Top = 616
  end
  object sp_observacoes_di_regras: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_observacoes_di_regras'
    Left = 471
    Top = 599
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
      end>
  end
end
