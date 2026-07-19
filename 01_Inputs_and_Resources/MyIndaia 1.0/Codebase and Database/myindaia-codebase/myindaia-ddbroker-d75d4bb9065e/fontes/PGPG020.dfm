object datm_imp_adm: Tdatm_imp_adm
  OldCreateOrder = True
  Left = 73
  Top = 189
  Height = 286
  Width = 868
  object ds_ct_contabil: TDataSource
    DataSet = qry_ct_contabil_
    Left = 209
    Top = 70
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM TCT_CONTABIL')
    Left = 209
    Top = 14
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
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 297
    Top = 185
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 297
    Top = 127
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
  object qry_lib_adm_item_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_lib_adm
    SQL.Strings = (
      
        'SELECT S.CD_UNID_NEG, S.DT_LANCTO, S.NR_REF, S.CD_CT_CONTABIL, S' +
        '.NR_LANCAMENTO, S.CD_STATUS_ADM,'
      
        '       ( ISNULL( S.VL_LANCTO, 0 ) - ISNULL( S.VL_DESCONTO, 0 ) )' +
        ' AS VL_LANCTO, S.TP_NATUREZA,'
      
        '       U.DESCRICAO NM_STATUS, C.NM_CT_CONTABIL, UN.END_CIDADE, S' +
        '.NR_CTAAPAGAR'
      'FROM   TADM S,'
      '       TSTATUS_SOLIC_PAGTO U,'
      '       TCT_CONTABIL C,'
      '       TUNID_NEG UN'
      
        'WHERE  S.CD_CT_CONTABIL *= C.CD_CT_CONTABIL AND C.ANO_CONTA = ye' +
        'ar(S.DT_MONTAGEM) AND'
      '       S.CD_STATUS_ADM = U.CODIGO AND'
      '       S.CD_UNID_NEG = UN.CD_UNID_NEG AND'
      '       S.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       S.IN_TED = '#39'0'#39' AND'
      '       S.NR_REF = :NR_REF AND'
      '       S.NR_DOCTO = :NR_DOCTO AND'
      '       S.DT_MONTAGEM = :DT_MONTAGEM AND'
      '       S.TP_NATUREZA = :TP_NATUREZA AND'
      '       ( ( S.CD_BANCO = :CD_BANCO ) or ( :CD_BANCO = '#39#39' ) ) AND'
      '       ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ) ) AND'
      
        '       ( ( SELECT ( ISNULL( VL_LANCTO, 0 ) - ISNULL( VL_DESCONTO' +
        ', 0 ) ) AS VL_LANCTO'
      '           FROM   TADM P'
      '           WHERE  P.CD_UNID_NEG = S.CD_UNID_NEG AND'
      '                  P.DT_LANCTO = S.DT_LANCTO AND'
      '                  P.CD_CT_CONTABIL = S.CD_CT_CONTABIL AND'
      '                  P.TP_NATUREZA = S.TP_NATUREZA AND'
      '                  P.NR_LANCAMENTO = S.NR_LANCAMENTO AND'
      
        '                  P.CD_STATUS_ADM IN ('#39'7'#39', '#39'8'#39', '#39'9'#39', '#39'10'#39', '#39'11'#39',' +
        ' '#39'16'#39', '#39'18'#39')'
      '       ) > 0 ) AND'
      
        '       ( SELECT ( ISNULL( VL_LANCTO, 0 ) - ISNULL( VL_DESCONTO, ' +
        '0 ) ) VL_LANCTO'
      '         FROM   TADM P'
      '         WHERE  P.CD_UNID_NEG = S.CD_UNID_NEG AND'
      '                P.DT_LANCTO = S.DT_LANCTO AND'
      '                P.CD_CT_CONTABIL = S.CD_CT_CONTABIL AND'
      '                P.TP_NATUREZA = S.TP_NATUREZA AND'
      '                P.NR_LANCAMENTO = S.NR_LANCAMENTO AND'
      
        '                P.CD_STATUS_ADM IN ('#39'7'#39', '#39'8'#39', '#39'9'#39', '#39'10'#39', '#39'11'#39', '#39 +
        '16'#39', '#39'18'#39')'
      '       ) IS NOT NULL')
    Left = 111
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_DOCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_MONTAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TP_NATUREZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object qry_lib_adm_item_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_lib_adm_item_DT_LANCTO: TDateTimeField
      FieldName = 'DT_LANCTO'
    end
    object qry_lib_adm_item_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_CT_CONTABIL'
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_lib_adm_item_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Size = 1
    end
    object qry_lib_adm_item_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object qry_lib_adm_item_NR_REF: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_lib_adm_item_CD_STATUS_ADM: TStringField
      FieldName = 'CD_STATUS_ADM'
      Size = 2
    end
    object qry_lib_adm_item_VL_LANCTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCTO'
      DisplayFormat = '#0,.00'
    end
    object qry_lib_adm_item_NM_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'NM_STATUS'
      Size = 30
    end
    object qry_lib_adm_item_NM_CT_CONTABIL: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldName = 'NM_CT_CONTABIL'
      Size = 40
    end
    object qry_lib_adm_item_LookCtContabilRM: TStringField
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
    object qry_lib_adm_item_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object qry_lib_adm_item_NR_CTAAPAGAR: TStringField
      FieldName = 'NR_CTAAPAGAR'
      FixedChar = True
      Size = 3
    end
  end
  object ds_lib_adm_item: TDataSource
    DataSet = qry_lib_adm_item_
    Left = 111
    Top = 70
  end
  object ds_historico: TDataSource
    DataSet = qry_historico_
    Left = 297
    Top = 70
  end
  object qry_historico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_HISTORICO, NM_HISTORICO'
      'FROM   THIST_PADRAO')
    Left = 297
    Top = 14
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
  end
  object qry_status_solic_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TSTATUS_SOLIC_PAGTO')
    Left = 394
    Top = 14
    object qry_status_solic_pagto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TSTATUS_SOLIC_PAGTO.CODIGO'
      Size = 2
    end
    object qry_status_solic_pagto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TSTATUS_SOLIC_PAGTO.DESCRICAO'
      Size = 30
    end
  end
  object ds_status_solic_pagto: TDataSource
    DataSet = qry_status_solic_pagto_
    Left = 394
    Top = 70
  end
  object qry_lib_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT S.CD_UNID_NEG, S.NR_REF, S.DT_MONTAGEM, S.TP_NATUREZA,'
      
        '       ISNULL( ( SELECT SUM( ISNULL( VL_LANCTO, 0 ) - ISNULL( VL' +
        '_DESCONTO, 0 ) )'
      '                 FROM   TADM P'
      '                 WHERE  S.CD_UNID_NEG = P.CD_UNID_NEG AND'
      '                        S.DT_MONTAGEM = P.DT_MONTAGEM AND'
      '                        S.CD_BANCO = P.CD_BANCO AND'
      '                        S.NR_REF = P.NR_REF AND'
      
        '                        ( (S.NR_DOCTO = P.NR_DOCTO) OR (ISNULL(P' +
        '.NR_DOCTO,'#39#39') = '#39#39') ) AND'
      '                        S.TP_NATUREZA = P.TP_NATUREZA AND'
      
        '                        ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS N' +
        'OT NULL ) ) AND'
      
        '                            P.CD_STATUS_ADM IN ('#39'7'#39', '#39'8'#39', '#39'9'#39', '#39 +
        '10'#39', '#39'11'#39', '#39'16'#39', '#39'18'#39') ), 0 ) VL_LANCTO,'
      '       S.CD_BANCO, B.NM_BANCO,'
      
        '       S.CD_FAVORECIDO, F.NM_FAVORECIDO, S.NR_DOCTO, S.CD_STATUS' +
        '_CHEQUE'
      'FROM   TADM S,'
      '       TBANCO B,'
      '       TFAVORECIDO F'
      'WHERE  S.CD_BANCO *= B.CD_BANCO AND'
      '       S.CD_FAVORECIDO *= F.CD_FAVORECIDO AND'
      '       S.IN_TED = '#39'0'#39' AND'
      '       S.DT_MONTAGEM = :DT_MONTAGEM AND'
      '       S.TP_NATUREZA = :TP_NATUREZA AND'
      '       S.TP_LANCAMENTO = :TP_LANCAMENTO AND'
      
        '       ( ( S.CD_UNID_NEG = :CD_UNID_NEG ) or ( :CD_UNID_NEG = '#39#39 +
        ' ) ) AND'
      '       ( ( S.CD_BANCO = :CD_BANCO ) or ( :CD_BANCO = '#39#39' ) ) AND'
      '       ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ) ) AND'
      '       ISNULL('
      
        '       ( SELECT SUM( ISNULL( VL_LANCTO, 0 ) - ISNULL( VL_DESCONT' +
        'O, 0 ) )'
      '         FROM   TADM P'
      '         WHERE  S.CD_UNID_NEG = P.CD_UNID_NEG AND'
      '                S.DT_LANCTO = P.DT_LANCTO AND'
      '                S.NR_REF = P.NR_REF AND'
      
        '                ( (S.NR_DOCTO = P.NR_DOCTO) OR (ISNULL(P.NR_DOCT' +
        'O,'#39#39') = '#39#39') ) AND'
      '                S.TP_NATUREZA = P.TP_NATUREZA AND'
      
        '                ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ' +
        ') ) AND'
      
        '                P.CD_STATUS_ADM IN ('#39'7'#39', '#39'8'#39', '#39'9'#39', '#39'10'#39', '#39'11'#39', '#39 +
        '16'#39', '#39'18'#39') ), 0 ) > 0'
      
        'GROUP BY S.CD_UNID_NEG, S.NR_REF, S.DT_MONTAGEM, S.TP_NATUREZA, ' +
        'S.CD_BANCO, B.NM_BANCO, S.CD_FAVORECIDO, F.NM_FAVORECIDO, S.NR_D' +
        'OCTO, S.CD_STATUS_CHEQUE'
      'ORDER BY S.CD_STATUS_CHEQUE, S.NR_DOCTO')
    Left = 21
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DT_MONTAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TP_NATUREZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TP_LANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object qry_lib_adm_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_lib_adm_NR_REF: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_lib_adm_VL_LANCTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCTO'
      DisplayFormat = '#0,.00'
    end
    object qry_lib_adm_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_lib_adm_NM_BANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'NM_BANCO'
      Size = 40
    end
    object qry_lib_adm_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_lib_adm_NM_FAVORECIDO: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'NM_FAVORECIDO'
      Size = 50
    end
    object qry_lib_adm_NR_DOCTO: TStringField
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NR_DOCTO'
      Size = 6
    end
    object qry_lib_adm_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Size = 1
    end
    object qry_lib_adm_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Size = 1
    end
    object qry_lib_adm_LookStatusCheque: TStringField
      DisplayLabel = 'Status do Cheque'
      FieldKind = fkLookup
      FieldName = 'LookStatusCheque'
      LookupDataSet = qry_status_cheque_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_CHEQUE'
      Size = 25
      Lookup = True
    end
    object qry_lib_adm_DT_MONTAGEM: TDateTimeField
      FieldName = 'DT_MONTAGEM'
    end
  end
  object ds_lib_adm: TDataSource
    DataSet = qry_lib_adm_
    Left = 21
    Top = 70
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 21
    Top = 181
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TBANCO'
      'WHERE CD_BANCO <> '#39#39)
    Left = 21
    Top = 127
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
    object qry_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
    object qry_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NM_BANCO'
      Size = 10
    end
    object qry_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.AP_BANCO'
      Size = 5
    end
    object qry_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 1
    end
    object qry_banco_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TBANCO.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_banco_IN_FINANCEIRO: TStringField
      FieldName = 'IN_FINANCEIRO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TBANCO.TP_CONTA'
      Size = 3
    end
    object qry_banco_LVALOR: TIntegerField
      FieldName = 'LVALOR'
      Origin = 'TBANCO.IN_FINANCEIRO'
    end
    object qry_banco_CVALOR: TIntegerField
      FieldName = 'CVALOR'
      Origin = 'TBANCO.NR_BANCO'
    end
    object qry_banco_LEXTENSO: TIntegerField
      FieldName = 'LEXTENSO'
      Origin = 'TBANCO.LVALOR'
    end
    object qry_banco_CEXTENSO: TIntegerField
      FieldName = 'CEXTENSO'
      Origin = 'TBANCO.CVALOR'
    end
    object qry_banco_LFAVOR: TIntegerField
      FieldName = 'LFAVOR'
      Origin = 'TBANCO.LEXTENSO'
    end
    object qry_banco_CFAVOR: TIntegerField
      FieldName = 'CFAVOR'
      Origin = 'TBANCO.CEXTENSO'
    end
    object qry_banco_LCIDADE: TIntegerField
      FieldName = 'LCIDADE'
      Origin = 'TBANCO.LFAVOR'
    end
    object qry_banco_CCIDADE: TIntegerField
      FieldName = 'CCIDADE'
      Origin = 'TBANCO.CFAVOR'
    end
    object qry_banco_CDIA: TIntegerField
      FieldName = 'CDIA'
      Origin = 'TBANCO.LCIDADE'
    end
    object qry_banco_CANO: TIntegerField
      FieldName = 'CANO'
      Origin = 'TBANCO.CCIDADE'
    end
    object qry_banco_FORMCONT: TBooleanField
      FieldName = 'FORMCONT'
      Origin = 'TBANCO.CANO'
    end
    object qry_banco_LEXTENSO2: TIntegerField
      FieldName = 'LEXTENSO2'
      Origin = 'TBANCO.ANOMASK'
    end
    object qry_banco_CEXTENSO2: TIntegerField
      FieldName = 'CEXTENSO2'
      Origin = 'TBANCO.FORMCONT'
    end
    object qry_banco_CMES: TIntegerField
      FieldName = 'CMES'
      Origin = 'TBANCO.CD_BANCO'
    end
    object qry_banco_LCHEQUE: TIntegerField
      FieldName = 'LCHEQUE'
      Origin = 'TBANCO.CD_BANCO'
    end
    object qry_banco_CCHEQUE: TIntegerField
      FieldName = 'CCHEQUE'
      Origin = 'TBANCO.NM_BANCO'
    end
    object qry_banco_CBANCO: TIntegerField
      FieldName = 'CBANCO'
      Origin = 'TBANCO.NR_CONTA'
    end
    object qry_banco_ANOMASK: TStringField
      FieldName = 'ANOMASK'
      Origin = 'TBANCO.CD_BANCO'
      Size = 4
    end
    object qry_banco_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 1
    end
    object qry_banco_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TBANCO.NR_CONTA'
      Size = 3
    end
    object qry_banco_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TBANCO.AP_BANCO'
      Size = 6
    end
  end
  object ds_solic_adm: TDataSource
    DataSet = qry_solic_adm_
    Left = 111
    Top = 185
  end
  object qry_solic_adm_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_lib_adm_item
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, CD_CT_CONTABIL, DT_LANCTO, NR_LANCAMENTO, NR' +
        '_DOCTO, CD_STATUS_CHEQUE, DT_PAGTO, VL_LANCTO, VL_DESCONTO, CD_S' +
        'TATUS_ADM, TP_NATUREZA, CD_USUARIO_IMP, IN_TRANSF_FIN, NR_REF '
      'FROM   TADM'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_LANCTO = :DT_LANCTO AND'
      '       CD_CT_CONTABIL = :CD_CT_CONTABIL AND'
      '       TP_NATUREZA = :TP_NATUREZA AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 111
    Top = 127
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_NATUREZA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptInput
      end>
    object qry_solic_adm_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 2
    end
    object qry_solic_adm_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TADM.CD_CT_CONTABIL'
      Size = 10
    end
    object qry_solic_adm_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TADM.NR_DOCTO'
      Size = 6
    end
    object qry_solic_adm_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Origin = 'TADM.CD_STATUS_CHEQUE'
      Size = 1
    end
    object qry_solic_adm_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TADM.DT_PAGTO'
    end
    object qry_solic_adm_VL_LANCTO: TFloatField
      FieldName = 'VL_LANCTO'
      Origin = 'TADM.VL_LANCTO'
    end
    object qry_solic_adm_CD_STATUS_ADM: TStringField
      FieldName = 'CD_STATUS_ADM'
      Origin = 'TADM.CD_STATUS_ADM'
      Size = 2
    end
    object qry_solic_adm_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 1
    end
    object qry_solic_adm_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TADM.CD_UNID_NEG'
    end
    object qry_solic_adm_CD_USUARIO_IMP: TStringField
      FieldName = 'CD_USUARIO_IMP'
      Origin = 'TADM.CD_CT_CONTABIL'
      Size = 4
    end
    object qry_solic_adm_IN_TRANSF_FIN: TStringField
      FieldName = 'IN_TRANSF_FIN'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 1
    end
    object qry_solic_adm_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
    object qry_solic_adm_DT_LANCTO: TDateTimeField
      FieldName = 'DT_LANCTO'
      Origin = 'TADM.CD_UNID_NEG'
    end
    object qry_solic_adm_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 3
    end
  end
  object ds_solic_adm_pend: TDataSource
    DataSet = qry_solic_adm_pend_
    Left = 394
    Top = 185
  end
  object qry_solic_adm_pend_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, DT_LANCTO, CD_CT_CONTABIL, CD_STATUS_ADM, DT' +
        '_PAGTO, NR_REF'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_LANCTO = :DT_LANCTO AND'
      '       CD_CT_CONTABIL = :CD_CT_CONTABIL AND'
      '       TP_NATUREZA = :TP_NATUREZA AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 394
    Top = 127
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_NATUREZA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptInput
      end>
    object qry_solic_adm_pend_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TADM.CD_UNID_NEG'
      Size = 2
    end
    object qry_solic_adm_pend_DT_LANCTO: TDateTimeField
      FieldName = 'DT_LANCTO'
      Origin = 'TADM.DT_LANCTO'
    end
    object qry_solic_adm_pend_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TADM.CD_CT_CONTABIL'
      Size = 10
    end
    object qry_solic_adm_pend_CD_STATUS_ADM: TStringField
      FieldName = 'CD_STATUS_ADM'
      Origin = 'TADM.CD_STATUS_ADM'
      Size = 2
    end
    object qry_solic_adm_pend_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TADM.DT_PAGTO'
    end
    object qry_solic_adm_pend_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TADM.NR_REF'
      Size = 3
    end
  end
  object sp_distribui_adm: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_adm'
    Left = 779
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_natureza'
        ParamType = ptInput
      end>
    object StringField17: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField18: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_status_cheque_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TSTATUS_CHEQUE')
    Left = 206
    Top = 127
    object qry_status_cheque_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TSTATUS_CHEQUE.CODIGO'
      Size = 1
    end
    object qry_status_cheque_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TSTATUS_CHEQUE.DESCRICAO'
      Size = 25
    end
  end
  object ds_status_cheque: TDataSource
    DataSet = qry_status_cheque_
    Left = 206
    Top = 185
  end
  object qry_limpa_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_lib_adm_item
    SQL.Strings = (
      'UPDATE TADM'
      'SET    CD_USUARIO_IMP = '#39#39
      'WHERE  CD_USUARIO_IMP = :CD_USUARIO_IMP')
    Left = 501
    Top = 14
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO_IMP'
        ParamType = ptInput
      end>
  end
  object qry_caixa_ctrl_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(DT_MOVIMENTO) + 1 DT_MOVIMENTO'
      'FROM   TCAIXA_CONTROLE'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 589
    Top = 14
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
  end
  object qry_ult_ref_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RIGHT( '#39'000'#39' + CONVERT( varchar, ( CONVERT( int, ISNULL( ' +
        'MAX( NR_REF ), '#39'000'#39' ) ) + 1 ) ), 3 ) ULT_REF'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CONVERT( datetime, DT_PAGTO, 103 ) = :DT_PAGTO')
    Left = 589
    Top = 70
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO'
        ParamType = ptInput
      end>
    object qry_ult_ref_ULT_REF: TStringField
      FieldName = 'ULT_REF'
      Size = 3
    end
  end
  object sp_reemite_cheque_adm: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_reemite_cheque_adm'
    Left = 779
    Top = 70
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_novo_cheque'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_base'
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
  object qry_ult_nota_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( MAX( NR_NOTA_FATURA ), ( SELECT NR_ULT_NOTA'
      
        '                                        FROM   TPARAMETROS ) ) A' +
        'S NR_NOTA_FAT'
      'FROM   TS_FATURA'
      'WHERE  TP_TIPO_FAT = '#39'N'#39' ')
    Left = 501
    Top = 185
    object qry_ult_nota_fat_NR_NOTA_FAT: TStringField
      FieldName = 'NR_NOTA_FAT'
      Origin = 'TS_FATURA.NR_NOTA_FATURA'
      Size = 6
    end
  end
  object qry_ult_nota_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( MAX( NR_DOCTO ), '#39'0'#39' ) NR_NOTA_ADM'
      'FROM   TADM'
      'WHERE  TP_LANCAMENTO = '#39'N'#39' ')
    Left = 501
    Top = 127
    object qry_ult_nota_adm_NR_NOTA_ADM: TStringField
      FieldName = 'NR_NOTA_ADM'
      Origin = 'TADM.NR_DOCTO'
      Size = 6
    end
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG , NM_UNID_NEG , IN_ATIVO'
      'FROM TUNID_NEG TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 501
    Top = 70
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
    object qry_unidade_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unidade_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 50
    end
    object qry_unidade_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG.IN_ATIVO'
      Size = 1
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
    Left = 677
    Top = 14
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_NATUREZA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptInput
      end>
    object qry_rel_liq_TOT_LIQ: TIntegerField
      FieldName = 'TOT_LIQ'
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
    Left = 589
    Top = 185
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptInput
      end>
    object qry_ult_lancto_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
  end
  object qry_ins_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'INSERT TADM ( CD_UNID_NEG, DT_LANCTO, CD_CT_CONTABIL, TP_NATUREZ' +
        'A, NR_LANCAMENTO,'
      
        '              NR_REF, CD_FAVORECIDO, CD_ACESSO, CD_AUX, CD_BANCO' +
        ', NR_DOCTO, VL_LANCTO,'
      
        '              CD_STATUS_ADM, CD_USUARIO_SOLIC, CD_USUARIO_MONTA,' +
        ' IN_SOLICITADO,'
      
        '              DT_VENCTO, DT_PAGTO, CD_HISTORICO, CD_STATUS_CHEQU' +
        'E, IN_TRANSF_FIN,'
      
        '              VL_DESCONTO, VL_PERC_DESCONTO, CD_USUARIO_IMP, TX_' +
        'HISTORICO, TP_LANCAMENTO,'
      '              NR_RELATORIO, NR_ANO, CD_CT_CUSTO )'
      
        'SELECT CD_UNID_NEG, DT_LANCTO, CD_CT_CONTABIL, TP_NATUREZA, :NR_' +
        'NOVO_LANCAMENTO,'
      
        '       NULL, CD_FAVORECIDO, CD_ACESSO, CD_AUX, CD_BANCO, NULL, V' +
        'L_LANCTO,'
      
        '       '#39'16'#39', CD_USUARIO_SOLIC, NULL, '#39'1'#39', DT_VENCTO, DT_PAGTO, C' +
        'D_HISTORICO,'
      
        '       '#39'0'#39', '#39'0'#39', VL_DESCONTO, VL_PERC_DESCONTO, CD_USUARIO_IMP, ' +
        'TX_HISTORICO, TP_LANCAMENTO,'
      '       NR_RELATORIO, NR_ANO, CD_CT_CUSTO'
      'FROM   TADM'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_LANCTO = :DT_LANCTO AND'
      '       CD_CT_CONTABIL = :CD_CT_CONTABIL AND'
      '       TP_NATUREZA = :TP_NATUREZA AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 589
    Top = 127
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_NOVO_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_LANCTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_NATUREZA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
  end
  object qry_ct_contabilRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM   TCONTABIL_PLANO'
      'WHERE  CD_COLIGADA = '#39'01'#39)
    Left = 677
    Top = 127
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
  object qry_cidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT END_CIDADE'
      'FROM   TPROCESSO P, TUNID_NEG U'
      'WHERE  P.NR_PROCESSO = :NR_PROCESSO AND'
      '       P.CD_UNID_NEG = U.CD_UNID_NEG')
    Left = 677
    Top = 70
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_cidade_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TUNID_NEG.END_CIDADE'
      Size = 30
    end
  end
  object sp_distribui_adminis: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_adminis'
    Left = 779
    Top = 127
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_canc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_natureza'
        ParamType = ptInput
      end>
  end
end
