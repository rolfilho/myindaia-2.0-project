object datm_sel_fat1: Tdatm_sel_fat1
  Left = 145
  Top = 149
  Height = 569
  Width = 750
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 34
    Top = 73
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 34
    Top = 17
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
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 127
    Top = 73
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 127
    Top = 17
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
  object ds_grd_sol: TDataSource
    DataSet = qry_grd_sol_
    Left = 34
    Top = 305
  end
  object qry_fat_sol_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_grd_sol
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, CD_PRODUTO, NR_SOLICITACAO, IN_SELECIONADO, ' +
        'CD_USUARIO_IMP,'
      
        '       IN_IMPRESSO, DT_IMPRESSAO, DT_NF_SERV, TP_TIPO_FAT, DT_VE' +
        'NCTO_FATURA,'
      
        '       NR_NOTA_FATURA, TX_OBSERVACOES, DT_FATURA, NR_NF_SERV, IN' +
        '_IMP_NF_SERV, CD_UNID_NEG_FAT '
      'FROM   TS_FATURA'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       NR_SOLICITACAO = :NR_SOLICITACAO')
    Params.Data = {
      010003000B43445F554E49445F4E454700010200300001000A43445F50524F44
      55544F00010200300001000E4E525F534F4C494349544143414F000102003000
      0100}
    Left = 317
    Top = 232
    object qry_fat_sol_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TS_FATURA.CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_sol_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TS_FATURA.CD_PRODUTO'
      Size = 2
    end
    object qry_fat_sol_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TS_FATURA.NR_SOLICITACAO'
      Size = 6
    end
    object qry_fat_sol_IN_IMPRESSO: TStringField
      FieldName = 'IN_IMPRESSO'
      Origin = 'TS_FATURA.IN_IMPRESSO'
      Size = 1
    end
    object qry_fat_sol_DT_IMPRESSAO: TDateTimeField
      FieldName = 'DT_IMPRESSAO'
      Origin = 'TS_FATURA.DT_IMPRESSAO'
    end
    object qry_fat_sol_TP_TIPO_FAT: TStringField
      FieldName = 'TP_TIPO_FAT'
      Origin = 'TS_FATURA.TP_TIPO_FAT'
      Size = 1
    end
    object qry_fat_sol_NR_NOTA_FATURA: TStringField
      FieldName = 'NR_NOTA_FATURA'
      Origin = 'TS_FATURA.NR_NOTA_FATURA'
      Size = 6
    end
    object qry_fat_sol_TX_OBSERVACOES: TMemoField
      FieldName = 'TX_OBSERVACOES'
      Origin = 'TS_FATURA.TX_OBSERVACOES'
      BlobType = ftMemo
    end
    object qry_fat_sol_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TS_FATURA.DT_FATURA'
    end
    object qry_fat_sol_NR_NF_SERV: TStringField
      FieldName = 'NR_NF_SERV'
      Origin = 'TS_FATURA.CD_UNID_NEG'
      Size = 6
    end
    object qry_fat_sol_IN_IMP_NF_SERV: TStringField
      FieldName = 'IN_IMP_NF_SERV'
      Origin = 'TS_FATURA.CD_PRODUTO'
      Size = 1
    end
    object qry_fat_sol_DT_NF_SERV: TDateTimeField
      FieldName = 'DT_NF_SERV'
      Origin = 'TS_FATURA.CD_UNID_NEG'
    end
    object qry_fat_sol_CD_USUARIO_IMP: TStringField
      FieldName = 'CD_USUARIO_IMP'
      Origin = 'TS_FATURA.CD_UNID_NEG'
      Size = 4
    end
    object qry_fat_sol_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TS_FATURA.CD_UNID_NEG'
      Size = 1
    end
    object qry_fat_sol_DT_VENCTO_FATURA: TDateTimeField
      FieldName = 'DT_VENCTO_FATURA'
      Origin = 'TS_FATURA.CD_UNID_NEG'
    end
    object qry_fat_sol_CD_UNID_NEG_FAT: TStringField
      FieldName = 'CD_UNID_NEG_FAT'
      Origin = 'TS_FATURA.CD_UNID_NEG'
      Size = 2
    end
  end
  object ds_fat_proc: TDataSource
    DataSet = qry_fat_proc_
    Left = 417
    Top = 305
  end
  object qry_ult_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ISNULL( MAX( NR_NOTA_FATURA ), ( SELECT ISNULL( NR_NOTA_F' +
        'ATURA, '#39'000000'#39' )'
      '                                        FROM   TUNID_NEG'
      
        '                                        WHERE  CD_UNID_NEG = :CD' +
        '_UNID_NEG ) ) AS NR_ULT_FATURA'
      'FROM   TS_FATURA'
      'WHERE  TP_TIPO_FAT IN ( '#39'D'#39', '#39'F'#39' ) AND'
      '       CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {
      010002000B43445F554E49445F4E454700010200300000000B43445F554E4944
      5F4E45470001020030000000}
    Left = 221
    Top = 17
    object qry_ult_fat_NR_ULT_FATURA: TStringField
      FieldName = 'NR_ULT_FATURA'
      Size = 6
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ISNULL( VL_ALIQ_IR, 0 ) VL_ALIQ_IR, NM_CID_CHEQUE, CD_MOD' +
        '_FAT, CD_MOD_NF_SERV,'
      '       NR_ULT_NOTA'
      'FROM   TPARAMETROS')
    Left = 221
    Top = 73
    object qry_param_VL_ALIQ_IR: TFloatField
      FieldName = 'VL_ALIQ_IR'
      Origin = 'TPARAMETROS.VL_ALIQ_IR'
    end
    object qry_param_NM_CID_CHEQUE: TStringField
      FieldName = 'NM_CID_CHEQUE'
      Origin = 'TPARAMETROS.NM_CID_CHEQUE'
    end
    object qry_param_CD_MOD_FAT: TStringField
      FieldName = 'CD_MOD_FAT'
      Origin = 'TPARAMETROS.VL_ALIQ_IR'
      Size = 1
    end
    object qry_param_CD_MOD_NF_SERV: TStringField
      FieldName = 'CD_MOD_NF_SERV'
      Size = 1
    end
    object qry_param_NR_ULT_NOTA: TStringField
      FieldName = 'NR_ULT_NOTA'
      Size = 6
    end
  end
  object ds_processo: TDataSource
    Left = 317
    Top = 133
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_EMPRESA, NM_EMPRESA, END_EMPRESA, END_NUMERO, END_CIDA' +
        'DE, END_BAIRRO, END_UF, CGC_EMPRESA, CPF_EMPRESA, END_CEP, IE_EM' +
        'PRESA'
      'FROM TEMPRESA_NAC'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Params.Data = {010001000A43445F454D50524553410001020030000000}
    Left = 530
    Top = 17
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_cliente_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Origin = 'TEMPRESA_NAC.END_EMPRESA'
      Size = 50
    end
    object qry_cliente_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'TEMPRESA_NAC.END_NUMERO'
      Size = 6
    end
    object qry_cliente_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TEMPRESA_NAC.END_CIDADE'
      Size = 30
    end
    object qry_cliente_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Origin = 'TEMPRESA_NAC.END_BAIRRO'
      Size = 30
    end
    object qry_cliente_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'TEMPRESA_NAC.END_UF'
      Size = 2
    end
    object qry_cliente_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TEMPRESA_NAC.CGC_EMPRESA'
      Size = 14
    end
    object qry_cliente_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Origin = 'TEMPRESA_NAC.CPF_EMPRESA'
      Size = 11
    end
    object qry_cliente_END_CEP: TStringField
      FieldName = 'END_CEP'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 8
    end
    object qry_cliente_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
    end
  end
  object qry_fat_cc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TFATURAMENTO_CC'
      'WHERE'
      '( NR_PROCESSO IN ( SELECT NR_PROCESSO'
      '                   FROM   TS_FATURA_PROCESSO'
      '                   WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '                          CD_PRODUTO = :CD_PRODUTO AND'
      
        '                           NR_SOLICITACAO = :NR_SOLICITACAO ) ) ' +
        'AND'
      '( IN_CANCELADO = '#39'0'#39' ) AND'
      '( DT_LANCAMENTO <='
      '  ( SELECT MAX(DT_MOVIMENTO)'
      '    FROM   TS_FATURA_CONTROLE'
      '    WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '           CD_PRODUTO = :CD_PRODUTO ) ) AND'
      '('
      
        ' ( ( ISNULL( IN_FATURADO, '#39'0'#39' ) = '#39'0'#39' ) AND ( :TP_TIPO_FAT IN ( ' +
        #39'F'#39', '#39'N'#39' ) ) AND NOT EXISTS'
      '    ( SELECT *'
      '      FROM   TS_FATURA'
      '      WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '             CD_PRODUTO = :CD_PRODUTO AND'
      '             NR_SOLICITACAO = :NR_SOLICITACAO AND'
      '             IN_CALCULADO = '#39'1'#39' AND'
      '             IN_CANCELADO = '#39'0'#39' ) ) OR'
      ' ( ( ISNULL( IN_FATURADO, '#39'0'#39' ) <> '#39'0'#39' AND'
      '     CD_UNID_NEG = :CD_UNID_NEG AND'
      '     CD_PRODUTO = :CD_PRODUTO AND'
      '     NR_SOLIC_FAT = :NR_SOLICITACAO ) AND EXISTS'
      '    ( SELECT *'
      '      FROM   TS_FATURA'
      '      WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '             CD_PRODUTO = :CD_PRODUTO AND'
      '             NR_SOLICITACAO = :NR_SOLICITACAO AND'
      '             IN_CALCULADO = '#39'1'#39' AND'
      '             IN_CANCELADO = '#39'0'#39' ) )'
      'OR'
      ' (  ( :TP_TIPO_FAT = '#39'D'#39' ) AND'
      
        '  CD_ITEM NOT IN ( SELECT CD_ITEM_COMISSAO FROM TPARAMETROS ) AN' +
        'D'
      '  CD_ITEM NOT IN ( SELECT CD_ITEM_IR FROM TPARAMETROS ) AND'
      '  CD_ITEM NOT IN ( SELECT CD_ITEM_ISS FROM TPARAMETROS ) AND'
      
        '  CD_ITEM NOT IN ( SELECT CD_ITEM_EXT_RECEB FROM TPARAMETROS ) A' +
        'ND'
      
        '  CD_ITEM NOT IN ( SELECT CD_ITEM_EXT_PAGTO FROM TPARAMETROS ) A' +
        'ND'
      
        '  CD_ITEM NOT IN ( SELECT CD_ITEM_PAGTO_SD FROM TPARAMETROS ) AN' +
        'D'
      
        '  CD_ITEM NOT IN ( SELECT CD_ITEM_RECEB_SD FROM TPARAMETROS ) AN' +
        'D'
      
        '  CD_ITEM NOT IN ( SELECT CD_ITEM_SALDO_CRE FROM TPARAMETROS ) A' +
        'ND'
      '  CD_ITEM NOT IN ( SELECT CD_ITEM_SALDO_DEB FROM TPARAMETROS )'
      ' )'
      ''
      ')'
      ''
      'AND'
      ''
      '( CD_ITEM IN ( SELECT I.CD_ITEM'
      '               FROM   TITEM I, TTIPO_ITEM T'
      '               WHERE  I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '                      T.IN_FATURAR = '#39'1'#39' ) )'
      '')
    Params.Data = {
      010010000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F00010200300000000E4E525F534F4C494349544143414F000102003000
      00000B43445F554E49445F4E454700010200300000000A43445F50524F445554
      4F00010200300000000B54505F5449504F5F46415400010200300000000B4344
      5F554E49445F4E454700010200300000000A43445F50524F4455544F00010200
      300000000E4E525F534F4C494349544143414F00010200300000000B43445F55
      4E49445F4E454700010200300000000A43445F50524F4455544F000102003000
      00000E4E525F534F4C494349544143414F00010200300000000B43445F554E49
      445F4E454700010200300000000A43445F50524F4455544F0001020030000000
      0E4E525F534F4C494349544143414F00010200300000000B54505F5449504F5F
      4641540001020030000000}
    Left = 647
    Top = 17
    object qry_fat_cc_DT_LANCAMENTO: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
      Origin = 'TFATURAMENTO_CC.DT_LANCAMENTO'
    end
    object qry_fat_cc_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TFATURAMENTO_CC.CD_ITEM'
      Size = 3
    end
    object qry_fat_cc_VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      Origin = 'TFATURAMENTO_CC.VL_ITEM'
    end
    object qry_fat_cc_CD_FORMA_PAGTO: TStringField
      FieldName = 'CD_FORMA_PAGTO'
      Origin = 'TFATURAMENTO_CC.DT_LANCAMENTO'
      Size = 1
    end
    object qry_fat_cc_LookNomeItem: TStringField
      FieldName = 'LookNomeItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_fat_cc_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TFATURAMENTO_CC.DT_LANCAMENTO'
      Size = 1
    end
    object qry_fat_cc_NM_ITEM_COMPLEMENTO: TStringField
      FieldName = 'NM_ITEM_COMPLEMENTO'
    end
  end
  object qry_fatura_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TX_OBSERVACOES, VL_FATURA'
      'FROM TS_FATURA'
      'WHERE NR_SOLICITACAO = :NR_SOLICITACAO')
    Params.Data = {010001000E4E525F534F4C494349544143414F0001020030000000}
    Left = 530
    Top = 73
    object qry_fatura_TX_OBSERVACOES: TMemoField
      FieldName = 'TX_OBSERVACOES'
      Origin = 'TS_FATURA.TX_OBSERVACOES'
      BlobType = ftMemo
    end
    object qry_fatura_VL_FATURA: TFloatField
      FieldName = 'VL_FATURA'
      Origin = 'TS_FATURA.TX_OBSERVACOES'
      DisplayFormat = '#0,.0000'
    end
  end
  object qry_di_: TQuery
    OnCalcFields = qry_di_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DT_REGISTRO_DI, NR_DECLARACAO_IMP, PB_CARGA, IN_MOEDA_UNI' +
        'CA, VL_TOT_MLE_MNEG, CD_MOEDA_MLE, TX_MLE,'
      
        '       VL_TOTAL_MLE_MN, VL_TOT_DESPS_MN, VL_TOTAL_FRETE_MN, VL_T' +
        'OTAL_SEG_MN, VL_TOTAL_ACRESCIMOS_MN,'
      '       VL_TOTAL_DEDUCOES_MN '
      'FROM TDECLARACAO_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 127
    Top = 133
    object qry_di_CalcVlrTotalFOB: TFloatField
      FieldName = 'CalcVlrTotalFOB'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
      Calculated = True
    end
    object qry_di_CalcVlrTotalCIF: TFloatField
      FieldName = 'CalcVlrTotalCIF'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
      Calculated = True
    end
    object qry_di_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_di_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_REGISTRO_DI'
      Size = 8
    end
    object qry_di_PB_CARGA: TFloatField
      FieldName = 'PB_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.PB_CARGA'
    end
    object qry_di_IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_MOEDA_UNICA'
    end
    object qry_di_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_MLE'
    end
    object qry_di_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_MLE_MNEG'
    end
    object qry_di_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_MLE_MN'
    end
    object qry_di_VL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_DESPS_MN'
    end
    object qry_di_VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_FRETE_MN'
    end
    object qry_di_VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_SEG_MN'
    end
    object qry_di_VL_TOTAL_ACRESCIMOS_MN: TFloatField
      FieldName = 'VL_TOTAL_ACRESCIMOS_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_ACRESCIMOS_MN'
    end
    object qry_di_VL_TOTAL_DEDUCOES_MN: TFloatField
      FieldName = 'VL_TOTAL_DEDUCOES_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_DEDUCOES_MN'
    end
    object qry_di_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_REGISTRO_DI'
      Size = 10
    end
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM TITEM'
      'WHERE CD_ITEM <> '#39#39
      'ORDER BY'
      'CD_ITEM')
    Left = 530
    Top = 133
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
  end
  object qry_ret_proc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT NR_PROCESSO'
      'FROM TFATURAMENTO_CC'
      'WHERE NR_SOLIC_FAT = :NR_SOLIC_FAT')
    Params.Data = {010001000C4E525F534F4C49435F4641540001020030000000}
    Left = 221
    Top = 133
    object qry_ret_proc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFATURAMENTO_CC.NR_PROCESSO'
      Size = 18
    end
  end
  object ds_fat_cc: TDataSource
    DataSet = qry_fat_cc_
    Left = 647
    Top = 73
  end
  object qry_grd_sol_: TQuery
    AfterScroll = qry_grd_sol_AfterScroll
    OnCalcFields = qry_grd_sol_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT F.CD_UNID_NEG, F.CD_PRODUTO, F.NR_SOLICITACAO, F.IN_CANCE' +
        'LADO, F.IN_LIQUIDADO,'
      
        '       Y.TX_YESNO, F.NR_NOTA_FATURA, F.NR_NF_SERV, ISNULL( F.NR_' +
        'BOLETO, '#39#39' ) NR_BOLETO'
      'FROM   TS_FATURA F, TYES_NO Y'
      'WHERE  F.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       F.CD_PRODUTO = :CD_PRODUTO AND'
      '       (F.DT_FATURA = :DT_FATURA OR :DT_FATURA IS NULL) AND'
      
        '       ( ( F.NR_SOLICITACAO = :NR_SOLICITACAO ) OR ( :NR_SOLICIT' +
        'ACAO = '#39#39' ) ) AND'
      '       ( ( F.NR_NOTA_FATURA = :NR_NF ) OR ( :NR_NF = '#39#39' ) ) AND'
      
        '       ( ( F.NR_BOLETO = :NR_BOLETO ) OR ( :NR_BOLETO = '#39#39' ) ) A' +
        'ND'
      '       ( ( :NR_PROCESSO IN ( SELECT NR_PROCESSO'
      '                             FROM   TS_FATURA_PROCESSO FP'
      
        '                             WHERE  F.CD_UNID_NEG = FP.CD_UNID_N' +
        'EG AND'
      
        '                                    F.CD_PRODUTO = FP.CD_PRODUTO' +
        ' AND'
      
        '                                    F.NR_SOLICITACAO = FP.NR_SOL' +
        'ICITACAO ) ) OR'
      '          ( :NR_PROCESSO = '#39#39' ) ) AND'
      '       ( ( EXISTS ( SELECT CD_REFERENCIA'
      
        '                    FROM   TS_FATURA_PROCESSO FP, TREF_CLIENTE R' +
        'EF'
      '                    WHERE  F.CD_UNID_NEG = FP.CD_UNID_NEG AND'
      '                           F.CD_PRODUTO = FP.CD_PRODUTO AND'
      
        '                           F.NR_SOLICITACAO = FP.NR_SOLICITACAO ' +
        'AND'
      '                           FP.NR_PROCESSO = REF.NR_PROCESSO AND'
      
        '                           CD_REFERENCIA LIKE '#39'%'#39' + :CD_REFERENC' +
        'IA + '#39'%'#39' ) ) OR'
      '          ( :CD_REFERENCIA = '#39#39' ) ) AND'
      
        '       ( ( ( F.IN_CANCELADO = '#39'0'#39' ) AND ( :IN_CANCELADO = '#39#39' ) )' +
        ' OR'
      '         ( :IN_CANCELADO <> '#39#39' ) ) AND'
      
        '       ( ( ( F.IN_IMPRESSO = Y.CD_YESNO ) AND ( :TP_TIPO_FAT IN ' +
        '( '#39'D'#39', '#39'F'#39', '#39'N'#39' ) ) ) OR'
      
        '         ( ( F.IN_IMP_NF_SERV = Y.CD_YESNO ) AND ( :TP_TIPO_FAT ' +
        'IN ( '#39'S'#39' ) ) ) ) AND'
      '       F.IN_CALCULADO = '#39'1'#39' AND'
      '       ( ( F.TP_TIPO_FAT = :TP_TIPO_FAT ) OR'
      
        '         ( ( F.TP_TIPO_FAT = '#39'D'#39' ) AND ( :TP_TIPO_FAT = '#39'F'#39' ) AN' +
        'D ( :TP_TIPO_FAT <> '#39'S'#39' ) ) OR'
      
        '         ( ( :TP_TIPO_FAT = '#39'S'#39' ) AND ( F.TP_TIPO_FAT = '#39'F'#39' ) ) ' +
        'OR'
      '         ( ( :TP_TIPO_FAT = '#39'S'#39' ) AND ( F.TP_TIPO_FAT = '#39'N'#39' ) )'
      '       )'
      'ORDER BY F.NR_NOTA_FATURA')
    Params.Data = {
      010017000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F00010200300000000944545F464154555241000904005A950A00000009
      44545F464154555241000904005A950A0000000E4E525F534F4C494349544143
      414F00010200300000000E4E525F534F4C494349544143414F00010200300000
      00054E525F4E460001020030000000054E525F4E460001020030000000094E52
      5F424F4C45544F0001020030000000094E525F424F4C45544F00010200300000
      000B4E525F50524F434553534F00010200300000000B4E525F50524F43455353
      4F00010200300000000D43445F5245464552454E43494100010200300000000D
      43445F5245464552454E43494100010200300000000C494E5F43414E43454C41
      444F00010200300000000C494E5F43414E43454C41444F00010200300000000B
      54505F5449504F5F46415400010200300000000B54505F5449504F5F46415400
      010200300000000B54505F5449504F5F46415400010200300000000B54505F54
      49504F5F46415400010200300000000B54505F5449504F5F4641540001020030
      0000000B54505F5449504F5F46415400010200300000000B54505F5449504F5F
      4641540001020030000000}
    Left = 34
    Top = 232
    object qry_grd_sol_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TS_FATURA.CD_UNID_NEG'
      Size = 2
    end
    object qry_grd_sol_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TS_FATURA.CD_PRODUTO'
      Size = 2
    end
    object qry_grd_sol_NR_SOLICITACAO: TStringField
      DisplayLabel = 'Solicitação'
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TS_FATURA.NR_SOLICITACAO'
      Size = 6
    end
    object qry_grd_sol_TX_YESNO: TStringField
      DisplayLabel = 'Imp.'
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
    object qry_grd_sol_NR_NOTA_FATURA: TStringField
      DisplayLabel = 'Nº Fatura/Nota'
      FieldName = 'NR_NOTA_FATURA'
      Origin = 'TS_FATURA.NR_NOTA_FATURA'
      Size = 6
    end
    object qry_grd_sol_NR_NF_SERV: TStringField
      DisplayLabel = 'Nº N.F.'
      FieldName = 'NR_NF_SERV'
      Origin = 'TS_FATURA.CD_UNID_NEG'
      Size = 6
    end
    object qry_grd_sol_CalcNrSolicitacao: TStringField
      DisplayLabel = 'Solicitação'
      FieldName = 'CalcNrSolicitacao'
      Size = 7
      Calculated = True
    end
    object qry_grd_sol_NR_BOLETO: TStringField
      DisplayLabel = 'Nº Boleto'
      FieldName = 'NR_BOLETO'
      Size = 10
    end
    object qry_grd_sol_CalcStatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'CalcStatus'
      Size = 10
      Calculated = True
    end
    object qry_grd_sol_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Size = 1
    end
    object qry_grd_sol_IN_LIQUIDADO: TStringField
      FieldName = 'IN_LIQUIDADO'
      Size = 1
    end
  end
  object ds_grd_adm: TDataSource
    DataSet = qry_grd_adm_
    Left = 127
    Top = 305
  end
  object qry_grd_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT Y.TX_YESNO, A.NR_DOCTO, A.NR_NF_SERV, A.CD_FAVORECIDO, F.' +
        'NM_FAVORECIDO,'
      
        '       SUM( ISNULL( VL_LANCTO, 0 ) - ISNULL( VL_DESCONTO, 0 ) ) ' +
        'VL_NOTA'
      'FROM   TADM A, TYES_NO Y, TFAVORECIDO F'
      'WHERE  A.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       A.DT_PAGTO = :DT_PAGTO AND'
      '       A.CD_FAVORECIDO = F.CD_FAVORECIDO AND'
      '       A.IN_IMP_NF_SERV = Y.CD_YESNO AND'
      '       A.TP_NATUREZA = '#39'C'#39' AND'
      '       A.TP_LANCAMENTO = '#39'N'#39' AND'
      '       A.CD_STATUS_ADM = '#39'18'#39
      
        'GROUP BY Y.TX_YESNO, A.NR_DOCTO, A.NR_NF_SERV, A.CD_FAVORECIDO, ' +
        'F.NM_FAVORECIDO')
    Params.Data = {
      010002000B43445F554E49445F4E454700010200300000000844545F50414754
      4F000904005A950A000000}
    Left = 127
    Top = 232
    object qry_grd_adm_TX_YESNO: TStringField
      DisplayLabel = 'Imp.'
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
    object qry_grd_adm_NR_DOCTO: TStringField
      DisplayLabel = 'Nº Nota'
      FieldName = 'NR_DOCTO'
      Origin = 'TADM.NR_DOCTO'
      Size = 6
    end
    object qry_grd_adm_NR_NF_SERV: TStringField
      DisplayLabel = 'Nº N.F.'
      FieldName = 'NR_NF_SERV'
      Origin = 'TADM.NR_NF_SERV'
      Size = 6
    end
    object qry_grd_adm_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_grd_adm_NM_FAVORECIDO: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
    object qry_grd_adm_VL_NOTA: TFloatField
      FieldName = 'VL_NOTA'
    end
  end
  object qry_fav_adm_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_grd_adm
    SQL.Strings = (
      'SELECT NM_FAVORECIDO,'
      '       LTRIM( RTRIM( ISNULL( END_FAVORECIDO, '#39#39' ) ) ) + '#39', '#39' +'
      '       LTRIM( RTRIM( ISNULL( END_NUMERO, '#39#39' ) ) ) + '#39' '#39' +'
      
        '       LTRIM( RTRIM( ISNULL( END_BAIRRO, '#39#39' ) ) ) END_FAVORECIDO' +
        ','
      '       END_CIDADE, END_UF, CGC_EMPRESA, IE_EMPRESA'
      'FROM   TFAVORECIDO F'
      'WHERE  CD_FAVORECIDO = :CD_FAVORECIDO')
    Params.Data = {010001000D43445F4641564F52454349444F0001020030000100}
    Left = 221
    Top = 232
    object qry_fav_adm_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Size = 50
    end
    object qry_fav_adm_END_FAVORECIDO: TStringField
      FieldName = 'END_FAVORECIDO'
      Size = 89
    end
    object qry_fav_adm_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object qry_fav_adm_END_UF: TStringField
      FieldName = 'END_UF'
      Size = 2
    end
    object qry_fav_adm_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
    object qry_fav_adm_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
    end
  end
  object qry_ult_nf_serv_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( MAX( NR_NF_SERV ), ( SELECT NR_ULT_NF_SERV'
      
        '                                    FROM   TPARAMETROS ) ) AS NR' +
        '_ULT_NF_SERV'
      'FROM   TS_FATURA')
    Left = 317
    Top = 17
    object qry_ult_nf_serv_fat_NR_ULT_NF_SERV: TStringField
      FieldName = 'NR_ULT_NF_SERV'
      Size = 6
    end
  end
  object qry_ult_nf_serv_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( MAX( NR_NF_SERV ), ( SELECT NR_ULT_NF_SERV'
      
        '                                    FROM   TPARAMETROS ) ) AS NR' +
        '_ULT_NF_SERV'
      'FROM   TADM')
    Left = 317
    Top = 73
    object qry_ult_nf_serv_adm_NR_ULT_NF_SERV: TStringField
      FieldName = 'NR_ULT_NF_SERV'
      Size = 6
    end
  end
  object qry_atz_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TADM'
      'SET    NR_NF_SERV = :NR_NF_SERV,'
      '       IN_IMP_NF_SERV = '#39'1'#39','
      
        '       DT_NF_SERV = CONVERT( datetime, CONVERT( varchar(10), GET' +
        'DATE(), 103 ), 103 )'
      'WHERE  NR_DOCTO = :NR_DOCTO')
    Params.Data = {
      010002000A4E525F4E465F534552560001020030000000084E525F444F43544F
      0001020030000000}
    Left = 221
    Top = 305
    object StringField2: TStringField
      DisplayLabel = 'Imp.'
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
    object StringField3: TStringField
      DisplayLabel = 'Nº Nota'
      FieldName = 'NR_DOCTO'
      Origin = 'TADM.NR_DOCTO'
      Size = 6
    end
    object StringField4: TStringField
      DisplayLabel = 'Nº N.F.'
      FieldName = 'NR_NF_SERV'
      Origin = 'TADM.NR_NF_SERV'
      Size = 6
    end
    object StringField5: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object StringField6: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
    object FloatField1: TFloatField
      FieldName = 'VL_NOTA'
    end
  end
  object qry_tot_comissao_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT SUM( ISNULL( VL_ITEM, 0 ) + ISNULL( VL_ASSIST, 0 ) - ISNU' +
        'LL( VL_IR, 0 ) ) VL_COMISSAO'
      'FROM   TFATURAMENTO_CC'
      
        'WHERE  ( CD_ITEM IN ( SELECT CD_ITEM_COMISSAO FROM TPARAMETROS )' +
        ' OR'
      
        '         CD_ITEM IN ( SELECT CD_ITEM_SERVICO_COMISSARIA FROM TPA' +
        'RAMETROS ) ) AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       NR_SOLIC_FAT = :NR_SOLIC_FAT')
    Params.Data = {
      010003000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F00010200300000000C4E525F534F4C49435F4641540001020030000000}
    Left = 317
    Top = 305
    object qry_tot_comissao_fat_VL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
    end
  end
  object qry_ult_nota_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX( NR_DOCTO ) NR_NOTA_ADM'
      'FROM   TADM'
      'WHERE  TP_LANCAMENTO = '#39'N'#39' AND CD_STATUS_ADM NOT IN( '#39'4'#39', '#39'17'#39' )')
    Left = 417
    Top = 17
    object qry_ult_nota_adm_NR_NOTA_ADM: TStringField
      FieldName = 'NR_NOTA_ADM'
      Origin = 'TADM.NR_DOCTO'
      Size = 6
    end
  end
  object qry_ult_nota_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( MAX( NR_NOTA_FATURA ), ( SELECT NR_ULT_NOTA'
      
        '                                        FROM   TPARAMETROS ) ) A' +
        'S NR_NOTA_FAT'
      'FROM   TS_FATURA'
      'WHERE  TP_TIPO_FAT = '#39'N'#39)
    Left = 417
    Top = 73
    object qry_ult_nota_fat_NR_NOTA_FAT: TStringField
      FieldName = 'NR_NOTA_FAT'
      Origin = 'TS_FATURA.NR_NOTA_FATURA'
      Size = 6
    end
  end
  object sp_atz_evento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_evento'
    Params.Data = {
      0100040006526573756C74040304000100000000010C406E725F70726F636573
      736F01010200300000000E4063645F6576656E746F5F74787401010200300000
      000E4064745F7265616C697A6163616F010B080000002C845D40CB420000}
    Left = 647
    Top = 232
  end
  object qry_apaga_dados_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '')
    Left = 530
    Top = 305
  end
  object qry_cliente_representante_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT E.NM_EMPRESA, E.END_EMPRESA, C.IN_DEST_FAT, '
      '               E.END_NUMERO, E.END_BAIRRO, E.END_CIDADE,'
      '               E.END_UF, E.END_CEP, E.CGC_EMPRESA, E.IE_EMPRESA,'
      '               C.IN_DEST_NF'
      'FROM TEMPRESA_NAC E, TCLIENTE_REPRESENTANTE C'
      'WHERE C.CD_CLIENTE = :CD_CLIENTE AND'
      '               C.CD_UNID_NEG = :CD_UNID_NEG AND'
      '               C.CD_PRODUTO =  :CD_PRODUTO AND'
      '               C.CD_SERVICO = :CD_SERVICO AND'
      '               C.CD_REPRESENTANTE = :CD_REPRESENTANTE AND'
      '               C.CD_REPRESENTANTE = E.CD_EMPRESA')
    Params.Data = {
      010005000A43445F434C49454E544500010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F00010200300000000A43
      445F5345525649434F00010200300000001043445F524550524553454E54414E
      54450001020030000000}
    Left = 530
    Top = 232
    object qry_cliente_representante_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_cliente_representante_IN_DEST_FAT: TStringField
      FieldName = 'IN_DEST_FAT'
      Origin = 'TCLIENTE_REPRESENTANTE.IN_DEST_FAT'
      Size = 1
    end
    object qry_cliente_representante_IN_DEST_NF: TStringField
      FieldName = 'IN_DEST_NF'
      Origin = 'TCLIENTE_REPRESENTANTE.IN_DEST_NF'
      Size = 1
    end
    object qry_cliente_representante_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_cliente_representante_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'TEMPRESA_NAC.END_EMPRESA'
      Size = 6
    end
    object qry_cliente_representante_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Origin = 'TCLIENTE_REPRESENTANTE.IN_DEST_FAT'
      Size = 30
    end
    object qry_cliente_representante_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TEMPRESA_NAC.END_NUMERO'
      Size = 30
    end
    object qry_cliente_representante_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'TEMPRESA_NAC.END_BAIRRO'
      Size = 2
    end
    object qry_cliente_representante_END_CEP: TStringField
      FieldName = 'END_CEP'
      Origin = 'TEMPRESA_NAC.END_CIDADE'
      Size = 8
    end
    object qry_cliente_representante_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TEMPRESA_NAC.END_UF'
      Size = 14
    end
    object qry_cliente_representante_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      Origin = 'TEMPRESA_NAC.END_CEP'
    end
  end
  object qry_ult_fat_unid_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_NOTA_FATURA'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 34
    Top = 133
    object qry_ult_fat_unid_NR_NOTA_FATURA: TStringField
      FieldName = 'NR_NOTA_FATURA'
      Origin = 'TUNID_NEG.NR_NOTA_FATURA'
      Size = 6
    end
  end
  object qry_ir_in_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_IR_FAT'
      'FROM TCLIENTE_HABILITACAO'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '      CD_PRODUTO  = :CD_PRODUTO  AND'
      '      CD_CLIENTE  = :CD_CLIENTE')
    Params.Data = {
      010003000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F00010200300000000A43445F434C49454E54450001020030000000}
    Left = 647
    Top = 133
    object qry_ir_in_fat_CD_IR_FAT: TStringField
      FieldName = 'CD_IR_FAT'
      Origin = 'TCLIENTE_HABILITACAO.CD_IR_FAT'
      Size = 1
    end
  end
  object sp_rel_prev_fat: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_prev_fat'
    Params.Data = {
      0100050006526573756C74040304000000000000010C4063645F756E69645F6E
      656701010200300000000B4063645F70726F6475746F01010200300000000F40
      6E725F736F6C696369746163616F010102003000000011406E725F6964656E74
      6966696361646F7202030400030000000001}
    Left = 647
    Top = 305
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, P.TX_MERCADORIA, P.NR_CONHECIMENTO, P.NR_C' +
        'ONHECIMENTO_MASTER,'
      
        '       P.CD_LOCAL_EMBARQUE, P.CD_LOCAL_DESEMBARQUE, P.CD_EMBARCA' +
        'CAO, P.CD_CLIENTE, NR_DDE, '
      '       P.CD_PRODUTO, D.NR_DECLARACAO_IMP, D.DT_REGISTRO_DI,'
      
        '       ISNULL( ( SELECT SUM( CONVERT( int, ISNULL( QT_VOLUME_CAR' +
        'GA, '#39'0'#39' ) ) )'
      '                 FROM   TEMBALAGEM_CARGA E'
      
        '                 WHERE  P.NR_PROCESSO *= E.NR_PROCESSO ), 0 ) QT' +
        '_VOLUMES, PB_CARGA,'
      '       VL_CIF_MN, VL_CIF_DOLAR'
      'FROM   TPROCESSO P, TDECLARACAO_IMPORTACAO D'
      'WHERE  P.NR_PROCESSO *= D.NR_PROCESSO AND'
      '       P.NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 417
    Top = 133
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TPROCESSO.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_processo_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'TPROCESSO.CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object qry_processo_CD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'TPROCESSO.CD_LOCAL_DESEMBARQUE'
      Size = 4
    end
    object qry_processo_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'TPROCESSO.CD_EMBARCACAO'
      Size = 4
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_processo_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object qry_processo_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Size = 30
    end
    object qry_processo_LookEmbarc: TStringField
      DisplayWidth = 21
      FieldName = 'LookEmbarc'
      LookupKeyFields = 'CD_EMBARCACAO'
      LookupResultField = 'NM_EMBARCACAO'
      KeyFields = 'CD_EMBARCACAO'
      Size = 21
      Lookup = True
    end
    object qry_processo_LookLocalDesem: TStringField
      FieldName = 'LookLocalDesem'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_LOCAL_DESEMBARQUE'
      Size = 21
      Lookup = True
    end
    object qry_processo_LookLocalEmb: TStringField
      DisplayWidth = 21
      FieldName = 'LookLocalEmb'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_LOCAL_EMBARQUE'
      Size = 21
      Lookup = True
    end
    object qry_processo_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Size = 8
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_processo_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Size = 10
    end
    object qry_processo_QT_VOLUMES: TIntegerField
      FieldName = 'QT_VOLUMES'
    end
    object qry_processo_PB_CARGA: TFloatField
      FieldName = 'PB_CARGA'
    end
    object qry_processo_VL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
    end
    object qry_processo_VL_CIF_DOLAR: TFloatField
      FieldName = 'VL_CIF_DOLAR'
    end
    object qry_processo_NR_DDE: TStringField
      FieldName = 'NR_DDE'
      Size = 11
    end
  end
  object qry_fat_proc_: TQuery
    AfterScroll = qry_fat_proc_AfterScroll
    OnCalcFields = qry_fat_proc_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_grd_sol
    SQL.Strings = (
      
        'SELECT F.NR_PROCESSO, P.CD_CLIENTE, E.AP_EMPRESA, E.NM_EMPRESA, ' +
        'P.NR_CONHECIMENTO, P.CD_REPRESENTANTE, '
      '       P.CD_UNID_NEG, P.CD_PRODUTO, P.CD_SERVICO, E.END_CEP,'
      '       LTRIM( RTRIM( ISNULL( END_EMPRESA, '#39#39' ) ) ) + '#39', '#39' +'
      '       LTRIM( RTRIM( ISNULL( END_NUMERO, '#39#39' ) ) ) + '#39' '#39' +'
      '       LTRIM( RTRIM( ISNULL( END_BAIRRO, '#39#39' ) ) ) END_EMPRESA,'
      '       END_CIDADE, END_UF, CGC_EMPRESA, IE_EMPRESA '
      'FROM   TS_FATURA_PROCESSO F, TPROCESSO P, TEMPRESA_NAC E'
      'WHERE  F.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       F.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       F.CD_PRODUTO = :CD_PRODUTO AND'
      '       F.NR_SOLICITACAO = :NR_SOLICITACAO'
      '')
    Params.Data = {
      010003000B43445F554E49445F4E454700010200300001000A43445F50524F44
      55544F00010200300001000E4E525F534F4C494349544143414F000102003000
      0100}
    Left = 417
    Top = 232
    object qry_fat_proc_CalcNrProcesso: TStringField
      DisplayLabel = 'Processo'
      DisplayWidth = 18
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
    object qry_fat_proc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TS_FATURA_PROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_fat_proc_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_fat_proc_AP_EMPRESA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
    object qry_fat_proc_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_fat_proc_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Size = 89
    end
    object qry_fat_proc_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object qry_fat_proc_END_UF: TStringField
      FieldName = 'END_UF'
      Size = 2
    end
    object qry_fat_proc_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
    object qry_fat_proc_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
    end
    object qry_fat_proc_CD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Size = 5
    end
    object qry_fat_proc_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_proc_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_fat_proc_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_fat_proc_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object qry_fat_proc_END_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
  end
end
