object datm_DI_Itens: Tdatm_DI_Itens
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 391
  Top = 223
  Height = 727
  Width = 1058
  object ds_ad_itens: TDataSource
    DataSet = qry_ad_itens_
    Left = 31
    Top = 108
  end
  object sp_di_classifica_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_classifica_item'
    Left = 743
    Top = 185
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
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = '@nr_item'
        ParamType = ptOutput
      end>
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
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_reclassifica_item'
    Left = 743
    Top = 245
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
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = '@nr_item'
        ParamType = ptInputOutput
        Value = '0'
      end>
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
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_renumera_itens_adicao'
    Left = 743
    Top = 305
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
  object ds_adicao_: TDataSource
    DataSet = qry_adicao_
    Left = 31
    Top = 59
  end
  object ds_tp_calc_item: TDataSource
    DataSet = tbl_tp_calc_item_
    Left = 278
    Top = 8
  end
  object tbl_tp_calc_item_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TIPO_CALCULO_ITEM'
    ReadOnly = True
    TableName = 'TTP_CALCULO_ITEM'
    UpdateMode = upWhereKeyOnly
    Left = 353
    Top = 11
    object tbl_tp_calc_item_CD_TIPO_CALCULO_ITEM: TStringField
      FieldName = 'CD_TIPO_CALCULO_ITEM'
      Required = True
      Size = 1
    end
    object tbl_tp_calc_item_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object ds_di: TDataSource
    DataSet = qry_di_
    Left = 31
    Top = 8
  end
  object ds_pais: TDataSource
    DataSet = tbl_pais_
    Left = 270
    Top = 114
  end
  object tbl_pais_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TPAIS'
    UpdateMode = upWhereKeyOnly
    Left = 353
    Top = 116
    object tbl_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object tbl_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_unid_med: TDataSource
    DataSet = qry_unid_medida_
    Left = 31
    Top = 283
  end
  object tbl_unid_med_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_UNID_MEDIDA'
    TableName = 'TUNID_MEDIDA_BROKER'
    UpdateMode = upWhereKeyOnly
    Left = 276
    Top = 284
    object tbl_unid_med_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Required = True
      Size = 3
    end
    object tbl_unid_med_NM_UNID_MEDIDA: TStringField
      FieldName = 'NM_UNID_MEDIDA'
      Required = True
      Size = 50
    end
  end
  object tbl_empresa_est_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_EST'
    UpdateMode = upWhereKeyOnly
    Left = 353
    Top = 168
    object tbl_empresa_est_CD_EMPRESA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EMPRESA'
      Required = True
      Size = 5
    end
    object tbl_empresa_est_NM_EMPRESA: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'NM_EMPRESA'
      Size = 60
    end
    object tbl_empresa_est_AP_EMPRESA: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_est_END_NUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object tbl_empresa_est_END_EMPRESA: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'END_EMPRESA'
      Size = 60
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
  object ds_empresa_est: TDataSource
    DataSet = tbl_empresa_est_
    Left = 278
    Top = 167
  end
  object ds_ncm: TDataSource
    DataSet = tbl_ncm_
    Left = 278
    Top = 61
  end
  object tbl_ncm_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TNCM'
    UpdateMode = upWhereKeyOnly
    Left = 353
    Top = 63
    object tbl_ncm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 8
    end
    object tbl_ncm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object tbl_ncm_UNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Size = 4
    end
    object tbl_ncm_ALIQUOTA_II: TStringField
      FieldName = 'ALIQUOTA_II'
      Size = 6
    end
    object tbl_ncm_DATA_INICIO_VIG_II: TStringField
      FieldName = 'DATA_INICIO_VIG_II'
      Size = 10
    end
    object tbl_ncm_DATA_FIM_VIG_II: TStringField
      FieldName = 'DATA_FIM_VIG_II'
      Size = 10
    end
    object tbl_ncm_ALIQUOTA_II_MERCOSUL: TStringField
      FieldName = 'ALIQUOTA_II_MERCOSUL'
      Size = 6
    end
    object tbl_ncm_DATA_INICIO_VIG_II_MSUL: TStringField
      FieldName = 'DATA_INICIO_VIG_II_MSUL'
      Size = 10
    end
    object tbl_ncm_DATA_FIM_VIG_II_MSUL: TStringField
      FieldName = 'DATA_FIM_VIG_II_MSUL'
      Size = 10
    end
    object tbl_ncm_ALIQUOTA_IPI: TStringField
      FieldName = 'ALIQUOTA_IPI'
      Size = 6
    end
    object tbl_ncm_DATA_INICIO_VIG_IPI: TStringField
      FieldName = 'DATA_INICIO_VIG_IPI'
      Size = 10
    end
    object tbl_ncm_DATA_FIM_VIG_IPI: TStringField
      FieldName = 'DATA_FIM_VIG_IPI'
      Size = 10
    end
  end
  object qry_Itens_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_ADICAO, NR_ITEM'
      'FROM TDETALHE_MERCADORIA (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '      NR_ADICAO   = :NR_ADICAO AND'
      '      NR_ITEM     = :NR_ITEM')
    Left = 116
    Top = 164
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
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end>
    object qry_Itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDETALHE_MERCADORIA.NR_PROCESSO'
      Size = 18
    end
    object qry_Itens_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TDETALHE_MERCADORIA.NR_ADICAO'
      Size = 3
    end
    object qry_Itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TDETALHE_MERCADORIA.NR_ITEM'
      Size = 3
    end
  end
  object ds_Item_: TDataSource
    Left = 31
    Top = 164
  end
  object tbl_empresa_nac_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_NAC'
    UpdateMode = upWhereKeyOnly
    Left = 353
    Top = 221
    object tbl_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Required = True
      Size = 5
    end
    object tbl_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_nac_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object tbl_empresa_nac_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object tbl_empresa_nac_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 30
    end
    object tbl_empresa_nac_END_UF: TStringField
      FieldName = 'END_UF'
      Size = 2
    end
    object tbl_empresa_nac_END_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object tbl_empresa_nac_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Size = 1
    end
    object tbl_empresa_nac_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
    object tbl_empresa_nac_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Size = 11
    end
    object tbl_empresa_nac_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
    end
    object tbl_empresa_nac_OUTRO_DOC: TStringField
      FieldName = 'OUTRO_DOC'
    end
    object tbl_empresa_nac_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
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
    object tbl_empresa_nac_CD_TIPO_REF: TStringField
      FieldName = 'CD_TIPO_REF'
      Size = 1
    end
    object tbl_empresa_nac_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Size = 3
    end
    object tbl_empresa_nac_IN_CLIENTE: TBooleanField
      FieldName = 'IN_CLIENTE'
      Required = True
    end
    object tbl_empresa_nac_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
      Required = True
    end
    object tbl_empresa_nac_IN_EXPORTADOR: TBooleanField
      FieldName = 'IN_EXPORTADOR'
      Required = True
    end
    object tbl_empresa_nac_IN_OUTROS: TBooleanField
      FieldName = 'IN_OUTROS'
      Required = True
    end
    object tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField
      FieldName = 'NR_AG_BANCO_IMPOSTOS'
      Size = 5
    end
    object tbl_empresa_nac_CD_SDA: TStringField
      FieldName = 'CD_SDA'
      Size = 4
    end
    object tbl_empresa_nac_NR_CAE: TStringField
      FieldName = 'NR_CAE'
      Size = 10
    end
    object tbl_empresa_nac_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = tbl_empresa_nac_
    Left = 270
    Top = 220
  end
  object qry_ad_itens_nr_ordem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT (ISNULL(MAX(NR_ORDEM),0) + 1) NR_ORDEM'
      'FROM TDETALHE_MERCADORIA (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 497
    Top = 321
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ad_itens_nr_ordem_NR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
    end
  end
  object qry_di_: TQuery
    CachedUpdates = True
    AfterPost = qry_di_AfterPost
    AfterDelete = qry_di_AfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, DT_ULTIMA_ALTERACAO, CD_AUSENCIA_FABRIC, CD_' +
        'FORNECEDOR, CD_FABRICANTE, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC' +
        ', IN_REPASSA_DADOS_ADICAO, '
      
        #9'IN_RISC_ATUALIZADO, QT_ADICOES, CD_IMPORTADOR, PL_CARGA, VL_TOT' +
        '_MLE_MNEG, VL_TOTAL_MLE_MN, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_IC' +
        'MS, PC_ICMS, PC_REDUCAO_ICMS'
      'FROM TDECLARACAO_IMPORTACAO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = updDI
    Left = 116
    Top = 8
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
    object qry_di_DT_ULTIMA_ALTERACAO: TDateTimeField
      FieldName = 'DT_ULTIMA_ALTERACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_ULTIMA_ALTERACAO'
    end
    object qry_di_IN_RISC_ATUALIZADO: TStringField
      FieldName = 'IN_RISC_ATUALIZADO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_RISC_ATUALIZADO'
      Size = 1
    end
    object qry_di_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
      Origin = 'TDECLARACAO_IMPORTACAO.QT_ADICOES'
      DisplayFormat = '000'
    end
    object qry_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_di_PL_CARGA: TFloatField
      FieldName = 'PL_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
    end
    object qry_di_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_ULTIMA_ALTERACAO'
    end
    object qry_di_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_RISC_ATUALIZADO'
    end
    object qry_di_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object qry_di_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      Size = 5
    end
    object qry_di_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Size = 5
    end
    object qry_di_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object qry_di_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object qry_di_IN_REPASSA_DADOS_ADICAO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_ADICAO'
    end
    object qry_di_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.CD_TRIBUTACAO_ICMS'
      FixedChar = True
      Size = 1
    end
    object qry_di_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_di_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.PC_ICMS'
    end
    object qry_di_PC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO.PC_REDUCAO_ICMS'
    end
  end
  object qry_adicao_: TQuery
    CachedUpdates = True
    AfterPost = qry_adicao_AfterPost
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ADICAO, QT_ITENS_ADICAO, CD_PAIS_ORIG_MER' +
        'C'
      'FROM   TADICAO_DE_IMPORTACAO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_PROCESSO, NR_ADICAO')
    UpdateObject = updAdicao
    Left = 116
    Top = 59
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
    object qry_adicao_QT_ITENS_ADICAO: TIntegerField
      FieldName = 'QT_ITENS_ADICAO'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_PROCESSO'
      DisplayFormat = '000'
    end
    object qry_adicao_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_PROCESSO'
      Size = 3
    end
  end
  object qry_ad_itens_: TQuery
    CachedUpdates = True
    AfterInsert = qry_ad_itens_AfterInsert
    AfterEdit = qry_ad_itens_AfterEdit
    BeforePost = qry_ad_itens_BeforePost
    AfterPost = qry_ad_itens_AfterPost
    AfterCancel = qry_ad_itens_AfterCancel
    AfterDelete = qry_ad_itens_AfterDelete
    AfterScroll = qry_ad_itens_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_adicao_
    SQL.Strings = (
      'SELECT * '
      'FROM TDETALHE_MERCADORIA (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '              NR_ADICAO = :NR_ADICAO')
    UpdateObject = upd_ad_itens_
    Left = 116
    Top = 108
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_ad_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDETALHE_MERCADORIA.NR_PROCESSO'
      Size = 18
    end
    object qry_ad_itens_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TDETALHE_MERCADORIA.NR_ADICAO'
      Size = 3
    end
    object qry_ad_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TDETALHE_MERCADORIA.NR_ITEM'
      Size = 3
    end
    object qry_ad_itens_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TDETALHE_MERCADORIA.CD_EXPORTADOR'
      Size = 5
    end
    object qry_ad_itens_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TDETALHE_MERCADORIA.CD_FABR_EXPO'
      Size = 1
    end
    object qry_ad_itens_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TDETALHE_MERCADORIA.CD_FABRICANTE'
      Size = 5
    end
    object qry_ad_itens_CD_MERCADORIA: TStringField
      DisplayWidth = 30
      FieldName = 'CD_MERCADORIA'
      Origin = 'TDETALHE_MERCADORIA.CD_MERCADORIA'
      Size = 30
    end
    object qry_ad_itens_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'TDETALHE_MERCADORIA.CD_NALADI_NCCA'
      EditMask = '9999.99.9;0;_'
      Size = 7
    end
    object qry_ad_itens_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TDETALHE_MERCADORIA.CD_NALADI_SH'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_ad_itens_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TDETALHE_MERCADORIA.CD_NCM_SH'
      EditMask = '9999.99.99-999;0;_'
      Size = 11
    end
    object qry_ad_itens_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TDETALHE_MERCADORIA.CD_PAIS_AQUISICAO'
      Size = 3
    end
    object qry_ad_itens_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TDETALHE_MERCADORIA.CD_PAIS_ORIGEM'
      Size = 3
    end
    object qry_ad_itens_CD_TIPO_CALCULO_ITEM: TStringField
      FieldName = 'CD_TIPO_CALCULO_ITEM'
      Origin = 'TDETALHE_MERCADORIA.CD_TIPO_CALCULO_ITEM'
      Size = 1
    end
    object qry_ad_itens_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'TDETALHE_MERCADORIA.CD_UN_MED_COMERC'
      Size = 3
    end
    object qry_ad_itens_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TDETALHE_MERCADORIA.NR_FATURA'
      Size = 25
    end
    object qry_ad_itens_PC_DESCONTO_MERC: TFloatField
      FieldName = 'PC_DESCONTO_MERC'
      Origin = 'TDETALHE_MERCADORIA.PC_DESCONTO_MERC'
      DisplayFormat = '#0,.00'
      EditFormat = '#,##'
    end
    object qry_ad_itens_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TDETALHE_MERCADORIA.PL_MERCADORIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_ad_itens_QT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
      Origin = 'TDETALHE_MERCADORIA.QT_MERC_UN_COMERC'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_ad_itens_QT_MERC_UN_ESTAT: TFloatField
      FieldName = 'QT_MERC_UN_ESTAT'
      Origin = 'TDETALHE_MERCADORIA.QT_MERC_UN_ESTAT'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_ad_itens_TX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      Origin = 'TDETALHE_MERCADORIA.TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object qry_ad_itens_VL_DESCONTO_MERC: TFloatField
      FieldName = 'VL_DESCONTO_MERC'
      Origin = 'TDETALHE_MERCADORIA.VL_DESCONTO_MERC'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_ad_itens_VL_FRETE_ITEM: TFloatField
      FieldName = 'VL_FRETE_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_FRETE_ITEM'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_ad_itens_VL_MCV_ITEM: TFloatField
      FieldName = 'VL_MCV_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_MCV_ITEM'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_ad_itens_VL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_MLE_ITEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ad_itens_VL_SEGURO_ITEM: TFloatField
      FieldName = 'VL_SEGURO_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_SEGURO_ITEM'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_ad_itens_VL_UNID_COND_VENDA: TFloatField
      FieldName = 'VL_UNID_COND_VENDA'
      Origin = 'TDETALHE_MERCADORIA.VL_UNID_COND_VENDA'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_ad_itens_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TDETALHE_MERCADORIA.VL_UNITARIO'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_ad_itens_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Origin = 'TDETALHE_MERCADORIA.NR_OPER_TRAT_PREV'
      Size = 10
    end
    object qry_ad_itens_NR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      Origin = 'TDETALHE_MERCADORIA.NR_PEDIDO'
      Size = 10
    end
    object qry_ad_itens_VL_II_ITEM: TFloatField
      FieldName = 'VL_II_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_II_ITEM'
    end
    object qry_ad_itens_VL_IPI_ITEM: TFloatField
      FieldName = 'VL_IPI_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_IPI_ITEM'
    end
    object qry_ad_itens_VL_AD_ITEM: TFloatField
      FieldName = 'VL_AD_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_AD_ITEM'
    end
    object qry_ad_itens_VL_ICMS_ITEM: TFloatField
      FieldName = 'VL_ICMS_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_ICMS_ITEM'
    end
    object qry_ad_itens_VL_MLE_ITEM_MN: TFloatField
      FieldName = 'VL_MLE_ITEM_MN'
      Origin = 'TDETALHE_MERCADORIA.VL_MLE_ITEM_MN'
    end
    object qry_ad_itens_VL_FRETE_ITEM_MN: TFloatField
      FieldName = 'VL_FRETE_ITEM_MN'
      Origin = 'TDETALHE_MERCADORIA.VL_FRETE_ITEM_MN'
    end
    object qry_ad_itens_VL_SEGURO_ITEM_MN: TFloatField
      FieldName = 'VL_SEGURO_ITEM_MN'
      Origin = 'TDETALHE_MERCADORIA.VL_SEGURO_ITEM_MN'
    end
    object qry_ad_itens_VL_MCV_ITEM_MN: TFloatField
      FieldName = 'VL_MCV_ITEM_MN'
      Origin = 'TDETALHE_MERCADORIA.VL_MCV_ITEM_MN'
    end
    object qry_ad_itens_VL_UNID_COND_VENDA_MN: TFloatField
      FieldName = 'VL_UNID_COND_VENDA_MN'
      Origin = 'TDETALHE_MERCADORIA.VL_UNID_COND_VENDA_MN'
    end
    object qry_ad_itens_VL_ACRESCIMO_ITEM: TFloatField
      FieldName = 'VL_ACRESCIMO_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_ACRESCIMO_ITEM'
    end
    object qry_ad_itens_VL_DEDUCAO_ITEM: TFloatField
      FieldName = 'VL_DEDUCAO_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_DEDUCAO_ITEM'
    end
    object qry_ad_itens_VL_ACRESCIMO_ITEM_MN: TFloatField
      FieldName = 'VL_ACRESCIMO_ITEM_MN'
      Origin = 'TDETALHE_MERCADORIA.VL_ACRESCIMO_ITEM_MN'
    end
    object qry_ad_itens_VL_DEDUCAO_ITEM_MN: TFloatField
      FieldName = 'VL_DEDUCAO_ITEM_MN'
      Origin = 'TDETALHE_MERCADORIA.VL_DEDUCAO_ITEM_MN'
    end
    object qry_ad_itens_VL_DESPESA_ITEM: TFloatField
      FieldName = 'VL_DESPESA_ITEM'
      Origin = 'TDETALHE_MERCADORIA.VL_DESPESA_ITEM'
    end
    object qry_ad_itens_VL_DESPESA_ITEM_MN: TFloatField
      FieldName = 'VL_DESPESA_ITEM_MN'
      Origin = 'TDETALHE_MERCADORIA.VL_DESPESA_ITEM_MN'
    end
    object qry_ad_itens_NR_ORDEM: TSmallintField
      FieldName = 'NR_ORDEM'
      Origin = 'TDETALHE_MERCADORIA.NR_PROCESSO'
    end
    object qry_ad_itens_Look_Pais_Aquisicao: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Pais_Aquisicao'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_AQUISICAO'
      Lookup = True
    end
    object i: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Pais_Origem'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_ORIGEM'
      Lookup = True
    end
    object qry_ad_itens_Look_NM_Fabricante: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_NM_Fabricante'
      LookupDataSet = tbl_empresa_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FABRICANTE'
      Lookup = True
    end
    object qry_ad_itens_Look_NM_Exportador: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_NM_Exportador'
      LookupDataSet = tbl_empresa_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 100
      Lookup = True
    end
    object qry_ad_itens_Look_Mercadoria: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Mercadoria'
      LookupDataSet = qry_mercadoria_lookup_
      LookupKeyFields = 'CD_MERCADORIA'
      LookupResultField = 'AP_MERCADORIA'
      KeyFields = 'CD_MERCADORIA'
      Lookup = True
    end
    object qry_ad_itens_Look_NM_Unid_Comerc: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_NM_Unid_Comerc'
      LookupDataSet = qry_unid_medida_
      LookupKeyFields = 'CD_UNID_MEDIDA'
      LookupResultField = 'NM_UNID_MEDIDA'
      KeyFields = 'CD_UN_MED_COMERC'
      Lookup = True
    end
    object qry_ad_itens_Look_ativo_unid_med: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_ativo_unid_med'
      LookupDataSet = qry_unid_medida_
      LookupKeyFields = 'CD_UNID_MEDIDA'
      LookupResultField = 'IN_ATIVO'
      KeyFields = 'CD_UN_MED_COMERC'
      Size = 1
      Lookup = True
    end
    object qry_ad_itens_nm_ncm_: TStringField
      FieldKind = fkLookup
      FieldName = 'nm_ncm_'
      LookupDataSet = tbl_ncm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_NCM_SH'
      Size = 240
      Lookup = True
    end
    object qry_ad_itens_NR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Origin = 'TDETALHE_MERCADORIA.CD_FABRICANTE'
      Size = 3
    end
    object qry_ad_itens_NR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'TDETALHE_MERCADORIA.NR_PROCESSO'
      FixedChar = True
      Size = 4
    end
    object qry_ad_itens_NR_PROC_PO: TStringField
      FieldName = 'NR_PROC_PO'
      Origin = 'TDETALHE_MERCADORIA.NR_ADICAO'
      Size = 30
    end
    object qry_ad_itens_VL_DESPESAS_ITEM: TFloatField
      FieldName = 'VL_DESPESAS_ITEM'
      Origin = 'TDETALHE_MERCADORIA.NR_ITEM'
    end
    object qry_ad_itens_VL_DED_CPT_MNEG: TFloatField
      FieldName = 'VL_DED_CPT_MNEG'
      Origin = 'TDETALHE_MERCADORIA.CD_EXPORTADOR'
    end
    object qry_ad_itens_IN_PROVEM_PO: TBooleanField
      FieldName = 'IN_PROVEM_PO'
      Origin = 'TDETALHE_MERCADORIA.CD_FABR_EXPO'
    end
    object qry_ad_itens_VL_TX_SCX_ITEM: TFloatField
      FieldName = 'VL_TX_SCX_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_TX_SCX_ITEM'
    end
    object qry_ad_itens_VL_PIS_ITEM: TFloatField
      FieldName = 'VL_PIS_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_PIS_ITEM'
    end
    object qry_ad_itens_VL_COFINS_ITEM: TFloatField
      FieldName = 'VL_COFINS_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_COFINS_ITEM'
    end
    object qry_ad_itens_VL_BASE_CALC_II: TFloatField
      FieldName = 'VL_BASE_CALC_II'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_BASE_CALC_II'
    end
    object qry_ad_itens_FRETE_COLLECT_ITEM: TFloatField
      FieldName = 'FRETE_COLLECT_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_COLLECT_ITEM'
    end
    object qry_ad_itens_FRETE_PREPAID_ITEM: TFloatField
      FieldName = 'FRETE_PREPAID_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_PREPAID_ITEM'
    end
    object qry_ad_itens_FRETE_TNAC_ITEM: TFloatField
      FieldName = 'FRETE_TNAC_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_TNAC_ITEM'
    end
    object qry_ad_itens_FRETE_COLLECT_ITEM_REAL: TFloatField
      FieldName = 'FRETE_COLLECT_ITEM_REAL'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_COLLECT_ITEM_REAL'
    end
    object qry_ad_itens_FRETE_PREPAID_ITEM_REAL: TFloatField
      FieldName = 'FRETE_PREPAID_ITEM_REAL'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_PREPAID_ITEM_REAL'
    end
    object qry_ad_itens_FRETE_TNAC_ITEM_REAL: TFloatField
      FieldName = 'FRETE_TNAC_ITEM_REAL'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_TNAC_ITEM_REAL'
    end
    object qry_ad_itens_FRETE_COLLECT_ITEM_DOLAR: TFloatField
      FieldName = 'FRETE_COLLECT_ITEM_DOLAR'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_COLLECT_ITEM_DOLAR'
    end
    object qry_ad_itens_FRETE_PREPAID_ITEM_DOLAR: TFloatField
      FieldName = 'FRETE_PREPAID_ITEM_DOLAR'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_PREPAID_ITEM_DOLAR'
    end
    object qry_ad_itens_FRETE_TNAC_ITEM_DOLAR: TFloatField
      FieldName = 'FRETE_TNAC_ITEM_DOLAR'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_TNAC_ITEM_DOLAR'
    end
    object qry_ad_itens_PB_MERCADORIA: TFloatField
      FieldName = 'PB_MERCADORIA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.PB_MERCADORIA'
    end
    object qry_ad_itens_VL_BASE_ICMS_ITEM: TFloatField
      FieldName = 'VL_BASE_ICMS_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_BASE_ICMS_ITEM'
    end
    object qry_ad_itens_NR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_PARCIAL'
    end
    object qry_ad_itens_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_ad_itens_NR_DANFE: TStringField
      FieldName = 'NR_DANFE'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_DANFE'
      FixedChar = True
      Size = 10
    end
    object qry_ad_itens_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_CNTR'
      FixedChar = True
    end
    object qry_ad_itens_ID_CLIENTE: TStringField
      FieldName = 'ID_CLIENTE'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.ID_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_ad_itens_VL_UNITARIO_FOB: TFloatField
      FieldName = 'VL_UNITARIO_FOB'
    end
    object qry_ad_itens_NumeroLote: TStringField
      FieldName = 'NumeroLote'
    end
    object qry_ad_itens_NR_ITEM_DUIMP: TIntegerField
      FieldName = 'NR_ITEM_DUIMP'
    end
    object qry_ad_itens_Look_Cod_Catalogo: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Look_Cod_Catalogo'
      LookupDataSet = qry_mercadoria_lookup_
      LookupKeyFields = 'CD_MERCADORIA'
      LookupResultField = 'CD_CATALOGO_PRODUTOS'
      KeyFields = 'CD_MERCADORIA'
      Lookup = True
    end
    object qry_ad_itens_VL_IS: TFloatField
      FieldName = 'VL_IS'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_IS'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_itens_VL_CIDE: TFloatField
      FieldName = 'VL_CIDE'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_CIDE'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_itens_VL_DIR_COMP: TFloatField
      FieldName = 'VL_DIR_COMP'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_DIR_COMP'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_itens_VL_MED_SAL: TFloatField
      FieldName = 'VL_MED_SAL'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_MED_SAL'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_itens_VL_OUTROS_TRIB: TFloatField
      FieldName = 'VL_OUTROS_TRIB'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_OUTROS_TRIB'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_itens_VL_IBS_MUN: TFloatField
      FieldName = 'VL_IBS_MUN'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_IBS_MUN'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_itens_VL_IBS_UF: TFloatField
      FieldName = 'VL_IBS_UF'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_IBS_UF'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_itens_VL_CBS: TFloatField
      FieldName = 'VL_CBS'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_CBS'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_itens_VL_BASE_IBS_CBS: TFloatField
      FieldName = 'VL_BASE_IBS_CBS'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_BASE_IBS_CBS'
      DisplayFormat = '#0,.00'
    end
    object qry_ad_itens_TX_DESC_COMPLEMENTAR: TStringField
      FieldName = 'TX_DESC_COMPLEMENTAR'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.TX_DESC_COMPLEMENTAR'
      FixedChar = True
      Size = 255
    end
  end
  object qry_ad_Quantidade_itens_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_adicao_
    SQL.Strings = (
      'SELECT COUNT(*) QUANTIDADE'
      'FROM TDETALHE_MERCADORIA (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '              NR_ADICAO = :NR_ADICAO')
    Left = 497
    Top = 78
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
    object qry_ad_Quantidade_itens_QUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
  end
  object tbl_naladi_sh_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TNALADISH'
    UpdateMode = upWhereKeyOnly
    Left = 361
    Top = 404
  end
  object tbl_naladi_ncca_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TNALADINCCA'
    UpdateMode = upWhereKeyOnly
    Left = 276
    Top = 340
  end
  object qry_unid_medida_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_MEDIDA_BROKER (NOLOCK)'
      '')
    Left = 116
    Top = 275
    object qry_unid_medida_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'TUNID_MEDIDA.CD_UNID_MEDIDA'
      Size = 3
    end
    object qry_unid_medida_NM_UNID_MEDIDA: TStringField
      FieldName = 'NM_UNID_MEDIDA'
      Origin = 'TUNID_MEDIDA.NM_UNID_MEDIDA'
      Size = 50
    end
    object qry_unid_medida_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_MEDIDA.IN_ATIVO'
      Size = 1
    end
  end
  object qry_nve_: TQuery
    AfterPost = qry_nve_AfterPost
    AfterScroll = qry_nve_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_ad_itens
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TDI_NVE (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO= :NR_ADICAO AND'
      'NR_ITEM = :NR_ITEM')
    Left = 116
    Top = 336
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
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end>
    object qry_nve_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDI_NVE.NR_PROCESSO'
      Size = 18
    end
    object qry_nve_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TDI_NVE.NR_ADICAO'
      Size = 3
    end
    object qry_nve_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TDI_NVE.NR_ITEM'
      Size = 3
    end
    object qry_nve_CD_NIVEL_NVE: TStringField
      FieldName = 'CD_NIVEL_NVE'
      Origin = 'TDI_NVE.CD_NIVEL_NVE'
      Size = 3
    end
    object qry_nve_CD_ATRIBUTO_NCM: TStringField
      DisplayLabel = 'Atributo'
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TDI_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_nve_CD_ESPECIF_NCM: TStringField
      DisplayLabel = 'Especifica'#231#227'o'
      FieldName = 'CD_ESPECIF_NCM'
      Origin = 'TDI_NVE.CD_ESPECIF_NCM'
      Size = 4
    end
    object qry_nve_nm_nivel_: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldKind = fkLookup
      FieldName = 'LookNivel'
      LookupDataSet = qry_nivel_
      LookupKeyFields = 'CD_NIVEL_NVE'
      LookupResultField = 'NM_NIVEL'
      KeyFields = 'CD_NIVEL_NVE'
      Size = 50
      Lookup = True
    end
    object qry_nve_nm_atrib_: TStringField
      DisplayLabel = 'Atributo'
      FieldKind = fkLookup
      FieldName = 'LookAtrib'
      LookupDataSet = qry_atrib_
      LookupKeyFields = 'CD_ATRIBUTO_NCM'
      LookupResultField = 'NM_ATRIBUTO'
      KeyFields = 'CD_ATRIBUTO_NCM'
      Size = 249
      Lookup = True
    end
    object qry_nve_nm_especif_: TStringField
      DisplayLabel = 'Especifica'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'LookEspecif'
      LookupDataSet = qry_especif_
      LookupKeyFields = 'CD_ESPECIF_NCM'
      LookupResultField = 'NM_ESPECIF_NCM'
      KeyFields = 'CD_ESPECIF_NCM'
      Size = 249
      Lookup = True
    end
    object qry_nve_CD_NCM_ATRIBUTO: TStringField
      FieldName = 'CD_NCM_ATRIBUTO'
      Origin = 'TDI_NVE.NR_PROCESSO'
      Size = 8
    end
    object qry_nve_CD_NCM_ESPECIF: TStringField
      FieldName = 'CD_NCM_ESPECIF'
      Origin = 'TDI_NVE.NR_ADICAO'
      Size = 8
    end
  end
  object ds_nve_: TDataSource
    DataSet = qry_nve_
    Left = 31
    Top = 336
  end
  object tbl_nivel_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TAB_NIVEL'
    Left = 361
    Top = 286
    object tbl_nivel_CD_NIVEL_NVE: TStringField
      FieldName = 'CD_NIVEL_NVE'
      Required = True
      Size = 3
    end
    object tbl_nivel_NM_NIVEL: TStringField
      FieldName = 'NM_NIVEL'
      Size = 50
    end
  end
  object tbl_atrib_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TATRIB_VALORACAO_NVE'
    Left = 276
    Top = 404
    object tbl_atrib_CD_NOMENC_NCM: TStringField
      FieldName = 'CD_NOMENC_NCM'
      Required = True
      Size = 8
    end
    object tbl_atrib_CD_ATRIBUTO_NCM: TStringField
      FieldName = 'CD_ATRIBUTO_NCM'
      Required = True
      Size = 2
    end
    object tbl_atrib_IN_MULTIPLA_ESPECIF: TStringField
      FieldName = 'IN_MULTIPLA_ESPECIF'
      Size = 1
    end
    object tbl_atrib_CD_NIVEL_NCM: TStringField
      FieldName = 'CD_NIVEL_NCM'
      Size = 3
    end
    object tbl_atrib_NM_ATRIBUTO: TStringField
      FieldName = 'NM_ATRIBUTO'
      Size = 249
    end
  end
  object tbl_especif_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TAB_ESPECIF_VALORACAO_NVE'
    Left = 361
    Top = 348
    object tbl_especif_CD_NOMENC_NCM: TStringField
      FieldName = 'CD_NOMENC_NCM'
      Size = 8
    end
    object tbl_especif_CD_ATRIBUTO_NCM: TStringField
      FieldName = 'CD_ATRIBUTO_NCM'
      Size = 2
    end
    object tbl_especif_CD_ESPECIF_NCM: TStringField
      FieldName = 'CD_ESPECIF_NCM'
      Size = 4
    end
    object tbl_especif_CD_NIVEL_NCM: TStringField
      FieldName = 'CD_NIVEL_NCM'
      Size = 3
    end
    object tbl_especif_NM_ESPECIF_NCM: TStringField
      FieldName = 'NM_ESPECIF_NCM'
      Size = 249
    end
  end
  object qry_insere_nve_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'INSERT INTO TDI_NVE'
      
        'SELECT :NR_PROCESSO, :NR_ADICAO, :NR_ITEM, CD_NIVEL_NVE, CD_ATRI' +
        'BUTO_NCM, CD_ESPECIF_NCM, CD_NCM_ATRIBUTO, CD_NCM_ESPECIF'
      'FROM   TMERCAD_NVE'
      'WHERE  CD_MERCADORIA = :CD_MERCADORIA')
    Left = 31
    Top = 228
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
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
  end
  object qry_apaga_nve_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE TDI_NVE'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = :NR_ADICAO AND'
      'NR_ITEM = :NR_ITEM')
    Left = 116
    Top = 228
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
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end>
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_PAIS_ORIGEM'
      'FROM TPROCESSO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 497
    Top = 123
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
    object qry_processo_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPROCESSO.CD_PAIS_ORIGEM'
      Size = 3
    end
  end
  object qry_ii_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ad_itens
    RequestLive = True
    SQL.Strings = (
      'SELECT PC_ALIQ_NORM_ADVAL FROM TRIBUTO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = :NR_ADICAO AND'
      'CD_RECEITA_IMPOSTO = '#39'0001'#39)
    Left = 584
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
  end
  object qry_ipi_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ad_itens
    RequestLive = True
    SQL.Strings = (
      'SELECT PC_ALIQ_NORM_ADVAL FROM TRIBUTO (NOLOCK) '
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = :NR_ADICAO AND'
      'CD_RECEITA_IMPOSTO = '#39'0002'#39)
    Left = 584
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
  end
  object qry_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK)'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Left = 497
    Top = 167
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qry_atz_itens_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TDETALHE_MERCADORIA SET'
      '      CD_FABR_EXPO = CASE ISNULL( :CD_FABR_EXPO, '#39#39' )'
      '                         WHEN '#39#39' THEN CD_FABR_EXPO'
      '                         ELSE :CD_FABR_EXPO'
      '                         END,'
      '      CD_EXPORTADOR = CASE ISNULL( :CD_EXPORTADOR, '#39#39' )'
      '                         WHEN '#39#39' THEN CD_EXPORTADOR'
      '                         ELSE :CD_EXPORTADOR'
      '                         END,'
      '      CD_FABRICANTE = CASE ISNULL( :CD_FABRICANTE, '#39#39' )'
      '                         WHEN '#39#39' THEN CD_FABRICANTE'
      '                         ELSE :CD_FABRICANTE'
      '                         END,'
      '      CD_PAIS_AQUISICAO = CASE ISNULL( :CD_PAIS_AQUISICAO, '#39#39' )'
      '                         WHEN '#39#39' THEN CD_PAIS_AQUISICAO'
      '                         ELSE :CD_PAIS_AQUISICAO'
      '                         END,'
      '      CD_PAIS_ORIGEM = CASE ISNULL( :CD_PAIS_ORIGEM, '#39#39' )'
      '                         WHEN '#39#39' THEN CD_PAIS_ORIGEM'
      '                         ELSE :CD_PAIS_ORIGEM'
      '                         END'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 497
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_FABR_EXPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_FABR_EXPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EXPORTADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EXPORTADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_FABRICANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_FABRICANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PAIS_AQUISICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PAIS_AQUISICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PAIS_ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PAIS_ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_atz_adicao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TADICAO_DE_IMPORTACAO SET'
      'CD_PAIS_ORIG_MERC = CASE ISNULL( :CD_PAIS, '#39#39' )'
      
        '                                          WHEN '#39#39' THEN CD_PAIS_O' +
        'RIG_MERC'
      '                                          ELSE :CD_PAIS'
      '                                          END '
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '      CD_AUSENCIA_FABRIC IN ( '#39'2'#39', '#39'3'#39' )')
    Left = 584
    Top = 372
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PAIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PAIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object sp_di_repassa_dados_adicao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_repassa_dados_adicao'
    Left = 743
    Top = 12
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
    object StringField3: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_di_repassa_dados_cambio: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_repassa_dados_cambio'
    Left = 743
    Top = 67
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
    object StringField5: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField6: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MERCADORIA, AP_MERCADORIA, NM_MERCADORIA,'
      '       PL_MERCADORIA, VL_UNITARIO, CD_IMPORTADOR,'
      '       CD_GRUPO, CD_UN_MED_COMERC, CD_NCM_SH,'
      '       CD_NALADI_SH, CD_NALADI_NCCA, CD_EXPORTADOR,'
      '       CD_PAIS_AQUISICAO, CD_PAIS_ORIGEM, CD_TIPO_CALCULO,'
      '       CD_FABR_EXPO, CD_FABRICANTE, NR_DESTAQUE_NCM'
      'FROM TMERCADORIA (NOLOCK)'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA'
      'AND CD_MERCADORIA IS NOT NULL '
      'AND (( CD_GRUPO = :CD_GRUPO ) AND ( :CD_GRUPO <> '#39#39' )) ')
    Left = 584
    Top = 309
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qry_mercadoria_CD_MERCADORIA: TStringField
      DisplayWidth = 30
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 30
    end
    object qry_mercadoria_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
      Size = 25
    end
    object qry_mercadoria_NM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_mercadoria_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
    end
    object qry_mercadoria_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TMERCADORIA.NM_MERCADORIA'
    end
    object qry_mercadoria_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TMERCADORIA.PL_MERCADORIA'
      Size = 5
    end
    object qry_mercadoria_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TMERCADORIA.VL_UNITARIO'
      Size = 3
    end
    object qry_mercadoria_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'TMERCADORIA.CD_IMPORTADOR'
      Size = 3
    end
    object qry_mercadoria_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TMERCADORIA.CD_GRUPO'
      Size = 11
    end
    object qry_mercadoria_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TMERCADORIA.CD_UN_MED_COMERC'
      Size = 8
    end
    object qry_mercadoria_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'TMERCADORIA.CD_NCM_SH'
      Size = 7
    end
    object qry_mercadoria_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TMERCADORIA.CD_NALADI_SH'
      Size = 5
    end
    object qry_mercadoria_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TMERCADORIA.CD_NALADI_NCCA'
      Size = 3
    end
    object qry_mercadoria_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TMERCADORIA.CD_EXPORTADOR'
      Size = 3
    end
    object qry_mercadoria_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TMERCADORIA.CD_PAIS_AQUISICAO'
      Size = 1
    end
    object qry_mercadoria_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TMERCADORIA.CD_PAIS_ORIGEM'
      Size = 1
    end
    object qry_mercadoria_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TMERCADORIA.CD_TIPO_CALCULO'
      Size = 5
    end
    object qry_mercadoria_NR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Origin = 'DBBROKER.TMERCADORIA.NR_DESTAQUE_NCM'
      FixedChar = True
      Size = 3
    end
  end
  object qry_mercadoria_lookup_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MERCADORIA, AP_MERCADORIA, '
      '       CD_CATALOGO_PRODUTOS'
      'FROM TMERCADORIA (NOLOCK)')
    Left = 584
    Top = 256
    object qry_mercadoria_lookup_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 30
    end
    object qry_mercadoria_lookup_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
      Size = 25
    end
    object qry_mercadoria_lookup_CD_CATALOGO_PRODUTOS: TIntegerField
      FieldName = 'CD_CATALOGO_PRODUTOS'
    end
  end
  object qry_nivel_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ad_itens
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TAB_NIVEL (NOLOCK) ORDER BY CD_NIVEL_NVE')
    Left = 584
    Top = 167
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
  object qry_atrib_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ad_itens
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TATRIB_VALORACAO_NVE (NOLOCK) '
      'WHERE '
      'CD_NOMENC_NCM IS NOT NULL')
    Left = 584
    Top = 119
    object qry_atrib_CD_NOMENC_NCM: TStringField
      FieldName = 'CD_NOMENC_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_NOMENC_NCM'
      Size = 8
    end
    object qry_atrib_CD_ATRIBUTO_NCM: TStringField
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_atrib_IN_MULTIPLA_ESPECIF: TStringField
      FieldName = 'IN_MULTIPLA_ESPECIF'
      Origin = 'TATRIB_VALORACAO_NVE.IN_MULTIPLA_ESPECIF'
      Size = 1
    end
    object qry_atrib_CD_NIVEL_NCM: TStringField
      FieldName = 'CD_NIVEL_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_NIVEL_NCM'
      Size = 3
    end
    object qry_atrib_NM_ATRIBUTO: TStringField
      FieldName = 'NM_ATRIBUTO'
      Origin = 'TATRIB_VALORACAO_NVE.NM_ATRIBUTO'
      Size = 249
    end
  end
  object qry_especif_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ad_itens
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE (NOLOCK)'
      'WHERE '
      'CD_NOMENC_NCM IS NOT NULL')
    Left = 584
    Top = 211
    object qry_especif_CD_NOMENC_NCM: TStringField
      FieldName = 'CD_NOMENC_NCM'
      Origin = 'TAB_ESPECIF_VALORACAO_NVE.CD_NOMENC_NCM'
      Size = 8
    end
    object qry_especif_CD_ATRIBUTO_NCM: TStringField
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TAB_ESPECIF_VALORACAO_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_especif_CD_ESPECIF_NCM: TStringField
      FieldName = 'CD_ESPECIF_NCM'
      Origin = 'TAB_ESPECIF_VALORACAO_NVE.CD_ESPECIF_NCM'
      Size = 4
    end
    object qry_especif_CD_NIVEL_NCM: TStringField
      FieldName = 'CD_NIVEL_NCM'
      Origin = 'TAB_ESPECIF_VALORACAO_NVE.CD_NIVEL_NCM'
      Size = 3
    end
    object qry_especif_NM_ESPECIF_NCM: TStringField
      FieldName = 'NM_ESPECIF_NCM'
      Origin = 'TAB_ESPECIF_VALORACAO_NVE.NM_ESPECIF_NCM'
      Size = 249
    end
  end
  object qry_repassa_forn_fabri: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ad_itens
    SQL.Strings = (
      
        'SELECT IN_REPASSA_DADOS_ADICAO, CD_FABRICANTE, CD_FORNECEDOR, CD' +
        '_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC'
      'FROM TDECLARACAO_IMPORTACAO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 497
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_repassa_forn_fabriCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_FABRICANTE'
      Size = 5
    end
    object qry_repassa_forn_fabriCD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_FORNECEDOR'
      Size = 5
    end
    object qry_repassa_forn_fabriCD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object qry_repassa_forn_fabriCD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object qry_repassa_forn_fabriIN_REPASSA_DADOS_ADICAO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_ADICAO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_REPASSA_DADOS_ADICAO'
    end
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO'
      'FROM   TEMPRESA_NAC (NOLOCK)'
      'WHERE  CD_EMPRESA = :CD_EMPRESA')
    Left = 497
    Top = 214
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end>
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
  end
  object sp_di_verifica_adicao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_verifica_adicao'
    Left = 743
    Top = 366
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
  object sp_di_atz_desc_merc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_atz_desc_merc'
    Left = 743
    Top = 429
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
  object sp_saldo_materia_prima: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_saldo_materia_prima'
    Left = 743
    Top = 125
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_mat_pri'
        ParamType = ptInput
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
      end
      item
        DataType = ftString
        Name = '@nr_item'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@contador'
        ParamType = ptOutput
      end>
  end
  object updDI: TUpdateSQL
    ModifySQL.Strings = (
      'update TDECLARACAO_IMPORTACAO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  DT_ULTIMA_ALTERACAO = :DT_ULTIMA_ALTERACAO,'
      '  CD_AUSENCIA_FABRIC = :CD_AUSENCIA_FABRIC,'
      '  CD_FORNECEDOR = :CD_FORNECEDOR,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_PAIS_AQUIS_MERC = :CD_PAIS_AQUIS_MERC,'
      '  CD_PAIS_ORIG_MERC = :CD_PAIS_ORIG_MERC,'
      '  IN_REPASSA_DADOS_ADICAO = :IN_REPASSA_DADOS_ADICAO,'
      '  IN_RISC_ATUALIZADO = :IN_RISC_ATUALIZADO,'
      '  QT_ADICOES = :QT_ADICOES,'
      '  CD_IMPORTADOR = :CD_IMPORTADOR,'
      '  PL_CARGA = :PL_CARGA,'
      '  VL_TOT_MLE_MNEG = :VL_TOT_MLE_MNEG,'
      '  VL_TOTAL_MLE_MN = :VL_TOTAL_MLE_MN,'
      '  CD_TRIBUTACAO_ICMS = :CD_TRIBUTACAO_ICMS,'
      '  CD_FUND_LEGAL_ICMS = :CD_FUND_LEGAL_ICMS,'
      '  PC_ICMS = :PC_ICMS,'
      '  PC_REDUCAO_ICMS = :PC_REDUCAO_ICMS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TDECLARACAO_IMPORTACAO'
      '  (NR_PROCESSO, DT_ULTIMA_ALTERACAO, CD_AUSENCIA_FABRIC, '
      'CD_FORNECEDOR, '
      '   CD_FABRICANTE, CD_PAIS_AQUIS_MERC, CD_PAIS_ORIG_MERC, '
      'IN_REPASSA_DADOS_ADICAO, '
      '   IN_RISC_ATUALIZADO, QT_ADICOES, CD_IMPORTADOR, PL_CARGA, '
      'VL_TOT_MLE_MNEG, '
      '   VL_TOTAL_MLE_MN, CD_TRIBUTACAO_ICMS, CD_FUND_LEGAL_ICMS, '
      'PC_ICMS, PC_REDUCAO_ICMS)'
      'values'
      '  (:NR_PROCESSO, :DT_ULTIMA_ALTERACAO, :CD_AUSENCIA_FABRIC, '
      ':CD_FORNECEDOR, '
      '   :CD_FABRICANTE, :CD_PAIS_AQUIS_MERC, :CD_PAIS_ORIG_MERC, '
      ':IN_REPASSA_DADOS_ADICAO, '
      '   :IN_RISC_ATUALIZADO, :QT_ADICOES, :CD_IMPORTADOR, :PL_CARGA, '
      ':VL_TOT_MLE_MNEG, '
      '   :VL_TOTAL_MLE_MN, :CD_TRIBUTACAO_ICMS, :CD_FUND_LEGAL_ICMS, '
      ':PC_ICMS, '
      '   :PC_REDUCAO_ICMS)')
    DeleteSQL.Strings = (
      'delete from TDECLARACAO_IMPORTACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 207
    Top = 11
  end
  object qry_DocInstrucao: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_DCTO_INSTRUCAO'
      'FROM TDOCUMENTO_INSTRUCAO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND CD_TIPO_DCTO_INSTR IN ('#39'01'#39', '#39'17'#39')'
      '')
    Left = 116
    Top = 408
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_DocInstrucaoNR_DCTO_INSTRUCAO: TStringField
      FieldName = 'NR_DCTO_INSTRUCAO'
      Origin = 'DBBROKER.TDOCUMENTO_INSTRUCAO.NR_DCTO_INSTRUCAO'
      FixedChar = True
      Size = 25
    end
  end
  object dts_DocInstrucao: TDataSource
    DataSet = qry_DocInstrucao
    Left = 31
    Top = 408
  end
  object qry_Referencias: TQuery
    DatabaseName = 'dbbroker'
    SQL.Strings = (
      'SELECT DISTINCT CD_REFERENCIA'
      'FROM TREF_CLIENTE (NOLOCK)'
      'WHERE NR_PROCESSO   = :NR_PROCESSO'
      '  AND TP_REFERENCIA = '#39'01'#39)
    Left = 584
    Top = 425
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_ReferenciasCD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_REFERENCIA'
      FixedChar = True
      Size = 0
    end
  end
  object ds_Referencias: TDataSource
    DataSet = qry_Referencias
    Left = 504
    Top = 425
  end
  object updAdicao: TUpdateSQL
    ModifySQL.Strings = (
      'update TADICAO_DE_IMPORTACAO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ADICAO = :NR_ADICAO,'
      '  QT_ITENS_ADICAO = :QT_ITENS_ADICAO,'
      '  CD_PAIS_ORIG_MERC = :CD_PAIS_ORIG_MERC'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO')
    InsertSQL.Strings = (
      'insert into TADICAO_DE_IMPORTACAO'
      '  (NR_PROCESSO, NR_ADICAO, QT_ITENS_ADICAO, CD_PAIS_ORIG_MERC)'
      'values'
      
        '  (:NR_PROCESSO, :NR_ADICAO, :QT_ITENS_ADICAO, :CD_PAIS_ORIG_MER' +
        'C)')
    DeleteSQL.Strings = (
      'delete from TADICAO_DE_IMPORTACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO')
    Left = 200
    Top = 60
  end
  object upd_ad_itens_: TUpdateSQL
    ModifySQL.Strings = (
      'update TDETALHE_MERCADORIA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ADICAO = :NR_ADICAO,'
      '  NR_ITEM = :NR_ITEM,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  CD_FABR_EXPO = :CD_FABR_EXPO,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  CD_NALADI_NCCA = :CD_NALADI_NCCA,'
      '  CD_NALADI_SH = :CD_NALADI_SH,'
      '  CD_NCM_SH = :CD_NCM_SH,'
      '  CD_PAIS_AQUISICAO = :CD_PAIS_AQUISICAO,'
      '  CD_PAIS_ORIGEM = :CD_PAIS_ORIGEM,'
      '  CD_TIPO_CALCULO_ITEM = :CD_TIPO_CALCULO_ITEM,'
      '  CD_UN_MED_COMERC = :CD_UN_MED_COMERC,'
      '  NR_FATURA = :NR_FATURA,'
      '  PC_DESCONTO_MERC = :PC_DESCONTO_MERC,'
      '  PL_MERCADORIA = :PL_MERCADORIA,'
      '  QT_MERC_UN_COMERC = :QT_MERC_UN_COMERC,'
      '  QT_MERC_UN_ESTAT = :QT_MERC_UN_ESTAT,'
      '  TX_DESC_DET_MERC = :TX_DESC_DET_MERC,'
      '  VL_DESCONTO_MERC = :VL_DESCONTO_MERC,'
      '  VL_FRETE_ITEM = :VL_FRETE_ITEM,'
      '  VL_MCV_ITEM = :VL_MCV_ITEM,'
      '  VL_MLE_ITEM = :VL_MLE_ITEM,'
      '  VL_SEGURO_ITEM = :VL_SEGURO_ITEM,'
      '  VL_UNID_COND_VENDA = :VL_UNID_COND_VENDA,'
      '  VL_UNITARIO = :VL_UNITARIO,'
      'VL_UNITARIO_FOB = :VL_UNITARIO_FOB,'
      '  NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV,'
      '  NR_PEDIDO = :NR_PEDIDO,'
      '  VL_II_ITEM = :VL_II_ITEM,'
      '  VL_IPI_ITEM = :VL_IPI_ITEM,'
      '  VL_AD_ITEM = :VL_AD_ITEM,'
      '  VL_ICMS_ITEM = :VL_ICMS_ITEM,'
      '  VL_MLE_ITEM_MN = :VL_MLE_ITEM_MN,'
      '  VL_FRETE_ITEM_MN = :VL_FRETE_ITEM_MN,'
      '  VL_SEGURO_ITEM_MN = :VL_SEGURO_ITEM_MN,'
      '  VL_MCV_ITEM_MN = :VL_MCV_ITEM_MN,'
      '  VL_UNID_COND_VENDA_MN = :VL_UNID_COND_VENDA_MN,'
      '  VL_ACRESCIMO_ITEM = :VL_ACRESCIMO_ITEM,'
      '  VL_DEDUCAO_ITEM = :VL_DEDUCAO_ITEM,'
      '  VL_ACRESCIMO_ITEM_MN = :VL_ACRESCIMO_ITEM_MN,'
      '  VL_DEDUCAO_ITEM_MN = :VL_DEDUCAO_ITEM_MN,'
      '  VL_DESPESA_ITEM = :VL_DESPESA_ITEM,'
      '  VL_DESPESA_ITEM_MN = :VL_DESPESA_ITEM_MN,'
      '  NR_ORDEM = :NR_ORDEM,'
      '  NR_ITEM_PO = :NR_ITEM_PO,'
      '  NR_PROC_PO = :NR_PROC_PO,'
      '  VL_DESPESAS_ITEM = :VL_DESPESAS_ITEM,'
      '  VL_DED_CPT_MNEG = :VL_DED_CPT_MNEG,'
      '  NR_DESTAQUE_NCM = :NR_DESTAQUE_NCM,'
      '  IN_PROVEM_PO = :IN_PROVEM_PO,'
      '  VL_TX_SCX_ITEM = :VL_TX_SCX_ITEM,'
      '  VL_PIS_ITEM = :VL_PIS_ITEM,'
      '  VL_COFINS_ITEM = :VL_COFINS_ITEM,'
      '  VL_BASE_CALC_II = :VL_BASE_CALC_II,'
      '  FRETE_COLLECT_ITEM = :FRETE_COLLECT_ITEM,'
      '  FRETE_PREPAID_ITEM = :FRETE_PREPAID_ITEM,'
      '  FRETE_TNAC_ITEM = :FRETE_TNAC_ITEM,'
      '  FRETE_COLLECT_ITEM_REAL = :FRETE_COLLECT_ITEM_REAL,'
      '  FRETE_PREPAID_ITEM_REAL = :FRETE_PREPAID_ITEM_REAL,'
      '  FRETE_TNAC_ITEM_REAL = :FRETE_TNAC_ITEM_REAL,'
      '  FRETE_COLLECT_ITEM_DOLAR = :FRETE_COLLECT_ITEM_DOLAR,'
      '  FRETE_PREPAID_ITEM_DOLAR = :FRETE_PREPAID_ITEM_DOLAR,'
      '  FRETE_TNAC_ITEM_DOLAR = :FRETE_TNAC_ITEM_DOLAR,'
      '  PB_MERCADORIA = :PB_MERCADORIA,'
      '  VL_BASE_ICMS_ITEM = :VL_BASE_ICMS_ITEM,'
      '  NR_PARCIAL = :NR_PARCIAL,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  NR_CNTR = :NR_CNTR,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  NumeroLote = :NumeroLote,'
      '  VL_IS = :VL_IS, '
      '  VL_CIDE = :VL_CIDE, '
      '  VL_DIR_COMP = :VL_DIR_COMP, '
      '  VL_MED_SAL = :VL_MED_SAL, '
      '  VL_OUTROS_TRIB = :VL_OUTROS_TRIB, '
      '  VL_IBS_MUN = :VL_IBS_MUN,'
      '  VL_IBS_UF = :VL_IBS_UF, '
      '  VL_CBS = :VL_CBS, '
      '  VL_BASE_IBS_CBS = :VL_BASE_IBS_CBS,'
      '  TX_DESC_COMPLEMENTAR = :TX_DESC_COMPLEMENTAR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    InsertSQL.Strings = (
      'insert into TDETALHE_MERCADORIA'
      
        '  (NR_PROCESSO, NR_ADICAO, NR_ITEM, CD_EXPORTADOR, CD_FABR_EXPO,' +
        ' CD_FABRICANTE, '
      
        '   CD_MERCADORIA, CD_NALADI_NCCA, CD_NALADI_SH, CD_NCM_SH, CD_PA' +
        'IS_AQUISICAO, '
      
        '   CD_PAIS_ORIGEM, CD_TIPO_CALCULO_ITEM, CD_UN_MED_COMERC, NR_FA' +
        'TURA, PC_DESCONTO_MERC, '
      
        '   PL_MERCADORIA, QT_MERC_UN_COMERC, QT_MERC_UN_ESTAT, TX_DESC_D' +
        'ET_MERC, '
      
        '   VL_DESCONTO_MERC, VL_FRETE_ITEM, VL_MCV_ITEM, VL_MLE_ITEM, VL' +
        '_SEGURO_ITEM, '
      
        '   VL_UNID_COND_VENDA, VL_UNITARIO, VL_UNITARIO_FOB, NR_OPER_TRA' +
        'T_PREV, NR_PEDIDO, VL_II_ITEM, '
      
        '   VL_IPI_ITEM, VL_AD_ITEM, VL_ICMS_ITEM, VL_MLE_ITEM_MN, VL_FRE' +
        'TE_ITEM_MN, '
      
        '   VL_SEGURO_ITEM_MN, VL_MCV_ITEM_MN, VL_UNID_COND_VENDA_MN, VL_' +
        'ACRESCIMO_ITEM, '
      
        '   VL_DEDUCAO_ITEM, VL_ACRESCIMO_ITEM_MN, VL_DEDUCAO_ITEM_MN, VL' +
        '_DESPESA_ITEM, '
      
        '   VL_DESPESA_ITEM_MN, NR_ORDEM, NR_ITEM_PO, NR_PROC_PO, VL_DESP' +
        'ESAS_ITEM, '
      
        '   VL_DED_CPT_MNEG, NR_DESTAQUE_NCM, IN_PROVEM_PO, VL_TX_SCX_ITE' +
        'M, VL_PIS_ITEM, '
      
        '   VL_COFINS_ITEM, VL_BASE_CALC_II, FRETE_COLLECT_ITEM, FRETE_PR' +
        'EPAID_ITEM, '
      
        '   FRETE_TNAC_ITEM, FRETE_COLLECT_ITEM_REAL, FRETE_PREPAID_ITEM_' +
        'REAL, FRETE_TNAC_ITEM_REAL, '
      
        '   FRETE_COLLECT_ITEM_DOLAR, FRETE_PREPAID_ITEM_DOLAR, FRETE_TNA' +
        'C_ITEM_DOLAR, '
      
        '   PB_MERCADORIA, VL_BASE_ICMS_ITEM, NR_PARCIAL, CD_EMPRESA, NR_' +
        'CNTR, ID_CLIENTE, NumeroLote,'
      '   VL_IS, VL_CIDE, VL_DIR_COMP, VL_MED_SAL, VL_OUTROS_TRIB, '
      
        '   VL_IBS_MUN,VL_IBS_UF , VL_CBS, VL_BASE_IBS_CBS, TX_DESC_COMPL' +
        'EMENTAR'
      ')'
      'values'
      
        '  (:NR_PROCESSO, :NR_ADICAO, :NR_ITEM, :CD_EXPORTADOR, :CD_FABR_' +
        'EXPO, :CD_FABRICANTE, '
      
        '   :CD_MERCADORIA, :CD_NALADI_NCCA, :CD_NALADI_SH, :CD_NCM_SH, :' +
        'CD_PAIS_AQUISICAO, '
      
        '   :CD_PAIS_ORIGEM, :CD_TIPO_CALCULO_ITEM, :CD_UN_MED_COMERC, :N' +
        'R_FATURA, '
      
        '   :PC_DESCONTO_MERC, :PL_MERCADORIA, :QT_MERC_UN_COMERC, :QT_ME' +
        'RC_UN_ESTAT, '
      
        '   :TX_DESC_DET_MERC, :VL_DESCONTO_MERC, :VL_FRETE_ITEM, :VL_MCV' +
        '_ITEM, '
      
        '   :VL_MLE_ITEM, :VL_SEGURO_ITEM, :VL_UNID_COND_VENDA, :VL_UNITA' +
        'RIO, :VL_UNITARIO_FOB, :NR_OPER_TRAT_PREV, '
      
        '   :NR_PEDIDO, :VL_II_ITEM, :VL_IPI_ITEM, :VL_AD_ITEM, :VL_ICMS_' +
        'ITEM, :VL_MLE_ITEM_MN, '
      
        '   :VL_FRETE_ITEM_MN, :VL_SEGURO_ITEM_MN, :VL_MCV_ITEM_MN, :VL_U' +
        'NID_COND_VENDA_MN, '
      
        '   :VL_ACRESCIMO_ITEM, :VL_DEDUCAO_ITEM, :VL_ACRESCIMO_ITEM_MN, ' +
        ':VL_DEDUCAO_ITEM_MN, '
      
        '   :VL_DESPESA_ITEM, :VL_DESPESA_ITEM_MN, :NR_ORDEM, :NR_ITEM_PO' +
        ', :NR_PROC_PO, '
      
        '   :VL_DESPESAS_ITEM, :VL_DED_CPT_MNEG, :NR_DESTAQUE_NCM, :IN_PR' +
        'OVEM_PO, '
      
        '   :VL_TX_SCX_ITEM, :VL_PIS_ITEM, :VL_COFINS_ITEM, :VL_BASE_CALC' +
        '_II, :FRETE_COLLECT_ITEM, '
      
        '   :FRETE_PREPAID_ITEM, :FRETE_TNAC_ITEM, :FRETE_COLLECT_ITEM_RE' +
        'AL, :FRETE_PREPAID_ITEM_REAL, '
      
        '   :FRETE_TNAC_ITEM_REAL, :FRETE_COLLECT_ITEM_DOLAR, :FRETE_PREP' +
        'AID_ITEM_DOLAR, '
      
        '   :FRETE_TNAC_ITEM_DOLAR, :PB_MERCADORIA, :VL_BASE_ICMS_ITEM, :' +
        'NR_PARCIAL, '
      '   :CD_EMPRESA, :NR_CNTR, :ID_CLIENTE,:NumeroLote,'
      
        '   :VL_IS, :VL_CIDE, :VL_DIR_COMP, :VL_MED_SAL, :VL_OUTROS_TRIB,' +
        ' '
      
        '   :VL_IBS_MUN, :VL_IBS_UF , :VL_CBS, :VL_BASE_IBS_CBS, :TX_DESC' +
        '_COMPLEMENTAR'
      ')')
    DeleteSQL.Strings = (
      'delete from TDETALHE_MERCADORIA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    Left = 200
    Top = 108
  end
  object qryIntegracaoPhilips: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP_PROCESSO  FROM INTEGRACAO_PHILIPS IP'
      
        'INNER JOIN TINSTRUCAO_DESEMBARACO ID ON ID.ID_CODIGO = IP.CD_INS' +
        'TRUCAO_DESEMBARACO'
      'WHERE'
      'ID.NR_PROCESSO = :PROCESSO AND'
      'NR_PO = :NR_PO AND'
      'NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE')
    Left = 146
    Top = 489
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ITEM_CLIENTE'
        ParamType = ptUnknown
      end>
    object qryIntegracaoPhilipsTP_PROCESSO: TStringField
      FieldName = 'TP_PROCESSO'
      Size = 4
    end
  end
  object dtsIntegracaoPhilips: TDataSource
    DataSet = qryIntegracaoPhilips
    Left = 46
    Top = 489
  end
  object qry_Itens_Copia: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TDETALHE_MERCADORIA (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY CAST(NR_ADICAO AS INTEGER), CAST(NR_ITEM AS INTEGER)')
    Left = 44
    Top = 548
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end>
    object qry_Itens_CopiaNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_Itens_CopiaNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_CopiaNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_CopiaCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_Itens_CopiaCD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      FixedChar = True
      Size = 1
    end
    object qry_Itens_CopiaCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_Itens_CopiaCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 30
    end
    object qry_Itens_CopiaCD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      FixedChar = True
      Size = 7
    end
    object qry_Itens_CopiaCD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object qry_Itens_CopiaCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qry_Itens_CopiaCD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_CopiaCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_CopiaCD_TIPO_CALCULO_ITEM: TStringField
      FieldName = 'CD_TIPO_CALCULO_ITEM'
      FixedChar = True
      Size = 1
    end
    object qry_Itens_CopiaCD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_CopiaNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 25
    end
    object qry_Itens_CopiaPC_DESCONTO_MERC: TFloatField
      FieldName = 'PC_DESCONTO_MERC'
    end
    object qry_Itens_CopiaPL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qry_Itens_CopiaQT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
    end
    object qry_Itens_CopiaQT_MERC_UN_ESTAT: TFloatField
      FieldName = 'QT_MERC_UN_ESTAT'
    end
    object qry_Itens_CopiaTX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object qry_Itens_CopiaVL_DESCONTO_MERC: TFloatField
      FieldName = 'VL_DESCONTO_MERC'
    end
    object qry_Itens_CopiaVL_FRETE_ITEM: TFloatField
      FieldName = 'VL_FRETE_ITEM'
    end
    object qry_Itens_CopiaVL_MCV_ITEM: TFloatField
      FieldName = 'VL_MCV_ITEM'
    end
    object qry_Itens_CopiaVL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
    end
    object qry_Itens_CopiaVL_SEGURO_ITEM: TFloatField
      FieldName = 'VL_SEGURO_ITEM'
    end
    object qry_Itens_CopiaVL_UNID_COND_VENDA: TFloatField
      FieldName = 'VL_UNID_COND_VENDA'
    end
    object qry_Itens_CopiaVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object qry_Itens_CopiaNR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object qry_Itens_CopiaNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      FixedChar = True
      Size = 10
    end
    object qry_Itens_CopiaVL_II_ITEM: TFloatField
      FieldName = 'VL_II_ITEM'
    end
    object qry_Itens_CopiaVL_IPI_ITEM: TFloatField
      FieldName = 'VL_IPI_ITEM'
    end
    object qry_Itens_CopiaVL_AD_ITEM: TFloatField
      FieldName = 'VL_AD_ITEM'
    end
    object qry_Itens_CopiaVL_ICMS_ITEM: TFloatField
      FieldName = 'VL_ICMS_ITEM'
    end
    object qry_Itens_CopiaVL_MLE_ITEM_MN: TFloatField
      FieldName = 'VL_MLE_ITEM_MN'
    end
    object qry_Itens_CopiaVL_FRETE_ITEM_MN: TFloatField
      FieldName = 'VL_FRETE_ITEM_MN'
    end
    object qry_Itens_CopiaVL_SEGURO_ITEM_MN: TFloatField
      FieldName = 'VL_SEGURO_ITEM_MN'
    end
    object qry_Itens_CopiaVL_MCV_ITEM_MN: TFloatField
      FieldName = 'VL_MCV_ITEM_MN'
    end
    object qry_Itens_CopiaVL_UNID_COND_VENDA_MN: TFloatField
      FieldName = 'VL_UNID_COND_VENDA_MN'
    end
    object qry_Itens_CopiaVL_ACRESCIMO_ITEM: TFloatField
      FieldName = 'VL_ACRESCIMO_ITEM'
    end
    object qry_Itens_CopiaVL_DEDUCAO_ITEM: TFloatField
      FieldName = 'VL_DEDUCAO_ITEM'
    end
    object qry_Itens_CopiaVL_ACRESCIMO_ITEM_MN: TFloatField
      FieldName = 'VL_ACRESCIMO_ITEM_MN'
    end
    object qry_Itens_CopiaVL_DEDUCAO_ITEM_MN: TFloatField
      FieldName = 'VL_DEDUCAO_ITEM_MN'
    end
    object qry_Itens_CopiaVL_DESPESA_ITEM: TFloatField
      FieldName = 'VL_DESPESA_ITEM'
    end
    object qry_Itens_CopiaVL_DESPESA_ITEM_MN: TFloatField
      FieldName = 'VL_DESPESA_ITEM_MN'
    end
    object qry_Itens_CopiaNR_ORDEM: TSmallintField
      FieldName = 'NR_ORDEM'
    end
    object qry_Itens_CopiaNR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_Itens_CopiaNR_PROC_PO: TStringField
      FieldName = 'NR_PROC_PO'
      FixedChar = True
      Size = 30
    end
    object qry_Itens_CopiaVL_DESPESAS_ITEM: TFloatField
      FieldName = 'VL_DESPESAS_ITEM'
    end
    object qry_Itens_CopiaVL_DED_CPT_MNEG: TFloatField
      FieldName = 'VL_DED_CPT_MNEG'
    end
    object qry_Itens_CopiaNR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_CopiaIN_PROVEM_PO: TBooleanField
      FieldName = 'IN_PROVEM_PO'
    end
    object qry_Itens_CopiaVL_TX_SCX_ITEM: TFloatField
      FieldName = 'VL_TX_SCX_ITEM'
    end
    object qry_Itens_CopiaVL_PIS_ITEM: TFloatField
      FieldName = 'VL_PIS_ITEM'
    end
    object qry_Itens_CopiaVL_COFINS_ITEM: TFloatField
      FieldName = 'VL_COFINS_ITEM'
    end
    object qry_Itens_CopiaVL_BASE_CALC_II: TFloatField
      FieldName = 'VL_BASE_CALC_II'
    end
    object qry_Itens_CopiaFRETE_COLLECT_ITEM: TFloatField
      FieldName = 'FRETE_COLLECT_ITEM'
    end
    object qry_Itens_CopiaFRETE_PREPAID_ITEM: TFloatField
      FieldName = 'FRETE_PREPAID_ITEM'
    end
    object qry_Itens_CopiaFRETE_TNAC_ITEM: TFloatField
      FieldName = 'FRETE_TNAC_ITEM'
    end
    object qry_Itens_CopiaFRETE_COLLECT_ITEM_REAL: TFloatField
      FieldName = 'FRETE_COLLECT_ITEM_REAL'
    end
    object qry_Itens_CopiaFRETE_PREPAID_ITEM_REAL: TFloatField
      FieldName = 'FRETE_PREPAID_ITEM_REAL'
    end
    object qry_Itens_CopiaFRETE_TNAC_ITEM_REAL: TFloatField
      FieldName = 'FRETE_TNAC_ITEM_REAL'
    end
    object qry_Itens_CopiaFRETE_COLLECT_ITEM_DOLAR: TFloatField
      FieldName = 'FRETE_COLLECT_ITEM_DOLAR'
    end
    object qry_Itens_CopiaFRETE_PREPAID_ITEM_DOLAR: TFloatField
      FieldName = 'FRETE_PREPAID_ITEM_DOLAR'
    end
    object qry_Itens_CopiaFRETE_TNAC_ITEM_DOLAR: TFloatField
      FieldName = 'FRETE_TNAC_ITEM_DOLAR'
    end
    object qry_Itens_CopiaPB_MERCADORIA: TFloatField
      FieldName = 'PB_MERCADORIA'
    end
    object qry_Itens_CopiaVL_BASE_ICMS_ITEM: TFloatField
      FieldName = 'VL_BASE_ICMS_ITEM'
    end
    object qry_Itens_CopiaNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
    end
    object qry_Itens_CopiaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_Itens_CopiaNR_DANFE: TStringField
      FieldName = 'NR_DANFE'
      FixedChar = True
      Size = 10
    end
    object qry_Itens_CopiaNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
    end
    object qry_Itens_CopiaID_CLIENTE: TStringField
      FieldName = 'ID_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_Itens_CopiaCD_CFOP: TStringField
      FieldName = 'CD_CFOP'
      FixedChar = True
      Size = 4
    end
    object qry_Itens_CopiaVL_BASE_PIS_COFINS: TFloatField
      FieldName = 'VL_BASE_PIS_COFINS'
    end
    object qry_Itens_CopiaVL_AFRMM_ITEM: TFloatField
      FieldName = 'VL_AFRMM_ITEM'
    end
    object qry_Itens_CopiaVL_UNITARIO_FOB: TFloatField
      FieldName = 'VL_UNITARIO_FOB'
    end
    object qry_Itens_CopiaNumeroLote: TStringField
      FieldName = 'NumeroLote'
      FixedChar = True
    end
  end
  object qry_NVE_Copia: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TDI_NVE (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO= :NR_ADICAO AND'
      'NR_ITEM = :NR_ITEM')
    Left = 148
    Top = 548
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptInput
      end>
  end
  object dsAtributoDuimp: TDataSource
    DataSet = qryAtributoDuimp
    Left = 319
    Top = 543
  end
  object qryAtributoDuimp: TQuery
    AfterPost = qryAtributoDuimpAfterPost
    AfterScroll = qryAtributoDuimpAfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_ad_itens
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TNCM_ATRIBUTO_DUIMP (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO= :NR_ADICAO AND'
      'NR_ITEM = :NR_ITEM')
    Left = 383
    Top = 554
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryAtributoDuimpNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TNCM_ATRIBUTO_DUIMP.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryAtributoDuimpNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'DBBROKER.TNCM_ATRIBUTO_DUIMP.NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qryAtributoDuimpNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TNCM_ATRIBUTO_DUIMP.NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryAtributoDuimpCD_ATRIBUTO: TStringField
      DisplayLabel = 'C'#243'd. Atributo'
      FieldName = 'CD_ATRIBUTO'
      Origin = 'DBBROKER.TNCM_ATRIBUTO_DUIMP.CD_ATRIBUTO'
      FixedChar = True
      Size = 14
    end
    object qryAtributoDuimpVL_ATRIBUTO: TStringField
      DisplayLabel = 'Valor Atributo'
      DisplayWidth = 600
      FieldName = 'VL_ATRIBUTO'
      OnChange = qryAtributoDuimpVL_ATRIBUTOChange
      Size = 8000
    end
  end
  object qryApagaAtributo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE TNCM_ATRIBUTO_DUIMP'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = :NR_ADICAO AND'
      'NR_ITEM = :NR_ITEM')
    Left = 258
    Top = 554
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
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end>
  end
  object updAtributoDuimp: TUpdateSQL
    ModifySQL.Strings = (
      'update TNCM_ATRIBUTO_DUIMP'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ADICAO = :NR_ADICAO,'
      '  NR_ITEM = :NR_ITEM,'
      '  CD_ATRIBUTO = :CD_ATRIBUTO,'
      '  VL_ATRIBUTO :VL_ATRIBUTO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_ATRIBUTO = :OLD_CD_ATRIBUTO')
    InsertSQL.Strings = (
      'insert into TNCM_ATRIBUTO_DUIMP'
      '   (NR_PROCESSO,'
      '    NR_ADICAO,'
      '    NR_ITEM,'
      '    CD_ATRIBUTO,'
      '    VL_ATRIBUTO)'
      'values'
      '   (:NR_PROCESSO,'
      '    :NR_ADICAO,'
      '    :NR_ITEM,'
      '    :CD_ATRIBUTO,'
      '    :VL_ATRIBUTO)')
    DeleteSQL.Strings = (
      'delete from TNCM_ATRIBUTO_DUIMP'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_ATRIBUTO = :OLD_CD_ATRIBUTO')
    Left = 443
    Top = 543
  end
  object dsAtributoDuimpCad: TDataSource
    DataSet = qryAtributoDuimpCad
    Left = 507
    Top = 554
  end
  object qryAtributoDuimpCad: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = dsAtributoDuimp
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM '
      '    AtributoDuimp (NOLOCK)'
      'WHERE '
      '    Codigo = :Codigo')
    Left = 576
    Top = 542
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    object qryAtributoDuimpCadCodigo: TStringField
      FieldName = 'Codigo'
      Origin = 'DBBROKER.AtributoDuimp.Codigo'
      FixedChar = True
      Size = 14
    end
    object qryAtributoDuimpCadAtributoCondicionante: TBooleanField
      FieldName = 'AtributoCondicionante'
      Origin = 'DBBROKER.AtributoDuimp.AtributoCondicionante'
    end
    object qryAtributoDuimpCadAtributoCondicionado: TStringField
      FieldName = 'AtributoCondicionado'
      Origin = 'DBBROKER.AtributoDuimp.AtributoCondicionado'
      FixedChar = True
      Size = 14
    end
    object qryAtributoDuimpCadNome: TStringField
      FieldName = 'Nome'
      Origin = 'DBBROKER.AtributoDuimp.Nome'
      FixedChar = True
      Size = 50
    end
    object qryAtributoDuimpCadNomeApresentacao: TStringField
      FieldName = 'NomeApresentacao'
      Origin = 'DBBROKER.AtributoDuimp.NomeApresentacao'
      FixedChar = True
      Size = 50
    end
    object qryAtributoDuimpCadModalidade: TStringField
      FieldName = 'Modalidade'
      Origin = 'DBBROKER.AtributoDuimp.Modalidade'
      FixedChar = True
      Size = 10
    end
    object qryAtributoDuimpCadDataInicioVigencia: TDateTimeField
      FieldName = 'DataInicioVigencia'
      Origin = 'DBBROKER.AtributoDuimp.DataInicioVigencia'
    end
    object qryAtributoDuimpCadDataFimVigencia: TDateTimeField
      FieldName = 'DataFimVigencia'
      Origin = 'DBBROKER.AtributoDuimp.DataFimVigencia'
    end
    object qryAtributoDuimpCadFormaPreenchimento: TStringField
      FieldName = 'FormaPreenchimento'
      Origin = 'DBBROKER.AtributoDuimp.FormaPreenchimento'
      FixedChar = True
      Size = 30
    end
    object qryAtributoDuimpCadOrientacaoPreenchimento: TStringField
      FieldName = 'OrientacaoPreenchimento'
      Origin = 'DBBROKER.AtributoDuimp.OrientacaoPreenchimento'
      FixedChar = True
      Size = 100
    end
    object qryAtributoDuimpCadTamanhoMaximo: TIntegerField
      FieldName = 'TamanhoMaximo'
      Origin = 'DBBROKER.AtributoDuimp.TamanhoMaximo'
    end
    object qryAtributoDuimpCadObrigatorio: TBooleanField
      FieldName = 'Obrigatorio'
      Origin = 'DBBROKER.AtributoDuimp.Obrigatorio'
    end
    object qryAtributoDuimpCadMultivalorado: TBooleanField
      FieldName = 'Multivalorado'
      Origin = 'DBBROKER.AtributoDuimp.Multivalorado'
    end
    object qryAtributoDuimpCadOrgaos: TStringField
      FieldName = 'Orgaos'
      Origin = 'DBBROKER.AtributoDuimp.Orgaos'
      FixedChar = True
      Size = 50
    end
    object qryAtributoDuimpCadDescricaoCondicao: TStringField
      FieldName = 'DescricaoCondicao'
      Origin = 'DBBROKER.AtributoDuimp.DescricaoCondicao'
      FixedChar = True
      Size = 50
    end
    object qryAtributoDuimpCadCondicaoOperador: TStringField
      FieldName = 'CondicaoOperador'
      Origin = 'DBBROKER.AtributoDuimp.CondicaoOperador'
      FixedChar = True
      Size = 2
    end
    object qryAtributoDuimpCadCondicaoValor: TStringField
      FieldName = 'CondicaoValor'
      Origin = 'DBBROKER.AtributoDuimp.CondicaoValor'
      FixedChar = True
      Size = 10
    end
  end
  object ds_item_acrescimos: TDataSource
    DataSet = tbl_item_acrescimos_
    Left = 272
    Top = 451
  end
  object tbl_item_acrescimos_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO;NR_ITEM'
    MasterFields = 'NR_PROCESSO;NR_ADICAO;NR_ITEM'
    MasterSource = ds_ad_itens
    TableName = 'TACRESCIMO_VALORACAO_ITEM'
    UpdateMode = upWhereChanged
    Left = 372
    Top = 451
    object tbl_item_acrescimos_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_item_acrescimos_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_item_acrescimos_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
    object tbl_item_acrescimos_CD_MET_ACRES_VALOR: TStringField
      FieldName = 'CD_MET_ACRES_VALOR'
      Size = 3
    end
    object tbl_item_acrescimos_VL_ACRESCIMO_MOEDA: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Valor na Moeda'
      FieldName = 'VL_ACRESCIMO_MOEDA'
      DisplayFormat = '#0,.00'
    end
    object tbl_item_acrescimos_CD_MD_NEGOC_ACRES: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'CD_MD_NEGOC_ACRES'
      Size = 3
    end
    object tbl_item_acrescimos_VL_ACRESCIMO_MN: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Valor em Real'
      FieldName = 'VL_ACRESCIMO_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_item_acrescimos_Look_nm_acrescimo: TStringField
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
  object tbl_tp_acres_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TAB_ACRESCIMO'
    UpdateMode = upWhereChanged
    Left = 450
    Top = 451
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
  object tbl_item_deducoes_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO;NR_ITEM'
    MasterFields = 'NR_PROCESSO;NR_ADICAO;NR_ITEM'
    MasterSource = ds_ad_itens
    TableName = 'TDEDUCAO_VALORACAO_ITEM'
    UpdateMode = upWhereKeyOnly
    Left = 367
    Top = 500
    object tbl_item_deducoes_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_item_deducoes_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object tbl_item_deducoes_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
    object tbl_item_deducoes_CD_MET_DEDUC_VALOR: TStringField
      FieldName = 'CD_MET_DEDUC_VALOR'
      Size = 3
    end
    object tbl_item_deducoes_VL_DEDUCAO_MNEG: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Valor na Moeda'
      FieldName = 'VL_DEDUCAO_MNEG'
      DisplayFormat = '#0,.00'
    end
    object tbl_item_deducoes_CD_MD_NEGOC_DEDUC: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'CD_MD_NEGOC_DEDUC'
      Size = 3
    end
    object tbl_item_deducoes_VL_DEDUCAO_MN: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Valor em Real'
      FieldName = 'VL_DEDUCAO_MN'
      DisplayFormat = '#0,.00'
    end
    object tbl_item_deducoes_Look_nm_deducao: TStringField
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
  object tbl_tp_dedu_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TAB_DEDUCAO'
    UpdateMode = upWhereChanged
    Left = 448
    Top = 500
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
  object ds_item_deducoes: TDataSource
    DataSet = tbl_item_deducoes_
    Left = 272
    Top = 500
  end
  object dsAtributosTributarios: TDataSource
    DataSet = qryAtributosTributarios
    Left = 724
    Top = 510
  end
  object qryAtributosTributarios: TQuery
    AfterPost = qry_nve_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM dbo.TDuimpAtributosTributarios'
      'WHERE NrProcesso = :NR_PROCESSO AND '
      'NrAdicao= :NR_ADICAO'
      'AND NrItem= :NR_ITEM'
      'AND AtributoValor IS NOT NULL')
    UpdateMode = upWhereKeyOnly
    Left = 800
    Top = 526
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptInput
      end>
    object qryAtributosTributariosNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.NrProcesso'
      FixedChar = True
      Size = 18
    end
    object qryAtributosTributariosNrAdicao: TStringField
      FieldName = 'NrAdicao'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.NrAdicao'
      FixedChar = True
      Size = 3
    end
    object qryAtributosTributariosTributoCodigo: TStringField
      FieldName = 'TributoCodigo'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.TributoCodigo'
      FixedChar = True
      Size = 10
    end
    object qryAtributosTributariosTributoNome: TStringField
      FieldName = 'TributoNome'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.TributoNome'
      FixedChar = True
      Size = 100
    end
    object qryAtributosTributariosRegimeCodigo: TStringField
      FieldName = 'RegimeCodigo'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.RegimeCodigo'
      FixedChar = True
      Size = 10
    end
    object qryAtributosTributariosRegimeNome: TStringField
      FieldName = 'RegimeNome'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.RegimeNome'
      FixedChar = True
      Size = 100
    end
    object qryAtributosTributariosFundamentoCodigo: TStringField
      FieldName = 'FundamentoCodigo'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.FundamentoCodigo'
      FixedChar = True
      Size = 10
    end
    object qryAtributosTributariosFundamentoNome: TStringField
      FieldName = 'FundamentoNome'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.FundamentoNome'
      FixedChar = True
      Size = 255
    end
    object qryAtributosTributariosFundamentoTipo: TStringField
      FieldName = 'FundamentoTipo'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.FundamentoTipo'
      FixedChar = True
      Size = 50
    end
    object qryAtributosTributariosAtributoCodigo: TStringField
      FieldName = 'AtributoCodigo'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.AtributoCodigo'
      FixedChar = True
      Size = 50
    end
    object qryAtributosTributariosAtributoDescricaoCodigo: TStringField
      FieldName = 'AtributoDescricaoCodigo'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.AtributoDescricaoCodigo'
      FixedChar = True
      Size = 255
    end
    object qryAtributosTributariosAtributoTipoCodigo: TStringField
      FieldName = 'AtributoTipoCodigo'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.AtributoTipoCodigo'
      FixedChar = True
      Size = 100
    end
    object qryAtributosTributariosAtributoValor: TStringField
      FieldName = 'AtributoValor'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.AtributoValor'
      FixedChar = True
      Size = 50
    end
    object qryAtributosTributariosAtributoDescricaoValor: TStringField
      FieldName = 'AtributoDescricaoValor'
      Origin = 'DBBROKER.TDuimpAtributosTributarios.AtributoDescricaoValor'
      FixedChar = True
      Size = 255
    end
  end
  object qryAtributosFundamento: TQuery
    AfterPost = qry_nve_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM dbo.TDuimpAtributosFundamento'
      'WHERE NrProcesso = :NR_PROCESSO AND '
      'NrAdicao= :NR_ADICAO'
      'AND NrItem= :NR_ITEM')
    UpdateMode = upWhereKeyOnly
    Left = 792
    Top = 478
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
        Name = 'NR_ITEM'
        ParamType = ptInput
        Size = 3
      end>
    object qryAtributosFundamentoNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Origin = 'DBBROKER.TDuimpAtributosFundamento.NrProcesso'
      FixedChar = True
      Size = 18
    end
    object qryAtributosFundamentoNrAdicao: TStringField
      FieldName = 'NrAdicao'
      Origin = 'DBBROKER.TDuimpAtributosFundamento.NrAdicao'
      FixedChar = True
      Size = 3
    end
    object qryAtributosFundamentoAtributoCodigo: TStringField
      FieldName = 'AtributoCodigo'
      Origin = 'DBBROKER.TDuimpAtributosFundamento.AtributoCodigo'
      FixedChar = True
      Size = 50
    end
    object qryAtributosFundamentoAtributoNome: TStringField
      FieldName = 'AtributoNome'
      Origin = 'DBBROKER.TDuimpAtributosFundamento.AtributoNome'
      FixedChar = True
      Size = 100
    end
    object qryAtributosFundamentoAtributoValor: TStringField
      FieldName = 'AtributoValor'
      Origin = 'DBBROKER.TDuimpAtributosFundamento.AtributoValor'
      FixedChar = True
      Size = 50
    end
    object qryAtributosFundamentoAtributoDescricaoValor: TStringField
      FieldName = 'AtributoDescricaoValor'
      Origin = 'DBBROKER.TDuimpAtributosFundamento.AtributoDescricaoValor'
      FixedChar = True
      Size = 200
    end
    object qryAtributosFundamentoFundamentoCodigo: TStringField
      FieldName = 'FundamentoCodigo'
      Origin = 'DBBROKER.TDuimpAtributosFundamento.FundamentoCodigo'
      FixedChar = True
      Size = 10
    end
  end
  object dsAtributosFundamento: TDataSource
    DataSet = qryAtributosFundamento
    Left = 708
    Top = 462
  end
  object dsLPCO: TDataSource
    DataSet = qryLPCO
    Left = 716
    Top = 558
  end
  object qryLPCO: TQuery
    AfterPost = qry_nve_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TDuimpLpco '
      'WHERE '
      'NrProcesso = :P AND'
      'NrAdicao = :A AND'
      'NrItem = :I')
    UpdateMode = upWhereKeyOnly
    Left = 792
    Top = 574
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'A'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'I'
        ParamType = ptUnknown
      end>
    object qryLPCONrProcesso: TStringField
      FieldName = 'NrProcesso'
      Origin = 'DBBROKER.TDuimpLPCO.NrProcesso'
      FixedChar = True
      Size = 18
    end
    object qryLPCONrAdicao: TStringField
      FieldName = 'NrAdicao'
      Origin = 'DBBROKER.TDuimpLPCO.NrAdicao'
      FixedChar = True
      Size = 3
    end
    object qryLPCONrItem: TStringField
      FieldName = 'NrItem'
      Origin = 'DBBROKER.TDuimpLPCO.NrItem'
      FixedChar = True
      Size = 3
    end
    object qryLPCONrLPCO: TStringField
      FieldName = 'NrLPCO'
      Origin = 'DBBROKER.TDuimpLPCO.NrLPCO'
      FixedChar = True
      Size = 11
    end
  end
end
