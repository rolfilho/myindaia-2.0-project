object frmMyParametrizacaoLI: TfrmMyParametrizacaoLI
  Left = 0
  Top = 0
  Caption = 'Parametriza'#231#227'o LI Web'
  ClientHeight = 453
  ClientWidth = 743
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
    Top = 432
    Width = 743
    Height = 21
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object pnlStatusMensagem: TPanel
      Left = 102
      Top = 2
      Width = 539
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
      Left = 641
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
    Top = 31
    Width = 743
    Height = 401
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
    Width = 743
    Height = 31
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      743
      31)
    object btnPreencheLI: TSpeedButton
      Left = 4
      Top = 3
      Width = 148
      Height = 23
      AllowAllUp = True
      Caption = '     Preenchimento de LI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnPreencheLIClick
    end
    object Label1: TLabel
      Left = 551
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
      ExplicitLeft = 728
    end
    object lblTempoRestante: TLabel
      Left = 672
      Top = 8
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = '00:10'
      ExplicitLeft = 849
    end
    object Image1: TImage
      Left = 711
      Top = 3
      Width = 24
      Height = 24
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Stretch = True
      ExplicitLeft = 888
    end
    object btnRecuperaLI: TSpeedButton
      Left = 174
      Top = 3
      Width = 138
      Height = 23
      AllowAllUp = True
      Caption = '     Recupera'#231#227'o de LI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnRecuperaLIClick
    end
    object chkPreencheLI: TCheckBox
      Left = 9
      Top = 6
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
    object chkRecuperaLI: TCheckBox
      Left = 182
      Top = 6
      Width = 17
      Height = 17
      Hint = 'Executar Extrato de DI'
      Caption = 'Derrubar Despachante'
      Checked = True
      State = cbChecked
      TabOrder = 1
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
  object FDQuery1: TFDQuery
    Left = 664
    Top = 280
  end
end
