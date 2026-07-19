object frmMyParametrizacaoLIConsulta: TfrmMyParametrizacaoLIConsulta
  Left = 0
  Top = 0
  Caption = 'Consulta LI'
  ClientHeight = 496
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 121
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object btnParametrizacao: TSpeedButton
      Left = 7
      Top = 4
      Width = 114
      Height = 22
      AllowAllUp = True
      Caption = '     &Parametriza'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnParametrizacaoClick
    end
    object Label2: TLabel
      Left = 267
      Top = 10
      Width = 83
      Height = 13
      Caption = 'N'#227'o Deferidas de'
    end
    object Label3: TLabel
      Left = 397
      Top = 9
      Width = 16
      Height = 13
      Caption = 'at'#233
    end
    object Label4: TLabel
      Left = 465
      Top = 10
      Width = 256
      Height = 13
      Caption = '(As deferidas ser'#227'o consultadas fora deste intervalo)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object chkParametrizacao: TCheckBox
      Left = 10
      Top = 5
      Width = 15
      Height = 19
      Hint = 'Executar Parametriza'#231#227'o'
      TabStop = False
      Caption = 'Derrubar Despachante'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 0
    end
    object meNaoDeferidasIni: TMaskEdit
      Left = 356
      Top = 6
      Width = 35
      Height = 21
      EditMask = '00:00;1;_'
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
    end
    object meNaoDeferidasFim: TMaskEdit
      Left = 418
      Top = 6
      Width = 35
      Height = 21
      EditMask = '00:00;1;_'
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
    end
    object rbTudo: TRadioButton
      Left = 138
      Top = 8
      Width = 47
      Height = 17
      Caption = 'Tudo'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = True
      OnClick = rbTudoClick
    end
    object rbHorario: TRadioButton
      Left = 192
      Top = 8
      Width = 64
      Height = 17
      Caption = 'Hor'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = rbHorarioClick
    end
    object statBarFiltro: TStatusBar
      Left = 2
      Top = 100
      Width = 727
      Height = 19
      Panels = <
        item
          Width = 200
        end
        item
          Text = 'Pr'#243'xima Intera'#231#227'o:'
          Width = 110
        end
        item
          Width = 50
        end>
    end
    object btnEnviarEmails: TBitBtn
      Left = 451
      Top = 31
      Width = 75
      Height = 25
      Caption = 'Email Status'
      TabOrder = 6
      OnClick = btnEnviarEmailsClick
    end
    object btnEmailValidade: TBitBtn
      Left = 531
      Top = 31
      Width = 83
      Height = 25
      BiDiMode = bdLeftToRight
      Caption = 'Email Validade'
      ParentBiDiMode = False
      TabOrder = 7
      OnClick = btnEmailValidadeClick
    end
    object mskHorarioEnvioEmailValidade: TMaskEdit
      Left = 617
      Top = 33
      Width = 34
      Height = 21
      EditMask = '00:00;1;_'
      MaxLength = 5
      TabOrder = 8
      Text = '10:00'
    end
    object mskDataUltEnvioEmailValidade: TMaskEdit
      Left = 657
      Top = 33
      Width = 65
      Height = 21
      Enabled = False
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 9
      Text = '  /  /    '
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 32
      Width = 299
      Height = 63
      Caption = ' Conf. de tempo de Consulta '
      TabOrder = 10
      object Label1: TLabel
        Left = 6
        Top = 23
        Width = 179
        Height = 13
        Caption = 'Intervalo por processo em segundos:'
      end
      object Label5: TLabel
        Left = 93
        Top = 45
        Width = 92
        Height = 13
        Caption = 'Processos por lote:'
      end
      object edtIntervalo: TEdit
        Left = 189
        Top = 17
        Width = 45
        Height = 21
        TabOrder = 0
      end
      object edtTotalProcessosLote: TEdit
        Left = 189
        Top = 39
        Width = 45
        Height = 21
        TabOrder = 1
      end
      object btnGravaConfTempoConsulta: TButton
        Left = 241
        Top = 33
        Width = 45
        Height = 25
        Caption = 'Grava'
        TabOrder = 2
        OnClick = btnGravaConfTempoConsultaClick
      end
    end
  end
  object pnlStatus: TPanel
    Left = 0
    Top = 475
    Width = 731
    Height = 21
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object pnlStatusMensagem: TPanel
      Left = 102
      Top = 2
      Width = 406
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
    object pnlWhere: TPanel
      Left = 508
      Top = 2
      Width = 221
      Height = 17
      Hint = 'Vers'#227'o'
      Align = alRight
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object relog: TMemo
    Left = 0
    Top = 121
    Width = 731
    Height = 354
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 2
    OnChange = reLogChange
  end
  object tmrCertificado: TTimer
    OnTimer = tmrCertificadoTimer
    Left = 56
    Top = 312
  end
  object tmrIntegracao: TTimer
    OnTimer = tmrIntegracaoTimer
    Left = 56
    Top = 104
  end
  object MadExceptionHandler1: TMadExceptionHandler
    OnException = MadExceptionHandler1Exception
    Left = 56
    Top = 360
  end
  object tmrErroWeb: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tmrErroWebTimer
    Left = 56
    Top = 168
  end
  object tmrVerificaPaginaTravada: TTimer
    Enabled = False
    Interval = 50000
    OnTimer = tmrVerificaPaginaTravadaTimer
    Left = 56
    Top = 240
  end
end
