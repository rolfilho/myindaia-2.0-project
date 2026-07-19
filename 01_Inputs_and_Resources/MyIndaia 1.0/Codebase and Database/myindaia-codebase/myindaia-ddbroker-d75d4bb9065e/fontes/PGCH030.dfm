object datm_sel_unid_cli_mes_ano: Tdatm_sel_unid_cli_mes_ano
  Left = 200
  Top = 108
  Height = 381
  Width = 498
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 44
    Top = 20
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Params.Data = {010001000A43445F434C49454E54450001020030000100}
    Left = 133
    Top = 20
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
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TGRUPO'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Params.Data = {010001000843445F475255504F0001020030000000}
    Left = 44
    Top = 85
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
  object qry_mapa_seg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      '    P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_CLIENTE,'
      
        '    P.NR_VOO, P.NR_CONHECIMENTO, P.CD_MOEDA_MLE, P.CD_MOEDA_FRET' +
        'E, P.VL_MLE_MNEG,'
      
        '    P.VL_FRETE_PREPAID_MNEG, P.VL_FRETE_COLLECT_MNEG, P.VL_FRETE' +
        '_TNAC_MNEG,'
      
        '    E.NM_EMPRESA, EMB.NM_EMBARCACAO, PA.DESCRICAO NM_PAIS, DI.DT' +
        '_EMBARQUE'
      'FROM'
      '    TPROCESSO P,'
      '    TEMPRESA_NAC E,'
      '    TEMBARCACAO EMB,'
      '    TPAIS PA,'
      '    TDECLARACAO_IMPORTACAO DI,'
      '    VW_DT_DIG_DI V'
      'WHERE'
      '    P.CD_CLIENTE     = E.CD_EMPRESA AND'
      '    P.CD_EMBARCACAO  *= EMB.CD_EMBARCACAO AND'
      '    P.CD_PAIS_ORIGEM *= PA.CODIGO AND'
      '    P.NR_PROCESSO    = DI.NR_PROCESSO AND'
      '    P.NR_PROCESSO    = V.NR_PROCESSO AND'
      
        '    ( ( ( P.CD_CLIENTE = :CD_CLIENTE ) AND ( :CD_GRUPO = '#39#39' ) ) ' +
        'OR'
      
        '      ( ( E.CD_GRUPO = :CD_GRUPO ) AND ( :CD_CLIENTE = '#39#39' ) ) ) ' +
        'AND'
      
        '    ( ( P.CD_UNID_NEG = :CD_UNID_NEG ) OR ( :CD_UNID_NEG = '#39#39' ) ' +
        ') AND'
      '    ( ( ( DATEPART( mm, V.DT_REALIZACAO ) = :MES ) AND'
      '        ( DATEPART( yy, V.DT_REALIZACAO ) = :ANO ) )'
      '      OR'
      
        '      ( ( CONVERT( integer, SUBSTRING( DI.DT_EMBARQUE, 3, 2 ) ) ' +
        '= :MES ) AND'
      
        '        ( CONVERT( integer, SUBSTRING( DI.DT_EMBARQUE, 5, 4 ) ) ' +
        '= :ANO ) ) )')
    Params.Data = {
      01000A000A43445F434C49454E544500010200300000000843445F475255504F
      00010200300000000843445F475255504F00010200300000000A43445F434C49
      454E544500010200300000000B43445F554E49445F4E45470001020030000000
      0B43445F554E49445F4E45470001020030000000034D45530003040000000000
      000003414E4F00030400000000000000034D4553000304000000000000000341
      4E4F00030400000000000000}
    Left = 304
    Top = 20
    object qry_mapa_seg_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_mapa_seg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_mapa_seg_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_mapa_seg_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      Size = 18
    end
    object qry_mapa_seg_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object qry_mapa_seg_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Size = 3
    end
    object qry_mapa_seg_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_mapa_seg_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
    end
    object qry_mapa_seg_VL_FRETE_PREPAID_MNEG: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MNEG'
    end
    object qry_mapa_seg_VL_FRETE_COLLECT_MNEG: TFloatField
      FieldName = 'VL_FRETE_COLLECT_MNEG'
    end
    object qry_mapa_seg_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
    end
    object qry_mapa_seg_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_mapa_seg_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Size = 40
    end
    object qry_mapa_seg_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Size = 120
    end
    object qry_mapa_seg_DT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      Size = 8
    end
    object qry_mapa_seg_LookMoedaMLE: TStringField
      FieldName = 'LookMoedaMLE'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA_MLE'
      Size = 30
      Lookup = True
    end
    object qry_mapa_seg_LookMoedaFrete: TStringField
      FieldName = 'LookMoedaFrete'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA_FRETE'
      Size = 30
      Lookup = True
    end
  end
  object qry_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_mapa_seg
    SQL.Strings = (
      'SELECT CD_REFERENCIA '
      'FROM TREF_CLIENTE'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY CD_REFERENCIA')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 133
    Top = 85
    object qry_ref_cli_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
  end
  object ds_mapa_seg: TDataSource
    DataSet = qry_mapa_seg_
    Left = 216
    Top = 21
  end
  object qry_faturas_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_mapa_seg
    SQL.Strings = (
      'SELECT NR_DCTO_INSTRUCAO'
      'FROM TDOCUMENTO_INSTRUCAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'AND CD_TIPO_DCTO_INSTR = '#39'01'#39)
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 133
    Top = 145
    object qry_faturas_NR_DCTO_INSTRUCAO: TStringField
      FieldName = 'NR_DCTO_INSTRUCAO'
      Origin = 'TDOCUMENTO_INSTRUCAO.NR_DCTO_INSTRUCAO'
      Size = 25
    end
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA, AP_MOEDA'
      'FROM TMOEDA_BROKER')
    Left = 44
    Top = 145
    object qry_moeda_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TMOEDA.CD_MOEDA'
      Size = 3
    end
    object qry_moeda_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'TMOEDA.NM_MOEDA'
      Size = 30
    end
    object qry_moeda_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      Origin = 'TMOEDA.AP_MOEDA'
      Size = 6
    end
  end
  object qry_itens_dm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT F.CD_ITEM, NM_APELIDO'
      'FROM   TPROCESSO P'
      'JOIN ( TFATURAMENTO_CC F LEFT JOIN TITEM I'
      #9#9#9#9'ON ( F.CD_ITEM = I.CD_ITEM ) )'
      '  ON ( P.NR_PROCESSO = F.NR_PROCESSO )'
      'JOIN TEMPRESA_NAC E'
      '  ON P.CD_CLIENTE = E.CD_EMPRESA'
      'JOIN VW_DT_DESEMB V'
      '  ON ( P.NR_PROCESSO = V.NR_PROCESSO )'
      'WHERE'
      
        '    ( ( ( P.CD_CLIENTE = :CD_CLIENTE ) AND ( :CD_GRUPO = '#39#39' ) ) ' +
        'OR'
      
        '      ( ( E.CD_GRUPO = :CD_GRUPO ) AND ( :CD_CLIENTE = '#39#39' ) ) ) ' +
        'AND'
      '    ( I.CD_TIPO_ITEM IN ('#39'D'#39', '#39'R'#39') ) AND'
      '    ( F.IN_CANCELADO = '#39'0'#39' ) AND'
      '    ( F.IN_FATURADO = '#39'1'#39' ) AND'
      '    ( P.CD_PRODUTO = '#39'01'#39' ) AND'
      
        '    ( ( P.CD_UNID_NEG = :CD_UNID_NEG ) OR ( :CD_UNID_NEG = '#39#39' ) ' +
        ') AND'
      '    ( ( ( DATEPART( mm, V.DT_REALIZACAO ) = :MES ) AND'
      '        ( DATEPART( yy, V.DT_REALIZACAO ) = :ANO ) ) )')
    Params.Data = {
      010008000A43445F434C49454E544500010200300000000843445F475255504F
      00010200300000000843445F475255504F00010200300000000A43445F434C49
      454E544500010200300000000B43445F554E49445F4E45470001020030000000
      0B43445F554E49445F4E45470001020030000000034D45530003040000000000
      000003414E4F00030400000000000000}
    Left = 304
    Top = 140
    object qry_itens_dm_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_itens_dm_NM_APELIDO: TStringField
      FieldName = 'NM_APELIDO'
      Size = 10
    end
  end
  object qry_dm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_ITEM,'
      'CASE IN_RESTITUI'
      
        '  WHEN '#39'0'#39' THEN ISNULL( VL_ITEM, 0) + ISNULL( VL_ASSIST, 0 ) - I' +
        'SNULL( VL_IR, 0 )'
      
        '  WHEN '#39'1'#39' THEN ( ISNULL( VL_ITEM, 0) + ISNULL( VL_ASSIST, 0 ) -' +
        ' ISNULL( VL_IR, 0 ) ) * (-1)'
      'END VL_ITEM'
      'FROM   TFATURAMENTO_CC F'
      'WHERE'
      '    ( NR_PROCESSO = :NR_PROCESSO ) AND'
      '    ( CD_ITEM = :CD_ITEM ) AND'
      '    ( IN_CANCELADO = '#39'0'#39' ) AND'
      '    ( IN_FATURADO = '#39'1'#39' )')
    Params.Data = {
      010002000B4E525F50524F434553534F00010200300000000743445F4954454D
      0001020030000000}
    Left = 304
    Top = 196
    object qry_dm_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_dm_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_dm_VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object qry_dm_CalcNrProcesso: TStringField
      FieldName = 'CalcNrProcesso'
      Size = 9
      Calculated = True
    end
  end
  object qry_processo_: TQuery
    OnCalcFields = qry_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DISTINCT F.NR_PROCESSO NR_PROCESSO, D.DT_REALIZACAO DT_DE' +
        'SEMB,'
      
        'C.DT_REALIZACAO DT_CHEGADA, R.DT_REALIZACAO DT_RECEB_DOC, S.CD_V' +
        'IA_TRANSPORTE'
      'FROM   TPROCESSO P'
      'JOIN ( TFATURAMENTO_CC F JOIN TITEM I'
      '                           ON ( F.CD_ITEM = I.CD_ITEM ) )'
      '  ON ( P.NR_PROCESSO = F.NR_PROCESSO )'
      'JOIN TEMPRESA_NAC E'
      '  ON P.CD_CLIENTE = E.CD_EMPRESA'
      'JOIN VW_DT_DESEMB D'
      '       ON ( P.NR_PROCESSO = D.NR_PROCESSO )'
      'LEFT JOIN VW_DT_CHEGADA C'
      '       ON ( P.NR_PROCESSO = C.NR_PROCESSO )'
      'LEFT JOIN VW_DT_RECEB_DOC R'
      '       ON ( P.NR_PROCESSO = R.NR_PROCESSO )'
      'JOIN TSERVICO S'
      '       ON ( P.CD_SERVICO = S.CD_SERVICO )'
      'WHERE'
      
        '    ( ( ( P.CD_CLIENTE = :CD_CLIENTE ) AND ( :CD_GRUPO = '#39#39' ) ) ' +
        'OR'
      
        '      ( ( E.CD_GRUPO = :CD_GRUPO ) AND ( :CD_CLIENTE = '#39#39' ) ) ) ' +
        'AND'
      '    ( I.CD_TIPO_ITEM IN ('#39'D'#39', '#39'R'#39') ) AND'
      '    ( F.IN_CANCELADO = '#39'0'#39' ) AND'
      '    ( F.IN_FATURADO = '#39'1'#39' ) AND'
      '    ( P.CD_PRODUTO = '#39'01'#39' ) AND'
      
        '    ( ( P.CD_UNID_NEG = :CD_UNID_NEG ) OR ( :CD_UNID_NEG = '#39#39' ) ' +
        ') AND'
      '    ( ( ( DATEPART( mm, D.DT_REALIZACAO ) = :MES ) AND'
      '        ( DATEPART( yy, D.DT_REALIZACAO ) = :ANO ) ) )')
    Params.Data = {
      010008000A43445F434C49454E544500010200300000000843445F475255504F
      00010200300000000843445F475255504F00010200300000000A43445F434C49
      454E544500010200300000000B43445F554E49445F4E45470001020030000000
      0B43445F554E49445F4E45470001020030000000034D45530003040000000000
      000003414E4F00030400000000000000}
    Left = 304
    Top = 84
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CalcNrProcesso: TStringField
      FieldName = 'CalcNrProcesso'
      Size = 9
      Calculated = True
    end
    object qry_processo_DT_DESEMB: TDateTimeField
      FieldName = 'DT_DESEMB'
    end
    object qry_processo_DT_CHEGADA: TDateTimeField
      FieldName = 'DT_CHEGADA'
    end
    object qry_processo_DT_RECEB_DOC: TDateTimeField
      FieldName = 'DT_RECEB_DOC'
    end
    object qry_processo_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Size = 2
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 216
    Top = 85
  end
  object qry_tot_proc_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT COUNT( DISTINCT F.NR_PROCESSO ) TOT_PROC'
      'FROM   TPROCESSO P,'
      '       TFATURAMENTO_CC F,'
      '       TEMPRESA_NAC E,'
      '       TITEM I,'
      '       TSERVICO S,'
      '       VW_DT_DESEMB D,'
      '       VW_DT_RECEB_DOC R,'
      '       VW_DT_CHEGADA C'
      'WHERE'
      '    P.NR_PROCESSO = F.NR_PROCESSO AND'
      '    P.NR_PROCESSO = D.NR_PROCESSO AND'
      '    P.NR_PROCESSO *= C.NR_PROCESSO AND'
      '    P.NR_PROCESSO *= R.NR_PROCESSO AND'
      '    P.CD_CLIENTE = E.CD_EMPRESA AND'
      '    P.CD_SERVICO = S.CD_SERVICO AND'
      '    F.CD_ITEM = I.CD_ITEM AND'
      
        '    ( ( ( P.CD_CLIENTE = :CD_CLIENTE ) AND ( :CD_GRUPO = '#39#39' ) ) ' +
        'OR'
      
        '      ( ( E.CD_GRUPO = :CD_GRUPO ) AND ( :CD_CLIENTE = '#39#39' ) ) ) ' +
        'AND'
      '    ( I.CD_TIPO_ITEM IN ('#39'D'#39', '#39'R'#39') ) AND'
      '    ( F.IN_CANCELADO = '#39'0'#39' ) AND'
      '    ( F.IN_FATURADO = '#39'1'#39' ) AND'
      '    ( P.CD_PRODUTO = '#39'01'#39' ) AND'
      
        '    ( ( P.CD_UNID_NEG = :CD_UNID_NEG ) OR ( :CD_UNID_NEG = '#39#39' ) ' +
        ') AND'
      '    ( ( ( DATEPART( mm, D.DT_REALIZACAO ) = :MES ) AND'
      '        ( DATEPART( yy, D.DT_REALIZACAO ) = :ANO ) ) )'
      '')
    Params.Data = {
      010008000A43445F434C49454E544500010200300000000843445F475255504F
      00010200300000000843445F475255504F00010200300000000A43445F434C49
      454E544500010200300000000B43445F554E49445F4E45470001020030000000
      0B43445F554E49445F4E45470001020030000000034D45530003040000000000
      000003414E4F00030400000000000000}
    Left = 384
    Top = 84
    object qry_tot_proc_TOT_PROC: TIntegerField
      FieldName = 'TOT_PROC'
    end
  end
  object qry_fob_us_: TQuery
    OnCalcFields = qry_fob_us_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, ISNULL( P.VL_MLE_MN, 0 ) VL_MLE_MN, ISNULL' +
        '( D.TX_DOLAR, 0 ) TX_DOLAR'
      'FROM TPROCESSO P'
      'LEFT JOIN TDECLARACAO_IMPORTACAO D'
      '       ON (P.NR_PROCESSO = D.NR_PROCESSO)'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 384
    Top = 141
    object qry_fob_us_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_fob_us_VL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
    end
    object qry_fob_us_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
    end
    object qry_fob_us_CalcValorFOB: TFloatField
      FieldName = 'CalcValorFOB'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
  end
end
