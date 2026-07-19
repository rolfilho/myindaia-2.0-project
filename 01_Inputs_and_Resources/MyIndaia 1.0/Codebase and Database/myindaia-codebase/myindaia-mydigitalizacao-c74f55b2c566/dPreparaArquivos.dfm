object dtmMyDigPreparaArquivos: TdtmMyDigPreparaArquivos
  OldCreateOrder = False
  Left = 334
  Top = 66
  Height = 353
  Width = 404
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsArquivos
    UserName = 'DBPipeline1'
    Left = 40
    Top = 184
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'FileName'
      FieldName = 'FileName'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object memArquivos: TMemoryTable
    Left = 144
    Top = 120
    object memArquivosFileName: TStringField
      FieldName = 'FileName'
      Size = 1000
    end
  end
  object qryImagens: TADOQuery
    Connection = dtmMyIndaiaDigitalizacao.Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end
      item
        Name = 'ID_TABELA'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'NM_ARQUIVO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CASE RIGHT(RTRIM(P.PATH_DIGITALIZACAO), 1)'
      '           WHEN '#39'\'#39' THEN RTRIM(P.PATH_DIGITALIZACAO)'
      '       ELSE RTRIM(P.PATH_DIGITALIZACAO) + '#39'\'#39
      
        '       END + ST.NAME + '#39'\'#39' + PD.NR_PROCESSO + '#39'\'#39' + PD.NM_ARQUIV' +
        'O AS NM_ARQUIVO,'
      '       PD.CD_TIPO_DOCTO,'
      '       CASE ISNULL(PD.NM_ARQUIVO_PAI, '#39#39')'
      '           WHEN '#39#39' THEN PD.NM_ARQUIVO'
      '       ELSE PD.NM_ARQUIVO_PAI'
      '      END AS NM_ARQUIVO_PAI, TDD.NM_TIPO_DOCTO, PD.NM_DESCRICAO'
      'FROM TPROCESSO_DOCTOS             PD  (NOLOCK)'
      
        'INNER JOIN TTP_DOCTO_DIGITALIZADO TDD (NOLOCK)ON TDD.CD_TIPO_DOC' +
        'TO = PD.CD_TIPO_DOCTO'
      
        '                                             AND TDD.ID_TABELA  ' +
        '   = PD.ID_TABELA'
      
        '   INNER JOIN SYS.TABLES          ST          ON ST.OBJECT_ID   ' +
        '   = PD.ID_TABELA,'
      '   TPARAMETROS                    P  (NOLOCK)'
      'WHERE PD.NR_PROCESSO = :NR_PROCESSO'
      '  AND PD.ID_TABELA   = :ID_TABELA'
      '  AND :NM_ARQUIVO IN (PD.NM_ARQUIVO, PD.NM_ARQUIVO_PAI)'
      '  AND IN_ATIVO       = '#39'1'#39
      '  AND RIGHT(RTRIM(PD.NM_ARQUIVO), 3) IN ('#39'TIF'#39', '#39'JPG'#39', '#39'BMP'#39')'
      'ORDER BY 3, 1')
    Left = 56
    Top = 16
    object qryImagensNM_ARQUIVO: TWideStringField
      FieldName = 'NM_ARQUIVO'
      ReadOnly = True
      Size = 415
    end
    object qryImagensCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
    object qryImagensNM_ARQUIVO_PAI: TStringField
      FieldName = 'NM_ARQUIVO_PAI'
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object qryImagensNM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      Size = 100
    end
    object qryImagensNM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      FixedChar = True
      Size = 80
    end
  end
  object dsArquivos: TDataSource
    DataSet = memArquivos
    Left = 144
    Top = 184
  end
  object qryOutros: TADOQuery
    Connection = dtmMyIndaiaDigitalizacao.Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end
      item
        Name = 'ID_TABELA'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'NM_ARQUIVO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CASE RIGHT(RTRIM(P.PATH_DIGITALIZACAO), 1)'
      '           WHEN '#39'\'#39' THEN RTRIM(P.PATH_DIGITALIZACAO)'
      '       ELSE RTRIM(P.PATH_DIGITALIZACAO) + '#39'\'#39
      
        '       END + ST.NAME + '#39'\'#39' + PD.NR_PROCESSO + '#39'\'#39' + PD.NM_ARQUIV' +
        'O AS NM_ARQUIVO,'
      '       PD.CD_TIPO_DOCTO,'
      '       CASE ISNULL(PD.NM_ARQUIVO_PAI, '#39#39')'
      '           WHEN '#39#39' THEN PD.NM_ARQUIVO'
      '       ELSE PD.NM_ARQUIVO_PAI'
      '      END AS NM_ARQUIVO_PAI, TDD.NM_TIPO_DOCTO, PD.NM_DESCRICAO'
      'FROM TPROCESSO_DOCTOS             PD  (NOLOCK)'
      
        'INNER JOIN TTP_DOCTO_DIGITALIZADO TDD (NOLOCK)ON TDD.CD_TIPO_DOC' +
        'TO = PD.CD_TIPO_DOCTO'
      
        '                                     AND TDD.ID_TABELA     = PD.' +
        'ID_TABELA'
      
        '   INNER JOIN SYS.TABLES          ST  ON ST.OBJECT_ID      = PD.' +
        'ID_TABELA,'
      '   TPARAMETROS P'
      'WHERE PD.NR_PROCESSO = :NR_PROCESSO'
      '  AND PD.ID_TABELA   = :ID_TABELA'
      '  AND :NM_ARQUIVO IN (PD.NM_ARQUIVO, PD.NM_ARQUIVO_PAI)'
      '  AND IN_ATIVO       = '#39'1'#39
      
        '  AND RIGHT(RTRIM(PD.NM_ARQUIVO), 3) NOT IN ('#39'TIF'#39', '#39'JPG'#39', '#39'BMP'#39 +
        ')'
      'ORDER BY 3, 1'
      '')
    Left = 120
    Top = 16
    object qryOutrosNM_ARQUIVO: TWideStringField
      FieldName = 'NM_ARQUIVO'
      ReadOnly = True
      Size = 415
    end
    object qryOutrosCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
    object qryOutrosNM_ARQUIVO_PAI: TStringField
      FieldName = 'NM_ARQUIVO_PAI'
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object qryOutrosNM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      Size = 100
    end
    object qryOutrosNM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      FixedChar = True
      Size = 80
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 1000
    PrinterSetup.mmMarginLeft = 1000
    PrinterSetup.mmMarginRight = 1000
    PrinterSetup.mmMarginTop = 1000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\digitalizacao.rtm'
    Units = utMillimeters
    DeviceType = 'ArchiveFile'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 40
    Top = 120
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 295276
      mmPrintPosition = 0
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = True
        Stretch = True
        mmHeight = 295000
        mmLeft = 0
        mmTop = 0
        mmWidth = 208000
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'FileName'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 2646
        mmWidth = 106627
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryLinks: TADOQuery
    Connection = dtmMyIndaiaDigitalizacao.Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = '0101IM-1000-11'
      end
      item
        Name = 'ID_TABELA'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'NM_ARQUIVO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = 'EXLI1.PDF'
      end>
    SQL.Strings = (
      
        'SELECT '#39'http://www.myindaiaweb.com.br/redireciona_doc.asp?cod='#39' ' +
        '+ '
      
        '        MASTER.DBO.FN_CRIPROGRAFA('#39'docs_novo/'#39' + RTRIM(NR_PROCES' +
        'SO) + '#39'/'#39' + RTRIM(NM_ARQUIVO)) AS NM_LINK,'
      '       RTRIM(TDD.NM_TIPO_DOCTO) + '#39'_'#39' + '
      
        '       CONVERT(VARCHAR, DENSE_RANK() OVER(PARTITION BY TDD.NM_TI' +
        'PO_DOCTO ORDER BY PD.NM_ARQUIVO_PAI DESC, PD.NM_ARQUIVO)) AS NM_' +
        'ARQUIVO,'
      '       RTRIM(TDD.NM_TIPO_DOCTO) AS NM_TIPO_DOCTO'
      'FROM TPROCESSO_DOCTOS             PD  (NOLOCK)'
      
        'INNER JOIN TTP_DOCTO_DIGITALIZADO TDD (NOLOCK) ON TDD.CD_TIPO_DO' +
        'CTO = PD.CD_TIPO_DOCTO'
      
        '                                              AND TDD.ID_TABELA ' +
        '    = PD.ID_TABELA'
      
        '   INNER JOIN SYS.TABLES          ST           ON ST.OBJECT_ID =' +
        ' PD.ID_TABELA,'
      '   TPARAMETROS P'
      'WHERE PD.NR_PROCESSO = :NR_PROCESSO'
      '  AND PD.ID_TABELA   = :ID_TABELA'
      '  AND :NM_ARQUIVO IN (PD.NM_ARQUIVO, PD.NM_ARQUIVO_PAI)'
      '  AND IN_ATIVO       = '#39'1'#39
      'ORDER BY PD.NM_ARQUIVO_PAI, PD.NM_ARQUIVO')
    Left = 192
    Top = 16
    object qryLinksNM_LINK: TStringField
      FieldName = 'NM_LINK'
      ReadOnly = True
      Size = 1047
    end
    object qryLinksNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      ReadOnly = True
      Size = 131
    end
    object qryLinksNM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      ReadOnly = True
      Size = 100
    end
  end
end
