object datm_rel_desp_pag: Tdatm_rel_desp_pag
  Left = 36
  Top = 262
  Height = 291
  Width = 650
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 156
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
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 156
    Top = 76
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
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Params.Data = {010001000A43445F434C49454E54450001020030000100}
    Left = 43
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
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM_COMISSAO, CD_ITEM_EXPED'
      'FROM TPARAMETROS')
    Left = 43
    Top = 76
    object qry_param_CD_ITEM_COMISSAO: TStringField
      FieldName = 'CD_ITEM_COMISSAO'
      Origin = 'TPARAMETROS.CD_ITEM_COMISSAO'
      Size = 3
    end
    object qry_param_CD_ITEM_EXPED: TStringField
      FieldName = 'CD_ITEM_EXPED'
      Origin = 'TPARAMETROS.CD_ITEM_EXPED'
      Size = 3
    end
  end
  object qry_flp_plan_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ord_ref_cli_
    SQL.Strings = (
      'SELECT'
      '    P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO,'
      '    P.CD_CLIENTE, P.DT_ABERTURA, P.TX_MERCADORIA,'
      '    P.TX_OBSERVACOES, P.NR_VOO, P.NR_CONHECIMENTO,'
      '    E.CD_EMPRESA, E.NM_EMPRESA,'
      '    B.NM_EMBARCACAO,'
      '    PD.DT_REALIZACAO DT_PREV_DESEMB,'
      '    PC.DT_REALIZACAO DT_PREV_CHEGADA,'
      '    ETD.DT_REALIZACAO DT_ETD,'
      '    D.DT_REALIZACAO DT_DESEMB,'
      '    C.DT_REALIZACAO DT_CHEGADA,'
      '    R.DT_REALIZACAO DT_REG_DI'
      'FROM'
      '    TPROCESSO P,'
      '    TEMPRESA_NAC E,'
      '    TEMBARCACAO B,'
      '    VW_DT_PREV_DESEMB PD,'
      '    VW_DT_PREV_CHEGADA PC,'
      '    VW_DT_ETD ETD,'
      '    VW_DT_DESEMB D,'
      '    VW_DT_CHEGADA C,'
      '    VW_DT_REG_DI R'
      'WHERE'
      '    P.CD_CLIENTE = E.CD_EMPRESA AND'
      '    P.CD_EMBARCACAO *= B.CD_EMBARCACAO AND'
      '    P.NR_PROCESSO *= D.NR_PROCESSO AND'
      '    P.NR_PROCESSO *= C.NR_PROCESSO AND'
      '    P.NR_PROCESSO *= PD.NR_PROCESSO AND'
      '    P.NR_PROCESSO *= PC.NR_PROCESSO AND'
      '    P.NR_PROCESSO *= R.NR_PROCESSO AND'
      '    P.NR_PROCESSO *= ETD.NR_PROCESSO AND'
      '    P.NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 369
    Top = 17
    object qry_flp_plan_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_flp_plan_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_flp_plan_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_flp_plan_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_flp_plan_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
    end
    object qry_flp_plan_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_flp_plan_TX_OBSERVACOES: TMemoField
      FieldName = 'TX_OBSERVACOES'
      BlobType = ftMemo
    end
    object qry_flp_plan_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      Size = 18
    end
    object qry_flp_plan_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Size = 5
    end
    object qry_flp_plan_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_flp_plan_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Size = 40
    end
    object qry_flp_plan_DT_PREV_DESEMB: TDateTimeField
      FieldName = 'DT_PREV_DESEMB'
    end
    object qry_flp_plan_DT_PREV_CHEGADA: TDateTimeField
      FieldName = 'DT_PREV_CHEGADA'
    end
    object qry_flp_plan_DT_ETD: TDateTimeField
      FieldName = 'DT_ETD'
    end
    object qry_flp_plan_DT_DESEMB: TDateTimeField
      FieldName = 'DT_DESEMB'
    end
    object qry_flp_plan_DT_CHEGADA: TDateTimeField
      FieldName = 'DT_CHEGADA'
    end
    object qry_flp_plan_DT_REG_DI: TDateTimeField
      FieldName = 'DT_REG_DI'
    end
    object qry_flp_plan_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Size = 18
    end
  end
  object qry_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_flp_plan
    SQL.Strings = (
      'SELECT CD_REFERENCIA '
      'FROM TREF_CLIENTE'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY CD_REFERENCIA')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 449
    Top = 17
    object qry_ref_cli_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
  end
  object ds_flp_plan: TDataSource
    DataSet = qry_flp_plan_
    Left = 369
    Top = 76
  end
  object qry_exp_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_flp_plan
    SQL.Strings = (
      'SELECT NM_FORN_ESTR'
      'FROM TADICAO_DE_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = '#39'001'#39)
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 449
    Top = 76
    object qry_exp_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.NM_FORN_ESTR'
      Size = 60
    end
  end
  object qry_embalagem_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_flp_plan
    SQL.Strings = (
      'SELECT*'
      'FROM TPROCESSO_EMBALAGEM P, TEMBALAGEM E'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO AND'
      'P.CD_EMBALAGEM = E.CD_EMBALAGEM'
      '')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 449
    Top = 130
    object qry_embalagem_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EMBALAGEM.NR_PROCESSO'
      Size = 18
    end
    object qry_embalagem_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TPROCESSO_EMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_embalagem_PB_EMBALAGEM: TFloatField
      FieldName = 'PB_EMBALAGEM'
      Origin = 'TPROCESSO_EMBALAGEM.PB_EMBALAGEM'
    end
    object qry_embalagem_QT_EMBALAGEM: TIntegerField
      FieldName = 'QT_EMBALAGEM'
      Origin = 'TPROCESSO_EMBALAGEM.QT_EMBALAGEM'
    end
    object qry_embalagem_NM_EMBALAGEM_S: TStringField
      FieldName = 'NM_EMBALAGEM_S'
    end
    object qry_embalagem_NM_EMBALAGEM_P: TStringField
      FieldName = 'NM_EMBALAGEM_P'
    end
  end
  object qry_li_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_flp_plan
    SQL.Strings = (
      'SELECT COUNT(NR_OPER_TRAT_PREV) TOT_LI'
      'FROM TADICAO_DE_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'ISNULL(NR_OPER_TRAT_PREV, '#39#39') <> '#39#39)
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 449
    Top = 185
    object qry_li_TOT_LI: TIntegerField
      FieldName = 'TOT_LI'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_OPER_TRAT_PREV'
    end
  end
  object qry_ord_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO,'
      '  (SELECT MIN(CD_REFERENCIA)'
      '     FROM TREF_CLIENTE'
      '     WHERE NR_PROCESSO = P.NR_PROCESSO) MENOR'
      'FROM TPROCESSO P,'
      '     TEMPRESA_NAC E,'
      '     VW_DT_DESEMB D,'
      '     TSERVICO S'
      'WHERE P.NR_PROCESSO = D.NR_PROCESSO AND'
      'P.CD_CLIENTE = E.CD_EMPRESA AND'
      'P.IN_CANCELADO = '#39'0'#39' AND'
      'P.IN_PRODUCAO = '#39'1'#39' AND'
      '( D.DT_REALIZACAO = NULL OR'
      '  D.DT_REALIZACAO > DATEADD(DAY, -7, GETDATE()) ) AND'
      'S.CD_SERVICO = P.CD_SERVICO AND'
      'S.IN_FOLLOWUP = '#39'1'#39' AND'
      '( P.CD_CLIENTE  = :CD_CLIENTE ) AND'
      '( ( E.CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ) ) AND'
      
        '( ( P.CD_UNID_NEG = :CD_UNID_NEG ) OR ( :CD_UNID_NEG = '#39#39' ) ) AN' +
        'D'
      '( ( P.CD_PRODUTO = :CD_PRODUTO) OR ( :CD_PRODUTO = '#39#39' ) )'
      'ORDER BY (SELECT MIN(CD_REFERENCIA)'
      '            FROM TREF_CLIENTE'
      '            WHERE NR_PROCESSO = P.NR_PROCESSO)')
    Params.Data = {
      010007000A43445F434C49454E544500010200300001000843445F475255504F
      00010200300001000843445F475255504F00010200300001000B43445F554E49
      445F4E454700010200300001000B43445F554E49445F4E454700010200300001
      000A43445F50524F4455544F00010200300001000A43445F50524F4455544F00
      01020030000100}
    Left = 289
    Top = 17
    object qry_ord_ref_cli_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TREF_CLIENTE.NR_PROCESSO'
      Size = 18
    end
    object qry_ord_ref_cli_MENOR: TStringField
      FieldName = 'MENOR'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
  end
  object ds_ord_ref_cli_: TDataSource
    DataSet = qry_ord_ref_cli_
    Left = 289
    Top = 76
  end
  object sp_tot_serv_cli_periodo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_tot_serv_cli_periodo'
    Params.Data = {
      0100070006526573756C74040304000000000000000C4063645F756E69645F6E
      656701010200300000000B4063645F70726F6475746F01010200300000000740
      64745F696E69010B080000002C845D40CB420000074064745F66696D010B0800
      00002C845D40CB42000011406E725F6964656E746966696361646F7202030400
      00000000000008406C6567656E64610201020030000000}
    Left = 156
    Top = 130
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TGRUPO'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Params.Data = {010001000843445F475255504F0001020030000000}
    Left = 43
    Top = 130
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO.NM_GRUPO'
      Size = 50
    end
    object qry_grupo_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'TGRUPO.DT_INCLUSAO'
    end
    object qry_grupo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TGRUPO.IN_ATIVO'
      Size = 1
    end
  end
  object sp_rel_desp_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_desp_pagto'
    Params.Data = {
      0100040006526573756C74040304000000000000010C4063645F756E69645F6E
      656701010200300000000B4063645F70726F6475746F01010200300000001140
      6E725F6964656E746966696361646F7202030400010000000001}
    Left = 289
    Top = 185
  end
  object sp_rel_nao_desemb_di: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_nao_desemb_di'
    Params.Data = {
      0100060006526573756C74040304000000000000010C4063645F756E69645F6E
      656701010200300001000B4063645F70726F6475746F01010200300001000940
      63645F677275706F01010200300001000B4063645F636C69656E746501010200
      3000010011406E725F6964656E746966696361646F7202030400000000000000}
    Left = 289
    Top = 130
  end
  object qry_apaga_dados_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TREL_DESP_PAGTO'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Params.Data = {01000100104E525F4944454E544946494341444F5200030400000000000000}
    Left = 156
    Top = 185
    object StringField5: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object sp_andamento_: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_aux_andamento'
    Params.Data = {
      0100060006526573756C7404030400000000000000094063645F677275706F01
      010200300000000B4063645F636C69656E746501010200300000000B4063645F
      756E696461646501010200300000000B4063645F70726F6475746F0101020030
      00000011406E725F6964656E746966696361646F7202030400000000000000}
    Left = 545
    Top = 17
  end
end
