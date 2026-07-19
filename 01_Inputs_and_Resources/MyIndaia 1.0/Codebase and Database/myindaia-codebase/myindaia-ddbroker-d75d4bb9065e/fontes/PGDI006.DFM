object di: Tdi
  Left = 183
  Top = 30
  Height = 564
  Width = 484
  object ds_di: TDataSource
    DataSet = tbl_di_
    Left = 52
    Top = 4
  end
  object tbl_di_: TTable
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO'
    TableName = 'TDECLARACAO_IMPORTACAO'
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 32
    object tbl_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_di_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 15
    end
    object tbl_di_NR_DECL_IMP_PROT: TStringField
      FieldName = 'NR_DECL_IMP_PROT'
      Size = 10
    end
    object tbl_di_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      EditMask = '99/9999999-9;0; '
      Size = 10
    end
    object tbl_di_DT_PROCESSAMENTO: TStringField
      FieldName = 'DT_PROCESSAMENTO'
      EditMask = '!99/99/9999;0; '
      Size = 8
    end
    object tbl_di_DT_TRANSMISSAO: TStringField
      FieldName = 'DT_TRANSMISSAO'
      EditMask = '!99/99/9999;0; '
      Size = 8
    end
    object tbl_di_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      EditMask = '!99/99/9999;0; '
      Size = 8
    end
    object tbl_di_CD_TIPO_DECLARACAO: TStringField
      FieldName = 'CD_TIPO_DECLARACAO'
      Size = 2
    end
    object tbl_di_CD_MOTIVO_TRANS: TStringField
      FieldName = 'CD_MOTIVO_TRANS'
      Size = 1
    end
    object tbl_di_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object tbl_di_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object tbl_di_NR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object tbl_di_CD_MODALIDADE_DESP: TStringField
      FieldName = 'CD_MODALIDADE_DESP'
      Size = 1
    end
    object tbl_di_IN_OPERACAO_FUNDAP: TBooleanField
      FieldName = 'IN_OPERACAO_FUNDAP'
    end
    object tbl_di_CD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      Size = 7
    end
    object tbl_di_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object tbl_di_CD_TIPO_CONSIG: TStringField
      FieldName = 'CD_TIPO_CONSIG'
      Size = 1
    end
    object tbl_di_NR_CONSIGNATARIO: TStringField
      FieldName = 'NR_CONSIGNATARIO'
      EditMask = '!99999999/9999-99;0; '
      Size = 14
    end
    object tbl_di_NM_CONSIGNATARIO: TStringField
      FieldName = 'NM_CONSIGNATARIO'
      Size = 60
    end
    object tbl_di_CD_PAIS_PROC_CARGA: TStringField
      FieldName = 'CD_PAIS_PROC_CARGA'
      Size = 3
    end
    object tbl_di_CD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      Size = 2
    end
    object tbl_di_IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
    end
    object tbl_di_NR_VEICULO_TRANSP: TStringField
      FieldName = 'NR_VEICULO_TRANSP'
      Size = 15
    end
    object tbl_di_NM_VEICULO_TRANSP: TStringField
      FieldName = 'NM_VEICULO_TRANSP'
      Size = 30
    end
    object tbl_di_CD_BANDEIRA_TRANSP: TStringField
      FieldName = 'CD_BANDEIRA_TRANSP'
      Size = 3
    end
    object tbl_di_CD_TIPO_AG_CARGA: TStringField
      FieldName = 'CD_TIPO_AG_CARGA'
      Size = 1
    end
    object tbl_di_NR_AGENTE_CARGA: TStringField
      FieldName = 'NR_AGENTE_CARGA'
      Size = 14
    end
    object tbl_di_CD_TIPO_DCTO_CARGA: TStringField
      FieldName = 'CD_TIPO_DCTO_CARGA'
      Size = 2
    end
    object tbl_di_NR_DCTO_CARGA: TStringField
      FieldName = 'NR_DCTO_CARGA'
      Size = 18
    end
    object tbl_di_NR_DCTO_CARGA_MAST: TStringField
      FieldName = 'NR_DCTO_CARGA_MAST'
      Size = 18
    end
    object tbl_di_DT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      EditMask = '!99/99/9999;0; '
      Size = 8
    end
    object tbl_di_CD_UTIL_DCTO_CARGA: TStringField
      FieldName = 'CD_UTIL_DCTO_CARGA'
      Size = 1
    end
    object tbl_di_DT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      EditMask = '!99/99/9999;0; '
      Size = 8
    end
    object tbl_di_CD_TIPO_MANIFESTO: TStringField
      FieldName = 'CD_TIPO_MANIFESTO'
      Size = 1
    end
    object tbl_di_NR_MANIFESTO: TStringField
      Alignment = taCenter
      FieldName = 'NR_MANIFESTO'
      Size = 15
    end
    object tbl_di_CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Size = 7
    end
    object tbl_di_CD_SETOR_ARMAZENAM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAM'
      Size = 3
    end
    object tbl_di_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Size = 3
    end
    object tbl_di_VL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
      DisplayFormat = '#0,.00'
    end
    object tbl_di_VL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
      DisplayFormat = '#0,.00'
    end
    object tbl_di_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      DisplayFormat = '#0,.00'
    end
    object tbl_di_VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_di_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Size = 3
    end
    object tbl_di_VL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
      DisplayFormat = '#0,.00'
    end
    object tbl_di_VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_di_CD_MOEDA_DESPESAS: TStringField
      FieldName = 'CD_MOEDA_DESPESAS'
      Size = 3
    end
    object tbl_di_VL_TOT_DESPS_MNEG: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG'
      DisplayFormat = '#0,.00'
    end
    object tbl_di_VL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_di_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Size = 3
    end
    object tbl_di_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
      DisplayFormat = '#0,.00'
    end
    object tbl_di_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_di_IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
    end
    object tbl_di_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      BlobType = ftMemo
    end
    object tbl_di_Look_tipo_declaracao: TStringField
      FieldName = 'Look_tipo_declaracao'
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CD_TIPO_DECLARACAO'
      Size = 80
      Lookup = True
    end
    object tbl_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object tbl_di_Look_Importador: TStringField
      FieldName = 'Look_Importador'
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Size = 60
      Lookup = True
    end
    object tbl_di_Look_urf_despacho: TStringField
      FieldName = 'Look_urf_despacho'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_URF_DESPACHO'
      Size = 60
      Lookup = True
    end
    object tbl_di_Look_urf_entrada: TStringField
      FieldName = 'Look_urf_entrada'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_URF_ENTR_CARGA'
      Size = 60
      Lookup = True
    end
    object tbl_di_PB_CARGA: TFloatField
      FieldName = 'PB_CARGA'
      DisplayFormat = '#0,.00000'
    end
    object tbl_di_PL_CARGA: TFloatField
      FieldName = 'PL_CARGA'
      DisplayFormat = '#0,.00000'
    end
    object tbl_di_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      Size = 4
    end
    object tbl_di_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object tbl_di_Look_Transp_itl: TStringField
      FieldName = 'Look_Transp_itl'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'APELIDO'
      KeyFields = 'CD_TRANSPORTADOR'
      Size = 30
      Lookup = True
    end
    object tbl_di_Look_Bandeira_Transp_itl: TStringField
      FieldName = 'Look_Bandeira_Transp_itl'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_BANDEIRA_TRANSP'
      Size = 30
      Lookup = True
    end
    object tbl_di_Look_local_Embarque: TStringField
      FieldName = 'Look_local_Embarque'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_LOCAL_EMBARQUE'
      Size = 30
      Lookup = True
    end
    object tbl_di_Look_Pais_Procedencia: TStringField
      FieldName = 'Look_Pais_Procedencia'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_PROC_CARGA'
      Size = 40
      Lookup = True
    end
    object tbl_di_Look_Recinto_alf: TStringField
      FieldName = 'Look_Recinto_alf'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_RECINTO_ALFAND'
      Size = 60
      Lookup = True
    end
    object tbl_di_Look_Moeda_MLE: TStringField
      FieldName = 'Look_Moeda_MLE'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_MLE'
      Size = 40
      Lookup = True
    end
    object tbl_di_Look_Moeda_Frete: TStringField
      FieldName = 'Look_Moeda_Frete'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_FRETE'
      Size = 40
      Lookup = True
    end
    object tbl_di_Look_Moeda_Seguro: TStringField
      FieldName = 'Look_Moeda_Seguro'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_SEGURO'
      Size = 40
      Lookup = True
    end
    object tbl_di_Look_Setor: TStringField
      FieldName = 'Look_Setor'
      LookupKeyFields = 'Setor'
      LookupResultField = 'Nome'
      KeyFields = 'CD_SETOR_ARMAZENAM'
      Size = 40
      Lookup = True
    end
    object tbl_di_Calc_VL_TOT_MLE_MN: TFloatField
      FieldName = 'Calc_VL_TOT_MLE_MN'
      DisplayFormat = '#0,.00'
      Calculated = True
    end
    object tbl_di_Calc_VL_TOT_FRETE_MN: TFloatField
      FieldName = 'Calc_VL_TOT_FRETE_MN'
      DisplayFormat = '#0,.00'
      Calculated = True
    end
    object tbl_di_Calc_VL_TOT_SEGURO_MN: TFloatField
      FieldName = 'Calc_VL_TOT_SEGURO_MN'
      DisplayFormat = '#0,.00'
      Calculated = True
    end
    object tbl_di_Calc_TOT_FRETE_MNEG: TFloatField
      FieldName = 'Calc_TOT_FRETE_MNEG'
      DisplayFormat = '#0,.00'
      Calculated = True
    end
    object tbl_di_Look_transp_rod: TStringField
      FieldName = 'Look_transp_rod'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'APELIDO'
      KeyFields = 'CD_TRANSPORTADOR'
      Size = 60
      Lookup = True
    end
    object tbl_di_Look_Band_cad_Transp: TStringField
      FieldName = 'Look_Band_cad_Transp'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CD_PAIS'
      KeyFields = 'CD_TRANSPORTADOR'
      Size = 60
      Lookup = True
    end
    object tbl_di_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
      DisplayFormat = '000'
    end
    object tbl_di_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Size = 1
    end
    object tbl_di_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      EditMask = 'LLL;0; '
      Size = 3
    end
    object tbl_di_CD_METODO_VALORACAO: TStringField
      FieldName = 'CD_METODO_VALORACAO'
      EditMask = '99'
      Size = 2
    end
    object tbl_di_CD_REG_TRIB_II: TStringField
      FieldName = 'CD_REG_TRIB_II'
      EditMask = '9'
      Size = 1
    end
    object tbl_di_CD_FUND_LEGAL_II: TStringField
      FieldName = 'CD_FUND_LEGAL_II'
      EditMask = '99'
      Size = 2
    end
    object tbl_di_CD_REG_TRIB_IPI: TStringField
      FieldName = 'CD_REG_TRIB_IPI'
      Size = 1
    end
    object tbl_di_CD_DESTAQUE_NCM: TStringField
      FieldName = 'CD_DESTAQUE_NCM'
      EditMask = '999'
      Size = 3
    end
    object tbl_di_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object tbl_di_PC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object tbl_di_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      Size = 1
    end
    object tbl_di_CD_COBERTURA_CAMBIAL: TStringField
      FieldName = 'CD_COBERTURA_CAMBIAL'
      Size = 1
    end
    object tbl_di_CD_MOTIVO_SEM_COBERTURA: TStringField
      FieldName = 'CD_MOTIVO_SEM_COBERTURA'
      Size = 2
    end
    object tbl_di_CD_MODALIDADE_PAGTO: TStringField
      FieldName = 'CD_MODALIDADE_PAGTO'
      Size = 2
    end
    object tbl_di_NR_ROF: TStringField
      FieldName = 'NR_ROF'
      Size = 8
    end
    object tbl_di_PC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object tbl_di_NR_IDENTIFICACAO_COM: TStringField
      FieldName = 'NR_IDENTIFICACAO_COM'
      EditMask = '99999999999999'
      Size = 14
    end
    object tbl_di_NR_BANCO_COM: TStringField
      FieldName = 'NR_BANCO_COM'
      EditMask = '99999'
      Size = 5
    end
    object tbl_di_NR_PRACA_COM: TStringField
      FieldName = 'NR_PRACA_COM'
      EditMask = '9999'
      Size = 4
    end
    object tbl_di_NR_CONTRATO_CAMBIO: TStringField
      FieldName = 'NR_CONTRATO_CAMBIO'
      EditMask = '99999999'
      Size = 8
    end
    object tbl_di_NR_BANCO_PAGAMENTO: TStringField
      FieldName = 'NR_BANCO_PAGAMENTO'
      EditMask = '99999'
      Size = 5
    end
    object tbl_di_NR_PRACA_PAGAMENTO: TStringField
      FieldName = 'NR_PRACA_PAGAMENTO'
      EditMask = '9999'
      Size = 5
    end
    object tbl_di_NR_COMPRADOR_ME: TStringField
      FieldName = 'NR_COMPRADOR_ME'
      EditMask = '99999999999999'
      Size = 14
    end
    object tbl_di_Look_Met_Valoracao: TStringField
      FieldName = 'Look_Met_Valoracao'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_METODO_VALORACAO'
      Size = 50
      Lookup = True
    end
    object tbl_di_Look_Reg_Trib_II: TStringField
      FieldName = 'Look_Reg_Trib_II'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_REG_TRIB_II'
      Size = 50
      Lookup = True
    end
    object tbl_di_Look_Fund_Legal: TStringField
      FieldName = 'Look_Fund_Legal'
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CD_FUND_LEGAL_II'
      Size = 50
      Lookup = True
    end
    object tbl_di_Look_Mot_sem_cobertura: TStringField
      FieldName = 'Look_Mot_sem_cobertura'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOTIVO_SEM_COBERTURA'
      Size = 50
      Lookup = True
    end
    object tbl_di_Look_Modalidade_Pagto: TStringField
      FieldName = 'Look_Modalidade_Pagto'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MODALIDADE_PAGTO'
      Size = 50
      Lookup = True
    end
    object tbl_di_IN_RATEAR_FRETE_ITENS: TBooleanField
      FieldName = 'IN_RATEAR_FRETE_ITENS'
      Required = True
    end
    object tbl_di_IN_RATEAR_SEGURO_ITENS: TBooleanField
      FieldName = 'IN_RATEAR_SEGURO_ITENS'
      Required = True
    end
    object tbl_di_IN_REPASSA_DADOS_ADICAO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_ADICAO'
      Required = True
    end
    object tbl_di_IN_REPASSA_DADOS_CAMBIO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_CAMBIO'
      Required = True
    end
    object tbl_di_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
      Required = True
    end
    object tbl_di_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
      Required = True
    end
    object tbl_di_IN_MOEDA_NACIONAL: TStringField
      FieldName = 'IN_MOEDA_NACIONAL'
      Required = True
      Size = 1
    end
    object tbl_di_CD_FORMA_PAGAMENTO: TStringField
      FieldName = 'CD_FORMA_PAGAMENTO'
      Size = 1
    end
    object tbl_di_PC_SEGURO_MLE: TFloatField
      FieldName = 'PC_SEGURO_MLE'
      EditFormat = '#0,.00'
    end
    object tbl_di_VL_TOTAL_II: TFloatField
      FieldName = 'VL_TOTAL_II'
    end
    object tbl_di_VL_TOTAL_IPI: TFloatField
      FieldName = 'VL_TOTAL_IPI'
    end
    object tbl_di_VL_TOTAL_AD: TFloatField
      FieldName = 'VL_TOTAL_AD'
    end
    object tbl_di_CD_TIPO_BASE_SEGURO: TStringField
      FieldName = 'CD_TIPO_BASE_SEGURO'
      Size = 1
    end
  end
  object ds_di_doc_instr_emb: TDataSource
    DataSet = tbl_di_doc_instr_emb_
    Left = 52
    Top = 100
  end
  object tbl_di_doc_instr_emb_: TTable
    AfterPost = tbl_di_doc_instr_emb_AfterPost
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TDOCUMENTO_INSTRUCAO'
    UpdateMode = upWhereKeyOnly
    Left = 92
    Top = 128
    object tbl_di_doc_instr_emb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_di_doc_instr_emb_CD_TIPO_DCTO_INSTR: TStringField
      FieldName = 'CD_TIPO_DCTO_INSTR'
      Size = 2
    end
    object tbl_di_doc_instr_emb_NR_DCTO_INSTRUCAO: TStringField
      DisplayLabel = 'Identificação'
      FieldName = 'NR_DCTO_INSTRUCAO'
      Size = 25
    end
    object tbl_di_doc_instr_emb_Look_Doc_Instr_Emb: TStringField
      DisplayLabel = 'Denominação'
      FieldName = 'Look_Doc_Instr_Emb'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_TIPO_DCTO_INSTR'
      Size = 40
      Lookup = True
    end
  end
  object ds_di_proc_vinc: TDataSource
    DataSet = tbl_di_proc_vinc_
    Left = 52
    Top = 148
  end
  object tbl_di_proc_vinc_: TTable
    AfterPost = tbl_di_proc_vinc_AfterPost
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TPROCESSO_DI'
    UpdateMode = upWhereKeyOnly
    Left = 92
    Top = 176
    object tbl_di_proc_vinc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_di_proc_vinc_CD_TIPO_PROCESSO: TStringField
      FieldName = 'CD_TIPO_PROCESSO'
      Size = 1
    end
    object tbl_di_proc_vinc_NR_PROCESSO_INSTR: TStringField
      DisplayLabel = 'Identificação'
      FieldName = 'NR_PROCESSO_INSTR'
    end
    object tbl_di_proc_vinc_Look_Proc_Vinc: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Look_Proc_Vinc'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_TIPO_PROCESSO'
      Size = 30
      Lookup = True
    end
  end
  object ds_di_armazem: TDataSource
    DataSet = tbl_di_armazem_
    Left = 52
    Top = 196
  end
  object tbl_di_armazem_: TTable
    AfterPost = tbl_di_armazem_AfterPost
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TCARGA_ARMAZEM'
    UpdateMode = upWhereKeyOnly
    Left = 92
    Top = 224
    object tbl_di_armazem_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_di_armazem_NM_ARMAZEM_CARGA: TStringField
      DisplayLabel = 'Armazém'
      FieldName = 'NM_ARMAZEM_CARGA'
      Size = 10
    end
  end
  object tbl_di_volumes_: TTable
    AfterPost = tbl_di_volumes_AfterPost
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TEMBALAGEM_CARGA'
    UpdateMode = upWhereKeyOnly
    Left = 92
    Top = 272
    object tbl_di_volumes_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_di_volumes_CD_TIPO_EMBALAGEM: TStringField
      FieldName = 'CD_TIPO_EMBALAGEM'
      Size = 2
    end
    object tbl_di_volumes_QT_VOLUME_CARGA: TStringField
      DisplayLabel = 'Quantidade'
      FieldName = 'QT_VOLUME_CARGA'
      Size = 5
    end
    object tbl_di_volumes_Look_Embalagem: TStringField
      DisplayLabel = 'Embalagem'
      FieldName = 'Look_Embalagem'
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CD_TIPO_EMBALAGEM'
      Size = 40
      Lookup = True
    end
  end
  object ds_di_volumes: TDataSource
    DataSet = tbl_di_volumes_
    Left = 52
    Top = 244
  end
  object tbl_di_darf_: TTable
    AfterPost = tbl_di_darf_AfterPost
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TPAGAMENTO_TRIBUTOS'
    UpdateMode = upWhereKeyOnly
    Left = 92
    Top = 320
    object tbl_di_darf_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
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
      DisplayLabel = 'Agência'
      FieldName = 'NR_AGENC_PGTO_TRIB'
      Size = 5
    end
    object tbl_di_darf_VL_TRIBUTO_PAGO: TFloatField
      DisplayLabel = 'Valor Total (R$)'
      FieldName = 'VL_TRIBUTO_PAGO'
      DisplayFormat = '#0,.00'
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
  end
  object ds_di_darf: TDataSource
    DataSet = tbl_di_darf_
    Left = 52
    Top = 292
  end
  object tbl_di_comp_trib_: TTable
    AfterPost = tbl_di_comp_trib_AfterPost
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di
    TableName = 'TCOMPENSACAO_CREDITO'
    UpdateMode = upWhereKeyOnly
    Left = 92
    Top = 368
    object tbl_di_comp_trib_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
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
      DisplayLabel = 'Referência'
      FieldName = 'NR_DCTO_GERADOR_CR'
      Size = 15
    end
  end
  object ds_di_comp_trib: TDataSource
    DataSet = tbl_di_comp_trib_
    Left = 52
    Top = 340
  end
  object ds_adicao: TDataSource
    DataSet = tbl_adicao_
    Left = 144
    Top = 8
  end
  object tbl_adicao_: TTable
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di_w
    TableName = 'TADICAO_DE_IMPORTACAO'
    Left = 188
    Top = 32
    object tbl_adicao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_adicao_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_adicao_CD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      EditMask = '9999999;0;_'
      Size = 7
    end
    object tbl_adicao_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Size = 2
    end
    object tbl_adicao_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      Size = 1
    end
    object tbl_adicao_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Size = 8
    end
    object tbl_adicao_CD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Size = 8
    end
    object tbl_adicao_CD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Size = 7
    end
    object tbl_adicao_CD_MERC_NBM_SH: TStringField
      FieldName = 'CD_MERC_NBM_SH'
      Size = 8
    end
    object tbl_adicao_CD_MERCADORIA_NCM: TStringField
      DisplayWidth = 11
      FieldName = 'CD_MERCADORIA_NCM'
      Size = 11
    end
    object tbl_adicao_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object tbl_adicao_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object tbl_adicao_CD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Size = 3
    end
    object tbl_adicao_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object tbl_adicao_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object tbl_adicao_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Size = 3
    end
    object tbl_adicao_CD_MOEDAS_DESPESAS: TStringField
      FieldName = 'CD_MOEDAS_DESPESAS'
      Size = 3
    end
    object tbl_adicao_CD_MOEDA_SEG_MERC: TStringField
      FieldName = 'CD_MOEDA_SEG_MERC'
      Size = 3
    end
    object tbl_adicao_CD_MD_FRETE_MERC: TStringField
      FieldName = 'CD_MD_FRETE_MERC'
      Size = 3
    end
    object tbl_adicao_CD_METOD_VALORACAO: TStringField
      FieldName = 'CD_METOD_VALORACAO'
      Size = 2
    end
    object tbl_adicao_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Size = 1
    end
    object tbl_adicao_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object tbl_adicao_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      EditMask = '999'
      Size = 3
    end
    object tbl_adicao_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Size = 1
    end
    object tbl_adicao_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Size = 2
    end
    object tbl_adicao_CD_MOTIVO_ADM_TEMP: TStringField
      FieldName = 'CD_MOTIVO_ADM_TEMP'
      Size = 2
    end
    object tbl_adicao_CD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Size = 1
    end
    object tbl_adicao_CD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Size = 2
    end
    object tbl_adicao_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object tbl_adicao_CD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Size = 2
    end
    object tbl_adicao_CD_PERIOD_PGTO_360: TStringField
      FieldName = 'CD_PERIOD_PGTO_360'
      Size = 1
    end
    object tbl_adicao_CD_AGENC_AGENT_IMP: TStringField
      FieldName = 'CD_AGENC_AGENT_IMP'
      Size = 4
    end
    object tbl_adicao_CD_BANC_AGENTE_IMP: TStringField
      FieldName = 'CD_BANC_AGENTE_IMP'
      Size = 5
    end
    object tbl_adicao_CD_TAXA_JUROS: TStringField
      FieldName = 'CD_TAXA_JUROS'
      Size = 4
    end
    object tbl_adicao_CD_TIPO_AGENTE_IMP: TStringField
      FieldName = 'CD_TIPO_AGENTE_IMP'
      Size = 1
    end
    object tbl_adicao_CD_FORNECEDOR: TStringField
      DisplayWidth = 5
      FieldName = 'CD_FORNECEDOR'
      Size = 5
    end
    object tbl_adicao_CD_FABRICANTE: TStringField
      DisplayWidth = 5
      FieldName = 'CD_FABRICANTE'
      Size = 5
    end
    object tbl_adicao_CD_LOC_COND_VENDA: TStringField
      FieldName = 'CD_LOC_COND_VENDA'
      Size = 4
    end
    object tbl_adicao_ED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object tbl_adicao_ED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object tbl_adicao_ED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object tbl_adicao_ED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Size = 6
    end
    object tbl_adicao_ED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object tbl_adicao_ED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      Size = 40
    end
    object tbl_adicao_ED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      Size = 6
    end
    object tbl_adicao_ED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      Size = 21
    end
    object tbl_adicao_ED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Size = 25
    end
    object tbl_adicao_ED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Size = 25
    end
    object tbl_adicao_IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
    end
    object tbl_adicao_IN_PGTO_VARIAV_360: TBooleanField
      FieldName = 'IN_PGTO_VARIAV_360'
    end
    object tbl_adicao_IN_JUROS_ATE_360: TBooleanField
      FieldName = 'IN_JUROS_ATE_360'
    end
    object tbl_adicao_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
    end
    object tbl_adicao_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
    end
    object tbl_adicao_IN_IPI_NAO_TRIBUT: TBooleanField
      FieldName = 'IN_IPI_NAO_TRIBUT'
    end
    object tbl_adicao_IN_ADICAO_CALCULADA: TBooleanField
      FieldName = 'IN_ADICAO_CALCULADA'
      Required = True
    end
    object tbl_adicao_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Size = 60
    end
    object tbl_adicao_NM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Size = 60
    end
    object tbl_adicao_NR_DCTO_REDUCAO: TStringField
      FieldName = 'NR_DCTO_REDUCAO'
      Size = 8
    end
    object tbl_adicao_NR_ROF: TStringField
      FieldName = 'NR_ROF'
      Size = 8
    end
    object tbl_adicao_NR_AGENTE_IMP: TStringField
      FieldName = 'NR_AGENTE_IMP'
      Size = 14
    end
    object tbl_adicao_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      EditMask = '99/9999999-9;0; '
      Size = 10
    end
    object tbl_adicao_PC_COEF_REDUC_II: TFloatField
      FieldName = 'PC_COEF_REDUC_II'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_PC_TAXA_JUROS: TFloatField
      FieldName = 'PC_TAXA_JUROS'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_PC_COMISSAO_AG_IMP: TFloatField
      FieldName = 'PC_COMISSAO_AG_IMP'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object tbl_adicao_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#.#####'
    end
    object tbl_adicao_QT_UN_ESTATISTICA: TFloatField
      FieldName = 'QT_UN_ESTATISTICA'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object tbl_adicao_QT_PARC_FINANC_360: TIntegerField
      FieldName = 'QT_PARC_FINANC_360'
    end
    object tbl_adicao_QT_PERIOD_PGTO_360: TIntegerField
      FieldName = 'QT_PERIOD_PGTO_360'
    end
    object tbl_adicao_QT_ITENS_ADICAO: TIntegerField
      FieldName = 'QT_ITENS_ADICAO'
      DisplayFormat = '000'
    end
    object tbl_adicao_TX_COMPL_VL_ADUAN: TStringField
      FieldName = 'TX_COMPL_VL_ADUAN'
      Size = 250
    end
    object tbl_adicao_VL_MERC_EMB_MN: TFloatField
      FieldName = 'VL_MERC_EMB_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_VL_MERC_COND_VENDA: TFloatField
      FieldName = 'VL_MERC_COND_VENDA'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_VL_MERC_VENDA_MN: TFloatField
      FieldName = 'VL_MERC_VENDA_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_VL_FRETE_MERC_MNEG: TFloatField
      FieldName = 'VL_FRETE_MERC_MNEG'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_VL_FRETE_MERC_MN: TFloatField
      FieldName = 'VL_FRETE_MERC_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_VL_SEG_MERC_MNEG: TFloatField
      FieldName = 'VL_SEG_MERC_MNEG'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_VL_SEG_MERC_MN: TFloatField
      FieldName = 'VL_SEG_MERC_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_VL_UNID_LOC_EMP: TFloatField
      FieldName = 'VL_UNID_LOC_EMP'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_VL_DESPESAS_MNEG: TFloatField
      FieldName = 'VL_DESPESAS_MNEG'
    end
    object tbl_adicao_VL_DESPESAS_MN: TFloatField
      FieldName = 'VL_DESPESAS_MN'
    end
    object tbl_adicao_VL_CALC_DCR_DOLAR: TFloatField
      FieldName = 'VL_CALC_DCR_DOLAR'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_VL_II_CALC_DCR_MN: TFloatField
      FieldName = 'VL_II_CALC_DCR_MN'
    end
    object tbl_adicao_VL_II_DEVIDO_ZFM: TFloatField
      FieldName = 'VL_II_DEVIDO_ZFM'
    end
    object tbl_adicao_VL_II_A_REC_ZFM: TFloatField
      FieldName = 'VL_II_A_REC_ZFM'
    end
    object tbl_adicao_VL_TOT_FINANC_360: TFloatField
      FieldName = 'VL_TOT_FINANC_360'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object tbl_adicao_VL_FINANC_SUP_360: TFloatField
      FieldName = 'VL_FINANC_SUP_360'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object tbl_adicao_VL_COMISSAO_AG_IMP: TFloatField
      FieldName = 'VL_COMISSAO_AG_IMP'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object tbl_adicao_VL_ACRESCIMOS_MN: TFloatField
      FieldName = 'VL_ACRESCIMOS_MN'
    end
    object tbl_adicao_VL_DEDUCOES_MN: TFloatField
      FieldName = 'VL_DEDUCOES_MN'
    end
    object tbl_adicao_vl_base_calculo_mn: TFloatField
      FieldName = 'vl_base_calculo_mn'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_vl_merc_loc_emb_mn: TFloatField
      FieldName = 'vl_merc_loc_emb_mn'
      DisplayFormat = '#0,.00'
    end
    object tbl_adicao_Look_pais_origem: TStringField
      FieldName = 'Look_pais_origem'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_ORIG_MERC'
      LookupCache = True
      Size = 40
      Lookup = True
    end
    object tbl_adicao_Look_pais_aquisicao: TStringField
      FieldName = 'Look_pais_aquisicao'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_AQUIS_MERC'
      LookupCache = True
      Size = 40
      Lookup = True
    end
    object tbl_adicao_Look_pais_procedencia: TStringField
      FieldName = 'Look_pais_procedencia'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_PROC_MERC'
      LookupCache = True
      Size = 40
      Lookup = True
    end
    object tbl_adicao_Look_Exportador: TStringField
      FieldName = 'Look_Exportador'
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FORNECEDOR'
      LookupCache = True
      Size = 60
      Lookup = True
    end
    object tbl_adicao_Look_Fabricante: TStringField
      FieldName = 'Look_Fabricante'
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FABRICANTE'
      LookupCache = True
      Size = 60
      Lookup = True
    end
    object tbl_adicao_Look_Loc_Cond_Venda: TStringField
      FieldName = 'Look_Loc_Cond_Venda'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_LOC_COND_VENDA'
      LookupCache = True
      Size = 40
      Lookup = True
    end
    object tbl_adicao_Look_Reg_trib: TStringField
      FieldName = 'Look_Reg_trib'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_REGIME_TRIBUTAR'
      LookupCache = True
      Size = 40
      Lookup = True
    end
    object tbl_adicao_Look_Motivo_sem_Cobertura: TStringField
      FieldName = 'Look_Motivo_sem_Cobertura'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOTIVO_SEM_COB'
      LookupCache = True
      Size = 60
      Lookup = True
    end
    object tbl_adicao_Look_metodo_Valoracao: TStringField
      DisplayLabel = 'Look_Metodo_Valoracao'
      FieldName = 'Look_metodo_Valoracao'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_METOD_VALORACAO'
      LookupCache = True
      Size = 50
      Lookup = True
    end
  end
  object ds_ad_ato_legal_ncm: TDataSource
    DataSet = tbl_ad_ato_leg_ncm_
    Left = 144
    Top = 104
  end
  object tbl_ad_ato_leg_ncm_: TTable
    Filter = 'CD_ASSUNTO_VINCUL = '#39'1'#39
    Filtered = True
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TATO_VINCULADO'
    UpdateMode = upWhereKeyOnly
    Left = 188
    Top = 128
    object tbl_ad_ato_leg_ncm_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
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
      DisplayLabel = 'Orgão Emissor'
      FieldName = 'SG_ORG_ATO_VINCUL'
      Size = 6
    end
    object tbl_ad_ato_leg_ncm_DT_ANO_ATO_VINCUL: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'DT_ANO_ATO_VINCUL'
      Size = 4
    end
    object tbl_ad_ato_leg_ncm_NR_ATO_VINCULADO: TStringField
      DisplayLabel = 'Número'
      FieldName = 'NR_ATO_VINCULADO'
      Size = 6
    end
    object tbl_ad_ato_leg_ncm_NR_EX_ATO_VINCUL: TStringField
      DisplayLabel = '"EX"'
      FieldName = 'NR_EX_ATO_VINCUL'
      Size = 3
    end
  end
  object ds_ad_ato_legal_nbm: TDataSource
    DataSet = tbl_ad_ato_legal_nbm_
    Left = 144
    Top = 152
  end
  object tbl_ad_ato_legal_nbm_: TTable
    Filter = 'CD_ASSUNTO_VINCUL = '#39'2'#39
    Filtered = True
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TATO_VINCULADO'
    UpdateMode = upWhereKeyOnly
    Left = 188
    Top = 176
    object tbl_ad_ato_legal_nbm_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
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
      DisplayLabel = 'Número'
      FieldName = 'NR_ATO_VINCULADO'
      Size = 6
    end
    object tbl_ad_ato_legal_nbm_NR_EX_ATO_VINCUL: TStringField
      DisplayLabel = '"EX"'
      FieldName = 'NR_EX_ATO_VINCUL'
      Size = 3
    end
  end
  object ds_ad_ato_legal_acordo_tar: TDataSource
    DataSet = tbl_ad_ato_legal_acordo_tar_
    Left = 576
    Top = 248
  end
  object tbl_ad_ato_legal_acordo_tar_: TTable
    Filter = 'CD_ASSUNTO_VINCUL = '#39'5'#39
    Filtered = True
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TATO_VINCULADO'
    UpdateMode = upWhereKeyOnly
    Left = 712
    Top = 248
    object tbl_ad_ato_legal_acordo_tar_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
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
      Size = 5
    end
    object tbl_ad_ato_legal_acordo_tar_SG_ORG_ATO_VINCUL: TStringField
      FieldName = 'SG_ORG_ATO_VINCUL'
      Size = 6
    end
    object tbl_ad_ato_legal_acordo_tar_DT_ANO_ATO_VINCUL: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'DT_ANO_ATO_VINCUL'
      Size = 4
    end
    object tbl_ad_ato_legal_acordo_tar_NR_ATO_VINCULADO: TStringField
      DisplayLabel = 'Número'
      FieldName = 'NR_ATO_VINCULADO'
      Size = 6
    end
    object tbl_ad_ato_legal_acordo_tar_NR_EX_ATO_VINCUL: TStringField
      DisplayLabel = '"EX"'
      FieldName = 'NR_EX_ATO_VINCUL'
      Size = 3
    end
  end
  object ds_ad_ato_legal_benef_ipi: TDataSource
    DataSet = tbl_ad_ato_legal_benef_ipi_
    Left = 576
    Top = 296
  end
  object tbl_ad_ato_legal_benef_ipi_: TTable
    Filter = 'CD_ASSUNTO_VINCUL = '#39'4'#39
    Filtered = True
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TATO_VINCULADO'
    UpdateMode = upWhereKeyOnly
    Left = 712
    Top = 300
    object tbl_ad_ato_legal_benef_ipi_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
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
      DisplayLabel = 'Número'
      FieldName = 'NR_ATO_VINCULADO'
      Size = 6
    end
    object tbl_ad_ato_legal_benef_ipi_NR_EX_ATO_VINCUL: TStringField
      DisplayLabel = '"EX"'
      FieldName = 'NR_EX_ATO_VINCUL'
      Size = 3
    end
  end
  object ds_ad_ato_legal_antidump: TDataSource
    DataSet = tbl_ad_ato_legal_antidump_
    Left = 576
    Top = 344
  end
  object tbl_ad_ato_legal_antidump_: TTable
    Filter = 'CD_ASSUNTO_VINCUL = '#39'6'#39
    Filtered = True
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TATO_VINCULADO'
    UpdateMode = upWhereKeyOnly
    Left = 712
    Top = 344
    object tbl_ad_ato_legal_antidump_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
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
      DisplayLabel = 'Número'
      FieldName = 'NR_ATO_VINCULADO'
      Size = 6
    end
    object tbl_ad_ato_legal_antidump_NR_EX_ATO_VINCUL: TStringField
      DisplayLabel = '"EX"'
      FieldName = 'NR_EX_ATO_VINCUL'
      Size = 3
    end
  end
  object ds_ad_destaque_ncm: TDataSource
    DataSet = tbl_ad_destaque_ncm_
    Left = 144
    Top = 200
  end
  object tbl_ad_destaque_ncm_: TTable
    AfterPost = tbl_ad_destaque_ncm_AfterPost
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TDESTAQUE_NCM'
    UpdateMode = upWhereKeyOnly
    Left = 188
    Top = 224
    object tbl_ad_destaque_ncm_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_ad_destaque_ncm_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_destaque_ncm_NR_DESTAQUE_NCM: TStringField
      DisplayLabel = 'Número'
      FieldName = 'NR_DESTAQUE_NCM'
      Size = 3
    end
  end
  object ds_ad_docto_vinc: TDataSource
    DataSet = tbl_ad_docto_vinc_
    Left = 144
    Top = 248
  end
  object tbl_ad_docto_vinc_: TTable
    AfterPost = tbl_ad_docto_vinc_AfterPost
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TDOCUMENTO_VINCULADO'
    UpdateMode = upWhereKeyOnly
    Left = 188
    Top = 272
    object tbl_ad_docto_vinc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
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
      DisplayLabel = 'Número'
      FieldName = 'NR_DCTO_VINCULADO'
      Size = 15
    end
    object tbl_ad_docto_vinc_Look_tp_docto_vinc: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Look_tp_docto_vinc'
      LookupKeyFields = 'CD_TIPO_DOCTO_VINC'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_TIPO_DCTO_VINC'
      Size = 10
      Lookup = True
    end
  end
  object ds_ad_itens: TDataSource
    DataSet = tbl_ad_itens_
    Left = 576
    Top = 404
  end
  object tbl_ad_itens_: TTable
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO;NR_ITEM'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao_w
    TableName = 'TDETALHE_MERCADORIA'
    UpdateMode = upWhereKeyOnly
    Left = 712
    Top = 408
    object tbl_ad_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_ad_itens_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
    object tbl_ad_itens_CD_MERCADORIA: TStringField
      DisplayWidth = 15
      FieldName = 'CD_MERCADORIA'
      Size = 15
    end
    object tbl_ad_itens_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      EditMask = '99;0;_'
      Size = 2
    end
    object tbl_ad_itens_CD_NCM_SH: TStringField
      DisplayWidth = 11
      FieldName = 'CD_NCM_SH'
      EditMask = '9999.99.99-999;0;_'
      Size = 11
    end
    object tbl_ad_itens_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object tbl_ad_itens_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      EditMask = '9999.99.9;0;_'
      Size = 7
    end
    object tbl_ad_itens_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Size = 1
    end
    object tbl_ad_itens_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      EditMask = '99999'
      Size = 5
    end
    object tbl_ad_itens_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      EditMask = '999'
      Size = 3
    end
    object tbl_ad_itens_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      EditMask = '99999'
      Size = 5
    end
    object tbl_ad_itens_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      EditMask = '999'
      Size = 3
    end
    object tbl_ad_itens_CD_TIPO_CALCULO_ITEM: TStringField
      FieldName = 'CD_TIPO_CALCULO_ITEM'
      Size = 1
    end
    object tbl_ad_itens_QT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#.#######'
    end
    object tbl_ad_itens_QT_MERC_UN_ESTAT: TFloatField
      FieldName = 'QT_MERC_UN_ESTAT'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#.#######'
    end
    object tbl_ad_itens_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#.#####'
    end
    object tbl_ad_itens_PC_DESCONTO_MERC: TFloatField
      FieldName = 'PC_DESCONTO_MERC'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object tbl_ad_itens_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#.#######'
    end
    object tbl_ad_itens_VL_DESCONTO_MERC: TFloatField
      FieldName = 'VL_DESCONTO_MERC'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#.#######'
    end
    object tbl_ad_itens_VL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#.#######'
    end
    object tbl_ad_itens_VL_FRETE_ITEM: TFloatField
      FieldName = 'VL_FRETE_ITEM'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#.#######'
    end
    object tbl_ad_itens_VL_SEGURO_ITEM: TFloatField
      FieldName = 'VL_SEGURO_ITEM'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#.#######'
    end
    object tbl_ad_itens_VL_MCV_ITEM: TFloatField
      FieldName = 'VL_MCV_ITEM'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#.#######'
    end
    object tbl_ad_itens_VL_UNID_COND_VENDA: TFloatField
      FieldName = 'VL_UNID_COND_VENDA'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#.#######'
    end
    object tbl_ad_itens_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Size = 15
    end
    object tbl_ad_itens_TX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object tbl_ad_itens_Look_Pais_Aquisicao: TStringField
      FieldName = 'Look_Pais_Aquisicao'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_AQUISICAO'
      Size = 40
      Lookup = True
    end
    object tbl_ad_itens_Look_Pais_Origem: TStringField
      FieldName = 'Look_Pais_Origem'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_ORIGEM'
      Size = 40
      Lookup = True
    end
    object tbl_ad_itens_Look_Nm_Fabricante: TStringField
      FieldName = 'Look_Nm_Fabricante'
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FABRICANTE'
      Size = 60
      Lookup = True
    end
    object tbl_ad_itens_Look_Nm_Exportador: TStringField
      FieldName = 'Look_Nm_Exportador'
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 60
      Lookup = True
    end
    object tbl_ad_itens_Look_Mercadoria: TStringField
      FieldName = 'Look_Mercadoria'
      LookupKeyFields = 'CD_MERCADORIA'
      LookupResultField = 'NM_MERCADORIA'
      KeyFields = 'CD_MERCADORIA'
      Size = 60
      Lookup = True
    end
    object tbl_ad_itens_Look_nm_unid_comerc: TStringField
      FieldName = 'Look_nm_unid_comerc'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_UN_MED_COMERC'
      Size = 40
      Lookup = True
    end
  end
  object dsq_ad_cambio_pg_antecip: TDataSource
    DataSet = qry_ad_cambio_pg_antec_
    Left = 576
    Top = 152
  end
  object dsq_ad_cambio_pg_avista: TDataSource
    DataSet = qry_ad_cambio_pg_avista_
    Left = 576
    Top = 200
  end
  object ds_ad_cambio_parc_var: TDataSource
    DataSet = tbl_ad_cambio_parc_var_
    Left = 144
    Top = 429
  end
  object tbl_ad_cambio_parc_var_: TTable
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TPAGAMENTO_PREVISTO'
    UpdateMode = upWhereKeyOnly
    Left = 188
    Top = 453
    object tbl_ad_cambio_parc_var_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_ad_cambio_parc_var_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_cambio_parc_var_DT_PREV_PGTO_360: TStringField
      DisplayLabel = 'Mês/Ano'
      FieldName = 'DT_PREV_PGTO_360'
      EditMask = '!99/9999;0; '
      Size = 6
    end
    object tbl_ad_cambio_parc_var_VL_PREV_PGTO_360: TFloatField
      DisplayLabel = 'Valor da Parcela'
      FieldName = 'VL_PREV_PGTO_360'
      DisplayFormat = '#0,.00'
    end
  end
  object ds_ad_acrescimos: TDataSource
    DataSet = tbl_ad_acrescimos_
    Left = 144
    Top = 340
  end
  object tbl_ad_acrescimos_: TTable
    AfterPost = tbl_ad_acrescimos_AfterPost
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TACRESCIMO_VALORACAO'
    UpdateMode = upWhereKeyOnly
    Left = 188
    Top = 364
    object tbl_ad_acrescimos_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
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
      DisplayLabel = 'Descrição'
      FieldName = 'Look_nm_acrescimo'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MET_ACRES_VALOR'
      Size = 40
      Lookup = True
    end
  end
  object ds_ad_deducoes: TDataSource
    DataSet = tbl_ad_deducoes_
    Left = 144
    Top = 388
  end
  object tbl_ad_deducoes_: TTable
    AfterPost = tbl_ad_deducoes_AfterPost
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TDEDUCAO_VALORACAO'
    UpdateMode = upWhereKeyOnly
    Left = 188
    Top = 412
    object tbl_ad_deducoes_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
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
      DisplayLabel = 'Descrição'
      FieldName = 'Look_nm_deducao'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MET_DEDUC_VALOR'
      Size = 40
      Lookup = True
    end
  end
  object ds_ad_ii: TDataSource
    DataSet = tbl_ad_ii_
    Left = 576
    Top = 8
  end
  object tbl_ad_ii_: TTable
    Filter = 'CD_RECEITA_IMPOSTO = '#39'0001'#39
    Filtered = True
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO;CD_RECEITA_IMPOSTO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TRIBUTO'
    UpdateMode = upWhereKeyOnly
    Left = 712
    Top = 8
    object tbl_ad_ii_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_ad_ii_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_ii_CD_RECEITA_IMPOSTO: TStringField
      FieldName = 'CD_RECEITA_IMPOSTO'
      Size = 4
    end
    object tbl_ad_ii_CD_TIPO_ALIQ_IPT: TStringField
      FieldName = 'CD_TIPO_ALIQ_IPT'
      Size = 1
    end
    object tbl_ad_ii_VL_BASE_CALC_ADVAL: TFloatField
      FieldName = 'VL_BASE_CALC_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_PC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_VL_CALC_IPT_ADVAL: TFloatField
      FieldName = 'VL_CALC_IPT_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_NM_UN_ALIQ_ESP_IPT: TStringField
      FieldName = 'NM_UN_ALIQ_ESP_IPT'
      Size = 15
    end
    object tbl_ad_ii_CD_TIPO_RECIPIENTE: TStringField
      FieldName = 'CD_TIPO_RECIPIENTE'
      Size = 2
    end
    object tbl_ad_ii_QT_ML_RECIPIENTE: TFloatField
      FieldName = 'QT_ML_RECIPIENTE'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_QT_MERC_UN_ALIQ_ES: TFloatField
      FieldName = 'QT_MERC_UN_ALIQ_ES'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_VL_ALIQ_ESPEC_IPT: TFloatField
      FieldName = 'VL_ALIQ_ESPEC_IPT'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_VL_CALC_IPT_ESPEC: TFloatField
      FieldName = 'VL_CALC_IPT_ESPEC'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_CD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      Size = 1
    end
    object tbl_ad_ii_PC_ALIQ_REDUZIDA: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_PC_REDUCAO_IPT_BLI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_BLI'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_PC_ALIQ_ACOR_TARIF: TFloatField
      FieldName = 'PC_ALIQ_ACOR_TARIF'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_VL_CALC_II_AC_TARI: TFloatField
      FieldName = 'VL_CALC_II_AC_TARI'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_VL_IMPOSTO_DEVIDO: TFloatField
      FieldName = 'VL_IMPOSTO_DEVIDO'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_VL_IPT_A_RECOLHER: TFloatField
      FieldName = 'VL_IPT_A_RECOLHER'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ii_CD_TIPO_DIREITO: TStringField
      FieldName = 'CD_TIPO_DIREITO'
      Size = 1
    end
    object tbl_ad_ii_NR_NOTA_COMPL_TIPI: TStringField
      FieldName = 'NR_NOTA_COMPL_TIPI'
      Size = 2
    end
  end
  object ds_ad_ipi: TDataSource
    DataSet = tbl_ad_ipi_
    Left = 576
    Top = 56
  end
  object tbl_ad_ipi_: TTable
    Filter = 'CD_RECEITA_IMPOSTO = '#39'0002'#39
    Filtered = True
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO;CD_RECEITA_IMPOSTO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TRIBUTO'
    UpdateMode = upWhereKeyOnly
    Left = 712
    Top = 56
    object tbl_ad_ipi_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_ad_ipi_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_ad_ipi_CD_RECEITA_IMPOSTO: TStringField
      FieldName = 'CD_RECEITA_IMPOSTO'
      Size = 4
    end
    object tbl_ad_ipi_CD_TIPO_ALIQ_IPT: TStringField
      FieldName = 'CD_TIPO_ALIQ_IPT'
      Size = 1
    end
    object tbl_ad_ipi_VL_BASE_CALC_ADVAL: TFloatField
      FieldName = 'VL_BASE_CALC_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_PC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_VL_CALC_IPT_ADVAL: TFloatField
      FieldName = 'VL_CALC_IPT_ADVAL'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_NM_UN_ALIQ_ESP_IPT: TStringField
      FieldName = 'NM_UN_ALIQ_ESP_IPT'
      Size = 15
    end
    object tbl_ad_ipi_CD_TIPO_RECIPIENTE: TStringField
      FieldName = 'CD_TIPO_RECIPIENTE'
      Size = 2
    end
    object tbl_ad_ipi_QT_ML_RECIPIENTE: TFloatField
      FieldName = 'QT_ML_RECIPIENTE'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_QT_MERC_UN_ALIQ_ES: TFloatField
      FieldName = 'QT_MERC_UN_ALIQ_ES'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_VL_ALIQ_ESPEC_IPT: TFloatField
      FieldName = 'VL_ALIQ_ESPEC_IPT'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_VL_CALC_IPT_ESPEC: TFloatField
      FieldName = 'VL_CALC_IPT_ESPEC'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_CD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      Size = 1
    end
    object tbl_ad_ipi_PC_ALIQ_REDUZIDA: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_PC_REDUCAO_IPT_BLI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_BLI'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_PC_ALIQ_ACOR_TARIF: TFloatField
      FieldName = 'PC_ALIQ_ACOR_TARIF'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_VL_CALC_II_AC_TARI: TFloatField
      FieldName = 'VL_CALC_II_AC_TARI'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_VL_IMPOSTO_DEVIDO: TFloatField
      FieldName = 'VL_IMPOSTO_DEVIDO'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_VL_IPT_A_RECOLHER: TFloatField
      FieldName = 'VL_IPT_A_RECOLHER'
      DisplayFormat = '#0,.00'
    end
    object tbl_ad_ipi_CD_TIPO_DIREITO: TStringField
      FieldName = 'CD_TIPO_DIREITO'
      Size = 1
    end
    object tbl_ad_ipi_NR_NOTA_COMPL_TIPI: TStringField
      FieldName = 'NR_NOTA_COMPL_TIPI'
      Size = 2
    end
  end
  object ds_ad_antidump: TDataSource
    DataSet = tbl_ad_antidump_
    Left = 576
    Top = 104
  end
  object tbl_ad_antidump_: TTable
    Filter = 'CD_RECEITA_IMPOSTO = '#39'0003'#39
    Filtered = True
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO;CD_RECEITA_IMPOSTO'
    MasterFields = 'NR_PROCESSO;NR_ADICAO'
    MasterSource = ds_adicao
    TableName = 'TRIBUTO'
    UpdateMode = upWhereKeyOnly
    Left = 712
    Top = 104
    object tbl_ad_antidump_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
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
  object sp_di_classifica_item: TStoredProc
    DatabaseName = 'DBDI'
    StoredProcName = 'dbo.sp_di_classifica_item;1'
    Params.Data = {
      0100020006526573756C74040304000000000000010C406E725F70726F636573
      736F0101020030000000}
    Left = 92
    Top = 416
    object sp_di_classifica_itemNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object sp_di_classifica_itemNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_di_reclassifica_item: TStoredProc
    DatabaseName = 'DBDI'
    StoredProcName = 'dbo.sp_di_reclassifica_item;1'
    Params.Data = {
      0100040006526573756C74040304000000000000010C406E725F70726F636573
      736F01010200300000000A406E725F61646963616F010102003000000008406E
      725F6974656D0101020030000000}
    Left = 52
    Top = 440
    object sp_di_reclassifica_itemNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object sp_di_reclassifica_itemNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_di_renumera_itens_adicao: TStoredProc
    DatabaseName = 'DBDI'
    StoredProcName = 'dbo.sp_di_renumera_itens_adicao;1'
    Params.Data = {
      0100030006526573756C74040304000000000000000C406E725F70726F636573
      736F01010200300000000A406E725F61646963616F0101020030000000}
    Left = 92
    Top = 468
    object StringField1: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField2: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_di_gera_base_calc: TStoredProc
    DatabaseName = 'DBDI'
    StoredProcName = 'dbo.sp_di_gera_base_calc;1'
    Params.Data = {
      0100030006526573756C74040304000000000000000C406E725F70726F636573
      736F01010200300000000A406E725F61646963616F0101020030000000}
    Left = 52
    Top = 388
  end
  object ds_adicao_w: TDataSource
    DataSet = tbl_adicao_w_
    Left = 144
    Top = 56
  end
  object tbl_adicao_w_: TTable
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_di_w
    TableName = 'TADICAO_DE_IMPORTACAO'
    UpdateMode = upWhereKeyOnly
    Left = 188
    Top = 80
    object tbl_adicao_w_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 11
    end
    object tbl_adicao_w_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Required = True
      Size = 3
    end
    object tbl_adicao_w_CD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      Size = 7
    end
    object tbl_adicao_w_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Size = 2
    end
    object tbl_adicao_w_IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
      Required = True
    end
    object tbl_adicao_w_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Size = 60
    end
    object tbl_adicao_w_ED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object tbl_adicao_w_ED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Size = 6
    end
    object tbl_adicao_w_ED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object tbl_adicao_w_ED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object tbl_adicao_w_ED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object tbl_adicao_w_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object tbl_adicao_w_CD_MERCADORIA_NCM: TStringField
      FieldName = 'CD_MERCADORIA_NCM'
      Size = 11
    end
    object tbl_adicao_w_CD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Size = 3
    end
    object tbl_adicao_w_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object tbl_adicao_w_NM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Size = 60
    end
    object tbl_adicao_w_ED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      Size = 40
    end
    object tbl_adicao_w_ED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      Size = 6
    end
    object tbl_adicao_w_ED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      Size = 21
    end
    object tbl_adicao_w_ED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Size = 25
    end
    object tbl_adicao_w_ED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Size = 25
    end
    object tbl_adicao_w_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object tbl_adicao_w_CD_MERC_NBM_SH: TStringField
      FieldName = 'CD_MERC_NBM_SH'
      Size = 8
    end
    object tbl_adicao_w_CD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Size = 7
    end
    object tbl_adicao_w_CD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Size = 8
    end
    object tbl_adicao_w_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Required = True
    end
    object tbl_adicao_w_QT_UN_ESTATISTICA: TFloatField
      FieldName = 'QT_UN_ESTATISTICA'
      Required = True
    end
    object tbl_adicao_w_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      Size = 1
    end
    object tbl_adicao_w_VL_MERC_EMB_MN: TFloatField
      FieldName = 'VL_MERC_EMB_MN'
      Required = True
    end
    object tbl_adicao_w_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object tbl_adicao_w_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Size = 3
    end
    object tbl_adicao_w_CD_LOC_COND_VENDA: TStringField
      FieldName = 'CD_LOC_COND_VENDA'
      Size = 4
    end
    object tbl_adicao_w_VL_MERC_COND_VENDA: TFloatField
      FieldName = 'VL_MERC_COND_VENDA'
      Required = True
    end
    object tbl_adicao_w_VL_MERC_VENDA_MN: TFloatField
      FieldName = 'VL_MERC_VENDA_MN'
      Required = True
    end
    object tbl_adicao_w_VL_FRETE_MERC_MNEG: TFloatField
      FieldName = 'VL_FRETE_MERC_MNEG'
      Required = True
    end
    object tbl_adicao_w_CD_MD_FRETE_MERC: TStringField
      FieldName = 'CD_MD_FRETE_MERC'
      Size = 3
    end
    object tbl_adicao_w_VL_FRETE_MERC_MN: TFloatField
      FieldName = 'VL_FRETE_MERC_MN'
      Required = True
    end
    object tbl_adicao_w_VL_SEG_MERC_MNEG: TFloatField
      FieldName = 'VL_SEG_MERC_MNEG'
      Required = True
    end
    object tbl_adicao_w_CD_MOEDA_SEG_MERC: TStringField
      FieldName = 'CD_MOEDA_SEG_MERC'
      Size = 3
    end
    object tbl_adicao_w_VL_SEG_MERC_MN: TFloatField
      FieldName = 'VL_SEG_MERC_MN'
      Required = True
    end
    object tbl_adicao_w_VL_UNID_LOC_EMP: TFloatField
      FieldName = 'VL_UNID_LOC_EMP'
      Required = True
    end
    object tbl_adicao_w_CD_METOD_VALORACAO: TStringField
      FieldName = 'CD_METOD_VALORACAO'
      Size = 2
    end
    object tbl_adicao_w_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Size = 1
    end
    object tbl_adicao_w_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object tbl_adicao_w_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Size = 3
    end
    object tbl_adicao_w_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Size = 1
    end
    object tbl_adicao_w_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Size = 2
    end
    object tbl_adicao_w_CD_MOTIVO_ADM_TEMP: TStringField
      FieldName = 'CD_MOTIVO_ADM_TEMP'
      Size = 2
    end
    object tbl_adicao_w_NR_DCTO_REDUCAO: TStringField
      FieldName = 'NR_DCTO_REDUCAO'
      Size = 8
    end
    object tbl_adicao_w_VL_DESPESAS_MNEG: TFloatField
      FieldName = 'VL_DESPESAS_MNEG'
      Required = True
    end
    object tbl_adicao_w_CD_MOEDAS_DESPESAS: TStringField
      FieldName = 'CD_MOEDAS_DESPESAS'
      Size = 3
    end
    object tbl_adicao_w_VL_DESPESAS_MN: TFloatField
      FieldName = 'VL_DESPESAS_MN'
      Required = True
    end
    object tbl_adicao_w_PC_COEF_REDUC_II: TFloatField
      FieldName = 'PC_COEF_REDUC_II'
      Required = True
    end
    object tbl_adicao_w_VL_CALC_DCR_DOLAR: TFloatField
      FieldName = 'VL_CALC_DCR_DOLAR'
      Required = True
    end
    object tbl_adicao_w_VL_II_CALC_DCR_MN: TFloatField
      FieldName = 'VL_II_CALC_DCR_MN'
      Required = True
    end
    object tbl_adicao_w_VL_II_DEVIDO_ZFM: TFloatField
      FieldName = 'VL_II_DEVIDO_ZFM'
      Required = True
    end
    object tbl_adicao_w_VL_II_A_REC_ZFM: TFloatField
      FieldName = 'VL_II_A_REC_ZFM'
      Required = True
    end
    object tbl_adicao_w_CD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Size = 1
    end
    object tbl_adicao_w_CD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Size = 2
    end
    object tbl_adicao_w_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object tbl_adicao_w_CD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Size = 2
    end
    object tbl_adicao_w_QT_PARC_FINANC_360: TIntegerField
      FieldName = 'QT_PARC_FINANC_360'
      Required = True
    end
    object tbl_adicao_w_CD_PERIOD_PGTO_360: TStringField
      FieldName = 'CD_PERIOD_PGTO_360'
      Size = 1
    end
    object tbl_adicao_w_QT_PERIOD_PGTO_360: TIntegerField
      FieldName = 'QT_PERIOD_PGTO_360'
      Required = True
    end
    object tbl_adicao_w_VL_TOT_FINANC_360: TFloatField
      FieldName = 'VL_TOT_FINANC_360'
      Required = True
    end
    object tbl_adicao_w_PC_TAXA_JUROS: TFloatField
      FieldName = 'PC_TAXA_JUROS'
      Required = True
    end
    object tbl_adicao_w_CD_TAXA_JUROS: TStringField
      FieldName = 'CD_TAXA_JUROS'
      Size = 4
    end
    object tbl_adicao_w_VL_FINANC_SUP_360: TFloatField
      FieldName = 'VL_FINANC_SUP_360'
      Required = True
    end
    object tbl_adicao_w_NR_ROF: TStringField
      FieldName = 'NR_ROF'
      Size = 8
    end
    object tbl_adicao_w_IN_PGTO_VARIAV_360: TBooleanField
      FieldName = 'IN_PGTO_VARIAV_360'
      Required = True
    end
    object tbl_adicao_w_IN_JUROS_ATE_360: TBooleanField
      FieldName = 'IN_JUROS_ATE_360'
      Required = True
    end
    object tbl_adicao_w_PC_COMISSAO_AG_IMP: TFloatField
      FieldName = 'PC_COMISSAO_AG_IMP'
      Required = True
    end
    object tbl_adicao_w_VL_COMISSAO_AG_IMP: TFloatField
      FieldName = 'VL_COMISSAO_AG_IMP'
      Required = True
    end
    object tbl_adicao_w_CD_TIPO_AGENTE_IMP: TStringField
      FieldName = 'CD_TIPO_AGENTE_IMP'
      Size = 1
    end
    object tbl_adicao_w_NR_AGENTE_IMP: TStringField
      FieldName = 'NR_AGENTE_IMP'
      Size = 14
    end
    object tbl_adicao_w_CD_BANC_AGENTE_IMP: TStringField
      FieldName = 'CD_BANC_AGENTE_IMP'
      Size = 5
    end
    object tbl_adicao_w_CD_AGENC_AGENT_IMP: TStringField
      FieldName = 'CD_AGENC_AGENT_IMP'
      Size = 4
    end
    object tbl_adicao_w_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
      Required = True
    end
    object tbl_adicao_w_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
      Required = True
    end
    object tbl_adicao_w_TX_COMPL_VL_ADUAN: TStringField
      FieldName = 'TX_COMPL_VL_ADUAN'
      Size = 250
    end
    object tbl_adicao_w_IN_IPI_NAO_TRIBUT: TBooleanField
      FieldName = 'IN_IPI_NAO_TRIBUT'
      Required = True
    end
    object tbl_adicao_w_vl_merc_loc_emb_mn: TFloatField
      FieldName = 'vl_merc_loc_emb_mn'
      Required = True
    end
    object tbl_adicao_w_vl_base_calculo_mn: TFloatField
      FieldName = 'vl_base_calculo_mn'
      Required = True
    end
    object tbl_adicao_w_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Size = 10
    end
    object tbl_adicao_w_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      Size = 5
    end
    object tbl_adicao_w_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Size = 5
    end
    object tbl_adicao_w_QT_ITENS_ADICAO: TIntegerField
      FieldName = 'QT_ITENS_ADICAO'
      Required = True
      DisplayFormat = '000'
    end
    object tbl_adicao_w_VL_ACRESCIMOS_MN: TFloatField
      FieldName = 'VL_ACRESCIMOS_MN'
      Required = True
    end
    object tbl_adicao_w_VL_DEDUCOES_MN: TFloatField
      FieldName = 'VL_DEDUCOES_MN'
      Required = True
    end
  end
  object ds_ad_itens_w: TDataSource
    DataSet = tbl_ad_itens_w_
    Left = 576
    Top = 456
  end
  object tbl_ad_itens_w_: TTable
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO;NR_ITEM'
    TableName = 'TDETALHE_MERCADORIA'
    UpdateMode = upWhereKeyOnly
    Left = 712
    Top = 456
    object tbl_ad_itens_w_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 11
    end
    object tbl_ad_itens_w_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Required = True
      Size = 3
    end
    object tbl_ad_itens_w_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Required = True
      Size = 3
    end
    object tbl_ad_itens_w_TX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object tbl_ad_itens_w_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Size = 15
    end
    object tbl_ad_itens_w_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Size = 2
    end
    object tbl_ad_itens_w_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Size = 11
    end
    object tbl_ad_itens_w_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Size = 8
    end
    object tbl_ad_itens_w_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Size = 7
    end
    object tbl_ad_itens_w_QT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
      Required = True
    end
    object tbl_ad_itens_w_QT_MERC_UN_ESTAT: TFloatField
      FieldName = 'QT_MERC_UN_ESTAT'
      Required = True
    end
    object tbl_ad_itens_w_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Required = True
    end
    object tbl_ad_itens_w_PC_DESCONTO_MERC: TFloatField
      FieldName = 'PC_DESCONTO_MERC'
      Required = True
    end
    object tbl_ad_itens_w_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Required = True
    end
    object tbl_ad_itens_w_VL_DESCONTO_MERC: TFloatField
      FieldName = 'VL_DESCONTO_MERC'
      Required = True
    end
    object tbl_ad_itens_w_VL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
      Required = True
    end
    object tbl_ad_itens_w_VL_FRETE_ITEM: TFloatField
      FieldName = 'VL_FRETE_ITEM'
      Required = True
    end
    object tbl_ad_itens_w_VL_SEGURO_ITEM: TFloatField
      FieldName = 'VL_SEGURO_ITEM'
      Required = True
    end
    object tbl_ad_itens_w_VL_MCV_ITEM: TFloatField
      FieldName = 'VL_MCV_ITEM'
      Required = True
    end
    object tbl_ad_itens_w_VL_UNID_COND_VENDA: TFloatField
      FieldName = 'VL_UNID_COND_VENDA'
      Required = True
    end
    object tbl_ad_itens_w_CD_TIPO_CALCULO_ITEM: TStringField
      FieldName = 'CD_TIPO_CALCULO_ITEM'
      Size = 1
    end
    object tbl_ad_itens_w_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Size = 15
    end
    object tbl_ad_itens_w_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Size = 1
    end
    object tbl_ad_itens_w_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Size = 5
    end
    object tbl_ad_itens_w_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Size = 3
    end
    object tbl_ad_itens_w_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Size = 5
    end
    object tbl_ad_itens_w_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Size = 3
    end
  end
  object ds_di_w: TDataSource
    DataSet = tbl_di_w_
    Left = 52
    Top = 52
  end
  object tbl_di_w_: TTable
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO'
    TableName = 'TDECLARACAO_IMPORTACAO'
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 80
    object tbl_di_w_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_di_w_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 15
    end
    object tbl_di_w_NR_DECL_IMP_PROT: TStringField
      FieldName = 'NR_DECL_IMP_PROT'
      Size = 10
    end
    object tbl_di_w_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Size = 10
    end
    object tbl_di_w_DT_PROCESSAMENTO: TStringField
      FieldName = 'DT_PROCESSAMENTO'
      Size = 8
    end
    object tbl_di_w_DT_TRANSMISSAO: TStringField
      FieldName = 'DT_TRANSMISSAO'
      Size = 8
    end
    object tbl_di_w_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Size = 8
    end
    object tbl_di_w_CD_TIPO_DECLARACAO: TStringField
      FieldName = 'CD_TIPO_DECLARACAO'
      Size = 2
    end
    object tbl_di_w_CD_MOTIVO_TRANS: TStringField
      FieldName = 'CD_MOTIVO_TRANS'
      Size = 1
    end
    object tbl_di_w_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object tbl_di_w_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object tbl_di_w_NR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object tbl_di_w_CD_MODALIDADE_DESP: TStringField
      FieldName = 'CD_MODALIDADE_DESP'
      Size = 1
    end
    object tbl_di_w_IN_OPERACAO_FUNDAP: TBooleanField
      FieldName = 'IN_OPERACAO_FUNDAP'
    end
    object tbl_di_w_CD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      Size = 7
    end
    object tbl_di_w_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object tbl_di_w_CD_TIPO_CONSIG: TStringField
      FieldName = 'CD_TIPO_CONSIG'
      Size = 1
    end
    object tbl_di_w_NR_CONSIGNATARIO: TStringField
      FieldName = 'NR_CONSIGNATARIO'
      Size = 14
    end
    object tbl_di_w_NM_CONSIGNATARIO: TStringField
      FieldName = 'NM_CONSIGNATARIO'
      Size = 60
    end
    object tbl_di_w_CD_PAIS_PROC_CARGA: TStringField
      FieldName = 'CD_PAIS_PROC_CARGA'
      Size = 3
    end
    object tbl_di_w_CD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      Size = 2
    end
    object tbl_di_w_IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
    end
    object tbl_di_w_NR_VEICULO_TRANSP: TStringField
      FieldName = 'NR_VEICULO_TRANSP'
      Size = 15
    end
    object tbl_di_w_NM_VEICULO_TRANSP: TStringField
      FieldName = 'NM_VEICULO_TRANSP'
      Size = 30
    end
    object tbl_di_w_CD_BANDEIRA_TRANSP: TStringField
      FieldName = 'CD_BANDEIRA_TRANSP'
      Size = 3
    end
    object tbl_di_w_CD_TIPO_AG_CARGA: TStringField
      FieldName = 'CD_TIPO_AG_CARGA'
      Size = 1
    end
    object tbl_di_w_NR_AGENTE_CARGA: TStringField
      FieldName = 'NR_AGENTE_CARGA'
      Size = 14
    end
    object tbl_di_w_CD_TIPO_DCTO_CARGA: TStringField
      FieldName = 'CD_TIPO_DCTO_CARGA'
      Size = 2
    end
    object tbl_di_w_NR_DCTO_CARGA: TStringField
      FieldName = 'NR_DCTO_CARGA'
      Size = 18
    end
    object tbl_di_w_NR_DCTO_CARGA_MAST: TStringField
      FieldName = 'NR_DCTO_CARGA_MAST'
      Size = 18
    end
    object tbl_di_w_DT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      Size = 8
    end
    object tbl_di_w_CD_UTIL_DCTO_CARGA: TStringField
      FieldName = 'CD_UTIL_DCTO_CARGA'
      Size = 1
    end
    object tbl_di_w_PB_CARGA: TFloatField
      FieldName = 'PB_CARGA'
    end
    object tbl_di_w_PL_CARGA: TFloatField
      FieldName = 'PL_CARGA'
    end
    object tbl_di_w_DT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      Size = 8
    end
    object tbl_di_w_CD_TIPO_MANIFESTO: TStringField
      FieldName = 'CD_TIPO_MANIFESTO'
      Size = 1
    end
    object tbl_di_w_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Size = 15
    end
    object tbl_di_w_CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Size = 7
    end
    object tbl_di_w_CD_SETOR_ARMAZENAM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAM'
      Size = 3
    end
    object tbl_di_w_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Size = 3
    end
    object tbl_di_w_VL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
    end
    object tbl_di_w_VL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
    end
    object tbl_di_w_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
    end
    object tbl_di_w_VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
    end
    object tbl_di_w_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Size = 3
    end
    object tbl_di_w_VL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
    end
    object tbl_di_w_VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
    end
    object tbl_di_w_CD_MOEDA_DESPESAS: TStringField
      FieldName = 'CD_MOEDA_DESPESAS'
      Size = 3
    end
    object tbl_di_w_VL_TOT_DESPS_MNEG: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG'
    end
    object tbl_di_w_VL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
    end
    object tbl_di_w_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Size = 3
    end
    object tbl_di_w_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
    end
    object tbl_di_w_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
    end
    object tbl_di_w_IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
    end
    object tbl_di_w_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      BlobType = ftMemo
    end
    object tbl_di_w_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object tbl_di_w_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      Size = 4
    end
    object tbl_di_w_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object tbl_di_w_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
      DisplayFormat = '000'
    end
    object tbl_di_w_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      Size = 1
    end
    object tbl_di_w_CD_COBERTURA_CAMBIAL: TStringField
      FieldName = 'CD_COBERTURA_CAMBIAL'
      Size = 1
    end
    object tbl_di_w_CD_DESTAQUE_NCM: TStringField
      FieldName = 'CD_DESTAQUE_NCM'
      Size = 3
    end
    object tbl_di_w_CD_FORMA_PAGAMENTO: TStringField
      FieldName = 'CD_FORMA_PAGAMENTO'
      Size = 1
    end
    object tbl_di_w_CD_FUND_LEGAL_II: TStringField
      FieldName = 'CD_FUND_LEGAL_II'
      Size = 2
    end
    object tbl_di_w_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Size = 3
    end
    object tbl_di_w_CD_METODO_VALORACAO: TStringField
      FieldName = 'CD_METODO_VALORACAO'
      Size = 2
    end
    object tbl_di_w_CD_MODALIDADE_PAGTO: TStringField
      FieldName = 'CD_MODALIDADE_PAGTO'
      Size = 2
    end
    object tbl_di_w_CD_MOTIVO_SEM_COBERTURA: TStringField
      FieldName = 'CD_MOTIVO_SEM_COBERTURA'
      Size = 2
    end
    object tbl_di_w_CD_REG_TRIB_II: TStringField
      FieldName = 'CD_REG_TRIB_II'
      Size = 1
    end
    object tbl_di_w_CD_REG_TRIB_IPI: TStringField
      FieldName = 'CD_REG_TRIB_IPI'
      Size = 1
    end
    object tbl_di_w_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Size = 1
    end
    object tbl_di_w_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
    end
    object tbl_di_w_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
    end
    object tbl_di_w_IN_MOEDA_NACIONAL: TStringField
      FieldName = 'IN_MOEDA_NACIONAL'
      Size = 1
    end
    object tbl_di_w_IN_RATEAR_FRETE_ITENS: TBooleanField
      FieldName = 'IN_RATEAR_FRETE_ITENS'
    end
    object tbl_di_w_IN_RATEAR_SEGURO_ITENS: TBooleanField
      FieldName = 'IN_RATEAR_SEGURO_ITENS'
    end
    object tbl_di_w_IN_REPASSA_DADOS_ADICAO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_ADICAO'
    end
    object tbl_di_w_IN_REPASSA_DADOS_CAMBIO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_CAMBIO'
    end
    object tbl_di_w_NR_BANCO_COM: TStringField
      FieldName = 'NR_BANCO_COM'
      Size = 5
    end
    object tbl_di_w_NR_BANCO_PAGAMENTO: TStringField
      FieldName = 'NR_BANCO_PAGAMENTO'
      Size = 5
    end
    object tbl_di_w_NR_COMPRADOR_ME: TStringField
      FieldName = 'NR_COMPRADOR_ME'
      Size = 14
    end
    object tbl_di_w_NR_CONTRATO_CAMBIO: TStringField
      FieldName = 'NR_CONTRATO_CAMBIO'
      Size = 8
    end
    object tbl_di_w_NR_IDENTIFICACAO_COM: TStringField
      FieldName = 'NR_IDENTIFICACAO_COM'
      Size = 14
    end
    object tbl_di_w_NR_PRACA_COM: TStringField
      FieldName = 'NR_PRACA_COM'
      Size = 4
    end
    object tbl_di_w_NR_PRACA_PAGAMENTO: TStringField
      FieldName = 'NR_PRACA_PAGAMENTO'
      Size = 5
    end
    object tbl_di_w_NR_ROF: TStringField
      FieldName = 'NR_ROF'
      Size = 8
    end
    object tbl_di_w_PC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
    end
    object tbl_di_w_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
    end
    object tbl_di_w_PC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
    end
    object tbl_di_w_PC_SEGURO_MLE: TFloatField
      FieldName = 'PC_SEGURO_MLE'
    end
    object tbl_di_w_VL_TOTAL_II: TFloatField
      FieldName = 'VL_TOTAL_II'
    end
    object tbl_di_w_VL_TOTAL_IPI: TFloatField
      FieldName = 'VL_TOTAL_IPI'
    end
    object tbl_di_w_VL_TOTAL_AD: TFloatField
      FieldName = 'VL_TOTAL_AD'
    end
    object tbl_di_w_DT_ULTIMA_ALTERACAO: TDateTimeField
      FieldName = 'DT_ULTIMA_ALTERACAO'
    end
    object tbl_di_w_IN_RISC_ATUALIZADO: TStringField
      FieldName = 'IN_RISC_ATUALIZADO'
      Size = 1
    end
  end
  object qry_ad_cambio_pg_antec_: TQuery
    AfterInsert = qry_ad_cambio_pg_antec_AfterInsert
    BeforePost = qry_ad_cambio_pg_antec_BeforePost
    DatabaseName = 'DBDI'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ADICAO, CD_FORMA_PAGAMENTO , IN_PAGAMENTO' +
        '_MN , '
      ' CD_BANCO_PAGAMENTO , '
      ' CD_PRACA_PAGAMENTO , NR_OP_CAMBIO , '
      ' VL_VINC_MD_CAMBIO , NR_COMPR_CAMBIO , '
      ' CD_TP_COMPR_CAMBIO'
      'FROM TPAGAMENTO_VINCULADO TPAGAMENTO_VINCULADO'
      
        'WHERE NR_PROCESSO = :NR_PROCESSO AND NR_ADICAO = :NR_ADICAO AND ' +
        'CD_FORMA_PAGAMENTO = :CD_FORMA_PAGAMENTO')
    Params.Data = {
      010003000B4E525F50524F434553534F0001020030000000094E525F41444943
      414F00010200300000001243445F464F524D415F504147414D454E544F000102
      0030000000}
    Left = 712
    Top = 152
    object qry_ad_cambio_pg_antec_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_PROCESSO'
      Required = True
      Size = 11
    end
    object qry_ad_cambio_pg_antec_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_ADICAO'
      Required = True
      Size = 3
    end
    object qry_ad_cambio_pg_antec_CD_FORMA_PAGAMENTO: TStringField
      FieldName = 'CD_FORMA_PAGAMENTO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_FORMA_PAGAMENTO'
      Required = True
      Size = 1
    end
    object qry_ad_cambio_pg_antec_CD_BANCO_PAGAMENTO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'CD_BANCO_PAGAMENTO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_BANCO_PAGAMENTO'
      EditMask = '99999'
      Size = 5
    end
    object qry_ad_cambio_pg_antec_CD_PRACA_PAGAMENTO: TStringField
      DisplayLabel = 'Praça'
      FieldName = 'CD_PRACA_PAGAMENTO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_PRACA_PAGAMENTO'
      EditMask = '9999'
      Size = 4
    end
    object qry_ad_cambio_pg_antec_NR_OP_CAMBIO: TStringField
      DisplayLabel = 'Nº Contrato'
      FieldName = 'NR_OP_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_OP_CAMBIO'
      EditMask = '99999999'
      Size = 8
    end
    object qry_ad_cambio_pg_antec_VL_VINC_MD_CAMBIO: TFloatField
      DisplayLabel = 'Valor Vinculado'
      FieldName = 'VL_VINC_MD_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.VL_VINC_MD_CAMBIO'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_cambio_pg_antec_NR_COMPR_CAMBIO: TStringField
      DisplayLabel = 'Comprador (M.Est.)'
      FieldName = 'NR_COMPR_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_COMPR_CAMBIO'
      EditMask = '99999999999999'
      Size = 14
    end
    object qry_ad_cambio_pg_antec_CD_TP_COMPR_CAMBIO: TStringField
      FieldName = 'CD_TP_COMPR_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_TP_COMPR_CAMBIO'
      Size = 1
    end
    object qry_ad_cambio_pg_antec_IN_PAGAMENTO_MN: TStringField
      FieldName = 'IN_PAGAMENTO_MN'
      Origin = 'TPAGAMENTO_VINCULADO.CD_FORMA_PAGAMENTO'
      Size = 1
    end
    object qry_ad_cambio_pg_antec_Look_Moeda_nac: TStringField
      DisplayLabel = 'M.Nac.'
      FieldName = 'Look_Moeda_nac'
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_PAGAMENTO_MN'
      Size = 3
      Lookup = True
    end
  end
  object qry_ad_cambio_pg_avista_: TQuery
    AfterInsert = qry_ad_cambio_pg_avista_AfterInsert
    BeforePost = qry_ad_cambio_pg_avista_BeforePost
    DatabaseName = 'DBDI'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ADICAO, CD_FORMA_PAGAMENTO , IN_PAGAMENTO' +
        '_MN , '
      ' CD_BANCO_PAGAMENTO , '
      ' CD_PRACA_PAGAMENTO , NR_OP_CAMBIO , '
      ' VL_VINC_MD_CAMBIO , NR_COMPR_CAMBIO , '
      ' CD_TP_COMPR_CAMBIO'
      'FROM TPAGAMENTO_VINCULADO TPAGAMENTO_VINCULADO'
      
        'WHERE NR_PROCESSO = :NR_PROCESSO AND NR_ADICAO = :NR_ADICAO AND ' +
        'CD_FORMA_PAGAMENTO = :CD_FORMA_PAGAMENTO')
    Params.Data = {
      010003000B4E525F50524F434553534F0001020030000000094E525F41444943
      414F00010200300000001243445F464F524D415F504147414D454E544F000102
      0030000000}
    Left = 712
    Top = 200
    object qry_ad_cambio_pg_avista_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_PROCESSO'
      Size = 11
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
      DisplayLabel = 'Praça'
      FieldName = 'CD_PRACA_PAGAMENTO'
      Origin = 'TPAGAMENTO_VINCULADO.CD_PRACA_PAGAMENTO'
      Size = 4
    end
    object qry_ad_cambio_pg_avista_NR_OP_CAMBIO: TStringField
      DisplayLabel = 'Nº Contrato'
      FieldName = 'NR_OP_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_OP_CAMBIO'
      Size = 8
    end
    object qry_ad_cambio_pg_avista_VL_VINC_MD_CAMBIO: TFloatField
      DisplayLabel = 'Valor Vinculado'
      FieldName = 'VL_VINC_MD_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.VL_VINC_MD_CAMBIO'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_cambio_pg_avista_NR_COMPR_CAMBIO: TStringField
      DisplayLabel = 'Comprador (M.Est.)'
      FieldName = 'NR_COMPR_CAMBIO'
      Origin = 'TPAGAMENTO_VINCULADO.NR_COMPR_CAMBIO'
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
      FieldName = 'Look_Moeda_nac'
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_PAGAMENTO_MN'
      Size = 3
      Lookup = True
    end
  end
  object sp_soma_tributos: TStoredProc
    DatabaseName = 'DBDI'
    StoredProcName = 'dbo.sp_soma_tributos;1'
    Params.Data = {
      0100020006526573756C74040304000000000000000C406E725F70726F636573
      736F0101020030000000}
    Left = 52
    Top = 488
  end
  object qry_ncm_: TQuery
    DatabaseName = 'DBTABSISCO'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO , UNIDADE_MEDIDA , '
      ' ALIQUOTA_II , DATA_INICIO_VIG_II , '
      ' DATA_FIM_VIG_II , ALIQUOTA_II_MERCOSUL , '
      ' DATA_INICIO_VIG_II_MSUL , '
      ' DATA_FIM_VIG_II_MSUL , ALIQUOTA_IPI , '
      ' DATA_INICIO_VIG_IPI , DATA_FIM_VIG_IPI'
      'FROM TNCM TNCM '
      'WHERE CODIGO = :CODIGO')
    Params.Data = {0100010006434F4449474F0001020030000000}
    Left = 188
    Top = 320
  end
  object ds_ncm: TDataSource
    DataSet = qry_ncm_
    Left = 144
    Top = 296
  end
  object qry_fund_leg_: TQuery
    DatabaseName = 'DBTABSISCO'
    SQL.Strings = (
      'SELECT Codigo , Descricao , Reg_Tribut_1 , '
      ' Reg_Tribut_2 , Reg_Tribut_3 , '
      ' Reg_Tribut_4'
      'FROM TFUND_LEG_REG_TRIBUT TFUND_LEG_REG_TRIBUT'
      'WHERE Codigo = :CODIGO')
    Params.Data = {0100010006434F4449474F0001020030000000}
    Left = 188
    Top = 500
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
    Left = 144
    Top = 476
  end
  object ds_urf_entrada: TDataSource
    DataSet = qry_urf_entrada_
    Left = 144
    Top = 520
  end
  object qry_urf_entrada_: TQuery
    DatabaseName = 'DBTABSISCO'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO'
      'FROM TURF TURF'
      'WHERE CODIGO = :CODIGO')
    Params.Data = {0100010006434F4449474F0001020030000000}
    Left = 188
    Top = 544
  end
  object ds_mot_sem_cobertura: TDataSource
    DataSet = qry_mot_sem_cobertura_
    Left = 396
    Top = 32
  end
  object qry_mot_sem_cobertura_: TQuery
    DatabaseName = 'DBTABSISCO'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO'
      'FROM TMOT_SEM_COBERT_CAMBIAL TMOT_SEM_COBERT_CAMBIAL'
      'WHERE CODIGO = :CODIGO')
    Params.Data = {0100010006434F4449474F0001020030000000}
    Left = 472
    Top = 32
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
    Left = 396
    Top = 104
  end
  object qry_mod_pagto_: TQuery
    DatabaseName = 'DBTABSISCO'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO'
      'FROM TMODALID_PAGAMENTO TMODALID_PAGAMENTO'
      'WHERE CODIGO = :CODIGO')
    Params.Data = {0100010006434F4449474F0001020030000000}
    Left = 480
    Top = 104
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
    DatabaseName = 'DBTABSISCO'
    SQL.Strings = (
      'SELECT CD_NOMENC_NCM , CD_ATRIBUTO_NCM , '
      ' IN_MULTIPLA_ESPECIF , CD_NIVEL_NCM , '
      ' NM_ATRIBUTO'
      'FROM TATRIB_VALORACAO_NVE TATRIB_VALORACAO_NVE'
      'WHERE CD_NOMENC_NCM = :CD_NCM AND'
      'CD_NIVEL_NCM = :CD_NIVEL')
    Params.Data = {
      010002000643445F4E434D00010200300000000843445F4E4956454C00010200
      30000000}
    Left = 480
    Top = 152
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
    Left = 396
    Top = 152
  end
  object ds_espec_nve: TDataSource
    DataSet = qry_espec_nve_
    Left = 396
    Top = 200
  end
  object qry_espec_nve_: TQuery
    DatabaseName = 'DBTABSISCO'
    SQL.Strings = (
      'SELECT CD_NOMENC_NCM , CD_ATRIBUTO_NCM , '
      ' CD_ESPECIF_NCM , CD_NIVEL_NCM , '
      ' NM_ESPECIF_NCM'
      'FROM TESPECIF_VALORACAO_NVE TESPECIF_VALORACAO_NVE'
      'WHERE CD_NOMENC_NCM = :CD_NCM AND'
      'CD_NIVEL_NCM = :CD_NIVEL AND '
      'CD_ATRIBUTO_NCM = :CD_ATRIBUTO_NCM')
    Params.Data = {
      010003000643445F4E434D00010200300000000843445F4E4956454C00010200
      300000000F43445F415452494255544F5F4E434D0001020030000000}
    Left = 480
    Top = 200
  end
  object ds_nve: TDataSource
    DataSet = qry_nve_
    Left = 396
    Top = 248
  end
  object qry_nve_: TQuery
    DatabaseName = 'DBDI'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_ADICAO , '
      ' CD_ABRANGENCIA_NCM , CD_ATRIBUTO_NCM , '
      ' CD_ESPECIF_NCM'
      'FROM TVALORACAO_NCM TVALORACAO_NCM'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND '
      'NR_ADICAO = :NR_ADICAO')
    Params.Data = {
      010002000B4E525F50524F434553534F0001020030000000094E525F41444943
      414F0001020030000000}
    Left = 480
    Top = 248
    object qry_nve_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TVALORACAO_NCM.NR_PROCESSO'
      Size = 11
    end
    object qry_nve_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TVALORACAO_NCM.NR_ADICAO'
      Size = 3
    end
    object qry_nve_CD_ABRANGENCIA_NCM: TStringField
      DisplayLabel = 'Nível'
      FieldName = 'CD_ABRANGENCIA_NCM'
      Origin = 'TVALORACAO_NCM.CD_ABRANGENCIA_NCM'
      Size = 1
    end
    object qry_nve_CD_ATRIBUTO_NCM: TStringField
      DisplayLabel = 'Atributo'
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TVALORACAO_NCM.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_nve_CD_ESPECIF_NCM: TStringField
      DisplayLabel = 'Especificação'
      FieldName = 'CD_ESPECIF_NCM'
      Origin = 'TVALORACAO_NCM.CD_ESPECIF_NCM'
      Size = 4
    end
    object qry_nve_Look_abrangencia: TStringField
      DisplayLabel = 'Nível'
      FieldName = 'Look_abrangencia'
      LookupDataSet = tbl_abrangencia_nve_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_ABRANGENCIA_NCM'
      Size = 25
      Lookup = True
    end
  end
  object tbl_abrangencia_nve_: TTable
    DatabaseName = 'DBTABSISCO'
    IndexFieldNames = 'CODIGO'
    TableName = 'TABRANGENCIA_NVE'
    Left = 476
    Top = 316
    object tbl_abrangencia_nve_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 1
    end
    object tbl_abrangencia_nve_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
  end
  object ds_abrangencia_nve: TDataSource
    DataSet = tbl_abrangencia_nve_
    Left = 396
    Top = 316
  end
  object ds_atrib_nve_desc: TDataSource
    DataSet = qry_atrib_nve_desc_
    Left = 392
    Top = 380
  end
  object qry_atrib_nve_desc_: TQuery
    DatabaseName = 'DBTABSISCO'
    SQL.Strings = (
      'SELECT CD_NOMENC_NCM , CD_ATRIBUTO_NCM , '
      ' IN_MULTIPLA_ESPECIF , CD_NIVEL_NCM , '
      ' NM_ATRIBUTO'
      'FROM TATRIB_VALORACAO_NVE TATRIB_VALORACAO_NVE'
      'WHERE CD_NOMENC_NCM = :CD_NCM AND'
      'CD_NIVEL_NCM = :CD_NIVEL AND'
      'CD_ATRIBUTO_NCM = :CD_ATRIBUTO')
    Params.Data = {
      010003000643445F4E434D00010200300000000843445F4E4956454C00010200
      300000000B43445F415452494255544F0001020030000000}
    Left = 476
    Top = 380
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
    Left = 392
    Top = 428
  end
  object qry_espec_nve_desc_: TQuery
    DatabaseName = 'DBTABSISCO'
    SQL.Strings = (
      'SELECT CD_NOMENC_NCM , CD_ATRIBUTO_NCM , '
      ' CD_ESPECIF_NCM , CD_NIVEL_NCM , '
      ' NM_ESPECIF_NCM'
      'FROM TESPECIF_VALORACAO_NVE TESPECIF_VALORACAO_NVE'
      'WHERE CD_NOMENC_NCM = :CD_NCM AND'
      'CD_NIVEL_NCM = :CD_NIVEL AND '
      'CD_ATRIBUTO_NCM = :CD_ATRIBUTO AND'
      'CD_ESPECIF_NCM = :CD_ESPECIF')
    Params.Data = {
      010004000643445F4E434D00010200300000000843445F4E4956454C00010200
      300000000B43445F415452494255544F00010200300000000A43445F45535045
      4349460001020030000000}
    Left = 476
    Top = 428
  end
end
