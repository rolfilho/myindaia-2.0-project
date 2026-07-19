object datm_trans_DI: Tdatm_trans_DI
  OldCreateOrder = True
  Left = 527
  Top = 66
  Height = 688
  Width = 872
  object IMPORT: TDatabase
    AliasName = 'DBImport'
    DatabaseName = 'IMPORT'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 32
    Top = 8
  end
  object CAPADI: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'DECLARA'#199#195'O_IMPORTA'#199#195'O'
    Left = 96
    Top = 8
  end
  object TB_Numerador_DI: TTable
    DatabaseName = 'IMPORT'
    TableName = 'NUMERADOR_DECLARA'#199#195'O'
    Left = 160
    Top = 8
  end
  object TB_Oco_DocEmb: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'DOCUMENTO_INSTRU'#199#195'O'
    Left = 288
    Top = 8
  end
  object TB_Oco_Processos: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'PROCESSO_DI'
    Left = 40
    Top = 80
  end
  object TB_Oco_Embalagens: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'EMBALAGEM_CARGA'
    Left = 128
    Top = 72
  end
  object TB_Oco_Armaz_Carga: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'CARGA_ARMAZ'#201'M'
    Left = 224
    Top = 72
  end
  object TB_Oco_PagtoTrib: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'PAGAMENTO_TRIBUTOS'
    Left = 224
    Top = 8
  end
  object QR_CapaDI: TQuery
    DatabaseName = 'IMPORT'
    SQL.Strings = (
      'SELECT * FROM DECLARA'#199#195'O_IMPORTA'#199#195'O')
    Left = 374
    Top = 13
    object QR_CapaDINR_DECL_IMP_MICRO: TStringField
      FieldName = 'NR_DECL_IMP_MICRO'
      Size = 8
    end
    object QR_CapaDINR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 15
    end
    object QR_CapaDINR_DECL_IMP_PROT: TStringField
      FieldName = 'NR_DECL_IMP_PROT'
      Size = 10
    end
    object QR_CapaDINR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      EditMask = '00\/0000000\-0;0;_'
      Size = 10
    end
    object QR_CapaDIDT_PROCESSAMENTO: TStringField
      FieldName = 'DT_PROCESSAMENTO'
      EditMask = '99/99/99;0;_'
      Size = 8
    end
    object QR_CapaDIDT_TRANSMISSAO: TStringField
      FieldName = 'DT_TRANSMISSAO'
      EditMask = '99/99/99;0;_'
      Size = 8
    end
    object QR_CapaDIDT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      EditMask = '99/99/99;0;_'
      Size = 8
    end
    object QR_CapaDICD_TIPO_DECLARACAO: TStringField
      FieldName = 'CD_TIPO_DECLARACAO'
      Size = 2
    end
    object QR_CapaDICD_MOTIVO_TRANS: TStringField
      FieldName = 'CD_MOTIVO_TRANS'
      Size = 1
    end
    object QR_CapaDICD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object QR_CapaDINR_IMPORTADOR: TStringField
      FieldName = 'NR_IMPORTADOR'
      Size = 14
    end
    object QR_CapaDICD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object QR_CapaDINM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      Size = 60
    end
    object QR_CapaDINR_TEL_IMPORTADOR: TStringField
      FieldName = 'NR_TEL_IMPORTADOR'
      Size = 15
    end
    object QR_CapaDIED_LOGR_IMPORTADOR: TStringField
      FieldName = 'ED_LOGR_IMPORTADOR'
      Size = 40
    end
    object QR_CapaDIED_NR_IMPORTADOR: TStringField
      FieldName = 'ED_NR_IMPORTADOR'
      Size = 6
    end
    object QR_CapaDIED_COMPL_IMPO: TStringField
      FieldName = 'ED_COMPL_IMPO'
      Size = 21
    end
    object QR_CapaDIED_BA_IMPORTADOR: TStringField
      FieldName = 'ED_BA_IMPORTADOR'
      Size = 25
    end
    object QR_CapaDIED_MUN_IMPORTADOR: TStringField
      FieldName = 'ED_MUN_IMPORTADOR'
      Size = 25
    end
    object QR_CapaDIED_UF_IMPORTADOR: TStringField
      FieldName = 'ED_UF_IMPORTADOR'
      Size = 2
    end
    object QR_CapaDIED_CEP_IMPORTADOR: TStringField
      FieldName = 'ED_CEP_IMPORTADOR'
      Size = 8
    end
    object QR_CapaDINR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object QR_CapaDICD_MODALIDADE_DESP: TStringField
      FieldName = 'CD_MODALIDADE_DESP'
      Size = 1
    end
    object QR_CapaDIIN_OPERACAO_FUNDAP: TBooleanField
      FieldName = 'IN_OPERACAO_FUNDAP'
    end
    object QR_CapaDICD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      Size = 7
    end
    object QR_CapaDICD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object QR_CapaDICD_TIPO_CONSIG: TStringField
      FieldName = 'CD_TIPO_CONSIG'
      Size = 1
    end
    object QR_CapaDINR_CONSIGNATARIO: TStringField
      FieldName = 'NR_CONSIGNATARIO'
      Size = 14
    end
    object QR_CapaDINM_CONSIGNATARIO: TStringField
      FieldName = 'NM_CONSIGNATARIO'
      Size = 60
    end
    object QR_CapaDICD_PAIS_PROC_CARGA: TStringField
      FieldName = 'CD_PAIS_PROC_CARGA'
      Size = 3
    end
    object QR_CapaDICD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      Size = 2
    end
    object QR_CapaDIIN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
    end
    object QR_CapaDINR_VEICULO_TRANSP: TStringField
      FieldName = 'NR_VEICULO_TRANSP'
      Size = 15
    end
    object QR_CapaDINM_VEICULO_TRANSP: TStringField
      FieldName = 'NM_VEICULO_TRANSP'
      Size = 30
    end
    object QR_CapaDINM_TRANSPORTADOR: TStringField
      FieldName = 'NM_TRANSPORTADOR'
      Size = 60
    end
    object QR_CapaDICD_BANDEIRA_TRANSP: TStringField
      FieldName = 'CD_BANDEIRA_TRANSP'
      Size = 3
    end
    object QR_CapaDICD_TIPO_AG_CARGA: TStringField
      FieldName = 'CD_TIPO_AG_CARGA'
      Size = 1
    end
    object QR_CapaDINR_AGENTE_CARGA: TStringField
      FieldName = 'NR_AGENTE_CARGA'
      Size = 14
    end
    object QR_CapaDICD_TIPO_DCTO_CARGA: TStringField
      FieldName = 'CD_TIPO_DCTO_CARGA'
      Size = 2
    end
    object QR_CapaDINR_DCTO_CARGA: TStringField
      FieldName = 'NR_DCTO_CARGA'
      Size = 18
    end
    object QR_CapaDINR_DCTO_CARGA_MAST: TStringField
      FieldName = 'NR_DCTO_CARGA_MAST'
      Size = 18
    end
    object QR_CapaDINM_LOCAL_EMBARQUE: TStringField
      FieldName = 'NM_LOCAL_EMBARQUE'
      Size = 50
    end
    object QR_CapaDIDT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      Size = 8
    end
    object QR_CapaDICD_UTIL_DCTO_CARGA: TStringField
      FieldName = 'CD_UTIL_DCTO_CARGA'
      Size = 1
    end
    object QR_CapaDIPB_CARGA: TStringField
      FieldName = 'PB_CARGA'
      Size = 15
    end
    object QR_CapaDIPL_CARGA: TStringField
      FieldName = 'PL_CARGA'
      Size = 15
    end
    object QR_CapaDIDT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      Size = 8
    end
    object QR_CapaDICD_TIPO_MANIFESTO: TStringField
      FieldName = 'CD_TIPO_MANIFESTO'
      Size = 1
    end
    object QR_CapaDINR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Size = 15
    end
    object QR_CapaDICD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Size = 7
    end
    object QR_CapaDICD_SETOR_ARMAZENAM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAM'
      Size = 3
    end
    object QR_CapaDICD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Size = 3
    end
    object QR_CapaDIVL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
    end
    object QR_CapaDIVL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
    end
    object QR_CapaDIVL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
    end
    object QR_CapaDIVL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
    end
    object QR_CapaDICD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Size = 3
    end
    object QR_CapaDIVL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
    end
    object QR_CapaDIVL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
    end
    object QR_CapaDICD_MOEDA_DESPESAS: TStringField
      FieldName = 'CD_MOEDA_DESPESAS'
      Size = 3
    end
    object QR_CapaDIVL_TOT_DESPS_MNEG: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG'
    end
    object QR_CapaDIVL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
    end
    object QR_CapaDICD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Size = 3
    end
    object QR_CapaDIVL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
    end
    object QR_CapaDIVL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
    end
    object QR_CapaDIIN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
    end
    object QR_CapaDICD_TIPO_PGTO_TRIB: TStringField
      FieldName = 'CD_TIPO_PGTO_TRIB'
      Size = 1
    end
    object QR_CapaDINR_CONTA_PGTO_TRIB: TStringField
      FieldName = 'NR_CONTA_PGTO_TRIB'
      Size = 19
    end
    object QR_CapaDITX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      BlobType = ftMemo
    end
  end
  object TB_Adicao_DI: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'OP_ADI'#199#195'O_DE_IMPORTA'#199#195'O'
    Left = 96
    Top = 136
  end
  object TB_Tributos: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'TRIBUTO'
    Left = 160
    Top = 128
  end
  object TB_Ato_Vinculado: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'ATO_VINCULADO'
    Left = 224
    Top = 128
  end
  object RS_Item_Adicao: TQuery
    DatabaseName = 'IMPORT'
    RequestLive = True
    Left = 468
    Top = 8
  end
  object TB_Item_Adicao: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'DETALHE_MERCADORIA'
    Left = 288
    Top = 72
  end
  object RS_TB: TQuery
    DatabaseName = 'IMPORT'
    Left = 536
    Top = 8
  end
  object TB_Oco_Acrescimos: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'ACR'#201'SCIMO_VALORA'#199#195'O'
    Left = 288
    Top = 128
  end
  object TB_Oco_Deducao: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'DEDU'#199#195'O_VALORA'#199#195'O'
    Left = 536
    Top = 72
  end
  object TB_Oco_Doc_Vinculado: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'DOCUMENTO_VINCULADO'
    Left = 346
    Top = 72
  end
  object TB_Oco_Dest_NCM: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'DESTAQUE_NCM'
    Left = 536
    Top = 128
  end
  object TB_Oco_Pagto_Previsto: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'PAGAMENTO_PREVISTO'
    Left = 346
    Top = 128
  end
  object TB_Oco_Pagto_Vinculado: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'PAGAMENTO_VINCULADO'
    Left = 408
    Top = 72
  end
  object TB_Valoracao_NCM: TTable
    DatabaseName = 'IMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'VALORA'#199#195'O_NCM'
    Left = 468
    Top = 128
  end
  object qry_di_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT D.NR_PROCESSO, D.CD_BANDEIRA_TRANSP, D.CD_IMPORTADOR, D.C' +
        'D_INCOTERM, D.CD_LOCAL_EMBARQUE, D.CD_MODALIDADE_DESP,'
      
        '       D.CD_MOEDA_FRETE, D.CD_MOEDA_MLE, D.CD_MOEDA_SEGURO, D.CD' +
        '_PAIS_PROC_CARGA, D.CD_RECINTO_ALFAND, D.CD_SETOR_ARMAZENAM,'
      
        '       D.CD_TIPO_AG_CARGA, D.CD_TIPO_CONSIG, D.CD_TIPO_DCTO_CARG' +
        'A, D.CD_TIPO_DECLARACAO, D.CD_TIPO_IMPORTADOR, D.CD_TIPO_MANIFES' +
        'TO,'
      
        '       D.CD_TRANSPORTADOR, D.CD_URF_DESPACHO, D.CD_URF_ENTR_CARG' +
        'A, D.CD_UTIL_DCTO_CARGA, D.CD_VIA_TRANSP_CARG, D.DT_CHEGADA_CARG' +
        'A,'
      
        '       D.DT_EMBARQUE, D.DT_TRANSMISSAO, D.IN_MULTIMODAL, D.IN_OP' +
        'ERACAO_FUNDAP, D.NM_VEICULO_TRANSP, D.NR_AGENTE_CARGA, D.NR_DCTO' +
        '_CARGA,'
      
        '       D.NR_DCTO_CARGA_MAST, D.NR_CONSIGNATARIO, D.NR_MANIFESTO,' +
        ' D.NR_VEICULO_TRANSP, D.PB_CARGA, D.PL_CARGA,'
      
        '       ISNULL(D.TX_INFO_COMPL_AUTO, '#39#39') +  CAST(ISNULL(D.TX_INFO' +
        '_COMPL, '#39#39') AS VARCHAR(MAX)) AS TX_INFO_COMPL,'
      
        '       D.VL_FRETE_TNAC_MNEG, D.VL_TOT_DESPS_MN, D.VL_TOT_DESPS_M' +
        'NEG, D.VL_TOT_FRT_COLLECT, D.VL_TOT_FRT_PREPAID, D.VL_TOT_MLE_MN' +
        'EG,'
      
        '       D.VL_TOT_SEGURO_MNEG, D.VL_TOTAL_FRETE_MN, D.VL_TOTAL_MLE' +
        '_MN, D.VL_TOTAL_SEG_MN, D.CD_TIPO_PGTO_TRIB, D.NR_CONTA_PGTO_TRI' +
        'B,'
      
        '       D.TX_MLE, D.IN_EMBUT_FRT_ITENS, D.IN_EMBUT_SEG_ITENS, D.V' +
        'L_TOTAL_ACRESCIMOS_MNEG, D.VL_TOTAL_DEDUCOES_MNEG, D.VL_TOTAL_FR' +
        'ETE_MNEG,'
      
        '       D.NR_PROCESSO_SISCOMEX, D.CD_PRESENCA_CARGA, D.CD_FORNECE' +
        'DOR, D.CD_PAIS_AQUIS_MERC, D.CD_FABRICANTE, D.CD_PAIS_ORIG_MERC,'
      
        '       D.VL_TOTAL_ACRESCIMOS_MN, D.VL_TOTAL_DEDUCOES_MN, E.CGC_E' +
        'MPRESA , E.CPF_EMPRESA, E.OUTRO_DOC, E.CD_PAIS_IMPORTADOR, E.NM_' +
        'EMPRESA,'
      
        '       E.NR_TELEFONE, E.END_EMPRESA, E.END_NUMERO, E.END_BAIRRO,' +
        ' E.END_CIDADE, E.END_UF, E.END_CEP, L.DESCRICAO NM_LOCAL_EMBARQU' +
        'E,'
      
        '       T.DESCRICAO NM_TRANSPORTADOR, P.CD_ARMAZEM_ATRACACAO, P.C' +
        'D_ARMAZEM_DESCARGA'
      'FROM   TDECLARACAO_IMPORTACAO D,'
      '       TEMPRESA_NAC E,'
      '       TLOCAL_EMBARQUE L,'
      '       TTRANSPORTADOR_ITL T,'
      '       TPROCESSO P'
      'WHERE P.NR_PROCESSO        = D.NR_PROCESSO '
      '  AND D.CD_IMPORTADOR      = E.CD_EMPRESA'
      '  AND D.CD_LOCAL_EMBARQUE *= L.CODIGO'
      '  AND D.CD_TRANSPORTADOR  *= T.CODIGO'
      '  AND D.NR_PROCESSO        = :NR_PROCESSO')
    Left = 648
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_di_CD_BANDEIRA_TRANSP: TStringField
      FieldName = 'CD_BANDEIRA_TRANSP'
      FixedChar = True
      Size = 3
    end
    object qry_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_di_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_di_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_di_CD_MODALIDADE_DESP: TStringField
      FieldName = 'CD_MODALIDADE_DESP'
      FixedChar = True
      Size = 1
    end
    object qry_di_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_di_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      FixedChar = True
      Size = 3
    end
    object qry_di_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      FixedChar = True
      Size = 3
    end
    object qry_di_CD_PAIS_PROC_CARGA: TStringField
      FieldName = 'CD_PAIS_PROC_CARGA'
      FixedChar = True
      Size = 3
    end
    object qry_di_CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      FixedChar = True
      Size = 7
    end
    object qry_di_CD_SETOR_ARMAZENAM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAM'
      FixedChar = True
      Size = 3
    end
    object qry_di_CD_TIPO_AG_CARGA: TStringField
      FieldName = 'CD_TIPO_AG_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_di_CD_TIPO_CONSIG: TStringField
      FieldName = 'CD_TIPO_CONSIG'
      FixedChar = True
      Size = 1
    end
    object qry_di_CD_TIPO_DCTO_CARGA: TStringField
      FieldName = 'CD_TIPO_DCTO_CARGA'
      FixedChar = True
      Size = 2
    end
    object qry_di_CD_TIPO_DECLARACAO: TStringField
      FieldName = 'CD_TIPO_DECLARACAO'
      FixedChar = True
      Size = 2
    end
    object qry_di_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      FixedChar = True
      Size = 1
    end
    object qry_di_CD_TIPO_MANIFESTO: TStringField
      FieldName = 'CD_TIPO_MANIFESTO'
      FixedChar = True
      Size = 1
    end
    object qry_di_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      FixedChar = True
      Size = 4
    end
    object qry_di_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qry_di_CD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      FixedChar = True
      Size = 7
    end
    object qry_di_CD_UTIL_DCTO_CARGA: TStringField
      FieldName = 'CD_UTIL_DCTO_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_di_CD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      FixedChar = True
      Size = 2
    end
    object qry_di_DT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      FixedChar = True
      Size = 8
    end
    object qry_di_DT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      FixedChar = True
      Size = 8
    end
    object qry_di_DT_TRANSMISSAO: TStringField
      FieldName = 'DT_TRANSMISSAO'
      FixedChar = True
      Size = 8
    end
    object qry_di_IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
    end
    object qry_di_IN_OPERACAO_FUNDAP: TBooleanField
      FieldName = 'IN_OPERACAO_FUNDAP'
    end
    object qry_di_NM_VEICULO_TRANSP: TStringField
      FieldName = 'NM_VEICULO_TRANSP'
      FixedChar = True
      Size = 30
    end
    object qry_di_NR_AGENTE_CARGA: TStringField
      FieldName = 'NR_AGENTE_CARGA'
      FixedChar = True
      Size = 14
    end
    object qry_di_NR_DCTO_CARGA: TStringField
      FieldName = 'NR_DCTO_CARGA'
      FixedChar = True
      Size = 30
    end
    object qry_di_NR_DCTO_CARGA_MAST: TStringField
      FieldName = 'NR_DCTO_CARGA_MAST'
      FixedChar = True
      Size = 30
    end
    object qry_di_NR_CONSIGNATARIO: TStringField
      FieldName = 'NR_CONSIGNATARIO'
      FixedChar = True
      Size = 14
    end
    object qry_di_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      FixedChar = True
      Size = 15
    end
    object qry_di_NR_VEICULO_TRANSP: TStringField
      FieldName = 'NR_VEICULO_TRANSP'
      FixedChar = True
      Size = 15
    end
    object qry_di_PB_CARGA: TFloatField
      FieldName = 'PB_CARGA'
    end
    object qry_di_PL_CARGA: TFloatField
      FieldName = 'PL_CARGA'
    end
    object qry_di_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      BlobType = ftMemo
    end
    object qry_di_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
    end
    object qry_di_VL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
    end
    object qry_di_VL_TOT_DESPS_MNEG: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG'
    end
    object qry_di_VL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
    end
    object qry_di_VL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
    end
    object qry_di_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
    end
    object qry_di_VL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
    end
    object qry_di_VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
    end
    object qry_di_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
    end
    object qry_di_VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
    end
    object qry_di_CD_TIPO_PGTO_TRIB: TStringField
      FieldName = 'CD_TIPO_PGTO_TRIB'
      FixedChar = True
      Size = 1
    end
    object qry_di_NR_CONTA_PGTO_TRIB: TStringField
      FieldName = 'NR_CONTA_PGTO_TRIB'
      FixedChar = True
      Size = 19
    end
    object qry_di_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
    end
    object qry_di_IN_EMBUT_FRT_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_FRT_ITENS'
    end
    object qry_di_IN_EMBUT_SEG_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_SEG_ITENS'
    end
    object qry_di_VL_TOTAL_ACRESCIMOS_MNEG: TFloatField
      FieldName = 'VL_TOTAL_ACRESCIMOS_MNEG'
    end
    object qry_di_VL_TOTAL_DEDUCOES_MNEG: TFloatField
      FieldName = 'VL_TOTAL_DEDUCOES_MNEG'
    end
    object qry_di_VL_TOTAL_FRETE_MNEG: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MNEG'
    end
    object qry_di_NR_PROCESSO_SISCOMEX: TStringField
      FieldName = 'NR_PROCESSO_SISCOMEX'
      FixedChar = True
      Size = 8
    end
    object qry_di_CD_PRESENCA_CARGA: TStringField
      FieldName = 'CD_PRESENCA_CARGA'
      FixedChar = True
      Size = 36
    end
    object qry_di_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      FixedChar = True
      Size = 5
    end
    object qry_di_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_di_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_di_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_di_VL_TOTAL_ACRESCIMOS_MN: TFloatField
      FieldName = 'VL_TOTAL_ACRESCIMOS_MN'
    end
    object qry_di_VL_TOTAL_DEDUCOES_MN: TFloatField
      FieldName = 'VL_TOTAL_DEDUCOES_MN'
    end
    object qry_di_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qry_di_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      FixedChar = True
      Size = 11
    end
    object qry_di_OUTRO_DOC: TStringField
      FieldName = 'OUTRO_DOC'
      FixedChar = True
    end
    object qry_di_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
    object qry_di_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_di_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_di_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_di_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_di_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_di_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_di_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_di_END_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_di_NM_LOCAL_EMBARQUE: TStringField
      FieldName = 'NM_LOCAL_EMBARQUE'
      FixedChar = True
      Size = 50
    end
    object qry_di_NM_TRANSPORTADOR: TStringField
      FieldName = 'NM_TRANSPORTADOR'
      FixedChar = True
      Size = 60
    end
    object qry_di_CD_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'CD_ARMAZEM_ATRACACAO'
      FixedChar = True
      Size = 4
    end
    object qry_di_CD_ARMAZEM_DESCARGA: TStringField
      FieldName = 'CD_ARMAZEM_DESCARGA'
      FixedChar = True
      Size = 4
    end
  end
  object qry_grd_di_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT SUBSTRING(D.NR_PROCESSO, 5, 14) NR_PROCESSO , D.DT_CALCUL' +
        'O, E.NM_EMPRESA,'
      
        '       NR_DECL_IMP_PROT, D.DT_TRANSMISSAO, D.CD_IMPORTADOR, E.IN' +
        '_VERIF_ICMS_TRANSM,'
      
        '       E.IN_REGIME_ESP, E.IN_CAT63, E.END_UF, E.CD_FUND_LEGAL_IC' +
        'MS, D.IN_CALCULOU_COM_AFRMM'
      'FROM   TDECLARACAO_IMPORTACAO D, TEMPRESA_NAC E'
      'WHERE D.CD_IMPORTADOR = E.CD_EMPRESA'
      '  AND DT_CALCULO IS NOT NULL'
      '  AND (:CD_GRUPO IN (E.CD_GRUPO, '#39#39'))'
      '  AND (:CD_CLIENTE IN (E.CD_EMPRESA, '#39#39'))'
      '  AND (:NR_PROCESSO IN (D.NR_PROCESSO, '#39#39'))'
      
        '  AND (ISNULL(NR_DECLARACAO_IMP, '#39#39') = '#39#39' OR ISNULL(:CD_CARGO, '#39 +
        #39') IN ('#39'001'#39'))'
      '  AND LEFT(D.NR_PROCESSO, 2) = :CD_UNID_NEG       '
      'ORDER BY D.NR_PROCESSO')
    Left = 40
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
        Size = 3
        Value = ''
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
        Size = 5
        Value = ''
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
        Value = ''
      end
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Size = 2
        Value = ''
      end>
    object qry_grd_di_NR_PROCESSO: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldName = 'NR_PROCESSO'
      Size = 14
    end
    object qry_grd_di_DT_CALCULO: TDateTimeField
      DisplayLabel = 'Dt. C'#225'lculo'
      FieldName = 'DT_CALCULO'
    end
    object qry_grd_di_NM_EMPRESA: TStringField
      DisplayLabel = 'Importador'
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_grd_di_NR_DECL_IMP_PROT: TStringField
      DisplayLabel = 'N'#186' Transmiss'#227'o'
      FieldName = 'NR_DECL_IMP_PROT'
      Size = 10
    end
    object qry_grd_di_DT_TRANSMISSAO: TStringField
      DisplayLabel = 'Transmiss'#227'o'
      FieldName = 'DT_TRANSMISSAO'
      Size = 8
    end
    object qry_grd_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_grd_di_IN_VERIF_ICMS_TRANSM: TStringField
      FieldName = 'IN_VERIF_ICMS_TRANSM'
      FixedChar = True
      Size = 1
    end
    object qry_grd_di_IN_REGIME_ESP: TStringField
      FieldName = 'IN_REGIME_ESP'
      FixedChar = True
      Size = 1
    end
    object qry_grd_di_IN_CAT63: TStringField
      FieldName = 'IN_CAT63'
      FixedChar = True
      Size = 1
    end
    object qry_grd_di_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_grd_di_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_grd_di_IN_CALCULOU_COM_AFRMM: TStringField
      FieldName = 'IN_CALCULOU_COM_AFRMM'
      FixedChar = True
      Size = 1
    end
  end
  object ds_grd_di: TDataSource
    DataSet = qry_grd_di_
    Left = 40
    Top = 251
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG (NOLOCK)'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 40
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
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
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, END_CIDADE'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Left = 147
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
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
    object qry_cliente_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 30
    end
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TGRUPO (NOLOCK)'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Left = 96
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
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
  object qry_di_scx_: TQuery
    DatabaseName = 'IMPORT'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   DECLARA'#199#195'O_IMPORTA'#199#195'O')
    Left = 40
    Top = 440
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, END_CIDADE'
      'FROM   TEMPRESA_NAC'
      'WHERE  CD_EMPRESA = :CD_CLIENTE')
    Left = 215
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
  end
  object qry_di_atz_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TDECLARACAO_IMPORTACAO'
      'SET    NR_PROCESSO_SISCOMEX = :NR_PROCESSO_SISCOMEX'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 107
    Top = 251
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO_SISCOMEX'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_adicao_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT A.NR_PROCESSO, A.NR_ADICAO, A.CD_URF_ENTR_MERC, A.CD_VIA_' +
        'TRANSPORTE,'
      
        '       A.IN_MULTIMODAL, A.CD_FORNECEDOR, A.CD_PAIS_AQUIS_MERC, A' +
        '.CD_MERCADORIA_NCM,'
      
        '       A.CD_PAIS_PROC_MERC, A.CD_FABRICANTE, A.CD_PAIS_ORIG_MERC' +
        ', A.CD_MERC_NBM_SH,'
      
        '       A.CD_MERC_NALADI_NCC, A.CD_MERC_NALADI_SH, A.PL_MERCADORI' +
        'A, A.QT_UN_ESTATISTICA,'
      
        '       A.CD_APLICACAO_MERC, A.CD_MOEDA_NEGOCIADA, A.CD_INCOTERMS' +
        '_VENDA, A.VL_MERC_COND_VENDA,'
      
        '       A.VL_MERC_VENDA_MN, A.VL_FRETE_MERC_MNEG, A.CD_MD_FRETE_M' +
        'ERC, A.VL_SEG_MERC_MNEG,'
      
        '       A.VL_SEG_MERC_MN, A.CD_MOEDA_SEG_MERC, A.VL_FRETE_MERC_MN' +
        ', A.CD_METOD_VALORACAO,'
      
        '       A.CD_VINC_IMPO_EXPO, A.CD_TIPO_ACORDO_TAR, A.CD_ACORDO_AL' +
        'ADI, A.CD_FUND_LEG_REGIME,'
      
        '       A.CD_MOTIVO_ADM_TEMP, A.PC_COEF_REDUC_II, A.CD_COBERT_CAM' +
        'BIAL, A.QT_PARC_FINANC_360,'
      
        '       A.QT_PERIOD_PGTO_360, A.VL_TOT_FINANC_360, A.CD_PERIOD_PG' +
        'TO_360, A.CD_TIPO_AGENTE_IMP,'
      
        '       A.NR_AGENTE_IMP, A.CD_BANC_AGENTE_IMP, A.CD_BANC_AGENTE_I' +
        'MP, A.CD_AGENC_AGENT_IMP,'
      
        '       A.PC_COMISSAO_AG_IMP, A.PC_COMISSAO_AG_IMP, A.CD_MODALIDA' +
        'DE_PGTO, A.CD_MOTIVO_SEM_COB,'
      
        '       A.CD_TAXA_JUROS, A.PC_TAXA_JUROS, A.VL_FINANC_SUP_360, A.' +
        'IN_BEM_ENCOMENDA,'
      
        '       A.IN_MATERIAL_USADO, A.TX_COMPL_VL_ADUAN, A.IN_IPI_NAO_TR' +
        'IBUT, A.VL_MERC_LOC_EMB_MN,'
      
        '       A.VL_BASE_CALCULO_MN, A.CD_AUSENCIA_FABRIC, A.CD_REGIME_T' +
        'RIBUTAR, A.CD_ORGAO_FIN_INTER,'
      
        '       A.NR_ROF, A.NR_OPER_TRAT_PREV, A.IN_PGTO_VARIAV_360, A.VL' +
        '_BASE_CALC_II, A.NM_FORN_ESTR,'
      
        '       A.ED_LOGR_FORN_ESTR, A.ED_NR_FORN_ESTR, A.ED_COMPL_FORN_E' +
        'STR, A.ED_CIDAD_FORN_ESTR,'
      
        '       A.ED_ESTAD_FORN_ESTR, A.CD_PAIS_AQUIS_MERC, A.NM_FABRICAN' +
        'TE_MERC, A.ED_LOGR_FABRIC,'
      
        '       A.ED_NR_FABRIC, A.ED_COMPL_FABRIC, A.ED_CIDAD_FABRIC, A.E' +
        'D_ESTADO_FABRIC, A.CD_LOC_COND_VENDA,'
      
        '       A.PC_ICMS, A.PC_REDUCAO_ICMS, A.CD_FUND_LEGAL_ICMS, A.CD_' +
        'TRIBUTACAO_ICMS, A.CD_FUND_LEGAL_ICMS,'
      
        '       A.ALIQ_PIS, A.ALIQ_COFINS, A.CD_TIPO_BENEF_PIS_COFINS, A.' +
        'CD_FUND_LEGAL_PISCOFINS, A.VL_ALIQUOTA_ESPECIFICA_PIS,'
      
        '       A.VL_ALIQUOTA_ESPECIFICA_COFINS, A.QTD_UNID_ESPECIFICA_PI' +
        'S, A.QTD_UNID_ESPECIFICA_COFINS,'
      
        '       UPIS.NM_UNID_MEDIDA AS NM_UNID_MEDIDA_PIS, UCOFINS.NM_UNI' +
        'D_MEDIDA AS NM_UNID_MEDIDA_COFINS,'
      
        '       A.IN_SUSPENDE_II_RETIFIC, A.IN_SUSPENDE_IPI_RETIFIC, A.IN' +
        '_SUSPENDE_PIS_COFINS_RETIFIC, A.IN_FUNDO_POBREZA,'
      '       A.PC_REDUCAO_PIS_COFINS'
      'FROM TADICAO_DE_IMPORTACAO A (NOLOCK)'
      
        '   LEFT JOIN TUNID_MEDIDA_BROKER UPIS (NOLOCK) ON UPIS.CD_UNID_M' +
        'EDIDA = A.CD_UNIDADE_MEDIDA_PIS'
      
        '   LEFT JOIN TUNID_MEDIDA_BROKER UCOFINS (NOLOCK) ON UCOFINS.CD_' +
        'UNID_MEDIDA = A.CD_UNIDADE_MEDIDA_COFINS'
      'WHERE A.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_PROCESSO, NR_ADICAO')
    Left = 651
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_adicao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_adicao_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_CD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      FixedChar = True
      Size = 7
    end
    object qry_adicao_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_adicao_IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
    end
    object qry_adicao_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      FixedChar = True
      Size = 5
    end
    object qry_adicao_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_CD_MERCADORIA_NCM: TStringField
      FieldName = 'CD_MERCADORIA_NCM'
      FixedChar = True
      Size = 11
    end
    object qry_adicao_CD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_adicao_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_CD_MERC_NBM_SH: TStringField
      FieldName = 'CD_MERC_NBM_SH'
      FixedChar = True
      Size = 8
    end
    object qry_adicao_CD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      FixedChar = True
      Size = 7
    end
    object qry_adicao_CD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object qry_adicao_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qry_adicao_QT_UN_ESTATISTICA: TFloatField
      FieldName = 'QT_UN_ESTATISTICA'
    end
    object qry_adicao_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_VL_MERC_COND_VENDA: TFloatField
      FieldName = 'VL_MERC_COND_VENDA'
    end
    object qry_adicao_VL_MERC_VENDA_MN: TFloatField
      FieldName = 'VL_MERC_VENDA_MN'
    end
    object qry_adicao_VL_FRETE_MERC_MNEG: TFloatField
      FieldName = 'VL_FRETE_MERC_MNEG'
    end
    object qry_adicao_CD_MD_FRETE_MERC: TStringField
      FieldName = 'CD_MD_FRETE_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_VL_SEG_MERC_MNEG: TFloatField
      FieldName = 'VL_SEG_MERC_MNEG'
    end
    object qry_adicao_VL_SEG_MERC_MN: TFloatField
      FieldName = 'VL_SEG_MERC_MN'
    end
    object qry_adicao_CD_MOEDA_SEG_MERC: TStringField
      FieldName = 'CD_MOEDA_SEG_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_VL_FRETE_MERC_MN: TFloatField
      FieldName = 'VL_FRETE_MERC_MN'
    end
    object qry_adicao_CD_METOD_VALORACAO: TStringField
      FieldName = 'CD_METOD_VALORACAO'
      FixedChar = True
      Size = 2
    end
    object qry_adicao_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      FixedChar = True
      Size = 2
    end
    object qry_adicao_CD_MOTIVO_ADM_TEMP: TStringField
      FieldName = 'CD_MOTIVO_ADM_TEMP'
      FixedChar = True
      Size = 2
    end
    object qry_adicao_PC_COEF_REDUC_II: TFloatField
      FieldName = 'PC_COEF_REDUC_II'
    end
    object qry_adicao_CD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_QT_PARC_FINANC_360: TIntegerField
      FieldName = 'QT_PARC_FINANC_360'
    end
    object qry_adicao_QT_PERIOD_PGTO_360: TIntegerField
      FieldName = 'QT_PERIOD_PGTO_360'
    end
    object qry_adicao_VL_TOT_FINANC_360: TFloatField
      FieldName = 'VL_TOT_FINANC_360'
    end
    object qry_adicao_CD_PERIOD_PGTO_360: TStringField
      FieldName = 'CD_PERIOD_PGTO_360'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_CD_TIPO_AGENTE_IMP: TStringField
      FieldName = 'CD_TIPO_AGENTE_IMP'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_NR_AGENTE_IMP: TStringField
      FieldName = 'NR_AGENTE_IMP'
      FixedChar = True
      Size = 14
    end
    object qry_adicao_CD_BANC_AGENTE_IMP: TStringField
      FieldName = 'CD_BANC_AGENTE_IMP'
      FixedChar = True
      Size = 5
    end
    object qry_adicao_CD_BANC_AGENTE_IMP_1: TStringField
      FieldName = 'CD_BANC_AGENTE_IMP_1'
      FixedChar = True
      Size = 5
    end
    object qry_adicao_CD_AGENC_AGENT_IMP: TStringField
      FieldName = 'CD_AGENC_AGENT_IMP'
      FixedChar = True
      Size = 4
    end
    object qry_adicao_PC_COMISSAO_AG_IMP: TFloatField
      FieldName = 'PC_COMISSAO_AG_IMP'
    end
    object qry_adicao_PC_COMISSAO_AG_IMP_1: TFloatField
      FieldName = 'PC_COMISSAO_AG_IMP_1'
    end
    object qry_adicao_CD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      FixedChar = True
      Size = 2
    end
    object qry_adicao_CD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      FixedChar = True
      Size = 2
    end
    object qry_adicao_CD_TAXA_JUROS: TStringField
      FieldName = 'CD_TAXA_JUROS'
      FixedChar = True
      Size = 4
    end
    object qry_adicao_PC_TAXA_JUROS: TFloatField
      FieldName = 'PC_TAXA_JUROS'
    end
    object qry_adicao_VL_FINANC_SUP_360: TFloatField
      FieldName = 'VL_FINANC_SUP_360'
    end
    object qry_adicao_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
    end
    object qry_adicao_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
    end
    object qry_adicao_TX_COMPL_VL_ADUAN: TStringField
      FieldName = 'TX_COMPL_VL_ADUAN'
      FixedChar = True
      Size = 250
    end
    object qry_adicao_IN_IPI_NAO_TRIBUT: TBooleanField
      FieldName = 'IN_IPI_NAO_TRIBUT'
    end
    object qry_adicao_VL_MERC_LOC_EMB_MN: TFloatField
      FieldName = 'VL_MERC_LOC_EMB_MN'
    end
    object qry_adicao_VL_BASE_CALCULO_MN: TFloatField
      FieldName = 'VL_BASE_CALCULO_MN'
    end
    object qry_adicao_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      FixedChar = True
      Size = 2
    end
    object qry_adicao_NR_ROF: TStringField
      FieldName = 'NR_ROF'
      FixedChar = True
      Size = 8
    end
    object qry_adicao_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object qry_adicao_IN_PGTO_VARIAV_360: TBooleanField
      FieldName = 'IN_PGTO_VARIAV_360'
    end
    object qry_adicao_VL_BASE_CALC_II: TFloatField
      FieldName = 'VL_BASE_CALC_II'
    end
    object qry_adicao_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      FixedChar = True
      Size = 60
    end
    object qry_adicao_ED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      FixedChar = True
      Size = 40
    end
    object qry_adicao_ED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      FixedChar = True
      Size = 6
    end
    object qry_adicao_ED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      FixedChar = True
      Size = 21
    end
    object qry_adicao_ED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      FixedChar = True
      Size = 25
    end
    object qry_adicao_ED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      FixedChar = True
      Size = 25
    end
    object qry_adicao_CD_PAIS_AQUIS_MERC_1: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC_1'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_NM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      FixedChar = True
      Size = 60
    end
    object qry_adicao_ED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      FixedChar = True
      Size = 40
    end
    object qry_adicao_ED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      FixedChar = True
      Size = 6
    end
    object qry_adicao_ED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      FixedChar = True
      Size = 21
    end
    object qry_adicao_ED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      FixedChar = True
      Size = 25
    end
    object qry_adicao_ED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      FixedChar = True
      Size = 25
    end
    object qry_adicao_CD_LOC_COND_VENDA: TStringField
      FieldName = 'CD_LOC_COND_VENDA'
      FixedChar = True
      Size = 4
    end
    object qry_adicao_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
    end
    object qry_adicao_PC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
    end
    object qry_adicao_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_CD_FUND_LEGAL_ICMS_1: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS_1'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object qry_adicao_ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object qry_adicao_CD_TIPO_BENEF_PIS_COFINS: TStringField
      FieldName = 'CD_TIPO_BENEF_PIS_COFINS'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_CD_FUND_LEGAL_PISCOFINS: TStringField
      FieldName = 'CD_FUND_LEGAL_PISCOFINS'
      FixedChar = True
      Size = 2
    end
    object qry_adicao_VL_ALIQUOTA_ESPECIFICA_PIS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_PIS'
    end
    object qry_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_COFINS'
    end
    object qry_adicao_QTD_UNID_ESPECIFICA_PIS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_PIS'
    end
    object qry_adicao_QTD_UNID_ESPECIFICA_COFINS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_COFINS'
    end
    object qry_adicao_NM_UNID_MEDIDA_PIS: TStringField
      FieldName = 'NM_UNID_MEDIDA_PIS'
      FixedChar = True
      Size = 50
    end
    object qry_adicao_NM_UNID_MEDIDA_COFINS: TStringField
      FieldName = 'NM_UNID_MEDIDA_COFINS'
      FixedChar = True
      Size = 50
    end
    object qry_adicao_IN_SUSPENDE_II_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_II_RETIFIC'
    end
    object qry_adicao_IN_SUSPENDE_IPI_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_IPI_RETIFIC'
    end
    object qry_adicao_IN_SUSPENDE_PIS_COFINS_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_PIS_COFINS_RETIFIC'
    end
    object qry_adicao_IN_FUNDO_POBREZA: TStringField
      FieldName = 'IN_FUNDO_POBREZA'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_PC_REDUCAO_PIS_COFINS: TFloatField
      FieldName = 'PC_REDUCAO_PIS_COFINS'
    end
  end
  object qry_adicao_scx_: TQuery
    DatabaseName = 'IMPORT'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   OP_ADI'#199#195'O_DE_IMPORTA'#199#195'O')
    Left = 96
    Top = 440
  end
  object qry_doc_instrucao_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_TIPO_DCTO_INSTR, NR_DCTO_INSTRUCAO'
      'FROM   TDOCUMENTO_INSTRUCAO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 183
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_doc_instrucao_scx_: TQuery
    DatabaseName = 'IMPORT'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   DOCUMENTO_INSTRU'#199#195'O (NOLOCK)')
    Left = 151
    Top = 440
  end
  object qry_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_EMPRESA, NM_EMPRESA, END_EMPRESA, END_NUMERO, END_COMP' +
        'L, END_CIDADE,'
      '       END_ESTADO, CD_PAIS'
      'FROM   TEMPRESA_EST'
      'WHERE  CD_EMPRESA = :CD_EMPRESA    ')
    Left = 278
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qry_local_embarque_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM   TLOCAL_EMBARQUE'
      'WHERE  CODIGO = :CD_LOCAL_EMBARQUE    ')
    Left = 344
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_LOCAL_EMBARQUE'
        ParamType = ptUnknown
      end>
  end
  object qry_pagto_prev_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_ADICAO, NR_SEQUENCIA'
      'FROM   TPAGAMENTO_PREVISTO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_ADICAO = :NR_ADICAO')
    Left = 278
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
  end
  object qry_tributos_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ADICAO, CD_RECEITA_IMPOSTO, CD_TIPO_BENEF' +
        '_IPI, CD_TIPO_RECIPIENTE,'
      
        '       CD_TIPO_ALIQ_IPT, PC_ALIQ_NORM_ADVAL, PC_ALIQ_REDUZIDA, P' +
        'C_ALIQ_ACOR_TARIF,'
      
        '       VL_CALC_IPT_ADVAL, VL_CALC_II_AC_TARI, VL_IMPOSTO_DEVIDO,' +
        ' VL_IPT_A_RECOLHER,'
      
        '       VL_BASE_CALC_ADVAL, VL_ALIQ_ESPEC_IPT, NM_UN_ALIQ_ESP_IPT' +
        ', QT_MERC_UN_ALIQ_ES,'
      '       QT_ML_RECIPIENTE, NR_NOTA_COMPL_TIPI, PC_REDUCAO_IPT_BLI'
      'FROM   TRIBUTO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_ADICAO = :NR_ADICAO AND'
      '       CD_RECEITA_IMPOSTO = :CD_RECEITA_IMPOSTO')
    Left = 344
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_RECEITA_IMPOSTO'
        ParamType = ptUnknown
      end>
  end
  object qry_ato_vinculado_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ADICAO, CD_ASSUNTO_VINCUL, NR_EX_ATO_VINC' +
        'UL, SG_TIPO_ATO_VINCUL,'
      '       SG_ORG_ATO_VINCUL, DT_ANO_ATO_VINCUL, NR_ATO_VINCULADO'
      'FROM   TATO_VINCULADO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_ADICAO = :NR_ADICAO AND'
      '       CD_ASSUNTO_VINCUL = :CD_ASSUNTO_VINCUL')
    Left = 418
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ASSUNTO_VINCUL'
        ParamType = ptUnknown
      end>
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ADICAO, NR_ITEM, TX_DESC_DET_MERC, QT_MER' +
        'C_UN_COMERC,'
      '       CD_UN_MED_COMERC, VL_UNID_COND_VENDA, VL_DED_CPT_MNEG '
      'FROM   TDETALHE_MERCADORIA (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_PROCESSO, NR_ADICAO, NR_ITEM ')
    Left = 488
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_unid_medida_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA'
      'FROM   TUNID_MEDIDA_BROKER'
      'WHERE  CD_UNID_MEDIDA = :CD_UNID_MEDIDA')
    Left = 418
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_MEDIDA'
        ParamType = ptUnknown
      end>
  end
  object qry_di_acrescimos_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TACRESCIMO_VALORACAO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 564
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_di_deducao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TDEDUCAO_VALORACAO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 632
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_doc_vinculado_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TDOCUMENTO_VINCULADO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 215
    Top = 251
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_destaque_ncm_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TDESTAQUE_NCM'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 278
    Top = 251
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_pagto_previsto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TPAGAMENTO_PREVISTO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 344
    Top = 251
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_pagto_vinculado_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TPAGAMENTO_VINCULADO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 418
    Top = 251
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_valoracao_ncm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DISTINCT NR_PROCESSO, NR_ADICAO, CD_NIVEL_NVE, CD_ATRIBUT' +
        'O_NCM, CD_ESPECIF_NCM, CD_NCM_ATRIBUTO, CD_NCM_ESPECIF'
      'FROM TDI_NVE'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 488
    Top = 251
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = '0101IM-008473-14'
      end>
  end
  object qry_pagto_trib_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PT.NR_PROCESSO,'
      '       PT.CD_RECEITA_PGTO,'
      '       PT.CD_BANCO_PGTO_TRIB,'
      '       PT.NR_AGENC_PGTO_TRIB,'
      '       PT.DT_PGTO_TRIBUTO,'
      '       PT.VL_MULTA_PGTO_TRIB,'
      '       PT.VL_JUROS_PGTO_TRIB,'
      '       PT.VL_TRIBUTO_PAGO AS VL_TRIBUTO_PAGO_TOTAL,'
      '       PT.VL_TRIBUTO_PAGO - SUM(CASE PT.CD_RECEITA_PGTO'
      
        '                                    WHEN '#39'0086'#39' THEN ISNULL(TRII' +
        '.VL_IPT_A_RECOLHER, 0)'
      
        '                                    WHEN '#39'1038'#39' THEN ISNULL(TRIP' +
        'I.VL_IPT_A_RECOLHER, 0)'
      
        '                                    WHEN '#39'5602'#39' THEN ISNULL(AI.V' +
        'L_PIS, 0)'
      
        '                                    WHEN '#39'5629'#39' THEN ISNULL(AI.V' +
        'L_COFINS, 0)'
      '                                ELSE 0'
      '                                END) AS VL_TRIBUTO_PAGO,'
      '       SUM(CASE PT.CD_RECEITA_PGTO'
      
        '               WHEN '#39'0086'#39' THEN ISNULL(TRII.VL_IPT_A_RECOLHER, 0' +
        ')'
      
        '               WHEN '#39'1038'#39' THEN ISNULL(TRIPI.VL_IPT_A_RECOLHER, ' +
        '0)'
      '               WHEN '#39'5602'#39' THEN ISNULL(AI.VL_PIS, 0)'
      '               WHEN '#39'5629'#39' THEN ISNULL(AI.VL_COFINS, 0)'
      '           ELSE 0'
      '           END) AS VL_ADM_TEMP'
      'FROM TPAGAMENTO_TRIBUTOS PT'
      
        '   LEFT JOIN TADICAO_DE_IMPORTACAO AI ON AI.NR_PROCESSO        =' +
        ' PT.NR_PROCESSO'
      
        '                                     AND AI.CD_REGIME_TRIBUTAR =' +
        ' '#39'5'#39
      
        '                                     AND AI.CD_FUND_LEG_REGIME =' +
        ' '#39'37'#39
      
        '   LEFT JOIN TRIBUTO TRII ON TRII.NR_PROCESSO        = AI.NR_PRO' +
        'CESSO'
      
        '                         AND TRII.NR_ADICAO          = AI.NR_ADI' +
        'CAO'
      '                         AND TRII.CD_RECEITA_IMPOSTO = '#39'0001'#39
      
        '   LEFT JOIN TRIBUTO TRIPI ON TRIPI.NR_PROCESSO        = AI.NR_P' +
        'ROCESSO'
      
        '                          AND TRIPI.NR_ADICAO          = AI.NR_A' +
        'DICAO'
      '                          AND TRIPI.CD_RECEITA_IMPOSTO = '#39'0002'#39
      'WHERE PT.NR_PROCESSO = :NR_PROCESSO'
      'GROUP BY PT.NR_PROCESSO,'
      '       PT.CD_RECEITA_PGTO,'
      '       PT.CD_BANCO_PGTO_TRIB,'
      '       PT.NR_AGENC_PGTO_TRIB,'
      '       PT.VL_TRIBUTO_PAGO,'
      '       PT.DT_PGTO_TRIBUTO,'
      '       PT.VL_MULTA_PGTO_TRIB,'
      '       PT.VL_JUROS_PGTO_TRIB'
      'HAVING PT.VL_TRIBUTO_PAGO - SUM(CASE PT.CD_RECEITA_PGTO'
      
        '                                          WHEN '#39'0086'#39' THEN ISNUL' +
        'L(TRII.VL_IPT_A_RECOLHER, 0)'
      
        '                                          WHEN '#39'1038'#39' THEN ISNUL' +
        'L(TRIPI.VL_IPT_A_RECOLHER, 0)'
      
        '                                          WHEN '#39'5602'#39' THEN ISNUL' +
        'L(AI.VL_PIS, 0)'
      
        '                                          WHEN '#39'5629'#39' THEN ISNUL' +
        'L(AI.VL_COFINS, 0)'
      '                                      ELSE 0'
      '                                      END) > 0')
    Left = 564
    Top = 251
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = ''
      end>
  end
  object qry_carga_armazem_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TCARGA_ARMAZEM'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 632
    Top = 251
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_embalagem_carga_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TEMBALAGEM_CARGA'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 632
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_proc_di_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TPROCESSO_DI'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 564
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, IN_DI_LIBERADA'
      'FROM '#9'TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 424
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_IN_DI_LIBERADA: TStringField
      FieldName = 'IN_DI_LIBERADA'
      Origin = 'TPROCESSO.IN_DI_LIBERADA'
      Size = 1
    end
  end
  object qry_di_bloqueada_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, IN_BLOQUEADO'
      'FROM TFOLLOWUP'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'CD_EVENTO = ( SELECT CD_EV_REG_DI FROM TPARAMETROS )')
    Left = 496
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_bloqueada_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_di_bloqueada_IN_BLOQUEADO: TStringField
      FieldName = 'IN_BLOQUEADO'
      Size = 1
    end
  end
  object qry_verif_cambio_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT D.NR_PROCESSO, A.NR_ADICAO, A.CD_COBERT_CAMBIAL,'
      '       ISNULL(A.VL_FINANC_SUP_360,0) VL_FINANC_SUP_360,'
      '       ISNULL(A.VL_TOT_FINANC_360,0) VL_TOT_FINANC_360,'
      '       ISNULL((SELECT SUM(VL_PREV_PGTO_360)'
      '          FROM TPAGAMENTO_PREVISTO'
      '          WHERE NR_PROCESSO = A.NR_PROCESSO AND'
      '                NR_ADICAO   = A.NR_ADICAO),0) VL_PREV_PGTO_360,'
      '       ISNULL((SELECT SUM(VL_VINC_MD_CAMBIO)'
      '          FROM TPAGAMENTO_VINCULADO'
      '          WHERE NR_PROCESSO = A.NR_PROCESSO AND'
      '                NR_ADICAO   = A.NR_ADICAO),0) VL_VINC_MD_CAMBIO,'
      '       ISNULL(A.VL_MERC_COND_VENDA,0) VL_MERC_COND_VENDA'
      'FROM TDECLARACAO_IMPORTACAO D,'
      '     TADICAO_DE_IMPORTACAO A'
      'WHERE D.NR_PROCESSO = A.NR_PROCESSO AND'
      '      D.NR_PROCESSO = :NR_PROCESSO')
    Left = 564
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_verif_cambio_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_verif_cambio_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object qry_verif_cambio_VL_FINANC_SUP_360: TFloatField
      FieldName = 'VL_FINANC_SUP_360'
    end
    object qry_verif_cambio_VL_TOT_FINANC_360: TFloatField
      FieldName = 'VL_TOT_FINANC_360'
    end
    object qry_verif_cambio_VL_PREV_PGTO_360: TFloatField
      FieldName = 'VL_PREV_PGTO_360'
    end
    object qry_verif_cambio_VL_VINC_MD_CAMBIO: TFloatField
      FieldName = 'VL_VINC_MD_CAMBIO'
    end
    object qry_verif_cambio_VL_MERC_COND_VENDA: TFloatField
      FieldName = 'VL_MERC_COND_VENDA'
    end
    object qry_verif_cambio_CD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Size = 1
    end
  end
  object qry_trib_ok_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      'ISNULL( ( SELECT SUM( ISNULL( VL_TRIBUTO_PAGO, 0 ) )'
      '          FROM   TPAGAMENTO_TRIBUTOS T (NOLOCK)'
      
        '          WHERE  P.NR_PROCESSO = T.NR_PROCESSO AND CD_RECEITA_PG' +
        'TO = '#39'0086'#39' ), 0 ) VL_II,'
      'ISNULL( ( SELECT ISNULL( SUM(VL_SOLICITADO), 0 )'
      '          FROM   TNUMERARIO_NOTIFICA_ITEM S (NOLOCK)'
      '          WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '                 S.IN_CANCELADO = '#39'0'#39' AND'
      
        '                 CD_ITEM IN ( SELECT CD_ITEM_II FROM TPARAMETROS' +
        ' (NOLOCK) ) ), 0 ) VL_SALDO_II,'
      'ISNULL( ( SELECT SUM( ISNULL( VL_TRIBUTO_PAGO, 0 ) )'
      '          FROM   TPAGAMENTO_TRIBUTOS T (NOLOCK)'
      
        '          WHERE  P.NR_PROCESSO = T.NR_PROCESSO AND CD_RECEITA_PG' +
        'TO = '#39'1038'#39' ), 0 ) VL_IPI,'
      'ISNULL( ( SELECT ISNULL( SUM(VL_SOLICITADO), 0 )'
      '          FROM   TNUMERARIO_NOTIFICA_ITEM S (NOLOCK)'
      '          WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '                 S.IN_CANCELADO = '#39'0'#39' AND'
      
        '                 CD_ITEM IN ( SELECT CD_ITEM_IPI FROM TPARAMETRO' +
        'S (NOLOCK) ) ), 0 ) VL_SALDO_IPI,'
      'ISNULL( ( SELECT SUM( ISNULL( VL_TRIBUTO_PAGO, 0 ) )'
      '          FROM   TPAGAMENTO_TRIBUTOS T (NOLOCK)'
      
        '          WHERE  P.NR_PROCESSO = T.NR_PROCESSO AND CD_RECEITA_PG' +
        'TO = '#39'7811'#39' ), 0 ) VL_SISCOMEX,'
      'ISNULL( ( SELECT ISNULL( SUM(VL_SOLICITADO), 0 )'
      '          FROM   TNUMERARIO_NOTIFICA_ITEM S (NOLOCK)'
      '          WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '                 S.IN_CANCELADO = '#39'0'#39' AND'
      
        '                 CD_ITEM IN ( SELECT CD_ITEM_SISCOMEX FROM TPARA' +
        'METROS (NOLOCK) ) AND'
      
        '                 ISNULL(IN_CANCELADO,0) = 0 ), 0 ) VL_SALDO_SISC' +
        'OMEX'
      'FROM  TPROCESSO P (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 424
    Top = 520
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_trib_ok_VL_II: TFloatField
      FieldName = 'VL_II'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_trib_ok_VL_SALDO_II: TFloatField
      FieldName = 'VL_SALDO_II'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_trib_ok_VL_IPI: TFloatField
      FieldName = 'VL_IPI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_trib_ok_VL_SALDO_IPI: TFloatField
      FieldName = 'VL_SALDO_IPI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_trib_ok_VL_SISCOMEX: TFloatField
      FieldName = 'VL_SISCOMEX'
    end
    object qry_trib_ok_VL_SALDO_SISCOMEX: TFloatField
      FieldName = 'VL_SALDO_SISCOMEX'
    end
  end
  object qry_ipi_ok_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS IPI_OK'
      'FROM   TNUMERARIO_NOTIFICA_ITEM N, TITEM I (NOLOCK)'
      'WHERE  N.CD_ITEM = I.CD_ITEM AND'
      '       N.NR_PROCESSO = :NR_PROCESSO AND'
      
        '       N.CD_ITEM IN ( SELECT CD_ITEM_IPI FROM TPARAMETROS (NOLOC' +
        'K) ) AND'
      '       N.TP_DESTINO IN ( '#39'2'#39', '#39'3'#39' ) AND N.VL_SOLICITADO > 0 AND'
      '       I.IN_ITEM_DI = '#39'1'#39)
    Left = 496
    Top = 520
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ipi_ok_IPI_OK: TIntegerField
      FieldName = 'IPI_OK'
    end
  end
  object qry_ii_ok_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS II_OK'
      'FROM   TNUMERARIO_NOTIFICA_ITEM N, TITEM I (NOLOCK)'
      'WHERE  N.CD_ITEM = I.CD_ITEM AND'
      '       N.NR_PROCESSO = :NR_PROCESSO AND'
      
        '       N.CD_ITEM IN ( SELECT CD_ITEM_II FROM TPARAMETROS (NOLOCK' +
        ') ) AND'
      '       N.TP_DESTINO IN ( '#39'2'#39', '#39'3'#39' ) AND N.VL_SOLICITADO > 0 AND'
      '       I.IN_ITEM_DI = '#39'1'#39)
    Left = 564
    Top = 520
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ii_ok_II_OK: TIntegerField
      FieldName = 'II_OK'
    end
  end
  object qry_itens_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOTAL_SEM_SALDO'
      
        'FROM   TNUMERARIO_SALDO_POR_ITEM S, TITEM I, TNUMERARIO_ITEM_SOL' +
        'IC N'
      'WHERE  S.NR_PROCESSO = N.NR_PROCESSO AND'
      '       S.CD_ITEM = N.CD_ITEM AND'
      '       N.TP_DESTINO IN ( '#39'2'#39', '#39'3'#39' ) AND'
      '       S.CD_ITEM = I.CD_ITEM AND'
      '       S.NR_PROCESSO = :NR_PROCESSO AND'
      '       I.IN_ITEM_DI = '#39'1'#39' AND'
      '       S.VL_SALDO_ITEM < S.VL_SOLICITADO AND'
      '       S.CD_ITEM <> '#39'999'#39)
    Left = 632
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_itens_di_TOTAL_SEM_SALDO: TIntegerField
      FieldName = 'TOTAL_SEM_SALDO'
    end
  end
  object qry_o_destaque_ncm_: TQuery
    DatabaseName = 'IMPORT'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   DESTAQUE_NCM'
      'WHERE  NR_DECL_IMP_MICRO = :NR_DECL_IMP_MICRO')
    Left = 468
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_DECL_IMP_MICRO'
        ParamType = ptUnknown
      end>
  end
  object qry_siscomex_ok_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS SISCOMEX_OK'
      'FROM   TNUMERARIO_NOTIFICA_ITEM N, TITEM I (NOLOCK)'
      'WHERE  N.CD_ITEM = I.CD_ITEM AND'
      '       N.NR_PROCESSO = :NR_PROCESSO AND'
      
        '       N.CD_ITEM IN ( SELECT CD_ITEM_SISCOMEX FROM TPARAMETROS (' +
        'NOLOCK) ) AND'
      '       N.TP_DESTINO IN ( '#39'2'#39', '#39'3'#39' ) AND N.VL_SOLICITADO > 0 AND'
      '       I.IN_ITEM_DI = '#39'1'#39)
    Left = 632
    Top = 520
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_siscomex_ok_SISCOMEX_OK: TIntegerField
      FieldName = 'SISCOMEX_OK'
    end
  end
  object sp_di_libera_cc_propria: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_libera_cc_propria'
    Left = 353
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object qry_existe_adicao_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_ADICAO'
      'FROM   TADICAO_DE_IMPORTACAO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND NR_ADICAO = :NR_ADICAO')
    Left = 352
    Top = 520
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
  end
  object qry_del_ded_cpt_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE TDEDUCAO_VALORACAO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       CD_MET_DEDUC_VALOR = '#39'1'#39)
    Left = 40
    Top = 520
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object sp_di_ded_cpt: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_ded_cpt'
    Left = 97
    Top = 520
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object qry_tot_deducao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM( ISNULL( VL_DEDUCAO_MNEG, 0 ) ) VL_DEDUCAO_MNEG,'
      '       SUM( ISNULL( VL_DEDUCAO_MN, 0 ) ) VL_DEDUCAO_MN'
      'FROM   TDEDUCAO_VALORACAO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_ADICAO = :NR_ADICAO AND'
      '       CD_MET_DEDUC_VALOR = '#39'1'#39)
    Left = 155
    Top = 520
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
  end
  object qry_merc_com_ato_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.NR_PROCESSO, I.NR_PROC_PO, M.CD_MERCADORIA, M.AP_MERCAD' +
        'ORIA'
      'FROM   TDETALHE_MERCADORIA I, TMERCADORIA M'
      'WHERE  I.CD_MERCADORIA = M.CD_MERCADORIA AND'
      '       M.IN_ATO_DRAWBACK = '#39'1'#39' AND'
      '       NR_PROCESSO = :NR_PROCESSO'
      
        'GROUP BY I.NR_PROCESSO, I.NR_PROC_PO, M.CD_MERCADORIA, M.AP_MERC' +
        'ADORIA')
    Left = 488
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_ver_aliq_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT T.NR_PROCESSO, T.NR_ADICAO, T.CD_RECEITA_IMPOSTO, T.PC_AL' +
        'IQ_NORM_ADVAL,'
      '       CASE REPLACE( N.ALIQUOTA_II, '#39','#39', '#39'.'#39' )'
      '         WHEN '#39'NT'#39' THEN 0'
      
        '         ELSE CONVERT( numeric(14,2), REPLACE( N.ALIQUOTA_II, '#39',' +
        #39', '#39'.'#39' ) )'
      '       END AS ALIQ_II_NCM,'
      '       CASE REPLACE( N.ALIQUOTA_IPI, '#39','#39', '#39'.'#39' )'
      '         WHEN '#39'NT'#39' THEN 0'
      
        '         ELSE CONVERT( numeric(14,2), REPLACE( N.ALIQUOTA_IPI, '#39 +
        ','#39', '#39'.'#39' ) )'
      '       END AS ALIQ_IPI_NCM,'
      '       A.CD_NCM_SH'
      'FROM   TRIBUTO T, TADICAO_DE_IMPORTACAO A, TNCM N'
      'WHERE  T.NR_PROCESSO = A.NR_PROCESSO AND'
      '       T.NR_ADICAO = A.NR_ADICAO AND'
      '       A.CD_NCM_SH = N.CODIGO AND'
      '       A.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY A.NR_PROCESSO, A.NR_ADICAO')
    Left = 632
    Top = 384
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ver_aliq_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_ver_aliq_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object qry_ver_aliq_CD_RECEITA_IMPOSTO: TStringField
      FieldName = 'CD_RECEITA_IMPOSTO'
      Size = 4
    end
    object qry_ver_aliq_PC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
    end
    object qry_ver_aliq_ALIQ_II_NCM: TFloatField
      FieldName = 'ALIQ_II_NCM'
    end
    object qry_ver_aliq_ALIQ_IPI_NCM: TFloatField
      FieldName = 'ALIQ_IPI_NCM'
    end
    object qry_ver_aliq_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Size = 8
    end
  end
  object qry_previsao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT A.NR_ADICAO,PC_ALIQ_REDUZIDA_II,P.NR_PROCESSO, P.VL_MLE_M' +
        'N, P.VL_FRETE_MN, P.VL_SEGURO_MN, P.PC_SEGURO, P.PB_PREVISAO, P.' +
        'PL_PREVISAO, P.CD_INCOTERM AS CD_INCOTERM_PREV,'
      
        '       D.VL_TOTAL_MLE_MN, D.VL_TOTAL_FRETE_MN, D.VL_TOTAL_SEG_MN' +
        ', D.PB_CARGA, D.PL_CARGA, D.CD_INCOTERM, ISNULL( D.PC_SEGURO_MLE' +
        ', 0 ) AS PC_SEGURO_MLE,'
      
        '       VTD.NM_VIA_TRANSP, VTP.NM_VIA_TRANSP AS NM_VIA_TRANSPORTE' +
        ','
      '       ( CASE D.CD_VINC_IMPO_EXPO'
      '         WHEN '#39'1'#39' THEN '#39'Sem Vincula'#231#227'o'#39
      '         WHEN '#39'2'#39' THEN '#39'Com Vincula'#231#227'o sem Influ'#234'ncia no Pre'#231'o'#39
      
        '         WHEN '#39'3'#39' THEN '#39'Com Vincula'#231#227'o e com Influ'#234'ncia no Pre'#231'o' +
        #39
      '       END ) CD_VINC_IMPO_EXPO,'
      '       P.CD_VINC_IMPO_EXPO CD_VINC_IMPO_EXPO_PREV,'
      
        '       PA.CD_NCM_SH, A.CD_MERCADORIA_NCM, D.CD_IMPORTADOR, P.CD_' +
        'CLIENTE, P.VL_ACRESCIMO,'
      '       P.VL_DEDUCAO, P.VL_FRETE_INTERNO'
      
        'FROM   TPREVISAO P INNER JOIN TDECLARACAO_IMPORTACAO D ON D.NR_P' +
        'ROCESSO = P.NR_PROCESSO'
      
        '   INNER JOIN TVIA_TRANSP_BROKER VTP ON VTP.CD_VIA_TRANSP = P.CD' +
        '_VIA_TRANSP'
      
        '   INNER JOIN TVIA_TRANSP_BROKER VTD ON VTD.CD_VIA_TRANSP = D.CD' +
        '_VIA_TRANSP_CARG'
      
        '   INNER JOIN TADICAO_DE_IMPORTACAO A ON A.NR_PROCESSO = D.NR_PR' +
        'OCESSO'
      
        '   INNER JOIN TPREVISAO_ADICAO PA ON PA.NR_PROCESSO = P.NR_PROCE' +
        'SSO'
      'WHERE  D.NR_PROCESSO = :NR_PROCESSO')
    Left = 214
    Top = 408
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_previsao_adicao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ADICAO, ROUND( QUANTIDADE, 5 ) AS QT_MERC' +
        'ADORIA, ROUND( PL_MERCADORIA, 5 ) AS PL_MERCADORIA,'
      
        '       ROUND( VL_II, 2 ) AS VL_II, ROUND( VL_IPI, 2 ) AS VL_IPI,' +
        ' ROUND( VL_ICMS, 2 ) AS VL_ICMS, CD_APLICACAO_MERC, CD_VINC_IMPO' +
        '_EXPO,'
      
        '       CD_TRIBUTACAO_ICMS CD_TRIBUTACAO_ICMS_PREV, CD_EXPORTADOR' +
        ' CD_EXPORTADOR_PREV, CD_FABRICANTE CD_FABRICANTE_PREV,'
      
        '       QT_MERC_UN_ALIQ_ES, PC_ALIQ_ICMS, CD_FUND_LEGAL_ICMS, PC_' +
        'ALIQ_ICMS_RED, CD_PAIS_AQUISICAO, CD_NCM_SH, CD_REG_TRIB_II, CD_' +
        'FUND_LEG_REGIME,'
      '       (SELECT DESCRICAO'
      '        FROM TTP_VINC_EXPO_IMPO V'
      
        '        WHERE V.CD_VINC_EXPO_IMPO = PA.CD_VINC_IMPO_EXPO) AS TX_' +
        'VINCULO,'
      '       (CASE PA.CD_APLICACAO_MERC'
      '            WHEN '#39'1'#39' THEN '#39'Consumo'#39
      '            WHEN '#39'2'#39' THEN '#39'Revenda'#39
      '        END) AS TX_APLICACAO,'
      '       PA.CD_INCOTERMS_VENDA,'
      '       CD_CFOP,'
      '       CD_TIPO_ACORDO_TAR,'
      '       PC_ALIQ_ACORDO,'
      '       (SELECT DESCRICAO'
      '        FROM TTP_ACORDO_TARIF T'
      
        '        WHERE T.CD_TIPO_ACORDO_TAR = PA.CD_TIPO_ACORDO_TAR) AS N' +
        'M_TIPO_ACORDO_TAR,'
      
        '       IN_IPI_NAO_TRIBUT, CD_REG_TRIB_IPI, CD_TIPO_BENEF_PIS_COF' +
        'INS, CD_FUND_LEGAL_PISCOFINS,'
      
        '       VL_ALIQUOTA_ESPECIFICA_PIS, VL_ALIQUOTA_ESPECIFICA_COFINS' +
        ', QTD_UNID_ESPECIFICA_PIS,'
      
        '       QTD_UNID_ESPECIFICA_COFINS, CD_UNIDADE_MEDIDA_PIS, CD_UNI' +
        'DADE_MEDIDA_COFINS, ISNULL(IN_FUNDO_POBREZA, '#39'0'#39') AS IN_FUNDO_PO' +
        'BREZA,'
      
        '       ISNULL(QT_MESES_ADM_TEMP, 0) AS QT_MESES_ADM_TEMP, IN_SUS' +
        'PENDE_II_RETIFIC, IN_SUSPENDE_IPI_RETIFIC, IN_SUSPENDE_PIS_COFIN' +
        'S_RETIFIC,'
      '       ALIQ_PIS, ALIQ_COFINS, VL_PIS, VL_COFINS,'
      
        '       PC_NORMAL_ANTIDUMPING, VL_BASE_CALC_ANTIDUMPING, PC_ESPEC' +
        '_ANTIDUMPING, NM_UNID_ESPEC_ANTIDUMPING, QT_UNID_ESPEC_ANTIDUMPI' +
        'NG, CD_PAIS_FABRICANTE,'
      
        '       VL_ICMS_A_RECOLHER_AFRMM, CD_ACORDO_ALADI, ALIQ_PIS_REDUZ' +
        'IDA, ALIQ_COFINS_REDUZIDA'
      'FROM TPREVISAO_ADICAO PA'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND NR_ADICAO   = :NR_ADICAO')
    Left = 283
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_previsao_adicao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_previsao_adicao_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_QT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object qry_previsao_adicao_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qry_previsao_adicao_VL_II: TFloatField
      FieldName = 'VL_II'
    end
    object qry_previsao_adicao_VL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object qry_previsao_adicao_VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object qry_previsao_adicao_CD_TRIBUTACAO_ICMS_PREV: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS_PREV'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_CD_EXPORTADOR_PREV: TStringField
      FieldName = 'CD_EXPORTADOR_PREV'
      FixedChar = True
      Size = 5
    end
    object qry_previsao_adicao_CD_FABRICANTE_PREV: TStringField
      FieldName = 'CD_FABRICANTE_PREV'
      FixedChar = True
      Size = 5
    end
    object qry_previsao_adicao_QT_MERC_UN_ALIQ_ES: TFloatField
      FieldName = 'QT_MERC_UN_ALIQ_ES'
    end
    object qry_previsao_adicao_PC_ALIQ_ICMS: TFloatField
      FieldName = 'PC_ALIQ_ICMS'
    end
    object qry_previsao_adicao_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qry_previsao_adicao_CD_REG_TRIB_II: TStringField
      FieldName = 'CD_REG_TRIB_II'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      FixedChar = True
      Size = 2
    end
    object qry_previsao_adicao_PC_ALIQ_ICMS_RED: TFloatField
      FieldName = 'PC_ALIQ_ICMS_RED'
    end
    object qry_previsao_adicao_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_TX_VINCULO: TStringField
      FieldName = 'TX_VINCULO'
      FixedChar = True
      Size = 50
    end
    object qry_previsao_adicao_TX_APLICACAO: TStringField
      FieldName = 'TX_APLICACAO'
      FixedChar = True
      Size = 7
    end
    object qry_previsao_adicao_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_CD_CFOP: TStringField
      FieldName = 'CD_CFOP'
      FixedChar = True
      Size = 4
    end
    object qry_previsao_adicao_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_PC_ALIQ_ACORDO: TFloatField
      FieldName = 'PC_ALIQ_ACORDO'
    end
    object qry_previsao_adicao_NM_TIPO_ACORDO_TAR: TStringField
      FieldName = 'NM_TIPO_ACORDO_TAR'
      FixedChar = True
    end
    object qry_previsao_adicao_IN_IPI_NAO_TRIBUT: TBooleanField
      FieldName = 'IN_IPI_NAO_TRIBUT'
    end
    object qry_previsao_adicao_CD_REG_TRIB_IPI: TStringField
      FieldName = 'CD_REG_TRIB_IPI'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_CD_TIPO_BENEF_PIS_COFINS: TStringField
      FieldName = 'CD_TIPO_BENEF_PIS_COFINS'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_CD_FUND_LEGAL_PISCOFINS: TStringField
      FieldName = 'CD_FUND_LEGAL_PISCOFINS'
      FixedChar = True
      Size = 2
    end
    object qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_PIS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_PIS'
    end
    object qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_COFINS'
    end
    object qry_previsao_adicao_QTD_UNID_ESPECIFICA_PIS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_PIS'
    end
    object qry_previsao_adicao_QTD_UNID_ESPECIFICA_COFINS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_COFINS'
    end
    object qry_previsao_adicao_CD_UNIDADE_MEDIDA_PIS: TStringField
      FieldName = 'CD_UNIDADE_MEDIDA_PIS'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_CD_UNIDADE_MEDIDA_COFINS: TStringField
      FieldName = 'CD_UNIDADE_MEDIDA_COFINS'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_IN_FUNDO_POBREZA: TStringField
      FieldName = 'IN_FUNDO_POBREZA'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_QT_MESES_ADM_TEMP: TIntegerField
      FieldName = 'QT_MESES_ADM_TEMP'
    end
    object qry_previsao_adicao_IN_SUSPENDE_II_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_II_RETIFIC'
    end
    object qry_previsao_adicao_IN_SUSPENDE_IPI_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_IPI_RETIFIC'
    end
    object qry_previsao_adicao_IN_SUSPENDE_PIS_COFINS_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_PIS_COFINS_RETIFIC'
    end
    object qry_previsao_adicao_ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object qry_previsao_adicao_ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object qry_previsao_adicao_VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object qry_previsao_adicao_VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object qry_previsao_adicao_PC_NORMAL_ANTIDUMPING: TFloatField
      FieldName = 'PC_NORMAL_ANTIDUMPING'
    end
    object qry_previsao_adicao_VL_BASE_CALC_ANTIDUMPING: TFloatField
      FieldName = 'VL_BASE_CALC_ANTIDUMPING'
    end
    object qry_previsao_adicao_PC_ESPEC_ANTIDUMPING: TFloatField
      FieldName = 'PC_ESPEC_ANTIDUMPING'
    end
    object qry_previsao_adicao_NM_UNID_ESPEC_ANTIDUMPING: TStringField
      FieldName = 'NM_UNID_ESPEC_ANTIDUMPING'
      FixedChar = True
      Size = 100
    end
    object qry_previsao_adicao_QT_UNID_ESPEC_ANTIDUMPING: TFloatField
      FieldName = 'QT_UNID_ESPEC_ANTIDUMPING'
    end
    object qry_previsao_adicao_CD_PAIS_FABRICANTE: TStringField
      FieldName = 'CD_PAIS_FABRICANTE'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_VL_ICMS_A_RECOLHER_AFRMM: TFloatField
      FieldName = 'VL_ICMS_A_RECOLHER_AFRMM'
    end
    object qry_previsao_adicao_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_ALIQ_PIS_REDUZIDA: TFloatField
      FieldName = 'ALIQ_PIS_REDUZIDA'
    end
    object qry_previsao_adicao_ALIQ_COFINS_REDUZIDA: TFloatField
      FieldName = 'ALIQ_COFINS_REDUZIDA'
    end
  end
  object qry_adicao_comp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.NR_PROCESSO, A.NR_ADICAO,'
      '       ROUND(A.PL_MERCADORIA, 5) AS PL_MERCADORIA,'
      '       ROUND(ISNULL((SELECT SUM(ISNULL(I.QT_MERC_UN_COMERC, 0))'
      '                     FROM TDETALHE_MERCADORIA I'
      '                     WHERE A.NR_PROCESSO = I.NR_PROCESSO'
      
        '                       AND A.NR_ADICAO   = I.NR_ADICAO), 0), 5) ' +
        'AS QT_MERCADORIA,'
      '       ROUND(ISNULL((SELECT ISNULL(T.VL_IPT_A_RECOLHER, 0)'
      '                     FROM TRIBUTO T'
      '                     WHERE T.NR_PROCESSO = A.NR_PROCESSO'
      '                       AND T.NR_ADICAO   = A.NR_ADICAO'
      
        '                       AND CD_RECEITA_IMPOSTO = '#39'0001'#39'), 0), 2) ' +
        'AS VL_II,'
      '       ROUND(ISNULL((SELECT ISNULL( T.VL_IPT_A_RECOLHER, 0)'
      '                     FROM TRIBUTO T'
      '                     WHERE T.NR_PROCESSO = A.NR_PROCESSO'
      '                       AND T.NR_ADICAO   = A.NR_ADICAO'
      
        '                       AND CD_RECEITA_IMPOSTO = '#39'0002'#39'), 0), 2) ' +
        'AS VL_IPI,'
      '       A.VL_ICMS_A_RECOLHER AS VL_ICMS,'
      
        '       A.CD_TRIBUTACAO_ICMS, A.CD_FORNECEDOR, A.CD_FABRICANTE, A' +
        '.QT_UN_ESTATISTICA, A.CD_NCM_SH, A.CD_REGIME_TRIBUTAR, A.CD_VINC' +
        '_IMPO_EXPO,'
      
        '       A.PC_ICMS, A.PC_REDUCAO_ICMS, A.CD_FUND_LEGAL_ICMS, A.CD_' +
        'APLICACAO_MERC, A.CD_FUND_LEGAL_ICMS, A.CD_PAIS_AQUIS_MERC, A.CD' +
        '_FUND_LEG_REGIME,'
      '       (SELECT V.DESCRICAO'
      '        FROM TTP_VINC_EXPO_IMPO V'
      
        '        WHERE V.CD_VINC_EXPO_IMPO = A.CD_VINC_IMPO_EXPO) AS TX_V' +
        'INCULO,'
      '       (CASE A.CD_APLICACAO_MERC'
      '            WHEN '#39'1'#39' THEN '#39'Consumo'#39
      '            WHEN '#39'2'#39' THEN '#39'Revenda'#39
      '        END) AS TX_APLICACAO,'
      '       A.CD_INCOTERMS_VENDA,'
      '       A.CD_CFOP,'
      '       A.CD_TIPO_ACORDO_TAR,'
      '       (SELECT T.PC_ALIQ_ACOR_TARIF'
      '        FROM TRIBUTO T'
      '        WHERE T.NR_PROCESSO = A.NR_PROCESSO'
      '          AND T.NR_ADICAO = A.NR_ADICAO'
      
        '          AND T.CD_RECEITA_IMPOSTO = '#39'0001'#39') AS PC_ALIQ_ACOR_TAR' +
        'IF,'
      '       (SELECT T.DESCRICAO'
      '        FROM TTP_ACORDO_TARIF T'
      
        '        WHERE T.CD_TIPO_ACORDO_TAR = A.CD_TIPO_ACORDO_TAR) AS NM' +
        '_TIPO_ACORDO_TAR,'
      
        '       A.IN_IPI_NAO_TRIBUT, A.CD_TIPO_BENEF_PIS_COFINS, A.CD_FUN' +
        'D_LEGAL_PISCOFINS,'
      '       (SELECT T.CD_TIPO_BENEF_IPI'
      '        FROM TRIBUTO T'
      '        WHERE T.NR_PROCESSO = A.NR_PROCESSO'
      '          AND T.NR_ADICAO = A.NR_ADICAO'
      
        '          AND T.CD_RECEITA_IMPOSTO = '#39'0002'#39') AS CD_TIPO_BENEF_IP' +
        'I,'
      
        '       A.VL_ALIQUOTA_ESPECIFICA_PIS, A.VL_ALIQUOTA_ESPECIFICA_CO' +
        'FINS, A.QTD_UNID_ESPECIFICA_PIS,'
      
        '       A.QTD_UNID_ESPECIFICA_COFINS, A.CD_UNIDADE_MEDIDA_PIS, A.' +
        'CD_UNIDADE_MEDIDA_COFINS, ISNULL(A.IN_FUNDO_POBREZA, '#39'0'#39') AS IN_' +
        'FUNDO_POBREZA,'
      
        '       ISNULL(A.QT_MESES_ADM_TEMP, 0) AS QT_MESES_ADM_TEMP, A.IN' +
        '_SUSPENDE_II_RETIFIC, A.IN_SUSPENDE_IPI_RETIFIC, A.IN_SUSPENDE_P' +
        'IS_COFINS_RETIFIC,'
      
        '       CASE WHEN A.CD_TIPO_BENEF_PIS_COFINS=3 THEN A.ALIQ_PIS_RE' +
        'DUZIDA ELSE A.ALIQ_PIS END ALIQ_PIS,'
      
        ' CASE WHEN A.CD_TIPO_BENEF_PIS_COFINS=3 THEN A.ALIQ_COFINS_REDUZ' +
        'IDA ELSE A.ALIQ_COFINS END ALIQ_COFINS, A.VL_PIS, A.VL_COFINS, A' +
        '.VL_FRETE_MERC_MN, A.VL_MERC_COND_VENDA, A.VL_MERC_VENDA_MN,'
      
        '       T3.PC_ALIQ_NORM_ADVAL, T3.VL_BASE_CALC_ADVAL, T3.VL_ALIQ_' +
        'ESPEC_IPT, T3.NM_UN_ALIQ_ESP_IPT, T3.QT_MERC_UN_ALIQ_ES, CD_PAIS' +
        '_ORIG_MERC,'
      
        '       VL_ICMS_A_RECOLHER_AFRMM, CD_ACORDO_ALADI, ALIQ_PIS_REDUZ' +
        'IDA, ALIQ_COFINS_REDUZIDA'
      'FROM TADICAO_DE_IMPORTACAO A'
      '   LEFT JOIN TRIBUTO T3 ON T3.NR_PROCESSO = A.NR_PROCESSO'
      '                       AND T3.NR_ADICAO = A.NR_ADICAO'
      '                       AND T3.CD_RECEITA_IMPOSTO = '#39'0003'#39
      'WHERE A.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY A.NR_ADICAO')
    Left = 715
    Top = 33
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_adicao_comp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_adicao_comp_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_comp_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qry_adicao_comp_QT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object qry_adicao_comp_VL_II: TFloatField
      FieldName = 'VL_II'
    end
    object qry_adicao_comp_VL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object qry_adicao_comp_VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object qry_adicao_comp_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_comp_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      FixedChar = True
      Size = 5
    end
    object qry_adicao_comp_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_adicao_comp_QT_UN_ESTATISTICA: TFloatField
      FieldName = 'QT_UN_ESTATISTICA'
    end
    object qry_adicao_comp_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
    end
    object qry_adicao_comp_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_comp_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_comp_CD_FUND_LEGAL_ICMS_1: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS_1'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_comp_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_comp_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      FixedChar = True
      Size = 8
    end
    object qry_adicao_comp_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_comp_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      FixedChar = True
      Size = 2
    end
    object qry_adicao_comp_PC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
    end
    object qry_adicao_comp_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_comp_TX_VINCULO: TStringField
      FieldName = 'TX_VINCULO'
      FixedChar = True
      Size = 50
    end
    object qry_adicao_comp_TX_APLICACAO: TStringField
      FieldName = 'TX_APLICACAO'
      FixedChar = True
      Size = 7
    end
    object qry_adicao_comp_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_comp_CD_CFOP: TStringField
      FieldName = 'CD_CFOP'
      FixedChar = True
      Size = 4
    end
    object qry_adicao_comp_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_comp_PC_ALIQ_ACOR_TARIF: TFloatField
      FieldName = 'PC_ALIQ_ACOR_TARIF'
    end
    object qry_adicao_comp_NM_TIPO_ACORDO_TAR: TStringField
      FieldName = 'NM_TIPO_ACORDO_TAR'
      FixedChar = True
    end
    object qry_adicao_comp_IN_IPI_NAO_TRIBUT: TBooleanField
      FieldName = 'IN_IPI_NAO_TRIBUT'
    end
    object qry_adicao_comp_CD_TIPO_BENEF_PIS_COFINS: TStringField
      FieldName = 'CD_TIPO_BENEF_PIS_COFINS'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_comp_CD_FUND_LEGAL_PISCOFINS: TStringField
      FieldName = 'CD_FUND_LEGAL_PISCOFINS'
      FixedChar = True
      Size = 2
    end
    object qry_adicao_comp_CD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_comp_VL_ALIQUOTA_ESPECIFICA_PIS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_PIS'
    end
    object qry_adicao_comp_VL_ALIQUOTA_ESPECIFICA_COFINS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_COFINS'
    end
    object qry_adicao_comp_QTD_UNID_ESPECIFICA_PIS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_PIS'
    end
    object qry_adicao_comp_QTD_UNID_ESPECIFICA_COFINS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_COFINS'
    end
    object qry_adicao_comp_CD_UNIDADE_MEDIDA_PIS: TStringField
      FieldName = 'CD_UNIDADE_MEDIDA_PIS'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_comp_CD_UNIDADE_MEDIDA_COFINS: TStringField
      FieldName = 'CD_UNIDADE_MEDIDA_COFINS'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_comp_IN_FUNDO_POBREZA: TStringField
      FieldName = 'IN_FUNDO_POBREZA'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_comp_QT_MESES_ADM_TEMP: TIntegerField
      FieldName = 'QT_MESES_ADM_TEMP'
    end
    object qry_adicao_comp_IN_SUSPENDE_II_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_II_RETIFIC'
    end
    object qry_adicao_comp_IN_SUSPENDE_IPI_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_IPI_RETIFIC'
    end
    object qry_adicao_comp_IN_SUSPENDE_PIS_COFINS_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_PIS_COFINS_RETIFIC'
    end
    object qry_adicao_comp_ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object qry_adicao_comp_ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object qry_adicao_comp_VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object qry_adicao_comp_VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object qry_adicao_comp_VL_FRETE_MERC_MN: TFloatField
      FieldName = 'VL_FRETE_MERC_MN'
    end
    object qry_adicao_comp_VL_MERC_COND_VENDA: TFloatField
      FieldName = 'VL_MERC_COND_VENDA'
    end
    object qry_adicao_comp_VL_MERC_VENDA_MN: TFloatField
      FieldName = 'VL_MERC_VENDA_MN'
    end
    object qry_adicao_comp_PC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
    end
    object qry_adicao_comp_VL_BASE_CALC_ADVAL: TFloatField
      FieldName = 'VL_BASE_CALC_ADVAL'
    end
    object qry_adicao_comp_VL_ALIQ_ESPEC_IPT: TFloatField
      FieldName = 'VL_ALIQ_ESPEC_IPT'
    end
    object qry_adicao_comp_NM_UN_ALIQ_ESP_IPT: TStringField
      FieldName = 'NM_UN_ALIQ_ESP_IPT'
      FixedChar = True
      Size = 15
    end
    object qry_adicao_comp_QT_MERC_UN_ALIQ_ES: TFloatField
      FieldName = 'QT_MERC_UN_ALIQ_ES'
    end
    object qry_adicao_comp_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_comp_VL_ICMS_A_RECOLHER_AFRMM: TFloatField
      FieldName = 'VL_ICMS_A_RECOLHER_AFRMM'
    end
    object qry_adicao_comp_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_comp_ALIQ_PIS_REDUZIDA: TFloatField
      FieldName = 'ALIQ_PIS_REDUZIDA'
    end
    object qry_adicao_comp_ALIQ_COFINS_REDUZIDA: TFloatField
      FieldName = 'ALIQ_COFINS_REDUZIDA'
    end
  end
  object qry_mercadoria: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select CD_EXPORTADOR,CD_NCM_SH,'
      ' CD_TRIBUTACAO_ICMS, PC_ICMS, CD_FUND_LEGAL_ICMS, IN_ALIQ_DIF,'
      
        '        CD_REG_TRIB_PIS_COFINS, CD_FUND_LEG_PIS_COFINS, IN_ALIQ_' +
        'DIF_PIS,'
      
        '        IN_ALIQ_DIF_COFINS, PC_PIS, PC_COFINS, IN_ANTIDUMPING, P' +
        'C_REDUCAO_ICMS'
      'from TMERCADORIA'
      'where CD_MERCADORIA =:CD_MERCADORIA')
    Left = 416
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptInput
      end>
    object qry_mercadoriaCD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      Origin = 'DBBROKER.TMERCADORIA.CD_TRIBUTACAO_ICMS'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoriaPC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      Origin = 'DBBROKER.TMERCADORIA.PC_ICMS'
    end
    object qry_mercadoriaCD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      Origin = 'DBBROKER.TMERCADORIA.CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_mercadoriaIN_ALIQ_DIF: TStringField
      FieldName = 'IN_ALIQ_DIF'
      Origin = 'DBBROKER.TMERCADORIA.IN_ALIQ_DIF'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoriaCD_REG_TRIB_PIS_COFINS: TStringField
      FieldName = 'CD_REG_TRIB_PIS_COFINS'
      Origin = 'DBBROKER.TMERCADORIA.CD_REG_TRIB_PIS_COFINS'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoriaCD_FUND_LEG_PIS_COFINS: TStringField
      FieldName = 'CD_FUND_LEG_PIS_COFINS'
      Origin = 'DBBROKER.TMERCADORIA.CD_FUND_LEG_PIS_COFINS'
      FixedChar = True
      Size = 2
    end
    object qry_mercadoriaIN_ALIQ_DIF_PIS: TStringField
      FieldName = 'IN_ALIQ_DIF_PIS'
      Origin = 'DBBROKER.TMERCADORIA.IN_ALIQ_DIF_PIS'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoriaIN_ALIQ_DIF_COFINS: TStringField
      FieldName = 'IN_ALIQ_DIF_COFINS'
      Origin = 'DBBROKER.TMERCADORIA.IN_ALIQ_DIF_COFINS'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoriaPC_PIS: TFloatField
      FieldName = 'PC_PIS'
      Origin = 'DBBROKER.TMERCADORIA.PC_PIS'
    end
    object qry_mercadoriaPC_COFINS: TFloatField
      FieldName = 'PC_COFINS'
      Origin = 'DBBROKER.TMERCADORIA.PC_COFINS'
    end
    object qry_mercadoriaIN_ANTIDUMPING: TStringField
      FieldName = 'IN_ANTIDUMPING'
      Origin = 'DBBROKER.TMERCADORIA.IN_ANTIDUMPING'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoriaCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Size = 8
    end
    object qry_mercadoriaCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
    end
    object qry_mercadoriaPC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
    end
  end
  object qry_aliq_uf: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select VL_ALIQ_ICMS'
      'from TUF'
      'where'
      '  CD_UF = ( select END_UF'
      #9'          from TEMPRESA_NAC'
      #9'          where CD_EMPRESA =:CD_EMPRESA) and'
      '  CD_VIA_TRANSPORTE = ( select CD_VIA_TRANSPORTE'
      '                        from TSERVICO'
      '                        where CD_SERVICO = ( select CD_SERVICO'
      '                                             from   TPROCESSO'
      
        '                                             where  nr_processo ' +
        '=:NR_PROCESSO) )')
    Left = 488
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object SqlAux: TQuery
    DatabaseName = 'DBBROKER'
    Left = 344
    Top = 376
  end
  object qry_ExcecoesAdicao: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select ISNULL(VL_ALIQ_ICMS,0) VL_ALIQ_ICMS, SCRIPT_SELECT, RESUL' +
        'T_SELECT, DESC_EXCECAO, ISNULL(CD_REGIME_TRIB,'#39#39') CD_REGIME_TRIB' +
        ',CD_DISPOSITIVO_LEGAL'
      'from TUF_EXCECOES'
      
        'where IN_CONTEMPLA_ADICAO = '#39'1'#39' and (CD_UF =:CD_UF) or CD_UF = '#39 +
        'XY'#39
      'order by CD_PRIORIDADE')
    Left = 86
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_UF'
        ParamType = ptUnknown
      end>
  end
  object qry_DI_Volumes: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select A.*, B.DESCRICAO from TEMBALAGEM_CARGA A,  TTP_EMBALAGEM ' +
        'B'
      'where'
      '  A.NR_PROCESSO =:NR_PROCESSO and'
      '  B.CODIGO = A.CD_TIPO_EMBALAGEM'
      '')
    Left = 46
    Top = 589
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_Previsao_Volumes: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select A.*, B.DESCRICAO from TPREVISAO_EMBALAGEM_CARGA A,  TTP_E' +
        'MBALAGEM B'
      'where'
      '  A.NR_PROCESSO =:NR_PROCESSO and'
      '  A.CD_TIPO_EMBALAGEM =:CD_TIPO_EMBALAGEM and'
      '  B.CODIGO = A.CD_TIPO_EMBALAGEM')
    Left = 175
    Top = 589
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_EMBALAGEM'
        ParamType = ptUnknown
      end>
  end
  object sp_atz_tipo_icms: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_tipo_icms'
    Left = 369
    Top = 584
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
        Size = 18
      end>
  end
  object qryImpostosNaoPagos: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM MYMONEY.DBO.FN_IMPOSTOS_NAO_RECEBIDOS(:NR_PROCESSO)')
    Left = 256
    Top = 496
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryImpostosNaoPagosCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryImpostosNaoPagosNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 100
    end
    object qryImpostosNaoPagosVL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
  end
  object qry_Trans_DI_Web: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM DBO.FN_TRANS_DI(:NR_PROCESSO, :CD_MOTIVO_TRANS)'
      'ORDER BY NR_LINHA')
    Left = 496
    Top = 584
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_MOTIVO_TRANS'
        ParamType = ptInput
      end>
    object qry_Trans_DI_WebNR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qry_Trans_DI_WebNR_LINHA: TAutoIncField
      FieldName = 'NR_LINHA'
    end
    object qry_Trans_DI_WebCD_TIPO_LINHA: TStringField
      FieldName = 'CD_TIPO_LINHA'
      FixedChar = True
      Size = 2
    end
    object qry_Trans_DI_WebTX_LINHA: TMemoField
      FieldName = 'TX_LINHA'
      BlobType = ftMemo
    end
  end
  object qry_DE_DI: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TDECLARACAO_IMPORTACAO_DE'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 760
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_DE_DINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO_DE.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_DE_DINR_DE_MERCOSUL: TStringField
      FieldName = 'NR_DE_MERCOSUL'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO_DE.NR_DE_MERCOSUL'
      FixedChar = True
      Size = 16
    end
    object qry_DE_DINR_RE_INICIAL: TStringField
      FieldName = 'NR_RE_INICIAL'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO_DE.NR_RE_INICIAL'
      FixedChar = True
      Size = 4
    end
    object qry_DE_DINR_RE_FINAL: TStringField
      FieldName = 'NR_RE_FINAL'
      Origin = 'DBBROKER.TDECLARACAO_IMPORTACAO_DE.NR_RE_FINAL'
      FixedChar = True
      Size = 4
    end
  end
  object qry_DE_DI_Scx: TQuery
    DatabaseName = 'IMPORT'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM DE_MERCOSUL_DI'
      'WHERE NR_DECL_IMP_MICRO = :NR_DECL_IMP_MICRO')
    Left = 764
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_DECL_IMP_MICRO'
        ParamType = ptInput
      end>
    object qry_DE_DI_ScxNR_DECL_IMP_MICRO: TStringField
      FieldName = 'NR_DECL_IMP_MICRO'
      Origin = 'IMPORT.DE_MERCOSUL_DI.NR_DECL_IMP_MICRO'
      Size = 8
    end
    object qry_DE_DI_ScxNR_SEQ_DE: TSmallintField
      FieldName = 'NR_SEQ_DE'
      Origin = 'IMPORT.DE_MERCOSUL_DI.NR_SEQ_DE'
    end
    object qry_DE_DI_ScxNR_DE_MERCOSUL: TStringField
      FieldName = 'NR_DE_MERCOSUL'
      Origin = 'IMPORT.DE_MERCOSUL_DI.NR_DE_MERCOSUL'
      Size = 16
    end
    object qry_DE_DI_ScxNR_RE_INICIAL: TStringField
      FieldName = 'NR_RE_INICIAL'
      Origin = 'IMPORT.DE_MERCOSUL_DI.NR_RE_INICIAL'
      Size = 4
    end
    object qry_DE_DI_ScxNR_RE_FINAL: TStringField
      FieldName = 'NR_RE_FINAL'
      Origin = 'IMPORT.DE_MERCOSUL_DI.NR_RE_FINAL'
      Size = 4
    end
  end
  object qryVolumeProcesso: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.NR_PROCESSO,'
      '       '#39'BAU DE METAL'#39' AS DESCRICAO,'
      '       C.CODIGO           AS CD_TIPO_EMBALAGEM,'
      '        COUNT(*)      AS QT_VOLUME_CARGA'
      'FROM TPROCESSO       A  (NOLOCK)'
      
        'JOIN TPROCESSO_CNTR  B  (NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESS' +
        'O'
      'JOIN TTP_EMBALAGEM   C  (NOLOCK) ON C.CODIGO      = '#39'08'#39
      ' WHERE A.NR_PROCESSO = :NR_PROCESSO'
      '   AND C.CODIGO      = :CD_TIPO_EMBALAGEM'
      ' GROUP BY A.NR_PROCESSO, C.CODIGO'
      ''
      'UNION ALL'
      ''
      'SELECT A.NR_PROCESSO, '
      '       B.NM_ESPECIE   AS DESCRICAO,'
      '       B.TP_ESTUFAGEM AS CD_TIPO_EMBALAGEM,'
      '       SUM(B.VL_QTDE) AS QT_VOLUME_CARGA'
      'FROM TPROCESSO             A(NOLOCK)'
      
        'JOIN TPROCESSO_CARGA_SOLTA B (NOLOCK) ON B.NR_PROCESSO = A.NR_PR' +
        'OCESSO'
      ' WHERE A.NR_PROCESSO  = :NR_PROCESSO_1'
      '   AND B.TP_ESTUFAGEM = :CD_TIPO_EMBALAGEM_1'
      ' GROUP BY A.NR_PROCESSO, B.NM_ESPECIE, B.TP_ESTUFAGEM ')
    Left = 262
    Top = 587
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'CD_TIPO_EMBALAGEM'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'nr_processo_1'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'CD_TIPO_EMBALAGEM_1'
        ParamType = ptInput
        Size = 2
      end>
  end
end
