object datm_di_rec_diag: Tdatm_di_rec_diag
  OldCreateOrder = True
  Left = 198
  Top = 129
  Height = 450
  Width = 541
  object IMPORT: TDatabase
    AliasName = 'DBImport'
    DatabaseName = 'IMPORT'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 32
    Top = 8
  end
  object QR_CapaDI: TQuery
    OnCalcFields = QR_CapaDICalcFields
    DatabaseName = 'IMPORT'
    SQL.Strings = (
      
        'SELECT *, IIF(ISNUMERIC(LEFT(NR_IDENT_USUARIO, 4)), NR_IDENT_USU' +
        'ARIO, '#39'0'#39' & LEFT(NR_IDENT_USUARIO, 1) & '#39'0'#39' & MID(NR_IDENT_USUAR' +
        'IO, 2, 14)) AS calcNR_IDENT_USUARIO'
      'FROM DECLARA'#199#195'O_IMPORTA'#199#195'O')
    Left = 120
    Top = 8
    object QR_CapaDINR_DECL_IMP_MICRO: TStringField
      FieldName = 'NR_DECL_IMP_MICRO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_DECL_IMP_MICRO'
      Size = 8
    end
    object QR_CapaDINR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_IDENT_USUARIO'
      Size = 15
    end
    object QR_CapaDINR_DECL_IMP_PROT: TStringField
      FieldName = 'NR_DECL_IMP_PROT'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_DECL_IMP_PROT'
      Size = 10
    end
    object QR_CapaDINR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_DECLARACAO_IMP'
      EditMask = '99/9999999-9;0;_'
      Size = 10
    end
    object QR_CapaDIDT_PROCESSAMENTO: TStringField
      FieldName = 'DT_PROCESSAMENTO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.DT_PROCESSAMENTO'
      Size = 8
    end
    object QR_CapaDIDT_TRANSMISSAO: TStringField
      FieldName = 'DT_TRANSMISSAO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.DT_TRANSMISSAO'
      EditMask = '!99/99/9999;0;_'
      Size = 8
    end
    object QR_CapaDIDT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.DT_REGISTRO_DI'
      EditMask = '!99/99/9999;0;_'
      Size = 8
    end
    object QR_CapaDICD_TIPO_DECLARACAO: TStringField
      FieldName = 'CD_TIPO_DECLARACAO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_DECLARACAO'
      Size = 2
    end
    object QR_CapaDICD_MOTIVO_TRANS: TStringField
      FieldName = 'CD_MOTIVO_TRANS'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MOTIVO_TRANS'
      Size = 1
    end
    object QR_CapaDICD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object QR_CapaDINR_IMPORTADOR: TStringField
      FieldName = 'NR_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_IMPORTADOR'
      Size = 14
    end
    object QR_CapaDICD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object QR_CapaDINM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NM_IMPORTADOR'
      Size = 60
    end
    object QR_CapaDINR_TEL_IMPORTADOR: TStringField
      FieldName = 'NR_TEL_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_TEL_IMPORTADOR'
      Size = 15
    end
    object QR_CapaDIED_LOGR_IMPORTADOR: TStringField
      FieldName = 'ED_LOGR_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_LOGR_IMPORTADOR'
      Size = 40
    end
    object QR_CapaDIED_NR_IMPORTADOR: TStringField
      FieldName = 'ED_NR_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_NR_IMPORTADOR'
      Size = 6
    end
    object QR_CapaDIED_COMPL_IMPO: TStringField
      FieldName = 'ED_COMPL_IMPO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_COMPL_IMPO'
      Size = 21
    end
    object QR_CapaDIED_BA_IMPORTADOR: TStringField
      FieldName = 'ED_BA_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_BA_IMPORTADOR'
      Size = 25
    end
    object QR_CapaDIED_MUN_IMPORTADOR: TStringField
      FieldName = 'ED_MUN_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_MUN_IMPORTADOR'
      Size = 25
    end
    object QR_CapaDIED_UF_IMPORTADOR: TStringField
      FieldName = 'ED_UF_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_UF_IMPORTADOR'
      Size = 2
    end
    object QR_CapaDIED_CEP_IMPORTADOR: TStringField
      FieldName = 'ED_CEP_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_CEP_IMPORTADOR'
      Size = 8
    end
    object QR_CapaDINR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object QR_CapaDICD_MODALIDADE_DESP: TStringField
      FieldName = 'CD_MODALIDADE_DESP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MODALIDADE_DESP'
      Size = 1
    end
    object QR_CapaDIIN_OPERACAO_FUNDAP: TBooleanField
      FieldName = 'IN_OPERACAO_FUNDAP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.IN_OPERACAO_FUNDAP'
    end
    object QR_CapaDICD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_URF_ENTR_CARGA'
      Size = 7
    end
    object QR_CapaDICD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_URF_DESPACHO'
      Size = 7
    end
    object QR_CapaDICD_TIPO_CONSIG: TStringField
      FieldName = 'CD_TIPO_CONSIG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_CONSIG'
      Size = 1
    end
    object QR_CapaDINR_CONSIGNATARIO: TStringField
      FieldName = 'NR_CONSIGNATARIO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_CONSIGNATARIO'
      Size = 14
    end
    object QR_CapaDINM_CONSIGNATARIO: TStringField
      FieldName = 'NM_CONSIGNATARIO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NM_CONSIGNATARIO'
      Size = 60
    end
    object QR_CapaDICD_PAIS_PROC_CARGA: TStringField
      FieldName = 'CD_PAIS_PROC_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_PAIS_PROC_CARGA'
      Size = 3
    end
    object QR_CapaDICD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_VIA_TRANSP_CARG'
      Size = 2
    end
    object QR_CapaDIIN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.IN_MULTIMODAL'
    end
    object QR_CapaDINR_VEICULO_TRANSP: TStringField
      FieldName = 'NR_VEICULO_TRANSP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_VEICULO_TRANSP'
      Size = 15
    end
    object QR_CapaDINM_VEICULO_TRANSP: TStringField
      FieldName = 'NM_VEICULO_TRANSP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NM_VEICULO_TRANSP'
      Size = 30
    end
    object QR_CapaDINM_TRANSPORTADOR: TStringField
      FieldName = 'NM_TRANSPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NM_TRANSPORTADOR'
      Size = 60
    end
    object QR_CapaDICD_BANDEIRA_TRANSP: TStringField
      FieldName = 'CD_BANDEIRA_TRANSP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_BANDEIRA_TRANSP'
      Size = 3
    end
    object QR_CapaDICD_TIPO_AG_CARGA: TStringField
      FieldName = 'CD_TIPO_AG_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_AG_CARGA'
      Size = 1
    end
    object QR_CapaDINR_AGENTE_CARGA: TStringField
      FieldName = 'NR_AGENTE_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_AGENTE_CARGA'
      Size = 14
    end
    object QR_CapaDICD_TIPO_DCTO_CARGA: TStringField
      FieldName = 'CD_TIPO_DCTO_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_DCTO_CARGA'
      Size = 2
    end
    object QR_CapaDINR_DCTO_CARGA: TStringField
      FieldName = 'NR_DCTO_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_DCTO_CARGA'
      Size = 18
    end
    object QR_CapaDINR_DCTO_CARGA_MAST: TStringField
      FieldName = 'NR_DCTO_CARGA_MAST'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_DCTO_CARGA_MAST'
      Size = 18
    end
    object QR_CapaDINM_LOCAL_EMBARQUE: TStringField
      FieldName = 'NM_LOCAL_EMBARQUE'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NM_LOCAL_EMBARQUE'
      Size = 50
    end
    object QR_CapaDIDT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.DT_EMBARQUE'
      Size = 8
    end
    object QR_CapaDICD_UTIL_DCTO_CARGA: TStringField
      FieldName = 'CD_UTIL_DCTO_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_UTIL_DCTO_CARGA'
      Size = 1
    end
    object QR_CapaDIPB_CARGA: TStringField
      FieldName = 'PB_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.PB_CARGA'
      Size = 15
    end
    object QR_CapaDIPL_CARGA: TStringField
      FieldName = 'PL_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.PL_CARGA'
      Size = 15
    end
    object QR_CapaDIDT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.DT_CHEGADA_CARGA'
      Size = 8
    end
    object QR_CapaDICD_TIPO_MANIFESTO: TStringField
      FieldName = 'CD_TIPO_MANIFESTO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_MANIFESTO'
      Size = 1
    end
    object QR_CapaDINR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_MANIFESTO'
      Size = 15
    end
    object QR_CapaDICD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_RECINTO_ALFAND'
      Size = 7
    end
    object QR_CapaDICD_SETOR_ARMAZENAM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAM'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_SETOR_ARMAZENAM'
      Size = 3
    end
    object QR_CapaDICD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MOEDA_FRETE'
      Size = 3
    end
    object QR_CapaDIVL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_FRT_PREPAID'
    end
    object QR_CapaDIVL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_FRT_COLLECT'
    end
    object QR_CapaDIVL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_FRETE_TNAC_MNEG'
    end
    object QR_CapaDIVL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOTAL_FRETE_MN'
    end
    object QR_CapaDICD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MOEDA_SEGURO'
      Size = 3
    end
    object QR_CapaDIVL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_SEGURO_MNEG'
    end
    object QR_CapaDIVL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOTAL_SEG_MN'
    end
    object QR_CapaDICD_MOEDA_DESPESAS: TStringField
      FieldName = 'CD_MOEDA_DESPESAS'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MOEDA_DESPESAS'
      Size = 3
    end
    object QR_CapaDIVL_TOT_DESPS_MNEG: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_DESPS_MNEG'
    end
    object QR_CapaDIVL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_DESPS_MN'
    end
    object QR_CapaDICD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MOEDA_MLE'
      Size = 3
    end
    object QR_CapaDIVL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_MLE_MNEG'
    end
    object QR_CapaDIVL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOTAL_MLE_MN'
    end
    object QR_CapaDIIN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.IN_MOEDA_UNICA'
    end
    object QR_CapaDITX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.TX_INFO_COMPL'
      BlobType = ftMemo
      Size = 1
    end
    object QR_CapaDICD_TIPO_PGTO_TRIB: TStringField
      FieldName = 'CD_TIPO_PGTO_TRIB'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_PGTO_TRIB'
      Size = 1
    end
    object QR_CapaDINR_CONTA_PGTO_TRIB: TStringField
      FieldName = 'NR_CONTA_PGTO_TRIB'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_CONTA_PGTO_TRIB'
      Size = 19
    end
    object QR_CapaDIcalcNR_IDENT_USUARIO: TStringField
      FieldName = 'calcNR_IDENT_USUARIO'
      Size = 255
    end
  end
  object qry_di_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_PROCESSO_SISCOMEX, NR_DECL_IMP_PROT, DT_T' +
        'RANSMISSAO,'
      '       NR_DECLARACAO_IMP, DT_REGISTRO_DI'
      'FROM   TDECLARACAO_IMPORTACAO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 206
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object ds_grd_di: TDataSource
    DataSet = QR_CapaDI
    Left = 120
    Top = 64
  end
  object QR_Diag_DI: TQuery
    DatabaseName = 'IMPORT'
    SQL.Strings = (
      'SELECT *'
      'FROM   DIAGN'#211'STICO_ERROS'
      'WHERE  NR_DECL_IMP_PROT = :NR_DECL_IMP_PROT')
    Left = 302
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_DECL_IMP_PROT'
        ParamType = ptUnknown
      end>
  end
  object sp_atz_evento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_evento'
    Left = 416
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 1
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_evento_txt'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_realizacao'
        ParamType = ptInput
      end>
  end
  object qry_processo_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, NR_DI, ' +
        'NR_DA, CD_SERVICO, CD_STATUS_SDA'
      'FROM   TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 302
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 302
    Top = 128
  end
  object sp_di_distribui_deb_com: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_distribui_deb_com'
    Left = 416
    Top = 64
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
  object Query1: TQuery
    DatabaseName = 'IMPORT'
    SQL.Strings = (
      'SELECT *'
      'FROM DECLARA'#199#195'O_IMPORTA'#199#195'O')
    Left = 120
    Top = 136
    object Query1NR_DECL_IMP_MICRO: TStringField
      FieldName = 'NR_DECL_IMP_MICRO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_DECL_IMP_MICRO'
      Size = 8
    end
    object Query1NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_IDENT_USUARIO'
      Size = 15
    end
    object Query1NR_DECL_IMP_PROT: TStringField
      FieldName = 'NR_DECL_IMP_PROT'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_DECL_IMP_PROT'
      Size = 10
    end
    object Query1NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_DECLARACAO_IMP'
      Size = 10
    end
    object Query1DT_PROCESSAMENTO: TStringField
      FieldName = 'DT_PROCESSAMENTO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.DT_PROCESSAMENTO'
      Size = 8
    end
    object Query1DT_TRANSMISSAO: TStringField
      FieldName = 'DT_TRANSMISSAO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.DT_TRANSMISSAO'
      Size = 8
    end
    object Query1DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.DT_REGISTRO_DI'
      Size = 8
    end
    object Query1CD_TIPO_DECLARACAO: TStringField
      FieldName = 'CD_TIPO_DECLARACAO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_DECLARACAO'
      Size = 2
    end
    object Query1CD_MOTIVO_TRANS: TStringField
      FieldName = 'CD_MOTIVO_TRANS'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MOTIVO_TRANS'
      Size = 1
    end
    object Query1CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object Query1NR_IMPORTADOR: TStringField
      FieldName = 'NR_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_IMPORTADOR'
      Size = 14
    end
    object Query1CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object Query1NM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NM_IMPORTADOR'
      Size = 60
    end
    object Query1NR_TEL_IMPORTADOR: TStringField
      FieldName = 'NR_TEL_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_TEL_IMPORTADOR'
      Size = 15
    end
    object Query1ED_LOGR_IMPORTADOR: TStringField
      FieldName = 'ED_LOGR_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_LOGR_IMPORTADOR'
      Size = 40
    end
    object Query1ED_NR_IMPORTADOR: TStringField
      FieldName = 'ED_NR_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_NR_IMPORTADOR'
      Size = 6
    end
    object Query1ED_COMPL_IMPO: TStringField
      FieldName = 'ED_COMPL_IMPO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_COMPL_IMPO'
      Size = 21
    end
    object Query1ED_BA_IMPORTADOR: TStringField
      FieldName = 'ED_BA_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_BA_IMPORTADOR'
      Size = 25
    end
    object Query1ED_MUN_IMPORTADOR: TStringField
      FieldName = 'ED_MUN_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_MUN_IMPORTADOR'
      Size = 25
    end
    object Query1ED_UF_IMPORTADOR: TStringField
      FieldName = 'ED_UF_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_UF_IMPORTADOR'
      Size = 2
    end
    object Query1ED_CEP_IMPORTADOR: TStringField
      FieldName = 'ED_CEP_IMPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.ED_CEP_IMPORTADOR'
      Size = 8
    end
    object Query1NR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object Query1CD_MODALIDADE_DESP: TStringField
      FieldName = 'CD_MODALIDADE_DESP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MODALIDADE_DESP'
      Size = 1
    end
    object Query1IN_OPERACAO_FUNDAP: TBooleanField
      FieldName = 'IN_OPERACAO_FUNDAP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.IN_OPERACAO_FUNDAP'
    end
    object Query1CD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_URF_ENTR_CARGA'
      Size = 7
    end
    object Query1CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_URF_DESPACHO'
      Size = 7
    end
    object Query1CD_TIPO_CONSIG: TStringField
      FieldName = 'CD_TIPO_CONSIG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_CONSIG'
      Size = 1
    end
    object Query1NR_CONSIGNATARIO: TStringField
      FieldName = 'NR_CONSIGNATARIO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_CONSIGNATARIO'
      Size = 14
    end
    object Query1NM_CONSIGNATARIO: TStringField
      FieldName = 'NM_CONSIGNATARIO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NM_CONSIGNATARIO'
      Size = 60
    end
    object Query1CD_PAIS_PROC_CARGA: TStringField
      FieldName = 'CD_PAIS_PROC_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_PAIS_PROC_CARGA'
      Size = 3
    end
    object Query1CD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_VIA_TRANSP_CARG'
      Size = 2
    end
    object Query1IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.IN_MULTIMODAL'
    end
    object Query1NR_VEICULO_TRANSP: TStringField
      FieldName = 'NR_VEICULO_TRANSP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_VEICULO_TRANSP'
      Size = 15
    end
    object Query1NM_VEICULO_TRANSP: TStringField
      FieldName = 'NM_VEICULO_TRANSP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NM_VEICULO_TRANSP'
      Size = 30
    end
    object Query1NM_TRANSPORTADOR: TStringField
      FieldName = 'NM_TRANSPORTADOR'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NM_TRANSPORTADOR'
      Size = 60
    end
    object Query1CD_BANDEIRA_TRANSP: TStringField
      FieldName = 'CD_BANDEIRA_TRANSP'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_BANDEIRA_TRANSP'
      Size = 3
    end
    object Query1CD_TIPO_AG_CARGA: TStringField
      FieldName = 'CD_TIPO_AG_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_AG_CARGA'
      Size = 1
    end
    object Query1NR_AGENTE_CARGA: TStringField
      FieldName = 'NR_AGENTE_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_AGENTE_CARGA'
      Size = 14
    end
    object Query1CD_TIPO_DCTO_CARGA: TStringField
      FieldName = 'CD_TIPO_DCTO_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_DCTO_CARGA'
      Size = 2
    end
    object Query1NR_DCTO_CARGA: TStringField
      FieldName = 'NR_DCTO_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_DCTO_CARGA'
      Size = 18
    end
    object Query1NR_DCTO_CARGA_MAST: TStringField
      FieldName = 'NR_DCTO_CARGA_MAST'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_DCTO_CARGA_MAST'
      Size = 18
    end
    object Query1NM_LOCAL_EMBARQUE: TStringField
      FieldName = 'NM_LOCAL_EMBARQUE'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NM_LOCAL_EMBARQUE'
      Size = 50
    end
    object Query1DT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.DT_EMBARQUE'
      Size = 8
    end
    object Query1CD_UTIL_DCTO_CARGA: TStringField
      FieldName = 'CD_UTIL_DCTO_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_UTIL_DCTO_CARGA'
      Size = 1
    end
    object Query1PB_CARGA: TStringField
      FieldName = 'PB_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.PB_CARGA'
      Size = 15
    end
    object Query1PL_CARGA: TStringField
      FieldName = 'PL_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.PL_CARGA'
      Size = 15
    end
    object Query1DT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.DT_CHEGADA_CARGA'
      Size = 8
    end
    object Query1CD_TIPO_MANIFESTO: TStringField
      FieldName = 'CD_TIPO_MANIFESTO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_MANIFESTO'
      Size = 1
    end
    object Query1NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_MANIFESTO'
      Size = 15
    end
    object Query1CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_RECINTO_ALFAND'
      Size = 7
    end
    object Query1CD_SETOR_ARMAZENAM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAM'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_SETOR_ARMAZENAM'
      Size = 3
    end
    object Query1CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MOEDA_FRETE'
      Size = 3
    end
    object Query1VL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_FRT_PREPAID'
    end
    object Query1VL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_FRT_COLLECT'
    end
    object Query1VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_FRETE_TNAC_MNEG'
    end
    object Query1VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOTAL_FRETE_MN'
    end
    object Query1CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MOEDA_SEGURO'
      Size = 3
    end
    object Query1VL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_SEGURO_MNEG'
    end
    object Query1VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOTAL_SEG_MN'
    end
    object Query1CD_MOEDA_DESPESAS: TStringField
      FieldName = 'CD_MOEDA_DESPESAS'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MOEDA_DESPESAS'
      Size = 3
    end
    object Query1VL_TOT_DESPS_MNEG: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_DESPS_MNEG'
    end
    object Query1VL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_DESPS_MN'
    end
    object Query1CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_MOEDA_MLE'
      Size = 3
    end
    object Query1VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOT_MLE_MNEG'
    end
    object Query1VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.VL_TOTAL_MLE_MN'
    end
    object Query1IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.IN_MOEDA_UNICA'
    end
    object Query1TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.TX_INFO_COMPL'
      BlobType = ftMemo
      Size = 1
    end
    object Query1CD_TIPO_PGTO_TRIB: TStringField
      FieldName = 'CD_TIPO_PGTO_TRIB'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.CD_TIPO_PGTO_TRIB'
      Size = 1
    end
    object Query1NR_CONTA_PGTO_TRIB: TStringField
      FieldName = 'NR_CONTA_PGTO_TRIB'
      Origin = 'DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_CONTA_PGTO_TRIB'
      Size = 19
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 120
    Top = 200
  end
  object qry_cliente_servico_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, IN_INCID' +
        'E_SDA'
      'FROM   TCLIENTE_SERVICO'
      'WHERE  CD_CLIENTE  = :CD_CLIENTE  AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO  = :CD_PRODUTO  AND'
      '       CD_SERVICO  = :CD_SERVICO')
    Left = 203
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
  end
  object sp_distribui_sda: TStoredProc
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    StoredProcName = 'dbo.sp_distribui_sda'
    Left = 416
    Top = 127
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
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end>
  end
end
