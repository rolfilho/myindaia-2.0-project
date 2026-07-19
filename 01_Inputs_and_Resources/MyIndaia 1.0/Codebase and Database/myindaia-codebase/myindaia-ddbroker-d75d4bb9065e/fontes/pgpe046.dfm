object datm_exp_impr_bordero: Tdatm_exp_impr_bordero
  Left = 23
  Top = 33
  Height = 390
  Width = 734
  object qry_unid_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG')
    Left = 389
    Top = 9
    object qry_unid_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_imp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT E.NM_EMPRESA, P.NM_PAIS_PORT'
      'FROM TEMPRESA_EST E'
      'LEFT JOIN TPAIS_BROKER P ON P.CD_PAIS = E.CD_PAIS'
      'WHERE CD_EMPRESA = :CD_IMPORTADOR'
      ''
      '')
    Params.Data = {010001000D43445F494D504F525441444F520001020030000000}
    Left = 101
    Top = 8
  end
  object qry_proc_exp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT E.NR_PROCESSO, E.DT_REGISTRO_PEDIDO, E.NR_FATURA, E.DT_FA' +
        'TURA, E.CD_MOEDA,'
      
        '       E.VL_TOT_MCV, E.CD_TERMO_PAGTO, E.CD_EXPORTADOR, E.CD_IMP' +
        'ORTADOR,'
      
        '       E.VL_TX_CAMBIO, E.CD_FORMA_PAGTO, E.NR_SD, E.TP_DOCUMENTO' +
        ', E.CD_DOCUMENTO,'
      
        '       E.CD_LINGUA_PEDIDO, E.CD_BANCO_SAQUE_BORDERO, E.VL_COMISS' +
        'AO_PERCENT,'
      
        '       M.AP_MOEDA, E.VL_TOT_COM_AGENTE, S.NM_EMPRESA AS NM_AGENT' +
        'E,'
      '       SAQ.DT_INICIAL AS DT_INICIAL'
      
        'FROM   TPROCESSO_EXP E, TMOEDA_BROKER M, TEMPRESA_EST S, TPROCES' +
        'SO_EXP_SAQUE SAQ'
      'WHERE  E.CD_MOEDA *= M.CD_MOEDA AND'
      '       E.CD_SEGURADORA *= S.CD_EMPRESA AND'
      '       E.NR_PROCESSO *= SAQ.NR_PROCESSO AND'
      '       E.NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 166
    Top = 8
    object qry_proc_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_exp_DT_REGISTRO_PEDIDO: TDateTimeField
      FieldName = 'DT_REGISTRO_PEDIDO'
      Origin = 'TPROCESSO_EXP.DT_REGISTRO_PEDIDO'
    end
    object qry_proc_exp_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPROCESSO_EXP.NR_FATURA'
      Size = 15
    end
    object qry_proc_exp_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPROCESSO_EXP.DT_FATURA'
    end
    object qry_proc_exp_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TPROCESSO_EXP.CD_MOEDA'
      Size = 3
    end
    object qry_proc_exp_CD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'TPROCESSO_EXP.CD_TERMO_PAGTO'
      Size = 6
    end
    object qry_proc_exp_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPROCESSO_EXP.CD_EXPORTADOR'
      Size = 5
    end
    object qry_proc_exp_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPROCESSO_EXP.CD_IMPORTADOR'
      Size = 5
    end
    object qry_proc_exp_VL_TX_CAMBIO: TFloatField
      FieldName = 'VL_TX_CAMBIO'
      Origin = 'TPROCESSO_EXP.VL_TX_CAMBIO'
    end
    object qry_proc_exp_CD_FORMA_PAGTO: TStringField
      FieldName = 'CD_FORMA_PAGTO'
      Origin = 'TPROCESSO_EXP.CD_FORMA_PAGTO'
      Size = 1
    end
    object qry_proc_exp_NR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'TPROCESSO_EXP.NR_SD'
      Size = 11
    end
    object qry_proc_exp_TP_DOCUMENTO: TStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'TPROCESSO_EXP.TP_DOCUMENTO'
      Size = 1
    end
    object qry_proc_exp_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TPROCESSO_EXP.CD_DOCUMENTO'
      Size = 5
    end
    object qry_proc_exp_CD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 1
    end
    object qry_proc_exp_CD_BANCO_SAQUE_BORDERO: TStringField
      FieldName = 'CD_BANCO_SAQUE_BORDERO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 5
    end
    object qry_proc_exp_VL_COMISSAO_PERCENT: TFloatField
      FieldName = 'VL_COMISSAO_PERCENT'
    end
    object qry_proc_exp_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      Size = 6
    end
    object qry_proc_exp_VL_TOT_COM_AGENTE: TFloatField
      FieldName = 'VL_TOT_COM_AGENTE'
    end
    object qry_proc_exp_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      Size = 60
    end
    object qry_proc_exp_DT_INICIAL: TDateTimeField
      FieldName = 'DT_INICIAL'
    end
    object qry_proc_exp_VL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
    end
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA, AP_MOEDA'
      'FROM TMOEDA_BROKER'
      'WHERE CD_MOEDA = :CD_MOEDA')
    Params.Data = {010001000843445F4D4F4544410001020030000000}
    Left = 328
    Top = 9
    object qry_moeda_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TMOEDA_BROKER.CD_MOEDA'
      Size = 3
    end
    object qry_moeda_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      Origin = 'TMOEDA_BROKER.AP_MOEDA'
      Size = 6
    end
  end
  object qry_exp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE CD_EMPRESA = :CD_EXPORTADOR'
      '')
    Params.Data = {010001000D43445F4558504F525441444F520001020030000000}
    Left = 42
    Top = 8
    object qry_exp_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object qry_termo_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_TERMO_PAGTO'
      'FROM TTERMO_PAGTO'
      'WHERE CD_TERMO_PAGTO = :CD_TERMO_PAGTO')
    Params.Data = {010001000E43445F5445524D4F5F504147544F0001020030000000}
    Left = 251
    Top = 8
    object qry_termo_pagto_NM_TERMO_PAGTO: TStringField
      FieldName = 'NM_TERMO_PAGTO'
      Origin = 'TTERMO_PAGTO.NM_TERMO_PAGTO'
      Size = 50
    end
  end
  object qry_banco_fatura_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_EMPRESA'
      'FROM   TEMPRESA_EST'
      'WHERE  CD_EMPRESA = :CD_BANCO_EXP'
      ''
      '')
    Params.Data = {010001000C43445F42414E434F5F4558500001020030000000}
    Left = 469
    Top = 9
    object qry_banco_fatura_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 60
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_exp_
    SQL.Strings = (
      
        'SELECT CD_BANCO_EXP, NR_CONHECIMENTO_MASTER, NR_CONHECIMENTO, CD' +
        '_ANALISTA_CLIENTE'
      'FROM TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 36
    Top = 122
    object qry_processo_CD_BANCO_EXP: TStringField
      FieldName = 'CD_BANCO_EXP'
      Origin = 'TPROCESSO.CD_BANCO_EXP'
      Size = 5
    end
    object qry_processo_CD_ANALISTA_CLIENTE: TStringField
      FieldName = 'CD_ANALISTA_CLIENTE'
      Origin = 'TPROCESSO.CD_BANCO_EXP'
      Size = 4
    end
    object qry_processo_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Origin = 'TPROCESSO.CD_BANCO_EXP'
      Size = 30
    end
    object qry_processo_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'TPROCESSO.NR_CONHECIMENTO_MASTER'
      Size = 30
    end
  end
  object qry_exp_saque_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_exp_
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_SAQUE, DT_VCTO_SAQUE, VL_TOT_SAQUE, TP_VC' +
        'TO'
      'FROM TPROCESSO_EXP_SAQUE'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 123
    Top = 122
    object qry_exp_saque_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_SAQUE.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_saque_NR_SAQUE: TStringField
      FieldName = 'NR_SAQUE'
      Origin = 'TPROCESSO_EXP_SAQUE.NR_SAQUE'
      Size = 10
    end
    object qry_exp_saque_DT_VCTO_SAQUE: TDateTimeField
      FieldName = 'DT_VCTO_SAQUE'
      Origin = 'TPROCESSO_EXP_SAQUE.DT_VCTO_SAQUE'
    end
    object qry_exp_saque_VL_TOT_SAQUE: TFloatField
      FieldName = 'VL_TOT_SAQUE'
      Origin = 'TPROCESSO_EXP_SAQUE.VL_TOT_SAQUE'
    end
    object qry_exp_saque_TP_VCTO: TStringField
      FieldName = 'TP_VCTO'
      Origin = 'TPROCESSO_EXP_SAQUE.NR_PROCESSO'
      Size = 1
    end
  end
  object qry_exp_re_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_exp_
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_RE'
      'FROM TPROCESSO_EXP_RE'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 208
    Top = 122
    object qry_exp_re_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_RE.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_re_NR_RE: TStringField
      FieldName = 'NR_RE'
      Origin = 'TPROCESSO_EXP_RE.NR_RE'
      Size = 12
    end
  end
  object qry_documento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT E.NM_EMPRESA AS NM_EMPRESA, LTRIM(RTRIM(E.END_EMPRESA)) +' +
        ' CASE LTRIM(RTRIM(ISNULL(E.END_COMPL,""))) WHEN "" THEN "" ELSE ' +
        '" - " END +'
      
        '       CASE LTRIM(RTRIM(ISNULL(E.END_COMPL,"")))  WHEN "" THEN "' +
        '" ELSE E.END_COMPL END +'
      
        '       CASE LTRIM(RTRIM(ISNULL(E.END_NUMERO,""))) WHEN "" THEN "' +
        '" ELSE ", "+ E.END_NUMERO END + CASE LTRIM(RTRIM(ISNULL(E.END_NU' +
        'MERO,""))) WHEN "" THEN "" ELSE " - " END +'
      
        '       CASE LTRIM(RTRIM(ISNULL(E.END_CIDADE,""))) WHEN "" THEN "' +
        '" ELSE E.END_CIDADE END + CASE LTRIM(RTRIM(ISNULL(E.END_CIDADE,"' +
        '"))) WHEN "" THEN "" ELSE " - " END +'
      
        '       CASE LTRIM(RTRIM(ISNULL(E.END_ESTADO,""))) WHEN "" THEN "' +
        '" ELSE E.END_ESTADO END + CASE LTRIM(RTRIM(ISNULL(E.END_ESTADO,"' +
        '"))) WHEN "" THEN "" ELSE " - " END +'
      
        '       CASE LTRIM(RTRIM(ISNULL(P.NM_PAIS_PORT,""))) WHEN "" THEN' +
        ' "" ELSE P.NM_PAIS_PORT END AS END_EMPRESA'
      'FROM TEMPRESA_EST E'
      'LEFT JOIN TPAIS_BROKER P ON P.CD_PAIS = E.CD_PAIS')
    Left = 400
    Top = 122
  end
  object qry_referencia_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_exp_
    SQL.Strings = (
      'SELECT * FROM '
      'TAUX_EXP_REF'
      'WHERE NR_PROCESSO=:NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 283
    Top = 122
    object qry_referencia_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TAUX_EXP_REF.NR_PROCESSO'
      Size = 18
    end
    object qry_referencia_NM_REFERENCIA: TStringField
      FieldName = 'NM_REFERENCIA'
      Origin = 'TAUX_EXP_REF.NM_REFERENCIA'
      Size = 200
    end
  end
  object qry_ttp_data_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM '
      'TTP_DATA_SAQUE'
      'WHERE CODIGO = :CODIGO'
      'ORDER BY CODIGO')
    Params.Data = {0100010006434F4449474F0001020030000000}
    Left = 35
    Top = 182
    object qry_ttp_data_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_DATA_SAQUE.CODIGO'
      Size = 1
    end
    object qry_ttp_data_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_DATA_SAQUE.CODIGO'
      Size = 30
    end
  end
  object qry_executa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT E.NR_PROCESSO, E.NR_SEQUENCIA, E.CD_DOCUMENTO, E.NR_REFER' +
        'ENCIA, E.QT_COPIAS, E.QT_ORIGINAIS, D.DESCRICAO'
      'FROM TPROCESSO_EXP_BORD_ITEM E'
      'LEFT JOIN TTP_DOCUMENTO D ON D.CODIGO = E.CD_DOCUMENTO'
      'WHERE E.NR_PROCESSO = :NR_PROCESSO AND'
      '      D.CD_UNID_NEG = :CD_UNID_NEG AND'
      '      D.CD_PRODUTO = '#39'02'#39' AND'
      '      D.DESCRICAO LIKE '#39'%'#39' + :NOME + '#39'%'#39)
    Params.Data = {
      010003000B4E525F50524F434553534F00010200300000000B43445F554E4944
      5F4E45470001020030000000044E4F4D450001020030000000}
    Left = 400
    Top = 177
    object qry_executa_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_executa_NR_SEQUENCIA: TStringField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.NR_SEQUENCIA'
      Size = 5
    end
    object qry_executa_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.CD_DOCUMENTO'
      Size = 3
    end
    object qry_executa_NR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.NR_REFERENCIA'
      Size = 10
    end
    object qry_executa_QT_COPIAS: TIntegerField
      FieldName = 'QT_COPIAS'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.QT_COPIAS'
    end
    object qry_executa_QT_ORIGINAIS: TIntegerField
      FieldName = 'QT_ORIGINAIS'
      Origin = 'TPROCESSO_EXP_BORD_ITEM.QT_ORIGINAIS'
    end
    object qry_executa_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_DOCUMENTO.DESCRICAO'
      Size = 50
    end
  end
  object by_he_Bordero: TByHEDoc
    ppSelfEditor = False
    ppAutoRefresh = True
    OnDoc = by_he_BorderoDoc
    Left = 640
    Top = 64
  end
  object ds_proc_exp_: TDataSource
    DataSet = qry_proc_exp_
    Left = 167
    Top = 64
  end
  object qry_exp_nf_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_exp_
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_NF'
      'FROM TPROCESSO_EXP_NF'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 208
    Top = 178
    object qry_exp_nf_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_NF.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_nf_NR_NF: TStringField
      FieldName = 'NR_NF'
      Origin = 'TPROCESSO_EXP_NF.NR_NF'
      Size = 10
    end
  end
  object qry_analista_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_CONTATO AS NM_USUARIO'
      'FROM   TCLIENTE_CONTATO C, TPROCESSO P'
      'WHERE  P.CD_UNID_NEG = C.CD_UNID_NEG AND'
      '       P.CD_PRODUTO = C.CD_PRODUTO AND'
      '       P.CD_CLIENTE = C.CD_CLIENTE AND'
      '       P.CD_CONTATO = C.CD_CONTATO AND'
      '       P.NR_PROCESSO = :NR_PROCESSO'
      '')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 286
    Top = 178
    object qry_analista_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TCLIENTE_CONTATO.NM_CONTATO'
      Size = 50
    end
  end
  object qry_banco_bordero_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NM_BANCO,'
      '       LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) +'
      '       CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) )'
      '         WHEN "" THEN ""'
      
        '         ELSE ", " + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ' +
        ')'
      '       END +'
      '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) )'
      '         WHEN "" THEN ""'
      
        '         ELSE " - " + LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ' +
        ')'
      '       END +'
      '       CASE LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) )'
      '         WHEN "" THEN ""'
      
        '         ELSE ", " + LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ' +
        ')'
      '       END +'
      '       CASE LTRIM( RTRIM( ISNULL( E.END_ESTADO, "" ) ) )'
      '         WHEN "" THEN ""'
      
        '         ELSE ", " + LTRIM( RTRIM( ISNULL( E.END_ESTADO, "" ) ) ' +
        ')'
      '       END +'
      '       CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS, "" ) ) )'
      '         WHEN "" THEN ""'
      '         ELSE ", " + LTRIM( RTRIM( ISNULL( P.NM_PAIS, "" ) ) )'
      '       END AS END_BANCO'
      'FROM   TEMPRESA_EST E, TPAIS_BROKER P'
      'WHERE  E.CD_PAIS *= P.CD_PAIS AND'
      '       E.CD_EMPRESA = :CD_BANCO_SAQUE_BORDERO'
      ''
      '')
    Params.Data = {
      010001001643445F42414E434F5F53415155455F424F524445524F0001020030
      000000}
    Left = 517
    Top = 121
    object qry_banco_bordero_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Size = 60
    end
    object qry_banco_bordero_END_BANCO: TStringField
      FieldName = 'END_BANCO'
      Size = 255
    end
  end
end
