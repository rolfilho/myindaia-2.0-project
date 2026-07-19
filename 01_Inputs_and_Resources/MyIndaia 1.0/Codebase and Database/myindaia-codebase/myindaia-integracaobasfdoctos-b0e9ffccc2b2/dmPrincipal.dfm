object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 334
  Width = 306
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=BROKER'
      'User_Name=sa'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 39
    Top = 22
  end
  object qryArquivosProcessos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT DISTINCT'
      'TP.NR_PROCESSO'
      ',EV636.DT_REALIZACAO AS DT_REALIZACAO'
      ',DOC.NM_ARQUIVO'
      ',LTRIM(RTRIM(TP.NR_DI)) + '#39'_'#39' +'
      '(CASE'
      'WHEN DOC.CD_TIPO_DOCTO = '#39'9'#39' THEN '#39'DI_'#39
      'WHEN DOC.CD_TIPO_DOCTO = '#39'14'#39' THEN '#39'DOCTOS_'#39
      'WHEN DOC.CD_TIPO_DOCTO = '#39'152'#39' THEN '#39'AFRMM_'#39
      'END ) +'
      'DOC.NM_ARQUIVO'
      ''
      'AS NOME_ARQUIVO_DESTINO'
      ''
      'FROM BROKER.DBO.TPROCESSO TP (NOLOCK)'
      ''
      
        'LEFT JOIN BROKER.DBO.TFOLLOWUP EV636 (NOLOCK) ON TP.NR_PROCESSO ' +
        '= EV636.NR_PROCESSO AND EV636.CD_EVENTO='#39'636'#39
      
        'LEFT JOIN BROKER.DBO.TPROCESSO_DOCTOS DOC (NOLOCK) ON DOC.NR_PRO' +
        'CESSO = TP.NR_PROCESSO AND DOC.CD_TIPO_DOCTO IN ('#39'9'#39','#39'14'#39','#39'152'#39')'
      ''
      'WHERE TP.CD_PRODUTO = '#39'01'#39
      'AND TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39')'
      'AND EV636.DT_REALIZACAO IS NOT NULL'
      'AND EV636.IN_APLICAVEL='#39'1'#39
      'AND EV636.IN_EDI_ENVIADO IS NULL'
      'AND CONVERT(DATE,EV636.DT_REALIZACAO) > '#39'2022-12-31'#39
      'AND DOC.IN_ATIVO='#39'1'#39
      ''
      'AND TP.NR_PROCESSO = :NR_PROCESSO')
    Left = 152
    Top = 112
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Value = '0101IA-000039-23'
      end>
    object qryArquivosProcessosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryArquivosProcessosDT_REALIZACAO: TSQLTimeStampField
      FieldName = 'DT_REALIZACAO'
      Origin = 'DT_REALIZACAO'
    end
    object qryArquivosProcessosNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Origin = 'NM_ARQUIVO'
      FixedChar = True
      Size = 15
    end
    object qryArquivosProcessosNOME_ARQUIVO_DESTINO: TStringField
      FieldName = 'NOME_ARQUIVO_DESTINO'
      Origin = 'NOME_ARQUIVO_DESTINO'
      ReadOnly = True
      Size = 31
    end
  end
  object qryFilaProcessos: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    SQL.Strings = (
      'SELECT'
      'DISTINCT'
      'TOP 50'
      'TP.NR_PROCESSO'
      'FROM BROKER.DBO.TPROCESSO TP (NOLOCK)'
      
        'LEFT JOIN BROKER.DBO.TFOLLOWUP EV636 (NOLOCK) ON TP.NR_PROCESSO ' +
        '= EV636.NR_PROCESSO AND EV636.CD_EVENTO='#39'636'#39
      
        'LEFT JOIN BROKER.DBO.TPROCESSO_DOCTOS DOC (NOLOCK) ON DOC.NR_PRO' +
        'CESSO = TP.NR_PROCESSO AND DOC.CD_TIPO_DOCTO in ( '#39'9'#39', '#39'14'#39','#39'152' +
        #39')'
      'WHERE'
      'TP.CD_PRODUTO = '#39'01'#39
      'AND TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39')'
      'AND EV636.DT_REALIZACAO IS NOT NULL'
      'AND EV636.IN_APLICAVEL='#39'1'#39
      'AND EV636.IN_EDI_ENVIADO IS NULL'
      'AND CONVERT(DATE,EV636.DT_REALIZACAO) > '#39'2022-12-31'#39
      '--AND TP.NR_PROCESSO = '#39'0101IA-000101-23'#39)
    Left = 42
    Top = 113
    object qryFilaProcessosNR_PROCESSO: TStringField
      DisplayLabel = 'N'#250'mero Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
  end
  object qryAtualizaEvento636: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'UPDATE TFOLLOWUP SET IN_EDI_ENVIADO = :IN_EDI_ENVIADO WHERE NR_P' +
        'ROCESSO = :NR_PROCESSO AND CD_EVENTO = '#39'636'#39)
    Left = 168
    Top = 185
    ParamData = <
      item
        Name = 'IN_EDI_ENVIADO'
        ParamType = ptInput
      end
      item
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 144
    Top = 48
  end
end
