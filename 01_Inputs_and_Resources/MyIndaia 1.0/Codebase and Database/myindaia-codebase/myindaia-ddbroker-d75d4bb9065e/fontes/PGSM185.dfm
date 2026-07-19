object datm_mercadoria_exp: Tdatm_mercadoria_exp
  OldCreateOrder = True
  Left = 492
  Top = 172
  Height = 656
  Width = 967
  object ds_mercadoria: TDataSource
    DataSet = qry_mercadoria_
    Left = 48
    Top = 72
  end
  object ds_pais: TDataSource
    DataSet = tbl_pais_
    Left = 48
    Top = 122
  end
  object tbl_pais_: TTable
    DatabaseName = 'DBBROKER'
    ReadOnly = True
    TableName = 'TPAIS'
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 122
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
    Left = 48
    Top = 286
  end
  object ds_ncm: TDataSource
    DataSet = tbl_ncm_
    Left = 48
    Top = 178
  end
  object tbl_ncm_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TNCM'
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 178
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
  object tbl_tp_calc_item_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TIPO_CALCULO_ITEM'
    TableName = 'TTP_CALCULO_ITEM'
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 230
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
  object ds_tp_calc_item: TDataSource
    DataSet = tbl_tp_calc_item_
    Left = 48
    Top = 230
  end
  object ds_grupo_: TDataSource
    Left = 48
    Top = 342
  end
  object ds_empresa_nac: TDataSource
    DataSet = tbl_empresa_nac_
    Left = 48
    Top = 396
  end
  object tbl_empresa_nac_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_NAC'
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 396
    object tbl_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Required = True
      Size = 5
    end
    object tbl_empresa_nac_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_IN_CLIENTE: TBooleanField
      FieldName = 'IN_CLIENTE'
      Required = True
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
    object tbl_empresa_nac_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
  end
  object ds_empresa_est_: TDataSource
    DataSet = qry_empresa_est_
    Left = 48
    Top = 451
  end
  object qry_proc_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MERCADORIA'
      'FROM TMERCADORIA_EXP'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA')
    Left = 521
    Top = 286
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_proc_mercadoria_CD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 40
    end
  end
  object qry_lista_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT M.CD_MERCADORIA, M.AP_MERCADORIA, E.NM_EMPRESA,'
      '     '#9' G.NM_GRUPO, M.CD_PAIS_AQUISICAO, M.CD_PAIS_ORIGEM,'
      
        '       M.CD_EXPORTADOR, M.CD_GRUPO, M.CD_NCM_SH, NM_MARCA_CLV, N' +
        'M_DESCRICAO_CLV'
      '  FROM TMERCADORIA_EXP M'
      '  LEFT JOIN TEMPRESA_NAC E ON ( M.CD_EXPORTADOR = E.CD_EMPRESA )'
      '  LEFT JOIN TGRUPO G       ON ( M.CD_GRUPO      = G.CD_GRUPO )'
      ' WHERE 1 = 1'
      '   AND 1 = 0'
      ' ORDER BY CD_MERCADORIA'
      '')
    Left = 143
    Top = 18
    object qry_lista_look_nm_aquisicao: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_pais_aquisicao'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_AQUISICAO'
      Lookup = True
    end
    object qry_lista_look_pais_origem: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_pais_origem'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_ORIGEM'
      Lookup = True
    end
    object qry_lista_CD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      Size = 40
    end
    object qry_lista_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Size = 40
    end
    object qry_lista_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_lista_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Size = 50
    end
    object qry_lista_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Size = 3
    end
    object qry_lista_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Size = 3
    end
    object qry_lista_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Size = 5
    end
    object qry_lista_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object qry_lista_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Size = 11
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 48
    Top = 18
  end
  object qry_mercadoria_: TQuery
    AfterInsert = qry_mercadoria_AfterInsert
    AfterScroll = qry_mercadoria_AfterScroll
    OnCalcFields = qry_mercadoria_CalcFields
    OnNewRecord = qry_mercadoria_NewRecord
    DatabaseName = 'DBBROKER'
    DataSource = ds_lista
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_MERCADORIA, AP_MERCADORIA, CD_MATERIAL, CD_UN_MED_COME' +
        'RC, CD_COR, CD_NCM_SH, CD_SULF_NCM, CD_NALADI_SH, CD_NALADI_NCCA' +
        ', CD_TIPO_CALCULO,'
      
        '       NR_LINHA, CD_GRUPO, VL_UNITARIO, CD_UF_PRODUTOR, CD_EXPOR' +
        'TADOR, PL_MERCADORIA, PB_MERCADORIA, CD_IMPORTADOR, CD_PAIS_AQUI' +
        'SICAO, CD_FABRICANTE,'
      
        '       CD_PAIS_ORIGEM, CD_AREA, CD_FINALIDADE_MERC, CD_CATEGORIA' +
        '_TEXTIL,IN_NECESSITA_LI, CD_FAMILIA_PROD, CD_FABR_EXPO, CD_MOEDA' +
        ', CD_EMBALAGEM, QT_POR_EMBALAGEM, NM_MERCADORIA,'
      
        '       CD_USUARIO_CRIACAO, DT_CRIACAO, CD_USUARIO_ULT_ALTERACAO,' +
        ' DT_ULT_ALTERACAO, IN_ATIVO, CD_IMPORTACAO, IN_IMPORTADO, TX_DES' +
        'C_INGLES, TX_DESC_ESP, NM_PROCEDENCIA_ING, NM_PROCEDENCIA_ESP,'
      
        '       NR_DECLARACAO_ORIGEM,NORMA_ORIGEM,DATA_NORMA_ORIGEM, CD_D' +
        'ESC_MERCADORIA_DRAFT, NM_MARCA_CLV, NM_DESCRICAO_CLV'
      'FROM TMERCADORIA_EXP M'
      'WHERE  CD_MERCADORIA = :CD_MERCADORIA'
      '')
    Left = 145
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
        Size = 41
      end>
    object qry_mercadoria_CD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA_EXP.CD_MERCADORIA'
      Size = 40
    end
    object qry_mercadoria_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Origin = 'TMERCADORIA_EXP.AP_MERCADORIA'
      Size = 40
    end
    object qry_mercadoria_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'TMERCADORIA_EXP.CD_UN_MED_COMERC'
      Size = 3
    end
    object qry_mercadoria_CD_COR: TStringField
      FieldName = 'CD_COR'
      Origin = 'TMERCADORIA_EXP.CD_COR'
      Size = 10
    end
    object qry_mercadoria_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TMERCADORIA_EXP.CD_NCM_SH'
      EditMask = '9999.99.99;0;_'
      Size = 11
    end
    object qry_mercadoria_CD_SULF_NCM: TStringField
      FieldName = 'CD_SULF_NCM'
      Origin = 'DBBROKER.TMERCADORIA_EXP.CD_SULF_NCM'
      FixedChar = True
      Size = 2
    end
    object qry_mercadoria_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TMERCADORIA_EXP.CD_NALADI_SH'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_mercadoria_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'TMERCADORIA_EXP.CD_NALADI_NCCA'
      EditMask = '9999.99.9;0;_'
      Size = 7
    end
    object qry_mercadoria_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TMERCADORIA_EXP.CD_TIPO_CALCULO'
      Size = 1
    end
    object qry_mercadoria_NR_LINHA: TStringField
      FieldName = 'NR_LINHA'
      Origin = 'TMERCADORIA_EXP.NR_LINHA'
      Size = 10
    end
    object qry_mercadoria_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TMERCADORIA_EXP.CD_GRUPO'
      Size = 3
    end
    object qry_mercadoria_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TMERCADORIA_EXP.VL_UNITARIO'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_mercadoria_CD_UF_PRODUTOR: TStringField
      FieldName = 'CD_UF_PRODUTOR'
      Origin = 'TMERCADORIA_EXP.CD_UF_PRODUTOR'
      Size = 2
    end
    object qry_mercadoria_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TMERCADORIA_EXP.CD_EXPORTADOR'
      Size = 5
    end
    object qry_mercadoria_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TMERCADORIA_EXP.PL_MERCADORIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_mercadoria_PB_MERCADORIA: TFloatField
      FieldName = 'PB_MERCADORIA'
      Origin = 'TMERCADORIA_EXP.PB_MERCADORIA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_mercadoria_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TMERCADORIA_EXP.CD_IMPORTADOR'
      Size = 5
    end
    object qry_mercadoria_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TMERCADORIA_EXP.CD_PAIS_AQUISICAO'
      Size = 3
    end
    object qry_mercadoria_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TMERCADORIA_EXP.CD_FABRICANTE'
      Size = 5
    end
    object qry_mercadoria_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TMERCADORIA_EXP.CD_PAIS_ORIGEM'
      Size = 3
    end
    object qry_mercadoria_CD_FINALIDADE_MERC: TStringField
      FieldName = 'CD_FINALIDADE_MERC'
      Origin = 'TMERCADORIA_EXP.CD_FINALIDADE_MERC'
      Size = 3
    end
    object qry_mercadoria_CD_CATEGORIA_TEXTIL: TStringField
      FieldName = 'CD_CATEGORIA_TEXTIL'
      Origin = 'TMERCADORIA_EXP.CD_CATEGORIA_TEXTIL'
      Size = 4
    end
    object qry_mercadoria_IN_NECESSITA_LI: TBooleanField
      FieldName = 'IN_NECESSITA_LI'
      Origin = 'TMERCADORIA_EXP.IN_NECESSITA_LI'
    end
    object qry_mercadoria_CD_FAMILIA_PROD: TStringField
      FieldName = 'CD_FAMILIA_PROD'
      Origin = 'TMERCADORIA_EXP.CD_FAMILIA_PROD'
      Size = 8
    end
    object qry_mercadoria_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TMERCADORIA_EXP.CD_FABR_EXPO'
      Size = 1
    end
    object qry_mercadoria_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TMERCADORIA_EXP.CD_MOEDA'
      Size = 3
    end
    object qry_mercadoria_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TMERCADORIA_EXP.CD_EMBALAGEM'
      Size = 4
    end
    object qry_mercadoria_QT_POR_EMBALAGEM: TFloatField
      FieldName = 'QT_POR_EMBALAGEM'
      Origin = 'TMERCADORIA_EXP.QT_POR_EMBALAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_mercadoria_NM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      Origin = 'TMERCADORIA_EXP.NM_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_mercadoria_look_pais_aquisicao: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_pais_aquisicao'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_AQUISICAO'
      Lookup = True
    end
    object qry_mercadoria_look_pais_origem: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_pais_origem'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_ORIGEM'
      Lookup = True
    end
    object qry_mercadoria_look_med_comerc: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_med_comerc'
      LookupDataSet = qry_unid_medida_
      LookupKeyFields = 'CD_UNID_MEDIDA'
      LookupResultField = 'NM_UNID_MEDIDA'
      KeyFields = 'CD_UN_MED_COMERC'
      Lookup = True
    end
    object qry_mercadoria_LookNCM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNCM'
      LookupDataSet = tbl_ncm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_NCM_SH'
      Size = 120
      Lookup = True
    end
    object qry_mercadoria_LookFamiliaProd: TStringField
      DisplayLabel = 'Fam'#237'lia'
      FieldKind = fkLookup
      FieldName = 'LookFamiliaProd'
      LookupDataSet = qry_familia_prod_
      LookupKeyFields = 'CD_FAMILIA_PROD'
      LookupResultField = 'NM_FAMILIA_PROD'
      KeyFields = 'CD_FAMILIA_PROD'
      Size = 40
      Lookup = True
    end
    object qry_mercadoria_LookMoeda: TStringField
      DisplayLabel = 'Moeda'
      FieldKind = fkLookup
      FieldName = 'LookMoeda'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA'
      Size = 30
      Lookup = True
    end
    object qry_mercadoria_LookEmbalagem: TStringField
      DisplayLabel = 'Embalagem'
      FieldKind = fkLookup
      FieldName = 'LookEmbalagem'
      LookupDataSet = qry_embalagem_
      LookupKeyFields = 'CD_EMBALAGEM'
      LookupResultField = 'NM_EMBALAGEM_S'
      KeyFields = 'CD_EMBALAGEM'
      Lookup = True
    end
    object qry_mercadoria_LookFinalidadeMerc: TStringField
      DisplayLabel = 'Finalidade da Mercadoria'
      FieldKind = fkLookup
      FieldName = 'LookfinalidadeMerc'
      LookupDataSet = qry_finalidade_merc_
      LookupKeyFields = 'CD_FINALIDADE_MERC'
      LookupResultField = 'NM_FINALIDADE_MERC'
      KeyFields = 'CD_FINALIDADE_MERC'
      Size = 30
      Lookup = True
    end
    object qry_mercadoria_LookUFProdutor: TStringField
      DisplayLabel = 'UF do Produtor'
      FieldKind = fkLookup
      FieldName = 'LookUFProdutor'
      LookupDataSet = qry_uf_
      LookupKeyFields = 'CD_UF'
      LookupResultField = 'NM_UF'
      KeyFields = 'CD_UF_PRODUTOR'
      Size = 30
      Lookup = True
    end
    object qry_mercadoria_LookFabricante: TStringField
      DisplayLabel = 'Fabricante'
      FieldKind = fkLookup
      FieldName = 'LookFabricante'
      LookupDataSet = tbl_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FABRICANTE'
      Size = 60
      Lookup = True
    end
    object qry_mercadoria_look_nm_grupo: TStringField
      DisplayLabel = 'Grupo'
      FieldKind = fkLookup
      FieldName = 'look_nm_grupo'
      LookupDataSet = qry_grupo_
      LookupKeyFields = 'CD_GRUPO'
      LookupResultField = 'NM_GRUPO'
      KeyFields = 'CD_GRUPO'
      Size = 50
      Lookup = True
    end
    object qry_mercadoria_LookExportador: TStringField
      FieldKind = fkLookup
      FieldName = 'LookExportador'
      LookupDataSet = tbl_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_mercadoria_Look_nm_Importador: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_Importador'
      LookupDataSet = qry_empresa_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_mercadoria_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TMERCADORIA_EXP.CD_MERCADORIA'
      EditMask = '!99;0; '
      Size = 2
    end
    object qry_mercadoria_LookArea: TStringField
      FieldKind = fkLookup
      FieldName = 'LookArea'
      LookupDataSet = qry_area_
      LookupKeyFields = 'CD_AREA'
      LookupResultField = 'NM_AREA'
      KeyFields = 'CD_AREA'
      Size = 10
      Lookup = True
    end
    object qry_mercadoria_CD_MATERIAL: TStringField
      DisplayWidth = 15
      FieldName = 'CD_MATERIAL'
      Origin = 'DBBROKER.TMERCADORIA_EXP.CD_MATERIAL'
      FixedChar = True
      Size = 15
    end
    object qry_mercadoria_CD_USUARIO_CRIACAO: TStringField
      FieldName = 'CD_USUARIO_CRIACAO'
      Origin = 'DBBROKER.TMERCADORIA_EXP.CD_USUARIO_CRIACAO'
      FixedChar = True
      Size = 4
    end
    object qry_mercadoria_DT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
      Origin = 'DBBROKER.TMERCADORIA_EXP.DT_CRIACAO'
      EditMask = '99/99/9999;1;_'
    end
    object qry_mercadoria_CD_USUARIO_ULT_ALTERACAO: TStringField
      FieldName = 'CD_USUARIO_ULT_ALTERACAO'
      Origin = 'DBBROKER.TMERCADORIA_EXP.CD_USUARIO_ULT_ALTERACAO'
      FixedChar = True
      Size = 4
    end
    object qry_mercadoria_DT_ULT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ULT_ALTERACAO'
      Origin = 'DBBROKER.TMERCADORIA_EXP.DT_ULT_ALTERACAO'
      EditMask = '99/99/9999;1;_'
    end
    object qry_mercadoria_calcNmCriador: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNmCriador'
      Size = 255
      Calculated = True
    end
    object qry_mercadoria_calcNmAlterador: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNmAlterador'
      Size = 255
      Calculated = True
    end
    object qry_mercadoria_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TMERCADORIA_EXP.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_CD_IMPORTACAO: TStringField
      FieldName = 'CD_IMPORTACAO'
      Origin = 'DBBROKER.TMERCADORIA_EXP.CD_IMPORTACAO'
      FixedChar = True
    end
    object qry_mercadoria_IN_IMPORTADO: TStringField
      FieldName = 'IN_IMPORTADO'
      Origin = 'DBBROKER.TMERCADORIA_EXP.IN_IMPORTADO'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_TX_DESC_INGLES: TMemoField
      FieldName = 'TX_DESC_INGLES'
      Origin = 'DBBROKER.TMERCADORIA_EXP.TX_DESC_INGLES'
      BlobType = ftMemo
    end
    object qry_mercadoria_TX_DESC_ESP: TMemoField
      FieldName = 'TX_DESC_ESP'
      Origin = 'DBBROKER.TMERCADORIA_EXP.TX_DESC_ESP'
      BlobType = ftMemo
    end
    object qry_mercadoria_NM_PROCEDENCIA_ING: TMemoField
      FieldName = 'NM_PROCEDENCIA_ING'
      Origin = 'DBBROKER.TMERCADORIA_EXP.NM_PROCEDENCIA_ING'
      BlobType = ftMemo
    end
    object qry_mercadoria_NM_PROCEDENCIA_ESP: TMemoField
      FieldName = 'NM_PROCEDENCIA_ESP'
      Origin = 'DBBROKER.TMERCADORIA_EXP.NM_PROCEDENCIA_ESP'
      BlobType = ftMemo
    end
    object qry_mercadoria_NR_DECLARACAO_ORIGEM: TStringField
      FieldName = 'NR_DECLARACAO_ORIGEM'
      Size = 15
    end
    object qry_mercadoria_NORMA_ORIGEM: TStringField
      DisplayLabel = 'Norma Origem'
      DisplayWidth = 10
      FieldName = 'NORMA_ORIGEM'
      Size = 255
    end
    object qry_mercadoria_DATA_NORMA_ORIGEM: TDateTimeField
      DisplayLabel = 'Data Norma Origem'
      FieldName = 'DATA_NORMA_ORIGEM'
      EditMask = '!99/99/9900;1;_'
    end
    object qry_mercadoria_CD_DESC_MERCADORIA_DRAFT: TIntegerField
      FieldName = 'CD_DESC_MERCADORIA_DRAFT'
      Origin = 'DBBROKER.TMERCADORIA_EXP.CD_DESC_MERCADORIA_DRAFT'
    end
    object qry_mercadoria_LookDescricaoMercDraft: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDescricaoMercDraft'
      LookupDataSet = qry_desc_merc_draft
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NM_DESCRICAO'
      KeyFields = 'CD_DESC_MERCADORIA_DRAFT'
      Size = 200
      Lookup = True
    end
    object qry_mercadoria_LookDescMercDraft_Portugues: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDescMercDraft_Portugues'
      LookupDataSet = qry_desc_merc_draft
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TX_DESCRICAO_PORTUGUES'
      KeyFields = 'CD_DESC_MERCADORIA_DRAFT'
      Size = 250
      Lookup = True
    end
    object qry_mercadoria_LookDescMercDraft_Espanhol: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDescMercDraft_Espanhol'
      LookupDataSet = qry_desc_merc_draft
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TX_DESCRICAO_ESPANHOL'
      KeyFields = 'CD_DESC_MERCADORIA_DRAFT'
      Size = 250
      Lookup = True
    end
    object qry_mercadoria_LookDescMercDraft_Ingles: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDescMercDraft_Ingles'
      LookupDataSet = qry_desc_merc_draft
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TX_DESCRICAO_INGLES'
      KeyFields = 'CD_DESC_MERCADORIA_DRAFT'
      Size = 250
      Lookup = True
    end
    object qry_mercadoria_NM_MARCA_CLV: TStringField
      FieldName = 'NM_MARCA_CLV'
      Origin = 'DBBROKER.TMERCADORIA_EXP.NM_MARCA_CLV'
      FixedChar = True
      Size = 255
    end
    object qry_mercadoria_NM_DESCRICAO_CLV: TMemoField
      FieldName = 'NM_DESCRICAO_CLV'
      Origin = 'DBBROKER.TMERCADORIA_EXP.NM_DESCRICAO_CLV'
      BlobType = ftMemo
    end
  end
  object qry_unid_medida_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  * FROM TUNID_MEDIDA_BROKER')
    Left = 143
    Top = 286
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
  object ds_familia_prod: TDataSource
    DataSet = qry_familia_prod_
    Left = 275
    Top = 122
  end
  object qry_familia_prod_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  CD_FAMILIA_PROD, NM_FAMILIA_PROD'
      'FROM TFAMILIA_PROD'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 379
    Top = 122
    object qry_familia_prod_CD_FAMILIA_PROD: TStringField
      FieldName = 'CD_FAMILIA_PROD'
      Origin = 'TFAMILIA_PROD.CD_FAMILIA_PROD'
      Size = 8
    end
    object qry_familia_prod_NM_FAMILIA_PROD: TStringField
      FieldName = 'NM_FAMILIA_PROD'
      Origin = 'TFAMILIA_PROD.NM_FAMILIA_PROD'
      Size = 40
    end
  end
  object ds_moeda: TDataSource
    DataSet = qry_moeda_
    Left = 275
    Top = 178
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  CD_MOEDA, NM_MOEDA'
      'FROM TMOEDA_BROKER'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 379
    Top = 177
    object qry_moeda_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TMOEDA_BROKER.CD_MOEDA'
      Size = 3
    end
    object qry_moeda_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'TMOEDA_BROKER.NM_MOEDA'
      Size = 30
    end
  end
  object ds_embalagem: TDataSource
    DataSet = qry_embalagem_
    Left = 275
    Top = 230
  end
  object qry_embalagem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMBALAGEM, NM_EMBALAGEM_S'
      'FROM TEMBALAGEM'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 379
    Top = 230
    object qry_embalagem_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_embalagem_NM_EMBALAGEM_S: TStringField
      FieldName = 'NM_EMBALAGEM_S'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 50
    end
  end
  object ds_finalidade_merc: TDataSource
    DataSet = qry_finalidade_merc_
    Left = 275
    Top = 286
  end
  object qry_finalidade_merc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FINALIDADE_MERC, NM_FINALIDADE_MERC'
      'FROM TFINALIDADE_MERC'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 379
    Top = 286
    object qry_finalidade_merc_CD_FINALIDADE_MERC: TStringField
      FieldName = 'CD_FINALIDADE_MERC'
      Origin = 'TFINALIDADE_MERC.CD_FINALIDADE_MERC'
      Size = 3
    end
    object qry_finalidade_merc_NM_FINALIDADE_MERC: TStringField
      FieldName = 'NM_FINALIDADE_MERC'
      Origin = 'TFINALIDADE_MERC.NM_FINALIDADE_MERC'
      Size = 30
    end
  end
  object ds_uf: TDataSource
    DataSet = qry_uf_
    Left = 275
    Top = 342
  end
  object qry_uf_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UF, NM_UF'
      'FROM TUF')
    Left = 379
    Top = 342
    object qry_uf_CD_UF: TStringField
      FieldName = 'CD_UF'
      Origin = 'TUF.CD_UF'
      Size = 2
    end
    object qry_uf_NM_UF: TStringField
      FieldName = 'NM_UF'
      Origin = 'TUF.NM_UF'
      Size = 30
    end
  end
  object qry_empresa_est_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_EST')
    Left = 143
    Top = 451
    object qry_empresa_est_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_est_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 60
    end
  end
  object ds_acordo: TDataSource
    DataSet = qry_acordo_
    Left = 275
    Top = 18
  end
  object qry_acordo_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, NOME, IN_ATIVO, FIESP_ID'
      'FROM TACORDO '
      'WHERE IN_ATIVO='#39'1'#39
      'ORDER BY CODIGO')
    Left = 379
    Top = 18
    object qry_acordo_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TACORDO.CODIGO'
      Size = 10
    end
    object qry_acordo_NOME: TStringField
      FieldName = 'NOME'
      Origin = 'TACORDO.NOME'
      Size = 50
    end
    object qry_acordo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TACORDO.IN_ATIVO'
      Size = 1
    end
    object qry_acordo_FIESP_ID: TIntegerField
      FieldName = 'FIESP_ID'
    end
  end
  object ds_normas: TDataSource
    DataSet = qry_normas_
    Left = 275
    Top = 72
  end
  object qry_normas_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      ' SELECT CODIGO, NOME, NM_DESCRICAO, IN_ATIVO'
      ' FROM TNORMAS'
      ' WHERE IN_ATIVO='#39'1'#39)
    Left = 379
    Top = 72
    object qry_normas_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNORMAS.CODIGO'
      Size = 10
    end
    object qry_normas_NOME: TStringField
      FieldName = 'NOME'
      Origin = 'TNORMAS.NOME'
      Size = 50
    end
    object qry_normas_NM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      Origin = 'TNORMAS.NM_DESCRICAO'
      Size = 200
    end
    object qry_normas_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TNORMAS.IN_ATIVO'
      Size = 1
    end
  end
  object qry_merc_acordo_: TQuery
    BeforeInsert = qry_merc_acordo_BeforeInsert
    BeforeEdit = qry_merc_acordo_BeforeEdit
    OnCalcFields = qry_merc_acordo_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_mercadoria
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TMERC_EXP_ACORDO'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA')
    Left = 625
    Top = 18
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_merc_acordo_CD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERC_EXP_ACORDO.CD_MERCADORIA'
      Size = 40
    end
    object qry_merc_acordo_CD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'TMERC_EXP_ACORDO.CD_ACORDO'
      Size = 10
    end
    object qry_merc_acordo_CD_NORMA: TStringField
      FieldName = 'CD_NORMA'
      Origin = 'TMERC_EXP_ACORDO.CD_NORMA'
      Size = 10
    end
    object qry_merc_acordo_CD_NCM_DOC: TStringField
      FieldName = 'CD_NCM_DOC'
      Origin = 'TMERC_EXP_ACORDO.CD_NCM_DOC'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_merc_acordo_CD_NALADI_SH_DOC: TStringField
      FieldName = 'CD_NALADI_SH_DOC'
      Origin = 'TMERC_EXP_ACORDO.CD_NALADI_SH_DOC'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_merc_acordo_CD_NALADI_NCCA_DOC: TStringField
      FieldName = 'CD_NALADI_NCCA_DOC'
      Origin = 'TMERC_EXP_ACORDO.CD_NALADI_NCCA_DOC'
      EditMask = '9999.99.9;0;_'
      Size = 7
    end
    object qry_merc_acordo_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TMERC_EXP_ACORDO.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_merc_acordo_LookAcordo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAcordo'
      LookupDataSet = qry_acordo_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'CD_ACORDO'
      Size = 60
      Lookup = True
    end
    object qry_merc_acordo_LookNormas: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNormas'
      LookupDataSet = qry_normas_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NM_DESCRICAO'
      KeyFields = 'CD_NORMA'
      Size = 220
      Lookup = True
    end
    object qry_merc_acordo_NR_SEQ_NCM: TIntegerField
      FieldName = 'NR_SEQ_NCM'
      Origin = 'TMERC_EXP_ACORDO.CD_MERCADORIA'
    end
    object qry_merc_acordo_NR_SEQ_NALADI: TIntegerField
      FieldName = 'NR_SEQ_NALADI'
      Origin = 'TMERC_EXP_ACORDO.CD_ACORDO'
    end
    object qry_merc_acordo_LookNaladiSHDoc: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookNaladiSHDoc'
      Size = 200
      Calculated = True
    end
    object qry_merc_acordo_LookNcmDoc: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNcmDoc'
      LookupDataSet = qry_ncm_doc_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_NCM_DOC'
      Size = 200
      Lookup = True
    end
  end
  object ds_merc_acordo: TDataSource
    DataSet = qry_merc_acordo_
    Left = 521
    Top = 18
  end
  object ds_acordo_norma: TDataSource
    DataSet = qry_acordo_norma_
    Left = 521
    Top = 72
  end
  object qry_ncm_doc_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO, NR_SEQ'
      'FROM   TNCM_EXP'
      'WHERE CODIGO = :CODIGO AND'
      'NR_SEQ = :NR_SEQ'
      '')
    Left = 379
    Top = 396
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NR_SEQ'
        ParamType = ptUnknown
      end>
    object qry_ncm_doc_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNCM_EXP.CODIGO'
      Size = 8
    end
    object qry_ncm_doc_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TNCM_EXP.CODIGO'
      Size = 255
    end
  end
  object ds_ncm_doc: TDataSource
    DataSet = qry_ncm_doc_
    Left = 275
    Top = 396
  end
  object qry_naladish_doc_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO, NR_SEQ'
      'FROM   TNALADISH_EXP'
      'WHERE CODIGO = :CODIGO AND'
      'NR_SEQ = :NR_SEQ'
      '')
    Left = 379
    Top = 451
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NR_SEQ'
        ParamType = ptUnknown
      end>
    object qry_naladish_doc_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNALADISH_EXP.CODIGO'
      Size = 8
    end
    object qry_naladish_doc_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TNALADISH_EXP.DESCRICAO'
      Size = 200
    end
  end
  object ds_naladish_doc: TDataSource
    DataSet = qry_naladish_doc_
    Left = 275
    Top = 451
  end
  object qry_naladincca_doc_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TNALADINCCA_EXP'
      'WHERE CODIGO = :CODIGO')
    Left = 625
    Top = 122
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_naladincca_doc_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNALADINCCA_EXP.CODIGO'
      Size = 7
    end
    object qry_naladincca_doc_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TNALADINCCA_EXP.DESCRICAO'
      Size = 120
    end
  end
  object ds_naladincca_doc: TDataSource
    DataSet = qry_naladincca_doc_
    Left = 521
    Top = 122
  end
  object qry_apaga_acordo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE '
      'FROM TMERC_EXP_ACORDO'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA')
    Left = 521
    Top = 230
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
  end
  object sp_mercadoria_exp_: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_mercadoria_exp'
    Left = 521
    Top = 396
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_exportador'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
        Value = 1
      end>
  end
  object qry_limpa_aux_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TAUX_MERCADORIA_EXP'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Left = 625
    Top = 342
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
  end
  object qry_acordo_norma_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.CD_ACORDO, A.CD_NORMA, N.NM_DESCRICAO'
      'FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO  A'
      'LEFT JOIN TNORMAS N ON N.CODIGO = A.CD_NORMA'
      'WHERE A.CD_ACORDO = :CD_ACORDO AND A.CD_NORMA = :CD_NORMA'
      'ORDER BY'
      'A.CD_NORMA'
      '')
    Left = 625
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACORDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_NORMA'
        ParamType = ptUnknown
      end>
    object qry_acordo_norma_CD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'TACORDO_NORMA.CD_ACORDO'
      Size = 10
    end
    object qry_acordo_norma_CD_NORMA: TStringField
      FieldName = 'CD_NORMA'
      Origin = 'TACORDO_NORMA.CD_NORMA'
      Size = 10
    end
    object qry_acordo_norma_NM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      Origin = 'TNORMAS.NM_DESCRICAO'
      Size = 200
    end
  end
  object qry_pais_broker_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PAIS, NM_PAIS'
      'FROM TPAIS_BROKER')
    Left = 521
    Top = 342
    object qry_pais_broker_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TPAIS_BROKER.CD_PAIS'
      Size = 3
    end
    object qry_pais_broker_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Origin = 'TPAIS_BROKER.NM_PAIS'
      Size = 120
    end
  end
  object qry_area_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TAREA'
      'WHERE CD_AREA <> '#39#39
      'ORDER BY'
      'CD_AREA')
    Left = 625
    Top = 230
    object qry_area_CD_AREA: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_AREA'
      Origin = 'TAREA.CD_AREA'
      Size = 2
    end
    object qry_area_NM_AREA: TStringField
      DisplayLabel = #193'rea'
      FieldName = 'NM_AREA'
      Origin = 'TAREA.NM_AREA'
      Size = 50
    end
  end
  object qry_mat_pri_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT M.CD_MERCADORIA, M.AP_MERCADORIA, U.NM_SIGLA, M.CD_NCM_SH'
      'FROM   TMERCADORIA M, TUNID_MEDIDA_BROKER U'
      'WHERE  M.CD_UN_MED_COMERC *= U.CD_UNID_MEDIDA AND'
      '       CD_MERCADORIA = :CD_MERCADORIA')
    Left = 625
    Top = 286
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO FROM TGRUPO')
    Left = 145
    Top = 338
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TGRUPO.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'DBBROKER.TGRUPO.NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
  object ds_Mercadoria_Marcacao: TDataSource
    DataSet = qry_Mercadoria_Marcacao
    Left = 516
    Top = 457
  end
  object qry_Mercadoria_Marcacao: TQuery
    OnCalcFields = qry_Mercadoria_MarcacaoCalcFields
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TMERCADORIA_EXP_MARCACAO (NOLOCK)'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA'
      '')
    Left = 620
    Top = 457
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptInput
        Size = 40
      end>
    object qry_Mercadoria_MarcacaoCD_MERC_MARCACAO: TAutoIncField
      FieldName = 'CD_MERC_MARCACAO'
      Origin = 'DBBROKER.TMERCADORIA_EXP_MARCACAO.CD_MERC_MARCACAO'
      ReadOnly = True
    end
    object qry_Mercadoria_MarcacaoCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TMERCADORIA_EXP_MARCACAO.CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qry_Mercadoria_MarcacaoCD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      Origin = 'DBBROKER.TMERCADORIA_EXP_MARCACAO.CD_PAIS_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_Mercadoria_MarcacaoDS_MARCACAO: TStringField
      FieldName = 'DS_MARCACAO'
      Origin = 'DBBROKER.TMERCADORIA_EXP_MARCACAO.DS_MARCACAO'
      FixedChar = True
      Size = 100
    end
    object qry_Mercadoria_MarcacaoCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'DBBROKER.TMERCADORIA_EXP_MARCACAO.CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_Mercadoria_MarcacaoCALC_NM_PAIS_DESTINO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NM_PAIS_DESTINO'
      Size = 60
      Calculated = True
    end
  end
  object qryFederacao: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM FEDERACAO')
    Left = 764
    Top = 8
    object qryFederacaoID: TAutoIncField
      FieldName = 'ID'
      Origin = 'DBBROKER.FEDERACAO.ID'
    end
    object qryFederacaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'DBBROKER.FEDERACAO.NOME'
      FixedChar = True
      Size = 50
    end
  end
  object dsFederacao: TDataSource
    DataSet = qryFederacao
    Left = 760
    Top = 52
  end
  object qryMERCADORIA_EXP_ACP_: TQuery
    CachedUpdates = True
    OnUpdateError = QryMERCADORIA_EXP_DO_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TMERCADORIA_EXP_ACP'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA')
    UpdateObject = MERCADORIA_EXP_ACP
    Left = 764
    Top = 100
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptInput
        Value = '0'
      end>
    object qryMERCADORIA_EXP_ACP_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TMERCADORIA_EXP_ACP.CD_MERCADORIA'
      Visible = False
      FixedChar = True
      Size = 40
    end
    object qryMERCADORIA_EXP_ACP_CD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'DBBROKER.TMERCADORIA_EXP_ACP.CD_ACORDO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryMERCADORIA_EXP_ACP_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TMERCADORIA_EXP_ACP.CD_PAIS'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryMERCADORIA_EXP_ACP_Pais: TStringField
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'Pais'
      LookupDataSet = qry_pais_broker_
      LookupKeyFields = 'CD_PAIS'
      LookupResultField = 'NM_PAIS'
      KeyFields = 'CD_PAIS'
      Size = 30
      Lookup = True
    end
    object qryMERCADORIA_EXP_ACP_Acordo: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Acordo'
      LookupDataSet = qry_acordo_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'CD_ACORDO'
      Size = 50
      Lookup = True
    end
  end
  object dsMERCADORIA_EXP_ACP: TDataSource
    AutoEdit = False
    DataSet = qryMERCADORIA_EXP_ACP_
    Left = 764
    Top = 144
  end
  object MERCADORIA_EXP_ACP: TUpdateSQL
    ModifySQL.Strings = (
      'update TMERCADORIA_EXP_ACP'
      'set'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  CD_ACORDO = :CD_ACORDO,'
      '  CD_PAIS = :CD_PAIS'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  CD_ACORDO = :OLD_CD_ACORDO and'
      '  CD_PAIS = :OLD_CD_PAIS')
    InsertSQL.Strings = (
      'insert into TMERCADORIA_EXP_ACP'
      '  (CD_MERCADORIA, CD_ACORDO, CD_PAIS)'
      'values'
      '  (:CD_MERCADORIA, :CD_ACORDO, :CD_PAIS)')
    DeleteSQL.Strings = (
      'delete from TMERCADORIA_EXP_ACP'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  CD_ACORDO = :OLD_CD_ACORDO and'
      '  CD_PAIS = :OLD_CD_PAIS')
    Left = 768
    Top = 196
  end
  object dsDeclaracaoOrigem: TDataSource
    DataSet = qryDeclaracaoOrigem
    Left = 772
    Top = 260
  end
  object qryDeclaracaoOrigem: TQuery
    OnCalcFields = qryDeclaracaoOrigemCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM DECLARACAO_ORIGEM')
    Left = 772
    Top = 308
    object qryDeclaracaoOrigemID: TAutoIncField
      FieldName = 'ID'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM.ID'
      Visible = False
    end
    object qryDeclaracaoOrigemNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM.NUMERO'
      FixedChar = True
    end
    object qryDeclaracaoOrigemFEDERACAO_ID: TIntegerField
      FieldName = 'FEDERACAO_ID'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM.FEDERACAO_ID'
      Visible = False
    end
    object qryDeclaracaoOrigemVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM.VENCIMENTO'
      Visible = False
    end
    object qryDeclaracaoOrigemFederacao: TStringField
      FieldKind = fkLookup
      FieldName = 'Federacao'
      LookupDataSet = qryFederacao
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
      KeyFields = 'FEDERACAO_ID'
      Size = 50
      Lookup = True
    end
    object qryDeclaracaoOrigemLista: TStringField
      DisplayLabel = 'DO e Federa'#231#227'o'
      FieldKind = fkCalculated
      FieldName = 'Lista'
      Size = 50
      Calculated = True
    end
  end
  object QryMERCADORIA_EXP_DO_: TQuery
    CachedUpdates = True
    OnUpdateError = QryMERCADORIA_EXP_DO_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TMERCADORIA_EXP_DO'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA')
    UpdateObject = UpdMERCADORIA_EXP_DO
    Left = 780
    Top = 404
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptInput
        Value = '00'
      end>
    object QryMERCADORIA_EXP_DO_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TMERCADORIA_EXP_DO.CD_MERCADORIA'
      Visible = False
      FixedChar = True
      Size = 40
    end
    object QryMERCADORIA_EXP_DO_ID_DECLARACAO_ORIGEM: TIntegerField
      FieldName = 'ID_DECLARACAO_ORIGEM'
      Origin = 'DBBROKER.TMERCADORIA_EXP_DO.ID_DECLARACAO_ORIGEM'
      Visible = False
    end
    object QryMERCADORIA_EXP_DO_NumeroDO: TStringField
      DisplayLabel = 'N'#250'mero DO'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'NumeroDO'
      LookupDataSet = qryDeclaracaoOrigem
      LookupKeyFields = 'ID'
      LookupResultField = 'NUMERO'
      KeyFields = 'ID_DECLARACAO_ORIGEM'
      Lookup = True
    end
    object QryMERCADORIA_EXP_DO_Federacao: TStringField
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'Federacao'
      LookupDataSet = qryDeclaracaoOrigem
      LookupKeyFields = 'ID'
      LookupResultField = 'Federacao'
      KeyFields = 'ID_DECLARACAO_ORIGEM'
      Size = 50
      Lookup = True
    end
    object QryMERCADORIA_EXP_DO_VencimentoDO: TDateField
      FieldKind = fkLookup
      FieldName = 'Vencimento DO'
      LookupDataSet = qryDeclaracaoOrigem
      LookupKeyFields = 'ID'
      LookupResultField = 'VENCIMENTO'
      KeyFields = 'ID_DECLARACAO_ORIGEM'
      Lookup = True
    end
  end
  object dsMERCADORIA_EXP_DO: TDataSource
    DataSet = QryMERCADORIA_EXP_DO_
    Left = 780
    Top = 360
  end
  object UpdMERCADORIA_EXP_DO: TUpdateSQL
    ModifySQL.Strings = (
      'update TMERCADORIA_EXP_DO'
      'set'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  ID_DECLARACAO_ORIGEM = :ID_DECLARACAO_ORIGEM'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  ID_DECLARACAO_ORIGEM = :OLD_ID_DECLARACAO_ORIGEM')
    InsertSQL.Strings = (
      'insert into TMERCADORIA_EXP_DO'
      '  (CD_MERCADORIA, ID_DECLARACAO_ORIGEM)'
      'values'
      '  (:CD_MERCADORIA, :ID_DECLARACAO_ORIGEM)')
    DeleteSQL.Strings = (
      'delete from TMERCADORIA_EXP_DO'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  ID_DECLARACAO_ORIGEM = :OLD_ID_DECLARACAO_ORIGEM')
    Left = 780
    Top = 448
  end
  object ds_desc_merc_draft: TDataSource
    DataSet = qry_desc_merc_draft
    Left = 48
    Top = 515
  end
  object qry_desc_merc_draft: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TDESCRICAO_MERCADORIA_DRAFT')
    Left = 151
    Top = 515
    object qry_desc_merc_draftCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TDESCRICAO_MERCADORIA_DRAFT.CODIGO'
    end
    object qry_desc_merc_draftNM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      Origin = 'DBBROKER.TDESCRICAO_MERCADORIA_DRAFT.NM_DESCRICAO'
      FixedChar = True
      Size = 200
    end
    object qry_desc_merc_draftCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TDESCRICAO_MERCADORIA_DRAFT.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_desc_merc_draftTX_DESCRICAO_PORTUGUES: TMemoField
      FieldName = 'TX_DESCRICAO_PORTUGUES'
      Origin = 'DBBROKER.TDESCRICAO_MERCADORIA_DRAFT.TX_DESCRICAO_PORTUGUES'
      BlobType = ftMemo
    end
    object qry_desc_merc_draftTX_DESCRICAO_INGLES: TMemoField
      FieldName = 'TX_DESCRICAO_INGLES'
      Origin = 'DBBROKER.TDESCRICAO_MERCADORIA_DRAFT.TX_DESCRICAO_INGLES'
      BlobType = ftMemo
    end
    object qry_desc_merc_draftTX_DESCRICAO_ESPANHOL: TMemoField
      FieldName = 'TX_DESCRICAO_ESPANHOL'
      Origin = 'DBBROKER.TDESCRICAO_MERCADORIA_DRAFT.TX_DESCRICAO_ESPANHOL'
      BlobType = ftMemo
    end
  end
end
