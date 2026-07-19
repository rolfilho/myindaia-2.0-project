object dtmMyParametrizacaoLI: TdtmMyParametrizacaoLI
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 289
  Width = 724
  object DbConnection: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXMSSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
        'iver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMSSQLDriver,Version=15.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMSSQL'
      'LibraryName=dbxmss.dll'
      'VendorLib=sqlncli10.dll'
      'MaxBlobSize=-1'
      'OSAuthentication=False'
      'PrepareSQL=True'
      'SchemaOverride=sa.dbo'
      'DriverName=MSSQL'
      'HostName=INDAIA10'
      'Database=BROKER'
      'User_Name=SA'
      'Password=123'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OS Authentication=False'
      'Prepare SQL=False'
      'ConnectTimeout=60'
      'Mars_Connection=False')
    Left = 32
    Top = 8
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DbConnection
    Left = 104
    Top = 8
  end
  object dspConsulta: TDataSetProvider
    DataSet = qryConsulta
    Left = 184
    Top = 8
  end
  object qryMail: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM VW_CONFIG_MAIL')
    SQLConnection = DbConnection
    Left = 416
    Top = 8
    object qryMailNM_HOST: TStringField
      FieldName = 'NM_HOST'
      Size = 100
    end
    object qryMailNR_PORTA: TIntegerField
      FieldName = 'NR_PORTA'
    end
    object qryMailNM_LOGIN: TStringField
      FieldName = 'NM_LOGIN'
      Size = 100
    end
    object qryMailNM_SENHA: TStringField
      FieldName = 'NM_SENHA'
      Size = 100
    end
    object qryMailNM_HOST_WEB: TStringField
      FieldName = 'NM_HOST_WEB'
      Size = 100
    end
    object qryMailNR_PORTA_WEB: TIntegerField
      FieldName = 'NR_PORTA_WEB'
    end
    object qryMailNM_LOGIN_WEB: TStringField
      FieldName = 'NM_LOGIN_WEB'
      Size = 100
    end
    object qryMailNM_SENHA_WEB: TStringField
      FieldName = 'NM_SENHA_WEB'
      Size = 100
    end
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 472
    Top = 8
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 528
    Top = 8
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 296
    Top = 8
  end
  object qryPreencheLI: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT DISTINCT L.NR_PROCESSO, REPLACE((LEFT(L.NR_PROCESSO, 2) +' +
        ' RIGHT(RTRIM(L.NR_PROCESSO), LEN(L.NR_PROCESSO)-4)),'#39'-'#39','#39#39') NR_I' +
        'DENT_USUARIO,'
      '  CASE EN.CD_TIPO_PESSOA  '
      '    WHEN '#39'1'#39' THEN '#39'1'#39' '
      '    WHEN '#39'2'#39' THEN '#39'2'#39
      '    WHEN '#39'3'#39' THEN '#39'4'#39
      '    WHEN '#39'4'#39' THEN '#39'1'#39
      '  END TP_IMPORTADOR,'
      '  EN.CGC_EMPRESA CPNJ_IMPORTADOR,'
      '  L.CD_PAIS_PROCEDENCIA CD_PAIS_PROC,   '
      '  L.CD_URF_DESPACHO CD_URF_DESPACHO,'
      '  L.CD_URF_ENTRADA CD_URF_ENTRADA,'
      '  CONVERT(VARCHAR(4000), L.TX_INFO_COMPLEMENTAR) TX_INFO_COMPL,'
      '  LI.CD_FABR_EXPO TP_FORNECEDOR,'
      '  EE.NM_EMPRESA NM_FORNECEDOR,'
      '  LI.CD_PAIS_AQUISICAO CD_PAIS_AQUISICAO,'
      '  EE.END_EMPRESA NM_END_FORNECEDOR,'
      '  EE.END_NUMERO  NR_END_FORNECEDOR,'
      '  EE.END_COMPL COMPL_END_FORNECEDOR,'
      '  EE.END_CIDADE CIDADE_END_FORNECEDOR,'
      '  EE.END_ESTADO ESTADO_END_FORNECEDOR,'
      '  EF.NM_EMPRESA NM_FABRICANTE,'
      '  LI.CD_PAIS_ORIGEM CD_PAIS_ORIGEM,'
      '  EF.END_EMPRESA NM_END_FABRICANTE,'
      '  EF.END_NUMERO  NR_END_FABRICANTE,'
      '  EF.END_COMPL COMPL_END_FABRICANTE,'
      '  EF.END_CIDADE CIDADE_END_FABRICANTE,'
      '  EF.END_ESTADO ESTADO_END_FABRICANTE,'
      '  L.CD_REGIME_TRIBUTACAO CD_REG_TRIB,'
      '  L.CD_FUND_LEGAL CD_FUND_LEGAL,'
      '  CASE WHEN ISNULL(L.TP_ACORDO_ALADI,'#39'0'#39') IN ('#39#39', '#39'0'#39') THEN '#39'1'#39
      '  ELSE'
      '    L.TP_ACORDO_ALADI'
      '  END TP_ACORDO_ALADI,'
      '  L.CD_ACORDO_ALADI CD_ACORDO_ALADI,'
      '  L.TP_CAMBIO CD_COB_CAMBIAL, '
      '  L.CD_MOD_PAGAMENTO CD_MODALIDADE,'
      '  L.CD_MOT_SEM_COBERTURA CD_MODALIDADE_SEM,'
      '  L.QT_DIAS_COBERTURA QT_DIAS_LIMITE,   '
      '  L.DT_PROCESSO_LI,'
      '  L.NR_ATO_DRAWBACK NR_ATO_DRAWBACK'
      '  ,g.CD_GRUPO'
      'FROM TLICENCA_IMPORTACAO L '
      '  INNER JOIN TLICENCA_ITENS LI ON LI.NR_PROCESSO = L.NR_PROCESSO'
      '  INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = L.CD_IMPORTADOR'
      
        '  INNER JOIN TEMPRESA_EST EE ON EE.CD_EMPRESA = LI.CD_EXPORTADOR' +
        ' '
      '  LEFT JOIN TEMPRESA_EST EF ON EF.CD_EMPRESA = LI.CD_FABRICANTE'
      '  left join tgrupo g on g.CD_GRUPO = en.CD_GRUPO'
      'WHERE L.NR_REGISTRO_LI IS NULL'
      '  AND IN_SOLIC_TRANSMISSAO = '#39'1'#39
      '  AND DT_TRANSMISSAO IS NULL'
      '  --and G.CD_GRUPO not in( '#39'002'#39', '#39'B58'#39')'
      ''
      'ORDER BY L.DT_PROCESSO_LI'
      '')
    SQLConnection = DbConnection
    Left = 107
    Top = 62
    object qryPreencheLINR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 8000
    end
    object qryPreencheLITP_IMPORTADOR: TStringField
      FieldName = 'TP_IMPORTADOR'
      Size = 1
    end
    object qryPreencheLICPNJ_IMPORTADOR: TStringField
      FieldName = 'CPNJ_IMPORTADOR'
      FixedChar = True
      Size = 14
    end
    object qryPreencheLICD_PAIS_PROC: TStringField
      FieldName = 'CD_PAIS_PROC'
      FixedChar = True
      Size = 3
    end
    object qryPreencheLICD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qryPreencheLICD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      FixedChar = True
      Size = 7
    end
    object qryPreencheLITX_INFO_COMPL: TStringField
      FieldName = 'TX_INFO_COMPL'
      Size = 4000
    end
    object qryPreencheLITP_FORNECEDOR: TStringField
      FieldName = 'TP_FORNECEDOR'
      FixedChar = True
      Size = 1
    end
    object qryPreencheLINM_FORNECEDOR: TStringField
      FieldName = 'NM_FORNECEDOR'
      Size = 100
    end
    object qryPreencheLICD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qryPreencheLINM_END_FORNECEDOR: TStringField
      FieldName = 'NM_END_FORNECEDOR'
      Size = 100
    end
    object qryPreencheLINR_END_FORNECEDOR: TStringField
      FieldName = 'NR_END_FORNECEDOR'
      Size = 6
    end
    object qryPreencheLICOMPL_END_FORNECEDOR: TStringField
      FieldName = 'COMPL_END_FORNECEDOR'
      FixedChar = True
      Size = 41
    end
    object qryPreencheLICIDADE_END_FORNECEDOR: TStringField
      FieldName = 'CIDADE_END_FORNECEDOR'
      Size = 30
    end
    object qryPreencheLIESTADO_END_FORNECEDOR: TStringField
      FieldName = 'ESTADO_END_FORNECEDOR'
      Size = 30
    end
    object qryPreencheLICD_REG_TRIB: TStringField
      FieldName = 'CD_REG_TRIB'
      FixedChar = True
      Size = 1
    end
    object qryPreencheLICD_FUND_LEGAL: TStringField
      FieldName = 'CD_FUND_LEGAL'
      FixedChar = True
      Size = 2
    end
    object qryPreencheLICD_ACORDO_ALADI: TStringField
      DisplayWidth = 3
      FieldName = 'CD_ACORDO_ALADI'
      FixedChar = True
      Size = 3
    end
    object qryPreencheLICD_COB_CAMBIAL: TStringField
      FieldName = 'CD_COB_CAMBIAL'
      FixedChar = True
      Size = 1
    end
    object qryPreencheLICD_MODALIDADE: TStringField
      FieldName = 'CD_MODALIDADE'
      FixedChar = True
      Size = 2
    end
    object qryPreencheLIQT_DIAS_LIMITE: TIntegerField
      FieldName = 'QT_DIAS_LIMITE'
    end
    object qryPreencheLINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
    end
    object qryPreencheLINM_FABRICANTE: TStringField
      FieldName = 'NM_FABRICANTE'
      Size = 100
    end
    object qryPreencheLICD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qryPreencheLINM_END_FABRICANTE: TStringField
      FieldName = 'NM_END_FABRICANTE'
      Size = 100
    end
    object qryPreencheLINR_END_FABRICANTE: TStringField
      FieldName = 'NR_END_FABRICANTE'
      Size = 6
    end
    object qryPreencheLICOMPL_END_FABRICANTE: TStringField
      FieldName = 'COMPL_END_FABRICANTE'
      FixedChar = True
      Size = 41
    end
    object qryPreencheLICIDADE_END_FABRICANTE: TStringField
      FieldName = 'CIDADE_END_FABRICANTE'
      Size = 30
    end
    object qryPreencheLIESTADO_END_FABRICANTE: TStringField
      FieldName = 'ESTADO_END_FABRICANTE'
      Size = 30
    end
    object qryPreencheLITP_ACORDO_ALADI: TStringField
      FieldName = 'TP_ACORDO_ALADI'
      FixedChar = True
      Size = 1
    end
    object qryPreencheLINR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Size = 13
    end
    object qryPreencheLICD_MODALIDADE_SEM: TStringField
      FieldName = 'CD_MODALIDADE_SEM'
      FixedChar = True
      Size = 2
    end
  end
  object dspPreencheLI: TDataSetProvider
    DataSet = qryPreencheLI
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 187
    Top = 62
  end
  object cdsPreencheLI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPreencheLI'
    Left = 299
    Top = 62
    object cdsPreencheLINR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 8000
    end
    object cdsPreencheLITP_IMPORTADOR: TStringField
      FieldName = 'TP_IMPORTADOR'
      Size = 1
    end
    object cdsPreencheLICPNJ_IMPORTADOR: TStringField
      FieldName = 'CPNJ_IMPORTADOR'
      FixedChar = True
      Size = 14
    end
    object cdsPreencheLICD_PAIS_PROC: TStringField
      FieldName = 'CD_PAIS_PROC'
      FixedChar = True
      Size = 3
    end
    object cdsPreencheLICD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object cdsPreencheLICD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      FixedChar = True
      Size = 7
    end
    object cdsPreencheLITX_INFO_COMPL: TStringField
      FieldName = 'TX_INFO_COMPL'
      Size = 4000
    end
    object cdsPreencheLITP_FORNECEDOR: TStringField
      FieldName = 'TP_FORNECEDOR'
      FixedChar = True
      Size = 1
    end
    object cdsPreencheLINM_FORNECEDOR: TStringField
      FieldName = 'NM_FORNECEDOR'
      Size = 100
    end
    object cdsPreencheLICD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object cdsPreencheLINM_END_FORNECEDOR: TStringField
      FieldName = 'NM_END_FORNECEDOR'
      Size = 100
    end
    object cdsPreencheLINR_END_FORNECEDOR: TStringField
      FieldName = 'NR_END_FORNECEDOR'
      Size = 6
    end
    object cdsPreencheLICOMPL_END_FORNECEDOR: TStringField
      FieldName = 'COMPL_END_FORNECEDOR'
      FixedChar = True
      Size = 41
    end
    object cdsPreencheLICIDADE_END_FORNECEDOR: TStringField
      FieldName = 'CIDADE_END_FORNECEDOR'
      Size = 30
    end
    object cdsPreencheLIESTADO_END_FORNECEDOR: TStringField
      FieldName = 'ESTADO_END_FORNECEDOR'
      Size = 30
    end
    object cdsPreencheLICD_REG_TRIB: TStringField
      FieldName = 'CD_REG_TRIB'
      FixedChar = True
      Size = 1
    end
    object cdsPreencheLICD_FUND_LEGAL: TStringField
      FieldName = 'CD_FUND_LEGAL'
      FixedChar = True
      Size = 2
    end
    object cdsPreencheLICD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      FixedChar = True
      Size = 3
    end
    object cdsPreencheLICD_COB_CAMBIAL: TStringField
      FieldName = 'CD_COB_CAMBIAL'
      FixedChar = True
      Size = 1
    end
    object cdsPreencheLICD_MODALIDADE: TStringField
      FieldName = 'CD_MODALIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsPreencheLIQT_DIAS_LIMITE: TIntegerField
      FieldName = 'QT_DIAS_LIMITE'
    end
    object cdsPreencheLINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
    end
    object cdsPreencheLINM_FABRICANTE: TStringField
      FieldName = 'NM_FABRICANTE'
      Size = 100
    end
    object cdsPreencheLICD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object cdsPreencheLINM_END_FABRICANTE: TStringField
      FieldName = 'NM_END_FABRICANTE'
      Size = 100
    end
    object cdsPreencheLINR_END_FABRICANTE: TStringField
      FieldName = 'NR_END_FABRICANTE'
      Size = 6
    end
    object cdsPreencheLICOMPL_END_FABRICANTE: TStringField
      FieldName = 'COMPL_END_FABRICANTE'
      FixedChar = True
      Size = 41
    end
    object cdsPreencheLICIDADE_END_FABRICANTE: TStringField
      FieldName = 'CIDADE_END_FABRICANTE'
      Size = 30
    end
    object cdsPreencheLIESTADO_END_FABRICANTE: TStringField
      FieldName = 'ESTADO_END_FABRICANTE'
      Size = 30
    end
    object cdsPreencheLITP_ACORDO_ALADI: TStringField
      FieldName = 'TP_ACORDO_ALADI'
      FixedChar = True
      Size = 1
    end
    object cdsPreencheLINR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Size = 13
    end
    object cdsPreencheLICD_MODALIDADE_SEM: TStringField
      FieldName = 'CD_MODALIDADE_SEM'
      FixedChar = True
      Size = 2
    end
  end
  object cdsPreencheLIItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPreencheLIItens'
    Left = 299
    Top = 108
    object cdsPreencheLIItensCD_NCM: TStringField
      FieldName = 'CD_NCM'
      FixedChar = True
      Size = 11
    end
    object cdsPreencheLIItensCD_NALADI: TStringField
      FieldName = 'CD_NALADI'
      FixedChar = True
      Size = 8
    end
    object cdsPreencheLIItensQT_UNID_ESTAT: TFloatField
      FieldName = 'QT_UNID_ESTAT'
      Required = True
    end
    object cdsPreencheLIItensPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
      Required = True
    end
    object cdsPreencheLIItensCD_MOEDA_NEG: TStringField
      FieldName = 'CD_MOEDA_NEG'
      FixedChar = True
      Size = 3
    end
    object cdsPreencheLIItensCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object cdsPreencheLIItensVL_TOTAL_LOCAL_EMB: TFloatField
      FieldName = 'VL_TOTAL_LOCAL_EMB'
      Required = True
    end
    object cdsPreencheLIItensCD_CONDICAO_MERC: TStringField
      FieldName = 'CD_CONDICAO_MERC'
      Size = 1
    end
    object cdsPreencheLIItensNR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      FixedChar = True
      Size = 3
    end
    object cdsPreencheLIItensNR_PROC_ANUENTE: TStringField
      FieldName = 'NR_PROC_ANUENTE'
      Required = True
      Size = 120
    end
    object cdsPreencheLIItensSIGLA_ORG_ANUENTE: TStringField
      FieldName = 'SIGLA_ORG_ANUENTE'
      Required = True
      Size = 16
    end
    object cdsPreencheLIItensSISTEMA_DRAWBACK: TIntegerField
      FieldName = 'SISTEMA_DRAWBACK'
      Required = True
    end
    object cdsPreencheLIItensNM_UNID_COMERC: TStringField
      FieldName = 'NM_UNID_COMERC'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsPreencheLIItensQT_MERC_COMERC: TFloatField
      FieldName = 'QT_MERC_COMERC'
      Required = True
    end
    object cdsPreencheLIItensVL_UNIT_COND_VENDA: TFloatField
      FieldName = 'VL_UNIT_COND_VENDA'
      Required = True
    end
    object cdsPreencheLIItensNM_ESPEC_MERC: TStringField
      FieldName = 'NM_ESPEC_MERC'
      Size = 4000
    end
    object cdsPreencheLIItensNR_DRAWBACK: TStringField
      FieldName = 'NR_DRAWBACK'
      FixedChar = True
      Size = 13
    end
    object cdsPreencheLIItensNR_ITEM_DRAWBACK: TStringField
      FieldName = 'NR_ITEM_DRAWBACK'
      FixedChar = True
      Size = 3
    end
    object cdsPreencheLIItensQT_PRODUTO_DRAWBACK: TFloatField
      FieldName = 'QT_PRODUTO_DRAWBACK'
    end
    object cdsPreencheLIItensVL_PRODUTO_DRAWBACK: TFloatField
      FieldName = 'VL_PRODUTO_DRAWBACK'
    end
    object cdsPreencheLIItensCD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      FixedChar = True
      Size = 3
    end
    object cdsPreencheLIItensOP_NACIONALIZACAO: TStringField
      FieldName = 'OP_NACIONALIZACAO'
      Size = 2
    end
    object cdsPreencheLIItensENQ_MAT_USADO: TIntegerField
      FieldName = 'ENQ_MAT_USADO'
    end
  end
  object qryPreencheLIItens: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT LEFT(LI.CD_NCM_SH, 8)                                    ' +
        '                            AS CD_NCM,'
      
        '       LI.CD_NALADI_SH                                          ' +
        '                            AS CD_NALADI,'
      
        '       LI.QT_MERC_UN_ESTAT                                      ' +
        '                            AS QT_UNID_ESTAT,'
      
        '       LI.PL_MERCADORIA                                         ' +
        '                            AS PESO_LIQ,'
      
        '       L.CD_MOEDA_FOB                                           ' +
        '                            AS CD_MOEDA_NEG,'
      
        '       L.CD_INCOTERM                                            ' +
        '                            AS CD_INCOTERM,'
      
        '       CD_UN_MED_COMERC                                         ' +
        '                            AS CD_UN_MED_COMERC,'
      '      /* '
      '       LI.VL_RAT_FRETE, '
      
        '       LI.VL_TOTAL_MLE                                          ' +
        '                            AS VL_TOTAL_MLE_COM_FRETE,'
      '       '
      '       CONVERT( NUMERIC(18,7),'
      
        '               ((ISNULL(L.VL_FRETE_MOEDA_MERC,0) / L.QT_TOTAL_PE' +
        'S_LIQ) * LI.PL_MERCADORIA)) AS VL_FRETE,'
      '               '
      '       CONVERT( NUMERIC(18,7),     '
      '       CASE L.IN_EMBUT_FRT_ITENS  WHEN '#39'1'#39
      '     '#9'    THEN LI.VL_TOTAL_MLE -'
      
        #9#9'        ((ISNULL(L.VL_FRETE_MOEDA_MERC,0) / L.QT_TOTAL_PES_LIQ' +
        ') * LI.PL_MERCADORIA) '
      #9#9#9#9'/* (LI.VL_TOTAL_MLE - '
      
        #9#9#9#9'( (L.VL_FRETE_MOEDA / L.QT_TOTAL_PES_LIQ) * LI.PL_MERCADORIA' +
        '))*/'
      '            ELSE LI.VL_TOTAL_MLE  '
      
        #9'   END )                                                       ' +
        '                         AS VL_TOTAL_LOCAL_EMB_NOVO,   '
      #9'       '
      '       CONVERT( NUMERIC(18,7), '
      
        '       CASE L.IN_EMBUT_FRT_ITENS WHEN '#39'1'#39'                       ' +
        '                            '
      
        '            THEN(LI.VL_TOTAL_MLE -                              ' +
        '                            '
      
        '                ((L.VL_FRETE_MOEDA / L.QT_TOTAL_PES_LIQ) * LI.PL' +
        '_MERCADORIA))               '
      
        '            ELSE LI.VL_TOTAL_MLE                                ' +
        '                            '
      
        #9'   END)                                                        ' +
        '                         AS VL_TOTAL_LOCAL_EMB, '
      #9'   */'
      #9'   '
      #9'   VL_TOTAL_MLE_SEM_FRETE AS VL_TOTAL_LOCAL_EMB,'
      #9'   '
      
        #9'                                                               ' +
        '                         '
      
        '       VL_UNIT_MLE                                              ' +
        '                            AS VL_UNIT_COND_VENDA,       '
      
        '       CASE ISNULL(CD_CONDICAO_MERC , '#39'2'#39')                      ' +
        '                            '
      
        '         WHEN '#39'0'#39' THEN '#39'2'#39'                                      ' +
        '                            '
      
        '         WHEN '#39'1'#39' THEN '#39'3'#39'                                      ' +
        '                            '
      
        '         WHEN '#39'2'#39' THEN '#39'1'#39'                                      ' +
        '                            '
      
        '       END                                                      ' +
        '                            AS CD_CONDICAO_MERC,        '
      
        '       LI.NR_DESTAQUE_NCM                                       ' +
        '                            AS NR_DESTAQUE_NCM,'
      
        '       ISNULL((SELECT TOP 1 PA1.PROCESSO                        ' +
        '                            '
      
        '                 FROM TPROC_ANUENTES PA1                        ' +
        '                            '
      
        #9#9#9#9'WHERE PA1.NR_PROCESSO = LI.NR_PROCESSO                      ' +
        '                '
      
        #9#9'     ORDER BY PA1.PROCESSO),'#39#39')                               ' +
        '                      AS NR_PROC_ANUENTE,'
      
        '       ISNULL((SELECT TOP 1 PA2.ORGAO                           ' +
        '                            '
      
        #9'             FROM TPROC_ANUENTES PA2                           ' +
        '                         '
      
        #9#9#9#9'WHERE PA2.NR_PROCESSO = LI.NR_PROCESSO                      ' +
        '                '
      
        #9#9'     ORDER BY PA2.PROCESSO),'#39#39')                               ' +
        '                      AS SIGLA_ORG_ANUENTE,'
      
        '       REPLACE(UB.NM_UNID_MEDIDA,'#39' '#39', '#39#39')                       ' +
        '                            AS NM_UNID_COMERC,'
      
        '       QT_MERC_UN_COMERC                                        ' +
        '                            AS QT_MERC_COMERC,'
      
        '       CONVERT(VARCHAR(4000), TX_DESC_DET_MERC)                 ' +
        '                            AS NM_ESPEC_MERC,'
      
        '       LI.SISTEMA_DRAWBACK                                      ' +
        '                            AS SISTEMA_DRAWBACK,'
      
        '       LI.NR_ATO_DRAWBACK                                       ' +
        '                            AS NR_DRAWBACK,'
      
        '       LI.NR_ITEM_DRAWBACK                                      ' +
        '                            AS NR_ITEM_DRAWBACK,'
      
        '       LI.QT_PRODUTO_DRAWBACK                                   ' +
        '                            AS QT_PRODUTO_DRAWBACK,'
      
        '       LI.VL_PRODUTO_DRAWBACK                                   ' +
        '                            AS VL_PRODUTO_DRAWBACK,'
      
        '       L.ENQ_MAT_USADO                                          ' +
        '                            AS ENQ_MAT_USADO,'
      
        '       L.OP_NACIONALIZACAO                                      ' +
        '                            AS OP_NACIONALIZACAO       '
      'FROM TLICENCA_IMPORTACAO        L  (NOLOCK)'
      
        '  LEFT JOIN TLICENCA_ITENS      LI (NOLOCK) ON LI.NR_PROCESSO = ' +
        'L.NR_PROCESSO'
      
        '  LEFT JOIN TUNID_MEDIDA_BROKER UB (NOLOCK) ON UB.CD_UNID_MEDIDA' +
        ' = LI.CD_UN_MED_COMERC'
      'WHERE LI.NR_PROCESSO = :NR_PROCESSO')
    SQLConnection = DbConnection
    Left = 107
    Top = 108
    object qryPreencheLIItensCD_NCM: TStringField
      FieldName = 'CD_NCM'
      FixedChar = True
      Size = 8
    end
    object qryPreencheLIItensCD_NALADI: TStringField
      FieldName = 'CD_NALADI'
      FixedChar = True
      Size = 8
    end
    object qryPreencheLIItensQT_UNID_ESTAT: TFloatField
      FieldName = 'QT_UNID_ESTAT'
      Required = True
    end
    object qryPreencheLIItensPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
      Required = True
    end
    object qryPreencheLIItensCD_MOEDA_NEG: TStringField
      FieldName = 'CD_MOEDA_NEG'
      FixedChar = True
      Size = 3
    end
    object qryPreencheLIItensCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryPreencheLIItensVL_TOTAL_LOCAL_EMB: TFloatField
      FieldName = 'VL_TOTAL_LOCAL_EMB'
      Required = True
    end
    object qryPreencheLIItensCD_CONDICAO_MERC: TStringField
      FieldName = 'CD_CONDICAO_MERC'
      Size = 1
    end
    object qryPreencheLIItensNR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      FixedChar = True
      Size = 3
    end
    object qryPreencheLIItensNR_PROC_ANUENTE: TStringField
      FieldName = 'NR_PROC_ANUENTE'
      Required = True
      Size = 120
    end
    object qryPreencheLIItensSIGLA_ORG_ANUENTE: TStringField
      FieldName = 'SIGLA_ORG_ANUENTE'
      Required = True
      Size = 16
    end
    object qryPreencheLIItensSISTEMA_DRAWBACK: TIntegerField
      FieldName = 'SISTEMA_DRAWBACK'
      Required = True
    end
    object qryPreencheLIItensNM_UNID_COMERC: TStringField
      FieldName = 'NM_UNID_COMERC'
      Required = True
      FixedChar = True
      Size = 50
    end
    object qryPreencheLIItensQT_MERC_COMERC: TFloatField
      FieldName = 'QT_MERC_COMERC'
      Required = True
    end
    object qryPreencheLIItensVL_UNIT_COND_VENDA: TFloatField
      FieldName = 'VL_UNIT_COND_VENDA'
      Required = True
    end
    object qryPreencheLIItensNM_ESPEC_MERC: TStringField
      FieldName = 'NM_ESPEC_MERC'
      Size = 4000
    end
    object qryPreencheLIItensNR_DRAWBACK: TStringField
      FieldName = 'NR_DRAWBACK'
      FixedChar = True
      Size = 13
    end
    object qryPreencheLIItensNR_ITEM_DRAWBACK: TStringField
      FieldName = 'NR_ITEM_DRAWBACK'
      FixedChar = True
      Size = 3
    end
    object qryPreencheLIItensQT_PRODUTO_DRAWBACK: TFloatField
      FieldName = 'QT_PRODUTO_DRAWBACK'
    end
    object qryPreencheLIItensVL_PRODUTO_DRAWBACK: TFloatField
      FieldName = 'VL_PRODUTO_DRAWBACK'
    end
    object qryPreencheLIItensCD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      FixedChar = True
      Size = 3
    end
    object qryPreencheLIItensIntegerField: TIntegerField
      FieldName = 'ENQ_MAT_USADO'
    end
    object qryPreencheLIItensIntegerField2: TStringField
      FieldName = 'OP_NACIONALIZACAO'
      Size = 2
    end
  end
  object dspPreencheLIItens: TDataSetProvider
    DataSet = qryPreencheLIItens
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 187
    Top = 108
  end
  object qryRecuperaLI: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT PL.NR_PROCESSO, PL.NR_LI AS NR_REGISTRO_LI, L.NR_IDENT_TR' +
        'ANSMISSAO, CD_CLIENTE, N.NM_EMPRESA'
      'FROM TPROCESSO                P  (NOLOCK)'
      
        'JOIN TPROCESSO_LI             PL (NOLOCK) ON P.NR_PROCESSO    = ' +
        'PL.NR_PROCESSO'
      
        'JOIN TEMPRESA_NAC             N  (NOLOCK) ON N.CD_EMPRESA     = ' +
        'P.CD_CLIENTE'
      
        'LEFT JOIN TLICENCA_IMPORTACAO L  (NOLOCK) ON L.NR_REGISTRO_LI = ' +
        'PL.NR_LI '
      'LEFT JOIN TGRUPO G ON G.CD_GRUPO = N.CD_GRUPO'
      
        'WHERE (PL.NR_LI NOT IN (SELECT NR_OPER_TRAT_PREV FROM OPERA'#199#195'O_C' +
        'OM_TRATAMENTO (NOLOCK))) '
      '  AND PL.IN_FILA_RECUPERAR = '#39'1'#39
      '  AND ISNULL(PL.IN_LPCO, 0) = 0'
      ' -- AND G.CD_GRUPO NOT IN( '#39'002'#39', '#39'B58'#39')')
    SQLConnection = DbConnection
    Left = 107
    Top = 156
    object qryRecuperaLINR_REGISTRO_LI: TStringField
      FieldName = 'NR_REGISTRO_LI'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryRecuperaLINR_IDENT_TRANSMISSAO: TIntegerField
      FieldName = 'NR_IDENT_TRANSMISSAO'
    end
    object qryRecuperaLINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryRecuperaLICD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryRecuperaLINM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 80
    end
  end
  object dspRecuperaLI: TDataSetProvider
    DataSet = qryRecuperaLI
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 187
    Top = 156
  end
  object cdsRecuperaLI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecuperaLI'
    Left = 299
    Top = 156
    object cdsRecuperaLINR_REGISTRO_LI: TStringField
      FieldName = 'NR_REGISTRO_LI'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsRecuperaLINR_IDENT_TRANSMISSAO: TIntegerField
      FieldName = 'NR_IDENT_TRANSMISSAO'
    end
    object cdsRecuperaLINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsRecuperaLICD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object cdsRecuperaLINM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 80
    end
  end
  object cdsDestaqueNCM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDestaqueNCM'
    AfterPost = cdsDestaqueNCMAfterPost
    Left = 641
    Top = 62
    object cdsDestaqueNCMNR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsDestaqueNCMNR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Required = True
      Size = 3
    end
  end
  object qryDestaqueNCM: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'NR_OPER_TRAT_PREV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_DESTAQUE_NCM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM DESTAQUE_NCM'
      'WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV'
      '  AND NR_DESTAQUE_NCM = :NR_DESTAQUE_NCM')
    SQLConnection = DbConnection
    Left = 417
    Top = 62
    object qryDestaqueNCMNR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryDestaqueNCMNR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Required = True
      Size = 3
    end
  end
  object dspDestaqueNCM: TDataSetProvider
    DataSet = qryDestaqueNCM
    Options = [poRetainServerOrder, poUseQuoteChar]
    OnGetTableName = dspDestaqueNCMGetTableName
    Left = 529
    Top = 62
  end
  object cdsOpeTratamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOpeTratamento'
    Left = 641
    Top = 109
    object cdsOpeTratamentoNR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object cdsOpeTratamentoNR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 18
    end
    object cdsOpeTratamentoNR_OPER_TRAT_PROT: TStringField
      FieldName = 'NR_OPER_TRAT_PROT'
      Size = 10
    end
    object cdsOpeTratamentoCD_AUTORIZ_TRANSM: TStringField
      FieldName = 'CD_AUTORIZ_TRANSM'
      Size = 1
    end
    object cdsOpeTratamentoNR_TRAT_IMP_MICRO: TStringField
      FieldName = 'NR_TRAT_IMP_MICRO'
      Size = 8
    end
    object cdsOpeTratamentoNR_LI_SUBSTITUIDO: TStringField
      FieldName = 'NR_LI_SUBSTITUIDO'
      Size = 10
    end
    object cdsOpeTratamentoCD_ORIGEM_LI: TStringField
      FieldName = 'CD_ORIGEM_LI'
      Size = 1
    end
    object cdsOpeTratamentoNR_DECL_IMP_VINC: TStringField
      FieldName = 'NR_DECL_IMP_VINC'
      Size = 10
    end
    object cdsOpeTratamentoNR_ADI_IMP_VINC: TStringField
      FieldName = 'NR_ADI_IMP_VINC'
      Size = 3
    end
    object cdsOpeTratamentoNR_SEQ_RETI_VINC: TStringField
      FieldName = 'NR_SEQ_RETI_VINC'
      Size = 2
    end
    object cdsOpeTratamentoCD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object cdsOpeTratamentoNR_IMPORTADOR: TStringField
      FieldName = 'NR_IMPORTADOR'
      Size = 14
    end
    object cdsOpeTratamentoCD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object cdsOpeTratamentoNM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      Size = 60
    end
    object cdsOpeTratamentoNR_TEL_IMPORTADOR: TStringField
      FieldName = 'NR_TEL_IMPORTADOR'
      Size = 15
    end
    object cdsOpeTratamentoED_LOGR_IMPORTADOR: TStringField
      FieldName = 'ED_LOGR_IMPORTADOR'
      Size = 40
    end
    object cdsOpeTratamentoED_NR_IMPORTADOR: TStringField
      FieldName = 'ED_NR_IMPORTADOR'
      Size = 6
    end
    object cdsOpeTratamentoED_COMPL_IMPO: TStringField
      FieldName = 'ED_COMPL_IMPO'
      Size = 21
    end
    object cdsOpeTratamentoED_BA_IMPORTADOR: TStringField
      FieldName = 'ED_BA_IMPORTADOR'
      Size = 25
    end
    object cdsOpeTratamentoED_MUN_IMPORTADOR: TStringField
      FieldName = 'ED_MUN_IMPORTADOR'
      Size = 25
    end
    object cdsOpeTratamentoED_UF_IMPORTADOR: TStringField
      FieldName = 'ED_UF_IMPORTADOR'
      Size = 2
    end
    object cdsOpeTratamentoED_CEP_IMPORTADOR: TStringField
      FieldName = 'ED_CEP_IMPORTADOR'
      Size = 8
    end
    object cdsOpeTratamentoCD_ATIV_ECON_IMPO: TStringField
      FieldName = 'CD_ATIV_ECON_IMPO'
      Size = 4
    end
    object cdsOpeTratamentoNR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object cdsOpeTratamentoCD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      Size = 7
    end
    object cdsOpeTratamentoNM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Size = 60
    end
    object cdsOpeTratamentoED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object cdsOpeTratamentoED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Size = 6
    end
    object cdsOpeTratamentoED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object cdsOpeTratamentoED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object cdsOpeTratamentoED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object cdsOpeTratamentoCD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object cdsOpeTratamentoCD_MERCADORIA_NCM: TStringField
      FieldName = 'CD_MERCADORIA_NCM'
      Size = 8
    end
    object cdsOpeTratamentoCD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Size = 3
    end
    object cdsOpeTratamentoCD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object cdsOpeTratamentoNM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Size = 60
    end
    object cdsOpeTratamentoED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      Size = 40
    end
    object cdsOpeTratamentoED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      Size = 6
    end
    object cdsOpeTratamentoED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      Size = 21
    end
    object cdsOpeTratamentoED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Size = 25
    end
    object cdsOpeTratamentoED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Size = 25
    end
    object cdsOpeTratamentoCD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object cdsOpeTratamentoCD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Size = 7
    end
    object cdsOpeTratamentoCD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Size = 8
    end
    object cdsOpeTratamentoPL_MERCADORIA: TStringField
      FieldName = 'PL_MERCADORIA'
      Size = 15
    end
    object cdsOpeTratamentoQT_UN_ESTATISTICA: TStringField
      FieldName = 'QT_UN_ESTATISTICA'
      Size = 15
    end
    object cdsOpeTratamentoCD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object cdsOpeTratamentoQT_DIA_LIMITE_PGTO: TStringField
      FieldName = 'QT_DIA_LIMITE_PGTO'
      Size = 3
    end
    object cdsOpeTratamentoCD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Size = 3
    end
    object cdsOpeTratamentoVL_MERC_MNEG_EMB: TStringField
      FieldName = 'VL_MERC_MNEG_EMB'
      FixedChar = True
      Size = 15
    end
    object cdsOpeTratamentoVL_TOT_DOLAR_EMB: TStringField
      FieldName = 'VL_TOT_DOLAR_EMB'
      Size = 11
    end
    object cdsOpeTratamentoCD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object cdsOpeTratamentoCD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Size = 3
    end
    object cdsOpeTratamentoCD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Size = 1
    end
    object cdsOpeTratamentoCD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Size = 2
    end
    object cdsOpeTratamentoCD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Size = 1
    end
    object cdsOpeTratamentoCD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Size = 2
    end
    object cdsOpeTratamentoCD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object cdsOpeTratamentoCD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Size = 2
    end
    object cdsOpeTratamentoCD_AGENCIA_SECEX: TStringField
      FieldName = 'CD_AGENCIA_SECEX'
      Size = 5
    end
    object cdsOpeTratamentoCD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object cdsOpeTratamentoIN_REST_DATA_EMB_LI: TStringField
      FieldName = 'IN_REST_DATA_EMB_LI'
      Size = 1
    end
    object cdsOpeTratamentoIN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
    end
    object cdsOpeTratamentoIN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
    end
    object cdsOpeTratamentoNR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Size = 13
    end
    object cdsOpeTratamentoNR_COMUNIC_COMPRA: TStringField
      FieldName = 'NR_COMUNIC_COMPRA'
      Size = 13
    end
    object cdsOpeTratamentoDT_REG_OPER_TRAT: TStringField
      FieldName = 'DT_REG_OPER_TRAT'
      Size = 10
    end
    object cdsOpeTratamentoDT_ATU_OPER_MICRO: TStringField
      FieldName = 'DT_ATU_OPER_MICRO'
      Size = 10
    end
    object cdsOpeTratamentoIN_SALVO_DIAG: TBooleanField
      FieldName = 'IN_SALVO_DIAG'
    end
    object cdsOpeTratamentoIN_SELECAO_DIAG: TBooleanField
      FieldName = 'IN_SELECAO_DIAG'
    end
    object cdsOpeTratamentoTX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      BlobType = ftMemo
      Size = 1
    end
    object cdsOpeTratamentoCD_SITUAC_OP_TRAT: TStringField
      FieldName = 'CD_SITUAC_OP_TRAT'
      Size = 2
    end
    object cdsOpeTratamentoDT_SITUAC_OP_TRAT: TStringField
      FieldName = 'DT_SITUAC_OP_TRAT'
      Size = 10
    end
    object cdsOpeTratamentoDT_VALID_OP_TRAT: TStringField
      FieldName = 'DT_VALID_OP_TRAT'
      Size = 10
    end
    object cdsOpeTratamentoCD_CANCEL_OP_TRAT: TStringField
      FieldName = 'CD_CANCEL_OP_TRAT'
      Size = 1
    end
    object cdsOpeTratamentoDT_CANCEL_OP_TRAT: TStringField
      FieldName = 'DT_CANCEL_OP_TRAT'
      Size = 10
    end
    object cdsOpeTratamentoNR_CPF_CANC_ANUENC: TStringField
      FieldName = 'NR_CPF_CANC_ANUENC'
      Size = 11
    end
    object cdsOpeTratamentoNR_LI_SUBSTITUTIVO: TStringField
      FieldName = 'NR_LI_SUBSTITUTIVO'
      Size = 10
    end
    object cdsOpeTratamentoIN_REG_DRAWBACK: TStringField
      FieldName = 'IN_REG_DRAWBACK'
      FixedChar = True
      Size = 1
    end
    object cdsOpeTratamentoNR_REG_DRAWBACK: TStringField
      FieldName = 'NR_REG_DRAWBACK'
      FixedChar = True
      Size = 11
    end
    object cdsOpeTratamentoIN_LI_INCLUIDA: TStringField
      FieldName = 'IN_LI_INCLUIDA'
      FixedChar = True
      Size = 1
    end
  end
  object qryOpeTratamento: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'NR_OPER_TRAT_PREV'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM OPERACAO_COM_TRATAMENTO'
      'WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV')
    SQLConnection = DbConnection
    Left = 417
    Top = 109
    object qryOpeTratamentoNR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object qryOpeTratamentoNR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 18
    end
    object qryOpeTratamentoNR_OPER_TRAT_PROT: TStringField
      FieldName = 'NR_OPER_TRAT_PROT'
      Size = 10
    end
    object qryOpeTratamentoCD_AUTORIZ_TRANSM: TStringField
      FieldName = 'CD_AUTORIZ_TRANSM'
      Size = 1
    end
    object qryOpeTratamentoNR_TRAT_IMP_MICRO: TStringField
      FieldName = 'NR_TRAT_IMP_MICRO'
      Size = 8
    end
    object qryOpeTratamentoNR_LI_SUBSTITUIDO: TStringField
      FieldName = 'NR_LI_SUBSTITUIDO'
      Size = 10
    end
    object qryOpeTratamentoCD_ORIGEM_LI: TStringField
      FieldName = 'CD_ORIGEM_LI'
      Size = 1
    end
    object qryOpeTratamentoNR_DECL_IMP_VINC: TStringField
      FieldName = 'NR_DECL_IMP_VINC'
      Size = 10
    end
    object qryOpeTratamentoNR_ADI_IMP_VINC: TStringField
      FieldName = 'NR_ADI_IMP_VINC'
      Size = 3
    end
    object qryOpeTratamentoNR_SEQ_RETI_VINC: TStringField
      FieldName = 'NR_SEQ_RETI_VINC'
      Size = 2
    end
    object qryOpeTratamentoCD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object qryOpeTratamentoNR_IMPORTADOR: TStringField
      FieldName = 'NR_IMPORTADOR'
      Size = 14
    end
    object qryOpeTratamentoCD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object qryOpeTratamentoNM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      Size = 60
    end
    object qryOpeTratamentoNR_TEL_IMPORTADOR: TStringField
      FieldName = 'NR_TEL_IMPORTADOR'
      Size = 15
    end
    object qryOpeTratamentoED_LOGR_IMPORTADOR: TStringField
      FieldName = 'ED_LOGR_IMPORTADOR'
      Size = 40
    end
    object qryOpeTratamentoED_NR_IMPORTADOR: TStringField
      FieldName = 'ED_NR_IMPORTADOR'
      Size = 6
    end
    object qryOpeTratamentoED_COMPL_IMPO: TStringField
      FieldName = 'ED_COMPL_IMPO'
      Size = 21
    end
    object qryOpeTratamentoED_BA_IMPORTADOR: TStringField
      FieldName = 'ED_BA_IMPORTADOR'
      Size = 25
    end
    object qryOpeTratamentoED_MUN_IMPORTADOR: TStringField
      FieldName = 'ED_MUN_IMPORTADOR'
      Size = 25
    end
    object qryOpeTratamentoED_UF_IMPORTADOR: TStringField
      FieldName = 'ED_UF_IMPORTADOR'
      Size = 2
    end
    object qryOpeTratamentoED_CEP_IMPORTADOR: TStringField
      FieldName = 'ED_CEP_IMPORTADOR'
      Size = 8
    end
    object qryOpeTratamentoCD_ATIV_ECON_IMPO: TStringField
      FieldName = 'CD_ATIV_ECON_IMPO'
      Size = 4
    end
    object qryOpeTratamentoNR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object qryOpeTratamentoCD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      Size = 7
    end
    object qryOpeTratamentoNM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Size = 60
    end
    object qryOpeTratamentoED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object qryOpeTratamentoED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Size = 6
    end
    object qryOpeTratamentoED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object qryOpeTratamentoED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object qryOpeTratamentoED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object qryOpeTratamentoCD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object qryOpeTratamentoCD_MERCADORIA_NCM: TStringField
      FieldName = 'CD_MERCADORIA_NCM'
      Size = 8
    end
    object qryOpeTratamentoCD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Size = 3
    end
    object qryOpeTratamentoCD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object qryOpeTratamentoNM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Size = 60
    end
    object qryOpeTratamentoED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      Size = 40
    end
    object qryOpeTratamentoED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      Size = 6
    end
    object qryOpeTratamentoED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      Size = 21
    end
    object qryOpeTratamentoED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Size = 25
    end
    object qryOpeTratamentoED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Size = 25
    end
    object qryOpeTratamentoCD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object qryOpeTratamentoCD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Size = 7
    end
    object qryOpeTratamentoCD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Size = 8
    end
    object qryOpeTratamentoPL_MERCADORIA: TStringField
      FieldName = 'PL_MERCADORIA'
      Size = 15
    end
    object qryOpeTratamentoQT_UN_ESTATISTICA: TStringField
      FieldName = 'QT_UN_ESTATISTICA'
      Size = 15
    end
    object qryOpeTratamentoCD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object qryOpeTratamentoQT_DIA_LIMITE_PGTO: TStringField
      FieldName = 'QT_DIA_LIMITE_PGTO'
      Size = 3
    end
    object qryOpeTratamentoCD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Size = 3
    end
    object qryOpeTratamentoVL_MERC_MNEG_EMB: TStringField
      FieldName = 'VL_MERC_MNEG_EMB'
      FixedChar = True
      Size = 15
    end
    object qryOpeTratamentoVL_TOT_DOLAR_EMB: TStringField
      FieldName = 'VL_TOT_DOLAR_EMB'
      Size = 11
    end
    object qryOpeTratamentoCD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object qryOpeTratamentoCD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Size = 3
    end
    object qryOpeTratamentoCD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Size = 1
    end
    object qryOpeTratamentoCD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Size = 2
    end
    object qryOpeTratamentoCD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Size = 1
    end
    object qryOpeTratamentoCD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Size = 2
    end
    object qryOpeTratamentoCD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object qryOpeTratamentoCD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Size = 2
    end
    object qryOpeTratamentoCD_AGENCIA_SECEX: TStringField
      FieldName = 'CD_AGENCIA_SECEX'
      Size = 5
    end
    object qryOpeTratamentoCD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object qryOpeTratamentoIN_REST_DATA_EMB_LI: TStringField
      FieldName = 'IN_REST_DATA_EMB_LI'
      Size = 1
    end
    object qryOpeTratamentoIN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
    end
    object qryOpeTratamentoIN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
    end
    object qryOpeTratamentoNR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Size = 13
    end
    object qryOpeTratamentoNR_COMUNIC_COMPRA: TStringField
      FieldName = 'NR_COMUNIC_COMPRA'
      Size = 13
    end
    object qryOpeTratamentoDT_REG_OPER_TRAT: TStringField
      FieldName = 'DT_REG_OPER_TRAT'
      Size = 10
    end
    object qryOpeTratamentoDT_ATU_OPER_MICRO: TStringField
      FieldName = 'DT_ATU_OPER_MICRO'
      Size = 10
    end
    object qryOpeTratamentoIN_SALVO_DIAG: TBooleanField
      FieldName = 'IN_SALVO_DIAG'
    end
    object qryOpeTratamentoIN_SELECAO_DIAG: TBooleanField
      FieldName = 'IN_SELECAO_DIAG'
    end
    object qryOpeTratamentoTX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      BlobType = ftMemo
      Size = 1
    end
    object qryOpeTratamentoCD_SITUAC_OP_TRAT: TStringField
      FieldName = 'CD_SITUAC_OP_TRAT'
      Size = 2
    end
    object qryOpeTratamentoDT_SITUAC_OP_TRAT: TStringField
      FieldName = 'DT_SITUAC_OP_TRAT'
      Size = 10
    end
    object qryOpeTratamentoDT_VALID_OP_TRAT: TStringField
      FieldName = 'DT_VALID_OP_TRAT'
      Size = 10
    end
    object qryOpeTratamentoCD_CANCEL_OP_TRAT: TStringField
      FieldName = 'CD_CANCEL_OP_TRAT'
      Size = 1
    end
    object qryOpeTratamentoDT_CANCEL_OP_TRAT: TStringField
      FieldName = 'DT_CANCEL_OP_TRAT'
      Size = 10
    end
    object qryOpeTratamentoNR_CPF_CANC_ANUENC: TStringField
      FieldName = 'NR_CPF_CANC_ANUENC'
      Size = 11
    end
    object qryOpeTratamentoNR_LI_SUBSTITUTIVO: TStringField
      FieldName = 'NR_LI_SUBSTITUTIVO'
      Size = 10
    end
    object qryOpeTratamentoIN_REG_DRAWBACK: TStringField
      FieldName = 'IN_REG_DRAWBACK'
      FixedChar = True
      Size = 1
    end
    object qryOpeTratamentoNR_REG_DRAWBACK: TStringField
      FieldName = 'NR_REG_DRAWBACK'
      FixedChar = True
      Size = 11
    end
    object qryOpeTratamentoIN_LI_INCLUIDA: TStringField
      FieldName = 'IN_LI_INCLUIDA'
      FixedChar = True
      Size = 1
    end
  end
  object dspOpeTratamento: TDataSetProvider
    DataSet = qryOpeTratamento
    Options = [poRetainServerOrder, poUseQuoteChar]
    OnGetTableName = dspOpeTratamentoGetTableName
    Left = 529
    Top = 109
  end
  object cdsMercTratamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMercTratamento'
    AfterPost = cdsDestaqueNCMAfterPost
    Left = 641
    Top = 158
    object cdsMercTratamentoNR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object cdsMercTratamentoNR_SEQ_PRODUTO: TStringField
      FieldName = 'NR_SEQ_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object cdsMercTratamentoQT_MERC_UN_COMERC: TStringField
      FieldName = 'QT_MERC_UN_COMERC'
      Size = 14
    end
    object cdsMercTratamentoNM_UN_MEDID_COMER: TStringField
      FieldName = 'NM_UN_MEDID_COMER'
    end
    object cdsMercTratamentoVL_UNID_COND_VENDA: TStringField
      FieldName = 'VL_UNID_COND_VENDA'
      Size = 21
    end
    object cdsMercTratamentoTX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
      Size = 1
    end
    object cdsMercTratamentoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 15
    end
    object cdsMercTratamentoNR_ITEM_DRAWBACK: TStringField
      FieldName = 'NR_ITEM_DRAWBACK'
      FixedChar = True
      Size = 3
    end
    object cdsMercTratamentoQT_PROD_DRAWBACK: TStringField
      FieldName = 'QT_PROD_DRAWBACK'
      FixedChar = True
      Size = 14
    end
    object cdsMercTratamentoVL_PROD_DRAWBACK: TStringField
      FieldName = 'VL_PROD_DRAWBACK'
      FixedChar = True
      Size = 15
    end
  end
  object qryMercTratamento: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'NR_OPER_TRAT_PREV'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'NR_SEQ_PRODUTO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM DETALHE_MERC_COM_TRATAMENTO'
      'WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV'
      '  AND NR_SEQ_PRODUTO    = :NR_SEQ_PRODUTO')
    SQLConnection = DbConnection
    Left = 417
    Top = 158
    object qryMercTratamentoNR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      FixedChar = True
      Size = 10
    end
    object qryMercTratamentoNR_SEQ_PRODUTO: TStringField
      FieldName = 'NR_SEQ_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryMercTratamentoQT_MERC_UN_COMERC: TStringField
      FieldName = 'QT_MERC_UN_COMERC'
      Size = 14
    end
    object qryMercTratamentoNM_UN_MEDID_COMER: TStringField
      FieldName = 'NM_UN_MEDID_COMER'
    end
    object qryMercTratamentoVL_UNID_COND_VENDA: TStringField
      FieldName = 'VL_UNID_COND_VENDA'
      Size = 21
    end
    object qryMercTratamentoTX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
      Size = 1
    end
    object qryMercTratamentoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 15
    end
    object qryMercTratamentoNR_ITEM_DRAWBACK: TStringField
      FieldName = 'NR_ITEM_DRAWBACK'
      FixedChar = True
      Size = 3
    end
    object qryMercTratamentoQT_PROD_DRAWBACK: TStringField
      FieldName = 'QT_PROD_DRAWBACK'
      FixedChar = True
      Size = 14
    end
    object qryMercTratamentoVL_PROD_DRAWBACK: TStringField
      FieldName = 'VL_PROD_DRAWBACK'
      FixedChar = True
      Size = 15
    end
  end
  object dspMercTratamento: TDataSetProvider
    DataSet = qryMercTratamento
    Options = [poRetainServerOrder, poUseQuoteChar]
    OnGetTableName = dspMercTratamentoGetTableName
    Left = 529
    Top = 158
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=BROKER'
      'User_Name=SA'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 296
    Top = 224
  end
  object FDQryDestaqueNCM: TFDQuery
    Connection = FDConnection1
    Left = 416
    Top = 224
  end
  object FDQryOpeTratamento: TFDQuery
    Connection = FDConnection1
    Left = 528
    Top = 216
  end
  object FDQryMercTratamento: TFDQuery
    Connection = FDConnection1
    Left = 640
    Top = 224
  end
end
