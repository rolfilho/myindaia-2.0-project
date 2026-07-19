object datm_exp_carta_cred: Tdatm_exp_carta_cred
  Left = 97
  Top = 94
  Height = 454
  Width = 642
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 35
    Top = 118
  end
  object qry_lista_: TQuery
    AfterScroll = qry_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT C.NR_PROCESSO, SUBSTRING( C.NR_PROCESSO, 5, 14 ) AS CalcN' +
        'rProcesso,'
      
        '       P.CD_CLIENTE AS CD_EXPORTADOR, EN.NM_EMPRESA AS NM_EXPORT' +
        'ADOR,'
      
        '       P.CD_EMP_EST AS CD_IMPORTADOR, EE.NM_EMPRESA AS NM_IMPORT' +
        'ADOR'
      
        'FROM   TEXP_CARTA_CRED C, TPROCESSO P, TEMPRESA_NAC EN, TEMPRESA' +
        '_EST EE'
      'WHERE  C.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_CLIENTE *= EN.CD_EMPRESA AND'
      '       P.CD_EMP_EST *= EE.CD_EMPRESA AND'
      
        '       ( SUBSTRING( C.NR_PROCESSO, 1, 2 ) = :CD_UNID_NEG ) ORDER' +
        ' BY'
      'C.NR_PROCESSO')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 34
    Top = 64
    object qry_lista_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_lista_CD_EXPORTADOR: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_EXPORTADOR'
      Size = 5
    end
    object qry_lista_NM_EXPORTADOR: TStringField
      DisplayLabel = 'Exportador'
      FieldName = 'NM_EXPORTADOR'
      Size = 50
    end
    object qry_lista_CD_IMPORTADOR: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object qry_lista_NM_IMPORTADOR: TStringField
      DisplayLabel = 'Importador'
      FieldName = 'NM_IMPORTADOR'
      Size = 60
    end
    object qry_lista_CalcNrProcesso: TStringField
      DisplayLabel = 'Nº Processo'
      FieldName = 'CalcNrProcesso'
      Size = 14
    end
  end
  object qry_exp_carta_cred_: TQuery
    CachedUpdates = True
    BeforeInsert = qry_exp_carta_cred_BeforeInsert
    BeforeEdit = qry_exp_carta_cred_BeforeEdit
    DatabaseName = 'DBBROKER'
    DataSource = ds_lista
    SQL.Strings = (
      'SELECT *'
      'FROM   TEXP_CARTA_CRED'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    UpdateObject = us_exp_carta_cred
    Left = 119
    Top = 64
  end
  object ds_exp_carta_cred: TDataSource
    DataSet = qry_exp_carta_cred_
    Left = 119
    Top = 118
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG'
      'FROM TUNID_NEG_PRODUTO '
      'WHERE (CD_UNID_NEG+CD_PRODUTO) IN '
      '               (SELECT (CD_UNID_NEG+CD_PRODUTO) '
      '               FROM TUSUARIO_HABILITACAO '
      '               WHERE CD_USUARIO=:CD_USUARIO'
      '              AND IN_ATIVO='#39'1'#39
      '              AND CD_PRODUTO='#39'02'#39')')
    Params.Data = {010001000A43445F5553554152494F0001020030000100}
    Left = 218
    Top = 184
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 32
    Top = 184
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 112
    Top = 240
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_EXPORTADOR, NR_FATURA, DT_FATURA, CD_TERM' +
        'O_PAGTO, VL_TOT_MCV,'
      '       CASE DATEPART( m, DT_FATURA )'
      '          WHEN 1 THEN "JANUARY"'
      '          WHEN 2 THEN "FEBRUARY"'
      '          WHEN 3 THEN "MARCH"'
      '          WHEN 4 THEN "APRIL"'
      '          WHEN 5 THEN "MAY"'
      '          WHEN 6 THEN "JUNE"'
      '          WHEN 7 THEN "JULY"'
      '          WHEN 8 THEN "AUGUST"'
      '          WHEN 9 THEN "SEPTEMBER"'
      '          WHEN 10 THEN "OCTOBER"'
      '          WHEN 11 THEN "NOVEMBER"'
      '          WHEN 12 THEN "DECEMBER"'
      
        '       END + " " + RIGHT( "0" + CONVERT( varchar(2), DATEPART( d' +
        'd, DT_FATURA ) ), 2 ) +'
      
        '       CASE RIGHT( CONVERT( varchar(2), DATEPART( d, DT_FATURA )' +
        ' ), 1 )'
      '          WHEN "1" THEN "ST"'
      '          WHEN "2" THEN "ND"'
      '          ELSE "TH"'
      
        '       END + ", " + CONVERT( char(4), DATEPART( yyyy, DT_FATURA ' +
        ') ) AS STR_DT_FATURA'
      'FROM   TPROCESSO_EXP'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 114
    Top = 184
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPROCESSO_EXP.DT_FATURA'
    end
    object qry_processo_CD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'TPROCESSO_EXP.CD_TERMO_PAGTO'
      Size = 6
    end
    object qry_processo_VL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      Origin = 'TPROCESSO_EXP.DT_FATURA'
    end
    object qry_processo_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 5
    end
    object qry_processo_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 15
    end
    object qry_processo_STR_DT_FATURA: TStringField
      FieldName = 'STR_DT_FATURA'
    end
  end
  object us_exp_carta_cred: TUpdateSQL
    ModifySQL.Strings = (
      'update TEXP_CARTA_CRED'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  TX_IMPORTADOR = :TX_IMPORTADOR,'
      '  TX_EXPORTADOR = :TX_EXPORTADOR,'
      '  TX_CONSIGNATARIO = :TX_CONSIGNATARIO,'
      '  TX_NOTIFY1 = :TX_NOTIFY1,'
      '  TX_NOTIFY2 = :TX_NOTIFY2,'
      '  TX_DOCTO = :TX_DOCTO,'
      '  TX_COPIA = :TX_COPIA,'
      '  TX_SAQUE = :TX_SAQUE,'
      '  NM_UNID_MED_PL = :NM_UNID_MED_PL,'
      '  NM_UNID_MED_PB = :NM_UNID_MED_PB,'
      '  NM_LOCAL_DESTINO = :NM_LOCAL_DESTINO,'
      '  NM_LOCAL_ORIGEM = :NM_LOCAL_ORIGEM,'
      '  NM_PAIS_DESTINO = :NM_PAIS_DESTINO,'
      '  NM_PAIS_ORIGEM = :NM_PAIS_ORIGEM,'
      '  TX_TERMO_PAGTO = :TX_TERMO_PAGTO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TEXP_CARTA_CRED'
      
        '  (NR_PROCESSO, TX_IMPORTADOR, TX_EXPORTADOR, TX_CONSIGNATARIO, ' +
        'TX_NOTIFY1, '
      
        '   TX_NOTIFY2, TX_DOCTO, TX_COPIA, TX_SAQUE, NM_UNID_MED_PL, NM_' +
        'UNID_MED_PB, '
      
        '   NM_LOCAL_DESTINO, NM_LOCAL_ORIGEM, NM_PAIS_DESTINO, NM_PAIS_O' +
        'RIGEM, '
      '   TX_TERMO_PAGTO)'
      'values'
      
        '  (:NR_PROCESSO, :TX_IMPORTADOR, :TX_EXPORTADOR, :TX_CONSIGNATAR' +
        'IO, :TX_NOTIFY1, '
      
        '   :TX_NOTIFY2, :TX_DOCTO, :TX_COPIA, :TX_SAQUE, :NM_UNID_MED_PL' +
        ', :NM_UNID_MED_PB, '
      
        '   :NM_LOCAL_DESTINO, :NM_LOCAL_ORIGEM, :NM_PAIS_DESTINO, :NM_PA' +
        'IS_ORIGEM, '
      '   :TX_TERMO_PAGTO)')
    DeleteSQL.Strings = (
      'delete from TEXP_CARTA_CRED'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 119
    Top = 15
  end
  object sp_exp_carta_cred: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exp_carta_cred'
    Params.Data = {
      0100020006526573756C74040304000000000000010C406E725F70726F636573
      736F0101020030000000}
    Left = 293
    Top = 21
  end
end
