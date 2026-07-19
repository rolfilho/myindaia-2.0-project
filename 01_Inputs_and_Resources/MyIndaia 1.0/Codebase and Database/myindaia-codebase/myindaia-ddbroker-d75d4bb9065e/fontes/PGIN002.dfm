object datm_int_work_im: Tdatm_int_work_im
  Left = 298
  Top = 168
  Height = 379
  Width = 423
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
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Params.Data = {010001000A43445F454D50524553410001020030000000}
    Left = 43
    Top = 146
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
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT *'
      'FROM TSERVICO'
      'WHERE CD_SERVICO = :CD_SERVICO ')
    Params.Data = {010001000A43445F5345525649434F0001020030000000}
    Left = 41
    Top = 202
    object qry_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
    object qry_servico_CD_CLASSIFICACAO: TStringField
      FieldName = 'CD_CLASSIFICACAO'
      Origin = 'TSERVICO.CD_CLASSIFICACAO'
      Size = 2
    end
    object qry_servico_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TSERVICO.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_servico_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TSERVICO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_cliente_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT S.CD_CLIENTE, S.CD_UNID_NEG, S.CD_PRODUTO,  S.CD_SERVICO'
      'FROM TCLIENTE_SERVICO S, TEMPRESA_NAC E'
      'WHERE ( S.CD_UNID_NEG = :CD_UNID_NEG OR :CD_UNID_NEG = '#39#39') AND'
      '      ( S.CD_PRODUTO = :CD_PRODUTO OR :CD_PRODUTO = '#39#39') AND'
      '      ( S.CD_SERVICO = :CD_SERVICO OR :CD_SERVICO = '#39#39')'
      '      '
      ''
      '')
    Params.Data = {
      010006000B43445F554E49445F4E454700010200300000000B43445F554E4944
      5F4E454700010200300000000A43445F50524F4455544F00010200300000000A
      43445F50524F4455544F00010200300000000A43445F5345525649434F000000
      000A43445F5345525649434F00000000}
    Left = 136
    Top = 83
    object qry_cliente_servico_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_servico_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_SERVICO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_servico_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_SERVICO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TCLIENTE_SERVICO.CD_SERVICO'
      Size = 3
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO=:CD_PRODUTO')
    Params.Data = {010001000A43445F50524F4455544F0001020030000000}
    Left = 140
    Top = 140
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
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT(NR_PROCESSO) FROM TPROCESSO'
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
      '')
    Left = 144
    Top = 200
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
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
  object qry_dados_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  CD_CLIENTE, CD_SERVICO'
      'FROM TPROCESSO'
      'WHERE CD_UNID_NEG =:CD_UNID_NEG '
      'AND CD_PRODUTO =:CD_PRODUTO'
      'AND NR_PROCESSO =:NR_PROCESSO')
    Params.Data = {
      010003000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F00010200300000000B4E525F50524F434553534F0001020030000000}
    Left = 40
    Top = 272
    object qry_dados_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_dados_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 3
    end
  end
  object qry_arq_proc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_CLIENTE,   '
      '       (SELECT NR_DECLARACAO_IMP FROM TDECLARACAO_IMPORTACAO'
      '        WHERE NR_PROCESSO = P.NR_PROCESSO) AS NR_DECLARACAO_IMP,'
      '       (SELECT DT_REGISTRO_DI FROM TDECLARACAO_IMPORTACAO'
      
        '        WHERE NR_PROCESSO = P.NR_PROCESSO) AS DT_REGISTRO_DI,VL_' +
        'MLE_MN,'
      '       NR_CONHECIMENTO,    '
      '       NR_CONHECIMENTO_MASTER, TX_MERCADORIA ,'
      
        '       (SELECT CD_REFERENCIA FROM TREF_CLIENTE C WHERE C.NR_PROC' +
        'ESSO = P.NR_PROCESSO'
      
        '        AND C.NR_SEQUENCIA = (SELECT MIN(NR_SEQUENCIA) FROM TREF' +
        '_CLIENTE TREF WHERE '
      '                              TREF.NR_PROCESSO = P.NR_PROCESSO )'
      '        ) AS CD_REFERENCIA, '
      '        DT_ABERTURA,'
      '       (SELECT DT_REALIZACAO FROM TFOLLOWUP F'
      '        WHERE F.NR_PROCESSO =P.NR_PROCESSO '
      '        AND F.CD_SERVICO =:CD_SERVICO'
      '        AND F.CD_EVENTO = (SELECT CD_EVENTO_CONCLUSOR '
      '                   FROM TSERVICO'
      
        '                   WHERE CD_SERVICO = F.CD_SERVICO)) AS DATA_TER' +
        'MINO'
      'FROM TPROCESSO P'
      'WHERE P.NR_PROCESSO =:NR_PROCESSO'
      'AND P.CD_UNID_NEG =:CD_UNID_NEG'
      'AND P.CD_PRODUTO =:CD_PRODUTO'
      '')
    Params.Data = {
      010004000A43445F5345525649434F00010200300000000B4E525F50524F4345
      53534F00010200300000000B43445F554E49445F4E454700010200300000000A
      43445F50524F4455544F0001020030000000}
    Left = 144
    Top = 264
    object qry_arq_proc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_arq_proc_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_arq_proc_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Size = 10
    end
    object qry_arq_proc_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Size = 8
    end
    object qry_arq_proc_VL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
    end
    object qry_arq_proc_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object qry_arq_proc_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Size = 30
    end
    object qry_arq_proc_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_arq_proc_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Size = 15
    end
    object qry_arq_proc_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
    end
    object qry_arq_proc_DATA_TERMINO: TDateTimeField
      FieldName = 'DATA_TERMINO'
    end
  end
  object qry_arq_import_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, CGC_EMP' +
        'RESA ,CPF_EMPRESA,'
      '       NM_EMPRESA, AP_EMPRESA, CD_TIPO_PESSOA,'
      '       (SELECT DT_VALID_CRED_RF FROM TCLIENTE_HABILITACAO'
      
        '               WHERE CD_CLIENTE =:CD_CLIENTE AND CD_UNID_NEG =:C' +
        'D_UNID_NEG'
      
        '               AND CD_PRODUTO =:CD_PRODUTO) AS DT_VALID_CRED_RF ' +
        ','
      '       CD_CLIENTE,   '
      '       END_CIDADE'
      'FROM TPROCESSO P, TEMPRESA_NAC E'
      'WHERE P.NR_PROCESSO =:NR_PROCESSO'
      'AND   P.CD_UNID_NEG =:CD_UNID_NEG'
      'AND   P.CD_PRODUTO  =:CD_PRODUTO'
      'AND   P.CD_CLIENTE  =:CD_CLIENTE'
      'AND   P.CD_SERVICO  =:CD_SERVICO'
      'AND   E.CD_EMPRESA = P.CD_CLIENTE')
    Params.Data = {
      010008000A43445F434C49454E544500010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F00010200300000000B4E
      525F50524F434553534F00010200300000000B43445F554E49445F4E45470001
      0200300000000A43445F50524F4455544F00010200300000000A43445F434C49
      454E544500010200300000000A43445F5345525649434F0001020030000000}
    Left = 240
    Top = 264
    object qry_arq_import_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_arq_import_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_arq_import_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_arq_import_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_arq_import_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
    object qry_arq_import_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Size = 11
    end
    object qry_arq_import_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_arq_import_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_arq_import_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Size = 1
    end
    object qry_arq_import_DT_VALID_CRED_RF: TDateTimeField
      FieldName = 'DT_VALID_CRED_RF'
    end
    object qry_arq_import_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_arq_import_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 30
    end
  end
  object qry_parametro_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PATH_WORK_IMAGE FROM TPARAMETROS')
    Left = 240
    Top = 200
    object qry_parametro_PATH_WORK_IMAGE: TStringField
      FieldName = 'PATH_WORK_IMAGE'
      Origin = 'TPARAMETROS.PATH_WORK_IMAGE'
      Size = 100
    end
  end
  object qry_edita_etiqueta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT IN_ETIQUETA'
      'FROM TPROCESSO'
      'WHERE CD_UNID_NEG =:CD_UNID_NEG'
      'AND CD_PRODUTO =:CD_PRODUTO'
      'AND NR_PROCESSO =:NR_PROCESSO')
    Params.Data = {
      010003000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F00010200300000000B4E525F50524F434553534F0001020030000000}
    Left = 336
    Top = 264
    object qry_edita_etiqueta_IN_ETIQUETA: TStringField
      FieldName = 'IN_ETIQUETA'
      Origin = 'TPROCESSO.IN_ETIQUETA'
      Size = 1
    end
  end
end
