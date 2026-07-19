object datm_solic_adm: Tdatm_solic_adm
  OldCreateOrder = True
  Left = 75
  Top = 227
  Height = 234
  Width = 832
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 132
    Top = 83
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 133
    Top = 26
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
  object ds_usuario: TDataSource
    DataSet = qry_usuario_
    Left = 605
    Top = 83
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM TUSUARIO')
    Left = 605
    Top = 26
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT HM_PARA_SOLIC_CH, CD_SISTEMA_CONTABIL'
      'FROM TPARAMETROS')
    Left = 684
    Top = 26
    object qry_param_HM_PARA_SOLIC_CH: TStringField
      FieldName = 'HM_PARA_SOLIC_CH'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 5
    end
    object qry_param_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 1
    end
  end
  object qry_solic_adm_: TQuery
    AfterInsert = qry_solic_adm_AfterInsert
    AfterEdit = qry_solic_adm_AfterEdit
    AfterPost = qry_solic_adm_AfterPost
    AfterCancel = qry_solic_adm_AfterCancel
    AfterScroll = qry_solic_adm_AfterScroll
    OnCalcFields = qry_solic_adm_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TADM'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      'DT_LANCTO = :DT_LANCTO')
    Left = 48
    Top = 26
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_LANCTO'
        ParamType = ptUnknown
      end>
    object qry_solic_adm_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 2
    end
    object qry_solic_adm_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
    object qry_solic_adm_DT_LANCTO: TDateTimeField
      FieldName = 'DT_LANCTO'
      Origin = 'TADM.CD_UNID_NEG'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_solic_adm_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TADM.NR_REF'
      Size = 3
    end
    object qry_solic_adm_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TADM.CD_FAVORECIDO'
      OnChange = qry_solic_adm_CD_FAVORECIDOChange
      Size = 5
    end
    object qry_solic_adm_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TADM.CD_BANCO'
      Size = 3
    end
    object qry_solic_adm_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TADM.NR_DOCTO'
      Size = 6
    end
    object qry_solic_adm_VL_LANCTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCTO'
      Origin = 'TADM.VL_LANCTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_adm_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TADM.TP_NATUREZA'
      OnChange = qry_solic_adm_TP_NATUREZAChange
      Size = 1
    end
    object qry_solic_adm_CD_USUARIO_SOLIC: TStringField
      FieldName = 'CD_USUARIO_SOLIC'
      Origin = 'TADM.CD_USUARIO_SOLIC'
      Size = 4
    end
    object qry_solic_adm_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      Origin = 'TADM.CD_USUARIO_MONTA'
      Size = 4
    end
    object qry_solic_adm_IN_SOLICITADO: TStringField
      FieldName = 'IN_SOLICITADO'
      Origin = 'TADM.IN_SOLICITADO'
      Size = 1
    end
    object qry_solic_adm_CD_STATUS_ADM: TStringField
      FieldName = 'CD_STATUS_ADM'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 2
    end
    object qry_solic_adm_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 1
    end
    object qry_solic_adm_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TADM.DT_LANCTO'
      Size = 3
    end
    object qry_solic_adm_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TADM.NR_LANCTO'
      OnChange = qry_solic_adm_CD_CT_CONTABILChange
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_solic_adm_DT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
      Origin = 'TADM.DT_LANCTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_solic_adm_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TADM.NR_LANCTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_solic_adm_CD_HISTORICO: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_HISTORICO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
    object qry_solic_adm_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TADM.CD_CT_CONTABIL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_adm_VL_PERC_DESCONTO: TFloatField
      FieldName = 'VL_PERC_DESCONTO'
      Origin = 'TADM.NR_REF'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_adm_TX_HISTORICO: TMemoField
      FieldName = 'TX_HISTORICO'
      Origin = 'TADM.CD_CT_CONTABIL'
      BlobType = ftMemo
    end
    object qry_solic_adm_NR_RELATORIO: TStringField
      FieldName = 'NR_RELATORIO'
      Origin = 'TADM.TP_NATUREZA'
      Size = 3
    end
    object qry_solic_adm_NR_ANO: TStringField
      FieldName = 'NR_ANO'
      Origin = 'TADM.NR_REF'
      Size = 4
    end
    object qry_solic_adm_LookUnidNeg: TStringField
      DisplayLabel = 'Unidade Neg'#243'cio'
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_solic_adm_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkLookup
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_solic_adm_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldKind = fkLookup
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_solic_adm_LookUsuarioMonta: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUsuarioMonta'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'NM_USUARIO'
      KeyFields = 'CD_USUARIO_MONTA'
      Size = 50
      Lookup = True
    end
    object qry_solic_adm_LookUsuarioSolic: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUsuarioSolic'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'NM_USUARIO'
      KeyFields = 'CD_USUARIO_SOLIC'
      Size = 50
      Lookup = True
    end
    object qry_solic_adm_LookAcesso: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAcesso'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_ACESSO'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 1
      Lookup = True
    end
    object qry_solic_adm_LookAux: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAux'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_AUX'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 3
      Lookup = True
    end
    object qry_solic_adm_LookSolicitado: TStringField
      DisplayLabel = 'Solicitado'
      FieldKind = fkLookup
      FieldName = 'LookSolicitado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_SOLICITADO'
      Size = 3
      Lookup = True
    end
    object qry_solic_adm_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_adm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_ADM'
      Size = 30
      Lookup = True
    end
    object qry_solic_adm_LookCtContabil: TStringField
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
    object qry_solic_adm_LookHistorico: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldKind = fkLookup
      FieldName = 'LookHistorico'
      LookupDataSet = qry_historico_
      LookupKeyFields = 'CD_HISTORICO'
      LookupResultField = 'NM_HISTORICO'
      KeyFields = 'CD_HISTORICO'
      Size = 50
      Lookup = True
    end
    object qry_solic_adm_CalcVlTotal: TFloatField
      DisplayLabel = 'Valor'
      FieldKind = fkCalculated
      FieldName = 'CalcVlTotal'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_solic_adm_TP_LANCAMENTO: TStringField
      FieldName = 'TP_LANCAMENTO'
      Origin = 'TADM.TP_NATUREZA'
      Size = 1
    end
    object qry_solic_adm_LookCtContabilRM: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtContabilRM'
      LookupDataSet = qry_ct_contabilRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_solic_adm_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TADM.CD_CT_CUSTO'
      FixedChar = True
      Size = 4
    end
    object qry_solic_adm_LookCusto: TStringField
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'LookCusto'
      LookupDataSet = qry_ct_custo_
      LookupKeyFields = 'CD_CT_CUSTO'
      LookupResultField = 'NM_CT_CUSTO'
      KeyFields = 'CD_CT_CUSTO'
      Size = 40
      Lookup = True
    end
  end
  object ds_solic_adm: TDataSource
    DataSet = qry_solic_adm_
    Left = 48
    Top = 83
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 410
    Top = 83
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO')
    Left = 410
    Top = 26
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
  end
  object qry_status_solic_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TSTATUS_SOLIC_PAGTO')
    Left = 503
    Top = 26
    object qry_status_solic_adm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TSTATUS_SOLIC_PAGTO.CODIGO'
      Size = 2
    end
    object qry_status_solic_adm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TSTATUS_SOLIC_PAGTO.DESCRICAO'
      Size = 30
    end
  end
  object ds_status_solic_adm: TDataSource
    DataSet = qry_status_solic_adm_
    Left = 503
    Top = 83
  end
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 218
    Top = 83
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 218
    Top = 26
    object qry_favorecido_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favorecido_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
  end
  object qry_ct_contabil_unica_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT DISTINCT CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCT_CONTABIL'
      
        'WHERE  CD_ACESSO+CD_AUX = :CD_ACESSO_AUX AND CD_IDENTIFICADOR = ' +
        #39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 319
    Top = 26
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
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX FROM TC' +
        'T_CONTABIL'
      'WHERE CD_IDENTIFICADOR = '#39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 319
    Top = 83
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
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 684
    Top = 83
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
    object tbl_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Required = True
    end
  end
  object qry_historico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_HISTORICO, NM_HISTORICO, TX_HISTORICO'
      'FROM THIST_PADRAO')
    Left = 48
    Top = 138
    object qry_historico_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'THIST_PADRAO.CD_HISTORICO'
      Size = 3
    end
    object qry_historico_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'THIST_PADRAO.NM_HISTORICO'
      Size = 50
    end
    object qry_historico_TX_HISTORICO: TMemoField
      FieldName = 'TX_HISTORICO'
      Origin = 'THIST_PADRAO.CD_HISTORICO'
      BlobType = ftMemo
    end
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_solic_adm
    SQL.Strings = (
      'SELECT E.CD_EMPRESA CD_CLIENTE, E.CD_GRUPO'
      'FROM   TEMPRESA_NAC E, TFAVORECIDO F'
      'WHERE  E.CGC_EMPRESA = F.CGC_EMPRESA AND'
      '       F.CD_FAVORECIDO = :CD_FAVORECIDO AND'
      '       ISNULL( F.CGC_EMPRESA, '#39#39' ) <> '#39#39)
    Left = 132
    Top = 138
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_FAVORECIDO'
        ParamType = ptUnknown
      end>
    object qry_cliente_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TEMPRESA_NAC.CD_GRUPO'
      Size = 3
    end
  end
  object qry_ult_lancto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ISNULL( RIGHT( '#39'000'#39' + CONVERT( varchar(3), (CONVERT( int' +
        ', MAX( ISNULL( NR_LANCAMENTO, '#39'000'#39' ) ) ) + 1 ) ), 3 ), '#39'001'#39' ) ' +
        'NR_LANCAMENTO'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_LANCTO = :DT_LANCTO'
      '')
    Left = 319
    Top = 138
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptUnknown
      end>
    object qry_ult_lancto_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
  end
  object qry_rel_liq_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT_LIQ'
      'FROM   TADM A, TFAVORECIDO F, TEMPRESA_NAC E'
      'WHERE  A.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       A.DT_LANCTO = :DT_LANCTO AND'
      '       A.CD_CT_CONTABIL = :CD_CT_CONTABIL AND'
      '       A.TP_NATUREZA = :TP_NATUREZA AND'
      '       A.NR_LANCAMENTO = :NR_LANCAMENTO AND'
      '       A.CD_FAVORECIDO = F.CD_FAVORECIDO AND'
      '       F.CGC_EMPRESA = E.CGC_EMPRESA AND'
      '       A.CD_STATUS_ADM NOT IN ( '#39'4'#39', '#39'17'#39' ) AND'
      '       ISNULL( A.NR_DOCTO, '#39#39' ) <> '#39#39' AND'
      
        '       A.CD_CT_CONTABIL NOT IN ( '#39'6110102800'#39', '#39'6410509100'#39' ) AN' +
        'D'
      '       E.CD_GRUPO IN ( SELECT E.CD_GRUPO '
      
        '                       FROM   TLIQUIDACAO L, TPROCESSO P, TEMPRE' +
        'SA_NAC E'
      '                       WHERE  L.NR_PROCESSO = P.NR_PROCESSO AND'
      '                              P.CD_CLIENTE = E.CD_EMPRESA AND'
      '                              L.IN_CANCELADO = '#39'0'#39' AND'
      
        '                              L.NR_RELATORIO = A.NR_RELATORIO AN' +
        'D'
      '                              L.NR_ANO = A.NR_ANO )'
      '')
    Left = 409
    Top = 138
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TP_NATUREZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_rel_liq_TOT_LIQ: TIntegerField
      FieldName = 'TOT_LIQ'
    end
  end
  object qry_ct_contabilRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM   TCONTABIL_PLANO'
      'WHERE  CD_COLIGADA = '#39'01'#39)
    Left = 218
    Top = 138
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
  object ds_ct_custo: TDataSource
    DataSet = qry_ct_custo_
    Left = 762
    Top = 83
  end
  object qry_ct_custo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CUSTO, NM_CT_CUSTO'
      'FROM TCONTABIL_CUSTO'
      'WHERE CD_COLIGADA = '#39'01'#39)
    Left = 762
    Top = 26
    object qry_ct_custo_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TCONTABIL_CUSTO.CD_CT_CUSTO'
      FixedChar = True
      Size = 4
    end
    object qry_ct_custo_NM_CT_CUSTO: TStringField
      FieldName = 'NM_CT_CUSTO'
      Origin = 'DBBROKER.TCONTABIL_CUSTO.NM_CT_CUSTO'
      FixedChar = True
      Size = 40
    end
  end
end
