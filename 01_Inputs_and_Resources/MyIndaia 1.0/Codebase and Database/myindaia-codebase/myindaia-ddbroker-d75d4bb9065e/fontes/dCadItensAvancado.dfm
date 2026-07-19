object datm_CadItens_avancado: Tdatm_CadItens_avancado
  OldCreateOrder = True
  Left = 226
  Top = 105
  Height = 557
  Width = 782
  object ds_item: TDataSource
    DataSet = qry_item_
    Left = 36
    Top = 24
  end
  object qry_item_: TQuery
    BeforePost = qry_item_BeforePost
    AfterScroll = qry_item_AfterScroll
    OnCalcFields = qry_item_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TITEM'
      'WHERE CD_ITEM <> '#39#39
      'ORDER BY'
      'CD_ITEM'
      ' ')
    Left = 121
    Top = 24
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
    object qry_item_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'C'#243'd. Conta Cont'#225'bil'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TITEM.CD_ITEM'
      OnChange = qry_item_CD_CT_CONTABILChange
      EditMask = '999.99.99999;0;_'
      Size = 10
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
    object qry_item_IN_DIVERSOS: TStringField
      FieldName = 'IN_DIVERSOS'
      Origin = 'TITEM.CD_CT_CUSTO'
      Size = 1
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
    object qry_item_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      Origin = 'DBBROKER.TITEM.TP_BASE_CALCULO'
      FixedChar = True
      Size = 2
    end
    object qry_item_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TITEM.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_item_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'DBBROKER.TITEM.CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_item_TP_ORIGEM_DESPESA: TStringField
      FieldName = 'TP_ORIGEM_DESPESA'
      Origin = 'DBBROKER.TITEM.TP_ORIGEM_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_item_VL_BASE_DESPESA: TFloatField
      FieldName = 'VL_BASE_DESPESA'
      Origin = 'DBBROKER.TITEM.VL_BASE_DESPESA'
      DisplayFormat = '0.00'
    end
    object qry_item_calc_ativo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ativo'
      Size = 3
      Calculated = True
    end
    object qry_item_Look_nm_tp_frete: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_frete'
      LookupDataSet = qry_ttp_frete_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TP_FRETE'
      Size = 15
      Lookup = True
    end
    object qry_item_Look_nm_base_calc: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_base_calc'
      LookupDataSet = qry_ttp_base_calc_frete
      LookupKeyFields = 'CD_TP_BASE_CALC_FRETE'
      LookupResultField = 'NM_TP_BASE_CALC_FRETE'
      KeyFields = 'TP_BASE_CALCULO'
      Size = 15
      Lookup = True
    end
    object qry_item_Look_nm_origem_desp: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_origem_desp'
      LookupDataSet = qry_torigem_despesa
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'TP_ORIGEM_DESPESA'
      Size = 15
      Lookup = True
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
    object qry_item_Look_nm_item_contabil: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_item_contabil'
      LookupDataSet = qry_item_contabil_
      LookupKeyFields = 'CD_ITEM_CONTABIL'
      LookupResultField = 'NM_ITEM_CONTABIL'
      KeyFields = 'CD_ITEM_CONTABIL'
      Size = 80
      Lookup = True
    end
  end
  object qry_ult_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_ITEM) AS ULTIMO'
      'FROM TITEM'
      'WHERE CD_ITEM < '#39'800'#39)
    Left = 36
    Top = 204
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
    Left = 318
    Top = 24
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
    CachedUpdates = True
    AfterPost = qry_priori_item_AfterPost
    AfterDelete = qry_priori_item_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TITEM_PRIORIDADE')
    UpdateObject = upd_qry_priori_item_
    Left = 62
    Top = 88
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
    Left = 121
    Top = 204
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
  end
  object ds_tipo_item: TDataSource
    DataSet = tbl_tipo_item
    Left = 36
    Top = 144
  end
  object tbl_tipo_item: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TIPO_ITEM'
    TableName = 'TTIPO_ITEM'
    Left = 121
    Top = 144
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
    Left = 222
    Top = 204
    object qry_ct_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 10
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
    Left = 222
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACESSO_AUX'
        ParamType = ptUnknown
      end>
    object qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 10
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
    Left = 323
    Top = 204
    object qry_ct_contabilRM_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCONTABIL_PLANO.CD_CT_CONTABIL'
      Size = 10
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
    Left = 324
    Top = 144
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
    Left = 218
    Top = 261
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
    Left = 323
    Top = 261
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
  object upd_qry_item_: TUpdateSQL
    ModifySQL.Strings = (
      'update TITEM'
      'set'
      '  CD_ITEM = :CD_ITEM,'
      '  NM_ITEM = :NM_ITEM,'
      '  CD_TIPO_ITEM = :CD_TIPO_ITEM,'
      '  CD_TIPO_LANC_FAT = :CD_TIPO_LANC_FAT,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  IN_CPMF = :IN_CPMF,'
      '  CD_CT_CONTABIL = :CD_CT_CONTABIL,'
      '  CD_CT_CUSTO = :CD_CT_CUSTO,'
      '  IN_CONSOLIDA = :IN_CONSOLIDA,'
      '  CD_FORMA_RATEIO = :CD_FORMA_RATEIO,'
      '  CD_TIPO_AVON = :CD_TIPO_AVON,'
      '  IN_DOLAR = :IN_DOLAR,'
      '  IN_FAV_SM = :IN_FAV_SM,'
      '  CD_CT_GERENCIAL = :CD_CT_GERENCIAL,'
      '  CD_FILIAL = :CD_FILIAL,'
      '  NM_APELIDO = :NM_APELIDO,'
      '  NM_ITEM_INGLES = :NM_ITEM_INGLES,'
      '  IN_ITEM_DI = :IN_ITEM_DI,'
      '  CD_ACESSO = :CD_ACESSO,'
      '  CD_AUX = :CD_AUX,'
      '  IN_REEMBOLSO = :IN_REEMBOLSO,'
      '  IN_DIVERSOS = :IN_DIVERSOS,'
      '  IN_CALCULA_IR = :IN_CALCULA_IR,'
      '  NR_ORDEM_FAT = :NR_ORDEM_FAT,'
      '  IN_TRIBUTAVEL = :IN_TRIBUTAVEL,'
      '  IN_SOLIC_PAGTO = :IN_SOLIC_PAGTO,'
      '  IN_DESP_ALF = :IN_DESP_ALF,'
      '  IN_REEMB_FINANC = :IN_REEMB_FINANC,'
      '  TP_ITEM = :TP_ITEM,'
      '  CD_IATA = :CD_IATA,'
      '  CD_ITEM_CONTABIL = :CD_ITEM_CONTABIL,'
      '  CD_HIST_CONTABIL = :CD_HIST_CONTABIL,'
      '  IN_CALC_IN381 = :IN_CALC_IN381,'
      '  TP_FRETE = :TP_FRETE,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  CD_VIA_TRANSPORTE = :CD_VIA_TRANSPORTE'
      'where'
      '  CD_ITEM = :OLD_CD_ITEM')
    InsertSQL.Strings = (
      'insert into TITEM'
      
        '  (CD_ITEM, NM_ITEM, CD_TIPO_ITEM, CD_TIPO_LANC_FAT, IN_ATIVO, I' +
        'N_CPMF, '
      
        '   CD_CT_CONTABIL, CD_CT_CUSTO, IN_CONSOLIDA, CD_FORMA_RATEIO, C' +
        'D_TIPO_AVON, '
      
        '   IN_DOLAR, IN_FAV_SM, CD_CT_GERENCIAL, CD_FILIAL, NM_APELIDO, ' +
        'NM_ITEM_INGLES, '
      
        '   IN_ITEM_DI, CD_ACESSO, CD_AUX, IN_REEMBOLSO, IN_DIVERSOS, IN_' +
        'CALCULA_IR, '
      
        '   NR_ORDEM_FAT, IN_TRIBUTAVEL, IN_SOLIC_PAGTO, IN_DESP_ALF, IN_' +
        'REEMB_FINANC, '
      
        '   TP_ITEM, CD_IATA, CD_ITEM_CONTABIL, CD_HIST_CONTABIL, IN_CALC' +
        '_IN381, '
      '   TP_FRETE, TP_BASE_CALCULO, CD_VIA_TRANSPORTE)'
      'values'
      
        '  (:CD_ITEM, :NM_ITEM, :CD_TIPO_ITEM, :CD_TIPO_LANC_FAT, :IN_ATI' +
        'VO, :IN_CPMF, '
      
        '   :CD_CT_CONTABIL, :CD_CT_CUSTO, :IN_CONSOLIDA, :CD_FORMA_RATEI' +
        'O, :CD_TIPO_AVON, '
      
        '   :IN_DOLAR, :IN_FAV_SM, :CD_CT_GERENCIAL, :CD_FILIAL, :NM_APEL' +
        'IDO, :NM_ITEM_INGLES, '
      
        '   :IN_ITEM_DI, :CD_ACESSO, :CD_AUX, :IN_REEMBOLSO, :IN_DIVERSOS' +
        ', :IN_CALCULA_IR, '
      
        '   :NR_ORDEM_FAT, :IN_TRIBUTAVEL, :IN_SOLIC_PAGTO, :IN_DESP_ALF,' +
        ' :IN_REEMB_FINANC, '
      
        '   :TP_ITEM, :CD_IATA, :CD_ITEM_CONTABIL, :CD_HIST_CONTABIL, :IN' +
        '_CALC_IN381, '
      '   :TP_FRETE, :TP_BASE_CALCULO, :CD_VIA_TRANSPORTE)')
    DeleteSQL.Strings = (
      'delete from TITEM'
      'where'
      '  CD_ITEM = :OLD_CD_ITEM')
    Left = 208
    Top = 24
  end
  object upd_qry_priori_item_: TUpdateSQL
    ModifySQL.Strings = (
      'update TITEM_PRIORIDADE'
      'set'
      '  NR_PRIORIDADE = :NR_PRIORIDADE'
      'where'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO')
    InsertSQL.Strings = (
      'insert into TITEM_PRIORIDADE'
      '  (CD_ITEM, CD_UNID_NEG, CD_PRODUTO, NR_PRIORIDADE)'
      'values'
      '  (:CD_ITEM, :CD_UNID_NEG, :CD_PRODUTO, :NR_PRIORIDADE)')
    DeleteSQL.Strings = (
      'delete from TITEM_PRIORIDADE'
      'where'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO')
    Left = 176
    Top = 88
  end
  object qry_ttp_frete_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM TTP_FRETE ')
    Left = 40
    Top = 272
    object qry_ttp_frete_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'BROKER.TTP_FRETE.CODIGO'
      FixedChar = True
      Size = 1
    end
    object qry_ttp_frete_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BROKER.TTP_FRETE.DESCRICAO'
      FixedChar = True
      Size = 30
    end
  end
  object ds_ttp_frete: TDataSource
    DataSet = qry_ttp_frete_
    Left = 120
    Top = 272
  end
  object ds_base_calc_frete: TDataSource
    DataSet = qry_ttp_base_calc_frete
    Left = 40
    Top = 336
  end
  object qry_ttp_base_calc_frete: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select * from ttp_base_calc_frete')
    Left = 168
    Top = 336
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
  object ds_tmoeda: TDataSource
    DataSet = qry_moeda_broker_
    Left = 424
    Top = 24
  end
  object qry_moeda_broker_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select cd_moeda, nm_moeda from tmoeda_Broker')
    Left = 512
    Top = 24
    object qry_moeda_broker_cd_moeda: TStringField
      FieldName = 'cd_moeda'
      FixedChar = True
      Size = 3
    end
    object qry_moeda_broker_nm_moeda: TStringField
      FieldName = 'nm_moeda'
      FixedChar = True
      Size = 30
    end
  end
  object ds_torigem_despesa: TDataSource
    DataSet = qry_torigem_despesa
    Left = 288
    Top = 80
  end
  object qry_torigem_despesa: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select * from torigem_despesa where tp_descricao = '#39'0'#39)
    Left = 448
    Top = 88
    object qry_torigem_despesaCD_ORIGEM_DESP: TStringField
      FieldName = 'CD_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.CD_ORIGEM_DESP'
      FixedChar = True
      Size = 1
    end
    object qry_torigem_despesaNM_ORIGEM_DESP: TStringField
      FieldName = 'NM_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.NM_ORIGEM_DESP'
      FixedChar = True
    end
  end
  object ds_tvia_transporte: TDataSource
    DataSet = qry_tvia_transporte
    Left = 400
    Top = 144
  end
  object qry_tvia_transporte: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select CD_VIA_TRANSP, NM_VIA_TRANSP from tvia_transp_BROKER')
    Left = 496
    Top = 144
    object qry_tvia_transporteCD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_tvia_transporteNM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.NM_VIA_TRANSP'
      FixedChar = True
    end
  end
  object ds_tmod_frete: TDataSource
    DataSet = qry_tmod_frete
    Left = 424
    Top = 208
  end
  object qry_tmod_frete: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select * from tmod_frete')
    Left = 504
    Top = 208
    object qry_tmod_freteCD_MOD_FRETE: TStringField
      FieldName = 'CD_MOD_FRETE'
      Origin = 'BROKER.TMOD_FRETE.CD_MOD_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_tmod_freteNM_MOD_FRETE: TStringField
      FieldName = 'NM_MOD_FRETE'
      Origin = 'BROKER.TMOD_FRETE.NM_MOD_FRETE'
      FixedChar = True
    end
  end
  object qry_item_contabil_: TQuery
    OnCalcFields = qry_item_contabil_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT  CD_ITEM_CONTABIL, NM_ITEM_CONTABIL , IN_CONTABILIZA FROM' +
        ' TITEM_CONTABIL'
      ' '
      ' ')
    Left = 504
    Top = 288
    object qry_item_contabil_calc_in_contabiliza: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_in_contabiliza'
      Size = 3
      Calculated = True
    end
    object qry_item_contabil_CD_ITEM_CONTABIL: TStringField
      FieldName = 'CD_ITEM_CONTABIL'
      Origin = 'DBBROKER.TITEM_CONTABIL.CD_ITEM_CONTABIL'
      FixedChar = True
      Size = 3
    end
    object qry_item_contabil_NM_ITEM_CONTABIL: TStringField
      FieldName = 'NM_ITEM_CONTABIL'
      Origin = 'DBBROKER.TITEM_CONTABIL.NM_ITEM_CONTABIL'
      FixedChar = True
      Size = 100
    end
    object qry_item_contabil_IN_CONTABILIZA: TStringField
      FieldName = 'IN_CONTABILIZA'
      Origin = 'DBBROKER.TITEM_CONTABIL.IN_CONTABILIZA'
      FixedChar = True
      Size = 1
    end
  end
end
