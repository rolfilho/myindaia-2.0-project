object frmMyConsultaLiLote: TfrmMyConsultaLiLote
  Left = 0
  Top = 0
  Caption = 'Consulta LI em lote'
  ClientHeight = 665
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlStatus: TPanel
    Left = 0
    Top = 644
    Width = 793
    Height = 21
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object pnlStatusMensagem: TPanel
      Left = 102
      Top = 2
      Width = 589
      Height = 17
      Align = alClient
      Alignment = taLeftJustify
      BevelEdges = [beLeft, beRight]
      BevelKind = bkFlat
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
    end
    object pnlStatusAndamento: TPanel
      Left = 2
      Top = 2
      Width = 100
      Height = 17
      Align = alLeft
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
    end
    object pnlVersao: TPanel
      Left = 691
      Top = 2
      Width = 100
      Height = 17
      Hint = 'Vers'#227'o'
      Align = alRight
      BevelOuter = bvNone
      Caption = '1.00.00'
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object reLog: TRichEdit
    Left = 0
    Top = 71
    Width = 793
    Height = 573
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    Zoom = 100
    OnChange = reLogChange
  end
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 71
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      793
      71)
    object btnConsultaLote: TSpeedButton
      Left = 2
      Top = 13
      Width = 183
      Height = 36
      AllowAllUp = True
      Caption = '     Iniciar Consulta em Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnConsultaLoteClick
    end
    object Label1: TLabel
      Left = 577
      Top = 8
      Width = 116
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pr'#243'xima Integra'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTempoRestante: TLabel
      Left = 698
      Top = 8
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = '00:10'
    end
    object Image1: TImage
      Left = 761
      Top = 3
      Width = 24
      Height = 24
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Stretch = True
      ExplicitLeft = 888
    end
    object lblStatus: TLabel
      Left = 578
      Top = 24
      Width = 41
      Height = 13
      Caption = 'lblStatus'
    end
    object chkConsultaLiLote: TCheckBox
      Left = 14
      Top = 23
      Width = 16
      Height = 18
      Hint = 'Executar Parametriza'#231#227'o'
      Caption = 'Derrubar Despachante'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 448
      Top = 3
      Width = 118
      Height = 65
      Caption = 'Para testes individuais '
      TabOrder = 1
      Visible = False
      object Button2: TButton
        Left = 10
        Top = 45
        Width = 100
        Height = 18
        Caption = 'Ler xml'
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button1: TButton
        Left = 10
        Top = 28
        Width = 100
        Height = 18
        Caption = 'Gera xml consulta'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button4: TButton
        Left = 10
        Top = 11
        Width = 100
        Height = 18
        Caption = 'Iniciar Consulta'
        TabOrder = 2
        OnClick = Button4Click
      end
    end
    object ProgressBar1: TProgressBar
      Left = 577
      Top = 39
      Width = 208
      Height = 17
      TabOrder = 2
    end
    object GroupBox2: TGroupBox
      Left = 232
      Top = 3
      Width = 185
      Height = 60
      Caption = ' Hor'#225'rio de funcionamento '
      TabOrder = 3
      object Label2: TLabel
        Left = 8
        Top = 16
        Width = 25
        Height = 13
        Caption = 'In'#237'cio'
      end
      object Label3: TLabel
        Left = 85
        Top = 16
        Width = 16
        Height = 13
        Caption = 'Fim'
      end
      object edtHoraInicio: TEdit
        Left = 7
        Top = 32
        Width = 60
        Height = 21
        TabOrder = 0
      end
      object edtHoraFim: TEdit
        Left = 84
        Top = 32
        Width = 60
        Height = 21
        TabOrder = 1
      end
    end
  end
  object tmrIntegracao: TTimer
    OnTimer = tmrIntegracaoTimer
    Left = 472
    Top = 120
  end
  object tmrCertificado: TTimer
    OnTimer = tmrCertificadoTimer
    Left = 480
    Top = 216
  end
  object XMLDocument: TXMLDocument
    ParseOptions = [poResolveExternals, poValidateOnParse]
    Left = 264
    Top = 248
  end
end
