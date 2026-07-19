object dtmMyParametrizacaoLIConsulta: TdtmMyParametrizacaoLIConsulta
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
      'HostName=indaia10'
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
    SQLConnection = Connection
    Left = 104
    Top = 8
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
    OnCalcFields = cdsExtratoLICalcFields
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
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT LI.*,'
      '       P.CD_UNID_NEG, '
      '       SUBSTRING(LI.NR_LI, 1,2) + '#39'/'#39' + '
      '       SUBSTRING(LI.NR_LI, 3,7) + '#39'-'#39' + '
      '       SUBSTRING(LI.NR_LI, 10,1) LI_FORMATADA,'
      '       U.NM_EMAIL,'
      '       E.NM_EMPRESA, '
      
        '       G.NM_EMAIL_CONSULTA_LI, LI.DT_CONSULTA_SCX, LI.DT_ULT_MUD' +
        'ANCA_STATUS'
      'FROM TPROCESSO_LI         LI (NOLOCK)'
      
        '  INNER JOIN TPROCESSO    P  (NOLOCK) ON P.NR_PROCESSO = LI.NR_P' +
        'ROCESSO'
      ' CROSS APPLY (SELECT E1.NM_EMPRESA'
      '                FROM TEMPRESA_NAC E1 (NOLOCK) '
      '               WHERE E1.CD_EMPRESA = P.CD_CLIENTE ) E'
      ' CROSS APPLY ( SELECT G1.NM_EMAIL_CONSULTA_LI             '
      '                 FROM TGRUPO G1 (NOLOCK)                  '
      '                WHERE G1.CD_GRUPO = P.CD_GRUPO ) G        '
      
        '  LEFT  JOIN TUSUARIO     U  (NOLOCK) ON U.CD_USUARIO  = P.CD_AN' +
        'ALISTA_COMISSARIA'
      ''
      'WHERE P.IN_CANCELADO  = '#39'0'#39'          '
      '  AND LI.IN_CANCELADO = '#39'0'#39
      '  AND ISNULL(LI.IN_LPCO, '#39'0'#39') = '#39'0'#39)
    SQLConnection = Connection
    Left = 48
    Top = 88
    object qryParametrizacaoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryParametrizacaoNR_LI: TStringField
      FieldName = 'NR_LI'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryParametrizacaoDT_REGISTRO: TSQLTimeStampField
      FieldName = 'DT_REGISTRO'
    end
    object qryParametrizacaoDT_DEFERIMENTO: TSQLTimeStampField
      FieldName = 'DT_DEFERIMENTO'
    end
    object qryParametrizacaoDT_VENCTO: TSQLTimeStampField
      FieldName = 'DT_VENCTO'
    end
    object qryParametrizacaoIN_SUBSTITUIDA: TStringField
      FieldName = 'IN_SUBSTITUIDA'
      FixedChar = True
      Size = 1
    end
    object qryParametrizacaoNR_SUBSTITUIDA: TStringField
      FieldName = 'NR_SUBSTITUIDA'
      FixedChar = True
      Size = 10
    end
    object qryParametrizacaoIN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qryParametrizacaoTX_OBS_CANC: TMemoField
      FieldName = 'TX_OBS_CANC'
      BlobType = ftMemo
      Size = 1
    end
    object qryParametrizacaoIN_UTILIZADO: TStringField
      FieldName = 'IN_UTILIZADO'
      FixedChar = True
      Size = 1
    end
    object qryParametrizacaoIN_SEM_REPRESENTACAO: TStringField
      FieldName = 'IN_SEM_REPRESENTACAO'
      FixedChar = True
      Size = 1
    end
    object qryParametrizacaoIN_LI_PRE_JA_EMBARCADO: TStringField
      FieldName = 'IN_LI_PRE_JA_EMBARCADO'
      FixedChar = True
      Size = 1
    end
    object qryParametrizacaoDT_CONSULTA_SCX: TSQLTimeStampField
      FieldName = 'DT_CONSULTA_SCX'
    end
    object qryParametrizacaoIN_FILA_RECUPERAR: TStringField
      FieldName = 'IN_FILA_RECUPERAR'
      FixedChar = True
      Size = 1
    end
    object qryParametrizacaoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryParametrizacaoLI_FORMATADA: TStringField
      FieldName = 'LI_FORMATADA'
      Size = 12
    end
    object qryParametrizacaoNM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Size = 2000
    end
    object qryParametrizacaoNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 80
    end
    object qryParametrizacaoNM_EMAIL_CONSULTA_LI: TStringField
      DisplayWidth = 1000
      FieldName = 'NM_EMAIL_CONSULTA_LI'
      Size = 600
    end
    object qryParametrizacaoDT_CONSULTA_SCX_1: TSQLTimeStampField
      FieldName = 'DT_CONSULTA_SCX_1'
    end
    object qryParametrizacaoDT_ULT_MUDANCA_STATUS_1: TSQLTimeStampField
      FieldName = 'DT_ULT_MUDANCA_STATUS_1'
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
    OnCalcFields = cdsExtratoLICalcFields
    Left = 272
    Top = 88
    object cdsParametrizacaoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsParametrizacaoNR_LI: TStringField
      FieldName = 'NR_LI'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsParametrizacaoDT_REGISTRO: TSQLTimeStampField
      FieldName = 'DT_REGISTRO'
    end
    object cdsParametrizacaoDT_DEFERIMENTO: TSQLTimeStampField
      FieldName = 'DT_DEFERIMENTO'
    end
    object cdsParametrizacaoDT_VENCTO: TSQLTimeStampField
      FieldName = 'DT_VENCTO'
    end
    object cdsParametrizacaoIN_SUBSTITUIDA: TStringField
      FieldName = 'IN_SUBSTITUIDA'
      FixedChar = True
      Size = 1
    end
    object cdsParametrizacaoNR_SUBSTITUIDA: TStringField
      FieldName = 'NR_SUBSTITUIDA'
      FixedChar = True
      Size = 10
    end
    object cdsParametrizacaoIN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object cdsParametrizacaoTX_OBS_CANC: TMemoField
      FieldName = 'TX_OBS_CANC'
      BlobType = ftMemo
      Size = 1
    end
    object cdsParametrizacaoIN_UTILIZADO: TStringField
      FieldName = 'IN_UTILIZADO'
      FixedChar = True
      Size = 1
    end
    object cdsParametrizacaoIN_SEM_REPRESENTACAO: TStringField
      FieldName = 'IN_SEM_REPRESENTACAO'
      FixedChar = True
      Size = 1
    end
    object cdsParametrizacaoIN_LI_PRE_JA_EMBARCADO: TStringField
      FieldName = 'IN_LI_PRE_JA_EMBARCADO'
      FixedChar = True
      Size = 1
    end
    object cdsParametrizacaoDT_CONSULTA_SCX: TSQLTimeStampField
      FieldName = 'DT_CONSULTA_SCX'
    end
    object cdsParametrizacaoIN_FILA_RECUPERAR: TStringField
      FieldName = 'IN_FILA_RECUPERAR'
      FixedChar = True
      Size = 1
    end
    object cdsParametrizacaoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsParametrizacaoLI_FORMATADA: TStringField
      FieldName = 'LI_FORMATADA'
      Size = 12
    end
    object cdsParametrizacaoNM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Size = 200
    end
    object cdsParametrizacaoNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 80
    end
    object cdsParametrizacaoNM_EMAIL_CONSULTA_LI: TStringField
      DisplayWidth = 1000
      FieldName = 'NM_EMAIL_CONSULTA_LI'
      Size = 1000
    end
    object cdsParametrizacaoDT_CONSULTA_SCX_1: TSQLTimeStampField
      FieldName = 'DT_CONSULTA_SCX_1'
    end
    object cdsParametrizacaoDT_ULT_MUDANCA_STATUS_1: TSQLTimeStampField
      FieldName = 'DT_ULT_MUDANCA_STATUS_1'
    end
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 272
    Top = 8
  end
  object qryListaOrdem: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end>
    SQL.Strings = (
      
        'INSERT INTO FILA_CONSULTA_LI_ORDEM (DT_INCLUSAO, NR_PROCESSO) VA' +
        'LUES(GETDATE(), :PROCESSO)'
      'SET :ID =  (SELECT @@IDENTITY) ')
    SQLConnection = Connection
    Left = 48
    Top = 152
  end
  object qryEmail: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'processo'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'select isnull( CONVERT(VARCHAR(MAX),u.NM_EMAIL) ,'#39#39') as email'
      'from TPROCESSO pr (NOLOCK)'
      
        'join TCLIENTE_HABILITACAO ch (NOLOCK) on ch.CD_CLIENTE=pr.CD_CLI' +
        'ENTE and ch.CD_UNID_NEG=pr.CD_UNID_NEG and ch.CD_PRODUTO=pr.CD_P' +
        'RODUTO'
      'left join TUSUARIO U (NOLOCK) on u.CD_USUARIO=ch.CD_ATENDENTE'
      'where ch.IN_ATIVO=1'
      'and pr.NR_PROCESSO = :PROCESSO')
    SQLConnection = Connection
    Left = 48
    Top = 216
    object qryEmailemail: TMemoField
      FieldName = 'email'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
  end
  object qryUpdateEmailEnviado: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE TPROCESSO_LI_STATUS'
      '   SET IN_EMAIL_ENVIADO = 1'
      '  FROM TPROCESSO_LI_STATUS A (NOLOCK) '
      ' WHERE NR_PROCESSO = :NR_PROCESSO'
      
        '   AND DT_STATUS  >='#39'2018/04/17'#39'-- CONVERT(VARCHAR(10),GETDATE()' +
        ',111) + '#39' 00:00'#39
      '   AND ISNULL(IN_EMAIL_ENVIADO, 0) = 0')
    SQLConnection = Connection
    Left = 48
    Top = 272
  end
  object FDQueryDigitalizacao: TFDQuery
    Connection = FDConnection1
    Left = 448
    Top = 264
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=BROKER'
      'User_Name=sa'
      'Password=123'
      'Server=indaia10'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 560
    Top = 264
  end
end
