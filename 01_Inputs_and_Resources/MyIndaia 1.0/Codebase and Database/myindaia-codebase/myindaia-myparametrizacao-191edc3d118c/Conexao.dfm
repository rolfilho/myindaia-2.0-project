object dtmMyParametrizacao: TdtmMyParametrizacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 372
  Width = 688
  object Connection: TSQLConnection
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
    Connected = True
    Left = 32
    Top = 8
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Connection
    Left = 104
    Top = 8
  end
  object qryExtratoDI: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT P.CD_UNID_NEG,'
      '       P.NR_PROCESSO,'
      '       ISNULL(DI.NR_DECLARACAO_IMP, P.NR_DI) AS NR_DI,'
      
        '       ISNULL(CH.DT_VALID_CRED_RF, DATEADD(YEAR, 1, GETDATE())) ' +
        'AS DT_VALID_CRED_RF,'
      '       E.AP_EMPRESA'
      'FROM TPROCESSO P (NOLOCK)'
      
        '   LEFT  JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCES' +
        'SO = P.NR_PROCESSO'
      
        '   INNER JOIN TFOLLOWUP F (NOLOCK) ON F.NR_PROCESSO = P.NR_PROCE' +
        'SSO AND F.CD_EVENTO = '#39'636'#39
      
        '   INNER JOIN TFOLLOWUP F2 (NOLOCK) ON F2.NR_PROCESSO = P.NR_PRO' +
        'CESSO AND F2.CD_EVENTO = '#39'021'#39
      
        '   LEFT  JOIN TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE ' +
        '= P.CD_CLIENTE AND CH.CD_PRODUTO = P.CD_PRODUTO AND CH.CD_UNID_N' +
        'EG = P.CD_UNID_NEG AND CH.IN_ATIVO = 1'
      
        '   INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = P.CD_CLI' +
        'ENTE'
      'WHERE ISNULL(P.NR_DI, '#39#39') <> '#39#39
      '  AND F.DT_REALIZACAO IS NULL'
      
        '  AND CONVERT(DATETIME, CONVERT(VARCHAR, F2.DT_REALIZACAO, 103),' +
        ' 103) >= CONVERT(DATETIME, '#39'15/09/2010'#39', 103)'
      '  AND P.IN_CANCELADO = '#39'0'#39
      '  AND P.CD_PRODUTO = '#39'01'#39
      '  AND P.CD_GRUPO NOT IN ('#39'A80'#39')'
      '  AND ISNULL(P.CD_DUIMP, '#39#39') = '#39#39
      '  --AND DI.NR_DECLARACAO_IMP = '#39'1413803514'#39
      
        '  --AND ISNULL(DI.NR_DECLARACAO_IMP, P.NR_DI) NOT IN ('#39'14/123456' +
        '7-8'#39', '#39'1412345678'#39')'
      'ORDER BY P.CD_UNID_NEG, P.DT_ABERTURA DESC')
    SQLConnection = Connection
    Left = 48
    Top = 152
    object qryExtratoDICD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryExtratoDINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryExtratoDINR_DI: TStringField
      FieldName = 'NR_DI'
      FixedChar = True
      Size = 10
    end
    object qryExtratoDIDT_VALID_CRED_RF: TSQLTimeStampField
      FieldName = 'DT_VALID_CRED_RF'
    end
    object qryExtratoDIAP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
  end
  object dspExtratoDI: TDataSetProvider
    DataSet = qryExtratoDI
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 160
    Top = 152
  end
  object cdsExtratoDI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExtratoDI'
    AfterPost = cdsDigitalizacaoAfterPost
    OnCalcFields = cdsExtratoDICalcFields
    Left = 272
    Top = 152
    object cdsExtratoDICD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsExtratoDINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsExtratoDINR_DI: TStringField
      FieldName = 'NR_DI'
      FixedChar = True
      Size = 10
    end
    object cdsExtratoDIDT_VALID_CRED_RF: TSQLTimeStampField
      FieldName = 'DT_VALID_CRED_RF'
    end
    object cdsExtratoDIAP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object cdsExtratoDINR_DI_FORMATADA: TStringField
      FieldKind = fkCalculated
      FieldName = 'NR_DI_FORMATADA'
      Size = 15
      Calculated = True
    end
  end
  object qryTipoDocumento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM TDOC_INSTRUCAO_DESPACHO')
    SQLConnection = Connection
    Left = 400
    Top = 80
    object qryTipoDocumentoCODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 2
    end
    object qryTipoDocumentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 120
    end
    object qryTipoDocumentoTX_DECL_ADIC: TStringField
      FieldName = 'TX_DECL_ADIC'
      FixedChar = True
      Size = 24
    end
  end
  object dspTipoDocumento: TDataSetProvider
    DataSet = qryTipoDocumento
    Left = 504
    Top = 80
  end
  object cdsTipoDocumento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoDocumento'
    AfterPost = cdsDigitalizacaoAfterPost
    OnCalcFields = cdsExtratoDICalcFields
    Left = 608
    Top = 80
    object cdsTipoDocumentoCODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 2
    end
    object cdsTipoDocumentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 120
    end
    object cdsTipoDocumentoTX_DECL_ADIC: TStringField
      FieldName = 'TX_DECL_ADIC'
      FixedChar = True
      Size = 24
    end
  end
  object qryDigitalizacao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM TPROCESSO_DOCTOS'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    SQLConnection = Connection
    Left = 400
    Top = 136
    object qryDigitalizacaoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qryDigitalizacaoCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
    object qryDigitalizacaoNM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      Size = 200
    end
    object qryDigitalizacaoNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Required = True
      FixedChar = True
      Size = 15
    end
    object qryDigitalizacaoCD_USUARIO_CRIACAO: TStringField
      FieldName = 'CD_USUARIO_CRIACAO'
      FixedChar = True
      Size = 4
    end
    object qryDigitalizacaoDT_CRIACAO: TSQLTimeStampField
      FieldName = 'DT_CRIACAO'
    end
    object qryDigitalizacaoCD_USUARIO_ALT: TStringField
      FieldName = 'CD_USUARIO_ALT'
      FixedChar = True
      Size = 4
    end
    object qryDigitalizacaoDT_ALT: TSQLTimeStampField
      FieldName = 'DT_ALT'
    end
    object qryDigitalizacaoIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qryDigitalizacaoNM_ARQUIVO_PAI: TStringField
      FieldName = 'NM_ARQUIVO_PAI'
      FixedChar = True
      Size = 15
    end
    object qryDigitalizacaoNM_MOTIVO_ALTERACAO: TStringField
      FieldName = 'NM_MOTIVO_ALTERACAO'
      Size = 255
    end
    object qryDigitalizacaoID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
  end
  object dspDigitalizacao: TDataSetProvider
    DataSet = qryDigitalizacao
    Left = 504
    Top = 136
  end
  object cdsDigitalizacao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDigitalizacao'
    AfterPost = cdsDigitalizacaoAfterPost
    Left = 608
    Top = 136
    object cdsDigitalizacaoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object cdsDigitalizacaoCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
    object cdsDigitalizacaoNM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      Size = 200
    end
    object cdsDigitalizacaoNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Required = True
      FixedChar = True
      Size = 15
    end
    object cdsDigitalizacaoCD_USUARIO_CRIACAO: TStringField
      FieldName = 'CD_USUARIO_CRIACAO'
      FixedChar = True
      Size = 4
    end
    object cdsDigitalizacaoDT_CRIACAO: TSQLTimeStampField
      FieldName = 'DT_CRIACAO'
    end
    object cdsDigitalizacaoCD_USUARIO_ALT: TStringField
      FieldName = 'CD_USUARIO_ALT'
      FixedChar = True
      Size = 4
    end
    object cdsDigitalizacaoDT_ALT: TSQLTimeStampField
      FieldName = 'DT_ALT'
    end
    object cdsDigitalizacaoIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsDigitalizacaoNM_ARQUIVO_PAI: TStringField
      FieldName = 'NM_ARQUIVO_PAI'
      FixedChar = True
      Size = 15
    end
    object cdsDigitalizacaoNM_MOTIVO_ALTERACAO: TStringField
      FieldName = 'NM_MOTIVO_ALTERACAO'
      Size = 255
    end
    object cdsDigitalizacaoID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
  end
  object qryExtratoCI: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT PR.CD_UNID_NEG,'
      '       PR.NR_PROCESSO,'
      '       PR.NR_DI'
      'FROM TPROCESSO PR'
      
        '   INNER JOIN TFOLLOWUP F035  ON F035.NR_PROCESSO = PR.NR_PROCES' +
        'SO'
      '                          AND F035.CD_EVENTO = '#39'035'#39
      '                          AND F035.DT_REALIZACAO IS NULL'
      
        '   INNER JOIN TFOLLOWUP F088 ON F088.NR_PROCESSO = PR.NR_PROCESS' +
        'O'
      '                            AND F088.CD_EVENTO = '#39'088'#39
      
        '                            AND CONVERT(DATETIME, CONVERT(VARCHA' +
        'R, F088.DT_REALIZACAO, 103), 103) >= CONVERT(DATETIME, '#39'15/09/20' +
        '10'#39', 103)'
      'WHERE ISNULL(PR.NR_DI, '#39#39') <> '#39#39
      '  AND PR.CD_GRUPO NOT IN ('#39'A80'#39')'
      '  AND PR.IN_CANCELADO = '#39'0'#39
      '  AND ISNULL(PR.CD_DUIMP, '#39#39') = '#39#39
      '  --AND PR.NR_PROCESSO = '#39'0101IM-009898-14'#39
      '  --AND PR.NR_DI NOT IN ('#39'14/1234567-8'#39', '#39'1412345678'#39')'
      'ORDER BY PR.CD_UNID_NEG, PR.NR_DI')
    SQLConnection = Connection
    Left = 48
    Top = 208
    object qryExtratoCICD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryExtratoCINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryExtratoCINR_DI: TStringField
      FieldName = 'NR_DI'
      FixedChar = True
      Size = 10
    end
  end
  object dspExtratoCI: TDataSetProvider
    DataSet = qryExtratoCI
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 160
    Top = 208
  end
  object cdsExtratoCI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExtratoCI'
    AfterPost = cdsDigitalizacaoAfterPost
    OnCalcFields = cdsExtratoDICalcFields
    Left = 272
    Top = 208
    object cdsExtratoCICD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsExtratoCINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsExtratoCINR_DI: TStringField
      FieldName = 'NR_DI'
      FixedChar = True
      Size = 10
    end
    object cdsExtratoCINR_DI_FORMATADA: TStringField
      FieldKind = fkCalculated
      FieldName = 'NR_DI_FORMATADA'
      Size = 15
      Calculated = True
    end
  end
  object qryProcessosTerminal: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT P.CD_UNID_NEG,'
      '       P.NR_PROCESSO,'
      
        '       CASE WHEN ISNULL(P.NR_CONHECIMENTO_MASTER, '#39#39') = '#39#39' THEN ' +
        'P.NR_CONHECIMENTO ELSE RTRIM(LTRIM(P.NR_CONHECIMENTO_MASTER)) EN' +
        'D '#39'MASTER'#39','
      
        '       CASE WHEN ISNULL(P.NR_CONHECIMENTO_MASTER, '#39#39') = '#39#39' THEN ' +
        #39#39' ELSE P.NR_CONHECIMENTO END '#39'HOUSE'#39
      'FROM TPROCESSO      P'
      '   INNER JOIN VW_SERVICO_GERAL S ON S.CD_SERVICO = P.CD_SERVICO'
      
        '   INNER JOIN TFOLLOWUP        F012 ON F012.NR_PROCESSO = P.NR_P' +
        'ROCESSO'
      '                                   AND F012.CD_EVENTO = '#39'012'#39
      
        '   INNER JOIN TFOLLOWUP        F088 ON F088.NR_PROCESSO = P.NR_P' +
        'ROCESSO'
      '                                   AND F088.CD_EVENTO = '#39'088'#39
      
        '                                   AND F088.DT_REALIZACAO IS NUL' +
        'L'
      
        'WHERE ((ISNULL(P.NR_CONHECIMENTO_MASTER, '#39#39') <> '#39#39') OR (ISNULL(P' +
        '.NR_CONHECIMENTO, '#39#39') <> '#39#39'))'
      '  AND P.IN_CANCELADO = '#39'0'#39
      '  AND P.CD_PRODUTO = '#39'01'#39
      '  AND F012.DT_REALIZACAO IS NULL'
      '  AND F012.IN_APLICAVEL = '#39'1'#39
      '  AND S.CD_VIA_TRANSPORTE = '#39'04'#39
      '  --AND P.NR_PROCESSO IN ('#39'0101IA-000609-14'#39')'
      'ORDER BY P.NR_PROCESSO')
    SQLConnection = Connection
    Left = 48
    Top = 264
    object qryProcessosTerminalCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryProcessosTerminalNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryProcessosTerminalMASTER: TStringField
      FieldName = 'MASTER'
      FixedChar = True
      Size = 30
    end
    object qryProcessosTerminalHOUSE: TStringField
      FieldName = 'HOUSE'
      FixedChar = True
      Size = 30
    end
  end
  object dspProcessosTerminal: TDataSetProvider
    DataSet = qryProcessosTerminal
    Left = 160
    Top = 264
  end
  object cdsProcessosTerminal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcessosTerminal'
    AfterPost = cdsDigitalizacaoAfterPost
    Left = 272
    Top = 264
    object cdsProcessosTerminalCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsProcessosTerminalNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsProcessosTerminalMASTER: TStringField
      FieldName = 'MASTER'
      FixedChar = True
      Size = 30
    end
    object cdsProcessosTerminalHOUSE: TStringField
      FieldName = 'HOUSE'
      FixedChar = True
      Size = 30
    end
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
    SQLConnection = Connection
    Left = 400
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
    Left = 456
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
    Left = 512
    Top = 8
  end
  object qryParametrizacao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT  P.CD_UNID_NEG,'
      '       P.NR_PROCESSO,'
      '       ISNULL(DI.NR_DECLARACAO_IMP, P.NR_DI) AS NR_DI,'
      
        '       ISNULL(CH.DT_VALID_CRED_RF, DATEADD(YEAR, 1, GETDATE())) ' +
        'AS DT_VALID_CRED_RF,'
      '       E.AP_EMPRESA'
      'FROM TPROCESSO P (NOLOCK)'
      
        '   LEFT  JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCES' +
        'SO = P.NR_PROCESSO'
      
        '   INNER JOIN TFOLLOWUP F (NOLOCK) ON F.NR_PROCESSO = P.NR_PROCE' +
        'SSO AND F.CD_EVENTO = '#39'088'#39
      
        '   INNER JOIN TFOLLOWUP F2 (NOLOCK) ON F2.NR_PROCESSO = P.NR_PRO' +
        'CESSO AND F2.CD_EVENTO = '#39'021'#39
      
        '   LEFT  JOIN TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE ' +
        '= P.CD_CLIENTE AND CH.CD_PRODUTO = P.CD_PRODUTO AND CH.CD_UNID_N' +
        'EG = P.CD_UNID_NEG AND CH.IN_ATIVO = 1'
      
        '   INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = P.CD_CLI' +
        'ENTE'
      'WHERE ISNULL(P.NR_DI, '#39#39') <> '#39#39
      '  AND F.DT_REALIZACAO IS NULL'
      
        '  AND CONVERT(DATETIME, CONVERT(VARCHAR, F2.DT_REALIZACAO, 103),' +
        ' 103) >= CONVERT(DATETIME, '#39'15/09/2010'#39', 103)'
      '  AND P.IN_CANCELADO = '#39'0'#39
      '  AND P.CD_PRODUTO = '#39'01'#39
      '  AND P.CD_GRUPO NOT IN ('#39'A80'#39')'
      '  AND ISNULL(P.CD_DUIMP, '#39#39') = '#39#39
      '--  AND DI.NR_DECLARACAO_IMP = '#39'1809815900'#39
      
        '  --AND ISNULL(DI.NR_DECLARACAO_IMP, P.NR_DI) NOT IN ('#39'14/123456' +
        '7-8'#39', '#39'1412345678'#39')'
      'ORDER BY P.CD_UNID_NEG, P.DT_ABERTURA DESC')
    SQLConnection = Connection
    Left = 48
    Top = 88
    object qryParametrizacaoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryParametrizacaoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryParametrizacaoNR_DI: TStringField
      FieldName = 'NR_DI'
      FixedChar = True
      Size = 10
    end
    object qryParametrizacaoDT_VALID_CRED_RF: TSQLTimeStampField
      FieldName = 'DT_VALID_CRED_RF'
    end
    object qryParametrizacaoAP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
  end
  object dspParametrizacao: TDataSetProvider
    DataSet = qryParametrizacao
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 160
    Top = 88
  end
  object cdsParametrizacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParametrizacao'
    AfterPost = cdsDigitalizacaoAfterPost
    OnCalcFields = cdsExtratoDICalcFields
    Left = 272
    Top = 88
    object cdsParametrizacaoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsParametrizacaoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsParametrizacaoNR_DI: TStringField
      FieldName = 'NR_DI'
      FixedChar = True
      Size = 10
    end
    object cdsParametrizacaoDT_VALID_CRED_RF: TSQLTimeStampField
      FieldName = 'DT_VALID_CRED_RF'
    end
    object cdsParametrizacaoAP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object cdsParametrizacaoNR_DI_FORMATADA: TStringField
      FieldKind = fkCalculated
      FieldName = 'NR_DI_FORMATADA'
      Size = 15
      Calculated = True
    end
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 272
    Top = 8
  end
  object qryExtratoDIComDocumentos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT '
      'P.NR_PROCESSO     '
      'FROM TPROCESSO P (NOLOCK)          '
      
        'LEFT  JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO ' +
        '= P.NR_PROCESSO    '
      
        'INNER JOIN TFOLLOWUP F (NOLOCK) ON F.NR_PROCESSO = P.NR_PROCESSO' +
        ' AND F.CD_EVENTO = '#39'636'#39' '
      
        'INNER JOIN TFOLLOWUP F2 (NOLOCK) ON F2.NR_PROCESSO = P.NR_PROCES' +
        'SO AND F2.CD_EVENTO = '#39'021'#39' '
      
        'LEFT  JOIN TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE = P' +
        '.CD_CLIENTE AND CH.CD_PRODUTO = P.CD_PRODUTO AND CH.CD_UNID_NEG ' +
        '= P.CD_UNID_NEG AND CH.IN_ATIVO = 1    '
      
        'INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = P.CD_CLIENT' +
        'E '
      
        'LEFT JOIN TPROCESSO_DOCTOS TPD (NOLOCK) ON TPD.NR_PROCESSO = P.N' +
        'R_PROCESSO AND TPD.CD_TIPO_DOCTO='#39'9'#39
      'WHERE ISNULL(P.NR_DI, '#39#39') <> '#39#39'        '
      'AND F.DT_REALIZACAO IS NULL        '
      
        'AND CONVERT(DATETIME, CONVERT(VARCHAR, F2.DT_REALIZACAO, 103),10' +
        '3) >= CONVERT(DATETIME, '#39'15/09/2010'#39', 103)        '
      'AND P.IN_CANCELADO = '#39'0'#39'        '
      'AND P.CD_PRODUTO = '#39'01'#39'        '
      'AND P.CD_GRUPO NOT IN ('#39'A80'#39')        '
      'AND  TPD.NM_ARQUIVO is not null'
      'ORDER BY P.CD_UNID_NEG, P.DT_ABERTURA DESC')
    SQLConnection = Connection
    Left = 64
    Top = 320
    object qryExtratoDIComDocumentosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
  end
end
