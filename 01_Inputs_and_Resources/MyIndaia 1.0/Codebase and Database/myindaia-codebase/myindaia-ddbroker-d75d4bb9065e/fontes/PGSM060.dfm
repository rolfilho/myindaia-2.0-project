object datm_item: Tdatm_item
  OldCreateOrder = True
  Left = 222
  Top = 12
  Height = 679
  Width = 632
  object ds_item: TDataSource
    DataSet = qry_item_
    OnStateChange = ds_itemStateChange
    Left = 60
    Top = 40
  end
  object qry_item_: TQuery
    BeforePost = qry_item_BeforePost
    AfterScroll = qry_item_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TITEM'
      'WHERE CD_ITEM <> '#39#39
      'ORDER BY'
      'CD_ITEM')
    Left = 145
    Top = 40
    object qry_item_CD_ITEM: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_CD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
    object qry_item_CD_TIPO_LANC_FAT: TStringField
      FieldName = 'CD_TIPO_LANC_FAT'
      Origin = 'TITEM.CD_TIPO_LANC_FAT'
      Size = 1
    end
    object qry_item_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TITEM.IN_ATIVO'
      Size = 1
    end
    object qry_item_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_item_look_nm_tipo: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkLookup
      FieldName = 'look_nm_tipo'
      LookupDataSet = tbl_tipo_item
      LookupKeyFields = 'CD_TIPO_ITEM'
      LookupResultField = 'NM_TIPO_ITEM'
      KeyFields = 'CD_TIPO_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_item_Look_TP_ITEM_ATIVO: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_TP_ITEM_ATIVO'
      LookupDataSet = tbl_tipo_item
      LookupKeyFields = 'CD_TIPO_ITEM'
      LookupResultField = 'IN_ATIVO'
      KeyFields = 'CD_TIPO_ITEM'
      Size = 1
      Lookup = True
    end
    object qry_item_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TITEM.CD_FORMA_RATEIO'
      Size = 3
    end
    object qry_item_NM_APELIDO: TStringField
      FieldName = 'NM_APELIDO'
      Origin = 'TITEM.CD_FORMA_RATEIO'
      Size = 10
    end
    object qry_item_NM_ITEM_INGLES: TStringField
      FieldName = 'NM_ITEM_INGLES'
      Origin = 'TITEM.CD_TIPO_AVON'
      Size = 30
    end
    object qry_item_IN_ITEM_DI: TStringField
      FieldName = 'IN_ITEM_DI'
      Origin = 'TITEM.CD_FORMA_RATEIO'
      Size = 1
    end
    object qry_item_IN_CPMF: TStringField
      FieldName = 'IN_CPMF'
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
    object qry_item_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TITEM.IN_CONSOLIDA'
      Size = 1
    end
    object qry_item_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TITEM.CD_FORMA_RATEIO'
      Size = 3
    end
    object qry_item_LookCtContabil: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtContabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_item_LookAcesso: TStringField
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
    object qry_item_LookAux: TStringField
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
    object qry_item_IN_REEMBOLSO: TStringField
      FieldName = 'IN_REEMBOLSO'
      Origin = 'TITEM.CD_CT_CUSTO'
      Size = 1
    end
    object qry_item_LookReembolso: TStringField
      FieldKind = fkLookup
      FieldName = 'LookReembolso'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_REEMBOLSO'
      Size = 3
      Lookup = True
    end
    object qry_item_IN_DIVERSOS: TStringField
      FieldName = 'IN_DIVERSOS'
      Origin = 'TITEM.CD_CT_CUSTO'
      Size = 1
    end
    object qry_item_LookDiversos: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDiversos'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_DIVERSOS'
      Size = 3
      Lookup = True
    end
    object qry_item_IN_CALCULA_IR: TStringField
      FieldName = 'IN_CALCULA_IR'
      Origin = 'TITEM.CD_CT_CUSTO'
      Size = 1
    end
    object qry_item_NR_ORDEM_FAT: TIntegerField
      FieldName = 'NR_ORDEM_FAT'
      Origin = 'TITEM.CD_CT_CUSTO'
    end
    object qry_item_LookCtContabilRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtContabilRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_item_CD_CT_GERENCIAL: TStringField
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TITEM.CD_CT_CONTABIL'
      Size = 4
    end
    object qry_item_LookCtGerencial: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtGerencial'
      LookupDataSet = qry_ct_gerencial_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GERENCIAL'
      Lookup = True
    end
    object qry_item_LookCtGerencialRM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtGerencialRM'
      LookupDataSet = qry_ct_gerencialRM_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GERENCIAL'
      Lookup = True
    end
    object qry_item_IN_TRIBUTAVEL: TStringField
      FieldName = 'IN_TRIBUTAVEL'
      Origin = 'TITEM.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_item_IN_SOLIC_PAGTO: TStringField
      FieldName = 'IN_SOLIC_PAGTO'
      Origin = 'TITEM.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_item_IN_DESP_ALF: TStringField
      FieldName = 'IN_DESP_ALF'
      Origin = 'TITEM.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_item_IN_REEMB_FINANC: TStringField
      FieldName = 'IN_REEMB_FINANC'
      Origin = 'TITEM.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_item_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TITEM.CD_CT_CUSTO'
      FixedChar = True
      Size = 3
    end
    object qry_item_IN_CONSOLIDA: TStringField
      FieldName = 'IN_CONSOLIDA'
      Origin = 'DBBROKER.TITEM.IN_CONSOLIDA'
      FixedChar = True
      Size = 1
    end
    object qry_item_CD_FORMA_RATEIO: TStringField
      FieldName = 'CD_FORMA_RATEIO'
      Origin = 'DBBROKER.TITEM.CD_FORMA_RATEIO'
      FixedChar = True
      Size = 1
    end
    object qry_item_CD_TIPO_AVON: TStringField
      FieldName = 'CD_TIPO_AVON'
      Origin = 'DBBROKER.TITEM.CD_TIPO_AVON'
      FixedChar = True
      Size = 1
    end
    object qry_item_IN_DOLAR: TStringField
      FieldName = 'IN_DOLAR'
      Origin = 'DBBROKER.TITEM.IN_DOLAR'
      FixedChar = True
      Size = 1
    end
    object qry_item_IN_FAV_SM: TStringField
      FieldName = 'IN_FAV_SM'
      Origin = 'DBBROKER.TITEM.IN_FAV_SM'
      FixedChar = True
      Size = 1
    end
    object qry_item_TP_ITEM: TStringField
      FieldName = 'TP_ITEM'
      Origin = 'DBBROKER.TITEM.TP_ITEM'
      FixedChar = True
      Size = 1
    end
    object qry_item_CD_IATA: TStringField
      FieldName = 'CD_IATA'
      Origin = 'DBBROKER.TITEM.CD_IATA'
      FixedChar = True
      Size = 2
    end
    object qry_item_CD_ITEM_CONTABIL: TStringField
      FieldName = 'CD_ITEM_CONTABIL'
      Origin = 'DBBROKER.TITEM.CD_ITEM_CONTABIL'
      FixedChar = True
      Size = 3
    end
    object qry_item_CD_HIST_CONTABIL: TStringField
      FieldName = 'CD_HIST_CONTABIL'
      Origin = 'DBBROKER.TITEM.CD_HIST_CONTABIL'
      FixedChar = True
      Size = 40
    end
    object qry_item_IN_CALC_IN381: TStringField
      FieldName = 'IN_CALC_IN381'
      Origin = 'DBBROKER.TITEM.IN_CALC_IN381'
      FixedChar = True
      Size = 1
    end
    object qry_item_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'DBBROKER.TITEM.CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_item_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TITEM.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_item_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      Origin = 'DBBROKER.TITEM.TP_BASE_CALCULO'
      FixedChar = True
      Size = 2
    end
    object qry_item_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'Conta Contabil'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TITEM.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_item_NM_ITEM_ESPANHOL: TStringField
      FieldName = 'NM_ITEM_ESPANHOL'
      Origin = 'DBBROKER.TITEM.NM_ITEM_ESPANHOL'
      FixedChar = True
      Size = 30
    end
    object qry_item_TP_ITEM_SGA: TStringField
      FieldName = 'TP_ITEM_SGA'
      Origin = 'DBBROKER.TITEM.TP_ITEM_SGA'
      FixedChar = True
      Size = 1
    end
    object qry_item_IN_RECIBO: TStringField
      FieldName = 'IN_RECIBO'
      Origin = 'DBBROKER.TITEM.IN_RECIBO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 60
    Top = 104
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 145
    Top = 104
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
  end
  object qry_ult_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_ITEM) AS ULTIMO'
      'FROM TITEM'
      'WHERE CD_ITEM < '#39'800'#39)
    Left = 64
    Top = 220
    object qry_ult_item_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
  end
  object qry_unid_neg_prod_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, CD_PRODUTO'
      'FROM TUNID_NEG_PRODUTO')
    Left = 246
    Top = 40
    object qry_unid_neg_prod_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG_PRODUTO.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_prod_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUNID_NEG_PRODUTO.CD_PRODUTO'
      Size = 2
    end
  end
  object qry_priori_item_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TITEM_PRIORIDADE')
    Left = 246
    Top = 104
    object qry_priori_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM_PRIORIDADE.CD_ITEM'
      Size = 3
    end
    object qry_priori_item_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TITEM_PRIORIDADE.CD_UNID_NEG'
      Size = 2
    end
    object qry_priori_item_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TITEM_PRIORIDADE.CD_PRODUTO'
      Size = 2
    end
    object qry_priori_item_NR_PRIORIDADE: TFloatField
      FieldName = 'NR_PRIORIDADE'
      Origin = 'TITEM_PRIORIDADE.NR_PRIORIDADE'
    end
  end
  object qry_deleta_priori_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE TITEM_PRIORIDADE'
      'WHERE CD_ITEM = :CD_ITEM')
    Left = 145
    Top = 220
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
  end
  object ds_tipo_item: TDataSource
    DataSet = tbl_tipo_item
    Left = 60
    Top = 160
  end
  object tbl_tipo_item: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TIPO_ITEM'
    TableName = 'TTIPO_ITEM'
    Left = 145
    Top = 160
    object tbl_tipo_itemCD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Required = True
      Size = 1
    end
    object tbl_tipo_itemNM_TIPO_ITEM: TStringField
      FieldName = 'NM_TIPO_ITEM'
      Required = True
      Size = 30
    end
    object tbl_tipo_itemIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX FROM TC' +
        'T_CONTABIL'
      'WHERE CD_IDENTIFICADOR = '#39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 246
    Top = 220
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
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_ct_contabil_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 3
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
    Left = 246
    Top = 152
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
  object qry_ct_contabilRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM   TCONTABIL_PLANO'
      'WHERE  CD_COLIGADA = '#39'01'#39)
    Left = 243
    Top = 276
    object qry_ct_contabilRM_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCONTABIL_PLANO.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabilRM_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCONTABIL_PLANO.NM_CT_CONTABIL'
      Size = 40
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SISTEMA_CONTABIL'
      'FROM TPARAMETROS')
    Left = 348
    Top = 280
    object qry_param_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TPARAMETROS.CD_SISTEMA_CONTABIL'
      Size = 1
    end
  end
  object qry_ct_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_GERENCIAL, NM_CT_GERENCIAL'
      'FROM   TCT_GERENCIAL'
      'ORDER BY'
      'CD_CT_GERENCIAL')
    Left = 58
    Top = 277
    object qry_ct_gerencial_CD_CT_GERENCIAL: TStringField
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TCT_GERENCIAL.CD_CT_GERENCIAL'
      Size = 4
    end
    object qry_ct_gerencial_NM_CT_GERENCIAL: TStringField
      FieldName = 'NM_CT_GERENCIAL'
      Origin = 'TCT_GERENCIAL.NM_CT_GERENCIAL'
    end
  end
  object qry_ct_gerencialRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_GERENCIAL, NM_CT_GERENCIAL'
      'FROM   TCONTABIL_GERENCIAL'
      'ORDER BY'
      'CD_CT_GERENCIAL')
    Left = 147
    Top = 277
    object qry_ct_gerencialRM_CD_CT_GERENCIAL: TStringField
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TCONTABIL_GERENCIAL.CD_CT_GERENCIAL'
      Size = 4
    end
    object qry_ct_gerencialRM_NM_CT_GERENCIAL: TStringField
      FieldName = 'NM_CT_GERENCIAL'
      Origin = 'TCONTABIL_GERENCIAL.NM_CT_GERENCIAL'
    end
  end
  object qry_item_area_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_item
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TITEM_AREA'
      'WHERE CD_ITEM=:CD_ITEM')
    Left = 456
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
    object qry_item_area_CD_ITEM: TStringField
      DisplayLabel = 'C'#243'd. Item'
      FieldName = 'CD_ITEM'
      Origin = 'TITEM_AREA.CD_ITEM'
      Size = 3
    end
    object qry_item_area_CD_AREA: TStringField
      DisplayLabel = 'C'#243'd. '#193'rea'
      FieldName = 'CD_AREA'
      Origin = 'TITEM_AREA.CD_AREA'
      Size = 2
    end
    object qry_item_area_IN_LI: TStringField
      DisplayLabel = 'Ratear somente com LI'
      FieldName = 'IN_LI'
      Origin = 'TITEM_AREA.CD_ITEM'
      Size = 1
    end
    object qry_item_area_TP_RATEIO_DESP: TStringField
      FieldName = 'TP_RATEIO_DESP'
      Origin = 'TITEM_AREA.TP_RATEIO_DESP'
      Size = 1
    end
    object qry_item_area_VL_NUN_INDICE: TFloatField
      FieldName = 'VL_NUN_INDICE'
      Origin = 'TITEM_AREA.VL_NUN_INDICE'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_item_area_VL_DEN_INDICE: TFloatField
      FieldName = 'VL_DEN_INDICE'
      Origin = 'TITEM_AREA.VL_DEN_INDICE'
    end
    object qry_item_area_CD_MOEDA_INDICE: TStringField
      DisplayLabel = 'C'#243'd. Moeda'
      FieldName = 'CD_MOEDA_INDICE'
      Origin = 'TITEM_AREA.CD_MOEDA_INDICE'
      Size = 3
    end
    object qry_item_area_LookNmArea: TStringField
      DisplayLabel = #193'rea'
      FieldKind = fkLookup
      FieldName = 'LookNmArea'
      LookupDataSet = qry_area_
      LookupKeyFields = 'CD_AREA'
      LookupResultField = 'NM_AREA'
      KeyFields = 'CD_AREA'
      Size = 50
      Lookup = True
    end
    object qry_item_area_LookNmMoeda: TStringField
      DisplayLabel = 'Moeda'
      FieldKind = fkLookup
      FieldName = 'LookNmMoeda'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_INDICE'
      Size = 30
      Lookup = True
    end
    object qry_item_area_CalcIndice: TFloatField
      DisplayLabel = #205'ndice'
      FieldKind = fkCalculated
      FieldName = 'CalcIndice'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_item_area_LookNmRateioDesp: TStringField
      DisplayLabel = 'Forma de Rateio'
      FieldKind = fkLookup
      FieldName = 'LookNmRateioDesp'
      LookupDataSet = qry_tp_rateio_desp
      LookupKeyFields = 'TP_RATEIO_DESP'
      LookupResultField = 'NM_TP_RATEIO_DESP'
      KeyFields = 'TP_RATEIO_DESP'
      Lookup = True
    end
  end
  object ds_item_area_: TDataSource
    DataSet = qry_item_area_
    Left = 352
    Top = 40
  end
  object qry_area_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_AREA, NM_AREA'
      'FROM   TAREA')
    Left = 352
    Top = 104
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA '
      'FROM TMOEDA_BROKER')
    Left = 456
    Top = 104
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
  object qry_tp_rateio_desp: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TTP_RATEIO_DESP')
    Left = 456
    Top = 160
    object qry_tp_rateio_despTP_RATEIO_DESP: TStringField
      FieldName = 'TP_RATEIO_DESP'
      Origin = 'TTP_RATEIO_DESP.TP_RATEIO_DESP'
      Size = 1
    end
    object qry_tp_rateio_despNM_TP_RATEIO_DESP: TStringField
      FieldName = 'NM_TP_RATEIO_DESP'
      Origin = 'TTP_RATEIO_DESP.NM_TP_RATEIO_DESP'
    end
  end
  object ds_tp_rateio_desp: TDataSource
    DataSet = qry_tp_rateio_desp
    Left = 352
    Top = 160
  end
  object qry_deleta_area_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TITEM_AREA'
      'WHERE CD_ITEM=:CD_ITEM')
    Left = 456
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
  end
  object qry_pesq_area_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, CD_AREA'
      'FROM TITEM_AREA'
      'WHERE CD_ITEM=:CD_ITEM AND'
      '               CD_AREA=:CD_AREA')
    Left = 352
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_AREA'
        ParamType = ptUnknown
      end>
    object qry_pesq_area_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM_AREA.CD_ITEM'
      Size = 3
    end
    object qry_pesq_area_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TITEM_AREA.CD_AREA'
      Size = 2
    end
  end
  object ds_base_calc_frete: TDataSource
    DataSet = qry_ttp_base_calc_frete
    Left = 456
    Top = 280
  end
  object qry_ttp_base_calc_frete: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select * from TTP_BASE_CALC_FRETE')
    Left = 456
    Top = 344
    object qry_ttp_base_calc_freteCD_TP_BASE_CALC_FRETE: TStringField
      FieldName = 'CD_TP_BASE_CALC_FRETE'
      Origin = 'BROKER.TTP_BASE_CALC_FRETE.CD_TP_BASE_CALC_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_ttp_base_calc_freteNM_TP_BASE_CALC_FRETE: TStringField
      FieldName = 'NM_TP_BASE_CALC_FRETE'
      Origin = 'BROKER.TTP_BASE_CALC_FRETE.NM_TP_BASE_CALC_FRETE'
      FixedChar = True
      Size = 100
    end
  end
  object dts_Item_Rateio: TDataSource
    DataSet = qry_Item_Rateio
    Left = 144
    Top = 340
  end
  object qry_Item_Rateio: TQuery
    AfterInsert = qry_Item_RateioAfterInsert
    DatabaseName = 'DBBROKER'
    DataSource = ds_item
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TITEM_CUSTO'
      'WHERE CD_ITEM=:CD_ITEM')
    Left = 56
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_Item_RateioCD_UNIDADE: TStringField
      FieldName = 'CD_UNIDADE'
      Origin = 'DBBROKER.TITEM_RATEIO.CD_UNIDADE'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qry_Item_RateioCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TITEM_RATEIO.CD_PRODUTO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qry_Item_RateioCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TITEM_RATEIO.CD_ITEM'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qry_Item_RateioCD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TITEM_CUSTO.CD_CT_CUSTO'
      FixedChar = True
      Size = 25
    end
    object qry_Item_RateiolkpNM_Unidade: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'lkpNM_Unidade'
      LookupDataSet = qry_Unidade
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'AP_UNID_NEG'
      KeyFields = 'CD_UNIDADE'
      Lookup = True
    end
    object qry_Item_RateiolkpNM_Produto: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'lkpNM_Produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Lookup = True
    end
    object qry_Item_RateiolkpContabilCusto: TStringField
      DisplayLabel = 'Centro de Custo'
      FieldKind = fkLookup
      FieldName = 'lkpContabilCusto'
      LookupDataSet = qry_ContabilCusto
      LookupKeyFields = 'CD_CT_CUSTO'
      LookupResultField = 'NM_CT_CUSTO'
      KeyFields = 'CD_CT_CUSTO'
      Lookup = True
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG (NOLOCK)'
      'WHERE  ( CD_UNID_NEG <> '#39#39' ) AND'
      '                (  CD_UNID_NEG IN '
      '                ( SELECT CD_UNID_NEG '
      '                  FROM TUSUARIO_HABILITACAO (NOLOCK)'
      
        '                  WHERE CD_USUARIO = :CD_USUARIO AND IN_ATIVO = ' +
        #39'1'#39' ) )'
      'ORDER BY'
      'NM_UNID_NEG'
      '')
    Left = 248
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
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
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 352
    Top = 348
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO (NOLOCK)'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 50
    Top = 408
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 154
    Top = 412
  end
  object qry_ContabilCusto: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_item
    SQL.Strings = (
      'select CD_CT_CUSTO, NM_CT_CUSTO'
      'FROM TCONTABIL_CUSTO '
      'where IN_ATIVO = 1 ')
    Left = 50
    Top = 480
  end
  object dts_ContabilCusto: TDataSource
    DataSet = qry_ContabilCusto
    Left = 154
    Top = 480
  end
  object qry_Unidade: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select * from TUNID_NEG where IN_ATIVO = 1')
    Left = 50
    Top = 528
  end
  object dts_Unidade: TDataSource
    DataSet = qry_Unidade
    Left = 154
    Top = 532
  end
  object qry_item_group_service: TQuery
    AfterInsert = qry_item_group_serviceAfterInsert
    OnCalcFields = qry_item_group_serviceCalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_item
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TITEM_GROUP_SERVICES'
      'WHERE CD_ITEM=:CD_ITEM')
    Left = 456
    Top = 416
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_item_group_serviceCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TITEM_GROUP_SERVICES.CD_ITEM'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qry_item_group_serviceCD_GROUP_SERVICES: TStringField
      FieldName = 'CD_GROUP_SERVICES'
      Origin = 'DBBROKER.TITEM_GROUP_SERVICES.CD_GROUP_SERVICES'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object qry_item_group_servicecalcNM_GROUP_SERVICE: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNM_GROUP_SERVICE'
      Calculated = True
    end
  end
  object dts_item_group_service: TDataSource
    DataSet = qry_item_group_service
    Left = 328
    Top = 416
  end
  object dts_Group_Service: TDataSource
    DataSet = qry_Group_Service
    Left = 340
    Top = 520
  end
  object qry_Group_Service: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TTP_GROUP_SERVICES')
    Left = 457
    Top = 520
    object qry_Group_ServiceCD_GROUP_SERVICES: TStringField
      FieldName = 'CD_GROUP_SERVICES'
      Origin = 'DBBROKER.TTP_GROUP_SERVICES.CD_GROUP_SERVICES'
      FixedChar = True
      Size = 4
    end
    object qry_Group_ServiceNM_GROUP_SERVICES: TStringField
      FieldName = 'NM_GROUP_SERVICES'
      Origin = 'DBBROKER.TTP_GROUP_SERVICES.NM_GROUP_SERVICES'
      FixedChar = True
    end
  end
  object qry_ult_group_service: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_GROUP_SERVICES) AS ULTIMO'
      'FROM TTP_GROUP_SERVICES')
    Left = 232
    Top = 580
    object qry_ult_group_serviceULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TTP_GROUP_SERVICES.CD_GROUP_SERVICES'
      FixedChar = True
      Size = 4
    end
  end
end
