object datm_mercadoria: Tdatm_mercadoria
  OldCreateOrder = True
  Left = 582
  Top = 204
  Height = 582
  Width = 688
  object ds_mercadoria: TDataSource
    DataSet = qry_mercadoria_
    OnStateChange = ds_mercadoriaStateChange
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
    Left = 145
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
    Top = 282
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
    Left = 145
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
    Left = 145
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
    Top = 338
  end
  object ds_empresa_nac: TDataSource
    DataSet = tbl_empresa_nac_
    Left = 48
    Top = 390
  end
  object tbl_empresa_nac_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_NAC'
    UpdateMode = upWhereKeyOnly
    Left = 145
    Top = 390
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
      'FROM TMERCADORIA'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA'
      '  AND CD_GRUPO = :CD_GRUPO')
    Left = 264
    Top = 18
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qry_proc_mercadoria_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 30
    end
  end
  object qry_lista_: TQuery
    AfterScroll = qry_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MERCADORIA, M.CD_NCM_SH, M.AP_MERCADORIA, M.CD_IMPOR' +
        'TADOR, E.NM_EMPRESA, M.CD_GRUPO, G.NM_GRUPO, M.CD_PAIS_AQUISICAO' +
        ', M.CD_PAIS_ORIGEM, PA.DESCRICAO NM_PAIS_AQUISICAO, PO.DESCRICAO' +
        ' NM_PAIS_ORIGEM'
      'FROM   TMERCADORIA M'
      
        'LEFT JOIN TEMPRESA_NAC E (NOLOCK) ON M.CD_IMPORTADOR = E.CD_EMPR' +
        'ESA'
      'LEFT JOIN TGRUPO G       (NOLOCK) ON M.CD_GRUPO = G.CD_GRUPO'
      
        'LEFT JOIN TPAIS PA       (NOLOCK) ON M.CD_PAIS_AQUISICAO = PA.CO' +
        'DIGO'
      
        'LEFT JOIN TPAIS PO       (NOLOCK) ON M.CD_PAIS_ORIGEM = PO.CODIG' +
        'O '
      'WHERE'
      '       0 = 1'
      '       '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '                      '
      'ORDER BY CD_MERCADORIA')
    Left = 145
    Top = 19
    object StringField1: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 30
    end
    object qry_lista_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qry_lista_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Size = 25
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
    object qry_lista_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object qry_lista_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object qry_lista_NM_PAIS_AQUISICAO: TStringField
      DisplayLabel = 'Pa'#237's de Aquisi'#231#227'o'
      FieldName = 'NM_PAIS_AQUISICAO'
      Size = 120
    end
    object qry_lista_NM_PAIS_ORIGEM: TStringField
      DisplayLabel = 'Pa'#237's de Origem'
      FieldName = 'NM_PAIS_ORIGEM'
      Size = 120
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 48
    Top = 18
  end
  object qry_mercadoria_: TQuery
    AfterInsert = qry_mercadoria_AfterInsert
    OnCalcFields = qry_mercadoria_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT  *'
      'FROM TMERCADORIA M'
      'WHERE  M.CD_MERCADORIA = :CD_MERCADORIA'
      ' AND M.CD_GRUPO = :CD_GRUPO')
    Left = 145
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptInput
        Size = 31
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
        Size = 4
      end>
    object qry_mercadoria_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 30
    end
    object qry_mercadoria_NM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      Origin = 'TMERCADORIA.NM_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_mercadoria_AP_MERCADORIA: TStringField
      DisplayWidth = 50
      FieldName = 'AP_MERCADORIA'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
      Size = 50
    end
    object qry_mercadoria_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TMERCADORIA.VL_UNITARIO'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_mercadoria_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TMERCADORIA.CD_NCM_SH'
      EditMask = '9999.99.99-999;0;_'
      Size = 11
    end
    object qry_mercadoria_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TMERCADORIA.CD_NALADI_SH'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_mercadoria_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'TMERCADORIA.CD_NALADI_NCCA'
      EditMask = '9999.99.9;0;_'
      Size = 7
    end
    object qry_mercadoria_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TMERCADORIA.PL_MERCADORIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_mercadoria_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TMERCADORIA.CD_EXPORTADOR'
      Size = 5
    end
    object qry_mercadoria_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TMERCADORIA.CD_PAIS_AQUISICAO'
      Size = 3
    end
    object qry_mercadoria_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TMERCADORIA.CD_PAIS_ORIGEM'
      Size = 3
    end
    object qry_mercadoria_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TMERCADORIA.CD_FABRICANTE'
      Size = 5
    end
    object qry_mercadoria_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TMERCADORIA.CD_IMPORTADOR'
      Size = 5
    end
    object qry_mercadoria_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TMERCADORIA.CD_GRUPO'
      Size = 3
    end
    object qry_mercadoria_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TMERCADORIA.CD_FABR_EXPO'
      Size = 1
    end
    object qry_mercadoria_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TMERCADORIA.CD_TIPO_CALCULO'
      Size = 1
    end
    object qry_mercadoria_CD_MATERIAL: TStringField
      FieldName = 'CD_MATERIAL'
      Origin = 'TMERCADORIA.CD_MATERIAL'
      Size = 10
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
    object qry_mercadoria_look_importador: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_importador'
      LookupDataSet = tbl_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'AP_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Lookup = True
    end
    object qry_mercadoria_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 3
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
    object qry_mercadoria_IN_NECESSITA_LI: TBooleanField
      FieldName = 'IN_NECESSITA_LI'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
    end
    object qry_mercadoria_CD_FAMILIA_PROD: TStringField
      FieldName = 'CD_FAMILIA_PROD'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 8
    end
    object qry_mercadoria_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TMERCADORIA.NM_MERCADORIA'
      Size = 3
    end
    object qry_mercadoria_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
      Size = 4
    end
    object qry_mercadoria_CD_CATEGORIA_TEXTIL: TStringField
      FieldName = 'CD_CATEGORIA_TEXTIL'
      Origin = 'TMERCADORIA.CD_UN_MED_COMERC'
      Size = 4
    end
    object qry_mercadoria_CD_FINALIDADE_MERC: TStringField
      FieldName = 'CD_FINALIDADE_MERC'
      Origin = 'TMERCADORIA.CD_NCM_SH'
      Size = 3
    end
    object qry_mercadoria_CD_UF_PRODUTOR: TStringField
      FieldName = 'CD_UF_PRODUTOR'
      Origin = 'TMERCADORIA.CD_NALADI_SH'
      Size = 2
    end
    object qry_mercadoria_TX_DESC_INGLES: TMemoField
      FieldName = 'TX_DESC_INGLES'
      Origin = 'TMERCADORIA.CD_NALADI_NCCA'
      BlobType = ftMemo
    end
    object qry_mercadoria_TX_DESC_ESP: TMemoField
      FieldName = 'TX_DESC_ESP'
      Origin = 'TMERCADORIA.PL_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_mercadoria_PB_MERCADORIA: TFloatField
      FieldName = 'PB_MERCADORIA'
      Origin = 'TMERCADORIA.CD_EXPORTADOR'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_mercadoria_QT_POR_EMBALAGEM: TFloatField
      FieldName = 'QT_POR_EMBALAGEM'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
    object qry_mercadoria_LookExportador: TStringField
      DisplayLabel = 'Exportador'
      FieldKind = fkLookup
      FieldName = 'LookExportador'
      LookupDataSet = qry_empresa_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_mercadoria_LookFabricante: TStringField
      DisplayLabel = 'Fabricante'
      FieldKind = fkLookup
      FieldName = 'LookFabricante'
      LookupDataSet = qry_empresa_est_
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
    object qry_mercadoria_CD_ONU: TStringField
      FieldName = 'CD_ONU'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 4
    end
    object qry_mercadoria_CD_CLASSE: TStringField
      FieldName = 'CD_CLASSE'
      Origin = 'TMERCADORIA.NM_MERCADORIA'
      Size = 3
    end
    object qry_mercadoria_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 2
    end
    object qry_mercadoria_LookArea: TStringField
      FieldKind = fkLookup
      FieldName = 'LookArea'
      LookupDataSet = qry_area_
      LookupKeyFields = 'CD_AREA'
      LookupResultField = 'NM_AREA'
      KeyFields = 'CD_AREA'
      Size = 502
      Lookup = True
    end
    object qry_mercadoria_IN_ATO_DRAWBACK: TStringField
      FieldName = 'IN_ATO_DRAWBACK'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 1
    end
    object qry_mercadoria_CD_PROPRIETARIO: TStringField
      FieldName = 'CD_PROPRIETARIO'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 3
    end
    object qry_mercadoria_CD_EMBALAGEM_SCX: TStringField
      FieldName = 'CD_EMBALAGEM_SCX'
      Origin = 'TMERCADORIA.NM_MERCADORIA'
      Size = 2
    end
    object qry_mercadoria_LookEmbalagemScx: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookEmbalagemScx'
      Size = 120
      Calculated = True
    end
    object qry_mercadoria_LookProprietario: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookProprietario'
      Size = 50
      Calculated = True
    end
    object qry_mercadoria_IN_TIPO_M_E: TStringField
      FieldName = 'IN_TIPO_M_E'
      Origin = 'DBBROKER.TMERCADORIA.IN_TIPO_M_E'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_IN_CAT63: TStringField
      FieldName = 'IN_CAT63'
      Origin = 'DBBROKER.TMERCADORIA.IN_CAT63'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_CD_USUARIO_CRIACAO: TStringField
      FieldName = 'CD_USUARIO_CRIACAO'
      Origin = 'DBBROKER.TMERCADORIA.CD_USUARIO_CRIACAO'
      FixedChar = True
      Size = 4
    end
    object qry_mercadoria_DT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
      Origin = 'DBBROKER.TMERCADORIA.DT_CRIACAO'
      EditMask = '99/99/9999;1;_'
    end
    object qry_mercadoria_CD_USUARIO_ULT_ALTERACAO: TStringField
      FieldName = 'CD_USUARIO_ULT_ALTERACAO'
      Origin = 'DBBROKER.TMERCADORIA.CD_USUARIO_ULT_ALTERACAO'
      FixedChar = True
      Size = 4
    end
    object qry_mercadoria_DT_ULT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ULT_ALTERACAO'
      Origin = 'DBBROKER.TMERCADORIA.DT_ULT_ALTERACAO'
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
    object qry_mercadoria_IN_DRAWBACK_INDAIA: TStringField
      FieldName = 'IN_DRAWBACK_INDAIA'
      Origin = 'DBBROKER.TMERCADORIA.IN_DRAWBACK_INDAIA'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_NM_MERC_RESUMIDA: TStringField
      FieldName = 'NM_MERC_RESUMIDA'
      Origin = 'DBBROKER.TMERCADORIA.NM_MERC_RESUMIDA'
      FixedChar = True
      Size = 60
    end
    object qry_mercadoria_DESTAQUE_NCM: TStringField
      FieldName = 'DESTAQUE_NCM'
      Origin = 'DBBROKER.TMERCADORIA.DESTAQUE_NCM'
      FixedChar = True
      Size = 3
    end
    object qry_mercadoria_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TMERCADORIA.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      Origin = 'DBBROKER.TMERCADORIA.CD_TRIBUTACAO_ICMS'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      Origin = 'DBBROKER.TMERCADORIA.PC_ICMS'
    end
    object qry_mercadoria_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      Origin = 'DBBROKER.TMERCADORIA.CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_mercadoria_IN_ALIQ_DIF: TStringField
      FieldName = 'IN_ALIQ_DIF'
      Origin = 'DBBROKER.TMERCADORIA.IN_ALIQ_DIF'
      EditMask = '#0.00'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_IN_NECESSITA_LI_SISCOMEX: TStringField
      FieldName = 'IN_NECESSITA_LI_SISCOMEX'
      Origin = 'DBBROKER.TMERCADORIA.IN_NECESSITA_LI_SISCOMEX'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_CD_PLANEJADOR: TIntegerField
      FieldName = 'CD_PLANEJADOR'
      Origin = 'DBBROKER.TMERCADORIA.CD_PLANEJADOR'
    end
    object qry_mercadoria_CALC_NM_PLANEJADOR: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NM_PLANEJADOR'
      Size = 200
      Calculated = True
    end
    object qry_mercadoria_IN_DRAWBACK: TStringField
      FieldName = 'IN_DRAWBACK'
      Origin = 'DBBROKER.TMERCADORIA.IN_DRAWBACK'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_PC_PIS: TFloatField
      FieldName = 'PC_PIS'
      Origin = 'DBBROKER.TMERCADORIA.PC_PIS'
    end
    object qry_mercadoria_PC_COFINS: TFloatField
      FieldName = 'PC_COFINS'
      Origin = 'DBBROKER.TMERCADORIA.PC_COFINS'
    end
    object qry_mercadoria_IN_ALIQ_DIF_PIS: TStringField
      FieldName = 'IN_ALIQ_DIF_PIS'
      Origin = 'DBBROKER.TMERCADORIA.IN_ALIQ_DIF_PIS'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_IN_ALIQ_DIF_COFINS: TStringField
      FieldName = 'IN_ALIQ_DIF_COFINS'
      Origin = 'DBBROKER.TMERCADORIA.IN_ALIQ_DIF_COFINS'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_CD_REG_TRIB_PIS_COFINS: TStringField
      FieldName = 'CD_REG_TRIB_PIS_COFINS'
      Origin = 'DBBROKER.TMERCADORIA.CD_REG_TRIB_PIS_COFINS'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_CD_FUND_LEG_PIS_COFINS: TStringField
      FieldName = 'CD_FUND_LEG_PIS_COFINS'
      Origin = 'DBBROKER.TMERCADORIA.CD_FUND_LEG_PIS_COFINS'
      FixedChar = True
      Size = 2
    end
    object qry_mercadoria_IN_ANTIDUMPING: TStringField
      FieldName = 'IN_ANTIDUMPING'
      Origin = 'DBBROKER.TMERCADORIA.IN_ANTIDUMPING'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_DIV_MERC: TStringField
      FieldName = 'DIV_MERC'
      Origin = 'DBBROKER.TMERCADORIA.DIV_MERC'
      FixedChar = True
      Size = 2
    end
    object qry_mercadoria_NR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Origin = 'DBBROKER.TMERCADORIA.NR_DESTAQUE_NCM'
      FixedChar = True
      Size = 3
    end
    object qry_mercadoria_PC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
    end
    object qry_mercadoria_CD_CATALOGO_PRODUTOS: TIntegerField
      FieldName = 'CD_CATALOGO_PRODUTOS'
      Origin = 'DBBROKER.TMERCADORIA.CD_CATALOGO_PRODUTOS'
    end
    object qry_mercadoria_NR_VERSAO_CATALOGO_PROD: TStringField
      FieldName = 'NR_VERSAO_CATALOGO_PROD'
      Size = 7
    end
  end
  object qry_unid_medida_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  * FROM TUNID_MEDIDA_BROKER')
    Left = 145
    Top = 282
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
  object qry_nivel_merc_: TQuery
    AfterScroll = qry_nivel_merc_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_mercadoria
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TMERCAD_NVE')
    Left = 264
    Top = 80
    object qry_nivel_merc_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCAD_NVE.CD_MERCADORIA'
      Size = 30
    end
    object qry_nivel_merc_CD_NIVEL_NVE: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'CD_NIVEL_NVE'
      Origin = 'TMERCAD_NVE.CD_NIVEL_NVE'
      Size = 3
    end
    object qry_nivel_merc_CD_ATRIBUTO_NCM: TStringField
      DisplayLabel = 'Atributo'
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TMERCAD_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_nivel_merc_CD_ESPECIF_NCM: TStringField
      DisplayLabel = 'Especifica'#231#227'o'
      FieldName = 'CD_ESPECIF_NCM'
      Origin = 'TMERCAD_NVE.CD_ESPECIF_NCM'
      Size = 4
    end
    object qry_nivel_merc_LookNomeAtrib: TStringField
      DisplayLabel = 'Atributo'
      FieldKind = fkLookup
      FieldName = 'LookNomeAtrib'
      LookupDataSet = qry_atrib_
      LookupKeyFields = 'CD_ATRIBUTO_NCM'
      LookupResultField = 'NM_ATRIBUTO'
      KeyFields = 'CD_ATRIBUTO_NCM'
      Size = 249
      Lookup = True
    end
    object qry_nivel_merc_LookNomeEspec: TStringField
      DisplayLabel = 'Especifica'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'LookNomeEspec'
      LookupDataSet = qry_especif_
      LookupKeyFields = 'CD_ESPECIF_NCM'
      LookupResultField = 'NM_ESPECIF_NCM'
      KeyFields = 'CD_ESPECIF_NCM'
      Size = 249
      Lookup = True
    end
    object qry_nivel_merc_LookNivel: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNivel'
      LookupDataSet = qry_nivel_
      LookupKeyFields = 'CD_NIVEL_NVE'
      LookupResultField = 'NM_NIVEL'
      KeyFields = 'CD_NIVEL_NVE'
      Size = 50
      Lookup = True
    end
    object qry_nivel_merc_CD_NCM_ATRIBUTO: TStringField
      FieldName = 'CD_NCM_ATRIBUTO'
      Origin = 'TMERCAD_NVE.CD_MERCADORIA'
      Size = 8
    end
    object qry_nivel_merc_CD_NCM_ESPECIF: TStringField
      FieldName = 'CD_NCM_ESPECIF'
      Origin = 'TMERCAD_NVE.CD_NIVEL_NVE'
      Size = 8
    end
  end
  object ds_nivel_merc: TDataSource
    DataSet = qry_nivel_merc_
    Left = 264
    Top = 129
  end
  object qry_nivel_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TAB_NIVEL ORDER BY CD_NIVEL_NVE')
    Left = 432
    Top = 15
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
    SQL.Strings = (
      'SELECT * FROM TATRIB_VALORACAO_NVE'
      'WHERE '
      'CD_NOMENC_NCM IS NOT NULL')
    Left = 431
    Top = 63
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
    SQL.Strings = (
      'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE'
      'WHERE'
      'CD_NOMENC_NCM IS NOT NULL')
    Left = 433
    Top = 111
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
  object ds_nivel: TDataSource
    DataSet = qry_nivel_
    Left = 376
    Top = 15
  end
  object ds_atrib: TDataSource
    DataSet = qry_atrib_
    Left = 375
    Top = 63
  end
  object ds_especif: TDataSource
    DataSet = qry_especif_
    Left = 373
    Top = 111
  end
  object ds_familia_prod: TDataSource
    DataSet = qry_familia_prod_
    Left = 264
    Top = 235
  end
  object qry_familia_prod_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  CD_FAMILIA_PROD, NM_FAMILIA_PROD'
      'FROM TFAMILIA_PROD'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 384
    Top = 234
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
    Left = 264
    Top = 290
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  CD_MOEDA, NM_MOEDA'
      'FROM TMOEDA_BROKER'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 384
    Top = 289
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
    Left = 264
    Top = 346
  end
  object qry_embalagem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMBALAGEM, NM_EMBALAGEM_S'
      'FROM TEMBALAGEM'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 384
    Top = 345
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
    Left = 264
    Top = 402
  end
  object qry_finalidade_merc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FINALIDADE_MERC, NM_FINALIDADE_MERC'
      'FROM TFINALIDADE_MERC'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 384
    Top = 401
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
    Left = 264
    Top = 451
  end
  object qry_uf_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UF, NM_UF'
      'FROM TUF')
    Left = 384
    Top = 451
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
    Left = 145
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
  object qry_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PAIS FROM TEMPRESA_EST'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Left = 264
    Top = 178
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end>
  end
  object qry_area_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  CD_AREA, NM_AREA'
      'FROM TAREA')
    Left = 504
    Top = 289
    object qry_area_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TAREA.CD_AREA'
      Size = 2
    end
    object qry_area_NM_AREA: TStringField
      FieldName = 'NM_AREA'
      Origin = 'TAREA.NM_AREA'
      Size = 50
    end
  end
  object qry_pesquisa: TQuery
    DatabaseName = 'DBBROKER'
    Left = 504
    Top = 348
  end
  object qry_yesno_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM   TYES_NO')
    Left = 432
    Top = 163
  end
  object ds_yesno: TDataSource
    DataSet = qry_yesno_
    Left = 373
    Top = 163
  end
  object qry_emb_scx_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CODIGO AS CD_EMBALAGEM, DESCRICAO AS NM_EMBALAGEM'
      'FROM   TTP_EMBALAGEM'
      'WHERE  CODIGO = :CD_EMBALAGEM')
    Left = 507
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMBALAGEM'
        ParamType = ptInput
      end>
  end
  object qry_prop_merc_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_PROPRIETARIO, NM_PROPRIETARIO'
      'FROM   TPROPRIETARIO_MERC'
      'WHERE  CD_PROPRIETARIO = :CD_PROPRIETARIO')
    Left = 507
    Top = 63
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PROPRIETARIO'
        ParamType = ptInput
      end>
  end
  object qry_disp_legal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTP_EXONERACAO'
      'ORDER BY'
      'CD_EX'
      '')
    UpdateMode = upWhereChanged
    Left = 503
    Top = 232
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
      'FROM TTP_TRAT_TRIB_ICMS')
    UpdateMode = upWhereChanged
    Left = 511
    Top = 169
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
  object qry_LCC: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TMERCADORIA_LCC')
    Left = 504
    Top = 420
    object qry_LCCCD_LCC: TStringField
      FieldName = 'CD_LCC'
      Origin = 'DBBROKER.TMERCADORIA_LCC.CD_LCC'
      FixedChar = True
      Size = 2
    end
    object qry_LCCDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TMERCADORIA_LCC.DESCRICAO'
      FixedChar = True
      Size = 100
    end
    object qry_LCCCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TMERCADORIA_LCC.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
  end
  object ds_LCC: TDataSource
    DataSet = qry_LCC
    Left = 581
    Top = 419
  end
end
