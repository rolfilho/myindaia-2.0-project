object datm_trans_LI: Tdatm_trans_LI
  Left = 76
  Top = 102
  Height = 301
  Width = 589
  object REGIMP: TDatabase
    AliasName = 'DBLicenca'
    DatabaseName = 'REGIMP'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 56
    Top = 16
  end
  object qry_li_scx_: TQuery
    AutoCalcFields = False
    DatabaseName = 'REGIMP'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM OPERAÇÃO_COM_TRATAMENTO '
      'ORDER BY NR_IDENT_USUARIO')
    Left = 160
    Top = 16
    object qry_li_scx_NR_TRAT_IMP_MICRO: TStringField
      FieldName = 'NR_TRAT_IMP_MICRO'
      Size = 8
    end
    object qry_li_scx_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 15
    end
    object qry_li_scx_NR_OPER_TRAT_PROT: TStringField
      FieldName = 'NR_OPER_TRAT_PROT'
      Size = 10
    end
    object qry_li_scx_CD_AUTORIZ_TRANSM: TStringField
      FieldName = 'CD_AUTORIZ_TRANSM'
      Size = 1
    end
    object qry_li_scx_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      EditMask = '99\/0000000\-0;0;_'
      Size = 10
    end
    object qry_li_scx_NR_LI_SUBSTITUIDO: TStringField
      FieldName = 'NR_LI_SUBSTITUIDO'
      Size = 10
    end
    object qry_li_scx_CD_ORIGEM_LI: TStringField
      FieldName = 'CD_ORIGEM_LI'
      Size = 1
    end
    object qry_li_scx_NR_DECL_IMP_VINC: TStringField
      FieldName = 'NR_DECL_IMP_VINC'
      Size = 10
    end
    object qry_li_scx_NR_ADI_IMP_VINC: TStringField
      FieldName = 'NR_ADI_IMP_VINC'
      Size = 3
    end
    object qry_li_scx_NR_SEQ_RETI_VINC: TStringField
      FieldName = 'NR_SEQ_RETI_VINC'
      Size = 2
    end
    object qry_li_scx_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object qry_li_scx_NR_IMPORTADOR: TStringField
      FieldName = 'NR_IMPORTADOR'
      EditMask = '00\.000\.000\/0000\-00;0;_'
      Size = 14
    end
    object qry_li_scx_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object qry_li_scx_NM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      Size = 60
    end
    object qry_li_scx_NR_TEL_IMPORTADOR: TStringField
      FieldName = 'NR_TEL_IMPORTADOR'
      Size = 15
    end
    object qry_li_scx_ED_LOGR_IMPORTADOR: TStringField
      FieldName = 'ED_LOGR_IMPORTADOR'
      Size = 40
    end
    object qry_li_scx_ED_NR_IMPORTADOR: TStringField
      FieldName = 'ED_NR_IMPORTADOR'
      Size = 6
    end
    object qry_li_scx_ED_COMPL_IMPO: TStringField
      FieldName = 'ED_COMPL_IMPO'
      Size = 21
    end
    object qry_li_scx_ED_BA_IMPORTADOR: TStringField
      FieldName = 'ED_BA_IMPORTADOR'
      Size = 25
    end
    object qry_li_scx_ED_MUN_IMPORTADOR: TStringField
      FieldName = 'ED_MUN_IMPORTADOR'
      Size = 25
    end
    object qry_li_scx_ED_UF_IMPORTADOR: TStringField
      FieldName = 'ED_UF_IMPORTADOR'
      Size = 2
    end
    object qry_li_scx_ED_CEP_IMPORTADOR: TStringField
      FieldName = 'ED_CEP_IMPORTADOR'
      Size = 8
    end
    object qry_li_scx_CD_ATIV_ECON_IMPO: TStringField
      FieldName = 'CD_ATIV_ECON_IMPO'
      Size = 4
    end
    object qry_li_scx_NR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object qry_li_scx_CD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      Size = 7
    end
    object qry_li_scx_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Size = 60
    end
    object qry_li_scx_ED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object qry_li_scx_ED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Size = 6
    end
    object qry_li_scx_ED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object qry_li_scx_ED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object qry_li_scx_ED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object qry_li_scx_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object qry_li_scx_CD_MERCADORIA_NCM: TStringField
      FieldName = 'CD_MERCADORIA_NCM'
      Size = 8
    end
    object qry_li_scx_CD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Size = 3
    end
    object qry_li_scx_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object qry_li_scx_NM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Size = 60
    end
    object qry_li_scx_ED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      Size = 40
    end
    object qry_li_scx_ED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      Size = 6
    end
    object qry_li_scx_ED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      Size = 21
    end
    object qry_li_scx_ED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Size = 25
    end
    object qry_li_scx_ED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Size = 25
    end
    object qry_li_scx_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object qry_li_scx_CD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Size = 7
    end
    object qry_li_scx_CD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Size = 8
    end
    object qry_li_scx_PL_MERCADORIA: TStringField
      FieldName = 'PL_MERCADORIA'
      Size = 15
    end
    object qry_li_scx_QT_UN_ESTATISTICA: TStringField
      FieldName = 'QT_UN_ESTATISTICA'
      Size = 15
    end
    object qry_li_scx_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object qry_li_scx_QT_DIA_LIMITE_PGTO: TStringField
      FieldName = 'QT_DIA_LIMITE_PGTO'
      Size = 3
    end
    object qry_li_scx_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Size = 3
    end
    object qry_li_scx_VL_MERC_MNEG_EMB: TStringField
      FieldName = 'VL_MERC_MNEG_EMB'
      Size = 11
    end
    object qry_li_scx_VL_TOT_DOLAR_EMB: TStringField
      FieldName = 'VL_TOT_DOLAR_EMB'
      Size = 11
    end
    object qry_li_scx_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object qry_li_scx_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Size = 3
    end
    object qry_li_scx_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Size = 1
    end
    object qry_li_scx_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Size = 2
    end
    object qry_li_scx_CD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Size = 1
    end
    object qry_li_scx_CD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Size = 2
    end
    object qry_li_scx_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object qry_li_scx_CD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Size = 2
    end
    object qry_li_scx_CD_AGENCIA_SECEX: TStringField
      FieldName = 'CD_AGENCIA_SECEX'
      Size = 5
    end
    object qry_li_scx_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object qry_li_scx_IN_REST_DATA_EMB_LI: TStringField
      FieldName = 'IN_REST_DATA_EMB_LI'
      Size = 1
    end
    object qry_li_scx_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
    end
    object qry_li_scx_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
    end
    object qry_li_scx_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Size = 13
    end
    object qry_li_scx_NR_COMUNIC_COMPRA: TStringField
      FieldName = 'NR_COMUNIC_COMPRA'
      Size = 13
    end
    object qry_li_scx_DT_REG_OPER_TRAT: TStringField
      FieldName = 'DT_REG_OPER_TRAT'
      Size = 10
    end
    object qry_li_scx_DT_ATU_OPER_MICRO: TStringField
      FieldName = 'DT_ATU_OPER_MICRO'
      Size = 10
    end
    object qry_li_scx_IN_SALVO_DIAG: TBooleanField
      FieldName = 'IN_SALVO_DIAG'
    end
    object qry_li_scx_IN_SELECAO_DIAG: TBooleanField
      FieldName = 'IN_SELECAO_DIAG'
    end
    object qry_li_scx_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      BlobType = ftMemo
    end
    object qry_li_scx_CD_SITUAC_OP_TRAT: TStringField
      FieldName = 'CD_SITUAC_OP_TRAT'
      Size = 2
    end
    object qry_li_scx_DT_SITUAC_OP_TRAT: TStringField
      FieldName = 'DT_SITUAC_OP_TRAT'
      Size = 10
    end
    object qry_li_scx_DT_VALID_OP_TRAT: TStringField
      FieldName = 'DT_VALID_OP_TRAT'
      Size = 10
    end
    object qry_li_scx_CD_CANCEL_OP_TRAT: TStringField
      FieldName = 'CD_CANCEL_OP_TRAT'
      Size = 1
    end
    object qry_li_scx_DT_CANCEL_OP_TRAT: TStringField
      FieldName = 'DT_CANCEL_OP_TRAT'
      Size = 10
    end
    object qry_li_scx_NR_CPF_CANC_ANUENC: TStringField
      FieldName = 'NR_CPF_CANC_ANUENC'
      Size = 11
    end
    object qry_li_scx_NR_LI_SUBSTITUTIVO: TStringField
      FieldName = 'NR_LI_SUBSTITUTIVO'
      Size = 10
    end
  end
  object TB_Numerador_LI: TTable
    DatabaseName = 'REGIMP'
    TableName = 'NUMERADOR_REG_IMP'
    Left = 48
    Top = 144
  end
  object RS_Item_LI: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    Left = 160
    Top = 144
  end
  object RS_Dest_NCM: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    Left = 160
    Top = 208
  end
  object RS_Proc_Anuente: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    Left = 48
    Top = 208
  end
  object RS_Diag_LI: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    Left = 240
    Top = 16
  end
  object TB_Ag_Secex: TTable
    DatabaseName = 'DBSISCOMEX'
    IndexName = 'PrimaryKey'
    TableName = 'TAB_AGENCIA_SECEX'
    Left = 160
    Top = 88
  end
  object TABSISCO: TDatabase
    AliasName = 'DBTabelas'
    DatabaseName = 'DBSISCOMEX'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 56
    Top = 88
  end
  object RS_TB: TQuery
    DatabaseName = 'TABSISCO'
    SQL.Strings = (
      'SELECT * FROM TAB_CONVERSAO_CAMBIO ')
    Left = 240
    Top = 88
  end
  object qry_li_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLICENCA_IMPORTACAO'
      'ORDER BY '
      'NR_PROCESSO')
    Left = 416
    Top = 88
  end
  object qry_li_itens_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    DataSource = ds_li_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLICENCA_ITENS'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_PROCESSO, NR_ITEM')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 481
    Top = 88
  end
  object ds_li_lista: TDataSource
    DataSet = qry_li_
    Left = 344
    Top = 24
  end
  object qry_li_lista_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLICENCA_IMPORTACAO'
      'ORDER BY '
      'NR_PROCESSO')
    Left = 341
    Top = 89
  end
  object qry_emp_nac_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TOP 1 E.CD_EMPRESA, E.NM_EMPRESA, E.CD_TIPO_PESSOA, E.CD_' +
        'PAIS_IMPORTADOR,'
      
        'E.CD_ATIV_ECONOMICA, E.END_EMPRESA, E.END_NUMERO, E.END_BAIRRO, ' +
        'E.END_CIDADE,'
      
        'E.END_UF, E.END_CEP, E.CGC_EMPRESA, E.CPF_EMPRESA, E.OUTRO_DOC, ' +
        'C.NR_FONE'
      'FROM TEMPRESA_NAC E'
      'LEFT OUTER JOIN TCLIENTE_CONTATO C'
      'ON ( E.CD_EMPRESA = C.CD_CLIENTE )'
      'WHERE'
      'E.CD_EMPRESA = :CD_CLIENTE')
    Params.Data = {010001000A43445F434C49454E54450001020030000000}
    Left = 416
    Top = 144
  end
  object qry_emp_est_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_EMPRESA, NM_EMPRESA, END_EMPRESA, END_NUMERO, END_COMP' +
        'L,'
      'END_CIDADE, END_ESTADO, CD_PAIS'
      'FROM TEMPRESA_EST'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Params.Data = {010001000A43445F454D50524553410001020030000000}
    Left = 416
    Top = 200
  end
end
