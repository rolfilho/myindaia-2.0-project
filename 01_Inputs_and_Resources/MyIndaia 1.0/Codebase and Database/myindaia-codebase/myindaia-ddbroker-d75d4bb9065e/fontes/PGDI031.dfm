object datm_integracao_li: Tdatm_integracao_li
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 295
  Top = 100
  Height = 508
  Width = 555
  object ConAccessLI: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\SI' +
      'SCOPRD\import.prd\regimp.mdb;Mode=Share Deny None;Extended Prope' +
      'rties="";Persist Security Info=False;Jet OLEDB:System database="' +
      '";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet ' +
      'OLEDB:Engine Type=3;Jet OLEDB:Database Locking Mode=0;Jet OLEDB:' +
      'Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;J' +
      'et OLEDB:New Database Password="";Jet OLEDB:Create System Databa' +
      'se=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy L' +
      'ocale on Compact=False;Jet OLEDB:Compact Without Replica Repair=' +
      'False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 24
  end
  object ConBroker: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=SA;Initial Catalog=BROKER;Data Source=INDAIA10;Use Procedure' +
      ' for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ' +
      'ID=0037-MICHEL;Use Encryption for Data=False;Tag with column col' +
      'lation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 237
    Top = 24
  end
  object sp_unid_medida: TADOStoredProc
    Connection = ConBroker
    ProcedureName = 'sp_unid_medida'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@nm_un_med_comerc'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@cd_unid_medida'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 3
        Value = Null
      end>
    Left = 240
    Top = 88
  end
  object qry_existe_item_li_: TADOQuery
    Connection = ConBroker
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'NR_ITEM'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end>
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT'
      'FROM TLICENCA_ITENS'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ITEM = :NR_ITEM')
    Left = 344
    Top = 88
    object qry_existe_item_li_TOT: TIntegerField
      FieldName = 'TOT'
      ReadOnly = True
    end
  end
  object tbl_li_o_: TADOTable
    Connection = ConAccessLI
    TableName = 'OPERA'#199#195'O_COM_TRATAMENTO'
    Left = 48
    Top = 88
    object tbl_li_o_NR_TRAT_IMP_MICRO: TWideStringField
      FieldName = 'NR_TRAT_IMP_MICRO'
      Size = 8
    end
    object tbl_li_o_NR_IDENT_USUARIO: TWideStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 15
    end
    object tbl_li_o_NR_OPER_TRAT_PROT: TWideStringField
      FieldName = 'NR_OPER_TRAT_PROT'
      Size = 10
    end
    object tbl_li_o_CD_AUTORIZ_TRANSM: TWideStringField
      FieldName = 'CD_AUTORIZ_TRANSM'
      Size = 1
    end
    object tbl_li_o_NR_OPER_TRAT_PREV: TWideStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Size = 10
    end
    object tbl_li_o_NR_LI_SUBSTITUIDO: TWideStringField
      FieldName = 'NR_LI_SUBSTITUIDO'
      Size = 10
    end
    object tbl_li_o_CD_ORIGEM_LI: TWideStringField
      FieldName = 'CD_ORIGEM_LI'
      Size = 1
    end
    object tbl_li_o_NR_DECL_IMP_VINC: TWideStringField
      FieldName = 'NR_DECL_IMP_VINC'
      Size = 10
    end
    object tbl_li_o_NR_ADI_IMP_VINC: TWideStringField
      FieldName = 'NR_ADI_IMP_VINC'
      Size = 3
    end
    object tbl_li_o_NR_SEQ_RETI_VINC: TWideStringField
      FieldName = 'NR_SEQ_RETI_VINC'
      Size = 2
    end
    object tbl_li_o_CD_TIPO_IMPORTADOR: TWideStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object tbl_li_o_NR_IMPORTADOR: TWideStringField
      FieldName = 'NR_IMPORTADOR'
      Size = 14
    end
    object tbl_li_o_CD_PAIS_IMPORTADOR: TWideStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object tbl_li_o_NM_IMPORTADOR: TWideStringField
      FieldName = 'NM_IMPORTADOR'
      Size = 60
    end
    object tbl_li_o_NR_TEL_IMPORTADOR: TWideStringField
      FieldName = 'NR_TEL_IMPORTADOR'
      Size = 15
    end
    object tbl_li_o_ED_LOGR_IMPORTADOR: TWideStringField
      FieldName = 'ED_LOGR_IMPORTADOR'
      Size = 40
    end
    object tbl_li_o_ED_NR_IMPORTADOR: TWideStringField
      FieldName = 'ED_NR_IMPORTADOR'
      Size = 6
    end
    object tbl_li_o_ED_COMPL_IMPO: TWideStringField
      FieldName = 'ED_COMPL_IMPO'
      Size = 21
    end
    object tbl_li_o_ED_BA_IMPORTADOR: TWideStringField
      FieldName = 'ED_BA_IMPORTADOR'
      Size = 25
    end
    object tbl_li_o_ED_MUN_IMPORTADOR: TWideStringField
      FieldName = 'ED_MUN_IMPORTADOR'
      Size = 25
    end
    object tbl_li_o_ED_UF_IMPORTADOR: TWideStringField
      FieldName = 'ED_UF_IMPORTADOR'
      Size = 2
    end
    object tbl_li_o_ED_CEP_IMPORTADOR: TWideStringField
      FieldName = 'ED_CEP_IMPORTADOR'
      Size = 8
    end
    object tbl_li_o_CD_ATIV_ECON_IMPO: TWideStringField
      FieldName = 'CD_ATIV_ECON_IMPO'
      Size = 4
    end
    object tbl_li_o_NR_CPF_REPR_LEGAL: TWideStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object tbl_li_o_CD_URF_ENTR_MERC: TWideStringField
      FieldName = 'CD_URF_ENTR_MERC'
      Size = 7
    end
    object tbl_li_o_NM_FORN_ESTR: TWideStringField
      FieldName = 'NM_FORN_ESTR'
      Size = 60
    end
    object tbl_li_o_ED_LOGR_FORN_ESTR: TWideStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object tbl_li_o_ED_NR_FORN_ESTR: TWideStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Size = 6
    end
    object tbl_li_o_ED_COMPL_FORN_ESTR: TWideStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object tbl_li_o_ED_CIDAD_FORN_ESTR: TWideStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object tbl_li_o_ED_ESTAD_FORN_ESTR: TWideStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object tbl_li_o_CD_PAIS_AQUIS_MERC: TWideStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object tbl_li_o_CD_MERCADORIA_NCM: TWideStringField
      FieldName = 'CD_MERCADORIA_NCM'
      Size = 8
    end
    object tbl_li_o_CD_PAIS_PROC_MERC: TWideStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Size = 3
    end
    object tbl_li_o_CD_AUSENCIA_FABRIC: TWideStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object tbl_li_o_NM_FABRICANTE_MERC: TWideStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Size = 60
    end
    object tbl_li_o_ED_LOGR_FABRIC: TWideStringField
      FieldName = 'ED_LOGR_FABRIC'
      Size = 40
    end
    object tbl_li_o_ED_NR_FABRIC: TWideStringField
      FieldName = 'ED_NR_FABRIC'
      Size = 6
    end
    object tbl_li_o_ED_COMPL_FABRIC: TWideStringField
      FieldName = 'ED_COMPL_FABRIC'
      Size = 21
    end
    object tbl_li_o_ED_CIDAD_FABRIC: TWideStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Size = 25
    end
    object tbl_li_o_ED_ESTADO_FABRIC: TWideStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Size = 25
    end
    object tbl_li_o_CD_PAIS_ORIG_MERC: TWideStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object tbl_li_o_CD_MERC_NALADI_NCC: TWideStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Size = 7
    end
    object tbl_li_o_CD_MERC_NALADI_SH: TWideStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Size = 8
    end
    object tbl_li_o_PL_MERCADORIA: TWideStringField
      FieldName = 'PL_MERCADORIA'
      Size = 15
    end
    object tbl_li_o_QT_UN_ESTATISTICA: TWideStringField
      FieldName = 'QT_UN_ESTATISTICA'
      Size = 15
    end
    object tbl_li_o_CD_MOEDA_NEGOCIADA: TWideStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object tbl_li_o_QT_DIA_LIMITE_PGTO: TWideStringField
      FieldName = 'QT_DIA_LIMITE_PGTO'
      Size = 3
    end
    object tbl_li_o_CD_INCOTERMS_VENDA: TWideStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Size = 3
    end
    object tbl_li_o_VL_MERC_MNEG_EMB: TWideStringField
      FieldName = 'VL_MERC_MNEG_EMB'
      Size = 15
    end
    object tbl_li_o_VL_TOT_DOLAR_EMB: TWideStringField
      FieldName = 'VL_TOT_DOLAR_EMB'
      Size = 11
    end
    object tbl_li_o_CD_TIPO_ACORDO_TAR: TWideStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object tbl_li_o_CD_ACORDO_ALADI: TWideStringField
      FieldName = 'CD_ACORDO_ALADI'
      Size = 3
    end
    object tbl_li_o_CD_REGIME_TRIBUTAR: TWideStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Size = 1
    end
    object tbl_li_o_CD_FUND_LEG_REGIME: TWideStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Size = 2
    end
    object tbl_li_o_CD_COBERT_CAMBIAL: TWideStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Size = 1
    end
    object tbl_li_o_CD_MODALIDADE_PGTO: TWideStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Size = 2
    end
    object tbl_li_o_CD_ORGAO_FIN_INTER: TWideStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object tbl_li_o_CD_MOTIVO_SEM_COB: TWideStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Size = 2
    end
    object tbl_li_o_CD_AGENCIA_SECEX: TWideStringField
      FieldName = 'CD_AGENCIA_SECEX'
      Size = 5
    end
    object tbl_li_o_CD_URF_DESPACHO: TWideStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object tbl_li_o_IN_REST_DATA_EMB_LI: TWideStringField
      FieldName = 'IN_REST_DATA_EMB_LI'
      Size = 1
    end
    object tbl_li_o_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
    end
    object tbl_li_o_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
    end
    object tbl_li_o_NR_ATO_DRAWBACK: TWideStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Size = 13
    end
    object tbl_li_o_NR_COMUNIC_COMPRA: TWideStringField
      FieldName = 'NR_COMUNIC_COMPRA'
      Size = 13
    end
    object tbl_li_o_DT_REG_OPER_TRAT: TWideStringField
      FieldName = 'DT_REG_OPER_TRAT'
      Size = 10
    end
    object tbl_li_o_DT_ATU_OPER_MICRO: TWideStringField
      FieldName = 'DT_ATU_OPER_MICRO'
      Size = 10
    end
    object tbl_li_o_IN_SALVO_DIAG: TBooleanField
      FieldName = 'IN_SALVO_DIAG'
    end
    object tbl_li_o_IN_SELECAO_DIAG: TBooleanField
      FieldName = 'IN_SELECAO_DIAG'
    end
    object tbl_li_o_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      BlobType = ftMemo
    end
    object tbl_li_o_CD_SITUAC_OP_TRAT: TWideStringField
      FieldName = 'CD_SITUAC_OP_TRAT'
      Size = 2
    end
    object tbl_li_o_DT_SITUAC_OP_TRAT: TWideStringField
      FieldName = 'DT_SITUAC_OP_TRAT'
      Size = 10
    end
    object tbl_li_o_DT_VALID_OP_TRAT: TWideStringField
      FieldName = 'DT_VALID_OP_TRAT'
      Size = 10
    end
    object tbl_li_o_CD_CANCEL_OP_TRAT: TWideStringField
      FieldName = 'CD_CANCEL_OP_TRAT'
      Size = 1
    end
    object tbl_li_o_DT_CANCEL_OP_TRAT: TWideStringField
      FieldName = 'DT_CANCEL_OP_TRAT'
      Size = 10
    end
    object tbl_li_o_NR_CPF_CANC_ANUENC: TWideStringField
      FieldName = 'NR_CPF_CANC_ANUENC'
      Size = 11
    end
    object tbl_li_o_NR_LI_SUBSTITUTIVO: TWideStringField
      FieldName = 'NR_LI_SUBSTITUTIVO'
      Size = 10
    end
    object tbl_li_o_DT_REST_EMB: TWideStringField
      FieldName = 'DT_REST_EMB'
      Size = 10
    end
    object tbl_li_o_IN_REG_DRAWBACK: TWideStringField
      FieldName = 'IN_REG_DRAWBACK'
      Size = 1
    end
    object tbl_li_o_NR_REG_DRAWBACK: TWideStringField
      FieldName = 'NR_REG_DRAWBACK'
      Size = 11
    end
  end
  object qry_det_merc_o_: TADOQuery
    Connection = ConAccessLI
    Parameters = <
      item
        Name = 'NR_TRAT_IMP_MICRO'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT NR_TRAT_IMP_MICRO, NR_SEQ_PRODUTO,'
      '       QT_MERC_UN_COMERC, NM_UN_MEDID_COMER,'
      '       VL_UNID_COND_VENDA, TX_DESC_DET_MERC, CD_PRODUTO,'
      '       NR_ITEM_DRAWBACK, QT_PROD_DRAWBACK, VL_PROD_DRAWBACK'
      'FROM   DETALHE_MERC_COM_TRATAMENTO'
      'WHERE  NR_TRAT_IMP_MICRO = :NR_TRAT_IMP_MICRO')
    Left = 48
    Top = 144
    object qry_det_merc_o_NR_TRAT_IMP_MICRO: TWideStringField
      FieldName = 'NR_TRAT_IMP_MICRO'
      Size = 8
    end
    object qry_det_merc_o_NR_SEQ_PRODUTO: TWideStringField
      FieldName = 'NR_SEQ_PRODUTO'
      Size = 2
    end
    object qry_det_merc_o_QT_MERC_UN_COMERC: TWideStringField
      FieldName = 'QT_MERC_UN_COMERC'
      Size = 14
    end
    object qry_det_merc_o_NM_UN_MEDID_COMER: TWideStringField
      FieldName = 'NM_UN_MEDID_COMER'
    end
    object qry_det_merc_o_VL_UNID_COND_VENDA: TWideStringField
      FieldName = 'VL_UNID_COND_VENDA'
      Size = 21
    end
    object qry_det_merc_o_TX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object qry_det_merc_o_CD_PRODUTO: TWideStringField
      FieldName = 'CD_PRODUTO'
      Size = 15
    end
    object qry_det_merc_o_NR_ITEM_DRAWBACK: TWideStringField
      FieldName = 'NR_ITEM_DRAWBACK'
      Size = 3
    end
    object qry_det_merc_o_QT_PROD_DRAWBACK: TWideStringField
      FieldName = 'QT_PROD_DRAWBACK'
      Size = 14
    end
    object qry_det_merc_o_VL_PROD_DRAWBACK: TWideStringField
      FieldName = 'VL_PROD_DRAWBACK'
      Size = 15
    end
  end
  object qry_dest_ncm_o_: TADOQuery
    Connection = ConAccessLI
    Parameters = <
      item
        Name = 'NR_TRAT_IMP_MICRO'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT NR_TRAT_IMP_MICRO , NR_DESTAQUE_NCM'
      'FROM DESTAQUE_NCM DESTAQUE_NCM'
      'WHERE NR_TRAT_IMP_MICRO = :NR_TRAT_IMP_MICRO')
    Left = 48
    Top = 200
    object qry_dest_ncm_o_NR_TRAT_IMP_MICRO: TWideStringField
      FieldName = 'NR_TRAT_IMP_MICRO'
      Size = 8
    end
    object qry_dest_ncm_o_NR_DESTAQUE_NCM: TWideStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Size = 3
    end
  end
  object qry_li_d_: TADOQuery
    Connection = ConBroker
    CursorType = ctStatic
    MarshalOptions = moMarshalModifiedOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_PROCESSO_SISCOMEX, CD_URF_ENTRADA, CD_PAI' +
        'S_PROCEDENCIA,'
      
        '       QT_TOTAL_PES_LIQ, QT_MED_ESTATISTICA, CD_MOEDA_MLE, QT_DI' +
        'AS_COBERTURA,'
      
        '       CD_INCOTERM, VL_TOTAL_MOEDA, TP_ACORDO_ALADI, CD_ACORDO_A' +
        'LADI,'
      
        '       CD_REGIME_TRIBUTACAO, CD_FUND_LEGAL, TP_CAMBIO, CD_MOD_PA' +
        'GAMENTO,'
      
        '       CD_INSTITUICAO_FINANC, CD_MOT_SEM_COBERTURA, CD_AGENCIA_S' +
        'ECEX, CD_URF_DESPACHO,'
      
        '       CD_CONDICAO_MERC, NR_ATO_DRAWBACK, NR_COMUNICADO_COMPRA, ' +
        'DT_REGISTRO_LI,'
      
        '       TX_INFO_COMPLEMENTAR, NR_REGISTRO_LI, DT_PROCESSO_LI, NR_' +
        'LI_SUBSTITUIDO'
      'FROM TLICENCA_IMPORTACAO')
    Left = 240
    Top = 144
    object qry_li_d_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object qry_li_d_NR_PROCESSO_SISCOMEX: TStringField
      FieldName = 'NR_PROCESSO_SISCOMEX'
      FixedChar = True
      Size = 8
    end
    object qry_li_d_CD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      FixedChar = True
      Size = 7
    end
    object qry_li_d_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      FixedChar = True
      Size = 3
    end
    object qry_li_d_QT_TOTAL_PES_LIQ: TFloatField
      FieldName = 'QT_TOTAL_PES_LIQ'
    end
    object qry_li_d_QT_MED_ESTATISTICA: TFloatField
      FieldName = 'QT_MED_ESTATISTICA'
    end
    object qry_li_d_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      FixedChar = True
      Size = 3
    end
    object qry_li_d_QT_DIAS_COBERTURA: TIntegerField
      FieldName = 'QT_DIAS_COBERTURA'
    end
    object qry_li_d_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_li_d_VL_TOTAL_MOEDA: TFloatField
      FieldName = 'VL_TOTAL_MOEDA'
    end
    object qry_li_d_TP_ACORDO_ALADI: TStringField
      FieldName = 'TP_ACORDO_ALADI'
      FixedChar = True
      Size = 1
    end
    object qry_li_d_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      FixedChar = True
      Size = 3
    end
    object qry_li_d_CD_REGIME_TRIBUTACAO: TStringField
      FieldName = 'CD_REGIME_TRIBUTACAO'
      FixedChar = True
      Size = 1
    end
    object qry_li_d_CD_FUND_LEGAL: TStringField
      FieldName = 'CD_FUND_LEGAL'
      FixedChar = True
      Size = 2
    end
    object qry_li_d_TP_CAMBIO: TStringField
      FieldName = 'TP_CAMBIO'
      FixedChar = True
      Size = 1
    end
    object qry_li_d_CD_MOD_PAGAMENTO: TStringField
      FieldName = 'CD_MOD_PAGAMENTO'
      FixedChar = True
      Size = 2
    end
    object qry_li_d_CD_INSTITUICAO_FINANC: TStringField
      FieldName = 'CD_INSTITUICAO_FINANC'
      FixedChar = True
      Size = 2
    end
    object qry_li_d_CD_MOT_SEM_COBERTURA: TStringField
      FieldName = 'CD_MOT_SEM_COBERTURA'
      FixedChar = True
      Size = 2
    end
    object qry_li_d_CD_AGENCIA_SECEX: TStringField
      FieldName = 'CD_AGENCIA_SECEX'
      FixedChar = True
      Size = 4
    end
    object qry_li_d_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qry_li_d_CD_CONDICAO_MERC: TStringField
      FieldName = 'CD_CONDICAO_MERC'
      FixedChar = True
      Size = 1
    end
    object qry_li_d_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Size = 13
    end
    object qry_li_d_NR_COMUNICADO_COMPRA: TStringField
      FieldName = 'NR_COMUNICADO_COMPRA'
      Size = 13
    end
    object qry_li_d_DT_REGISTRO_LI: TDateTimeField
      FieldName = 'DT_REGISTRO_LI'
    end
    object qry_li_d_TX_INFO_COMPLEMENTAR: TMemoField
      FieldName = 'TX_INFO_COMPLEMENTAR'
      BlobType = ftMemo
    end
    object qry_li_d_NR_REGISTRO_LI: TStringField
      FieldName = 'NR_REGISTRO_LI'
      Size = 10
    end
    object qry_li_d_DT_PROCESSO_LI: TDateTimeField
      FieldName = 'DT_PROCESSO_LI'
    end
    object qry_li_d_NR_LI_SUBSTITUIDO: TStringField
      FieldName = 'NR_LI_SUBSTITUIDO'
      FixedChar = True
      Size = 10
    end
  end
  object qry_det_merc_d_: TADOQuery
    Connection = ConBroker
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'NR_ITEM'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, VL_UNIT_MCV, TX_DESC_DET_MERC, CD_MERCADORIA' +
        ', CD_NCM_SH,'
      
        '       CD_NALADI_NCCA, CD_NALADI_SH, CD_PAIS_ORIGEM, CD_PAIS_AQU' +
        'ISICAO, CD_FABR_EXPO,'
      
        '       QT_MERC_UN_COMERC, CD_UN_MED_COMERC, IN_REG_DRAWBACK, NR_' +
        'ITEM_DRAWBACK, '
      '       NR_REG_DRAWBACK, QT_MERC_UN_ESTAT, VL_TOTAL_MLE, NR_ITEM,'
      '       NR_ATO_DRAWBACK'
      'FROM TLICENCA_ITENS'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND NR_ITEM = :NR_ITEM')
    Left = 240
    Top = 200
    object qry_det_merc_d_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object qry_det_merc_d_VL_UNIT_MCV: TFloatField
      FieldName = 'VL_UNIT_MCV'
    end
    object qry_det_merc_d_TX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object qry_det_merc_d_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Size = 30
    end
    object qry_det_merc_d_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qry_det_merc_d_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      FixedChar = True
      Size = 7
    end
    object qry_det_merc_d_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object qry_det_merc_d_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_det_merc_d_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qry_det_merc_d_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      FixedChar = True
      Size = 1
    end
    object qry_det_merc_d_QT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
    end
    object qry_det_merc_d_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      FixedChar = True
      Size = 3
    end
    object qry_det_merc_d_IN_REG_DRAWBACK: TStringField
      FieldName = 'IN_REG_DRAWBACK'
      FixedChar = True
      Size = 1
    end
    object qry_det_merc_d_NR_ITEM_DRAWBACK: TStringField
      FieldName = 'NR_ITEM_DRAWBACK'
      FixedChar = True
      Size = 3
    end
    object qry_det_merc_d_NR_REG_DRAWBACK: TStringField
      FieldName = 'NR_REG_DRAWBACK'
      FixedChar = True
      Size = 11
    end
    object qry_det_merc_d_QT_MERC_UN_ESTAT: TFloatField
      FieldName = 'QT_MERC_UN_ESTAT'
    end
    object qry_det_merc_d_VL_TOTAL_MLE: TFloatField
      FieldName = 'VL_TOTAL_MLE'
    end
    object qry_det_merc_d_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_det_merc_d_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      FixedChar = True
      Size = 13
    end
  end
  object tbl_dest_ncm_d_: TADOTable
    Connection = ConBroker
    TableName = 'DESTAQUE_NCM'
    Left = 240
    Top = 256
    object tbl_dest_ncm_d_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object tbl_dest_ncm_d_NR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Size = 3
    end
  end
  object qry_existe_li_: TADOQuery
    Connection = ConBroker
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT_LI'
      'FROM TLICENCA_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 344
    Top = 144
    object qry_existe_li_TOT_LI: TIntegerField
      FieldName = 'TOT_LI'
      ReadOnly = True
    end
  end
  object qry_itens_li_: TADOQuery
    Connection = ConBroker
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'NR_ITEM'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM TLICENCA_ITENS (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND NR_ITEM = :NR_ITEM')
    Left = 344
    Top = 312
    object qry_itens_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object qry_itens_li_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_itens_li_NR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      FixedChar = True
      Size = 3
    end
    object qry_itens_li_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_itens_li_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_itens_li_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      FixedChar = True
      Size = 1
    end
    object qry_itens_li_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_itens_li_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Size = 30
    end
    object qry_itens_li_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      FixedChar = True
      Size = 7
    end
    object qry_itens_li_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object qry_itens_li_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qry_itens_li_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qry_itens_li_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_itens_li_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      FixedChar = True
      Size = 3
    end
    object qry_itens_li_CD_UN_MED_ESTAT: TStringField
      FieldName = 'CD_UN_MED_ESTAT'
      FixedChar = True
      Size = 3
    end
    object qry_itens_li_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qry_itens_li_QT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
    end
    object qry_itens_li_QT_MERC_UN_ESTAT: TFloatField
      FieldName = 'QT_MERC_UN_ESTAT'
    end
    object qry_itens_li_TX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object qry_itens_li_VL_UNIT_MLE: TFloatField
      FieldName = 'VL_UNIT_MLE'
    end
    object qry_itens_li_VL_TOTAL_MLE: TFloatField
      FieldName = 'VL_TOTAL_MLE'
    end
    object qry_itens_li_VL_UNIT_MCV: TFloatField
      FieldName = 'VL_UNIT_MCV'
    end
    object qry_itens_li_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      FixedChar = True
      Size = 3
    end
    object qry_itens_li_VL_RAT_FRETE: TFloatField
      FieldName = 'VL_RAT_FRETE'
    end
    object qry_itens_li_VL_RAT_SEGURO: TFloatField
      FieldName = 'VL_RAT_SEGURO'
    end
    object qry_itens_li_VL_RAT_DESPESA: TFloatField
      FieldName = 'VL_RAT_DESPESA'
    end
    object qry_itens_li_VL_RAT_DESCONTO: TFloatField
      FieldName = 'VL_RAT_DESCONTO'
    end
    object qry_itens_li_NR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_itens_li_NR_PROC_PO: TStringField
      FieldName = 'NR_PROC_PO'
      FixedChar = True
      Size = 50
    end
    object qry_itens_li_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      FixedChar = True
      Size = 13
    end
    object qry_itens_li_CD_REGIME_TRIBUTACAO: TStringField
      FieldName = 'CD_REGIME_TRIBUTACAO'
      FixedChar = True
      Size = 1
    end
    object qry_itens_li_CD_FUND_LEGAL: TStringField
      FieldName = 'CD_FUND_LEGAL'
      FixedChar = True
      Size = 2
    end
    object qry_itens_li_NR_ITEM_DRAWBACK: TStringField
      FieldName = 'NR_ITEM_DRAWBACK'
      FixedChar = True
      Size = 3
    end
    object qry_itens_li_NR_REG_DRAWBACK: TStringField
      FieldName = 'NR_REG_DRAWBACK'
      FixedChar = True
      Size = 11
    end
    object qry_itens_li_IN_REG_DRAWBACK: TStringField
      FieldName = 'IN_REG_DRAWBACK'
      FixedChar = True
      Size = 1
    end
    object qry_itens_li_NR_LI_SUBSTITUIDO: TStringField
      FieldName = 'NR_LI_SUBSTITUIDO'
      FixedChar = True
      Size = 10
    end
    object qry_itens_li_IN_DRAWBACK_AUTOMATICO: TStringField
      FieldName = 'IN_DRAWBACK_AUTOMATICO'
      FixedChar = True
      Size = 1
    end
    object qry_itens_li_QT_PRODUTO_DRAWBACK: TFloatField
      FieldName = 'QT_PRODUTO_DRAWBACK'
    end
    object qry_itens_li_VL_PRODUTO_DRAWBACK: TFloatField
      FieldName = 'VL_PRODUTO_DRAWBACK'
    end
  end
  object tbl_li_d_: TADOTable
    Connection = ConBroker
    TableName = 'OPERACAO_COM_TRATAMENTO'
    Left = 344
    Top = 200
    object tbl_li_d_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object tbl_li_d_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 15
    end
    object tbl_li_d_NR_OPER_TRAT_PROT: TStringField
      FieldName = 'NR_OPER_TRAT_PROT'
      Size = 10
    end
    object tbl_li_d_CD_AUTORIZ_TRANSM: TStringField
      FieldName = 'CD_AUTORIZ_TRANSM'
      Size = 1
    end
    object tbl_li_d_NR_TRAT_IMP_MICRO: TStringField
      FieldName = 'NR_TRAT_IMP_MICRO'
      Size = 8
    end
    object tbl_li_d_NR_LI_SUBSTITUIDO: TStringField
      FieldName = 'NR_LI_SUBSTITUIDO'
      Size = 10
    end
    object tbl_li_d_CD_ORIGEM_LI: TStringField
      FieldName = 'CD_ORIGEM_LI'
      Size = 1
    end
    object tbl_li_d_NR_DECL_IMP_VINC: TStringField
      FieldName = 'NR_DECL_IMP_VINC'
      Size = 10
    end
    object tbl_li_d_NR_ADI_IMP_VINC: TStringField
      FieldName = 'NR_ADI_IMP_VINC'
      Size = 3
    end
    object tbl_li_d_NR_SEQ_RETI_VINC: TStringField
      FieldName = 'NR_SEQ_RETI_VINC'
      Size = 2
    end
    object tbl_li_d_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object tbl_li_d_NR_IMPORTADOR: TStringField
      FieldName = 'NR_IMPORTADOR'
      Size = 14
    end
    object tbl_li_d_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object tbl_li_d_NM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      Size = 60
    end
    object tbl_li_d_NR_TEL_IMPORTADOR: TStringField
      FieldName = 'NR_TEL_IMPORTADOR'
      Size = 15
    end
    object tbl_li_d_ED_LOGR_IMPORTADOR: TStringField
      FieldName = 'ED_LOGR_IMPORTADOR'
      Size = 40
    end
    object tbl_li_d_ED_NR_IMPORTADOR: TStringField
      FieldName = 'ED_NR_IMPORTADOR'
      Size = 6
    end
    object tbl_li_d_ED_COMPL_IMPO: TStringField
      FieldName = 'ED_COMPL_IMPO'
      Size = 21
    end
    object tbl_li_d_ED_BA_IMPORTADOR: TStringField
      FieldName = 'ED_BA_IMPORTADOR'
      Size = 25
    end
    object tbl_li_d_ED_MUN_IMPORTADOR: TStringField
      FieldName = 'ED_MUN_IMPORTADOR'
      Size = 25
    end
    object tbl_li_d_ED_UF_IMPORTADOR: TStringField
      FieldName = 'ED_UF_IMPORTADOR'
      Size = 2
    end
    object tbl_li_d_ED_CEP_IMPORTADOR: TStringField
      FieldName = 'ED_CEP_IMPORTADOR'
      Size = 8
    end
    object tbl_li_d_CD_ATIV_ECON_IMPO: TStringField
      FieldName = 'CD_ATIV_ECON_IMPO'
      Size = 4
    end
    object tbl_li_d_NR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object tbl_li_d_CD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      Size = 7
    end
    object tbl_li_d_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Size = 60
    end
    object tbl_li_d_ED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object tbl_li_d_ED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Size = 6
    end
    object tbl_li_d_ED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object tbl_li_d_ED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object tbl_li_d_ED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object tbl_li_d_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object tbl_li_d_CD_MERCADORIA_NCM: TStringField
      FieldName = 'CD_MERCADORIA_NCM'
      Size = 8
    end
    object tbl_li_d_CD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Size = 3
    end
    object tbl_li_d_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object tbl_li_d_NM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Size = 60
    end
    object tbl_li_d_ED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      Size = 40
    end
    object tbl_li_d_ED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      Size = 6
    end
    object tbl_li_d_ED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      Size = 21
    end
    object tbl_li_d_ED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Size = 25
    end
    object tbl_li_d_ED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Size = 25
    end
    object tbl_li_d_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object tbl_li_d_CD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Size = 7
    end
    object tbl_li_d_CD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Size = 8
    end
    object tbl_li_d_PL_MERCADORIA: TStringField
      FieldName = 'PL_MERCADORIA'
      Size = 15
    end
    object tbl_li_d_QT_UN_ESTATISTICA: TStringField
      FieldName = 'QT_UN_ESTATISTICA'
      Size = 15
    end
    object tbl_li_d_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object tbl_li_d_QT_DIA_LIMITE_PGTO: TStringField
      FieldName = 'QT_DIA_LIMITE_PGTO'
      Size = 3
    end
    object tbl_li_d_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Size = 3
    end
    object tbl_li_d_VL_MERC_MNEG_EMB: TStringField
      FieldName = 'VL_MERC_MNEG_EMB'
      FixedChar = True
      Size = 15
    end
    object tbl_li_d_VL_TOT_DOLAR_EMB: TStringField
      FieldName = 'VL_TOT_DOLAR_EMB'
      Size = 11
    end
    object tbl_li_d_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object tbl_li_d_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Size = 3
    end
    object tbl_li_d_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Size = 1
    end
    object tbl_li_d_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Size = 2
    end
    object tbl_li_d_CD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Size = 1
    end
    object tbl_li_d_CD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Size = 2
    end
    object tbl_li_d_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object tbl_li_d_CD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Size = 2
    end
    object tbl_li_d_CD_AGENCIA_SECEX: TStringField
      FieldName = 'CD_AGENCIA_SECEX'
      Size = 5
    end
    object tbl_li_d_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object tbl_li_d_IN_REST_DATA_EMB_LI: TStringField
      FieldName = 'IN_REST_DATA_EMB_LI'
      Size = 1
    end
    object tbl_li_d_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
    end
    object tbl_li_d_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
    end
    object tbl_li_d_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Size = 13
    end
    object tbl_li_d_NR_COMUNIC_COMPRA: TStringField
      FieldName = 'NR_COMUNIC_COMPRA'
      Size = 13
    end
    object tbl_li_d_DT_REG_OPER_TRAT: TStringField
      FieldName = 'DT_REG_OPER_TRAT'
      Size = 10
    end
    object tbl_li_d_DT_ATU_OPER_MICRO: TStringField
      FieldName = 'DT_ATU_OPER_MICRO'
      Size = 10
    end
    object tbl_li_d_IN_SALVO_DIAG: TBooleanField
      FieldName = 'IN_SALVO_DIAG'
    end
    object tbl_li_d_IN_SELECAO_DIAG: TBooleanField
      FieldName = 'IN_SELECAO_DIAG'
    end
    object tbl_li_d_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      BlobType = ftMemo
    end
    object tbl_li_d_CD_SITUAC_OP_TRAT: TStringField
      FieldName = 'CD_SITUAC_OP_TRAT'
      Size = 2
    end
    object tbl_li_d_DT_SITUAC_OP_TRAT: TStringField
      FieldName = 'DT_SITUAC_OP_TRAT'
      Size = 10
    end
    object tbl_li_d_DT_VALID_OP_TRAT: TStringField
      FieldName = 'DT_VALID_OP_TRAT'
      Size = 10
    end
    object tbl_li_d_CD_CANCEL_OP_TRAT: TStringField
      FieldName = 'CD_CANCEL_OP_TRAT'
      Size = 1
    end
    object tbl_li_d_DT_CANCEL_OP_TRAT: TStringField
      FieldName = 'DT_CANCEL_OP_TRAT'
      Size = 10
    end
    object tbl_li_d_NR_CPF_CANC_ANUENC: TStringField
      FieldName = 'NR_CPF_CANC_ANUENC'
      Size = 11
    end
    object tbl_li_d_NR_LI_SUBSTITUTIVO: TStringField
      FieldName = 'NR_LI_SUBSTITUTIVO'
      Size = 10
    end
    object tbl_li_d_IN_REG_DRAWBACK: TStringField
      FieldName = 'IN_REG_DRAWBACK'
      FixedChar = True
      Size = 1
    end
    object tbl_li_d_NR_REG_DRAWBACK: TStringField
      FieldName = 'NR_REG_DRAWBACK'
      FixedChar = True
      Size = 11
    end
    object tbl_li_d_IN_LI_INCLUIDA: TStringField
      FieldName = 'IN_LI_INCLUIDA'
      FixedChar = True
      Size = 1
    end
  end
  object tbl_det_merc_d_: TADOTable
    Connection = ConBroker
    TableName = 'DETALHE_MERC_COM_TRATAMENTO'
    Left = 344
    Top = 256
    object tbl_det_merc_d_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object tbl_det_merc_d_NR_SEQ_PRODUTO: TStringField
      FieldName = 'NR_SEQ_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object tbl_det_merc_d_QT_MERC_UN_COMERC: TStringField
      FieldName = 'QT_MERC_UN_COMERC'
      Size = 14
    end
    object tbl_det_merc_d_NM_UN_MEDID_COMER: TStringField
      FieldName = 'NM_UN_MEDID_COMER'
    end
    object tbl_det_merc_d_VL_UNID_COND_VENDA: TStringField
      FieldName = 'VL_UNID_COND_VENDA'
      Size = 21
    end
    object tbl_det_merc_d_TX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object tbl_det_merc_d_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 15
    end
    object tbl_det_merc_d_NR_ITEM_DRAWBACK: TStringField
      FieldName = 'NR_ITEM_DRAWBACK'
      FixedChar = True
      Size = 3
    end
    object tbl_det_merc_d_QT_PROD_DRAWBACK: TStringField
      FieldName = 'QT_PROD_DRAWBACK'
      FixedChar = True
      Size = 14
    end
    object tbl_det_merc_d_VL_PROD_DRAWBACK: TStringField
      FieldName = 'VL_PROD_DRAWBACK'
      FixedChar = True
      Size = 15
    end
  end
  object qry_tbl_dest_ncm_d_: TADOQuery
    Connection = ConBroker
    Parameters = <
      item
        Name = 'NR_OPER_TRAT_PREV'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'NR_DESTAQUE_NCM'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM DESTAQUE_NCM'
      'WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV'
      '  AND NR_DESTAQUE_NCM = :NR_DESTAQUE_NCM')
    Left = 248
    Top = 392
    object qry_tbl_dest_ncm_d_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object qry_tbl_dest_ncm_d_NR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Size = 3
    end
  end
  object qry_tbl_li_d_: TADOQuery
    Connection = ConBroker
    Parameters = <
      item
        Name = 'NR_OPER_TRAT_PREV'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM OPERACAO_COM_TRATAMENTO'
      'WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV')
    Left = 360
    Top = 392
    object qry_tbl_li_d_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object qry_tbl_li_d_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 15
    end
    object qry_tbl_li_d_NR_OPER_TRAT_PROT: TStringField
      FieldName = 'NR_OPER_TRAT_PROT'
      Size = 10
    end
    object qry_tbl_li_d_CD_AUTORIZ_TRANSM: TStringField
      FieldName = 'CD_AUTORIZ_TRANSM'
      Size = 1
    end
    object qry_tbl_li_d_NR_TRAT_IMP_MICRO: TStringField
      FieldName = 'NR_TRAT_IMP_MICRO'
      Size = 8
    end
    object qry_tbl_li_d_NR_LI_SUBSTITUIDO: TStringField
      FieldName = 'NR_LI_SUBSTITUIDO'
      Size = 10
    end
    object qry_tbl_li_d_CD_ORIGEM_LI: TStringField
      FieldName = 'CD_ORIGEM_LI'
      Size = 1
    end
    object qry_tbl_li_d_NR_DECL_IMP_VINC: TStringField
      FieldName = 'NR_DECL_IMP_VINC'
      Size = 10
    end
    object qry_tbl_li_d_NR_ADI_IMP_VINC: TStringField
      FieldName = 'NR_ADI_IMP_VINC'
      Size = 3
    end
    object qry_tbl_li_d_NR_SEQ_RETI_VINC: TStringField
      FieldName = 'NR_SEQ_RETI_VINC'
      Size = 2
    end
    object qry_tbl_li_d_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object qry_tbl_li_d_NR_IMPORTADOR: TStringField
      FieldName = 'NR_IMPORTADOR'
      Size = 14
    end
    object qry_tbl_li_d_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object qry_tbl_li_d_NM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      Size = 60
    end
    object qry_tbl_li_d_NR_TEL_IMPORTADOR: TStringField
      FieldName = 'NR_TEL_IMPORTADOR'
      Size = 15
    end
    object qry_tbl_li_d_ED_LOGR_IMPORTADOR: TStringField
      FieldName = 'ED_LOGR_IMPORTADOR'
      Size = 40
    end
    object qry_tbl_li_d_ED_NR_IMPORTADOR: TStringField
      FieldName = 'ED_NR_IMPORTADOR'
      Size = 6
    end
    object qry_tbl_li_d_ED_COMPL_IMPO: TStringField
      FieldName = 'ED_COMPL_IMPO'
      Size = 21
    end
    object qry_tbl_li_d_ED_BA_IMPORTADOR: TStringField
      FieldName = 'ED_BA_IMPORTADOR'
      Size = 25
    end
    object qry_tbl_li_d_ED_MUN_IMPORTADOR: TStringField
      FieldName = 'ED_MUN_IMPORTADOR'
      Size = 25
    end
    object qry_tbl_li_d_ED_UF_IMPORTADOR: TStringField
      FieldName = 'ED_UF_IMPORTADOR'
      Size = 2
    end
    object qry_tbl_li_d_ED_CEP_IMPORTADOR: TStringField
      FieldName = 'ED_CEP_IMPORTADOR'
      Size = 8
    end
    object qry_tbl_li_d_CD_ATIV_ECON_IMPO: TStringField
      FieldName = 'CD_ATIV_ECON_IMPO'
      Size = 4
    end
    object qry_tbl_li_d_NR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object qry_tbl_li_d_CD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      Size = 7
    end
    object qry_tbl_li_d_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Size = 60
    end
    object qry_tbl_li_d_ED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object qry_tbl_li_d_ED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Size = 6
    end
    object qry_tbl_li_d_ED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object qry_tbl_li_d_ED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object qry_tbl_li_d_ED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object qry_tbl_li_d_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object qry_tbl_li_d_CD_MERCADORIA_NCM: TStringField
      FieldName = 'CD_MERCADORIA_NCM'
      Size = 8
    end
    object qry_tbl_li_d_CD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Size = 3
    end
    object qry_tbl_li_d_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object qry_tbl_li_d_NM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Size = 60
    end
    object qry_tbl_li_d_ED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      Size = 40
    end
    object qry_tbl_li_d_ED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      Size = 6
    end
    object qry_tbl_li_d_ED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      Size = 21
    end
    object qry_tbl_li_d_ED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Size = 25
    end
    object qry_tbl_li_d_ED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Size = 25
    end
    object qry_tbl_li_d_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object qry_tbl_li_d_CD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Size = 7
    end
    object qry_tbl_li_d_CD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Size = 8
    end
    object qry_tbl_li_d_PL_MERCADORIA: TStringField
      FieldName = 'PL_MERCADORIA'
      Size = 15
    end
    object qry_tbl_li_d_QT_UN_ESTATISTICA: TStringField
      FieldName = 'QT_UN_ESTATISTICA'
      Size = 15
    end
    object qry_tbl_li_d_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object qry_tbl_li_d_QT_DIA_LIMITE_PGTO: TStringField
      FieldName = 'QT_DIA_LIMITE_PGTO'
      Size = 3
    end
    object qry_tbl_li_d_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Size = 3
    end
    object qry_tbl_li_d_VL_MERC_MNEG_EMB: TStringField
      FieldName = 'VL_MERC_MNEG_EMB'
      FixedChar = True
      Size = 15
    end
    object qry_tbl_li_d_VL_TOT_DOLAR_EMB: TStringField
      FieldName = 'VL_TOT_DOLAR_EMB'
      Size = 11
    end
    object qry_tbl_li_d_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object qry_tbl_li_d_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Size = 3
    end
    object qry_tbl_li_d_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Size = 1
    end
    object qry_tbl_li_d_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Size = 2
    end
    object qry_tbl_li_d_CD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Size = 1
    end
    object qry_tbl_li_d_CD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Size = 2
    end
    object qry_tbl_li_d_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object qry_tbl_li_d_CD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Size = 2
    end
    object qry_tbl_li_d_CD_AGENCIA_SECEX: TStringField
      FieldName = 'CD_AGENCIA_SECEX'
      Size = 5
    end
    object qry_tbl_li_d_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object qry_tbl_li_d_IN_REST_DATA_EMB_LI: TStringField
      FieldName = 'IN_REST_DATA_EMB_LI'
      Size = 1
    end
    object qry_tbl_li_d_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
    end
    object qry_tbl_li_d_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
    end
    object qry_tbl_li_d_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Size = 13
    end
    object qry_tbl_li_d_NR_COMUNIC_COMPRA: TStringField
      FieldName = 'NR_COMUNIC_COMPRA'
      Size = 13
    end
    object qry_tbl_li_d_DT_REG_OPER_TRAT: TStringField
      FieldName = 'DT_REG_OPER_TRAT'
      Size = 10
    end
    object qry_tbl_li_d_DT_ATU_OPER_MICRO: TStringField
      FieldName = 'DT_ATU_OPER_MICRO'
      Size = 10
    end
    object qry_tbl_li_d_IN_SALVO_DIAG: TBooleanField
      FieldName = 'IN_SALVO_DIAG'
    end
    object qry_tbl_li_d_IN_SELECAO_DIAG: TBooleanField
      FieldName = 'IN_SELECAO_DIAG'
    end
    object qry_tbl_li_d_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      BlobType = ftMemo
    end
    object qry_tbl_li_d_CD_SITUAC_OP_TRAT: TStringField
      FieldName = 'CD_SITUAC_OP_TRAT'
      Size = 2
    end
    object qry_tbl_li_d_DT_SITUAC_OP_TRAT: TStringField
      FieldName = 'DT_SITUAC_OP_TRAT'
      Size = 10
    end
    object qry_tbl_li_d_DT_VALID_OP_TRAT: TStringField
      FieldName = 'DT_VALID_OP_TRAT'
      Size = 10
    end
    object qry_tbl_li_d_CD_CANCEL_OP_TRAT: TStringField
      FieldName = 'CD_CANCEL_OP_TRAT'
      Size = 1
    end
    object qry_tbl_li_d_DT_CANCEL_OP_TRAT: TStringField
      FieldName = 'DT_CANCEL_OP_TRAT'
      Size = 10
    end
    object qry_tbl_li_d_NR_CPF_CANC_ANUENC: TStringField
      FieldName = 'NR_CPF_CANC_ANUENC'
      Size = 11
    end
    object qry_tbl_li_d_NR_LI_SUBSTITUTIVO: TStringField
      FieldName = 'NR_LI_SUBSTITUTIVO'
      Size = 10
    end
    object qry_tbl_li_d_IN_REG_DRAWBACK: TStringField
      FieldName = 'IN_REG_DRAWBACK'
      FixedChar = True
      Size = 1
    end
    object qry_tbl_li_d_NR_REG_DRAWBACK: TStringField
      FieldName = 'NR_REG_DRAWBACK'
      FixedChar = True
      Size = 11
    end
    object qry_tbl_li_d_IN_LI_INCLUIDA: TStringField
      FieldName = 'IN_LI_INCLUIDA'
      FixedChar = True
      Size = 1
    end
  end
  object qry_tbl_det_merc_d_: TADOQuery
    Connection = ConBroker
    Parameters = <
      item
        Name = 'NR_OPER_TRAT_PREV'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'NR_SEQ_PRODUTO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM DETALHE_MERC_COM_TRATAMENTO'
      'WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV'
      '  AND NR_SEQ_PRODUTO    = :NR_SEQ_PRODUTO')
    Left = 464
    Top = 392
    object qry_tbl_det_merc_d_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object qry_tbl_det_merc_d_NR_SEQ_PRODUTO: TStringField
      FieldName = 'NR_SEQ_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_tbl_det_merc_d_QT_MERC_UN_COMERC: TStringField
      FieldName = 'QT_MERC_UN_COMERC'
      Size = 14
    end
    object qry_tbl_det_merc_d_NM_UN_MEDID_COMER: TStringField
      FieldName = 'NM_UN_MEDID_COMER'
    end
    object qry_tbl_det_merc_d_VL_UNID_COND_VENDA: TStringField
      FieldName = 'VL_UNID_COND_VENDA'
      Size = 21
    end
    object qry_tbl_det_merc_d_TX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object qry_tbl_det_merc_d_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 15
    end
    object qry_tbl_det_merc_d_NR_ITEM_DRAWBACK: TStringField
      FieldName = 'NR_ITEM_DRAWBACK'
      FixedChar = True
      Size = 3
    end
    object qry_tbl_det_merc_d_QT_PROD_DRAWBACK: TStringField
      FieldName = 'QT_PROD_DRAWBACK'
      FixedChar = True
      Size = 14
    end
    object qry_tbl_det_merc_d_VL_PROD_DRAWBACK: TStringField
      FieldName = 'VL_PROD_DRAWBACK'
      FixedChar = True
      Size = 15
    end
  end
end
