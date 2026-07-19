object frmMain: TfrmMain
  Left = 807
  Top = 290
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = 'MyRob'#244' Eventos  -  v.2018.09'
  ClientHeight = 452
  ClientWidth = 799
  Color = 7034429
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 799
    Height = 434
    Align = alClient
    Style = bsRaised
  end
  object SpeedButton1: TSpeedButton
    Left = 41
    Top = 49
    Width = 57
    Height = 41
  end
  object grfBar: TGauge
    Left = 153
    Top = 4
    Width = 216
    Height = 12
    BackColor = clSilver
    BorderStyle = bsNone
    Color = clSilver
    ParentColor = False
    Progress = 0
    ShowText = False
  end
  object Log: TRichEdit
    Left = 432
    Top = 39
    Width = 200
    Height = 202
    BorderWidth = 1
    Color = 7288576
    Font.Charset = ANSI_CHARSET
    Font.Color = 16751415
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    Visible = False
  end
  object stbMain: TStatusBar
    Left = 0
    Top = 434
    Width = 799
    Height = 18
    Panels = <
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Width = 220
      end
      item
        Alignment = taCenter
        Width = 180
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 434
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    Color = clWhite
    TabOrder = 0
    object Panel2: TPanel
      Left = 3
      Top = 385
      Width = 793
      Height = 46
      Align = alBottom
      TabOrder = 0
      object Label1: TLabel
        Left = 579
        Top = 5
        Width = 93
        Height = 13
        Caption = 'Codigo do Relatorio'
      end
      object edtCodigoRelatorio: TEdit
        Left = 581
        Top = 21
        Width = 94
        Height = 21
        MaxLength = 15
        TabOrder = 0
      end
      object btnTeste: TButton
        Left = 679
        Top = 17
        Width = 105
        Height = 25
        Caption = 'Gera Alerta (teste)'
        TabOrder = 1
        OnClick = btnTesteClick
      end
      object BitBtn1: TBitBtn
        Left = 10
        Top = 15
        Width = 75
        Height = 25
        Caption = 'Iniciar'
        TabOrder = 2
        OnClick = BitBtn1Click
      end
      object btnParar: TBitBtn
        Left = 89
        Top = 15
        Width = 75
        Height = 25
        Caption = 'Parar'
        TabOrder = 3
        OnClick = btnPararClick
      end
    end
    object memLog: TMemo
      Left = 3
      Top = 3
      Width = 793
      Height = 382
      Align = alClient
      Color = 8421440
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
      OnChange = memLogChange
    end
  end
  object WatchTimer: TTimer
    Interval = 60000
    OnTimer = Watch
    Left = 588
    Top = 38
  end
  object db_broker: TDatabase
    DatabaseName = 'BROKER'
    HandleShared = True
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=MYROBO'
      'PASSWORD=123')
    SessionName = 'SES_EDI'
    Left = 517
    Top = 39
  end
  object sesEDI: TSession
    SessionName = 'SES_EDI'
    Left = 647
    Top = 37
  end
  object qryVariaveis: TQuery
    DatabaseName = 'Broker'
    SQL.Strings = (
      ' SELECT '
      ' CD_CARTAS_CONFIG'
      ',LOWER(LTRIM(RTRIM(TX_CARTAS_CONFIG))) AS TX_CARTAS_CONFIG'
      ',NM_CAMPO'
      ',NM_TABELA'
      ',NM_JOIN'
      ',IN_TABELA'
      ',IN_VARIOS_REGISTROS'
      ',TP_PRODUTO'
      ',NM_SQL_MANUAL'
      ',CD_DIRECAO'
      ',TX_MASCARA'
      ',TEXT_HIPERLINK'
      ',TX_DESC '
      ' '
      ' FROM TCARTAS_CONFIG (NOLOCK)')
    Left = 692
    Top = 106
    object qryVariaveisCD_CARTAS_CONFIG: TIntegerField
      FieldName = 'CD_CARTAS_CONFIG'
      Origin = 'BROKER.TCARTAS_CONFIG.CD_CARTAS_CONFIG'
    end
    object qryVariaveisTX_CARTAS_CONFIG: TStringField
      FieldName = 'TX_CARTAS_CONFIG'
      Origin = 'BROKER.TCARTAS_CONFIG.TX_CARTAS_CONFIG'
      FixedChar = True
      Size = 50
    end
    object qryVariaveisNM_CAMPO: TStringField
      FieldName = 'NM_CAMPO'
      Origin = 'BROKER.TCARTAS_CONFIG.NM_CAMPO'
      FixedChar = True
      Size = 50
    end
    object qryVariaveisNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'BROKER.TCARTAS_CONFIG.NM_TABELA'
      FixedChar = True
      Size = 50
    end
    object qryVariaveisNM_JOIN: TStringField
      FieldName = 'NM_JOIN'
      Origin = 'BROKER.TCARTAS_CONFIG.NM_JOIN'
      FixedChar = True
      Size = 80
    end
    object qryVariaveisIN_TABELA: TStringField
      FieldName = 'IN_TABELA'
      Origin = 'BROKER.TCARTAS_CONFIG.IN_TABELA'
      FixedChar = True
      Size = 1
    end
    object qryVariaveisIN_VARIOS_REGISTROS: TStringField
      FieldName = 'IN_VARIOS_REGISTROS'
      Origin = 'BROKER.TCARTAS_CONFIG.IN_VARIOS_REGISTROS'
      FixedChar = True
      Size = 1
    end
    object qryVariaveisTP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      Origin = 'BROKER.TCARTAS_CONFIG.TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryVariaveisNM_SQL_MANUAL: TMemoField
      FieldName = 'NM_SQL_MANUAL'
      Origin = 'BROKER.TCARTAS_CONFIG.NM_SQL_MANUAL'
      BlobType = ftMemo
    end
    object qryVariaveisCD_DIRECAO: TStringField
      FieldName = 'CD_DIRECAO'
      Origin = 'BROKER.TCARTAS_CONFIG.CD_DIRECAO'
      FixedChar = True
      Size = 1
    end
    object qryVariaveisTX_MASCARA: TStringField
      FieldName = 'TX_MASCARA'
      Origin = 'BROKER.TCARTAS_CONFIG.TX_MASCARA'
      FixedChar = True
      Size = 50
    end
    object qryVariaveisTEXT_HIPERLINK: TStringField
      FieldName = 'TEXT_HIPERLINK'
      Origin = 'BROKER.TCARTAS_CONFIG.TEXT_HIPERLINK'
      FixedChar = True
      Size = 50
    end
    object qryVariaveisTX_DESC: TStringField
      FieldName = 'TX_DESC'
      Origin = 'BROKER.TCARTAS_CONFIG.TX_DESC'
      FixedChar = True
      Size = 200
    end
  end
  object cdsVariaveis: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVariaveis'
    Left = 689
    Top = 160
    object cdsVariaveisCD_CARTAS_CONFIG: TIntegerField
      FieldName = 'CD_CARTAS_CONFIG'
    end
    object cdsVariaveisTX_CARTAS_CONFIG: TStringField
      FieldName = 'TX_CARTAS_CONFIG'
      FixedChar = True
      Size = 50
    end
    object cdsVariaveisNM_CAMPO: TStringField
      FieldName = 'NM_CAMPO'
      FixedChar = True
      Size = 50
    end
    object cdsVariaveisNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      FixedChar = True
      Size = 50
    end
    object cdsVariaveisNM_JOIN: TStringField
      FieldName = 'NM_JOIN'
      FixedChar = True
      Size = 80
    end
    object cdsVariaveisIN_TABELA: TStringField
      FieldName = 'IN_TABELA'
      FixedChar = True
      Size = 1
    end
    object cdsVariaveisIN_VARIOS_REGISTROS: TStringField
      FieldName = 'IN_VARIOS_REGISTROS'
      FixedChar = True
      Size = 1
    end
    object cdsVariaveisTP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object cdsVariaveisNM_SQL_MANUAL: TMemoField
      FieldName = 'NM_SQL_MANUAL'
      BlobType = ftMemo
    end
    object cdsVariaveisCD_DIRECAO: TStringField
      FieldName = 'CD_DIRECAO'
      FixedChar = True
      Size = 1
    end
    object cdsVariaveisTX_MASCARA: TStringField
      FieldName = 'TX_MASCARA'
      FixedChar = True
      Size = 50
    end
    object cdsVariaveisTEXT_HIPERLINK: TStringField
      FieldName = 'TEXT_HIPERLINK'
      FixedChar = True
      Size = 50
    end
    object cdsVariaveisTX_DESC: TStringField
      FieldName = 'TX_DESC'
      FixedChar = True
      Size = 200
    end
  end
  object dspVariaveis: TDataSetProvider
    DataSet = qryVariaveis
    Left = 689
    Top = 213
  end
end
