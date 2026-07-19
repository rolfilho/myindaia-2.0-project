object datm_amz: Tdatm_amz
  OldCreateOrder = True
  Left = 240
  Top = 57
  Height = 601
  Width = 674
  object ds_amz: TDataSource
    DataSet = qry_amz_
    Left = 155
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
  object qry_amz_: TQuery
    BeforeInsert = qry_amz_BeforeEdit
    BeforeEdit = qry_amz_BeforeEdit
    AfterPost = qry_amz_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TARMAZEM ORDER BY'
      'NM_ARMAZEM')
    Left = 155
    Top = 20
    object qry_amz_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TARMAZEM.CD_ARMAZEM'
      Size = 4
    end
    object qry_amz_NM_ARMAZEM: TStringField
      FieldName = 'NM_ARMAZEM'
      Origin = 'TARMAZEM.NM_ARMAZEM'
      Size = 50
    end
    object qry_amz_NM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      Origin = 'TARMAZEM.NM_SIGLA'
      Size = 10
    end
    object qry_amz_CD_SETOR: TStringField
      FieldName = 'CD_SETOR'
      Origin = 'TARMAZEM.CD_SETOR'
      EditMask = '!999;0; '
      Size = 3
    end
    object qry_amz_CD_RECINTO: TStringField
      FieldName = 'CD_RECINTO'
      Origin = 'TARMAZEM.CD_RECINTO'
      EditMask = '!9999999;0; '
      Size = 7
    end
    object qry_amz_CD_URF: TStringField
      FieldName = 'CD_URF'
      Origin = 'TARMAZEM.CD_URF'
      EditMask = '!9999999;0; '
      Size = 7
    end
    object qry_amz_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TARMAZEM.CD_UNID_NEG'
      EditMask = '!99;0; '
      Size = 2
    end
    object qry_amz_IN_ATRACACAO: TStringField
      FieldName = 'IN_ATRACACAO'
      Origin = 'TARMAZEM.IN_ATRACACAO'
      Size = 1
    end
    object qry_amz_IN_DESCARGA: TStringField
      FieldName = 'IN_DESCARGA'
      Origin = 'TARMAZEM.IN_DESCARGA'
      Size = 1
    end
    object qry_amz_IN_ESTOCAGEM: TStringField
      FieldName = 'IN_ESTOCAGEM'
      Origin = 'TARMAZEM.IN_ESTOCAGEM'
      Size = 1
    end
    object qry_amz_CD_MARGEM: TStringField
      FieldName = 'CD_MARGEM'
      Origin = 'TARMAZEM.CD_MARGEM'
      Size = 1
    end
    object qry_amz_TP_TAXA: TStringField
      FieldName = 'TP_TAXA'
      Origin = 'TARMAZEM.TP_TAXA'
      Size = 1
    end
    object qry_amz_CD_TAXA: TStringField
      FieldName = 'CD_TAXA'
      Origin = 'TARMAZEM.CD_TAXA'
      Size = 3
    end
    object qry_amz_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TARMAZEM.IN_ATIVO'
      Size = 1
    end
    object qry_amz_look_atracacao: TStringField
      FieldKind = fkLookup
      FieldName = 'look_atracacao'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATRACACAO'
      Size = 3
      Lookup = True
    end
    object qry_amz_look_descarga: TStringField
      FieldKind = fkLookup
      FieldName = 'look_descarga'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_DESCARGA'
      Size = 3
      Lookup = True
    end
    object qry_amz_look_estocagem: TStringField
      FieldKind = fkLookup
      FieldName = 'look_estocagem'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ESTOCAGEM'
      Size = 3
      Lookup = True
    end
    object qry_amz_look_ativo: TStringField
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_amz_look_margem: TStringField
      FieldKind = fkLookup
      FieldName = 'look_margem'
      LookupDataSet = qry_margem_
      LookupKeyFields = 'CD_MARGEM'
      LookupResultField = 'NM_MARGEM'
      KeyFields = 'CD_MARGEM'
      Size = 10
      Lookup = True
    end
    object qry_amz_look_tp_taxa: TStringField
      FieldKind = fkLookup
      FieldName = 'look_tp_taxa'
      LookupDataSet = qry_tp_taxa_
      LookupKeyFields = 'CD_TP_TAXA'
      LookupResultField = 'NM_TP_TAXA'
      KeyFields = 'TP_TAXA'
      Size = 35
      Lookup = True
    end
    object qry_amz_look_nm_tx_tra: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_tx_tra'
      LookupDataSet = qry_tx_tra_
      LookupKeyFields = 'CD_TAXA_TRA'
      LookupResultField = 'NM_DESCRICAO'
      KeyFields = 'CD_TAXA'
      Size = 25
      Lookup = True
    end
    object qry_amz_look_nm_tx_amg: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_tx_amg'
      LookupDataSet = qry_tx_armazenagem_
      LookupKeyFields = 'CD_TAXA'
      LookupResultField = 'NM_DESCRICAO'
      KeyFields = 'CD_TAXA'
      Size = 25
      Lookup = True
    end
    object qry_amz_NM_SIGLA_CONT: TStringField
      FieldName = 'NM_SIGLA_CONT'
      Origin = 'TARMAZEM.CD_ARMAZEM'
      Size = 10
    end
    object qry_amz_NM_LOCAL_DESP: TStringField
      DisplayWidth = 20
      FieldName = 'NM_LOCAL_DESP'
      Origin = 'TARMAZEM.CD_ARMAZEM'
    end
    object qry_amz_CD_UF: TStringField
      FieldName = 'CD_UF'
      Origin = 'TARMAZEM.NM_ARMAZEM'
      Size = 2
    end
    object qry_amz_END_ARMAZEM: TStringField
      FieldName = 'END_ARMAZEM'
      Origin = 'DBBROKER.TARMAZEM.END_ARMAZEM'
      FixedChar = True
      Size = 80
    end
    object qry_amz_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      Origin = 'DBBROKER.TARMAZEM.NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_amz_NR_CONTATO: TStringField
      FieldName = 'NR_CONTATO'
      Origin = 'DBBROKER.TARMAZEM.NR_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_amz_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      Origin = 'DBBROKER.TARMAZEM.NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qry_amz_CD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      Origin = 'DBBROKER.TARMAZEM.CD_CIDADE'
      FixedChar = True
      Size = 4
    end
    object qry_amz_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'DBBROKER.TARMAZEM.NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_amz_CGC_ARMAZEM: TStringField
      FieldName = 'CGC_ARMAZEM'
      Origin = 'DBBROKER.TARMAZEM.CGC_ARMAZEM'
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
  end
  object qry_ult_amz_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_ARMAZEM) ULTIMO'
      'FROM  TARMAZEM ')
    Left = 243
    Top = 20
    object qry_ult_amz_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TARMAZEM.CD_ARMAZEM'
      Size = 4
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TUNID_NEG WHERE IN_ATIVO='#39'1'#39' ')
    Left = 32
    Top = 149
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
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG.IN_ATIVO'
      Size = 1
    end
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 32
    Top = 197
  end
  object ds_recinto_setores_importacao: TDataSource
    DataSet = qry_recinto_setores_importacao_
    Left = 155
    Top = 197
  end
  object qry_recinto_setores_importacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TRECINTO_SETORES_IMPORTACAO')
    Left = 155
    Top = 149
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
  object qry_rec_alfandegado_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TREC_ALFANDEGADO')
    Left = 427
    Top = 20
    object qry_rec_alfandegado_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TREC_ALFANDEGADO.CODIGO'
      Size = 7
    end
    object qry_rec_alfandegado_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TREC_ALFANDEGADO.DESCRICAO'
      Size = 120
    end
    object qry_rec_alfandegado_COD_ORGAO_REC: TStringField
      FieldName = 'COD_ORGAO_REC'
      Origin = 'TREC_ALFANDEGADO.COD_ORGAO_REC'
      Size = 7
    end
  end
  object ds_rec_alfandegado: TDataSource
    DataSet = qry_rec_alfandegado_
    Left = 427
    Top = 77
  end
  object qry_urf_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TURF ')
    Left = 323
    Top = 20
    object qry_urf_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TURF.CODIGO'
      Size = 7
    end
    object qry_urf_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TURF.DESCRICAO'
      Size = 120
    end
  end
  object ds_urf: TDataSource
    DataSet = qry_urf_
    Left = 323
    Top = 77
  end
  object qry_tp_taxa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTP_TAXA')
    Left = 323
    Top = 149
    object qry_tp_taxa_CD_TP_TAXA: TStringField
      FieldName = 'CD_TP_TAXA'
      Origin = 'TTP_TAXA.CD_TP_TAXA'
      Size = 1
    end
    object qry_tp_taxa_NM_TP_TAXA: TStringField
      FieldName = 'NM_TP_TAXA'
      Origin = 'TTP_TAXA.NM_TP_TAXA'
      Size = 15
    end
  end
  object ds_tp_taxa: TDataSource
    DataSet = qry_tp_taxa_
    Left = 323
    Top = 197
  end
  object qry_margem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TMARGEM'
      'ORDER BY CD_MARGEM DESC')
    Left = 427
    Top = 149
    object qry_margem_CD_MARGEM: TStringField
      FieldName = 'CD_MARGEM'
      Origin = 'TMARGEM.CD_MARGEM'
      Size = 1
    end
    object qry_margem_NM_MARGEM: TStringField
      FieldName = 'NM_MARGEM'
      Origin = 'TMARGEM.NM_MARGEM'
      Size = 8
    end
  end
  object ds_margem: TDataSource
    DataSet = qry_margem_
    Left = 427
    Top = 197
  end
  object qry_tx_tra_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTAXA_TRA')
    Left = 32
    Top = 280
    object qry_tx_tra_CD_TAXA_TRA: TStringField
      FieldName = 'CD_TAXA_TRA'
      Origin = 'TTAXA_TRA.CD_TAXA_TRA'
      Size = 3
    end
    object qry_tx_tra_NM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      Origin = 'TTAXA_TRA.NM_DESCRICAO'
      Size = 30
    end
    object qry_tx_tra_VL_THC_CNTR_20: TFloatField
      FieldName = 'VL_THC_CNTR_20'
      Origin = 'TTAXA_TRA.VL_THC_CNTR_20'
    end
    object qry_tx_tra_VL_THC_CNTR_40: TFloatField
      FieldName = 'VL_THC_CNTR_40'
      Origin = 'TTAXA_TRA.VL_THC_CNTR_40'
    end
    object qry_tx_tra_VL_THC_C_SOLTA: TFloatField
      FieldName = 'VL_THC_C_SOLTA'
      Origin = 'TTAXA_TRA.VL_THC_C_SOLTA'
    end
    object qry_tx_tra_VL_THC_CNTR_20_RORO: TFloatField
      FieldName = 'VL_THC_CNTR_20_RORO'
      Origin = 'TTAXA_TRA.VL_THC_CNTR_20_RORO'
    end
    object qry_tx_tra_VL_THC_CNTR_40_RORO: TFloatField
      FieldName = 'VL_THC_CNTR_40_RORO'
      Origin = 'TTAXA_TRA.VL_THC_CNTR_40_RORO'
    end
    object qry_tx_tra_VL_THC_C_SOLTA_RORO: TFloatField
      FieldName = 'VL_THC_C_SOLTA_RORO'
      Origin = 'TTAXA_TRA.VL_THC_C_SOLTA_RORO'
    end
    object qry_tx_tra_VL_THC_MIN: TFloatField
      FieldName = 'VL_THC_MIN'
      Origin = 'TTAXA_TRA.VL_THC_MIN'
    end
    object qry_tx_tra_VL_CARR_CNTR_20_MM: TFloatField
      FieldName = 'VL_CARR_CNTR_20_MM'
      Origin = 'TTAXA_TRA.VL_CARR_CNTR_20_MM'
    end
    object qry_tx_tra_VL_CARR_CNTR_20_MO: TFloatField
      FieldName = 'VL_CARR_CNTR_20_MO'
      Origin = 'TTAXA_TRA.VL_CARR_CNTR_20_MO'
    end
    object qry_tx_tra_VL_CARR_CNTR_40_MM: TFloatField
      FieldName = 'VL_CARR_CNTR_40_MM'
      Origin = 'TTAXA_TRA.VL_CARR_CNTR_40_MM'
    end
    object qry_tx_tra_VL_CARR_CNTR_40_MO: TFloatField
      FieldName = 'VL_CARR_CNTR_40_MO'
      Origin = 'TTAXA_TRA.VL_CARR_CNTR_40_MO'
    end
    object qry_tx_tra_VL_CARR_C_SOLTA_MM: TFloatField
      FieldName = 'VL_CARR_C_SOLTA_MM'
      Origin = 'TTAXA_TRA.VL_CARR_C_SOLTA_MM'
    end
    object qry_tx_tra_VL_CARR_C_SOLTA_MO: TFloatField
      FieldName = 'VL_CARR_C_SOLTA_MO'
      Origin = 'TTAXA_TRA.VL_CARR_C_SOLTA_MO'
    end
    object qry_tx_tra_VL_CARR_MIN: TFloatField
      FieldName = 'VL_CARR_MIN'
      Origin = 'TTAXA_TRA.VL_CARR_MIN'
    end
    object qry_tx_tra_PC_ACR_CARR_PERIGO: TFloatField
      FieldName = 'PC_ACR_CARR_PERIGO'
      Origin = 'TTAXA_TRA.PC_ACR_CARR_PERIGO'
    end
    object qry_tx_tra_NR_PERIODO_ARM: TIntegerField
      FieldName = 'NR_PERIODO_ARM'
      Origin = 'TTAXA_TRA.NR_PERIODO_ARM'
    end
    object qry_tx_tra_VL_ARM_CNTR_1P: TFloatField
      FieldName = 'VL_ARM_CNTR_1P'
      Origin = 'TTAXA_TRA.VL_ARM_CNTR_1P'
    end
    object qry_tx_tra_VL_ARM_CNTR_DP: TFloatField
      FieldName = 'VL_ARM_CNTR_DP'
      Origin = 'TTAXA_TRA.VL_ARM_CNTR_DP'
    end
    object qry_tx_tra_VL_ARM_CNTR_20_MIN: TFloatField
      FieldName = 'VL_ARM_CNTR_20_MIN'
      Origin = 'TTAXA_TRA.VL_ARM_CNTR_20_MIN'
    end
    object qry_tx_tra_VL_ARM_CNTR_40_MIN: TFloatField
      FieldName = 'VL_ARM_CNTR_40_MIN'
      Origin = 'TTAXA_TRA.VL_ARM_CNTR_40_MIN'
    end
    object qry_tx_tra_VL_ARM_CNTR_REIMP: TFloatField
      FieldName = 'VL_ARM_CNTR_REIMP'
      Origin = 'TTAXA_TRA.VL_ARM_CNTR_REIMP'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_1P: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_1P'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_1P'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_2P: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_2P'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_2P'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_3P: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_3P'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_3P'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_DP: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_DP'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_DP'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_MIN: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_MIN'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_MIN'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_BAGAGEM: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_BAGAGEM'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_BAGAGEM'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_REIMP: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_REIMP'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_REIMP'
    end
    object qry_tx_tra_PC_ACR_ARM_PERIGO: TFloatField
      FieldName = 'PC_ACR_ARM_PERIGO'
      Origin = 'TTAXA_TRA.PC_ACR_ARM_PERIGO'
    end
    object qry_tx_tra_VL_ENERGIA_CNTR_FIXO: TFloatField
      FieldName = 'VL_ENERGIA_CNTR_FIXO'
      Origin = 'TTAXA_TRA.VL_ENERGIA_CNTR_FIXO'
    end
    object qry_tx_tra_VL_ENERGIA_CNTR_20: TFloatField
      FieldName = 'VL_ENERGIA_CNTR_20'
      Origin = 'TTAXA_TRA.VL_ENERGIA_CNTR_20'
    end
    object qry_tx_tra_VL_ENERGIA_CNTR_40: TFloatField
      FieldName = 'VL_ENERGIA_CNTR_40'
      Origin = 'TTAXA_TRA.VL_ENERGIA_CNTR_40'
    end
    object qry_tx_tra_PC_ISS: TFloatField
      FieldName = 'PC_ISS'
      Origin = 'TTAXA_TRA.PC_ISS'
    end
    object qry_tx_tra_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TTAXA_TRA.IN_ATIVO'
      Size = 1
    end
  end
  object qry_tx_armazenagem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTAXA_ARMAZENAGEM')
    Left = 155
    Top = 280
    object qry_tx_armazenagem_CD_TAXA: TStringField
      FieldName = 'CD_TAXA'
      Origin = 'TTAXA_ARMAZENAGEM.CD_TAXA'
      Size = 3
    end
    object qry_tx_armazenagem_NM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      Origin = 'TTAXA_ARMAZENAGEM.NM_DESCRICAO'
      Size = 30
    end
    object qry_tx_armazenagem_VL_CNTR_20_MD_PALLET: TFloatField
      FieldName = 'VL_CNTR_20_MD_PALLET'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_20_MD_PALLET'
    end
    object qry_tx_armazenagem_VL_CNTR_20_MD_OUTROS: TFloatField
      FieldName = 'VL_CNTR_20_MD_OUTROS'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_20_MD_OUTROS'
    end
    object qry_tx_armazenagem_VL_CNTR_40_MD_PALLET: TFloatField
      FieldName = 'VL_CNTR_40_MD_PALLET'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_40_MD_PALLET'
    end
    object qry_tx_armazenagem_VL_CNTR_40_MD_OUTROS: TFloatField
      FieldName = 'VL_CNTR_40_MD_OUTROS'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_40_MD_OUTROS'
    end
    object qry_tx_armazenagem_VL_C_SOLTA_MD: TFloatField
      FieldName = 'VL_C_SOLTA_MD'
      Origin = 'TTAXA_ARMAZENAGEM.VL_C_SOLTA_MD'
    end
    object qry_tx_armazenagem_VL_CNTR_20_ME_PALLET: TFloatField
      FieldName = 'VL_CNTR_20_ME_PALLET'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_20_ME_PALLET'
    end
    object qry_tx_armazenagem_VL_CNTR_20_ME_OUTROS: TFloatField
      FieldName = 'VL_CNTR_20_ME_OUTROS'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_20_ME_OUTROS'
    end
    object qry_tx_armazenagem_VL_CNTR_40_ME_PALLET: TFloatField
      FieldName = 'VL_CNTR_40_ME_PALLET'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_40_ME_PALLET'
    end
    object qry_tx_armazenagem_VL_CNTR_40_ME_OUTROS: TFloatField
      FieldName = 'VL_CNTR_40_ME_OUTROS'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_40_ME_OUTROS'
    end
    object qry_tx_armazenagem_VL_C_SOLTA_ME: TFloatField
      FieldName = 'VL_C_SOLTA_ME'
      Origin = 'TTAXA_ARMAZENAGEM.VL_C_SOLTA_ME'
    end
    object qry_tx_armazenagem_VL_MINIMO: TFloatField
      FieldName = 'VL_MINIMO'
      Origin = 'TTAXA_ARMAZENAGEM.VL_MINIMO'
    end
    object qry_tx_armazenagem_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TTAXA_ARMAZENAGEM.CD_TAXA'
      Size = 1
    end
  end
  object ds_tx_tra: TDataSource
    DataSet = qry_tx_tra_
    Left = 32
    Top = 336
  end
  object ds_tx_armazenagem: TDataSource
    DataSet = qry_tx_armazenagem_
    Left = 155
    Top = 336
  end
  object qry_arm_tabela_: TQuery
    BeforeInsert = qry_amz_BeforeEdit
    BeforeEdit = qry_amz_BeforeEdit
    AfterPost = qry_amz_AfterPost
    DatabaseName = 'DBBROKER'
    DataSource = ds_amz
    RequestLive = True
    SQL.Strings = (
      'SELECT  CD_ARMAZEM, CD_TABELA, NM_TABELA,  IN_PADRAO,'
      
        'IN_SABDOM, IN_FERIADO, IN_ATIVO, DT_VIGENCIA_INI, DT_VIGENCIA_FI' +
        'M, TP_CNTR, VL_MINIMO'
      'FROM TARM_TABELA '
      'WHERE CD_ARMAZEM =:CD_ARMAZEM')
    Left = 440
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
        Size = 5
      end>
    object qry_arm_tabela_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TARM_TABELA.CD_ARMAZEM'
      Size = 4
    end
    object qry_arm_tabela_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TARM_TABELA.CD_TABELA'
      Size = 3
    end
    object qry_arm_tabela_NM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'TARM_TABELA.NM_TABELA'
      Size = 50
    end
    object qry_arm_tabela_IN_PADRAO: TStringField
      FieldName = 'IN_PADRAO'
      Origin = 'TARM_TABELA.IN_PADRAO'
      Size = 1
    end
    object qry_arm_tabela_LookAtivo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_arm_tabela_IN_SABDOM: TStringField
      FieldName = 'IN_SABDOM'
      Origin = 'TARM_TABELA.CD_ARMAZEM'
      Size = 1
    end
    object qry_arm_tabela_IN_FERIADO: TStringField
      FieldName = 'IN_FERIADO'
      Origin = 'TARM_TABELA.CD_TABELA'
      Size = 1
    end
    object qry_arm_tabela_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TARM_TABELA.CD_ARMAZEM'
      Size = 1
    end
    object qry_arm_tabela_lookPadrao: TStringField
      FieldKind = fkLookup
      FieldName = 'lookPadrao'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_PADRAO'
      Size = 3
      Lookup = True
    end
    object qry_arm_tabela_DT_VIGENCIA_INI: TDateTimeField
      FieldName = 'DT_VIGENCIA_INI'
      Origin = 'DBBROKER.TARM_TABELA.DT_VIGENCIA_INI'
    end
    object qry_arm_tabela_DT_VIGENCIA_FIM: TDateTimeField
      FieldName = 'DT_VIGENCIA_FIM'
      Origin = 'DBBROKER.TARM_TABELA.DT_VIGENCIA_FIM'
    end
    object qry_arm_tabela_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'DBBROKER.TARM_TABELA.TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qry_arm_tabela_VL_MINIMO: TFloatField
      FieldName = 'VL_MINIMO'
      Origin = 'DBBROKER.TARM_TABELA.VL_MINIMO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object ds_arm_tabela: TDataSource
    DataSet = qry_arm_tabela_
    Left = 440
    Top = 312
  end
  object ds_arm_tab_periodo: TDataSource
    DataSet = qry_arm_tab_periodo_
    Left = 320
    Top = 328
  end
  object qry_arm_tab_periodo_: TQuery
    BeforeInsert = qry_amz_BeforeEdit
    BeforeEdit = qry_amz_BeforeEdit
    AfterPost = qry_amz_AfterPost
    DatabaseName = 'DBBROKER'
    DataSource = ds_arm_tabela
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_ARMAZEM,'
      '               CD_TABELA,  NR_PERIODO,'
      '               QT_DIAS, VL_PERCENTUAL,'
      '               VL_TX_ADICIONAL'
      'FROM TARM_TAB_PERIODO'
      'WHERE CD_ARMAZEM=:CD_ARMAZEM'
      'AND CD_TABELA=:CD_TABELA                                       ')
    Left = 320
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
        Size = 5
      end
      item
        DataType = ftString
        Name = 'CD_TABELA'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_arm_tab_periodo_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TARM_TAB_PERIODO.CD_ARMAZEM'
      Size = 4
    end
    object qry_arm_tab_periodo_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TARM_TAB_PERIODO.CD_TABELA'
      Size = 3
    end
    object qry_arm_tab_periodo_NR_PERIODO: TIntegerField
      FieldName = 'NR_PERIODO'
      Origin = 'TARM_TAB_PERIODO.NR_PERIODO'
    end
    object qry_arm_tab_periodo_QT_DIAS: TIntegerField
      FieldName = 'QT_DIAS'
      Origin = 'TARM_TAB_PERIODO.QT_DIAS'
    end
    object qry_arm_tab_periodo_VL_PERCENTUAL: TFloatField
      FieldName = 'VL_PERCENTUAL'
      Origin = 'TARM_TAB_PERIODO.VL_PERCENTUAL'
      DisplayFormat = '0,.00'
      EditFormat = '0.00'
    end
    object qry_arm_tab_periodo_VL_TX_ADICIONAL: TFloatField
      FieldName = 'VL_TX_ADICIONAL'
      Origin = 'TARM_TAB_PERIODO.VL_TX_ADICIONAL'
      DisplayFormat = '0,.00'
      EditFormat = '0.00'
    end
  end
  object qry_ult_arm_tabela_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL(MAX(CD_TABELA),0) ULTIMO'
      'FROM  TARM_TABELA'
      'WHERE CD_ARMAZEM=:CD_ARMAZEM ')
    Left = 240
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end>
    object qry_ult_arm_tabela_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TARM_TABELA.CD_TABELA'
      Size = 3
    end
  end
  object qry_padrao_tab_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT IN_PADRAO FROM TARM_TABELA '
      'WHERE'
      'CD_ARMAZEM =:CD_ARMAZEM AND IN_PADRAO = '#39'1'#39)
    Left = 240
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end>
    object qry_padrao_tab_IN_PADRAO: TStringField
      FieldName = 'IN_PADRAO'
      Origin = 'TARM_TABELA.IN_PADRAO'
      Size = 1
    end
  end
  object qry_ult_arm_tab_periodo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL(MAX(NR_PERIODO),0) ULTIMO'
      'FROM  TARM_TAB_PERIODO'
      'WHERE CD_ARMAZEM=:CD_ARMAZEM '
      'AND CD_TABELA=:CD_TABELA')
    Left = 328
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_TABELA'
        ParamType = ptUnknown
      end>
    object qry_ult_arm_tab_periodo_ULTIMO: TIntegerField
      FieldName = 'ULTIMO'
    end
  end
  object qry_delete_periodos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TARM_TAB_PERIODO'
      'WHERE CD_ARMAZEM =:CD_ARMAZEM'
      'AND CD_TABELA =:CD_TABELA')
    Left = 464
    Top = 384
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_TABELA'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TARM_TAB_PERIODO.CD_ARMAZEM'
      Size = 4
    end
    object StringField2: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TARM_TAB_PERIODO.CD_TABELA'
      Size = 3
    end
    object IntegerField1: TIntegerField
      FieldName = 'NR_PERIODO'
      Origin = 'TARM_TAB_PERIODO.NR_PERIODO'
    end
    object IntegerField2: TIntegerField
      FieldName = 'QT_DIAS'
      Origin = 'TARM_TAB_PERIODO.QT_DIAS'
    end
    object FloatField1: TFloatField
      FieldName = 'VL_PERCENTUAL'
      Origin = 'TARM_TAB_PERIODO.VL_PERCENTUAL'
      DisplayFormat = '0,.00'
      EditFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'VL_TX_ADICIONAL'
      Origin = 'TARM_TAB_PERIODO.VL_TX_ADICIONAL'
      DisplayFormat = '0,.00'
      EditFormat = '0.00'
    end
  end
end
