object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Integra'#231#227'o Nestl'#233
  ClientHeight = 298
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 279
    Width = 538
    Height = 19
    Panels = <
      item
        Text = 'Pr'#243'xima itera'#231#227'o'
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object Memo: TMemo
    Left = 0
    Top = 58
    Width = 538
    Height = 221
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 1
    OnChange = MemoChange
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 58
    Align = alTop
    TabOrder = 2
    DesignSize = (
      538
      58)
    object btnSettings: TButton
      Left = 421
      Top = 7
      Width = 68
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Prefer'#234'ncias'
      TabOrder = 0
      OnClick = btnSettingsClick
    end
    object btnFechar: TButton
      Left = 490
      Top = 7
      Width = 43
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btnFecharClick
    end
    object cbxValidar: TCheckBox
      Left = 359
      Top = 11
      Width = 56
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'Validar'
      TabOrder = 2
    end
    object btnIntegracao: TButton
      Left = 5
      Top = 7
      Width = 94
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '     &Integra'#231#227'o'
      TabOrder = 3
      OnClick = btnIntegracaoClick
    end
    object chbIntegracao: TCheckBox
      Left = 13
      Top = 11
      Width = 16
      Height = 17
      Anchors = [akLeft, akBottom]
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object btnRetornoExpo: TButton
      Left = 109
      Top = 7
      Width = 104
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '    &Retorno Expo'
      TabOrder = 5
      OnClick = btnRetornoExpoClick
    end
    object chbRetornoExpo: TCheckBox
      Left = 114
      Top = 11
      Width = 16
      Height = 17
      Anchors = [akLeft, akBottom]
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object btnRetornoImpo: TButton
      Left = 222
      Top = 7
      Width = 104
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '     &Retorno Impo'
      TabOrder = 7
      OnClick = btnRetornoImpoClick
    end
    object chbRetornoImpo: TCheckBox
      Left = 228
      Top = 11
      Width = 16
      Height = 17
      Anchors = [akLeft, akBottom]
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object chbMoverArquivosErroImpo: TCheckBox
      Left = 8
      Top = 34
      Width = 178
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'Mover arquivos com erro - Impo'
      TabOrder = 9
    end
    object chbMoverArquivosErroExpo: TCheckBox
      Left = 192
      Top = 34
      Width = 178
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'Mover arquivos com erro - Expo'
      TabOrder = 10
    end
  end
  object tmrIntegracao: TTimer
    OnTimer = tmrIntegracaoTimer
    Left = 32
    Top = 56
  end
  object IdFTP1: TIdFTP
    IOHandler = dmdBroker.IdSSLIOHandlerSocketOpenSSL1
    IPVersion = Id_IPv4
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 24
    Top = 120
  end
end
